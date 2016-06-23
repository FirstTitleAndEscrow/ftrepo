<CFPARAM NAME="vendor"     DEFAULT="">
<CFPARAM NAME="a_state"       DEFAULT="">
<CFPARAM NAME="a_trigger"       DEFAULT="">




	<CFQUERY datasource="#request.dsn#" NAME="user">
			select * from first_admin
			WHERE ID = #session.ft_user_id#
	</CFQUERY>


<cfif user.vendor_admin eq 1>
<cfset url.al = 1>
</cfif>

	<cfif #url.al# eq 1>


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
			FROM ABSTRACTORS_county
			WHERE ABSTRACTOR_ID = #ABSTRACTOR_ID#
			ORDER BY st_abbrev ASC, ct_name ASC

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstractors">

			SELECT *
			FROM Abstractors
			WHERE Abstractor_ID = #Abstractor_ID#

		</CFQUERY>


		<CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
			<CFQUERY datasource="#request.dsn#">
				INSERT INTO Abstractors_county(Abstractor_ID, company, st_abbrev, ct_name, rank)
				VALUES(#Abstractor_ID#, '#read_abstractors.company#', '#st_abbrv_1[SSS]#', '#cty_name_1[SSS]#', 1)
			</CFQUERY>
		</CFLOOP>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstractors_state_county_list">

			SELECT  Abstractor_ID, company, st_abbrev, ct_name
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
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>The Counties were added to the Abstractors Counties List</B>
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
		<td width=499 align=left colspan = 2 valign=top bgcolor=e1e1e1>
		<NOBR><a href="https://#cgi.server_name#/admin_area/deed_prep_modify_view.cfm?uid=#URL.uid#&al=#URL.al#&Abstractor_ID=#Abstractor_ID#"><img src="./images/button_return.gif" border=0></a><img src="./images/clear.gif" height=10 width=85></NOBR>

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
				#st_abbrev# --- #ct_name# <br>
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
<!--- if the Vendor Admin that changed this vendor is not Pam, send Pam an email  --->
<cfif user.ID neq 56>
<CFMAIL
TO="pgibb@firsttitleservices.com" bcc="rjermain@firsttitleservices.com"
FROM="#user.email#" Subject="Abstractor info has changed"
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
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Before Modification  </B>
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
		This is the current List of Counties Serviced by this Abstractor.

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
		<td width=498 align=center valign=top bgcolor=white>
		<font size=2 color=green face=arial><B>Request for adding the following Abstractor(s)  </B>
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
		Add Request for:<p>
<b>#read_abstractors.company#<br>
		#read_abstractors.fname# #read_abstractors.lname#</b>

		</td>
	</tr>



	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Add request</b>
		</td>
	</tr>

	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		The following counties were added:

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
</CFMAIL>
</cfif>
<!--- END if the Vendor Admin that changed this vendor is not Pam, send Pam an email  --->





<cfelse>


	<CFSET zip_id_2 = #ListToArray(zip_id, ",")#>
	<CFSET st_abbrv_1 = ArrayNew(1)>
	<CFSET cty_name_1 = ArrayNew(1)>

		<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

				<CFSET st_abbrv_1[MMM] = #st_temp[1]#>
				<CFSET cty_name_1[MMM] = #st_temp[2]#>


		</CFLOOP>





		<CFQUERY datasource="#request.dsn#" NAME="read_ABSTRACTORs">

			SELECT *
			FROM ABSTRACTORS
			WHERE ABSTRACTOR_ID = #ABSTRACTOR_ID#

		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read">

			SELECT *
			FROM ABSTRACTORS_county
			WHERE ABSTRACTOR_ID = #ABSTRACTOR_ID#
			ORDER BY st_abbrev ASC, ct_name ASC

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_ABSTRACTORs_state_county_list">

			SELECT  ABSTRACTOR_ID, st_abbrev, ct_name
			FROM ABSTRACTORS_county
			WHERE ABSTRACTOR_ID = #ABSTRACTOR_ID#
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
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Email has been sent to the administrator to process you request to delete abstractor(s)</B>
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
		<td width=499 align=left colspan = 2 valign=top bgcolor=e1e1e1>
		<NOBR><a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#&a_state=#a_state#&vendor=#vendor#"><img src="./images/button_return.gif" border=0></a><img src="./images/clear.gif" height=10 width=85></NOBR>

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
TO="mather@firsttitleservices.com" bcc="rjermain@firsttitleservices.com"
FROM="#user.email#" Subject="Abstractor info change request"
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
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Before Modification  </B>
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
		This is the current List of Counties Serviced by this Abstractor.

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
		<td width=498 align=center valign=top bgcolor=white>
		<font size=2 color=green face=arial><B>Request for adding the following Abstractor(s)  </B>
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
		Add Request for:<p>
<b>#read_abstractors.company#<br>
		#read_abstractors.fname# #read_abstractors.lname#</b>

		</td>
	</tr>



	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Add request</b>
		</td>
	</tr>

	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		This is a request to add the following counties:

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
			<font size=2 color=green face=arial><B>Click <NOBR><a href="https://#CGI.SERVER_NAME#/admin_area/deed_prep_modify_countys_add.cfm?uid=59&al=1&abstractor_ID=#abstractor_ID#&zip_id=#zip_id#">HERE</a></NOBR>
to allow the modification</B>
		</td>
	</tr>
</table>
</CFMAIL>
</BODY>
</HTML>
</cfif>
