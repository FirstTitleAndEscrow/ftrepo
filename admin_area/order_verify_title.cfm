<CFPARAM NAME="blastname1" DEFAULT="">
<CFPARAM NAME="thirdp" DEFAULT="">
<CFPARAM NAME="bfirstname1" DEFAULT="">
<CFPARAM NAME="bminame1" DEFAULT="">
<CFPARAM NAME="bssn1" DEFAULT="">
<CFPARAM NAME="bhphone1" DEFAULT="">
<CFPARAM NAME="bwphone1" DEFAULT="">
<CFPARAM NAME="bext1" DEFAULT="">
<CFPARAM NAME="blastname2" DEFAULT="">
<CFPARAM NAME="bfirstname2" DEFAULT="">
<CFPARAM NAME="bminame2" DEFAULT="">
<CFPARAM NAME="bssn2" DEFAULT="">
<CFPARAM NAME="bhphone2" DEFAULT="">
<CFPARAM NAME="bwphone2" DEFAULT="">
<CFPARAM NAME="bext2" DEFAULT="">
<CFPARAM NAME="slastname1" DEFAULT="">
<CFPARAM NAME="sfirstname1" DEFAULT="">
<CFPARAM NAME="sminame1" DEFAULT="">
<CFPARAM NAME="sssn1" DEFAULT="">
<CFPARAM NAME="shphone1" DEFAULT="">
<CFPARAM NAME="swphone1" DEFAULT="">
<CFPARAM NAME="sext1" DEFAULT="">
<CFPARAM NAME="slastname2" DEFAULT="">
<CFPARAM NAME="sfirstname2" DEFAULT="">
<CFPARAM NAME="sminame2" DEFAULT="">
<CFPARAM NAME="sssn2" DEFAULT="">
<CFPARAM NAME="shphone2" DEFAULT="">
<CFPARAM NAME="swphone2" DEFAULT="">
<CFPARAM NAME="sext2" DEFAULT="">
<CFPARAM NAME="paddress" DEFAULT="">
<CFPARAM NAME="pcity" DEFAULT="">
<CFPARAM NAME="pstate" DEFAULT="">
<CFPARAM NAME="pzip" DEFAULT="">
<CFPARAM NAME="pcounty" DEFAULT="">
<CFPARAM NAME="plegaldesc" DEFAULT="">
<CFPARAM NAME="prop_use_type" DEFAULT="">
<CFPARAM NAME="condo_pud" DEFAULT="">
<CFPARAM NAME="a_comment" DEFAULT="">
<CFPARAM NAME="polender1" DEFAULT="">
<CFPARAM NAME="poacctno1" DEFAULT="">
<CFPARAM NAME="file_upload" DEFAULT="">
<CFPARAM NAME="pophone1" DEFAULT="">
<CFPARAM NAME="polender2" DEFAULT="">
<CFPARAM NAME="poacctno2" DEFAULT="">
<CFPARAM NAME="pophone2" DEFAULT="">
<CFPARAM NAME="SearchType" DEFAULT="">
<CFPARAM NAME="purchase" DEFAULT="">
<CFPARAM NAME="Deedtransfer" DEFAULT="">
<CFPARAM NAME="Insured" DEFAULT="">
<CFPARAM NAME="otherpro" DEFAULT="">
<CFPARAM NAME="loanamt_float" DEFAULT="0">
<CFPARAM NAME="loan_type_111" DEFAULT="">
<CFPARAM NAME="loan_program_333" DEFAULT="">
<CFPARAM NAME="Verifyemail" DEFAULT="">
<CFPARAM NAME="Verifyemail_2" DEFAULT="">
<CFPARAM NAME="Verifyemail_3" DEFAULT="">
<CFPARAM NAME="fax_no" DEFAULT="">
<CFPARAM NAME="RptbyEmail" DEFAULT="">
<CFPARAM NAME="request_icl" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="loan_number" DEFAULT="0">
<CFPARAM NAME="secloan" DEFAULT="0">
<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="">
<CFPARAM NAME="merge2" DEFAULT="">
<CFPARAM NAME="merge3" DEFAULT="">
<CFPARAM NAME="merge1" DEFAULT="">
<CFPARAM NAME="thirdp" DEFAULT="">
<CFPARAM NAME="search_type" DEFAULT="B">
<CFPARAM NAME="ctc_name" DEFAULT="">
<CFPARAM NAME="ctc_comment" DEFAULT="THIS FILE WILL BE CLEARED BY">
<CFPARAM NAME="MaxRows" DEFAULT="1">
<CFPARAM NAME="StartRow" DEFAULT="1">

<!---Clear To Close Person that will be assigned this Order --->

<CFQUERY datasource="#request.dsn#" NAME="read_cleartoclse">
	Select Title_ID,cleartoclose, comp_id
	from Title
	where (cleartoclose Is Not Null)
	Order by Title_ID Desc
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
			SELECT *
			FROM companies
			WHERE ID = #read_cleartoclse.comp_id#
</CFQUERY>

<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_comp.team_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>
<CFOUTPUT QUERY="read_cleartoclse" StartRow="#StartRow#" MAXROWS="#MaxRows#">
	<CFIF #read_cleartoclse.cleartoclose# eq 'Marie'>
		<CFSET ctc_name = "JEAN">
	</CFIF>
	<CFIF #read_cleartoclse.cleartoclose# eq 'Jean'>
		<CFSET ctc_name = "CRAIG">
	</CFIF>
	<CFIF #read_cleartoclse.cleartoclose# eq 'Craig'>
		<CFSET ctc_name = "MARIE">
	</CFIF>
	<CFIF #read_cleartoclse.cleartoclose# eq ''>
		<CFSET ctc_name = "MARIE">
	</CFIF>
</cfoutput>
<CFSET ctc_comment = "THIS FILE WILL BE CLEARED BY " & #ctc_name#>

		<CFIF (#pstate# EQ "AL")>
			<CFIF (#pcounty# EQ "Cherokee") OR (#pcounty# EQ "Colbert")  OR (#pcounty# EQ "Dekalb") OR (#pcounty# EQ "Etowah") OR (#pcounty# EQ "Franklin") OR (#pcounty# EQ "Jackson") OR (#pcounty# EQ "Lauderdale") OR (#pcounty# EQ "Lawrence") OR (#pcounty# EQ "Limestone") OR (#pcounty# EQ "Madison") OR (#pcounty# EQ "Marion") OR (#pcounty# EQ "Marshall") OR (#pcounty# EQ "Winston")>
					<CFSET a_tble_to_read = "StateAlabamaMetro">
					<CFELSE>
					<CFSET a_tble_to_read = "StateAlabamaState">
				</CFIF>
				<CFELSEIF #pstate# EQ "AR">
					<CFSET a_tble_to_read = "StateArkansas">
					<CFELSEIF #pstate# EQ "MT">
					<CFSET a_tble_to_read = "Montana">
						<CFELSEIF #pstate# EQ "AK">
					<CFSET a_tble_to_read = "Alaska">
				<CFELSEIF #pstate# EQ "AZ">
					<CFIF (#pcounty# EQ "Maricopa") OR  (#pcounty# EQ "Pima") OR  (#pcounty# EQ "Pinal")>
						<CFSET a_tble_to_read = "StateArizonaZone1">
					<CFelseIF (#pcounty# EQ "Coconino")>
						<CFSET a_tble_to_read = "StateArizonaZone2">
					<CFelseIF (#pcounty# EQ "Cochise")>
						<CFSET a_tble_to_read = "StateArizonaZone3">
					<CFelseIF (#pcounty# EQ "Yavapai")>
						<CFSET a_tble_to_read = "StateArizonaZone4">
					<CFelseIF (#pcounty# EQ "Mohave")>
						<CFSET a_tble_to_read = "StateArizonaZone5">
					<cfelse>
						<CFSET a_tble_to_read = "StateArizona">
					</CFIF>


				<CFELSEIF #pstate# EQ "CT">
					<CFSET a_tble_to_read = "StateConnecticut">
				<CFELSEIF #pstate# EQ "CO">
					<CFIF (#pcounty# EQ "Adams") OR  (#pcounty# EQ "Arapahoe") OR  (#pcounty# EQ "Broomfield") OR  (#pcounty# EQ "Clear Creek") OR  (#pcounty# EQ "Denver") OR  (#pcounty# EQ "Douglas") OR  (#pcounty# EQ "Elbert") OR  (#pcounty# EQ "Jefferson")>
						<CFSET a_tble_to_read = "StateColoradoZone1">
					<CFelseIF (#pcounty# EQ "Alamosa") OR  (#pcounty# EQ "Conejos") OR  (#pcounty# EQ "Rio Grande") OR  (#pcounty# EQ "Saguache")>
						<CFSET a_tble_to_read = "StateColoradoZone2">
					<CFelseIF (#pcounty# EQ "Archuleta") OR (#pcounty# EQ "Mineral")>
						<CFSET a_tble_to_read = "StateColoradoZone3">
					<CFelseIF (#pcounty# EQ "Boulder")>
						<CFSET a_tble_to_read = "StateColoradoZone4">
					<CFelseIF (#pcounty# EQ "Chaffee")>
						<CFSET a_tble_to_read = "StateColoradoZone5">
					<CFelseIF (#pcounty# EQ "Custer") OR (#pcounty# EQ "Fremont")>
						<CFSET a_tble_to_read = "StateColoradoZone6">
					<CFelseIF (#pcounty# EQ "Dolorse") OR (#pcounty# EQ "LaPlata") OR (#pcounty# EQ "Montezuma")>
						<CFSET a_tble_to_read = "StateColoradoZone7">
					<CFelseIF (#pcounty# EQ "Eagle") OR (#pcounty# EQ "Garfield") OR (#pcounty# EQ "Grand") OR (#pcounty# EQ "Jackson") OR (#pcounty# EQ "Pitkin") OR (#pcounty# EQ "Routt")>
						<CFSET a_tble_to_read = "StateColoradoZone8">
					<CFelseIF (#pcounty# EQ "El Paso")>
						<CFSET a_tble_to_read = "StateColoradoZone9">
					<CFelseIF (#pcounty# EQ "Moffatt")>
						<CFSET a_tble_to_read = "StateColoradoZone10">
					<CFelseIF (#pcounty# EQ "Larimer")>
						<CFSET a_tble_to_read = "StateColoradoZone11">
					<CFelseIF (#pcounty# EQ "Montrose") OR (#pcounty# EQ "Ouray")>
						<CFSET a_tble_to_read = "StateColoradoZone12">
					<CFelseIF (#pcounty# EQ "Phillips")>
						<CFSET a_tble_to_read = "StateColoradoZone13">
					<CFelseIF (#pcounty# EQ "Pueblo")>
						<CFSET a_tble_to_read = "StateColoradoZone14">
					<CFelseIF (#pcounty# EQ "Rio Blanco")>
						<CFSET a_tble_to_read = "StateColoradoZone15">
					<CFelseIF (#pcounty# EQ "Weld")>
						<CFSET a_tble_to_read = "StateColoradoZone16">
					<cfelse>
						<CFSET a_tble_to_read = "StateColoradoZone17">
					</CFIF>
					<CFELSEIF #pstate# EQ "DC">
					<CFSET a_tble_to_read = "StateDistrictColombia">
				<CFELSEIF #pstate# EQ "DE">
					<CFSET a_tble_to_read = "StateDelaware">
				<CFELSEIF #pstate# EQ "FL">
					<CFSET a_tble_to_read = "StateFlorida">
				<CFELSEIF #pstate# EQ "GA">
					<CFIF (#pcounty# EQ "Fulton") OR (#pcounty# EQ "Cobb")  OR (#pcounty# EQ "Clayton") OR (#pcounty# EQ "Cherokee") OR (#pcounty# EQ "Dekalb") OR (#pcounty# EQ "Gwinnett") OR (#pcounty# EQ "Henry") OR (#pcounty# EQ "Douglas") OR (#pcounty# EQ "Forsyth") OR (#pcounty# EQ "Paulding") OR (#pcounty# EQ "Carroll")>
					<CFSET a_tble_to_read = "StateGeorgiaMetro">
					<CFELSE>
					<CFSET a_tble_to_read = "StateGeorgiaState">
				</CFIF>
				<CFELSEIF #pstate# EQ "IA">
					<CFSET a_tble_to_read = "StateIowa">
				<CFELSEIF #pstate# EQ "IL">
					<CFSET a_tble_to_read = "StateIllinois">
				<CFELSEIF #pstate# EQ "IN">
					<CFSET a_tble_to_read = "StateIndiana">
				<CFELSEIF #pstate# EQ "KS">
					<CFSET a_tble_to_read = "StateKansas">
				<CFELSEIF #pstate# EQ "KY">
					<CFSET a_tble_to_read = "StateKentucky">
				<CFELSEIF #pstate# EQ "LA">
					<CFSET a_tble_to_read = "StateLouisianna">
				<CFELSEIF #pstate# EQ "ME">
					<CFSET a_tble_to_read = "StateMaine">
				<CFELSEIF #pstate# EQ "MD">
					<CFSET a_tble_to_read = "StateMaryland">
				<CFELSEIF #pstate# EQ "MA">
					<CFSET a_tble_to_read = "StateMassachusetts">
				<CFELSEIF #pstate# EQ "MI">
					<CFIF (#pcounty# EQ "Allegan") OR (#pcounty# EQ "Barry")  OR (#pcounty# EQ "Clinton") OR (#pcounty# EQ "Eaton") OR (#pcounty# EQ "Grand Traverse") OR (#pcounty# EQ "Ingham") OR (#pcounty# EQ "Ionia") OR (#pcounty# EQ "Kent") OR (#pcounty# EQ "Leelanau") OR (#pcounty# EQ "Montcalm") OR (#pcounty# EQ "Muskegon") OR (#pcounty# EQ "Newaygo") OR (#pcounty# EQ "Ottawa")>
					<CFSET a_tble_to_read = "StateMichiganZone2">
					<CFELSEIF #pcounty# eq "Wayne">
			        <CFSET a_tble_to_read = "StateMichiganZone3">
					<CFELSE>
					<CFSET a_tble_to_read = "StateMichiganZone1">
				</CFIF>
				<CFELSEIF #pstate# EQ "MN">
					<CFSET a_tble_to_read = "StateMinnesota">
				<CFELSEIF #pstate# EQ "MS">
					<CFSET a_tble_to_read = "StateMississipi">
				<CFELSEIF #pstate# EQ "MO">
					<CFSET a_tble_to_read = "StateMissouri">
				<CFELSEIF #pstate# EQ "NJ">
					<CFSET a_tble_to_read = "StateNewJersey">
				<CFELSEIF #pstate# EQ "NC">
					<CFSET a_tble_to_read = "StateNorthCarolina">
					<CFELSEIF #pstate# EQ "ND">
					<CFSET a_tble_to_read = "StateNorthDakota">
				<CFELSEIF #pstate# EQ "NH">
					<CFSET a_tble_to_read = "StateNewHampshire">
				<CFELSEIF #pstate# EQ "NY">
					<CFIF (#pcounty# EQ "Albany") OR (#pcounty# EQ "Bronx")  OR (#pcounty# EQ "Columbia") OR (#pcounty# EQ "Dutchess") OR (#pcounty# EQ "Greene") OR (#pcounty# EQ "Kings") OR (#pcounty# EQ "Nassau") OR (#pcounty# EQ "New York") OR (#pcounty# EQ "Orange") OR (#pcounty# EQ "Putnam") OR (#pcounty# EQ "Queens") OR (#pcounty# EQ "Rensselaer") OR (#pcounty# EQ "Richmond") OR (#pcounty# EQ "Rockland") OR (#pcounty# EQ "Suffolk") OR (#pcounty# EQ "Sullivan") OR (#pcounty# EQ "Westchester") OR (#pcounty# EQ "Ulster")>
					<CFSET a_tble_to_read = "StateNewYorkZone2">
					<CFELSE>
					<CFSET a_tble_to_read = "StateNewYorkZone1">
				</CFIF>
				<CFELSEIF #pstate# EQ "OH">
					<CFSET a_tble_to_read = "StateOhio">
				<CFELSEIF #pstate# EQ "PA">
					<CFSET a_tble_to_read = "StatePennsylvania">
				<CFELSEIF #pstate# EQ "RI">
					<CFSET a_tble_to_read = "StateRhodeIsland">
				<CFELSEIF #pstate# EQ "SC">
					<CFSET a_tble_to_read = "StateSouthCarolina">
				<CFELSEIF #pstate# EQ "TN">
					<CFIF (#pcounty# EQ "Davidson")>
						<CFSET a_tble_to_read = "StateTennesseeZone1">
					<CFelseIF (#pcounty# EQ "Hamilton")>
						<CFSET a_tble_to_read = "StateTennesseeZone2">
					<CFelseIF (#pcounty# EQ "Knox")>
						<CFSET a_tble_to_read = "StateTennesseeZone3">
					<CFelseIF (#pcounty# EQ "Shelby")>
						<CFSET a_tble_to_read = "StateTennesseeZone4">
					<cfelse>
						<CFSET a_tble_to_read = "StateTennessee">
					</CFIF>
				<CFELSEIF #pstate# EQ "VT">
					<CFSET a_tble_to_read = "StateVermont">
				<CFELSEIF #pstate# EQ "VA">
					<CFSET a_tble_to_read = "StateVirginia">
					<CFELSEIF #pstate# EQ "WI">
					<CFSET a_tble_to_read = "StateWisconsin">
				<CFELSEIF #pstate# EQ "WV">
					<CFSET a_tble_to_read = "StateWestVirginia">
				</CFIF>


				<!--- Round up the value of the loan amount --->

					<!--- remove any potential decimal values --->
						 <CFSET   x  = #Round(loanamt_float)#>

					 <CFSET   x_len  = #Len(x)#>
						<CFIF #x_len# EQ "3">
							<CFSET x_temp = #x# / 10>
							<CFSET   x_final  = #Round(x_temp)# * 10>
						<CFELSEIF #x_len# EQ "4">
							<CFSET x_temp = #x# / 100>
							<CFSET   x_final  = #Round(x_temp)# * 100>
						<CFELSEIF #x_len# EQ "5">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>
						<CFELSEIF #x_len# EQ "6">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>
						<CFELSEIF #x_len# EQ "7">
							<CFSET x_temp = #x# / 10000>
							<CFSET   x_final  = #Round(x_temp)# * 10000>
					<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->

				<cfif #pstate# neq "CA" AND #pstate# neq "MT" AND #pstate# neq "WY" AND #pstate# neq "AK">

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
	  order by a_to
      </CFQUERY>

					<cfelse>

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc">
						SELECT *
						FROM StateWisconsin
						WHERE 0 = 0
					</CFQUERY>

					</cfif>

<CFQUERY datasource="#request.dsn#" NAME="check_order">
	SELECT *
	FROM title
	WHERE (bfirstname1 = '#bfirstname1#') AND (blastname1= '#blastname1#') AND (bssn1 = '#bssn1#') AND (loanamt_float = '#loanamt_float#') AND (paddress = '#paddress#') AND (codeT is not null) AND (DATEDIFF(day, check_date, getdate()) < 30)

</CFQUERY>


<cfif (#check_order.recordcount# GT "0")>


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


		<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
<title>1st Title & Escrow, Inc. - Title Request Form</title>
</head>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

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
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')';return false;"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>
				<p>	<center>
	<table width="770">

	<tr><td align=center colspan = 2 valign=bottom width = "700">
<FONT FACE=ARIAL SIZE=2 color="red">
	<br><br>
<center><B>OUR RECORDS INDICATE THAT YOU HAVE RECENTLY ORDERED A TITLE WITH US!
</B><br><br><FONT FACE=ARIAL SIZE=2 color="blue">Click below to be redirected to the main menu. </center> </td></tr>


	<br><br><br>

/td></tr>
<tr><td align=center valign=bottom width = "700">
<cfoutput>
		<NOBR><a href="./client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0 ALT="Return to main menu"></a>
			</NOBR>
			</cfoutput>
			</td>



</tr>
</table></center>		</p>



		<tr><td width=780 align=center valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TABLE>
</td></tr></TBODY></TABLE>
</CENTER>
</BODY>
</html>
<cfelse>


<!--- here is where we check to see what time it is    --->
<!--- when this order was submitted.  Because if it    --->
<!--- was submitted after 3:00 pm, then we count it    --->
<!--- as having been submitted at 8:30 am the next day --->

	<CFSET c_day_no = #DayOfWeek(Now())#>
	<CFSET c_day_number = #Day(Now())#>
	<CFSET c_month_no = #Month(Now())#>
	<CFSET c_year_no = #Year(Now())#>

	<CFIF #TimeFormat(Now(), "HH:mm:ss")# GT "15:00:00">
		<CFSET order_date_adjusted = #c_day_number# & "-" & #c_month_no# & "-" & #c_year_no# >

				<CFIF #c_day_no# EQ "6">

					<CFSET a_add_days = "3">

				<CFELSEIF #c_day_no# EQ "7">

					<CFSET a_add_days = "2">

				<CFELSE>

					<CFSET a_add_days = "1">

				</CFIF>

		<CFSET order_date_adj = #DateAdd("d", "#a_add_days#", order_date_adjusted)#>

		<CFSET order_date_adj = #DateFormat(order_date_adj, "d-mmm-yy")# & " " &  "8:30:00">

	<CFELSE>

		<CFSET order_date_adj = #DateFormat(Now(), "d-mmm-yy")# & " " &  #TimeFormat(Now(), "HH:mm:ss")#>

	</CFIF>






<!---------- BEG FORMATTING FOR DUE DATE -------------->

<CFOUTPUT>
<CFSET dat = #DateFormat(Now())#>


	<!--- strip out day month and year from string --->
	<CFSET dat_1 = #ListToArray(dat, "-")#>
	<CFSET count=1>
	<CFLOOP FROM="1" TO="#ArrayLen(dat_1)#" INDEX="sss">
		<CFIF count EQ 1>
			<CFSET newdat = #dat_1[sss]#>
		<CFELSEIF count EQ 2>
			<CFSET newmon = #dat_1[sss]#>
		<CFELSEIF count EQ 3>
			<CFSET newyear = #dat_1[sss]#>
		<CFELSE><!---do nothing--->
		</CFIF>

		<CFSET count = #count# + 1>
	</CFLOOP>

	<!--- convert Month word to number --->
	<CFIF '#newmon#' EQ 'Jan'><CFSET newmon = '01'>
	<CFELSEIF '#newmon#' EQ 'Feb'><CFSET newmon = '02'>
	<CFELSEIF '#newmon#' EQ 'Mar'><CFSET newmon = '03'>
	<CFELSEIF '#newmon#' EQ 'Apr'><CFSET newmon = '04'>
	<CFELSEIF '#newmon#' EQ 'May'><CFSET newmon = '05'>
	<CFELSEIF '#newmon#' EQ 'Jun'><CFSET newmon = '06'>
	<CFELSEIF '#newmon#' EQ 'Jul'><CFSET newmon = '07'>
	<CFELSEIF '#newmon#' EQ 'Aug'><CFSET newmon = '08'>
	<CFELSEIF '#newmon#' EQ 'Sep'><CFSET newmon = '09'>
	<CFELSEIF '#newmon#' EQ 'Oct'><CFSET newmon = '10'>
	<CFELSEIF '#newmon#' EQ 'Nov'><CFSET newmon = '11'>
	<CFELSE><CFSET newmon = '12'></CFIF>
</CFOUTPUT>


	<CFSET today = #CreateDate(#newyear#, #newmon#, #newdat#)#>
	<CFSET num_day = #DatePart('W', #today#)#>
	<!--- note: Sun = 1
				Mon = 2
				Tue = 3
				Wed = 4
				Thu = 5
				Fri = 6
				Sat = 7 --->

	<!--------------------------->
	<!--- Fourth Business Day --->
	<!--------------------------->

	<CFIF #num_day# EQ 1>
	<!--- If it's Sunday, 4th bus day is a Thursday (+4) --->
		<CFSET add_day = #DateAdd('D', 4, #today#)#>
	<CFELSEIF #num_day# EQ 2>
	<!--- If it's a Monday, 4th bus day is a Friday (+4) --->
		<CFSET add_day = #DateAdd('D', 4, #today#)#>
	<CFELSEIF #num_day# EQ 3>
	<!--- If it's a Tuesday, 4th bus day is a Monday (+6) --->
		<CFSET add_day = #DateAdd('D', 6, #today#)#>
	<CFELSEIF #num_day# EQ 4>
	<!--- If it's a Wednesday, 4th bus day is a Tuesday (+6) --->
		<CFSET add_day = #DateAdd('D', 6, #today#)#>
	<CFELSEIF #num_day# EQ 5>
	<!--- If it's a Thursday, 4th bus day is a Wednesday (+6) --->
		<CFSET add_day = #DateAdd('D', 6, #today#)#>
	<CFELSEIF #num_day# EQ 6>
	<!--- If it's a Friday, 4th bus day is a Thursday (+6) --->
		<CFSET add_day = #DateAdd('D', 6, #today#)#>
	<CFELSE>
	<!--- It's a Saturday, 4th bus day is a Thursday (+5) --->
		<CFSET add_day = #DateAdd('D', 5, #today#)#>
	</CFIF>



	<CFSET duedate = #DateFormat(#add_day#, "dd-mmm-yy")#>



<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>


<!---------- END FORMATTING FOR DUE DATE -------------->


<CFSET oda_day_1 = #Day(order_date_adj)#>
<CFSET oda_month_1 = #Month(order_date_adj)#>
<CFSET oda_year_1 = #Year(order_date_adj)#>
<CFSET oda_day_of_year_1 = #DayOfYear(order_date_adj)#>


<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
<!--- <CFSET a_day_1 = #Day(a_insert_date)#> --->
<CFSET a_day_1 = #DateFormat(Now(), "dd")#>
<CFSET a_month_1 = #DateFormat(Now(), "mm")#>
<CFSET a_year_1 = #DateFormat(Now(), "yyyy")#>
<CFSET a_day_of_year_1 = #DayOfYear(a_insert_date)#>

<!---------- END FORMATTING FOR DUE DATE



<table width=455 border="1" cellspacing="0" cellpadding="3" align="center">

<tr align="middle" valign="center">
<td><font size=3><b>NOTE</b></font></td>
</TR>
<TR><P>

<td align=CENTER> <font size=2 face=arial> Our records indicate that we have recently received this order</td>
</tr>

</table>


-------------->


<CFQUERY datasource="#request.dsn#" NAME="RU">
	SELECT *
	FROM users
	WHERE ID = #user_id_1#
</CFQUERY>

	<CFSET ru_name = #RU.lp_fname# & #RU.lp_lname#>

		<CFQUERY datasource="#request.dsn#" NAME="RLO">
			SELECT *
			FROM loan_officers
			WHERE ID = #lo_id#
		</CFQUERY>

			<CFSET rlo_name = #RLO.lo_fname# & #RLO.lo_lname#>

			<!--- <CFIF #do_appraisal# EQ "No">
				<CFSET app_stat = "">
			<CFELSE>

			</CFIF> --->
			<CFSET app_stat = "In Process">

			<!--- <CFIF #Insured# EQ "Other">
			<CFSET pro_insured = #form.otherpro#>
			<cfelse>
			<CFSET pro_insured = #Insured#>
			</cfif> --->
			<CFSET order_date = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
	<CFIF #URL.Title# eq "1">
		<CFIF #SearchType# eq "Purchase">
			<CFSET #search_type# = "B">
		<CFELSE>
			<CFSET #search_type# = "A">
		</CFIF>
	</CFIF>

	<cfquery  datasource="#request.dsn#">
			INSERT INTO
				TITLE (proptype,dateandtime, hud_type, piggy, ins, secloan, loan_number, check_date, check_time, user_id, comp_id, loan_off_id, oname, ophone, oext, ofax, o_email, pname,
						pphone, pext, pfax, p_email, blastname1, bfirstname1, bminame1, bssn1,
						bhphone1, bwphone1, bext1, blastname2, bfirstname2, bminame2, bssn2,
						bhphone2, bwphone2, bext2, slastname1, sfirstname1, sminame1, sssn1,
						shphone1, swphone1, sext1, slastname2, sfirstname2, sminame2, sssn2,
						shphone2, swphone2, sext2, paddress, pcity, pstate, pzip, pcounty, plegaldesc, condo_pud, a_comment, verifyemail, verifyemail_2, verifyemail_3, fax_no,
						rptbyemail, a_insert_date, a_insert_time, duedate, request_icl,  order_date_adjusted, oda_day, oda_month, oda_year, oda_day_of_year, appraisal_status, a_day, a_month, a_year, a_day_of_year, polender1, poacctno1, pophone1, polender2, poacctno2, pophone2, order_status, SearchType, purchase, Deedtransfer, Insured, loanamt_float, loan_type_111, loan_program_333, thirdp, prop_use_type, codeT,search_type,cleartoclose)
				VALUES ('#proptype#','#order_date#', '#hud_type#', '#piggy#', '#ins#', '#secloan#', '#loan_number#', '#DateFormat(Now(), "mm-dd-yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', #user_id_1#, #RU.comp_id#,	#lo_id#, '#rlo_name#', '#RLO.lo_phone#',
				 		'#RLO.lo_ext#', '#RLO.lo_fax#', '#RLO.lo_email#', '#ru_name#', '#RU.lp_phone#', '#RU.lp_ext#', '#RU.lp_fax#', '#RU.lp_email#', '#blastname1#', '#bfirstname1#', '#bminame1#',
						'#bssn1#', '#bhphone1#', '#bwphone1#', '#bext1#', '#blastname2#', '#bfirstname2#', '#bminame2#', '#bssn2#', '#bhphone2#', '#bwphone2#', '#bext2#', '#slastname1#', '#sfirstname1#', '#sminame1#', '#sssn1#', '#shphone1#', '#swphone1#', '#sext1#', '#slastname2#', '#sfirstname2#', '#sminame2#', '#sssn2#', '#shphone2#', '#swphone2#', '#sext2#', '#paddress#', '#pcity#', '#pstate#', '#pzip#', '#pcounty#', '#plegaldesc#', '#condo_pud#', '#a_comment#', '#verifyemail#', '#verifyemail_2#', '#verifyemail_3#', '#fax_no#',
						'#rptbyemail#', '#a_insert_date#', '#a_insert_time#', '#duedate#', '#request_icl#',
						'#order_date_adj#', #a_day_1#, #a_month_1#, #a_year_1#, #oda_day_of_year_1#, '#app_stat#', #a_day_1#, #a_month_1#, #a_year_1#,	#a_day_of_year_1#, '#polender1#', '#poacctno1#', '#pophone1#', '#polender2#', '#poacctno2#', '#pophone2#', 1, '#SearchType#', '#purchase#', '#Deedtransfer#', '#Insured#', '#loanamt_float#', '#loan_type_111#', '#loan_program_333#', '#thirdp#', '#prop_use_type#', 'T','#search_type#','#ctc_name#')
						</cfquery>
		<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
	SELECT *
	FROM TITLE
	WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
</CFQUERY>

<!---Insert Clear To Close Person Note in system--->
<cfquery  datasource="#request.dsn#">
	INSERT INTO
				TITLE_NOTES (fname,lname,n_date,n_time,order_id,n_note,note_type,status)
				Values ('System','Web','#a_insert_date#','#a_insert_time#','#get_titleid.title_ID#','#ctc_comment#','T','1')
</CFQUERY>
<cfif #file_upload# NEQ "">
<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			UPDATE title
			SET payoff_upload = '#new_file_name#'
			WHERE title_id = #get_titleid.Title_ID#
			</cfquery>
		</cfif>

<cftry>		
<CFQUERY datasource="#request.dsn#" NAME="lookup_company">
SELECT *
FROM companies
WHERE ID = '#ru.comp_id#'
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="lookup_team">
	SELECT email
	from Teams where
	ID =  #lookup_company.team_id#
</CFQUERY>
<cfmail to="#lookup_team.email#" from="webmaster@firsttitleservices.com" subject="New Order Placed">
	A new order was placed in the system, TitleID ## #get_titleid.Title_ID#
</cfmail>
<cfcatch type="any">
</cfcatch>
</cftry>
		<!--- ============================================== --->
		<!--- ===/    Insert the Default Data into the  \=== --->
		<!--- ===/    Title Order Request Form          \=== --->

			<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Closing_Order_Request(Title_ID, a_sent_by, a_filled_out_by)
				VALUES(#get_titleid.Title_ID#, 0, 0)
			</CFQUERY>

			<CFQUERY datasource="#request.dsn#">
				INSERT INTO eventlist(Title_ID)
				VALUES(#get_titleid.Title_ID#)
			</CFQUERY>
		<!--- ===/ GENERATE AN ENTRY IN THE TAX CERT TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO tax_cert_title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>

		<!--- ============================================== --->




<CFQUERY datasource="#request.dsn#" NAME="read_abstractors">

			SELECT *
			FROM Abstractors_county
			where st_abbrev = '#pstate#' AND UPPER(ct_name) = UPPER('#pcounty#') AND abstractor_id = abstractor_id


		</CFQUERY>

		<cfset st_list_current = ValueList(read_abstractors.abstractor_id)>


			<cfif ListContainsNoCase(st_list_current, "184") is not 0>

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id, abstractor_id, a_assigned_by, a_Date_Assigned, a_Time_Assigned, company,search_type)
				VALUES(#get_titleid.title_id#, 184, 67, '#DateFormat(Now(), "mm/dd/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'First Title In House','#search_type#')
				</CFQUERY>
	<cfelseif  ListContainsNoCase(st_list_current, "520") is not 0>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id, abstractor_id, a_assigned_by, a_Date_Assigned, a_Time_Assigned, company,search_type)
				VALUES(#get_titleid.title_id#, 520, 67, '#DateFormat(Now(), "mm/dd/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'Colorado Records Sooner','#search_type#')
				</CFQUERY>


		<cfelseif  ListContainsNoCase(st_list_current, "960") is not 0>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id, abstractor_id, a_assigned_by, a_Date_Assigned, a_Time_Assigned, company,search_type)
				VALUES(#get_titleid.title_id#, 960, 67, '#DateFormat(Now(), "mm/dd/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'Flagship Title Services','#search_type#')
				</CFQUERY>


			<cfelseif  ListContainsNoCase(st_list_current, "1021") is not 0>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id, abstractor_id, a_assigned_by, a_Date_Assigned, a_Time_Assigned, company,search_type)
				VALUES(#get_titleid.title_id#, 1021, 67, '#DateFormat(Now(), "mm/dd/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'G-DOCS','#search_type#')
				</CFQUERY>


			<cfelseif  ListContainsNoCase(st_list_current, "555") is not 0>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id, abstractor_id, a_assigned_by, a_Date_Assigned, a_Time_Assigned, company,search_type)
				VALUES(#get_titleid.title_id#, 555, 67, '#DateFormat(Now(), "mm/dd/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'MOHR INFORMATION','#search_type#')
				</CFQUERY>

					<cfelseif  ListContainsNoCase(st_list_current, "575") is not 0>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id, abstractor_id, a_assigned_by, a_Date_Assigned, a_Time_Assigned, company,search_type)
				VALUES(#get_titleid.title_id#, 575, 67, '#DateFormat(Now(), "mm/dd/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'Prosearch Information Retrieval. Inc','#search_type#')
				</CFQUERY>


					<cfelseif  ListContainsNoCase(st_list_current, "964") is not 0>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id, abstractor_id, a_assigned_by, a_Date_Assigned, a_Time_Assigned, company,search_type)
				VALUES(#get_titleid.title_id#, 964, 67, '#DateFormat(Now(), "mm/dd/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'Property Insight','#search_type#')
				</CFQUERY>

	<cfelse>


	<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id,search_type)
				VALUES(#get_titleid.title_id#,'#search_type#')
			</CFQUERY>
</cfif>





		<!--- ============================================== --->


	<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 1  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_1_Title(title_id, pa_dateandtime)
				VALUES(#get_titleid.title_id#, '#order_date#')

			</CFQUERY>


	<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 2  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_2_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>

	<!--- ===/ GENERATE AN ENTRY IN THE Doc_Amer_Title_Fla_Title  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Closer_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>



			<!--- <CFIF (#pstate# EQ "AL") OR (#pstate# EQ "AR") or (#pstate# EQ "AZ") or (#pstate# EQ "MT") or (#pstate# EQ "CA") or (#pstate# EQ "CO") or (#pstate# EQ "CT") or (#pstate# EQ "DE") or (#pstate# EQ "GA") or (#pstate# EQ "IA") or (#pstate# EQ "IN") or (#pstate# EQ "KS") or (#pstate# EQ "KY") or (#pstate# EQ "LA") or (#pstate# EQ "MA") or (#pstate# EQ "ME") or (#pstate# EQ "MN") or (#pstate# EQ "MO") or (#pstate# EQ "MS") or (#pstate# EQ "NC") or (#pstate# EQ "ND") or (#pstate# EQ "NH") or (#pstate# EQ "NY") or (#pstate# EQ "OH") or (#pstate# EQ "PA") or (#pstate# EQ "RI") or (#pstate# EQ "SC") or (#pstate# EQ "TN") or (#pstate# EQ "VT") or (#pstate# EQ "WI") or (#pstate# EQ "WV")  or (#pstate# EQ "MI") or (#pstate# EQ "NJ")>



				<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
				VALUES(#get_titleid.title_id#, 15)

			</CFQUERY>
		<cfelseif (#pstate# EQ "DC") OR (#pstate# EQ "MD") or (#pstate# EQ "IL") or (#pstate# EQ "VA")>

				<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
				VALUES(#get_titleid.title_id#, 16)

			</CFQUERY>
			<CFELSE>
			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
				VALUES(#get_titleid.title_id#, 14)

			</CFQUERY>
			</CFIF> --->
	<CFQUERY datasource="#request.dsn#" NAME="find_Title_Companies">
			SELECT *
			FROM Title_Companies_States
			WHERE state = #pstate#
			ORDER BY st_abbrev ASC
		    </CFQUERY>

			<cfif find_title_companies.recordcount>
			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
				VALUES(#get_titleid.title_id#, #find_title_companies.title_co_id#)
			</CFQUERY>
			<cfelse>
			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
				VALUES(#get_titleid.title_id#, 14)
			</CFQUERY>
			</cfif>

		<!--- ============================================== --->
		<!--- ===/    Make Calculations for Insurance   \=== --->
		<!--- ===/    and Recording Fees                \=== --->


		<!--- ============================================== --->
		<!--- ===/ Insert this data into the HUD Tables \=== --->


			<CFSET b_name_5 = #bfirstname1# & " " & #bminame1# & " " & #blastname1#>
			<CFSET s_name_5 = #sfirstname1# & " " & #sminame1# & " " & #slastname1#>
			<CFSET l_name_5 = #sfirstname1# & " " & #sminame1# & " " & #slastname1#>

			 <CFSET property_address = #paddress# & " " & #pcity# & " " & #pstate# & " " & #pzip# & " " & " -- " & #pcounty#>

			<CFIF #SearchType# EQ "Refinance">

				<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#pstate#'

					<CFIF (#pstate# EQ "MD") OR (#pstate# EQ "DE") OR (#pstate# EQ "NY")>
						AND county = '#pcounty#'
					</CFIF>
				</CFQUERY>


			<CFELSE>

				<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#pstate#'

					<CFIF (#pstate# EQ "MD") OR (#pstate# EQ "DE") OR (#pstate# EQ "NY")>
						AND county = '#pcounty#'
					</CFIF>
				</CFQUERY>

			</CFIF>

		<CFIF (#pstate# EQ "MD") OR (#pstate# EQ "DE") OR (#pstate# EQ "NY")>

				<CFIF #read_rec_fees.recordcount# gt "0">
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
							<CFSET state_mort_stamps = "0">
							<cfif #get_titleid.piggy# eq 1>
							<CFSET piggy_city_mort_stamps = #round(secloan)# * #read_rec_fees.mort_stamps#>
							<CFSET loan_city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
							<CFSET city_mort_stamps = #piggy_city_mort_stamps# + #loan_city_mort_stamps#>
							<cfelse>
							<CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
							</cfif>
						<CFELSE>
							<CFSET state_mort_stamps = "0">
							<CFSET city_mort_stamps = "0">
							<CFSET loan_city_mort_stamps = "0">
							<CFSET piggy_city_mort_stamps = "0">
						</CFIF>
				<CFELSE>
							<CFSET state_mort_stamps = "0">
							<CFSET city_mort_stamps = "0">
							<CFSET loan_city_mort_stamps = "0">
							<CFSET piggy_city_mort_stamps = "0">
				</CFIF>


		<CFELSE>
				<CFIF #read_rec_fees.recordcount# gt "0">
					<CFIF #read_rec_fees.mort_stamps# NEQ "0">
							<CFSET state_mort_stamps = "0">
							<cfif #get_titleid.piggy# eq 1>
							<CFSET piggy_city_mort_stamps = #round(secloan)# * #read_rec_fees.mort_stamps#>
							<CFSET loan_city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
							<CFSET city_mort_stamps = #piggy_city_mort_stamps# + #loan_city_mort_stamps#>
							<cfelse>
							<CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
							<CFSET loan_city_mort_stamps = "">
							<CFSET piggy_city_mort_stamps = "">
							</cfif>
						<CFELSE>
						<CFSET state_mort_stamps = "0">
						<CFSET city_mort_stamps = "0">
						<CFSET loan_city_mort_stamps = "0">
							<CFSET piggy_city_mort_stamps = "0">
					</CFIF>
				<CFELSE>
					<CFSET state_mort_stamps = "0">
					<CFSET city_mort_stamps = "0">
					<CFSET loan_city_mort_stamps = "0">
							<CFSET piggy_city_mort_stamps = "0">
						</CFIF>
					</CFIF>

			<CFIF (#SearchType# NEQ "Refinance") AND (#SearchType# NEQ "New Second Mortgage")>
				<cfif #read_rec_fees.recordcount# gt 0>
				<cfif #read_rec_fees.transfer_tax# neq 0>

				<cfif #pstate# eq "NJ">
				<cfif #purchase# LTE "150000">
				<CFSET state_deed_1 = #purchase# * 0.004>

				<cfELSEif #purchase# GT "150000" and #purchase# LTE "200000">
				<CFSET temp1 = #purchase# * 0.004>
				<CFSET temp2 = #purchase# - 150000>
				<CFSET temp3 = #temp2# * 0.0067>
				<CFSET state_deed_1 = #temp1# + #temp3#>

				<cfELSEif #purchase# GT "200000">

				<CFSET temp1 = #purchase# * 0.004>
				<CFSET temp2 = #purchase# - 150000>
				<CFSET temp3 = #temp2# * 0.0067>
				<CFSET temp4 = #temp1# + #temp3#>
				<CFSET temp6 = #purchase# - 200000>
				<CFSET temp7 = #temp6# * 0.0078>
				<CFSET state_deed_1 = #temp4# + #temp7#>

				<CFELSE>
				</CFIF>
				<CFELSE>
				<CFSET state_deed_1 = #purchase# * #read_rec_fees.transfer_tax#>
				</CFIF>
				<cfelse>
				<CFSET state_deed_1 = 0>
				</cfif>
			<cfelse>
				<CFSET state_deed_1 = 0>
				</cfif>
				<CFSET a_1203_line_total = #state_deed_1# + #state_mort_stamps#>
			<CFELSE>
				<CFSET state_deed_1 = "0">
				<CFSET a_1203_line_total =  #state_mort_stamps#>
			</CFIF>







<CFQUERY datasource="#request.dsn#" NAME="read_comp">
SELECT *
FROM companies
WHERE id = '#comp_id#'
</CFQUERY>

	<cfif #read_rec_fees.recordcount# gt 0>
			<cfif #read_comp.id# eq 154 or #read_comp.id# eq 155 or #read_comp.id# eq 156 or #read_comp.id# eq 157 or #read_comp.id# eq 158 or #read_comp.id# eq 159 or #read_comp.id# eq 160 or #read_comp.id# eq 161 or #read_comp.id# eq 162 or #read_comp.id# eq 163 or #read_comp.id# eq 164 or #read_comp.id# eq 165 or #read_comp.id# eq 166 or #read_comp.id# eq 167 or #read_comp.id# eq 168 or #read_comp.id# eq 169 or #read_comp.id# eq 170 or #read_comp.id# eq 182 or #read_comp.id# eq 181 or #read_comp.id# eq 183 or #read_comp.id# eq 184 or #read_comp.id# eq 185 or #read_comp.id# eq 186 or #read_comp.id# eq 187 or #read_comp.id# eq 188 or #read_comp.id# eq 189 or #read_comp.id# eq 192 or #read_comp.id# eq 190 or #read_comp.id# eq 193 or #read_comp.id# eq 194 or #read_comp.id# eq 195 or #read_comp.id# eq 196 or #read_comp.id# eq 197  or #read_comp.id# eq 198  or #read_comp.id# eq 199  or #read_comp.id# eq 200  or #read_comp.id# eq 201>
			<CFSET a_fee_total = #read_rec_fees.mort_rec_fee#>
			<cfelse>
			<CFSET a_fee_total = #read_rec_fees.release_rec_fee# + #read_rec_fees.mort_rec_fee#>
			</cfif>
		<cfelse>
			<CFSET a_fee_total = 0>
		</cfif>
			<CFIF #read_rec_fees.recordcount# GT 0>

			<CFIF #read_rec_fees.intangible_tax# neq 0>
			<cfif #get_titleid.piggy# eq 1>
			<CFSET loan_intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
			<CFSET piggy_intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
			<CFSET intang_tax = #loan_intang_tax# + #piggy_intang_tax#>
			<cfelse>
		<CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
		<CFSET loan_intang_tax = "">
		<CFSET piggy_intang_tax = "">
		</cfif>

		<CFELSE>

				<CFSET intang_tax = "0">
				<CFSET loan_intang_tax = "">
		<CFSET piggy_intang_tax = "">
			</cfif>
			<CFELSE>

				<CFSET intang_tax = "0">
				<CFSET loan_intang_tax = "">
		<CFSET piggy_intang_tax = "">
			</CFIF>

			<!--- ===/ Calc Ins Fees    \=== --->
			<cfif #loanamt_float# LTE "5000000">
		<cfif #pstate# neq "CA" AND #pstate# neq "MT" AND #pstate# neq "WY" AND #pstate# neq "AK">

			<CFIF (#pstate# EQ "AL")>
			<CFIF (#pcounty# EQ "Cherokee") OR (#pcounty# EQ "Colbert")  OR (#pcounty# EQ "Dekalb") OR (#pcounty# EQ "Etowah") OR (#pcounty# EQ "Franklin") OR (#pcounty# EQ "Jackson") OR (#pcounty# EQ "Lauderdale") OR (#pcounty# EQ "Lawrence") OR (#pcounty# EQ "Limestone") OR (#pcounty# EQ "Madison") OR (#pcounty# EQ "Marion") OR (#pcounty# EQ "Marshall") OR (#pcounty# EQ "Winston")>
					<CFSET a_tble_to_read = "StateAlabamaMetro">
					<CFELSE>
					<CFSET a_tble_to_read = "StateAlabamaState">
				</CFIF>
				<CFELSEIF #pstate# EQ "AR">
					<CFSET a_tble_to_read = "StateArkansas">
				<CFELSEIF #pstate# EQ "AZ">
					<CFIF (#pcounty# EQ "Maricopa") OR  (#pcounty# EQ "Pima") OR  (#pcounty# EQ "Pinal")>
						<CFSET a_tble_to_read = "StateArizonaZone1">
					<CFelseIF (#pcounty# EQ "Coconino")>
						<CFSET a_tble_to_read = "StateArizonaZone2">
					<CFelseIF (#pcounty# EQ "Cochise")>
						<CFSET a_tble_to_read = "StateArizonaZone3">
					<CFelseIF (#pcounty# EQ "Yavapai")>
						<CFSET a_tble_to_read = "StateArizonaZone4">
					<CFelseIF (#pcounty# EQ "Mohave")>
						<CFSET a_tble_to_read = "StateArizonaZone5">
					<cfelse>
						<CFSET a_tble_to_read = "StateArizona">
					</CFIF>


				<CFELSEIF #pstate# EQ "CT">
					<CFSET a_tble_to_read = "StateConnecticut">
						<CFELSEIF #pstate# EQ "MT">
					<CFSET a_tble_to_read = "Montana">
						<CFELSEIF #pstate# EQ "AK">
					<CFSET a_tble_to_read = "Alaska">
				<CFELSEIF #pstate# EQ "CO">
					<CFIF (#pcounty# EQ "Adams") OR  (#pcounty# EQ "Arapahoe") OR  (#pcounty# EQ "Broomfield") OR  (#pcounty# EQ "Clear Creek") OR  (#pcounty# EQ "Denver") OR  (#pcounty# EQ "Douglas") OR  (#pcounty# EQ "Elbert") OR  (#pcounty# EQ "Jefferson")>
						<CFSET a_tble_to_read = "StateColoradoZone1">
					<CFelseIF (#pcounty# EQ "Alamosa") OR  (#pcounty# EQ "Conejos") OR  (#pcounty# EQ "Rio Grande") OR  (#pcounty# EQ "Saguache")>
						<CFSET a_tble_to_read = "StateColoradoZone2">
					<CFelseIF (#pcounty# EQ "Archuleta") OR (#pcounty# EQ "Mineral")>
						<CFSET a_tble_to_read = "StateColoradoZone3">
					<CFelseIF (#pcounty# EQ "Boulder")>
						<CFSET a_tble_to_read = "StateColoradoZone4">
					<CFelseIF (#pcounty# EQ "Chaffee")>
						<CFSET a_tble_to_read = "StateColoradoZone5">
					<CFelseIF (#pcounty# EQ "Custer") OR (#pcounty# EQ "Fremont")>
						<CFSET a_tble_to_read = "StateColoradoZone6">
					<CFelseIF (#pcounty# EQ "Dolorse") OR (#pcounty# EQ "LaPlata") OR (#pcounty# EQ "Montezuma")>
						<CFSET a_tble_to_read = "StateColoradoZone7">
					<CFelseIF (#pcounty# EQ "Eagle") OR (#pcounty# EQ "Garfield") OR (#pcounty# EQ "Grand") OR (#pcounty# EQ "Jackson") OR (#pcounty# EQ "Pitkin") OR (#pcounty# EQ "Routt")>
						<CFSET a_tble_to_read = "StateColoradoZone8">
					<CFelseIF (#pcounty# EQ "El Paso")>
						<CFSET a_tble_to_read = "StateColoradoZone9">
					<CFelseIF (#pcounty# EQ "Moffatt")>
						<CFSET a_tble_to_read = "StateColoradoZone10">
					<CFelseIF (#pcounty# EQ "Larimer")>
						<CFSET a_tble_to_read = "StateColoradoZone11">
					<CFelseIF (#pcounty# EQ "Montrose") OR (#pcounty# EQ "Ouray")>
						<CFSET a_tble_to_read = "StateColoradoZone12">
					<CFelseIF (#pcounty# EQ "Phillips")>
						<CFSET a_tble_to_read = "StateColoradoZone13">
					<CFelseIF (#pcounty# EQ "Pueblo")>
						<CFSET a_tble_to_read = "StateColoradoZone14">
					<CFelseIF (#pcounty# EQ "Rio Blanco")>
						<CFSET a_tble_to_read = "StateColoradoZone15">
					<CFelseIF (#pcounty# EQ "Weld")>
						<CFSET a_tble_to_read = "StateColoradoZone16">
					<cfelse>
						<CFSET a_tble_to_read = "StateColoradoZone17">
					</CFIF>
					<CFELSEIF #pstate# EQ "DC">
					<CFSET a_tble_to_read = "StateDistrictColombia">
				<CFELSEIF #pstate# EQ "DE">
					<CFSET a_tble_to_read = "StateDelaware">
				<CFELSEIF #pstate# EQ "FL">
					<CFSET a_tble_to_read = "StateFlorida">
				<CFELSEIF #pstate# EQ "GA">
					<CFIF (#pcounty# EQ "Fulton") OR (#pcounty# EQ "Cobb")  OR (#pcounty# EQ "Clayton") OR (#pcounty# EQ "Cherokee") OR (#pcounty# EQ "Dekalb") OR (#pcounty# EQ "Gwinnett") OR (#pcounty# EQ "Henry") OR (#pcounty# EQ "Douglas") OR (#pcounty# EQ "Forsyth") OR (#pcounty# EQ "Paulding") OR (#pcounty# EQ "Carroll")>
					<CFSET a_tble_to_read = "StateGeorgiaMetro">
					<CFELSE>
					<CFSET a_tble_to_read = "StateGeorgiaState">
				</CFIF>
				<CFELSEIF #pstate# EQ "IA">
					<CFSET a_tble_to_read = "StateIowa">
				<CFELSEIF #pstate# EQ "IL">
					<CFSET a_tble_to_read = "StateIllinois">
				<CFELSEIF #pstate# EQ "IN">
					<CFSET a_tble_to_read = "StateIndiana">
				<CFELSEIF #pstate# EQ "KS">
					<CFSET a_tble_to_read = "StateKansas">
				<CFELSEIF #pstate# EQ "KY">
					<CFSET a_tble_to_read = "StateKentucky">
				<CFELSEIF #pstate# EQ "LA">
					<CFSET a_tble_to_read = "StateLouisianna">
				<CFELSEIF #pstate# EQ "ME">
					<CFSET a_tble_to_read = "StateMaine">
				<CFELSEIF #pstate# EQ "MD">
					<CFSET a_tble_to_read = "StateMaryland">
				<CFELSEIF #pstate# EQ "MA">
					<CFSET a_tble_to_read = "StateMassachusetts">
				<CFELSEIF #pstate# EQ "MI">
					<CFIF (#pcounty# EQ "Allegan") OR (#pcounty# EQ "Barry")  OR (#pcounty# EQ "Clinton") OR (#pcounty# EQ "Eaton") OR (#pcounty# EQ "Grand Traverse") OR (#pcounty# EQ "Ingham") OR (#pcounty# EQ "Ionia") OR (#pcounty# EQ "Kent") OR (#pcounty# EQ "Leelanau") OR (#pcounty# EQ "Montcalm") OR (#pcounty# EQ "Muskegon") OR (#pcounty# EQ "Newaygo") OR (#pcounty# EQ "Ottawa")>
					<CFSET a_tble_to_read = "StateMichiganZone2">
					<CFELSEIF #pcounty# eq "Wayne">
			        <CFSET a_tble_to_read = "StateMichiganZone3">
					<CFELSE>
					<CFSET a_tble_to_read = "StateMichiganZone1">
				</CFIF>
				<CFELSEIF #pstate# EQ "MN">
					<CFSET a_tble_to_read = "StateMinnesota">
				<CFELSEIF #pstate# EQ "MS">
					<CFSET a_tble_to_read = "StateMississipi">
				<CFELSEIF #pstate# EQ "MO">
					<CFSET a_tble_to_read = "StateMissouri">
				<CFELSEIF #pstate# EQ "NJ">
					<CFSET a_tble_to_read = "StateNewJersey">
				<CFELSEIF #pstate# EQ "NC">
					<CFSET a_tble_to_read = "StateNorthCarolina">
					<CFELSEIF #pstate# EQ "ND">
					<CFSET a_tble_to_read = "StateNorthDakota">
				<CFELSEIF #pstate# EQ "NH">
					<CFSET a_tble_to_read = "StateNewHampshire">
				<CFELSEIF #pstate# EQ "NY">
					<CFIF (#pcounty# EQ "Albany") OR (#pcounty# EQ "Bronx")  OR (#pcounty# EQ "Columbia") OR (#pcounty# EQ "Dutchess") OR (#pcounty# EQ "Greene") OR (#pcounty# EQ "Kings") OR (#pcounty# EQ "Nassau") OR (#pcounty# EQ "New York") OR (#pcounty# EQ "Orange") OR (#pcounty# EQ "Putnam") OR (#pcounty# EQ "Queens") OR (#pcounty# EQ "Rensselaer") OR (#pcounty# EQ "Richmond") OR (#pcounty# EQ "Rockland") OR (#pcounty# EQ "Suffolk") OR (#pcounty# EQ "Sullivan") OR (#pcounty# EQ "Westchester") OR (#pcounty# EQ "Ulster")>
					<CFSET a_tble_to_read = "StateNewYorkZone2">
					<CFELSE>
					<CFSET a_tble_to_read = "StateNewYorkZone1">
				</CFIF>
				<CFELSEIF #pstate# EQ "OH">
					<CFSET a_tble_to_read = "StateOhio">
				<CFELSEIF #pstate# EQ "PA">
					<CFSET a_tble_to_read = "StatePennsylvania">
				<CFELSEIF #pstate# EQ "RI">
					<CFSET a_tble_to_read = "StateRhodeIsland">
				<CFELSEIF #pstate# EQ "SC">
					<CFSET a_tble_to_read = "StateSouthCarolina">
				<CFELSEIF #pstate# EQ "TN">
					<CFIF (#pcounty# EQ "Davidson")>
						<CFSET a_tble_to_read = "StateTennesseeZone1">
					<CFelseIF (#pcounty# EQ "Hamilton")>
						<CFSET a_tble_to_read = "StateTennesseeZone2">
					<CFelseIF (#pcounty# EQ "Knox")>
						<CFSET a_tble_to_read = "StateTennesseeZone3">
					<CFelseIF (#pcounty# EQ "Shelby")>
						<CFSET a_tble_to_read = "StateTennesseeZone4">
					<cfelse>
						<CFSET a_tble_to_read = "StateTennessee">
					</CFIF>
				<CFELSEIF #pstate# EQ "VT">
					<CFSET a_tble_to_read = "StateVermont">

				<CFELSEIF #pstate# EQ "VA">
					<CFSET a_tble_to_read = "StateVirginia">
					<CFELSEIF #pstate# EQ "WI">
					<CFSET a_tble_to_read = "StateWisconsin">
				<CFELSEIF #pstate# EQ "WV">
					<CFSET a_tble_to_read = "StateWestVirginia">
				</CFIF>

				<!--- Round up the value of the loan amount --->

					<!--- remove any potential decimal values --->


						 <CFSET   x  = #Round(loanamt_float)#>



					 <CFSET   x_len  = #Len(x)#>
						<CFIF #x_len# EQ "3">
							<CFSET x_temp = #x# / 10>
							<CFSET   x_final  = #Round(x_temp)# * 10>
						<CFELSEIF #x_len# EQ "4">
							<CFSET x_temp = #x# / 100>
							<CFSET   x_final  = #Round(x_temp)# * 100>
						<CFELSEIF #x_len# EQ "5">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>
						<CFELSEIF #x_len# EQ "6">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>
						<CFELSEIF #x_len# EQ "7">
							<CFSET x_temp = #x# / 10000>
							<CFSET   x_final  = #Round(x_temp)# * 10000>
					<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->



					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
	  order by a_to
      </CFQUERY>

								 <cfif #get_titleid.piggy# eq 1>
						 <cfif #get_titleid.ins# eq 1>

						 	 <CFSET   x  = #Round(secloan)#>



					 <CFSET   x_len  = #Len(x)#>
						<CFIF #x_len# EQ "3">
							<CFSET x_temp = #x# / 10>
							<CFSET   x_final  = #Round(x_temp)# * 10>
						<CFELSEIF #x_len# EQ "4">
							<CFSET x_temp = #x# / 100>
							<CFSET   x_final  = #Round(x_temp)# * 100>
						<CFELSEIF #x_len# EQ "5">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>
						<CFELSEIF #x_len# EQ "6">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>
						<CFELSEIF #x_len# EQ "7">
							<CFSET x_temp = #x# / 10000>
							<CFSET   x_final  = #Round(x_temp)# * 10000>
					<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>

						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->



					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc2" maxrows="1">

						SELECT *

						FROM #a_tble_to_read#

						WHERE a_to >= #x_final#
						order by a_to

					</CFQUERY>

						 </cfif></cfif>


					<CFIF #SearchType# EQ "Refinance">

					<cfif #get_titleid.piggy# eq 1>
						<cfif #get_titleid.ins# eq 1>
						<CFSET first_a_ins_premium = #read_ins_calc.Refinance#>
						<CFSET second_a_ins_premium = #read_ins_calc2.Refinance#>
						<CFSET a_ins_premium = #first_a_ins_premium# + #second_a_ins_premium#>
						<cfelse>
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>
						<CFSET first_a_ins_premium = "">
					<CFSET second_a_ins_premium = "">
						</cfif>
					<cfelse>
					<CFSET a_ins_premium = #read_ins_calc.Refinance#>
					<CFSET first_a_ins_premium = "">
					<CFSET second_a_ins_premium = "">
					</cfif>

					<CFELSE>
					<CFSET a_ins_premium = #read_ins_calc.sale#>
					<CFSET first_a_ins_premium = "">
					<CFSET second_a_ins_premium = "">
					</CFIF>


</cfif>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states
		WHERE company_id = #get_titleid.comp_id# AND a_states = '#get_titleid.pstate#'

</CFQUERY>

<cfif #get_billing_states.recordcount# GT "0">

	<CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values
		WHERE company_id = #get_titleid.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>


<cfif #searchType# neq "New Second Mortgage">
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1101_a = "525">
<cfelse>
<cfif #get_line_costs.a_1101# NEQ "">
<CFSET a_1101_a = #get_line_costs.a_1101#>
<CFELSE>
<Cfset a_1101_a = "0">
</CFIF></CFIF>
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1102_a = "125"><cfelse>
<cfif #get_line_costs.a_1102# NEQ "">
<CFSET a_1102_a = #get_line_costs.a_1102#>
<CFELSE>
<Cfset a_1102_a = "0">
</CFIF></cfif>
<cfif #get_line_costs.a_1103# NEQ "">
<CFSET a_1103_a = #get_line_costs.a_1103#>
<CFELSE>
<Cfset a_1103_a = "0">
</CFIF>
<cfif #get_line_costs.a_1104# NEQ "">
<CFSET a_1104_a = #get_line_costs.a_1104#>
<CFELSE>
<Cfset a_1104_a = "0">
</CFIF>
<cfif #get_line_costs.a_1105# NEQ "">
<CFSET a_1105_a = #get_line_costs.a_1105#>
<CFELSE>
<Cfset a_1105_a = "0">
</CFIF>
<cfif #get_line_costs.a_1106# NEQ "">
<CFSET a_1106_a = #get_line_costs.a_1106#>
<CFELSE>
<Cfset a_1106_a = "0">
</CFIF>
<cfif #get_line_costs.a_1107# NEQ "">
<CFSET a_1107_a = #get_line_costs.a_1107#>
<CFELSE>
<Cfset a_1107_a = "0">
</CFIF>
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1111_a = "65"><cfelse>
<cfif #get_line_costs.a_1111# NEQ "">
<CFSET a_1111_a = #get_line_costs.a_1111#>
<CFELSE>
<Cfset a_1111_a = "0">
</CFIF></cfif>

<cfif #get_line_costs.a_1112# NEQ "">
<CFSET a_1112_a = #get_line_costs.a_1112#>
<CFELSE>
<Cfset a_1112_a = "0">
</CFIF>
<cfif #get_line_costs.a_1113# NEQ "">
<CFSET a_1113_a = #get_line_costs.a_1113#>
<CFELSE>
<Cfset a_1113_a = "0">
</CFIF>
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1205_a = "85"><cfelse>
<cfif #get_line_costs.a_1205# NEQ "">
<CFSET a_1205_a = #get_line_costs.a_1205#>
<CFELSE>
<Cfset a_1205_a = "0">
</CFIF></cfif>

<cfif #get_line_costs.a_1303# NEQ "">
<CFSET a_1303_a = #get_line_costs.a_1303#>
<CFELSE>
<Cfset a_1303_a = "0">
</CFIF>
<cfif #get_line_costs.a_1304# NEQ "">
<CFSET a_1304_a = #get_line_costs.a_1304#>
<CFELSE>
<Cfset a_1304_a = "0">
</CFIF>
<cfif #get_line_costs.a_1305# NEQ "">
<CFSET a_1305_a = #get_line_costs.a_1305#>
<CFELSE>
<Cfset a_1305_a = "0">
</CFIF>

<cfelse>
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1101_a = "525"><cfelse>
<cfif #get_line_costs.a_1101c# NEQ "">
<CFSET a_1101_a = #get_line_costs.a_1101c#>
<CFELSE>
<Cfset a_1101_a = "0">
</CFIF></cfif>
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1102_a = "125"><cfelse>
<cfif #get_line_costs.a_1102c# NEQ "">
<CFSET a_1102_a = #get_line_costs.a_1102c#>
<CFELSE>
<Cfset a_1102_a = "0">
</CFIF></cfif>
<cfif #get_line_costs.a_1103c# NEQ "">
<CFSET a_1103_a = #get_line_costs.a_1103c#>
<CFELSE>
<Cfset a_1103_a = "0">
</CFIF>
<cfif #get_line_costs.a_1104c# NEQ "">
<CFSET a_1104_a = #get_line_costs.a_1104c#>
<CFELSE>
<Cfset a_1104_a = "0">
</CFIF>
<cfif #get_line_costs.a_1105c# NEQ "">
<CFSET a_1105_a = #get_line_costs.a_1105c#>
<CFELSE>
<Cfset a_1105_a = "0">
</CFIF>
<cfif #get_line_costs.a_1106c# NEQ "">
<CFSET a_1106_a = #get_line_costs.a_1106c#>
<CFELSE>
<Cfset a_1106_a = "0">
</CFIF>
<cfif #get_line_costs.a_1107c# NEQ "">
<CFSET a_1107_a = #get_line_costs.a_1107c#>
<CFELSE>
<Cfset a_1107_a = "0">
</CFIF>
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1111_a = "65"><cfelse>
<cfif #get_line_costs.a_1111c# NEQ "">
<CFSET a_1111_a = #get_line_costs.a_1111c#>
<CFELSE>
<Cfset a_1111_a = "0">
</CFIF></cfif>
<cfif #get_line_costs.a_1112c# NEQ "">
<CFSET a_1112_a = #get_line_costs.a_1112c#>
<CFELSE>
<Cfset a_1112_a = "0">
</CFIF>
<cfif #get_line_costs.a_1113c# NEQ "">
<CFSET a_1113_a = #get_line_costs.a_1113c#>
<CFELSE>
<Cfset a_1113_a = "0">
</CFIF>
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1205_a = "85"><cfelse>
<cfif #get_line_costs.a_1205c# NEQ "">
<CFSET a_1205_a = #get_line_costs.a_1205c#>
<CFELSE>
<Cfset a_1205_a = "0">
</CFIF></cfif>
<cfif #get_line_costs.a_1303c# NEQ "">
<CFSET a_1303_a = #get_line_costs.a_1303c#>
<CFELSE>
<Cfset a_1303_a = "0">
</CFIF>
<cfif #get_line_costs.a_1304c# NEQ "">
<CFSET a_1304_a = #get_line_costs.a_1304c#>
<CFELSE>
<Cfset a_1304_a = "0">
</CFIF>
<cfif #get_line_costs.a_1305c# NEQ "">
<CFSET a_1305_a = #get_line_costs.a_1305c#>
<CFELSE>
<Cfset a_1305_a = "0">
</CFIF>


</cfif>

<cfelse>
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1101_a = "525"><cfelse>
<Cfset a_1101_a = "0">
</cfif>
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1102_a = "125"><cfelse>
<Cfset a_1102_a = "0">
</cfif>
<Cfset a_1103_a = "0">

<Cfset a_1104_a = "0">

<Cfset a_1105_a = "0">

<Cfset a_1106_a = "0">

<Cfset a_1107_a = "0">
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1111_a = "65"><cfelse>
<Cfset a_1111_a = "0">
</cfif>
<Cfset a_1112_a = "0">

<Cfset a_1113_a = "0">
<cfif #pstate# eq "CA" or #pstate# eq "NV">
<CFSET a_1205_a = "85"><cfelse>
<Cfset a_1205_a = "0">
</cfif>
<Cfset a_1303_a = "0">

<Cfset a_1304_a = "0">

<Cfset a_1305_a = "0">

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_comp">
SELECT *
FROM companies
WHERE id = '#comp_id#'
</CFQUERY>

<cfif #read_rec_fees.recordcount# GT "0">
<CFIF #read_rec_fees.mort_rec_fee# NEQ "" or #read_rec_fees.mort_rec_fee# NEQ "0">
<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
<CFELSE>
<Cfset rec_fee = "0">
</cfif>
<cfelse>
<Cfset rec_fee = "0">
</CFIF>
<cfif #read_rec_fees.recordcount# GT "0">
<cfif #read_rec_fees.release_rec_fee# NEQ "" or #read_rec_fees.release_rec_fee# NEQ "0">
<cfif #read_comp.id# eq 154 or #read_comp.id# eq 155 or #read_comp.id# eq 156 or #read_comp.id# eq 157 or #read_comp.id# eq 158 or #read_comp.id# eq 159 or #read_comp.id# eq 160 or #read_comp.id# eq 161 or #read_comp.id# eq 162 or #read_comp.id# eq 163 or #read_comp.id# eq 164 or #read_comp.id# eq 165 or #read_comp.id# eq 166 or #read_comp.id# eq 167 or #read_comp.id# eq 168 or #read_comp.id# eq 169 or #read_comp.id# eq 170 or #read_comp.id# eq 181 or #read_comp.id# eq 182 or #read_comp.id# eq 183 or #read_comp.id# eq 184 or #read_comp.id# eq 185 or #read_comp.id# eq 186 or #read_comp.id# eq 187 or #read_comp.id# eq 188 or #read_comp.id# eq 189 or #read_comp.id# eq 192 or #read_comp.id# eq 190 or #read_comp.id# eq 193 or #read_comp.id# eq 194 or #read_comp.id# eq 195 or #read_comp.id# eq 196 or #read_comp.id# eq 197  or #read_comp.id# eq 198  or #read_comp.id# eq 199  or #read_comp.id# eq 200  or #read_comp.id# eq 201>
	<Cfset rel_fee = "0">
	<cfelse>
<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
</cfif>
<CFELSE>
<Cfset rel_fee = "0">
</cfif>
<CFELSE>
<Cfset rel_fee = "0">
</CFIF>
<cfif #city_mort_stamps# NEQ "" or #city_mort_stamps# NEQ "0">
<Cfset mort_stamps = #NumberFormat(city_mort_stamps, '_____.__')#>
<CFELSE>
<Cfset mort_stamps = "0">
</CFIF>

<cfif #get_titleid.piggy# eq "1">
<cfif #loan_city_mort_stamps# NEQ "" or #loan_city_mort_stamps# NEQ "0">
<Cfset loan_mort_stamps = #NumberFormat(loan_city_mort_stamps, '_____.__')#>
<CFELSE>
<Cfset loan_mort_stamps = "">
</CFIF>
<cfif #piggy_city_mort_stamps# NEQ "" or #piggy_city_mort_stamps# NEQ "0">
<Cfset piggy_mort_stamps = #NumberFormat(piggy_mort_stamps, '_____.__')#>
<CFELSE>
<Cfset piggy_mort_stamps = "">
</CFIF>
<cfif #loan_intang_tax# NEQ "" or #loan_intang_tax# NEQ "0">
<Cfset loan_intang_tx = #NumberFormat(loan_intang_tax, '_____.__')#>
<CFELSE>
<Cfset loan_intang_tx = "">
</CFIF>
<cfif #piggy_intang_tax# NEQ "" or #piggy_intang_tax# NEQ "0">
<Cfset piggy_intang_tx = #NumberFormat(piggy_intang_tax, '_____.__')#>
<CFELSE>
<Cfset piggy_intang_tx = "">
</CFIF>

<cfif #get_titleid.ins# eq "1">
<cfif #first_a_ins_premium# NEQ "" or #first_a_ins_premium# NEQ "0">
<CFSET first_ins_premium = #NumberFormat(first_a_ins_premium, '_____.__')#>
<CFELSE>
<Cfset first_ins_premium = "">
</CFIF>

<cfif #second_a_ins_premium# NEQ "" or #second_a_ins_premium# NEQ "0">
<CFSET second_ins_premium = #NumberFormat(second_a_ins_premium, '_____.__')#>
<CFELSE>
<Cfset second_ins_premium = "">
</CFIF>


<cfelse>
<Cfset first_ins_premium = "">
<Cfset second_ins_premium = "">
</cfif>

<cfelse>
<Cfset loan_mort_stamps = "">
<Cfset piggy_mort_stamps = "">
<Cfset loan_intang_tx = "">
<Cfset piggy_intang_tx = "">
<Cfset first_ins_premium = "">
<Cfset second_ins_premium = "">
</cfif>

<cfif #a_fee_total# NEQ "" or #a_fee_total# NEQ "0">
<Cfset total_fee = #NumberFormat(a_fee_total, '_____.__')#>
<CFELSE>
<Cfset total_fee = "0">
</CFIF>
<cfif #state_deed_1# NEQ "" or #state_deed_1# NEQ "0" >
<Cfset deed_state = #NumberFormat(state_deed_1, '_____.__')#>
<CFELSE>
<Cfset deed_state = "0">
</CFIF>
<cfif #state_mort_stamps# NEQ "" or #state_mort_stamps# NEQ "0" >
<Cfset s_mort_stamps = #NumberFormat(state_mort_stamps, '_____.__')#>
<CFELSE>
<Cfset s_mort_stamps = "0">
</CFIF>
<cfif #a_1203_line_total# NEQ "" or #a_1203_line_total# NEQ "0">
<Cfset a_line_total_1203 = #NumberFormat(a_1203_line_total, '_____.__')#>
<CFELSE>
<Cfset a_line_total_1203 = "0">
</CFIF>
<cfif #intang_tax# NEQ "" or #intang_tax# NEQ "0">
<Cfset intang_tx = #NumberFormat(intang_tax, '_____.__')#>
<CFELSE>
<Cfset intang_tx = "0">
</CFIF>


<cfif #loanamt_float# LTE "5000000">
<cfif #pstate# neq "CA" AND #pstate# neq "MT" AND #pstate# neq "WY" AND #pstate# neq "AK">

<cfif #a_ins_premium# NEQ "" or #a_ins_premium# NEQ "0">
<CFSET ins_premium = #NumberFormat(a_ins_premium, '_____.__')#>
<CFELSE>
<Cfset ins_premium = "0">
</CFIF>
<CFQUERY datasource="#request.dsn#" NAME="end_rates1">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge1#'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="end_rates2">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge2#'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="end_rates3">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge3#'
		</CFQUERY>
	<cfif #end_rates1.recordcount# GT "0">
<cfif #merge1# eq "">
<cfset mergenum1 = 0>
<cfelse>
<cfset mergenum1 = #end_rates1.rates#>
</cfif>
<cfelse>
<cfset mergenum1 = 0>
</cfif>

<cfif #end_rates2.recordcount# GT "0">
<cfif #merge2# eq "">
<cfset mergenum2 = 0>
<cfelse>
<cfset mergenum2 = #end_rates2.rates#>
</cfif>
<cfelse>
<cfset mergenum2 = 0>
</cfif>

<cfif #end_rates3.recordcount# GT "0">
<cfif #merge3# eq "">
<cfset mergenum3 = 0>
<cfelse>
<cfset mergenum3 = #end_rates3.rates#>
</cfif>
<cfelse>
<cfset mergenum3 = 0>
</cfif>

		<cfif #get_titleid.comp_id# EQ "254">
		<cfif #pstate# EQ "PA" OR #pstate# EQ "MI">
		<cfset a_1114_a = "0">
		<cfset a_1114_c = "">
		<cfelse>
		<cfset a_1114_a = "550">
		<cfset a_1114_c = "Title Clearance Fee">
		</cfif>
		<cfelse>
		<cfset a_1114_a = 0>
		<cfset a_1114_c = "">
		</cfif>

		<cfif #get_titleid.comp_id# EQ "254">

		<cfif (#pstate# EQ "NH") OR (#pstate# EQ "OH") OR (#pstate# EQ "VA")>

		<cfset a_810_b = "0">
		<cfset a_810_a = "">

		<CFELSEIF #pstate# EQ "IN">
		<CFIF (#SearchType# EQ "Refinance") OR (#SearchType# EQ "Purchase")>
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</CFIF>

		<CFELSEIF #pstate# EQ "PA">
		<CFIF #loanamt_float# GT "55000">
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</CFIF>

		<CFELSEIF #pstate# EQ "WI">
		<CFIF #loanamt_float# GT "25000">
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</CFIF>

		<CFELSE>
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		</CFIF>


		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</cfif>


		<cfif #get_titleid.comp_id# EQ "254">
		<cfset a_811_b = "15">
		<cfset a_811_a = "Life of Loan Flood Cert Fee">
		<cfelse>
		<cfset a_811_b = "0">
		<cfset a_811_a = "">
		</cfif>

	<cfif #get_titleid.piggy# eq 1>
		<cfset piggy = "250">
		<cfset piggytext = "Secondary Mortgage Fee">
		<cfelse>
		<cfset piggy = "0">
		<cfset piggytext = "">
		</cfif>


		<CFQUERY datasource="#request.dsn#" NAME="read_comp">
SELECT *
FROM companies
WHERE id = '#comp_id#'
</CFQUERY>

			<cfif #read_comp.id# eq 154 or #read_comp.id# eq 155 or #read_comp.id# eq 156 or #read_comp.id# eq 157 or #read_comp.id# eq 158 or #read_comp.id# eq 159 or #read_comp.id# eq 160 or #read_comp.id# eq 161 or #read_comp.id# eq 162 or #read_comp.id# eq 163 or #read_comp.id# eq 164 or #read_comp.id# eq 165 or #read_comp.id# eq 166 or #read_comp.id# eq 167 or #read_comp.id# eq 168 or #read_comp.id# eq 169 or #read_comp.id# eq 170 or #read_comp.id# eq 182 or #read_comp.id# eq 181 or #read_comp.id# eq 183 or #read_comp.id# eq 184 or #read_comp.id# eq 185 or #read_comp.id# eq 186 or #read_comp.id# eq 187 or #read_comp.id# eq 188 or #read_comp.id# eq 189 or #read_comp.id# eq 192 or #read_comp.id# eq 190 or #read_comp.id# eq 193 or #read_comp.id# eq 194 or #read_comp.id# eq 195 or #read_comp.id# eq 196 or #read_comp.id# eq 197  or #read_comp.id# eq 198  or #read_comp.id# eq 199  or #read_comp.id# eq 200  or #read_comp.id# eq 201>

			<cfset a_804_c = "POC L $8.50">
			<cfset a_805_a = "Processing Fee to Homeowners Loan">
			<cfset a_806_a = "Funding Fee to Homeowners Loan">
			<cfset a_807_a = "Administration Fee to Homeowners Loan">
			<cfset a_808_a = "Document Preparation to Homeowners Loan">
			<cfset a_805_c = "">
			<cfset a_806_c = "">
			<cfset a_807_c = "">
			<cfset a_808_c = "">
			<cfset a_805_b = "390">
			<cfset a_806_b = "365">
			<cfset a_807_b = "295">
			<cfset a_808_b = "195">
			<cfelse>

			<cfset a_804_c = "">
			<cfset a_805_a = "">
			<cfset a_806_a = "">
			<cfset a_807_a = "">
			<cfset a_808_a = "">
			<cfset a_805_c = "">
			<cfset a_806_c = "">
			<cfset a_807_c = "">
			<cfset a_808_c = "">
			<cfset a_805_b = "0">
			<cfset a_806_b = "0">
			<cfset a_807_b = "0">
			<cfset a_808_b = "0">
			</cfif>


					<CFSET a_total_settlmnt_charges = #rec_fee#

													+ #rel_fee#

													+ #a_line_total_1203#
													+ #mort_stamps#
													+ #intang_tx#

													+ #a_805_b#
													+ #a_806_b#
													+ #a_807_b#
													+ #a_808_b#
													+ #a_810_b#
													+ #a_811_b#
													+ #a_1101_a#
													+ #a_1102_a#
													+ #a_1103_a#
													+ #a_1104_a#
													+ #a_1105_a#
													+ #a_1106_a#
													+ #a_1107_a#
													+ #a_1111_a#
													+ #a_1112_a#
													+ #a_1113_a#
													+ #a_1114_a#
													+ #a_1205_a#
													+ #a_1303_a#
													+ #a_1304_a#
													+ #a_1305_a#
													+ #mergenum1#
													+ #piggy#
													>
<cfif ins_premium neq 'Call for Quote'>
<CFSET a_total_settlmnt_charges = a_total_settlmnt_charges + ins_premium>
</cfif>
<cfif #get_titleid.purchase# NEQ "">
<CFSET a_101 = #get_titleid.purchase#>
<CFELSE>
<Cfset a_101 = "0">
</CFIF>

<CFSET a_total_settlmnt_charges2 = #a_total_settlmnt_charges# + #a_101#>

				<cfif #get_titleid.secloan# NEQ "">


		<CFSET a_206_a = "Second Mortgage">
		<CFSET a_206_b = "#get_titleid.secloan#">

		<CFSET a_220 = #Round(loanamt_float)# + #get_titleid.secloan#>

			<CFSET a_301 = #a_total_settlmnt_charges2#>

			<CFSET a_302 = #a_220# + #a_206_b#>
			<cfif #get_titleid.hud_type# EQ "0">
			<CFSET a_total_settlmnt_charges3 = #a_301# - #a_302#>
			<cfelse>
			<CFSET a_total_settlmnt_charges3 = #a_302# - #a_301#>
			</CFIF>

		<cfelse>

		<CFSET a_220 = #Round(loanamt_float)#>
				<CFSET a_206_a = "">
		<CFSET a_206_b = "0">
			<CFSET a_301 = #a_total_settlmnt_charges2#>

			<CFSET a_302 = #a_220#>
			<cfif #get_titleid.hud_type# EQ "0">
			<CFSET a_total_settlmnt_charges3 = #a_301# - #a_302#>
			<cfelse>
			<CFSET a_total_settlmnt_charges3 = #a_302# - #a_301#>
			</CFIF>

		</cfif>
			<cfif #a_805_b# eq "0">
					<cfset a_805_b = "">
			</cfif>
			<cfif #a_806_b# eq "0">
					<cfset a_806_b = "">
			</cfif>
			<cfif #a_807_b# eq "0">
					<cfset a_807_b = "">
			</cfif>

			<cfif #a_807_b# eq "0">
					<cfset a_807_b = "">
			</cfif>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg1(title_id, a_1, a_6, D_BName, D_BAddr, E_SName, E_SAddr, F_LName, F_LAddr, G_PropAddr, I_SettlementDate, a_103 , a_120, a_220, a_206_a, a_206_b, a_301, a_302, a_303)
				VALUES(#get_titleid.title_id#, '#loan_type_111#', '#get_titleid.title_id#', '#b_name_5#', '', '#s_name_5#', '', '', '', '#property_address#', 'To Be Determined', '#a_total_settlmnt_charges#', '#a_total_settlmnt_charges2#', '#a_220#', '#a_206_a#', '#a_206_b#', '#a_301#', '#a_302#', '#a_total_settlmnt_charges3#')

			</CFQUERY>
<cfset a_801_d = "">

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg2(title_id, a_804_c, a_805_a, a_806_a, a_807_a, a_808_a, a_805_c, a_806_c, a_807_c, a_808_c, a_805_b, a_806_b, a_807_b, a_808_b, a_810_a, a_810_b, a_811_a, a_811_b, a_1101_a,  a_1102_a, a_1103_a,  a_1104_a,  a_1105_a,  a_1106_a,  a_1107_a,  a_1111_a,  a_1112_a,  a_1113_a, a_1114_a, a_1114_c,  a_1205_a, a_1303_a, a_1304_a,  a_1305_a, a_1108_a, a_1108_b, a_1201_a, a_1201_b, a_1201_c, a_1201_d, a_1201_e, a_1202_a, a_1202_b, a_1202_c, a_1202_d, a_1202_e, a_1203_a, a_1203_b, a_1203_c, a_1203_d, a_1203_e, a_1204_a, a_1204_b, a_1204_c, a_1400_a, a_1306_a, a_1307_a, a_1306_b, a_1307_b, loan_mort_stamps, loan_intang_tx, piggy_mort_stamps, piggy_intang_tx, first_ins_premium, second_ins_premium)
				VALUES(#get_titleid.title_id#, '#a_804_c#', '#a_805_a#', '#a_806_a#', '#a_807_a#', '#a_808_a#', '#a_805_c#', '#a_806_c#', '#a_807_c#', '#a_808_c#', '#a_805_b#', '#a_806_b#', '#a_807_b#', '#a_808_b#', '#a_810_a#', '#a_810_b#', '#a_811_a#', '#a_811_b#', '#a_1101_a#', '#a_1102_a#',  '#a_1103_a#',  '#a_1104_a#',  '#a_1105_a#',  '#a_1106_a#',  '#a_1107_a#',  '#a_1111_a#',  '#a_1112_a#',  '#a_1113_a#', '#a_1114_a#', '#a_1114_c#', '#a_1205_a#',  '#a_1303_a#', '#a_1304_a#', '#a_1305_a#', '#ins_premium#', '0', '0', '#rec_fee#', '#rel_fee#', '#total_fee#', '0', '0', '0', '#mort_stamps#', '#mort_stamps#', '0', '0', '#deed_state#', '#s_mort_stamps#', '#a_line_total_1203#', '0', 'Intangable Tax', '#intang_tx#', '0', '#a_total_settlmnt_charges#', '#merge1#', '#piggytext#', '#mergenum1#', '#piggy#', '#loan_mort_stamps#', '#loan_intang_tx#', '#piggy_mort_stamps#', '#piggy_intang_tx#', '#first_ins_premium#', '#second_ins_premium#')

</CFQUERY>


<cfelse>
<Cfset ins_premium = "Call for Quote">
	<CFQUERY datasource="#request.dsn#" NAME="end_rates1">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge1#'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="end_rates2">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge2#'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="end_rates3">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge3#'
		</CFQUERY>
	<cfif #end_rates1.recordcount# GT "0">
<cfif #merge1# eq "">
<cfset mergenum1 = 0>
<cfelse>
<cfset mergenum1 = #end_rates1.rates#>
</cfif>
<cfelse>
<cfset mergenum1 = 0>
</cfif>

<cfif #end_rates2.recordcount# GT "0">
<cfif #merge2# eq "">
<cfset mergenum2 = 0>
<cfelse>
<cfset mergenum2 = #end_rates2.rates#>
</cfif>
<cfelse>
<cfset mergenum2 = 0>
</cfif>

<cfif #end_rates3.recordcount# GT "0">
<cfif #merge3# eq "">
<cfset mergenum3 = 0>
<cfelse>
<cfset mergenum3 = #end_rates3.rates#>
</cfif>
<cfelse>
<cfset mergenum3 = 0>
</cfif>


	<cfif #get_titleid.comp_id# EQ "254">
		<cfif #pstate# EQ "PA" OR #pstate# EQ "MI">
		<cfset a_1114_a = "0">
		<cfset a_1114_c = "">
		<cfelse>
		<cfset a_1114_a = "550">
		<cfset a_1114_c = "Title Clearance Fee">
		</cfif>
		<cfelse>
		<cfset a_1114_a = 0>
		<cfset a_1114_c = "">
		</cfif>

		<cfif #get_titleid.comp_id# EQ "254">

		<cfif (#pstate# EQ "NH") OR (#pstate# EQ "OH") OR (#pstate# EQ "VA")>

		<cfset a_810_b = "0">
		<cfset a_810_a = "">

		<CFELSEIF #pstate# EQ "IN">
		<CFIF (#SearchType# EQ "Refinance") OR (#SearchType# EQ "Purchase")>
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</CFIF>

		<CFELSEIF #pstate# EQ "PA">
		<CFIF #loanamt_float# GT "55000">
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</CFIF>

		<CFELSEIF #pstate# EQ "WI">
		<CFIF #loanamt_float# GT "25000">
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</CFIF>

		<CFELSE>
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		</CFIF>


		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</cfif>


		<cfif #get_titleid.comp_id# EQ "254">
		<cfset a_811_b = "15">
		<cfset a_811_a = "Life of Loan Flood Cert Fee">
		<cfelse>
		<cfset a_811_b = "0">
		<cfset a_811_a = "">
		</cfif>

<cfif #get_titleid.piggy# eq 1>
		<cfset piggy = "250">
		<cfset piggytext = "Secondary Mortgage Fee">
		<cfelse>
		<cfset piggy = "0">
		<cfset piggytext = "">
		</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_comp">
SELECT *
FROM companies
WHERE id = '#comp_id#'
</CFQUERY>

			<cfif #read_comp.id# eq 154 or #read_comp.id# eq 155 or #read_comp.id# eq 156 or #read_comp.id# eq 157 or #read_comp.id# eq 158 or #read_comp.id# eq 159 or #read_comp.id# eq 160 or #read_comp.id# eq 161 or #read_comp.id# eq 162 or #read_comp.id# eq 163 or #read_comp.id# eq 164 or #read_comp.id# eq 165 or #read_comp.id# eq 166 or #read_comp.id# eq 167 or #read_comp.id# eq 168 or #read_comp.id# eq 169 or #read_comp.id# eq 170 or #read_comp.id# eq 182 or #read_comp.id# eq 181 or #read_comp.id# eq 183 or #read_comp.id# eq 184 or #read_comp.id# eq 185 or #read_comp.id# eq 186 or #read_comp.id# eq 187 or #read_comp.id# eq 188 or #read_comp.id# eq 189 or #read_comp.id# eq 192 or #read_comp.id# eq 190 or #read_comp.id# eq 193 or #read_comp.id# eq 194 or #read_comp.id# eq 195 or #read_comp.id# eq 196 or #read_comp.id# eq 197  or #read_comp.id# eq 198  or #read_comp.id# eq 199  or #read_comp.id# eq 200  or #read_comp.id# eq 201>
			<cfset a_804_c = "POC L $8.50">
			<cfset a_805_a = "Processing Fee to Homeowners Loan">
			<cfset a_806_a = "Funding Fee to Homeowners Loan">
			<cfset a_807_a = "Administration Fee to Homeowners Loan">
			<cfset a_808_a = "Document Preparation to Homeowners Loan">
			<cfset a_805_c = "">
			<cfset a_806_c = "">
			<cfset a_807_c = "">
			<cfset a_808_c = "">
			<cfset a_805_b = "390">
			<cfset a_806_b = "365">
			<cfset a_807_b = "295">
			<cfset a_808_b = "195">
			<cfelse>

			<cfset a_804_c = "">
			<cfset a_805_a = "">
			<cfset a_806_a = "">
			<cfset a_807_a = "">
			<cfset a_808_a = "">
			<cfset a_805_c = "">
			<cfset a_806_c = "">
			<cfset a_807_c = "">
			<cfset a_808_c = "">
			<cfset a_805_b = "0">
			<cfset a_806_b = "0">
			<cfset a_807_b = "0">
			<cfset a_808_b = "0">
			</cfif>

			<CFSET a_total_settlmnt_charges = #rec_fee#

													+ #rel_fee#

													+ #a_line_total_1203#
													+ #mort_stamps#
													+ #intang_tx#
													+ #a_805_b#
													+ #a_806_b#
													+ #a_807_b#
													+ #a_808_b#
													+ #a_810_b#
													+ #a_811_b#
													+ #a_1101_a#
													+ #a_1102_a#
													+ #a_1103_a#
													+ #a_1104_a#
													+ #a_1105_a#
													+ #a_1106_a#
													+ #a_1107_a#
													+ #a_1111_a#
													+ #a_1112_a#
													+ #a_1113_a#
													+ #a_1114_a#
													+ #a_1205_a#
													+ #a_1303_a#
													+ #a_1304_a#
													+ #a_1305_a#
													+ #mergenum1#
													+ #piggy#
													>
			<cfif #get_titleid.purchase# NEQ "">
<CFSET a_101 = #round(get_titleid.purchase)#>
<CFELSE>
<Cfset a_101 = "0">
</CFIF>

	<CFSET a_total_settlmnt_charges2 = #a_total_settlmnt_charges# + #a_101#>

				<cfif #get_titleid.secloan# NEQ "">


		<CFSET a_206_a = "Second Mortgage">
		<CFSET a_206_b = "#get_titleid.secloan#">
		<CFSET a_220 = #Round(loanamt_float)# + #get_titleid.secloan#>

			<CFSET a_301 = #a_total_settlmnt_charges2#>

			<CFSET a_302 = #a_220# + #a_206_b#>
			<cfif #get_titleid.hud_type# EQ "0">
			<CFSET a_total_settlmnt_charges3 = #a_301# - #a_302#>
			<cfelse>
			<CFSET a_total_settlmnt_charges3 = #a_302# - #a_301#>
			</CFIF>

		<cfelse>

		<CFSET a_220 = #Round(loanamt_float)#>
				<CFSET a_206_a = "">
		<CFSET a_206_b = "0">
			<CFSET a_301 = #a_total_settlmnt_charges2#>

			<CFSET a_302 = #a_220#>
			<cfif #get_titleid.hud_type# EQ "0">
			<CFSET a_total_settlmnt_charges3 = #a_301# - #a_302#>
			<cfelse>
			<CFSET a_total_settlmnt_charges3 = #a_302# - #a_301#>
			</CFIF>

		</cfif>
						<cfif #a_805_b# eq "0">
					<cfset a_805_b = "">
			</cfif>
			<cfif #a_806_b# eq "0">
					<cfset a_806_b = "">
			</cfif>
			<cfif #a_807_b# eq "0">
					<cfset a_807_b = "">
			</cfif>

			<cfif #a_807_b# eq "0">
					<cfset a_807_b = "">
			</cfif>
<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg1(title_id, a_1, a_6, D_BName, D_BAddr, E_SName, E_SAddr, F_LName, F_LAddr, G_PropAddr, I_SettlementDate, a_103 , a_120, a_220, a_206_a, a_206_b, a_301, a_302, a_303 )
				VALUES(#get_titleid.title_id#, '#loan_type_111#', '#get_titleid.title_id#', '#b_name_5#', '', '#s_name_5#', '', '', '', '#property_address#', 'To Be Determined', '#a_total_settlmnt_charges#', '#a_total_settlmnt_charges2#', '#a_220#', '#a_206_a#', '#a_206_b#', '#a_301#', '#a_302#', '#a_total_settlmnt_charges3#')

			</CFQUERY>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg2(title_id, a_804_c, a_805_a, a_806_a, a_807_a, a_808_a, a_805_c, a_806_c, a_807_c, a_808_c, a_805_b, a_806_b, a_807_b, a_808_b, a_810_a, a_810_b, a_811_a, a_811_b, a_1101_a,  a_1102_a, a_1103_a,  a_1104_a,  a_1105_a,  a_1106_a,  a_1107_a,  a_1111_a,  a_1112_a,  a_1113_a,  a_1114_a, a_1114_c, a_1205_a,  a_1303_a,  a_1304_a,  a_1305_a,  a_1108_a, a_1108_b, a_1201_a, a_1201_b, a_1201_c, a_1201_d, a_1201_e, a_1202_a, a_1202_b, a_1202_c, a_1202_d, a_1202_e, a_1203_a, a_1203_b, a_1203_c, a_1203_d, a_1203_e, a_1204_a, a_1204_b, a_1204_c, a_1400_a, a_1306_a, a_1307_a, a_1306_b, a_1307_b, loan_mort_stamps, loan_intang_tx, piggy_mort_stamps, piggy_intang_tx, first_ins_premium, second_ins_premium)
				VALUES(#get_titleid.title_id#, '#a_804_c#', '#a_805_a#', '#a_806_a#', '#a_807_a#', '#a_808_a#', '#a_805_c#', '#a_806_c#', '#a_807_c#', '#a_808_c#', '#a_805_b#', '#a_806_b#', '#a_807_b#', '#a_808_b#', '#a_810_a#', '#a_810_b#', '#a_811_a#', '#a_811_b#', '#a_1101_a#', '#a_1102_a#',  '#a_1103_a#',  '#a_1104_a#',  '#a_1105_a#',  '#a_1106_a#',  '#a_1107_a#',  '#a_1111_a#',  '#a_1112_a#',  '#a_1113_a#', '#a_1114_a#', '#a_1114_c#', '#a_1205_a#',  '#a_1303_a#', '#a_1304_a#', '#a_1305_a#', '#ins_premium#', '0', '0', '#rec_fee#', '#rel_fee#', '#total_fee#', '0', '0', '0', '#mort_stamps#', '#mort_stamps#', '0', '0', '#deed_state#', '#s_mort_stamps#', '#a_line_total_1203#', '0', 'Intangable Tax', '#intang_tx#', '0', '#a_total_settlmnt_charges#', '#merge1#', '#piggytext#', '#mergenum1#', '#piggy#', '#loan_mort_stamps#', '#loan_intang_tx#', '#piggy_mort_stamps#', '#piggy_intang_tx#', '#first_ins_premium#', '#second_ins_premium#')

</CFQUERY>



</cfif>


<cfelse>
<Cfset ins_premium = "Call for Quote">
				<CFQUERY datasource="#request.dsn#" NAME="end_rates1">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge1#'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="end_rates2">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge2#'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="end_rates3">
			SELECT *
			FROM end_rates
			WHERE ENDORSEMENTS = '#merge3#'
		</CFQUERY>
	<cfif #end_rates1.recordcount# GT "0">
<cfif #merge1# eq "">
<cfset mergenum1 = 0>
<cfelse>
<cfset mergenum1 = #end_rates1.rates#>
</cfif>
<cfelse>
<cfset mergenum1 = 0>
</cfif>

<cfif #end_rates2.recordcount# GT "0">
<cfif #merge2# eq "">
<cfset mergenum2 = 0>
<cfelse>
<cfset mergenum2 = #end_rates2.rates#>
</cfif>
<cfelse>
<cfset mergenum2 = 0>
</cfif>

<cfif #end_rates3.recordcount# GT "0">
<cfif #merge3# eq "">
<cfset mergenum3 = 0>
<cfelse>
<cfset mergenum3 = #end_rates3.rates#>
</cfif>
<cfelse>
<cfset mergenum3 = 0>
</cfif>


<cfif #get_titleid.comp_id# EQ "254">
		<cfif #pstate# EQ "PA" OR #pstate# EQ "MI">
		<cfset a_1114_a = "0">
		<cfset a_1114_c = "">
		<cfelse>
		<cfset a_1114_a = "550">
		<cfset a_1114_c = "Title Clearance Fee">
		</cfif>
		<cfelse>
		<cfset a_1114_a = 0>
		<cfset a_1114_c = "">
		</cfif>

		<cfif #get_titleid.comp_id# EQ "254">

		<cfif (#pstate# EQ "NH") OR (#pstate# EQ "OH") OR (#pstate# EQ "VA")>

		<cfset a_810_b = "0">
		<cfset a_810_a = "">

		<CFELSEIF #pstate# EQ "IN">
		<CFIF (#SearchType# EQ "Refinance") OR (#SearchType# EQ "Purchase")>
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</CFIF>

		<CFELSEIF #pstate# EQ "PA">
		<CFIF #loanamt_float# GT "55000">
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</CFIF>

		<CFELSEIF #pstate# EQ "WI">
		<CFIF #loanamt_float# GT "25000">
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</CFIF>

		<CFELSE>
		<cfset a_810_b = "340">
		<cfset a_810_a = "Mortgage Application Fee">
		</CFIF>


		<cfelse>
		<cfset a_810_b = "0">
		<cfset a_810_a = "">
		</cfif>


		<cfif #get_titleid.comp_id# EQ "254">
		<cfset a_811_b = "15">
		<cfset a_811_a = "Life of Loan Flood Cert Fee">
		<cfelse>
		<cfset a_811_b = "0">
		<cfset a_811_a = "">
		</cfif>
<cfif #get_titleid.piggy# eq 1>
		<cfset piggy = "250">
		<cfset piggytext = "Secondary Mortgage Fee">
		<cfelse>
		<cfset piggy = "0">
		<cfset piggytext = "">
		</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_comp">
SELECT *
FROM companies
WHERE id = '#comp_id#'
</CFQUERY>

			<cfif #read_comp.id# eq 154 or #read_comp.id# eq 155 or #read_comp.id# eq 156 or #read_comp.id# eq 157 or #read_comp.id# eq 158 or #read_comp.id# eq 159 or #read_comp.id# eq 160 or #read_comp.id# eq 161 or #read_comp.id# eq 162 or #read_comp.id# eq 163 or #read_comp.id# eq 164 or #read_comp.id# eq 165 or #read_comp.id# eq 166 or #read_comp.id# eq 167 or #read_comp.id# eq 168 or #read_comp.id# eq 169 or #read_comp.id# eq 170 or #read_comp.id# eq 182 or #read_comp.id# eq 181 or #read_comp.id# eq 183 or #read_comp.id# eq 184 or #read_comp.id# eq 185 or #read_comp.id# eq 186 or #read_comp.id# eq 187 or #read_comp.id# eq 188 or #read_comp.id# eq 189 or #read_comp.id# eq 192 or #read_comp.id# eq 190 or #read_comp.id# eq 193 or #read_comp.id# eq 194 or #read_comp.id# eq 195 or #read_comp.id# eq 196 or #read_comp.id# eq 197  or #read_comp.id# eq 198  or #read_comp.id# eq 199  or #read_comp.id# eq 200  or #read_comp.id# eq 201>
			<cfset a_804_c = "POC L $8.50">
			<cfset a_805_a = "Processing Fee to Homeowners Loan">
			<cfset a_806_a = "Funding Fee to Homeowners Loan">
			<cfset a_807_a = "Administration Fee to Homeowners Loan">
			<cfset a_808_a = "Document Preparation to Homeowners Loan">
			<cfset a_805_c = "">
			<cfset a_806_c = "">
			<cfset a_807_c = "">
			<cfset a_808_c = "">
			<cfset a_805_b = "390">
			<cfset a_806_b = "365">
			<cfset a_807_b = "295">
			<cfset a_808_b = "195">
			<cfelse>

			<cfset a_804_c = "">
			<cfset a_805_a = "">
			<cfset a_806_a = "">
			<cfset a_807_a = "">
			<cfset a_808_a = "">
			<cfset a_805_c = "">
			<cfset a_806_c = "">
			<cfset a_807_c = "">
			<cfset a_808_c = "">
			<cfset a_805_b = "0">
			<cfset a_806_b = "0">
			<cfset a_807_b = "0">
			<cfset a_808_b = "0">
			</cfif>

			<CFSET a_total_settlmnt_charges = #rec_fee#

													+ #rel_fee#

													+ #a_line_total_1203#
													+ #mort_stamps#
													+ #intang_tx#
													+ #a_805_b#
													+ #a_806_b#
													+ #a_807_b#
													+ #a_808_b#
													+ #a_810_b#
													+ #a_811_b#
													+ #a_1102_a#
													+ #a_1101_a#
													+ #a_1102_a#
													+ #a_1103_a#
													+ #a_1104_a#
													+ #a_1105_a#
													+ #a_1106_a#
													+ #a_1107_a#
													+ #a_1111_a#
													+ #a_1112_a#
													+ #a_1113_a#
													+ #a_1114_a#
													+ #a_1205_a#
													+ #a_1303_a#
													+ #a_1304_a#
													+ #a_1305_a#
													+ #mergenum1#
													+ #piggy#
													>
			<cfif #get_titleid.purchase# NEQ "">
<CFSET a_101 = #round(get_titleid.purchase)#>
<CFELSE>
<Cfset a_101 = "0">
</CFIF>

	<CFSET a_total_settlmnt_charges2 = #a_total_settlmnt_charges# + #a_101#>

			<cfif #get_titleid.secloan# NEQ "">


		<CFSET a_206_a = "Second Mortgage">
		<CFSET a_206_b = "#get_titleid.secloan#">
		<CFSET a_220 = #Round(loanamt_float)# + #get_titleid.secloan#>

			<CFSET a_301 = #a_total_settlmnt_charges2#>

			<CFSET a_302 = #a_220# + #a_206_b#>
			<cfif #get_titleid.hud_type# EQ "0">
			<CFSET a_total_settlmnt_charges3 = #a_301# - #a_302#>
			<cfelse>
			<CFSET a_total_settlmnt_charges3 = #a_302# - #a_301#>
			</CFIF>

		<cfelse>

		<CFSET a_220 = #Round(loanamt_float)#>
				<CFSET a_206_a = "">
		<CFSET a_206_b = "0">
			<CFSET a_301 = #a_total_settlmnt_charges2#>

			<CFSET a_302 = #a_220#>
			<cfif #get_titleid.hud_type# EQ "0">
			<CFSET a_total_settlmnt_charges3 = #a_301# - #a_302#>
			<cfelse>
			<CFSET a_total_settlmnt_charges3 = #a_302# - #a_301#>
			</CFIF>

		</cfif>
						<cfif #a_805_b# eq "0">
					<cfset a_805_b = "">
			</cfif>
			<cfif #a_806_b# eq "0">
					<cfset a_806_b = "">
			</cfif>
			<cfif #a_807_b# eq "0">
					<cfset a_807_b = "">
			</cfif>

			<cfif #a_807_b# eq "0">
					<cfset a_807_b = "">
			</cfif>
<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg1(title_id, a_1, a_6, D_BName, D_BAddr, E_SName, E_SAddr, F_LName, F_LAddr, G_PropAddr, I_SettlementDate, a_103 , a_120, a_220, a_206_a, a_206_b, a_301, a_302, a_303 )
				VALUES(#get_titleid.title_id#, '#loan_type_111#', '#get_titleid.title_id#', '#b_name_5#', '', '#s_name_5#', '', '', '', '#property_address#', 'To Be Determined', '#a_total_settlmnt_charges#', '#a_total_settlmnt_charges2#', '#a_220#', '#a_206_a#', '#a_206_b#', '#a_301#', '#a_302#', '#a_total_settlmnt_charges3#')

			</CFQUERY>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg2(title_id, a_804_c, a_805_a, a_806_a, a_807_a, a_808_a, a_805_c, a_806_c, a_807_c, a_808_c, a_805_b, a_806_b, a_807_b, a_808_b, a_810_a, a_810_b, a_811_a, a_811_b, a_1101_a,  a_1102_a, a_1103_a,  a_1104_a,  a_1105_a,  a_1106_a,  a_1107_a,  a_1111_a,  a_1112_a,  a_1113_a, a_1114_a, a_1114_c,  a_1205_a,  a_1303_a,  a_1304_a,  a_1305_a,  a_1108_a, a_1108_b, a_1201_a, a_1201_b, a_1201_c, a_1201_d, a_1201_e, a_1202_a, a_1202_b, a_1202_c, a_1202_d, a_1202_e, a_1203_a, a_1203_b, a_1203_c, a_1203_d, a_1203_e, a_1204_a, a_1204_b, a_1204_c, a_1400_a, a_1306_a, a_1307_a, a_1306_b, a_1307_b, loan_mort_stamps, loan_intang_tx, piggy_mort_stamps, piggy_intang_tx, first_ins_premium, second_ins_premium)
				VALUES(#get_titleid.title_id#, '#a_804_c#', '#a_805_a#', '#a_806_a#', '#a_807_a#', '#a_808_a#', '#a_805_c#', '#a_806_c#', '#a_807_c#', '#a_808_c#', '#a_805_b#', '#a_806_b#', '#a_807_b#', '#a_808_b#', '#a_810_a#', '#a_810_b#', '#a_811_a#', '#a_811_b#', '#a_1101_a#', '#a_1102_a#',  '#a_1103_a#',  '#a_1104_a#',  '#a_1105_a#',  '#a_1106_a#',  '#a_1107_a#',  '#a_1111_a#',  '#a_1112_a#',  '#a_1113_a#', '#a_1114_a#', '#a_1114_c#',  '#a_1205_a#',  '#a_1303_a#', '#a_1304_a#', '#a_1305_a#', '#ins_premium#', '0', '0', '#rec_fee#', '#rel_fee#', '#total_fee#', '0', '0', '0', '#mort_stamps#', '#mort_stamps#', '0', '0', '#deed_state#', '#s_mort_stamps#', '#a_line_total_1203#', '0', 'Intangable Tax', '#intang_tx#', '0', '#a_total_settlmnt_charges#', '#merge1#', '#piggytext#', '#mergenum1#', '#piggy#', '#loan_mort_stamps#', '#loan_intang_tx#', '#piggy_mort_stamps#', '#piggy_intang_tx#', '#first_ins_premium#', '#second_ins_premium#')

</CFQUERY>


</cfif>
		<!--- ============================================== --->




<CFQUERY datasource="#request.dsn#" NAME="getcompany">
	SELECT *
	FROM companies
	WHERE ID = #RU.comp_id#
</CFQUERY>




<!-------------------------------------------------------------------->

<!--- ================================================= --->
<!--- ===/ [ Output file for TSS Import Function ] \=== --->
<!--- ================================================= --->

<CFSET d_out = '"' & #get_titleid.title_id# & '"' & ","  &
				'"' & #getcompany.company# & '"' & ","  &
				'"' & #RU_name# & '"' & ","  &
				'"' & "Loan Processor Phone: " & #RU.lp_phone# & " " &  " Ext " & '#RU.lp_ext#' & " Fax " & #RU.lp_fax# & '"' & "," &
				'"' & #blastname1# & "\" &  #bfirstname1# & #bminame1# & '"' & "," &
				'"' & #bssn1# & '"' & "," &
				'"' & #bhphone1# & '"' & "," &
				'"' & #bwphone1# & '"' & "," &
				'"' & "Work Phone Ext: " & #bext1# & '"' & "," &
				'"' & #blastname2# & "\" &  #bfirstname2# & #bminame2# & '"' & "," &
				'"' & #bssn2# & '"' & "," &
				'"' & #bhphone2# & " " & #bwphone2# & " " & "Work Phone Ext: " & #bext2# & '"' & "," &
				'"' & #slastname1# & "\" &  #sfirstname1# & #sminame1# & '"' & "," &
				'"' & #sssn1# & '"' & "," &
				'"' & #shphone1# & '"' & "," &
				'"' & #swphone1# & '"' & "," &
				'"' & "Work Phone Ext: " & #sext1# & '"' & "," &
				'"' & #slastname2# & "\" &  #sfirstname2# & #sminame2# & '"' & "," &
				'"' & #sssn2# & '"' & "," &
				'"' & #shphone2# & " " & #swphone2# & "Work Phone Ext: " & #sext2# & '"' & "," &
				'"' & #paddress# & '"' & "," &
				'"' & #pcity# & '"' & "," &
				'"' & #pstate# & '"' & "," &
				'"' & #pzip# & '"' & "," &
				'"' & #pcounty# & '"' & "," &
				'"' & #plegaldesc# & '"' & "," &
				'"' & #condo_pud# & '"' & "," &
				'"' & "Sale" & "," &
				'"' & #insured# & '"' & "," &
				'"' & #NumberFormat("#loanamt_float#", "999999.99")# & '"' & "," &
				'"' & #polender1# & '"' & "," &
				'"' & #poacctno1# & '"' & "," &
				'"' & #pophone1# & '"' & "," &
				'"' & #polender2# & '"' & "," &
				'"' & #poacctno2# & '"' & "," &
				'"' & #pophone2# & '"' & "," &
				'"' & "Your E-Mail: " &  #verifyemail# & '"' & "," &
				'"' & "Other E-Mail1: " &  #verifyemail_2# & '"' & "," &
				'"' & "Other E-Mail2: " &  #verifyemail_3# & '"' & "," &
				'"' & "Receive E-Mail: " &  #rptbyemail# & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & ","
				>

<!--- read out the last number used for a file name --->

	<CFFILE ACTION="read"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	variable="n_OUT">

<!--- increment that number --->

	<CFSET n_no = #n_out# + "1">

<!--- delete the old file with the old number --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\file_number\file_no.txt" --->
	<CFFILE ACTION="delete"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	>
<!--- write the new number to the file --->

	<CFFILE ACTION="WRITE"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	OUTPUT="#n_no#">

<!--- now writ the data for this order to the file --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\dhfvtywty_1\data_#n_no#.txt" --->
	<CFFILE ACTION="WRITE"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\dhfvtywty_1\data_#n_no#.txt"
	OUTPUT="#D_OUT#">





<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE id = #url.USER_ID_1#
		ORDER BY lp_lname ASC
	</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">

			SELECT *
			FROM loan_officers
			WHERE ID = #url.lo_ID#

		</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_title">

				SELECT *
				FROM title
				WHERE title_ID = #get_titleid.title_id#

			</CFQUERY>

			<CFIF (#pstate# EQ "AL") OR (#pstate# EQ "CT") or (#pstate# EQ "DC") or (#pstate# EQ "DE") or (#pstate# EQ "FL") or (#pstate# EQ "GA") or (#pstate# EQ "KY") or (#pstate# EQ "MA") or (#pstate# EQ "ME") or (#pstate# EQ "MD") or (#pstate# EQ "CO") or (#pstate# EQ "NJ")>
<CFSET b_emails_to_first_title = "akumar@firsttitleservices.com">
<CFELSEIF (#pstate# EQ "AR") OR (#pstate# EQ "NC") or (#pstate# EQ "IN") or (#pstate# EQ "MI") or (#pstate# EQ "MO") or (#pstate# EQ "TN") or (#pstate# EQ "VA") or (#pstate# EQ "WI") or (#pstate# EQ "AZ") or (#pstate# EQ "MT")>
<CFSET b_emails_to_first_title = "akumar@firsttitleservices.com">
<CFELSEIF (#pstate# EQ "IA") OR (#pstate# EQ "IL") or (#pstate# EQ "KS") or (#pstate# EQ "LA") or (#pstate# EQ "MN") or (#pstate# EQ "MS") or (#pstate# EQ "NH") or (#pstate# EQ "NY") or (#pstate# EQ "ND") or (#pstate# EQ "OH") or (#pstate# EQ "PA") or (#pstate# EQ "RI") or (#pstate# EQ "VT") or (#pstate# EQ "WV")>
<CFSET b_emails_to_first_title = "akumar@firsttitleservices.com,pgibb@firsttitleservices.com">
<CFELSE>
<CFSET b_emails_to_first_title = "akumar@firsttitleservices.com,pgibb@firsttitleservices.com">
</CFIF>
				<CFMAIL
				TO="#b_emails_to_first_title#"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="Summary of Order #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1# -- #getcompany.company#"
				TIMEOUT="600"
				type="HTML"
				>


				<center>
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B> CLIENT: #getcompany.company#</B></CENTER>
			</TD>
		</TR>


		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B> Order #get_titleid.title_id#</B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CLIENT SPECIFIC INFORMATION</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Officer:</b>
						</TD>

						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Processor:</b>
						</TD>

					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_loan_offcr.lo_lname#, #read_loan_offcr.lo_fname#</B>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_user.lp_lname#, #read_user.lp_fname#</B>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_phone#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_user.lp_phone#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_ext#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_ext#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_fax#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_fax#</b>
						</td>
					</tr>

					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>
					</tr>

					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_email#</b>
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_email#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

</table>





<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>BORROWER / SELLER INFORMATION</B></CENTER><br><FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Borrowers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname1#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame1#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone1#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext1#</b>
						</td>

					</tr>

		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ SECOND ] \=== --->
		<!--- =================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname2#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame2#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone2#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext2#</b>
						</td>

					</tr>

					<tr>
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->

		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Sellers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- ================================== --->
		<!--- ===/  SELLERS Info [ FIRST ]  \=== --->
		<!--- ================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#slastname1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sfirstname1#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sminame1#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sssn1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#shphone1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#swphone1#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sext1#</b>
						</td>

					</tr>

		<!--- ================================== --->
		<!--- ===/ SELLERS  Info [ SECOND ] \=== --->
		<!--- ================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#slastname2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sfirstname2#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sminame2#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sssn2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#shphone2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#swphone2#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sext2#</b>
						</td>

					</tr>

					<tr>
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>

				</table>
			</td>
		</tr>


</table>



<!--- ======================================================================== --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PROPERTY ADDRESS</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Street Address <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#paddress#</b>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							City, State, Zip:</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<NOBR><FONT FACE=verdana SIZE=1 color="blue"><b>#pcity#,&nbsp;#pstate#  #pzip#</b>
							</NOBR>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pcounty#</b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Legal Description <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#plegaldesc#</b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Property Use <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#prop_use_type#</B>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is this a Condo or PUD <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#condo_pud#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>


</table>
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>LOAN NUMBER</B></CENTER>
			</TD>
		</TR>
		<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Number <br>
						</td>
		<td width=314  bgcolor="f1f1f1" align=left valign=top>
							#loan_number#
						</td>
		</tr>

			<tr>
			<td width=519 colspan = 2 bgcolor="f1f1f1" align=center valign=top>

							<FONT FACE=ARIAL SIZE=1 color="gray">
							Type of HUD selected:


	<FONT FACE=ARIAL SIZE=2 color="red">
							<cfif #hud_type# eq 0>HUD1<cfelse>HUD1A</cfif>


		</td>


		</TR>

</table>
<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/       [ COMMENTS ]  TOP         \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>COMMENTS</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#a_COMMENT#</B>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->

<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/        [ PAYOFF ]  TOP          \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PAYOFF INFORMATION:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Payoff Lender  [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#polender1#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#poacctno1#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pophone1#</b>
						</td>
					</tr>

		<!--- ==================================== --->
		<!--- ===/ Payoff Lender  [ SECOND ]  \=== --->
		<!--- ==================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Second Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#polender2#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#poacctno2#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pophone2#</b>
						</td>
					</tr>


					<tr>
						<td width=172 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>

						<td width=172  bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->





<!--- ================================================ --->
<!--- ===/          [ TITLE INSURANCE ]           \=== --->
<!--- ================================================ --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>TITLE INSURANCE INFORMATION:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Transaction Type
						</td>

						<td width=150 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#SearchType#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Deed Transfer
						</td>

						<td width=144 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Deedtransfer#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Proposed Insured
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Insured#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Amt
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#loanamt_float#</b>
						</td>
					</tr>
							<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
						Purchase price
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#purchase#</b>
						</td>
					</tr>
<tr>
			<td width=519 colspan = 4 bgcolor="f1f1f1" align=left valign=top>

							<NOBR><FONT FACE=ARIAL SIZE=1 color="gray">
							Will there be a piggyback second mortgage closed with the above loan?
						<FONT FACE=ARIAL SIZE=2 color="red">
							<CFIF #piggy# EQ "0">NO<CFELSE>YES</CFIF></td>


		</TR>

			<tr>
			<td width=519 colspan = 4 bgcolor="f1f1f1" align=left valign=top>

							<NOBR><FONT FACE=ARIAL SIZE=1 color="gray">
							Will title insurance be required on this piggyback loan?
						<FONT FACE=ARIAL SIZE=2 color="red">
							<cfif #ins# eq 0>NO<cfelse>YES</CFIF>


		</td></TR>
				<tr>
			<td width=519 colspan = 4 bgcolor="f1f1f1" align=left valign=top>

							<NOBR><FONT FACE=ARIAL SIZE=1 color="gray">
							What is the loan amount of this second mortgage loan? #secloan#

		</td></TR>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Type
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#loan_type_111#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Program
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#loan_program_333#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->


<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ICL INFORMATION:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>


					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							ICL REQUEST
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b><CFIF #read_title.request_icl# neq "">Yes<cfelse>No</cfif></b>
						</td>
					</tr>



				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>


<!--- ========================================= --->
<!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Verify Order was Received</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address, you will receive a confirmation  e-mail of your order having been received by us.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail#</b>
						</td>
					</tr>

					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to up to two other e-mail addresses.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail_2#</b><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Fax:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#fax_no#</b>


						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<!--- =========================================== --->
<!--- ===/    [ RECEIVE REPORT ]  TOP        \=== --->
<!--- =========================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Request copy of Final Report</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>If you would like to receive a copy of the final report, please provide us with an email address.</b><br>
			<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail_3#</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#RptbyEmail#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<p>
<!--- ======================================================================== --->

						</td>
								</tr>
							</table>

						</TD>
					</TR>
				</table>
		</TD>
	</TR>
</TABLE>
</center>
	</cfmail>

<!---
<CFLOOP FROM="1" TO="3" INDEX="DDD">


			<CFIF #DDD# EQ "1">

				<CFSET vmail = #get_titleid.verifyemail#>

			<CFELSEIF #DDD# EQ "2">

				<CFSET vmail = #get_titleid.verifyemail_2#>

			<CFELSE>

				<CFSET vmail = #get_titleid.verifyemail_3#>

			</CFIF>




 here is where we check to see if vmail is blank --->
<!--- if it is blank, then we skip the e-mail

<CFIF #vmail# NEQ "">
	--->

<CFQUERY datasource="#request.dsn#" NAME="get_user">

			SELECT *
			FROM user_client_assoc
			WHERE company_id = #comp_id#
		order by id
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="insert_user">
		SELECT *
		FROM users
		WHERE id = #url.USER_ID_1#
		ORDER BY lp_lname ASC
	</CFQUERY>

	<cfif (#get_titleid.comp_id# neq "115") OR (#get_titleid.comp_id# neq "621")>

		<cfif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# neq "">
<CFMAIL
TO="#get_titleid.verifyemail#,#insert_user.cc_email_1#,#insert_user.cc_email_2#"
FROM="#team_email#"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>

<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   


<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFLOOP query = "get_user">

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
		order by position
		</CFQUERY>



		<cfif #retrieve_user.recordcount# GT 0><tr>
		<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
		</TR>	</cfif>



	</cfloop>




	</table></cfif>

</cfmail>
<cfelseif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# eq "">
<CFMAIL
TO="#get_titleid.verifyemail#,#insert_user.cc_email_1#,nelli@firsttitleservices.com"
FROM="#team_email#"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>

<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   


<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFLOOP query = "get_user">

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
		order by position
		</CFQUERY>



		<cfif #retrieve_user.recordcount# GT 0><tr>
		<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
		</TR>	</cfif>



	</cfloop>




	</table></cfif>

</cfmail>
<cfelseif #read_user.cc_email_1# eq "" and #read_user.cc_email_2# neq "">
<CFMAIL
TO="#get_titleid.verifyemail#,#insert_user.cc_email_2#,nelli@firsttitleservices.com"
FROM="#team_email#"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>

<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   


<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFLOOP query = "get_user">

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">
		SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
		order by position
		</CFQUERY>



		<cfif #retrieve_user.recordcount# GT 0><tr>
		<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
		</TR>	</cfif>



	</cfloop>




	</table></cfif>

</cfmail>
<cfelse>
<CFMAIL
TO="#get_titleid.verifyemail#,nelli@firsttitleservices.com"
FROM="#team_email#"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>

<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   


<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFLOOP query = "get_user">

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
		order by position
		</CFQUERY>



		<cfif #retrieve_user.recordcount# GT 0><tr>
		<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
		</TR>	</cfif>



	</cfloop>




	</table></cfif>

</cfmail>
</cfif>
<cfelse>

<cfif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# neq "">
<CFMAIL
TO="nelli@firsttitleservices.com"
FROM="#team_email#"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>

<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   


<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFLOOP query = "get_user">

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

		SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
		order by position
		</CFQUERY>



		<cfif #retrieve_user.recordcount# GT 0><tr>
		<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
		</TR>	</cfif>



	</cfloop>




	</table></cfif>

</cfmail>
<cfelseif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# eq "">
<CFMAIL
TO="nelli@firsttitleservices.com"
FROM="#team_email#"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>

<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   


<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFLOOP query = "get_user">

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
		order by position
		</CFQUERY>



		<cfif #retrieve_user.recordcount# GT 0><tr>
		<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
		</TR>	</cfif>



	</cfloop>




	</table></cfif>

</cfmail>
<cfelseif #read_user.cc_email_1# eq "" and #read_user.cc_email_2# neq "">
<CFMAIL
TO="nelli@firsttitleservices.com"
FROM="#team_email#"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>

<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   


<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFLOOP query = "get_user">

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
		order by position
		</CFQUERY>



		<cfif #retrieve_user.recordcount# GT 0><tr>
		<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
		</TR>	</cfif>



	</cfloop>




	</table></cfif>

</cfmail>
<cfelse>
<CFMAIL
TO="nelli@firsttitleservices.com"
FROM="#team_email#"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>
<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFLOOP query = "get_user">

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
		order by position
		</CFQUERY>



		<cfif #retrieve_user.recordcount# GT 0><tr>
		<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
		</TR>	</cfif>



	</cfloop>




	</table></cfif>

</cfmail>
</cfif>

</cfif>



<CFQUERY datasource="#request.dsn#" NAME="get_p">

			SELECT *
			FROM thirdparty
			WHERE id = '#thirdp#'

		</CFQUERY>

		<cfif #thirdp# NEQ "">
		<cfif #get_p.recordcount# GT 0>

<CFMAIL
TO="#get_p.email#,nelli@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>YOU HAVE BEEN INVITED TO VIEW TITLE INFORMATION AS ORDERED ON THE FIRST TITLE WEB SYSTEM</B></center><br><p>
				<center>A Title Commitment Request Order has just been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<center>A HUD-1 has been
instantly prepared for your viewing! Click <a href="https://#cgi.server_name#/title_view_hud_pg1.cfm?comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New" onClick="window.open('','New','left=0,top=0,width=1010,height=710,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img border=0 src="https://#cgi.server_name#/images/button_est_hud_1.gif"></a> now OR view <a href="https://#cgi.server_name#/fee_sheet.cfm?comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center><br>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFLOOP query = "get_user">

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
		order by position
		</CFQUERY>



		<cfif #retrieve_user.recordcount# GT 0><tr>
		<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
		</TR>	</cfif>



	</cfloop>




	</table>

	</cfif>
	</cfmail>

	</cfif>

	</cfif>

<cfif #request_icl# eq "Yes">
<!--- wrong url N 07/14/05<CFLOCATION URL="https://#cgi.server_name#/order_verify_title_icl.cfm?title_id=#get_titleid.title_id#&merge1=#merge1#&merge2=#merge2#&merge3=#merge3#&comp_id=#comp_id#&estimate_value=#estimate_value#&appraisal_type=#appraisal_type#&loan_number=#loan_number#&file_upload=#file_upload#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&blastname1=#blastname1#&bfirstname1=#bfirstname1#&bminame1=#bminame1#&bssn1=#bssn1#&bhphone1=#bhphone1#&bwphone1=#bwphone1#&bext1=#bext1#&blastname2=#blastname2#&bfirstname2=#bfirstname2#&bminame2=#bminame2#&bssn2=#bssn2#&bhphone2=#bhphone2#&bwphone2=#bwphone2#&bext2=#bext2#&slastname1=#slastname1#&sfirstname1=#sfirstname1#&sminame1=#sminame1#&sssn1=#sssn1#&shphone1=#shphone1#&swphone1=#swphone1#&sext1=#sext1#&slastname2=#slastname2#&sfirstname2=#sfirstname2#&sminame2=#sminame2#&sssn2=#sssn2#&shphone2=#shphone2#&swphone2=#swphone2#&sext2=#sext2#&thirdp=#thirdp#&paddress=#paddress#&pcity=#pcity#&pstate=#pstate#&pzip=#pzip#&pcounty=#pcounty#&plegaldesc=#plegaldesc#&prop_use_type=#prop_use_type#&condo_pud=#condo_pud#&a_comment=#a_comment#&polender1=#polender1#&poacctno1=#poacctno1#&pophone1=#pophone1#&polender2=#polender2#&poacctno2=#poacctno2#&pophone2=#pophone2#&SearchType=#SearchType#&purchase=#purchase#&Deedtransfer=#Deedtransfer#&Insured=#Insured#&otherpro=#otherpro#&loanamt_float=#loanamt_float#&loan_type_111=#loan_type_111#&loan_program_333=#loan_program_333#&Verifyemail=#Verifyemail#&Verifyemail_2=#Verifyemail_2#&Verifyemail_3=#Verifyemail_3#&fax_no=#fax_no#&RptbyEmail=#RptbyEmail#&request_icl=#request_icl#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#">--->
<CFLOCATION URL="https://#cgi.server_name#/order_verify_title_icl.cfm?title_id=#get_titleid.title_id#&merge1=#merge1#&merge2=#merge2#&merge3=#merge3#&comp_id=#comp_id#&estimate_value=#estimate_value#&appraisal_type=#appraisal_type#&loan_number=#loan_number#&file_upload=#file_upload#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&blastname1=#blastname1#&bfirstname1=#bfirstname1#&bminame1=#bminame1#&bssn1=#bssn1#&bhphone1=#bhphone1#&bwphone1=#bwphone1#&bext1=#bext1#&blastname2=#blastname2#&bfirstname2=#bfirstname2#&bminame2=#bminame2#&bssn2=#bssn2#&bhphone2=#bhphone2#&bwphone2=#bwphone2#&bext2=#bext2#&slastname1=#slastname1#&sfirstname1=#sfirstname1#&sminame1=#sminame1#&sssn1=#sssn1#&shphone1=#shphone1#&swphone1=#swphone1#&sext1=#sext1#&slastname2=#slastname2#&sfirstname2=#sfirstname2#&sminame2=#sminame2#&sssn2=#sssn2#&shphone2=#shphone2#&swphone2=#swphone2#&sext2=#sext2#&thirdp=#thirdp#&paddress=#paddress#&pcity=#pcity#&pstate=#pstate#&pzip=#pzip#&pcounty=#pcounty#&plegaldesc=#plegaldesc#&prop_use_type=#prop_use_type#&condo_pud=#condo_pud#&a_comment=#a_comment#&polender1=#polender1#&poacctno1=#poacctno1#&pophone1=#pophone1#&polender2=#polender2#&poacctno2=#poacctno2#&pophone2=#pophone2#&SearchType=#SearchType#&purchase=#purchase#&Deedtransfer=#Deedtransfer#&Insured=#Insured#&otherpro=#otherpro#&loanamt_float=#loanamt_float#&loan_type_111=#loan_type_111#&loan_program_333=#loan_program_333#&Verifyemail=#Verifyemail#&Verifyemail_2=#Verifyemail_2#&Verifyemail_3=#Verifyemail_3#&fax_no=#fax_no#&RptbyEmail=#RptbyEmail#&request_icl=#request_icl#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#">
</cfif>

<cfif #appraisal# eq 1>


<script type="text/javascript">
function go(frm) {
window.location=frm;
}


</script>
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


		<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
<title>1st Title & Escrow, Inc. - Title Request Form</title>
</head>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

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
        <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=1,menubar=1')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>
				<p>
				<img src="./images/appraisal_title.gif">


<CFFORM NAME="frm" ACTION="./order_verify_title_appraisal.cfm?comp_id=#comp_id#&loan_number=#loan_number#&title_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&blastname1=#blastname1#&bfirstname1=#bfirstname1#&bminame1=#bminame1#&bssn1=#bssn1#&bhphone1=#bhphone1#&bwphone1=#bwphone1#&bext1=#bext1#&blastname2=#blastname2#&bfirstname2=#bfirstname2#&bminame2=#bminame2#&bssn2=#bssn2#&bhphone2=#bhphone2#&bwphone2=#bwphone2#&bext2=#bext2#&slastname1=#slastname1#&sfirstname1=#sfirstname1#&sminame1=#sminame1#&sssn1=#sssn1#&shphone1=#shphone1#&swphone1=#swphone1#&sext1=#sext1#&slastname2=#slastname2#&sfirstname2=#sfirstname2#&sminame2=#sminame2#&sssn2=#sssn2#&shphone2=#shphone2#&swphone2=#swphone2#&sext2=#sext2#&paddress=#paddress#&pcity=#pcity#&pstate=#pstate#&pzip=#pzip#&pcounty=#pcounty#&plegaldesc=#plegaldesc#&prop_use_type=#prop_use_type#&condo_pud=#condo_pud#&a_comment=#a_comment#&polender1=#polender1#&poacctno1=#poacctno1#&pophone1=#pophone1#&polender2=#polender2#&poacctno2=#poacctno2#&pophone2=#pophone2#&SearchType=#SearchType#&Deedtransfer=#Deedtransfer#&Insured=#Insured#&otherpro=#otherpro#&loanamt_float=#loanamt_float#&loan_type_111=#loan_type_111#&loan_program_333=#loan_program_333#&Verifyemail=#Verifyemail#&Verifyemail_2=#Verifyemail_2#&Verifyemail_3=#Verifyemail_3#&fax_no=#fax_no#&RptbyEmail=#RptbyEmail#&request_icl=#request_icl#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#" ENCTYPE="multipart/form-data" METHOD=POST>



   <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PAYMENT METHOD FOR APPRAISAL</B></CENTER>
			</TD>

</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>



					<TR>
						<TD width=514 bgcolor="d3d3d3" colspan=4 align="center">


							<table width=515 cellpadding=1 cellspacing=1 border=0>
								<tr>
									<td width=514 colspan=3 align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Please select an Appraisal Payment method below<br><br>
<cfif #appraisal_type# eq "1004" OR #appraisal_type# eq "1073" OR #appraisal_type# eq "1025" OR #appraisal_type# eq "2055">

<FONT FACE=ARIAL SIZE=1 color="maroon"><B>Bill us</B> <img src="./images/arrow_right.gif">
<input type="radio" name="pay_by" value = "1" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#get_titleid.title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&Verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=1');">&nbsp;&nbsp;&nbsp;&nbsp;
		<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>COD</B> <img src="./images/arrow_right.gif"> 								<input type="radio" name="pay_by" value = "2" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#get_titleid.title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=2');">&nbsp;&nbsp;&nbsp;&nbsp;
									<B>Pay by Credit Card</B> <img src="./images/arrow_right.gif">
										<input type="radio" name="pay_by" value = "3" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#get_titleid.title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=3');">&nbsp;&nbsp;&nbsp;&nbsp;									<B>Pay by Phone</B> <img src="./images/arrow_right.gif">
										<input type="radio" name="pay_by" value = "4" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#get_titleid.title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=4');">&nbsp;&nbsp;&nbsp;&nbsp;
	<cfelse>

	<FONT FACE=ARIAL SIZE=1 color="maroon"><B>Bill us</B> <img src="./images/arrow_right.gif">
<input type="radio" name="pay_by" value = "1" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#get_titleid.title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&Verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=1');">&nbsp;&nbsp;&nbsp;&nbsp;

									<B>Pay by Credit Card</B> <img src="./images/arrow_right.gif">
										<input type="radio" name="pay_by" value = "3" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#get_titleid.title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=3');">&nbsp;&nbsp;&nbsp;&nbsp;									<B>Pay by Phone</B> <img src="./images/arrow_right.gif">
										<input type="radio" name="pay_by" value = "4" onClick="go('https://<cfoutput>#cgi.server_name#</cfoutput>/appraisal_form.cfm?comp_id=<cfoutput>#comp_id#</cfoutput>&estimate_value=<cfoutput>#estimate_value#</cfoutput>&appraisal_type=<cfoutput>#appraisal_type#</cfoutput>&loan_number=<cfoutput>#loan_number#</cfoutput>&title_id=<cfoutput>#get_titleid.title_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&zip_id=<cfoutput>#zip_id#</cfoutput>&blastname1=<cfoutput>#blastname1#</cfoutput>&bfirstname1=<cfoutput>#bfirstname1#</cfoutput>&bminame1=<cfoutput>#bminame1#</cfoutput>&bssn1=<cfoutput>#bssn1#</cfoutput>&bhphone1=<cfoutput>#bhphone1#</cfoutput>&bwphone1=<cfoutput>#bwphone1#</cfoutput>&bext1=<cfoutput>#bext1#</cfoutput>&blastname2=<cfoutput>#blastname2#</cfoutput>&bfirstname2=<cfoutput>#bfirstname2#</cfoutput>&bminame2=<cfoutput>#bminame2#</cfoutput>&bssn2=<cfoutput>#bssn2#</cfoutput>&bhphone2=<cfoutput>#bhphone2#</cfoutput>&bwphone2=<cfoutput>#bwphone2#</cfoutput>&bext2=<cfoutput>#bext2#</cfoutput>&slastname1=<cfoutput>#slastname1#</cfoutput>&sfirstname1=<cfoutput>#sfirstname1#</cfoutput>&sminame1=<cfoutput>#sminame1#</cfoutput>&sssn1=<cfoutput>#sssn1#</cfoutput>&shphone1=<cfoutput>#shphone1#</cfoutput>&swphone1=<cfoutput>#swphone1#</cfoutput>&sext1=<cfoutput>#sext1#</cfoutput>&slastname2=<cfoutput>#slastname2#</cfoutput>&sfirstname2=<cfoutput>#sfirstname2#</cfoutput>&sminame2=<cfoutput>#sminame2#</cfoutput>&sssn2=<cfoutput>#sssn2#</cfoutput>&shphone2=<cfoutput>#shphone2#</cfoutput>&swphone2=<cfoutput>#swphone2#</cfoutput>&sext2=<cfoutput>#sext2#</cfoutput>&paddress=<cfoutput>#paddress#</cfoutput>&pcity=<cfoutput>#pcity#</cfoutput>&pstate=<cfoutput>#pstate#</cfoutput>&pzip=<cfoutput>#pzip#</cfoutput>&pcounty=<cfoutput>#pcounty#</cfoutput>&plegaldesc=<cfoutput>#plegaldesc#</cfoutput>&prop_use_type=<cfoutput>#prop_use_type#</cfoutput>&condo_pud=<cfoutput>#condo_pud#</cfoutput>&a_comment=<cfoutput>#a_comment#</cfoutput>&verifyemail=<cfoutput>#Verifyemail#</cfoutput>&Verifyemail_2=<cfoutput>#Verifyemail_2#</cfoutput>&Verifyemail_3=<cfoutput>#Verifyemail_3#</cfoutput>&fax_no=<cfoutput>#fax_no#</cfoutput>&RptbyEmail=<cfoutput>#RptbyEmail#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</cfoutput>&pay_by=4');">&nbsp;&nbsp;&nbsp;&nbsp;

	</cfif>

									</td>
								</tr>

							</table>
						</TD>
					</TR>
				</table>
		</TD>
	</TR>
</TABLE>
<p>



		<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>

</CFFORM>
</CENTER>
<cfelseif #other# eq 1>

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
<head><script type="text/javascript">
 function credSelect() {
 if (document.frm.credit.value != "") {

	 	if (document.frm.prop_use_type.value == "Investment/Other") {

				 if (document.getElementById('crdprmadd').style.display == 'none')
		     	 {
		          	document.getElementById('crdprmadd').style.display = 'block';
		     	 }
		}
		if (document.frm.credit.value == "infile") {

				 if (document.getElementById('credittable').style.display == 'none')
		     	 {
		          	document.getElementById('credittable').style.display = 'block';
		     	 }
		} else {
				if (document.getElementById('credittable').style.display == 'block')
		    	{
		        	document.getElementById('credittable').style.display = 'none';
		    	}
		}

		if (document.frm.credit.value == "reissue") {

			 if (document.getElementById('crdtbl').style.display == 'none')
		     {
		          document.getElementById('crdtbl').style.display = 'block';
		     }
		}
		else {
			if (document.getElementById('crdtbl').style.display == 'block')
		     {
		          document.getElementById('crdtbl').style.display = 'none';
		     }
		}

  } else{

	if (document.getElementById('crdprmadd').style.display == 'block')
    	{
        	document.getElementById('crdprmadd').style.display = 'none';
    	}
	if (document.getElementById('credittable').style.display == 'block')
    	{
        	document.getElementById('credittable').style.display = 'none';
    	}
  }



}


 function prodSelect() {

 if (document.frm.signing.value != "") {

 if (document.getElementById('tbl2').style.display == 'none')
     {
          document.getElementById('tbl2').style.display = 'block';
     }
	} else {
	if (document.getElementById('tbl2').style.display == 'block')
     {
          document.getElementById('tbl2').style.display = 'none';
     }
		}
}

function AVMSelect() {

 if (document.frm.avm.value != "")
 {
 	if (document.getElementById('avmtable').style.display == 'none')
    {
          document.getElementById('avmtable').style.display = 'block';
    }
	if (document.getElementById('avmcontact').style.display == 'none')
     {
          document.getElementById('avmcontact').style.display = 'block';
     }

 }
 else {
	if (document.getElementById('avmtable').style.display == 'block')
     {
          document.getElementById('avmtable').style.display = 'none';
     }
	 if (document.getElementById('avmcontact').style.display == 'block')
     {
          document.getElementById('avmcontact').style.display = 'none';
     }
 }
}


function isNumeric(str)
// returns true if str is numeric
// that is it contains only the digits 0-9
// returns false otherwise
// returns false if empty
{
  var len= str.length;
  if (len==0)
    return false;
  //else
  var p=0;
  var ok= true;
  var ch= "";
  while (ok && p<len)
  {
    ch= str.charAt(p);
    if ('0'<=ch && ch<='9')
      p++;
    else
      ok= false;
  }
  return ok;
}


function ValidateForm(frm)
	{
		frm = document.frm;
		chkApp=<cfoutput>#url.appraisal#</cfoutput>;

		var countIndex=0;
		if(frm.rep2.checked==true) {
			countIndex=countIndex+1;
		}
		if(frm.rep3.checked==true) {
			countIndex=countIndex+1;
		}
		if(frm.rep4.checked==true) {
			countIndex=countIndex+1;
		}

		if (document.frm.credit.value == "infile") {
			if(frm.product_type.value==''){
		 		alert("Product Type cannot be left blank!");
		 		return false;
			}

			if ((frm.product_type.value=='Single-in-file') || (frm.product_type.value=='Two-in-file-merge') || (frm.product_type.value=='2-Bureau Infile+RMCR') || (frm.product_type.value=='2-Bureau RMCR')) {
				if(frm.rep1.checked==false) {
					if(frm.rep2.checked==false)	{
						if(frm.rep3.checked==false) {
							if(frm.rep4.checked==false) {
								alert("Repositories cannot be left blank for this Product Type!");
			 					return false;
							}
						}
					}
				}
			}

			if (frm.product_type.value=='Single-in-file') {
				if(frm.rep1.checked==true) {
					if(countIndex != 0)
						{ alert("Please select either 'Agency Select' or any single Repository!");
							return false;
						}
				}
				if(countIndex > 1)
					{
						alert("Please select either 'Agency Select' or any single Repository!");
						return false;
					}

			}

			if ((frm.product_type.value=='Two-in-file-merge') || (frm.product_type.value=='2-Bureau Infile+RMCR') || (frm.product_type.value=='2-Bureau RMCR')){
				if(frm.rep1.checked==true) {
					if(countIndex != 0)
						{ alert("Please select either 'Agency Select' or any two Repositories!");
							return false;
						}
				}
				if(countIndex > 2)
					{
						alert("Please select either 'Agency Select' or any two Repositories!");
						return false;
					}
				if(countIndex ==1)
					{
						alert("Please select either 'Agency Select' or any two Repositories!");
						return false;
					}
			}

		}

		if (frm.credit.value == 'reissue'){
		   if (frm.prevcrdref.value =='') {
			   alert("Please enter Previous Credit Reference!")
	    	   frm.prevcrdref.focus();
			   return false;
		 	}
	   }

		if (frm.credit.value != ''){
		 if (frm.prop_use_type.value == 'Investment/Other'){
		 	if(frm.crdprmaddress1.value == ''){
				alert("Please enter Primary Residence Address Information for the applicant(s)")
		 			frm.crdprmaddress1.focus();
		     		return false;
		 	}

			if(frm.crdprmcity1.value == ''){
				alert("Please enter Primary Residence Address Information for the applicant(s)")
		 			frm.crdprmcity1.focus();
		     		return false;
		 	}

			if(frm.crdprmstate1.value == ''){
				alert("Please enter Primary Residence Address Information for the applicant(s)")
		 			frm.crdprmstate1.focus();
		     		return false;
		 	}

			if(frm.crdprmzip1.value == ''){
				alert("Please enter Primary Residence Address Information for the applicant(s)")
		 			frm.crdprmzip1.focus();
		     		return false;
		 	}

			if(frm.blastname2.value != ''){
				if(frm.crdprmaddress2.value == ''){
				alert("Please enter Primary Residence Address Information for the applicant(s)")
		 			frm.crdprmaddress2.focus();
		     		return false;
		 		}

			if(frm.crdprmcity2.value == ''){
				alert("Please enter Primary Residence Address Information for the applicant(s)")
		 			frm.crdprmcity2.focus();
		     		return false;
		 	}

			if(frm.crdprmstate2.value == ''){
				alert("Please enter Primary Residence Address Information for the applicant(s)")
		 			frm.crdprmstate2.focus();
		     		return false;
		 	}

			if(frm.crdprmzip2.value == ''){
				alert("Please enter Primary Residence Address Information for the applicant(s)")
		 			frm.crdprmzip2.focus();
		     		return false;
		 	}
		  }
		 }
		}



		 if (frm.avm.value!='') {

			 if (frm.bedroom.value!='') {
				 if (!isNumeric(frm.bedroom.value)) {

				 alert("Please enter integer value in BEDROOM field!")
				 frm.bedroom.focus();
				      return false;

				 }
			 }
			 if (frm.bathroom.value!='') {
				 if (!isNumeric(frm.bathroom.value)) {

				 alert("Please enter integer value in BATHROOM field!")
				 frm.bathroom.focus();
				      return false;
				 }
			 }
			 if (frm.room.value!='') {
				 if (!isNumeric(frm.room.value)) {

				 alert("Please enter integer value in ROOM field!")
				 frm.room.focus();
				      return false;
				 }
			 }
			 if (frm.stories.value!='') {
				 if (!isNumeric(frm.stories.value)) {

				 alert("Please enter integer value in STORIES field!")
				 frm.stories.focus();
				      return false;
				 }
			 }
			 if (frm.fireplace.value!='') {
				 if (!isNumeric(frm.fireplace.value)) {

				 alert("Please enter integer value in FIREPLACE field!")
				 frm.fireplace.focus();
				      return false;
				 }
			 }
			 if (frm.garagespace.value!='') {
				 if (!isNumeric(frm.garagespace.value)) {

				 alert("Please enter integer value in GARAGESPACE field!")
				 frm.garagespace.focus();
				      return false;
				 }
			 }
			if (frm.yearbuilt.value!='') {
				 if (!isNumeric(frm.yearbuilt.value)) {
					alert("Please enter numeric year value in YEARBUILT field!")
					 frm.yearbuilt.focus();
					      return false;
				 }
				 if(frm.yearbuilt.value.length<4 || frm.yearbuilt.value.length>4){
					 alert("Please use four figures for year in YEARBUILT field!")
					 frm.yearbuilt.focus();
					      return false;
				 }
			 }
			 if (frm.livingarea.value!='') {
				 if (!isNumeric(frm.livingarea.value)) {

				 alert("Please enter integer value in LIVINGAREA field!")
				 frm.livingarea.focus();
				      return false;
				 }
			 }
			 if (frm.lotsize.value!='') {
				 if (!isNumeric(frm.lotsize.value)) {

				 alert("Please enter integer value in LOTSIZE field!")
				 frm.lotsize.focus();
				      return false;
				 }
			 }
			 if (frm.purchasemonth.value!='') {
				 if (!isNumeric(frm.purchasemonth.value)) {
				 alert("Please enter numeric month value(1-12) in PURCHASE MONTH field!")
				 frm.purchasemonth.focus();
				      return false;
				 }
				 if (frm.purchasemonth.value >12 || frm.purchasemonth.value <=0){
				 alert("Please enter month (1-12) in PURCHASE MONTH field!")
				 frm.purchasemonth.focus();
				      return false;
				 }
			 }
			if (frm.purchaseyear.value!='') {
				 if (!isNumeric(frm.purchaseyear.value)) {
				 alert("Please enter numeric year value in PURCHASE YEAR field!")
				 		 frm.purchaseyear.focus();
				      return false;
				 }
				 if(frm.purchaseyear.value.length<4 || frm.purchaseyear.value.length>4){
						 alert("Please use four figures for year in PURCHASE YEAR field!")
				 		 frm.purchaseyear.focus();
				      return false;
				 }
			 }

			if (frm.estvalue.value!='') {
			 if (!isNumeric(frm.estvalue.value)) {

			 alert("Please enter integer value in ESTVALUE field!")
			 frm.estvalue.focus();
			      return false;
			 }
			 }
			 if (frm.preestvalue.value!='') {
			 if (!isNumeric(frm.preestvalue.value)) {

			 alert("Please enter integer value in PREESTVALUE field!")
			 frm.preestvalue.focus();
			      return false;
			 }
			 }

			if (frm.lastname.value == ''){
			 	alert("Please enter Last Name of Property Contact Name for AVM Product")
			 	frm.lastname.focus();
			 	return false;
			 }//no
			 if (frm.firstname.value == ''){
			 	alert("Please enter First Name of Property Contact Name for AVM Product")
			 	frm.firstname.focus();
			 	return false;
			 }
 		}

		return true;
 	}

 </script>
<script type="text/javascript" language="javascript" src="/calendar/calendar.js"></script>

<IFRAME STYLE="display:none;position:absolute;width:157;height:158;z-index=100" ID="CalFrame" MARGINHEIGHT=0 MARGINWIDTH=0 NORESIZE FRAMEBORDER=0 SCROLLING=NO SRC="/calendar/popup_calendar.html"></IFRAME>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
<title>1st Title & Escrow, Inc. - Title Request Form</title>
</head>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

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
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')';return false;"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>
				<p>
				<img src="./images/ancillary_title.gif">


<CFFORM NAME="frm" ACTION="./order_verify_title_ancillary.cfm?comp_id=#comp_id#&loan_number=#loan_number#&title_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&blastname1=#blastname1#&bfirstname1=#bfirstname1#&bminame1=#bminame1#&bssn1=#bssn1#&bhphone1=#bhphone1#&bwphone1=#bwphone1#&bext1=#bext1#&blastname2=#blastname2#&bfirstname2=#bfirstname2#&bminame2=#bminame2#&bssn2=#bssn2#&bhphone2=#bhphone2#&bwphone2=#bwphone2#&bext2=#bext2#&slastname1=#slastname1#&sfirstname1=#sfirstname1#&sminame1=#sminame1#&sssn1=#sssn1#&shphone1=#shphone1#&swphone1=#swphone1#&sext1=#sext1#&slastname2=#slastname2#&sfirstname2=#sfirstname2#&sminame2=#sminame2#&sssn2=#sssn2#&shphone2=#shphone2#&swphone2=#swphone2#&sext2=#sext2#&paddress=#paddress#&pcity=#pcity#&pstate=#pstate#&pzip=#pzip#&pcounty=#pcounty#&plegaldesc=#plegaldesc#&prop_use_type=#prop_use_type#&condo_pud=#condo_pud#&a_comment=#a_comment#&polender1=#polender1#&poacctno1=#poacctno1#&pophone1=#pophone1#&polender2=#polender2#&poacctno2=#poacctno2#&pophone2=#pophone2#&SearchType=#SearchType#&Deedtransfer=#Deedtransfer#&Insured=#Insured#&otherpro=#otherpro#&loanamt_float=#loanamt_float#&loan_type_111=#loan_type_111#&loan_program_333=#loan_program_333#&Verifyemail=#Verifyemail#&Verifyemail_2=#Verifyemail_2#&Verifyemail_3=#Verifyemail_3#&fax_no=#fax_no#&RptbyEmail=#RptbyEmail#&request_icl=#request_icl#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#" ENCTYPE="multipart/form-data" METHOD=POST>

  <CFINCLUDE TEMPLATE="./order_verify_ancillary_include.cfm">
</CFFORM>
</CENTER>
	<cfelse>


<CFLOCATION URL="https://#cgi.server_name#/order_verify_display_title.cfm?comp_id=#comp_id#&title_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#">
</cfif>

</cfif>

