
	
	



		<CFQUERY datasource="#request.dsn#">
		
			UPDATE loan_officers
			SET lo_fname = '#FORM.lo_fname#', 
			lo_lname = '#FORM.lo_lname#', 
			lo_email = '#FORM.lo_email#', 
			lo_phone = '#FORM.lo_phone#',
			lo_ext = '#FORM.lo_ext#',
			lo_fax = '#FORM.lo_fax#', 
			a_status = #FORM.a_status#,
			m_date = '#DateFormat(Now(), "mm/dd/yyyy")#', 
			m_time = '#TimeFormat(Now(), "HH:mm:ss")#', 
			m_admin_id = #URL.uid#
			WHERE ID = #lo_id#
		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			SELECT *
			FROM users
			WHERE comp_id = #comp_id# AND ID = #user_id#
		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		
			SELECT *
			FROM companies
			WHERE ID = #comp_ID#
		
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
						<NOBR><a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#"><img src="./images/button_home.gif" border=0></a><img src="./images/clear.gif" height=10 width=85><font size=2 color=blue face=arial>Loan Officer Modified</CENTER></NOBR><font size=2 color=black face=arial>
						<p>
						User is  - <B>#read_user.lp_fname# #read_user.lp_lname#</B>
						<p>
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

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<a href="./user_modify_view.cfm?uid=#URL.uid#&al=1&comp_id=#comp_id#&user_id=#user_id#">Return to User</a>				
		
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

				</td>
			</tr>
			</table>


			</BODY>
			</HTML>



	