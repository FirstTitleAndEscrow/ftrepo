<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM abstractors
</cfquery>

	<CFLOOP query="read_report">
	<CFQUERY datasource="#request.dsn#">
		
			Update doc_abstract_title 
			SET company = '#company#'
			WHERE abstractor_id = #abstractor_id#
</cfquery>
</cfloop>