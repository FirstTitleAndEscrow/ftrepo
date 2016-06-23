
<!--- this starts the query that the cfchart will use --->
<cfset graph_query = QueryNew("period, percent")>


<!--- set the date of the first month you would like to calclulate  --->
<cfset begin_date = CreateODBCDate('01/01/2004')>

<!--- this code sets the stop date at the current month and year --->
<cfset this_month = DatePart('m', Now())>
<cfset this_year = DatePart('yyyy', Now())>
<!--- <cfset stop_date = CreateODBCDate(CreateDate(this_year, this_month, 1))> --->
<cfset stop_date = CreateODBCDate('01/01/05')>



<!--- start loops through the months --->
<cfset current_running_Date = begin_date>


<!--- keep going until the current running date is eq to the stop date --->
<cfloop condition="current_running_date neq stop_date">

<!--- to figure out retention data, we start from 4 months prior --->
<cfset start_month =  DatePart("m", DateAdd("m", -4, current_running_Date))>
<cfset start_year =  DatePart("yyyy", DateAdd("m", -4, current_running_Date))>
<cfset start_date = CreateODBCDate('#start_month#/01/#start_year#')>

<!-- end_date is the end of the month --->
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<cfset orig_start_date = start_date>
<cfset orig_end_date = end_date>


<!--- now find all companies that placed orders in that month, exclusing test companies --->
<CFQUERY datasource="#request.dsn#" NAME="get_title_order_companies">
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_order_companies">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
order by comp_id
</cfquery>

<!--- now we build a list of those companies --->
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

<!--- now we build a query to hold all this info, cause we're gonna go looping through it later --->
<cfset build_query = QueryNew("ID, count1, count2, count3, count4, possible, total_points, total_orders")>

<!--- start the counters possible and total points at 0 --->
<cfset possible_points = 0>
<cfset overall_total_points = 0>
<cfset overall_total_orders= 0>


<!--- here's the fun part --->
<!--- we start looping though the companies and counting their orders for this month --->
<cfloop index="this_id" list="#companies_month1#" delimiters=",">
<cfset total_points = 0>
<cfset total_orders = 0>
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
<!--- completed setting the number of orders for the first month --->

<!--- reset the start and end dates to the next month --->
<cfset start_date = DateAdd("d", DaysInMonth(start_date), start_date)>
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<!--- now find all the order for that month, for this company --->
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
<!--- completed setting the number of orders for the second month --->

<!--- reset the start and end dates to the next month --->
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
<!--- completed setting the number of orders for the third month --->

<!--- reset the start and end dates to the next month --->
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
<cfset total_orders = total_orders1 + total_orders2 + total_orders3 + total_orders4>

<!--- completed setting the number of orders for the fourth month --->

<!--- now we figure out how many points this company earned --->
<!--- we've defined the target as half the amount of orders of the base month, so --->
<cfset target_orders = total_orders1 / 2>

<!--- if the orders in the 2nd month are half or more of the orders in the base month, they get a point --->
<cfif total_orders2 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
<!--- if the orders in the 3rd month are half or more of the orders in the base month, they get another point --->
<cfif total_orders3 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
<!--- if the orders in the 4th month are half or more of the orders in the base month, they get another point --->
<cfif total_orders4 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
<!--- now we add this company's order and point totals to the data table --->
<cfset temp = QueryAddRow(build_query)>
<cfset temp = QuerySetCell(build_query, "ID", this_id)>
<cfset temp = QuerySetCell(build_query, "count1", total_orders1)>
<cfset temp = QuerySetCell(build_query, "count2", total_orders2)>
<cfset temp = QuerySetCell(build_query, "count3", total_orders3)>
<cfset temp = QuerySetCell(build_query, "count4", total_orders4)>
<cfset temp = QuerySetCell(build_query, "possible", 3)>
<cfset temp = QuerySetCell(build_query, "total_points", total_points)>
<cfset temp = QuerySetCell(build_query, "total_orders", total_orders)>

<!--- and increase the counters --->
<cfset possible_points = possible_points + 3>
<cfset overall_total_points = overall_total_points + total_points>
<cfset overall_total_orders = overall_total_orders + total_orders>

</cfloop>



<!--- then the whole mess repeats for to find new companies in the 2nd month --->

<!--- get 2nd Month Companies and totals --->


<cfset start_date = DateAdd("d", DaysInMonth(orig_start_date), orig_start_date)>
<cfset end_date = CreateODBCDate(DateAdd("d", (DaysInMonth(start_date)-1), start_date)   )>
<cfset orig_start_date = start_date>
<cfset orig_end_date = end_date>

<CFQUERY datasource="#request.dsn#" NAME="get_title_order_companies">
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_order_companies">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
order by comp_id
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
<cfset total_orders = 0>
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

<cfset total_orders = total_orders2 + total_orders3 + total_orders4>




<cfset target_orders = total_orders2 / 2>
<cfif total_orders3 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
<cfif total_orders4 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
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
Select comp_id
FROM title
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
order by comp_id
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_order_companies">
Select comp_id
FROM property
where a_insert_date IS NOT NULL
and a_insert_date >= #start_date#
and a_insert_date <= #end_date#
order by comp_id
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
<cfset total_orders = 0>
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
<cfset total_orders + total_orders3 + total_orders4>



<cfset target_orders = total_orders3 / 2>
<cfif total_orders4 GTE target_orders>
<cfset total_points = total_points + 1>
</cfif>
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
<cfset overall_total_points = overall_total_orders + total_orders>


</cfloop>

<!--- end 3rd month --->
<cfset score = (overall_total_points / possible_points) * 100>
<cfoutput>#DateFormat(DateAdd('m', 1, end_date), 'mmmm yyyy')#<br>
Possible: #possible_points#<br>
Total: #overall_total_points#<br>
Score: #Round(score)#<br>
Order: #overall_total_orders#</cfoutput><br>
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


<!---
<CFQUERY datasource="#request.dsn#" NAME="graph_query">
Select * FROM Retention_Rates
</cfquery>


<table width="775">
<tr>
<td ALIGN="CENTER"><FONT style="font:Arial, Helvetica, sans-serif; font-size:18">HISTORICAL RETENTION SCORES</FONT></td>
</tr>
</table>
<cfchart format="flash" chartheight="500" chartwidth="775">
	<cfchartseries 
		type="bar" 
		query="graph_query" 
		itemColumn="period" 
		valueColumn="percentage" paintstyle="shade" markerstyle="rectangle"
		/>
</cfchart><br>
<table width="775" cellpadding="0" cellspacing="0">
<tr>
<td width="20">&nbsp;</td>
<cfoutput query="graph_query">
<td align="center" valign="top"><font size="4">#percentage#</font></td>
</cfoutput>
<td width="2">&nbsp;</td>
</tr>
</table>
--->
<!--- <cfdump var="#build_query#"> --->

<!--- DATA TABLE <br>

<table cellpadding="4" cellspacing="2">
<tr bgcolor="#FFCC99">
<td align="left" valign="top"><strong>Company ID</strong></td>
<td align="right" valign="top"><strong>Number of Orders</strong></td>
<td align="right" valign="top"><strong>Number of Orders</strong></td>
<td align="right" valign="top"><strong>Number of Orders</strong></td>
<td align="right" valign="top"><strong>Number of Orders</strong></td>
<td align="right" valign="top"><strong>Total Possible Points</strong></td>
<td align="right" valign="top"><strong>Total Points Earned</strong></td>
<td align="right" valign="top"><strong>Total Orders</strong></td>
</tr>
<cfoutput query="build_query">
<tr bgcolor="##FFFFCC">
<td align="left" valign="top">#ID#</td>
<td align="right" valign="top">#count1#</td>
<td align="right" valign="top">#count2#</td>
<td align="right" valign="top">#count3#</td>
<td align="right" valign="top">#count4#</td>
<td align="right" valign="top">#possible#</td>
<td align="right" valign="top">#total_points#</td>
<td align="right" valign="top">#total_orders#</td>
</tr>
</cfoutput>
<cfoutput><tr bgcolor="##FFFFCC">
<td align="left" valign="top" colspan="5">TOTALS</td>
<td align="right" valign="top">#possible_points#</td>
<td align="right" valign="top">#overall_total_points#</td>
<td align="right" valign="top">#overall_total_orders#</td>
</tr>
<tr bgcolor="##FFFFCC">
<td align="left" valign="top" colspan="6">SCORE</td>
<td align="right" valign="top">#Round(score)#</td>
</tr></cfoutput>
</table> --->

Done!

