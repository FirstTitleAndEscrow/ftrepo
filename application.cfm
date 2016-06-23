<cfapplication name="firsttitle" sessionmanagement="Yes">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset turnTimes = CreateObject('component','cfc.TurnTimes')>
<cfset routingSys = CreateObject('component','cfc.RoutingFunctions')>
<cfparam name="session.comp_id" default = "0">
<cfparam name="url.bypass" default = "0">
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

<cfif NOT isDefined("Application.sslfix")>
	<cfset objSecurity = createObject("java", "java.security.Security") />
	<cfset objSecurity.removeProvider("JsafeJCE") />
	<cfset Application.sslfix = true />
</cfif>

<cfparam name="session.mo_employee" default = "0">
<cfparam name="session.mo_admin" default = "0">
<cfparam name="session.mi_employee" default = "0">
<cfparam name="session.mi_admin" default = "0">
<cfparam name="session.mi_flushing_employee" default = "0">
<cfparam name="session.mi_flushing_admin" default = "0">
<cfparam name="session.tx_employee" default = "0">
<cfparam name="session.tx_admin" default = "0">
<cfparam name="session.va_employee" default = "0">
<cfparam name="session.va_admin" default = "0">
<cfparam name="session.ft_fairfax_employee" default = "0">
<cfparam name="session.ft_fairfax_admin" default = "0">
	
<!---
<cferror
type="exception"
template="./cferror.cfm"
/>
--->


<CFSET  a_list_of_all_states = "AL|AK|AZ|AR|CA|CO|CT|DE|DC|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY">

<CFSET a_list_of_all_states_1 = #ListToArray(a_list_of_all_states, "|")#>
<!--- <cfparam name="session.ft_user_id" default="264"> --->
<!--- <cferror type="exception"
    template="error_handler.cfm"
    mailto="techsupport@firsttitleservices.com">  --->
	<cfif not Find("client_reset",GetFileFromPath(GetBaseTemplatePath()))>
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

 
<!---<cfif cgi.REMOTE_ADDR eq '98.233.235.105'>
<cfoutput>stop here</cfoutput>
<cfabort>
</cfif>--->

<cfif url.bypass eq 0>
<cfif IsDefined("url.comp_id") AND not FindNoCase("order_verify_title",path_info) AND not FindNoCase("HUD1_2010_PDF",path_info) AND not FindNoCase("QUOTE_",path_info)>


<cfif IsDefined("url.comp_id")>
    <cfquery name="get_master_info" datasource="#request.dsn#">
		SELECT  child_ids, master_co_id from companies
		WHERE ID = #url.comp_id#
	</cfquery>
</cfif>

<cfif Not IsDefined("session.is_logged_in") and IsDefined("Cookie.FT_Auth")>
<cfset session.is_logged_in = 1>
<cfset session.comp_id = '#Cookie.FT_Auth#'>
</cfif>


<cfif IsDefined("session.ft_user_id") or (IsDefined("session.is_logged_in") and session.comp_id eq url.comp_id) or (IsDefined("session.is_logged_in") and (session.comp_id eq url.comp_id or get_master_info.master_co_id eq session.comp_id))>

<!--- continue to login --->
<cfelse>

<cfcookie 
name="goto_url" 
value="https://#cgi.HTTP_HOST##cgi.PATH_INFO#?#cgi.QUERY_STRING#" 
expires="never" 
 /> 

<!---<cfmail to="rjermain@firsttitleservices.com" from="rjermain@firsttitleservices.com" subject="LOGIN KICKBACK FAILURE">
<cfoutput>
IsDefined("session.is_logged_in") = #IsDefined("session.is_logged_in")#<br />
session.comp_id = #session.comp_id#<BR />
url.comp_id = #url.comp_id#<br />
<br />
Date: #DateFormat(now(), "mm/dd/yyyy")#<br />
Time: #TimeFormat(Now(), "hh:mm:ss")#<br />
Kicked from application.cfm<br>
attempting to go to https://#cgi.HTTP_HOST##cgi.PATH_INFO#?#cgi.QUERY_STRING#<br>
</cfoutput>
</cfmail>--->



<cflocation url="https://www.firsttitleservices.com/login/" addtoken="yes">
<cfabort>

</cfif>
</cfif>
</cfif>