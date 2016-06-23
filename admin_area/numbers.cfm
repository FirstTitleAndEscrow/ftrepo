<cfparam name="url.uid" default="0">


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

<cfparam name="url.sort_order_1" default="Company">
<cfparam name="url.sort_order_2" default="Company">
<cfparam name="url.sort_order_3" default="Company">
<cfparam name="url.sort_order_4" default="Company">
<cfparam name="url.deactivate" default="no">
<cfparam name="form.deactivate_me" default="">




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<style>

td {
	font-family: Arial, Helvetica, sans-serif;
	letter-spacing: normal;
	text-align: center;
	vertical-align: middle;
	word-spacing: normal;
	display: table;
	margin: 6px;
	padding: 6px;
	border: thin solid #330099;
	clear: none;
	float: none;
	height: auto;
}

table {
	font-family: Arial, Helvetica, sans-serif;
	letter-spacing: normal;
	text-align: center;
	vertical-align: middle;
	word-spacing: normal;
	display: table;
	margin: 6px;
	padding: 6px;
	border: thin solid #330099;
	clear: none;
	float: none;
	height: auto;
}

</style>

</HEAD>

<BODY BGCOLOR="ffffff" TEXT="Black" LINK="Blue" VLINK="Blue" ALINK="Blue" BACKGROUND="./" TopMargin=0 LeftMargin=0 MarginHeight=0 MarginWidth=0>



<!--- THIS CODE SETS UP ALL THE DATE VARIABLES WE'LL NEED --->

<cfset today = DateFormat(Now(), "m/d/yyyy")>

<cfset two_weeks_ago = DateFormat(DateAdd("d", -14, today), "m/d/yyyy")>

<cfset thirty_days_ago = DateFormat(DateAdd("d", -30, today), "m/d/yyyy")>
<!--- end DATE VARIABLES --->


<!--- this code finds all companies who have placed an order within the last 2 weeks --->
<CFQUERY datasource="#request.dsn#" NAME="total_orders">
SELECT c.id, t.comp_id, t.title_id, t.oda_day, t.oda_month, t.oda_year, c.Company, c.a_date, t.a_insert_date, c.proposed_monthly_transactions, t.order_date, t.pname, t.pphone, t.appraisal_status
FROM Title t, Companies c
where t.order_date >= '#two_weeks_ago#'
and t.order_date <= '#today#'
and c.ID = t.comp_id
and c.test_account = 0
order by t.order_date DESC
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="total_cancelled_orders">
SELECT cancelled
FROM Title t, Companies c
where t.order_date >= '#two_weeks_ago#'
and t.order_date <= '#today#'
and c.ID = t.comp_id
and c.test_account = 0
and cancelled = 1
</cfquery>



<cfquery datasource="#request.dsn#" name="total_closed_orders"> 
	SELECT t.appraisal_status, t.title_id, c.request_date, comp.a_status, comp.test_account
	FROM Title t, Title_Closing_Order_Request c, Companies comp
	where c.request_date >= '#two_weeks_ago#'
    and c.request_date <= '#today#'
	and t.title_ID = c.title_id
	and comp.ID = t.comp_id
    and comp.test_account = 0
	and comp.a_status = 1

	and t.appraisal_status = 'Loan Closed'
	order by c.request_date, t.title_id
</cfquery>
	
	

<!--- END this code finds all companies who have placed an order within the last 2 weeks --->
<center>
<br>
<br>
<br>

<table width="700" border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td align="center" valign="top" colspan="3"><font size=4 face="Arial"><strong>Two Week Totals</strong> - <cfoutput>#DateFormat(two_weeks_ago, "m/d/yyyy")# - #DateFormat(today, "m/d/yyyy")#</cfoutput></font></td>
  </tr>
  <tr>
    <td align="center" valign="top" bgcolor="#CCCCCC" width="33%"><font size=4 face="Arial">Total&nbsp;Orders</font></td>
    <td align="center" valign="top" bgcolor="#CCCCCC" width="33%"><font size=4 face="Arial">Cancelled&nbsp;Orders</font></td>
    <td align="center" valign="top" bgcolor="#CCCCCC" width="33%"><font size=4 face="Arial">Closed&nbsp;Loans</font></td>
  </tr>
<CFOUTPUT>
  <tr>
    <td align="center" valign="top" bgcolor="##FFFFCC"><font size=12 face="Arial"><strong>#total_orders.recordcount#</strong></font></td>
    <td align="center" valign="top" bgcolor="##FFFFCC"><font size=12 face="Arial" color="red"><strong>#total_cancelled_orders.recordcount#</strong></font></td>
    <td align="center" valign="top" bgcolor="##FFFFCC"><font size=12 face="Arial" color="green"><strong>#total_closed_orders.recordcount#</strong></font></td>
  </tr>
 </CFOUTPUT>
</table>

</center>


</BODY>
</HTML>
