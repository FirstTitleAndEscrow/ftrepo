<cfif IsDefined("url.modify_client_id")>
<cfset company_id = url.modify_client_id>
</cfif>



<!---Get all Teams--->
<CFQUERY datasource="#request.dsn#" NAME="get_teams">
		SELECT *
		FROM Teams
</CFQUERY>
<!---Read current User Gary Hays--->
<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM First_Admin
		WHERE ID = '#URL.UID#'
</CFQUERY>
<!--- curr company info --->
<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE ID = #company_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_custom_fees">
	SELECT *
	FROM custom_fees
	WHERE comp_id = #company_id# order by code
</CFQUERY>


	<!--- <cfoutput>#read_company_isales.intSales#</cfoutput>
	<cfoutput>#read_company_isales.Name#</cfoutput>		 --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
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

<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>
<CENTER>

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=700 align=left valign=top>
<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=699 align=left valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>
<table width=698 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
		<td width=698 align=left valign=top bgcolor=white>
			<br>
<br>
<font size=2 color=blue face=arial><B>Modify Client/Customer Custom Fees</B><br>
<br>
<br>

		</td>
	</tr>
	<tr>
		<td width=698 align=left valign=top bgcolor=white>
<table width=697 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=50 align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			Code:
		</td>
		<td width=300 align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			Line Text:
		</td>
		<td width=175 align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			Description:
		</td>
		<td width=75 align=right valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			HUD Line:
		</td>
		<td width=60 align=right valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			Amount:
		</td>
		<td width=100 align=right valign=top bgcolor=e4e4e4>
			&nbsp;
		</td>
	</tr>
<cfoutput query="get_custom_fees">
	<tr>
		<td width=50 align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			#get_custom_fees.code#
		</td>
		<td width=300 align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			#get_custom_fees.line_description#
		</td>
		<td width=175 align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			#get_custom_fees.verbose_description#
		</td>
		<td width=75 align=right valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			#get_custom_fees.hud_line#
		</td>
		<td width=60 align=right valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			#get_custom_fees.amount#
		</td>
		<td width=100 align=right valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			edit | delete
		</td>
	</tr>
	</cfoutput>
		</td>
	</tr>
</table>
		</td>
	</tr>
</table>
		</td>
	</tr>
</table>
		</td>
	</tr>
</table>
</BODY>
</HTML>