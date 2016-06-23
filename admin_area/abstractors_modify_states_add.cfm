
	
	



	<CFSET zip_id_1 = #ListToArray(zip_id, ",")#>
	
	


		<CFQUERY datasource="#request.dsn#" NAME="read_abstractors">
		
			SELECT *
			FROM Abstractors 
			WHERE Abstractor_ID = #Abstractor_ID#
		
		</CFQUERY>


		<CFLOOP FROM="1" TO="#ArrayLen(zip_id_1)#" INDEX="SSS">
			<CFQUERY datasource="#request.dsn#">
				INSERT INTO Abstractors_states(Abstractor_ID, st_abbrev)
				VALUES(#Abstractor_ID#, '#zip_id_1[SSS]#')
			</CFQUERY>
		</CFLOOP>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_abstractors_states_list">
		
			SELECT st_id, Abstractor_ID, st_abbrev
			FROM Abstractors_states
			WHERE Abstractor_ID = #Abstractor_ID#
			ORDER BY st_abbrev ASC
		
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
			<font size=2 color=green face=arial><B>States were added to Abstractors States List</B>
		</td>
	</tr>

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=left valign=top bgcolor=e1e1e1>
		<NOBR><a href="javascript:history.go(-1)"><img src="./images/button_return.gif" border=0></a><img src="./images/clear.gif" height=10 width=85></NOBR>	

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=e1e1e1>
			

<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>		
		
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>	
			<img src="./images/clear.gif" height=10 width=85>
					
		
		</td>
	</tr>

	<tr>		

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=black face=arial>
		The States List for:<p>
		<b>#read_abstractors.company#<br>
		#read_abstractors.fname# #read_abstractors.lname#</b>
	
		</td>
	</tr>
</CFOUTPUT>


	<tr>		

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>States Currently Serviced</b>
		</td>
	</tr>

	<tr>
		<td width=448 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		This is the current List of States Serviced by this Abstractor.  
	
		</td>

		<td width=50 align=left valign=top bgcolor=f1f1f1>
			<font size=2 color=blue face=arial>
			<CFOUTPUT QUERY="read_abstractors_states_list">
				#st_abbrev#<br>
			</CFOUTPUT>
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


