<CFQUERY datasource="#request.dsn#">

			update
			title_ins_view
			set selectedOrgs3 = null where title_id = #rec_id# and selectedOrgs3 = #selectedOrgs3#
		</CFQUERY>



	<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=0">






