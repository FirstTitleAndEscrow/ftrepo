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
<CFPARAM NAME="file_upload" DEFAULT="">
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
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="ID" DEFAULT="0">


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


<cfquery  datasource="#request.dsn#">

		INSERT INTO
				Appraisal
				( <!--- check_date,
				check_time,   --->
				user_id,
				comp_id,
				loan_off_id,
				oname,
				ophone,
				oext,
				ofax,
				o_email,
				pname,
				pphone,
				pext,
				pfax,
				p_email,
				blastname1,
				bfirstname1,
				bminame1,
				bssn1,
				bhphone1,
				bwphone1,
				bext1,
				blastname2,
				bfirstname2,
				bminame2,
				bssn2,
				bhphone2,
				bwphone2,
				bext2,
				slastname1,
				sfirstname1,
				sminame1,
				sssn1,
				shphone1,
				swphone1,
				sext1,
				slastname2,
				sfirstname2,
				sminame2,
				sssn2,
				shphone2,
				swphone2,
				sext2,
				paddress,
				pcity,
				pstate,
				pzip,
				pcounty,
				plegaldesc,
				a_comment,
				verifyemail,
				verifyemail_2,
				verifyemail_3,
				fax_no,
				rptbyemail,
				a_insert_date,
				a_insert_time,
				duedate,
				pay_method,
				order_date_adjusted,
				oda_day,
				oda_month,
				oda_year,
				oda_day_of_year,
				appraisal_status,
				a_day,
				a_month,
				a_year,
				a_day_of_year,
				order_status,
				prop_use_type,
				condo_pud,
				appraisal_type,
				estimate_value,
				app_credit_card,
				app_cc_num,
				app_cc_exp_month,
				app_cc_exp_year,
				app_cc_name,
				app_ck_acct_name,
				app_ck_addr1,
				app_ck_addr2,
				app_ck_city,
				app_ck_state,
				app_ck_acct_no,
				app_ck_bank,
				app_ck_route_no,
				payment_type_1,
				partial_cod,
				codA)

				VALUES ( <!--- '#DateFormat(Now(), "mm-dd-yyyy")#',
						'#TimeFormat(Now(), "HH:mm:ss")#',  --->
						#user_id_1#,
						#RU.comp_id#,
						#lo_id#,
						'#rlo_name#',
						'#RLO.lo_phone#',
				 		'#RLO.lo_ext#',
						'#RLO.lo_fax#',
						'#RLO.lo_email#',
						'#ru_name#',
						'#RU.lp_phone#',
						'#RU.lp_ext#',
						'#RU.lp_fax#',
						'#RU.lp_email#',
						'#blastname1#',
						'#bfirstname1#',
						'#bminame1#',
						'#bssn1#',
						'#bhphone1#',
						'#bwphone1#',
						'#bext1#',
						'#blastname2#',
						'#bfirstname2#',
						'#bminame2#',
						'#bssn2#',
						'#bhphone2#',
						'#bwphone2#',
						'#bext2#',
						'#slastname1#',
						'#sfirstname1#',
						'#sminame1#',
						'#sssn1#',
						'#shphone1#',
						'#swphone1#',
						'#sext1#',
						'#slastname2#',
						'#sfirstname2#',
						'#sminame2#',
						'#sssn2#',
						'#shphone2#',
						'#swphone2#',
						'#sext2#',
						'#paddress#',
						'#pcity#',
						'#pstate#',
						'#pzip#',
						'#pcounty#',
						'#plegaldesc#',
						'#a_comment#',
						'#verifyemail#',
						'#verifyemail_2#',
						'#verifyemail_3#',
						'#fax_no#',
						'#rptbyemail#',
						'#a_insert_date#',
						'#a_insert_time#',
						'#duedate#',
						'#pay_by#',
						'#order_date_adj#',
						#a_day_1#,
						#a_month_1#,
						#a_year_1#,
						#oda_day_of_year_1#,
						'#app_stat#',
						#a_day_1#,
						#a_month_1#,
						 #a_year_1#,
						 #a_day_of_year_1#,
						 1,
						 '#prop_use_type#',
						'#condo_pud#',
						 '#appraisal_type#',
						'#NumberFormat(estimate_value, "9999999999.99")#',
						'#app_credit_card#',
						'#app_cc_num#',
						#app_cc_exp_month#,
						#app_cc_exp_year#,
						'#app_cc_name#',
						'#app_ck_acct_name#',
						'#app_ck_addr1#',
						'#app_ck_addr2#',
						'#app_ck_city#',
						'#app_ck_state#',
						'#app_ck_acct_no#',
						'#app_ck_bank#',
						'#app_ck_route_no#',
						'#payment_type_1#',
						'#partial_cod#',
						'A')
			</cfquery>
						<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
	SELECT *
	FROM Appraisal
	WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="getcompany">
	SELECT *
	FROM companies
	WHERE ID = #RU.comp_id#
</CFQUERY>

<!-------------------------------------------------------------------->

<!--- ================================================= --->
<!--- ===/ [ Output file for TSS Import Function ] \=== --->
<!--- ================================================= --->

<CFSET d_out = '"' & #get_titleid.app_id# & '"' & ","  &
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
				'"' & #condo_pud# & '"' & "," &
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
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	variable="n_OUT">

<!--- increment that number --->

	<CFSET n_no = #n_out# + "1">

<!--- delete the old file with the old number --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\file_number\file_no.txt" --->
	<CFFILE ACTION="delete"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	>
<!--- write the new number to the file --->

	<CFFILE ACTION="WRITE"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\file_number\file_no.txt"
	OUTPUT="#n_no#">

<!--- now writ the data for this order to the file --->
<!--- FILE="F:\InetPub\wwwroot\71.068___www.firsttitleservices.com\dhfvtywty_1\data_#n_no#.txt" --->
	<CFFILE ACTION="WRITE"
	FILE="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\dhfvtywty_1\data_#n_no#.txt"
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



			<CFSET t_to_email = #get_titleid.verifyemail# & ",titleorders@yahoo.com,operations@plourdegroup.com,spape@firsttitleservices.com" >




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
					Your Order ID is - #get_titleid.app_id# - Please use this when communicationg with our associates.

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


					Order No.: #get_titleid.app_id#



				</cfmail>
		</CFIF>

	</CFLOOP>




<!--- Send a copy of order to 1st Title & Escrow, Inc.--->


			<CFSET t_to_email = "sdari@firsttitleservices.com,spape@firsttitleservices.com,titleorders@yahoo.com" >

<!--- </CFIF> --->



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

<A HREF="https://#cgi.server_name#/send_info.cfm?id_pass=#get_titleid.app_id#">
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
<td align=left>#get_titleid.app_id#</td>
</tr>
<tr align="middle" valign="center">
<td><font size=3><b>Customer Information No.:</b></font></td>
<td align=left>#get_titleid.app_id#</td>
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
<!--- <tr>
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
 --->

</table><p></p>



</cfmail>


<CFif #other# eq 1>
<CENTER>
<table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
	<tr><td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td></tr>
	<tr><td width=607 align=center valign=top><NOBR><a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td></tr>
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

<CFFORM NAME="frm" ACTION="./order_verify_title_ancillary.cfm?rec_id=#rec_id#&a_trigger=2&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&blastname1=#blastname1#&bfirstname1=#bfirstname1#&bminame1=#bminame1#&bssn1=#bssn1#&bhphone1=#bhphone1#&bwphone1=#bwphone1#&bext1=#bext1#&blastname2=#blastname2#&bfirstname2=#bfirstname2#&bminame2=#bminame2#&bssn2=#bssn2#&bhphone2=#bhphone2#&bwphone2=#bwphone2#&bext2=#bext2#&slastname1=#slastname1#&sfirstname1=#sfirstname1#&sminame1=#sminame1#&sssn1=#sssn1#&shphone1=#shphone1#&swphone1=#swphone1#&sext1=#sext1#&slastname2=#slastname2#&sfirstname2=#sfirstname2#&sminame2=#sminame2#&sssn2=#sssn2#&shphone2=#shphone2#&swphone2=#swphone2#&sext2=#sext2#&paddress=#paddress#&pcity=#pcity#&pstate=#pstate#&pzip=#pzip#&pcounty=#pcounty#&plegaldesc=#plegaldesc#&prop_use_type=#prop_use_type#&condo_pud=#condo_pud#&a_comment=#a_comment#&polender1=#polender1#&poacctno1=#poacctno1#&pophone1=#pophone1#&polender2=#polender2#&poacctno2=#poacctno2#&pophone2=#pophone2#&SearchType=#SearchType#&Deedtransfer=#Deedtransfer#&Insured=#Insured#&otherpro=#otherpro#&loanamt_float=#loanamt_float#&loan_type_111=#loan_type_111#&loan_program_333=#loan_program_333#&Verifyemail=#Verifyemail#&Verifyemail_2=#Verifyemail_2#&Verifyemail_3=#Verifyemail_3#&fax_no=#fax_no#&RptbyEmail=#RptbyEmail#&request_icl=#request_icl#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#" ENCTYPE="multipart/form-data" METHOD=POST>



   <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ANCILLARY PRODUCT CHOICES</B></CENTER>
			</TD>


		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>


<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
					<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
					Flood
						</td>


						<td width=219 bgcolor="f1f1f1" align=left valign=top>
	<select name="flood"
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
									<OPTION VALUE="">Select</OPTION>
									<OPTION VALUE="Basic">Basic Flood Certification</OPTION>
								<OPTION VALUE="Life">Life of Loan Certification</OPTION>
								<OPTION VALUE="hmda">HMDA</OPTION>

							</select>
	</td></tr>
	<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
					AVM
						</td>

						<td width=219 bgcolor="f1f1f1" align=left valign=top>
	<select name="avm"
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
								<OPTION VALUE="">Select</OPTION>
								<OPTION VALUE="Home">Home Value Explorer</OPTION>
								<OPTION VALUE="First" >First AVM</OPTION>
								<!--- <OPTION VALUE="Phone" >Phone Closing</OPTION>
								<OPTION VALUE="Platinium" >Platinium Signing (phone or notary)</OPTION>
							 --->
							</select>
	</td></tr>


						<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
					Credit
						</td>

						<td width=519 bgcolor="f1f1f1" align=left valign=top>
	<select name="credit"
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
								<OPTION VALUE="">Select</OPTION>
										<OPTION VALUE="singind">Single Infile Report -- Individual</OPTION>
							<OPTION VALUE="singjoint">Single Infile Report -- Joint</OPTION>
							<OPTION VALUE="doubleind">Double Merge Report -- Individual</OPTION>
							<OPTION VALUE="doublejoint">Double Merge Report -- Joint</OPTION>
							<OPTION VALUE="trind">Tri-Merge Report -- Individual</OPTION>
							<OPTION VALUE="trijoint">Tri-Merge Report -- Joint</OPTION>
							<OPTION VALUE="rcmr">RCMR'S</OPTION>
							<OPTION VALUE="trade">Trade Update</OPTION>
							</select>
	</td></tr>

					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
			Signing
						</td>

						<td width=519 bgcolor="f1f1f1" align=left valign=top>
	<select name="signing"
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
								<OPTION VALUE="">Select</OPTION>
								<OPTION VALUE="attorney">Attorney/Title Agent</OPTION>
								<OPTION VALUE="notary" >Notary</OPTION>
								<OPTION VALUE="Phone" >Phone Closing</OPTION>
								<OPTION VALUE="Platinium" >Platinium Signing (phone or notary)</OPTION>
							</select>
		</td></tr>
<tr><td width=607 align=right colspan = 2 valign=bottom>

			<NOBR><input type=image border=0 src="./images/button_submit_title.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>

	<tr>
				</table>


			</TD>
	</TR>
</TABLE>
		</TD>
	</TR>
</TABLE>
<p>


	<tr><td width=607 align=left valign=bottom><IMG src="./images/bottom.gif"></td></tr></table></cfform>
<cfelse>
<CFLOCATION URL="https://#cgi.server_name#/order_verify_display_title.cfm?order_id=#get_titleid.app_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

</cfif>


