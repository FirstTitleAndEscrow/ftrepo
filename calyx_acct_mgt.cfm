<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="emp" DEFAULT="0">
<cfparam name="user_id_1" default="0">




<CFQUERY datasource="#request.dsn#" NAME="read_company">
    SELECT *
    FROM companies
    WHERE ID = '#comp_id#'
    ORDER BY company ASC
</CFQUERY>

<CFIF #read_company.companies_switch# eq "1">
    <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
        SELECT *
        FROM companies_User
        WHERE id = '#emp#'

    </CFQUERY>
    <CFSET emp = "#read_company_user.ID#">
</CFIF>

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

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#">

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
		<CFOUTPUT><TR>
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&company_id=#read_company.id#user_id_1=0&lo_id=0';return false;"><a class="menu1" href="./contact_team.cfm?comp_id=#comp_id#&company_id=#read_company.id#user_id_1=0&lo_id=0"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
          <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=1,menubar=1')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
          <CFIF #read_company.Companies_Switch# eq "1">
              <!---User must be an Administrator to see this stuff --->
              <CFIF IsDefined("read_company_user.Administrator") and #read_company_user.Administrator# eq "1">
                    <!---<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calyx_loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&emp=#emp#';return false;"> <a class="menu1"  href="./calyx_loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&emp=#emp#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>--->
                    <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calyx_loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#';return false;"> <a class="menu1"  href="./calyx_loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
              </CFIF>

          <CFELSE>
            <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calyx_loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#';return false;"> <a class="menu1"  href="./calyx_loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
          </CFIF>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&a_trigger=8&company_id=0&user_id_1=0&lo_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&a_trigger=8&company_id=0&user_id_1=0&lo_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
</tr></CFOUTPUT></center>
			        	 </table>

	</center>

<CFOUTPUT>
	<tr>
		<td width=780 align=middle valign=top>

	<table border="0" width=770 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor=f1f1f1 width=770 align="middle" valign="top">
				<br>
				<font face="Arial" size="2" color="black">
				Welcome to your Account Management<br>
				for <B>#read_company.company#</B><br></font>
				<font face="Arial" size="2" color="blue"><B>Please choose your product(s) you wish to order for your loan
					</B></font>
			<br><br>
			</td>
		</tr>
	</table>

		</td>
	</tr></CFOUTPUT>
	<tr>
		<td width=780 align=middle valign=top><!---  onSubmit="CheckForm();" --->
<CFFORM name = "frm" ACTION="./calyx_loan_proc_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#" METHOD="POST">

	<table bgcolor=gray border="0" width=235 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor="d3d3d3" colspan=2
          width=235 align="middle" valign="top">
			<font face="Arial" size="2" color="black">
			<b>Services</b>
			</font>
			</td>
		</tr>
		<tr>
			<td class = "menu1" bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='F1F1F1'" width="180" align="left" valign="top">
		  		<font face="verdana" size="1" color="black">
TITLE COMMITMENT ORDER</font>

		</td>
		<td   bgcolor="f1f1f1" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
	<INPUT TYPE="checkbox" NAME="title" VALUE=1 onClick="if (document.frm.property.checked){alert('You cannot choose both Property and Title: Property product has been unchecked');document.frm.property.checked = false; }">

			</td>
		</tr>

		<tr>
		</tr>

	<tr>
			<td bgcolor="f1f1f1" class = "menu1" nowrap onmouseover="this.bgColor='CC33CC'" onmouseout="this.bgColor='F1F1F1'" width="180" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
			APPRAISAL REQUEST ORDER</font>
			  	</td>
		<td bgcolor="f1f1f1"  nowrap onmouseover="this.bgColor='CC33CC'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
<INPUT TYPE="checkbox" NAME="appraisal" VALUE=1>

			</td>
		</tr>
		<tr>

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
		<tr><td width=256 align="center" valign="top">
		<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/main.cfm"><IMG alt="Click here to logout" src  ="images/logout.jpg" border=0 ></a>
		<td width=256 align="center" valign="top">
		<cfoutput><a href="./view_demo.cfm?user_id_1=0&lo_id=0&emp=#emp#&comp_id=#comp_id#&company_id=#read_company.id#"><b><IMG alt="Click here to logout" src  ="images/but_web_tutorial.gif" border=0 ></b></a></cfoutput>
		</td>
		</td><td width=256 align="center" valign="top">
		<a href="https://www.surveymonkey.com/Users/18624726/Surveys/61581288746/505399DF-DCF1-445F-A568-21EC4CC8A9B5.asp?U=61581288746&DO_NOT_COPY_THIS_LINK" target = "new"><IMG alt="Click here to logout" src  ="images/button_title_closing_view.gif" border=0 ></a>
		</td>
		</tr>
			<tr><td bgcolor=f1f1f1 COLSPAN = 3 width=770 align="left" valign="top">
			<p align="center">Best viewed with Microsoft Internet Explorer 5.x + <br>
        <a href="https://www.microsoft.com/ie/" target = "new"><IMG height=31 alt="Get Microsoft Internet Explorer" src  ="images/ie5get_animated.gif" width=88 border=0 ></a>
        <br>
		<a href="./scriptX.exe">Click to download script to view/print HUD1s
        </a>
		</p>
			</td>

		</tr>

	</table>

		</td>
	</tr>

	<!--- <tr><td width="770" bgcolor="f1f1f1" align="left" valign="bottom"
</td></tr> --->
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
