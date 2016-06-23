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

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	Select *
	from First_Admin
	where ID = #url.uid#
</CFQUERY>

<!---Do a group by to get all of the names --->
<CFQUERY datasource="#request.dsn#" NAME="proc_name">
		SELECT     First_Admin.ID, First_Admin.fname, First_Admin.lname
		FROM       First_Admin LEFT OUTER JOIN
                   tblUser_Roles ON First_Admin.ID = tblUser_Roles.abstract_ID
		WHERE      (First_Admin.role_id = 27) AND (First_Admin.status = 1) AND (tblUser_Roles.abstract_Start_Datetime IS NOT NULL) AND
                   (tblUser_Roles.abstract_Finish_Datetime IS NULL)
		GROUP BY   First_Admin.ID, First_Admin.fname, First_Admin.lname
</CFQUERY>


<html>
<head>
<title>Vendor Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
<a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a>

 </TD>
		</TR>
<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput></td></tr>
	</table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
			<TR colspan="16">
			<td width="99" align="center" colspan="2">
				<B>Clients</B>
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
			<td width="45" align="center">
				<CFoutput>
				<a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</td>
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

		<td width="111" bgcolor="#CCD2D2"><Center>
<cfif (get_current_user.role_id neq 24 and get_current_user.role_id neq 17) or get_current_user.id eq 322 or get_current_user.id eq 339 or get_current_user.id eq 359>&nbsp;&nbsp;<a href="./met/projects" target="projects">Projects</a><cfelse>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cfif>
		</td>
		<td width="111" bgcolor="#CCD2D2"><Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/cancelled_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color="660000" face=verdana>Cancelled</font></a>
				</cfoutput>
				</CENTER>	</td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=red face=verdana>Vendor-Cov</font></a></cfoutput></CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>

			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>

		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onclick="location.reload()">Refresh</A></center></td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=red face=verdana>Vendor-Cov</font></a></cfoutput></CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><Center><CFoutput><a href="./menu_Cleartoclose.cfm?uid=#session.ft_user_id#&al=1" target="report"><font size=2 color=red face=verdana>Clear To Close Report</font></a></cfoutput></CENTER></td></tr>

		<tr>
		<td colspan=3><cfif read_user.streamline_employee eq 'True'>
<a href="streamline_lp_report.cfm?uid=#url.uid#" target="new"><font size=3>Streamline Loan
Processor Report</a></font><br><br>
</cfif></td></tr>

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
	<!--- 09/16/2004 - If it is Mondy Paige then show this screen else show the Vendor Management Screen that Shelly
				   and Tamara receive.  This is bad coding and I am doing this against my better judgment.
--->
<CFIF #read_user.ID# eq 111>


		<!---Loop through one name at a time --->
		<CFLOOP QUERY="proc_name">
			<CFQUERY datasource="#request.dsn#" NAME="read_TitleAbstract_Assigned_ByName">
				Select * from sqlAbstract_Outside where abstract_ID = #proc_name.ID#
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
<CFELSE>
	<!---Anyone but Mondy --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	<CFQUERY datasource="#request.dsn#" NAME="read_Abstract_Not_Assigned">
			Select * from sqlAbstract_Not_Assigned order by a_insert_date
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_Abstract_Assigned_Not_Received">
			Select * from sqlAbstract_Assigned_Not_Received order by a_insert_date
	</CFQUERY>
	<TABLE cellSpacing=1 cellPadding=1 width="893" align="center">
	<tr>

		<td
		<CFIF #read_user.role_mgr# eq 1>
			colspan=7
		<CFELSE>
		 colspan=6
		 </CFIF>
			width="893">
			<CENTER><B>Abstract Unassigned</B>
		</td>
	</tr>
	<tr>
	<CFIF #read_user.role_mgr# eq 1>
		<td>
			<Center><font size=1 color=black face=verdana><b>Assign</b></font></CENTER>
		</td>
	</CFIF>
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
			<CENTER><font size=1 color=black face=verdana><b>Abstractor</b></font></CENTER>
		</td>
		<td>
			<CENTER><font size=1 color=black face=verdana><b>Taxes</b></font></CENTER>
		</td>
	</tr>

<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Abstract_Not_Assigned">

		<tr>
			<CFIF #read_user.role_mgr# eq 1>
				<CFIF #Letter# eq "T">
					<td bgcolor="#a_bgcolor#">
						<a href="./title_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" taget="_blank"><CENTER><font size=1 color=red face=verdana><b>A</font></CENTER></a>
					</td>
				<CFELSE>
					<td bgcolor="#a_bgcolor#">
						<a href="./prop_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" taget="_blank"><CENTER><font size=1 color=red face=verdana><b>A</font></CENTER></a>
					</td>
				</CFIF>
			</CFIF>
			<CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#"><center>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#id#</font></a>
				</Center>
			</td>
			<CFELSE>
			<td bgcolor="#a_bgcolor#"><center>
				<a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#id#</font></a>
			</center>
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
			<td bgcolor="#a_bgcolor#" >
				<CFIF #Len(abstractor)# gte 1>
					<CFIF #Letter# eq "T">
					<CENTER><font size=1 color=black face=verdana><b>
						<!---<a href="./update_vendor_management_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
						#abstractor#</font><!---</a>--->
					</CENTER>
					</CFIF>
					<CFIF #Letter# eq "P">
					<CENTER><font size=1 color=black face=verdana><b>
						<!---<a href="./update_vendor_management_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
						#abstractor#</font><!---</a>--->
					</CENTER>
					</CFIF>
				<cfelse>
				<CFIF #Letter# eq "T">
					<CENTER><font size=1 color=black face=verdana><b>
						<!---<a href="./update_vendor_management_InHouse_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
						#abstractorIH#
						</font><!---</a>--->
					</CENTER>
					</CFIF>
					<CFIF #Letter# eq "P">
					<CENTER><font size=1 color=black face=verdana><b>
						<!---<a href="./update_vendor_management_InHouse_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
						#abstractorIH#</font><!---</a>--->
					</CENTER>
					</CFIF>
				</CFIF>
			</td>
			<td bgcolor="#a_bgcolor#" >

				<CFIF #Letter# eq "T">
					<CFQUERY datasource="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Title_ID = #id#
					</CFQUERY>
					<CFIF #read_taxes.recordcount# gte 1>
						<CENTER><font size=1 color=black face=verdana><b>
						<!---<a href="./update_vendor_management_taxes_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
						#taxes#</font><!---</a>--->
						</CENTER>
					</CFIF>
				</CFIF>
				<CFIF #Letter# eq "P">
					<CFQUERY datasource="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Prop_ID = #id#
					</CFQUERY>
					<CFIF #read_taxes.recordcount# gte 1>
						<CENTER><font size=1 color=black face=verdana><b>
						<!---<a href="./update_vendor_management_taxes_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
						#taxes#</font><!---</a>--->
						</CENTER>
					</CFIF>
				</CFIF>
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
		</table>
		<TABLE cellSpacing=1 cellPadding=1 width="893" align="center">
		<tr>
			<td colspan=7>
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
			<td>
				<CENTER><font size=1 color=black face=verdana><B>Abstractor</B></font></CENTER>
			</td>
			<td>
				<CENTER><font size=1 color=black face=verdana><B>Taxes</B></font></CENTER>
			</td>
		</tr>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Abstract_Assigned_Not_Received">

		<tr>
			<CFIF #Letter# eq "T">
			<td width ="20%" bgcolor="#a_bgcolor#">
				<center><a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#id#</font></a></center>
			</td>
			<CFELSE>
			<td bgcolor="#a_bgcolor#">
				<Center><a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#id#</font></a></CENTER>
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
			<td bgcolor="#a_bgcolor#" >
				<CFIF #Len(abstractor)# gte 1>
					<CFIF #Letter# eq "T">
					<CENTER><font size=1 color=black face=verdana><b>
						<!---<a href="./update_vendor_management_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
						#abstractor#</font><!---</a>--->
					</CENTER>
					</CFIF>
					<CFIF #Letter# eq "P">
					<CENTER><font size=1 color=black face=verdana><b>
						<!---<a href="./update_vendor_management_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
						#abstractor#</font><!---</a>--->
					</CENTER>
					</CFIF>
				<cfelse>
				<CFIF #Letter# eq "T">
					<CENTER><font size=1 color=black face=verdana><b>
						<!---<a href="./update_vendor_management_InHouse_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
						#abstractorIH#</font><!---</a>--->
					</CENTER>
					</CFIF>
					<CFIF #Letter# eq "P">
					<CENTER><font size=1 color=black face=verdana><b>
						<!---<a href="./update_vendor_management_InHouse_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
						#abstractorIH#</font><!---</a>--->
					</CENTER>
					</CFIF>
				</CFIF>
			</td>
			<td bgcolor="#a_bgcolor#" >

				<CFIF #Letter# eq "T">
					<CFQUERY datasource="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Title_ID = #id#
					</CFQUERY>
					<CFIF #read_taxes.recordcount# gte 1>
						<CENTER><font size=1 color=black face=verdana><b>
						<!---<a href="./update_vendor_management_taxes_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
						#taxes#</font><!---</a>--->
						</CENTER>
					</CFIF>
				</CFIF>
				<CFIF #Letter# eq "P">
					<CFQUERY datasource="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Prop_ID = #id#
					</CFQUERY>
					<CFIF #read_taxes.recordcount# gte 1>
				<CENTER><font size=1 color=black face=verdana><b>
				<!---<a href="./update_vendor_management_taxes_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>--->
				#taxes#</font><!---</a>--->
				</CENTER>
				</CFIF>
				</CFIF>
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

</CFIF>
</table>
<cfinclude template="team_popup.cfm">