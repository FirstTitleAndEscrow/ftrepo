<cfset objChase = CreateObject('component','cfc.chaseRealEC')>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Blob - Choose File</title>
<link rel=stylesheet href="./css/defaults.css">

</head>
<body>
<div align="center">
<cfparam name="a_trigger" default="0">

<CFQUERY name="get" DATASOURCE="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #rec_id#
</CFQUERY>
<cfif #a_trigger# eq 2>
<!---<CFOUTPUT>
TitleID:#get.title_id# <br>
Rec_id:#rec_id#<br>

</CFOUTPUT>
<CFABORT>
--->

<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
<CFFILE
				ACTION="upload"
				DESTINATION="c:\uploads\"
				FILEFIELD="file_upload"
				NAMECONFLICT="makeunique">

<!--- <cfquery name="check" datasource="#request.dsn#">
SELECT * FROM upload_many
where title_id = #url.rec_id# AND fileupload = '#FILE.ServerFile#'
</cfquery>
<cfif #check.recordcount# EQ 0>
<CFELSE>
<cfset #a_trigger# eq 3>
<table><tr>
<td align="center"> <font class="mainheader"><b>The file for this record is already uploaded in the system. If you still want to upload try to change the file name. </b></font>
          <br>
          <br>
</td></tr>
</table>
</cfif> --->


<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>
<cfquery name="addFile" datasource="#request.dsn#">
	INSERT INTO upload_many (title_id, fileDate, filetime, fileupload)
			VALUES('#get.title_id#', '#a_insert_date#', '#a_insert_time#', '#new_file_name#')
</cfquery>

<cfif Len(get.realec_transactionid) AND not isDefined("form.internalOnly")>
<cfset documentInfo = StructNew()>
<cfset documentInfo.document = "#new_file_name#">
<cfset documentInfo.documentversion = "1">
<cfset documentInfo.documentStatus = "DRAFT">
<cfset documentInfo.documentType = "MISC">
<cfset documentInfo.documentPath = "#ReplaceNoCase(fileSys.FindFilePath('#new_file_name#', 'file'), '#new_file_name#', '', 'ALL')#">
<cfset objChase.processEvent(eventCode=180, productCode=3, title_id=#get.title_id#,documentInfo=documentInfo, comment=form.comment)>
</cfif>

</cfif>

<cfoutput>
<form method="POST" action="./add_blob_realec.cfm?rec_id=#url.rec_id#&a_trigger=2" enctype="multipart/form-data">

</cfoutput>
<table>


        <td align="center"> <font class="mainheader"><b>Please choose file</b></font>
          <br>
          <br>
</td>
</tr>
</table>
<table>
<tr>
<td>
Please select the file you would <br>
like to upload and add to the <br>
database:
</td>
<td>

<input type="file" name="file_upload">
<cfif Len(get.realec_transactionID)>
	<br>Enter a comment for this file -- <input type="text" name = "comment" size = "15"><br>
</cfif>
</td>
</tr>
<cfif Len(get.realec_transactionid)>
<tr><td colspan="2"><input type="checkbox" name="internalOnly" value="1"> Do Not Send This File To RealEC</td></tr>
</cfif>
<tr>
<td align="center" colspan="2"><input type="submit" name="btnAdd" value="Add" class="form_button"></td>
</tr>
<cfif #a_trigger# eq 2>
<tr>
<td align="center" colspan="2">
Thank you, file uploaded successfully<br>
<br>
<cfif form.file_upload neq FILE.ServerFile>
<cfoutput><font color="red">There is already a file by that name uploaded on our server. To avoid overwriting existing files, tyur upload has been renamed to "#new_file_name#"</font></cfoutput><br>
<br>

</cfif> </td>
</tr>
</cfif>
</table>
</form>
<br><br>
<table>
<tr>
<td><cfoutput>
<a href="./add_blob_realec.cfm?rec_id=#url.rec_id#">[Add a new file]</a>&nbsp;&nbsp;
</td>
<td>
&nbsp;&nbsp;<a href="./blob_list_realec.cfm?rec_id=#url.rec_id#">[View existing files]</a>
</td></cfoutput>
</tr>
</table>
</div>
</body>
</html>