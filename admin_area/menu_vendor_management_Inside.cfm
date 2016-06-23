<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<CFPARAM NAME="role_mgr" DEFAULT="">

<CFSET MaxRows = 1000>
<CFSET StartRow = 1>

<!---Do a group by to get all of the names --->
<CFQUERY datasource="#request.dsn#" NAME="proc_name">
		SELECT     ID, fname, lname
		FROM         First_Admin
		WHERE     (role_id = 29) AND (status = 1)
		GROUP BY ID, fname, lname
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_login">
		SELECT     *
		from First_Admin where ID = #session.ft_user_id#
</CFQUERY>


<html>
<head>
<title>Processing</title>
<style> 
ul { margin-left: 0px;
			margin-right: 150px; 
			margin-top: 10px;
}

</style>
</head>

<body>

<table width="893" cellpadding=1 cellspacing=1 border=0 bgcolor=white></table>
	<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
  		<tr>
    		<td align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  		</tr>
		<TR>
			<TD>
<CFOUTPUT>
<cfFORM NAME="Search" METHOD="post" ACTION="https://#cgi.server_name#/admin_area/title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#">
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
		<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput></td></tr>
	</table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<TR >
			<td width="99" align="left"colspan=2>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Clients</B>
			</td>
			<!---

			<td width="99" align="center" colspan="2">
				<b>Closers</b>
			</td>
			<td width="99" align="center" colspan="2">
				<b>Appraisers</b>
			</TD>
			<td width="99" align="center" colspan="2">
				<b>Abstractors</b>
			</TD>
			--->
			<td width="99" align="center" colspan="2">
				<b>Vendors</b>
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
			<!---<td width="45" align="center">
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
			</TD>--->
			<!---
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
			--->
			<td width="45" align="center">
				<CFOUTPUT>
				<a href="./vendor_modify_choose.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./vendor_add2.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
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
			<td width="45" align="center">
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
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px;">
<cfif (get_current_user.role_id neq 24 and get_current_user.role_id neq 17) or get_current_user.id eq 322 or get_current_user.id eq 339 or get_current_user.id eq 359><td width="111" bgcolor="#CCD2D2"><Center><a href="./met/projects" target="projects"><font size=2 color=blue face=verdana>Projects</font></a></td>
</cfif>

<cfif get_login.streamline_employee eq 1><td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/reo_reports.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_new"><font size=2 color=blue face=verdana>REO Reports</font></a></cfoutput></td>
		<cfelse>
<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</cfif>


		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Statistics</font></a></cfoutput></td>
		<td width="111" bgcolor="#CCD2D2"><cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/cancelled_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color="660000" face=verdana>Cancelled</font></a>
				</cfoutput>
				</CENTER>	</td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>

			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>

		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onclick="location.reload()">Refresh</A></center></td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=red face=verdana>Vendor-Cov</font></a></cfoutput></CENTER>	</td>
		<td width="111" bgcolor="#CCD2D2"><Center><CFoutput><a href="./menu_Cleartoclose.cfm?uid=#session.ft_user_id#&al=1" target="report"><font size=2 color=red face=verdana>Clear To Close Report</font></a></cfoutput></CENTER></td></tr>

<tr>
		<td colspan=3><cfif get_login.streamline_employee eq 'True'>
			<ul> 
		<!--- New Reports Menu --->
       <cfinclude template="/admin_area/met/ricks_page.cfm">
	</ul>
<a href="streamline_lp_report.cfm?uid=#url.uid#" target="new"><font size=3>Streamline Loan
Processor Report</a></font><br><br>
</cfif>
<cfif get_login.streamline_employee eq 'True'>
<a href="streamline_order_feed.cfm?uid=<cfoutput>#url.uid#&al=#url.al#</cfoutput>" target="new"><font size=3>Streamline Automatic Order Feeder</a></font><br><br>
</cfif>

<cfif session.ft_user_id eq 64>
<cfoutput>
			<A href="https://machine1.firsttitleservices.com/admin_area/reports_abstract_unassigned.cfm?uid=#session.ft_user_id#&al=0" target="reports">Abstract Unassigned</A><br>
			<br>
			<A href="https://machine1.firsttitleservices.com/admin_area/reports_abstract_assigned_not_received.cfm?uid=#session.ft_user_id#&al=0" target="reports">Abstract Assigned Not Received</A><br><br>
</cfoutput>

</cfif>

</td></tr>
	</table>
	

	
	<center>
		<table width="893">
		<tr>
			<TD>
				<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            	Vendor Management Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
			</TD>
		</tr>
	</table>
	</center>



		<!---Loop through one name at a time --->
		<CFLOOP QUERY="proc_name">
			<CFQUERY datasource="#request.dsn#" NAME="read_TitleAbstract_Assigned_ByName">
				Select * from sqlAbstract_InHouse where vendor_mgmt_InHouse_ID = #proc_name.ID#
				order by title_id
			</CFQUERY>
			<!---<CFQUERY datasource="#request.dsn#" NAME="read_TitleAbstract_Assigned_ByName">
				Select * from sqlPropAbstract_Assigned_ByName where abstract_ID = #proc_name.ID#
			</CFQUERY>--->


	<table width="893" align="center">
		<tr>
			<TD colspan=6><Center><B>Waiting to be completed by <cfoutput>#read_TitleAbstract_Assigned_ByName.fname# #read_TitleAbstract_Assigned_ByName.lname#</cfoutput></B></CENTER></TD>
		</tr>
		<TR>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Num</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Assigned Date</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Due Date</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Client</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Borrower Name</B>
			</td>

		</TR>
		<CFOUTPUT QUERY="read_TitleAbstract_Assigned_ByName" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<CFIF #Letter# eq "T">
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_TitleAbstract_Assigned_ByName.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
				</CFIF>
				<CFIF #Letter# eq "P">
				<a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_TitleAbstract_Assigned_ByName.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#title_id#</font></a>
				</CFIF>

			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(a_Date_Assigned, "m/d/yyyy")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(Due_Date, "m/d/yyyy")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#BFirstName1# #BLastName1#
			</td>
		</tr>
		</CFOUTPUT>
		<!---<CFOUTPUT QUERY="read_PropAbstract_Assigned_ByName" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_TitleAbstract_Assigned_ByName.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(a_Date_Assigned, "m/d/yyyy")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(Due_Date, "m/d/yyyy")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#BFirstName1# #BLastName1#
			</td>
		</tr>
		</CFOUTPUT>--->
	</table>
	</CFLOOP>
</table>

<!---
<cfinclude template="team_popup.cfm">
--->