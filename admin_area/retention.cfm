<!--- 
<cfset graph_query = QueryNew("period, percent")>

<cfset begin_date = CreateODBCDate('01/01/2006')>
<cfset this_month = DatePart('m', Now())>
<cfset this_year = DatePart('yyyy', Now())>
<!--- <cfset stop_date = CreateODBCDate(CreateDate(this_year, this_month, 1))> --->
<cfset stop_date = CreateODBCDate('01/01/2007')>




<cfset current_running_Date = begin_date>
<cfloop condition="current_running_date neq stop_date">
<cfset overall_total_orders = 0>

<cfset start_month =  DatePart("m", DateAdd("m", -4, current_running_Date))>
<cfset start_year =  DatePart("yyyy", DateAdd("m", -4, current_running_Date))>
<cfset start_date = CreateODBCDate('#start_month#/01/#start_year#')>
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<cfset orig_start_date = start_date>
<cfset orig_end_date = end_date>

<CFQUERY datasource="#request.dsn#" NAME="get_title_order_companies">
Select t.comp_id, c.status, c.test_account
FROM title t, Companies c
where t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
and t.comp_id = c.ID
and c.status = 1
and c.test_account = 0
order by t.comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_order_companies">
Select p.comp_id, c.status, c.test_account
FROM Property p, Companies c
where p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
and p.comp_id = c.ID
and c.status = 1
and c.test_account = 0
order by p.comp_id
</cfquery>
<cfset companies_month1 = "">
<cfoutput query="get_property_order_companies">
<cfif NOT ListFind(companies_month1, comp_id, ",")>
<cfset companies_month1 = ListAppend(companies_month1, comp_id, ",")>
</cfif>
</cfoutput>
<cfloop query="get_title_order_companies">
<cfif NOT ListFind(companies_month1, comp_id, ",")>
<cfset companies_month1 = ListAppend(companies_month1, comp_id, ",")>
</cfif>
</cfloop>

<cfset build_query = QueryNew("ID, count1, count2, count3, count4, possible, total_points, total_orders")>
<cfset possible_points = 0>
<cfset overall_total_points = 0>

<cfloop index="this_id" list="#companies_month1#" delimiters=",">
<cfset total_points = 0>
<cfset start_date = orig_start_date>
<cfset end_date = orig_end_date>
<CFQUERY datasource="#request.dsn#" NAME="title_orders">
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="prop_orders">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<cfset total_orders1 = title_orders.recordcount + prop_orders.recordcount>

<cfset start_date = DateAdd("d", DaysInMonth(start_date), start_date)>
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<CFQUERY datasource="#request.dsn#" NAME="title_orders">
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="prop_orders">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<cfset total_orders2 = title_orders.recordcount + prop_orders.recordcount>


<cfset start_date = DateAdd("d", DaysInMonth(start_date), start_date)>
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<CFQUERY datasource="#request.dsn#" NAME="title_orders">
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="prop_orders">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<cfset total_orders3 = title_orders.recordcount + prop_orders.recordcount>


<cfset start_date = DateAdd("d", DaysInMonth(start_date), start_date)>
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<CFQUERY datasource="#request.dsn#" NAME="title_orders">
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="prop_orders">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<cfset total_orders4 = title_orders.recordcount + prop_orders.recordcount>

<cfset target_orders = total_orders1 / 2>
<cfif total_orders2 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
<cfif total_orders3 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
<cfif total_orders4 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
<cfset total_orders = total_orders1 + total_orders2 + total_orders3 + total_orders4>
<cfset temp = QueryAddRow(build_query)>
<cfset temp = QuerySetCell(build_query, "ID", this_id)>
<cfset temp = QuerySetCell(build_query, "count1", total_orders1)>
<cfset temp = QuerySetCell(build_query, "count2", total_orders2)>
<cfset temp = QuerySetCell(build_query, "count3", total_orders3)>
<cfset temp = QuerySetCell(build_query, "count4", total_orders4)>
<cfset temp = QuerySetCell(build_query, "possible", 3)>
<cfset temp = QuerySetCell(build_query, "total_points", total_points)>
<cfset temp = QuerySetCell(build_query, "total_orders", total_orders)>


<cfset possible_points = possible_points + 3>
<cfset overall_total_points = overall_total_points + total_points>
<cfset overall_total_orders = overall_total_orders + total_orders>


</cfloop>




<!--- get 2nd Month Companies and totals --->


<cfset start_date = DateAdd("d", DaysInMonth(orig_start_date), orig_start_date)>
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<cfset orig_start_date = start_date>
<cfset orig_end_date = end_date>

<CFQUERY datasource="#request.dsn#" NAME="get_title_order_companies">
Select t.comp_id, c.status, c.test_account
FROM title t, Companies c
where t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
and t.comp_id = c.ID
and c.status = 1
and c.test_account = 0
order by t.comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_order_companies">
Select p.comp_id, c.status, c.test_account
FROM Property p, Companies c
where p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
and p.comp_id = c.ID
and c.status = 1
and c.test_account = 0
order by p.comp_id
</cfquery>
<cfset companies_month2 = "">
<cfoutput query="get_property_order_companies">
<cfif NOT ListFind(companies_month2, comp_id, ",") AND  NOT ListFind(companies_month1, comp_id, ",")>
<cfset companies_month2 = ListAppend(companies_month2, comp_id, ",")>
</cfif>
</cfoutput>
<cfloop query="get_title_order_companies">
<cfif NOT ListFind(companies_month2, comp_id, ",") AND NOT ListFind(companies_month1, comp_id, ",")>
<cfset companies_month2 = ListAppend(companies_month2, comp_id, ",")>
</cfif>
</cfloop>


<cfloop index="this_id" list="#companies_month2#" delimiters=",">
<cfset total_points = 0>
<cfset start_date = orig_start_date>
<cfset end_date = orig_end_date>
<CFQUERY datasource="#request.dsn#" NAME="title_orders">
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="prop_orders">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<cfset total_orders2 = title_orders.recordcount + prop_orders.recordcount>

<cfset start_date = DateAdd("d", DaysInMonth(start_date), start_date)>
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<CFQUERY datasource="#request.dsn#" NAME="title_orders">
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="prop_orders">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<cfset total_orders3 = title_orders.recordcount + prop_orders.recordcount>


<cfset start_date = DateAdd("d", DaysInMonth(start_date), start_date)>
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<CFQUERY datasource="#request.dsn#" NAME="title_orders">
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="prop_orders">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<cfset total_orders4 = title_orders.recordcount + prop_orders.recordcount>




<cfset target_orders = total_orders2 / 2>
<cfif total_orders3 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
<cfif total_orders4 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
<cfset total_orders = total_orders2 + total_orders3 + total_orders4>
<cfset temp = QueryAddRow(build_query)>
<cfset temp = QuerySetCell(build_query, "ID", this_id)>
<cfset temp = QuerySetCell(build_query, "count1", "---")>
<cfset temp = QuerySetCell(build_query, "count2", total_orders2)>
<cfset temp = QuerySetCell(build_query, "count3", total_orders3)>
<cfset temp = QuerySetCell(build_query, "count4", total_orders4)>
<cfset temp = QuerySetCell(build_query, "possible", 2)>
<cfset temp = QuerySetCell(build_query, "total_points", total_points)>
<cfset temp = QuerySetCell(build_query, "total_orders", total_orders)>


<cfset possible_points = possible_points + 2>
<cfset overall_total_points = overall_total_points + total_points>
<cfset overall_total_orders = overall_total_orders + total_orders>


</cfloop>

<!--- end 2nd month --->




<!--- get 3rd Month Companies and totals --->


<cfset start_date = DateAdd("d", DaysInMonth(orig_start_date), orig_start_date)>
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<cfset orig_start_date = start_date>
<cfset orig_end_date = end_date>

<CFQUERY datasource="#request.dsn#" NAME="get_title_order_companies">
Select t.comp_id, c.status, c.test_account
FROM title t, Companies c
where t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
and t.comp_id = c.ID
and c.status = 1
and c.test_account = 0
order by t.comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_order_companies">
Select p.comp_id, c.status, c.test_account
FROM Property p, Companies c
where p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
and p.comp_id = c.ID
and c.status = 1
and c.test_account = 0
order by p.comp_id
</cfquery>
<cfset companies_month3 = "">
<cfoutput query="get_property_order_companies">
<cfif NOT ListFind(companies_month2, comp_id, ",") AND  NOT ListFind(companies_month1, comp_id, ",") AND NOT ListFind(companies_month3, comp_id, ",")>
<cfset companies_month3 = ListAppend(companies_month3, comp_id, ",")>
</cfif>
</cfoutput>
<cfloop query="get_title_order_companies">
<cfif NOT ListFind(companies_month2, comp_id, ",") AND NOT ListFind(companies_month1, comp_id, ",") AND NOT ListFind(companies_month3, comp_id, ",")>
<cfset companies_month3 = ListAppend(companies_month3, comp_id, ",")>
</cfif>
</cfloop>


<cfloop index="this_id" list="#companies_month3#" delimiters=",">
<cfset total_points = 0>
<cfset start_date = orig_start_date>
<cfset end_date = orig_end_date>
<CFQUERY datasource="#request.dsn#" NAME="title_orders">
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="prop_orders">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<cfset total_orders3 = title_orders.recordcount + prop_orders.recordcount>

<cfset start_date = DateAdd("d", DaysInMonth(start_date), start_date)>
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<CFQUERY datasource="#request.dsn#" NAME="title_orders">
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="prop_orders">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
and comp_id = #this_id#
order by comp_id
</cfquery>
<cfset total_orders4 = title_orders.recordcount + prop_orders.recordcount>



<cfset target_orders = total_orders3 / 2>
<cfif total_orders4 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
<cfset total_orders = total_orders3 + total_orders4>
<cfset temp = QueryAddRow(build_query)>
<cfset temp = QuerySetCell(build_query, "ID", this_id)>
<cfset temp = QuerySetCell(build_query, "count1", "---")>
<cfset temp = QuerySetCell(build_query, "count2", "---")>
<cfset temp = QuerySetCell(build_query, "count3", total_orders3)>
<cfset temp = QuerySetCell(build_query, "count4", total_orders4)>
<cfset temp = QuerySetCell(build_query, "possible", 1)>
<cfset temp = QuerySetCell(build_query, "total_points", total_points)>
<cfset temp = QuerySetCell(build_query, "total_orders", total_orders)>


<cfset possible_points = possible_points + 1>
<cfset overall_total_points = overall_total_points + total_points>
<cfset overall_total_orders = overall_total_orders + total_orders>


</cfloop>

<!--- end 3rd month --->
<cfset score = (overall_total_points / possible_points) * 100>
<cfoutput>#DateFormat(DateAdd('m', 1, end_date), 'mmmm yyyy')#<br>
Possible: #possible_points#<br>
Total: #overall_total_points#<br>
Orders Total: #overall_total_orders#<br>
Score: #Round(score)#%</cfoutput><br>
<CFQUERY datasource="#request.dsn#" NAME="insert_data">
Insert into Retention_Rates
(period, percentage, possible, total, orders)
values
('#DateFormat(DateAdd("m", 1, end_date), "mmmm yyyy")#', #Round(score)#, #possible_points#, #overall_total_points#, #overall_total_orders#)
</cfquery>
<br>
<br>
<HR>
<br>
<br>
<!--- <cfset temp = QueryAddRow(graph_query)>
<cfset temp = QuerySetCell(graph_query, "period", DateFormat(DateAdd('m', 1, end_date), 'mmmm yyyy'))>
<cfset temp = QuerySetCell(graph_query, "percent", Round(score))>
 --->
<cfset current_running_Date = DateAdd("d", DaysInMonth(current_running_date),current_running_date)>
<cfflush>
</cfloop>
--->


<table><tr><td align="left" valign="top">2005<br>
<ul>
<li><a href="retention.cfm?year=2005&type=retention">Retention Scores</a></li>
<li><a href="retention.cfm?year=2005&type=orders">Order Totals</a></li>
</ul><br>
<br>
2006<br>
<ul>
<li><a href="retention.cfm?year=2006&type=retention">Retention Scores</a></li>
<li><a href="retention.cfm?year=2006&type=orders">Order Totals</a></li>
</ul>
<br>
2007<br>
<ul>
<li><a href="retention.cfm?year=2007&type=retention">Retention Scores</a></li>
<li><a href="retention.cfm?year=2007&type=orders">Order Totals</a></li>
</ul>
</td><td align="left" valign="top">
<cfparam name="url.year" default="2007">
<cfparam name="url.type" default="retention">

<CFQUERY datasource="#request.dsn#" NAME="graph_query">
Select * FROM Retention_Rates2 where period like '%#url.year#'
</cfquery>

<table width="775">
<tr>
<td ALIGN="CENTER"><FONT style="font:Arial, Helvetica, sans-serif; font-size:18">HISTORICAL RATES = <CFOUTPUT>#UCASE(url.type)# - #url.year#</CFOUTPUT></FONT></td>
</tr>
</table>
<cfchart format="flash" chartheight="500" chartwidth="775">
<cfif url.type eq 'Retention'>
	<cfchartseries 
		type="bar" 
		query="graph_query" 
		itemColumn="period" 
		valueColumn="score" paintstyle="shade" markerstyle="rectangle"
		/>
		<cfelse>
		<cfchartseries 
		type="bar" 
		query="graph_query" 
		itemColumn="period" 
		valueColumn="orders" paintstyle="shade" markerstyle="rectangle"
		/>
		
		</cfif>
</cfchart><br>
<cfif url.type eq 'retention'>
<table width="775" cellpadding="0" cellspacing="0">
<tr>
<td width="25">&nbsp;</td>
<cfoutput query="graph_query">
<td align="center" valign="top"><font size="4">#score#</font></td>
</cfoutput>
<td width="2">&nbsp;</td>
</tr>
</table>
<cfelse>
<table cellpadding="0" cellspacing="0">
<tr>
<td width="42">&nbsp;</td>
<cfoutput query="graph_query">
<td align="center" valign="top" width="60"><font size="3">#orders#</font></td>
</cfoutput>
<td width="6">&nbsp;</td>
</tr>
</table></cfif>
</td>
</tr></table>