<CFPARAM NAME="vendor"     DEFAULT="">
<CFPARAM NAME="a_state"       DEFAULT="">
<CFPARAM NAME="a_trigger"       DEFAULT="">



		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_county_list">

				SELECT DISTINCT COUNTY
				FROM zip_info
				ORDER BY county ASC

			</CFQUERY>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Weblinks Search Form</title>
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


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width="100%" align=left valign=top bgcolor=white>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Vendor Coverage </B></CENTER>
			</TD>
		</TR>

<cfoutput>
<FORM METHOD=POST ACTION="./vendor_coverage.cfm?a_trigger=1">
</cfoutput>
<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>

					<tr>

<td bgcolor=d3d3d3 width="100%" align=left valign=top>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b><FONT FACE=verdana SIZE=1 color="black">
							Select Vendor</b>




							<Select NAME="vendor"
									size="1"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;
									float: none;"
									rows="3"
									cols="45"
									>

					<OPTION VALUE="abstractor">Abstractors</OPTION>
					<OPTION VALUE="closer">Closers</OPTION>
								</select>


							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b><FONT FACE=verdana SIZE=1 color="black">
							Choose State</b>

							<Select NAME="A_state"
									size="1"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;
									float: none;"
									rows="3"
									cols="45"
									>

					<CFOUTPUT QUERY="read_state_list"><OPTION VALUE="#st_abbrev#">#st_abbrev# </OPTION></CFOUTPUT>

								</select>


						</td>
</tr>
<tr>

<td bgcolor=d3d3d3 width="100%" align=center valign=top><br>
<INPUT TYPE=image src="./images/button_proceed.gif" border=0>
</td></tr>
</form>

</table>
<cfif #a_trigger# eq "1">
<cfif #form.vendor# eq "abstractor">
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>A b s t r a c t o r s&nbsp;&nbsp;&nbsp;&nbsp;S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<table width="98%" cellpadding=1 cellspacing=1 border=0>

<cfoutput>
		 <CFIF IsDefined("form.a_state")>
	<CFSET a_state = #a_state#>
</CFIF>
<CFIF IsDefined("form.vendor")>
	<CFSET vendor = #vendor#>
</CFIF>
</cfoutput>








			<tr>

						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							ID
						</td>

						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							County
						</td>


						<td bgcolor=gray width=270 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
						</td>
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Rank
						</td>
			<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Email/Fax
						</td>
			</tr>


			<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
		<!---   <CFQUERY datasource="#request.dsn#" NAME="read_state_cty_list">

				SELECT DISTINCT state, county
				FROM zip_info
				WHERE state = '#form.a_state#'
				ORDER BY county ASC

			</CFQUERY>	 --->


<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM abstractors_county a, abstractors b
			WHERE b.abstractor_id = a.abstractor_id and a.st_abbrev = '#FORM.A_state#'
ORDER BY ct_name ASC
</cfquery>




	<cfoutput QUERY="read_report">




					<tr>

						<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							43204#abstractor_id#
						</td>

						<td bgcolor="#a_bgcolor#" width=70 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#cT_NAME#
						</td>

						<td bgcolor="#a_bgcolor#" width=270 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>
<td bgcolor="#a_bgcolor#" width=10 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#rank#
						</td>

						<td bgcolor="#a_bgcolor#" width=100 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<cfif #email# eq "">
						#fax#
						<cfelse>
				<a href="mailto:#email#">#email#</a>
						</cfif>



						</td>
					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>

				</table>




<cfelse>
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>C l o s e r s&nbsp;&nbsp;&nbsp;&nbsp;S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<table width="98%" cellpadding=1 cellspacing=1 border=0>

<cfoutput>
		 <CFIF IsDefined("form.a_state")>
	<CFSET a_state = #a_state#>
</CFIF>
<CFIF IsDefined("form.vendor")>
	<CFSET vendor = #vendor#>
</CFIF>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_state_cty_list">

				SELECT DISTINCT COUNTY, state
				FROM zip_info
				WHERE state = '#form.a_state#'
				ORDER BY county ASC

			</CFQUERY>







			<tr>

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>

						<td bgcolor=gray width=150 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							County
						</td>


						<td bgcolor=gray width=300 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
						</td>
			</tr>


			<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

			<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM closer_county
			WHERE st_abbrev = '#FORM.A_state#'
order by ct_name
</cfquery>
			<CFOUTPUT QUERY="read_report">



					<tr>

						<td bgcolor="#a_bgcolor#" width=100 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#st_abbrev#
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#ct_name#
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>


					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>

				</table>



</cfif>



</cfif> <!--- a_trigger --->




			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</HTML>


