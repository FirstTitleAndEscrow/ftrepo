


		<CFQUERY datasource="#request.dsn#" NAME="read_user">

			SELECT *
			FROM users
			WHERE ID = #user_id_1#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			WHERE ID = #read_user.comp_ID#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_loan_officers">

			SELECT *
			FROM loan_officers
			WHERE userID = #user_id_1# and ID = #A_loan_offcr#

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
						<center><font size=2 color=blue face=arial><B>Add Loan Officer</B></CENTER><font size=2 color=black face=arial>
						<br>
						User is  - <B>#read_user.lp_fname# #read_user.lp_lname#</B>
						<br>
						Company - <B>#read_companies.company#</B>
					</td>
				</tr>
			</CFOUTPUT>

			</table>

					</td>
				</tr>

				<tr>
					<td width=431 align=center valign=top bgcolor=white>


			<table width=430 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

<CFOUTPUT>

	<CFFORM METHOD=POST ACTION="./loan_offcr_modify_submit.cfm?user_id_1=#URL.user_id_1#&comp_id=#read_companies.ID#&a_loan_offcr=#A_loan_offcr#">


<!--- ===/ LOAN PROCESSOR INFO \=== --->

	<tr>
		<td width=430 colspan=2 align=left valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			Loan <B>Officer</B> Information :


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			First Name


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="lo_fname"  size=20 maxlength=30
			VALUE="#read_loan_officers.lo_fname#"
				REQUIRED="YES" MESSAGE="You must enter a First Name"
				style="font-size: 12;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Last Name


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="lo_lname"  size=20 maxlength=30
			VALUE="#read_loan_officers.lo_lname#"
				REQUIRED="YES" MESSAGE="You must enter a Last Name"
				style="font-size: 12;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Email


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="lo_email"  size=30 maxlength=160
			VALUE="#read_loan_officers.lo_email#"
				REQUIRED="YES" MESSAGE="You must enter an Email Address"
				style="font-size: 12;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="lo_phone"  size=23 maxlength=15
				VALUE="#read_loan_officers.lo_phone#"
				REQUIRED="YES" MESSAGE="You must enter a Phone Number"
				style="font-size: 12;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="lo_ext"
			VALUE="#read_loan_officers.lo_ext#"
			size=10 maxlength=6
				style="font-size: 12;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="lo_fax" size=23 maxlength=15
			VALUE="#read_loan_officers.lo_fax#"
				REQUIRED="YES" MESSAGE="You must enter a Fax Number"
				style="font-size: 12;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>

		<td width=430 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>

	</CFFORM>
</table>

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

			<table width=431 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
				<tr>
					<td width=431 align=right valign=top bgcolor=white>
					<p>
					<br>
						<a href=javascript:window.close();><img src="./images/button_close.gif" border="0"></a>
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