<cfif #a_trigger# EQ "7">



			<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Doc_Title_Insurance_Title
			set	 cleared = '#cleared#',
				clear_needed = '#clear_needed#'
				WHERE title_id = #url.rec_ID#
			</cfquery>


</CFIF>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_Committment.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=0">



