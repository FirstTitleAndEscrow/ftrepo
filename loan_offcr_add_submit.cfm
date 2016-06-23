
<CFPARAM NAME="cc_email_1" DEFAULT="">
<CFPARAM NAME="cc_email_2" DEFAULT="">

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			WHERE ID = #comp_ID#

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_company">

			SELECT *
			FROM companies
			WHERE ID = #comp_ID#

		</CFQUERY>

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>

		<CFQUERY datasource="#request.dsn#">

			INSERT INTO users(comp_id, a_user, a_pass, lp_fname, lp_lname, lp_email, a_access_level, a_date, a_time, a_admin_id, a_status, lp_phone, lp_ext, lp_fax, lo_fname, lo_lname, lo_email, lo_phone, lo_ext, lo_fax, cc_email_1, cc_email_2)
			VALUES(#URL.comp_ID#, '#FORM.uname#', '#FORM.pword#', '#FORM.lp_fname#', '#FORM.lp_lname#', '#FORM.lp_email#', #FORM.acc_lvl#, '#c_date#', '#c_time#', #URL.uid#, 1, '#FORM.lp_phone#', '#FORM.lp_ext#', '#FORM.lp_fax#', '#FORM.lo_fname#', '#FORM.lo_lname#', '#FORM.lo_email#', '#FORM.lo_phone#', '#FORM.lo_ext#', '#FORM.lo_fax#', '#cc_email_1#', '#cc_email_2#')

		</CFQUERY>



    <CFQUERY datasource="#request.dsn#" NAME="read_time">

			SELECT *
			FROM users
			WHERE a_time = '#c_time#' AND a_date = '#c_date#'
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#">

			INSERT INTO loan_officers(userid, a_date, a_time, a_admin_id, a_status,  lo_fname, lo_lname, lo_email, lo_phone, lo_ext, lo_fax)
			VALUES(#read_time.id#, '#DateFormat(Now(), "mm/dd/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', #URL.uid#, 1, '#FORM.lo_fname#', '#FORM.lo_lname#', '#FORM.lo_email#', '#FORM.lo_phone#', '#FORM.lo_ext#', '#FORM.lo_fax#')

        </CFQUERY>


        <CFQUERY datasource="#request.dsn#" NAME="read_user">

			SELECT *
			FROM users
			WHERE comp_id = #read_companies.id# AND ID = #read_time.id#

		</CFQUERY>

        <CFQUERY datasource="#request.dsn#" NAME="read_loan_officer">

			SELECT *
			FROM Loan_Officers
			WHERE a_time = '#c_time#' AND a_date = '#c_date#'

		</CFQUERY>

        <CFIF #read_company.companies_switch# eq "1">
        <CFIF #Form.Administrator# eq "0" >
            <CFSET username = "null">
            <cfset password = "null">
        <CFELSE>
            <CFSET username = "'#Form.username#'">
            <cfset password = "'#Form.password#'">
        </CFIF>

        <CFQUERY datasource="#request.dsn#">
	    INSERT INTO companies_user(comp_id, user_ID, job_title, fname, lname, username, password, administrator, dateadded,status)
			VALUES(#URL.comp_ID#, #read_loan_officer.id#, 'Officer','#FORM.lo_fname#','#FORM.lo_lname#', #username#, #password#, #form.administrator#,getdate(),1)
	    </CFQUERY>
    </CFIF>





			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
			<HTML>
			<HEAD>
			<TITLE><cfoutput>#session.site.short_name#</cfoutput> Admin</TITLE>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
			</HEAD>

			<BODY BGCOLOR="#FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



				<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
	<tr><td align="right" valign="center">
  <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
&nbsp;&nbsp;</td>
  <td align="right" valign="center"><input type="text" name="number" size=10></td>
  <td align="right" valign="center">&nbsp;<input type="image" src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
  							</tr><tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr></table>
 </cfFORM>
</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>


</td></tr></tbody></table>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>
<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
		<center>
		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')';return false;"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center>

			<center>


			<table width=433 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
				<tr>
					<td width=433 align=center valign=top>

			<table width=432 cellpadding=1 cellspacing=1 border=0 bgcolor=white>


				<tr>
					<td width=432 align=center valign=top bgcolor=e2e2e2>

			<table width=431 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

			<CFOUTPUT>
				<tr>
					<td width=431 align=center valign=top bgcolor=white>
						<CENTER><font size=2 color=blue face=arial>Processor/Loan Officer were Added</CENTER></NOBR><font size=2 color=black face=arial>
						<br>
					<NOBR><a href="./client_acct_mgt.cfm?user_id_1=#URL.user_id_1#&lo_id=#URL.lo_id#"><img src="./images/button_home.gif" border=0></a><img src="./images/clear.gif" height=10 width=85><font size=2 color=blue face=arial>Add Loan Officer</CENTER></NOBR><font size=2 color=black face=arial>
						<p>
						User is  - <B>#read_user.lp_fname# #read_user.lp_lname#</B>
						<br>
						Company - <B>#read_companies.company#</B>
						<br>

					</td>
				</tr>
			</CFOUTPUT>

			</table>


			<table width=438 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
					<tr>
						<td width=438 align=center valign=top bgcolor=white>
							<font size=2 color=green face=arial>Add User<font size=2 color=black face=arial>
							<p>
							The User has been added as :<br>
					<CFIF #FORM.acc_lvl# EQ "0">
							<b>User</b> - access level
					<CFELSE>
							<b>Admin</b> - access level
					</CFIF>
							<br>
							<B>#read_companies.company#</B> - mortgage company
							<p>
						</td>
					</tr>


				</table>

						</td>
					</tr>

					<tr>
						<td width=439 align=center valign=top bgcolor=white>


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
							<b>#FORM.pword#</b>
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


<!--- ===/ LOAN OFFICER INFO \=== --->

	<tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			Loan <B>Officer</B> Information :

		</td>
	</tr>


					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							First Name
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#FORM.lo_fname#</b>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							Last Name
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#FORM.lo_lname#</b>
						</td>
					</tr>



					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							Email
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#FORM.lo_email#</b>
						</td>
					</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#FORM.lo_phone#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#FORM.lo_ext#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#FORM.lo_fax#</B>
		</td>
	</tr>
<tr>
<td width=367 colspan = 2 align=center valign=top bgcolor=e6e6e6>
<nobr>	<font size=2 color=blue face=arial> Click this button to add more Loan Officers <a href="./loan_offcr_add_c.cfm?user_id_1=#URL.user_id_1#&lo_id=#URL.lo_id#&comp_id=#read_user.comp_id#&user_id=#read_user.id#"><img border=0 src="./images/button_add.gif"></A>&nbsp;&nbsp;&nbsp;&nbsp;</NOBR>
		</td></tr>
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

		</center>
				</td>
			</tr>
		<center>
			<tr><td width=780 align=center valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>
</center>
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

