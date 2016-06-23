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

<CFQUERY datasource="#request.dsn#" Name="User_Name">
	Select * from First_Admin where id = #url.uid#
</CFQUERY>




<CFQUERY datasource="#request.dsn#" NAME="NotClear_To_Close" >
	select * from sqlPreprocessing_NotClearToClose
    where  (1=1
    <cfif user_name.mi_flushing_admin eq 1>
     and intSales IN (Select id from first_admin where mi_flushing_employee = 1)
    </cfif>    
    <cfif user_name.mo_admin eq 1>
     and intSales IN (Select id from first_admin where mo_employee = 1)
    </cfif>    
    <cfif user_name.mi_admin eq 1>
     and intSales IN (Select id from first_admin where mi_employee = 1)
    </cfif>    
    <cfif user_name.ft_fairfax_admin eq 1>
     and intSales IN (Select id from first_admin where ft_fairfax_employee = 1)
    </cfif>    
    <cfif user_name.tx_admin eq 1>
     and intSales IN (Select id from first_admin where tx_employee = 1)
    </cfif>    
    <cfif user_name.va_admin eq 1>
     and intSales IN (Select id from first_admin where va_employee = 1)
    </cfif>   
    )
    <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
    or comp_id in (9711,10436,11086,11100,11087)
    </cfif>
 
</CFQUERY>



<!---Do a group by to get all of the names --->
<!--- <CFQUERY datasource="#request.dsn#" NAME="preproc_name" cachedwithin="300">
		SELECT     * from sqlPreProcessingOpenOrders
</CFQUERY>
 --->
 <!--- <CFQUERY datasource="#request.dsn#" NAME="proc_notcleartoclose" cachedwithin="300">
			SELECT     Title.Title_ID, Companies.company, Title.check_date, Title.bfirstname1, Title.blastname1, Title.appraisal_status,
                      Title.proc_name, First_Admin.fname, First_Admin.lname, Title.dateandtime, Title_Closing_Order_Request.request_date,
                      Title_Closing_Order_Request.a_Req_Date, Doc_Closer_Title.closing_inst_date, Doc_Closer_Title.inst_dateandtime,
                      Doc_Closer_Title.closing_inst_time, Title_Closing_Order_Request.a_req_closing_month,
                      Title_Closing_Order_Request.a_Req_Closing_Day, Title_Closing_Order_Request.a_req_closing_year
			FROM         Title LEFT OUTER JOIN
                      Doc_Closer_Title ON Title.Title_ID = Doc_Closer_Title.TITLE_ID LEFT OUTER JOIN
                      Title_Closing_Order_Request ON Title.Title_ID = Title_Closing_Order_Request.Title_ID LEFT OUTER JOIN
                      First_Admin ON Title.proc_name = First_Admin.username LEFT OUTER JOIN
                      Companies ON Title.comp_id = Companies.ID
			WHERE     (Title.proc_name IS NOT NULL) AND (Title.proc_complete_date IS NULL) AND (Title.Title_ID IN
                          (SELECT     Title_ID
                            FROM          sqlCTC_NotClear_To_Close))
		</CFQUERY> --->
<html>
<head>
<title>Processing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style>
ul { margin-left: 467px;
	 margin-right: 150px; 
	 margin-top: 10px;
}
</style>
</head>

<body>
<cfflush>
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
</CFOUTPUT> <a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a><br>
<cfif User_Name.id eq 432 or User_Name.id eq 558><a href="reports_abstract_unassigned.cfm?uid=#URL.uid#&al=#URL.al#" target="abstract_unassigned">Abstract Unassigned</a><br>
<a href="reports_abstract_assigned_not_received.cfm?uid=#URL.uid#&al=#URL.al#" target="abstract_assigned_not_received">Abstract Assigned Not Received</a><br>
</cfif>
<cfif session.ft_user_id eq 432>
<cfoutput>
<a href="reports_ab_received_client_system_not_updated.cfm?uid=#url.uid#&al=1" target="new">Abstract Received, Client System NOT Updated</a><br>
<a href="https://#cgi.server_name#/admin_area/Contract_Assignment_and_Sales_Report_Date.cfm?uid=#url.uid#&al=1" target="new">Contract Assignment Report</a><br>
<a href="https://#cgi.server_name#/admin_area/reports_ICL.cfm?uid=#url.uid#&al=1" target="new">ICL Assignment Report</a><br>
<a href="reports_internal_processor.cfm" target="_new">Internal Processor Report</a><br>
<a href="reports_subordination_needed.cfm?uid=#URL.uid#&al=#URL.al#" target="subordinations">Subordination Needed</a><br>
</cfoutput>
</cfif>

</TD>
		</TR>
		<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput></td></tr>
	</table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<TR colspan="18">
			<td width="99" align="center" colspan="2">
				<B>Clients</B>
			</td>
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
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2"><cfif (get_current_user.role_id neq 24 and get_current_user.role_id neq 17) or get_current_user.id eq 322 or get_current_user.id eq 339 or get_current_user.id eq 359>&nbsp;&nbsp;<a href="./met/projects" target="projects">Projects</a><cfelse>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cfif></td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_choose.cfm?uid=#URL.uid#&al=#URL.al#&trigger=1"target="_blank"><font size=2 color=red face=verdana>Scheduling/Funding Calendar</font></a></cfoutput></CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>
		<CFIF #role_mgr# eq "1">
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>
		</CFIF>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onClick="location.reload()">Refresh</A></center></td>
		<td width="111" bgcolor="#CCD2D2"><cfif get_current_user.id eq 432 or get_current_user.id eq 523 or get_current_user.id eq 558><cfoutput><a href="./menu_Cleartoclose.cfm?uid=#session.ft_user_id#&al=1" target="report"><font size=2 color=red face=verdana>Clear To Close Report</font></a></cfoutput><cfelse>&nbsp;</cfif></td>
		<td width="111" bgcolor="#CCD2D2"><cfif get_current_user.id eq 557><cfoutput><a href="./cancelled_view.cfm?uid=#session.ft_user_id#&al=1&a_trigger=1" target="report"><font size=2 color=red face=verdana>Cancelled</font></a></cfoutput><cfelse>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cfif>
        </td>
	</table>
	
<!--- New Reports Menu --->
    <table width="300" align="left" border="0" >
	<ul>
       <cfinclude template="/admin_area/met/ricks_page.cfm">
	</ul>
</table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<tr>
			<TD>
				<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            	All Processing Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT>
				<cfif get_current_user.streamline_employee eq 'True'><br>
<a href="<cfoutput>https://#cgi.SERVER_NAME#/admin_area/streamline_lp_report.cfm</cfoutput>" target="new">Streamline Loan Processor Report</a><br>
<br>
<a href="<cfoutput>reports_ab_received_client_system_not_updated.cfm?uid=#url.uid#&al=1</cfoutput>" target="new">Abstract Received, Client Sytem NOT Updated</a><br>
<br>
</cfif>

<cfoutput><br><a href="https://#cgi.server_name#/admin_area/typing_commitment_review_report.cfm?uid=#url.uid#&al=1" target="new">Typing and Commitment Review Report</a></cfoutput><br><br>

<cfif session.ft_user_id neq 606>
<cfoutput><a href="Contract_Assignment_and_Sales_Report_Date.cfm?uid=#url.uid#" target="new">Contract Assignment and Sales Report</a></cfoutput><br><br>
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
<cfif session.ft_user_id eq 405>
<cfoutput><a href="https://#cgi.server_name#/admin_area/reports_secretary_veteran_affairs.cfm?uid=#url.uid#&al=0" target="blank">Secretary Veteran Affairs Report</a></cfoutput></P></B><br>
</cfif>


			</TD>
		</tr>
		<tr>
			<TD colspan=6><Center><B><font size="+1">Pre-Processing</font></B></CENTER></TD>
		</tr>
	</table>
	<table width="893" align="center" bgcolor="elelel" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
        <tr>
            <td align="left">
                <b>Assign Pre-Processor.&nbsp;&nbsp;(Only for orders not on the list below.)</b>
            </td>
        </tr>
        <tr><td>
        <CFFORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/preprocessor_assign.cfm?uid=#URL.uid#&role_mgr=1&al=#URL.al#">
  				<FONT FACE=ARIAL SIZE=2 color="gray">Order Number&nbsp;&nbsp;</font><input type=text name="Order_Number" size=10 maxlength=15
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
								><input type="image" src="/images/button_return.gif" border=0 alt="Assign to Preprocessor">
        </cfFORM></td>
        </tr>
    </table>



    <CFIF #NotClear_To_Close.RecordCount# gte "1">
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
					<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#NotClear_To_Close.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
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
		<!--- <CFQUERY datasource="#request.dsn#" NAME="CTC_Names">
			 SELECT     t.Preprocessor_ID
             FROM       tblUser_Roles t, First_Admin f
             WHERE     (t.Preprocessor_Start_Datetime IS NOT NULL) AND (t.Preprocessor_End_Datetime IS NULL)
			 and f.ID = t.Preprocessor_ID
			 and f.status = 'True'
             GROUP BY Preprocessor_ID
		</CFQUERY> --->
		<!---Loop through one name at a time --->
		<!--- <CFLOOP QUERY="CTC_Names">
		<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
			Select * from sqlPreProcessingOpenOrders where Preprocessor_ID = '#CTC_Names.preprocessor_id#'
		</CFQUERY>


	<table width="893" align="center">

		<tr>
			<CFIF #User_Name.role_mgr# eq 1>
				<TD colspan=7>
			<CFELSE>
				<TD colspan=6>
			</CFIF>
			<Center><B>Waiting to be completed by <cfoutput>#read_NotClear_To_Close_Name.fname# #read_NotClear_To_Close_Name.lname#</cfoutput></B></CENTER></TD>
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
			<CFIF #User_Name.role_mgr# eq 1>
			<td bgcolor="elelel" valign=top align="center">
				<B>Reassign</B>
			</td>
			</CFIF>
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
			<CFIF #User_Name.role_mgr# eq 1>
				<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
					<a href="./update_preprocessing.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1"><font size=1 color=Green face=verdana>Reassign</font></a>
				</td>
			</CFIF>
		</tr>
		</CFOUTPUT>
	</table>
	</CFLOOP>
</table> --->

<!----
<cfinclude template="team_popup.cfm">
--->
