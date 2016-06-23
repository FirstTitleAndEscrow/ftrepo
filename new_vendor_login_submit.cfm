

<CFQUERY datasource="#request.dsn#" NAME="read_vendor">
SELECT *
FROM Vendors_STACIE
WHERE username = '#user#' AND password = '#pass#'
</CFQUERY>


<CFIF (#read_vendor.recordcount# EQ "0")>
<CFLOCATION URL="https://#cgi.server_name#/client/vlogin.cfm?a_trigger=1">
<cfelse>
<cfset session.Is_Logged_in = 1>
<cfset session.logged_in_vendor_id = read_vendor.vendor_id>
<CFLOCATION URL="https://#cgi.server_name#/vendor_landing.cfm?vendor_id=#read_vendor.vendor_id#">
</cfif>


