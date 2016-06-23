<!--- <cfif isDefined("url.username")>
<cfset form.username = url.username>
</cfif>
<cfif isDefined("url.password")>
<cfset form.password = url.password>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="check_companies">
		SELECT *
		FROM Companies
		WHERE a_user = '#form.username#'
		and a_pass = '#form.password#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_users">
		SELECT *
		FROM Users
		WHERE a_user = '#form.username#'
		and a_pass = '#form.password#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_closer">
		SELECT *
		FROM Closer
		WHERE username = '#form.username#'
		and password = '#form.password#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_abstractors">
		SELECT *
		FROM Abstractors
		WHERE username = '#form.username#'
		and password = '#form.password#'
		and Abstractor_ID <> '#Abstractor_ID#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_co_user">
		SELECT *
		FROM Companies_User
		WHERE username = '#form.username#'
		and password = '#form.password#'
</CFQUERY>

<cfif check_companies.recordcount or check_users.recordcount or check_closer.recordcount or check_abstractors.recordcount or check_co_user.recordcount>
<script language="javascript">
alert("That UserName/Password combination is already in use, please choose another");
history.go(-1);
</script>
<cfabort>
</cfif>	 --->

<CFPARAM NAME="company" DEFAULT="">
<CFPARAM NAME="fname" DEFAULT="">
<CFPARAM NAME="lname" DEFAULT="">
<CFPARAM NAME="phone" DEFAULT="">
<CFPARAM NAME="cell" DEFAULT="">
<CFPARAM NAME="pager" DEFAULT="">
<CFPARAM NAME="fax" DEFAULT="">
<CFPARAM NAME="email" DEFAULT="">
<CFPARAM NAME="rank" DEFAULT="">
<CFPARAM NAME="addr1" DEFAULT="">
<CFPARAM NAME="addr2" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="zip_code" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="oe" DEFAULT="">
<CFPARAM NAME="deedonly" DEFAULT="">
<CFPARAM NAME="oe1" DEFAULT="">
<CFPARAM NAME="oe2" DEFAULT="">
<CFPARAM NAME="mort" DEFAULT="">
<CFPARAM NAME="judg" DEFAULT="">
<CFPARAM NAME="rec" DEFAULT="">
<CFPARAM NAME="rec_update" DEFAULT="">
<CFPARAM NAME="pref_for_send" DEFAULT="">
<CFPARAM NAME="username" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="tss_id" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
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



<CFQUERY datasource="#request.dsn#" name="read">

select * from Abstractors
WHERE Abstractor_ID = #Abstractor_ID#

</CFQUERY>

<CFQUERY datasource="#request.dsn#" name="read_rank">

select * from Abstractors_county
WHERE Abstractor_ID = #Abstractor_ID#

</CFQUERY>
<!--- <cfif #a_cost# eq "" and #oe# neq "">
<cfset a_cost = #oe#>
</cfif>--->


		<CFQUERY datasource="#request.dsn#" >

			UPDATE Abstractors
			SET tss_id = '#tss_id#',
			company = '#company#',
			username = '#username#',
			password = '#password#',
			fname = '#fname#',
			lname = '#lname#',
			phone = '#phone#',
			cell = '#cell#',
			pager = '#pager#',
			fax  = '#fax#',
			email  = '#email#',
			addr1 = '#addr1#',
			addr2 = '#addr2#',
			a_note_1 = '#a_note_1#',
			city  = '#city#',
			state = '#state#',
			zip_code = '#zip_code#',
			a_cost = '#a_cost#',
			oe = '#oe#',
			deedonly = '#deedonly#',
			oe1 = '#oe1#',
			oe2 = '#oe2#',
			mort = '#mort#',
			judg = '#judg#',
			rec = '#rec#',
			rec_update = '#rec_update#',
			a_comments = '#a_comments#',
			pref_for_send = '#pref_for_send#'
			WHERE Abstractor_ID = #Abstractor_ID#

		</CFQUERY>



	<CFQUERY datasource="#request.dsn#" >

			UPDATE abstractors_County
			SET
			rank = '#rank#',
			company = '#company#'
			WHERE abstractor_ID = #abstractor_ID#

		</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM doc_abstract_title where abstractor_id = #abstractor_id#
</cfquery>

<cfif #read_report.recordcount# GT 0>

	<CFQUERY datasource="#request.dsn#" >

			UPDATE doc_abstract_title
			SET
			company = '#company#'
			WHERE abstractor_ID = #abstractor_ID#

		</CFQUERY>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



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
			<font size=2 color=green face=arial><B>The Abstractors record was successfully  Modified</B>
		</td>
	</tr>


</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=left valign=top bgcolor=e1e1e1>
		<NOBR><a href="https://#cgi.server_name#/admin_area/abstractors_modify_view.cfm?uid=#URL.uid#&al=#URL.al#&Abstractor_ID=#Abstractor_ID#"><img src="./images/button_return.gif" border=0></a><img src="./images/clear.gif" height=10 width=85></NOBR>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=e1e1e1>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>

	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="./images/clear.gif" height=10 width=85>


		</td>
	</tr>

	<!--- <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			TSS Code -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#tss_id#</B>
		</td>
	</tr> --->

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Company Name -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#company#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			User Name -
		</B>

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#username#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			Password -

		</b>
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=red face=arial>
			<b>#password#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			First Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#fname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Last Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#lname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Phone -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#phone#</b>


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Cell -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#cell#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Pager -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#pager#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fax -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#fax#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Email -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#email#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#addr1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#addr2#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Notes -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#a_note_1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			City -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#city#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			State -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#state#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Zip Code -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#zip_code#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O&E(1) + Update  -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#a_cost#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Deed only -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#deedonly#

		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O$E -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#oe1#

		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O&E(2) -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#oe2#


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#mort#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Judgment -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#judg#


		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Recording


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#rec#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Rec w/update


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#rec_update#

		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Rank -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#rank#</B>


		</td>
	</tr>
	<tr>
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Comments :

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#a_comments#</b>

		</td>
	</tr>

	<tr>
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Preferences for recieving Abstractor Notice

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#pref_for_send#</b>

		</td>
	</tr>

</table>

		</td>

	</tr>
</table>

</table>

	</td>
</tr>
</table>

</CFOUTPUT>
</BODY>
</HTML>



<!--- if the Vendor Admin that changed this vendor is not Pam, send Pam an email  --->
<cfif user.ID neq 56>
<CFMAIL
TO="pgibb@firsttitleservices.com"  bcc="rjermain@firsttitleservices.com"
FROM="#user.email#"
SERVER="127.0.0.1"
Subject="Abstractor info has been changed"
TIMEOUT="600"
type="HTML"
>

<table width=498>
<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Click <NOBR><a href="https://#CGI.SERVER_NAME#/admin_area/abstractors_modify_submit.cfm?uid=58&al=1&abstractor_ID=#abstractor_ID#&tss_id=#tss_id#&company=#company#&username=#username#&password=#password#&fname=#fname#&lname=#lname#&phone=#phone#&cell=#cell#&pager=#pager#&fax=#fax#&addr1=#addr1#&addr2=#addr2#&a_note_1=#a_note_1#&city=#city#&state=#state#&zip_code=#zip_code#&a_cost=#a_cost#&rank=#rank#&email=#email#&a_comments=#a_comments#&pref_for_send=#pref_for_send#&deedonly=#deedonly#&oe1=#oe1#&oe2=#oe2#&mort=#mort#&judg=#judg#&rec=#rec#&rec_update=#rec_update#">HERE</a></NOBR>
to allow the modifications below</B>
		</td>
	</tr>
</table>

<table width=498>
<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Before modification</B>
		</td>
	</tr>


</table>

		</td>
	</tr>



	<tr>
		<td width=499 align=center valign=top bgcolor=e1e1e1>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>


	</tr>


		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Company Name -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.company#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			User Name -
		</B>

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.username#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			Password -

		</b>
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=red face=arial>
			<b>#read.password#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			First Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.fname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Last Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.lname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Phone -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.phone#</b>


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Cell -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.cell#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Pager -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.pager#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fax -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.fax#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Email -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.email#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.addr1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.addr2#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Notes -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.a_note_1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			City -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.city#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			State -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.state#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Zip Code -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.zip_code#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
		O&E(1) + Update  -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.a_cost#</B>


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Deed only -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.deedonly#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			O&E


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.oe1#</B>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			O&E(2)


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.oe2#</B>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Mortgage


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.mort#</B>


		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Judg


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.judg#</B>


		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Recording


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.rec#</B>


		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Rec w/update


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.rec_update#</B>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Rank -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read_rank.rank#</B>


		</td>
	</tr>
	<tr>
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Comments :

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#read.a_comments#</b>

		</td>
	</tr>

	<tr>
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Preferences for recieving Abstractor Notice

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#read.pref_for_send#</b>

		</td>
	</tr>

</table>

		</td>

	</tr>
</table>

</table>

	</td>
</tr>
</table>

	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>After modification</B>
		</td>
	</tr>


</table>

		</td>
	</tr>



	<tr>
		<td width=499 align=center valign=top bgcolor=e1e1e1>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>


	</tr>


	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Company Name -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#company#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			User Name -
		</B>

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#username#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			Password -

		</b>
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=red face=arial>
			<b>#password#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			First Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#fname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Last Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#lname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Phone -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#phone#</b>


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Cell -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#cell#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Pager -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#pager#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fax -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#fax#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Email -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#email#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#addr1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#addr2#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Notes -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#a_note_1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			City -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#city#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			State -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#state#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Zip Code -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#zip_code#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O&E(1) + Update  -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#a_cost#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Deed only -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#deedonly#

		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O$E -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#oe1#

		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O&E(2) -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#oe2#


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#mort#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Judgment -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#judg#


		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Recording


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#rec#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Rec w/update


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#rec_update#

		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Rank -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#rank#</B>


		</td>
	</tr>
	<tr>
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Comments :

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#a_comments#</b>

		</td>
	</tr>

	<tr>
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Preferences for recieving Abstractor Notice

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#pref_for_send#</b>

		</td>
	</tr>

</table>

		</td>

	</tr>
</table>

</table>

	</td>
</tr>
</table>


</CFMAIL>
</cfif>







<cfelse>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>



<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



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
			<font size=2 color=green face=arial><B>An email has been sent to the administrator to process your request</B>
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
		<td width=499 align=center valign=top bgcolor=e1e1e1>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>

	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="./images/clear.gif" height=10 width=85>


		</td>
	</tr>

	<!--- <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			TSS Code -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#tss_id#</B>
		</td>
	</tr> --->

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Company Name -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#company#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			User Name -
		</B>

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#username#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			Password -

		</b>
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=red face=arial>
			<b>#password#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			First Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#fname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Last Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#lname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Phone -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#phone#</b>


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Cell -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#cell#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Pager -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#pager#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fax -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#fax#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Email -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#email#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#addr1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#addr2#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Notes -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#a_note_1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			City -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#city#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			State -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#state#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Zip Code -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#zip_code#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O&E(1) + Update  -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#a_cost#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Deed only -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#deedonly#

		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O$E -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#oe1#

		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O&E(2) -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#oe2#


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#mort#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Judgment -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#judg#


		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Recording


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#rec#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Rec w/update


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#rec_update#

		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Rank -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#rank#</B>


		</td>
	</tr>
	<tr>
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Comments :

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#a_comments#</b>

		</td>
	</tr>

	<tr>
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Preferences for recieving Abstractor Notice

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#pref_for_send#</b>

		</td>
	</tr>

</table>

		</td>

	</tr>
</table>

</table>

	</td>
</tr>
</table>

</CFOUTPUT>

<CFQUERY datasource="#request.dsn#" name="read">

			select * from Abstractors
				WHERE Abstractor_ID = #Abstractor_ID#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" name="read_rank">

			select * from Abstractors_county
				WHERE Abstractor_ID = #Abstractor_ID#

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="user">

			SELECT  *
			FROM first_admin
			WHERE ID = #session.ft_user_id#


		</CFQUERY>

<CFMAIL
TO="mather@firsttitleservices.com"  bcc="rjermain@firsttitleservices.com"
FROM="#user.email#"
SERVER="127.0.0.1"
Subject="Abstractor info change request"
TIMEOUT="600"
type="HTML"
>

<table width=498>
<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Click <NOBR><a href="https://#CGI.SERVER_NAME#/admin_area/abstractors_modify_submit.cfm?uid=58&al=1&abstractor_ID=#abstractor_ID#&tss_id=#tss_id#&company=#company#&username=#username#&password=#password#&fname=#fname#&lname=#lname#&phone=#phone#&cell=#cell#&pager=#pager#&fax=#fax#&addr1=#addr1#&addr2=#addr2#&a_note_1=#a_note_1#&city=#city#&state=#state#&zip_code=#zip_code#&a_cost=#a_cost#&rank=#rank#&email=#email#&a_comments=#a_comments#&pref_for_send=#pref_for_send#&deedonly=#deedonly#&oe1=#oe1#&oe2=#oe2#&mort=#mort#&judg=#judg#&rec=#rec#&rec_update=#rec_update#">HERE</a></NOBR>
to allow the modifications below</B>
		</td>
	</tr>
</table>

<table width=498>
<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Before modification</B>
		</td>
	</tr>


</table>

		</td>
	</tr>



	<tr>
		<td width=499 align=center valign=top bgcolor=e1e1e1>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>


	</tr>


		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Company Name -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.company#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			User Name -
		</B>

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.username#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			Password -

		</b>
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=red face=arial>
			<b>#read.password#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			First Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.fname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Last Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.lname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Phone -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.phone#</b>


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Cell -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.cell#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Pager -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.pager#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fax -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.fax#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Email -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.email#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.addr1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.addr2#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Notes -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.a_note_1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			City -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.city#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			State -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.state#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Zip Code -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read.zip_code#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
		O&E(1) + Update  -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.a_cost#</B>


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Deed only -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.deedonly#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			O&E


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.oe1#</B>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			O&E(2)


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.oe2#</B>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Mortgage


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.mort#</B>


		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Judg


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.judg#</B>


		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Recording


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.rec#</B>


		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Rec w/update


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read.rec_update#</B>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Rank -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read_rank.rank#</B>


		</td>
	</tr>
	<tr>
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Comments :

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#read.a_comments#</b>

		</td>
	</tr>

	<tr>
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Preferences for recieving Abstractor Notice

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#read.pref_for_send#</b>

		</td>
	</tr>

</table>

		</td>

	</tr>
</table>

</table>

	</td>
</tr>
</table>

	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>After modification</B>
		</td>
	</tr>


</table>

		</td>
	</tr>



	<tr>
		<td width=499 align=center valign=top bgcolor=e1e1e1>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>


	</tr>


	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Company Name -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#company#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			User Name -
		</B>

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#username#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=black face=arial>
			Password -

		</b>
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=red face=arial>
			<b>#password#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			First Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#fname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Last Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#lname#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Phone -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#phone#</b>


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Cell -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#cell#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Pager -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#pager#</b>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fax -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#fax#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Email -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#email#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#addr1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#addr2#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Notes -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#a_note_1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			City -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#city#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			State -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#state#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Zip Code -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#zip_code#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O&E(1) + Update  -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#a_cost#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Deed only -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#deedonly#

		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O$E -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#oe1#

		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			O&E(2) -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#oe2#


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#mort#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Judgment -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#judg#


		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Recording


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#rec#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Rec w/update


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#rec_update#

		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Rank -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#rank#</B>


		</td>
	</tr>
	<tr>
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Comments :

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#a_comments#</b>

		</td>
	</tr>

	<tr>
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Preferences for recieving Abstractor Notice

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>#pref_for_send#</b>

		</td>
	</tr>

</table>

		</td>

	</tr>
</table>

</table>

	</td>
</tr>
</table>


</CFMAIL>


</BODY>
</HTML>


</cfif>
