
	<CFPARAM NAME="vendor"     DEFAULT="">
<CFPARAM NAME="a_state"       DEFAULT="">
<CFPARAM NAME="a_trigger"       DEFAULT="">

<cfif #url.al# eq 1 or #url.uid# eq 19>


	<CFSET zip_id_2 = #ListToArray(zip_id, ",")#>
	<CFSET st_abbrv_1 = ArrayNew(1)>
	<CFSET cty_name_1 = ArrayNew(1)>

		<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

				<CFSET st_abbrv_1[MMM] = #st_temp[1]#>
				<CFSET cty_name_1[MMM] = #st_temp[2]#>


		</CFLOOP>


		<CFQUERY datasource="#request.dsn#" NAME="read_Closers">

			SELECT *
			FROM Closer
			WHERE Closer_ID = #Closer_ID#

		</CFQUERY>


		<CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
			<CFQUERY datasource="#request.dsn#">
				DELETE
				FROM Closer_county
				WHERE Closer_ID = #Closer_ID# AND st_abbrev = '#st_abbrv_1[SSS]#' AND
				      ct_name = '#cty_name_1[SSS]#'
			</CFQUERY>
		</CFLOOP>

		<CFQUERY datasource="#request.dsn#" NAME="read_Closers_state_county_list">

			SELECT  Closer_ID, st_abbrev, ct_name
			FROM Closer_county
			WHERE Closer_ID = #Closer_ID#
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
			<font size=2 color=green face=arial><B>Counties were Deleted from Closer County List</B>
		</td>
	</tr>

</table>

		</td>
	</tr>
<tr>
		<td width=499 align=left valign=top bgcolor=e1e1e1>
		<NOBR><a href="https://#cgi.server_name#/admin_area/Closer_modify_view.cfm?uid=#URL.uid#&al=#URL.al#&Closer_ID=#Closer_ID#"><img src="./images/button_return.gif" border=0></a><img src="./images/clear.gif" height=10 width=85></NOBR>

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
		<b>#read_Closers.company#<br>
		#read_Closers.fname# #read_Closers.lname#</b>

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
		This is the current List of Counties Serviced by this Closer.

		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
			<font size=2 color=blue face=arial>
			<CFOUTPUT QUERY="read_Closers_state_county_list">
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

<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_Closers">

			SELECT *
			FROM Closer
			WHERE Closer_ID = #Closer_ID#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_Closers_state_county_list">

			SELECT  Closer_ID, st_abbrev, ct_name
			FROM Closer_county
			WHERE Closer_ID = #Closer_ID#
			ORDER BY st_abbrev ASC, ct_name ASC

		</CFQUERY>

		<CFSET zip_id_2 = #ListToArray(zip_id, ",")#>
	<CFSET st_abbrv_1 = ArrayNew(1)>
	<CFSET cty_name_1 = ArrayNew(1)>

		<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

				<CFSET st_abbrv_1[MMM] = #st_temp[1]#>
				<CFSET cty_name_1[MMM] = #st_temp[2]#>


		</CFLOOP>


<CFQUERY datasource="#request.dsn#" NAME="read">

			SELECT *
			FROM Closer_county
			WHERE Closer_ID = #Closer_ID#
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
			<font size=2 color=green face=arial><B>Email has been sent to the adminstrator to process your request to delete closer(s)</B>
		</td>
	</tr>

</table>

		</td>
	</tr>
<tr>
		<td width=499 align=left valign=top bgcolor=e1e1e1>
		<NOBR><a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1&a_state=#a_state#&vendor=#vendor#"><img src="./images/button_return.gif" border=0></a><img src="./images/clear.gif" height=10 width=85></NOBR>

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
		Delete Counties List for:<p>
		<b>#read_Closers.company#<br>
		#read_Closers.fname# #read_Closers.lname#</b>

		</td>
	</tr>



	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Delete Request</b>
		</td>
	</tr>

	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		You have requested to delete the folloing counties

		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
			<font size=2 color=blue face=arial>
			<CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
		#st_abbrv_1[SSS]#--#cty_name_1[SSS]#,

		</CFLOOP>
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


<CFQUERY datasource="#request.dsn#" NAME="user">

			SELECT  *
			FROM first_admin
			WHERE ID = #session.ft_user_id#


		</CFQUERY>




<CFMAIL
TO="pgibb@firsttitleservices.com,spape@firsttitleservices.com"
FROM="#user.email#" Subject="Closer info change request"
TIMEOUT="600"
type="HTML"
>
<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>

<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>


	<tr>
		<td width=498 align=left valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Before modification</B>
		</td>
	</tr>

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>


<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>



	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=black face=arial>
		The Counties List for:<p>
		<b>#read_Closers.company#<br>
		#read_Closers.fname# #read_Closers.lname#</b>

		</td>
	</tr>



	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Counties Currently Serviced</b>
		</td>
	</tr>

	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		This is the current List of Counties Serviced by this Closer.

		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
			<font size=2 color=blue face=arial>
			<CFloop QUERY="read">
				#st_abbrev# --- #ct_name#<br>
			</CFloop>
		</td>
	</tr>

</table>

	</td>
</tr>
</table>

	</td>
</tr>
</table>


<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>

<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>


	<tr>
		<td width=498 align=left valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Request to delete the following</B>
		</td>
	</tr>

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>


<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>



	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=black face=arial>
		Delete Request for:<p>
		<b>#read_Closers.company#<br>
		#read_Closers.fname# #read_Closers.lname#</b>

		</td>
	</tr>



	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Delete Request</b>
		</td>
	</tr>

	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		This is a request to delete these counties.

		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
			<font size=2 color=blue face=arial>

				<CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
		#st_abbrv_1[SSS]#--#cty_name_1[SSS]#,

		</CFLOOP>


		</td>
	</tr>

</table>

	</td>
</tr>
</table>

	</td>
</tr>
</table>

<table width=498>
<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Click <NOBR><a href="https://#CGI.SERVER_NAME#/admin_area/Closer_modify_countys_delete.cfm?uid=59&al=1&Closer_ID=#Closer_ID#&zip_id=#zip_id#">HERE</a></NOBR>
to allow the modification</B>
		</td>
	</tr>
</table>
</cfmail>
</BODY>
</HTML>
</cfif>