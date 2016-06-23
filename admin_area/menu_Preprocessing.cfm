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
<CFQUERY datasource="#request.dsn#" NAME="preproc_name">
		<!---SELECT     * from sqlPreProcessingOpenOrders order by dateandtime--->
        SELECT     Preprocessor_ID
        FROM       tblUser_Roles
        WHERE     (Preprocessor_Start_Datetime IS NOT NULL) AND (Preprocessor_End_Datetime IS NULL)
        GROUP BY Preprocessor_ID
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="NotClear_To_Close">
	select * from sqlPreprocessing_NotClearToClose
</CFQUERY>
<html>
<head>
<title>Pre-Processing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style> 
ul { margin-left: 457px;
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
</CFOUTPUT> <a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a></TD>
		</TR>
<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput></td></tr>
	</table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="Contract_Assignment_and_Sales_Report_Date.cfm?uid=#url.uid#" target="_blank"><font size=2 color=red face=verdana>Contract Assignment and Sales Report</font></a></cfoutput></CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_choose.cfm?uid=#URL.uid#&al=#URL.al#&trigger=1"target="_blank"><font size=2 color=red face=verdana>Scheduling/Funding Calendar</font></a></cfoutput></CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>
		<CFIF #role_mgr# eq "1">
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>
		</CFIF>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onclick="location.reload()">Refresh</A></center></td>
		<td width="111" bgcolor="#CCD2D2"><A HREF="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/met/projects" target="projects_window">
				<font size=2 color=blue face=verdana>Projects</font></a></td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</table>
	<ul> 
       <cfinclude template="/admin_area/met/ricks_page.cfm">
	</ul>

	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<tr>
			<TD>
				<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            	Pre-Processing Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
			</TD>
		</tr>
	</table>
	<CFIF NotClear_To_Close.RecordCount gte 1>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
			<tr>
				<TD colspan=5>
					<Center><B>Not Clear To Close</B></CENTER>
				</TD>
			</tr>
			<TR>
				<td bgcolor="elelel" valign=top align="center">
					<B>Order Num</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Assigned Date/Time</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Borrower</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Client</B>
				</td>
				<td bgcolor="elelel" valign=top align="center">
					<B>Closing Date</B>
				</td>
			</TR>
			<CFOUTPUT QUERY="NotClear_To_Close" StartRow="#StartRow#" MAXROWS="#MaxRows#">
			<tr>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#NotClear_To_Close.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#DateFormat(dateandtime,"m/d/yy")# #TimeFormat(dateandtime,"hh:mm tt")#
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#BFirstName1# #BLastName1#
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#company#
				</td>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					#A_Req_Closing_month#/#A_Req_Closing_Day#/#A_Req_Closing_year#
				</td>
			</tr>
		</CFOUTPUT>
		</table>
		</CFIF>
	<!---Second part of report only for people who work on Clear To Close--->
		<!---Do a group by to get all of the names --->
		<CFQUERY datasource="#request.dsn#" NAME="CTC_Names">
			<!---Select p_name from sqlPreProcessingOpenOrders   where len(p_name) > 1 group by p_name order by p_name--->
             SELECT     Preprocessor_ID
            FROM       tblUser_Roles
            WHERE     (Preprocessor_Start_Datetime IS NOT NULL) AND (Preprocessor_End_Datetime IS NULL)
            GROUP BY Preprocessor_ID
		</CFQUERY>
		<!---Loop through one name at a time --->
		<CFLOOP QUERY="CTC_Names">
		<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
			Select * from sqlPreProcessingOpenOrders where Preprocessor_ID = '#CTC_Names.preprocessor_id#'
		</CFQUERY>


	<table width="893" align="center">
		<tr>
			<TD colspan=6><Center><B>Waiting to be completed by <CFOUTPUT>#read_NotClear_To_Close_Name.fname# #read_NotClear_To_Close_Name.lname#</CFOUTPUT></B></CENTER></TD>
		</tr>
		<TR>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Num</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Assigned Date/Time</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Borrower</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Client</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Closing Date</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Finished</B>
			</td>
		</TR>
		<CFOUTPUT QUERY="read_NotClear_To_Close_Name" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(dateandtime,"m/d/yy")# #TimeFormat(dateandtime,"hh:mm tt")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#BFirstName1# #BLastName1#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#A_Req_Closing_month#/#A_Req_Closing_Day#/#A_Req_Closing_year#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="./close_preprocessing.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1"><font size=1 color=red face=verdana>Submit</font></a>
			</td>
		</tr>
		</CFOUTPUT>
	</table>
	</CFLOOP>
</table>

<cfinclude template="team_popup.cfm">