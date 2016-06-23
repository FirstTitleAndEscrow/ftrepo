	<CFQUERY datasource="#request.dsn#" NAME="get_file">
			SELECT payoff2_upload
			FROM Pay_Off_Lender_2_Title
			WHERE title_id = #url.rec_id#
		</CFQUERY>
		
<cftry>
<cffile action="delete" file="#fileSys.FindFilePath('#get_file.payoff2_upload#', 'file')#">
<cfcatch type="any">
</cfcatch>
</cftry>

				<CFQUERY name="updateinfo" datasource="#request.dsn#">
				UPDATE Pay_Off_Lender_2_Title
				SET payoff2_upload = NULL
				WHERE title_id = #url.rec_id#
				</CFQUERY>
	
	
	<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">		
			SELECT *
			FROM Pay_Off_Lender_2_Title
			WHERE Title_ID = #rec_ID#		
		</CFQUERY>
	<cfif #read_payoff_info_2.payoff2_upload# EQ "">
	
	<CFQUERY datasource="#request.dsn#">
		
			UPDATE Pay_Off_Lender_2_Title
			SET
			a_Recieved_by = '',
			a_recieved_Date = '',
			a_recieved_Time = ''
			WHERE title_ID = #rec_ID#
		
		</CFQUERY>
	</cfif>
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