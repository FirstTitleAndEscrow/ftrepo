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

<CFSET "vendor"= "https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#">

<html>
<head>
<title>Accounting Disbursement Screen</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<table width="893" cellpadding=1 cellspacing=1 border=0 bgcolor=white></table>
	<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
  		<tr>
    		<td align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  		</tr>
		<TR><TD>
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
</CFOUTPUT><a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a></TD></TR>
<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput></td></tr>
	</table>
	</table>

<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">

		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/vendor_coverage.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=red face=verdana>Vendor-Cov</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<CFIF #role_mgr# eq "1">
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>
			<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<CFELSE>
			<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</CFIF>
	</table>
	<table width="893">
		<tr>
			<TD><B>
      			<P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First
            	Title Services Disbursement Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm")#</CFOUTPUT></P></B>
			</TD>
		</tr>

	</table>
	<table width="893" align="center">
		<tr>
			<TD colspan=8><Center><B>Loan's Closed/Not Funded</B></CENTER></TD>
		</tr>
		<TR>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Num</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Closing Date</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Property Use</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Transaction Type</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Closer</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Closer<BR>Cost</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>View If Signed<BR>Final Hud</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Notes</B>
			</td>
		</TR>

		<CFPARAM NAME="MaxRows" DEFAULT="1000">
		<CFPARAM NAME="StartRow" DEFAULT="1">

		<CFQUERY datasource="#request.dsn#" NAME="read_closing_list">
			Select * from sqlControl_Screen_Accounting_Master
		</CFQUERY>


		<CFOUTPUT QUERY="read_closing_list" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<!---<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Closing_list.title_id#&a_trigger=1"target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=620,height=500,status=0,resizable=1,scrollbars=1')"><font size=1 color=blue face=verdana>#title_id#</font></a>	--->
				<a href="https://#cgi.server_name#/admin_area/title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Closing_list.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>#title_id#</font></a>

			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(read_closing_list.YearMonth,'m/d/yy')#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#read_closing_list.prop_use_type#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#read_closing_list.searchtype#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="closer_modify_view.cfm?&Closer_ID=#Closer_ID#&uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=1 color=blue face=verdana>#read_closing_list.Closer_Company#</font></a>
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#read_closing_list.Closer_Cost#
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<CFIF #read_closing_list.final_HUD# neq "">
					<A HREF="#fileSys.FindFilePath('#final_HUD#', 'url')#"target="_blank"><font size=1 color=blue face=verdana>#final_HUD#</font></a>
				<CFELSE>
					No Upload
				</CFIF>
			</td>
			<td bgcolor="elelel" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Closing_list.title_id#&a_trigger=1" target="_blank"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
			</td>
		</tr>

		</CFOUTPUT>
	</table>
</table>

<cfinclude template="team_popup.cfm">