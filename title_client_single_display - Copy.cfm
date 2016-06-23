<cfparam name="calc" default="">
<cfparam name="number" default="">
<cfparam name="comp_id" default="0">
<CFSET r_count = "0">

<cfoutput>

<CFIF IsDefined("form.number")>
	<cfif #number# NEQ "NONE">
		<CFSET number = #number#>
	</cfif>
</CFIF>

</cfoutput>
<!---Function to strip the 023 off of the property ID --->
<cfif IsNumeric(number)>
<CFIF Len(#number#) gt 5>
	<CFIF #mid(form.number,1,1)# eq 0>
		<CFset #number_length# = Len(#number#)-4>
		<CFset #number# = right(#number#,#number_length#)>
	</CFIF>
</CFIF>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
    FROM companies
    WHERE id = '#comp_id#'
</CFQUERY>

<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="read_branches">
SELECT *
    FROM companies
    WHERE id IN (#read_company.child_ids#)
    ORDER BY company ASC
</CFQUERY>
</cfif>



<CFQUERY datasource="#request.dsn#" NAME="read_report">
	SELECT *
	FROM title
	WHERE
	(
	<cfif #url.comp_id# eq "154">
			 comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274
			<cfelseif #url.comp_id# eq "953">
			comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
			or comp_id IN (#comp_id#,#read_company.child_ids#)
			</cfif>
			)

	<CFIF #number# NEQ "">
	<cfif IsNumeric(number)>
	and (title_id = '#number#'
	or paddress like '%#number#%'
	or loan_number like '%#number#%'
	or reo_number like '%#number#%')
	<cfelse>
	and (blastname1 like '%#number#%' or blastname2 like '%#number#%'
	or paddress like '%#number#%'
	or loan_number like '%#number#%'
	or reo_number like '%#number#%')
	</cfif>
	</CFIF>
	<!---<cfif #comp_id# eq "154">
		(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
	<cfelse>
		comp_id = '#comp_id#'
	</cfif>--->
</CFQUERY>





<CFQUERY datasource="#request.dsn#" NAME="read_prop">
	SELECT *
	FROM Property
	WHERE
	(
	<cfif #url.comp_id# eq "154">
			 comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274
			<cfelseif #url.comp_id# eq "953">
			comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
			or comp_id IN (#comp_id#,#read_company.child_ids#)
			</cfif>
			)

	<CFIF #number# NEQ "">
	<cfif IsNumeric(number)>
	and (prop_id = '#number#'
	or paddress like '%#number#%'
	or loan_number like '%#number#%'
	or reo_number like '%#number#%')
	<cfelse>
	and (blastname1 like '%#number#%' or blastname2 like '%#number#%'
	or paddress like '%#number#%'
	or loan_number like '%#number#%'
	or reo_number like '%#number#%')
	</cfif>
	</CFIF>
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_app">
	SELECT *
	FROM appraisal
	WHERE
	(
	<cfif #url.comp_id# eq "154">
			 comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274
			<cfelseif #url.comp_id# eq "953">
			comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
			or comp_id IN (#comp_id#,#read_company.child_ids#)
			</cfif>
			)


<CFIF #number# NEQ "">
	<cfif IsNumeric(number)>
	AND app_id = '#number#'
	or paddress like '%#number#%'
	<cfelse>
	AND ((blastname1 like '%#number#%' or blastname2 like '%#number#%')
	or paddress like '%#number#%')
	</cfif>
	</CFIF></CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_anc">
	SELECT *
	FROM ancillary
	WHERE codeFlood is not null and
	(
	<cfif #url.comp_id# eq "154">
			 comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274
			<cfelseif #url.comp_id# eq "953">
			comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
			or comp_id IN (#comp_id#,#read_company.child_ids#)
			</cfif>
			)


	<CFIF #number# NEQ "">
	<cfif IsNumeric(number)>
	AND anc_id = '#number#'
	or paddress like '%#number#%'
	<cfelse>
	AND ((blastname1 like '%#number#%' or blastname2 like '%#number#%')
	or paddress like '%#number#%')
	</cfif>
	</CFIF>
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_cr">
	SELECT *
	FROM ancillary
	WHERE codeCR is not null and
	(
	<cfif #url.comp_id# eq "154">
			 comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274
			<cfelseif #url.comp_id# eq "953">
			comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
			or comp_id IN (#comp_id#,#read_company.child_ids#)
			</cfif>
			)

<CFIF #number# NEQ "none">
	<cfif IsNumeric(number)>
	AND anc_id = '#number#'
	or paddress like '%#number#%'
	<cfelse>
	AND ((blastname1 like '%#number#%' or blastname2 like '%#number#%')
	or paddress like '%#number#%')
	</cfif>
	</CFIF></CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_avm">
	SELECT *
	FROM ancillary
	WHERE codeAVM is not null and
	(
	<cfif #url.comp_id# eq "154">
			 comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274
			<cfelseif #url.comp_id# eq "953">
			comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
			or comp_id IN (#comp_id#,#read_company.child_ids#)
			</cfif>
			)

<CFIF #number# NEQ "none">
	<cfif IsNumeric(number)>
	AND anc_id = '#number#'
	or paddress like '%#number#%'
	<cfelse>
	AND ((blastname1 like '%#number#%' or blastname2 like '%#number#%')
	or paddress like '%#number#%')
	</cfif>
	</CFIF></CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_sn">
	SELECT *
	FROM ancillary
	WHERE codeSigning is not null and
	(
	<cfif #url.comp_id# eq "154">
			 comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274
			<cfelseif #url.comp_id# eq "953">
			comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
			or comp_id IN (#comp_id#,#read_company.child_ids#)
			</cfif>
			)

<CFIF #number# NEQ "none">
	<cfif IsNumeric(number)>
	AND anc_id = '#number#'
	or paddress like '%#number#%'
	<cfelse>
	AND ((blastname1 like '%#number#%' or blastname2 like '%#number#%')
	or paddress like '%#number#%')
	</cfif>
	</CFIF></CFQUERY>




<CFQUERY datasource="#request.dsn#" NAME="read_fdr">
	SELECT *
	FROM Final_Document_Retrieval
	WHERE
	(
	<cfif #url.comp_id# eq "154">
			 comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274
			<cfelseif #url.comp_id# eq "953">
			comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
			or comp_id IN (#comp_id#,#read_company.child_ids#)
			</cfif>
			)

	<CFIF #number# NEQ "">
	<cfif IsNumeric(number)>
	and (fdr_id = '#number#'
	or paddress like '%#number#%'
	or loan_number like '%#number#%')
	<cfelse>
	and (blastname1 like '%#number#%' or blastname2 like '%#number#%'
	or paddress like '%#number#%'
	or loan_number like '%#number#%')
	</cfif>
	</CFIF>
</CFQUERY>




<CFQUERY datasource="#request.dsn#" NAME="read_pr">
	SELECT *
	FROM Policy_Recovery
	WHERE
	(
	<cfif #url.comp_id# eq "154">
			 comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274
			<cfelseif #url.comp_id# eq "953">
			comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951
			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
			or comp_id IN (#comp_id#,#read_company.child_ids#)
			</cfif>
			)

	<CFIF #number# NEQ "">
	<cfif IsNumeric(number)>
	and (pr_id = '#number#'
	or paddress like '%#number#%'
	or loan_number like '%#number#%')
	<cfelse>
	and (blastname1 like '%#number#%' or blastname2 like '%#number#%'
	or paddress like '%#number#%'
	or loan_number like '%#number#%')
	</cfif>
	</CFIF>
</CFQUERY>

<CFSET r_count = #read_report.recordcount# + #read_prop.recordcount# + #read_app.recordcount# + #read_anc.recordcount# + #read_avm.recordcount# + #read_cr.recordcount# + #read_sn.recordcount# + #read_fdr.recordcount# + #read_pr.recordcount#>

<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE ID = '#url.comp_id#'
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
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

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

	<cfFORM NAME="Search" METHOD="Post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
	<tr><td align="right" valign="center">
  <a href="quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
&nbsp;&nbsp;</td>
  <td align="right" valign="center"><input type="text" name="number" size=10></td>
  <td align="right" valign="center">&nbsp;<input type="image" src="client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
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
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

 <table width=770 border="1" cellpadding="0" cellspacing="0" >
  <TBODY>




	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=gray>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Product Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=770 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->

<nobr><cfoutput><a href="client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>

<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			</TD>
				</TR>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=770 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td> --->

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>

					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">



			 <CFLOOP QUERY="read_report">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #title_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif #read_all_notes.recordcount# gt 0>
							<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&code=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<cfif #calc# eq "yes">
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_client_report_nav_calc.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>
					<cfelse>
					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_client_report_nav.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>
					</cfif>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>


		 <CFLOOP QUERY="read_prop">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							P-0232#prop_id#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #prop_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif #read_all_notes.recordcount# gt 0>
							<a href="./view_property_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#prop_id#&code=P" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./view_the_prop_order.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#prop_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>

		 <CFLOOP QUERY="read_app">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							APP-#app_id#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #app_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif #read_all_notes.recordcount# gt 0>
							<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#app_id#&code=APP" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_appraisal.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#app_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>


		 <CFLOOP QUERY="read_anc">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeFlood# neq "">F</cfif>-#anc_id#

						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif #read_all_notes.recordcount# gt 0>
							<a href="./view_title_comments_nav_sn.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&code=F" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1&code=F"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>

		 <CFLOOP QUERY="read_cr">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeCR# neq "">CR</cfif>-#anc_id#

						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif #read_all_notes.recordcount# gt 0>
							<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&code=CR" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1<cfif #codeCR# neq "">&code=CR</cfif>"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>

		 <CFLOOP QUERY="read_avm">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeAVM# neq "">AVM</cfif>-#anc_id#

						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif #read_all_notes.recordcount# gt 0>
							<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&code=AVM" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1<cfif #codeAVM# neq "">&code=AVM</cfif>"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>

		 <CFLOOP QUERY="read_sn">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeSigning# neq "">SN</cfif>-#anc_id#

						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif #read_all_notes.recordcount# gt 0>
							<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&code=SN" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1<cfif #codeSigning# neq "">&code=SN</cfif>"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>


		 <CFLOOP QUERY="read_fdr">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(order_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							FDR-#fdr_id#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							&nbsp;
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							&nbsp;
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #FDR_id# and access = 1 and note_type = 'FDR'
				ORDER BY Note_ID ASC
			</CFQUERY>
							
							<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#fdr_id#&code=FDR" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_FDR.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#fdr_id#&a_trigger=1&code=FDR"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>
			
			
			
			
		 <CFLOOP QUERY="read_pr">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(order_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							PR-#pr_id#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							&nbsp;
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							&nbsp;
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #pr_id# and access = 1 and note_type = 'PR'
				ORDER BY Note_ID ASC
			</CFQUERY>
							
							<a href="./view_title_comments_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#pr_id#&code=PR" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_PR.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#pr_id#&a_trigger=1&code=PR"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>
	<TABLE><TR>
	<td width = 400 bgcolor="BFFFBF"  align=left valign=top>

					<p><font face="Arial, Helvetica, sans-serif" size="2">The <img src="./images/button_details.gif" border=0 ALT="View Order details"> button allows you to: </font></p>

 <ul><li><font face="Arial, Helvetica, sans-serif" size="2">View and print completed title committment</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View HUD-1 for instant fees</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Activate Endorsement Express* - instant endorsements</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View and print your Closing Protection Letter of request</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View scheduled closing information</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Check status of file</li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Upload documents to the site</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View or modify your orders.</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Contact your processing team</font></li>
</ul>






									</td>
				<td width = 400 bgcolor="BFFFBF"  align=center valign=top> <TABLE><TR><td width = 350 bgcolor="BFFFBF"  align=left valign=top><p><br><br>
<font face="Arial, Helvetica, sans-serif" size="2"><center><b>New Web System Highlights -</center></b><br><br>
11/03/03 - EXPANDED Comments System for orders - CLIENTS may now add their
own notes directly into existing product orders that will instantly transmit
to their First Title Client Services Team. Click "Add/View" in the Comments
area above to activate this new feature.</font>
				</p></td>
					</tr></TABLE>
				</td>
					</tr></TABLE>



		</table>


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




