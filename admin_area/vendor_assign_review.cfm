<CFPARAM NAME="form.order_type" DEFAULT="T">
<CFQUERY datasource="#request.dsn#" NAME="read_abs">
			select * from vendors_Stacie
			WHERE vendor_ID = #form.vendor_id#		
</CFQUERY>



<cfif form.order_type eq 'T'>
		<CFQUERY datasource="#request.dsn#" NAME="read_title">		
			select * from Title
			WHERE title_ID = #rec_id#
		</CFQUERY>
<cfelseif form.order_type eq 'P'>
		<CFQUERY datasource="#request.dsn#" NAME="read_title">		
			select * from Property
			WHERE prop_ID = #rec_id#
		</CFQUERY>
</cfif>



<CFQUERY datasource="#request.dsn#" NAME="read_user">
select * from first_admin
WHERE ID = #session.ft_user_id#
</CFQUERY>


<cfif form.review_commit eq 1>
<CFQUERY datasource="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New 
set return_date = '',
return_time = '',
completed = '0'
where Order_id = #rec_ID#
and task = 'Review'
and completed is NULL
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="insert_abs">
Insert into Vendor_Tracker_New (Order_id,Vendor_ID,assign_date,assign_time,assigned_by,task,order_type,assigned_price)
values
('#form.Order_id#','#form.Vendor_ID#','#DateFormat(Now(), "mm/dd/yyyy")#','#TimeFormat(Now(), "HH:mm:ss")#','#session.ft_user_id#','Review','#form.order_type#',#form.review_price#)
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Review assigned to Vendor: #read_abs.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#form.order_type#', '1', '1')		
		</CFQUERY>	
<cfset vendor_assignment = 'Review'>
<!--- <cfinclude template="../auto_emails/vendor_order_email.cfm"> --->		

</cfif>

<cfif form.review_commit eq 1>
<cflocation url="vendor_manager.cfm?selected_review_vendor_id=0&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&order_type=#order_type#&rec_id=#url.rec_id###review_plot" addtoken="no">
<cfelse>
<cflocation url="vendor_manager.cfm?selected_review_vendor_id=#form.vendor_id#&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&order_type=#order_type#&rec_id=#url.rec_id###review_plot" addtoken="no">
</cfif>
<cfabort>


