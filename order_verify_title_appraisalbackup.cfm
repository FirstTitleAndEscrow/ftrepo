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
<CFPARAM NAME="SearchType" DEFAULT="">
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
<CFPARAM NAME="do_appraisal" DEFAULT="">

<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="">
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
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="file_upload" DEFAULT="">



<cfif #a_trigger# eq "2">










		<!--- <CFINCLUDE TEMPLATE="./form_title_request_reenter.cfm">
<CFABORT> --->



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
<CFSET a_day_1 = #Day(a_insert_date)#>
<CFSET a_month_1 = #Month(a_insert_date)#>
<CFSET a_year_1 = #Year(a_insert_date)#>
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
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				TITLE (check_date, check_time, user_id, comp_id, loan_off_id, oname, ophone, oext, ofax, o_email, pname,
						pphone, pext, pfax, p_email, blastname1, bfirstname1, bminame1, bssn1,
						bhphone1, bwphone1, bext1, blastname2, bfirstname2, bminame2, bssn2,
						bhphone2, bwphone2, bext2, slastname1, sfirstname1, sminame1, sssn1,
						shphone1, swphone1, sext1, slastname2, sfirstname2, sminame2, sssn2,
						shphone2, swphone2, sext2, paddress, pcity, pstate, pzip, pcounty, plegaldesc, a_comment, verifyemail, verifyemail_2, verifyemail_3, fax_no,
						rptbyemail, a_insert_date, a_insert_time, duedate, request_icl, do_appraisal, order_date_adjusted, oda_day, oda_month, oda_year, oda_day_of_year, appraisal_status, a_day, a_month, a_year, a_day_of_year, polender1, poacctno1, pophone1, polender2, poacctno2, pophone2, order_status, SearchType, Deedtransfer, Insured, loanamt_float, loan_type_111, loan_program_333, prop_use_type, condo_pud, appraisal_type, pay_by, estimate_value, app_credit_card, app_cc_num, app_cc_exp_month,app_cc_exp_year, app_cc_name, app_ck_acct_name, app_ck_addr1, app_ck_addr2, app_ck_city, app_ck_state, app_ck_acct_no, app_ck_bank, app_ck_route_no, payment_type_1, partial_cod)
				VALUES ('#DateFormat(Now(), "mm-dd-yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', #user_id_1#, #RU.comp_id#,	#lo_id#, '#rlo_name#', '#RLO.lo_phone#',
				 		'#RLO.lo_ext#', '#RLO.lo_fax#', '#RLO.lo_email#', '#ru_name#', '#RU.lp_phone#', '#RU.lp_ext#', '#RU.lp_fax#', '#RU.lp_email#', '#blastname1#', '#bfirstname1#', '#bminame1#',
						'#bssn1#', '#bhphone1#', '#bwphone1#', '#bext1#', '#blastname2#', '#bfirstname2#', '#bminame2#', '#bssn2#', '#bhphone2#', '#bwphone2#', '#bext2#', '#slastname1#', '#sfirstname1#', '#sminame1#', '#sssn1#', '#shphone1#', '#swphone1#', '#sext1#', '#slastname2#', '#sfirstname2#', '#sminame2#', '#sssn2#', '#shphone2#', '#swphone2#', '#sext2#', '#paddress#', '#pcity#', '#pstate#', '#pzip#', '#pcounty#', '#plegaldesc#', '#a_comment#', '#verifyemail#', '#verifyemail_2#', '#verifyemail_3#', '#fax_no#',
						'#rptbyemail#', '#a_insert_date#', '#a_insert_time#', '#duedate#', '#request_icl#',
						'#do_appraisal#', '#order_date_adj#', #a_day_1#, #a_month_1#, #a_year_1#, #oda_day_of_year_1#, '#app_stat#', #a_day_1#, #a_month_1#, #a_year_1#,	#a_day_of_year_1#, '#polender1#', '#poacctno1#', '#pophone1#', '#polender2#', '#poacctno2#', '#pophone2#', 1, '#SearchType#', '#Deedtransfer#', '#Insured#', '#loanamt_float#', '#loan_type_111#', '#loan_program_333#', '#prop_use_type#', '#condo_pud#', '#appraisal_type#', '#pay_by#',
						'#NumberFormat(estimate_value, "9999999999.99")#', '#app_credit_card#',
						'#app_cc_num#', #app_cc_exp_month#, #app_cc_exp_year#, '#app_cc_name#', '#app_ck_acct_name#', '#app_ck_addr1#', '#app_ck_addr2#', '#app_ck_city#', '#app_ck_state#', '#app_ck_acct_no#', '#app_ck_bank#', '#app_ck_route_no#', '#payment_type_1#', '#partial_cod#')
			</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
	SELECT *
	FROM TITLE
	WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
</CFQUERY>
<cfif #file_upload# NEQ "">
<CFFILE
				DESTINATION="c:\websites\Standard\www.firsttitleservices.com\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			UPDATE title
			SET payoff_upload = '#new_file_name#'
			WHERE title_id = #get_titleid.Title_ID#
			</cfquery></cfif>
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


	<!--- ===/ GENERATE AN ENTRY IN THE ABSTRACTOR DOC TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>

		<!--- ============================================== --->


	<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 1  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_1_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>


	<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 2  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_2_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>

	<!--- ===/ GENERATE AN ENTRY IN THE Doc_Amer_Title_Fla_Title  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Closer_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>


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

			<CFIF #SearchType# NEQ "Refinance">
				<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
				<CFSET a_1203_line_total = #state_deed_1# + #state_mort_stamps#>
			<CFELSE>
				<CFSET state_deed_1 = "0">
				<CFSET a_1203_line_total =  #state_mort_stamps#>
			</CFIF>


			<CFSET a_fee_total = #read_rec_fees.release_rec_fee# + #read_rec_fees.mort_rec_fee#>

			<CFIF #read_rec_fees.intangible_tax# EQ "0">
				<CFSET intang_tax = "0">
			<CFELSE>
				<CFSET intang_tax = #loanamt_float# * #read_rec_fees.intangible_tax# >
			</CFIF>

			<!--- ===/ Calc Ins Fees    \=== --->


		<CFIF (#pstate# EQ "AL")>
			<CFIF (#pcounty# EQ "Cherokee") OR (#pcounty# EQ "Colbert")  OR (#pcounty# EQ "Dekalb") OR (#pcounty# EQ "Etowah") OR (#pcounty# EQ "Franklin") OR (#pcounty# EQ "Jackson") OR (#pcounty# EQ "Lauderdale") OR (#pcounty# EQ "Lawrence") OR (#pcounty# EQ "Limestone") OR (#pcounty# EQ "Madison") OR (#pcounty# EQ "Marion") OR (#pcounty# EQ "Marshall") OR (#pcounty# EQ "Winston")>
					<CFSET a_tble_to_read = "StateAlabamaMetro">
					<CFELSE>
					<CFSET a_tble_to_read = "StateAlabamaState">
				</CFIF>
				<CFELSEIF #pstate# EQ "AR">
					<CFSET a_tble_to_read = "StateArkansas">
				<CFELSEIF #pstate# EQ "CT">
					<CFSET a_tble_to_read = "StateConnecticut">
				<CFELSEIF #pstate# EQ "CO">
					<CFIF (#pcounty# EQ "Alamosa") OR  (#pcounty# EQ "Conejos") OR  (#pcounty# EQ "Rio Grande") OR  (#pcounty# EQ "Saguache")>
						<CFSET a_tble_to_read = "StateColoradoZone2">
					<CFelseIF (#pcounty# EQ "Archuleta") OR (#pcounty# EQ "Mineral")>
						<CFSET a_tble_to_read = "StateColoradoZone3">
					<CFelseIF (#pcounty# EQ "Boulder")>
						<CFSET a_tble_to_read = "StateColoradoZone4">
					<CFelseIF (#pcounty# EQ "Chaffee")>
						<CFSET a_tble_to_read = "StateColoradoZone5">
					<cfelse>
						<CFSET a_tble_to_read = "StateColoradoZone1">
					</CFIF>
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
				<CFELSEIF #pstate# EQ "NY">
					<CFIF (#pcounty# EQ "Albany") OR (#pcounty# EQ "Bronx")  OR (#pcounty# EQ "Columbia") OR (#pcounty# EQ "Dutchess") OR (#pcounty# EQ "Greene") OR (#pcounty# EQ "Kings") OR (#pcounty# EQ "Nassau") OR (#pcounty# EQ "New York") OR (#pcounty# EQ "Orange") OR (#pcounty# EQ "Putnam") OR (#pcounty# EQ "Queens") OR (#pcounty# EQ "Rensselaer") OR (#pcounty# EQ "Richmond") OR (#pcounty# EQ "Rockland") OR (#pcounty# EQ "Suffolk") OR (#pcounty# EQ "Sullivan") OR (#pcounty# EQ "Westchester") OR (#pcounty# EQ "Ulster")>
					<CFSET a_tble_to_read = "StateNewYorkZone2">
					<CFELSE>
					<CFSET a_tble_to_read = "StateNewYorkZone1">
				</CFIF>
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
						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->



					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
      </CFQUERY>

					<CFIF #SearchType# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>


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

<cfif #read_rec_fees.mort_rec_fee# NEQ "" or #read_rec_fees.mort_rec_fee# NEQ "0">
<Cfset rec_fee = #round(read_rec_fees.mort_rec_fee)#>
<CFELSE>
<Cfset rec_fee = "0">
</CFIF>
<cfif #read_rec_fees.release_rec_fee# NEQ "" or #read_rec_fees.release_rec_fee# NEQ "0">
<Cfset rel_fee = #round(read_rec_fees.release_rec_fee)#>
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

					<CFSET a_total_settlmnt_charges = #rec_fee#

													+ #rel_fee#

													+ #a_line_total_1203#
													+ #mort_stamps#
													+ #intang_tx#
													+ #ins_premium#
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
													>



<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg1(title_id, a_1, a_6, D_BName, D_BAddr, E_SName, E_SAddr, F_LName, F_LAddr, G_PropAddr, I_SettlementDate, a_103 , a_120 )
				VALUES(#get_titleid.title_id#, '#loan_type_111#', '#get_titleid.title_id#', '#b_name_5#', '', '#s_name_5#', '', '', '', '#property_address#', 'To Be Determined', '#a_total_settlmnt_charges#', '#a_total_settlmnt_charges#')

			</CFQUERY>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg2(title_id, a_1101_a,  a_1102_a, a_1103_a,  a_1104_a,  a_1105_a,  a_1106_a,  a_1107_a,  a_1111_a,  a_1112_a,  a_1113_a,  a_1205_a,  a_1303_a,  a_1304_a,  a_1305_a,  a_1108_a, a_1108_b, a_1201_a, a_1201_b, a_1201_c, a_1201_d, a_1201_e, a_1202_a, a_1202_b, a_1202_c, a_1202_d, a_1202_e, a_1203_a, a_1203_b, a_1203_c, a_1203_d, a_1203_e, a_1204_a, a_1204_b, a_1204_c, a_1400_a)
				VALUES(#get_titleid.title_id#, '#a_1101_a#', '#a_1102_a#',  '#a_1103_a#',  '#a_1104_a#',  '#a_1105_a#',  '#a_1106_a#',  '#a_1107_a#',  '#a_1111_a#',  '#a_1112_a#',  '#a_1113_a#',  '#a_1205_a#',  '#a_1303_a#', '#a_1304_a#', '#a_1305_a#', '#ins_premium#', '0', '0', '#rec_fee#', '#rel_fee#', '#total_fee#', '0', '0', '0', '#mort_stamps#', '#mort_stamps#', '0', '0', '#deed_state#', '#s_mort_stamps#', '#a_line_total_1203#', '0', 'Intangable Tax', '#intang_tx#', '0', '#a_total_settlmnt_charges#')

</CFQUERY>

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
				'"' & "Appr Type: " & #appraisal_type# & " Est Value: " & #estimate_value# & " Pay Type: " & #payment_type_1# &  " COD Amt: " &  #partial_cod# & '"' & "," &
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
	FILE="c:\websites\Standard\www.firsttitleservices.com\file_number\file_no.txt"
	variable="n_OUT">

<!--- increment that number --->

	<CFSET n_no = #n_out# + "1">

<!--- delete the old file with the old number --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\file_number\file_no.txt" --->
	<CFFILE ACTION="delete"
	FILE="c:\websites\Standard\www.firsttitleservices.com\file_number\file_no.txt"
	>
<!--- write the new number to the file --->

	<CFFILE ACTION="WRITE"
	FILE="c:\websites\Standard\www.firsttitleservices.com\file_number\file_no.txt"
	OUTPUT="#n_no#">

<!--- now writ the data for this order to the file --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\dhfvtywty_1\data_#n_no#.txt" --->
	<CFFILE ACTION="WRITE"
	FILE="c:\websites\Standard\www.firsttitleservices.com\dhfvtywty_1\data_#n_no#.txt"
	OUTPUT="#D_OUT#">

<!--- now mail this data to sdari --->





<!--- ================================================= --->
<!--- ===/  [ EMAIL THAT IS sent to First Title ]  \=== --->
<!--- ===/    containing the TSS Import data       \=== --->
<!--- ================================================= --->

<CFMAIL
TO="sdari@firsttitleservices.com,spape@firsttitleservices.com, sazan.sheshi@verizon.net"
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

	data_#n_no#.txt


Here is the data to import:


#d_out#





File recovery Link:

https://#cgi.server_name#/dhfvtywty_1/data_#n_no#.txt



</CFMAIL>













<!---Send a copy of order to the customer if #form.verifyemail# is not null--->

<!--- ================================================= --->
<!--- ===/  [ EMAIL THAT IS sent to the Customer ] \=== --->
<!--- ================================================= --->


<CFLOOP FROM="1" TO="3" INDEX="DDD">


			<CFIF #DDD# EQ "1">

				<CFSET vmail = #get_titleid.verifyemail#>

			<CFELSEIF #DDD# EQ "2">

				<CFSET vmail = #get_titleid.verifyemail_2#>

			<CFELSE>

				<CFSET vmail = #get_titleid.verifyemail_3#>

			</CFIF>




<!--- here is where we check to see if vmail is blank --->
<!--- if it is blank, then we skip the e-mail --->

<CFIF #vmail# NEQ "">


<CFIF #get_titleid.do_appraisal# EQ "Yes">

			<CFSET t_to_email = #get_titleid.verifyemail# & ",titleorders@yahoo.com,operations@plourdegroup.com,spape@firsttitleservices.com" >

<CFELSE>

			<CFSET t_to_email = #get_titleid.verifyemail# & ",titleorders@yahoo.com,spape@firsttitleservices.com" >

</CFIF>


				<CFMAIL
				TO="#t_to_email#,sazan.sheshi@verizon.net"
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
					Your Order ID is - #get_titleid.title_id# - Please use this when communicationg with our associates.

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
			<CFIF #get_titleid.verifyemail_2# NEQ "">
			Other Email: #verifyemail_2#
			</CFIF>
			<CFIF #get_titleid.verifyemail_3# NEQ "">
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


					Order No.: #get_titleid.title_id#

				[ Title Commitment ]

					Order No.: #get_titleid.title_id#
					Transaction Type: #searchtype#
					Deed Transfer: #deedtransfer#
					Proposed Insured: #insured#
					Loan Amount: #NumberFormat("#loanamt_float#", "9999999999.99")#
					Loan type - #loan_type_111#
					Loan Program - #loan_program_333#


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


<CFIF #do_appraisal# EQ "Yes">

			<CFSET t_to_email = "sdari@firsttitleservices.com,spape@firsttitleservices.com,titleorders@yahoo.com,nstol@firsttitleservices.com,operations@plourdegroup.com" >

<CFELSE>

			<CFSET t_to_email = "sdari@firsttitleservices.com,spape@firsttitleservices.com,titleorders@yahoo.com" >

</CFIF>



<CFMAIL
TO="#t_to_email#,sazan.sheshi@verizon.net"
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

<A HREF="https://#cgi.server_name#/send_info.cfm?id_pass=#get_titleid.title_id#">
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
<td align=left>#get_titleid.title_id#</td>
</tr>
<tr align="middle" valign="center">
<td><font size=3><b>Customer Information No.:</b></font></td>
<td align=left>#get_titleid.title_id#</td>
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


			<CFIF #get_titleid.verifyemail_2# NEQ "">

				<tr>
					<td width=180><b><font size=2>Other Email:<b></td>
					<td>#verifyemail_2#</td>
				</tr>

			</CFIF>



			<CFIF #get_titleid.verifyemail_3# NEQ "">

				<tr>
					<td width=180><b><font size=2>Other Email:<b></td>
					<td>#verifyemail_3#</td>
				</tr>

			</CFIF>

<CFIF #get_titleid.fax_no# NEQ "">

				<tr>
					<td width=180><b><font size=2>Other Email:<b></td>
					<td>#fax_no#</td>
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
	<td colspan=2><font size=2 face=arial><b>Title Commitment:</b></td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Order No.:</td>
	<td><font size=2 face=arial>#get_titleid.title_id#</td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Transaction Type:</td>
	<td><font size=2 face=arial>#searchtype#</td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Deed Transfer:</td>
	<td><font size=2 face=arial>#deedtransfer#</td>
</tr>
<tr>
<td width=180><font size=2 face=arial>Proposed Insured:</td>
	<td>#insured#</td>
</tr>
<tr>
	<td width=180><font size=2 face=arial>Loan Amount:</td>
	<td align=left><font size=2 face=arial>$#NumberFormat("#loanamt_float#", "999999.99")#</td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Loan Type:</td>
	<td align=left><font size=2 face=arial>#loan_type_111#</td>
</tr>


<tr>
	<td width=180><font size=2 face=arial>Loan Program:</td>
	<td align=left><font size=2 face=arial>#loan_program_333#</td>
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

<CFLOCATION URL="https://#cgi.server_name#/order_verify_display_title.cfm?order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">


</cfif>


<cfif #do_appraisal# eq "No">


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



	<CFSET duedate = #DateFormat(#add_day#, "DD-MMM-YY")#>



<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>


<!---------- END FORMATTING FOR DUE DATE -------------->


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
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				TITLE (check_date, check_time, user_id, comp_id, loan_off_id, oname, ophone, oext, ofax, o_email, pname,
						pphone, pext, pfax, p_email, blastname1, bfirstname1, bminame1, bssn1,
						bhphone1, bwphone1, bext1, blastname2, bfirstname2, bminame2, bssn2,
						bhphone2, bwphone2, bext2, slastname1, sfirstname1, sminame1, sssn1,
						shphone1, swphone1, sext1, slastname2, sfirstname2, sminame2, sssn2,
						shphone2, swphone2, sext2, paddress, pcity, pstate, pzip, pcounty, plegaldesc, a_comment, verifyemail, verifyemail_2, verifyemail_3, fax_no,
						rptbyemail, a_insert_date, a_insert_time, duedate, request_icl, do_appraisal, order_date_adjusted, oda_day, oda_month, oda_year, oda_day_of_year, appraisal_status, a_day, a_month, a_year, a_day_of_year, polender1, poacctno1, pophone1, polender2, poacctno2, pophone2, order_status, SearchType, Deedtransfer, Insured, loanamt_float, loan_type_111, loan_program_333, prop_use_type, condo_pud)
				VALUES ('#DateFormat(Now(), "mm-dd-yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#',  #user_id_1#, #RU.comp_id#,	#lo_id#, '#rlo_name#', '#RLO.lo_phone#',
				 		'#RLO.lo_ext#', '#RLO.lo_fax#', '#RLO.lo_email#', '#ru_name#', '#RU.lp_phone#', '#RU.lp_ext#', '#RU.lp_fax#', '#RU.lp_email#', '#blastname1#', '#bfirstname1#', '#bminame1#',
						'#bssn1#', '#bhphone1#', '#bwphone1#', '#bext1#', '#blastname2#', '#bfirstname2#', '#bminame2#', '#bssn2#', '#bhphone2#', '#bwphone2#', '#bext2#', '#slastname1#', '#sfirstname1#', '#sminame1#', '#sssn1#', '#shphone1#', '#swphone1#', '#sext1#', '#slastname2#', '#sfirstname2#', '#sminame2#', '#sssn2#', '#shphone2#', '#swphone2#', '#sext2#', '#paddress#', '#pcity#', '#pstate#', '#pzip#', '#pcounty#', '#plegaldesc#', '#a_comment#', '#verifyemail#', '#verifyemail_2#', '#verifyemail_3#', '#fax_no#',
						'#rptbyemail#', '#a_insert_date#', '#a_insert_time#', '#duedate#', '#request_icl#',
						'#do_appraisal#', '#order_date_adj#', #a_day_1#, #a_month_1#, #a_year_1#, #oda_day_of_year_1#, '#app_stat#', #a_day_1#, #a_month_1#, #a_year_1#,	#a_day_of_year_1#, '#polender1#', '#poacctno1#', '#pophone1#', '#polender2#', '#poacctno2#', '#pophone2#', 1, '#SearchType#', '#Deedtransfer#', '#Insured#', '#loanamt_float#', '#loan_type_111#', '#loan_program_333#', '#prop_use_type#', '#condo_pud#')
			</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
	SELECT *
	FROM TITLE
	WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
</CFQUERY>
<cfif #file_upload# NEQ "">
<CFFILE
				DESTINATION="c:\websites\Standard\www.firsttitleservices.com\uploads\"
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


	<!--- ===/ GENERATE AN ENTRY IN THE ABSTRACTOR DOC TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>

		<!--- ============================================== --->


	<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 1  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_1_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>


	<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 2  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_2_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>

	<!--- ===/ GENERATE AN ENTRY IN THE Doc_Amer_Title_Fla_Title  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Closer_Title(title_id)
				VALUES(#get_titleid.title_id#)

			</CFQUERY>


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

			<CFIF #SearchType# NEQ "Refinance">
				<CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
				<CFSET a_1203_line_total = #state_deed_1# + #state_mort_stamps#>
			<CFELSE>
				<CFSET state_deed_1 = "0">
				<CFSET a_1203_line_total =  #state_mort_stamps#>
			</CFIF>


			<CFSET a_fee_total = #read_rec_fees.release_rec_fee# + #read_rec_fees.mort_rec_fee#>

			<CFIF #read_rec_fees.intangible_tax# EQ "0">
				<CFSET intang_tax = "0">
			<CFELSE>
				<CFSET intang_tax = #loanamt_float# * #read_rec_fees.intangible_tax# >
			</CFIF>

			<!--- ===/ Calc Ins Fees    \=== --->


		<CFIF (#pstate# EQ "AL")>
			<CFIF (#pcounty# EQ "Cherokee") OR (#pcounty# EQ "Colbert")  OR (#pcounty# EQ "Dekalb") OR (#pcounty# EQ "Etowah") OR (#pcounty# EQ "Franklin") OR (#pcounty# EQ "Jackson") OR (#pcounty# EQ "Lauderdale") OR (#pcounty# EQ "Lawrence") OR (#pcounty# EQ "Limestone") OR (#pcounty# EQ "Madison") OR (#pcounty# EQ "Marion") OR (#pcounty# EQ "Marshall") OR (#pcounty# EQ "Winston")>
					<CFSET a_tble_to_read = "StateAlabamaMetro">
					<CFELSE>
					<CFSET a_tble_to_read = "StateAlabamaState">
				</CFIF>
				<CFELSEIF #pstate# EQ "AR">
					<CFSET a_tble_to_read = "StateArkansas">
				<CFELSEIF #pstate# EQ "CT">
					<CFSET a_tble_to_read = "StateConnecticut">
				<CFELSEIF #pstate# EQ "CO">
					<CFIF (#pcounty# EQ "Alamosa") OR  (#pcounty# EQ "Conejos") OR  (#pcounty# EQ "Rio Grande") OR  (#pcounty# EQ "Saguache")>
						<CFSET a_tble_to_read = "StateColoradoZone2">
					<CFelseIF (#pcounty# EQ "Archuleta") OR (#pcounty# EQ "Mineral")>
						<CFSET a_tble_to_read = "StateColoradoZone3">
					<CFelseIF (#pcounty# EQ "Boulder")>
						<CFSET a_tble_to_read = "StateColoradoZone4">
					<CFelseIF (#pcounty# EQ "Chaffee")>
						<CFSET a_tble_to_read = "StateColoradoZone5">
					<cfelse>
						<CFSET a_tble_to_read = "StateColoradoZone1">
					</CFIF>
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
				<CFELSEIF #pstate# EQ "NY">
					<CFIF (#pcounty# EQ "Albany") OR (#pcounty# EQ "Bronx")  OR (#pcounty# EQ "Columbia") OR (#pcounty# EQ "Dutchess") OR (#pcounty# EQ "Greene") OR (#pcounty# EQ "Kings") OR (#pcounty# EQ "Nassau") OR (#pcounty# EQ "New York") OR (#pcounty# EQ "Orange") OR (#pcounty# EQ "Putnam") OR (#pcounty# EQ "Queens") OR (#pcounty# EQ "Rensselaer") OR (#pcounty# EQ "Richmond") OR (#pcounty# EQ "Rockland") OR (#pcounty# EQ "Suffolk") OR (#pcounty# EQ "Sullivan") OR (#pcounty# EQ "Westchester") OR (#pcounty# EQ "Ulster")>
					<CFSET a_tble_to_read = "StateNewYorkZone2">
					<CFELSE>
					<CFSET a_tble_to_read = "StateNewYorkZone1">
				</CFIF>
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
						</CFIF>

				<!--- Now decide which field to use to do the calc  --->
				<!--- then Query the proper table                   --->



					<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
      </CFQUERY>

					<CFIF #SearchType# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>

					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>


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



<cfif #read_rec_fees.mort_rec_fee# NEQ "">
<Cfset rec_fee = #round(read_rec_fees.mort_rec_fee)#>
<CFELSE>
<Cfset rec_fee = "0">
</CFIF>
<cfif #read_rec_fees.release_rec_fee# NEQ "">
<Cfset rel_fee = #round(read_rec_fees.release_rec_fee)#>
<CFELSE>
<Cfset rel_fee = "0">
</CFIF>
<cfif #city_mort_stamps# NEQ "">
<Cfset mort_stamps = #round(city_mort_stamps)#>
<CFELSE>
<Cfset mort_stamps = "0">
</CFIF>
<cfif #a_fee_total# NEQ "">
<Cfset total_fee = #round(a_fee_total)#>
<CFELSE>
<Cfset total_fee = "0">
</CFIF>
<cfif #state_deed_1# NEQ "">
<Cfset deed_state = #round(state_deed_1)#>
<CFELSE>
<Cfset deed_state = "0">
</CFIF>
<cfif #state_mort_stamps# NEQ "">
<Cfset s_mort_stamps = #round(state_mort_stamps)#>
<CFELSE>
<Cfset s_mort_stamps = "0">
</CFIF>
<cfif #a_1203_line_total# NEQ "">
<Cfset a_line_total_1203 = #round(a_1203_line_total)#>
<CFELSE>
<Cfset a_line_total_1203 = "0">
</CFIF>
<cfif #intang_tax# NEQ "">
<Cfset intang_tx = #round(intang_tax)#>
<CFELSE>
<Cfset intang_tx = "0">
</CFIF>
<cfif #a_ins_premium# NEQ "">
<CFSET ins_premium = #round(a_ins_premium)#>
<cfelse>
<Cfset ins_premium = "0">
</cfif>
					<CFSET a_total_settlmnt_charges = #rec_fee#
													+ #rel_fee#
													+ #a_line_total_1203#
													+ #mort_stamps#
													+ #intang_tx#
													+ #ins_premium#
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
													>



			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg1(title_id, a_1, a_6, D_BName, D_BAddr, E_SName, E_SAddr, F_LName, F_LAddr, G_PropAddr, I_SettlementDate, a_103, a_120)
				VALUES(#get_titleid.title_id#, '#loan_type_111#', '#get_titleid.title_id#', '#b_name_5#', '', '#s_name_5#', '', '', '', '#property_address#', 'To Be Determined', '#a_total_settlmnt_charges#', '#a_total_settlmnt_charges#')

			</CFQUERY>

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg2(title_id, a_1101_a,  a_1102_a, a_1103_a,  a_1104_a,  a_1105_a,  a_1106_a,  a_1107_a,  a_1111_a,  a_1112_a,  a_1113_a,  a_1205_a,  a_1303_a,  a_1304_a,  a_1305_a,  a_1108_a, a_1108_b, a_1201_a, a_1201_b, a_1201_c, a_1201_d, a_1201_e, a_1202_a, a_1202_b, a_1202_c, a_1202_d, a_1202_e, a_1203_a, a_1203_b, a_1203_c, a_1203_d, a_1203_e, a_1204_a, a_1204_b, a_1204_c, a_1400_a)
				VALUES(#get_titleid.title_id#, '#a_1101_a#', '#a_1102_a#',  '#a_1103_a#',  '#a_1104_a#',  '#a_1105_a#',  '#a_1106_a#',  '#a_1107_a#',  '#a_1111_a#',  '#a_1112_a#',  '#a_1113_a#',  '#a_1205_a#',  '#a_1303_a#', '#a_1304_a#', '#a_1305_a#', '#ins_premium#', '0', '0', '#rec_fee#', '#rel_fee#', '#total_fee#', '0', '0', '0', '#mort_stamps#', '#mort_stamps#', '0', '0', '#deed_state#', '#s_mort_stamps#', '#a_line_total_1203#', '0', 'Intangable Tax', '#intang_tx#', '0', '#a_total_settlmnt_charges#')

			</CFQUERY>




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
				'"' & "Appr Type: " & #appraisal_type# & " Est Value: " & #estimate_value# & " Pay Type: " & #payment_type_1# &  " COD Amt: " &  #partial_cod# & '"' & "," &
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
	FILE="c:\websites\Standard\www.firsttitleservices.com\file_number\file_no.txt"
	variable="n_OUT">

<!--- increment that number --->

	<CFSET n_no = #n_out# + "1">

<!--- delete the old file with the old number --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\file_number\file_no.txt" --->
	<CFFILE ACTION="delete"
	FILE="c:\websites\Standard\www.firsttitleservices.com\file_number\file_no.txt"
	>
<!--- write the new number to the file --->

	<CFFILE ACTION="WRITE"
	FILE="c:\websites\Standard\www.firsttitleservices.com\file_number\file_no.txt"
	OUTPUT="#n_no#">

<!--- now writ the data for this order to the file --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\dhfvtywty_1\data_#n_no#.txt" --->
	<CFFILE ACTION="WRITE"
	FILE="c:\websites\Standard\www.firsttitleservices.com\dhfvtywty_1\data_#n_no#.txt"
	OUTPUT="#D_OUT#">

<!--- now mail this data to sdari --->





<!--- ================================================= --->
<!--- ===/  [ EMAIL THAT IS sent to First Title ]  \=== --->
<!--- ===/    containing the TSS Import data       \=== --->
<!--- ================================================= sdari@firsttitleservices.com,spape@firsttitleservices.com,--->

<CFMAIL
TO=" sazan.sheshi@verizon.net"
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

	data_#n_no#.txt


Here is the data to import:


#d_out#





File recovery Link:

https://#cgi.server_name#/dhfvtywty_1/data_#n_no#.txt



</CFMAIL>













<!---Send a copy of order to the customer if #form.verifyemail# is not null--->

<!--- ================================================= --->
<!--- ===/  [ EMAIL THAT IS sent to the Customer ] \=== --->
<!--- ================================================= --->


<CFLOOP FROM="1" TO="3" INDEX="DDD">


			<CFIF #DDD# EQ "1">

				<CFSET vmail = #verifyemail#>

			<CFELSEIF #DDD# EQ "2">

				<CFSET vmail = #verifyemail_2#>

			<CFELSE>

				<CFSET vmail = #verifyemail_3#>

			</CFIF>




<!--- here is where we check to see if vmail is blank titleorders@yahoo.com,operations@plourdegroup.com,spape@firsttitleservices.com--->
<!--- if it is blank, then we skip the e-mail titleorders@yahoo.com,spape@firsttitleservices.com--->

<CFIF #vmail# NEQ "">


<CFIF #do_appraisal# EQ "Yes">

			<CFSET t_to_email = #verifyemail#>

<CFELSE>

			<CFSET t_to_email = #verifyemail#>

</CFIF>


				<CFMAIL
				TO="#t_to_email#,sazan.sheshi@verizon.net"
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
					Your Order ID is - #get_titleid.title_id# - Please use this when communicationg with our associates.

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
			<CFIF #verifyemail_2# NEQ "">
			Other Email: #verifyemail_2#
			</CFIF>
			<CFIF #verifyemail_3# NEQ "">
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


					Order No.: #get_titleid.title_id#

				[ Title Commitment ]

					Order No.: #get_titleid.title_id#
					Transaction Type: #searchtype#
					Deed Transfer: #deedtransfer#
					Proposed Insured: #insured#
					Loan Amount: #NumberFormat("#loanamt_float#", "9999999999.99")#
					Loan type - #loan_type_111#
					Loan Program - #loan_program_333#


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
<!--- ===/    this one contains the filled in order   \=== sdari@firsttitleservices.com,spape@firsttitleservices.com,titleorders@yahoo.com,nstol@firsttitleservices.com,operations@plourdegroup.com--->
<!--- ==================================================== sdari@firsttitleservices.com,spape@firsttitleservices.com,titleorders@yahoo.com--->


<CFIF #do_appraisal# EQ "Yes">

			<CFSET t_to_email = "rjermain@firsttitleservices.com" >

<CFELSE>

			<CFSET t_to_email = "rjermain@firsttitleservices.com" >

</CFIF>



<CFMAIL
TO="#t_to_email#,sazan.sheshi@verizon.net"
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

<A HREF="https://#cgi.server_name#/send_info.cfm?id_pass=#get_titleid.title_id#">
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
<td align=left>#get_titleid.title_id#</td>
</tr>
<tr align="middle" valign="center">
<td><font size=3><b>Customer Information No.:</b></font></td>
<td align=left>#get_titleid.title_id#</td>
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


			<CFIF #verifyemail_2# NEQ "">

				<tr>
					<td width=180><b><font size=2>Other Email:<b></td>
					<td>#verifyemail_2#</td>
				</tr>

			</CFIF>



			<CFIF #verifyemail_3# NEQ "">

				<tr>
					<td width=180><b><font size=2>Other Email:<b></td>
					<td>#verifyemail_3#</td>
				</tr>

			</CFIF>

<CFIF #fax_no# NEQ "">

				<tr>
					<td width=180><b><font size=2>Other Email:<b></td>
					<td>#fax_no#</td>
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
	<td colspan=2><font size=2 face=arial><b>Title Commitment:</b></td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Order No.:</td>
	<td><font size=2 face=arial>#get_titleid.title_id#</td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Transaction Type:</td>
	<td><font size=2 face=arial>#searchtype#</td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Deed Transfer:</td>
	<td><font size=2 face=arial>#deedtransfer#</td>
</tr>
<tr>
<td width=180><font size=2 face=arial>Proposed Insured:</td>
	<td>#insured#</td>
</tr>
<tr>
	<td width=180><font size=2 face=arial>Loan Amount:</td>
	<td align=left><font size=2 face=arial>$#NumberFormat("#loanamt_float#", "999999.99")#</td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Loan Type:</td>
	<td align=left><font size=2 face=arial>#loan_type_111#</td>
</tr>


<tr>
	<td width=180><font size=2 face=arial>Loan Program:</td>
	<td align=left><font size=2 face=arial>#loan_program_333#</td>
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

<CFLOCATION URL="https://#cgi.server_name#/order_verify_display_title.cfm?order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

<cfelse>

<CENTER>
<table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
	<tr><td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td></tr>
	<tr><td width=607 align=center valign=top><NOBR><!--- <a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a> ---><a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td></tr>
	<tr><td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></td></tr>
<tr><td width=590 align=center valign=top bgcolor=d3d3d3>
				<!--- <cfif #get_user.recordcount# GT "0">
				<CFOUTPUT><FONT FACE=ARIAL SIZE=2><b>To email us click here <a href="mailto:#retrieve_user.email#">email</a>.</b></CFOUTPUT></FONT>
			</cfif> --->
			</TD>
</tr>
	<tr>
		<td width=607 align=center valign=top>
				<img src="./images/label_title.gif">
				<p>

<CFFORM NAME="frm" ACTION="./order_verify_title_appraisal.cfm?file_upload=#file_upload#&a_trigger=2&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&blastname1=#blastname1#&bfirstname1=#bfirstname1#&bminame1=#bminame1#&bssn1=#bssn1#&bhphone1=#bhphone1#&bwphone1=#bwphone1#&bext1=#bext1#&blastname2=#blastname2#&bfirstname2=#bfirstname2#&bminame2=#bminame2#&bssn2=#bssn2#&bhphone2=#bhphone2#&bwphone2=#bwphone2#&bext2=#bext2#&slastname1=#slastname1#&sfirstname1=#sfirstname1#&sminame1=#sminame1#&sssn1=#sssn1#&shphone1=#shphone1#&swphone1=#swphone1#&sext1=#sext1#&slastname2=#slastname2#&sfirstname2=#sfirstname2#&sminame2=#sminame2#&sssn2=#sssn2#&shphone2=#shphone2#&swphone2#swphone2#&sext2=#sext2#&paddress=#paddress#&pcity=#pcity#&pstate=#pstate#&pzip=#pzip#&pcounty=#pcounty#&plegaldesc=#plegaldesc#&prop_use_type=#prop_use_type#&condo_pud=#condo_pud#&a_comment=#a_comment#&polender1=#polender1#&poacctno1=#poacctno1#&pophone1=#pophone1#&polender2=#polender2#&poacctno2=#poacctno2#&pophone2=#pophone2#&SearchType=#SearchType#&Deedtransfer=#Deedtransfer#&Insured=#Insured#&otherpro=#otherpro#&loanamt_float=#loanamt_float#&loan_type_111=#loan_type_111#&loan_program_333=#loan_program_333#&Verifyemail=#Verifyemail#&Verifyemail_2=#Verifyemail_2#&Verifyemail_3=#Verifyemail_3#&fax_no=#fax_no#&RptbyEmail=#RptbyEmail#&request_icl=#request_icl#&do_appraisal=#do_appraisal#" ENCTYPE="multipart/form-data" METHOD=POST>
   <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CREDIT CARD INFORMATION</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

				<tr>
						<td width=201  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							Appraisal Type</td>
						<td width=313  bgcolor="f1f1f1" align=left>
							<select name="appraisal_type"
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
									<OPTION VALUE="0" SELECTED>No Appraisal</OPTION>
									<OPTION VALUE="1004">Full Appraisal (1004)</OPTION>
									<OPTION VALUE="2055">Drive-by Appraisal (2055)</OPTION>
							</select>
						</td>
					</tr>

					<tr>
						<td width=201 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Estimated Value <br>
							<FONT FACE=verdana SIZE=1 color="gray" >(format xxxxxxxxxx.xx)
						</td>

						<td width=313  bgcolor="f1f1f1" align=left valign=top>
							<input type="text" name="estimate_value" size=35 maxlength=25
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
					</tr>

					<TR>
						<TD width=514 bgcolor="d3d3d3" colspan=4 align="center">

					<!--- ===/ Payment Type \=== --->

							<table width=515 cellpadding=1 cellspacing=1 border=0>
								<tr>
									<td width=514 colspan=3 align=left valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Appraisal Payment <FONT FACE=ARIAL SIZE=2 color="maroon">Options - </B></FONT> <FONT FACE=arial SIZE=1 color="gray"><b>Completed only if you are requesting a payment method other than "Bill Us" in the pulldown list below.</B>
									</td>
								</tr>

								<tr>
									<td width=200 bgcolor="f1f1f1" align=right valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Payment Type
									</td>

									<td width=121  bgcolor="f1f1f1" align=center valign=top>
										<select name="payment_type_1"
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
											<OPTION VALUE="Bill Us" SELECTED>Bill Us</OPTION>
											<OPTION VALUE="COD">COD</OPTION>
											<!--- <OPTION VALUE="Partial COD">Partial COD</OPTION> --->
										</select>
									</td>

									<!--- <TD bgcolor="f1f1f1" WIDTH=188 align=left>
										<FONT FACE=ARIAL SIZE=2 color="gray" > <img src="./images/arrow_left.gif">If Partial COD<br> <font size=1 color=black face=arial><NOBR>Fill in the Partial COD Amount<img src="./images/arrow_down.gif"></NOBR>

									</td> --->
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" colspan=3 WIDTH=512 align=right>
										<NOBR><FONT FACE=verdana SIZE=1 color="gray" >(format xxxxxxxxxx.xx)<img src="./images/arrow_right.gif"><FONT FACE=ARIAL SIZE=2 color="gray" ><input type="text" name="partial_cod" value="" size=30 maxlength=15
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
													clear: none;" >  </NOBR>
									</td>
								</tr>

								<tr>
									<td width=512 colspan=3 align=left valign=top>

					<!--- ===/ Payment Method \=== --->

							<table width=511 cellpadding=1 cellspacing=1 border=0>
								<tr>
									<td width=511 colspan=2 align=left valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Appraisal Payment <FONT FACE=ARIAL SIZE=2 color="maroon">Method - </B></FONT> <FONT FACE=arial SIZE=1 color="gray"><b>Choose which method for payment, and fill in all fields accordingly.</B>
									</td>
								</tr>

								<tr>
									<td bgcolor="f1f1f1" width=254  align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Pay by Credit Card</B> <img src="./images/arrow_right.gif"> <input type=radio name="pay_by" VALUE="Credit" checked>
									</td>

									<td bgcolor="f1f1f1" width=254  align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Pay by Check</B> <img src="./images/arrow_right.gif"> <input type=radio name="pay_by" VALUE="Check">
									</td>

								</tr>

								<tr>
									<td bgcolor="f3f3f3" width=254  align=left valign=top>

						<!--- ============================ --->
						<!--- ===/ PAY BY CREDIT CARD \=== --->
						<!--- ============================ --->

							<table width=252 cellpadding=0 cellspacing=0 border=0>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Credit Card
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<SELECT NAME="app_credit_card"
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
											<OPTION VALUE="MasterCard" SELECTED>MasterCard</OPTION>
											<OPTION VALUE="VISA">VISA</OPTION>
											<OPTION VALUE="DISCOVER">DISCOVER</OPTION>
										</SELECT>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card No.
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<input type="text" name="app_cc_num" value="" size=25 maxlength=19
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
								</tr>


								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Exp Month
									</td>

									<td bgcolor="f1f1f1" width=140 align=left valign=top>

									<SELECT NAME="app_cc_exp_month"
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
										<OPTION VALUE="1" SELECTED> 1</OPTION>
										<OPTION VALUE="2"> 2</OPTION>
										<OPTION VALUE="3"> 3</OPTION>
										<OPTION VALUE="4"> 4</OPTION>
										<OPTION VALUE="5"> 5</OPTION>
										<OPTION VALUE="6"> 6</OPTION>
										<OPTION VALUE="7"> 7</OPTION>
										<OPTION VALUE="8"> 8</OPTION>
										<OPTION VALUE="9"> 9</OPTION>
										<OPTION VALUE="10">10</OPTION>
										<OPTION VALUE="11">11</OPTION>
										<OPTION VALUE="12">12</OPTION>
										</SELECT>

								</td>
							</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Exp Year
									</td>

									<td bgcolor="f1f1f1" width=140 align=left valign=top>

									<SELECT NAME="app_cc_exp_year"
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
										<OPTION VALUE="2002" SELECTED>2002</OPTION>
										<OPTION VALUE="2003">2003</OPTION>
										<OPTION VALUE="2004">2004</OPTION>
										<OPTION VALUE="2005">2005</OPTION>
										<OPTION VALUE="2006">2006</OPTION>
										<OPTION VALUE="2007">2007</OPTION>
										<OPTION VALUE="2008">2008</OPTION>
										<OPTION VALUE="2009">2009</OPTION>
										<OPTION VALUE="2010">2010</OPTION>
										<OPTION VALUE="2011">2011</OPTION>
										<OPTION VALUE="2012">2012</OPTION>
										<OPTION VALUE="2013">2013</OPTION>
										<OPTION VALUE="2014">2014</OPTION>
										<OPTION VALUE="2015">2015</OPTION>
										<OPTION VALUE="2016">2016</OPTION>
										<OPTION VALUE="2017">2017</OPTION>
										<OPTION VALUE="2018">2018</OPTION>
										<OPTION VALUE="2019">2019</OPTION>
										<OPTION VALUE="2020">2020</OPTION>
										</SELECT>

								</td>
							</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Holder Name
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<input type="text" name="app_cc_name" value="" size=15 maxlength=20
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
								</tr>
							</table>

								</td>

								<td bgcolor="f3f3f3" width=254  align=left valign=top>

						<!--- ============================ --->
						<!--- ===/    PAY BY CHECK    \=== --->
						<!--- ============================ --->

							<table width=252 cellpadding=0 cellspacing=0 border=0>
								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Account Holder Name
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<input type="text" name="app_ck_acct_name" value="" size=25 maxlength=35
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
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Street / PO Box
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<input type="text" name="app_ck_addr1" value="" size=25 maxlength=120
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
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Street / PO Box
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<input type="text" name="app_ck_addr2" value="" size=25 maxlength=120
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
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >City
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<input type="text" name="app_ck_city" value="" size=15 maxlength=65
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
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >State
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<SELECT NAME="app_ck_state"
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
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
					</CFOUTPUT>
				</CFLOOP>
										</SELECT>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Account No.
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<input type="text" name="app_ck_acct_no" value="" size=23 maxlength=100
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
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Bank Name
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<input type="text" name="app_ck_bank" value="" size=23 maxlength=65
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
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Routing No.
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<input type="text" name="app_ck_route_no" value="" size=23 maxlength=85
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
								</tr>
							</table>
						</td>
					</tr>
							</table>

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

<!--- </CFIF>
</script> --->


		</TD>
	</TR>
		<tr><td width=607 align=right valign=bottom>
			<cfoutput><input type="hidden" name="file_upload" value="#file_upload#">
			</cfoutput><NOBR><input type=image border=0 src="./images/button_submit_title.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>

	<tr>
		<td width=607 align=center valign=top>
				<p>
				<img src="./images/label_title.gif">
				<p>
		</td>
	</tr>

		<tr><td width=607 align=left valign=bottom><IMG src="./images/bottom.gif"></td></tr></table>

</CFFORM>
</CENTER>
</cfif>



