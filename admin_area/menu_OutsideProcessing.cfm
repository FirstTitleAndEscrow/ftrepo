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


<CFQUERY datasource="#request.dsn#" NAME="read_user">
	select * from first_admin

			WHERE ID = #session.ft_user_id#
</CFQUERY>


<!--- <CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT     company
	FROM      companies
	WHERE      (intSales = #url.uid#)
	ORDER BY company
</CFQUERY>
 --->


<cfif session.ft_user_id eq 327>
<cflocation url="title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" addtoken="no">
</cfif>



<html>
<head>
<title>Sales</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style> 
ul { margin-left: 0px;
			margin-right: 150px; 
			margin-top: 10px;
}

</style>
</head>

<body bgcolor="white">

<table width="893" cellpadding=1 cellspacing=1 border=0 bgcolor=white></table>
	<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
  		<tr>
    		<td align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  		</tr>
		<!---Harry --->
		<TR>
			<TD align="left">
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
								>
								<input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM>
</CFOUTPUT><a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a>
			</TD>

		</TR>
		<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput></td></tr>
	</table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<tr>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/client_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
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
			<td width="99" bgcolor="#CCD2D2"><Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/login_as_client.cfm?uid=#URL.uid#&al=#URL.al#" target="client_window">
				<font size=2 color=blue face=verdana>Login As Client</font></a>
				</cfoutput>
				</CENTER></td>
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
				<CFoutput>
				<cfif IsDefined("session.ft_user_id") and (session.va_admin eq 1 or session.ft_fairfax_admin eq 1 or session.mi_admin eq 1  or session.mo_admin eq 1 or session.mi_flushing_admin eq 1 or session.tx_admin eq 1 or session.ft_user_id eq 319 or session.ft_user_id eq 426 or session.ft_user_id eq 366)>
				<a href="calendar_choose.cfm?uid=#URL.uid#&al=#URL.al#&trigger=0" target="_blank">
				<font size=2 color=green face=verdana>Calendar</font>
				</a>
				<cfelseif IsDefined("session.ft_user_id") and (session.mo_admin eq 0 and session.mi_admin eq 0 and session.mi_flushing_admin eq 0 and session.va_admin eq 0 and session.ft_fairfax_admin eq 0 and session.tx_admin eq 0)>
				<a href="https://#cgi.server_name#/admin_area/Calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank">
				<font size=2 color=green face=verdana>Calendar</font>
				</a>
				</cfif>

				</cfoutput>
				</CENTER>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank">
				<font size=2 color=red face=verdana>Statistics</font></a>
				</cfoutput>
				</CENTER>
			<cfif session.ft_user_id eq 320 or (read_user.role_id eq 24)>
			<td width="99" bgcolor="#CCD2D2">
				<Center>

				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/Sales_Commission_Report_Date.cfm?uid=#url.uid#" target="_blank">
				<font size=2 color="660000" face=verdana>Sales Comm.</font></a>
				</cfoutput>

				</CENTER>
			</td>
			</cfif>
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
				<A HREF="#" onClick="location.reload()">Refresh</A>
				</center>
			</td>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<a href="my_client_list.cfm" target="_new">My Client List</a>
				</center>
			</td>


		</TR>
		
		<tr>
		<td colspan=4><cfif read_user.streamline_employee eq 'True'>
<a href="streamline_lp_report.cfm?uid=#url.uid#" target="new"><font size=3>Streamline Loan
Processor Report</a></font><br>
</cfif>
	<ul> 
		<!--- New Reports Menu --->
       <cfinclude template="/admin_area/met/ricks_page.cfm">
	</ul>
<cfif session.ft_user_id eq '411' or session.ft_user_id eq '410' or session.ft_user_id eq '418' or session.ft_user_id eq '612'>
<font size=3><a href="reports_abstract_unassigned.cfm?uid=#URL.uid#&al=0" target="abstract_unassigned">Abstract Unassigned</a><br>
<a href="reports_abstract_assigned_not_received.cfm?uid=#URL.uid#&al=0" target="abstract_assigned_not_received">Abstract Assigned Not Received</a></font><br>
</cfif>

<a href="https://#cgi.server_name#/admin_area/met/fee_generator_hits_by_company.cfm" target="new"><font size=3>Calculator Hits by Client</a></font><br>
<a href="https://#cgi.server_name#/admin_area/met/projects/" target="new"><font size=3>Projects</a></font><br>

<a href="./menu_Cleartoclose.cfm?uid=<cfoutput>#session.ft_user_id#</cfoutput>&al=1" target="report"><font size=2 color=red face=verdana>Clear To Close Report</font></a><br>
<font size=3>
<cfif session.ft_user_id eq 409 or session.ft_user_id eq 418 or session.ft_user_id eq 413 or session.ft_user_id eq 415 or session.ft_user_id eq 556 or session.ft_user_id eq 497 or session.ft_user_id eq 408 or session.ft_user_id eq 410 or session.ft_user_id eq 411>
<cfoutput><a href="https://#cgi.SERVER_NAME#/admin_area/reports_simple_complex.cfm?uid=#session.ft_user_id#&al=0" target="simple_report" >Simple/Complex Not Clear to Close Report</a><br></cfoutput>
<cfoutput><a href="https://#cgi.SERVER_NAME#/admin_area/reports_waiting_on_docs.cfm?uid=#session.ft_user_id#" target="waiting_report" >Waiting on Docs</a><br></cfoutput>
<cfoutput><a href="https://#cgi.SERVER_NAME#/admin_area/reports_subordination_needed.cfm?uid=#session.ft_user_id#&al=0" target="waiting_report" >Subordination Needed Report</a><br></cfoutput>

</cfif>

<cfif session.ft_user_id eq 612>
<cfoutput><a href="https://#cgi.SERVER_NAME#/admin_area/reports_waiting_on_docs.cfm?uid=#session.ft_user_id#" target="waiting_report" >Waiting on Docs</a><br></cfoutput>
</cfif>


<cfif session.ft_user_id eq 512 or session.ft_user_id eq 503 or session.ft_user_id eq 612>
<cfoutput><a href="https://#cgi.SERVER_NAME#/admin_area/reports_subordination_needed.cfm?uid=#session.ft_user_id#&al=0" target="waiting_report" >Subordination Needed Report</a><br><BR></cfoutput>
</cfif>


<cfif session.ft_user_id eq 386 or session.ft_user_id eq 481 or session.ft_user_id eq 415 or session.ft_user_id eq 556 or session.ft_user_id eq 410 or session.ft_user_id eq 503>
<a href="reports_funded_without_policy.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Loan Funded Policy Not Uploaded</a><BR>
<a href="report_funded_without_recording.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Loan Funded Recording Not Uploaded</a><BR>
</cfif>


<cfif session.ft_User_id eq '515' or session.ft_User_id eq '411' or session.ft_User_id eq '418'>
<a href="prop_reports_typed.cfm" target="blank">Prop Reports - TYPED</a><BR>
</cfif>



<cfif session.ft_user_id eq 410 or session.ft_user_id eq 411>
<cfoutput><a href="https://#cgi.SERVER_NAME#/admin_area/cancelled_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="simple_report" >Cancelled Files</a><br></cfoutput>
<br>
</cfif>
<cfif session.ft_user_id eq 516 or session.ft_user_id eq 410>
<cfoutput><a href="reports_internal_processor.cfm" target="_new">Internal Processor Report</a><br></cfoutput>
<br>
</cfif>

</font>

</td></tr>
	</table>
	



	<center><table width="893">
		<tr>
			<TD>
				<B><P align=center><font size=3>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            	Sales Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></font></P></B>
			</TD>
		</tr>
	</table></center>



<!--- 	<table width="893" align="center">
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
			<!---<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>	--->
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
 --->
<!--- <cfinclude template="team_popup.cfm"> --->
<center><h3><a href="sales_popup_data.cfm" target="_blank">Sales Stats</a></h3></center>

<!---<center><cfinclude template="sales_popup_data.cfm"></center>--->