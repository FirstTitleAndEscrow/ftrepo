<CFPARAM NAME="search" DEFAULT="0">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	<!---WHERE ID = '#comp_id#' --->
	WHERE ID = '500'
	ORDER BY company ASC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	SELECT *
	FROM users
	<!---WHERE id = #user_id_1# --->
	WHERE id = 790
	ORDER BY lp_lname ASC
</CFQUERY>
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
						<CFFORM NAME="frm" ACTION="./client_search_submit.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" ENCTYPE="multipart/form-data" METHOD=POST>
						<center>
						<cfIf #search#eq"1">
							<CENTER><FONT FACE=ARIAL SIZE=2 color="blue"><B>SITE SEARCH</B></CENTER>
						<cfelseIf #search#eq"2">
							<CENTER><FONT FACE=ARIAL SIZE=2 color="blue"><B>NAME SEARCH</B></CENTER>
						<cfelse>
							<CENTER><FONT FACE=ARIAL SIZE=2 color="blue"><B>PARCEL NUMBER SEARCH</B></CENTER>
						</cfif>
						<table width=607 cellpadding=0 cellspacing=0 border=0 bgcolor=f1f1f1>
						<!---Enter Name Criteria First --->
							<CFIF #search# eq "2">
							<table border="0" cellpadding="0" cellspacing="0" >
								<tr>
									<td  colspan=2 width=607  bgcolor="f1f1f1" align=center>
										<FONT FACE=ARIAL SIZE=2 color="blue">
										<B>Enter the first and last name of the property owner.</B><BR>If you do not know the first name you can leave it blank.<BR>The last name field must have at least two letters.
									</td>
								</tr>
							    <tr>
									<td   bgcolor="f1f1f1" align=center>
										<FONT FACE=ARIAL SIZE=3 color="gray">
										First Name:
									</td>
									<td     bgcolor="f1f1f1" align=center>
										<FONT FACE=ARIAL SIZE=3 color="gray">
										Last Name:
									</td>
								</tr>
								<tr>
									<td    bgcolor="f1f1f1" align=center>
										<CFINPUT TYPE="Text" NAME="fname"  REQUIRED="No"  SIZE=19 MAXLENGTH=25
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: 003F1E;
										background-color: E4E3E3;
										border-color: white;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;" >
									</td>
									<td   bgcolor="f1f1f1" align=center>
										<CFINPUT TYPE="Text" NAME="lname"  REQUIRED="Yes" Message="The Last Name must have at least two letters"  SIZE=19 MAXLENGTH=25
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: 003F1E;
										background-color: E4E3E3;
										border-color: white;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;" >
									</td>
								</tr>
							</table>
							</CFIF>
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width=607 colspan=5 bgcolor="f1f1f1" align=center>
										<FONT FACE=ARIAL SIZE=2 color="blue">
										<B>Address Type</B>
									</TD>
								</tr>
								<tr>
									<td bgcolor="f1f1f1" align=center><FONT FACE=ARIAL SIZE=2 color="gray">Mailing Address <cfinput type="radio" checked value="mail" name="addtype">
									</td>
									<td   bgcolor="f1f1f1" align=center><FONT FACE=ARIAL SIZE=2 color="gray">Site Address <cfinput type="radio" value="site" name="addtype"></td>
									<td   bgcolor="f1f1f1" align=center><FONT FACE=ARIAL SIZE=2 color="gray">Both  <cfinput type="radio" value="both" name="addtype"></td>
								</tr>
								</table>
								<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width=607 colspan=5  bgcolor="f1f1f1" align=center>
										<FONT FACE=ARIAL SIZE=2 color="blue">
										<B>Property Address</B>
									</TD>
								</tr>
								<tr>
						<td   bgcolor="f1f1f1" align=center>
							<FONT FACE=ARIAL SIZE=3 color="gray">
							Street Address:
						</td>
						<td   bgcolor="f1f1f1" align=center>
							<FONT FACE=ARIAL SIZE=3 color="gray">
							City:
						</td>
						<td   bgcolor="f1f1f1" align=center>
							<FONT FACE=ARIAL SIZE=3 color="gray">
							County:
						</td>
						<td  bgcolor="f1f1f1" align=center>
							<FONT FACE=ARIAL SIZE=3 color="gray">
							State:
						</td>
						<td  bgcolor="f1f1f1" align=center>
							<FONT FACE=ARIAL SIZE=3 color="gray">
							Zip:
						</td>
					</tr>
					<TR>
						<td   bgcolor="f1f1f1" align=center>
										<!---If this is a property search the first two letters must be entered --->
										<CFINPUT TYPE="Text" NAME="address"  REQUIRED="No" SIZE=30 MAXLENGTH=50
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: 003F1E;
										background-color: E4E3E3;
										border-color: white;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;" >
						</td>
						<td   bgcolor="f1f1f1" align=center>
										<CFINPUT TYPE="Text" NAME="city"  REQUIRED="NO"  SIZE=19 MAXLENGTH=25
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: 003F1E;
										background-color: E4E3E3;
										border-color: white;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;" >
						</td>
						<td   bgcolor="f1f1f1" align=center>
										<CFINPUT TYPE="Text" NAME="county"  REQUIRED="No"   SIZE=19 MAXLENGTH=25
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: 003F1E;
										background-color: E4E3E3;
										border-color: white;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;" >
						</td>
						<td width=30  bgcolor="f1f1f1" align=center>
										<CFINPUT TYPE="Text" NAME="state"  REQUIRED="No"   SIZE=4 MAXLENGTH=25
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: 003F1E;
										background-color: E4E3E3;
										border-color: white;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;" >
						</td>
						<td   bgcolor="f1f1f1" align=center>
										<CFINPUT TYPE="Text" NAME="zip"  REQUIRED="No"   SIZE=9 MAXLENGTH=25
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: 003F1E;
										background-color: E4E3E3;
										border-color: white;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;" >
						</td>
					</TR>
				</table>
				<CFIF #search# eq "3">
				<table border="0" cellpadding="0" cellspacing="0" >
					<tr>
						<td  colspan=2 width=607  bgcolor="f1f1f1" align=center>
							<FONT FACE=ARIAL SIZE=2 color="blue"><B>Parcel</B></center></td>
					</TR>
					<tr>
						<td   bgcolor="f1f1f1" align=center><FONT FACE=ARIAL SIZE=3 color="gray">Starting Parcel Number</td>
						<td   bgcolor="f1f1f1" align=center><FONT FACE=ARIAL SIZE=3 color="gray">Ending Parcel Number</td>
					</tr>
					<TR>
						<td  bgcolor="f1f1f1" align=center>
							<CFINPUT TYPE="Text" NAME="sparcelnum"  REQUIRED="YES" message="You must enter a start number"   SIZE=15 MAXLENGTH=25
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: 003F1E;
										background-color: E4E3E3;
										border-color: white;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;" >
						</td>
						<td  bgcolor="f1f1f1" align=center>
							<CFINPUT TYPE="Text" NAME="eparcelnum"  REQUIRED="YES" message="You must enter an end number"   SIZE=15 MAXLENGTH=25
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: 003F1E;
										background-color: E4E3E3;
										border-color: white;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;" >
						</td>
					</tr>
				</table>
				</cfIf>
				<cfoutput><a href="https://#cgi.server_name#/client_search_options.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_go_back.gif" border=0 ALT="Go to main menu"></a>
			</cfoutput><input type=image border=0 src="./images/button_continue.gif"></NOBR></td></tr>

			</CFForm>
			</TABLE>

		<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>
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