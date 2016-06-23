
	
	




	<CFSET zip_id_2 = #ListToArray(zip_id, ",")#>
	<CFSET st_abbrv_1 = ArrayNew(1)>
	<CFSET cty_name_1 = ArrayNew(1)>
	
		<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

				<CFSET st_abbrv_1[MMM] = #st_temp[1]#>
				<CFSET cty_name_1[MMM] = #st_temp[2]#>		
		
		
		</CFLOOP>
	
	
		<CFQUERY datasource="#request.dsn#" NAME="read_Appraisers">
		
			SELECT *
			FROM Appraisers 
			WHERE Appraiser_ID = #Appraiser_ID#
		
		</CFQUERY>


		<CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
			<CFQUERY datasource="#request.dsn#">
				DELETE
				FROM Appraisers_county
				WHERE Appraiser_ID = #Appraiser_ID# AND st_abbrev = '#st_abbrv_1[SSS]#' AND
				      ct_name = '#cty_name_1[SSS]#'
			</CFQUERY>
		</CFLOOP>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_Appraisers_state_county_list">
		
			SELECT  Appraiser_ID, st_abbrev, ct_name
			FROM Appraisers_county
			WHERE Appraiser_ID = #Appraiser_ID#
			ORDER BY st_abbrev ASC, ct_name ASC
		
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
		<td width=498 align=left valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Counties were Deleted from Appraisers County List</B>
		</td>
	</tr>

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			

<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>		
		
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>	
			<img src="./images/clear.gif" height=10 width=85>
					
		
		</td>
	</tr>

	<tr>		

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=black face=arial>
		The Counties List for:<p>
		<b>#read_Appraisers.company#<br>
		#read_Appraisers.fname# #read_Appraisers.lname#</b>
	
		</td>
	</tr>
</CFOUTPUT>


	<tr>		

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Counties Currently Serviced</b>
		</td>
	</tr>

	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		This is the current List of Counties Serviced by this Appraiser.  
	
		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
			<font size=2 color=blue face=arial>
			<CFOUTPUT QUERY="read_Appraisers_state_county_list">
				#st_abbrev# --- #ct_name#<br>
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
