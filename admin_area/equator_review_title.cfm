<CFPARAM NAME="a_flag" DEFAULT="0">
<CFPARAM NAME="form.save_taxes" DEFAULT="0">
<CFPARAM NAME="form.submit_taxes" DEFAULT="0">
<CFPARAM NAME="form.taxes_upload" DEFAULT="">
<CFPARAM NAME="url.delete_taxes" DEFAULT="0">

<CFPARAM NAME="form.save_hoa" DEFAULT="0">
<CFPARAM NAME="form.submit_hoa" DEFAULT="0">
<CFPARAM NAME="form.hoa_upload" DEFAULT="">
<CFPARAM NAME="url.delete_hoa" DEFAULT="0">

<CFPARAM NAME="form.save_lien" DEFAULT="0">
<CFPARAM NAME="form.submit_lien" DEFAULT="0">
<CFPARAM NAME="url.delete_lien" DEFAULT="0">

<CFPARAM NAME="form.save_land" DEFAULT="0">
<CFPARAM NAME="form.submit_land" DEFAULT="0">
<CFPARAM NAME="form.land_rent_upload" DEFAULT="">
<CFPARAM NAME="url.delete_land" DEFAULT="0">


<CFPARAM NAME="url.show" DEFAULT="taxes">


<cfif url.delete_taxes eq 1>
<CFQUERY datasource="#request.dsn#" NAME="update_upload">
	update equator_report_findings
	set taxes_upload = NULL
	WHERE title_ID = #rec_ID#
</CFQUERY>
</cfif>

<cfif url.delete_hoa eq 1>
<CFQUERY datasource="#request.dsn#" NAME="update_upload">
	update equator_report_findings
	set hoa_upload = NULL
	WHERE title_ID = #rec_ID#
</CFQUERY>
</cfif>


<cfif url.delete_land eq 1>
<CFQUERY datasource="#request.dsn#" NAME="update_upload">
	update equator_report_findings
	set land_rent_upload = NULL
	WHERE title_ID = #rec_ID#
</CFQUERY>
</cfif>

<!--- <cfif url.delete_lien eq 1>
<CFQUERY datasource="#request.dsn#" NAME="update_upload">
	update equator_report_findings
	set lien_upload = NULL
	WHERE title_ID = #rec_ID#
</CFQUERY>
</cfif>
 --->
<cfif form.save_taxes neq 0 or form.submit_taxes neq 0>
<cfset url.show = 'taxes'>
<CFQUERY datasource="#request.dsn#" NAME="check_findings">
	SELECT *
	FROM equator_report_findings
	WHERE title_ID = #rec_ID#
</CFQUERY>
	<cfif check_findings.recordcount eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="insert_findings">
			insert into equator_report_findings (title_id)
			values (#rec_ID#)
		</CFQUERY>
	</cfif>
	
<cfif Len(form.taxes_upload)>
<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				nameconflict="makeunique"
				FILEFIELD="taxes_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

		<CFQUERY datasource="#request.dsn#" NAME="update_findings">
			    update equator_report_findings
			    set taxes_upload = '#new_file_name#'
				where title_id = #rec_id#
		</cfquery>
</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="update_findings">
			update equator_report_findings
			    set
				tax_type_1 = '#form.tax_type_1#',
				<cfif form.tax_from_date_1 eq ''>
				tax_from_date_1 = NULL,
                <cfelse>
				tax_from_date_1 = '#form.tax_from_date_1#',
				</cfif>
				<cfif form.tax_to_date_1 eq ''>
				tax_to_date_1 = NULL,
                <cfelse>
				tax_to_date_1 = '#form.tax_from_date_1#',
				</cfif>
				tax_base_amount_1 = '#form.tax_base_amount_1#',
				tax_penalty_1 = '#form.tax_penalty_1#',
				tax_total_due_1 = '#form.tax_total_due_1#',
				tax_type_2 = '#form.tax_type_2#',
				<cfif form.tax_from_date_2 eq ''>
				tax_from_date_2 = NULL,
                <cfelse>
				tax_from_date_2 = '#form.tax_from_date_2#',
				</cfif>
				<cfif form.tax_to_date_2 eq ''>
				tax_to_date_2 = NULL,
                <cfelse>
				tax_to_date_2 = '#form.tax_from_date_2#',
				</cfif>
				tax_base_amount_2 = '#form.tax_base_amount_2#',
				tax_penalty_2 = '#form.tax_penalty_2#',
				tax_total_due_2 = '#form.tax_total_due_2#',
				tax_type_3 = '#form.tax_type_3#',
				<cfif form.tax_from_date_3 eq ''>
				tax_from_date_3 = NULL,
                <cfelse>
				tax_from_date_3 = '#form.tax_from_date_3#',
				</cfif>
				<cfif form.tax_to_date_3 eq ''>
				tax_to_date_3 = NULL,
                <cfelse>
				tax_to_date_3 = '#form.tax_from_date_3#',
				</cfif>
				tax_base_amount_3 = '#form.tax_base_amount_3#',
				tax_penalty_3 = '#form.tax_penalty_3#',
				tax_total_due_3 = '#form.tax_total_due_3#',
				tax_type_4 = '#form.tax_type_4#',
				<cfif form.tax_from_date_4 eq ''>
				tax_from_date_4 = NULL,
                <cfelse>
				tax_from_date_4 = '#form.tax_from_date_4#',
				</cfif>
				<cfif form.tax_to_date_4 eq ''>
				tax_to_date_4 = NULL,
                <cfelse>
				tax_to_date_4 = '#form.tax_from_date_4#',
				</cfif>
				tax_base_amount_4 = '#form.tax_base_amount_4#',
				tax_penalty_4 = '#form.tax_penalty_4#',
				tax_total_due_4 = '#form.tax_total_due_4#',
				all_taxes_total = '#form.all_taxes_total#',
				taxes_comments = '#form.taxes_comments#'
				where title_id = #rec_ID#
		</CFQUERY>

</cfif>









<cfif form.save_hoa neq 0 or form.submit_hoa neq 0>
<cfset url.show = 'hoa'>
<CFQUERY datasource="#request.dsn#" NAME="check_findings">
	SELECT *
	FROM equator_report_findings
	WHERE title_ID = #rec_ID#
</CFQUERY>
	<cfif check_findings.recordcount eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="insert_findings">
			insert into equator_report_findings (title_id)
			values (#rec_ID#)
		</CFQUERY>
	</cfif>
	
<cfif Len(form.hoa_upload)>
<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				nameconflict="makeunique"
				FILEFIELD="hoa_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

		<CFQUERY datasource="#request.dsn#" NAME="update_findings">
			    update equator_report_findings
			    set hoa_upload = '#new_file_name#'
				where title_id = #rec_id#
		</cfquery>
</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="update_findings">
			update equator_report_findings
			    set
				hoa_type_1 = '#form.hoa_type_1#',
				<cfif form.hoa_from_date_1 eq ''>
				hoa_from_date_1 = NULL,
				<cfelse>
				hoa_from_date_1 = '#form.hoa_from_date_1#',
				</cfif>
				<cfif form.hoa_to_date_1 eq ''>
				hoa_to_date_1 = NULL,
				<cfelse>
				hoa_to_date_1 = '#form.hoa_to_date_1#',
				</cfif>
				hoa_all_dues_amount_1 = '#form.hoa_all_dues_amount_1#',
				hoa_special_assessments_amount_1 = '#form.hoa_special_assessments_amount_1#',
				hoa_statement_fee_amount_1 = '#form.hoa_statement_fee_amount_1#',
				hoa_transfer_fee_amount_1 = '#form.hoa_transfer_fee_amount_1#',
				hoa_out_of_statute_amount_1 = '#form.hoa_out_of_statute_amount_1#',
				hoa_late_fees_amount_1 = '#form.hoa_late_fees_amount_1#',
				hoa_attorney_fees_amount_1 = '#form.hoa_attorney_fees_amount_1#',
				FNMA_hoa_total_1 = '#form.FNMA_hoa_total_1#',
				servicer_hoa_total_1 = '#form.servicer_hoa_total_1#',
				hoa_total_1 = '#form.hoa_total_1#',
				hoa_type_2 = '#form.hoa_type_2#',
				<cfif form.hoa_from_date_2 eq ''>
				hoa_from_date_2 = NULL,
				<cfelse>
				hoa_from_date_2 = '#form.hoa_from_date_2#',
				</cfif>
				<cfif form.hoa_to_date_2 eq ''>
				hoa_to_date_2 = NULL,
				<cfelse>
				hoa_to_date_2 = '#form.hoa_to_date_2#',
				</cfif>
				hoa_all_dues_amount_2 = '#form.hoa_all_dues_amount_2#',
				hoa_special_assessments_amount_2 = '#form.hoa_special_assessments_amount_2#',
				hoa_statement_fee_amount_2 = '#form.hoa_statement_fee_amount_2#',
				hoa_transfer_fee_amount_2 = '#form.hoa_transfer_fee_amount_2#',
				hoa_out_of_statute_amount_2 = '#form.hoa_out_of_statute_amount_2#',
				hoa_late_fees_amount_2 = '#form.hoa_late_fees_amount_2#',
				hoa_attorney_fees_amount_2 = '#form.hoa_attorney_fees_amount_2#',
				FNMA_hoa_total_2 = '#form.FNMA_hoa_total_2#',
				servicer_hoa_total_2 = '#form.servicer_hoa_total_2#',
				hoa_total_2 = '#form.hoa_total_2#',
				hoa_type_3 = '#form.hoa_type_3#',
				<cfif form.hoa_from_date_3 eq ''>
				hoa_from_date_3 = NULL,
				<cfelse>
				hoa_from_date_3 = '#form.hoa_from_date_3#',
				</cfif>
				<cfif form.hoa_to_date_3 eq ''>
				hoa_to_date_3 = NULL,
				<cfelse>
				hoa_to_date_3 = '#form.hoa_to_date_3#',
				</cfif>
				hoa_all_dues_amount_3 = '#form.hoa_all_dues_amount_3#',
				hoa_special_assessments_amount_3 = '#form.hoa_special_assessments_amount_3#',
				hoa_statement_fee_amount_3 = '#form.hoa_statement_fee_amount_3#',
				hoa_transfer_fee_amount_3 = '#form.hoa_transfer_fee_amount_3#',
				hoa_out_of_statute_amount_3 = '#form.hoa_out_of_statute_amount_3#',
				hoa_late_fees_amount_3 = '#form.hoa_late_fees_amount_3#',
				hoa_attorney_fees_amount_3 = '#form.hoa_attorney_fees_amount_3#',
				FNMA_hoa_total_3 = '#form.FNMA_hoa_total_3#',
				servicer_hoa_total_3 = '#form.servicer_hoa_total_3#',
				hoa_total_3 = '#form.hoa_total_3#',
				hoa_type_4 = '#form.hoa_type_4#',
				<cfif form.hoa_from_date_4 eq ''>
				hoa_from_date_4 = NULL,
				<cfelse>
				hoa_from_date_4 = '#form.hoa_from_date_4#',
				</cfif>
				<cfif form.hoa_to_date_4 eq ''>
				hoa_to_date_4 = NULL,
				<cfelse>
				hoa_to_date_4 = '#form.hoa_to_date_4#',
				</cfif>
				hoa_all_dues_amount_4 = '#form.hoa_all_dues_amount_4#',
				hoa_special_assessments_amount_4 = '#form.hoa_special_assessments_amount_4#',
				hoa_statement_fee_amount_4 = '#form.hoa_statement_fee_amount_4#',
				hoa_transfer_fee_amount_4 = '#form.hoa_transfer_fee_amount_4#',
				hoa_out_of_statute_amount_4 = '#form.hoa_out_of_statute_amount_4#',
				hoa_late_fees_amount_4 = '#form.hoa_late_fees_amount_4#',
				hoa_attorney_fees_amount_4 = '#form.hoa_attorney_fees_amount_4#',
				FNMA_hoa_total_4 = '#form.FNMA_hoa_total_4#',
				servicer_hoa_total_4 = '#form.servicer_hoa_total_4#',
				hoa_total_4 = '#form.hoa_total_4#',
				all_fnma_amount = '#form.all_fnma_amount#',
				all_servicer_amount = '#form.all_servicer_amount#',
				all_hoa_amount = '#form.all_hoa_amount#',
				hoa_comments = '#form.hoa_comments#'
				where title_id = #rec_ID#
		</CFQUERY>

</cfif>



<cfif form.save_lien neq 0 or form.submit_lien neq 0>
<cfset url.show = 'lien'>
<CFQUERY datasource="#request.dsn#" NAME="check_findings">
	SELECT *
	FROM equator_report_findings
	WHERE title_ID = #rec_ID#
</CFQUERY>
	<cfif check_findings.recordcount eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="insert_findings">
			insert into equator_report_findings (title_id)
			values (#rec_ID#)
		</CFQUERY>
	</cfif>
	
<!--- <cfif Len(form.lien_upload)>
<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				nameconflict="makeunique"
				FILEFIELD="lien_upload">

		<CFQUERY datasource="#request.dsn#" NAME="update_findings">
			    update equator_report_findings
			    set lien_upload = '#file.ServerFile#'
				where title_id = #rec_id#
		</cfquery>
</cfif>
 --->		<CFQUERY datasource="#request.dsn#" NAME="update_findings">
			update equator_report_findings
			    set
				lien_type_1 = '#form.lien_type_1#',
				<cfif form.lien_recorded_date_1 eq ''>
				lien_recorded_date_1 = NULL,
				<cfelse>
				lien_recorded_date_1 = '#form.lien_recorded_date_1#',
				</cfif>
				lien_base_amount_1 = '#form.lien_base_amount_1#',
				lien_penalty_amount_1 = '#form.lien_penalty_amount_1#',
				lien_total_amount_1 = '#form.lien_total_amount_1#',
				lien_type_2 = '#form.lien_type_2#',
				<cfif form.lien_recorded_date_2 eq ''>
				lien_recorded_date_2 = NULL,
				<cfelse>
				lien_recorded_date_2 = '#form.lien_recorded_date_2#',
				</cfif>
				lien_base_amount_2 = '#form.lien_base_amount_2#',
				lien_penalty_amount_2 = '#form.lien_penalty_amount_2#',
				lien_total_amount_2 = '#form.lien_total_amount_2#',
				lien_type_3 = '#form.lien_type_3#',
				<cfif form.lien_recorded_date_3 eq ''>
				lien_recorded_date_3 = NULL,
				<cfelse>
				lien_recorded_date_3 = '#form.lien_recorded_date_3#',
				</cfif>
				lien_base_amount_3 = '#form.lien_base_amount_3#',
				lien_penalty_amount_3 = '#form.lien_penalty_amount_3#',
				lien_total_amount_3 = '#form.lien_total_amount_3#',
				total_fnma_lien = '#form.total_fnma_lien#',
				lien_comments = '#form.lien_comments#'
				where title_id = #rec_ID#
		</CFQUERY>

</cfif>


<cfif form.save_land neq 0 or form.submit_land neq 0>
<cfset url.show = 'land'>
<CFQUERY datasource="#request.dsn#" NAME="check_findings">
	SELECT *
	FROM equator_report_findings
	WHERE title_ID = #rec_ID#
</CFQUERY>
	<cfif check_findings.recordcount eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="insert_findings">
			insert into equator_report_findings (title_id)
			values (#rec_ID#)
		</CFQUERY>
	</cfif>
	
<cfif Len(form.land_rent_upload)>
<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				nameconflict="makeunique"
				FILEFIELD="land_rent_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

		<CFQUERY datasource="#request.dsn#" NAME="update_findings">
			    update equator_report_findings
			    set land_rent_upload = '#new_file_name#'
				where title_id = #rec_id#
		</cfquery>
</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="update_findings">
			update equator_report_findings
			    set
				<cfif form.land_rent_from_date eq ''>
				land_rent_from_date = NULL,
				<cfelse>
				land_rent_from_date = '#form.land_rent_from_date#',
				</cfif>
				<cfif form.land_rent_to_date eq ''>
				land_rent_to_date = NULL,
				<cfelse>
				land_rent_to_date = '#form.land_rent_to_date#',
				</cfif>
				land_rent_base_amount = '#form.land_rent_base_amount#',
				land_rent_penalty_amount = '#form.land_rent_penalty_amount#',
				land_rent_total_amount = '#form.land_rent_total_amount#',
				land_rent_comments = '#form.land_rent_comments#'
				where title_id = #rec_ID#
		</CFQUERY>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_title">
	SELECT *
	FROM Title
	WHERE title_ID = #rec_ID#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_findings">
	SELECT *
	FROM equator_report_findings
	WHERE title_ID = #rec_ID#
</CFQUERY>


<cfparam name="read_findings.tax_type_1" default="">
<cfparam name="read_findings.tax_from_date_1" default="">
<cfparam name="read_findings.tax_to_date_1" default="">
<cfparam name="read_findings.tax_base_amount_1" default="">
<cfparam name="read_findings.tax_penalty_1" default="">
<cfparam name="read_findings.tax_total_due_1" default="">
<cfparam name="read_findings.tax_type_2" default="">
<cfparam name="read_findings.tax_from_date_2" default="">
<cfparam name="read_findings.tax_to_date_2" default="">
<cfparam name="read_findings.tax_base_amount_2" default="">
<cfparam name="read_findings.tax_penalty_2" default="">
<cfparam name="read_findings.tax_total_due_2" default="">
<cfparam name="read_findings.tax_type_3" default="">
<cfparam name="read_findings.tax_from_date_3" default="">
<cfparam name="read_findings.tax_to_date_3" default="">
<cfparam name="read_findings.tax_base_amount_3" default="">
<cfparam name="read_findings.tax_penalty_3" default="">
<cfparam name="read_findings.tax_total_due_3" default="">
<cfparam name="read_findings.tax_type_4" default="">
<cfparam name="read_findings.tax_from_date_4" default="">
<cfparam name="read_findings.tax_to_date_4" default="">
<cfparam name="read_findings.tax_base_amount_4" default="">
<cfparam name="read_findings.tax_penalty_4" default="">
<cfparam name="read_findings.tax_total_due_4" default="">
<cfparam name="read_findings.all_taxes_total" default="">
<cfparam name="read_findings.taxes_comments" default="">
<cfparam name="read_findings.taxes_upload" default="">

<cfparam name="read_findings.hoa_type_1" default="">
<cfparam name="read_findings.hoa_from_date_1" default="">
<cfparam name="read_findings.hoa_to_date_1" default="">
<cfparam name="read_findings.hoa_all_dues_amount_1" default="">
<cfparam name="read_findings.hoa_special_assessments_amount_1" default="">
<cfparam name="read_findings.hoa_statement_fee_amount_1" default="">
<cfparam name="read_findings.hoa_transfer_fee_amount_1" default="">
<cfparam name="read_findings.hoa_out_of_statute_amount_1" default="">
<cfparam name="read_findings.hoa_late_fees_amount_1" default="">
<cfparam name="read_findings.hoa_attorney_fees_amount_1" default="">
<cfparam name="read_findings.FNMA_hoa_total_1" default="">
<cfparam name="read_findings.servicer_hoa_total_1" default="">
<cfparam name="read_findings.hoa_total_1" default="">
<cfparam name="read_findings.hoa_type_2" default="">
<cfparam name="read_findings.hoa_from_date_2" default="">
<cfparam name="read_findings.hoa_to_date_2" default="">
<cfparam name="read_findings.hoa_all_dues_amount_2" default="">
<cfparam name="read_findings.hoa_special_assessments_amount_2" default="">
<cfparam name="read_findings.hoa_statement_fee_amount_2" default="">
<cfparam name="read_findings.hoa_transfer_fee_amount_2" default="">
<cfparam name="read_findings.hoa_out_of_statute_amount_2" default="">
<cfparam name="read_findings.hoa_late_fees_amount_2" default="">
<cfparam name="read_findings.hoa_attorney_fees_amount_2" default="">
<cfparam name="read_findings.FNMA_hoa_total_2" default="">
<cfparam name="read_findings.servicer_hoa_total_2" default="">
<cfparam name="read_findings.hoa_total_2" default="">
<cfparam name="read_findings.hoa_type_3" default="">
<cfparam name="read_findings.hoa_from_date_3" default="">
<cfparam name="read_findings.hoa_to_date_3" default="">
<cfparam name="read_findings.hoa_all_dues_amount_3" default="">
<cfparam name="read_findings.hoa_special_assessments_amount_3" default="">
<cfparam name="read_findings.hoa_statement_fee_amount_3" default="">
<cfparam name="read_findings.hoa_transfer_fee_amount_3" default="">
<cfparam name="read_findings.hoa_out_of_statute_amount_3" default="">
<cfparam name="read_findings.hoa_late_fees_amount_3" default="">
<cfparam name="read_findings.hoa_attorney_fees_amount_3" default="">
<cfparam name="read_findings.FNMA_hoa_total_3" default="">
<cfparam name="read_findings.servicer_hoa_total_3" default="">
<cfparam name="read_findings.hoa_total_3" default="">
<cfparam name="read_findings.hoa_type_4" default="">
<cfparam name="read_findings.hoa_from_date_4" default="">
<cfparam name="read_findings.hoa_to_date_4" default="">
<cfparam name="read_findings.hoa_all_dues_amount_4" default="">
<cfparam name="read_findings.hoa_special_assessments_amount_4" default="">
<cfparam name="read_findings.hoa_statement_fee_amount_4" default="">
<cfparam name="read_findings.hoa_transfer_fee_amount_4" default="">
<cfparam name="read_findings.hoa_out_of_statute_amount_4" default="">
<cfparam name="read_findings.hoa_late_fees_amount_4" default="">
<cfparam name="read_findings.hoa_attorney_fees_amount_4" default="">
<cfparam name="read_findings.FNMA_hoa_total_4" default="">
<cfparam name="read_findings.servicer_hoa_total_4" default="">
<cfparam name="read_findings.hoa_total_4" default="">
<cfparam name="read_findings.all_fnma_amount" default="">
<cfparam name="read_findings.all_servicer_amount" default="">
<cfparam name="read_findings.All_hoa_amount" default="">
<cfparam name="read_findings.hoa_upload" default="">
<cfparam name="read_findings.hoa_comments" default="">

<cfparam name="lien_type_1" default="">
<cfparam name="read_findings.lien_recorded_date_1" default="">
<cfparam name="read_findings.lien_base_amount_1" default="">
<cfparam name="read_findings.lien_penalty_amount_1" default="">
<cfparam name="read_findings.lien_total_amount_1" default="">
<cfparam name="read_findings.lien_type_2" default="">
<cfparam name="read_findings.lien_recorded_date_2" default="">
<cfparam name="read_findings.lien_base_amount_2" default="">
<cfparam name="read_findings.lien_penalty_amount_2" default="">
<cfparam name="read_findings.lien_total_amount_2" default="">
<cfparam name="read_findings.lien_type_3" default="">
<cfparam name="read_findings.lien_recorded_date_3" default="">
<cfparam name="read_findings.lien_base_amount_3" default="">
<cfparam name="read_findings.lien_penalty_amount_3" default="">
<cfparam name="read_findings.lien_total_amount_3" default="">
<cfparam name="read_findings.total_fnma_lien" default="">
<!--- <cfparam name="read_findings.lien_upload" default="">
 --->
<cfparam name="read_findings.lien_comments" default="">

<cfparam name="read_findings.land_rent_from_date" default="">
<cfparam name="read_findings.land_rent_to_date" default="">
<cfparam name="read_findings.land_rent_base_amount" default="">
<cfparam name="read_findings.land_rent_penalty_amount" default="">
<cfparam name="read_findings.land_rent_total_amount" default="">
<cfparam name="read_findings.land_rent_upload" default="">
<cfparam name="read_findings.land_rent_comments" default="">


<cfif Len(read_findings.taxes_upload)>
<cfset filename = read_findings.taxes_upload>
<cfelse>
<cfset filename = ''>
</cfif>

<cfif Len(read_findings.hoa_upload)>
<cfset filename = read_findings.hoa_upload>
<cfelse>
<cfset filename = ''>
</cfif>

<!--- <cfif Len(read_findings.lien_upload)>
<cfset filename = read_findings.lien_upload>
<cfelse>
<cfset filename = ''>
</cfif>
 --->
 
<cfif Len(read_findings.land_rent_upload)>
<cfset filename = read_findings.land_rent_upload>
<cfelse>
<cfset filename = ''>
</cfif>


<cfif form.submit_taxes neq 0>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendVestingPayableTaxes" titleid="#read_findings.title_id#" filename="#filename#">
<cfsetting enableCFoutputOnly = "no">
</cfif>


<cfif form.submit_hoa neq 0>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendVestingPayableHOA" titleid="#read_findings.title_id#" filename="#filename#">
<cfsetting enableCFoutputOnly = "no">
</cfif>


<cfif form.submit_lien neq 0>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendVestingPayableLien" titleid="#read_findings.title_id#">
<cfsetting enableCFoutputOnly = "no">
</cfif>

<cfif form.submit_land neq 0>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendVestingPayableLand" titleid="#read_findings.title_id#" filename="#filename#">
<cfsetting enableCFoutputOnly = "no">
</cfif>


<script language="javascript">
function show_tables() {
<cfif url.show eq 'taxes'>
document.getElementById('taxes_table').style.display = 'block';
<cfelse>
document.getElementById('taxes_table').style.display = 'none';
</cfif>


<cfif url.show eq 'hoa'>
document.getElementById('hoa_table').style.display = 'block';
<cfelse>
document.getElementById('hoa_table').style.display = 'none';
</cfif>


<cfif url.show eq 'lien'>
document.getElementById('lien_table').style.display = 'block';
<cfelse>
document.getElementById('lien_table').style.display = 'none';
</cfif>



<cfif url.show eq 'land'>
document.getElementById('land_table').style.display = 'block';
<cfelse>
document.getElementById('land_table').style.display = 'none';
</cfif>

}

</script>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0 onload="show_tables();">

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=790 align=center valign=top bgcolor=d3d3d3>
			<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
		</td>
	</tr>
</table>
<cfflush>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
			<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<tr>
					<Center>
					<td width=790 align=left valign=top bgcolor=e1e1e1>
						<FONT FACE=ARIAL SIZE=2 color="blue">
					<cfoutput><CENTER>
					<B>EQUATOR TITLE FINDINGS
					</B><BR><a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=taxes">Taxes</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=hoa">HOA</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=lien">Liens</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=land">Land Rent</a><br>
					</Center></cfoutput>
<br>
					</TD>
				</TR><p>

<cfoutput>
<form action="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=#url.show#" method="post" enctype="multipart/form-data">


<tr name="taxes_table" id="taxes_table" style="display:none;">
					<td width=790 align=center valign=top bgcolor=e1e1e1>

<table width=500 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
<tr>
<td align="left" valign="top" width="150">Tax Type (1)</td>
<td align="left" valign="top" width="350"><select name="tax_type_1" value="#read_findings.tax_type_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
									
<option value="">--Select--</option>
<option value="CITY" <cfif read_findings.tax_type_1 eq 'CITY'>selected</cfif>>CITY</option>
<option value="COUNTY" <cfif read_findings.tax_type_1 eq 'COUNTY'>selected</cfif>>COUNTY</option>
<option value="TAX SALE" <cfif read_findings.tax_type_1 eq 'TAX SALE'>selected</cfif>>TAX SALE</option>
<option value="SUPPLEMENTAL" <cfif read_findings.tax_type_1 eq 'SUPPLEMENTAL'>selected</cfif>>SUPPLEMENTAL</option>
</select></td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax From Date (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_from_date_1" value="#DateFormat(read_findings.tax_from_date_1, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax To Date (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_to_date_1" value="#DateFormat(read_findings.tax_to_date_1, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Base Amount (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_base_amount_1" value="#read_findings.tax_base_amount_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Penalty/Interst Amount (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_penalty_1" value="#read_findings.tax_penalty_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Total Due(1)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_total_due_1" value="#read_findings.tax_total_due_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">Tax Type (2)</td>
<td align="left" valign="top" width="350"><select name="tax_type_2" style="font-size: 9; 
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
									clear: none; width:200px;">
									
<option value="">--Select--</option>
<option value="CITY" <cfif read_findings.tax_type_2 eq 'CITY'>selected</cfif>>CITY</option>
<option value="COUNTY" <cfif read_findings.tax_type_2 eq 'COUNTY'>selected</cfif>>COUNTY</option>
<option value="TAX SALE" <cfif read_findings.tax_type_2 eq 'TAX SALE'>selected</cfif>>TAX SALE</option>
<option value="SUPPLEMENTAL" <cfif read_findings.tax_type_2 eq 'SUPPLEMENTAL'>selected</cfif>>SUPPLEMENTAL</option>
</select></td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax From Date (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_from_date_2" value="#DateFormat(read_findings.tax_from_date_2, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax To Date (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_to_date_2" value="#DateFormat(read_findings.tax_to_date_2, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Base Amount (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_base_amount_2" value="#read_findings.tax_base_amount_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Penalty/Interst Amount (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_penalty_2" value="#read_findings.tax_penalty_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Total Due(2)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_total_due_2" value="#read_findings.tax_total_due_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">Tax Type (3)</td>
<td align="left" valign="top" width="350"><select name="tax_type_3" style="font-size: 9; 
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
									clear: none; width:200px;">
									
<option value="">--Select--</option>
<option value="CITY" <cfif read_findings.tax_type_3 eq 'CITY'>selected</cfif>>CITY</option>
<option value="COUNTY" <cfif read_findings.tax_type_3 eq 'COUNTY'>selected</cfif>>COUNTY</option>
<option value="TAX SALE" <cfif read_findings.tax_type_3 eq 'TAX SALE'>selected</cfif>>TAX SALE</option>
<option value="SUPPLEMENTAL" <cfif read_findings.tax_type_3 eq 'SUPPLEMENTAL'>selected</cfif>>SUPPLEMENTAL</option>
</select></td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax From Date (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_from_date_3" value="#DateFormat(read_findings.tax_from_date_3, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax To Date (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_to_date_3" value="#DateFormat(read_findings.tax_to_date_3, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Base Amount (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_base_amount_3" value="#read_findings.tax_base_amount_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Penalty/Interst Amount (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_penalty_3" value="#read_findings.tax_penalty_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Total Due(3)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_total_due_3" value="#read_findings.tax_total_due_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">Tax Type (4)</td>
<td align="left" valign="top" width="350"><select name="tax_type_4" style="font-size: 9; 
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
									clear: none; width:200px;">
									
<option value="">--Select--</option>
<option value="CITY" <cfif read_findings.tax_type_4 eq 'CITY'>selected</cfif>>CITY</option>
<option value="COUNTY" <cfif read_findings.tax_type_4 eq 'COUNTY'>selected</cfif>>COUNTY</option>
<option value="TAX SALE" <cfif read_findings.tax_type_4 eq 'TAX SALE'>selected</cfif>>TAX SALE</option>
<option value="SUPPLEMENTAL" <cfif read_findings.tax_type_4 eq 'SUPPLEMENTAL'>selected</cfif>>SUPPLEMENTAL</option>
</select></td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax From Date (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_from_date_4" value="#DateFormat(read_findings.tax_from_date_4, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax To Date (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_to_date_4"  value="#DateFormat(read_findings.tax_to_date_4, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Base Amount (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_base_amount_4" value="#read_findings.tax_base_amount_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Penalty/Interst Amount (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_penalty_4" value="#read_findings.tax_penalty_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Tax Total Due(4)</td>
<td align="left" valign="top" width="350"><input type="text" name="tax_total_due_4" value="#read_findings.tax_total_due_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">All Taxes Total Due Amount</td>
<td align="left" valign="top" width="350"><input type="text" name="all_taxes_total" value="#read_findings.all_taxes_total#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Comments</td>
<td align="left" valign="top" width="350"><textarea name="taxes_comments" rows=10 style="font-size: 9; 
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
									clear: none; width:200px;">#read_findings.taxes_comments#</textarea>
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Upload File:</td>
<td align="left" valign="top" width="350"><cfif Len(read_findings.taxes_upload)>
<a href="#fileSys.FindFilePath('#read_findings.taxes_upload#', 'url')#">#read_findings.taxes_upload#</a>&nbsp;&nbsp;<a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=taxes&delete_taxes=1">delete</a>
<cfelse><input type="file" name="taxes_upload" style="font-size: 9; 
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
									clear: none; width:200px;"></cfif>
</td>
</tr>
<tr>
<td colspan=2><input type="submit" name="save_taxes" value="Save Taxes">&nbsp;&nbsp;&nbsp;<input type="submit" name="submit_taxes" value="Submit Taxes Curative to Equator"></td>
</tr>
</table>
</td></tr>



<!--- HOA TABLE --->
<tr name="hoa_table" id="hoa_table" style="display:none;">
					<td width=790 align=center valign=top bgcolor=e1e1e1>

<table width=500 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
<tr>
<td align="left" valign="top" width="150">HOA (1)</td>
<td align="left" valign="top" width="350"><select name="hoa_type_1" style="font-size: 9; 
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
									clear: none; width:200px;">
									
<option value="">--Select--</option>
<option value="MASTER" <cfif read_findings.hoa_type_1 eq 'MASTER'>selected</cfif>>MASTER</option>
<option value="SECOND" <cfif read_findings.hoa_type_1 eq 'SECOND'>selected</cfif>>SECOND</option>
<option value="THIRD" <cfif read_findings.hoa_type_1 eq 'THIRD'>selected</cfif>>THIRD</option>
<option value="FOURTH" <cfif read_findings.hoa_type_1 eq 'FOURTH'>selected</cfif>>FOURTH</option>
</select></td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA From Date (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_from_date_1" value="#DateFormat(read_findings.hoa_from_date_1, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA To Date (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_to_date_1" value="#DateFormat(read_findings.hoa_to_date_1, 'mm-dd-yyyy')#"  style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA All Dues Amount (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_all_dues_amount_1" value="#read_findings.hoa_all_dues_amount_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">HOA Special Assessments Amount (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_special_assessments_amount_1"  value="#read_findings.hoa_special_assessments_amount_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Statement Fee Amount(1)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_statement_fee_amount_1"  value="#read_findings.hoa_statement_fee_amount_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Transfer/Resale/Disclosure Fee Amount (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_transfer_fee_amount_1"  value="#read_findings.hoa_transfer_fee_amount_1#" style="font-size: 9; 
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
									clear: none; width:200px;"></td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Out of Statute/Penalties/Charges (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_out_of_statute_amount_1"  value="#read_findings.hoa_out_of_statute_amount_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Late Fees/Penalties/Interest (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_late_fees_amount_1"  value="#read_findings.hoa_late_fees_amount_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Attorney Fees Amount(1)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_attorney_fees_amount_1" value="#read_findings.hoa_attorney_fees_amount_1#"  style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">FNMA HOA Total (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="FNMA_hoa_total_1"  value="#read_findings.FNMA_hoa_total_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Servicer HOA Total (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="servicer_hoa_total_1" value="#read_findings.servicer_hoa_total_1#"  style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">HOA Total (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_total_1"  value="#read_findings.hoa_total_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">HOA (2)</td>
<td align="left" valign="top" width="350"><select name="hoa_type_2"  style="font-size: 9; 
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
									clear: none; width:200px;">
									
<option value="">--Select--</option>
<option value="MASTER" <cfif read_findings.hoa_type_2 eq 'MASTER'>selected</cfif>>MASTER</option>
<option value="SECOND" <cfif read_findings.hoa_type_2 eq 'SECOND'>selected</cfif>>SECOND</option>
<option value="THIRD" <cfif read_findings.hoa_type_2 eq 'THIRD'>selected</cfif>>THIRD</option>
<option value="FOURTH" <cfif read_findings.hoa_type_2 eq 'FOURTH'>selected</cfif>>FOURTH</option>
</select></td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA From Date (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_from_date_2"  value="#DateFormat(read_findings.hoa_from_date_2, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA To Date (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_to_date_2"  value="#DateFormat(read_findings.hoa_to_date_2, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA All Dues Amount (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_all_dues_amount_2"  value="#read_findings.hoa_all_dues_amount_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">HOA Special Assessments Amount (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_special_assessments_amount_2"  value="#read_findings.hoa_special_assessments_amount_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Statement Fee Amount(2)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_statement_fee_amount_2"  value="#read_findings.hoa_statement_fee_amount_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Transfer/Resale/Disclosure Fee Amount (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_transfer_fee_amount_2"  value="#read_findings.hoa_transfer_fee_amount_2#" style="font-size: 9; 
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
									clear: none; width:200px;"></td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Out of Statute/Penalties/Charges (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_out_of_statute_amount_2"  value="#read_findings.hoa_out_of_statute_amount_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Late Fees/Penalties/Interest (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_late_fees_amount_2"  value="#read_findings.hoa_late_fees_amount_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Attorney Fees Amount(2)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_attorney_fees_amount_2"  value="#read_findings.hoa_attorney_fees_amount_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">FNMA HOA Total (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="FNMA_hoa_total_2"  value="#read_findings.FNMA_hoa_total_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Servicer HOA Total (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="servicer_hoa_total_2"  value="#read_findings.servicer_hoa_total_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">HOA Total (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_total_2"  value="#read_findings.hoa_total_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA (3)</td>
<td align="left" valign="top" width="350"><select name="hoa_type_3" style="font-size: 9; 
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
									clear: none; width:200px;">
									
<option value="">--Select--</option>
<option value="MASTER" <cfif read_findings.hoa_type_3 eq 'MASTER'>selected</cfif>>MASTER</option>
<option value="SECOND" <cfif read_findings.hoa_type_3 eq 'SECOND'>selected</cfif>>SECOND</option>
<option value="THIRD" <cfif read_findings.hoa_type_3 eq 'THIRD'>selected</cfif>>THIRD</option>
<option value="FOURTH" <cfif read_findings.hoa_type_3 eq 'FOURTH'>selected</cfif>>FOURTH</option>
</select></td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA From Date (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_from_date_3"  value="#DateFormat(read_findings.hoa_from_date_3, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA To Date (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_to_date_3"  value="#DateFormat(read_findings.hoa_to_date_3, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA All Dues Amount (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_all_dues_amount_3"  value="#read_findings.hoa_all_dues_amount_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">HOA Special Assessments Amount (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_special_assessments_amount_3" value="#read_findings.hoa_special_assessments_amount_3#"  style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Statement Fee Amount(3)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_statement_fee_amount_3"  value="#read_findings.hoa_statement_fee_amount_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Transfer/Resale/Disclosure Fee Amount (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_transfer_fee_amount_3"  value="#read_findings.hoa_transfer_fee_amount_3#" style="font-size: 9; 
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
									clear: none; width:200px;"></td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Out of Statute/Penalties/Charges (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_out_of_statute_amount_3"  value="#read_findings.hoa_out_of_statute_amount_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Late Fees/Penalties/Interest (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_late_fees_amount_3"  value="#read_findings.hoa_late_fees_amount_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Attorney Fees Amount(3)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_attorney_fees_amount_3"  value="#read_findings.hoa_attorney_fees_amount_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">FNMA HOA Total (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="FNMA_hoa_total_3"  value="#read_findings.FNMA_hoa_total_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Servicer HOA Total (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="servicer_hoa_total_3" value="#read_findings.servicer_hoa_total_3#"  style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">HOA Total (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_total_3"  value="#read_findings.hoa_total_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA (4)</td>
<td align="left" valign="top" width="350"><select name="hoa_type_4" style="font-size: 9; 
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
									clear: none; width:200px;">
									
<option value="">--Select--</option>
<option value="MASTER" <cfif read_findings.hoa_type_4 eq 'MASTER'>selected</cfif>>MASTER</option>
<option value="SECOND" <cfif read_findings.hoa_type_4 eq 'SECOND'>selected</cfif>>SECOND</option>
<option value="THIRD" <cfif read_findings.hoa_type_4 eq 'THIRD'>selected</cfif>>THIRD</option>
<option value="FOURTH" <cfif read_findings.hoa_type_3 eq 'FOURTH'>selected</cfif>>FOURTH</option>
</select></td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA From Date (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_from_date_4" value="#DateFormat(read_findings.hoa_from_date_4, 'mm-dd-yyyy')#"  style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA To Date (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_to_date_4" value="#DateFormat(read_findings.hoa_to_date_4, 'mm-dd-yyyy')#"  style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA All Dues Amount (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_all_dues_amount_4"  value="#read_findings.hoa_all_dues_amount_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">HOA Special Assessments Amount (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_special_assessments_amount_4"  value="#read_findings.hoa_special_assessments_amount_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Statement Fee Amount(4)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_statement_fee_amount_4"  value="#read_findings.hoa_statement_fee_amount_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Transfer/Resale/Disclosure Fee Amount (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_transfer_fee_amount_4"  value="#read_findings.hoa_transfer_fee_amount_4#" style="font-size: 9; 
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
									clear: none; width:200px;"></td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Out of Statute/Penalties/Charges (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_out_of_statute_amount_4"  value="#read_findings.hoa_out_of_statute_amount_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Late Fees/Penalties/Interest (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_late_fees_amount_4"  value="#read_findings.hoa_late_fees_amount_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">HOA Attorney Fees Amount(4)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_attorney_fees_amount_4"  value="#read_findings.hoa_attorney_fees_amount_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">FNMA HOA Total (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="FNMA_hoa_total_4"  value="#read_findings.FNMA_hoa_total_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Servicer HOA Total (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="servicer_hoa_total_4"  value="#read_findings.servicer_hoa_total_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">HOA Total (4)</td>
<td align="left" valign="top" width="350"><input type="text" name="hoa_total_4"  value="#read_findings.hoa_total_4#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">All FNMA HOA Amount</td>
<td align="left" valign="top" width="350"><input type="text" name="all_fnma_amount"  value="#read_findings.all_fnma_amount#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">All Servicer HOA Amount</td>
<td align="left" valign="top" width="350"><input type="text" name="all_servicer_amount"  value="#read_findings.all_servicer_amount#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">All HOA Amount</td>
<td align="left" valign="top" width="350"><input type="text" name="all_hoa_amount"  value="#read_findings.all_hoa_amount#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Comments</td>
<td align="left" valign="top" width="350"><textarea name="hoa_comments" rows=10 style="font-size: 9; 
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
									clear: none; width:200px;">#read_findings.hoa_comments#</textarea>
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Upload File:</td>
<td align="left" valign="top" width="350"><cfif Len(read_findings.hoa_upload)>
<a href="#fileSys.FindFilePath('#read_findings.hoa_upload#', 'url')#">#read_findings.hoa_upload#</a>&nbsp;&nbsp;<a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=#url.show#&delete_hoa=1">delete</a>
<cfelse><input type="file" name="hoa_upload" style="font-size: 9; 
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
									clear: none; width:200px;"></cfif>
</td>
</tr>
<tr>
<td colspan=2><input type="submit" name="save_hoa" value="Save HOA">&nbsp;&nbsp;&nbsp;<input type="submit" name="submit_hoa" value="Submit HOA Curative to Equator"></td>
</tr>
</table>
</td></tr>





<!--- LIEN TABLE --->
				<tr name="lien_table" id="lien_table" style="display:none;">
					<td width=790 align=center valign=top bgcolor=e1e1e1>

<table width=500 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
<tr>
<td align="left" valign="top" width="150">Lien (1)</td>
<td align="left" valign="top" width="350"><select name="lien_type_1" style="font-size: 9; 
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
									clear: none; width:200px;">
									
<option value="">--Select--</option>
<option value="MECHANICAL LIEN" <cfif read_findings.lien_type_1 eq 'MECHANICAL LIEN'>selected</cfif>>MECHANICAL LIEN</option>
<option value="UCC LIEN" <cfif read_findings.lien_type_1 eq 'UCC LIEN'>selected</cfif>>UCC LIEN</option>
<option value="SEWER LIEN" <cfif read_findings.lien_type_1 eq 'SEWER LIEN'>selected</cfif>>SEWER LIEN</option>
<option value="WATER LIEN" <cfif read_findings.lien_type_1 eq 'WATER LIEN'>selected</cfif>>WATER LIEN</option>
<option value="MUNICIPAL LIEN" <cfif read_findings.lien_type_1 eq 'MUNICIPAL LIEN'>selected</cfif>>MUNICIPAL LIEN</option>
<option value="ASSESSMENT LIEN" <cfif read_findings.lien_type_1 eq 'ASSESSMENT LIEN'>selected</cfif>>ASSESSMENT LIEN</option>
</select></td>
</tr>
<tr>
<td align="left" valign="top" width="150">Lien Recorded Date (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_recorded_date_1" value="#DateFormat(read_findings.lien_recorded_date_1, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Lien Base Amount (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_base_amount_1" value="#read_findings.lien_base_amount_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">Lien Penalty & Interest Amount (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_penalty_amount_1"  value="#read_findings.lien_penalty_amount_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Lien Total Amount(1)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_total_amount_1"  value="#read_findings.lien_total_amount_1#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Lien (2)</td>
<td align="left" valign="top" width="350"><select name="lien_type_2" style="font-size: 9; 
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
									clear: none; width:200px;">
									
<option value="">--Select--</option>
<option value="MECHANICAL LIEN" <cfif read_findings.lien_type_2 eq 'MECHANICAL LIEN'>selected</cfif>>MECHANICAL LIEN</option>
<option value="UCC LIEN" <cfif read_findings.lien_type_2 eq 'UCC LIEN'>selected</cfif>>UCC LIEN</option>
<option value="SEWER LIEN" <cfif read_findings.lien_type_2 eq 'SEWER LIEN'>selected</cfif>>SEWER LIEN</option>
<option value="WATER LIEN" <cfif read_findings.lien_type_2 eq 'WATER LIEN'>selected</cfif>>WATER LIEN</option>
<option value="MUNICIPAL LIEN" <cfif read_findings.lien_type_2 eq 'MUNICIPAL LIEN'>selected</cfif>>MUNICIPAL LIEN</option>
<option value="ASSESSMENT LIEN" <cfif read_findings.lien_type_2 eq 'ASSESSMENT LIEN'>selected</cfif>>ASSESSMENT LIEN</option>
</select></td>
</tr>
<tr>
<td align="left" valign="top" width="150">Lien Recorded Date (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_recorded_date_2" value="#DateFormat(read_findings.lien_recorded_date_2, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Lien Base Amount (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_base_amount_2" value="#read_findings.lien_base_amount_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">Lien Penalty & Interest Amount (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_penalty_amount_2"  value="#read_findings.lien_penalty_amount_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Lien Total Amount(2)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_total_amount_2"  value="#read_findings.lien_total_amount_2#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">Lien (3)</td>
<td align="left" valign="top" width="350"><select name="lien_type_3" style="font-size: 9; 
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
									clear: none; width:200px;">
									
<option value="">--Select--</option>
<option value="MECHANICAL LIEN" <cfif read_findings.lien_type_3 eq 'MECHANICAL LIEN'>selected</cfif>>MECHANICAL LIEN</option>
<option value="UCC LIEN" <cfif read_findings.lien_type_3 eq 'UCC LIEN'>selected</cfif>>UCC LIEN</option>
<option value="SEWER LIEN" <cfif read_findings.lien_type_3 eq 'SEWER LIEN'>selected</cfif>>SEWER LIEN</option>
<option value="WATER LIEN" <cfif read_findings.lien_type_3 eq 'WATER LIEN'>selected</cfif>>WATER LIEN</option>
<option value="MUNICIPAL LIEN" <cfif read_findings.lien_type_3 eq 'MUNICIPAL LIEN'>selected</cfif>>MUNICIPAL LIEN</option>
<option value="ASSESSMENT LIEN" <cfif read_findings.lien_type_3 eq 'ASSESSMENT LIEN'>selected</cfif>>ASSESSMENT LIEN</option>
</select></td>
</tr>
<tr>
<td align="left" valign="top" width="150">Lien Recorded Date (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_recorded_date_3" value="#DateFormat(read_findings.lien_recorded_date_3, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Lien Base Amount (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_base_amount_3" value="#read_findings.lien_base_amount_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>

<tr>
<td align="left" valign="top" width="150">Lien Penalty & Interest Amount (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_penalty_amount_3"  value="#read_findings.lien_penalty_amount_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Lien Total Amount(3)</td>
<td align="left" valign="top" width="350"><input type="text" name="lien_total_amount_3"  value="#read_findings.lien_total_amount_3#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Total FNMA Lien Amount</td>
<td align="left" valign="top" width="350"><input type="text" name="total_fnma_lien"  value="#read_findings.total_fnma_lien#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>


<tr>
<td align="left" valign="top" width="150">Comments</td>
<td align="left" valign="top" width="350"><textarea name="lien_comments" rows=10 style="font-size: 9; 
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
									clear: none; width:200px;">#read_findings.lien_comments#</textarea>
</td>
</tr>
<!--- <tr>
<td align="left" valign="top" width="150">Upload File:</td>
<td align="left" valign="top" width="350"><cfif Len(read_findings.lien_upload)>
<a href="#fileSys.FindFilePath('#read_findings.lien_upload#', 'url')#">#read_findings.lien_upload#</a>&nbsp;&nbsp;<a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=#url.show#&delete_lien=1">delete</a>
<cfelse><input type="file" name="lien_upload" style="font-size: 9; 
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
									clear: none; width:200px;"></cfif>
</td>
</tr> --->
<tr>
<td colspan=2><input type="submit" name="save_lien" value="Save Lien">&nbsp;&nbsp;&nbsp;<input type="submit" name="submit_lien" value="Submit Lien Curative to Equator"></td>
</tr>
</table>
</td></tr>




<tr name="land_table" id="land_table" style="display:none;">
					<td width=790 align=center valign=top bgcolor=e1e1e1>

<table width=500 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
<tr>
<td align="left" valign="top" width="150">Land Rent From Date</td>
<td align="left" valign="top" width="350"><input type="text" name="land_rent_from_date" value="#DateFormat(read_findings.land_rent_from_date, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Land Rent To Date</td>
<td align="left" valign="top" width="350"><input type="text" name="land_rent_to_date" value="#DateFormat(read_findings.land_rent_to_date, 'mm-dd-yyyy')#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Land Rent Base Amount</td>
<td align="left" valign="top" width="350"><input type="text" name="land_rent_base_amount" value="#read_findings.land_rent_base_amount#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Land Rent Penalty/Interst Amount</td>
<td align="left" valign="top" width="350"><input type="text" name="land_rent_penalty_amount" value="#read_findings.land_rent_penalty_amount#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Land Rent Total Due</td>
<td align="left" valign="top" width="350"><input type="text" name="land_rent_total_amount" value="#read_findings.land_rent_total_amount#" style="font-size: 9; 
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
									clear: none; width:200px;">
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Comments</td>
<td align="left" valign="top" width="350"><textarea name="land_rent_comments" rows=10 style="font-size: 9; 
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
									clear: none; width:200px;">#read_findings.land_rent_comments#</textarea>
</td>
</tr>
<tr>
<td align="left" valign="top" width="150">Upload File:</td>
<td align="left" valign="top" width="350"><cfif Len(read_findings.land_rent_upload)>
<a href="#fileSys.FindFilePath('#read_findings.land_rent_upload#', 'url')#">#read_findings.land_rent_upload#</a>&nbsp;&nbsp;<a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=land&delete_taxes=1">delete</a>
<cfelse><input type="file" name="land_rent_upload" style="font-size: 9; 
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
									clear: none; width:200px;"></cfif>
</td>
</tr>
<tr>
<td colspan=2><input type="submit" name="save_land" value="Save Land Rent">&nbsp;&nbsp;&nbsp;<input type="submit" name="submit_land" value="Submit Land Rent Curative to Equator"></td>
</tr>
</table>
</td></tr>
</cfoutput>







</form>
</table>
</td></tr></table>
</BODY>
</HTML>
<cfflush>