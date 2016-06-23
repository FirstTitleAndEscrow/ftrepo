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

<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
	Select * from sqlCTC_NotClear_To_Close where CTC_Name = '#a_fname#'
</CFQUERY>

<html>
<head>
<title>Sales</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style> 
ul { margin-left: 200px;
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
		<TR><TD>
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
</CFOUTPUT></TD></TR>
	</table>

	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/client_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Add Client</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>
		<CFIF #role_mgr# eq "1">
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>
		</CFIF>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onclick="location.reload()">Refresh</A></center></td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</table>
	<tr>
    <ul> 
       <cfinclude template="/admin_area/met/ricks_page.cfm">
	</ul>
    
	<table width="893">
		<tr>
			<TD>
				<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            	Clear To Close Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
			</TD>
		</tr>
	</table>
	
	<!---Binder Data Not Merged --->
		<table width="893" align="center">
		<tr>
			<TD colspan=8><Center><B>Binder Data Not Merged</B></CENTER></TD>
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
				<B>Binder Typed</B>
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

		<CFPARAM NAME="MaxRows" DEFAULT="1000">
		<CFPARAM NAME="StartRow" DEFAULT="1">

		<CFQUERY datasource="#request.dsn#" NAME="read_Binder_Not_Merged">
			Select * from sqlCTC_Binder_Not_Merged
		</CFQUERY>


		<CFOUTPUT QUERY="read_Binder_Not_Merged" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Binder_Not_Merged.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(check_date, "m/d/yyyy")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(duedate, "m/d/yyyy")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(n_date, "m/d/yyyy")# #timeformat(n_time,"hh:mm tt")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#BFirstName1# #BLastName1#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#company#
			</td>

			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#appraisal_status#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Binder_Not_Merged.title_id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
			</td>
		</tr>
		</CFOUTPUT>
	</table>
	<!---End of binder data not merged --->
	<table width="893" align="center">
		<tr>
			<TD colspan=8><Center><B>Binder Typed/Title Ins. Not Completed</B></CENTER></TD>
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
				<B>Binder Typed</B>
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

		<CFPARAM NAME="MaxRows" DEFAULT="1000">
		<CFPARAM NAME="StartRow" DEFAULT="1">

		<CFQUERY datasource="#request.dsn#" NAME="read_closing_list">
			Select * from sqlCTC_BinderCompleted_TitleInReview
		</CFQUERY>


		<CFOUTPUT QUERY="read_closing_list" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Closing_list.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(check_date, "m/d/yyyy")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(duedate, "m/d/yyyy")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(n_date, "m/d/yyyy")# #timeformat(n_time,"hh:mm tt")#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#BFirstName1# #BLastName1#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#company#
			</td>

			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#appraisal_status#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Closing_list.title_id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
			</td>
		</tr>
		</CFOUTPUT>
	</table>
	<!---Second part of report only for people who work on Clear To Close--->
		<!---Do a group by to get all of the names --->
		<CFQUERY datasource="#request.dsn#" NAME="CTC_Names">
			Select cleartoclose from sqlCTC_NotClear_To_Close  where cleartoclose is not null group by cleartoclose order by cleartoclose
		</CFQUERY>
		<!---Loop through one name at a time --->
		<CFLOOP QUERY="CTC_Names">
		<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
			Select * from sqlCTC_NotClear_To_Close where cleartoclose = '#CTC_Names.cleartoclose#'
		</CFQUERY>


			<table width="893" align="center">
				<tr>
					<TD colspan=8><Center><B>Title Ins. Completed/Not Clear To Close for <cfoutput>#CTC_Names.cleartoclose#</cfoutput></B></CENTER></TD>
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
				<CFOUTPUT QUERY="read_NotClear_To_Close_Name" StartRow="#StartRow#" MAXROWS="#MaxRows#">
				<tr>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(check_date, "m/d/yyyy")#
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(duedate, "m/d/yyyy")#
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#BFirstName1# #BLastName1#
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#company#
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#appraisal_status#
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
					</td>

				</tr>
				</CFOUTPUT>
			</table>
		</CFLOOP>
<!---Third part--->
<!---Show rows where no names is assigned --->
<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_NoName">
	Select * from sqlCTC_NotClear_To_Close where cleartoclose is null
</CFQUERY>
			<table width="893" align="center">
				<tr>
					<TD colspan=8><Center><B>Title Ins. Completed/Not Clear To Close No Name Assigned</B></CENTER></TD>
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
				<CFOUTPUT QUERY="read_NotClear_To_Close_NoName" StartRow="#StartRow#" MAXROWS="#MaxRows#">
				<tr>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_NoName.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#title_id#</font></a>
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(check_date, "m/d/yyyy")#
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(duedate, "m/d/yyyy")#
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#BFirstName1# #BLastName1#
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#company#
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#appraisal_status#
					</td>
					<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_NoName.title_id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
					</td>

				</tr>
				</CFOUTPUT>
			</table>
	</table>