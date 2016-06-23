<CFPARAM NAME="merge2" DEFAULT="">
<CFPARAM NAME="merge3" DEFAULT="">
<CFPARAM NAME="merge1" DEFAULT="">
<CFQUERY datasource="#request.dsn#" NAME="read_for_indicator">

			SELECT *
			FROM Tax_Cert_Prop
			WHERE prop_ID = #rec_ID#


		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="end_rates">
		SELECT *
		FROM end_rates
		ORDER BY ENDORSEMENTS ASC
	</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_abstract">

			SELECT *
			FROM Doc_Abstract_Prop
			WHERE prop_ID = #rec_ID#


		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Prop
			WHERE Prop_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request_Prop
				Where prop_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_info">
				SELECT *
				FROM eventlist
				Where prop_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_shipping">
				SELECT *
				FROM Shipping_info
				Where Id = #rec_id#
			</CFQUERY>
					<CFIF #Read_Title_Order_Req.a_sent_by# GT 0 AND #Read_Title_Order_Req.a_filled_out_by# GT 0>
						<CFSET A_Update_DB_Flag = 3>
					<CFELSE>
						<CFSET A_Update_DB_Flag = 0>
					</CFIF>


<CFQUERY datasource="#request.dsn#" NAME="read_appraisal">

			SELECT *
			FROM Appraisal_Doc_Prop
			WHERE title_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_1">
			SELECT *
			FROM Pay_Off_Lender_1_Prop
			WHERE Prop_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">
			SELECT *
			FROM Pay_Off_Lender_2_Prop
			WHERE Prop_ID = #rec_ID#
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Prop
			WHERE Prop_ID = #rec_ID#
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>





<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM Property
WHERE prop_id = #URL.rec_id#
</CFQUERY>



<cfquery name="get_file1" datasource="#request.dsn#">
SELECT client_upload1
FROM  property
WHERE prop_id = #get.title_ID#
</CFQUERY>


<cfquery name="get_file2" datasource="#request.dsn#">
SELECT client_upload2
FROM  Property
WHERE property_id = #get.title_ID#
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

		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')';return false;"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
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
 ---><td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><b>Order Detail for Number: #read_title.title_id#</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></span>
</td>
</tr></cfoutput>
<tr>
<td HEIGHT="20" ALIGN="Left" VALIGN="Bottom" >
<table class="tbl_mhtabs" CELLPADDING="0" CELLSPACING="0" BORDER="0"  height="20">

<td WIDTH="18" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="16" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_fls.gif" border="0" height="20" width="3" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_lcs.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="White"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rs.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_lns.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="ebf0f9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rn.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_nn.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="ebf0f9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rn.gif" border="0" height="20" width="10" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_xn.gif" border="0" height="20" width="3" /></td>
</tr>
<tr><cfoutput>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="White"><a class="lnk_mhtab" href="./prop_client_report_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">General</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./prop_client_report_nav_pre.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Pre-Closing Data</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./Prop_client_report_nav_Post.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Closing/Post-Closing Data</font></b></a></td>
</tr>
<tr><td HEIGHT="1" BGCOLOR="White"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
<td HEIGHT="1" BGCOLOR="ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td><td HEIGHT="1" BGCOLOR="ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td><td HEIGHT="1" BGCOLOR="ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
</tr></cfoutput>
</table>
</td></tr></table></td></tr></table>


	<TR>

	<cfoutput><td HEIGHT="3"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="3" width="1" /></td>
</TR><TR><td VALIGN="Middle"><table class="tbl" CELLPADDING="0" CELLSPACING="0" border="0">
		<TR><td><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="27" /></td></cfoutput>
<cfoutput><td><a class="lnk_mhsubnavsel" href="./prop_report_navu.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">View Order</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="./prop_client_upload.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Upload File</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="./prop_uploaded_file.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">View Uploaded Files</font></a>
<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:cguay@firsttitleservices.com,fhenry@firsttitleservices.com,lbrady@firsttitleservices.com,shaunat@firsttitleservices.com,ndean@firsttitleservices.com,jwalls@firsttitleservices.com,fziad@firsttitleservices.com,wcullins@firsttitleservices.com,dmiller@firsttitleservices.com,danderson@firsttitleservices.com"><font face="arial,helvetica" color="0033CC" size="2">Contact Pre-Closing Team</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:cwilliams@firsttitleservices.com"><font face="arial,helvetica" color="0033CC" size="2">Contact Closing/Post-Closing Team</font></a>
</td></cfoutput>

	</table></TR>

<TR><td HEIGHT="16" VALIGN="Top"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	<center><font face="arial,helvetica" color="Blue" size="2">
If you require either a Loan Amount or Proposed Insured endorsement click</font><cfoutput><a href="https://#cgi.server_name#/endorse_modify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="RED" size="2"> <b>AUTO-ENDORSE</B></font></a></cfoutput> </font></center>

<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	</td>
</TR></td>


<TR>

<td align = "center" HEIGHT="16" VALIGN="Top"><br>


<table width=690 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=690 align=center valign=top bgcolor=d3d3d3>
		<br><br>

<center><P><FONT FACE=ARIAL color="blue" SIZE=2><b>
	This area is designed for merging endorsements to the HUD-1
for this particular client file. Select endorsement(s) below and click "merge"</b>	</center>

</td></tr></table>
<CFIF #a_trigger# NEQ "2">
<cfFORM ACTION="./merge_endorsements_prop.cfm?comp_id=#comp_id#&rec_id=#rec_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=2&company_id=#read_title_order.comp_ID#" METHOD=POST>

	<table width=690 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
<tr>
						<td width=325 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							HUD-Endorsements
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
			<SELECT NAME="merge1"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none;"
			rows="5"
			cols="45"
			>
			<OPTION VALUE=""></OPTION
			><cfoutput query="end_rates"><OPTION VALUE="#ENDORSEMENTS#">#ENDORSEMENTS#</OPTION></CFOUTPUT>
			</SELECT><br>
			<SELECT NAME="merge2"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none;"
			rows="5"
			cols="45"
			>
			<OPTION VALUE=""></OPTION
			><cfoutput query="end_rates"><OPTION VALUE="#ENDORSEMENTS#">#ENDORSEMENTS#</OPTION></CFOUTPUT>
			</SELECT><br>
			<SELECT NAME="merge3"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none;"
			rows="5"
			cols="45"
			>
			<OPTION VALUE=""></OPTION>
			<cfoutput query="end_rates"><OPTION VALUE="#ENDORSEMENTS#">#ENDORSEMENTS#</OPTION></CFOUTPUT>
			</SELECT>
						</td>
					</tr>
					</table>
				<table width=690 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
					<tr>
						<td width=690 bgcolor="f1f1f1" align=right valign=top>

				<input type=image border=0 src="./images/button_submit.gif">
						</td>
	</tr></table>
	 </cfFORM>
		<CFELSE>
	<CFQUERY datasource="#request.dsn#" NAME="end_rates1">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge1#'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="end_rates2">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge2#'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="end_rates3">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge3#'
		</CFQUERY>
	<cfif #end_rates1.recordcount# GT "0">
<cfif #merge1# eq "">
<cfset mergenum1 = 0>
<cfelse>
<cfset mergenum1 = #round(end_rates1.rates)#>
</cfif>
<cfelse>
<cfset mergenum1 = 0>
</cfif>

<cfif #end_rates2.recordcount# GT "0">
<cfif #merge2# eq "">
<cfset mergenum2 = 0>
<cfelse>
<cfset mergenum2 = #round(end_rates2.rates)#>
</cfif>
<cfelse>
<cfset mergenum2 = 0>
</cfif>

<cfif #end_rates3.recordcount# GT "0">
<cfif #merge3# eq "">
<cfset mergenum3 = 0>
<cfelse>
<cfset mergenum3 = #round(end_rates3.rates)#>
</cfif>
<cfelse>
<cfset mergenum3 = 0>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="hud">
				select * from hud_form_prop_pg2
				where prop_id = #rec_id#

</CFQUERY>

<CFSET a_total_settlmnt_charges = #hud.a_1400_a# + #mergenum1# + #mergenum2# + #mergenum3#>

<CFQUERY datasource="#request.dsn#" >
				update hud_form_prop_pg2
				set a_1400_a = '#a_total_settlmnt_charges#',
				a_1306_a = '#merge1#',
				a_1307_a = '#merge2#',
				a_1308_a = '#merge3#',
				a_1306_b = '#mergenum1#',
				a_1307_b = '#mergenum2#',
				a_1308_b = '#mergenum3#'
				where prop_id = #rec_id#

</CFQUERY>

<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
<font size=2 color=blue face=arial>
The endorsement(s) you selected have been merged to the HUD-1 of this order
</TD></tr>


</CFIF>




<P></FONT></FONT>


	<td></tr></table>

<br><br><br>
</td>
</TR>


</td>

	</td>
	</tr>


	</td>
	</tr>




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


