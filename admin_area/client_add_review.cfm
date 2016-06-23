<cfif IsDefined("url.company")>
<cfset form.company = url.company>
</cfif>
<CFPARAM NAME="enhanced_coverage" DEFAULT="1">
<CFQUERY datasource="#request.dsn#" NAME="check_company_name">
		SELECT *
		FROM Companies
		WHERE Company = '#form.company#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_all_custom_rate_tables">
select NAME from SYSOBJECTS
where TYPE = 'U'
and (NAME LIKE 'Custom_Rate_Table_%')
order by NAME
</CFQUERY>

<cfif check_company_name.recordcount>
<script language="javascript">
alert("That Company name is already in use, please choose another");
history.go(-1);
</script>
<cfabort>
</cfif>


<CFPARAM NAME="sales" DEFAULT="InHouse">
<CFPARAM NAME="newname" DEFAULT="">
<CFPARAM NAME="newname2" DEFAULT="">
<CFPARAM NAME="newname3" DEFAULT="">
<!---Read current User --->
<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM First_Admin
		WHERE ID = '#URL.UID#'
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_all_companies">
		SELECT *
		FROM companies
		where company <> 'NULL'
		and company <> ''
		<cfif read_user.role_id eq 24>
		and intSales = #read_user.ID#
		</cfif>
		order by company
	</CFQUERY>

<!---was client_add_submit--->
<CFSET strURL ="../admin_area/client_add_submit.cfm?uid=#URL.uid#&al=#URL.al#&company=#company#&NewName=#NewName#">


<CFIF IsDefined("Form.company")>
	<CFQUERY datasource="#request.dsn#" NAME="read_company">
		SELECT *
		FROM companies
		WHERE company = '#FORM.company#'
	</CFQUERY>
<CFELSE>
	<CFQUERY datasource="#request.dsn#" NAME="read_company">
		SELECT *
		FROM companies
		WHERE company = '#company#'
	</CFQUERY>
</CFIF>

<CFQUERY datasource="#request.dsn#" NAME="read_cserv">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id = 5)
	and status = 1
	order by username
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_teams">
	SELECT *
	FROM   Teams
	order by ID
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_isales">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id IN(15,25,26)) and status = 1
	ORDER BY fname + ' ' + lname
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_osales">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id = 24 or role_id = 34) and status = 1
	ORDER BY fname + ' ' + lname
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_states">
	SELECT *
	FROM first_title_states
	ORDER BY st_abbrev ASC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_agencies">
	SELECT *
	FROM Title_FT_agencies
	ORDER BY Company ASC, State ASC
</CFQUERY>

<CFSET a_agency_id = ArrayNew(1)>
<CFSET a_agency_state = ArrayNew(1)>
<CFSET a_agency_name = ArrayNew(1)>
<CFSET a_count = "1">

<CFOUTPUT QUERY="read_agencies">
	<CFSET a_agency_id[a_count] = #title_FT_Agency_ID#>
	<CFSET a_agency_state[a_count] = #state#>
	<CFSET a_agency_name[a_count] = #company#>
	<CFSET a_count = #a_count# + "1">
</CFOUTPUT>

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



function validate_form() {
var valid = true;
var message = "The following fields must be completed before submitting:\n";
if (document.signup.a_user.value=='') {
message = message + "UserName\n"
valid = false;
}
if (document.signup.a_pass.value=='') {
message = message + "Password\n"
valid = false;
}
if (document.signup.contact_fname.value=='') {
message = message + "Contact First Name\n"
valid = false;
}
if (document.signup.contact_lname.value=='') {
message = message + "Contact Last Name\n"
valid = false;
}
if (document.signup.email.value=='') {
message = message + "Email Address\n"
valid = false;
}
if (document.signup.Phone.value=='') {
message = message + "Phone Number\n"
valid = false;
}
if (valid == false) {
alert(message);
}
return valid;
}
//  End -->
</script>
<TITLE>First Title Services Admin</TITLE>
</HEAD>
<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
			<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<tr>
					<td width=499 align=center valign=top bgcolor=e2e2e2>
						<FONT SIZE=2 color=black face=arial>
						<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
							<tr>
								<td width=498 align=center valign=top bgcolor=white>
									<font size=2 color=black face=arial>Add Mortgage Client/Customer</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width=499 align=center valign=top bgcolor=white>
						<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>
							<tr>
<CFIF #company# EQ "">
								<td width=130 align=left valign=top bgcolor=FFC600>
									<FONT SIZE=1 color=red face=arial>
									You did not enter a company name
									<p>
									Please use the back button to go back and enter the information.
<CFelseIF #read_company.recordcount# GTE "1" and read_company.a_status eq "1">
								<td width=130 align=left valign=top bgcolor=FFC600>
										<FONT SIZE=1 color=red face=arial>
										The company you entered, already exists in the database and the status is "active".
										<p>
										Please use the back button to go back and change the information.
<cfelseif #read_company.recordcount# GTE "1" and read_company.a_status eq "0">
										<td width=130 align=left valign=top bgcolor=FFC600>
										<FONT SIZE=1 color=red face=arial>
										The company you entered,  exists in the database but the status is "inactive".
										<p>
										Please use the back button to go back and change the information.
										<p>
										To activate company please go back, select company from the list of inactive companis<br> and submit otherwise contact person that has this privilege.

<CFELSE>
								<td width=130 align=left valign=top bgcolor=d3d3d3>
									<FONT SIZE=1 color=black face=arial>
									A check of the database show that this client is not in the database.
									Please fill out the fields below.
									<p>
								</td>
						</table>

						<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<b><font size=2 color=blue face=arial>
									Client Origination -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
								<!---If user is outside sales then they do not get these options --->
								<CFIF #read_user.role_id# eq 24>
									Outside Sales
									<CFSET Sales = "OutsideSales">
								<CFELSE>
												<Input type="radio" Name="Sales" Value="InHouse" <CFIF #Sales# eq "InHouse">
																							Checked
																								</CFIF>
												onClick="go('../admin_area/client_add_review.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<CFOUTPUT>#URL.al#</CFOUTPUT>&company=<CFOUTPUT>#company#</CFOUTPUT>&Sales=InHouse');"
												>In House
												<Input type="radio" Name="Sales" Value="OutsideSales" <CFIF #Sales# eq "OutsideSales">
																								Checked
																							</CFIF>
												onClick="go('../admin_area/client_add_review.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<CFOUTPUT>#URL.al#</CFOUTPUT>&company=<CFOUTPUT>#company#</CFOUTPUT>&Sales=OutsideSales');"
												>Outside Sales
								</CFIF>
								</td>
							</tr>
							<CFFORM METHOD=POST ACTION="./client_add_submit.cfm?uid=#URL.uid#&al=#URL.al#&company=#company#" name="signup">
							<tr>
								<td width=367 colspan = "2" align=center valign=top bgcolor=e6e6e6>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<CFIF #read_user.role_id# eq 24>
									<CFOUTPUT>#read_user.fname# #read_user.lname#</CFOUTPUT>
									<CFSET NewName2 = #read_user.id#>
									<input type="hidden" id= "NewName2" value=<CFOUTPUT>"#NewName2#"</CFOUTPUT>>
								<CFELSE>
									<CFIF #Sales# eq "InHouse">
										<CFSELECT Name="NewName2"
											QUERY="read_isales"
											Value="id"
											Display="Name">
										</CFSELECT>
									</CFIF>
									<CFIF #Sales# eq "OutsideSales">
										<CFSELECT Name="NewName2"
											QUERY="read_osales"
											Value="id"
											Display="Name">
										</CFSELECT>
									</CFIF>
								</CFIF>
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<b><font size=2 color=blue face=arial>
									Username - </b>
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="a_user" VALUE="" size=20 maxlength=50
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
										clear: none; ">
								</td>
							</tr>

							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<b><font size=2 color=blue face=arial>
									Password - </b>
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="a_pass" VALUE="" size=20 maxlength=50
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
										clear: none; ">
								</td>
							</tr>

<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Contact First Name -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="contact_fname" VALUE="" size=40 maxlength=120
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
										clear: none; ">
								</td>
							</tr>

<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Contact Last Name -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="contact_lname" VALUE="" size=40 maxlength=120
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Address -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="addr1" VALUE="" size=40 maxlength=120
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Address -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="addr2" VALUE="" size=40 maxlength=120
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Note -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="a_note_1" VALUE="" size=40 maxlength=120
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									City -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="city" VALUE="" size=30 maxlength=50
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									State -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<SELECT NAME="state"
										size="1"
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
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
								<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
									<CFOUTPUT>
										<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
									</CFOUTPUT>
								</CFLOOP>
									</SELECT>
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Zip Code -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="zip_code" VALUE="" size=20 maxlength=20
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Phone -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="phone" VALUE="" size=25 maxlength=22
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Fax -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="fax" VALUE="" size=25 maxlength=22
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Email -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="email" VALUE="" size=35 maxlength=160
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
										clear: none; ">
								</td>
							</tr>
<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Proposed Monthly Transactions -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
<select name="proposed_monthly_transactions" id="proposed_monthly_transactions">
<option value="10">10</option>
<option value="20">20</option>
<option value="30">30</option>
<option value="40">40</option>
<option value="50">50</option>
<option value="100">100</option>
<option value="200">200</option>
								</select>

								</td>
							</tr>

                            <tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
								    <font size=2 color=black face=arial>
									Enhanced T.I. Coverage</font>
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6 >
		<font size=1 color=blue face=arial><input type="radio" name="enhanced_coverage" value="1" <CFIF #enhanced_coverage# eq 1>checked</CFIF>>&nbsp;Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="enhanced_coverage" value="0" <CFIF #enhanced_coverage# eq 0>checked</CFIF>>&nbsp;No
			</font>
								</td>
                              </tr>



                            <tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
								    <font size=2 color=black face=arial>
									Required Services</font>
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6 >
								    <font size=1 color=blue face=arial>
									<INPUT TYPE="checkbox" NAME="Commit" >&nbsp;&nbsp;
									Insurance Commitment Policy<BR>
									<INPUT TYPE="checkbox" NAME="FullService" >&nbsp;&nbsp;
									Full Closing Services<BR>
									<INPUT TYPE="checkbox" NAME="clearc" >&nbsp;&nbsp;
									Clearc<BR>
									<INPUT TYPE="checkbox" NAME="payoff" >&nbsp;&nbsp;
									Payoff<BR>
									<INPUT TYPE="checkbox" NAME="disbursements">&nbsp;&nbsp;
									Disbursements<BR>
									<INPUT TYPE="checkbox" NAME="recording">&nbsp;&nbsp;
									Recording<BR>
									<INPUT TYPE="checkbox" NAME="shipping">&nbsp;&nbsp;
									Special Shipping Requirements (Please<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; add to comments section)<BR>
									<INPUT TYPE="checkbox" NAME="appraisal" >&nbsp;&nbsp;
									Appraisal<BR>
									<INPUT TYPE="checkbox" NAME="Signing">&nbsp;&nbsp;
									Signing Services Only<BR>

								</td>
                              </tr>


							  <tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Fees</font>
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
								    <font size=1 color=blue face=arial>
									Title Property Report<br>
									&nbsp;&nbsp;&nbsp;Vesting + Legal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstVesting"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="10"
																>
																<option value=null selected></option>
																<option value=25>25&nbsp;</option>
																<option value=30>30&nbsp;</option>
																<option value=35>35&nbsp;</option>
																<option value=40>40&nbsp;</option>
																<option value=45>45&nbsp;</option>
																<option value=50>50&nbsp;</option>
																<option value=55>55&nbsp;</option>
																<option value=60>60&nbsp;</option>
																<option value=65>65&nbsp;</option>
															</select>
																<br>
															&nbsp;&nbsp;&nbsp;Current Owner&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstOwner"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="22"
																>
																<option value=null selected></option>
																<option value=95>95</option>
																<option value=100>100</option>
																<option value=105>105</option>
																<option value=110>110</option>
																<option value=115>115</option>
																<option value=120>120</option>
																<option value=125>125</option>
																<option value=130>130</option>
																<option value=135>135</option>
																<option value=140>140</option>
																<option value=145>145</option>
																<option value=150>150</option>
																<option value=155>155</option>
																<option value=160>160</option>
																<option value=165>165</option>
																<option value=170>170</option>
																<option value=175>175</option>
																<option value=180>180</option>
																<option value=185>185</option>
																<option value=190>190</option>
																<option value=195>195</option>
															</SELECT>
															<br>
															&nbsp;&nbsp;&nbsp;Full Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstFullSearch"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="57"
																>
																<option value=null selected></option>
																<option value=225>225</option>
																<option value=230>230</option>
																<option value=235>235</option>
																<option value=240>240</option>
																<option value=245>245</option>
																<option value=250>250</option>
																<option value=255>255</option>
																<option value=260>260</option>
																<option value=265>265</option>
																<option value=270>270</option>
																<option value=275>275</option>
																<option value=280>280</option>
																<option value=285>285</option>
																<option value=290>290</option>
																<option value=295>295</option>
																<option value=300>300</option>
																<option value=305>305</option>
																<option value=310>310</option>
																<option value=315>315</option>
																<option value=320>320</option>
																<option value=325>325</option>
																<option value=330>330</option>
																<option value=335>335</option>
																<option value=340>340</option>
																<option value=345>345</option>
																<option value=350>350</option>
																<option value=355>355</option>
																<option value=360>360</option>
																<option value=365>365</option>
																<option value=370>370</option>
																<option value=375>375</option>
																<option value=380>380</option>
																<option value=385>385</option>
																<option value=390>390</option>
																<option value=395>395</option>
																<option value=400>400</option>
																<option value=405>405</option>
																<option value=410>410</option>
																<option value=415>415</option>
																<option value=420>420</option>
																<option value=425>425</option>
																<option value=430>430</option>
																<option value=435>435</option>
																<option value=440>440</option>
																<option value=445>445</option>
																<option value=450>450</option>
																<option value=455>455</option>
																<option value=460>460</option>
																<option value=465>465</option>
																<option value=470>470</option>
																<option value=475>475</option>
																<option value=480>480</option>
																<option value=485>485</option>
																<option value=490>490</option>
																<option value=495>495</option>
																<option value=500>500</option>
															</SELECT>
															<br>
															<br>
															Commit/Policy Only $295 + <br>
															&nbsp;&nbsp;&nbsp;Policy & Binder&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstCommitOnly"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="57"
																>
																<option value=null selected></option>
																<option value=25>25</option>
																<option value=30>30</option>
																<option value=35>35</option>
															</SELECT>
																<br>
															National Signing Services&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstSigning"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="57"
																>
																<option value=null selected></option>
																<option value=225>225</option>
																<option value=230>230</option>
																<option value=235>235</option>
																<option value=240>240</option>
																<option value=245>245</option>
																<option value=250>255</option>
																<option value=255>255</option>
																<option value=260>260</option>
																<option value=265>265</option>
																<option value=270>270</option>
																<option value=275>275</option>
																<option value=280>280</option>
																<option value=285>285</option>
																<option value=290>290</option>
																<option value=295>295</option>
																<option value=300>300</option>
																<option value=305>305</option>
																<option value=310>310</option>
																<option value=315>315</option>
																<option value=320>320</option>
																<option value=325>325</option>
																<option value=330>330</option>
																<option value=335>335</option>
																<option value=340>340</option>
																<option value=345>345</option>
																<option value=350>350</option>
																<option value=355>355</option>
																<option value=360>360</option>
																<option value=365>365</option>
																<option value=370>370</option>
																<option value=375>375</option>
															</SELECT>
															<br>
															Recording Services&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$60.00<br>
															Appraisal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstAppraisal"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="57"
																>
																<option value=null selected></option>
																<option value=325>325</option>
																<option value=330>330</option>
																<option value=335>335</option>
																<option value=340>340</option>
																<option value=345>245</option>
																<option value=350>350</option>
																<option value=355>355</option>
																<option value=360>360</option>
																<option value=365>365</option>
																<option value=370>370</option>
																<option value=375>375</option>
																<option value=380>380</option>
																<option value=385>385</option>
																<option value=390>390</option>
																<option value=395>395</option>
																<option value=400>400</option>
																<option value=405>405</option>
																<option value=410>410</option>
																<option value=415>415</option>
																<option value=420>420</option>
																<option value=425>425</option>
																<option value=430>430</option>
																<option value=435>435</option>
																<option value=440>440</option>
																<option value=445>445</option>
																<option value=450>450</option>
																<option value=455>455</option>
																<option value=460>460</option>
																<option value=465>465</option>
																<option value=470>470</option>
																<option value=475>475</option>
															</SELECT>
															</font>
														</td>
													</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Comments -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<TEXTAREA name="a_comment"  COLS=60 ROWS=10
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
										clear: none;"> </TEXTAREA>
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Cust Service -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
				<CFSET myarray=ArrayNew(2)>
			<!--- Populate the array row by row --->
			<CFLOOP QUERY="read_cserv">
				<CFSET myarray[CurrentRow][1]=read_cserv.id[CurrentRow]>
				<CFSET myarray[CurrentRow][2]=read_cserv.NAME[CurrentRow]>
			</CFLoop>

									<SELECT NAME="NewName"
				size="1"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
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
				<CFSET rowcount = #read_cserv.recordcount#>
				<option value="0">None</option>
						<cfoutput><CFLOOP INDEX="Counter" FROM=1 TO="#rowcount#">
							<option value="#MyArray[Counter][1]#" <cfif read_company.intCustServ eq #MyArray[Counter][1]#>selected</cfif>>#MyArray[Counter][2]#</option>
						</CFLOOP></cfoutput>
				</SELECT>
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Cust Service Team -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<CFSELECT Name="Team_id"
										QUERY="read_teams"
										Value="id"
										Display="Name" selected="16">
									</CFSELECT>
								</td>
							</tr>
                            <tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Allow Employee Authentication -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>

				<NOBR><input type=radio name="companies_switch" value="0" checked> -<font size=2 color=red face=arial><B>No</B></NOBR></FONT><br>
				<NOBR><input type=radio name="companies_switch" value="1"> -<font size=2 color=green face=arial><B>Yes</B></NOBR></FONT>

								</td>
							</tr>

<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Send Automatic Reminder/Thank You Emails -
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>

				<NOBR><input type=radio name="auto_email_opt_out" value="0" checked> -<font size=2 color=red face=arial><B>Yes</B></NOBR></FONT><br>
				<NOBR><input type=radio name="auto_email_opt_out" value="1"> -<font size=2 color=green face=arial><B>No</B></NOBR></FONT>

								</td>
							</tr>





<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Master Company
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6><select name="master_co" id="master_co">
<option value="0">None</option>
<cfoutput query="get_all_companies">
<option value="#ID#">#Left(Company, 35)#<cfif Len(Company) gt 35>...</cfif></option>
</cfoutput>
								</select> </td>
							</tr>
<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Custom Rate Table
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6><select name="custom_rate_table" id="custom_rate_table">
<option value="0">None</option>
<cfoutput query="get_all_custom_Rate_Tables">
<option value="#Name#">#Mid(Name, 19, Len(Name))#</option>
</cfoutput>
								</select> </td>
							</tr>

							<!--- <tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									realEC ClientID
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="realECclientID" VALUE="" size=30 maxlength=50
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									AVM Product
								</td>
								<td width=237 bgcolor="e6e6e6" align=left valign=top>
									<SELECT NAME="avmproduct">
										<OPTION VALUE="">Select</OPTION>
										<OPTION VALUE="First" >AVM Upgrade</OPTION>
										<OPTION VALUE="CASA" >CASA (Case Schiller Weiss AVM)</OPTION>
										<OPTION VALUE="HPA" >HPA (Basis 100 - Home Price Analyzer)</OPTION>
										<OPTION VALUE="Home" >Home Value Explorer (Freddie Mac AVM)</OPTION>
										<OPTION VALUE="ValueLogix" >ValueLogix (customized AVM)</OPTION>
									</select>
							</td>
							</tr> --->

							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									AVM Product
								</td>
								<td width=237 bgcolor="e6e6e6" align=left valign=top>
									<SELECT NAME="AVMproduct">
										<OPTION VALUE="">Select</OPTION>
										<OPTION VALUE="First" >AVM Upgrade</OPTION>
										<OPTION VALUE="CASA" >CASA (Case Schiller Weiss AVM)</OPTION>
										<OPTION VALUE="HPA" >HPA (Basis 100 - Home Price Analyzer)</OPTION>
										<OPTION VALUE="Home" >Home Value Explorer (Freddie Mac AVM)</OPTION>
										<OPTION VALUE="ValueLogix" >ValueLogix (customized AVM)</OPTION>
									</select>
							</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									AVM ClientID
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="AVMclientID" VALUE="" size=30 maxlength=50
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									AVM ProviderID
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="AVMproID" VALUE="" size=30 maxlength=50
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
										clear: none; ">
								</td>
							</tr>

							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Flood Product
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6 >
								    <font size=1 color=blue face=arial>
									<INPUT TYPE="checkbox" NAME="Basic" >&nbsp;&nbsp;
									Basic Certification<BR>
									<INPUT TYPE="checkbox" NAME="Census" >&nbsp;&nbsp;
									Basic Certification with Census Information<BR>
									<INPUT TYPE="checkbox" NAME="Life" >&nbsp;&nbsp;
									Life of Loan Certification<BR>
									<INPUT TYPE="checkbox" NAME="LifeCensus" >&nbsp;&nbsp;
									Life of Loan Certification with Census Information<BR>
								</td>

							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Flood ClientID
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="FclientID" VALUE="" size=30 maxlength=50
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Flood ProviderID
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="FproID" VALUE="" size=30 maxlength=50
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
										clear: none; ">
								</td>
							</tr>

							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Credit Product
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6 >
								    <font size=1 color=blue face=arial>
									<INPUT TYPE="checkbox" NAME="Infile" >&nbsp;&nbsp;
									Infile Report<BR>
									<INPUT TYPE="checkbox" NAME="Reissue" >&nbsp;&nbsp;
									Re-Issue<BR>
									<INPUT TYPE="checkbox" NAME="Safe" >&nbsp;&nbsp;
									SAFE (1 Bureau In File)<BR>
								</td>

							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Credit ClientID
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="CRclientID" VALUE="" size=30 maxlength=50
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
										clear: none; ">
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Credit ProviderID
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="CRproID" VALUE="" size=30 maxlength=50
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
										clear: none; ">
								</td>
							</tr>




							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Allow Substitution Rates
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<Input type="radio" Name="allow_subrates" Value="1">Yes&nbsp;&nbsp;&nbsp;<Input type="radio" Name="allow_subrates" Value="0" checked>No
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Allow Reissue Rates
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<Input type="radio" Name="allow_reissue_rates" Value="1">Yes&nbsp;&nbsp;&nbsp;<Input type="radio" Name="allow_reissue_rates" Value="0" checked>No
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Allow Chicago Bucket Rates
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<Input type="radio" Name="allow_chicago_rates" Value="1">Yes&nbsp;&nbsp;&nbsp;<Input type="radio" Name="allow_chicago_rates" Value="0" checked>No
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Allow Chicago LOCAL Rates
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<Input type="radio" Name="allow_chicago_rates2" Value="1">Yes&nbsp;&nbsp;&nbsp;<Input type="radio" Name="allow_chicago_rates2" Value="0" checked>No
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Chase Acct
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<Input type="radio" Name="chase_acct" Value="1">Yes&nbsp;&nbsp;&nbsp;<Input type="radio" Name="chase_acct" Value="0" checked>No
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Streamline Client
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<Input type="radio" Name="streamline_client" Value="1">Yes&nbsp;&nbsp;&nbsp;<Input type="radio" Name="streamline_client" Value="0" checked>No
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Fairfax Client
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<Input type="radio" Name="fairfax_client" Value="1">Yes&nbsp;&nbsp;&nbsp;<Input type="radio" Name="fairfax_client" Value="0" checked>No
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Attach ICL
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<Input type="radio" Name="attach_icl" Value="1">Yes&nbsp;&nbsp;&nbsp;<Input type="radio" Name="attach_icl" Value="0" checked>No
								</td>
							</tr>
							<tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Attach E & O
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<Input type="radio" Name="attach_eando" Value="1">Yes&nbsp;&nbsp;&nbsp;<Input type="radio" Name="attach_eando" Value="0" checked>No
								</td>
							</tr>


							<tr>

								<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
									<NOBR><A HREF="JAVASCRIPT:history.back()"><IMG SRC="./images/button_back.gif"  BORDER=0></A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFIF #read_company.recordcount# EQ "0"><INPUT TYPE=image src="./images/button_submit.gif" border=0 onclick="return validate_form();"></CFIF></NOBR>
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

</CFFORM>
</CFIF>