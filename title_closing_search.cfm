<cfparam name="yearmonthday" default="0">
<CFSET r_count = "0">

	<!---=========================================== --->
	<!--- ===/ Get a list of all of the Clients \=== --->

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_companies">
	SELECT *
	FROM companies
	ORDER BY company ASC
</CFQUERY>

<CFSET c_count = "1">
<CFSET a_company_name = ArrayNew(1)>
<CFSET a_company_id   = ArrayNew(1)>

<CFOUTPUT QUERY="read_companies">
	<CFSET a_company_name[c_count] = #company#>
	<CFSET   a_company_id[c_count] = #ID#>
	<CFSET c_count = #c_count# + "1">
</CFOUTPUT>

<!---=========================================== --->
<!---===================================================================== --->
<!--- ===/ Use the list of companies to get a list of all their users \=== --->

<CFSET    users_fname = ArrayNew(2)>
<CFSET    users_lname = ArrayNew(2)>
<CFSET       users_id = ArrayNew(2)>
<CFSET    a_rec_count = ArrayNew(1)>
<CFSET a_count = "1">
<CFSET b_count = "1">

<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="CCC">
	<CFQUERY datasource="#request.dsn#" NAME="read_users">
		SELECT *
		FROM users
		Where comp_id = #a_company_id[CCC]#
		ORDER BY lp_lname ASC, lp_fname ASC
	</CFQUERY>

	<CFOUTPUT QUERY="read_users">
		<CFSET users_fname[CCC][b_count] = #lp_fname#>
		<CFSET users_lname[CCC][b_count] = #lp_lname#>
		<CFSET    users_id[CCC][b_count] = #ID#>
		<CFSET b_count = #b_count# + "1">
	</CFOUTPUT>

	<CFSET a_rec_count[CCC] = #read_users.recordcount#>
	<CFSET b_count = "1">
</CFLOOP> --->
	<!---===================================================================== --->

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_date">
	SELECT a.oda_month
	FROM title a, Title_Closing_Order_Request b
	where a.title_id = b.title_id and b.A_Req_Closing_Day is null
	ORDER BY a.oda_month
</CFQUERY> --->
<CFQUERY datasource="#request.dsn#" NAME="get_children">
	SELECT child_ids
	FROM companies
	where ID = '#comp_id#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
	SELECT a.title_id
	FROM title a, Title_Closing_Order_Request b
	where a.title_id = b.title_id and b.A_Req_Closing_Day is null and (comp_id = '#comp_id#' or comp_id IN (select id from Companies where master_co_id = '#comp_id#')
	<cfif get_children.child_ids neq '' and get_children.child_ids neq 'NULL'>
	or comp_id IN (#get_children.child_ids#)
	</cfif>
	)
	ORDER BY a.title_id
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_propid">
	SELECT a.prop_id
	FROM Property a, Title_Closing_Order_Request_Prop b
	where a.prop_id = b.prop_id and b.A_Req_Closing_Day is null and (comp_id = '#comp_id#' or comp_id IN (select id from Companies where master_co_id = '#comp_id#'))
	ORDER BY a.prop_id
</CFQUERY>

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_date">
	SELECT a.oda_month, a.title_id
	FROM title a, Title_Closing_Order_Request b
	where a.title_id = b.title_id and b.A_Req_Closing_Day is null
	ORDER BY a.oda_month, a.title_id
</CFQUERY> --->

<CFQUERY datasource="#request.dsn#" NAME="read_status">
	SELECT DISTINCT appraisal_status
	FROM title
	ORDER BY appraisal_status
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_Comments">
	SELECT DISTINCT comments
	FROM title
	ORDER BY comments
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE ID = '#comp_id#'
	ORDER BY company ASC
</CFQUERY>

<cfif #read_company.recordcount# GT 0>
	<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE comp_id = #read_company.id#
		ORDER BY lp_lname ASC
	</CFQUERY>
</cfif>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>

</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
	<TBODY>
   		<tr>
  			<td align = "center">
				<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  					<tr>
    					<td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
	    				<td valign="top" align="right"><br>
<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">
							<table border=0 align="right" cellpadding="0" cellspacing=0>
	<tr><td align="right" valign="center">
  <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
&nbsp;&nbsp;</td>
  								<td align="right" valign="center"><input type="text" name="number" size=10></td>
  								<td align="right" valign="center">&nbsp;<input type="image" src="client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
  							</tr><tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr></table>
</cfFORM>
						</td>
  					</tr>
  					<tr>
    					<td valign="top" align="center" width="560"><nobr></nobr><br>
      						&nbsp;
						</td>
  					</tr>
				</table>
			</td>
		</tr>
	</tbody>
</table>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  	<TBODY>
   		<tr>
  			<td>
				<center>
				<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
				<center>
<CFOUTPUT><TR>
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          				<td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         				<td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')';return false;"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
						<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
						<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
						<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
					</tr>
</CFOUTPUT>		</center>
			    </table>
				</center>
			</td>
		</tr>
	</TBODY>
</table>
<table width=776 border="2" cellpadding="0" cellspacing="0" >
	<TBODY>
		<tr>
			<td width=776 align=center border = 1 valign=top bgcolor=e1e1e1>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
				<table width=775 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
					<tr>
						<td width=775 align=left valign=top bgcolor=blue>
							<FONT FACE=ARIAL SIZE=2 color="white">
							<CENTER><B>Schedule Settlement</B></CENTER>
						</TD>
					</TR>
					<tr>
						</TD>
						<td width=775 align=left valign=top bgcolor=elelel>
							<br><br><FONT FACE=ARIAL SIZE=2 color="blue">
							<CENTER><B>Please select below to find your title order, so as to proceed towards scheduling closing</B></CENTER>
						</TD>
					</tr>
<CFFORM METHOD=POST ACTION="./title_rep_displaya.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=1&yearmonthday=#yearmonthday#">
	<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=775 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Number -
						</td>
						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="Title_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>
								<CFOUTPUT QUERY="read_propid"><OPTION VALUE="#Prop_ID#">0232#Prop_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
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
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
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
								clear: none;" >
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>
					</tr>
</CFFORM>

				</table>
			</TD>
		</TR>

			</TD> <td width=775 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="red">
				<CENTER><B>***NOTE***  IF you do not see your order, then the order has already been placed.<br>Check the "Closing Calendar" if you wish to review or make changes to your request.</B></CENTER>
			</TD>
		</TR>
	</table>
<br><nobr><cfoutput><a href="https://#cgi.server_name#/client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>
	<br><br>

			</TD>
		</TR>

	</table>

			</TD>
		</TR>

	</table>

				</td>


			</tr></tbody></table>