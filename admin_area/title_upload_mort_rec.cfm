<CFPARAM NAME="a_trigger" DEFAULT="">
<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>	


<cfquery name="get_file" datasource="#request.dsn#">
SELECT *
FROM  eventlist
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
		<td width=490 align=center valign=top bgcolor=d3d3d3>			
<P><FONT FACE=ARIAL SIZE=2>
	<cfoutput query="get_file">

	
<FORM ACTION="./upload_mort_rec.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #mortrec# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload Mortgage Recording 
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a Mortgage Recording file <A HREF="#fileSys.FindFilePath('#get_file.mortrec#', 'url')#" target="new">#get_file.mortrec#</a> uploaded. To upload new Mortgage Recording file click to delete this one first. &nbsp;<br>
	<a href="./delete_mort_rec.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Mortgage Recording file sent
	<cfelse>
	Send Mortgage Recording via email by entering an email address below:<br>
 
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>
	<br><br>
	
	<FORM ACTION="./upload_title_policy.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #titlepol# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload Title Policy
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a Title Policy file <A HREF="#fileSys.FindFilePath('#get_file.titlepol#', 'url')#" target="new">#get_file.titlepol#</a> uploaded. To upload new Title Policy file click to delete this one first. &nbsp;<br>
	<a href="./delete_title_policy.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 21>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Title Policy sent
	<cfelse>
	Send Title Policy via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	
</cfif>	</form>
	</cfoutput>
</table>
	



			

</body>
</html>
