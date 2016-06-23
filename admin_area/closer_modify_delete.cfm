
<CFQUERY datasource="#request.dsn#" NAME="insert_price">
			Update Closer
			set status = 1
			WHERE Closer_ID = #url.closer_id#
</CFQUERY>



<CFLOCATION URL="https://#cgi.server_name#/admin_area/closer_modify_view.cfm?uid=#URL.uid#&al=#URL.al#&Closer_ID=#Closer_ID#&a_state=#a_state#&vendor=#vendor#">
