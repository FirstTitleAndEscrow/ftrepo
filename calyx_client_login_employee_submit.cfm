<CFPARAM NAME="emp" DEFAULT="0">
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="lp_id" DEFAULT="">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM Companies_user
	WHERE username = '#user_name#' AND password = '#password#'
    and ID = #user_id# and status = 1
</CFQUERY>

<CFSET emp = #read_company.ID#>

<cfoutput>
	<cfset comp_id = #read_company.comp_id#>
</cfoutput>

<CFIF #read_company.recordcount# EQ 0>
    <CFLOCATION URL="https://#cgi.server_name#/calyx_client_login.cfm?emp=#emp#&a_trigger=1&comp_id=#Form.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

<CFELSE>
    <cfoutput>
	<CFLOCATION URL="https://#cgi.server_name#/calyx_acct_mgt.cfm?emp=#emp#&comp_id=#read_company.comp_ID#&user_id_1=0&lo_id=0">
    </CFOUTPUT>
</cfif>
