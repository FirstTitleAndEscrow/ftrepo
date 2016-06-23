<cfinclude template = "./file_paths.cfm">
<cfif not isdefined("url.id") or not isdefined("url.name")>
<cflocation url = "./blob_list.cfm">
</cfif>
<cfset fileId = #url.id#>
<cfset fileName = #url.name#>
<cfif len(fileId) eq 0 or len(fileName) eq 0>
<cflocation url = "./blob_list.cfm">
</cfif>
<cfif not isnumeric(fileId)>
<cflocation url = "./blob_list.cfm">
</cfif>
<cfset dirPath = #fileDisplayPath#>
<cfset noOfFiles = 0>
<cfdirectory  action="list" directory=#dirPath# name="dirListing">
<cfoutput query="dirListing">
<cfset noOfFiles = noOfFiles + 1>
</cfoutput>
<cfif noOfFiles lt 2>
<cfdirectory action="create" directory=#dirPath#>
</cfif>
<cfset tempFileName = dirPath & fileName>
<cfif not FileExists(tempFileName)>
 <cfobject type="Java" name="blobObj" class="./java/ReadBlob" action="Create">
<cfset retVal = blobObj.extractBlob(fileId, fileName, dirPath)>
 = "#fileDisplayPath##fileName#">


</cfif>
	<!---<cfquery name="get_file" datasource="#request.dsn#">
select * from upload_many WHERE FileID = #fileId# AND FileName = '#fileName#'
</cfquery>

<cfoutput>
#get_file.filedata#
</cfoutput>
 <cflocation url = "https://#cgi.server_name#/admin_area/uploaded_files/#get_file.filename#"> --->



<!--- Then we need to encode it as base64, because binary doesn’t work in database queries with ColdFusion: --->
<!--- <cfset MyCLOB = toBase64(MyVariable)>

L<!--- astly, the query needs to contain the encoded file as a parameter as if you quote the variable directly and it is over 2000 characters, Oracle will complain. --->
<cfqueryparam value="# MyCLOB#" CFSQLType="CF_SQL_LONGVARCHAR">

<!--- The query itself will look something like this: --->
<cfquery name="QInsertDoc" datasource=”MyDatasource” username=”MyUsername” password=”MyPassword”>
INSERT INTO MYSCHEMA.MYTABLE(DESCRIPTION, FILECONTENT)
VALUES(#MyDescription#,<cfqueryparam value="# MyCLOB#" CFSQLType="CF_SQL_LONGVARCHAR">)
</cfquery> --->

