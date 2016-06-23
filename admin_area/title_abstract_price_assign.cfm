
<CFQUERY datasource="#request.dsn#" NAME="insert_price">
			Update Doc_Abstract_Title
			set abstract_cost = #abstract_cost#
			WHERE title_ID = #rec_id#
</CFQUERY>



<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=0&company_id=#url.company_id#">
