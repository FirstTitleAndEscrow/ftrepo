<CFQUERY datasource="#request.dsn#" NAME="getid">
	select file_id from apr_files
	where id = #id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="delete">
	delete from apr_files
	where id = #id#
</CFQUERY>

<cfif isDefined("returnUrl")>
	<cflocation url="#returnUrl#" addtoken="no">
<cfelse>
	<cflocation url="apr_files.cfm" addtoken="no">
</cfif>