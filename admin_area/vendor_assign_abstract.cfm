<CFPARAM NAME="url.delete_file" DEFAULT=0>
<CFPARAM NAME="form.abs_commit" DEFAULT=0>
<CFPARAM NAME="form.vendor_id" DEFAULT=0>
<CFPARAM NAME="form.upload_file1" DEFAULT=0>
<CFPARAM NAME="form.completed_by" DEFAULT="">
<CFPARAM NAME="form.product_ordered" DEFAULT="">
<CFPARAM NAME="form.assignment_upload" DEFAULT="">
<CFPARAM NAME="form.order_type" DEFAULT="T">
<CFPARAM NAME="form.bring_to_date" DEFAULT="">
<CFPARAM NAME="form.instructions" DEFAULT="">
<CFPARAM NAME="url.bypass" DEFAULT="">
<!--- <CFPARAM NAME="session.ft_user_id" DEFAULT="264"> --->
<cfif vendor_id NEQ 0 AND Len(abstract_price)>
	<cfif form.order_type EQ "T">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="check_company">
		select c.use_apr,c.streamline_client,t.pstate from companies c inner join title t
		on t.comp_id = c.id
		where t.title_id = #rec_id#

	</cfquery>
	<cfelseif form.order_type EQ "P">
		<CFQUERY DATASOURCE="#request.dsn#" NAME="check_company">
			select c.use_apr,c.streamline_client,p.pstate from companies c inner join property p
			on p.comp_id = c.id
			where p.prop_id = #rec_id#
		</cfquery>
	<cfelseif form.order_type EQ "PR">
		<CFQUERY DATASOURCE="#request.dsn#" NAME="check_company">
			select c.use_apr,c.streamline_client,p.pstate from companies c inner join policy_recovery p
			on p.comp_id = c.id
			where p.pr_id = #rec_id#
		</cfquery>
	<cfelseif form.order_type EQ "FDR">
		<CFQUERY DATASOURCE="#request.dsn#" NAME="check_company">
			select c.use_apr,c.streamline_client,p.pstate from companies c inner join final_document_retrieval p
			on p.comp_id = c.id
			where p.fdr_id = #rec_id#
		</cfquery>
	</cfif>

	<cfif check_company.pstate EQ "TX">
		<cfset paidby = "Texas">
	<cfelseif check_company.streamline_client EQ 1>
		<cfset paidby = "Streamline">
	<cfelse>
		<cfset paidby = "First Title">
	</cfif>


		<cfswitch expression="#product_ordered#">
			<cfcase value = "bring_to_date">
				<cfset prod = "TU">
			</cfcase>
			<cfcase value = "full_search">
				<cfset prod = "FS">
			</cfcase>
			<cfcase value = "ten_year">
				<cfset prod = "10">
			</cfcase>
			<cfcase value = "current_owner">
				<cfset prod = "CO">
			</cfcase>
			<cfcase value = "doc_retrieval">
				<cfset prod = "DR">
			</cfcase>
			<cfcase value = "two_owner">
				<cfset prod = "TO">
			</cfcase>
			<cfcase value = "bankruptcy">
				<cfset prod = "BK">
			</cfcase>
		</cfswitch>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="check_company">
			<cfif prod NEQ "TU">
				delete from apr_files
				where file_id = '#rec_id#'
				and file_type = '#order_type#'
				and product = '#prod#'
			</cfif>

			insert into apr_files(file_id,file_type,paid_by,product,aprdate,price)
			values('#rec_id#','#order_type#','#paidby#','#prod#',getDate(),'0'
			)
			<cfif check_company.use_apr EQ 1>
			insert into apr_files(file_id,file_type,paid_by,product,aprdate,price)
			values('#rec_id#','#order_type#','Client','#prod#',getDate(),'0'
			)
			</cfif>
		</cfquery>
	</cfif>




<cfif form.product_ordered eq 'bring_to_date' AND form.vendor_id NEQ 0>
<CFSET today = Now()>
<CFSET num_day = #DatePart('W', #today#)#>
<!--- note: Sun = 1
Mon = 2
Tue = 3
Wed = 4
Thu = 5
Fri = 6
Sat = 7 --->
<!--------------------------->
<!--- Third Business Day --->
<!--------------------------->
<CFIF #num_day# EQ 1>
  <!--- If it's Sunday, 3rd bus day is a Wednesday (+3) --->
  <CFSET add_day = #DateAdd('D', 3, #today#)#>
  <CFELSEIF #num_day# EQ 2>
  <!--- If it's a Monday, 3rd bus day is a Thursday (+3) --->
  <CFSET add_day = #DateAdd('D', 3, #today#)#>
  <CFELSEIF #num_day# EQ 3>
  <!--- If it's a Tuesday, 3rd bus day is a Friday (+3) --->
  <CFSET add_day = #DateAdd('D', 3, #today#)#>
  <CFELSEIF #num_day# EQ 4>
  <!--- If it's a Wednesday, 3rd bus day is a Monday (+5) --->
  <CFSET add_day = #DateAdd('D', 5, #today#)#>
  <CFELSEIF #num_day# EQ 5>
  <!--- If it's a Thursday, 3rd bus day is a Tuesday (+5) --->
  <CFSET add_day = #DateAdd('D', 5, #today#)#>
  <CFELSEIF #num_day# EQ 6>
  <!--- If it's a Friday, 3rd bus day is a Wednesday (+5) --->
  <CFSET add_day = #DateAdd('D', 5, #today#)#>
  <CFELSE>
  <!--- It's a Saturday, 3rd bus day is a Wednesday (+4) --->
  <CFSET add_day = #DateAdd('D', 4, #today#)#>
</CFIF>

	<cfif form.order_type eq 'P'>


	<CFQUERY DATASOURCE="#request.dsn#" NAME="update_title">
				update property
				set invoice_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
				duedate = '#DateFormat(add_day,"mm/dd/yyyy")#',
				appraisal_status = 'In Process'
				where prop_id = #rec_ID#

				update doc_title_insurance_prop
				set a_recieved_date = NULL,
				s_status= 0
				where prop_id = #rec_id#

				update doc_abstract_prop
				set a_date_completed = null,
				a_time_completed = null
				where prop_id = #rec_id#

	</CFQUERY>
	<cfelseif  form.order_type eq 'T'>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="update_title">
				update title
				set invoice_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
				duedate = '#DateFormat(add_day,"mm/dd/yyyy")#',
				appraisal_status = 'In Process'
				where title_id = #rec_ID#

				update doc_title_insurance_title
				set a_recieved_date = NULL,
				s_status= 0
				where title_id = #rec_id#

				update doc_abstract_title
				set a_date_completed = null,
				a_time_completed = null,
                 a_Recieved_by = null,
				product_ordered = '#form.product_ordered#',
				title_update = 1
				where title_id = #rec_id#
	</CFQUERY>
	<cfelseif  form.order_type eq 'PR'>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="update_title">
				update policy_recovery
				set invoice_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
				duedate = '#DateFormat(add_day,"mm/dd/yyyy")#',
				appraisal_status = 'In Process'
				where pr_id = #rec_ID#

				update doc_abstract_pr
				set a_date_completed = null,
				a_time_completed = null,
				product_ordered = '#form.product_ordered#',
				title_update = 1
				where pr_id = #rec_id#
	</CFQUERY>
	<cfelseif  form.order_type eq 'FDR'>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="update_title">
				update final_document_retrieval
				set invoice_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
				duedate = '#DateFormat(add_day,"mm/dd/yyyy")#',
				appraisal_status = 'In Process'
				where fdr_id = #rec_ID#

				update doc_abstract_fdr
				set a_date_completed = null,
				a_time_completed = null,
				product_ordered = '#form.product_ordered#',
				title_update = 1
				where fdr_id = #rec_id#
	</CFQUERY>
	</cfif>
</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_vendor">
			select * from vendors_Stacie
			WHERE vendor_ID = #form.vendor_id#
</CFQUERY>




<cfif Len(form.assignment_upload)>
<CFFILE
DESTINATION="c:\uploads\"
ACTION="UPLOAD"
NAMECONFLICT="MAKEUNIQUE"
FILEFIELD="assignment_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>
</cfif>


<cfif isDefined("form.upload_file1") AND form.upload_file1 eq 1>
<CFFILE
DESTINATION="c:\uploads\"
ACTION="UPLOAD"
NAMECONFLICT="MAKEUNIQUE"
FILEFIELD="file_upload1">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<cfif order_type EQ "T">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_Title set abstractor_doc_upload = '#new_file_name#'
	WHERE title_id = #rec_ID#

	UPDATE Title
	set
	appraisal_status = 'In Typing'
	WHERE title_ID = #rec_ID#
	</cfquery>
<cfelseif order_type EQ "P">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_Prop set abstractor_doc_upload = '#new_file_name#'
	WHERE prop_id = #rec_ID#

	UPDATE Property
			set
			appraisal_status = 'In Typing'
			WHERE prop_ID = #rec_ID#
	</cfquery>

<cfelseif order_type EQ "PR">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_PR set abstractor_doc_upload = '#new_file_name#'
	WHERE PR_id = #rec_ID#

	UPDATE Policy_Recovery
			set
			appraisal_status = 'In Review'
			WHERE PR_ID = #rec_ID#
	</cfquery>

<cfelseif order_type EQ "FDR">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_FDR set abstractor_doc_upload = '#new_file_name#'
	WHERE FDR_id = #rec_ID#

	UPDATE Final_Document_Retrieval
			set
			appraisal_status = 'In Review'
			WHERE FDR_ID = #rec_ID#
	</cfquery>

</cfif>

<cfif form.abstract_completed_by eq 'abstractor'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New
set return_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
return_time = '#TimeFormat(Now(), "HH:mm:ss")#',
completed = 1
where Order_id = #form.rec_ID#
and task = 'Abstract'
and completed is NULL
</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #form.rec_ID#, 'Abstract Received from Vendor - Title In Typing', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#form.order_type#', '1', '1')
		</CFQUERY>

<cfelse>

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New
set return_date = '',
return_time = '',
completed = '0'
where Order_id = #rec_ID#
and task = 'Abstract'
and completed is NULL
</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #form.rec_ID#, 'Abstract Completed and Uploaded In-House - Title In Typing', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#form.order_type#', '1', '1')
		</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_abs">
Insert into Vendor_Tracker_New (Order_id,Vendor_ID,assign_date,assign_time,assigned_by,task,order_type,completed,return_date, return_time)
values
('#form.rec_ID#','#form.vendor_id#','#DateFormat(Now(), "mm/dd/yyyy")#','#TimeFormat(Now(), "HH:mm:ss")#',<cfif url.bypass eq 1>'264'<cfelse>'#session.ft_user_id#'</cfif>,'Abstract','#form.order_type#',1,'#DateFormat(Now(), "mm/dd/yyyy")#','#TimeFormat(Now(), "HH:mm:ss")#')
</cfquery>

</cfif>

</cfif>




























<cfif isDefined("form.upload_file2") AND form.upload_file2 eq 1>
<CFFILE
DESTINATION="c:\uploads\"
ACTION="UPLOAD"
NAMECONFLICT="MAKEUNIQUE"
FILEFIELD="file_upload2">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<cfif order_type EQ "T">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_Title set abstractor_doc_upload2 = '#new_file_name#'
	WHERE title_id = #rec_ID#
	</cfquery>

<cfset temp = #routingSys.CheckForRouting(rec_ID, 'T', 'Inhouse_Abstract_Uploaded')#>


<cfelseif order_type EQ "P">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_Prop set abstractor_doc_upload2 = '#new_file_name#'
	WHERE prop_id = #rec_ID#
	</cfquery>

<cfset temp = #routingSys.CheckForRouting(rec_ID, 'P', 'Inhouse_Abstract_Uploaded')#>


	<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
	INSERT INTO Abstractor_Uploads (order_id, upload_date, filename, vendor_id, filetype)
	values (#rec_id#, #CreateODBCDate(Now())#, '#new_file_name#', #session.logged_in_vendor_id#, 'update')
	</cfquery>


<cfelseif order_type EQ "PR">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_PR set abstractor_doc_upload2 = '#new_file_name#'
	WHERE pr_id = #rec_ID#
	</cfquery>

<cfset temp = #routingSys.CheckForRouting(rec_ID, 'PR', 'Inhouse_Abstract_Uploaded')#>


	<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
	INSERT INTO Abstractor_Uploads (order_id, upload_date, filename, vendor_id, filetype)
	values (#rec_id#, #CreateODBCDate(Now())#, '#new_file_name#', #session.logged_in_vendor_id#, 'update')
	</cfquery>


<cfelseif order_type EQ "FDR">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_FDR set abstractor_doc_upload2 = '#new_file_name#'
	WHERE fdr_id = #rec_ID#
	</cfquery>

<cfset temp = #routingSys.CheckForRouting(rec_ID, 'FDR', 'Inhouse_Abstract_Uploaded')#>


	<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
	INSERT INTO Abstractor_Uploads (order_id, upload_date, filename, vendor_id, filetype)
	values (#rec_id#, #CreateODBCDate(Now())#, '#new_file_name#', #session.logged_in_vendor_id#, 'update')
	</cfquery>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #form.rec_ID#, 'Abstract Update has been Uploaded', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#form.order_type#', '1', '1')
		</CFQUERY>


</cfif>



<cfif isDefined("form.upload_file3") AND form.upload_file3 eq 1>
<CFFILE
DESTINATION="c:\uploads\"
ACTION="UPLOAD"
NAMECONFLICT="MAKEUNIQUE"
FILEFIELD="file_upload3">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<cfif order_type EQ "T">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_Title set abstractor_doc_upload3 = '#new_file_name#'
	WHERE title_id = #rec_ID#
	</cfquery>
<cfelseif order_type EQ "P">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_Prop set abstractor_doc_upload3 = '#new_file_name#'
	WHERE prop_id = #rec_ID#
	</cfquery>
	<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
	INSERT INTO Abstractor_Uploads (order_id, upload_date, filename, vendor_id, filetype)
	values (#rec_id#, #CreateODBCDate(Now())#, '#new_file_name#', #session.logged_in_vendor_id#, 'update')
	</cfquery>
<cfelseif order_type EQ "PR">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_PR set abstractor_doc_upload3 = '#new_file_name#'
	WHERE pr_id = #rec_ID#
	</cfquery>
<cfelseif order_type EQ "FDR">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
	update Doc_Abstract_FDR set abstractor_doc_upload3 = '#new_file_name#'
	WHERE FDR_id = #rec_ID#
	</cfquery>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #form.rec_ID#, 'Abstract Update has been Uploaded', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#form.order_type#', '1', '1')
		</CFQUERY>


</cfif>
















<cfif order_type EQ "T">
	<cfif url.delete_file eq 1>
	<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
	UPDATE Doc_Abstract_Title
	SET abstractor_doc_upload = NULL
	WHERE title_id = #url.rec_id#
	</CFQUERY>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_Title
	WHERE title_ID = #rec_id#
	</CFQUERY>
	<!---<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>--->
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
	UPDATE Doc_Abstract_Title
	set
	a_Recieved_by = null,
	a_Date_Completed = null,
	a_Time_Completed = null
	WHERE title_ID = #rec_ID#
	</CFQUERY>
	<!---</CFIF>--->
	</cfif>
	<cfif url.delete_file eq 2>
<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
UPDATE Doc_Abstract_Title
SET abstractor_doc_upload2 = NULL
WHERE title_id = #url.rec_id#
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
SELECT *
FROM Doc_Abstract_Title
WHERE title_ID = #rec_id#
</CFQUERY>
<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
UPDATE Doc_Abstract_Title
set
a_Recieved_by = null,
a_Date_Completed = null,
a_Time_Completed = null
WHERE title_ID = #rec_ID#
</CFQUERY>
</CFIF>
</cfif>


<cfif url.delete_file eq 3>
<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
UPDATE Doc_Abstract_Title
SET abstractor_doc_upload3 = NULL
WHERE title_id = #url.rec_id#
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
SELECT *
FROM Doc_Abstract_Title
WHERE title_ID = #rec_id#
</CFQUERY>
<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
UPDATE Doc_Abstract_Title
set
a_Recieved_by = null,
a_Date_Completed = null,
a_Time_Completed = null
WHERE title_ID = #rec_ID#
</CFQUERY>
</CFIF>
</cfif>
<cfelseif order_type EQ "P">
	<cfif url.delete_file eq 1>
	<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
	UPDATE Doc_Abstract_Prop
	SET abstractor_doc_upload = NULL
	WHERE prop_id = #url.rec_id#
	</CFQUERY>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_Prop
	WHERE prop_ID = #rec_id#
	</CFQUERY>
	<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
	UPDATE Doc_Abstract_Prop
	set
	a_Recieved_by = null,
	a_Date_Completed = null,
	a_Time_Completed = null
	WHERE prop_ID = #rec_ID#
	</CFQUERY>
	</CFIF>
	</cfif>

	<cfif url.delete_file eq 2>
	<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
	UPDATE Doc_Abstract_Prop
	SET abstractor_doc_upload2 = NULL
	WHERE prop_id = #url.rec_id#
	</CFQUERY>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_Prop
	WHERE prop_ID = #rec_id#
	</CFQUERY>
	<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
	UPDATE Doc_Abstract_Prop
	set
	a_Recieved_by = null,
	a_Date_Completed = null,
	a_Time_Completed = null
	WHERE prop_ID = #rec_ID#
	</CFQUERY>
	</CFIF>
	</cfif>

	<cfif url.delete_file eq 3>
	<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
	UPDATE Doc_Abstract_Prop
	SET abstractor_doc_upload3 = NULL
	WHERE prop_id = #url.rec_id#
	</CFQUERY>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_Prop
	WHERE prop_ID = #rec_id#
	</CFQUERY>
	<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
	UPDATE Doc_Abstract_Prop
	set
	a_Recieved_by = null,
	a_Date_Completed = null,
	a_Time_Completed = null
	WHERE prop_ID = #rec_ID#
	</CFQUERY>
	</CFIF>
	</cfif>





<cfelseif order_type EQ "PR">
	<cfif url.delete_file eq 1>
	<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
	UPDATE Doc_Abstract_PR
	SET abstractor_doc_upload = NULL
	WHERE pr_id = #url.rec_id#
	</CFQUERY>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_PR
	WHERE pr_ID = #rec_id#
	</CFQUERY>
	<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
	UPDATE Doc_Abstract_PR
	set
	a_Recieved_by = null,
	a_Date_Completed = null,
	a_Time_Completed = null
	WHERE pr_ID = #rec_ID#
	</CFQUERY>
	</CFIF>
	</cfif>

	<cfif url.delete_file eq 2>
	<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
	UPDATE Doc_Abstract_pr
	SET abstractor_doc_upload2 = NULL
	WHERE pr_id = #url.rec_id#
	</CFQUERY>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_Pr
	WHERE pr_ID = #rec_id#
	</CFQUERY>
	<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
	UPDATE Doc_Abstract_Pr
	set
	a_Recieved_by = null,
	a_Date_Completed = null,
	a_Time_Completed = null
	WHERE pr_ID = #rec_ID#
	</CFQUERY>
	</CFIF>
	</cfif>

	<cfif url.delete_file eq 3>
	<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
	UPDATE Doc_Abstract_Pr
	SET abstractor_doc_upload3 = NULL
	WHERE pr_id = #url.rec_id#
	</CFQUERY>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_Pr
	WHERE pr_ID = #rec_id#
	</CFQUERY>
	<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
	UPDATE Doc_Abstract_Pr
	set
	a_Recieved_by = null,
	a_Date_Completed = null,
	a_Time_Completed = null
	WHERE pr_ID = #rec_ID#
	</CFQUERY>
	</CFIF>
	</cfif>



	<cfelseif order_type EQ "FDR">
	<cfif url.delete_file eq 1>
	<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
	UPDATE Doc_Abstract_FDR
	SET abstractor_doc_upload = NULL
	WHERE FDR_id = #url.rec_id#
	</CFQUERY>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_FDR
	WHERE FDR_ID = #rec_id#
	</CFQUERY>
	<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
	UPDATE Doc_Abstract_FDR
	set
	a_Recieved_by = null,
	a_Date_Completed = null,
	a_Time_Completed = null
	WHERE FDR_ID = #rec_ID#
	</CFQUERY>
	</CFIF>
	</cfif>

	<cfif url.delete_file eq 2>
	<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
	UPDATE Doc_Abstract_FDR
	SET abstractor_doc_upload2 = NULL
	WHERE FDR_id = #url.rec_id#
	</CFQUERY>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_FDR
	WHERE FDR_ID = #rec_id#
	</CFQUERY>
	<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
	UPDATE Doc_Abstract_FDR
	set
	a_Recieved_by = null,
	a_Date_Completed = null,
	a_Time_Completed = null
	WHERE FDR_ID = #rec_ID#
	</CFQUERY>
	</CFIF>
	</cfif>

	<cfif url.delete_file eq 3>
	<CFQUERY name="updateinfo" DATASOURCE="#request.dsn#">
	UPDATE Doc_Abstract_FDR
	SET abstractor_doc_upload3 = NULL
	WHERE FDR_id = #url.rec_id#
	</CFQUERY>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_FDR
	WHERE FDR_ID = #rec_id#
	</CFQUERY>
	<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
	UPDATE Doc_Abstract_FDR
	set
	a_Recieved_by = null,
	a_Date_Completed = null,
	a_Time_Completed = null
	WHERE FDR_ID = #rec_ID#
	</CFQUERY>
	</CFIF>
	</cfif>

</cfif>


<cfif Len(form.bring_to_date)>
<cfif order_type EQ "P">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="clearstatus">
		update property
		set appraisal_status = 'In Process',
		duedate = DATEADD(w,3,dueDate)
		where prop_id = #rec_id#

		update doc_title_insurance_prop
		set a_recieved_date = null,
		a_recieved_time = null,
		merge_date = null
		where prop_id = #rec_id#
	</cfquery>
<cfelseif  order_type EQ "T">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="clearstatus">
		update title
		set appraisal_status = 'In Process',
		duedate = DATEADD(w,3,dueDate)
		where title_id = #rec_id#

		update doc_title_insurance_title
		set a_recieved_date = null,
		a_recieved_time = null,
		merge_date = null
		where title_id = #rec_id#
	</cfquery>
<cfelseif  order_type EQ "PR">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="clearstatus">
		update Policy_Recovery
		set appraisal_status = 'In Process',
		duedate = DATEADD(w,3,dueDate)
		where pr_id = #rec_id#
	</cfquery>
<cfelseif  order_type EQ "FDR">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="clearstatus">
		update Final_Document_Retrieval
		set appraisal_status = 'In Process',
		duedate = DATEADD(w,3,dueDate)
		where FDR_id = #rec_id#
	</cfquery>
</cfif>


</cfif>




<cfif form.abs_commit eq 1>
<CFQUERY DATASOURCE="#request.dsn#" NAME="lookup">
Update Vendor_Tracker_New
set completed = 0
where task = 'Abstract'
and order_id = '#form.Order_id#'
and completed is NULL
</cfquery>

<cfparam name="form.abstract_price" default=0>
<cfif form.abstract_price eq ''>
<cfset form.abstract_price = 0>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="check_abs">
	select * from vendor_tracker_new
	where order_id = '#form.order_id#'
	and product_ordered = '#form.product_ordered#'
	and task = 'Abstract'
	and order_type = '#form.order_type#'
</cfquery>

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_abs">
<cfif form.product_ordered NEQ "bring_to_date" AND check_abs.recordcount AND 1 EQ 0>
	update vendor_tracker_new
	set vendor_id = '#form.vendor_id#'
	where id = #check_abs.id#
<cfelse>

Insert into Vendor_Tracker_New (Order_id,Vendor_ID,assign_date,assign_time,assigned_by,task,product_ordered,bring_to_date,order_type,assigned_price)
values
('#form.Order_id#','#form.Vendor_ID#','#DateFormat(Now(), "mm/dd/yyyy")#','#TimeFormat(Now(), "HH:mm:ss")#',<cfif url.bypass eq 1>'264'<cfelse>'#session.ft_user_id#'</cfif>,'Abstract','#form.product_ordered#','#form.bring_to_date#','#form.order_type#',#form.abstract_price#)
</cfif>
</cfquery>

<cfif Len(form.assignment_upload)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="lookup">
Update Vendor_Tracker_New
set assignment_upload = '#new_file_name#'
where task = 'Abstract'
and order_id = '#form.Order_id#'
and completed is NULL
</cfquery>
</cfif>

<CFPARAM NAME="a_trigger" DEFAULT=0>
<CFPARAM NAME="form.title_update" DEFAULT="">
<CFPARAM NAME="form.taxes_from_search" DEFAULT="">
<CFPARAM NAME="form.product_ordered" DEFAULT="">
<CFPARAM NAME="form.bring_to_date" DEFAULT="">

<cfswitch expression="#form.product_ordered#">
<cfcase value="bring_to_date">
<cfset form.product_ordered = "Bring To Date">
</cfcase>
<cfcase value="full_search">
<cfset form.product_ordered = "Full Search">
</cfcase>
<cfcase value="ten_year">
<cfset form.product_ordered = "10-Year Search">
</cfcase>
<cfcase value="current_owner">
<cfset form.product_ordered = "Current Owner Search with 24 month chain of title">
</cfcase>
<cfcase value="doc_retrieval">
<cfset form.product_ordered = "Document Retrieval">
</cfcase>
<cfcase value="two_owner">
<cfset form.product_ordered = "Two Owner Search">
</cfcase>
<cfcase value="bankruptcy">
<cfset form.product_ordered = "Bankruptcy">
</cfcase>
</cfswitch>
<cfif form.bring_to_date neq ''>
<cfset form.product_ordered = 'Bring to Date' & ' - ' & DateFormat(form.bring_to_date, "m/d/yyyy")>
</cfif>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_vendor">
			select * from vendors_Stacie
			WHERE vendor_ID = #form.vendor_id#
</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			select * from Title
			WHERE title_ID = #rec_id#
		</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
select * from first_admin
WHERE ID = <cfif url.bypass eq 1>264<cfelse>#session.ft_user_id#</cfif>
</CFQUERY>


<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>




		<CFQUERY DATASOURCE="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Abstract assigned to Vendor: #read_vendor.company# Product Ordered:#form.product_ordered# <cfif Len(form.Instructions)>Instructions: #form.instructions#</cfif>', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#form.order_type#', '1', '1')
		</CFQUERY>

<cfset vendor_assignment = 'Abstract'>
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
<cfelseif order_type EQ "PR">
	<cfinclude template="pr_abstract_doc_assign_new.cfm">
<cfelseif order_type EQ "FDR">
	<cfinclude template="fdr_abstract_doc_assign_new.cfm">
</cfif>
</cfif>


<cfif  IsDefined("session.ft_user_id")>
<cfif session.ft_user_id EQ 462 OR session.ft_user_id EQ 458>
<cfif order_type EQ "P">
<cfset prop_id = rec_id>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_tracker">
	select top 1 * from vendor_tracker_new
	where order_id = #prop_id#
	AND task = 'Abstract'
	order by assign_date desc
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_tracker_all">
	select * from vendor_tracker_new
	where order_id = #rec_id#
	AND task = 'Abstract'
	order by assign_date desc
</CFQUERY>
<cfset invoicecount = read_tracker_all.recordcount>
<cfset updatecount = 0>
<cfoutput query="read_tracker_all">
<cfif product_ordered EQ "bring_to_date">
	<cfset updatecount = updatecount + 1>
</cfif>
</cfoutput>
<cfinclude template="/includes/sbinvoice.cfm">
<!--- <cfmail to="jwheeler@streamline-title.com" from="vendormgr@streamline-title.com" subject="Invoice for #rec_id#" mimeattach="c:\uploads\P-#rec_id#_INVOICE.pdf">

</cfmail>
 --->
 </cfif>
</cfif>
</cfif>

<cfif form.abs_commit eq 1>
<cflocation url="vendor_manager.cfm?selected_abstract_vendor_id=0&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#url.rec_id#&product_ordered=#form.product_ordered#&order_type=#order_type#&code=#order_type###abstract_plot" addtoken="no">
<cfelse>
<cflocation url="vendor_manager.cfm?selected_abstract_vendor_id=#form.vendor_id#&uid=#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#url.rec_id#&product_ordered=#form.product_ordered#&order_type=#order_type#&code=#order_type###abstract_plot" addtoken="no">
</cfif>
<cfabort>

