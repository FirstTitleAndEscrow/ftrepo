<!--- chase/RealEC client account ID is 7393 --->
<cfset chase_id = 7393>
<cfset chase_id2 = 7402>
<cfparam name="form.end_date" default="#DateFormat(Now(), 'mm-dd-yyyy')#">
<cfparam name="form.start_date" default="#DateFormat(DateAdd('d', -30, Now()), 'mm-dd-yyyy')#">



<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:##000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>

	<CFQUERY datasource="#request.dsn#" NAME="get_recs">
	select * from title
	WHERE (comp_id = #chase_id# or comp_id = #chase_id2#) and order_date between '#form.start_date#' and '#form.end_date#'
    </CFQUERY>
	


<cfset col1_total = 0>
<cfset col1_count = 0>
<cfset within_range_count1 = 0>

<cfset col2_total = 0>
<cfset col2_count = 0>
<cfset within_range_count2 = 0>

<cfset col3_total = 0>
<cfset col3_count = 0>
<cfset within_range_count3 = 0>

<cfset col4_total = 0>
<cfset col4_count = 0>
<cfset within_range_count4 = 0>

<cfset col5_total = 0>
<cfset col5_count = 0>
<cfset within_range_count5 = 0>

<cfset col6_total = 0>
<cfset col6_count = 0>
<cfset within_range_count6 = 0>

<cfset col7_total = 0>
<cfset col7_count = 0>
<cfset within_range_count7 = 0>

<form action="#cgi.SCRIPT_NAME#" method="post" name="date_frm">
<center>
<span class="large_header">Chase/RealEC Turn Times</span><br><br>
<br>
Date Range: <input type="text" name="start_date" size=15 maxlength=20 value="<Cfoutput>#form.start_date#</Cfoutput>">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;<input type="text" name="end_date" size=15 maxlength=20  value="<Cfoutput>#form.end_date#</Cfoutput>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit"><br>
<br>

<table border=1 cellspacing=4 cellpadding=4 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Title_id</strong></td>
<td align="left" valign="bottom"><strong>Address</strong></td>
<td align="left" valign="bottom"><strong>City</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="left" valign="bottom"><strong>Order Date</strong></td>
<td align="left" valign="bottom"><strong>Order Time</strong></td>
<td align="center" valign="bottom"><strong>Title Ordered<br>to<BR>Title Binder Sent</strong></td>
<td align="center" valign="bottom"><strong>Title Not Cleared<br>to<BR>Title Cleared</strong></td>
<td align="center" valign="bottom"><strong>Closing Requested<br>to<BR>Closing Scheduled</strong></td>
<td align="center" valign="bottom"><strong>Instructions Received<br>to<BR>HUD Sent</strong></td>
<!--- <td align="center" valign="bottom"><strong>Closing Package Received<br>to<BR>Final HUD sent</strong></td> --->
<td align="center" valign="bottom"><strong>Posting of<br>Critical Docs</strong></td>
<td align="center" valign="bottom"><strong>Loan Funded to<br>Return Closing Package</strong></td>
<td align="center" valign="bottom"><strong>Current Clock</strong></td>
</tr>
<cfif get_recs.recordcount>

<cfset bgcolor = 'efefef'>
<cfoutput query="get_recs">
	<CFQUERY datasource="#request.dsn#" NAME="title_info">
	select * from title
	WHERE title_id = #get_recs.title_id#
    </CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="get_start" maxrows=1>
	select * from turntimeevents
	WHERE (title_id = #get_recs.title_id#
	and (event_type = 'start' or event_description = 'start'))
	order by event_datetime
    </CFQUERY>
<tr bgcolor="#bgcolor#">
<td><strong><a href="turn_time_events_pop_up.cfm?title_id=#title_info.title_id#" target="_new">T-#title_info.title_id#</a></strong></td>
<td>#title_info.paddress#</td>
<td>#title_info.pcity#</td>
<td>#title_info.pstate#</td>
<td>#DateFormat(get_start.event_datetime, "mm/dd/yyyy")#</td>
<td>#TimeFormat(get_start.event_datetime, "long")#</td>
<td align="center"><cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'binder_sent')) LT 2160 and turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'binder_sent')) NEQ 0><font color="green"><cfset within_range_count1 = within_range_count1 + 1><cfelseif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'binder_sent')) LT 4320><font color="orange"><cfelse><font color="red"></cfif>#turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'binder_sent')#</font>
<cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'binder_sent')) neq 0>
<cfset col1_total = col1_total + turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'binder_sent'))>
<cfset col1_count = col1_count + 1>
</cfif></td>
<td align="center"><cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'cleared')) LT 7200 and turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'cleared')) NEQ 0><cfset within_range_count2 = within_range_count2 + 1><font color="green"><cfelseif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'cleared')) LT 14400><font color="orange"><cfelse><font color="red"></cfif>#turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'cleared')#</font>
<cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'cleared')) neq 0>
<cfset col2_total = col2_total + turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'cleared'))>
<cfset col2_count = col2_count + 1>
</cfif></td>
<td align="center"><cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_req', 'closing_sched')) LT 60 and turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_req', 'closing_sched')) NEQ 0><cfset within_range_count3 = within_range_count3 + 1><font color="green"><cfelseif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_req', 'closing_sched')) LT 120><font color="orange"><cfelse><font color="red"></cfif>#turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_req', 'closing_sched')#</font>
<cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_req', 'closing_sched')) neq 0>
<cfset col3_total = col3_total + turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_req', 'closing_sched'))>
<cfset col3_count = col3_count + 1>
</cfif></td>
<td align="center"><cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_ins_received', 'hud_sent')) LT 120 and turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_ins_received', 'hud_sent')) NEQ 0><cfset within_range_count4 = within_range_count4 + 1><font color="green"><cfelseif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_ins_received', 'hud_sent')) LT 240><font color="orange"><cfelse><font color="red"></cfif>#turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_ins_received', 'hud_sent')#</font>
<cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_ins_received', 'hud_sent')) neq 0>
<cfset col4_total = col4_total + turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_ins_received', 'hud_sent'))>
<cfset col4_count = col4_count + 1>
</cfif></td>


<!--- <td align="center">#turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_pack_received', 'final_hud_sent')#
<cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_pack_received', 'final_hud_sent')) neq 0>
<cfset col5_total = col5_total + turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'closing_pack_received', 'final_hud_sent'))>
<cfset col5_count = col5_count + 1>
</cfif></td> --->


<td align="center"><cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'event691', 'event768')) LT 1440 and turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'event691', 'event768')) NEQ 0><cfset within_range_count6 = within_range_count6 + 1><font color="green"><cfelseif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'event691', 'event768')) LT 2880><font color="orange"><cfelse><font color="red"></cfif>#turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'event691', 'event768')#</font>
<cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'event691', 'event768')) neq 0>
<cfset col6_total = col6_total + turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'event691', 'event768'))>
<cfset col6_count = col6_count + 1>
</cfif></td>

<td align="center"><cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'loan_funded', 'event690')) LT 2160 and turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'loan_funded', 'event690')) NEQ 0><cfset within_range_count7 = within_range_count7 + 1><font color="green"><cfelseif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'loan_funded', 'event690')) LT 4320><font color="orange"><cfelse><font color="red"></cfif>#turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'loan_funded', 'event690')#</font>
<cfif turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'loan_funded', 'event690')) neq 0>
<cfset col7_total = col7_total + turnTimes.HoursToMinutes(turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'loan_funded', 'event690'))>
<cfset col7_count = col7_count + 1>
</cfif></td>


<td align="center">#turnTimes.calculateCurrentTurnTime(get_recs.title_id, 'marker', 'start', 'now')#</td>


</tr>
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
</cfoutput>
<cfabort>
<cftry>
<cfset green_percentage1 = within_range_count1 / col1_count * 100>
<cfif green_percentage1 GTE 95>
<cfset color1 = "green">
<cfelseif green_percentage1 GTE 85>
<cfset color1 = "gold">
<cfelse>
<cfset color1 = "red">
</cfif>
<cfcatch type="any">
<cfset color1 = "black">
</cfcatch>
</cftry>

<cftry>
<cfset green_percentage2 = within_range_count2 / col2_count * 100>
<cfif green_percentage2 GTE 90>
<cfset color2 = "green">
<cfelseif green_percentage2 GTE 80>
<cfset color2 = "gold">
<cfelse>
<cfset color2 = "red">
</cfif>
<cfcatch type="any">
<cfset color2 = "black">
</cfcatch>
</cftry>

<cftry>
<cfset green_percentage3 = within_range_count3 / col3_count * 100>
<cfif green_percentage3 GTE 95>
<cfset color3 = "green">
<cfelseif green_percentage3 GTE 85>
<cfset color3 = "gold">
<cfelse>
<cfset color3 = "red">
</cfif>
<cfcatch type="any">
<cfset color3 = "black">
</cfcatch>
</cftry>

<cftry>
<cfset green_percentage4 = within_range_count4 / col4_count * 100>
<cfif green_percentage4 GTE 90>
<cfset color4 = "green">
<cfelseif green_percentage4 GTE 80>
<cfset color4 = "gold">
<cfelse>
<cfset color4 = "red">
</cfif>
<cfcatch type="any">
<cfset color4 = "black">
</cfcatch>
</cftry>

<cftry>
<cfset green_percentage6 = within_range_count6 / col6_count * 100>
<cfif green_percentage6 GTE 98>
<cfset color6 = "green">
<cfelseif green_percentage6 GTE 95>
<cfset color6 = "gold">
<cfelse>
<cfset color6 = "red">
</cfif>
<cfcatch type="any">
<cfset color6 = "black">
</cfcatch>
</cftry>

<cftry>
<cfset green_percentage7 = within_range_count7 / col7_count * 100>
<cfif green_percentage7 GTE 99>
<cfset color7 = "green">
<cfelseif green_percentage7 GTE 95>
<cfset color7 = "gold">
<cfelse>
<cfset color7 = "red">
</cfif>
<cfcatch type="any">
<cfset color7 = "black">
</cfcatch>
</cftry>

<tr>
<td colspan=4><strong>Averages</strong></td>

<td align="center"><cfoutput><strong><font color="#color1#"><cftry>#turnTimes.CalculateAverage(col1_total, col1_count)#<cfcatch type="any"></cfcatch></cftry></font></strong></cfoutput></td>
<td align="center"><cfoutput><strong><font color="#color2#"><cftry>#turnTimes.CalculateAverage(col2_total, col2_count)#<cfcatch type="any"></cfcatch></cftry></font></strong></cfoutput></td>
<td align="center"><cfoutput><strong><font color="#color3#"><cftry>#turnTimes.CalculateAverage(col3_total, col3_count)#<cfcatch type="any"></cfcatch></cftry></font></strong></cfoutput></td>
<td align="center"><cfoutput><strong><font color="#color4#"><cftry>#turnTimes.CalculateAverage(col4_total, col4_count)#<cfcatch type="any"></cfcatch></cftry></font></strong></cfoutput></td>
<!--- <td align="center"><cfoutput><strong><cftry>#turnTimes.CalculateAverage(col5_total, col5_count)#<cfcatch type="any"></cfcatch></cftry></strong></cfoutput></td> --->
<td align="center"><cfoutput><strong><font color="#color6#"><cftry>#turnTimes.CalculateAverage(col6_total, col6_count)#<cfcatch type="any"></cfcatch></cftry></font></strong></cfoutput></td>
<td align="center"><cfoutput><strong><font color="#color7#"><cftry>#turnTimes.CalculateAverage(col7_total, col7_count)#<cfcatch type="any"></cfcatch></cftry></font></strong></cfoutput></td>
</tr>
<cfelse>
<tr><td colspan=11>No records found</td></tr>
</cfif>
</table>
</form>
</center>
