<cfparam name="form.tenancy" default="">
<cfparam name="form.bforwarding" default="">
<cfparam name="form.bemail" default="">
<cfparam name="form.bworkphone" default="">
<cfparam name="form.bhomephone" default="">
<cfparam name="form.bcellphone" default="">

<CFQUERY datasource="#request.dsn#" NAME="find_record">
SELECT *
FROM Closing_Form_Mods
WHERE Title_ID = #rec_id#
</CFQUERY>
<cfif find_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_record">
insert into Closing_Form_Mods (title_id, tenancy, bforwarding, bemail, bworkphone, bhomephone, bcellphone)
values (#url.rec_id#, '#form.tenancy#', '#form.bforwarding#', '#form.bemail#', '#form.bworkphone#', '#form.bhomephone#', '#form.bcellphone#')
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update Closing_Form_Mods 
set tenancy,  = '#form.tenancy#',
bforwarding = '#form.bforwarding#', 
bemail = '#form.bemail#', 
bworkphone = '#form.bworkphone#', 
bhomephone = '#form.bhomephone#', 
bcellphone = '#form.bcellphone#'
WHERE Title_ID = #rec_id#
</CFQUERY>
</cfif>

Updating<br>
<cflocation url="st_settlement_and_disclosure.cfm?rec_id=#url.rec_id#" addtoken="no">