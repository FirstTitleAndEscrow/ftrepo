<CFPARAM NAME="form.order_type" DEFAULT="T">
<CFPARAM NAME="url.bypass" DEFAULT="">



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abs">
			select * from vendors_Stacie
			WHERE vendor_ID = #form.vendor_id#		
</CFQUERY>
		
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_vendor">
			select * from vendors_Stacie
			WHERE vendor_ID = #form.vendor_id#		
</CFQUERY>


<cfif order_type eq 'T'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			Select * from Title
			where title_id = #url.rec_id#
</CFQUERY>
<cfelseif order_type eq 'App'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			Select * from appraisal
			where app_id = #url.rec_id#
</CFQUERY>
<cfelseif order_type eq 'P'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			Select *, prop_id as title_id from Property
			where prop_id = #url.rec_id#
</CFQUERY>
</cfif>


<cfif vendor_id NEQ 0 AND Len(taxprep_price)>
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
			delete from apr_files 
			where file_id = '#rec_id#'
			and file_type = '#order_type#'
			and product = 'TX'
			
			insert into apr_files(file_id,file_type,paid_by,product,aprdate,price)
			values('#rec_id#','#order_type#','#paidby#','TX',getDate(),'#taxprep_price#'
			)
			
		</cfquery>
	

</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
select * from first_admin
WHERE ID = <cfif url.bypass eq 1>264<cfelse>#session.ft_user_id#</cfif>
</CFQUERY>


<cfif form.taxprep_commit eq 1>
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New 
set return_date = '',
return_time = '',
completed = '0'
where Order_id = #rec_ID#
and task = 'TaxPrep'
and completed is NULL
</cfquery>




<CFQUERY datasource="#request.dsn#" name="check_for_record">
	SELECT * FROM  tblUser_Roles
	where title_id = #rec_id# 
 </cfquery>
 <cfif check_for_record.recordcount lt 1>
<CFQUERY datasource="#request.dsn#" name="insert_for_record">
	INSERT INTO  tblUser_Roles (title_id)
	values (#rec_id#) 
 </cfquery>
 </cfif>
 <CFQUERY datasource="#request.dsn#" name="check_for_record">
	SELECT * FROM  tax_cert_title
	where title_id = #rec_id# 
 </cfquery>
 <cfif check_for_record.recordcount lt 1>
<CFQUERY datasource="#request.dsn#" name="insert_for_record">
	INSERT INTO tax_cert_title (title_id)
	values (#rec_id#) 
 </cfquery>
 </cfif>


<cfparam name="form.taxprep_price" default=0>
<cfif form.taxprep_price eq ''>
<cfset form.taxprep_price = 0>
</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_item">
Insert into Vendor_Tracker_New (Order_id,Vendor_ID,assign_date,assign_time,assigned_by,task,order_type,assigned_price)
values
('#form.Order_id#','#form.Vendor_ID#','#DateFormat(Now(), "mm/dd/yyyy")#','#TimeFormat(Now(), "HH:mm:ss")#',<cfif url.bypass eq 1>'264'<cfelse>'#session.ft_user_id#'</cfif>,'TaxPrep','#form.order_type#',#form.taxprep_price#)
</cfquery>


<CFQUERY DATASOURCE="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Tax Preparation assigned to Vendor: #read_abs.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#order_type#', '1', '1')		
		</CFQUERY>	
		
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
		
	UPDATE Doc_Abstract_Title
	SET Abstractor_tax_ID = #form.Vendor_ID#,
	tx_type = 1
	WHERE title_ID = #form.Order_id#

</CFQUERY>
 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">

	UPDATE tax_cert_Title
	SET a_date_started = NULL,
	taxes_completed = 0
	WHERE title_ID = #form.Order_id#

</CFQUERY>
<cfset vendor_assignment = 'TaxPrep'>

<cfinclude template="../auto_emails/vendor_order_email.cfm">		


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_old_abs">
			select * from abstractors
			WHERE username = '#read_vendor.username#'		
			AND password = '#read_vendor.password#'
</CFQUERY>

<cfif url.bypass eq 1>
<cfset uid = 264>
<cfelse>
<cfset uid = session.ft_user_id>
</cfif>

<cfset al = 1>
<cfset abstractor_id_new = read_old_abs.abstractor_id>
<cfset a_trigger = 1>


<cfif order_type EQ "T">

	<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
		
			UPDATE Doc_Abstract_title
			SET Abstractor_tax_ID = #Abstractor_ID_new#,
			tx_type = 1
			WHERE title_ID = #rec_ID#
		
		</CFQUERY>
		
	
<CFQUERY datasource="#request.dsn#" NAME="vendor_tracker">	
		Insert into Vendor_Tracker (Vendor_id, Order_id, order_type, assign_date, assigned_by, vendor_type, task)
		values
		(#Abstractor_ID_new#, #rec_id#, 'T', #createODBCDateTime(Now())#, #uid#, 'taxes', 'Tax Certification Report')
</CFQUERY>
<cfelseif order_type EQ "P">
<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
		
			UPDATE Doc_Abstract_prop
			SET Abstractor_tax_ID = #Abstractor_ID_new#,
			tx_type = 1
			WHERE prop_ID = #rec_ID#
		
		</CFQUERY>
		
	
<CFQUERY datasource="#request.dsn#" NAME="vendor_tracker">	
		Insert into Vendor_Tracker (Vendor_id, Order_id, order_type, assign_date, assigned_by, vendor_type, task)
		values
		(#Abstractor_ID_new#, #rec_id#, 'P', #createODBCDateTime(Now())#, #uid#, 'taxes', 'Tax Certification Report')
</CFQUERY>

</cfif>


</cfif>

<cfif form.taxprep_commit eq 1>
<cflocation url="vendor_manager.cfm?selected_taxprep_vendor_id=0&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&order_type=#order_type#&rec_id=#url.rec_id###taxprep_plot" addtoken="no">
<cfelse>
<cflocation url="vendor_manager.cfm?selected_taxprep_vendor_id=#form.vendor_id#&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&order_type=#order_type#&rec_id=#url.rec_id###taxprep_plot" addtoken="no">
</cfif>
<cfabort>




