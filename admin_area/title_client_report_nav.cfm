

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
<cfoutput>
	<map name="pp">
<area alt="Click to view general information for this order" coords="4,41,155,84" href="https://#cgi.server_name#/title_client_report_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="Click here to view preclosing data" coords="4,292,154,339" href="https://#cgi.server_name#/title_client_report_nav_pre.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="click here to view post closing data" coords="5,552,159,599" href="https://#cgi.server_name#/title_client_report_nav_post.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="click here to view your order" coords="230,4,370,28" href="./title_report_navu.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">

<area alt="click here to view uploaded files" coords="307,50,439,73" href="./title_uploaded_file.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">



<area alt="click here to upload file for this order" coords="234,96,371,119" href="./title_client_upload.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<cfif #read_payoff_info_1.payoff1_upload# NEQ "">
<area alt="click here to view pay off 1" coords="231,186,375,209" href="./pay_off_title_1_view_only.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif><cfif #read_payoff_info_2.payoff2_upload# NEQ "">
<area alt="click here to view payoff 2" coords="297,225,456,248" href="./pay_off_title_2_view_only.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#>
</cfif><CFIF (#read_current_Commitment_Clauses.s_status# GT "")>
<area alt="click here to view title insurance" coords="378,263,562,287" href="./title_Committment.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>
<area alt="click here to view HUD 1" coords="466,304,615,329" href="./title_view_hud_pg1.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
<cfif #read_current_Commitment_Clauses.insurance_co# EQ "15">
<cfif #read_title_order.e_status# EQ "1">
<area alt="click here to view loan endorsement" coords="297,389,463,410" href="./view_loan_amount_verify.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>
<cfif #read_title_order.e_status# EQ "2">
<area alt="click here to view property endorsement" coords="377,345,568,371" href="./view_proposed_insured_verify.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "16">
<cfif #read_title_order.e_status# EQ "5">
<area alt="click here to view loan endorsement" coords="297,389,463,410" href="./view_loan_amount_verify_s.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<cfif #read_title_order.e_status# EQ "6">
<area alt="click here to view property endorsement" coords="377,345,568,371" href="./view_proposed_insured_verify_s.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "17">
<cfif #read_title_order.e_status# EQ "3">
<area alt="click here to view loan endorsement" coords="297,389,463,410" href="./view_loan_amount_verify_c.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<cfif #read_title_order.e_status# EQ "4">
<area alt="click here to view property endorsement" coords="377,345,568,371" href="./view_proposed_insured_verify_c.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">

</cfif>
</cfif>


<area alt="click here to view Insured Closing Letter" coords="235,428,381,453" href="./ICL_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">

<CFIF (#Read_Title_Order_Req.request_date# EQ "")>
<area alt="click here to request OR view a closing for this order" coords="234,518,388,541" href="./form_title_closing_order_request.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<cfelse>
<area alt="click here to request OR view a closing for this order" coords="234,518,388,541" href="./title_closing_report_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">

</cfif>
<CFIF (#Read_Title_Order_info.c_month# GT "")>
<area alt="click here to view information about scheduled closing" coords="234,606,387,630" href="./Title_Closing_View_info.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif><CFIF (#Read_Title_Order_shipping.recordcount# GT "") and (#Read_Title_Order_shipping.ID# GT "")>
<area alt="click here to view shipping/funding information" coords="289,562,465,587" href="./shipping_info_u.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif>


<area alt="click here to se an email to our preclosing team" coords="233,701,394,722" href="mailto:wcullins@firsttitleservices.com,dmiller@firsttitleservices.com,danderson@firsttitleservices.com">



<area alt="click here to send email to our clocing/ post closing team" coords="234,749,396,773" href="mailto:cwilliams@firsttitleservices.com">

</map>

</cfoutput>




<table WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0" bgcolor="#00339A" height="57">
<tr>
<td>
<table WIDTH="672" CELLPADDING="0" CELLSPACING="0" BORDER="0" border="0">
<cfoutput><tr>
<!--- <td rowspan="2" VALIGN="Middle" width="210"><font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></td>
 ---><td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><b><a href="https://#cgi.server_name#/client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order Detail for Number: #read_title.title_id#</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></span>
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
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="White"><a class="lnk_mhtab" href="./title_client_report_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">General</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav_pre.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Pre-Closing Data</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav_Post.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Closing/Post-Closing Data</font></b></a></td>
</tr>
<tr><td HEIGHT="1" BGCOLOR="White"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
<td HEIGHT="1" BGCOLOR="ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td><td HEIGHT="1" BGCOLOR="ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td><td HEIGHT="1" BGCOLOR="ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
</tr></cfoutput>
</table>
</td></tr></table></td></tr></table>


	<TR>

	<td HEIGHT="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="3" width="1" /></td>
</TR><TR><td VALIGN="Middle"><table class="tbl" CELLPADDING="0" CELLSPACING="0" border="0">
		<TR><td><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="1" /></td>
<cfoutput><td><a class="lnk_mhsubnavsel" href="./title_report_navu.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">View Order</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="./title_client_upload.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Upload File</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="./title_uploaded_file.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">View Uploaded Files</font></a>

<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:wcullins@firsttitleservices.com,dmiller@firsttitleservices.com,danderson@firsttitleservices.com"><font face="arial,helvetica" color="0033CC" size="2">Contact Pre-Closing Team</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:cwilliams@firsttitleservices.com"><font face="arial,helvetica" color="0033CC" size="2">Contact Closing/Post-Closing Team</font></a>
</td></cfoutput>

	</table></TR>
	<TR><td HEIGHT="16" VALIGN="Top"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	<center><font face="arial,helvetica" color="Blue" size="2">NOTE: Title Insurance Commitment files for orders prior to 06/16/03 can be viewed/printed <cfif #read_title.file_upload# GT ""><cfoutput><A HREF="#fileSys.FindFilePath('#read_title.file_upload#', 'url')#" target="new"><font color = red size = 3>here</font></a></cfoutput><cfelse> N/A</CFIF> if available, otherwise check diagram below. If the area on the diagram below is not clickable, that means there is not yet information available for that function.
If you require either a Loan Amount or Proposed Insured endorsement click</font><cfoutput><a href="https://#cgi.server_name#/endorse_modify.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="RED" size="2"> <b>AUTO-ENDORSE</B></font></a></cfoutput><font face="arial,helvetica" color="Blue" size="2">. To view/print them check diagram below.

</font>  </center>
<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	</td>
</TR></td>
<!--- <TR><td align = "center" bgcolor= "d3d3d3" HEIGHT="16" VALIGN="Top"> usemap="#ss"width="595" height="596"

</td>
</TR> --->
<TR><td align = "center" HEIGHT="16" VALIGN="Top"><br><img src="./images/diagram.jpg" border="0" usemap="#pp"></td>
</TR>


</td>

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

</BODY>
</HTML>





