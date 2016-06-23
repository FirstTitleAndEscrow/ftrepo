



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


		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">		
			SELECT *
			FROM Pay_Off_Lender_2_Prop
			WHERE prop_id = #rec_ID#		
		</CFQUERY>
		
		
<CFIF #read_payoff_info_2.a_assigned_by# GT "">


		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ STARTED the Loan Pay Off Process        \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_assigning">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_payoff_info_2.a_assigned_by#
		
		</CFQUERY>		
		
		
		<CFSET user_that_started = #read_user_assigning.fname# & " " & #read_user_assigning.lname#>

		
<CFELSE>
		<CFSET user_that_started = "Not Started Yet">
</CFIF>


<CFIF #read_payoff_info_2.a_recieved_by# GT "">

		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ FINISHED the Loan Pay Off Process        \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_recieving">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_payoff_info_2.a_recieved_by#
		
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
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
		
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Loan Payoff Request [Lender 2]</B></CENTER>
			</TD>
		</TR>
<CFOUTPUT>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>
		
		
		<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">
		
<!--- ================================================================ --->
<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person Obtaining Info - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_started#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Started - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_payoff_info_2.a_assigned_date#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Started - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_payoff_info_2.a_assigned_time#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person Completing Info - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_finished#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Completed - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_payoff_info_2.a_recieved_date#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Completed - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_payoff_info_2.a_recieved_time#</B>
			</td>
		</tr>
</table>
<!--- =========================================================== --->

</CFOUTPUT>


<CFOUTPUT QUERY="read_title_co">
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
		<TR>
			<TD width=519 align=left valign=top bgcolor=blue>
				<FONT SIZE=3 color=white face=arial>
				Our Order Number is... <b>#read_prop.prop_id#</b>
			</tD>
		</tr>

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
		
<CFFORM NAME="frm" ACTION="./pay_off_prop_2_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" METHOD=POST>

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
						#polender2#
					</td>
				</tr>				

				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Via Fax @:
					</td>
					<TD width=300 align=left valign=top bgcolor=white>
						<CFINPUT type="text" NAME="fax_to_send_to" SIZE=20 MAXLENGTH=25 
							VALUE="#read_payoff_info_2.fax_to_send_to#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
					</td>
				</tr>
				
				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Attn: 
					</td>
					<TD width=300 align=left valign=top bgcolor=white>
						<CFINPUT type="text" NAME="person_to_send_to" SIZE=35 MAXLENGTH=90 
							VALUE="#read_payoff_info_2.person_to_send_to#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
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
							 <b>#read_prop.poacctno2#</b>
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
							Please fax us a payoff statement regarding the above-referenced loan, with interest calculated through <CFINPUT type="text" NAME="int_calc_thru" SIZE=40 MAXLENGTH=200 
									VALUE="#read_payoff_info_2.int_calc_thru#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: E4E3E3; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" >, and including a per diem interest rate.

						</TD>

					</tr>

					<tr>
						<td width=519 colspan=2 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Our Fax Number is <b>#read_title_co.fax#</b>..

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
					<tr>
						<td width=519 colspan=2 align=right valign=top bgcolor=white>
							<p>
							<br>
							<p>
							<input type=image src="./images/button_submit.gif" border=0>
							
		</CFFORM>
							

						</TD>

					</tr>
					
					
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
	
	
	