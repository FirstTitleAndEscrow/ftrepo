<cfparam name="Files" default="">
<cfparam name="a_trigger" default="0">
<cfparam name="files_uploaded" default="0" >
<cfparam name="rec_id" default="0">
<CFQUERY name="get" DATASOURCE="#request.dsn#">
SELECT *
FROM title
WHERE title_id = <cfqueryparam cfsqltype="cf_sql_numeric" value=#rec_id#> 
</CFQUERY>


<cfif Files eq 'Multiple'>
	<cffile action="upload" destination= "C:\inetpub\wwwroot\Clients" result="myfiles" nameconflict="makeunique" >
		
	<cfset fileSys = CreateObject('component','cfc.FileManagement')>
	
	<cfif Len(get.realec_transactionid)>
		<cfset internalOnly=1 >
	</cfif>		
	
	<cfset uploadedfilenames='#myfiles.clientFile#' >
	
	
	<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
	<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
	<CFSET compress_file = "1" >

	<cfset new_file_name = #fileSys.MoveFromUploads(uploadedfilenames)#>	

	<cfquery name="addFile" datasource="#request.dsn#">
		INSERT INTO upload_many (title_id, fileDate, filetime, fileupload, needs_compression)
				VALUES('#get.title_id#', '#a_insert_date#', '#a_insert_time#', '#new_file_name#', '#compress_file#')
	</cfquery>
	
<cfelse>	
	<cffile action="upload" destination= #ExpandPath("./uploaded_files/zip.txt")# nameconflict="overwrite" >
</cfif>
