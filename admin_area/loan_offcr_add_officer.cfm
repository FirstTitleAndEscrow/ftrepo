	
<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE ID = '#comp_id#'
ORDER BY company ASC
</CFQUERY>

		



			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
			<HTML>
			<HEAD>
			<TITLE>First Title Services Admin</TITLE>

			</HEAD>

			<BODY BGCOLOR=white TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



			<CENTER>

			<table width=432 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
				<tr>
					<td width=432 align=center valign=top>

			<table width=432 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<!--- <tr>
					<td width=432 align=center valign=top bgcolor=e1e1e1>
						<IMG SRC="./images/title_01.gif">

					</td>
				</tr> --->

				<tr>
					<td width=432 align=center valign=top bgcolor=e2e2e2>
						<FONT SIZE=2 color=black face=arial>

			<table width=432 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

			<CFOUTPUT>
				<tr>
					<td width=432 align=left valign=top bgcolor=white>
					
						Company - <B>#read_company.company#</B>
						<p>
					
					</td>
				</tr>
			</CFOUTPUT>	

			</table>

					</td>
				</tr>

				<tr>
					<td width=432 align=center valign=top bgcolor=white>


			<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

<CFOUTPUT>

	<CFFORM METHOD=POST ACTION="./loan_offcr_add_submit_c.cfm?comp_id=#read_company.ID#">


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
			<CFINPUT type=text name="lo_fname"  size=20 maxlength=30
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
			<CFINPUT  type=text name="lo_lname"  size=20 maxlength=30
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
			<CFINPUT  type=text name="lo_email"  size=30 maxlength=160
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
			<CFINPUT  type=text name="lo_phone"  size=23 maxlength=15
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
			<CFINPUT  type=text name="lo_ext"  size=10 maxlength=6
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
			<CFINPUT type=text name="lo_fax" size=23 maxlength=15
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
		
		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
			<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
					
		
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



	