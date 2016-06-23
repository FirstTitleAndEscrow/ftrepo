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

<cfinclude template="vendorHeader.cfm">


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

       <table width="57%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
   	<cfFORM METHOD=POST ACTION="https://<cfoutput>#cgi.server_name#</cfoutput>/client/appraiserappsubmit.cfm?a_trigger=1">
  <tr>

    <td>

					<table cellspacing="1" cellpadding="2" class="forms" border="1" >
						<tr>
							<td class="head2" align = "center" colspan="6"><div class="head2"><b>APPRAISER APPLICATION</b></div></td>
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
							<td  class="data"><div class="data"><input class="form" type="text" size="30" name="Mailaddress"/></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">City:</div></td>
							<td  class="data"><div class="data"><input class="form" type="text" size="30" name="mailcity"/></td>
						</tr>

					<tr>
					<td class="head3"><div class="head3">State:</div></td>

					<td colspan="1" class="data"><div class="data"><select name="mailState" onchange="null" class="form">
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

							<td colspan="1" class="data"><div class="data"><input class="form" type="text" size="5" maxlength="5" name="mailZipCode"/></div></td>
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
							<td class="head3"><div class="head3">Other No:</div>
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

                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2><strong>Qualifications</strong></DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=2> <DIV class=head3>Are you
                                incorporated?</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data2>
                                <INPUT class=form type=radio value= "Yes" name = "Incorporated">
                                Yes&nbsp;
                                <INPUT class=form type=radio value="No" name = "Incorporated">
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=2> <DIV class=head3>Are you
                                licensed?</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=Licensed>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=Licensed>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=2> <DIV class=head3>Are you
                                certified?</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=Certified>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=Certified>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=2> <DIV class=head3>Are you
                                a HUD approved appraiser?</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=Approved>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=Approved>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD colSpan=2 class=head3> <DIV class=head3><FONT color=red></FONT>Fed
                                Tax ID:</td><td>

                                <INPUT class=form
                  onkeydown="TabNext(this,'down',2)"
                  onkeyup="TabNext(this,'up',2,this.form.FedTaxId2)" maxLength=2
                  size=2 name=FedTaxId1>
                                <INPUT class=form maxLength=7 size=7
                  name=FedTaxId2>
                              </DIV></TD></tr><tr>
                            <TD colSpan=2 class=head3> <DIV class=head3><FONT color=red></FONT>SSN:
                           </td><td>
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.SSN2)" maxLength=3
                  size=3 name=SSN1>
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',2)"
                  onkeyup="TabNext(this,'up',2,this.form.SSN3)" maxLength=2
                  size=2 name=SSN2>
                                <INPUT class=form maxLength=4 size=4
                  name=SSN3>
                              </DIV></TD>
                          </TR>
                   <TR>
                            <TD colspan = 2> License/Certification
                                Number:</td><td>
                                <INPUT class=form
                  name=LicenseCertification>
                              </TD></tr><tr>
                            <TD colspan = 2>Expiration: (MM/DD/YY)</td><td>
                                <INPUT class=form
              name=ExpirationDate>
                              </TD>
                          </TR>
                          <TR>
                            <TD class=head3 colspan="2"> <DIV class=head3>Type of License:</DIV></TD>
                            <TD class=data> <DIV class=data>
                                <INPUT class=form size=30
                  name=TypeOfLicense>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Have
                                you ever had any Real Estate License suspended,restricted
                                or revoked OR have you ever been convicted of
                                a felony or any public offense having as one of
                                its elements a fraudulent or dishonest act?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value = "Yes" name = "Suspended">
                                Yes&nbsp;
                                <INPUT class=form type=radio value = "No" name = "Suspended">
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>If yes, please furnish
                                details:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <TEXTAREA name=furnishDetailofSuspended rows=4 cols=35></TEXTAREA>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                currently carrying Errors &amp; Omissions insurance
                                on your work?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value = "Yes" name = "EOInsuranceAppraiser">
                                Yes&nbsp;
                                <INPUT class=form type=radio value = "No" name = "EOInsuranceAppraiser">
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>If yes, with which
                                Company:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                                <INPUT class=form size=30
                name=EOCompany>
                              </DIV></TD></tr><tr>
                            <TD class=head3> <DIV class=head3>Policy Limit:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                                <INPUT class=form size=8
                  name=EOPolicyLimit>
                              </DIV></TD>
                          </TR>
                      <TR>
                            <TD colspan = 2> Policy Number:</td><td>
                                <INPUT class=form name=EOPolicyNo>
                              </TD></tr><tr>
                            <TD colspan = 2> Expiration: (MM/DD/YY)</td><td>

                                <INPUT class=form
                  name=PolicyExpirationDate>
                              </TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2><strong>Appraisal
                                Service Areas</strong></DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>List all
                                counties where can complete
                                appraisal assignments.</DIV></TD>
                          </TR>
                          <TR>

                            <TD class=data colSpan=6> <DIV class=data>
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
                              </DIV> Choose area or area(s) from select box to pick multiple counties, use curser and hold down "ctrl" key</TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Is there
                                any section of your service area that does not
                                have access to MLS?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=AccessMLS>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=AccessMLS>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>If so, what areas?:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                name=MLSarea>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2><strong>Prior
                                Employment</strong></DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>Beginning
                                with your present position, list all employment
                                related to appraising in reverse chronological
                                order for the last 5 years:</DIV></TD>
                          </TR>
                          <!--***** Employer 1 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Employer
                                1</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year From:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrFrom1>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year To:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrTo1>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Name and Address
                                of Employer</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <TEXTAREA name=PriorNameAddressFrom1 rows=3 cols=35></TEXTAREA>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>% of Time Devoted
                                to Appraising</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  name=PriorDevotedtoAppraisingFrom1>
                              </DIV></TD>
                          </TR>
                          <!--***** Employer 2 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Employer
                                2</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year From:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrFrom2>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year To:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrTo2>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Name and Address
                                of Employer</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <TEXTAREA name=PriorNameAddressFrom2 rows=3 cols=35></TEXTAREA>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>% of Time Devoted
                                to Appraising</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  name=PriorDevotedtoAppraisingFrom2>
                              </DIV></TD>
                          </TR>
                          <!--***** Employer 3 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Employer
                                3</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year From:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrFrom3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year To:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrTo3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Name and Address
                                of Employer</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <TEXTAREA name=PriorNameAddressFrom3 rows=3 cols=35></TEXTAREA>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>% of Time Devoted
                                to Appraising</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  name=PriorDevotedtoAppraisingFrom3>
                              </DIV></TD>
                          </TR>

                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>References</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>List three
                                clients and/or employers which
                                have accepted your appraisal reports, and may
                                be contacted by our Vendor management department.
                               </DIV></TD>
                          </TR>
                          <!--***** Reference 1 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Reference
                                1</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Company Name and
                                Address</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefCompanyName1>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Contact/Title</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefContact1>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Type of Business</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefBusinessType1>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Phone Number</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref1Phone2)"
                  maxLength=3 size=3 name=Ref1Phone1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref1Phone3)"
                  maxLength=3 size=3 name=Ref1Phone2>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',4)"
                  onkeyup="TabNext(this,'up',4,this.form.Ref1PhoneExt)"
                  maxLength=4 size=4 name=Ref1Phone3>
                                ext-
                                <INPUT class=form
                  maxLength=5 size=5 name=Ref1PhoneExt>
                              </DIV></TD>
                          </TR>
                          <!--***** Reference 2 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Reference
                                2</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Company Name and
                                Address</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefCompanyName2>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Contact/Title</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefContact2>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Type of Business</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefBusinessType2>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Phone Number</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref2Phone2)"
                  maxLength=3 size=3 name=Ref2Phone1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref2Phone3)"
                  maxLength=3 size=3 name=Ref2Phone2>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',4)"
                  onkeyup="TabNext(this,'up',4,this.form.Ref2PhoneExt)"
                  maxLength=4 size=4 name=Ref2Phone3>
                                ext-
                                <INPUT class=form
                  maxLength=5 size=5 name=Ref2PhoneExt>
                              </DIV></TD>
                          </TR>
                          <!--***** Reference 3 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Reference
                                3</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Company Name and
                                Address</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefCompanyName3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Contact/Title</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefContact3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Type of Business</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefBusinessType3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Phone Number</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref3Phone2)"
                  maxLength=3 size=3 name=Ref3Phone1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref3Phone3)"
                  maxLength=3 size=3 name=Ref3Phone2>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',4)"
                  onkeyup="TabNext(this,'up',4,this.form.Ref3PhoneExt)"
                  maxLength=4 size=4 name=Ref3Phone3>
                                ext-
                                <INPUT class=form
                  maxLength=5 size=5 name=Ref3PhoneExt>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Software</DIV></TD>
                          </TR>
                        <TR>
                            <TD class=head3 colSpan=2> <DIV class=head3>
							Type of appraisal software</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <SELECT onchange=null name=AppraiserSoftware>
                                  <OPTION value=WinTotal selected>A La Mode -
                                  WinTotal</OPTION>
                                 <OPTION value=HighPerForm>United Systems - HighPerForm</OPTION>

                                     <OPTION value="ACI Collection">Polaroid Digital
                                  Solutions - ACI Collection</OPTION>
								  <OPTION
                    value=AppraisalWorks>Day One - AppraisalWorks</OPTION>
					 <OPTION value="Appraiser's Tool">Bradford Technologies
                                  - Appraiser's Toolbox</OPTION>
                                 <OPTION
                    value=Nova>Day One - Nova</OPTION>

                                  <OPTION
                    value=Other>Other</OPTION>
                                </SELECT>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>If other,
                                please describe</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=AppOtherSoftware>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2><b>Fee Schedule</b></DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Single
                                Family Residential:</B> (Please list fees for
                                a 1004 form and the 2055 form) This appraisal
                                is for a second mortage or equity Line,it meets
                                FNMA requirements &amp; FIRREA regulations, however,
                                along with the 1004/2055 we only require an exterior
                                perimeter sketch and a location map. We don't
                                require deed copies or plat maps. Any addenda
                                are kept to a minimum(whatever is an absolute
                                necessity).</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>1004/1073 Form:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                name=Form1004>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>2055 Exterior Form:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=ExteriorForm2055>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>2055 Interior Form:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=InteriorForm2055>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>External
                                Foreclosure:</B> This appraisal is used when the
                                appraiser is unable to gain access to a property
                                being foreclosed upon. It will require the ERC
                                listing grid as above. Also requires External
                                Foreclosure Addendum(available upon request) as
                                well as original photos as specified above.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>704 Form:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                name=Form704>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Reinspection
                                or Final Inspection:</B> Reinspection is used
                                when there was a cost to cure on the original
                                appraisal or when the appraisal was completed
                                "subject to" and the lender wants to be sure that
                                the work was completed. Final Inspection is used
                                when the original appraisal was completed on a
                                property that was under construction with the
                                use of plans and specifications and is now complete
                                and needs final inspection.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Reinspection or
                                Final Inspection:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=ReFinalInspection>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Recertification:</B>
                                Recertifications are used if an appraisal was
                                completed less than 6 months prior on the property
                                and the homeowner wants additional funds. The
                                appraiser will recertify the value.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Recertification:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=Recertification>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Final
                                Inspection:</B> (Form 442)</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Form 442:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                name=Form442>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Field
                                Review:</B> (FNMA 2000) <cfoutput>#session.site.short_name#</cfoutput> uses field reviews
                                primarily for quality control purposes. The appraiser
                                will receive as much of the original appraisal
                                as we have available.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>FNMA 2000:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                name=FNMA2000>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Multi Family: (1025
                                Form):</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=FormMulti1025>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>FHA/HUD Appraisal
                                URAR: (1004 Form):</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=FormFHAAppraisal1004>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Desktop:</B>
                                (FNMA 2006) The appraiser will receive as much
                                of the original appraisal as available.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>FNMA 2006:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                name=FNMA2006>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>On occasion,
                                we will ask for a report without requiring comp
                                photos. If this situation occurs would your fee
                                differ? If yes, list the amount to be deducted
                                from each product type when comp photos are not
                                required.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Amount deducted:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=AmountDeducted>
                              </DIV></TD>
                          </TR>

                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2><b>Licensing
                                &amp; Insurance Information</b></DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><b>Please Fax
                                a copy of state appraiser license(s) or certificate(s).
                                Also attach a copy of the declaration page of
                                your E &amp; O insurance. Please Fax to: 1-301-315-8161</b></DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Statement</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>The foregoing
                                application has been completed by me to induce
                                <cfoutput>#session.site.short_name#</cfoutput> to approve me as
                                a Real Estate Property Appraiser. I hereby certify
                                that the answers and statements given herein are
                                true and correct to the best of my knowledge and
                                belief. In connection with my applicaiton, I understand
                                that my references and/or previous employers will
                                be contacted.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 align = "right" colSpan=6> <DIV class=form_button>
                                <INPUT class=form type=hidden
                  value=True name=form>
                                <INPUT class=form type=hidden
                  value=/work/appraiser.html name=_form_refurl>
                                <INPUT
                  class=form type=hidden value="Appraiser application"
                  name=_form_emailsubject>
                                <INPUT class=form type=hidden
                  value=APPRAISERFORM_TEMPLATE name=_form_template>
                                <INPUT
                  class=form type=hidden value=jmiller@gac.com,nrivers@gac.com
                  name=_form_emailto>
                                <INPUT class=form type=hidden value=email
                  name=_form_action>
                                <INPUT class=button type=submit value="Submit Form">
                              </DIV></TD>
                          </TR>
                        </TBODY>
                      </TABLE>



			  </td>
        </tr>

    </cfform>
	  </table>
	</td></tr></table>
			<!---- body text ends ----->
<cfinclude template="vendorfooter.cfm">