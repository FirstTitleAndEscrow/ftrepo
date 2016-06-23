
<cfscript>

   
    function bizMins(begin_dt,end_dt){
      
      var startofday=7.5;
      var endofday=18.5;
      var lunchhour=12;
      var returnUnit="n";
     
      //init other variables to be used throughout the UDF
      var useStartEndTimes=false;
      var totMins=0; //variable to hold running total of business minutes
      var datelist=""; //list variable to hold a generated list of date times; start date, end date, and every date in between.
      var tmpdate=""; //working variable
      var i=1;//just a generic counter
      var eodate="";//temp variable to hold the created datetime used in calculating minutes between a given datetime and end of that day
      var tmpMins=0;//temp variable to hold calculated minutes to be added in
      var workdayminutes=0;//constant that will be calculated after validating options passed in.
     
      //validate that our start and end dates are valid and in the correct order, otherwise toss the caller an error and halt everything now.
      if(not isDate(begin_dt) OR not isDate(end_dt)){//if either one is not a real date
          throw("customError", "bizMins requires two valid datetimes. You passed in:" & begin_dt & " and " & end_dt);
        return;
      }
      if(DateCompare(begin_dt,end_dt,"n") eq 0){//if they are the same date and time
          throw("customError","bizMins requires two valid datetimes that are not the same. You passed in:" & begin_dt & " and " & end_dt);
        return;
      }
      if(DateCompare(begin_dt,end_dt,"n") eq 1){//meaning our begin_dt is greater than our end_dt
          throw("customError","bizMins requires that your start datetime be less than your end datetime. You passed in:" & begin_dt & " and " & end_dt);
        return;
      }
     
      //Okay, made it through that gauntlet. Now work with any optional parameters that were passed in and use their values where
      //we're able to do so.
     
      //if we received optional parameters startofday and endofday, make sure the latter is greater than the former
      if(ArrayLen(Arguments) gte 4){
          if(validHour(Arguments[4]) and validHour(Arguments[3])){
            if(Arguments[4] gt Arguments[3]){
                useStartEndTimes=true; //both parameters were valid numeric hours, and the end time was greater than the start time
            }
        }
      }
     
      //final check and validation of optional parameters
      switch(ArrayLen(Arguments)) {
          case 6: if (listfind("s,n,h,d",Arguments[6]) gt 0){
                    returnUnit=Arguments[6];
                }
        case 5: if (validHour(Arguments[5])){
                    if(useStartEndTimes){//if we're using passed in start and end hours, make sure lunch is between the two
                        if (Arguments[5] gt Arguments[3] and Arguments[5] lt Arguments[4]){
                            lunchhour=int(Arguments[5]);
                        }
                    }
                    else{//not using the passed in start and end times due to the fact they failed validation, so compare to default values.
                        if (Arguments[5] gt startofday and Arguments[5] lt endofday){
                            lunchhour=int(Arguments[5]);
                        }
                    }
                }
        case 4: if(useStartEndTimes){
                    endofday=Arguments[4];
                }
        case 3: if(useStartEndTimes){
                    startofday=Arguments[3];
                }
        case 2: break;
      }//end of switch statement
    //End of evaluating optional parameters. Ready to rock and roll. Let's do some kalkulashuns
   
    //Calculate the number of hours in a workday for this invocation...(dates used in these next steps are insignificant...don't worry about changing them)
    tmpdate=createdatetime(2004,1,30,startofday,0,0);
    eodate=createdatetime(2004,1,30,endofday,0,0);
    workdayminutes=abs(datediff("n",tmpdate,eodate));
    //workdayminutes=workdayminutes-60;//gotta take lunch outa there...
    //reset the temp vars for later use
    tmpdate="";
    eodate="";
   
    /* build list of datetimes to feed our main iteration...every date between startdate and end date, inclusive */
        datelist=listappend(datelist,begin_dt); //add in the start date
        tmpdate=begin_dt;
        for(i=1; i lt abs(datediff("d",begin_dt,end_dt)); i=i+1){//add in dates in between...
            tmpdate=dateadd("d",1,createdatetime(year(tmpdate),month(tmpdate),day(tmpdate),endofday,0,0));
            datelist=listappend(datelist,tmpdate);
        }
        datelist=listappend(datelist,end_dt);//tack on the end date
        // writeoutput("list of dates:" & datelist & "<br />");
    //list of dates built, including startdate, all dates in between, and end date.
    //It is possible that the two dates submitted are for the same date, with different times. Evaluate that possibility here
    if(listlen(datelist) eq 2 and dateformat(begin_dt,"mm/dd/yy") IS dateformat(end_dt,"mm/dd/yy")){
        if (not IsHoliday(begin_dt) and not IsWeekend(begin_dt)){
   
            if (hour(listgetat(datelist,2)) gt startofday){//make sure that we have some minutes that actually extend into the workday
                if (hour(listgetat(datelist,1)) gt startofday){
                    totMins=abs(datediff("n",begin_dt,end_dt));
                }
                else {
                    eodate=createdatetime(year(tmpdate),month(tmpdate),day(tmpdate),startofday,0,0);
                    totMins=abs(datediff("n",eodate,end_dt));
                }
            }
        }
    }
    else{//not the same date...we have minutes to calculate
        /* Now, Loop through each datetime, ask a few questions of it, add in any appropriate biz mins to the running total */
          for (i=1; i lte listlen(datelist); i=i+1){
              //grab this iteration's date...
            tmpdate=listgetat(datelist,i);
            //run this date through the first gauntlet of questions
                //first, we make sure the date is not a holiday and is not a weekend
            if (not IsHoliday(tmpdate) AND not IsWeekend(tmpdate)){
                //writeoutput(" is not a weekend or holiday<br />");
                //Is this date the starting or ending date? IF so, we'll need to calculate partial work hours.
                if (tmpdate IS begin_dt OR tmpdate IS end_dt){//go through the logic to calculate partial work hours
                    if (tmpdate IS begin_dt){//if it's the start date, we look at things different than if its the end date
                        //writeoutput(tmpdate & " is the start date<br />");
                        if(hour(tmpdate) lt startofday){//hour is earlier than start of day. Add in a full day's minutes.
                            totmins=totmins + workdayminutes;
                        }
                        else if (hour(tmpdate) lt endofday and hour(tmpdate) gte startofday){//hour is in the midst of the workday, so figure out how many minutes to add in
                            //now calculate the number of minutes between tmpdate hour and endofday hour
                            eodate=createdatetime(year(tmpdate),month(tmpdate),day(tmpdate),endofday,0,0);
                            tmpMins=abs(datediff("n",tmpdate,eodate));
                            //Now, if our timespan contains the lunch hour, we need to subtract 60 minutes
                            //EMB comment out lunch hour logic
                            //if(hour(tmpdate) lte lunchhour){
                            //    tmpMins=tmpMins-60;
                           // }
							
                        //NOW, add in this day's minutes to the running total
                        totmins=totmins+tmpMins;
                        } //end of else if
                    }
                    else {//it's the end date. evaluate things in that light.
                        //writeoutput(tmpdate & " is the end date<br />");
                        //if hour(tmpdate) lt startofday, then this datetime ended before the work day began...we'll be adding nothing if this is the case. There is no if or else looking for this situation.
                        if(hour(tmpdate) gte endofday){//hour is greater than end of day(meaning they worked past hours on the last date). Add in a full day's minutes.
                            totmins=totmins + workdayminutes;
                        }
                        else if (hour(tmpdate) lt endofday and hour(tmpdate) gte startofday){//hour is in the midst of the workday, so figure out how many minutes to add in
                            //now calculate the number of minutes between tmpdate hour and endofday hour
                            eodate=createdatetime(year(tmpdate),month(tmpdate),day(tmpdate),startofday,0,0);
                            tmpMins=abs(datediff("n",tmpdate,eodate));
                            //Now, if our timespan contains the lunch hour, we need to subtract 60 minutes
                             //EMB comment out lunch hour logic
                            //if(hour(tmpdate) lte lunchhour){
                            //    tmpMins=tmpMins-60;
                            //}
							
                        //NOW, add in this day's minutes to the running total
                        totmins=totmins+tmpMins;
                        } //end of else if                       
                    }//end of else section evaluating an end date's minutes
                }//close of IF this date is start or end date
                else {//this date is an in between date, so we just add in a full day's minutes to our total
                    totmins=totmins + workdayminutes;
                }
            } else {//tmpdate is either a weekend, holiday, or has a timestamp after working hours, so we're skipping this date's minutes
                //writeoutput(" IS a weekend or holiday<br />");
            }
          }//close of for loop through list of dates
      }//close of the big IF that looked to see if the incoming dates were the same
     
      //Got total minutes. Now to convert to desired "return units" as specified in var returnunits, and return the value
      switch(returnUnit){
          case "n":
            return totMins;
            break;
        case "h":
            return (totMins/60);
            break;
        case "s":
            return (totMins*60);
            break;
        default:
            return (totMins/workdayminutes);
            break;
      }
    }//end of function
   




    function isholiday(datein){
        var holidaylist="";
        var thisdate="";
        var j=1;
        if(not isDate(datein)){//if either one is not a real date
              throw("customError", "IsHoliday requires a valid date.");
            return;
          }
         holidaylist=GetCompanyHolidays(year(datein));
        for(j=1; j lte listlen(holidaylist); j=j+1){
            thisdate=listgetat(holidaylist,j);
            if (dateformat(thisdate,"mm/dd/yy") IS dateformat(datein,"mm/dd/yy")){
                return true;
            }
        }
        return false;
    }
   
   
    function isweekend(datein){
        if(not isDate(datein)){//if datein is not a real date
              throw("customError", "IsWeekend requires a valid date.");
            return;
          }
        if (dayofweek(datein) lt 7 and dayofweek(datein) gt 1){
            return false;
        }
        else{
            return true;
        }
    }
   
    function validHour(hourIn){
        if(isnumeric(hourIn) AND (int(hourIn) IS hourIn) AND (hourIn gte 0 AND hourIn lte 2359)){
            return true;
        }
        else {
            return false;
        }
    }




     
    function getCompanyHolidays(calendar_year) {
        var thisYear=calendar_year;
        var NewYearsDay="";
        var MemorialDay="";
        var IndependenceDay="";
        var LaborDay="";
        var ThanksgivingDay="";
        var ChristmasDay="";
        var NextNewYearsDay="";
        var HolidayList="";
       
        // if next new year's day is on a saturday, we have to put the holiday on the current ay="";
        ChristmasDay="";
        NextNewYearsDay="";
        HolidayList="";
       
        // if next new year's day is on a saturday, we have to put the holiday on the current calendar year Dec 31st. - screwy...
        if(dayofweek("1-1-" & thisYear+1) eq 7)
            NextNewYearsDay="12-31-" & thisYear;
        else if(dayofweek("1-1-" & thisYear+1) eq 1)
            NextNewYearsDay="1-2-" & thisYear+1;
        else
            NextNewYearsDay="1-1-" & thisYear+1;
       
        if(dayofweek("1-1-" & thisYear) eq 1)
            NewYearsDay="1-2-" & thisYear;
        else
            NewYearsDay="1-1-" & thisYear;
       
        MemorialDay="5-" & GetLastOccOfDayInMonth(2,5,thisYear) & "-" & thisYear;
       
        if(dayofweek("7-4-" & thisYear) eq 7)
            IndependenceDay="7-3-" & thisYear;
        else if(dayofweek("7-4-" & thisYear) eq 1)
            IndependenceDay="7-5-" & thisYear;
        else
            IndependenceDay="7-4-" & thisYear;

        LaborDay="9-" & GetNthOccOfDayInMonth(1,2,9,thisYear) & "-" & thisYear;
        ThanksgivingDay="11-" & GetNthOccOfDayInMonth(4,5,11,thisYear) & "-" & thisYear;
       
        if(dayofweek("12-25-" & thisYear) eq 7)
            ChristmasDay="12-24-" & thisYear;
        else if(dayofweek("7-4-" & thisYear) eq 1)
            ChristmasDay="12-26-" & thisYear;
        else
            ChristmasDay="12-25-" & thisYear;
       
        HolidayList=createodbcdatetime(NewYearsDay) & ",";
        HolidayList=HolidayList & createodbcdatetime(MemorialDay) & ",";
        HolidayList=HolidayList & createodbcdatetime(IndependenceDay) & ",";
        HolidayList=HolidayList & createodbcdatetime(LaborDay) & ",";
        HolidayList=HolidayList & createodbcdatetime(ThanksgivingDay) & ",";
        HolidayList=HolidayList & createodbcdatetime(ChristmasDay) & ",";
        HolidayList=HolidayList & createodbcdatetime(NextNewYearsDay);
       
        //return returnStruct;
        return HolidayList;
    }
    
    function GetNthOccOfDayInMonth(NthOccurrence,TheDayOfWeek,TheMonth,TheYear) {
        Var TheDayInMonth=0;
        if(TheDayOfWeek lt DayOfWeek(CreateDate(TheYear,TheMonth,1))){
            TheDayInMonth= 1 + NthOccurrence*7    + (TheDayOfWeek - DayOfWeek(CreateDate(TheYear,TheMonth,1))) MOD 7;
        }
        else{
            TheDayInMonth= 1 + (NthOccurrence-1)*7    + (TheDayOfWeek - DayOfWeek(CreateDate(TheYear,TheMonth,1))) MOD 7;
        }
        //If the result is greater than days in month or less than 1, return -1
        if(TheDayInMonth gt DaysInMonth(CreateDate(TheYear,TheMonth,1)) OR     TheDayInMonth lt 1){
            return -1;
        }
        else{
            return TheDayInMonth;
        }
    }
   
   
  
    function GetLastOccOfDayInMonth(TheDayOfWeek,TheMonth,TheYear) {
        //Find The Number of Days in Month
        var TheDaysInMonth=DaysInMonth(CreateDate(TheYear,TheMonth,1));
     
         //find the day of week of Last Day
         var DayOfWeekOfLastDay=DayOfWeek(CreateDate(TheYear,TheMonth,TheDaysInMonth));
     
         //subtract DayOfWeek
         var DaysDifference=DayOfWeekOfLastDay - TheDayOfWeek;
     
         //Add a week if it is negative
        if(DaysDifference lt 0) {
            DaysDifference=DaysDifference + 7;
        }
        return TheDaysInMonth-DaysDifference;
    }
</cfscript>
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
		select t.title_id, t.paddress, t.pcity, t.pcounty, t.pstate, t.on_hold, t.a_insert_date, t.a_insert_time, t.loan_number, t.docs_recorded_date, t.sec_inst_date, t.pname, t.flagstar_hud_req, t.flagstar_hud_completed, t.flagstar_policy_issued, l.closing_date,l.l_date,
		min(t1.n_date) as n_date, min(t1.n_time) as n_time, min(t2.n_date) as n_date2, min(t2.n_time) as n_time2,
		t3.n_date as schedCompDate, t3.n_time as schedCompTime
		 from title t
		 inner join companies c on c.id = t.comp_id
		left join title_notes t1 on (t1.order_ID = t.title_ID AND (t1.n_note LIKE '%Binder Completed%' OR t1.n_note LIKE '%Title Commitment Delivered%'))
		left join title_notes t2 on (t2.order_ID = t.title_ID AND (t2.n_note LIKE '%Loan Funded%'))
		left join title_notes t3 on (t3.order_ID = t.title_ID AND (t3.n_note LIKE '%Closing assigned to vendor%'))
		inner join eventlist l on l.title_id = t.title_id
		where c.company LIKE '%Flagstar%'
		AND (t.title_id > 98792 OR t2.n_date > '1/1/2013')
		AND t.appraisal_status <> 'Cancelled Per Client'
		AND t.appraisal_status <> 'Order Cancelled'
		AND t.cancelled IS NULL
		group by  t.title_id, t.paddress, t.pcity, t.pcounty, t.pstate, t.on_hold, t.a_insert_date, t.a_insert_time, t.loan_number, t.docs_recorded_date, t.sec_inst_date, t.pname, t.flagstar_hud_req, t.flagstar_hud_completed, t.flagstar_policy_issued, l.closing_date,l.l_date,
		t3.n_date, t3.n_time
		order by t.title_id
    </CFQUERY>
	
	
<!--- <CFDUMP VAR="#get_recs#">
<CFABORT> --->

<table border=1 cellspacing=4 cellpadding=4 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Title ID</strong></td>
<td align="left" valign="bottom"><strong>Order Date</strong></td>
<td align="left" valign="bottom"><strong>Order Time</strong></td>
<td align="left" valign="bottom"><strong>Loan Number</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="left" valign="bottom"><strong>County</strong></td>
<td align="left" valign="bottom"><strong>Processor</strong></td>
<td align="left" valign="bottom"><strong>Commit Comp Date</strong></td>
<td align="left" valign="bottom"><strong>Commit Comp Time</strong></td>
<td align="left" valign="bottom"><strong>Order to Commit</strong></td>
<td align="left" valign="bottom"><strong>Title Clear Date</strong></td>
<td align="left" valign="bottom"><strong>Title Clear Time</strong></td>
<td align="left" valign="bottom"><strong>Commitment to Clear</strong></td>
<td align="left" valign="bottom"><strong>Sched Req Date</strong></td>
<td align="left" valign="bottom"><strong>Sched Req Time</strong></td>
<td align="left" valign="bottom"><strong>Sched Comp Date</strong></td>
<td align="left" valign="bottom"><strong>Sched Comp Time</strong></td>
<td align="left" valign="bottom"><strong>Sched Req to Sched Comp</strong></td>
<td align="left" valign="bottom"><strong>HUD Req Date</strong></td>
<td align="left" valign="bottom"><strong>HUD Req Time</strong></td>
<td align="left" valign="bottom"><strong>HUD Comp Date</strong></td>
<td align="left" valign="bottom"><strong>HUD Comp Time</strong></td>
<td align="left" valign="bottom"><strong>HUD Req to HUD Comp</strong></td>
<td align="left" valign="bottom"><strong>Closed</strong></td>
<td align="left" valign="bottom"><strong>Funded</strong></td>
<td align="left" valign="bottom"><strong>Disburse Date</strong></td>
<td align="left" valign="bottom"><strong>Rec Date</strong></td>
<td align="left" valign="bottom"><strong>Policy Issued</strong></td>
<td align="left" valign="bottom"><strong>Security Instrument</strong></td>
<td align="left" valign="bottom"><strong>On Hold</strong></td>
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

<CFSET pstart = '#DateFormat(pstart, "mm/dd/yyyy")# #TimeFormat(pstart, "HH:mm")#'>
<CFSET pbinder_sent = '#DateFormat(pbinder_sent, "mm/dd/yyyy")# #TimeFormat(pbinder_sent, "HH:mm")#'>

<tr bgcolor="#bgcolor#">
<td><strong>#title_id#</strong></td>
<td>#DateFormat(a_insert_date,"mm/dd/yyyy")#</td>
<td>#TimeFormat(a_insert_time,"short")#</td>
<td>#loan_number#</td>
<td>#pstate#</td>
<td>#pcounty#</td>
<td>#pname#</td>

<td><!--- Commt Comp --->
#DateFormat(pbinder_sent,"mm/dd/yyyy")#</td>
<td>#TimeFormat(pbinder_sent,"short")#</td>



<!---Order to Commit --->
<cfset dayscol1 = countArbitraryDaysExcluding(pstart,pbinder_sent,"1,7",false,false)>
<cfset hourscol1 = DateDiff("h",pstart,pbinder_sent) Mod 24>
<cfset mincol1 = DateDiff("n",pstart,pbinder_sent) Mod 60>
<cftry>
<cfset hourscol1a = Int(bizMins(pstart,pbinder_sent,9,17,12,"h")*100)/100>
<cfcatch>
	<cfset hourscol1a = "">
</cfcatch>
</cftry>
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
<cfif isNumeric(hourscol1a)>
#Int(hourscol1a/8)#:#hourscol1a mod 8#:#mincol1#
</cfif>
</td>



	<CFQUERY datasource="#request.dsn#" NAME="get_userRoles">
		select * from tblUser_Roles
		where title_id = #title_id#
    </CFQUERY>




<td><!--- title Clear --->#DateFormat(get_userRoles.cleartoclose_End_Datetime,"mm/dd/yyyy")#</td>
<td>#TimeFormat(get_userRoles.cleartoclose_End_Datetime,"short")#</td>



<!--- Commit to Clear--->

<cfif Len(get_userRoles.cleartoclose_End_Datetime)>
	<cfset title_cleared = ParseDateTime(get_userRoles.cleartoclose_End_Datetime)>
<cfelse>
	<cfset title_cleared = Now()>
</cfif>

<CFSET title_cleared = '#DateFormat(title_cleared, "mm/dd/yyyy")# #TimeFormat(title_cleared, "HH:mm")#'>

<cfset dayscol1 = countArbitraryDaysExcluding(pbinder_sent,title_cleared,"1,7",false,false)>
<cfset hourscol1 = DateDiff("h",pbinder_sent,title_cleared) Mod 24>
<cfset mincol1 = DateDiff("n",pbinder_sent,title_cleared) Mod 60>
<cftry>
<cfset hourscol1a = Int(bizMins(pbinder_sent,title_cleared,9,17,12,"h")*100)/100>
<cfcatch>
	<cfset hourscol1a = "">
</cfcatch>
</cftry>
<cfset totalhours = totalhours + hourscol1>
<cfset totalminutes = totalminutes + mincol1>
<cfif Len(get_userRoles.cleartoclose_End_Datetime)>
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
<cfif isNumeric(hourscol1a)>
#Int(hourscol1a/8)#:#hourscol1a mod 8#:#mincol1#
</cfif>
</td>



	<CFQUERY datasource="#request.dsn#" NAME="get_closing_req">
		select * from Title_Closing_Order_Request
		where title_id = #title_id#
    </CFQUERY>


<td><!--- Sched Req --->#DateFormat(get_closing_req.a_filled_out_date,"mm/dd/yyyy")#</td>
<td>#TimeFormat(get_closing_req.a_filled_out_time,"short")#</td>
<CFSET sched_req = '#DateFormat(get_closing_req.a_filled_out_date, "mm/dd/yyyy")# #TimeFormat(get_closing_req.a_filled_out_time, "HH:mm")#'>



	<CFQUERY datasource="#request.dsn#" NAME="get_eventlist">
		select * from EventList
		where title_id = #title_id#
    </CFQUERY>


<td><!--- Sched Comp --->
<!---
#DateFormat(get_eventlist.sc_dateandtime,"mm/dd/yyyy")#<br>
#TimeFormat(get_eventlist.sc_dateandtime,"short")#
--->
#DateFormat(schedCompDate,"mm/dd/yyyy")#</td>
<td>#TimeFormat(schedCompTime,"short")#
</td>
<!---
<CFSET sched_comp = '#DateFormat(get_eventlist.sc_dateandtime, "mm/dd/yyyy")# #TimeFormat(get_eventlist.sc_dateandtime, "HH:mm:ss")#'>
--->
<CFSET sched_comp = '#DateFormat(schedCompDate, "mm/dd/yyyy")# #TimeFormat(schedCompTime, "HH:mm")#'>




<!--- Sched req to Sched Comp --->
<cfif Len(sched_req) and IsDate(sched_req)>
	<cfset sched_req = ParseDateTime(sched_req)>
<cfelse>
	<cfset sched_req = Now()>
</cfif>

<cfif Len(sched_comp) and IsDate(sched_comp)>
	<cfset sched_comp = ParseDateTime(sched_comp)>
<cfelse>
	<cfset sched_comp = Now()>
</cfif>

<cfset dayscol1 = countArbitraryDaysExcluding(sched_req,sched_comp,"1,7",false,false)>
<cfset hourscol1 = DateDiff("h",sched_req,sched_comp) Mod 24>
<cfset mincol1 = DateDiff("n",sched_req,sched_comp) Mod 60>
<cftry>
<cfset hourscol1a = Int(bizMins(sched_req,sched_comp,9,17,12,"h")*100)/100>
<cfcatch>
	<cfset hourscol1a = "">
</cfcatch>
</cftry>
<cfset totalhours = totalhours + hourscol1>
<cfset totalminutes = totalminutes + mincol1>
<cfif Len(sched_req)>
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
<cfif isNumeric(hourscol1a)>
#Int(hourscol1a/8)#:#hourscol1a mod 8#:#mincol1#
</cfif>
</td>



<td style="color:#col1color#">
#DateFormat(get_recs.flagstar_hud_req, "mm/dd/yyyy")#</td>
<td>#TimeFormat(get_recs.flagstar_hud_req,"short")#
</td>
<td style="color:#col1color#">
#DateFormat(get_recs.flagstar_hud_completed, "mm/dd/yyyy")#</td>
<td>#TimeFormat(get_recs.flagstar_hud_completed,"short")#
</td>

<!--- Sched req to Sched Comp --->
<cfif Len(get_recs.flagstar_hud_req) and IsDate(get_recs.flagstar_hud_req)>
	<cfset hud_req = ParseDateTime(get_recs.flagstar_hud_req)>
<cfelse>
	<cfset hud_req = Now()>
</cfif>


<cfif Len(get_recs.flagstar_hud_completed) and IsDate(get_recs.flagstar_hud_completed)>
	<cfset hud_completed = ParseDateTime(get_recs.flagstar_hud_completed)>
<cfelse>
	<cfset hud_completed = Now()>
</cfif>


<cfset dayscol1 = countArbitraryDaysExcluding(hud_req,hud_completed,"1,7",false,false)>
<cfset hourscol1 = DateDiff("h",hud_req,hud_completed) Mod 24>
<cfset mincol1 = DateDiff("n",hud_req,hud_completed) Mod 60>
<cftry>
<cfset hourscol1a = Int(bizMins(hud_req,hud_completed,9,17,12,"h")*100)/100>
<cfcatch>
	<cfset hourscol1a = "">
</cfcatch>
</cftry>
<cfset totalhours = totalhours + hourscol1>
<cfset totalminutes = totalminutes + mincol1>
<cfif Len(hud_req)>
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
<cfif isNumeric(hourscol1a)>
#Int(hourscol1a/8)#:#hourscol1a mod 8#:#mincol1#
</cfif>
</td>



<!--- closed date --->
<td style="color:#col1color#">
#DateFormat(get_eventlist.cl_dateandtime, "mm/dd/yyyy")#
</td>
<!--- funded date --->
<td style="color:#col1color#">
#DateFormat(get_eventlist.fl_dateandtime, "mm/dd/yyyy")#
</td>
<!--- disburse date --->
<td style="color:#col1color#">
#DateFormat(get_eventlist.fl_dateandtime, "mm/dd/yyyy")#
</td>


<!--- docs recorded date --->
<td style="color:#col1color#">
#DateFormat(get_recs.docs_recorded_date, "mm/dd/yyyy")#
</td>


<!--- Policy Issued date --->
<td style="color:#col1color#">
#DateFormat(get_recs.flagstar_policy_issued, "mm/dd/yyyy")#
</td>


<!--- Security Instrument date --->
<td style="color:#col1color#">
#DateFormat(get_recs.sec_inst_date, "mm/dd/yyyy")#
</td>


<!--- On Hold Status --->
<td style="color:#col1color#">
<cfif get_recs.on_hold eq 'True'>X<cfelse>&nbsp;</cfif>
</td>









<!--- <td>#paddress#</td>
<td>#pcity#</td>
<td>#pstate#</td>

<td>#DateFormat(l_date,"mm/dd/yyyy")#</td>
<td>#DateFormat(n_date2,"mm/dd/yyyy")#</td> --->

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
