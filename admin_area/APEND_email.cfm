<cfif #email# neq "">
<CFMAIL
TO="#email#"
FROM="webmaster@firsttitleservices.com" Subject="First Title - Ticor Title Insurance Endorsement for order #rec_id#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/apend_client_view.cfm?rec_id=#rec_id#" target="new">American Pioneer Endorsement</a> for order #rec_id#</B></font><br><br>

First Title staff
</cfmail></cfif>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/apend_view.cfm?rec_id=#rec_id#&a_trigger=2">