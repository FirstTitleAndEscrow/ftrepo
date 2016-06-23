<CFPARAM NAME="url.bypass" DEFAULT="">
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


<cfif vendor_id NEQ 0 AND Len(typing_price)>
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
			and product = 'TY'
				
			insert into apr_files(file_id,file_type,paid_by,product,aprdate,price)
			values('#rec_id#','#order_type#','#paidby#','TY',getDate(),'#typing_price#'
			)
			
		</cfquery>
	

</cfif>







<CFQUERY datasource="#request.dsn#" NAME="read_user">
select * from first_admin
WHERE ID = <cfif url.bypass eq 1>264<cfelse>#session.ft_user_id#</cfif>
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_vendor">
			select * from vendors_Stacie
			WHERE vendor_ID = #form.vendor_id#		
</CFQUERY>


<cfif form.typing_commit eq 1>
<CFQUERY datasource="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New 
set return_date = '',
return_time = '',
completed = '0'
where Order_id = #rec_ID#
and task = 'Typing'
and completed is NULL
</cfquery>

<cfparam name="form.typing_price" default=0>
<cfif form.typing_price eq ''>
<cfset form.typing_price = 0>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="insert_abs">
Insert into Vendor_Tracker_New (Order_id,Vendor_ID,assign_date,assign_time,assigned_by,task,order_type,assigned_price)
values
('#form.Order_id#','#form.Vendor_ID#','#DateFormat(Now(), "mm/dd/yyyy")#','#TimeFormat(Now(), "HH:mm:ss")#',<cfif url.bypass eq 1>'264'<cfelse>'#session.ft_user_id#'</cfif>,'Typing','#form.order_type#',#form.typing_price#)
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Typing assigned to Vendor: #read_abs.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#form.order_type#', '1', '1')		
		</CFQUERY>	
		
<cfif form.order_type eq 'P'>
<CFQUERY datasource="#request.dsn#" NAME="update_status">
update Property
set appraisal_status = 'In Typing'
where prop_id = #URL.rec_id#
</cfquery>
</cfif>

<cfset vendor_assignment = 'Typing'>
<cfset form.product_ordered = "Typing">
<!---
<cfinclude template="../auto_emails/vendor_order_email.cfm">		
--->
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
<cfset a_trigger = 10>

<cfif order_type EQ "T">
	<cfinclude template="title_abstract_doc_assign_new.cfm">
<cfelseif order_type EQ "P">
	<cfinclude template="prop_abstract_doc_assign_new.cfm">
</cfif>
</cfif>

<cfif form.typing_commit eq 1>
<cflocation url="vendor_manager.cfm?selected_typing_vendor_id=0&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#url.rec_id#&order_type=#order_type#&code=#order_type###abstract_plot" addtoken="no">
<cfelse>
<cflocation url="vendor_manager.cfm?selected_typing_vendor_id=#form.vendor_id#&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#url.rec_id#&order_type=#order_type#&code=#order_type###abstract_plot" addtoken="no">
</cfif>
<cfabort>



