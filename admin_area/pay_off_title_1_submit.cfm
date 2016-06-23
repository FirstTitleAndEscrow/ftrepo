<!--- <cfset objChase = CreateObject('component','cfc.chaseRealEC')> --->
<cfparam name="fax_to_send_to" default="">

<CFQUERY datasource="#request.dsn#" name="record_check">	
Select * from Pay_Off_Lender_1_Title
WHERE Title_id = #rec_ID#
</cfquery>
<cfif record_check.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" name="create_record">	
Insert Into Pay_Off_Lender_1_Title
(title_id)
Values
(#rec_ID#)
</cfquery>
</cfif>

		<CFQUERY datasource="#request.dsn#">		
			UPDATE Pay_Off_Lender_1_Title
			SET 
			a_Assigned_by = #uid#,
			a_Assigned_Date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_Assigned_Time = '#TimeFormat(Now(), "HH:mm:ss")#',
			fax_to_send_to = '#fax_to_send_to#',
			person_to_send_to = '#person_to_send_to#',
			int_calc_thru = '#int_calc_thru#'
			WHERE Title_id = #rec_ID#		
		



	</CFQUERY>

	
<!--- <cfset objChase.processEvent(eventCode=725, productCode=29, title_id=#rec_id#, payoffNO=1)> --->


		<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">
		
			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#
		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title_co">		
			SELECT *
			FROM Title_FT_Agencies
			WHERE Title_FT_Agency_ID = 7		
		</CFQUERY>

		
		
		

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_1">		
			SELECT *
			FROM Pay_Off_Lender_1_Title
			WHERE Title_ID = #rec_ID#		
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
		
		<CFSET user_that_finished = #read_user_recieving.fname# & " " & #read_user_recieving.lname#>

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
				<CENTER><B>Loan Payoff Request [Lender 1]</B></CENTER>
			</font></TD>
		</TR>
<CFOUTPUT>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>
		
		
		<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
		
<!--- ================================================================ --->
<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person Obtaining Info - 
			</font></td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_started#</B>
			</font></td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Started - 
			</font></td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_payoff_info_1.a_assigned_date#</B>
			</font></td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Started - 
			</font></td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_payoff_info_1.a_assigned_time#</B>
			</font></td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person Completing Info - 
			</font></td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_finished#</B>
			</font></td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Completed - 
			</font></td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_payoff_info_1.a_recieved_date#</B>
			</font></td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Completed - 
			</font></td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_payoff_info_1.a_recieved_time#</B>
			</font></td>
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
				Our Order Number is... <b>#read_title.title_id#</b>
			</font></tD>
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
			</font></font></tD>
		</tr>
		
</CFOUTPUT>

<CFOUTPUT QUERY="read_title">
		<TR>
			<TD width=519 align=left valign=top bgcolor=white>
		<!--- =================================================================== --->			
			<table width=400 cellpadding=2 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Date: 
					</font></td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						#DateFormat(Now(), "dddddd mmm dd yyyy")#
					</font></td>
				</tr>

				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						To: 
					</font></td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						#polender1#
					</font></td>
				</tr>				

				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Via Fax @:
					</font></td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial><b>#read_payoff_info_1.fax_to_send_to#</b>
					</font></td>
				</tr>
				
				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Attn: 
					</font></td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial><b>#read_payoff_info_1.person_to_send_to#</b>
					</font></td>
				</tr>
				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial> 
					</font></td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<B> Payoff Department</B>
					</font></td>
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
						</font></TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							 <b>#read_title.title_id#</b>
						</font></TD>

					</tr>

					<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Your Loan Number:
						</font></TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							 <b>#read_title.poacctno1#</b>
						</font></TD>

					</tr>
<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Borrower's SS##: 
						</font></TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							 <b>#Mid(read_title.bssn1,1,3)#-#Mid(read_title.bssn1,4,2)#-#Mid(read_title.bssn1,6,4)#</b>
						</font></TD>

					</tr>
					<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Sellers Info:
						</font></TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							 <b>#read_title.sfirstname1# #read_title.sminame1# #read_title.slastname1#</b><br>
				<CFIF #read_title.sfirstname2# GT "">
							<b>#read_title.sfirstname2# #read_title.sminame2# #read_title.slastname2#</b>
				</CFIF>
						</font></TD>

					</tr>

					<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Property Address:
						</font></TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<b>#read_title.paddress#</b><br>
							<b>#read_title.pcity#, #read_title.pstate# <b>#read_title.pzip#</b><br>
							<b>#read_title.pcounty#</b>
						</b></font></TD>

					</tr>					

					<tr>
						<td width=519 colspan=2 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<p>
							<br>
							<p>
							Please fax us a payoff statement regarding the above-referenced loan, with interest calculated through <b>#read_payoff_info_1.int_calc_thru#</b>, and including a per diem interest rate.

						</font></TD>

					</tr>

					<tr>
						<td width=519 colspan=2 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">							
							Our Fax Number is <b>#read_title_co.fax#</b>..

						</font></TD>

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
							

						</font></TD>

					</tr>
</font></CFOUTPUT>

					
					
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
	
	
	
	
	
<!--- begin EMAIL --->

<cfif Trim(form.email_to_send_to) NEQ "">
<CFMAIL 
TO="#form.email_to_send_to#"
FROM="#read_title_co.email#"
Subject="Payoff Request - Order: #read_title.title_id#"
TIMEOUT="600"
type="HTML"
>
<table>
<CFLOOP QUERY="read_title_co">
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
		<TR>
			<TD width=519 align=left valign=top bgcolor=blue>
				<FONT SIZE=3 color=white face=arial>
				Our Order Number is... <b>#read_title.title_id#</b>
			</font></tD>
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
			</font></font></tD>
		</tr>
		
</CFLOOP>
<CFLOOP QUERY="read_title">
		<TR>
			<TD width=519 align=left valign=top bgcolor=white>
		<!--- =================================================================== --->			
			<table width=400 cellpadding=2 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Date: 
					</font></td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						#DateFormat(Now(), "dddddd mmm dd yyyy")#
					</font></td>
				</tr>

				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						To: 
					</font></td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						#polender1#
					</font></td>
				</tr>				

				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Via Fax @:
					</font></td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial><b>#read_payoff_info_1.fax_to_send_to#</b>
					</font></td>
				</tr>
				
				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Attn: 
					</font></td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial><b>#read_payoff_info_1.person_to_send_to#</b>
					</font></td>
				</tr>
				<TR>
					<TD width=100 align=right valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial> 
					</font></td>
					<TD width=300 align=left valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<B> Payoff Department</B>
					</font></td>
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
						</font></TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							 <b>#read_title.title_id#</b>
						</font></TD>

					</tr>

					<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Your Loan Number:
						</font></TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							 <b>#read_title.poacctno1#</b>
						</font></TD>

					</tr>
<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Borrower's SS##: 
						</font></TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							 <b>#Mid(read_title.bssn1,1,3)#-#Mid(read_title.bssn1,4,2)#-#Mid(read_title.bssn1,6,4)#</b>
						</font></TD>

					</tr>
					<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Sellers Info:
						</font></TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							 <b>#read_title.sfirstname1# #read_title.sminame1# #read_title.slastname1#</b><br>
				<CFIF #read_title.sfirstname2# GT "">
							<b>#read_title.sfirstname2# #read_title.sminame2# #read_title.slastname2#</b>
				</CFIF>
						</font></TD>

					</tr>

					<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							Property Address:
						</font></TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<b>#read_title.paddress#</b><br>
							<b>#read_title.pcity#, #read_title.pstate# <b>#read_title.pzip#</b><br>
							<b>#read_title.pcounty#</b>
						</b></font></TD>

					</tr>					

					<tr>
						<td width=519 colspan=2 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<p>
							<br>
							<p>
							Please fax us a payoff statement regarding the above-referenced loan, with interest calculated through <b>#read_payoff_info_1.int_calc_thru#</b>, and including a per diem interest rate.

						</font></TD>

					</tr>

					<tr>
						<td width=519 colspan=2 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">							
							Our Fax Number is <b>#read_title_co.fax#</b>..

						</font></TD>

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
							

						</font></TD>

					</tr>
</font></CFLOOP>
</table>
</cfmail>
</cfif>
</center></center></BODY>
</HTML>
	
	
	