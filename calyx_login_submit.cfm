
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="lp_id" DEFAULT="">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE a_user = '#user_name#' AND a_pass = '#password#' and a_status = 1
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_company_user">
    Select *
    from Companies_User where comp_id = #read_company.id#
</CFQUERY>

<cfoutput>
	<cfset comp_id = #read_company.id#>
</cfoutput>

<CFIF #read_company.recordcount# EQ 0>
	<CFLOCATION URL="https://#cgi.server_name#/calyx_login.cfm?a_trigger=1">
<CFELSE>
	<CFIF read_company.companies_switch eq "1">
        <CFLOCATION URL="https://#cgi.server_name#/calyx_client_login.cfm?comp_id=#read_company.ID#&user_id_1=0&lo_id=0">
    <CFELSE>
        <CFLOCATION URL="https://#cgi.server_name#/calyx_acct_mgt.cfm?comp_id=#read_company.ID#&user_id_1=0&lo_id=0">
    </CFIF>
</cfif>
