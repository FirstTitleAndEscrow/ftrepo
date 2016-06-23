<cfparam name="url.id" default="0">

<CFQUERY datasource="#request.dsn#" NAME="read_entry">
			Select * from Client_Bulk_Rates_Natic
			where id = #url.id#
</CFQUERY>

<cfparam name="form.state" default="#read_entry.state#">
<cfparam name="url.comp_id" default="0">

<cfparam name="read_entry.state" default="">
<cfparam name="read_entry.tier_100000" default="0">
<cfparam name="read_entry.tier_175000" default="0">
<cfparam name="read_entry.tier_250000" default="0">
<cfparam name="read_entry.tier_500000" default="0">
<cfparam name="read_entry.tier_750000" default="0">
<cfparam name="read_entry.tier_1000000" default="0">
<cfparam name="read_entry.tier_1250000" default="0">
<cfparam name="read_entry.tier_1500000" default="0">
<cfparam name="form.commit" default="0">
<cfparam name="form.close_window" default="0">
<cfparam name="form.state" default="">
<cfparam name="form.tier_100000" default="0">
<cfparam name="form.tier_175000" default="0">
<cfparam name="form.tier_250000" default="0">
<cfparam name="form.tier_500000" default="0">
<cfparam name="form.tier_750000" default="0">
<cfparam name="form.tier_1000000" default="0">
<cfparam name="form.tier_1250000" default="0">
<cfparam name="form.tier_1500000" default="0">

<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
			SELECT *
			FROM first_title_states_all
			ORDER BY st_abbrev ASC
</CFQUERY>

<script language="JavaScript">
<!--
function refreshParent() {
window.opener.location.reload();
if (window.opener.progressWindow)

{
window.opener.progressWindow.close()
}
// window.close();
}
//-->
</script>


<cfif form.commit eq 1>

<CFQUERY datasource="#request.dsn#" NAME="insert_entry">
			Update Client_Bulk_Rates_Natic
			set state = '#form.state#',
			tier_100000 = '#form.tier_100000#',
			tier_175000 = '#form.tier_175000#',
			tier_250000 = '#form.tier_250000#',
			tier_500000 = '#form.tier_500000#',
			tier_750000 = '#form.tier_750000#',
			tier_1000000 = '#form.tier_1000000#',
			tier_1250000 = '#form.tier_1250000#',
			tier_1500000 = '#form.tier_1500000#'
			where id = #url.id#
</CFQUERY>

<script language="javascript">
refreshParent();
window.close();
</script>
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Untitled Page</title>
<meta name="generator" content="WYSIWYG Web Builder - https://www.wysiwygwebbuilder.com">
<style type="text/css">
body
{
   background-color: #FFFFFF;
   color: #000000;
}

TD {font-size:11px; font-family:Arial, Helvetica, sans-serif; color:#000000;}
</style>

<script language="javascript">
function submit_form() {
document.form.submit();
}
</script>

</head>


<CFFORM ACTION="#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#" NAME="form" METHOD="POST" >
<table border=1>
<tr>
<td align=left valign=top width="50">State</td>
<td align=center valign=top width="75">Tier1<br>
0-100k
</td>
<td align=center valign=top width="75">Tier2<br>
100,001-175k
</td>
<td align=center valign=top width="75">Tier3<br>
175,001-250k
</td>
<td align=center valign=top width="75">Tier4<br>
250,001-500k
</td>
<td align=center valign=top width="75">Tier5<br>
500,001-750k
</td>
<td align=center valign=top width="75">Tier6<br>
750,001-1M
</td>
<td align=center valign=top width="75">Tier7<br>
1,000,001-1.25M
</td>
<td align=center valign=top width="75">Tier8<br>
1,250,001-1.5M
</td>
</tr>

<tr>
<td align=left valign=top width="50">
<SELECT NAME="state"
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: e1e1e1;
					border-color: e1e1e1;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;"
					onchange="document.form.commit.value=0; submit_form();">
		<!--- <CFIF #ArrayLen(a_app_county_1)# EQ "0"> --->

					<cfoutput query="read_state_list">
					<OPTION VALUE="#read_state_list.st_abbrev#" <cfif form.state eq read_state_list.st_abbrev>selected</cfif>>#read_state_list.st_abbrev#</OPTION>
					</CFOUTPUT>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_100000" value=1 <cfif read_entry.tier_100000 eq 1>checked</cfif>>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_175000" value=1 <cfif read_entry.tier_175000 eq 1>checked</cfif>>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_250000" value=1 <cfif read_entry.tier_250000 eq 1>checked</cfif>>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_500000" value=1 <cfif read_entry.tier_500000 eq 1>checked</cfif>>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_750000" value=1 <cfif read_entry.tier_750000 eq 1>checked</cfif>>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_1000000" value=1 <cfif read_entry.tier_1000000 eq 1>checked</cfif>>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_1250000" value=1 <cfif read_entry.tier_1250000 eq 1>checked</cfif>>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_1500000" value=1 <cfif read_entry.tier_1500000 eq 1>checked</cfif>>
</td>
</tr>

<tr>
<td align=right valign=top colspan=8>
<input type="hidden" name="commit" value="0">
<input type="hidden" name="close_window" value="0"><input name="final_submit" type="button" value="Modify this entry" onclick="document.form.commit.value=1;submit_form();"><br>
<input name="done_submit" type="button" value="Done" onclick="document.form.close_window.value=1;submit_form();"></td>
</tr>
</table>
</cfform>
</body>
</html>