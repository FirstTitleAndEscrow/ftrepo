
<CFPARAM NAME="blastname1" DEFAULT="">
<CFPARAM NAME="bfirstname1" DEFAULT="">
<CFPARAM NAME="bminame1" DEFAULT="">
<CFPARAM NAME="bssn1" DEFAULT="">
<CFPARAM NAME="bhphone1" DEFAULT="">
<CFPARAM NAME="bwphone1" DEFAULT="">
<CFPARAM NAME="bext1" DEFAULT="">
<CFPARAM NAME="blastname2" DEFAULT="">
<CFPARAM NAME="bfirstname2" DEFAULT="">
<CFPARAM NAME="bminame2" DEFAULT="">
<CFPARAM NAME="bssn2" DEFAULT="">
<CFPARAM NAME="bhphone2" DEFAULT="">
<CFPARAM NAME="bwphone2" DEFAULT="">
<CFPARAM NAME="bext2" DEFAULT="">
<CFPARAM NAME="slastname1" DEFAULT="">
<CFPARAM NAME="sfirstname1" DEFAULT="">
<CFPARAM NAME="sminame1" DEFAULT="">
<CFPARAM NAME="sssn1" DEFAULT="">
<CFPARAM NAME="shphone1" DEFAULT="">
<CFPARAM NAME="swphone1" DEFAULT="">
<CFPARAM NAME="sext1" DEFAULT="">
<CFPARAM NAME="slastname2" DEFAULT="">
<CFPARAM NAME="sfirstname2" DEFAULT="">
<CFPARAM NAME="sminame2" DEFAULT="">
<CFPARAM NAME="sssn2" DEFAULT="">
<CFPARAM NAME="shphone2" DEFAULT="">
<CFPARAM NAME="swphone2" DEFAULT="">
<CFPARAM NAME="sext2" DEFAULT="">
<CFPARAM NAME="paddress" DEFAULT="">
<CFPARAM NAME="pcity" DEFAULT="">
<CFPARAM NAME="pstate" DEFAULT="">
<CFPARAM NAME="pzip" DEFAULT="">
<CFPARAM NAME="pcounty" DEFAULT="">
<CFPARAM NAME="plegaldesc" DEFAULT="">
<CFPARAM NAME="prop_use_type" DEFAULT="">
<CFPARAM NAME="condo_pud" DEFAULT="">
<CFPARAM NAME="a_comment" DEFAULT="">
<CFPARAM NAME="polender1" DEFAULT="">
<CFPARAM NAME="poacctno1" DEFAULT="">
<CFPARAM NAME="pophone1" DEFAULT="">
<CFPARAM NAME="polender2" DEFAULT="">
<CFPARAM NAME="poacctno2" DEFAULT="">
<CFPARAM NAME="pophone2" DEFAULT="">
<CFPARAM NAME="SearchType" DEFAULT="">
<CFPARAM NAME="Deedtransfer" DEFAULT="">
<CFPARAM NAME="Insured" DEFAULT="">
<CFPARAM NAME="loanamt_float" DEFAULT="0">
<CFPARAM NAME="Purchase_Price" DEFAULT="0">
<CFPARAM NAME="loan_type_111" DEFAULT="">
<CFPARAM NAME="loan_program_333" DEFAULT="">
<CFPARAM NAME="Verifyemail" DEFAULT="">
<CFPARAM NAME="Verifyemail_2" DEFAULT="">
<CFPARAM NAME="Verifyemail_3" DEFAULT="">
<CFPARAM NAME="RptbyEmail" DEFAULT="">
<CFPARAM NAME="do_appraisal" DEFAULT="">
<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="">
<CFPARAM NAME="payment_type_1" DEFAULT="">
<CFPARAM NAME="partial_cod" DEFAULT="0">
<CFPARAM NAME="pay_by" DEFAULT="">
<CFPARAM NAME="app_credit_card" DEFAULT="">
<CFPARAM NAME="app_cc_num" DEFAULT="">
<CFPARAM NAME="app_cc_exp_month" DEFAULT="">
<CFPARAM NAME="app_cc_exp_year" DEFAULT="">
<CFPARAM NAME="app_cc_name" DEFAULT="">
<CFPARAM NAME="app_ck_acct_name" DEFAULT="">
<CFPARAM NAME="app_ck_addr1" DEFAULT="">
<CFPARAM NAME="app_ck_addr2" DEFAULT="">
<CFPARAM NAME="app_ck_city" DEFAULT="">
<CFPARAM NAME="app_ck_state" DEFAULT="">
<CFPARAM NAME="app_ck_acct_no" DEFAULT="">
<CFPARAM NAME="app_ck_bank" DEFAULT="">
<CFPARAM NAME="app_ck_route_no" DEFAULT="">
<CFPARAM NAME="appraisal_status" DEFAULT="0">
<!--------------------------------------------->

<CFSET duedate = #oda_month# & "/" & #oda_day# & "/" & #oda_year# >

<CFSET order_date_adj = #oda_month# & "/" & #oda_day# & "/" & #oda_year# >

		<cfquery  datasource="#request.dsn#">
			UPDATE TITLE
			SET blastname1 = '#blastname1#',
			bfirstname1 = '#bfirstname1#',
			bminame1 = '#bminame1#',
			bssn1 = '#bssn1#',
			bhphone1 = '#bhphone1#',
			bwphone1 = '#bwphone1#',
			bext1 = '#bext1#',
			blastname2 = '#blastname2#',
			bfirstname2 = '#bfirstname2#',
			bminame2 = '#bminame2#',
			bssn2 = '#bssn2#',
			bhphone2 = '#bhphone2#',
			bwphone2 = '#bwphone2#',
			bext2 = '#bext2#',
			slastname1 =  '#slastname1#',
			sfirstname1 = '#sfirstname1#',
			sminame1 =  '#sminame1#',
			sssn1 =  '#sssn1#',
			shphone1 = '#shphone1#',
			swphone1 = '#swphone1#',
			sext1 = '#sext1#',
			slastname2 = '#slastname2#',
			sfirstname2 = '#sfirstname2#',
			sminame2 = '#sminame2#',
			sssn2 = '#sssn2#',
			shphone2 = '#shphone2#',
			swphone2 = '#swphone2#',
			sext2 = '#sext2#',
			paddress = '#paddress#',
		  <!---   p pcity = '#pcity#',
		    pstate = '#pstate#',
			pzip = '#pzip#', p
			pcounty = '#pcounty#', --->
			plegaldesc = '#plegaldesc#',
			a_comment = '#a_comment#',
			verifyemail = '#verifyemail#',
			verifyemail_2 = '#verifyemail_2#',
			verifyemail_3 = '#verifyemail_3#',
			rptbyemail = '#rptbyemail#',
			duedate = '#duedate#',
			do_appraisal = '#do_appraisal#',
			appraisal_type = '#appraisal_type#',
			pay_by = '#pay_by#',
			estimate_value = '#NumberFormat(estimate_value, "9999999999.99")#',
			app_credit_card = '#app_credit_card#',
			app_cc_num = '#app_cc_num#',
			app_cc_exp_month = #app_cc_exp_month#,
			app_cc_exp_year = #app_cc_exp_year#,
			app_cc_name = '#app_cc_name#',
			app_ck_acct_name = '#app_ck_acct_name#',
			app_ck_addr1 = '#app_ck_addr1#',
			app_ck_addr2 = '#app_ck_addr2#',
			app_ck_city = '#app_ck_city#',
			app_ck_state = '#app_ck_state#',
			app_ck_acct_no = '#app_ck_acct_no#',
			app_ck_bank =  '#app_ck_bank#',
			app_ck_route_no = '#app_ck_route_no#',
			payment_type_1 = '#payment_type_1#',
			partial_cod = '#partial_cod#',
			order_date_adjusted = '#order_date_adj#',
			oda_day =  #oda_day#,
			oda_month = #oda_month#,
			oda_year = #oda_year#,
			appraisal_status =  '#appraisal_status#',
			polender1 = '#polender1#',
			poacctno1 = '#poacctno1#',
			pophone1 = '#pophone1#',
			polender2 = '#polender2#',
			poacctno2 = '#poacctno2#',
			pophone2 = '#pophone2#',
			SearchType =  '#SearchType#',
			Deedtransfer = '#Deedtransfer#',
			Insured = '#Insured#',
			loanamt_float = '#loanamt_float#',
			Purchase_Price = '#Purchase_Price#',
			loan_type_111 = '#loan_type_111#',
			loan_program_333 =  '#loan_program_333#',
			prop_use_type = '#prop_use_type#',
			condo_pud = '#condo_pud#'
			WHERE title_id = #rec_id#
			</cfquery>


<!--- ===/ Here is where we check to see    \=== --->
<!--- ===/ if they changed the state of the \=== --->
<!--- ===/ do_appraisal field               \=== --->


	<CFIF #do_appraisal_current_value# EQ #do_appraisal#>

		<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#">
	<CFELSE>

		<CFIF #do_appraisal# EQ "NO">
			<!--- ===/ Need to CANCEL the Appraiser by    \=== --->
			<!--- ===/ sending them a cancellation notice \=== --->

			<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_appraisal_cancel.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#">

		<CFELSE>
			<!--- ===/ Need to ASSIGN the Appraiser by    \=== --->
			<!--- ===/ sending them an ASSIGNMENT notice  \=== --->

			<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_appraisal_assign.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#">

		</CFIF>

	</CFIF>



