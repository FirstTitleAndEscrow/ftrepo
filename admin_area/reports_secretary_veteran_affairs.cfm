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
<title>Abstract Unassigned</title>

<style>
TD {font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#000000;}
</style>
<script language="javascript">

function to_excel() {
document.excel_form.submit();
}
</script>

</head>
<body>

<CFQUERY datasource="#request.dsn#" NAME="read_report">
SELECT    *
FROM         Title AS t INNER JOIN
                      EventList AS e ON t.Title_ID = e.Title_id
WHERE     (t.comp_id = '9016' OR
                      t.comp_id = '8307') AND (e.fl_dateandtime IS NULL) OR
                      (t.Title_ID = 52555) order by t.order_date desc
</CFQUERY>


<!--- <cfif cgi.REMOTE_ADDR eq '98.233.100.254'>
<cfdump var="#read_report#">
<cfabort>
</cfif>
 --->
<cfoutput>
<form name="excel_form" action="reports_secretary_veteran_affairs.cfm?uid=#URL.uid#&al=#URL.al#" method="post">
<input type="hidden" name="excel" value="1">
</form>
</cfoutput>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="excel_submit" type="button" onclick="to_excel();" value="EXPORT TO EXCEL"><br>




<cfoutput>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center">
	<tr>
		<td align="center" colspan="10">
			<B>Secretary of Veteran Affairs</B>
		</td>
	</tr>
	<tr>
		<td align="center"><font size=1 color=black face=verdana><b>Order Num</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Order Date</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>State</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Closing Pack Received</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Deed Requested</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Deed Received</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Deed Approved</b></font></td>
		<!--- <td align="center"><font size=1 color=black face=verdana><b>HUD Not Received</b></font></td> --->
		<td align="center"><font size=1 color=black face=verdana><b>HUD Received</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>HUD Approved</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Loan Closed</b></font></td>
	</tr>
	
	</cfoutput>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_report">

<cfset a_color_temp = a_bgcolor>
<cfif read_report.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>

	<cfif read_report.pstate eq 'TX'>
	<cfset prefix = 'T(TX)'>
	<cfelse>
	<cfset prefix = 'T'>
	</cfif>

    <tr>
			<td bgcolor="#a_bgcolor#" align="center">#read_report.title_id#</td>
			<td bgcolor="#a_bgcolor#" align="center">#DateFormat(read_report.order_date, "mm/dd/yyyy")#</td>
			<td bgcolor="#a_bgcolor#" align="center">#read_report.pstate#</td>
			<td bgcolor="#a_bgcolor#" align="center">#DateFormat(read_report.closing_pack_received_datetime, "mm/dd/yyyy")# #TimeFormat(read_report.closing_pack_received_datetime, "hh:mm:ss")#</td>
			<td bgcolor="#a_bgcolor#" align="center">#DateFormat(read_report.deed_requested_datetime, "mm/dd/yyyy")# #TimeFormat(read_report.deed_requested_datetime, "hh:mm:ss")#</td>
			<td bgcolor="#a_bgcolor#" align="center">#DateFormat(read_report.deed_received_datetime, "mm/dd/yyyy")# #TimeFormat(read_report.deed_received_datetime, "hh:mm:ss")#</td>
			<td bgcolor="#a_bgcolor#" align="center">#DateFormat(read_report.deed_approved_datetime, "mm/dd/yyyy")# #TimeFormat(read_report.deed_approved_datetime, "hh:mm:ss")#</td>
			<!--- <td bgcolor="#a_bgcolor#" align="center">#DateFormat(read_report.hud_not_received_datetime, "mm/dd/yyyy")# #TimeFormat(read_report.hud_not_received_datetime, "hh:mm:ss")#</td> --->
			<td bgcolor="#a_bgcolor#" align="center">#DateFormat(read_report.hud_received_datetime, "mm/dd/yyyy")# #TimeFormat(read_report.hud_received_datetime, "hh:mm:ss")#</td>
			<td bgcolor="#a_bgcolor#" align="center">#DateFormat(read_report.hud_approved_datetime, "mm/dd/yyyy")# #TimeFormat(read_report.hud_approved_datetime, "hh:mm:ss")#</td>
			<td bgcolor="#a_bgcolor#" align="center">#DateFormat(read_report.cl_dateandtime, "mm/dd/yyyy")# #TimeFormat(read_report.cl_dateandtime, "hh:mm:ss")#</td>
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
