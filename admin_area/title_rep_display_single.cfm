<CFQUERY DATASOURCE="#request.dsn#" NAME="get_va_comps">
SELECT     c.ID from companies c, first_admin f
where f.va_employee = 'True'
and f.ID = c.intSales
</CFQUERY>


<cfset va_companies = ValueList(get_va_comps.id, ",")>


<cfparam name="number" default="">
<CFSET r_count = "0">
<cfoutput>

<CFIF IsDefined("form.number")>
	<cfif #number# NEQ "NONE">
		<CFSET number = #number#>
	</cfif>
</CFIF>

</cfoutput>

<!---Function to strip the 023 off of the property ID --->
<cfif IsNumeric(number)>
<CFIF Len(#number#) gt 5>
	<CFIF #mid(form.number,1,1)# eq 0>
		<CFset #number_length# = Len(#number#)-4>
		<CFset #number# = right(#number#,#number_length#)>
	</CFIF>
</CFIF>
</CFIF>


<!---Function to strip the 210 off of the appraisal ID --->
<cfif IsNumeric(number)>
<CFIF Len(#number#) gt 5>
	<CFIF #mid(form.number,1,3)# eq 210>
		<CFset #number_length# = Len(#number#)-3>
		<CFset #number# = right(#number#,#number_length#)>
	</CFIF>
</CFIF>
</CFIF>

<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">




<CFQUERY DATASOURCE="#request.dsn#" NAME="read_report">
SELECT     *
FROM         Title t INNER JOIN
                      Companies c ON t.comp_id = c.ID
WHERE     (<cfif not isDefined("url.comp_id")>(t.cancelled IS NULL and t.oda_year > 2004) AND (<cfif IsNumeric(number)>(t.Title_ID = #number#) OR
                      </cfif>(t.cancelled IS NULL) AND (t.blastname1 LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.blastname2 LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.paddress LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.loan_number LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.reo_number LIKE '%#number#%') OR
		      (t.cancelled IS NULL) AND (t.realec_transactionID LIKE '%#number#%'))</cfif>	
<CFIF #read_user.role_id# eq 24 or read_user.fairfax_admin eq 1 or read_user.tx_admin eq 1 or read_user.ft_fairfax_admin eq 1>
		And (c.id IN(#companylist#) or t.pstate = 'TX')
<CFELSEIF #read_user.va_employee# eq 'True'>
		And (c.id IN(#va_companies#))
</CFIF>
<CFIF #read_user.id# eq 319 or #read_user.id# eq 426 or #read_user.id# eq 320 or #read_user.id# eq 322 or #read_user.id# eq 339 or #read_user.id# eq 324 or #read_user.id# eq 359>
		And (t.order_date > '7/15/2008')
</CFIF>
<CFIF read_user.mi_admin eq 1 or read_user.mo_admin eq 1 or read_user.mi_flushing_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#))
</CFIF>
<cfif isDefined("url.comp_id")>
	c.id = #url.comp_id#
</cfif>
)
</CFQUERY>

<cfset found_ids = ValueList(read_report.title_id, ",")>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_internal_processor_report">
SELECT     *
FROM         Title t INNER JOIN
                      Companies c ON t.comp_id = c.ID
WHERE     (<cfif not isDefined("url.comp_id")>(t.cancelled IS NULL and t.oda_year > 2004) AND (<cfif IsNumeric(number)>(t.Title_ID = #number#) OR
                      </cfif>(t.ip_id = #session.ft_user_id#) AND (t.cancelled IS NULL) AND (t.blastname1 LIKE '%#number#%') OR
(t.ip_id = #session.ft_user_id#) AND (t.cancelled IS NULL) AND (t.blastname2 LIKE '%#number#%') OR
(t.ip_id = #session.ft_user_id#) AND (t.cancelled IS NULL) AND (t.paddress LIKE '%#number#%') OR
(t.ip_id = #session.ft_user_id#) AND (t.cancelled IS NULL) AND (t.loan_number LIKE '%#number#%') OR
(t.ip_id = #session.ft_user_id#) AND (t.cancelled IS NULL) AND (t.reo_number LIKE '%#number#%') OR
(t.ip_id = #session.ft_user_id#) AND (t.cancelled IS NULL) AND (t.realec_transactionID LIKE '%#number#%')</cfif>
))
</CFQUERY>

<cfoutput query="read_internal_processor_report">
<Cfif ListFindNoCase(found_ids, read_internal_processor_report.title_id, ",") eq 0> 
<cfset temp = QueryAddRow(read_report)>
<cfset Temp = QuerySetCell(read_report, "AADDRESS", #read_internal_processor_report.AADDRESS#)>
<cfset Temp = QuerySetCell(read_report, "ACITY", #read_internal_processor_report.ACITY#)>
<cfset Temp = QuerySetCell(read_report, "ADDR1", #read_internal_processor_report.ADDR1#)>
<cfset Temp = QuerySetCell(read_report, "ADDR2", #read_internal_processor_report.ADDR2#)>
<cfset Temp = QuerySetCell(read_report, "ALLOW_CHICAGO_RATES", #read_internal_processor_report.ALLOW_CHICAGO_RATES#)>
<cfset Temp = QuerySetCell(read_report, "ALLOW_CHICAGO_RATES2", #read_internal_processor_report.ALLOW_CHICAGO_RATES2#)>
<cfset Temp = QuerySetCell(read_report, "ALLOW_REISSUE_RATES", #read_internal_processor_report.ALLOW_REISSUE_RATES#)>
<cfset Temp = QuerySetCell(read_report, "ALLOW_SUBRATES", #read_internal_processor_report.ALLOW_SUBRATES#)>
<cfset Temp = QuerySetCell(read_report, "ALTA_8_1", #read_internal_processor_report.ALTA_8_1#)>
<cfset Temp = QuerySetCell(read_report, "ALTA_9", #read_internal_processor_report.ALTA_9#)>
<cfset Temp = QuerySetCell(read_report, "ANAME", #read_internal_processor_report.ANAME#)>
<cfset Temp = QuerySetCell(read_report, "APPRAISAL_FEE", #read_internal_processor_report.APPRAISAL_FEE#)>
<cfset Temp = QuerySetCell(read_report, "APPRAISAL_STATUS", #read_internal_processor_report.APPRAISAL_STATUS#)>
<cfset Temp = QuerySetCell(read_report, "APPRAISED_VALUE", #read_internal_processor_report.APPRAISED_VALUE#)>
<cfset Temp = QuerySetCell(read_report, "ASSESSED_VALUE", #read_internal_processor_report.ASSESSED_VALUE#)>
<cfset Temp = QuerySetCell(read_report, "ASSET_MANAGER", #read_internal_processor_report.ASSET_MANAGER#)>
<cfset Temp = QuerySetCell(read_report, "ASTATE", #read_internal_processor_report.ASTATE#)>
<cfset Temp = QuerySetCell(read_report, "ATTACH_EANDO", #read_internal_processor_report.ATTACH_EANDO#)>
<cfset Temp = QuerySetCell(read_report, "ATTACH_ICL", #read_internal_processor_report.ATTACH_ICL#)>
<cfset Temp = QuerySetCell(read_report, "AUTO_EMAIL_OPT_OUT", #read_internal_processor_report.AUTO_EMAIL_OPT_OUT#)>
<cfset Temp = QuerySetCell(read_report, "AVMCLIENTID", #read_internal_processor_report.AVMCLIENTID#)>
<cfset Temp = QuerySetCell(read_report, "AVMPRODUCT", #read_internal_processor_report.AVMPRODUCT#)>
<cfset Temp = QuerySetCell(read_report, "AVMPROID", #read_internal_processor_report.AVMPROID#)>
<cfset Temp = QuerySetCell(read_report, "AWAITINGCONTRACT", #read_internal_processor_report.AWAITINGCONTRACT#)>
<cfset Temp = QuerySetCell(read_report, "AZIP", #read_internal_processor_report.AZIP#)>
<cfset Temp = QuerySetCell(read_report, "A_1101", #read_internal_processor_report.A_1101#)>
<cfset Temp = QuerySetCell(read_report, "A_1102", #read_internal_processor_report.A_1102#)>
<cfset Temp = QuerySetCell(read_report, "A_1103", #read_internal_processor_report.A_1103#)>
<cfset Temp = QuerySetCell(read_report, "A_1104", #read_internal_processor_report.A_1104#)>
<cfset Temp = QuerySetCell(read_report, "A_1105", #read_internal_processor_report.A_1105#)>
<cfset Temp = QuerySetCell(read_report, "A_1106", #read_internal_processor_report.A_1106#)>
<cfset Temp = QuerySetCell(read_report, "A_1107", #read_internal_processor_report.A_1107#)>
<cfset Temp = QuerySetCell(read_report, "A_1111", #read_internal_processor_report.A_1111#)>
<cfset Temp = QuerySetCell(read_report, "A_1112", #read_internal_processor_report.A_1112#)>
<cfset Temp = QuerySetCell(read_report, "A_1113", #read_internal_processor_report.A_1113#)>
<cfset Temp = QuerySetCell(read_report, "A_1205", #read_internal_processor_report.A_1205#)>
<cfset Temp = QuerySetCell(read_report, "A_1303", #read_internal_processor_report.A_1303#)>
<cfset Temp = QuerySetCell(read_report, "A_1304", #read_internal_processor_report.A_1304#)>
<cfset Temp = QuerySetCell(read_report, "A_1305", #read_internal_processor_report.A_1305#)>
<cfset Temp = QuerySetCell(read_report, "A_COMMENT", #read_internal_processor_report.A_COMMENT#)>
<cfset Temp = QuerySetCell(read_report, "A_COMMENT", #read_internal_processor_report.A_COMMENT#)>
<cfset Temp = QuerySetCell(read_report, "A_DATE", #read_internal_processor_report.A_DATE#)>
<cfset Temp = QuerySetCell(read_report, "A_DATE_MOD", #read_internal_processor_report.A_DATE_MOD#)>
<cfset Temp = QuerySetCell(read_report, "A_DAY", #read_internal_processor_report.A_DAY#)>
<cfset Temp = QuerySetCell(read_report, "A_DAY_OF_YEAR", #read_internal_processor_report.A_DAY_OF_YEAR#)>
<cfset Temp = QuerySetCell(read_report, "A_INSERT_DATE", #read_internal_processor_report.A_INSERT_DATE#)>
<cfset Temp = QuerySetCell(read_report, "A_INSERT_TIME", #read_internal_processor_report.A_INSERT_TIME#)>
<cfset Temp = QuerySetCell(read_report, "A_MONTH", #read_internal_processor_report.A_MONTH#)>
<cfset Temp = QuerySetCell(read_report, "A_NOTE_1", #read_internal_processor_report.A_NOTE_1#)>
<cfset Temp = QuerySetCell(read_report, "A_PASS", #read_internal_processor_report.A_PASS#)>
<cfset Temp = QuerySetCell(read_report, "A_STATES", #read_internal_processor_report.A_STATES#)>
<cfset Temp = QuerySetCell(read_report, "A_STATUS", #read_internal_processor_report.A_STATUS#)>
<cfset Temp = QuerySetCell(read_report, "A_TIME", #read_internal_processor_report.A_TIME#)>
<cfset Temp = QuerySetCell(read_report, "A_TIME_MOD", #read_internal_processor_report.A_TIME_MOD#)>
<cfset Temp = QuerySetCell(read_report, "A_UID", #read_internal_processor_report.A_UID#)>
<cfset Temp = QuerySetCell(read_report, "A_UID_MOD", #read_internal_processor_report.A_UID_MOD#)>
<cfset Temp = QuerySetCell(read_report, "A_USER", #read_internal_processor_report.A_USER#)>
<cfset Temp = QuerySetCell(read_report, "A_YEAR", #read_internal_processor_report.A_YEAR#)>
<cfset Temp = QuerySetCell(read_report, "B1EMAIL", #read_internal_processor_report.B1EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "B1MSTATUS", #read_internal_processor_report.B1MSTATUS#)>
<cfset Temp = QuerySetCell(read_report, "B2EMAIL", #read_internal_processor_report.B2EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "B2MSTATUS", #read_internal_processor_report.B2MSTATUS#)>
<cfset Temp = QuerySetCell(read_report, "B3EMAIL", #read_internal_processor_report.B3EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "B3MSTATUS", #read_internal_processor_report.B3MSTATUS#)>
<cfset Temp = QuerySetCell(read_report, "B4EMAIL", #read_internal_processor_report.B4EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "B4MSTATUS", #read_internal_processor_report.B4MSTATUS#)>
<cfset Temp = QuerySetCell(read_report, "BANKRUPTCY_DC", #read_internal_processor_report.BANKRUPTCY_DC#)>
<cfset Temp = QuerySetCell(read_report, "BANKRUPTCY_FL", #read_internal_processor_report.BANKRUPTCY_FL#)>
<cfset Temp = QuerySetCell(read_report, "BANKRUPTCY_MD", #read_internal_processor_report.BANKRUPTCY_MD#)>
<cfset Temp = QuerySetCell(read_report, "BANKRUPTCY_PA", #read_internal_processor_report.BANKRUPTCY_PA#)>
<cfset Temp = QuerySetCell(read_report, "BANKRUPTCY_REG", #read_internal_processor_report.BANKRUPTCY_REG#)>
<cfset Temp = QuerySetCell(read_report, "BANKRUPTCY_VA", #read_internal_processor_report.BANKRUPTCY_VA#)>
<cfset Temp = QuerySetCell(read_report, "BASIC", #read_internal_processor_report.BASIC#)>
<cfset Temp = QuerySetCell(read_report, "BEXT1", #read_internal_processor_report.BEXT1#)>
<cfset Temp = QuerySetCell(read_report, "BEXT2", #read_internal_processor_report.BEXT2#)>
<cfset Temp = QuerySetCell(read_report, "BEXT3", #read_internal_processor_report.BEXT3#)>
<cfset Temp = QuerySetCell(read_report, "BEXT4", #read_internal_processor_report.BEXT4#)>
<cfset Temp = QuerySetCell(read_report, "BFIRSTNAME1", #read_internal_processor_report.BFIRSTNAME1#)>
<cfset Temp = QuerySetCell(read_report, "BFIRSTNAME2", #read_internal_processor_report.BFIRSTNAME2#)>
<cfset Temp = QuerySetCell(read_report, "BFIRSTNAME3", #read_internal_processor_report.BFIRSTNAME3#)>
<cfset Temp = QuerySetCell(read_report, "BFIRSTNAME4", #read_internal_processor_report.BFIRSTNAME4#)>
<cfset Temp = QuerySetCell(read_report, "BHPHONE1", #read_internal_processor_report.BHPHONE1#)>
<cfset Temp = QuerySetCell(read_report, "BHPHONE2", #read_internal_processor_report.BHPHONE2#)>
<cfset Temp = QuerySetCell(read_report, "BHPHONE3", #read_internal_processor_report.BHPHONE3#)>
<cfset Temp = QuerySetCell(read_report, "BHPHONE4", #read_internal_processor_report.BHPHONE4#)>
<cfset Temp = QuerySetCell(read_report, "BLASTNAME1", #read_internal_processor_report.BLASTNAME1#)>
<cfset Temp = QuerySetCell(read_report, "BLASTNAME2", #read_internal_processor_report.BLASTNAME2#)>
<cfset Temp = QuerySetCell(read_report, "BLASTNAME3", #read_internal_processor_report.BLASTNAME3#)>
<cfset Temp = QuerySetCell(read_report, "BLASTNAME4", #read_internal_processor_report.BLASTNAME4#)>
<cfset Temp = QuerySetCell(read_report, "BLNAPPRAISAL", #read_internal_processor_report.BLNAPPRAISAL#)>
<cfset Temp = QuerySetCell(read_report, "BLNCLEARC", #read_internal_processor_report.BLNCLEARC#)>
<cfset Temp = QuerySetCell(read_report, "BLNCOMMIT", #read_internal_processor_report.BLNCOMMIT#)>
<cfset Temp = QuerySetCell(read_report, "BLNDISBURSEMENTS", #read_internal_processor_report.BLNDISBURSEMENTS#)>
<cfset Temp = QuerySetCell(read_report, "BLNFULLSERV", #read_internal_processor_report.BLNFULLSERV#)>
<cfset Temp = QuerySetCell(read_report, "BLNPAYOFF", #read_internal_processor_report.BLNPAYOFF#)>
<cfset Temp = QuerySetCell(read_report, "BLNRECORDING", #read_internal_processor_report.BLNRECORDING#)>
<cfset Temp = QuerySetCell(read_report, "BLNREPORT", #read_internal_processor_report.BLNREPORT#)>
<cfset Temp = QuerySetCell(read_report, "BLNSHIPPING", #read_internal_processor_report.BLNSHIPPING#)>
<cfset Temp = QuerySetCell(read_report, "BLNSIGNING", #read_internal_processor_report.BLNSIGNING#)>
<cfset Temp = QuerySetCell(read_report, "BMINAME1", #read_internal_processor_report.BMINAME1#)>
<cfset Temp = QuerySetCell(read_report, "BMINAME2", #read_internal_processor_report.BMINAME2#)>
<cfset Temp = QuerySetCell(read_report, "BMINAME3", #read_internal_processor_report.BMINAME3#)>
<cfset Temp = QuerySetCell(read_report, "BMINAME4", #read_internal_processor_report.BMINAME4#)>
<cfset Temp = QuerySetCell(read_report, "BORROWER1_DOB", #read_internal_processor_report.BORROWER1_DOB#)>
<cfset Temp = QuerySetCell(read_report, "BORROWER2_DOB", #read_internal_processor_report.BORROWER2_DOB#)>
<cfset Temp = QuerySetCell(read_report, "BORROWER3_DOB", #read_internal_processor_report.BORROWER3_DOB#)>
<cfset Temp = QuerySetCell(read_report, "BORROWER4_DOB", #read_internal_processor_report.BORROWER4_DOB#)>
<cfset Temp = QuerySetCell(read_report, "BORROWER_OWNS", #read_internal_processor_report.BORROWER_OWNS#)>
<cfset Temp = QuerySetCell(read_report, "BRANCH_ID", #read_internal_processor_report.BRANCH_ID#)>
<cfset Temp = QuerySetCell(read_report, "BRANCH_MANAGER_CELL_PHONE", #read_internal_processor_report.BRANCH_MANAGER_CELL_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "BRANCH_MANAGER_DAY_PHONE", #read_internal_processor_report.BRANCH_MANAGER_DAY_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "BRANCH_MANAGER_EMAIL", #read_internal_processor_report.BRANCH_MANAGER_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "BRANCH_MANAGER_EVE_PHONE", #read_internal_processor_report.BRANCH_MANAGER_EVE_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "BRANCH_MANAGER_FAX", #read_internal_processor_report.BRANCH_MANAGER_FAX#)>
<cfset Temp = QuerySetCell(read_report, "BRANCH_MANAGER_NAME", #read_internal_processor_report.BRANCH_MANAGER_NAME#)>
<cfset Temp = QuerySetCell(read_report, "BRANCH_MANAGER_PAGER", #read_internal_processor_report.BRANCH_MANAGER_PAGER#)>
<cfset Temp = QuerySetCell(read_report, "BSSN1", #read_internal_processor_report.BSSN1#)>
<cfset Temp = QuerySetCell(read_report, "BSSN2", #read_internal_processor_report.BSSN2#)>
<cfset Temp = QuerySetCell(read_report, "BSSN3", #read_internal_processor_report.BSSN3#)>
<cfset Temp = QuerySetCell(read_report, "BSSN4", #read_internal_processor_report.BSSN4#)>
<cfset Temp = QuerySetCell(read_report, "BTC_CLOSING_PACKAGE_UPLOAD", #read_internal_processor_report.BTC_CLOSING_PACKAGE_UPLOAD#)>
<cfset Temp = QuerySetCell(read_report, "BTC_CLOSING_PACKAGE_UPLOAD_DATE", #read_internal_processor_report.BTC_CLOSING_PACKAGE_UPLOAD_DATE#)>
<cfset Temp = QuerySetCell(read_report, "BULK_RATE_APPLIED", #read_internal_processor_report.BULK_RATE_APPLIED#)>
<cfset Temp = QuerySetCell(read_report, "BULK_RATE_APPLIED_NATIC", #read_internal_processor_report.BULK_RATE_APPLIED_NATIC#)>
<cfset Temp = QuerySetCell(read_report, "BWPHONE1", #read_internal_processor_report.BWPHONE1#)>
<cfset Temp = QuerySetCell(read_report, "BWPHONE2", #read_internal_processor_report.BWPHONE2#)>
<cfset Temp = QuerySetCell(read_report, "BWPHONE3", #read_internal_processor_report.BWPHONE3#)>
<cfset Temp = QuerySetCell(read_report, "BWPHONE4", #read_internal_processor_report.BWPHONE4#)>
<cfset Temp = QuerySetCell(read_report, "CALYXDC_ID", #read_internal_processor_report.CALYXDC_ID#)>
<cfset Temp = QuerySetCell(read_report, "CALYX_REFER", #read_internal_processor_report.CALYX_REFER#)>
<cfset Temp = QuerySetCell(read_report, "CALYX_REFER_OTHER", #read_internal_processor_report.CALYX_REFER_OTHER#)>
<cfset Temp = QuerySetCell(read_report, "CANCELLED", #read_internal_processor_report.CANCELLED#)>
<cfset Temp = QuerySetCell(read_report, "CAPITAL_FUND", #read_internal_processor_report.CAPITAL_FUND#)>
<cfset Temp = QuerySetCell(read_report, "CEMA", #read_internal_processor_report.CEMA#)>
<cfset Temp = QuerySetCell(read_report, "CENSUS", #read_internal_processor_report.CENSUS#)>
<cfset Temp = QuerySetCell(read_report, "CHANGED_BY_IP_ADDRESS", #read_internal_processor_report.CHANGED_BY_IP_ADDRESS#)>
<cfset Temp = QuerySetCell(read_report, "CHASE_ACCT", #read_internal_processor_report.CHASE_ACCT#)>
<cfset Temp = QuerySetCell(read_report, "CHECK_DATE", #read_internal_processor_report.CHECK_DATE#)>
<cfset Temp = QuerySetCell(read_report, "CHECK_TIME", #read_internal_processor_report.CHECK_TIME#)>
<cfset Temp = QuerySetCell(read_report, "CHILD_IDS", #read_internal_processor_report.CHILD_IDS#)>
<cfset Temp = QuerySetCell(read_report, "CITY", #read_internal_processor_report.CITY#)>
<cfset Temp = QuerySetCell(read_report, "CLEARTOCLOSE", #read_internal_processor_report.CLEARTOCLOSE#)>
<cfset Temp = QuerySetCell(read_report, "CLEARTOCLOSEREVIEW_ASSIGNEDDATE", #read_internal_processor_report.CLEARTOCLOSEREVIEW_ASSIGNEDDATE#)>
<cfset Temp = QuerySetCell(read_report, "CLEARTOCLOSEREVIEW_ASSIGNEDTOID", #read_internal_processor_report.CLEARTOCLOSEREVIEW_ASSIGNEDTOID#)>
<cfset Temp = QuerySetCell(read_report, "CLEARTOCLOSEREVIEW_COMPLETE", #read_internal_processor_report.CLEARTOCLOSEREVIEW_COMPLETE#)>
<cfset Temp = QuerySetCell(read_report, "CLIENT_COMMITMENT", #read_internal_processor_report.CLIENT_COMMITMENT#)>
<cfset Temp = QuerySetCell(read_report, "CLIENT_SYSTEM_UPDATED", #read_internal_processor_report.CLIENT_SYSTEM_UPDATED#)>
<cfset Temp = QuerySetCell(read_report, "CLIENT_UPLOAD1", #read_internal_processor_report.CLIENT_UPLOAD1#)>
<cfset Temp = QuerySetCell(read_report, "CLIENT_UPLOAD2", #read_internal_processor_report.CLIENT_UPLOAD2#)>
<cfset Temp = QuerySetCell(read_report, "CLIENT_UPLOAD3", #read_internal_processor_report.CLIENT_UPLOAD3#)>
<cfset Temp = QuerySetCell(read_report, "CLIENT_UPLOAD4", #read_internal_processor_report.CLIENT_UPLOAD4#)>
<cfset Temp = QuerySetCell(read_report, "CLOSER_CELL_PHONE", #read_internal_processor_report.CLOSER_CELL_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "CLOSER_DAY_PHONE", #read_internal_processor_report.CLOSER_DAY_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "CLOSER_EMAIL", #read_internal_processor_report.CLOSER_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "CLOSER_EVE_PHONE", #read_internal_processor_report.CLOSER_EVE_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "CLOSER_FAX", #read_internal_processor_report.CLOSER_FAX#)>
<cfset Temp = QuerySetCell(read_report, "CLOSER_NAME", #read_internal_processor_report.CLOSER_NAME#)>
<cfset Temp = QuerySetCell(read_report, "CLOSER_PAGER", #read_internal_processor_report.CLOSER_PAGER#)>
<cfset Temp = QuerySetCell(read_report, "CLOSER_PHONE", #read_internal_processor_report.CLOSER_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "CLOSINGINSIGHT_TRANSACTIONID", #read_internal_processor_report.CLOSINGINSIGHT_TRANSACTIONID#)>
<cfset Temp = QuerySetCell(read_report, "CLOSING_DELAY_COMMENTS", #read_internal_processor_report.CLOSING_DELAY_COMMENTS#)>
<cfset Temp = QuerySetCell(read_report, "CLOSING_INVOICED", #read_internal_processor_report.CLOSING_INVOICED#)>
<cfset Temp = QuerySetCell(read_report, "CLOSING_INVOICED_DATE", #read_internal_processor_report.CLOSING_INVOICED_DATE#)>
<cfset Temp = QuerySetCell(read_report, "CLOSING_OCCURRED", #read_internal_processor_report.CLOSING_OCCURRED#)>
<cfset Temp = QuerySetCell(read_report, "CLOSING_PACK_RECEIVED", #read_internal_processor_report.CLOSING_PACK_RECEIVED#)>
<cfset Temp = QuerySetCell(read_report, "CLOSING_PACK_RECEIVED_DATETIME", #read_internal_processor_report.CLOSING_PACK_RECEIVED_DATETIME#)>
<cfset Temp = QuerySetCell(read_report, "CLOSING_TYPE", #read_internal_processor_report.CLOSING_TYPE#)>
<cfset Temp = QuerySetCell(read_report, "CODET", #read_internal_processor_report.CODET#)>
<cfset Temp = QuerySetCell(read_report, "COMMENT", #read_internal_processor_report.COMMENT#)>
<cfset Temp = QuerySetCell(read_report, "COMMENTS", #read_internal_processor_report.COMMENTS#)>
<cfset Temp = QuerySetCell(read_report, "COMPANIES_SWITCH", #read_internal_processor_report.COMPANIES_SWITCH#)>
<cfset Temp = QuerySetCell(read_report, "COMPANY", #read_internal_processor_report.COMPANY#)>
<cfset Temp = QuerySetCell(read_report, "COMPANY1", #read_internal_processor_report.COMPANY1#)>
<cfset Temp = QuerySetCell(read_report, "COMPANY2", #read_internal_processor_report.COMPANY2#)>
<cfset Temp = QuerySetCell(read_report, "COMPANY2ADDR", #read_internal_processor_report.COMPANY2ADDR#)>
<cfset Temp = QuerySetCell(read_report, "COMP_CODE", #read_internal_processor_report.COMP_CODE#)>
<cfset Temp = QuerySetCell(read_report, "COMP_ID", #read_internal_processor_report.COMP_ID#)>
<cfset Temp = QuerySetCell(read_report, "CONDO_EFF_DATE", #read_internal_processor_report.CONDO_EFF_DATE#)>
<cfset Temp = QuerySetCell(read_report, "CONDO_FEE", #read_internal_processor_report.CONDO_FEE#)>
<cfset Temp = QuerySetCell(read_report, "CONDO_PUD", #read_internal_processor_report.CONDO_PUD#)>
<cfset Temp = QuerySetCell(read_report, "CONDO_TAX_AMT", #read_internal_processor_report.CONDO_TAX_AMT#)>
<cfset Temp = QuerySetCell(read_report, "CONDO_UNIT_NUM", #read_internal_processor_report.CONDO_UNIT_NUM#)>
<cfset Temp = QuerySetCell(read_report, "CONFIRM_CLOSING_COMMENTS", #read_internal_processor_report.CONFIRM_CLOSING_COMMENTS#)>
<cfset Temp = QuerySetCell(read_report, "CONTACT_FNAME", #read_internal_processor_report.CONTACT_FNAME#)>
<cfset Temp = QuerySetCell(read_report, "CONTACT_LNAME", #read_internal_processor_report.CONTACT_LNAME#)>
<cfset Temp = QuerySetCell(read_report, "CONTRACT_SALES_PRICE", #read_internal_processor_report.CONTRACT_SALES_PRICE#)>
<cfset Temp = QuerySetCell(read_report, "CONVERSION_FEE", #read_internal_processor_report.CONVERSION_FEE#)>
<cfset Temp = QuerySetCell(read_report, "CONVERTED_LOANAMT", #read_internal_processor_report.CONVERTED_LOANAMT#)>
<cfset Temp = QuerySetCell(read_report, "CONV_DC", #read_internal_processor_report.CONV_DC#)>
<cfset Temp = QuerySetCell(read_report, "CONV_FL", #read_internal_processor_report.CONV_FL#)>
<cfset Temp = QuerySetCell(read_report, "CONV_MD", #read_internal_processor_report.CONV_MD#)>
<cfset Temp = QuerySetCell(read_report, "CONV_PA", #read_internal_processor_report.CONV_PA#)>
<cfset Temp = QuerySetCell(read_report, "CONV_REG", #read_internal_processor_report.CONV_REG#)>
<cfset Temp = QuerySetCell(read_report, "CONV_VA", #read_internal_processor_report.CONV_VA#)>
<cfset Temp = QuerySetCell(read_report, "CORPORATE_DOCS_NEEDED", #read_internal_processor_report.CORPORATE_DOCS_NEEDED#)>
<cfset Temp = QuerySetCell(read_report, "CORPORATE_DOCS_RECEIVED", #read_internal_processor_report.CORPORATE_DOCS_RECEIVED#)>
<cfset Temp = QuerySetCell(read_report, "CRCLIENTID", #read_internal_processor_report.CRCLIENTID#)>

<cfset Temp = QuerySetCell(read_report, "CRPROID", #read_internal_processor_report.CRPROID#)>
<cfset Temp = QuerySetCell(read_report, "CUSTOM_FEES", #read_internal_processor_report.CUSTOM_FEES#)>
<cfset Temp = QuerySetCell(read_report, "CUSTOM_RATE_TABLE", #read_internal_processor_report.CUSTOM_RATE_TABLE#)>
<cfset Temp = QuerySetCell(read_report, "DATEANDTIME", #read_internal_processor_report.DATEANDTIME#)>
<cfset Temp = QuerySetCell(read_report, "DEEDTRANSFER", #read_internal_processor_report.DEEDTRANSFER#)>
<cfset Temp = QuerySetCell(read_report, "DEED_APPROVED", #read_internal_processor_report.DEED_APPROVED#)>
<cfset Temp = QuerySetCell(read_report, "DEED_APPROVED_DATETIME", #read_internal_processor_report.DEED_APPROVED_DATETIME#)>
<cfset Temp = QuerySetCell(read_report, "DEED_COMMENTS", #read_internal_processor_report.DEED_COMMENTS#)>
<cfset Temp = QuerySetCell(read_report, "DEED_INSTRUMENT_NUMBER", #read_internal_processor_report.DEED_INSTRUMENT_NUMBER#)>
<cfset Temp = QuerySetCell(read_report, "DEED_PREP_ASSIGNED_BY", #read_internal_processor_report.DEED_PREP_ASSIGNED_BY#)>
<cfset Temp = QuerySetCell(read_report, "DEED_PREP_ASSIGNED_DATE", #read_internal_processor_report.DEED_PREP_ASSIGNED_DATE#)>
<cfset Temp = QuerySetCell(read_report, "DEED_PREP_ASSIGNED_TO", #read_internal_processor_report.DEED_PREP_ASSIGNED_TO#)>
<cfset Temp = QuerySetCell(read_report, "DEED_PREP_COMPLETED", #read_internal_processor_report.DEED_PREP_COMPLETED#)>
<cfset Temp = QuerySetCell(read_report, "DEED_PREP_MISC", #read_internal_processor_report.DEED_PREP_MISC#)>
<cfset Temp = QuerySetCell(read_report, "DEED_PREP_UPLOAD", #read_internal_processor_report.DEED_PREP_UPLOAD#)>
<cfset Temp = QuerySetCell(read_report, "DEED_PREP_VENDOR_UPLOAD", #read_internal_processor_report.DEED_PREP_VENDOR_UPLOAD#)>
<cfset Temp = QuerySetCell(read_report, "DEED_RECEIVED", #read_internal_processor_report.DEED_RECEIVED#)>
<cfset Temp = QuerySetCell(read_report, "DEED_RECEIVED_DATETIME", #read_internal_processor_report.DEED_RECEIVED_DATETIME#)>
<cfset Temp = QuerySetCell(read_report, "DEED_RECORDING_DATE", #read_internal_processor_report.DEED_RECORDING_DATE#)>
<cfset Temp = QuerySetCell(read_report, "DEED_REQUESTED", #read_internal_processor_report.DEED_REQUESTED#)>
<cfset Temp = QuerySetCell(read_report, "DEED_REQUESTED_DATETIME", #read_internal_processor_report.DEED_REQUESTED_DATETIME#)>
<cfset Temp = QuerySetCell(read_report, "DELAY_CODE", #read_internal_processor_report.DELAY_CODE#)>
<cfset Temp = QuerySetCell(read_report, "DELINQUENCY", #read_internal_processor_report.DELINQUENCY#)>
<cfset Temp = QuerySetCell(read_report, "DIL_DC", #read_internal_processor_report.DIL_DC#)>
<cfset Temp = QuerySetCell(read_report, "DIL_FL", #read_internal_processor_report.DIL_FL#)>
<cfset Temp = QuerySetCell(read_report, "DIL_MD", #read_internal_processor_report.DIL_MD#)>
<cfset Temp = QuerySetCell(read_report, "DIL_PA", #read_internal_processor_report.DIL_PA#)>
<cfset Temp = QuerySetCell(read_report, "DIL_REG", #read_internal_processor_report.DIL_REG#)>
<cfset Temp = QuerySetCell(read_report, "DIL_VA", #read_internal_processor_report.DIL_VA#)>
<cfset Temp = QuerySetCell(read_report, "DISPOSITION_TYPE", #read_internal_processor_report.DISPOSITION_TYPE#)>
<cfset Temp = QuerySetCell(read_report, "DOCRETRIEVAL_DC", #read_internal_processor_report.DOCRETRIEVAL_DC#)>
<cfset Temp = QuerySetCell(read_report, "DOCRETRIEVAL_FL", #read_internal_processor_report.DOCRETRIEVAL_FL#)>
<cfset Temp = QuerySetCell(read_report, "DOCRETRIEVAL_MD", #read_internal_processor_report.DOCRETRIEVAL_MD#)>
<cfset Temp = QuerySetCell(read_report, "DOCRETRIEVAL_PA", #read_internal_processor_report.DOCRETRIEVAL_PA#)>
<cfset Temp = QuerySetCell(read_report, "DOCRETRIEVAL_REG", #read_internal_processor_report.DOCRETRIEVAL_REG#)>
<cfset Temp = QuerySetCell(read_report, "DOCRETRIEVAL_VA", #read_internal_processor_report.DOCRETRIEVAL_VA#)>
<cfset Temp = QuerySetCell(read_report, "DOCS_RECORDED_DATE", #read_internal_processor_report.DOCS_RECORDED_DATE#)>
<cfset Temp = QuerySetCell(read_report, "DOCUMENTS_RECORDED", #read_internal_processor_report.DOCUMENTS_RECORDED#)>
<cfset Temp = QuerySetCell(read_report, "DOCUMENT_ID", #read_internal_processor_report.DOCUMENT_ID#)>
<cfset Temp = QuerySetCell(read_report, "DO_APPRAISAL", #read_internal_processor_report.DO_APPRAISAL#)>
<cfset Temp = QuerySetCell(read_report, "DUEDATE", #read_internal_processor_report.DUEDATE#)>
<cfset Temp = QuerySetCell(read_report, "DUPE_BILLING", #read_internal_processor_report.DUPE_BILLING#)>
<cfset Temp = QuerySetCell(read_report, "EMAIL", #read_internal_processor_report.EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "EMAIL_DATE", #read_internal_processor_report.EMAIL_DATE#)>
<cfset Temp = QuerySetCell(read_report, "ENCOMPASS_CONFIRM_DATE", #read_internal_processor_report.ENCOMPASS_CONFIRM_DATE#)>
<cfset Temp = QuerySetCell(read_report, "ENCOMPASS_GFE_CONFIRM", #read_internal_processor_report.ENCOMPASS_GFE_CONFIRM#)>
<cfset Temp = QuerySetCell(read_report, "ENCOMPASS_ID", #read_internal_processor_report.ENCOMPASS_ID#)>
<cfset Temp = QuerySetCell(read_report, "ENCOMPASS_REFER", #read_internal_processor_report.ENCOMPASS_REFER#)>
<cfset Temp = QuerySetCell(read_report, "ENCOMPASS_REFER_OTHER", #read_internal_processor_report.ENCOMPASS_REFER_OTHER#)>
<cfset Temp = QuerySetCell(read_report, "ENHANCED_COVERAGE", #read_internal_processor_report.ENHANCED_COVERAGE#)>
<cfset Temp = QuerySetCell(read_report, "ENHANCED_COVERAGE", #read_internal_processor_report.ENHANCED_COVERAGE#)>
<cfset Temp = QuerySetCell(read_report, "EQUATOR_CLOSING_TRANSACTIONID", #read_internal_processor_report.EQUATOR_CLOSING_TRANSACTIONID#)>
<cfset Temp = QuerySetCell(read_report, "EQUATOR_DEED_SENT", #read_internal_processor_report.EQUATOR_DEED_SENT#)>
<cfset Temp = QuerySetCell(read_report, "EQUATOR_HUD_WAIVER_SENT", #read_internal_processor_report.EQUATOR_HUD_WAIVER_SENT#)>
<cfset Temp = QuerySetCell(read_report, "EQUATOR_TITLE_TRANSACTIONID", #read_internal_processor_report.EQUATOR_TITLE_TRANSACTIONID#)>
<cfset Temp = QuerySetCell(read_report, "ESCROW_FEE", #read_internal_processor_report.ESCROW_FEE#)>
<cfset Temp = QuerySetCell(read_report, "ESCROW_MONTHS", #read_internal_processor_report.ESCROW_MONTHS#)>
<cfset Temp = QuerySetCell(read_report, "ESTIMATED_LOAN_FLOAT", #read_internal_processor_report.ESTIMATED_LOAN_FLOAT#)>
<cfset Temp = QuerySetCell(read_report, "ESTIMATED_TAXES", #read_internal_processor_report.ESTIMATED_TAXES#)>
<cfset Temp = QuerySetCell(read_report, "EXCLUDE_STATES", #read_internal_processor_report.EXCLUDE_STATES#)>
<cfset Temp = QuerySetCell(read_report, "EXTENTION", #read_internal_processor_report.EXTENTION#)>
<cfset Temp = QuerySetCell(read_report, "E_STATUS", #read_internal_processor_report.E_STATUS#)>
<cfset Temp = QuerySetCell(read_report, "FAIRFAX_CLIENT", #read_internal_processor_report.FAIRFAX_CLIENT#)>
<cfset Temp = QuerySetCell(read_report, "FANNIE_LOAN_ID", #read_internal_processor_report.FANNIE_LOAN_ID#)>
<cfset Temp = QuerySetCell(read_report, "FANNIE_REO_ID", #read_internal_processor_report.FANNIE_REO_ID#)>
<cfset Temp = QuerySetCell(read_report, "FAX", #read_internal_processor_report.FAX#)>
<cfset Temp = QuerySetCell(read_report, "FAX_NO", #read_internal_processor_report.FAX_NO#)>
<cfset Temp = QuerySetCell(read_report, "FCLIENTID", #read_internal_processor_report.FCLIENTID#)>
<cfset Temp = QuerySetCell(read_report, "FEEAPPRAISAL", #read_internal_processor_report.FEEAPPRAISAL#)>
<cfset Temp = QuerySetCell(read_report, "FEECURRENTOWNER", #read_internal_processor_report.FEECURRENTOWNER#)>
<cfset Temp = QuerySetCell(read_report, "FEEFULLSEARCH", #read_internal_processor_report.FEEFULLSEARCH#)>
<cfset Temp = QuerySetCell(read_report, "FEEPOLICYONLY", #read_internal_processor_report.FEEPOLICYONLY#)>
<cfset Temp = QuerySetCell(read_report, "FEERECORDING", #read_internal_processor_report.FEERECORDING#)>
<cfset Temp = QuerySetCell(read_report, "FEESIGNING", #read_internal_processor_report.FEESIGNING#)>
<cfset Temp = QuerySetCell(read_report, "FEEVESTINGLEGAL", #read_internal_processor_report.FEEVESTINGLEGAL#)>
<cfset Temp = QuerySetCell(read_report, "FFTVA_DC", #read_internal_processor_report.FFTVA_DC#)>
<cfset Temp = QuerySetCell(read_report, "FFTVA_FL", #read_internal_processor_report.FFTVA_FL#)>
<cfset Temp = QuerySetCell(read_report, "FFTVA_MD", #read_internal_processor_report.FFTVA_MD#)>
<cfset Temp = QuerySetCell(read_report, "FFTVA_PA", #read_internal_processor_report.FFTVA_PA#)>
<cfset Temp = QuerySetCell(read_report, "FFTVA_REG", #read_internal_processor_report.FFTVA_REG#)>
<cfset Temp = QuerySetCell(read_report, "FFTVA_VA", #read_internal_processor_report.FFTVA_VA#)>
<cfset Temp = QuerySetCell(read_report, "FHA_DC", #read_internal_processor_report.FHA_DC#)>
<cfset Temp = QuerySetCell(read_report, "FHA_FL", #read_internal_processor_report.FHA_FL#)>
<cfset Temp = QuerySetCell(read_report, "FHA_HUD_DC", #read_internal_processor_report.FHA_HUD_DC#)>
<cfset Temp = QuerySetCell(read_report, "FHA_HUD_FL", #read_internal_processor_report.FHA_HUD_FL#)>
<cfset Temp = QuerySetCell(read_report, "FHA_HUD_MD", #read_internal_processor_report.FHA_HUD_MD#)>
<cfset Temp = QuerySetCell(read_report, "FHA_HUD_PA", #read_internal_processor_report.FHA_HUD_PA#)>
<cfset Temp = QuerySetCell(read_report, "FHA_HUD_REG", #read_internal_processor_report.FHA_HUD_REG#)>
<cfset Temp = QuerySetCell(read_report, "FHA_HUD_VA", #read_internal_processor_report.FHA_HUD_VA#)>
<cfset Temp = QuerySetCell(read_report, "FHA_MD", #read_internal_processor_report.FHA_MD#)>
<cfset Temp = QuerySetCell(read_report, "FHA_PA", #read_internal_processor_report.FHA_PA#)>
<cfset Temp = QuerySetCell(read_report, "FHA_REG", #read_internal_processor_report.FHA_REG#)>
<cfset Temp = QuerySetCell(read_report, "FHA_VA", #read_internal_processor_report.FHA_VA#)>
<cfset Temp = QuerySetCell(read_report, "FHLMC_DC", #read_internal_processor_report.FHLMC_DC#)>
<cfset Temp = QuerySetCell(read_report, "FHLMC_FL", #read_internal_processor_report.FHLMC_FL#)>
<cfset Temp = QuerySetCell(read_report, "FHLMC_MD", #read_internal_processor_report.FHLMC_MD#)>
<cfset Temp = QuerySetCell(read_report, "FHLMC_PA", #read_internal_processor_report.FHLMC_PA#)>
<cfset Temp = QuerySetCell(read_report, "FHLMC_REG", #read_internal_processor_report.FHLMC_REG#)>
<cfset Temp = QuerySetCell(read_report, "FHLMC_VA", #read_internal_processor_report.FHLMC_VA#)>
<cfset Temp = QuerySetCell(read_report, "FILE_UPLOAD", #read_internal_processor_report.FILE_UPLOAD#)>
<cfset Temp = QuerySetCell(read_report, "FIRST_TIME_BUYER", #read_internal_processor_report.FIRST_TIME_BUYER#)>
<cfset Temp = QuerySetCell(read_report, "FLAGSTAR_HUD_COMPLETED", #read_internal_processor_report.FLAGSTAR_HUD_COMPLETED#)>
<cfset Temp = QuerySetCell(read_report, "FLAGSTAR_HUD_REQ", #read_internal_processor_report.FLAGSTAR_HUD_REQ#)>
<cfset Temp = QuerySetCell(read_report, "FLAGSTAR_POLICY_ISSUED", #read_internal_processor_report.FLAGSTAR_POLICY_ISSUED#)>
<cfset Temp = QuerySetCell(read_report, "FLOOD_CERT_PRICE", #read_internal_processor_report.FLOOD_CERT_PRICE#)>
<cfset Temp = QuerySetCell(read_report, "FNAME", #read_internal_processor_report.FNAME#)>
<cfset Temp = QuerySetCell(read_report, "FNMA_DC", #read_internal_processor_report.FNMA_DC#)>
<cfset Temp = QuerySetCell(read_report, "FNMA_FL", #read_internal_processor_report.FNMA_FL#)>
<cfset Temp = QuerySetCell(read_report, "FNMA_MD", #read_internal_processor_report.FNMA_MD#)>
<cfset Temp = QuerySetCell(read_report, "FNMA_PA", #read_internal_processor_report.FNMA_PA#)>
<cfset Temp = QuerySetCell(read_report, "FNMA_REG", #read_internal_processor_report.FNMA_REG#)>
<cfset Temp = QuerySetCell(read_report, "FNMA_VA", #read_internal_processor_report.FNMA_VA#)>
<cfset Temp = QuerySetCell(read_report, "FPROID", #read_internal_processor_report.FPROID#)>
<cfset Temp = QuerySetCell(read_report, "FULL_VESTING", #read_internal_processor_report.FULL_VESTING#)>
<cfset Temp = QuerySetCell(read_report, "HASSECURITY", #read_internal_processor_report.HASSECURITY#)>
<cfset Temp = QuerySetCell(read_report, "HOA_CONDO_LIEN", #read_internal_processor_report.HOA_CONDO_LIEN#)>
<cfset Temp = QuerySetCell(read_report, "HOA_CONDO_LIEN_DATE", #read_internal_processor_report.HOA_CONDO_LIEN_DATE#)>
<cfset Temp = QuerySetCell(read_report, "HOA_TAXES", #read_internal_processor_report.HOA_TAXES#)>
<cfset Temp = QuerySetCell(read_report, "HOA_TAXES_DATE", #read_internal_processor_report.HOA_TAXES_DATE#)>
<cfset Temp = QuerySetCell(read_report, "HUD_APPROVED", #read_internal_processor_report.HUD_APPROVED#)>
<cfset Temp = QuerySetCell(read_report, "HUD_APPROVED_DATETIME", #read_internal_processor_report.HUD_APPROVED_DATETIME#)>
<cfset Temp = QuerySetCell(read_report, "HUD_LOCK", #read_internal_processor_report.HUD_LOCK#)>
<cfset Temp = QuerySetCell(read_report, "HUD_NOT_RECEIVED", #read_internal_processor_report.HUD_NOT_RECEIVED#)>
<cfset Temp = QuerySetCell(read_report, "HUD_NOT_RECEIVED_DATETIME", #read_internal_processor_report.HUD_NOT_RECEIVED_DATETIME#)>
<cfset Temp = QuerySetCell(read_report, "HUD_RECEIVED", #read_internal_processor_report.HUD_RECEIVED#)>
<cfset Temp = QuerySetCell(read_report, "HUD_RECEIVED_DATETIME", #read_internal_processor_report.HUD_RECEIVED_DATETIME#)>
<cfset Temp = QuerySetCell(read_report, "HUD_SIGNED", #read_internal_processor_report.HUD_SIGNED#)>
<cfset Temp = QuerySetCell(read_report, "HUD_TYPE", #read_internal_processor_report.HUD_TYPE#)>
<cfset Temp = QuerySetCell(read_report, "HUD_VERSION", #read_internal_processor_report.HUD_VERSION#)>
<cfset Temp = QuerySetCell(read_report, "ICL_ADDRESS", #read_internal_processor_report.ICL_ADDRESS#)>
<cfset Temp = QuerySetCell(read_report, "ICL_UPLOAD", #read_internal_processor_report.ICL_UPLOAD#)>
<cfset Temp = QuerySetCell(read_report, "ICL_UPLOAD2", #read_internal_processor_report.ICL_UPLOAD2#)>
<cfset Temp = QuerySetCell(read_report, "ID", #read_internal_processor_report.ID#)>
<cfset Temp = QuerySetCell(read_report, "IMPORTED_TO_TSS", #read_internal_processor_report.IMPORTED_TO_TSS#)>
<cfset Temp = QuerySetCell(read_report, "INFILE", #read_internal_processor_report.INFILE#)>
<cfset Temp = QuerySetCell(read_report, "INS", #read_internal_processor_report.INS#)>
<cfset Temp = QuerySetCell(read_report, "INSURED", #read_internal_processor_report.INSURED#)>
<cfset Temp = QuerySetCell(read_report, "INS_AMOUNT_OVERRIDE", #read_internal_processor_report.INS_AMOUNT_OVERRIDE#)>
<cfset Temp = QuerySetCell(read_report, "INS_NAME_OVERRIDE", #read_internal_processor_report.INS_NAME_OVERRIDE#)>
<cfset Temp = QuerySetCell(read_report, "INTCUSTSERV", #read_internal_processor_report.INTCUSTSERV#)>
<cfset Temp = QuerySetCell(read_report, "INTEGRA_ID", #read_internal_processor_report.INTEGRA_ID#)>
<cfset Temp = QuerySetCell(read_report, "INTERESTED_IN_SERVICES", #read_internal_processor_report.INTERESTED_IN_SERVICES#)>
<cfset Temp = QuerySetCell(read_report, "INTEREST_OVERRIDE", #read_internal_processor_report.INTEREST_OVERRIDE#)>
<cfset Temp = QuerySetCell(read_report, "INTSALES", #read_internal_processor_report.INTSALES#)>
<cfset Temp = QuerySetCell(read_report, "INVOICE_DATE", #read_internal_processor_report.INVOICE_DATE#)>
<cfset Temp = QuerySetCell(read_report, "IPEXT", #read_internal_processor_report.IPEXT#)>
<cfset Temp = QuerySetCell(read_report, "IPFAX", #read_internal_processor_report.IPFAX#)>
<cfset Temp = QuerySetCell(read_report, "IPNAME", #read_internal_processor_report.IPNAME#)>
<cfset Temp = QuerySetCell(read_report, "IPPHONE", #read_internal_processor_report.IPPHONE#)>
<cfset Temp = QuerySetCell(read_report, "IP_EMAIL", #read_internal_processor_report.IP_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "IP_ID", #read_internal_processor_report.IP_ID#)>
<cfset Temp = QuerySetCell(read_report, "JLP_POLICY", #read_internal_processor_report.JLP_POLICY#)>
<cfset Temp = QuerySetCell(read_report, "LAST_FEES_DATE", #read_internal_processor_report.LAST_FEES_DATE#)>
<cfset Temp = QuerySetCell(read_report, "LAST_ORDER_DATE", #read_internal_processor_report.LAST_ORDER_DATE#)>
<cfset Temp = QuerySetCell(read_report, "LAST_PASSWORD_CHANGE", #read_internal_processor_report.LAST_PASSWORD_CHANGE#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_1", #read_internal_processor_report.LENDER_REALTOR_1#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_2", #read_internal_processor_report.LENDER_REALTOR_2#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_3", #read_internal_processor_report.LENDER_REALTOR_3#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_EMAIL_1", #read_internal_processor_report.LENDER_REALTOR_EMAIL_1#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_EMAIL_2", #read_internal_processor_report.LENDER_REALTOR_EMAIL_2#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_EMAIL_3", #read_internal_processor_report.LENDER_REALTOR_EMAIL_3#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_FNAME_1", #read_internal_processor_report.LENDER_REALTOR_FNAME_1#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_FNAME_2", #read_internal_processor_report.LENDER_REALTOR_FNAME_2#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_FNAME_3", #read_internal_processor_report.LENDER_REALTOR_FNAME_3#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_LNAME_1", #read_internal_processor_report.LENDER_REALTOR_LNAME_1#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_LNAME_2", #read_internal_processor_report.LENDER_REALTOR_LNAME_2#)>
<cfset Temp = QuerySetCell(read_report, "LENDER_REALTOR_LNAME_3", #read_internal_processor_report.LENDER_REALTOR_LNAME_3#)>
<cfset Temp = QuerySetCell(read_report, "LIFE", #read_internal_processor_report.LIFE#)>
<cfset Temp = QuerySetCell(read_report, "LIFECENSUS", #read_internal_processor_report.LIFECENSUS#)>
<cfset Temp = QuerySetCell(read_report, "LINE_102", #read_internal_processor_report.LINE_102#)>
<cfset Temp = QuerySetCell(read_report, "LINE_104", #read_internal_processor_report.LINE_104#)>
<cfset Temp = QuerySetCell(read_report, "LINE_104_TEXT", #read_internal_processor_report.LINE_104_TEXT#)>
<cfset Temp = QuerySetCell(read_report, "LINE_105", #read_internal_processor_report.LINE_105#)>
<cfset Temp = QuerySetCell(read_report, "LINE_105_TEXT", #read_internal_processor_report.LINE_105_TEXT#)>
<cfset Temp = QuerySetCell(read_report, "LINE_110", #read_internal_processor_report.LINE_110#)>
<cfset Temp = QuerySetCell(read_report, "LINE_110_TEXT", #read_internal_processor_report.LINE_110_TEXT#)>
<cfset Temp = QuerySetCell(read_report, "LINE_111", #read_internal_processor_report.LINE_111#)>
<cfset Temp = QuerySetCell(read_report, "LINE_1112", #read_internal_processor_report.LINE_1112#)>
<cfset Temp = QuerySetCell(read_report, "LINE_1112_TEXT", #read_internal_processor_report.LINE_1112_TEXT#)>
<cfset Temp = QuerySetCell(read_report, "LINE_1113", #read_internal_processor_report.LINE_1113#)>
<cfset Temp = QuerySetCell(read_report, "LINE_1113_TEXT", #read_internal_processor_report.LINE_1113_TEXT#)>
<cfset Temp = QuerySetCell(read_report, "LINE_111_TEXT", #read_internal_processor_report.LINE_111_TEXT#)>
<cfset Temp = QuerySetCell(read_report, "LINE_1304", #read_internal_processor_report.LINE_1304#)>
<cfset Temp = QuerySetCell(read_report, "LINE_1305", #read_internal_processor_report.LINE_1305#)>
<cfset Temp = QuerySetCell(read_report, "LINE_808", #read_internal_processor_report.LINE_808#)>
<cfset Temp = QuerySetCell(read_report, "LINE_808_TEXT", #read_internal_processor_report.LINE_808_TEXT#)>
<cfset Temp = QuerySetCell(read_report, "LNAME", #read_internal_processor_report.LNAME#)>
<cfset Temp = QuerySetCell(read_report, "LOANAMT_FLOAT", #read_internal_processor_report.LOANAMT_FLOAT#)>
<cfset Temp = QuerySetCell(read_report, "LOANTYPE", #read_internal_processor_report.LOANTYPE#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_ADMIN_FEE", #read_internal_processor_report.LOAN_ADMIN_FEE#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_ASST_CELL_PHONE", #read_internal_processor_report.LOAN_ASST_CELL_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_ASST_DAY_PHONE", #read_internal_processor_report.LOAN_ASST_DAY_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_ASST_EMAIL", #read_internal_processor_report.LOAN_ASST_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_ASST_EVE_PHONE", #read_internal_processor_report.LOAN_ASST_EVE_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_ASST_FAX", #read_internal_processor_report.LOAN_ASST_FAX#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_ASST_NAME", #read_internal_processor_report.LOAN_ASST_NAME#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_ASST_PAGER", #read_internal_processor_report.LOAN_ASST_PAGER#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_END_DATE", #read_internal_processor_report.LOAN_END_DATE#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_END_DATE_C", #read_internal_processor_report.LOAN_END_DATE_C#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_END_DATE_S", #read_internal_processor_report.LOAN_END_DATE_S#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_NUMBER", #read_internal_processor_report.LOAN_NUMBER#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_NUMBER_OVERRIDE", #read_internal_processor_report.LOAN_NUMBER_OVERRIDE#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_OFF_ID", #read_internal_processor_report.LOAN_OFF_ID#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_PROGRAM_333", #read_internal_processor_report.LOAN_PROGRAM_333#)>
<cfset Temp = QuerySetCell(read_report, "LOAN_TYPE_111", #read_internal_processor_report.LOAN_TYPE_111#)>
<cfset Temp = QuerySetCell(read_report, "LOGSTRANSACTIONID", #read_internal_processor_report.LOGSTRANSACTIONID#)>
<cfset Temp = QuerySetCell(read_report, "LOT", #read_internal_processor_report.LOT#)>
<cfset Temp = QuerySetCell(read_report, "LP_EMAIL", #read_internal_processor_report.LP_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "LP_FAX", #read_internal_processor_report.LP_FAX#)>
<cfset Temp = QuerySetCell(read_report, "LP_FNAME", #read_internal_processor_report.LP_FNAME#)>
<cfset Temp = QuerySetCell(read_report, "LP_LNAME", #read_internal_processor_report.LP_LNAME#)>
<cfset Temp = QuerySetCell(read_report, "LP_PHONE", #read_internal_processor_report.LP_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "MAILING_ADDRESS", #read_internal_processor_report.MAILING_ADDRESS#)>
<cfset Temp = QuerySetCell(read_report, "MANNER_OF_TITLE", #read_internal_processor_report.MANNER_OF_TITLE#)>
<cfset Temp = QuerySetCell(read_report, "MASTER_CO_ID", #read_internal_processor_report.MASTER_CO_ID#)>
<cfset Temp = QuerySetCell(read_report, "MORTGAGE_1_AND", #read_internal_processor_report.MORTGAGE_1_AND#)>
<cfset Temp = QuerySetCell(read_report, "MORTGAGE_1_BOOK", #read_internal_processor_report.MORTGAGE_1_BOOK#)>
<cfset Temp = QuerySetCell(read_report, "MORTGAGE_1_DATED", #read_internal_processor_report.MORTGAGE_1_DATED#)>
<cfset Temp = QuerySetCell(read_report, "MORTGAGE_1_FROM", #read_internal_processor_report.MORTGAGE_1_FROM#)>
<cfset Temp = QuerySetCell(read_report, "MORTGAGE_1_INST", #read_internal_processor_report.MORTGAGE_1_INST#)>
<cfset Temp = QuerySetCell(read_report, "MORTGAGE_1_PAGE", #read_internal_processor_report.MORTGAGE_1_PAGE#)>
<cfset Temp = QuerySetCell(read_report, "MORTGAGE_1_PRINCIPAL", #read_internal_processor_report.MORTGAGE_1_PRINCIPAL#)>
<cfset Temp = QuerySetCell(read_report, "MORTGAGE_1_RECORDED", #read_internal_processor_report.MORTGAGE_1_RECORDED#)>
<cfset Temp = QuerySetCell(read_report, "MORTGAGE_1_TO", #read_internal_processor_report.MORTGAGE_1_TO#)>
<cfset Temp = QuerySetCell(read_report, "MORTGAGE_INSURANCE", #read_internal_processor_report.MORTGAGE_INSURANCE#)>
<cfset Temp = QuerySetCell(read_report, "NEW_CLIENT", #read_internal_processor_report.NEW_CLIENT#)>
<cfset Temp = QuerySetCell(read_report, "NEW_HUD_CLOSING_DATE", #read_internal_processor_report.NEW_HUD_CLOSING_DATE#)>
<cfset Temp = QuerySetCell(read_report, "NON_ESCROW", #read_internal_processor_report.NON_ESCROW#)>
<cfset Temp = QuerySetCell(read_report, "NOTIFY_CLOSING_EMAIL", #read_internal_processor_report.NOTIFY_CLOSING_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "NOTIFY_CLOSING_REASON", #read_internal_processor_report.NOTIFY_CLOSING_REASON#)>
<cfset Temp = QuerySetCell(read_report, "NOT_UPDATED_LA", #read_internal_processor_report.NOT_UPDATED_LA#)>
<cfset Temp = QuerySetCell(read_report, "NOT_UPDATED_ME", #read_internal_processor_report.NOT_UPDATED_ME#)>
<cfset Temp = QuerySetCell(read_report, "N_DATE", #read_internal_processor_report.N_DATE#)>
<cfset Temp = QuerySetCell(read_report, "N_STATUS", #read_internal_processor_report.N_STATUS#)>
<cfset Temp = QuerySetCell(read_report, "N_TIME", #read_internal_processor_report.N_TIME#)>
<cfset Temp = QuerySetCell(read_report, "OCCUPANCY", #read_internal_processor_report.OCCUPANCY#)>
<cfset Temp = QuerySetCell(read_report, "ODA_DAY", #read_internal_processor_report.ODA_DAY#)>
<cfset Temp = QuerySetCell(read_report, "ODA_DAY_OF_YEAR", #read_internal_processor_report.ODA_DAY_OF_YEAR#)>
<cfset Temp = QuerySetCell(read_report, "ODA_MONTH", #read_internal_processor_report.ODA_MONTH#)>
<cfset Temp = QuerySetCell(read_report, "ODA_YEAR", #read_internal_processor_report.ODA_YEAR#)>
<cfset Temp = QuerySetCell(read_report, "OEXT", #read_internal_processor_report.OEXT#)>
<cfset Temp = QuerySetCell(read_report, "OFAX", #read_internal_processor_report.OFAX#)>
<cfset Temp = QuerySetCell(read_report, "OLD_UNIT_NUM", #read_internal_processor_report.OLD_UNIT_NUM#)>
<cfset Temp = QuerySetCell(read_report, "ONAME", #read_internal_processor_report.ONAME#)>
<cfset Temp = QuerySetCell(read_report, "ONLINE_DOCS_RECORDED", #read_internal_processor_report.ONLINE_DOCS_RECORDED#)>
<cfset Temp = QuerySetCell(read_report, "ONLINE_DOCS_TO_BE_RECORDED", #read_internal_processor_report.ONLINE_DOCS_TO_BE_RECORDED#)>
<cfset Temp = QuerySetCell(read_report, "ON_HOLD", #read_internal_processor_report.ON_HOLD#)>
<cfset Temp = QuerySetCell(read_report, "ON_HOLD_DATE", #read_internal_processor_report.ON_HOLD_DATE#)>
<cfset Temp = QuerySetCell(read_report, "OPENED_BY_VENDOR_ID", #read_internal_processor_report.OPENED_BY_VENDOR_ID#)>
<cfset Temp = QuerySetCell(read_report, "OPHONE", #read_internal_processor_report.OPHONE#)>
<cfset Temp = QuerySetCell(read_report, "OPT_ALTA_4", #read_internal_processor_report.OPT_ALTA_4#)>
<cfset Temp = QuerySetCell(read_report, "OPT_ALTA_4_1", #read_internal_processor_report.OPT_ALTA_4_1#)>
<cfset Temp = QuerySetCell(read_report, "OPT_ALTA_5", #read_internal_processor_report.OPT_ALTA_5#)>
<cfset Temp = QuerySetCell(read_report, "OPT_ALTA_5_1", #read_internal_processor_report.OPT_ALTA_5_1#)>
<cfset Temp = QuerySetCell(read_report, "OPT_ALTA_6", #read_internal_processor_report.OPT_ALTA_6#)>
<cfset Temp = QuerySetCell(read_report, "OPT_ALTA_6_1", #read_internal_processor_report.OPT_ALTA_6_1#)>
<cfset Temp = QuerySetCell(read_report, "OPT_ALTA_6_2", #read_internal_processor_report.OPT_ALTA_6_2#)>
<cfset Temp = QuerySetCell(read_report, "OPT_ALTA_7", #read_internal_processor_report.OPT_ALTA_7#)>
<cfset Temp = QuerySetCell(read_report, "OPT_ALTA_8_1", #read_internal_processor_report.OPT_ALTA_8_1#)>
<cfset Temp = QuerySetCell(read_report, "OPT_ALTA_9", #read_internal_processor_report.OPT_ALTA_9#)>
<cfset Temp = QuerySetCell(read_report, "OPT_FL_NAV", #read_internal_processor_report.OPT_FL_NAV#)>
<cfset Temp = QuerySetCell(read_report, "OPT_SD_4", #read_internal_processor_report.OPT_SD_4#)>
<cfset Temp = QuerySetCell(read_report, "OPT_SD_5", #read_internal_processor_report.OPT_SD_5#)>
<cfset Temp = QuerySetCell(read_report, "OPT_SD_6", #read_internal_processor_report.OPT_SD_6#)>
<cfset Temp = QuerySetCell(read_report, "OPT_SD_7", #read_internal_processor_report.OPT_SD_7#)>
<cfset Temp = QuerySetCell(read_report, "OPT_SD_8", #read_internal_processor_report.OPT_SD_8#)>
<cfset Temp = QuerySetCell(read_report, "OPT_SD_9", #read_internal_processor_report.OPT_SD_9#)>
<cfset Temp = QuerySetCell(read_report, "OPT_SD_BALLOON", #read_internal_processor_report.OPT_SD_BALLOON#)>
<cfset Temp = QuerySetCell(read_report, "OPT_SD_COMP", #read_internal_processor_report.OPT_SD_COMP#)>
<cfset Temp = QuerySetCell(read_report, "OPT_SD_CREDIT", #read_internal_processor_report.OPT_SD_CREDIT#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_1", #read_internal_processor_report.OPT_TX_1#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_10", #read_internal_processor_report.OPT_TX_10#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_11", #read_internal_processor_report.OPT_TX_11#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_12", #read_internal_processor_report.OPT_TX_12#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_13", #read_internal_processor_report.OPT_TX_13#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_14", #read_internal_processor_report.OPT_TX_14#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_2", #read_internal_processor_report.OPT_TX_2#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_3", #read_internal_processor_report.OPT_TX_3#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_4", #read_internal_processor_report.OPT_TX_4#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_5", #read_internal_processor_report.OPT_TX_5#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_6", #read_internal_processor_report.OPT_TX_6#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_7", #read_internal_processor_report.OPT_TX_7#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_8", #read_internal_processor_report.OPT_TX_8#)>
<cfset Temp = QuerySetCell(read_report, "OPT_TX_9", #read_internal_processor_report.OPT_TX_9#)>
<cfset Temp = QuerySetCell(read_report, "OPT_UT_4", #read_internal_processor_report.OPT_UT_4#)>
<cfset Temp = QuerySetCell(read_report, "OPT_UT_41", #read_internal_processor_report.OPT_UT_41#)>
<cfset Temp = QuerySetCell(read_report, "OPT_UT_5", #read_internal_processor_report.OPT_UT_5#)>
<cfset Temp = QuerySetCell(read_report, "OPT_UT_51", #read_internal_processor_report.OPT_UT_51#)>
<cfset Temp = QuerySetCell(read_report, "OPT_UT_6", #read_internal_processor_report.OPT_UT_6#)>
<cfset Temp = QuerySetCell(read_report, "OPT_UT_61", #read_internal_processor_report.OPT_UT_61#)>
<cfset Temp = QuerySetCell(read_report, "OPT_UT_62", #read_internal_processor_report.OPT_UT_62#)>
<cfset Temp = QuerySetCell(read_report, "OPT_UT_81", #read_internal_processor_report.OPT_UT_81#)>
<cfset Temp = QuerySetCell(read_report, "OPT_UT_9", #read_internal_processor_report.OPT_UT_9#)>
<cfset Temp = QuerySetCell(read_report, "ORDERREMOVECUSTSERVICE", #read_internal_processor_report.ORDERREMOVECUSTSERVICE#)>
<cfset Temp = QuerySetCell(read_report, "ORDER_DATE", #read_internal_processor_report.ORDER_DATE#)>
<cfset Temp = QuerySetCell(read_report, "ORDER_DATE_ADJUSTED", #read_internal_processor_report.ORDER_DATE_ADJUSTED#)>
<cfset Temp = QuerySetCell(read_report, "ORDER_STATUS", #read_internal_processor_report.ORDER_STATUS#)>
<cfset Temp = QuerySetCell(read_report, "ORIGINAL_ORDER_DATE", #read_internal_processor_report.ORIGINAL_ORDER_DATE#)>
<cfset Temp = QuerySetCell(read_report, "ORIGINAL_REVENUE_AMT", #read_internal_processor_report.ORIGINAL_REVENUE_AMT#)>
<cfset Temp = QuerySetCell(read_report, "ORIGINATION_FEE_PERCENTAGE", #read_internal_processor_report.ORIGINATION_FEE_PERCENTAGE#)>
<cfset Temp = QuerySetCell(read_report, "O_EMAIL", #read_internal_processor_report.O_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "PADDRESS", #read_internal_processor_report.PADDRESS#)>
<cfset Temp = QuerySetCell(read_report, "PADDRESS_OVERRIDE", #read_internal_processor_report.PADDRESS_OVERRIDE#)>
<cfset Temp = QuerySetCell(read_report, "PARCEL", #read_internal_processor_report.PARCEL#)>
<cfset Temp = QuerySetCell(read_report, "PAYOFF_NEEDED", #read_internal_processor_report.PAYOFF_NEEDED#)>
<cfset Temp = QuerySetCell(read_report, "PAYOFF_UPLOAD", #read_internal_processor_report.PAYOFF_UPLOAD#)>
<cfset Temp = QuerySetCell(read_report, "PCITY", #read_internal_processor_report.PCITY#)>
<cfset Temp = QuerySetCell(read_report, "PCOUNTY", #read_internal_processor_report.PCOUNTY#)>
<cfset Temp = QuerySetCell(read_report, "PEXT", #read_internal_processor_report.PEXT#)>
<cfset Temp = QuerySetCell(read_report, "PFAX", #read_internal_processor_report.PFAX#)>
<cfset Temp = QuerySetCell(read_report, "PHONE", #read_internal_processor_report.PHONE#)>
<cfset Temp = QuerySetCell(read_report, "PIGGY", #read_internal_processor_report.PIGGY#)>
<cfset Temp = QuerySetCell(read_report, "PIGGY_REFERENCE_ID", #read_internal_processor_report.PIGGY_REFERENCE_ID#)>
<cfset Temp = QuerySetCell(read_report, "PLEGALDESC", #read_internal_processor_report.PLEGALDESC#)>
<cfset Temp = QuerySetCell(read_report, "PNAME", #read_internal_processor_report.PNAME#)>
<cfset Temp = QuerySetCell(read_report, "POACCTNO1", #read_internal_processor_report.POACCTNO1#)>
<cfset Temp = QuerySetCell(read_report, "POACCTNO2", #read_internal_processor_report.POACCTNO2#)>
<cfset Temp = QuerySetCell(read_report, "POAMOUNT1", #read_internal_processor_report.POAMOUNT1#)>
<cfset Temp = QuerySetCell(read_report, "POAMOUNT2", #read_internal_processor_report.POAMOUNT2#)>
<cfset Temp = QuerySetCell(read_report, "POLENDER1", #read_internal_processor_report.POLENDER1#)>
<cfset Temp = QuerySetCell(read_report, "POLENDER2", #read_internal_processor_report.POLENDER2#)>
<cfset Temp = QuerySetCell(read_report, "POLICY_DATE_OVERRIDE", #read_internal_processor_report.POLICY_DATE_OVERRIDE#)>
<cfset Temp = QuerySetCell(read_report, "POLICY_NUMBER", #read_internal_processor_report.POLICY_NUMBER#)>
<cfset Temp = QuerySetCell(read_report, "POOL_FILE", #read_internal_processor_report.POOL_FILE#)>
<cfset Temp = QuerySetCell(read_report, "POPHONE1", #read_internal_processor_report.POPHONE1#)>
<cfset Temp = QuerySetCell(read_report, "POPHONE2", #read_internal_processor_report.POPHONE2#)>
<cfset Temp = QuerySetCell(read_report, "POSITION", #read_internal_processor_report.POSITION#)>
<cfset Temp = QuerySetCell(read_report, "PPHONE", #read_internal_processor_report.PPHONE#)>
<cfset Temp = QuerySetCell(read_report, "PREMIUM_OVERRIDE", #read_internal_processor_report.PREMIUM_OVERRIDE#)>
<cfset Temp = QuerySetCell(read_report, "PREPAY_PENALTY", #read_internal_processor_report.PREPAY_PENALTY#)>
<cfset Temp = QuerySetCell(read_report, "PREPAY_PENALTY_TEXT", #read_internal_processor_report.PREPAY_PENALTY_TEXT#)>
<cfset Temp = QuerySetCell(read_report, "PREVIOUS_PURCHASE_MORTGAGE", #read_internal_processor_report.PREVIOUS_PURCHASE_MORTGAGE#)>
<cfset Temp = QuerySetCell(read_report, "PREV_LOAN_MO", #read_internal_processor_report.PREV_LOAN_MO#)>
<cfset Temp = QuerySetCell(read_report, "PREV_LOAN_YEAR", #read_internal_processor_report.PREV_LOAN_YEAR#)>
<cfset Temp = QuerySetCell(read_report, "PREV_PURCH_AMOUNT", #read_internal_processor_report.PREV_PURCH_AMOUNT#)>
<cfset Temp = QuerySetCell(read_report, "PREV_PURCH_MONTH", #read_internal_processor_report.PREV_PURCH_MONTH#)>
<cfset Temp = QuerySetCell(read_report, "PREV_PURCH_YEAR", #read_internal_processor_report.PREV_PURCH_YEAR#)>
<cfset Temp = QuerySetCell(read_report, "PREV_TEAM_ID", #read_internal_processor_report.PREV_TEAM_ID#)>
<cfset Temp = QuerySetCell(read_report, "PROCESSING_PAGE", #read_internal_processor_report.PROCESSING_PAGE#)>
<cfset Temp = QuerySetCell(read_report, "PROC_COMPLETE_DATE", #read_internal_processor_report.PROC_COMPLETE_DATE#)>
<cfset Temp = QuerySetCell(read_report, "PROC_DATEANDTIME", #read_internal_processor_report.PROC_DATEANDTIME#)>
<cfset Temp = QuerySetCell(read_report, "PROC_NAME", #read_internal_processor_report.PROC_NAME#)>
<cfset Temp = QuerySetCell(read_report, "PROMO_EMAIL_SENT", #read_internal_processor_report.PROMO_EMAIL_SENT#)>
<cfset Temp = QuerySetCell(read_report, "PROPOSED_MONTHLY_TRANSACTIONS", #read_internal_processor_report.PROPOSED_MONTHLY_TRANSACTIONS#)>
<cfset Temp = QuerySetCell(read_report, "PROPTYPE", #read_internal_processor_report.PROPTYPE#)>
<cfset Temp = QuerySetCell(read_report, "PROP_END_DATE", #read_internal_processor_report.PROP_END_DATE#)>
<cfset Temp = QuerySetCell(read_report, "PROP_END_DATE_C", #read_internal_processor_report.PROP_END_DATE_C#)>
<cfset Temp = QuerySetCell(read_report, "PROP_END_DATE_S", #read_internal_processor_report.PROP_END_DATE_S#)>
<cfset Temp = QuerySetCell(read_report, "PROP_TAX", #read_internal_processor_report.PROP_TAX#)>
<cfset Temp = QuerySetCell(read_report, "PROP_TAX_DAY", #read_internal_processor_report.PROP_TAX_DAY#)>
<cfset Temp = QuerySetCell(read_report, "PROP_TAX_MONTH", #read_internal_processor_report.PROP_TAX_MONTH#)>
<cfset Temp = QuerySetCell(read_report, "PROP_TAX_YEAR", #read_internal_processor_report.PROP_TAX_YEAR#)>
<cfset Temp = QuerySetCell(read_report, "PROP_USE_TYPE", #read_internal_processor_report.PROP_USE_TYPE#)>
<cfset Temp = QuerySetCell(read_report, "PSTATE", #read_internal_processor_report.PSTATE#)>
<cfset Temp = QuerySetCell(read_report, "PURCHASE", #read_internal_processor_report.PURCHASE#)>
<cfset Temp = QuerySetCell(read_report, "PURCHASE_PRICE", #read_internal_processor_report.PURCHASE_PRICE#)>
<cfset Temp = QuerySetCell(read_report, "PZIP", #read_internal_processor_report.PZIP#)>
<cfset Temp = QuerySetCell(read_report, "P_EMAIL", #read_internal_processor_report.P_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "REALECCLIENTID", #read_internal_processor_report.REALECCLIENTID#)>
<cfset Temp = QuerySetCell(read_report, "REALEC_CLOSING_UID", #read_internal_processor_report.REALEC_CLOSING_UID#)>
<cfset Temp = QuerySetCell(read_report, "REALEC_DS1_UID", #read_internal_processor_report.REALEC_DS1_UID#)>
<cfset Temp = QuerySetCell(read_report, "REALEC_DS2_UID", #read_internal_processor_report.REALEC_DS2_UID#)>
<cfset Temp = QuerySetCell(read_report, "REALEC_PID", #read_internal_processor_report.REALEC_PID#)>
<cfset Temp = QuerySetCell(read_report, "REALEC_TITLE_UID", #read_internal_processor_report.REALEC_TITLE_UID#)>
<cfset Temp = QuerySetCell(read_report, "REALEC_TRANSACTIONID", #read_internal_processor_report.REALEC_TRANSACTIONID#)>
<cfset Temp = QuerySetCell(read_report, "REASSIGNED_DATE", #read_internal_processor_report.REASSIGNED_DATE#)>
<cfset Temp = QuerySetCell(read_report, "REASSIGNED_FROM", #read_internal_processor_report.REASSIGNED_FROM#)>
<cfset Temp = QuerySetCell(read_report, "REASSIGNED_TO", #read_internal_processor_report.REASSIGNED_TO#)>
<cfset Temp = QuerySetCell(read_report, "RECISSIONS_DC", #read_internal_processor_report.RECISSIONS_DC#)>
<cfset Temp = QuerySetCell(read_report, "RECISSIONS_FL", #read_internal_processor_report.RECISSIONS_FL#)>
<cfset Temp = QuerySetCell(read_report, "RECISSIONS_MD", #read_internal_processor_report.RECISSIONS_MD#)>
<cfset Temp = QuerySetCell(read_report, "RECISSIONS_PA", #read_internal_processor_report.RECISSIONS_PA#)>
<cfset Temp = QuerySetCell(read_report, "RECISSIONS_REG", #read_internal_processor_report.RECISSIONS_REG#)>
<cfset Temp = QuerySetCell(read_report, "RECISSIONS_VA", #read_internal_processor_report.RECISSIONS_VA#)>
<cfset Temp = QuerySetCell(read_report, "REFER", #read_internal_processor_report.REFER#)>
<cfset Temp = QuerySetCell(read_report, "REFER_OTHER", #read_internal_processor_report.REFER_OTHER#)>
<cfset Temp = QuerySetCell(read_report, "REISSUE", #read_internal_processor_report.REISSUE#)>
<cfset Temp = QuerySetCell(read_report, "REISSUE_RATES", #read_internal_processor_report.REISSUE_RATES#)>
<cfset Temp = QuerySetCell(read_report, "REO_DOC_UPLOAD", #read_internal_processor_report.REO_DOC_UPLOAD#)>
<cfset Temp = QuerySetCell(read_report, "REO_DRAFT_DEED", #read_internal_processor_report.REO_DRAFT_DEED#)>
<cfset Temp = QuerySetCell(read_report, "REO_DRAFT_DEED_DATE", #read_internal_processor_report.REO_DRAFT_DEED_DATE#)>
<cfset Temp = QuerySetCell(read_report, "REO_FINAL_HUD", #read_internal_processor_report.REO_FINAL_HUD#)>
<cfset Temp = QuerySetCell(read_report, "REO_FINAL_HUD_DATE", #read_internal_processor_report.REO_FINAL_HUD_DATE#)>
<cfset Temp = QuerySetCell(read_report, "REO_HUD_FOR_APPROVAL", #read_internal_processor_report.REO_HUD_FOR_APPROVAL#)>
<cfset Temp = QuerySetCell(read_report, "REO_HUD_FOR_APPROVAL_DATE", #read_internal_processor_report.REO_HUD_FOR_APPROVAL_DATE#)>
<cfset Temp = QuerySetCell(read_report, "REO_NUMBER", #read_internal_processor_report.REO_NUMBER#)>
<cfset Temp = QuerySetCell(read_report, "REO_PACKAGE", #read_internal_processor_report.REO_PACKAGE#)>
<cfset Temp = QuerySetCell(read_report, "REO_PACKAGE_DATE", #read_internal_processor_report.REO_PACKAGE_DATE#)>
<cfset Temp = QuerySetCell(read_report, "REO_PROCESSOR", #read_internal_processor_report.REO_PROCESSOR#)>
<cfset Temp = QuerySetCell(read_report, "REO_SALES_CONTRACT", #read_internal_processor_report.REO_SALES_CONTRACT#)>
<cfset Temp = QuerySetCell(read_report, "REO_SALES_CONTRACT_DATE", #read_internal_processor_report.REO_SALES_CONTRACT_DATE#)>
<cfset Temp = QuerySetCell(read_report, "REO_SIGNED_DEED", #read_internal_processor_report.REO_SIGNED_DEED#)>
<cfset Temp = QuerySetCell(read_report, "REO_SIGNED_DEED_DATE", #read_internal_processor_report.REO_SIGNED_DEED_DATE#)>
<cfset Temp = QuerySetCell(read_report, "REO_SIGNED_HUD", #read_internal_processor_report.REO_SIGNED_HUD#)>
<cfset Temp = QuerySetCell(read_report, "REO_SIGNED_HUD_DATE", #read_internal_processor_report.REO_SIGNED_HUD_DATE#)>
<cfset Temp = QuerySetCell(read_report, "REQUEST_ICL", #read_internal_processor_report.REQUEST_ICL#)>
<cfset Temp = QuerySetCell(read_report, "RESET_PASSWORD_DUE", #read_internal_processor_report.RESET_PASSWORD_DUE#)>
<cfset Temp = QuerySetCell(read_report, "RESOLVE_HUD_OVERAGE", #read_internal_processor_report.RESOLVE_HUD_OVERAGE#)>
<cfset Temp = QuerySetCell(read_report, "RESOLVE_HUD_SHORTAGE", #read_internal_processor_report.RESOLVE_HUD_SHORTAGE#)>
<cfset Temp = QuerySetCell(read_report, "RESPONSIBLEPARTY1", #read_internal_processor_report.RESPONSIBLEPARTY1#)>
<cfset Temp = QuerySetCell(read_report, "RESPONSIBLEPARTY2", #read_internal_processor_report.RESPONSIBLEPARTY2#)>
<cfset Temp = QuerySetCell(read_report, "RESPONSIBLEPARTY_EXCEPTION", #read_internal_processor_report.RESPONSIBLEPARTY_EXCEPTION#)>
<cfset Temp = QuerySetCell(read_report, "RESPONSIBLEPARTY_ROLLOVER", #read_internal_processor_report.RESPONSIBLEPARTY_ROLLOVER#)>
<cfset Temp = QuerySetCell(read_report, "REVENUE", #read_internal_processor_report.REVENUE#)>
<cfset Temp = QuerySetCell(read_report, "ROA_DATE_OPENED", #read_internal_processor_report.ROA_DATE_OPENED#)>
<cfset Temp = QuerySetCell(read_report, "ROLLOVEREXPLANATION_EXCEPTION", #read_internal_processor_report.ROLLOVEREXPLANATION_EXCEPTION#)>
<cfset Temp = QuerySetCell(read_report, "ROLLOVEREXPLANATION_ROLLOVER", #read_internal_processor_report.ROLLOVEREXPLANATION_ROLLOVER#)>
<cfset Temp = QuerySetCell(read_report, "RPTBYEMAIL", #read_internal_processor_report.RPTBYEMAIL#)>
<cfset Temp = QuerySetCell(read_report, "SAFE", #read_internal_processor_report.SAFE#)>
<cfset Temp = QuerySetCell(read_report, "SALES_CALL_FULL", #read_internal_processor_report.SALES_CALL_FULL#)>
<cfset Temp = QuerySetCell(read_report, "SALES_CALL_SELLER_REP", #read_internal_processor_report.SALES_CALL_SELLER_REP#)>
<cfset Temp = QuerySetCell(read_report, "SAME_LENDER", #read_internal_processor_report.SAME_LENDER#)>
<cfset Temp = QuerySetCell(read_report, "SEARCHTYPE", #read_internal_processor_report.SEARCHTYPE#)>
<cfset Temp = QuerySetCell(read_report, "SEARCH_TYPE", #read_internal_processor_report.SEARCH_TYPE#)>
<cfset Temp = QuerySetCell(read_report, "SECLOAN", #read_internal_processor_report.SECLOAN#)>
<cfset Temp = QuerySetCell(read_report, "SEC_INST_DATE", #read_internal_processor_report.SEC_INST_DATE#)>
<cfset Temp = QuerySetCell(read_report, "SELLER_PAID_LENDER_POLICY", #read_internal_processor_report.SELLER_PAID_LENDER_POLICY#)>
<cfset Temp = QuerySetCell(read_report, "SELLER_PAID_OWNER_POLICY", #read_internal_processor_report.SELLER_PAID_OWNER_POLICY#)>
<cfset Temp = QuerySetCell(read_report, "SELLER_REP", #read_internal_processor_report.SELLER_REP#)>
<cfset Temp = QuerySetCell(read_report, "SEND_POST_CLOSE_SURVEY", #read_internal_processor_report.SEND_POST_CLOSE_SURVEY#)>
<cfset Temp = QuerySetCell(read_report, "SEND_THIS", #read_internal_processor_report.SEND_THIS#)>
<cfset Temp = QuerySetCell(read_report, "SENIOR", #read_internal_processor_report.SENIOR#)>
<cfset Temp = QuerySetCell(read_report, "SENT_SIX_DAY_EMAIL", #read_internal_processor_report.SENT_SIX_DAY_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "SENT_THIRTY_DAY_EMAIL", #read_internal_processor_report.SENT_THIRTY_DAY_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "SEXT1", #read_internal_processor_report.SEXT1#)>
<cfset Temp = QuerySetCell(read_report, "SEXT2", #read_internal_processor_report.SEXT2#)>
<cfset Temp = QuerySetCell(read_report, "SEXT3", #read_internal_processor_report.SEXT3#)>
<cfset Temp = QuerySetCell(read_report, "SEXT4", #read_internal_processor_report.SEXT4#)>
<cfset Temp = QuerySetCell(read_report, "SFIRSTNAME1", #read_internal_processor_report.SFIRSTNAME1#)>
<cfset Temp = QuerySetCell(read_report, "SFIRSTNAME2", #read_internal_processor_report.SFIRSTNAME2#)>
<cfset Temp = QuerySetCell(read_report, "SFIRSTNAME3", #read_internal_processor_report.SFIRSTNAME3#)>
<cfset Temp = QuerySetCell(read_report, "SFIRSTNAME4", #read_internal_processor_report.SFIRSTNAME4#)>
<cfset Temp = QuerySetCell(read_report, "SHARE_LOAN_ACCT", #read_internal_processor_report.SHARE_LOAN_ACCT#)>
<cfset Temp = QuerySetCell(read_report, "SHARE_LOAN_LENDER", #read_internal_processor_report.SHARE_LOAN_LENDER#)>
<cfset Temp = QuerySetCell(read_report, "SHARE_LOAN_PAYOFF", #read_internal_processor_report.SHARE_LOAN_PAYOFF#)>
<cfset Temp = QuerySetCell(read_report, "SHARE_LOAN_PHONE", #read_internal_processor_report.SHARE_LOAN_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "SHPHONE1", #read_internal_processor_report.SHPHONE1#)>
<cfset Temp = QuerySetCell(read_report, "SHPHONE2", #read_internal_processor_report.SHPHONE2#)>
<cfset Temp = QuerySetCell(read_report, "SHPHONE3", #read_internal_processor_report.SHPHONE3#)>
<cfset Temp = QuerySetCell(read_report, "SHPHONE4", #read_internal_processor_report.SHPHONE4#)>
<cfset Temp = QuerySetCell(read_report, "SIGN_UP_DATE", #read_internal_processor_report.SIGN_UP_DATE#)>
<cfset Temp = QuerySetCell(read_report, "SIMULTANEOUS_NUMBER", #read_internal_processor_report.SIMULTANEOUS_NUMBER#)>
<cfset Temp = QuerySetCell(read_report, "SLASTNAME1", #read_internal_processor_report.SLASTNAME1#)>
<cfset Temp = QuerySetCell(read_report, "SLASTNAME2", #read_internal_processor_report.SLASTNAME2#)>
<cfset Temp = QuerySetCell(read_report, "SLASTNAME3", #read_internal_processor_report.SLASTNAME3#)>
<cfset Temp = QuerySetCell(read_report, "SLASTNAME4", #read_internal_processor_report.SLASTNAME4#)>
<cfset Temp = QuerySetCell(read_report, "SMINAME1", #read_internal_processor_report.SMINAME1#)>
<cfset Temp = QuerySetCell(read_report, "SMINAME2", #read_internal_processor_report.SMINAME2#)>
<cfset Temp = QuerySetCell(read_report, "SMINAME3", #read_internal_processor_report.SMINAME3#)>
<cfset Temp = QuerySetCell(read_report, "SMINAME4", #read_internal_processor_report.SMINAME4#)>
<cfset Temp = QuerySetCell(read_report, "SPECIAL_ABS_INST", #read_internal_processor_report.SPECIAL_ABS_INST#)>
<cfset Temp = QuerySetCell(read_report, "SPECIAL_INST", #read_internal_processor_report.SPECIAL_INST#)>
<cfset Temp = QuerySetCell(read_report, "SR_CLOSING_PAID", #read_internal_processor_report.SR_CLOSING_PAID#)>
<cfset Temp = QuerySetCell(read_report, "SR_CLOSING_PAID_DATE", #read_internal_processor_report.SR_CLOSING_PAID_DATE#)>
<cfset Temp = QuerySetCell(read_report, "SSSN1", #read_internal_processor_report.SSSN1#)>
<cfset Temp = QuerySetCell(read_report, "SSSN2", #read_internal_processor_report.SSSN2#)>
<cfset Temp = QuerySetCell(read_report, "SSSN3", #read_internal_processor_report.SSSN3#)>
<cfset Temp = QuerySetCell(read_report, "SSSN4", #read_internal_processor_report.SSSN4#)>
<cfset Temp = QuerySetCell(read_report, "STATE", #read_internal_processor_report.STATE#)>
<cfset Temp = QuerySetCell(read_report, "STATUS", #read_internal_processor_report.STATUS#)>
<cfset Temp = QuerySetCell(read_report, "STREAMLINE_CLIENT", #read_internal_processor_report.STREAMLINE_CLIENT#)>
<cfset Temp = QuerySetCell(read_report, "STREAMLINE_CONTROLS", #read_internal_processor_report.STREAMLINE_CONTROLS#)>
<cfset Temp = QuerySetCell(read_report, "SUBACCOUNTNO", #read_internal_processor_report.SUBACCOUNTNO#)>
<cfset Temp = QuerySetCell(read_report, "SUBAMOUNT", #read_internal_processor_report.SUBAMOUNT#)>
<cfset Temp = QuerySetCell(read_report, "SUBLENDER", #read_internal_processor_report.SUBLENDER#)>
<cfset Temp = QuerySetCell(read_report, "SUBORDINATION", #read_internal_processor_report.SUBORDINATION#)>
<cfset Temp = QuerySetCell(read_report, "SUBORDINATION_NEEDED", #read_internal_processor_report.SUBORDINATION_NEEDED#)>
<cfset Temp = QuerySetCell(read_report, "SUBORDINATION_RECEIVED", #read_internal_processor_report.SUBORDINATION_RECEIVED#)>
<cfset Temp = QuerySetCell(read_report, "SURVEYS_NEEDED", #read_internal_processor_report.SURVEYS_NEEDED#)>
<cfset Temp = QuerySetCell(read_report, "SURVEYS_RECEIVED", #read_internal_processor_report.SURVEYS_RECEIVED#)>
<cfset Temp = QuerySetCell(read_report, "SWPHONE1", #read_internal_processor_report.SWPHONE1#)>
<cfset Temp = QuerySetCell(read_report, "SWPHONE2", #read_internal_processor_report.SWPHONE2#)>
<cfset Temp = QuerySetCell(read_report, "SWPHONE3", #read_internal_processor_report.SWPHONE3#)>
<cfset Temp = QuerySetCell(read_report, "SWPHONE4", #read_internal_processor_report.SWPHONE4#)>
<cfset Temp = QuerySetCell(read_report, "TAXID1", #read_internal_processor_report.TAXID1#)>
<cfset Temp = QuerySetCell(read_report, "TAXID2", #read_internal_processor_report.TAXID2#)>
<cfset Temp = QuerySetCell(read_report, "TAX_ID_OVERRIDE", #read_internal_processor_report.TAX_ID_OVERRIDE#)>
<cfset Temp = QuerySetCell(read_report, "TC_VERSION", #read_internal_processor_report.TC_VERSION#)>
<cfset Temp = QuerySetCell(read_report, "TEAM_ID", #read_internal_processor_report.TEAM_ID#)>
<cfset Temp = QuerySetCell(read_report, "TEST_ACCOUNT", #read_internal_processor_report.TEST_ACCOUNT#)>
<cfset Temp = QuerySetCell(read_report, "THIRDP", #read_internal_processor_report.THIRDP#)>
<cfset Temp = QuerySetCell(read_report, "TITLE_ABSTRACT", #read_internal_processor_report.TITLE_ABSTRACT#)>
<cfset Temp = QuerySetCell(read_report, "TITLE_CLAIM", #read_internal_processor_report.TITLE_CLAIM#)>
<cfset Temp = QuerySetCell(read_report, "TITLE_GRADE", #read_internal_processor_report.TITLE_GRADE#)>
<cfset Temp = QuerySetCell(read_report, "TITLE_GRADE_DOCUMENT", #read_internal_processor_report.TITLE_GRADE_DOCUMENT#)>
<cfset Temp = QuerySetCell(read_report, "TITLE_ID", #read_internal_processor_report.TITLE_ID#)>
<cfset Temp = QuerySetCell(read_report, "TITLE_ISSUE", #read_internal_processor_report.TITLE_ISSUE#)>
<cfset Temp = QuerySetCell(read_report, "TITLE_ISSUE_COMMENTS", #read_internal_processor_report.TITLE_ISSUE_COMMENTS#)>
<cfset Temp = QuerySetCell(read_report, "TITLE_PACKAGE_UPLOAD", #read_internal_processor_report.TITLE_PACKAGE_UPLOAD#)>
<cfset Temp = QuerySetCell(read_report, "TITLE_PACKAGE_UPLOAD_DATE", #read_internal_processor_report.TITLE_PACKAGE_UPLOAD_DATE#)>
<cfset Temp = QuerySetCell(read_report, "TPD_COMPLETE", #read_internal_processor_report.TPD_COMPLETE#)>
<cfset Temp = QuerySetCell(read_report, "TRANSFER_TAX_PAID_BY", #read_internal_processor_report.TRANSFER_TAX_PAID_BY#)>
<cfset Temp = QuerySetCell(read_report, "TRUST_DOCS_NEEDED", #read_internal_processor_report.TRUST_DOCS_NEEDED#)>
<cfset Temp = QuerySetCell(read_report, "TRUST_DOCS_RECEIVED", #read_internal_processor_report.TRUST_DOCS_RECEIVED#)>
<cfset Temp = QuerySetCell(read_report, "TYPE", #read_internal_processor_report.TYPE#)>
<cfset Temp = QuerySetCell(read_report, "T_CURRENTDATE", #read_internal_processor_report.T_CURRENTDATE#)>
<cfset Temp = QuerySetCell(read_report, "T_STATUS", #read_internal_processor_report.T_STATUS#)>
<cfset Temp = QuerySetCell(read_report, "UNDERLYING_MORTGAGE", #read_internal_processor_report.UNDERLYING_MORTGAGE#)>
<cfset Temp = QuerySetCell(read_report, "UNDERWRITER_CELL_PHONE", #read_internal_processor_report.UNDERWRITER_CELL_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "UNDERWRITER_DAY_PHONE", #read_internal_processor_report.UNDERWRITER_DAY_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "UNDERWRITER_EMAIL", #read_internal_processor_report.UNDERWRITER_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "UNDERWRITER_EVE_PHONE", #read_internal_processor_report.UNDERWRITER_EVE_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "UNDERWRITER_FAX", #read_internal_processor_report.UNDERWRITER_FAX#)>
<cfset Temp = QuerySetCell(read_report, "UNDERWRITER_NAME", #read_internal_processor_report.UNDERWRITER_NAME#)>
<cfset Temp = QuerySetCell(read_report, "UNDERWRITER_PAGER", #read_internal_processor_report.UNDERWRITER_PAGER#)>
<cfset Temp = QuerySetCell(read_report, "UNDIVIDED_PERCENTAGE", #read_internal_processor_report.UNDIVIDED_PERCENTAGE#)>
<cfset Temp = QuerySetCell(read_report, "UNIT_NUM", #read_internal_processor_report.UNIT_NUM#)>
<cfset Temp = QuerySetCell(read_report, "UPDATED", #read_internal_processor_report.UPDATED#)>
<cfset Temp = QuerySetCell(read_report, "UPDATED_BILLING", #read_internal_processor_report.UPDATED_BILLING#)>
<cfset Temp = QuerySetCell(read_report, "UPDATED_LAST_ORDER_DATE", #read_internal_processor_report.UPDATED_LAST_ORDER_DATE#)>
<cfset Temp = QuerySetCell(read_report, "UPDATES_DC", #read_internal_processor_report.UPDATES_DC#)>
<cfset Temp = QuerySetCell(read_report, "UPDATES_FL", #read_internal_processor_report.UPDATES_FL#)>
<cfset Temp = QuerySetCell(read_report, "UPDATES_MD", #read_internal_processor_report.UPDATES_MD#)>
<cfset Temp = QuerySetCell(read_report, "UPDATES_PA", #read_internal_processor_report.UPDATES_PA#)>
<cfset Temp = QuerySetCell(read_report, "UPDATES_REG", #read_internal_processor_report.UPDATES_REG#)>
<cfset Temp = QuerySetCell(read_report, "UPDATES_VA", #read_internal_processor_report.UPDATES_VA#)>
<cfset Temp = QuerySetCell(read_report, "USER_ID", #read_internal_processor_report.USER_ID#)>
<cfset Temp = QuerySetCell(read_report, "USE_APR", #read_internal_processor_report.USE_APR#)>
<cfset Temp = QuerySetCell(read_report, "USPROSERV_TRANSACTION_ID", #read_internal_processor_report.USPROSERV_TRANSACTION_ID#)>
<cfset Temp = QuerySetCell(read_report, "VA_DC", #read_internal_processor_report.VA_DC#)>
<cfset Temp = QuerySetCell(read_report, "VA_FL", #read_internal_processor_report.VA_FL#)>
<cfset Temp = QuerySetCell(read_report, "VA_MD", #read_internal_processor_report.VA_MD#)>
<cfset Temp = QuerySetCell(read_report, "VA_PA", #read_internal_processor_report.VA_PA#)>
<cfset Temp = QuerySetCell(read_report, "VA_REG", #read_internal_processor_report.VA_REG#)>
<cfset Temp = QuerySetCell(read_report, "VA_VA", #read_internal_processor_report.VA_VA#)>
<cfset Temp = QuerySetCell(read_report, "VENDOR_MANAGER_CELL_PHONE", #read_internal_processor_report.VENDOR_MANAGER_CELL_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "VENDOR_MANAGER_DAY_PHONE", #read_internal_processor_report.VENDOR_MANAGER_DAY_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "VENDOR_MANAGER_EMAIL", #read_internal_processor_report.VENDOR_MANAGER_EMAIL#)>
<cfset Temp = QuerySetCell(read_report, "VENDOR_MANAGER_EVE_PHONE", #read_internal_processor_report.VENDOR_MANAGER_EVE_PHONE#)>
<cfset Temp = QuerySetCell(read_report, "VENDOR_MANAGER_FAX", #read_internal_processor_report.VENDOR_MANAGER_FAX#)>
<cfset Temp = QuerySetCell(read_report, "VENDOR_MANAGER_NAME", #read_internal_processor_report.VENDOR_MANAGER_NAME#)>
<cfset Temp = QuerySetCell(read_report, "VENDOR_MANAGER_PAGER", #read_internal_processor_report.VENDOR_MANAGER_PAGER#)>
<cfset Temp = QuerySetCell(read_report, "VERIFYEMAIL", #read_internal_processor_report.VERIFYEMAIL#)>
<cfset Temp = QuerySetCell(read_report, "VERIFYEMAIL_2", #read_internal_processor_report.VERIFYEMAIL_2#)>
<cfset Temp = QuerySetCell(read_report, "VERIFYEMAIL_3", #read_internal_processor_report.VERIFYEMAIL_3#)>
<cfset Temp = QuerySetCell(read_report, "VESTED_OVERRIDE", #read_internal_processor_report.VESTED_OVERRIDE#)>
<cfset Temp = QuerySetCell(read_report, "VESTING_OVERRIDE", #read_internal_processor_report.VESTING_OVERRIDE#)>
<cfset Temp = QuerySetCell(read_report, "VET_AFF_DC", #read_internal_processor_report.VET_AFF_DC#)>
<cfset Temp = QuerySetCell(read_report, "VET_AFF_FL", #read_internal_processor_report.VET_AFF_FL#)>
<cfset Temp = QuerySetCell(read_report, "VET_AFF_MD", #read_internal_processor_report.VET_AFF_MD#)>
<cfset Temp = QuerySetCell(read_report, "VET_AFF_PA", #read_internal_processor_report.VET_AFF_PA#)>
<cfset Temp = QuerySetCell(read_report, "VET_AFF_REG", #read_internal_processor_report.VET_AFF_REG#)>
<cfset Temp = QuerySetCell(read_report, "VET_AFF_VA", #read_internal_processor_report.VET_AFF_VA#)>
<cfset Temp = QuerySetCell(read_report, "VRM_DEED_UPLOAD", #read_internal_processor_report.VRM_DEED_UPLOAD#)>
<cfset Temp = QuerySetCell(read_report, "VRM_DEED_UPLOAD_DATE", #read_internal_processor_report.VRM_DEED_UPLOAD_DATE#)>
<cfset Temp = QuerySetCell(read_report, "V_STATUS", #read_internal_processor_report.V_STATUS#)>
<cfset Temp = QuerySetCell(read_report, "WAIVER_SIGNED", #read_internal_processor_report.WAIVER_SIGNED#)>
<cfset Temp = QuerySetCell(read_report, "WHICH_BULK_RATE_USED", #read_internal_processor_report.WHICH_BULK_RATE_USED#)>
<cfset Temp = QuerySetCell(read_report, "WIPRO_CONFIRM_DATE", #read_internal_processor_report.WIPRO_CONFIRM_DATE#)>
<cfset Temp = QuerySetCell(read_report, "WIPRO_GFE_CONFIRM", #read_internal_processor_report.WIPRO_GFE_CONFIRM#)>
<cfset Temp = QuerySetCell(read_report, "WIPRO_ID", #read_internal_processor_report.WIPRO_ID#)>
<cfset Temp = QuerySetCell(read_report, "WIRE_CONF_COMMENTS", #read_internal_processor_report.WIRE_CONF_COMMENTS#)>
<cfset Temp = QuerySetCell(read_report, "WIRE_CONF_NUMBER", #read_internal_processor_report.WIRE_CONF_NUMBER#)>
<cfset Temp = QuerySetCell(read_report, "ZIP_CODE", #read_internal_processor_report.ZIP_CODE#)></Cfif>
</cfoutput>










<CFQUERY DATASOURCE="#request.dsn#" NAME="read_prop">
SELECT     *
FROM         property t INNER JOIN
                      Companies c ON t.comp_id = c.ID
WHERE     ((t.cancelled IS NULL and t.oda_year > 2003) AND (<cfif IsNumeric(number)>(t.Prop_ID = #number#) OR
                      </cfif>(t.cancelled IS NULL) AND (t.blastname1 LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.blastname2 LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.paddress LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.loan_number LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.reo_number LIKE '%#number#%'))
<CFIF #read_user.role_id# eq 24 or read_user.fairfax_admin eq 1 or read_user.tx_admin eq 1 or read_user.ft_fairfax_admin eq 1>
		And (c.id IN(#companylist#) or t.pstate = 'TX')
<CFELSEIF #read_user.va_employee# eq 'True'>
		And (c.id IN(#va_companies#))
</CFIF>
<CFIF #read_user.id# eq 319 or #read_user.id# eq 320 or #read_user.id# eq 426 or #read_user.id# eq 322 or #read_user.id# eq 339 or #read_user.id# eq 324 or #read_user.id# eq 359>
		And (t.order_date > '7/15/2008')
</CFIF>


<CFIF read_user.mi_admin eq 1 or read_user.mo_admin eq 1 or read_user.mi_flushing_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#))
</CFIF>
<cfif isDefined("url.comp_id")>
	AND c.id = #url.comp_id#
</cfif>
)
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_app">
SELECT     *
FROM         appraisal t INNER JOIN
                      Companies c ON t.comp_id = c.ID
WHERE     ((t.check_date > '1/1/2005') AND (<cfif IsNumeric(number)>(t.app_ID = #number#) OR
                      </cfif>(t.blastname1 LIKE '%#number#%') OR
                     (t.blastname2 LIKE '%#number#%'))
<CFIF #read_user.role_id# eq 24 or read_user.fairfax_admin eq 1 or read_user.tx_admin eq 1 or read_user.mo_admin eq 1 or read_user.mi_admin eq 1 or read_user.mi_flushing_admin eq 1 or read_user.ft_fairfax_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#) or t.pstate = 'TX')
<CFELSEIF #read_user.va_employee# eq 'True'>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#va_companies#))
</CFIF>
<CFIF #read_user.id# eq 319 or #read_user.id# eq 320 or #read_user.id# eq 426 or #read_user.id# eq 322 or #read_user.id# eq 339 or #read_user.id# eq 324 or #read_user.id# eq 359>
		And (t.check_date > '7/15/2008')
</CFIF>
<cfif isDefined("url.comp_id")>
	AND c.id = #url.comp_id#
</cfif>
)

</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_anc">
SELECT     *
FROM         ancillary t INNER JOIN
                      Companies c ON t.comp_id = c.ID
WHERE     ((t.check_date > '1/1/2005') AND (t.codeFlood is not null) AND (<cfif IsNumeric(number)>(t.anc_ID = #number#) OR
                      </cfif>(t.codeFlood is not null) AND (t.blastname1 LIKE '%#number#%') OR
                      (t.codeFlood is not null) AND (t.blastname2 LIKE '%#number#%') )
<CFIF #read_user.role_id# eq 24 or read_user.fairfax_admin eq 1 or read_user.tx_admin eq 1 or read_user.ft_fairfax_admin eq 1 or read_user.mi_admin eq 1 or read_user.mo_admin eq 1 or read_user.mi_flushing_admin eq 1 >
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#) or t.pstate = 'TX')
<CFELSEIF #read_user.va_employee# eq 'True'>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset va_companies = ListAppend(va_companies, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#va_companies#))
</CFIF>
<CFIF #read_user.id# eq 319 or #read_user.id# eq 320 or #read_user.id# eq 426 or #read_user.id# eq 322 or #read_user.id# eq 339 or #read_user.id# eq 324 or #read_user.id# eq 359>
		And (t.check_date > '7/15/2008')
</CFIF>
<cfif isDefined("url.comp_id")>
	AND c.id = #url.comp_id#
</cfif>
)

</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_cr">
SELECT     *
FROM         ancillary t INNER JOIN
                      Companies c ON t.comp_id = c.ID
WHERE     ((t.check_date > '1/1/2005') AND (t.codeCR is not null) AND (<cfif IsNumeric(number)>(t.anc_ID = #number#) OR
                      </cfif>(t.codeCR is not null) AND (t.blastname1 LIKE '%#number#%') OR
                      (t.codeCR is not null) AND (t.blastname2 LIKE '%#number#%') )
<CFIF #read_user.role_id# eq 24 or read_user.fairfax_admin eq 1 or read_user.tx_admin eq 1 or read_user.ft_fairfax_admin eq 1 or read_user.mi_admin eq 1 or read_user.mo_admin eq 1 or read_user.mi_flushing_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#) or t.pstate = 'TX')
<CFELSEIF #read_user.va_employee# eq 'True'>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset va_companies = ListAppend(va_companies, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#va_companies#))
</CFIF>
<CFIF #read_user.id# eq 319 or #read_user.id# eq 320 or #read_user.id# eq 426 or #read_user.id# eq 322 or #read_user.id# eq 339 or #read_user.id# eq 324 or #read_user.id# eq 359>
		And (t.check_date > '7/15/2008')
</CFIF>
<cfif isDefined("url.comp_id")>
	AND c.id = #url.comp_id#
</cfif>
)

</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_avm">
SELECT     *
FROM         ancillary t INNER JOIN
                      Companies c ON t.comp_id = c.ID
WHERE     ((t.check_date > '1/1/2005') AND (t.codeAVM is not null) AND (<cfif IsNumeric(number)>(t.anc_ID = #number#) OR
                      </cfif>(t.codeAVM is not null) AND (t.blastname1 LIKE '%#number#%') OR
                      (t.codeAVM is not null) AND (t.blastname2 LIKE '%#number#%'))
<CFIF #read_user.role_id# eq 24 or read_user.fairfax_admin eq 1 or read_user.tx_admin eq 1 or read_user.ft_fairfax_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#) or t.pstate = 'TX')
<CFELSEIF #read_user.va_employee# eq 'True'>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset va_companies = ListAppend(va_companies, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#va_companies#))
</CFIF>
<CFIF #read_user.id# eq 319 or #read_user.id# eq 320 or #read_user.id# eq 426 or #read_user.id# eq 322 or #read_user.id# eq 339 or #read_user.id# eq 324 or #read_user.id# eq 359>
		And (t.check_date > '7/15/2008')
</CFIF>
<CFIF read_user.mi_admin eq 1 or read_user.mo_admin eq 1 or read_user.mi_flushing_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#))
</CFIF>
<cfif isDefined("url.comp_id")>
	AND c.id = #url.comp_id#
</cfif>
)
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_sn">
SELECT     *
FROM         ancillary t INNER JOIN
                      Companies c ON t.comp_id = c.ID
WHERE     ((t.check_date > '1/1/2005') AND (t.codeSigning is not null) AND (<cfif IsNumeric(number)>(t.anc_ID = #number#) OR
                      </cfif>(t.codeSigning is not null) AND (t.blastname1 LIKE '%#number#%') OR
                      (t.codeSigning is not null) AND (t.blastname2 LIKE '%#number#%'))
<CFIF #read_user.role_id# eq 24 or read_user.fairfax_admin eq 1 or read_user.tx_admin eq 1 or read_user.ft_fairfax_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#) or t.pstate = 'TX')
<CFELSEIF #read_user.va_employee# eq 'True'>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset va_companies = ListAppend(va_companies, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#va_companies#))
</CFIF>
<CFIF #read_user.id# eq 319 or #read_user.id# eq 320 or #read_user.id# eq 426 or #read_user.id# eq 322 or #read_user.id# eq 339 or #read_user.id# eq 324 or #read_user.id# eq 359>
		And (t.check_date > '7/15/2008')
</CFIF>
<CFIF read_user.mi_admin eq 1 or read_user.mo_admin eq 1 or read_user.mi_flushing_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#))
</CFIF>
<cfif isDefined("url.comp_id")>
	AND c.id = #url.comp_id#
</cfif>
)
</CFQUERY>




<CFQUERY DATASOURCE="#request.dsn#" NAME="read_fdr">
SELECT     *
FROM         Final_Document_Retrieval t INNER JOIN
                      Companies c ON t.comp_id = c.ID
WHERE     ((t.cancelled IS NULL) AND (<cfif IsNumeric(number)>(t.FDR_ID = #number#) OR
                      </cfif>(t.cancelled IS NULL) AND (t.blastname1 LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.blastname2 LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.paddress LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.loan_number LIKE '%#number#%'))
<CFIF #read_user.role_id# eq 24 or read_user.fairfax_admin eq 1 or read_user.tx_admin eq 1 or read_user.ft_fairfax_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#) or t.pstate = 'TX')
<CFELSEIF #read_user.va_employee# eq 'True'>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset va_companies = ListAppend(va_companies, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#va_companies#))
</CFIF>
<CFIF #read_user.id# eq 319 or #read_user.id# eq 320 or #read_user.id# eq 426 or #read_user.id# eq 322 or #read_user.id# eq 339 or #read_user.id# eq 324 or #read_user.id# eq 359>
		And (t.order_date > '7/15/2008')
</CFIF>
<CFIF read_user.mi_admin eq 1 or read_user.mo_admin eq 1 or read_user.mi_flushing_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#))
</CFIF>
<cfif isDefined("url.comp_id")>
	AND c.id = #url.comp_id#
</cfif>
)
</CFQUERY>




<CFQUERY DATASOURCE="#request.dsn#" NAME="read_pr">
SELECT     *
FROM         Policy_Recovery t INNER JOIN
                      Companies c ON t.comp_id = c.ID
WHERE     ((t.cancelled IS NULL) AND (<cfif IsNumeric(number)>(t.PR_ID = #number#) OR
                      </cfif>(t.cancelled IS NULL) AND (t.blastname1 LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.blastname2 LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.paddress LIKE '%#number#%') OR
                      (t.cancelled IS NULL) AND (t.loan_number LIKE '%#number#%'))
<CFIF #read_user.role_id# eq 24 or read_user.fairfax_admin eq 1 or read_user.tx_admin eq 1 or read_user.ft_fairfax_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#) or t.pstate = 'TX')
<CFELSEIF #read_user.va_employee# eq 'True'>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset va_companies = ListAppend(va_companies, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#va_companies#))
</CFIF>
<CFIF #read_user.id# eq 319 or #read_user.id# eq 320 or #read_user.id# eq 426 or #read_user.id# eq 322 or #read_user.id# eq 339 or #read_user.id# eq 324 or #read_user.id# eq 359>
		And (t.order_date > '7/15/2008')
</CFIF>
<CFIF read_user.mi_admin eq 1 or read_user.mo_admin eq 1 or read_user.mi_flushing_admin eq 1>
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          <cfset companylist = ListAppend(companylist, "9711,10436,11086,11100,11087", ",")>
          </cfif>
		And (c.id IN(#companylist#))
</CFIF>
<cfif isDefined("url.comp_id")>
	AND c.id = #url.comp_id#
</cfif>
)
</CFQUERY>



<CFSET r_count = #read_report.recordcount# + #read_prop.recordcount# + #read_app.recordcount# + #read_anc.recordcount# + #read_avm.recordcount# + #read_cr.recordcount# + #read_sn.recordcount# + #read_fdr.recordcount# + #read_pr.recordcount#>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>


</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND=""  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=820 align=center valign=top>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=820 align=center valign=top bgcolor=e1e1e1>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Commitment Report Search</B></CENTER>
			</TD>
		</TR>

	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
</td></tr>


	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>



						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>


						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>


						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
    <cfset realec_files = 0>



			<CFOUTPUT QUERY="read_report">
<cfif read_report.closingInsight_transactionId neq 'NULL' and read_report.closingInsight_transactionId neq ''>
<cfset a_bgcolor = 'FF0000'>
<cfset realec_files = 1>
</cfif>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif Len(#company1#)>#company1#<cfelse>#BFirstName1# #BLastName1#</cfif>
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>



	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">


	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=0&title_id=#title_id#&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&a_trigger=0&code=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>




	  </td>


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&oda_month=#oda_month#&company_id=0&code=T"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>



		</tr>
			</CFOUTPUT>


			<CFOUTPUT QUERY="read_prop">

					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							P-0232#prop_id#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>


						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>


						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>



	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">


	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
<a href="./prop_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_prop.prop_id#&user_id=#user_id#&company_id=0&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&a_trigger=0&code=P" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	




	  </td>


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&oda_month=#oda_month#&company_id=0&code=P"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>



		</tr>
			</CFOUTPUT>






			<CFOUTPUT QUERY="read_app">

					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							APP-210#app_id#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>


						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>


						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>



	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">


	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_app.app_id#&user_id=#user_id#&company_id=0&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&a_trigger=0&rec_type=app&code=A" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>




	  </td>


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_appraisal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&oda_month=#oda_month#&company_id=0&code=A"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>



		</tr>
			</CFOUTPUT>






			<CFOUTPUT QUERY="read_anc">

					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							F-#aNC_id#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>


						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>


						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>



	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">


	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_anc.anc_id#&user_id=#user_id#&company_id=0&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&a_trigger=0&code=F" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>




	  </td>


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&oda_month=#oda_month#&company_id=0&code=F"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>



		</tr>
			</CFOUTPUT>





			<CFOUTPUT QUERY="read_CR">

					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							CR-#aNC_id#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>


						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>


						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>



	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">


	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_cr.anc_id#&user_id=#user_id#&company_id=0&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&a_trigger=0&code=CR" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>




	  </td>


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&oda_month=#oda_month#&company_id=0&code=CR"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>



		</tr>
			</CFOUTPUT>






			<CFOUTPUT QUERY="read_AVM">


					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							AVM-#aNC_id#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>


						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>


						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>



	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">


	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_avm.anc_id#&user_id=#user_id#&company_id=0&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&a_trigger=0&code=AVM" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>




	  </td>


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&oda_month=#oda_month#&company_id=0&code=AVM"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>



		</tr>
			</CFOUTPUT>



			<CFOUTPUT QUERY="read_SN">



					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							SN-#aNC_id#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>


						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>


						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>



	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">


	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_sn.anc_id#&user_id=#user_id#&company_id=0&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&a_trigger=0&code=SN" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>




	  </td>


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&oda_month=#oda_month#&company_id=0&code=SN"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>



		</tr>
			</CFOUTPUT>
			
			
			
			
			
			<CFOUTPUT QUERY="read_fdr">

					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(order_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							FDR-#fdr_id#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>


						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>


						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							&nbsp;
						</td>



	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">


	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
<a href="./title_comments_nav_fdr.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_fdr.fdr_id#&user_id=#user_id#&company_id=0&comments=#a_comment#&appraisal_status=#appraisal_status#&a_trigger=0&code=FDR" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	




	  </td>


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_nav_fdr.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#fdr_id#&company_id=0&code=FDR"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>



		</tr>
			</CFOUTPUT>






			<CFOUTPUT QUERY="read_pr">

					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(order_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							PR-#pr_id#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>


						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>


						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							&nbsp;
						</td>



	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">


	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
<a href="./title_comments_nav_pr.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_pr.pr_id#&user_id=#user_id#&company_id=0&comments=#a_comment#&appraisal_status=#appraisal_status#&a_trigger=0&code=PR" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	




	  </td>


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_nav_pr.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#pr_id#&code=PR"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>



		</tr>
			</CFOUTPUT>

<cfif realec_files eq 1>
<tr>
<td colspan = 6><FONT FACE=verdana SIZE=1 color="black">&nbsp;*** Files with a bright red background must be processed through the RealEC system.</FONT></td>
</tr>
</cfif>


				</table>



			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

</BODY>
</HTML>
