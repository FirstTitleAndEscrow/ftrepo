



<cfquery name="get_order" datasource="#request.dsn#">
select * from Title

where title_id = #URL.rec_id#
</cfquery>



<!--- </cfif> --->


<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Updated Order</title>
</head>

<body leftmargin="0" bgcolor="d3d3d3"topmargin="0" marginheight="0" marginwidth="0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><img src="./images/clear.gif" width="10" height="1"><b><font size=2 color=red face=arial><img src="./images/clear.gif" width="30" height="1"><cfoutput>#datnow# - #timnow#</cfoutput> (EST)</b></td></tr><br>



<center>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="elelel">
<tr><td width="99%" align=center valign=top>
<FONT FACE=ARIAL SIZE=2 color="red">
	<br><br>
<center><B>ARE YOU SURE YOU WANT TO SUSPEND THIS CLOSING?
</B><br><br><FONT FACE=ARIAL SIZE=2 color="blue">If you choose so and would like to proceed click on the "Proceed" button, otherwise click the "Return" button to be redirected to the calendar search menu. </center> </td></tr>

<CFFORM NAME="frm" ACTION="./suspend_closing.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#get_order.title_id#&a_trigger=2" METHOD=POST>
	<tr><td width="50%" align=left valign=bottom>
		<br><br><br><br><br><br>
		<cfoutput>
		<NOBR><a href="https://#cgi.server_name#/admin_area/Calendar_company.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work"><img src="./images/button_return.gif" border=0 ALT="Return to main menu"></a>
			</NOBR></cfoutput></td>

			<td width="50%" align=center valign=bottom>
			<NOBR><input type=image border=0 src="./images/button_proceed.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td>


			</tr>


</cfform>







<cfif #a_trigger# EQ "2">

<cfquery name="get_old1" datasource="#request.dsn#">
select request_date, a_req_closing_time from Title_Closing_Order_Request

where title_id = #URL.rec_id#
</cfquery>
<cfif #get_old1.request_date# neq "">
<cfquery name="upd2" datasource="#request.dsn#">
update Title_Closing_Order_Request
set

	request_dateold = '#get_old1.request_date#',
	a_req_closing_timeold = '#get_old1.a_req_closing_time#'
where title_id = #URL.rec_id#
</cfquery>
</cfif>
<cfquery name="get_old" datasource="#request.dsn#">
select yearmonth, c_time from eventlist

where title_id = #URL.rec_id#
</cfquery>
<cfif #get_old.yearmonth# neq "">
<cfquery name="upd" datasource="#request.dsn#">
update eventlist
set

	yearmonthold = '#get_old.yearmonth#',
	c_timeold = '#get_old.c_time#'
where title_id = #URL.rec_id#
</cfquery>
</cfif>
<cfquery name="updateclosing" datasource="#request.dsn#">
update eventlist
set


	yearmonth = null,
	yearmonthday = null,
	sc_dateandtime = null,
	c_day = null,
	l_date = null,
	l_time = null,
	c_time = null,
	c_year = null,
	c_month = null,
	c_comment = null,
	s_time = null,
	s_date = null,
	closing_date = null
where title_id = #URL.rec_id#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="read_t">


		UPDATE Doc_closer_Title
			SET closer_ID = null,
			a_Assigned_by = null,
			a_Date_Assigned = null,
			ac_dateandtime = null,
			a_Time_Assigned = null
			WHERE title_ID = #rec_ID#

		</CFQUERY>
<cfquery name="updateclosing" datasource="#request.dsn#">
update Title_Closing_Order_Request
set
	a_req_closing_day = null,
	c_dateandtime = null,
	a_settle_location = null,
	a_requested_by = null,
	a_req_by_title = null,
	a_req_by_company = null,
	a_req_by_phone = null,
	a_req_by_fax = null,
	a_req_by_email = null,
		a_req_by_ext = null,
	a_req_by_after_hours_phone = null,
	a_managers_name = null,
	a_managers_phone = null,
	a_when_pkg_will_be_ready = null,
	a_how_will_be_shipped = null,
	a_special_inst = null,
	a_sent_by = null,
	a_sent_date = null,
	a_sent_time = null,
	a_filled_out_by = null,
	a_filled_out_date = null,
	a_filled_out_time = null,
	c_comment = null,
		a_req_closing_month = null,
	a_req_closing_year = null,
	a_req_closing_date = null,
	request_date = null
where title_id = #URL.rec_id#
</cfquery>


<cfquery name="get_abs" datasource="#request.dsn#">
select title_id, a_date_assigned, a_date_completed from doc_abstract_title

where title_id = #URL.rec_id#
</cfquery>

<cfquery name="get_ins" datasource="#request.dsn#">
select title_id, a_recieved_date from doc_title_insurance_title

where title_id = #URL.rec_id#
</cfquery>

<cfif #get_ins.a_recieved_date# neq "">
<cfquery name="updateclosing" datasource="#request.dsn#">
update Title
set
	Appraisal_status = 'Report E-mailed'
where title_id = #URL.rec_id#
</cfquery>

<cfelseif #get_abs.a_date_completed# neq "">
<cfquery name="updateclosing" datasource="#request.dsn#">
update Title
set
	Appraisal_status = 'In Typing'
where title_id = #URL.rec_id#
</cfquery>

<cfelse>
<cfquery name="updateclosing" datasource="#request.dsn#">
update Title
set
	Appraisal_status = 'In Process'
where title_id = #URL.rec_id#
</cfquery>
</cfif>


<TR>
<TD ALIGN=CENTER>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Closing Information Suspended</FONT>
<HR>

</TD>
</TR>



<center>

<tr><td><font size=3 face=arial>
Closing has been suspended for order &nbsp;<b><cfoutput>#url.rec_id#</cfoutput></b>&nbsp;


</td></tr><p></P>



<center>

</cfif>

</table></center>