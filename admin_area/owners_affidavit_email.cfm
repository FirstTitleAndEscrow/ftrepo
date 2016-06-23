
		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</cfquery>
	<CFMAIL
TO="#read_title.p_email#"
FROM="webmaster@streamline-title.com"
SERVER="127.0.0.1"
Subject="Streamline - OWNER'S AFFIDAVIT AND ENHANCED OWNER'S POLICY Form for order #read_title.title_id#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/owners_affidavit_client_view.cfm?rec_id=#rec_id#" target="new">OWNER'S AFFIDAVIT AND ENHANCED OWNER'S POLICY Form</a> for order #read_title.title_id#</B></font><br><br>

Streamline Title staff
</cfmail>

<cfif #email# neq "">
	<CFMAIL
TO="#email#"
FROM="webmaster@streamline-title.com"
SERVER="127.0.0.1"
Subject="Streamline - OWNER'S AFFIDAVIT AND ENHANCED OWNER'S POLICY Form for order #read_title.title_id#"
TIMEOUT="600"
type="HTML"
>


View/Print <A HREF="https://#cgi.server_name#/owners_affidavit_client_view.cfm?rec_id=#rec_id#" target="new">OWNER'S AFFIDAVIT AND ENHANCED OWNER'S POLICY Form</a> for order #read_title.title_id#</B></font><br><br>

Streamline Title staff
</cfmail>

</cfif>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/owners_affidavit.cfm?rec_id=#read_title.title_id#&a_trigger=2">
