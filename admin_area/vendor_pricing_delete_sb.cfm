<cfparam name="url.vendor_id" default="0">
<cfparam name="url.billing_id" default="0">

<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_entry">
			DELETE
			FROM Vendor_pricing_sb
			where billing_id = #url.billing_id#
            and vendor_id = '#url.vendor_id#'
</CFQUERY>

<cflocation url="vendor_modify2_sb.cfm?vendor_id=#url.vendor_id###abstractor_pricing"  addtoken="no">