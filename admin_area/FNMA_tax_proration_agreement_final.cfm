<cfparam name="form.fannie_loan_id" default="">
<cfparam name="form.fannie_reo_id" default="">
<cfparam name="form.title_co_gf" default="">

<CFQUERY datasource="#request.dsn#" NAME="find_record">
SELECT *
FROM title
WHERE Title_ID = #rec_id#
</CFQUERY>
<cfif find_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_record">
insert into title (fannie_loan_id, fannie_reo_id)
values ('#fannie_loan_id#', '#fannie_reo_id#')
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update title
set fannie_loan_id  = '#form.fannie_loan_id#',
fannie_reo_id = '#form.fannie_reo_id#'
WHERE Title_ID = #rec_id#
</CFQUERY>
</cfif>




<CFQUERY datasource="#request.dsn#" NAME="find_record">
SELECT *
FROM closing_form_mods
WHERE Title_ID = #rec_id#
</CFQUERY>
<cfif find_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_record">
insert into closing_form_mods (title_id, title_co_gf)
values (#rec_id#, '#title_co_gf#')
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update closing_form_mods
set title_co_gf  = '#form.title_co_gf#'
WHERE Title_ID = #rec_id#
</CFQUERY>
</cfif>

Updating<br>
<cflocation url="FNMA_tax_proration_agreement.cfm?rec_id=#url.rec_id#" addtoken="no">