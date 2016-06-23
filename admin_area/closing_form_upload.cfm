<CFPARAM NAME="a_trigger" DEFAULT="">
<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>	


<cfquery name="get_file" datasource="#request.dsn#">
SELECT closing_form_upload
FROM  doc_closer_title
WHERE title_id = #get.title_ID#
</CFQUERY> 
<cfquery name="get_file2" datasource="#request.dsn#">
SELECT closing_form_upload2
FROM  doc_closer_title
WHERE title_id = #get.title_ID#
</CFQUERY> 
<cfquery name="get_file3" datasource="#request.dsn#">
SELECT closing_form_upload3
FROM  doc_closer_title
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
		
			<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
			</td></tr></table>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3><br><br>
		
<P><FONT FACE=ARIAL SIZE=2>
	<cfoutput query="get_file">

<FORM ACTION="./upload_closing_form.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>
			
			<CFIF #closing_form_upload# EQ "">
	Click here to upload closing form 1
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file --<A HREF="#fileSys.FindFilePath('#closing_form_upload#', 'url')#" target="new">#closing_form_upload#</a>. To upload a new file click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_closing_form.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>	  
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 21>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Closing Form 1 sent
	<cfelse>
	Send Closing Package 1 via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
	</cfif>
</CFIF>		  </FORM>
	</cfoutput> 
	
		<cfoutput query="get_file2">

<FORM ACTION="./upload_closing_form2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>
			
			<CFIF #closing_form_upload2# EQ "">
	Click here to upload closing form 2 
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file --<A HREF="#fileSys.FindFilePath('#closing_form_upload2#', 'url')#" target="new">#closing_form_upload2#</a>. To upload a new file click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_closing_form2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>	  
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	
		<cfif #a_trigger# eq 21>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Closing Form 2 sent
	<cfelse>
	Send Closing Package 2 via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
	</cfif>
</CFIF>		  </FORM>
	</cfoutput> 
	
		<cfoutput query="get_file3">

<FORM ACTION="./upload_closing_form3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>
			
			<CFIF #closing_form_upload3# EQ "">
	Click here to upload closing form 3
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file --<A HREF="#fileSys.FindFilePath('#closing_form_upload3#', 'url')#" target="new">#closing_form_upload3#</a>. To upload a new file click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_closing_form3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>	  
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	
		<cfif #a_trigger# eq 21>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Closing Form 3 sent
	<cfelse>
	Send Closing Package 3 via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
	</cfif>
</CFIF>		  </FORM>
	</cfoutput> 
	
<P></FONT>


	<td></tr></table>
	



			

</body>
</html>
