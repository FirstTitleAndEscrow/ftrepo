<cfparam name ="searchtype" default="refinance">
<cfparam name ="pstate" default="AK">
<cfparam name ="pcounty" default="">
<cfparam name ="loanamt_float" default="00000">
<cfparam name ="loanamt_float4" default="00000">
<cfparam name="form.prev_loan_amt" default="0">
<cfparam name="form.prev_loan_mo" default="0">
<cfparam name="form.prev_loan_year" default="0">
<!--- <cfoutput>#loanamt_float#</cfoutput>
<cfoutput>#searchtype#</cfoutput>
<cfoutput>#pstate#</cfoutput>
 --->

 <CFQUERY datasource="#request.dsn#" NAME="read_state_list">
SELECT * FROM first_title_states_all ORDER BY st_abbrev ASC
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT * FROM companies WHERE ID = '#comp_id#' ORDER BY company ASC
</CFQUERY>
<cfif #read_company.recordcount# GT 0>
  <CFQUERY datasource="#request.dsn#" NAME="read_user">
  SELECT * FROM users WHERE comp_id = #read_company.id# ORDER BY lp_lname ASC
  </CFQUERY>
  <CFIF #read_company.companies_switch# eq "1">
    <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
    SELECT * FROM companies_user WHERE ID = #emp#
    </CFQUERY>
  </cfif>
	</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>1st Title&Escrow, Inc.</title>

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
          <cfFORM NAME="Search" METHOD="Post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">
            <input type="hidden" name="emp" value = "#emp#">
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
    <center>
      <table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
        <center>
          <!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->
          <CFOUTPUT>
		  <TR>
              <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
              <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator_rick.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator_rick.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
              <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
              <CFIF #read_company.companies_switch# eq "1">
                <CFIF #read_company_user.Administrator# eq "1">
                  <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"><a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
                </CFIF>
                <CFELSE>
                <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"><a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
              </CFIF>
              <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
              <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
              <!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 --->
            </tr>
          </CFOUTPUT>
        </center>
      </table>
    </center>

		</tbody>


<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>

    <tr>
      <td width=770 align=left valign=top bgcolor="navy"><CENTER>
          <FONT FACE=ARIAL SIZE=2 color="white"><B>Closing Fees Calculator</B></font>
        </CENTER></TD>
    </TR>
    <tr>
      <td width=770 align=left valign=top bgcolor=elelel><FONT FACE=ARIAL SIZE=2 color="blue"> <nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput>
        <CENTER>
          <B>Please indicate the following</B>
        </CENTER>
        </nobr> </TD>
    </TR>
		</table>

<!--- for all properties with loan amount greater than 1000000 display in calculator 1109 'Call for quote'--->
		<cfif #loanamt_float# gte "5000000">
		<cfset msg=#UrlEncodedFormat("Call for quote!")#>

			<CFLOCATION URL="https://#cgi.server_name#/calculator_rick.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&msg1109=#msg#&loc=#url.loc#&a_trigger=#url.a_trigger#&srcht=#searchtype#&pst=#pstate#&pcnt=#pcounty#&lnmt=#loanamt_float#&lnmt4=#loanamt_float4#&prev_loan_amt=#form.prev_loan_amt#&prev_loan_mo=#form.prev_loan_mo#&prev_loan_year=#form.prev_loan_year#">



<!---if not MD go back to calculations <cflocation url="https://firsttitleservices.com/calculator_rick.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#msg=#msg#&loc=2&a_trigger=30"> --->

		<cfelseif (pstate eq "MD" and searchtype neq "Purchase") or (pstate eq "NY" and searchtype NEQ "Purchase")>
			<table width="770" cellpadding=1 cellspacing=1 border=0 bgcolor="BFBFBF">
    	   <CFFORM action="https://#cgi.server_name#/calculator_rick.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#url.loc#&a_trigger=#url.a_trigger#&srcht=#searchtype#&pst=#pstate#&pcnt=#pcounty#&lnmt=#loanamt_float#&lnmt4=#loanamt_float4#&prev_loan_amt=#form.prev_loan_amt#&prev_loan_mo=#form.prev_loan_mo#&prev_loan_year=#form.prev_loan_year#" METHOD=POST>
      			<input type="hidden" name="emp" value = "#emp#">

<!--- <td width="770" align="center" valign="top" >    from <table> below      --->

        		<nobr><tr  >
				   <td width="770" colspan=2 align=center valign=top bgcolor=elelel>
				   <FONT FACE=ARIAL SIZE=2 color="red"><CENTER><B>
		<cfif pstate eq "NY">
		If new financing is being obtained with existing lender, please provide amount of original loan if CEMA Applies.
		<cfelse>
		If property use is Primary Residence, please fill out field "Estimated Principal Balance"<br>
		  If Investment/Other - leave it empty and click "Proceed"
		</cfif>

					</B></CENTER>
					</td>
				</tr></nobr>
        		<tr>
           		<td width= 770 colspan=2 align="center">
				  <font color="blue">
					Property Use:(check one)
				  </font>
				 </td>
        		</tr>
        		<tr>
				  <td width="385" align="right">Primary residence:</td>
        		  <td width="385" align="left"><input type="radio" name="property_use" value="1" checked></td>
				</tr>
				<tr>
          		  <td width="385" align="right">Investment/Other:</td>
				  <td width="385" align="left"><input type="radio" name="property_use"  value="2"></td>
        		</tr>
				<!--- <tr>
				   <td width="600" align=left valign=top bgcolor=elelel>
				   <FONT FACE=ARIAL SIZE=2 color="red"><CENTER><B>
          If property use is Primary Residence, please fill out field "Estimated Principal Balance"<br>
		  If Investment/Other - leave it empty and click "Proceed"
					</B></CENTER>
					</td>
				</tr> --->
				<tr>
						<td width="385" align="right">
						<cfif pstate eq "NY">
						Original Loan Amount
						<cfelse>
						Estimated Principal Balance(s)<br>on existing loan
						</cfif>
						</td>
						<td width="385" align="left"><input type="text" name="estimated_loan" value=""></td>

				</tr>

				<NOBR>
          	<tr><td idth="770" colspan=2 align="center"><input type=image border=0 src="./images/button_proceed.gif">
			&nbsp;&nbsp;&nbsp;&nbsp;</NOBR>
        	</TD></tr>
		  </table>

    	</cfform>
		<cfelse>
			<CFLOCATION URL="https://#cgi.server_name#/calculator_rick.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#url.loc#&a_trigger=#url.a_trigger#&srcht=#searchtype#&pst=#pstate#&pcnt=#pcounty#&lnmt=#loanamt_float#&lnmt4=#loanamt_float4#&prev_loan_amt=#form.prev_loan_amt#&prev_loan_mo=#form.prev_loan_mo#&prev_loan_year=#form.prev_loan_year#">
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
</HTML>




