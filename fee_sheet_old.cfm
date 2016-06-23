<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Fee Sheet</title>
</head>
<body>
	<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM title
			where title_id = #rec_id#

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_comp">

			SELECT *
			FROM companies
			where ID = #read_title.comp_id#

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

	<CFQUERY datasource="#request.dsn#" NAME="read_hud">

			SELECT a_1108_a
			FROM hud_form_title_pg2
			where title_id = #rec_id#

		</CFQUERY>
<table summary="" align="center" border="0" cellpadding="1" cellspacing="1" width="99%">

<cfoutput>
<tr><td align="left">
<cfif #read_comp.id# eq "729" or #read_comp.id# eq "100">

<cfif NOT DateDiff("d", Now(), "1/30/2012")>
#UCase(session.site.long_name)#<BR>
30 West Gude Drive, 4th Floor<br>
Rockville, MD 20850<br>
<cfelse>
#UCase(session.site.long_name)#<BR>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br>
</cfif>

<br>

<CFELSE>

To: #read_comp.company#<br>
From: #session.site.short_name#<br>
</cfif>
Borrower: #read_title.bfirstname1# #read_title.blastname1#<br>
Order Number: #read_title.title_id#<br>
Loan Amount: #read_title.loanamt_float#<br><br>
</td>
</tr></cfoutput>
</table>

<table summary="" align="center" border="0" cellpadding="1" cellspacing="1" width="99%">
<tr>
<td align="center">
<CFOUTPUT>
									<CFIF #read_title.SearchType# EQ "Refinance">

				<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#read_title.pstate#'

					<CFIF (#read_title.pstate# EQ "MD") OR (#read_title.pstate# EQ "DE") OR (#read_title.pstate# EQ "NY")>
						AND county = '#read_title.pcounty#'
					</CFIF>
				</CFQUERY>


			<CFELSE>

				<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#read_title.pstate#'

					<CFIF (#read_title.pstate# EQ "MD") OR (#read_title.pstate# EQ "DE") OR (#read_title.pstate# EQ "NY")>
						AND county = '#read_title.pcounty#'
					</CFIF>
				</CFQUERY>

			</CFIF>

		<CFIF (#read_title.pstate# EQ "MD") OR (#read_title.pstate# EQ "DE") OR (#read_title.pstate# EQ "NY")>

				<CFIF #read_rec_fees.recordcount# gt "0">
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
							<CFSET state_mort_stamps = "0">
							<cfif #read_title.piggy# eq 1>
							<CFSET piggy_city_mort_stamps = #round(read_title.secloan)# * #read_rec_fees.mort_stamps#>
							<CFSET loan_city_mort_stamps = #round(read_title.loanamt_float)# * #read_rec_fees.mort_stamps#>
							<CFSET city_mort_stamps = #piggy_city_mort_stamps# + #loan_city_mort_stamps#>
							<cfelse>

											<CFIF #read_title.SearchType# EQ "Purchase">
							  <cfif #read_title.loanamt_float# GT #read_title.purchase#>
							      <CFSET city_mort_stamps = #round(read_title.loanamt_float)# * #read_rec_fees.mort_stamps#>
						    <cfelse>
						        <CFSET city_mort_stamps = #round(read_title.purchase)# * #read_rec_fees.mort_stamps#>
						    </cfif>
						<cfelse>
							<CFSET city_mort_stamps = #round(read_title.loanamt_float)# * #read_rec_fees.mort_stamps#>
						</cfif>

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
							<cfif #read_title.piggy# eq 1>
							<CFSET piggy_city_mort_stamps = #round(read_title.secloan)# * #read_rec_fees.mort_stamps#>
							<CFSET loan_city_mort_stamps = #round(read_title.loanamt_float)# * #read_rec_fees.mort_stamps#>
							<CFSET city_mort_stamps = #piggy_city_mort_stamps# + #loan_city_mort_stamps#>
							<cfelse>


							<CFIF #read_title.SearchType# EQ "Purchase">
							  <cfif #read_title.loanamt_float# GT #read_title.purchase#>
							      <CFSET city_mort_stamps = #round(read_title.loanamt_float)# * #read_rec_fees.mort_stamps#>
						    <cfelse>
						        <CFSET city_mort_stamps = #round(read_title.purchase)# * #read_rec_fees.mort_stamps#>
						    </cfif>
						<cfelse>
							<CFSET city_mort_stamps = #round(read_title.loanamt_float)# * #read_rec_fees.mort_stamps#>
						</cfif>


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

			<CFIF (#read_title.SearchType# NEQ "Refinance") AND (#read_title.SearchType# NEQ "New Second Mortgage")>
				<cfif #read_rec_fees.recordcount# gt 0>
				<cfif #read_rec_fees.transfer_tax# neq 0>
				<cfif #read_title.pstate# eq "NJ">
				<cfif #read_title.purchase# LTE "150000">
				<CFSET state_deed_1 = #read_title.purchase# * 0.004>

				<cfELSEif #read_title.purchase# GT "150000" and #read_title.purchase# LTE "200000">
				<CFSET temp1 = #read_title.purchase# * 0.004>
				<CFSET temp2 = #read_title.purchase# - 150000>
				<CFSET temp3 = #temp2# * 0.0067>
				<CFSET state_deed_1 = #temp1# + #temp3#>

				<cfELSEif #read_title.purchase# GT "200000">

				<CFSET temp1 = #read_title.purchase# * 0.004>
				<CFSET temp2 = #read_title.purchase# - 150000>
				<CFSET temp3 = #temp2# * 0.0067>
				<CFSET temp4 = #temp1# + #temp3#>
				<CFSET temp6 = #purchase# - 200000>
				<CFSET temp7 = #temp6# * 0.0078>
				<CFSET state_deed_1 = #temp4# + #temp7#>

				<CFELSE>
				</CFIF>
				<CFELSE>
				<CFSET state_deed_1 = #read_title.purchase# * #read_rec_fees.transfer_tax#>
				</CFIF>
				<cfelse>
				<CFSET state_deed_1 = 0>
				</cfif>
			<cfelse>
				<CFSET state_deed_1 = 0>
				</cfif>
				<CFSET a_line_total_1203 = #state_deed_1# + #state_mort_stamps#>
			<CFELSE>
				<CFSET state_deed_1 = "0">
				<CFSET a_line_total_1203 =  #state_mort_stamps#>
			</CFIF>

<CFQUERY datasource="#request.dsn#" NAME="read_comp">
SELECT *
FROM companies
WHERE id = '#read_title.comp_id#'
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
			<cfif #read_title.piggy# eq 1>
			<CFSET loan_intang_tax = #round(read_title.loanamt_float)# * #read_rec_fees.intangible_tax#>
			<CFSET piggy_intang_tax = #round(read_title.loanamt_float)# * #read_rec_fees.intangible_tax#>
			<CFSET intang_tax = #loan_intang_tax# + #piggy_intang_tax#>
			<cfelse>
		<CFSET intang_tax = #round(read_title.loanamt_float)# * #read_rec_fees.intangible_tax#>
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


			</CFOUTPUT>

			<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE company_id = '#read_title.comp_id#' and a_states = '#read_title.pstate#'

		</CFQUERY>

<cfoutput query="read_this_sets_billing_states">
		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE billing_id = #read_this_sets_billing_states.billing_id#

		</CFQUERY>







			<table width=500 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
		<!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->

		<!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
		<tr>
		<td width=500 align=left valign=top bgcolor=e6e6e6>
		<cfif #read_title.searchType# eq "Refinance">


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
			1101. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Settlement or Closing Fee">
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
			1102. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Abstract or Title Search">
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
			1103. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Title Examination">
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
			1104. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Title Insurance Binder">
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
			1105. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Document Preparation">
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
			1106. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Notary Fees">
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
			1107. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107#

		</td>
	</tr>
	</cfif>
	<cfif #read_hud.a_1108_a# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_hud.a_1108_a#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1111# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">

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
			1112. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1113.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1113_text#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113#

		</td>

	</tr>
</cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Recording fee">

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
			1201. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Release Fee">
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
			1201. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Total Recording Fee">
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
			1202. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="	City Mortgage Stamps">
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
			1203. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="State Deed">
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
			1204. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Intagible Tax">
Intagible Tax

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
			1205.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1303.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1304.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1305. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
			#read_this_sets_billing_values.a_1305_text#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305#




		</td>
	</tr>
</cfif>




	</table>

		<!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->

	<cfelseif #read_title.searchtype# eq "purchase">
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
			1101. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Settlement or Closing Fee">
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
			1102. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Abstract or Title Search">
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
			1103. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Title Examination">
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
			1104. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Title Insurance Binder">
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
			1105. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Document Preparation">
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
			1106. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106b#
	 </td>
	</tr>
	</cfif>
	<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107b#

		</td>
	</tr>
	</cfif>
	<cfif #read_hud.a_1108_a# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_hud.a_1108_a#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">

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
			1112. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1113.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113b#

		</td>

	</tr>
</cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Recording fee">

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
			1201. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Release Fee">
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
			1201. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Total Recording Fee">
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
			1202. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="	City Mortgage Stamps">
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
			1203. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="State Deed">
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
			1204. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Intagible Tax">
Intagible Tax

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
			1205.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1303.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1304.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1305. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1305_textb#
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305b#




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
<cfif #read_this_sets_billing_values.a_1101c# neq "">
	<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Settlement or Closing Fee">
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
			1102. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Abstract or Title Search">
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
			1103. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Title Examination">
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
			1104. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Title Insurance Binder">
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
			1105. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Document Preparation">
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
			1106. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Notary Fees">
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
			1107. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107c#

		</td>
	</tr>
	</cfif>
	<cfif #read_hud.a_1108_a# neq "">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1109. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

	#read_hud.a_1108_a#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">

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
			1112. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1113.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113c#

		</td>

	</tr>
</cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1201. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Recording fee">

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
			1201. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Release Fee">
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
			1201. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Total Recording Fee">
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
			1202. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="	City Mortgage Stamps">
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
			1203. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="State Deed">
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
			1204. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Intagible Tax">
Intagible Tax

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
			1205.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1303.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1304.  <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
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
			1305. <img src="https://www.firsttitleservices.com/images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textc#

		</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305c#




		</td>
	</tr>
</cfif>
</table></cfif></cfoutput>
</td>
</tr>

</table>
<cfif #read_comp.id# eq "729" or #read_comp.id# eq "100">
<table summary="" align="center" border="0" cellpadding="1" cellspacing="1" width="99%">
<tr>
<td align="left"><br><br>
Please forward all recording packages to the address below, and make payment of all clerk's charges to:<br><br></td>
</tr>
<tr>
<td  align="left">
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
Abstracts USA, LLC.<br>
30 West Gude Drive<br>
4th Floor<br>
Rockville, MD 20850
<cfelse>
Abstracts USA, LLC.<br>
7361 Calhoun Place<br>
Suite 200<br>
Rockville, MD 20855
</cfif>

<br><br>
</td></tr><tr>
<td align="left">
Thank you.
<br><br>
</td>
</tr>
</table>
<CFELSE>
<table summary="" align="center" border="0" cellpadding="1" cellspacing="1" width="99%">
<tr>
<td align="left"><br><br>
These fees above do not include any charges for title endorsements unless indicated above.  Please contact your <cfoutput>#session.site.short_name#</cfoutput> representative for pricing.
</td>
</tr>
<tr>
<td align="left">
If the loan amount on this sheet differs from the current loan amount,
please call our office or email at <cfoutput>#team_email#</cfoutput>
to have a new fee sheet created.<br><br>
</td>
</tr>
</table>
</cfif>


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
</html>
