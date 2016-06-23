<CFPARAM NAME="a_flag" DEFAULT="0">
<CFPARAM NAME="form.save_all" DEFAULT="0">
<CFPARAM NAME="form.submit_equator" DEFAULT="0">


<style>
TD {font-family:Arial, Helvetica, sans-serif; font-size:12px;}
</style>

<cfif form.save_all neq 0 or form.submit_equator neq 0>
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
	

		<CFQUERY datasource="#request.dsn#" NAME="update_findings">
		update equator_report_findings
		set
		TAX_TYPE_1 = '#form.TAX_TYPE_1#',
		<cfif form.TAX_FROM_DATE_1 eq ''>
		TAX_FROM_DATE_1 = NULL,
		<cfelse>
		TAX_FROM_DATE_1 = '#form.TAX_FROM_DATE_1#',
		</cfif>
		<cfif form.TAX_TO_DATE_1 eq ''>
		TAX_TO_DATE_1 = NULL,
		<cfelse>
		TAX_TO_DATE_1 = '#form.TAX_TO_DATE_1#',
		</cfif>
		TAX_BASE_AMOUNT_1 = '#form.TAX_BASE_AMOUNT_1#',
		TAX_PENALTY_1 = '#form.TAX_PENALTY_1#',
		TAX_TOTAL_DUE_1 = '#form.TAX_TOTAL_DUE_1#',
		TAX_TYPE_2 = '#form.TAX_TYPE_2#',
		<cfif form.TAX_FROM_DATE_2 eq ''>
		TAX_FROM_DATE_2 = NULL,
		<cfelse>
		TAX_FROM_DATE_2 = '#form.TAX_FROM_DATE_2#',
		</cfif>
		<cfif form.TAX_TO_DATE_2 eq ''>
		TAX_TO_DATE_2 = NULL,
		<cfelse>
		TAX_TO_DATE_2 = '#form.TAX_TO_DATE_2#',
		</cfif>
		TAX_BASE_AMOUNT_2 = '#form.TAX_BASE_AMOUNT_2#',
		TAX_PENALTY_2 = '#form.TAX_PENALTY_2#',
		TAX_TOTAL_DUE_2 = '#form.TAX_TOTAL_DUE_2#',
		TAX_TYPE_3 = '#form.TAX_TYPE_3#',
		<cfif form.TAX_FROM_DATE_3 eq ''>
		TAX_FROM_DATE_3 = NULL,
		<cfelse>
		TAX_FROM_DATE_3 = '#form.TAX_FROM_DATE_3#',
		</cfif>
		<cfif form.TAX_TO_DATE_3 eq ''>
		TAX_TO_DATE_3 = NULL,
		<cfelse>
		TAX_TO_DATE_3 = '#form.TAX_TO_DATE_3#',
		</cfif>
		TAX_BASE_AMOUNT_3 = '#form.TAX_BASE_AMOUNT_3#',
		TAX_PENALTY_3 = '#form.TAX_PENALTY_3#',
		TAX_TOTAL_DUE_3 = '#form.TAX_TOTAL_DUE_3#',
		TAX_TYPE_4 = '#form.TAX_TYPE_4#',
		<cfif form.TAX_FROM_DATE_4 eq ''>
		TAX_FROM_DATE_4 = NULL,
		<cfelse>
		TAX_FROM_DATE_4 = '#form.TAX_FROM_DATE_4#',
		</cfif>
		<cfif form.TAX_TO_DATE_4 eq ''>
		TAX_TO_DATE_4 = NULL,
		<cfelse>
		TAX_TO_DATE_4 = '#form.TAX_TO_DATE_4#',
		</cfif>
		TAX_BASE_AMOUNT_4 = '#form.TAX_BASE_AMOUNT_4#',
		TAX_PENALTY_4 = '#form.TAX_PENALTY_4#',
		TAX_TOTAL_DUE_4 = '#form.TAX_TOTAL_DUE_4#',
		ALL_TAXES_TOTAL = '#form.ALL_TAXES_TOTAL#',
		HOA_TYPE_1 = '#form.HOA_TYPE_1#',
		<cfif form.HOA_FROM_DATE_1 eq ''>
		HOA_FROM_DATE_1 = NULL,
		<cfelse>
		HOA_FROM_DATE_1 = '#form.HOA_FROM_DATE_1#',
		</cfif>
		<cfif form.HOA_TO_DATE_1 eq ''>
		HOA_TO_DATE_1 = NULL,
		<cfelse>
		HOA_TO_DATE_1 = '#form.HOA_TO_DATE_1#',
		</cfif>
		HOA_ALL_DUES_AMOUNT_1 = '#form.HOA_ALL_DUES_AMOUNT_1#',
		HOA_SPECIAL_ASSESSMENTS_AMOUNT_1 = '#form.HOA_SPECIAL_ASSESSMENTS_AMOUNT_1#',
		HOA_STATEMENT_FEE_AMOUNT_1 = '#form.HOA_STATEMENT_FEE_AMOUNT_1#',
		HOA_TRANSFER_FEE_AMOUNT_1 = '#form.HOA_TRANSFER_FEE_AMOUNT_1#',
		HOA_OUT_OF_STATUTE_AMOUNT_1 = '#form.HOA_OUT_OF_STATUTE_AMOUNT_1#',
		HOA_LATE_FEES_AMOUNT_1 = '#form.HOA_LATE_FEES_AMOUNT_1#',
		HOA_ATTORNEY_FEES_AMOUNT_1 = '#form.HOA_ATTORNEY_FEES_AMOUNT_1#',
		FNMA_HOA_TOTAL_1 = '#form.FNMA_HOA_TOTAL_1#',
		SERVICER_HOA_TOTAL_1 = '#form.SERVICER_HOA_TOTAL_1#',
		HOA_TOTAL_1 = '#form.HOA_TOTAL_1#',
		HOA_TYPE_2 = '#form.HOA_TYPE_2#',
		<cfif form.HOA_FROM_DATE_2 eq ''>
		HOA_FROM_DATE_2 = NULL,
		<cfelse>
		HOA_FROM_DATE_2 = '#form.HOA_FROM_DATE_2#',
		</cfif>
		<cfif form.HOA_TO_DATE_2 eq ''>
		HOA_TO_DATE_2 = NULL,
		<cfelse>
		HOA_TO_DATE_2 = '#form.HOA_TO_DATE_2#',
		</cfif>
		HOA_ALL_DUES_AMOUNT_2 = '#form.HOA_ALL_DUES_AMOUNT_2#',
		HOA_SPECIAL_ASSESSMENTS_AMOUNT_2 = '#form.HOA_SPECIAL_ASSESSMENTS_AMOUNT_2#',
		HOA_STATEMENT_FEE_AMOUNT_2 = '#form.HOA_STATEMENT_FEE_AMOUNT_2#',
		HOA_TRANSFER_FEE_AMOUNT_2 = '#form.HOA_TRANSFER_FEE_AMOUNT_2#',
		HOA_OUT_OF_STATUTE_AMOUNT_2 = '#form.HOA_OUT_OF_STATUTE_AMOUNT_2#',
		HOA_LATE_FEES_AMOUNT_2 = '#form.HOA_LATE_FEES_AMOUNT_2#',
		HOA_ATTORNEY_FEES_AMOUNT_2 = '#form.HOA_ATTORNEY_FEES_AMOUNT_2#',
		FNMA_HOA_TOTAL_2 = '#form.FNMA_HOA_TOTAL_2#',
		SERVICER_HOA_TOTAL_2 = '#form.SERVICER_HOA_TOTAL_2#',
		HOA_TOTAL_2 = '#form.HOA_TOTAL_2#',
		HOA_TYPE_3 = '#form.HOA_TYPE_3#',
		<cfif form.HOA_FROM_DATE_3 eq ''>
		HOA_FROM_DATE_3 = NULL,
		<cfelse>
		HOA_FROM_DATE_3 = '#form.HOA_FROM_DATE_3#',
		</cfif>
		<cfif form.HOA_TO_DATE_3 eq ''>
		HOA_TO_DATE_3 = NULL,
		<cfelse>
		HOA_TO_DATE_3 = '#form.HOA_TO_DATE_3#',
		</cfif>
		HOA_ALL_DUES_AMOUNT_3 = '#form.HOA_ALL_DUES_AMOUNT_3#',
		HOA_SPECIAL_ASSESSMENTS_AMOUNT_3 = '#form.HOA_SPECIAL_ASSESSMENTS_AMOUNT_3#',
		HOA_STATEMENT_FEE_AMOUNT_3 = '#form.HOA_STATEMENT_FEE_AMOUNT_3#',
		HOA_TRANSFER_FEE_AMOUNT_3 = '#form.HOA_TRANSFER_FEE_AMOUNT_3#',
		HOA_OUT_OF_STATUTE_AMOUNT_3 = '#form.HOA_OUT_OF_STATUTE_AMOUNT_3#',
		HOA_LATE_FEES_AMOUNT_3 = '#form.HOA_LATE_FEES_AMOUNT_3#',
		HOA_ATTORNEY_FEES_AMOUNT_3 = '#form.HOA_ATTORNEY_FEES_AMOUNT_3#',
		FNMA_HOA_TOTAL_3 = '#form.FNMA_HOA_TOTAL_3#',
		SERVICER_HOA_TOTAL_3 = '#form.SERVICER_HOA_TOTAL_3#',
		HOA_TOTAL_3 = '#form.HOA_TOTAL_3#',
		HOA_TYPE_4 = '#form.HOA_TYPE_4#',
		<cfif form.HOA_FROM_DATE_4 eq ''>
		HOA_FROM_DATE_4 = NULL,
		<cfelse>
		HOA_FROM_DATE_4 = '#form.HOA_FROM_DATE_4#',
		</cfif>
		<cfif form.HOA_TO_DATE_4 eq ''>
		HOA_TO_DATE_4 = NULL,
		<cfelse>
		HOA_TO_DATE_4 = '#form.HOA_TO_DATE_4#',
		</cfif>
		HOA_ALL_DUES_AMOUNT_4 = '#form.HOA_ALL_DUES_AMOUNT_4#',
		HOA_SPECIAL_ASSESSMENTS_AMOUNT_4 = '#form.HOA_SPECIAL_ASSESSMENTS_AMOUNT_4#',
		HOA_STATEMENT_FEE_AMOUNT_4 = '#form.HOA_STATEMENT_FEE_AMOUNT_4#',
		HOA_TRANSFER_FEE_AMOUNT_4 = '#form.HOA_TRANSFER_FEE_AMOUNT_4#',
		HOA_OUT_OF_STATUTE_AMOUNT_4 = '#form.HOA_OUT_OF_STATUTE_AMOUNT_4#',
		HOA_LATE_FEES_AMOUNT_4 = '#form.HOA_LATE_FEES_AMOUNT_4#',
		HOA_ATTORNEY_FEES_AMOUNT_4 = '#form.HOA_ATTORNEY_FEES_AMOUNT_4#',
		FNMA_HOA_TOTAL_4 = '#form.FNMA_HOA_TOTAL_4#',
		SERVICER_HOA_TOTAL_4 = '#form.SERVICER_HOA_TOTAL_4#',
		HOA_TOTAL_4 = '#form.HOA_TOTAL_4#',
		ALL_FNMA_AMOUNT = '#form.ALL_FNMA_AMOUNT#',
		ALL_SERVICER_AMOUNT = '#form.ALL_SERVICER_AMOUNT#',
		ALL_HOA_AMOUNT = '#form.ALL_HOA_AMOUNT#',
		LIEN_TYPE_1 = '#form.LIEN_TYPE_1#',
		<cfif form.LIEN_RECORDED_DATE_1 eq ''>
		LIEN_RECORDED_DATE_1 = NULL,
		<cfelse>
		LIEN_RECORDED_DATE_1 = '#form.LIEN_RECORDED_DATE_1#',
		</cfif>
		LIEN_BASE_AMOUNT_1 = '#form.LIEN_BASE_AMOUNT_1#',
		LIEN_PENALTY_AMOUNT_1 = '#form.LIEN_PENALTY_AMOUNT_1#',
		LIEN_TOTAL_AMOUNT_1 = '#form.LIEN_TOTAL_AMOUNT_1#',
		LIEN_TYPE_2 = '#form.LIEN_TYPE_2#',
		<cfif form.LIEN_RECORDED_DATE_2 eq ''>
		LIEN_RECORDED_DATE_2 = NULL,
		<cfelse>
		LIEN_RECORDED_DATE_2 = '#form.LIEN_RECORDED_DATE_2#',
		</cfif>
		LIEN_BASE_AMOUNT_2 = '#form.LIEN_BASE_AMOUNT_2#',
		LIEN_PENALTY_AMOUNT_2 = '#form.LIEN_PENALTY_AMOUNT_2#',
		LIEN_TOTAL_AMOUNT_2 = '#form.LIEN_TOTAL_AMOUNT_2#',
		LIEN_TYPE_3 = '#form.LIEN_TYPE_3#',
		<cfif form.LIEN_RECORDED_DATE_3 eq ''>
		LIEN_RECORDED_DATE_3 = NULL,
		<cfelse>
		LIEN_RECORDED_DATE_3 = '#form.LIEN_RECORDED_DATE_3#',
		</cfif>
		LIEN_BASE_AMOUNT_3 = '#form.LIEN_BASE_AMOUNT_3#',
		LIEN_PENALTY_AMOUNT_3 = '#form.LIEN_PENALTY_AMOUNT_3#',
		LIEN_TOTAL_AMOUNT_3 = '#form.LIEN_TOTAL_AMOUNT_3#',
		TOTAL_FNMA_LIEN = '#form.TOTAL_FNMA_LIEN#',
		<cfif form.LAND_RENT_FROM_DATE eq ''>
		LAND_RENT_FROM_DATE = NULL,
		<cfelse>
		LAND_RENT_FROM_DATE = '#form.LAND_RENT_FROM_DATE#',
		</cfif>
		<cfif form.LAND_RENT_TO_DATE eq ''>
		LAND_RENT_TO_DATE = NULL,
		<cfelse>
		LAND_RENT_TO_DATE = '#form.LAND_RENT_TO_DATE#',
		</cfif>
		LAND_RENT_BASE_AMOUNT = '#form.LAND_RENT_BASE_AMOUNT#',
		LAND_RENT_PENALTY_AMOUNT = '#form.LAND_RENT_PENALTY_AMOUNT#',
		LAND_RENT_TOTAL_AMOUNT = '#form.LAND_RENT_TOTAL_AMOUNT#',
		<cfif form.CODE_VIOLATION_DATE_1 eq ''>
		CODE_VIOLATION_DATE_1 = NULL,
		<cfelse>
		CODE_VIOLATION_DATE_1 = '#form.CODE_VIOLATION_DATE_1#',
		</cfif>
		CODE_VIOLATION_AMOUNT_1 = '#form.CODE_VIOLATION_AMOUNT_1#',
		CODE_VIOLATION_TYPE_1 = '#form.CODE_VIOLATION_TYPE_1#',
		<cfif form.CODE_VIOLATION_DATE_2 eq ''>
		CODE_VIOLATION_DATE_2 = NULL,
		<cfelse>
		CODE_VIOLATION_DATE_2 = '#form.CODE_VIOLATION_DATE_2#',
		</cfif>
		CODE_VIOLATION_AMOUNT_2 = '#form.CODE_VIOLATION_AMOUNT_2#',
		CODE_VIOLATION_TYPE_2 = '#form.CODE_VIOLATION_TYPE_2#',
		<cfif form.CODE_VIOLATION_DATE_3 eq ''>
		CODE_VIOLATION_DATE_3 = NULL,
		<cfelse>
		CODE_VIOLATION_DATE_3 = '#form.CODE_VIOLATION_DATE_3#',
		</cfif>
		CODE_VIOLATION_AMOUNT_3 = '#form.CODE_VIOLATION_AMOUNT_3#',
		CODE_VIOLATION_TYPE_3 = '#form.CODE_VIOLATION_TYPE_3#',
		MOBILE_HOME_STATUS = '#form.MOBILE_HOME_STATUS#',
		MOBILE_HOME_CONVERSION_TYPE = '#form.MOBILE_HOME_CONVERSION_TYPE#',
		<cfif form.MOBILE_HOME_COMPLETION_DATE eq ''>
		MOBILE_HOME_COMPLETION_DATE = NULL,
		<cfelse>
		MOBILE_HOME_COMPLETION_DATE = '#form.MOBILE_HOME_COMPLETION_DATE#',
		</cfif>
		MORTGAGE_JUDGMENT_TYPE_1 = '#form.MORTGAGE_JUDGMENT_TYPE_1#',
		<cfif form.MORTGAGE_JUDGMENT_LEVY_DATE_1 eq ''>
		MORTGAGE_JUDGMENT_LEVY_DATE_1 = NULL,
		<cfelse>
		MORTGAGE_JUDGMENT_LEVY_DATE_1 = '#form.MORTGAGE_JUDGMENT_LEVY_DATE_1#',
		</cfif>
		MORTGAGE_JUDGMENT_LIEN_AMOUNT_1 = '#form.MORTGAGE_JUDGMENT_LIEN_AMOUNT_1#',
		MORTGAGE_JUDGMENT_IN_FAVOR_OF_1 = '#form.MORTGAGE_JUDGMENT_IN_FAVOR_OF_1#',
		MORTGAGE_JUDGMENT_TYPE_2 = '#form.MORTGAGE_JUDGMENT_TYPE_2#',
		<cfif form.MORTGAGE_JUDGMENT_LEVY_DATE_2 eq ''>
		MORTGAGE_JUDGMENT_LEVY_DATE_2 = NULL,
		<cfelse>
		MORTGAGE_JUDGMENT_LEVY_DATE_2 = '#form.MORTGAGE_JUDGMENT_LEVY_DATE_2#',
		</cfif>
		MORTGAGE_JUDGMENT_LIEN_AMOUNT_2 = '#form.MORTGAGE_JUDGMENT_LIEN_AMOUNT_2#',
		MORTGAGE_JUDGMENT_IN_FAVOR_OF_2 = '#form.MORTGAGE_JUDGMENT_IN_FAVOR_OF_2#',
		MORTGAGE_JUDGMENT_TYPE_3 = '#form.MORTGAGE_JUDGMENT_TYPE_3#',
		<cfif form.MORTGAGE_JUDGMENT_LEVY_DATE_3 eq ''>
		MORTGAGE_JUDGMENT_LEVY_DATE_3 = NULL,
		<cfelse>
		MORTGAGE_JUDGMENT_LEVY_DATE_3 = '#form.MORTGAGE_JUDGMENT_LEVY_DATE_3#',
		</cfif>
		MORTGAGE_JUDGMENT_LIEN_AMOUNT_3 = '#form.MORTGAGE_JUDGMENT_LIEN_AMOUNT_3#',
		MORTGAGE_JUDGMENT_IN_FAVOR_OF_3 = '#form.MORTGAGE_JUDGMENT_IN_FAVOR_OF_3#',
		IRS_FORECLOSURE_TYPE = '#form.IRS_FORECLOSURE_TYPE#',
		<cfif form.IRS_EXPIRATION_DATE eq ''>
		IRS_EXPIRATION_DATE = NULL,
		<cfelse>
		IRS_EXPIRATION_DATE = '#form.IRS_EXPIRATION_DATE#',
		</cfif>
		LEGAL_DESCRIPTION_ISSUE_TYPE = '#form.LEGAL_DESCRIPTION_ISSUE_TYPE#',
		SURVEY_STATUS = '#form.SURVEY_STATUS#',
		REASON_FOR_DELAY_TYPE = '#form.REASON_FOR_DELAY_TYPE#',
		CAUSE_TYPE = '#form.CAUSE_TYPE#',
		CURRENT_OWNER = '#form.CURRENT_OWNER#',
		COMMENTS = '#form.COMMENTS#'
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


<cfparam name="read_findings.TAX_TYPE_1" default="">	
<cfparam name="read_findings.TAX_FROM_DATE_1" default="">	
<cfparam name="read_findings.TAX_TO_DATE_1" default="">	
<cfparam name="read_findings.TAX_BASE_AMOUNT_1" default="">	
<cfparam name="read_findings.TAX_PENALTY_1" default="">	
<cfparam name="read_findings.TAX_TOTAL_DUE_1" default="">	
<cfparam name="read_findings.TAX_TYPE_2" default="">	
<cfparam name="read_findings.TAX_FROM_DATE_2" default="">	
<cfparam name="read_findings.TAX_TO_DATE_2" default="">	
<cfparam name="read_findings.TAX_BASE_AMOUNT_2" default="">	
<cfparam name="read_findings.TAX_PENALTY_2" default="">	
<cfparam name="read_findings.TAX_TOTAL_DUE_2" default="">	
<cfparam name="read_findings.TAX_TYPE_3" default="">	
<cfparam name="read_findings.TAX_FROM_DATE_3" default="">	
<cfparam name="read_findings.TAX_TO_DATE_3" default="">	
<cfparam name="read_findings.TAX_BASE_AMOUNT_3" default="">	
<cfparam name="read_findings.TAX_PENALTY_3" default="">	
<cfparam name="read_findings.TAX_TOTAL_DUE_3" default="">	
<cfparam name="read_findings.TAX_TYPE_4" default="">	
<cfparam name="read_findings.TAX_FROM_DATE_4" default="">	
<cfparam name="read_findings.TAX_TO_DATE_4" default="">	
<cfparam name="read_findings.TAX_BASE_AMOUNT_4" default="">	
<cfparam name="read_findings.TAX_PENALTY_4" default="">	
<cfparam name="read_findings.TAX_TOTAL_DUE_4" default="">	
<cfparam name="read_findings.ALL_TAXES_TOTAL" default="">	
<cfparam name="read_findings.HOA_TYPE_1" default="">	
<cfparam name="read_findings.HOA_FROM_DATE_1" default="">	
<cfparam name="read_findings.HOA_TO_DATE_1" default="">	
<cfparam name="read_findings.HOA_ALL_DUES_AMOUNT_1" default="">	
<cfparam name="read_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_1" default="">	
<cfparam name="read_findings.HOA_STATEMENT_FEE_AMOUNT_1" default="">	
<cfparam name="read_findings.HOA_TRANSFER_FEE_AMOUNT_1" default="">	
<cfparam name="read_findings.HOA_OUT_OF_STATUTE_AMOUNT_1" default="">	
<cfparam name="read_findings.HOA_LATE_FEES_AMOUNT_1" default="">	
<cfparam name="read_findings.HOA_ATTORNEY_FEES_AMOUNT_1" default="">	
<cfparam name="read_findings.FNMA_HOA_TOTAL_1" default="">	
<cfparam name="read_findings.SERVICER_HOA_TOTAL_1" default="">	
<cfparam name="read_findings.HOA_TOTAL_1" default="">	
<cfparam name="read_findings.HOA_TYPE_2" default="">	
<cfparam name="read_findings.HOA_FROM_DATE_2" default="">	
<cfparam name="read_findings.HOA_TO_DATE_2" default="">	
<cfparam name="read_findings.HOA_ALL_DUES_AMOUNT_2" default="">	
<cfparam name="read_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_2" default="">	
<cfparam name="read_findings.HOA_STATEMENT_FEE_AMOUNT_2" default="">	
<cfparam name="read_findings.HOA_TRANSFER_FEE_AMOUNT_2" default="">	
<cfparam name="read_findings.HOA_OUT_OF_STATUTE_AMOUNT_2" default="">	
<cfparam name="read_findings.HOA_LATE_FEES_AMOUNT_2" default="">	
<cfparam name="read_findings.HOA_ATTORNEY_FEES_AMOUNT_2" default="">	
<cfparam name="read_findings.FNMA_HOA_TOTAL_2" default="">	
<cfparam name="read_findings.SERVICER_HOA_TOTAL_2" default="">	
<cfparam name="read_findings.HOA_TOTAL_2" default="">	
<cfparam name="read_findings.HOA_TYPE_3" default="">	
<cfparam name="read_findings.HOA_FROM_DATE_3" default="">	
<cfparam name="read_findings.HOA_TO_DATE_3" default="">	
<cfparam name="read_findings.HOA_ALL_DUES_AMOUNT_3" default="">	
<cfparam name="read_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_3" default="">	
<cfparam name="read_findings.HOA_STATEMENT_FEE_AMOUNT_3" default="">	
<cfparam name="read_findings.HOA_TRANSFER_FEE_AMOUNT_3" default="">	
<cfparam name="read_findings.HOA_OUT_OF_STATUTE_AMOUNT_3" default="">	
<cfparam name="read_findings.HOA_LATE_FEES_AMOUNT_3" default="">	
<cfparam name="read_findings.HOA_ATTORNEY_FEES_AMOUNT_3" default="">	
<cfparam name="read_findings.FNMA_HOA_TOTAL_3" default="">	
<cfparam name="read_findings.SERVICER_HOA_TOTAL_3" default="">	
<cfparam name="read_findings.HOA_TOTAL_3" default="">	
<cfparam name="read_findings.HOA_TYPE_4" default="">	
<cfparam name="read_findings.HOA_FROM_DATE_4" default="">	
<cfparam name="read_findings.HOA_TO_DATE_4" default="">	
<cfparam name="read_findings.HOA_ALL_DUES_AMOUNT_4" default="">	
<cfparam name="read_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_4" default="">	
<cfparam name="read_findings.HOA_STATEMENT_FEE_AMOUNT_4" default="">	
<cfparam name="read_findings.HOA_TRANSFER_FEE_AMOUNT_4" default="">	
<cfparam name="read_findings.HOA_OUT_OF_STATUTE_AMOUNT_4" default="">	
<cfparam name="read_findings.HOA_LATE_FEES_AMOUNT_4" default="">	
<cfparam name="read_findings.HOA_ATTORNEY_FEES_AMOUNT_4" default="">	
<cfparam name="read_findings.FNMA_HOA_TOTAL_4" default="">	
<cfparam name="read_findings.SERVICER_HOA_TOTAL_4" default="">	
<cfparam name="read_findings.HOA_TOTAL_4" default="">	
<cfparam name="read_findings.ALL_FNMA_AMOUNT" default="">	
<cfparam name="read_findings.ALL_SERVICER_AMOUNT" default="">	
<cfparam name="read_findings.ALL_HOA_AMOUNT" default="">	
<cfparam name="read_findings.LIEN_TYPE_1" default="">	
<cfparam name="read_findings.LIEN_RECORDED_DATE_1" default="">	
<cfparam name="read_findings.LIEN_BASE_AMOUNT_1" default="">	
<cfparam name="read_findings.LIEN_PENALTY_AMOUNT_1" default="">	
<cfparam name="read_findings.LIEN_TOTAL_AMOUNT_1" default="">	
<cfparam name="read_findings.LIEN_TYPE_2" default="">	
<cfparam name="read_findings.LIEN_RECORDED_DATE_2" default="">	
<cfparam name="read_findings.LIEN_BASE_AMOUNT_2" default="">	
<cfparam name="read_findings.LIEN_PENALTY_AMOUNT_2" default="">	
<cfparam name="read_findings.LIEN_TOTAL_AMOUNT_2" default="">	
<cfparam name="read_findings.LIEN_TYPE_3" default="">	
<cfparam name="read_findings.LIEN_RECORDED_DATE_3" default="">	
<cfparam name="read_findings.LIEN_BASE_AMOUNT_3" default="">	
<cfparam name="read_findings.LIEN_PENALTY_AMOUNT_3" default="">	
<cfparam name="read_findings.LIEN_TOTAL_AMOUNT_3" default="">	
<cfparam name="read_findings.TOTAL_FNMA_LIEN" default="">	
<cfparam name="read_findings.LAND_RENT_FROM_DATE" default="">	
<cfparam name="read_findings.LAND_RENT_TO_DATE" default="">	
<cfparam name="read_findings.LAND_RENT_BASE_AMOUNT" default="">	
<cfparam name="read_findings.LAND_RENT_PENALTY_AMOUNT" default="">	
<cfparam name="read_findings.LAND_RENT_TOTAL_AMOUNT" default="">	
<cfparam name="read_findings.CODE_VIOLATION_DATE_1" default="">	
<cfparam name="read_findings.CODE_VIOLATION_AMOUNT_1" default="">	
<cfparam name="read_findings.CODE_VIOLATION_TYPE_1" default="">	
<cfparam name="read_findings.CODE_VIOLATION_DATE_2" default="">	
<cfparam name="read_findings.CODE_VIOLATION_AMOUNT_2" default="">	
<cfparam name="read_findings.CODE_VIOLATION_TYPE_2" default="">	
<cfparam name="read_findings.CODE_VIOLATION_DATE_3" default="">	
<cfparam name="read_findings.CODE_VIOLATION_AMOUNT_3" default="">	
<cfparam name="read_findings.CODE_VIOLATION_TYPE_3" default="">	
<cfparam name="read_findings.MOBILE_HOME_STATUS" default="">	
<cfparam name="read_findings.MOBILE_HOME_CONVERSION_TYPE" default="">	
<cfparam name="read_findings.MOBILE_HOME_COMPLETION_DATE" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_TYPE_1" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_LEVY_DATE_1" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_LIEN_AMOUNT_1" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_IN_FAVOR_OF_1" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_TYPE_2" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_LEVY_DATE_2" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_LIEN_AMOUNT_2" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_IN_FAVOR_OF_2" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_TYPE_3" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_LEVY_DATE_3" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_LIEN_AMOUNT_3" default="">	
<cfparam name="read_findings.MORTGAGE_JUDGMENT_IN_FAVOR_OF_3" default="">	
<cfparam name="read_findings.IRS_FORECLOSURE_TYPE" default="">	
<cfparam name="read_findings.IRS_EXPIRATION_DATE" default="">	
<cfparam name="read_findings.LEGAL_DESCRIPTION_ISSUE_TYPE" default="">	
<cfparam name="read_findings.SURVEY_STATUS" default="">	
<cfparam name="read_findings.REASON_FOR_DELAY_TYPE" default="">	
<cfparam name="read_findings.CAUSE_TYPE" default="">	
<cfparam name="read_findings.CURRENT_OWNER" default="">	
<cfparam name="read_findings.COMMENTS" default="">	



<cfif form.submit_equator neq 0>

<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendReportTitleFindings" titleid="#read_findings.title_id#">
<cfsetting enableCFoutputOnly = "no">
</cfif>


<script language="javascript">
function order_tables() {
if (document.getElementById('review_title_type').options[1].selected) {
document.getElementById('cure_table').style.display = 'block';
} else {
document.getElementById('cure_table').style.display = 'none';
}

if (document.getElementById('review_title_type').options[2].selected) {
document.getElementById('cure_table').style.display = 'none';
} 

if (document.getElementById('title_findings_type_cure').options[1].selected && document.getElementById('review_title_type').options[1].selected) {
document.getElementById('foreclosure_table').style.display = 'block';
document.getElementById('taxes_table').style.display = 'none';
document.getElementById('hoa_table').style.display = 'none';
document.getElementById('lien_table').style.display = 'none';
document.getElementById('land_table').style.display = 'none';
document.getElementById('code_table').style.display = 'none';
document.getElementById('mobile_table').style.display = 'none';
document.getElementById('mortgage_table').style.display = 'none';
document.getElementById('irs_table').style.display = 'none';
document.getElementById('legal_table').style.display = 'none';
document.getElementById('fannie_table').style.display = 'none';
} else {
document.getElementById('foreclosure_table').style.display = 'none';
}


if (document.getElementById('title_findings_type_cure').options[2].selected && document.getElementById('review_title_type').options[1].selected) {
document.getElementById('fannie_table').style.display = 'block';
document.getElementById('foreclosure_table').style.display = 'none';
document.getElementById('taxes_table').style.display = 'none';
document.getElementById('hoa_table').style.display = 'none';
document.getElementById('lien_table').style.display = 'none';
document.getElementById('land_table').style.display = 'none';
document.getElementById('code_table').style.display = 'none';
document.getElementById('mobile_table').style.display = 'none';
document.getElementById('mortgage_table').style.display = 'none';
document.getElementById('irs_table').style.display = 'none';
document.getElementById('legal_table').style.display = 'none';
} else {
document.getElementById('fannie_table').style.display = 'none';
}

if (document.getElementById('title_findings_type_cure').options[3].selected && document.getElementById('review_title_type').options[1].selected) {
document.getElementById('taxes_table').style.display = 'block';
document.getElementById('hoa_table').style.display = 'none';
document.getElementById('lien_table').style.display = 'none';
document.getElementById('land_table').style.display = 'none';
document.getElementById('code_table').style.display = 'none';
document.getElementById('mobile_table').style.display = 'none';
document.getElementById('mortgage_table').style.display = 'none';
document.getElementById('irs_table').style.display = 'none';
document.getElementById('legal_table').style.display = 'none';
document.getElementById('foreclosure_table').style.display = 'none';
document.getElementById('fannie_table').style.display = 'none';
} else {
document.getElementById('taxes_table').style.display = 'none';
}

if (document.getElementById('title_findings_type_cure').options[4].selected && document.getElementById('review_title_type').options[1].selected) {
document.getElementById('hoa_table').style.display = 'block';
document.getElementById('taxes_table').style.display = 'none';
document.getElementById('lien_table').style.display = 'none';
document.getElementById('land_table').style.display = 'none';
document.getElementById('code_table').style.display = 'none';
document.getElementById('mobile_table').style.display = 'none';
document.getElementById('mortgage_table').style.display = 'none';
document.getElementById('irs_table').style.display = 'none';
document.getElementById('legal_table').style.display = 'none';
document.getElementById('foreclosure_table').style.display = 'none';
document.getElementById('fannie_table').style.display = 'none';
} else {
document.getElementById('hoa_table').style.display = 'none';
}

if (document.getElementById('title_findings_type_cure').options[5].selected && document.getElementById('review_title_type').options[1].selected) {
document.getElementById('legal_table').style.display = 'block';
document.getElementById('irs_table').style.display = 'none';
document.getElementById('lien_table').style.display = 'none';
document.getElementById('hoa_table').style.display = 'none';
document.getElementById('taxes_table').style.display = 'none';
document.getElementById('land_table').style.display = 'none';
document.getElementById('code_table').style.display = 'none';
document.getElementById('mobile_table').style.display = 'none';
document.getElementById('mortgage_table').style.display = 'none';
document.getElementById('foreclosure_table').style.display = 'none';
document.getElementById('fannie_table').style.display = 'none';
} else {
document.getElementById('legal_table').style.display = 'none';
}


if (document.getElementById('title_findings_type_cure').options[6].selected && document.getElementById('review_title_type').options[1].selected) {
document.getElementById('irs_table').style.display = 'block';
document.getElementById('lien_table').style.display = 'none';
document.getElementById('hoa_table').style.display = 'none';
document.getElementById('taxes_table').style.display = 'none';
document.getElementById('land_table').style.display = 'none';
document.getElementById('code_table').style.display = 'none';
document.getElementById('mobile_table').style.display = 'none';
document.getElementById('mortgage_table').style.display = 'none';
document.getElementById('legal_table').style.display = 'none';
document.getElementById('foreclosure_table').style.display = 'none';
document.getElementById('fannie_table').style.display = 'none';
} else {
document.getElementById('irs_table').style.display = 'none';
}


if (document.getElementById('title_findings_type_cure').options[7].selected && document.getElementById('review_title_type').options[1].selected) {
document.getElementById('lien_table').style.display = 'block';
document.getElementById('hoa_table').style.display = 'none';
document.getElementById('taxes_table').style.display = 'none';
document.getElementById('land_table').style.display = 'none';
document.getElementById('code_table').style.display = 'none';
document.getElementById('mobile_table').style.display = 'none';
document.getElementById('mortgage_table').style.display = 'none';
document.getElementById('irs_table').style.display = 'none';
document.getElementById('legal_table').style.display = 'none';
document.getElementById('foreclosure_table').style.display = 'none';
document.getElementById('fannie_table').style.display = 'none';
} else {
document.getElementById('lien_table').style.display = 'none';
}

if (document.getElementById('title_findings_type_cure').options[8].selected && document.getElementById('review_title_type').options[1].selected) {
document.getElementById('mortgage_table').style.display = 'block';
document.getElementById('lien_table').style.display = 'none';
document.getElementById('hoa_table').style.display = 'none';
document.getElementById('taxes_table').style.display = 'none';
document.getElementById('land_table').style.display = 'none';
document.getElementById('code_table').style.display = 'none';
document.getElementById('mobile_table').style.display = 'none';
document.getElementById('irs_table').style.display = 'none';
document.getElementById('legal_table').style.display = 'none';
document.getElementById('foreclosure_table').style.display = 'none';
document.getElementById('fannie_table').style.display = 'none';
} else {
document.getElementById('mortgage_table').style.display = 'none';
}

if (document.getElementById('title_findings_type_cure').options[9].selected && document.getElementById('review_title_type').options[1].selected) {
document.getElementById('mobile_table').style.display = 'block';
document.getElementById('code_table').style.display = 'none';
document.getElementById('land_table').style.display = 'none';
document.getElementById('hoa_table').style.display = 'none';
document.getElementById('lien_table').style.display = 'none';
document.getElementById('taxes_table').style.display = 'none';
document.getElementById('mortgage_table').style.display = 'none';
document.getElementById('irs_table').style.display = 'none';
document.getElementById('legal_table').style.display = 'none';
document.getElementById('foreclosure_table').style.display = 'none';
document.getElementById('fannie_table').style.display = 'none';
} else {
document.getElementById('mobile_table').style.display = 'none';
}

if (document.getElementById('title_findings_type_cure').options[10].selected && document.getElementById('review_title_type').options[1].selected) {
document.getElementById('code_table').style.display = 'block';
document.getElementById('land_table').style.display = 'none';
document.getElementById('hoa_table').style.display = 'none';
document.getElementById('lien_table').style.display = 'none';
document.getElementById('taxes_table').style.display = 'none';
document.getElementById('mobile_table').style.display = 'none';
document.getElementById('mortgage_table').style.display = 'none';
document.getElementById('irs_table').style.display = 'none';
document.getElementById('legal_table').style.display = 'none';
document.getElementById('foreclosure_table').style.display = 'none';
document.getElementById('fannie_table').style.display = 'none';
} else {
document.getElementById('code_table').style.display = 'none';
}


if (document.getElementById('title_findings_type_cure').options[11].selected && document.getElementById('review_title_type').options[1].selected) {
document.getElementById('land_table').style.display = 'block';
document.getElementById('hoa_table').style.display = 'none';
document.getElementById('lien_table').style.display = 'none';
document.getElementById('taxes_table').style.display = 'none';
document.getElementById('code_table').style.display = 'none';
document.getElementById('mobile_table').style.display = 'none';
document.getElementById('mortgage_table').style.display = 'none';
document.getElementById('irs_table').style.display = 'none';
document.getElementById('legal_table').style.display = 'none';
document.getElementById('foreclosure_table').style.display = 'none';
document.getElementById('fannie_table').style.display = 'none';
} else {
document.getElementById('land_table').style.display = 'none';
}



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
					<B>EQUATOR - REPORT TITLE FINDINGS
					</B><BR>
					You can click the "Save All" Button to save your changes at any time.<br>
Click the "Submit to Equator" button <font color="red"><b>ONLY</b></font> once ALL information has been fill-ed out and saved.<br>
<!--- <a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=taxes">Taxes</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=hoa">HOA</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=lien">Liens</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="equator_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#&show=land">Land Rent</a><br> --->
					</Center></cfoutput>
<br>
					</TD>
				</TR></table><br>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<tr>
<cfoutput>
<form action="equator_report_title_findings.cfm?rec_id=#url.rec_id#&uid=#url.rec_id#&al=#url.al#&company_id=#url.company_id#&order_type=#url.order_type#&code=#url.code#" method="post" enctype="multipart/form-data"></cfoutput>
<table bgcolor=e1e1e1>
<tr>
<td align="right" valign="top" width="250">Review Title</td>
<td align="left" valign="top" width="350"><select name="review_title_type"  id="review_title_type" style="font-size: 9; 
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
									clear: none; width:200px;" onchange="order_tables();">
									
<option value="">--Select--</option>
<option value="CURE">CURE</option>
<option value="CLEAR">CLEAR</option>
</select></td>
</tr>

<tr  name="cure_table" id="cure_table" style="display:none;">
<td align="right" valign="top" width="250">Title Findings</td>
<td align="left" valign="top" width="350"><select name="title_findings_type_cure" style="font-size: 9; 
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
									clear: none; width:200px;" onchange="order_tables();">
									
<option value="">--Select--</option>
<option value="NO FORECLOSURE DEED - VESTING">NO FORECLOSURE DEED - VESTING</option>
<option value="FANNIE MAE IS NOT IN TITLE - VESTING">FANNIE MAE IS NOT IN TITLE - VESTING</option>
<option value="TAXES - VESTING">TAXES - VESTING</option>
<option value="HOA - VESTING">HOA - VESTING</option>
<option value="LEGAL DESCRIPTION - CURATIVE">LEGAL DESCRIPTION - CURATIVE</option>
<option value="IRS REDEMPTION - CURATIVE">IRS REDEMPTION - CURATIVE</option>
<option value="LIENS - CURATIVE">LIENS - CURATIVE</option>
<option value="MORTGAGES AND JUDGEMENTS - CURATIVE">MORTGAGES AND JUDGEMENTS - CURATIVE</option>
<option value="MOBILE HOME?MANUFACTURED HOUSING - CURATIVE">MOBILE HOME/MANUFACTURED HOUSING - CURATIVE</option>
<option value="CODE VIOLATION - CURATIVE">CODE VIOLATION - CURATIVE</option>
<option value="LAND RENT - CURATIVE">LAND RENT - CURATIVE</option>
</select></td>
</tr>


<!--- <tr  name="clear_table" id="clear_table" style="display:none;">
<td align="right" valign="top" width="250">Title Findings</td>
<td align="left" valign="top" width="350"><select name="title_findings_type_clear" style="font-size: 9; 
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
									clear: none; width:200px;" onchange="order_tables();">
									
<option value="">--Select--</option>
</select></td>
</tr> --->




<!--- TAXES --->
<cfoutput>
<tr name="taxes_table" id="taxes_table" style="display:none;">
					<td colspan=2 align=center valign=top bgcolor=e1e1e1>

<table bgcolor=e1e1e1>
<tr>
<td align="right" valign="top" width="250">Tax Type (1)</td>
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
<td align="right" valign="top" width="250">Tax From Date (1)</td>
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
<td align="right" valign="top" width="250">Tax To Date (1)</td>
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
<td align="right" valign="top" width="250">Tax Base Amount (1)</td>
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
<td align="right" valign="top" width="250">Tax Penalty/Interst Amount (1)</td>
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
<td align="right" valign="top" width="250">Tax Total Due(1)</td>
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
<td align="right" valign="top" width="250">Tax Type (2)</td>
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
<td align="right" valign="top" width="250">Tax From Date (2)</td>
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
<td align="right" valign="top" width="250">Tax To Date (2)</td>
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
<td align="right" valign="top" width="250">Tax Base Amount (2)</td>
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
<td align="right" valign="top" width="250">Tax Penalty/Interst Amount (2)</td>
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
<td align="right" valign="top" width="250">Tax Total Due(2)</td>
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
<td align="right" valign="top" width="250">Tax Type (3)</td>
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
<td align="right" valign="top" width="250">Tax From Date (3)</td>
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
<td align="right" valign="top" width="250">Tax To Date (3)</td>
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
<td align="right" valign="top" width="250">Tax Base Amount (3)</td>
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
<td align="right" valign="top" width="250">Tax Penalty/Interst Amount (3)</td>
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
<td align="right" valign="top" width="250">Tax Total Due(3)</td>
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
<td align="right" valign="top" width="250">Tax Type (4)</td>
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
<td align="right" valign="top" width="250">Tax From Date (4)</td>
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
<td align="right" valign="top" width="250">Tax To Date (4)</td>
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
<td align="right" valign="top" width="250">Tax Base Amount (4)</td>
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
<td align="right" valign="top" width="250">Tax Penalty/Interst Amount (4)</td>
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
<td align="right" valign="top" width="250">Tax Total Due(4)</td>
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
<td align="right" valign="top" width="250">All Taxes Total Due Amount</td>
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
</table>
</td>
</tr>
</cfoutput>




<cfoutput>
<!--- HOA TABLE --->
<tr name="hoa_table" id="hoa_table" style="display:none;">
					<td colspan=2 align=center valign=top bgcolor=e1e1e1>

<table bgcolor=e1e1e1>
<tr>
<td align="right" valign="top" width="250">HOA (1)</td>
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
<td align="right" valign="top" width="250">HOA From Date (1)</td>
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
<td align="right" valign="top" width="250">HOA To Date (1)</td>
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
<td align="right" valign="top" width="250">HOA All Dues Amount (1)</td>
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
<td align="right" valign="top" width="250">HOA Special Assessments Amount (1)</td>
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
<td align="right" valign="top" width="250">HOA Statement Fee Amount(1)</td>
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
<td align="right" valign="top" width="250">HOA Transfer/Resale/Disclosure Fee Amount (1)</td>
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
<td align="right" valign="top" width="250">HOA Out of Statute/Penalties/Charges (1)</td>
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
<td align="right" valign="top" width="250">HOA Late Fees/Penalties/Interest (1)</td>
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
<td align="right" valign="top" width="250">HOA Attorney Fees Amount(1)</td>
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
<td align="right" valign="top" width="250">FNMA HOA Total (1)</td>
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
<td align="right" valign="top" width="250">Servicer HOA Total (1)</td>
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
<td align="right" valign="top" width="250">HOA Total (1)</td>
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
<td align="right" valign="top" width="250">HOA (2)</td>
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
<td align="right" valign="top" width="250">HOA From Date (2)</td>
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
<td align="right" valign="top" width="250">HOA To Date (2)</td>
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
<td align="right" valign="top" width="250">HOA All Dues Amount (2)</td>
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
<td align="right" valign="top" width="250">HOA Special Assessments Amount (2)</td>
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
<td align="right" valign="top" width="250">HOA Statement Fee Amount(2)</td>
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
<td align="right" valign="top" width="250">HOA Transfer/Resale/Disclosure Fee Amount (2)</td>
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
<td align="right" valign="top" width="250">HOA Out of Statute/Penalties/Charges (2)</td>
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
<td align="right" valign="top" width="250">HOA Late Fees/Penalties/Interest (2)</td>
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
<td align="right" valign="top" width="250">HOA Attorney Fees Amount(2)</td>
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
<td align="right" valign="top" width="250">FNMA HOA Total (2)</td>
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
<td align="right" valign="top" width="250">Servicer HOA Total (2)</td>
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
<td align="right" valign="top" width="250">HOA Total (2)</td>
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
<td align="right" valign="top" width="250">HOA (3)</td>
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
<td align="right" valign="top" width="250">HOA From Date (3)</td>
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
<td align="right" valign="top" width="250">HOA To Date (3)</td>
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
<td align="right" valign="top" width="250">HOA All Dues Amount (3)</td>
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
<td align="right" valign="top" width="250">HOA Special Assessments Amount (3)</td>
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
<td align="right" valign="top" width="250">HOA Statement Fee Amount(3)</td>
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
<td align="right" valign="top" width="250">HOA Transfer/Resale/Disclosure Fee Amount (3)</td>
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
<td align="right" valign="top" width="250">HOA Out of Statute/Penalties/Charges (3)</td>
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
<td align="right" valign="top" width="250">HOA Late Fees/Penalties/Interest (3)</td>
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
<td align="right" valign="top" width="250">HOA Attorney Fees Amount(3)</td>
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
<td align="right" valign="top" width="250">FNMA HOA Total (3)</td>
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
<td align="right" valign="top" width="250">Servicer HOA Total (3)</td>
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
<td align="right" valign="top" width="250">HOA Total (3)</td>
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
<td align="right" valign="top" width="250">HOA (4)</td>
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
<option value="FOURTH" <cfif read_findings.hoa_type_4 eq 'FOURTH'>selected</cfif>>FOURTH</option>
</select></td>
</tr>
<tr>
<td align="right" valign="top" width="250">HOA From Date (4)</td>
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
<td align="right" valign="top" width="250">HOA To Date (4)</td>
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
<td align="right" valign="top" width="250">HOA All Dues Amount (4)</td>
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
<td align="right" valign="top" width="250">HOA Special Assessments Amount (4)</td>
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
<td align="right" valign="top" width="250">HOA Statement Fee Amount(4)</td>
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
<td align="right" valign="top" width="250">HOA Transfer/Resale/Disclosure Fee Amount (4)</td>
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
<td align="right" valign="top" width="250">HOA Out of Statute/Penalties/Charges (4)</td>
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
<td align="right" valign="top" width="250">HOA Late Fees/Penalties/Interest (4)</td>
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
<td align="right" valign="top" width="250">HOA Attorney Fees Amount(4)</td>
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
<td align="right" valign="top" width="250">FNMA HOA Total (4)</td>
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
<td align="right" valign="top" width="250">Servicer HOA Total (4)</td>
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
<td align="right" valign="top" width="250">HOA Total (4)</td>
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
<td align="right" valign="top" width="250">All FNMA HOA Amount</td>
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
<td align="right" valign="top" width="250">All Servicer HOA Amount</td>
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
<td align="right" valign="top" width="250">All HOA Amount</td>
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
</table>
</td>
</tr>
</cfoutput>


<cfoutput>

<!--- LIEN TABLE --->
<tr name="lien_table" id="lien_table" style="display:none;">
					<td colspan=2 align=center valign=top bgcolor=e1e1e1>

<table bgcolor=e1e1e1>
<tr>
<td align="right" valign="top" width="250">Lien (1)</td>
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
<td align="right" valign="top" width="250">Lien Recorded Date (1)</td>
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
<td align="right" valign="top" width="250">Lien Base Amount (1)</td>
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
<td align="right" valign="top" width="250">Lien Penalty & Interest Amount (1)</td>
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
<td align="right" valign="top" width="250">Lien Total Amount(1)</td>
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
<td align="right" valign="top" width="250">Lien (2)</td>
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
<td align="right" valign="top" width="250">Lien Recorded Date (2)</td>
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
<td align="right" valign="top" width="250">Lien Base Amount (2)</td>
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
<td align="right" valign="top" width="250">Lien Penalty & Interest Amount (2)</td>
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
<td align="right" valign="top" width="250">Lien Total Amount(2)</td>
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
<td align="right" valign="top" width="250">Lien (3)</td>
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
<td align="right" valign="top" width="250">Lien Recorded Date (3)</td>
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
<td align="right" valign="top" width="250">Lien Base Amount (3)</td>
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
<td align="right" valign="top" width="250">Lien Penalty & Interest Amount (3)</td>
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
<td align="right" valign="top" width="250">Lien Total Amount(3)</td>
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
<td align="right" valign="top" width="250">Total FNMA Lien Amount</td>
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
</table>
</td>
</tr>
</cfoutput>





<cfoutput>
<tr name="land_table" id="land_table" style="display:none;">
					<td colspan=2 align=center valign=top bgcolor=e1e1e1>

<table bgcolor=e1e1e1>
<tr>
<td align="right" valign="top" width="250">Land Rent From Date</td>
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
<td align="right" valign="top" width="250">Land Rent To Date</td>
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
<td align="right" valign="top" width="250">Land Rent Base Amount</td>
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
<td align="right" valign="top" width="250">Land Rent Penalty/Interst Amount</td>
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
<td align="right" valign="top" width="250">Land Rent Total Due</td>
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
</table>
</td></tr>
</cfoutput>


<!--- CODE VIOLATION --->
<cfoutput>
<tr name="code_table" id="code_table" style="display:none;">
					<td colspan=2 align=center valign=top bgcolor=e1e1e1>

<table bgcolor=e1e1e1>
<tr>
<td align="right" valign="top" width="250">Code Violation Date (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="code_violation_date_1" value="#DateFormat(read_findings.code_violation_date_1, 'mm-dd-yyyy')#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Code Violation Amount (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="code_violation_amount_1" value="#read_findings.code_violation_amount_1#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Code Violation Type (1)</td>
<td align="left" valign="top" width="350"><select name="code_violation_type_1" style="font-size: 9; 
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
<option value="YARD/DEBRIS" <cfif read_findings.code_violation_type_1 eq 'YARD/DEBRIS'>selected</cfif>>YARD/DEBRIS</option>
<option value="SUBSTANDARD DWELLING CONDITION" <cfif read_findings.code_violation_type_1 eq 'SUBSTANDARD DWELLING CONDITION'>selected</cfif>>SUBSTANDARD DWELLING CONDITION</option>
<option value="STRUCTURE VIOLATION" <cfif read_findings.code_violation_type_1 eq 'STRUCTURE VIOLATION'>selected</cfif>>STRUCTURE VIOLATION</option>
<option value="HAZARD SUBSTANCES" <cfif read_findings.code_violation_type_1 eq 'HAZARD SUBSTANCES'>selected</cfif>>HAZARD SUBSTANCES</option>
</select></td>
</tr>
<tr>
<td align="right" valign="top" width="250">Code Violation Date (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="code_violation_date_2" value="#DateFormat(read_findings.code_violation_date_2, 'mm-dd-yyyy')#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Code Violation Amount (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="code_violation_amount_2" value="#read_findings.code_violation_amount_2#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Code Violation Type (2)</td>
<td align="left" valign="top" width="350"><select name="code_violation_type_2" style="font-size: 9; 
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
<option value="YARD/DEBRIS" <cfif read_findings.code_violation_type_2 eq 'YARD/DEBRIS'>selected</cfif>>YARD/DEBRIS</option>
<option value="SUBSTANDARD DWELLING CONDITION" <cfif read_findings.code_violation_type_2 eq 'SUBSTANDARD DWELLING CONDITION'>selected</cfif>>SUBSTANDARD DWELLING CONDITION</option>
<option value="STRUCTURE VIOLATION" <cfif read_findings.code_violation_type_2 eq 'STRUCTURE VIOLATION'>selected</cfif>>STRUCTURE VIOLATION</option>
<option value="HAZARD SUBSTANCES" <cfif read_findings.code_violation_type_2 eq 'HAZARD SUBSTANCES'>selected</cfif>>HAZARD SUBSTANCES</option>
</select></td>
</tr>
<tr>
<td align="right" valign="top" width="250">Code Violation Date (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="code_violation_date_3" value="#DateFormat(read_findings.code_violation_date_3, 'mm-dd-yyyy')#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Code Violation Amount (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="code_violation_amount_3" value="#read_findings.code_violation_amount_3#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Code Violation Type (3)</td>
<td align="left" valign="top" width="350"><select name="code_violation_type_3" style="font-size: 9; 
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
<option value="YARD/DEBRIS" <cfif read_findings.code_violation_type_3 eq 'YARD/DEBRIS'>selected</cfif>>YARD/DEBRIS</option>
<option value="SUBSTANDARD DWELLING CONDITION" <cfif read_findings.code_violation_type_3 eq 'SUBSTANDARD DWELLING CONDITION'>selected</cfif>>SUBSTANDARD DWELLING CONDITION</option>
<option value="STRUCTURE VIOLATION" <cfif read_findings.code_violation_type_3 eq 'STRUCTURE VIOLATION'>selected</cfif>>STRUCTURE VIOLATION</option>
<option value="HAZARD SUBSTANCES" <cfif read_findings.code_violation_type_3 eq 'HAZARD SUBSTANCES'>selected</cfif>>HAZARD SUBSTANCES</option>
</select></td>
</tr>
</table>
</td></tr>
</cfoutput>


<cfoutput>
<tr name="mobile_table" id="mobile_table" style="display:none;">
					<td colspan=2 align=center valign=top bgcolor=e1e1e1>

<table bgcolor=e1e1e1>
<tr>
<td align="right" valign="top" width="250">Mobile Home Status</td>
<td align="left" valign="top" width="350"><select name="mobile_home_status" style="font-size: 9; 
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
<option value="NO" <cfif read_findings.mobile_home_status eq 'NO'>selected</cfif>>NO</option>
<option value="YES" <cfif read_findings.mobile_home_status eq 'YES'>selected</cfif>>YES</option>
</select></td>
</tr>
<tr>
<td align="right" valign="top" width="250">Mobile Home Conversion Type</td>
<td align="left" valign="top" width="350"><select name="mobile_home_conversion_type" style="font-size: 9; 
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
<option value="AFFIDAVIT OF AFFIXTURE" <cfif read_findings.mobile_home_conversion_type eq 'AFFIDAVIT OF AFFIXTURE'>selected</cfif>>AFFIDAVIT OF AFFIXTURE</option>
<option value="CERTIFICATE OF TITLE" <cfif read_findings.mobile_home_conversion_type eq 'CERTIFICATE OF TITLE'>selected</cfif>>CERTIFICATE OF TITLE</option>
<option value="BOND" <cfif read_findings.mobile_home_conversion_type eq 'BOND'>selected</cfif>>BOND</option>
</select></td>
</tr><tr>
<td align="right" valign="top" width="250">Mobile Home Completion Date</td>

<td align="left" valign="top" width="350"><input type="text" name="mobile_home_completion_date" value="#read_findings.mobile_home_completion_date#" style="font-size: 9; 
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
</table>
</td></tr>
</cfoutput>



<!--- MORTGAGES --->
<cfoutput>
<tr name="mortgage_table" id="mortgage_table" style="display:none;">
					<td colspan=2 align=center valign=top bgcolor=e1e1e1>

<table bgcolor=e1e1e1>
<tr>
<td align="right" valign="top" width="250">Mortgage/Judgment Type (1)</td>
<td align="left" valign="top" width="350"><select name="mortgage_judgment_type_1" style="font-size: 9; 
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
<option value="SENIOR MORTGAGE" <cfif read_findings.mortgage_judgment_type_1 eq 'SENIOR MORTGAGE'>selected</cfif>>SENIOR MORTGAGE</option>
<option value="JUNIOR MORTGAGE" <cfif read_findings.mortgage_judgment_type_1 eq 'JUNIOR MORTGAGE'>selected</cfif>>JUNIOR MORTGAGE</option>
</select></td>
</tr>

<tr>
<td align="right" valign="top" width="250">Mortgage/Judgment Levy Date (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="mortgage_judgment_levy_date_1" value="#DateFormat(read_findings.mortgage_judgment_levy_date_1, 'mm-dd-yyyy')#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Mortgage/Judgment Lien Amount (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="mortgage_judgment_lien_amount_1" value="#read_findings.mortgage_judgment_lien_amount_1#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Mortgage/Judgment In Favor Of (1)</td>
<td align="left" valign="top" width="350"><input type="text" name="mortgage_judgment_in_favor_of_1" value="#read_findings.mortgage_judgment_in_favor_of_1#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Mortgage/Judgment Type (2)</td>
<td align="left" valign="top" width="350"><select name="mortgage_judgment_type_2" style="font-size: 9; 
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
<option value="SENIOR MORTGAGE" <cfif read_findings.mortgage_judgment_type_2 eq 'SENIOR MORTGAGE'>selected</cfif>>SENIOR MORTGAGE</option>
<option value="JUNIOR MORTGAGE" <cfif read_findings.mortgage_judgment_type_2 eq 'JUNIOR MORTGAGE'>selected</cfif>>JUNIOR MORTGAGE</option>
</select></td>
</tr>

<tr>
<td align="right" valign="top" width="250">Mortgage/Judgment Levy Date (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="mortgage_judgment_levy_date_2" value="#DateFormat(read_findings.mortgage_judgment_levy_date_2, 'mm-dd-yyyy')#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Mortgage/Judgment Lien Amount (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="mortgage_judgment_lien_amount_2" value="#read_findings.mortgage_judgment_lien_amount_2#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Mortgage/Judgment In Favor Of (2)</td>
<td align="left" valign="top" width="350"><input type="text" name="mortgage_judgment_in_favor_of_2" value="#read_findings.mortgage_judgment_in_favor_of_2#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Mortgage/Judgment Type (3)</td>
<td align="left" valign="top" width="350"><select name="mortgage_judgment_type_3" style="font-size: 9; 
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
<option value="SENIOR MORTGAGE" <cfif read_findings.mortgage_judgment_type_3 eq 'SENIOR MORTGAGE'>selected</cfif>>SENIOR MORTGAGE</option>
<option value="JUNIOR MORTGAGE" <cfif read_findings.mortgage_judgment_type_3 eq 'JUNIOR MORTGAGE'>selected</cfif>>JUNIOR MORTGAGE</option>
</select></td>
</tr>

<tr>
<td align="right" valign="top" width="250">Mortgage/Judgment Levy Date (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="mortgage_judgment_levy_date_3" value="#DateFormat(read_findings.mortgage_judgment_levy_date_3, 'mm-dd-yyyy')#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Mortgage/Judgment Lien Amount (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="mortgage_judgment_lien_amount_3" value="#read_findings.mortgage_judgment_lien_amount_3#" style="font-size: 9; 
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
<td align="right" valign="top" width="250">Mortgage/Judgment In Favor Of (3)</td>
<td align="left" valign="top" width="350"><input type="text" name="mortgage_judgment_in_favor_of_3" value="#read_findings.mortgage_judgment_in_favor_of_3#" style="font-size: 9; 
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
</table>
</td></tr>
</cfoutput>



<!--- IRS --->
<cfoutput>
<tr name="irs_table" id="irs_table" style="display:none;">
					<td colspan=2 align=center valign=top bgcolor=e1e1e1>

<table bgcolor=e1e1e1>
<tr>
<td align="right" valign="top" width="250">IRS Foreclosure Notice Type</td>
<td align="left" valign="top" width="350"><select name="irs_foreclosure_type" style="font-size: 9; 
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
<option value="NOTICED IN FORECLOSURE" <cfif read_findings.irs_foreclosure_type eq 'NOTICED IN FORECLOSURE'>selected</cfif>>NOTICED IN FORECLOSURE</option>
<option value="NOT NAMED IN FORECLOSURE" <cfif read_findings.irs_foreclosure_type eq 'NOT NAMED IN FORECLOSURE'>selected</cfif>>NOT NAMED IN FORECLOSURE</option>
</select></td>
</tr>

<tr>
<td align="right" valign="top" width="250">IRS Expiration Date</td>
<td align="left" valign="top" width="350"><input type="text" name="irs_expiration_date" value="#DateFormat(read_findings.irs_expiration_date, 'mm-dd-yyyy')#" style="font-size: 9; 
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
</table>
</td></tr>
</cfoutput>





<!--- LEGAL --->
<cfoutput>
<tr name="legal_table" id="legal_table" style="display:none;">
					<td colspan=2 align=center valign=top bgcolor=e1e1e1>

<table>
<tr bgcolor=e1e1e1>
<td align="right" valign="top" width="250">Legal Description Issue Type</td>
<td align="left" valign="top" width="350"><select name="legal_description_issue_type" style="font-size: 9; 
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
<option value="ACCESS" <cfif read_findings.legal_description_issue_type eq 'ACCESS'>selected</cfif>>ACCESS</option>
<option value="MISSING PARCEL" <cfif read_findings.legal_description_issue_type eq 'MISSING PARCEL'>selected</cfif>>MISSING PARCEL</option>
<option value="ENCROACHMENT" <cfif read_findings.legal_description_issue_type eq 'ENCROACHMENT'>selected</cfif>>ENCROACHMENT</option>
<option value="EASEMENT" <cfif read_findings.legal_description_issue_type eq 'EASEMENT'>selected</cfif>>EASEMENT</option>
<option value="LEGAL DISCREPANCIES" <cfif read_findings.legal_description_issue_type eq 'LEGAL DISCREPANCIES'>selected</cfif>>LEGAL DISCREPANCIES</option>
</select></td>
</tr>
<tr>
<td align="right" valign="top" width="250">Survey Status</td>
<td align="left" valign="top" width="350"><select name="survey_status" style="font-size: 9; 
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
<option value="REQUIRED" <cfif read_findings.survey_status eq 'REQUIRED'>selected</cfif>>REQUIRED</option>
<option value="NOT REQUIRED" <cfif read_findings.survey_status eq 'NOT REQUIRED'>selected</cfif>>NOT REQUIRED</option>
<option value="ORDERED" <cfif read_findings.survey_status eq 'ORDERED'>selected</cfif>>ORDERED</option>
<option value="RECEIVED" <cfif read_findings.survey_status eq 'RECEIVED'>selected</cfif>>RECEIVED</option>
</select></td>
</tr>
</table>
</td></tr>
</cfoutput>


<!--- LEGAL --->
<cfoutput>
<tr name="foreclosure_table" id="foreclosure_table" style="display:none;">
					<td colspan=2 align=center valign=top bgcolor=e1e1e1>

<table bgcolor=e1e1e1>
<tr>
<td align="right" valign="top" width="250">Reason for Delay Type</td>
<td align="left" valign="top" width="350"><select name="reason_for_delay_type" style="font-size: 9; 
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
<option value="DIL NOT RECORDER" <cfif read_findings.reason_for_delay_type eq 'DIL NOT RECORDER'>selected</cfif>>DIL NOT RECORDER</option>
<option value="COUNTY DELAY" <cfif read_findings.reason_for_delay_type eq 'COUNTY DELAY'>selected</cfif>>COUNTY DELAY</option>
<option value="SERVICER ATTORNEY DELAY" <cfif read_findings.reason_for_delay_type eq 'SERVICER ATTORNEY DELAY'>selected</cfif>>SERVICER ATTORNEY DELAY</option>
</select></td>
</tr>
</table>
</td></tr>
</cfoutput>


<!--- FANNIE --->
<cfoutput>
<tr name="fannie_table" id="fannie_table" style="display:none;">
					<td colspan=2 align=center valign=top bgcolor=e1e1e1>

<table bgcolor=e1e1e1>
<tr>
<td align="right" valign="top" width="250">Cause Type</td>
<td align="left" valign="top" width="350"><select name="cause_type" style="font-size: 9; 
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
<option value="RECORDING DELAY" <cfif read_findings.cause_type eq 'RECORDING DELAY'>selected</cfif>>RECORDING DELAY</option>
<option value="EXECUTION DELAY" <cfif read_findings.cause_type eq 'EXECUTION DELAY'>selected</cfif>>EXECUTION DELAY</option>
<option value="REJECTION" <cfif read_findings.cause_type eq 'REJECTION'>selected</cfif>>REJECTION</option>
<option value="WAITING ON FUNDS" <cfif read_findings.cause_type eq 'WAITING ON FUNDS'>selected</cfif>>WAITING ON FUNDS</option>
<option value="MISSING ASSIGNMENT" <cfif read_findings.cause_type eq 'MISSING ASSIGNMENT'>selected</cfif>>MISSING ASSIGNMENT</option>
</select></td>
</tr>
<tr>
<td align="right" valign="top" width="250">Current Owner</td>
<td align="left" valign="top" width="350"><input type="text" name="current_owner"  value="#read_findings.current_owner#" style="font-size: 9; 
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

</table>
</td></tr>
</cfoutput>
<tr>
<td align="right" valign="top" width="250">Comments</td>
<td align="left" valign="top" width="350"><textarea name="comments" rows=10 style="font-size: 9; 
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
									clear: none; width:200px;"><cfoutput>#read_findings.comments#</cfoutput></textarea>
</td>
</tr>
<tr>
<td colspan=2><input type="submit" name="save_all" value="Save All Info">&nbsp;&nbsp;&nbsp;<input type="submit" name="submit_equator" value="Submit Title Findings to Equator"></td>
</tr>
</table>
</form>
</td></tr>
</table>
</td></tr></table>
</BODY>
</HTML>
<cfflush>