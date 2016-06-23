		<!---  <cfoutput>#URL.rec_id#</cfoutput>

		<cfoutput> line1:#amer2line1# </cfoutput>
		<cfoutput> line2:#amer2line2# </cfoutput>
		<cfoutput> line3:#amer2line3# </cfoutput>
		<cfoutput> text1:#amer2text1# </cfoutput>
		<cfoutput> text2:#amer2text2# </cfoutput>
		<cfoutput> text3:#amer2text3# </cfoutput>
		<cfabort>--->


		<cfquery datasource="#request.dsn#">
update Pay_Off_Lender_1_Title
set
	amer2line1 = '#amer2line1#',
	amer2line2 = '#amer2line2#',
	amer2line3 = '#amer2line3#',
	amer2text1 = '#amer2text1#',
	amer2text2 = '#amer2text2#',
	amer2text3 = '#amer2text3#',
	display_date2 = '#DateFormat(Now(), "mmmmm dd, yyyy")#'
where title_id = #URL.rec_id#
</cfquery>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/apend_view2.cfm?rec_id=#url.rec_id#&a_trigger=1">
