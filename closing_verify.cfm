
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
	<!---- Next Business Day ---->
	<!--------------------------->

	<CFIF #num_day# EQ 1>
	<!--- If it's Sunday, next bus day is a Monday (+1) --->
		<CFSET add_day = #DateAdd('D', 1, #today#)#>
	<CFELSEIF #num_day# EQ 2>
	<!--- If it's a Monday, next bus day is a Tuesday (+1) --->
		<CFSET add_day = #DateAdd('D', 1, #today#)#>
	<CFELSEIF #num_day# EQ 3>
	<!--- If it's a Tuesday, next bus day is a Wednesday (+1) --->
		<CFSET add_day = #DateAdd('D', 1, #today#)#>
	<CFELSEIF #num_day# EQ 4>
	<!--- If it's a Wednesday, next bus day is a Thursday (+1) --->
		<CFSET add_day = #DateAdd('D', 1, #today#)#>
	<CFELSEIF #num_day# EQ 5>
	<!--- If it's a Thursday, next bus day is a Friday (+1) --->
		<CFSET add_day = #DateAdd('D', 1, #today#)#>
	<CFELSEIF #num_day# EQ 6>
	<!--- If it's a Friday, next bus day is a Monday (+3) --->
		<CFSET add_day = #DateAdd('D', 3, #today#)#>
	<CFELSE>
	<!--- It's a Saturday, next bus day is a Monday (+2) --->
		<CFSET add_day = #DateAdd('D', 2, #today#)#>
	</CFIF>



	<CFSET duedate = #DateFormat(#add_day#, "DD-MMM-YY")#>


<!---------- END FORMATTING FOR DUE DATE -------------->

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>

<cfquery name="insertcustomers" DATASOURCE="First_Title_Services">
insert into customers (loginid, oname, ophone, oext, ofax, pname, pphone, pext, pfax, blastname1, bfirstname1, bminame1, bssn1, bhphone1, bwphone1, bext1, blastname2, bfirstname2, bminame2, bssn2, bhphone2, bwphone2, bext2, slastname1, sfirstname1, sminame1, sssn1, shphone1, swphone1, sext1, slastname2, sfirstname2, sminame2, sssn2, shphone2, swphone2, sext2, paddress, pcity, pstate, pzip, pcounty, plegaldesc, comment, verifyemail, a_insert_time, a_insert_date)
values (#loginid#, '#oname#', '#ophone#', '#oext#', '#ofax#', '#pname#', '#pphone#', '#pext#', '#pfax#', '#blastname1#', '#bfirstname1#', '#bminame1#', '#bssn1#','#bhphone1#', '#bwphone1#', '#bext1#', '#blastname2#', '#bfirstname2#', '#bminame2#', '#bssn2#', '#bhphone2#', '#bwphone2#', '#bext2#', '#slastname1#', '#sfirstname1#', '#sminame1#', '#sssn1#', '#shphone1#', '#swphone1#', '#sext1#', '#slastname2#', '#sfirstname2#', '#sminame2#', '#sssn2#', '#shphone2#', '#swphone2#', '#sext2#', '#paddress#', '#pcity#', '#pstate#', '#pzip#', '#pcounty#',  '#plegaldesc#', '#comment#', '#verifyemail#', '#c_time#', '#c_date#')
</cfquery>

<cfquery name="getcustid" DATASOURCE="First_Title_Services">
select * from customers
WHERE a_insert_time = '#c_time#' AND a_insert_date = '#c_date#'
</cfquery>

<!--- <cfoutput>
<cfset  custid=#getcustid.custid#>
</cfoutput>
 select max(customerid) as "custid" from customers--->

<!--- convert the month, day and year from Closing.cfm into a usable variable --->
<CFOUTPUT>
<CFSET closingdate = '#comfirm_day#-#confirm_mon#-#confirm_year#'>
<CFSET packageready = '#select_day#-#select_mon#-#select_year#'>
</CFOUTPUT>

<cfquery name="insertclosing" DATASOURCE="First_Title_Services">
INSERT INTO closing (orderid, customerid, loginid, orderdate, closingoption, closingloantype, borrowernum, lendernum, packagesent, instructions, phonecontact, packageready, verifyemail, closingdate, closingtime)
VALUES (#orderid#, #getcustid.customerid#, '#loginid#', '#DateFormat(now())# #TimeFormat(now())#', '#closingoption#', '#closingloantype#', '#borrowernum#', '#lendernum#', '#packagesent#', '#instructions#', '#phonecontact#', '#packageready#', '#verifyemail#', '#closingdate#', '#closingtime#' )
</cfquery>

<cfquery name="getclosingid" DATASOURCE="First_Title_Services">
select closingid from closing where customerid=#getcustid.customerid#
</cfquery>

<cfquery name="updateorder" DATASOURCE="First_Title_Services">
update orders set status='closing' where orderid=#orderid#
</cfquery>




<!---,  pgibb@firsttitleservices.com. Send a copy of closing order to the customer  titleorders@yahoo.com, pgibb@firsttitleservices.com --->


<CFMAIL
QUERY="getclosingid"
TO=" #verifyemail#, pgibb@firsttitleservices.com, pgibb@firsttitleservices.com"
FROM="pgibb@firsttitleservices.com" Subject="Summary of Your Closing Order from 1st Title & Escrow, Inc."
TIMEOUT="600"
>
Summary of Your Order
#DateFormat(now(), "mmmm d, yyyy")# at #TimeFormat(now(), "hh:mm tt")#

Officer:
Name: #oname#
Phone No./~Ext.: #ophone#/~#oext#
Fax No.: #ofax#

Processor:
Name: #pname#
Phone No./~Ext.: #pphone#/~#pext#
Fax No.: #pfax#
Verify through Email: #verifyemail#

Borrower/Seller Information
Borrower 1:
Full Name (Last Name, First Name Mi): #blastname1#, #bfirstname1# #bminame1#
SSN: #bssn1#
Home Phone: #bhphone1#
Work Phone No./~Ext.: #bwphone1#/~#bext1#

Borrower 2:
Full Name (Last Name, First Name Mi): #blastname2#, #bfirstname2# #bminame2#
SSN: #bssn2#
Home Phone: #bhphone2#
Work Phone No./~Ext.: #bwphone2#/~#bext2#

Seller 1:
Full Name (Last Name, First Name Mi): #slastname1#, #sfirstname1# #sminame1#
SSN: #sssn1#
Home Phone: #shphone1#
Work Phone No./~Ext.: #swphone1#/~#sext1#

Seller 2:
Full Name (Last Name, First Name Mi): #slastname2#, #sfirstname2# #sminame2#
SSN: #sssn2#
Home Phone: #shphone2#
Work Phone No./~Ext.: #swphone2#/~#sext2#

Property Information
Address: #paddress#
City, State Zip: #pcity#, #pstate#  #pzip#
County: #pcounty#
Legal Description: #plegaldesc#
Comment: #comment#

Closing Order
Closing Order No.: #Closingid#
Closing Option: #closingoption#
Loan Type: #closingloantype#
After-hours contact (Processor or Loan Officer): #phonecontact#
Date package will be ready: #packageready#
How will the package be sent: #packagesent#
Other contact numbers for the borrower: #borrowernum#
Lender contact for Loan Docs: #lendernum#
Special Instructions: #instructions#

Verify Through Email: #verifyemail#
Closing Date: #closingdate#
Closing Time: #closingtime#
Associated Previous Order No.:#orderid#

</cfmail>





<!---pgibb@firsttitleservices.com, Send a copy of closing order to 1st Title & Escrow, Inc.,, titleorders@yahoo.com --->


<CFMAIL
QUERY="getclosingid"
TO="pgibb@firsttitleservices.com, pgibb@firsttitleservices.com"
FROM="jglazer@a1is.com" Subject="Copy of Customer Closing Order with 1st Title & Escrow, Inc."
TIMEOUT="600"
type=HTML
>
<center>
<h3>Summary of Customer Closing Order</h3> <h5>#DateFormat(now(), "mmmm d, yyyy")# at #TimeFormat(now(), "hh:mm tt")#</h5></center>
<table width=455 border="1" cellspacing="0" cellpadding="3" align="center">



<tr>
	<td colspan=2><b>Account Information</b></td>
</tr>

<tr align="middle" valign="center">
<td><font size=3><b>NEW Customer Informatin No.:</b></font></td>
<td align=left>#getcustid.customerid#</td>
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
	<td colspan=2><b>Closing Order</b></td>
</tr>



<tr>
	<td width=180><b>Closing Order No.:</b></td>
	<cfoutput>
	<td><b>#Closingid#</b></td>
	</cfoutput>
</tr>

<!--- <tr>
	<td width=180><font size=2>Closing Type:</td>
	<td>#closingtype#</td>
</tr> --->

<tr>
	<td width=180><font size=2>Closing Option:</td>
	<td>#closingoption#</td>
</tr>

<tr>
	<td width=180>Loan Type:</td>
	<td>#closingloantype#</td>
</tr>

<tr>
	<td width=180>After-hours contact number (Processor or Loan Officer):</td>
	<td>#phonecontact#</td>
</tr>

<tr>
	<td width=180>Date package will be ready:</td>
	<td>#packageready#</td>
</tr>
<tr>
	<td width=180>How will package be sent:</td>
	<td>#packagesent#</td>
</tr>

<tr>
	<td width=180>Other contact numbers for the borrower:</td>
	<td>#borrowernum#</td>
</tr>
<tr>
	<td width=180>Lender contact for Loan Docs:</td>
	<td>#lendernum#</td>
</tr>
<tr>
	<td width=180>Special Instructions:</td>
	<td>#instructions#</td>
</tr>
<tr>
	<td width=180><font size=2>Verify Through Email:</td>
	<td>#verifyemail#</td>
</tr>
<tr>
	<td width=180><font size=2>Closing Date:</td>
	<td>#closingdate#</td>
</tr>
<tr>
	<td width=180><font size=2>Closing Time:</td>
	<td>#closingtime#</td>
</tr>


<tr>
	<td width=180><b>Associated Previous Order No.:</b></td>
	<td><b>#orderid#</b></td>
</tr>

</table>

</cfmail>








<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Closing Order</title>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.gif"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT></td></tr><tr><td colspan="2" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_02.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_04.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><A href="./customer_login.cfm"><IMG border=0 src="./images/nav_06.gif"></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_08.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_10.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><br></td><td>

<TABLE WIDTH=440 BORDER=0 CELLSPACING=0 align="center">
<TR>
<TD ALIGN=middle>
<FONT FACE=ARIAL COLOR="blue" SIZE=5>
<b>Thank you.</b></FONT><p>
<FONT FACE=ARIAL COLOR="blue" SIZE=4>
Your closing order has been received.</FONT></TD></TR></table><p></p>

<table border=0 align=center>
<FORM METHOD="POST" ACTION="./account_menu.cfm">


<cfoutput>
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#">
</cfoutput>


<TR ALIGN=CENTER><TD><input type="submit"  value="Back to Menu"></TD></TR>
</FORM>

</TABLE>

</td></tr>
</table></NOBR>

<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>
