<CFPARAM NAME="a_trigger"   DEFAULT="0">
<CFPARAM NAME="emp"   DEFAULT="0">
<CFPARAM NAME="ordering_co"   DEFAULT="0">

<CFIF #property# eq 1>
	<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
		SELECT *
		FROM first_title_states_all
		ORDER BY st_abbrev ASC
	</CFQUERY>
<CFELSE>
	<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
		SELECT *
		FROM first_title_states
		ORDER BY st_abbrev ASC
	</CFQUERY>
</CFIF>
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

<CFIF #read_company.companies_switch# eq "1">
    <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
        SELECT *
        FROM companies_user
        WHERE ID = #emp#
    </CFQUERY>
    <CFSET emp = #read_company_user.ID#>
</CFIF>

</cfif>
<!--- ===/ Check the city and state info \=== --->
<!--- ===/ to ensure it is accurate      \=== --->


		<CFIF #zip_trigger# EQ "2">

			<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">

				SELECT *
				FROM zip_info
				WHERE zip_id = #zip_id#

			</CFQUERY>

		<CFELSE>

			<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">

				SELECT *
				FROM zip_info
				WHERE city = '#pcity#' AND state = '#pstate#' AND zip = '#pzip#'

			</CFQUERY>

		</CFIF>

		<CFIF #read_zip_code.recordcount# EQ "0">
		<CFQUERY datasource="#request.dsn#" NAME="read_zip">
				SELECT distinct zip
				FROM zip_info
				WHERE city = '#pcity#' AND state = '#pstate#'

			</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_city">

				SELECT distinct city
				FROM zip_info
				WHERE zip = '#pzip#' AND state = '#pstate#'

			</CFQUERY>

				<CFQUERY datasource="#request.dsn#" NAME="read_both_city">

				SELECT distinct city
				FROM zip_info
				WHERE state = '#pstate#'

			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="read_both_zip">

				SELECT distinct zip
				FROM zip_info
				WHERE state = '#pstate#'

			</CFQUERY>
			<cfif #a_trigger# eq 7>
			<cfif #title# eq 1>

			</cfif>
			</cfif>
			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
			<html>
			<head>
			<title>1st Title & Escrow, Inc. - Property Request Form</title>




<script type="text/javascript">
function cityresult() {
var frm;
frm = document.frm;

  frm.pcity.value = frm.city.options[frm.city.selectedIndex].value;

}

</script>
	<script type="text/javascript">
function zipresult() {
var frm;
frm = document.frm;

  frm.pzip.value = frm.zip.options[frm.zip.selectedIndex].value;

}

</script>
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
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
              <tr>
                <td align="right" valign="center"><a href="./quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a> &nbsp;&nbsp;</td>
                <td align="right" valign="center"><input type="text" name="number" size=10></td>
                <td align="right" valign="center">&nbsp;
                  <input type="image" src="/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
              </tr><tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr></table>
 </cfFORM>
</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>


</td></tr></tbody></table>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>
<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
		<center>
		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		 <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
          <CFIF #read_company.companies_switch# eq "1">
            <CFIF #read_company_user.Administrator# eq "1">
                <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
            </CFIF>
	      <CFELSE>
          <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
          </CFIF>
    <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&ordering_co=#ordering_co#';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>
					<p>
						<CFIF #title# eq 1>
				<img src="./images/label_title.gif">
				<cfelseif #property# eq 1>
				<img src="./images/property_title.gif">
				<cfelseif #appraisal# eq 1>
				<img src="./images/appraisal_title.gif">
				<cfelseif #other# eq 1>
				<img src="./images/ancillary_title.gif">
				</cfif>
		<center>
			<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
			<tr>
				<td width=607 align=center valign=top>
					<FONT FACE=ARIAL SIZE=2 color="red">
					The information you entered is incorrect, because no match was found for:
					<p>
				<CFOUTPUT>
					<NOBR>CITY - <b>#pcity#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;STATE - <b>#pstate#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ZIP - <b>#pzip#</b></NOBR>
					<p>
				</CFOUTPUT>
				</td>
			</tr>
			</table>




	<CFFORM NAME="frm" ACTION="./form_title_request_addr_verify_rick.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&zip_trigger=1&zip_id=0&a_trigger=21&emp=#emp#&ordering_co=#ordering_co#" METHOD=POST>


<center>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->

					<tr>
						<td width=519 colspan=2  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Please Re-Enter the data below.
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
					<tr>
						<td width=305  bgcolor="f1f1f1" align=center>
							<CFINPUT TYPE="Text" NAME="pcity" VALUE="#pcity#" REQUIRED="Yes" Message="You must enter a CITY" SIZE=19 MAXLENGTH=25
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
							<select name="pstate"
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

								<CFIF #st_abbrev# EQ "#pstate#">
							<option value="#st_abbrev#" SELECTED>#st_abbrev#</option>
								<CFELSE>
							<option value="#st_abbrev#">#st_abbrev#</option>
								</CFIF>
					</CFOUTPUT>
								</select>
					<td width=405  bgcolor="f1f1f1" align=center>
							<CFINPUT TYPE="Text" NAME="pzip" VALUE="#pzip#" REQUIRED="Yes" Message="You must enter a zip code" SIZE=19 MAXLENGTH=25
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
			<cfif #read_city.recordcount# gt 0>
			<tr>

			<td width=520 colspan = 4 bgcolor="f1f1f1" align=center>
			<FONT FACE=ARIAL SIZE=1 color="blue"><b>
			Cick on the select button below to check city(ies) that match with the zip code you entered</b></font>
			</tr>
			<tr>
			<td width=520  bgcolor="f1f1f1" align=center>

					<select name="city" onchange="cityresult()"
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
					<option value="" SELECTED>Select City</option>
					<CFOUTPUT QUERY="read_city">


							<option value="#city#">#city#</option>



					</CFOUTPUT>
								</select>
								</td></tr>


			<cfelseif #read_zip.recordcount# gt 0>
			<tr>

			<td width=519  colspan = 4 bgcolor="f1f1f1" align=center>
			<FONT FACE=ARIAL SIZE=1 color="blue"><b>
			Click on the select button below to check zip codes that match with the city you entered</b></font>
			</tr>
			<tr>
			<td width=442 colspan = 3 bgcolor="f1f1f1" align=right>

					<select name="zip" onchange="zipresult()"
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
					<option value="" SELECTED>Select Zip</option>
					<CFOUTPUT QUERY="read_zip">


							<option value="#zip#">#zip#</option>

					</CFOUTPUT>
								</select>
								</td></tr>

			<cfelse>
			<tr>

			<td width=519 colspan=4 bgcolor="f1f1f1" align=center>
			<FONT FACE=ARIAL SIZE=1 color="blue"><b>
			Click on the select buttons below to check city(ies) and zip codes that match with the state you selected</b></font>
			</tr>
			<tr>
			<td width=219  bgcolor="f1f1f1" align=center>

					<select name="city" onchange="cityresult()"
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
					<option value="" SELECTED>Select City</option>
					<CFOUTPUT QUERY="read_both_city">


							<option value="#city#">#city#</option>



					</CFOUTPUT>
								</select>
								</td>

			<td width=119  bgcolor="f1f1f1" align=center>
			</td>
			<td width=219  bgcolor="f1f1f1" align=center>

					<select name="zip" onchange="zipresult()"
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
					<option value="" SELECTED>Select Zip</option>
					<CFOUTPUT QUERY="read_both_zip">


							<option value="#zip#">#zip#</option>

					</CFOUTPUT>
								</select>
								</td></tr>

			</cfif>
		</table>


		<p>
		<tr><td width=770 align=center valign=bottom>
			<NOBR><cfoutput><a href="./client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#&ordering_co=#ordering_co#"><img src="./images/button_go_back.gif" border=0 ALT="Go to main menu"></a>
			</cfoutput><input type=image border=0 src="./images/button_continue.gif"> </NOBR></td></tr>
	</p>
		<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>

	</table></center></p>


</CFFORM>
<cfif #pstate# eq "CA">
<cfset a_trigger = 21>
</cfif>
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

	<CFABORT>


<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->

<CFELSEIF #read_zip_code.recordcount# GT "1">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Title Request Form</title>
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

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#&ordering_co=#ordering_co#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
              <tr>
                <td align="right" valign="center"><a href="./quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a> &nbsp;&nbsp;</td>
                <td align="right" valign="center"><input type="text" name="number" size=10></td>
                <td align="right" valign="center">&nbsp;
                  <input type="image" src="/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
              </tr><tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr></table>
 </cfFORM>
</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>


</td></tr></tbody></table>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>
<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
		<center>
		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm?&emp=#emp#&ordering_co=#ordering_co#" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
         <CFIF #read_company.Companies_Switch# neq "1">
            <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#&ordering_co=#ordering_co#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#&ordering_co=#ordering_co#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
         </CFIF>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#&a_trigger=8&company_id=0&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&emp=#emp#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

					<p>
				<CFIF #title# eq 1>
				<img src="./images/label_title.gif">
				<cfelseif #property# eq 1>
				<img src="./images/property_title.gif">
				<cfelseif #appraisal# eq 1>
				<img src="./images/appraisal_title.gif">
				<cfelseif #other# eq 1>
				<img src="./images/ancillary_title.gif">
				</cfif>

	<CFFORM NAME="frm" ACTION="./form_title_request_addr_verify_rick.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=2&pstate=#pstate#&pcity=#pcity#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&emp=#emp#&ordering_co=#ordering_co#" METHOD=POST>
					<center><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
<CFOUTPUT>
					<tr>
						<td width=519 colspan=2  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							The data you entered returned more than one result. Please select
							the appropriate data from the list below.
							<p><FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_zip_code.recordcount#</B> matches were found.
							<p>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							City:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.city#</B>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							State:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.state#</B>
						</td>
					</tr>
</CFOUTPUT>

					<tr>
						<td width=519 colspan=2  bgcolor="f1f1f1" align=left>
				<table width=400 cellpadding=1 cellspacing=1 border=0>
<CFOUTPUT query="read_zip_code">
					<tr>
						<td width=100  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<nobr><input type=radio value="#zip_id#" NAME="zip_id" checked>&nbsp;&nbsp;&nbsp;Zip: </NOBR>
						</td>
						<td width=100  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#zip#</B>
						</td>

						<td width=100  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County :
						</td>
						<td width=100  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#county#</B>
						</td>

					</tr>

</CFOUTPUT>
				</table>
						</td>
					</tr>
<CFOUTPUT>
					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<a href="./form_title_request_addr_rick.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=1&pcity1=#pcity#&pstate1=#pstate#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&emp=#emp#&ordering_co=#ordering_co#"><img border=0 src="./images/button_go_back.gif"></a>
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<INPUT TYPE=image border=0 src="./images/button_continue.gif">

					</tr>
</CFOUTPUT>

			</table></center>
</CFFORM>

<p>
		</TD>
	</TR>


		<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>

	</table>
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



	<CFABORT>


<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->

<CFELSE>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Title Request Form</title>
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

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#&ordering_co=#ordering_co#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
              <tr>
                <td align="right" valign="center"><a href="./quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a> &nbsp;&nbsp;</td>
                <td align="right" valign="center"><input type="text" name="number" size=10></td>
                <td align="right" valign="center">&nbsp;
                  <input type="image" src="/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
              </tr><tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr></table>
 </cfFORM>
</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>


</td></tr></tbody></table>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>
<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
		<center>
		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
        <CFIF #read_company.Companies_Switch# neq "1">
            <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#&ordering_co=#ordering_co#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#&ordering_co=#ordering_co#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
         </CFIF>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&emp=#emp#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&emp=#emp#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

						 <p>
				<CFIF #title# eq 1>
				<img src="./images/label_title.gif">
				<cfelseif #property# eq 1>
				<img src="./images/property_title.gif">
				<cfelseif #appraisal# eq 1>
				<img src="./images/appraisal_title.gif">
				<cfelseif #other# eq 1>
				<img src="./images/ancillary_title.gif">
				</cfif>
				<p>
<center>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
<CFOUTPUT>
					<tr>
						<td width=519 colspan=2  bgcolor="f1f1f1" align=center>
							<FONT FACE=ARIAL SIZE=2 color="black">
							The proper county instantly displayed at the bottom!  Please check to ensure this appears correctly before selecting "continue".
							<p>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							City:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.city#</B>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							State:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.state#</B>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Zip:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.zip#</B>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.county#</B>
						</td>
					</tr>
</CFOUTPUT>

					</tr>
<CFOUTPUT>
					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<a href="./form_title_request_addr_rick.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=1&pcity1=#pcity#&pstate1=#pstate#&pzip1=#pzip#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&emp=#emp#&ordering_co=#ordering_co#"><img border=0 src="./images/button_go_back.gif"></a>
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<a href="./form_title_request_rick.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=1&pcity=#pcity#&pstate=#pstate#&zip_id=#read_zip_code.zip_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&emp=#emp#&ordering_co=#ordering_co#"><img border=0 src="./images/button_continue.gif"></a>

					</tr>
</CFOUTPUT>

			</table></center>
			</p>

<p>
		</TD>
	</TR>


		<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>

	</table>
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

</CFIF>
