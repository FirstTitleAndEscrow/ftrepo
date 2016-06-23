
<CFPARAM NAME="a_flag" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE id = '#comp_id#'
ORDER BY company ASC
</CFQUERY>

<cfif #read_company.recordcount# GT 0>
<CFQUERY datasource="#request.dsn#" NAME="getuser">
SELECT *
FROM users
WHERE comp_id = #read_company.id#
ORDER BY lp_lname ASC
</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_titleid">

			SELECT *
			FROM title_closing_order_request
			where a_filled_out_date is null
			ORDER BY Title_id

		</CFQUERY>
<Cfoutput>
<cfif #a_flag# EQ "1">
<cfquery datasource="#request.dsn#" name="getcompany">

select * from companies
where id = #URL.comp_id#
</cfquery>
</cfif>
</cfoutput>
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
<Cfoutput>
<cfif #a_trigger# EQ "1">
<cfif #a_flag# EQ "1">

<cfquery datasource="#request.dsn#">
delete from EventList
 Where
title_id = #URL.rec_id# AND comp_id = #getcompany.id#
</cfquery>
<cfelse>
<cfquery datasource="#request.dsn#">
delete from EventList
 Where
title_id = #URL.rec_id#
</cfquery>
</cfif>
</cfif>
</Cfoutput>
<html>
<head>
<title>		View
</title>
</head>

<body bgcolor="silver">
<div align="center">

  <table border="0" cellpadding="0" cellspacing="0" width="650" bgcolor="black">
    <tr>
      <td>
        <div align="center">

          <table border="1" cellpadding="1" cellspacing="0" width="650" bgcolor="white">
            <tr>
              <td bgcolor="navy" colspan="5" width="650">
                    <p align="center"><font color="white" face="Arial Black">
<!---Description Bar--->
 <cfoutput>#DateFormat(ThisDate,'dddd, d, mmmm, yyyy')# <cfset plugday = #DateFormat(ThisDate,'mm/dd/yyyy')#></CFOUTPUT>
  <cfset tempdate = CreateODBCDate(plugday)>

	   <cfset temp = #DateFormat(Now(), 'mm/dd/yyyy')#>
	    <cfset current = CreateODBCDate(temp)>

			  </font></p>
              </td>
             </tr>



<cfif #a_flag# EQ "1">

<cfquery datasource="#request.dsn#" name="getList">
select * From EventList
Where (YearMonthDay = '#YearMonthDay#') AND (comp_id = #getcompany.id#)
</cfquery>

 <cfelse>
 <cfquery datasource="#request.dsn#" name="getList">
select * From EventList
Where (YearMonthDay = '#YearMonthDay#')
</cfquery>

 </cfif>
   <cfoutput>
		   <tr>

              <td bgcolor="blue" colspan = 4 valign=center width="80%" align="center">
               <font size=3 color=white face=verdana><b>
		Check below for scheduled Closings</b></font><br>
		  </td>


		  </tr>
		  <tr>
          <CFSET comparison = DateCompare(tempdate, current)>

              <td bgcolor="white" colspan = 4 valign=center width="80%" align="center">

		  <font size=2 color=black face=verdana>
		  <CFIF #comparison# eq "1"> **If you would like to schedule a new closing please <a href="./title_closing_search.cfm?comp_id=#getcompany.id#&YearMonthDay=#plugDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=3 color=red face=verdana><b>click here</b></font></a><br>
		  <cfelse>
		 **If you would like to request a new closing, please chose a future date
		  </cfif>

			  </td>


		  </tr>
   </cfoutput>

 <tr>
 <td bgcolor="elelel" valign=top width="15%" align="center">
             <font size=2 color=blue face=verdana><b>
                Time
        </b></font>
              </td>
			<td bgcolor="elelel" valign=top width="45%" align="center">
               <font size=2 color=blue face=verdana><b>
                Borrower
        </b></font>
              </td>
			  <td bgcolor="elelel" valign=top width="20%" align="center">
              <font size=2 color=blue face=verdana><b>
                Details
        </b></font>
              </td>
			  <td bgcolor="elelel" valign=top width="20%" align="center">
              <font size=2 color=blue face=verdana><b>
                Modify
        </b></font>
              </td>
			  </tr>
<cfoutput query="getList">
            <tr>

              <td bgcolor="elelel" valign=center width="15%" align="center">
               <font size=1 color=black face=verdana>
			  <b>#getlist.c_time# </B></font>
              </td>
            <td bgcolor="elelel" valign=center width="35%" align="center"> <font size=1 color=black face=verdana><b>

              #getlist.b_fname# &nbsp;&nbsp;&nbsp; #getlist.b_lname#</b>
              </td>

			  <td bgcolor="elelel" valign=center width="20%" align="center">

              <a href="./Title_Closing_View_info.cfm?comp_id=#comp_id#&rec_id=#getlist.title_id#&company_id=#getcompany.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Closing Info </font></a>

			  </td>
			  <td bgcolor="elelel" valign=center width="20%" align="center">

              <a href="./form_title_closing_order_request_modify.cfm?comp_id=#comp_id#&rec_id=#getlist.title_id#&company_id=#getcompany.id#&YearMonthDay=#yearMonthDay#&UserID=#getuser.ID#&user_id_1=#URL.user_id_1#&lo_id=#url.lo_id#"><font size=1 color=blue face=verdana> Modify Closing </font></a>

			  </td>

		  </tr>
 </cfoutput>

     </table>





			 </td>







		</tr>
        </table>
        </div>

      </td>
    </tr>
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

