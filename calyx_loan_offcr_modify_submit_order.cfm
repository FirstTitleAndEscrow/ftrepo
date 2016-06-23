<CFPARAM NAME="emp" DEFAULT="0">

		<CFQUERY datasource="#request.dsn#" NAME="read_user">

			SELECT *
			FROM Loan_Officers
			WHERE id = #Form.user_id_1#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			WHERE ID = #read_user.comp_ID#

		</CFQUERY>

        <CFIF #read_companies.companies_switch# eq "1">
         <!---First we need to make sure there is a row for this person in
              Companies_User --->
         <CFQUERY datasource="#request.dsn#" NAME="read_user">
            Select *
            from Companies_User where
            fname = '#FORM.lo_fname#'
            and lname = '#FORM.lo_lname#'
            and job_title = 'officer'
        </CFQUERY>
        <CFIF #read_company.companies_switch# eq "1">
    <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
        SELECT *
        FROM companies_user
        WHERE ID = #emp#
    </CFQUERY>
    <CFSET emp = #read_company_user.ID#>
</CFIF>


        <CFIF #Read_User.RecordCount# eq "0" >
            <CFQUERY datasource="#request.dsn#" NAME="read_user">
                Select *
                from Loan_Officers where
                WHERE id = #Form.user_id_1#
            </CFQUERY>

            <!---Then do an insert because it is not there--->
            <CFQUERY datasource="#request.dsn#">
                INSERT INTO Companies_user(comp_id, user_id, job_title, fname, lname, username, password, Administrator, dateadded,status)
			    VALUES(#URL.comp_ID#,#read_user.ID#,'Officer','#FORM.lo_fname#', '#FORM.lo_lname#','#FORM.username#','#FORM.password#','#FORM.Administrator#',getdate(),1)
            </CFQUERY>
       <CFELSE>
            <!---Update what exists--->
            <CFQUERY datasource="#request.dsn#" NAME="read_user">
                Select *
                from Loan_Officers
                WHERE id = #Form.user_id_1#
            </CFQUERY>

            <CFQUERY datasource="#request.dsn#">
                update Companies_User
		            Set fname = '#FORM.lo_fname#',
			        lname = '#FORM.lo_lname#',
			        username = '#Form.username#',
			        password = '#FORM.password#',
			        Administrator = '#FORM.Administrator#',
			        status = '#FORM.status#'
			        where user_id = #read_user.ID# and job_title = 'Officer'
            </CFQUERY>
        </CFIF>
</CFIF>



			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
			<HTML>
			<HEAD>
			<TITLE><cfoutput>#session.site.short_name#</cfoutput> Services Admin</TITLE>

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
						User is  - <B>#read_user.lo_fname# #read_user.lo_lname#</B>
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
    <CFIF #read_companies.Companies_Switch# eq 1>
        	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			username
		</td>

		<td width=201 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.username#</b>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			password
		</td>

		<td width=201 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FORM.password#</b>
		</td>
	</tr>
    </CFIF>
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


