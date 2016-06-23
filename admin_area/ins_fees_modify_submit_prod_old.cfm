
<CFPARAM NAME="a_from" DEFAULT="">
<CFPARAM NAME="a_from_1" DEFAULT="">
<CFPARAM NAME="a_to" DEFAULT="0">
<CFPARAM NAME="a_to_1" DEFAULT="0">
<CFPARAM NAME="refinance" DEFAULT="">
<CFPARAM NAME="sale" DEFAULT="">

<CFSET a_from_1 = #ReReplace(a_from, ",", "", "ALL")#>
<CFSET a_to_1 = #ReReplace(a_to, ",", "", "ALL")#>
<CFSET refinance_1 = #ReReplace(refinance, ",", "", "ALL")#>
<CFSET sale_1 = #ReReplace(sale, ",", "", "ALL")#>

	<CFQUERY datasource="#request.dsn#" NAME="read_records">
		UPDATE #a_table#
		SET a_from = '#a_from_1#',
		a_to  = #a_to_1#,
		refinance  = '#refinance_1#',
		sale  = '#sale_1#'
		where id = #a_item_id#
	
	</CFQUERY>

		<CFSET st_abbrev = #a_table# & "|" & #a_state_display#>		

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
		
<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=500 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=500 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=500 align=left valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Manage First Title -- Insurance Fees</B>
		</td>
	</tr>

</table>

		</td>
	</tr>

	<tr>
		<td width=500 align=center valign=top bgcolor=white>
			<font size=3 color=blue face=verdana><b>#a_state_display#</b>
			<p>			

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=500 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		The record has been sucessfully MODIFIED. 
		<br><font size=1 color=blue face=verdana> 
		</td>
	</tr>	
	
</table>
		
		</td>		
	</tr>


</CFOUTPUT>




<CFOUTPUT>
	<tr>
		<td width=500 align=center valign=top bgcolor=white>
			

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			From Value 		
		</td>
		<td width=300 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana><b>
			#a_from#</b>	
			</td>		
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			To Value 		
		</td>
		<td width=300 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana><b>
			#a_to#</b>	
			</td>		
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Re-Finance		
		</td>
		<td width=300 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana><b>
			#refinance#</b>	
			</td>		
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			New Home Sale		
		</td>
		<td width=300 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana><b>
			#sale#</b>	
			</td>		
	</tr>

</CFOUTPUT>



	
</table>
		
		</td>		
	</tr>




</table>
		
	

	</td>
</tr>
</table>

</BODY>
</HTML>

