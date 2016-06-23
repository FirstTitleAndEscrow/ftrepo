
<cfquery name="insertcustomers" DATASOURCE="First_Title_Services">
insert into customers (loginid, oname, ophone, oext, ofax, pname, pphone, pext, pfax, blastname1, bfirstname1, bminame1, bssn1, bhphone1, bwphone1, bext1, blastname2, bfirstname2, bminame2, bssn2, bhphone2, bwphone2, bext2, slastname1, sfirstname1, sminame1, sssn1, shphone1, swphone1, sext1, slastname2, sfirstname2, sminame2, sssn2, shphone2, swphone2, sext2, paddress, pcity, pstate, pzip, pcounty, psearchbefore, plegaldesc, comment, verifyemail) values (#loginid#, '#oname#', '#ophone#', '#oext#', '#ofax#', '#pname#', '#pphone#', '#pext#', '#pfax#', '#blastname1#', '#bfirstname1#', '#bminame1#', '#bssn1#','#bhphone1#', '#bwphone1#', '#bext1#', '#blastname2#', '#bfirstname2#', '#bminame2#', '#bssn2#', '#bhphone2#', '#bwphone2#', '#bext2#', '#slastname1#', '#sfirstname1#', '#sminame1#', '#sssn1#', '#shphone1#', '#swphone1#', '#sext1#', '#slastname2#', '#sfirstname2#', '#sminame2#', '#sssn2#', '#shphone2#', '#swphone2#', '#sext2#', '#paddress#', '#pcity#', '#pstate#', '#pzip#', '#pcounty#', '#psearchbefore#', '#plegaldesc#', '#comment#', '#verifyemail#')
</cfquery>

<cfquery name="getcustid" DATASOURCE="First_Title_Services">
select max(customerid) as "custid" from customers
</cfquery>

<cfoutput>
<cfset  custid=#getcustid.custid#>
</cfoutput>




<cfquery name="insertclosing" DATASOURCE="First_Title_Services">
insert into closing (orderid, customerid, loginid, orderdate, closingtype, closingoption, closingloantype, verifyemail, closingdate, closingtime) values (#orderid#,'#custid#', '#loginid#', '#DateFormat(now())# #TimeFormat(now())#', '#closingtype#', '#closingoption#', '#closingloantype#', '#verifyemail#', '#DateFormat("#closingdate#", "dd-mmm-yyyy")#','#TimeFormat("#closingtime#", "hh:mm tt")#' )
</cfquery>

<cfquery name="getclosingid" DATASOURCE="First_Title_Services">
select closingid from closing where customerid=#custid#
</cfquery>

<cfquery name="updateorder" DATASOURCE="First_Title_Services">
update orders set status='closing' where orderid=#orderid#
</cfquery>




<!---Send a copy of closing order to the customer--->


<CFMAIL
QUERY="getclosingid"
TO="#form.verifyemail#,titleorders@yahoo.com"
FROM="pgibb@firsttitleservices.com" Subject="Summary of Your Closing Order from 1st Title & Escrow, Inc."
TIMEOUT="600"
type=HTML
>
<center>
<h3>Summary of Your Order</h3> <h5>#DateFormat(now(), "mmmm d, yyyy")# at #TimeFormat(now(), "hh:mm tt")#</h5></center>
<table width=455 border="1" cellspacing="0" cellpadding="3" align="center">




<tr>
	<td colspan=2><b>Account Information</b></td>
</tr>

<tr align="middle" valign="center">
<td><font size=3><b>NEW Customer Informatin No.:</b></font></td>
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
	<td width=180><font size=2>Search Before:</td>
	<td>#psearchbefore#</td>
</tr>
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

<tr>
	<td width=180><font size=2>Closing Type:</td>
	<td>#closingtype#</td>
</tr>

<tr>
	<td width=180><font size=2>Closing Option:</td>
	<td>#closingoption#</td>
</tr>

<tr>
	<td width=180>Loan Type:</td>
	<td>#closingloantype#</td>
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





<!---Send a copy of closing order to 1st Title & Escrow, Inc.--->


<CFMAIL
QUERY="getclosingid"
TO="#form.verifyemail#,titleorders@yahoo.com"
FROM="pgibb@firsttitleservices.com" Subject="Copy of Closing Order in 1st Title & Escrow, Inc."
TIMEOUT="600"
type=HTML
>
<center>
<h3>Summary of Closing Order</h3> <h5>#DateFormat(now(), "mmmm d, yyyy")# at #TimeFormat(now(), "hh:mm tt")#</h5></center>
<table width=455 border="1" cellspacing="0" cellpadding="3" align="center">



<tr>
	<td colspan=2><b>Account Information</b></td>
</tr>

<tr align="middle" valign="center">
<td><font size=3><b>NEW Customer Informatin No.:</b></font></td>
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
	<td width=180><font size=2>Search Before:</td>
	<td>#psearchbefore#</td>
</tr>
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

<tr>
	<td width=180><font size=2>Closing Type:</td>
	<td>#closingtype#</td>
</tr>

<tr>
	<td width=180><font size=2>Closing Option:</td>
	<td>#closingoption#</td>
</tr>

<tr>
	<td width=180>Loan Type:</td>
	<td>#closingloantype#</td>
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
