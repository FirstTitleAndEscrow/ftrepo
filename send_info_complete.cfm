<CFQUERY DATASOURCE="First_Title_Services" name="orders">
SELECT *
FROM Orders
WHERE customerid = #id_pass#
</CFQUERY>

<CFQUERY DATASOURCE="First_Title_Services" name="cust">
SELECT *
FROM Customers
WHERE customerid = #id_pass#
</CFQUERY>


<CFMAIL
TO="#to#,titleorders@yahoo.com"
FROM="sdari@firsttitleservices.com" subject="#subject#"
TIMEOUT="600"
type=HTML

>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
	<TITLE>First Title Services Information</TITLE>
</HEAD>

<BODY>

<P align="center">#extra#</P>


<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td colspan=2><b>Borrower/Seller Information</b></td>

</tr>

<tr>
	<td colspan=2><b>Borrower 1:</b></td>

</tr>

<tr>
	<td width=180><font size=2>Full Name (Last Name, First Name Mi):</td>
	<td>#cust.blastname1#, #cust.bfirstname1# #cust.bminame1#</td>
</tr>

<tr>
	<td width=180><font size=2>SSN:</td>
	<td>#cust.bssn1#</td>
</tr>

<tr>
	<td colspan=2><b>Seller 1:</b></td>
</tr>


<tr>
	<td width=180><font size=2>Full Name (Last Name, First Name Mi):</td>
	<td>#cust.slastname1#, #cust.sfirstname1# #cust.sminame1#</td>
</tr>
<tr>
	<td width=180><font size=2>SSN:</td>
	<td>#cust.sssn1#</td>
</tr>

<tr>
	<td width=180><font size=2>Home Phone:</td>
	<td>#cust.shphone1#</td>
</tr>
<tr>
	<td width=180><font size=2>Work Phone No./~Ext.:</td>
	<td>#cust.swphone1#/~#cust.sext1#</td>
</tr>
<tr>
	<td colspan=2><b>Seller 2:</b></td>
</tr>


<tr>
	<td width=180><font size=2>Full Name (Last Name, First Name Mi):</td>
	<td>#cust.slastname2#, #cust.sfirstname2# #cust.sminame2#</td>
</tr>

<tr>
	<td width=180><font size=2>SSN:</td>
	<td>#cust.sssn2#</td>
</tr>

<tr>
	<td width=180><font size=2>Home Phone:</td>
	<td>#cust.shphone2#</td>
</tr>
<tr>
	<td width=180><font size=2>Work Phone No./~Ext.:</td>
	<td>#cust.swphone2#/~#cust.sext2#</td>
</tr>
</table>

<p></p>

<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td colspan=2><b>Property Information</b></td>

</tr>

<tr>
	<td width=180><font size=2>Address:</td>
	<td>#cust.paddress#</td>
</tr>


<tr>
	<td width=180><font size=2>City, State Zip:</td>
	<td>#cust.pcity#, #cust.pstate#&nbsp;#cust.pzip#</td>
</tr>


<tr>
	<td width=180><font size=2>County:</td>
	<td>#cust.pcounty#</td>
</tr>
</table>

<p></p>


<cfif #orders.servicetype# is "Property Report">
<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td colspan=2><font size=2 face=arial><b>Property Report:</b></td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Order No.:</td>
	<td><font size=2 face=arial>#orders.orderid#</td>
</tr>

<!--- <tr>
<td width=180><font size=2 face=arial>Report Type:</td>
	<td><font size=2 face=arial>#rpttype#</td>
</tr> --->

</table><p></p>
</cfif>



<cfif #orders.servicetype# is "Title Commitment">

<table border=1 cellspacing=0 cellpadding=3 align=center width=455>
<tr>
	<td colspan=2><font size=2 face=arial><b>Title Commitment:</b></td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Order No.:</td>
	<td><font size=2 face=arial>#orders.orderid#</td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Search Type:</td>
	<td><font size=2 face=arial>#orders.searchtype#</td>
</tr>

<tr>
	<td width=180><font size=2 face=arial>Deed Transfer:</td>
	<td><font size=2 face=arial>#orders.deedtransfer#</td>
</tr>
<tr>
<td width=180><font size=2 face=arial>Proposed Insured:</td>
	<td>#orders.insured#</td>
</tr>
<tr>
	<td width=180><font size=2 face=arial>Loan Amount:</td>
	<td align=left><font size=2 face=arial>$#NumberFormat("#orders.loanamt#", "999999.99")#</td>
</tr>

</table>
</CFIF>
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
</HTML>

</CFMAIL>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" vVALIGN=top ALIGN=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.GIF"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT>
<img src="images/clear.gif" width=69 height=1 alt="" border="0">
<a href="./welcome.cfm"><img src="images/home.gif" width=55 height=18 alt="" border="0"></a></td></tr><tr><td colspan="2" vVALIGN=top ALIGN="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" vVALIGN=top ALIGN="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./title_services.cfm"><IMG src="./images/nav_02.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./closing_services.cfm"><IMG src="./images/nav_04.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><A href="./customer_login.cfm"><IMG border=0 src="./images/nav_06.gif"></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./contact_info.cfm"><IMG src="./images/nav_08.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./mail.cfm?pass=0"><IMG src="./images/nav_10.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><BR><IMG height=1 src="./images/clear.gif" width=20><br></td>
<td>
<!---------------------- BEGIN CONTENT ------------------->
Your Message has been Sent!
<!----------------------- END CONTENT -------------------->
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
