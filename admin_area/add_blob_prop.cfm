
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Blob - Choose File</title>
<link rel=stylesheet href="./css/defaults.css">
	
</head>
<body>
<div align="center">
<cfparam name="a_trigger" default="0">
<cfif #a_trigger# eq 2>
<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM property
WHERE prop_id = #rec_id#
</CFQUERY> 
<!---<CFOUTPUT>
TitleID:#get.title_id# <br>
Rec_id:#rec_id#<br>

</CFOUTPUT>
<CFABORT>
--->

<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="OVERWRITE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<!--- <cfquery name="check" datasource="#request.dsn#">
SELECT * FROM upload_many 
where title_id = #url.rec_id# AND fileupload = '#FILE.ServerFile#'
</cfquery> 
<cfif #check.recordcount# EQ 0>--->

<cfquery name="addFile" datasource="#request.dsn#">
	INSERT INTO upload_many_prop (prop_id, fileDate, filetime, fileupload)
			VALUES('#get.prop_id#', '#a_insert_date#', '#a_insert_time#', '#new_file_name#')
</cfquery>
<!--- <CFELSE>
<cfset #a_trigger# eq 3>
<table><tr>
<td align="center"> <font class="mainheader"><b>The file for this record is already uploaded in the system. If you still want to upload try to change the file name. </b></font> 
          <br>
          <br>
</td></tr>
</table>
</cfif> --->

</cfif>

<cfoutput>
<form method="POST" action="./add_blob_prop.cfm?rec_id=#url.rec_id#&a_trigger=2" enctype="multipart/form-data">	

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
</td>
</tr>	
<tr>
<td align="center" colspan="2"><input type="submit" name="btnAdd" value="Add" class="form_button"></td>
</tr>
<cfif #a_trigger# eq 2>
<tr>
<td align="center" colspan="2">
Thank you, file uploaded successfully</td>
</tr>
</cfif>				
</table>
</form>	
<br><br>
<table>
<tr>
<td><cfoutput>
<a href="./add_blob_prop.cfm?rec_id=#url.rec_id#">[Add a new file]</a>&nbsp;&nbsp;
</td>
<td>
&nbsp;&nbsp;<a href="./blob_list_prop.cfm?rec_id=#url.rec_id#">[View existing files]</a>
</td></cfoutput>
</tr>
</table>
</div>
</body>
</html>