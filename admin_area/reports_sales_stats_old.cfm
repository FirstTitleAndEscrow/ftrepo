<cfparam name="url.uid" default="0">
<cfparam name="url.sort_order_1" default="Company">
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

<!--- <CFQUERY datasource="#request.dsn#" NAME="get_mods">	
select * from Companies_Mod_Tracker
where completed is NULL and before_or_after = 'before'
order by change_date_time
</CFQUERY>
 --->
<!-- link to fee generator hits by company --->

<!--- <a href="./met/fee_generator_hits_by_company.cfm" target="fee_gen"><font face="Arial">Fee Generator Hits</font></a><br>
<a href="./met/revenue_report.cfm" target="rev_report"><font face="Arial">Revenue Report</font></a><br>
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
 --->


<!--- THIS CODE SETS UP ALL THE DATE VARIABLES WE'LL NEED --->
<cfparam name="form.today" default="">
<cfparam name="form.two_weeks_ago" default="">
<cfparam name="form.clients" default="All">
<cfparam name="form.sales_people" default="All">


<cfif form.today neq ''>
<cfset today = DateFormat(form.today, "m/d/yyyy")>
<cfelse>
<cfset today = DateFormat(Now(), "m/d/yyyy")>
</cfif>

<cfparam name="form.today_day" default="#DatePart('d', today)#">
<cfparam name="form.today_month" default="#DatePart('m', today)#">
<cfparam name="form.today_year" default="#DatePart('yyyy', today)#">

<cfif form.two_weeks_ago neq ''>
<cfset two_weeks_ago = DateFormat(form.two_weeks_ago, "m/d/yyyy")>
<cfelse>
<cfset two_weeks_ago = DateFormat(DateAdd("d", -14, today), "m/d/yyyy")>
</cfif>

<cfparam name="form.twa_day" default="#DatePart('d', two_weeks_ago)#">
<cfparam name="form.twa_month" default="#DatePart('m', two_weeks_ago)#">
<cfparam name="form.twa_year" default="#DatePart('yyyy', two_weeks_ago)#">

<cfset thirty_days_ago = DateFormat(DateAdd("d", -30, today), "m/d/yyyy")>
<cfparam name="form.tda_day" default="#DatePart('d', thirty_days_ago)#">
<cfparam name="form.tda_month" default="#DatePart('m', thirty_days_ago)#">
<cfparam name="form.tda_year" default="#DatePart('yyyy', thirty_days_ago)#">
<!--- end DATE VARIABLES --->

<CFQUERY datasource="#request.dsn#" NAME="all_companies">
SELECT c.id, c.Company
FROM Companies c
where 
c.test_account = 0
and c.a_status = 1
<cfif session.ft_user_id neq 59 and session.ft_user_id neq 56 and session.ft_user_id neq 450 and session.ft_user_id neq 460 and session.ft_user_id neq 248 and session.ft_user_id neq 462 and get_user.fairfax_admin neq 1>
and c.intsales = #session.ft_user_id#
</cfif>
<cfif session.role_id eq 34>
and c.streamline_client <> 1
<cfelseif session.ft_user_id eq 462 or get_user.fairfax_admin eq 1>
and c.fairfax_client <> 1
</cfif>
order by c.Company
</cfquery>

<cfif session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248>
<CFQUERY datasource="#request.dsn#" NAME="all_sales_people">
SELECT     ID, fname, lname, username, status
FROM         First_Admin
WHERE     (role_id = 24 OR (role_id = 34 AND id <> 450)) AND (status = 1 OR status = 'True') AND (va_employee IS NULL OR
                      va_employee = 0) AND (mi_employee IS NULL OR
                      mi_employee = 0) AND (mo_employee IS NULL OR
                      mo_employee = 0) AND (mi_flushing_employee IS NULL OR
                      mi_flushing_employee = 0) AND (tx_employee IS NULL OR
                      tx_employee = 0)  AND (ft_fairfax_employee IS NULL OR
                      ft_fairfax_employee = 0) AND (ID NOT IN (327, 264, 450)) OR
                      (ID = 319) OR (ID = 460) OR
                      (ID = 408)
					  or (ID = 59)
					  or (ID = 56)
					  or (ID = 294)
ORDER BY lname
</cfquery>
</cfif>

<!--- this code finds all companies who have placed an order within the last 2 weeks --->
<CFQUERY datasource="#request.dsn#" NAME="get_comp_ids">
SELECT c.id, t.comp_id, t.a_insert_date, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, c.proposed_monthly_transactions, t.order_date
FROM Title t, Companies c
where
t.order_date >= '#two_weeks_ago#'
and t.order_date <= '#today#'
<cfif form.clients neq 'ALL'>
and c.ID in (#form.clients#)
</cfif>
<cfif form.sales_people neq 'ALL'>
and c.intSales in (#form.sales_people#)
</cfif>
<cfif session.ft_user_id neq 59 and session.ft_user_id neq 56 and session.ft_user_id neq 450 and session.ft_user_id neq 460 and session.ft_user_id neq 248>
and c.intsales = #session.ft_user_id#
</cfif>
<cfif session.role_id eq 34>
and c.streamline_client <> 1
<cfelseif session.ft_user_id eq 462 or get_user.fairfax_admin eq 1>
and c.fairfax_client <> 1
</cfif>
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

<cfset query_14_days = QueryNew("Company, Company_ID, State, Zip, Orders, Last_Order, Proc_name, Proc_phone, Total_Orders, Total_Cancelled, Total_Closed,Percentage, Team, Sales")>
<cfloop index="this_comp_id" list="#all_comp_ids#" delimiters=",">
<CFQUERY datasource="#request.dsn#" NAME="get_orders_by_comp">
SELECT c.intSales, c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status, m.name AS Team_Name, m.ID AS Team_ID, f.fname, f.lname, c.state, c.zip_code
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
	Where order_date >= '#two_weeks_ago#'
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
<cfset temp = QuerySetCell(query_14_days, "State", get_orders_by_comp.state)>
<cfset temp = QuerySetCell(query_14_days, "Zip", get_orders_by_comp.zip_code)>
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
<cfcase value="State">
    order by State DESC
</cfcase>
<cfcase value="Zip">
    order by Zip DESC
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
<cfoutput><br>
<br>
<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:12px}
.table_border {border-style:solid; border-color:##000000; border-width:thin;}
</style>
<form action="reports_sales_stats.cfm?sort_order_3=#url.sort_order_3#&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#" method="post" name="sale_stats_form">
<cfset bgcolor = 'efefef'>
<table  class="table_border">
<tr>
<td colspan=3 align="top" valign="left"><span class="table_header"><strong>Date Range</strong></span></td>
<td align="top" valign="left"><span class="table_header"><strong><cfif session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248>Salesperson</cfif></strong></span></td>
<td align="top" valign="left"><span class="table_header"><strong><cfif session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248>Client</cfif></strong></span></td>
</tr>
<tr>
<td align="bottom" valign="left"><span class="table_header">Start Date</span></td>
<td align="bottom">&nbsp;</td>
<td align="bottom" valign="left"><span class="table_header">End Date</span></td>
<td rowspan=3 align="top" valign="left">

<cfif session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248>
<SELECT NAME="sales_people"	multiple		
								size="5" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								
								<OPTION VALUE="All" <cfif form.sales_people eq 'All'>selected</cfif>>All</OPTION>
								<CFloop QUERY="all_sales_people"><OPTION VALUE="#all_sales_people.ID#" <cfif ListFindNoCase(form.sales_people, all_sales_people.ID, ',')>selected</cfif>>#all_sales_people.fname# #all_sales_people.lname#</OPTION></CFloop>			
							</SELECT>
							</cfif>
							</td>
<td rowspan=3 align="top" valign="left"><cfif session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248>
<SELECT NAME="clients"	multiple		
								size="5" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								
								<OPTION VALUE="All" <cfif form.clients eq 'All'>selected</cfif>>All</OPTION>
								<CFloop QUERY="all_companies"><OPTION VALUE="#all_companies.ID#" <cfif ListFindNoCase(form.clients, all_companies.ID, ',')>selected</cfif>>#all_companies.Company#</OPTION></CFloop>			
							</SELECT>
							</cfif>
							</td>
</tr>
<tr>
<td align="top" valign="left"><input type="text" name="two_weeks_ago" value="#two_weeks_ago#"></td>
<td align="middle" valign="center"><span class="table_header">-</span></td>
<td align="top" valign="left"><input type="text" name="today" value="#today#"></td>
</tr>
<tr>
<td  align="top" valign="left" colspan=3><input name="submit" type="submit" value="Refresh"></td>
</tr>
</table>
<br>
<br>
<br>
<font size="-2" face="arial">
<table width-"600">
<tr bgcolor="##99CCFF">
<td align="left" valign="bottom" width="200"><strong><a href="reports_sales_stats.cfm?sort_order_1=Company&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Company"><em>Company Name</em><cfelse>Company Name</cfif></a></strong></td>

<td align="left" valign="bottom" width="50"><strong><a href="reports_sales_stats.cfm?sort_order_1=State&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "State"><em>State</em><cfelse>State</cfif></a></strong></td>
<td align="left" valign="bottom" width="50"><strong><a href="reports_sales_stats.cfm?sort_order_1=Zip&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Zip"><em>Zip</em><cfelse>Zip</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Orders&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Orders"><em>Orders between #two_weeks_ago# and #today#</em><cfelse>Orders between #two_weeks_ago# and #today#</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Last_order&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Last_Order"><em>Date of Last Order</em><cfelse>Date of Last Order</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Proc_Name&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Proc_Name"><em>Processor Name</em><cfelse>Processor Name</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Proc_Phone&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Proc_Phone"><em>Processor Phone</em><cfelse>Processor Phone</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Total_Orders&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Orders"><em>Total Orders</em><cfelse>Total Orders</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Total_Cancelled&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Cancelled"><em>Total Cancelled</em><cfelse>Total Cancelled</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Total_Closed&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Closed"><em>Total Closed</em><cfelse>Total Closed</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Percent&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Percent"><em>Closed/Ordered Percentage</em><cfelse>Closed/Ordered Percentage</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Team&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Team"><em>Team</em><cfelse>Team</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Sales&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Sales"><em>Sales Person</em><cfelse>Sales Person</cfif></a></strong></td>

</tr>

<cfloop query="detail">
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
<tr bgcolor="#bgcolor#">
<td align="left" valign="top" width="200"><A href="client_modify_display.cfm?UID=#url.uid#&al=1&modify_client_id=#company_id#">#Company#</A></td>
<td align="center" valign="top">#State#</td>
<td align="center" valign="top">#Zip#</td>
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
</form>
<cfflush>
<!--- END this code finds all companies who have placed an order within the last 2 weeks --->

</BODY>
</HTML>
