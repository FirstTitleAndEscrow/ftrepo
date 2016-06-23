  

			<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update doc_abstract_title set abstractor_doc_upload2 = '#new_file_name#'
			WHERE title_id = #rec_ID#
			</cfquery> 


			 <CFQUERY datasource="#request.dsn#" NAME="read_title">
			select * from title 
			WHERE title_id = #rec_ID#
			</cfquery> 
			

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">




<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>
<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER><br><br><br><br><br><br><br><br><br>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
		
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<img src="images/clear.gif" width=455 height=10 alt="" border="0">
		</td>
		</tr>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=3 align=center color=blue face=arial>
		<B>1st Title & Escrow, Inc. - File Upload Complete</B>
		<p>
		</td>
		</tr>
		
		
		</tr>
		</table>
		
	      

    </td>
  </tr>
</table>
  </td>
  </tr>
</table>
</center>
<CFQUERY datasource="#request.dsn#" NAME="get_team_email">
			SELECT c.ID, t.title_id, teams.ID, teams.email
			FROM Companies c, Title t, Teams teams
			WHERE t.title_ID = #rec_ID#
			and c.ID = t.comp_id
			and teams.ID = c.team_id
		</CFQUERY>
<!--- taken out due to complaints about too many emails, mainly from Heidi 3/16/10 --->

<!--- <cfmail subject="File Uploaded by client for order #rec_ID#" to="#get_team_email.email#" from="webmaster@firsttitleservices.com" bcc="rjermain@firsttitleservices.com">
A file has been uploaded by the client for order #Rec_ID#.

the filename is: #FILE.ServerFile#

Uploaded #DateFormat(now(), "mm-dd-yyyy")# - #TimeFormat(now(), "long")#






</cfmail>
 ---></BODY>
</HTML>