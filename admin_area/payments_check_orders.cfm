<!---Get Check Info ---->
<CFQUERY datasource="#request.dsn#" NAME="read_checks">
Select * 
from Checks 
where Checks_ID = #URL.ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_company">
Select * 
from Companies
where ID = #read_Checks.company_id#
</CFQUERY>

<CFSET Total_Payment = 0>

<CFQUERY datasource="#request.dsn#" NAME="read_Total_Payment">
    SELECT     SUM(Checks_Detail_Payment) AS Total_Payment
    FROM       Checks_Detail
    GROUP BY Checks_ID
    HAVING      (Checks_ID = #read_checks.Checks_ID#)
</CFQUERY>

<CFOUTPUT>
<CFIF #Read_Total_Payment.RecordCount# gte 1>
    <CFSET Total_Payment = #read_total_payment.Total_Payment#>
</CFIF>    


<cfset Payment = 0>
<CFSET Payment = #read_checks.checks_amount# - #Total_Payment#> 
</CFOUTPUT>

<CFQUERY datasource="#request.dsn#" NAME="read_billing_detail">
    SELECT      Billing_Detail.Billing_Order_ID, Billing_Detail.Billing_Type, 
                Billing_Detail.Billing_Description, Billing.Billing_Borrower,
                Billing_Detail.Billing_Charge,Billing.Billing_Order_Date,
                Billing_Detail.Billing_Detail_ID
    FROM        Billing_Detail INNER JOIN
                Billing ON Billing_Detail.Billing_Order_ID = Billing.Billing_Order_ID AND 
                Billing_Detail.Billing_Type = Billing.Billing_Type
    WHERE       (Billing.Billing_Company_ID = #read_Checks.company_id#)
    ORDER BY Billing_Detail.Billing_Type, Billing_Detail.Billing_Order_ID
</CFQUERY>
  


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Untitled</title>
</head>
<body>
<table>
<cfoutput>
<tr>
    <td>
        <Center>You have #dollarformat(Payment)# to distribute.</Center>
    </td>
</tr>
<tr>
    <td>
        <b>Outstanding Orders for #read_company.company#</b>        
    </td>      
</tr>
</CFOUTPUT>
    <tr colspan="6">
        <td align="center">
            <B>Order Number</B>
        </td>
        <td align="center">
            <B>Borrower Name</B>
        </td>
        <td align="center">
            <B>Order Date</B>
        </td>
        <td align="center">
            <B>Description</B>
        </td>
        <td align="center">
            <B>Charge</B>
        <td>
        <td align="center">
            <B>Submit</B>
        </td>
    </tr>
    <CFOUTPUT QUERY="read_billing_detail" StartRow= 1 MAXROWS= 10000>
    <!---Do not show paid orders.
    We need the Billing Detail ID
    --->
    <CFSET SumChecksDetail = 0>
    
    <CFQUERY datasource="#request.dsn#" NAME="read_paid">
        SELECT     SUM(Checks_Detail_Payment) AS Total_Payment
        FROM       Checks_Detail
        GROUP BY    Billing_Detail_ID
        HAVING      (Billing_Detail_ID = #read_billing_detail.Billing_Detail_ID#)
    </CFQUERY>
    
    <CFIF #read_paid.recordcount# gte "1" >
        <CFSET SumChecksDetail = #read_paid.Total_Payment#>
    </CFIF>
    
    <CFSET ChargePaid = #read_billing_detail.Billing_Charge# - #SumChecksDetail#>
    
    <CFIF ChargePaid gt "0" >
        <tr colspan="6">    
            <td align="center">
                #Billing_Type#-#Billing_Order_ID#
            </td>
            <td align="center">
                #Billing_Borrower#
            </td>
            <td align="center">
                #Dateformat(Billing_Order_date,"mm/dd/yyyy")#
            </td>
            <td align="center">
                #Billing_description#
            </td>
            <td align="center">
                #dollarformat(Billing_charge)#
            </td>
            <td align="right">
                <a href="./payments_check_orders_update.cfm?&billing_detail_ID=#read_billing_detail.Billing_Detail_ID#&checks_id=#read_checks.Checks_ID#"><img src="./images/button_submit.gif" border=0 ALT="submit"></a>
            </td>
        </tr>
    </CFIF>        
</CFOUTPUT>
</table>
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       