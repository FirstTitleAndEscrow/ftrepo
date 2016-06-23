<cfparam name="a_trigger" default="0">
<cfif #a_trigger# eq 4>
<cfquery name="view" datasource="#request.dsn#">
select * FROM upload_many_pr
where pr_id = #url.rec_id# AND ID = #URL.ID#
</cfquery>
<cfquery name="view" datasource="#request.dsn#">
DELETE FROM upload_many_pr
where pr_id = #url.rec_id# AND ID = #URL.ID#
</cfquery>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>File Listing</title>
<link rel=stylesheet href="./css/defaults.css">
</head>
<body>
<div align="center">
<table align="center">
<tr>
<td  class="mainheader">File Listing</td>
</tr>
</table>
<br><br>

<cfquery name="view" datasource="#request.dsn#">
SELECT * FROM upload_many_pr 
where pr_id = #url.rec_id#
ORDER BY ID 
</cfquery>
<cfif view.recordcount eq 0>
<table>
<tr>
<td align="center">
<br><br>
<font class="pageheader"><b>No files found.</b></font>
</td>
</tr>
</table>
<cfelse>
      <table border="1" cellpadding="0" cellspacing="0">
        <tr> 
<th>File Number<br><br></th>
<th>File Name<br><br></th>
<th>File Date<br><br></th>
<th>&nbsp;</th>
</tr>
<cfset i = 0>
<cfoutput query="view">
<cfset i = i + 1>
<form method="POST" action="./blob_list_pr.cfm?rec_id=#rec_id#&ID=#ID#&a_trigger=4" enctype="multipart/form-data">		
<tr>
<td>#i#.</td>

<td><A HREF="#fileSys.FindFilePath('#view.fileupload#', 'url')#" target="new">#view.fileupload#</a></td>
<td>&nbsp;&nbsp;#FileDate#&nbsp;&nbsp;</td>
<td>	
<input type=image src="./images/button_delete.gif" border=0>

</td>
</tr></form>
</cfoutput>
</table>
</cfif>
<br><br>
<table>
<tr>
<td><cfoutput>
<a href="./add_blob_pr.cfm?rec_id=#rec_id#">[Add a new file]</a>&nbsp;&nbsp;
</td>
<td>


&nbsp;&nbsp;<a href="./blob_list_pr.cfm?rec_id=#rec_id#">[View existing files]</a>
</td></cfoutput>
</tr>
</table>
</div>
</body>
</html>
<cfelse>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>File Listing</title>
<link rel=stylesheet href="./css/defaults.css">
</head>
<body>
<div align="center">
<table align="center">
<tr>
<td  class="mainheader">File Listing</td>
</tr>
</table>
<br><br>

<cfquery name="view" datasource="#request.dsn#">
SELECT * FROM upload_many_pr 
where pr_id = #url.rec_id#
ORDER BY ID 
</cfquery>
<cfif view.recordcount eq 0>
<table>
<tr>
<td align="center">
<br><br>
<font class="pageheader"><b>No files found.</b></font>
</td>
</tr>
</table>
<cfelse>
<table border="1" cellspacing="0" cellpadding="0">
<tr> 
<th>File Number<br><br></th>
<th>File Name<br><br></th>
<th>File Date<br><br></th>
<th>&nbsp;</th>
</tr>
<cfset i = 0>
<cfoutput query="view">
<cfset i = i + 1>
<form method="POST" action="./blob_list_pr.cfm?rec_id=#rec_id#&ID=#ID#&a_trigger=4" enctype="multipart/form-data">		
<tr>
<td>#i#.</td>

<td><A HREF="#fileSys.FindFilePath('#view.fileupload#', 'url')#" target="new">#view.fileupload#</a></td>
<td>&nbsp;&nbsp;#FileDate#&nbsp;&nbsp;</td>
<td>	
<input type=image src="./images/button_delete.gif" border=0>

</td>
</tr></form>
</cfoutput>
</table>
</cfif>
<br><br>
<table>
<tr>
<td><cfoutput>
<a href="./add_blob_pr.cfm?rec_id=#rec_id#">[Add a new file]</a>&nbsp;&nbsp;
</td>
<td>


&nbsp;&nbsp;<a href="./blob_list_pr.cfm?rec_id=#rec_id#">[View existing files]</a>
</td></cfoutput>
</tr>
</table>
</div>
</body>
</html>
</cfif>