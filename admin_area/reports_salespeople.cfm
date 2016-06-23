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


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<style>
td {font-size: 10px;}
</style>
</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="Black" LINK="Blue" VLINK="Blue" ALINK="Blue" BACKGROUND="./" TopMargin=0 LeftMargin=0 MarginHeight=0 MarginWidth=0>







<!--- <CFQUERY datasource="#request.dsn#" NAME="get_mods">	
select * from Companies_Mod_Tracker
where completed is NULL and before_or_after = 'before'
order by change_date_time
</CFQUERY> --->

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
<cfparam name="form.end_date" default="">
<cfparam name="form.start_date" default="">
<cfparam name="form.clients" default="All">
<cfparam name="form.sales_people" default="All">


<cfif form.end_date neq ''>
<cfset end_date = DateFormat(form.end_date, "m/d/yyyy")>
<cfelse>
<cfset end_date = DateFormat(Now(), "m/d/yyyy")>
</cfif>

<cfparam name="form.end_date_day" default="#DatePart('d', end_date)#">
<cfparam name="form.end_date_month" default="#DatePart('m', end_date)#">
<cfparam name="form.end_date_year" default="#DatePart('yyyy', end_date)#">

<cfif form.start_date neq ''>
<cfset start_date = DateFormat(form.start_date, "m/d/yyyy")>
<cfelse>
<cfset start_date = DateFormat(DateAdd("d", -14, end_date), "m/d/yyyy")>
</cfif>

<cfparam name="form.twa_day" default="#DatePart('d', start_date)#">
<cfparam name="form.twa_month" default="#DatePart('m', start_date)#">
<cfparam name="form.twa_year" default="#DatePart('yyyy', start_date)#">

<cfset thirty_days_ago = DateFormat(DateAdd("d", -30, end_date), "m/d/yyyy")>
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
<cfif session.ft_user_id neq 59 and session.ft_user_id neq 58 and session.ft_user_id neq 450 and session.ft_user_id neq 460 and session.ft_user_id neq 248>
and c.intsales = #session.ft_user_id#
</cfif>
<cfif session.role_id eq 34 or session.ft_user_id eq 450>
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
WHERE     (role_id = 24 OR (role_id = 34 AND id <> 450)) AND (status = 1 OR
                      status = 'True') AND (va_employee IS NULL OR
                      va_employee = 0) AND (mi_employee IS NULL OR
                      mi_employee = 0) AND (mo_employee IS NULL OR
                      mo_employee = 0) AND (mi_flushing_employee IS NULL OR
                      mi_flushing_employee = 0) and (tx_employee IS NULL OR
                      tx_employee = 0)  and (ft_fairfax_employee IS NULL OR
                      ft_fairfax_employee = 0) AND (ID NOT IN (327, 264, 450)) OR
                      (ID = 319) OR
                      (ID = 408) OR
                      (ID = 460)
					  or (ID = 59)
					  or (ID = 56)
					  or (ID = 294)
ORDER BY lname
</cfquery>



<cfset sales_ids = ValueList(all_sales_people.ID, ",")>
<cfif form.sales_people neq 'All'>
<cfset sales_ids = form.sales_people>
</cfif>
<cfelse>
<cfset sales_ids = #session.ft_user_id#>
</cfif>
<cfoutput>
<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:12px}
.table_border {border-style:solid; border-color:##000000; border-width:thin;}
</style>
<form action="reports_salespeople.cfm?sort_order_3=#url.sort_order_3#&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#" method="post" name="sale_stats_form">
<cfset bgcolor = 'efefef'>
<table  class="table_border">
<tr>
<td colspan=3 align="top" valign="left"><span class="table_header"><strong>Date Range</strong></span></td>
<td align="top" valign="left"><span class="table_header"><strong><cfif session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248>Salesperson</cfif></strong></span></td>
</tr>
<tr>
<td align="bottom" valign="left"><span class="table_header">Start Date</span></td>
<td align="bottom">&nbsp;</td>
<td align="bottom" valign="left"><span class="table_header">End Date</span></td>
<td rowspan=3 align="top" valign="left"> <cfif session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.role_id eq 34 or session.ft_user_id eq 248>
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
							</cfif></td>

</tr>
<tr>
<td align="top" valign="left"><input type="text" name="start_date" value="#start_date#"></td>
<td align="middle" valign="center"><span class="table_header">-</span></td>
<td align="top" valign="left"><input type="text" name="end_date" value="#end_date#"></td>
</tr>
<tr>
<td  align="top" valign="left" colspan=3><input name="submit" type="submit" value="Refresh"></td>
</tr>
</table>
<br>
<br>
<br>

</cfoutput>


<!--- ORDERS BY SALESPERSON OVER LAST 7 DAYS --->

<strong>ORDERS BY SALESPERSON OVER LAST <cfoutput>#DateDiff("d", start_date, end_date)#</cfoutput> DAYS</strong><br>
<font size="-2" face="arial">
<table cellpadding="4">
<tr bgcolor="#99CCFF">
<cfoutput><td align="left" valign="top">Sales Person</td>
<cfset new_date = DateFormat(start_date, "m/d/yyyy")>
<td align="right" valign="top">#new_date#</td>
<cfloop condition="new_date neq end_date">
<cfset new_date = DateFormat(DateAdd("d", +1, new_date), "m/d/yyyy")>
<td align="right" valign="top">#new_date#</td>
</cfloop>
<td align="right" valign="top">Total</td></cfoutput>
</tr>


<cfloop index="intSalesID" list="#sales_ids#" delimiters=",">
<cfset total_orders = 0>
<cfset all_order_count = 0>

<CFQUERY datasource="#request.dsn#" NAME="get_intSales">	
SELECT fname, lname from First_Admin
where ID = '#intSalesID#'
</cfquery>
<cfset sales_person = get_intSales.fname & " " & get_intSales.lname>

<cfoutput>
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>


<cfif all_order_count eq 0>
<tr bgcolor="##FFFFCC">
<cfelse>
<tr bgcolor="#bgcolor#">
</cfif>

<td align="left" valign="top">#UCase(sales_person)#</td>
<cfset new_date = DateFormat(start_date, "m/d/yyyy")>
<CFQUERY datasource="#request.dsn#" NAME="orders">	
SELECT t.comp_id, t.a_insert_date, c.intSales
from title t, companies c
Where a_insert_date = #CreateODBCDate(new_date)#
and c.ID = t.comp_id
and c.IntSales = #intSalesID#
<cfif session.role_id eq 34 or session.ft_user_id eq 450>
and c.streamline_client <> 1
</cfif>
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="proporders">	
SELECT p.comp_id, p.a_insert_date, c.intSales
from Property p, companies c
Where a_insert_date = #CreateODBCDate(new_date)#
and c.ID = p.comp_id
and c.IntSales = #intSalesID#
<cfif session.role_id eq 34 or session.ft_user_id eq 450>
and c.streamline_client <> 1
</cfif>
</cfquery>
<cfset total_orders = orders.recordcount + proporders.recordcount>
<cfset all_order_count = all_order_count + total_orders>
<td align="right" valign="top">#total_orders#</td>
<cfloop condition="new_date neq end_date">


<cfset new_date = DateFormat(DateAdd("d", +1, new_date), "m/d/yyyy")>
<CFQUERY datasource="#request.dsn#" NAME="orders">	
SELECT t.comp_id, t.a_insert_date, c.intSales
from title t, companies c
Where a_insert_date = #CreateODBCDate(new_date)#
and c.ID = t.comp_id
and c.IntSales = #intSalesID#
<cfif session.role_id eq 34 or session.ft_user_id eq 450>
and c.streamline_client <> 1
</cfif>
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="proporders">	
SELECT p.comp_id, p.a_insert_date, c.intSales
from Property p, companies c
Where a_insert_date = #CreateODBCDate(new_date)#
and c.ID = p.comp_id
and c.IntSales = #intSalesID#
<cfif session.role_id eq 34 or session.ft_user_id eq 450>
and c.streamline_client <> 1
</cfif>
</cfquery>
<cfset total_orders = orders.recordcount + proporders.recordcount>
<cfset all_order_count = all_order_count + total_orders>
<td align="right" valign="top">#total_orders#</td>
</cfloop>
<td align="right" valign="top">#all_order_count#</td>
</tr>


</cfoutput>
</cfloop>
</table>
</font>
<!--- end Orders by Sales Person over 7 Days--->
<br><br>
<CFFLUSH>


<!---
<!--- this code finds all companies who have NOT placed an order within the last 30 days --->
<CFQUERY datasource="#request.dsn#" NAME="get_companies">
SELECT    t.comp_id, c.ID, c.Company, t.a_insert_date, c.a_date, c.proposed_monthly_transactions, c.a_status, t.order_date, t.pname, t.pphone, t.appraisal_status, t.cancelled, m.ID as Team_id, m.Name AS Team_Name
FROM Title t, Companies c, Teams m
where c.ID = t.comp_id
and c.a_status = 1
and c.test_account = 0
and c.team_id = m.ID
order by c.Company, t.order_date DESC
</cfquery>



<cfset last_comp_id = 0000>
<cfset active_query = QueryNew("Company, Comp_ID, Proposed, Last_Order, Sign_up, Proc_Name, Proc_Phone, Team")>

<cfoutput query="get_companies">

<!--- <cfquery dbtype="query" name="total_cancelled_orders"> 
	SELECT cancelled
	FROM get_companies
	Where comp_id = #get_companies.id#
	and cancelled = 1
	</cfquery> --->
<!--- <cfquery datasource="#request.dsn#" name="total_closed_orders"> 
	SELECT appraisal_status
	FROM Title
	Where comp_id = '#get_companies.id#'
	and appraisal_status = 'Loan Closed'
	</cfquery> --->

<cfif NOT ListContains(all_comp_ids, get_companies.comp_id, ",") and get_companies.comp_id neq last_comp_id>
<cfset temp = QueryAddRow(active_query)>
<cfset temp = QuerySetCell(active_query, "Company", get_companies.Company)>
<cfset temp = QuerySetCell(active_query, "Comp_ID", get_companies.comp_id)>
<cfset temp = QuerySetCell(active_query, "Proposed", get_companies.proposed_monthly_transactions)>
<cfset temp = QuerySetCell(active_query, "Last_Order", get_companies.order_date)>
<cfif get_companies.a_date NEQ "NULL" and get_companies.a_date NEQ "">
<cfset temp = QuerySetCell(active_query, "Sign_up", CreateODBCDateTime(DateFormat(get_companies.a_date, "mm-dd-yyyy")))>
<cfelse>
<cfset temp = QuerySetCell(active_query, "Sign_up", CreateODBCDateTime(DateFormat("1/1/2000", "mm-dd-yyyy")))>
</cfif>
<cfif get_companies.pname EQ "NULL">
<cfset temp = QuerySetCell(active_query, "Proc_Name", "  ")>
<cfelse>
<cfset temp = QuerySetCell(active_query, "Proc_Name", get_companies.pname)>
</cfif>
<cfif get_companies.pphone EQ "NULL" or get_companies.pphone EQ "">
<cfset temp = QuerySetCell(active_query, "Proc_Phone", "  ")>
<cfelse>
<cfset temp = QuerySetCell(active_query, "Proc_Phone", get_companies.pphone)>
</cfif>
<cfset temp = QuerySetCell(active_query, "Team", get_companies.Team_Name)>
<!--- <cfset temp = QuerySetCell(active_query, "Total_Cancelled", total_cancelled_orders.RecordCount)>
<cfset temp = QuerySetCell(active_query, "Total_Closed", total_closed_orders.RecordCount)>
 ---></cfif>
<cfset last_comp_id = get_companies.comp_id>
</cfoutput>


<!--- <cfdump var="#active_query#">
<cfabort> --->


<cfquery dbtype="query" name="detail"> 
	SELECT *
	FROM active_query
<cfswitch expression="#url.sort_order_3#">
<cfcase value="Proposed">
    order by Proposed DESC
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

<cfcase value="Team">
    order by Team, Company
</cfcase>

<cfdefaultcase>
    order by Company
</cfdefaultcase>
</cfswitch>
</cfquery>

<br>
<br>

<cfset bgcolor = 'efefef'>
<br>
<br>
<strong>ACTIVE COMPANIES, NO ORDERS PREVIOUS 30 DAYS</strong>: <cfoutput>#thirty_days_ago# - #end_date#</cfoutput><br>
<font size="-2" face="arial">
<cfoutput>
<table width-"600">
<form action="blank_bloss2.cfm?sort_order_3=#url.sort_order_3#&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#&deactivate=yes" method="post" name="deactivation_form">
<tr bgcolor="##99CCFF">
<td align="left" valign="bottom" width="200"><strong><a href="blank_bloss2.cfm?sort_order_3=Company&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Company"><em>Company Name</em><cfelse>Company Name</cfif></a></strong></td>
<td align="right" valign="bottom" width="75"><strong><a href="blank_bloss2.cfm?sort_order_3=Proposed&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Proposed"><em>Proposed Monthly Transactions</em><cfelse>Proposed Monthly Transactions</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_3=Last_Order&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Last_Order"><em>Date of Last Order</em><cfelse>Date of Last Order</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_3=Sign_Up&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Sign_Up"><em>Company Sign-Up Date</em><cfelse>Company Sign-Up Date</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_3=Proc_Name&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Proc_Name"><em>Processor Name</em><cfelse>Processor Name</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_3=Proc_Phone&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Proc_Phone"><em>Processor Phone</em><cfelse>Processor Phone</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_3=Team&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Team"><em>Team</em><cfelse>Team</cfif></a></strong></td>

<!--- <td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_3=Total_Cancelled&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Total_Cancelled"><em>Total Cancelled</em><cfelse>Total Cancelled</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_3=Total_Closed&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Total_Closed"><em>Total Closed</em><cfelse>Total Closed</cfif></a></strong></td>
 --->

<td align="right" valign="bottom"><strong>&nbsp;</strong></td>
</tr>
</cfoutput>
<cfoutput query="detail">
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
<tr bgcolor="#bgcolor#">
<td align="left" valign="top" width="200"><A href="client_modify_display.cfm?UID=#url.uid#&al=1&modify_client_id=#detail.comp_id#">#detail.Company#</td>
<td align="center" valign="top" width="75">#detail.Proposed#</td>
<td align="center" valign="top">#DateFormat(detail.Last_order, "m/d/yyyy")#</td>
<td align="center" valign="top">#DateFormat(detail.Sign_Up, "m/d/yyyy")#</td>
<td align="center" valign="top">#detail.Proc_Name#</td>
<td align="center" valign="top">#detail.Proc_Phone#</td>
<td align="center" valign="top">#detail.Team#</td>
<!--- <td align="center" valign="top">#detail.Total_Cancelled#</td>
<td align="center" valign="top">#detail.Total_Closed#</td>
 ---><td align="center" valign="top"><input type="checkbox" name="deactivate_me" id="deactivate_me" value="#detail.comp_id#"></td>
</tr>
</cfoutput>
</table>
</font>
<!--- END this code finds all companies who have NOT placed an order within the last 30 days ---><br>



<!--- this code finds all companies who have NEVER placed an order, and their sign-up date is more than 30 days ago --->
<CFQUERY datasource="#request.dsn#" NAME="get_companies">
SELECT     c.ID, c.company, c.a_date, c.proposed_monthly_transactions, c.a_status, c.email, c.sign_up_date, c.last_order_date, m.ID as Team_ID, m.Name as Team_Name
FROM         Companies c, Teams m
WHERE     (c.a_status = 1) AND (c.last_order_date IS NULL) AND (c.sign_up_date <= '#thirty_days_ago#')
and c.team_id = m.ID
ORDER BY company
</cfquery>


<cfset last_comp_id = 0000>
<cfset active_query = QueryNew("Company, Comp_ID, Proposed, Last_Order, Sign_up, Team")>

<cfoutput query="get_companies">
<cfif NOT ListContains(all_comp_ids, get_companies.id, ",") and get_companies.id neq last_comp_id>
<cfset temp = QueryAddRow(active_query)>
<cfset temp = QuerySetCell(active_query, "Company", get_companies.Company)>
<cfset temp = QuerySetCell(active_query, "Comp_ID", get_companies.id)>
<cfset temp = QuerySetCell(active_query, "Proposed", get_companies.proposed_monthly_transactions)>
<cfset temp = QuerySetCell(active_query, "Last_Order", "No orders")>
<cfif get_companies.sign_up_date NEQ "NULL" and get_companies.sign_up_date NEQ "">
<cfset temp = QuerySetCell(active_query, "Sign_up", CreateODBCDateTime(DateFormat(get_companies.sign_up_date, "mm-dd-yyyy")))>
<cfelse>
<cfset temp = QuerySetCell(active_query, "Sign_up", "")>
<cfset temp = QuerySetCell(active_query, "Team", get_companies.Team_Name)>
</cfif>
</cfif>
<cfset last_comp_id = get_companies.id>
</cfoutput>

<cfquery dbtype="query" name="detail"> 
	SELECT *
	FROM active_query
<cfswitch expression="#url.sort_order_4#">
<cfcase value="Proposed">
    order by Proposed DESC
</cfcase>
<cfcase value="Last_Order">
    order by Last_Order DESC
</cfcase>
<cfcase value="Sign_Up">
    order by Sign_Up DESC
</cfcase>
<cfcase value="Team">
    order by Team, Company
</cfcase>
<cfdefaultcase>
    order by Company
</cfdefaultcase>
</cfswitch>
</cfquery>


<cfset bgcolor = 'efefef'>
<br>
<br>
<strong>ACTIVE COMPANIES, NO ORDERS, SIGNED-UP MORE THAN 30 DAYS</strong>: <cfoutput>#thirty_days_ago# - #end_date#</cfoutput><br>
<font size="-2" face="arial">
<cfoutput>
<table width-"600">
<tr bgcolor="##99CCFF">
<td align="left" valign="bottom" width="200"><strong><a href="blank_bloss2.cfm?sort_order_4=Company&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#"><cfif sort_order_4 eq "Company"><em>Company Name</em><cfelse>Company Name</cfif></a></strong></td>
<td align="right" valign="bottom" width="75"><strong><a href="blank_bloss2.cfm?sort_order_4=Proposed&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#"><cfif sort_order_4 eq "Proposed"><em>Proposed Monthly Transactions</em><cfelse>Proposed Monthly Transactions</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_4=Last_Order&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#"><cfif sort_order_4 eq "Last_Order"><em>Date of Last Order</em><cfelse>Date of Last Order</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_4=Sign_Up&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#"><cfif sort_order_4 eq "Sign_Up"><em>Company Sign-Up Date</em><cfelse>Company Sign-Up Date</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_4=Team&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#"><cfif sort_order_4 eq "Team"><em>Team</em><cfelse>Team</cfif></a></strong></td>


<td align="right" valign="bottom"><strong>&nbsp;</strong></td>
</tr>
</cfoutput>
<cfoutput query="detail">
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
<tr bgcolor="#bgcolor#">
<td align="left" valign="top" width="200"><A href="client_modify_display.cfm?UID=#url.uid#&al=1&modify_client_id=#detail.comp_id#">#detail.Company#</td>
<td align="center" valign="top" width="75">#detail.Proposed#</td>
<td align="center" valign="top">#detail.Last_order#</td>
<td align="center" valign="top">#DateFormat(detail.Sign_Up, "m/d/yyyy")#</td>
<td align="center" valign="top">#detail.Team#</td>
<td align="center" valign="top"><input type="checkbox" name="deactivate_me2" id="deactivate_me2" value="#detail.comp_id#"></td>
</tr>
</cfoutput>
</table>
</font>

<br><br>
<br>








<!--- this code finds all companies who have NEVER placed an order, and their sign-up date is more than 30 days ago --->
<CFQUERY datasource="#request.dsn#" NAME="get_companies">
SELECT     c.ID, c.company, c.contact_fname, c.contact_lname, c.phone, c.a_status, c.email, c.sign_up_date, c.last_order_date, c.intSales, f.fname as sales_fname, f.lname as sales_lname, m.ID as Team_ID, m.Name AS Team_Name
FROM         Companies c, First_admin f, Teams m
WHERE     (c.a_status = 1) AND (c.last_order_date IS NULL)
and f.ID = c.intSales
and c.team_id = m.ID
ORDER BY company
</cfquery>


<cfset last_comp_id = 0000>
<cfset active_query = QueryNew("Company, Comp_ID, Contact, Phone, Email, Sales_Rep, Team")>

<cfoutput query="get_companies">
<cfif NOT ListContains(all_comp_ids, get_companies.id, ",") and get_companies.id neq last_comp_id>
<cfset temp = QueryAddRow(active_query)>
<cfset temp = QuerySetCell(active_query, "Company", get_companies.Company)>
<cfset temp = QuerySetCell(active_query, "Comp_ID", get_companies.id)>
<cfset temp = QuerySetCell(active_query, "Contact", "#get_companies.contact_fname# #get_companies.contact_lname#")>
<cfset temp = QuerySetCell(active_query, "Phone", get_companies.phone)>
<cfset temp = QuerySetCell(active_query, "Email", get_companies.email)>
<cfset temp = QuerySetCell(active_query, "Sales_Rep", "#get_companies.sales_fname# #get_companies.sales_lname#")>
<cfset temp = QuerySetCell(active_query, "Team", get_companies.Team_Name)>
</cfif>
<cfset last_comp_id = get_companies.id>
</cfoutput>

<cfquery dbtype="query" name="detail"> 
	SELECT *
	FROM active_query
<cfswitch expression="#url.sort_order_5#">
<cfcase value="Sales_Rep">
    order by Sales_Rep DESC
</cfcase>
<cfcase value="Contact">
    order by Contact DESC
</cfcase>
<cfcase value="Phone">
    order by Phone DESC
</cfcase>
<cfcase value="Email">
    order by Email DESC
</cfcase>

<cfcase value="Team">
    order by Team, Company
</cfcase>

<cfdefaultcase>
    order by Company
</cfdefaultcase>
</cfswitch>
</cfquery>


<cfset bgcolor = 'efefef'>
<br>
<br>
<strong>ACTIVE COMPANIES, NO ORDERS</strong>:<br>
<font size="-2" face="arial">
<cfoutput>
<table width-"600">
<tr bgcolor="##99CCFF">
<td align="left" valign="bottom" width="200"><strong><a href="blank_bloss2.cfm?sort_order_5=Company&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_5 eq "Company"><em>Company Name</em><cfelse>Company Name</cfif></a></strong></td>
<td align="right" valign="bottom" width="75"><strong><a href="blank_bloss2.cfm?sort_order_5=Contact&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_5 eq "Contact"><em>Contact</em><cfelse>Contact</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_5=Phone&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_5 eq "Phone"><em>Phone</em><cfelse>Phone</cfif></a></strong></td>
<td align="right" valign="bottom" width="200"><strong><a href="blank_bloss2.cfm?sort_order_5=Email&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_5 eq "Email"><em>Email</em><cfelse>Email</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_5=Sales_Rep&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#"&sort_order_4=#url.sort_order_4#><cfif sort_order_5 eq "Sales_Rep"><em>Sales Rep</em><cfelse>Sales Rep</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="blank_bloss2.cfm?sort_order_5=Team&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#"&sort_order_4=#url.sort_order_4#><cfif sort_order_5 eq "Team"><em>Team</em><cfelse>Team</cfif></a></strong></td>


<td align="right" valign="bottom"><strong>&nbsp;</strong></td>
</tr>
</cfoutput>
<cfoutput query="detail">
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
<tr bgcolor="#bgcolor#">
<td align="left" valign="top" width="200"><A href="client_modify_display.cfm?UID=#url.uid#&al=1&modify_client_id=#detail.comp_id#">#detail.Company#</td>
<td align="center" valign="top" width="75">#detail.Contact#</td>
<td align="center" valign="top">#detail.Phone#</td>
<td align="center" valign="top">#detail.Email#</td>
<td align="center" valign="top">#detail.Sales_Rep#</td>
<td align="center" valign="top">#detail.Team#</td>
<td align="center" valign="top"><input type="checkbox" name="deactivate_me3" id="deactivate_me3" value="#detail.comp_id#"></td>
</tr>
</cfoutput>
<tr><td colspan="7" align="right"><input name="submit" type="submit" value="Deactivate Selected Accounts"></td></tr>
</form>
</table>
</font>
</cfif>
<!--- <cfif get_user.streamline_employee eq 'True'>
<a href="streamline_lp_report.cfm?uid=<cfoutput>#url.uid#</cfoutput>" target="new">Streamline Loan Processor Report</a>
</cfif>
 --->
<!---  <cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 90>
<a href="Contract_Assignment_and_Sales_Report_Date.cfm?uid=<cfoutput>#url.uid#</cfoutput>" target="new">Contract Assignment and Sales Report</a>
</cfif>
 ---><br><br>
<br>
<!--- <cfinclude template="team_popup.cfm"> --->
--->

</BODY>
</HTML>
