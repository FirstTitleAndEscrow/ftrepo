<cfparam name="updated" default="0">

	<CFQUERY datasource="#request.dsn#" NAME="get_file">
			SELECT abstractor_doc_upload3
			FROM Doc_Abstract_Title
			WHERE title_id = #url.rec_id#
		</CFQUERY>
		
<cftry>
<cffile action="delete" file="#fileSys.FindFilePath('#get_file.abstractor_doc_upload3#', 'file')#">
<cfcatch type="any">
</cfcatch>
</cftry>

				<CFQUERY name="updateinfo" datasource="#request.dsn#">
				UPDATE Doc_Abstract_Title
				
				SET 
				<cfif updated>
				abstractor_doc_upload7
				<cfelse>
				abstractor_doc_upload3 
				</cfif>
				= NULL
				WHERE title_id = #url.rec_id#
				</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">
		
			SELECT *
			FROM Doc_Abstract_Title
			WHERE title_ID = #rec_id#
		
		</CFQUERY>
		
		<cfif (#read_title_abstract.abstractor_doc_upload# EQ "") AND (#read_title_abstract.abstractor_doc_upload2# EQ "") AND (#read_title_abstract.abstractor_doc_upload3# EQ "")>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
		
			UPDATE Doc_Abstract_Title
			set
			a_Recieved_by = null,
			a_Date_Completed = null,
			a_Time_Completed = null
			WHERE title_ID = #rec_ID#
		
		</CFQUERY>
		</CFIF>
	
	
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
	<HTML>
	<HEAD>
<TITLE></TITLE>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TEXT="Black" LINK="Blue" VLINK="Blue" ALINK="Blue" BACKGROUND="./" TopMargin=0 LeftMargin=0 MarginHeight=0 MarginWidth=0>

	<CENTER>
	
	<font size=2 color=black face=verdana>
				File was deleted<p>
				<a href=javascript:window.close();>close</a>
				
				
				</BODY>
</HTML>