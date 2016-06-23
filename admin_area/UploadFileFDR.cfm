<cfparam name="Files" default="">
<cfparam name="a_trigger" default="0">
<cfparam name="files_uploaded" default="0" >
<cfparam name="rec_id" default="0">
<CFQUERY name="get" DATASOURCE="#request.dsn#">
SELECT *
FROM Final_document_Retrieval
WHERE fdr_id = #rec_id#
</CFQUERY>


<cfif Files eq 'Multiple'>
	<cffile action="upload" destination= "c:\uploads\" result="myfiles" nameconflict="makeunique" >
		
	<cfset fileSys = CreateObject('component','cfc.FileManagement')>
	
	
	<cfset uploadedfilenames='#myfiles.clientFile#' >
	
	
	<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
	<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>

	<cfset new_file_name = #fileSys.MoveFromUploads(uploadedfilenames)#>	

	<cfquery name="addFile" datasource="#request.dsn#">
		INSERT INTO upload_many_fdr (fdr_id, fileDate, filetime, fileupload)
				VALUES('#get.fdr_id#', '#a_insert_date#', '#a_insert_time#', '#new_file_name#')
	</cfquery>
	
<cfelse>	
	<cffile action="upload" destination= #ExpandPath("./uploaded_files/zip.txt")# nameconflict="overwrite" >
</cfif>
