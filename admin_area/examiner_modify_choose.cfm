
	
	




		<CFQUERY datasource="#request.dsn#" NAME="read_Examiners">
		
			SELECT *
			FROM Examiner 
			WHERE Examiner_ID = #Examiner_ID#
		
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
			<font size=2 color=green face=arial><B>Modify Examiner </B>
			<p>
			Select an option for modifying this Examiner
		</td>
	</tr>
</CFOUTPUT>	

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>

<CFOUTPUT>
	<tr>		
		
		<td width=498 align=right valign=top bgcolor=e6e6e6>	
			<img src="./images/clear.gif" height=10 width=85>
					
		
		</td>
	</tr>

	<tr>		

		<td width=498 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=black face=arial>
		To Modify this users settings, choose an option below :<p>
		<CENTER>
		<b>#read_Examiners.company#</b> &nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<b>#read_Examiners.fname#  #read_Examiners.lname#</b>&nbsp;]
		<p></CENTER>
		<CENTER><NOBR>
		<a href="Examiner_modify_states_view.cfm?uid=#URL.uid#&al=#URL.al#&Examiner_ID=#Examiner_ID#">State(s) Served</a> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="Examiner_modify_countys_view.cfm?uid=#URL.uid#&al=#URL.al#&Examiner_ID=#Examiner_ID#">County(s) Served</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="Examiner_modify_view.cfm?uid=#URL.uid#&al=#URL.al#&Examiner_ID=#Examiner_ID#">Abstractor Info</a></NOBR></CENTER>		
		</td>
	</tr>

</CFOUTPUT>
	
</table>
		
		</td>		

		

	</tr>
</table>
		
	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			



	</td>
</tr>
</table>	

	</td>
</tr>
</table>


</BODY>
</HTML>

