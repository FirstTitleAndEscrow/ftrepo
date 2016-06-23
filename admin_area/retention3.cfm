<cfset exclude_list = "1451, 1431, 108, 1704, 1945, 1719, 1718, 1722, 1717, 450, 1754">

<cfset this_quarter_query = QueryNew("Company_ID, Base, month_1, points_1, month_2, points_2, month_3, points_3")>
<cfset orig_start_date = CreateODBCDate('12/01/2006')>
<cfset orig_end_date = DateAdd("d", DaysInMonth(orig_start_date)-1, orig_start_date)>
<!--- now find all companies that placed orders in that month, exclusing test companies --->
<cfset start_date = orig_start_date>
<cfset end_date = orig_end_date>



<CFQUERY datasource="#request.dsn#" NAME="get_title_order_companies">
Select t.comp_id, c.*
FROM title t, companies c
where t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
and c.id NOT IN (#exclude_list#)
order by c.company
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_order_companies">
Select p.comp_id, c.*
FROM property p, companies c
where p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
and c.id NOT IN (#exclude_list#)
order by c.company
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

<cfloop index="this_company" list="#companies_month1#" delimiters=",">
<cfset start_date = orig_start_date>
<cfset end_date = orig_end_date>

<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Select *
FROM title t, companies c 
where t.comp_id = #this_company#
and t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_orders">
Select *
FROM property p, companies c 
where p.comp_id = #this_company#
and p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
</cfquery>
<cfset total_orders_base = get_property_orders.recordcount + get_title_orders.recordcount>

<cfset c_id = this_company>


<cfset start_date = DateAdd("m", 1, start_date)>
<cfset end_date = DateAdd("d", DaysInMonth(start_date)-1, start_date)>

<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Select *
FROM title t, companies c 
where t.comp_id = #this_company#
and t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_orders">
Select *
FROM property p, companies c 
where p.comp_id = #this_company#
and p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
</cfquery>

<cfset total_orders_m1 = get_property_orders.recordcount + get_title_orders.recordcount>
<cfif total_orders_m1 GT (total_orders_base / 2)>
<cfset points_1 = 1>
<cfelse>
<cfset points_1 = 0>
</cfif>


<cfset start_date = DateAdd("m", 1, start_date)>
<cfset end_date = DateAdd("d", DaysInMonth(start_date)-1, start_date)>
<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Select *
FROM title t, companies c 
where t.comp_id = #this_company#
and t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_orders">
Select *
FROM property p, companies c 
where p.comp_id = #this_company#
and p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
</cfquery>

<cfset total_orders_m2 = get_property_orders.recordcount + get_title_orders.recordcount>
<cfif total_orders_m2 GT (total_orders_base / 2)>
<cfset points_2 = 1>
<cfelse>
<cfset points_2 = 0>
</cfif>


<cfset start_date = DateAdd("m", 1, start_date)>
<cfset end_date = DateAdd("d", DaysInMonth(start_date)-1, start_date)>
<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Select *
FROM title t, companies c 
where t.comp_id = #this_company#
and t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_orders">
Select *
FROM property p, companies c 
where p.comp_id = #this_company#
and p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
</cfquery>

<cfset total_orders_m3 = get_property_orders.recordcount + get_title_orders.recordcount>
<cfif total_orders_m3 GT (total_orders_base / 2)>
<cfset points_3 = 1>
<cfelse>
<cfset points_3 = 0>
</cfif>



<cfset temp = QueryAddRow(this_quarter_query)>
<cfset temp = QuerySetCell(this_quarter_query, "Company_id", this_company)>
<cfset temp = QuerySetCell(this_quarter_query, "Base", total_orders_base)>
<cfset temp = QuerySetCell(this_quarter_query, "month_1", total_orders_m1)>
<cfset temp = QuerySetCell(this_quarter_query, "points_1", points_1)>
<cfset temp = QuerySetCell(this_quarter_query, "month_2", total_orders_m2)>
<cfset temp = QuerySetCell(this_quarter_query, "points_2", points_2)>
<cfset temp = QuerySetCell(this_quarter_query, "month_3", total_orders_m3)>
<cfset temp = QuerySetCell(this_quarter_query, "points_3", points_3)>
</cfloop>

<!---
<cfoutput>#companies_month1#</cfoutput><br>
<table border=1 cellpadding=4>
<tr>
<td align="left" valign="top">ID</td>
<td align="right" valign="top">Base</td>
<td align="right" valign="top">M1</td>
<td align="right" valign="top">P1</td>
<td align="right" valign="top">M2</td>
<td align="right" valign="top">P2</td>
<td align="right" valign="top">M3</td>
<td align="right" valign="top">P3</td>
</tr>
<cfoutput query="this_quarter_query">
<tr>
<td align="right" valign="top">#Company_ID#</td>
<td align="right" valign="top">#Base#</td>
<td align="right" valign="top">#month_1#</td>
<td align="right" valign="top">#points_1#</td>
<td align="right" valign="top">#month_2#</td>
<td align="right" valign="top">#points_2#</td>
<td align="right" valign="top">#month_3#</td>
<td align="right" valign="top">#points_3#</td>
</tr>
</cfoutput>

</table> --->

<cfquery dbtype="query" name="sum_points"> 
	SELECT SUM(points_1) as POINTS_TOTAL
	FROM this_quarter_query
</cfquery>

<cfset score_m1 = Round((sum_points.POINTS_TOTAL / this_quarter_query.recordcount) * 100)>
<cfset overall_total_orders_m1 = get_property_order_companies.recordcount + get_title_order_companies.recordcount>
<cfset date_m1 = DateFormat(DateAdd("m", 1, orig_start_date), "mmmm yyyy")>






<!--- MONTH 2 CALCULATIONS --->
<cfset orig_start_date = DateAdd("m", 1, orig_start_date)>
<cfset orig_end_date = DateAdd("d", DaysInMonth(orig_start_date)-1, orig_start_date)>

<!--- now find all companies that placed orders in that month, exclusing test companies --->
<cfset start_date = orig_start_date>
<cfset end_date = orig_end_date>


<CFQUERY datasource="#request.dsn#" NAME="get_title_order_companies">
Select t.comp_id, c.*
FROM title t, companies c
where t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
and c.id NOT IN (#exclude_list#)
order by c.company
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_order_companies">
Select p.comp_id, c.*
FROM property p, companies c
where p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
and c.id NOT IN (#exclude_list#)
order by c.company
</cfquery>


<!--- now we build a list of those companies --->
<cfset companies_month2 = "">
<cfoutput query="get_property_order_companies">
<cfif NOT ListFind(companies_month1, comp_id, ",") AND NOT ListFind(companies_month2, comp_id, ",")>
<cfset companies_month2 = ListAppend(companies_month2, comp_id, ",")>
</cfif>
</cfoutput>
<cfloop query="get_title_order_companies">
<cfif NOT ListFind(companies_month1, comp_id, ",") AND NOT ListFind(companies_month2, comp_id, ",")>
<cfset companies_month2 = ListAppend(companies_month2, comp_id, ",")>
</cfif>
</cfloop>

<cfloop index="this_company" list="#companies_month2#" delimiters=",">
<cfset start_date = orig_start_date>
<cfset end_date = orig_end_date>
<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Select *
FROM title t, companies c 
where t.comp_id = #this_company#
and t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_orders">
Select *
FROM property p, companies c 
where p.comp_id = #this_company#
and p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
</cfquery>
<cfset total_orders_base = get_property_orders.recordcount + get_title_orders.recordcount>

<cfset c_id = this_company>


<cfset start_date = DateAdd("m", 1, start_date)>
<cfset end_date = DateAdd("d", DaysInMonth(start_date)-1, start_date)>
<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Select *
FROM title t, companies c 
where t.comp_id = #this_company#
and t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_orders">
Select *
FROM property p, companies c 
where p.comp_id = #this_company#
and p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
</cfquery>

<cfset total_orders_m2 = get_property_orders.recordcount + get_title_orders.recordcount>
<cfif total_orders_m2 GT (total_orders_base / 2)>
<cfset points_2 = 1>
<cfelse>
<cfset points_2 = 0>
</cfif>


<cfset start_date = DateAdd("m", 1, start_date)>
<cfset end_date = DateAdd("d", DaysInMonth(start_date)-1, start_date)>
<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Select *
FROM title t, companies c 
where t.comp_id = #this_company#
and t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_orders">
Select *
FROM property p, companies c 
where p.comp_id = #this_company#
and p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
</cfquery>

<cfset total_orders_m3 = get_property_orders.recordcount + get_title_orders.recordcount>
<cfif total_orders_m3 GT (total_orders_base / 2)>
<cfset points_3 = 1>
<cfelse>
<cfset points_3 = 0>
</cfif>






<cfset temp = QueryAddRow(this_quarter_query)>
<cfset temp = QuerySetCell(this_quarter_query, "Company_id", this_company)>
<cfset temp = QuerySetCell(this_quarter_query, "Base", 0)>
<cfset temp = QuerySetCell(this_quarter_query, "month_1", total_orders_base)>
<cfset temp = QuerySetCell(this_quarter_query, "points_1", 0)>
<cfset temp = QuerySetCell(this_quarter_query, "month_2", total_orders_m2)>
<cfset temp = QuerySetCell(this_quarter_query, "points_2", points_2)>
<cfset temp = QuerySetCell(this_quarter_query, "month_3", total_orders_m3)>
<cfset temp = QuerySetCell(this_quarter_query, "points_3", points_3)>
</cfloop>

<!---
<cfoutput>#companies_month1#</cfoutput><br>
<table border=1 cellpadding=4>
<tr>
<td align="left" valign="top">ID</td>
<td align="right" valign="top">Base</td>
<td align="right" valign="top">M1</td>
<td align="right" valign="top">P1</td>
<td align="right" valign="top">M2</td>
<td align="right" valign="top">P2</td>
<td align="right" valign="top">M3</td>
<td align="right" valign="top">P3</td>
</tr>
<cfoutput query="this_quarter_query">
<tr>
<td align="right" valign="top">#Company_ID#</td>
<td align="right" valign="top">#Base#</td>
<td align="right" valign="top">#month_1#</td>
<td align="right" valign="top">#points_1#</td>
<td align="right" valign="top">#month_2#</td>
<td align="right" valign="top">#points_2#</td>
<td align="right" valign="top">#month_3#</td>
<td align="right" valign="top">#points_3#</td>
</tr>
</cfoutput>

</table> --->

<cfquery dbtype="query" name="sum_points"> 
	SELECT SUM(points_2) as POINTS_TOTAL
	FROM this_quarter_query
</cfquery>

<cfset score_m2 = Round((sum_points.POINTS_TOTAL / this_quarter_query.recordcount) * 100)>
<cfset overall_total_orders_m2 = get_property_order_companies.recordcount + get_title_order_companies.recordcount>
<cfset date_m2 = DateFormat(DateAdd("m", 1, orig_start_date), "mmmm yyyy")>


<!--- MONTH 3 CALCULATIONS --->

<cfset orig_start_date = DateAdd("m", 1, orig_start_date)>
<cfset orig_end_date = DateAdd("d", DaysInMonth(orig_start_date)-1, orig_start_date)>

<!--- now find all companies that placed orders in that month, exclusing test companies --->
<cfset start_date = orig_start_date>
<cfset end_date = orig_end_date>


<CFQUERY datasource="#request.dsn#" NAME="get_title_order_companies">
Select t.comp_id, c.*
FROM title t, companies c
where t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
and c.id NOT IN (#exclude_list#)
order by c.company
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_order_companies">
Select p.comp_id, c.*
FROM property p, companies c
where p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
and c.id NOT IN (#exclude_list#)
order by c.company
</cfquery>


<!--- now we build a list of those companies --->
<cfset companies_month3 = "">
<cfoutput query="get_property_order_companies">
<cfif NOT ListFind(companies_month1, comp_id, ",") AND NOT ListFind(companies_month2, comp_id, ",") AND NOT ListFind(companies_month3, comp_id, ",")>
<cfset companies_month3 = ListAppend(companies_month3, comp_id, ",")>
</cfif>
</cfoutput>
<cfloop query="get_title_order_companies">
<cfif NOT ListFind(companies_month1, comp_id, ",") AND NOT ListFind(companies_month2, comp_id, ",") AND NOT ListFind(companies_month3, comp_id, ",")>
<cfset companies_month3 = ListAppend(companies_month3, comp_id, ",")>
</cfif>
</cfloop>

<cfloop index="this_company" list="#companies_month3#" delimiters=",">
<cfset start_date = orig_start_date>
<cfset end_date = orig_end_date>
<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Select *
FROM title t, companies c 
where t.comp_id = #this_company#
and t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_orders">
Select *
FROM property p, companies c 
where p.comp_id = #this_company#
and p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
</cfquery>
<cfset total_orders_base = get_property_orders.recordcount + get_title_orders.recordcount>

<cfset c_id = this_company>


<cfset start_date = DateAdd("m", 1, start_date)>
<cfset end_date = DateAdd("d", DaysInMonth(start_date)-1, start_date)>
<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Select *
FROM title t, companies c 
where t.comp_id = #this_company#
and t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_orders">
Select *
FROM property p, companies c 
where p.comp_id = #this_company#
and p.comp_id = c.ID
and c.test_account = 0
and p.a_insert_date IS NOT NULL
and p.a_insert_date >= #start_date#
and p.a_insert_date <= #end_date#
</cfquery>

<cfset total_orders_m3 = get_property_orders.recordcount + get_title_orders.recordcount>
<cfif total_orders_m3 GT (total_orders_base / 2)>
<cfset points_3 = 1>
<cfelse>
<cfset points_3 = 0>
</cfif>





<cfset temp = QueryAddRow(this_quarter_query)>
<cfset temp = QuerySetCell(this_quarter_query, "Company_id", this_company)>
<cfset temp = QuerySetCell(this_quarter_query, "Base", 0)>
<cfset temp = QuerySetCell(this_quarter_query, "month_1", 0)>
<cfset temp = QuerySetCell(this_quarter_query, "points_1", 0)>
<cfset temp = QuerySetCell(this_quarter_query, "month_2", total_orders_base)>
<cfset temp = QuerySetCell(this_quarter_query, "points_2", points_2)>
<cfset temp = QuerySetCell(this_quarter_query, "month_3", total_orders_m3)>
<cfset temp = QuerySetCell(this_quarter_query, "points_3", points_3)>
</cfloop>

<!---
<cfoutput>#companies_month1#</cfoutput><br>
<table border=1 cellpadding=4>
<tr>
<td align="left" valign="top">ID</td>
<td align="right" valign="top">Base</td>
<td align="right" valign="top">M1</td>
<td align="right" valign="top">P1</td>
<td align="right" valign="top">M2</td>
<td align="right" valign="top">P2</td>
<td align="right" valign="top">M3</td>
<td align="right" valign="top">P3</td>
</tr>
<cfoutput query="this_quarter_query">
<tr>
<td align="right" valign="top">#Company_ID#</td>
<td align="right" valign="top">#Base#</td>
<td align="right" valign="top">#month_1#</td>
<td align="right" valign="top">#points_1#</td>
<td align="right" valign="top">#month_2#</td>
<td align="right" valign="top">#points_2#</td>
<td align="right" valign="top">#month_3#</td>
<td align="right" valign="top">#points_3#</td>
</tr>
</cfoutput>

</table> --->

<cfquery dbtype="query" name="sum_points"> 
	SELECT SUM(points_3) as POINTS_TOTAL
	FROM this_quarter_query
</cfquery>

<cfset score_m3 = Round((sum_points.POINTS_TOTAL / this_quarter_query.recordcount) * 100)>
<cfset overall_total_orders_m3 = get_property_order_companies.recordcount + get_title_order_companies.recordcount>
<cfset date_m3 = DateFormat(DateAdd("m", 1, orig_start_date), "mmmm yyyy")>


<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Insert Into Retention_Rates2
(Period, score, orders)
values
('#date_m1#', #score_m1#, #overall_total_orders_m1#)
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Insert Into Retention_Rates2
(Period, score, orders)
values
('#date_m2#', #score_m2#, #overall_total_orders_m2#)
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
Insert Into Retention_Rates2
(Period, score, orders)
values
('#date_m3#', #score_m3#, #overall_total_orders_m3#)
</cfquery>


<cfoutput>
Date: #date_m1#<br>
Score: #score_m1#<br>
Orders: #overall_total_orders_m1#<br>
<hr>
Date: #date_m2#<br>
Score: #score_m2#<br>
Orders: #overall_total_orders_m2#<br>
<hr>
Date: #date_m3#<br>
Score: #score_m3#<br>
Orders: #overall_total_orders_m3#<br><br>
<br>
</cfoutput>




<br>
<br>

<table border=1 cellpadding=4>
<tr>
<td align="left" valign="top">ID</td>
<td align="right" valign="top">Base</td>
<td align="right" valign="top">M1</td>
<td align="right" valign="top">P1</td>
<td align="right" valign="top">M2</td>
<td align="right" valign="top">P2</td>
<td align="right" valign="top">M3</td>
<td align="right" valign="top">P3</td>
</tr>
<cfoutput query="this_quarter_query">
<tr>
<td align="right" valign="top">#Company_ID#</td>
<td align="right" valign="top">#Base#</td>
<td align="right" valign="top">#month_1#</td>
<td align="right" valign="top">#points_1#</td>
<td align="right" valign="top">#month_2#</td>
<td align="right" valign="top">#points_2#</td>
<td align="right" valign="top">#month_3#</td>
<td align="right" valign="top">#points_3#</td>
</tr>
</cfoutput>

</table>
