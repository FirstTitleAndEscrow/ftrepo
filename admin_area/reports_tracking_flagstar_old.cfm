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



<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:##000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>

	<CFQUERY datasource="#request.dsn#" NAME="get_recs">
		select t.title_id, t.paddress, t.pcity, t.pstate, t.a_insert_date, t.a_insert_time, t.loan_number, l.closing_date,l.l_date,
		min(t1.n_date) as n_date, min(t1.n_time) as n_time, min(t2.n_date) as n_date2, min(t2.n_time) as n_time2
		 from title t
		 inner join companies c on c.id = t.comp_id
		left join title_notes t1 on (t1.order_ID = t.title_ID AND (t1.n_note LIKE '%Binder Completed%' OR t1.n_note LIKE '%Title Commitment Delivered%'))
		left join title_notes t2 on (t2.order_ID = t.title_ID AND (t2.n_note LIKE '%Loan Funded%'))
		
		inner join eventlist l on l.title_id = t.title_id
		where c.company LIKE '%Flagstar%'
		AND t.title_id > 98792
		AND t.appraisal_status <> 'Cancelled Per Client'
		AND t.appraisal_status <> 'Order Cancelled'
		AND t.cancelled IS NULL
		group by  t.title_id, t.paddress, t.pcity, t.pstate, t.a_insert_date, t.a_insert_time, t.loan_number, l.closing_date,l.l_date
		order by t.title_id
    </CFQUERY>
	
	


<table border=1 cellspacing=4 cellpadding=4 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Order Date</strong></td>
<td align="left" valign="bottom"><strong>Loan Number</strong></td>
<td align="left" valign="bottom"><strong>Title ID</strong></td>
<td align="left" valign="bottom"><strong>Address</strong></td>
<td align="left" valign="bottom"><strong>City</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="center" valign="bottom"><strong>Title Ordered<br>to<BR>Title Binder Sent</strong></td>
<td align="left" valign="bottom"><strong>Closed</strong></td>
<td align="left" valign="bottom"><strong>Funded</strong></td>
<!---
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
<cfif Len(a_insert_date)>
	<cfset pstart = ParseDateTime(ListFirst(a_insert_date," ")&" "&ListLast(a_insert_time," "))>	
</cfif>
<cfif Len(N_date)>
	<cfset pbinder_sent = ParseDateTime(ListFirst(n_date," ")&" "&ListLast(n_time," "))>
<cfelse>
	<cfset pbinder_sent = Now()>
</cfif>



<tr bgcolor="#bgcolor#">
	<td>#DateFormat(a_insert_date,"mm/dd/yyyy")#</td>
	<td>#loan_number#</td>
<td><strong>#title_id#</strong></td>
<td>#paddress#</td>
<td>#pcity#</td>
<td>#pstate#</td>
<cfset dayscol1 = countArbitraryDaysExcluding(pstart,pbinder_sent,"1,7",false,false)>
<cfset hourscol1 = DateDiff("h",pstart,pbinder_sent) Mod 24>
<cfset mincol1 = DateDiff("n",pstart,pbinder_sent) Mod 60>
<cfset totalhours = totalhours + hourscol1>
<cfset totalminutes = totalminutes + mincol1>
<cfif Len(n_date)>
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
<td style="color:#col1color#">

<cfif DateDiff("d",pstart,pbinder_sent) GT 0>#dayscol1#<cfset totaldays = totaldays + dayscol1><cfelse>0</cfif> : #hourscol1# : #mincol1#
	


</td>
<td>#DateFormat(l_date,"mm/dd/yyyy")#</td>
<td>#DateFormat(n_date2,"mm/dd/yyyy")#</td>

<!---
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
