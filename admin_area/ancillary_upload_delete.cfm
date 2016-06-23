<CFPARAM NAME="code" DEFAULT="">
<!--- <CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM ancillary
WHERE anc_id = #URL.rec_id#
</CFQUERY>	


<cfquery name="get_file" datasource="#request.dsn#">
SELECT ancillary_upload
FROM  ancillary
WHERE anc_id = #get.anc_ID#
</CFQUERY> 
 --->
 
<cfquery name="get_file" datasource="#request.dsn#">
	SELECT *
	FROM  ancillary_detl
	WHERE anc_id = #URL.rec_id# and order_type='#URL.code#'
</CFQUERY> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>
		
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	<!--- <tr>
		<td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">
			
		</td>
	</tr>
 --->


	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>

	<CFINCLUDE TEMPLATE="./includes/title_top_nav_cr.cfm">

<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3><br>
<P><FONT FACE=ARIAL SIZE=2>
	<!--- <cfoutput query="get_file"> --->
<cfoutput>
<FORM ACTION="./upload_ancillary.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#&code=#URL.code#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>
			
			<!--- <CFIF #ancillary_upload# EQ ""> --->
	<CFIF #get_file.file_uploaded# eq "">		
	Click here to upload Ancillary file
	<input type="hidden" name="anc_id" value="#get_file.anc_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr>
<!--- <td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#ancillary_upload#). To upload a new file click to delete this one first. &nbsp;<br> --->
	<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#get_file.file_uploaded#). To upload a new file click to delete this one first. &nbsp;<br>
	<a href="./delete-uploaded-ancillary.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#&code=#URL.code#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
</CFIF>		  </FORM>
	
	</cfoutput> 
<P></FONT>


	<td></tr></table>
	



		</td>
	</tr><!--- ====================================================================== ---><!--- ====================================================================== ---><!--- ====================================================================== --->


	<tr>
		<!--- <td width=830 align=left valign=top bgcolor=e1e1el>
		<nobr><A href="javascript:window.close();"><IMG src="./images/button_close.gif" border=0></a></nobr>		



			</td>
		 --->
		
		</tr>

	
	
	</table>

			
			</td>
		</tr>

	</table></CENTER></CENTER>
	
</BODY>
</HTML>
	
