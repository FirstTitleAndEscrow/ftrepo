
<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
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
<cfparam name="form.P1_GFEDATE" default="">
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
<cfparam name="form.P1_LENDERESCROW" default="">
<cfparam name="form.P1_ESCROWREQUIRED" default="">
<cfparam name="form.P1_ADJUSTED_ORIGINATION_CHARGES" default="">
<cfparam name="form.P1_B_TOTAL" default="">
<cfparam name="form.P1_AB_TOTAL" default="">
<cfparam name="form.P2_01_ORIGINATIONCHARGE" default="">
<cfparam name="form.P2_02_POINTS" default="">
<cfparam name="form.P2_02_POINTSINCRATE" default="">
<cfparam name="form.P2_02_POINTSRECAMOUNT" default="">
<cfparam name="form.P2_02_POINTSRECRATE" default="">
<cfparam name="form.P2_02_POINTSPAYAMOUNT" default="">
<cfparam name="form.P2_02_POINTSPAYRATE" default="">
<cfparam name="form.P2_02_POINTSAMOUNT" default="">
<cfparam name="form.P2_ADJUSTED_ORIGINATION_CHARGES" default="">
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
<cfparam name="form.P2_09_ESCROWDEPOSIT" default="">
<cfparam name="form.P2_09_INCLUDES" default="">
<cfparam name="form.P2_10_INTERESTPERDAY" default="">
<cfparam name="form.P2_10_INTERESTDAYS" default="">
<cfparam name="form.P2_10_SETTLEMENTDATE" default="">
<cfparam name="form.P2_10_DAILYINTERESTCHARGES" default="">
<cfparam name="form.P2_11_USERSERVICE1_DESC" default="">
<cfparam name="form.P2_11_USERSERVICE1_AMOUNT" default="">
<cfparam name="form.P2_11_USERSERVICE2_DESC" default="">
<cfparam name="form.P2_11_USERSERVICE2_AMOUNT" default="">
<cfparam name="form.P2_11_TOTAL" default="">
<cfparam name="form.P2_B_TOTAL" default="">
<cfparam name="form.P2_AB_TOTAL" default="">
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
<cfparam name="form.P3_AB_TOTAL" default="">
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
<cfparam name="form.P3_AB_TOTAL_2" default="">
<cfparam name="form.rec_id" default=0>



<cfif form.rec_id eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_GFE">
Insert into SAVED_GFEs_2010 (c_time, c_date)
values ('#c_time#', '#c_date#')
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_GFE">
select * from SAVED_GFEs_2010 
where c_time = '#c_time#'
and c_date = '#c_date#'
</CFQUERY>
<cfelse>
<cfset get_gfe.rec_id = form.rec_id>
</cfif>

<cfset gfe_data_fields = "P1_ORIGINATOR,P1_ORIGINATORADDY,P1_ORIGINATORPHONE,P1_ORIGINATOREMAIL,P1_BORROWER,P1_PROPERTYSTREET,P1_PROPERTYSTREET2,P1_PROPERTYCOUNTY,P1_PROPERTYCITY,P1_PROPERTYSTATE,P1_PROPERTYZIP,P1_GFEDATE,P1_INTERESTAVAILABLEDATE,P1_ESTIMATEAVAILABLEDATE,P1_AFTERLOCKMINDAYS,P1_INTERESTLOCKMINDAYS,P1_LOANAMOUNT,P1_LOANTERM,P1_INTERESTRATE,P1_OWEDMONTHLY,P1_INTERESTCANRISE,P1_INTERESTCANRISE_MAX,P1_INTERESTCANRISE_FIRSTDATE,P1_BALANCECANRISE,P1_BALANCECANRISE_MAX,P1_MONTHLYCANRISE,P1_MONTHLYCANRISE_FIRSTDATE,P1_MONTHLYCANRISE_FIRSTMAX,P1_MONTHLYCANRISE_MAX,P1_PREPAYMENTPENALTY,P1_PREPAYMENTPENALTY_MAX,P1_BALLOONPAYMENT,P1_BALLOONPAYMENT_AMOUNT,P1_BALLOONPAYMENT_YEARSUNTIL,P1_LENDERESCROW,P1_ESCROWREQUIRED,P1_ADJUSTED_ORIGINATION_CHARGES,P1_B_TOTAL,P1_AB_TOTAL,P2_01_ORIGINATIONCHARGE,P2_02_POINTS,P2_02_POINTSINCRATE,P2_02_POINTSRECAMOUNT,P2_02_POINTSRECRATE,P2_02_POINTSPAYAMOUNT,P2_02_POINTSPAYRATE,P2_02_POINTSAMOUNT,P2_ADJUSTED_ORIGINATION_CHARGES,P2_03_USERSERVICE1_DESC,P2_03_USERSERVICE1_AMOUNT,P2_03_USERSERVICE2_DESC,P2_03_USERSERVICE2_AMOUNT,P2_03_USERSERVICE3_DESC,P2_03_USERSERVICE3_AMOUNT,P2_03_USERSERVICE4_DESC,P2_03_USERSERVICE4_AMOUNT,P2_03_USERSERVICE5_DESC,P2_03_USERSERVICE5_AMOUNT,P2_03_TOTAL,P2_04_TITLESERVICES,P2_05_OWNERSTITLEINS,P2_06_USERSERVICE1_DESC,P2_06_USERSERVICE1_AMOUNT,P2_06_USERSERVICE2_DESC,P2_06_USERSERVICE2_AMOUNT,P2_06_USERSERVICE3_DESC,P2_06_USERSERVICE3_AMOUNT,P2_06_USERSERVICE4_DESC,P2_06_USERSERVICE4_AMOUNT,P2_06_USERSERVICE5_DESC,P2_06_USERSERVICE5_AMOUNT,P2_06_USERSERVICE6_DESC,P2_06_USERSERVICE6_AMOUNT,P2_06_USERSERVICE7_DESC,P2_06_USERSERVICE7_AMOUNT,P2_06_TOTAL,P2_07_GOVTRECCHARGE,P2_08_TRANSFERTAX,P2_09_ESCROWDEPOSIT,P2_09_INCLUDES,P2_10_INTERESTPERDAY,P2_10_INTERESTDAYS,P2_10_SETTLEMENTDATE,P2_10_DAILYINTERESTCHARGES,P2_11_USERSERVICE1_DESC,P2_11_USERSERVICE1_AMOUNT,P2_11_USERSERVICE2_DESC,P2_11_USERSERVICE2_AMOUNT,P2_11_TOTAL,P2_B_TOTAL,P2_AB_TOTAL,P3_TRADEOFF_LOANAMOUNT,P3_TRADEOFF_LOANAMOUNT2,P3_TRADEOFF_LOANAMOUNT3,P3_TRADEOFF_INITIALINTEREST,P3_TRADEOFF_INITIALINTEREST2,P3_TRADEOFF_INITIALINTEREST3,P3_TRADEOFF_MONTHLYAMOUNT,P3_TRADEOFF_MONTHLYAMOUNT2,P3_TRADEOFF_MONTHLYAMOUNT3,P3_TRADEOFF_CHANGEMONTHLY2,P3_TRADEOFF_CHANGEMONTHLY3,P3_TRADEOFF_CHANGESETTLEMENT2,P3_TRADEOFF_CHANGESETTLEMENT3,P3_AB_TOTAL,P3_LOAN_ORIG_NAME,P3_INITIAL_LOAN_AMOUNT,P3_LOAN_TERM,P3_INITIAL_INTEREST,P3_INITIAL_MONTHLY,P3_RATE_LOCK,P3_RATE_RISE,P3_LOAN_BALANCE_RISE,P3_MONTHLY_RISE,P3_PREPAY_PENALTY,P3_BALLOON_PAYMENT,P3_AB_TOTAL_2">

<CFQUERY datasource="#request.dsn#" NAME="update_gfe_data">
Update SAVED_GFEs_2010 set
<cfloop index="i" list="#gfe_data_fields#" delimiters=","><cfif #i# contains 'DATE'>
<cfif Trim(Evaluate(#i#)) eq ''>
#i# = NULL,
<cfelse>
#i# = '#Trim(ReplaceNoCase(Evaluate("form.#i#"), "'", "", "ALL"))#',
</cfif>
<cfelse>#i# = '#Trim(ReplaceNoCase(Evaluate("form.#i#"), "'", "", "ALL"))#',</cfif></cfloop>
blank_field = ''
Where rec_id = #get_gfe.rec_id#
</cfquery>
<cfparam name="form.viewprint" default=0>
<cfparam name="form.sendemail" default=0>
<cfif form.viewprint eq 1>
<cfset viewprint = 1>
<cfelse>
<cfset viewprint = 0>
</cfif>
<cfif form.sendemail eq 1 and Len(form.email_to_send)>
<cfset sendemail = 1>
<cfset form.sendtoaddr = #form.email_to_send#>
<cfelse>
<cfset sendemail = 0>
<cfset sendtoaddr = "">
</cfif>

<cflocation url="GFE_2010_modify.cfm?rec_id=#get_gfe.rec_id#&viewprint=#viewprint#&sendemail=#sendemail#&sendtoaddr=#sendtoaddr#">




