	<CFQUERY datasource="#request.dsn#" NAME="get_file">
			SELECT hoa_condo_lien
			FROM Title
			WHERE title_id = #url.rec_id#
		</CFQUERY>
		
<cftry>
<cffile action="delete" file="#fileSys.FindFilePath('#get_file.hoa_condo_lien#', 'file')#">
<cfcatch type="any">
</cfcatch>
</cftry>

				<CFQUERY name="updateinfo" datasource="#request.dsn#">
				UPDATE Title
				SET hoa_condo_lien = NULL,
				hoa_condo_lien_date = NULL
				WHERE title_id = #url.rec_id#
				</CFQUERY>
	
		
		
	
	
	
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