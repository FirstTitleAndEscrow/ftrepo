
<cfparam name="a_trigger" default="0">
<cfparam name="uid" default="">
<cfparam name="al" default="">
<cfparam name="a_103" default="">
<cfparam name="a_104_a" default="">
<cfparam name="a_104_b" default="">
<cfparam name="a_105_a" default="">
<cfparam name="a_1601" default="">
<cfparam name="a_105_b" default="">
<cfparam name="a_120" default="">
<cfparam name="a_504" default="">
<cfparam name="a_505" default="">
<cfparam name="a_301" default="">
<cfparam name="a_302" default="">
<cfparam name="a_303" default="">
<cfparam name="a_801_a" default="">
<cfparam name="a_801_b" default="">
<cfparam name="a_801_d" default="">
<cfparam name="a_802_a" default="">
<cfparam name="a_802_b" default="">
<cfparam name="a_802_d" default="">
<cfparam name="a_803_a" default="">
<cfparam name="a_803_b" default="">
<cfparam name="a_804_a" default="">
<cfparam name="a_804_b" default="">
<cfparam name="a_805_a" default="">
<cfparam name="a_805_b" default="">
<cfparam name="a_806_a" default="">
<cfparam name="a_806_b" default="">
<cfparam name="a_807_a" default="">
<cfparam name="a_807_b" default="">
<cfparam name="a_808_a" default="">
<cfparam name="a_808_b" default="">
<cfparam name="a_809_a" default="">
<cfparam name="a_809_b" default="">
<cfparam name="a_810_a" default="">
<cfparam name="a_810_b" default="">
<cfparam name="a_811_a" default="">
<cfparam name="a_811_b" default="">
<cfparam name="a_901_a" default="">
<cfparam name="a_901_b" default="">
<cfparam name="a_901_c" default="">
<cfparam name="a_901_d" default="">
<cfparam name="a_902_a" default="">
<cfparam name="a_902_b" default="">
<cfparam name="a_902_c" default="">
<cfparam name="a_903_a" default="">
<cfparam name="a_903_b" default="">
<cfparam name="a_903_c" default="">
<cfparam name="a_904_a" default="">
<cfparam name="a_904_b" default="">
<cfparam name="a_905_a" default="">
<cfparam name="a_1006_a" default="">
<cfparam name="a_1001_a" default="">
<cfparam name="a_1001_b" default="">
<cfparam name="a_1001_c" default="">
<cfparam name="a_1002_a" default="">
<cfparam name="a_1002_b" default="">
<cfparam name="a_1002_c" default="">
<cfparam name="a_1003_a" default="">
<cfparam name="a_1003_b" default="">
<cfparam name="a_1003_c" default="">
<cfparam name="a_1004_a" default="">
<cfparam name="a_1004_b" default="">
<cfparam name="a_1004_c" default="">
<cfparam name="a_1005_a" default="">
<cfparam name="a_1005_b" default="">
<cfparam name="a_1005_c" default="">
<cfparam name="a_1400_a" default="">
<cfparam name="a_1501_a" default="">
<cfparam name="a_1501_b" default="">
<cfparam name="a_1501_c" default="">
<cfparam name="a_1502_a" default="">
<cfparam name="a_1502_b" default="">
<cfparam name="a_1502_c" default="">
<cfparam name="a_1503_a" default="">
<cfparam name="a_1503_b" default="">
<cfparam name="a_1503_c" default="">
<cfparam name="a_1504_a" default="">
<cfparam name="a_1504_b" default="">
<cfparam name="a_1504_c" default="">
<cfparam name="a_1505_a" default="">
<cfparam name="a_1505_b" default="">
<cfparam name="a_1505_c" default="">
<cfparam name="a_1506_a" default="">
<cfparam name="a_1506_b" default="">
<cfparam name="a_1506_c" default="">
<cfparam name="a_1507_a" default="">
<cfparam name="a_1507_b" default="">
<cfparam name="a_1507_c" default="">
<cfparam name="a_1508_a" default="">
<cfparam name="a_1508_b" default="">
<cfparam name="a_1508_c" default="">
<cfparam name="a_1509_a" default="">
<cfparam name="a_1509_b" default="">
<cfparam name="a_1509_c" default="">
<cfparam name="a_1510_a" default="">
<cfparam name="a_1510_b" default="">
<cfparam name="a_1510_c" default="">
<cfparam name="a_1511_a" default="">
<cfparam name="a_1511_b" default="">
<cfparam name="a_1511_c" default="">
<cfparam name="a_1512_a" default="">
<cfparam name="a_1512_b" default="">
<cfparam name="a_1512_c" default="">
<cfparam name="a_1513_a" default="">
<cfparam name="a_1513_b" default="">
<cfparam name="a_1513_c" default="">
<cfparam name="a_1514_a" default="">
<cfparam name="a_1514_b" default="">
<cfparam name="a_1514_c" default="">
<cfparam name="a_1515_a" default="">
<cfparam name="a_1515_b" default="">
<cfparam name="a_1515_c" default="">
<cfparam name="a_1516_a" default="">
<cfparam name="a_1516_b" default="">
<cfparam name="a_1516_c" default="">
<cfparam name="a_1517_a" default="">
<cfparam name="a_1517_b" default="">
<cfparam name="a_1517_c" default="">
<cfparam name="a_1518_a" default="">
<cfparam name="a_1518_b" default="">
<cfparam name="a_1518_c" default="">
<cfparam name="a_1519_a" default="">
<cfparam name="a_1519_b" default="">
<cfparam name="a_1519_c" default="">
<cfparam name="a_1520" default="">
<cfparam name="a_1520_a" default="">


<CFQUERY datasource="#request.dsn#" NAME="RU">
	select * from first_admin

			WHERE ID = #session.ft_user_id#
</CFQUERY>



	<CFQUERY datasource="#request.dsn#" NAME="read_hud1_before">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id#
	</cfquery>
	<CFQUERY datasource="#request.dsn#" NAME="read_hud2_before">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id#
	</cfquery>

<CFQUERY datasource="#request.dsn#">
			UPDATE property
			SET
			loan_number = '#loan_number#'

			WHERE prop_id = #rec_id#
			</cfquery>


	<CFQUERY datasource="#request.dsn#">
			UPDATE hud_form_prop_pg1
			SET
			a_103 = '#a_103#',
			a_1601 = '#a_1601#',
			a_302 = '#a_302#',
			a_303 = '#a_303#',
			I_SettlementDate = '#i_settlementDate#'
			WHERE prop_id = #rec_id#
			</cfquery>

<CFQUERY datasource="#request.dsn#">
			UPDATE hud_form_prop_pg2
			SET a_801_a = '#a_801_a#',
			a_801_b = '#a_801_b#',
			a_801_d = '#a_801_d#',
			a_802_a = '#a_802_a#',
			a_802_b = '#a_802_b#',
			a_802_d = '#a_802_d#',
			a_803_a = '#a_803_a#',
			a_803_b = '#a_803_b#',
			a_805_a = '#a_805_a#',
			a_805_b = '#a_805_b#',
			a_805_c = '#a_805_c#',
			a_806_a = '#a_806_a#',
			a_806_b = '#a_806_b#',
			a_806_c = '#a_806_c#',
			a_807_a = '#a_807_a#',
			a_807_b = '#a_807_b#',
			a_807_c = '#a_807_c#',
			a_808_a = '#a_808_a#',
			a_808_b = '#a_808_b#',
			a_808_c = '#a_808_c#',
			a_809_a = '#a_809_a#',
			a_809_b = '#a_809_b#',
			a_809_c = '#a_809_c#',
			a_810_a = '#a_810_a#',
			a_810_b = '#a_810_b#',
			a_810_c = '#a_810_c#',
			a_811_a = '#a_811_a#',
			a_811_b = '#a_811_b#',
			a_811_c = '#a_811_c#',
			a_901_a = '#a_901_a#',
			a_901_b = '#a_901_b#',
			a_901_c = '#a_901_c#',
			a_901_d= '#a_901_d#',
			a_902_a = '#a_902_a#',
			a_902_b = '#a_902_b#',
			a_902_c = '#a_902_c#',
			a_903_a = '#a_903_a#',
			a_903_b = '#a_903_b#',
			a_903_c = '#a_903_c#',
			a_904_a = '#a_904_a#',
			a_904_b = '#a_904_b#',
			a_904_c = '#a_904_c#',
			a_905_a = '#a_905_a#',
			a_1006_a = '#a_1006_a#',
			a_1001_a = '#a_1001_a#',
			a_1001_b = '#a_1001_b#',
			a_1001_c = '#a_1001_c#',
			a_1002_a = '#a_1002_a#',
			a_1002_b = '#a_1002_b#',
			a_1002_c = '#a_1002_c#',
			a_1003_a = '#a_1003_a#',
			a_1003_b = '#a_1003_b#',
			a_1003_c = '#a_1003_c#',
			a_1004_a = '#a_1004_a#',
			a_1004_b = '#a_1004_b#',
			a_1004_c = '#a_1004_c#',
			a_1005_a = '#a_1005_a#',
			a_1005_b = '#a_1005_b#',
			a_1005_c = '#a_1005_c#',
			a_1308_b = '#a_1308_b#',
			a_1400_a = '#a_1400_a#',
a_1501_a =	'#a_1501_a#',
a_1501_b	= '#a_1501_b#',
a_1502_a	= '#a_1502_a#',
a_1502_b	= '#a_1502_b#',
a_1503_a	= '#a_1503_a#',
a_1503_b	= '#a_1503_b#',
a_1504_a	= '#a_1504_a#',
a_1504_b	= '#a_1504_b#',
a_1505_a	= '#a_1505_a#',
a_1505_b	= '#a_1505_b#',
a_1506_a	= '#a_1506_a#',
a_1506_b	= '#a_1506_b#',
a_1507_a	= '#a_1507_a#',
a_1507_b	= '#a_1507_b#',
a_1508_a	= '#a_1508_a#',
a_1508_b	= '#a_1508_b#',
a_1509_a	= '#a_1509_a#',
a_1509_b	= '#a_1509_b#',
a_1510_a	= '#a_1510_a#',
a_1510_b	= '#a_1510_b#',
a_1511_a	= '#a_1511_a#',
a_1511_b	= '#a_1511_b#',
a_1512_a	= '#a_1512_a#',
a_1512_b	= '#a_1512_b#',
a_1513_a	= '#a_1513_a#',
a_1513_b	= '#a_1513_b#',
a_1514_a	= '#a_1514_a#',
a_1514_b	= '#a_1514_b#',
a_1515_a	= '#a_1515_a#',
a_1515_b	= '#a_1515_b#',
a_1516_a	= '#a_1516_a#',
a_1516_b	= '#a_1516_b#',
a_1517_a	= '#a_1517_a#',
a_1517_b	= '#a_1517_b#',
a_1518_a	= '#a_1518_a#',
a_1518_b	= '#a_1518_b#',
a_1519_a	= '#a_1519_a#',
a_1519_b	= '#a_1519_b#',
a_1520	= '#a_1520#'


			WHERE prop_id = #rec_id#
			</cfquery>
	<CFQUERY datasource="#request.dsn#" NAME="readhud2_after">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id#
	</cfquery>

		<CFQUERY datasource="#request.dsn#" NAME="readhud1_after">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id#
	</cfquery>
	 <CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
			 <CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_103">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id# and a_103 != '#read_hud1_before.a_103#'
	</cfquery>
   <cfif #read_hud1_a_103.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_103, a103, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_103#', '#readhud1_after.a_103#', '#c_date#', '#c_time#', '#RU.fname#', '#RU.lname#')

</cfquery>

</cfif>
  <CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_104_a">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id# and a_104_a != '#read_hud1_before.a_104_a#'
	</cfquery>
   <cfif #read_hud1_a_104_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_104_a, a104_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_104_a#', '#readhud1_after.a_104_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
  <CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_104_b">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id# and a_104_b != '#read_hud1_before.a_104_b#'
	</cfquery>
   <cfif #read_hud1_a_104_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_104_b, a104_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_104_b#', '#readhud1_after.a_104_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_105_a">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id# and a_105_a != '#read_hud1_before.a_105_a#'
	</cfquery>
   <cfif #read_hud1_a_105_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_105_a, a105_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_105_a#', '#readhud1_after.a_105_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_105_b">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id# and a_105_b != '#read_hud1_before.a_105_b#'
	</cfquery>
   <cfif #read_hud1_a_105_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_105_b, a105_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_105_b#', '#readhud1_after.a_105_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_301">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id# and a_301 != '#read_hud1_before.a_301#'
	</cfquery>
   <cfif #read_hud1_a_301.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_301, a301, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_301#', '#readhud1_after.a_301#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_302">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id# and a_302 != '#read_hud1_before.a_302#'
	</cfquery>
   <cfif #read_hud1_a_302.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_302, a302, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_302#', '#readhud1_after.a_302#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_303">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id# and a_303 != '#read_hud1_before.a_303#'
	</cfquery>
   <cfif #read_hud1_a_303.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_303, a303, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_303#', '#readhud1_after.a_303#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_504">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id# and a_504 != '#read_hud1_before.a_504#'
	</cfquery>
   <cfif #read_hud1_a_504.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_504, a504, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_504#', '#readhud1_after.a_504#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_505">
			Select * from hud_form_prop_pg1
			WHERE prop_id = #rec_id# and a_505 != '#read_hud1_before.a_505#'
	</cfquery>
   <cfif #read_hud1_a_505.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_505, a505, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_505#', '#readhud1_after.a_505#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>




   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_801_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_801_a != '#read_hud2_before.a_801_a#'
	</cfquery>
   <cfif #read_hud2_a_801_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_801_a, a801_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_801_a#', '#readhud2_after.a_801_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_801_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_801_b != '#read_hud2_before.a_801_b#'
	</cfquery>
   <cfif #read_hud2_a_801_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_801_b, a801_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_801_b#', '#readhud2_after.a_801_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_801_d">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_801_d != '#read_hud2_before.a_801_d#'
	</cfquery>
   <cfif #read_hud2_a_801_d.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_801_d, a801_d, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_801_d#', '#readhud2_after.a_801_d#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_802_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_802_a != '#read_hud2_before.a_802_a#'
	</cfquery>
   <cfif #read_hud2_a_802_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_802_a, a802_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_802_a#', '#readhud2_after.a_802_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_802_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_802_b != '#read_hud2_before.a_802_b#'
	</cfquery>
   <cfif #read_hud2_a_802_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_802_b, a802_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_802_b#', '#readhud2_after.a_802_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_802_d">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_802_d != '#read_hud2_before.a_802_d#'
	</cfquery>
   <cfif #read_hud2_a_802_d.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_802_d, a802_d, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_802_d#', '#readhud2_after.a_802_d#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_803_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_803_a != '#read_hud2_before.a_803_a#'
	</cfquery>
   <cfif #read_hud2_a_803_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_803_a, a803_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_803_a#', '#readhud2_after.a_803_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

  <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_803_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_803_b != '#read_hud2_before.a_803_b#'
	</cfquery>
   <cfif #read_hud2_a_803_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_803_b, a803_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_803_b#', '#readhud2_after.a_803_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

  <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_804_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_804_a != '#read_hud2_before.a_804_a#'
	</cfquery>
   <cfif #read_hud2_a_804_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_804_a, a804_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_804_a#', '#readhud2_after.a_804_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

  <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_804_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_804_b != '#read_hud2_before.a_804_b#'
	</cfquery>
   <cfif #read_hud2_a_804_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_804_b, a804_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_804_b#', '#readhud2_after.a_804_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_805_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_805_a != '#read_hud2_before.a_805_a#'
	</cfquery>
   <cfif #read_hud2_a_805_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_805_a, a805_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_805_a#', '#readhud2_after.a_805_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_805_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_805_b != '#read_hud2_before.a_805_b#'
	</cfquery>
   <cfif #read_hud2_a_805_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_805_b, a805_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_805_b#', '#readhud2_after.a_805_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_806_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_806_a != '#read_hud2_before.a_806_a#'
	</cfquery>
   <cfif #read_hud2_a_806_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_806_a, a806_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_806_a#', '#readhud2_after.a_806_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_806_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_806_b != '#read_hud2_before.a_806_b#'
	</cfquery>
   <cfif #read_hud2_a_806_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_806_b, a806_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_806_b#', '#readhud2_after.a_806_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_807_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_807_a != '#read_hud2_before.a_807_a#'
	</cfquery>
   <cfif #read_hud2_a_807_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_807_a, a807_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_807_a#', '#readhud2_after.a_807_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_807_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_807_b != '#read_hud2_before.a_807_b#'
	</cfquery>
   <cfif #read_hud2_a_807_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_807_b, a807_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_807_b#', '#readhud2_after.a_807_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_808_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_808_a != '#read_hud2_before.a_808_a#'
	</cfquery>
   <cfif #read_hud2_a_808_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_808_a, a808_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_808_a#', '#readhud2_after.a_808_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_808_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_808_b != '#read_hud2_before.a_808_b#'
	</cfquery>
   <cfif #read_hud2_a_808_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_808_b, a808_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_808_b#', '#readhud2_after.a_808_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_809_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_809_a != '#read_hud2_before.a_809_a#'
	</cfquery>
   <cfif #read_hud2_a_809_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_809_a, a809_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_809_a#', '#readhud2_after.a_809_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_809_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_809_b != '#read_hud2_before.a_809_b#'
	</cfquery>
   <cfif #read_hud2_a_809_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_809_b, a809_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_809_b#', '#readhud2_after.a_809_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_810_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_810_a != '#read_hud2_before.a_810_a#'
	</cfquery>
   <cfif #read_hud2_a_810_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_810_a, a810_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_810_a#', '#readhud2_after.a_810_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_810_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_810_b != '#read_hud2_before.a_810_b#'
	</cfquery>
   <cfif #read_hud2_a_810_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_810_b, a810_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_810_b#', '#readhud2_after.a_810_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_811_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_811_a != '#read_hud2_before.a_811_a#'
	</cfquery>
   <cfif #read_hud2_a_811_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_811_a, a811_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_811_a#', '#readhud2_after.a_811_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_811_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_811_b != '#read_hud2_before.a_811_b#'
	</cfquery>
   <cfif #read_hud2_a_811_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_811_b, a811_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_811_b#', '#readhud2_after.a_811_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_901_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_901_a != '#read_hud2_before.a_901_a#'
	</cfquery>
   <cfif #read_hud2_a_901_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_901_a, a901_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_901_a#', '#readhud2_after.a_901_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_901_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_901_b != '#read_hud2_before.a_901_b#'
	</cfquery>
   <cfif #read_hud2_a_901_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_901_b, a901_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_901_b#', '#readhud2_after.a_901_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_901_c">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_901_c != '#read_hud2_before.a_901_c#'
	</cfquery>
   <cfif #read_hud2_a_901_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_901_c, a901_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_901_c#', '#readhud2_after.a_901_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_901_d">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_901_d != '#read_hud2_before.a_901_d#'
	</cfquery>
   <cfif #read_hud2_a_901_d.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_901_d, a901_d, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_901_d#', '#readhud2_after.a_901_d#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_902_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_902_a != '#read_hud2_before.a_902_a#'
	</cfquery>
   <cfif #read_hud2_a_902_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_902_a, a902_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_902_a#', '#readhud2_after.a_902_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_902_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_902_b != '#read_hud2_before.a_902_b#'
	</cfquery>
   <cfif #read_hud2_a_902_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_902_b, a902_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_902_b#', '#readhud2_after.a_902_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_902_c">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_902_c != '#read_hud2_before.a_902_c#'
	</cfquery>
   <cfif #read_hud2_a_902_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_902_c, a902_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_902_c#', '#readhud2_after.a_902_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_903_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_903_a != '#read_hud2_before.a_903_a#'
	</cfquery>
   <cfif #read_hud2_a_903_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_903_a, a903_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_903_a#', '#readhud2_after.a_903_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_903_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_903_b != '#read_hud2_before.a_903_b#'
	</cfquery>
   <cfif #read_hud2_a_903_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_903_b, a903_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_903_b#', '#readhud2_after.a_903_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_903_c">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_903_c != '#read_hud2_before.a_903_c#'
	</cfquery>
   <cfif #read_hud2_a_903_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_903_c, a903_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_903_c#', '#readhud2_after.a_903_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_904_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_904_a != '#read_hud2_before.a_904_a#'
	</cfquery>
   <cfif #read_hud2_a_904_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_904_a, a904_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_904_a#', '#readhud2_after.a_904_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_904_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_904_b != '#read_hud2_before.a_904_b#'
	</cfquery>
   <cfif #read_hud2_a_904_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_904_b, a904_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_904_b#', '#readhud2_after.a_904_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_905_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_905_a != '#read_hud2_before.a_905_a#'
	</cfquery>
   <cfif #read_hud2_a_905_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_905_a, a905_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_905_a#', '#readhud2_after.a_905_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1001_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1001_a != '#read_hud2_before.a_1001_a#'
	</cfquery>
   <cfif #read_hud2_a_1001_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1001_a, a1001_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1001_a#', '#readhud2_after.a_1001_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1001_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1001_b != '#read_hud2_before.a_1001_b#'
	</cfquery>
   <cfif #read_hud2_a_1001_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1001_b, a1001_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1001_b#', '#readhud2_after.a_1001_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1001_c">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1001_c != '#read_hud2_before.a_1001_c#'
	</cfquery>
   <cfif #read_hud2_a_1001_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1001_c, a1001_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1001_c#', '#readhud2_after.a_1001_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1002_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1002_a != '#read_hud2_before.a_1002_a#'
	</cfquery>
   <cfif #read_hud2_a_1002_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1002_a, a1002_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1002_a#', '#readhud2_after.a_1002_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1002_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1002_b != '#read_hud2_before.a_1002_b#'
	</cfquery>
   <cfif #read_hud2_a_1002_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1002_b, a1002_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1002_b#', '#readhud2_after.a_1002_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1002_c">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1002_c != '#read_hud2_before.a_1002_c#'
	</cfquery>
   <cfif #read_hud2_a_1002_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1002_c, a1002_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1002_c#', '#readhud2_after.a_1002_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1003_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1003_a != '#read_hud2_before.a_1003_a#'
	</cfquery>
   <cfif #read_hud2_a_1003_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1003_a, a1003_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1003_a#', '#readhud2_after.a_1003_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1003_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1003_b != '#read_hud2_before.a_1003_b#'
	</cfquery>
   <cfif #read_hud2_a_1003_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1003_b, a1003_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1003_b#', '#readhud2_after.a_1003_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1003_c">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1003_c != '#read_hud2_before.a_1003_c#'
	</cfquery>
   <cfif #read_hud2_a_1003_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1003_c, a1003_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1003_c#', '#readhud2_after.a_1003_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1004_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1004_a != '#read_hud2_before.a_1004_a#'
	</cfquery>
   <cfif #read_hud2_a_1004_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1004_a, a1004_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1004_a#', '#readhud2_after.a_1004_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1004_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1004_b != '#read_hud2_before.a_1004_b#'
	</cfquery>
   <cfif #read_hud2_a_1004_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1004_b, a1004_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1004_b#', '#readhud2_after.a_1004_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1004_c">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1004_c != '#read_hud2_before.a_1004_c#'
	</cfquery>
   <cfif #read_hud2_a_1004_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1004_c, a1004_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1004_c#', '#readhud2_after.a_1004_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1005_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1005_a != '#read_hud2_before.a_1005_a#'
	</cfquery>
   <cfif #read_hud2_a_1005_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1005_a, a1005_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1005_a#', '#readhud2_after.a_1005_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1005_b">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1005_b != '#read_hud2_before.a_1005_b#'
	</cfquery>
   <cfif #read_hud2_a_1005_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1005_b, a1005_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1005_b#', '#readhud2_after.a_1005_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1005_c">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1005_c != '#read_hud2_before.a_1005_c#'
	</cfquery>
   <cfif #read_hud2_a_1005_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1005_c, a1005_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1005_c#', '#readhud2_after.a_1005_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1400_a">
			Select * from hud_form_prop_pg2
			WHERE prop_id = #rec_id# and a_1400_a != '#read_hud2_before.a_1400_a#'
	</cfquery>
   <cfif #read_hud2_a_1400_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (prop_id, a_1400_a, a1400_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1400_a#', '#readhud2_after.a_1400_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

		<CFLOCATION URL="https://#cgi.server_name#/admin_area/prop_view_hud1a.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#">

