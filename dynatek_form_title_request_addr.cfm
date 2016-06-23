<CFPARAM NAME="Temp_Loan_ID" DEFAULT="0">
<CFPARAM NAME="comp_id" DEFAULT="">

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

<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
	SELECT *
	FROM first_title_states
	ORDER BY st_abbrev ASC
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Property Request Form</title>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
</head>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
  	<tr>
  		<td align = "center">
			<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  				<tr>
    				<td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
				    <td valign="top" align="right"><br>
<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#">
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
    				<td valign="top" align="center" width="560"><nobr></nobr><br>&nbsp;</td>
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
		 				<!---<td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          				<td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         				<td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
						<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
						<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
						<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>--->
					</tr>
</CFOUTPUT>
				</center>
			    </table>
					<p>

					<p>
<CFFORM NAME="frm" ACTION="./dynatek_form_title_request_addr_verify.cfm?&comp_id=#comp_id#&zip_trigger=0" ENCTYPE="multipart/form-data" METHOD=POST>
				<center>
				<table width=607 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
				<B>You have been sent to this page because either a City, State, or Zip Code is missing</B>
<!--- =================================== --->
<!--- ===/ Property  Info [ FIRST ]  \=== --->
<!--- =================================== --->
					<tr>
						<td width=607 colspan=3  bgcolor="f1f1f1" align=center>
						<FONT FACE=ARIAL SIZE=2 color="blue">
						Enter the City, State AND Zip Code for this property.  If you do not know the Zip Code, you may enter "0" and our web system will calculate the <u><b>Zip Code</b></u> and the <u><b>County</b></u> for the property.
						<p>
						</td>
					</tr>
					<tr>
						<td width=305  bgcolor="f1f1f1" align=center>
						<FONT FACE=ARIAL SIZE=1 color="gray">
						City:
						</td>
						<td width=114  bgcolor="f1f1f1" align=center>
						<FONT FACE=ARIAL SIZE=1 color="gray">
						State:
						</td>
						<td width=414  bgcolor="f1f1f1" align=center>
						<FONT FACE=ARIAL SIZE=1 color="gray">
						Zip:
						</td>
					</tr>
<CFIF #zip_trigger# EQ "1">
					<tr>
						<td width=305  bgcolor="f1f1f1" align=center>
							<CFINPUT TYPE="Text" NAME="pcity" VALUE="#pcity1#" REQUIRED="Yes" Message="You must enter a CITY" SIZE=19 MAXLENGTH=25
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
						<td width=114  bgcolor="f1f1f1" align=center>
							<select name="pstate" onchange="stateresult()"
									size="1"
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
									clear: none;
									float: none;"
									rows="3"
									cols="45"
									>
<CFOUTPUT QUERY="read_state_list">
<CFIF #st_abbrev# EQ "#pstate1#">
							<option value="#st_abbrev#" SELECTED>#st_abbrev#</option>
<CFELSE>
							<option value="#st_abbrev#">#st_abbrev#</option>
</CFIF>
</CFOUTPUT>
							</select>

						</td>
						<td width=405  bgcolor="f1f1f1" align=center>
						<CFINPUT TYPE="Text" NAME="pzip" VALUE="#pzip1#" REQUIRED="Yes" Message="You must enter a zip code" SIZE=19 MAXLENGTH=25
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
<CFELSE>
					<tr>
						<td width=305  bgcolor="f1f1f1" align=center>
							<CFINPUT TYPE="Text" NAME="pcity"  REQUIRED="Yes" Message="You must enter a CITY" SIZE=19 MAXLENGTH=25
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
						<td width=114  bgcolor="f1f1f1" align=center>
							<select name="pstate" onchange="stateresult()"
									size="1"
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
									clear: none;
									float: none;"
									rows="3"
									cols="45"
									>
					<CFOUTPUT QUERY="read_state_list">
							<option value="#st_abbrev#">#st_abbrev#</option>
					</CFOUTPUT>
								</select>

					</td>
					<td width=405  bgcolor="f1f1f1" align=center>
							<CFINPUT TYPE="Text" NAME="pzip" REQUIRED="Yes" Message="You must enter a zip code" SIZE=19 MAXLENGTH=25
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
</CFIF>

			</table>

				</center></p>
<p>
		</TD>
	</TR>
	<tr>
		<td width=770 align=center valign=bottom>
			<NOBR>
			<cfoutput><a href="https://#cgi.server_name#/uploadfileform.cfm?comp_id=#comp_id#&title=#title#&appraisal=#appraisal#"><img src="./images/button_go_back.gif" border=0 ALT="Go to main menu"></a>
			</cfoutput><input type=image border=0 src="./images/button_continue.gif"></NOBR></td></tr>
</CFFORM>
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
