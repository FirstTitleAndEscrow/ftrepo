
<CFPARAM NAME="comp_id" DEFAULT="">

<CFQUERY datasource="#request.dsn#" NAME="read_user">
SELECT *
FROM first_admin
WHERE id = #url.uid#
</CFQUERY>












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

	
	  <a href="#getfilefrompath(getcurrenttemplatepath())#?uid=#url.uid#&al=#url.al#&a_flag=1&comp_id=#comp_id#&F=#ShowYear##numberFormat(ShowMonth,'0_')#010000">
    
		
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
<font color = blue size="4"><b>Welcome #read_user.fname# to closing calendar </b></font><br><br>
<font color size="3"><b>
Please choose
month and/or date to obtain closing
information. <br>To schedule a new closing, you may select a date from the calendar and proceed accordingly</b></font><br>
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


<!--- get list of comp_ids for this logged in user --->
<cfset company_id_list = ''>
	<!--- <cfquery datasource="#request.dsn#" name="getEventList">
	select * From EventList a, Title_Closing_Order_Request b where a.title_id = b.title_id and b.request_date is not null
	</cfquery> --->
	<cfif session.va_admin eq 1>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales IN (select ID from First_admin where va_employee = 1)
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	<cfelseif session.va_employee eq 1>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales = '#session.ft_user_id#'
	<cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>




	<cfif session.ft_fairfax_admin eq 1>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales IN (select ID from First_admin where ft_fairfax_employee = 1)
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	<cfelseif session.ft_fairfax_employee eq 1>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales = '#session.ft_user_id#'
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>



	<cfif session.mi_admin eq 1 or session.ft_user_id eq '319' or session.ft_user_id eq '339'>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales in (select ID from first_admin where role_id = 24 and mi_employee = 'True')
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
			<cfif session.ft_user_id eq '322' or session.ft_user_id eq '339'>
			<cfquery datasource="#request.dsn#" name="get_moreCompaniesList">
			select * From Companies where (team_id = 21
            and a_status=1
		and test_account=0)
			</cfquery>
				<cfset company_id_list = ListAppend(company_id_list,ValueList(get_moreCompaniesList.ID, ","),",")>
			</cfif>
	</cfif>
	
	
	<cfif session.mo_admin eq 1>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales in (select ID from first_admin where role_id = 24 and mo_employee = 'True')
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>
	
	
	
	<cfif session.mi_flushing_admin eq 1>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales in (select ID from first_admin where role_id = 24 and mi_flushing_employee = 'True')
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>
	
	
	
	
	
	<cfif session.tx_admin eq 1>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales in (select ID from first_admin where role_id = 24 and tx_employee = 'True')
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>


	<cfif session.mo_admin eq 1>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales in (select ID from first_admin where role_id = 24 and mo_employee = 'True')
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>
	

	<cfif session.ft_user_id eq 630 or session.ft_user_id eq 631>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where id IN (Select ID from companies where team_id = 5)
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>

	<cfif session.ft_user_id eq 327>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where comp_id = 3276
	</cfquery>
	<cfset company_id_list = 3276>
	</cfif>

	<cfif session.mi_employee eq 1 and session.ft_user_id eq 319 or session.ft_user_id eq 426>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales = '#session.ft_user_id#' 
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>

	<cfif session.mo_employee eq 1 and session.ft_user_id eq 319 or session.ft_user_id eq 426>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales = '#session.ft_user_id#' 
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>

	<cfif session.mi_flushing_employee eq 1>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales = '#session.ft_user_id#' 
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>

	<cfif session.tx_employee eq 1>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales = '#session.ft_user_id#' 
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>

	<cfif session.ft_user_id eq 264 or session.ft_user_id eq 366 or (read_user.role_id eq 24 and session.ft_user_id neq 322 and session.ft_user_id neq 339)>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	select * From Companies where intSales = '#session.ft_user_id#' 
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or ID in (9711,10436,11086,11100,11087)
    </cfif>
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>



	<cfif session.ft_user_id eq 322 or  session.ft_user_id eq 339>
	<cfquery datasource="#request.dsn#" name="get_CompaniesList">
	SELECT *
	FROM companies
	WHERE a_status = 1 and streamline_client <> 1
    and (team_id = 21 and test_account=0)
	</cfquery>
	<cfset company_id_list = ValueList(get_CompaniesList.ID, ",")>
	</cfif>


<cfif Len(company_id_list) eq 0>
<cfset company_id_list = 9999999>
</cfif>
<!--- END get list of comp_ids for this logged in user --->



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
	<a href="day.cfm?uid=#url.uid#&al=#url.al#&a_flag=1&comp_id=#comp_id#&F=#YearMonth##NumberFormat(showDay,'0_')#0000">#showDay#</a>
		</cfoutput>
		<cfset testDate = CreateDate(#y#, #m#, #showDay#)>

	<cfset f =  #DateFormat(CreateODBCDateTime(testdate), "m/d/yyyy")#>
	
	<cfset i = 0>
	<cfset j = 0>
	
<cfif #comp_id# neq "ALL">
<CFSET zip_id_2 = #ListToArray(comp_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>
<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>






<cfquery datasource="#request.dsn#" name="getEventList">
select e.*, c.master_co_id, t.order_date, c.id 
From EventList e, Companies c, Title t 
where yearmonth = '#f#' 
AND 
(e.comp_id IN (#comp_id#))

 <cfif #url.uid# EQ "630" or #url.uid# EQ "631">
 or e.comp_id in (select ID from companies where team_id = 5)
</cfif>


 <cfif #url.uid# EQ "93">
and (e.comp_id = 211 or e.comp_id = 227 or e.comp_id = 231 or e.comp_id = 232 or e.comp_id = 251 or e.comp_id = 209 or e.comp_id = 174 or e.comp_id = 178 or e.comp_id = 141 OR e.comp_id = 205)
</cfif>
<cfif #url.uid# EQ "203">
and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
</cfif>
 
<cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193"> and comp_id = 100</cfif>
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and t.title_id = e.title_id
and t.order_date > '07/14/2008'

<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and t.title_id = e.title_id
and t.order_date > '10/01/2010'

<cfelseif IsDefined("session.is_logged_in") and (session.ft_user_id eq 327)>
and t.title_id = e.title_id
and t.comp_id = 3276


<cfelseif IsDefined("session.is_logged_in") and (session.ft_user_id eq 264)>
and t.title_id = e.title_id
and c.intSales = 264
<cfelse>
and t.title_id = e.title_id
</cfif>

</cfquery>


<cfquery datasource="#request.dsn#" name="getEventList_IntProcessor">
select e.*, c.master_co_id, t.order_date, c.id 
From EventList e, Companies c, Title t 
where yearmonth = '#f#' 
AND 
(t.ip_id = '#session.ft_user_id#')
and e.title_id = t.title_id
and c.ID = t.comp_id
</cfquery>




<cfquery datasource="#request.dsn#" name="getEventList2">
select a.*, b.*, t.order_date From EventList a,  Title_Closing_Order_Request b, Title t where a.title_id = b.title_id and b.request_date = '#f#' and a.yearmonth is null AND b.c_comp_id IN (#comp_id#) 
 <cfif #url.uid# EQ "630" or #url.uid# EQ "631">
 or b.c_comp_id in (select team_id from companies where team_id = 5)
</cfif>

 <cfif #url.uid# EQ "93">
and (a.comp_id = 211 or a.comp_id = 227 or a.comp_id = 231 or a.comp_id = 232 or a.comp_id = 251 or a.comp_id = 209 or a.comp_id = 174 or a.comp_id = 178 or a.comp_id = 141 OR a.comp_id = 205)
</cfif>
<cfif #url.uid# EQ "203">
and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
</cfif>

<cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193"> and a.comp_id = 100</cfif>
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and t.title_id = b.title_id
and t.order_date > '07/14/2008'
<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and t.title_id = b.title_id
and t.order_date > '10/01/2010'
<cfelseif IsDefined("session.is_logged_in") and (session.ft_user_id eq 327)>
and t.title_id = b.title_id
and t.comp_id = 3276
<cfelseif IsDefined("session.is_logged_in") and (session.ft_user_id eq 264)>
and t.title_id = b.title_id
and c.intSales = 264
<cfelse>
and t.title_id = b.title_id
</cfif>

</cfquery>

<cfquery datasource="#request.dsn#" name="getEventList2_IntProcessor">
select a.*, b.*, t.order_date From EventList a,  Title_Closing_Order_Request b, Title t where b.request_date = '#f#' and a.yearmonth is null AND t.ip_id = '#session.ft_user_id#' 
and b.title_id = t.title_id
and a.title_id = b.title_id 
</cfquery>



<cfif #getEventList.recordcount# gt "0" or #getEventList_IntProcessor.recordcount# gt "0">
<cfset i = i + 1>
		<cfif #i# EQ 1><font color = red><b>*</b></font></cfif>
</cfif>

<cfif #getEventList2.recordcount# gt "0" or #getEventList2_IntProcessor.recordcount# gt "0">
<cfset j = j + 1>
		<cfif #j# EQ 1><b>*</b></cfif>

</cfif>
		
<!--- <CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
	<cfquery datasource="#request.dsn#" name="getEventList">
select e.*, c.master_co_id, t.order_date, c.id 
From EventList e, Companies c, Title t 
where yearmonth = '#f#' 
AND 
(e.comp_id = '#cty_name_1[TTT]#' or (c.master_co_id = '#cty_name_1[TTT]#' AND c.ID = e.comp_id))
 <cfif #url.uid# EQ "93">
and (e.comp_id = 211 or e.comp_id = 227 or e.comp_id = 231 or e.comp_id = 232 or e.comp_id = 251 or e.comp_id = 209 or e.comp_id = 174 or e.comp_id = 178 or e.comp_id = 141 OR e.comp_id = 205)
</cfif>
<cfif #url.uid# EQ "203">
and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
</cfif>
 
<cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193"> and comp_id = 100</cfif>
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1 or session.mi_flushing_employee eq 1)>
and t.title_id = e.title_id
and t.order_date > '07/14/2008'

<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1)>
and t.title_id = e.title_id
and t.order_date > '10/01/2010'

<cfelseif IsDefined("session.is_logged_in") and (session.ft_user_id eq 327)>
and t.title_id = e.title_id
and t.comp_id = 3276


<cfelseif IsDefined("session.is_logged_in") and (session.ft_user_id eq 264)>
and t.title_id = e.title_id
and c.intSales = 264
<cfelse>
and t.title_id = e.title_id
</cfif>
</cfquery>
<cfquery datasource="#request.dsn#" name="getEventList2">
select a.*, b.*, t.order_date From EventList a,  Title_Closing_Order_Request b, Title t where a.title_id = b.title_id and b.request_date = '#f#' and a.yearmonth is null AND b.c_comp_id = '#cty_name_1[TTT]#' 
 <cfif #url.uid# EQ "93">
and (a.comp_id = 211 or a.comp_id = 227 or a.comp_id = 231 or a.comp_id = 232 or a.comp_id = 251 or a.comp_id = 209 or a.comp_id = 174 or a.comp_id = 178 or a.comp_id = 141 OR a.comp_id = 205)
</cfif>
<cfif #url.uid# EQ "203">
and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
</cfif>

<cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193"> and a.comp_id = 100</cfif>
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and t.title_id = b.title_id
and t.order_date > '07/14/2008'
<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.mi_flushing_employee eq 1)>
and t.title_id = b.title_id
and t.order_date > '10/01/2010'
<cfelseif IsDefined("session.is_logged_in") and (session.ft_user_id eq 327)>
and t.title_id = b.title_id
and t.comp_id = 3276
<cfelseif IsDefined("session.is_logged_in") and (session.ft_user_id eq 264)>
and t.title_id = b.title_id
and c.intSales = 264
<cfelse>
and t.title_id = b.title_id
</cfif>

</cfquery>



<cfif #getEventList.recordcount# gt "0">
<cfset i = i + 1>
		<cfif #i# EQ 1><font color = red><b>*</b></font></cfif>
</cfif>

<cfif #getEventList2.recordcount# gt "0">
<cfset j = j + 1>
		<cfif #j# EQ 1><b>*</b></cfif>

</cfif>

</CFLOOP>	 --->




<cfelse>




	<cfquery datasource="#request.dsn#" name="getEventList">
	select a.*, t.title_id, t.comp_id From EventList a, title t where yearmonth = '#f#'
	
	<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1 or session.ft_user_id eq 366)>
	and t.comp_id in (#company_id_list#)
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or t.comp_id in (9711,10436,11086,11100,11087)
    </cfif>
	and t.order_date > '07/14/2008'
	<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
	and t.comp_id in (#company_id_list#)
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or t.comp_id in (9711,10436,11086,11100,11087)
    </cfif>
	and t.order_date > '10/01/2010'
	<cfelseif IsDefined("session.is_logged_in") and (session.ft_fairfax_admin eq 1)>
	and t.comp_id in (#company_id_list#)
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or t.comp_id in (9711,10436,11086,11100,11087)
    </cfif>
	and t.order_date > '10/01/2010'
	<cfelseif IsDefined("session.is_logged_in") and (session.ft_user_id eq 327)>
	and a.comp_id = 3276
	<cfelseif IsDefined("session.is_logged_in") and (read_user.role_id eq 24)>
	and t.comp_id in (#company_id_list#)
	</cfif>

	<cfif #url.uid# EQ "93">
	and (comp_id = 211 or comp_id = 227 or comp_id = 231 or comp_id = 232 or comp_id = 251 or comp_id = 209 or comp_id = 174 or comp_id = 178 or comp_id = 141 OR comp_id = 205)
	</cfif>
	<cfif #url.uid# EQ "203">
	and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
	</cfif>
	<cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193"> and comp_id = 100</cfif>
	<cfif IsDefined("session.is_logged_in") and (session.ft_user_id eq 264)>
	and t.title_id = 00000000
	</cfif>
    and a.title_id = t.title_id
	</cfquery>


    	<cfquery datasource="#request.dsn#" name="getEventList_IntProcessor">
	select a.*, t.title_id, t.comp_id From EventList a, title t where yearmonth = '#f#'
	and t.ip_id = '#session.ft_user_id#'
    and a.title_id = t.title_id
	</cfquery>
    
    
    
	<cfquery datasource="#request.dsn#" name="getEventList2">
	select a.*, b.*, t.title_id, t.comp_id From EventList a, Title_Closing_Order_Request b, Title t where a.title_id = b.title_id and b.request_date = '#f#' and a.yearmonth is null  
	<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1 or session.ft_user_id eq 366)>
	and t.comp_id in (#company_id_list#)
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or t.comp_id in (9711,10436,11086,11100,11087)
    </cfif>
	and t.order_date > '07/14/2008'
	<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
	and t.comp_id in (#company_id_list#)
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or t.comp_id in (9711,10436,11086,11100,11087)
    </cfif>
	and t.order_date > '10/01/2010'
	<cfelseif IsDefined("session.is_logged_in") and (session.ft_fairfax_admin eq 1)>
	and t.comp_id in (#company_id_list#)
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or t.comp_id in (9711,10436,11086,11100,11087)
    </cfif>
	and t.order_date > '10/01/2010'
	<cfelseif IsDefined("session.is_logged_in") and (session.ft_user_id eq 327)>
	and a.comp_id = 3276
	<cfelseif IsDefined("session.is_logged_in") and (read_user.role_id eq 24)>
	and t.comp_id in (#company_id_list#)
	</cfif>

	 <cfif #url.uid# EQ "93">
	and (a.comp_id = 211 or a.comp_id = 227 or a.comp_id = 231 or a.comp_id = 232 or a.comp_id = 251 or a.comp_id = 209 or a.comp_id = 174 or a.comp_id = 178 or a.comp_id = 141 OR a.comp_id = 205)
	</cfif>
	<cfif #url.uid# EQ "203">
	and (comp_id = 224 or comp_id = 465 or comp_id = 522 or comp_id = 333 or comp_id = 523)
	</cfif>

	<cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193"> and a.comp_id = 100</cfif>
	<cfif IsDefined("session.is_logged_in") and (session.ft_user_id eq 264)>
	and t.title_id = 00000000
	</cfif>
    	and t.title_id = b.title_id
	    and b.title_id = a.title_id

	</cfquery>
    
    
    
    
    
	<cfquery datasource="#request.dsn#" name="getEventList2_intProcessor">
	select a.*, b.*, t.title_id, t.comp_id From EventList a, Title_Closing_Order_Request b, Title t where b.request_date = '#f#' and a.yearmonth is null  
	and t.ip_id = '#session.ft_user_id#'
        and t.title_id = b.title_id
	    and b.title_id = a.title_id

	</cfquery>

	<cfif #getEventList.recordcount# gt "0" or #getEventList_IntProcessor.recordcount# gt "0">
	<font color = red><b>*</b></font>
	</cfif>
	
	<cfif #getEventList2.recordcount# gt "0" or #getEventList2_IntProcessor.recordcount# gt "0">
	<b>*</b>
	</cfif>

<!--- <cfoutput query="getEventList">
	<cfif (#yearmonth# eq "") and (#request_date# eq "#f#")>
			<cfset i = i + 1>
		<cfif #i# EQ 1><b>*</b></cfif>
		
	<cfelseif (#yearmonth# eq "#f#") and (#request_date# eq "#f#")>		
		<cfset i = i + 1>
		<cfif #i# EQ 1><b>*</b><font color = red><b>*</b></font></cfif>
	<cfelseif (#yearmonth# eq "#f#") and (#request_date# neq "#f#")>
		<cfset i = i + 1>
		<cfif #i# EQ 1><font color = red><b>*</b></font></cfif>
		<cfelse>
		</cfif>
		
		
		
		
</cfoutput>  --->

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

<center><b><font color=white size="3">NOTE* Dates with black asterisks represent PENDING REQUESTED closings, red asterisks SCHEDULED closings</font></b></center>
 <br>
 </td></tr>
  </table>
</body>
</html>
