<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="a_flag" DEFAULT="0">
<CFPARAM NAME="email" DEFAULT="">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">

			SELECT *
			FROM users
			WHERE id = #URL.uid#


		</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="get_id">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>


<CFQUERY name="get" DATASOURCE="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">






<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>

<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3>

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
		<B>1st Title & Escrow, Inc. - Unsigned Closing Package <CFOUTPUT query="get_id">#title_id#</CFOUTPUT></B>
		<p>



		</td>
		</td>
		<tr>

		<td width=455 align=center valign=top>
		<CFOUTPUT query="get_id">
<FORM action="./upload_unsigned_closing_package_FINAL.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#"  ENCTYPE="multipart/form-data" method="post">

<input type="hidden" name="title_id" value="#title_id#">
Insert Closing Package to upload <input type="file" size = 15 name="file_upload"><br>
<cfif Len(get_id.realec_transactionID)>
	Enter a comment for this file -- <input type="text" name = "comment" size = "15"><br>
</cfif>

<input type="submit" value="Upload File">
</CFOUTPUT>
</FORM>
		</td>
		</tr>
		</table>



    </td>
  </tr>
</table>
  </td>
  </tr>
</table>

</BODY>
</HTML>