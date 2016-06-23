<CFQUERY datasource="#request.dsn#" NAME="read_Title">
    SELECT *
	FROM Title
	WHERE Title_ID = #rec_ID#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
    SELECT streamline_client
	FROM companies
	WHERE ID = #read_title.comp_id#
</CFQUERY>


<cfif read_title.pstate eq 'MD' and read_comp.streamline_client eq 'True'>
<cfinclude template="title_committment_view_stewart_title_ins_MD_ST.cfm">
<cfelseif read_title.pstate eq 'MI'>
<cfinclude template="title_committment_view_stewart_title_ins_MI.cfm">
<cfelseif read_title.pstate eq 'NY'>
<cfinclude template="title_committment_view_stewart_title_ins_NY.cfm">
<cfelseif read_title.pstate eq 'TX'>
<cfinclude template="title_committment_view_stewart_title_ins_TX.cfm">
<cfelse>
<cfinclude template="title_committment_view_stewart_title_ins_all_state.cfm">
</cfif>


