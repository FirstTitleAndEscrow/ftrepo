<cfparam name="session.logged_in_vendor_id" default="0">
<CFPARAM NAME="blastname1" DEFAULT="">
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
<CFPARAM NAME="pophone1" DEFAULT="">
<CFPARAM NAME="polender2" DEFAULT="">
<CFPARAM NAME="poacctno2" DEFAULT="">
<CFPARAM NAME="pophone2" DEFAULT="">
<CFPARAM NAME="Verifyemail" DEFAULT="">
<CFPARAM NAME="Verifyemail_2" DEFAULT="">
<CFPARAM NAME="Verifyemail_3" DEFAULT="">
<CFPARAM NAME="RptbyEmail" DEFAULT="">
<CFPARAM NAME="do_appraisal" DEFAULT="">
<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="0">
<CFPARAM NAME="payment_type_1" DEFAULT="">
<CFPARAM NAME="partial_cod" DEFAULT="0">
<CFPARAM NAME="pay_by" DEFAULT="">
<CFPARAM NAME="app_credit_card" DEFAULT="">
<CFPARAM NAME="app_cc_num" DEFAULT="">
<CFPARAM NAME="app_cc_exp_month" DEFAULT="">
<CFPARAM NAME="app_cc_exp_year" DEFAULT="">
<CFPARAM NAME="app_cc_name" DEFAULT="">
<CFPARAM NAME="app_ck_acct_name" DEFAULT="">
<CFPARAM NAME="app_ck_addr1" DEFAULT="">
<CFPARAM NAME="app_ck_addr2" DEFAULT="">
<CFPARAM NAME="app_ck_city" DEFAULT="">
<CFPARAM NAME="app_ck_state" DEFAULT="">
<CFPARAM NAME="app_ck_acct_no" DEFAULT="">
<CFPARAM NAME="app_ck_bank" DEFAULT="">
<CFPARAM NAME="app_ck_route_no" DEFAULT="">

<!--- Check to see if the zip code is valid --->

<CFSET a_error = ArrayNew(1)>

<CFIF #FORM.do_appraisal# EQ "No">
	<CFSET estimate_value = "0">
	<CFSET partial_cod = "0">
	<CFSET a_error[2] = "">
<CFELSE>

	<CFIF #FORM.do_appraisal# EQ "Yes">
		<cfif IsNumeric(FORM.estimate_value)>
			<CFSET a_error[2] = "">
		<CFELSE>
			<CFSET a_error[2] = "You need to enter a NUMBER in the ESTIMATED VALUE in the Appraisal Request Section">
		</CFIF>
	<CFELSE>
		<CFSET a_error[2] = "">
	</CFIF>
</CFIF>


	<CFIF #FORM.payment_type_1# EQ "Partial COD">
		<cfif IsNumeric(FORM.partial_cod)>
			<CFSET a_error[3] = "">
		<CFELSE>
			<CFSET a_error[3] = "You need to enter a NUMBER in the PARTIAL COD AMOUNT in the Appraisal Request Section">
		</CFIF>
	<CFELSE>
		<CFSET a_error[3] = "">
	</CFIF>


<CFIF (#a_error[2]# NEQ "") OR (#a_error[3]# NEQ "")>

<CFINCLUDE TEMPLATE="./form_prop_request_reenter.cfm">
<CFABORT>
</CFIF>


<!--------------------------------------------->




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






<!---------- BEGIN FORMATTING FOR DUE DATE -------------->

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



	<CFSET duedate = #DateFormat(#add_day#, "DD-MMM-YY")#>


<CFSET oda_day_1 = #Day(order_date_adj)#>
<CFSET oda_month_1 = #Month(order_date_adj)#>
<CFSET oda_year_1 = #Year(order_date_adj)#>
<CFSET oda_day_of_year_1 = #DayOfYear(order_date_adj)#>


<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
<CFSET a_day_1 = #Day(a_insert_date)#>
<CFSET a_month_1 = #Month(a_insert_date)#>
<CFSET a_year_1 = #Year(a_insert_date)#>
<CFSET a_day_of_year_1 = #DayOfYear(a_insert_date)#>

<!---------- END FORMATTING FOR DUE DATE -------------->


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

			<CFIF #do_appraisal# EQ "No">
				<CFSET app_stat = "">
			<CFELSE>
				<CFSET app_stat = "In Process">
			</CFIF>

		<cfquery  datasource="#request.dsn#">
			INSERT INTO
				PROPERTY (check_date, user_id, comp_id, loan_off_id, oname, ophone, oext, ofax, o_email, pname,
						pphone, pext, pfax, p_email, blastname1, bfirstname1, bminame1, bssn1,
						bhphone1, bwphone1, bext1, blastname2, bfirstname2, bminame2, bssn2,
						bhphone2, bwphone2, bext2, slastname1, sfirstname1, sminame1, sssn1,
						shphone1, swphone1, sext1, slastname2, sfirstname2, sminame2, sssn2,
						shphone2, swphone2, sext2, paddress, pcity, pstate, pzip, pcounty, plegaldesc, a_comment, verifyemail, verifyemail_2, verifyemail_3,
						rptbyemail, a_insert_date, a_insert_time, duedate, do_appraisal, appraisal_type, estimate_value, app_credit_card, app_cc_num, app_cc_exp_month, pay_by,
						app_cc_exp_year, app_cc_name, app_ck_acct_name, app_ck_addr1, app_ck_addr2, app_ck_city, app_ck_state, app_ck_acct_no, app_ck_bank, app_ck_route_no, payment_type_1, partial_cod, order_date_adjusted, oda_day, oda_month, oda_year, oda_day_of_year, appraisal_status, a_day, a_month, a_year, a_day_of_year, polender1, poacctno1, pophone1, polender2, poacctno2, pophone2, order_status, prop_use_type, condo_pud <cfif session.logged_in_vendor_id neq 0>, opened_by_vendor_id</cfif>)
				VALUES ('#DateFormat(Now(), "mm-dd-yyyy")#', #user_id_1#, #RU.comp_id#,	#lo_id#, '#rlo_name#', '#RLO.lo_phone#',
				 		'#RLO.lo_ext#', '#RLO.lo_fax#', '#RLO.lo_email#', '#ru_name#', '#RU.lp_phone#', '#RU.lp_ext#', '#RU.lp_fax#', '#RU.lp_email#', '#blastname1#', '#bfirstname1#', '#bminame1#',
						'#bssn1#', '#bhphone1#', '#bwphone1#', '#bext1#', '#blastname2#', '#bfirstname2#', '#bminame2#', '#bssn2#', '#bhphone2#', '#bwphone2#', '#bext2#', '#slastname1#', '#sfirstname1#', '#sminame1#', '#sssn1#', '#shphone1#', '#swphone1#', '#sext1#', '#slastname2#', '#sfirstname2#', '#sminame2#', '#sssn2#', '#shphone2#', '#swphone2#', '#sext2#', '#paddress#', '#pcity#', '#pstate#', '#pzip#', '#pcounty#', '#plegaldesc#', '#a_comment#', '#verifyemail#', '#verifyemail_2#', '#verifyemail_3#',
						'#rptbyemail#', '#a_insert_date#', '#a_insert_time#', '#duedate#',
						'#do_appraisal#', '#appraisal_type#',
						'#NumberFormat(estimate_value, "9999999999.99")#', '#app_credit_card#',
						'#app_cc_num#', #app_cc_exp_month#, '#pay_by#', #app_cc_exp_year#, '#app_cc_name#', '#app_ck_acct_name#', '#app_ck_addr1#', '#app_ck_addr2#', '#app_ck_city#', '#app_ck_state#', '#app_ck_acct_no#', '#app_ck_bank#', '#app_ck_route_no#', '#payment_type_1#', '#partial_cod#', '#order_date_adj#', #oda_day_1#, #oda_month_1#, #oda_year_1#, #oda_day_of_year_1#, '#app_stat#', #a_day_1#, #a_month_1#, #a_year_1#,	#a_day_of_year_1#, '#polender1#', '#poacctno1#', '#pophone1#', '#polender2#', '#poacctno2#', '#pophone2#', 1, '#prop_use_type#', '#condo_pud#' <cfif session.logged_in_vendor_id neq 0>, #session.logged_in_vendor_id#</cfif>)
			</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="get_propid">
	SELECT *
	FROM PROPERTY
	WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
</CFQUERY>




<CFQUERY datasource="#request.dsn#" NAME="check_propid">
	SELECT *
	FROM tblUser_Roles
	WHERE prop_id = #get_propid.prop_id#
</CFQUERY>

<cfif check_propid.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_propid">
	Insert into tblUser_Roles (prop_id)
    values ('#get_propid.prop_id#')
</CFQUERY>
</cfif>

<!-------------------------------------------------------------------->

<!--- now let's check if there are any defaults set up to run at the time of ordering --->
<cftry>
<cfset temp = #routingSys.CheckForRouting(get_propid.prop_id, 'P', 'File_Ordered')#>
<cfcatch type="any">
</cfcatch>
</cftry>






		<!--- ============================================== --->
		<!--- ===/    Make Calculations for Insurance   \=== --->
		<!--- ===/    and Recording Fees                \=== --->


		<!--- ============================================== --->
		<!--- ===/ Insert this data into the HUD Tables \=== --->


			<CFSET b_name_5 = #bfirstname1# & " " & #bminame1# & " " & #blastname1#>
			<CFSET s_name_5 = #sfirstname1# & " " & #sminame1# & " " & #slastname1#>
			<CFSET l_name_5 = #sfirstname1# & " " & #sminame1# & " " & #slastname1#>

			 <CFSET property_address = #paddress# & " " & #pcity# & " " & #pstate# & " " & #pzip# & " " & " -- " & #pcounty#>



				<!--- <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#pstate#'

					<CFIF (#pstate# EQ "MD") OR (#pstate# EQ "DE") OR (#pstate# EQ "NY")>
						AND county = '#pcounty#'
					</CFIF>
				</CFQUERY>



					<CFIF (#pstate# EQ "MD") OR (#pstate# EQ "DE") OR (#pstate# EQ "NY")>

						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
							<CFSET state_mort_stamps = "0">
							<CFSET city_mort_stamps = #loanamt_float# * #read_rec_fees.mort_stamps#>
						<CFELSE>
							<CFSET state_mort_stamps = "0">
							<CFSET city_mort_stamps = "0">
						</CFIF>

					<CFELSE>
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
							<CFSET city_mort_stamps = "0">
							<CFSET state_mort_stamps = #loanamt_float# * #read_rec_fees.mort_stamps#>
						<CFELSE>
							<CFSET state_mort_stamps = "0">
							<CFSET city_mort_stamps = "0">
						</CFIF>
					</CFIF>

				<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
				<CFSET a_1203_line_total = #state_deed_1# + #state_mort_stamps#>



			<CFSET a_fee_total = #read_rec_fees.release_rec_fee# + #read_rec_fees.mort_rec_fee#>

			<CFIF #read_rec_fees.intangible_tax# EQ "0">
				<CFSET intang_tax = "0">
			<CFELSE>
				<CFSET intang_tax = #loanamt_float# * #read_rec_fees.intangible_tax# >
			</CFIF>

			<!--- ===/ Calc Ins Fees    \=== --->

				<CFIF #pstate# EQ "AR">
					<CFSET a_tble_to_read = "StateArkansas">
				<CFELSEIF #pstate# EQ "CT">
					<CFSET a_tble_to_read = "StateConnecticut">
				<CFELSEIF #pstate# EQ "DE">
					<CFSET a_tble_to_read = "StateDelaware">
				<CFELSEIF #pstate# EQ "FL">
					<CFSET a_tble_to_read = "StateFlorida">
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
				<CFELSEIF #pstate# EQ "PA">
					<CFSET a_tble_to_read = "StatePennsylvania">
				<CFELSEIF #pstate# EQ "RI">
					<CFSET a_tble_to_read = "StateRhodeIsland">
				<CFELSEIF #pstate# EQ "SC">
					<CFSET a_tble_to_read = "StateSouthCarolina">
				<CFELSEIF #pstate# EQ "TN">
					<CFSET a_tble_to_read = "StateTennessee">
				<CFELSEIF #pstate# EQ "VT">
					<CFSET a_tble_to_read = "StateVermont">
				<CFELSEIF #pstate# EQ "VA">
					<CFSET a_tble_to_read = "StateVirginia">
				<CFELSEIF #pstate# EQ "WV">
					<CFSET a_tble_to_read = "StateWestVirginia">
				</CFIF>


				<!--- Round up the value of the loan amount --->

					<!--- remove any potential decimal values --->
						<CFSET   x  = #Round(loanamt_float)#>

					<CFSET   x_len  = #Len(x)#>
						<CFIF #x_len# EQ "4">
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
						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->

					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
	  order by a_to
      </CFQUERY>


						<CFSET a_ins_premium = #read_ins_calc.Refinance# * #loanamt_float#>




					<CFSET a_total_settlmnt_charges = #a_ins_premium#
													+ #read_rec_fees.mort_rec_fee#
													+ #read_rec_fees.release_rec_fee#
													+ #a_1203_line_total#
													+ #city_mort_stamps#
													+ #intang_tax#
													+ 275
													+ 200
													+ 350
													>



			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_prop_pg1(prop_id, a_6, D_BName, D_BAddr, E_SName, E_SAddr, F_LName, F_LAddr, G_PropAddr, I_SettlementDate, a_103, a_120)
				VALUES(#get_propid.prop_id#, '#get_propid.prop_id#', '#b_name_5#', '', '#s_name_5#', '', '', '',  '#property_address#', 'To Be Determined', '#a_total_settlmnt_charges#', '#a_total_settlmnt_charges#')

			</CFQUERY>

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_prop_pg2(prop_id, a_1101_a, a_1101_b, a_1102_a, a_1102_b, a_1103_a, a_1103_b, a_1108_a, a_1108_b, a_1201_a, a_1201_b, a_1201_c, a_1201_d, a_1201_e, a_1202_a, a_1202_b, a_1202_c, a_1202_d, a_1202_e, a_1203_a, a_1203_b, a_1203_c, a_1203_d, a_1203_e, a_1204_a, a_1204_b, a_1204_c)
				VALUES(#get_propid.prop_id#, '350', '0', '200', '0', '275', '0', '#a_ins_premium#', '0', '0', '#read_rec_fees.mort_rec_fee#', '#read_rec_fees.release_rec_fee#', '#a_fee_total#', '0', '0', '0', '#city_mort_stamps#', '#city_mort_stamps#', '0', '0', '#state_deed_1#', '#state_mort_stamps#', '#a_1203_line_total#', '0', 'Intangable Tax', '#intang_tax#', '0')

			</CFQUERY>


 --->

		<!--- ============================================== --->



	<!--- ===/ GENERATE AN ENTRY IN THE TAX CERT TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO tax_cert_prop(prop_id)
				VALUES(#get_propid.prop_id#)

			</CFQUERY>

	<!--- ===/ GENERATE AN ENTRY IN THE ABSTRACTOR DOC TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Prop(prop_id)
				VALUES(#get_propid.prop_id#)

			</CFQUERY>



		<!--- ============================================== --->


	<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 1  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_1_Prop(prop_id)
				VALUES(#get_propid.prop_id#)

			</CFQUERY>


	<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 2  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_2_Prop(prop_id)
				VALUES(#get_propid.prop_id#)

			</CFQUERY>


	<!--- ===/ GENERATE AN ENTRY IN THE Doc_Amer_Title_Fla_Prop  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Prop(Prop_id)
				VALUES(#get_propid.Prop_id#)

			</CFQUERY>




<CFQUERY datasource="#request.dsn#" NAME="getcompany">
	SELECT *
	FROM companies
	WHERE ID = #RU.comp_id#
</CFQUERY>


<!--- ================================================= --->
<!--- ===/ [ Output file for TSS Import Function ] \=== --->
<!--- ================================================= --->


<CFSET d_out = '"' & #get_propid.prop_id# & '"' & ","  &
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
				'"' & "Appr Type: " & #appraisal_type# & " Est Value: " & #estimate_value# & " Pay Type: " & #payment_type_1# &  " COD Amt: " &  #partial_cod# & '"' & "," &
				'"' & "Sale" & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
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

<!--- read out the last number used for a file name

	<CFFILE ACTION="read"
	FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\file_number\file_no.txt"
	variable="n_OUT">--->

<!--- increment that number

	<CFSET n_no = #n_out# + "1">--->

<!--- delete the old file with the old number

	<CFFILE ACTION="delete"
	FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\file_number\file_no.txt"
	>--->
<!--- write the new number to the file

	<CFFILE ACTION="WRITE"
	FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\file_number\file_no.txt"
	OUTPUT="#n_no#">--->

<!--- now writ the data for this order to the file

	<CFFILE ACTION="WRITE"
	FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\dhfvtywty_1\data_#n_no#.txt"
	OUTPUT="#D_OUT#"> --->

<!--- now mail this data to sdari --->



<!--- ================================================= --->
<!--- ===/  [ EMAIL THAT IS sent to First Title ]  \=== --->
<!--- ===/    containing the TSS Import data       \=== --->
<!--- ================================================= --->



<CFMAIL
TO="sdari@firsttitleservices.com,astone@fusionproductions.com,spape@firsttitleservices.com"
FROM="sdari@firsttitleservices.com" Subject="SAMPLE [do not process] Import file for an order"
TIMEOUT="600"
	>

SAMPLE [do not process]
SAMPLE [do not process]
SAMPLE [do not process]
SAMPLE [do not process]
SAMPLE [do not process]


If you happen to loose this data,
you can use the link below to recover
the file.

The reference name for this file is:

	<!--- data_#n_no#.txt --->


Here is the data to import:


<!--- #d_out# --->





File recovery Link:

<!--- https://#cgi.server_name#/dhfvtywty_1/data_#n_no#.txt --->



</CFMAIL>













<!---Send a copy of order to the customer if #form.verifyemail# is not null--->



<!--- here is where we loop thru the VERIFICATION e-mail list --->
<!--- and send an e-mail to each person on the list --->


<!--- ================================================= --->
<!--- ===/  [ EMAIL THAT IS sent to the Customer ] \=== --->
<!--- ================================================= --->

<CFLOOP FROM="1" TO="3" INDEX="DDD">


			<CFIF #DDD# EQ "1">

				<CFSET vmail = #FORM.verifyemail#>

			<CFELSEIF #DDD# EQ "2">

				<CFSET vmail = #FORM.verifyemail_2#>

			<CFELSE>

				<CFSET vmail = #FORM.verifyemail_3#>

			</CFIF>




<!--- here is where we check to see if vmail is blank --->
<!--- if it is blank, then we skip the e-mail --->

<CFIF #vmail# NEQ "">


<CFIF #FORM.do_appraisal# EQ "Yes">

			<CFSET t_to_email = #form.verifyemail# & ",titleorders@yahoo.com,operations@plourdegroup.com" >

<CFELSE>

			<CFSET t_to_email = #form.verifyemail# & ",titleorders@yahoo.com" >

</CFIF>


				<CFMAIL
				TO="#t_to_email#,astone@fusionproductions.com"
				FROM="sdari@firsttitleservices.com" Subject="SAMPLE [do not process] Summary of Your Order from 1st Title & Escrow, Inc."
				TIMEOUT="600"
				>

SAMPLE [do not process]
SAMPLE [do not process]
SAMPLE [do not process]
SAMPLE [do not process]
SAMPLE [do not process]

				Customer is - #getcompany.company#

				Unit No./Loan Officer email is - #RLO.lo_email#

				Loan Processor email is - #RU.lp_email#

				Title/ Property Report Request:

				Property use - #prop_use_type#

				Is this a Condo or PUD - #condo_pud#

				[ ORDER ID ]
					Your Order ID is - #get_propid.prop_id# - Please use this when communicationg with our associates.

				Summary of Order for #getcompany.company#
				#DateFormat(now(), "mmmm d, yyyy")# at #TimeFormat(now(), "hh:mm tt")#
				Officer:
				Name: #rlo_name#
				Phone No./~Ext.: #RLO.lo_phone#/~#RLO.lo_ext#
				Fax No.:#RLO.lo_fax#

				Processor:
				Name: #ru_name#
				Phone No./~Ext.: #RU.lp_phone#/~#RU.lp_ext#
				Fax No.: #RU.lp_fax#
				Verify through Email: #verifyemail#
			<CFIF #FORM.verifyemail_2# NEQ "">
			Other Email: #verifyemail_2#
			</CFIF>
			<CFIF #FORM.verifyemail_3# NEQ "">
			Other Email: #verifyemail_3#
			</CFIF>

				[ Borrower/Seller Information ]
					[ Borrower 1 ]
						Full Name (Last Name, First Name Mi): #blastname1#, #bfirstname1# #bminame1#
						SSN: #bssn1#
						Home Phone: #bhphone1#
						Work Phone No./~Ext.: #bwphone1#/~#bext1#

					[ Borrower 2 ]
						Full Name (Last Name, First Name Mi): #blastname2#, #bfirstname2# #bminame2#
						SSN: #bssn2#
						Home Phone: #bhphone2#
						Work Phone No./~Ext.: #bwphone2#/~#bext2#

					[ Seller 1 ]
						Full Name (Last Name, First Name Mi): #slastname1#, #sfirstname1# #sminame1#
						SSN: #sssn1#
						Home Phone: #shphone1#
						Work Phone No./~Ext.: #swphone1#/~#sext1#

					[ Seller 2 ]:
						Full Name (Last Name, First Name Mi): #slastname2#, #sfirstname2# #sminame2#
						SSN: #sssn2#
						Home Phone: #shphone2#
						Work Phone No./~Ext.: #swphone2#/~#sext2#
						Property Information:
						Address: #paddress#
						City, State Zip: #pcity#, #pstate#; #pzip#
						County: #pcounty#
						Legal Description: #plegaldesc#

				Comment: #a_comment#

				[ Property Report ]

					Order No.: #get_propid.prop_id#

				[ Appraisal Info ]

				<cfif #do_appraisal# is "Yes">
					Appraisal Type: #appraisal_type#
					Estimated Value : #estimate_value#
				<CFELSE>
					No Appraisal Requested
				</cfif>

				[ P/O Information ]

				First Lender: #polender1#
				First Acct. No.: #poacctno1#
				First Phone No.: #pophone1#

				Second Lender: #polender2#
				Second Acct. No.: #poacctno2#
				Second Phone No.: #pophone2#

				</cfmail>
		</CFIF>

	</CFLOOP>









<!--- Send a copy of order to 1st Title & Escrow, Inc.--->

<!--- sdari@firsttitleservices.com --->



<!--- ==================================================== --->
<!--- ===/  [ EMAIL THAT IS sent to the First Title ] \=== --->
<!--- ===/    this one contains the filled in order   \=== --->
<!--- ==================================================== --->


<CFIF #FORM.do_appraisal# EQ "Yes">

			<CFSET t_to_email = "sdari@firsttitleservices.com,spape@firsttitleservices.com,titleorders@yahoo.com,nstol@firsttitleservices.com,operations@plourdegroup.com" >

<CFELSE>

			<CFSET t_to_email = "sdari@firsttitleservices.com,spape@firsttitleservices.com,titleorders@yahoo.com" >

</CFIF>



<CFMAIL
TO="#t_to_email#,astone@fusionproductions.com"
FROM="sdari@firsttitleservices.com" Subject="SAMPLE [do not process] Copy of Customer Order with 1st Title & Escrow, Inc."
TIMEOUT="600"
type="HTML"
>


SAMPLE [do not process]
SAMPLE [do not process]
SAMPLE [do not process]
SAMPLE [do not process]
SAMPLE [do not process]


<center>
<h3>Summary of Customer Order</h3> <h5>#DateFormat(now(), "mmmm d, yyyy")# at #TimeFormat(now(), "hh:mm tt")#</h5>

Customer is - #getcompany.company#
<p>


Unit No./Loan Officer email is - #RLO.lo_email#
<p>
Loan Processor email is - #RU.lp_email#
<p>
Property use - #prop_use_type#
<p>

Is this a Condo or PUD - #condo_pud#
<p>


<A HREF="https://#cgi.server_name#/send_info.cfm?id_pass=#get_propid.prop_id#">
Send to Third Party by Email</a><P>
</center>
<table width=455 border="1" cellspacing="0" cellpadding="3" align="center">




<tr>
	<td colspan=2><b>Account Information</b></td>
</tr>

<tr>
	<td colspan=2><b>Title / Prop Report Request</b></td>
</tr>


<tr align="middle" valign="center">
<td><font size=3><b>ORDER ID :</b></font></td>
<td align=left>#get_propid.prop_id#</td>
</tr>
<tr align="middle" valign="center">
<td><font size=3><b>Customer Information No.:</b></font></td>
<td align=left>#get_propid.prop_id#</td>
</tr>

<tr>
	<td colspan=2><b>Officer:</b></td>
</tr>

<tr>
	<td width=180><font size=2>Name:</td>
	<td>#rlo_name#</td>
</tr>
<tr>
	<td width=180><font size=2>Phone No./~Ext.:</td>
	<td>#RLO.lo_phone#/~#RLO.lo_ext#</td>
</tr>
<tr>
	<td width=180><font size=2>Fax No.:</td>
	<td>#RLO.lo_fax#</td>
</tr>

<tr>
	<td colspan=2><b>Processor:</b></td>
</tr>

<tr>
	<td width=180><font size=2>Name:</td>
	<td>#ru_name#</td>
</tr>
<tr>
	<td width=180><font size=2>Phone No./~Ext.:</td>
	<td>#RU.lp_phone#/~#RU.lp_ext#</td>
</tr>
<tr>
	<td width=180><font size=2>Fax No.:</td>
	<td>#RU.lp_fax#</td>
</tr>

<tr>
	<td width=180><b><font size=2>Verify through Email:<b></td>
	<td>#verifyemail#</td>
</tr>


<tr>
	<td width=180><b><font size=2>Receive Report By Email:<b></td>
	<td>#verifyemail#</td>
</tr>


			<CFIF #FORM.verifyemail_2# NEQ "">

				<tr>
					<td width=180><b><font size=2>Other Email:<b></td>
					<td>#verifyemail_2#</td>
				</tr>

			</CFIF>



			<CFIF #FORM.verifyemail_3# NEQ "">

				<tr>
					<td width=180><b><font size=2>Other Email:<b></td>
					<td>#verifyemail_3#</td>
				</tr>

			</CFIF>



</table>


<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td colspan=2><b>Borrower/Seller Information</b></td>

</tr>

<tr>
	<td colspan=2><b>Borrower 1:</b></td>

</tr>

<tr>
	<td width=180><font size=2>Full Name (Last Name, First Name Mi):</td>
	<td>#blastname1#, #bfirstname1# #bminame1#</td>
</tr>

<tr>
	<td width=180><font size=2>SSN:</td>
	<td>#bssn1#</td>
</tr>

<tr>
	<td width=180><font size=2>Home Phone:</td>
	<td>#bhphone1#</td>
</tr>
<tr>
	<td width=180><font size=2>Work Phone No./~Ext.:</td>
	<td>#bwphone1#/~#bext1#</td>
</tr>


<tr>
	<td colspan=2><b>Borrower 2:</b></td>
</tr>

<tr>
	<td width=180><font size=2>Full Name (Last Name, First Name Mi):</td>
	<td>#blastname2#, #bfirstname2# #bminame2#</td>
</tr>

<tr>
	<td width=180><font size=2>SSN:</td>
	<td>#bssn2#</td>
</tr>

<tr>
	<td width=180><font size=2>Home Phone:</td>
	<td>#bhphone2#</td>
</tr>
<tr>
	<td width=180><font size=2>Work Phone No./~Ext.:</td>
	<td>#bwphone2#/~#bext2#</td>
</tr>



<tr>
	<td colspan=2><b>Seller 1:</b></td>
</tr>


<tr>
	<td width=180><font size=2>Full Name (Last Name, First Name Mi):</td>
	<td>#slastname1#, #sfirstname1# #sminame1#</td>
</tr>

<tr>
	<td width=180><font size=2>SSN:</td>
	<td>#sssn1#</td>
</tr>

<tr>
	<td width=180><font size=2>Home Phone:</td>
	<td>#shphone1#</td>
</tr>
<tr>
	<td width=180><font size=2>Work Phone No./~Ext.:</td>
	<td>#swphone1#/~#sext1#</td>
</tr>


<tr>
	<td colspan=2><b>Seller 2:</b></td>
</tr>


<tr>
	<td width=180><font size=2>Full Name (Last Name, First Name Mi):</td>
	<td>#slastname2#, #sfirstname2# #sminame2#</td>
</tr>

<tr>
	<td width=180><font size=2>SSN:</td>
	<td>#sssn2#</td>
</tr>

<tr>
	<td width=180><font size=2>Home Phone:</td>
	<td>#shphone2#</td>
</tr>
<tr>
	<td width=180><font size=2>Work Phone No./~Ext.:</td>
	<td>#swphone2#/~#sext2#</td>
</tr>

</table>



<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td colspan=2><b>Property Information</b></td>

</tr>

<tr>
	<td width=180><font size=2>Address:</td>
	<td>#paddress#</td>
</tr>


<tr>
	<td width=180><font size=2>City, State Zip:</td>
	<td>#pcity#, #pstate#&nbsp;#pzip#</td>
</tr>


<tr>
	<td width=180><font size=2>County:</td>
	<td>#pcounty#</td>
</tr>

<tr>
	<td width=180><font size=2>Legal Description:</td>
	<td>#plegaldesc#</td>
</tr>
</table>

<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td width=180><b>Comment:</b></td>
	<td>#a_comment#</td>
</tr>
</table><p></p>


<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td colspan=2><font size=2 face=arial><b>Property Report:</b></td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Order No.:</td>
	<td><font size=2 face=arial>#get_propid.prop_id#</td>
</tr>

</table><p></p>



<!---  INDICATE APPRAISAL INFORMATION --->

<cfif #do_appraisal# is "Yes">

	<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
		<tr>
			<td colspan=2><font size=2 face=arial><b>Appraisal Information</b></td>
		</tr>

		<tr>
			<td width=180><font size=2 face=arial>Appraisal Type</td>
			<td><font size=2 face=arial>#appraisal_type#</td>
		</tr>

		<tr>
			<td width=180><font size=2 face=arial>Estimated Value</td>
			<td><font size=2 face=arial>#estimate_value#</td>
		</tr>
	</table>
<CFELSE>

	<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
		<tr>
			<td colspan=2><font size=2 face=arial><b>Appraisal Information</b></td>
		</tr>

		<tr>
			<td width=180 colspan=2><font size=2 face=arial color=red>NO APPRAISAL REQUESTED</td>
		</tr>
	</table>


</CFIF>


<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td colspan=2><font size=2 face=arial><b>P/O Information</b></td>
</tr>


<tr>
<td width=180><font size=2 face=arial>First Lender:</td>
	<td><font size=2 face=arial>#polender1#</td>
</tr>

<tr>
<td width=180><font size=2 face=arial>First Acct. No.:</td>
	<td><font size=2 face=arial>#poacctno1#</td>
</tr>

<tr>
<td width=180><font size=2 face=arial>First Phone No.:</td>
	<td><font size=2 face=arial>#pophone1#</td>
</tr>

<tr>
<td width=180><font size=2 face=arial>Second Lender:</td>
	<td><font size=2 face=arial>#polender2#</td>
</tr>

<tr>
<td width=180><font size=2 face=arial>Second Acct. No.:</td>
	<td><font size=2 face=arial>#poacctno2#</td>
</tr>

<tr>
<td width=180><font size=2 face=arial>Second Phone No.:</td>
	<td><font size=2 face=arial>#pophone2#</td>
</tr>


</table><p></p>







</cfmail>



<CFLOCATION URL="https://#cgi.server_name#/order_verify_display_property.cfm?order_id=#get_propid.prop_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">


