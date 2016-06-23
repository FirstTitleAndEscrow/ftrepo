

	<CFQUERY datasource="#request.dsn#" NAME="read_records">
		SELECT *
		FROM #a_table#
		where id = #a_item_id#
	
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
		You can modify any of the items shown below. 
		<br><font size=1 color=blue face=verdana> 
		</td>
	</tr>	
	
</table>
		
		</td>		
	</tr>



<FORM METHOD=POST ACTION="./ins_fees_modify_submit.cfm?a_item_id=#a_item_id#&a_table=#a_table#&a_state_display=#a_state_display#&uid=#URL.uid#&al=#URL.al#">

</CFOUTPUT>




<CFOUTPUT QUERY="read_records">
	<tr>
		<td width=500 align=center valign=top bgcolor=white>
			

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			From Value 		
		</td>
		<td width=300 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="a_from" VALUE="#a_from#" size=15 maxlength=50
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
				clear: none; ">	
			</td>		
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			To Value 		
		</td>
		<td width=300 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="a_to" VALUE="#a_to#" size=15 maxlength=50
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
				clear: none; ">	
			</td>		
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Re-Finance		
		</td>
		<td width=300 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="refinance" VALUE="#refinance#" size=15 maxlength=50
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
				clear: none; ">	
			</td>		
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			New Home Sale		
		</td>
		<td width=300 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="sale" VALUE="#sale#" size=15 maxlength=50
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
				clear: none; ">	
			</td>		
	</tr>

</CFOUTPUT>

	<tr>
		<td width=500 colspan=2 align=right valign=top bgcolor=f1f1f1>
			<input type=submit value="modify">	
			</td>		
	</tr>

	
</table>
		
		</td>		
	</tr>



</FORM>






</table>
		
	

	</td>
</tr>
</table>

</BODY>
</HTML>

