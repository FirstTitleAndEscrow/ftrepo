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

<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<CFPARAM NAME="MaxRows" DEFAULT="1000">
<CFPARAM NAME="StartRow" DEFAULT="1">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT     company
	FROM       tblCServ_Temp_Rep
	WHERE      (intSales = #url.uid#)
	GROUP BY company
	ORDER BY company
</CFQUERY>




<html>
<head>
<title>Sales</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style>
ul { margin-left: 470px;
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
		<!---Harry --->
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
								>
								<input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick z file search">
</cfFORM>
				</CFOUTPUT>
<cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput>
<a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a>

<cfif session.ft_user_id eq 318 or session.ft_user_id eq 472 or session.ft_user_id eq 9 or session.ft_user_id eq 362 or session.ft_user_id eq 449>
<br>
<br>
<a href="reports_tracking.cfm" target="new">Chase/RealEC Turntime Report</a><br>
<br>
</cfif>
<cfif session.ft_user_id eq 449>
<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/reports_secretary_veteran_affairs.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="blank">Secretary Veteran Affairs Report</a><br>
<a href="reports_VRM_opened.cfm" target="_new">File Opened - Title Package not received</a><br>
<a href="reports_VRM_tp_up_no_deed.cfm" target="_new">Title Package Uploaded – No VRM Deed uploaded</a><br>
<a href="reports_VRM_sched_no_prehud.cfm" target="_new">Scheduled – No Pre HUD uploaded</a><br>
<a href="reports_VRM_sched_no_final_hud.cfm" target="_new">Scheduled – No Final HUD uploaded</a><br>
<a href="reports_VRM_sr_loan_closed_no_BTC.cfm" target="_new">SR Loan Closed – No BTC Closing Package uploaded</a><br>
<br>


</cfif>
<!-- check if this person is assigned to a team --->
<CFQUERY datasource="#request.dsn#" NAME="get_parent_id">
	SELECT parent_user_id from First_Admin where ID = #session.ft_user_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_members">
	SELECT members, ID 
	FROM Teams
</CFQUERY>
<cfset all_team_ids = "">
<cfloop query="read_members">
<cfif ListFindNoCase(members, session.ft_user_id, ",") or  ListFindNoCase(members, get_parent_id.parent_user_id, ",")>
<cfset all_team_ids = ListAppend(all_team_ids, id, ",")>
</cfif>
</cfloop>

<cfset session.all_team_ids = all_team_ids>

<cfif ListLen(session.all_team_ids, ",")>

<cfoutput><a href="reports_team_stats.cfm" target="new">Detailed Team Stats</a></cfoutput><br><br>


</cfif>


			</TD>
		</TR>
	</table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px"><!---was in url line 74 ?uid=#URL.uid#&al=#URL.al#&a_trigger=1 --->
		<tr>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/client_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color="660000" face=verdana>Add Client</font></a>
				</cfoutput>
				</CENTER>
			</td>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/client_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>Modify Client</font></a>
				</cfoutput>
				</CENTER>
			</td>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/user_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=green face=verdana>Add User</font></a>
				</cfoutput>
				</CENTER>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/user_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>Modify User</font></a>
				</cfoutput>
				</CENTER>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=yellow face=verdana>Orders</font></a>
				</cfoutput>
				</CENTER>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank">
				<font size=2 color=green face=verdana>Calendar</font>
				</a>
				</cfoutput>
				</CENTER>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank">
				<font size=2 color=red face=verdana>Statistics</font></a>
				</cfoutput>
				</CENTER>

			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/calculator.cfm?uid=#URL.uid#&al=#URL.al#" target="_blank">
				<font size=2 color=blue face=verdana>Premium Calculcator</font></a>
				</cfoutput>
				</CENTER>
			</td>
            <td width="99" bgcolor="#CCD2D2">
				<Center>
				 &nbsp;
				</CENTER>
			</td>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<A HREF="#" onclick="location.reload()">Refresh</A>
				</center>
			</td>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/login_as_client.cfm?uid=#URL.uid#&al=#URL.al#" target="client_window">
				<font size=2 color=blue face=verdana>Login As Client</font></a>
				</cfoutput>
				</CENTER>
			</td>


		</TR>
	</table>
	<ul> 
       <cfinclude template="/admin_area/met/ricks_page.cfm">
	</ul>
	<table width="893">
		<tr>
			<TD>
				<B><P><CENTER>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            	Sales Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></CENTER></P></B>
			</TD>
		</tr>
	</table>

	<table width="893" align="center">
	<CFIF #read_company.RecordCount# gte 1>
		<tr>
			<TD colspan=6><Center><B>Orderdue Items</B></CENTER></TD>
		</tr>
<CFLOOP QUERY="read_company">
	<CFQUERY datasource="#request.dsn#" NAME="read_overdue">
			  select * from
			  tblCServ_Temp_Rep
			  where intSales = #url.uid#
			  and company = '#read_company.company#'
	</CFQUERY>
		<tr>
			<TD colspan=6><Center><B><CFOUTPUT>#read_Company.company#</CFOUTPUT></B></CENTER></TD>
		</tr>
		<TR>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Num</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Event Type</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Borrower Name</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Past Due</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Comments</B>
			</td>
		</TR>

<CFOUTPUT QUERY="read_overdue" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<CFIF #Type# eq "T">
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_overdue.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
				<CFELSE>
				<a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_overdue.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				P-0232#id#
				</font>
				</a>
				</CFIF>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_overdue.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
			</td>
		</tr>

		</CFOUTPUT>

		</CFLOOP>
	</table>

<CFELSE>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<tr>
			<td>
				<CENTER><BOLD>You do not have any Over Due Items for the First Title Clients assigned to you</BOLD></CENTER>
			</td>
		</tr>
	</table>
</CFIF>
</table>

<!---
<cfinclude template="team_popup.cfm">
--->