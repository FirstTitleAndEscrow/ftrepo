




		<CFQUERY datasource="#request.dsn#" NAME="read_user">

			SELECT *
			FROM users
			WHERE ID = #user_id_1#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			WHERE ID = #read_user.comp_id#

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
						<p>

					</td>
				</tr>
			</CFOUTPUT>

			</table>

					</td>
				</tr>

				<tr>
					<td width=499 align=center valign=top bgcolor=white>


			<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

<CFOUTPUT>

	<CFFORM METHOD=POST ACTION="./user_modify_submit.cfm?comp_id=#read_companies.ID#&user_id_1=#user_id_1#">


				<tr>

					<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
						<img src="./images/clear.gif" height=10 width=85>


					</td>
				</tr>


				<tr>
					<td width=130 align=right valign=top bgcolor=e6e6e6>
						<font size=2 color=black face=arial>
						Status


					</td>

					<td width=237 align=left valign=top bgcolor=e6e6e6>
						<font size=2 color=black face=arial>
				<!--- 	<CFIF #read_user.a_status# EQ "0"> <font size=2 color=red face=arial>
						<NOBR><input type=radio name="a_status" VALUE="0" CHECKED> - In-Active</NOBR>
						<br><font size=2 color=green face=arial>
						<NOBR><input type=radio name="a_status"  VALUE="1"> - Admin</NOBR><br>
					<CFELSE><font size=2 color=red face=arial>
						<NOBR><input type=radio name="a_status" VALUE="0"> - In-Active</NOBR><br>
						<font size=2 color=green face=arial>
						<NOBR><input type=radio name="a_status"  VALUE="1" CHECKED> - Active</NOBR><br>
					</CFIF> --->

	<INPUT TYPE=HIDDEN NAME="uname_old" VALUE="#read_user.a_user#">

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
			<CFINPUT VALUE="#read_user.lp_fname#" type=text name="lp_fname"  size=20 maxlength=30
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

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT VALUE="#read_user.lp_lname#" type=text name="lp_lname"  size=20 maxlength=30
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

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  VALUE="#read_user.lp_email#" type=text name="lp_email"  size=30 maxlength=160
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
			cc. Email 1


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="cc_email_1" VALUE="#read_user.cc_email_1#" size=30 maxlength=160
				style="font-size: 9;
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
			cc. Email 2


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="cc_email_2" VALUE="#read_user.cc_email_2#"  size=30 maxlength=160
				style="font-size: 9;
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

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT VALUE="#read_user.lp_phone#" type=text name="lp_phone"  size=23 maxlength=15
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

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT VALUE="#read_user.lp_ext#" type=text name="lp_ext"  size=10 maxlength=6
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

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT VALUE="#read_user.lp_fax#"  type=text name="lp_fax" size=23 maxlength=15
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
			<font size=2 color=blue face=arial>
			<B>User Name</B>


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<b>#read_user.a_user#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>Password</B>


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<!--- <CFINPUT VALUE="#read_user.a_pass#" type=text name="pword"  size=20 maxlength=30
				style="font-size: 12;
				font-family: verdana;
				font-style: bold;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" > --->

		<B>#read_user.a_pass#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>Access Level  </B>


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
					<CFIF #read_user.a_access_level# EQ "0">
						<B>User</B>
					<CFELSE>
						<B>Admin</B>
					</CFIF>


		</td>
	</tr>
	<input type="hidden" name="a_pass" VALUE="#read_user.a_pass#">
<input type="hidden" name="uname" VALUE="#read_user.a_user#">
<input type="hidden" name="acc_lvl" VALUE="#read_user.a_access_level#">
<input type="hidden" name="a_status" VALUE="#read_user.a_status#">

	<tr>

		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
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

