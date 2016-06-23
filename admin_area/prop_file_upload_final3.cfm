  

			<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Doc_Abstract_prop set abstractor_doc_upload3 = '#new_file_name#'
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
update Doc_Title_Insurance_Prop set a_Recieved_date = NULL
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