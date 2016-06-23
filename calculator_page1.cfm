<cfparam name="loc" default="2">
<cfparam name="a_trigger" default="0">
<CFPARAM NAME="SearchType" DEFAULT="Refinance">
<CFPARAM NAME="FORM.searchtype" DEFAULT="Refinance">
<CFPARAM NAME="FORM.pstate"       DEFAULT="CA">
<CFPARAM NAME="pstate"       DEFAULT="CA">
<CFPARAM NAME="loanamt_float"    DEFAULT="123456">
<CFPARAM NAME="FORM.loanamt_float"    DEFAULT="123456">
<CFPARAM NAME="input_val"     DEFAULT="">
<CFPARAM NAME="a_trigger"   DEFAULT="0">
<CFPARAM NAME="emp" DEFAULT="0">

<CFSET emp = "0" >

<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
    SELECT *
	FROM first_title_states_all
	ORDER BY st_abbrev ASC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_company">
    SELECT *
    FROM companies
    WHERE ID = 559 <!---Weichert--->
    ORDER BY company ASC
</CFQUERY>

<cfif #read_company.recordcount# GT 0>
    <CFQUERY datasource="#request.dsn#" NAME="read_user">
        SELECT *
        FROM users
        WHERE comp_id = 559
        ORDER BY lp_lname ASC
    </CFQUERY>

    <CFIF #read_company.companies_switch# eq "1">
        <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
            SELECT *
            FROM companies_user
            WHERE ID = #emp#
        </CFQUERY>

        <CFSET emp = #read_company_user.ID#>
    </CFIF>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
    <head>
        <title>1st Title & Escrow, Inc. </title>


	<script type="text/javascript">
function go(frm) {
window.location=frm;
}


</script>
<script type="text/javascript">
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
if (frm.SearchType.value=='') {
 alert("Please select a search type in order to proceed!")
 frm.SearchType.focus();
      return false;
 }


if (frm.loanamt_float.value=='') {

 alert("The LOAN AMOUNT field cannot be left blank!")
 frm.loanamt_float.focus();
      return false;
 }

if (!isNumeric(frm.loanamt_float.value)) {

 alert("Only numbers are allowed in the LOAN AMOUNT field!")
 frm.loanamt_float.focus();
      return false;
 }
 if (frm.loanamt_float.value.length < 3 || frm.loanamt_float.value.length > 8) {
 alert("Only numbers between 3 and 8 digits can be entered in the loan amount field!")
  frm.loanamt_float.focus();
      return false;
 }

if (frm.pstate.value=='MD' || frm.pstate.value=='DE' || frm.pstate.value=='NY') {
 if (frm.pcounty.value=='') {
 alert("The State needs a county!")
 frm.pcounty.focus();
      return false;
 }
 }
return true;

 }
 </script>
 <STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
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
                        <td rowspan="2" valign="top" width="220">
                            <cfinclude template="logo_swap_include.cfm">
                        </td>
                        <td valign="top" align="right"><br>
	                        <!---<table border=0 align="right" cellpadding="0" cellspacing=0>
	                            <tr>
                                </tr>
                            </table>--->
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center" width="560"><nobr></nobr><br>
                          &nbsp;
                        </td>
                    </tr>
                </table>
                <center>
                <table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
		        </table>
                </center>
                <table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
<CFFORM ACTION="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" METHOD=POST>
                    <td width=770 align=center valign=top bgcolor=d3d3d3>
				        <BR><!---Harry - adding items per Steve 11/18/04--->
                        <Center><FONT FACE=ARIAL SIZE=3 color="blue"><B>Welcome Weichert Financial Services - RELO Team to the Closing Fees Calculator</B></center></font><BR>
                        <table width=600 cellpadding=1 cellspacing=1 border=0>
                            <!---<br>--->
</cfform>
                            <!---<table width=770 cellpadding=1 cellspacing=1 border=0>
		                        <tr>
			                        <td width=770 align=left colspan = 4 valign=top bgcolor=elelel>
				                        <FONT FACE=ARIAL SIZE=2 color="blue">
				                        <CENTER><B>**NOTE: Calculation for existing order allows you to modify loan amount for the order</B></CENTER>
                                    </TD>
		                        </TR>
                            </table>--->
<CFIF IsDefined("form.loc") is True>
    <cfset loc=#loc#>
</cfif>

<cfif #loc# eq 2>
                        <table width=600 cellpadding=1 cellspacing=1 border=0>
                            <tr>
                                <td colspan=10>
                                    <Center><FONT FACE=verdana SIZE=2 color="blue">To proceed with your request enter the appropriate information below:</center></font>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor=d3d3d3 width=160 align=left valign=top>
							        <FONT FACE=verdana SIZE=1 color="black">
							        Transaction Type
						        </td>
                                <td bgcolor=d3d3d3 width=100 align=center valign=top>
							        <FONT FACE=verdana SIZE=1 color="black">
							        State
						        </td>
						        <td bgcolor=d3d3d3 width=100 align=center valign=top>
							        <FONT FACE=verdana SIZE=1 color="black">
							        County
						        </td>
						        <td bgcolor=d3d3d3 width=190 align=center valign=top>
							        <FONT FACE=verdana SIZE=1 color="black">
                                    Loan Amount/Purchase Price
						        </td>
                                <td bgcolor=d3d3d3 width=68 align=left valign=top>
							        <FONT FACE=verdana SIZE=1 color="black">
                                    *&nbsp;
						        </td>
                            </tr>
                            <tr>
<CFFORM name = "frm" ACTION="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=4&a_trigger=11" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>
                                <td width=160 bgcolor="d3d3d3" align=left valign=top>
                                    <select name="SearchType"
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
                                            <option value="">Select</option>
                                            <option value="Purchase">Purchase</option>
                                            <option value="Refinance">Refinance</option>
                                            <option value="New Second Mortgage">New Second Mortgage</option>
                                            </select>
                                </td>
                                <td bgcolor=d3d3d3 width=100 align=center valign=top>
							        <Select NAME="pstate"
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
                                <td bgcolor=d3d3d3 width=100 align=center valign=top>
				                    <INPUT NAME="pcounty" SIZE=20 MAXLENGTH=120
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
									    clear: none;" >
                                </td>
						        <td bgcolor=d3d3d3 width=190 align=center valign=top>
							        <INPUT NAME="loanamt_float" SIZE=20 MAXLENGTH=120
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
    									clear: none;" >
						        </td>
			                    <td bgcolor=d3d3d3 width=90 align=center valign=top>
							        <INPUT TYPE=image src="./images/button_submit.gif" border=0>
						        </td>
					        </tr>
                            <tr>
                                <td colspan="10">
                                    <!---<BR>---><FONT FACE=verdana SIZE=2 color="blue"><center>* If refinance or second mortgage, enter loan amount here.</center><center>If purchase, enter purchase price of property.</center></FONT>
                                </td>
                            </tr>
                            <!---Harry - adding items per Steve 11/18/04--->
                            <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
                        </table>
                        <!---End --->
                    </td>
                    </td>

<CFOUTPUT>
</CFOUTPUT>

</cfform>

</cfif>
<cfif #a_trigger# eq 11>
	<cfset a_trigger = 12>
</cfif>
	<cfif #a_trigger# eq 12>
		<CFOUTPUT>
        <cfif (#FORM.pstate# NEQ "CA") and (#FORM.pstate# NEQ "AL") and (#FORM.pstate# NEQ "NE") and (#FORM.pstate# NEQ "CO") and (#FORM.pstate# NEQ "GA") and (#FORM.pstate# NEQ "MI") and (#FORM.pstate# NEQ "NY") and (#FORM.pstate# NEQ "TN") and (#FORM.pstate# NEQ "AZ")>
            <CFIF #pstate# EQ "AR">
					<CFSET a_tble_to_read = "StateArkansas">
				<CFELSEIF #pstate# EQ "AK">
					<CFSET a_tble_to_read = "StateAlaska">
				<CFELSEIF #pstate# EQ "MT">
					<CFSET a_tble_to_read = "StateMontana">
				<CFELSEIF #pstate# EQ "CT">
					<CFSET a_tble_to_read = "StateConnecticut">
				<CFELSEIF #pstate# EQ "DC">
					<CFSET a_tble_to_read = "StateDistrictColombia">
				<CFELSEIF #pstate# EQ "DE">
					<CFSET a_tble_to_read = "StateDelaware">
				<CFELSEIF #pstate# EQ "FL">
                    <CFIF (#read_company.id# eq 465) >
					    <CFSET a_tble_to_read = "StateFloridaSuperior">
                    <CFELSE>
                        <CFSET a_tble_to_read = "StateFlorida">
                    </CFIF>
                    <CFELSEIF #pstate# EQ "HI">
					<CFSET a_tble_to_read = "StateHawaii">
				<CFELSEIF #pstate# EQ "IL">
					<CFSET a_tble_to_read = "StateIllinois">
				<CFELSEIF #pstate# EQ "IN">
					<CFSET a_tble_to_read = "StateIndiana">
				<CFELSEIF #pstate# EQ "IA">
					<CFSET a_tble_to_read = "StateIowa">
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
				<CFELSEIF #pstate# EQ "OH">
					<CFSET a_tble_to_read = "StateOhio">
				<CFELSEIF #pstate# EQ "PA">
					<CFSET a_tble_to_read = "StatePennsylvania">
				<CFELSEIF #pstate# EQ "RI">
					<CFSET a_tble_to_read = "StateRhodeIsland">
				<CFELSEIF #pstate# EQ "SC">
					<CFSET a_tble_to_read = "StateSouthCarolina">
                <CFELSEIF #pstate# EQ "UT">
					<CFSET a_tble_to_read = "StateUtah">
				<CFELSEIF #pstate# EQ "VT">
					<CFSET a_tble_to_read = "StateVermont">
				<CFELSEIF #pstate# EQ "VA">
					<CFSET a_tble_to_read = "StateVirginia">
				<CFELSEIF #pstate# EQ "WV">
					<CFSET a_tble_to_read = "StateWestVirginia">
				<CFELSEIF #pstate# EQ "WI">
					<CFSET a_tble_to_read = "StateWisconsin">
			</cfif>

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

<CFIF (#pstate# eq "NM")  or (#pstate# eq "ID") or (#pstate# eq "NV") or (#pstate# eq "OR") or (#pstate# eq "SD") or (#pstate# eq "TX")  OR (#pstate# eq "WA") OR (#pstate# eq "WY")>
			 <CFSET a_ins_premium = 0>

	<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc">
						SELECT *
						FROM StateUtah
						WHERE 0 = 1
					</CFQUERY>

<CFELSE>

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>

					<CFIF (#pstate# eq "NM")  or (#pstate# eq "ID") or (#pstate# eq "NV") or (#pstate# eq "OR") or (#pstate# eq "SD") or (#pstate# eq "TX")  OR (#pstate# eq "WA") OR (#pstate# eq "WY")>
						 	 <CFSET a_ins_premium = 0>
					<CFELSE>
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>
					</CFIF>


</cfif>

</cfif>

</CFOUTPUT>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	    <!---Harry 11/18/2004
        Per Steve, get this next line out--->
        <!---<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=3 color="black">
				<CENTER><B>Closing Fees Calculator Result</B></CENTER>
			</TD>
		</TR>
        --->

<cfif (#FORM.pstate# NEQ "CA") and (#FORM.pstate# NEQ "AL") and (#FORM.pstate# NEQ "CO") and (#FORM.pstate# NEQ "GA") and (#FORM.pstate# NEQ "MI") and (#FORM.pstate# NEQ "NY") and (#FORM.pstate# NEQ "NE") and (#FORM.pstate# NEQ "TN") and (#FORM.pstate# NEQ "AZ")>

	<cfif #read_ins_calc.recordcount# gt "0" or 1 eq 1>
		<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
				SELECT *
				FROM recording_fees
				WHERE state = '#pstate#'
			</CFQUERY>

            <CFIF #read_rec_fees.recordcount# gt "1">
                <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
				SELECT *
				FROM recording_fees
				WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
			</CFQUERY>
            </CFIF>

			<CFIF #read_rec_fees.recordcount# gt "0">
				<CFIF #read_rec_fees.mort_stamps# NEQ "0">
					<CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
				<cfelse>
					<CFSET city_mort_stamps = "0">
				</cfif>

				<cfif #searchType# eq "Purchase">
					<CFIF #read_rec_fees.transfer_tax# NEQ "0">
						<cfif #read_rec_fees.recordcount# GT 1>
							<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees2">
								SELECT *
								FROM recording_fees
								WHERE state = '#pstate#' and county like '%#pcounty#%'
							</CFQUERY>
							<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees2.transfer_tax#>
						<cfelse>
							<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
						</cfif>
					<cfelse>
						<CFSET state_deed_1 = "0">   <!-- 1203 total -->
					</cfif>
				<cfelse>
					<CFSET state_deed_1 = "0">
				</cfif>

				<CFIF #read_rec_fees.mort_rec_fee# NEQ "">
					<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
				<CFELSE>
					<Cfset rec_fee = "0">
				</cfif>

				<CFIF #read_rec_fees.release_rec_fee# NEQ "">
					<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
				<CFELSE>
					<Cfset rel_fee = "0">
				</cfif>

				<CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
					<CFSET a_fee_total = "0">
				<cfelse>
				<CFSET a_fee_total = "0">
			</cfif>

			<CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
				<CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
			<cfelse>
				<CFSET intang_tax = "0">
			</cfif>

		<cfelse>
			<CFSET rec_fee = "0">
			<CFSET rel_fee = "0">
			<CFSET city_mort_stamps = "0">
			<CFSET a_fee_total = "0">
			<CFSET state_deed_1 = "0">
			<CFSET intang_tax = "0">
		</cfif>

		</CFOUTPUT>

		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
			SELECT *
			FROM company_billing_states
			WHERE company_id = 559 and a_states = '#form.pstate#'
		</CFQUERY>

		<cfoutput query="read_this_sets_billing_states">
			<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
				SELECT *
				FROM company_billing_values
				WHERE billing_id = #read_this_sets_billing_states.billing_id#
			</CFQUERY>

		<table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
			<tr>
				<td width=780 align=center valign=top bgcolor=e6e6e6>
					<cfif #searchType# eq "Refinance">
						<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
  							<tr>
								<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
									<center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
								</td>
							</tr>
							<cfif #read_this_sets_billing_values.a_1101# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
									Settlement or Closing Fee
					        	</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
			 	 					#NumberFormat(read_this_sets_billing_values.a_1101, '_____.__')#
 									<cfset a_1101 = #read_this_sets_billing_values.a_1101#>
								</td>
							</tr>
							<cfelse>
								<cfset a_1101 = 0>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1102# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
									Abstract or Title Search
				 				</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
			 						#NumberFormat(read_this_sets_billing_values.a_1102, '_____.__')#
		 							<cfset a_1102 = #read_this_sets_billing_values.a_1102#>
				 				</td>
							</tr>
							<cfelse>
								<cfset a_1102 = 0>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1103# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1103. <img src="./images/info-01.gif" ALT="Title Examination">
									Title Examination
					 			</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
		 							#NumberFormat(read_this_sets_billing_values.a_1103, '_____.__')#
 									<cfset a_1103 = #read_this_sets_billing_values.a_1103#>
					 			</td>
							</tr>
							<cfelse>
								<cfset a_1103 = 0>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1104# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
									Title Insurance Binder
		 						</td>
		 						<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
		 							#NumberFormat(read_this_sets_billing_values.a_1104, '_____.__')#
		 							<cfset a_1104 = #read_this_sets_billing_values.a_1104#>
		 						</td>
							</tr>
							<cfelse>
								<cfset a_1104 = 0>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1105# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1105. <img src="./images/info-01.gif" ALT="Document Preparation">
									Document Preparation
								</td>
		 						<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
		 							#NumberFormat(read_this_sets_billing_values.a_1106, '_____.__')#
									<cfset a_1105 = #read_this_sets_billing_values.a_1105#>
		 						</td>
							</tr>
							<cfelse>
								<cfset a_1105 = 0>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1106# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1106. <img src="./images/info-01.gif" ALT="Notary Fees">
									Notary Fees
	 							</td>
	 							<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
		 							#NumberFormat(read_this_sets_billing_values.a_1106, '_____.__')#
									<cfset a_1106 = #read_this_sets_billing_values.a_1106#>
	 							</td>
							</tr>
							<cfelse>
								<cfset a_1106 = 0>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1107# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
									Attorney's Fees

								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
				 					#NumberFormat(read_this_sets_billing_values.a_1107, '_____.__')#
									<cfset a_1107 = #read_this_sets_billing_values.a_1107#>
								</td>
							</tr>
							<cfelse>
								<cfset a_1107 = 0>
							</cfif>

							<CFQUERY datasource="#request.dsn#" NAME="read_states">
								SELECT *
								FROM first_title_states
								where st_abbrev = '#pstate#'
							</CFQUERY>

							<cfif #read_states.recordcount# gt 0>
								<cfif #a_ins_premium# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">
									Title Insurance Premium
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
		 	 						#NumberFormat(a_ins_premium, '_____.__')#
									<cfset a_ins_premium = #a_ins_premium#>
								</td>
							</tr>
								<cfelse>
									<cfset a_ins_premium = 0>
								</cfif>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1111# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
									#read_this_sets_billing_values.a_1111_text#
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
									#NumberFormat(read_this_sets_billing_values.a_1111, '_____.__')#
									<cfset a_1111 = #read_this_sets_billing_values.a_1111#>
								</td>
							</tr>
							<cfelse>
								<cfset a_1111 = 0>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1112# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
									#read_this_sets_billing_values.a_1112_text#
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
 									#NumberFormat(read_this_sets_billing_values.a_1112, '_____.__')#
									<cfset a_1112 = #read_this_sets_billing_values.a_1112#>
								</td>
							</tr>
							<cfelse>
								<cfset a_1112 = 0>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1113# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
									#read_this_sets_billing_values.a_1113_text#
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
			 						#NumberFormat(read_this_sets_billing_values.a_1113, '_____.__')#
									<cfset a_1113 = #read_this_sets_billing_values.a_1113#>
								</td>
							</tr>
							<cfelse>
								<cfset a_1113 = 0>
							</cfif>
							<cfif #rec_fee# neq "0">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1201. <img src="./images/info-01.gif" ALT="Recording fee">
									Recording Fee
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
									#NumberFormat(rec_fee, '_____.__')#
								</td>
							</tr>
							</cfif>
							<cfif #rel_fee# neq "0">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1201. <img src="./images/info-01.gif" ALT="Release Fee">
									Release Fee
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
									#NumberFormat(rel_fee, '_____.__')#
								</td>
							</tr>
							</cfif>
							<cfif #a_fee_total# neq "0">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
									Total Recording Fee
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
									#NumberFormat(a_fee_total, '_____.__')#
								</td>
							</tr>
							</cfif>
							<cfif #city_mort_stamps# neq "0">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
									City Mortgage Stamps
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
									#NumberFormat(city_mort_stamps, '_____.__')#
								</td>
							</tr>
							</cfif>
							<cfif #state_deed_1# neq "0">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1203. <img src="./images/info-01.gif" ALT="State Deed">
									State Deed
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
									#NumberFormat(state_deed_1, '_____.__')#
								</td>
							</tr>
							</cfif>
							<cfif #intang_tax# neq "0">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
									Intangible Tax
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
	  								#NumberFormat(intang_tax, '_____.__')#
								</td>
							</tr>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1205# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
									#read_this_sets_billing_values.a_1205_text#
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
 									#NumberFormat(read_this_sets_billing_values.a_1205, '_____.__')#
									<cfset a_1205 = #read_this_sets_billing_values.a_1205#>
								</td>
							</tr>
							<cfelse>
								<cfset a_1205 = 0>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1303# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
									#read_this_sets_billing_values.a_1303_text#
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
									 #NumberFormat(read_this_sets_billing_values.a_1303, '_____.__')#
									<cfset a_1303 = #read_this_sets_billing_values.a_1303#>
								</td>
							</tr>
							<cfelse>
								<cfset a_1303 = 0>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1304# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
									#read_this_sets_billing_values.a_1304_text#
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
									#NumberFormat(read_this_sets_billing_values.a_1304, '_____.__')#
									<cfset a_1304 = #read_this_sets_billing_values.a_1304#>
								</td>
							</tr>
							<cfelse>
								<cfset a_1304 = 0>
							</cfif>
							<cfif #read_this_sets_billing_values.a_1305# neq "">
							<tr>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
									#read_this_sets_billing_values.a_1305_text#
								</td>
								<td width=250 align=left valign=top bgcolor=e6e6e6>
									<font size=2 color=blue face=arial>
 									#NumberFormat(read_this_sets_billing_values.a_1305, '_____.__')#
									<cfset a_1305 = #read_this_sets_billing_values.a_1305#>
								</td>
							</tr>
							<cfelse>
								<cfset a_1305 = 0>
							</cfif>

							<CFQUERY datasource="#request.dsn#" NAME="read_states">
								SELECT *
								FROM first_title_states
								where st_abbrev = '#pstate#'
							</CFQUERY>

							<cfif #read_states.recordcount# gt 0>
								<cfif #pstate# EQ "AR" OR #pstate# EQ "CO" OR #pstate# EQ "FL" OR #pstate# EQ "ME" OR #pstate# EQ "NE" OR #pstate# EQ "MT"OR #pstate# EQ "NH" OR #pstate# EQ "NJ" OR #pstate# EQ "NY" OR #pstate# EQ "TN" OR #pstate# EQ "VT">
							        <tr>
								        <td width=250 align=left valign=top bgcolor=e6e6e6>
									        <font size=2 color=black face=arial>
									        1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
									        Alta 8.1 Endorsement fee
								        </td>
								        <td width=250 align=left valign=top bgcolor=e6e6e6>
									        <font size=2 color=blue face=arial>
 									        25.00
									        <cfset alta8 = 25.00>
								        </td>
							    </tr>
							    <cfelseif #pstate# EQ "ID">
							    <tr>
								    <td width=250 align=left valign=top bgcolor=e6e6e6>
									    <font size=2 color=black face=arial>
									    1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
									    Alta 8.1 Endorsement fee
								    </td>
								    <td width=250 align=left valign=top bgcolor=e6e6e6>
									    <font size=2 color=blue face=arial>
 									    10.00
									    <cfset alta8 = 10.00>
								    </td>
							    </tr>
							    <cfelseif #pstate# EQ "OH">
							    <tr>
								    <td width=250 align=left valign=top bgcolor=e6e6e6>
			                            <font size=2 color=black face=arial>
			                            1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			                            Alta 8.1 Endorsement fee
		                            </td>
			                        <td width=250 align=left valign=top bgcolor=e6e6e6>
			                            <font size=2 color=blue face=arial>
                                        75.00
		                                <cfset alta8 = 75.00>
		                            </td>
	                            </tr>
					            <cfelseif #pstate# EQ "PA">
								<tr>
		                            <td width=250 align=left valign=top bgcolor=e6e6e6>
			                            <font size=2 color=black face=arial>
			                            1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
                            			Alta 8.1 Endorsement fee
		                            </td>
			                        <td width=250 align=left valign=top bgcolor=e6e6e6>
			                            <font size=2 color=blue face=arial>
                                        50.00
				                        <cfset alta8 = 50.00>
		                            </td>
	                            </tr>
						        <cfelseif #pstate# EQ "WI">
								<tr>
		                            <td width=250 align=left valign=top bgcolor=e6e6e6>
			                            <font size=2 color=black face=arial>
			                            1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			                            Alta 8.1 Endorsement fee
		                            </td>
			                        <td width=250 align=left valign=top bgcolor=e6e6e6>
			                            <font size=2 color=blue face=arial>
                                        15.00
		                                <cfset alta8 = 15.00>
		                            </td>
	                            </tr>
				                <cfelse>
                                    <cfset alta8 = 0>
                                </cfif>
	                        <cfif #pstate# eq "FL">
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1307. <img src="./images/info-01.gif" ALT="Alta 9 Endorsement fee">
			Alta 9 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9 =	 #a_ins_premium#/10>
		 #NumberFormat(alta9, '_____.__')#
		<cfset alta9 = #alta9#>
		</td>
	</tr>


<cfelse> <cfset alta9 = 0></cfif>
<tr>
		<td width=250 align=center valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			 <b>TOTAL</b>

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset total = #rec_fee# + #rel_fee# + #city_mort_stamps# + #a_fee_total# + #state_deed_1# + #intang_tax# + #alta9# + #alta8# + #a_1305# + #a_1304# + #a_1303# + #a_1205# + #a_1113#  + #a_1112#  + #a_1111#  + #a_1107# + #a_1106# + #a_1105# + #a_1104# + #a_1103# + #a_1102# + #a_1101# + #a_ins_premium#>
 #NumberFormat(total, '_____.__')#
		</td>
	</tr>


	<CFIF #pstate# eq "AR">
	<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
	<CFELSEIF #pstate# eq "CO">

	<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>


			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta4 =	 #a_ins_premium#/10>
	#NumberFormat(alta4, '_____.__')#
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta41 =	 #a_ins_premium#/10>
	#NumberFormat(alta41, '_____.__')#
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta5 =	 #a_ins_premium#/10>
	#NumberFormat(alta5, '_____.__')#
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta51 =	 #a_ins_premium#/10>
	#NumberFormat(alta51, '_____.__')#
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
20.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
20.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
20.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

	<cfelseif #pstate# eq "FL">

			<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>


			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 9

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9FL =	 #a_ins_premium#/10>
	#NumberFormat(alta9FL, '_____.__')#
		</td>
	</tr>


		<cfelseif #pstate# eq "ID">

		<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
35.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
35.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
10.00
		</td>
	</tr>

		<cfelseif #pstate# eq "ME" OR #pstate# eq "NE" or #pstate# eq "NH" or #pstate# eq "NJ">


		<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

	<cfelseif #pstate# eq "PA">

	<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>

			<cfelseif #pstate# eq "MT">

			<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

				<cfelseif #pstate# eq "OH">

<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 9

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9OH =	 #a_ins_premium#/10>
	#NumberFormat(alta9OH, '_____.__')#
		</td>
	</tr>
		<cfelseif #pstate# eq "NY">

			<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 9

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9NY =	 #a_ins_premium#/10>
	#NumberFormat(alta9NY, '_____.__')#
		</td>
	</tr>

	<cfelseif #pstate# eq "WV">


		<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
60.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
60.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
60.00
		</td>
	</tr>

		<cfelseif #pstate# eq "WI">

		<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>


		</cfif></cfif>
	</table>



	<cfelseif #searchtype# eq "purchase">
	<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2  color=blue face=arial><b>Purchase</b></font>
		</td>
			</tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	 #NumberFormat(read_this_sets_billing_values.a_1101b, '_____.__')#
			 <cfset a_1101b = #read_this_sets_billing_values.a_1101b#>

		        </td>
	</tr>

<cfelse><cfset a_1101b = 0></cfif>
	<cfif #read_this_sets_billing_values.a_1102b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			 #NumberFormat(read_this_sets_billing_values.a_1102b, '_____.__')#
 <cfset a_1102b = #read_this_sets_billing_values.a_1102b#>
				 </td>
			</tr>
			<cfelse><cfset a_1102b = 0></cfif>
			<cfif #read_this_sets_billing_values.a_1103b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		 #NumberFormat(read_this_sets_billing_values.a_1103b, '_____.__')#
<cfset a_1103b = #read_this_sets_billing_values.a_1103b#>
					 </td>
			</tr>
		<cfelse><cfset a_1103b = 0></cfif>
				<cfif #read_this_sets_billing_values.a_1104b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		 #NumberFormat(read_this_sets_billing_values.a_1104b, '_____.__')#
	 <cfset a_1104b = #read_this_sets_billing_values.a_1104b#>
		 </td>
	</tr>
<cfelse><cfset a_1104b = 0></cfif>
		<cfif #read_this_sets_billing_values.a_1105b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	 #NumberFormat(read_this_sets_billing_values.a_1105b, '_____.__')#

				<cfset a_1105b = #read_this_sets_billing_values.a_1105b#>
		 </td>
	</tr>
<cfelse><cfset a_1105b = 0></cfif>
		<cfif #read_this_sets_billing_values.a_1106b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		 #NumberFormat(read_this_sets_billing_values.a_1106b, '_____.__')#
		<cfset a_1106b = #read_this_sets_billing_values.a_1106b#>
	 </td>
	</tr>
<cfelse><cfset a_1106b = 0></cfif>
	<cfif #read_this_sets_billing_values.a_1107b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			 #NumberFormat(read_this_sets_billing_values.a_1107b, '_____.__')#

			<cfset a_1107b = #read_this_sets_billing_values.a_1107b#>
		</td>
	</tr>
<cfelse><cfset a_1107b = 0></cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
			<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>
	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_textb#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			 #NumberFormat(read_this_sets_billing_values.a_1111b, '_____.__')#


		<cfset a_1111b = #read_this_sets_billing_values.a_1111b#>

		</td>


	</tr>
<cfelse><cfset a_1111b = 0></cfif>

	<cfif #read_this_sets_billing_values.a_1112b# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1112_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
 #NumberFormat(read_this_sets_billing_values.a_1112b, '_____.__')#

		<cfset a_1112b = #read_this_sets_billing_values.a_1112b#>
		</td>
	</tr>
<cfelse><cfset a_1112b = 0></cfif>

	<cfif #read_this_sets_billing_values.a_1113b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		 #NumberFormat(read_this_sets_billing_values.a_1113b, '_____.__')#

	<cfset a_1113b = #read_this_sets_billing_values.a_1113b#>
		</td>

	</tr>
<cfelse><cfset a_1113b = 0></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		 #NumberFormat(rec_fee, '_____.__')#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	 #NumberFormat(rel_fee, '_____.__')#


		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	 #NumberFormat(a_fee_total, '_____.__')#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#NumberFormat(state_deed_1, '_____.__')#


		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
  	#NumberFormat(intang_tax, '_____.__')#


		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
 #NumberFormat(read_this_sets_billing_values.a_1205b, '_____.__')#

<cfset a_1205b = #read_this_sets_billing_values.a_1205b#>
		</td>
	</tr>
<cfelse> <cfset a_1205b = 0></cfif>

	<cfif #read_this_sets_billing_values.a_1303b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
 #NumberFormat(read_this_sets_billing_values.a_1303b, '_____.__')#

<cfset a_1303b = #read_this_sets_billing_values.a_1303b#>
		</td>
	</tr>
<cfelse> <cfset a_1303b = 0></cfif>

	<cfif #read_this_sets_billing_values.a_1304b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	 #NumberFormat(read_this_sets_billing_values.a_1304b, '_____.__')#


		<cfset a_1304b = #read_this_sets_billing_values.a_1304b#>

		</td>
	</tr>
<cfelse> <cfset a_1304b = 0></cfif>

	<cfif #read_this_sets_billing_values.a_1305b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
			#read_this_sets_billing_values.a_1305_textb#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
  #NumberFormat(read_this_sets_billing_values.a_1305b, '_____.__')#



			<cfset a_1305b = #read_this_sets_billing_values.a_1305b#>

		</td>
	</tr>
	<cfelse> <cfset a_1305b = 0></cfif>

			<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>

		<cfif #pstate# EQ "AR" OR #pstate# EQ "CO" OR #pstate# EQ "FL" OR #pstate# EQ "ME" OR #pstate# EQ "NE" OR #pstate# EQ "MT"OR #pstate# EQ "NH" OR #pstate# EQ "NJ" OR #pstate# EQ "NY" OR #pstate# EQ "TN" OR #pstate# EQ "VT">

						<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			Alta 8.1 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		25.00
		<cfset alta8 = 25.00>
		</td>
	</tr>

					<cfelseif #pstate# EQ "ID">

								<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			Alta 8.1 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		10.00
		<cfset alta8 = 10.00>
		</td>
	</tr>

					<cfelseif #pstate# EQ "OH">
											<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			Alta 8.1 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		75.00
		<cfset alta8 = 75.00>
		</td>
	</tr>
					<cfelseif #pstate# EQ "PA">
												<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			Alta 8.1 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		50.00
				<cfset alta8 = 50.00>
		</td>
	</tr>
						<cfelseif #pstate# EQ "WI">
												<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			Alta 8.1 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		15.00
		<cfset alta8 = 15.00>
		</td>
	</tr>

					<cfelse> <cfset alta8 = 0></cfif>


	<cfif #pstate# eq "FL">
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1307. <img src="./images/info-01.gif" ALT="Alta 9 Endorsement fee">
			Alta 9 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9 =	 #a_ins_premium#/10>
		 #NumberFormat(alta9, '_____.__')#
		<cfset alta9 = #alta9#>
		</td>
	</tr>


<cfelse> <cfset alta9 = 0></cfif>
<tr>
		<td width=250 align=center valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			 <b>TOTAL</b>

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset total = #rec_fee# + #rel_fee# + #city_mort_stamps# + #a_fee_total# + #state_deed_1# + #intang_tax# + #alta9# + #alta8# + #a_1305b# + #a_1304b# + #a_1303b# + #a_1205b# + #a_1113b#  + #a_1112b#  + #a_1111b#  + #a_1107b# + #a_1106b# + #a_1105b# + #a_1104b# + #a_1103b# + #a_1102b# + #a_1101b# + #a_ins_premium#>
 #NumberFormat(total, '_____.__')#
		</td>
	</tr>

	<CFIF #pstate# eq "AR">
	<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
	<CFELSEIF #pstate# eq "CO">

	<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta4 =	 #a_ins_premium#/10>
	#NumberFormat(alta4, '_____.__')#
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta41 =	 #a_ins_premium#/10>
	#NumberFormat(alta41, '_____.__')#
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta5 =	 #a_ins_premium#/10>
	#NumberFormat(alta5, '_____.__')#
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta51 =	 #a_ins_premium#/10>
	#NumberFormat(alta51, '_____.__')#
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
20.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
20.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
20.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

	<cfelseif #pstate# eq "FL">
			<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>


			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 9

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9FL =	 #a_ins_premium#/10>
	#NumberFormat(alta9FL, '_____.__')#
		</td>
	</tr>


		<cfelseif #pstate# eq "ID">

		<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
35.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
35.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
10.00
		</td>
	</tr>


		<cfelseif #pstate# eq "ME" OR #pstate# eq "NE" or #pstate# eq "NH" or #pstate# eq "NJ">

	<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

	<cfelseif #pstate# eq "PA">

		<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>

			<cfelseif #pstate# eq "MT">

		<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

				<cfelseif #pstate# eq "OH">
<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 9

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9OH =	 #a_ins_premium#/10>
	#NumberFormat(alta9OH, '_____.__')#
		</td>
	</tr>
		<cfelseif #pstate# eq "NY">

			<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 9

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9NY =	 #a_ins_premium#/10>
	#NumberFormat(alta9NY, '_____.__')#
		</td>
	</tr>

	<cfelseif #pstate# eq "WV">

		<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
60.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
60.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
60.00
		</td>
	</tr>

		<cfelseif #pstate# eq "WI">

		<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>


	</cfif></cfif>
	</table>
	<!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
			<cfelse>
		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Second Mortgage<b></font>
		</td>
		</tr>
<cfif #read_this_sets_billing_values.a_1101c# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			  #NumberFormat(read_this_sets_billing_values.a_1101c, '_____.__')#
				 <cfset a_1101c = #read_this_sets_billing_values.a_1101c#>

		        </td>
	</tr>

<cfelse><cfset a_1101c = 0></cfif>
	<cfif #read_this_sets_billing_values.a_1102c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			#NumberFormat(read_this_sets_billing_values.a_1102c, '_____.__')#
 <cfset a_1102c = #read_this_sets_billing_values.a_1102c#>
				 </td>
			</tr>
			<cfelse><cfset a_1102c = 0></cfif>
			<cfif #read_this_sets_billing_values.a_1103c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		#NumberFormat(read_this_sets_billing_values.a_1103c, '_____.__')#
 <cfset a_1103c = #read_this_sets_billing_values.a_1103c#>
					 </td>
			</tr>
		<cfelse><cfset a_1103c = 0></cfif>
				<cfif #read_this_sets_billing_values.a_1104c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		#NumberFormat(read_this_sets_billing_values.a_1104c, '_____.__')#
 <cfset a_1104c = #read_this_sets_billing_values.a_1104c#>
		 </td>
	</tr>
<cfelse><cfset a_1104c = 0></cfif>
		<cfif #read_this_sets_billing_values.a_1105c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		#NumberFormat(read_this_sets_billing_values.a_1105c, '_____.__')#

				<cfset a_1105c = #read_this_sets_billing_values.a_1105c#>
		 </td>
	</tr>
<cfelse><cfset a_1105c = 0></cfif>
		<cfif #read_this_sets_billing_values.a_1106c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		#NumberFormat(read_this_sets_billing_values.a_1106c, '_____.__')#
<cfset a_1106c = #read_this_sets_billing_values.a_1106c#>
	 </td>
	</tr>
<cfelse><cfset a_1106c = 0></cfif>
	<cfif #read_this_sets_billing_values.a_1107c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			#NumberFormat(read_this_sets_billing_values.a_1107c, '_____.__')#

			<cfset a_1107c = #read_this_sets_billing_values.a_1107c#>
		</td>
	</tr>
<cfelse><cfset a_1107c = 0></cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
			<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>
	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_textc#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			#NumberFormat(read_this_sets_billing_values.a_1111c, '_____.__')#


		<cfset a_1111c = #read_this_sets_billing_values.a_1111c#>

		</td>


	</tr>
<cfelse><cfset a_1111c = 0></cfif>

	<cfif #read_this_sets_billing_values.a_1112c# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1112_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
#NumberFormat(read_this_sets_billing_values.a_1112c, '_____.__')#

		<cfset a_1112c = #read_this_sets_billing_values.a_1112c#>
		</td>
	</tr>
<cfelse><cfset a_1112c = 0></cfif>

	<cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			 #NumberFormat(read_this_sets_billing_values.a_1113c, '_____.__')#

	<cfset a_1113c = #read_this_sets_billing_values.a_1113c#>
		</td>

	</tr>
<cfelse><cfset a_1113c = 0></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		#NumberFormat(rec_fee, '_____.__')#


		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#NumberFormat(rel_fee, '_____.__')#


		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

			#NumberFormat(a_fee_total, '_____.__')#
		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#NumberFormat(state_deed_1, '_____.__')#


		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
  	#NumberFormat(intang_tax, '_____.__')#


		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
  	#NumberFormat(read_this_sets_billing_values.a_1205c, '_____.__')#

<cfset a_1205c = #read_this_sets_billing_values.a_1205c#>
		</td>
	</tr>
<cfelse> <cfset a_1205c = 0></cfif>

	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

#read_this_sets_billing_values.a_1303_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
#NumberFormat(read_this_sets_billing_values.a_1303c, '_____.__')#

<cfset a_1303c = #read_this_sets_billing_values.a_1303c#>
		</td>
	</tr>
<cfelse> <cfset a_1303c = 0></cfif>

	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#NumberFormat(read_this_sets_billing_values.a_1304c, '_____.__')#


		<cfset a_1304c = #read_this_sets_billing_values.a_1304c#>

		</td>
	</tr>
<cfelse> <cfset a_1304c = 0></cfif>

	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
			#read_this_sets_billing_values.a_1305_textc#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
 #NumberFormat(read_this_sets_billing_values.a_1305c, '_____.__')#



			<cfset a_1305c = #read_this_sets_billing_values.a_1305c#>

		</td>
	</tr>
	<cfelse> <cfset a_1305c = 0></cfif>

			<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>

		<cfif #pstate# EQ "AR" OR #pstate# EQ "CO" OR #pstate# EQ "FL" OR #pstate# EQ "ME" OR #pstate# EQ "NE" OR #pstate# EQ "MT"OR #pstate# EQ "NH" OR #pstate# EQ "NJ" OR #pstate# EQ "NY" OR #pstate# EQ "TN" OR #pstate# EQ "VT">

						<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			Alta 8.1 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		25.00
		<cfset alta8 = 25.00>
		</td>
	</tr>

					<cfelseif #pstate# EQ "ID">

								<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			Alta 8.1 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		10.00
		<cfset alta8 = 10.00>
		</td>
	</tr>

					<cfelseif #pstate# EQ "OH">
											<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			Alta 8.1 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		75.00
		<cfset alta8 = 75.00>
		</td>
	</tr>
					<cfelseif #pstate# EQ "PA">
												<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			Alta 8.1 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		50.00
				<cfset alta8 = 50.00>
		</td>
	</tr>
						<cfelseif #pstate# EQ "WI">
												<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee">
			Alta 8.1 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		15.00
		<cfset alta8 = 15.00>
		</td>
	</tr>

					<cfelse> <cfset alta8 = 0></cfif>


	<cfif #pstate# eq "FL">
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1307. <img src="./images/info-01.gif" ALT="Alta 9 Endorsement fee">
			Alta 9 Endorsement fee

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9 =	 #a_ins_premium#/10>
	#NumberFormat(alta9, '_____.__')#
		<cfset alta9 = #alta9#>
		</td>
	</tr>


<cfelse> <cfset alta9 = 0></cfif>

	<tr>
		<td width=250 align=center valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b> TOTAL</b>

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset total = #rec_fee# + #rel_fee# + #city_mort_stamps# + #a_fee_total# + #state_deed_1# + #intang_tax# + #alta9# + #alta8# + #a_1305c# + #a_1304c# + #a_1303c# + #a_1205c# + #a_1113c#  + #a_1112c#  + #a_1111c#  + #a_1107c# + #a_1106c# + #a_1105c# + #a_1104c# + #a_1103c# + #a_1102c# + #a_1101c# + #a_ins_premium#>
#NumberFormat(total, '_____.__')#
		</td>
	</tr>


	<CFIF #pstate# eq "AR">
		<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
	<CFELSEIF #pstate# eq "CO">
	<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta4 =	 #a_ins_premium#/10>
	#NumberFormat(alta4, '_____.__')#
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta41 =	 #a_ins_premium#/10>
	#NumberFormat(alta41, '_____.__')#
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta5 =	 #a_ins_premium#/10>
	#NumberFormat(alta5, '_____.__')#
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta51 =	 #a_ins_premium#/10>
	#NumberFormat(alta51, '_____.__')#
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
20.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
20.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
20.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

	<cfelseif #pstate# eq "FL">

			<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 9

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9FL =	 #a_ins_premium#/10>
	#NumberFormat(alta9FL, '_____.__')#
		</td>
	</tr>


		<cfelseif #pstate# eq "ID">
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
35.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
35.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
10.00
		</td>
	</tr>

		<cfelseif #pstate# eq "ME" OR #pstate# eq "NE" or #pstate# eq "NH" or #pstate# eq "NJ">

		<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

	<cfelseif #pstate# eq "PA">

			<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>

			<cfelseif #pstate# eq "MT">

			<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
50.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

				<cfelseif #pstate# eq "OH">

<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
75.00
		</td>
	</tr>
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 9

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9OH =	 #a_ins_premium#/10>
	#NumberFormat(alta9OH, '_____.__')#
		</td>
	</tr>
		<cfelseif #pstate# eq "NY">
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
25.00
		</td>
	</tr>
			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 9

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
<cfset alta9NY =	 #a_ins_premium#/10>
	#NumberFormat(alta9NY, '_____.__')#
		</td>
	</tr>

	<cfelseif #pstate# eq "WV">

			<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
60.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
60.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
60.00
		</td>
	</tr>

		<cfelseif #pstate# eq "WI">

			<tr>
		<td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel>
			<font size=2 color=blue face=arial>

		ALTA Endorsement Fees for <b>#pstate#</b>
		</td>

	</tr>

			<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>

		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 4.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 5.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 6.2

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			 ALTA 8.1

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
15.00
		</td>
	</tr>


	</cfif></cfif>


	</table></cfif>


			</cfoutput>


			<CFOUTPUT>


			<cfif #loc# eq 4>
			<table>
			<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<!---<FONT FACE=verdana SIZE=2 color="black">
							<b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
                            --->
						</td>
						</tr><cfelse>
						<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b>
						</td>
						</tr>

						</cfif>
			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
		        <!---Harry 11/18/2004--->
                <table>
                    <tr>
                        <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                    </tr>
                </table>
		</table>
				</CFOUTPUT>














			<cfelse>

			<tr>
					<td width=780 colspan=3 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>
<cfelseif #FORM.pstate# EQ "AL">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=1&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&loanamt_float=#FORM.loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="3" face="arial" color="black">
			<B>Please choose a county.</B>
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "0" CHECKED>Metro Rates: Cherokee, Colbert, Dekalb, Etowah, Franklin, Jackson, Lauderdale, Lawrence, Limestone, Madison, Marion, Marshall and Winston Counties
<BR>
<input type=radio name="input_val" value = "1">National Rates: All Other Counties<BR>

	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>
<table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
<!---California--->
<cfelseif #FORM.pstate# EQ "CA">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=17&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&loanamt_float=#FORM.loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="4" face="arial" color="black">
			<B>Please choose a county.</B>
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "0" CHECKED>Zone 1: Butte, Colusa, Del Norte, Glenn, Humboldt, and Lake Counties
<BR>
<input type=radio name="input_val" value = "1">All Other Zones<BR>

	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>
<table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>

<cfelseif #FORM.pstate# EQ "CO">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=6&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&loanamt_float=#loanamt_float#">
<input type="hidden" name="loanamt_float" value="#loanamt_float#">
	</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="3" face="arial" color="black">
			<B>Please choose a county.</B>
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "13" CHECKED>Adams, Arapahoe, Broomfield, Clear Creek, Denver, Douglas, Elbert, Jefferson Counties<BR>
<input type=radio name="input_val" value = "14">Alamosa, Conejos, Rio Grande and Saguache Counties<br>
<input type=radio name="input_val" value = "15">Archuleta and Mineral Counties<br>
<input type=radio name="input_val" value = "16">Boulder County<br>
<input type=radio name="input_val" value = "17">Chaffee County<br>
<input type=radio name="input_val" value = "30">Custer, Fremont Counties<br>
<input type=radio name="input_val" value = "31">Dolorse, LaPlata, Montezuma Counties<br>
<input type=radio name="input_val" value = "32">Eagle, Garfield, Grand, Jackson, Pitkin, Routt, Summit Counties<br>
<input type=radio name="input_val" value = "33">El Paso County<br>
<input type=radio name="input_val" value = "34">Moffatt County<br>
<input type=radio name="input_val" value = "35">Larimer County<br>
<input type=radio name="input_val" value = "36">Montrose, Ouray Counties<br>
<input type=radio name="input_val" value = "37">Phillips County<br>
<input type=radio name="input_val" value = "38">Pueblo County<br>
<input type=radio name="input_val" value = "39">Rio Blanco County<br>
<input type=radio name="input_val" value = "40">Weld County<br>
<input type=radio name="input_val" value = "41">All other CO counties<br>

	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>
<table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>

<cfelseif #FORM.pstate# EQ "GA">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=2&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&loanamt_float=#loanamt_float#">
<input type="hidden" name="loanamt_float" value="#loanamt_float#">
	</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="3" face="arial" color="black">
			<B>Please choose a county.</B>
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "2" CHECKED>Metro Rates: Fulton, Cobb, Clayton, Cherokee, Dekalb, Gwinnett, Henry, Douglas, Forsyth, Paulding and  Carroll Counties
<BR>
<input type=radio name="input_val" value = "3">National Rates: All Other Counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

<table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
		<cfelseif #FORM.pstate# EQ "MI">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=3&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="3" face="arial" color="black">
			<B>Please choose a county.</B>
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val" value = "4" CHECKED>Metro Rates: Allegan, Barry, Clinton, Eaton, Grand Traverse, Ingham, Ionia, Kent, Leelanau, Montcalm, Muskegon, Newaygo and Ottawa Counties
<BR>
<input type=radio name="input_val" value = "5">National Rates: All Other Counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

<table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
					<cfelseif #FORM.pstate# EQ "NY">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=4&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="3" face="arial" color="black">
			<B>Please choose a county.</B>
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val"   value = "6" CHECKED>Albany, Bronx, Columbia, Dutchess, Greene, Kings, Nassau, New York, Orange, Putnam, Queens, Rensselaer, Richmond, Rockland, Suffolk, Sullivan, Ulster or Westchester<BR>
<BR>
<input type=radio name="input_val"   value = "7">Allegany, Broome, Cattaraugus, Cayuga, Chautauqua, Chemung, Chenango, Clinton, Cortland, Delaware, Erie, Essex, Franklin, Fulton, Genesee, Hamilton, Herkimer, Jefferson, Lewis, Livingston, Madison, Monroe, Montgomery, Niagara, Oneida, Onodaga, Ontario, Orleans, Oswego, Otsego, St. Lawrence, Saratoga, Schenectady, Schoharie, Schuyler, Seneca, Steuben, Tioga, Tompkins, Warren, Washington, Wayne, Wyoming or Yates<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=498 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>
<table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>

				<cfelseif #FORM.pstate# EQ "NE">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=15&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="3" face="arial" color="black">
			<B>Please choose a county.</B>
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val"   value = "150" CHECKED>Douglas, Sarpy, Washington, Dodge, Lancaster<BR>
<input type=radio name="input_val"   value = "151">National Rates: All other counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>
<table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
			</TD>
		</TR>


		<cfelseif #FORM.pstate# EQ "TN">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=5&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="3" face="arial" color="black">
			<B>Please choose a county.</B>
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val"   value = "8" CHECKED>Davidson County<BR>
<input type=radio name="input_val"   value = "9" >Hamilton County<BR>
<input type=radio name="input_val"   value = "10" >Knox County<BR>
<input type=radio name="input_val"   value = "11">Shelby County<BR>
<input type=radio name="input_val"   value = "12">National Rates: All other counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>


			</TD>
		</TR>
		<table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
		<cfelseif #FORM.pstate# EQ "AZ">
<cfoutput>
<FORM METHOD=POST ACTION="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=7&searchtype=#searchtype#&pstate=#pstate#&loanamt_float=#loanamt_float#">
</cfoutput>
	<TR>
     <td bgcolor=white width=780 align=center valign=top>
		<font SIZE="3" face="arial" color="black">
			<B>Please choose a county.</B>
		</font>
    </TD>
</TR>
<TR>
	<td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">

<input type=radio name="input_val"   value = "18" CHECKED>Maricopa, Pima, Pinal Counties<BR>
<input type=radio name="input_val"   value = "19" >Coconino County<BR>
<input type=radio name="input_val"   value = "20" >Cochise County<BR>
<input type=radio name="input_val"   value = "21">Yavapai County<BR>
<input type=radio name="input_val"   value = "22">Mohave County<BR>
<input type=radio name="input_val"   value = "23">National Rates: All other counties<BR>


	</TD></tr> <TR><td bgcolor=d3d3d3 width=780 align=right valign=top>
							<INPUT TYPE=image src="./images/button_continue.gif" border=0>
						</td><TR> </form>

			</TD>
		</TR>
        <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>

<cfelse>
		<font SIZE="2" face="arial">
			This State is not served by our company.
		</font><br />
<table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
			</cfif>


</table>

</cfif>


<CFIF #a_trigger# EQ "1"><!---Alabama--->



					<cfif isdefined ("form.input_val") and #FORM.input_val# is "0">
					<CFSET a_tble_to_read = "StateAlabamaMetro">
					<cfelse>
					<CFSET a_tble_to_read = "StateAlabamaState">
 					</cfif>
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
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>
					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>




		<CFelseIF #a_trigger# EQ "2">

					<cfif isdefined ("form.input_val") and #FORM.input_val# is "2">
					<CFSET a_tble_to_read = "StateGeorgiaMetro">

		<cfelse>

					<CFSET a_tble_to_read = "StateGeorgiaState">
		</cfif>

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
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>

<!---California--->
<CFelseIF #a_trigger# EQ "17">

					<cfif isdefined ("form.input_val") and #FORM.input_val# is "0">
					<CFSET a_tble_to_read = "StateCaliforniaZone2">

		<cfelse>

					<CFSET a_tble_to_read = "StateCaliforniaZone1">
		</cfif>

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
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>
<!---End California --->


<CFelseIF #a_trigger# EQ "3">
					<cfif isdefined ("form.input_val") and #FORM.input_val# is "4">
					<CFSET a_tble_to_read = "StateMichiganZone2">

		<cfelse>

					<CFSET a_tble_to_read = "StateMichiganZone1">
		</cfif>
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
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>



				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>

		<CFelseIF #a_trigger# EQ "4">
					<cfif isdefined ("form.input_val") and #FORM.input_val# is "6">
					<CFSET a_tble_to_read = "StateNewYorkZone2">

 		<cfelse>

					<CFSET a_tble_to_read = "StateNewYorkZone1">
		</cfif>

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
													<!--- * #loanamt_float# --->
					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>

		<CFelseIF #a_trigger# EQ "5">
					<cfif isdefined ("form.input_val") and #FORM.input_val# is "8">
					<CFSET a_tble_to_read = "StateTennesseeZone1">

 					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "9">
					<CFSET a_tble_to_read = "StateTennesseeZone2">

					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "10">
					<CFSET a_tble_to_read = "StateTennesseeZone3">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "11">
					<CFSET a_tble_to_read = "StateTennesseeZone4">
		<cfelse>
		<CFSET a_tble_to_read = "StateTennessee">
		</cfif>

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


					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>

					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>


			<CFelseIF #a_trigger# EQ "7">

					<cfif #comp_id# eq "115">
					<CFSET a_tble_to_read = "StateArizonaMIC">
					<cfelse>

					<cfif isdefined ("form.input_val") and #FORM.input_val# is "18">
					<CFSET a_tble_to_read = "StateArizonaZone1">

 					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "19">
					<CFSET a_tble_to_read = "StateArizonaZone2">

					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "20">
					<CFSET a_tble_to_read = "StateArizonaZone3">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "21">
					<CFSET a_tble_to_read = "StateArizonaZone4">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "22">
					<CFSET a_tble_to_read = "StateArizonaZone5">

		<cfelse>
		<CFSET a_tble_to_read = "StateArizona">
		</cfif>


				</cfif>

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


					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>

					<CFIF #searchType# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>




				<CFelseIF #a_trigger# EQ "15">


					<cfif isdefined ("form.input_val") and #FORM.input_val# is "150">
					<CFSET a_tble_to_read = "StateNebraskaZone1">


		<cfelse>
		<CFSET a_tble_to_read = "StateNebraska">
		</cfif>



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


					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>

					<CFIF #searchType# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>







		<CFelseIF #a_trigger# EQ "6">
					<cfif isdefined ("form.input_val") and #FORM.input_val# is "13">
					<CFSET a_tble_to_read = "StateColoradoZone1">

 					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "14">
					<CFSET a_tble_to_read = "StateColoradoZone2">

					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "15">
					<CFSET a_tble_to_read = "StateColoradoZone3">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "16">
					<CFSET a_tble_to_read = "StateColoradoZone4">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "17">
					<CFSET a_tble_to_read = "StateColoradoZone5">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "30">
					<CFSET a_tble_to_read = "StateColoradoZone6">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "31">
					<CFSET a_tble_to_read = "StateColoradoZone7">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "32">
					<CFSET a_tble_to_read = "StateColoradoZone8">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "33">
					<CFSET a_tble_to_read = "StateColoradoZone9">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "34">
					<CFSET a_tble_to_read = "StateColoradoZone10">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "35">
					<CFSET a_tble_to_read = "StateColoradoZone11">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "36">
					<CFSET a_tble_to_read = "StateColoradoZone12">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "37">
					<CFSET a_tble_to_read = "StateColoradoZone13">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "38">
					<CFSET a_tble_to_read = "StateColoradoZone14">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "39">
					<CFSET a_tble_to_read = "StateColoradoZone15">
					<cfelseif isdefined ("form.input_val") and #FORM.input_val# is "40">
					<CFSET a_tble_to_read = "StateColoradoZone16">
		<cfelse>
		<CFSET a_tble_to_read = "StateColoradoZone17">
		</cfif>

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


					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>

					<CFIF #searchtype# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>




	<cfelse>
			</cfif>




<!---Alabama--->
<cfif #a_trigger# eq "1">
    <cfif #read_ins_calc.recordcount# GT 0 or #read_ins_calc.recordcount# eq 0>
<CFOUTPUT>
        <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
		    SELECT *
			FROM recording_fees
			WHERE state = '#pstate#'
		</CFQUERY>

        <CFIF #read_rec_fees.recordcount# gt "0">
		    <CFIF #read_rec_fees.mort_stamps# NEQ "0">
			    <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
			<cfelse>
			    <CFSET city_mort_stamps = "0">
			</cfif>
	        <!---Purchase--->
	        <cfif #searchType# eq "Purchase">
	            <CFIF #read_rec_fees.transfer_tax# NEQ "0">
	                <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
		        <cfelse>
			        <CFSET state_deed_1 = "0">   <!-- 1203 total -->
			    </cfif>
	        <cfelse>
	            <CFSET state_deed_1 = "0">
	        </cfif>

            <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
                <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
            <CFELSE>
                <Cfset rec_fee = "0">
            </cfif>

	        <CFIF #read_rec_fees.release_rec_fee# NEQ "">
                <Cfset rel_fee = #read_rec_fees.release_rec_fee#>
            <CFELSE>
                <Cfset rel_fee = "0">
            </cfif>

            <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
		        <CFSET a_fee_total = "0">
		    <cfelse>
			    <CFSET a_fee_total = "0">
			</cfif>

	        <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
	            <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
		    <cfelse>
			    <CFSET intang_tax = "0">
			</cfif>
		<cfelse>
			<CFSET rec_fee = "0">
		    <CFSET rel_fee = "0">
			<CFSET city_mort_stamps = "0">
			<CFSET a_fee_total = "0">
			<CFSET state_deed_1 = "0">
			<CFSET intang_tax = "0">
		</cfif>
</CFOUTPUT>

<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
    SELECT *
	FROM company_billing_states
	WHERE company_id = 559 and a_states = '#pstate#'  <!---I have no idea why the company ID is hard coded in there--->
</CFQUERY>

<cfoutput query="read_this_sets_billing_states">
    <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
	    SELECT *
		FROM company_billing_values
		WHERE billing_id = #read_this_sets_billing_states.billing_id#
    </CFQUERY>

<table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
    <tr>
		<td width=780 align=center valign=top bgcolor=e6e6e6>
<cfif #searchType# eq "Refinance">
		        <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
                    <tr>
		                <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		                    <center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
		                </td>
		            </tr>
    <cfif #read_this_sets_billing_values.a_1101# neq "">
	    <tr>
  		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		        Settlement or Closing Fee
			</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1101#
			</td>
	    </tr>
	</cfif>
	<cfif #read_this_sets_billing_values.a_1102# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		        Abstract or Title Search
			</td>
            <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1102#
			</td>
        </tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1103# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1103. <img src="./images/info-01.gif" ALT="Title Examination">
                Title Examination
			</td>
            <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #read_this_sets_billing_values.a_1103#
			</td>
		</tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1104# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
                Title Insurance Binder
		    </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1104#
		    </td>
	    </tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1105# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	            Document Preparation
			</td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
	            #read_this_sets_billing_values.a_1105#
			</td>
	    </tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1106# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		        Notary Fees
	        </td>
	 	    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1106#
	        </td>
	    </tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1107# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		        Attorney's Fees
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1107#
		    </td>
	    </tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1111# neq "">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
                #read_this_sets_billing_values.a_1111_text#
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1111#
	        </td>
	    </tr>
    </cfif>
    <cfif #read_this_sets_billing_values.a_1112# neq "">
	    <tr>
            <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
                #read_this_sets_billing_values.a_1112_text#
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #read_this_sets_billing_values.a_1112#
		    </td>
	    </tr>
    </cfif>
	<cfif #read_this_sets_billing_values.a_1113# neq "">
		<tr>
            <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	            #read_this_sets_billing_values.a_1113_text#
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1113#
            </td>
	    </tr>
    </cfif>
	<cfif #read_this_sets_billing_values.a_1205# neq "">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
                #read_this_sets_billing_values.a_1205_text#
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #read_this_sets_billing_values.a_1205#
	        </td>
	    </tr>
    </cfif>

	<cfif #read_this_sets_billing_values.a_1303# neq "">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
                #read_this_sets_billing_values.a_1303_text#
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #read_this_sets_billing_values.a_1303#
            </td>
	    </tr>
    </cfif>

	<cfif #read_this_sets_billing_values.a_1304# neq "">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	            #read_this_sets_billing_values.a_1304_text#
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
	            #read_this_sets_billing_values.a_1304#
	        </td>
	    </tr>
    </cfif>

	<cfif #read_this_sets_billing_values.a_1305# neq "">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_text#
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #read_this_sets_billing_values.a_1305#
            </td>
	    </tr>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_states">
			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'
</CFQUERY>

<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">
                Title Insurance Premium
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #NumberFormat(a_ins_premium, '_____.__')#
                <cfset a_ins_premium = #a_ins_premium#>
		    </td>
	    </tr>
    <cfelse>
        <cfset a_ins_premium = 0>
    </cfif>
</cfif>
<cfif #rec_fee# neq "0">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1201. <img src="./images/info-01.gif" ALT="Recording fee">
                Recording Fee
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
	            #rec_fee#
		    </td>
        </tr>
</cfif>
<cfif #rel_fee# neq "0">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1201. <img src="./images/info-01.gif" ALT="Release Fee">
                Release Fee
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
	            #rel_fee#
		    </td>
	    </tr>
</cfif>
<cfif #a_fee_total# neq "0">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
                Total Recording Fee
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
	            #a_fee_total#
		    </td>
	    </tr>
</cfif>
<cfif #city_mort_stamps# neq "0">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	            City Mortgage Stamps
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
	            #NumberFormat(city_mort_stamps, '_____.__')#
		    </td>
	    </tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1203. <img src="./images/info-01.gif" ALT="State Deed">
                State Deed
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #NumberFormat(state_deed_1, '_____.__')#
		    </td>
	    </tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
                Intangible Tax
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #NumberFormat(intang_tax, '_____.__')#
		    </td>
	    </tr>
</cfif>
<!---Harry 11/19/2004--->
        <tr>
	        <td width=250 align=center valign=top bgcolor=e6e6e6>
		        <font size=2 color=blue face=arial>
		        <b>TOTAL</b>
	        </td>
	        <td width=250 align=left valign=top bgcolor=e6e6e6>
		        <font size=2 color=blue face=arial>
		        <cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#
	        </td>
        </tr>
	</table>
	<cfelseif #searchtype# eq "purchase">
	<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
        <tr>
		    <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		        <font size=2  color=blue face=arial><b>Purchase</b></font>
		    </td>
	    </tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
	        <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		            Settlement or Closing Fee
			    </td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
		            #read_this_sets_billing_values.a_1101b#
			    </td>
	        </tr>
	    </cfif>
        <cfif #read_this_sets_billing_values.a_1102b# neq "">
	        <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		            Abstract or Title Search
		        </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
		            #read_this_sets_billing_values.a_1102b#
			    </td>
			</tr>
        </cfif>
        <cfif #read_this_sets_billing_values.a_1103b# neq "">
	        <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1103. <img src="./images/info-01.gif" ALT="Title Examination">
                    Title Examination
				</td>
                <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
                    #read_this_sets_billing_values.a_1103b#
				</td>
			</tr>
    	</cfif>
        <cfif #read_this_sets_billing_values.a_1104b# neq "">
	        <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
                    Title Insurance Binder
		        </td>
		 	    <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
		            #read_this_sets_billing_values.a_1104b#
		        </td>
	        </tr>
    	</cfif>
        <cfif #read_this_sets_billing_values.a_1111b# neq "">
		    <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
                    #read_this_sets_billing_values.a_1111_textb#
		        </td>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
		            #read_this_sets_billing_values.a_1111b#
                </td>
	        </tr>
        </cfif>
	    <cfif #read_this_sets_billing_values.a_1112b# neq "">
		    <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
                    #read_this_sets_billing_values.a_1112_textb#
		        </td>
			    <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
                    #read_this_sets_billing_values.a_1112b#
		        </td>
	        </tr>
        </cfif>
		<cfif #read_this_sets_billing_values.a_1113b# neq "">
		    <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	                #read_this_sets_billing_values.a_1113_textb#
		        </td>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
		            #read_this_sets_billing_values.a_1113b#
                </td>
	        </tr>
        </cfif>
	    <cfif #read_this_sets_billing_values.a_1205b# neq "">
		    <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	                #read_this_sets_billing_values.a_1205_textb#
		        </td>
			    <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
                    #read_this_sets_billing_values.a_1205b#
                </td>
	        </tr>
        </cfif>
	    <cfif #read_this_sets_billing_values.a_1105b# neq "">
	        <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	                Document Preparation
			    </td>
		 	    <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
	                #read_this_sets_billing_values.a_1105b#
			    </td>
	        </tr>
	    </cfif>
	    <cfif #read_this_sets_billing_values.a_1303b# neq "">
		    <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
                    #read_this_sets_billing_values.a_1303_textb#
		        </td>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
                    #read_this_sets_billing_values.a_1303b#
                </td>
	        </tr>
        </cfif>
	    <cfif #read_this_sets_billing_values.a_1106b# neq "">
	        <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		            Notary Fees
	            </td>
	 	        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
		            #read_this_sets_billing_values.a_1106b#
	            </td>
	        </tr>
	    </cfif>
	    <cfif #read_this_sets_billing_values.a_1304b# neq "">
		    <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
                    #read_this_sets_billing_values.a_1304_textb#
		        </td>
			    <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
	                #read_this_sets_billing_values.a_1304b#
		        </td>
	        </tr>
        </cfif>
	    <cfif #read_this_sets_billing_values.a_1107b# neq "">
	        <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		            Attorney's Fees
			    </td>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
			        #read_this_sets_billing_values.a_1107b#
		        </td>
	        </tr>
	    </cfif>
	    <cfif #read_this_sets_billing_values.a_1305b# neq "">
		    <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
			        #read_this_sets_billing_values.a_1305_textb#
		        </td>
			    <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
                    #read_this_sets_billing_values.a_1305b#
		        </td>
	        </tr>
        </cfif>
    <!---Harry 11/22/2004--->

<CFQUERY datasource="#request.dsn#" NAME="read_states">
    SELECT *
	FROM first_title_states
	where st_abbrev = '#pstate#'
</CFQUERY>

<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">
            <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">
                    Title Insurance Premium
		        </td>
			    <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
		            #NumberFormat(a_ins_premium, '_____.__')#
                    <cfset a_ins_premium = #a_ins_premium#>
		        </td>
	        </tr>
    <cfelse>
        <cfset a_ins_premium = 0>
    </cfif>
</cfif>
<cfif #rec_fee# neq "0">
		    <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1201. <img src="./images/info-01.gif" ALT="Recording fee">
                    Recording Fee
		        </td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
	                #rec_fee#
		        </td>
	        </tr>
</cfif>
<cfif #rel_fee# neq "0">
		    <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1201. <img src="./images/info-01.gif" ALT="Release Fee">
                    Release Fee
		        </td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
	                #rel_fee#
		        </td>
	        </tr>
</cfif>
<cfif #a_fee_total# neq "0">
		    <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
                    Total Recording Fee
		        </td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
	                #a_fee_total#
		        </td>
	        </tr>
</cfif>
<cfif #city_mort_stamps# neq "0">
		    <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	                City Mortgage Stamps
		        </td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
	                #NumberFormat(city_mort_stamps, '_____.__')#
		        </td>
	        </tr>
</cfif>
<cfif #state_deed_1# neq "0">
		    <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1203. <img src="./images/info-01.gif" ALT="State Deed">
                    State Deed
		        </td>
			    <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
                    #NumberFormat(state_deed_1, '_____.__')#
		        </td>
	        </tr>
</cfif>
<cfif #intang_tax# neq "0">
		    <tr>
		        <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=black face=arial>
			        1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
                    Intangible Tax

		        </td>
			    <td width=250 align=left valign=top bgcolor=e6e6e6>
			        <font size=2 color=blue face=arial>
                    #NumberFormat(intang_tax, '_____.__')#
		        </td>
	        </tr>
</cfif>
    <!---Harry 11/19/2004--->
            <tr>
	            <td width=250 align=center valign=top bgcolor=e6e6e6>
		            <font size=2 color=blue face=arial>
		            <b>TOTAL</b>
	            </td>
	            <td width=250 align=left valign=top bgcolor=e6e6e6>
		            <font size=2 color=blue face=arial>
<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101b# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101b# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102b# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102b# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103b# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103b# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104b# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104b# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105b# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105b# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106b# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106b# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107b# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107b# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111b# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111b# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112b# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112b# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113b# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113b# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205b# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205b# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303b# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303b# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304b# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304b# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305b# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305b# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#
	                  </td>
            </tr>
	</table>
<cfelse>
    <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
        <tr>
		    <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		        <font size=2 color=blue face=arial><b>Second Mortgage<b></font>
		   </td>
		</tr>
    <cfif #read_this_sets_billing_values.a_1101# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		        Settlement or Closing Fee
			</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1101c#
			</td>
        </tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1102c# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		        Abstract or Title Search
		    </td>
            <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1102c#
			</td>
        </tr>
    </cfif>
    <cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
                #read_this_sets_billing_values.a_1111_textc#
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1111c#
	        </td>
	    </tr>
    </cfif>
	<cfif #read_this_sets_billing_values.a_1112c# neq "">
	    <tr>
            <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
                #read_this_sets_billing_values.a_1112_textc#
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #read_this_sets_billing_values.a_1112c#
		    </td>
	    </tr>
    </cfif>
	<cfif #read_this_sets_billing_values.a_1103c# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1103. <img src="./images/info-01.gif" ALT="Title Examination">
                Title Examination
			</td>
            <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #read_this_sets_billing_values.a_1103c#
		    </td>
        </tr>
    </cfif>
	<cfif #read_this_sets_billing_values.a_1104c# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
                Title Insurance Binder
		    </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1104c#
		     </td>
	    </tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1105c# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	            Document Preparation
			</td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
	            #read_this_sets_billing_values.a_1105c#
			</td>
	    </tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1106c# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		        Notary Fees
	        </td>
	 	    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1106c#
	        </td>
	    </tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1107c# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		        Attorney's Fees
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1107c#
		    </td>
	    </tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>
            <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	            #read_this_sets_billing_values.a_1113_textc#
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #read_this_sets_billing_values.a_1113c#
            </td>
	    </tr>
    </cfif>
    <cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
                #read_this_sets_billing_values.a_1205_textc#
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #read_this_sets_billing_values.a_1205c#
	        </td>
	    </tr>
    </cfif>
	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
                #read_this_sets_billing_values.a_1303_textc#
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #read_this_sets_billing_values.a_1303c#
            </td>
	    </tr>
    </cfif>
	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	    	    #read_this_sets_billing_values.a_1304_textc#
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
	            #read_this_sets_billing_values.a_1304c#
            </td>
	    </tr>
    </cfif>
	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
			    #read_this_sets_billing_values.a_1305_textc#
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #read_this_sets_billing_values.a_1305c#
            </td>
	    </tr>
    </cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_states">
    SELECT *
	FROM first_title_states
	where st_abbrev = '#pstate#'
</CFQUERY>

<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">
	    <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">
                Title Insurance Premium
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
		        #NumberFormat(a_ins_premium, '_____.__')#
                <cfset a_ins_premium = #a_ins_premium#>
		    </td>
	    </tr>
    <cfelse>
        <cfset a_ins_premium = 0>
    </cfif>
</cfif>
<cfif #rec_fee# neq "0">
        <tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1201. <img src="./images/info-01.gif" ALT="Recording fee">
                Recording Fee
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
	            #rec_fee#
		    </td>
	    </tr>
</cfif>
<cfif #rel_fee# neq "0">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1201. <img src="./images/info-01.gif" ALT="Release Fee">
                Release Fee
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
	            #rel_fee#
		    </td>
	    </tr>
</cfif>
<cfif #a_fee_total# neq "0">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
                Total Recording Fee
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
	            #a_fee_total#
		    </td>
	    </tr>
</cfif>
<cfif #city_mort_stamps# neq "0">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	            City Mortgage Stamps
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
		        <font size=2 color=blue face=arial>
	            #NumberFormat(city_mort_stamps, '_____.__')#
		    </td>
	    </tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1203. <img src="./images/info-01.gif" ALT="State Deed">
                State Deed
		    </td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #NumberFormat(state_deed_1, '_____.__')#
		    </td>
	    </tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=black face=arial>
			    1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
                Intangible Tax
		    </td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #NumberFormat(intang_tax, '_____.__')#
		    </td>
	    </tr>
</cfif>
<!---Harry 11/19/2004--->
        <tr>
	        <td width=250 align=center valign=top bgcolor=e6e6e6>
		        <font size=2 color=blue face=arial>
		        <b>TOTAL</b>
	        </td>
	        <td width=250 align=left valign=top bgcolor=e6e6e6>
		        <font size=2 color=blue face=arial>
		        <cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101c# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101c# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102c# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102c# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103c# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103c# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104c# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104c# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105c# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105c# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106c# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106c# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107c# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107c# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111c# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111c# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112c# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112c# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113c# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113c# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205c# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205c# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303c# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303c# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304c# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304c# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305c# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305c# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#


	        </td>
        </tr>
    </table>
    </cfif>
</cfoutput>
<!---End of Alabama--->
<CFOUTPUT><cfif #loc# eq 4><tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<!---<b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
                            --->
						</td>
						</tr><cfelse>
						<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b>
						</td>
						</tr>

						</cfif>

			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
                <!---Harry 11/18/2004--->
			    <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
			</CFOUTPUT>
	<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>

<cfelseif #a_trigger# EQ "2">
<cfif #read_ins_calc.recordcount# GT "0" or #read_ins_calc.recordcount# eq 0>
<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#pstate#'


				</CFQUERY>
					<CFIF #read_rec_fees.recordcount# gt "0">
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
								<CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
			<cfelse>
			<CFSET city_mort_stamps = "0">
			</cfif>
		<cfif #searchType# eq "Purchase">
	<CFIF #read_rec_fees.transfer_tax# NEQ "0">
	<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
		<cfelse>
			<CFSET state_deed_1 = "0">   <!-- 1203 total -->
			</cfif>
	<cfelse>
	<CFSET state_deed_1 = "0">
	</cfif>

	<CFIF #read_rec_fees.mort_rec_fee# NEQ "">
<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
<CFELSE>
<Cfset rec_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "">
<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
<CFELSE>
<Cfset rel_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
		<CFSET a_fee_total = "0">
		<cfelse>
			<CFSET a_fee_total = "0">
			</cfif>


		<CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
	<CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
		<cfelse>
			<CFSET intang_tax = "0">
			</cfif>




		<cfelse>
			<CFSET rec_fee = "0">
		<CFSET rel_fee = "0">
			<CFSET city_mort_stamps = "0">
				<CFSET a_fee_total = "0">
				<CFSET state_deed_1 = "0">
				<CFSET intang_tax = "0">
			</cfif>


			</CFOUTPUT>

			<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE company_id = 559 and a_states = '#pstate#'

		</CFQUERY>

<cfoutput query="read_this_sets_billing_states">
		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE billing_id = #read_this_sets_billing_states.billing_id#

		</CFQUERY>







			<table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

		<tr>
		<td width=780 align=center valign=top bgcolor=e6e6e6>
		<cfif #searchType# eq "Refinance">


		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
  <tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
		</td>
		</tr>
	<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102#
				 </td>
			</tr>
			</cfif>
        	<cfif #read_this_sets_billing_values.a_1103# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103#
					 </td>
			</tr>
			</cfif>
        	<cfif #read_this_sets_billing_values.a_1104# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104#
		 </td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1105# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105#

		 </td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1106# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106#
	 </td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107#

		</td>
	</tr>
	</cfif>

    	<cfif #read_this_sets_billing_values.a_1111# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_text#


		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111#


		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1112_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1113# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113#

		</td>

	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1205# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1303# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1304# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304#



		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1305# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1305_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305#




		</td>
	</tr>

</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
    <tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#

	</td>
</tr>

</cfif>
	</table>

		<!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->

	<cfelseif #searchtype# eq "purchase">
	<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->

<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2  color=blue face=arial><b>Purchase</b></font>
		</td>
		</tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101b#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102b#
				 </td>
			</tr>
			</cfif>
            	<cfif #read_this_sets_billing_values.a_1103b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103b#
					 </td>
			</tr>
			</cfif>
            	<cfif #read_this_sets_billing_values.a_1104b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104b#
		 </td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1105b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105b#

		 </td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1106b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106b#
	 </td>
	</tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1107b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107b#

		</td>
	</tr>
	</cfif>


            	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_textb#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111b#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112b# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113b#

		</td>

	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1205b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1205_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205b#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1303b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303b#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1304b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304b#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textb#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305b#




		</td>
	</tr>
    <tr>
	</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
    <TR>
    <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
    <cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101b# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101b# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102b# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102b# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103b# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103b# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104b# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104b# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105b# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105b# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106b# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106b# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107b# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107b# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111b# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111b# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112b# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112b# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113b# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113b# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205b# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205b# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303b# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303b# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304b# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304b# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305b# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305b# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#
        	</td>
        </tr>

	</table>
	<!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
			<cfelse>
		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Second Mortgage<b></font>
		</td>
		</tr>
<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101c#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102c#
				 </td>
			</tr>
			</cfif>
        	<cfif #read_this_sets_billing_values.a_1103c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103c#
					 </td>
			</tr>
			</cfif>
            	<cfif #read_this_sets_billing_values.a_1104c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104c#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105c#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106c#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107c#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_textc#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111c#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112c# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112c#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113c#

		</td>

	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
		#read_this_sets_billing_values.a_1304_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304c#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
			#read_this_sets_billing_values.a_1305_textc#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305c#




		</td>
	</tr>


</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
    <tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101c# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101c# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102c# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102c# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103c# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103c# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104c# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104c# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105c# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105c# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106c# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106c# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107c# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107c# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111c# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111c# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112c# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112c# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113c# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113c# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205c# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205c# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303c# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303c# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304c# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304c# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305c# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305c# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#


	</td>
</tr>

</cfif>

	</table></cfif></cfoutput>
			<CFOUTPUT><cfif #loc# eq 4><tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<!---<b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
                            --->
						</td>
						</tr><cfelse>
						<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b>
						</td>
						</tr>

						</cfif>
			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
                <!---Harry 11/18/2004--->
                <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
			</CFOUTPUT>
			<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>





			</cfif>

<!---California Start--->

<cfelseif #a_trigger# EQ "17">
    <cfif #read_ins_calc.recordcount# GT "0" or #read_ins_calc.recordcount# eq 0>
        <CFOUTPUT>

        <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
		    SELECT *
			FROM recording_fees
			WHERE state = '#pstate#'
		</CFQUERY>

        <CFIF #read_rec_fees.recordcount# gt "0">
		    <CFIF #read_rec_fees.mort_stamps# NEQ "0">
			    <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
			<cfelse>
			    <CFSET city_mort_stamps = "0">
			</cfif>

            <cfif #searchType# eq "Purchase">
	            <CFIF #read_rec_fees.transfer_tax# NEQ "0">
	                <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
		        <cfelse>
			        <CFSET state_deed_1 = "0">   <!-- 1203 total -->
			    </cfif>
	        <cfelse>
	            <CFSET state_deed_1 = "0">
	        </cfif>

	        <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
                <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
            <CFELSE>
                <Cfset rec_fee = "0">
            </cfif>

            <CFIF #read_rec_fees.release_rec_fee# NEQ "">
                <Cfset rel_fee = #read_rec_fees.release_rec_fee#>
            <CFELSE>
                <Cfset rel_fee = "0">
            </cfif>

	        <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
		        <CFSET a_fee_total = "0">
		    <cfelse>
			    <CFSET a_fee_total = "0">
		    </cfif>

	        <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
	            <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
		    <cfelse>
			    <CFSET intang_tax = "0">
		    </cfif>
    <cfelse>

        <CFSET rec_fee = "0">
		<CFSET rel_fee = "0">
		<CFSET city_mort_stamps = "0">
		<CFSET a_fee_total = "0">
		<CFSET state_deed_1 = "0">
		<CFSET intang_tax = "0">
	</cfif>

    </CFOUTPUT>

    <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
	    SELECT *
		FROM company_billing_states
		WHERE company_id = 559 and a_states = '#pstate#'
	</CFQUERY>

    <cfoutput >
		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
		    SELECT *
			FROM company_billing_values
			WHERE billing_id = #read_this_sets_billing_states.billing_id#
		</CFQUERY>

        <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
		    <tr>
		        <td width=780 align=center valign=top bgcolor=e6e6e6>
		<cfif #searchType# eq "Refinance">
		            <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
                        <tr>
		                    <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		                        <center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
		                    </td>
		                </tr>
	        <cfif #read_this_sets_billing_values.a_1101# neq "">
	                    <tr>
		                    <td width=250 align=left valign=top bgcolor=e6e6e6>
			                    <font size=2 color=black face=arial>
			                    1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		                        Settlement or Closing Fee
			                </td>
						    <td width=250 align=left valign=top bgcolor=e6e6e6>
			                    <font size=2 color=blue face=arial>
		                        #read_this_sets_billing_values.a_1101#
			                </td>
	                    </tr>
	        </cfif>

	        <cfif #read_this_sets_billing_values.a_1102# neq "">
	                    <tr>
		                    <td width=250 align=left valign=top bgcolor=e6e6e6>
			                    <font size=2 color=black face=arial>
                    			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
                        		Abstract or Title Search
            				</td>
                            <td width=250 align=left valign=top bgcolor=e6e6e6>
			                    <font size=2 color=blue face=arial>
		                        #read_this_sets_billing_values.a_1102#
				            </td>
			            </tr>
			</cfif>
             <cfif #read_this_sets_billing_values.a_1103# neq "">
	                    <tr>
		                    <td width=250 align=left valign=top bgcolor=e6e6e6>
			                    <font size=2 color=black face=arial>
			                    1103. <img src="./images/info-01.gif" ALT="Title Examination">
                                Title Examination
					        </td>
                            <td width=250 align=left valign=top bgcolor=e6e6e6>
			                    <font size=2 color=blue face=arial>
		                        #read_this_sets_billing_values.a_1103#
					        </td>
			            </tr>
            </cfif>
<cfif #read_this_sets_billing_values.a_1104# neq "">
	                    <tr>
		                    <td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	        Document Preparation
        </td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	        #read_this_sets_billing_values.a_1105#
	    </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107#

		</td>
	</tr>
	</cfif>
             <cfif #read_this_sets_billing_values.a_1111# neq "">
		                <tr>
		                    <td width=250 align=left valign=top bgcolor=e6e6e6>
			                    <font size=2 color=black face=arial>
			                    1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
                                #read_this_sets_billing_values.a_1111_text#
                            </td>
		                    <td width=250 align=left valign=top bgcolor=e6e6e6>
			                    <font size=2 color=blue face=arial>
		                        #read_this_sets_billing_values.a_1111#
		                    </td>
	                    </tr>
            </cfif>
	        <cfif #read_this_sets_billing_values.a_1112# neq "">
		                <tr>
                            <td width=250 align=left valign=top bgcolor=e6e6e6>
			                    <font size=2 color=black face=arial>
			                    1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
                                #read_this_sets_billing_values.a_1112_text#
		                    </td>
			                <td width=250 align=left valign=top bgcolor=e6e6e6>
                    			<font size=2 color=blue face=arial>
                                #read_this_sets_billing_values.a_1112#
		                    </td>
	                    </tr>
            </cfif>

	        <cfif #read_this_sets_billing_values.a_1113# neq "">
		                <tr>
                            <td width=250 align=left valign=top bgcolor=e6e6e6>
			                    <font size=2 color=black face=arial>
			                    1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	                            #read_this_sets_billing_values.a_1113_text#
		                    </td>
		                    <td width=250 align=left valign=top bgcolor=e6e6e6>
			                    <font size=2 color=blue face=arial>
		                        #read_this_sets_billing_values.a_1113#
                            </td>
	                    </tr>
            </cfif>

	<cfif #read_this_sets_billing_values.a_1205# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
            #read_this_sets_billing_values.a_1303_text#
		</td>
		    <td width=250 align=left valign=top bgcolor=e6e6e6>
			    <font size=2 color=blue face=arial>
                #read_this_sets_billing_values.a_1303#
            </td>
	    </tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1305_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305#




		</td>
	</tr>

</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
    <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
        <cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#

	</td>
</tr>
	</table>

		<!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->

	<cfelseif #searchtype# eq "purchase">
	<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->

<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2  color=blue face=arial><b>Purchase</b></font>
		</td>
		</tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101b#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102b#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103b#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104b#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105b#

		 </td>
	</tr>
	</cfif><cfif #read_this_sets_billing_values.a_1106b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106b#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107b#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_textb#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111b#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112b# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113b#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1205_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304b#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textb#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305b#




		</td>
	</tr>


</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>

	</table>
	<!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
			<cfelse>
		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Second Mortgage<b></font>
		</td>
		</tr>
<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101c#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102c#
				 </td>
			</tr>
			</cfif>
    	<cfif #read_this_sets_billing_values.a_1103c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103c#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104c#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105c#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106c#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107c#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_textc#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111c#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112c# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112c#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113c#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
		#read_this_sets_billing_values.a_1304_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304c#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
			#read_this_sets_billing_values.a_1305_textc#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305c#




		</td>
	</tr>

</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
<tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101c# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101c# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102c# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102c# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103c# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103c# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104c# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104c# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105c# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105c# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106c# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106c# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107c# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107c# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111c# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111c# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112c# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112c# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113c# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113c# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205c# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205c# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303c# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303c# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304c# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304c# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305c# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305c# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#


	</td>
</tr>


	</table></cfif></cfoutput>
			<CFOUTPUT><cfif #loc# eq 4><tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<!---<b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
                            --->
						</td>
						</tr><cfelse>
						<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b>
						</td>
						</tr>

						</cfif>
			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
                <!---Harry 11/18/2004--->
                <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
			</CFOUTPUT>
			<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>





			</cfif>



<!---California End--->
	<cfelseif #a_trigger# EQ "3">
<cfif #read_ins_calc.recordcount# GT "0" or #read_ins_calc.recordcount# eq 0>
<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#pstate#'


				</CFQUERY>
					<CFIF #read_rec_fees.recordcount# gt "0">
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
								<CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
			<cfelse>
			<CFSET city_mort_stamps = "0">
			</cfif>

		<cfif #searchType# eq "Purchase">
	<CFIF #read_rec_fees.transfer_tax# NEQ "0">
	<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
		<cfelse>
			<CFSET state_deed_1 = "0">   <!-- 1203 total -->
			</cfif>
	<cfelse>
	<CFSET state_deed_1 = "0">
	</cfif>

	<CFIF #read_rec_fees.mort_rec_fee# NEQ "">
<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
<CFELSE>
<Cfset rec_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "">
<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
<CFELSE>
<Cfset rel_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
		<CFSET a_fee_total = "0">
		<cfelse>
			<CFSET a_fee_total = "0">
			</cfif>


		<CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
	<CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
		<cfelse>
			<CFSET intang_tax = "0">
			</cfif>




		<cfelse>
			<CFSET rec_fee = "0">
		<CFSET rel_fee = "0">
			<CFSET city_mort_stamps = "0">
				<CFSET a_fee_total = "0">
				<CFSET state_deed_1 = "0">
				<CFSET intang_tax = "0">
			</cfif>

			<!--
					<tr>
						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>

						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Recording fees are:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#city_mort_stamps#</b></font>
						</td>
						</tr>
						-->
			</CFOUTPUT>

			<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE company_id = 559 and a_states = '#pstate#'

		</CFQUERY>

<cfoutput query="read_this_sets_billing_states">
		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE billing_id = #read_this_sets_billing_states.billing_id#

		</CFQUERY>







			<table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

		<tr>
		<td width=780 align=center valign=top bgcolor=e6e6e6>
		<cfif #searchType# eq "Refinance">


		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
  <tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
		</td>
		</tr>
	<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_text#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1112_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1305_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305#




		</td>
	</tr>
</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
    <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
        <cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#

	</td>
</tr>
	</table>

		<!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->

	<cfelseif #searchtype# eq "purchase">
	<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->

<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2  color=blue face=arial><b>Purchase</b></font>
		</td>
		</tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101b#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102b#
				 </td>
			</tr>
			</cfif>
    	<cfif #read_this_sets_billing_values.a_1103b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103b#
					 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1104b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104b#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105b#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106b#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107b#

		</td>
	</tr>
	</cfif>

    	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_textb#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111b#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112b# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112b#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1113b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113b#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1205_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304b#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textb#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305b#




		</td>
	</tr>
</cfif>


		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
<tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101b# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101b# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102b# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102b# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103b# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103b# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104b# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104b# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105b# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105b# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106b# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106b# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107b# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107b# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111b# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111b# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112b# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112b# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113b# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113b# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205b# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205b# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303b# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303b# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304b# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304b# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305b# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305b# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#

	</td>
</tr>

	</table>
    <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
	<!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
			<cfelse>
		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Second Mortgage<b></font>
		</td>
		</tr>
<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101c#

		        </td>
	</tr>

	</cfif>
	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_textc#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111c#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1102c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102c#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103c#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104c#
		 </td>
	</tr>
	</cfif>

<cfif #read_this_sets_billing_values.a_1105c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105c#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106c#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107c#

		</td>
	</tr>
	</cfif>
	<cfif #read_this_sets_billing_values.a_1112c# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113c#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
		#read_this_sets_billing_values.a_1304_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304c#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textc#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305c#




		</td>
	</tr>
</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>

<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			 	#NumberFormat(state_deed_1, '_____.__')#


		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
<tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101c# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101c# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102c# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102c# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103c# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103c# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104c# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104c# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105c# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105c# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106c# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106c# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107c# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107c# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111c# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111c# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112c# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112c# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113c# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113c# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205c# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205c# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303c# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303c# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304c# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304c# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305c# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305c# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#


	</td>
</tr>

	</table></cfif></cfoutput>
		<cfoutput>	<cfif #loc# eq 4><tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<!---<b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
                            --->
						</td>
						</tr><cfelse>
						<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loanamt_float=#loanamt_float#&calc=yes&a_trigger=1">click here</A> (HUD1 will be recalculated)</b>
						</td>
						</tr>

						</cfif>
			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
                <!---Harry 11/18/2004 --->
			    <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
			</CFOUTPUT>

			<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>

			<cfelseif #a_trigger# EQ "4">

<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#pstate#'


				</CFQUERY>
					<CFIF #read_rec_fees.recordcount# gt "0">
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
								<CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
			<cfelse>
			<CFSET city_mort_stamps = "0">
			</cfif>

		<cfif #searchType# eq "Purchase">
	<CFIF #read_rec_fees.transfer_tax# NEQ "0">
	<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
		<cfelse>
			<CFSET state_deed_1 = "0">   <!-- 1203 total -->
			</cfif>
	<cfelse>
	<CFSET state_deed_1 = "0">
	</cfif>

	<CFIF #read_rec_fees.mort_rec_fee# NEQ "">
<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
<CFELSE>
<Cfset rec_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "">
<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
<CFELSE>
<Cfset rel_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
		<CFSET a_fee_total = "0">
		<cfelse>
			<CFSET a_fee_total = "0">
			</cfif>


		<CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
	<CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
		<cfelse>
			<CFSET intang_tax = "0">
			</cfif>




		<cfelse>
			<CFSET rec_fee = "0">
		<CFSET rel_fee = "0">
			<CFSET city_mort_stamps = "0">
				<CFSET a_fee_total = "0">
				<CFSET state_deed_1 = "0">
				<CFSET intang_tax = "0">
			</cfif>

			<!--
					<tr>
						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>

						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Recording fees are:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#city_mort_stamps#</b></font>
						</td>
						</tr>
						-->
			</CFOUTPUT>

			<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE company_id = 559 and a_states = '#pstate#'

		</CFQUERY>

<cfoutput query="read_this_sets_billing_states">
		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE billing_id = #read_this_sets_billing_states.billing_id#

		</CFQUERY>







			<table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
		<!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->

		<!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
		<tr>
		<td width=780 align=center valign=top bgcolor=e6e6e6>
		<cfif #searchType# eq "Refinance">


		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
  <tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
		</td>
		</tr>
	<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_text#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_text#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305#




		</td>
	</tr>
    <tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>

</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
<tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#

	</td>
</tr>

	</table>

		<!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->

	<cfelseif #searchtype# eq "purchase">
	<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->

<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2  color=blue face=arial><b>Purchase</b></font>
		</td>
		</tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101b#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102b#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103b#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104b#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105b#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106b#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107b#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_textb#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111b#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112b# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113b#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304b#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
			#read_this_sets_billing_values.a_1305_textb#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305b#




		</td>
	</tr>


</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
<tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101b# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101b# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102b# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102b# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103b# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103b# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104b# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104b# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105b# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105b# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106b# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106b# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107b# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107b# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111b# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111b# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112b# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112b# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113b# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113b# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205b# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205b# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303b# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303b# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304b# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304b# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305b# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305b# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#

	</td>
</tr>

	</table>
	<!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
			<cfelse>
		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Second Mortgage<b></font>
		</td>
		</tr>
<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101c#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102c#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103c#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104c#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105c#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106c#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107c#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_textc#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111c#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112c# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113c#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304c#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textc#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305c#




		</td>
	</tr>

</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
<tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101c# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101c# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102c# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102c# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103c# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103c# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104c# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104c# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105c# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105c# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106c# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106c# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107c# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107c# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111c# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111c# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112c# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112c# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113c# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113c# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205c# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205c# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303c# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303c# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304c# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304c# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305c# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305c# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#


	</td>
</tr>

	</table></cfif></cfoutput>
			<CFOUTPUT><cfif #loc# eq 4><tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<!---<FONT FACE=verdana SIZE=2 color="black">
							<b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
                            --->
						</td>
						</tr><cfelse>
						<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b>
						</td>
						</tr>

						</cfif>

			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
                <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
			</CFOUTPUT>



						<cfelseif #a_trigger# EQ "5">

				<cfif #read_ins_calc.recordcount# gt "0" or #read_ins_calc.recordcount# eq 0>

<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#pstate#'


				</CFQUERY>
					<CFIF #read_rec_fees.recordcount# gt "0">
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
								<CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
			<cfelse>
			<CFSET city_mort_stamps = "0">
			</cfif>

	<cfif #searchType# eq "Purchase">
	<CFIF #read_rec_fees.transfer_tax# NEQ "0">
	<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
		<cfelse>
			<CFSET state_deed_1 = "0">   <!-- 1203 total -->
			</cfif>
	<cfelse>
	<CFSET state_deed_1 = "0">
	</cfif>

	<CFIF #read_rec_fees.mort_rec_fee# NEQ "">
<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
<CFELSE>
<Cfset rec_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "">
<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
<CFELSE>
<Cfset rel_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
		<CFSET a_fee_total = "0">
		<cfelse>
			<CFSET a_fee_total = "0">
			</cfif>


		<CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
	<CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
		<cfelse>
			<CFSET intang_tax = "0">
			</cfif>




		<cfelse>
			<CFSET rec_fee = "0">
		<CFSET rel_fee = "0">
			<CFSET city_mort_stamps = "0">
				<CFSET a_fee_total = "0">
				<CFSET state_deed_1 = "0">
				<CFSET intang_tax = "0">
			</cfif>

			<!--
					<tr>
						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>

						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Recording fees are:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#city_mort_stamps#</b></font>
						</td>
						</tr>
						-->
			</CFOUTPUT>

			<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE company_id = 559 and a_states = '#pstate#'

		</CFQUERY>

<cfoutput query="read_this_sets_billing_states">
		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE billing_id = #read_this_sets_billing_states.billing_id#

		</CFQUERY>







			<table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
		<!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->

		<!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
		<tr>
		<td width=780 align=center valign=top bgcolor=e6e6e6>
		<cfif #searchType# eq "Refinance">


		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
  <tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
		</td>
		</tr>
	<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107#

		</td>
	</tr>
	</cfif>


    	<cfif #read_this_sets_billing_values.a_1111# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_text#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
		#read_this_sets_billing_values.a_1304_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
			#read_this_sets_billing_values.a_1305_text#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305#




		</td>
	</tr>


</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
    <tr>
        <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#
    </td>
</tr>
	</table>

		<!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->

	<cfelseif #searchtype# eq "purchase">
	<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->

<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2  color=blue face=arial><b>Purchase</b></font>
		</td>
		</tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101b#

		        </td>
	</tr>

	</cfif>
	<cfif #read_this_sets_billing_values.a_1102b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102b#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103b#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104b#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105b#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106b#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107b#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_textb#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111b#



		</td>


	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1112b# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1112_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113b#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
		#read_this_sets_billing_values.a_1304_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304b#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textb#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305b#




		</td>
	</tr>

</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>

<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
    <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
        <cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101c# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101c# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102c# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102c# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103c# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103c# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104c# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104c# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105c# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105c# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106c# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106c# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107c# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107c# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111c# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111c# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112c# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112c# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113c# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113c# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205c# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205c# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303c# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303c# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304c# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304c# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305c# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305c# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#


	</td>
</tr>
	</table>
	<!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
			<cfelse>
		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Second Mortgage<b></font>
		</td>
		</tr>
<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101c#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102c#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103c#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104c#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105c#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106c#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107c#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">


			#read_this_sets_billing_values.a_1111_textc#
		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111c#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112c# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1112_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113c#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304c#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
			#read_this_sets_billing_values.a_1305_textc#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305c#




		</td>
	</tr>

</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
    <tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101c# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101c# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102c# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102c# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103c# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103c# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104c# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104c# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105c# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105c# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106c# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106c# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107c# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107c# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111c# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111c# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112c# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112c# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113c# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113c# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205c# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205c# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303c# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303c# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304c# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304c# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305c# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305c# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#


	</td>
</tr>

</cfif>

	</table></cfif></cfoutput>
		<CFOUTPUT><cfif #loc# eq 4><tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<!---<FONT FACE=verdana SIZE=2 color="black">
							<b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
                            --->
						</td>
						</tr><cfelse>
						<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b>
						</td>
						</tr>

						</cfif>
		<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
                <!----Harry 11/18/2004--->
			    <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
			</CFOUTPUT>
			<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>


				<cfelseif #a_trigger# EQ "7">

				<cfif #read_ins_calc.recordcount# gt "0" or #read_ins_calc.recordcount# eq 0>

<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#pstate#'


				</CFQUERY>
					<CFIF #read_rec_fees.recordcount# gt "0">
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
								<CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
			<cfelse>
			<CFSET city_mort_stamps = "0">
			</cfif>
		<cfif #searchType# eq "Purchase">
	<CFIF #read_rec_fees.transfer_tax# NEQ "0">
	<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
		<cfelse>
			<CFSET state_deed_1 = "0">   <!-- 1203 total -->
			</cfif>
	<cfelse>
	<CFSET state_deed_1 = "0">
	</cfif>

	<CFIF #read_rec_fees.mort_rec_fee# NEQ "">
<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
<CFELSE>
<Cfset rec_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "">
<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
<CFELSE>
<Cfset rel_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
		<CFSET a_fee_total = "0">
		<cfelse>
			<CFSET a_fee_total = "0">
			</cfif>


		<CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
	<CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
		<cfelse>
			<CFSET intang_tax = "0">
			</cfif>




		<cfelse>
			<CFSET rec_fee = "0">
		<CFSET rel_fee = "0">
			<CFSET city_mort_stamps = "0">
				<CFSET a_fee_total = "0">
				<CFSET state_deed_1 = "0">
				<CFSET intang_tax = "0">
			</cfif>


			</CFOUTPUT>

			<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE company_id = 559 and a_states = '#pstate#'

		</CFQUERY>

<cfoutput query="read_this_sets_billing_states">
		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE billing_id = #read_this_sets_billing_states.billing_id#

		</CFQUERY>







			<table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

		<tr>
		<td width=780 align=center valign=top bgcolor=e6e6e6>
		<cfif #searchType# eq "Refinance">


		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
  <tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
		</td>
		</tr>
	<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101#

		        </td>
	</tr>

	</cfif>
    	<cfif #read_this_sets_billing_values.a_1102# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102#
				 </td>
			</tr>
			</cfif>
    <cfif #read_this_sets_billing_values.a_1103# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106#
	 </td>
	</tr>
	</cfif>

<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107#

		</td>
	</tr>
	</cfif>
	<cfif #read_this_sets_billing_values.a_1111# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_text#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1205_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_text#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305#




		</td>
	</tr>


</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>

<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
    <tr>
        <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#
        	</td>
</tr>

	</table>



	<cfelseif #searchtype# eq "purchase">
	<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->

<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2  color=blue face=arial><b>Purchase</b></font>
		</td>
		</tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101b#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102b#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1104b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104b#
		 </td>
	</tr>
	</cfif>

<cfif #read_this_sets_billing_values.a_1103b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103b#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1105b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105b#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106b#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107b#

		</td>
	</tr>
	</cfif>

    	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_textb#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111b#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112b# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1112_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113b#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1205_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304b#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textb#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305b#




		</td>
	</tr>


</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
    <tr>
        <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
    <cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101b# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101b# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102b# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102b# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103b# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103b# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104b# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104b# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105b# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105b# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106b# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106b# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107b# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107b# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111b# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111b# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112b# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112b# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113b# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113b# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205b# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205b# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303b# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303b# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304b# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304b# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305b# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305b# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#

        </td>
</tr>
	</table>
	<!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
			<cfelse>
		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Second Mortgage<b></font>
		</td>
		</tr>
<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101c#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102c#
				 </td>
			</tr>
			</cfif>
            	<cfif #read_this_sets_billing_values.a_1103c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103c#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104c#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105c#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106c#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107c#

		</td>
	</tr>
	</cfif>


    	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">


		#read_this_sets_billing_values.a_1111_textc#
		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111c#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112c# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112c#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113c#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1205_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304c#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1305_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305c#




		</td>
	</tr>

</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
    <tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101c# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101c# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102c# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102c# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103c# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103c# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104c# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104c# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105c# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105c# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106c# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106c# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107c# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107c# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111c# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111c# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112c# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112c# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113c# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113c# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205c# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205c# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303c# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303c# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304c# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304c# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305c# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305c# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#


	</td>
</tr>

</cfif>

	</table></cfif></cfoutput>
	<CFOUTPUT>	<cfif #loc# eq 4><tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<!---<FONT FACE=verdana SIZE=2 color="black">
							<b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
                            --->
						</td>
						</tr><cfelse>
						<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b>
						</td>
						</tr>

						</cfif>
		<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
                <!---Harry--->
			    <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
			</CFOUTPUT>
			<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>









									<cfelseif #a_trigger# EQ "15">

				<cfif #read_ins_calc.recordcount# gt "0" or #read_ins_calc.recordcount# eq 0>

<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#pstate#'


				</CFQUERY>
					<CFIF #read_rec_fees.recordcount# gt "0">
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
								<CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
			<cfelse>
			<CFSET city_mort_stamps = "0">
			</cfif>
		<cfif #searchType# eq "Purchase">
	<CFIF #read_rec_fees.transfer_tax# NEQ "0">
	<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
		<cfelse>
			<CFSET state_deed_1 = "0">   <!-- 1203 total -->
			</cfif>
	<cfelse>
	<CFSET state_deed_1 = "0">
	</cfif>

	<CFIF #read_rec_fees.mort_rec_fee# NEQ "">
<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
<CFELSE>
<Cfset rec_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "">
<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
<CFELSE>
<Cfset rel_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
		<CFSET a_fee_total = "0">
		<cfelse>
			<CFSET a_fee_total = "0">
			</cfif>


		<CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
	<CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
		<cfelse>
			<CFSET intang_tax = "0">
			</cfif>




		<cfelse>
			<CFSET rec_fee = "0">
		<CFSET rel_fee = "0">
			<CFSET city_mort_stamps = "0">
				<CFSET a_fee_total = "0">
				<CFSET state_deed_1 = "0">
				<CFSET intang_tax = "0">
			</cfif>

			</CFOUTPUT>

			<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE company_id = 559 and a_states = '#pstate#'

		</CFQUERY>

<cfoutput query="read_this_sets_billing_states">
		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE billing_id = #read_this_sets_billing_states.billing_id#

		</CFQUERY>







			<table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

		<tr>
		<td width=780 align=center valign=top bgcolor=e6e6e6>
<cfif #searchType# eq "Refinance">


		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
  <tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
		</td>
		</tr>
    <cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102#
				 </td>
			</tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1103# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103#
					 </td>
			</tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1104# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104#
		 </td>
	</tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1105# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105#

		 </td>
	</tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1106# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106#
	 </td>
	</tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107#

		</td>
	</tr>
	</cfif>
    <cfif #read_this_sets_billing_values.a_1111# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_text#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111#



		</td>


	</tr>
    </cfif>
	<cfif #read_this_sets_billing_values.a_1112# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112#

		</td>
	</tr>
    </cfif>

	<cfif #read_this_sets_billing_values.a_1113# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113#

		</td>

	</tr>
    </cfif>

	<cfif #read_this_sets_billing_values.a_1205# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1205_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205#

		</td>
	</tr>
    </cfif>

	<cfif #read_this_sets_billing_values.a_1303# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303#

		</td>
	</tr>
    </cfif>

	<cfif #read_this_sets_billing_values.a_1304# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304#



		</td>
	</tr>
    </cfif>

	<cfif #read_this_sets_billing_values.a_1305# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_text#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305#




		</td>
	</tr>
   </CFIF>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>

<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
    <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>

    <cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#
        	</td>
        </tr>

	</table>

		<!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->

	<cfelseif #searchtype# eq "purchase">
	<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->

<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2  color=blue face=arial><b>Purchase</b></font>
		</td>
		</tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101b#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102b#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103b#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104b#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105b#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106b#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107b#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_textb#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111b#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112b# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1112_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113b#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1205_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304b#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textb#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305b#




		</td>
	</tr>

</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
    <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>

<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101b# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101b# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102b# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102b# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103b# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103b# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104b# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104b# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105b# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105b# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106b# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106b# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107b# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107b# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111b# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111b# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112b# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112b# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113b# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113b# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205b# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205b# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303b# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303b# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304b# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304b# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305b# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305b# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#
        	</td>
</tr>
	</table>
	<!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
			<cfelse>
		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Second Mortgage<b></font>
		</td>
		</tr>
<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101c#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102c#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103c#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104c#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105c#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106c#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107c#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">


		#read_this_sets_billing_values.a_1111_textc#
		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111c#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112c# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113c#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1205_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304c#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1305_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305c#




		</td>
	</tr>

</cfif>


		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
    <tr>
        <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101c# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101c# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102c# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102c# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103c# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103c# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104c# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104c# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105c# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105c# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106c# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106c# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107c# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107c# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111c# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111c# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112c# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112c# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113c# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113c# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205c# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205c# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303c# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303c# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304c# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304c# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305c# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305c# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#

        	</td>
</tr>
	</table></cfif></cfoutput>
	<CFOUTPUT>	<cfif #loc# eq 4><tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<!---<FONT FACE=verdana SIZE=2 color="black">
							<b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
                            --->
						</td>
						</tr><cfelse>
						<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b>
						</td>
						</tr>

						</cfif>
		<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
                <!---Harry--->
			    <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
			</CFOUTPUT>
			<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>





									<cfelseif #a_trigger# EQ "6">

									<cfif #read_ins_calc.recordcount# gt "0" or #read_ins_calc.recordcount# eq 0>
<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#pstate#'


				</CFQUERY>
					<CFIF #read_rec_fees.recordcount# gt "0">
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
								<CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
			<cfelse>
			<CFSET city_mort_stamps = "0">
			</cfif>

	<cfif #searchType# eq "Purchase">
	<CFIF #read_rec_fees.transfer_tax# NEQ "0">
	<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
		<cfelse>
			<CFSET state_deed_1 = "0">   <!-- 1203 total -->
			</cfif>
	<cfelse>
	<CFSET state_deed_1 = "0">
	</cfif>

	<CFIF #read_rec_fees.mort_rec_fee# NEQ "">
<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
<CFELSE>
<Cfset rec_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "">
<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
<CFELSE>
<Cfset rel_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
		<CFSET a_fee_total = "0">
		<cfelse>
			<CFSET a_fee_total = "0">
			</cfif>


		<CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
	<CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
		<cfelse>
			<CFSET intang_tax = "0">
			</cfif>




		<cfelse>
			<CFSET rec_fee = "0">
		<CFSET rel_fee = "0">
			<CFSET city_mort_stamps = "0">
				<CFSET a_fee_total = "0">
				<CFSET state_deed_1 = "0">
				<CFSET intang_tax = "0">
			</cfif>


			</CFOUTPUT>

			<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE company_id = 559 and a_states = '#pstate#'

		</CFQUERY>

<cfoutput query="read_this_sets_billing_states">
		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE billing_id = #read_this_sets_billing_states.billing_id#

		</CFQUERY>







			<table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
		<!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->

		<!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
		<tr>
		<td width=780 align=center valign=top bgcolor=e6e6e6>
		<cfif #searchType# eq "Refinance">


		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
  <tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
		</td>
		</tr>
	<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104# neq "">
<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107#

		</td>
	</tr>
	</cfif>

    	<cfif #read_this_sets_billing_values.a_1111# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_text#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113#

		</td>

	</tr>
</cfif>


	<cfif #read_this_sets_billing_values.a_1205# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1304_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1305_text#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305#




		</td>
	</tr>

</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>
</cfif>
    <tr>
    <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#

	</td>
</tr>
	</table>

		<!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->

	<cfelseif #searchtype# eq "purchase">
	<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->

<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2  color=blue face=arial><b>Purchase</b></font>
		</td>
		</tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101b#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102b#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103b#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104b#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105b#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106b#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107b# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107b#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_textb#


		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111b#


		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112b# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113b#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1205_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
		#read_this_sets_billing_values.a_1304_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304b#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305b# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1305_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305b#




		</td>
	</tr>

</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>
		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>

</cfif>
    <tr>
    <td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
    <cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101b# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101b# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102b# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102b# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103b# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103b# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104b# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104b# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105b# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105b# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106b# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106b# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107b# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107b# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111b# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111b# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112b# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112b# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113b# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113b# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205b# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205b# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303b# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303b# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304b# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304b# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305b# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305b# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#

	</td>
</tr>
	</table>
	<!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
			<cfelse>
		<table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
<tr>

		<td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial><b>Second Mortgage<b></font>
		</td>
		</tr>
<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101c#

		        </td>
	</tr>

	</cfif>

	<cfif #read_this_sets_billing_values.a_1102c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102c#
				 </td>
			</tr>
			</cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103c#
					 </td>
			</tr>
			</cfif>
<cfif #read_this_sets_billing_values.a_1104c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104c#
		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1105c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105c#

		 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1106c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106c#
	 </td>
	</tr>
	</cfif>
<cfif #read_this_sets_billing_values.a_1107c# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107c#

		</td>
	</tr>
	</cfif>
    	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="./images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_textc#

		</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111c#



		</td>


	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1112c# neq "">

		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
            #read_this_sets_billing_values.a_1112_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
            #read_this_sets_billing_values.a_1112c#
		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113c#

		</td>

	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textc#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304.  <img src="./images/info-01.gif" ALT="Data on this line is variable">
		#read_this_sets_billing_values.a_1304_textc#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304c#


		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textc#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305c#




		</td>
	</tr>
    <tr>


</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			where st_abbrev = '#pstate#'

		</CFQUERY>

		<cfif #read_states.recordcount# gt 0>
	<cfif #a_ins_premium# neq "">


		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
		  #NumberFormat(a_ins_premium, '_____.__')#

			<cfset a_ins_premium = #a_ins_premium#>
		</td>
	</tr>
<cfelse><cfset a_ins_premium = 0></cfif></cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1203. <img src="./images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

 	#NumberFormat(state_deed_1, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1204. <img src="./images/info-01.gif" ALT="Intangible Tax">
Intangible Tax

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#NumberFormat(intang_tax, '_____.__')#

		</td>
	</tr>


</cfif>
    <tr>
	<td width=250 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<b>TOTAL</b>
	</td>
	<td width=250 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
		<cfif #a_ins_premium# neq "">
	                <cfset a_ins_premium = #a_ins_premium#>
                <cfelse>
	                <cfset a_ins_premium = 0>
                </cfif>
                <cfif #rec_fee# neq "">
	                <cfset #rec_fee# = #rec_fee# >
                <cfelse>
	                <cfset #rec_fee# = 0>
                </CFIF>
                <cfif #rel_fee# neq "">
	                <cfset #rel_fee# = #rel_fee# >
                <cfelse>
	                <cfset #rel_fee# = 0>
                </CFIF>
                <cfif #a_fee_total# neq "">
	                <cfset #a_fee_total# = #a_fee_total# >
                <cfelse>
	                <cfset #a_fee_total# = 0>
                </CFIF>
                <cfif #city_mort_stamps# neq "">
	                <cfset #city_mort_stamps# = #city_mort_stamps# >
                <cfelse>
	                <cfset #city_mort_stamps# = 0>
                </CFIF>
                <cfif #state_deed_1# neq "">
	                <cfset #state_deed_1# = #state_deed_1# >
                <cfelse>
	                <cfset #state_deed_1# = 0>
                </CFIF>
                <cfif #intang_tax# neq "">
        	        <cfset #intang_tax# = #intang_tax# >
                <cfelse>
	                <cfset #intang_tax# = 0>
                </CFIF>
                	<cfif #read_this_sets_billing_values.a_1101c# neq "">
	        <CFSET a_1101 = #read_this_sets_billing_values.a_1101c# >
        <cfelse>
	        <CFSET a_1101 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1102c# neq "">
	        <CFSET a_1102 = #read_this_sets_billing_values.a_1102c# >
        <CFELSE>
	        <CFSET a_1102 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1103c# neq "">
	        <CFSET a_1103 = #read_this_sets_billing_values.a_1103c# >
        <CFELSE>
	        <CFSET a_1103 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1104c# neq "">
	        <CFSET a_1104 = #read_this_sets_billing_values.a_1104c# >
        <CFELSE>
	        <CFSET a_1104 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1105c# neq "">
	        <CFSET a_1105 = #read_this_sets_billing_values.a_1105c# >
        <CFELSE>
	        <CFSET a_1105 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1106c# neq "">
	        <CFSET a_1106 = #read_this_sets_billing_values.a_1106c# >
        <CFELSE>
	        <CFSET a_1106 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1107c# neq "">
	        <CFSET a_1107 = #read_this_sets_billing_values.a_1107c# >
        <CFELSE>
	        <CFSET a_1107 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1111c# neq "">
        	<CFSET a_1111 = #read_this_sets_billing_values.a_1111c# >
        <CFELSE>
	        <CFSET a_1111 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1112c# neq "">
	        <CFSET a_1112 = #read_this_sets_billing_values.a_1112c# >
        <CFELSE>
	        <CFSET a_1112 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1113c# neq "">
	        <CFSET a_1113 = #read_this_sets_billing_values.a_1113c# >
        <CFELSE>
	        <CFSET a_1113 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1205c# neq "">
	        <CFSET a_1205 = #read_this_sets_billing_values.a_1205c# >
        <CFELSE>
	        <CFSET a_1205 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1303c# neq "">
	        <CFSET a_1303 = #read_this_sets_billing_values.a_1303c# >
        <CFELSE>
	        <CFSET a_1303 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1304c# neq "">
	        <CFSET a_1304 = #read_this_sets_billing_values.a_1304c# >
        <CFELSE>
	        <CFSET a_1304 = 0 >
        </CFIF>
        <cfif #read_this_sets_billing_values.a_1305c# neq "">
	        <CFSET a_1305 = #read_this_sets_billing_values.a_1305c# >
        <CFELSE>
	        <CFSET a_1305 = 0 >
        </CFIF>

        <CFSET Total = #a_ins_premium# + #rec_fee# + #rel_fee# + #a_fee_total# + #city_mort_stamps# + #state_deed_1# + #intang_tax# + #a_1101# + #a_1102# + #a_1103# + #a_1104# + #a_1105# + #a_1106# + #a_1107# + #a_1111# + #a_1112# + #a_1113# + #a_1205# + #a_1303# + #a_1304# + #a_1305# >
                    #NumberFormat(total, '_____.__')#


	</td>
</tr>
	</table></cfif></cfoutput>
	<CFOUTPUT>	<cfif #loc# eq 4><tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<!---<FONT FACE=verdana SIZE=2 color="black">
							<b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
                            --->
						</td>
						</tr><cfelse>
						<tr>
						<td bgcolor="d3d3d3" width=780 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="black">
							<b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b>
						</td>
						</tr>

						</cfif>
			<tr>
					<td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./calculator_page1.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
			    <!---Harry 11/18/2004 --->
                <table>
                                <tr>
                                    <td width=600  align=center valign=top>
                                        <center>Thank you for using <cfoutput>#session.site.long_name#</cfoutput></center>
                                    </td>
                                </tr>
                            </table>
			</CFOUTPUT>

					<cfelse>

			<tr>
					<td width=780 align=center valign=top bgcolor=e1e1e1>
							<FONT FACE=verdana SIZE=2 color="black">
							Sorry, there is no match of the loan amout you entered with any fees in out database.
							</td>
				</tr>


			</cfif>

			</cfif>
				</table>


			</TD>
		</TR>
        <tr>

        </tr>
	</table>




	<!--- </td> <tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>
</tr></tbody></table> --->

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