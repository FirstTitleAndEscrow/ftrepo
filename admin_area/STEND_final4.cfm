<cfquery datasource="#request.dsn#">
update Pay_Off_Lender_2_Title
set
	stew4line1 = '#stew4line1#',
	stew4line2 = '#stew4line2#',
	stew4line3 = '#stew4line3#',
	stew4text1 = '#stew4text1#',
	stew4text2 = '#stew4text2#',
	stew4text3 = '#stew4text3#'
where title_id = #URL.rec_id#
</cfquery>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/stend_view4.cfm?rec_id=#url.rec_id#&a_trigger=1">
