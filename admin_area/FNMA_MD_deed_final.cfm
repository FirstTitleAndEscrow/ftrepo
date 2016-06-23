<cfparam name="form.fannie_loan_id" default="">
<cfparam name="form.fannie_reo_id" default="">
<cfparam name="form.title_co_gf" default="">

<CFQUERY datasource="#request.dsn#" NAME="find_record">
SELECT *
FROM closing_form_mods
WHERE Title_ID = #rec_id#
</CFQUERY>
<cfif find_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_record">
insert into closing_form_mods (prop_tax_id, assessed_value, poa_info, title_id)
values ('#form.prop_tax_id#', '#form.assessed_value#', '#form.poa_info#', #rec_id#)
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update closing_form_mods
set prop_tax_id  = '#form.prop_tax_id#',
assessed_value  = '#form.assessed_value#',
poa_info = '#form.poa_info#'
WHERE Title_ID = #rec_id#
</CFQUERY>
</cfif>







Updating<br>
<cflocation url="FNMA_VA_deed.cfm?rec_id=#url.rec_id#" addtoken="no">