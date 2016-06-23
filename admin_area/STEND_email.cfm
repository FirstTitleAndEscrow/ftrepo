<cfif #email# neq "">

<!--- get order info --->
<CFQUERY datasource="#request.dsn#" NAME="read_order">
			SELECT *
			FROM title
			where title_id = #rec_id#
</CFQUERY>
<!--- get company info --->
<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where id = #read_order.comp_id#
</CFQUERY>
<!--- get info on who is logged in --->
<CFQUERY datasource="#request.dsn#" NAME="read_user">
			SELECT *
			FROM First_admin
			where ID = '#session.ft_user_id#'
</CFQUERY>
<cfif read_company.streamline_client eq 'True'>
<!--- see if we can find a streamline address for this user --->
<CFQUERY datasource="#request.dsn#" NAME="read_streamline_user">
			SELECT *
			FROM users
			where lp_fname = '#read_user.fname#' and lp_lname = '#read_user.lname#' and streamline_emp = 'True'
</CFQUERY>
<cfif read_streamline_user.recordcount gt 0>
<cfset from_address = read_streamline_user.lp_email>
<cfelse>
<cfset from_address = read_user.email>
</cfif>
<cfelse>
<cfset from_address = read_user.email>
</cfif>


	<CFMAIL
TO="#email#"
FROM="#from_address#"
SERVER="127.0.0.1"
Subject="First Title - Stewart Endorsement for order #rec_id#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/stend_client_view.cfm?rec_id=#rec_id#" target="new">Stewart Endorsement</a> for order #rec_id#</B></font><br><br>

First Title staff
</cfmail></cfif>
<!--- <cfif #fax# neq "">
	<CFMAIL
TO="#fax#@efaxsend.com,rfay@firsttitleservices.com"
FROM="closingfax@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title - Stewart Endorsement for order #rec_id#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/stend_client_view.cfm?rec_id=#rec_id#" target="new">Stewart Endorsement</a> for order #rec_id#</B></font><br><br>

First Title staff
</cfmail>

</cfif> --->

<CFLOCATION URL="https://#cgi.server_name#/admin_area/stend_view.cfm?rec_id=#rec_id#&a_trigger=2">
