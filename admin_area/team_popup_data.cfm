


<cfparam name="url.uid" default="0">
<cfparam name="url.sort_order_2" default="Company">
<cfparam name="session.all_team_ids" default="12,13">




<!--- if companies have been selected for deactivation, and the form is submitted, deactivate the selected accounts --->





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<style>
td {font-size: 10px;}
</style>
</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="Black" LINK="Blue" VLINK="Blue" ALINK="Blue" BACKGROUND="./" TopMargin=10 LeftMargin=10 MarginHeight=10 MarginWidth=10>
<!--- THIS CODE SETS UP ALL THE DATE VARIABLES WE'LL NEED --->

<cfset today = DateFormat(Now(), "m/d/yyyy")>
<cfparam name="form.today_day" default="#DatePart('d', today)#">
<cfparam name="form.today_month" default="#DatePart('m', today)#">
<cfparam name="form.today_year" default="#DatePart('yyyy', today)#">

<cfset thirty_days_ago = DateFormat(DateAdd("d", -30, today), "m/d/yyyy")>
<cfparam name="form.tda_day" default="#DatePart('d', thirty_days_ago)#">
<cfparam name="form.tda_month" default="#DatePart('m', thirty_days_ago)#">
<cfparam name="form.tda_year" default="#DatePart('yyyy', thirty_days_ago)#">



<cfset six_months_ago = DateFormat(DateAdd("d", -180, today), "m/d/yyyy")>
<!--- end DATE VARIABLES --->


<cfset count = 0>
<cfloop index="this_team_id" list="#session.all_team_ids#" delimiters=",">
<cfset count = count + 1>
<cfif cgi.REMOTE_ADDR eq '98.233.235.105'>
<cfoutput>#count#<Br></cfoutput>
</cfif>

<!--- this code finds all companies who have placed an order within the last 30 Days --->
<CFQUERY datasource="#request.dsn#" NAME="get_comp_ids">
SELECT c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, c.proposed_monthly_transactions, t.order_date, m.name AS Team_NAME, t.cancelled
FROM Title t, Companies c, Teams m
where
t.order_date >= '#thirty_days_ago#'
and t.order_date <= '#today#'
and (c.test_account = 0 or c.test_account = 'False')
and c.Team_id = #this_team_id#
and m.id = c.Team_id
and t.comp_id = c.id
order by c.Company, t.order_date DESC
</cfquery>
<cfset all_comp_ids = "">
<cfloop query="get_comp_ids">
<cfif Not ListContains(all_comp_ids, ID, ",")>
<cfset all_comp_ids = ListAppend(all_comp_ids, ID, ",")>
</cfif>
</cfloop>


<cfif Len(all_comp_ids)>
<CFQUERY datasource="#request.dsn#" NAME="get_comp_ids_no_orders">
SELECT c.id, c.Company, c.a_date, c.proposed_monthly_transactions, m.name AS Team_NAME
FROM Companies c, Teams m
where
c.ID NOT IN (#all_comp_ids#)
and c.test_account = 0
and c.Team_id = #this_team_id#
and m.id = #this_team_id#
order by c.Company DESC
</cfquery>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="get_comp_ids_no_orders">
SELECT c.id, c.Company, c.a_date, c.proposed_monthly_transactions, m.name AS Team_NAME
FROM Companies c, Teams m
where
c.test_account = 0
and c.Team_id = #this_team_id#
and m.id = #this_team_id#
order by c.Company DESC
</cfquery>
</cfif>

<cfset all_comp_ids_no_orders = "">
<cfloop query="get_comp_ids_no_orders">
<cfif Not ListContains(all_comp_ids_no_orders, ID, ",")>
<cfset all_comp_ids_no_orders = ListAppend(all_comp_ids_no_orders, ID, ",")>
</cfif>
</cfloop>


<cfoutput>
<cfset query_thirty_days = QueryNew("Company, Company_ID, Orders, Proc_Name, Proc_Phone, Total_Closed, Total_Closed_30, Total_Cancelled, Total_orders, Comp_Date")>
<cfloop index="this_comp_id" list="#all_comp_ids#" delimiters=",">
<CFQUERY datasource="#request.dsn#" NAME="get_orders_by_comp">
SELECT c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status, m.name AS Team_Name, m.ID AS Team_ID, t.cancelled
FROM Title t, Companies c, Teams m
where c.ID = '#this_Comp_id#'
and t.order_date >= '#thirty_days_ago#'
and t.order_date <= '#today#'
and c.ID = t.comp_id
and c.Team_ID = m.ID
order by t.order_date DESC
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_all_orders_by_comp">
SELECT c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status, t.cancelled
FROM Title t, Companies c
where c.ID = '#this_Comp_id#'
and c.ID = t.comp_id
order by t.order_date DESC
</cfquery>
<cfquery datasource="#request.dsn#" name="total_closed_orders"> 
	SELECT appraisal_status
	FROM Title
	Where comp_id = '#this_Comp_id#'
	and appraisal_status = 'Loan Closed'
	</cfquery>
<cfquery datasource="#request.dsn#" name="total_cancelled_orders"> 
	SELECT appraisal_status
	FROM Title
	Where comp_id = '#this_Comp_id#'
	and cancelled = 1
	</cfquery>
<cfquery datasource="#request.dsn#" name="total_closed_orders_30"> 
	SELECT cl_dateandtime
	FROM eventlist
	Where comp_id = '#this_Comp_id#'
	and cl_dateandtime >= '#thirty_days_ago#'
    and cl_dateandtime <= '#today#'
	</cfquery>
	
<cfset temp = QueryAddRow(query_thirty_days)>
<cfset temp = QuerySetCell(query_thirty_days, "Company", get_orders_by_comp.Company)>
<cfset temp = QuerySetCell(query_thirty_days, "Company_ID", this_comp_id)>
<cfset temp = QuerySetCell(query_thirty_days, "Orders", get_orders_by_comp.RecordCount)>
<cfset temp = QuerySetCell(query_thirty_days, "Total_Orders", get_all_orders_by_comp.RecordCount)>
<cfset temp = QuerySetCell(query_thirty_days, "Proc_Name", get_orders_by_comp.pname)>
<cfset temp = QuerySetCell(query_thirty_days, "Proc_Phone", get_orders_by_comp.pphone)>
<cfset temp = QuerySetCell(query_thirty_days, "Total_Closed", total_closed_orders.RecordCount)>
<cfset temp = QuerySetCell(query_thirty_days, "Total_Closed_30", total_closed_orders_30.RecordCount)>
<cfset temp = QuerySetCell(query_thirty_days, "Total_Cancelled", total_cancelled_orders.RecordCount)>
<cfset temp = QuerySetCell(query_thirty_days, "Comp_Date", get_orders_by_comp.a_date)>
<cfset percentage = (total_closed_orders.RecordCount) / get_all_orders_by_comp.RecordCount * 100>
</cfloop>
</cfoutput>



<!--- non ordering companies --->
<cfoutput>
<cfset query_thirty_days_no_orders = QueryNew("Company, Company_ID, Orders, Proc_Name, Proc_Phone, Total_Closed, Total_Closed_30, Total_Cancelled, Total_orders, Comp_Date")>
<cfloop index="this_comp_id" list="#all_comp_ids_no_orders#" delimiters=",">
<CFQUERY datasource="#request.dsn#" NAME="get_all_orders_by_comp">
SELECT c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status, t.cancelled
FROM Title t, Companies c
where c.ID = '#this_Comp_id#'
and c.ID = t.comp_id
order by t.order_date DESC
</cfquery>
<cfquery datasource="#request.dsn#" name="comp_info"> 
	SELECT company, a_date
	FROM companies
	Where id = '#this_Comp_id#'
	</cfquery>
<cfquery datasource="#request.dsn#" name="total_closed_orders"> 
	SELECT appraisal_status
	FROM Title
	Where comp_id = '#this_Comp_id#'
	and appraisal_status = 'Loan Closed'
	</cfquery>
<cfquery datasource="#request.dsn#" name="total_cancelled_orders"> 
	SELECT appraisal_status
	FROM Title
	Where comp_id = '#this_Comp_id#'
	and cancelled = 1
	</cfquery>
<cfquery datasource="#request.dsn#" name="total_closed_orders_30"> 
	SELECT cl_dateandtime
	FROM eventlist
	Where comp_id = '#this_Comp_id#'
	and cl_dateandtime >= '#thirty_days_ago#'
    and cl_dateandtime <= '#today#'
	</cfquery>
	
<cfset temp = QueryAddRow(query_thirty_days_no_orders)>
<cfset temp = QuerySetCell(query_thirty_days_no_orders, "Company", comp_info.Company)>
<cfset temp = QuerySetCell(query_thirty_days_no_orders, "Company_ID", this_comp_id)>
<cfset temp = QuerySetCell(query_thirty_days_no_orders, "Orders", 0)>
<cfset temp = QuerySetCell(query_thirty_days_no_orders, "Total_Orders", get_all_orders_by_comp.RecordCount)>
<cfset temp = QuerySetCell(query_thirty_days_no_orders, "Proc_Name", get_all_orders_by_comp.pname)>
<cfset temp = QuerySetCell(query_thirty_days_no_orders, "Proc_Phone", get_all_orders_by_comp.pphone)>
<cfset temp = QuerySetCell(query_thirty_days_no_orders, "Total_Closed", total_closed_orders.RecordCount)>
<cfset temp = QuerySetCell(query_thirty_days_no_orders, "Total_Closed_30", total_closed_orders_30.RecordCount)>
<cfset temp = QuerySetCell(query_thirty_days_no_orders, "Total_Cancelled", total_cancelled_orders.RecordCount)>
<cfset temp = QuerySetCell(query_thirty_days_no_orders, "Comp_Date", comp_info.a_date)>
<cfif get_all_orders_by_comp.RecordCount gte 1>
<cfset percentage = (total_closed_orders.RecordCount) / get_all_orders_by_comp.RecordCount * 100>
<cfelse>
<cfset percentage = 0>
</cfif>
</cfloop>
</cfoutput>
<!--- end non ordering companies --->

<!--- <cfdump var="#query_thirty_days#">
<cfabort> --->

<cfquery dbtype="query" name="detail"> 
	SELECT *
	FROM query_thirty_days
<cfswitch expression="#url.sort_order_2#">
<cfcase value="Orders">
    order by Orders DESC
</cfcase>
<cfcase value="Proc_Name">
    order by Proc_Name DESC
</cfcase>
<cfcase value="Proc_Phone">
    order by Proc_Phone DESC
</cfcase>
<cfcase value="Total_Closed">
    order by Total_Closed DESC
</cfcase>
<cfcase value="Total_Closed_30">
    order by Total_Closed_30 DESC
</cfcase>
<cfcase value="Total_Orders">
    order by Total_Orders DESC
</cfcase>
<cfcase value="Total_Cancelled">
    order by Total_Cancelled DESC
</cfcase>
<cfdefaultcase>
    order by Company
</cfdefaultcase>
</cfswitch>
</cfquery>



<!--- non-ordering companies --->
<cfquery dbtype="query" name="detail_no_orders"> 
	SELECT *
	FROM query_thirty_days_no_orders
<cfswitch expression="#url.sort_order_2#">
<cfcase value="Orders">
    order by Orders DESC
</cfcase>
<cfcase value="Proc_Name">
    order by Proc_Name DESC
</cfcase>
<cfcase value="Proc_Phone">
    order by Proc_Phone DESC
</cfcase>
<cfcase value="Total_Closed">
    order by Total_Closed DESC
</cfcase>
<cfcase value="Total_Closed_30">
    order by Total_Closed_30 DESC
</cfcase>
<cfcase value="Total_Orders">
    order by Total_Orders DESC
</cfcase>
<cfcase value="Total_Cancelled">
    order by Total_Cancelled DESC
</cfcase>
<cfdefaultcase>
    order by Company
</cfdefaultcase>
</cfswitch>
</cfquery>
<!--- end non-ordering companies --->



<cfif get_comp_ids.recordcount or get_comp_ids_no_orders.recordcount>
<cfoutput>
<cfset bgcolor = 'efefef'>
<strong>TEAM STATS</strong>: #get_comp_ids.Team_Name#<br>
<font size="-2" face="arial">
<table width-"600">
<tr bgcolor="##99CCFF">
<td align="left" valign="bottom" width="200"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Company&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Company"><em>Company Name</em><cfelse>Company Name</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Orders&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Orders"><em>Orders in Last 30 Days</em><cfelse>Orders in Last 30 Days</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Total_Orders&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Total_Orders"><em>Total Orders</em><cfelse>Total Orders</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Total_Closed&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Total_Closed_30"><em>Total Closed Last 30 Days</em><cfelse>Total Closed Last 30 Days</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Total_Closed&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Total_Closed"><em>Total Closed</em><cfelse>Total Closed</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Total_Cancelled&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Total_Cancelled"><em>Total Cancelled</em><cfelse>Total Cancelled</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Proc_Name&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Proc_Name"><em>Processor Name</em><cfelse>Processor Name</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Proc_Phone&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Proc_Phone"><em>Processor Phone</em><cfelse>Processor Phone</cfif></a></strong></td>


</tr>

<cfloop query="detail">
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>

<tr bgcolor="#bgcolor#">
<td align="left" valign="top" width="200"><A href="client_modify_display.cfm?UID=#url.uid#&al=1&modify_client_id=#company_id#"><cfif Total_Orders lte 5 and DateDiff("d", comp_date, Now()) lt 180><font color="FF0000">#Company#</font><cfelse>#Company#</cfif></A></td>
<td align="center" valign="top">#Orders#</td>
<td align="center" valign="top">#Total_Orders#</td>
<td align="center" valign="top">#Total_Closed_30#</td>
<td align="center" valign="top">#Total_Closed#</td>
<td align="center" valign="top">#Total_Cancelled#</td>
<td align="left" valign="top">#Proc_Name#</td>
<td align="center" valign="top">#Proc_Phone#</td>

</tr>
</cfloop>
<cfif detail_no_orders.recordcount>
<tr><td colspan=8>Companies that Have not Ordered in the past 30-Days</td></tr>
</cfif>
<cfloop query="detail_no_orders">

<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
<tr bgcolor="#bgcolor#">
<td align="left" valign="top" width="200"><A href="client_modify_display.cfm?UID=#url.uid#&al=1&modify_client_id=#company_id#"><cfif Total_Orders lte 5 and DateDiff("d", comp_date, Now()) lt 180><font color="FF0000">#Company#</font><cfelse>#Company#</cfif></A></td>
<td align="center" valign="top">#Orders#</td>
<td align="center" valign="top">#Total_Orders#</td>
<td align="center" valign="top">#Total_Closed_30#</td>
<td align="center" valign="top">#Total_Closed#</td>
<td align="center" valign="top">#Total_Cancelled#</td>
<td align="left" valign="top">#Proc_Name#</td>
<td align="center" valign="top">#Proc_Phone#</td>

</tr>
</cfloop>

</table>
</font>
</cfoutput>
</cfif>
<br>
<br>
<br>
<cfflush>
</cfloop>
<!--- <cfdump var="#session#"> --->
<!--- END this code finds all companies who have placed an order within the last 30 days --->


