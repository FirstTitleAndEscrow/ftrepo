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

<cfif vendor_id NEQ 0 AND Len(deedprep_price)>
	<cfif form.order_type EQ "T">
		<CFQUERY DATASOURCE="#request.dsn#" NAME="check_company">
			select c.use_apr,c.streamline_client,t.pstate from companies c inner join title t
			on t.comp_id = c.id
			where t.title_id = #rec_id#
		
		</cfquery>
	<cfelse>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="check_company">
			select c.use_apr,c.streamline_client,p.pstate from companies c inner join property p
			on p.comp_id = c.id
			where p.prop_id = #rec_id#
		
		</cfquery>
	</cfif>
		
	<cfif check_company.pstate EQ "TX">
		<cfset paidby = "Texas">
	<cfelseif check_company.streamline_client EQ 1>
		<cfset paidby = "Streamline">
	<cfelse>
		<cfset paidby = "First Title">
	</cfif>
	
	
		
		<CFQUERY DATASOURCE="#request.dsn#" NAME="check_company">
			insert into apr_files(file_id,file_type,paid_by,product,aprdate,price)
			values('#rec_id#','#order_type#','#paidby#','ICL',getDate(),'#deedprep_price#'
			)
			
		</cfquery>
	

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_user">
select * from first_admin
WHERE ID = #session.ft_user_id#
</CFQUERY>


<cfif form.deedprep_commit eq 1>
<CFQUERY datasource="#request.dsn#" NAME="insert_item">
Insert into Vendor_Tracker_New (Order_id,Vendor_ID,assign_date,assign_time,assigned_by,task,order_type,assigned_price)
values
('#form.Order_id#','#form.Vendor_ID#','#DateFormat(Now(), "mm/dd/yyyy")#','#TimeFormat(Now(), "HH:mm:ss")#','#session.ft_user_id#','DeedPrep','#form.order_type#',#form.deedprep_price#)
</cfquery>


<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Deed Preparation assigned to Vendor: #read_abs.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#form.order_type#', '1', '1')		
		</CFQUERY>	
<cfset vendor_assignment = 'DeedPrep'>
<cfinclude template="../auto_emails/vendor_order_email.cfm">		

</cfif>

<cfif form.deedprep_commit eq 1>
<cflocation url="vendor_manager.cfm?selected_deedprep_vendor_id=0&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#url.rec_id###deedprep_plot" addtoken="no">
<cfelse>
<cflocation url="vendor_manager.cfm?selected_deedprep_vendor_id=#form.vendor_id#&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#url.rec_id###deedprep_plot" addtoken="no">
</cfif>
<cfabort>


