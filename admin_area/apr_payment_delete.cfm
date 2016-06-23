<CFQUERY datasource="#request.dsn#" NAME="delete">
	delete from apr_payments
	where apr_payment_id = #apr_payment_id#
</CFQUERY>

<cfif isDefined("returnUrl")>
	<cflocation url="apr_file_modify.cfm?id=#apr_file_id#&returnUrl=#UrlEncodedFormat(returnUrl)#" addtoken="no">
<cfelse>
	<cflocation url="apr_file_modify.cfm?id=#apr_file_id#" addtoken="no">
</cfif>