	<cfset a_st_list_2 = "AZ">
		
		<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID">
		
 SELECT     *
FROM         Company_Billing_Values
WHERE     (Billing_ID > 2690)
		
		</CFQUERY>
		
		<cfoutput query="Read_billing_ID">	
		
		<CFSET a_state_list = #ListToArray(a_st_list_2, ",")#>
	
	<CFLOOP FROM="1" TO="#ArrayLen(a_state_list)#" INDEX="DDD">

		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#billing_id#, #company_id#, '#a_state_list[DDD]#')		
		</CFQUERY>	

	
	</CFLOOP>
		


		<CFQUERY datasource="#request.dsn#" NAME="read_agency_1">		
			SELECT *
			FROM title_FT_Agencies
			WHERE Title_FT_Agency_id = 7
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#billing_id#, #read_agency_1.title_FT_Agency_ID#, '#read_agency_1.company#',  '#read_agency_1.state#', #company_id#)		
		</CFQUERY>	
	
</cfoutput>