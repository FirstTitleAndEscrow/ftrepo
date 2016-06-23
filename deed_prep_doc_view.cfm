
<!--- <CFQUERY datasource="#request.dsn#" NAME="read_user">

			SELECT *
			FROM users
			WHERE id = #URL.uid#


		</CFQUERY> --->

<CFQUERY datasource="#request.dsn#" NAME="get_id">
SELECT *
FROM title
WHERE title_id = #URL.title_id#
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

		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<img src="images/clear.gif" width=455 height=10 alt="" border="0">
		</td>
		</tr>
		<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Deed Preparation File Upload</B></CENTER>
			</TD>
		</TR>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=3 align=center color=blue face=arial>
		<B>File Upload for Order #<CFOUTPUT query="get_id">#title_id#</CFOUTPUT></B>
		<p>

		</td>
		</td>
		<tr>

		<td width=455 align=center valign=top>
		<CFOUTPUT query="get_id">
<!--- <FORM action="./upload1_abstract_final.cfm?rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#"  ENCTYPE="multipart/form-data" method="post"> --->

&nbsp;&nbsp;<table border=1 cellpadding=3>
<tr>
<td align="left" valign="top" colspan=2>FILE INFORMATION</td>
</tr>
<tr>
<td align="left" valign="top">PURCHASER(s):</td>
<td align="left" valign="top"><cfif IsDefined("get_id.company1")>#get_id.company1# #get_id.taxid1#<BR></cfif>
#get_id.bfirstname1# #get_id.bminame1# #blastname1#<br>
#get_id.bfirstname2# #get_id.bminame2# #blastname2#<br>
#get_id.bfirstname3# #get_id.bminame3# #blastname3#<br>
#get_id.bfirstname4# #get_id.bminame4# #blastname4#</td>
</tr>
<tr>
<td align="left" valign="top">PURCHASE PRICE:<br>
(consideration amount)</td>
<td align="left" valign="top">#dollarFormat(get_id.purchase)# </td>
</tr>
<tr>
<td align="left" valign="top">TENANCY:</td>
<td align="left" valign="top">#get_id.manner_of_title# </td>
</tr>
<tr>
<td align="left" valign="top">MISCELLANEOUS INFO:</td>
<td align="left" valign="top">#get_id.deed_prep_misc# </td>
</tr>

<cfquery name="get_file" datasource="#request.dsn#">
	SELECT abstractor_doc_upload
	FROM  Doc_Abstract_Title
	WHERE title_id = #get_id.title_ID#
</CFQUERY>
<cfif get_file.abstractor_doc_upload neq '' and get_file.abstractor_doc_upload neq 'NULL'>
<tr>
<td colspan=2>An abstract has been uploaded and can be viewed here:<br>
#get_file.abstractor_doc_upload#&nbsp;&nbsp;&nbsp;<a href="#fileSys.FindFilePath('#get_file.abstractor_doc_upload#', 'url')#" target="new">view</a></td>
</tr>
</cfif>



<cfif get_id.deed_prep_upload neq '' and get_id.deed_prep_upload neq 'NULL'>
<tr>
<td colspan=2>Additional information contained in attached document(s)<br>
#get_id.deed_prep_upload#&nbsp;&nbsp;&nbsp;<a href="#fileSys.FindFilePath('#get_id.deed_prep_upload#', 'url')#" target="new">view</a></td>
</tr>
</cfif>
</table>

<FORM action="./deed_prep_upload_final.cfm?rec_id=#get_id.title_id#&a_trigger=2&company_id=#get_id.comp_id#"  ENCTYPE="multipart/form-data" method="post">

<input type="hidden" name="title_id" value="#get_id.title_id#">
<input type="hidden" name="uid" value="#url.uid#">

<input type="file" name="file_upload">
<input type="submit" value="Upload File">
</CFOUTPUT>
</FORM>
		</td>
		</tr>
	<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=2 align=center color=red face=arial>
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