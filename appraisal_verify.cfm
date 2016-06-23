
<CFQUERY DATASOURCE="First_Title_Services" NAME="getcompany">
SELECT company
FROM login
WHERE loginid=#loginid#
</CFQUERY>



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


	<cfquery name="insertcustomers" DATASOURCE="First_Title_Services">

		INSERT INTO customers (loginid, oname, ophone, oext, ofax, pname, pphone, pext, pfax, blastname1, bfirstname1, bminame1, bssn1, bhphone1, bwphone1, bext1, blastname2, bfirstname2, bminame2, bssn2, bhphone2, bwphone2, bext2, slastname1, sfirstname1, sminame1, sssn1, shphone1, swphone1, sext1, slastname2, sfirstname2, sminame2, sssn2, shphone2, swphone2, sext2, paddress, pcity, pstate, pzip, pcounty,  plegaldesc, comment, verifyemail, verifyemail_2, verifyemail_3, rptbyemail, est_value, do_appraisal, a_insert_date, a_insert_time )
		VALUES (#loginid#, '#oname#', '#ophone#', '#oext#', '#ofax#', '#pname#', '#pphone#', '#pext#', '#pfax#', '#blastname1#', '#bfirstname1#', '#bminame1#', '#bssn1#','#bhphone1#', '#bwphone1#', '#bext1#', '#blastname2#', '#bfirstname2#', '#bminame2#', '#bssn2#', '#bhphone2#', '#bwphone2#', '#bext2#', '#slastname1#', '#sfirstname1#', '#sminame1#', '#sssn1#', '#shphone1#', '#swphone1#', '#sext1#', '#slastname2#', '#sfirstname2#', '#sminame2#', '#sssn2#', '#shphone2#', '#swphone2#', '#sext2#', '#paddress#', '#pcity#', '#pstate#', '#pzip#', '#pcounty#', '#plegaldesc#', '#comment#', '#verifyemail#', '#verifyemail_2#', '#verifyemail_3#', '#rptbyemail#', '#estimate_value#', 'Yes', '#a_insert_date#', '#a_insert_time#')

	</cfquery>

<cfquery name="getcustid" DATASOURCE="First_Title_Services">
	SELECT customerid, a_insert_date, a_insert_time
	FROM customers
	WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
</cfquery>

<cfoutput>
<cfset  custid = #getcustid.customerid# >
</cfoutput>



	<cfquery name="insertordersprop" DATASOURCE="First_Title_Services">
		INSERT INTO orders (servicetype, orderdate, customerid, loginid, polender1, poacctno1, pophone1, polender2, poacctno2, pophone2, duedate, do_appraisal, appraisal_type, est_value, app_credit_card, app_cc_num, app_cc_exp, app_cc_name, app_ck_acct_name, app_ck_addr1, app_ck_addr2, app_ck_city, app_ck_state, app_ck_acct_no, app_ck_bank, app_ck_route_no, a_insert_date, a_insert_time, payment_type_1, partial_cod, cust_comment, order_date_adjusted)
		VALUES ('Appraisal', '#DateFormat(now())#  #TimeFormat(now())#','#custid#', #loginid#, '', '', '', '', '', '', '#duedate#', '#FORM.do_appraisal#', '#appraisal_type#',  '#estimate_value#', '#app_credit_card#', '#app_cc_num#', '#app_cc_exp#', '#app_cc_name#', '#app_ck_acct_name#', '#app_ck_addr1#', '#app_ck_addr2#', '#app_ck_city#', '#app_ck_state#', '#app_ck_acct_no#', '#app_ck_bank#', '#app_ck_route_no#', '#a_insert_date#', '#a_insert_time#', '#payment_type_1#', '#partial_cod#', '#comment#', '#order_date_adj#')
	</cfquery>







<cfquery name="get_order_id" DATASOURCE="First_Title_Services">
SELECT orderid, a_insert_date, a_insert_time
FROM orders
WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
</cfquery>


<cfoutput>
<cfset  ordid = #get_order_id.orderid#>
</cfoutput>


<!--- If the user wanted an Appraisal then we do this --->

<CFIF IsDefined("FORM.verifyemail")>

	<CFSET v_email = #FORM.verifyemail#>

<CFELSE>

	<CFSET v_email = "">

</CFIF>


		<cfquery DATASOURCE="First_Title_Services">
			INSERT INTO appraisal (order_id, servicetype, status, orderdate, customerid, loginid,  duedate, appraisal_type, est_value, appraisal_status, cust_comments, app_comments, ent_by, verifyemail)
			VALUES ('#ordid#', 'Appraisal Request', 'In Process', '#DateFormat(now())#  #TimeFormat(now())#','#custid#', #loginid#,  '', '#FORM.appraisal_type#', '#NumberFormat(FORM.estimate_value, "9999999999.99")#', 'In Process', '#comment#', ' ', '#getcompany.company#', '#v_email#')
		</cfquery>





<!-------------------------------------------------------------------->





<!---Send a copy of order to the customer if #form.verifyemail# is not null--->



<!--- here is where we loop thru the VERIFICATION e-mail list --->
<!--- and send an e-mail to each person on the list --->

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

				<CFMAIL
				TO="#form.verifyemail#,titleorders@yahoo.com,operations@plourdegroup.com"
				FROM="pgibb@firsttitleservices.com" Subject="Appraisal Only Request Form"
				TIMEOUT="600"
				>

				Appraisal Only Request Form

				[ ORDER ID ]
					Your Order ID is - #ordid# - Please use this when communicationg with our associates.

				Summary of Order for #getcompany.company#
				#DateFormat(now(), "mmmm d, yyyy")# at #TimeFormat(now(), "hh:mm tt")#
				Officer:
				Name: #oname#
				Phone No./~Ext.: #ophone#/~#oext#
				Fax No.:#ofax#

				Processor:
				Name: #pname#
				Phone No./~Ext.: #pphone#/~#pext#
				Fax No.: #pfax#
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

				Comment: #comment#

				[ Appraisal Info ]

					Appraisal Type: #appraisal_type#
					Estimated Value : #estimate_value#



				</cfmail>
		</CFIF>

	</CFLOOP>









<!--- Send a copy of order to 1st Title & Escrow, Inc.--->

<!--- pgibb@firsttitleservices.com --->


<CFMAIL
TO="pgibb@firsttitleservices.com,titleorders@yahoo.com,operations@plourdegroup.com"
FROM="pgibb@firsttitleservices.com" Subject="Copy of Customer Appraisal Only Request Form"
TIMEOUT="600"
type="HTML"
>
<center>
<h3>Summary of Customer Order</h3> <h5>#DateFormat(now(), "mmmm d, yyyy")# at #TimeFormat(now(), "hh:mm tt")#</h5>

<A HREF="https://#cgi.server_name#/send_info.cfm?id_pass=#custid#">
Send to Third Party by Email</a><P>
</center>
<table width=455 border="1" cellspacing="0" cellpadding="3" align="center">
<tr>
	<td colspan=2><b>Account Information</b></td>
</tr>

<tr>
	<td colspan=2><b>Appraisal Only Request Form</b></td>
</tr>


<tr align="middle" valign="center">
<td><font size=3><b>ORDER ID :</b></font></td>
<td align=left>#ordid#</td>
</tr>
<tr align="middle" valign="center">
<td><font size=3><b>Customer Information No.:</b></font></td>
<td align=left>#custid#</td>
</tr>

<tr>
	<td colspan=2><b>Officer:</b></td>
</tr>

<tr>
	<td width=180><font size=2>Name:</td>
	<td>#oname#</td>
</tr>
<tr>
	<td width=180><font size=2>Phone No./~Ext.:</td>
	<td>#ophone#/~#oext#</td>
</tr>
<tr>
	<td width=180><font size=2>Fax No.:</td>
	<td>#ofax#</td>
</tr>

<tr>
	<td colspan=2><b>Processor:</b></td>
</tr>

<tr>
	<td width=180><font size=2>Name:</td>
	<td>#pname#</td>
</tr>
<tr>
	<td width=180><font size=2>Phone No./~Ext.:</td>
	<td>#pphone#/~#pext#</td>
</tr>
<tr>
	<td width=180><font size=2>Fax No.:</td>
	<td>#pfax#</td>
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

<!--- <tr>
	<td width=180><font size=2>Search Before:</td>
	<td>#psearchbefore#</td>
</tr> --->
<tr>
	<td width=180><font size=2>Legal Description:</td>
	<td>#plegaldesc#</td>
</tr>
</table>

<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td width=180><b>Comment:</b></td>
	<td>#comment#</td>
</tr>
</table><p></p>



<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td colspan=2><font size=2 face=arial><b>Property Report:</b></td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Order No.:</td>
	<td><font size=2 face=arial>#ordid#</td>
</tr>



</table><p></p>

<!---  INDICATE APPRAISAL INFORMATION --->



	<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
		<tr>
			<td colspan=2><font size=2 face=arial><b>Appraisal Information</b></td>
		</tr>

		<tr>
			<td width=180><font size=2 face=arial>Appraisal Type</td>
			<td><font size=2 face=arial>#FORM.appraisal_type#</td>
		</tr>

		<tr>
			<td width=180><font size=2 face=arial>Estimated Value</td>
			<td><font size=2 face=arial>#FORM.estimate_value#</td>
		</tr>
	</table>

</td>
</tr>
</table><p></p>







</cfmail>







<CFLOCATION URL="https://#cgi.server_name#/order_verify_final.cfm?loginid=#loginid#&acct_num=#acct_num#&password=#password#">


