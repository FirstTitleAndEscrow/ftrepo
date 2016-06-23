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
<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=300 align=left valign=top bgcolor=e1e1e1>
			<IMG SRC="./images/logo_left.gif">
		</td>
		<td width=494 align=left valign=top bgcolor=white>
			<table width=493 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
				<tr>
					<td width=123 align=center valign=top bgcolor=e3e3e3><img src="./images/title_client.gif"></td>
					<td width=123 align=center valign=top bgcolor=e3e3e3><img src="./images/title_users.gif"></td>
					<td width=123 align=center valign=top bgcolor=e3e3e3><img src="./images/title_abstractors.gif"></td>
					<td width=124 align=center valign=top bgcolor=e3e3e3><img src="./images/title_lenders.gif"></td>
				</tr>
<!--- ================================== --->
<!--- ===/ First set of navigation  \=== --->
<!--- ================================== --->
<CFOUTPUT>	<tr>
				<td width=123 align=center valign=top bgcolor=e3e3e3><NOBR><a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add.gif" border=0 ALT="Add a new Client to the database"></a><a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_modify.gif" border=0 ALT="Modify an existing Client"></NOBR></td>
				<td width=123 align=center valign=top bgcolor=e3e3e3><NOBR><a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add.gif" border=0 ALT="Add a new User to the database"></a><a href="./user_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_modify.gif" border=0 ALT="Modify an existing User"></a></NOBR></td>
				<td width=123 align=center valign=top bgcolor=e3e3e3><NOBR><a href="https://#cgi.server_name#/admin_area/abstractors_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add.gif" border=0 ALT="Add an Abstractor to the database"></a><a href="https://#cgi.server_name#/admin_area/abstractors_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_modify.gif" border=0 ALT="Modify an existing Abstractor"></a></NOBR></td>
				<td width=124 align=center valign=top bgcolor=e3e3e3><NOBR><a href="https://#cgi.server_name#/admin_area/lenders_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_add.gif" border=0></a><a href="https://#cgi.server_name#/admin_area/lenders_modify_select.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_modify.gif" border=0></a></NOBR></td>
			</tr>
		</table>

		<table width=493 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<!--- ================================== --->
<!--- ===/ Second set of navigation \=== --->
<!--- ================================== --->
			<tr>
				<td width=258 colspan=3 align=center valign=bottom bgcolor=e3e3e3><img src="./images/title_support_db.gif"></td>
				<td width=110 colspan=2 align=center valign=top bgcolor=e3e3e3><img src="./images/title_reports.gif"></td>
				<td width=125 colspan=2 align=center valign=top bgcolor=e3e3e3><img src="./images/title_title_co.gif"></td>
			</tr>
			<tr>
				<td width=95 align=center valign=top bgcolor=e3e3e3><a href="https://#cgi.server_name#/admin_area/First_title_states_served_modify.cfm?uid=#URL.uid#&al=#URL.al#" target="work" ><img src="./images/button_states_served.gif" border=0 ALT="Manage the States Served by First Title Services"></a></td>
				<td width=82 align=center valign=top bgcolor=e3e3e3><a href="https://#cgi.server_name#/admin_area/rec_fees_view.cfm?uid=#URL.uid#&al=#URL.al#" target="work"><img src="./images/button_rec_fees.gif" border=0 ALT="View Recording Fees Schedule"></a></td>
				<td width=81 align=center valign=top bgcolor=e3e3e3><a href="https://#cgi.server_name#/admin_area/ins_fees_choose.cfm?uid=#URL.uid#&al=#URL.al#" target="work"><img src="./images/button_ins_fees.gif" border=0 ALT="Review the Insurance Fees Schedule for each State"></a></td>
				<td width=55 align=center valign=top bgcolor=e3e3e3><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work"><img src="./images/button_title_rep.gif" border=0 ALT="View the existing Title Commitment Reports"></a></td>
				<td width=55 align=center valign=top bgcolor=e3e3e3><a href="prop_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work" ><img src="./images/button_prop_rep.gif" border=0 ALT="View the existing Property Reports"></a></td>
				<td width=63 align=center valign=top bgcolor=e3e3e3><a href="title_co_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work" ><img src="./images/button_add.gif" border=0 ALT="Add a New Title Company"></a></td>
				<td width=62 align=center valign=top bgcolor=e3e3e3><a href="Title_Co_Modify_Select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work" ><img src="./images/button_modify.gif" border=0 ALT="Modify a Title Company"></a></td>
			</tr>
		</table>
		</td>
	</tr>

	<tr>
		<td width=800 colspan=2 align=left valign=top bgcolor=e3e3e3>
<!--- ================================================ --->
<!--- ===/   [   WEB SITE MANAGEMENT SECTION   ]   === --->
<!--- ================================================ --->
			<NOBR><img src="./images/nav_filler.gif"><a href="./site_mgt.cfm?page_id=4&uid=#URL.uid#&al=#URL.al#" target="work"><img border=0 src="./images/nav_home_page.gif"></a><a href="./site_mgt.cfm?page_id=1&uid=#URL.uid#&al=#URL.al#" target="work"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_mgt.cfm?page_id=2&uid=#URL.uid#&al=#URL.al#" target="work"><img border=0 src="./images/nav_closing.gif"></a><a href="./site_mgt.cfm?page_id=3&uid=#URL.uid#&al=#URL.al#" target="work"><img border=0 src="./images/nav_contact.gif"></a></NOBR></td>
	</tr>
</table>
</CFOUTPUT>
		</td>
	</tr>
</table>
		</td>
	</tr>
</table>
</BODY>
</HTML>