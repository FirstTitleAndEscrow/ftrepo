<cfquery name="updatesql" datasource="#request.dsn#">
exec sp_runDtsPkg
</cfquery>

