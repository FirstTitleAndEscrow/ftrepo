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
Please choose
month and/or date to obtain closing
information. <br>If you are unable to locate a confirmed
closing, please click
<a href="title_client_closing_view.cfm?user_id_1=#url.user_id_1#&lo_id=#url.lo_id#&a_flag=1&comp_id=#url.comp_id#&F=#YearMonth##NumberFormat(showDay,'0_')#0000">Search Closings</a>
<br>To schedule a new closing, you may select a date from the calendar and proceed accordingly</b></font><br>
</div>
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
<cfloop from=1 to=35 index="index">
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
<cfquery datasource="#request.dsn#" name="getEventList">
select * From EventList where yearmonth is not null AND comp_id = #read_company.id#
</cfquery>



	<td bgcolor="D3D3D3">
	<table>
	<tr>
	<td bgcolor="D3D3D3"><img src="images/clear.gif" width=1 height=40></td>
	<td bgcolor="D3D3D3" valign="middle" align="center"><img src="images/clear.gif" width=90 height=1><br>
	<cfoutput>
	<a href="day.cfm?user_id_1=#url.user_id_1#&lo_id=#url.lo_id#&a_flag=1&comp_id=#url.comp_id#&F=#YearMonth##NumberFormat(showDay,'0_')#0000">#showDay#</a>
		</cfoutput>
	<cfset f = '#YearMonth##showDay#'>
	<cfset i = 0>
	<cfoutput query="getEventList">
	<cfif #DateFormat(yearmonth, "yyyymmd")# eq #f#>
		<cfset i = i + 1>
		<cfif #i# EQ 1><b>*</b></cfif></cfif>


</cfoutput>

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

<center><b><font color=white size="3">NOTE* Dates that have an asterisk represent scheduled/confirmed closings for your company</font></b></center>
 <br>
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
