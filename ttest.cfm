<CFQUERY datasource="#request.dsn#" NAME="read_users">
		
			SELECT *
			FROM users
			WHERE comp_id = 336
			ORDER BY  lp_fname ASC
		
		</CFQUERY>
<cfoutput query="read_users">
<CFQUERY datasource="#request.dsn#">
		INSERT INTO loan_officers(comp_ID, oname, lo_fname, lo_lname, lo_phone, lo_fax, lo_ext)
				VALUES(#Read_users.comp_ID#, '#Read_users.pname#', '#Read_users.lp_fname#', '#Read_users.lp_lname#', '#Read_users.lp_phone#', '#Read_users.lp_fax#', '#Read_users.lp_ext#')
			
			</CFQUERY>
</cfoutput>