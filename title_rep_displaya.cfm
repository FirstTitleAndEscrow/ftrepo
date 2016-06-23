<cfparam name="buyer_lname" default="">
<cfparam name="buyer_fname" default="">
<cfparam name="seller_fname" default="">
<cfparam name="seller_lname" default="">
<cfparam name="comments" default="">
<cfparam name="appraisal_status" default="">
<cfparam name="sortorder" default="">
<cfparam name="user_id" default="">
<cfparam name="oda_month" default="">
<cfparam name="title_id" default="">
<cfparam name="prop_id" default="">
<cfparam name="company_id" default="">
<cfparam name="yearmonthday" default="">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE ID = '#session.comp_id#'
	ORDER BY company ASC
</CFQUERY>

<cfif read_company.child_ids eq '' or read_company.child_ids eq 'NULL'>
<cfset read_company.child_ids = 99999999>
</cfif>

<CFSET r_count = "0">

<cfoutput>

<CFIF IsDefined("form.title_id")>
	<cfif #title_id# NEQ "NONE">
		<CFSET title_id = #title_id#>
	</cfif>
</CFIF>

<CFIF IsDefined("form.buyer_fname")>
	<cfif #Trim(buyer_fname)# is not "">
		<CFSET buyer_fname = #buyer_fname#>
	</cfif>
</CFIF>

<CFIF IsDefined("form.buyer_lname")>
	<cfif #Trim(buyer_lname)# is not "">
		<CFSET buyer_lname = #buyer_lname#>
	</cfif>
</CFIF>

</cfoutput>
<!---Prop_ID--->

	<CFQUERY datasource="#request.dsn#" NAME="read_report">
		SELECT     a.oda_month, a.oda_day, a.oda_year, a.bfirstname1, a.blastname1, a.bfirstname2, a.blastname2, a.Prop_ID As Title_ID, 'P' AS Type
		FROM Property a, Title_Closing_Order_Request_Prop b
		where a.prop_id = b.prop_id and b.A_Req_Closing_Day is null and (a.comp_id = #read_company.id# or a.comp_id IN (select id from Companies where master_co_id = #read_company.id#) or a.comp_id IN (#read_company.child_ids#))
	<CFIF #title_id# NEQ "none">
		AND a.prop_id = '#title_id#'
	</CFIF>
	<CFIF IsDefined("FORM.buyer_fname")>
		AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
	</CFIF>
	<CFIF IsDefined("FORM.buyer_lname")>
		AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
	</CFIF>
		ORDER BY a.prop_id desc
	</CFQUERY>

<!---Title_ID--->
	<CFQUERY datasource="#request.dsn#" NAME="read_report2">
		SELECT     a.oda_month, a.oda_day, a.oda_year, a.bfirstname1, a.blastname1, a.bfirstname2, a.blastname2, a.Title_ID, 'T' AS Type
		FROM title a, Title_Closing_Order_Request b
		where a.title_id = b.title_id and b.A_Req_Closing_Day is null and (a.comp_id = #read_company.id# or a.comp_id IN (select id from Companies where master_co_id = #read_company.id#) or a.comp_id IN (#read_company.child_ids#))
		<CFIF #title_id# NEQ "none">
			AND a.title_id = '#title_id#'
		</CFIF>
		<CFIF IsDefined("FORM.buyer_fname")>
			AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
		</CFIF>
		<CFIF IsDefined("FORM.buyer_lname")>
			AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
		</CFIF>
		ORDER BY a.title_id desc
	</CFQUERY>

<CFSET r_count = #read_report.recordcount# + #read_report2.recordcount#>


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
</CFOUTPUT>
				</center>
				</table>
				</center>
			</td>
		</tr>
	</TBODY>
</table>
<table width=770 border="1" cellpadding="0" cellspacing="0" >
	<TBODY>
		<tr>
			<td width=770 align=middle valign=top bgcolor=e1e1el>
	<!--- =================================== --->
	<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
	<!--- =================================== --->
				<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
					<tr>
						<td width=770 align=left valign=top bgcolor=blue>
							<FONT FACE=ARIAL SIZE=2 color="white">
							<CENTER><B>Closing Request Search by Title Report</B></CENTER>
						</TD>
					</TR>
					<tr>
						<td width=770 align=left valign=top bgcolor=e1e1e1>
							<nobr>
							<cfoutput>
								<a href="https://#cgi.server_name#/client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a>
							</cfoutput>
							</nobr>
							<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
								<tr>
									<td width=770 align=left valign=top bgcolor=d3d3d3>
										<FONT FACE=ARIAL SIZE=1 color="black">
										<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
										The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
										Manage your closing request below by clicking on "closing req"
										</CENTER>
				</TD>
								</TR>
								<tr>
									<td width=770 align=left valign=top bgcolor=d3d3d3>
									<!---------------------------------------------------->
									<!--- AT FIRST RECORD --->
									<!---------------------------------------------------->
										<table width=770 cellpadding=1 cellspacing=1 border=0>
											<tr>
												<td bgcolor=gray width=70 align=center valign=top>
													<FONT FACE=verdana SIZE=1 color="black">
													Order Date
												</td>
												<td bgcolor=gray width=130 align=center valign=top>
													<FONT FACE=verdana SIZE=1 color="black">
													Borrower 1
												</td>
												<td bgcolor=gray width=130 align=center valign=top>
													<FONT FACE=verdana SIZE=1 color="black">
													Borrower 2
												</td>
												<td bgcolor=gray width=50 align=center valign=top>
													<FONT FACE=verdana SIZE=1 color="black">
													Closing
												</td>
											</tr>
											<!--- ======================================================================== --->
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<CFIF IsDefined("count")>
	<CFIF #count# EQ 0>
		<CFSET count = 1>
	</CFIF>
<CFELSE>
	<CFSET count = 1>
</CFIF>
											<!---------------------------------------------------->
											<!--- SET COUNT_END FOR RECORD DISPLAY --->
											<!---------------------------------------------------->
<CFSET count_end = 10000>
<!---<CFSET count_end = #count# + 9>--->
	<!---Props--->
	<CFLOOP QUERY="read_report" startrow="#count#" endrow="#count_end#">
		<CFOUTPUT>
											<tr>
												<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
													<FONT FACE=verdana SIZE=1 color="black">
													#oda_month#/#oda_day#/#oda_year#
												</td>
												<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
													<FONT FACE=verdana SIZE=1 color="black">
													#BFirstName1# #BLastName1#
												</td>
												<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
													<FONT FACE=verdana SIZE=1 color="black">
													#BFirstName2# #BLastName2#
												</td>
												<cfif #yearmonthday# eq 0>
													<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
														<a href="./form_prop_closing_order_request.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.title_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_title_order_req.gif" border=0 ALT="Manage the Property Order Request for this order"></a>
													</td>
												<cfelse>
												<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
													<a href="./form_prop_closing_order_request_day.cfm?comp_id=#comp_id#&yearmonthday=#yearmonthday#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.title_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_title_order_req.gif" border=0 ALT="Manage the Title Order Request for this order"></a>
												</td>
												</cfif>
											</tr>
<CFIF #a_color_trigger# eq "1">
	<CFSET a_bgcolor = "white">
	<CFSET a_color_trigger = "2">
<CFELSE>
	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
</CFIF>
			</CFOUTPUT>
	</CFLOOP>
	<!---Titles--->
	<CFLOOP QUERY="read_report2" startrow="#count#" endrow="#count_end#">
		<CFOUTPUT>
											<tr>
												<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
													<FONT FACE=verdana SIZE=1 color="black">
													#oda_month#/#oda_day#/#oda_year#
												</td>
												<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
													<FONT FACE=verdana SIZE=1 color="black">
													#BFirstName1# #BLastName1#
												</td>
												<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
													<FONT FACE=verdana SIZE=1 color="black">
													#BFirstName2# #BLastName2#
												</td>
												<cfif #yearmonthday# eq 0>
													<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
														<a href="./form_title_closing_order_request.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_title_order_req.gif" border=0 ALT="Manage the Title Order Request for this order"></a>
													</td>
												<cfelse>
												<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
													<a href="./form_title_closing_order_request_day.cfm?comp_id=#comp_id#&yearmonthday=#yearmonthday#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_title_order_req.gif" border=0 ALT="Manage the Title Order Request for this order"></a>
												</td>
												</cfif>
											</tr>
<CFIF #a_color_trigger# eq "1">
	<CFSET a_bgcolor = "white">
	<CFSET a_color_trigger = "2">
<CFELSE>
	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
</CFIF>
			</CFOUTPUT>
	</CFLOOP>





		</table>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</HTML>




