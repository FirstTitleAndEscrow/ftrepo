
	<CFPARAM NAME="emp" DEFAULT="0">
	<!--- for calyx part N 07/29/05--->
	<cfparam name="user_id_1" default="0">
	<cfparam name="lo_id_" default="0">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE ID = '#comp_id#'
ORDER BY company ASC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_sales">
SELECT *
FROM First_Admin
WHERE ID = '#read_company.intSales#'
</CFQUERY>

<CFIF #read_company.companies_switch# eq "1">
    <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
        SELECT *
        FROM companies_user
        WHERE ID = #emp#
    </CFQUERY>
    <CFSET emp = #read_company_user.ID#>
</CFIF>


	<CFQUERY datasource="#request.dsn#" NAME="get_user">

			SELECT *
			FROM user_client_assoc
			WHERE company_id = #read_company.id#
		order by id
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

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

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
		   <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
         <CFIF #read_company.companies_switch# eq "1">
            <CFIF #read_company_user.Administrator# eq "1">
                 <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	        </CFIF>
            <CFELSE>
                 <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
         </CFIF>

    <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center>


	<tr>
		<td width=780 align=middle valign=top>

	<table border="0" width=770 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor=f1f1f1 width=770 align="middle" valign="top">

				<br><br>

<cfif Mid(read_company.company,1,8) eq 'Flagstar'>

<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR <cfoutput>#Ucase(session.site.short_name)#</cfoutput> CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
			<tr>
			<td width=350 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>NEW ORDERS/PROCESSING:</td>
			<td width=200 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b><a href = "mailto:TEAM_A@FIRSTTITLESERVICES.COM">TEAM_A@FIRSTTITLESERVICES.COM</a></td>
	        </TR>
			<tr>
			<td width=350 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>CLOSING PACKAGES/HUD APPROVAL:</td>
			<td width=200 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b><a href = "mailto:FLAGSTAR@FIRSTTITLESERVICES.COM">FLAGSTAR@FIRSTTITLESERVICES.COM</a></td>
	        </TR>
			<tr>
			<td width=350 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PRE-LIM HUDS, WIRE, CPL, UPDATES:</td>
			<td width=200 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b><a href = "mailto:PREPROCESSING@FIRSTTITLESERVICES.COM">PREPROCESSING@FIRSTTITLESERVICES.COM</a></td>
	        </TR>
			<tr>
			<td width=350 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>CLEARING TITLE:</td>
			<td width=200 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b><a href = "mailto:CLEARANCE@FIRSTTITLESERVICES.COM">CLEARANCE@FIRSTTITLESERVICES.COM</a></td>
	        </TR>
			<tr>
			<td width=350 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>SCHEDULING REQUEST:</td>
			<td width=200 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b><a href = "mailto:SCHEDULING@FIRSTTITLESERVICES.COM">SCHEDULING@FIRSTTITLESERVICES.COM</a></td>
	        </TR>
			<tr>
			<td width=350 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>SUBORDINATION REQUESTS:</td>
			<td width=200 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b><a href = "mailto:SUBORDINATIONS@FIRSTTITLESERVICES.COM">SUBORDINATIONS@FIRSTTITLESERVICES.COM</a></td>
	        </TR>
			<tr>
			<td width=350 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FUNDING DOCS/POST CLOSING:</td>
			<td width=200 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b><a href = "mailto:POSTCLOSING@FIRSTTITLESERVICES.COM">POSTCLOSING@FIRSTTITLESERVICES.COM</a></td>
	        </TR>



<cfelse>
<cftry>
<cfinvoke	component = "cfc.team_info"	method = "getTeam"	returnVariable = "get_team_info" comp_id="#comp_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>
<cfif get_team_info.recordcount gt 0>
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR <cfoutput>#Ucase(session.site.short_name)#</cfoutput> CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
			<tr>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>






		<CFOUTPUT QUERY="get_team_info">
		<cfif get_team_info.Member_id eq get_team_info.Leader_id>
		<tr>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#get_team_info.fname# #get_team_info.lname# - Team Lead</td>
			<td width=190 align=center valign=middle bgcolor=elelel rowspan="#get_team_info.recordcount#">
			<font face=verdana size=2 color=black>#get_team_info.PHONE#</td>
			<td width=130 align=center valign=middle bgcolor=elelel rowspan="#get_team_info.recordcount#">
			<font face=verdana size=2 color=black>#get_team_info.fax#</td>
			<td width=160 align=center valign=middle bgcolor=elelel rowspan="#get_team_info.recordcount#">
			<font face=verdana size=2 color=black><a href="mailto:#get_team_info.email#">#get_team_info.email#</a></td>
		</tr>
		</cfif>
		<cfif get_team_info.Member_id neq get_team_info.Leader_id>
		<tr>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#get_team_info.fname# #get_team_info.lname#</td>
			</tr>
		</cfif>
		</CFOUTPUT>
<!--- 		<cfoutput QUERY="read_sales">
				<tr>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#read_sales.fname# #read_sales.lname# - Sales Rep.</td>
			<td width=190 align=center valign=middle bgcolor=elelel>
			<font face=verdana size=2 color=black>#read_sales.PHONE#</td>
			<td width=130 align=center valign=middle bgcolor=elelel>
			<font face=verdana size=2 color=black>#read_sales.fax#</td>
			<td width=160 align=center valign=middle bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#read_sales.email#">#read_sales.email#</a></td>
		</tr>
      </cfoutput>
 --->		</cfif>

</cfif>





	</table>
			<table border="0" width=770 cellpadding="1" cellspacing="1">
		<tr><td width=770 align="center" valign="top">
		<cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><IMG alt="Click here to logout" src  ="images/but_main_page.gif" border=0 ></a></cfoutput>
		</td>

		</tr>

	</table>
			</td>
		</tr>
	</table>

		</td>
	</tr>


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
