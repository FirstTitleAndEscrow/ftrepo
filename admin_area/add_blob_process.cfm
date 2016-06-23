

<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #rec_id#
</CFQUERY> 

<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<cfquery name="addFile" datasource="#request.dsn#">
	INSERT INTO upload_many (title_id, fileDate, filetime, fileupload)
			VALUES('#get.title_id#', '#a_insert_date#', '#a_insert_time#', '#new_file_name#') <!--- error was missing ' ' around #get.title_id# how did it get there? This comment can be deleted--->
</cfquery>  
