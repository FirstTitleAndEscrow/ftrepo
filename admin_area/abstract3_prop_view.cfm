
<cfquery name="get_file" datasource="#request.dsn#">
select abstract_upload3 from doc_abstract_prop where prop_id = #url.rec_id#
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
<cfif #get_file.recordcount# GT "0">
<cfoutput>
<A HREF="#fileSys.FindFilePath('#get_file.abstract_upload3#', 'url')#" target="new">Click to View/PrintAbstractor upload-3</a><BR>
Adobe Acrobat Reader Required
</cfoutput>
<CFELSE>
<b>SORRY NO FILE WAS UPLOADED FOR THIS ORDER</b>
</cfif>
<P></FONT>


	<td></tr></table>
	



			

</body>
</html>
