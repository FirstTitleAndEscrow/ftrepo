<cfif #a_trigger# eq "10">
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
	<!--- <CFSET a_day_1 = #Day(a_insert_date)#> --->
	<CFSET a_day_1 = #DateFormat(Now(), "dd")#>
	<CFSET a_month_1 = #DateFormat(Now(), "mm")#>
	<CFSET a_year_1 = #DateFormat(Now(), "yyyy")#>
	<CFSET a_day_of_year_1 = #DayOfYear(a_insert_date)#>

	<CFQUERY datasource="#request.dsn#" NAME="get_titleid1">
		SELECT *
		FROM Property
		WHERE prop_id = #rec_id#
	</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="check_order">
	SELECT *
	FROM title
	WHERE (bfirstname1 = '#get_titleid1.bfirstname1#') AND (blastname1= '#get_titleid1.blastname1#') AND (bssn1 = '#get_titleid1.bssn1#') AND (loanamt_float = '#FORM.loanamt_float#') AND (paddress = '#get_titleid1.paddress#') AND (codeT is not null) AND (DATEDIFF(day, check_date, getdate()) < 30)

</CFQUERY>

	<cfif (#check_order.recordcount# GT "0")>



<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = '#read_title.comp_ID#'

		</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_for_indicator">

			SELECT *
			FROM Tax_Cert_prop
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstract">

			SELECT *
			FROM Doc_Abstract_prop
			WHERE prop_ID = #rec_ID#


		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_prop_order2">

			SELECT *
			FROM First_Title_States
			WHERE st_abbrev = '#read_title_order.pstate#'


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request_prop
				Where prop_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_info">
				SELECT *
				FROM eventlist_prop
				Where prop_Id = #rec_id#
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
			FROM Pay_Off_Lender_1_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">
			SELECT *
			FROM Pay_Off_Lender_2_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE ID = '#read_title.comp_id#'
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
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>

<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	<!--- <tr>
		<td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td>
	</tr>
 --->


	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>



<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">





	<p>	<center>
	<table width="770">

	<tr><td align=center colspan = 2 valign=bottom width = "700">
<FONT FACE=ARIAL SIZE=2 color="red">
	<br><br>
<center><B>OUR RECORDS INDICATE THAT A TITLE WITH SAME DATE HAS RECENTLY BEEN ORDERED!
</B><br><br><FONT FACE=ARIAL SIZE=2 color="blue"> </center> </td></tr>


	<br><br><br>

</td></tr>
<tr><td align=center valign=bottom width = "700">
<cfoutput>
		<NOBR>
			</NOBR>
			</cfoutput>
			</td>



</tr>
</table></center>		</p>




	</td>
								</tr>
							</table>

						</TD>
					</TR>
				</table>
		</TD>
	</TR>
</TABLE>
</center>
</BODY></HTML>



<cfelse>


	<CFSET order_date = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
	<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
	<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>

	<cfoutput>
			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO title (user_id, comp_id, loan_off_id, oname, ophone, oext, ofax, o_email, pname,
						pphone, pext, pfax, p_email, searchType, loanamt_float, Insured, check_date, check_time, dateandtime, blastname1, bfirstname1, bminame1, bssn1,
						bhphone1, bwphone1, bext1, blastname2, bfirstname2, bminame2, bssn2,
						bhphone2, bwphone2, bext2, slastname1, sfirstname1, sminame1, sssn1,
						shphone1, swphone1, sext1, slastname2, sfirstname2, sminame2, sssn2,
						shphone2, swphone2, sext2, paddress, pcity,pstate, pzip, pcounty, a_comment, verifyemail, verifyemail_2, verifyemail_3, fax_no,
						rptbyemail, a_insert_date, a_insert_time, duedate, order_date_adjusted, oda_day, oda_month, oda_year, oda_day_of_year, appraisal_status, a_day, a_month, a_year, a_day_of_year, polender1, poacctno1, pophone1, polender2, poacctno2, pophone2, order_status, codeT)
				VALUES('#get_titleid1.user_id#', '#get_titleid1.comp_id#',	'#get_titleid1.loan_off_id#', '#get_titleid1.oname#', '#get_titleid1.ophone#',
				 		'#get_titleid1.oext#', '#get_titleid1.ofax#', '#get_titleid1.o_email#', '#get_titleid1.pname#', '#get_titleid1.pphone#', '#get_titleid1.pext#', '#get_titleid1.pfax#', '#get_titleid1.p_email#','#SearchType#','#loanamt_float#','#Insured#','#DateFormat(Now(), "mm-dd-yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#','#order_date#', '#get_titleid1.blastname1#', '#get_titleid1.bfirstname1#', '#get_titleid1.bminame1#',
						'#get_titleid1.bssn1#', '#get_titleid1.bhphone1#', '#get_titleid1.bwphone1#', '#get_titleid1.bext1#', '#get_titleid1.blastname2#', '#get_titleid1.bfirstname2#', '#get_titleid1.bminame2#', '#get_titleid1.bssn2#', '#get_titleid1.bhphone2#', '#get_titleid1.bwphone2#', '#get_titleid1.bext2#', '#get_titleid1.slastname1#', '#get_titleid1.sfirstname1#', '#get_titleid1.sminame1#', '#get_titleid1.sssn1#', '#get_titleid1.shphone1#', '#get_titleid1.swphone1#', '#get_titleid1.sext1#', '#get_titleid1.slastname2#', '#get_titleid1.sfirstname2#', '#get_titleid1.sminame2#', '#get_titleid1.sssn2#', '#get_titleid1.shphone2#', '#get_titleid1.swphone2#', '#get_titleid1.sext2#','#get_titleid1.paddress#','#get_titleid1.pcity#','#get_titleid1.pstate#','#get_titleid1.pzip#','#get_titleid1.pcounty#','#get_titleid1.a_comment#', '#get_titleid1.verifyemail#', '#get_titleid1.verifyemail_2#', '#get_titleid1.verifyemail_3#', '#get_titleid1.fax_no#',
						'#get_titleid1.rptbyemail#', '#a_insert_date#', '#a_insert_time#', '#duedate#','#order_date_adj#', '#a_day_1#', '#a_month_1#', '#a_year_1#', '#oda_day_of_year_1#', 'In Process', '#a_day_1#', '#a_month_1#', '#a_year_1#',	'#a_day_of_year_1#', '#get_titleid1.polender1#', '#poacctno1#', '#get_titleid1.pophone1#', '#get_titleid1.polender2#', '#get_titleid1.poacctno2#', '#get_titleid1.pophone2#', 1, 1)

			</CFQUERY>
	</cfoutput>

	<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
		SELECT *
		FROM TITLE
		WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#">
		INSERT INTO Title_Closing_Order_Request (Title_ID, a_sent_by, a_filled_out_by)
				VALUES(#get_titleid.Title_ID#, 0, 0)
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#">
		INSERT INTO eventlist (Title_ID)
			VALUES(#get_titleid.Title_ID#)
	</CFQUERY>
		<!--- ===/ GENERATE AN ENTRY IN THE TAX CERT TABLE \=== --->

	<CFQUERY datasource="#request.dsn#" >
		INSERT INTO tax_cert_title (title_id)
				VALUES(#get_titleid.title_id#)
	</CFQUERY>

	<!--- ===/ GENERATE AN ENTRY IN THE ABSTRACTOR DOC TABLE \=== --->

	<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title (title_id)
				VALUES(#get_titleid.title_id#)
	</CFQUERY>

	<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 1  TABLE \=== --->
	<CFQUERY datasource="#request.dsn#" >
		INSERT INTO Pay_Off_Lender_1_Title (title_id)
				VALUES(#get_titleid.title_id#)
	</CFQUERY>

	<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 2  TABLE \=== --->

	<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_2_Title (title_id)
				VALUES(#get_titleid.title_id#)
	</CFQUERY>

	<!--- ===/ GENERATE AN ENTRY IN THE Doc_Amer_Title_Fla_Title  TABLE \=== --->

	<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Closer_Title (title_id)
				VALUES(#get_titleid.title_id#)
	</CFQUERY>

	<CFIF (#get_titleid.pstate# EQ "AL") OR (#get_titleid.pstate# EQ "AR") or (#get_titleid.pstate# EQ "AZ") or (#get_titleid.pstate# EQ "CA") or (#get_titleid.pstate# EQ "CO") or (#get_titleid.pstate# EQ "CT") or (#get_titleid.pstate# EQ "DE") or (#get_titleid.pstate# EQ "GA") or (#get_titleid.pstate# EQ "IA") or (#get_titleid.pstate# EQ "IL") or (#get_titleid.pstate# EQ "IN") or (#get_titleid.pstate# EQ "KS") or (#get_titleid.pstate# EQ "KY") or (#get_titleid.pstate# EQ "LA") or (#get_titleid.pstate# EQ "MA") or (#get_titleid.pstate# EQ "ME") or (#get_titleid.pstate# EQ "MN") or (#get_titleid.pstate# EQ "MO") or (#get_titleid.pstate# EQ "MS") or (#get_titleid.pstate# EQ "NC") or (#get_titleid.pstate# EQ "ND") or (#get_titleid.pstate# EQ "NH") or (#get_titleid.pstate# EQ "NY") or (#get_titleid.pstate# EQ "OH") or (#get_titleid.pstate# EQ "PA") or (#get_titleid.pstate# EQ "RI") or (#get_titleid.pstate# EQ "SC") or (#get_titleid.pstate# EQ "TN") or (#get_titleid.pstate# EQ "VA") or (#get_titleid.pstate# EQ "VT") or (#get_titleid.pstate# EQ "WI") or (#get_titleid.pstate# EQ "WV")>
		<CFQUERY datasource="#request.dsn#" >
			INSERT INTO Doc_Title_Insurance_Title (title_id, insurance_co)
			VALUES(#get_titleid.title_id#, 15)
		</CFQUERY>
	<cfelseif (#get_titleid.pstate# EQ "DC") OR (#get_titleid.pstate# EQ "MD") or (#get_titleid.pstate# EQ "MI") or (#get_titleid.pstate# EQ "NJ")>
		<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title (title_id, insurance_co)
				VALUES(#get_titleid.title_id#, 16)
		</CFQUERY>
	<CFELSE>
		<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Title_Insurance_Title (title_id, insurance_co)
				VALUES(#get_titleid.title_id#, 14)
		</CFQUERY>
	</CFIF>

	<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
	<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
    <CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>


				<CFQUERY datasource="#request.dsn#" NAME="prop_rep">
					SELECT *
					FROM Doc_Title_Insurance_Prop
					WHERE prop_id = #get_titleid1.prop_id#

		</CFQUERY>
		<cfif #prop_rep.s_status# eq 1>





		<CFQUERY datasource="#request.dsn#" NAME="read_deed">

			SELECT *
			FROM prop_ins_add
			where prop_id = #get_titleid1.prop_id# and type = 'DATA'
		</CFQUERY>



		<cfoutput query = "read_deed">

		<cfquery  datasource="#request.dsn#">
			INSERT INTO
				title_ins_add (title_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data37, data38, notes, addreq, addex)
				VALUES (#get_titleid.title_id#, 'DATA', '#seq_num#', 'O', '#c_date#', '#c_time#', '#data1#', '#data2#', '#data3#', '#data4#', '#data5#', '#data6#', '#data7#', '#data8#', '#data9#', '#data10#', '#data11#', '#data12#', '#data13#', '#data14#', '#data15#', '#data16#', '#data17#', '#data37#', '#data38#', '#notes#', '#addreq#', '#addex#')

</cfquery>

<cfquery  datasource="#request.dsn#">
			INSERT INTO
				title_ins_view (title_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data37, data38, notes, addreq, addex)
				VALUES (#get_titleid.title_id#, 'DATA', '#seq_num#', 'O', '#c_date#', '#c_time#', '#data1#', '#data2#', '#data3#', '#data4#', '#data5#', '#data6#', '#data7#', '#data8#', '#data9#', '#data10#', '#data11#', '#data12#', '#data13#', '#data14#', '#data15#', '#data16#', '#data17#', '#data37#', '#data38#', '#notes#', '#addreq#', '#addex#')

</cfquery>



		</cfoutput>



		<CFQUERY datasource="#request.dsn#" NAME="read_mortgage">

			SELECT *
			FROM prop_ins_add
			where prop_id = #get_titleid1.prop_id# and type = 'MORTGAGE'
		</CFQUERY>


		<cfoutput query = "read_mortgage">



		<cfquery  datasource="#request.dsn#">
			INSERT INTO
				title_ins_add (title_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, data24, data25, data26, data27, data28, data29, data30, data31, data32, data33)
				VALUES (#get_titleid.title_id#, 'MORTGAGE', '#seq_num#', 'O', '#c_date#', '#c_time#', '#data1#', '#data2#', '#data3#', '#data4#', '#data5#', '#data6#', '#data7#', '#data8#', '#data9#', '#data10#', '#data11#', '#data12#', '#data13#', '#data14#', '#data15#', '#data16#', '#data17#', '#data18#', '#data19#', '#data20#', '#data21#', '#data22#', '#data23#', '#data24#', '#data25#', '#data26#', '#data27#', '#data28#', '#data29#', '#data30#', '#data31#', '#data32#', '#data33#')

</cfquery>
		<cfquery  datasource="#request.dsn#">
			INSERT INTO
				title_ins_view (title_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, data24, data25, data26, data27, data28, data29, data30, data31, data32, data33)
				VALUES (#get_titleid.title_id#, 'MORTGAGE', '#seq_num#', 'O', '#c_date#', '#c_time#', '#data1#', '#data2#', '#data3#', '#data4#', '#data5#', '#data6#', '#data7#', '#data8#', '#data9#', '#data10#', '#data11#', '#data12#', '#data13#', '#data14#', '#data15#', '#data16#', '#data17#', '#data18#', '#data19#', '#data20#', '#data21#', '#data22#', '#data23#', '#data24#', '#data25#', '#data26#', '#data27#', '#data28#', '#data29#', '#data30#', '#data31#', '#data32#', '#data33#')

</cfquery>



		</cfoutput>



		<CFQUERY datasource="#request.dsn#" NAME="read_lien">

			SELECT *
			FROM prop_ins_add
			where prop_id = #get_titleid1.prop_id# and type = 'LIEN'
		</CFQUERY>


		<cfoutput query = "read_lien">


		<cfquery  datasource="#request.dsn#">
			INSERT INTO
				title_ins_add (title_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, lienintro)
				VALUES (#get_titleid.title_id#, 'LIEN', '#seq_num#', 'O', '#c_date#', '#c_time#', '#data1#', '#data2#', '#data3#', '#data4#', '#data5#', '#data6#', '#data7#', '#data8#', '#data9#', '#lienintro#')

</cfquery>
		<cfquery  datasource="#request.dsn#">
			INSERT INTO
				title_ins_view (title_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, lienintro)
				VALUES (#get_titleid.title_id#, 'LIEN', '#seq_num#', 'O', '#c_date#', '#c_time#', '#data1#', '#data2#', '#data3#', '#data4#', '#data5#', '#data6#', '#data7#', '#data8#', '#data9#', '#lienintro#')

</cfquery>


		</cfoutput>






	<CFQUERY datasource="#request.dsn#" >
		UPDATE Doc_Title_Insurance_Title
		SET
		merge_date = '#c_date#',
		b_dateandtime = '#order_date_adj#',
		merge_time = '#c_time#'
		WHERE  title_id = #get_titleid.title_ID#
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#">
		update Doc_Title_Insurance_Title set s_status = 1,
		a_recieved_date = '#c_date#',
		a_recieved_time = '#TimeFormat(Now(), "HH:mm:ss")#',
		f_dateandtime = '#order_date_adj#',
		a_recieved_by = 148
		WHERE title_id = #get_titleid.title_ID#
	</cfquery>

	<CFQUERY datasource="#request.dsn#">
		update title set appraisal_status = 'Report E-mailed'
		WHERE title_id = #get_titleid.title_ID#
	</cfquery>


	<CFMAIL
TO="#get_titleid.p_email#"
FROM="webmaster@firsttitleservices.com" Subject="#get_titleid.bfirstname1# #get_titleid.blastname1# -- Order: #get_titleid.title_id# -- Loan Number: #get_titleid.loan_number# -- Title Insurance Commitment"
TIMEOUT="600"
type="HTML"
	>

Title Insurance Commitment has been completed for order number #get_titleid.title_id#.<br>

To view/print it you may click <a href="https://#cgi.server_name#/title_Committment_email.cfm?comp_id=#get_titleid.comp_id#&rec_id=#get_titleid.title_id#" target = "new">Title Insurance Commitment</a><br><br>

Thank you,<br><br>

First Title and Escrow staff
	</CFMAIL>
<cfelse>
<CFQUERY datasource="#request.dsn#">
		update title set appraisal_status = 'In Process'
		WHERE title_id = #get_titleid.title_ID#
	</cfquery>
	<CFQUERY datasource="#request.dsn#">
		update property set appraisal_status = 'Cancelled per Client'
		WHERE prop_id = #get_titleid1.prop_ID#
	</cfquery>
</cfif>

<!--- ============================================== --->
<!--- ===/    Make Calculations for Insurance   \=== --->
<!--- ===/    and Recording Fees                \=== --->
<!--- ============================================== --->

<!--- ===/ Insert this data into the HUD Tables \=== --->

	<CFSET b_name_5 = #get_titleid.bfirstname1# & " " & #get_titleid.bminame1# & " " & #get_titleid.blastname1#>
	<CFSET s_name_5 = #get_titleid.sfirstname1# & " " & #get_titleid.sminame1# & " " & #get_titleid.slastname1#>
	<CFSET l_name_5 = #get_titleid.sfirstname1# & " " & #get_titleid.sminame1# & " " & #get_titleid.slastname1#>
	<CFSET property_address = #get_titleid.paddress# & " " & #get_titleid.pcity# & " " & #get_titleid.pstate# & " " & #get_titleid.pzip# & " " & " -- " & #get_titleid.pcounty#>

	<CFIF #get_titleid.SearchType# EQ "Refinance">
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
		<CFIF #read_rec_fees.recordcount# gt "0">
			<CFIF #read_rec_fees.mort_stamps# NEQ "0">
				<CFSET state_mort_stamps = "0">
				<CFSET city_mort_stamps = #round(get_titleid.loanamt_float)# * #read_rec_fees.mort_stamps#>
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
				<CFSET city_mort_stamps = #round(get_titleid.loanamt_float)# * #read_rec_fees.mort_stamps#>
			<CFELSE>
				<CFSET state_mort_stamps = "0">
				<CFSET city_mort_stamps = "0">
			</CFIF>
		<CFELSE>
			<CFSET state_mort_stamps = "0">
			<CFSET city_mort_stamps = "0">
		</CFIF>
	</CFIF>

	<CFIF (#get_titleid.SearchType# NEQ "Refinance") AND (#get_titleid.SearchType# NEQ "New Second Mortgage")>
		<cfif #read_rec_fees.recordcount# gt 0>
			<cfif #read_rec_fees.transfer_tax# neq 0>
				<cfif #get_titleid.pstate# eq "NJ">
					<cfif #get_titleid.purchase# LTE "150000">
						<CFSET state_deed_1 = #get_titleid.purchase# * 0.004>
					<cfELSEif #get_titleid.purchase# GT "150000" and #get_titleid.purchase# LTE "200000">
						<CFSET temp1 = #get_titleid.purchase# * 0.004>
						<CFSET temp2 = #get_titleid.purchase# - 150000>
						<CFSET temp3 = #temp2# * 0.0067>
						<CFSET state_deed_1 = #temp1# + #temp3#>
					<cfELSEif #get_titleid.purchase# GT "200000">
						<CFSET temp1 = #get_titleid.purchase# * 0.004>
						<CFSET temp2 = #get_titleid.purchase# - 150000>
						<CFSET temp3 = #temp2# * 0.0067>
						<CFSET temp4 = #temp1# + #temp3#>
						<CFSET temp6 = #get_titleid.purchase# - 200000>
						<CFSET temp7 = #temp6# * 0.0078>
						<CFSET state_deed_1 = #temp4# + #temp7#>
					<CFELSE>
					</CFIF>
				<CFELSE>
					<CFIF #get_titleid.purchase# eq "">
						<CFSET state_deed_1 = 0>
					<CFELSE>
						<CFSET state_deed_1 = #get_titleid.purchase# * #read_rec_fees.transfer_tax#>
					</CFIF>
				</CFIF>
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

	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM companies
		WHERE id = '#get_titleid.comp_id#'
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
			<CFSET intang_tax = #round(get_titleid.loanamt_float)# * #read_rec_fees.intangible_tax#>
		<CFELSE>
			<CFSET intang_tax = "0">
		</cfif>
	<CFELSE>
		<CFSET intang_tax = "0">
	</CFIF>

	<!--- ===/ Calc Ins Fees    \=== --->
	<cfif #get_titleid.loanamt_float# LTE "5000000">
		<cfif #get_titleid.pstate# neq "CA">
			<CFIF (#get_titleid.pstate# EQ "AL")>
				<CFIF (#get_titleid.pcounty# EQ "Cherokee") OR (#get_titleid.pcounty# EQ "Colbert")  OR (#get_titleid.pcounty# EQ "Dekalb") OR (#get_titleid.pcounty# EQ "Etowah") OR (#get_titleid.pcounty# EQ "Franklin") OR (#get_titleid.pcounty# EQ "Jackson") OR (#get_titleid.pcounty# EQ "Lauderdale") OR (#get_titleid.pcounty# EQ "Lawrence") OR (#get_titleid.pcounty# EQ "Limestone") OR (#get_titleid.pcounty# EQ "Madison") OR (#get_titleid.pcounty# EQ "Marion") OR (#get_titleid.pcounty# EQ "Marshall") OR (#get_titleid.pcounty# EQ "Winston")>
					<CFSET a_tble_to_read = "StateAlabamaMetro">
				<CFELSE>
					<CFSET a_tble_to_read = "StateAlabamaState">
				</CFIF>
			<CFELSEIF #get_titleid.pstate# EQ "AR">
				<CFSET a_tble_to_read = "StateArkansas">
			<CFELSEIF #get_titleid.pstate# EQ "AZ">
				<CFIF (#get_titleid.pcounty# EQ "Maricopa") OR  (#get_titleid.pcounty# EQ "Pima") OR  (#get_titleid.pcounty# EQ "Pinal")>
					<CFSET a_tble_to_read = "StateArizonaZone1">
				<CFelseIF (#get_titleid.pcounty# EQ "Coconino")>
					<CFSET a_tble_to_read = "StateArizonaZone2">
				<CFelseIF (#get_titleid.pcounty# EQ "Cochise")>
					<CFSET a_tble_to_read = "StateArizonaZone3">
				<CFelseIF (#get_titleid.pcounty# EQ "Yavapai")>
					<CFSET a_tble_to_read = "StateArizonaZone4">
				<CFelseIF (#get_titleid.pcounty# EQ "Mohave")>
					<CFSET a_tble_to_read = "StateArizonaZone5">
				<cfelse>
					<CFSET a_tble_to_read = "StateArizona">
				</CFIF>
			<CFELSEIF #get_titleid.pstate# EQ "CT">
				<CFSET a_tble_to_read = "StateConnecticut">
			<CFELSEIF #get_titleid.pstate# EQ "CO">
				<CFIF (#get_titleid.pcounty# EQ "Adams") OR  (#get_titleid.pcounty# EQ "Arapahoe") OR  (#get_titleid.pcounty# EQ "Broomfield") OR  (#get_titleid.pcounty# EQ "Clear Creek") OR  (#get_titleid.pcounty# EQ "Denver") OR  (#get_titleid.pcounty# EQ "Douglas") OR  (#get_titleid.pcounty# EQ "Elbert") OR  (#get_titleid.pcounty# EQ "Jefferson")>
					<CFSET a_tble_to_read = "StateColoradoZone1">
				<CFelseIF (#get_titleid.pcounty# EQ "Alamosa") OR  (#get_titleid.pcounty# EQ "Conejos") OR  (#get_titleid.pcounty# EQ "Rio Grande") OR  (#get_titleid.pcounty# EQ "Saguache")>
					<CFSET a_tble_to_read = "StateColoradoZone2">
				<CFelseIF (#get_titleid.pcounty# EQ "Archuleta") OR (#get_titleid.pcounty# EQ "Mineral")>
					<CFSET a_tble_to_read = "StateColoradoZone3">
				<CFelseIF (#get_titleid.pcounty# EQ "Boulder")>
					<CFSET a_tble_to_read = "StateColoradoZone4">
				<CFelseIF (#get_titleid.pcounty# EQ "Chaffee")>
					<CFSET a_tble_to_read = "StateColoradoZone5">
				<CFelseIF (#get_titleid.pcounty# EQ "Custer") OR (#get_titleid.pcounty# EQ "Fremont")>
					<CFSET a_tble_to_read = "StateColoradoZone6">
				<CFelseIF (#get_titleid.pcounty# EQ "Dolorse") OR (#get_titleid.pcounty# EQ "LaPlata") OR (#get_titleid.pcounty# EQ "Montezuma")>
					<CFSET a_tble_to_read = "StateColoradoZone7">
				<CFelseIF (#get_titleid.pcounty# EQ "Eagle") OR (#get_titleid.pcounty# EQ "Garfield") OR (#get_titleid.pcounty# EQ "Grand") OR (#get_titleid.pcounty# EQ "Jackson") OR (#get_titleid.pcounty# EQ "Pitkin") OR (#get_titleid.pcounty# EQ "Routt") OR (#get_titleid.pcounty# EQ "Summit")>
					<CFSET a_tble_to_read = "StateColoradoZone8">
				<CFelseIF (#get_titleid.pcounty# EQ "El Paso")>
					<CFSET a_tble_to_read = "StateColoradoZone9">
				<CFelseIF (#get_titleid.pcounty# EQ "Moffatt")>
					<CFSET a_tble_to_read = "StateColoradoZone10">
				<CFelseIF (#get_titleid.pcounty# EQ "Larimer")>
					<CFSET a_tble_to_read = "StateColoradoZone11">
				<CFelseIF (#get_titleid.pcounty# EQ "Montrose") OR (#get_titleid.pcounty# EQ "Ouray")>
					<CFSET a_tble_to_read = "StateColoradoZone12">
				<CFelseIF (#get_titleid.pcounty# EQ "Phillips")>
					<CFSET a_tble_to_read = "StateColoradoZone13">
				<CFelseIF (#get_titleid.pcounty# EQ "Pueblo")>
					<CFSET a_tble_to_read = "StateColoradoZone14">
				<CFelseIF (#get_titleid.pcounty# EQ "Rio Blanco")>
					<CFSET a_tble_to_read = "StateColoradoZone15">
				<CFelseIF (#get_titleid.pcounty# EQ "Weld")>
					<CFSET a_tble_to_read = "StateColoradoZone16">
				<cfelse>
					<CFSET a_tble_to_read = "StateColoradoZone17">
				</CFIF>
			<CFELSEIF #get_titleid.pstate# EQ "DC">
				<CFSET a_tble_to_read = "StateDistrictColombia">
			<CFELSEIF #get_titleid.pstate# EQ "DE">
				<CFSET a_tble_to_read = "StateDelaware">
			<CFELSEIF #get_titleid.pstate# EQ "FL">
				<CFSET a_tble_to_read = "StateFlorida">
			<CFELSEIF #get_titleid.pstate# EQ "GA">
				<CFIF (#get_titleid.pcounty# EQ "Fulton") OR (#get_titleid.pcounty# EQ "Cobb")  OR (#get_titleid.pcounty# EQ "Clayton") OR (#get_titleid.pcounty# EQ "Cherokee") OR (#get_titleid.pcounty# EQ "Dekalb") OR (#get_titleid.pcounty# EQ "Gwinnett") OR (#get_titleid.pcounty# EQ "Henry") OR (#get_titleid.pcounty# EQ "Douglas") OR (#get_titleid.pcounty# EQ "Forsyth") OR (#get_titleid.pcounty# EQ "Paulding") OR (#get_titleid.pcounty# EQ "Carroll")>
					<CFSET a_tble_to_read = "StateGeorgiaMetro">
				<CFELSE>
					<CFSET a_tble_to_read = "StateGeorgiaState">
				</CFIF>
			<CFELSEIF #get_titleid.pstate# EQ "IA">
				<CFSET a_tble_to_read = "StateIowa">
			<CFELSEIF #get_titleid.pstate# EQ "IL">
				<CFSET a_tble_to_read = "StateIllinois">
			<CFELSEIF #get_titleid.pstate# EQ "IN">
				<CFSET a_tble_to_read = "StateIndiana">
			<CFELSEIF #get_titleid.pstate# EQ "KS">
				<CFSET a_tble_to_read = "StateKansas">
			<CFELSEIF #get_titleid.pstate# EQ "KY">
				<CFSET a_tble_to_read = "StateKentucky">
			<CFELSEIF #get_titleid.pstate# EQ "LA">
				<CFSET a_tble_to_read = "StateLouisianna">
			<CFELSEIF #get_titleid.pstate# EQ "ME">
				<CFSET a_tble_to_read = "StateMaine">
			<CFELSEIF #get_titleid.pstate# EQ "MD">
				<CFSET a_tble_to_read = "StateMaryland">
			<CFELSEIF #get_titleid.pstate# EQ "MA">
				<CFSET a_tble_to_read = "StateMassachusetts">
			<CFELSEIF #get_titleid.pstate# EQ "MI">
				<CFIF (#get_titleid.pcounty# EQ "Allegan") OR (#get_titleid.pcounty# EQ "Barry")  OR (#get_titleid.pcounty# EQ "Clinton") OR (#get_titleid.pcounty# EQ "Eaton") OR (#get_titleid.pcounty# EQ "Grand Traverse") OR (#get_titleid.pcounty# EQ "Ingham") OR (#get_titleid.pcounty# EQ "Ionia") OR (#get_titleid.pcounty# EQ "Kent") OR (#get_titleid.pcounty# EQ "Leelanau") OR (#get_titleid.pcounty# EQ "Montcalm") OR (#get_titleid.pcounty# EQ "Muskegon") OR (#get_titleid.pcounty# EQ "Newaygo") OR (#get_titleid.pcounty# EQ "Ottawa")>
					<CFSET a_tble_to_read = "StateMichiganZone2">
					<CFELSEIF #get_titleid.pcounty# eq "Wayne">
			        <CFSET a_tble_to_read = "StateMichiganZone3">
				<CFELSE>
					<CFSET a_tble_to_read = "StateMichiganZone1">
				</CFIF>
			<CFELSEIF #get_titleid.pstate# EQ "MN">
				<CFSET a_tble_to_read = "StateMinnesota">
			<CFELSEIF #get_titleid.pstate# EQ "MS">
				<CFSET a_tble_to_read = "StateMississipi">
			<CFELSEIF #get_titleid.pstate# EQ "MO">
				<CFSET a_tble_to_read = "StateMissouri">
			<CFELSEIF #get_titleid.pstate# EQ "NJ">
				<CFSET a_tble_to_read = "StateNewJersey">
			<CFELSEIF #get_titleid.pstate# EQ "NC">
				<CFSET a_tble_to_read = "StateNorthCarolina">
			<CFELSEIF #get_titleid.pstate# EQ "ND">
				<CFSET a_tble_to_read = "StateNorthDakota">
			<CFELSEIF #get_titleid.pstate# EQ "NH">
				<CFSET a_tble_to_read = "StateNewHampshire">
			<CFELSEIF #get_titleid.pstate# EQ "NY">
				<CFIF (#get_titleid.pcounty# EQ "Albany") OR (#get_titleid.pcounty# EQ "Bronx")  OR (#get_titleid.pcounty# EQ "Columbia") OR (#get_titleid.pcounty# EQ "Dutchess") OR (#get_titleid.pcounty# EQ "Greene") OR (#get_titleid.pcounty# EQ "Kings") OR (#get_titleid.pcounty# EQ "Nassau") OR (#get_titleid.pcounty# EQ "New York") OR (#get_titleid.pcounty# EQ "Orange") OR (#get_titleid.pcounty# EQ "Putnam") OR (#get_titleid.pcounty# EQ "Queens") OR (#get_titleid.pcounty# EQ "Rensselaer") OR (#get_titleid.pcounty# EQ "Richmond") OR (#get_titleid.pcounty# EQ "Rockland") OR (#get_titleid.pcounty# EQ "Suffolk") OR (#get_titleid.pcounty# EQ "Sullivan") OR (#get_titleid.pcounty# EQ "Westchester") OR (#get_titleid.pcounty# EQ "Ulster")>
					<CFSET a_tble_to_read = "StateNewYorkZone2">
				<CFELSE>
					<CFSET a_tble_to_read = "StateNewYorkZone1">
				</CFIF>
			<CFELSEIF #get_titleid.pstate# EQ "OH">
				<CFSET a_tble_to_read = "StateOhio">
			<CFELSEIF #get_titleid.pstate# EQ "PA">
				<CFSET a_tble_to_read = "StatePennsylvania">
			<CFELSEIF #get_titleid.pstate# EQ "RI">
				<CFSET a_tble_to_read = "StateRhodeIsland">
			<CFELSEIF #get_titleid.pstate# EQ "SC">
				<CFSET a_tble_to_read = "StateSouthCarolina">
			<CFELSEIF #get_titleid.pstate# EQ "TN">
				<CFIF (#get_titleid.pcounty# EQ "Davidson")>
					<CFSET a_tble_to_read = "StateTennesseeZone1">
				<CFelseIF (#get_titleid.pcounty# EQ "Hamilton")>
					<CFSET a_tble_to_read = "StateTennesseeZone2">
				<CFelseIF (#get_titleid.pcounty# EQ "Knox")>
					<CFSET a_tble_to_read = "StateTennesseeZone3">
				<CFelseIF (#get_titleid.pcounty# EQ "Shelby")>
					<CFSET a_tble_to_read = "StateTennesseeZone4">
				<cfelse>
					<CFSET a_tble_to_read = "StateTennessee">
				</CFIF>
			<CFELSEIF #get_titleid.pstate# EQ "VT">
				<CFSET a_tble_to_read = "StateVermont">
			<CFELSEIF #get_titleid.pstate# EQ "VA">
				<CFSET a_tble_to_read = "StateVirginia">
			<CFELSEIF #get_titleid.pstate# EQ "WI">
				<CFSET a_tble_to_read = "StateWisconsin">
			<CFELSEIF #get_titleid.pstate# EQ "WV">
				<CFSET a_tble_to_read = "StateWestVirginia">
			</CFIF>

			<!--- Round up the value of the loan amount --->

			<!--- remove any potential decimal values --->
			<CFSET   x  = #Round(get_titleid.loanamt_float)#>
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

			<CFIF #get_titleid.SearchType# EQ "Refinance">
				<CFSET a_ins_premium = #read_ins_calc.Refinance#>
			<CFELSE>
				<CFSET a_ins_premium = #read_ins_calc.sale#>
			</CFIF>
		</cfif>
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
<!---Harry 07/01/04 --->

	<cfif #searchType# neq "New Second Mortgage">
<cfif #get_line_costs.a_1101# NEQ "">
<CFSET a_1101_a = #get_line_costs.a_1101#>
<CFELSE>
<Cfset a_1101_a = "0">
</CFIF>
<cfif #get_line_costs.a_1102# NEQ "">
<CFSET a_1102_a = #get_line_costs.a_1102#>
<CFELSE>
<Cfset a_1102_a = "0">
</CFIF>
<cfif #get_line_costs.a_1103# NEQ "">
<CFSET a_1103_a = #get_line_costs.a_1103#>
<CFELSE>
<Cfset a_1103_a = "0">
</CFIF>
<cfif #get_line_costs.a_1104# NEQ "">
<CFSET a_1104_a = #get_line_costs.a_1104#>
<CFELSE>
<Cfset a_1104_a = "0">
</CFIF>
<cfif #get_line_costs.a_1105# NEQ "">
<CFSET a_1105_a = #get_line_costs.a_1105#>
<CFELSE>
<Cfset a_1105_a = "0">
</CFIF>
<cfif #get_line_costs.a_1106# NEQ "">
<CFSET a_1106_a = #get_line_costs.a_1106#>
<CFELSE>
<Cfset a_1106_a = "0">
</CFIF>
<cfif #get_line_costs.a_1107# NEQ "">
<CFSET a_1107_a = #get_line_costs.a_1107#>
<CFELSE>
<Cfset a_1107_a = "0">
</CFIF>
<cfif #get_line_costs.a_1111# NEQ "">
<CFSET a_1111_a = #get_line_costs.a_1111#>
<CFELSE>
<Cfset a_1111_a = "0">
</CFIF>
<cfif #get_line_costs.a_1112# NEQ "">
<CFSET a_1112_a = #get_line_costs.a_1112#>
<CFELSE>
<Cfset a_1112_a = "0">
</CFIF>
<cfif #get_line_costs.a_1113# NEQ "">
<CFSET a_1113_a = #get_line_costs.a_1113#>
<CFELSE>
<Cfset a_1113_a = "0">
</CFIF>
<cfif #get_line_costs.a_1205# NEQ "">
<CFSET a_1205_a = #get_line_costs.a_1205#>
<CFELSE>
<Cfset a_1205_a = "0">
</CFIF>
<cfif #get_line_costs.a_1303# NEQ "">
<CFSET a_1303_a = #get_line_costs.a_1303#>
<CFELSE>
<Cfset a_1303_a = "0">
</CFIF>
<cfif #get_line_costs.a_1304# NEQ "">
<CFSET a_1304_a = #get_line_costs.a_1304#>
<CFELSE>
<Cfset a_1304_a = "0">
</CFIF>
<cfif #get_line_costs.a_1305# NEQ "">
<CFSET a_1305_a = #get_line_costs.a_1305#>
<CFELSE>
<Cfset a_1305_a = "0">
</CFIF>

<cfelse><!---changing this to D which is Second Mortgage with Title Ins.  Harry 07/01/04 --->
	<cfif #get_line_costs.a_1101d# NEQ "">
		<CFSET a_1101_a = #get_line_costs.a_1101d#>
	<CFELSE>
		<Cfset a_1101_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1102d# NEQ "">
		<CFSET a_1102_a = #get_line_costs.a_1102d#>
	<CFELSE>
		<Cfset a_1102_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1103d# NEQ "">
		<CFSET a_1103_a = #get_line_costs.a_1103d#>
	<CFELSE>
		<Cfset a_1103_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1104d# NEQ "">
		<CFSET a_1104_a = #get_line_costs.a_1104d#>
	<CFELSE>
		<Cfset a_1104_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1105d# NEQ "">
		<CFSET a_1105_a = #get_line_costs.a_1105d#>
	<CFELSE>
		<Cfset a_1105_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1106d# NEQ "">
		<CFSET a_1106_a = #get_line_costs.a_1106d#>
	<CFELSE>
		<Cfset a_1106_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1107d# NEQ "">
		<CFSET a_1107_a = #get_line_costs.a_1107d#>
	<CFELSE>
		<Cfset a_1107_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1111d# NEQ "">
		<CFSET a_1111_a = #get_line_costs.a_1111d#>
	<CFELSE>
		<Cfset a_1111_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1112d# NEQ "">
		<CFSET a_1112_a = #get_line_costs.a_1112d#>
	<CFELSE>
		<Cfset a_1112_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1113d# NEQ "">
		<CFSET a_1113_a = #get_line_costs.a_1113d#>
	<CFELSE>
		<Cfset a_1113_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1205d# NEQ "">
		<CFSET a_1205_a = #get_line_costs.a_1205d#>
	<CFELSE>
		<Cfset a_1205_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1303d# NEQ "">
		<CFSET a_1303_a = #get_line_costs.a_1303d#>
	<CFELSE>
		<Cfset a_1303_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1304d# NEQ "">
		<CFSET a_1304_a = #get_line_costs.a_1304d#>
	<CFELSE>
		<Cfset a_1304_a = "0">
	</CFIF>
	<cfif #get_line_costs.a_1305d# NEQ "">
		<CFSET a_1305_a = #get_line_costs.a_1305d#>
	<CFELSE>
		<Cfset a_1305_a = "0">
	</CFIF>
</cfif>

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

<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT *
	FROM companies
	WHERE id = '#get_titleid.comp_id#'
</CFQUERY>

<cfif #read_rec_fees.recordcount# GT "0">
	<CFIF #read_rec_fees.mort_rec_fee# NEQ "" or #read_rec_fees.mort_rec_fee# NEQ "0">
		<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
	<CFELSE>
		<Cfset rec_fee = "0">
	</cfif>
<cfelse>
	<Cfset rec_fee = "0">
</CFIF>

<cfif #read_rec_fees.recordcount# GT "0">
	<cfif #read_rec_fees.release_rec_fee# NEQ "" or #read_rec_fees.release_rec_fee# NEQ "0">
		<cfif #read_comp.id# eq 154 or #read_comp.id# eq 155 or #read_comp.id# eq 156 or #read_comp.id# eq 157 or #read_comp.id# eq 158 or #read_comp.id# eq 159 or #read_comp.id# eq 160 or #read_comp.id# eq 161 or #read_comp.id# eq 162 or #read_comp.id# eq 163 or #read_comp.id# eq 164 or #read_comp.id# eq 165 or #read_comp.id# eq 166 or #read_comp.id# eq 167 or #read_comp.id# eq 168 or #read_comp.id# eq 169 or #read_comp.id# eq 170 or #read_comp.id# eq 181 or #read_comp.id# eq 182 or #read_comp.id# eq 183 or #read_comp.id# eq 184 or #read_comp.id# eq 185 or #read_comp.id# eq 186 or #read_comp.id# eq 187 or #read_comp.id# eq 188 or #read_comp.id# eq 189 or #read_comp.id# eq 192 or #read_comp.id# eq 190 or #read_comp.id# eq 193 or #read_comp.id# eq 194 or #read_comp.id# eq 195 or #read_comp.id# eq 196 or #read_comp.id# eq 197  or #read_comp.id# eq 198  or #read_comp.id# eq 199  or #read_comp.id# eq 200  or #read_comp.id# eq 201>
			<Cfset rel_fee = "0">
		<cfelse>
			<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
		</cfif>
	<CFELSE>
		<Cfset rel_fee = "0">
</cfif>

<CFELSE>
	<Cfset rel_fee = "0">
</CFIF>

<cfif #city_mort_stamps# NEQ "" or #city_mort_stamps# NEQ "0">
	<Cfset mort_stamps = #city_mort_stamps#>
<CFELSE>
	<Cfset mort_stamps = "0">
</CFIF>

<cfif #a_fee_total# NEQ "" or #a_fee_total# NEQ "0">
	<Cfset total_fee = #a_fee_total#>
<CFELSE>
	<Cfset total_fee = "0">
</CFIF>

<cfif #state_deed_1# NEQ "" or #state_deed_1# NEQ "0" >
	<Cfset deed_state = #state_deed_1#>
<CFELSE>
	<Cfset deed_state = "0">
</CFIF>

<cfif #state_mort_stamps# NEQ "" or #state_mort_stamps# NEQ "0" >
	<Cfset s_mort_stamps = #state_mort_stamps#>
<CFELSE>
	<Cfset s_mort_stamps = "0">
</CFIF>

<cfif #a_1203_line_total# NEQ "" or #a_1203_line_total# NEQ "0">
	<Cfset a_line_total_1203 = #a_1203_line_total#>
<CFELSE>
	<Cfset a_line_total_1203 = "0">
</CFIF>

<cfif #intang_tax# NEQ "" or #intang_tax# NEQ "0">
	<Cfset intang_tx = #intang_tax#>
<CFELSE>
	<Cfset intang_tx = "0">
</CFIF>

<cfif #get_titleid.loanamt_float# LTE "5000000">
	<cfif #get_titleid.pstate# neq "CA">
		<cfif #a_ins_premium# NEQ "" or #a_ins_premium# NEQ "0">
			<CFSET ins_premium = #a_ins_premium#>
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
										>													<cfif ins_premium neq 'Call for Quote'>
<CFSET a_total_settlmnt_charges = a_total_settlmnt_charges + ins_premium>
</cfif>
<cfif #get_titleid.purchase# NEQ "">
		<CFSET a_101 = #get_titleid.purchase#>
	<CFELSE>
		<Cfset a_101 = "0">
	</CFIF>

	<CFSET a_total_settlmnt_charges2 = #a_total_settlmnt_charges# + #a_101#>
	<CFSET a_220 = #Round(get_titleid.loanamt_float)#>
	<CFSET a_301 = #a_total_settlmnt_charges2#>
	<CFSET a_302 = #a_220#>
	<CFSET a_total_settlmnt_charges3 = #a_301# - #a_302#>

	<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg1 (title_id, a_1, a_6, D_BName, D_BAddr, E_SName, E_SAddr, F_LName, F_LAddr, G_PropAddr, I_SettlementDate, a_103 , a_120, a_220, a_301, a_302, a_303 )
				VALUES(#get_titleid.title_id#, '#loan_type_111#', '#get_titleid.title_id#', '#b_name_5#', '', '#s_name_5#', '', '', '', '#property_address#', 'To Be Determined', '#a_total_settlmnt_charges#', '#a_total_settlmnt_charges2#', '#a_220#', '#a_301#', '#a_302#', '#a_total_settlmnt_charges3#')
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg2 (title_id, a_1101_a,  a_1102_a, a_1103_a,  a_1104_a,  a_1105_a,  a_1106_a,  a_1107_a,  a_1111_a,  a_1112_a,  a_1113_a,  a_1205_a,  a_1303_a,  a_1304_a,  a_1305_a,  a_1108_a, a_1108_b, a_1201_a, a_1201_b, a_1201_c, a_1201_d, a_1201_e, a_1202_a, a_1202_b, a_1202_c, a_1202_d, a_1202_e, a_1203_a, a_1203_b, a_1203_c, a_1203_d, a_1203_e, a_1204_a, a_1204_b, a_1204_c, a_1400_a)
				VALUES(#get_titleid.title_id#, '#a_1101_a#', '#a_1102_a#',  '#a_1103_a#',  '#a_1104_a#',  '#a_1105_a#',  '#a_1106_a#',  '#a_1107_a#',  '#a_1111_a#',  '#a_1112_a#',  '#a_1113_a#',  '#a_1205_a#',  '#a_1303_a#', '#a_1304_a#', '#a_1305_a#', '#ins_premium#', '0', '0', '#rec_fee#', '#rel_fee#', '#total_fee#', '0', '0', '0', '#mort_stamps#', '#mort_stamps#', '0', '0', '#deed_state#', '#s_mort_stamps#', '#a_line_total_1203#', '0', 'Intangable Tax', '#intang_tx#', '0', '#a_total_settlmnt_charges#')
	</CFQUERY>
<cfelse>
	<Cfset ins_premium = "Call for Quote">
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
	<CFSET a_220 = #Round(get_titleid.loanamt_float)#>
	<CFSET a_301 = #a_total_settlmnt_charges2#>
	<CFSET a_302 = #a_220#>
	<CFSET a_total_settlmnt_charges3 = #a_301# - #a_302#>

	<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg1 (title_id, a_1, a_6, D_BName, D_BAddr, E_SName, E_SAddr, F_LName, F_LAddr, G_PropAddr, I_SettlementDate, a_103 , a_120, a_220, a_301, a_302, a_303 )
				VALUES(#get_titleid.title_id#, '#loan_type_111#', '#get_titleid.title_id#', '#b_name_5#', '', '#s_name_5#', '', '', '', '#property_address#', 'To Be Determined', '#a_total_settlmnt_charges#', '#a_total_settlmnt_charges2#', '#a_220#', '#a_301#', '#a_302#', '#a_total_settlmnt_charges3#')
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg2 (title_id, a_1101_a,  a_1102_a, a_1103_a,  a_1104_a,  a_1105_a,  a_1106_a,  a_1107_a,  a_1111_a,  a_1112_a,  a_1113_a,  a_1205_a,  a_1303_a,  a_1304_a,  a_1305_a,  a_1108_a, a_1108_b, a_1201_a, a_1201_b, a_1201_c, a_1201_d, a_1201_e, a_1202_a, a_1202_b, a_1202_c, a_1202_d, a_1202_e, a_1203_a, a_1203_b, a_1203_c, a_1203_d, a_1203_e, a_1204_a, a_1204_b, a_1204_c, a_1400_a)
				VALUES(#get_titleid.title_id#, '#a_1101_a#', '#a_1102_a#',  '#a_1103_a#',  '#a_1104_a#',  '#a_1105_a#',  '#a_1106_a#',  '#a_1107_a#',  '#a_1111_a#',  '#a_1112_a#',  '#a_1113_a#',  '#a_1205_a#',  '#a_1303_a#', '#a_1304_a#', '#a_1305_a#', '#ins_premium#', '0', '0', '#rec_fee#', '#rel_fee#', '#total_fee#', '0', '0', '0', '#mort_stamps#', '#mort_stamps#', '0', '0', '#deed_state#', '#s_mort_stamps#', '#a_line_total_1203#', '0', 'Intangable Tax', '#intang_tx#', '0', '#a_total_settlmnt_charges#')

	</CFQUERY>
</cfif>
<cfelse>
	<Cfset ins_premium = "Call for Quote">
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
	<CFSET a_220 = #Round(get_titleid.loanamt_float)#>
	<CFSET a_301 = #a_total_settlmnt_charges2#>
	<CFSET a_302 = #a_220#>
	<CFSET a_total_settlmnt_charges3 = #a_301# - #a_302#>

	<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg1 (title_id, a_1, a_6, D_BName, D_BAddr, E_SName, E_SAddr, F_LName, F_LAddr, G_PropAddr, I_SettlementDate, a_103 , a_120, a_220, a_301, a_302, a_303 )
				VALUES(#get_titleid.title_id#, '#loan_type_111#', '#get_titleid.title_id#', '#b_name_5#', '', '#s_name_5#', '', '', '', '#property_address#', 'To Be Determined', '#a_total_settlmnt_charges#', '#a_total_settlmnt_charges2#', '#a_220#', '#a_301#', '#a_302#', '#a_total_settlmnt_charges3#')

	</CFQUERY>

	<CFQUERY datasource="#request.dsn#" >
				INSERT INTO hud_form_title_pg2 (title_id, a_1101_a,  a_1102_a, a_1103_a,  a_1104_a,  a_1105_a,  a_1106_a,  a_1107_a,  a_1111_a,  a_1112_a,  a_1113_a,  a_1205_a,  a_1303_a,  a_1304_a,  a_1305_a,  a_1108_a, a_1108_b, a_1201_a, a_1201_b, a_1201_c, a_1201_d, a_1201_e, a_1202_a, a_1202_b, a_1202_c, a_1202_d, a_1202_e, a_1203_a, a_1203_b, a_1203_c, a_1203_d, a_1203_e, a_1204_a, a_1204_b, a_1204_c, a_1400_a)
				VALUES(#get_titleid.title_id#, '#a_1101_a#', '#a_1102_a#',  '#a_1103_a#',  '#a_1104_a#',  '#a_1105_a#',  '#a_1106_a#',  '#a_1107_a#',  '#a_1111_a#',  '#a_1112_a#',  '#a_1113_a#',  '#a_1205_a#',  '#a_1303_a#', '#a_1304_a#', '#a_1305_a#', '#ins_premium#', '0', '0', '#rec_fee#', '#rel_fee#', '#total_fee#', '0', '0', '0', '#mort_stamps#', '#mort_stamps#', '0', '0', '#deed_state#', '#s_mort_stamps#', '#a_line_total_1203#', '0', 'Intangable Tax', '#intang_tx#', '0', '#a_total_settlmnt_charges#')
	</CFQUERY>
</cfif>
		<!--- ============================================== --->

<CFQUERY datasource="#request.dsn#" NAME="getcompany">
	SELECT *
	FROM companies
	WHERE ID = #get_titleid.comp_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE id = #get_titleid.USER_ID#
		ORDER BY lp_lname ASC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">
	SELECT *
	FROM loan_officers
	WHERE ID = #get_titleid.loan_off_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_title">
	SELECT *
	FROM title
	WHERE title_ID = #get_titleid.title_id#
</CFQUERY>

<CFSET b_emails_to_first_title = "akumar@firsttitleservices.com">
	<CFMAIL
				TO="#b_emails_to_first_title#"
				FROM="webmaster@firsttitleservices.com" Subject="Summary of Order #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
				TIMEOUT="600"
				type="HTML"
				>
				<center>
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B> CLIENT: #getcompany.company#</B></CENTER>
			</TD>
		</TR>


		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B> Order #get_titleid.title_id#</B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CLIENT SPECIFIC INFORMATION</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Officer:</b>
						</TD>

						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Processor:</b>
						</TD>

					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_loan_offcr.lo_lname#, #read_loan_offcr.lo_fname#</B>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_user.lp_lname#, #read_user.lp_fname#</B>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_phone#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_user.lp_phone#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_ext#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_ext#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_fax#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_fax#</b>
						</td>
					</tr>

					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>
					</tr>

					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_email#</b>
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_email#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

</table>





<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>BORROWER / SELLER INFORMATION</B></CENTER><br><FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Borrowers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.blastname1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bfirstname1#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bminame1#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bssn1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bhphone1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bwphone1#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bext1#</b>
						</td>

					</tr>

		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ SECOND ] \=== --->
		<!--- =================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.blastname2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bfirstname2#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bminame2#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bssn2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bhphone2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bwphone2#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.bext2#</b>
						</td>

					</tr>

					<tr>
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->

		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Sellers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- ================================== --->
		<!--- ===/  SELLERS Info [ FIRST ]  \=== --->
		<!--- ================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.slastname1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.sfirstname1#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.sminame1#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.sssn1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.shphone1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.swphone1#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.sext1#</b>
						</td>

					</tr>

		<!--- ================================== --->
		<!--- ===/ SELLERS  Info [ SECOND ] \=== --->
		<!--- ================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.slastname2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.sfirstname2#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.sminame2#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.sssn2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.shphone2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.swphone2#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.sext2#</b>
						</td>

					</tr>

					<tr>
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>

				</table>
			</td>
		</tr>


</table>



<!--- ======================================================================== --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PROPERTY ADDRESS</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Street Address <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.paddress#</b>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							City, State, Zip:</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<NOBR><FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.pcity#,&nbsp;#get_titleid.pstate#  #get_titleid.pzip#</b>
							</NOBR>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.pcounty#</b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Legal Description <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.plegaldesc#</b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Property Use <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.prop_use_type#</B>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is this a Condo or PUD <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.condo_pud#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>


</table>

<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/       [ COMMENTS ]  TOP         \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>COMMENTS</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.a_COMMENT#</B>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->

<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/        [ PAYOFF ]  TOP          \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PAYOFF INFORMATION:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Payoff Lender  [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.polender1#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.poacctno1#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.pophone1#</b>
						</td>
					</tr>

		<!--- ==================================== --->
		<!--- ===/ Payoff Lender  [ SECOND ]  \=== --->
		<!--- ==================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Second Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.polender2#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.poacctno2#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.pophone2#</b>
						</td>
					</tr>


					<tr>
						<td width=172 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>

						<td width=172  bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->





<!--- ================================================ --->
<!--- ===/          [ TITLE INSURANCE ]           \=== --->
<!--- ================================================ --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>TITLE INSURANCE INFORMATION:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Transaction Type
						</td>

						<td width=150 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.SearchType#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Deed Transfer
						</td>

						<td width=144 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.Deedtransfer#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Proposed Insured
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.Insured#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Amt
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.loanamt_float#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Type
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.loan_type_111#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Program
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.loan_program_333#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->


<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ICL INFORMATION:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>


					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							ICL REQUEST
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b><CFIF #get_titleid.request_icl# neq "">Yes<cfelse>No</cfif></b>
						</td>
					</tr>



				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>


<!--- ========================================= --->
<!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Verify Order was Received</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address, you will receive a confirmation  e-mail of your order having been received by us.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.Verifyemail#</b>
						</td>
					</tr>

					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to up to two other e-mail addresses.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.Verifyemail_2#</b><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Fax:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.fax_no#</b>


						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<!--- =========================================== --->
<!--- ===/    [ RECEIVE REPORT ]  TOP        \=== --->
<!--- =========================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Request copy of Final Report</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>If you would like to receive a copy of the final report, please provide us with an email address.</b><br>
			<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.Verifyemail_3#</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#get_titleid.RptbyEmail#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<p>
<!--- ======================================================================== --->

						</td>
								</tr>
							</table>

						</TD>
					</TR>
				</table>
		</TD>
	</TR>
</TABLE>
</center>
	</cfmail>

<CFQUERY datasource="#request.dsn#" NAME="get_user">
	SELECT *
	FROM user_client_assoc
	WHERE company_id = #get_titleid.comp_id#
	order by id
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="insert_user">
		SELECT *
		FROM users
		WHERE id = #get_titleid.USER_ID#
		ORDER BY lp_lname ASC
	</CFQUERY>
<!---These If Statements are impossible to figure out in this code
I'm going to write some stupid code right here to get around it.
Company 621 is another company that MIC bought and needs to follow the rules.
I don't trust the conditional statement to work so I'm doing it this way.
I can't test this because if MIC receives an email in error they will freak out.
Harry 11/12/04
--->
<CFSET company = #get_titleid.comp_id# >

<CFIF #company# eq "621">
    <CFSET #company# eq "115">
</CFIF>
<!---End Harry 11/12/2004--->
<cfif #company# neq "115">
	<cfif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# neq "">
<CFMAIL
TO="#get_titleid.verifyemail#,#insert_user.cc_email_1#,#insert_user.cc_email_2#"
FROM="webmaster@firsttitleservices.com" Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>
<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   

<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#get_titleid.comp_id#&order_id=#get_titleid.title_id#&user_id_1=#get_titleid.USER_ID#&lo_id=#get_titleid.loan_off_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif><br>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<CFIF #comp_id# eq 508>
			<td width=770 align=center colspan = 4 valign=top bgcolor=elelel>
		<CFELSE>
			<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
		</CFIF>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
		<CFIF #comp_id# eq 508>
			<CFINCLUDE TEMPLATE="./includes/CustomerService.cfm">
		<CFELSE>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFLOOP query = "get_user">

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Title Ordering/Tracking' or position = 'Title Delivery/Review' or position = 'Title Clearance' or position = 'Scheduling Coordinator' or position = 'Processing Asst.' or position = 'Funding Asst.' or position = 'Processor' or position = 'Funder' or position = 'Shipping' or position = 'Manager, Processing' or position = 'Manager, Title Production' or position = 'Manager, Research')
		order by id
		</CFQUERY>



		<cfif #retrieve_user.recordcount# GT 0><tr>
		<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
		</TR>	</cfif>



	</cfloop>



	</CFIF>
	</table></cfif>

</cfmail>
<cfelseif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# eq "">
<CFMAIL
TO="#get_titleid.verifyemail#,#insert_user.cc_email_1#"
FROM="webmaster@firsttitleservices.com" Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>
<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#get_titleid.comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif><br>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
	<tr>
		<CFIF #comp_id# eq 508>
			<td width=770 align=center colspan = 4 valign=top bgcolor=elelel>
		<CFELSE>
			<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
		</CFIF>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
		</td>
	</tr>
			</center>
	<CFIF #comp_id# eq 508>
		<CFINCLUDE TEMPLATE="./includes/CustomerService.cfm">
	<CFELSE>
	<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
		<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
		<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>
		</TD>
	</TR>
	<CFLOOP query = "get_user">
		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">
			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
			order by position
		</CFQUERY>
		<cfif #retrieve_user.recordcount# GT 0><tr>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
	</TR>
		</cfif>
	</cfloop>
	</CFIF>
	</table></cfif>

</cfmail>
<cfelseif #read_user.cc_email_1# eq "" and #read_user.cc_email_2# neq "">
<CFMAIL
TO="#get_titleid.verifyemail#,#insert_user.cc_email_2#"
FROM="webmaster@firsttitleservices.com" Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>

<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   


<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#get_titleid.comp_id#&order_id=#get_titleid.title_id#&user_id_1=#get_titleid.USER_ID#&lo_id=#get_titleid.loan_off_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif><br>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
	<tr>
		<CFIF #comp_id# eq 508>
			<td width=770 align=center colspan = 4 valign=top bgcolor=elelel>
		<CFELSE>
			<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
		</CFIF>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
		</td>
	</tr>
			</center>
			<CFIF #comp_id# eq 508>
				<CFINCLUDE TEMPLATE="./includes/CustomerService.cfm">
			<CFELSE>
	<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
		<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
		<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>
		</TD>
	</TR>
	<CFLOOP query = "get_user">
		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">
			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
			order by position
		</CFQUERY>
		<cfif #retrieve_user.recordcount# GT 0><tr>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
	</TR>
		</cfif>
	</cfloop>
	</CFIF>
	</table></cfif>

</cfmail>
<cfelse>
<CFMAIL
TO="#get_titleid.verifyemail#"
FROM="webmaster@firsttitleservices.com" Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>

<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   


<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#get_titleid.comp_id#&order_id=#get_titleid.title_id#&user_id_1=#get_titleid.USER_ID#&lo_id=#get_titleid.loan_off_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif><br>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
	<tr>
		<CFIF #comp_id# eq 508>
			<td width=770 align=center colspan = 4 valign=top bgcolor=elelel>
		<CFELSE>
			<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
		</CFIF>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
		</td>
	</tr>
			</center>
		<CFIF #comp_id# eq 508>
			<CFINCLUDE TEMPLATE="./includes/CustomerService.cfm">
		<CFELSE>
	<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
		<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
		<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>
		</TD>
	</TR>
	<CFLOOP query = "get_user">
		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">
			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
			order by position
		</CFQUERY>
		<cfif #retrieve_user.recordcount# GT 0><tr>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
	</TR>
		</cfif>
	</cfloop>
	</CFIF>
	</table></cfif>

</cfmail>
</cfif>
<cfelse>

<cfif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# neq "">
<CFMAIL
TO="#insert_user.cc_email_1#,#insert_user.cc_email_2#"
FROM="webmaster@firsttitleservices.com" Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>
<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#get_titleid.comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif><br>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
	<tr>
		<CFIF #comp_id# eq 508>
			<td width=770 align=center colspan = 4 valign=top bgcolor=elelel>
		<CFELSE>
			<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
		</CFIF>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
		</td>
	</tr>
			</center>
			<CFIF #comp_id# eq 508>
		<CFINCLUDE TEMPLATE="./includes/CustomerService.cfm">
	<CFELSE>

	<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
		<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
		<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>
		</TD>
	</TR>
	<CFLOOP query = "get_user">
		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">
			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
			order by position
		</CFQUERY>
		<cfif #retrieve_user.recordcount# GT 0><tr>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
	</TR>
		</cfif>
	</cfloop>
	</CFIF>
	</table></cfif>

</cfmail>
<cfelseif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# eq "">
<CFMAIL
TO="#insert_user.cc_email_1#"
FROM="webmaster@firsttitleservices.com" Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>
<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#get_titleid.comp_id#&order_id=#get_titleid.title_id#&user_id_1=#get_titleid.USER_ID#&lo_id=#get_titleid.loan_off_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif><br>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
	<tr>
		<CFIF #comp_id# eq 508>
			<td width=770 align=center colspan = 4 valign=top bgcolor=elelel>
		<CFELSE>
			<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
		</CFIF>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
		</td>
	</tr>
			</center>
			<CFIF #comp_id# eq 508>
		<CFINCLUDE TEMPLATE="./includes/CustomerService.cfm">
	<CFELSE>
	<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
		<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
		<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>
		</TD>
	</TR>
	<CFLOOP query = "get_user">
		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">
			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
			order by position
		</CFQUERY>
		<cfif #retrieve_user.recordcount# GT 0><tr>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
	</TR>
		</cfif>
	</cfloop>
	</CFIF>
	</table></cfif>

</cfmail>
<cfelseif #read_user.cc_email_1# eq "" and #read_user.cc_email_2# neq "">
<CFMAIL
TO="#insert_user.cc_email_2#"
FROM="webmaster@firsttitleservices.com" Subject="Copy of Customer Order with 1st Title & Escrow, Inc. #get_titleid.title_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>
<cfif get_titleid.comp_id neq 3889>
<cfmailparam
		file = "c:\huds\HUD_#get_titleid.title_id#.pdf"
		disposition="attachment; filename=""c:\huds\HUD_#get_titleid.title_id#.pdf""">  
</cfif>   



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#get_titleid.comp_id#&order_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif><br>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
	<tr>
		<CFIF #comp_id# eq 508>
			<td width=770 align=center colspan = 4 valign=top bgcolor=elelel>
		<CFELSE>
			<td width=770 align=center colspan = 5 valign=top bgcolor=elelel>
		</CFIF>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
		</td>
	</tr>
			</center>
			<CFIF #comp_id# eq 508>
				<CFINCLUDE TEMPLATE="./includes/CustomerService.cfm">
			<CFELSE>
	<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
		<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
		<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>
		</TD>
	</TR>
	<CFLOOP query = "get_user">
		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">
			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Supervisor, Client Relations' or position = 'Client Relations Associate' or position = 'Manager, Client Relations')
			order by position
		</CFQUERY>
		<cfif #retrieve_user.recordcount# GT 0><tr>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
				<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
	</TR>
		</cfif>
	</cfloop>
	</CFIF>
	</table></cfif>

</cfmail>


<cfelse>
</cfif>

</cfif>




<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = '#read_title.comp_ID#'

		</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_for_indicator">

			SELECT *
			FROM Tax_Cert_prop
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstract">

			SELECT *
			FROM Doc_Abstract_prop
			WHERE prop_ID = #rec_ID#


		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_prop_order2">

			SELECT *
			FROM First_Title_States
			WHERE st_abbrev = '#read_title_order.pstate#'


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request_prop
				Where prop_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_info">
				SELECT *
				FROM eventlist_prop
				Where prop_Id = #rec_id#
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
			FROM Pay_Off_Lender_1_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">
			SELECT *
			FROM Pay_Off_Lender_2_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE ID = '#read_title.comp_id#'
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
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>

<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	<!--- <tr>
		<td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td>
	</tr>
 --->


	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>



<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">

		<cfoutput>
	<TABLE WIDTH="100%" BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width="100%" align=center valign=top bgcolor=elelel>
				<!---  <img src="./images/label_title.gif">  --->
				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Title Commitment Request Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_order.cfm?comp_id=#get_titleid.comp_id#&order_id=#get_titleid.title_id#&user_id_1=#get_titleid.USER_ID#&lo_id=#get_titleid.loan_off_id#"><b>T-#get_titleid.title_id#</b></a></center><br>
				<cfif get_titleid.comp_id neq 3889>
<center>A HUD-1 has been instantly prepared for you and is attached to this email! OR view<a href="https://#cgi.server_name#/fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_titleid.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif><br>





<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH="100%" BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<CFIF #comp_id# eq 508>
			<td width="100%" align=center colspan = 4 valign=top bgcolor=elelel>
		<CFELSE>
			<td width="100%" align=center colspan = 5 valign=top bgcolor=elelel>
		</CFIF>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>

		</center>
		<CFIF #comp_id# eq 508>
			<CFINCLUDE TEMPLATE="./includes/CustomerService.cfm">
		<CFELSE>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFLOOP query = "get_user">

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Title Ordering/Tracking' or position = 'Title Delivery/Review' or position = 'Title Clearance' or position = 'Scheduling Coordinator' or position = 'Processing Asst.' or position = 'Funding Asst.' or position = 'Processor' or position = 'Funder' or position = 'Shipping' or position = 'Manager, Processing' or position = 'Manager, Title Production' or position = 'Manager, Research')
		order by id
		</CFQUERY>



		<cfif #retrieve_user.recordcount# GT 0><tr>
		<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
		</TR>	</cfif>



	</cfloop>



	</CFIF>
	</table></cfif>

</cfoutput>

</td>

	</td>
	</tr>




	</td>
								</tr>
							</table>

						</TD>
					</TR>
				</table>
		</TD>
	</TR>
</TABLE>
</center>
</body>
</html>


</cfif>



<cfelse>






<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = '#read_title.comp_ID#'

		</CFQUERY>




	<CFQUERY datasource="#request.dsn#" NAME="read_for_indicator">

			SELECT *
			FROM Tax_Cert_prop
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstract">

			SELECT *
			FROM Doc_Abstract_prop
			WHERE prop_ID = #rec_ID#


		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_prop_order2">

			SELECT *
			FROM First_Title_States
			WHERE st_abbrev = '#read_title_order.pstate#'


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request_prop
				Where prop_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_info">
				SELECT *
				FROM eventlist_prop
				Where prop_Id = #rec_id#
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
			FROM Pay_Off_Lender_1_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">
			SELECT *
			FROM Pay_Off_Lender_2_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE ID = '#read_title.comp_id#'
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
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>

<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	<!--- <tr>
		<td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td>
	</tr>
 --->


	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>



<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">



<CFFORM NAME="frm" ACTION="./merge_prop_info_ADMIN.cfm?comp_id=#read_title.comp_id#&company_id=#read_title.comp_id#&uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=10" ENCTYPE="multipart/form-data" METHOD=POST >


<CFOUTPUT QUERY="read_title"> <!--- =================================== ---><!--- ===/    [ CLIENT INFO ]  TOP   \=== ---><!--- =================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=bfbfbf>
	<tr>
		<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Thank your for converting your property order to a title commitment.  Please fill out the additional information below to complete the request.</B></CENTER></FONT>
			</td>
	</tr>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CLIENT SPECIFIC INFORMATION</B></CENTER></FONT>
			</td>
		</tr>

			<TR>
			<TD width=519 align=left valign=top bgcolor=blue>
				<FONT SIZE=3 color=white face=arial>
				Order Number is...<b>P-0232#read_title.prop_id#</b></FONT>
			</TD>
		</TR>


		<TR>
			<TD width=519 align=middle valign=top bgcolor=d3d3d3>



				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>


					<tr>
						<td width=100 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Order Date</FONT>

						</td>

						<td width=255 colspan=3 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Due Date -</FONT>

						</td>

						<td width=155 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Appraisal Status -</FONT>


						</td>
					</tr>

					<tr>
						<td width=100 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"> <b>#a_month#/#a_day#/#a_year#</b></FONT>
						</td>

						<td width=85 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Month -	<FONT FACE=verdana SIZE=1 color="blue"><b>#DateFormat(duedate, "mm")#</b></FONT></FONT>
						</td>

						<td width=85 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Day - <FONT FACE=verdana SIZE=1 color="blue"><b>#DateFormat(duedate, "dd")#</b></FONT></FONT>
						</td>

						<td width=85 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Year - <FONT FACE=verdana SIZE=1 color="blue"><b>#DateFormat(duedate, "yyyy")#</b></FONT></FONT>
						</td>

						<td width=155 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#appraisal_status#</b></FONT>
						</td>
					</tr>
				</table></CFOUTPUT>

<CFOUTPUT QUERY="read_title">
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Officer:</b>
						</TD>

						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Processor:</b>
						</TD>

					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#oname#</B>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#pname#</B>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#ophone#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#pphone#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#oext#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#pext#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#ofax#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#pfax#</b>
						</td>
					</tr>

					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>
					</tr>

					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#o_email#</b>
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#p_email#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

</table>
<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>BORROWER / SELLER INFORMATION</B></CENTER><br><FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Borrowers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname1#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame1#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone1#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext1#</b>
						</td>

					</tr>

		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ SECOND ] \=== --->
		<!--- =================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname2#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame2#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone2#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext2#</b>
						</td>

					</tr>

					<tr>
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->

		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Sellers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- ================================== --->
		<!--- ===/  SELLERS Info [ FIRST ]  \=== --->
		<!--- ================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#slastname1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sfirstname1#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sminame1#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sssn1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#shphone1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#swphone1#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sext1#</b>
						</td>

					</tr>

		<!--- ================================== --->
		<!--- ===/ SELLERS  Info [ SECOND ] \=== --->
		<!--- ================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#slastname2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sfirstname2#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sminame2#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sssn2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#shphone2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#swphone2#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sext2#</b>
						</td>

					</tr>

					<tr>
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>

				</table>
			</td>
		</tr>


</table>



<!--- ======================================================================== --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PROPERTY ADDRESS</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Street Address <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#paddress#</b>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							City, State, Zip:</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<NOBR><FONT FACE=verdana SIZE=1 color="blue"><b>#pcity#,&nbsp;#pstate#  #pzip#</b>
							</NOBR>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pcounty#</b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Legal Description <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#plegaldesc#</b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Property Use <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#prop_use_type#</B>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is this a Condo or PUD <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#condo_pud#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>


</table>





<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/       [ COMMENTS ]  TOP         \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>COMMENTS</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#a_COMMENT#</B>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->

<!--- ======================================================================== --->


<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td colspan=2 width=520 align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>TITLE INSURANCE INFORMATION:</B></CENTER>
			</TD>
		</TR>

						<tr>
			<td colspan=2 width=520 align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>To complete the merge, fill in the fields below:</B></CENTER>
			</TD>
		</TR>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Transaction Type
						</td>

						<td width=390 bgcolor="f1f1f1" align=left valign=top>
										<select name="SearchType"
											size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: 003F1E;
											background-color: white;
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
         						<OPTION VALUE="Purchase">Purchase</OPTION>
           						<OPTION VALUE="Refinance" selected>Refinance</OPTION>
           						<OPTION VALUE="New Second Mortgage">New Second Mortgage</OPTION>
										</select>
						</td>

</tr>



						<tr>
					<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Proposed Insured </td></b>
							<td width=394 bgcolor="f1f1f1" COLSPAN=3 align=left valign=top>
							<cfINPUT TYPE="Text" NAME="Insured"  size=50 maxlength=70
									REQUIRED="yes" Message="You must enter Proposed Insured in the TITLE INSURANCE Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;"
									>
						</td>

					</tr>



				<tr>
				<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Loan Amt </b>
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<cfINPUT NAME="loanamt_float" SIZE=20 MAXLENGTH=120
							       	REQUIRED="yes" Message="You must enter Loan Amount in the TITLE INSURANCE Section"

									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
						<FONT FACE=ARIAL SIZE=1 color="blue">format &nbsp;&nbsp;^ xxxxxx^ &nbsp;&nbsp; numbers only</font></td>
					</tr>






		<tr>
			<td colspan=2 width=520 align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<NOBR><input type=image border=0 src="./images/button_proceed.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>

			</TD>
		</TR>




</table>





<!--- ========================================= --->
<!--- ===/        [ PAYOFF ]  TOP          \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PAYOFF INFORMATION:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Payoff Lender  [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#polender1#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#poacctno1#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pophone1#</b>
						</td>
					</tr>

		<!--- ==================================== --->
		<!--- ===/ Payoff Lender  [ SECOND ]  \=== --->
		<!--- ==================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Second Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#polender2#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#poacctno2#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pophone2#</b>
						</td>
					</tr>


					<tr>
						<td width=172 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>

						<td width=172  bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->





<!--- ========================================= --->
<!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Verify Order was Received</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address, you will receive a confirmation  e-mail of your order having been received by us.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail#</b>
						</td>
					</tr>

					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to up to two other e-mail addresses.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail_2#</b><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Fax:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#fax_no#</b>


						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<!--- =========================================== --->
<!--- ===/    [ RECEIVE REPORT ]  TOP        \=== --->
<!--- =========================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Request copy of Final Report</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>If you would like to receive a copy of the final report, please provide us with an email address.</b><br>
			<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail_3#</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#RptbyEmail#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<p>
<!--- ======================================================================== --->

</cfoutput>



</cfform>

</td>

	</td>
	</tr>


	</td>
								</tr>
							</table>

						</TD>
					</TR>
				</table>
		</TD>
	</TR>
</TABLE>
</center>
</body>
</html>






</cfif>







