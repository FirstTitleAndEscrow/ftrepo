				<CFQUERY datasource="#request.dsn#" NAME="test">
		
			SELECT *
			FROM users2
		 </CFQUERY>
	
	<cfoutput query="test">
	

		<CFQUERY datasource="#request.dsn#">
	insert into users (comp_id, lp_fname, lp_lname, pname, lp_phone, lp_fax, lp_ext, lp_email, a_status)
			VALUES (191, '#p_fname#', '#p_lname#', '#pname#', '#p_phone#', '#p_fax#', '#p_ext#', '#p_email#', 1)
	 </CFQUERY>	

			
	
	</cfoutput>
	
	
					<CFQUERY datasource="#request.dsn#" NAME="test2">
		
			SELECT *
			FROM loan_officers2
		 </CFQUERY>
		 
		 
		 
	<cfoutput query="test2">
	
	
	<CFQUERY datasource="#request.dsn#">
	insert into LOAN_OFFICERS (comp_id, lo_fname, lo_lname, oname, lo_phone, lo_fax, lo_ext, lo_email, a_status)
			VALUES (191, '#lo_fname#', '#lo_lname#', '#oname#', '#lo_phone#', '#lo_fax#', '#lo_ext#', '#lo_email#', 1)
	 </CFQUERY>	
	
	
	</cfoutput>
	