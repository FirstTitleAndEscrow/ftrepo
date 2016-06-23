
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

<CFPARAM NAME="pname" DEFAULT="">
<CFPARAM NAME="p_email" DEFAULT="">
<CFPARAM NAME="pphone" DEFAULT="">
<CFPARAM NAME="pfax" DEFAULT="">
<CFPARAM NAME="pext" DEFAULT="">

<CFPARAM NAME="oname" DEFAULT="">
<CFPARAM NAME="o_email" DEFAULT="">
<CFPARAM NAME="ophone" DEFAULT="">
<CFPARAM NAME="ofax" DEFAULT="">
<CFPARAM NAME="oext" DEFAULT="">

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
<CFPARAM NAME="loanamt_float" DEFAULT="0">
<CFPARAM NAME="loanamt_number" DEFAULT="">
<CFPARAM NAME="Purchase_Price" DEFAULT="0">
<CFPARAM NAME="loan_type_111" DEFAULT="">
<CFPARAM NAME="loan_program_333" DEFAULT="">
<CFPARAM NAME="Verifyemail" DEFAULT="">
<CFPARAM NAME="Verifyemail_2" DEFAULT="">
<CFPARAM NAME="Verifyemail_3" DEFAULT="">
<CFPARAM NAME="RptbyEmail" DEFAULT="">
<CFPARAM NAME="do_appraisal" DEFAULT="">
<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="">
<CFPARAM NAME="payment_type_1" DEFAULT="">
<CFPARAM NAME="partial_cod" DEFAULT="0">
<CFPARAM NAME="pay_by" DEFAULT="">
<CFPARAM NAME="hud_type" DEFAULT="">
<!--------------------



------------------------->

<CFQUERY datasource="#request.dsn#" NAME="read_title1">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>
<CFSET duedate = #oda_month# & "/" & #oda_day# & "/" & #oda_year# >

<CFSET order_date_adj = #oda_month# & "/" & #oda_day# & "/" & #oda_year# >
<cfif #read_title1.loanamt_float# EQ #loanamt_float#>

	<cfquery  datasource="#request.dsn#">
			UPDATE TITLE
			SET blastname1 = '#blastname1#',
			bfirstname1 = '#bfirstname1#',
			bminame1 = '#bminame1#',
			bssn1 = '#bssn1#',
			bhphone1 = '#bhphone1#',
			bwphone1 = '#bwphone1#',
			bext1 = '#bext1#',
			blastname2 = '#blastname2#',
			bfirstname2 = '#bfirstname2#',
			bminame2 = '#bminame2#',
			bssn2 = '#bssn2#',
			bhphone2 = '#bhphone2#',
			bwphone2 = '#bwphone2#',
			bext2 = '#bext2#',
			slastname1 =  '#slastname1#',
			sfirstname1 = '#sfirstname1#',
			sminame1 =  '#sminame1#',
			sssn1 =  '#sssn1#',
			shphone1 = '#shphone1#',
			swphone1 = '#swphone1#',
			sext1 = '#sext1#',
			slastname2 = '#slastname2#',
			sfirstname2 = '#sfirstname2#',
			sminame2 = '#sminame2#',
			sssn2 = '#sssn2#',
			shphone2 = '#shphone2#',
			swphone2 = '#swphone2#',
			sext2 = '#sext2#',
			pname = '#pname#',
			pphone = '#pphone#',
			pext = '#pext#',
			pfax = '#pfax#',
			p_email = '#p_email#',
			oname = '#oname#',
			ophone = '#ophone#',
			oext = '#oext#',
			ofax = '#ofax#',
			o_email = '#o_email#',
			paddress = '#paddress#',
		 pcity = '#pcity#',
		pstate = '#pstate#',
		pzip = '#pzip#',
			pcounty = '#pcounty#',
			plegaldesc = '#plegaldesc#',
			a_comment = '#a_comment#',
			verifyemail = '#verifyemail#',
			verifyemail_2 = '#verifyemail_2#',
			verifyemail_3 = '#verifyemail_3#',
			rptbyemail = '#rptbyemail#',
			duedate = '#duedate#',
			order_date_adjusted = '#order_date_adj#',
			oda_day =  #oda_day#,
			oda_month = #oda_month#,
			oda_year = #oda_year#,
			polender1 = '#polender1#',
			poacctno1 = '#poacctno1#',
			pophone1 = '#pophone1#',
			polender2 = '#polender2#',
			poacctno2 = '#poacctno2#',
			pophone2 = '#pophone2#',
			SearchType =  '#SearchType#',
			Deedtransfer = '#Deedtransfer#',
			Insured = '#Insured#',
			loan_number = '#loan_number#',
			loanamt_float = '#loanamt_float#',
			Purchase = '#Purchase_price#',
			loan_type_111 = '#loan_type_111#',
			loan_program_333 =  '#loan_program_333#',
			prop_use_type = '#prop_use_type#',
			condo_pud = '#condo_pud#'
			WHERE title_id = #rec_id#
			</cfquery>


				<cfif #read_title1.hud_type# eq 1>
			<cfif #hud_type# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_title_pg1
			WHERE Title_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_data2">
			SELECT *
			FROM hud_form_title_pg2
			WHERE Title_ID = #rec_id#
		</CFQUERY>


<cfif #read_data2.a_1501_b# neq "">

<cfset a_104_b = #read_data2.a_1501_b#>
<cfset a_1501_b = "0">
<cfelse>
<cfset a_104_b = "0">
<cfset a_1501_b = "0">
</cfif>
			<cfif #read_data2.a_1502_b# neq "">
			<cfset a_105_b = #read_data2.a_1502_b#>
			<cfset a_1502_b = "0">
			<cfelse>
			<cfset a_105_b = "0">
			<cfset a_1502_b = "0">
			</cfif>

				<cfif #read_data2.a_1501_b# neq "">
			<cfset a_1501_b = #read_data2.a_1501_b#>

			<cfelse>
			<cfset a_1501_b = "0">
			</cfif>
				<cfif #read_data2.a_1502_b# neq "">
			<cfset a_1502_b = #read_data2.a_1502_b#>

			<cfelse>
			<cfset a_1502_b = "0">
			</cfif>


<cfif #read_data2.a_1308_b# neq "">
	<CFSET a_1308_b = #read_data2.a_1308_b# - #a_1501_b# - #a_1502_b#>
	<CFSET a_1520 = #read_data2.a_1520# - #a_1501_b# - #a_1502_b#>
	<cfelse>
	<CFSET a_1308_b = "0">
	<CFSET a_1520 = "0">
	</cfif>

		<cfif #read_data2.a_1400_a# neq "">
	<CFSET a_1400_a = #read_data2.a_1400_a#>
	<cfelse>
	<CFSET a_1400_a = "0">
	</cfif>
	<CFSET a_1400_a = #a_1400_a# + #a_1308_b#>
		<CFSET a_103 = #a_1400_a#>
<CFSET a_120 = #a_103# + #a_104_b# + #a_105_b#>
<CFSET a_301 = #a_120#>
<CFSET a_220 = #read_data.a_302#>
<CFSET a_201 = #read_data.a_1601#>
<CFSET a_302 = #a_220#>
<cfif #a_301# EQ "">
<CFSET a_301 = "0">
</CFIF>
<cfif #a_302# EQ "">
<CFSET a_302 = "0">
</CFIF>
<cfif #read_data2.a_1308_b# neq "">
<CFSET a_303 = #a_301# - #a_302# + #a_1308_b#>
	<cfelse>
	<CFSET a_303 = #a_301# - #a_302#>
	</cfif>
	<cfif #a_1501_b# eq 0>
			<cfset a_1501_b = "">
			</cfif>
			<cfif #a_1501_b# eq 0>
			<cfset a_1501_b = "">
			</cfif>
<CFQUERY datasource="#request.dsn#" >
				UPDATE hud_form_title_pg1
				SET
				a_104_a = '#read_data.a_104_a#',
				a_105_a = '#read_data.a_105_a#',
				a_104_b = '#a_104_b#',
				a_105_b = '#a_105_b#',
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
				a_1308_b = '#a_1308_b#',
				a_1400_a = '#a_1400_a#',
				a_1501_b = '#a_1501_b#',
				a_1502_b = '#a_1502_b#',
				a_1520 = '#a_1520#'

				WHERE title_id = #rec_id#
			</CFQUERY>


			<cfquery  datasource="#request.dsn#">
			UPDATE TITLE
			SET hud_type = '#hud_type#'
			WHERE title_id = #rec_id#
			</cfquery>
			</cfif>
			</cfif>


			<cfif #read_title1.searchtype# neq "purchase">
			<cfif #read_title1.piggy# neq 1>
			<cfif #read_title1.hud_type# eq 0>
			<cfif #hud_type# eq 1>
			<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_title_pg1
			WHERE Title_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_data2">
			SELECT *
			FROM hud_form_title_pg2
			WHERE Title_ID = #rec_id#
		</CFQUERY>


<cfif #read_data.a_104_b# neq "" and #read_data.a_105_b# eq "">
<cfif #read_data2.a_1501_b# eq "">
<cfset a_1501_b = #read_data.a_104_b#>
<cfset a_1502_b = #read_data2.a_1502_b#>
<cfset a_1503_b = #read_data2.a_1503_b#>
<cfset a_1504_b = #read_data2.a_1504_b#>
<cfset a_1505_b = #read_data2.a_1505_b#>
<cfset a_1506_b = #read_data2.a_1506_b#>
<cfset a_1507_b = #read_data2.a_1507_b#>
<cfset a_1508_b = #read_data2.a_1508_b#>
<cfset a_1509_b = #read_data2.a_1509_b#>
<cfset a_1510_b = #read_data2.a_1510_b#>
<cfset a_1511_b = #read_data2.a_1511_b#>
<cfset a_1512_b = #read_data2.a_1512_b#>
<cfset a_1513_b = #read_data2.a_1513_b#>
<cfset a_1514_b = #read_data2.a_1514_b#>
<cfset a_1515_b = #read_data2.a_1515_b#>
<cfset a_1516_b = #read_data2.a_1516_b#>
<cfset a_1517_b = #read_data2.a_1517_b#>
<cfset a_1518_b = #read_data2.a_1518_b#>
<cfelse>
<cfset a_1502_b = #read_data2.a_1501_b#>
<cfset a_1503_b = #read_data2.a_1502_b#>
<cfset a_1504_b = #read_data2.a_1503_b#>
<cfset a_1505_b = #read_data2.a_1504_b#>
<cfset a_1506_b = #read_data2.a_1505_b#>
<cfset a_1507_b = #read_data2.a_1506_b#>
<cfset a_1508_b = #read_data2.a_1509_b#>
<cfset a_1509_b = #read_data2.a_1510_b#>
<cfset a_1510_b = #read_data2.a_1511_b#>
<cfset a_1511_b = #read_data2.a_1512_b#>
<cfset a_1512_b = #read_data2.a_1513_b#>
<cfset a_1513_b = #read_data2.a_1514_b#>
<cfset a_1514_b = #read_data2.a_1515_b#>
<cfset a_1515_b = #read_data2.a_1516_b#>
<cfset a_1516_b = #read_data2.a_1517_b#>
<cfset a_1517_b = #read_data2.a_1518_b#>
<cfset a_1518_b = #read_data2.a_1519_b#>
<cfset a_1501_b = #read_data.a_104_b#>
</cfif>
<cfelseif #read_data.a_104_b# eq "" and #read_data.a_105_b# neq "">
<cfif #read_data2.a_1501_b# eq "">
<cfset a_1501_b = #read_data.a_105_b#>
<cfset a_1502_b = #read_data2.a_1502_b#>
<cfset a_1503_b = #read_data2.a_1503_b#>
<cfset a_1504_b = #read_data2.a_1504_b#>
<cfset a_1505_b = #read_data2.a_1505_b#>
<cfset a_1506_b = #read_data2.a_1506_b#>
<cfset a_1507_b = #read_data2.a_1507_b#>
<cfset a_1508_b = #read_data2.a_1508_b#>
<cfset a_1509_b = #read_data2.a_1509_b#>
<cfset a_1510_b = #read_data2.a_1510_b#>
<cfset a_1511_b = #read_data2.a_1511_b#>
<cfset a_1512_b = #read_data2.a_1512_b#>
<cfset a_1513_b = #read_data2.a_1513_b#>
<cfset a_1514_b = #read_data2.a_1514_b#>
<cfset a_1515_b = #read_data2.a_1515_b#>
<cfset a_1516_b = #read_data2.a_1516_b#>
<cfset a_1517_b = #read_data2.a_1517_b#>
<cfset a_1518_b = #read_data2.a_1518_b#>
<cfelse>
<cfset a_1502_b = #read_data2.a_1501_b#>
<cfset a_1503_b = #read_data2.a_1502_b#>
<cfset a_1504_b = #read_data2.a_1503_b#>
<cfset a_1505_b = #read_data2.a_1504_b#>
<cfset a_1506_b = #read_data2.a_1505_b#>
<cfset a_1507_b = #read_data2.a_1506_b#>
<cfset a_1508_b = #read_data2.a_1509_b#>
<cfset a_1509_b = #read_data2.a_1510_b#>
<cfset a_1510_b = #read_data2.a_1511_b#>
<cfset a_1511_b = #read_data2.a_1512_b#>
<cfset a_1512_b = #read_data2.a_1513_b#>
<cfset a_1513_b = #read_data2.a_1514_b#>
<cfset a_1514_b = #read_data2.a_1515_b#>
<cfset a_1515_b = #read_data2.a_1516_b#>
<cfset a_1516_b = #read_data2.a_1517_b#>
<cfset a_1517_b = #read_data2.a_1518_b#>
<cfset a_1518_b = #read_data2.a_1519_b#>
<cfset a_1501_b = #read_data.a_105_b#>
</cfif>

<cfelseif #read_data.a_104_b# neq "" and #read_data.a_105_b# neq "">
<cfif #read_data2.a_1501_b# eq "" and #read_data2.a_1502_b# eq "">
<cfset a_1501_b = #read_data.a_104_b#>
<cfset a_1502_b = #read_data.a_105_b#>
<cfset a_1503_b = #read_data2.a_1503_b#>
<cfset a_1504_b = #read_data2.a_1504_b#>
<cfset a_1505_b = #read_data2.a_1505_b#>
<cfset a_1506_b = #read_data2.a_1506_b#>
<cfset a_1507_b = #read_data2.a_1507_b#>
<cfset a_1508_b = #read_data2.a_1508_b#>
<cfset a_1509_b = #read_data2.a_1509_b#>
<cfset a_1510_b = #read_data2.a_1510_b#>
<cfset a_1511_b = #read_data2.a_1511_b#>
<cfset a_1512_b = #read_data2.a_1512_b#>
<cfset a_1513_b = #read_data2.a_1513_b#>
<cfset a_1514_b = #read_data2.a_1514_b#>
<cfset a_1515_b = #read_data2.a_1515_b#>
<cfset a_1516_b = #read_data2.a_1516_b#>
<cfset a_1517_b = #read_data2.a_1517_b#>
<cfset a_1518_b = #read_data2.a_1518_b#>
<cfelse>
<cfset a_1503_b = #read_data2.a_1501_b#>
<cfset a_1504_b = #read_data2.a_1502_b#>
<cfset a_1505_b = #read_data2.a_1503_b#>
<cfset a_1506_b = #read_data2.a_1504_b#>
<cfset a_1507_b = #read_data2.a_1505_b#>
<cfset a_1508_b = #read_data2.a_1506_b#>
<cfset a_1509_b = #read_data2.a_1507_b#>
<cfset a_1510_b = #read_data2.a_1508_b#>
<cfset a_1511_b = #read_data2.a_1509_b#>
<cfset a_1512_b = #read_data2.a_1510_b#>
<cfset a_1513_b = #read_data2.a_1511_b#>
<cfset a_1514_b = #read_data2.a_1512_b#>
<cfset a_1515_b = #read_data2.a_1513_b#>
<cfset a_1516_b = #read_data2.a_1514_b#>
<cfset a_1517_b = #read_data2.a_1515_b#>
<cfset a_1518_b = #read_data2.a_1516_b#>
<cfset a_1501_b = #read_data.a_104_b#>
<cfset a_1502_b = #read_data.a_105_b#>
</cfif>

<cfelse>
<cfset a_1501_b = #read_data2.a_1501_b#>
<cfset a_1502_b = #read_data2.a_1502_b#>
<cfset a_1503_b = #read_data2.a_1503_b#>
<cfset a_1504_b = #read_data2.a_1504_b#>
<cfset a_1505_b = #read_data2.a_1505_b#>
<cfset a_1506_b = #read_data2.a_1506_b#>
<cfset a_1507_b = #read_data2.a_1507_b#>
<cfset a_1508_b = #read_data2.a_1508_b#>
<cfset a_1509_b = #read_data2.a_1509_b#>
<cfset a_1510_b = #read_data2.a_1510_b#>
<cfset a_1511_b = #read_data2.a_1511_b#>
<cfset a_1512_b = #read_data2.a_1512_b#>
<cfset a_1513_b = #read_data2.a_1513_b#>
<cfset a_1514_b = #read_data2.a_1514_b#>
<cfset a_1515_b = #read_data2.a_1515_b#>
<cfset a_1516_b = #read_data2.a_1516_b#>
<cfset a_1517_b = #read_data2.a_1517_b#>
<cfset a_1518_b = #read_data2.a_1518_b#>
</cfif>



		<cfif #read_data2.a_1308_b# neq "">

	<CFSET a_1400_a = #read_data2.a_1400_a# - #read_data2.a_1308_b#>
	<CFSET a_1308_b = #read_data2.a_1308_b#>
	<cfelse>
	<CFSET a_1400_a = #read_data2.a_1400_a#>
	<CFSET a_1308_b = 0>
	</cfif>

	<cfif #read_data.a_104_b# eq "">
			<cfset a_104_b = "0">
			</cfif>
			<cfif #read_data.a_105_b# eq "">
			<cfset a_105_b = "0">
			</cfif>

	<cfif #read_data.a_104_b# neq "" and #read_data.a_105_b# neq "">
	<CFSET a_1308_b = #a_1308_b# + #read_data.a_104_b# + #read_data.a_105_b#>
	<CFSET a_1520 = #read_data2.a_1520# + #read_data.a_104_b# + #read_data.a_105_b#>
<cfelseif #read_data.a_104_b# neq "" and #read_data.a_105_b# eq "">
	<CFSET a_1308_b = #a_1308_b# + #read_data.a_104_b#>
	<CFSET a_1520 = #read_data2.a_1520# + #read_data.a_104_b#>
	<cfelseif #read_data.a_104_b# eq "" and #read_data.a_105_b# neq "">
	<CFSET a_1308_b = #a_1308_b# + #read_data.a_105_b#>
	<CFSET a_1520 = #read_data2.a_1520# + #read_data.a_105_b#>
	<cfelse>
	<CFSET a_1308_b = #a_1308_b#>
	<CFSET a_1520 = #read_data2.a_1520#>
	</cfif>


	<CFSET a_103 = #a_1400_a#>
	<cfif 	#read_data.a_201# neq "">
<CFSET a_1601 = #read_data.a_201#>
<cfelse>
<CFSET a_1601 = 0>
</cfif>
<cfif #a_103# eq "">
<cfset #a_103# = "0">
</cfif>
<CFSET a_302 = #loanamt_float#>

<CFSET a_303 = #a_302# + #a_1601# - #a_1308_b# - #a_103#>




<CFQUERY datasource="#request.dsn#" >
				UPDATE hud_form_title_pg1
				SET

				a_103 = '#a_103#',
				a_1601 = '#a_1601#',
				a_302 = '#a_302#',
				a_303 = '#a_303#'
				WHERE title_id = #rec_id#
			</CFQUERY>

			<CFQUERY datasource="#request.dsn#" >
				UPDATE hud_form_title_pg2
				SET
				a_1308_b = '#a_1308_b#',
				a_1400_a = '#a_1400_a#',
				a_1501_b = '#a_1501_b#',
				a_1502_b = '#a_1502_b#',

a_1503_b	= '#a_1503_b#',

a_1504_b	= '#a_1504_b#',

a_1505_b	= '#a_1505_b#',

a_1506_b	= '#a_1506_b#',

a_1507_b	= '#a_1507_b#',

a_1508_b	= '#a_1508_b#',

a_1509_b	= '#a_1509_b#',

a_1510_b	= '#a_1510_b#',

a_1511_b	= '#a_1511_b#',

a_1512_b	= '#a_1512_b#',

a_1513_b	= '#a_1513_b#',

a_1514_b	= '#a_1514_b#',

a_1515_b	= '#a_1515_b#',

a_1516_b	= '#a_1516_b#',

a_1517_b	= '#a_1517_b#',

a_1518_b	= '#a_1518_b#',


				a_1520 = '#a_1520#'

				WHERE title_id = #rec_id#
			</CFQUERY>	<cfquery  datasource="#request.dsn#">
			UPDATE TITLE
			SET hud_type = '#hud_type#'
			WHERE title_id = #rec_id#
			</cfquery>
			</cfif>
			</cfif>
</cfif></cfif>





<CFQUERY datasource="#request.dsn#" >
				UPDATE hud_form_title_pg1
				SET
				a_1 = '#loan_type_111#'
				WHERE title_id = #rec_id#
			</CFQUERY>

<cfelse>




<cfquery  datasource="#request.dsn#">
			UPDATE TITLE
			SET blastname1 = '#blastname1#',
			bfirstname1 = '#bfirstname1#',
			bminame1 = '#bminame1#',
			bssn1 = '#bssn1#',
			bhphone1 = '#bhphone1#',
			bwphone1 = '#bwphone1#',
			bext1 = '#bext1#',
			blastname2 = '#blastname2#',
			bfirstname2 = '#bfirstname2#',
			bminame2 = '#bminame2#',
			bssn2 = '#bssn2#',
			bhphone2 = '#bhphone2#',
			bwphone2 = '#bwphone2#',
			bext2 = '#bext2#',
			slastname1 =  '#slastname1#',
			sfirstname1 = '#sfirstname1#',
			sminame1 =  '#sminame1#',
			sssn1 =  '#sssn1#',
			shphone1 = '#shphone1#',
			swphone1 = '#swphone1#',
			sext1 = '#sext1#',
			slastname2 = '#slastname2#',
			sfirstname2 = '#sfirstname2#',
			sminame2 = '#sminame2#',
			sssn2 = '#sssn2#',
			shphone2 = '#shphone2#',
			swphone2 = '#swphone2#',
			sext2 = '#sext2#',
			pname = '#pname#',
			pphone = '#pphone#',
			pext = '#pext#',
			pfax = '#pfax#',
			p_email = '#p_email#',
			oname = '#oname#',
			ophone = '#ophone#',
			oext = '#oext#',
			ofax = '#ofax#',
			o_email = '#o_email#',
			paddress = '#paddress#',
		    pcity = '#pcity#',
		    pstate = '#pstate#',
			pzip = '#pzip#',
			pcounty = '#pcounty#',
			plegaldesc = '#plegaldesc#',
			a_comment = '#a_comment#',
			verifyemail = '#verifyemail#',
			verifyemail_2 = '#verifyemail_2#',
			verifyemail_3 = '#verifyemail_3#',
			rptbyemail = '#rptbyemail#',
			duedate = '#duedate#',
			order_date_adjusted = '#order_date_adj#',
			oda_day =  #oda_day#,
			oda_month = #oda_month#,
			oda_year = #oda_year#,
			polender1 = '#polender1#',
			poacctno1 = '#poacctno1#',
			pophone1 = '#pophone1#',
			polender2 = '#polender2#',
			poacctno2 = '#poacctno2#',
			pophone2 = '#pophone2#',
			SearchType =  '#SearchType#',
			Deedtransfer = '#Deedtransfer#',
			Insured = '#Insured#',
			loanamt_float = '#loanamt_float#',
			loan_number = '#loan_number#',
			Purchase = '#Purchase_price#',
			loan_type_111 = '#loan_type_111#',
			loan_program_333 =  '#loan_program_333#',
			prop_use_type = '#prop_use_type#',
			condo_pud = '#condo_pud#'
			WHERE title_id = #rec_id#
			</cfquery>



			<CFQUERY datasource="#request.dsn#" >
				UPDATE hud_form_title_pg1
				SET
				a_1 = '#loan_type_111#'
				WHERE title_id = #rec_id#
			</CFQUERY>

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


</cfif>
<!--- ===/ Here is where we check to see    \=== --->
<!--- ===/ if they changed the state of the \=== --->
<!--- ===/ do_appraisal field               \=== --->



		<CFLOCATION URL="https://#cgi.server_name#/title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#">



