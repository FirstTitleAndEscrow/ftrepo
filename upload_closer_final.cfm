
			<CFFILE
				DESTINATION="c:\websites\Standard\www.firsttitleservices.com\admin_area\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">

<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update doc_closer_title set closer_upload = '#new_file_name#'
			WHERE title_id = #rec_ID#
			</cfquery>


			 <CFQUERY datasource="#request.dsn#" NAME="read_title">
			select * from title
			WHERE title_id = #rec_ID#
			</cfquery>

		<CFMAIL
TO="sazan.sheshi@verizon.net"
FROM="sdari@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="There is a file uploaded from closer for order #read_title.title_id#"
TIMEOUT="600"
	>

There is a file sent from closer for order #read_title.title_id#




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
<script type="text/javascript">



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