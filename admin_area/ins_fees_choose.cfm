<CFQUERY datasource="#request.dsn#" NAME="tables">	
select NAME from SYSOBJECTS 
where TYPE = 'U'
and (NAME LIKE 'X_%' or NAME LIKE 'State%')
order by NAME 
</CFQUERY>



		

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=490 align=center valign=top>
		
<table width=489 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=489 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=489 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=489 align=left valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Manage First Title -- Insurance Fees</B>
		</td>
	</tr>

</table>

		</td>
	</tr>

	<tr>
		<td width=489 align=center valign=top bgcolor=white>
			

<table width=489 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=489 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		Use the pulldown to first select a State to view. 
		<br><font size=1 color=blue face=verdana> 
		</td>
	</tr>	
	
</table>
		
		</td>		
	</tr>


<FORM METHOD=POST ACTION="./ins_fees_view.cfm?uid=#URL.uid#&al=#URL.al#">

</CFOUTPUT>
	<tr>
		<td width=489 align=center valign=top bgcolor=white>
			

<table width=489 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=489 align=center valign=top bgcolor=f1f1f1>
			<SELECT NAME="st_abbrev" 		
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
<cfoutput query="tables">
<option value="#name#">#name#</option>
</cfoutput>

			</SELECT>
		</td>
		
	</tr>	


		<tr>
			<td width=489  align=right valign=top bgcolor=f1f1f1>
				<input type=submit value="select">	
				</td>		
	</tr>


</table>

		</td>
	</tr>


</table>
		
	<tr>
		<td width=489 align=center valign=top bgcolor=white>
			



	</td>
</tr>
</table>	

	</td>
</tr>
</table>

</BODY>
</HTML>

