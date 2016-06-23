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
		SELECT     Typing_ID As ID, fname, lname
		FROM       sqlTyping
		GROUP BY Typing_ID, fname, lname
</CFQUERY>


<html>
<head>
<title>Typing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style> 
ul { margin-left: 467px;
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
<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput></td></tr>
	</table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<td width="111" bgcolor="#CCD2D2"><Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/login_as_client.cfm?uid=#URL.uid#&al=#URL.al#" target="client_window">
				<font size=2 color=blue face=verdana>Login As Client</font></a>
				</cfoutput>
				</CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><cfoutput><a href="https://#cgi.server_name#/admin_area/client_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Client Modify</font></a></cfoutput></CENTER></td>
		<td width="111" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/cancelled_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color="660000" face=verdana>Cancelled</font></a>
				</cfoutput>
				</CENTER>
			</td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>
		<CFIF #role_mgr# eq "1">
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>
		</CFIF>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onclick="location.reload()">Refresh</A></center></td>
		<td width="111" bgcolor="#CCD2D2"><Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/met/projects" target="projects_window">
				<font size=2 color=blue face=verdana>Projects</font></a>
				</cfoutput>
				</CENTER></td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</table>
		<ul> 
		<!--- New Reports Menu --->
       <cfinclude template="/admin_area/met/ricks_page.cfm">
	</ul>
	<center><table width="893">
		<tr>
			<TD>
				<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            	Typing Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
			</TD>
		</tr>
	</table></center><br>
<br>
<center><cfoutput><a href="https://#cgi.server_name#/admin_area/typing_commitment_review_report.cfm?uid=#url.uid#&al=1" target="new">Typing and Commitment Review Report</a></cfoutput></center><br><br>


		<!---Loop through one name at a time --->
		<CFLOOP QUERY="proc_name">
			<CFQUERY datasource="#request.dsn#" NAME="read_TitleAbstract_Assigned_ByName">
				Select * from sqlTyping where Typing_ID = #proc_name.ID# Order By Typing_Start_Datetime
			</CFQUERY>

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
				<CFIF #letter# eq "T">
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_TitleAbstract_Assigned_ByName.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
				</CFIF>
				<CFIF #letter# eq "P">
				<a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_TitleAbstract_Assigned_ByName.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#title_id#</font></a>
				</CFIF>
			</td
			></td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(Typing_Start_Datetime, "m/d/yyyy")# #TimeFormat(Typing_Start_Datetime, "hh:mm tt")#
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

	</table>
	</CFLOOP>
</table>

<cfinclude template="team_popup.cfm">