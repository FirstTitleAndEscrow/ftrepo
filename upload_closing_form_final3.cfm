			<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update doc_closer_title set closing_form_upload3 = '#new_file_name#'
			WHERE title_id = #rec_ID#
			</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_id">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">


<cfif #email# neq "">
<CFQUERY datasource="#request.dsn#" NAME="get_file">
			select closing_form_upload3 from doc_closer_title
			WHERE title_id = #rec_ID#
</cfquery>
<CFMAIL
TO="#email#"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title Closing Package 3 file for order #rec_id#<cfif #get_id.loan_number# neq "">, Loan No. - #get_id.loan_number#</cfif>"
type="HTML"
TIMEOUT="600"
>

To view/print Closing package 2 for order #rec_id# click <A HREF="#fileSys.FindFilePath('#get_file.closing_form_upload2#', 'url')#" target="new">#get_file.closing_form_upload2#</a><br><br>
PLEASE NOTE - IT MAY TAKE SEVERAL MOMENTS FOR YOUR CLOSING PACKAGE TO APPEAR.<br>
SO, PLEASE BE PATIENT<br><br>
Thank you<br>
First Title staff<br><br>
</cfmail>
</cfif>
<!--- MIMEATTACH="c:\websites\Standard\www.firsttitleservices.com\admin_area\uploads\#get_file.closing_form_upload#" --->
<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>

<table width=455 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=455 align=center valign=top bgcolor=d3d3d3>

			<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
			</td></tr></table>

<table width=455 cellpadding=1 cellspacing=1 border=0>

		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<img src="images/clear.gif" width=455 height=10 alt="" border="0">
		</td>
		</tr>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=3 align=center color=blue face=arial>
		<B>1st Title & Escrow, Inc. - Closing Form File Upload Complete for order <cfoutput>#rec_id#</cfoutput><cfif #email# neq ""> and email sent with the file attached sent to <cfoutput>#email#</cfoutput></cfif></B>
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