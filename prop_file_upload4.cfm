

<CFQUERY datasource="#request.dsn#" NAME="get_id">
SELECT prop_id
FROM Property
WHERE prop_id = #URL.rec_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_email">
SELECT verifyemail
FROM Property
WHERE prop_id = #get_id.prop_id#
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


<table width=455 cellpadding=1 cellspacing=1 border=0>
		
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<img src="images/clear.gif" width=455 height=10 alt="" border="0">
		</td>
		</tr>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=3 align=center color=blue face=arial>
		<B>1st Title & Escrow, Inc. - File Upload for Order #<CFOUTPUT query="get_id">#prop_id#</CFOUTPUT></B>
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
<FORM action="./prop_file_upload_final4.cfm?al=1&rec_id=#rec_id#&a_trigger=2&company_id=0"  ENCTYPE="multipart/form-data" method="post">

<input type="hidden" name="prop_id" value="#prop_id#">

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