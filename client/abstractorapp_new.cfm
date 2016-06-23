<CFPARAM NAME="a_trigger" DEFAULT="0">


<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>


		<CFSET a_states_list = ArrayNew(1)>
		<CFSET a_count = "1">

		<CFOUTPUT QUERY="read_state_list">
			<CFSET a_states_list[a_count] = #st_abbrev#>
			<CFSET a_count = #a_count# + "1">

		</CFOUTPUT>

			<CFSET a_state_cty_list = ArrayNew(2)>
			<CFSET a_county_count = ArrayNew(1)>

		<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="TTT">

			<CFQUERY datasource="#request.dsn#" NAME="read_state_cty_list">

				SELECT DISTINCT COUNTY
				FROM zip_info
				WHERE state = '#a_states_list[TTT]#'
				ORDER BY county ASC

			</CFQUERY>

				<CFSET b_count = "1">

				<CFOUTPUT QUERY="read_state_cty_list">
					<CFSET a_state_cty_list[TTT][b_count] = #county#>

					<CFSET b_count = #b_count# + "1">
				</CFOUTPUT>

				<CFSET a_county_count[TTT] = #b_count# - "1">

		</CFLOOP>
<cfinclude template="vendorheader.cfm">



<table cellpadding="0" cellspacing="0" border="0" width="780">


	<tr>
		<td  style="vertical-align:top" width="160">
		<table cellpadding="1" cellspacing="1" border="0" width="160">
	   <tr> <td width="189" ALIGN = "CENTER" valign="top"><font face="Arial, Helvetica, sans-serif" size="2"><b>BECOME A VENDOR</b></font></td></tr>

	 <tr> <td width="89"  onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/titlevendor_new.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/titlevendor_new.cfm"><nobr>Abstractor/Title Info</nobr></font></a></td></tr>

         <tr> <td width="89" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/attorneyagent_new.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/attorneyagent_new.cfm"><nobr>Attorney Closing Agent</nobr></font></a></td></tr>
			         <tr> <td width="89" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/titleagent_new.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/titleagent_new.cfm"><nobr>Title Closing Agent</nobr></font></a></td></tr>
			<tr> <td width="89"  onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/closeagent_new.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/closeagent_new.cfm"><nobr>Notary Closing Agent</nobr></font></a></td></tr>
         <tr> <td width="89" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/appraisalvendor_new.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/appraisalvendor_new.cfm"><nobr>Appraiser</nobr></font></a></td></tr>
         <tr> <td width="89" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/floodvendor_new.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/floodvendor_new.cfm"><nobr>Flood Vendor</nobr></font></a></td></tr>
			 <tr> <td width="89" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/creditvendor_new.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/creditvendor_new.cfm"><nobr>Credit Vendor</nobr></font></a></td></tr>
         <tr> <td width="89" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/avmvendor_new.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/avmvendor_new.cfm"><nobr>AVM Vendor</nobr></font></a></td></tr>



			 </table>

		</td>
		<td bgcolor="FFFFFF" valign="top">
			<!---- body text starts ----->

     <CFFORM NAME="frm"  ACTION="https://#cgi.server_name#/client/abstractorappsubmit.cfm?a_trigger=1" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" method="post">
      <table width="57%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

  <tr>



				    <td>

					<table cellspacing="1" cellpadding="2" class="forms" border="1" >
						<tr>
							<td class="head2" align = "center" colspan="6"><div class="head2"><b>ABSTRACT VENDOR APPLICATION</b></div></td>
						</tr>
						             <TR>
                            <TD class=head3 width="250">Company/Firm Name:</TD>
                            <TD class=data >
                             <cfINPUT TYPE="Text" NAME="company" SIZE=20 MAXLENGTH=45
									REQUIRED="yes" Message="You must enter the company or firm name"
									 >
                              </TD>
				</tr><tr>
                            <TD class=head3> E-Mail:</TD>
                            <TD class=data
colSpan=2>
                               <cfINPUT TYPE="Text" NAME="email" SIZE=11 MAXLENGTH=45
									REQUIRED="yes" Message="You must enter an email address"
									 >
                              </TD>
                          </TR>

                          <TR>
                            <TD class=head3> <DIV class=head3>Contact First Name:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                              <cfINPUT TYPE="Text" NAME="fname" SIZE=11 MAXLENGTH=45
									REQUIRED="yes" Message="You must enter your first name"
									 >
				</tr><tr>
			<TD class=head3> <DIV class=head3>Contact Last Name:</DIV></TD>
                            <TD class=data colSpan=5>
				 <cfINPUT TYPE="Text" NAME="lname" SIZE=11 MAXLENGTH=45
									REQUIRED="yes" Message="You must enter your last name"
									 >
                              </DIV></TD>
                          </TR>


						<tr>
							<td class="head3" colspan="6"><div class="head3"><strong>Physical Address:</strong></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Street Address:</div></td>
							<td  class="data"><div class="data"><input class="form" type="text" size="30" name="addr1"/></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">City:</div></td>
							<td  class="data"><div class="data"><input class="form" type="text" size="30" name="city"/></td>
						</tr>

					<tr>
					<td class="head3"><div class="head3">State:</div></td>

					<td colspan="1" class="data"><div class="data"><select name="State" onchange="null" class="form">
					<option value="" selected></option>
					<option value="AK">AK</option>
					<option value="AL">AL</option>
					<option value="AR">AR</option>
					<option value="AZ">AZ</option>
					<option value="CA">CA</option>
					<option value="CO">CO</option>
					<option value="CT">CT</option>
					<option value="DC">DC</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="GU">GU</option>
					<option value="HI">HI</option>
					<option value="IA">IA</option>
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="MA">MA</option>
					<option value="MD">MD</option>
					<option value="ME">ME</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MO">MO</option>
					<option value="MS">MS</option>
					<option value="MT">MT</option>
					<option value="NC">NC</option>
					<option value="ND">ND</option>
					<option value="NE">NE</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>
					<option value="NV">NV</option>
					<option value="NY">NY</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="PR">PR</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VA">VA</option>
					<option value="VI">VI</option>
					<option value="VT">VT</option>
					<option value="WA">WA</option>
					<option value="WI">WI</option>
					<option value="WV">WV</option>
					<option value="WY">WY</option>
				</select></div></td>
				</tr><tr>			<td class="head3" colspan="1"><div class="head3">ZipCode:</div></td>

							<td colspan="1" class="data"><div class="data"><input class="form" type="text" size="5" maxlength="5" name="Zip_Code"/></div></td>
						</tr>


						<tr>
							<td class="head3" colspan="6"><div class="head3"><strong>Mailing Address:</strong></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Street Address:</div></td>
							<td  class="data"><div class="data"><input class="form" type="text" size="30" name="addr2"/></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">City:</div></td>
							<td  class="data"><div class="data"><input class="form" type="text" size="30" name="city2"/></td>
						</tr>

					<tr>
					<td class="head3"><div class="head3">State:</div></td>

					<td colspan="1" class="data"><div class="data"><select name="State2" onchange="null" class="form">
					<option value="" selected></option>
					<option value="AK">AK</option>
					<option value="AL">AL</option>
					<option value="AR">AR</option>
					<option value="AZ">AZ</option>
					<option value="CA">CA</option>
					<option value="CO">CO</option>
					<option value="CT">CT</option>
					<option value="DC">DC</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="GU">GU</option>
					<option value="HI">HI</option>
					<option value="IA">IA</option>
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="MA">MA</option>
					<option value="MD">MD</option>
					<option value="ME">ME</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MO">MO</option>
					<option value="MS">MS</option>
					<option value="MT">MT</option>
					<option value="NC">NC</option>
					<option value="ND">ND</option>
					<option value="NE">NE</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>
					<option value="NV">NV</option>
					<option value="NY">NY</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="PR">PR</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VA">VA</option>
					<option value="VI">VI</option>
					<option value="VT">VT</option>
					<option value="WA">WA</option>
					<option value="WI">WI</option>
					<option value="WV">WV</option>
					<option value="WY">WY</option>
				</select></div></td>
				</tr><tr>			<td class="head3" colspan="1"><div class="head3">ZipCode:</div></td>

							<td colspan="1" class="data"><div class="data"><input class="form" type="text" size="5" maxlength="5" name="Zip_Code2"/></div></td>
						</tr>




						<tr>
							<td class="head3" colspan="6"><div class="head3"><strong>Previous Address:</strong></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Street Address:</div></td>
							<td  class="data"><div class="data"><input class="form" type="text" size="30" name="previousaddress"/></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">City:</div></td>
							<td  class="data"><div class="data"><input class="form" type="text" size="30" name="previouscity"/></td>
						</tr>

					<tr>
					<td class="head3" ><div class="head3">State:</div></td>

					<td colspan="1" class="data"><div class="data"><select name="PreviousState" onchange="null" class="form">
					<option value="" selected></option>
					<option value="AK">AK</option>
					<option value="AL">AL</option>
					<option value="AR">AR</option>
					<option value="AZ">AZ</option>
					<option value="CA">CA</option>
					<option value="CO">CO</option>
					<option value="CT">CT</option>
					<option value="DC">DC</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="GU">GU</option>
					<option value="HI">HI</option>
					<option value="IA">IA</option>
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="MA">MA</option>
					<option value="MD">MD</option>
					<option value="ME">ME</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MO">MO</option>
					<option value="MS">MS</option>
					<option value="MT">MT</option>
					<option value="NC">NC</option>
					<option value="ND">ND</option>
					<option value="NE">NE</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>
					<option value="NV">NV</option>
					<option value="NY">NY</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="PR">PR</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VA">VA</option>
					<option value="VI">VI</option>
					<option value="VT">VT</option>
					<option value="WA">WA</option>
					<option value="WI">WI</option>
					<option value="WV">WV</option>
					<option value="WY">WY</option>
				</select></div></td>
				</tr><tr>			<td class="head3" colspan="1"><div class="head3">ZipCode:</div></td>

							<td colspan="1" class="data"><div class="data"><input class="form" type="text" size="5" maxlength="5" name="PreviousZipCode"/></div></td>
						</tr>



						<tr>
							<td class="head3"><div class="head3">How Long? (if less than 2 years at current)</div></td>
							<td class="data"><div class="data"><input class="form" type="text" size="30" maxlength="50" name="AddressHowLong"/></div></td>
						</tr>
						</table><table cellspacing="1" cellpadding="2" class="forms" border="1" >
						<tr>
							<td class="head2" colspan="6"><div class="head2"><strong>Telephone Numbers</strong></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Office No:</div>
							</td><td nowrap>
							<div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhonePrimary1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhonePrimary2)">-<input class="form" type="text" size="3" maxlength="3" name="PhonePrimary2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhonePrimary3)">-<input class="form" type="text" size="4" maxlength="4" name="PhonePrimary3" onKeyDown="TabNext(this,'down',4)" onKeyUp="TabNext(this,'up',4,this.form.PhonePrimaryExt)"> <input class="form" type="text" size="5" maxlength="5" name="PhonePrimaryExt">
							</div></td>
							</tr><tr>
							<td class="head3"><div class="head3">Home No:</div>
							</td><td nowrap>
							<div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhoneHome1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneHome2)">-<input class="form" type="text" size="3" maxlength="3" name="PhoneHome2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneHome3)">-<input class="form" type="text" size="4" maxlength="4" name="PhoneHome3">
							</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Courthouse No:</div>
							</td><td nowrap><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhoneOther1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneOther2)">-<input class="form" type="text" size="3" maxlength="3" name="PhoneOther2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneOther3)">-<input class="form" type="text" size="4" maxlength="4" name="PhoneOther3">
							</div></td></tr><tr>
							<td class="head3"><div class="head3">Cell No:</div>
							</td><td nowrap><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhoneCell1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneCell2)">-<input class="form" type="text" size="3" maxlength="3" name="PhoneCell2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneCell3)">-<input class="form" type="text" size="4" maxlength="4" name="PhoneCell3">
							</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Pager No:</div></td><td nowrap><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhonePager1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhonePager2)">-<input class="form" type="text" size="3" maxlength="3" name="PhonePager2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhonePager3)">-<input class="form" type="text" size="4" maxlength="4" name="PhonePager3">
							</div></td></tr><tr>
							<td class="head3"><div class="head3">Fax No:</div></td><td nowrap><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhoneFax1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneFax2)">-<input class="form" type="text" size="3" maxlength="3" name="PhoneFax2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneFax3)">-<input class="form" type="text" size="4" maxlength="4" name="PhoneFax3">
							</div></td>
						</tr></table><table cellspacing="1" cellpadding="2" class="forms" border="1" >

								<tr>
							<td class="head3" colspan="4"><div class="head3">Method by which you wish to receive your abstract report request</div></td>
							</tr><tr><td>&nbsp;</td>
							<td class="data"><div class="data2"><input class="form" type="radio" name="pref_for_send" value="Email"/ checked>Email&nbsp;<input class="form" type="radio" name="pref_for_send" value="Fax"/>Fax</div></td>
						</tr>
						<tr>
							<td class="head2" colspan="6"><div class="head2"><strong>Qualifications</strong></div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">If your company is organized, what type?</div></td>
							<td class="data"><div class="data2"><select name="PreviousState" onchange="null">
					<option value="" selected></option>
					<option value="corporation">Corporation</option>
					<option value="Sole Prop">Sole Prop</option>
					<option value="other">other</option>


				</select></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3"><font color="red"></font>Fed Tax ID:</div></td>
							<td  class="data" nowrap><div class="data">
								<input class="form" type="text" size="2" maxlength="2" name="FedTaxId1" onKeyDown="TabNext(this,'down',2)" onKeyUp="TabNext(this,'up',2,this.form.FedTaxId2)"><input class="form" type="text" size="7" maxlength="7" name="FedTaxId2">
							</div></td>
						</tr><tr>
							<td class="head3"><div class="head3"><font color="red"></font>SSN:</div></td>
							<td  class="data" nowrap><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="SSN1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.SSN2)"><input class="form" type="text" size="2" maxlength="2" name="SSN2" onKeyDown="TabNext(this,'down',2)" onKeyUp="TabNext(this,'up',2,this.form.SSN3)"><input class="form" type="text" size="4" maxlength="4" name="SSN3">
							</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">Are you currently carrying Errors & Omissions insurance on your work?</div></td>
							</tr><tr><td>&nbsp;</td>
							<td class="data"><div class="data2"><input class="form" type="radio" name="EOInsurance" value="Yes"/>Yes&nbsp;<input class="form" type="radio" name="EOInsurance" value="No"/>No</div></td>
						</tr>
						<tr>
							<td  class="head3"><div class="head3">If yes, with which Company:</div></td>
							<td  class="data"><div class="data"><input class="form" type="text" size="30" maxlength="50" name="EOCompany"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Amount of Coverage:</div></td>
							<td colspan="5" class="data"><div class="data"><input class="form" type="text" size="20" maxlength="20" name="EOAmount"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Expiration date:</div></td>
							<td colspan="5" class="data"><div class="data"><input class="form" type="text" size="20" maxlength="20" name="EOExpireDate"/></div></td>
						</tr>

						<tr>
							<td class="head2" colspan="6"><div class="head2"><strong>Service Area</strong></div></td>
						</tr>
						<tr>
							<td colspan="2" class="head3"><div class="head3">List all counties where you feel qualified to complete title searches.</div></td>
							<td colspan="4" class="data"><div class="data">
							   <SELECT NAME="zip_id" MULTIPLE
					size="6"
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

					<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="DDD">
						<CFSET a_trigger = "1">

						<CFLOOP FROM="1" TO="#a_county_count[DDD]#" INDEX="RRR">
							<cfoutput>
								<OPTION VALUE="#a_states_list[DDD]#|#a_state_cty_list[DDD][RRR]#">#a_states_list[DDD]# --- #a_state_cty_list[DDD][RRR]#</OPTION>
							</CFOUTPUT>
						</CFLOOP>
					</CFLOOP>	</SELECT>

							</div></td>
						</tr>
						<tr>
							<td class="head2" colspan="6"><div class="head2"><strong>References</strong></div></td>
						</tr>
						<tr>
							<td colspan="6" class="text"><div class="text">To summarize your experience, list two clients and or employers which you have performed Searches for and may be contacted by our Vendor Management. Please make certain that your reference information is correct.</div></td>
						</tr>
						<tr>
							<td class="head3" colspan="6"><div class="head4">Reference 1</div></td></tr>
						<tr>
							<td class="head3"><div class="head3">Company Name and Address</div></td>
							<td colspan="3" class="data"><div class="data"><input class="form" type="text" size="30" name="RefCo1"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Contact/Title</div></td>
							<td colspan="3" class="data"><div class="data"><input class="form" type="text" size="30" name="RefContact1"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Type of Business</div></td>
							<td colspan="3" class="data"><div class="data"><input class="form" type="text" size="30" name="RefBusinessType1"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Phone Number</div></td>
							<td colspan="3" class="data" nowrap><div class="data">
						 		<input class="form" type="text" size="3" maxlength="3" name="Ref1Phone1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.Ref1Phone2)">-<input class="form" type="text" size="3" maxlength="3" name="Ref1Phone2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.Ref1Phone3)">-<input class="form" type="text" size="4" maxlength="4" name="Ref1Phone3" onKeyDown="TabNext(this,'down',4)" onKeyUp="TabNext(this,'up',4,this.form.Ref1PhoneExt)"> ext-<input class="form" type="text" size="5" maxlength="5" name="Ref1PhoneExt">
							</div></td>
						</tr>
						<tr>
							<td class="head3" colspan="6"><div class="head4">Reference 2</div></td></tr>
						<tr>
							<td class="head3"><div class="head3">Company Name and Address</div></td>
							<td colspan="3" class="data"><div class="data"><input class="form" type="text" size="30" name="RefCo2"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Contact/Title</div></td>
							<td colspan="3" class="data"><div class="data"><input class="form" type="text" size="30" name="RefContact2"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Type of Business</div></td>
							<td colspan="3" class="data"><div class="data"><input class="form" type="text" size="30" name="RefBusinessType2"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Phone Number</div></td>
							<td colspan="3" class="data"nowrap><div class="data">
						 		<input class="form" type="text" size="3" maxlength="3" name="Ref2Phone1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.Ref2Phone2)">-<input class="form" type="text" size="3" maxlength="3" name="Ref2Phone2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.Ref2Phone3)">-<input class="form" type="text" size="4" maxlength="4" name="Ref2Phone3" onKeyDown="TabNext(this,'down',4)" onKeyUp="TabNext(this,'up',4,this.form.Ref2PhoneExt)"> ext-<input class="form" type="text" size="5" maxlength="5" name="Ref2PhoneExt">
							</div></td>
						</tr></table><table cellspacing="1" cellpadding="2" class="forms" border="1" >

						<tr>
							<td class="head2" colspan="6"><div class="head2"><strong>Fee Schedule/Turn Times</strong></div></td>
						</tr>
						<tr>
							<td colspan="6" class="text"><div class="text">Please indicate the fees you will charge along with your turn time for the following services:</div></td>
						</tr>
						<tr>

							<td class="data">Current O+E&</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="oe1"/></div></td>

						</tr>
						<tr>

							<td class="data">Turn Time</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="pricetime1"/></div></td>

						</tr>
						<tr>

							<td class="data">Mortgage Search</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="mort"/></div></td>

						</tr>
						<tr>

							<td class="data">Turn Time</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="pricetime2"/></div></td>

						</tr>

						<tr>

							<td class="data">O+E to 1</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="acost"/></div></td>

						</tr>

						<tr>

							<td class="data">Turn Time</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="pricetime3"/></div></td>

						</tr>
						<tr>

							<td class="data">Judgement Search</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="hudge"/></div></td>

						</tr>
						<tr>

							<td class="data">Turn Time</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="pricetime4"/></div></td>

						</tr>
						<tr>

							<td class="data">O+E to 2</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="oe2"/></div></td>

						</tr>
						<tr>

							<td class="data">Turn Time</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="pricetime5"/></div></td>

						</tr>
						<tr>

							<td class="data">Recording</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="rec"/></div></td>

						</tr>
						<tr>

							<td class="data">Turn Time</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="pricetime6"/></div></td>

						</tr>
						<tr>

							<td class="data">Deed Only</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="deedonly"/></div></td>

						</tr>
						<tr>

							<td class="data">Turn Time</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="pricetime7"/></div></td>

						</tr>
						<tr>

							<td class="data">Recording With Title</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="rec_update"/></div></td>

						</tr>
						<tr>

							<td class="data">Turn Time</td><td><div class="data"><input class="form" type="text" size="10" maxlength="20" name="pricetime8"/></div></td>

						</tr>

						<tr>
							<td class="head3" align = "left" colspan="6"><div class="form_button">
								<input class="form" type="hidden" name="form" value="True"/>
								<input class="form" type="hidden" name="_form_refurl" value="/work/abstractor.html"/>
								<input class="form" type="hidden" name="_form_emailsubject" value="Abstractor application"/>
								<input class="form" type="hidden" name="_form_template" value="ABSTRACTORFORM_TEMPLATE"/>
								<input class="form" type="hidden" name="_form_emailto" value="jmiller@gac.com,smcnamara@gac.com"/>
								<input class="form" type="hidden" name="_form_action" value="email"/>
						** O & E - Ownership & Encumbrance Search&nbsp;&nbsp;&nbsp;<br><input class="button" type="submit" value="Submit Form"/>
							</div></td>
						</tr>
					</table>


			</td>
        </tr>

      </table>
			  </td>
        </tr>

      </table>
			<!---- body text ends ----->
		</cfform>


<cfinclude template="vendorfooter.cfm">