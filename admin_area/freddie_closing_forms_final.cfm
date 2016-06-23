<cfparam name="form.fannie_loan_id" default="">
<cfparam name="form.reo_number" default="">


<cfparam name="form.DOC_DATE" default="">
<cfparam name="form.FORECLOSURE_DATE" default="">
<cfparam name="form.lender" default="">
<cfparam name="form.title_co" default="">
<cfparam name="form.title_co_gf" default="">
<cfparam name="form.verbal_ack_date" default="">

<CFQUERY datasource="#request.dsn#" NAME="find_record">
SELECT *
FROM closing_form_mods
WHERE Title_ID = #rec_id#
</CFQUERY>
<cfif find_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_record">
insert into closing_form_mods (title_id, doc_date,mustcloseon, foreclosure_date, verbal_ack_date, lender, title_co, title_co_gf,listingagentamt,sellingagentamt,contract_closing_date,finance_type,
attorney_fee,
attorney_fee_charging,
attention,
listingagentpct,
sellingagentpct,
totalcommissionpct,
totalcommissionamt,
sellingcostcredit,
homewarranty,
otherfee1,
otherfee2
)
values (#rec_id#, <cfif IsDate(form.doc_date)>'#form.doc_date#', <cfelse>NULL, </cfif><cfif IsDate(form.mustcloseon)>'#form.mustcloseon#', <cfelse>NULL, </cfif><cfif IsDate(form.foreclosure_date)>'#form.foreclosure_date#', <cfelse>NULL, </cfif><cfif IsDate(form.verbal_ack_date)>'#form.verbal_ack_date#', <cfelse>NULL, </cfif>'#form.lender#', '#form.title_co#', '#form.title_co_gf#','#form.listingagentamt#','#form.sellingagentamt#',
<cfif IsDate(form.contract_closing_date)>'#form.contract_closing_date#',<cfelse> NULL,</cfif>'#form.finance_type#',
'#form.attorney_fee#',
'#form.attorney_fee_charging#',
'#form.attention#',
'#form.listingagentpct#',
'#form.sellingagentpct#',
'#form.totalcommissionpct#',
'#form.totalcommissionamt#',
'#form.sellingcostcredit#',
'#form.homewarranty#',
'#form.otherfee1#',
'#form.otherfee2#'
)
</CFQUERY>
<!---
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update title
set fannie_loan_id  = '#form.fannie_loan_id#',
reo_number  = '#form.reo_number#'
WHERE Title_ID = #rec_id#
</CFQUERY>
--->
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update closing_form_mods
set 
<cfif IsDate(form.doc_date)>
doc_date  = '#form.doc_date#',
<cfelse>
doc_date  = NULL,
</cfif>
<cfif IsDate(form.mustcloseon)>
mustcloseon  = '#form.mustcloseon#',
<cfelse>
mustcloseon  = NULL,
</cfif>
<cfif IsDate(form.foreclosure_date)>
foreclosure_date  = '#form.foreclosure_date#',
<cfelse>
foreclosure_date  = NULL,
</cfif>
<cfif IsDate(form.verbal_ack_date)>
verbal_ack_date  = '#form.verbal_ack_date#',
<cfelse>
verbal_ack_date  = NULL,
</cfif>
<cfif IsDate(form.contract_closing_date)>
contract_closing_date  = '#form.contract_closing_date#',
<cfelse>
contract_closing_date  = NULL,
</cfif>
finance_type = '#form.finance_type#',
title_co  = '#form.title_co#',
title_co_gf  = '#form.title_co_gf#',
lender = '#form.lender#',
listingagentamt = '#form.listingagentamt#',
sellingagentamt = '#form.sellingagentamt#',
attorney_fee = '#form.attorney_fee#',
attorney_fee_charging = '#form.attorney_fee_charging#',
attention = '#form.attention#',
listingagentpct = '#form.listingagentpct#',
sellingagentpct = '#form.sellingagentpct#',
totalcommissionpct = '#form.totalcommissionpct#',
totalcommissionamt = '#form.totalcommissionamt#',
sellingcostcredit = '#form.sellingcostcredit#',
homewarranty = '#form.homewarranty#',
otherfee1 = '#form.otherfee1#',
otherfee2 = '#form.otherfee2#'
WHERE Title_ID = #rec_id#
</CFQUERY>
<!---
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update title
set fannie_loan_id  = '#form.fannie_loan_id#',
reo_number  = '#form.reo_number#'
WHERE Title_ID = #rec_id#
</CFQUERY>
--->
</cfif>


Updating<br>
<cflocation url="freddie_closing_forms.cfm?rec_id=#url.rec_id#" addtoken="no">