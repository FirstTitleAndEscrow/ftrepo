563
652<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<CFPARAM NAME="role_mgr" DEFAULT="">


<CFQUERY datasource="#request.dsn#" NAME="read_user">
	select * from first_admin

			WHERE ID = #session.ft_user_id#
</CFQUERY>



<CFSET MaxRows = 1000>
<CFSET StartRow = 1>

<!---Do a group by to get all of the names --->
<!--- <CFQUERY datasource="#request.dsn#" NAME="proc_name">

		SELECT * from sqlProcessingOpenOrders 
</CFQUERY>
 --->
<!---
<CFQUERY datasource="#request.dsn#" NAME="NotClear_To_Close">
	select * from sqlProcessing_NotClearToClose
</CFQUERY>
--->
<html>
<head>
<title>Processing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style> 
ul { margin-left: 467px;
			margin-right: 150px; 
			margin-top: 10px;
}

</style>
</head>

<body>

<table width="893" cellpadding=1 cellspacing=1 border=0 bgcolor=white></table>
	<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
  		<tr>
    		<td align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  		</tr>
		<TR>
			<TD>
<CFOUTPUT>
<cfFORM NAME="Search" METHOD="post" ACTION="https://#cgi.server_name#/admin_area/title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" target="search_page">
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
<a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a>
</TD>
		</TR>
		<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput></td></tr>
	</table><BR>
	
	


<CFQUERY datasource="#request.dsn#" NAME="get_current_user">
			SELECT *
			FROM First_Admin
			WHERE ID = #session.ft_user_id#
		</CFQUERY>
	


<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
<tr><td>
	<cfif session.ft_user_id eq  477 or session.ft_user_id eq  551>
	<table border="0" align="left">
    <TR>
		<td align="center" colspan="2"><b>Vendors</b></td>
	</TR>
	<CFoutput>
	<TR>
		<td width="45"align="center"><a href="./vendor_add2.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>A</font></a></td>
		<td width="45" align="center"><a href="./vendor_modify_choose.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=red face=verdana>M</font></a></td><!---</cfif>--->
	</TR>
	</CFOUTPUT>
</table>
</cfif>
	<cfif session.ft_user_id eq  340>
	<table border="0" align="left" width="75">
    <TR>
		<td align="center" colspan="2"><b>Users</b></td>
	</TR>
	<CFoutput>
	<TR>
		<td width="45"align="center"><a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#" target="_blank"><font size=2 color=blue face=verdana>A</font></a></td>
		<td width="45" align="center"><a href="./user_modify.cfm?uid=#URL.uid#&al=#URL.al#" target="_blank"><font size=2 color=red face=verdana>M</font></a></td><!---</cfif>--->
	</TR>
	</CFOUTPUT>
</table>
</cfif>



	<cfif session.ft_user_id eq  490 or session.ft_user_id eq  523 or session.ft_user_id eq  563 or session.ft_user_id eq  652>
	<table border="0" align="left" width="75">
    <TR>
		<td align="center" colspan="2"><b>Clients</b></td>
	</TR>
	<CFoutput>
	<TR>
		<td width="45"align="center"><a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>A</font></a></td>
		<td width="45"align="center"><a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=red face=verdana>M</font></a></td>
		<td width="45" align="center"><A HREF="https://#cgi.server_name#/admin_area/login_as_client.cfm?uid=#URL.uid#&al=#URL.al#" target="client_window"><font size=2 color=red face=verdana>L</font></a></td><!---</cfif>--->
	</TR>
	</CFOUTPUT>
</table>
</cfif>

</td></tr>
		<td width="111" bgcolor="#CCD2D2"><cfif (get_current_user.role_id neq 24 and get_current_user.role_id neq 17) or get_current_user.id eq 322 or get_current_user.id eq 339 or get_current_user.id eq 359>&nbsp;&nbsp;<a href="./met/projects" target="projects">Projects</a><cfelse>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cfif></td>
		<td width="111" bgcolor="#CCD2D2"><cfif get_current_user.streamline_employee eq 1><a href="reo_reports.cfm?" target="reo_reports">REO Reports</a><cfelse>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cfif></td>


		<td width="111" bgcolor="#CCD2D2"><cfif get_current_user.ID eq 387 or get_current_user.ID eq 490 or get_current_user.ID eq 477 or get_current_user.ID eq 532 or get_current_user.ID eq 523><a href="menu_Cleartoclose.cfm?uid=<cfoutput>#get_current_user.ID#</cfoutput>&al=1" target="ctc_window">Clear To Close</a></cfif></td>


		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_choose.cfm?uid=#URL.uid#&al=#URL.al#&trigger=1" target="_blank"><font size=2 color=red face=verdana>Scheduling/Funding Calendar</font></a></cfoutput></CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#" target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>
		<CFIF #role_mgr# eq "1">
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>
		</CFIF>
		<CFIF session.ft_user_id eq 340 or session.ft_user_id eq 407>
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/cancelled_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="cancelled_files"><font size=2 color=yellow face=verdana>Cancelled</font></a></cfoutput></CENTER>
		</CFIF>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onClick="location.reload()">Refresh</A></center></td>
		<td width="111" bgcolor="#CCD2D2"><cfif read_user.streamline_employee eq 'True'>
<a href="streamline_lp_report.cfm?uid=#url.uid#" target="new">Streamline&nbsp;Loan<BR>
Processor&nbsp;Report</a><cfelse>&nbsp;
</cfif></td>
		<td width="111" bgcolor="#CCD2D2"><cfif read_user.streamline_employee eq 'True'>
<cfoutput><a href="reports_ab_received_client_system_not_updated.cfm?uid=#url.uid#&al=1" target="new">Abstract Received, Client Sytem NOT Updated</a></cfoutput><cfelse>&nbsp;
</cfif>
		</td>
		<td width="111" bgcolor="#CCD2D2"><Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/login_as_client.cfm?uid=#URL.uid#&al=#URL.al#" target="client_window">
				<font size=2 color=blue face=verdana>Login As Client</font></a>
				</cfoutput>
				</CENTER></td>
	</table>
		<ul> 
		<!--- New Reports Menu --->
       <cfinclude template="/admin_area/met/ricks_page.cfm">
	</ul>
	<table width="100%">
		<tr>
			<TD>
				<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            	Processing Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
			</TD>
		</tr>
		</table>
		
<center>		
<cfif session.ft_user_id eq 484 or session.ft_user_id eq 407>
<table width="700">
		<tr>
			<TD>VRM REPORTS<br>
<li><a href="reports_VRM_opened.cfm" target="_new">File Opened - Title Package not received</a></li>
<li><a href="reports_VRM_tp_up_no_deed.cfm" target="_new">Title Package Uploaded – No VRM Deed uploaded</a></li>
<li><a href="reports_VRM_sched_no_prehud.cfm" target="_new">Scheduled – No Pre HUD uploaded</a></li>
<li><a href="reports_VRM_sched_no_final_hud.cfm" target="_new">Scheduled – No Final HUD uploaded</a></li>
<li><a href="reports_VRM_sr_loan_closed_no_BTC.cfm" target="_new">SR Loan Closed – No BTC Closing Package uploaded</a></li>
<br>
<br>
</td></tr></table>
</cfif>

<cfif session.ft_user_id eq 490>
<li><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/reports_purchases_last_60_days.cfm" target="blank">Purchases - Last 60 Days</a></li>
</cfif>


<cfif session.ft_user_id eq 488 or  session.ft_user_id eq 551 or  session.ft_user_id eq 340 or  session.ft_user_id eq 553 or  session.ft_user_id eq 600>

<table width="700">
		<tr>
			<TD>
			<A href="https://machine1.firsttitleservices.com/admin_area/apr_files.cfm" target="reports">APR First Title Report</A><br>
			<br>
			<A href="https://machine1.firsttitleservices.com/admin_area/apr_files.cfm?paid=1" target="reports">APR First Title Paid in  Full Report</A><br><br>
			<A href="https://machine1.firsttitleservices.com/admin_area/apr_files.cfm?view=streamline" target="reports">APR Streamline Report</A><br>
			<br>
			<A href="https://machine1.firsttitleservices.com/admin_area/apr_files.cfm?view=streamline&paid=1" target="reports">APR Streamline Paid in Full Report</A><br><br>
		
		
		
			</TD>
		</tr>
</table>
</center>
</cfif>

<cfif session.ft_user_id eq 484>
<center>
<table width=700>
		<tr>
			<TD>
			<A href="reports_tracking_new.cfm" target="reports">Chase/RealEC Turntime Report</A><br>

			</TD>
		</tr>
</table>
</center>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="get_parent_id">
	SELECT parent_user_id from First_Admin where ID = #session.ft_user_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_members">
	SELECT members, ID 
	FROM Teams
</CFQUERY>
<cfset all_team_ids = "">
<cfloop query="read_members">
<cfif ListFindNoCase(members, session.ft_user_id, ",") or  ListFindNoCase(members, get_parent_id.parent_user_id, ",")>
<cfset all_team_ids = ListAppend(all_team_ids, id, ",")>
</cfif>
</cfloop>

<cfset session.all_team_ids = all_team_ids>

<cfif ListLen(session.all_team_ids, ",")>
	<center>
<table width=700>
		<tr>
			<TD>
			<A href="reports_team_stats.cfm" target="reports">Detailed Team Stats</A><br>

			</TD>
		</tr>
</table>
</center><br>
</cfif>

<cfif session.ft_user_id eq 490 or session.ft_user_id eq 340>
	<center>
<table width=700>
		<tr>
			<TD>
			<a href="reports_internal_processor.cfm" target="_new">Internal Processor Report</a><br>

			</TD>
		</tr>
</table>
</center><br>
</cfif>



<cfif session.ft_user_id eq 340 or session.ft_user_id eq 477>
<center>
<table width=700>
		<tr>
			<TD>
			<A href="https://machine1.firsttitleservices.com/admin_area/sales_commission_report_date.cfm?uid=#session.ft_user_id#" target="reports">Sales Commission Report</A><br>
			<br>
			<A href="https://machine1.firsttitleservices.com/admin_area/report_order_aging.cfm?uid=#session.ft_user_id#" target="reports">Order Aging Report</A><br>
		
		
		
			</TD>
		</tr>
</table>
</center>
</cfif>


<cfif session.ft_user_id eq 551 or session.ft_user_id eq 553 or  session.ft_user_id eq 600>
<center>
<table width=700>
		<tr>
			<TD>
			<A href="https://machine1.firsttitleservices.com/admin_area/sales_commission_report_date.cfm?uid=#session.ft_user_id#" target="reports">Sales Commission Report</A><br>
			</TD>
		</tr>
</table>
</center>
</cfif>


<cfif session.ft_user_id eq 477>
<center>
<table width=700>
		<tr>
			<TD>
			<a href="reports_sales_stats.cfm?uid=<cfoutput>#session.ft_user_id#&al=0</cfoutput>" target="new">Stats by Client/Salesperson</a><BR>

			</TD>
		</tr>
</table>
</center>
</cfif>


<cfif session.ft_user_id eq 407 or session.ft_user_id eq 479>
<center>
<table width=700>
		<tr>
			<TD>
			<a href="reports_subordination_needed.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Subordination Needed Report</a><br>

			</TD>
		</tr>
</table>
</cfif>

<cfif session.ft_user_id eq 407 or session.ft_user_id eq 484>
<center>
<table width=700>
		<tr>
			<TD>
			<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/reports_secretary_veteran_affairs.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="blank">Secretary Veteran Affairs Report</a><br>

			</TD>
		</tr>
</table>
</cfif>


<cfif session.ft_user_id eq 407>
<center>
<table width=700>
		<tr>
			<TD>
			<a href="reports_tracking_new.cfm" target="new">Chase/RealEC Turn Time Report</a><br>

			</TD>
		</tr>
		<tr>
			<TD>
			<a href="reports_tracking_shore.cfm" target="new">Shore Mortgage Turntime Report</a><br>

			</TD>
		</tr>
		<tr>
			<TD>
			<a href="reports_simple_complex.cfm" target="new">Simple/Complex Not Clear to Close Issues</a><br>

			</TD>
		</tr>
		<tr>
			<TD>
			<a href="report_title_ins_complete_not_clear_all.cfm?uid=<cfoutput>#uid#&al=#al#</cfoutput>" target="new">Title Ins Complete / Not Clear to Close</a><br>

			</TD>
		</tr>
</table>

</center>
</cfif>


<cfif session.ft_user_id eq 387 or session.ft_user_id eq 484>
<center>
<table width=700>
		<tr>
			<TD>
			<a href="reports_waiting_on_docs.cfm?uid=<cfoutput>#url.uid#</cfoutput>" target="commissions">Waiting on Docs</a><br>

			</TD>
		</tr>
</table>
</center>
</cfif>


<cfif session.ft_user_id eq 387>
<center>
<table width=700>
		<tr>
			<TD>
			<a href="reports_tracking_shore.cfm" target="new">Shore Mortgage Turntime Report</a><br>
			</TD>
		</tr>
</table>
</center>
</cfif>


<cfif session.ft_user_id eq 407>
<center>
<table width=700>
		<tr>
			<TD>
			<a href="reports_waiting_on_docs.cfm?uid=<cfoutput>#url.uid#</cfoutput>" target="commissions">Waiting on Docs</a><br>

			</TD>
		</tr>
</table>
</center>
</cfif>


<cfif session.ft_user_id eq 387 or session.ft_user_id eq 499>
<center>
<table width=700>
		<tr>
			<TD>
			<a href="reports_tracking_flagstar.cfm" target="new">Flagstar Turntime Report</a><br>

			</TD>
		</tr>
</table>
</center>
</cfif>



<!---
<CFIF NotClear_To_Close.RecordCount gte 1>

	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
			<tr>
				<TD colspan=5>
					<Center><B>Not Clear To Close</B></CENTER>
				</TD>
			</tr>
			<TR>
				<td bgcolor="elelel" valign=top align="center">
					<B>Order Num</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Assigned Date/Time</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Borrower</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Client</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Closing Date</B>
				</td>
			</TR>
			<CFOUTPUT QUERY="NotClear_To_Close" StartRow="#StartRow#" MAXROWS="#MaxRows#">
			<tr>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#NotClear_To_Close.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#DateFormat(dateandtime,"m/dd/yy")# #TimeFormat(dateandtime,"hh:mm tt")#
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#BFirstName1# #BLastName1#
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#company#
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#A_Req_Closing_month#/#A_Req_Closing_Day#/#A_Req_Closing_year#
				</td>
			</tr>
		</CFOUTPUT>
		</table>
		</CFIF>

--->


	<!---Second part of report only for people who work on Processing--->
		<!---Do a group by to get all of the names --->



		<!--- <CFQUERY datasource="#request.dsn#" NAME="CTC_Names">
			Select Processor_ID from sqlProcessingOpenOrders group by Processor_ID order by Processor_ID
		</CFQUERY>--->
		<!--- <CFIF #CTC_Names.RecordCount# gte 1>
		<!---Loop through one name at a time --->
		<CFLOOP QUERY="CTC_Names">
		<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
			Select * from sqlProcessingOpenOrders where Processor_ID = '#CTC_Names.Processor_ID#'
		</CFQUERY>


	<table width="893" align="center">
		<tr>
			<TD colspan=6><Center><B>Waiting to be completed by <cfoutput>#read_NotClear_To_Close_Name.fname# #read_NotClear_To_Close_Name.lname#</cfoutput></B></CENTER></TD>
		</tr>
		<TR>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Num</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Assigned Date/Time</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Borrower</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Client</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Closing Date</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Finished</B>
			</td>
		</TR>
		<CFOUTPUT QUERY="read_NotClear_To_Close_Name" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(dateandtime,"m/d/yy")# #TimeFormat(dateandtime,"hh:mm tt")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#BFirstName1# #BLastName1#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#A_Req_Closing_month#/#A_Req_Closing_Day#/#A_Req_Closing_year#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="./close_processing.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1"><font size=1 color=red face=verdana>Submit</font></a>
			</td>
		</tr>
		</CFOUTPUT>
	</table>
	</CFLOOP>
    <CFELSE>
		<Center><B><font size="+1">No Orders for Processing at this time.</font></B></CENTER>
	</CFIF>
</table> --->
<!---
<cfinclude template="team_popup.cfm">
--->
<!---<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<CFPARAM NAME="role_mgr" DEFAULT="">

<CFSET MaxRows = 1000>
<CFSET StartRow = 1>

<!---Do a group by to get all of the names --->
<CFQUERY datasource="#request.dsn#" NAME="proc_name">
		SELECT * from sqlProcessingOpenOrders
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="NotClear_To_Close">
	select * from sqlProcessing_NotClearToClose
</CFQUERY>
<html>
<head>
<title>Processing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<table width="893" cellpadding=1 cellspacing=1 border=0 bgcolor=white></table>
	<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
  		<tr>
    		<td align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
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
</CFOUTPUT> </TD>
		</TR>
	</table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_choose.cfm?uid=#URL.uid#&al=#URL.al#&trigger=1"target="_blank"><font size=2 color=red face=verdana>Scheduling/Funding Calendar</font></a></cfoutput></CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>
		<CFIF #role_mgr# eq "1">
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>
		</CFIF>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onclick="location.reload()">Refresh</A></center></td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</table>
	<table width="893">
		<tr>
			<TD>
				<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            	Processing Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
			</TD>
		</tr>
	</table>
	<CFIF NotClear_To_Close.RecordCount gte 1>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
			<tr>
				<TD colspan=5>
					<Center><B>Not Clear To Close</B></CENTER>
				</TD>
			</tr>
			<TR>
				<td bgcolor="elelel" valign=top align="center">
					<B>Order Num</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Assigned Date/Time</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Borrower</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Client</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Closing Date</B>
				</td>
			</TR>
			<CFOUTPUT QUERY="NotClear_To_Close" StartRow="#StartRow#" MAXROWS="#MaxRows#">
			<tr>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#NotClear_To_Close.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#DateFormat(dateandtime,"m/dd/yy")# #TimeFormat(dateandtime,"hh:mm tt")#
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#BFirstName1# #BLastName1#
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#company#
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#A_Req_Closing_month#/#A_Req_Closing_Day#/#A_Req_Closing_year#
				</td>
			</tr>
		</CFOUTPUT>
		</table>
		</CFIF>



	<!---Second part of report only for people who work on Processing--->
		<!---Do a group by to get all of the names --->
		<CFQUERY datasource="#request.dsn#" NAME="CTC_Names">
			Select Processor_ID from sqlProcessingOpenOrders group by Processor_ID order by Processor_ID
		</CFQUERY>
		<CFIF #CTC_Names.RecordCount# gte 1>
		<!---Loop through one name at a time --->
		<CFLOOP QUERY="CTC_Names">
		<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
			Select * from sqlProcessingOpenOrders where Processor_ID = '#CTC_Names.Processor_ID#'
		</CFQUERY>


	<table width="893" align="center">
		<tr>
			<TD colspan=6><Center><B>Waiting to be completed by <cfoutput>#read_NotClear_To_Close_Name.fname# #read_NotClear_To_Close_Name.lname#</cfoutput></B></CENTER></TD>
		</tr>
		<TR>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Num</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Assigned Date/Time</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Borrower</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Client</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Closing Date</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Finished</B>
			</td>
		</TR>
		<CFOUTPUT QUERY="read_NotClear_To_Close_Name" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(dateandtime,"m/d/yy")# #TimeFormat(dateandtime,"hh:mm tt")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#BFirstName1# #BLastName1#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#A_Req_Closing_month#/#A_Req_Closing_Day#/#A_Req_Closing_year#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="./close_processing.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1"><font size=1 color=red face=verdana>Submit</font></a>
			</td>
		</tr>
		</CFOUTPUT>
	</table>
	</CFLOOP>
    <CFELSE>
		<Center><B><font size="+1">No Orders for Processing at this time.</font></B></CENTER>
	</CFIF>
</table>--->