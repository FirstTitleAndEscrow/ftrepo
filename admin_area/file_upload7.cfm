<cfparam name="invoicenum" default="1">
<cfif isDefined("form.submit2")>
	<cfset invoicenum = 2>
</cfif>
<cfif isDefined("form.submit3")>
	<cfset invoicenum = 3>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			SELECT * 
			FROM users
			WHERE id = #URL.uid#
		
		
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_id">
SELECT title_id
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_email">
SELECT verifyemail
FROM title
WHERE title_id = #get_id.title_id#
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
		<B>1st Title & Escrow, Inc. - File Upload for Order #<CFOUTPUT query="get_id">#title_id#</CFOUTPUT></B>
		<p>
		<!--- <CFOUTPUT query="get_email">
		<CFIF #verifyemail# IS NOT "">
		<b>Send Report via email to: <A HREF="mailto:#verifyemail#">#verifyemail#</a></b><p>
		<CFELSE>
		<b>Customer has not requested file to be emailed.</b><p>
		</CFIF>
		</CFOUTPUT>
		</td> --->
		</td>
		<tr>
		
		<td width=455 align=center valign=top>
		<CFOUTPUT query="get_id">
<FORM action="./file_upload_final7.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#"  ENCTYPE="multipart/form-data" method="post">

<input type="hidden" name="title_id" value="#title_id#">
<input type="hidden" name="invoicenum" value="#invoicenum#">
<input type="file" name="file_upload">
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