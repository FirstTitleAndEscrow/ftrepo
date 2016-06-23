		<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="lp_fname" DEFAULT="">
<CFPARAM NAME="lp_lname" DEFAULT="">
<CFPARAM NAME="lp_email" DEFAULT="">
<CFPARAM NAME="lp_phone" DEFAULT="">
<CFPARAM NAME="lp_ext" DEFAULT="">
<CFPARAM NAME="lp_fax" DEFAULT="">
<CFPARAM NAME="status" DEFAULT="">
<CFPARAM NAME="username" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="user_id" DEFAULT="">
<CFPARAM NAME="Administrator" DEFAULT="">
<CFPARAM NAME="cc_email_1" DEFAULT="">
<CFPARAM NAME="cc_email_2" DEFAULT="">


			<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			WHERE ID = #comp_ID#

		</CFQUERY>




		          <CFQUERY datasource="#request.dsn#" NAME="user">
                Select *
                from First_Admin
                WHERE id = #URL.uid#
            </CFQUERY>



		    	<cfif #user.lname# eq "Hays" OR  #user.lname# eq "Elliott">



<CFMAIL
TO="spape@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Loan Processor info change request"
TIMEOUT="600"
type="HTML"
>


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
						<font size=2 color=blue face=arial>Modify Loan Processor Request<font size=2 color=black face=arial>
						<p>
						Company - <B>#read_companies.company#</B>
						<p><font size=2 color=black face=arial>
						Loan Processor is requested to be modified as shown below.

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

						</td>
					</tr>



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
							<b>#lp_fname#</b>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							Last Name
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#lp_lname#</b>
						</td>
					</tr>
                    <CFIF #read_companies.companies_switch# eq "1">
        <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			username


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#username#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			password


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#password#


		</td>
	</tr>
    </CFIF>
					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							Email
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#lp_email#</b>
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
			<B>#lp_phone#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#lp_ext#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#lp_fax#</B>


		</td>
	</tr>
         <CFIF #read_companies.companies_switch# eq "1">
        <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Administrator


		</td>
        <td width=300 align=left valign=top bgcolor=e6e6e6>
			<CFIF #Administrator# eq 1>
                Yes
            <CFELSE>
                No
		    </CFIF>
		</td>
        </tr>
        <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Status
		</td>
        <td width=300 align=left valign=top bgcolor=e6e6e6>
			<CFIF #Status# eq 1>
                Active
            <CFELSE>
                Inactive
		    </CFIF>
						</td>
        </tr>
     </CFIF>






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
			<font size=2 color=green face=arial><B>Click <NOBR><a href="https://#CGI.SERVER_NAME#/admin_area/user_modify_submit.cfm?uid=59&al=1&comp_id=#comp_id#&lp_fname=#lp_fname#&lp_fname=#lp_lname#&lp_email=#lp_email#&lp_phone=#lp_phone#&cc_email_1=#cc_email_1#&cc_email_2=#cc_email_2#&lp_ext=#lp_ext#&lp_fax=#lp_fax#&status=#status#&username=#username#&password=#password#&user_id=#user_id#&Administrator=#Administrator#">HERE</a></NOBR>
to allow the modification</B>
		</td>
	</tr>
</table>




	</cfmail>


		<table width=498>
<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>An email has been sent to the Administrator to process your request</B>
		</td>
	</tr>
</table>



	<cfelse>

				<CFQUERY datasource="#request.dsn#">
			UPDATE users
			SET
			lp_fname = '#lp_fname#',
			lp_lname = '#lp_lname#',
			lp_email = '#lp_email#',
			cc_email_1 = '#cc_email_1#',
			cc_email_2 = '#cc_email_2#',
			lp_phone = '#lp_phone#',
			lp_ext = '#lp_ext#',
			lp_fax = '#lp_fax#',
			m_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			m_time = '#TimeFormat(Now(), "HH:mm:ss")#',
			m_admin_id = #URL.uid#
			WHERE ID = #user_id#
		</CFQUERY>

  <CFIF #read_Companies.Companies_Switch# eq "1">
              <CFQUERY datasource="#request.dsn#">
                update Companies_User
		            Set fname = '#lp_fname#',
			        lname = '#lp_lname#',
			        username = '#username#',
			        password = '#password#',
			        Administrator = '#Administrator#',
			        status = '#status#'
			        where user_id = #user_id# and job_title = 'Processor'
            </CFQUERY>
        </CFIF>



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
						<font size=2 color=blue face=arial>Modify User<font size=2 color=black face=arial>
						<p>
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
							<b>#lp_fname#</b>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							Last Name
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#lp_lname#</b>
						</td>
					</tr>
                    <CFIF #read_companies.companies_switch# eq "1">
        <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			username


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#username#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			password


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#password#


		</td>
	</tr>
    </CFIF>
					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							Email
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#lp_email#</b>
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
			<B>#lp_phone#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#lp_ext#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#lp_fax#</B>


		</td>
	</tr>
         <CFIF #read_companies.companies_switch# eq "1">
        <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Administrator


		</td>
        <td width=300 align=left valign=top bgcolor=e6e6e6>
			<CFIF #Administrator# eq 1>
                Yes
            <CFELSE>
                No
		    </CFIF>
		</td>
        </tr>
        <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Status
		</td>
        <td width=300 align=left valign=top bgcolor=e6e6e6>
			<CFIF #Status# eq 1>
                Active
            <CFELSE>
                Inactive
		    </CFIF>
						</td>
        </tr>
     </CFIF>






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


				</BODY>
				</HTML>


</cfif>
