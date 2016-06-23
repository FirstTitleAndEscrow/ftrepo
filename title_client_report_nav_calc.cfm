
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="loanamt_float" DEFAULT="0">

<cfquery  datasource="#request.dsn#">

			UPDATE TITLE SET loanamt_float = '#loanamt_float#', e_status = 1 WHERE title_ID = #rec_id#

</cfquery>


<CFQUERY datasource="#request.dsn#" NAME="read_title">
					SELECT *
					FROM title
					WHERE title_id = #rec_id#


				</CFQUERY>
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
							<CFSET city_mort_stamps = #round(read_title.loanamt_float)# * #read_rec_fees.mort_stamps#>
						<CFELSE>
							<CFSET state_mort_stamps = "0">
							<CFSET city_mort_stamps = "0">
						</CFIF>
				<CFELSE>
							<CFSET state_mort_stamps = "0">
							<CFSET city_mort_stamps = "0">
				</CFIF>

		<CFELSE>
				<CFIF #read_rec_fees.recordcount# gt "0">
					<CFIF #read_rec_fees.mort_stamps# NEQ "0">
							<CFSET state_mort_stamps = "0">
							<CFSET city_mort_stamps = #round(read_title.loanamt_float)# * #read_rec_fees.mort_stamps#>
					<CFELSE>
						<CFSET state_mort_stamps = "0">
						<CFSET city_mort_stamps = "0">
					</CFIF>
				<CFELSE>
					<CFSET state_mort_stamps = "0">
					<CFSET city_mort_stamps = "0">
						</CFIF>
					</CFIF>

			<CFIF (#read_title.SearchType# NEQ "Refinance")>
				<cfif #read_rec_fees.recordcount# gt 0>
				 <cfif #read_rec_fees.transfer_tax# neq 0>
				<CFSET state_deed_1 = #round(read_title.loanamt_float)# * #read_rec_fees.transfer_tax#>
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
	<cfif #read_rec_fees.recordcount# gt 0>
			<CFSET a_fee_total = #read_rec_fees.release_rec_fee# + #read_rec_fees.mort_rec_fee#>
			<cfelse>
			<CFSET a_fee_total = 0>
			</cfif>
			<CFIF #read_rec_fees.recordcount# GT 0>

			<CFIF #read_rec_fees.intangible_tax# neq 0>
		<CFSET intang_tax = #round(read_title.loanamt_float)# * #read_rec_fees.intangible_tax#>
		<CFELSE>

				<CFSET intang_tax = "0">
			</cfif>
			<CFELSE>

				<CFSET intang_tax = "0">

			</CFIF>


			<!--- ===/ Calc Ins Fees    \=== --->


		<CFIF (#read_title.pstate# EQ "AL")>
			<CFIF (#read_title.pcounty# EQ "Cherokee") OR (#read_title.pcounty# EQ "Colbert")  OR (#read_title.pcounty# EQ "Dekalb") OR (#read_title.pcounty# EQ "Etowah") OR (#read_title.pcounty# EQ "Franklin") OR (#read_title.pcounty# EQ "Jackson") OR (#read_title.pcounty# EQ "Lauderdale") OR (#read_title.pcounty# EQ "Lawrence") OR (#read_title.pcounty# EQ "Limestone") OR (#read_title.pcounty# EQ "Madison") OR (#read_title.pcounty# EQ "Marion") OR (#read_title.pcounty# EQ "Marshall") OR (#read_title.pcounty# EQ "Winston")>
					<CFSET a_tble_to_read = "StateAlabamaMetro">
					<CFELSE>
					<CFSET a_tble_to_read = "StateAlabamaState">
				</CFIF>
				<CFELSEIF #read_title.pstate# EQ "AR">
					<CFSET a_tble_to_read = "StateArkansas">
					<CFELSEIF #read_title.pstate# EQ "AZ">
					<CFSET a_tble_to_read = "StateArizona">
				<CFELSEIF #read_title.pstate# EQ "CT">
					<CFSET a_tble_to_read = "StateConnecticut">
					<CFELSEIF #read_title.pstate# EQ "CO">
					<CFIF (#read_title.pcounty# EQ "Adams") OR  (#read_title.pcounty# EQ "Arapahoe") OR  (#read_title.pcounty# EQ "Broomfield") OR  (#read_title.pcounty# EQ "Clear Creek") OR  (#read_title.pcounty# EQ "Denver") OR  (#read_title.pcounty# EQ "Douglas") OR  (#read_title.pcounty# EQ "Elbert") OR  (#read_title.pcounty# EQ "Jefferson")>
						<CFSET a_tble_to_read = "StateColoradoZone1">
					<CFelseIF (#read_title.pcounty# EQ "Alamosa") OR  (#read_title.pcounty# EQ "Conejos") OR  (#read_title.pcounty# EQ "Rio Grande") OR  (#read_title.pcounty# EQ "Saguache")>
						<CFSET a_tble_to_read = "StateColoradoZone2">
					<CFelseIF (#read_title.pcounty# EQ "Archuleta") OR (#read_title.pcounty# EQ "Mineral")>
						<CFSET a_tble_to_read = "StateColoradoZone3">
					<CFelseIF (#read_title.pcounty# EQ "Boulder")>
						<CFSET a_tble_to_read = "StateColoradoZone4">
					<CFelseIF (#read_title.pcounty# EQ "Chaffee")>
						<CFSET a_tble_to_read = "StateColoradoZone5">
					<CFelseIF (#read_title.pcounty# EQ "Custer") OR (#read_title.pcounty# EQ "Fremont")>
						<CFSET a_tble_to_read = "StateColoradoZone6">
					<CFelseIF (#read_title.pcounty# EQ "Dolorse") OR (#read_title.pcounty# EQ "LaPlata") OR (#read_title.pcounty# EQ "Montezuma")>
						<CFSET a_tble_to_read = "StateColoradoZone7">
					<CFelseIF (#read_title.pcounty# EQ "Eagle") OR (#read_title.pcounty# EQ "Garfield") OR (#read_title.pcounty# EQ "Grand") OR (#read_title.pcounty# EQ "Jackson") OR (#read_title.pcounty# EQ "Pitkin") OR (#read_title.pcounty# EQ "Routt") OR (#read_title.pcounty# EQ "Summit")>
						<CFSET a_tble_to_read = "StateColoradoZone8">
					<CFelseIF (#read_title.pcounty# EQ "El Paso")>
						<CFSET a_tble_to_read = "StateColoradoZone9">
					<CFelseIF (#read_title.pcounty# EQ "Moffatt")>
						<CFSET a_tble_to_read = "StateColoradoZone10">
					<CFelseIF (#read_title.pcounty# EQ "Larimer")>
						<CFSET a_tble_to_read = "StateColoradoZone11">
					<CFelseIF (#read_title.pcounty# EQ "Montrose") OR (#read_title.pcounty# EQ "Ouray")>
						<CFSET a_tble_to_read = "StateColoradoZone12">
					<CFelseIF (#read_title.pcounty# EQ "Phillips")>
						<CFSET a_tble_to_read = "StateColoradoZone13">
					<CFelseIF (#read_title.pcounty# EQ "Pueblo")>
						<CFSET a_tble_to_read = "StateColoradoZone14">
					<CFelseIF (#read_title.pcounty# EQ "Rio Blanco")>
						<CFSET a_tble_to_read = "StateColoradoZone15">
					<CFelseIF (#read_title.pcounty# EQ "Weld")>
						<CFSET a_tble_to_read = "StateColoradoZone16">
					<cfelse>
						<CFSET a_tble_to_read = "StateColoradoZone17">
					</CFIF>
				<CFELSEIF #read_title.pstate# EQ "CA">
					<CFSET a_tble_to_read = "StateCalifornia">
				<CFELSEIF #read_title.pstate# EQ "DC">
					<CFSET a_tble_to_read = "StateDistrictColombia">
				<CFELSEIF #read_title.pstate# EQ "DE">
					<CFSET a_tble_to_read = "StateDelaware">
				<CFELSEIF #read_title.pstate# EQ "FL">
					<CFSET a_tble_to_read = "StateFlorida">
				<CFELSEIF #read_title.pstate# EQ "GA">
					<CFIF (#read_title.pcounty# EQ "Fulton") OR (#read_title.pcounty# EQ "Cobb")  OR (#read_title.pcounty# EQ "Clayton") OR (#read_title.pcounty# EQ "Cherokee") OR (#read_title.pcounty# EQ "Dekalb") OR (#read_title.pcounty# EQ "Gwinnett") OR (#read_title.pcounty# EQ "Henry") OR (#read_title.pcounty# EQ "Douglas") OR (#read_title.pcounty# EQ "Forsyth") OR (#read_title.pcounty# EQ "Paulding") OR (#read_title.pcounty# EQ "Carroll")>
					<CFSET a_tble_to_read = "StateGeorgiaMetro">
					<CFELSE>
					<CFSET a_tble_to_read = "StateGeorgiaState">
				</CFIF>
				<CFELSEIF #read_title.pstate# EQ "IL">
					<CFSET a_tble_to_read = "StateIllinois">
				<CFELSEIF #read_title.pstate# EQ "IN">
					<CFSET a_tble_to_read = "StateIndiana">
				<CFELSEIF #read_title.pstate# EQ "IA">
					<CFSET a_tble_to_read = "StateIowa">
				<CFELSEIF #read_title.pstate# EQ "KS">
					<CFSET a_tble_to_read = "StateKansas">
				<CFELSEIF #read_title.pstate# EQ "KY">
					<CFSET a_tble_to_read = "StateKentucky">
				<CFELSEIF #read_title.pstate# EQ "LA">
					<CFSET a_tble_to_read = "StateLouisianna">
				<CFELSEIF #read_title.pstate# EQ "ME">
					<CFSET a_tble_to_read = "StateMaine">
				<CFELSEIF #read_title.pstate# EQ "MD">
					<CFSET a_tble_to_read = "StateMaryland">
				<CFELSEIF #read_title.pstate# EQ "MA">
					<CFSET a_tble_to_read = "StateMassachusetts">
				<CFELSEIF #read_title.pstate# EQ "MI">
					<CFIF (#read_title.pcounty# EQ "Allegan") OR (#read_title.pcounty# EQ "Barry")  OR (#read_title.pcounty# EQ "Clinton") OR (#read_title.pcounty# EQ "Eaton") OR (#read_title.pcounty# EQ "Grand Traverse") OR (#read_title.pcounty# EQ "Ingham") OR (#read_title.pcounty# EQ "Ionia") OR (#read_title.pcounty# EQ "Kent") OR (#read_title.pcounty# EQ "Leelanau") OR (#read_title.pcounty# EQ "Montcalm") OR (#read_title.pcounty# EQ "Muskegon") OR (#read_title.pcounty# EQ "Newaygo") OR (#read_title.pcounty# EQ "Ottawa")>
					<CFSET a_tble_to_read = "StateMichiganZone2">
					<CFELSEIF #read_title.pcounty# eq "Wayne">
			<CFSET a_tble_to_read = "StateMichiganZone3">
					<CFELSE>
					<CFSET a_tble_to_read = "StateMichiganZone1">
				</CFIF>
				<CFELSEIF #read_title.pstate# EQ "MN">
					<CFSET a_tble_to_read = "StateMinnesota">
				<CFELSEIF #read_title.pstate# EQ "MS">
					<CFSET a_tble_to_read = "StateMississipi">
				<CFELSEIF #read_title.pstate# EQ "MO">
					<CFSET a_tble_to_read = "StateMissouri">
				<CFELSEIF #read_title.pstate# EQ "NJ">
					<CFSET a_tble_to_read = "StateNewJersey">
				<CFELSEIF #read_title.pstate# EQ "NC">
					<CFSET a_tble_to_read = "StateNorthCarolina">
				<CFELSEIF #read_title.pstate# EQ "ND">
					<CFSET a_tble_to_read = "StateNorthDakota">
				<CFELSEIF #read_title.pstate# EQ "NH">
					<CFSET a_tble_to_read = "StateNewHampshire">


							 <CFELSEIF #pstate# EQ "NV">




					<CFSET a_tble_to_read = "StateNevada">


				<CFELSEIF #read_title.pstate# EQ "NY">
					<CFIF (#read_title.pcounty# EQ "Albany") OR (#read_title.pcounty# EQ "Bronx")  OR (#read_title.pcounty# EQ "Columbia") OR (#read_title.pcounty# EQ "Dutchess") OR (#read_title.pcounty# EQ "Greene") OR (#read_title.pcounty# EQ "Kings") OR (#read_title.pcounty# EQ "Nassau") OR (#read_title.pcounty# EQ "New York") OR (#read_title.pcounty# EQ "Orange") OR (#read_title.pcounty# EQ "Putnam") OR (#read_title.pcounty# EQ "Queens") OR (#read_title.pcounty# EQ "Rensselaer") OR (#read_title.pcounty# EQ "Richmond") OR (#read_title.pcounty# EQ "Rockland") OR (#read_title.pcounty# EQ "Suffolk") OR (#read_title.pcounty# EQ "Sullivan") OR (#read_title.pcounty# EQ "Westchester") OR (#read_title.pcounty# EQ "Ulster")>
					<CFSET a_tble_to_read = "StateNewYorkZone2">
					<CFELSE>
					<CFSET a_tble_to_read = "StateNewYorkZone1">
				</CFIF>
				<CFELSEIF #read_title.pstate# EQ "OH">
					<CFSET a_tble_to_read = "StateOhio">
				<CFELSEIF #read_title.pstate# EQ "PA">
					<CFSET a_tble_to_read = "StatePennsylvania">
				<CFELSEIF #read_title.pstate# EQ "RI">
					<CFSET a_tble_to_read = "StateRhodeIsland">
				<CFELSEIF #read_title.pstate# EQ "SC">
					<CFSET a_tble_to_read = "StateSouthCarolina">
				<CFELSEIF #read_title.pstate# EQ "TN">
					<CFIF (#read_title.pcounty# EQ "Davidson")>
						<CFSET a_tble_to_read = "StateTennesseeZone1">
					<CFelseIF (#read_title.pcounty# EQ "Hamilton")>
						<CFSET a_tble_to_read = "StateTennesseeZone2">
					<CFelseIF (#read_title.pcounty# EQ "Knox")>
						<CFSET a_tble_to_read = "StateTennesseeZone3">
					<CFelseIF (#read_title.pcounty# EQ "Shelby")>
						<CFSET a_tble_to_read = "StateTennesseeZone4">
					<cfelse>
						<CFSET a_tble_to_read = "StateTennessee">
					</CFIF>
				<CFELSEIF #read_title.pstate# EQ "VT">
					<CFSET a_tble_to_read = "StateVermont">
				<CFELSEIF #read_title.pstate# EQ "VA">
					<CFSET a_tble_to_read = "StateVirginia">
				<CFELSEIF #read_title.pstate# EQ "WV">
					<CFSET a_tble_to_read = "StateWestVirginia">
				<CFELSEIF #read_title.pstate# EQ "WI">
					<CFSET a_tble_to_read = "StateWisconsin">
				</CFIF>





				<!--- Round up the value of the loan amount --->

					<!--- remove any potential decimal values --->
						 <CFSET   x  = #Round(read_title.loanamt_float)#>

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

					<CFIF #read_title.SearchType# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>


<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states
		WHERE company_id = #read_title.comp_id# AND a_states = '#read_title.pstate#'

</CFQUERY>

<cfif #get_billing_states.recordcount# GT "0">

	<CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values
		WHERE company_id = #read_title.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>



<cfif #get_line_costs.a_1101# NEQ "">
<CFSET a_1101_a = #round(get_line_costs.a_1101)#>
<CFELSE>
<Cfset a_1101_a = "0">
</CFIF>
<cfif #get_line_costs.a_1102# NEQ "">
<CFSET a_1102_a = #round(get_line_costs.a_1102)#>
<CFELSE>
<Cfset a_1102_a = "0">
</CFIF>
<cfif #get_line_costs.a_1103# NEQ "">
<CFSET a_1103_a = #round(get_line_costs.a_1103)#>
<CFELSE>
<Cfset a_1103_a = "0">
</CFIF>
<cfif #get_line_costs.a_1104# NEQ "">
<CFSET a_1104_a = #round(get_line_costs.a_1104)#>
<CFELSE>
<Cfset a_1104_a = "0">
</CFIF>
<cfif #get_line_costs.a_1105# NEQ "">
<CFSET a_1105_a = #round(get_line_costs.a_1105)#>
<CFELSE>
<Cfset a_1105_a = "0">
</CFIF>
<cfif #get_line_costs.a_1106# NEQ "">
<CFSET a_1106_a = #round(get_line_costs.a_1106)#>
<CFELSE>
<Cfset a_1106_a = "0">
</CFIF>
<cfif #get_line_costs.a_1107# NEQ "">
<CFSET a_1107_a = #round(get_line_costs.a_1107)#>
<CFELSE>
<Cfset a_1107_a = "0">
</CFIF>
<cfif #get_line_costs.a_1111# NEQ "">
<CFSET a_1111_a = #round(get_line_costs.a_1111)#>
<CFELSE>
<Cfset a_1111_a = "0">
</CFIF>
<cfif #get_line_costs.a_1112# NEQ "">
<CFSET a_1112_a = #round(get_line_costs.a_1112)#>
<CFELSE>
<Cfset a_1112_a = "0">
</CFIF>
<cfif #get_line_costs.a_1113# NEQ "">
<CFSET a_1113_a = #round(get_line_costs.a_1113)#>
<CFELSE>
<Cfset a_1113_a = "0">
</CFIF>
<cfif #get_line_costs.a_1205# NEQ "">
<CFSET a_1205_a = #round(get_line_costs.a_1205)#>
<CFELSE>
<Cfset a_1205_a = "0">
</CFIF>
<cfif #get_line_costs.a_1303# NEQ "">
<CFSET a_1303_a = #round(get_line_costs.a_1303)#>
<CFELSE>
<Cfset a_1303_a = "0">
</CFIF>
<cfif #get_line_costs.a_1304# NEQ "">
<CFSET a_1304_a = #round(get_line_costs.a_1304)#>
<CFELSE>
<Cfset a_1304_a = "0">
</CFIF>
<cfif #get_line_costs.a_1305# NEQ "">
<CFSET a_1305_a = #round(get_line_costs.a_1305)#>
<CFELSE>
<Cfset a_1305_a = "0">
</CFIF>

<cfelse>
<Cfset a_1101_a = "0">

<Cfset a_1102_a = "0">

<Cfset a_1103_a = "0">

<Cfset a_1104_a = "0">

<Cfset a_1105_a = "0">

<Cfset a_1106_a = "0">

<Cfset a_1107_a = "0">

<Cfset a_1111_a = "0">

<Cfset a_1112_a = "0">

<Cfset a_1113_a = "0">

<Cfset a_1205_a = "0">

<Cfset a_1303_a = "0">

<Cfset a_1304_a = "0">

<Cfset a_1305_a = "0">

</cfif>

<cfif #read_rec_fees.recordcount# GT "0">
<CFIF #read_rec_fees.mort_rec_fee# NEQ "" or #read_rec_fees.mort_rec_fee# NEQ "0">
<Cfset rec_fee = #round(read_rec_fees.mort_rec_fee)#>
<CFELSE>
<Cfset rec_fee = "0">
</cfif>
<cfelse>
<Cfset rec_fee = "0">
</CFIF>
<cfif #read_rec_fees.recordcount# GT "0">
<cfif #read_rec_fees.release_rec_fee# NEQ "" or #read_rec_fees.release_rec_fee# NEQ "0">
<Cfset rel_fee = #round(read_rec_fees.release_rec_fee)#>
<CFELSE>
<Cfset rel_fee = "0">
</cfif>
<CFELSE>
<Cfset rel_fee = "0">
</CFIF>
<cfif #city_mort_stamps# NEQ "" or #city_mort_stamps# NEQ "0">
<Cfset mort_stamps = #round(city_mort_stamps)#>
<CFELSE>
<Cfset mort_stamps = "0">
</CFIF>
<cfif #a_fee_total# NEQ "" or #a_fee_total# NEQ "0">
<Cfset total_fee = #round(a_fee_total)#>
<CFELSE>
<Cfset total_fee = "0">
</CFIF>
<cfif #state_deed_1# NEQ "" or #state_deed_1# NEQ "0" >
<Cfset deed_state = #round(state_deed_1)#>
<CFELSE>
<Cfset deed_state = "0">
</CFIF>
<cfif #state_mort_stamps# NEQ "" or #state_mort_stamps# NEQ "0" >
<Cfset s_mort_stamps = #round(state_mort_stamps)#>
<CFELSE>
<Cfset s_mort_stamps = "0">
</CFIF>
<cfif #a_1203_line_total# NEQ "" or #a_1203_line_total# NEQ "0">
<Cfset a_line_total_1203 = #round(a_1203_line_total)#>
<CFELSE>
<Cfset a_line_total_1203 = "0">
</CFIF>
<cfif #intang_tax# NEQ "" or #intang_tax# NEQ "0">
<Cfset intang_tx = #round(intang_tax)#>
<CFELSE>
<Cfset intang_tx = "0">
</CFIF>
<cfif #a_ins_premium# NEQ "" or #a_ins_premium# NEQ "0">
<cfif #a_ins_premium# eq "Call for Quote!">
<CFSET ins_premium = "Call for Quote">
<cfelse>
<CFSET ins_premium = #NumberFormat(a_ins_premium, '_____.__')#>
</cfif>
<CFELSE>
<Cfset ins_premium = "0">
</CFIF>

	<CFQUERY datasource="#request.dsn#" NAME="read_hud1">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id#
	</cfquery>

	<CFQUERY datasource="#request.dsn#" NAME="read_hud2">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id#
	</cfquery>
<cfif #read_hud2.a_1306_b# NEQ "">
<Cfset a_1306_b = #read_hud2.a_1306_b#>
<CFELSE>
<Cfset a_1306_b = "0">
</CFIF>
	<cfif #read_hud2.a_1307_b# NEQ "">
<Cfset a_1307_b = #read_hud2.a_1307_b#>
<CFELSE>
<Cfset a_1307_b = "0">
</CFIF>
<cfif #read_hud2.a_1308_b# NEQ "">
<Cfset a_1308_b = #read_hud2.a_1308_b#>
<CFELSE>
<Cfset a_1308_b = "0">
</CFIF>

<cfif #read_hud2.a_801_b# NEQ "">
<Cfset a_801_b = #read_hud2.a_801_b#>
<CFELSE>
<Cfset a_801_b = "0">
</CFIF>
<cfif #read_hud2.a_802_b# NEQ "">
<Cfset a_802_b = #read_hud2.a_802_b#>
<CFELSE>
<Cfset a_802_b = "0">
</CFIF>
	<cfif #read_hud2.a_803_b# NEQ "">
<Cfset a_803_b = #read_hud2.a_803_b#>
<CFELSE>
<Cfset a_803_b = "0">
</CFIF>
	<cfif #read_hud2.a_804_b# NEQ "">
<Cfset a_804_b = #read_hud2.a_804_b#>
<CFELSE>
<Cfset a_804_b = "0">
</CFIF>

	<cfif #read_hud2.a_805_b# NEQ "">
<Cfset a_805_b = #read_hud2.a_805_b#>
<CFELSE>
<Cfset a_805_b = "0">
</CFIF>
<cfif #read_hud2.a_806_b# NEQ "">
<Cfset a_806_b = #read_hud2.a_806_b#>
<CFELSE>
<Cfset a_806_b = "0">
</CFIF>
<cfif #read_hud2.a_807_b# NEQ "">
<Cfset a_807_b = #read_hud2.a_807_b#>
<CFELSE>
<Cfset a_807_b = "0">
</CFIF>

<cfif #read_hud2.a_808_b# NEQ "">
<Cfset a_808_b = #read_hud2.a_808_b#>
<CFELSE>
<Cfset a_808_b = "0">
</CFIF>
<cfif #read_hud2.a_809_b# NEQ "">
<Cfset a_809_b = #read_hud2.a_809_b#>
<CFELSE>
<Cfset a_809_b = "0">
</CFIF>
<cfif #read_hud2.a_810_b# NEQ "">
<Cfset a_810_b = #read_hud2.a_810_b#>
<CFELSE>
<Cfset a_810_b = "0">
</CFIF>
<cfif #read_hud2.a_811_b# NEQ "">
<Cfset a_811_b = #read_hud2.a_811_b#>
<CFELSE>
<Cfset a_811_b = "0">
</CFIF>
<cfif #read_hud2.a_901_d# NEQ "">
<Cfset a_901_d = #read_hud2.a_901_d#>
<CFELSE>
<Cfset a_901_d = "0">
</CFIF>
<cfif #read_hud2.a_902_c# NEQ "">
<Cfset a_902_c = #read_hud2.a_902_c#>
<CFELSE>
<Cfset a_902_c = "0">
</CFIF>
<cfif #read_hud2.a_903_c# NEQ "">
<Cfset a_903_c = #read_hud2.a_903_c#>
<CFELSE>
<Cfset a_903_c = "0">
</CFIF>
<cfif #read_hud2.a_904_b# NEQ "">
<Cfset a_904_b = #read_hud2.a_904_b#>
<CFELSE>
<Cfset a_904_b = "0">
</CFIF>
<cfif #read_hud2.a_905_a# NEQ "">
<Cfset a_905_a = #read_hud2.a_905_a#>
<CFELSE>
<Cfset a_905_a = "0">
</CFIF>

<cfif #read_hud2.a_1001_c# NEQ "">
<Cfset a_1001_c = #read_hud2.a_1001_c#>
<CFELSE>
<Cfset a_1001_c = "0">
</CFIF>
<cfif #read_hud2.a_1002_c# NEQ "">
<Cfset a_1002_c = #read_hud2.a_1002_c#>
<CFELSE>
<Cfset a_1002_c = "0">
</CFIF>
<cfif #read_hud2.a_1003_c# NEQ "">
<Cfset a_1003_c = #read_hud2.a_1003_c#>
<CFELSE>
<Cfset a_1003_c = "0">
</CFIF>
<cfif #read_hud2.a_1004_c# NEQ "">
<Cfset a_1004_c = #read_hud2.a_1004_c#>
<CFELSE>
<Cfset a_1004_c = "0">
</CFIF>
<cfif #read_hud2.a_1005_c# NEQ "">
<Cfset a_1005_c = #read_hud2.a_1005_c#>
<CFELSE>
<Cfset a_1005_c = "0">
</CFIF>

<CFSET a_total_settlmnt_charges = #rec_fee#			+ #rel_fee#
													+ #a_line_total_1203#
													+ #mort_stamps#
													+ #intang_tx#

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
													+ #a_1205_a#
													+ #a_1303_a#
													+ #a_1304_a#
													+ #a_1305_a#
													+ #a_1306_b#
													+ #a_1307_b#
													+ #a_1308_b#
													+ #a_801_b#
													+ #a_802_b#
													+ #a_803_b#
													+ #a_804_b#
													+ #a_805_b#
													+ #a_806_b#
													+ #a_807_b#
													+ #a_808_b#
													+ #a_809_b#
													+ #a_810_b#
													+ #a_811_b#
													+ #a_901_d#
													+ #a_902_c#
													+ #a_903_c#
													+ #a_904_b#
													+ #a_905_a#
													+ #a_1001_c#
													+ #a_1002_c#
													+ #a_1003_c#
													+ #a_1004_c#
													+ #a_1005_c#
													>

<cfif ins_premium neq 'Call for Quote'>
<CFSET a_total_settlmnt_charges = a_total_settlmnt_charges + ins_premium>
</cfif>
<cfif #read_title.purchase# NEQ "">
<CFSET a_101 = #round(read_title.purchase)#>
<CFELSE>
<Cfset a_101 = "0">
</CFIF>
	<cfif #read_hud1.a_109_b# NEQ "">
<CFSET a_109_b = #read_hud1.a_109_b#>
<CFELSE>
<Cfset a_109_b = "0">
</CFIF>
	<cfif #read_hud1.a_104_b# NEQ "">
<CFSET a_104_b = #read_hud1.a_104_b#>
<CFELSE>
<Cfset a_104_b = "0">
</CFIF>
		<cfif #read_hud1.a_105_b# NEQ "">
<CFSET a_105_b = #read_hud1.a_105_b#>
<CFELSE>
<Cfset a_105_b = "0">
</CFIF>

	<CFSET a_103 = #a_total_settlmnt_charges#>

<CFSET a_120 = #a_103# + #a_101# + #a_104_b# + #a_105_b# + #a_109_b#>
<CFSET a_301 = #a_120#>
<CFSET a_220 = #read_title.loanamt_float#>
<CFSET a_302 = #a_220#>
<CFSET a_303 = #a_301# - #a_302#>

<CFQUERY datasource="#request.dsn#" >
				UPDATE hud_form_title_pg1
				SET
				a_103 =  '#a_total_settlmnt_charges#',
				a_120 = '#a_120#',
				a_301 = '#a_301#',
				a_220 = '#a_220#',
				a_302 = '#a_302#',
				a_303 = '#a_303#'
				WHERE title_id = #rec_id#
			</CFQUERY>

<CFQUERY datasource="#request.dsn#" >
				UPDATE hud_form_title_pg2
				SET
				a_1101_a =  '#a_1101_a#',
				a_1102_a='#a_1102_a#',
				a_1103_a='#a_1103_a#',
				a_1104_a='#a_1104_a#',
				a_1105_a='#a_1105_a#',
				a_1106_a='#a_1106_a#',
				a_1107_a='#a_1107_a#',
				a_1111_a='#a_1111_a#',
				a_1112_a='#a_1112_a#',
				a_1113_a='#a_1113_a#',
				a_1205_a='#a_1205_a#',
				a_1303_a='#a_1303_a#',
				a_1304_a='#a_1304_a#',
				a_1305_a='#a_1305_a#',
				a_1108_a='#ins_premium#',
				a_1108_b='0',
				a_1201_a='0',
				a_1201_b='#rec_fee#',
				a_1201_c='#rel_fee#',
				a_1201_d='#total_fee#',
				a_1201_e='0',
				a_1202_a='0',
				a_1202_b='0',
				a_1202_c='#mort_stamps#',
				a_1202_d='#mort_stamps#',
				a_1202_e='0',
				a_1203_a='0',
				a_1203_b='#deed_state#',
				a_1203_c='#s_mort_stamps#',
				a_1203_d='#a_line_total_1203#',
				a_1203_e='0',
				a_1204_a='Intangable Tax',
				a_1204_b='#intang_tx#',
				a_1204_c='0',
				a_1400_a='#a_total_settlmnt_charges#'

	WHERE title_id = #REC_ID#
</CFQUERY>





		<CFQUERY datasource="#request.dsn#" NAME="read_for_indicator">

			SELECT *
			FROM Tax_Cert_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstract">

			SELECT *
			FROM Doc_Abstract_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_info">
				SELECT *
				FROM eventlist
				Where Title_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_shipping">
				SELECT *
				FROM Shipping_info
				Where Id = #rec_id#
			</CFQUERY>
					<CFIF #Read_Title_Order_Req.a_sent_by# GT 0 AND #Read_Title_Order_Req.a_filled_out_by# GT 0>
						<CFSET A_Update_DB_Flag = 3>
					<CFELSE>
						<CFSET A_Update_DB_Flag = 0>
					</CFIF>


<CFQUERY datasource="#request.dsn#" NAME="read_appraisal">

			SELECT *
			FROM Appraisal_Doc_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_1">
			SELECT *
			FROM Pay_Off_Lender_1_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">
			SELECT *
			FROM Pay_Off_Lender_2_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

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
.menu1 {color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;}
.menu1:hover   {font:normal bold 11px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}
</style>

<STYLE TYPE="text/css"><!--
		A { color:#0033CC; text-decoration:none}
		BODY { font-family:arial,helvetica; margin-left:0; margin-top:0; margin-right:0;}
		A:hover,A:active { text-decoration:underline}
		TD { font-family:arial,helvetica;}

	--></STYLE>
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





<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">

		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		 <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT>
			        	 </table></center>



 <table width=770 border="0" cellpadding="0" cellspacing="0" >
  <TBODY>


	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>
<cfoutput>
	<map name="pp">
<area alt="Click to view general information for this order" coords="4,41,155,84" href="https://#cgi.server_name#/title_client_report_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="Click here to view preclosing data" coords="4,292,154,339" href="https://#cgi.server_name#/title_client_report_nav_pre.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="click here to view post closing data" coords="5,552,159,599" href="https://#cgi.server_name#/title_client_report_nav_post.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#">

<area alt="click here to view your order" coords="230,4,370,28" href="./title_report_navu.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">

<area alt="click here to view uploaded files" coords="307,50,439,73" href="./title_uploaded_file.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">



<area alt="click here to upload file for this order" coords="234,96,371,119" href="./title_client_upload.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<cfif #read_payoff_info_1.payoff1_upload# NEQ "">
<area alt="click here to view pay off 1" coords="231,186,375,209" href="./pay_off_title_1_view_only.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif><cfif #read_payoff_info_2.payoff2_upload# NEQ "">
<area alt="click here to view payoff 2" coords="297,225,456,248" href="./pay_off_title_2_view_only.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif><CFIF (#read_current_Commitment_Clauses.s_status# GT "")>
<area alt="click here to view title insurance" coords="378,263,562,287" href="./title_Committment.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>
<area alt="click here to view HUD 1" coords="466,304,615,329" href="./title_view_hud_pg1.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
<cfif #read_current_Commitment_Clauses.insurance_co# EQ "15">
<cfif #read_title_order.e_status# EQ "1">
<area alt="click here to view loan endorsement" coords="297,389,463,410" href="./view_loan_amount_verify.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>
<cfif #read_title_order.e_status# EQ "2">
<area alt="click here to view property endorsement" coords="377,345,568,371" href="./view_proposed_insured_verify.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "16">
<cfif #read_title_order.e_status# EQ "5">
<area alt="click here to view loan endorsement" coords="297,389,463,410" href="./view_loan_amount_verify_s.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<cfif #read_title_order.e_status# EQ "6">
<area alt="click here to view property endorsement" coords="377,345,568,371" href="./view_proposed_insured_verify_s.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<CFELSEIF #read_current_Commitment_Clauses.insurance_co# EQ "17">
<cfif #read_title_order.e_status# EQ "3">
<area alt="click here to view loan endorsement" coords="297,389,463,410" href="./view_loan_amount_verify_c.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">
</cfif>

<cfif #read_title_order.e_status# EQ "4">
<area alt="click here to view property endorsement" coords="377,345,568,371" href="./view_proposed_insured_verify_c.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" target = "new">

</cfif>
</cfif>


<cfif #read_title_order.ICL_upload# NEQ "">
<area alt="click here to view Insured Closing Letter" coords="235,428,381,453" href="./ICL_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif>
<CFIF (#Read_Title_Order_Req.request_date# GT "")>
<area alt="click here to request OR view a closing for this order" coords="234,518,388,541" href="./form_title_closing_order_request.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<cfelse>
<area alt="click here to request OR view a closing for this order" coords="234,518,388,541" href="./title_closing_report_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">

</cfif>
<CFIF (#Read_Title_Order_info.c_month# GT "")>
<area alt="click here to view information about scheduled closing" coords="234,606,387,630" href="./Title_Closing_View_info.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif><CFIF (#Read_Title_Order_shipping.recordcount# GT "") and (#Read_Title_Order_shipping.ID# GT "")>
<area alt="click here to view shipping/funding information" coords="289,562,465,587" href="./shipping_info_u.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
</cfif>


<area alt="click here to se an email to our preclosing team" coords="233,701,394,722" href="mailto:drosser@firsttitleservices.com,jmichel@firsttitleservices.com,pgibb@firsttitleservices.com,nashley@firsttitleservices.com">



<area alt="click here to send email to our clocing/ post closing team" coords="234,749,396,773" href="mailto:cwilliams@firsttitleservices.com,twoods@firsttitleservices.com">

</map>

</cfoutput>




<table WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0" bgcolor="#00339A" height="57">
<tr>
<td>
<table WIDTH="672" CELLPADDING="0" CELLSPACING="0" BORDER="0" border="0">
<cfoutput><tr>
<!--- <td rowspan="2" VALIGN="Middle" width="210"><font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></td>
 ---><td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><b><a href="https://#cgi.server_name#/client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order Detail for Number: #read_title.title_id#</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></span>
</td>
</tr></cfoutput>
<tr>
<td HEIGHT="20" ALIGN="Left" VALIGN="Bottom" >
<table class="tbl_mhtabs" CELLPADDING="0" CELLSPACING="0" BORDER="0"  height="20">

<td WIDTH="18" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="16" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_fls.gif" border="0" height="20" width="3" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_lcs.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="White"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rs.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_lns.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="ebf0f9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rn.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_nn.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="ebf0f9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rn.gif" border="0" height="20" width="10" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_xn.gif" border="0" height="20" width="3" /></td>
</tr>
<tr><cfoutput>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="White"><a class="lnk_mhtab" href="./title_client_report_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">General</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav_pre.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Pre-Closing Data</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav_Post.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Closing/Post-Closing Data</font></b></a></td>
</tr>
<tr><td HEIGHT="1" BGCOLOR="White"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
<td HEIGHT="1" BGCOLOR="ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td><td HEIGHT="1" BGCOLOR="ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td><td HEIGHT="1" BGCOLOR="ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
</tr></cfoutput>
</table>
</td></tr></table></td></tr></table>


	<TR>

	<td HEIGHT="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="3" width="1" /></td>
</TR><TR><td VALIGN="Middle"><table class="tbl" CELLPADDING="0" CELLSPACING="0" border="0">
		<TR><td><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="1" /></td>
<cfoutput><td><a class="lnk_mhsubnavsel" href="./title_report_navu.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">View Order</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="./title_client_upload.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Upload File</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="./title_uploaded_file.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">View Uploaded Files</font></a>
<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="./merge_endorsements.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">HUD-Endorse</font></a>
<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:drosser@firsttitleservices.com,jmichel@firsttitleservices.com,pgibb@firsttitleservices.com,nashley@firsttitleservices.com"><font face="arial,helvetica" color="0033CC" size="2">Contact Pre-Closing Team</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:cwilliams@firsttitleservices.com,twoods@firsttitleservices.com"><font face="arial,helvetica" color="0033CC" size="2">Contact Closing/Post-Closing Team</font></a>
</td></cfoutput>

	</table></TR>
	<TR><td HEIGHT="16" VALIGN="Top"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	<center><font face="arial,helvetica" color="Blue" size="2">NOTE: If the area on the diagram below is not clickable, that means there is not yet information available for that function.
If you require either a Loan Amount or Proposed Insured endorsement click</font><cfoutput><a href="https://#cgi.server_name#/endorse_modify.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="RED" size="2"> <b>AUTO-ENDORSE</B></font></a></cfoutput><font face="arial,helvetica" color="Blue" size="2">. To view/print them check diagram below.
</font>  </center>
<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	</td>
</TR></td>
<!--- <TR><td align = "center" bgcolor= "d3d3d3" HEIGHT="16" VALIGN="Top"> usemap="#ss"width="595" height="596"

</td>
</TR> --->
<TR><td align = "center" HEIGHT="16" VALIGN="Top"><br><img src="./images/diagram.jpg" border="0" usemap="#pp"></td>
</TR>


</td>

	</td>
	</tr>




		</TD>
	</TR>


		</td>
	</tr><!--- ====================================================================== ---><!--- ====================================================================== ---><!--- ====================================================================== --->





	</table>


			</td>
		</tr>

	</table>

	</td></tr>
	<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>

	</tbody></table>


	</CENTER></CENTER>

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





