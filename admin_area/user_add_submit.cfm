
<CFPARAM NAME="cc_email_1" DEFAULT="">
<CFPARAM NAME="cc_email_2" DEFAULT="">

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		
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
<nobr>	<font size=2 color=blue face=arial> Click this button to add more Loan Officers <a href="./loan_offcr_add.cfm?uid=#URL.uid#&al=1&comp_id=#read_user.comp_id#&user_id=#read_user.id#"><img border=0 src="./images/button_add.gif"></A>&nbsp;&nbsp;&nbsp;&nbsp;</NOBR>
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


				</BODY>
				</HTML>



	
	