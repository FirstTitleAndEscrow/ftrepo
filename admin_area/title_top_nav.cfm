<cfif IsDefined("url.order_type")>
<cfset rec_type = url.order_type>
</cfif>

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
<CFQUERY datasource="#request.dsn#" NAME="read_closer">

			SELECT *
			FROM Doc_closer_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
<cfif rec_type eq "app">
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">
			SELECT *
			FROM Appraisal
			WHERE app_ID = #rec_ID#
		</CFQUERY>
<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">
			SELECT *
			FROM title
			WHERE title_ID = #rec_ID#
		</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_misc_docs">
SELECT * FROM upload_many
where title_id = #rec_ID#
ORDER BY ID
</cfquery>


				<CFQUERY datasource="#request.dsn#" NAME="read_tax">

			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>
		<!--- <cfquery name="get_adata" datasource="#request.dsn#">
select * from abstractor_info where title_id = #url.rec_id#
</cfquery> --->

<cfquery name="get_adata" datasource="#request.dsn#">
select * from title_ins_add where title_id = #url.rec_id#
</cfquery>

<cfquery name="get_afile" datasource="#request.dsn#">
select * from doc_abstract_title where title_id = #url.rec_id#
</cfquery>
		<cfquery name="get_cdata" datasource="#request.dsn#">
select * from closer_info where title_id = #url.rec_id#
</cfquery>
		<cfquery name="get_cfile" datasource="#request.dsn#">
select * from doc_closer_title where title_id = #url.rec_id#
</cfquery>
<!--- 		<CFQUERY datasource="#request.dsn#" NAME="read_appraisal">
			SELECT *
			FROM Appraisal_Doc_Title
			WHERE title_ID = #rec_ID#
		</CFQUERY>
 --->
 <CFQUERY datasource="#request.dsn#" NAME="read_appraisal" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #url.rec_id#
			and v.task = 'Appraisal'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
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

	<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment">
				select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs is not null
		</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #URL.rec_id#
			</CFQUERY>

					<CFIF #Read_Title_Order_Req.a_sent_by# GT 0 AND #Read_Title_Order_Req.a_filled_out_by# GT 0>
						<CFSET A_Update_DB_Flag = 3>
					<CFELSE>
						<CFSET A_Update_DB_Flag = 0>
					</CFIF>

<cfparam name="read_title_order.client_upload1" default="">
<cfparam name="read_title_order.client_upload2" default="">
<cfparam name="read_title_order.client_upload3" default="">
<cfparam name="read_title_order.client_upload4" default="">
<cfparam name="read_title_order.payoff_upload" default="">




<CFOUTPUT>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=black>
	<tr>
			<td width=99 align=left valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=99 height=2><br><nobr><a href="./title_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_report.gif" border=0 ALT="Modify this Title Report"></a><a href="./title_order_label.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target = "new"><img src="./images/button_view.gif" border=0 ALT="Print order information label"></a>&nbsp;<img src="./images/ind_started.gif" ALT="Title Report Has Been SUBMITTED"></NOBR><br><a href="./add_blob.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_misc_docs.gif" border=0 ALT="Add docs to this Title Report"></a><cfif get_misc_docs.recordcount>&nbsp;<img src="./images/ind_started.gif" ALT="Documents have Been ADDED"></cfif>
			<nobr><CFIF #read_title_order.client_upload1# NEQ ""><a href="./client1_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID# "><img src="./images/button_upload_c.gif" border=0 ALT="View the client upload-1 for this order, so that it can be Printed"></a><cfelse><img src="./images/button_upload_c_faded.gif" border=0 ALT="There is no file for this order"></CFIF>
<CFIF #read_title_order.client_upload2# NEQ ""><a href="./client2_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_upload.gif" border=0 ALT="View the client upload-2 for this order, so that it can be Printed"></a><cfelse><img src="./images/button_upload_c_faded.gif" border=0 ALT="There is no file for this order"></CFIF></nobr>


			</td>

			<td width=99 align=left valign=top bgcolor=d3d3d3>
<NOBR><a href="./title_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_abstract.gif" border=0 ALT="Manage the Assignment and Reciept of Abstract for this order"></a>
<CFIF (#read_abstract.a_assigned_by# GT "0" or #read_abstract.a_assigned_by# GT "") AND (#read_abstract.abstractor_doc_upload# GT "" OR #read_abstract.abstractor_doc_upload2# GT "" OR #read_abstract.abstractor_doc_upload3# GT "")><img src="./images/ind_closed.gif" ALT="The Abstract for this Order Has Been RECEIVED"><CFELSEIF (#read_abstract.a_assigned_by# GT "0" or #read_abstract.a_assigned_by# GT "") AND (#read_abstract.abstractor_doc_upload# EQ "" and #read_abstract.abstractor_doc_upload2# EQ "" and #read_abstract.abstractor_doc_upload3# EQ "")><img src="./images/ind_started.gif" ALT="The Abstract for this Order Has Been ASSIGNED"><CFELSE><img src="./images/ind_open.gif" ALT="The Abstract for this Order Has NOT been Submitted"></CFIF>

<CFIF #read_abstract.abstractor_doc_upload# NEQ ""><a href="./title_abstract_doc_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID# "><img src="./images/button_view.gif" border=0 ALT="View file-1 Abstract for this order, so that it can be Printed"></a><cfelse><img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order"></CFIF>
<CFIF #read_abstract.abstractor_doc_upload2# NEQ ""><a href="./title_abstract_doc_view2_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view.gif" border=0 ALT="View file-2 Abstract for this order, so that it can be Printed"></a><cfelse><img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order"></CFIF>
<CFIF #read_abstract.abstractor_doc_upload3# NEQ ""><a href="./title_abstract_doc_view3_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" ><img src="./images/button_view.gif" border=0 ALT="View file-3 Abstract for this order, so that it can be Printed"></a></a><cfelse><img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order"></CFIF></nobr>

	<nobr><cfif #get_adata.recordcount# GT "0"> <!--- <a href="./vendor_abstract_view_data.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"> ---><img src="./images/button_vendor_a.gif" border=0 ALT="View the data sent from abstractor, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_vendor_a_faded.gif" border=0 ALT="There is no data for this order">	</CFIF>
<cfif #get_afile.abstract_upload1# NEQ ""><a href="./abstract1_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view.gif" border=0 ALT="View the file-1 Info for Abstractor, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order"></CFIF>
			<cfif #get_afile.abstract_upload2# NEQ ""><a href="./abstract2_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view.gif" border=0 ALT="View the file-2 Info for Abstractor, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order"></CFIF>
		    <cfif #get_afile.abstract_upload3# NEQ ""><a href="./abstract3_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view.gif" border=0 ALT="View the file-3 Info for Abstractor, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order"></CFIF></nobr>



	</td>





<td width=99 align=left valign=top bgcolor=d3d3d3>
<CFIF (#read_title_order.polender1# EQ "") AND (#read_title_order.polender2# GT "") >
<img src="./images/button_pay_off_1_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/button_view_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/ind_open_gray.gif" ALT="There is no Payoff for this order"></NOBR><br>
<NOBR><a href="./pay_off_title_2_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_2.gif" border=0 ALT="Manage the Payoff for Lender 2, for this order"></a>
<cfif #read_payoff_info_2.payoff2_upload# NEQ ""><a href="./pay_off_title_2_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view.gif" border=0 ALT="View the Pay Off Info for Lender 2, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order"></CFIF>

<CFIF (#read_payoff_info_2.a_assigned_by# GT "" OR #read_payoff_info_2.a_assigned_by# GT "0") AND (#read_payoff_info_2.payoff2_upload# GT "")><img src="./images/ind_closed.gif" ALT="The Pay Off Info for Lender 2, for this Order Has Been RECEIVED"><CFELSEIF (#read_payoff_info_2.a_assigned_by# GT "0" OR #read_payoff_info_2.a_assigned_by# GT "") AND (#read_payoff_info_2.payoff2_upload# EQ "")><img src="./images/ind_started.gif" ALT="The Payoff Info for Lender 2, for this Order Has Been Submitted"><CFELSE><img src="./images/ind_open.gif" ALT="The Payoff Info for Lender 2, Has NOT been Submitted"></CFIF></NOBR>
<CFELSEIF (#read_title_order.polender1# GT "") AND (#read_title_order.polender2# EQ "")>
<NOBR><a href="./pay_off_title_1_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_1.gif" border=0 ALT="Manage the Payoff for Lender 1, for this order"></a>
<cfif #read_payoff_info_1.payoff1_upload# NEQ ""><a href="./pay_off_title_1_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view.gif" border=0 ALT="View the Pay Off Info for Lender 1, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order"></CFIF>

<CFIF (#read_payoff_info_1.a_assigned_by# GT "" or #read_payoff_info_1.a_assigned_by# GT "0") AND (#read_payoff_info_1.a_recieved_by# GT "" OR #read_payoff_info_1.a_recieved_by# GT "0" or #read_payoff_info_1.payoff1_upload# GT "")><img src="./images/ind_closed.gif" ALT="The Pay Off Info for Lender 1, for this Order Has Been RECEIVED"><CFELSEIF (#read_payoff_info_1.a_assigned_by# GT "" OR #read_payoff_info_1.a_assigned_by# GT "0") AND  (#read_payoff_info_1.payoff1_upload# EQ "")><img src="./images/ind_started.gif" ALT="The Payoff Info for Lender 1, for this Order Has Been Submitted"><CFELSE><img src="./images/ind_open.gif" ALT="The Payoff Info for Lender 1, Has NOT been Submitted"></CFIF></NOBR><br>
<NOBR><img src="./images/button_pay_off_2_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/button_view_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/ind_open_gray.gif" ALT="There is no Payoff for this order"></NOBR>

<CFELSEIF (#read_title_order.polender1# GT "") AND (#read_title_order.polender2# GT "")>
<NOBR><a href="./pay_off_title_1_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_1.gif" border=0 ALT="Manage the Payoff for Lender 1, for this order"></a>
<cfif #read_payoff_info_1.payoff1_upload# NEQ ""><a href="./pay_off_title_1_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" ><img src="./images/button_view.gif" border=0 ALT="View the Pay Off Info for Lender 1, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order"></CFIF>

<CFIF (#read_payoff_info_1.a_assigned_by# GT "" or #read_payoff_info_1.a_assigned_by# GT "0") AND (#read_payoff_info_1.payoff1_upload# GT "")><img src="./images/ind_closed.gif" ALT="The Pay Off Info for Lender 1, for this Order Has Been RECEIVED"><CFELSEIF (#read_payoff_info_1.a_assigned_by# GT "" OR #read_payoff_info_1.a_assigned_by# GT "0") AND ( #read_payoff_info_1.payoff1_upload# EQ "")><img src="./images/ind_started.gif" ALT="The Payoff Info for Lender 1, for this Order Has Been Submitted"><CFELSE><img src="./images/ind_open.gif" ALT="The Payoff Info for Lender 1, Has NOT been Submitted"></CFIF></NOBR><br>
<NOBR><a href="./pay_off_title_2_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_2.gif" border=0 ALT="Manage the Payoff for Lender 2, for this order"></a>
<cfif #read_payoff_info_2.payoff2_upload# NEQ ""><a href="./pay_off_title_2_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view.gif" border=0 ALT="View the Pay Off Info for Lender 2, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order"></CFIF>
<CFIF (#read_payoff_info_2.a_assigned_by# GT "" OR #read_payoff_info_2.a_assigned_by# GT "0") AND (#read_payoff_info_2.payoff2_upload# GT "")><img src="./images/ind_closed.gif" ALT="The Pay Off Info for Lender 2, for this Order Has Been RECEIVED"><CFELSEIF (#read_payoff_info_2.a_assigned_by# GT "0" OR #read_payoff_info_2.a_assigned_by# GT "") AND (#read_payoff_info_2.payoff2_upload# EQ "")><img src="./images/ind_started.gif" ALT="The Payoff Info for Lender 2, for this Order Has Been Submitted"><CFELSE><img src="./images/ind_open.gif" ALT="The Payoff Info for Lender 2, Has NOT been Submitted"></CFIF></NOBR>
<CFELSE>
			<img src="./images/clear.gif" width=99 height=2><NOBR><img src="./images/button_pay_off_1_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/button_view_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/ind_open_gray.gif" ALT="There is no Payoff for this order"></NOBR><br><NOBR><img src="./images/button_pay_off_2_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/button_view_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/ind_open_gray.gif" ALT="There is no Payoff for this order"></NOBR>

	</CFIF>
<nobr><cfif IsDefined("read_title_order.payoff_upload")><cfif #read_title_order.payoff_upload# neq ""><a href="./pay_off_upload_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_upload.gif" border=0 ALT="View the pay off upload for this order"></a><cfelse><img src="./images/button_pay_off_upload_gray.gif" border=0 ALT="There is no pay off upload for this order"></a></cfif></cfif></nobr>


	</td>

	<td width=98 align=left valign=top bgcolor=d3d3d3>

	<NOBR><a href="./title_Committment.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_title_ins.gif" border=0 ALT="Manage the Title Insurance Commitment for this order"></a><a href="vendor_title_view_data.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="new" ><img src="./images/button_view.gif" border=0 ALT="View the Title Insurance Commitment for this order, so that it can be Printed"></a>&nbsp;<CFIF (#read_current_Commitment_Clauses.a_recieved_by# GT "") OR (#read_current_Commitment_Clauses.a_recieved_by# GT 0)><img src="./images/ind_closed.gif" ALT="The Title Insurance Commitment for this Order Has Been RECEIVED"><CFELSEIF (#read_current_Commitment_Clauses.a_recieved_by# EQ "" and #read_current_Commitment.data1# NEQ "") OR (#read_current_Commitment_Clauses.a_recieved_by# EQ 0 and #read_current_Commitment.data1# NEQ "")><img src="./images/ind_started.gif" ALT="The Title Insurance Commitment for this Order Has Been ASSIGNED"><CFELSE><img src="./images/ind_open.gif" ALT="The Title Insurance Commitment for this Order Has NOT been Submitted"></CFIF></NOBR>


	<cfif #read_current_Commitment_Clauses.insurance_co# EQ "15"><cfif #read_title_order.e_status# EQ "1"><a href="./loan_amount_verify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target="new" ><img src="./images/button_endorsel.gif" border=0 ALT="View Loan Amount Endorsement for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_l_faded.gif" ALT="Loan amount has not been modified"><br></cfif><cfif #read_title_order.e_status# EQ "2"><a href="./proposed_insured_verify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target="new"  ><img src="./images/button_endorsep.gif" border=0 ALT="View Proposed Insured Endorsement for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>
			<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "16"><cfif #read_title_order.e_status# EQ "5"><a href="./loan_amount_verify_S.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target="new" ><img src="./images/button_endorsel.gif" border=0 ALT="View Loan Amount for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_l_faded.gif" ALT="Loan amount has not been modified"></cfif><cfif #read_title_order.e_status# EQ "6"><a href="./proposed_insured_verify_s.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="new" ><img src="./images/button_endorsep.gif" border=0 ALT="View Proposed Insured for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>
			<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "17"><cfif #read_title_order.e_status# EQ "3"><a href="./loan_amount_verify_c.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="new" ><img src="./images/button_endorsel.gif" border=0 ALT="View Loan Amount for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_l_faded.gif" ALT="Loan amount has not been modified"></cfif><cfif #read_title_order.e_status# EQ "4"><a href="./proposed_insured_verify_c.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target="new" ><img src="./images/button_endorsep.gif" border=0 ALT="View Proposed Insured for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>
			<cfelse><img src="./images/button_end_l_faded.gif" ALT="Loan Amount has not been modified"><img src="./images/button_end_p_faded.gif" ALT="Proposed Insured has not been modified"></cfif>

				</td>


			<td width=98 align=left valign=top bgcolor=d3d3d3>
			<!--- <img src="./images/clear.gif" width=99 height=2><NOBR><a href="./title_view_hud_pg1.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target="new" ><img src="./images/button_pre_hud-1.jpg" border=0 ALT="Modify the HUD report for this Title Order"></a><a href="./title_upload_closing_inst.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_upload.gif" border=0 ALT="Upload Closing Instructions"></a></NOBR> --->
			<!--- NEW HUD ---><nobr><a href="./HUD1_2010_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target="new" ><img src="./images/button_2010_hud-1.gif" border=0 ALT="Modify the 2010 HUD report for this Title Order"></a>&nbsp;<a href="./gfe/GFE_2010_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target="new" ><img src="./images/button_gfe.gif" border=0 ALT="View Good Faith Estimate for this Title Order"></a></nobr><br>
<a href="./title_upload_closing_inst.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_upload.gif" border=0 ALT="Upload Closing Instructions"></a><BR><BR>

			<cfif IsDefined("read_title_order.request_icl") and #read_title_order.request_icl# NEQ "No">
			<img src="./images/clear.gif" width=98 height=2><NOBR><cfif #read_current_Commitment_Clauses.insurance_co# EQ "16"><A href="https://www.stewarticl.com" target="_blank"><cfelse><A href="https://www.fnfcenter.com" target="_blank"></cfif><img src="./images/button_icl_a.gif" border=0 ALT="Click here to download ICL-A for this order"></a><a href="./icl_upload_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_upload.gif" border=0 ALT="click here to send the uploaded ICL-A, for this order, to our server"></a><cfif #read_title_order.ICL_upload# NEQ ""><a href="./ICL_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  ><img src="./images/button_view.gif" border=0 ALT="View the uploaded ICL-A, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_view_gray.gif" border=0 ALT="There is no ICL-A file for this order"></CFIF><br>
			<!--- <A href="https://www.mdcti.com/icl.htm"><img src="./images/button_icl_ch.gif" border=0 ALT="Click here to download ICL-CH for this order"></a><a href="./icl2_upload_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" ><img src="./images/button_upload.gif" border=0 ALT="Click here to upload the ICL-CH, for this order, to our server"></a><cfif #read_title_order.ICL_upload2# NEQ ""><a href="./ICL2_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view.gif" border=0 ALT="View the uploaded ICL-CH, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_view_gray.gif" border=0 ALT="There is no ICL-CH file for this order"></CFIF></NOBR> --->
			<cfelse>
			<img src="./images/button_icl_a_faded.gif" ALT="Client has not requested ICL-A for this order"><img src="./images/button_icl_ch_faded.gif" ALT="Client has not requested ICL-CH for this order">
			</cfif>
			<nobr><a href="./title_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_title_order_req.gif" border=0 ALT="Manage the Assignment of Closers for this order"></a><CFIF (#Read_Title_Order_Req.a_filled_out_date# GT "")><a href="./Title_Closing_Order_Request_View_Only.cfm?A_Update_DB_Flag=0&uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" ><img src="./images/button_view.gif" border=0 ALT="View the Title Order Request for this order"></a><cfelse><img src="./images/button_view_gray.gif" border=0 ALT="There is no closing requested for this order"></CFIF><CFIF #read_closer.a_assigned_by# GT "" AND #read_closer.a_recieved_by# GT ""><img src="./images/ind_closed.gif" ALT="The Closer for this Order Has Been RECEIVED"><CFELSEIF #read_closer.a_assigned_by# GT "" AND #read_closer.a_recieved_by# EQ ""><img src="./images/ind_started.gif" ALT="The Closer for this Order Has Been ASSIGNED"><CFELSE><img src="./images/ind_open.gif" ALT="The Closer for this Order Has NOT been Submitted"></CFIF></nobr>
			</td>

			<td width=98 align=left valign=top bgcolor=d3d3d3>
			<a href="./title_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_title_order_info.gif" border=0 ALT="Manage the closing information to send to clients for the Title Order Request for this order"></a><CFIF (#Read_Title_Order_Req.a_filled_out_by# GT 0) And (#Read_Title_Order.appraisal_status# EQ "Closing Scheduled")><img src="./images/ind_closed.gif" ALT="The Closing Information for the Title Order Request Form for this Order Has Been COMPLETED"><CFELSEIF (#Read_Title_Order_Req.a_filled_out_by# GT 0) AND (#Read_Title_Order.appraisal_status# NEQ "Closing Scheduled")><img src="./images/ind_started.gif" ALT="The Title Order Request has been submitted but not yet completed for this order"><CFELSE><img src="./images/ind_open.gif" ALT="The Title Order Request Form for this Order Has NOT been Filled Out and completed"></CFIF></NOBR>
			<cfif #get_cdata.closer_data# NEQ ""><a href="./vendor_closer_view_data.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_vendor_c.gif" border=0 ALT="View the file data sent by Closer, for this order"></a><CFELSE><img src="./images/button_vendor_c_faded.gif" border=0 ALT="There is no data sent by closer for this order"></CFIF><cfif #get_cfile.closer_upload# NEQ ""><a href="./closer_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view.gif" border=0 ALT="View the file Info uploaded by Abstractor, for this order, so that it can be Printed"></a><CFELSE><img src="./images/button_view_gray.gif" border=0 ALT="There is no file uploaded by abstractor for this order"></CFIF>
			<nobr><a href="./index_closing_forms.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_closing_forms.gif" border=0 ALT="Closing forms for this order"></a><a href="./closing_form_upload.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_upload.gif" border=0 ALT="click here to send a closing form, for this order, to closers"></a></nobr>
			</td>



			<td width=99 align=left valign=top bgcolor=d3d3d3>
						<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&code=#code#&rec_type=#rec_type#" target="_blank"><img src="./images/button_notes.gif" border=0 ALT="View and Add notes for this Title Order"></a>
	<!--- <a href="./shipping_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_shipping.gif" border=0 ALT="Click here to add and view shipping information for this order"></a> --->

	 <CFIF rec_type eq 'app' or #read_title_order.do_appraisal# EQ "Yes">

	<NOBR><a href="./vendor_manager.cfm?rec_id=#rec_id#&uid=#URL.uid#&al=#URL.al#&company_id=#company_ID#&order_type=App&code=A"><img src="./images/button_appraisal.gif" border=0 ALT="Manage the Assignment and Reciept of the Appraisal for this order"></a><cfif read_title_order.appraisal_doc_upload neq 'NULL' and read_title_order.appraisal_doc_upload neq ''><a href="#fileSys.FindFilePath('#read_title_order.appraisal_doc_upload#', 'url')#"  target="title_appraisal"><img src="./images/button_view.gif" border=0 ALT="View the Appraisal for this order, so that it can be Printed"></a><cfelse><img src="./images/button_view_gray.gif" border=0></cfif>&nbsp;<cfif read_appraisal.recordcount eq 0><img src="./images/ind_open.gif" ALT="The Appraisal for this Order Has NOT been ordered"><cfelseif read_appraisal.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17  ALT="The Appraisal for this Order Has Been COMPLETED"><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></NOBR>

<CFELSE>
<NOBR><img src="./images/button_appraisal_gray.gif" border=0 ALT="Appraisal was NOT REQUESTED">&nbsp;<img src="./images/button_view_gray.gif" border=0 ALT="Appraisal was NOT REQUESTED">&nbsp;<img src="./images/ind_open_gray.gif" ALT="Appraisal was NOT REQUESTED"></NOBR>
	</CFIF>




	</td>

		</tr>
	</table>
</CFOUTPUT>
<!--- ======================================================================= --->
<CFOUTPUT>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
	<tr>
			<td bgcolor=e1e1e1 width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "title_tax_cert"><img src="./images/page_ind_tax_cert.gif"><CFELSEIF #CGI.PATH_INFO# CONTAINS "title_report"><img src="./images/page_ind_order.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td bgcolor=e1e1e1 width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "hud_pg1"><img src="./images/page_ind_hud-1.gif"></CFIF><CFIF #CGI.PATH_INFO# CONTAINS "hud_pg2"><img src="./images/page_ind_hud-2.gif"></CFIF><CFIF #CGI.PATH_INFO# CONTAINS "hud_pg3"><img src="./images/page_ind_hud-3.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td bgcolor=e1e1e1 width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "abstract"><img src="./images/page_ind_abstract.gif"><CFELSEIF #CGI.PATH_INFO# CONTAINS "appraisal"><img src="./images/page_ind_appraisal.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td bgcolor=e1e1e1 width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "committment"><img src="./images/page_ind_title_committment.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td bgcolor=e1e1e1 width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "off_title_1"><img src="./images/page_ind_pay_off_1.gif"><CFELSEIF #CGI.PATH_INFO# CONTAINS "off_title_2"><img src="./images/page_ind_pay_off_2.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br>
			</td>
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br>
			</td>
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br>
			</td>
		</tr>
	</table>
	<p>
</CFOUTPUT>

