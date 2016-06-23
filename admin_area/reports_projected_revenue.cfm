<cfparam name="url.uid" default="0">
<cfparam name="session.ft_user_id" default="0">


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









<!--- THIS CODE SETS UP ALL THE DATE VARIABLES WE'LL NEED --->
<cfparam name="form.end_date" default="">
<cfparam name="form.start_date" default="">
<cfparam name="form.clients" default="All">
<cfparam name="form.sales_people" default="All">
<cfparam name="form.loans_closed" default="0">
<cfparam name="form.loans_closed_seller_rep" default="0">
<cfparam name="form.loans_funded" default="0">


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
<cfset start_date = DateFormat(DateAdd("d", -30, end_date), "m/d/yyyy")>
</cfif>

<cfset sixty_days_ago = DateFormat(DateAdd("d", -30, start_date), "m/d/yyyy")>


<cfset thirty_days_ago = DateFormat(DateAdd("d", -30, end_date), "m/d/yyyy")>
<cfparam name="form.tda_day" default="#DatePart('d', thirty_days_ago)#">
<cfparam name="form.tda_month" default="#DatePart('m', thirty_days_ago)#">
<cfparam name="form.tda_year" default="#DatePart('yyyy', thirty_days_ago)#">
<!--- end DATE VARIABLES --->



<cfif session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.ft_user_id eq 248 or session.role_id eq 34>
<CFQUERY datasource="#request.dsn#" NAME="all_sales_people">
SELECT     ID, fname, lname, username, status
FROM         First_Admin
WHERE     (role_id = 24) AND (status = 1 or status IS NULL) AND (va_employee IS NULL OR
                      va_employee = 0) AND (mi_employee IS NULL OR
                      mi_employee = 0) AND (mo_employee IS NULL OR
                      mo_employee = 0) AND (mi_flushing_employee IS NULL OR
                      mi_flushing_employee = 0) AND (tx_employee IS NULL OR
                      tx_employee = 0)  AND (ft_fairfax_employee IS NULL OR
                      ft_fairfax_employee = 0) AND (ID NOT IN (327, 264, 450)) OR
                      (ID = 319) OR
                      (ID = 408)
					  or (ID = 59)
					  or (ID = 56)
					  or (ID = 294)
ORDER BY lname
</cfquery>
<cfset sales_ids = ValueList(all_sales_people.ID, ",")>
<cfif form.sales_people neq 'All'>
<cfset sales_ids = form.sales_people>
</cfif>

</cfif>


<cfoutput>
<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:12px}
.table_border {border-style:solid; border-color:##000000; border-width:thin;}
</style>
<form action="reports_projected_revenue.cfm?sort_order_3=#url.sort_order_3#&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#" method="post" name="sale_stats_form">
<cfset bgcolor = 'efefef'>
<table  class="table_border">
<tr>
<td colspan=3 align="top" valign="left"><span class="table_header"><strong>Date Range</strong></span></td>
<cfif session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.ft_user_id eq 248 or session.role_id eq 34><td align="top" valign="left"><span class="table_header"><strong>Salesperson</strong></span></td></cfif><td align="top" valign="left"><span class="table_header"><strong>Include</strong></span></td>
</tr>
<tr>
<td align="bottom" valign="left"><span class="table_header">Start Date</span></td>
<td align="bottom">&nbsp;</td>
<td align="bottom" valign="left"><span class="table_header">End Date</span></td>
<cfif session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.ft_user_id eq 248 or session.role_id eq 34>
<td rowspan=3 align="top" valign="left"> <SELECT NAME="sales_people"	multiple		
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
							</SELECT></td>
</cfif>
<td align="top" valign="left" rowspan=3><input type="checkbox" name="loans_closed" value=1> Loans Closed<br>
<input type="checkbox" name="loans_funded" value=1> Loans Funded<br>
<input type="checkbox" name="loans_closed_seller_rep" value=1> Loans Closed(Seller Rep)<br>
</td>
</tr>
<tr>
<td align="top" valign="left"><input type="text" name="start_date" value="#start_date#"></td>
<td align="middle" valign="center"><span class="table_header">-</span></td>
<td align="top" valign="left"><input type="text" name="end_date" value="#end_date#" onFocus="this.blur();"></td>
</tr>
<tr>
<td  align="top" valign="left" colspan=3><input name="submit" type="submit" value="Refresh"></td>
</tr>
</table>
<br>
<br>
<br>

</cfoutput>


<cfset odbc_start_date = CreateODBCDate(start_date)>
<cfset odbc_end_date = CreateODBCDate(end_date)>
<cfset odbc_sixty_days = CreateODBCDate(sixty_days_ago)>

<!--- this code finds all companies who have NOT placed an order within the last 30 days --->
<CFQUERY datasource="#request.dsn#" NAME="get_records">
SELECT   h.a_1101_borrower_titleservices, h.a_1108_underwriterpremiumportion, t.title_id, c.Company, c.intsales, c.a_date, c.proposed_monthly_transactions, f.fname, f.lname, t.appraisal_status
FROM  Companies c, First_Admin f, Title t, HUD2010_TITLE_DATA h
where (c.a_status = 1)
<cfif form.sales_people neq 'ALL'>
and c.intSales in (#form.sales_people#)
</cfif>
and (c.test_account = 0 or c.test_account IS NULL)
<cfif session.role_id eq 34>
and c.streamline_client <> 1
</cfif>
<cfif session.ft_user_id neq 59 and session.ft_user_id neq 56 and session.ft_user_id neq 248 and session.ft_user_id neq 450 and session.ft_user_id neq 460>
and (c.intSales = '#session.ft_user_id#')
		<cfif session.mi_admin eq 1>
		and (c.intSales in (select ID from first_admin where role_id = 24 and mi_employee = 'True'))
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
		<cfelseif session.mo_admin eq 1>
		and (c.intSales in (select ID from first_admin where role_id = 24 and mo_employee = 'True'))
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
		<cfelseif session.mi_flushing_admin eq 1>
		and (c.intSales in (select ID from first_admin where role_id = 24 and mi_flushing_employee = 'True'))
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
		<cfelseif session.va_admin eq 1>
		and (c.intSales IN (Select ID from First_Admin where va_employee = 'True'))
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
		<cfelseif session.tx_admin eq 1>
		and (c.intSales IN (Select ID from First_Admin where tx_employee = 'True'))
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
		<cfelseif session.ft_fairfax_admin eq 1>
		and (c.intSales IN (Select ID from First_Admin where ft_fairfax_employee = 'True'))
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
		</cfif>
		<cfif session.ft_user_id eq 327>
		and c.ID = 3276
		</cfif>
		<cfif session.ft_user_id eq 322 or  session.ft_user_id eq 339>
		and c.team_id = 21
		</cfif>
</cfif>
and (t.order_date between  #odbc_sixty_days# and #odbc_end_date#)
and t.cancelled IS NULL
<cfif form.loans_closed eq 0>
and t.appraisal_status <> 'Loan Closed'
</cfif>
<cfif form.loans_closed_seller_rep eq 0>
and t.appraisal_status <> 'Loan Closed-Seller Rep'
</cfif>
<cfif form.loans_funded eq 0>
and t.appraisal_status <> 'Loan Funded'
</cfif>
and c.IntSales = f.ID
and t.comp_id = c.ID
and h.title_id = t.title_id
order by t.title_id DESC
</cfquery>




<cfset last_comp_id = 0000>
<cfset active_query = QueryNew("Company, Comp_ID, Proposed, Last_Order, Sign_up, Proc_Name, Proc_Phone, Team, Sales")>

 <cfoutput query="get_records">

<cfset total_revenue = 0>
<cfset expected_revenue = get_records.a_1101_borrower_titleservices - a_1108_underwriterpremiumportion>


<cfset bgcolor = 'efefef'>
<strong>ACTIVE COMPANIES, NO ORDERS </strong>: <cfoutput>#start_date# - #end_date# (but HAS ordered since #sixty_days_ago#)</cfoutput><br>
<font size="-2" face="arial">

<table width-"600">
<tr bgcolor="##99CCFF">
<td align="left" valign="bottom" width="200"><strong><a href="blank.cfm?sort_order_3=Company&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Company"><em>Company Name</em><cfelse>Company Name</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_3=Last_Order&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Last_Order"><em>Date of Last Order</em><cfelse>Date of Last Order</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_3=Sign_Up&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Sign_Up"><em>Company Sign-Up Date</em><cfelse>Company Sign-Up Date</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_3=Proc_Name&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Proc_Name"><em>Processor Name</em><cfelse>Processor Name</cfif></a></strong></td>
<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_3=Proc_Phone&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Proc_Phone"><em>Processor Phone</em><cfelse>Processor Phone</cfif></a></strong></td>


<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_3=Team&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Team"><em>Team</em><cfelse>Team</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_3=Sales&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Sales"><em>Sales Person</em><cfelse>Sales Person</cfif></a></strong></td>


<!--- <td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_3=Total_Cancelled&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Total_Cancelled"><em>Total Cancelled</em><cfelse>Total Cancelled</cfif></a></strong></td>

<td align="right" valign="bottom"><strong><a href="blank.cfm?sort_order_3=Total_Closed&UID=#url.uid#&al=1&sort_order_1=#url.sort_order_1#&sort_order_2=#url.sort_order_2#&sort_order_4=#url.sort_order_4#"><cfif sort_order_3 eq "Total_Closed"><em>Total Closed</em><cfelse>Total Closed</cfif></a></strong></td>
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
<td align="center" valign="top">#DateFormat(detail.Last_order, "m/d/yyyy")#</td>
<td align="center" valign="top">#DateFormat(detail.Sign_Up, "m/d/yyyy")#</td>
<td align="center" valign="top">#detail.Proc_Name#</td>
<td align="center" valign="top">#detail.Proc_Phone#</td>
<td align="center" valign="top">#detail.Team#</td>
<td align="center" valign="top">#detail.sales#</td>
<!--- <td align="center" valign="top">#detail.Total_Cancelled#</td>
<td align="center" valign="top">#detail.Total_Closed#</td>
 ---><td align="center" valign="top"><!--- <input type="checkbox" name="deactivate_me" id="deactivate_me" value="#detail.comp_id#"> ---></td>
</tr>
</cfoutput>
</table>
</font>
<!--- END this code finds all companies who have NOT placed an order within the last 30 days ---><br>

<cfflush>
</BODY>
</HTML>
