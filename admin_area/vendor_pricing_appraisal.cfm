<cfparam name="url.vendor_id" default="0">
<cfparam name="form.state" default="All">
<cfparam name="form.county" default="All">
<cfparam name="form.commit" default="0">
<cfparam name="form.close_window" default="0">

<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
			SELECT *
			FROM first_title_states_all
			ORDER BY st_abbrev ASC
</CFQUERY>

<cfif form.state neq 'All'>
<CFQUERY datasource="#request.dsn#" NAME="read_county_list">
			SELECT distinct county
			FROM zip_info
			where state = '#form.State#'
			ORDER BY county ASC
</CFQUERY>
</cfif>

<script language="JavaScript">
<!--
function refreshParent() {
window.opener.location.reload();
window.opener.location.hash = 'abstractor_pricing';

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
			Select * from Vendor_Pricing
			where vendor_id = #url.vendor_id#
			and state = '#form.state#'
			and county = '#form.county#'
			and service_type = 'Appraisal'
</CFQUERY>

<cfif find_entry.recordcount gt 0>
<cfoutput>
<script language="javascript">
alert("You already have an entry covering State: #form.state#, County: #form.county#");
history.go(-1);
</script>
</cfoutput>

<cfelse>

<CFQUERY datasource="#request.dsn#" NAME="insert_entry">
			Insert into Vendor_Pricing (vendor_id, service_type, state, county, appraisal_fee)
			values
			( #url.vendor_id#, 'Appraisal', '#form.state#', '#form.county#', '#form.appraisal_fee#')
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
<table>
<tr>
<td align=left valign=top width="30">State</td>
<td align=left valign=top width="200">County</td>
<td align=left valign=top width="80">Price</td>
<td align=right valign=top width="80">&nbsp;</td>
</tr>
<tr>
<td align=left valign=top width="30">
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
					<OPTION VALUE="#read_state_list.st_abbrev#" <cfif form.state eq read_state_list.st_abbrev>selected</cfif>>#read_state_list.st_abbrev#</OPTION>
					</CFOUTPUT>
</td>

<td align=left valign=top width="200"><SELECT NAME="county"

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
					border-style: bar; width: 200px;">
		<!--- <CFIF #ArrayLen(a_app_county_1)# EQ "0"> --->

					<OPTION VALUE="All">All</OPTION>
					<cfif form.state neq 'All'>
					<cfoutput query="read_county_list">
					<OPTION VALUE="#read_county_list.county#" <cfif form.county eq read_county_list.county>selected</cfif>>#read_county_list.county#</OPTION>
					</CFOUTPUT>
					</cfif>
<td align=left valign=top width="80"><input type=text name="appraisal_fee" VALUE="" size=6 maxlength=22

				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none; width: 75px; "></td>
<td align=right valign=top width="80"><input type="hidden" name="commit" value="0">
<input type="hidden" name="close_window" value="0"><input name="final_submit" type="button" value="Add this entry" onclick="document.form.commit.value=1;submit_form();"><br>
<input name="done_submit" type="button" value="Done" onclick="document.form.close_window.value=1;submit_form();"></td>
</tr>
<tr>
<td align=right valign=top colspan=4>&nbsp;</td>
<td align=right colspan=3>
<br>
</td>
</tr>
</table>
</cfform>
</body>
</html>