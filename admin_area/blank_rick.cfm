<cfparam name="url.uid" default="0">
<cfparam name="session.ft_user_id" default="0">
<cfif session.ft_user_id eq 248>
<cflocation url="met/projects">
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_user">
Select *
from First_admin
where ID = #session.ft_user_id#
</cfquery>

<!-- this code gets the order dates from all orders, creates an actual datetime value for it, and puts it into the database as order_date, to make searching easier --->
<CFQUERY datasource="#request.dsn#" NAME="get_all_orders">
Select a_insert_date, title_id
FROM Title
where order_date IS NULL
</cfquery>
<cfoutput query="get_all_orders">
<cfif IsDate(get_all_orders.a_insert_date)>
<cfset newdate = CreateODBCDate(get_all_orders.a_insert_date)>
<cfelse>
<cfset newdate = CreateODBCDate('1/1/1900')>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="update_orders">
Update Title
Set order_date = #newdate#
where title_id = '#get_all_orders.title_id#'
</cfquery>
</cfoutput>
<!--- done --->


<!-- this code gets the sign up dates from all Companies, creates an actual datetime value for it, and puts it into the database as sign_up_date, to make searching easier --->
<CFQUERY datasource="#request.dsn#" NAME="get_all_companies">
Select a_date, id
FROM Companies
where sign_up_date IS NULL
and a_date IS NULL
order by id
</cfquery>

<cfoutput query="get_all_companies">
<cfset newdate = CreateODBCDate("01/01/2000")>
<CFQUERY datasource="#request.dsn#" NAME="update_companiess">
Update Companies
Set sign_up_date = #newdate#
where id = '#get_all_companies.id#'
</cfquery>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="get_all_companies">
Select a_date, id
FROM Companies
where sign_up_date IS NULL
and a_date IS NOT NULL
order by id
</cfquery>

<cfoutput query="get_all_companies">
<cfset newdate = CreateODBCDate(get_all_companies.a_date)>
<CFQUERY datasource="#request.dsn#" NAME="update_companiess">
Update Companies
Set sign_up_date = #newdate#
where id = '#get_all_companies.id#'
</cfquery>
</cfoutput>
<!--- done --->


<!--- this code makes sure all deactivated & test accounts are put in the Inactive/Test Team --->
<CFQUERY datasource="#request.dsn#" NAME="update_companies">
Update Companies
Set team_id = 11
where test_account = 1 or a_status = 0
</cfquery>


<cfparam name="url.sort_order_1" default="Company">
<cfparam name="url.sort_order_2" default="Company">
<cfparam name="url.sort_order_3" default="Company">
<cfparam name="url.sort_order_4" default="Company">
<cfparam name="url.sort_order_5" default="Company">
<cfparam name="url.deactivate" default="no">
<cfparam name="form.deactivate_me" default="">
<cfparam name="form.deactivate_me2" default="">
<cfparam name="form.deactivate_me3" default="">

<!--- if companies have been selected for deactivation, and the form is submitted, deactivate the selected accounts --->

<cfif url.deactivate eq "yes">
<CFQUERY datasource="#request.dsn#" NAME="get_deactivated_companies">
Select Company, ID, email, intSales, team_id
FROM Companies
where ID = 12345678987654321
<cfloop index="this_id" list="#deactivate_me#" delimiters=",">
or ID = #this_id#
</cfloop>
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_comp_ids">
Update Companies
Set a_status = 0
where ID = 12345678987654321
<cfloop index="this_id" list="#deactivate_me#" delimiters=",">
or ID = #this_id#
</cfloop>
</cfquery>



<CFQUERY datasource="#request.dsn#" NAME="get_deactivated_companies2">
Select Company, ID, email, intSales, team_id
FROM Companies
where ID = 12345678987654321
<cfloop index="this_id" list="#deactivate_me2#" delimiters=",">
or ID = #this_id#
</cfloop>
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_comp_ids">
Update Companies
Set a_status = 0
where ID = 12345678987654321
<cfloop index="this_id" list="#deactivate_me2#" delimiters=",">
or ID = #this_id#
</cfloop>
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="get_deactivated_companies3">
Select Company, ID, email, intSales, team_id
FROM Companies
where ID = 12345678987654321
<cfloop index="this_id" list="#deactivate_me3#" delimiters=",">
or ID = #this_id#
</cfloop>
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_comp_ids">
Update Companies
Set a_status = 0
where ID = 12345678987654321
<cfloop index="this_id" list="#deactivate_me3#" delimiters=",">
or ID = #this_id#
</cfloop>
</cfquery>
<cfinclude template="../auto_emails/account_deactivation.cfm">
</cfif>
<!--- end deactivation --->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<style>
td {font-size: 10px;}
</style>
</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="Black" LINK="Blue" VLINK="Blue" ALINK="Blue" BACKGROUND="./" TopMargin=0 LeftMargin=0 MarginHeight=0 MarginWidth=0>

<cfif url.uid neq 59>
<!--- <cfif cgi.REMOTE_ADDR eq '69.251.16.147'>
<cfdump var="#session#"><br>
</cfif>
 --->
 <font size=2 color=black face=verdana>

<!--- <a href="https://#cgi.server_name#/admin_area/menu_Cleartoclose.cfm?uid=#session.ft_user_id#&al=1" target="new">Clear To Close Report</a><br>
<br> --->

Welcome to the First Title Services Admin Area.
<p>
Use the navigation at the top to perform any of<br>
the available functions.<br>
<br>
</cfif>
<cfif session.ft_user_id eq 252>
<a href="Contract_Assignment_and_Sales_Report_Date.cfm?uid=<cfoutput>#url.uid#</cfoutput>" target="new">Contract Assignment and Sales Report</a>
</cfif>

<cfif url.deactivate eq "yes">
The following companies have been deactivated:<br>
<cfoutput query="get_deactivated_companies">
#Company#<br>
</cfoutput>
<cfoutput query="get_deactivated_companies2">
#Company#<br>
</cfoutput>
<cfoutput query="get_deactivated_companies3">
#Company#<br>
</cfoutput>
</cfif>
<cfif url.uid eq 59 or url.uid eq 58>
<CFQUERY datasource="#request.dsn#" NAME="get_mods">
select * from Companies_Mod_Tracker
where completed is NULL and before_or_after = 'before'
order by change_date_time
</CFQUERY>

<!-- link to fee generator hits by company --->
<br>
<a href="./met/fee_generator_hits_by_company.cfm" target="fee_gen"><font face="Arial">Fee Generator Hits</font></a><br>
<a href="./met/revenue_report.cfm" target="rev_report"><font face="Arial">Revenue Report</font></a><br>

<a href="./Streamline_LP_Report.cfm" target="rev_report"><font face="Arial">Streamline Loan Processor Report</font></a><br>
<cfif get_mods.recordcount>
<a href="./met/company_mod_approvals/index.cfm" target="_new"><font face="Arial" color="RED"><strong>Company Modification Approvals <cfoutput>(#get_mods.recordcount#)</cfoutput></strong></font></a><br>
<cfelse>
<a href="./met/company_mod_approvals/index.cfm" target="_new"><font face="Arial">Company Modification Approvals</font></a><br>
</cfif>
<cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 90>
<a href="Contract_Assignment_and_Sales_Report_Date.cfm?uid=<cfoutput>#url.uid#</cfoutput>" target="new">Contract Assignment and Sales Report</a>
</cfif>
<br>
<br>
<br>



<!--- THIS CODE SETS UP ALL THE DATE VARIABLES WE'LL NEED --->

<cfset today = DateFormat(Now(), "m/d/yyyy")>
<cfparam name="form.today_day" default="#DatePart('d', today)#">
<cfparam name="form.today_month" default="#DatePart('m', today)#">
<cfparam name="form.today_year" default="#DatePart('yyyy', today)#">

<cfset one_year_ago = DateFormat(DateAdd("d", -30, today), "m/d/yyyy")>
<cfparam name="form.twa_day" default="#DatePart('d', one_year_ago)#">
<cfparam name="form.twa_month" default="#DatePart('m', one_year_ago)#">
<cfparam name="form.twa_year" default="#DatePart('yyyy', one_year_ago)#">

<cfset thirty_days_ago = DateFormat(DateAdd("d", -30, today), "m/d/yyyy")>
<cfparam name="form.tda_day" default="#DatePart('d', thirty_days_ago)#">
<cfparam name="form.tda_month" default="#DatePart('m', thirty_days_ago)#">
<cfparam name="form.tda_year" default="#DatePart('yyyy', thirty_days_ago)#">
<!--- end DATE VARIABLES --->


<!--- this code finds all companies who have placed an order within 1 year --->
<CFQUERY datasource="#request.dsn#" NAME="get_comp_ids">
SELECT c.id, t.comp_id, t.a_insert_date, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, c.proposed_monthly_transactions, t.order_date
FROM Title t, Companies c
where
t.order_date >= '#one_year_ago#'
and t.order_date <= '#today#'
and c.ID = t.comp_id
and c.test_account = 0
order by c.Company, order_date DESC
</cfquery>

<cfset all_comp_ids = "">
<cfloop query="get_comp_ids">
<cfif Not ListContains(all_comp_ids, ID, ",")>
<cfset all_comp_ids = ListAppend(all_comp_ids, ID, ",")>
</cfif>
</cfloop>

<cfoutput>

<cfset query_14_days = QueryNew("Company, Company_ID, Orders, Last_Order, Proc_name, Proc_phone, Total_Orders, Total_Cancelled, Total_Closed,Percentage, Team, Sales")>
<cfloop index="this_comp_id" list="#all_comp_ids#" delimiters=",">
<CFQUERY datasource="#request.dsn#" NAME="get_orders_by_comp">
SELECT c.intSales, c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status, m.name AS Team_Name, m.ID AS Team_ID, f.fname, f.lname
FROM Title t, Companies c, Teams m, First_Admin f
where c.ID = '#this_Comp_id#'
<!--- and t.order_date >= '#two_weeks_ago#'
and t.order_date <= '#today#' --->
and c.ID = t.comp_id
and c.Team_ID = m.ID
and f.ID = c.intSales
order by t.order_date DESC
</cfquery>


<cfquery dbtype="query" name="orders_last_two_weeks">
	SELECT *
	FROM get_orders_by_comp
	Where order_date >= '#one_year_ago#'
    AND order_date <= '#today#'
	</cfquery>
<cfquery datasource="#request.dsn#" name="total_cancelled_orders">
	SELECT cancelled
	FROM Title
	Where comp_id = '#this_Comp_id#'
	and cancelled = 1
	</cfquery>
<cfquery datasource="#request.dsn#" name="total_closed_orders">
	SELECT appraisal_status
	FROM Title
	Where comp_id = '#this_Comp_id#'
	and (appraisal_status = 'Loan Closed' or appraisal_status = 'Loan Funded')
	</cfquery>

<cfset temp = QueryAddRow(query_14_days)>
<cfset temp = QuerySetCell(query_14_days, "Company", orders_last_two_weeks.Company)>
<cfset temp = QuerySetCell(query_14_days, "Company_ID", this_comp_id)>
<!--- <cfset temp = QuerySetCell(query_14_days, "Proposed", get_orders_by_comp.proposed_monthly_transactions)>
 ---><cfset temp = QuerySetCell(query_14_days, "Orders", orders_last_two_weeks.RecordCount)>
<cfset temp = QuerySetCell(query_14_days, "Last_Order", get_orders_by_comp.order_date)>
<!--- <cfif get_orders_by_comp.a_date NEQ "NULL" and get_orders_by_comp.a_date NEQ "">
<cfset temp = QuerySetCell(query_14_days, "Sign_up", CreateODBCDateTime(DateFormat(get_orders_by_comp.a_date, "mm-dd-yyyy")))>
<cfelse>
<cfset temp = QuerySetCell(query_14_days, "Sign_up", "")>
</cfif> --->
<cfset temp = QuerySetCell(query_14_days, "Proc_Name", get_orders_by_comp.pname)>
<cfset temp = QuerySetCell(query_14_days, "Proc_Phone", get_orders_by_comp.pphone)>
<cfset temp = QuerySetCell(query_14_days, "Total_Orders", get_orders_by_comp.RecordCount)>
<cfset temp = QuerySetCell(query_14_days, "Total_Cancelled", total_cancelled_orders.RecordCount)>
<cfset temp = QuerySetCell(query_14_days, "Total_Closed", total_closed_orders.RecordCount)>
<cfif get_orders_by_comp.Recordcount neq 0>
<cfset percentage = (total_closed_orders.RecordCount) / get_orders_by_comp.RecordCount * 100>
<cfelse>
<cfset percentage = 0>
</cfif>
<cfset temp = QuerySetCell(query_14_days, "Percentage", percentage)>
<cfset temp = QuerySetCell(query_14_days, "Team", get_orders_by_comp.Team_Name)>
<cfset sales_person = get_orders_by_comp.fname & " " & get_orders_by_comp.lname>
<cfset temp = QuerySetCell(query_14_days, "Sales", sales_person)>

</cfloop>
</cfoutput>


<cfquery dbtype="query" name="detail">
	SELECT *
	FROM query_14_days
<cfswitch expression="#url.sort_order_1#">
<cfcase value="Total_Orders">
    order by Total_Orders DESC
</cfcase>
<cfcase value="Orders">
    order by Orders DESC
</cfcase>
<cfcase value="Last_Order">
    order by Last_Order DESC
</cfcase>
<cfcase value="Sign_Up">
    order by Sign_Up DESC
</cfcase>
<cfcase value="Proc_Name">
    order by Proc_Name DESC
</cfcase>
<cfcase value="Proc_Phone">
    order by Proc_Phone DESC
</cfcase>
<cfcase value="Total_Cancelled">
    order by Total_Cancelled DESC
</cfcase>
<cfcase value="Total_Closed">
    order by Total_Closed DESC
</cfcase>
<cfcase value="Percent">
    order by percentage DESC
</cfcase>
<cfcase value="Team">
    order by Team, Company
</cfcase>
<cfdefaultcase>
    order by Company
</cfdefaultcase>
</cfswitch>
</cfquery>
<cfoutput>
<cfset bgcolor = 'efefef'>
<strong>30-DAY HISTORY</strong>: #one_year_ago# - #today#<br>
<font size="-2" face="arial">
<table width-"600">
<tr bgcolor="##99CCFF">
<td align="left" valign="bottom" width="200"><strong><a href="blank.cfm?sort_order_1=Company&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Company"><em>Company Name</em><cfelse>Company Name</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_1=Orders&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Orders"><em>Orders in Last 30 Days</em><cfelse>Orders in Last 30 Days</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_1=Last_order&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Last_Order"><em>Date of Last Order</em><cfelse>Date of Last Order</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_1=Proc_Name&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Proc_Name"><em>Processor Name</em><cfelse>Processor Name</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_1=Proc_Phone&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Proc_Phone"><em>Processor Phone</em><cfelse>Processor Phone</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_1=Total_Orders&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Orders"><em>Total Orders</em><cfelse>Total Orders</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_1=Total_Cancelled&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Cancelled"><em>Total Cancelled</em><cfelse>Total Cancelled</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_1=Total_Closed&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Closed"><em>Total Closed</em><cfelse>Total Closed</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_1=Percent&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Percent"><em>Closed/Ordered Percentage</em><cfelse>Closed/Ordered Percentage</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_1=Team&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Team"><em>Team</em><cfelse>Team</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_1=Team&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#">Salesperson</a></strong></td>

</tr>

<cfloop query="detail">
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
<tr bgcolor="#bgcolor#">
<td align="left" valign="top" width="200"><A href="client_modify_display.cfm?UID=#url.uid#&al=1&modify_client_id=#company_id#">#Company#</A></td>
<td align="center" valign="top">#Orders#</td>
<td align="center" valign="top">#DateFormat(Last_Order, "m/d/yyyy")#</td>
<td align="center" valign="top">#Proc_Name#</td>
<td align="center" valign="top">#Proc_Phone#</td>
<td align="center" valign="top">#Total_Orders#</td>
<td align="center" valign="top">#Total_Cancelled#</td>
<td align="center" valign="top">#Total_Closed#</td>
<td align="center" valign="top">#NumberFormat(percentage, '__')#%</td>
<td align="center" valign="top">#Team#</td>
<td align="center" valign="top">#Sales#</td>
</tr>
</cfloop>
</table>
</font>
</cfoutput>
<cfflush>
<!--- END this code finds all companies who have placed an order within the last 2 weeks --->

<br>
</cfif>
</BODY>
</HTML>
