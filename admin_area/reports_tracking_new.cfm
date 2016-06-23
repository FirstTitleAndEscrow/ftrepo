<cfscript>
function CreateTimeStruct(timespan) {
    var timestruct = StructNew();
    var mask = "s";

    if (ArrayLen(Arguments) gte 2) mask = Arguments[2];

    // if timespan isn't an integer, convert mask towards s until timespan is an integer or mask is s
    while (Int(timespan) neq timespan AND mask neq "s") {
        if (mask eq "d") {
            timespan = timespan * 24;
            mask = "h";
        } else if (mask eq "h") {
            timespan = timespan * 60;
            mask = "m";
        } else if (mask eq "m") {
            timespan = timespan * 60;
            mask = "s";
        }
    }
    
    // only 4 allowed values for mask - if not one of those, return blank struct
    if (ListFind("d,h,m,s", mask)) {
        // compute seconds
        if (mask eq "s") {
            timestruct.s = (timespan mod 60) + (timespan - Int(timespan));
            timespan = int(timespan/60);
            mask = "m";
        } else timestruct.s = 0;
        // compute minutes
        if (mask eq "m") {
            timestruct.m = timespan mod 60;
            timespan = int(timespan/60);
            mask = "h";
        } else timestruct.m = 0;
        // compute hours, days
        if (mask eq "h") {
            timestruct.h = timespan mod 24;
            timestruct.d = int(timespan/24);
        } else {
            timestruct.h = 0;
            timestruct.d = timespan;
        }
    }
    
    return timestruct;
}
/**
 * Returns the number of days between a start and end date, excluding a specified list of days, and allowing for an exclusion list
 * 
 * @param startDate      begin date for calculations (Required)
 * @param endDate      end date for calculations (Required)
 * @param exclude      days of week (1=sunday, etc.) to exclude from the count (Optional)
 * @param includeStartDate      boolean to include start date in count (Optional)
 * @param ignoreTimes      boolean to indicate if the times on the dates are to be ignored (Optional)
 * @param excludeDates      array containing simple string dates to exclude from the count (Optional)
 * @return returns a number 
 * @author Murray Hopkins (murray@murrah.com.au) 
 * @version 0, March 3, 2010 
 */
function countArbitraryDaysExcluding(startdate,enddate) {
/*
Example of use:

    holidays = arrayNew(1);
    holidays[1] = "YYYY-12-25"; // Dec 25 all years (Remember for your testing: this is a Sat in 2010 and Sun in 2011)
    holidays[2] = "YYYY-1-1";   // Jan 1 all years (is a Sat in 2011, Sun in 2012)
    holidays[3] = "2010-4-2";  // April 2, 2010 (Good friday) 

    date1 = CreateDateTime(2008,10,15,13,00,00);
    date2 = CreateDateTime(2011,2,1,6,00,00);
    
    days = countArbitraryDaysExcluding(date1,date2,"1,7",false,true,holidays); 
    
    writeOutput(", days=" & days);
    
Note:
includeStartDate - defaults to false so that if the startdate and enddate are the same the result will be 0, not 1

ignoreTimes - CF date functions treat a day as 24 hours and this can cause unexpected results in your date calulations.
eg the difference between today at 11pm and tomorrow at 6am is zero for dateDiff(). 
But for this UDF we would generally expect 1 day's difference. Therefore, optionally, ignore the times (defults to true).

*/    
    var exclude = "1,7";
    var IncludeStartDate = false;
    var ignoreTimes = true;
    var excludeDates = arrayNew(1);
    var daysperweek = 0;
    var days = 0;
    var weekday = ArrayNew(1);
    var x = 0;
    var maxdays = 0;
    var tmpDate = 0;
    var dt = 0;
    var xdt = 0;
    var yr = 0;
    
    exlcudeDates[1] = "2013/7/4";
    
     
    switch (arrayLen(arguments)) {
        case 6: { excludeDates = arguments[6]; }
        case 5: { ignoreTimes = arguments[5]; }
        case 4: { IncludeStartDate = arguments[4]; }
        case 3: { exclude = arguments[3]; }
    }
    
    // create an array to hold days of the week with 1 or 0 indicating if the day is counted
    arraySet(weekday,1,7,1); exclude = listToArray(exclude);
    for (x = 1; x lte arrayLen(exclude); x = x + 1) { weekday[exclude[x]] = 0; } // set the value of any excluded day to 0
    daysperweek = arraySum(weekday); // count the number of included days in a full week
 
     if (ignoreTimes){
         startdate = CreateDateTime(year(startdate),month(startdate),day(startdate),0,0,0);
         enddate = CreateDateTime(year(enddate),month(enddate),day(enddate),0,0,0);
     }
      
      maxdays = DateDiff("d",dateadd("d",-1,startdate),enddate);
     tmpDate = enddate;
     
    days = daysperweek * int(maxdays/7); // get the number of included days in all full weeks
    tmpDate = enddate;
    for (x = 1; x lte maxdays mod 7; x = x + 1) { // add any remaining days in the last partial week
        days = days + weekday[dayofweek(tmpDate)];
        tmpDate = dateadd("d",-1,tmpDate);
    }
    
                                    // if excluding the start date, remove the value that might have been added for the starting day
    if (not includeStartDate) { days = days - weekday[dayofweek(startdate)]; }
    
                                // if there are any specific dates to exclude that we havent already 
                                // excluded because of the day of week thay are on, decrement the count
    for (x=1; x lte arrayLen(excludeDates); x=x+1) {
                                // masks MUST be in the form YYYY-mm-dd    where mm and dd are valid numeric values
                                // I didnt want to put too much extra unnecessary validation in here! Although a good regEx would probably do!
        if (listFirst(excludeDates[x],'-') eq 'YYYY') {           
            for (yr = year(startdate); yr LTE year(enddate); yr=yr+1){
                                // The mask has generated a date for the years in the date range we are counting
                                // Add a new exclude date to the end of the array.
                                // But dont bother if the day of week of the excluded date is being excluded anyway
                dt = CreateDateTime( yr, listgetat(excludeDates[x],2,'-'), listgetat(excludeDates[x],3,'-'),0,0,0 );
                if (weekday[dayofweek(dt)] eq 1) {
                    arrayAppend(excludeDates,dt);
                }
            }
        } else {    
               if (isDate(excludeDates[x])) {
                   xdt = ParseDateTime(excludeDates[x]);
                 if (ignoreTimes){ xdt = CreateDateTime(year(xdt),month(xdt),day(xdt),0,0,0);}
                                     // If the excludeDate is GTE the start date AND LTE the end date (ie in inclusive range), 
                                     // AND it is a day of week to include,
                                     // then decrement the count         
                if ( ((DateCompare(xdt, startdate) gt -1) AND (DateCompare(xdt, enddate) lt 1)) AND weekday[dayofweek(xdt)] eq 1) { 
                    days = days - 1; 
                }
               }
        }
    }
    
    
    return days;
}
</cfscript>


<!--- chase/RealEC client account ID is 7393 --->
<cfset chase_id = 7393>
<cfset chase_id2 = 7402>
<cfparam name="form.end_date" default="#DateFormat(Now(), 'mm-dd-yyyy')#">
<cfparam name="form.start_date" default="#DateFormat(DateAdd('d', -30, Now()), 'mm-dd-yyyy')#">
<cfset holidays = arrayNew(1)>
<cfset holidays[1] = "2013-7-4">
<cfset holidays[2] = "2013-5-27">
<cfset holidays[3] = "2013-9-2">
<cfset holidays[4] = "2013-11-26">
<cfset holidays[5] = "2013-12-25">
<cfset holidays[6] = "2014-1-1">
<cfset holidays[7] = "2014-1-20">
<cfset holidays[8] = "2014-5-26">
<cfset holidays[9] = "2014-7-4">

<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:##000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>
	<CFQUERY datasource="#request.dsn#" NAME="get_recs">
	select t.title_id, t.paddress, t.pcity, t.pstate, t.on_hold, t1.event_datetime as start,
--t2.event_datetime as binder_sent,
t3.event_datetime as cleared,
t4.event_datetime as closing_req,
t5.event_datetime as closing_sched,
min(t6.event_datetime) as closing_ins_received,
t7.event_datetime as pre_hud_sent,
t8.n_date as n_date2, t8.n_time as n_time2,
min(tn.n_date) as n_date, min(tn.note_id) as note_id,(select no.n_time from title_notes no where no.note_id = min(tn.note_id)) as n_time
 from title t
left join TurntimeEvents t1 on (t1.title_ID = t.title_ID AND t1.event_description = 'start')
--left join TurntimeEvents t2 on (t2.title_ID = t.title_ID AND t2.event_description = 'binder_sent')
left join title_notes tn on (tn.order_ID = t.title_ID AND (tn.n_note LIKE '%Title Commitment Delivered%'))
		
left join TurntimeEvents t3 on (t3.title_ID = t.title_ID AND t3.event_description = 'cleared')
left join TurntimeEvents t4 on (t4.title_ID = t.title_ID AND t4.event_description = 'closing_req')
left join TurntimeEvents t5 on (t5.title_ID = t.title_ID AND t5.event_description = 'closing_scheduled')
left join TurntimeEvents t6 on (t6.title_ID = t.title_ID AND t6.event_description = 'closing_ins_received')
left join TurntimeEvents t7 on (t7.title_ID = t.title_ID AND t7.event_description = 'final_hud_sent')
left join title_notes t8 on (t8.order_ID = t.title_ID AND (t8.n_note LIKE '%Pre HUD uploaded%'))
where t.comp_id IN (7393,7402)
AND t.appraisal_status <> 'Cancelled Per Client'
AND t.appraisal_status <> 'Order Cancelled'
AND t.cancelled IS NULL
group by t.title_id, t.paddress, t.pcity, t.pstate, t.on_hold, t1.event_datetime, t3.event_datetime,
t4.event_datetime, t5.event_datetime, t7.event_datetime, t8.n_date, t8.n_time, tn.note_id
order by t.title_id
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



<table border=1 cellspacing=4 cellpadding=4 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Title_id</strong></td>
<td align="left" valign="bottom"><strong>Address</strong></td>
<td align="left" valign="bottom"><strong>City</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="center" valign="bottom"><strong>Title Ordered<br>to<BR>Title Binder Sent</strong></td>
<td align="center" valign="bottom"><strong>Title Ordered<br>to<BR>Title Cleared</strong></td>
<td align="center" valign="bottom"><strong>Closing Instructions<br>Received</strong></td>
<td align="center" valign="bottom"><strong>HUD-1 Sent</strong></td>
<td align="center" valign="bottom"><strong>Closing Instructions Received<br>to<BR>HUD-1 Sent</strong></td>
<td align="center" valign="bottom"><strong>On Hold</strong></td>
<!---
<td align="center" valign="bottom"><strong>Closing Requested<br>to<BR>Closing Scheduled</strong></td>
<td align="center" valign="bottom"><strong>Instructions Received<br>to<BR>HUD Sent</strong></td>
<td align="center" valign="bottom"><strong>Closing Package Received<br>to<BR>Final HUD sent</strong></td>
<td align="center" valign="bottom"><strong>Posting of<br>Critical Docs</strong></td>
<td align="center" valign="bottom"><strong>Loan Funded to<br>Return Closing Package</strong></td>

<td align="center" valign="bottom"><strong>Current Clock</strong></td>
--->
</tr>


<cfif get_recs.recordcount>
<cfset bgcolor = 'efefef'>
<cfoutput query="get_recs" group="title_id">
<cfset endDate = "">
<cfset totaldays = 0>
<cfset totalhours = 0>
<cfset totalminutes = 0>
<cfset paused = 0>
<cfif Len(start)>
	<cfset pstart = ParseDateTime(start)>	
</cfif>
<cfif Len(n_date)><!---used to be len(binder_sent)--->
	<!---
	<cfset pbinder_sent = ParseDateTime(binder_sent)>
	---->
	<cfset pbinder_sent = ParseDateTime(ListFirst(n_date," ")&" "&ListLast(n_time," "))>
<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="get_pause">
		select top(1) event_datetime, event_description, event_type, event_code
		from turntimeevents where title_id = #title_id#
		order by event_datetime desc
	</cfquery>
	<cfif get_pause.event_type EQ "pause" and get_pause.event_code EQ 230>
		<cfset pbinder_sent = parseDateTime(get_pause.event_datetime)>
		<cfset paused = 1>
	<cfelse>
		<cfset pbinder_sent = Now()>
	</cfif>
</cfif>


<cfif Len(cleared)>
	<cfset pcleared = ParseDateTime(cleared)>
<cfelse>
	<cfif Len(n_date)><!---used to be len(binder_sent)--->
		<CFQUERY datasource="#request.dsn#" NAME="get_pause">
		select top(1) event_datetime, event_description, event_type, event_code
		from turntimeevents where title_id = #title_id#
		order by event_datetime desc
	</cfquery>
	<cfif get_pause.event_type EQ "pause" and get_pause.event_code EQ 230>
		<cfset pcleared = parseDateTime(get_pause.event_datetime)>
		<cfset paused = 1>
	<cfelse>
		<cfset pcleared = Now()>
	</cfif>
	</cfif>
</cfif>

<cfif Len(closing_req)>
	<cfset pclosing_Req = ParseDateTime(closing_req)>
</cfif>
<cfif Len(closing_sched)>
	<cfset pclosing_Sched = ParseDateTime(closing_sched)>
	<cfelse>
	<cfif Len(closing_req)>
		<CFQUERY datasource="#request.dsn#" NAME="get_pause">
		select top(1) event_datetime, event_description, event_type, event_code
		from turntimeevents where title_id = #title_id#
		order by event_datetime desc
	</cfquery>
	<cfif get_pause.event_type EQ "pause" and get_pause.event_code EQ 230>
		<cfset pclosing_sched = parseDateTime(get_pause.event_datetime)>
	<cfelse>
		<cfset pclosing_sched = Now()>
	</cfif>
	</cfif>
</cfif>
<cfif Len(closing_ins_received)>
	<cfset pclosing_ins_received = ParseDateTime(closing_ins_received)>
</cfif>
<cfif Len(n_date2)>
	<cfset phud_sent = ParseDateTime(DateFormat(n_date2,'mm/dd/yyyy')&" "&TimeFormat(n_time2,'hh:mm tt'))>
	<cfelse>
	<cfif Len(closing_ins_received)>
		<cfset phud_sent = Now()>
	</cfif>
</cfif>
<tr bgcolor="#bgcolor#">
<td><strong>#title_id#</strong></td>
<td>#paddress#</td>
<td>#pcity#</td>
<td>#pstate#</td>
<cfset dayscol1 = countArbitraryDaysExcluding(pstart,pbinder_sent,"1,7",false,false,holidays)>
<cfset hourscol1 = DateDiff("h",pstart,pbinder_sent) Mod 24>
<cfset mincol1 = DateDiff("n",pstart,pbinder_sent) Mod 60>
<cfset totalhours = totalhours + hourscol1>
<cfset totalminutes = totalminutes + mincol1>
<cfif Len(n_date)><!---used to be len(binder_sent)--->
	<cfset col1Color = "black">
<cfelse>
	<cfif dayscol1 LT 1>
		<cfset col1Color = "green">
	<cfelseif dayscol1 EQ 1>
		<cfset col1color = "orange">
	<cfelse>
		<cfset col1color = "red">
	</cfif>
</cfif>
<cfif paused>
	<cfset col1color = "blue">
</cfif>
<td style="color:#col1color#">

<cfif DateDiff("d",pstart,pbinder_sent) GT 0>#dayscol1#<cfset totaldays = totaldays + dayscol1><cfelse>0</cfif> : #hourscol1# : #mincol1#
	


</td>


<cfif Len(start) AND len(n_date)><!---used to be len(binder_sent)--->
	<cfset dayscol2 = countArbitraryDaysExcluding(pstart,pcleared,"1,7",false,false,holidays)>
	<cfset hourscol2 = DateDiff("h",pstart,pcleared) Mod 24>
	<cfset mincol2 = DateDiff("n",pstart,pcleared) Mod 60>
	<cfset totalhours = hourscol2>
	<cfset totalminutes = mincol2>
	<cfif Len(cleared)>
		<cfset col2Color = "black">
	<cfelse>
		<cfif dayscol2 LT 7>
			<cfset col2Color = "green">
		<cfelseif dayscol2 EQ 7>
			<cfset col2color = "orange">
		<cfelse>
			<cfset col2color = "red">
		</cfif>
	</cfif>
	<cfif paused>
		<cfset col2color = "blue">
	</cfif>
	<td style="color:#col2color#"><cfif DateDiff("d",pstart,pcleared) GT 0>#dayscol2# <cfset totaldays = totaldays + dayscol2><cfelse>0</cfif> : #hourscol2# : #mincol2#
	</td>
<cfelse>
	<td>&nbsp;</td>
</cfif>

<cfif Len(closing_ins_received)>
	<cfset dayscol4 = countArbitraryDaysExcluding(pclosing_ins_received,phud_sent,"1,7",false,false,holidays)>
	<cfset hourscol4 = DateDiff("h",pclosing_ins_received,phud_sent) Mod 24>
	<cfset mincol4 = DateDiff("n",pclosing_ins_received,phud_sent) Mod 60>
	<cfset totalhours = totalhours + hourscol4>
	<cfset totalminutes = totalminutes + mincol4>
	<cfif Len(pre_hud_sent)>
	<cfset col4Color = "black">
<cfelse>
	<cfif dayscol4 LT 1>
		<cfset col4Color = "green">
	<cfelseif dayscol4 EQ 1>
		<cfset col4color = "orange">
	<cfelse>
		<cfset col4color = "red">
	</cfif>
</cfif>
	<td style="color:#col4color#">#DateFormat(pclosing_ins_received,"mm/dd/yyyy")# #TimeFormat(pclosing_ins_received,"short")#</td>
	<td style="color:#col4color#">#DateFormat(phud_sent,"mm/dd/yyyy")# #TimeFormat(phud_sent,"short")#</td>
	<td style="color:#col4color#"><cfif DateDiff("d",pclosing_ins_received,phud_sent) GT 0>#dayscol4#<cfset totaldays = totaldays + dayscol4><cfelse>0</cfif> : #hourscol4# : #mincol4#
	<td style="color:#col4color#"><cfif get_recs.on_hold eq 'True'>X<cfelse>&nbsp;</cfif></td>
<cfelse>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><cfif get_recs.on_hold eq 'True'>X<cfelse>&nbsp;</cfif></td>
</cfif>
<!---

<cfif Len(closing_req)>
	<cfset dayscol3 = countArbitraryDaysExcluding(pclosing_req,pclosing_sched,"1,7",false,false)>
	<cfset hourscol3 = DateDiff("h",pclosing_req,pclosing_sched) Mod 24>
	<cfset mincol3 = DateDiff("n",pclosing_req,pclosing_sched) Mod 60>
	<cfset totalhours = totalhours + hourscol3>
	<cfset totalminutes = totalminutes + mincol3>
	<cfif Len(closing_sched)>
	<cfset col3Color = "black">
<cfelse>
	<cfif dayscol3 LT 1>
		<cfset col3Color = "green">
	<cfelseif dayscol3 EQ 1>
		<cfset col3color = "orange">
	<cfelse>
		<cfset col3color = "red">
	</cfif>
</cfif>
	<td style="color=#col3color#"><cfif DateDiff("d",pclosing_req,pclosing_sched) GT 0>#dayscol3#<cfset totaldays = totaldays + dayscol3><cfelse>0</cfif> : #hourscol3# : #mincol3#
	</td>
<cfelse>
	<td>&nbsp;</td>
</cfif>



<cfif Len(closing_ins_received)>
	<cfset dayscol4 = countArbitraryDaysExcluding(pclosing_ins_received,phud_sent,"1,7",false,false)>
	<cfset hourscol4 = DateDiff("h",pclosing_ins_received,phud_sent) Mod 24>
	<cfset mincol4 = DateDiff("n",pclosing_ins_received,phud_sent) Mod 60>
	<cfset totalhours = totalhours + hourscol4>
	<cfset totalminutes = totalminutes + mincol4>
	<cfif Len(hud_sent)>
	<cfset col4Color = "black">
<cfelse>
	<cfif dayscol4 LT 1>
		<cfset col4Color = "green">
	<cfelseif dayscol4 EQ 1>
		<cfset col4color = "orange">
	<cfelse>
		<cfset col4color = "red">
	</cfif>
</cfif>
	<td style="color:#col4color#"><cfif DateDiff("d",pclosing_ins_received,phud_sent) GT 0>#dayscol4#<cfset totaldays = totaldays + dayscol4><cfelse>0</cfif> : #hourscol4# : #mincol4#
	</td>
<cfelse>
	<td>&nbsp;</td>
</cfif>


<td>
</td>
<td>
</td>

<td>

<cfset totalminutes2 = totalminutes + (totalhours *60) + (totaldays*1440)>	
<cfset totalminutes = totalminutes + totaldays mod 1440>

<cfset timestruct = CreateTimeStruct(totalminutes2,"m")>
#timestruct.d# : #timestruct.h# : #timestruct.m#


</td>
--->
</tr>
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
</cfoutput>


<cfelse>
<tr><td colspan=11>No records found</td></tr>
</cfif>
</table>
</form>
</center>
