<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<CFPARAM NAME="letter" DEFAULT="T">
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
<title>Tile Claims / Title Issues</title>
<script language="javascript">

function to_excel() {
document.excel_form.submit();
}
</script>
</head>
<cfset the_date = DateFormat(DateAdd("d", -90, Now()), "mm/dd/yyyy")>
<body>

<CFQUERY datasource="#request.dsn#" NAME="get_claims">
			Select t.*, c.company, c.ID as company_id from title t, companies c where t.title_claim = 1
			and t.comp_id = c.ID
			order by t.a_insert_date
</CFQUERY>

<cfoutput>
<form name="excel_form" action="reports_title_claims_issues.cfm?uid=#URL.uid#&al=#URL.al#" method="post">
<input type="hidden" name="excel" value="1">
</form>
</cfoutput>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="excel_submit" type="button" onclick="to_excel();" value="EXPORT TO EXCEL"><br>

<cfoutput>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center">
	<tr>
		<td align="center"
            <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
              colspan = 8
            <CFELSE>
              colspan= 7
            </CFIF>
            width="100%">
			<B>Title Claims</B>
		</td>
	</tr>
	<tr>
		<td align="center"><font size=1 color=black face=verdana><b>Order Num</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Order Date</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Claim Date</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Claim Age</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Company Name</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>State</b></font></td>
	</tr>
	</cfoutput>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="get_claims">
<CFQUERY datasource="#request.dsn#" NAME="find_note">
			Select n_date from title_notes where n_note = 'Title Claim' and order_id = #get_claims.title_id#
			order by n_date desc
</CFQUERY>
<cfset claim_age = DateDiff("d", find_note.n_date, Now())>

<cfset a_color_temp = a_bgcolor>
<cfif get_claims.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
    <tr>
		<CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#"><a href="title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#get_claims.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#get_claims.title_id#</font></a></td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#"><a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#get_claims.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#get_claims.title_id#</font></a></td>
		</CFIF>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
			#DateFormat(a_insert_date, "m/d/yyyy")#</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
		    #DateFormat(find_note.N_Date, "m/d/yyyy")#</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
		    #claim_age# days</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><a href="client_modify_display.cfm?company_id=#company_ID#&uid=#URL.uid#&al=#URL.al#" target="_company_window"><font size=1 color=blue face=verdana>#company#</font></a></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
			#pstate#</b></font></td>

	</tr>
	<CFIF #a_color_trigger# eq "1">
		<CFSET a_bgcolor = "white">
		<CFSET a_color_trigger = "2">
	<CFELSE>
		<CFSET a_bgcolor = "d3d3d3">
		<CFSET a_color_trigger = "1">
	</CFIF>
</CFOUTPUT><br>
<br>
<br>
<br>
<br>
<CFQUERY datasource="#request.dsn#" NAME="get_claims">
			Select t.*, c.company, c.ID as company_id from title t, companies c where t.title_issue = 1
			and t.comp_id = c.ID
			order by t.a_insert_date
</CFQUERY>
<cfoutput>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center">
	<tr>
		<td align="center"
            <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
              colspan = 8
            <CFELSE>
              colspan= 7
            </CFIF>
            width="100%">
			<B>Title Issues</B>
		</td>
	</tr>
	<tr>
		<td align="center"><font size=1 color=black face=verdana><b>Order Num</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Order Date</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Issue Date</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Issue Age</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Company Name</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>State</b></font></td>
	</tr>
	</cfoutput>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="get_claims">
<CFQUERY datasource="#request.dsn#" NAME="find_note">
			Select n_date from title_notes where n_note = 'Title Issue' and order_id = #get_claims.title_id#
			order by n_date desc
</CFQUERY>
<cfset claim_age = DateDiff("d", find_note.n_date, Now())>

<cfset a_color_temp = a_bgcolor>
<cfif get_claims.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
    <tr>
		<CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#"><a href="title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#get_claims.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#get_claims.title_id#</font></a></td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#"><a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#get_claims.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#get_claims.title_id#</font></a></td>
		</CFIF>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
			#DateFormat(a_insert_date, "m/d/yyyy")#</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
		    #DateFormat(find_note.N_Date, "m/d/yyyy")#</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
		    #claim_age# days</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><a href="client_modify_display.cfm?company_id=#company_ID#&uid=#URL.uid#&al=#URL.al#" target="_company_window"><font size=1 color=blue face=verdana>#company#</font></a></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
			#pstate#</b></font></td>

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
