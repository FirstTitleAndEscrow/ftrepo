
<CFPARAM NAME="cc_email_1" DEFAULT="">
<CFPARAM NAME="cc_email_2" DEFAULT="">

<CFSET ru_name = '#form.lp_fname# #form.lp_lname#'>
		<CFQUERY datasource="#request.dsn#" NAME="read_company">

			SELECT *
			FROM companies
			WHERE ID = #comp_ID#

		</CFQUERY>

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>

		<CFQUERY datasource="#request.dsn#">

			INSERT INTO users(comp_id, lp_fname, lp_lname, lp_email, a_date, a_time, a_status, lp_phone, lp_ext, lp_fax, pname, cc_email_1, cc_email_2)
			VALUES(#URL.comp_ID#, '#FORM.lp_fname#', '#FORM.lp_lname#', '#FORM.lp_email#', '#c_date#', '#c_time#', 1, '#FORM.lp_phone#', '#FORM.lp_ext#', '#FORM.lp_fax#', '#ru_name#', '#FORM.cc_email_1#', '#FORM.cc_email_2#')

		</CFQUERY>

        <CFIF #read_company.Companies_Switch# eq "1">
            <CFQUERY datasource="#request.dsn#" NAME="read_proc">
		        SELECT *
			    FROM users
			    WHERE a_date = '#c_date#' and a_time = '#c_time#'
		    </CFQUERY>

            <CFQUERY datasource="#request.dsn#">
                    INSERT INTO Companies_user(comp_id, user_id, job_title, fname, lname, username, password, Administrator, dateadded,status, cc_email_1, cc_email_2)
			        VALUES(#URL.comp_ID#,#read_proc.ID#,'Processor','#FORM.lp_fname#', '#FORM.lp_lname#','#FORM.username#','#FORM.password#','#FORM.Administrator#',getdate(),1, '#FORM.cc_email_1#', '#FORM.cc_email_2#')
            </CFQUERY>
        </CFIF>

	<CFQUERY datasource="#request.dsn#" NAME="read_proc">

			SELECT *
			FROM users
			WHERE a_date = '#c_date#' and a_time = '#c_time#'

		</CFQUERY>


			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
			<HTML>
			<HEAD>
			<TITLE>First Title Services Admin</TITLE>

			</HEAD>

			<BODY BGCOLOR="#FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



				<CENTER>
<table width=433 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>



			<table width=433 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
				<tr>
					<td width=433 align=center valign=top>

			<table width=432 cellpadding=1 cellspacing=1 border=0 bgcolor=white>


				<tr>
					<td width=432 align=center valign=top bgcolor=e2e2e2>

			<table width=431 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

			<CFOUTPUT>
				<tr>
					<td width=431 align=left valign=top bgcolor=white>
						<center><font size=2 color=blue face=arial><B>Add Loan Processor</B></CENTER><font size=2 color=black face=arial>
						<br>
						Company  - <B>#read_company.company#</B>

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

<!--- ===/ LOAN PROCESSOR INFO \=== --->

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

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#lp_fname#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Last Name


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#lp_lname#


		</td>
	</tr>
     <CFIF #read_company.companies_switch# eq "1">
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

		<td width=300 align=left valign=top bgcolor=e6e6e6>
#lp_email#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			cc. Email 1


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#cc_email_1#
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			cc. Email 2


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#cc_email_2#
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
#lp_phone#
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#lp_ext#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#lp_fax#


		</td>
	</tr>
    <CFIF #read_company.companies_switch# eq "1">
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
    </CFIF>


	</CFOUTPUT>

</table>
<table width=430 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td bgcolor=f1f1f1 width="430" align="center" valign="top">
		<cfoutput><nobr><font size=2 color=blue face=arial> Click this button to add more Loan Processors <a href="./loan_proc_add_c.cfm?comp_id=#read_company.id#"><img border=0 src="./images/button_add.gif"></A></NOBR></cfoutput><br>

	<a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a> <font size=2 color=red face=arial>(Note: After closing this window, please refresh the page)</font>
</td>	</td></tr>
	</table>

					</td>

				</tr>
			</table>

				</td>
			</tr>
			</table>



	<!---
			<CFMAIL
				TO="spape@firsttitleservices.com"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="New Loan processor added"
				TIMEOUT="600"
				type="html"
				>



				<table width=433 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
				<tr>
					<td width=433 align=center valign=top>

			<table width=432 cellpadding=1 cellspacing=1 border=0 bgcolor=white>


				<tr>
					<td width=432 align=center valign=top bgcolor=e2e2e2>

			<table width=431 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>


				<tr>
					<td width=431 align=left valign=top bgcolor=white>
						<center><font size=2 color=blue face=arial><B>Add Loan Processor</B></CENTER><font size=2 color=black face=arial>
						<br>
						Company  - <B>#read_company.company#</B>

					</td>
				</tr>


			</table>

					</td>
				</tr>

				<tr>
					<td width=431 align=center valign=top bgcolor=white>


			<table width=430 cellpadding=1 cellspacing=1 border=0 bgcolor=white>



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

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#lp_fname#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Last Name


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#lp_lname#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Email


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
#lp_email#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			cc. Email 1


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#cc_email_1#
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			cc. Email 2


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#cc_email_2#
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
#lp_phone#
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#lp_ext#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax


		</td>

		<td width=300 align=left valign=top bgcolor=e6e6e6>
			#lp_fax#


		</td>
	</tr>




</table>
<table width=430 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td bgcolor=f1f1f1 width="430" align="center" valign="top">

  <font face="arial" size="2" color="black">To modify this entry click here > </font> <a href="https://#cgi.server_name#/admin_area/user_modify_view.cfm?uid=60&al=1&comp_id=#comp_id#&user_id=#read_proc.id#"><img src="https://#cgi.server_name#/admin_area/images/button_modify.gif" border=0></a></td>	</td></tr>
</td>	</td></tr>
	</table>

					</td>

				</tr>
			</table>

				</td>
			</tr>
			</table>


			</cfmail>

			 --->

				</td>
			</tr>

			</table>
</center>


			</BODY>
			</HTML>