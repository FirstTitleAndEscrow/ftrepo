	<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM First_Admin
		WHERE ID = '#URL.UID#'
</CFQUERY>


<cfif #read_user.lname# eq "Hays" AND  #read_user.lname# eq "Elliott">




		<CFQUERY datasource="#request.dsn#" NAME="read_company">

			SELECT *
			FROM companies
			WHERE ID = #company_id#

		</CFQUERY>




			<CFSET a_state_list = #ListToArray(a_st_list_2, ",")#>



		<CFSET a_agency_list = #ListToArray(ft_agencies, ",")#>

	<CFLOOP FROM="1" TO="#ArrayLen(a_agency_list)#" INDEX="DDD">

		<CFQUERY datasource="#request.dsn#" NAME="read_agency_1">
			SELECT *
			FROM title_FT_Agencies
			WHERE Title_FT_Agency_id = #a_agency_list[DDD]#
		</CFQUERY>


	</CFLOOP>


<CFMAIL
TO="spape@firsttitleservices.com"
FROM="#user.email#"
SERVER="127.0.0.1"
Subject="Line Cost info change request"
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
			<font size=2 color=green face=arial>
			<B>A request #read_user.fname#&nbsp;&nbsp;#read_user.lname# to change Line Costs for the company below</B>
			<p>
		</td>
	</tr>

	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=green face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>

	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>

			<table width=497 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=497 colspan=4 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

			#read_agency_1.company#&nbsp;&nbsp;&nbsp;&nbsp;<br>#a_st_list_2#

			<p>
		</td>
	</tr>




	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Settlement or Closing Fee">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1101#</b></nobr>
		</td>


		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1111#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1111_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Abstract or Title Search">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1102#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1112#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1112_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Title Examination">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1103#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1113#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1113_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Title Insurance Binder">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1104#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1205#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1205_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Document Preparation">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1105#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1303#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1303_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Notary Fees">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1106#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1304#</b></nobr>
		</td>

	<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1304_text#</b></nobr>
		</td>
	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Attorney's Fees">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1107#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="https://#cgi.server_name#/admin_area/images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1305#</b></nobr>
		</td>

	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1305_text#</b></nobr>
		</td>
	</tr>

</table>





		</td>
	</tr>

		</td>
	</tr>
</table>

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
			<font size=2 color=green face=arial><B>Click <NOBR><a href="https://#CGI.SERVER_NAME#/admin_area/client_line_costs_add_submit.cfm?uid=59&al=1&company_id=#company_id#&a_1101=#a_1101#&a_1102=#a_1102#&a_1103=#a_1103#&a_1104=#a_1104#&a_1105=#a_1105#&a_1106=#a_1106#&a_1107=#a_1107#&a_1111=#a_1111#&a_1111_text=#a_1111_text#&a_1112=#a_1112#&a_1112_text=#a_1112_text#&a_1113=#a_1113#&a_1113_text=#a_1113_text#&a_1205=#a_1205#&a_1205_text=#a_1205_text#&a_1303=#a_1303#&a_1303_text=#a_1303_text#&a_1304=#a_1304#&a_1304_text=#a_1304_text#&a_1305=#a_1305#&a_1305_text=#a_1305_text#&a_state_list=#a_state_list#&ft_agencies=#ft_agencies#">HERE</a></NOBR>
to allow the modification</B>
		</td>
	</tr>
</table>


</cfmail>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>


<CENTER>

<CENTER>

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
			<font size=2 color=green face=arial>
			<B>An email has been sent to the administrator to process your request to change Line Costs</B>
			<p>
		</td>
	</tr>
<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=green face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>
</CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>

			<table width=497 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=497 colspan=4 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	<CFOUTPUT>
			#read_agency_1.company#&nbsp;&nbsp;&nbsp;&nbsp;<br>#a_st_list_2#
	</CFOUTPUT>
			<p>
		</td>
	</tr>

	<tr>
		<td width=497 colspan=4 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	<CFOUTPUT>
			<A href="./client_line_costs_select.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#"><img src="./images/button_return.gif" border=0></A>
	</CFOUTPUT>
			<p>
		</td>
	</tr>

<CFOUTPUT>
	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1101#</b></nobr>
		</td>


		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1111#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1111_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1102#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1112#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1112_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1103#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1113#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1113_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1104#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1205#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1205_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1105#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1303#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1303_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1106#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1304#</b></nobr>
		</td>

	<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1304_text#</b></nobr>
		</td>
	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1107#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1305#</b></nobr>
		</td>

	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1305_text#</b></nobr>
		</td>
	</tr>

</table>

</CFOUTPUT>

	<!--- ======================================================== --->

		</td>
	</tr>

		</td>
	</tr>
</table>

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










<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>

		<CFQUERY datasource="#request.dsn#" NAME="read_company">

			SELECT *
			FROM companies
			WHERE ID = #company_id#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#">
			INSERT INTO Company_Billing_Values(company_id, a_1101, a_1102, a_1103, a_1104, a_1105, a_1106, a_1107, a_1111, a_1111_text, a_1112, a_1112_text, a_1113, a_1113_text, a_1205, a_1205_text, a_1303, a_1303_text, a_1304, a_1304_text, a_1305, a_1305_text, a_1101b, a_1102b, a_1103b, a_1104b, a_1105b, a_1106b, a_1107b, a_1111b, a_1111_textb, a_1112b, a_1112_textb, a_1113b, a_1113_textb, a_1205b, a_1205_textb, a_1303b, a_1303_textb, a_1304b, a_1304_textb, a_1305b, a_1305_textb, a_1101c, a_1102c, a_1103c, a_1104c, a_1105c, a_1106c, a_1107c, a_1111c, a_1111_textc, a_1112c, a_1112_textc, a_1113c, a_1113_textc, a_1205c, a_1205_textc, a_1303c, a_1303_textc, a_1304c, a_1304_textc, a_1305c, a_1305_textc, b_date, b_time)
			VALUES(#company_id#, '#a_1101#', '#a_1102#', '#a_1103#', '#a_1104#', '#a_1105#', '#a_1106#', '#a_1107#', '#a_1111#', '#a_1111_text#', '#a_1112#', '#a_1112_text#', '#a_1113#', '#a_1113_text#', '#a_1205#', '#a_1205_text#', '#a_1303#', '#a_1303_text#', '#a_1304#', '#a_1304_text#', '#a_1305#', '#a_1305_text#', '#a_1101#', '#a_1102#', '#a_1103#', '#a_1104#', '#a_1105#', '#a_1106#', '#a_1107#', '#a_1111#', '#a_1111_text#', '#a_1112#', '#a_1112_text#', '#a_1113#', '#a_1113_text#', '#a_1205#', '#a_1205_text#', '#a_1303#', '#a_1303_text#', '#a_1304#', '#a_1304_text#', '#a_1305#', '#a_1305_text#', '#a_1101#', '#a_1102#', '#a_1103#', '#a_1104#', '#a_1105#', '#a_1106#', '#a_1107#', '#a_1111#', '#a_1111_text#', '#a_1112#', '#a_1112_text#', '#a_1113#', '#a_1113_text#', '#a_1205#', '#a_1205_text#', '#a_1303#', '#a_1303_text#', '#a_1304#', '#a_1304_text#', '#a_1305#', '#a_1305_text#', '#b_date#', '#b_time#')
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID">

			SELECT *
			FROM Company_Billing_Values
			WHERE b_time = '#b_time#' AND b_date = '#b_date#'

		</CFQUERY>


			<CFSET a_state_list = #ListToArray(a_st_list_2, ",")#>

	<CFLOOP FROM="1" TO="#ArrayLen(a_state_list)#" INDEX="DDD">

		<CFQUERY datasource="#request.dsn#" >
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID.billing_id#, #Read_billing_ID.company_id#, '#a_state_list[DDD]#')
		</CFQUERY>


	</CFLOOP>


		<CFSET a_agency_list = #ListToArray(ft_agencies, ",")#>

	<CFLOOP FROM="1" TO="#ArrayLen(a_agency_list)#" INDEX="DDD">

		<CFQUERY datasource="#request.dsn#" NAME="read_agency_1">
			SELECT *
			FROM title_FT_Agencies
			WHERE Title_FT_Agency_id = #a_agency_list[DDD]#
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" >
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID.billing_id#, #read_agency_1.title_FT_Agency_ID#, '#read_agency_1.company#',  '#read_agency_1.state#', #read_company.id#)
		</CFQUERY>

	</CFLOOP>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>


<CENTER>

<CENTER>

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
			<font size=2 color=green face=arial>
			<B>The Line Costs have been ADDED to Mortgage Client</B>
			<p>
		</td>
	</tr>
<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=green face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>
</CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>

			<table width=497 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=497 colspan=4 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	<CFOUTPUT>
			#read_agency_1.company#&nbsp;&nbsp;&nbsp;&nbsp;<br>#a_st_list_2#
	</CFOUTPUT>
			<p>
		</td>
	</tr>

	<tr>
		<td width=497 colspan=4 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	<CFOUTPUT>
			<A href="./client_line_costs_select.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#"><img src="./images/button_return.gif" border=0></A>
	</CFOUTPUT>
			<p>
		</td>
	</tr>

<CFOUTPUT>
	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1101#</b></nobr>
		</td>


		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1111#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1111_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1102#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1112#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1112_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1103#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1113#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1113_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1104#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1205#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1205_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1105#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1303#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1303_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1106#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1304#</b></nobr>
		</td>

	<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1304_text#</b></nobr>
		</td>
	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1107#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1305#</b></nobr>
		</td>

	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1305_text#</b></nobr>
		</td>
	</tr>

</table>

</CFOUTPUT>

	<!--- ======================================================== --->

		</td>
	</tr>

		</td>
	</tr>
</table>

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


	</cfif>