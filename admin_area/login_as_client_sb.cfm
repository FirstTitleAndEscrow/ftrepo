
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin - Login as Client</TITLE>

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
			<font size=2 color=black face=arial>Log In As Client
		</td>
	</tr>
</CFOUTPUT>	

</table>

		</td>
	</tr>


<CFOUTPUT>
	<!--- <FORM METHOD=POST ACTION="./client_modify_display_dev.cfm?uid=#URL.uid#&al=#URL.al#"> --->
	<FORM METHOD=POST ACTION="../login_as_client_submit.cfm?uid=#URL.uid#&al=#URL.al#">
</CFOUTPUT>


		
	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			

<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>		
		
		<td width=497 align=center valign=top bgcolor=e1e1e1>	
			<img src="./images/clear.gif" height=10 width=85>
			<FONT SIZE=1 color=black face=arial>
			From the list below, Select a Client to Log In.
		
		</td>
	</tr>		

	<tr>		
		
		<td width=497  align=right valign=top bgcolor=e1e1e1>	
			<SELECT NAME="comp_id"			
			size="1" 
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
			<CFQUERY DATASOURCE="#request.dsn#" NAME="read_companies" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
				SELECT *
				FROM companies where 
				id >= 6349
				AND ID <= 6378
				
				ORDER BY COMPANY ASC
				
			</CFQUERY>
			<CFOUTPUT QUERY="read_companies">
			<cfif read_companies.a_status eq 1>
			<OPTION VALUE="#ID#">#Company#</OPTION>
			</cfif>
			</CFOUTPUT>			
			</SELECT>		
		</td>
	</tr>

	<tr>		
		
		<td width=497 align=right valign=top bgcolor=e6e6e6>	
			<NOBR><input type=image src="./images/button_next.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
					
		
		</td>
	</tr>
	
	
</table>


</FORM>	



	</td>
</tr>
</table>	

	</td>
</tr>
</table>


</BODY>
</HTML>
