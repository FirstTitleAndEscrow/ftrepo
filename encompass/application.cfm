<cfapplication name="firsttitle" sessionmanagement="Yes">

<!--- set environment specific variables--->
<cfparam name="rec_id" default="0">
<cfset request.dsn = "first_title_main_admin">
<cfset request.httpUrl = "http://machine1.firsttitleservices.com">
<cfset request.httpsUrl  = "https://machine1.firsttitleservices.com">
<cfset request.envName = "prod">
<cfset request.rootDir = "c:\inetpub\wwwroot\clients\firsttitleservices.com\www">

<!---local instance --->
<cfif FindNoCase("local.firsttitleservices", cgi.SERVER_NAME)>
	<cfset request.dsn = "first_title_services_dev">
	<cfset request.httpUrl = "http://local.firsttitleservices.com">
	<cfset request.httpsUrl  = "https://local.firsttitleservices.com">
	<cfset request.envName = "dev">
	<cfset request.rootDir = "c:\sites\firsttitleservices\www">
</cfif>

<!---dev instance --->
<cfif FindNoCase("dev.firsttitleservices", cgi.SERVER_NAME)>
	<cfset request.dsn = "first_title_services_dev">
	<cfset request.httpUrl = "http://dev.firsttitleservices.com">
	<cfset request.httpsUrl  = "https://dev.firsttitleservices.com">
	<cfset request.envName = "dev">
	<cfset request.rootDir = "c:\inetpub\wwwroot\clients\firsttitleservices.com\www_dev">
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="find_site" maxrows=1>
	SELECT *
	FROM sites
	where site_url = '#cgi.server_name#'
</CFQUERY>
<cfif find_site.recordcount eq 1>
<cfset session.site.url = "#find_site.site_url#">
<cfset session.site.long_name = "#find_site.long_name#">
<cfset session.site.short_name = "#find_site.short_name#">
<cfset session.site.site_initials = "#find_site.site_initials#">
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="find_site" maxrows=1>
	SELECT *
	FROM sites
	where ID = 1
</CFQUERY>
<cfset session.site.url = "#find_site.site_url#">
<cfset session.site.long_name = "#find_site.long_name#">
<cfset session.site.short_name = "#find_site.short_name#">
<cfset session.site.site_initials = "#find_site.site_initials#">
</cfif>

<cfparam name="session.mi_employee" default = "0">
<cfparam name="session.mi_admin" default = "0">
<cfparam name="session.mo_employee" default = "0">
<cfparam name="session.mo_admin" default = "0">
<cfparam name="session.mi_flushing_employee" default = "0">
<cfparam name="session.mi_flushing_admin" default = "0">
<cfparam name="session.tx_employee" default = "0">
<cfparam name="session.tx_admin" default = "0">
<cfparam name="session.va_employee" default = "0">
<cfparam name="session.va_admin" default = "0">
<cfparam name="session.ft_fairfax_employee" default = "0">
<cfparam name="session.ft_fairfax_admin" default = "0">
	



<CFSET  a_list_of_all_states = "AL|AK|AZ|AR|CA|CO|CT|DE|DC|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY">

<CFSET a_list_of_all_states_1 = #ListToArray(a_list_of_all_states, "|")#>