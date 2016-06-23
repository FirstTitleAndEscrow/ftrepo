

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


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>


<STYLE TYPE="text/css"><!--
	A { color:#0033CC; text-decoration:none}
		BODY { font-family:arial,helvetica; margin-left:0; margin-top:0; margin-right:0; font-size='12pt';}
		A:hover,A:active { text-decoration:underline}
		TD { font-family:arial,helvetica; font-size='12pt';}
	--></STYLE>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=780 align=middle valign=top>

 <table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	<tr>
		<td width=780 align=middle valign="bottom" bgcolor="#000000">

	<table bgcolor=000000 border=0 cellspacing=0 cellpadding=0 valign=top width="780">
  <tr>
    <td rowspan="2" valign="middle"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>">
	<img src="/images/fadedblack68.jpg" border="0"></a></td>
   <td valign="center" align="center">
	<img src="/images/productrep.jpg" border="0">
</td>
    <td valign="middle" rowspan="2" align="right">
	<img src="/images/techn.jpg" border="0">
</td>
  </tr>

</table>

		</td>
	</tr>


	<tr>
		<td width=780 align=middle valign=top bgcolor=e1e1el>


<!--- <cfoutput>

<map name="ss">

<area alt="Click here for general information on this order" coords="7,41,154,87" href="https://#cgi.server_name#/title_client_report_nav.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="Click here for Pre-Closing Data on this order" coords="6,292,155,340" href="https://#cgi.server_name#/title_client_report_nav_pre.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="Click here for Closing/Post-Closing information on this order" coords="5,513,159,561" href="https://#cgi.server_name#/title_client_report_nav_post.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="Click here to view order" coords="234,4,366,31" href="./title_report_navu.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">

<area alt="Click here to view uploaded files" coords="318,51,450,78" href="./title_uloaded_file.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">

<area alt="Click here to upload a file for this order" coords="236,96,371,121" href="./title_client_upload.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<cfif #read_payoff_info_1.payoff1_upload# NEQ "">
<area alt="Click here to view Pay Off 1" coords="239,173,372,201" href="./pay_off_title_1_view_only.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
</cfif>
<cfif #read_payoff_info_2.payoff2_upload# NEQ "">
<area alt="Click here to view Pay Off 2" coords="307,214,441,239" href="./pay_off_title_2_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
</cfif>
<CFIF (#read_current_Commitment_Clauses.s_status# GT "")>
<area alt="Click here to vie Title Insurance Commitment for this order" coords="381,257,514,284" href="./title_Committment.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID# target = "new">
</cfif>

<area alt="Click here to vew the Pre HUD-1 for this order" coords="456,302,590,328" href="./title_view_hud_pg1.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID# target = "new"">
<cfif #read_current_Commitment_Clauses.insurance_co# EQ "15">
<cfif #read_title_order.e_status# EQ "1">
<area alt="Click here to view Loan endorsement for this order" coords="382,346,512,372" href="./view_loan_amount_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new" shape="RECT">
</cfif>

<cfif #read_title_order.e_status# EQ "2">
<area alt="Click here to view Proposed Insured for this order" coords="315,392,445,414" href="./view_proposed_insured_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "16">
<cfif #read_title_order.e_status# EQ "5">
<area alt="Click here to view Loan endorsement for this order" coords="382,346,512,372" href="./view_loan_amount_verify_s.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new" shape="RECT">
</cfif>

<cfif #read_title_order.e_status# EQ "6">
<area alt="Click here to view Proposed Insured for this order" coords="315,392,445,414" href="./view_proposed_insured_verify_s.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">

</cfif>

<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "17">
<cfif #read_title_order.e_status# EQ "3">
<area alt="Click here to view Loan endorsement for this order" coords="382,346,512,372" href="./view_loan_amount_verify_c.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new" shape="RECT">

</cfif>

<cfif #read_title_order.e_status# EQ "4">
<area alt="Click here to view Proposed Insured for this order" coords="315,392,445,414" href="./view_proposed_insured_verify_c.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">

</cfif>
</cfif>

<cfif #read_title_order.ICL_upload# NEQ "">
<area alt="Click here to view Insure Closing Letter for this order" coords="237,429,367,450" href="./ICL_view.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<cfelseif #read_title_order.ICL_upload2# NEQ "">
<area alt="Click here to view Insure Closing Letter for this order" coords="237,429,367,450" href="./ICL2_view.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<cfelse>
</cfif>
<CFIF (#Read_Title_Order_info.c_month# GT "")>
<area alt="Click here to view Cosing information for this order" coords="239,501,370,525" href="./Title_Closing_View_info.cfm?A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif>
<CFIF (#Read_Title_Order_shipping.recordcount# GT "") and (#Read_Title_Order_shipping.ID# GT "")>
<area alt="Click here to view Shipping information on this order" coords="242,548,370,573" href="./shipping_info_u.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif>
</map>

</cfoutput> --->
<cfoutput>
		<map name="sa">
<area alt="Click to view general information for this order" coords="4,41,155,84" href="https://#cgi.server_name#/title_client_report_nav.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="Click here to view preclosing data" coords="4,292,154,339" href="https://#cgi.server_name#/title_client_report_nav_pre.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="click here to view post closing data" coords="5,552,159,599" href="https://#cgi.server_name#/title_client_report_nav_post.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="click here to view your order" coords="230,4,370,28" href="./title_report_navu.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">

<area alt="click here to view uploaded files" coords="307,50,439,73" href="./title_uploaded_file.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">



<area alt="click here to upload file for this order" coords="234,96,371,119" href="./title_client_upload.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<cfif #read_payoff_info_1.payoff1_upload# NEQ "">
<area alt="click here to view pay off 1" coords="231,186,375,209" href="./pay_off_title_1_view_only.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
</cfif><cfif #read_payoff_info_2.payoff2_upload# NEQ "">
<area alt="click here to view payoff 2" coords="297,225,456,248" href="./pay_off_title_2_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
</cfif><CFIF (#read_current_Commitment_Clauses.s_status# GT "")>
<area alt="click here to view title insurance" coords="378,263,562,287" href="./title_Committment.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>
<area alt="click here to view HUD 1" coords="466,304,615,329" href="./title_view_hud_pg1.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
<cfif #read_current_Commitment_Clauses.insurance_co# EQ "15">
<cfif #read_title_order.e_status# EQ "1">
<area alt="click here to view loan endorsement" coords="297,389,463,410" href="./view_loan_amount_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>
<cfif #read_title_order.e_status# EQ "2">
<area alt="click here to view property endorsement" coords="377,345,568,371" href="./view_proposed_insured_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "16">
<cfif #read_title_order.e_status# EQ "5">
<area alt="click here to view loan endorsement" coords="297,389,463,410" href="./view_loan_amount_verify_s.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<cfif #read_title_order.e_status# EQ "6">
<area alt="click here to view property endorsement" coords="377,345,568,371" href="./view_proposed_insured_verify_s.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "17">
<cfif #read_title_order.e_status# EQ "3">
<area alt="click here to view loan endorsement" coords="297,389,463,410" href="./view_loan_amount_verify_c.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<cfif #read_title_order.e_status# EQ "4">
<area alt="click here to view property endorsement" coords="377,345,568,371" href="./view_proposed_insured_verify_c.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">

</cfif>
</cfif>


<cfif #read_title_order.ICL_upload# NEQ "">
<area alt="click here to view Insured Closing Letter" coords="235,428,381,453" href="./ICL_view.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif>
<CFIF (#Read_Title_Order_Req.request_date# GT "")>
<area alt="click here to request OR view a closing for this order" coords="234,518,388,541" href="./form_title_closing_order_request.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<cfelse>
<area alt="click here to request OR view a closing for this order" coords="234,518,388,541" href="./title_closing_report_nav.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">

</cfif>
<CFIF (#Read_Title_Order_info.c_month# GT "")>
<area alt="click here to view information about scheduled closing" coords="234,606,387,630" href="./Title_Closing_View_info.cfm?A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif><CFIF (#Read_Title_Order_shipping.recordcount# GT "") and (#Read_Title_Order_shipping.ID# GT "")>
<area alt="click here to view shipping/funding information" coords="289,562,465,587" href="./shipping_info_u.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif>


<area alt="click here to se an email to our preclosing team" coords="233,701,394,722" href="mailto:cguay@firsttitleservices.com,fhenry@firsttitleservices.com,lbrady@firsttitleservices.com,shaunat@firsttitleservices.com,ndean@firsttitleservices.com,jwalls@firsttitleservices.com,fziad@firsttitleservices.com,wcullins@firsttitleservices.com,dmiller@firsttitleservices.com,danderson@firsttitleservices.com">



<area alt="click here to send email to our clocing/ post closing team" coords="234,749,396,773" href="mailto:cwilliams@firsttitleservices.com">


</map>

</cfoutput>

<table WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0" bgcolor="#00339A" height="57"><tr><td>
<table WIDTH="668" CELLPADDING="0" CELLSPACING="0" BORDER="0">
<cfoutput><tr>
<!--- <td rowspan="2" VALIGN="Middle" width="210"><font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></td>
 ---><td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font face="arial,helvetica" color="white" size="2">Order number: #read_title.title_id#</font></b></span>
</td>
</tr></cfoutput>
<td HEIGHT="20" ALIGN="Left" VALIGN="Bottom" ><table class="tbl_mhtabs" CELLPADDING="0" CELLSPACING="0" BORDER="0"  height="20">
<tr>
<td WIDTH="18" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="16" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_fln.gif" border="0" height="20" width="3" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_lcn.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="#ebf0f9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rn.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_nn.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="#ebf0f9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rcns.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_lcs.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="White"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rs.gif" border="0" height="20" width="10" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_xs.gif" border="0" height="20" width="3" /></td>
</tr>
<tr><cfoutput>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">General</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav_pre.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Pre-Closing Data</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="White"><a class="lnk_mhtab" href="./title_client_report_nav_post.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Closing/Post-Closing Data</font></b></a></td>
</cfoutput></tr>

<cfoutput><tr><td HEIGHT="1" BGCOLOR="##ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
<td HEIGHT="1" BGCOLOR="##ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
<td HEIGHT="1" BGCOLOR="White"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
</tr></table></td></tr></table></td></tr></cfoutput></table>





	<TR>

	<cfoutput><td HEIGHT="3"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="3" width="1" /></td>
</TR><TR><td VALIGN="Middle"><table class="tbl" CELLPADDING="0" CELLSPACING="0" border="0">
		<TR><td><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="27" /></td></cfoutput>
<td><cfoutput>

<CFIF (#Read_Title_Order_Req.request_date# neq "")>
<a class="lnk_mhsubnavsel" href="./form_title_closing_order_request.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Request</font></a>
<cfelse><a class="lnk_mhsubnavsel" href="./title_closing_report_nav.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Request</font></a>
</cfif>

<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />

<CFIF (#Read_Title_Order_info.c_month# neq "")>
<a class="lnk_mhsubnavsel" href="./Title_Closing_View_info.cfm?A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Information</font></a>
<cfelse><font face="arial,helvetica" color="gray" size="2">Closing Information</font></cfif>

<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />
			<CFIF (#Read_Title_Order_shipping.recordcount# GT "") and (#Read_Title_Order_shipping.ID# GT "")>
<a class="lnk_mhsubnav" href="/us/en/biz/products/line_desktops.htm"><font face="arial,helvetica" color="0033CC" size="2">Shipping Information</font></a>
<cfelse><font face="arial,helvetica" color="gray" size="2">Shipping Information</font>
</cfif>

</cfoutput>
</td>

	</table></TR>
		<TR><td HEIGHT="16" VALIGN="Top"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="780" />
	<center><font face="arial,helvetica" color="Blue" size="2">NOTE: If the area on the diagram below is not clickable, that means there is not yet information available for that function.
Check our new</font><cfoutput><a href="https://#cgi.server_name#/endorse_modify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="RED" size="2"> <b>AUTO-ENDORSE</B></font></a></cfoutput><font face="arial,helvetica" color="Blue" size="2"> feature, or select either Loan or Property Endorsement under Pre-Closing Information and proceed accordingly.
</font>  </center>
<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="780" />
	</td>
</TR></td>
<!--- <TR><td align = "center" bgcolor= "d3d3d3" HEIGHT="16" VALIGN="Top">width="595" height="596" border="0" usemap="#ss"

</td>
</TR> --->
<TR><td align = "center" HEIGHT="16" VALIGN="Top"><br><img src="./images/diagram.jpg" border="0" usemap="#sa"></td>
</TR>


</td>

	</td>
	</tr>




		</TD>
	</TR>


		</td>
	</tr><!--- ====================================================================== ---><!--- ====================================================================== ---><!--- ====================================================================== --->


	<tr>
		<td width=780 align=left valign=top bgcolor=e1e1el>
		<!--- <nobr><A href="javascript:window.close();"><IMG src="./images/button_close.gif" border=0></a></nobr>
 --->


			</td>


		</tr>



	</table>


			</td>
		</tr>

	</table></CENTER></CENTER>

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





