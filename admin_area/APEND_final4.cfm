		<cfquery datasource="#request.dsn#">
update Pay_Off_Lender_1_Title
set
	amer4line1 = '#amer4line1#',
	amer4line2 = '#amer4line2#',
	amer4line3 = '#amer4line3#',
	amer4text1 = '#amer4text1#',
	amer4text2 = '#amer4text2#',
	amer4text3 = '#amer4text3#',
	display_date4 = '#DateFormat(Now(), "mmmmm dd, yyyy")#'
where title_id = #URL.rec_id#
</cfquery>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/apend_view4.cfm?rec_id=#url.rec_id#&a_trigger=1">
