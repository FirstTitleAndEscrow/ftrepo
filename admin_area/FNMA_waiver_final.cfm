
<cfparam name="form.fannie_reo_id" default="">
<cfparam name="form.verbal_ack_date" default="">

<CFQUERY datasource="#request.dsn#" NAME="find_record">
SELECT *
FROM closing_form_mods
WHERE Title_ID = #rec_id#
</CFQUERY>
<cfif find_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_record">
insert into closing_form_mods (title_id, verbal_ack_date)
values (#rec_id#, '#DateFormat(form.verbal_ack_date, "m/d/yyyy")#')
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update closing_form_mods
set verbal_ack_date  = '#DateFormat(form.verbal_ack_date, "m/d/yyyy")#'
WHERE Title_ID = #rec_id#
</CFQUERY>
</cfif>




<CFQUERY datasource="#request.dsn#" NAME="find_record">
SELECT *
FROM title
WHERE Title_ID = #rec_id#
</CFQUERY>
<cfif find_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_record">
insert into title (fannie_reo_id)
values ('#form.fannie_reo_id#')
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update title
set fannie_reo_id  = '#form.fannie_reo_id#'
WHERE Title_ID = #rec_id#
</CFQUERY>
</cfif>

Updating<br>
<cflocation url="FNMA_waiver.cfm?rec_id=#url.rec_id#" addtoken="no">