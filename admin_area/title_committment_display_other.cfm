<cfquery name="get_file" datasource="#request.dsn#">
select * from doc_abstract_title where title_id = #url.rec_id#
</cfquery>


<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=elelel>
	<tr>
		<td width=790 align=center valign=top>
			<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">



<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<cfoutput>
<FORM action="./Title_committment_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#&a_trigger=7"  ENCTYPE="multipart/form-data" method="post">
</cfoutput>
<tr>
<td width="50%" align=center valign=top bgcolor=white>
<cfoutput>
<A HREF="#fileSys.FindFilePath('#get_file.abstractor_doc_upload3#', 'url')#" target="new">Click to View/Print Title Commitment upload</a><BR>
Adobe Acrobat Reader Required
</cfoutput>
</td>

<td width="50%" align=center valign=top bgcolor=yellow>
			<b><font face=verdana size=3 color=red>Click this button to complete </font></b><INPUT TYPE=IMAGE SRC="./images/button_mark_as_sent.gif" border=0>
</td>	</tr>

</form>
</table>

</td>
</tr>
</table>