
<cfquery name="get_file" datasource="#request.dsn#">
select * from doc_abstract_title where title_id = #url.rec_id#
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="elelel" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=800 align=middle valign=top>

<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	<!--- <tr>
		<td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td>
	</tr>
 --->


	<tr>
		<td width=800 align=middle valign=top bgcolor=e1e1el>




	<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">


<CENTER>
<CENTER><br>
<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=800 align=center valign=top bgcolor=d3d3d3><br><br>
		<FONT FACE=ARIAL color = blue SIZE=2><b>If you would like to prepare a binder open the uploaded file below and click on the link underneath it afterwords.</b>
		<br>
<P><FONT FACE=ARIAL SIZE=2>
<cfoutput>
<A HREF="#fileSys.FindFilePath('#get_file.abstractor_doc_upload2#', 'url')#" target="new">Click to View/Print Abstractor upload</a><BR>
Adobe Acrobat Reader Required

<P>

<a href="vendor_admin_data_form.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#url.rec_id#">Binder Preparation Form</a><BR>
</FONT></cfoutput>
	<td></tr></table>


</td>
								</tr>

							</table>
						</TD>
					</TR>
				</table>



</body>
</html>
