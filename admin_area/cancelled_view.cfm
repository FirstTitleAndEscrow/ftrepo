<cfparam name="url.al" default=0>
<CFSET r_count = "0">

<CFINCLUDE TEMPLATE="./includes/companies.cfm">
<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT ID, company
			FROM companies where ID in (#full_list_comp_ids#)
			ORDER BY company

		</CFQUERY>

<CFSET c_count = "1">
<CFSET a_company_name = ArrayNew(1)>
<CFSET a_company_id   = ArrayNew(1)>

<CFOUTPUT QUERY="read_companies">
	<CFSET a_company_name[c_count] = #company#>
	<CFSET   a_company_id[c_count] = #ID#>
	<CFSET c_count = #c_count# + "1">
</CFOUTPUT>

<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
	SELECT title_id
	FROM title  where cancelled = 1
	ORDER BY Title_id
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_titleid_p">
	SELECT prop_id
	FROM property where cancelled = 1
	ORDER BY prop_id
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>1st Title & Escrow, Inc. </title>

<script type="text/javascript">
function prodSelect() {
var frm;
frm = document.frm;


if (frm.product.value == 'property') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/cancelled_view.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=2&company_id=0";

}

else if (frm.product.value == 'title') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/cancelled_view.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=1&company_id=0";

}
}
</script>

</head>
<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
<CENTER>
<CENTER>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=780 align=center valign=top>
			<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
<cfif #url.a_trigger# eq "1"> <!---Title--->
						<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
							<tr>
								<td width=780 align=left valign=top bgcolor=green>
									<FONT FACE=ARIAL SIZE=2 color="white">
									<CENTER><B>Cancelled Orders Search</B></CENTER>
								</TD>
							</TR>
<CFFORM NAME="frm" ACTION="./cancelled_rep_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" METHOD=POST>
	<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
					<td width=780 align=center valign=top bgcolor=d3d3d3>
						<table width=350 cellpadding=1 cellspacing=1 border=0>
							<tr>
								<td bgcolor=d3d3d3 width=350 align=center valign=top>
									<br><FONT FACE=verdana SIZE=1 color="blUE">
									<B>SELECT A PRODUCT</b>
								</td>
							</tr>
							<td bgcolor=d3d3d3 width=350 align=center valign=top>
								<SELECT NAME="product"	onchange="prodSelect()"
									size="1"
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
									border-style: bar;
									clear: none;
									float: none;"
									rows="5"
									cols="45"
									>
										<OPTION VALUE="title" selected>Title</OPTION>
										<OPTION VALUE="property">Property</OPTION>
								</SELECT>
								<br><br>
							</td>
						</tr>
					</table>
					<table width=650 cellpadding=1 cellspacing=1 border=0>
						<tr>
							<td bgcolor=d3d3d3 width=250 align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Clients
							</td>
							<td bgcolor=d3d3d3 width=400 align=left valign=top>
								<SELECT NAME="company_id"	multiple
									size="5"
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
									border-style: bar;
									clear: none;
									float: none;"
									rows="5"
									cols="45"
									>
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
								</SELECT>
							</td>
						</tr>
						<tr>
							<td bgcolor=d3d3d3 width=250 align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Title Number
							</td>
							<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Title_id"
								size="1"
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
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -
						</td>
						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
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
								clear: none;" >
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -
						</td>
						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
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
								clear: none;" >
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Start Date -
						</td>
						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="date_start"  size=25 maxlength=25
								size="1"
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
								clear: none;" >
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							End Date -
						</td>
						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="date_end"  size=25 maxlength=25
								size="1"
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
								clear: none;" >
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=650 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>
					</tr>
</CFFORM>
<!--- ======================================================================== --->

<cfelseif #a_trigger# eq 2>
			<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
				<tr>
					<td width=780 align=left valign=top bgcolor=purple>
						<FONT FACE=ARIAL SIZE=2 color="white">
						<CENTER><B>Cancelled Property Orders Search</B></CENTER>
					</TD>
				</TR>
<CFFORM NAME="frm" ACTION="./cancelled_rep_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=2" METHOD=POST>
	<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
					<td width=780 align=center valign=top bgcolor=d3d3d3>
			<table width=350 cellpadding=1 cellspacing=1 border=0>
				<tr>
					<td bgcolor=d3d3d3 width=350 align=center valign=top>
						<br><FONT FACE=verdana SIZE=1 color="blUE">
						<B>SELECT A PRODUCT</b>
					</td>
				</tr>
					<td bgcolor=d3d3d3 width=350 align=center valign=top>
						<SELECT NAME="product"	onchange="prodSelect()"
								size="1"
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
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>

								<OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="title">Title</OPTION>
							</SELECT><br><br>
					</td>
				</tr>
			</table>
			<table width=650 cellpadding=1 cellspacing=1 border=0>
				<tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						Clients
					</td>
					<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="company_id"			multiple
								size="5"
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
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
					</td>
				</tr>
				<tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						Property Number
					</td>
					<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="prop_id"
								size="1"
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
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_p"><OPTION VALUE="#prop_ID#">0232#prop_ID#</OPTION></CFOUTPUT>
							</SELECT>
					</td>
				</tr>
				<tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						Buyer First Name -
					</td>
					<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
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
								clear: none;" >
					</td>
				</tr>
				<tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						Buyer Last Name -
					</td>
					<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
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
								clear: none;" >
					</td>
				</tr>
				<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Start Date -
						</td>
						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="date_start"  size=25 maxlength=25
								size="1"
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
								clear: none;" >
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							End Date -
						</td>
						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="date_end"  size=25 maxlength=25
								size="1"
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
								clear: none;" >
						</td>
					</tr>
				<tr>
					<td bgcolor=d3d3d3 colspan=2 width=650 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
					</td>
				</tr>
</CFFORM>
<!--- ======================================================================== --->
			</TD>
		</TR>

	</table>
</CFIF>
</BODY>
</HTML>


