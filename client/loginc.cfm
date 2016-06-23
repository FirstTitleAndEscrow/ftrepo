<cfparam name="url.comp_id" default="100">
<CFQUERY datasource="#request.dsn#" NAME="get_company">
Select *
FROM Companies
where ID = #url.comp_id#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="udate_company">
Update Companies
set a_status = 1
where ID = #url.comp_id#
</cfquery>
<cfmail to="spape@firsttitleservices.com" from="webmaster@firsttitleservices.com" subject="#get_company.company# reactivated their account" bcc="rjermain@firsttitleservices.com">
<cfoutput>
#get_company.company# reactivated their account using the MBA mailer.
</cfoutput>
</cfmail>
<cflocation url="loginb.cfm" addtoken="no">