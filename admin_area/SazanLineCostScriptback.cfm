
<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>

		<CFQUERY datasource="#request.dsn#" NAME="read_company">
		
			SELECT     *
FROM         company_billing_states cbs INNER JOIN
                      Company_Billing_Values cbv ON cbs.billing_id = cbv.Billing_ID
WHERE     (cbs.a_states = 'CA')
			
		
		</CFQUERY>

		
		
	<cfoutput query="read_company">
	
		<CFQUERY datasource="#request.dsn#">
			update Company_Billing_Values      
		
			set company_id = #company_id#, 
			a_1101 = '600',
			a_1105= null,
			a_1111= '85', 
			a_1111_text= 'Sub escrow fee',
			a_1113= null, 
			a_1113_text= null,
			a_1112= null,
			a_1112_text=  null,
			a_1205=  '45',
			a_1205_text=  'Recording Service fee',
			a_1303= '50',
			a_1303_text=  'Curative fee',
			a_1101b = '600',
			a_1105b= null,
			a_1111b= '85', 
			a_1111_textb= 'Sub escrow fee',
			a_1113b= null, 
			a_1113_textb= null,
			a_1112b= null,
			a_1112_textb=  null,
			a_1205b=  '45',
			a_1205_textb=  'Recording Service fee',
			a_1303b= '50',
			a_1303_textb=  'Curative fee',
			a_1101c = '600',
			a_1105c= null,
			a_1111c= '85', 
			a_1111_textc= 'Sub escrow fee',
			a_1113c= null, 
			a_1113_textc= null,
			a_1112c= null,
			a_1112_textc=  null,
			a_1205c=  '45',
			a_1205_textc=  'Recording Service fee',
			a_1303c= '50',
			a_1303_textc=  'Curative fee',
			a_1101d = '600',
			a_1105d= null,
			a_1111d= '85', 
			a_1111_textd= 'Sub escrow fee',
			a_1113d= null, 
			a_1113_textd= null,
			a_1112d= null,
			a_1112_textd=  null,
			a_1205d=  '45',
			a_1205_textd=  'Recording Service fee',
			a_1303d= '50',
			a_1303_textd=  'Curative fee',
			b_date= '#b_date#',
			b_time='#b_time#'
			where billing_id = #billing_id#
		
		</CFQUERY>	
	

</cfoutput>	