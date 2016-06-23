
		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</cfquery>
	<CFMAIL
TO="#read_title.p_email#"
FROM="rfay@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title - Closing Form for order #read_title.title_id#"
TIMEOUT="600"
type="HTML"
>


</cfmail>


<CFLOCATION URL="https://#cgi.server_name#/admin_area/closing_form.cfm?rec_id=#read_title.title_id#&a_trigger=2">
