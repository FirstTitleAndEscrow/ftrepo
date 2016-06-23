<!---Read company --->
<CFQUERY datasource="#request.dsn#" NAME="read_company">
    Select * from Companies 
    where id = #company_ID#
</CFQUERY> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Checks Screen</title>
</head>
<body>
<table>
<CFFORM NAME="frm" ACTION="./Payments_check_update.cfm?uid=#url.uid#" METHOD=POST>
<tr>
    <td>
        Please enter check number for <CFOUTPUT>#read_company.company#</CFOUTPUT>
    </td>
</tr>
<tr>
    <td>
        <INPUT TYPE="Text" NAME="checks_number" SIZE=12 MAXLENGTH=15 
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
        Please enter the check amount
    </td>        
</tr>
<tr>
    <td> 
        <INPUT TYPE="Text" NAME="checks_amount" SIZE=12 MAXLENGTH=15 
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
    <INPUT TYPE=HIDDEN NAME="company_id"   VALUE="<CFOUTPUT>#read_company.ID#</CFOUTPUT>">
    <tr>
    <td>
    <input type=image src="./images/button_next.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
    </td>
    </tr>
</CFForm>
</table>
</body>
</html>
