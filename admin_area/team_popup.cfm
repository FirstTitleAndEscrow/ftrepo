<!-- check if this person is assigned to a team --->
<CFQUERY datasource="#request.dsn#" NAME="get_parent_id">
	SELECT parent_user_id from First_Admin where ID = #session.ft_user_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_members">
	SELECT members, ID 
	FROM Teams
</CFQUERY>
<cfset all_team_ids = "">
<cfloop query="read_members">
<cfif ListFindNoCase(members, session.ft_user_id, ",") or  ListFindNoCase(members, get_parent_id.parent_user_id, ",")>
<cfset all_team_ids = ListAppend(all_team_ids, id, ",")>
</cfif>
</cfloop>

<cfset session.all_team_ids = all_team_ids>

<cfif ListLen(session.all_team_ids, ",")>




<script language="javascript">
window.open('reports_team_stats.cfm','window_name',
    'height=600,width=1000,status=yes,toolbar=no,menubar=no,location=no, scrollbars=yes');
</script>


<!---
<script language="javascript">
window.open('team_popup_data.cfm','window_name',
    'height=300,width=800,status=yes,toolbar=no,menubar=no,location=no, scrollbars=yes');
</script>
--->

</cfif>

<!-- end check if this person is assigned to a team --->