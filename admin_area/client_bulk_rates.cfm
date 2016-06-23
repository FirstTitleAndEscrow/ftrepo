<cfparam name="url.vendor_id" default=0>
<cfparam name="form.vendor_id" default=0>
<cfparam name="form.vd" default="All">
<cfif form.vendor_id neq 0>
<cflocation url="vendor_modify2.cfm?vendor_id=#form.vendor_id#" addtoken="no">
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state_list">
			SELECT *
			FROM first_title_states_all
			ORDER BY st_abbrev ASC
</CFQUERY>


		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where id = #url.MODIFY_CLIENT_ID#
			ORDER BY company
		</CFQUERY>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_bulk_rates">
			SELECT *
			FROM client_bulk_rates
			where comp_id = #url.MODIFY_CLIENT_ID#
			ORDER BY comp_id
		</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>




<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=800 align=center valign=top>

<table width=799 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=799 align=center valign=top bgcolor=e3e3e3>
			<FONT SIZE=2 color=black face=arial>

<table width=798 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=748 align=center valign=top bgcolor=e3e3e3>
			<font size=2 color=green face=arial><B>Client Bulk Rates</B><br>
#read_company.company#<br>
		</td>
		<td width=50 align=center valign=top bgcolor=e3e3e3>&nbsp;

		</td>
	</tr>
</CFOUTPUT>

</table>

		</td>
	</tr>

	<tr>
		<td width=799 align=center valign=top bgcolor=e3e3e3>



<br>

<table id="bulk_info" style="display:block;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=10 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>Bulk Rates</td>
</tr>
<cfif read_bulk_rates.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=10><font size=1 color=black face=arial>No Bulk Rates found for this CLient</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Tier1<br>
$0-$100,000

		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Tier2<br>
$100,001 - $175,000
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Tier3<br>
$175,001 - $250,000
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Tier4<br>
$250,001 - $500,000
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Tier5<br>
$500,001 - $750,000
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Tier6<br>
$750,001- $1,000,000
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Tier7<br>
$1,000,001 - $1,250,000
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Tier8<br>
$1,250,001-$1,500,000
		</td>
		<td align=right valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_bulk_rates">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_bulk_rates.state#
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<cfif read_bulk_rates.tier_100000 eq 1>X<cfelse>&nbsp;</cfif>
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<cfif read_bulk_rates.tier_175000 eq 1>X<cfelse>&nbsp;</cfif>
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<cfif read_bulk_rates.tier_250000 eq 1>X<cfelse>&nbsp;</cfif>
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<cfif read_bulk_rates.tier_500000 eq 1>X<cfelse>&nbsp;</cfif>
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<cfif read_bulk_rates.tier_750000 eq 1>X<cfelse>&nbsp;</cfif>
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<cfif read_bulk_rates.tier_1000000 eq 1>X<cfelse>&nbsp;</cfif>
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<cfif read_bulk_rates.tier_1250000 eq 1>X<cfelse>&nbsp;</cfif>
		</td>
		<td align=center valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<cfif read_bulk_rates.tier_1500000 eq 1>X<cfelse>&nbsp;</cfif>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://machine1.firsttitleservices.com/admin_area/client_bulk_rates_modify.cfm?id=#read_bulk_rates.ID#','mywindow','width=700,height=150')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://machine1.firsttitleservices.com/admin_area/client_bulk_rates_delete.cfm?id=#read_bulk_rates.ID#&comp_id=#read_bulk_rates.comp_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=10 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add State for Bulk Rates" onClick="window.open('https://machine1.firsttitleservices.com/admin_area/client_bulk_rates_add.cfm?comp_id=<cfoutput>#url.MODIFY_CLIENT_ID#</cfoutput>','mywindow','width=700,height=150')"></td>
	</tr>
</table>









		</td>



	</tr>
</table>

	<tr>
		<td width=799 align=center valign=top bgcolor=white>

	</td>
</tr>
</table>

	</td>
</tr>
</table>
<center>
<a href="client_modify_display.cfm?uid=<cfoutput>#session.ft_user_id#</cfoutput>&al=1&company_id=<cfoutput>#url.MODIFY_CLIENT_ID#</cfoutput>">Return to Client Modify</a></center>

</BODY>

</HTML>

