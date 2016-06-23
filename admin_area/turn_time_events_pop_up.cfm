<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Event Markers</title>
</head>

<body>

<CFQUERY datasource="#request.dsn#" NAME="get_start_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'start'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_stop_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'stop'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_binder_sent_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'binder_sent'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_cleared_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'cleared'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_closing_req_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'closing_req'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_closing_sched_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'closing_sched'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_closing_ins_received_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'closing_ins_received'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_hud_sent_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'hud_sent'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_event691_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'event691'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_event768_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'event768'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_loan_funded_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'loan_funded'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_event690_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and event_type = 'marker'
			and event_description = 'event690'
			order by event_datetime
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_first_stop_marker" maxrows=1>
			SELECT *
			FROM TurntimeEvents
			where title_id = #url.title_id#
			and 
			(event_type = 'stop'
			or event_description = 'stop')
			order by event_datetime
		</CFQUERY>


<table border=1 width=500>
<tr>
<td colspan=3>Title_ID: <cfoutput>#url.title_id#</cfoutput></td>
</tr>
<tr>
<td>Event</td>
<td>Date</td>
<td>Time</td>
</tr>

<cfoutput>
<tr>
<td>Order Opened</td>
<cfif get_start_marker.recordcount eq 1>
<td >#DateFormat(get_start_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_start_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>

<tr>
<td>Binder Sent</td>
<cfif get_binder_sent_marker.recordcount eq 1>
<td >#DateFormat(get_binder_sent_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_binder_sent_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>


<tr>
<td>Marked Clear to Close</td>
<cfif get_cleared_marker.recordcount eq 1>
<td >#DateFormat(get_cleared_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_cleared_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>


<tr>
<td>Closing Request</td>
<cfif get_closing_req_marker.recordcount eq 1>
<td >#DateFormat(get_closing_req_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_closing_req_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>

<tr>
<td>Closing Scheduled</td>
<cfif get_closing_sched_marker.recordcount eq 1>
<td >#DateFormat(get_closing_sched_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_closing_sched_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>


<tr>
<td>Closing Instructions Received</td>
<cfif get_closing_ins_received_marker.recordcount eq 1>
<td >#DateFormat(get_closing_ins_received_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_closing_ins_received_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>


<tr>
<td>HUD Sent</td>
<cfif get_hud_sent_marker.recordcount eq 1>
<td >#DateFormat(get_hud_sent_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_hud_sent_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>


<tr>
<td>Event 691</td>
<cfif get_event691_marker.recordcount eq 1>
<td >#DateFormat(get_event691_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_event691_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>

<tr>
<td>Event 768</td>
<cfif get_event768_marker.recordcount eq 1>
<td >#DateFormat(get_event768_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_event768_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>



<tr>
<td>Loan Funded</td>
<cfif get_loan_funded_marker.recordcount eq 1>
<td >#DateFormat(get_loan_funded_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_loan_funded_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>


<tr>
<td>Event 690</td>
<cfif get_event690_marker.recordcount eq 1>
<td >#DateFormat(get_event690_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_event690_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>




<tr>
<td>First STOP event</td>
<cfif get_first_stop_marker.recordcount eq 1>
<td >#DateFormat(get_first_stop_marker.event_datetime, "mm/dd/yyyy")#</td>
<td >#TimeFormat(get_first_stop_marker.event_datetime, "long")#</td>
<cfelse>
<td colspan=2>No Event Found</td>
</cfif>
</tr>


</cfoutput>

</table>






</body>
</html>
