
	
	




		<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			SELECT *
			FROM users
			WHERE comp_id = #comp_id# AND ID = #user_id#
		
		</CFQUERY>
	
		<CFQUERY datasource="#request.dsn#" NAME="read_loan_officer">
		
			SELECT *
			FROM loan_officers
			WHERE ID = #lo_ID#
		
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
						 <NOBR><a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#"><img src="./images/button_home.gif" border=0></a><img src="./images/clear.gif" height=10 width=85><font size=2 color=blue face=arial>Modify Loan Officer</CENTER></NOBR><font size=2 color=black face=arial>
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

	<CFFORM METHOD=POST ACTION="./loan_offcr_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&comp_id=#read_companies.ID#&user_id=#user_id#&lo_id=#read_loan_officer.ID#">


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
			<CFINPUT VALUE="#read_loan_officer.lo_fname#" type=text name="lo_fname"  size=20 maxlength=30
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
			Last Name
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT VALUE="#read_loan_officer.lo_lname#"  type=text name="lo_lname"  size=20 maxlength=30
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
			Email
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT  VALUE="#read_loan_officer.lo_email#" type=text name="lo_email"  size=30 maxlength=160
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
			<CFINPUT VALUE="#read_loan_officer.lo_phone#"  type=text name="lo_phone"  size=23 maxlength=15
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
			Phone Ext.
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT  VALUE="#read_loan_officer.lo_ext#" type=text name="lo_ext"  size=10 maxlength=6
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
			Fax
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT VALUE="#read_loan_officer.lo_fax#" type=text name="lo_fax" size=23 maxlength=15
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
						Status 


					</td>

					<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<font size=2 color=black face=arial>
					<CFIF #read_loan_officer.a_status# EQ "0"> <font size=2 color=red face=arial>
						<NOBR><input type=radio name="a_status" VALUE="0" CHECKED> - In-Active</NOBR>
						<br><font size=2 color=green face=arial>
						<NOBR><input type=radio name="a_status"  VALUE="1"> - Active</NOBR><br>
					<CFELSE><font size=2 color=red face=arial>
						<NOBR><input type=radio name="a_status" VALUE="0"> - In-Active</NOBR><br>
						<font size=2 color=green face=arial>
						<NOBR><input type=radio name="a_status"  VALUE="1" CHECKED> - Active</NOBR><br>
					</CFIF>

					
					</td>
				</tr>
				
	<tr>		
		
		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
			<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			
	
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 face=arial>
			<a href="./user_modify_view.cfm?uid=#URL.uid#&al=1&comp_id=#comp_id#&user_id=#user_id#">Return to User</a>				
		
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


			</BODY>
			</HTML>



	
	