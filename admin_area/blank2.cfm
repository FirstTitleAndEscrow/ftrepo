<cfparam name="url.uid" default="59">


<!-- this code gets the order dates from all orders, creates an actual datetime value for it, and puts it into the database as order_date, to make searching easier --->
<CFQUERY datasource="#request.dsn#" NAME="get_all_orders">
Select a_insert_date, title_id
FROM Title
where order_date IS NULL
</cfquery>
<cfoutput query="get_all_orders">
<cfset newdate = CreateODBCDate(get_all_orders.a_insert_date)>
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

<cfif url.uid neq 59>
<font size=2 color=black face=verdana>
Welcome to the First Title Services Admin Area.
<p>
Use the navigation at the top to perform any of<br>
the available functions.<br>
<br>
</cfif>

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

<br>
<br>

<!--- THIS CODE SETS UP ALL THE DATE VARIABLES WE'LL NEED --->

<cfset today = DateFormat(Now(), "m/d/yyyy")>
<cfparam name="form.today_day" default="#DatePart('d', today)#">
<cfparam name="form.today_month" default="#DatePart('m', today)#">
<cfparam name="form.today_year" default="#DatePart('yyyy', today)#">

<cfset sixty_days_ago = DateFormat(DateAdd("d", -60, today), "m/d/yyyy")>
<cfparam name="form.sda_day" default="#DatePart('d', sixty_days_ago)#">
<cfparam name="form.sda_month" default="#DatePart('m', sixty_days_ago)#">
<cfparam name="form.sda_year" default="#DatePart('yyyy', sixty_days_ago)#">
<!--- end DATE VARIABLES --->


<!--- this code finds all companies who have placed an order within the last 60 days --->
<CFQUERY datasource="#request.dsn#" NAME="get_comp_ids">
SELECT c.id, t.comp_id, t.a_insert_date, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, c.proposed_monthly_transactions, t.order_date
FROM Title t, Companies c
where
t.order_date <= '#sixty_days_ago#'
and c.ID = t.comp_id
and c.test_account = 0
and c.company <> ''
and c.company IS NOT NULL
order by c.Company, order_date DESC
</cfquery>


<cfset all_comp_ids = "">
<cfloop query="get_comp_ids">
<cfif Not ListContains(all_comp_ids, ID, ",")>
<cfset all_comp_ids = ListAppend(all_comp_ids, ID, ",")>
</cfif>
</cfloop>
<cfoutput>



<!---
Company Name
Contact name in Client Interface
Address Listed in ""  
Phone Number ""
# Number of orders in the system for that client that is more than 60 days old that are NOT listed as "loan closed" in status.  
Please ID in spreadsheet if client is Active or Inactive
--->

<cfset query_60_days = QueryNew("Company, Company_ID, Address, Contact_Name, Contact_Number, Orders, Active")>
<cfloop index="this_comp_id" list="#all_comp_ids#" delimiters=",">
<CFQUERY datasource="#request.dsn#" NAME="get_orders_by_comp">
SELECT c.intSales, c.a_status as COMP_STATUS, c.addr1 as COMP_ADDRESS, c.addr2 as COMP_ADDRESS2, c.phone as COMP_PHONE, c.contact_fname as COMP_FNAME, c.contact_lname as COMP_LNAME, c.zip_code as COMP_ZIP, c.city as COMP_CITY, c.state as COMP_STATE, c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status
FROM Title t, Companies c
where c.ID = '#this_Comp_id#'
and t.order_date < '#sixty_days_ago#'
and c.ID = t.comp_id
and t.appraisal_status <> 'Loan Closed'
</cfquery>



<!---Company, Company_ID, Address, Contact_Name, Contact_Number, Orders, Active--->
<cfset temp = QueryAddRow(query_60_days)>
<cfset temp = QuerySetCell(query_60_days, "Company", get_orders_by_comp.Company)>
<cfset temp = QuerySetCell(query_60_days, "Company_ID", this_comp_id)>
<cfset build_address = get_orders_by_comp.COMP_ADDRESS & " " & get_orders_by_comp.COMP_ADDRESS2 & ", " & get_orders_by_comp.COMP_CITY & ", " & get_orders_by_comp.COMP_STATE & " " & get_orders_by_comp.COMP_ZIP>
<cfset temp = QuerySetCell(query_60_days, "Address", build_address)>
<cfset build_contact = get_orders_by_comp.COMP_FNAME & " " & get_orders_by_comp.COMP_LNAME>
<cfset temp = QuerySetCell(query_60_days, "Contact_Name", build_contact)>
<cfset temp = QuerySetCell(query_60_days, "Contact_Number", get_orders_by_comp.COMP_PHONE)>
<cfset temp = QuerySetCell(query_60_days, "Orders", get_orders_by_comp.RecordCount)>
<cfset temp = QuerySetCell(query_60_days, "Active", get_orders_by_comp.COMP_STATUS)>
</cfloop>
</cfoutput>
<cfquery dbtype="query" name="detail"> 
	SELECT *
	FROM query_60_days
    order by Company
</cfquery>


<!--- <cfoutput>
#ListLen(all_comp_ids, ",")#<br>
</cfoutput>
<cfdump var="#detail#">
<cfabort> --->


<cfoutput>
<cfset bgcolor = 'efefef'>
<strong>ALL COMPANIES - Orders 60 Days Old or More, Status NOT 'Loan'Closed'</strong><br>
<font size="-2" face="arial">
<table width-"600">
<tr bgcolor="##99CCFF">
<td align="left" valign="bottom" width="200"><strong>Company Name</strong></td>
<td align="left" valign="bottom" width="200"><strong>Company ID</strong></td>
<td align="left" valign="bottom" width="200"><strong>Address</strong></td>
<td align="left" valign="bottom" width="200"><strong>Contact Name</strong></td>
<td align="left" valign="bottom" width="200"><strong>Company Number</strong></td>
<td align="left" valign="bottom" width="200"><strong>Total Orders</strong></td>
<td align="left" valign="bottom" width="200"><strong>Active Account</strong></td>
</tr>

<cfloop query="detail">
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
<cfif orders NEQ 0>
<tr bgcolor="#bgcolor#">
<!---Company, Company_ID, Address, Contact_Name, Contact_Number, Orders, Active--->
<td align="left" valign="top" width="200">#Company#</td>
<td align="center" valign="top">#Company_id#</td>
<td align="center" valign="top">#Address#</td>
<td align="center" valign="top">#Contact_Name#</td>
<td align="center" valign="top">#Contact_Number#</td>
<td align="center" valign="top">#Orders#</td>
<td align="center" valign="top"><cfif Active eq 1>Y<cfelse>N</cfif></td>
</tr>
</cfif>
</cfloop>
</table>
</font>
</cfoutput>
<cfflush>
<!--- END this code finds all companies who have placed an order within the last 2 weeks --->




</BODY>
</HTML>
