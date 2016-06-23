<CFQUERY datasource="#request.dsn#" NAME="read_vendor">
			select * from vendors_Stacie
			WHERE vendor_ID = #form.vendor_id#		
</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title">		
			select * from Title
			WHERE title_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
select * from first_admin
WHERE ID = #session.ft_user_id#
</CFQUERY>


<cfif form.appraisal_commit eq 1>
<CFQUERY datasource="#request.dsn#" NAME="lookup">
Update Vendor_Tracker_New
set completed = 0,
cancelled = 1,
return_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
return_time = '#TimeFormat(Now(), "HH:mm:ss")#'
where task = 'Appraisal'
and order_id = '#form.Order_id#'
and completed is NULL
</cfquery>


<CFQUERY datasource="#request.dsn#" NAME="find_order">
Select * from Appraisal
where app_id = '#form.Order_id#'
</cfquery>


<CFQUERY datasource="#request.dsn#" NAME="insert_item">
Insert into Vendor_Tracker_New (Order_id,Vendor_ID,assign_date,assign_time,assigned_by,task,order_type,assigned_price)
values
('#form.Order_id#','#form.Vendor_ID#','#DateFormat(Now(), "mm/dd/yyyy")#','#TimeFormat(Now(), "HH:mm:ss")#','#session.ft_user_id#','Appraisal','#form.order_type#',#form.appraisal_price#)
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
select * from first_admin
WHERE ID = #session.ft_user_id#
</CFQUERY>


<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
<CFQUERY datasource="#request.dsn#" NAME="read_vendor">
			select * from vendors_Stacie
			WHERE vendor_ID = #form.vendor_id#		
</CFQUERY>



		
		<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #form.Order_id#, 'Appraisal assigned to Vendor: #read_vendor.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'App', '1', '1')		
		</CFQUERY>	
		
<cfset vendor_assignment = 'Appraisal'>
<cfinclude template="../auto_emails/vendor_order_email.cfm">		
</cfif>


<cfif form.appraisal_commit eq 1>
<cflocation url="vendor_manager.cfm?selected_appraisal_vendor_id=0&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#url.rec_id#&order_type=App&code=A##appraisal_plot" addtoken="no">
<cfelse>
<cflocation url="vendor_manager.cfm?selected_appraisal_vendor_id=#form.vendor_id#&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#url.rec_id#&order_type=App&code=A##appraisal_plot" addtoken="no">
</cfif>
<cfabort>


