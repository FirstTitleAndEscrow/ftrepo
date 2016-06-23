
<cfset temp_url = "#cgi.query_string#">

<cfset file_to_find = ListLast(URLDecode(temp_url), "/")>
<cfset file_to_find = URLDecode(file_to_find)>

<!--- <cfset new_url = #fileSys.FindFilePath('#file_to_find#', 'url')#>

<cfoutput><A HREF="#fileSys.FindFilePath('#file_to_find#', 'url')#" target="new">Click to View/Print Ancillary doc uploaded</a></cfoutput> --->

<cfheader name="Content-Disposition" value="inline; filename=Classes.pdf">

<cfcontent type="unknownf" file="#fileSys.FindFilePath('#file_to_find#', 'file')#" deleteFile="no">






