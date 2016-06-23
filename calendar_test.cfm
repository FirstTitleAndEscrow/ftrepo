<CFPARAM NAME="comp_id" DEFAULT="">


<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE id = '#comp_id#'
ORDER BY company ASC
</CFQUERY>
<cfif #read_company.recordcount# GT 0>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
SELECT *
FROM users
WHERE id = #url.user_id_1#
</CFQUERY>
</cfif>


<cfset first_day_month = #DateFormat(DateAdd("d", -(DatePart("d", Now())-1), Now()), "mm/dd/yyyy")#>
<cfset days_this_month = #DaysInMonth(Now())#>
<cfset last_day_month = #DateFormat(DateAdd("d", days_this_month, first_day_month), "mm/dd/yyyy")#>

<!--- <cfquery datasource="#request.dsn#" name="getEventList">
select max(comp_id) From EventList
where yearmonth >= '#first_day_month#' and yearmonth <= '#last_day_month#'
</cfquery> --->
<cfset fullquery = QueryNew("event_date, type")>


<cfquery datasource="#request.dsn#" name="getEventList">
select * From EventList
where yearmonth >= '#first_day_month#' and yearmonth <= '#last_day_month#' AND (comp_id = #read_company.id#
<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
 or comp_id IN (#read_company.child_ids#)
 </cfif>)
</cfquery>

<cfif getEventList.recordcount>
<cfloop query="getEventList">
<cfset temp = QueryAddRow(fullquery)>
<cfset temp = QuerySetCell(fullquery, "event_date", DatePart("d", getEventList.yearmonth))>
<cfset temp = QuerySetCell(fullquery, "type", "red")>
</cfloop>
</cfif>



<cfquery datasource="#request.dsn#" name="getEventList2">
select * From EventList a, Title_Closing_Order_Request b where a.title_id = b.title_id and (b.request_date >= '#first_day_month#' and b.request_date <= '#last_day_month#') and a.yearmonth is null AND (comp_id = #read_company.id#
<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
 or comp_id IN (#read_company.child_ids#)
 </cfif>)
</cfquery>

<cfif getEventList2.recordcount>
<cfloop query="getEventList2">
<cfset temp = QueryAddRow(fullquery)>
<cfset temp = QuerySetCell(fullquery, "event_date", DatePart('d', getEventList2.request_date))>
<cfset temp = QuerySetCell(fullquery, "type", "black")>
</cfloop>
</cfif>


<cfquery datasource="#request.dsn#" name="getEventList3">
select * From EventList a, Title_Closing_Order_Request_Anc b where a.anc_id = b.anc_id and (b.request_date >= '#first_day_month#' and b.request_date <= '#last_day_month#') and a.yearmonth is null AND (comp_id = #read_company.id#
<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
 or comp_id IN (#read_company.child_ids#)
 </cfif>)
</cfquery>

<cfif getEventList3.recordcount>
<cfloop query="getEventList3">
<cfset temp = QueryAddRow(fullquery)>
<cfset temp = QuerySetCell(fullquery, "event_date", DatePart("d", getEventList3.request_date))>
<cfset temp = QuerySetCell(fullquery, "type", "red_anc")>
</cfloop>
</cfif>


<cfquery dbtype="query" name="detail">
	SELECT *
	FROM fullquery
	order by event_date
</cfquery>



<!--- <cfdump var="#detail#">
<cfabort>
 --->
<!--- <cfif NOT isDefined("data#Evaluate("detail.event_date")#")></cfif> --->
<cfif isdefined('URL.F')>
<cfset y = mid(URL.F,1,4)>
<cfset m = mid(URL.F,5,2)>
<cfset d = mid(URL.F,7,2)>
<cfset h = mid(URL.F,9,2)>
<cfset mn = mid(URL.F,11,2)>
<cfelse>
<cfset y = mid(now(),6,4)>
<cfset m = mid(now(),11,2)>
<cfset d = mid(now(),14,2)>
<cfset h = mid(now(),17,2)>
<cfset mn = mid(now(),20,2)>
</cfif>

<!---Variables--->
<cfset ThisDate = CreateDate(y,m,d)>
<cfset ThisDate = CreateODBCDateTime(ThisDate)>
<cfset TimeStamp = y&m&d&h&mn>
<cfset F = TimeStamp>
<cfset YearMonth = y&m>
<cfset YearMonthDay = y&m&d>
<cfset Clock = h&mn>

<!---local variables--->
<cfset onClass = "">
<cfset offClass = "">
<cfset ShowDay = 0>
<cfset ShowMonth = 0>
<cfset ShowYear = 0>


<html>
<head>
<title><cfoutput>#DateFormat(ThisDate,'mmmm,yyyy')#</cfoutput></title>
<cfinclude Template="_js.html">
</head>
  <body link="blue" alink="blue" vlink="blue" BGCOLOR="e1e1e1">

<div align="center">
  <table border="0" cellpadding="0" cellspacing="0" width="85%" bgcolor="D3D3D3">
    <tr>
      <td align="center">

<!-----------------------------------------Top Nav Bar---------------------------------------------->
  <table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="gray">
    <tr>

<!----Show six months in each direction for the nav bar--->
<cfloop from="-6" to="6" index="index">

<cfset ShowYear = y>
<cfset showMonth = evaluate(m + index)>

<!---increment/decrement months, but ensure they are in the range 1 - 12--->
<cfif ShowMonth GT 12>
<cfset ShowMonth = ShowMonth - 12>
<cfset ShowYear = ShowYear +1>
</cfif>
<cfif ShowMonth LTE 0>
<cfset ShowMonth = ShowMonth + 12>
<cfset ShowYear = ShowYear -1>
</cfif>

<!---Set Display Date for the month displayed in the cell--->
<cfset ShowDate = ShowYear & '/' & ShowMonth>

<!---Allow for style sheet differences between 'this month (0)' and the others--->
<cfif index is 0>
      <td>
      <cfset onClass = "glow">
      <cfset offClass = "unglow">
<cfelse>
      <td>
      <cfset onClass = "unglow">
      <cfset offClass = "glow">
</cfif>

<!---Populate each of the 13 date cells in the table with appropriate links--->
<cfoutput>


	  <a href="#getfilefrompath(getcurrenttemplatepath())#?user_id_1=#url.user_id_1#&lo_id=#url.lo_id#&a_flag=1&comp_id=#url.comp_id#&F=#ShowYear##numberFormat(ShowMonth,'0_')#010000">



		<p class='#onClass#' align="center" onMouseover="this.ClassName = '#offClass#';" onMouseout="this.className = '#onClass#';">
	#dateFormat(ShowDate,'mmm')#
        <br>
        #ShowYear#
        </p>
</cfoutput>
      </a>
    </td>
</cfloop>
    </tr>
  </table>

<!------------------------Title-------------------------------->
<cfoutput>
<table width="100%" bgcolor="d3d3d3"><tr><td>
<!--- <div align="left"><img src="images\nav.jpg" border="0" align="left"></div> --->
</td>
<td>
<div align="center">
<font color = blue size="4"><b>Welcome #read_user.pname# to closing calendar for #read_company.company#</b></font><br><br>
<font color size="3"><b>
To either schedule a new closing request or obtain information on a
previously requested closing, <br>select a date from the calendar below and
proceed accordingly</div>
<div align="center">
<font size="6"><b>#MonthAsString(m)#  #y#</b></font>
</div>
</td></tr></table>
</cfoutput>






<!--------------------------------------Calendar------------------------------------------------->
          <table border="0" cellpadding="1" cellspacing="1" width="80%" bgcolor="white">
            <tr>
              <td bgcolor="D3D3D3" width="14%" align="center">
                <div align="center"><b><font color="000000" face="Arial" size="2">Sunday</font></b></div></td>
              <td bgcolor="D3D3D3" width="14%" align="center">
                <div align="center"><b><font color="000000" face="Arial" size="2">Monday</font></b></div></td>
              <td bgcolor="D3D3D3" width="14%" align="center">
                <div align="center"><b><font color="000000" face="Arial" size="2">Tuesday</font></b></div></td>

              <td bgcolor="D3D3D3" width="14%" align="center">
                <div align="center"><b><font color="000000" face="Arial" size="2">Wednesday</font></b></div></td>

              <td bgcolor="D3D3D3" width="14%" align="center">
                <div align="center"><b><font color="000000" face="Arial" size="2">Thursday</font></b></div></td>
              <td bgcolor="D3D3D3" width="14%" align="center">
                <div align="center"><b><font color="000000" face="Arial" size="2">Friday</font></b></div></td>
              <td bgcolor="D3D3D3" width="14%" align="center">
                <div align="center"><b><font color="000000" face="Arial" size="2">Saturday</font></b></div></td>
            </tr>



<!---Draw a 5 X 7 calendar...  Populate Valid Dates From the Dbase--->
	    <tr>


<cfset showDay = 1>
<cfset offset = DayOfWeek(DayOfWeek(y & '/' & m & '/01'))>


<cfloop from=1 to=37 index="index">
<cfset offset = offset - 1>


<!---Create Empty Cells for non valid dates--->
<cfif (offset GT 0) OR (ShowDay GT DaysInMonth(ThisDate))>

	<td bgcolor="D3D3D3">
	<table>
	  <tr>
	  <td bgcolor="D3D3D3"><img src="images/clear.gif" width=1 height=40></td>
	  <td bgcolor="D3D3D3"><img src="images/clear.gif" width=20 height=1></td>
	  </tr>
    	</table>
	</td>

<cfelse>



	<td bgcolor="D3D3D3">
	<table>
	<tr>
	<td bgcolor="D3D3D3"><img src="images/clear.gif" width=1 height=40></td>
	<td bgcolor="D3D3D3" valign="middle" align="center"><img src="images/clear.gif" width=90 height=1><br>
	<cfoutput>
	<a href="day.cfm?user_id_1=#url.user_id_1#&lo_id=#url.lo_id#&a_flag=1&comp_id=#url.comp_id#&F=#YearMonth##NumberFormat(showDay,'0_')#0000">#showDay#</a>
		</cfoutput>
	<cfset testDate = CreateDate(#y#, #m#, #showDay#)>

	<cfset f =  #DateFormat(CreateODBCDateTime(testdate), "m/d/yyyy")#>

	<cfset i = 0>
	<cfset j = 0>

<cfquery dbtype="query" name="getEventList">
	SELECT *
	FROM detail where event_date = #showDay#
	and type = 'red'
</cfquery>
<cfquery dbtype="query" name="getEventList2">
	SELECT *
	FROM detail where event_date = #showDay#
	and type = 'black'
</cfquery>
<cfquery dbtype="query" name="getEventList3">
	SELECT *
	FROM detail where event_date = #showDay#
	and type = 'red_ans'
</cfquery>


<cfif #getEventList.recordcount# gt "0">
<font color = red><b>*</b></font>
</cfif>

<cfif #getEventList2.recordcount# gt "0">
<b>*</b>
</cfif>

<cfif #getEventList3.recordcount# gt "0">
<b>*</b>
</cfif>

 </td>
	</tr>
        </table>
	</td>



<cfset showDay = ShowDay + 1>
</cfif>

<cfif (index mod 7) is 0>
	</tr><tr>
</cfif>

</cfloop>

</table>



<!---Footer </cfif>--->
      </td>
    </tr>
 <tr>
 <td bgcolor="blue" valign="middle" align="center">
<center><b><font color=white size="3">NOTE* RED asterisks represents  SCHEDULED closings.<br>BLACK asterisks represent CLOSINGS REQUESTED BUT NOT YET CONFIRMED</font></b></center>

 </td></tr>
  </table>
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
</html>
