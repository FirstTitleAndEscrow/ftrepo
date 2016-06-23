<!---Passing in a parameter called "AR" ---->
<!---If AR = 1 then it will send the user to the AR Screen--->

<!---Companies who owe money--->
<CFQUERY datasource="#request.dsn#" NAME= "read_companies" >
	SELECT  Companies.ID,Companies.company
    FROM    Companies RIGHT OUTER JOIN
            Billing ON Companies.ID = Billing.Billing_Company_ID
    GROUP BY Companies.ID, Companies.company
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<script language="JavaScript" src="calendar2.js"></script>
<title>Company List</title>
</head>

<body>

<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
		<td colspan=2 >
			<FONT FACE=ARIAL SIZE=2 >
			<CFIF #url.AR# eq "1" >
                <CENTER><B>Accounts Receivable</CENTER>
            <CFELSE>
                <CENTER><B>Payments by Client</CENTER>
            </CFIF>
		</TD>
	</TR>
<CFIF #url.AR# eq "1" >  
    <CFFORM NAME="frm" ACTION="./Payments_accounts_receivable.cfm?uid=#url.uid#" METHOD=POST>
    <tr>
		<td bgcolor=d3d3d3 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			<CENTER><b>Clients with outstanding balances</b></CENTER>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 align=left valign=top>
			<center>
			<SELECT NAME="company_id"			
				size="7" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e1e1e1; 
				border-color: e1e1e1; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; 
				float: none;" 
				rows="5" 
				cols="45" 
				
				>
				<OPTION VALUE="All">All</OPTION>
					<CFOUTPUT QUERY="read_companies">
				<OPTION VALUE="#ID#">#Company#</OPTION>
					</CFOUTPUT>			
			</SELECT></center>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
			<INPUT TYPE=image src="./images/button_proceed.gif" border=0> 	
		</td>
	</tr>
    </CFFORM>
<CFELSE>
    <CFFORM NAME="frm" ACTION="./Payments_check.cfm?uid=#url.uid#" METHOD=POST>
    <tr>
		<td bgcolor=d3d3d3 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			<CENTER><b>Clients with outstanding balances</b></CENTER>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 align=left valign=top>
			<center>
			<SELECT NAME="company_id"			
				size="7" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e1e1e1; 
				border-color: e1e1e1; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; 
				float: none;" 
				rows="5" 
				cols="45" 
				
				>
				
					<CFOUTPUT QUERY="read_companies">
				<OPTION VALUE="#ID#">#Company#</OPTION>
					</CFOUTPUT>			
			</SELECT></center>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
			<INPUT TYPE=image src="./images/button_proceed.gif" border=0> 	
		</td>
	</tr>
    </CFFORM>
</CFIF>
</table>
</body>
</html>

