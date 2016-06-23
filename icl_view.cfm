<CFPARAM NAME="emp" DEFAULT="0">

	<!--- 07/12/05   N/temp get rid the second rec_id & comma --->
	<CFIF #len(rec_ID)# gt 5 and #rec_ID# neq "null" and rec_id contains ",">
	<CFSET pos = #Find(",", rec_id, 1 )#>
	<cfset rec_id = #left(rec_ID,pos-1)#>
  </CFIF>

	<!---<cfoutput>#rec_ID#</cfoutput><br--->

		<CFQUERY datasource="#request.dsn#" NAME="read_for_indicator">

			SELECT *
			FROM Tax_Cert_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstract">

			SELECT *
			FROM Doc_Abstract_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_info">
				SELECT *
				FROM eventlist
				Where Title_Id = #rec_id#
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
			FROM Appraisal_Doc_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_1">
			SELECT *
			FROM Pay_Off_Lender_1_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">
			SELECT *
			FROM Pay_Off_Lender_2_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>
<!--- 07/12/05   N/temp get rid the second rec_id & comma --->
	<CFIF #len(rec_ID)# gt 5 and #rec_ID# neq "null" and rec_id contains ",">
	<CFSET pos = #Find(",", rec_id, 1 )#>
	<cfset rec_id = #left(rec_ID,pos-1)#>
  </CFIF>


<cfquery name="get_file" datasource="#request.dsn#">
select * from title where title_id = #rec_ID#
</cfquery>
<cfquery name="get_icl" datasource="#request.dsn#">
select * from  Doc_Abstract_Title where title_id = #rec_ID#
</cfquery>
<!--- #url.rec_ID#--->

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
<!---  emp not  0 and not ""??? 07/18/05     --->
<CFIF #read_company.companies_switch# eq "1" and #emp# neq 0 and #emp# neq "" >
    <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
        SELECT *
        FROM companies_user
        WHERE ID = #emp#
    </CFQUERY>
    <CFSET emp = #read_company_user.ID#>
</CFIF>

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
  <a href="./quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
&nbsp;&nbsp;</td>
  <td align="right" valign="center"><input type="text" name="number" size=10></td>
  <td align="right" valign="center">&nbsp;<input type="image" src="/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
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
		   <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
         <CFIF #read_company.companies_switch# eq "1">
            <!--- check if admin is defined  07/18/05   --->
						<CFIF IsDefined("read_company_user.Administrator") and #read_company_user.Administrator# eq "1">
            <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
            </CFIF>
         <CFELSE>
               <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
        </CFIF>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='/calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT>
			        	 </table></center>



 <table width=770 border="0" cellpadding="0" cellspacing="0" >
  <TBODY>

	<tr>
		<td width=780 align=middle valign=top bgcolor=e1e1el>

<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>


<table WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0" bgcolor="#00339A" height="57">
<tr><td>
<table WIDTH="672" CELLPADDING="0" CELLSPACING="0" BORDER="0" border="0">
<cfoutput><tr>
<!--- <td rowspan="2" VALIGN="Middle" width="210"><font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></td>
 ---><td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><b><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order Detail for Number: #read_title.title_id#</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></span>
</td>
</tr></cfoutput>
<tr><td HEIGHT="20" ALIGN="Left" VALIGN="Bottom" >
<table class="tbl_mhtabs" CELLPADDING="0" CELLSPACING="0" BORDER="0"  height="20">
<tr>
<td WIDTH="16" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="16" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_fln.gif" border="0" height="20" width="3" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_lcn.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="#ebf0f9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rcns.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_lcs.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="White"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rs.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_lns.gif"  border="0" height="20" width="10" /></td>
<!--- <td HEIGHT="2" BGCOLOR="#ebf0f9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rn.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_nn.gif"  border="0" height="20" width="10" /></td>
 ---><td HEIGHT="2" BGCOLOR="#ebf0f9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rn.gif" border="0" height="20" width="10" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_xn.gif" border="0" height="20" width="3" /></td>
</tr>

<cfoutput><tr>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">General</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="White"><a class="lnk_mhtab" href="./title_client_report_nav_pre.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Pre-Closing Data</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav_post.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Closing/Post-Closing Data</font></b></a></td>
<!--- <td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Contact Us</font></b></a></td>
 ---></tr></cfoutput>

<tr><td HEIGHT="1" BGCOLOR="#ABB7C9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="1" /></td><td HEIGHT="1" BGCOLOR="White"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="1" /></td><td HEIGHT="1" BGCOLOR="#ABB7C9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="1" /></td><td HEIGHT="1" BGCOLOR="#ABB7C9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="1" /></td></tr></table></td></tr></table></td></tr></table>

	<TR>

	<td HEIGHT="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="3" width="1" /></td>
</TR><TR><td VALIGN="Middle"><table class="tbl" CELLPADDING="0" CELLSPACING="0" border="0">
		<TR><td><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="3" /></td>

<cfoutput>
<td><cfif #read_payoff_info_1.payoff1_upload# NEQ ""><a class="lnk_mhsubnavsel" href="./pay_off_title_1_view_only.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><font face="arial,helvetica" color="0033CC" size="2">Pay Off-1</font></a>
<cfelse> <font face="arial,helvetica" color="gray" size="2">Pay Off-1</font></cfif>

<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />
<cfif #read_payoff_info_2.payoff2_upload# NEQ "">
<a class="lnk_mhsubnav" href="./pay_off_title_2_view_only.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><font face="arial,helvetica" color="0033CC" size="2">Pay Off-2</font></a>
<cfelse>
<font face="arial,helvetica" color="gray" size="2">Pay Off-2</font>
</cfif>

<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />
<CFIF (#read_current_Commitment_Clauses.s_status# GT "")><a class="lnk_mhsubnav" href="./title_Committment.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><font face="arial,helvetica" color="0033CC" size="2">Title Insurance</font></a>
<cfelse>
<font face="arial,helvetica" color="gray" size="2">Title Insurance</font>
</cfif>

<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />
<a class="lnk_mhsubnav" href="https://machine1.firsttitleservices.com/HUD1_2010_PDF.cfm?rec_id=#rec_id#&comp_id=#read_title_order.comp_ID#&bypass=1" target="New" onClick="window.open('','New','left=0,top=0,width=1010,height=710,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><font face="arial,helvetica" color="0033CC" size="2">PRE HUD-1</font></a>
<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />
<cfif #read_current_Commitment_Clauses.insurance_co# EQ "15">

				<cfif #read_title_order.e_status# EQ "1"><a class="lnk_mhsubnav" href="./view_loan_amount_verify.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><font face="arial,helvetica" color="0033CC" size="2">Loan Endorsement</font></a>
				<CFELSE><font face="arial,helvetica" color="gray" size="2">Loan Endorsement</font>
				</cfif>
			<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />

				<cfif #read_title_order.e_status# EQ "2"><a class="lnk_mhsubnav" href="./view_proposed_insured_verify.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><font face="arial,helvetica" color="0033CC" size="2">Property Endorsement</font></a>
				<CFELSE><font face="arial,helvetica" color="gray" size="2">Property Endorsement</font></cfif>

			<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "16">
				<cfif #read_title_order.e_status# EQ "5"><a class="lnk_mhsubnav" href="./view_loan_amount_verify_S.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><font face="arial,helvetica" color="0033CC" size="2">Loan Endorsement</font></a>
				<CFELSE><font face="arial,helvetica" color="gray" size="2">Loan Endorsement</font></cfif>

			<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />

				<cfif #read_title_order.e_status# EQ "6"><a class="lnk_mhsubnav" href="./view_proposed_insured_verify_s.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><font face="arial,helvetica" color="0033CC" size="2">Property Endorsement</font></a>
				<CFELSE><font face="arial,helvetica" color="gray" size="2">Property Endorsement</font></cfif>

			<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "17">
				<cfif #read_title_order.e_status# EQ "3"><a class="lnk_mhsubnav" href="./view_loan_amount_verify_c.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><font face="arial,helvetica" color="0033CC" size="2">Loan Endorsement</font></a>
				<CFELSE><font face="arial,helvetica" color="gray" size="2">Loan Endorsement</font>
				</cfif>

			<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />

				<cfif #read_title_order.e_status# EQ "4"><a class="lnk_mhsubnav" href="./view_proposed_insured_verify_c.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><font face="arial,helvetica" color="0033CC" size="2">Property Endorsement</font></a>
				<CFELSE><font face="arial,helvetica" color="gray" size="2">Property Endorsement</font>
				</cfif>

			<cfelse><font face="arial,helvetica" color="gray" size="2">Loan Endorsement</font>
			<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />

			<font face="arial,helvetica" color="gray" size="2">Property Endorsement</font>
			</cfif>
<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />

				<cfif #read_title_order.ICL_upload# NEQ ""><a class="lnk_mhsubnav" href="./ICL_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Insured Closing Letter</font></a>
				<CFELSE><font face="arial,helvetica" color="gray" size="2">Insured Closing Letter</font>


</cfif>

</td>
</cfoutput>

	</table></TR>
		<TR><td HEIGHT="16" VALIGN="Top"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	<center><font face="arial,helvetica" color="Blue" size="2">
If you require either a Loan Amount or Proposed Insured endorsement click</font><cfoutput><a href="./endorse_modify.cfm?emp=#emp#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="RED" size="2"> <b>AUTO-ENDORSE</B></font></a></cfoutput> </font></center>

<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	</td>
</TR></td>

<TR><td align = "center" HEIGHT="16" VALIGN="Top"><br>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3><br><br>
		<cfif #get_icl.abstractor_ICL_upload# NEQ "">
<P><FONT FACE=ARIAL SIZE=2>
<cfoutput>
	<A HREF="#fileSys.FindFilePath('#get_icl.abstractor_ICL_upload#', 'url')#" target="new">Click to View/Print ICL upload</a><BR>
Adobe Acrobat Reader Required
</cfoutput>
<P></FONT>

<cfelseif #get_icl.abstractor_ICL_upload# EQ "" and #get_file.request_icl# eq "Yes">
<P><FONT FACE=ARIAL SIZE=2>
Our system indicates that you have already requested an ICL for this order, but is not yet uploaded to be viewed. You may contact one of our employees to check on the status.
<P></FONT>
<cfelse>
<CFIF #a_trigger# NEQ "2">
<cfFORM ACTION="./icl_view.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#rec_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=2&company_id=#read_title_order.comp_ID#" METHOD=POST>

 <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ICL REQUEST REQUIREMENTS</B></CENTER>
			</TD>

</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

				<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
					<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
					 Lender Name
						</td>


						<td width=219 bgcolor="f1f1f1" align=left valign=top>
	<INPUT NAME="aname" VALUE="" SIZE=40 MAXLENGTH=120
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
	</td></tr>

					<tr>
					<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
					Address
						</td>


						<td width=219 bgcolor="f1f1f1" align=left valign=top>
	<INPUT NAME="aaddress" VALUE="" SIZE=40 MAXLENGTH=120
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
	</td></tr>
	<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
					City
						</td>

						<td width=219 bgcolor="f1f1f1" align=left valign=top>
<INPUT NAME="acity" VALUE="" SIZE=20 MAXLENGTH=120
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
	</td></tr>


						<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
					State
						</td>

						<td width=519 bgcolor="f1f1f1" align=left valign=top>
	<INPUT NAME="astate" VALUE="" SIZE=2 MAXLENGTH=2
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
	</td></tr>

					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
			Zip Code
						</td>

						<td width=519 bgcolor="f1f1f1" align=left valign=top>
									<INPUT NAME="azip" VALUE="" SIZE=10 MAXLENGTH=120
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
	</td></tr>
<tr><td width=607 align=right colspan = 2 valign=bottom>

			<NOBR><input type=image border=0 src="./images/button_submit_title.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>

	<tr>






<cfif Len(read_abstract.abstractor_icl_upload)>
<tr><td width=607 align=right colspan = 2 valign=bottom>
<cfoutput><FONT FACE=ARIAL SIZE=1 color="gray">An ICL Has been Uploaded for this file, click the link below to view it.<br>
<a href="#fileSys.FindFilePath('#read_abstract.abstractor_icl_upload#', 'url')#" target="_blank">#read_abstract.abstractor_icl_upload#</a></font></cfoutput>
</td>
</tr>
</cfif>

				</table>
</cfform>
<cfelse>
<CFQUERY datasource="#request.dsn#" >
				update title
				set request_icl = 'Yes'
				where title_id = #rec_id#

</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">

			UPDATE Title
			SET aname = '#aname#',
			aaddress = '#aaddress#',
			acity = '#acity#',
			azip = '#azip#'
			WHERE title_ID = #rec_ID#




</CFQUERY>

<!---<CFMAIL
TO="nelli@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="ICL requested for order #rec_id#"
TIMEOUT="600"
>--->


<CFMAIL
TO="binders@firsttitleservices.com"
FROM="binders@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="ICL requested for order #rec_id#"
TIMEOUT="600"
>


ICL has been requested for order #rec_id#

Lender Name is '#aname#';

Address is : '#aaddress#', '#acity#', '#azip#'

First Title Staff
</CFMAIL>

<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
<font size=2 color=blue face=arial>
ICL has been requested. Thank you.
</TD></tr>
<cfif Len(read_abstract.abstractor_icl_upload)>
<tr><td width=607 align=right colspan = 2 valign=bottom>
<cfoutput><FONT FACE=ARIAL SIZE=1 color="gray">An ICL Has been Uploaded for this file, click the link below to view it.<br>
<a href="#fileSys.FindFilePath('#read_abstract.abstractor_icl_upload#', 'url')#" target="_blank">#read_abstract.abstractor_icl_upload#</a></font></cfoutput>
</td>
</tr>
</cfif>
</cfif>
	<td></tr></table>

</cfif>


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