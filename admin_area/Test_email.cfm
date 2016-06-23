<CFSET b_emails_to_first_title = "htravis@firsttitleservices.com,dmiller@firsttitleservices.com,pgibb@firsttitleservices.com,nashley@firsttitleservices.com, mharvey@firsttitleservices.com">
<CFMAIL SUBJECT="Test Email"
FROM="htravis@firsttitleservices.com"
TO="#b_emails_to_first_title#"
type="HTML">


</CFMAIL>
