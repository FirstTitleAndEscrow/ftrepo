<cfquery datasource="#request.dsn#">
update Pay_Off_Lender_2_Title
set
	stew3line1 = '#stew3line1#',
	stew3line2 = '#stew3line2#',
	stew3line3 = '#stew3line3#',
	stew3text1 = '#stew3text1#',
	stew3text2 = '#stew3text2#',
	stew3text3 = '#stew3text3#'
where title_id = #URL.rec_id#
</cfquery>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/stend_view3.cfm?rec_id=#url.rec_id#&a_trigger=1">
