<CFQUERY datasource="#request.dsn#" NAME="read_billing">
    SELECT     Billing_Detail.Billing_Order_ID, Billing_Detail.Billing_Type, Billing_Detail.Billing_Description, 
               Billing_Detail.Billing_Charge, Billing.Billing_Borrower, Billing.Billing_Order_Date, Billing_Detail.Billing_Detail_ID, 
               Companies.company
    FROM       Billing_Detail INNER JOIN
               Billing ON Billing_Detail.Billing_Order_ID = Billing.Billing_Order_ID AND 
               Billing_Detail.Billing_Type = Billing.Billing_Type LEFT OUTER JOIN
               Companies ON Billing.Billing_Company_ID = Companies.ID
    WHERE     (Billing.Billing_Company_ID = 100) AND (Billing_Detail.Billing_Detail_ID = #billing_detail_ID#)
    ORDER BY Billing_Detail.Billing_Type, Billing_Detail.Billing_Order_ID
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_check">
    Select * 
    from Checks
    where Checks_ID = #checks_id#
</CFQUERY>  

<CFSET Total_Payment = 0>

<CFQUERY datasource="#request.dsn#" NAME="read_Total_Payment">
    SELECT     SUM(Checks_Detail_Payment) AS Total_Payment
    FROM       Checks_Detail
    GROUP BY Checks_ID
    HAVING      (Checks_ID = #read_check.Checks_ID#)
</CFQUERY>

<CFOUTPUT>
<CFIF #Read_Total_Payment.RecordCount# gte 1>
    <CFSET Total_Payment = #read_total_payment.Total_Payment#>
</CFIF>    


<cfset Payment = 0>
<CFSET Payment = #read_check.checks_amount# - #Total_Payment#> 
</CFOUTPUT>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Untitled</title>
</head>
<body>
<table>
<cfoutput>
<tr>
    <td colspan="2">Amount left on Check #read_check.checks_number# #dollarformat(Payment)#</td>
    
</tr>
<tr>
    <td>Order Number</td>
    <td>#read_billing.Billing_Type#-#read_billing.Billing_Order_ID#</td>
</tr>
<tr>
    <td>Company Name</td>
    <td>#read_billing.company#</td>
</tr>
<tr>      
    <td>Borrower Name</td>
    <td>#read_billing.Billing_Borrower#</td>
</tr>
<tr>
    <td>Order Date</td>
    <td>#dateformat(read_billing.Billing_Order_date,"mm/dd/yyyy")#</td>
</tr>  
<tr>
    <td>Description</td>
    <td>#read_billing.Billing_Description#</td>
</tr>                        
<tr>
    <td>Charge</td>
    <td>#dollarformat(read_billing.Billing_Charge)#</td>
</tr>
</CFOUTPUT>
<CFFORM NAME="frm" ACTION="./Payments_check_update_action.cfm" METHOD=POST> 
<tr>
    <td>Type of Payment</td>
    <td> 
        <select name="payment_type" <!---onchange="put()"--->
		        size="1" 
			    style="font-size: 9; 
			    font-family: verdana; 
			    font-style: normal; 
			    color: 003F1E; 
			    background-color: E4E3E3; 
			    border-color: white; 
			    border-left-width: thin; 
			    border-right-width: thin; 
			    border-top-width: thin; 
			    border-bottom-width: thin; 
			    border-width: thin; 
			    border-style: bar; 
		        clear: none; 
			    float: none;" 
			    rows="3" 
			    cols="45" 
			    >
			    <OPTION VALUE="">Select</OPTION>											
			    <OPTION VALUE="Paid">Paid</OPTION>
			    <OPTION VALUE="Not Paid" >Not Paid</OPTION>
			    <OPTION VALUE="Partial" >Partial</OPTION>
        </select>
    </td>
    <tr>
        <td>Payment Amount</td>
        <td><INPUT TYPE="Text" NAME="checks_detail_payment" SIZE=12 MAXLENGTH=15 
			    style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: 003F1E; 
				background-color: E4E3E3; 
				border-color: white; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none;" > 
        </td>                
    </tr>
    <tr>
        <td>
            <input type=image src="./images/button_next.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
        </td>
    </tr>
    <INPUT TYPE=HIDDEN NAME="Checks_id"   VALUE="<CFOUTPUT>#read_check.Checks_ID#</CFOUTPUT>">
    <INPUT TYPE=HIDDEN NAME="Billing_Detail_ID"   VALUE="<CFOUTPUT>#read_billing.Billing_Detail_ID#</CFOUTPUT>">         
</cfform>                 
</table>
</body>
</html>
