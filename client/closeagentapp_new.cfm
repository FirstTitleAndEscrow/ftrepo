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
			<CFFORM NAME="frm"  ACTION="https://#cgi.server_name#/client/closeagentappsubmit.cfm?a_trigger=1" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>

      <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

  <tr>

    <td  >

					<table cellspacing="1" cellpadding="2" class="forms" border="1" >
						<tr>
							<td class="head2" align = "center" colspan="6"><div class="head2"><b>ATTORNEY AGENT APPLICATION</b></div></td>
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
                            <TD class=head3 colSpan=3> <DIV class=head3>Method by which you wish to receive your abstract report request</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                            <div class="data2"><input class="form" type="radio" name="spref" value="Email"/ checked>Email&nbsp;<input class="form" type="radio" name="spref" value="Fax"/>Fax</div></TD>
                          </TR>
						  <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Do you have internet access if document download is required?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=InternetAccess>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=InternetAccess>
                                No</DIV></TD>
                          </TR>
						    <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Can you
                                accept a loan package via email?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=ViaEmail2>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=ViaEmail2>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2><strong>Qualifications</strong></DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3><FONT color=red></FONT>Fed
                                Tax ID:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',2)"
                  onkeyup="TabNext(this,'up',2,this.form.FedTaxId2)" maxLength=2
                  size=2 name=FedTaxId1>
                                <INPUT class=form maxLength=7 size=7
                  name=FedTaxId2>
                              </DIV></TD>
		</tr><tr>
                            <TD class=head3> <DIV class=head3><FONT color=red></FONT>SSN:</DIV></TD>
                            <TD class=data
colSpan=2> <DIV class=data>
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
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                currently carrying Errors &amp; Omissions insurance
                                on your work?</DIV></TD>
                            <TD class=data
colSpan=2> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=EOInsurance>
                                Yes&nbsp;
                                <INPUT class=form type=radio
                  value=No name=EOInsurance>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>If yes,
                                with which Company:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
                                <INPUT class=form maxLength=50
                  name=EOCompany>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Amount
                                of Coverage:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
                                <INPUT class=form maxLength=20
                  name=EOAmount>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Expiration
                                date:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
                                <INPUT class=form maxLength=20
                  name=EOExpireDate>
                              </DIV></TD>
                          </TR>

                          <TR>
                            <TD class=head3 vAlign=top colSpan=3> <DIV class=head3>List
                                all counties where you feel qualified to perform witness closings, including those
                                in which you are able to travel to. (Hold CTRL key to select multiple counties.)</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
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
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2><strong>Fee Schedule</strong></DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>Please indicate
                                what fees you will charge <cfoutput>#session.site.short_name#</cfoutput>

                                for the following services:</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Witness Only Fee:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                               <cfINPUT TYPE="Text" NAME="a_cost" SIZE=19 MAXLENGTH=15
									REQUIRED="yes" Message="You must enter your a fee"
									 >
                              </DIV></TD></tr><tr>
                            <TD class=head3> <DIV class=head3>Cancellation Fee:</DIV></TD>
                            <TD class=data
colSpan=2> <DIV class=data><NOBR>
                                <cfINPUT class=form maxLength=20 size=19
                  name=CancellationFee>
                                </NOBR></DIV></TD>
                          </TR>

                          <TR>
                            <TD class=head3 style="vertical-align:top"> <DIV class=head3>Additional
                                Fee Information:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
                                <TEXTAREA name=additionalFee rows=8 cols=32></TEXTAREA>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 align = "center" colSpan=6> <DIV class=form_button>
                                <INPUT class=form type=hidden
                  value=True name=form>
                                <INPUT class=form type=hidden
                  value=/work/closingvendor.html name=_form_refurl>
                                <INPUT
                  class=form type=hidden value="Closing Vendor application"
                  name=_form_emailsubject>
                                <INPUT class=form type=hidden
                  value=CLOSINGVENDORFORM_TEMPLATE name=_form_template>
                                <INPUT
                  class=form type=hidden value=jmiller@gac.com,oschmidt@gac.com
                  name=_form_emailto>
                                <INPUT class=form type=hidden value=email
                  name=_form_action>
                                <INPUT class=button type=submit value="Submit Form">
                              </DIV></TD>
                          </TR>
                        </TBODY>
                      </TABLE></TD>




			  </td>
        </tr>
       <!---  <tr>
          <td><p>
		  </p>
            <p>&nbsp;</p></td>
        </tr> --->
      </table>
			</cfform>
			<!---- body text ends ----->
      </table>

<cfinclude template="vendorfooter.cfm">