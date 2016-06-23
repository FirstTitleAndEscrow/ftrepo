<CFPARAM NAME="a_trigger" DEFAULT="">
<CFPARAM NAME="url.processor_assigned" DEFAULT="0">
<CFQUERY name="get_file" datasource="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>	


<CFQUERY name="check_company" datasource="#request.dsn#">
SELECT streamline_client
FROM companies
WHERE id = #get_file.comp_id#
</CFQUERY>	




<cfif check_company.streamline_client eq 'True'>
<CFQUERY name="read_processors" datasource="#request.dsn#">
SELECT *
FROM first_admin
where streamline_employee = 1
and status = 1
order by lname, fname
</CFQUERY>	
<cfelse>
<CFQUERY name="read_processors" datasource="#request.dsn#">
SELECT *
FROM first_admin
where fnm_processor = 'True'
and status = 1
order by lname, fname
</CFQUERY>	
</cfif>


<CFQUERY name="check_file" datasource="#request.dsn#">
SELECT *
FROM title_closing_order_request
WHERE title_id = #URL.rec_id# and contract_busted_date <> '' and contract_busted_date IS NOT NULL
</CFQUERY>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=519 align=center valign=top bgcolor=d3d3d3>
		
			<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
			</td></tr></table>
			
	<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
	<tr>
		<td width=519 align=center valign=top bgcolor=e1e1e1>
<cfoutput><FORM ACTION="./assign_reo_processor.cfm?#cgi.QUERY_STRING#" METHOD=POST>
<input type="hidden" name="assign_title_id" value="#get_file.title_id#"></cfoutput>
Assigned REO Processor<br>
<br>
<SELECT NAME="reo_processor"			
			size="1" 
			style="font-size: 9; 
			font-family: verdana; 
			font-style: normal; 
			color: blue; 
			background-color: e1e1e1; 
			border-color: e1e1e1; 
			border-left-width: thin; 
			border-right-width: thin; 
			border-top-width: thin; 
			border-bottom-width: thin; 
			border-width: thin; 
			border-style: bar; 
			clear: none; 
			float: none;" 
			rows="5" 
			cols="45" 
			>
			<OPTION VALUE="0" selected>None Assigned</OPTION>
			<cfset previous_name = "">
			<CFOUTPUT QUERY="read_processors">
			<cfset current_name = fname & " " & lname>
			<cfif current_name neq previous_name>
			<OPTION VALUE="#ID#" <cfif get_file.reo_processor eq read_processors.ID>selected</cfif>>#fname# #lname#</OPTION>
			</cfif>
			<cfset previous_name = current_name>
			</CFOUTPUT>			
			</SELECT><br><br>

			<input type = "Submit" name="submit_reo" value="Assign Processor">
</form>
<br><br>
<!--- <cfif url.processor_assigned eq 1>
<font color="red">processor assigned</font><br>
</cfif>
 ---><br>

			</td>
		</tr>
	<tr>
		<td width=519 align=center valign=top bgcolor=d3d3d3>			
<P><FONT FACE=ARIAL SIZE=2>



<cfif check_file.recordcount>
	<cfoutput query="get_file">

	
<FORM ACTION="./upload_reo_sales_contract.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
<CFIF #reo_sales_contract# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload REO Sales Contract 
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get_file.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><NOBR><font size=2 color=blue face=arial>There is already an REO Sales Contract file <A HREF="#fileSys.FindFilePath('#get_file.reo_sales_contract#', 'url')#" target="new">#get_file.reo_sales_contract#</a> uploaded. <br>
To upload new REO Sales Contract file click to delete this one first. &nbsp;<br>
	<a href="./delete_reo_sales_contract.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with REO Sales Contract sent
	<cfelse>
	Send REO Sales Contract via email by entering information below:<br>
 
<input type="text" name = "email" size = "15"><br>
email address<br>
<textarea name="email_notes" cols="20" rows="4"></textarea><br>
Optional notes<br>
<input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>



<FORM ACTION="./upload_reo_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #reo_package# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload REO Package 
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get_file.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><NOBR><font size=2 color=blue face=arial>There is already an REO Package file <A HREF="#fileSys.FindFilePath('#get_file.reo_package#', 'url')#" target="new">#get_file.reo_package#</a> uploaded. <br>
To upload new REO Package file click to delete this one first. &nbsp;<br>
	<a href="./delete_reo_package.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with REO Package sent
	<cfelse>
	Send REO Package via email by entering information below:<br>
 
<input type="text" name = "email" size = "15"><br>
email address<br>
<textarea name="email_notes" cols="20" rows="4"></textarea><br>
Optional notes<br>
<input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>
	





<FORM ACTION="./upload_reo_draft_deed.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #reo_draft_deed# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload REO Draft Deed 
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get_file.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><NOBR><font size=2 color=blue face=arial>There is already an REO Draft Deed file <A HREF="#fileSys.FindFilePath('#get_file.reo_draft_deed#', 'url')#" target="new">#get_file.reo_draft_deed#</a> uploaded.<br>
To upload new REO Draft Deed file click to delete this one first. &nbsp;<br>
	<a href="./delete_reo_draft_deed.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with REO Draft Deed sent
	<cfelse>
	Send REO Draft Deed via email by entering information below:<br>
 
<input type="text" name = "email" size = "15"><br>
email address<br>
<textarea name="email_notes" cols="20" rows="4"></textarea><br>
Optional notes<br>
<input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>
	




<FORM ACTION="./upload_reo_signed_deed.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #reo_signed_deed# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload REO Signed Deed 
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get_file.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><NOBR><font size=2 color=blue face=arial>There is already an REO Signed Deed file <A HREF="#fileSys.FindFilePath('#get_file.reo_signed_deed#', 'url')#" target="new">#get_file.reo_signed_deed#</a> uploaded.<br>
To upload new REO Signed Deed file click to delete this one first. &nbsp;<br>
	<a href="./delete_reo_signed_deed.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with REO Signed Deed sent
	<cfelse>
	Send REO Signed Deed via email by entering information below:<br>
 
<input type="text" name = "email" size = "15"><br>
email address<br>
<textarea name="email_notes" cols="20" rows="4"></textarea><br>
Optional notes<br>
<input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>
	




<FORM ACTION="./upload_reo_hud_for_approval.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #reo_hud_for_approval# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload REO HUD for Approval 
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get_file.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><NOBR><font size=2 color=blue face=arial>There is already an REO HUD for Approval file <A HREF="#fileSys.FindFilePath('#get_file.reo_hud_for_approval#', 'url')#" target="new">#get_file.reo_hud_for_approval#</a> uploaded.<br>
To upload new REO HUD for Approval file click to delete this one first. &nbsp;<br>
	<a href="./delete_reo_hud_for_approval.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with REO HUD for Approval sent
	<cfelse>
	Send REO HUD for Approval via email by entering information below:<br>
 
<input type="text" name = "email" size = "15"><br>
email address<br>
<textarea name="email_notes" cols="20" rows="4"></textarea><br>
Optional notes<br>
<input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>
	
	
	
	
<FORM ACTION="./upload_hoa_condo_lien.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<CFIF #hoa_condo_lien# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload HOA/Condo Lien 
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get_file.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><NOBR><font size=2 color=blue face=arial>There is already an HOA/Condo Lien file <A HREF="#fileSys.FindFilePath('#get_file.hoa_condo_lien#', 'url')#" target="new">#get_file.hoa_condo_lien#</a> uploaded.<br>
To upload new HOA/Condo Lien file click to delete this one first. &nbsp;<br>
	<a href="./delete_hoa_condo_lien.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with HOA/Condo Lien sent
	<cfelse>
	Send HOA/Condo Lien via email by entering information below:<br>
 
<input type="text" name = "email" size = "15"><br>
email address<br>
<textarea name="email_notes" cols="20" rows="4"></textarea><br>
Optional notes<br>
<input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>
	
	
	
	
	<FORM ACTION="./upload_hoa_taxes.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<CFIF #hoa_taxes# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload Taxes 
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get_file.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><NOBR><font size=2 color=blue face=arial>There is already a Taxes file <A HREF="#fileSys.FindFilePath('#get_file.hoa_taxes#', 'url')#" target="new">#get_file.hoa_taxes#</a> uploaded.<br>
To upload new Taxes file click to delete this one first. &nbsp;<br>
	<a href="./delete_hoa_taxes.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Taxes Lien sent
	<cfelse>
	Send Taxes via email by entering information below:<br>
 
<input type="text" name = "email" size = "15"><br>
email address<br>
<textarea name="email_notes" cols="20" rows="4"></textarea><br>
Optional notes<br>
<input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>





<FORM ACTION="./upload_reo_final_hud.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #reo_final_hud# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload REO Final HUD 
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get_file.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><NOBR><font size=2 color=blue face=arial>There is already an REO Final HUD file <A HREF="#fileSys.FindFilePath('#get_file.reo_final_hud#', 'url')#" target="new">#get_file.reo_final_hud#</a> uploaded.<br>
To upload new REO Final HUD file click to delete this one first. &nbsp;<br>
	<a href="./delete_reo_final_hud.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with REO Final HUD sent
	<cfelse>
	Send REO Final Hud via email by entering information below:<br>
 
<input type="text" name = "email" size = "15"><br>
email address<br>
<textarea name="email_notes" cols="20" rows="4"></textarea><br>
Optional notes<br>
<input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>
	
	
	
	



<FORM ACTION="./upload_reo_signed_hud.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=left>
			
			<CFIF #reo_signed_hud# EQ "">
	<FONT SIZE=2 color = blue FACE=ARIAL>Click here to upload REO Signed HUD w/Wire Info
	&nbsp;&nbsp;<input type="hidden" name="title_id" value="#get_file.title_id#">
	<input type="submit" value="Upload File"></td>
	
		</tr>
		
		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><NOBR><font size=2 color=blue face=arial>There is already an REO Signed HUD w/Wire Info file <A HREF="#fileSys.FindFilePath('#get_file.reo_signed_hud#', 'url')#" target="new">#get_file.reo_signed_hud#</a> uploaded.<br>
To upload new REO Signed HUD w/Wire Info file click to delete this one first. &nbsp;<br>
	<a href="./delete_reo_signed_hud.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
	
	
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1><br><br><b>
	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with REO Signed HUD w/Wire Info sent
	<cfelse>
	Send REO Signed Hud w/Wire Info via email by entering information below:<br>
 
<input type="text" name = "email" size = "15"><br>
email address<br>
<textarea name="email_notes" cols="20" rows="4"></textarea><br>
Optional notes<br>
<input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</cfif></form>
	

	</cfoutput>
	
	
	
	
	
	
	<cfelse>
<tr><td width=519 colspan=2  align=center valign=top bgcolor="e1e1e1"><cfoutput>Before uploading REO data, please set the Contract Busted Date for this file, by clicking <a href="form_title_closing_order_requesta.cfm?uid=#session.ft_user_id#&al=1&rec_id=#URL.rec_id#">here</a>.</cfoutput></td></tr>
	</cfif>
</table>
	



			

</body>
</html>
