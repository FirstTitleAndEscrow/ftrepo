
<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>

		<CFQUERY datasource="#request.dsn#" NAME="read_company">
		
			SELECT *
			FROM companies
			
		
		</CFQUERY>

		
		
	<cfoutput query="read_company">
	
		<CFQUERY datasource="#request.dsn#">
			INSERT INTO Company_Billing_Values(company_id, a_1101, a_1102, a_1111, a_1111_text, a_1205, a_1205_text, a_1101b, a_1102b,  a_1111b, a_1111_textb, a_1205b, a_1205_textb, a_1101c, a_1102c, a_1111c, a_1111_textc, a_1205c, a_1205_textc, b_date, b_time)
			VALUES(#id#, '525', '125', '65', 'Delivery', '85', 'Procurement Releases', '525', '125', '65', 'Delivery', '85', 'Procurement Releases', '525', '125', '65', 'Delivery', '85', 'Procurement Releases', '#b_date#', '#b_time#')		
		</CFQUERY>	
	

		
		<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID">
		
			SELECT *
			FROM Company_Billing_Values
			WHERE b_time = '#b_time#' AND b_date = '#b_date#'
		
		</CFQUERY>
		
		
			<CFSET a_state_list = #ListToArray('CA','NV')#>
	
	<CFLOOP FROM="1" TO="#ArrayLen(a_state_list)#" INDEX="DDD">

		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID.billing_id#, #Read_billing_ID.company_id#, '#a_state_list[DDD]#')		
		</CFQUERY>	

	
	</CFLOOP>
		


		<CFQUERY datasource="#request.dsn#" NAME="read_agency_1">		
			SELECT *
			FROM title_FT_Agencies
			WHERE Title_FT_Agency_id = 21
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID.billing_id#, #read_agency_1.title_FT_Agency_ID#, '#read_agency_1.company#',  '#read_agency_1.state#', #read_company.id#)		
		</CFQUERY>	
	
</cfoutput>