<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>

<cfset from_company_id = 1924>
<cfset to_company_id = 1933>

<CFQUERY datasource="#request.dsn#"  NAME="delete_rates">
			Delete
			from Company_Billing_Values where company_id = #to_company_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#"  NAME="delete_states">
			Delete
			from Company_Billing_States where company_id = #to_company_id#
</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_company">	
			SELECT *
			FROM companies
			WHERE ID = #to_company_id#
</CFQUERY>

	
<CFQUERY datasource="#request.dsn#"  NAME="Read_default_rates">
			select *
			from Company_Billing_Values where company_id = #from_company_id#
</CFQUERY>

<cfoutput query="Read_default_rates">
<cfset old_billing_id = Read_default_rates.billing_id>
<CFQUERY datasource="#request.dsn#">
			INSERT INTO Company_Billing_Values(company_id, a_1101, a_1102, a_1103, a_1104, a_1105, a_1106, a_1107, a_1111, a_1111_text, a_1112, a_1112_text, a_1113, a_1113_text, a_1205, a_1205_text, a_1303, a_1303_text, a_1304, a_1304_text, a_1305, a_1305_text, a_1101b, a_1102b, a_1103b, a_1104b, a_1105b, a_1106b, a_1107b, a_1111b, a_1111_textb, a_1112b, a_1112_textb, a_1113b, a_1113_textb, a_1205b, a_1205_textb, a_1303b, a_1303_textb, a_1304b, a_1304_textb, a_1305b, a_1305_textb, a_1101c, a_1102c, a_1103c, a_1104c, a_1105c, a_1106c, a_1107c, a_1111c, a_1111_textc, a_1112c, a_1112_textc, a_1113c, a_1113_textc, a_1205c, a_1205_textc, a_1303c, a_1303_textc, a_1304c, a_1304_textc, a_1305c, a_1305_textc, a_1101d, a_1102d, a_1103d, a_1104d, a_1105d, a_1106d, a_1107d, a_1111d, a_1111_textd, a_1112d, a_1112_textd, a_1113d, a_1113_textd, a_1205d, a_1205_textd, a_1303d, a_1303_textd, a_1304d, a_1304_textd, a_1305d, a_1305_textd, b_date, b_time, trig)
			VALUES(#read_company.id#, '#a_1101#', '#a_1102#', '#a_1103#', '#a_1104#', '#a_1105#', '#a_1106#', '#a_1107#', '#a_1111#', '#a_1111_text#', '#a_1112#', '#a_1112_text#', '#a_1113#', '#a_1113_text#', '#a_1205#', '#a_1205_text#', '#a_1303#', '#a_1303_text#', '#a_1304#', '#a_1304_text#', '#a_1305#', '#a_1305_text#', '#a_1101b#', '#a_1102b#', '#a_1103b#', '#a_1104b#', '#a_1105b#', '#a_1106b#', '#a_1107b#', '#a_1111b#', '#a_1111_textb#', '#a_1112b#', '#a_1112_textb#', '#a_1113b#', '#a_1113_textb#', '#a_1205b#', '#a_1205_textb#', '#a_1303b#', '#a_1303_textb#', '#a_1304b#', '#a_1304_textb#', '#a_1305b#', '#a_1305_textb#', '#a_1101c#', '#a_1102c#', '#a_1103c#', '#a_1104c#', '#a_1105c#', '#a_1106c#', '#a_1107c#', '#a_1111c#', '#a_1111_textc#', '#a_1112c#', '#a_1112_textc#', '#a_1113c#', '#a_1113_textc#', '#a_1205c#', '#a_1205_textc#', '#a_1303c#', '#a_1303_textc#', '#a_1304c#', '#a_1304_textc#', '#a_1305c#', '#a_1305_textc#', '#a_1101d#', '#a_1102d#', '#a_1103d#', '#a_1104d#', '#a_1105d#', '#a_1106d#', '#a_1107d#', '#a_1111d#', '#a_1111_textd#', '#a_1112d#', '#a_1112_textd#', '#a_1113d#', '#a_1113_textd#', '#a_1205d#', '#a_1205_textd#', '#a_1303d#', '#a_1303_textd#', '#a_1304d#', '#a_1304_textd#', '#a_1305d#', '#a_1305_textd#', '#b_date#', '#b_time#', 1)		
</CFQUERY>	
<CFQUERY datasource="#request.dsn#"  NAME="read_current_billing_id">
			select billing_id
			from Company_Billing_Values where trig = 1
</CFQUERY>
<cfset current_billing_id = read_current_billing_id.billing_id>


<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states">		
    select * from company_billing_states
	where billing_id = #old_billing_id#
</CFQUERY>
 	  <cfloop query="Read_billing_states">
	  <CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#current_billing_id#, #read_company.id#, '#a_states#')		
		</CFQUERY>
	  </cfloop>
<CFQUERY datasource="#request.dsn#"  NAME="Read_agency_assoc">		
			select * from company_agency_assoc
			where company_id = #from_company_id# and billing_id = #old_billing_id#
</CFQUERY>	
<CFloop query="Read_agency_assoc">
<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#current_billing_id#, #Read_agency_assoc.title_FT_Agency_ID#, '#Read_agency_assoc.title_FT_Agency_Name#',  '#Read_agency_assoc.title_FT_Agency_State#', #read_company.id#)		
		</CFQUERY>	
</cfloop>
<CFQUERY datasource="#request.dsn#"  NAME="read_current_billing_id">
			update Company_Billing_Values
			set trig = NULL
</CFQUERY>
</cfoutput>
