        <CFPARAM NAME="emp" DEFAULT="0">

		<CFQUERY datasource="#request.dsn#">

			UPDATE loan_officers
			SET userid = #URL.user_id_1#,
			a_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_time = '#TimeFormat(Now(), "HH:mm:ss")#',
			a_admin_id = #URL.user_id_1#,
			a_status = 1,
			lo_fname = '#FORM.lo_fname#',
			lo_lname = '#FORM.lo_lname#',
			lo_email = '#FORM.lo_email#',
			lo_phone = '#FORM.lo_phone#',
			lo_ext = '#FORM.lo_ext#',
			lo_fax = '#FORM.lo_fax#'
			WHERE ID = #A_loan_offcr#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_user">

			SELECT *
			FROM users
			WHERE id = #URL.user_id_1#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			WHERE ID = #read_user.comp_ID#

		</CFQUERY>



			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
			<HTML>
			<HEAD>
			<TITLE><cfoutput>#session.site.short_name#</cfoutput> Admin</TITLE>

			</HEAD>

			<BODY BGCOLOR="#FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



			<CENTER>

			<table width=433 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
				<tr>
					<td width=433 align=center valign=top>

			<table width=432 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<tr>
					<td width=432 align=center valign=top bgcolor=e1e1e1>
						<IMG SRC="./images/logo_top_popup.gif">
					</td>
				</tr>

				<tr>
					<td width=432 align=center valign=top bgcolor=e2e2e2>

			<table width=431 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

			<CFOUTPUT>
				<tr>
					<td width=431 align=left valign=top bgcolor=white>
						<CENTER><font size=2 color=blue face=arial>Loan Officer was Modified</CENTER></NOBR><font size=2 color=black face=arial>
						<br>
						User is  - <B>#read_user.lp_fname# #read_user.lp_lname#</B>
						<br>
						Company - <B>#read_companies.company#</B>
						<br>

					</td>
				</tr>
			</CFOUTPUT>

			</table>

					</td>
				</tr>

				<tr>
					<td width=432 align=center valign=top bgcolor=white>


			<table width=431 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

<CFOUTPUT>


<!--- ===/ LOAN OFFICER INFO \=== --->

	<tr>
		<td width=431 colspan=2 align=left valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			Loan <B>Officer</B> Information :
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			First Name
		</td>

		<td width=201 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.lo_fname#</b>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Last Name
		</td>

		<td width=201 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.lo_lname#</b>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Email
		</td>

		<td width=201 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.lo_email#</b>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone
		</td>

		<td width=201 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.lo_phone#</b>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.
		</td>

		<td width=201 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.lo_ext#</b>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax
		</td>

		<td width=201 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.lo_fax#</b>
		</td>
	</tr>
</table>

</CFOUTPUT>



					</td>
				</tr>

				<tr>
					<td width=432 align=left valign=top bgcolor=white>

						<a href=javascript:window.close();><img src="./images/button_close.gif" border="0"></a>

					</td>
				</tr>

			</table>

				</td>
			</tr>
			</table>

				</td>
			</tr>
			</table>


			<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
			</HTML>


