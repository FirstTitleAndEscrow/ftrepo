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


<cfset start_date = DateAdd("m", 1, start_date)>
<cfset end_date = DateAdd("d", DaysInMonth(start_date)-1, start_date)>


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


<cfset start_date = DateAdd("m", 1, start_date)>
<cfset end_date = DateAdd("d", DaysInMonth(start_date)-1, start_date)>


<CFQUERY datasource="#request.dsn#" NAME="get_title_order_companies">
Select t.comp_id, c.*
FROM title t, companies c
where t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
and c.id NOT IN (#exclude_list#)
and c.id NOT IN (#companies_month1#)
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
and c.id NOT IN (#companies_month1#)
order by c.company
</cfquery>


<!--- now we build a list of those companies --->
<cfset companies_current = "">
<cfoutput query="get_property_order_companies">
<cfif NOT ListFind(companies_current, comp_id, ",")>
<cfset companies_current = ListAppend(companies_current, comp_id, ",")>
</cfif>
</cfoutput>
<cfloop query="get_title_order_companies">
<cfif NOT ListFind(companies_current, comp_id, ",")>
<cfset companies_current = ListAppend(companies_current, comp_id, ",")>
</cfif>
</cfloop>

<cfoutput>#companies_month1#</cfoutput><br>
<br>
<cfoutput>#companies_current#</cfoutput><br>
<br>


<cfoutput>
<table border=1>
<cfloop index="this_comp_id" list="#companies_current#" delimiters=",">
<CFQUERY datasource="#request.dsn#" NAME="get_title_order_companies">
Select t.comp_id, c.*
FROM title t, companies c
where t.comp_id = c.ID
and c.test_account = 0
and t.a_insert_date IS NOT NULL
and t.a_insert_date >= #start_date#
and t.a_insert_date <= #end_date#
and c.id = #this_comp_id#
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
and c.id = #this_comp_id#
order by c.company
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="info">
Select c.ID, c.team_id, c.Company, t.Name
FROM companies c, teams t
where c.id = #this_comp_id#
and t.ID = c.team_id
</cfquery>
<cfset order_total = get_title_order_companies.recordcount + get_property_order_companies.recordcount>
<tr>
<td>#info.Company#</td><td>#order_total#</td><td>#info.Name#</td>
</tr>
</cfloop>
</table>
</cfoutput>
