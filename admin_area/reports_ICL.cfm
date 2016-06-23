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
<CFPARAM NAME="url.delete" DEFAULT="0">
<CFPARAM NAME="url.al" DEFAULT="0">
<CFPARAM NAME="url.uid" DEFAULT="#session.ft_user_id#">
<!---d3d3d3--->
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
	select * from first_admin

			WHERE ID = #session.ft_user_id#
</CFQUERY>


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
<title>ICL Assigned Report</title>
<script language="javascript">

function to_excel() {
document.excel_form.submit();
}
</script>

</head>
<body>
<cfinclude template="../admin_area/includes/companies.cfm">

<cfif url.delete neq 0>
<CFQUERY datasource="#request.dsn#" NAME="delete_ICL_Assigned">
update Vendor_Tracker_New
set completed = 1
where order_id = #url.delete#
</CFQUERY>
</cfif>


<cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_ICL_Assigned">
SELECT   v.order_id, v.assign_date, v.assigned_price, t.order_date, t.blastname1, t.searchType, f.fname, f.lname, a.company AS Vendor_Name, c.company as Company_Name<!---  --->
FROM      Vendor_Tracker_New v, Title T, Vendors_Stacie a, First_Admin f, Companies c
where v.task = 'ICL' and (v.completed = 0 or v.completed is NULL) and v.order_type = 'T'
and t.title_id = v.order_id
and a.vendor_id = v.vendor_id
and f.ID = v.assigned_by
and c.ID = t.comp_id
and c.ID in (#full_list_comp_ids#)
</CFQUERY>

</cfoutput>

<cfoutput>
<form name="excel_form" action="reports_ICL.cfm?uid=#URL.uid#&al=#URL.al#" method="post">
<input type="hidden" name="excel" value="1">
</form>
</cfoutput>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="excel_submit" type="button" onclick="to_excel();" value="EXPORT TO EXCEL"><br>




<cfoutput>
<TABLE cellSpacing=1 cellPadding=1 width="925" align="Center">
	<tr>
		<td align="center" colspan="9">
 			<B>ICL Assigned Report</B>
		</td>
	</tr>
	<tr>
		<td align="left" valign="top" width="75"><font size=1 color=black face=verdana><b>Order Num</b></font></td>
		<td align="left" valign="top" width="75"><font size=1 color=black face=verdana><b>Order Date</b></font></td>
		<td align="left" valign="top" width="150"><font size=1 color=black face=verdana><b>Company</b></font></td>
		<td align="left" valign="top" width="75"><font size=1 color=black face=verdana><b>Borrower</b></font></td>
		<td align="left" valign="top" width="100"><font size=1 color=black face=verdana><b>ICL Assigned Date</b></font></td>
		<td align="left" valign="top" width="150"><font size=1 color=black face=verdana><b>Vendor</b></font></td>
		<td align="left" valign="top" width="150"><font size=1 color=black face=verdana><b>Assigned By</b></font></td>
		<td align="right" valign="top" width="75"><font size=1 color=black face=verdana><b>Price</b></font></td>
		<td align="right" valign="top" width="75"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
	</tr>
	</cfoutput>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_ICL_Assigned">
<cfset a_color_temp = a_bgcolor>
<cfif read_ICL_Assigned.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
    <tr>
        <td align="left" valign="top" width="75"><font size=1 color=black face=verdana>#order_id#</font></td>
		<td align="left" valign="top" width="75"><font size=1 color=black face=verdana>#dateformat(order_date, "mm/dd/yyyy")#</font></td>
		<td align="left" valign="top" width="150"><font size=1 color=black face=verdana>#Company_Name#</font></td>
		<td align="left" valign="top" width="75"><font size=1 color=black face=verdana>#blastname1#</font></td>
		<td align="left" valign="top" width="100"><font size=1 color=black face=verdana>#dateformat(assign_date, "mm/dd/yyyy")#</font></td>
		<td align="left" valign="top" width="150"><font size=1 color=black face=verdana>#Vendor_Name#</font></td>
		<td align="left" valign="top" width="150"><font size=1 color=black face=verdana>#fname# #lname#</font></td>
		<td align="right" valign="top" width="75"><font size=1 color=black face=verdana>#assigned_price#</font></td>
		<td align="right" valign="top" width="75"><a href="reports_ICL.cfm?delete=#order_id#"><font size=1 color=red face=verdana>remove</font></a></td>
	</tr>
	<CFIF #a_color_trigger# eq "1">
		<CFSET a_bgcolor = "white">
		<CFSET a_color_trigger = "2">
	<CFELSE>
		<CFSET a_bgcolor = "d3d3d3">
		<CFSET a_color_trigger = "1">
	</CFIF>
</CFOUTPUT>

</body>
</html>
