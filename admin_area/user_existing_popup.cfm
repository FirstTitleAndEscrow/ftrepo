
		<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		
			SELECT *
			FROM companies
			WHERE ID = #URL.comp_ID#
		
		</CFQUERY>
		

		<CFQUERY datasource="#request.dsn#" NAME="read_users">
		
			SELECT *
			FROM users
			WHERE a_user = '#uname#' AND comp_ID = #URL.comp_ID#
		
		</CFQUERY>



				<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
				<HTML>
				<HEAD>
				<TITLE>First Title Services Admin</TITLE>

				</HEAD>

				<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>

<CFOUTPUT>

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
						<td width=498 align=left valign=top bgcolor=white>
							<font size=2 color=blue face=arial>Existing User<font size=2 color=black face=arial>
							<p>
							Mortgage Company/Client:<br>
							<CENTER>
							<p><font size=2 color=blue face=arial>
							<B>#read_companies.company#</B>
							</CENTER>
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
							<b>#read_users.lp_fname#</b>
						</td>
					</tr>

					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
							<font size=2 color=black face=arial>
							Last Name
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>	
							<font size=2 color=blue face=arial>
							<b>#read_users.lp_lname#</b>
						</td>
					</tr>

					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
							<font size=2 color=black face=arial>
							Email
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>	
							<font size=2 color=blue face=arial>
							<b>#read_users.lp_email#</b>
						</td>
					</tr>	

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Phone
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read_users.lp_phone#</B>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Phone Ext.
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<B>#read_users.lp_ext#</B>
					
		
		</td>
	</tr>
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Fax
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<B>#read_users.lp_fax#</B>
					
		
		</td>
	</tr>

					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
							<font size=2 color=blue face=arial>
							<B>User Name</B>
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>	
							<font size=2 color=blue face=arial>
							<b>#read_users.uname#</b>
						</td>
					</tr>

					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
							<font size=2 color=blue face=arial>
							<B>Password</B>
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>	
							<font size=2 color=blue face=arial>
							<b>#read_users.pword#</b>
						</td>
					</tr>

					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
							<font size=2 color=blue face=arial>
							<B>Access Level</B> - 
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
					<CFIF #read_users.acc_lvl# EQ "0">
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
							<b>#read_users.lo_fname#</b>
						</td>
					</tr>

					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
							<font size=2 color=black face=arial>
							Last Name
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>	
							<font size=2 color=blue face=arial>
							<b>#read_users.lo_lname#</b>
						</td>
					</tr>

	

					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
							<font size=2 color=black face=arial>
							Email
						</td>

						<td width=237 align=left valign=top bgcolor=e6e6e6>	
							<font size=2 color=blue face=arial>
							<b>#read_users.lo_email#</b>
						</td>
					</tr>	

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Phone		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#read_users.lo_phone#</B>		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Phone Ext.	
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<B>#read_users.lo_ext#</B>		
		</td>
	</tr>
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Fax		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<B>#read_users.lo_fax#</B>		
		</td>
	</tr>

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
</CFOUTPUT>

				</BODY>
				</HTML>
