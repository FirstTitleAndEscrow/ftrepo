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

<CFQUERY datasource="#request.dsn#" NAME="read_Abstract_Not_Assigned">
			Select * from sqlAbstract_Not_Assigned order by a_insert_date
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_Abstract_Assigned_Not_Received">
			Select * from sqlAbstract_Assigned_Not_Received order by a_insert_date
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_Closer_Not_Assigned">
			Select * from sqlCloser_Not_Assigned order by a_insert_date
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_Closer_Assigned_Not_Received">
			Select * from sqlCloser_Assigned_Not_Received order by a_insert_date
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_PropAbstract_Assigned_TaxesByName">
			Select * from sqlPropAbstract_Assigned_TaxesByName
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_TitleAbstract_Assigned_TaxesByName">
			SElect * from sqlTitleAbstract_Assigned_TaxesByName
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_PropAbstract_Assigned_ByNameInHouse">
			Select * from sqlPropAbstract_Assigned_ByNameInHouse
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_TitleAbstract_Assigned_ByNameInHouse">
			Select * from sqlTitleAbstract_Assigned_ByNameInHouse
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_PropAbstract_Assigned_ByName">
			Select * from sqlPropAbstract_Assigned_ByName
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_TitleAbstract_Assigned_ByName">
			Select * from sqlTitleAbstract_Assigned_ByName
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_Todays_Closings">
			SELECT     EventList.Title_id, Title.bfirstname1, Title.blastname1, EventList.c_time, Companies.company
			FROM       Companies RIGHT OUTER JOIN
                       Title ON Companies.ID = Title.comp_id RIGHT OUTER JOIN
                       EventList ON Title.Title_ID = EventList.Title_id
			WHERE     (EventList.c_month = DATEPART(m, GETDATE())) AND (EventList.c_Day = DATEPART(dd, GETDATE())) AND
                      (EventList.c_year = DATEPART(year, GETDATE()))
			ORDER BY EventList.Title_id
</CFQUERY>
<html>
<head>
	<title>Vendor Management</title>
</head>

<body>
<table>
<tr>
	<td colspan=5 width=100%>
			<CENTER><B>Orders Assigned</B>
	</td>
</tr>
<tr>
	<td colspan=5 width=100%>
			<CENTER><B>Taxes/Payoffs</B>
	</td>
</tr>
<tr>
		<td>
			<Center><font size=1 color=black face=verdana><b>Order Num</b></font></CENTER>
		</td>
		<td>
			<CENTER><font size=1 color=black face=verdana><b>Order Date</b></font></CENTER>
		</td>
		<td>
			<CENTER><font size=1 color=black face=verdana><b>Due Date</b></font></CENTER>
		</td>
		<td>
			<CENTER><font size=1 color=black face=verdana><b>Company Name</b></font></CENTER>
		</td>
		<td>
			<CENTER><font size=1 color=black face=verdana><b>Employee Name</b></font></CENTER>
		</td>
	</tr>
	<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_PropAbstract_Assigned_TaxesByName">
	<tr>
		<td bgcolor="#a_bgcolor#">
			<a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#prop_id#</font></a>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(a_Date_Assigned, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(Due_Date, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#company#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#fname# #lname#</font></CENTER>
		</td>
	</tr>
	</CFOUTPUT>
	<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_TitleAbstract_Assigned_TaxesByName">
	<tr>
		<td bgcolor="#a_bgcolor#">
			<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(a_Date_Assigned, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(Due_Date, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#company#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#fname# #lname#</font></CENTER>
		</td>
	</tr>
	<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
	</CFOUTPUT>
	<tr>
		<td colspan=5 width=100%>
			<CENTER><B>Abstracts</B>
		</td>
	</tr>
	<tr>
		<td>
			<Center><font size=1 color=black face=verdana><b>Order Num</b></font></CENTER>
		</td>
		<td>
			<CENTER><font size=1 color=black face=verdana><b>Order Date</b></font></CENTER>
		</td>
		<td>
			<CENTER><font size=1 color=black face=verdana><b>Due Date</b></font></CENTER>
		</td>
		<td>
			<CENTER><font size=1 color=black face=verdana><b>Company Name</b></font></CENTER>
		</td>
		<td>
			<CENTER><font size=1 color=black face=verdana><b>Employee Name</b></font></CENTER>
		</td>
	</tr>
	<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_PropAbstract_Assigned_ByNameInHouse">
	<tr>
		<td bgcolor="#a_bgcolor#">
			<a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#prop_id#</font></a>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(a_Date_Assigned, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(Due_Date, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#company#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#fname# #lname#</font></CENTER>
		</td>
	</tr>
	<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
	</CFOUTPUT>
	<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_TitleAbstract_Assigned_ByNameInHouse">
	<tr>
		<td bgcolor="#a_bgcolor#">
			<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(a_Date_Assigned, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(Due_Date, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#company#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#fname# #lname#</font></CENTER>
		</td>
	</tr>
	<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
	</CFOUTPUT>
	<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_PropAbstract_Assigned_ByName">
	<tr>
		<td bgcolor="#a_bgcolor#">
			<a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#prop_id#</font></a>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(a_Date_Assigned, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(Due_Date, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#company#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#fname# #lname#</font></CENTER>
		</td>
	</tr>
	<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
	</CFOUTPUT>
	<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_TitleAbstract_Assigned_ByName">
	<tr>
		<td bgcolor="#a_bgcolor#">
			<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(a_Date_Assigned, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#">
			<CENTER><font size=1 color=black face=verdana><b>
			#DateFormat(Due_Date, "m/d/yyyy")#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#company#</font></CENTER>
		</td>
		<td bgcolor="#a_bgcolor#" >
			<CENTER><font size=1 color=black face=verdana><b>
			#fname# #lname#</font></CENTER>
		</td>
	</tr>
	<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
	</CFOUTPUT>


</table>
