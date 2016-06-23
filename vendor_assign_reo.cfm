<cfset session.ft_user_id = 264>
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


<cfif form.upload_reo eq 1>
<CFFILE 			
DESTINATION="c:\uploads\"
ACTION="UPLOAD"
NAMECONFLICT="MAKEUNIQUE"
FILEFIELD="file_reo">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
update Title set reo_package = '#new_file_name#'
WHERE title_id = #rec_ID#
</cfquery> 

<cfif form.abstract_completed_by eq 'vendor'>
<CFQUERY datasource="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New 
set return_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
return_time = '#TimeFormat(Now(), "HH:mm:ss")#',
completed = 1
where Order_id = #form.rec_ID#
and task = 'REO'
and completed is NULL
</cfquery>
<CFQUERY datasource="#request.dsn#" name="write_note">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #form.rec_ID#, 'REO Package Received from Vendor', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>

<cfelse>

<CFQUERY datasource="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New 
set return_date = '',
return_time = '',
completed = '0'
where Order_id = #rec_ID#
and task = 'REO'
and completed is NULL
</cfquery>
<CFQUERY datasource="#request.dsn#" name="write_note">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #form.rec_ID#, 'REO Package Completed and Uploaded In-House', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>


</cfif>

</cfif>






<cfif form.reo_commit eq 1>
<CFQUERY datasource="#request.dsn#" NAME="lookup">
Update Vendor_Tracker_New
set completed = 0,
cancelled = 1,
return_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
return_time = '#TimeFormat(Now(), "HH:mm:ss")#'
where task = 'REO'
and order_id = '#form.Order_id#'
and completed is NULL
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="insert_item">
Insert into Vendor_Tracker_New (Order_id,Vendor_ID,assign_date,assign_time,assigned_by,task,order_type,assigned_price)
values
('#form.Order_id#','#form.Vendor_ID#','#DateFormat(Now(), "mm/dd/yyyy")#','#TimeFormat(Now(), "HH:mm:ss")#','#session.ft_user_id#','REO','#form.order_type#',#form.reo_price#)
</cfquery>


<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'REO Package Retrieval assigned to Vendor: #read_vendor.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>	
<cfset vendor_assignment = 'REO'>
<cfinclude template="auto_emails/vendor_order_email.cfm">		

</cfif>
