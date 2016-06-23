

			<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">


<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>


			<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update title set deed_prep_vendor_upload = '#new_file_name#',
			deed_prep_completed=#CreateODBCDateTime(Now())#
			WHERE title_id = #form.title_ID#
			</cfquery>

			<CFQUERY datasource="#request.dsn#" NAME="read_title">
			select * from title
			WHERE title_id = #form.title_ID#
			</cfquery>

		<CFMAIL
TO="ssacks@firsttitleservices.com"
BCC="rjermain@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="There is a Deed Preparation file uploaded for order #read_title.title_id#"
TIMEOUT="600"
	>
<cfmailparam file="#fileSys.FindFilePath('#read_title.deed_prep_vendor_upload#', 'file')#">

There is a Deed Preparation file uploaded for order #read_title.title_id#

The file is attached: #read_title.deed_prep_vendor_upload#




</CFMAIL>
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
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<img src="images/clear.gif" width=455 height=10 alt="" border="0">
		</td>
		</tr>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=3 align=center color=blue face=arial>
		<B>File Upload Complete</B><br>
<br>
<cfoutput><a href="deed_prep_vendor_view.cfm?a_trigger=3&abstractor_id=#form.uid#">Return to Menu</a></cfoutput>
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
			WHERE t.title_ID = #form.title_ID#
			and c.ID = t.comp_id
			and teams.ID = c.team_id
		</CFQUERY>
<!--- <cfmail subject="Deed Prep File Uploaded by client for order #rec_ID#" to="#get_team_email.email#" from="webmaster@firsttitleservices.com" bcc="rjermain@firsttitleservices.com">
A Deed Preparation file has been uploaded by the client for order #form.title_ID#.

the filename is: #FILE.ServerFile#

Uploaded #DateFormat(now(), "mm-dd-yyyy")# - #TimeFormat(now(), "long")#

</cfmail>
 ---><script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</HTML>