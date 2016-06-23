<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="lo_fname" DEFAULT="">
<CFPARAM NAME="lo_lname" DEFAULT="">
<CFPARAM NAME="lo_email" DEFAULT="">
<CFPARAM NAME="lo_phone" DEFAULT="">
<CFPARAM NAME="lo_ext" DEFAULT="">
<CFPARAM NAME="lo_fax" DEFAULT="">
<CFPARAM NAME="status" DEFAULT="">
<CFPARAM NAME="username" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="officer_id" DEFAULT="">
<CFPARAM NAME="Administrator" DEFAULT="">

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			WHERE ID = #comp_ID#

		</CFQUERY>

         <CFQUERY datasource="#request.dsn#" NAME="read_user">
                Select *
                from Loan_Officers
                WHERE id = #url.officer_id#
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
Subject="Loan Officer info change request"
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
						<font size=2 color=blue face=arial>Loan Officer Modify Request <font size=2 color=black face=arial>
						<p>
						Company - <B>#read_companies.company#</B>
						<p><font size=2 color=black face=arial>
						Loan Officer is requested to be modified as shown below.

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
							<b>#lo_fname#</b>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							Last Name
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#lo_lname#</b>
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
							<b>#lo_email#</b>
						</td>
					</tr>




	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#lo_phone#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#lo_ext#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#lo_fax#</B>


		</td>
	</tr><CFIF #read_companies.companies_switch# eq "1">
    <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Administrator


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B><CFIF #Administrator# eq "1">Yes<cfelse>NO</CFIF></B>


		</td>
	</tr>
     <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
		<font size=2 color=black face=arial>
	Status
 </td>
  <td width=300 align=left valign=top bgcolor=e6e6e6>
 <font size=2 color=black face=arial>
     <CFIF  #Status# eq 1>
	Active
  <CFELSE>
  Inactive
      </CFIF></font>
   </TD>
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
			<font size=2 color=green face=arial><B>Click <NOBR><a href="https://#CGI.SERVER_NAME#/admin_area/loan_officer_modify_submit.cfm?uid=59&al=1&comp_id=#comp_id#&lo_fname=#lo_fname#&lo_fname=#lo_lname#&lo_email=#lo_email#&lo_phone=#lo_phone#&lo_ext=#lo_ext#&lo_fax=#lo_fax#&status=#status#&username=#username#&password=#password#&officer_id=#officer_id#&Administrator=#Administrator#">HERE</a></NOBR>
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

			UPDATE loan_officers
			SET
			lo_fname = '#lo_fname#',
			lo_lname = '#lo_lname#',
			lo_email = '#lo_email#',
			lo_phone = '#lo_phone#',
			lo_ext = '#lo_ext#',
			lo_fax = '#lo_fax#',
			m_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			m_time = '#TimeFormat(Now(), "HH:mm:ss")#',
			m_admin_id = #URL.uid#
			WHERE ID = #officer_id#

		</CFQUERY>


		            <CFIF #read_companies.companies_switch# eq "1">
                <CFQUERY datasource="#request.dsn#">
                    update Companies_User
		                Set fname = '#lo_fname#',
			            lname = '#lo_lname#',
			            username = '#username#',
			            password = '#password#',
			            Administrator = '#Administrator#',
			            status = '#status#'
			            where user_id = #url.officer_id# and job_title = 'Officer'
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
						<font size=2 color=blue face=arial>Modify Loan Officer<font size=2 color=black face=arial>
						<p>
						Company - <B>#read_companies.company#</B>
						<p><font size=2 color=black face=arial>
						Loan Officer has been modified as shown below.

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
							<b>#lo_fname#</b>
						</td>
					</tr>

					<tr>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
							<font size=2 color=black face=arial>
							Last Name
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>
							<font size=2 color=blue face=arial>
							<b>#lo_lname#</b>
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
							<b>#lo_email#</b>
						</td>
					</tr>




	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#lo_phone#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#lo_ext#</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#lo_fax#</B>


		</td>
	</tr><CFIF #read_companies.companies_switch# eq "1">
    <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Administrator


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B><CFIF #Administrator# eq "1">Yes<cfelse>NO</CFIF></B>


		</td>
	</tr>
     <tr>
		                                                                    <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                                    <font size=2 color=black face=arial>
			                                                                    Status
		                                                                    </td>
                                                                            <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                                <font size=2 color=black face=arial>
                                                                            <CFIF  #Status# eq 1>
                                                                            	Active
                                                                            <CFELSE>
                                                                                Inactive
                                                                            </CFIF></font>
                                                                            </TD>
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
