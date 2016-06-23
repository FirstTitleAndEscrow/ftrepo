
<cfparam name="form.search_date" default="">

<cfparam name="form.effective_date" default="">

<cfparam name="form.file_upload" default="">

<cfparam name="session.logged_in_vendor_id" default="0">

<cfparam name="url.uid" default="0">

<cfif form.file_upload eq ''>
<script language="javascript">
alert("Please select a file to upload");
history.go(-1);
</script>
<cfabort>
<cfelseif form.effective_date eq '' or NOT IsDate(form.effective_date)>
<script language="javascript">
alert("Please fill out the Effective Date of this new update");
history.go(-1);
</script>
<cfabort>
<cfelseif form.search_date eq '' or NOT IsDate(form.search_date)>
<script language="javascript">
alert("Please fill out the Search Date of this new update");
history.go(-1);
</script>
<cfabort>
</cfif>


			<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">

<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>



		 <!--- <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update doc_abstract_prop set abstractor_doc_upload2 = '#FILE.ServerFile#'
			WHERE prop_id = #rec_ID#
			</cfquery>  --->
		 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			INSERT INTO Abstractor_Uploads (order_id, upload_date, filename, vendor_id, filetype, search_date, effective_date, uid, changes)
			values (#rec_id#, #CreateODBCDate(Now())#, '#new_file_name#', #session.logged_in_vendor_id#, 'update', #CreateODBCDate(form.search_date)#, #CreateODBCDate(form.effective_date)#, #url.uid#, #form.changes#)
			</cfquery>

		<CFQUERY datasource="#request.dsn#" NAME="read_prop">
			select * from property
			WHERE prop_id = #rec_ID#
			</cfquery>

<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
UPDATE Doc_Abstract_prop
set
a_Recieved_by = 264,
a_Date_Completed = '#DateFormat(Now(), "mm/dd/yyyy")#',
r_dateandtime = '#order_date_adj#',
a_Time_Completed = '#TimeFormat(Now(), "HH:mm:ss")#'
WHERE prop_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
update Doc_Title_Insurance_Prop set a_recieved_date = NULL
WHERE prop_id = #rec_ID#
</cfquery>


<CFQUERY datasource="#request.dsn#" NAME="update_prop">
			update property
			set appraisal_status = 'Abstract Received from Vendor'
			WHERE prop_id = #rec_ID#
</cfquery>

			<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Property set 
			cancelled = NULL
			WHERE prop_id = #rec_ID#
			</cfquery> 

			<CFQUERY datasource="#request.dsn#" NAME="update_Doc_Title_Insurance_prop">
			UPDATE Doc_Title_Insurance_prop
			set
			a_Recieved_date = NULL
			WHERE prop_ID = #rec_ID#
		    </CFQUERY>
			

		<CFINCLUDE template="./includes/typing.cfm">