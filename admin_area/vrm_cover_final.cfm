
<cfparam name="form.type_of_deed" default="">
<cfparam name="form.state_specific_deed" default="">


<CFQUERY datasource="#request.dsn#" NAME="find_record">
SELECT *
FROM closing_form_mods
WHERE Title_ID = #rec_id#
</CFQUERY>
<cfif find_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_record">
insert into closing_form_mods (title_id, type_of_deed, state_specific_deed)
values (#rec_id#, '#form.type_of_deed#', '#form.state_specific_deed#')
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update closing_form_mods
set type_of_deed = '#form.type_of_deed#',
state_specific_deed = '#form.state_specific_deed#'
WHERE Title_ID = #rec_id#
</CFQUERY>
</cfif>



Updating<br>
<cflocation url="vrm_cover.cfm?rec_id=#url.rec_id#" addtoken="no">