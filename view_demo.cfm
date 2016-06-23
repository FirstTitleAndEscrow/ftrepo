

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
      &nbsp;</td>
  </tr>
</table>


</td></tr></tbody></table>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>
<!---<!--- <center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
		<center>
		<td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')';return false;"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
 <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr></CFOUTPUT></center>
			        	 </table>

	</center> --->


	<tr>
		<td width=780 align=middle valign=top><!---  onSubmit="CheckForm();" --->
<br><br>
	<table bgcolor=gray border="0" width=235 cellpadding="1" cellspacing="1">

		<tr>
			<td bgcolor=d3d3d3 colspan=2
          width=235 align="middle" valign="top">
			<font face="Arial" size="2" color="black">
			<b>Tutorial Segments</b>
			</font>
			</td>
		</tr>
		<tr>
			<td class = "menu1" bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#FF9900'" onmouseout="this.bgColor='#F1F1F1'" width="165" align="left" valign="top">
		  		<font face="verdana" size="1" color="black">
Introduction</font>

		</td>
		<td   bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#FF9900'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap1.html" target="new">Segment 1</a></font>

			</td>
		</tr>
		<tr>
			<td class = "menu1" bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#FF9900'" onmouseout="this.bgColor='#F1F1F1'" width="165" align="left" valign="top">
		  		<font face="verdana" size="1" color="black">
Placing Orders</font>

		</td>
		<td   bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#FF9900'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap2.html" target="new">Segment 2</a></font>

			</td>
		</tr>

		<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#00CC00'" onmouseout="this.bgColor='#F1F1F1'" width="165" align="left" valign="top">
		  		<font face="verdana" size="1" color="black">
				Contact Information</font>
				   </td>
		<td bgcolor=f1f1f1  nowrap onmouseover="this.bgColor='#00CC00'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap3.html" target="new">Segment 3</a></font>

			</td>
		</tr>

	<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#CC33CC'" onmouseout="this.bgColor='#F1F1F1'" width="165" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
			Title Premium Calc.</font>
			  	</td>
		<td bgcolor=f1f1f1  nowrap onmouseover="this.bgColor='#CC33CC'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap4.html" target="new">Segment 4</a></font>

			</td>
		</tr>
		<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'"  width="165" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
		Map, User Admin
</font>
		   			</td>
		<td bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap5.html" target="new">Segment 5</a></font>

			</td>
		</tr>

				<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'"  width="165" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
		Product Reports
</font>
		   			</td>
		<td bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap6.html" target="new">Segment 6</a></font>

			</td>
		</tr>

			<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'"  width="165" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
		Order Details
</font>
		   			</td>
		<td bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap7.html" target="new">Segment 7</a></font>

			</td>
		</tr>

		<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'"  width="165" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
	Endorsement
</font>
		   			</td>
		<td bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap9.html" target="new">Segment 8</a></font>

			</td>
		</tr>

		<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'"  width="165" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
ICL
</font>
		   			</td>
		<td bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap10.html" target="new">Segment 9</a></font>

			</td>
		</tr>
		<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'"  width="165" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
	Loan Scheduling
</font>
		   			</td>
		<td bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap11.html" target="new">Segment 10</a></font>

			</td>
		</tr>
		<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'"  width="165" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
	Loan Closing info
</font>
		   			</td>
		<td bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap12.html" target="new">Segment 11</a></font>

			</td>
		</tr>
				<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'"  width="165" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
Email Team
</font>
		   			</td>
		<td bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap13.html" target="new">Segment 12</a></font>

			</td>
		</tr>
					<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'"  width="165" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
File Notes
</font>
		   			</td>
		<td bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap14.html" target="new">Segment 13</a></font>

			</td>
		</tr>
			<tr>
			<td bgcolor=f1f1f1 class = "menu1" nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'"  width="165" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
 Conclusion
</font>
		   			</td>
		<td bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='#0099FF'" onmouseout="this.bgColor='#F1F1F1'" width="70" align="middle" valign="top">
<font face="verdana" size="1" color="black">
 <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/chap15.html" target="new">Segment 14</a></font>

			</td>
		</tr>

	</table>

<br>
<tr>
		<td width=780 align=middle valign=top>

	<table border="0" width=770 cellpadding="1" cellspacing="1">
<tr><td bgcolor=f1f1f1 colspan = 2 width=770 align="left" valign="top">
			<p align="center">NOTE: Speakers are required for this tutorial, and you can access tutorial by clicking on the above segments<br>
    <!---     <a href="https://www.microsoft.com/windows/windowsmedia/download/default.asp" target = "new"><IMG alt="Get Microsoft Media Player" src  ="images/get_wmp.gif" border=0></a> --->
        </p>
			</td>
		</tr>
<br></table>
			<table border="0" width=770 cellpadding="1" cellspacing="1">
		<tr><td width=770 align="center" valign="top">
		<cfoutput><a href="https://#cgi.server_name#/client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><IMG alt="Click here to logout" src  ="images/but_main_page.gif" border=0 ></a></cfoutput>
		</td>

		</tr>

	</table>
		</td>
	</tr>
<!--- <cfoutput>

		<tr>
		<td width=780 align=middle valign=top>
	<table bgcolor=elelel border="1" width=600 cellpadding="0" cellspacing="0">


		</td>
	</tr>
		<tr>
			<!---<td bgcolor=white width="100" align="middle" valign="top">
				<A onclick="window.open('','New','width=470,height=470,left=40,top=40,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')" href="./loan_offcr_add.cfm?user_id_1=#USER_ID_1#&amp;lo_id=#lo_id#" target=New ><IMG alt="Manage your Account Settings" src ="./images/button_acct_mgt.gif" border=0 ></a>
			</td> <td bgcolor=white width=115 align=center valign=top>
				<a href="./loan_offcr_mgt.cfm?user_id_1=#user_id_1#" target="New" onClick="window.open('','New','width=470,height=470,left=40,top=40,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_manage_loan_offcr.gif" border=0  ALT="Manage your Loan Officers"></a>
			</td> --->
</td> <td bgcolor=white border = 0 width=50 align=center valign=top>&nbsp;
					</td>
			<td bgcolor=white width=125 align=middle valign=top>
				<a href="https://#cgi.server_name#/title_client_rep_view.cfm?user_id_1=#USER_ID_1#&amp;lo_id=#lo_id#&amp;a_trigger=8&amp;company_id=0"><IMG alt="View your Title Commitment Reports" src ="./images/button_prop_view.gif" border=0 ></a>
			</td>

			<td bgcolor=white width=125 align=middle valign=top>
				<a href="https://#cgi.server_name#/title_closing_search.cfm?user_id_1=#USER_ID_1#&amp;lo_id=#lo_id#&amp;a_trigger=0&amp;company_id=0"><IMG alt="Request a Closing for an existing Title order" src ="./images/button_title_view.gif" border=0 ></a>
			</td>

			<td bgcolor=white width=125 align=middle valign=top>
				<a href="https://#cgi.server_name#/calendar.cfm?user_id_1=#USER_ID_1#&amp;lo_id=#lo_id#&amp;company_id=#read_company.id#"><IMG alt="View Scheduled Closings" src ="./images/button_closing_calendar.gif" border=0 ></a>
			</td><!--- <td bgcolor=white width=80 align=center valign=top>button_title_closing_view.gifbutton_closing_calendar.gif
				<a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/button_zip_search1.gif" border=0 ALT="Use this to search for a correct Zip Code"></a>
			</td>
		 <td bgcolor=white width=80 align=middle valign=top>
				<A href="./calculator.cfm?user_id_1=#USER_ID_1#&amp;lo_id=#lo_id#&amp;company_id=#read_company.id#" ><IMG alt="Use this to calculate fees" src ="./images/button_calculator.gif" border=0 ></a>
			</td>--->
		</tr>
	</table></FONT></TD></TR></CFOUTPUT> --->
		<!---<tr>
		 <td width=780 align=middle valign=top>

	<table border="0" width=770 cellpadding="1" cellspacing="1">
		<tr><td width=770 align="left" valign="top">
		<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/main.cfm"><IMG alt="Click here to logout" src  ="images/logout.jpg" border=0 >
		</td>
		</tr>
			<tr><td bgcolor=f1f1f1 width=770 align="left" valign="top">
			<p align="center">Best viewed with Microsoft Internet Explorer 5.x + <br>
        <a href="https://www.microsoft.com/ie/"><IMG height=31 alt="Get Microsoft Internet Explorer" src  ="images/ie5get_animated.gif" width=88 border=0 ></a>
        </p>
			</td>
		</tr>

	</table>

		</td>
	</tr> --->

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
