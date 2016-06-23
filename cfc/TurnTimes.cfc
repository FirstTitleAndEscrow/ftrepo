<cfcomponent>
<cfset fileSys = CreateObject('component','cfc.FileManagement')>


<cffunction name="HoursToMinutes" output="true">
	<cfargument name="total_hours" required="true">

<cfif arguments.total_hours eq ''>
<cfset arguments.total_hours = '00:00'>
</cfif>
<cfif Mid(ListGetAt(arguments.total_hours, 1, ":"), 1, 1) eq 0>
<cfset hours = Mid(ListGetAt(arguments.total_hours, 1, ":"), 2, 2)>
<cfelse>
<cfset hours = ListGetAt(arguments.total_hours, 1, ":")>
</cfif>

<cfif Mid(ListGetAt(arguments.total_hours, 2, ":"), 1, 1) eq 0>
<cfset minutes = Mid(ListGetAt(arguments.total_hours, 2, ":"), 2, 2)>
<cfelse>
<cfset minutes = ListGetAt(arguments.total_hours, 2, ":")>
</cfif>

<cftry>
<cfset total_minutes = (hours * 60) + minutes>
<cfcatch type="any">
<cfset total_minutes = 0>
</cfcatch>
</cftry>

<cfset returnTotalMinutes = total_minutes>

<cfreturn returnTotalMinutes>

</cffunction>


<cffunction name="MinutesToHours" output="true">
	<cfargument name="turnTimeMins" required="true">

<cfset time_lapsed_remaining_minutes = arguments.turnTimeMins mod 60>
<cfset time_lapsed_hours = NumberFormat((arguments.turnTimeMins - time_lapsed_remaining_minutes) / 60, "00")>

<cfset returnHoursMinutes = time_lapsed_hours & ":" & NumberFormat(time_lapsed_remaining_minutes, "00")>

<cfreturn returnHoursMinutes>

</cffunction>

<cffunction name="MinutesToDaysHoursMins" output="true">
	<cfargument name="turnTimeMins" required="true">
<cfset total_days = Int(arguments.turnTimeMins / 1440)>
<cfset time_lapsed_remaining_minutes = arguments.turnTimeMins mod 1440>
<cfset total_hours = Int(time_lapsed_remaining_minutes / 60)>
<cfset time_lapsed_remaining_minutes = Int(time_lapsed_remaining_minutes mod 60)>
<cfset time_lapsed_days = Int(NumberFormat(total_days, "00"))>
<cfset time_lapsed_hours = Int(NumberFormat(total_hours, "00"))>
<cfset time_lapsed_minutes = Int(NumberFormat(time_lapsed_remaining_minutes, "00"))>
<cfset returnDaysHoursMinutes = time_lapsed_days & ":" & time_lapsed_hours & ":" & time_lapsed_minutes>
<cfreturn returnDaysHoursMinutes>
</cffunction>


<cffunction name="CalculateAverage" output="true">
	<cfargument name="total_minutes" required="true" default=0>
	<cfargument name="total_count" required="true" default=0>
	
<cfset average_minutes = Round(arguments.total_minutes / arguments.total_count)>
<cfset average_turntime = MinutesToHours(average_minutes)>

<cfreturn average_turntime>

</cffunction>

<cffunction name="isChaseHoliday" output="true">
	<cfargument name="check_date" required="true">
<!---
chase holidays
new years day
01-01-2013,01-01-2014,01-01-2015,01-01-2016,01-01-2017,01-01-2018,01-01-2019,01-01-2020,01-01-2021,01-01-2022,01-01-2023,
martin luther king day
01-16-2012,01-21-2013,01-20-2014,01-19-2015,01-18-2016,01-16-2017,01-15-2018,01-21-2019,01-20-2020,01-18-2021,01-17-2022,
presidents day (3rd Monday of Feb)
02-18-2013,02-17-2014,02-16-2015
memorial day
05-27-2013,05-26-2014,05-25-2015,05-30-2016,05-29-2017,05-28-2018,05-27-2019
july 4th
07-04-2013,07-04-2014,07-04-2015,07-04-2016,07-04-2017,07-04-2018,07-04-2019,07-04-2020,07-04-2021,07-04-2022,07-04-2023
labor day
09-2-2013,09-1-2014,09-7-2015,09-5-2016,09-4-2017,09-3-2018,09-2-2019,09-7-2020,09-6-2021,09-5-2022
veterans day
11-11-2013,11-11-2014,11-11-2015,11-11-2016,11-11-2017,11-11-2018,11-11-2019,11-11-2020,11-11-2021,11-11-2022
thanksgiving day
11-28-2013,11-27-2014,11-26-2015,11-24-2016,11-23-2017,11-22-2018,11-28-2019,11-26-2020,11-25-2021,11-24-2022
christmas day
12-25-2012,12-25-2013,12-25-2014,12-25-2015,12-25-2016,12-25-2017,12-25-2018,12-25-2019,12-25-2020,12-25-2021,12-25-2022,12-25-2023
--->
	<cfset chase_holidays = "01-01-2013,01-01-2014,01-01-2015,01-01-2016,01-01-2017,01-01-2018,01-01-2019,01-01-2020,01-01-2021,01-01-2022,01-01-2023,01-16-2012,01-21-2013,01-20-2014,01-19-2015,01-18-2016,01-16-2017,01-15-2018,01-21-2019,01-20-2020,01-18-2021,01-17-2022,02-18-2013,02-17-2014,02-16-2015,05-27-2013,05-26-2014,05-25-2015,05-30-2016,05-29-2017,05-28-2018,05-27-2019,07-04-2013,07-04-2014,07-04-2015,07-04-2016,07-04-2017,07-04-2018,07-04-2019,07-04-2020,07-04-2021,07-04-2022,07-04-2023,09-02-2013,09-01-2014,09-07-2015,09-05-2016,09-04-2017,09-03-2018,09-02-2019,09-07-2020,09-06-2021,09-05-2022,11-11-2013,11-11-2014,11-11-2015,11-11-2016,11-11-2017,11-11-2018,11-11-2019,11-11-2020,11-11-2021,11-11-2022,11-28-2013,11-27-2014,11-26-2015,11-24-2016,11-23-2017,11-22-2018,11-28-2019,11-26-2020,11-25-2021,11-25-2022,12-24-2012,12-25-2013,12-25-2014,12-25-2015,12-25-2016,12-25-2017,12-25-2018,12-25-2019,12-25-2020,12-25-2021,12-25-2022,12-25-2023">
	<cfif ListFindNoCase(chase_holidays,DateFormat(check_date, "mm-dd-yyyy"), ",")>
	<cfset is_it_a_holiday = 1>
	<cfelse>
	<cfset is_it_a_holiday = 0>
	</cfif>
	<cfreturn is_it_a_holiday>	
</cffunction>






<cffunction name="isWeekend" output="true">
	<cfargument name="check_date" required="true">
		<cfif DayofWeek(DateFormat(check_date, "mm-dd-yyyy")) eq 1 or DayofWeek(DateFormat(check_date, "mm-dd-yyyy")) eq 7>
		<cfset is_weekend = 1>
		<cfelse>
		<cfset is_weekend = 0>
		</cfif>
		<cfreturn is_weekend>	
</cffunction>


<cffunction name="isSunday" output="true">
	<cfargument name="check_date" required="true">
		<cfif DayofWeek(DateFormat(check_date, "mm-dd-yyyy")) eq 1>
		<cfset is_sunday = 1>
		<cfelse>
		<cfset is_sunday = 0>
		</cfif>
		<cfreturn is_sunday>	
</cffunction>




<cffunction name="calculateCurrentTurnTime" output="true">
	<cfargument name="title_id" required="true">
	<cfargument name="turntime_type" required="true" default="open_to_close">
	<cfargument name="marker_start_type" required="false" default="">
	<cfargument name="marker_stop_type" required="false" default="">

<cfif Len(arguments.marker_start_type)>
<CFQUERY datasource="#request.dsn#" NAME="get_start_marker">
			SELECT *
			FROM TurntimeEvents
			where title_id = #arguments.title_id#
			and event_type = 'marker'
			and event_description = '#arguments.marker_start_type#'
			order by event_datetime
		</CFQUERY>
</cfif>
<cfif Len(arguments.marker_stop_type)>

<cfif arguments.marker_stop_type eq 'now'>
<cfset get_stop_marker.event_datetime = '#DateFormat(Now(), "yyyy-mm-dd")# #TimeFormat(Now(), "HH:mm:ss.l")#'>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="get_stop_marker">
			SELECT *
			FROM TurntimeEvents
			where title_id = #arguments.title_id#
			and event_type = 'marker'
			and event_description = '#arguments.marker_stop_type#'
			order by event_datetime
		</CFQUERY>
</cfif>
</cfif>

<cfset timeoffset = "-1">
<cfset turnTimeMinutes = 0>
<cfset stop_time = Now()>


<cfif arguments.turntime_type eq 'open_to_close'>
<CFQUERY datasource="#request.dsn#" NAME="get_times">
			SELECT *
			FROM TurntimeEvents
			where title_id = #arguments.title_id#
			order by event_datetime
		</CFQUERY>
<cfset original_order_date = "">
<cfset found_start = 0>
<cfset found_stop = 0>
<cfset no_stop_event = 0>
<cfloop query="get_times">
	<cfif get_times.event_type eq 'start' or get_times.event_type eq 'resume' and found_start eq 0>
		<cfif original_order_date eq ''>
		<cfset original_order_date = DateAdd("h", timeoffset, get_times.event_datetime)>
		</cfif>
      <cfset start_time = DateAdd("h", timeoffset, get_times.event_datetime)>
	  <cfset found_start = 1>
	  <cfset found_stop = 0>
	  <!--- let's check if there's a stop event on this file yet --->
					<cfquery dbtype="query" name="check_if_stop" maxrows=1>
					SELECT *
					FROM get_times
					where event_datetime > '#get_times.event_datetime#' and (event_type = 'stop' or event_type = 'pause')
					order by event_datetime
					</cfquery>
					<cfif check_if_stop.recordcount eq 0>
					<cfset no_stop_event = 1>
					</cfif>
	  <!--- if start_time is a weekend or a holiday, reset to the next day that is not --->
	  <cfif isWeekend(start_time) or isChaseHoliday(start_time) >
	  	<!--- first we need to look ahead and see if the next stop is on the same day, because if it is, then these hours count too --->
		<cfset complete = 0>
		<cfloop condition="(isWeekend(start_time) or isChaseHoliday(start_time)) and complete eq 0">
					<cfquery dbtype="query" name="get_times2" maxrows=1>
					SELECT *
					FROM get_times
					where event_datetime > '#get_times.event_datetime#' and (event_type = 'stop' or event_type = 'pause')
					order by event_datetime
					</cfquery>

					<cfif DateFormat(start_time, "mm-dd-yyyy") NEQ DateFormat(DateAdd("h", timeoffset, get_times2.event_datetime), "mm-dd-yyyy") and isSunday(DateFormat(DateAdd("h", timeoffset, get_times2.event_datetime), "mm-dd-yyyy")) eq 0>
					<cfset start_time = DateAdd("d", 1, start_time)>
					<cfset start_time = CreateDateTime(DatePart("yyyy", start_time),DatePart("m", start_time),DatePart("d", start_time),'07','30','00')>
					<cfelse>
					<cfset complete = 1>
					</cfif>
	  </cfloop>
	  <!--- ENDif start_time is a weekend or a holiday, reset to the next day that is not --->
	  </cfif>
    </cfif>
	
		<cfif (get_times.event_type eq 'stop' or get_times.event_type eq 'pause' or no_stop_event eq 1) and found_stop eq 0>
			  <cfset found_stop = 1>
			  <cfset found_start = 0>
	          
            <cfif no_stop_event eq 1>
			<cfset stop_time = DateAdd("h", timeoffset, Now())>
			<cfelse>
			<cfset stop_time = DateAdd("h", timeoffset, get_times.event_datetime)>
			</cfif>
			
			<cfset turnTimeMinutes = turnTimeMinutes + DateDiff("n", start_time, stop_time)>
			<cfset check_start_time = DateFormat(start_time, "yyyy-mm-dd")>
			<cfset check_stop_time = DateFormat(stop_time, "yyyy-mm-dd")>
				<cfloop condition="check_start_time neq check_stop_time">
					<cfif (isWeekend(check_start_time) or isChaseHoliday(check_start_time))and check_start_time neq DateFormat(start_time, "yyyy-mm-dd") and check_start_time neq DateFormat(stop_time, "yyyy-mm-dd")>
					<cfset turnTimeMinutes = turnTimeMinutes - 1440> <!--- take off 24 hours --->
					</cfif>
					<cfif isSunday(check_start_time) and check_start_time neq DateFormat(start_time, "yyyy-mm-dd") and check_start_time neq DateFormat(stop_time, "yyyy-mm-dd")>
					<cfset turnTimeMinutes = turnTimeMinutes - 510> <!--- take off additional minues from midnight to 8:30 am Monday  --->
					</cfif>
					<cfif isSunday(check_stop_time)>
					<cfset turnTimeMinutes = turnTimeMinutes - 510> <!--- take off additional minues from midnight to 8:30 am Monday  --->
					</cfif>
				<cfset check_start_time = DateAdd("d", 1, check_start_time)>
				</cfloop>
		</cfif>

</cfloop>
</cfif>

<cfif arguments.marker_stop_type eq 'now'>
<cfset get_stop_marker.event_datetime = '#DateFormat(Now(), "yyyy-mm-dd")# #TimeFormat(Now(), "HH:mm:ss.l")#'>

<cfelse>

<cfif arguments.turntime_type eq 'marker'>
 <cfif get_start_marker.recordcount eq 0 or get_stop_marker.recordcount eq 0>
 <cfset returnHoursMinutes = ''> 
 <cfreturn returnHoursMinutes>
 <cfabort>
 </cfif>

</cfif>


<cfif Len(get_start_marker.event_datetime)>
<cfset start_time = get_start_marker.event_datetime>
<cfelse>
<cfset start_time = DateFormat(Now(), "yyyy-mm-dd") & " " & TimeFormat(Now(), "hh:mm:ss")>
</cfif>

<cfif Len(get_stop_marker.event_datetime)>
<cfset stop_time = get_stop_marker.event_datetime>
<cfelse>
<cfset stop_time = DateFormat(Now(), "yyyy-mm-dd") & " " & TimeFormat(Now(), "hh:mm:ss")>
</cfif>


			<cfset turnTimeMinutes = turnTimeMinutes + DateDiff("n", start_time, stop_time)>
			<cfset check_start_time = DateFormat(start_time, "yyyy-mm-dd")>
			<cfset check_stop_time = DateFormat(stop_time, "yyyy-mm-dd")>
				<cfloop condition="check_start_time neq check_stop_time">
					<cfif (isWeekend(check_start_time) or isChaseHoliday(check_start_time))and check_start_time neq DateFormat(start_time, "yyyy-mm-dd") and check_start_time neq DateFormat(stop_time, "yyyy-mm-dd")>
					<cfset turnTimeMinutes = turnTimeMinutes - 1440> <!--- take off 24 hours --->
					</cfif>
					<cfif isSunday(check_start_time) and check_start_time neq DateFormat(start_time, "yyyy-mm-dd") and check_start_time neq DateFormat(stop_time, "yyyy-mm-dd")>
					<cfset turnTimeMinutes = turnTimeMinutes - 510> <!--- take off additional minues from midnight to 8:30 am Monday  --->
					</cfif>
					<cfif isSunday(check_stop_time)>
					<cfset turnTimeMinutes = turnTimeMinutes - 510> <!--- take off additional minues from midnight to 8:30 am Monday  --->
					</cfif>
				<cfset check_start_time = DateAdd("d", 1, check_start_time)>
				</cfloop>
</cfif>



<cfset returnDaysHoursMinutes = #MinutesToDaysHoursMins(turnTimeMinutes)#>

<cfif returnDaysHoursMinutes eq "00:00:00">
<cfset returnDaysHoursMinutes = ''>
</cfif>
<cfreturn returnDaysHoursMinutes>

</cffunction>

</cfcomponent>

