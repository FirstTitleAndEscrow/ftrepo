
<!--- <CFQUERY datasource="#request.dsn#" NAME="read_user">

			SELECT *
			FROM users
			WHERE id = #URL.uid#


		</CFQUERY> --->

<CFQUERY datasource="#request.dsn#" NAME="get_id">
SELECT title_id
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_abstract">
		SELECT *
		FROM Doc_Abstract_Title
		WHERE title_ID = #rec_ID#
	</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">




<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER><br><br><br><br><br><br>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>

		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<img src="images/clear.gif" width=455 height=10 alt="" border="0">
		</td>
		</tr>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=3 align=center color=blue face=arial>
		<B>1st Title & Escrow, Inc. - File Upload for Order #<CFOUTPUT query="get_id">#title_id#</CFOUTPUT></B>
		<p>

		</td>
		</td>
		<tr>

		<td width=455 align=center valign=top>
		<CFOUTPUT query="get_id">
<FORM action="./upload_icl_final.cfm?rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#"  ENCTYPE="multipart/form-data" method="post">

<input type="hidden" name="title_id" value="#title_id#">

<input type="file" name="file_upload">
<input type="submit" value="Upload File">
</CFOUTPUT>
</FORM>
		</td>
		</tr>
	<cfif Len(read_abstract.abstractor_icl_upload)>	
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=2 align=center color=red face=arial>
		The file "<cfoutput><a href="#fileSys.FindFilePath('#read_abstract.abstractor_icl_upload#', 'url')#" target="_blank">#read_abstract.abstractor_icl_upload#</a></cfoutput>" has already been uploaded. Uploading a new file will remove the current file.
		<p>

		</td>
		</tr>

     </cfif>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=2 align=center color=black face=arial>
		Note: To upload a file click on "Browse" and choose the file you wish to upload. Then click on "Upload File" to complete the upload
		<p>

		</td>
		</tr>

		</table>



    </td>
  </tr>
</table>
  </td>
  </tr>
</table>

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