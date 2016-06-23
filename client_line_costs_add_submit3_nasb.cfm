<cfpARAM NAME="url.read_id" DEFAULT="0">
<cfif NOT IsDefined("read_id.ID")>
<CFQUERY datasource="#request.dsn#" NAME="Read_ID">	
			SELECT *
			FROM companies
			WHERE ID = 100
</CFQUERY>
</cfif>
<cfpARAM NAME="copy_from" DEFAULT="0">

<cfif url.read_id neq 0>
<cfset read_id.ID = url.read_id>
</cfif>

<cfset read_from_account = 2878>
<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>
<CFQUERY datasource="#request.dsn#" NAME="read_company">	
			SELECT *
			FROM companies
			WHERE ID = #Read_ID.id#
</CFQUERY>

<cfif read_company.master_co_id eq 2878>
<cfset read_from_account = 2878>
</cfif>

<CFQUERY datasource="#request.dsn#"  NAME="Read_default_rates">
			select *
			from Company_Billing_Values where company_id = #read_from_account#
</CFQUERY>

<cfoutput query="Read_default_rates">
<cfset old_billing_id = Read_default_rates.billing_id>
<CFQUERY datasource="#request.dsn#">
			INSERT INTO Company_Billing_Values(company_id, a_803, a_804, a_805, a_806, a_807, a_808, a_810, a_811, a_812, a_813, a_814, a_815, a_816, a_803b, a_804b, a_805b, a_806b, a_807b, a_808b, a_810b, a_811b, a_812b, a_813b, a_814b, a_815b, a_816b, a_803c, a_804c, a_805c, a_806c, a_807c, a_808c, a_810c, a_811c, a_812c, a_813c, a_814c, a_815c, a_816c, a_803d, a_804d, a_805d, a_806d, a_807d, a_808d, a_810d, a_811d, a_812d, a_813d, a_814d, a_815d, a_816d, a_803f, a_804f, a_805f, a_806f, a_807f, a_808f, a_810f, a_811f, a_812f, a_813f, a_814f, a_815f, a_816f, a_803_text, a_804_text, a_805_text, a_806_text, a_807_text, a_808_text, a_810_text, a_811_text, a_812_text, a_813_text, a_814_text, a_815_text, a_816_text,a_803_textb, a_804_textb, a_805_textb, a_806_textb, a_807_textb, a_808_textb, a_810_textb, a_811_textb, a_812_textb, a_813_textb, a_814_textb, a_815_textb, a_816_textb, a_803_textc, a_804_textc, a_805_textc, a_806_textc, a_807_textc, a_808_textc, a_810_textc, a_811_textc, a_812_textc, a_813_textc, a_814_textc, a_815_textc, a_816_textc, a_803_textd, a_804_textd, a_805_textd, a_806_textd, a_807_textd, a_808_textd, a_810_textd, a_811_textd, a_812_textd, a_813_textd, a_814_textd, a_815_textd, a_816_textd,a_803_textf, a_804_textf, a_805_textf, a_806_textf, a_807_textf, a_808_textf, a_810_textf, a_811_textf, a_812_textf, a_813_textf, a_814_textf, a_815_textf, a_816_textf, a_1101, a_1102, a_1103, a_1104, a_1105, a_1106, a_1107, a_1111, a_1111_text, a_1112, a_1112_text, a_1113, a_1113_text, a_1205, a_1205_text, a_1303, a_1303_text, a_1304, a_1304_text, a_1305, a_1305_text, a_1101b, a_1102b, a_1103b, a_1104b, a_1105b, a_1106b, a_1107b, a_1111b, a_1111_textb, a_1112b, a_1112_textb, a_1113b, a_1113_textb, a_1205b, a_1205_textb, a_1303b, a_1303_textb, a_1304b, a_1304_textb, a_1305b, a_1305_textb, a_1101c, a_1102c, a_1103c, a_1104c, a_1105c, a_1106c, a_1107c, a_1111c, a_1111_textc, a_1112c, a_1112_textc, a_1113c, a_1113_textc, a_1205c, a_1205_textc, a_1303c, a_1303_textc, a_1304c, a_1304_textc, a_1305c, a_1305_textc, a_1101d, a_1102d, a_1103d, a_1104d, a_1105d, a_1106d, a_1107d, a_1111d, a_1111_textd, a_1112d, a_1112_textd, a_1113d, a_1113_textd, a_1205d, a_1205_textd, a_1303d, a_1303_textd, a_1304d, a_1304_textd, a_1305d, a_1305_textd, b_date, b_time, trig)
			VALUES(#read_company.id#, '#a_803#', '#a_804#', '#a_805#', '#a_806#', '#a_807#', '#a_808#', '#a_810#', '#a_811#', '#a_812#', '#a_813#', '#a_814#', '#a_815#', '#a_816#', '#a_803b#', '#a_804b#', '#a_805b#', '#a_806b#', '#a_807b#', '#a_808b#', '#a_810b#', '#a_811b#', '#a_812b#', '#a_813b#', '#a_814b#', '#a_815b#', '#a_816b#', '#a_803c#', '#a_804c#', '#a_805c#', '#a_806c#', '#a_807c#', '#a_808c#', '#a_810c#', '#a_811c#', '#a_812c#', '#a_813c#', '#a_814c#', '#a_815c#', '#a_816c#', '#a_803d#', '#a_804d#', '#a_805d#', '#a_806d#', '#a_807d#', '#a_808d#', '#a_810d#', '#a_811d#', '#a_812d#', '#a_813d#', '#a_814d#', '#a_815d#', '#a_816d#', '#a_803f#', '#a_804f#', '#a_805f#', '#a_806f#', '#a_807f#', '#a_808f#', '#a_810f#', '#a_811f#', '#a_812f#', '#a_813f#', '#a_814f#', '#a_815f#', '#a_816f#', '#a_803_text#', '#a_804_text#', '#a_805_text#', '#a_806_text#', '#a_807_text#', '#a_808_text#', '#a_810_text#', '#a_811_text#', '#a_812_text#', '#a_813_text#', '#a_814_text#', '#a_815_text#', '#a_816_text#', '#a_803_textb#', '#a_804_textb#', '#a_805_textb#', '#a_806_textb#', '#a_807_textb#', '#a_808_textb#', '#a_810_textb#', '#a_811_textb#', '#a_812_textb#', '#a_813_textb#', '#a_814_textb#', '#a_815_textb#', '#a_816_textb#', '#a_803_textc#', '#a_804_textc#', '#a_805_textc#', '#a_806_textc#', '#a_807_textc#', '#a_808_textc#', '#a_810_textc#', '#a_811_textc#', '#a_812_textc#', '#a_813_textc#', '#a_814_textc#', '#a_815_textc#', '#a_816_textc#', '#a_803_textd#', '#a_804_textd#', '#a_805_textd#', '#a_806_textd#', '#a_807_textd#', '#a_808_textd#', '#a_810_textd#', '#a_811_textd#', '#a_812_textd#', '#a_813_textd#', '#a_814_textd#', '#a_815_textd#', '#a_816_textd#', '#a_803_textf#', '#a_804_textf#', '#a_805_textf#', '#a_806_textf#', '#a_807_textf#', '#a_808_textf#', '#a_810_textf#', '#a_811_textf#', '#a_812_textf#', '#a_813_textf#', '#a_814_textf#', '#a_815_textf#', '#a_816_textf#', '#a_1101#', '#a_1102#', '#a_1103#', '#a_1104#', '#a_1105#', '#a_1106#', '#a_1107#', '#a_1111#', '#a_1111_text#', '#a_1112#', '#a_1112_text#', '#a_1113#', '#a_1113_text#', '#a_1205#', '#a_1205_text#', '#a_1303#', '#a_1303_text#', '#a_1304#', '#a_1304_text#', '#a_1305#', '#a_1305_text#', '#a_1101b#', '#a_1102b#', '#a_1103b#', '#a_1104b#', '#a_1105b#', '#a_1106b#', '#a_1107b#', '#a_1111b#', '#a_1111_textb#', '#a_1112b#', '#a_1112_textb#', '#a_1113b#', '#a_1113_textb#', '#a_1205b#', '#a_1205_textb#', '#a_1303b#', '#a_1303_textb#', '#a_1304b#', '#a_1304_textb#', '#a_1305b#', '#a_1305_textb#', '#a_1101c#', '#a_1102c#', '#a_1103c#', '#a_1104c#', '#a_1105c#', '#a_1106c#', '#a_1107c#', '#a_1111c#', '#a_1111_textc#', '#a_1112c#', '#a_1112_textc#', '#a_1113c#', '#a_1113_textc#', '#a_1205c#', '#a_1205_textc#', '#a_1303c#', '#a_1303_textc#', '#a_1304c#', '#a_1304_textc#', '#a_1305c#', '#a_1305_textc#', '#a_1101d#', '#a_1102d#', '#a_1103d#', '#a_1104d#', '#a_1105d#', '#a_1106d#', '#a_1107d#', '#a_1111d#', '#a_1111_textd#', '#a_1112d#', '#a_1112_textd#', '#a_1113d#', '#a_1113_textd#', '#a_1205d#', '#a_1205_textd#', '#a_1303d#', '#a_1303_textd#', '#a_1304d#', '#a_1304_textd#', '#a_1305d#', '#a_1305_textd#', '#b_date#', '#b_time#', 1)	
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
			where company_id = #read_from_account# and billing_id = #old_billing_id#
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
