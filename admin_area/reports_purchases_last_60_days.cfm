<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<CFPARAM NAME="excel" DEFAULT="0">
<!---d3d3d3--->
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<cfoutput>
<cfif #excel# EQ 1>
	<cfset filename = "file.xls">
		<cfcontent type="application/vnd.ms-excel">
<cfheader name="Content-Disposition" value="attachment; filename=#filename#">
#filename#
</cfif>
</cfoutput>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>PURCHASES Last 60 Days</title>
<script language="javascript">

function to_excel() {
document.excel_form.submit();
}
</script>
</head>

<body>

<cfset date_range = CreateODBCDate('9/15/2006')>
<!--- BEGIN --->
<CFQUERY datasource="#request.dsn#" NAME="read_report">
SELECT     t.appraisal_status, t.cancelled, t.Title_ID, t.order_date, t.SearchType, t.comp_id, f.fname AS sales_fname, f.lname AS sales_lname, c.company, t.ip_id
FROM         Companies AS c INNER JOIN
                      First_Admin AS f ON c.intSales = f.ID INNER JOIN
                      Title AS t ON c.ID = t.comp_id
WHERE    ((t.cancelled IS NULL or t.cancelled <> 1) and (t.order_date > '#DateFormat(DateAdd("d",-180,Now()), "m-d-yyyy")#') AND (t.SearchType = 'Purchase') AND (t.seller_rep != '1' and t.seller_rep != 'True') and t.appraisal_status <> 'Loan Closed' and t.appraisal_status <> 'Loan Closed-Seller Rep' and t.appraisal_status <> 'Loan Funded')
<cfif session.mi_admin eq 1>
and c.intsales in (select ID from first_admin where mi_employee = 'True')
</cfif>
<cfif session.mo_admin eq 1>
and c.intsales in (select ID from first_admin where mo_employee = 'True')
</cfif>
</CFQUERY>





<cfoutput>
<form name="excel_form" action="reports_purchases_last_60_days.cfm" method="post">
<input type="hidden" name="excel" value="1">
</form>
</cfoutput>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="excel_submit" type="button" onClick="to_excel();" value="EXPORT TO EXCEL"><br>
<table cellpadding=1 cellspacing=1 border=0 width="100%">
<tr><td align="center"><B>PURCHASES Last 180 Days</B></td></tr>
</table>

<table width=100% cellpadding=1 cellspacing=1 border=0>
				<tr>


<tr>
<td>Order No.</td>
<td>Order Date</td>
<td>Client</td>
<td>Sales Person</td>
<td>Processor</td>
<td>Status</td>
</tr>
					
<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">



	<!--- <cfset current_id = 9999999999> --->
	<CFOUTPUT QUERY="read_report">
	<!--- <cfif title_id neq current_id> --->
		
<cfset proc_name = '--'>
<cfif isDEfined("read_report.ip_id") and read_report.ip_id gt 0>
<CFQUERY datasource="#request.dsn#" NAME="get_proc">
SELECT    * from first_admin where ID = #read_report.ip_id#
</CFQUERY>
<cfset proc_name = get_proc.fname & ' ' & get_proc.lname>
</cfif>
<tr>
<td>T-#read_report.title_id#</td>
<td>#DateFormat(read_report.Order_date, "mm/dd/yyyy")#</td>
<td>#read_report.company#</td>
<td>#read_report.sales_fname# #read_report.sales_lname#</td>
<td>#proc_name#</td>
<td>#read_report.appraisal_status#</td>

							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
				</tr>
				<!--- <cfset current_id = title_id> --->


	<!--- </cfif> --->

	</CFOUTPUT>
	</table>
</body>
</html>
