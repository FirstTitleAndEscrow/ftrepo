
<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>	


<cfquery name="get_file" datasource="#request.dsn#">
SELECT icl_upload
FROM  title
WHERE title_id = #get.title_ID#
</CFQUERY> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER><br><br><br><br><br><br><br><br><br><br><br><br>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3><br><br>
		
<P><FONT FACE=ARIAL SIZE=2>
	<cfoutput query="get_file">

<FORM ACTION="./upload_icl.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>
			
			<CFIF #ICL_upload# EQ "">
	Click here to upload ICL 
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#icl_upload#). To upload a new file click to delete this one first. &nbsp;<br>
	<a href="./delete-uploaded-ICL.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
</CFIF>		  </FORM>
	
	</cfoutput> 
<P></FONT>


	<td></tr></table>
	



			

</body>
</html>
