<cfquery datasource="#request.dsn#">
update Pay_Off_Lender_2_Title
set
	stewline1 = '#stewline1#',
	stewline2 = '#stewline2#',
	stewline3 = '#stewline3#',
	stewtext1 = '#stewtext1#',
	stewtext2 = '#stewtext2#',
	stewtext3 = '#stewtext3#'
where title_id = #URL.rec_id#
</cfquery>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/faend_view.cfm?rec_id=#url.rec_id#&a_trigger=1">
