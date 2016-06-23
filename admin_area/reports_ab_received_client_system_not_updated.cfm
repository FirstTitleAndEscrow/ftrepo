<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<!---d3d3d3--->
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Abstract Received, Client Sytem NOT Updated</title>
</head>

<body>

<cfset date_range = CreateODBCDate('9/15/2006')>
<!--- BEGIN --->
<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT a.title_id, a.client_system_updated, a.searchtype, a.order_date
			FROM Title a, doc_abstract_title b
			WHERE
			(a.appraisal_status <> 'Loan Closed' and a.appraisal_status <> 'Loan Closed-Seller Rep' and a.appraisal_status <> 'Loan Funded')
			and (b.abstractor_doc_upload <> '' or b.abstractor_doc_upload2 <> '' or b.abstractor_doc_upload3 <> '')
			and a.order_date > '#DateFormat(DateAdd("d", -30, Now()), "m/d/yyyy")#'
and (a.client_system_updated IS NULL or a.client_system_updated = 0)
	        and b.title_id = a.title_id
	</CFQUERY>


<!--- <cfdump var="#read_report#"><cfabort> --->

<table cellpadding=1 cellspacing=1 border=0 width="100%">
<tr><td align="center"><B>Abstract Received, Client Sytem NOT Updated</B></td></tr>
</table>

<table width=100% cellpadding=1 cellspacing=1 border=0>
				<tr>


<td align="center" width="75"><font size=1 color=black face=verdana><B>Order Date</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Order Num</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Borrower 1</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>State</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Company</B></font></td>
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
<CFQUERY datasource="#request.dsn#" NAME="get_info">
			SELECT a.title_id, a.client_system_updated, a.SearchType, a.BFirstName1, a.BLastName1,  a.pstate, a.appraisal_status, a.comp_id, c.company, a.check_date, c.team_id, t.name
			FROM Title a, companies c, teams t
			WHERE
			a.title_id = #read_report.title_id#
			and  c.id = a.comp_id
			and t.id = c.team_id
</CFQUERY>

	<!--- <cfif title_id neq current_id> --->
		<CFOUTPUT>
			<cfset a_color_temp = a_bgcolor>
<cfif read_report.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
					<tr>
						<td bgcolor=#a_bgcolor# width=75 align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#DateFormat(get_info.check_date, "mm/dd/yyyy")#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#get_info.title_id#&a_trigger=1" target="_blank"><FONT FACE=verdana SIZE=1>T-#get_info.title_id#</font></a></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#get_info.BFirstName1# #get_info.BLastName1#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#get_info.pstate#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#get_info..Company#</strong></font></td>
                       <td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#get_info..appraisal_status#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#get_info.title_id#&company_id=#get_info.comp_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#get_info.title_id#&company_id=#get_info.comp_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a></td>
				<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#get_info.name#</font></td>
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
