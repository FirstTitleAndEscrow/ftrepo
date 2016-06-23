		<cfquery datasource="#request.dsn#">
update Pay_Off_Lender_1_Title
set
	amerline1 = '#amerline1#',
	amerline2 = '#amerline2#',
	amerline3 = '#amerline3#',
	amertext1 = '#amertext1#',
	amertext2 = '#amertext2#',
	amertext3 = '#amertext3#',
	display_date = '#DateFormat(Now(), "mmmmm dd, yyyy")#'
where title_id = #URL.rec_id#
</cfquery>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/apend_view.cfm?rec_id=#url.rec_id#&a_trigger=1">
