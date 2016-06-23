<cfapplication name="firsttitle" sessionmanagement="Yes">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfparam name="session.comp_id" default = "0">
<cfparam name="rec_id" default="0">



<!--- set environment specific variables--->
<cfset request.dsn = "first_title_main_admin">
<cfset request.httpUrl = "http://machine1.firsttitleservices.com">
<cfset request.httpsUrl  = "https://machine1.firsttitleservices.com">
<cfset request.envName = "prod">
<cfset request.rootDir = "c:\inetpub\wwwroot\clients\firsttitleservices.com\www">

<!---local instance --->
<cfif FindNoCase("local.firsttitleservices", cgi.SERVER_NAME)>
	<cfset request.dsn = "first_title_services_dev">
	<cfset request.httpUrl = "http://local.firsttitleservices.com">
	<cfset request.httpsUrl  = "http://local.firsttitleservices.com">
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


<cfif cgi.HTTP_REFERER contains 'streamline-title'>
<cfset session.site.long_name = 'Streamline Title & Escrow'>
<cfset session.site.short_name = 'Streamline Title'>
<cfset session.site.site_initials = 'ST'>
<cfset session.site.url = 'www.streamline-title.com'>
<cfelse>
<cfset session.site.long_name = 'First Title & Escrow'>
<cfset session.site.short_name = 'First Title'>
<cfset session.site.site_initials = 'FT'>
<cfset session.site.url = 'www.firsttitleservices.com'>
</cfif>



<cfparam name="session.mi_employee" default = "0">
<cfparam name="session.mi_admin" default = "0">
<cfparam name="session.mo_employee" default = "0">
<cfparam name="session.mo_admin" default = "0">
<cfparam name="session.tx_employee" default = "0">
<cfparam name="session.va_employee" default = "0">
<cfparam name="session.mi_flushing_employee" default = "0">
<cfparam name="session.mi_flushing_admin" default = "0">
<cfparam name="session.tx_admin" default = "0">
<cfparam name="session.va_admin" default = "0">
<cfparam name="session.ft_fairfax_employee" default = "0">
<cfparam name="session.ft_fairfax_admin" default = "0">
	



<CFSET  a_list_of_all_states = "AL|AK|AZ|AR|CA|CO|CT|DE|DC|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY">

<CFSET a_list_of_all_states_1 = #ListToArray(a_list_of_all_states, "|")#>
<!--- <cfparam name="session.ft_user_id" default="264"> --->
<!--- <cferror type="exception"
    template="error_handler.cfm"
    mailto="techsupport@firsttitleservices.com">  --->

<cfif not Find("_new",GetFileFromPath(GetBaseTemplatePath())) AND not Find("login",GetFileFromPath(GetBaseTemplatePath())) AND not Find("register",GetFileFromPath(GetBaseTemplatePath())) AND not Find("lock",GetFileFromPath(GetBaseTemplatePath()))>
	
<center>	
</cfif>	
<cffunction name="AddReturnQueryItem" output="false">
<cfargument name="line_number" type="string" default="">
<cfargument name="Description" type="string" default="">
<cfargument name="amount" type="string" default="">
<cfargument name="payer" type="string" default="">			
<cfargument name="outside" type="numeric" default="0">			
<cfargument name="payto" type="string" default="">			
<cfset temp = QueryAddRow(get_fee_query)>
<cfset temp = QuerySetCell(get_fee_query, "Line_Number", arguments.line_number)>
<cfset temp = QuerySetCell(get_fee_query, "Description", arguments.description)>
<cfif IsNumeric(arguments.amount)>
<cfset temp = QuerySetCell(get_fee_query, "Amount", arguments.amount)>
<cfelse>
<cfset temp = QuerySetCell(get_fee_query, "Amount", arguments.amount)>
</cfif>
<cfset temp = QuerySetCell(get_fee_query, "Payer", arguments.payer)>			
<cfset temp = QuerySetCell(get_fee_query, "Payto", arguments.payto)>			
<cfset temp = QuerySetCell(get_fee_query, "Outside", arguments.outside)>		
</cffunction>