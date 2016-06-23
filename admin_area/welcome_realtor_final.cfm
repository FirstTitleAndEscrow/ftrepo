<!--- <cfif cgi.REMOTE_ADDR eq '98.233.55.8'>

<cfabort>
</cfif>
 --->
<cfparam name="form.welcome_create_date" default="">
<cfparam name="form.realtor_email" default="">
<cfparam name="form.realtor_fname" default="">
<cfparam name="form.realtor" default="">

<CFQUERY datasource="#request.dsn#" NAME="find_record">
SELECT *
FROM closing_form_mods
WHERE Title_ID = #rec_id#
</CFQUERY>
<cfif find_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_record">
insert into closing_form_mods (title_id, welcome_create_date, realtor_email, realtor_fname, realtor)
values (#rec_id#, '#form.welcome_create_date#', '#form.realtor_email#', '#form.realtor_fname#', '#form.realtor#')
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update closing_form_mods
set welcome_create_date = '#form.welcome_create_date#',
realtor_email = '#form.realtor_email#',
realtor_fname = '#form.realtor_fname#',
realtor = '#form.realtor#'
WHERE Title_ID = #rec_id#
</CFQUERY>
</cfif>



Updating<br>
<cflocation url="welcome_realtor.cfm?rec_id=#url.rec_id#" addtoken="no">