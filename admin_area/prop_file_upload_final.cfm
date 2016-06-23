  

			<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Doc_Abstract_prop set abstractor_doc_upload = '#new_file_name#'
			WHERE prop_id = #rec_ID#
			</cfquery> 
<cfif Right(new_file_name, 3) eq 'PDF' or Right(new_file_name, 3) eq 'pdf'>
<cfthread action="run" name="compress_this" >
<cfset temp = #fileSys.GetCompressReturnPDF('#new_file_name#')#>
</cfthread>
</cfif>           

<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
			UPDATE Doc_Abstract_prop
			set
			a_Recieved_by = #uid#,
			a_Date_Completed = '#DateFormat(Now(), "mm/dd/yyyy")#',
			r_dateandtime = '#order_date_adj#',
			a_Time_Completed = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="update_Doc_Title_Insurance_prop">
			UPDATE Doc_Title_Insurance_prop
			set
			a_Recieved_date = NULL
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
		update Property set appraisal_status = 'Abstract Received from Vendor'
		WHERE prop_id = #rec_ID#
	</cfquery> 
		<CFQUERY datasource="#request.dsn#" NAME="read_role">
		 	Select * from tblUser_Roles
			where prop_id = #rec_id# 
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
update Property set 
cancelled = NULL
WHERE prop_id = #rec_ID#
</cfquery> 

	
		<CFINCLUDE template="./includes/typing.cfm">