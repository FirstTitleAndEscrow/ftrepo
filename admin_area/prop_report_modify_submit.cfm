<!--- <cfif cgi.REMOTE_ADDR eq '98.233.100.254'>
<cfabort>
</cfif>
 --->

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
<CFPARAM NAME="Verifyemail" DEFAULT="">
<CFPARAM NAME="Verifyemail_2" DEFAULT="">
<CFPARAM NAME="Verifyemail_3" DEFAULT="">
<CFPARAM NAME="RptbyEmail" DEFAULT="">
<CFPARAM NAME="do_appraisal" DEFAULT="">
<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="0">
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
<!--- <CFPARAM NAME="appraisal_status" DEFAULT=""> --->
<CFPARAM NAME="reo_number" DEFAULT="">
<CFPARAM NAME="loan_number" DEFAULT="">
<CFPARAM NAME="loantype" DEFAULT="">
<CFPARAM NAME="cost_per_copy" DEFAULT="">
<CFPARAM NAME="total_copies" DEFAULT="">
<CFPARAM NAME="comments_to_appear" DEFAULT="">
<CFPARAM NAME="sale_date" DEFAULT="">
<CFPARAM NAME="due_date" DEFAULT="">
<CFPARAM NAME="duedate" DEFAULT="">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_Prop">
			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#
</CFQUERY>
 <cfparam name="client_id" default="#read_Prop.comp_id#">
<CFSET duedate = #duedate# >

<CFSET order_date_adj = #read_Prop.oda_month# & "/" & #read_Prop.oda_day# & "/" & #read_Prop.oda_year# >

<cfquery  datasource="#request.dsn#">
UPDATE PROPERTY
	SET comp_id = '#client_id#',
	blastname1 = '#blastname1#',
	bfirstname1 = '#bfirstname1#',
	bminame1 = '#bminame1#',
	bssn1 = '#Right(bssn1, 4)#',
	bhphone1 = '#bhphone1#',
	bwphone1 = '#bwphone1#',
	bext1 = '#bext1#',
	blastname2 = '#blastname2#',
	bfirstname2 = '#bfirstname2#',
	bminame2 = '#bminame2#',
	bssn2 = '#Right(bssn2, 4)#',
	bhphone2 = '#bhphone2#',
	bwphone2 = '#bwphone2#',
	bext2 = '#bext2#',
	slastname1 = '#slastname1#',
	sfirstname1 = '#sfirstname1#',
	sminame1 = '#sminame1#',
	sssn1 = '#Right(sssn1, 4)#',
	shphone1 = '#shphone1#',
	swphone1 =  '#swphone1#',
	sext1 =  '#sext1#',
	slastname2 = '#slastname2#',
	sfirstname2 = '#sfirstname2#',
	sminame2 = '#sminame2#',
	sssn2 = '#Right(sssn2, 4)#',
	shphone2 = '#shphone2#',
	swphone2 = '#swphone2#',
	sext2 =  '#sext2#',
	paddress = '#paddress#',
	pcounty = '#pcounty#',
	plegaldesc = '#plegaldesc#',
	a_comment = '#a_comment#',
	verifyemail = '#verifyemail#',
	verifyemail_2 = '#verifyemail_2#',
	verifyemail_3 = '#verifyemail_3#',
	rptbyemail = '#rptbyemail#',
	do_appraisal = '#do_appraisal#',
	appraisal_type = '#appraisal_type#',
	estimate_value = '#NumberFormat(estimate_value, "9999999999.99")#',
	app_credit_card = '#app_credit_card#',
	app_cc_num = '#app_cc_num#',
	app_cc_exp_month = '#app_cc_exp_month#',
	pay_by = '#pay_by#',
	app_cc_exp_year = '#app_cc_exp_year#',
	app_cc_name = '#app_cc_name#',
	app_ck_acct_name = '#app_ck_acct_name#',
	app_ck_addr1 = '#app_ck_addr1#',
	app_ck_addr2 = '#app_ck_addr2#',
	app_ck_city = '#app_ck_city#',
	app_ck_state = '#app_ck_state#',
	app_ck_acct_no = '#app_ck_acct_no#',
	app_ck_bank = '#app_ck_bank#',
	app_ck_route_no = '#app_ck_route_no#',
	payment_type_1 = '#payment_type_1#',
	partial_cod = '#partial_cod#',
	order_date_adjusted = '#order_date_adj#',
	<cfif sale_date neq ''>
	sale_date = '#DateFormat(sale_date, "mm/dd/yyyy")#',
	<cfelse>
	sale_date = NULL,
	</cfif>
	<cfif due_date neq ''>
	due_date = '#DateFormat(due_date, "mm/dd/yyyy")#',
	<cfelse>
	due_date = NULL,
	</cfif>
	duedate = '#duedate#',
	<!--- appraisal_status = '#appraisal_status#', --->
	polender1 = '#polender1#',
	poacctno1 = '#poacctno1#',
	pophone1 = '#pophone1#',
	polender2 = '#polender2#',
	poacctno2 = '#poacctno2#',
	pophone2 = '#pophone2#',
	prop_use_type = '#prop_use_type#',
	condo_pud = '#condo_pud#',
	reo_number = '#reo_number#',
	loan_number = '#loan_number#',
	loantype = '#loanType#',
	cost_per_copy = '#cost_per_copy#',
	total_copies = '#total_copies#',
	comments_to_appear = '#comments_to_appear#'
	WHERE prop_id = #rec_id#

			</cfquery>










<!--- Here we run the new fee calculator function, and any fees it returns will overwrite their respective fees. This is because I couldn't detangle this page enough...so I let this page do it's thing and get whatever fees it gets, then I overwrite with the more accurate fee calculator fees --->
<cftry>
<cfset update_this_prop_id = rec_id>

<cfinclude template="../rick_tests/update_prop_hud_fee_calc.cfm">

      <cfcatch type="Any">
        <cfoutput>
          <cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Update Fees Failure: Admin Update Order: #rec_id#" type="html">
<!--- and the diagnostic message from the ColdFusion server --->
			<p>#cfcatch.message#</p>
			<p>Caught an exception, type = #CFCATCH.TYPE# </p>
			<p>The contents of the tag stack are:</p>
			<cfloop index = i from = 1
					to = #ArrayLen(CFCATCH.TAGCONTEXT)#>
				<cfset sCurrent = #CFCATCH.TAGCONTEXT[i]#>
				<br>#i# #sCurrent["ID"]# <br>
Line Number: #sCurrent["LINE"]#, Column: #sCurrent["COLUMN"]#<br>
					#sCurrent["TEMPLATE"]#
			</cfloop>

            <hr>
            <h1>Other Error:#cfcatch.Type#</h1>
            <ul>
              <li><b>Message:</b>#cfcatch.Message#
              <li><b>Detail:</b>#cfcatch.Detail#
              <li><B>Page:</B>#GetBaseTemplatePath()#
            </ul><br>
Form Variables<br>
			<cfdump var="#form#"><br>
<br>
URL Variables<br>
			<cfdump var="#url#"><br>
<br>
Session Variables<br>
			<cfdump var="#session#"><br>
<br>          </cfmail>
        </cfoutput>
      </cfcatch>
  </cftry>






	<CFIF #do_appraisal_current_value# EQ #do_appraisal#>

		<CFLOCATION URL="https://#cgi.server_name#/admin_area/prop_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#">
	<CFELSE>

		<CFIF #do_appraisal# EQ "NO">
			<!--- ===/ Need to CANCEL the Appraiser by    \=== --->
			<!--- ===/ sending them a cancellation notice \=== --->

			<CFLOCATION URL="https://#cgi.server_name#/admin_area/prop_appraisal_cancel.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#">

		<CFELSE>
			<!--- ===/ Need to ASSIGN the Appraiser by    \=== --->
			<!--- ===/ sending them an ASSIGNMENT notice  \=== --->

			<CFLOCATION URL="https://#cgi.server_name#/admin_area/prop_appraisal_assign.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#">

		</CFIF>

	</CFIF>
