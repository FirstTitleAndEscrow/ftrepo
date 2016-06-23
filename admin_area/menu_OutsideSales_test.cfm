

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
</CFOUTPUT>
			</TD>

		</TR>
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
				<CFoutput>
				<a href="https://66.160.120.185:2004/actweb/login.asp" target="_blank">
				<font size=2 color="660000" face=verdana>ACT For Web</font></a>
				</cfoutput>
				</CENTER>
			</td>
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
				<A HREF="#" onclick="location.reload()">Refresh</A>
				</center>
			</td>
			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<a href="my_client_list.cfm" target="_new">My Client List</a>
				</center>
			</td>


		</TR>
	</table>
	<table width="893">
		<tr>
			<TD>
				<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            	Sales Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
			</TD>
		</tr>
	</table>

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
<center><cfinclude template="sales_popup_data.cfm"></center>