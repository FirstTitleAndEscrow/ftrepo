
		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</cfquery>
	<CFMAIL
TO="#read_title.p_email#"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title - Closing Form for order #read_title.title_id#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/closing_forms_client_view.cfm?rec_id=#rec_id#" target="new">Closing Form</a> for order #read_title.title_id#</B></font><br><br>

First Title staff
</cfmail>

<cfif #email# neq "">
	<CFMAIL
TO="#email#"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title - Closing Form for order #read_title.title_id#"
TIMEOUT="600"
type="HTML"
>


View/Print <A HREF="https://#cgi.server_name#/closing_forms_client_view.cfm?rec_id=#rec_id#" target="new">Closing Form</a> for order #read_title.title_id#</B></font><br><br>

First Title staff
</cfmail>

</cfif>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/closing_forms.cfm?rec_id=#read_title.title_id#&a_trigger=2">
