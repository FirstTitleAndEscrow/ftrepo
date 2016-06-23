


<cfparam name="url.uid" default="0">
<cfparam name="url.sort_order_2" default="Company">
<CFQUERY datasource="#request.dsn#" NAME="read_user">
	SELECT fname, lname 
	FROM First_Admin
	where ID = '#session.ft_user_id#'
</CFQUERY>




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


<br>
<br>

<!--- THIS CODE SETS UP ALL THE DATE VARIABLES WE'LL NEED --->

<cfset today = DateFormat(Now(), "m/d/yyyy")>
<cfparam name="form.today_day" default="#DatePart('d', today)#">
<cfparam name="form.today_month" default="#DatePart('m', today)#">
<cfparam name="form.today_year" default="#DatePart('yyyy', today)#">

<cfset thirty_days_ago = DateFormat(DateAdd("d", -30, today), "m/d/yyyy")>
<cfparam name="form.tda_day" default="#DatePart('d', thirty_days_ago)#">
<cfparam name="form.tda_month" default="#DatePart('m', thirty_days_ago)#">
<cfparam name="form.tda_year" default="#DatePart('yyyy', thirty_days_ago)#">
<!--- end DATE VARIABLES --->



<!--- this code finds all companies who have placed an order within the last 30 Days --->
<CFQUERY datasource="#request.dsn#" NAME="get_comp_ids">
SELECT c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, c.proposed_monthly_transactions, t.order_date
FROM Title t, Companies c
where
t.order_date >= '#thirty_days_ago#'
and t.order_date <= '#today#'
<cfif session.mi_employee eq 1>
and t.order_date > '7/15/2008'
<cfelseif session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1>
and t.order_date > '10/01/2010'
</cfif>
and c.ID = t.comp_id
and c.test_account = 0
 
<cfif session.mi_admin eq 1>
and (c.intSales in (select ID from first_admin where role_id = 24 and mi_employee = 'True')
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
<cfelseif session.mo_admin eq 1>
and (c.intSales in (select ID from first_admin where role_id = 24 and mo_employee = 'True')
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
<cfelseif session.mi_flushing_admin eq 1>
and (c.intSales in (select ID from first_admin where role_id = 24 and mi_flushing_employee = 'True')
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
<cfelseif session.va_admin eq 1>
and (c.intSales IN (select ID from First_admin where va_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
<cfelseif session.tx_admin eq 1>
and (c.intSales IN (select ID from First_admin where tx_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
<cfelseif session.ft_fairfax_admin eq 1>
and (c.intSales IN (select ID from First_admin where ft_fairfax_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
<cfelse>
and (c.intSales = '#session.ft_user_id#'
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
</cfif>
<cfif session.ft_user_id eq 311>
or c.intSales = 312</cfif>)
order by c.Company, t.order_date DESC
</cfquery>
<cfset all_comp_ids = "">
<cfloop query="get_comp_ids">
<cfif Not ListContains(all_comp_ids, ID, ",")>
<cfset all_comp_ids = ListAppend(all_comp_ids, ID, ",")>
</cfif>
</cfloop>
<cfoutput>
<cfset query_thirty_days = QueryNew("Company, Company_ID, Orders, Proc_Name, Proc_Phone, Total_Closed, Total_Closed_30, Total_orders")>
<cfloop index="this_comp_id" list="#all_comp_ids#" delimiters=",">
<CFQUERY datasource="#request.dsn#" NAME="get_orders_by_comp">
SELECT c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status
FROM Title t, Companies c
where c.ID = '#this_Comp_id#'
and t.order_date >= '#thirty_days_ago#'
<cfif session.mi_employee eq 1>
and t.order_date > '7/15/2008'
<cfelseif session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1>
and t.order_date > '10/01/2010'
</cfif>
and t.order_date <= '#today#'
and c.ID = t.comp_id
order by t.order_date DESC
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_all_orders_by_comp">
SELECT c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status
FROM Title t, Companies c
where c.ID = '#this_Comp_id#'
and c.ID = t.comp_id
<cfif session.mi_employee eq 1>
and t.order_date > '7/15/2008'
<cfelseif session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1>
and t.order_date > '10/01/2010'
</cfif>
order by t.order_date DESC
</cfquery>
<cfquery datasource="#request.dsn#" name="total_closed_orders"> 
	SELECT appraisal_status
	FROM Title
	Where comp_id = '#this_Comp_id#'
	<cfif session.mi_employee eq 1>
    and order_date > '7/15/2008'
   <cfelseif session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1>
    and order_date > '10/01/2010'
</cfif>

	and (appraisal_status = 'Loan Closed' or appraisal_status = 'Loan Funded')
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
</cfloop>
</cfoutput>

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
<cfdefaultcase>
    order by Company
</cfdefaultcase>
</cfswitch>
</cfquery>




<cfoutput>
<cfset bgcolor = 'efefef'>
<strong>SALES STATS</strong>: #read_user.fname# #read_user.lname#<br>
<font size="-2" face="arial">
<table width-"600">
<tr bgcolor="##99CCFF">
<td align="left" valign="bottom" width="200"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Company&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Company"><em>Company Name</em><cfelse>Company Name</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Orders&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Orders"><em>Orders in Last 30 Days</em><cfelse>Orders in Last 30 Days</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Total_Orders&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Total_Orders"><em>Total Orders</em><cfelse>Total Orders</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Total_Closed&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Total_Closed_30"><em>Total Closed Last 30 Days</em><cfelse>Total Closed Last 30 Days</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="#CGI.SCRIPT_NAME#?sort_order_2=Total_Closed&UID=#url.uid#&al=1"><cfif sort_order_2 eq "Total_Closed"><em>Total Closed</em><cfelse>Total Closed</cfif></a></strong></td>


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
<td align="left" valign="top" width="200"><A href="client_modify_display.cfm?UID=#url.uid#&al=1&modify_client_id=#company_id#">#Company#</A></td>
<td align="center" valign="top">#Orders#</td>
<td align="center" valign="top">#Total_Orders#</td>
<td align="center" valign="top">#Total_Closed_30#</td>
<td align="center" valign="top">#Total_Closed#</td>
<td align="left" valign="top">#Proc_Name#</td>
<td align="center" valign="top">#Proc_Phone#</td>

</tr>
</cfloop>
</table>
</font>
</cfoutput>
<cfflush>

<!--- END this code finds all companies who have placed an order within the last 30 days --->


