
	<CFPARAM NAME="vendor"     DEFAULT="">
<CFPARAM NAME="a_state"       DEFAULT="">
<CFPARAM NAME="a_trigger"       DEFAULT="">


<cfif #url.al# eq 1>



	<CFSET zip_id_2 = #ListToArray(zip_id, ",")#>
	<CFSET st_abbrv_1 = ArrayNew(1)>
	<CFSET cty_name_1 = ArrayNew(1)>

		<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

				<CFSET st_abbrv_1[MMM] = #st_temp[1]#>
				<CFSET cty_name_1[MMM] = #st_temp[2]#>


		</CFLOOP>


		<CFQUERY datasource="#request.dsn#" NAME="read_abstractors">

			SELECT *
			FROM Abstractors
			WHERE Abstractor_ID = #Abstractor_ID#

		</CFQUERY>


		<CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
			<CFQUERY datasource="#request.dsn#">
				DELETE
				FROM Abstractors_county
				WHERE Abstractor_ID = #Abstractor_ID# AND st_abbrev = '#st_abbrv_1[SSS]#' AND
				      ct_name = '#cty_name_1[SSS]#'
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#">
				Update Zip_info
				set pref_abstractor1 = 0,
				pref_ab1_count = 0
				WHERE pref_abstractor1 = #Abstractor_ID# AND state = '#st_abbrv_1[SSS]#' AND
				      county = '#cty_name_1[SSS]#'
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#">
				Update Zip_info
				set pref_abstractor2 = 0,
				pref_ab2_count = 0
				WHERE pref_abstractor2 = #Abstractor_ID# AND state = '#st_abbrv_1[SSS]#' AND
				      county = '#cty_name_1[SSS]#'
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#">
				Update Zip_info
				set pref_abstractor3 = 0,
				pref_ab3_count = 0
				WHERE pref_abstractor3 = #Abstractor_ID# AND state = '#st_abbrv_1[SSS]#' AND
				      county = '#cty_name_1[SSS]#'
			</CFQUERY>
		</CFLOOP>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstractors_state_county_list">

			SELECT  Abstractor_ID, st_abbrev, ct_name
			FROM Abstractors_county
			WHERE Abstractor_ID = #Abstractor_ID#
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
			<font size=2 color=green face=arial><B>Counties were Deleted from Deed Prep Vendor's County List</B>
		</td>
	</tr>

</table>

		</td>
	</tr>
<tr>
		<td width=499 align=left colspan = 2 valign=top bgcolor=e1e1e1>
		<NOBR><a href="https://#cgi.server_name#/admin_area/deed_prep_modify_view.cfm?uid=#URL.uid#&al=#URL.al#&Abstractor_ID=#Abstractor_ID#"><img src="./images/button_return.gif" border=0></a><img src="./images/clear.gif" height=10 width=85></NOBR>

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
		<b>#read_abstractors.company#<br>
		#read_abstractors.fname# #read_abstractors.lname#</b>

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
		This is the current List of Counties Serviced by this Abstractor.

		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
			<font size=2 color=blue face=arial>
			<CFOUTPUT QUERY="read_abstractors_state_county_list">
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

<CFQUERY datasource="#request.dsn#" NAME="read_abstractors">

			SELECT *
			FROM abstractors
			WHERE abstractor_ID = #abstractor_ID#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstractors_state_county_list">

			SELECT  abstractor_ID, st_abbrev, ct_name
			FROM abstractors_county
			WHERE abstractor_ID = #abstractor_ID#
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
			FROM abstractors_county
			WHERE abstractor_ID = #abstractor_ID#
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
			<font size=2 color=green face=arial><B>Email has been sent to the adminstrator to process your request to delete abstractor(s)</B>
		</td>
	</tr>

</table>

		</td>
	</tr>
<tr>
		<td width=499 align=left colspan = 2 valign=top bgcolor=e1e1e1>
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
		<b>#read_abstractors.company#<br>
		#read_abstractors.fname# #read_abstractors.lname#</b>

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

			select * from first_admin

			WHERE ID = #session.ft_user_id#


		</CFQUERY>

<CFMAIL
TO="pgibb@firsttitleservices.com;spape@firsttitleservices.com"
FROM="#user.email#" Subject="Deed Prep Vendor info change request"
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
		<b>#read_abstractors.company#<br>
		#read_abstractors.fname# #read_abstractors.lname#</b>

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
		This is the current List of Counties Serviced by this abstractor.

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
		<b>#read_abstractors.company#<br>
		#read_abstractors.fname# #read_abstractors.lname#</b>

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
			<font size=2 color=green face=arial><B>Click <NOBR><a href="https://#CGI.SERVER_NAME#/admin_area/deed_prep_modify_countys_delete.cfm?uid=59&al=1&abstractor_ID=#abstractor_ID#&zip_id=#zip_id#">HERE</a></NOBR>
to allow the modification</B>
		</td>
	</tr>
</table>
</cfmail>
</BODY>
</HTML>
</cfif>