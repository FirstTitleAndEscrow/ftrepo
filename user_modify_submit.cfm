






		<CFQUERY datasource="#request.dsn#">

			UPDATE users
			SET <!--- a_pass = '#FORM.pword#', --->
			lp_fname = '#FORM.lp_fname#',
			lp_lname = '#FORM.lp_lname#',
			lp_email = '#FORM.lp_email#',
			cc_email_1 = '#FORM.cc_email_1#',
			cc_email_2 = '#FORM.cc_email_2#',
			lp_phone = '#FORM.lp_phone#',
			lp_ext = '#FORM.lp_ext#',
			lp_fax = '#FORM.lp_fax#',
			m_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			m_time = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE ID = #user_id_1#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			WHERE ID = #comp_ID#

		</CFQUERY>


			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
			<HTML>
			<HEAD>
			<TITLE>First Title Services Admin</TITLE>

			</HEAD>

			<BODY BGCOLOR="#FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



			<CENTER>

			<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
				<tr>
					<td width=500 align=center valign=top>

			<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<tr>
					<td width=499 align=center valign=top bgcolor=e1e1e1>
						<IMG SRC="./images/title_01.gif">

					</td>
				</tr>

				<tr>
					<td width=499 align=center valign=top bgcolor=e2e2e2>
						<FONT SIZE=2 color=black face=arial>

			<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
				<tr>
					<td width=498 align=left valign=top bgcolor=white>
						<!--- <NOBR><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a><img src="./images/clear.gif" height=10 width=85><font size=2 color=blue face=arial>Modify User</CENTER></NOBR><font size=2 color=black face=arial>
						 ---><p>
						Company - <B>#read_companies.company#</B>
						<p><font size=2 color=black face=arial>
						User has been modified as shown below.

					</td>
				</tr>



				</table>

						</td>
					</tr>

					<tr>
						<td width=499 align=center valign=top bgcolor=white>


				<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
					<tr>
						<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
							<img src="./images/clear.gif" height=10 width=85>
						</td>
					</tr>

<!--- ===/ LOAN PROCESSOR INFO \=== --->

	<tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			Loan <B>Processor</B> Information :

		</td>
	</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							First Name
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#FORM.lp_fname#</b>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							Last Name
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#FORM.lp_lname#</b>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							Email
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#FORM.lp_email#</b>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							cc. Email 1
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#cc_email_1#</b>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							cc. Email 2
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#cc_email_2#</b>
						</td>
					</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#FORM.lp_phone#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#FORM.lp_ext#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#FORM.lp_fax#</B>


		</td>
	</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<B>User Name</B>
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#FORM.uname#</b>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<B>Password</B>
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#FORM.a_pass#</b>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<B>Access Level</B> -
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
						<font size=2 color=blue face=arial>
					<CFIF #FORM.acc_lvl# EQ "0">
							<b>User</b>
					<CFELSE>
							<b>Admin</b>
					</CFIF>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							Status -
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
						<font size=2 color=blue face=arial>
					<CFIF #FORM.a_status# EQ "0"><font size=2 color=red face=arial>
							<b>In-Active</b>
					<CFELSE><font size=2 color=green face=arial>
							<b>Active</b>
					</CFIF>
						</td>
					</tr>

				</table>
						</td>

					</tr>
				</table>

</CFOUTPUT>
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



