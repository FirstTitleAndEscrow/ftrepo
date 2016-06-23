











<cfset dateCalendarStart = "01/01/2010">
<cfset dateCalendarEnd = "12/31/2014">
<cfparam name="uid" default="">
<cfparam name="lo_id" default="">
<cfparam name="rec_id" default="0">


<cfparam name="url.viewprint" type="numeric" default=0>
<cfparam name="url.sendemail" type="numeric" default=0>
<cfparam name="url.sendtoaddr" default="">
<cfparam name="form.spouses_removed" default="0">
<cfparam name="form.spouses_added" default="0">
<cfparam name="form.non_spouses_removed" default="0">
<cfparam name="form.non_spouses_added" default="0">

<cfif rec_id eq 0>
<cfparam name="form.comp_id" default="0">
<CFQUERY datasource="#request.dsn#" NAME="get_comp_info">
  SELECT * from companies where ID = '#form.comp_id#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states_HUD2010
		WHERE company_id = #form.comp_id# AND a_states = '#form.property_state#'
		order by state_id desc

</CFQUERY>
<cfif #get_billing_states.recordcount# GT "0">
<CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values_HUD2010
		WHERE company_id = #form.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  company_agency_assoc_HUD2010
		WHERE billing_id = '#get_billing_states.billing_id#'
</CFQUERY>
<cfelse>
<cfset #read_agency.TITLE_FT_AGENCY_NAME# = "Agency N/A">
</cfif>




<cfparam name="form.purchase_price" type="numeric" default=1000000000>
<cfparam name="form.transaction_type" default="Purchase">
<cfparam name="form.base_loan_amount" type="numeric" default=50000>
<cfparam name="form.reissue_rates" default=0>
<cfparam name="form.jlp_policy" default="0">
<cfparam name="form.property_use_type" default=1>
<cfparam name="form.previous_loan_month" default=1>
<cfparam name="form.same_lender" default=0>
<cfparam name="form.previous_loan_year" default=1996>
<cfparam name="form.property_city" default="">
<cfparam name="form.property_state" default="">
<cfparam name="form.property_county" default="">
<cfif form.comp_id eq 2878 or get_comp_info.master_co_id eq 2878>
<cfparam name="form.lender" default="North American Savings Bank">
<cfparam name="form.lender_address1" default="10950 El Monte Street, Suite 210">
<cfparam name="form.lender_address2" default="Overland Park, KS 66211">
<cfelse>
<cfparam name="form.lender" default="">
<cfparam name="form.lender_address1" default="">
<cfparam name="form.lender_address2" default="">
</cfif>
<cfparam name="form.applicant1" default="">
<cfparam name="form.applicant2" default="">
<cfparam name="form.property_address1" default="">
<cfparam name="form.property_address2" default="">
<cfparam name="form.total_loan_amount" default="">
<cfparam name="form.interest_rate" default="">
<cfparam name="form.type_of_loan" default="">
<cfparam name="form.loan_number" default="">
<cfparam name="form.preparation_date" default="">
<cfparam name="form.transfer_tax_paid_by" default="default">
<cfparam name="form.first_time_buyer" default="0">
<cfparam name="form.opt_alta_4" default="#form.opt_alta_4#">
<cfparam name="form.opt_alta_4_1" default="#form.opt_alta_4_1#">
<cfparam name="form.opt_alta_5" default="#form.opt_alta_5#">
<cfparam name="form.opt_alta_5_1" default="#form.opt_alta_5_1#">
<cfparam name="form.opt_alta_6" default="#form.opt_alta_6#">
<cfparam name="form.opt_alta_6_1" default="#form.opt_alta_6_1#">
<cfparam name="form.opt_alta_6_2" default="#form.opt_alta_6_2#">
<cfparam name="form.opt_alta_7" default="#form.opt_alta_7#">
<cfparam name="form.opt_alta_8_1" default="#form.opt_alta_8_1#">
<cfparam name="form.opt_alta_9" default="#form.opt_alta_9#">
<cfparam name="form.opt_tx_1" default="#form.opt_tx_1#">
<cfparam name="form.opt_tx_2" default="#form.opt_tx_2#">
<cfparam name="form.opt_tx_3" default="#form.opt_tx_3#">
<cfparam name="form.opt_tx_4" default="#form.opt_tx_4#">
<cfparam name="form.opt_tx_5" default="#form.opt_tx_5#">
<cfparam name="form.opt_tx_6" default="#form.opt_tx_6#">
<cfparam name="form.opt_tx_7" default="#form.opt_tx_7#">
<cfparam name="form.opt_tx_8" default="#form.opt_tx_8#">
<cfparam name="form.opt_tx_9" default="#form.opt_tx_9#">
<cfparam name="form.opt_tx_10" default="#form.opt_tx_10#">
<cfparam name="form.opt_tx_11" default="#form.opt_tx_11#">
<cfparam name="form.opt_tx_12" default="#form.opt_tx_12#">
<cfparam name="form.opt_tx_13" default="#form.opt_tx_13#">
<cfparam name="form.opt_tx_14" default="#form.opt_tx_14#">

<cfparam name="form.opt_ut_4" default="#form.opt_ut_4#">
<cfparam name="form.opt_ut_41" default="#form.opt_ut_41#">
<cfparam name="form.opt_ut_5" default="#form.opt_ut_5#">
<cfparam name="form.opt_ut_51" default="#form.opt_ut_51#">
<cfparam name="form.opt_ut_6" default="#form.opt_ut_6#">
<cfparam name="form.opt_ut_61" default="#form.opt_ut_61#">
<cfparam name="form.opt_ut_62" default="#form.opt_ut_62#">
<cfparam name="form.opt_ut_81" default="#form.opt_ut_81#">
<cfparam name="form.opt_ut_9" default="#form.opt_ut_9#">

<cfparam name="form.opt_sd_comp" default="#form.opt_sd_comp#">
<cfparam name="form.opt_sd_balloon" default="#form.opt_sd_balloon#">
<cfparam name="form.opt_sd_credit" default="#form.opt_sd_credit#">
<cfparam name="form.opt_sd_7" default="#form.opt_sd_7#">
<cfparam name="form.opt_sd_6" default="#form.opt_sd_6#">
<cfparam name="form.opt_sd_4" default="#form.opt_sd_4#">
<cfparam name="form.opt_sd_5" default="#form.opt_sd_5#">
<cfparam name="form.opt_sd_9" default="#form.opt_sd_9#">
<cfparam name="form.opt_sd_8" default="#form.opt_sd_8#">


<cfparam name="form.construction_draws" default="">
<cfparam name="form.perm_original_loan_amount" default="">
<cfparam name="form.closing_type" default="">
<cfparam name="form.borrower_owns" default="">


<!---
<cfparam name="form.construction_draws" default="#form.construction_draws#">
<cfparam name="form.perm_original_loan_amount" default="#form.perm_original_loan_amount#">
<cfparam name="form.closing_type" default="#form.closing_type#">
<cfparam name="form.borrower_owns" default="#form.borrower_owns#">
--->
 
 
<cfparam name="form.transfer_tax_paid_by" default="">
<cfparam name="form.sender_name" default="">
<cfparam name="form.sender_email" default="">
<cfparam name="form.agent_name" default="">
<cfparam name="form.agent_email" default="">
<cfparam name="form.send_quote" default="0">
<cfparam name="form.underwriter_choice" default="16">


<cfparam name="form.P1_LENDERESCROW" default="">
<cfparam name="form.P1_ORIGINATOR" default="">
<cfparam name="form.P1_ORIGINATORADDY" default="">
<cfparam name="form.P1_ORIGINATORPHONE" default="">
<cfparam name="form.P1_ORIGINATOREMAIL" default="">
<cfparam name="form.P1_BORROWER" default="">
<cfparam name="form.P1_PROPERTYSTREET" default="">
<cfparam name="form.P1_PROPERTYSTREET2" default="">
<cfparam name="form.P1_PROPERTYCOUNTY" default="">
<cfparam name="form.P1_PROPERTYCITY" default="">
<cfparam name="form.P1_PROPERTYSTATE" default="">
<cfparam name="form.P1_PROPERTYZIP" default="">
<cfparam name="form.P1_GFEDATE" default="#DateFormat(Now(), 'm/d/yyyy')#">
<cfparam name="form.P1_INTERESTAVAILABLEDATE" default="">
<cfparam name="form.P1_ESTIMATEAVAILABLEDATE" default="">
<cfparam name="form.P1_AFTERLOCKMINDAYS" default="">
<cfparam name="form.P1_INTERESTLOCKMINDAYS" default="">
<cfparam name="form.P1_LOANAMOUNT" default="">
<cfparam name="form.P1_LOANTERM" default="">
<cfparam name="form.P1_INTERESTRATE" default="">
<cfparam name="form.P1_OWEDMONTHLY" default="">
<cfparam name="form.P1_INTERESTCANRISE" default="">
<cfparam name="form.P1_INTERESTCANRISE_MAX" default="">
<cfparam name="form.P1_INTERESTCANRISE_FIRSTDATE" default="">
<cfparam name="form.P1_BALANCECANRISE" default="">
<cfparam name="form.P1_BALANCECANRISE_MAX" default="">
<cfparam name="form.P1_MONTHLYCANRISE" default="">
<cfparam name="form.P1_MONTHLYCANRISE_FIRSTDATE" default="">
<cfparam name="form.P1_MONTHLYCANRISE_FIRSTMAX" default="">
<cfparam name="form.P1_MONTHLYCANRISE_MAX" default="">
<cfparam name="form.P1_PREPAYMENTPENALTY" default="">
<cfparam name="form.P1_PREPAYMENTPENALTY_MAX" default="">
<cfparam name="form.P1_BALLOONPAYMENT" default="">
<cfparam name="form.P1_BALLOONPAYMENT_AMOUNT" default="">
<cfparam name="form.P1_BALLOONPAYMENT_YEARSUNTIL" default="">
<cfparam name="form.P1_ESCROWREQUIRED" default="">
<cfparam name="form.P2_01_ORIGINATIONCHARGE" default="">
<cfparam name="form.P2_02_POINTSINCRATE" default="">
<cfparam name="form.P2_02_POINTSRECAMOUNT" default="">
<cfparam name="form.P2_02_POINTSRECRATE" default="">
<cfparam name="form.P2_02_POINTS" default="">
<cfparam name="form.P2_02_POINTSPAYAMOUNT" default="">
<cfparam name="form.P2_02_POINTSPAYRATE" default="">
<cfparam name="form.P2_02_POINTSAMOUNT" default="">
<cfparam name="form.P2_03_USERSERVICE1_DESC" default="">
<cfparam name="form.P2_03_USERSERVICE1_AMOUNT" default="">
<cfparam name="form.P2_03_USERSERVICE2_DESC" default="">
<cfparam name="form.P2_03_USERSERVICE2_AMOUNT" default="">
<cfparam name="form.P2_03_USERSERVICE3_DESC" default="">
<cfparam name="form.P2_03_USERSERVICE3_AMOUNT" default="">
<cfparam name="form.P2_03_USERSERVICE4_DESC" default="">
<cfparam name="form.P2_03_USERSERVICE4_AMOUNT" default="">
<cfparam name="form.P2_03_USERSERVICE5_DESC" default="">
<cfparam name="form.P2_03_USERSERVICE5_AMOUNT" default="">
<cfparam name="form.P2_03_TOTAL" default="">
<cfparam name="form.P2_04_TITLESERVICES" default="">
<cfparam name="form.P2_05_OWNERSTITLEINS" default="">
<cfparam name="form.P2_06_USERSERVICE1_DESC" default="">
<cfparam name="form.P2_06_USERSERVICE1_AMOUNT" default="">
<cfparam name="form.P2_06_USERSERVICE2_DESC" default="">
<cfparam name="form.P2_06_USERSERVICE2_AMOUNT" default="">
<cfparam name="form.P2_06_USERSERVICE3_DESC" default="">
<cfparam name="form.P2_06_USERSERVICE3_AMOUNT" default="">
<cfparam name="form.P2_06_USERSERVICE4_DESC" default="">
<cfparam name="form.P2_06_USERSERVICE4_AMOUNT" default="">
<cfparam name="form.P2_06_USERSERVICE5_DESC" default="">
<cfparam name="form.P2_06_USERSERVICE5_AMOUNT" default="">
<cfparam name="form.P2_06_USERSERVICE6_DESC" default="">
<cfparam name="form.P2_06_USERSERVICE6_AMOUNT" default="">
<cfparam name="form.P2_06_USERSERVICE7_DESC" default="">
<cfparam name="form.P2_06_USERSERVICE7_AMOUNT" default="">
<cfparam name="form.P2_06_TOTAL" default="">
<cfparam name="form.P2_07_GOVTRECCHARGE" default="">
<cfparam name="form.P2_08_TRANSFERTAX" default="">
<cfparam name="form.P2_09_INCLUDES" default="">
<cfparam name="form.P2_09_ESCROWDEPOSIT" default="">
<cfparam name="form.P2_10_INTERESTPERDAY" default="">
<cfparam name="form.P2_10_INTERESTDAYS" default="">
<cfparam name="form.P2_10_SETTLEMENTDATE" default="">
<cfparam name="form.P2_10_DAILYINTERESTCHARGES" default="">
<cfparam name="form.P2_11_USERSERVICE1_DESC" default="">
<cfparam name="form.P2_11_USERSERVICE1_AMOUNT" default="">
<cfparam name="form.P2_11_USERSERVICE2_DESC" default="">
<cfparam name="form.P2_11_USERSERVICE2_AMOUNT" default="">
<cfparam name="form.P2_11_TOTAL" default="">
<cfparam name="form.P2_ADJUSTED_ORIGINATION_CHARGES" default="">
<cfparam name="form.P1_ADJUSTED_ORIGINATION_CHARGES" default="">
<cfparam name="form.P2_B_TOTAL" default="">
<cfparam name="form.P2_AB_TOTAL" default="">
<cfparam name="form.P1_B_TOTAL" default="">
<cfparam name="form.P1_AB_TOTAL" default="">
<cfparam name="form.P3_AB_TOTAL" default="">
<cfparam name="form.P3_AB_TOTAL_2" default="">
<cfparam name="form.P3_TRADEOFF_LOANAMOUNT" default="">
<cfparam name="form.P3_TRADEOFF_LOANAMOUNT2" default="">
<cfparam name="form.P3_TRADEOFF_LOANAMOUNT3" default="">
<cfparam name="form.P3_TRADEOFF_INITIALINTEREST" default="">
<cfparam name="form.P3_TRADEOFF_INITIALINTEREST2" default="">
<cfparam name="form.P3_TRADEOFF_INITIALINTEREST3" default="">
<cfparam name="form.P3_TRADEOFF_MONTHLYAMOUNT" default="">
<cfparam name="form.P3_TRADEOFF_MONTHLYAMOUNT2" default="">
<cfparam name="form.P3_TRADEOFF_MONTHLYAMOUNT3" default="">
<cfparam name="form.P3_TRADEOFF_CHANGEMONTHLY2" default="">
<cfparam name="form.P3_TRADEOFF_CHANGEMONTHLY3" default="">
<cfparam name="form.P3_TRADEOFF_CHANGESETTLEMENT2" default="">
<cfparam name="form.P3_TRADEOFF_CHANGESETTLEMENT3" default="">
<cfparam name="form.P3_LOAN_ORIG_NAME" default="">
<cfparam name="form.P3_INITIAL_LOAN_AMOUNT" default="">
<cfparam name="form.P3_LOAN_TERM" default="">
<cfparam name="form.P3_INITIAL_INTEREST" default="">
<cfparam name="form.P3_INITIAL_MONTHLY" default="">
<cfparam name="form.P3_RATE_LOCK" default="">
<cfparam name="form.P3_RATE_RISE" default="">
<cfparam name="form.P3_LOAN_BALANCE_RISE" default="">
<cfparam name="form.P3_MONTHLY_RISE" default="">
<cfparam name="form.P3_PREPAY_PENALTY" default="">
<cfparam name="form.P3_BALLOON_PAYMENT" default="">
<cfif ListLen(form.asset_manager, ",") gt 1>
<cfset form.asset_manager = ListGetAt(form.asset_manager, 1, ",")>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_zip">
  SELECT zip FROM Zip_info WHERE state = '#form.property_state#' and city = '#form.property_city#' and county = '#form.property_county#'
</CFQUERY>


<cfset city_state_zip = form.property_city & " " & form.property_state & ", " & get_zip.zip>

<cfinvoke	component = "cfc.fees2010"	method = "getFees"	returnVariable = "get_fee_query" company_id="#comp_id#" transaction_type="#form.transaction_type#" property_state="#form.property_state#" property_county="#form.property_county#" property_city="#form.property_city#" loan_amount="#form.base_loan_amount#" purchase_price="#form.purchase_price#" previous_loan_amount="#ReplaceNocase(form.previous_loan_amount, '$', '', 'ALL')#" previous_loan_year="#form.previous_loan_year#" previous_loan_month="#form.previous_loan_month#" previous_purch_amount="#ReplaceNocase(form.previous_purch_amount, '$', '', 'ALL')#" previous_purch_year="#form.previous_purch_year#" previous_purch_month="#form.previous_purch_month#" property_use_type="#form.property_use_type#" return_data="#form.return_data#" enhanced_coverage="#form.enhanced_coverage#" same_lender="#form.same_lender#" reissue_rates="#form.reissue_rates#" jlp_policy="#form.jlp_policy#"  seller_paid_lender_policy="#form.seller_paid_lender_policy#" seller_paid_owner_policy="#form.seller_paid_owner_policy#" asset_manager="#form.asset_manager#" opt_alta_4="#form.opt_alta_4#" opt_alta_4_1="#form.opt_alta_4_1#" opt_alta_5="#form.opt_alta_5#" opt_alta_5_1="#form.opt_alta_5_1#" opt_alta_6="#form.opt_alta_6#" opt_alta_6_1="#form.opt_alta_6_1#" opt_alta_6_2="#form.opt_alta_6_2#" opt_alta_7="#form.opt_alta_7#" opt_alta_8_1="#form.opt_alta_8_1#" opt_alta_9="#form.opt_alta_9#" opt_tx_1="#form.opt_tx_1#" opt_tx_2="#form.opt_tx_2#" opt_tx_3="#form.opt_tx_3#" opt_tx_4="#form.opt_tx_4#" opt_tx_5="#form.opt_tx_5#" opt_tx_6="#form.opt_tx_6#" opt_tx_7="#form.opt_tx_7#" opt_tx_8="#form.opt_tx_8#" opt_tx_9="#form.opt_tx_9#" opt_tx_10="#form.opt_tx_10#" opt_tx_11="#form.opt_tx_11#" opt_tx_12="#form.opt_tx_12#" opt_tx_13="#form.opt_tx_13#" opt_tx_14="#form.opt_tx_14#" opt_ut_4 = "#form.opt_ut_4#" opt_ut_41 = "#form.opt_ut_41#" opt_ut_5 = "#form.opt_ut_5#" opt_ut_51 = "#form.opt_ut_51#" opt_ut_6 = "#form.opt_ut_6#" opt_ut_61 = "#form.opt_ut_61#" opt_ut_62 = "#form.opt_ut_62#" opt_ut_81 = "#form.opt_ut_81#" opt_ut_9 = "#form.opt_ut_9#" opt_sd_comp = "#form.opt_sd_comp#" opt_sd_balloon = "#form.opt_sd_balloon#" opt_sd_credit = "#form.opt_sd_credit#" opt_sd_7 = "#form.opt_sd_7#" opt_sd_6 = "#form.opt_sd_6#" opt_sd_4 = "#form.opt_sd_4#" opt_sd_5 = "#form.opt_sd_5#" opt_sd_9 = "#form.opt_sd_9#" opt_sd_8 = "#form.opt_sd_8#" transfer_tax_paid_by="#form.transfer_tax_paid_by#" first_time_buyer="#form.first_time_buyer#" underwriter_choice="#form.underwriter_choice#" cema="#form.cema#" assessed_value="#form.assessed_value#" new_deed="#form.new_deed#" current_deed_num="#form.current_deed_num#" spouses_removed="#form.spouses_removed#" non_spouses_removed="#form.non_spouses_removed#" spouses_added="#form.spouses_added#" non_spouses_added="#form.non_spouses_added#" construction_draws="#form.construction_draws#" perm_original_loan_amount="#form.perm_original_loan_amount#" closing_type="#form.closing_type#" borrower_owns="#form.borrower_owns#">




<CFQUERY datasource="#request.dsn#" NAME="get_comp_info">
  SELECT * from companies where ID = #form.comp_id#
</CFQUERY>


<cfset form.P1_LOANAMOUNT = NumberFormat(form.base_loan_amount, '___.__')>
<cfset form.P3_INITIAL_LOAN_AMOUNT = NumberFormat(form.base_loan_amount, '___.__')>
<cfset form.P3_TRADEOFF_LOANAMOUNT = NumberFormat(form.base_loan_amount, '___.__')>
<cfset form.P1_PROPERTYCOUNTY = form.Property_county>
<cfset form.P1_PROPERTYCITY = form.Property_city>
<cfset form.P1_PROPERTYSTATE = form.Property_state>
<cfset form.P1_PROPERTYZIP = form.Property_zip>
<cfset charges_that_cannot_increase = "">
<cfset charges_that_can_change = "">
<cfset owners_premium = 0>
<cfset form.P1_ORIGINATOR = get_comp_info.company>
<cfset form.P3_LOAN_ORIG_NAME = get_comp_info.company>
<cfset full_address = get_comp_info.addr1>
<cfif Len(get_comp_info.addr2)>
<cfset full_address = full_address & ", " & get_comp_info.addr2>
</cfif>
<cfset full_address = full_address & ", " & get_comp_info.city>
<cfset full_address = full_address & ", " & get_comp_info.state>
<cfset full_address = full_address & " " & get_comp_info.zip_code>
<cfset form.P1_ORIGINATORADDY = full_address>
<cfset form.P1_ORIGINATORPHONE = get_comp_info.phone>
<cfset form.P1_ORIGINATOREMAIL = get_comp_info.email>


<cfoutput query="get_fee_query">
<cfif get_fee_query.line_number eq 801>
<cfset form.P2_01_ORIGINATIONCHARGE = Trim(get_fee_query.amount)>
</cfif>

<cfif get_fee_query.line_number eq 802>
<cfset form.P2_02_POINTSAMOUNT = get_fee_query.amount>
</cfif>

<cfif get_fee_query.line_number eq 803>
<cfset form.P2_ADJUSTED_ORIGINATION_CHARGES = NumberFormat(Trim(get_fee_query.amount), '___.__')>
<cfset form.P1_ADJUSTED_ORIGINATION_CHARGES = NumberFormat(Trim(get_fee_query.amount), '___.__')>
</cfif>

<cfif get_fee_query.line_number eq 804>
<cfset charges_that_cannot_increase = ListAppend(charges_that_cannot_increase, "804")>
</cfif>
<cfif get_fee_query.line_number eq 805>
<cfset charges_that_cannot_increase = ListAppend(charges_that_cannot_increase, "805")>
</cfif>
<cfif get_fee_query.line_number eq 806>
<cfset charges_that_cannot_increase = ListAppend(charges_that_cannot_increase, "806")>
</cfif>
<cfif get_fee_query.line_number eq 807>
<cfset charges_that_cannot_increase = ListAppend(charges_that_cannot_increase, "807")>
</cfif>
<cfif get_fee_query.line_number eq 902>
<cfset charges_that_cannot_increase = ListAppend(charges_that_cannot_increase, "902")>
</cfif>

<cfif get_fee_query.line_number eq 1101>
<cfset charges_that_cannot_increase = ListAppend(charges_that_cannot_increase, "1101")>
<cfset charges_that_can_change = ListAppend(charges_that_can_change, "1101")>
<cfset form.P2_04_TITLESERVICES = NumberFormat(Trim(get_fee_query.amount), '___.__')>
</cfif>


<cfif get_fee_query.line_number eq 1103>
<cfset charges_that_cannot_increase = ListAppend(charges_that_cannot_increase, "1103")>
<cfset charges_that_can_change = ListAppend(charges_that_can_change, "1103")>
<cfset form.P2_05_OWNERSTITLEINS = NumberFormat(Trim(get_fee_query.amount), '___.__')>
<cfset owners_premium = (owners_premium + NumberFormat(Trim(get_fee_query.amount), '___.__'))>
</cfif>

<cfif get_fee_query.line_number eq 1201>
<cfset form.P2_07_GOVTRECCHARGE = NumberFormat(Trim(get_fee_query.amount), '___.__')>
</cfif>

<cfif get_fee_query.line_number eq 1203>
<cfset form.P2_08_TRANSFERTAX = NumberFormat(Trim(get_fee_query.amount), '___.__')>
</cfif>

<cfif get_fee_query.line_number eq 1301>
<cfset charges_that_cannot_increase = ListAppend(charges_that_cannot_increase, "1301")>
</cfif>

</cfoutput>

<cfset GFE_B3_TOTAL = 0>
<cfset field_list = "P2_03_USERSERVICE1_DESC,P2_03_USERSERVICE1_AMOUNT,P2_03_USERSERVICE2_DESC,P2_03_USERSERVICE2_AMOUNT,P2_03_USERSERVICE3_DESC,P2_03_USERSERVICE3_AMOUNT,P2_03_USERSERVICE4_DESC,P2_03_USERSERVICE4_AMOUNT,P2_03_USERSERVICE4_DESC,P2_03_USERSERVICE4_AMOUNT,P2_03_USERSERVICE5_DESC,P2_03_USERSERVICE5_AMOUNT,">
<cfoutput query="get_fee_query">
<cfif ListContainsNoCase(charges_that_cannot_increase, get_fee_query.line_number, ",") and (get_fee_query.line_number eq 804 or get_fee_query.line_number eq 805 or get_fee_query.line_number eq 806 or get_fee_query.line_number eq 807 or get_fee_query.line_number eq 902)>
<cfset GFE_B3_TOTAL = GFE_B3_TOTAL + NumberFormat(Trim(get_fee_query.amount), '___.__')>
<cfset "form.#ListGetAt(field_list, 1, ',')#" = "#get_fee_query.description# to #get_fee_query.payto#" />
	<cfset field_list = ListDeleteAt(field_list, 1, ",")>
<cfset "form.#ListGetAt(field_list, 1, ',')#" = NumberFormat(get_fee_query.amount, '___.__')>
    <cfset field_list = ListDeleteAt(field_list, 1, ",")>
</cfif>
</cfoutput>
<cfset form.P2_03_TOTAL = NumberFormat(Trim(GFE_B3_TOTAL), '___.__')>






<cfset GFE_P2_06_TOTAL = 0>
<cfset field_list = "P2_06_USERSERVICE1_DESC,P2_06_USERSERVICE1_AMOUNT,P2_06_USERSERVICE2_DESC,P2_06_USERSERVICE2_AMOUNT,P2_06_USERSERVICE3_DESC,P2_06_USERSERVICE3_AMOUNT,P2_06_USERSERVICE4_DESC,P2_06_USERSERVICE4_AMOUNT,P2_06_USERSERVICE5_DESC,P2_06_USERSERVICE5_AMOUNT,P2_06_USERSERVICE6_DESC,P2_06_USERSERVICE6_AMOUNT,P2_06_USERSERVICE7_DESC,P2_06_USERSERVICE7_AMOUNT">
<cfoutput query="get_fee_query">
<cfif (get_fee_query.line_number eq 1302 or get_fee_query.line_number eq 1303 or get_fee_query.line_number eq 1304 or get_fee_query.line_number eq 1305 or get_fee_query.line_number eq 1306 or get_fee_query.line_number eq 1307 or get_fee_query.line_number eq 1308)>
<cfset GFE_P2_06_TOTAL = GFE_P2_06_TOTAL + NumberFormat(Trim(get_fee_query.amount), '___.__')>
<cfset "form.#ListGetAt(field_list, 1, ',')#" = "#get_fee_query.description# to #get_fee_query.payto#">
	<cfset field_list = ListDeleteAt(field_list, 1, ",")>
<cfset "form.#ListGetAt(field_list, 1, ',')#" = NumberFormat(get_fee_query.amount, '___.__')>
    <cfset field_list = ListDeleteAt(field_list, 1, ",")>
</cfif>
</cfoutput>
<cfset form.P2_06_TOTAL = NumberFormat(Trim(GFE_P2_06_TOTAL), '___.__')>

<cfset GFE_B = 0>

<!--- <cfif  IsNumeric(form.P2_01_ORIGINATIONCHARGE) and form.P2_01_ORIGINATIONCHARGE neq ''>
<cfset GFE_B = GFE_B + form.P2_01_ORIGINATIONCHARGE>
</cfif>
<cfif  IsNumeric(form.P2_02_POINTSAMOUNT) and form.P2_02_POINTSAMOUNT neq ''>
<cfset GFE_B = GFE_B + form.P2_02_POINTSAMOUNT>
</cfif>
 --->
<!--- <cfif  IsNumeric(form.P2_ADJUSTED_ORIGINATION_CHARGES) and form.P2_ADJUSTED_ORIGINATION_CHARGES neq ''>
<cfset GFE_B = GFE_B + form.P2_ADJUSTED_ORIGINATION_CHARGES>
</cfif>
 --->
<cfif  IsNumeric(form.P2_03_TOTAL) and form.P2_03_TOTAL neq ''>
<cfset GFE_B = GFE_B + form.P2_03_TOTAL>
</cfif>
<cfif  IsNumeric(form.P2_04_TITLESERVICES) and form.P2_04_TITLESERVICES neq ''>
<cfset GFE_B = GFE_B + form.P2_04_TITLESERVICES>
</cfif>
<cfif  IsNumeric(form.P2_05_OWNERSTITLEINS) and form.P2_05_OWNERSTITLEINS neq ''>
<cfset GFE_B = GFE_B + form.P2_05_OWNERSTITLEINS>
</cfif>
<cfif  IsNumeric(form.P2_06_TOTAL) and form.P2_06_TOTAL neq ''>
<cfset GFE_B = GFE_B + form.P2_06_TOTAL>
</cfif>
<cfif  IsNumeric(form.P2_07_GOVTRECCHARGE) and form.P2_07_GOVTRECCHARGE neq ''>
<cfset GFE_B = GFE_B + form.P2_07_GOVTRECCHARGE>
</cfif>
<cfif  IsNumeric(form.P2_08_TRANSFERTAX) and form.P2_08_TRANSFERTAX neq ''>
<cfset GFE_B = GFE_B + form.P2_08_TRANSFERTAX>
</cfif>
<cfif  IsNumeric(form.P2_09_ESCROWDEPOSIT) and form.P2_09_ESCROWDEPOSIT neq ''>
<cfset GFE_B = GFE_B + form.P2_09_ESCROWDEPOSIT>
</cfif>
<cfif  IsNumeric(form.P2_10_DAILYINTERESTCHARGES) and form.P2_10_DAILYINTERESTCHARGES neq ''>
<cfset GFE_B = GFE_B + form.P2_10_DAILYINTERESTCHARGES>
</cfif>
<cfif  IsNumeric(form.P2_11_TOTAL) and form.P2_11_TOTAL neq ''>
<cfset GFE_B = GFE_B + form.P2_11_TOTAL>
</cfif>
<cfset form.P2_B_TOTAL = NumberFormat(GFE_B, '___.__')>
<cfset form.P1_B_TOTAL = NumberFormat(GFE_B, '___.__')>
<cfset GFE_AB = 0>
<cftry>
<cfset GFE_AB = NumberFormat((GFE_B + form.P2_ADJUSTED_ORIGINATION_CHARGES), '___.__')>
<cfcatch type="any"></cfcatch>
</cftry>
<cfset form.P3_AB_TOTAL_2 = NumberFormat(GFE_AB, '___.__')>
<cfset form.P3_AB_TOTAL = NumberFormat(GFE_AB, '___.__')>
<cfset form.P2_AB_TOTAL = NumberFormat(GFE_AB, '___.__')>
<cfset form.P1_AB_TOTAL = NumberFormat(GFE_AB, '___.__')>
<cfset copied_struct = StructCopy(form)>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="copied_struct">
  SELECT * from SAVED_GFEs_2010
  where rec_id = #rec_id#
</CFQUERY>
<cfif url.viewprint eq 1 or url.sendemail eq 1>
<cfhttp url="https://machine1.firsttitleservices.com/gfe/GFE_2010_Calc_PDF.cfm?rec_id=#rec_id#" method="get" resolveURL="true">
        </cfhttp>
        <cfdocument format="PDF" pagetype="custom" pageheight="14" pagewidth="8.5" margintop=".25" marginbottom=".25" marginleft=".25" marginright=".25" filename="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\gfe\saved\GFE_#copied_struct.rec_id#.pdf" overwrite="yes"> <cfoutput>#cfhttp.filecontent#</cfoutput> </cfdocument>
<cfif url.viewprint eq 1>
<script language="javascript">
open('gfe/saved/GFE_<cfoutput>#copied_struct.rec_id#</cfoutput>.pdf');
</script>
</cfif>

<cfif url.sendemail eq 1>
<CFMAIL
	TO="#url.sendtoaddr#"
	FROM="webmaster@firsttitleservices.com" Subject="Your GFE"
	TIMEOUT="600">


<cfmailparam file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\gfe\saved\GFE_#copied_struct.rec_id#.pdf">

</CFMAIL>

</cfif>

</cfif>
</cfif>


<cfoutput>
<html>
<head>
<title>Good Faith Estimate (GFE)</title>
<script type="text/javascript" language="javascript" src="../admin_area/calendar/calendar.js"></script>
<script language="javascript">
function IsNumeric(str)
// returns true if str is numeric
// that is it contains only the digits 0-9
// returns false otherwise
// returns false if empty
{
  var len= str.length;


  if (len==0)
    return false;
  //else
  var p=0;
  var ok= true;
  var ch= "";
  while (ok && p<len)
  {
    ch= str.charAt(p);
    if ('0'<=ch && ch<='9' || ch=='.' || ch=='-')
      p++;
    else
      ok= false;
  }
  return ok;
}


function roundit(n) {

  ans = n * 1000
  ans = Math.round(ans /10) + ""
  while (ans.length < 3) {ans = "0" + ans}
  len = ans.length
  ans = ans.substring(0,len-2) + "." + ans.substring(len-2,len)
  if (ans == '0.00') {
  ans = 0;
  }
  return ans
}

function re_add_form() {
var temp = 0;

if (IsNumeric(parseFloat(document.gfe_form.P2_01_ORIGINATIONCHARGE.value)) && isNaN(parseFloat(document.gfe_form.P2_01_ORIGINATIONCHARGE.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_01_ORIGINATIONCHARGE.value);
}
if (IsNumeric(parseFloat(document.gfe_form.P2_02_POINTSAMOUNT.value)) && isNaN(parseFloat(document.gfe_form.P2_02_POINTSAMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_02_POINTSAMOUNT.value);
}



document.gfe_form.P2_ADJUSTED_ORIGINATION_CHARGES.value = roundit(parseFloat(temp), 2);
document.gfe_form.P1_ADJUSTED_ORIGINATION_CHARGES.value = roundit(parseFloat(temp), 2);


var temp = 0;
if (isNaN(parseFloat(document.gfe_form.P2_03_USERSERVICE1_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_03_USERSERVICE1_AMOUNT.value);
}
if (isNaN(parseFloat(document.gfe_form.P2_03_USERSERVICE2_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_03_USERSERVICE2_AMOUNT.value);
}
if (isNaN(parseFloat(document.gfe_form.P2_03_USERSERVICE3_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_03_USERSERVICE3_AMOUNT.value);
}
if (isNaN(parseFloat(document.gfe_form.P2_03_USERSERVICE4_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_03_USERSERVICE4_AMOUNT.value);
}
if (isNaN(parseFloat(document.gfe_form.P2_03_USERSERVICE5_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_03_USERSERVICE5_AMOUNT.value);
}

if (isNaN(parseFloat(document.gfe_form.P2_03_TOTAL.value)) == false) {
document.gfe_form.P2_03_TOTAL.value = roundit(parseFloat(temp), 2);
}

var temp = 0;

if (isNaN(parseFloat(document.gfe_form.P2_06_USERSERVICE1_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_06_USERSERVICE1_AMOUNT.value);
}
if (isNaN(parseFloat(document.gfe_form.P2_06_USERSERVICE2_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_06_USERSERVICE2_AMOUNT.value);
}
if (isNaN(parseFloat(document.gfe_form.P2_06_USERSERVICE3_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_06_USERSERVICE3_AMOUNT.value);
}
if (isNaN(parseFloat(document.gfe_form.P2_06_USERSERVICE4_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_06_USERSERVICE4_AMOUNT.value);
}
if (isNaN(parseFloat(document.gfe_form.P2_06_USERSERVICE5_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_06_USERSERVICE5_AMOUNT.value);
}
if (isNaN(parseFloat(document.gfe_form.P2_06_USERSERVICE6_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_06_USERSERVICE6_AMOUNT.value);
}
if (isNaN(parseFloat(document.gfe_form.P2_06_USERSERVICE7_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_06_USERSERVICE7_AMOUNT.value);
}

if (isNaN(parseFloat(document.gfe_form.P2_06_TOTAL.value)) == false) {
document.gfe_form.P2_06_TOTAL.value = roundit(parseFloat(temp), 2);
}




var temp = 0;

if (IsNumeric(parseFloat(document.gfe_form.P2_10_INTERESTPERDAY.value)) && IsNumeric(parseFloat(document.gfe_form.P2_10_INTERESTDAYS.value))) {
temp = temp + (parseFloat(document.gfe_form.P2_10_INTERESTPERDAY.value) * parseFloat(document.gfe_form.P2_10_INTERESTDAYS.value));
}

if (isNaN(temp)) {
document.gfe_form.P2_10_DAILYINTERESTCHARGES.value = 0;
} else {
document.gfe_form.P2_10_DAILYINTERESTCHARGES.value = roundit(parseFloat(temp), 2);
}




var temp = 0;

if (isNaN(parseFloat(document.gfe_form.P2_11_USERSERVICE1_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_11_USERSERVICE1_AMOUNT.value);
}
if (isNaN(parseFloat(document.gfe_form.P2_11_USERSERVICE2_AMOUNT.value)) == false) {
temp = temp + parseFloat(document.gfe_form.P2_11_USERSERVICE2_AMOUNT.value);
}

if (isNaN(temp)) {
document.gfe_form.P2_11_TOTAL.value = 0;
} else {
document.gfe_form.P2_11_TOTAL.value = roundit(parseFloat(temp), 2);
}


var temp = 0;

if (isNaN(parseFloat(document.gfe_form.P2_03_TOTAL.value)) == false) {
if (IsNumeric(parseFloat(document.gfe_form.P2_03_TOTAL.value))) {
temp = temp + parseFloat(document.gfe_form.P2_03_TOTAL.value);
}
}
if (isNaN(parseFloat(document.gfe_form.P2_04_TITLESERVICES.value)) == false) {
if (IsNumeric(parseFloat(document.gfe_form.P2_04_TITLESERVICES.value))) {
temp = temp + parseFloat(document.gfe_form.P2_04_TITLESERVICES.value);
}
}
if (isNaN(parseFloat(document.gfe_form.P2_05_OWNERSTITLEINS.value)) == false) {
if (IsNumeric(parseFloat(document.gfe_form.P2_05_OWNERSTITLEINS.value))) {
temp = temp + parseFloat(document.gfe_form.P2_05_OWNERSTITLEINS.value);
}
}
if (isNaN(parseFloat(document.gfe_form.P2_06_TOTAL.value)) == false) {
if (IsNumeric(parseFloat(document.gfe_form.P2_06_TOTAL.value))) {
temp = temp + parseFloat(document.gfe_form.P2_06_TOTAL.value);
}
}
if (isNaN(parseFloat(document.gfe_form.P2_07_GOVTRECCHARGE.value)) == false) {
if (IsNumeric(parseFloat(document.gfe_form.P2_07_GOVTRECCHARGE.value))) {
temp = temp + parseFloat(document.gfe_form.P2_07_GOVTRECCHARGE.value);
}
}
if (isNaN(parseFloat(document.gfe_form.P2_08_TRANSFERTAX.value)) == false) {
if (IsNumeric(parseFloat(document.gfe_form.P2_08_TRANSFERTAX.value))) {
temp = temp + parseFloat(document.gfe_form.P2_08_TRANSFERTAX.value);
}
}
if (isNaN(parseFloat(document.gfe_form.P2_09_ESCROWDEPOSIT.value)) == false) {
if (IsNumeric(parseFloat(document.gfe_form.P2_09_ESCROWDEPOSIT.value))) {
temp = temp + parseFloat(document.gfe_form.P2_09_ESCROWDEPOSIT.value);
}
}
if (isNaN(parseFloat(document.gfe_form.P2_10_DAILYINTERESTCHARGES.value)) == false) {
if (IsNumeric(parseFloat(document.gfe_form.P2_10_DAILYINTERESTCHARGES.value))) {
temp = temp + parseFloat(document.gfe_form.P2_10_DAILYINTERESTCHARGES.value);
}
}
if (isNaN(parseFloat(document.gfe_form.P2_11_TOTAL.value)) == false) {
if (IsNumeric(parseFloat(document.gfe_form.P2_11_TOTAL.value))) {
temp = temp + parseFloat(document.gfe_form.P2_11_TOTAL.value);
}
}
if (isNaN(parseFloat(temp)) == false) {
document.gfe_form.P1_B_TOTAL.value = roundit(parseFloat(temp), 2);
document.gfe_form.P2_B_TOTAL.value = roundit(parseFloat(temp), 2);
}

var temp = 0;
if (IsNumeric(parseFloat(document.gfe_form.P1_ADJUSTED_ORIGINATION_CHARGES.value))) {
temp = temp + parseFloat(document.gfe_form.P1_ADJUSTED_ORIGINATION_CHARGES.value);
}
if (IsNumeric(parseFloat(document.gfe_form.P2_B_TOTAL.value))) {
temp = temp + parseFloat(document.gfe_form.P2_B_TOTAL.value);
}
if (isNaN(parseFloat(temp)) == false) {
document.gfe_form.P2_AB_TOTAL.value = roundit(parseFloat(temp), 2);
document.gfe_form.P1_AB_TOTAL.value = roundit(parseFloat(temp), 2);
document.gfe_form.P3_AB_TOTAL_2.value = roundit(parseFloat(temp), 2);
document.gfe_form.P3_AB_TOTAL.value = roundit(parseFloat(temp), 2);
}
}
</script>


<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:10px;}
textarea { font-family:arial,sans-serif; font-size:10px; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; width:180px;  }
input.user { font-size:10px; width:160px;  }
input.usersmall { font-size:10px; width:100px;  }
.calculated {font-size:10px; width:160px; color:##804000; background:##ffff80; border:1px dotted ##400000;  }
P.pagebreak {page-break-before:always;}
.spacer { clear:both; }
.page_container { width:670px; }
.float_left { float:left; }
.silver { background-color:silver; }
.bsilver { border:1px solid black; background-color:silver; }
.black { background-color:black; color:white; }
.bordered { border:1px solid black; }
.left_text { font-size:14px; }
.left_text_italic { font-style:italic; }
.SC_header { font-weight:bold; font-style:italic; }
.table_header { background-color:black; color:white; }
.table_data { border:1px solid black; }
.page_title{font-size:20px;}

<cfif isDefined('form.populatevarnames')>
.page_container { width:1000px; }
textarea { font-family:arial,sans-serif; font-size:10px; color:##004000; background:##cdfed0; border:1px dotted ##004000; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; width:180px; color:##004000;background:##cdfed0; border:1px dotted ##004000; }
input.user { font-size:10px; width:180px; color:##400000; background:##ffdfdf; border:1px dotted ##400000; }
input.two_digit { width:180px}
input.date { width:180px; }
-->
</style>

	<cfset fieldlist=form.fieldnames>
	<cfset fieldlist=ListDeleteAt(fieldlist,ListFindNoCase(fieldlist,'POPULATEVARNAMES'))>
	<script type="text/javascript" language="JavaScript"><!--
		function writeName() {
		<cfloop list="#fieldlist#" index="i">document.gfe_form.#i#.value = '#i#';
		</cfloop> }
	//--></script>
	</head>
	<body  onLoad="re_add_form();">
<cfelse>
-->
</style>

	</head>
	<body  onLoad="re_add_form();">
</cfif>


<IFRAME STYLE="display:none;position:absolute;width:157;height:158;z-index=100" ID="CalFrame" MARGINHEIGHT=0 MARGINWIDTH=0 NORESIZE FRAMEBORDER=0 SCROLLING=NO SRC="../calendar/popup_calendar.html"></IFRAME>


<div class="page_container">
<form action="GFE_2010_Calc_modify_submit.cfm" method="post" name="gfe_form">
<input type="hidden" name="rec_id" value="#rec_id#" >
<input type="hidden" name="viewprint" value="0" >
<input type="hidden" name="sendemail" value="0" ><br>
<center>
<table width="350" cellpadding=6 cellspacing=2 border=0>
<tr>
<td width="150" valign="bottom" align="center" ><input type="submit" name="submit" onClick="document.gfe_form.viewprint.value=1;" value="View or Print">
</td>
<td width="50" align="center" valign="bottom">&nbsp;or&nbsp;</td>
<td width="150" align="center" valign="bottom"><cfif Len(url.sendtoaddr)>GFE emailed to #url.sendtoaddr#<br></cfif><input type="text" name="email_to_send" value=""><br>
<input type="submit" name="submit" onClick="document.gfe_form.sendemail.value=1;" value="Send to Email Address">
</td>
</tr>
</table>
</center>
<br><br><br>



<span class="page_title">Good Faith Estimate</span>
<!--- <input type="submit" name="populatevarnames" value="Populate Variable Names" >
<input type="submit" name="clearvarnames" value="Clear Variable Names" >
 --->
<!---  <br /><br /><br />

	<cfif isDefined('form.fieldnames')>
		<span class="page_title">#ListLen(form.fieldnames)# Form Fields Found</span>
		<br />
		<span class="left_text"><em>click below for details</em></span>
		<cfset structVarList=StructCopy(#copied_struct#)>
		<cfset boolDeleteSuccess=StructDelete(structVarList, "FIELDNAMES")>
		<cfdump var="#structVarList#" expand="false" label="Form Scope Dump (FORM.FIELDNAMES removed)">
	<cfelse>
		<span class="page_title">Press the button to populate the variable names. </span>
	</cfif>

<br /><br /><br />
 --->



<!-- HEADER
<img alt="HUD Logo" src="HUD%20Logo.png" height="75" width="80" />
<div style="position:absolute;top:24;left:82"><span class="page_title">Good Faith Estimate (GFE)</span></div>
<div style="position:absolute;top:23;left:518"><span>OMB Approval No. 2502-0265</span></div>

-->

<!-- Originator Information -->
<div class="float_left" style="position:relative;left:80px;">
<table class="table_data" border="1" width="330" cellpadding="0" cellspacing="0" summary="Originator Information">
<tr><td>Name of Originator</td><td><input type="text" class="text" name="P1_ORIGINATOR" value="#copied_struct.P1_ORIGINATOR#" onChange="document.gfe_form.P3_LOAN_ORIG_NAME.value=document.gfe_form.P1_ORIGINATOR.value;" onBlur="recalc();"/></td></tr>
<tr><td>Originator <br /> Address</td><td><textarea rows="2" cols="40" name="P1_ORIGINATORADDY">#copied_struct.P1_ORIGINATORADDY#</textarea></td></tr>
<tr><td>Originator Phone Num</td><td><input type="text" class="text" name="P1_ORIGINATORPHONE" value="#copied_struct.P1_ORIGINATORPHONE#" /></td></tr>
<tr><td>Originator Email</td><td><input type="text" class="text" name="P1_ORIGINATOREMAIL" value="#copied_struct.P1_ORIGINATOREMAIL#" /></td></tr>
</table>
</div>

<!-- Borrower Information -->
<div class="float_left" style="position:relative;left:200px;">
<table class="table_data"  border="1" width="330" cellpadding="0" cellspacing="0" summary="Borrower Information">
<tr><td>Borrower  </td><td> <input type="text" class="text" name="P1_BORROWER"  value="#copied_struct.P1_BORROWER#" /></td></tr>
<tr><td> Property Address: </td><td>
<input type="text" class="text" name="P1_PROPERTYSTREET" value="#copied_struct.P1_PROPERTYSTREET#" /> <br />
<input type="text" class="text" name="P1_PROPERTYSTREET2" value="#copied_struct.P1_PROPERTYSTREET2#" /> <br />
<input type="text" class="text" name="P1_PROPERTYCOUNTY" value="#copied_struct.P1_PROPERTYCOUNTY#" /> <br />
<input type="text" class="text" name="P1_PROPERTYCITY" value="#copied_struct.P1_PROPERTYCITY#" /> <br />
<input type="text" class="text" name="P1_PROPERTYSTATE" value="#copied_struct.P1_PROPERTYSTATE#" /> <br />
<input type="text" class="text" name="P1_PROPERTYZIP" value="#copied_struct.P1_PROPERTYZIP#" />

</td></tr>

<tr><td>Date of GFE</td><td><input type="text" class="text" name="P1_GFEDATE" value="#DateFormat(copied_struct.P1_GFEDATE, 'm/d/yyyy')#" />
<A href="javascript:ShowCalendar(document.all('calpic'),document.all('P1_GFEDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A>
</td></tr>
</table>
</div>

<div class="spacer"><br /></div>

<!-- Settlement Charges Form (This table contains the rest of the form) -->
<table class="table_outer" border="0" width="100%" summary="Settlement Charges Form">

<!-- Purpose -->
<tr>
<td valign="top" class="left_text" width="150">Purpose</td>
<td>This GFE gives you an estimate of your settlement charges and loan terms if you are approved for
this loan. For more information, see HUD's Special Information Booklet on settlement charges, your
Truth-in-Lending Disclosures, and other consumer information at www.hud.gov/respa. If you decide
you would like to proceed with this loan, contact us.
<hr size="1" />
</td>
</tr>

<!-- Shopping -->
<tr>
<td valign="top" class="left_text">Shopping for <br /> your loan</td>
<td>Only you can shop for the best loan for you. Compare this GFE with other loan offers, so you can find
the best loan. Use the shopping chart on page 3 to compare all the offers you receive.
<hr size="1" />
</td>
</tr>

<!-- Dates -->
<tr>
<td valign="top" class="left_text">Important dates</td>
<td>
<ol>
<li>The interest rate for this GFE is available through
<input type="text" class="text" name="P1_INTERESTAVAILABLEDATE" value="#DateFormat(copied_struct.P1_INTERESTAVAILABLEDATE, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic5'),document.all('P1_INTERESTAVAILABLEDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic5" style="POSITION: relative"></A>.
After this time, the interest rate, some of your loan Origination Charges, and the monthly payment shown below can change until you lock your interest rate.</li>
<li>This estimate for all other settlement charges is available through
<input type="text" class="text" name="P1_ESTIMATEAVAILABLEDATE" value="#DateFormat(copied_struct.P1_ESTIMATEAVAILABLEDATE, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic6'),document.all('P1_ESTIMATEAVAILABLEDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic6" style="POSITION: relative"></A>.</li>
<li>After you lock your interest rate, you must go to settlement within
<input type="text" class="text" name="P1_AFTERLOCKMINDAYS" value="#copied_struct.P1_AFTERLOCKMINDAYS#" onChange="document.gfe_form.P3_RATE_LOCK.value=document.gfe_form.P1_AFTERLOCKMINDAYS.value;"/> days (your rate lock period)to receive the locked interest rate.</li>
<li>You must lock the interest rate at least
<input type="text" class="text" name="P1_INTERESTLOCKMINDAYS" value="#copied_struct.P1_INTERESTLOCKMINDAYS#" /> days before settlement.</li>
</ol>
<hr size="1" />
</td>
</tr>

<!-- Loan Summary -->
<tr>
<td valign="top" class="left_text">Summary of <br /> your loan</td>
<td>
<table class="table_data" width="100%" border="1" summary="Summary of your loan">
<tr>
<td width="50%">Your initial loan amount is</td>
<td width="50%" colspan="2">$<input type="text" class="usersmall" name="P1_LOANAMOUNT" value="#copied_struct.P1_LOANAMOUNT#" onChange="document.gfe_form.P3_TRADEOFF_LOANAMOUNT.value=document.gfe_form.P1_LOANAMOUNT.value; document.gfe_form.P3_INITIAL_LOAN_AMOUNT.value=document.gfe_form.P1_LOANAMOUNT.value; re_add_form();" /></td>
</tr>
<tr>
<td width="50%">Your loan term is</td>
<td width="50%" colspan="2"><input type="text" class="usersmall" name="P1_LOANTERM" value="#copied_struct.P1_LOANTERM#" onChange="document.gfe_form.P3_LOAN_TERM.value=document.gfe_form.P1_LOANTERM.value; re_add_form();" /> years</td>
</tr>
<tr>
<td width="50%">Your initial interest rate is</td>
<td width="50%" colspan="2"><input type="text" class="usersmall" name="P1_INTERESTRATE" id="P1_INTERESTRATE" value="#copied_struct.P1_INTERESTRATE#" onChange="document.gfe_form.P3_TRADEOFF_INITIALINTEREST.value=document.gfe_form.P1_INTERESTRATE.value; document.gfe_form.P3_INITIAL_INTEREST.value=document.gfe_form.P1_INTERESTRATE.value; re_add_form();" />%</td>
</tr>
<tr>
<td width="50%">Your initial monthly amount owed for principal,interest, and any mortgage insurance is</td>
<td width="50%" colspan="2">$<input type="text" class="usersmall" name="P1_OWEDMONTHLY" value="#copied_struct.P1_OWEDMONTHLY#" onChange="document.gfe_form.P3_TRADEOFF_MONTHLYAMOUNT.value=document.gfe_form.P1_OWEDMONTHLY.value; document.gfe_form.P3_INITIAL_MONTHLY.value=document.gfe_form.P1_OWEDMONTHLY.value; re_add_form();" /> per month</td>
</tr>
<tr>
<td width="50%">Can your interest rate rise?</td>
<td><input type="radio" name="P1_INTERESTCANRISE" VALUE="NO" onClick="document.gfe_form.P3_RATE_RISE.value='NO'" <cfif copied_struct.P1_INTERESTCANRISE eq 'NO'>checked</cfif>  />No</td>
<td width="40%"><input type="radio" name="P1_INTERESTCANRISE" VALUE="YES" onClick="document.gfe_form.P3_RATE_RISE.value='YES'" <cfif copied_struct.P1_INTERESTCANRISE eq 'YES'>checked</cfif> />Yes, it can rise to a maximum of
<input type="text" class="usersmall" name="P1_INTERESTCANRISE_MAX" value="#copied_struct.P1_INTERESTCANRISE_MAX#" />%.<br>
The first change will be in
<input type="text" class="usersmall" name="P1_INTERESTCANRISE_FIRSTDATE"value="#DateFormat(copied_struct.P1_INTERESTCANRISE_FIRSTDATE, 'm/d/yyyy')#"  /><A href="javascript:ShowCalendar(document.all('calpic2'),document.all('P1_INTERESTCANRISE_FIRSTDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic2" style="POSITION: relative"></A>.</td>
</tr>
<tr>
<td width="50%">Even if you make payments on time, can your loan balance rise?</td>
<td><input type="radio" name="P1_BALANCECANRISE" VALUE="NO" onClick="document.gfe_form.P3_LOAN_BALANCE_RISE.value='NO'" <cfif copied_struct.P1_BALANCECANRISE eq 'NO'>checked</cfif>  />No</td>
<td width="40%"><input type="radio" name="P1_BALANCECANRISE" VALUE="YES" onClick="document.gfe_form.P3_LOAN_BALANCE_RISE.value='YES'" <cfif copied_struct.P1_BALANCECANRISE eq 'YES'>checked</cfif>  />Yes, it can rise to a maximum of
$<input type="text" class="usersmall" name="P1_BALANCECANRISE_MAX" value="#copied_struct.P1_BALANCECANRISE_MAX#" />.</td>
</tr>
<tr>
<td width="50%">Even if you make payments on time, can your monthly amount owed for principal, interest, and any mortgage insurance rise</td>
<td><input type="radio" name="P1_MONTHLYCANRISE" VALUE="NO" onClick="document.gfe_form.P3_MONTHLY_RISE.value='NO'" <cfif copied_struct.P1_MONTHLYCANRISE eq 'NO'>checked</cfif>  />No</td>
<td width="40%"><input type="radio" name="P1_MONTHLYCANRISE" VALUE="YES" onClick="document.gfe_form.P3_MONTHLY_RISE.value='YES'" <cfif copied_struct.P1_MONTHLYCANRISE eq 'YES'>checked</cfif> />Yes, the first increase can be in
<input type="text" class="usersmall" name="P1_MONTHLYCANRISE_FIRSTDATE" value="#DateFormat(copied_struct.P1_MONTHLYCANRISE_FIRSTDATE, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic3'),document.all('P1_MONTHLYCANRISE_FIRSTDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic3" style="POSITION: relative"></A><br>
and the monthly amount owed can rise to
$<input type="text" class="usersmall" name="P1_MONTHLYCANRISE_FIRSTMAX" value="#copied_struct.P1_MONTHLYCANRISE_FIRSTMAX#" /> .<br>
The maximum it can ever rise to is
$<input type="text" class="usersmall" name="P1_MONTHLYCANRISE_MAX" value="#copied_struct.P1_MONTHLYCANRISE_MAX#" /> .</td>
</tr>
<tr>
<td width="50%">Does your loan have a prepayment penalty?</td>
<td><input type="radio" name="P1_PREPAYMENTPENALTY" VALUE="NO" onClick="document.gfe_form.P3_PREPAY_PENALTY.value='NO'" <cfif copied_struct.P1_PREPAYMENTPENALTY eq 'NO'>checked</cfif> />No</td>
<td width="40%"><input type="radio" name="P1_PREPAYMENTPENALTY" VALUE="YES" onClick="document.gfe_form.P3_PREPAY_PENALTY.value='YES'" <cfif copied_struct.P1_PREPAYMENTPENALTY eq 'YES'>checked</cfif> />Yes, your maximum prepayment penalty is
$<input type="text" class="usersmall" name="P1_PREPAYMENTPENALTY_MAX" value="#copied_struct.P1_PREPAYMENTPENALTY_MAX#" />.</td>
</tr>
<tr>
<td width="50%">Does your loan have a balloon payment?</td>
<td><input type="radio" name="P1_BALLOONPAYMENT" VALUE="NO" onClick="document.gfe_form.P3_BALLOON_PAYMENT.value='NO'" <cfif copied_struct.P1_BALLOONPAYMENT eq 'NO'>checked</cfif> />No</td>
<td width="40%"><input type="radio" name="P1_BALLOONPAYMENT" VALUE="YES" onClick="document.gfe_form.P3_BALLOON_PAYMENT.value='YES'" <cfif copied_struct.P1_BALLOONPAYMENT eq 'YES'>checked</cfif> />Yes, you have a balloon payment of <br>
$<input type="text" class="usersmall" name="P1_BALLOONPAYMENT_AMOUNT" value="#copied_struct.P1_BALLOONPAYMENT_AMOUNT#" /> due in <br>
<input type="text" class="usersmall" name="P1_BALLOONPAYMENT_YEARSUNTIL" value="#copied_struct.P1_BALLOONPAYMENT_YEARSUNTIL#" />years.</td>
</tr>
</table>
</td>
</tr>

<!-- Escrow -->
<tr>
<td valign="top" class="left_text">Escrow account <br /> information</td>
<td class="table_data">Some lenders require an escrow account to hold funds for paying
 property taxes or other property related charges in addition to your monthly amount owed of
 $ <input type="text" class="usersmall" name="P1_LENDERESCROW" value="#copied_struct.P1_LENDERESCROW#" />. <br />
 Do we require you to have an escrow account for your loan? <br />
  <input type="radio" name="P1_ESCROWREQUIRED" VALUE="NO" <cfif copied_struct.P1_ESCROWREQUIRED eq 'NO'>checked</cfif> />No, you do not have an escrow account. <br />
  <input type="radio" name="P1_ESCROWREQUIRED" VALUE="YES" <cfif copied_struct.P1_ESCROWREQUIRED eq 'YES'>checked</cfif> />You must pay these charges directly when due. <br /> </td>
</tr>

<!-- Settlement Summary -->
<tr>
<td valign="top" class="left_text">Summary of your <br /> settlement charges</td>
<td>
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="A (1K)" src="../images/A.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Adjusted Origination Charges</td>
<td class="bordered"><input type="text" class="text" name="P1_ADJUSTED_ORIGINATION_CHARGES" value="#copied_struct.P1_ADJUSTED_ORIGINATION_CHARGES#" /></td>
</tr>
<tr>
<td><img alt="B (1K)" src="../images/B.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Charges for All Other Settlement Services</td>
<td class="bordered"><input type="text" class="user" name="P1_B_TOTAL" value="#copied_struct.P1_B_TOTAL#" /></td>
</tr>
</table>
<table border="0" summary="Total of your settlement charges">
<tr>
<td><img alt="AplusB (1K)" src="../images/AplusB.png" height="31" width="76" /></td>
<td class="black" width="100%">Total Estimated Settlement Charges</td>
<td class="bordered"><input type="text" class="user" name="P1_AB_TOTAL" value="#copied_struct.P1_AB_TOTAL#" /></td>
</tr>
</table>

<P CLASS="pagebreak"> <!-- PAGE BREAK (printing) -->

</td>
</tr>

<!-- Understanding -->
<tr>
<td valign="top" class="left_text">Understanding your <br /> estimated settlement <br /> charges</td>
<td>
<!-- TABLE: Your Adjusted Origination Charges -->
<table border="1" class="table_data" summary="Your Adjusted Origination Charges" width="100%">
<tr>
<td colspan="3" bgcolor="black" ><span style="color:white;">Your Adjusted Origination Charges</span></td>
</tr>
<tr>
<td colspan="2" width="100%">1. Our origination charge <br /> This charge is for getting this loan for you.</td>
<td><input type="text" class="text" name="P2_01_ORIGINATIONCHARGE" value="#copied_struct.P2_01_ORIGINATIONCHARGE#" onChange="re_add_form();" /></td>
</tr>
<tr>
<td colspan="2">
<!-- TABLE: Your credit or charge -->
<table class="table_data" summary="Your credit or charge">
<tr>
<td colspan="2"> 2.  Your credit or charge (points) for the specific interest rate chosen</td>
</tr>
<tr>
<td><input type="radio" name="P2_02_POINTS" value="INC" <cfif copied_struct.P2_02_POINTS eq 'INC'>checked</cfif> /></td>
<td>The credit or charge for the interest rate of
 <input type="text" class="text" name="P2_02_POINTSINCRATE" value="#copied_struct.P2_02_POINTSINCRATE#" />% is included in "Our origination charge."  (See item 1 above.)</td>
</tr>
<tr><td><input type="radio" name="P2_02_POINTS" value="REC" <cfif copied_struct.P2_02_POINTS eq 'REC'>checked</cfif> /></td>
<td>You receive a credit of
$<input type="text" class="text" name="P2_02_POINTSRECAMOUNT" value="#copied_struct.P2_02_POINTSRECAMOUNT#" /> for this interest rate of
<input type="text" class="text" name="P2_02_POINTSRECRATE" value="#copied_struct.P2_02_POINTSRECRATE#" />%.  This credit reduces your settlement charges.</td>
</tr>
<tr>
<td><input type="radio" name="P2_02_POINTS" value="PAY" <cfif copied_struct.P2_02_POINTS eq 'PAY'>checked</cfif> /></td>
<td>You pay a charge of
$<input type="text" class="text" name="P2_02_POINTSPAYAMOUNT" value="#copied_struct.P2_02_POINTSPAYAMOUNT#" /> for this interest rate of
<input type="text" class="text" name="P2_02_POINTSPAYRATE" value="#copied_struct.P2_02_POINTSPAYRATE#" />%. 		 This charge (points) increases your total settlement charges.</td></tr>
<tr>
<td colspan="2">The tradeoff table on page 3 shows that you can change your total settlement charges by choosing a different interest rate for this loan.</td>
</tr>
</table><!-- TABLE: Your credit or charge -->
</td>
<td valign="bottom"><input type="text" class="text" name="P2_02_POINTSAMOUNT" value="#copied_struct.P2_02_POINTSAMOUNT#" onChange="re_add_form();" /></td>
</tr>
</table><!-- TABLE: Your Adjusted Origination Charges -->
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="A (1K)" src="../images/A.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Adjusted Origination Charges</td>
<td class="bordered"><input type="text" class="text" name="P2_ADJUSTED_ORIGINATION_CHARGES" value="#copied_struct.P2_ADJUSTED_ORIGINATION_CHARGES#" onFocus="this.blur();" /></td>
</tr>
</table>
</td>
</tr>

<!-- Other Settlement Services -->
<tr>
<td valign="top" class="left_text_italic">Some of these charges can  <br /> change at settlement.  See<br /> the instructions section for <br /> more information.</td>
<td>
<!-- TABLE: Your Charges for All Other Settlement Services -->
<table border="1" class="table_data" summary="Your Charges for All Other Settlement Services" width="100%">
<tr>
<td colspan="2" bgcolor="black" ><span style="color:white;">Your Charges for All Other Settlement Services</span></td>
</tr>
<tr>
<td>3.  Required services that we select <br /> These charges are for services we require to complete your settlement. <br /> We will choose the providers of these services.
<table width="100%" class="table_outer" border="1" summary="Required services that we select">
<tr><td class="SC_header">Service</td><td class="SC_header">Charge</td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE1_DESC" value="#copied_struct.P2_03_USERSERVICE1_DESC#" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE1_AMOUNT" value="#copied_struct.P2_03_USERSERVICE1_AMOUNT#" onChange="re_add_form();" /></td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE2_DESC" value="#copied_struct.P2_03_USERSERVICE2_DESC#" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE2_AMOUNT" value="#copied_struct.P2_03_USERSERVICE2_AMOUNT#" onChange="re_add_form();" /></td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE3_DESC" value="#copied_struct.P2_03_USERSERVICE3_DESC#" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE3_AMOUNT" value="#copied_struct.P2_03_USERSERVICE3_AMOUNT#" onChange="re_add_form();" /></td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE4_DESC" value="#copied_struct.P2_03_USERSERVICE4_DESC#" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE4_AMOUNT" value="#copied_struct.P2_03_USERSERVICE4_AMOUNT#" onChange="re_add_form();" /></td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE5_DESC" value="#copied_struct.P2_03_USERSERVICE5_DESC#" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE5_AMOUNT" value="#copied_struct.P2_03_USERSERVICE5_AMOUNT#" onChange="re_add_form();" /></td></tr>
</table>
</td>
<td valign="bottom"><input type="text" class="user" name="P2_03_TOTAL" value="#copied_struct.P2_03_TOTAL#" onFocus="this.blur();" /></td>
</tr>
<tr>
<td>4.  Title services and lender's title insurance <br /> This charge includes the services of a title or settlement agent, for example, and title insurance to protect the lender, if required.</td>
<td valign="bottom"><input type="text" class="text" name="P2_04_TITLESERVICES" value="#copied_struct.P2_04_TITLESERVICES#" onChange="re_add_form();" /></td>
</tr>
<tr>
<td>5.  Owner's title insurance <br /> You may purchase an owner's title insurance policy to protect your interest in the property.</td>
<td valign="bottom"><input type="text" class="text" name="P2_05_OWNERSTITLEINS" value="#copied_struct.P2_05_OWNERSTITLEINS#" onChange="re_add_form();" /></td>
</tr>
<tr>
<td>6.  Required services that you can shop for <br /> These charges are for other services that are required to complete your settlement.  We can identify providers of these services or you can shop for them yourself.  Our estimates for providing these services are below.
<table width="100%" class="table_outer" border="1" summary="Required services that we select">
<tr><td class="SC_header">Service</td><td class="SC_header">Charge</td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE1_DESC" value="#copied_struct.P2_06_USERSERVICE1_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE1_AMOUNT" value="#copied_struct.P2_06_USERSERVICE1_AMOUNT#" onChange="re_add_form();" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE2_DESC" value="#copied_struct.P2_06_USERSERVICE2_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE2_AMOUNT" value="#copied_struct.P2_06_USERSERVICE2_AMOUNT#" onChange="re_add_form();" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE3_DESC" value="#copied_struct.P2_06_USERSERVICE3_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE3_AMOUNT" value="#copied_struct.P2_06_USERSERVICE3_AMOUNT#" onChange="re_add_form();" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE4_DESC" value="#copied_struct.P2_06_USERSERVICE4_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE4_AMOUNT" value="#copied_struct.P2_06_USERSERVICE4_AMOUNT#" onChange="re_add_form();" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE5_DESC" value="#copied_struct.P2_06_USERSERVICE5_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE5_AMOUNT" value="#copied_struct.P2_06_USERSERVICE5_AMOUNT#" onChange="re_add_form();" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE6_DESC" value="#copied_struct.P2_06_USERSERVICE6_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE6_AMOUNT" value="#copied_struct.P2_06_USERSERVICE6_AMOUNT#" onChange="re_add_form();" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE7_DESC" value="#copied_struct.P2_06_USERSERVICE7_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE7_AMOUNT" value="#copied_struct.P2_06_USERSERVICE7_AMOUNT#" onChange="re_add_form();" /></td></tr>
</table>
</td>
<td valign="bottom"><input type="text" class="user" name="P2_06_TOTAL" value="#copied_struct.P2_06_TOTAL#" onFocus="this.blur();" /></td>
</tr>
<tr>
<td>7.  Government recording charges <br /> These charges are for state and local fees to record your loan and title documents. </td>
<td valign="bottom"><input type="text" class="text" name="P2_07_GOVTRECCHARGE" value="#copied_struct.P2_07_GOVTRECCHARGE#" onChange="re_add_form();" /></td>
</tr>
<tr>
<td>8.  Transfer taxes <br /> These charges are for state and local fees on mortgages and home sales.</td>
<td valign="bottom"><input type="text" class="text" name="P2_08_TRANSFERTAX" value="#copied_struct.P2_08_TRANSFERTAX#" onChange="re_add_form();" /></td>
</tr>
<tr>
<td>9.  Initial deposit for your escrow account <br /> This charge is held in an escrow
account to pay future recurring charges on your property and includes
<input type="checkbox" name="P2_09_INCLUDES" value="PROPTAX" <cfif copied_struct.P2_09_INCLUDES contains 'PROPTAX'>checked</cfif> /> all property taxes,
<input type="checkbox" name="P2_09_INCLUDES" value="INS" <cfif copied_struct.P2_09_INCLUDES contains 'INS'>checked</cfif> /> all insurance, and
<input type="checkbox" name="P2_09_INCLUDES" value="OTHER" <cfif copied_struct.P2_09_INCLUDES contains 'OTHER'>checked</cfif> /> other. </td>
<td valign="bottom"><input type="text" class="text" name="P2_09_ESCROWDEPOSIT" value="#copied_struct.P2_09_ESCROWDEPOSIT#" onChange="re_add_form();" /></td>
</tr>
<tr>
<td>10.  Daily interest charges <br /> This charge is for the daily interest
on your loan from the day of your settlement until the first day of the next
month or the first day of your normal mortgage payment cycle.  This amount is
$<input type="text" class="text" name="P2_10_INTERESTPERDAY" value="#copied_struct.P2_10_INTERESTPERDAY#" onChange="re_add_form();" /> per day for
<input type="text" class="text" name="P2_10_INTERESTDAYS" value="#copied_struct.P2_10_INTERESTDAYS#" onChange="re_add_form();" />days (if your settlement is
<input type="text" class="text" name="P2_10_SETTLEMENTDATE" value="#DateFormat(copied_struct.P2_10_SETTLEMENTDATE, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic4'),document.all('P2_10_SETTLEMENTDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic4" style="POSITION: relative"></A>). </td>
<td valign="bottom"><input type="text" class="text" name="P2_10_DAILYINTERESTCHARGES" value="#copied_struct.P2_10_DAILYINTERESTCHARGES#" /> </td>
</tr>
<tr>
<td>11.  Homeowner's insurance <br /> This charge is for the insurance you must buy for the property to protect from a loss, such as fire.
<table width="100%" class="table_outer" border="1" summary="Required services that we select">
<tr><td class="SC_header">Service</td><td class="SC_header">Charge</td></tr>
<tr><td><input type="text" class="user" name="P2_11_USERSERVICE1_DESC" value="#copied_struct.P2_11_USERSERVICE1_DESC#" /></td>
<td><input type="text" class="user" name="P2_11_USERSERVICE1_AMOUNT" value="#copied_struct.P2_11_USERSERVICE1_AMOUNT#" onChange="re_add_form();" /></td></tr>
<tr><td><input type="text" class="user" name="P2_11_USERSERVICE2_DESC" value="#copied_struct.P2_11_USERSERVICE2_DESC#" /></td>
<td><input type="text" class="user" name="P2_11_USERSERVICE2_AMOUNT" value="#copied_struct.P2_11_USERSERVICE2_AMOUNT#"onChange="re_add_form();"  /></td></tr>
</table>
</td>
<td valign="bottom"><input type="text" class="user" name="P2_11_TOTAL" value="#copied_struct.P2_11_TOTAL#" onFocus="this.blur();" /></td>
</tr>
</table><!-- TABLE: Your Charges for All Other Settlement Services -->
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="B (1K)" src="../images/B.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Charges for All Other Settlement Services</td>
<td class="bordered"><input type="text" class="user" name="P2_B_TOTAL" value="#NumberFormat(copied_struct.P2_B_TOTAL, '___.__')#" onFocus="this.blur();" /></td>
</tr>
</table>
<table border="0" summary="Total of your settlement charges">
<tr>
<td><img alt="AplusB (1K)" src="../images/AplusB.png" height="31" width="76" /></td>
<td class="black" width="100%">Total Estimated Settlement Charges</td>
<td class="bordered"><input type="text" class="user" name="P2_AB_TOTAL" value="#NumberFormat(copied_struct.P2_AB_TOTAL, '___.__')#" onFocus="this.blur();" /></td>
</tr>
</table>

<P CLASS="pagebreak"> <!-- PAGE BREAK (printing) -->

</td>
</tr>

<!-- Instructions -->
<tr>
<td valign="top" class="left_text"><b>Instructions</b> <br /> Understanding <br /> which charges <br /> can change <br /> at settlement <br /> </td>
<td>This GFE estimates your settlement charges.  At your settlement, you will receive a HUD-1, a form that lists your actual costs.  Compare the charges on the HUD-1 with the charges on this GFE.  Charges can change if you select your own provider and do not use the companies we identify.  (See below for details.)
<!-- TABLE: Understanding which charges can change at settlement -->
<table border="1" class="table_data" summary="Understanding which charges can change at settlement.">
<tr>
<td width="33%" class="table_header">These charges
cannot increase
at settlement:</td>
<td width="33%" class="table_header">The total of these charges
can increase up to 10%
at settlement:</td>
<td width="33%" class="table_header">These charges
can change
at settlement:</td>
</tr>
<tr>
<td valign="top">
<li>Our origination charge</li>
<li>Your credit or charge (points) for the specific interest rate chosen (after you lock in your interest rate)</li>
<li>Your adjusted origination charges (after you lock in your interest rate)</li>
<li>Transfer taxes</li>
</td>
<td valign="top">
<li>Required services that we select</li>
<li>Title services and lender's title insurance (if we select them or you use companies we identify)</li>
Owner's title insurance (if you use companies we identify)</li>
Required services that you can shop for (if you use companies we identify)</li>
<li>Government recording charges</li>
</td>
<td valign="top">
<li>Required services that you can shop for (if you do not use companies we identify)</li>
<li>Title services and lender's title insurance (if you do not use companies we identify)</li>
<li>Owner's title insurance (if you do not use companies we identify)</li>
<li>Initial deposit for your escrow account</li>
<li>Daily interest charges</li>
<li>Homeowner's insurance</li>
</td>
</tr>
</table><!-- TABLE: Understanding which charges can change at settlement -->
</td>
</tr>

<!-- Tradeoff Table -->
<tr>
<td valign="top" class="left_text">Using the <br /> tradeoff table </td>
<td>In this GFE, we offered you this loan with a particular interest rate and estimated settlement charges.  However:
If you want to choose this same loan with lower settlement charges, then you will have a higher interest rate.
If you want to choose this same loan with a lower interest rate, then you will have higher settlement charge
If you would like to choose an available option, you must ask us for a new GFE.
Loan originators have the option to complete this table.  Please ask for additional information if the table is not completed.
<table class="table_outer" border="1" summary="Tradeoff Table">
<tr>
<td width="40">&nbsp;</td>
<td class="table_header" width="20%">The loan in this GFE</td>
<td class="table_header" width="20%">The same loan with lower settlement charges</td>
<td class="table_header" width="20%">The same loan with a lower interest rate</td>
</tr>
<tr>
<td>Your initial loan amount</td>
<td>$ <input type="text" class="usersmall" name="P3_TRADEOFF_LOANAMOUNT" value="#copied_struct.P3_TRADEOFF_LOANAMOUNT#" onChange="document.gfe_form.P1_LOANAMOUNT.value=document.gfe_form.P3_TRADEOFF_LOANAMOUNT.value; document.gfe_form.P3_INITIAL_LOAN_AMOUNT.value=document.gfe_form.P3_TRADEOFF_LOANAMOUNT.value;" /></td>
<td>$ <input type="text" class="usersmall" name="P3_TRADEOFF_LOANAMOUNT2" value="#copied_struct.P3_TRADEOFF_LOANAMOUNT2#" /></td>
<td>$ <input type="text" class="usersmall" name="P3_TRADEOFF_LOANAMOUNT3" value="#copied_struct.P3_TRADEOFF_LOANAMOUNT3#" /></td>
</tr>
<tr>
<td>Your initial interest rate*</td>
<td><input type="text" class="usersmall" name="P3_TRADEOFF_INITIALINTEREST" id="P3_TRADEOFF_INITIALINTEREST" value="#copied_struct.P3_TRADEOFF_INITIALINTEREST#"  />%</td>
<td><input type="text" class="usersmall" name="P3_TRADEOFF_INITIALINTEREST2" value="#copied_struct.P3_TRADEOFF_INITIALINTEREST2#" />%</td>
<td><input type="text" class="usersmall" name="P3_TRADEOFF_INITIALINTEREST3" value="#copied_struct.P3_TRADEOFF_INITIALINTEREST3#" />%</td>
</tr>
<tr>
<td>Your initial monthly amount owed</td>
<td>$<input type="text" class="usersmall" name="P3_TRADEOFF_MONTHLYAMOUNT" value="#copied_struct.P3_TRADEOFF_MONTHLYAMOUNT#" /></td>
<td>$<input type="text" class="usersmall" name="P3_TRADEOFF_MONTHLYAMOUNT2" value="#copied_struct.P3_TRADEOFF_MONTHLYAMOUNT2#" /></td>
<td>$<input type="text" class="usersmall" name="P3_TRADEOFF_MONTHLYAMOUNT3" value="#copied_struct.P3_TRADEOFF_MONTHLYAMOUNT3#" /></td>
</tr>
<tr>
<td>Change in the monthly amount owed from
this GFE</td>
<td>No change</td>
<td><input type="text" class="usersmall" name="P3_TRADEOFF_CHANGEMONTHLY2" value="#copied_struct.P3_TRADEOFF_CHANGEMONTHLY2#" />%</td>
<td><input type="text" class="usersmall" name="P3_TRADEOFF_CHANGEMONTHLY3" value="#copied_struct.P3_TRADEOFF_CHANGEMONTHLY3#" />%</td>
</tr>
<tr>
<td>Change in the amount you will pay at settlement with this interest rate</td>
<td>No change</td>
<td>Your settlement charges will be reduced by $<input type="text" class="usersmall" name="P3_TRADEOFF_CHANGESETTLEMENT2" value="#copied_struct.P3_TRADEOFF_CHANGESETTLEMENT2#" /></td>
<td>Your settlement charges will increase by $<input type="text" class="usersmall" name="P3_TRADEOFF_CHANGESETTLEMENT3" value="#copied_struct.P3_TRADEOFF_CHANGESETTLEMENT3#" /></td>
</tr>
<tr>
<td>How much your total estimated settlement charges will be</td>
<td> <input type="text" class="user" name="P3_AB_TOTAL" value="#copied_struct.P3_AB_TOTAL#" onFocus="this.blur();" /></td>
<td>$</td>
<td>$</td>
</tr>
</table>
*For an adjustable rate loan, the comparisons above are for the initial interest rate before adjustments are made.
<hr size="1">
</td>
</tr>

<!-- Shopping Cart -->
<tr>
<td valign="top" class="left_text">Using the <br /> shopping cart </td>
<td>Use this chart to compare GFEs from different loan originators.  Fill in the information by using a different column for each GFE you receive.  By comparing loan offers, you can shop for the best loan.
<table class="table_outer" border="1" width="100%" summary="Shopping Cart">
<tr>
<td width="40%"></td>
<td class="table_header" width="15%">This loan</td>
<td class="table_header" width="15%">Loan 2</td>
<td class="table_header" width="15%">Loan 3</td>
<td class="table_header" width="15%">Loan 4</td>
</tr>
<tr>
<td>Loan originator name</td>
<td><input type="text" class="usersmall" name="P3_LOAN_ORIG_NAME" value="#copied_struct.P3_LOAN_ORIG_NAME#" onFocus="this.blur();" /></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td>Initial loan amount</td>
<td><input type="text" class="usersmall" name="P3_INITIAL_LOAN_AMOUNT" value="#copied_struct.P3_INITIAL_LOAN_AMOUNT#" onFocus="this.blur();" /></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td>Loan term</td>
<td><input type="text" class="usersmall" name="P3_LOAN_TERM" value="#copied_struct.P3_LOAN_TERM#" onFocus="this.blur();" /></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td>Initial interest rate</td>
<td><input type="text" class="usersmall" name="P3_INITIAL_INTEREST" value="#copied_struct.P3_INITIAL_INTEREST#" onFocus="this.blur();" /></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td>Initial monthly amount owed</td>
<td><input type="text" class="usersmall" name="P3_INITIAL_MONTHLY" value="#copied_struct.P3_INITIAL_MONTHLY#" onFocus="this.blur();" /></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td>Rate lock period</td>
<td><input type="text" class="usersmall" name="P3_RATE_LOCK" value="#copied_struct.P3_RATE_LOCK#"  onFocus="this.blur();" /></td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<td>Can interest rate rise?</td>
<td><input type="text" class="usersmall" name="P3_RATE_RISE" value="#copied_struct.P3_RATE_RISE#" onFocus="this.blur();" /></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Can loan balance rise?</td>
<td><input type="text" class="usersmall" name="P3_LOAN_BALANCE_RISE" value="#copied_struct.P3_LOAN_BALANCE_RISE#" onFocus="this.blur();" /></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Can monthly amount owed rise?</td>
<td><input type="text" class="usersmall" name="P3_MONTHLY_RISE" value="#copied_struct.P3_MONTHLY_RISE#" onFocus="this.blur();" /></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Prepayment penalty?</td>
<td><input type="text" class="usersmall" name="P3_PREPAY_PENALTY" value="#copied_struct.P3_PREPAY_PENALTY#" onFocus="this.blur();" /></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Balloon payment?</td>
<td><input type="text" class="usersmall" name="P3_BALLOON_PAYMENT" value="#copied_struct.P3_BALLOON_PAYMENT#" onFocus="this.blur();" /></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="table_header">Total Estimated Settlement Charges</td>
<td><input type="text" class="user" name="P3_AB_TOTAL_2" value="#NumberFormat(copied_struct.P3_AB_TOTAL_2, '___.__')#" onFocus="this.blur();" /></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>
</td>
</tr>

<!-- Sold Loans -->
<tr>
<td valign="top" class="left_text">If your loan is <br /> sold in the future </td>
<td>Some lenders may sell your loan after settlement.  Any fees lenders receive in the future cannot change the loan you receive or the charges you paid at settlement.</td>
</tr>

</table> <!-- Settlement Charges Form -->
<div align="right">Click Here to Commit Your Changes: <input type=image src="../admin_area/images/button_modify.gif" border=0></div>
</FORM>

</div> <!-- page_container -->

</body>
</html>
</cfoutput>


<cfabort>

<!--- old file starts below --->
<!---

<cfset dateCalendarStart = "01/01/2010">
<cfset dateCalendarEnd = "12/31/2012">
<cfparam name="uid" default="">
<cfparam name="lo_id" default="">
<cfparam name="rec_id" default="0">


<CFQUERY datasource="#request.dsn#" NAME="get_title_data">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_gfe_data">
			SELECT *
			FROM GFE_DATA
			WHERE Title_ID = #rec_id#
		</CFQUERY>


<cfoutput>
<html>
<head>
<title>Good Faith Estimate (GFE)</title>
<script type="text/javascript" language="javascript" src="https://www.firsttitleservices.com/admin_area/calendar/calendar.js"></script>
<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:10px;}
textarea { font-family:arial,sans-serif; font-size:10px; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; width:180px;  }
input.user { font-size:10px; width:160px;  }
.calculated {font-size:10px; width:160px; color:##804000; background:##ffff80; border:1px dotted ##400000;  }
P.pagebreak {page-break-before:always;}
.spacer { clear:both; }
.page_container { width:670px; }
.float_left { float:left; }
.silver { background-color:silver; }
.bsilver { border:1px solid black; background-color:silver; }
.black { background-color:black; color:white; }
.bordered { border:1px solid black; }
.left_text { font-size:14px; }
.left_text_italic { font-style:italic; }
.SC_header { font-weight:bold; font-style:italic; }
.table_header { background-color:black; color:white; }
.table_data { border:1px solid black; }
.page_title{font-size:20px;}

<cfif isDefined('form.populatevarnames')>
.page_container { width:1000px; }
textarea { font-family:arial,sans-serif; font-size:10px; color:##004000; background:##cdfed0; border:1px dotted ##004000; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; width:180px; color:##004000;background:##cdfed0; border:1px dotted ##004000; }
input.user { font-size:10px; width:180px; color:##400000; background:##ffdfdf; border:1px dotted ##400000; }
input.two_digit { width:180px}
input.date { width:180px; }
-->
</style>
	<cfset fieldlist=form.fieldnames>
	<cfset fieldlist=ListDeleteAt(fieldlist,ListFindNoCase(fieldlist,'POPULATEVARNAMES'))>
	<script type="text/javascript" language="JavaScript"><!--
		function writeName() {
		<cfloop list="#fieldlist#" index="i">document.gfe_form.#i#.value = '#i#';
		</cfloop> }
	//--></script>
	</head>
	<title>Good Faith Estimate (GFE)</title><body onload="writeName();">
<cfelse>
-->
</style>
	</head>
	<body>
</cfif>


<IFRAME STYLE="display:none;position:absolute;width:157;height:158;z-index=100" ID="CalFrame" MARGINHEIGHT=0 MARGINWIDTH=0 NORESIZE FRAMEBORDER=0 SCROLLING=NO SRC="https://www.firsttitleservices.com/calendar/popup_calendar.html"></IFRAME>

<div class="page_container">
<span class="page_title">Good Faith Estimate</span>
<form action="GFE_2010_modify_submit.cfm" method="post" name="gfe_form">
<input type="hidden" name="rec_id" value="#rec_id#" >
<!--- <input type="submit" name="populatevarnames" value="Populate Variable Names" >
<input type="submit" name="clearvarnames" value="Clear Variable Names" >
 --->
<!---  <br /><br /><br />

	<cfif isDefined('form.fieldnames')>
		<span class="page_title">#ListLen(form.fieldnames)# Form Fields Found</span>
		<br />
		<span class="left_text"><em>click below for details</em></span>
		<cfset structVarList=StructCopy(#form#)>
		<cfset boolDeleteSuccess=StructDelete(structVarList, "FIELDNAMES")>
		<cfdump var="#structVarList#" expand="false" label="Form Scope Dump (FORM.FIELDNAMES removed)">
	<cfelse>
		<span class="page_title">Press the button to populate the variable names. </span>
	</cfif>

<br /><br /><br />
 --->



<!-- HEADER
<img alt="HUD Logo" src="HUD%20Logo.png" height="75" width="80" />
<div style="position:absolute;top:24;left:82"><span class="page_title">Good Faith Estimate (GFE)</span></div>
<div style="position:absolute;top:23;left:518"><span>OMB Approval No. 2502-0265</span></div>

-->

<!-- Originator Information -->
<div class="float_left" style="position:relative;left:80px;">
<table class="table_data" border="1" width="330" cellpadding="0" cellspacing="0" summary="Originator Information">
<tr><td>Name of Originator</td><td><input type="text" class="text" name="P1_ORIGINATOR" value="#get_gfe_data.P1_ORIGINATOR#" /></td></tr>
<tr><td>Originator <br /> Address</td><td><textarea rows="2" cols="40" name="P1_ORIGINATORADDY">#get_gfe_data.P1_ORIGINATORADDY#</textarea></td></tr>
<tr><td>Originator Phone Num</td><td><input type="text" class="text" name="P1_ORIGINATORPHONE" value="#get_gfe_data.P1_ORIGINATORPHONE#" /></td></tr>
<tr><td>Originator Email</td><td><input type="text" class="text" name="P1_ORIGINATOREMAIL" value="#get_gfe_data.P1_ORIGINATOREMAIL#" /></td></tr>
</table>
</div>

<!-- Borrower Information -->
<div class="float_left" style="position:relative;left:200px;">
<table class="table_data"  border="1" width="330" cellpadding="0" cellspacing="0" summary="Borrower Information">
<tr><td>Borrower  </td><td> <input type="text" class="text" name="P1_BORROWER"  value="#get_gfe_data.P1_BORROWER#" /></td></tr>
<tr><td> Property Address: </td><td>
<input type="text" class="text" name="P1_PROPERTYSTREET" value="#get_gfe_data.P1_PROPERTYSTREET#" /> <br />
<input type="text" class="text" name="P1_PROPERTYSTREET2" value="#get_gfe_data.P1_PROPERTYSTREET2#" /> <br />
<input type="text" class="text" name="P1_PROPERTYCOUNTY" value="#get_gfe_data.P1_PROPERTYCOUNTY#" /> <br />
<input type="text" class="text" name="P1_PROPERTYCITY" value="#get_gfe_data.P1_PROPERTYCITY#" /> <br />
<input type="text" class="text" name="P1_PROPERTYSTATE" value="#get_gfe_data.P1_PROPERTYSTATE#" /> <br />
<input type="text" class="text" name="P1_PROPERTYZIP" value="#get_gfe_data.P1_PROPERTYZIP#" />

</td></tr>

<tr><td>Date of GFE</td><td><input type="text" class="text" name="P1_GFEDATE" value="#DateFormat(get_gfe_data.P1_GFEDATE, 'm/d/yyyy')#" />
<A href="javascript:ShowCalendar(document.all('calpic'),document.all('P1_GFEDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A>
</td></tr>
</table>
</div>

<div class="spacer"><br /></div>

<!-- Settlement Charges Form (This table contains the rest of the form) -->
<table class="table_outer" border="0" width="100%" summary="Settlement Charges Form">

<!-- Purpose -->
<tr>
<td valign="top" class="left_text" width="150">Purpose</td>
<td>This GFE gives you an estimate of your settlement charges and loan terms if you are approved for
this loan. For more information, see HUD's Special Information Booklet on settlement charges, your
Truth-in-Lending Disclosures, and other consumer information at www.hud.gov/respa. If you decide
you would like to proceed with this loan, contact us.
<hr size="1" />
</td>
</tr>

<!-- Shopping -->
<tr>
<td valign="top" class="left_text">Shopping for <br /> your loan</td>
<td>Only you can shop for the best loan for you. Compare this GFE with other loan offers, so you can find
the best loan. Use the shopping chart on page 3 to compare all the offers you receive.
<hr size="1" />
</td>
</tr>

<!-- Dates -->
<tr>
<td valign="top" class="left_text">Important dates</td>
<td>
<ol>
<li>The interest rate for this GFE is available through
<input type="text" class="text" name="P1_INTERESTAVAILABLEDATE" value="#DateFormat(get_gfe_data.P1_INTERESTAVAILABLEDATE, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic5'),document.all('P1_INTERESTAVAILABLEDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic5" style="POSITION: relative"></A>.
After this time, the interest rate, some of your loan Origination Charges, and the monthly payment shown below can change until you lock your interest rate.</li>
<li>This estimate for all other settlement charges is available through
<input type="text" class="text" name="P1_ESTIMATEAVAILABLEDATE" value="#DateFormat(get_gfe_data.P1_ESTIMATEAVAILABLEDATE, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic6'),document.all('P1_ESTIMATEAVAILABLEDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic6" style="POSITION: relative"></A>.</li>
<li>After you lock your interest rate, you must go to settlement within
<input type="text" class="text" name="P1_AFTERLOCKMINDAYS" value="#get_gfe_data.P1_AFTERLOCKMINDAYS#" /> days (your rate lock period)to receive the locked interest rate.</li>
<li>You must lock the interest rate at least
<input type="text" class="text" name="P1_INTERESTLOCKMINDAYS" value="#get_gfe_data.P1_INTERESTLOCKMINDAYS#" /> days before settlement.</li>
</ol>
<hr size="1" />
</td>
</tr>

<!-- Loan Summary -->
<tr>
<td valign="top" class="left_text">Summary of <br /> your loan</td>
<td>
<table class="table_data" width="100%" border="1" summary="Summary of your loan">
<tr>
<td width="50%">Your initial loan amount is</td>
<td width="50%" colspan="2">$<input type="text" class="text" name="P1_LOANAMOUNT" value="#get_gfe_data.P1_LOANAMOUNT#" /></td>
</tr>
<tr>
<td width="50%">Your loan term is</td>
<td width="50%" colspan="2"><input type="text" class="text" name="P1_LOANTERM" value="#get_gfe_data.P1_LOANTERM#" /> years</td>
</tr>
<tr>
<td width="50%">Your initial interest rate is</td>
<td width="50%" colspan="2"><input type="text" class="text" name="P1_INTERESTRATE" value="#get_gfe_data.P1_INTERESTRATE#" />%</td>
</tr>
<tr>
<td width="50%">Your initial monthly amount owed for principal,interest, and any mortgage insurance is</td>
<td width="50%" colspan="2">$<input type="text" class="text" name="P1_OWEDMONTHLY" value="#get_gfe_data.P1_OWEDMONTHLY#" /> per month</td>
</tr>
<tr>
<td width="50%">Can your interest rate rise?</td>
<td><input type="radio" name="P1_INTERESTCANRISE" VALUE="NO" checked />No</td>
<td width="40%"><input type="radio" name="P1_INTERESTCANRISE" VALUE="YES" />Yes, it can rise to a maximum of
<input type="text" class="text" name="P1_INTERESTCANRISE_MAX" value="#get_gfe_data.P1_INTERESTCANRISE_MAX#" />%. The first change will be in
<input type="text" class="text" name="P1_INTERESTCANRISE_FIRSTDATE"value="#get_gfe_data.P1_INTERESTCANRISE_FIRSTDATE#"  /><A href="javascript:ShowCalendar(document.all('calpic2'),document.all('P1_INTERESTCANRISE_FIRSTDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic2" style="POSITION: relative"></A>.</td>
</tr>
<tr>
<td width="50%">Even if you make payments on time, can your loan balance rise?</td>
<td><input type="radio" name="P1_BALANCECANRISE" VALUE="NO"  />No</td>
<td width="40%"><input type="radio" name="P1_BALANCECANRISE" VALUE="YES" checked  />Yes, it can rise to a maximum of
$<input type="text" class="text" name="P1_BALANCECANRISE_MAX" value="#get_gfe_data.P1_BALANCECANRISE_MAX#" />.</td>
</tr>
<tr>
<td width="50%">Even if you make payments on time, can your monthly amount owed for principal, interest, and any mortgage insurance rise</td>
<td><input type="radio" name="P1_MONTHLYCANRISE" VALUE="NO" checked />No</td>
<td width="40%"><input type="radio" name="P1_MONTHLYCANRISE" VALUE="YES" />Yes, the first increase can be in
<input type="text" class="text" name="P1_MONTHLYCANRISE_FIRSTDATE" value="#get_gfe_data.P1_MONTHLYCANRISE_FIRSTDATE#" /><A href="javascript:ShowCalendar(document.all('calpic3'),document.all('P1_MONTHLYCANRISE_FIRSTDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic3" style="POSITION: relative"></A> and the monthly amount owed can rise to
$<input type="text" class="text" name="P1_MONTHLYCANRISE_FIRSTMAX" value="#get_gfe_data.P1_MONTHLYCANRISE_FIRSTMAX#" /> . The maximum it can ever rise to is
$<input type="text" class="text" name="P1_MONTHLYCANRISE_MAX" value="#get_gfe_data.P1_MONTHLYCANRISE_MAX#" /> .</td>
</tr>
<tr>
<td width="50%">Does your loan have a prepayment penalty?</td>
<td><input type="radio" name="P1_PREPAYMENTPENALTY" VALUE="NO" />No</td>
<td width="40%"><input type="radio" name="P1_PREPAYMENTPENALTY" VALUE="YES" checked />Yes, your maximum prepayment penalty is
$<input type="text" class="text" name="P1_PREPAYMENTPENALTY_MAX" value="#get_gfe_data.P1_PREPAYMENTPENALTY_MAX#" />.</td>
</tr>
<tr>
<td width="50%">Does your loan have a balloon payment?</td>
<td><input type="radio" name="P1_BALLOONPAYMENT" VALUE="NO" checked />No</td>
<td width="40%"><input type="radio" name="P1_BALLOONPAYMENT" VALUE="YES" />Yes, you have a balloon payment of
$<input type="text" class="text" name="P1_BALLOONPAYMENT_AMOUNT" value="#get_gfe_data.P1_BALLOONPAYMENT_AMOUNT#" /> due in
<input type="text" class="text" name="P1_BALLOONPAYMENT_YEARSUNTIL" value="#get_gfe_data.P1_BALLOONPAYMENT_YEARSUNTIL#" />years.</td>
</tr>
</table>
</td>
</tr>

<!-- Escrow -->
<tr>
<td valign="top" class="left_text">Escrow account <br /> information</td>
<td class="table_data">Some lenders require an escrow account to hold funds for paying
 property taxes or other property related charges in addition to your monthly amount owed of
 $  <span class="calculated">calculated</span>. <br />
 Do we require you to have an escrow account for your loan? <br />
  <input type="radio" name="P1_ESCROWREQUIRED" VALUE="NO" />No, you do not have an escrow account. <br />
  <input type="radio" name="P1_ESCROWREQUIRED" VALUE="YES" checked />You must pay these charges directly when due. <br /> </td>
</tr>

<!-- Settlement Summary -->
<tr>
<td valign="top" class="left_text">Summary of your <br /> settlement charges</td>
<td>
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="A (1K)" src="A.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Adjusted Origination Charges</td>
<td class="bordered"> <span class="calculated">calculated</span></td>
</tr>
<tr>
<td><img alt="B (1K)" src="B.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Charges for All Other Settlement Services</td>
<td class="bordered"><span class="calculated">calculated</span> </td>
</tr>
</table>
<table border="0" summary="Total of your settlement charges">
<tr>
<td><img alt="AplusB (1K)" src="AplusB.png" height="31" width="76" /></td>
<td class="black" width="100%">Total Estimated Settlement Charges</td>
<td class="bordered"> <span class="calculated">calculated</span> </td>
</tr>
</table>

<P CLASS="pagebreak"> <!-- PAGE BREAK (printing) -->

</td>
</tr>

<!-- Understanding -->
<tr>
<td valign="top" class="left_text">Understanding your <br /> estimated settlement <br /> charges</td>
<td>
<!-- TABLE: Your Adjusted Origination Charges -->
<table border="1" class="table_data" summary="Your Adjusted Origination Charges" width="100%">
<tr>
<td colspan="3" bgcolor="black" ><span style="color:white;">Your Adjusted Origination Charges</span></td>
</tr>
<tr>
<td colspan="2" width="100%">1. Our origination charge <br /> This charge is for getting this loan for you.</td>
<td><input type="text" class="text" name="P2_01_ORIGINATIONCHARGE" value="#get_gfe_data.P2_01_ORIGINATIONCHARGE#" /></td>
</tr>
<tr>
<td colspan="2">
<!-- TABLE: Your credit or charge -->
<table class="table_data" summary="Your credit or charge">
<tr>
<td colspan="2"> 2.  Your credit or charge (points) for the specific interest rate chosen</td>
</tr>
<tr>
<td><input type="radio" name="P2_02_POINTS" value="INC" /></td>
<td>The credit or charge for the interest rate of
 <input type="text" class="text" name="P2_02_POINTSINCRATE" value="#get_gfe_data.P2_02_POINTSINCRATE#" />% is included in "Our origination charge."  (See item 1 above.)</td>
</tr>
<tr><td><input type="radio" name="P2_02_POINTS" value="REC" /></td>
<td>You receive a credit of
$<input type="text" class="text" name="P2_02_POINTSRECAMOUNT" value="#get_gfe_data.P2_02_POINTSRECAMOUNT#" /> for this interest rate of
<input type="text" class="text" name="P2_02_POINTSRECRATE" value="#get_gfe_data.P2_02_POINTSRECRATE#" />%.  This credit reduces your settlement charges.</td>
</tr>
<tr>
<td><input type="radio" name="P2_02_POINTS" value="PAY" checked /></td>
<td>You pay a charge of
$<input type="text" class="text" name="P2_02_POINTSPAYAMOUNT" value="#get_gfe_data.P2_02_POINTSPAYAMOUNT#" /> for this interest rate of
<input type="text" class="text" name="P2_02_POINTSPAYRATE" value="#get_gfe_data.P2_02_POINTSPAYRATE#" />%. 		 This charge (points) increases your total settlement charges.</td></tr>
<tr>
<td colspan="2">The tradeoff table on page 3 shows that you can change your total settlement charges by choosing a different interest rate for this loan.</td>
</tr>
</table><!-- TABLE: Your credit or charge -->
</td>
<td valign="bottom"><input type="text" class="text" name="P2_02_POINTSAMOUNT" value="#get_gfe_data.P2_02_POINTSAMOUNT#" /></td>
</tr>
</table><!-- TABLE: Your Adjusted Origination Charges -->
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="A (1K)" src="A.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Adjusted Origination Charges</td>
<td class="bordered"><input type="text" class="text" name="P2_ADJUSTED_ORIGINATION_CHARGES" value="#get_gfe_data.P2_ADJUSTED_ORIGINATION_CHARGES#" /></td>
</tr>
</table>
</td>
</tr>

<!-- Other Settlement Services -->
<tr>
<td valign="top" class="left_text_italic">Some of these charges can  <br /> change at settlement.  See<br /> the instructions section for <br /> more information.</td>
<td>
<!-- TABLE: Your Charges for All Other Settlement Services -->
<table border="1" class="table_data" summary="Your Charges for All Other Settlement Services" width="100%">
<tr>
<td colspan="2" bgcolor="black" ><span style="color:white;">Your Charges for All Other Settlement Services</span></td>
</tr>
<tr>
<td>3.  Required services that we select <br /> These charges are for services we require to complete your settlement. <br /> We will choose the providers of these services.
<table width="100%" class="table_outer" border="1" summary="Required services that we select">
<tr><td class="SC_header">Service</td><td class="SC_header">Charge</td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE1_DESC" value="#get_gfe_data.P2_03_USERSERVICE1_DESC#" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE1_AMOUNT" value="#get_gfe_data.P2_03_USERSERVICE1_AMOUNT#" /></td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE2_DESC" value="#get_gfe_data.P2_03_USERSERVICE2_DESC#" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE2_AMOUNT" value="#get_gfe_data.P2_03_USERSERVICE2_AMOUNT#" /></td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE3_DESC" value="#get_gfe_data.P2_03_USERSERVICE3_DESC#" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE3_AMOUNT" value="#get_gfe_data.P2_03_USERSERVICE3_AMOUNT#" /></td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE4_DESC" value="#get_gfe_data.P2_03_USERSERVICE4_DESC#" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE4_AMOUNT" value="#get_gfe_data.P2_03_USERSERVICE4_AMOUNT#" /></td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE5_DESC" value="#get_gfe_data.P2_03_USERSERVICE5_DESC#" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE5_AMOUNT" value="#get_gfe_data.P2_03_USERSERVICE5_AMOUNT#" /></td></tr>
</table>
</td>
<td valign="bottom"><input type="text" class="user" name="P2_03_TOTAL" value="#get_gfe_data.P2_03_TOTAL#" /></td>
</tr>
<tr>
<td>4.  Title services and lender's title insurance <br /> This charge includes the services of a title or settlement agent, for example, and title insurance to protect the lender, if required.</td>
<td valign="bottom"><input type="text" class="text" name="P2_04_TITLESERVICES" value="#get_gfe_data.P2_04_TITLESERVICES#" /></td>
</tr>
<tr>
<td>5.  Owner's title insurance <br /> You may purchase an owner's title insurance policy to protect your interest in the property.</td>
<td valign="bottom"><input type="text" class="text" name="P2_05_OWNERSTITLEINS" value="#get_gfe_data.P2_05_OWNERSTITLEINS#" /></td>
</tr>
<tr>
<td>6.  Required services that you can shop for <br /> These charges are for other services that are required to complete your settlement.  We can identify providers of these services or you can shop for them yourself.  Our estimates for providing these services are below.
<table width="100%" class="table_outer" border="1" summary="Required services that we select">
<tr><td class="SC_header">Service</td><td class="SC_header">Charge</td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE1_DESC" value="#get_gfe_data.P2_06_USERSERVICE1_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE1_AMOUNT" value="#get_gfe_data.P2_06_USERSERVICE1_AMOUNT#" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE2_DESC" value="#get_gfe_data.P2_06_USERSERVICE2_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE2_AMOUNT" value="#get_gfe_data.P2_06_USERSERVICE2_AMOUNT#" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE3_DESC" value="#get_gfe_data.P2_06_USERSERVICE3_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE3_AMOUNT" value="#get_gfe_data.P2_06_USERSERVICE3_AMOUNT#" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE4_DESC" value="#get_gfe_data.P2_06_USERSERVICE4_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE4_AMOUNT" value="#get_gfe_data.P2_06_USERSERVICE4_AMOUNT#" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE5_DESC" value="#get_gfe_data.P2_06_USERSERVICE5_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE5_AMOUNT" value="#get_gfe_data.P2_06_USERSERVICE5_AMOUNT#" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE6_DESC" value="#get_gfe_data.P2_06_USERSERVICE6_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE6_AMOUNT" value="#get_gfe_data.P2_06_USERSERVICE6_AMOUNT#" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE7_DESC" value="#get_gfe_data.P2_06_USERSERVICE7_DESC#" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE7_AMOUNT" value="#get_gfe_data.P2_06_USERSERVICE7_AMOUNT#" /></td></tr>
</table>
</td>
<td valign="bottom"><input type="text" class="user" name="P2_06_TOTAL" value="#get_gfe_data.P2_06_TOTAL#" /></td>
</tr>
<tr>
<td>7.  Government recording charges <br /> These charges are for state and local fees to record your loan and title documents. </td>
<td valign="bottom"><input type="text" class="text" name="P2_07_GOVTRECCHARGE" value="#get_gfe_data.P2_07_GOVTRECCHARGE#" /></td>
</tr>
<tr>
<td>8.  Transfer taxes <br /> These charges are for state and local fees on mortgages and home sales.</td>
<td valign="bottom"><input type="text" class="text" name="P2_08_TRANSFERTAX" value="#get_gfe_data.P2_08_TRANSFERTAX#" /></td>
</tr>
<tr>
<td>9.  Initial deposit for your escrow account <br /> This charge is held in an escrow
account to pay future recurring charges on your property and includes
<input type="checkbox" name="P2_09_INCLUDEPROPTAX" CHECKED /> all property taxes,
<input type="checkbox" name="P2_09_INCLUDEINS" CHECKED /> all insurance, and
<input type="checkbox" name="P2_09_INCLUDEOTHER" CHECKED /> other. </td>
<td valign="bottom"><input type="text" class="text" name="P2_09_ESCROWDEPOSIT" value="#get_gfe_data.P2_09_ESCROWDEPOSIT#" /></td>
</tr>
<tr>
<td>10.  Daily interest charges <br /> This charge is for the daily interest
on your loan from the day of your settlement until the first day of the next
month or the first day of your normal mortgage payment cycle.  This amount is
$<input type="text" class="text" name="P2_10_INTERESTPERDAY" value="#get_gfe_data.P2_10_INTERESTPERDAY#" /> per day for
<input type="text" class="text" name="P2_10_INTERESTDAYS" value="#get_gfe_data.P2_10_INTERESTDAYS#" />days (if your settlement is
<input type="text" class="text" name="P2_10_SETTLEMENTDATE" value="#DateFormat(get_gfe_data.P2_10_SETTLEMENTDATE, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic4'),document.all('P2_10_SETTLEMENTDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic4" style="POSITION: relative"></A>). </td>
<td valign="bottom"><input type="text" class="text" name="P2_10_DAILYINTERESTCHARGES" value="#get_gfe_data.P2_10_DAILYINTERESTCHARGES#" /> </td>
</tr>
<tr>
<td>11.  Homeowner's insurance <br /> This charge is for the insurance you must buy for the property to protect from a loss, such as fire.
<table width="100%" class="table_outer" border="1" summary="Required services that we select">
<tr><td class="SC_header">Service</td><td class="SC_header">Charge</td></tr>
<tr><td><input type="text" class="user" name="P2_11_USERSERVICE1_DESC" value="#get_gfe_data.P2_11_USERSERVICE1_DESC#" /></td>
<td><input type="text" class="user" name="P2_11_USERSERVICE1_AMOUNT" value="#get_gfe_data.P2_11_USERSERVICE1_AMOUNT#" /></td></tr>
<tr><td><input type="text" class="user" name="P2_11_USERSERVICE2_DESC" value="#get_gfe_data.P2_11_USERSERVICE2_DESC#" /></td>
<td><input type="text" class="user" name="P2_11_USERSERVICE2_AMOUNT" value="#get_gfe_data.P2_11_USERSERVICE2_AMOUNT#" /></td></tr>
</table>
</td>
<td valign="bottom"><input type="text" class="user" name="P2_11_TOTAL" value="#get_gfe_data.P2_11_TOTAL#" /></td>
</tr>
</table><!-- TABLE: Your Charges for All Other Settlement Services -->
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="B (1K)" src="B.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Charges for All Other Settlement Services</td>
<td class="bordered"><input type="text" class="user" name="P2_B_TOTAL" value="#get_gfe_data.P2_B_TOTAL#" /></td>
</tr>
</table>
<table border="0" summary="Total of your settlement charges">
<tr>
<td><img alt="AplusB (1K)" src="AplusB.png" height="31" width="76" /></td>
<td class="black" width="100%">Total Estimated Settlement Charges</td>
<td class="bordered"><input type="text" class="user" name="P2_AB_TOTAL" value="#get_gfe_data.P2_AB_TOTAL#" /></td>
</tr>
</table>

<P CLASS="pagebreak"> <!-- PAGE BREAK (printing) -->

</td>
</tr>

<!-- Instructions -->
<tr>
<td valign="top" class="left_text"><b>Instructions</b> <br /> Understanding <br /> which charges <br /> can change <br /> at settlement <br /> </td>
<td>This GFE estimates your settlement charges.  At your settlement, you will receive a HUD-1, a form that lists your actual costs.  Compare the charges on the HUD-1 with the charges on this GFE.  Charges can change if you select your own provider and do not use the companies we identify.  (See below for details.)
<!-- TABLE: Understanding which charges can change at settlement -->
<table border="1" class="table_data" summary="Understanding which charges can change at settlement.">
<tr>
<td width="33%" class="table_header">These charges
cannot increase
at settlement:</td>
<td width="33%" class="table_header">The total of these charges
can increase up to 10%
at settlement:</td>
<td width="33%" class="table_header">These charges
can change
at settlement:</td>
</tr>
<tr>
<td valign="top">
<li>Our origination charge</li>
<li>Your credit or charge (points) for the specific interest rate chosen (after you lock in your interest rate)</li>
<li>Your adjusted origination charges (after you lock in your interest rate)</li>
<li>Transfer taxes</li>
</td>
<td valign="top">
<li>Required services that we select</li>
<li>Title services and lender's title insurance (if we select them or you use companies we identify)</li>
Owner's title insurance (if you use companies we identify)</li>
Required services that you can shop for (if you use companies we identify)</li>
<li>Government recording charges</li>
</td>
<td valign="top">
<li>Required services that you can shop for (if you do not use companies we identify)</li>
<li>Title services and lender's title insurance (if you do not use companies we identify)</li>
<li>Owner's title insurance (if you do not use companies we identify)</li>
<li>Initial deposit for your escrow account</li>
<li>Daily interest charges</li>
<li>Homeowner's insurance</li>
</td>
</tr>
</table><!-- TABLE: Understanding which charges can change at settlement -->
</td>
</tr>

<!-- Tradeoff Table -->
<tr>
<td valign="top" class="left_text">Using the <br /> tradeoff table </td>
<td>In this GFE, we offered you this loan with a particular interest rate and estimated settlement charges.  However:
If you want to choose this same loan with lower settlement charges, then you will have a higher interest rate.
If you want to choose this same loan with a lower interest rate, then you will have higher settlement charge
If you would like to choose an available option, you must ask us for a new GFE.
Loan originators have the option to complete this table.  Please ask for additional information if the table is not completed.
<table class="table_outer" border="1" summary="Tradeoff Table">
<tr>
<td>&nbsp;</td>
<td class="table_header">The loan in this GFE</td>
<td class="table_header">The same loan with lower settlement charges</td>
<td class="table_header">The same loan with a lower interest rate</td>
</tr>
<tr>
<td>Your initial loan amount</td>
<td>$ <span class="calculated">calculated</span> </td>
<td>$</td>
<td>$</td>
</tr>
<tr>
<td>Your initial interest rate*</td>
<td> <span class="calculated">calculated</span> %</td>
<td align="right">%</td>
<td align="right">%</td>
</tr>
<tr>
<td>Your initial monthly amount owed</td>
<td>$ <span class="calculated">calculated</span> </td>
<td>$</td>
<td>$</td>
</tr>
<tr>
<td>Change in the monthly amount owed from
this GFE</td>
<td>No change</td>
<td>You will pay $<input type="text" value="" /> more every month</td>
<td>You will pay $<input type="text" value="" /> less every month</td>
</tr>
<tr>
<td>Change in the amount you will pay at settlement with this interest rate</td>
<td>No change</td>
<td>Your settlement charges will be reduced by $<input type="text" value="" /></td>
<td>Your settlement charges will increase by $<input type="text" value="" /></td>
</tr>
<tr>
<td>How much your total estimated settlement charges will be</td>
<td> <span class="calculated">calculated</span></td>
<td>$</td>
<td>$</td>
</tr>
</table>
*For an adjustable rate loan, the comparisons above are for the initial interest rate before adjustments are made.
<hr size="1">
</td>
</tr>

<!-- Shopping Cart -->
<tr>
<td valign="top" class="left_text">Using the <br /> shopping cart </td>
<td>Use this chart to compare GFEs from different loan originators.  Fill in the information by using a different column for each GFE you receive.  By comparing loan offers, you can shop for the best loan.
<table class="table_outer" border="1" width="100%" summary="Shopping Cart">
<tr>
<td></td>
<td class="table_header">This loan</td>
<td class="table_header">Loan 2</td>
<td class="table_header">Loan 3</td>
<td class="table_header">Loan 4</td>
</tr>
<tr>
<td>Loan originator name</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Initial loan amount</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Loan term</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Initial interest rate</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Initial monthly amount owed</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Rate lock period</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Can interest rate rise?</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Can loan balance rise?</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Can monthly amount owed rise?</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Prepayment penalty?</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Balloon payment?</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="table_header">Total Estimated Settlement Charges</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>
</td>
</tr>

<!-- Sold Loans -->
<tr>
<td valign="top" class="left_text">If your loan is <br /> sold in the future </td>
<td>Some lenders may sell your loan after settlement.  Any fees lenders receive in the future cannot change the loan you receive or the charges you paid at settlement.</td>
</tr>

</table> <!-- Settlement Charges Form -->
<div align="right">Click Here to Commit Your Changes: <input type=image src="./images/button_modify.gif" border=0></div>
</FORM>

</div> <!-- page_container -->

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
</html>
</cfoutput>

--->