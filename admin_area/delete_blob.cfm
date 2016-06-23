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
<cfif FileExists(tempFileName)>
<cffile action="delete" file=#tempFileName#>
</cfif>
<cfquery name="deleteBlob" datasource="#request.dsn#">
DELETE FROM Upload_many WHERE FileID = #fileId# AND FileName = '#fileName#'
</cfquery>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Blob - File Status</title>
<link rel=stylesheet href="./css/defaults.css">
</head>
<body>
<div align="center">
<table align="center">
<tr>
<td  class="mainheader">The file has been deleted from the database.</td>
</tr>
</table>
<br><br>
<table>
<tr>
<td>
<a href="./add_blob.cfm">[Add a new file]</a>&nbsp;&nbsp;
</td>
<td>
&nbsp;&nbsp;<a href="./blob_list.cfm">[View existing files]</a>
</td>
</tr>
</table>
</div>
</body>
</html>