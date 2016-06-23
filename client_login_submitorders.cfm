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
<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="">
<CFPARAM NAME="merge2" DEFAULT="">
<CFPARAM NAME="merge3" DEFAULT="">
<CFPARAM NAME="merge1" DEFAULT="">


<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT     *
FROM         Orders a, Customers b where (a.customerid = b.customerid)
and (a.loginid = '106') AND (a.orderdate LIKE '%03%')
</CFQUERY>

<cfoutput query="read_company">
	<CFQUERY datasource="#request.dsn#">
INSERT INTO 
	TITLE (check_date, check_time, comp_id, oname, ophone, oext, ofax, o_email, pname,
	pphone, pext, pfax, p_email, blastname1, bfirstname1, bminame1, bssn1,
	bhphone1, bwphone1, bext1, blastname2, bfirstname2, bminame2, bssn2,
	bhphone2, bwphone2, bext2, slastname1, sfirstname1, sminame1, sssn1, 
	shphone1, swphone1, sext1, slastname2, sfirstname2, sminame2, sssn2, 
	shphone2, swphone2, sext2, paddress, pcity, pstate, pzip, pcounty, plegaldesc, a_comment, verifyemail, verifyemail_2, verifyemail_3,
	rptbyemail, a_insert_date, a_insert_time, duedate, oda_day, oda_month, oda_year, appraisal_status, a_day, a_month, a_year, polender1, poacctno1, pophone1, polender2, poacctno2, pophone2, order_status, SearchType, purchase, Deedtransfer, Insured, loanamt_float, codeT)
	
	VALUES ('#DateFormat(read_company.orderdate, "mm/dd/yyyy")#', '#TimeFormat(read_company.orderdate, "HH:mm:ss")#', '106', '#read_company.oname#', '#read_company.ophone#',
	'#read_company.oext#', '#read_company.ofax#', '#read_company.verifyemail#', '#read_company.pname#', '#read_company.pphone#', '#read_company.pext#', '#read_company.pfax#', '#read_company.verifyemail#', '#read_company.blastname1#', '#read_company.bfirstname1#', '#read_company.bminame1#',
	'#read_company.bssn1#', '#read_company.bhphone1#', '#read_company.bwphone1#', '#read_company.bext1#', '#read_company.blastname2#', '#read_company.bfirstname2#', '#read_company.bminame2#', '#read_company.bssn2#', '#read_company.bhphone2#', '#read_company.bwphone2#', '#read_company.bext2#', '#read_company.slastname1#', '#read_company.sfirstname1#', '#read_company.sminame1#', '#read_company.sssn1#', '#read_company.shphone1#', '#read_company.swphone1#', '#read_company.sext1#', '#read_company.slastname2#', '#read_company.sfirstname2#', '#read_company.sminame2#', '#read_company.sssn2#', '#read_company.shphone2#', '#read_company.swphone2#', '#read_company.sext2#', '#read_company.paddress#', '#read_company.pcity#', '#read_company.pstate#', '#read_company.pzip#', '#read_company.pcounty#', '#read_company.plegaldesc#', '#read_company.cust_comment#', '#read_company.verifyemail#', '#read_company.verifyemail_2#', '#read_company.verifyemail_3#',
	'#read_company.rptbyemail#', '#read_company.a_insert_date#', '#read_company.a_insert_time#', '#DateFormat(read_company.duedate, "mm/dd/yyyy")#', 
	'#DateFormat(read_company.orderdate, "dd")#', '#DateFormat(read_company.orderdate, "mm")#', '#DateFormat(read_company.orderdate, "yyyy")#', '#read_company.status#', '#DateFormat(read_company.orderdate, "dd")#', '#DateFormat(read_company.orderdate, "mm")#', '#DateFormat(read_company.orderdate, "yyyy")#', '#read_company.polender1#', '#read_company.poacctno1#', '#read_company.pophone1#', '#read_company.polender2#', '#poacctno2#', '#pophone2#', 1, '#read_company.SearchType#', '#purchase#', '#read_company.Deedtransfer#', '#read_company.Insured#', '#Round(read_company.loanamt)#', 'T')
		</CFQUERY>				




<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
	SELECT *
	FROM TITLE
	WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
</CFQUERY>	


<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Closing_Order_Request(Title_ID, a_sent_by, a_filled_out_by)
				VALUES(#get_titleid.Title_ID#, 0, 0)		
			</CFQUERY>	
			
			<CFQUERY datasource="#request.dsn#">		
				INSERT INTO eventlist(Title_ID)
				VALUES(#get_titleid.Title_ID#)		
			</CFQUERY>	


			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO tax_cert_title(title_id)
				VALUES(#get_titleid.title_id#)
				
			</CFQUERY>
			
				<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id)
				VALUES(#get_titleid.title_id#)
				
			</CFQUERY>

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_1_Title(title_id)
				VALUES(#get_titleid.title_id#)
				
			</CFQUERY>
			
					<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_2_Title(title_id)
				VALUES(#get_titleid.title_id#)
				
			</CFQUERY>

	

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Closer_Title(title_id)
				VALUES(#get_titleid.title_id#)
				
			</CFQUERY>	
			
			<CFIF (#get_titleid.pstate# EQ "AL") OR (#get_titleid.pstate# EQ "AR") or (#get_titleid.pstate# EQ "AZ") or (#get_titleid.pstate# EQ "CA") or (#get_titleid.pstate# EQ "CO") or (#get_titleid.pstate# EQ "CT") or (#get_titleid.pstate# EQ "DE") or (#get_titleid.pstate# EQ "GA") or (#get_titleid.pstate# EQ "IA") or (#get_titleid.pstate# EQ "IL") or (#get_titleid.pstate# EQ "IN") or (#get_titleid.pstate# EQ "KS") or (#get_titleid.pstate# EQ "KY") or (#get_titleid.pstate# EQ "LA") or (#get_titleid.pstate# EQ "MA") or (#get_titleid.pstate# EQ "ME") or (#get_titleid.pstate# EQ "MN") or (#get_titleid.pstate# EQ "MO") or (#get_titleid.pstate# EQ "MS") or (#get_titleid.pstate# EQ "NC") or (#get_titleid.pstate# EQ "ND") or (#get_titleid.pstate# EQ "NH") or (#get_titleid.pstate# EQ "NY") or (#get_titleid.pstate# EQ "OH") or (#get_titleid.pstate# EQ "PA") or (#get_titleid.pstate# EQ "RI") or (#get_titleid.pstate# EQ "SC") or (#get_titleid.pstate# EQ "TN") or (#get_titleid.pstate# EQ "VA") or (#get_titleid.pstate# EQ "VT") or (#get_titleid.pstate# EQ "WI") or (#get_titleid.pstate# EQ "WV")> 
			
		
				
				<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
				VALUES(#get_titleid.title_id#, 15)
				
			</CFQUERY>
		<cfelseif (#get_titleid.pstate# EQ "DC") OR (#get_titleid.pstate# EQ "MD") or (#get_titleid.pstate# EQ "MI") or (#get_titleid.pstate# EQ "NJ")>
			
				<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
				VALUES(#get_titleid.title_id#, 16)
				
			</CFQUERY>
			<CFELSE>
			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
				VALUES(#get_titleid.title_id#, 14)
				
			</CFQUERY>
			</CFIF>
			
				<CFSET b_name_5 = #get_titleid.bfirstname1# & " " & #get_titleid.bminame1# & " " & #get_titleid.blastname1#>
			<CFSET s_name_5 = #get_titleid.sfirstname1# & " " & #get_titleid.sminame1# & " " & #get_titleid.slastname1#>
			<CFSET l_name_5 = #get_titleid.sfirstname1# & " " & #get_titleid.sminame1# & " " & #get_titleid.slastname1#>
			
			 <CFSET property_address = #get_titleid.paddress# & " " & #get_titleid.pcity# & " " & #get_titleid.pstate# & " " & #get_titleid.pzip# & " " & " -- " & #get_titleid.pcounty#>
			 
			<CFIF #SearchType# EQ "Refinance">

				<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#get_titleid.pstate#'
					
					<CFIF (#get_titleid.pstate# EQ "MD") OR (#get_titleid.pstate# EQ "DE") OR (#get_titleid.pstate# EQ "NY")>
						AND county = '#get_titleid.pcounty#'
					</CFIF>
				</CFQUERY>				
				
			
			<CFELSE>

				<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#get_titleid.pstate#'
					
					<CFIF (#get_titleid.pstate# EQ "MD") OR (#get_titleid.pstate# EQ "DE") OR (#get_titleid.pstate# EQ "NY")>
						AND county = '#get_titleid.pcounty#'
					</CFIF>
				</CFQUERY>			
			
			</CFIF>

					<CFIF (#get_titleid.pstate# EQ "MD") OR (#get_titleid.pstate# EQ "DE") OR (#get_titleid.pstate# EQ "NY")>
					
						<CFIF #read_rec_fees.mort_stamps# NEQ "" and #loanamt# neq "">
							<CFSET state_mort_stamps = "0">
							<CFSET city_mort_stamps = #Round(loanamt)# * #read_rec_fees.mort_stamps#>
						<CFELSE>
							<CFSET state_mort_stamps = "0">
							<CFSET city_mort_stamps = "0">						
						</CFIF>
						
					<CFELSE>
						<CFIF #read_rec_fees.mort_stamps# NEQ "0" or #read_rec_fees.mort_stamps# NEQ "">
							<CFSET city_mort_stamps = "0">
							<cfif #round(loanamt)# neq "" and #read_rec_fees.mort_stamps# neq "">
							<CFSET state_mort_stamps = #Round(loanamt)# * #round(read_rec_fees.mort_stamps)#></cfif>
						<CFELSE>
							<CFSET state_mort_stamps = "0">
							<CFSET city_mort_stamps = "0">						
						</CFIF>						
					</CFIF>

			<CFIF (#get_titleid.SearchType# NEQ "Refinance") and (#loanamt# neq "") and (#read_rec_fees.transfer_tax# neq "")>
				<CFSET state_deed_1 = #Round(loanamt)# * #read_rec_fees.transfer_tax#>
				<CFSET a_1203_line_total = #state_deed_1# + #state_mort_stamps#>
			<CFELSE>
				<CFSET state_deed_1 = "0">
				<CFSET a_1203_line_total =  #state_mort_stamps#>
			</CFIF>
			
			<cfif #read_rec_fees.release_rec_fee# neq "" and #read_rec_fees.mort_rec_fee# neq "">
			<CFSET a_fee_total = #read_rec_fees.release_rec_fee# + #read_rec_fees.mort_rec_fee#>
			<cfelse>
			<CFSET a_fee_total = 0>
			</cfif>
			<CFIF #read_rec_fees.intangible_tax# EQ "0">
				<CFSET intang_tax = "0">			
			<CFELSE>
				<cfif #loanamt# neq "" and #read_rec_fees.intangible_tax# neq "">
				<CFSET intang_tax = #Round(loanamt)# * #read_rec_fees.intangible_tax# >
			<cfelse><CFSET intang_tax = 0>
			</cfif></CFIF>
		
			
		<cfif #get_titleid.pstate# neq "CA">
			
			<CFIF (#get_titleid.pstate# EQ "AL")> 
			<CFIF (#get_titleid.pcounty# EQ "Cherokee") OR (#pcounty# EQ "Colbert")  OR (#pcounty# EQ "Dekalb") OR (#pcounty# EQ "Etowah") OR (#pcounty# EQ "Franklin") OR (#pcounty# EQ "Jackson") OR (#pcounty# EQ "Lauderdale") OR (#pcounty# EQ "Lawrence") OR (#pcounty# EQ "Limestone") OR (#pcounty# EQ "Madison") OR (#pcounty# EQ "Marion") OR (#pcounty# EQ "Marshall") OR (#pcounty# EQ "Winston")>
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
				
			<cfif #loanamt# neq "">
						 <CFSET   x  = #Round(get_titleid.loanamt_float)#>
			<cfelse><CFSET   x  = 0>
				</cfif>
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
					<cfif #read_ins_calc.recordcount# gt 0>					
					<CFIF #get_titleid.SearchType# EQ "Refinance">
						<CFSET a_ins_premium = #read_ins_calc.Refinance#>
					
					<CFELSE>
						<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>
	<cfelse>
<CFSET a_ins_premium = "0">
</cfif>
<cfelse>

<CFSET a_ins_premium = "0">

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

<cfif #read_rec_fees.mort_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# NEQ "0">				
<Cfset rec_fee = #round(read_rec_fees.mort_rec_fee)#>
<CFELSE>
<Cfset rec_fee = "0">
</CFIF>
<cfif #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.release_rec_fee# NEQ "0">
<Cfset rel_fee = #round(read_rec_fees.release_rec_fee)#>
<CFELSE>
<Cfset rel_fee = "0">
</CFIF>
<cfif #city_mort_stamps# NEQ "" and #city_mort_stamps# NEQ "0">
<Cfset mort_stamps = #round(city_mort_stamps)#>
<CFELSE>
<Cfset mort_stamps = "0">
</CFIF>
<cfif #a_fee_total# NEQ "" and #a_fee_total# NEQ "0">
<Cfset total_fee = #round(a_fee_total)#>	
<CFELSE>
<Cfset total_fee = "0">
</CFIF>
<cfif #state_deed_1# NEQ "" and #state_deed_1# NEQ "0" >
<Cfset deed_state = #round(state_deed_1)#>
<CFELSE>
<Cfset deed_state = "0">
</CFIF>
<cfif #state_mort_stamps# NEQ "" and #state_mort_stamps# NEQ "0" >
<Cfset s_mort_stamps = #round(state_mort_stamps)#>
<CFELSE>
<Cfset s_mort_stamps = "0">
</CFIF>	
<cfif #a_1203_line_total# NEQ "" and #a_1203_line_total# NEQ "0">
<Cfset a_line_total_1203 = #round(a_1203_line_total)#>
<CFELSE>
<Cfset a_line_total_1203 = "0">
</CFIF>
<cfif #intang_tax# NEQ "" and #intang_tax# NEQ "0">
<Cfset intang_tx = #round(intang_tax)#>
<CFELSE>
<Cfset intang_tx = "0">
</CFIF>

<cfif #pstate# neq "CA">

<cfif #a_ins_premium# NEQ "" and #a_ins_premium# NEQ "0">
<CFSET ins_premium = #round(a_ins_premium)#>
<CFELSE>
<Cfset ins_premium = "0">
</CFIF>

				   
					<CFSET a_total_settlmnt_charges = #rec_fee#
																								
													+ #rel_fee#
													
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
													
													> 
<cfif ins_premium neq 'Call for Quote'>
<CFSET a_total_settlmnt_charges = a_total_settlmnt_charges + ins_premium>
</cfif>
<cfif #get_titleid.purchase# NEQ "">
<CFSET a_101 = #round(get_titleid.purchase)#>
<CFELSE>
<Cfset a_101 = "0">
</CFIF>			 

<CFSET a_total_settlmnt_charges2 = #a_total_settlmnt_charges# + #a_101#>
													
		<CFSET a_220 = #Round(loanamt)#>
											
			<CFSET a_301 = #a_total_settlmnt_charges2#>										 

			<CFSET a_302 = #a_220#>	
			
			<CFSET a_total_settlmnt_charges3 = #a_301# - #a_302#>
			
<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg1(title_id, a_1, a_6, D_BName, D_BAddr, E_SName, E_SAddr, F_LName, F_LAddr, G_PropAddr, I_SettlementDate, a_103 , a_120, a_220, a_301, a_302, a_303 )
				VALUES(#get_titleid.title_id#, '', '#get_titleid.title_id#', '#b_name_5#', '', '#s_name_5#', '', '', '', '#property_address#', 'To Be Determined', '#a_total_settlmnt_charges#', '#a_total_settlmnt_charges2#', '#a_220#', '#a_301#', '#a_302#', '#a_total_settlmnt_charges3#')
				
			</CFQUERY>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg2(title_id, a_1101_a,  a_1102_a, a_1103_a,  a_1104_a,  a_1105_a,  a_1106_a,  a_1107_a,  a_1111_a,  a_1112_a,  a_1113_a,  a_1205_a,  a_1303_a,  a_1304_a,  a_1305_a,  a_1108_a, a_1108_b, a_1201_a, a_1201_b, a_1201_c, a_1201_d, a_1201_e, a_1202_a, a_1202_b, a_1202_c, a_1202_d, a_1202_e, a_1203_a, a_1203_b, a_1203_c, a_1203_d, a_1203_e, a_1204_a, a_1204_b, a_1204_c, a_1400_a)
				VALUES(#get_titleid.title_id#, '#a_1101_a#', '#a_1102_a#',  '#a_1103_a#',  '#a_1104_a#',  '#a_1105_a#',  '#a_1106_a#',  '#a_1107_a#',  '#a_1111_a#',  '#a_1112_a#',  '#a_1113_a#',  '#a_1205_a#',  '#a_1303_a#', '#a_1304_a#', '#a_1305_a#', '#ins_premium#', '0', '0', '#rec_fee#', '#rel_fee#', '#total_fee#', '0', '0', '0', '#mort_stamps#', '#mort_stamps#', '0', '0', '#deed_state#', '#s_mort_stamps#', '#a_line_total_1203#', '0', 'Intangable Tax', '#intang_tx#', '0', '#a_total_settlmnt_charges#')
				
</CFQUERY>


<cfelse>

			<CFSET a_total_settlmnt_charges = #rec_fee#
																								
													+ #rel_fee#
													
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
																										
													> 
			<cfif #get_titleid.purchase# NEQ "">
<CFSET a_101 = #round(get_titleid.purchase)#>
<CFELSE>
<Cfset a_101 = "0">
</CFIF>										
	
	<CFSET a_total_settlmnt_charges2 = #a_total_settlmnt_charges# + #a_101#>
													
		<CFSET a_220 = #Round(loanamt)#>
											
			<CFSET a_301 = #a_total_settlmnt_charges2#>										 

			<CFSET a_302 = #a_220#>	
			
			<CFSET a_total_settlmnt_charges3 = #a_301# - #a_302#>
			
<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg1(title_id, a_1, a_6, D_BName, D_BAddr, E_SName, E_SAddr, F_LName, F_LAddr, G_PropAddr, I_SettlementDate, a_103 , a_120, a_220, a_301, a_302, a_303 )
				VALUES(#get_titleid.title_id#, '', '#get_titleid.title_id#', '#b_name_5#', '', '#s_name_5#', '', '', '', '#property_address#', 'To Be Determined', '#a_total_settlmnt_charges#', '#a_total_settlmnt_charges2#', '#a_220#', '#a_301#', '#a_302#', '#a_total_settlmnt_charges3#')
				
			</CFQUERY>

<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg2(title_id, a_1101_a,  a_1102_a, a_1103_a,  a_1104_a,  a_1105_a,  a_1106_a,  a_1107_a,  a_1111_a,  a_1112_a,  a_1113_a,  a_1205_a,  a_1303_a,  a_1304_a,  a_1305_a,  a_1108_a, a_1108_b, a_1201_a, a_1201_b, a_1201_c, a_1201_d, a_1201_e, a_1202_a, a_1202_b, a_1202_c, a_1202_d, a_1202_e, a_1203_a, a_1203_b, a_1203_c, a_1203_d, a_1203_e, a_1204_a, a_1204_b, a_1204_c, a_1400_a)
				VALUES(#get_titleid.title_id#, '#a_1101_a#', '#a_1102_a#',  '#a_1103_a#',  '#a_1104_a#',  '#a_1105_a#',  '#a_1106_a#',  '#a_1107_a#',  '#a_1111_a#',  '#a_1112_a#',  '#a_1113_a#',  '#a_1205_a#',  '#a_1303_a#', '#a_1304_a#', '#a_1305_a#', '#ins_premium#', '0', '0', '#rec_fee#', '#rel_fee#', '#total_fee#', '0', '0', '0', '#mort_stamps#', '#mort_stamps#', '0', '0', '#deed_state#', '#s_mort_stamps#', '#a_line_total_1203#', '0', 'Intangable Tax', '#intang_tx#', '0', '#a_total_settlmnt_charges#')
				
</CFQUERY>
	
				 

</cfif>
	</cfoutput>