<CFQUERY datasource="#request.dsn#">

			update
			prop_ins_view
			set selectedOrgs4 = null where prop_id = #rec_id# and selectedOrgs4 = #selectedOrgs4#
		</CFQUERY>



	<CFLOCATION URL="https://#cgi.server_name#/admin_area/admin_property_report.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=0">






