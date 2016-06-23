<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<cfset cache_reset = 10>
<!---d3d3d3--->
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">























<html>
<head>
	<title>Closings</title>
</head>

<body>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align=center>
	<tr>
		<td align= "middle" height="76"><IMG style="WIDTH: 980px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
	</tr>
	<TR>
		<TD>
<CFOUTPUT>
<cfFORM NAME="Search" METHOD="post" ACTION="https://#cgi.server_name#/admin_area/title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" >
<FONT FACE=ARIAL SIZE=2 color="gray">Quick Search</font><input type=text name="number" size=10 maxlength=15
size="1"
style="font-size: 9;
font-family: verdana;
font-style: normal;
color: blue;
background-color: e6e6e6;
border-color: e6e6e6;
border-left-width: thin;
border-right-width: thin;
border-top-width: thin;
border-bottom-width: thin;
border-width: thin;
border-style: bar;
clear: none;"
><input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM>
</CFOUTPUT>
		</TD>
	</TR>
</table>


<br>
<br>

<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
	<TR colspan="18">
		<td width="99" align="center" colspan="2">
<B>Clients</B>
		</td>
		<td width="99" align="center" colspan="2">
<B>Users</B>
		</td>
		<td width="99" align="center" colspan="2">
<b>Closers</b>
		</td>
		<td width="99" align="center" colspan="2">
<b>Appraisers</b>
		</TD>
		<td width="99" align="center" colspan="2">
<b>Abstractors</b>
		</TD>
		<td width="99" align="center" colspan="2">
<b>Third Parties</b>
		</TD>
		<td width="99" align="center" colspan="2">
<b>Lenders</b>
		</TD>
		<td width="99" align="center" colspan="2">
<b>FT Agencies</b>
		</TD>
		<td width="99"align="center" colspan="2">
<b>Title Ins Co</b>
		</td>
	</TR>
	<TR>
		<td width="45" align="center">
<CFoutput>
<a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=blue face=verdana>A</font>
</CFOUTPUT>
		</td>
		<td width="45" align="center">
<CFoutput>
<a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=red face=verdana>M</font>
</CFOUTPUT>
		</td>
		<td width="45" align="center">
<CFoutput>
<a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=blue face=verdana>A</font>
</CFOUTPUT>
		</td>
		<td width="45" align="center">
<CFoutput>
<a href="./user_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=red face=verdana>M</font>
</CFOUTPUT>
		</TD>
		<td width="45" align="center">
<CFoutput>
<a href="./closer_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=blue face=verdana>A</font>
</CFOUTPUT>
		</TD>
		<td width="45" align="center">
<CFoutput>
<a href="./closer_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=red face=verdana>M</font>
</CFOUTPUT>
		</TD>
		<td width="45" align="center">
<CFoutput>
<a href="./appraisers_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=blue face=verdana>A</font>
</CFOUTPUT>
		</TD>
		<td width="45" align="center">
<CFoutput>
<a href="./appraisers_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=red face=verdana>M</font>
</CFOUTPUT>
		</TD>
		<td width="45"align="center">
<CFoutput>
<a href="./abstractors_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=blue face=verdana>A</font>
</CFOUTPUT>
		</td>
		<td width="45" align="center">
<CFOUTPUT>
<a href="./abstractors_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=red face=verdana>M</font>
</CFOUTPUT>
		</td>
		<td width="45" align="center">
<CFoutput>
<a href="./tp_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=blue face=verdana>A</font>
</CFOUTPUT>
		</td>
		<td width="45" align="center">
<CFoutput>
<a href="./tp_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=red face=verdana>M</font>
</CFOUTPUT>
		</td>
		<td width="45" align="center">
<CFoutput>
<a href="./lenders_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=blue face=verdana>A</font>
</CFOUTPUT>
		</TD>
		<td width="45" align="center">
<CFoutput>
<a href="./lenders_modify_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=red face=verdana>M</font>
</CFOUTPUT>
		</TD>
		<td width="45" align="center">
<CFoutput>
<a href="./title_FT_Agency_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=blue face=verdana>A</font>
</CFOUTPUT>
		</TD>
		<td width="45" align="center">
<CFoutput>
<a href="./title_FT_Agency_modify_Select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=red face=verdana>M</font>
</CFOUTPUT>
		</TD>
		<td width="45" align="center">
<CFoutput>
<a href="./title_Ins_Co_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=blue face=verdana>A</font>
</CFOUTPUT>
		</TD>
		<td width="45"align="center">
<CFoutput>
<a href="./title_Ins_Co_modify_Select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color=red face=verdana>M</font>
</CFOUTPUT>
		</td>
	</TR>
</table>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align=center>
	<tr>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_choose.cfm?uid=#URL.uid#&al=#URL.al#&trigger=0"  target="_blank"><font size=1 color=red face=verdana>Processing Calendar</font></a></cfoutput></CENTER></td>
<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=1 color=green face=verdana>Orders</font></a></cfoutput></CENTER>	</td>
<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0" target="_blank"><font size=1 color=blue face=verdana>Vendor Coverage</font></a></cfoutput></CENTER></td>
<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_choose.cfm?uid=#URL.uid#&al=#URL.al#&trigger=1" target="_blank"><font size=1 color=yellow face=verdana>Closing Calendar</font></a></cfoutput></CENTER></td>
<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=1 color=brown face=verdana>Statistics</font></a></cfoutput></CENTER></td>
<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=1 color=white face=verdana>Web Links</font></a></cfoutput></CENTER></td>
<CFIF #role_mgr# eq "1">
<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=1 color=orange face=verdana>Monitor User</font></a></cfoutput></CENTER></td>
<CFElse>
<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</CFIF>
<td width="111" bgcolor="#CCD2D2">
<Center>
<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/cancelled_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
<font size=1 color="660000" face=verdana>Cancelled</font></a>
</cfoutput>
</CENTER>
</td>
<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onclick="location.reload()">Refresh</A></center></td>
<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
</table><br>
<br>

<TABLE cellSpacing=1 cellPadding=1 width="100%" align=center>
<tr>
<TD>
<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the Closing Department Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
</TD>
</tr>
</TABLE>

<br>
<br>







<CFQUERY NAME="read_Closer_Not_Assigned" datasource="#request.dsn#" cachedwithin="#CreateTimeSpan(0, 0, cache_reset, 0)#">
			Select *
			from sqlCloser_Not_Assigned
			where ID != 755 and ID  != 737 and ID != 892<!--- I took out this file for ToRonicia Woods on 3-22-05 & 4-20-05 on orders from Heidi. She said she did not want it deleted just remove it from the view. --->
			order by a_insert_date
</CFQUERY>

<TABLE cellSpacing=1 cellPadding=1 width="100%">
<tr>
<td colspan=6>
<CENTER><B>Closer Not Assigned</B></CENTER>
</td>
</tr>
<tr>
<td>
<Center><font size=1 color=black face=verdana><b>Assign</b></font></CENTER>
</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Order Num</b></font></CENTER>

</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Order Date</b></font></CENTER>
</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Due Date</b></font></CENTER>
</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Company Name</b></font></CENTER>
</td>
</tr>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Closer_Not_Assigned">
<tr>
<CFIF #Letter# eq "T">
<td bgcolor="#a_bgcolor#">
<a href="./title_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" target="_blank"><CENTER><font size=1 color=red face=verdana><b>A</font></CENTER></a>
</td>
<CFELSE>
<td bgcolor="#a_bgcolor#">
<a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" target="_blank"><CENTER><font size=1 color=red face=verdana><b>A</font></CENTER></a>
</td>
</CFIF>
<CFIF #Letter# eq "T">
<td bgcolor="#a_bgcolor#">
<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=black face=verdana>T-#id#</font></a>
</td>
<CFELSE>
<td bgcolor="#a_bgcolor#">
<a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=black face=verdana>P-0232#id#</font></a>
</td>
</CFIF>
<td bgcolor="#a_bgcolor#">
<CENTER><font size=1 color=black face=verdana><b>
#DateFormat(a_insert_date, "m/d/yyyy")#</b></font></CENTER>
</td>
<td bgcolor="#a_bgcolor#">
<CENTER><font size=1 color=black face=verdana><b>
#DateFormat(DueDate, "m/d/yyyy")#</b></font></CENTER>
</td>
<td bgcolor="#a_bgcolor#">
<CENTER><font size=1 color=black face=verdana><b>
#company#</b></font></CENTER>
</td>
</tr>

<CFIF #a_color_trigger# eq "1">
<CFSET a_bgcolor = "white">
<CFSET a_color_trigger = "2">
<CFELSE>
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">
</CFIF>
</CFOUTPUT>
</table><br>
<br>
<cfflush>





<CFQUERY datasource="#request.dsn#" NAME="read_Closer_Assigned_Not_Received" cachedwithin="#CreateTimeSpan(0, 0, cache_reset, 0)#">
			Select * from sqlCloser_Assigned_Not_Received order by a_insert_date
</CFQUERY>
<TABLE cellSpacing=1 cellPadding=1 width="100%">
<tr>
<td colspan=6>
<CENTER><B>Closer Assigned Not Received</B></CENTER>
</td>
</tr>
<tr>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Order Num</b></font></CENTER>
</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Order Date</b></font></CENTER>
</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Assigned Date</b></font></CENTER>
</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Due Date</b></font></CENTER>
</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Company Name</b></font></CENTER>
</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Closer</b></font></CENTER>
</td>
</tr>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Closer_Assigned_Not_Received">
<tr>
<CFIF #Letter# eq "T">
<td bgcolor="#a_bgcolor#"><Center>
<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=black face=verdana>T-#id#</font></a>
</CENTER>
</td>
<CFELSE>
<td bgcolor="#a_bgcolor#">
<center>
<a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=black face=verdana>P-0232#id#</font></a>
</center>
</td>
</CFIF>
<td bgcolor="#a_bgcolor#">
<CENTER><font size=1 color=black face=verdana><b>
#DateFormat(a_insert_date, "m/d/yyyy")#</b></font></CENTER>
</td>
<td bgcolor="#a_bgcolor#">
<CENTER><font size=1 color=black face=verdana><b>
#DateFormat(a_date_assigned, "m/d/yyyy")#</b></font></CENTER>
</td>
<td bgcolor="#a_bgcolor#">
<CENTER><font size=1 color=black face=verdana><b>
#DateFormat(DueDate, "m/d/yyyy")#</b></font></CENTER>
</td>
<td bgcolor="#a_bgcolor#">
<CENTER><font size=1 color=black face=verdana><b>
#company#</b></font></CENTER>
</td>
<td bgcolor="#a_bgcolor#">
<CENTER><font size=1 color=black face=verdana><b>
#closer#</b></font></CENTER>
</td>
</tr>
<CFIF #a_color_trigger# eq "1">
<CFSET a_bgcolor = "white">
<CFSET a_color_trigger = "2">
<CFELSE>
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">
</CFIF>
</CFOUTPUT>
</TABLE>
<!---</TABLE>---><br>
<br>
<cfflush>












<CFQUERY datasource="#request.dsn#" NAME="read_Todays_Closings" cachedwithin="#CreateTimeSpan(0, 0, cache_reset, 0)#">
			SELECT     EventList.Title_id, Title.bfirstname1, Title.blastname1, EventList.c_time, Companies.company
			FROM       Companies RIGHT OUTER JOIN
                       Title ON Companies.ID = Title.comp_id RIGHT OUTER JOIN
                       EventList ON Title.Title_ID = EventList.Title_id
			WHERE     (EventList.c_month = DATEPART(m, GETDATE())) AND (EventList.c_Day = DATEPART(dd, GETDATE())) AND
                      (EventList.c_year = DATEPART(year, GETDATE()))
			ORDER BY EventList.Title_id
</CFQUERY> <!---   --->
<TABLE cellSpacing=1 cellPadding=1 width="100%">
<tr>
<td colspan=6>
<CENTER><B>Today's Closings</B></CENTER>
</td>
</tr>
<tr>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Order Num</b></font></CENTER>
</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Time</b></font></CENTER>
</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Borrower</b></font></CENTER>
</td>
<td>
<CENTER><font size=1 color=black face=verdana><b>
Company Name</b></font></CENTER>
</td>
</tr>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Todays_Closings">
<tr>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana>#read_Todays_Closings.title_id#</font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<CENTER><font size=1 color=black face=verdana><b>
#Timeformat(read_Todays_Closings.c_Time, "hh:mm")#</b></font></CENTER>
</td>
<td bgcolor="#a_bgcolor#">
<CENTER><font size=1 color=black face=verdana><b>
#read_Todays_Closings.bfirstname1# #read_Todays_Closings.blastname1#</b></font></CENTER>
</td>
<td bgcolor="#a_bgcolor#">
<CENTER><font size=1 color=black face=verdana><b>
#read_Todays_Closings.Company#</b></font></CENTER>
</td>
</tr>
<CFIF #a_color_trigger# eq "1">
<CFSET a_bgcolor = "white">
<CFSET a_color_trigger = "2">
<CFELSE>
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">
</CFIF>
</CFOUTPUT>
</table>
<br>
<br>
<cfflush>














<CFQUERY datasource="#request.dsn#" NAME="payoffs_read_report" cachedwithin="#CreateTimeSpan(0, 0, cache_reset, 0)#">
			SELECT *
			FROM Title a, doc_title_insurance_title d, tax_cert_title e, doc_abstract_title f, pay_off_lender_1_title g
			WHERE a.title_id = d.title_id and a.title_id = e.title_id and a.title_id = f.title_id and a.title_id = g.title_id
	    		and a.cancelled is null
				and a.appraisal_status <> 'Order Cancelled'
				and (g.a_assigned_date between '10/1/2007' AND '10/25/2007')
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and comp_id IN(#companylist#)
			and (a.title_id = g.title_id AND g.a_recieved_by is null)
	</CFQUERY>
<table width="100%" cellpadding=1 cellspacing=1 border=0>
<tr>
<td colspan=9>
<CENTER><B>Payoffs Ordered Not Received</B></CENTER>
</td>
</tr>

					<tr>


						<td>
<CENTER><font size=1 color=black face=verdana><b>Order Date</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Order Num</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Borrower 1</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Abstractor</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Rpt Recv'</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Status</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Comments</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>State</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Events</b></font></center>
						</td>
					</tr>
<!--- ======================================================================== --->
<CFLOOP QUERY="payoffs_read_report">
		<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_time">
				SELECT *
				FROM Title a, doc_title_insurance_title d
				WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and a.cancelled is null
			</cfquery>
			<cfif read_time.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			</cfif>
<tr>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#DateFormat(check_date, "mm/dd/yyyy")#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>T-#title_id#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#BFirstName1# #BLastName1#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#payoffs_read_report.Company#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#DateFormat(payoffs_read_report.a_date_completed, "m/d/yyyy")# #TimeFormat(payoffs_read_report.a_time_completed, "HH:mm:ss")#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#payoffs_read_report.appraisal_status#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b><a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#payoffs_read_report.comp_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a></b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#pstate#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b><a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#payoffs_read_report.comp_id#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a></b></font>
</center>
</td>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
				</tr>
	</CFOUTPUT>	</CFLOOP>
	</table><br>
<br>
<cfflush>










<CFQUERY datasource="#request.dsn#" NAME="icls_read_report" cachedwithin="#CreateTimeSpan(0, 0, cache_reset, 0)#">
SELECT *
			FROM Title a, doc_title_insurance_title d, tax_cert_title e, doc_abstract_title f, pay_off_lender_1_title g
			WHERE a.title_id = d.title_id and a.title_id = e.title_id and a.title_id = f.title_id and a.title_id = g.title_id

    		and a.cancelled is null
			and a.appraisal_status <> 'Order Cancelled'

					and (check_date between '8/1/2007' AND '#DateFormat(Now(), "mm/dd/yyyy")#')

			AND (a.bfirstname1 LIKE '%%' OR a.bfirstname2 LIKE '%%')

			AND (a.blastname1 LIKE '%%' OR blastname2 LIKE '%%')

			AND (a.request_icl = 'Yes' and a.icl_upload is null and a.icl_upload2 is null)
	 	<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and comp_id IN(#companylist#)

		 	ORDER BY  check_date

	</CFQUERY>
<table width="100%" cellpadding=1 cellspacing=1 border=0>
<tr>
<td colspan=9>
<CENTER><B>ICLs Requested Not Returned</B></CENTER>
</td>
</tr>

					<tr>


						<td>
<CENTER><font size=1 color=black face=verdana><b>Order Date</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Order Num</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Borrower 1</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Abstractor</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Rpt Recv'</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Status</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Comments</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>State</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Events</b></font></center>
						</td>
					</tr>
<!--- ======================================================================== --->
<CFLOOP QUERY="icls_read_report">
		<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_time">
				SELECT *
				FROM Title a, doc_title_insurance_title d
				WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and a.cancelled is null

			</cfquery>
			<cfif read_time.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			</cfif>
<tr>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#DateFormat(check_date, "mm/dd/yyyy")#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>T-#title_id#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#BFirstName1# #BLastName1#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#icls_read_report.Company#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#DateFormat(icls_read_report.a_date_completed, "m/d/yyyy")# #TimeFormat(icls_read_report.a_time_completed, "HH:mm:ss")#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#icls_read_report.appraisal_status#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b><a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#icls_read_report.comp_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a></b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#pstate#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b><a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#icls_read_report.comp_id#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a></b></font>
</center>
</td>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
				</tr>
	</CFOUTPUT>	</CFLOOP>
	</table><br>
<br>
<cfflush>






















<CFQUERY datasource="#request.dsn#" NAME="not_clear_to_close_read_report" cachedwithin="#CreateTimeSpan(0, 0, cache_reset, 0)#">
SELECT *
			FROM Title a, doc_title_insurance_title d, tax_cert_title e, doc_abstract_title f, pay_off_lender_1_title g
			WHERE a.title_id = d.title_id and a.title_id = e.title_id and a.title_id = f.title_id and a.title_id = g.title_id

    		and a.cancelled is null
			and a.appraisal_status <> 'Order Cancelled'

					and (check_date between '8/1/2007' AND '#DateFormat(Now(), "mm/dd/yyyy")#')

			AND (a.bfirstname1 LIKE '%%' OR a.bfirstname2 LIKE '%%')

			AND (a.blastname1 LIKE '%%' OR blastname2 LIKE '%%')

			and (a.title_id = d.title_id AND d.clear_close is null)
	 	<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and comp_id IN(#companylist#)

		 	ORDER BY  check_date
	</CFQUERY>
<table width="100%" cellpadding=1 cellspacing=1 border=0>
<tr>
<td colspan=9>
<CENTER><B>Not Clear to Close</B></CENTER>
</td>
</tr>

					<tr>


						<td>
<CENTER><font size=1 color=black face=verdana><b>Order Date</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Order Num</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Borrower 1</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Abstractor</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Rpt Recv'</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Status</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Comments</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>State</b></font></center>
						</td>
						<td>
<CENTER><font size=1 color=black face=verdana><b>Events</b></font></center>
						</td>
					</tr>
<!--- ======================================================================== --->
<CFLOOP QUERY="not_clear_to_close_read_report">
		<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_time">
				SELECT *
				FROM Title a, doc_title_insurance_title d
				WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and a.cancelled is null

			</cfquery>
			<cfif read_time.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			</cfif>
<tr>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#DateFormat(check_date, "mm/dd/yyyy")#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>T-#title_id#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#BFirstName1# #BLastName1#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#not_clear_to_close_read_report.Company#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#DateFormat(not_clear_to_close_read_report.a_date_completed, "m/d/yyyy")# #TimeFormat(not_clear_to_close_read_report.a_time_completed, "HH:mm:ss")#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#not_clear_to_close_read_report.appraisal_status#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b><a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#not_clear_to_close_read_report.comp_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a></b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b>#pstate#</b></font>
</center>
</td>
<td bgcolor="#a_bgcolor#">
<center>
<font size=1 color=black face=verdana><b><a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#not_clear_to_close_read_report.comp_id#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a></b></font>
</center>
</td>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
				</tr>
	</CFOUTPUT>	</CFLOOP>
	</table><br>
<br>
<cfflush>








<CFQUERY datasource="#request.dsn#" NAME="loan_funded_not_closed_read_report" cachedwithin="#CreateTimeSpan(0, 0, cache_reset, 0)#">
SELECT *
			FROM Title a, title_closing_order_request f, doc_closer_title g, eventlist e, tax_cert_title b
			WHERE a.title_id = b.title_id and a.title_id = f.title_id and a.title_id = e.title_id and a.title_id = g.title_id AND f.a_Req_closing_month IS NOT NULL


		and a.cancelled is null
		and a.appraisal_status <> 'Order Cancelled'
			and (e.cl_dateandtime between '2007-08-01 00:00:00'  AND '#DateFormat(Now(), "yyyy-mm-dd")# 00:00:00')

				AND (a.bfirstname1 LIKE '%%' OR a.bfirstname2 LIKE '%%')

				AND (a.blastname1 LIKE '%%' OR blastname2 LIKE '%%')

		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed'

		AND a.title_id = e.title_id AND e.loanfun is null

		<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)

		 	ORDER BY  a.check_date


</CFQUERY>

<cfflush>
