<cfparam name="url.rec_id" default="0">
<CFPARAM NAME="a_trigger" DEFAULT="">
<CFQUERY name="get" DATASOURCE="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>


<cfquery name="get_file" DATASOURCE="#request.dsn#">
SELECT *
FROM  doc_closer_title
WHERE title_id = #get.title_ID#
</CFQUERY>

<cfif get_file.recordcount EQ 0>
<cfquery name="int_file" DATASOURCE="#request.dsn#">
insert into  doc_closer_title(title_id)
values(#get.title_ID#)
</CFQUERY>

<cfquery name="get_file" DATASOURCE="#request.dsn#">
SELECT *
FROM  doc_closer_title
WHERE title_id = #get.title_ID#
</CFQUERY>

</cfif>

<cfquery name="get_uploaded_files" DATASOURCE="#request.dsn#">
SELECT *
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
	<cfoutput query="get_uploaded_files">


<FORM ACTION="./upload_title_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>

			<CFIF #get_uploaded_files.title_package_upload# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload the VRM Title Package
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a VRM Title Package file <A HREF="#fileSys.FindFilePath('#get_uploaded_files.title_package_upload#', 'url')#" target="new">#get_uploaded_files.title_package_upload#</a> uploaded. To upload a new VRM Title Package file click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_title_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>


	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with VRM Title Package sent
	<cfelse>
	Send VRM Title Package via email by entering an email address below:<br>

 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>



<br><br>






<FORM ACTION="./upload_vrm_deed.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>

			<CFIF #get_uploaded_files.vrm_deed_upload# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload the VRM Deed
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a VRM Deed file <A HREF="#fileSys.FindFilePath('#get_uploaded_files.vrm_deed_upload#', 'url')#" target="new">#get_uploaded_files.vrm_deed_upload#</a> uploaded. To upload a new VRM Deed file click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_vrm_deed.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>


	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with VRM Deed sent
	<cfelse>
	Send VRM Deed via email by entering an email address below:<br>

 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>



<br><br>




<FORM ACTION="./upload_btc_closing_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>

			<CFIF #get_uploaded_files.btc_closing_package_upload# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload the BTC Closing Package
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a BTC Closing Package file <A HREF="#fileSys.FindFilePath('#get_uploaded_files.btc_closing_package_upload#', 'url')#" target="new">#get_uploaded_files.btc_closing_package_upload#</a> uploaded. To upload a new BTC Closing Package file click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_btc_closing_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>


	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with BTC Closing Package sent
	<cfelse>
	Send BTC Closing Package via email by entering an email address below:<br>

 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>



<br><br>
</cfoutput>

<cfoutput query="get_file">
<FORM ACTION="./upload_closing_inst.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>

			<CFIF #closing_instructions# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload Closing Instructions
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a Closing Instructions file <A HREF="#fileSys.FindFilePath('#get_file.closing_instructions#', 'url')#" target="new">#get_file.closing_instructions#</a> uploaded. To upload new Closing Instructions file click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_closing_inst.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>


	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Closing Instructions sent
	<cfelse>
	Send Closing Instructions via email by entering an email address below:<br>

 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>



<br><br>

	<FORM ACTION="./upload_pre_HUD.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>

			<CFIF #pre_hud# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload Pre HUD
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a Pre HUD file <A HREF="#fileSys.FindFilePath('#get_file.pre_HUD#', 'url')#" target="new">#get_file.pre_HUD#</a> uploaded. To upload new Pre HUD file click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_pre_HUD.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>

	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	

</cfif>	</form>


	<br><br>

	<FORM ACTION="./upload_final_HUD.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>

			<CFIF #final_hud# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload Final HUD
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a Final HUD file <A HREF="#fileSys.FindFilePath('#get_file.final_HUD#', 'url')#" target="new">#get_file.final_HUD#</a> uploaded. To upload new Final HUD file click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_final_HUD.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>

	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 21>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Final HUD sent
	<cfelse>
	Send Final HUD via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>

</cfif>	</form>


	<br><br>

	<FORM ACTION="./upload_waiver.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>

			<CFIF #waiver# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload Waiver
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a waiver <A HREF="#fileSys.FindFilePath('#get_file.waiver#', 'url')#" target="new">#get_file.waiver#</a> uploaded. To upload new Waiver click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_waiver.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>
</cfif>	</form>
<br>
<br>
<FORM ACTION="./upload_closing_modifications.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>

<CFIF #closing_mods# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload the Closing Modifications
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a Closing Modifications <A HREF="#fileSys.FindFilePath('#get_file.closing_mods#', 'url')#" target="new">#get_file.closing_mods#</a> uploaded. To upload new Closing Modifications click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_closing_mods.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>	  
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 21>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Closing Modifications sent
	<cfelse>
	Send Closing Modifications via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	
</cfif>

			</form>
<br>
<br>
	<FORM ACTION="./upload_unsigned_closing_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #unsigned_closing_package# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload the Unsigned Closing Package
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an Unsigned Closing Package <A HREF="#fileSys.FindFilePath('#get_file.unsigned_closing_package#', 'url')#" target="new">#get_file.unsigned_closing_package#</a> uploaded. To upload new Unsigned Closing Package click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_unsigned_closing_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>	  
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 21>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Unsigned Closing Package sent
	<cfelse>
	Send Unsigned Closing Package via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	
</cfif>	</form>
<!---
<br>
<br>
	<FORM ACTION="./upload_disbursement_sheet.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #disbursement_sheet# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload the Disbursement Sheet
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a Disbursement Sheet <A HREF="https://#cgi.server_name#/admin_area/uploads/#get_file.disbursement_sheet#" target="new">#get_file.disbursement_sheet#</a> uploaded. To upload new Disbursement Sheet click to delete this one first. &nbsp;<br>
	<a href="./delete_disbursement_sheet.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 21>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Disbursement Sheet sent
	<cfelse>
	Send Disbursement Sheet via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	
</cfif>	</form>
--->
<br>
<br>
	<FORM ACTION="./upload_subordination_mortgage_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #sub_agreement# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload the Subordination Mortgage Info
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already Subordination Mortgage Info <A HREF="#fileSys.FindFilePath('#get_file.sub_agreement#', 'url')#" target="new">#get_file.sub_agreement#</a> uploaded. To upload new Subordination Mortgage Info click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_subordination_mortgage_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>	  
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 21>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Subordination Mortgage Info sent
	<cfelse>
	Send Subordination Mortgage Info via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	
</cfif>	</form><br>
<br>
	<FORM ACTION="./upload_critical_documents.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #critical_documents# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload the Critical Documents
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There are already Critical Documents <A HREF="#fileSys.FindFilePath('#get_file.critical_documents#', 'url')#" target="new">#get_file.critical_documents#</a> uploaded. To upload new Critical Documents click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_critical_documents.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>	  
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><br><br><b>
	<cfif #a_trigger# eq 21>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Critical Documents sent
	<cfelse>
	Send Critical Documents via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	
</cfif>	</form>
<cfif get.comp_id EQ 9711>
<br>
	<FORM ACTION="./upload_deed_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #deed_package# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload the Deed Package
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a deed package <A HREF="#fileSys.FindFilePath('#get_file.deed_package#', 'url')#" target="new">#get_file.deed_package#</a> uploaded. To upload new Deed Package click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_deed_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>	  
	
	<tr><td width=519 colspan=2   valign=top bgcolor=f3f3f3><br><br><b>
	
	Send Deed Package via email by entering an email address and subject below:<br>
 Email Address: <input type="text" name = "email" size = "20"> <br>
Subject: <input type="text" name = "subject" size = "20"> <br>

 <input type="submit" value="Send Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>

	
</cfif>	</form>

<br>
	<FORM ACTION="./upload_seller_executed_deed_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #seller_executed_deed_package# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload the Seller Executed Deed Package
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already a seller executed deed package <A HREF="#fileSys.FindFilePath('#get_file.seller_executed_deed_package#', 'url')#" target="new">#get_file.seller_executed_deed_package#</a> uploaded. To upload new Seller Executed Deed Package click to delete this one first. &nbsp;<br>
	<a  onClick="javascript: if (confirm('Sure you want to delete this file?')) { window.open('./delete_seller_executed_deed_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1'); }"><u>delete</u></a></TD></tr></NOBR>	  
	

	
</cfif>	</form>
</cfif>
	</cfoutput>
</table>






</body>
</html>
