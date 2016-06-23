

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
WHERE id = #user_id_1#
ORDER BY lp_lname ASC
</CFQUERY>
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>1st Title & Esc. Settlement Services Company & Subsid. Companies<</title>
			<STYLE TYPE="text/css">
			body {background-attachment:fixed;scrollbar-base-color:#708090}
			.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
			.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
			.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
			.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
			</style>
	</head>

	<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND=""  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

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
  <td align="right" valign="center">&nbsp;<input type="image" src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
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
								<CFOUTPUT>
									<TR>
					  					<td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          								<td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
        								<td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=1,menubar=1')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
										<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
										<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
										<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
									</tr>
								</CFOUTPUT>
							</center>
			        	 </table>
						</center>
							<CFOUTPUT>
								<tr>
									<td width=780 align=middle valign=top>
										<table border="0" width=770 cellpadding="1" cellspacing="1">
											<tr>
												<td bgcolor=f1f1f1 width=770 align="middle" valign="top">
													<br>
													<font face="Arial" size="2" color="blue"><B>Please select your search choice</B></font>
													<br>
													<br>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</CFOUTPUT>
								<tr>
									<td width=780 align=middle valign=top><!---  onSubmit="CheckForm();" --->

          <CFFORM ACTION="./client_search_criteria.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" METHOD="POST" name = "frm">

			<table bgcolor=gray border="0" width=235 cellpadding="1" cellspacing="1">
              <tr>
                <td bgcolor="d3d3d3" colspan=2 width=235 align="middle" valign="top"><div align="center"><font face="Arial" size="2" color="black"><b>Search
                    Types</b> </font> </div></td>
              </tr>
              <tr>
                <td class = "menu1" bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='F1F1F1'" width="235" align="left" valign="top">
                  <font face="verdana" size="1" color="black"> SITE SEARCH</font></td>
                <td   bgcolor="f1f1f1" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
                  <INPUT TYPE="radio"  NAME="search" VALUE=1 Checked onClick="if (document.frm.property.checked){alert('You cannot choose both Property and Title: Property product has been unchecked');document.frm.property.checked = false; }">
                </td>
              </tr>
              <tr>
                <td bgcolor="f1f1f1" class = "menu1" nowrap onmouseover="this.bgColor='#00CC00'" onmouseout="this.bgColor='F1F1F1'" width="235" align="left" valign="top">
                  <font face="verdana" size="1" color="black"> OWNER NAME SEARCH</font></td>
                <td bgcolor="f1f1f1"  nowrap onmouseover="this.bgColor='00CC00'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
                  <INPUT TYPE="radio" NAME="search" VALUE=2 onClick="if (document.frm.title.checked){alert('You cannot choose both Title and Property: Title product has been unchecked');document.frm.title.checked = false; }">
                </td>
              </tr>
              <tr>
                <td bgcolor="f1f1f1" class = "menu1" nowrap onmouseover="this.bgColor='0099FF'" onmouseout="this.bgColor='F1F1F1'"  width="235" align="left" valign="center">
                  <font face="verdana" size="1" color="black"> PARCEL</font>
                </td>
                <td bgcolor="f1f1f1" nowrap onmouseover="this.bgColor='0099FF'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
                  <INPUT TYPE="radio" NAME="search" VALUE=3> </td>
              </tr>
              <tr>
                <td bgcolor="d3d3d3" colspan=2 width=235 align="middle" valign="top">
                  <INPUT TYPE=image SRC="./images/button_submit.gif" border=0>
                </td>
              </tr>
            </table>
          </CFFORM>
											<tr>
												<td width=780 align=middle valign=top>
													<table border="0" width=770 cellpadding="1" cellspacing="1">

														<tr>
															<td bgcolor=f1f1f1 COLSPAN = 3 width=770 align="left" valign="top">
																<p align="center">Best viewed with Microsoft Internet Explorer 5.x + <br>
        														<a href="https://www.microsoft.com/ie/" target = "new"><IMG height=31 alt="Get Microsoft Internet Explorer" src  ="images/ie5get_animated.gif" width=88 border=0 ></a>
        														<br>
																</p>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>
		</CENTER>
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
</html>
