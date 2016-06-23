<cftransaction>
<cfset new_rev = ReplaceNoCase(ReplaceNoCase(form.revenue_amount, '$', '', 'ALL'), ',', '', 'ALL')>

<cfif new_rev gte 1>
<cfoutput><CFQUERY datasource="#request.dsn#" NAME="total_closed">
	    update title
		set revenue = #new_rev#
	    WHERE (title_id = #form.file_id#)
</CFQUERY>
</cfoutput>
<cfelse>
<cfoutput><CFQUERY datasource="#request.dsn#" NAME="total_closed">
	    update title
		set revenue = NULL
	    WHERE (title_id = #form.file_id#)
</CFQUERY>
</cfoutput>
</cfif>

</cftransaction>



<script language="javascript">
window.close();
</script>