
<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #form.rec_id#
</CFQUERY>



<cfquery name="get_file1" datasource="#request.dsn#">
SELECT abstractor_icl_upload
FROM  doc_abstract_title
WHERE title_id = #get.title_ID#
</CFQUERY>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3>

<P><FONT FACE=ARIAL SIZE=2>



	<cfoutput query="get_file1">

<FORM ACTION="./upload_icl.cfm?rec_id=#rec_id#&company_id=#read_title.comp_id#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>
			ICL<br>


	Click here to upload
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFIF #abstractor_icl_upload# NEQ "">
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#abstractor_icl_upload#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file1.abstractor_icl_upload#', 'url')#" target="_blank"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font></TD></tr></NOBR>

</CFIF>		  </FORM>

	</cfoutput>





<P></FONT>


	<td></tr></table>






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
</html>
