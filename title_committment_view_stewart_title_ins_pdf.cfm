<CFQUERY datasource="#request.dsn#" NAME="read_Title">
    SELECT *
	FROM Title
	WHERE Title_ID = #rec_ID#
</CFQUERY>
<cfif read_title.pstate eq 'MI'>
<cfinclude template="title_committment_view_stewart_title_ins_MI_pdf.cfm">
<cfelse>
<cfinclude template="title_committment_view_stewart_title_ins_all_state_pdf.cfm">
</cfif>