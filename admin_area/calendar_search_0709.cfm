<CFPARAM NAME="a_state"     DEFAULT="None">
<CFPARAM NAME="a_zip"       DEFAULT="None">
<CFPARAM NAME="a_county"    DEFAULT="None">
<CFPARAM NAME="a_city"      DEFAULT="None">
<CFPARAM NAME="a_area_code" DEFAULT="None">
<CFPARAM NAME="confirm_mon" DEFAULT="">
<CFPARAM NAME="confirm_mon_to" DEFAULT="">
<CFPARAM NAME="comfirm_day" DEFAULT="">
<CFPARAM NAME="comfirm_day_to" DEFAULT="">
<CFPARAM NAME="confirm_year" DEFAULT="">
<CFPARAM NAME="confirm_year_to" DEFAULT="">
<CFPARAM NAME="a_trigger"   DEFAULT="1">
<CFPARAM NAME="r_count"     DEFAULT="0">
<CFPARAM NAME="comp_id"     DEFAULT="">
<CFPARAM NAME="product" DEFAULT="">
<cfparam name="a_flag" default="1">
<CFPARAM NAME="Type" DEFAULT="Title">

<CFSET session.comp_id = #comp_id#>

<cfquery datasource="#request.dsn#" name="getuser">
	select * from first_admin
	where id = #session.ft_user_id#
</cfquery>
<!---Changed states to all Harry 07/08/2004--->
<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
			SELECT *
			FROM first_title_states_all
			ORDER BY st_abbrev ASC
</CFQUERY>

<CFSET a_state_abbrev = ArrayNew(1)>
<CFSET a_count = "1">

<CFOUTPUT QUERY="read_state_list">
	<CFIF #a_count# EQ "1">
		<CFSET a_state_abbrev[a_count] = "none">
	<CFELSE>
		<CFSET a_state_abbrev[a_count] = #st_abbrev#>
	</CFIF>

	<CFSET a_count = #a_count# + "1">
</CFOUTPUT>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
<!-- Original:  Wayne Nolting (w.nolting@home.com) -->

<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! https://javascript.internet.com -->

<!-- Begin
function go(loc) {
window.location.href = loc;
}
//  End -->
</script>
<title>1st Title & Escrow, Inc. - Closing Search Form</title>
</head>


<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>


<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width="98%" align=center valign=top>
			<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<tr>
					<td width="98%" align=center valign=top bgcolor=white>
<cfoutput>
						<table width="100%" bgcolor="white">
							<tr>
								<td>
								</td>
								<td>
									<div align="center">
									<font color = "blue" size="3"><b>User logged in: #getuser.fname#&nbsp;#getuser.lname# </b></font>
									</div>
								</td>
							</tr>
						</table>
</cfoutput>
						<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
							<tr>
								<td width="100%" align=left valign=top bgcolor=f1f1f1>
									<FONT FACE=ARIAL SIZE=2 color="black">
									<CENTER><B>Type</B></CENTER>
								</TD>
							</TR>
							<tr>
								<td width="100%" align=left valign=top bgcolor=f1f1f1>
								<Center>

								<Input type="radio" Name="Type" Value="Title"
												onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/calendar_search.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<CFOUTPUT>#URL.al#</CFOUTPUT>&comp_id=<CFOUTPUT>#comp_id#</CFOUTPUT>&Type=Title');"

												>Title


								<!--- <Input type="radio" Name="Type" Value="Title"
												onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/calendar_search.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<CFOUTPUT>#URL.al#</CFOUTPUT>&comp_id=<CFOUTPUT>#comp_id#</CFOUTPUT>&Type=Title');"

												>Title --->


								<Input type="radio" Name="Type" Value="Property"
												onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/calendar_search_prop.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<CFOUTPUT>#URL.al#</CFOUTPUT>&comp_id=<CFOUTPUT>#comp_id#</CFOUTPUT>&Type=Property');"

												>Property
								</CENTER>
								</td>

							<tr>
								<td width="100%" align=left valign=top bgcolor=elelel>
									<CENTER><BOLD>Status</BOLD></CENTER>
								</td>
							</tr>

						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>