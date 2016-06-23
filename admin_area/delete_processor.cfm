
	
	




		<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			delete
			FROM users
			WHERE comp_id = #comp_id# AND ID = #user_id#
		
		</CFQUERY>


		
		<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		
			SELECT *
			FROM companies
			WHERE ID = #comp_ID#
		
		</CFQUERY>



<cflocation url="user_modify_pick_user.cfm?uid=#URL.uid#&al=#URL.al#&comp_id=#read_companies.ID#">

	