
		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</cfquery>
	<CFMAIL
TO="#read_title.p_email#"
FROM="rfay@firsttitleservices.com" Subject="First Title - Lien Release Letter for order #read_title.title_id#<cfif #read_title.loan_number# neq "">, Loan No. - #read_title.loan_number#</cfif>"
TIMEOUT="600"
type="HTML"
>


View/Print <A HREF="/release_client_view.cfm?rec_id=#rec_id#" target="new">Lien Release Letter</a> for order #read_title.title_id#</B></font><br><br>

First Title staff

</cfmail>

<cfif #email# neq "">
	<CFMAIL
TO="#email#"
FROM="webmaster@firsttitleservices.com" Subject="First Title - Stewart Endorsement for order #read_title.title_id#<cfif #read_title.loan_number# neq "">, Loan No. - #read_title.loan_number#</cfif>"
TIMEOUT="600"
type="HTML"
>


View/Print <A HREF="/stend_client_view.cfm?rec_id=#rec_id#" target="new">Stewart Endorsement</a> for order #read_title.title_id#</B></font><br><br>

First Title staff
</cfmail>

</cfif>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/closing_form.cfm?rec_id=#read_title.title_id#&a_trigger=2">
