<cfif not isdefined("url.MyVariable")>
<cflocation url = "./add_blob.cfm">
</cfif>
<cfset Myvariable = #url.Myvariable#>
<cfif len(MyVariablel) eq 0>
<cflocation url = "./add_blob.cfm">
</cfif>
<cfif not isnumeric(Myvariable)>
<cflocation url = "./add_blob.cfm">
</cfif>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Blob - File Upload Status</title>
<link rel=stylesheet href="css/defaults.css">
</head>
<body>
<div align="center">
<table>
<tr>
<td align="center">
<font class="mainheader"><b>
<cfif compare(MyVariable, "0") eq 0>
The file has been successfully uploaded and added to the database.
<cfelse>
An error has occurred, unable to upload and add the file to the database.<br>
Please try again.					
</cfif>
</b></font>
<br><br>
</td>
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