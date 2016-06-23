<CFSET rlo_name = '#FORM.lo_fname# #FORM.lo_lname#'>
		<CFQUERY datasource="#request.dsn#">

			INSERT INTO loan_officers(comp_id, a_date, a_time, a_status,  lo_fname, lo_lname, lo_email, lo_phone, lo_ext, lo_fax, oname)
			VALUES(#URL.comp_ID#, '#DateFormat(Now(), "mm/dd/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 1, '#FORM.lo_fname#', '#FORM.lo_lname#', '#FORM.lo_email#', '#FORM.lo_phone#', '#FORM.lo_ext#', '#FORM.lo_fax#', '#rlo_name#')

		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_offcr">

			SELECT *
			FROM loan_officers
			WHERE a_date = '#DateFormat(Now(), "mm/dd/yyyy")#' and a_time = '#TimeFormat(Now(), "HH:mm:ss")#'

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			WHERE ID = #comp_ID#

		</CFQUERY>

        <CFIF #read_Companies.Companies_Switch# eq "1">
            <CFQUERY datasource="#request.dsn#">
                    INSERT INTO Companies_user(comp_id, user_id, job_title, fname, lname, username, password, Administrator, dateadded,status)
			        VALUES(#URL.comp_ID#,#read_offcr.ID#,'Officer','#FORM.lo_fname#', '#FORM.lo_lname#','#FORM.username#','#FORM.password#','#FORM.Administrator#',getdate(),1)
            </CFQUERY>
        </CFIF>



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
						<center><font size=2 color=blue face=arial><B>Add Loan Officer</B></CENTER><font size=2 color=black face=arial>
						<br>
						Company  - <B>#read_companies.company#</B>

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
			<b>#FORM.lo_phone#</b>

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.lo_ext#</b>

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.lo_fax#</b>

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>


		</td>


</table>

</CFOUTPUT>
					</td>

				</tr>
			</table>
<table width=430 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td bgcolor=f1f1f1 width="430" align="center" valign="top">
		<cfoutput><nobr><font size=2 color=blue face=arial> Click this button to add more Loan Officers <a href="./loan_offcr_add_c.cfm?comp_id=#read_companies.id#"><img border=0 src="./images/button_add.gif"></A></NOBR></cfoutput><br>

	<a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a> <font size=2 color=red face=arial>(Note: After closing this window, please refresh the page)</font>
</td>	</td></tr>
	</table>
					</td>

				</tr>
			</table>

				</td>
			</tr>
			</table>



				<CFMAIL
				TO="spape@firsttitleservices.com"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="New Loan officer added"
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
						<center><font size=2 color=blue face=arial><B>Add Loan Officer</B></CENTER><font size=2 color=black face=arial>
						<br>
						Company  - <B>#read_companies.company#</B>

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
			<b>#FORM.lo_phone#</b>

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone Ext.


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.lo_ext#</b>

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.lo_fax#</b>

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>


		</td>


</table>


					</td>

				</tr>
			</table>
<table width=430 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td bgcolor=f1f1f1 width="430" align="center" valign="top">

<font face="arial" size="2" color="black">To modify this entry click here > </font> <a href="https://#cgi.server_name#/admin_area/loan_officer_modify_view.cfm?uid=60&al=1&comp_id=#comp_id#&proc_id=#read_offcr.id#"><img src="https://#cgi.server_name#/admin_area/images/button_modify.gif" border=0></a></td>	</td></tr>
</table>
					</td>

				</tr>
			</table>

				</td>
			</tr>
			</table>
</cfmail>



				</td>
			</tr>

			</table>
</center>


			</BODY>
			</HTML>

