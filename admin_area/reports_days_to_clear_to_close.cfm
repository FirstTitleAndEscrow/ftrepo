<cfscript>
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

<cfquery name="GetCleartoClosedDay" datasource="#request.dsn#">
	Select  f.va_employee, f.ft_fairfax_employee, f.id as f_id, t.Title_ID,t.on_hold,t.bfirstname1 + ' ' + t.blastname1 'Name', c.company ,a.N_Date 'Not_Clear_to_Close_Date' ,
	CONVERT (time,a.N_time),
	a.N_time 'Not_Clear_to_Close_Time', b.N_Date 'Clear_to_Close_Date',b.N_time 'Clear_to_Close_Time', 
	Date_Diff=(CASE WHEN DATEDIFF("hh",a.N_time,b.N_time) < 0 THEN DATEDIFF("d",a.N_Date,b.N_Date)-1 ELSE DATEDIFF("d",a.N_Date,b.N_Date) END), 
	Time_Diff=(CASE  WHEN DATEDIFF("hh",a.N_time,b.N_time) < 0 THEN DATEDIFF("hh",a.N_time,b.N_time)+ 24 ELSE DATEDIFF("hh",a.N_time,b.N_time) END),
	t.order_date 
	from  
	sqlNotCleartoCloseSimpleIssue a,
	sqlCleartoClose b, title t,Companies c, first_admin f
	where a.Order_ID=b.Order_ID and
	a.Order_ID=t.title_id and t.comp_id=c.id 
	and f.ID = c.intSales
	and b.N_Date>a.N_Date
	order by t.order_date desc
</cfquery>


<html>
	<title>
		Days to Clear to Close
	</title>
<head>


<script type="text/javascript" src="/admin_area/javascript/jquery.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

<script type="text/javascript" src="/javascript/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/javascript/TableTools.min.js"></script>


<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="/css/TableTools.css">
<link rel="stylesheet" type="text/css" href="/css/TableTools_JUI.css">

</head>
<style>

#message 
{
     position: relative;
     margin-left: 100px;   
     margin-top: 20px;     
}

td, th
{
       font-family:"Arial";
       font-size:12px;     
}

select
{
       color:blue;
}

.dialog{
       font-family:"Arial";
       font-size:small;
       background:lightgray;
}

.dialog input{
       background-color:#ffffdf;
       color:blue;
}

#btn_add btn_export
{
       cursor:hand;
}
</style>

<script type="text/javascript">	
	  	
	$(document).ready(function(){
		$('#MainTable').dataTable({
			"aaSorting": [[ 3, "desc" ]] ,
			"bPaginate": true,	
		    "bLengthChange": true,
	        "bFilter": true,
	        "bSort": true,
			"bStateSave": true,
	        "bInfo": false,
			"bAutoWidth": false,
			"iDisplayLength": 100,
			"sDom": 'T<"clear">lfrtip',
			"oTableTools": {
			"aButtons": [
				{
					"sExtends": "csv",
					"sButtonText": "Save to CSV"
				},
				
				{
					"sExtends": "xls",
					"sButtonText": "Save to Excel"
				},
				
				{
					"sExtends": "pdf",
					"sButtonText": "Save to PDF"
				}
			],
			
			"sSwfPath": "/media/swf/copy_csv_xls_pdf.swf"	
		  }      	
				
		});			 
				
	});
</script>
<body bgcolor="lightgray" >
<center>
<table width=900><tr><td align="center">
	<form>						
		<table id="MainTable" class="dataTable" width="75%">

			<thead>

				 <tr>
				 	          
				 	<th align="Left" style="width:10%">File No.</th> 
					<th align="Left" style="width:16%">Borrower Name</th>	
					<th align="Left" style="width:14%">Client</th>
					<th align="Left" style="width:10%">Order Date</th> 
					<th align="middle" style="width:10%">Mark as Simple Date</th>	 	       
					<th align="Left" style="width:10%">Mark as Simple Time</th>	
					<th align="middle" style="width:10%">Mark as Clear to Close Date</th>	
					<th align="Left" style="width:10%">Mark as Clear to Close Time</th>	   
					<th align="right" style="width:5%">Date Diff.(Days)</th>	
					<th align="right" style="width:5%">Time Diff. (Hrs.)</th>						 
					<th align="right" style="width:5%">On Hold</th>						 
				 </tr>				 
				 
			</thead>
			<tbody>
				<cfoutput query="GetCleartoClosedDay">
				<tr >
					
					<td align="Left" style="width:10%"><a href="title_report_nav.cfm?uid=56&al=1&rec_id=#title_id#&company_id=0&code=T" target="_new" ><cfif GetCleartoClosedDay.va_employee EQ 1>R-<cfelseif GetCleartoClosedDay.ft_fairfax_employee EQ 1>FX-<cfelse>T-</cfif>#title_id#</a></td> 
					<td align="Left" style="width:16%">#Name#</td>	
					<td align="Left" style="width:14%">#company#</td>
					<td align="middle" style="width:10%">#DateFormat(order_date, "m/d/yyyy")#</td>
					<td align="middle" style="width:10%">#DateFormat(Not_Clear_to_Close_Date, "m/d/yyyy")#</td>
					<td align="Left" style="width:10%">#TimeFormat(Not_Clear_to_Close_Time,"hh:mm:tt")#</td>	
					<td align="middle" style="width:10%">#DateFormat(Clear_to_Close_Date,"m/d/yyyy")#</td>
					<td align="Left" style="width:10%">#TimeFormat(Clear_to_Close_Time,"hh:mm:tt")#</td>	   
					<td align="right" style="width:5%"><!---#bizMins(Not_Clear_to_Close_Date,Clear_to_Close_Date,9,17,12,"d")#--->#CountArbitraryDaysExcluding(Not_Clear_to_Close_Date,Clear_to_Close_Date,"1,7",false,false)#</td>	
					<td align="right" style="width:5%">#Time_Diff#</td>	
					<td align="right" style="width:5%"><cfif GetCleartoClosedDay.on_hold eq 'True'>X<cfelse>&nbsp;</cfif></td>	
					
				</tr>
				</cfoutput>				
			</tbody>
		</table>
	</form>
</td></tr></table>
</center></body>
</html>
<!--- Add (End) Added by Synechron Development for ticket# 733 --->