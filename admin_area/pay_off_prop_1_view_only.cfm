



		<CFQUERY datasource="#request.dsn#" NAME="read_prop">
		
			SELECT *
			FROM Property
			WHERE prop_id = #rec_ID#

		
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">
		
			SELECT *
			FROM companies
			WHERE ID = #read_prop.comp_ID#
		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title_co">		
			SELECT *
			FROM Title_FT_Agencies
			WHERE Title_FT_Agency_ID = 7		
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_1">		
			SELECT *
			FROM Pay_Off_Lender_1_Prop
			WHERE prop_id = #rec_ID#		
		</CFQUERY>
		

		
<CFIF #read_payoff_info_1.a_assigned_by# GT "">


		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ STARTED the Loan Pay Off Process        \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_assigning">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_payoff_info_1.a_assigned_by#
		
		</CFQUERY>		
		
		
		<CFSET user_that_started = #read_user_assigning.fname# & " " & #read_user_assigning.lname#>

		
<CFELSE>
		<CFSET user_that_started = "Not Started Yet">
</CFIF>


<CFIF #read_payoff_info_1.a_recieved_by# GT "">

		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ FINISHED the Loan Pay Off Process        \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_recieving">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_payoff_info_1.a_recieved_by#
		
		</CFQUERY>		
		
		<CFSET user_that_started = #read_user_recieving.fname# & " " & #read_user_recieving.lname#>

<CFELSE>
		<CFSET user_that_finished = "Not Finished Yet">
</CFIF>	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=521 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=521 align=center valign=top>
		
<table width=521 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=521 align=center valign=top bgcolor=e1e1e1>
		



<CFOUTPUT QUERY="read_title_co">
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
		<TR>
			<TD width=519 align=left valign=top bgcolor=white>
				<FONT SIZE=2 color=black face=arial>

					<p>

					#company#<br>
					#addr1#<br>
	<CFIF #addr2# GT "">#addr2#<br> </CFIF>
					#city#, #state# #zip_code#<br>
					Phone - #phone#<br>
					Fax - #fax#<br>
					Email - #email#
					<p>
					<FONT SIZE=3 color=black face=arial>
					<B>Payoff Request</B>
					<p>
			</tD>
		</tr>
		
</CFOUTPUT>
		

<CFOUTPUT QUERY="read_prop">
		<TR>
			<TD width=519 align=left valign=top bgcolor=white>
		<!--- =================================================================== --->			
			<table width=400 cellpadding=2 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Date: 
					</td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						#DateFormat(Now(), "dddddd mmm dd yyyy")#
					</td>
				</tr>

				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						To: 
					</td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						#polender1#
					</td>
				</tr>				

				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Via Fax @:
					</td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<b>#read_payoff_info_1.fax_to_send_to#</b>
					</td>
				</tr>
				
				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Attn: 
					</td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<b>#read_payoff_info_1.person_to_send_to#</b>
					</td>
				</tr>
				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
					</td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<B> Payoff Department</B>
					</td>
				</tr>
			</table>
		<!--- =================================================================== --->	
	</td>
</tr>

		<TR>
			<TD width=519 align=center valign=top bgcolor=white>
				<FONT SIZE=2 color=black face=arial>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
		
					<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Our Case Number:
						</TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							 <b>#read_prop.prop_id#</b>
						</TD>

					</tr>

					<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Your Loan Number:
						</TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							 <b>#read_prop.poacctno1#</b>
						</TD>

					</tr>

					<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Sellers Info:
						</TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							 <b>#read_prop.sfirstname1# #read_prop.sminame1# #read_prop.slastname1#</b><br>
				<CFIF #read_prop.sfirstname2# GT "">
							<b>#read_prop.sfirstname2# #read_prop.sminame2# #read_prop.slastname2#</b>
				</CFIF>
						</TD>

					</tr>

					<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Property Address:
						</TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<b>#read_prop.paddress#</b><br>
							<b>#read_prop.pcity#, #read_prop.pstate# <b>#read_prop.pzip#</b><br>
							<b>#read_prop.pcounty#</b>
						</TD>

					</tr>					

					<tr>
						<td width=519 colspan=2 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<p>
							<br>
							<p>
							Please fax us a payoff statement regarding the above-referenced loan, with interest calculated through 
							<FONT SIZE=2 color=black face=arial>
						<b>#read_payoff_info_1.int_calc_thru#</b>, and including a per diem interest rate.

						</TD>

					</tr>

					<tr>
						<td width=519 colspan=2 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Our Fax Number is <FONT SIZE=2 color=black face=arial>
						<b>#read_title_co.fax#</b>.

						</TD>

					</tr>

					<tr>
						<td width=519 colspan=2 align=left valign=top bgcolor=white>
							<p>
							<br>
							<p>
							
							<FONT FACE=ARIAL SIZE=2 color="black">
							Sincerly,<br>
							<b>#user_that_started#</b>
							<p>
							<br>
							<p>
							Authorization:<br>
							

						</TD>

					</tr>
</CFOUTPUT>

					
					
				</table>


		</TD>
	</TR>
		


<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->



	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	