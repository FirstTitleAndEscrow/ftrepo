
<CFQUERY datasource="#request.dsn#" NAME="insert_invoice">
			Update Doc_Abstract_title
			set invoice_amt_paid = #invoice_amt_paid#
			WHERE title_ID = #rec_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_line_items">
			select vt.*, v.company
			from vendor_tracker_new vt
			inner join vendors_stacie v
			on v.vendor_id = vt.vendor_id
			
			WHERE vt.order_ID = #rec_id#
			and vt.product_ordered IS NOT NULL
</CFQUERY>

<cfoutput query="get_line_items">
	<cfset item = Evaluate("form.amt_paid_"&id)>
	<cfif isNumeric(item)>
		<CFQUERY datasource="#request.dsn#" NAME="insert_invoice">
			Update vendor_tracker_new
			set amt_paid = #item#
			WHERE ID = #id#
		</CFQUERY>
	</cfif>
</cfoutput>



<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=0&company_id=#url.company_id#">
