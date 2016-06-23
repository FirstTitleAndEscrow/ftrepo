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



<CFQUERY datasource="#request.dsn#" NAME="read_Closer_Not_Assigned">
			Select *
			from sqlCloser_Not_Assigned
			where ID != 755 and ID  != 737 and ID != 892<!--- I took out this file for ToRonicia Woods on 3-22-05 & 4-20-05 on orders from Heidi. She said she did not want it deleted just remove it from the view. --->
			order by a_insert_date
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_Closer_Assigned_Not_Received">
			Select * from sqlCloser_Assigned_Not_Received order by a_insert_date
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_Todays_Closings">
			SELECT     EventList.Title_id, Title.bfirstname1, Title.blastname1, EventList.c_time, Companies.company
			FROM       Companies RIGHT OUTER JOIN
                       Title ON Companies.ID = Title.comp_id RIGHT OUTER JOIN
                       EventList ON Title.Title_ID = EventList.Title_id
			WHERE     (EventList.c_month = DATEPART(m, GETDATE())) AND (EventList.c_Day = DATEPART(dd, GETDATE())) AND
                      (EventList.c_year = DATEPART(year, GETDATE()))
			ORDER BY EventList.Title_id
</CFQUERY> <!---   --->
<html>
<head>
	<title>Closings</title>
</head>

<body>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align=center>
	<tr>
    	<td align= "middle" height="76"><IMG style="WIDTH: 980px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  	</tr>
	<TR>
		<TD>
		<CFOUTPUT>
			<cfFORM NAME="Search" METHOD="post" ACTION="https://#cgi.server_name#/admin_area/title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" >
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

<a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a>
		</TD>
	</TR>
	<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput><br></td>
	</tr>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<TR colspan="18">
			<td width="99" align="center" colspan="2">
				<B>Clients</B
			></td>
			<td width="99" align="center" colspan="2">
				<B>Users</B>
			</td>
			<td width="99" align="center" colspan="2">
				<b>Closers</b>
			</td>
			<td width="99" align="center" colspan="2">
				<b>Appraisers</b>
			</TD>
			<td width="99" align="center" colspan="2">
				<b>Abstractors</b>
			</TD>
			<td width="99" align="center" colspan="2">
				<b>Third Parties</b>
			</TD>
			<td width="99" align="center" colspan="2">
				<b>Lenders</b>
			</TD>
			<td width="99" align="center" colspan="2">
				<b>FT Agencies</b>
			</TD>
			<td width="99"align="center" colspan="2">
				<b>Title Ins Co</b>
			</td>
		</TR>
		<TR>
			<cfoutput><td colspan=2 align="center"><a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>A</font></a>&nbsp;&nbsp;&nbsp;<a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=red face=verdana>M</font></a>&nbsp;&nbsp;&nbsp;<A HREF="https://#cgi.server_name#/admin_area/login_as_client.cfm?uid=#URL.uid#&al=#URL.al#" target="client_window"><font size=2 color=red face=verdana>L</font></a></td></cfoutput>
			<td width="45" align="center">
				<CFoutput>
				<a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./user_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./closer_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./closer_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./appraisers_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./appraisers_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</TD>
			<td width="45"align="center">
				<CFoutput>
				<a href="./abstractors_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFOUTPUT>
				<a href="./abstractors_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./tp_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./tp_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./lenders_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./lenders_modify_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./title_FT_Agency_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./title_FT_Agency_modify_Select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./title_Ins_Co_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</TD>
			<td width="45"align="center">
				<CFoutput>
				<a href="./title_Ins_Co_modify_Select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
		  		<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</td>
		</TR>
	</table>
<CFQUERY datasource="#request.dsn#" NAME="get_current_user">
			SELECT *
			FROM First_Admin
			WHERE ID = #session.ft_user_id#
		</CFQUERY>
  	<table>
		<td width="111" bgcolor="#CCD2D2"><cfif get_current_user.streamline_employee eq 1><a href="reo_reports.cfm?" target="reo_reports">REO Reports</a><cfelse>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cfif></td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_choose.cfm?uid=#URL.uid#&al=#URL.al#&trigger=0target="_blank"><font size=2 color=red face=verdana>Processing Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=green face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0" target="_blank"><font size=2 color=blue face=verdana>Vendor Coverage</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_choose.cfm?uid=#URL.uid#&al=#URL.al#&trigger=1target="_blank"><font size=2 color=yellow face=verdana>Closing Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=brown face=verdana>Statistics</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=white face=verdana>Web Links</font></a></cfoutput></CENTER>
		<CFIF #role_mgr# eq "1">
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Monitor User</font></a></cfoutput></CENTER>
		<CFElse>
			<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</CFIF>
		<td width="111" bgcolor="#CCD2D2"><cfif (get_current_user.role_id neq 24 and get_current_user.role_id neq 17) or get_current_user.id eq 322 or get_current_user.id eq 339 or get_current_user.id eq 359>&nbsp;&nbsp;<a href="./met/projects" target="projects">Projects</a><cfelse>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cfif></td>
		<td width="111" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/cancelled_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color="660000" face=verdana>Cancelled</font></a>
				</cfoutput>
				</CENTER>
			</td>
		<td width="111" bgcolor="#CCD2D2"><font size=2 face=verdana><Center><A HREF="#" onclick="location.reload()">Refresh</A></font></center></td>
	    <td width="111" bgcolor="#CCD2D2"><font size=2 face=verdana><Center><a href="./menu_Cleartoclose.cfm?uid=#session.ft_user_id#&al=1" target="report">Clear to Close Report</a></font></td></tr>
<tr>
		<td colspan=3><cfif get_current_user.streamline_employee eq 'True'>
<a href="streamline_lp_report.cfm?uid=#url.uid#" target="new"><font size=3>Streamline Loan
Processor Report</a></font><br><br>
</cfif></td></tr>
    </table>
	<center>
	<table>
	<tr>
		<TD>
			<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the Closing Department Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
		</TD>
	</tr>
</TABLE>
</center>

	<TABLE cellSpacing=1 cellPadding=1 width="100%" align=right>
		<tr>
			<td colspan=6>
				<CENTER><B>Closer Not Assigned</B></CENTER>
			</td>
		</tr>
		<tr>
			<td>
				<Center><font size=1 color=black face=verdana><b>Assign</b></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><b>
				Order Num</b></font></CENTER>

			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><b>
				Order Date</b></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><b>
				Due Date</b></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><b>
				Company Name</b></font></CENTER>
			</td>
		</tr>


<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Closer_Not_Assigned">
		<tr>
			<CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#">
			<a href="./title_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" taget="_blank"><CENTER><font size=1 color=red face=verdana><b>A</font></CENTER></a>
			</td>
			<CFELSE>
				<td bgcolor="#a_bgcolor#">
				<a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" taget="_blank"><CENTER><font size=1 color=red face=verdana><b>A</font></CENTER></a>
			</td>
			</CFIF>
			<CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#">
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#id#</font></a>
			</td>
			<CFELSE>
			<td bgcolor="#a_bgcolor#">
				<a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#id#</font></a>
			</td>
			</CFIF>
			<td bgcolor="#a_bgcolor#">
				<CENTER><font size=1 color=black face=verdana><b>
				#DateFormat(a_insert_date, "m/d/yyyy")#</b></font></CENTER>
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

		<tr>
			<td><br></td>
			<td><br></td>
		</tr>
		<tr>
			<td colspan=6>
				<CENTER><B>Closer Assigned Not Received</B></CENTER>
			</td>
		</tr>
		<tr>
			<td>
				<CENTER><font size=1 color=black face=verdana><b>
				Order Num</b></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><b>
				Order Date</b></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><b>
				Assigned Date</b></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><b>
				Due Date</b></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><b>
				Company Name</b></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><b>
				Closer</b></font></CENTER>
			</td>
		</tr>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Closer_Assigned_Not_Received">
		<tr>
			<CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#"><Center>
				<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#id#</font></a>
				</CENTER>
			</td>
			<CFELSE>
			<td bgcolor="#a_bgcolor#">
				<center>
				<a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#id#</font></a>
				</center>
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
			<td bgcolor="#a_bgcolor#">
				<CENTER><font size=1 color=black face=verdana><b>
				#closer#</b></font></CENTER>
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
<!---</TABLE>--->

<cfinclude template="team_popup.cfm">
</body>
</html>