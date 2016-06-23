	<CFSET MaxRows = 2000>
	<CFSET StartRow = 1>
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

<cfset ninety_days_ago = DateAdd("d", -90, Now())>

<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	select * from first_admin
			WHERE ID = #session.ft_user_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
	Select * from sqlCTC_NotClear_To_Close where CTC_Name = '#a_fname#'
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	and fairfax_client = 1
	</cfif>
</CFQUERY>

<html>
<head>
<title>Clear To Close</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<table width="893" cellpadding=1 cellspacing=1 border=0 bgcolor=white></table>
<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
	<tr>
    	<td align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  	</tr>
	<TR>
		<TD><cfif IsDefined("session.ft_user_id") and session.ft_user_id neq 323>
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
</CFOUTPUT></cfif>
		</TD>
	</TR>
</table>
<cfif IsDefined("session.ft_user_id") and session.ft_user_id neq 323>
<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
	<tr>
		<td width="111" bgcolor="#CCD2D2"><cfif read_user.streamline_employee eq 'True'><a href="reports_ab_received_client_system_not_updated.cfm?uid=#url.uid#&al=1" target="new">Abstract Received, Client Sytem NOT Updated</a></cfif></td>
		<td width="111" bgcolor="#CCD2D2"><cfif read_user.streamline_employee eq 'True'>
<a href="streamline_lp_report.cfm?uid=#url.uid#" target="new">Streamline&nbsp;Loan<BR>
Processor&nbsp;Report</a>
</cfif></td>
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
<A HREF="https://#cgi.server_name#/admin_area/login_as_client.cfm?uid=#URL.uid#&al=#URL.al#" target="client_window">
				<font size=2 color=blue face=verdana>Login As Client</font></a>
				</cfoutput>
				</CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/met/projects" target="projects_window">
				<font size=2 color=blue face=verdana>Projects</font></a>
				</cfoutput>
				</CENTER></td>
</tr></table> </cfif>
<table width="100%">
	<tr>
		<TD align="center">
			<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            Clear To Close Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
		</TD>
	</tr>
</table>
<!---Binder Data Not Merged --->
<table width="893" align="center">
	<tr>
		<CFIF #read_user.role_mgr# eq 1>
			<TD colspan=9>
		<CFELSE>
			<TD colspan=8>
		</CFIF>
		<Center><B>Binder Data Not Merged</B></CENTER></TD>
	</tr>
	<TR>
<CFIF #read_user.role_mgr# eq 1>
		<td bgcolor="elelel" valign=top align="center">
			<b>Reassign</b>
		</td>
</CFIF>
		<td bgcolor="elelel" valign=top align="center">
			<B>Order Num</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Order Date</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Due Date</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Borrower</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Client</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Status</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Assigned To</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Comments</B>
		</td>
	</TR>
	<CFPARAM NAME="MaxRows" DEFAULT="2000">
	<CFPARAM NAME="StartRow" DEFAULT="1">

	<CFQUERY datasource="#request.dsn#" NAME="read_Binder_Not_Merged">
		Select * from sqlCTC_Binder_Not_Merged
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	where fairfax_client = 1
	</cfif>
	</CFQUERY>

<!--- <cfif cgi.REMOTE_ADDR eq '98.233.100.254'>
<cfdump var="#read_Binder_Not_Merged#">
<cfabort>
</cfif>
 --->


	<CFSET a_color_trigger = "2">
	<CFSET a_bgcolor = "white">
	<cfset a_color_temp = a_bgcolor>
	<CFOUTPUT QUERY="read_Binder_Not_Merged">
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
		Select va_employee, ft_fairfax_employee
		from First_Admin where ID = #read_Binder_Not_Merged.intSales#
</CFQUERY>
	<cfset richmond = 0>
<cfif check_richmond.va_employee eq 1>
	<cfset richmond = 1>
</cfif>
	<cfset fx = 0>
<cfif check_richmond.ft_fairfax_employee eq 1>
	<cfset fx = 1>
</cfif>
<cfif company neq 'ROA Hutton - Geddes Lake'
	and NOT ListContainsNoCase(appraisal_status, "Loan Closed", ",")
	and NOT ListContainsNoCase(appraisal_status, "Loan Funded", ",")
	and NOT ListContainsNoCase(appraisal_status, "Loan Closed-Seller Rep", ",")
	and (check_date GTE DateFormat(ninety_days_ago, "m/d/yyyy"))>

	<cfif read_Binder_Not_Merged.streamline_client eq 'True'>
		<cfset a_bgcolor="FFCC66">
	<cfelse>
		<cfset a_bgcolor = a_color_temp>
	</cfif>


	<tr>
	<CFIF #read_user.role_mgr# eq 1>
		<CFIF #read_Binder_Not_Merged.fname# neq "">
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="./update_typing.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1"><font size=1 color=Green face=verdana>R</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana>
				R
			</td>
		</CFIF>
	</CFIF>
		<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
			<CFIF #Type# eq "T">
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Binder_Not_Merged.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana><cfif richmond eq 1>(R) </cfif>T-#title_id#</font></a>
			</CFIF>
			<CFIF #Type# eq "P">
				<a href="Prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Binder_Not_Merged.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana><cfif richmond eq 1>(R) </cfif>P-0232#title_id#</font></a>
			</CFIF>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(check_date, "m/d/yyyy")#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(duedate, "m/d/yyyy")#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#BFirstName1# #BLastName1#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<CFIF appraisal_status eq 'In Typing' and read_Binder_Not_Merged.Typing_End_Datetime neq '' and read_Binder_Not_Merged.Typing_End_Datetime neq 'NULL'>Typed<cfelse>#appraisal_status#</CFIF>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#fname#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Binder_Not_Merged.title_id#&a_trigger=1&code=#type#&rec_type=#type#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
			</td>
		</tr>
		<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
</cfif>
		</CFOUTPUT>
	</table>
	<!---End of binder data not merged --->
	<table width="893" align="center">
		<br>
		<tr>
			<TD colspan=8><Center><B>Binder Typed/Title Ins. Not Completed</B></CENTER></TD>
		</tr>
		<TR>
			<CFIF #read_user.role_mgr# eq 1>
			<td bgcolor="elelel" valign=top align="center">
				<b>Reassign</b>
			</td>
			</CFIF>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Num</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Date</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Due Date</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Merged Time</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Borrower</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Client</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Status</B>
			</td>
<!--- 			<td bgcolor="elelel" valign=top align="center">
				<B>Assigned To</B>
			</td>
 --->			<td bgcolor="elelel" valign=top align="center">
				<B>Comments</B>
			</td>
		</TR>

		<CFPARAM NAME="MaxRows" DEFAULT="2000">
		<CFPARAM NAME="StartRow" DEFAULT="1">

		<CFQUERY datasource="#request.dsn#" NAME="read_closing_list">
			Select * from sqlCTC_BinderCompleted_TitleInReview
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	where fairfax_client = 1
	</cfif>
		</CFQUERY>

<CFSET a_color_trigger = "2">
		<CFSET a_bgcolor = "white">
<cfset a_color_temp = a_bgcolor>
		<CFOUTPUT QUERY="read_closing_list">

<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
		Select va_employee, ft_fairfax_employee
		from First_Admin where ID = #read_closing_list.intSales#
</CFQUERY>
	<cfset richmond = 0>
<cfif check_richmond.va_employee eq 1>
	<cfset richmond = 1>
</cfif>
	<cfset fx = 0>
<cfif check_richmond.ft_fairfax_employee eq 1>
	<cfset f = 1>
</cfif>

<cfif company neq 'ROA Hutton - Geddes Lake' and NOT ListContainsNoCase(appraisal_status, "Loan Closed", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Funded", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Closed-Seller Rep", ",")  and (order_date GTE DateFormat(ninety_days_ago, "m/d/yyyy") or (merge_date neq 'NULL' and merge_date GTE DateFormat(ninety_days_ago, "m/d/yyyy")))>
<cfif read_closing_list.streamline_client eq 'True'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
		<tr>

			<CFIF #read_user.role_mgr# eq 1 >
						<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
							<a href="./update_cleartoclose.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1"><font size=1 color=Green face=verdana>R</font></a>
						</td>
					</CFIF>

			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Closing_list.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana><cfif richmond eq 1>(R) </cfif>T-#title_id#</font></a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(check_date, "m/d/yyyy")#

			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(duedate, "m/d/yyyy")#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(n_date, "m/d/yy")# #TimeFormat(n_time, "hh:mm tt")#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#BFirstName1# #BLastName1#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#appraisal_status#
			</td>
<!--- 			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#read_closing_list.fname#
			</td>
 --->			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Closing_list.title_id#&a_trigger=1&code=T&rec_type=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
			</td>
		</tr>
		<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>

</cfif>
		</CFOUTPUT>
	</table>
	<!---Second part of report only for people who work on Clear To Close--->
	<!---Do a group by to get all of the names --->
		<CFQUERY datasource="#request.dsn#" NAME="CTC_Names">
			Select CTC_Name from sqlCTC_NotClear_To_Close  where CTC_Name is not null
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	and fairfax_client = 1
	</cfif>
group by CTC_Name
order by CTC_Name
		</CFQUERY>
		<!---Loop through one name at a time --->
		<cfset a_color_temp = a_bgcolor>
		<CFLOOP QUERY="CTC_Names">
		<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
			Select * from sqlCTC_NotClear_To_Close where CTC_Name = '#CTC_Names.CTC_Name#'
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	and fairfax_client = 1
	</cfif>
		</CFQUERY>
	<table width="893" align="center">

<cfif read_NotClear_To_Close_Name.streamline_client eq 'True'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
				<tr>
					<CFIF #read_user.role_mgr# eq 1 >
						<TD colspan=8>
					<CFELSE>
						<TD colspan=7>
					</CFIF>
					<Center><B>Title Ins. Completed/Not Clear To Close for <cfoutput>#CTC_Names.CTC_Name#</cfoutput></B></CENTER>
					</TD>
				</tr>
				<TR>
				<!--- <CFIF cgi.REMOTE_ADDR eq '98.233.232.47'>
					<td bgcolor="elelel" valign=top align="center">&nbsp;

					</TD>
				</CFIF>	 --->
				<CFIF #read_user.role_mgr# eq 1 >
					<td bgcolor="elelel" valign=top align="center">&nbsp;

					</TD>
				</CFIF>

					<td bgcolor="elelel" valign=top align="center">
						<B>Order Num</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Order Date</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Due Date</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Borrower</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Client</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Status</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Comments</B>
						</td>
					</TR>
					<CFSET a_color_trigger = "2">
					<CFSET a_bgcolor = "white">

				<CFOUTPUT QUERY="read_NotClear_To_Close_Name">
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
		Select va_employee, ft_fairfax_employee
		from First_Admin where ID = #read_NotClear_To_Close_Name.intSales#
</CFQUERY>
	<cfset richmond = 0>
<cfif check_richmond.va_employee eq 1>
	<cfset richmond = 1>
</cfif>
	<cfset fx = 0>
<cfif check_richmond.ft_fairfax_employee eq 1>
	<cfset fx = 1>
</cfif>


<cfset ninety_days_ago = DateAdd("d", -90, Now())>
<cfset date_difference = DateDiff("d", read_NotClear_To_Close_Name.check_date, Now())>
<cfif company neq 'ROA Hutton - Geddes Lake' and NOT ListContainsNoCase(appraisal_status, "Loan Closed", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Funded", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Closed-Seller Rep", ",") and (date_difference LTE 90)  and (check_date GTE '09/01/2008')>				<tr>
					<!--- <CFIF cgi.REMOTE_ADDR eq '98.233.232.47'>
					<td bgcolor="elelel" valign=top align="center">#date_difference#

					</TD>
				</CFIF>	 --->
				<CFIF #read_user.role_mgr# eq 1 >
						<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
							<a href="./update_cleartoclose.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1"><font size=1 color=Green face=verdana>R</font></a>
						</td>
					</CFIF>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana><cfif richmond eq 1>(R) </cfif>T-#title_id#</font></a>
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(check_date, "m/d/yyyy")#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(duedate, "m/d/yyyy")#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#BFirstName1# #BLastName1#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#company#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#appraisal_status#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1&code=T&rec_type=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
					</td>

				</tr>
				<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
</cfif>
				</CFOUTPUT>
			</table>
		</CFLOOP>
<!---Third part--->
<!---Show rows where no names is assigned --->
<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_NoName">
	Select * from sqlCTC_NotClear_To_Close where CTC_Name is null
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	and fairfax_client = 1
	</cfif>
</CFQUERY>
			<table width="893" align="center">
				<br>
				<tr>
					<TD colspan=8><Center><B>Not Clear To Close - Older Files</B></CENTER></TD>
				</tr>
				<TR>
					<td bgcolor="elelel" valign=top align="center">
						<B>Order Num</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Order Date</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Due Date</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Borrower 1</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Client</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Status</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Comments</B>
					</td>
				</TR>
				<cfset a_color_temp = a_bgcolor>
				<CFOUTPUT QUERY="read_NotClear_To_Close_NoName">
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
		Select va_employee, ft_fairfax_employee
		from First_Admin where ID = #read_NotClear_To_Close_NoName.intSales#
</CFQUERY>
	<cfset richmond = 0>
<cfif check_richmond.va_employee eq 1>
	<cfset richmond = 1>
</cfif>
	<cfset fx = 0>
<cfif check_richmond.ft_fairfax_employee eq 1>
	<cfset fx = 1>
</cfif>
<cfset ninety_days_ago = DateAdd("d", -90, Now())>
<cfset date_difference = DateDiff("d", read_NotClear_To_Close_NoName.check_date, Now())>

<cfif company neq 'ROA Hutton - Geddes Lake' and NOT ListContainsNoCase(appraisal_status, "Loan Closed", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Funded", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Closed-Seller Rep", ",") and (date_difference LTE 90) and (check_date GTE '09/01/2008')>

<cfif read_NotClear_To_Close_NoName.streamline_client eq 'True'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif><tr>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_NoName.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana><cfif richmond eq 1>(R) </cfif>T-#title_id#</font></a>
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(check_date, "m/d/yyyy")#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(duedate, "m/d/yyyy")#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#BFirstName1# #BLastName1#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#company#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#appraisal_status#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_NoName.title_id#&a_trigger=1&code=T&rec_type=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
					</td>
				</tr>
				<CFIF #a_color_trigger# eq "1">
					<CFSET a_bgcolor = "white">
					<CFSET a_color_trigger = "2">
				<CFELSE>
					<CFSET a_bgcolor = "d3d3d3">
					<CFSET a_color_trigger = "1">
				</CFIF>
</cfif>
				</CFOUTPUT>
			</table>
	</table>



	<cfinclude template="team_popup.cfm">