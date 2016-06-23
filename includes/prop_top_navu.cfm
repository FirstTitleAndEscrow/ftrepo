
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
			WHERE title_ID = #rec_ID#		
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
			FROM title
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
			WHERE prop_ID = #rec_ID#		
		</CFQUERY>
		
		<CFOUTPUT>
		
		
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=89 align=center valign=top bgcolor=d3d3d3>
				<!--- <a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a>	 --->
			<FONT FACE=verdana SIZE=2 color="blue"><b>  GENERAL</b></FONT>
			</td>
			<td width=470 align=CENTER COLSPAN = "3" valign=top bgcolor=d3d3d3>
				<FONT FACE=verdana SIZE=2 color="blue"><B> PRE-CLOSING DATA</B></FONT><!--- <a href="./client_acct_mgt.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_home.gif" border=0 ALT="Return to the main menu"></a> --->
			</td>
			<td width=250 align=center COLSPAN = 2 valign=top bgcolor=d3d3d3>
				<FONT FACE=verdana SIZE=2 color="blue"><B> CLOSING & POST-CLOSING DATA</B></FONT>
			</td>

							
				
			
		</tr>
		<tr>
	<td width=89 align=center valign=top bgcolor=d3d3d3>
			<a href="./view_the_prop_order.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><img src="./images/button_view_order.gif" border=0 ALT="View the Title Report for this order"></a> <br>
			<a href="./title_client_upload.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><img src="./images/button_upload_file.gif" border=0 ALT="Upload file for this order"></a> 
			
			
			</td>		
			
		
		
			<td width=120 align=center valign=top bgcolor=d3d3d3>
			<cfif #read_payoff_info_1.payoff1_upload# NEQ ""><a href="./pay_off_title_1_view_only.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_1.gif" border=0 ALT="View the Pay Off Info for Lender 1, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_pay_off_1_gray.gif" border=0 ALT="There is no file for this order"></CFIF><br>

			
			<cfif #read_payoff_info_2.payoff2_upload# NEQ ""><a href="./pay_off_title_2_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_2.gif" border=0 ALT="View the Pay Off Info for Lender 2, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_pay_off_2_gray.gif" border=0 ALT="There is no file for this order"></CFIF>
			
			
			
			
			</td>
		

		
			
			<td width=120 align=center valign=top bgcolor=d3d3d3>
			<CFIF (#read_current_Commitment_Clauses.s_status# GT "")><a href="./title_Committment.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_title_ins.gif" border=0 ALT="View the Title Insurance Commitment for this order"></a><CFELSE><img src="./images/button_title_ins_faded.gif" border=0 ALT="There is no Title Insurance Commitment for this order"></CFIF>
			
			<br>
			
			<!--- <a href="./title_view_hud_pg1.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target="New" onClick="window.open('','New','left=0,top=0,width=1010,height=710,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_pre_hud-1.jpg" border=0 ALT="View the HUD-1 report for this Title Order"></a> --->
			
			</td>
	
			
			
				<td width=120 align=center valign=top bgcolor=d3d3d3>	
			<cfif #read_current_Commitment_Clauses.insurance_co# EQ "15"><cfif #read_title_order.e_status# EQ "1"><a href="./view_loan_amount_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsel.gif" border=0 ALT="View Loan Amount Endorsement for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_l_faded.gif" ALT="Loan amount has not been modified"><br></cfif><cfif #read_title_order.e_status# EQ "2"><a href="./view_proposed_insured_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsep.gif" border=0 ALT="View Proposed Insured Endorsement for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>
			<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "16"><cfif #read_title_order.e_status# EQ "5"><a href="./view_loan_amount_verify_S.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsel.gif" border=0 ALT="View Loan Amount for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_l_faded.gif" ALT="Loan amount has not been modified"></cfif><cfif #read_title_order.e_status# EQ "6"><a href="./view_proposed_insured_verify_s.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsep.gif" border=0 ALT="View Proposed Insured for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>
			<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "17"><cfif #read_title_order.e_status# EQ "3"><a href="./view_loan_amount_verify_c.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsel.gif" border=0 ALT="View Loan Amount for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_l_faded.gif" ALT="Loan amount has not been modified"></cfif><cfif #read_title_order.e_status# EQ "4"><a href="./view_proposed_insured_verify_c.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new"><img src="./images/button_endorsep.gif" border=0 ALT="View Proposed Insured for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>
			<cfelse><img src="./images/button_end_l_faded.gif" ALT="Loan Amount has not been modified"><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>
			
			</td>
			
			
			
			
			<td width=120 align=center valign=top bgcolor=d3d3d3>			
				
			<CFIF (#Read_Title_Order_info.c_month# GT "")><a href="./Title_Closing_View_info.cfm?A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" ><img src="./images/button_title_order_info.gif" border=0 ALT="View the Closing Information for this order"></a><CFELSE><img src="./images/button_title_order_info_faded.gif" border=0 ALT="There is no Closing Information for this order"></CFIF>
			<CFIF (#Read_Title_Order_shipping.recordcount# GT "") and (#Read_Title_Order_shipping.ID# GT "")><a href="./shipping_info_u.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><img src="./images/button_shipping.gif" border=0 ALT="Manage the Title Insurance Commitment for this order"></a><CFELSE><img src="./images/button_shipping_faded.gif" border=0 ALT="There is no Shipping Information for this order"></CFIF>
			</td>
			<td width=120 align=center valign=top bgcolor=d3d3d3>
			<cfif #read_title_order.ICL_upload# NEQ ""><a href="./ICL_view.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"  ><img src="./images/button_icl_a.gif" border=0 ALT="View the ICL Info for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_icl_a_faded.gif" border=0 ALT="There is no ICL file for this order"></CFIF>
			<br><cfif #read_title_order.ICL_upload2# NEQ ""><a href="./ICL2_view.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><img src="./images/button_icl_ch.gif" border=0 ALT="View ICL for this order so that it can be Printed"></a><CFELSE><img src="./images/button_icl_ch_faded.gif" border=0 ALT="There is no ICL file for this order"></cfIF>
			</td>
			
			</tr>
	
	</table>	
	<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
			<tr><td width=780 align=center valign=top bgcolor=d3d3d3>
	<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><FONT FACE=ARIAL SIZE=2 color="red">
				<B>NOTE: </b>Shaded areas indicate either product has not been requested or completed. All other highlighted areas are available for viewing.
				</CENTER>
	</td>
	
	</tr></table>
				<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
	
	
	<tr>	
			<td bgcolor=e1e1e1 width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "committment"><img src="./images/page_ind_title_committment.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td bgcolor=e1e1e1 width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "off_title_1"><img src="./images/page_ind_pay_off_1.gif"><CFELSEIF #CGI.PATH_INFO# CONTAINS "off_title_2"><img src="./images/page_ind_pay_off_2.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>				
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2>
				<!--- <SCRIPT LANGUAGE="JavaScript">
if (window.print) {
document.write('<form>'
+ '<input type=button name=print value="Print" '
+ 'onClick="javascript:window.print()"></form>');
}
</script><br>			 --->
			</td>
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br>			
			</td>
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br>				
			</td>
		</tr>
	</table>
	<p>
		
	
	
</CFOUTPUT>