
<CFPARAM NAME="hud_type" DEFAULT="">
<!--------------------



------------------------->

<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>



				<cfif #read_title.hud_type# eq 1>
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

			<cfif #read_data2.a_1520# neq "">
			<cfset a_1520 = #read_data2.a_1520#>

			<cfelse>
			<cfset a_1520 = "0">
			</cfif>

<cfif #read_data2.a_1308_b# neq "">
	<CFSET a_1308_b = #read_data2.a_1308_b# - #a_1501_b# - #a_1502_b#>
	<CFSET a_1520 = #a_1520# - #a_1501_b# - #a_1502_b#>
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



			<cfif #read_title.searchtype# neq "purchase">
			<cfif #read_title.piggy# neq 1>
			<cfif #read_title.hud_type# eq 0>
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

<CFSET a_302 = #read_title.loanamt_float#>

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
			</CFQUERY>
			<cfquery  datasource="#request.dsn#">
			UPDATE TITLE
			SET hud_type = '#hud_type#'
			WHERE title_id = #rec_id#
			</cfquery>
			</cfif>
			</cfif>
</cfif>

			</cfif>







		<CFLOCATION URL="https://#cgi.server_name#/title_report_navu.cfm?comp_id=#comp_id#&user_id_1=#user_id_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=10&company_id=#company_id#">



