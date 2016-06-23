<cfapplication name="firsttitle" sessionmanagement="Yes">




<!--- set environment specific variables--->
<cfparam name="rec_id" default="0">
<cfset request.dsn = "first_title_main_admin">
<cfset request.httpUrl = "http://machine1.firsttitleservices.com">
<cfset request.httpsUrl  = "https://machine1.firsttitleservices.com">
<cfset request.envName = "prod">
<cfset request.rootDir = "c:\inetpub\wwwroot\clients\firsttitleservices.com\www">
<cfset request.uploadsDir = "c:\uploads\">
<CFSET request.ProdPath= "c:\inetpub\wwwroot\Clients\firsttitleservices.com\www"> 	  
<CFSET request.BkpPath= "c:\inetpub\wwwroot\Clients\firsttitleservices.com\www_bkup">  
<CFSET request.DevPath= "c:\inetpub\wwwroot\Clients\firsttitleservices.com\www_dev">


<!---local instance --->
<cfif FindNoCase("local.firsttitleservices", cgi.SERVER_NAME)>
	<cfset request.dsn = "first_title_services_dev">
	<cfset request.httpUrl = "http://local.firsttitleservices.com">
	<cfset request.httpsUrl  = "https://local.firsttitleservices.com">
	<cfset request.envName = "dev">
	<cfset request.rootDir = "c:\sites\firsttitleservices">
	<cfset request.uploadsDir = "c:\sites\firsttitleservices\www\admin_area\uploads\">
</cfif>

<!---dev instance --->
<cfif FindNoCase("dev.firsttitleservices", cgi.SERVER_NAME)>
	<cfset request.dsn = "first_title_services_dev">
	<cfset request.httpUrl = "http://dev.firsttitleservices.com">
	<cfset request.httpsUrl  = "https://dev.firsttitleservices.com">
	<cfset request.envName = "dev">
	<cfset request.rootDir = "c:\inetpub\wwwroot\clients\firsttitleservices.com\www_dev">
	<cfset request.uploadsDir = "c:\uploads\">
</cfif>
<!---end environment specific variables --->


<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset turnTimes = CreateObject('component','cfc.TurnTimes')>
<cfset routingSys = CreateObject('component','cfc.RoutingFunctions')>


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

<cfset testing_projects_email = 0>

<cfparam name="session.mo_employee" default = "0">
<cfparam name="session.mo_admin" default = "0">
<cfparam name="session.mi_employee" default = "0">
<cfparam name="session.mi_admin" default = "0">
<cfparam name="session.tx_employee" default = "0">
<cfparam name="session.va_employee" default = "0">
<cfparam name="session.mi_flushing_admin" default = "0">
<cfparam name="session.mi_flushing_employee" default = "0">
<cfparam name="session.tx_admin" default = "0">
<cfparam name="session.va_admin" default = "0">
<cfparam name="session.ft_fairfax_admin" default = "0">
<cfparam name="session.ft_fairfax_employee" default = "0">
<cfparam name="url.bypass" default = "0">

<cfif NOT IsDefined("session.Is_Logged_in") and CGI.SCRIPT_NAME NEQ '/admin_area/login.cfm' and url.bypass eq 0>
<script language="javascript">
alert("Please log in before accessing this page");
</script>
<cflocation url="https://#CGI.SERVER_NAME#/client/alogin.cfm">
</cfif>

<!--- <cfif url.bypass eq 1>
<cfset session.ft_user_id = 248>
</cfif>
 --->
<CFSET  a_list_of_all_states = "AL|AK|AZ|AR|CA|CO|CT|DE|DC|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY">

<CFSET a_list_of_all_states_1 = #ListToArray(a_list_of_all_states, "|")#>



<CFSET  a_letters = "a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z">


<CFSET a_list_of_all_Letters = #ListToArray(a_letters, "|")#>


<!---
<cferror
type="exception"
template="../cferror.cfm"
/>
--->
<cfset Request.dbprefix="LH">
<cfset Request.dbtype="mssql">
<cfset Request.dbUsername = "ebrancaccio">
<cfset Request.dbpassword = "class00">
<cfset Request.AppVirtualPath = "">
<!--- Path from webserver root to directory where files will be uploaded.  Do NOT include leading "/" --->
<cfset Request.MCFUploadsDir = "uploads">
<!--- Stylesheet to use for Lighthouse admin screens. Available stylesheets are in Lighthouse/Resources/css --->
<cfset Request.MCFStyle = "MSStandard">
<!---
<cfset Application.Lighthouse = createObject('component','LightHouse.components.Lighthouse')>
<cfset Application.Lighthouse = createObject('component','LightHouse.components.json')>
<cfset Application.Lighthouse = createObject('component','LightHouse.components.PageAudit')>
<cfset Application.Lighthouse = createObject('component','LightHouse.components.UserGroup')>
<cfset Application.Lighthouse = createObject('component','LightHouse.components.Status')>
<cfset Application.Lighthouse = createObject('component','LightHouse.components.Topic')>
<cfset Application.Lighthouse = createObject('component','LightHouse.components.Section')>
--->
<cfinclude template="../Lighthouse/Functions/Init.cfm">
<cfinclude template="../Lighthouse/Functions/LighthouseLib.cfm">

<cfif Not ApplicationIsInitialized()>
<cfset Application.GoogleAnalyticsAcctNum = "">
	<cfset InitializeApplication()>
</cfif>
<!--- <cfparam name="session.ft_user_id" default="264"> --->
   <!--- <cferror type="exception"
    template="error_handler.cfm"
    mailto="techsupport@firsttitleservices.com">  --->
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


<cfif IsDefined("url.comp_id") AND not FindNoCase("order_verify_title",path_info)>
<cfif (IsDefined("session.comp_id") and session.comp_id eq url.comp_id) or IsDefined("session.ft_user_id") or IsDefined("session.is_logged_in")>
<cfelse>
<cfabort>
</cfif>
</cfif>