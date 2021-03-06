<CFPARAM NAME="company_id" DEFAULT="All">

<CFIF #company_ID# eq "All">
    <CFQUERY datasource="#request.dsn#" NAME="read_billing">
      SELECT     dbo.Billing.Billing_Order_ID, dbo.Billing.Billing_Type, dbo.Billing.Billing_Company_ID, dbo.Billing.Billing_Borrower, dbo.Billing.Billing_Order_Date, 
                 dbo.Billing_Detail.Billing_Description, dbo.Billing_Detail.Billing_Charge
      FROM       dbo.Billing INNER JOIN
                 dbo.Billing_Detail ON dbo.Billing.Billing_Order_ID = dbo.Billing_Detail.Billing_Order_ID AND dbo.Billing.Billing_Type = dbo.Billing_Detail.Billing_Type      
    </CFQUERY>
<CFELSE>
   <CFQUERY datasource="#request.dsn#" NAME="read_billing">
      SELECT     dbo.Billing.Billing_Order_ID, dbo.Billing.Billing_Type, dbo.Billing.Billing_Company_ID, dbo.Billing.Billing_Borrower, dbo.Billing.Billing_Order_Date, 
                 dbo.Billing_Detail.Billing_Description, dbo.Billing_Detail.Billing_Charge
      FROM       dbo.Billing INNER JOIN
                 dbo.Billing_Detail ON dbo.Billing.Billing_Order_ID = dbo.Billing_Detail.Billing_Order_ID AND dbo.Billing.Billing_Type = dbo.Billing_Detail.Billing_Type
      Where      dbo.Billing.Billing_Company_ID = #company_ID#                                       
    </CFQUERY>
</CFIF>        
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/vbscript">
Function put() 
document payment_type = 50
End Function

</script>
<title>Payments</title>
</head>
<body>
<table width="893" cellpadding=1 cellspacing=1 border=0 bgcolor=white></table> 
<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
    <TR>
        <td>
            <B>Order Number</B>
        </td>
        <td>
            <B>Borrower Name</B>
        </td>
        <td>
            <B>Order Date</B>
        </td>
        <td>
            <B>Description</B>
        </td>
        <td>
            <B>Charge</B>
        <td>
        <td>
            <B>Type</B>
        </td>
        <!---<td>
            <B>payment<br>Amount</B>
        </td>--->
        <td>
            <B>Submit</B>
        </td>
    </tr>
<CFOUTPUT QUERY="read_billing" StartRow= 1 MAXROWS= 10000>
    <tr>    
        <td>
            #Billing_Type#-#Billing_Order_ID#
        </td>
        <td>
            #Billing_Borrower#
        </td>
        <td>
            #Dateformat(Billing_Order_date,"mm/dd/yyyy")#
        </td>
        <td>
            #Billing_description#
        </td>
        <td>
            #dollarformat(Billing_charge)#
        </td>
        <td>
            <select name="payment_type" onchange="put()"
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
        <td>
            <INPUT TYPE="Text" NAME="payment_amount" SIZE=12 MAXLENGTH=15 
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
        <td>
            <img src="./images/button_submit.gif" border=0 ALT="submit">
        </td>
    </tr>
</CFOUTPUT>




<tr>
</tr>
</table> 
</body>
</html>
         