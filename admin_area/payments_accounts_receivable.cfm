<CFSET TotalDue = 0>
<CFIF IsDefined("excel") is True>
<cfset excel = 1>
<cfelse>
<cfset excel = 0>
</cfif>

<CFSET filename = "">
<CFIF #company_id# eq "All">
    <CFQUERY datasource="#request.dsn#" NAME="read_company">
        Select * 
        from Companies
    </CFQUERY>
<CFELSE>
    <CFQUERY datasource="#request.dsn#" NAME="read_company">
        Select * 
        from Companies
        where ID = #company_id#
    </CFQUERY>
</CFIF>

<!---This is a group by to get a list of companies for the loop--->
<!---If this view gives no rows it means that at this point noone owes anything
so there should be no accounts receivable--->
<CFIF #company_id# eq "All">
    <CFQUERY datasource="#request.dsn#" NAME="read_billing_company">
        SELECT  Billing.Billing_Company_ID
        FROM    Billing_Detail INNER JOIN
                Billing ON Billing_Detail.Billing_Order_ID = Billing.Billing_Order_ID AND 
                Billing_Detail.Billing_Type = Billing.Billing_Type LEFT OUTER JOIN
                Companies ON Billing.Billing_Company_ID = Companies.ID
                GROUP BY Billing.Billing_Company_ID
    </CFQUERY>
<CFELSE>
    <CFQUERY datasource="#request.dsn#" NAME="read_billing_company">
        SELECT  Billing.Billing_Company_ID
        FROM    Billing_Detail INNER JOIN
                Billing ON Billing_Detail.Billing_Order_ID = Billing.Billing_Order_ID AND 
                Billing_Detail.Billing_Type = Billing.Billing_Type LEFT OUTER JOIN
                Companies ON Billing.Billing_Company_ID = Companies.ID
                GROUP BY Billing.Billing_Company_ID
                HAVING      (Billing.Billing_Company_ID = #company_id#)
    </CFQUERY>
</CFIF>

<cfoutput>
<cfif #excel# EQ 1>  
	<cfset filename = "file.xls">
	
	<cfcontent type="application/msexcel">
<cfheader name="Content-Disposition" value="filename=#filename#">
#filename#

</cfif></cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Accounts Receivable</title>
</head>
<body>
<table width="95%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
   
		  <tr>
        <td colspan="7" ><cfoutput>
          	 <a href="payments_accounts_receivable.cfm?excel=1&company_id=#company_id#"></cfoutput>
<FONT FACE=ARIAL SIZE=3 color="black"><b>Export to Excel</b></font> 
</a>         
        </td>      
    </tr> 

	 
	 
	  <tr>
        <td colspan="7" >
            <FONT FACE=ARIAL SIZE=4 color="black"><center><b>Accounts Receivable</b></center></font>        
        </td>      
    </tr>
<CFIF #read_billing_company.recordcount# gte "1">
    <CFLOOP QUERY="read_billing_company">
        <CFQUERY datasource="#request.dsn#" NAME="read_billing_detail">
            SELECT      Billing_Detail.Billing_Order_ID, Billing_Detail.Billing_Type, Billing_Detail.Billing_Description, 
                        Billing.Billing_Borrower, Billing_Detail.Billing_Charge, Billing.Billing_Order_Date, Billing_Detail.Billing_Detail_ID, 
                        Companies.company,Companies.ID
            FROM        Billing_Detail INNER JOIN
                        Billing ON Billing_Detail.Billing_Order_ID = Billing.Billing_Order_ID AND 
                        Billing_Detail.Billing_Type = Billing.Billing_Type LEFT OUTER JOIN
                        Companies ON Billing.Billing_Company_ID = Companies.ID
            WHERE       (Billing.Billing_Company_ID = #read_billing_company.billing_company_id#)
                        ORDER BY Billing_Detail.Billing_Type, Billing_Detail.Billing_Order_ID
        </CFQUERY>
        <tr>
            <td colspan = "7">
                <b><CFOUTPUT>#read_billing_detail.company#</CFOUTPUT></b>        
            </td>      
        </tr>
        <tr>
            <td align=left valign=top>
                <B>Order Number</B>
            </td>
            <td align=left valign=top>
                <B>Address</B>
            </td>
            <td align=left valign=top>
                <B>County</B>
            </td>						
            <td align=left valign=top>
                <B>Borrower Name</B>
            </td>
            <td align=left valign=top>
                <B>Order Date</B>
            </td>
            <td align=left valign=top>
                <B>Description</B>
            </td>
            <td align=left valign=top>
                <B>Charge</B>
            </td>
            <td align=left valign=top>
                <B>Paid</B>
            </td>
            <td align=left valign=top>
                <B>Balance</B>
            </td>
        </tr> 
        <CFOUTPUT QUERY="read_billing_detail" StartRow= 1 MAXROWS= 10000>
            <CFSET SumChecksDetail = 0>
            
            <CFQUERY datasource="#request.dsn#" NAME="read_paid">
                SELECT     SUM(Checks_Detail_Payment) AS Total_Payment
                FROM       Checks_Detail
                GROUP BY    Billing_Detail_ID
                HAVING      (Billing_Detail_ID = #read_billing_detail.Billing_Detail_ID#)
            </CFQUERY>
			<cfquery datasource="#request.dsn#" name="read_Address_County">
			SELECT paddress, pcity, pstate, pzip, pcounty
			FROM property P, Billing_Detail B
			WHERE P.prop_ID = #Billing_Order_ID# AND  B.Billing_Order_ID = #Billing_Order_ID#
			</cfquery>
    
            <CFIF #read_paid.recordcount# gte "1" >
                <CFSET SumChecksDetail = #read_paid.Total_Payment#>
            </CFIF>
    
            <CFSET ChargePaid = #read_billing_detail.Billing_Charge# - #SumChecksDetail#>
    
            <CFIF ChargePaid gt "0" >
                <tr>    
                    <td align=left valign=top>
                        #Billing_Type#-#Billing_Order_ID#
                    </td>
                    <td align=left valign=top>
                        #read_Address_County.paddress#, #read_Address_County.pcity#, #read_Address_County.pstate#, #read_Address_County.pzip#
                    </td>
                    <td align=left valign=top>
                        #read_Address_County.pcounty#
                    </td>										
                    <td align=left valign=top>
                        #Billing_Borrower#
                    </td>
                    <td align=left valign=top>
                        #Dateformat(Billing_Order_date,"mm/dd/yyyy")#
                    </td>
                    <td align=left valign=top>
                        #Billing_description#
                    </td>
                    <td align=left valign=top>
                        #dollarformat(Billing_charge)#
                    </td>
                    <td align=left valign=top>
                        #dollarformat(SumChecksDetail)#
                    </td>
                    <td align=left valign=top>
                        #dollarformat(ChargePaid)#
                    </td>
                </tr>
                <CFSET TotalDue = #TotalDue# + #ChargePaid#>
            </CFIF> 
        </CFOUTPUT>
        <tr>
            <td colspan="7" Align="right">
                <B>Total Due is <cfoutput>#DollarFormat(TotalDue)#</Cfoutput></B>
            </td>
        </tr>
        <CFSET TotalDue = 0>
    </CFLOOP>
<CFELSE>
    <tr>
        <td colspan="7" align="center">There are no outstanding balances at this time.</td>
    </tr>        
</CFIF>
</table>
</body>
</html>
