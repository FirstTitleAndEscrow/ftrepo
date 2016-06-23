<cfparam name="calc" default="">
<CFSET r_count = "0">

	<!---=========================================== --->
	<!--- ===/ Get a list of all of the Clients \=== --->

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			ORDER BY company ASC

		</CFQUERY>

		<CFSET c_count = "1">
		<CFSET a_company_name = ArrayNew(1)>
		<CFSET a_company_id   = ArrayNew(1)>

		<CFOUTPUT QUERY="read_companies">
			<CFSET a_company_name[c_count] = #company#>
			<CFSET   a_company_id[c_count] = #ID#>

			<CFSET c_count = #c_count# + "1">
		</CFOUTPUT>

	<!---=========================================== --->
	<!---===================================================================== --->
	<!--- ===/ Use the list of companies to get a list of all their users \=== --->

		<CFSET    users_fname = ArrayNew(2)>
		<CFSET    users_lname = ArrayNew(2)>
		<CFSET       users_id = ArrayNew(2)>
		<CFSET    a_rec_count = ArrayNew(1)>

		<CFSET a_count = "1">
		<CFSET b_count = "1">

			<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="CCC">
				<CFQUERY datasource="#request.dsn#" NAME="read_users">
					SELECT *
					FROM users
					Where comp_id = #a_company_id[CCC]#
					ORDER BY lp_lname ASC, lp_fname ASC
				</CFQUERY>

					<CFOUTPUT QUERY="read_users">
						<CFSET users_fname[CCC][b_count] = #lp_fname#>
						<CFSET users_lname[CCC][b_count] = #lp_lname#>
						<CFSET    users_id[CCC][b_count] = #ID#>

						<CFSET b_count = #b_count# + "1">
					</CFOUTPUT>
						<CFSET a_rec_count[CCC] = #read_users.recordcount#>
						<CFSET b_count = "1">
			</CFLOOP>
	<!---===================================================================== --->


<CFQUERY datasource="#request.dsn#" NAME="read_date">

			SELECT oda_month
			FROM title
			ORDER BY oda_month

</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_titleid">

			SELECT title_id
			FROM title where

			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>

			ORDER BY Title_id

		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_date">

			SELECT oda_month, title_id
			FROM title
			ORDER BY oda_month, Title_id

		</CFQUERY>

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_status">

			SELECT DISTINCT appraisal_status
			FROM title
			ORDER BY appraisal_status

		</CFQUERY> --->
<CFQUERY datasource="#request.dsn#" NAME="read_Comments">

			SELECT DISTINCT comments
			FROM title
			ORDER BY comments

		</CFQUERY>






	<CFQUERY datasource="#request.dsn#" NAME="read_date_p">

			SELECT oda_month
			FROM property
			ORDER BY oda_month

</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_titleid_p">

			SELECT prop_id
			FROM property where

			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY prop_id

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_titleid_a">

			SELECT app_id
			FROM appraisal where
			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY app_id

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_titleid_anc">

			SELECT anc_id
			FROM ancillary where codeFlood is not null

			<cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			and comp_id = '#comp_id#'
			</cfif>
			ORDER BY anc_id

		</CFQUERY>
				<CFQUERY datasource="#request.dsn#" NAME="read_titleid_cr">

			SELECT anc_id
			FROM ancillary where codeCR is not null and
			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY anc_id

		</CFQUERY>
				<CFQUERY datasource="#request.dsn#" NAME="read_titleid_avm">

			SELECT anc_id
			FROM ancillary where codeAVM is not null and
			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY anc_id

		</CFQUERY>
				<CFQUERY datasource="#request.dsn#" NAME="read_titleid_sn">

			SELECT anc_id
			FROM ancillary where codeSigning is not null and
			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY anc_id

		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_date_p">

			SELECT oda_month, prop_id
			FROM property where
			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			ORDER BY oda_month, prop_id

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE ID = '#comp_id#'
ORDER BY company ASC
</CFQUERY>
<cfif #read_company.recordcount# GT 0>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
SELECT *
FROM users
WHERE comp_id = #read_company.id#
ORDER BY lp_lname ASC
</CFQUERY>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
<script type="text/javascript">
function prodSelect() {
var frm;
frm = document.frm;


if (frm.product.value == 'appraisal') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/title_client_rep_view.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=3&company_id=0";
  }
else if (frm.product.value == 'property') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/title_client_rep_view.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=2&company_id=0";

}
else if (frm.product.value == 'title') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/title_client_rep_view.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=1&company_id=0";

}

else if (frm.product.value == 'flood') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/title_client_rep_view.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=4&company_id=0";

}


else if (frm.product.value == 'credit') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/title_client_rep_view.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=5&company_id=0";

}
else if (frm.product.value == 'avm') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/title_client_rep_view.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=6&company_id=0";

}
else if (frm.product.value == 'signing') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/title_client_rep_view.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=7&company_id=0";

}

else {

 location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/title_client_rep_view.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&a_trigger=8&company_id=0";


}
}
</script>

</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
	<tr><td align="right" valign="center">
  <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
&nbsp;&nbsp;</td>
  <td align="right" valign="center"><input type="text" name="number" size=10></td>
  <td align="right" valign="center">&nbsp;<input type="image" src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
  							</tr><tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr></table>
 </cfFORM>
</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>


</td></tr></tbody></table>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>
<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
		<center>
		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		 <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

  <table width=776 border="2" cellpadding="0" cellspacing="0" >
  <TBODY>


	<tr>
		<td width=776 align=center border = 1 valign=top bgcolor=e1e1e1>
		<nobr><cfoutput><a href="https://#cgi.server_name#/client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>
<cfif #url.a_trigger# eq "1">
	<CFFORM NAME="frm"  ACTION="./title_client_rep_display.cfm?comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=1" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

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
								<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title/Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>

								</cfif>

							</SELECT>

	</td>
	</tr>
</table>

<br>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="navy">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Commitment Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>


				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
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
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
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
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
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
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
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
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>
<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
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
								clear: none;"
								>
						</td>
					</tr>
			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
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

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
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
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="comments"
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
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>
			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
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
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Title_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Commitment Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>



	<cfelseif #a_trigger# eq "2">

	<CFFORM NAME="frm"  ACTION="./title_client_rep_display.cfm?comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=2" METHOD=POST>
	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

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
											<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title/Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>

								</cfif>
							</SELECT>

	</td>
	</tr>
</table>

<br>
<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="purple">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
		<tr>
	<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Property Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="Prop_id"
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
								<CFOUTPUT QUERY="read_titleid_p"><OPTION VALUE="#prop_ID#">#prop_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
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
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
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
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
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
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
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
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
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
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
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

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
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
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
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
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>

		<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
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
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Prop_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>


					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=purple>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>


	<cfelseif #a_trigger# eq "3">

		<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=3" METHOD=POST>
<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

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
										<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title/Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>

								</cfif>
							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="blue">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Appraisal Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>

	<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appraisal Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="App_id"
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
								<CFOUTPUT QUERY="read_titleid_a"><OPTION VALUE="#app_ID#">#app_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
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
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
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
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
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
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
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
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
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
								clear: none;"
								>
						</td>
					</tr>



			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
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

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
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
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
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
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>


<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
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
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="App_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>


					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=Blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Appraisal Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

	<cfelseif #a_trigger# eq 4>
	<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=4" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

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
											<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title/Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>

								</cfif>
							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="orange">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Flood Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Flood Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="Anc_id"
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
								<CFOUTPUT QUERY="read_titleid_anc"><OPTION VALUE="#Anc_ID#">#Anc_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
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
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
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
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
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
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
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
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
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
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
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

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
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
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
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
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>



<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
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
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=orange>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Flood Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

		<cfelseif #a_trigger# eq 5>
	<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=5" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

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
											<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title/Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>

								</cfif>
							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="red">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Credit Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Credit Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="cr_id"
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
								<CFOUTPUT QUERY="read_titleid_cr"><OPTION VALUE="#Anc_ID#">#Anc_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
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
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
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
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
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
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
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
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
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
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
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

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
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
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
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
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>



<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
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
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=red>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Credit Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

		<cfelseif #a_trigger# eq 6>
	<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=6" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

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
											<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title/Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>

								</cfif>
							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="brown">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>AVM Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							AVM Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="avm_id"
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
								<CFOUTPUT QUERY="read_titleid_avm"><OPTION VALUE="#Anc_ID#">#Anc_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
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
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
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
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
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
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
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
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
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
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
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

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
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
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
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
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>



<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
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
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=brown>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>AVM Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>
		<cfelseif #a_trigger# eq 7>
	<CFFORM NAME="frm" ACTION="./title_client_rep_display.cfm?comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=7" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

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
											<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title/Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>

								</cfif>
							</SELECT>

	</td>
	</tr>
</table>

<br>

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="green">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Signing Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>



				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Signing Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="sn_id"
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
								<CFOUTPUT QUERY="read_titleid_sn"><OPTION VALUE="#Anc_ID#">#Anc_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="company_id"
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
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="user_id"
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
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>

							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
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
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
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
					</tr> --->
		<!--- ================================================== --->
					</tr>




<!--- ======================================================================== --->

				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
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
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
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

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
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
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
					<SELECT NAME="comments"
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
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>



<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
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
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION> --->
</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Signing Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>
	<cfelse>

	<CFFORM NAME="frm"  ACTION="./title_client_rep_display.cfm?comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8" METHOD=POST>

	<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>
		<FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
		</td></tr>
		<tr>
		<td width=776 align=center valign=top bgcolor=e1e1e1>

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
									<cfif #url.a_trigger# eq "1"><OPTION VALUE="title" selected>Title/Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "2"><OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "3"><OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "4"><OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "5"><OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "6"><OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelseif #url.a_trigger# eq "7"><OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title/Closing</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>

								</cfif>
							</SELECT>

	</td>
	</tr>
</table>

<br>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->

<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top bgcolor="gray">
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Product Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=776 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=776 align=center valign=top bgcolor=d3d3d3>


				<table width=600 cellpadding=1 cellspacing=1 border=0>


					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>

					</tr>



				</table>
		</TD>


			</TR>
			<table width=776 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=776 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Advanced Reports</B><br>*Allow you to generate specific reports based on your company's needs</CENTER>
			</TD>
		</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
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
								clear: none;"
								>
						</td>
					</tr>


			<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="oda_month"
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

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
									<SELECT NAME="Appraisal_status"
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
									 <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="comments"
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
								 <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION></SELECT>
						</td>
					</tr>

				<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
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
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>

</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=776 align=left valign=top bgcolor=gray>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Product Report Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>


	</cfif>

			</td>

			<!--- <tr><td width=776 align=left valign=bottom><IMG src="./images/bottom.gif" width = "776"></td></tr></TBODY></TABLE>
  --->
			</tr></tbody></table>

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


