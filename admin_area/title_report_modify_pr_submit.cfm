

<cfif form.change_loan_officer eq 1>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_loan_officer">
			SELECT *
			FROM Loan_Officers
			WHERE ID = #loan_off#
</CFQUERY>
<cfif get_loan_officer.recordcount>
<cfset oname = get_loan_officer.oname>
<cfset ophone = get_loan_officer.lo_phone>
<cfset ofax = get_loan_officer.lo_fax>
<cfset oext = get_loan_officer.lo_ext>
<cfset o_email = get_loan_officer.lo_email>
</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="update_loan_officer">
			UPDATE Policy_Recovery
			set
			loan_off_id = '#loan_off#',
			oname = '#get_loan_officer.lo_fname# #get_loan_officer.lo_lname#',
			ophone = '#get_loan_officer.lo_phone#',
			ofax = '#get_loan_officer.lo_fax#',
			oext = '#get_loan_officer.lo_ext#',
			o_email = '#get_loan_officer.lo_email#'
			WHERE pr_ID = #rec_id#
</CFQUERY>
<!--- <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_report_modify_pr.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
 ---></cfif>


<cfif form.change_loan_processor eq 1>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_loan_processor">
			SELECT *
			FROM Users
			WHERE ID = #loan_procs#
</CFQUERY>
<cfif get_loan_processor.recordcount>
	
<cfset pname = get_loan_processor.pname>
<cfset pphone = get_loan_processor.lp_phone>
<cfset pfax = get_loan_processor.lp_fax>
<cfset pext = get_loan_processor.lp_ext>
<cfset p_email = get_loan_processor.lp_email>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="update_loan_proc">
			UPDATE Policy_Recovery
			set
			user_id = '#loan_procs#',
			pname = '#get_loan_processor.lp_fname# #get_loan_processor.lp_lname#',
			pphone = '#get_loan_processor.lp_phone#',
			pfax = '#get_loan_processor.lp_fax#',
			pext = '#get_loan_processor.lp_ext#',
			p_email = '#get_loan_processor.lp_email#'
			WHERE pr_ID = #rec_id#
</CFQUERY>
<!--- <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_report_modify_pr.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
 ---></cfif>

<!--- Changes made by Synechron as per ticket# 737 --->
<cfif isdefined("form.change_internal_processor") AND #form.change_internal_processor# eq 1 >
	<CFQUERY DATASOURCE="#request.dsn#" NAME="get_internal_processor">
				SELECT id, fname, lname, email,phone,fax,email
				FROM First_Admin
				WHERE ID = #Internal_procs#
	</CFQUERY>
	<cfif get_internal_processor.recordcount>
		<cfset fname = get_internal_processor.fname>
		<cfset lname = get_internal_processor.lname>
		<cfset phone = get_internal_processor.phone>
		<cfset fax =   get_internal_processor.fax>
		<cfset ext =   "">
		<cfset email = get_internal_processor.email>
		<!--- Edit (Start) Added by Synechron Development for ticket# 737 added Internal_Processor=#Internal_Processor# code in update statement --->
		<cfset ip_id = get_internal_processor.id>
		<!--- Edit (End) Added by a Development for ticket# 737 --->
		<CFQUERY DATASOURCE="#request.dsn#" NAME="update_internal_proc">
					UPDATE Policy_Recovery
					set
					ip_id=#ip_id#,
					ipname = '#fname# #lname#',
					ipphone = '#phone#',
					ipfax = '#fax#',
					ipext = '#ext#',
					ip_email = '#email#',
					appraisal_status = 'In Process'
					WHERE pr_id = #rec_id#
		</CFQUERY>
	</cfif>
	</cfif>

<!--- ----------------------------------------------- --->


<!--- <cfif cgi.REMOTE_ADDR eq  '98.233.55.8'>
<cfdump var="#get_loan_processor#">
<cfabort>
</cfif>
 --->

<!--- 	<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_report_modify_pr.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
 --->





<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title1">
			SELECT *
			FROM Policy_Recovery
			WHERE pr_ID = #rec_ID#
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_comp">
			SELECT *
			FROM companies
			WHERE ID = #read_title1.comp_id#
</CFQUERY>






	<cfquery  DATASOURCE="#request.dsn#">
			UPDATE Policy_Recovery
			SET 
comp_id = '#form.client_id#',
BLASTNAME1 = '#form.BLASTNAME1#',
BFIRSTNAME1 = '#form.BFIRSTNAME1#',
BMINAME1 = '#form.BMINAME1#',
BSSN1 = '#form.BSSN1#',
BHPHONE1 = '#form.BHPHONE1#',
BWPHONE1 = '#form.BWPHONE1#',
BEXT1 = '#form.BEXT1#',
BLASTNAME2 = '#form.BLASTNAME2#',
BFIRSTNAME2 = '#form.BFIRSTNAME2#',
BMINAME2 = '#form.BMINAME2#',
BSSN2 = '#form.BSSN2#',
BHPHONE2 = '#form.BHPHONE2#',
BWPHONE2 = '#form.BWPHONE2#',
BEXT2 = '#form.BEXT2#',
BLASTNAME3 = '#form.BLASTNAME3#',
BFIRSTNAME3 = '#form.BFIRSTNAME3#',
BMINAME3 = '#form.BMINAME3#',
BSSN3 = '#form.BSSN3#',
BHPHONE3 = '#form.BHPHONE3#',
BWPHONE3 = '#form.BWPHONE3#',
BEXT3 = '#form.BEXT3#',
BLASTNAME4 = '#form.BLASTNAME4#',
BFIRSTNAME4 = '#form.BFIRSTNAME4#',
BMINAME4 = '#form.BMINAME4#',
BSSN4 = '#form.BSSN4#',
BHPHONE4 = '#form.BHPHONE4#',
BWPHONE4 = '#form.BWPHONE4#',
BEXT4 = '#form.BEXT4#',
PADDRESS = '#form.PADDRESS#',
PCOUNTY = '#form.PCOUNTY#',
LOAN_NUMBER = '#form.LOAN_NUMBER#',
ORIGINAL_LENDER_NAME = '#form.ORIGINAL_LENDER_NAME#',
ORIGINAL_LOAN_DATE = '#form.ORIGINAL_LOAN_DATE#',
ORIGINAL_LOAN_AMOUNT = '#form.ORIGINAL_LOAN_AMOUNT#',
SLA_OPTION = '#form.SLA_OPTION#',
ORDER_TYPE = '#form.ORDER_TYPE#',
DOCUMENT_TYPE = '#form.DOCUMENT_TYPE#',
UNDERWRITER_NAME = '#form.UNDERWRITER_NAME#',
UNDERWRITER_ADDR = '#form.UNDERWRITER_ADDR#',
UNDERWRITER_ADDR2 = '#form.UNDERWRITER_ADDR2#',
UNDERWRITER_CITY = '#form.UNDERWRITER_CITY#',
UNDERWRITER_STATE = '#form.UNDERWRITER_STATE#',
UNDERWRITER_ZIP = '#form.UNDERWRITER_ZIP#',
UNDERWRITER_PHONE = '#form.UNDERWRITER_PHONE#',
UNDERWRITER_FAX = '#form.UNDERWRITER_FAX#',
UNDERWRITER_EMAIL = '#form.UNDERWRITER_EMAIL#',
UNDERWRITER_POLICY_NUM = '#form.UNDERWRITER_POLICY_NUM#',
TITLE_POLICY_NUM = '#form.TITLE_POLICY_NUM#',
TITLE_CO_NAME = '#form.TITLE_CO_NAME#',
TITLE_CO_ADDR = '#form.TITLE_CO_ADDR#',
TITLE_CO_ADDR2 = '#form.TITLE_CO_ADDR2#',
TITLE_CO_CITY = '#form.TITLE_CO_CITY#',
TITLE_CO_STATE = '#form.TITLE_CO_STATE#',
TITLE_CO_ZIP = '#form.TITLE_CO_ZIP#',
TITLE_CO_PHONE = '#form.TITLE_CO_PHONE#',
TITLE_CO_FAX = '#form.TITLE_CO_FAX#',
TITLE_CO_EMAIL = '#form.TITLE_CO_EMAIL#',
TITLE_CO_ESCROW_NUM = '#form.TITLE_CO_ESCROW_NUM#',
A_COMMENT = '#form.A_COMMENT#',
VERIFYEMAIL = '#form.VERIFYEMAIL#',
VERIFYEMAIL_2 = '#form.VERIFYEMAIL1#',
VERIFYEMAIL_3 = '#form.VERIFYEMAIL2#'
WHERE pr_id = #rec_id#
			</cfquery>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_report_nav_pr.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#">



