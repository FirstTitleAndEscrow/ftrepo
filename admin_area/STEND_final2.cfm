<cfquery datasource="#request.dsn#">
update Pay_Off_Lender_2_Title
set
	stew2line1 = '#stew2line1#',
	stew2line2 = '#stew2line2#',
	stew2line3 = '#stew2line3#',
	stew2text1 = '#stew2text1#',
	stew2text2 = '#stew2text2#',
	stew2text3 = '#stew2text3#'
where title_id = #URL.rec_id#
</cfquery>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/stend_view2.cfm?rec_id=#url.rec_id#&a_trigger=1">
