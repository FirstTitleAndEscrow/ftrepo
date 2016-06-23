
<CFPARAM NAME="a_flag" DEFAULT="">

<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">
SELECT *
FROM abstractors
WHERE username = '#user#' AND password = '#pass#'
</CFQUERY>
<!--- <cfelse> --->
<CFQUERY datasource="#request.dsn#" NAME="read_closer">
SELECT *
FROM closer
WHERE username = '#user#' AND password = '#pass#'
</cfquery>

<!--- <cfelse> --->
<CFQUERY datasource="#request.dsn#" NAME="read_vendor">
SELECT *
FROM Vendors_STACIE
WHERE username = '#user#' AND password = '#pass#'
</CFQUERY>


<CFIF (#read_abstractor.recordcount# GT "0")>
	<cfset session.Is_Logged_in = 1>
	<cfset session.logged_in_vendor_id = read_abstractor.abstractor_id>
	<CFIF (#read_abstractor.recordcount# EQ "0")>
		<CFLOCATION URL="https://#cgi.server_name#/client/vlogin.cfm?a_trigger=1">
	<cfelse>
		<cfset session.Is_Logged_in = 1>
		<cfset session.logged_in_vendor_id = read_abstractor.abstractor_id>
		<cfif read_abstractor.type eq 6>
			<CFLOCATION URL="https://#cgi.server_name#/vendor_rep_view.cfm?a_trigger=3&username=#read_abstractor.username#&password=#read_abstractor.password#&vendor_type=#read_abstractor.type#">
		<cfelseif read_abstractor.type eq 7>
			<CFLOCATION URL="https://#cgi.server_name#/deed_prep_vendor_view.cfm?a_trigger=3&abstractor_id=#read_abstractor.abstractor_id#">
		<cfelseif read_abstractor.type eq 8>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/met/SEO_Publisher">
		<cfelseif read_abstractor.type eq 5>
			<CFLOCATION URL="https://#cgi.server_name#/icl_landing.cfm?a_trigger=1&username=#read_abstractor.username#&password=#read_abstractor.password#&vendor_type=#read_abstractor.type#">
		<cfelse>
			<CFLOCATION URL="https://#cgi.server_name#/vendor_rep_view.cfm?a_trigger=1&username=#read_abstractor.username#&password=#read_abstractor.password#&vendor_type=#read_abstractor.type#">
		</cfif>
	</CFIF>
<CFELSEif #read_CLOSER.recordcount# GT "0">
	<cfset session.Is_Logged_in = 1>
	<cfset session.logged_in_vendor_id = read_closer.closer_id>
	<CFIF (#read_CLOSER.recordcount# EQ "0")>
		<CFLOCATION URL="https://#cgi.server_name#/client/vlogin.cfm?a_trigger=1">
	<CFELSE>
		<cfset session.Is_Logged_in = 1>
		<cfset session.logged_in_vendor_id = read_closer.closer_id>
		<CFLOCATION URL="https://#cgi.server_name#/vendor_rep_view.cfm?a_trigger=2&user=#read_closer.username#&pass=#read_closer.password#&vendor_type=0">
	</CFIF>


<CFELSEif #read_vendor.recordcount# GT "0">
	<cfset session.Is_Logged_in = 1>
	<cfset session.logged_in_vendor_id = read_vendor.vendor_id>
	<CFIF (#read_vendor.recordcount# EQ "0")>
		<CFLOCATION URL="https://#cgi.server_name#/client/vlogin.cfm?a_trigger=1">
	<CFELSE>
		<cfset session.Is_Logged_in = 1>
		<cfset session.logged_in_vendor_id = read_vendor.vendor_id>
		<CFLOCATION URL="https://#cgi.server_name#/vendor_landing.cfm?vendor_id=#read_vendor.vendor_id#">
	</CFIF>


<CFELSE>
	<CFLOCATION URL="https://#cgi.server_name#/client/vlogin.cfm?a_trigger=1">
</CFIF>

