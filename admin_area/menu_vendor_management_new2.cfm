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
<TABLE cellSpacing=1 cellPadding=1 width="100%" align=center>
	<tr>
    	<td align= "middle" height="76"><IMG style="WIDTH: 980px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  	</tr>
	<TR>
		<TD>
		<CFOUTPUT>
			<cfFORM NAME="Search" METHOD="post" ACTION="https://#cgi.server_name#/admin_area/title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" target="work">
	  			<FONT FACE=ARIAL SIZE=2 color="gray">Quick Search</font><input type=text name="number" size=10 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								><input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM>
</CFOUTPUT>
		</TD>
	</TR>
  	<table>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/closer_add.cfm?uid=#URL.uid#&al=#URL.al#" target="_blank"><font size=2 color=white face=verdana>Closers</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/appraisers_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=purple face=verdana>Appraisers</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/abstractors_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=red face=verdana>Abstractors</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=green face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Vendor Coverage</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=yellow face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=brown face=verdana>Statistics</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=white face=verdana>Web Links</font></a></cfoutput></CENTER>
		<CFIF #role_mgr# eq "1">
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Monitor User</font></a></cfoutput></CENTER>
		<CFElse>
			<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</CFIF>
		<td width="111" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/cancelled_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color="660000" face=verdana>Cancelled</font></a>
				</cfoutput>
				</CENTER>
			</td>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onclick="location.reload()">Refresh</A></center></td>
	</table>
	<tr>
		<TD>
			<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the Vendor Management Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
		</TD>
	</tr>
</TABLE>

<TABLE cellSpacing=1 cellPadding=1 width="45%" align="left">
	<tr>
		<td colspan=5 width=100%>
			<CENTER><B>Abstract Unassigned</B>
		</td>
	</tr>
	<tr>
		<td>
			<Center><font size=1 color=black face=verdana><b>Assign</b></font></CENTER>
		</td>
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
	</tr>

<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Abstract_Not_Assigned">

		<tr>
			<CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#">
			<a href="./title_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" taget="_blank"><CENTER><font size=1 color=red face=verdana><b>A</font></CENTER></a>
			</td>
			<CFELSE>
			<td bgcolor="#a_bgcolor#">
			<a href="./prop_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" taget="_blank"><CENTER><font size=1 color=red face=verdana><b>A</font></CENTER></a>
			</td>
			</CFIF>
			<CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#">
				<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#id#</font></a>
			</td>
			<CFELSE>
			<td bgcolor="#a_bgcolor#">
				<a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-#id#</font></a>
			</td>
			</CFIF>
			<td bgcolor="#a_bgcolor#">
				<CENTER><font size=1 color=black face=verdana><b>
				#DateFormat(a_insert_date, "m/d/yyyy")#</font></CENTER>
			</td>
			<td bgcolor="#a_bgcolor#">
				<CENTER><font size=1 color=black face=verdana><b>
				#DateFormat(DueDate, "m/d/yyyy")#</font></CENTER>
			</td>
			<td bgcolor="#a_bgcolor#" >
				<CENTER><font size=1 color=black face=verdana><b>
				#company#</font></CENTER>
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
			<td colspan=5>
				<CENTER><B>Abstract Assigned Not Received</B></CENTER>
			</td>
		</tr>
		<tr>
			<td width ="20%"><font size=1 color=black face=verdana>
				<CENTER><B>Order Num</B></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><B>Order Date</B></font></CENTER>
			</td>
			<td >
				<CENTER><font size=1 color=black face=verdana><B>Assigned Date</B></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><B>Due Date</B></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><B>Company Name</B></font></CENTER>
			</td>
		</tr>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Abstract_Assigned_Not_Received">

		<tr>
			<CFIF #Letter# eq "T">
			<td width ="20%" bgcolor="#a_bgcolor#">
				<center><a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#id#</font></a></center>
			</td>
			<CFELSE>
			<td bgcolor="#a_bgcolor#">
				<a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-#id#</font></a>
			</td>
			</CFIF>
			<td bgcolor="#a_bgcolor#">
				<CENTER><font size=1 color=black face=verdana><b>
				#DateFormat(a_insert_date, "m/d/yyyy")#</b></font></CENTER>
			</td>
			<td bgcolor="#a_bgcolor#">
				<CENTER><font size=1 color=black face=verdana><b>
				#DateFormat(a_date_assigned, "m/d/yyyy")#</b></font></CENTER>
			</td>
			<td bgcolor="#a_bgcolor#">
				<CENTER><font size=1 color=black face=verdana><b>
				#DateFormat(DueDate, "m/d/yyyy")#</b></font></CENTER>
			</td>
			<td bgcolor="#a_bgcolor#">
				<CENTER><font size=1 color=black face=verdana><b>
				#company#</b></font></CENTER>
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
	</TABLE>
	<TABLE cellSpacing=1 cellPadding=1 width="45%" align=right>
		<!---Top--->
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
	<!---Bottom--->
	</TABLE>
</TABLE>


</body>
</html>