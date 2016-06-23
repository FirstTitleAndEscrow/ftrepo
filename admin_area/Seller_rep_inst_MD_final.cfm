<cfparam name="form.tenancy" default="">
<cfparam name="form.doc_date" default="">
<cfparam name="form.title_co" default="">
<cfparam name="form.foreclosure_date" default="">

<CFQUERY datasource="#request.dsn#" NAME="find_record">
SELECT *
FROM Closing_Form_Mods
WHERE Title_ID = #rec_id#
</CFQUERY>
<cfif find_record.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_record">
insert into Closing_Form_Mods (title_id, doc_date, title_co, foreclosure_date)
values (#url.rec_id#, '#form.doc_date#', '#form.title_co#', '#form.foreclosure_date#')
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_record">
update Closing_Form_Mods 
set doc_date,  = '#form.doc_date#',
title_co = '#form.title_co#', 
foreclosure_date = '#form.foreclosure_date#'
WHERE Title_ID = #rec_id#
</CFQUERY>
</cfif>

Updating<br>
<cflocation url="seller_rep_inst_va.cfm?rec_id=#url.rec_id#" addtoken="no">