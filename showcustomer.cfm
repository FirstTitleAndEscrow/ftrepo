<cfquery name="getcustomerinfo" DATASOURCE="First_Title_Services">
select * from customers
where customerid=#form.customerid#
</cfquery>

<html>
<head>
	<title>1st Title & Escrow, Inc - Show Customer Information</title>
</head>

<body>
<center>
The following information is associated with the customer information id of <cfoutput>#form.customerid#
</cfoutput>
</center>

<form action="./updatecustomer.cfm" method="post">

<cfoutput query="getcustomerinfo">
<table border=1 cellspacing=0 cellpadding=3 align=center>
<tr>
	<td colspan=2>Account Information</td>

</tr>

<tr>
	<td>Officer Name:</td>
	<td><input type="text" name="oname" value="#oname#"></td>
</tr>
<tr>
	<td>Officer Phone No./~Ext.:</td>
	<td><input type="text" name="ophone" value="#ophone#">~<input type="text" name="oext" value="#oext#" size=5></td>
</tr>
<tr>
	<td>Officer Fax No.:</td>
	<td><input type="text" name="ofax" value="#ofax#"></td>
</tr>

<tr>
	<td>Processor Name:</td>
	<td><input type="text" name="pname" value="#pname#"></td>
</tr>
<tr>
	<td>Processor Phone No./~Ext.:</td>
	<td><input type="text" name="pphone" value="#pphone#">~<input type="text" name="pext" value="#pext#" size=5></td>
</tr>
<tr>
	<td>Processor Fax No.:</td>
	<td><input type="text" name="pfax" value="#pfax#"></td>
</tr>

<tr>
	<td>Email:</td>
	<td><input type="text" name="verifyemail" value="#verifyemail#"></td>
</tr>
</table>






<table border=1 cellspacing=0 cellpadding=3 align=center>
<tr>
	<td colspan=2>Borrower/Seller Information</td>

</tr>

<tr>
	<td>Borrower Last Name, First Name Mi:</td>
	<td><input type="text" name="blastname1" value="#blastname1#">, <input type="text" name="bfirstname1" value="#bfirstname1#"> <input type="text" name="bminame1" value="#bminame1#" size=2></td>
</tr>

<tr>
	<td>Borrower SSN:</td>
	<td><input type="text" name="bssn1" value="#bssn1#"></td>
</tr>

<tr>
	<td>Borrower Home Phone:</td>
	<td><input type="text" name="bhphone1" value="#bhphone1#"></td>
</tr>
<tr>
	<td>Borrower Work Phone No./~Ext.:</td>
	<td><input type="text" name="bwphone1" value="#bwphone1#">~<input type="text" name="bext1" value="#bext1#" size=5></td>
</tr>


<tr>
	<td>Seller Last Name, First Name Mi:</td>
	<td><input type="text" name="slastname1" value="#slastname1#">, <input type="text" name="sfirstname1" value="#sfirstname1#"> <input type="text" name="sminame1" value="#sminame1#" size=2></td>
</tr>

<tr>
	<td>Seller SSN:</td>
	<td><input type="text" name="sssn1" value="#sssn1#"></td>
</tr>

<tr>
	<td>Seller Home Phone:</td>
	<td><input type="text" name="shphone1" value="#shphone1#"></td>
</tr>
<tr>
	<td>Seller Work Phone No./~Ext.:</td>
	<td><input type="text" name="swphone1" value="#swphone1#">~<input type="text" name="sext1" value="#sext1#" size=5></td>
</tr>
</table>



<table border=1 cellspacing=0 cellpadding=3 align=center>
<tr>
	<td colspan=2>Property Information</td>

</tr>

<tr>
	<td>Address:</td>
	<td><input type="text" name="paddress" value="#paddress#"></td>
</tr>


<tr>
	<td>City, State Zip:</td>
	<td><input type="text" name="pcity" value="#pcity#">, <input type="text" name="pstate" value="#pstate#" size=2> <input type="text" name="pzip" value="#pzip#" size=10></td>
</tr>


<tr>
	<td>County:</td>
	<td><input type="text" name="pcounty" value="#pcounty#"></td>
</tr>

<tr>
	<td>Search Before:</td>
	<td><input type="text" name="psearchbefore" value="#psearchbefore#"></td>
</tr>
<tr>
	<td>Legal Description:</td>
	<td><input type="text" name="plegaldesc" value="#plegaldesc#"></td>
</tr>
</table>

<table border=1 cellspacing=0 cellpadding=3 align=center>
<tr>
	<td>Comment:</td>
	<td><textarea name="comment" value="#comment#"></td>
</tr>
</table>
</cfoutput>

<table border=0 align=center>
<tr><td><input type="submit" value="Update Customer Information"></td>
</form>
<form action="./index.cfm" method="post">
<td><input type="submit" value="Main Admin"></td>
</tr>
</form>
</table>

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
