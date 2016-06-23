		<cfquery datasource="#request.dsn#">
update Pay_Off_Lender_1_Title
set
	amer3line1 = '#amer3line1#',
	amer3line2 = '#amer3line2#',
	amer3line3 = '#amer3line3#',
	amer3text1 = '#amer3text1#',
	amer3text2 = '#amer3text2#',
	amer3text3 = '#amer3text3#',
	display_date3 = '#DateFormat(Now(), "mmmmm dd, yyyy")#'
where title_id = #URL.rec_id#
</cfquery>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/apend_view3.cfm?rec_id=#url.rec_id#&a_trigger=1">
