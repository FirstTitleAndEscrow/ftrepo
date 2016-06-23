
<cfparam name="url.delete_confirm" default="yes">
<cfparam name="url.delete_id" default="NULL">
<cfparam name="url.uid" default="0">

<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM abstractors_web
			WHERE web_id = '#url.web_id#'
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_user">
			SELECT *
			FROM First_Admin
			WHERE ID = '#url.uid#'
		</CFQUERY>


<cfif url.delete_confirm eq 'yes'>
<cfset url.delete_id = read_report.delete_id>
<cfif url.delete_id NEQ read_report.delete_id>
You are not authorized to delete web links. Please <a href="mailto:webmaster@firsttitleservices.com">contact the system administrator.</a>
<cfelse>
<cfif read_report.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="DELETE_LINK">
			delete
			FROM abstractors_web
			WHERE web_id = #url.web_id#
		</CFQUERY>
<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td align=center valign=top bgcolor=f1f1f1>
			<b><font size=2 color=red face=verdana>
			The following Web Link has been deleted from the system<b>
		</td>
</tr>
</table>

<table width="100%" cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">State
						</td>
					<td bgcolor=gray width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">County
						</td>
						<td bgcolor=gray width="20%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Link Type
						</td>
					<td bgcolor=gray width="50%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Web links found
						</td>
					</tr>
			<CFoutput QUERY="read_report">
					<tr>

<td width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#st_abbrev#
						</td>
<td width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#ct_name#
						</td>
<td width="20%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#linktype#
						</td>
						<td width="50%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="#weblinks#" target="new"><FONT FACE=verdana SIZE=1 color="blue">#weblinks#</a>
						</td>
					</tr>
</cfoutput>
				</table>
<cfelse>
The web link no longer exists in the system.
</cfif>
</cfif>
<cfelse>

<!--- TO="sazan@firsttitleservices.com,spape@firsttitleservices.com,jslattery@firsttitleservices.com" --->

<cfset delete_id_code = RandRange(10000, 99999)>
<CFQUERY datasource="#request.dsn#" NAME="add_delete_code">
			UPDATE abstractors_web
			Set delete_id = #delete_id_code#
			WHERE web_id = '#url.web_id#'
		</CFQUERY>

<CFMAIL
TO="spape@firsttitleservices.com,rjermain@firsttitleservices.com"
FROM="#get_user.email#"
Subject="Weblink Deletion request"
TIMEOUT="600"
type="HTML"
>
<table width=100%>
	<tr>
		<td clospan = 2 align=center valign=top bgcolor=f1f1f1>
			<b><font size=2 color=GREEN face=verdana>
			WEB LINK DELETION REQUEST<b>
		</td>
</tr>
</table>

<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td align=center valign=top bgcolor=f1f1f1>
			<b><font size=2 color=red face=verdana>
			The following Web Link has been submitted for deletion by <cfoutput>#get_user.fname# #get_user.lname#</cfoutput><b>
		</td>
</tr>
</table>

<table width="100%" cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">State
						</td>
					<td bgcolor=gray width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">County
						</td>
						<td bgcolor=gray width="20%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Link Type
						</td>
					<td bgcolor=gray width="50%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Web links found
						</td>
					</tr>
			<CFloop QUERY="read_report">
					<tr>

<td width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#st_abbrev#
						</td>
<td width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#ct_name#
						</td>
<td width="20%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#linktype#
						</td>
						<td width="50%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="#weblinks#" target="new"><FONT FACE=verdana SIZE=1 color="blue">#weblinks#</a>
						</td>
					</tr>
</cfloop>
				</table>

<table width=100%>
<tr>
		<td  align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Click <NOBR><cfoutput><A HREF="https://#CGI.SERVER_NAME#/admin_area/weblinks_delete.cfm?delete_id=#delete_id_code#&web_ID=#web_ID#&delete_confirm=yes">HERE</a></cfoutput></NOBR>
to allow the deletion</B>
		</td>
	</tr>

</table>
</cfmail>


<cflocation url="weblinks_search.cfm?web_id=#web_id#&uid=#URL.uid#&al=#URL.al#&a_trigger=2&a_state=#a_state#&delete=1">

</cfif>