<style>
td {font-size: 10px;}
</style>



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

<cfset sixty_days_ago = DateFormat(DateAdd("d", -60, today), "m/d/yyyy")>
<!--- end DATE VARIABLES --->

<cfparam name="url.sort_order_1" default="Company">
<cfparam name="url.sort_order_2" default="Company">
<cfparam name="url.sort_order_3" default="Company">
<cfparam name="url.sort_order_4" default="Company">
<cfparam name="url.deactivate" default="no">
<cfparam name="form.deactivate_me" default="">
<br>
<!--- PAM'S TEAMS STATISTICS TABLE --->

<CFQUERY datasource="#request.dsn#" NAME="get_comp_ids">
SELECT c.id, c.Company, c.a_date, c.proposed_monthly_transactions, c.team_id, t.Name
FROM Companies c, Teams t, title ti
where
ti.order_date >= '#sixty_days_ago#'
and ti.order_date <= '#today#'
and c.a_status = 1
and c.test_account = 0
and t.id = c.team_id
and t.id <> 11
and ti.comp_id = c.ID
order by c.ID DESC
</cfquery>



<cfset all_comp_ids = "">
<cfloop query="get_comp_ids">
<cfif Not ListFInd(all_comp_ids, ID, ",")>
<cfset all_comp_ids = ListAppend(all_comp_ids, ID, ",")>
</cfif>
</cfloop>

<cfoutput>

<cfset query_14_days = QueryNew("Company, Company_ID, Prev_Orders, Orders, Stat, Last_Order, Proc_name, Proc_phone, Total_Orders, Total_Cancelled, Total_Closed, Team_Name")>
<cfloop index="this_comp_id" list="#all_comp_ids#" delimiters=",">
<CFQUERY datasource="#request.dsn#" NAME="get_orders_by_comp">
SELECT c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status, team.Name as TEAM_Name
FROM Title t, Companies c, Teams team
where c.ID = '#this_Comp_id#'
<!--- and t.order_date >= '#two_weeks_ago#'
and t.order_date <= '#today#' --->
and c.ID = t.comp_id
and team.ID = c.team_id
order by t.order_date DESC
</cfquery>

<cfif get_orders_by_comp.recordcount>
<cfquery dbtype="query" name="orders_last_two_weeks"> 
	SELECT *
	FROM get_orders_by_comp
	Where order_date >= '#two_weeks_ago#'
    AND order_date <= '#today#'
	</cfquery>


<cfset previous_start = DateFormat(DateAdd("d", -15, two_weeks_ago), "m/d/yyyy")>
<cfset previous_end = DateFormat(DateAdd("d", -1, two_weeks_ago), "m/d/yyyy")>
<cfquery dbtype="query" name="orders_previous_two_weeks"> 
	SELECT *
	FROM get_orders_by_comp
	Where order_date >= '#previous_start#'
    AND order_date <= '#previous_end#'
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
	and appraisal_status = 'Loan Closed'
	</cfquery>

<cfif get_orders_by_comp.order_date GT sixty_days_ago>
<cfset temp = QueryAddRow(query_14_days)>
<cfset temp = QuerySetCell(query_14_days, "Company", get_orders_by_comp.Company)>
<cfset temp = QuerySetCell(query_14_days, "Company_ID", this_comp_id)>
<!--- <cfset temp = QuerySetCell(query_14_days, "Proposed", get_orders_by_comp.proposed_monthly_transactions)>
 --->
<cfset two_week_orders = orders_last_two_weeks.RecordCount>
<cfset prev_two_week_orders = orders_previous_two_weeks.RecordCount>
<cfif (orders_last_two_weeks.RecordCount and orders_previous_two_weeks.RecordCount) and (orders_last_two_weeks.RecordCount neq orders_previous_two_weeks.RecordCount)>
<cfif orders_last_two_weeks.RecordCount LT orders_previous_two_weeks.RecordCount>
<cfset x = orders_previous_two_weeks.RecordCount - orders_last_two_weeks.RecordCount>
<cfset percentage = (x / orders_previous_two_weeks.RecordCount) * 100>
<cfset stat = " - " & Round(percentage) & "%">
<cfelse>
<cfset x = orders_last_two_weeks.RecordCount - orders_previous_two_weeks.RecordCount>
<cfset percentage = (x / orders_previous_two_weeks.RecordCount) * 100>
<cfset stat = " + " & Round(percentage) & "%">
</cfif>
<cfelse>
<cfset stat = "--">
</cfif>


<cfset temp = QuerySetCell(query_14_days, "Prev_Orders", orders_previous_two_weeks.RecordCount)>
<cfset temp = QuerySetCell(query_14_days, "Orders", orders_last_two_weeks.RecordCount)>
<cfset temp = QuerySetCell(query_14_days, "Stat", stat)>
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
<cfset temp = QuerySetCell(query_14_days, "Team_Name", get_orders_by_comp.Team_Name)>
</cfif>
<cfelse>
<cfquery dbtype="query" name="get_info"> 
	SELECT *
	FROM get_comp_ids
	Where ID = #this_comp_id#
	</cfquery>

<cfset temp = QueryAddRow(query_14_days)>
<cfset temp = QuerySetCell(query_14_days, "Company", get_info.Company)>
<cfset temp = QuerySetCell(query_14_days, "Company_ID", get_info.ID)>
<cfset temp = QuerySetCell(query_14_days, "Prev_Orders", 0)>
<cfset temp = QuerySetCell(query_14_days, "Orders", 0)>
<cfset temp = QuerySetCell(query_14_days, "Stat", "")>
<cfset temp = QuerySetCell(query_14_days, "Last_Order", "")>
<cfset temp = QuerySetCell(query_14_days, "Proc_Name", "")>
<cfset temp = QuerySetCell(query_14_days, "Proc_Phone", "")>
<cfset temp = QuerySetCell(query_14_days, "Total_Orders", 0)>
<cfset temp = QuerySetCell(query_14_days, "Total_Cancelled", 0)>
<cfset temp = QuerySetCell(query_14_days, "Total_Closed", 0)>
<cfset temp = QuerySetCell(query_14_days, "Team_Name", get_info.name)>

</cfif>




</cfloop>
</cfoutput>
<cfquery dbtype="query" name="detail"> 
	SELECT *
	FROM query_14_days
	order by Team_Name, 
<cfswitch expression="#url.sort_order_1#">
<cfcase value="Total_Orders">
    Total_Orders DESC
</cfcase>
<cfcase value="Prev_Orders">
    Prev_Orders DESC
</cfcase>
<cfcase value="Orders">
    Orders DESC
</cfcase>
<cfcase value="Stat">
    Stat DESC
</cfcase>
<cfcase value="Last_Order">
    Last_Order DESC
</cfcase>
<cfcase value="Sign_Up">
    Sign_Up DESC
</cfcase>
<cfcase value="Proc_Name">
    Proc_Name DESC
</cfcase>
<cfcase value="Proc_Phone">
  Proc_Phone DESC
</cfcase>
<cfcase value="Total_Cancelled">
   Total_Cancelled DESC
</cfcase>
<cfcase value="Total_Closed">
  Total_Closed DESC
</cfcase>
<cfdefaultcase>
   Company
</cfdefaultcase>
</cfswitch>
</cfquery>
<cfoutput>
<cfset bgcolor = 'efefef'>
<font size="+2"><strong>TEAM STATS</strong>: Companies who have ordered in the last 60 days</font><br>
<font size="-2" face="arial">
<table width-"600">
<cfset Current_Team_Name = "XXXXXX">
<cfloop query="detail">
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
<cfif Team_Name neq Current_Team_Name>
<tr bgcolor="##ffffff">
<cfquery datasource="#request.dsn#" name="team_info"> 
	SELECT t.name, f.fname, f.lname
	FROM Teams t, First_admin f
	Where t.NAME = '#TEAM_NAME#'
	and f.ID = t.Leader_id
</cfquery>
<td align="left" valign="top" colspan="10"><font size="+0"><strong>#TEAM_NAME#</strong> (#team_info.fname# #team_info.lname#)</font></td>
</tr>
<tr bgcolor="##99CCFF">
<td align="left" valign="bottom" width="200"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_1=Company&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Company"><em>Company Name</em><cfelse>Company Name</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_1=Prev_Orders&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Orders"><em>Orders in Previous 14 Days</em><cfelse>Orders in Previous 14 Days</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_1=Orders&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Orders"><em>Orders in Last 14 Days</em><cfelse>Orders in Last 14 Days</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_1=Stat&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Stat"><em>Index</em><cfelse>Index</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_1=Last_order&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Last_Order"><em>Date of Last Order</em><cfelse>Date of Last Order</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_1=Proc_Name&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Proc_Name"><em>Processor Name</em><cfelse>Processor Name</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_1=Proc_Phone&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Proc_Phone"><em>Processor Phone</em><cfelse>Processor Phone</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_1=Total_Orders&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Orders"><em>Total Orders</em><cfelse>Total Orders</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_1=Total_Cancelled&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Cancelled"><em>Total Cancelled</em><cfelse>Total Cancelled</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_1=Total_Closed&UID=#url.uid#&al=1&sort_order_2=#url.sort_order_2#&sort_order_3=#url.sort_order_3#&sort_order_4=#url.sort_order_4#"><cfif sort_order_1 eq "Total_Closed"><em>Total Closed</em><cfelse>Total Closed</cfif></a></strong></td>
</tr>
<cfset Current_Team_Name = Team_Name>
</cfif>
<tr bgcolor="#bgcolor#">
<td align="left" valign="top" width="200"><A href="client_modify_display.cfm?UID=#url.uid#&al=1&modify_client_id=#company_id#">#Company#</A></td>
<td align="center" valign="top">#Prev_Orders#</td>
<td align="center" valign="top">#Orders#</td>
<td align="center" valign="top">#Stat#</td>
<td align="center" valign="top">#DateFormat(Last_Order, "m/d/yyyy")#</td>
<td align="center" valign="top">#Proc_Name#</td>
<td align="center" valign="top">#Proc_Phone#</td>
<td align="center" valign="top">#Total_Orders#</td>
<td align="center" valign="top">#Total_Cancelled#</td>
<td align="center" valign="top">#Total_Closed#</td>
</tr>
</cfloop>
</table>
</font>
</cfoutput>
<!--- END PAM'S TEAMS STATISTICS REPORT --->


