<CFQUERY datasource="#request.dsn#" NAME="read_administrators">
	SELECT *
	FROM First_Admin where status=1
	ORDER BY lname ASC, fname ASC
</CFQUERY>

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
		<font size=2 color=blue face=arial><B>Modify User</B><font size=2 color=black face=arial>
			<p>
			Select a company from the list below.&nbsp;&nbsp;Then click the next button.&nbsp;&nbsp;After that, you will be able to select a User to Modify for that company.
		</td>
	</tr>
</CFOUTPUT>	

</table>

		</td>
	</tr>

<!--- ===/ Client Users Section \=== --->

	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			


<CFOUTPUT>
	<FORM METHOD=POST ACTION="./user_modify_pick_user.cfm?uid=#URL.uid#&al=#URL.al#">
</CFOUTPUT>



<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>		
		
		<td width=497 align=center valign=top bgcolor=e1e1e1>	
			<img src="./images/clear.gif" height=10 width=85>	
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
			><CFINCLUDE TEMPLATE="./includes/companies.cfm">
			<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
			</SELECT>		
		</td>
	</tr>

	<tr>		
		
		<td width=497 align=right valign=top bgcolor=e1e1e1>	
			<NOBR><input type=image src="./images/button_next.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
		</td>
	</tr>




</table>	
</FORM>
	</td>
</tr>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	SELECT  *
	FROM	First_Admin 
	where id = #url.uid#
</CFQUERY>
<!----The only people whe get this page are Steve, Pam, Gary, Heidi, or Harry--->
<CFIF #read_user.role_id# eq 25 OR #read_user.role_id# eq 32 OR #read_user.role_id# eq 26 or #read_user.id# eq 187 or #read_user.id# eq 56 or #read_user.id# eq 248 or #read_user.id# eq 472 or #read_user.id# eq 340>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			<FONT SIZE=2 COLOR=red FACE=VERDANA>
			<B>Site Administrators Section</B>
			<p>
			


<CFOUTPUT>
	<FORM METHOD=POST ACTION="./user_admin_modify_user.cfm?uid=#URL.uid#&al=#URL.al#">
</CFOUTPUT>



<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>		
		
		<td width=497 align=center valign=top bgcolor=e1e1e1>	
			<img src="./images/clear.gif" height=10 width=85>	
		</td>
	</tr>		

	<tr>		
		
		<td width=497  align=right valign=top bgcolor=e1e1e1>	
			<SELECT NAME="user_id" 			
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
			><CFOUTPUT QUERY="read_administrators"><OPTION VALUE="#ID#">#lname#, #fname#</OPTION></CFOUTPUT>			
			</SELECT>		
		</td>
	</tr>

	<tr>		
		
		<td width=497 align=right valign=top bgcolor=e1e1e1>	
			<NOBR><input type=image src="./images/button_next.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
		</td>
	</tr>




</table>	
</FORM>
	</td>
</tr>
</cfif>




</table>	

	</td>
</tr>
</table>


</BODY>
</HTML>



	
	