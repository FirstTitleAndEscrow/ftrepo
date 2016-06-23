<CFPARAM NAME="code" DEFAULT="">
	<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
			FROM ancillary
			WHERE anc_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request_anc
				Where anc_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_info">
				SELECT *
				FROM eventlist
				Where anc_Id = #rec_id#
			</CFQUERY>

					<CFIF #Read_Title_Order_Req.a_sent_by# GT 0 AND #Read_Title_Order_Req.a_filled_out_by# GT 0>
						<CFSET A_Update_DB_Flag = 3>
					<CFELSE>
						<CFSET A_Update_DB_Flag = 0>
					</CFIF>

	<CFQUERY datasource="#request.dsn#" NAME="read_file_upload">
			SELECT *
			FROM ancillary_detl
			WHERE anc_ID = #rec_ID# and order_type='#URL.code#'
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM ancillary
			WHERE anc_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>
<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_sel_company.team_id#">
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


		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM ancillary
			WHERE anc_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

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
.menu1 {color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;}
.menu1:hover   {font:normal bold 11px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}
</style>

<STYLE TYPE="text/css"><!--
		A { color:#0033CC; text-decoration:none}
		BODY { font-family:arial,helvetica; margin-left:0; margin-top:0; margin-right:0;}
		A:hover,A:active { text-decoration:underline}
		TD { font-family:arial,helvetica;}

	--></STYLE>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

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
  <td align="right" valign="center">&nbsp;<input type="image" src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
  </tr>
   <tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
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

		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		 <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT>
			        	 </table></center>




		<table width=770 border="0" cellpadding="0" cellspacing="0" >
  <TBODY>


	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>


<table WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0" bgcolor="#00339A" height="57">
<tr>
<td>
<table WIDTH="672" CELLPADDING="0" CELLSPACING="0" BORDER="0" border="0">
<cfoutput><tr>
<!--- <td rowspan="2" VALIGN="Middle" width="210"><font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></td>
 ---><td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><b><a href="https://#cgi.server_name#/client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order Detail for Number: #url.code#-#read_title.anc_id#</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></span>
</td>
</tr></cfoutput>
<tr>
<td HEIGHT="20" ALIGN="Left" VALIGN="Bottom" >

</td></tr></table></td></tr></table>


	<TR>

	<cfoutput><td HEIGHT="3"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="3" width="1" /></td>
</TR><TR><td VALIGN="Middle"><table class="tbl" CELLPADDING="0" CELLSPACING="0" border="0">
		<TR><td><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="27" /></td></cfoutput>
<cfoutput><td><a class="lnk_mhsubnavsel" href="./title_report_nav_credit.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&code=#url.code#"><font face="arial,helvetica" color="0033CC" size="2">View Order</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />

<cfif #read_title_order.codeSigning# neq "">

<CFIF (#Read_Title_Order_Req.request_date# eq "")>
<a class="lnk_mhsubnavsel" href="./form_anc_closing_order_request.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Request</font></a>
<cfelse><a class="lnk_mhsubnavsel" href="./anc_closing_report_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Request</font></a>
</cfif>


<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />

<CFIF (#Read_Title_Order_info.c_month# neq "")>
<a class="lnk_mhsubnavsel" href="./anc_Closing_View_info.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Info</font></a>
<cfelse><font face="arial,helvetica" color="gray" size="2">Closing Info</font></cfif>



<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:#team_email#"><font face="arial,helvetica" color="0033CC" size="2">Contact Pre-Closing Team</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:#team_email#"><font face="arial,helvetica" color="0033CC" size="2">Contact Post-Closing Team</font></a>

<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />
	</cfif>
<!--- <CFIF (#Read_Title_Order.ancillary_upload# neq "")>
<a class="lnk_mhsubnavsel" href="./ancillary_view.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Uploaded Doc</font></a>
<cfelse><font face="arial,helvetica" color="gray" size="2">Uploaded Doc</font></cfif> --->

<CFIF (#read_file_upload.file_uploaded# neq "")>
<a class="lnk_mhsubnavsel" href="./ancillary_view.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&code=#URL.code#"><font face="arial,helvetica" color="0033CC" size="2">Uploaded Doc</font></a>
<cfelse><font face="arial,helvetica" color="gray" size="2">Uploaded Doc</font></cfif>


</td></cfoutput>

	</table></TR>

<TR><td HEIGHT="16" VALIGN="Top"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	<center><font face="arial,helvetica" color="Blue" size="2">

<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	</td>
</TR></td>
<TR><td align = "center" HEIGHT="16" VALIGN="Top"><br>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3><br><br>

<P><FONT FACE=ARIAL SIZE=2>
<cfoutput>
<!--- 	<A HREF="#fileSys.FindFilePath('#Read_Title_Order.ancillary_upload#', 'url')#" target="new">Click to View/Print Ancillary doc upload</a><BR> --->
	<A HREF="#fileSys.FindFilePath('#read_file_upload.file_uploaded#', 'url')#" target="new">Click to View/Print Ancillary doc uploaded</a><BR>
Adobe Acrobat Reader Required
</cfoutput>
<P></FONT>

		</td>
</TR>


</td>

	</td>
	</tr>




</TD>
	</TR>


			</TD>
	</TR>


		</td>
	</tr><!--- ====================================================================== ---><!--- ====================================================================== ---><!--- ====================================================================== --->





	</table>


			</td>
		</tr>

	</table>

	</td></tr>
	<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>

	</tbody></table>


	</CENTER></CENTER>

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

