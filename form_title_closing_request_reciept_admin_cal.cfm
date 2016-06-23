
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="input_date" DEFAULT="">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="2">

<!---Includes Section pre-processing --->
<CFINCLUDE TEMPLATE="./includes/preprocessing.cfm">
<CFINCLUDE TEMPLATE="./includes/preprocessing2.cfm">



<CFQUERY datasource="#request.dsn#" NAME="get_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#
		</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT company, team_id
		FROM companies
		WHERE id = #get_title.comp_id#
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

		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->




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
			<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">
				SELECT *
				FROM First_Admin
				WHERE ID = #read_title.comp_ID#
			</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="bbb">
					SELECT *
					FROM Title_Closing_Order_Request
					Where Title_Id = #rec_id#
				</CFQUERY>
				<CFSET requestDate = #DateFormat(input_date, "mm/dd/yyyy")#>
				<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<CFQUERY datasource="#request.dsn#">
				UPDATE Title_Closing_Order_Request
				SET	A_Req_Closing_Day   	 = '#DateFormat(requestDate, "dd")#',
					A_Req_Closing_Time		 = '#A_Req_Closing_Time#',
					A_Req_Closing_month		 = '#DateFormat(requestDate, "mm")#',
					A_Req_Closing_year		 = '#DateFormat(requestDate, "yyyy")#',
					A_Settle_Location		 = '#A_Settle_Location#',
					request_date  		= '#DateFormat(input_date, "mm/dd/yyyy")#',
					A_Req_By_Company 		 = '#A_Req_By_Company#',
					A_Req_By_Phone 			 = '#A_Req_By_Phone#',
					A_Req_By_Ext 			 = '#A_Req_By_Ext#',
					A_Req_By_Fax 			 = '#A_Req_By_Fax#',
					A_Req_By_Email 			 = '#A_Req_By_Email#',
					A_Req_By_After_Hours_Phone = '#A_Req_By_After_Hours_Phone#',
					A_Managers_Name 		 = '#A_Managers_Name#',
					A_Managers_Phone		 = '#A_Managers_Phone#',
					c_dateandtime		 = '#order_date_adj#',

					c_comp_id = #read_title.comp_id#,
					A_How_Will_Be_Shipped	 = '#A_How_Will_Be_Shipped#',
					A_Special_Inst			 = '#A_Special_Inst#',
					a_sent_date        = '#DateFormat(Now(), "m/d/yyyy")#',
					a_sent_time     = '#TimeFormat(Now(), "HH:mm:ss")#',

					a_filled_out_date        = '#DateFormat(Now(), "m/d/yyyy")#',
						a_filled_out_time        = '#TimeFormat(Now(), "HH:mm:ss")#',
				a_filled_out_by          = 1

				WHERE Title_ID = #rec_id#
			</CFQUERY>

            <CFIF #read_title_count.recordcount# gte 1>
	<CFQUERY datasource="#request.dsn#">
		Update tblUser_Roles
		set Preprocessor_ID = #preprocessing#,
			Preprocessor_Start_Datetime = getdate()
		where title_ID = #rec_id#
	</CFQUERY>
<CFELSE>
	<CFQUERY datasource="#request.dsn#">
		Insert into tblUser_Roles
		(title_id,Preprocessor_ID, Preprocessor_Start_Datetime)
		Values(#rec_ID#,#preprocessing#,getdate())
	</CFQUERY>
</CFIF>

			<cfif #bbb.request_dateold# neq "">
						<CFQUERY datasource="#request.dsn#" NAME="read_com">

			select * from Title_Notes
			WHERE order_ID = #rec_id# and N_Note like 'Postponed%'

		</CFQUERY>

			<cfif #read_com.recordcount# eq 0>

			<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Toronicia', 'Woods', #URL.rec_id#, 'Postponed to #DateFormat(requestDate, "mm")# #A_Req_Closing_Time#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
		<cfelse>

		<cfquery datasource="#request.dsn#">
update Title_Notes
set  N_Note = 'Postponed to #DateFormat(requestDate, "mm")# #A_Req_Closing_Time#',
N_Date = '#DateFormat(Now(), "m/d/yyyy")#',
 N_Time = '#TimeFormat(Now(), "HH:mm:ss")#',
 access = '1',
 access2 = '1'
where order_ID = #rec_id# and N_Note like 'Postponed%'
</cfquery>

		</cfif>
			</cfif>
	<!-- sazan changed 11/28/05 -->
	<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>

<cfif #read_title.appraisal_status# neq "Loan Closed">

			<CFQUERY datasource="#request.dsn#">
				UPDATE Title
				SET	appraisal_status = 'Closing Requested'
				WHERE Title_ID = #rec_id#
</cfquery>
</cfif>
<!-- sazan changed 11/28/05 -->


<cfinvoke	component = "cfc.team_info"	method = "getTeam"	returnVariable = "get_team_info" comp_id="#read_title.comp_id#">
<CFQUERY datasource="#request.dsn#" NAME="get_leader">
SELECT * from first_admin where ID = #get_team_info.leader_id#
</cfquery>
<cfset leader_email = get_leader.email>
<cfset leader_fname = get_leader.fname>
<cfset leader_lname = get_leader.lname>

			<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#leader_fname#', '#leader_lname#', #URL.rec_id#, 'Closing request received by client', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="read_event">

			select * from eventlist
			WHERE title_ID = #rec_id#

		</CFQUERY>
		<cfif #read_event.c_day# neq "">


<cfquery name="get_old1" datasource="#request.dsn#">
select request_date, a_req_closing_date from Title_Closing_Order_Request

where title_id = #URL.rec_id#
</cfquery>

<cfquery name="upd2" datasource="#request.dsn#">
update Title_Closing_Order_Request
set

	request_dateold = #get_old1.request_date#,
	a_req_closing_dateold = #get_old1.a_req_closing_date#
where title_id = #URL.rec_id#
</cfquery>

<cfquery name="get_old" datasource="#request.dsn#">
select yearmonth, c_time from eventlist

where title_id = #URL.rec_id#
</cfquery>

<cfquery name="upd" datasource="#request.dsn#">
update eventlist
set

	yearmonthold = #get_old.yearmonth#,
	c_timeold = #get_old.c_time#
where title_id = #URL.rec_id#
</cfquery>
		<cfquery name="updateclosing" datasource="#request.dsn#">
update eventlist
set
	yearmonth = null,
	sc_dateandtime = null,
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
			ac_dateandtime = null,
			a_Date_Assigned = null,
			a_Time_Assigned = null
			WHERE title_ID = #rec_ID#

		</CFQUERY></cfif>
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
			<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">
				SELECT *
				FROM First_Admin
				WHERE ID = #read_title.comp_ID#
			</CFQUERY>



				<CFQUERY datasource="#request.dsn#" NAME="bbb">
					SELECT *
					FROM Title_Closing_Order_Request
					Where Title_Id = #rec_id#
				</CFQUERY>





		<cfquery name="getorderinfo" datasource="#request.dsn#">
SELECT *
FROM Title_Closing_Order_Request
Where Title_Id = #rec_id#
</cfquery>

	<!--- Read all of the Notes for this title --->

			<CFQUERY datasource="#request.dsn#" NAME="aaaa">
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #rec_id#
			</CFQUERY>

				<CFIF #aaaa.a_sent_by# GT 0>
					<CFSET a_sent = "1">
				<CFELSE>
					<CFSET a_sent = "0">
				</CFIF>

				<CFIF #aaaa.a_filled_out_by# GT 0>
					<CFSET a_filled = "1">
				<CFELSE>
					<CFSET a_filled = "0">
				</CFIF>


			<CFQUERY datasource="#request.dsn#" NAME="Read_Title">
				SELECT *
				FROM Title
				Where Title_Id = #rec_id#
			</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

</head>


<BODY BGCOLOR="white" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Closing Order Request Form</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>


		<p>
<cfoutput>

<center><b><font face=verdana size=3 color=blue> THANK YOU! CLOSING HAS BEEN REQUESTED FOR ORDER #READ_TITLE.TITLE_ID#</font></b></center>
<P>


<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


		<tr>
			<td width=700  align=center valign=top bgcolor=e1e1e1>



	</cfoutput>



<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=700 align=center valign=top>
		<B><font face=verdana size=2 color=white>Below is the information entered for this closing schedule </FONT></B><br>

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

		<td width=700 align=center valign=top bgcolor=e1e1e1>
<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>
<CFOUTPUT>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>
			<p>
			<br>
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
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
			<NOBR>State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR>
			</td>
		</tr>
	</table>


</CFOUTPUT>
<CFOUTPUT QUERY="aaaa">
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<!--- <tr>
			<td width=699 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Job number - <font face=verdana size=2 color=blue><B> #aaaa.Job_Number#</B></NOBR>
			</td>
		</tr> --->
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
					<!--- <tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requested By -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Requested_By#</B>
						</td>
					</tr>
				==============================================================
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requestors Title -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Title#</B>
						</td>
					</tr>--->
				<!--- ============================================================== --->
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
				<!--- ============================================================== --->
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
				<!--- ============================================================== --->
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
				<!--- ============================================================== --->
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
				<!--- ============================================================== --->
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
				<!--- ============================================================== --->
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
				<!--- ============================================================== --->
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
				<!--- ============================================================== --->
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
				<!--- ============================================================== --->
			</table>

				<!--- <p><font face=verdana size=2 color=black>
				When will the Package be ready :<br>
				<PRE><font face=verdana size=2 color=black><B>#aaaa.A_When_Pkg_Will_Be_Ready#</B></PRE>
				<p> --->


				<font face=verdana size=2 color=black>
				Special Instructions :<br>
				<PRE><font face=verdana size=2 color=blue><B>#aaaa.A_Special_Inst#</B></PRE>

			</td>
		</tr>
	</table>


</CFOUTPUT>

	<!--- <cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=800 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=800 align=center colspan = 5 valign=top bgcolor=elelel>

			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR<CFOUTPUT>#UCase(session.site.short_name)#</CFOUTPUT> CONTACT LIST</b></FONT></center>
				</td>
				</tr>

		</center>
			<tr>
		<td width=195 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=185 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


	<CFOUTPUT query = "get_user">



		<tr>
			<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Title Ordering/Tracking' or position = 'Title Delivery/Review' or position = 'Title Clearance' or position = 'Scheduling Coordinator' or position = 'Processing Asst.' or position = 'Funding Asst.' or position = 'Processor' or position = 'Funder' or position = 'Shipping' or position = 'Manager, Processing' or position = 'Manager, Title Production' or position = 'Manager, Research')
		order by id
		</CFQUERY>
		<cfif #retrieve_user.recordcount# GT 0>
		<td width=195 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=185 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
			</cfif>

	</TR>

	</cfoutput>




</cfif>	 ---></table>




			</td>
		</tr>
</table>
			</td>
		</tr>
</table>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

</td>
</tr>

	</table>


			</TD>
		</TR>

	</table>

<!--- 	<CFIF (#read_title.pstate# EQ "AL") OR (#read_title.pstate# EQ "CT") or (#read_title.pstate# EQ "DC") or (#read_title.pstate# EQ "DE") or (#read_title.pstate# EQ "FL") or (#read_title.pstate# EQ "GA") or (#read_title.pstate# EQ "KY") or (#read_title.pstate# EQ "MA") or (#read_title.pstate# EQ "ME") or (#read_title.pstate# EQ "MD") or (#read_title.pstate# EQ "CO") or (#read_title.pstate# EQ "NJ")>
<CFSET b_emails_to_first_title = "webmaster@firsttitleservices.com">
<CFELSEIF (#read_title.pstate# EQ "AR") OR (#read_title.pstate# EQ "NC") or (#read_title.pstate# EQ "IN") or (#read_title.pstate# EQ "MI") or (#read_title.pstate# EQ "MO") or (#read_title.pstate# EQ "TN") or (#read_title.pstate# EQ "VA") or (#read_title.pstate# EQ "WI") or (#read_title.pstate# EQ "AZ") or (#read_title.pstate# EQ "MT")>
<CFSET b_emails_to_first_title = "webmaster@firsttitleservices.com">
<CFELSEIF (#read_title.pstate# EQ "IA") OR (#read_title.pstate# EQ "IL") or (#read_title.pstate# EQ "KS") or (#read_title.pstate# EQ "LA") or (#read_title.pstate# EQ "MN") or (#read_title.pstate# EQ "MS") or (#read_title.pstate# EQ "NH") or (#read_title.pstate# EQ "NY") or (#read_title.pstate# EQ "ND") or (#read_title.pstate# EQ "OH") or (#read_title.pstate# EQ "PA") or (#read_title.pstate# EQ "RI") or (#read_title.pstate# EQ "VT") or (#read_title.pstate# EQ "WV")>
<CFSET b_emails_to_first_title = "webmaster@firsttitleservices.com">
<CFELSE>
<CFSET b_emails_to_first_title = "webmaster@firsttitleservices.com">
</CFIF> --->

<CFQUERY datasource="#request.dsn#" NAME="is_VA">
SELECT f.va_employee from companies c, first_admin f
where c.ID = #read_title.comp_id#
and f.ID = c.intSales
</CFQUERY>
<cfif is_VA.va_employee eq 'True'>
<cfset b_emails_to_first_title = "richmond@firsttitleservices.com">
<cfelse>
<cfset b_emails_to_first_title = "closings@firsttitleservices.com">
</cfif>


	<cfif #read_title.comp_id# neq "115">
	<CFMAIL
TO="#A_Req_By_Email#,#b_emails_to_first_title#"
FROM="#team_email#"
Subject="#session.site.short_name# - Closing Request for order #read_title.title_id# -- Loan number-#read_title.loan_number#, #read_title.bfirstname1# #read_title.blastname1#"
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
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
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
			<NOBR>State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR>
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
	<cfelse>
		<CFMAIL
TO="mhoston@mortgageinvestors.com,#b_emails_to_first_title#"
FROM="#team_email#"
Subject="#session.site.short_name# - Closing Request for order #read_title.title_id# -- Loan number-#read_title.loan_number#, #read_title.bfirstname1# #read_title.blastname1#"
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
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
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
			<NOBR>State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR>
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


