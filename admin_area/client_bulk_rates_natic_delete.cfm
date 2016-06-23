<cfparam name="url.comp_id" default="0">
<cfparam name="url.id" default="0">

<CFQUERY datasource="#request.dsn#" NAME="delete_entry">
			DELETE
			FROM Client_bulk_rates_Natic
			where id = #url.id#
            and comp_id = '#url.comp_id#'
</CFQUERY>

<cflocation url="client_bulk_rates_Natic.cfm?AL=1&MODIFY_CLIENT_ID=#url.comp_id#&UID=#session.ft_user_id#"  addtoken="no">
