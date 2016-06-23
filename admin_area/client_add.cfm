<!----Harry 08/10/2004--->
<!---Check uid to see if user is an outside sales person--->



<!---
<cfif #url.uid# eq "92"> <!---Noone--->
	<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		SELECT *
		FROM companies where status = 2
		ORDER BY company ASC
	</CFQUERY>
<cfelseif #url.uid# eq "93"><!---Cindy Mills--->
	<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		SELECT *
		FROM companies where status = 3
		ORDER BY company ASC
	</CFQUERY>

<cfelseif #url.uid# eq "167"><!---Nita Farrow--->
	<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		SELECT *
		FROM companies where status = 4
		ORDER BY company ASC
	</CFQUERY>

<cfelseif #url.uid# eq "185"><!---Cindy Miropol--->
	<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		SELECT *
		FROM companies where status = 5
		ORDER BY company ASC
	</CFQUERY>
<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		SELECT *
		FROM companies
		ORDER BY company ASC
	</CFQUERY>
</cfif>
--->
<CFINCLUDE TEMPLATE="./includes/companies.cfm">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>
</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
			<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<tr>
					<td width=499 align=center valign=top bgcolor=e2e2e2>
						<FONT SIZE=2 color=black face=arial>
							<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<CFOUTPUT>
								<tr>
									<td width=498 align=center valign=top bgcolor=white>
										<font size=2 color=black face=arial>Add Mortgage Client/Customer
									</td>
								</tr>
</CFOUTPUT>	
							</table>
					</td>
				</tr>
				<tr>
					<td width=499 align=center valign=top bgcolor=white>
						<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<CFOUTPUT>
<FORM METHOD=POST ACTION="./client_add_review.cfm?uid=#URL.uid#&al=#URL.al#">
</CFOUTPUT>
							<tr>		
								<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
									<img src="./images/clear.gif" height=10 width=85>
								</td>
							</tr>
							<tr>		
								<td width=130 align=right valign=top bgcolor=e6e6e6>	
									<font size=2 color=black face=arial>
									Company Name
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>	
									<input type=text name="company" VALUE="" size=25 maxlength=200
									size="1" 
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: blue; 
									background-color: e6e6e6; 
									border-color: e6e6e6; 
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
							</tr>	
							<tr>		
								<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
									<NOBR><input type=image src="./images/button_review.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
								</td>
							</tr>
						</table>
</FORM>		
					</td>		
				</tr>
			</table>
		<tr>
			<td width=499 align=center valign=top bgcolor=white>
				<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
					<tr>		
						<td width=497 align=center valign=top bgcolor=e1e1e1>	
							<img src="./images/clear.gif" height=10 width=85>
							<font size=1 color=red face=arial>
							Review the list below to ensure the client isn't already in the Database
						</td>
					</tr>		
					<tr>		
						<td width=497  align=right valign=top bgcolor=e1e1e1>	
<FORM>
							<SELECT NAME="a" MULTIPLE			
								size="4" 
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
					 <CFINCLUDE TEMPLATE="./includes/companies.cfm"> 
							<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#company#">#Company#</OPTION></CFOUTPUT>			
							</SELECT>
</FORM>		
					</td>
				</tr>
	<!--- --->	
	<tr>		
						<td width=497 align=center valign=top bgcolor=e1e1e1>	
							<!---<img src="./images/clear.gif" height=10 width=85>--->
							<font size=1 color=red face=arial>
							Please choose inactive company from the list and click submit to make it active
						</td>
					</tr>		
				
				<tr>		
						<td width=497  align=right valign=top bgcolor=e1e1e1>	
<CFFORM method="post" action="client_reinstate.cfm?uid=#URL.uid#&al=#URL.al#">
							<SELECT NAME="id" <!--- MULTIPLE	 --->		
								size="4" 
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

							 <CFINCLUDE TEMPLATE="./includes/companies.cfm"> 
							 <option value="" selected></option>
							<CFOUTPUT QUERY="read_inactive_companies"><OPTION VALUE="#id#">#company#</OPTION></CFOUTPUT>			
							</SELECT>
							
		<tr>		
		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
			<NOBR>
		
<!--- show submit for user in role --->
<cfif #read_user.role_id# eq "15" or #read_user.role_id# eq "20" 
	or #read_user.role_id# eq "24" or #read_user.role_id# eq "25" 
	or #read_user.role_id# eq "26" or #read_user.role_id# eq "31" 
	or #read_user.role_id# eq "32" > 
		<input type=image src="./images/button_submit.gif" border=0>
		<img src="./images/clear.gif" height=10 width=40></cfif>
</NOBR>

</CFFORM>				
</td>		
</tr>		
						
					</table>	
</td>
</tr>
			</table>	
</td>
</tr>
	</table>
</BODY>
</HTML>


	
	