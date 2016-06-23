
	
	






		<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		
			SELECT *
			FROM companies
			WHERE ID = #comp_ID#
		
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_users">
		
			SELECT *
			FROM users
			WHERE comp_id = #comp_id#
			ORDER BY lp_fname, lp_lname ASC
		
		</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_officers">
		
			SELECT *
			FROM loan_officers
			WHERE comp_id = #comp_id#
			ORDER BY lo_fname, lo_lname ASC
		
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
			<font size=2 color=blue face=arial><B>Modify Processor/Officer</B><font size=2 color=black face=arial>
			<p>
			<p>
			Company - <B>#read_companies.company#</B>
			<p>
			Pick a Processor/Officer to Modify, from the list below.
		</td>
	</tr>
</CFOUTPUT>	

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			


<CFOUTPUT>
	<FORM METHOD=POST ACTION="./user_modify_view.cfm?uid=#URL.uid#&al=#URL.al#&comp_id=#comp_id#">
</CFOUTPUT>



<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>		
		
		<td width=497 align=center valign=top bgcolor=e1e1e1>	
			<img src="./images/clear.gif" height=10 width=85>	
		</td>
	</tr>		

	<tr>		
		
		<td width=497  align=center valign=top bgcolor=e1e1e1>	
			Select Processor to modify <SELECT NAME="user_id" 			
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
			><CFOUTPUT QUERY="read_users"><OPTION VALUE="#ID#">#lp_fname# #lp_lname#</OPTION></CFOUTPUT>			
			</SELECT>		
		</td>
	</tr>

		
	
	
	<tr>		
		
		<td width=497 align=center valign=top bgcolor=e1e1e1>	
			<NOBR><input type=image src="./images/button_next.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
		</td>
	</tr>


	
	

</table>	
</FORM>




	<CFOUTPUT>
	<FORM METHOD=POST ACTION="./loan_officer_modify_view.cfm?uid=#URL.uid#&al=#URL.al#&comp_id=#comp_id#">
</CFOUTPUT>



<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>		
		
		<td width=497 align=center valign=top bgcolor=e1e1e1>	
			<img src="./images/clear.gif" height=10 width=85>	
		</td>
	</tr>
	
	<tr>		
		
		<td width=497  align=center valign=top bgcolor=e1e1e1>	
		Select Loan Officer to modify <SELECT NAME="proc_id" 			
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
			><CFOUTPUT QUERY="read_officers"><OPTION VALUE="#ID#">#lo_fname# #lo_lname#</OPTION></CFOUTPUT>			
			</SELECT>		
		</td>
	</tr>
	
	<tr>		
		
		<td width=497 align=center valign=top bgcolor=e1e1e1>	
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



	