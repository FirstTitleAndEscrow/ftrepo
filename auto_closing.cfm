
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="input_date" DEFAULT="">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="2">
<CFPARAM NAME="a_flag" DEFAULT="0">
<CFPARAM NAME="A_Req_By_Company" DEFAULT="">
<CFPARAM NAME="A_Req_By_Phone" DEFAULT="">
<CFPARAM NAME="A_Req_By_Ext" DEFAULT="">
<CFPARAM NAME="A_Req_By_Fax" DEFAULT="">
<CFPARAM NAME="A_Req_By_Email" DEFAULT="">
<CFPARAM NAME="A_Req_By_After_Hours_Phone" DEFAULT="">
<CFPARAM NAME="A_Managers_Name" DEFAULT="">
<CFPARAM NAME="A_Managers_Phone" DEFAULT="">
<CFPARAM NAME="A_How_Will_Be_Shipped" DEFAULT="">
<CFPARAM NAME="A_Special_Inst" DEFAULT="">






<cfif #a_flag# eq 0>



		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</cfquery>
					<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT company
		FROM companies
		WHERE id = #read_title.comp_id#

	</CFQUERY>
<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_comp.team_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>
<cfset A_Req_By_Company = #read_comp.company#>
<cfset A_Req_By_Phone = #read_title.pPhone#>
<cfset A_Req_By_Ext = #read_title.pExt#>
<cfset A_Req_By_Fax = #read_title.pFax#>
<cfset A_Req_By_Email = #read_title.verifyemail#>

				<CFSET requestDate = #DateFormat(input_date, "mm/dd/yyyy")#>

			<CFQUERY datasource="#request.dsn#">
				UPDATE Title_Closing_Order_Request
				SET
					A_Req_Closing_Day   	 = '#DateFormat(requestDate, "dd")#',
					A_Req_Closing_Time		 = '#A_Req_Closing_Time#',
					A_Req_Closing_month		 = '#DateFormat(requestDate, "mm")#',
					A_Req_Closing_year		 = '#DateFormat(requestDate, "yyyy")#',
					request_date  		= '#DateFormat(input_date, "mm/dd/yyyy")#',
					A_Settle_Location		 = '#A_Settle_Location#',
					A_Req_By_Company 		 = '#A_Req_By_Company#',
					A_Req_By_Phone 			 = '#A_Req_By_Phone#',
					A_Req_By_Ext 			 = '#A_Req_By_Ext#',
					A_Req_By_Fax 			 = '#A_Req_By_Fax#',
					A_Req_By_Email 			 = '#A_Req_By_Email#',
					A_Req_By_After_Hours_Phone = '#A_Req_By_After_Hours_Phone#',
					A_Managers_Name 		 = '#A_Managers_Name#',
					A_Managers_Phone		 = '#A_Managers_Phone#',
					A_How_Will_Be_Shipped	 = '#A_How_Will_Be_Shipped#',
					A_Special_Inst			 = '#A_Special_Inst#',
					c_comp_id = #read_title.comp_id#,
					a_filled_out_date        = '#DateFormat(Now(), "m/d/yyyy")#',
					a_filled_out_time        = '#TimeFormat(Now(), "HH:mm:ss")#',
					a_filled_out_by          = #read_title.user_id#
				WHERE Title_ID = #rec_id#
			</CFQUERY>
<cfinvoke	component = "cfc.team_info"	method = "getTeam"	returnVariable = "get_team_info" comp_id="#read_title.comp_id#">
<CFQUERY datasource="#request.dsn#" NAME="get_leader">
SELECT * from first_admin where ID = #get_team_info.leader_id#
</cfquery>
<cfset leader_email = get_leader.email>
<cfset leader_fname = get_leader.fname>
<cfset leader_lname = get_leader.lname>

			<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#leader_fname#', '#leader_lname#', #rec_id#, 'Closing request received by client', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="read_event">

			select * from eventlist
			WHERE title_ID = #rec_id#

		</CFQUERY>
		<cfif #read_event.c_day# neq "">
		<cfquery name="updateclosing" datasource="#request.dsn#">
update eventlist
set
	yearmonth = null,
	yearmonthday = null,
	c_day = null,
	c_time = null,
	c_year = null,
	c_month = null,
	c_comment = null,
	s_time = null,
	s_date = null,
	l_date = null,
	l_time = null,
	closing_date = null
where title_id = #URL.rec_id#
</cfquery>
	</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_cl">

			select * from doc_closer_title
			WHERE title_ID = #rec_id#

		</CFQUERY>
			<cfif #read_cl.a_date_assigned# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_t">


		UPDATE Doc_closer_Title
			SET closer_ID = null,
			a_Assigned_by = null,
			a_Date_Assigned = null,
			a_Time_Assigned = null
			WHERE title_ID = #rec_ID#

		</CFQUERY></cfif>

<CFQUERY datasource="#request.dsn#">
				UPDATE Title
				SET	appraisal_status = 'Closing Requested'
				WHERE Title_ID = #rec_id#
</cfquery>


	<!--- Read all of the Notes for this title --->

			<CFQUERY datasource="#request.dsn#" NAME="aaaa">
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #rec_id#
			</CFQUERY>





<!--- <CFIF (#read_title.pstate# EQ "AL") OR (#read_title.pstate# EQ "CT") or (#read_title.pstate# EQ "DC") or (#read_title.pstate# EQ "DE") or (#read_title.pstate# EQ "FL") or (#read_title.pstate# EQ "GA") or (#read_title.pstate# EQ "KY") or (#read_title.pstate# EQ "MA") or (#read_title.pstate# EQ "ME") or (#read_title.pstate# EQ "MD") or (#read_title.pstate# EQ "CO") or (#read_title.pstate# EQ "NJ")>

<CFELSEIF (#read_title.pstate# EQ "AR") OR (#read_title.pstate# EQ "NC") or (#read_title.pstate# EQ "IN") or (#read_title.pstate# EQ "MI") or (#read_title.pstate# EQ "MO") or (#read_title.pstate# EQ "TN") or (#read_title.pstate# EQ "VA") or (#read_title.pstate# EQ "WI") or (#read_title.pstate# EQ "AZ") or (#read_title.pstate# EQ "MT")>

<CFELSEIF (#read_title.pstate# EQ "IA") OR (#read_title.pstate# EQ "IL") or (#read_title.pstate# EQ "KS") or (#read_title.pstate# EQ "LA") or (#read_title.pstate# EQ "MN") or (#read_title.pstate# EQ "MS") or (#read_title.pstate# EQ "NH") or (#read_title.pstate# EQ "NY") or (#read_title.pstate# EQ "ND") or (#read_title.pstate# EQ "OH") or (#read_title.pstate# EQ "PA") or (#read_title.pstate# EQ "RI") or (#read_title.pstate# EQ "VT") or (#read_title.pstate# EQ "WV")>

<CFELSE>

</CFIF>	 --->
<CFQUERY datasource="#request.dsn#" NAME="is_VA">
SELECT f.va_employee from companies c, first_admin f
where c.ID = #read_comp.id#
and f.ID = c.intSales
</CFQUERY>
<cfif is_VA.va_employee eq 'True'>
<cfset email_address = "richmond@firsttitleservices.com">
<cfelse>
<cfset email_address = "closings@firsttitleservices.com">
</cfif>

<CFSET b_emails_to_first_title = #email_address#>

<cfif read_comp.team_id eq 18>
<cfset title_co_name = "Axiom">
<cfelse>
<cfset title_co_name = "First Title">
</cfif>

<CFMAIL
TO="#read_title.verifyemail#,#b_emails_to_first_title#"
FROM="#team_email#"

Subject="#title_co_name# - Closing Request for order #read_title.title_id# -- Loan number-#read_title.loan_number#, #read_title.bfirstname1# #read_title.blastname1#"
TIMEOUT="600"
type="HTML"
>


<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


	<tr>
		<td width=700 align=center valign=top>
		<B><font face=verdana size=2 color=white>Title Closing Order Request Form</FONT></B><br>
</tr>


		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>
			<p>
			<br>
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#rec_id#</B></font></NOBR>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=350 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
			<td width=349 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
		</tr>
		<tr>
			<td width=350 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# #Read_Title.BLastName1#</B>
			</td>
			<td width=349 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# #Read_Title.BLastName2#</B>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>State - <font face=verdana size=2 color=blue><b>#read_title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR>
			</td>
		</tr>
	</table>




	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Date of Request -
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Date#</B>
			</td>

			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Time of Request -
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Time#</B>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_month#/#aaaa.A_Req_Closing_Day#/#aaaa.A_Req_Closing_year#</B>
			</td>

			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_Time#</B>
			</td>
		</tr>
	</table>


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
				<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>

					<tr>
			<td width=268 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			Location for Closing -
			</td>
			<td width=410 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue><B>#aaaa.A_Settle_Location#</B></PRE>
			</td>
				</tr>
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requesting Company -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Company#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Phone#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Ext#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Fax -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Fax#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Email -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Email#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						After Hours / Weekend Phone and Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_After_Hours_Phone#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Name -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Name#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Phone  -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Phone#</B>
						</td>

				</tr>
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					How will package be shipped  -
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_How_Will_Be_Shipped#</B>
				</td>
				</tr>

			</table>


				<font face=verdana size=2 color=black>
				Special Instructions :<br>
				<PRE><font face=verdana size=2 color=blue><B>#aaaa.A_Special_Inst#</B></PRE>

			</td>
		</tr>
	</table>

</CFMAIL>
	<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=GRAY>
			<tr>
		<td width=770 align=center valign=top bgcolor=ELELEL>
			<p><br><br>
			<CENTER><FONT FACE=ARIAL color=BLUE SIZE=3><b>CLOSING REQUEST ORDERED FOR: <CFOUTPUT>#read_title.title_id#</CFOUTPUT></b></FONT></center>
				<p><br><br>
				</td>
				</tr>

	</table>
<cfset a_flag = 1>
</cfif>
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
