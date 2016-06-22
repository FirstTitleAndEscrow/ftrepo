<cfif isDefined("username") AND isDefined("password")>
	<cfquery datasource="#request.dsn#" name="chkUser">
		select t.title_id, c.id
		from title t
		inner join companies c on c.id = t.comp_id
		where c.a_user = '#username#'
		AND c.a_pass = '#password#'
		AND t.title_id = #filename#

	</cfquery>

	<cfif chkUser.recordcount>
	    <cfset session.comp_id = chkUser.id>
		<cfheader name="Content-Disposition" value="attachment; filename=HUD_#filename#.pdf">
		<cfcontent type="application/pdf"	file="C:\huds\HUD_#fileName#.pdf" deleteFile="no">
	<cfelse>
		<h3>Invalid login, please try again</h3>
	</cfif>


<cfabort>
</cfif>

<cfset PageTitle = REReplace(cgi.query_string,"404;https?://[^/]+","")>

<cfset filename = Replace(pageTitle,"/admin_area/saved_huds/HUD_","")>
<cfset filename = Replace(filename,".pdf","")>

<cfif isDefined("session.comp_id") AND session.comp_id NEQ 0>
	<cfquery datasource="#request.dsn#" name="chkUser">
		select t.title_id, c.id
		from title t
		inner join companies c on c.id = t.comp_id
		where t.comp_id = '#session.comp_id#'
		AND t.title_id = #filename#
	</cfquery>
</cfif>

<cfif isDefined("session.ft_user_id")>
	<cfheader name="Content-Disposition" value="attachment; filename=HUD_#filename#.pdf">
	<cfcontent type="application/pdf"	file="C:\huds\HUD_#fileName#.pdf" deleteFile="no">
<cfelseif isDefined("chkUser.recordcount") AND chkUser.recordcount>
	<cfheader name="Content-Disposition" value="attachment; filename=HUD_#filename#.pdf">
	<cfcontent type="application/pdf"	file="C:\huds\HUD_#fileName#.pdf" deleteFile="no">
<cfabort>




</cfif>

<h3>Please Login To View HUD</h3>
<form action="<cfoutput>#cgi.script_name#</cfoutput>" method="post">
<input type="hidden" name="filename" value="<cfoutput>#filename#</cfoutput>">
<input type="text" placeholder="Please Enter Username" name="username">
<input type="password" placeholder="Please Enter Password" name="password">
<input type="submit" value="Submit">
</form>
