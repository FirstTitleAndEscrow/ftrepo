<CFQUERY DATASOURCE="First_Title_Services" NAME="getcompany">
SELECT company
FROM login
WHERE loginid=#loginid#
</CFQUERY>

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












<!---------- END FORMATTING FOR DUE DATE -------------->


<cfquery name="insertcustomers" DATASOURCE="First_Title_Services">
INSERT INTO customers (loginid, oname, ophone, oext, ofax, pname, pphone, pext, pfax, blastname1, bfirstname1, bminame1, bssn1, bhphone1, bwphone1, bext1, blastname2, bfirstname2, bminame2, bssn2, bhphone2, bwphone2, bext2, slastname1, sfirstname1, sminame1, sssn1, shphone1, swphone1, sext1, slastname2, sfirstname2, sminame2, sssn2, shphone2, swphone2, sext2, paddress, pcity, pstate, pzip, pcounty,  plegaldesc, comment, verifyemail, verifyemail_2, verifyemail_3, rptbyemail)
VALUES (#loginid#, '#oname#', '#ophone#', '#oext#', '#ofax#', '#pname#', '#pphone#', '#pext#', '#pfax#', '#blastname1#', '#bfirstname1#', '#bminame1#', '#bssn1#','#bhphone1#', '#bwphone1#', '#bext1#', '#blastname2#', '#bfirstname2#', '#bminame2#', '#bssn2#', '#bhphone2#', '#bwphone2#', '#bext2#', '#slastname1#', '#sfirstname1#', '#sminame1#', '#sssn1#', '#shphone1#', '#swphone1#', '#sext1#', '#slastname2#', '#sfirstname2#', '#sminame2#', '#sssn2#', '#shphone2#', '#swphone2#', '#sext2#', '#paddress#', '#pcity#', '#pstate#', '#pzip#', '#pcounty#', '#plegaldesc#', '#comment#', '#verifyemail#', '#verifyemail_2#', '#verifyemail_3#' '#rptbyemail#')
</cfquery>

<cfquery name="getcustid" DATASOURCE="First_Title_Services">
select max(customerid) as "custid" from customers
</cfquery>

<cfoutput>
<cfset  custid=#getcustid.custid#>
</cfoutput>


<cfif #choice# is "prop">
<cfquery name="insertordersprop" DATASOURCE="First_Title_Services">
INSERT INTO orders (servicetype, orderdate, customerid, loginid, polender1, poacctno1, pophone1, polender2, poacctno2, pophone2, duedate)
VALUES ('Property Report', '#DateFormat(now())#  #TimeFormat(now())#','#custid#', #loginid#, '#polender1#', '#poacctno1#', '#pophone1#', '#polender2#', '#poacctno2#', '#pophone2#', '#duedate#')
</cfquery>
</cfif>



<cfif #choice# is "title">
<cfquery name="insertorderstitle" DATASOURCE="First_Title_Services">
INSERT INTO orders (servicetype, orderdate, customerid, loginid, searchtype, deedtransfer, insured,loanamt, polender1, poacctno1, pophone1, polender2, poacctno2, pophone2, duedate)
VALUES ('Title Commitment', '#DateFormat(now())#  #TimeFormat(now())#','#custid#', #loginid#, '#searchtype#', '#deedtransfer#', '#insured#', '#loanamt#', '#polender1#', '#poacctno1#', '#pophone1#', '#polender2#', '#poacctno2#', '#pophone2#', '#duedate#')
</cfquery>
</cfif>





<cfquery name="getordid" DATASOURCE="First_Title_Services">
select max(orderid) as "ordid" from orders
</cfquery>
<cfoutput>
<cfset  ordid=#getordid.ordid#>
</cfoutput>






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
				TO="#form.verifyemail#"
				FROM="sdari@firsttitleservices.com"
				SERVER="hq.cyberrealm.net"
				Subject="Summary of Your Order from 1st Title & Escrow, Inc."
				TIMEOUT="600"
				type="HTML"
				>
				<center>
				<h3>Summary of Order for #getcompany.company#</h3> <h5>#DateFormat(now(), "mmmm d, yyyy")# at #TimeFormat(now(), "hh:mm tt")#</h5></center>
				<table width=455 border="1" cellspacing="0" cellpadding="3" align="center">

				<!--- <tr align="middle" valign="center">
				<td><font size=3><b>Customer Information No.:</b></font></td>
				<td align=left>#custid#</td>
				</tr> --->

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


				<cfif #choice# is "prop">
				<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
				<tr>
					<td colspan=2><font size=2 face=arial><b>Property Report</b></td>
				</tr>

				<tr>
					<td width=180><font size=2 face=arial>Order No.:</td>
					<td><font size=2 face=arial>#ordid#</td>
				</tr>

				<!--- <tr>
				<td width=180><font size=2 face=arial>Report Type:</td>
					<td><font size=2 face=arial>#rpttype#</td>
				</tr> --->

				</table><p></p>
				</cfif>



				<cfif #choice# is "title">

				<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
				<tr>
					<td colspan=2><font size=2 face=arial><b>Title Commitment</b></td>
				</tr>

				<tr>
					<td width=180><font size=2 face=arial>Order No.:</td>
					<td><font size=2 face=arial>#ordid#</td>
				</tr>

				<tr>
					<td width=180><font size=2 face=arial>Search Type:</td>
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
					<td align=left><font size=2 face=arial>$#NumberFormat("#loanamt#", "999999.99")#</td>
				</tr>

				</table><p></p>
				</cfif>


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
		</CFIF>

	</CFLOOP>




<!--- Send a copy of order to 1st Title & Escrow, Inc.--->


<!--- sdari@firsttitleservices.com --->


<CFMAIL
TO="sdari@firsttitleservices.com"
FROM="sdari@firsttitleservices.com"
SERVER="hq.cyberrealm.net"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc."
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


<cfif #choice# is "prop">
<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td colspan=2><font size=2 face=arial><b>Property Report:</b></td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Order No.:</td>
	<td><font size=2 face=arial>#ordid#</td>
</tr>

<!--- <tr>
<td width=180><font size=2 face=arial>Report Type:</td>
	<td><font size=2 face=arial>#rpttype#</td>
</tr> --->

</table><p></p>
</cfif>



<cfif #choice# is "title">

<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td colspan=2><font size=2 face=arial><b>Title Commitment:</b></td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Order No.:</td>
	<td><font size=2 face=arial>#ordid#</td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Search Type:</td>
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
	<td align=left><font size=2 face=arial>$#NumberFormat("#loanamt#", "999999.99")#</td>
</tr>


</table><p></p>
</cfif>


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







<CFLOCATION URL="https://#cgi.server_name#/order_verify_final.cfm?loginid=#FORM.loginid#">



