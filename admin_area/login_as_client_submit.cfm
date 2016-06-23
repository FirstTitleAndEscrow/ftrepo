<cfparam name="form.comp_id" default=0>



<CFQUERY datasource="#request.dsn#" NAME="get_comp">
		select * from companies
		where ID = '#form.comp_id#'
</CFQUERY>


	<cfset session.Is_Logged_in = 1>
	<cfset session.comp_id = get_comp.id>
	<cfset form.comp_id = get_comp.id>
	<cfset session.master_co_id = get_comp.master_co_id>

<CFLOCATION URL="/client_acct_mgt.cfm?comp_id=#get_comp.ID#&user_id_1=0&lo_id=0&admin_login=1">

<!--- <cfhttp url="https://#cgi.server_name#/client_login_submit.cfm" method="post" resolveurl="no">
  <cfhttpparam name="user_name" type="FormField" value="#get_comp.a_user#" >
  <cfhttpparam name="password" type="FormField" value="#get_comp.a_pass#" >
</cfhttp> --->

<!--- <cfoutput>
#cfhttp.FileContent#<br>
<cfabort>
</cfoutput> --->