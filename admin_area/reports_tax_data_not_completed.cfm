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
<title>Tax Data Not Completed</title>
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
			SELECT *, t.Name AS TEAM_NAME, a.pstate, ab.abstractor_id
			FROM Title a, doc_title_insurance_title d, tax_cert_title e, doc_abstract_title f, pay_off_lender_1_title g, companies c, teams t, abstractors ab
			WHERE c.test_account = 0
			and c.a_status = 1 and a.title_id = d.title_id and a.title_id = e.title_id and a.title_id = f.title_id and a.title_id = g.title_id and a.comp_id = c.ID
			and ab.abstractor_id = f.abstractor_tax_id
    		and a.cancelled is null
			and (a.title_id = e.title_id AND  e.taxes_completed <> 1)
			and a.order_date > '#DateFormat(DateAdd("d", -30, Now()), "m/d/yyyy")#'
			and c.team_id = t.ID
			and a.appraisal_status <> 'Loan Closed'
			ORDER BY  check_date
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_report2">
			SELECT *, t.Name AS TEAM_NAME, a.pstate, ab.abstractor_id
			FROM Property a, doc_title_insurance_prop d, tax_cert_prop e, doc_abstract_prop f, pay_off_lender_1_prop g, companies c, teams t, abstractors ab
			WHERE c.test_account = 0
			and c.a_status = 1 and a.prop_id = d.prop_id and a.prop_id = e.prop_id and a.prop_id = f.prop_id and a.prop_id = g.prop_id and a.comp_id = c.ID
			and ab.abstractor_id = f.abstractor_tax_id
    		and a.cancelled is null
			and (a.prop_id = e.prop_id AND  e.taxes_completed <> 1)
			and a.order_date > '#DateFormat(DateAdd("d", -30, Now()), "m/d/yyyy")#'
			and c.team_id = t.ID
			and a.appraisal_status <> 'Loan Closed'
			ORDER BY  check_date
	</CFQUERY>



<cfoutput>
<form name="excel_form" action="reports_tax_data_not_completed.cfm?uid=#URL.uid#&al=#URL.al#" method="post">
<input type="hidden" name="excel" value="1">
</form>
</cfoutput>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="excel_submit" type="button" onclick="to_excel();" value="EXPORT TO EXCEL"><br>
<table cellpadding=1 cellspacing=1 border=0 width="100%">
<tr><td align="center"><B>Tax Data Not Completed</B></td></tr>
</table>

<table width=100% cellpadding=1 cellspacing=1 border=0>
				<tr>


<td align="center" width="75"><font size=1 color=black face=verdana><B>Order Date</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Order Num</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Borrower 1</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>State</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Tax Vendor</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Rpt Recv'd</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Status</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Comments</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Events</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Team</B></font></td>
					</tr>
<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">



	<!--- <cfset current_id = 9999999999> --->
	<CFLOOP QUERY="read_report">
	<!--- <cfif title_id neq current_id> --->
		<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_time">
				SELECT *
				FROM Title a, doc_title_insurance_title d
				WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and a.cancelled is null
			</cfquery>
			<cfset a_color_temp = a_bgcolor>
<cfif read_time.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
					<tr>
						<td bgcolor=#a_bgcolor# width=75 align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#DateFormat(check_date, "mm/dd/yyyy")#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1" target="_blank"><FONT FACE=verdana SIZE=1>T-#title_id#</font></a></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#BFirstName1# #BLastName1#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#pstate#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="./abstractors_modify_view.cfm?abstractor_id=#Abstractor_id#&uid=#URL.uid#&al=#URL.al#" target="_abs_window"><font size=1 color=Green face=verdana>#read_report.Company#</font></a></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#DateFormat(read_report.a_date_completed, "m/d/yyyy")# #TimeFormat(read_report.a_time_completed, "HH:mm:ss")#</strong></font></td>
                       <td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#read_report.appraisal_status#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#comp_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#comp_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a></td>
				<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#TEAM_NAME#</font></td>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
				</tr>
				<!--- <cfset current_id = title_id> --->
	</CFOUTPUT>

	<!--- </cfif> --->

	</CFLOOP>








		<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">



	<!--- <cfset current_id = 9999999999> --->
	<CFLOOP QUERY="read_report2">
	<!--- <cfif title_id neq current_id> --->
		<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_time">
				SELECT *
				FROM Property a, doc_title_insurance_prop d
				WHERE a.prop_id = #prop_id# and a.prop_id = d.prop_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and a.cancelled is null
			</cfquery>
			<cfset a_color_temp = a_bgcolor>
<cfif read_time.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
					<tr>
						<td bgcolor=#a_bgcolor# width=75 align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#DateFormat(check_date, "mm/dd/yyyy")#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&a_trigger=1" target="_blank"><FONT FACE=verdana SIZE=1>P-#prop_id#</font></a></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#BFirstName1# #BLastName1#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#pstate#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#read_report2.Company#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#DateFormat(read_report2.a_date_completed, "m/d/yyyy")# #TimeFormat(read_report2.a_time_completed, "HH:mm:ss")#</strong></font></td>
                       <td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#read_report2.appraisal_status#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="./prop_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&company_id=#comp_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&company_id=#comp_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a></td>
				<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#TEAM_NAME#</font></td>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
				</tr>
				<!--- <cfset current_id = title_id> --->
	</CFOUTPUT>

	<!--- </cfif> --->

	</CFLOOP>
	</table>
</body>
</html>
