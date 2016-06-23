<cfparam name="url.comp_id" default="0">
<cfparam name="form.state" default="">
<cfparam name="form.tier_100000" default="0">
<cfparam name="form.tier_175000" default="0">
<cfparam name="form.tier_250000" default="0">
<cfparam name="form.tier_500000" default="0">
<cfparam name="form.tier_750000" default="0">
<cfparam name="form.tier_1000000" default="0">
<cfparam name="form.tier_1250000" default="0">
<cfparam name="form.tier_1500000" default="0">
<cfparam name="form.commit" default="">
<cfparam name="form.close_window" default="">



<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
			SELECT *
			FROM Bulk_Rates_Natic
			where tier_100000 is not NULL
			ORDER BY state ASC
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

<CFQUERY datasource="#request.dsn#" NAME="find_entry">
			Select * from Client_Bulk_Rates_Natic
			where comp_id = #url.comp_id#
			and state = '#form.state#'
</CFQUERY>

<cfif find_entry.recordcount gt 0>
<cfoutput>
<script language="javascript">
alert("You already have an entry covering State: #form.state#");
history.go(-1);
</script>
</cfoutput>

<cfelse>

<CFQUERY datasource="#request.dsn#" NAME="insert_entry">
			Insert into Client_Bulk_Rates_Natic (comp_id, state, tier_100000, tier_175000, tier_250000, tier_500000, tier_750000, tier_1000000, tier_1250000, tier_1500000)
			values
			( #url.comp_id#, '#form.state#', '#form.tier_100000#', '#form.tier_175000#', '#form.tier_250000#', '#form.tier_500000#', '#form.tier_750000#', '#form.tier_1000000#', '#form.tier_1250000#', '#form.tier_1500000#')
</CFQUERY>

<script language="javascript">
refreshParent();
</script>
</cfif>

</cfif>
<cfif form.close_window eq 1>
<script language="JavaScript">
window.close();
</script>
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add State to Bulk Rates - NATIC</title>
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

					<OPTION VALUE="All" selected>All</OPTION>
					<cfoutput query="read_state_list">
					<OPTION VALUE="#read_state_list.state#" <cfif form.state eq read_state_list.state>selected</cfif>>#read_state_list.state#</OPTION>
					</CFOUTPUT>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_100000" value=1>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_175000" value=1>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_250000" value=1>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_500000" value=1>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_750000" value=1>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_1000000" value=1>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_1250000" value=1>
</td>
<td align=center valign=top width="75"><input type="checkbox" name="tier_1500000" value=1>
</td>
</tr>

<tr>
<td align=right valign=top colspan=8>
<input type="hidden" name="commit" value="0">
<input type="hidden" name="close_window" value="0"><input name="final_submit" type="button" value="Add this entry" onclick="document.form.commit.value=1;submit_form();"><br>
<input name="done_submit" type="button" value="Done" onclick="document.form.close_window.value=1;submit_form();"></td>
</tr>
</table>
</cfform>
</body>
</html>