
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
</head>

<BODY TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
    <td width="112" rowspan="2"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/"><img src="images2/ftlogo2.gif" border="0" alt="First Title"></a></td>
    <td height="55" valign="bottom"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/"><img src="images2/but_ftlogo_text.jpg" border="0" alt="First Title & Escrow Services"></a><strong><font color="0000CC" size="6"></font></strong>
      <hr align="left" color="0000FF" width="90%" noshade size="2">
      </td>
  </tr>
  <tr>
    <td height="47" align="center" valign="middle"><img src="images2/but_products_reports.jpg" border="0" alt="Products Reports"></td>
  </tr>
</table>

<cfoutput>
<table align="center" width="85%" bgcolor="##E8EBFF" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center"> <font color="000099" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>A
      copy of your order is below. <br>
      If you require an endorsement to your title binder, please select our new
      auto-endorse feature below.</strong></font> </td>
  </tr></table>
	<table align="center" cellpadding="0" cellspacing="0" border="0" bgcolor="FFFFFF" width="90%">
	<tr>
	<td>
  <p align="center"><a href="https://#cgi.server_name#/endorse_modify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><br><img src="images2/but_auto_endorse.jpg" alt="Auto-Endorse" border="0"></a>
		            </cfoutput>
<CFOUTPUT>  <p>&nbsp;<img src="images2/but_general.jpg" border="0" alt="GENERAL">
			<p><img src="images2/but_pre_closing.jpg" border="0" alt="Pre-Closing Data"></p>
			<p>&nbsp;<img src="images2/but_closing.jpg" border="0" alt="Closing and Post-Closing Data"></p>
<!--------
<a href="./title_report_navu.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<img src="./images/button_view_order.gif" border=0 ALT="View the Title Report for this order"></a> <br>
<a href="./title_client_upload.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<img src="./images/button_upload_file.gif" border=0 ALT="Upload file for this order"></a>


			<cfif #read_payoff_info_1.payoff1_upload# NEQ ""><a href="./pay_off_title_1_view_only.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_1.gif" border=0 ALT="View the Pay Off Info for Lender 1, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_pay_off_1_gray.gif" border=0 ALT="There is no file for this order"></CFIF><br>


			<cfif #read_payoff_info_2.payoff2_upload# NEQ ""><a href="./pay_off_title_2_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_2.gif" border=0 ALT="View the Pay Off Info for Lender 2, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_pay_off_2_gray.gif" border=0 ALT="There is no file for this order"></CFIF>


			<CFIF (#read_current_Commitment_Clauses.s_status# GT "")><a href="./title_Committment.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_title_ins.gif" border=0 ALT="View the Title Insurance Commitment for this order"></a><CFELSE><img src="./images/button_title_ins_faded.gif" border=0 ALT="There is no Title Insurance Commitment for this order"></CFIF>

			<br>

			<a href="./title_view_hud_pg1.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target="New" onClick="window.open('','New','left=0,top=0,width=1010,height=710,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_pre_hud-1.jpg" border=0 ALT="View the HUD-1 report for this Title Order"></a>


			<cfif #read_current_Commitment_Clauses.insurance_co# EQ "15"><cfif #read_title_order.e_status# EQ "1"><a href="./view_loan_amount_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsel.gif" border=0 ALT="View Loan Amount Endorsement for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_l_faded.gif" ALT="Loan amount has not been modified"><br></cfif><cfif #read_title_order.e_status# EQ "2"><a href="./view_proposed_insured_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsep.gif" border=0 ALT="View Proposed Insured Endorsement for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>
			<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "16"><cfif #read_title_order.e_status# EQ "5"><a href="./view_loan_amount_verify_S.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsel.gif" border=0 ALT="View Loan Amount for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_l_faded.gif" ALT="Loan amount has not been modified"></cfif><cfif #read_title_order.e_status# EQ "6"><a href="./view_proposed_insured_verify_s.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsep.gif" border=0 ALT="View Proposed Insured for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>
			<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "17"><cfif #read_title_order.e_status# EQ "3"><a href="./view_loan_amount_verify_c.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsel.gif" border=0 ALT="View Loan Amount for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_l_faded.gif" ALT="Loan amount has not been modified"></cfif><cfif #read_title_order.e_status# EQ "4"><a href="./view_proposed_insured_verify_c.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsep.gif" border=0 ALT="View Proposed Insured for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>
			<cfelse><img src="./images/button_end_l_faded.gif" ALT="Loan Amount has not been modified"><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>



			<CFIF (#Read_Title_Order_info.c_month# GT "")><a href="./Title_Closing_View_info.cfm?A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" ><img src="./images/button_title_order_info.gif" border=0 ALT="View the Closing Information for this order"></a><CFELSE><img src="./images/button_title_order_info_faded.gif" border=0 ALT="There is no Closing Information for this order"></CFIF>
			<CFIF (#Read_Title_Order_shipping.recordcount# GT "") and (#Read_Title_Order_shipping.ID# GT "")><a href="./shipping_info_u.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><img src="./images/button_shipping.gif" border=0 ALT="Manage the Title Insurance Commitment for this order"></a><CFELSE><img src="./images/button_shipping_faded.gif" border=0 ALT="There is no Shipping Information for this order"></CFIF>

			<cfif #read_title_order.ICL_upload# NEQ ""><a href="./ICL_view.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"  ><img src="./images/button_icl_a.gif" border=0 ALT="View the ICL Info for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_icl_a_faded.gif" border=0 ALT="There is no ICL file for this order"></CFIF>
			<br><cfif #read_title_order.ICL_upload2# NEQ ""><a href="./ICL2_view.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><img src="./images/button_icl_ch.gif" border=0 ALT="View ICL for this order so that it can be Printed"></a><CFELSE><img src="./images/button_icl_ch_faded.gif" border=0 ALT="There is no ICL file for this order"></cfIF>
 -------->
  <table align="center" width="97%" bgcolor="##E8EBFF" cellpadding="0" cellspacing="0">
  <tr>
            <td align="center"><font color="FF0000" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>NOTE:
              </strong> <strong>Shaded areas indicate either product has not been
              requested or completed. <br>
              All other highlighted areas are available for viewing.</strong></font>
            </td>
          </tr></table>
  			 <img src="./images/clear.gif" width=99 height=2><br>
			<CFIF #CGI.PATH_INFO# CONTAINS "committment">
			<img src="./images/page_ind_title_committment.gif">
			</CFIF><br>
			<img src="./images/clear.gif" width=98 height=1>

			<img src="./images/clear.gif" width=99 height=2><br>
			<CFIF #CGI.PATH_INFO# CONTAINS "off_title_1">
			<img src="./images/page_ind_pay_off_1.gif">
			<CFELSEIF #CGI.PATH_INFO# CONTAINS "off_title_2">
			<img src="./images/page_ind_pay_off_2.gif">
			</CFIF><br>
			<img src="./images/clear.gif" width=98 height=1>


</CFOUTPUT>
</td></tr></table>

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





