<CFQUERY datasource="#request.dsn#" NAME="read_pricing">
			update vendor_tracker_new
			set sandb_disable = 1
			where id = #id#
		</CFQUERY>
		
<cflocation url="client_invoices2.cfm?startDate=#urlencodedformat(startdate)#&enddate=#urlencodedformat(enddate)#" addtoken="no">