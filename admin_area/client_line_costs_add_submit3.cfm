<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>
<CFQUERY datasource="#request.dsn#" NAME="read_company">	
			SELECT *
			FROM companies
			WHERE ID = #Read_ID.id#
</CFQUERY>

<cfset default_rates_co_id = 426>
<cfif read_company.streamline_client eq 'True' or read_company.streamline_client eq 1>
<cfset default_rates_co_id = 2368>
</cfif>
<cfif read_company.master_co_id neq 'NULL' and read_company.master_co_id neq '' and read_company.master_co_id neq 0>
<cfset default_rates_co_id = read_company.master_co_id>
</cfif>


<CFQUERY datasource="#request.dsn#"  NAME="Read_default_rates">
			select *
			from Company_Billing_Values where company_id = #default_rates_co_id#
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
			where company_id = #default_rates_co_id# and billing_id = #old_billing_id#
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
















<!--- 
<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>
		<CFQUERY datasource="#request.dsn#" NAME="read_company">
		
			SELECT *
			FROM companies
			WHERE ID = #Read_ID.id#
</CFQUERY>
		
		
			<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_company">
			select *
			from Company_Billing_Values where company_id = 426
		</CFQUERY>	
		
		<CFLOOP query = "Read_billing_company">
		<CFQUERY datasource="#request.dsn#">
			INSERT INTO Company_Billing_Values(company_id, a_1101, a_1102, a_1103, a_1104, a_1105, a_1106, a_1107, a_1111, a_1111_text, a_1112, a_1112_text, a_1113, a_1113_text, a_1205, a_1205_text, a_1303, a_1303_text, a_1304, a_1304_text, a_1305, a_1305_text, a_1101b, a_1102b, a_1103b, a_1104b, a_1105b, a_1106b, a_1107b, a_1111b, a_1111_textb, a_1112b, a_1112_textb, a_1113b, a_1113_textb, a_1205b, a_1205_textb, a_1303b, a_1303_textb, a_1304b, a_1304_textb, a_1305b, a_1305_textb, a_1101c, a_1102c, a_1103c, a_1104c, a_1105c, a_1106c, a_1107c, a_1111c, a_1111_textc, a_1112c, a_1112_textc, a_1113c, a_1113_textc, a_1205c, a_1205_textc, a_1303c, a_1303_textc, a_1304c, a_1304_textc, a_1305c, a_1305_textc, a_1101d, a_1102d, a_1103d, a_1104d, a_1105d, a_1106d, a_1107d, a_1111d, a_1111_textd, a_1112d, a_1112_textd, a_1113d, a_1113_textd, a_1205d, a_1205_textd, a_1303d, a_1303_textd, a_1304d, a_1304_textd, a_1305d, a_1305_textd, b_date, b_time)
			VALUES(#read_company.id#, '#a_1101#', '#a_1102#', '#a_1103#', '#a_1104#', '#a_1105#', '#a_1106#', '#a_1107#', '#a_1111#', '#a_1111_text#', '#a_1112#', '#a_1112_text#', '#a_1113#', '#a_1113_text#', '#a_1205#', '#a_1205_text#', '#a_1303#', '#a_1303_text#', '#a_1304#', '#a_1304_text#', '#a_1305#', '#a_1305_text#', '#a_1101b#', '#a_1102b#', '#a_1103b#', '#a_1104b#', '#a_1105b#', '#a_1106b#', '#a_1107b#', '#a_1111b#', '#a_1111_textb#', '#a_1112b#', '#a_1112_textb#', '#a_1113b#', '#a_1113_textb#', '#a_1205b#', '#a_1205_textb#', '#a_1303b#', '#a_1303_textb#', '#a_1304b#', '#a_1304_textb#', '#a_1305b#', '#a_1305_textb#', '#a_1101c#', '#a_1102c#', '#a_1103c#', '#a_1104c#', '#a_1105c#', '#a_1106c#', '#a_1107c#', '#a_1111c#', '#a_1111_textc#', '#a_1112c#', '#a_1112_textc#', '#a_1113c#', '#a_1113_textc#', '#a_1205c#', '#a_1205_textc#', '#a_1303c#', '#a_1303_textc#', '#a_1304c#', '#a_1304_textc#', '#a_1305c#', '#a_1305_textc#', '#a_1101d#', '#a_1102d#', '#a_1103d#', '#a_1104d#', '#a_1105d#', '#a_1106d#', '#a_1107d#', '#a_1111d#', '#a_1111_textd#', '#a_1112d#', '#a_1112_textd#', '#a_1113d#', '#a_1113_textd#', '#a_1205d#', '#a_1205_textd#', '#a_1303d#', '#a_1303_textd#', '#a_1304d#', '#a_1304_textd#', '#a_1305d#', '#a_1305_textd#', '#b_date#', '#b_time#')		
		</CFQUERY>	
			</CFLOOP>
		
		<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID">		
			SELECT *
			FROM Company_Billing_Values
			WHERE b_time = '#b_time#' AND b_date = '#b_date#'
		</CFQUERY>
		
		
		
			
<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID11">		
  			SELECT *
  			FROM Company_Billing_Values
  			WHERE company_id = #read_company.id# order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID11.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states11">		
				
			select * from company_billing_states
			where company_id = 426 and a_states in ('IN')
			</CFQUERY>	

	<CFLOOP query = "Read_billing_states11">
	
	<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID11.billing_id#, #Read_billing_ID11.company_id#, '#a_states#')		
		</CFQUERY>	
	
	</CFLOOP>
	
	
	
	

	
	
	
	
<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID1">		
  			SELECT *
  			FROM Company_Billing_Values
  			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID1.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states1">		
				
			select * from company_billing_states
			where company_id = 426 and a_states in ('AZ')
			</CFQUERY>	

	<CFLOOP query = "Read_billing_states1">
	
	<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID1.billing_id#, #Read_billing_ID1.company_id#, '#a_states#')		
		</CFQUERY>	
	
	</CFLOOP>
		
		
		
		
				<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID2">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID2.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states2">		
			select * from company_billing_states
			where company_id = 426 and a_states in ('CA')
</CFQUERY>	

	<CFLOOP query = "Read_billing_states2">
	
	<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID2.billing_id#, #Read_billing_ID2.company_id#, '#a_states#')		
		</CFQUERY>	
	
	</CFLOOP>
		
		
		
		
		
		
		
		
			<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID3">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID3.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states3">		
			select * from company_billing_states
			where company_id = 426 and a_states in ('DE','GA','MA','NC','SC','WV')
</CFQUERY>	

	<CFLOOP query = "Read_billing_states3">
	
	<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID3.billing_id#, #Read_billing_ID3.company_id#, '#a_states#')		
		</CFQUERY>	
	
	</CFLOOP>
		
		
		
		
		
		
					<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID4">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID4.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states4">		
			select * from company_billing_states
			where company_id = 426 and a_states in ('NJ')
</CFQUERY>	

	<CFLOOP query = "Read_billing_states4">
	
	<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID4.billing_id#, #Read_billing_ID4.company_id#, '#a_states#')		
		</CFQUERY>	
	
	</CFLOOP>
		
		
		
		
		
			<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID5">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID5.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states5">		
			select * from company_billing_states
			where company_id = 426 and a_states in ('PA')
</CFQUERY>	

	<CFLOOP query = "Read_billing_states5">
	
	<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID5.billing_id#, #Read_billing_ID5.company_id#, '#a_states#')		
		</CFQUERY>	
	
	</CFLOOP>
		


	
				<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID6">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID6.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states6">		
			select * from company_billing_states
			where company_id = 426 and a_states in ('NV')
</CFQUERY>	

	<CFLOOP query = "Read_billing_states6">
	
	<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID6.billing_id#, #Read_billing_ID6.company_id#, '#a_states#')		
		</CFQUERY>	
	
	</CFLOOP>
	
	

	
	
		<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID10">		
  			SELECT *
  			FROM Company_Billing_Values
  			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID10.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states10">		
				
			select * from company_billing_states
			where company_id = 426 and a_states in ('NE')
			</CFQUERY>	

	<CFLOOP query = "Read_billing_states10">
	
	<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID10.billing_id#, #Read_billing_ID10.company_id#, '#a_states#')		
		</CFQUERY>	
	
	</CFLOOP>
	
	
	
	
					<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID7">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID7.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states7">		
			
			select * from company_billing_states
			where company_id = 426 and a_states in ('AL','AR','CO','CT','DC','FL','HI','IA','IL','KS','KY','LA','MD','ME','MI','MN','MO','MS','MT','ND','NH','NY','OH','RI','TN','VA','VT','WI')

</CFQUERY>	

	<CFLOOP query = "Read_billing_states7">
	
	<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID7.billing_id#, #Read_billing_ID7.company_id#, '#a_states#')		
		</CFQUERY>	
	
	</CFLOOP>

	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = null
	</CFQUERY>	
	
		
		
		
		
				<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID111">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID111.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states111">		
			select * from company_agency_assoc
			where company_id = 426 and billing_id = 41386 

</CFQUERY>	

	<CFoutput >
	
		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID111.billing_id#, #Read_billing_states111.title_FT_Agency_ID#, '#Read_billing_states111.title_FT_Agency_Name#',  '#Read_billing_states111.title_FT_Agency_State#', #read_company.id#)		
		</CFQUERY>	
	
	</CFoutput>
		
		
		
		
		
		
		
		<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID1">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID1.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states1">		
			select * from company_agency_assoc
			where company_id = 426 and billing_id = 3269

</CFQUERY>	

	<CFoutput >
	
		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID1.billing_id#, #Read_billing_states1.title_FT_Agency_ID#, '#Read_billing_states1.title_FT_Agency_Name#',  '#Read_billing_states1.title_FT_Agency_State#', #read_company.id#)		
		</CFQUERY>	
	
	</CFoutput>
		
		
		
		
						<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID2">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID2.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states2">		
			select * from company_agency_assoc
			where company_id = 426 and billing_id = 1976

</CFQUERY>	

	<CFoutput >
	
		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID2.billing_id#, #Read_billing_states2.title_FT_Agency_ID#, '#Read_billing_states2.title_FT_Agency_Name#',  '#Read_billing_states2.title_FT_Agency_State#', #read_company.id#)		
		</CFQUERY>	
	
	</CFoutput>
		
				
		
		
				<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID3">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID3.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states3">		
			select * from company_agency_assoc
			where company_id = 426 and billing_id = 1157

</CFQUERY>	

	<CFoutput >
	
		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID3.billing_id#, #Read_billing_states3.title_FT_Agency_ID#, '#Read_billing_states3.title_FT_Agency_Name#',  '#Read_billing_states3.title_FT_Agency_State#', #read_company.id#)		
		</CFQUERY>	
	
	</CFoutput>
		
		
		
		
		
		
				<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID4">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID4.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states4">		
			select * from company_agency_assoc
			where company_id = 426 and billing_id = 997

</CFQUERY>	

	<CFoutput >
	
		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID4.billing_id#, #Read_billing_states4.title_FT_Agency_ID#, '#Read_billing_states4.title_FT_Agency_Name#',  '#Read_billing_states4.title_FT_Agency_State#', #read_company.id#)		
		</CFQUERY>	
	
	</CFoutput>
		
		
		
		
		
			<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID5">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID5.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states5">		
			select * from company_agency_assoc
			where company_id = 426 and billing_id = 998

</CFQUERY>	

	<CFoutput>
	
		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID5.billing_id#, #Read_billing_states5.title_FT_Agency_ID#, '#Read_billing_states5.title_FT_Agency_Name#',  '#Read_billing_states5.title_FT_Agency_State#', #read_company.id#)		
		</CFQUERY>	
	
	</CFoutput>
		


	
				<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID6">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID6.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states6">		
			select * from company_agency_assoc
			where company_id = 426 and billing_id = 2672

</CFQUERY>	

	<CFoutput >
	
		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID6.billing_id#, #Read_billing_states6.title_FT_Agency_ID#, '#Read_billing_states6.title_FT_Agency_Name#',  '#Read_billing_states6.title_FT_Agency_State#', #read_company.id#)		
		</CFQUERY>	
	
	</CFoutput>
	
	
	
	
					<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID112">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID112.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states112">		
			select * from company_agency_assoc
			where company_id = 426 and billing_id = 41396  

</CFQUERY>	

	<CFoutput >
	
		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID112.billing_id#, #Read_billing_states112.title_FT_Agency_ID#, '#Read_billing_states112.title_FT_Agency_Name#',  '#Read_billing_states112.title_FT_Agency_State#', #read_company.id#)		
		</CFQUERY>	
	
	</CFoutput>
		
	

	
	
				<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID7">		
			SELECT *
			FROM Company_Billing_Values
			WHERE company_id = #read_company.id# and trig is null order by billing_id asc
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = 1 where billing_id = #Read_billing_ID7.billing_id#
	</CFQUERY>						
			
<CFQUERY datasource="#request.dsn#"  NAME="Read_billing_states7">		
			select * from company_agency_assoc
			where company_id = 426 and billing_id = 996

</CFQUERY>	

	<CFoutput >
	
		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID7.billing_id#, #Read_billing_states7.title_FT_Agency_ID#, '#Read_billing_states7.title_FT_Agency_Name#',  '#Read_billing_states7.title_FT_Agency_State#', #read_company.id#)		
		</CFQUERY>	
	
	</CFoutput>



	<CFQUERY datasource="#request.dsn#">		
   update company_billing_values set trig = null
	</CFQUERY>	
		 --->