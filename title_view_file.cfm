<cfparam name="url.rec_id" default="0">
<cfquery name="get_file" datasource="#request.dsn#">
select * from title where title_id = #url.rec_id#
</cfquery>


<cfquery name="get_file" datasource="#request.dsn#">
select * from doc_abstract_title where title_id = #url.rec_id#
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER><br><br><br><br><br><br>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3><br><br>

<P><FONT FACE=ARIAL SIZE=2>
<cfif #Len(get_file.abstractor_doc_upload)# GT "0">
<cfoutput>
<A HREF="#fileSys.FindFilePath('#get_file.abstractor_doc_upload#', 'url')#" target="new">Click to View/Print Abstractor upload 1</a><BR>
Adobe Acrobat Reader Required
</cfoutput>
<CFELSE>
<b>NO FILE WAS UPLOADED FOR THIS ORDER</b>
</cfif>
<P></FONT>


	<td></tr></table>
<cfif #Len(get_file.abstractor_doc_upload2)# GT "0">
	<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3><br><br>

<P><FONT FACE=ARIAL SIZE=2>

<cfoutput>
<A HREF="#fileSys.FindFilePath('#get_file.abstractor_doc_upload2#', 'url')#" target="new">Click to View/Print Abstractor upload 2</a><BR>
Adobe Acrobat Reader Required
</cfoutput>
<P></FONT>


	<td></tr></table>

	</cfif>


<cfif #Len(get_file.abstractor_doc_upload4)# GT "0">
	<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3><br><br>

<P><FONT FACE=ARIAL SIZE=2>

<cfoutput>
<A HREF="#fileSys.FindFilePath('#get_file.abstractor_doc_upload4#', 'url')#" target="new">Click to View/Print Abstractor upload 4</a><BR>
Adobe Acrobat Reader Required
</cfoutput>
<P></FONT>


	<td></tr></table>

	</cfif>
<cfif #Len(get_file.abstractor_doc_upload5)# GT "0">
	<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3><br><br>

<P><FONT FACE=ARIAL SIZE=2>

<cfoutput>
<A HREF="#fileSys.FindFilePath('#get_file.abstractor_doc_upload5#', 'url')#" target="new">Click to View/Print Abstractor upload 5</a><BR>
Adobe Acrobat Reader Required
</cfoutput>
<P></FONT>


	<td></tr></table>

	</cfif>

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