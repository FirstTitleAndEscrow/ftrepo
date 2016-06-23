
<cfquery name="get_file" datasource="#request.dsn#">
select * from title where title_id = #url.rec_id#
</cfquery>

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
		
			<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
			</td></tr></table>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3><br><br>
		
<P><FONT FACE=ARIAL SIZE=2>
<cfoutput>
<A HREF="#fileSys.FindFilePath('#get_file.icl_upload2#', 'url')#" target="new">Click to View/Print Payoff upload</a><BR>
Adobe Acrobat Reader Required
</cfoutput>
<P></FONT>


	<td></tr></table>
	



			

</body>
</html>
