<cfparam name="url.uid" default="0">
<cfset today = DateFormat(Now(), "m/d/yyyy")>
<cfparam name="form.today_day" default="#DatePart('d', today)#">
<cfparam name="form.today_month" default="#DatePart('m', today)#">
<cfparam name="form.today_year" default="#DatePart('yyyy', today)#">

<cfset two_weeks_ago = DateFormat(DateAdd("d", -14, today), "m/d/yyyy")>
<cfparam name="form.twa_day" default="#DatePart('d', two_weeks_ago)#">
<cfparam name="form.twa_month" default="#DatePart('m', two_weeks_ago)#">
<cfparam name="form.twa_year" default="#DatePart('yyyy', two_weeks_ago)#">

<cfset thirty_days_ago = DateFormat(DateAdd("d", -30, today), "m/d/yyyy")>
<cfparam name="form.tda_day" default="#DatePart('d', thirty_days_ago)#">
<cfparam name="form.tda_month" default="#DatePart('m', thirty_days_ago)#">
<cfparam name="form.tda_year" default="#DatePart('yyyy', thirty_days_ago)#">
<!--- end DATE VARIABLES --->

<cfparam name="url.sort_order_1" default="Company">
<cfparam name="url.sort_order_2" default="Company">
<cfparam name="url.sort_order_3" default="Company">
<cfparam name="url.sort_order_4" default="Company">
<cfparam name="url.deactivate" default="no">
<cfparam name="form.deactivate_me" default="">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Untitled</title>
<style>
td {font-size: 10px;}
</style>
</head>
<body>
<table>
    <CFINCLUDE Template="./Header1.cfm">
	<cfinclude template="/admin_area/met/ricks_page.cfm">
</table>
<table>
<BODY BGCOLOR=e1e1e1 TEXT="Black" LINK="Blue" VLINK="Blue" ALINK="Blue" BACKGROUND="./" TopMargin=0 LeftMargin=0 MarginHeight=0 MarginWidth=0>
<tr>
    <td>
        <br><br>
    </td>
</TR>
<tr>
		<TD>
		<CFOUTPUT>
			<cfFORM NAME="Search" METHOD="post" ACTION="./title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" >
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
								><input type="image" src="./images/button_search.gif" border=0 alt="Quick file search">
		</cfFORM>
	</CFOUTPUT>
		</TD>
</tr>

<tr>
<td>
<font size=2 color=black face=verdana>
Welcome to the First Title Services Admin Area.
<p>
Use the navigation at the top to perform any of<br>
the available functions.
</td>
</table>
<br>
<br>
<cfif session.ft_user_id eq 56>
VRM REPORTS<br>
<li><a href="reports_VRM_opened.cfm" target="_new">File Opened - Title Package not received</a></li>
<li><a href="reports_VRM_tp_up_no_deed.cfm" target="_new">Title Package Uploaded – No VRM Deed uploaded</a></li>
<li><a href="reports_VRM_sched_no_prehud.cfm" target="_new">Scheduled – No Pre HUD uploaded</a></li>
<li><a href="reports_VRM_sched_no_final_hud.cfm" target="_new">Scheduled – No Final HUD uploaded</a></li>
<li><a href="reports_VRM_sr_loan_closed_no_BTC.cfm" target="_new">SR Loan Closed – No BTC Closing Package uploaded</a></li>
<br>
<br>
</cfif>

<cfif url.uid eq 56 or url.uid eq 547 or url.uid eq 362>
<a href="team_stats.cfm" target="_new">Team Stats</a><br>
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

<br><a href="reports_team_stats.cfm" target="_new">Detailed Team Stats</a><br>

</cfif>
</cfif>
<br>
<cfif url.uid eq 56>
<a href="../rick_tests/vendor_tracker.cfm" target="_new">Vendor Tracker</a><br>
</cfif>
<br>
<cfif url.uid eq 56>
<a href="reo_reports.cfm" target="_new">REO Reports</a><br>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_current_user">
			SELECT *
			FROM First_Admin
			WHERE ID = #session.ft_user_id#
		</CFQUERY>
		
		
<cfif url.uid eq 362>
VRM REPORTS<br>
<a href="reports_VRM_opened.cfm" target="_new">File Opened - Title Package not received</a><br>
<a href="reports_VRM_tp_up_no_deed.cfm" target="_new">Title Package Uploaded – No VRM Deed uploaded</a><br>
<a href="reports_VRM_sched_no_prehud.cfm" target="_new">Scheduled – No Pre HUD uploaded</a><br>
<a href="reports_VRM_sched_no_final_hud.cfm" target="_new">Scheduled – No Final HUD uploaded</a><br>
<a href="reports_VRM_sr_loan_closed_no_BTC.cfm" target="_new">SR Loan Closed – No BTC Closing Package uploaded</a><br>
<br>
<br>
</cfif>



<cfif url.uid eq 56 or get_current_user.streamline_employee eq 'True'>
<br>
<a href="Streamline_LP_Report.cfm" target="_new">Streamline Loan Processor Report</a><br><br>
<a href="reports_internal_processor.cfm" target="_new">Streamline Internal Processor Report</a><br><br>
<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/sandbox/income_report/index.cfm" target="_blank">Income &amp; Expenses Report</a> <br><Br>
<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/sandbox/income_report/get_bad_ids.cfm" target="_blank">Find Titles w/ Missing HUD Data</a><br>
</cfif>

<cfoutput>
<cfif (get_current_user.role_id neq 24 and get_current_user.role_id neq 17) or get_current_user.id eq 322 or get_current_user.id eq 339 or get_current_user.id eq 359><br>

<a href="./met/projects" target="projects">Projects</a><br>
<br>
<a href="reports_ab_received_client_system_not_updated.cfm?uid=#url.uid#&al=1" target="new">Abstract Received, Client System NOT Updated</a><br>
</cfif>
<br>
<a href="https://#cgi.server_name#/admin_area/typing_commitment_review_report.cfm?uid=#url.uid#&al=1" target="new">Typing and Commitment Review Report</a><br>
<br>
<a href="https://#cgi.server_name#/admin_area/Contract_Assignment_and_Sales_Report_Date.cfm?uid=#url.uid#&al=1" target="new">Contract Assignment Report</a><br>
<br>
<a href="https://#cgi.server_name#/admin_area/reports_ICL.cfm?uid=#url.uid#&al=1" target="new">ICL Assignment Report</a><br>
<br>
<a href="https://#cgi.server_name#/fannie_daily_report.cfm" target="new">Fannie Mae Daily Report Comparison</a><br>

<br>
<br>

<a href="reports_abstract_unassigned.cfm?uid=#URL.uid#&al=#URL.al#" target="abstract_unassigned">Abstract Unassigned</a>
<br><br>
<a href="reports_abstract_assigned_not_received.cfm?uid=#URL.uid#&al=#URL.al#" target="abstract_assigned_not_received">Abstract Assigned Not Received</a>
<br><br>
<a href="reports_tax_data_not_completed.cfm?uid=#URL.uid#&al=#URL.al#" target="tax_data_not_completed">Tax Data Not Completed</a>
<br><br>



<a href="streamline_lp_report.cfm?uid=#url.uid#" target="new">Streamline&nbsp;Loan<BR><br>
Processor&nbsp;Report</a>
<br><br>
<a href="streamline_order_feed.cfm?uid=#url.uid#&al=1" target="new">Streamline Automatic Order Feed</a>
<br><br>
<a href="reports_title_claims_issues.cfm?uid=#url.uid#&al=1" target="new">Unresolved Title Claims / Title Issues</a>
<br><br>
<a href="vendor_routing_manage.cfm" target="new">Vendors Routing Table</a>
<br><br>

<a href="vendor_manage_services.cfm" target="new">Vendors Manage Services</a>
<BR><BR>
<a href="https://machine1.firsttitleservices.com/reports_vendor_eando.cfm" target="new">E & O Report</a>
<BR><BR>
<cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput>
<br>
<a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a><BR><BR>


<cfif session.ft_user_id eq 318 or session.ft_user_id eq 472 or session.ft_user_id eq 9 or session.ft_user_id eq 362 or session.ft_user_id eq 449 or session.ft_user_id eq 56 or session.ft_user_id eq 294>
<a href="reports_tracking_new.cfm" target="new">Chase/RealEC Turntime Report</a><br>
<br>
<a href="reports_tracking_flagstar.cfm" target="new">Flagstar Turntime Report</a><br>
<br>
</cfif>
<cfif session.ft_user_id eq 362 or session.ft_user_id eq 56 or session.ft_user_id eq 294 or session.ft_user_id eq 547>
<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/reports_secretary_veteran_affairs.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="blank">Secretary Veteran Affairs Report</a><br>
<br>
<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/reports_purchases_last_60_days.cfm" target="blank">PURCHASES - Last 60 Days</a><br>
<br>
</cfif>

<cfif session.ft_user_id eq 362 or session.ft_user_id eq 56 or session.ft_user_id eq 294 or session.ft_user_id eq 547>
<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/reports_purchases_last_60_days.cfm" target="blank">PURCHASES - Last 60 Days</a><br>
</cfif>

<cfif session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 547>
<a href="reports_sales_stats.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Stats by Client/Salesperson</a><BR><BR>
<a href="https://#cgi.server_name#/admin_area/reports_active_no_orders_30_days.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Active Accounts, No Orders 30 Days </a><br><br>
<a href="https://#cgi.server_name#/admin_area/Sales_Commission_Report_Date.cfm?uid=<cfoutput>#url.uid#</cfoutput>" target="new">Sales Commission Report</a><br><br>
</cfif>


<cfif session.ft_user_id eq 595>
<a href="reports_sales_stats.cfm?uid=<cfoutput>#URL.uid#&al=#URL.al#</cfoutput>" target="new">Sales Stats by Client</a><BR><BR>
<a href="sales_commission_report_date_New.cfm?uid=<cfoutput>#url.uid#</cfoutput>" target="new">Sales Commission Report</a><br><br>
</cfif>






<cfif session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 362 or session.ft_user_id eq 595>
<a href="reports_internal_processor.cfm" target="_new">Internal Processor Report</a><br><br>
<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/reports_purchases_last_60_days.cfm" target="blank">Purchases - Last 60 Days</a><BR><BR>
<a href="reports_subordination_needed.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Subordination Needed Report</a><BR><BR>
</cfif>

<cfif session.ft_user_id eq 56 or session.ft_user_id eq 59>
<a href="reports_simple_complex.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Simple/Complex Not Clear to Close Report</a><BR><BR>
</cfif>

<cfif session.ft_user_id eq 595 or session.ft_user_id eq 56 or session.ft_user_id eq 59>
<a href="reports_funded_without_policy.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Loan Funded Policy Not Uploaded</a><BR><BR>
<a href="report_funded_without_recording.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Loan Funded Recording Not Uploaded</a><BR><BR>
</cfif>

<cfif session.ft_user_id eq 56 or session.ft_user_id eq 59>
<!---	
<a href="reports_funded_with_policy.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Loan Funded With Title Policy Report</a><BR><BR>
--->
<a href="reports_waiting_on_docs.cfm?uid=<cfoutput>#url.uid#</cfoutput>" target="commissions">Waiting on Docs</a><BR><BR>
<a href="apr_files.cfm" target="_blank">APR System</a><BR><BR>
	<CFQUERY DATASOURCE="#request.dsn#" name="check_richmond_access">
	select * from First_admin
	where va_employee_temp = 'True'
	</CFQUERY>
<cfif check_richmond_access.recordcount eq 0>
<a href="https://#cgi.server_name#/admin_area/toggle_richmond_access.cfm?enable=1" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Turn ON Richmond Emergency Access</a><BR><BR>
<cfelse>
<a href="https://#cgi.server_name#/admin_area/toggle_richmond_access.cfm?enable=0" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Turn OFF Richmond Emergency Access</a><BR><BR>
</cfif>





</cfif>

<cfif session.ft_user_id eq 56 or  session.ft_user_id eq 294>
<a href="reports_internal_processor_melanie.cfm" target="_new">Internal Processor Report (Melanie)</a><BR><BR>
</cfif>


<cfif session.ft_user_id eq 362>
<a href="reports_waiting_on_docs.cfm?uid=<cfoutput>#url.uid#</cfoutput>" target="commissions">Waiting on Docs</a><BR><BR>
</cfif>


<!---<cfif url.uid eq 565>
<a href="./met/fee_generator_hits_by_company.cfm" target="fee_gen"><font face="Arial">Fee Generator Hits</font></a><br><br>
</cfif>--->


</cfoutput>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<!---
<cfinclude template="team_popup.cfm">
--->
</body>
</html>
