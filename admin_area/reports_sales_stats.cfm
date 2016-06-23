<cfparam name="url.uid" default="0">
<cfparam name="url.sort_order_1" default="Company">
<cfparam name="session.ft_user_id" default="0">
<cfparam name="session.role_id" default="0">
<cfparam name="form.calc_perc_by" default="life">



<CFPARAM NAME="excel" DEFAULT="0">

<cfoutput>
<cfif #excel# EQ 1>
	<cfset filename = "file.xls">
		<cfcontent type="application/vnd.ms-excel">
<cfheader name="Content-Disposition" value="attachment; filename=#filename#">
#filename#
</cfif>
</cfoutput>






<cfset admin_ids = "56,59,294,450,9,477,595,651">

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

<script language="javascript">

function to_excel() {
document.excel_form.submit();
}
</script>

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

<cfset ninety_days_ago = DateFormat(DateAdd("d", -90, today), "m/d/yyyy")>


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
SELECT c.id, c.Company, c.intSales
FROM Companies c
where 
c.test_account = 0
and c.a_status = 1
<cfif session.ft_user_id neq 59 and session.ft_user_id neq 56 and session.ft_user_id neq 450 and session.ft_user_id neq 460 and session.ft_user_id neq 248 and session.ft_user_id neq 462 and session.ft_user_id neq 9 and session.ft_user_id neq 472 and session.ft_user_id neq 618 and session.ft_user_id neq 477  and session.ft_user_id neq 547  and session.ft_user_id neq 595 and session.ft_user_id neq 618 and session.ft_user_id neq 651 and get_user.fairfax_admin neq 1 and get_user.mi_admin neq 1 and get_user.tx_admin neq 1>
and c.intsales = #session.ft_user_id#
</cfif>
<cfif session.role_id eq 34>
and c.streamline_client <> 1
<cfelseif session.ft_user_id eq 462 or get_user.fairfax_admin eq 1>
and c.fairfax_client <> 1
<cfelseif get_user.mi_admin eq 1>
and c.intSales in (Select ID from First_admin where mi_employee = 'True') 
<cfelseif get_user.tx_admin eq 1>
and c.intSales in (Select ID from First_admin where tx_employee = 'True') 
</cfif>
order by c.Company
</cfquery>



<cfif session.ft_user_id eq 618 or  session.ft_user_id eq 651 or  session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248 or session.ft_user_id eq 9 or session.ft_user_id eq 472 or session.ft_user_id eq 618 or session.ft_user_id eq 477 or session.ft_user_id eq 547 or session.ft_user_id eq 285 or session.ft_user_id eq 595>
<CFQUERY datasource="#request.dsn#" NAME="all_sales_people">
SELECT     ID, fname, lname, username, status
FROM         First_Admin
WHERE     (role_id = 24 OR (role_id = 34 AND id <> 450)) AND (status = 1 OR status = 'True') <!--- AND (va_employee IS NULL OR
                      va_employee = 0) AND (mi_employee IS NULL OR
                      mi_employee = 0) AND (mo_employee IS NULL OR
                      mo_employee = 0) AND (mi_flushing_employee IS NULL OR
                      mi_flushing_employee = 0)  AND (tx_employee IS NULL OR
                      tx_employee = 0) ---> AND (ID NOT IN (327, 264, 450)) OR
                      (ID = 319) OR (ID = 460) OR (ID = 501) OR
                      (ID = 408)
					  or (ID = 59)
					  or (ID = 56)
					  or (ID = 294)
ORDER BY lname
</cfquery>
</cfif>

<cfif get_user.mi_admin eq 1>
<CFQUERY datasource="#request.dsn#" NAME="all_sales_people">
SELECT     ID, fname, lname, username, status
FROM         First_Admin
WHERE     (role_id = 24 OR (role_id = 34 AND id <> 450)) AND (status = 1 OR status = 'True')
and mi_employee = 'True'
ORDER BY lname
</cfquery>
<cfelseif get_user.tx_admin eq 1>
<CFQUERY datasource="#request.dsn#" NAME="all_sales_people">
SELECT     ID, fname, lname, username, status
FROM         First_Admin
WHERE     (role_id = 24 OR (role_id = 34 AND id <> 450)) AND (status = 1 OR status = 'True')
and mi_employee = 'True'
ORDER BY lname
</cfquery>
</cfif>

<!--- this code finds all companies who have placed an order within the date range --->
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
<cfif session.ft_user_id neq 59 and session.ft_user_id neq 56 and session.ft_user_id neq 450 and session.ft_user_id neq 460 and session.ft_user_id neq 248 and session.ft_user_id neq 9 and session.ft_user_id neq 472 and session.ft_user_id neq 618 and session.ft_user_id neq 477 and session.ft_user_id neq 547 and session.ft_user_id neq 285 and session.ft_user_id neq 595 and session.ft_user_id neq 523 and session.ft_user_id neq 651>
and c.intsales = #session.ft_user_id#
</cfif>
<cfif session.role_id eq 34>
and c.streamline_client <> 1
<cfelseif session.ft_user_id eq 462 or get_user.fairfax_admin eq 1>
and c.fairfax_client <> 1
<cfelseif get_user.mi_admin eq 1>
and c.intSales in (Select ID from First_admin where mi_employee = 'True') 
<cfelseif get_user.tx_admin eq 1>
and c.intSales in (Select ID from First_admin where tx_employee = 'True') 
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



<CFQUERY datasource="#request.dsn#" NAME="outfootprint_states">
SELECT st_abbrev from title_companies_states where title_co_id = '19'
</cfquery>

<cfset oof_states = ValueList(outfootprint_states.st_abbrev, ",")>

<cfoutput>
<cfif ListFindNoCase(admin_ids, session.ft_user_id, ",")>
<cfset query_14_days = QueryNew("Company, Company_ID, State, Zip, Orders, Last_Order, Proc_name, Proc_phone, Total_Orders, Total_Cancelled, Total_Funded,Total_Closed_in_Range,Percentage, NotFunded90Days, Team, Sales, Revenue, Streamline, orders_in_footprint")>
<cfelse>
<cfset query_14_days = QueryNew("Company, Company_ID, State, Zip, Orders, Last_Order, Proc_name, Proc_phone, Total_Orders, Total_Cancelled, Total_Funded,Total_Closed_in_Range,Percentage, NotFunded90Days, Team, Sales, Streamline, orders_in_footprint")>
</cfif>




<cfloop index="this_comp_id" list="#all_comp_ids#" delimiters=",">


<CFQUERY datasource="#request.dsn#" NAME="get_orders_by_comp">
SELECT c.intSales, c.streamline_client, c.id, t.comp_id, t.title_id, t.pstate, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status, m.name AS Team_Name, m.ID AS Team_ID, f.fname, f.lname, c.state, c.zip_code, t.revenue
FROM Title t, Companies c, Teams m, First_Admin f
where c.ID = '#this_Comp_id#'
	<cfif form.calc_perc_by eq 'range'>
	and t.order_date >= '#two_weeks_ago#'
    AND t.order_date <= '#today#'
	</cfif>
and c.ID = t.comp_id
and c.Team_ID = m.ID
and f.ID = c.intSales
order by t.order_date DESC
</cfquery>

<cfquery datasource="#request.dsn#"  name="orders_90_days_not_loan_funded"> 
SELECT c.intSales, c.streamline_client, c.id, t.comp_id, t.title_id, t.pstate, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status, m.name AS Team_Name, m.ID AS Team_ID, f.fname, f.lname, c.state, c.zip_code, t.revenue
FROM Title t, Companies c, Teams m, First_Admin f
where c.ID = '#this_Comp_id#'
	and t.order_date >= '#ninety_days_ago#'
    AND t.order_date <= '#today#'
    and t.appraisal_status <> 'Loan Funded'
and c.ID = t.comp_id
and c.Team_ID = m.ID
and f.ID = c.intSales
order by t.order_date DESC
	</cfquery>





<cfquery dbtype="query" name="orders_out_of_footprint"> 
	SELECT *
	FROM get_orders_by_comp
	Where pstate = 'XXX'
	<cfloop index="this_state" list="#oof_states#" delimiters=",">
	or pstate = '#this_State#'
	</cfloop>
	</cfquery>

<cfquery dbtype="query" name="orders_in_range"> 
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
	<cfif form.calc_perc_by eq 'range'>
	and order_date >= '#two_weeks_ago#'
    AND order_date <= '#today#'
	</cfif>
	</cfquery>
<cfquery datasource="#request.dsn#" name="total_closed_orders"> 
	SELECT appraisal_status
	FROM Title
	Where comp_id = '#this_Comp_id#'
	and (appraisal_status = 'Loan Closed' or appraisal_status = 'Loan Funded')
	<cfif form.calc_perc_by eq 'range'>
	and order_date >= '#two_weeks_ago#'
    AND order_date <= '#today#'
	</cfif>
	</cfquery>


<cfquery datasource="#request.dsn#" name="total_funded_orders_in_range"> 
	SELECT t.title_id, t.comp_id, e.fl_dateandtime, e.loanfun
	FROM Title t, eventlist e
	Where t.comp_id = '#this_Comp_id#'
	and (e.loanfun = 1)
	and e.fl_dateandtime Between CONVERT(DATETIME,'#two_weeks_ago#', 102) AND CONVERT(DATETIME,'#today#', 102)
	and e.title_id = t.title_id
	</cfquery>

<cfquery datasource="#request.dsn#" name="total_closed_orders_in_range"> 
	SELECT t.appraisal_status, e.cl_dateandtime
	FROM Title t, eventlist e
	Where t.comp_id = '#this_Comp_id#'
	and (t.appraisal_status = 'Loan Closed' or t.appraisal_status = 'Loan Funded')
	and e.cl_dateandtime >= '#two_weeks_ago#'
    AND e.cl_dateandtime <= '#today#'
	and e.title_id = t.title_id
	</cfquery>
	

<cfset revenue_total = 0>
<cfif ListFindNoCase(admin_ids, session.ft_user_id, ",")>
<cfif form.calc_perc_by eq 'range'>
<cfloop query="orders_in_range">
 <cfif orders_in_range.revenue neq '' and orders_in_range.revenue neq 'NULL' and IsNumeric(orders_in_range.revenue)>
  <cfset revenue_total = revenue_total + orders_in_range.revenue>
 </cfif>
</cfloop>
<cfelse>
<cfloop query="get_orders_by_comp">
 <cfif get_orders_by_comp.revenue neq '' and get_orders_by_comp.revenue neq 'NULL' and IsNumeric(get_orders_by_comp.revenue)>
  <cfset revenue_total = revenue_total + get_orders_by_comp.revenue>
 </cfif>
</cfloop>
</cfif>
</cfif>

<cfset temp = QueryAddRow(query_14_days)>
<cfif orders_in_range.Company NEQ "NULL" and orders_in_range.Company NEQ "">
<cfset temp = QuerySetCell(query_14_days, "Company", orders_in_range.Company)>
<cfelse>
<cfset temp = QuerySetCell(query_14_days, "Company", "")>
</cfif>

<cfset temp = QuerySetCell(query_14_days, "orders_in_footprint", get_orders_by_comp.recordcount-orders_out_of_footprint.recordcount)>


<cfset temp = QuerySetCell(query_14_days, "NotFunded90Days", orders_90_days_not_loan_funded.recordcount)>


<cfif this_comp_id NEQ "NULL" and this_comp_id NEQ "">
<cfset temp = QuerySetCell(query_14_days, "Company_ID", this_comp_id)>
<cfelse>
<cfset temp = QuerySetCell(query_14_days, "Company_ID", "")>
</cfif>

<cfif get_orders_by_comp.state NEQ "NULL" and get_orders_by_comp.state NEQ "">
<cfset temp = QuerySetCell(query_14_days, "State", get_orders_by_comp.state)>
<cfelse>
<cfset temp = QuerySetCell(query_14_days, "State", "")>
</cfif>


<cfif get_orders_by_comp.zip_code NEQ "NULL" and get_orders_by_comp.zip_code NEQ "">
<cfset temp = QuerySetCell(query_14_days, "Zip", "#ListFirst(get_orders_by_comp.zip_code,'-')#")>
<cfelse>
<cfset temp = QuerySetCell(query_14_days, "Zip", "0")>
</cfif>


<cfif get_orders_by_comp.streamline_client EQ 'True'>
<cfset temp = QuerySetCell(query_14_days, "Streamline", 'True')>
<cfelse>
<cfset temp = QuerySetCell(query_14_days, "Streamline", 'False')>
</cfif>


<!--- <cfset temp = QuerySetCell(query_14_days, "Proposed", get_orders_by_comp.proposed_monthly_transactions)>
 --->
<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Orders", orders_in_range.RecordCount)>
<CFCATCH type="any"></CFCATCH>
</CFTRY>


<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Last_Order", get_orders_by_comp.order_date)>
<CFCATCH type="any"></CFCATCH>
</CFTRY>


<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Proc_Name", get_orders_by_comp.pname)>
<CFCATCH type="any"></CFCATCH>
</CFTRY>

<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Proc_Phone", get_orders_by_comp.pphone)>
<CFCATCH type="any">
<cfset temp = QuerySetCell(query_14_days, "Proc_Phone", "0")>
</CFCATCH>
</CFTRY>

<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Total_Orders", get_orders_by_comp.RecordCount)>
<CFCATCH type="any"></CFCATCH>
</CFTRY>

<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Total_Cancelled", total_cancelled_orders.RecordCount)>
<CFCATCH type="any"></CFCATCH>
</CFTRY>

<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Total_Funded", total_funded_orders_in_range.RecordCount)>
<CFCATCH type="any"></CFCATCH>
</CFTRY>

<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Total_Closed_In_Range", total_closed_orders_in_range.RecordCount)>
<CFCATCH type="any"></CFCATCH>
</CFTRY>

<cfif ListFindNoCase(admin_ids, session.ft_user_id, ",")>
<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Revenue", revenue_total)>
<CFCATCH type="any"></CFCATCH>
</CFTRY>
</cfif>
<!--- <cfif get_orders_by_comp.a_date NEQ "NULL" and get_orders_by_comp.a_date NEQ "">
<cfset temp = QuerySetCell(query_14_days, "Sign_up", CreateODBCDateTime(DateFormat(get_orders_by_comp.a_date, "mm-dd-yyyy")))>
<cfelse>
<cfset temp = QuerySetCell(query_14_days, "Sign_up", "")>
</cfif> --->
<cfif get_orders_by_comp.Recordcount neq 0>
<cfset percentage = (total_closed_orders.RecordCount) / get_orders_by_comp.RecordCount * 100>
<cfelse>
<cfset percentage = 0>
</cfif>

<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Percentage", percentage)>
<CFCATCH type="any"></CFCATCH>
</CFTRY>

<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Team", get_orders_by_comp.Team_Name)>
<CFCATCH type="any"></CFCATCH>
</CFTRY>

<CFTRY>
<cfset sales_person = get_orders_by_comp.fname & " " & get_orders_by_comp.lname>
<CFCATCH type="any"></CFCATCH>
</CFTRY>

<CFTRY>
<cfset temp = QuerySetCell(query_14_days, "Sales", sales_person)>
<CFCATCH type="any"></CFCATCH>
</CFTRY>


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
<cfcase value="Total_Funded">
    order by Total_Funded DESC
</cfcase>
<cfcase value="Total_Closed_In_Range">
    order by Total_Closed_In_Range DESC
</cfcase>
<cfcase value="Percent">
    order by percentage DESC
</cfcase>
<cfcase value="NotFunded90Days">
    order by NotFunded90Days DESC
</cfcase>
<cfcase value="Team">
    order by Team, Company
</cfcase>
<cfcase value="Revenue">
    order by Revenue, Team, Company
</cfcase>
<cfcase value="orders_in_footprint">
    order by orders_in_footprint DESC
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
<td align="top" valign="left"><span class="table_header"><strong><cfif session.ft_user_id eq 59 or session.ft_user_id eq 651 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248 or session.ft_user_id eq 472 or session.ft_user_id eq 618 or session.ft_user_id eq 547 or session.ft_user_id eq 9 or session.ft_user_id eq 595 or session.ft_user_id eq 523>Salesperson</cfif></strong></span></td>
<td align="top" valign="left"><span class="table_header"><strong><cfif session.ft_user_id eq 59 or session.ft_user_id eq 651 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248 or session.ft_user_id eq 472 or session.ft_user_id eq 618 or session.ft_user_id eq 547 or session.ft_user_id eq 9 or session.ft_user_id eq 595 or session.ft_user_id eq 523>Client</cfif></strong></span></td>
</tr>
<tr>
<td align="bottom" valign="left"><span class="table_header">Start Date</span></td>
<td align="bottom">&nbsp;</td>
<td align="bottom" valign="left"><span class="table_header">End Date</span></td>
<td rowspan=3 align="top" valign="left">

<cfif session.ft_user_id eq 59 or session.ft_user_id eq 651 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248 or session.ft_user_id eq 9 or session.ft_user_id eq 472 or session.ft_user_id eq 618 or session.ft_user_id eq 547 or session.ft_user_id eq 285 or session.ft_user_id eq 595 or session.ft_user_id eq 523>
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
<td rowspan=3 align="top" valign="left"><cfif session.ft_user_id eq 59 or session.ft_user_id eq 651 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248 or session.ft_user_id eq 285 or session.ft_user_id eq 472 or session.ft_user_id eq 618 or session.ft_user_id eq 547 or session.ft_user_id eq 9 or session.ft_user_id eq 595 or session.ft_user_id eq 523>
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
<td  align="top" valign="left" colspan=3>
<table>
<tr>
<td  align="top" valign="left"><input name="submit" type="submit" value="Refresh">&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td  align="top" valign="left"><span class="table_header">Calculate totals by:</span><BR><input name="calc_perc_by" type="radio" value="life" <cfif form.calc_perc_by eq 'life'>checked</cfif>>life of the client&nbsp;&nbsp;<input name="calc_perc_by" type="radio" value="range" <cfif form.calc_perc_by eq 'range'>checked</cfif>>date range<br>
<em>(applies to Total Cancelled, Total Closed, Closed/Ordered Percentage<cfif ListFindNoCase(admin_ids, session.ft_user_id, ",")>, Revenue</cfif>)</em></td>
</tr>
</table>
</td>
</tr>
</table>
<br>
<br>
<br>
<font size="-2" face="arial">
<table width-"600">
<tr bgcolor="##99CCFF">
<cfif cgi.REMOTE_ADDR eq '98.233.100.254'>
<td align="left" valign="bottom" width="200"><strong>CompID</strong></td>
</cfif>
<td align="left" valign="bottom" width="200"><strong><a href="reports_sales_stats.cfm?sort_order_1=Company&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Company"><em>Company Name</em><cfelse>Company Name</cfif></a></strong></td>

<td align="left" valign="bottom" width="50"><strong><a href="reports_sales_stats.cfm?sort_order_1=State&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "State"><em>State</em><cfelse>State</cfif></a></strong></td>
<td align="left" valign="bottom" width="50"><strong><a href="reports_sales_stats.cfm?sort_order_1=Zip&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Zip"><em>Zip</em><cfelse>Zip</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Orders&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Orders"><em>Orders between #two_weeks_ago# and #today#</em><cfelse>Orders between #two_weeks_ago# and #today#</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Last_order&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Last_Order"><em>Date of Last Order</em><cfelse>Date of Last Order</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Proc_Name&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Proc_Name"><em>Processor Name</em><cfelse>Processor Name</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Proc_Phone&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Proc_Phone"><em>Processor Phone</em><cfelse>Processor Phone</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Total_Orders&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Orders"><em>Total Orders</em><cfelse>Total Orders</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Total_Cancelled&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Cancelled"><em>Total Cancelled</em><cfelse>Total Cancelled</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Total_Funded&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Funded"><em>Total Funded:<br>
Funded Date in Range</em><cfelse>Total Funded:<br>
Funded Date in Range</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Total_Closed_In_Range&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Closed_In_Range"><em>Total Closed:<br>
Close Date in Range</em><cfelse>Total Closed:<br>
Close Date in Range</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Percent&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Percent"><em>Closed/Ordered Percentage</em><cfelse>Closed/Ordered Percentage</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=NotFunded90Days&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "NotFunded90Days"><em>90-Days, Not Funded</em><cfelse>90-Days, Not Funded</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Team&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Team"><em>Team</em><cfelse>Team</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Sales&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Sales"><em>Sales Person</em><cfelse>Sales Person</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=orders_in_footprint&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "orders_in_footprint"><em>Orders In Footprint</em><cfelse>Orders In Footprint</cfif></a></strong></td>


<cfif ListFindNoCase(admin_ids, session.ft_user_id, ",")>
<td align="right" valign="bottom"><strong><a href="reports_sales_stats.cfm?sort_order_1=Revenue&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Revenue"><em>Revenue</em><cfelse>Revenue</cfif></a></strong></td>
</cfif>
</tr>
<cfloop query="detail">
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
<tr bgcolor="#bgcolor#">
<cfif cgi.REMOTE_ADDR eq '98.233.100.254'>
<td align="left" valign="top" width="200"><A href="client_modify_display.cfm?UID=#url.uid#&al=1&modify_client_id=#company_id#">#Company_id#</A></td>
</cfif>
<td align="left" valign="top" width="200"><A href="client_modify_display.cfm?UID=#url.uid#&al=1&modify_client_id=#company_id#">#Company# <cfif streamline eq' True'>-(S)</cfif></A></td>
<td align="center" valign="top">#State#</td>
<td align="center" valign="top">#Zip#</td>
<td align="center" valign="top">#Orders#</td>
<td align="center" valign="top">#DateFormat(Last_Order, "m/d/yyyy")#</td>
<td align="center" valign="top">#Proc_Name#</td>
<td align="center" valign="top">#Proc_Phone#</td>
<td align="center" valign="top">#Total_Orders#</td>
<td align="center" valign="top">#Total_Cancelled#</td>
<td align="center" valign="top">#Total_Funded#</td>
<td align="center" valign="top">#Total_Closed_In_Range#</td>
<td align="center" valign="top">#NumberFormat(percentage, '__')#%</td>
<td align="center" valign="top">#NotFunded90Days#</td>
<td align="center" valign="top">#Team#</td>
<td align="center" valign="top">#Sales#</td>
<td align="center" valign="top">#Orders_in_footprint#</td>
<cfif ListFindNoCase(admin_ids, session.ft_user_id, ",")>
<td align="right" valign="top">#DollarFormat(revenue)#</td>
</cfif>
</tr>
</cfloop>
</table>
</font>
</cfoutput>
</form>

<cfoutput>
<form name="excel_form" action="reports_sales_stats.cfm?uid=#URL.uid#&al=1" method="post">
<input type="hidden" name="excel" value="1">
<input type="hidden" name="two_weeks_ago" value="#DateFormat(two_weeks_ago, 'm-d-yyyy')#">
<input type="hidden" name="today" value="#DateFormat(today, 'm-d-yyyy')#">
</form>
</cfoutput>
<input name="excel_submit" type="button" onClick="to_excel();" value="EXPORT TO EXCEL"><br>
<br><br>
<br>

<cfflush>
<!--- END this code finds all companies who have placed an order within the last 2 weeks --->

</BODY>
</HTML>
