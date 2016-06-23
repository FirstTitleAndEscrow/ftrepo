<cfparam name="startdate" default="">
<cfparam name="enddate" default="">
<cfparam name="sort" default="">
<cfparam name="lastname" default="">
<cfparam name="firstname" default="">

<cfoutput>
<cfset date1=#DateFormat("#startdate#", "d-mmm-yy")#>
<cfset date2=#DateFormat("#enddate#", "d-mmm-yy")#>

</cfoutput>

<cfquery name="getorderinfo" DATASOURCE="First_Title_Services">
SELECT DISTINCT O.orderid, O.closingid, orderdate, O.closingstatus, O.closingdate, O.closingtime, O.delayreason, C.blastname1, C.bfirstname1, C.blastname2, C.bfirstname2, C.pcity, C.pstate, C.pcounty, C.customerid, L.company
FROM Closing O, Customers C, Login L
WHERE O.customerid=C.customerid AND O.loginid=L.loginid and O.orderdate LIKE '%-03%'



<cfif #start_month_pass# is not "">
and O.orderdate LIKE '%#start_month_pass#%'
</cfif>

<cfif #get_id# is not "">
and O.orderid = #get_id#
</cfif>
<cfif #get_num# is not "">
and O.closingid = #get_num#

</cfif>
<cfif #company_pass# is not "">
and L.company = '#company_pass#'
</cfif>

<cfif #Trim(blastname_pass)# is not "">
and (C.blastname1 LIKE '%#Trim(blastname_pass)#%' or C.blastname2 LIKE '%#Trim(blastname_pass)#%')
</cfif>

<cfif #Trim(bfirstname_pass)# is not "">
and (C.bfirstname1 LIKE '%#Trim(bfirstname_pass)#%' or C.bfirstname2 LIKE '%#Trim(bfirstname_pass)#%')
</cfif>

ORDER BY #sortorder#
</cfquery>

<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Show Detail Order</title>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">



<TABLE WIDTH=440 BORDER=0 CELLSPACING=-1 align="center">
<TR>
<TD ALIGN=CENTER>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Search Closing Results</FONT>
<HR>
<FONT SIZE=2 FACE=ARIAL>

</TD>
</TR>
</TABLE>


<table border=1 cellspacing=0 cellpadding=3 align=center>
<tr align=center>
    <td><FONT SIZE=2 FACE=ARIAL><b>Account</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>Closing Order No.</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>Borrower's<BR>Last Name</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>Borrower's<BR>First Name</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>State</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>Closing Request Date</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>Status</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>Date/Time Scheduled</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>Customer Info</b></td>


</tr>

<cfoutput query="getorderinfo">
<tr align=center>
   <td><FONT SIZE=2 FACE=ARIAL>#company#&nbsp;</td>
   <td><FONT SIZE=2 FACE=ARIAL>
	<CFIF #closingstatus# EQ 'open'>
   <a href="./detailclosing.cfm?orderid=#orderid#&closingid=#closingid#&adminid=#adminid#&adminlogin=#adminlogin#&adminpassword=#adminpassword#">#orderid#</a>
	<CFELSE>
	#orderid#
	</CFIF></td>
	<td><FONT SIZE=2 FACE=ARIAL>#blastname1#&nbsp;</td>
	<td><FONT SIZE=2 FACE=ARIAL>#bfirstname1#&nbsp;</td>
	<td><FONT SIZE=2 FACE=ARIAL>#pstate#&nbsp;</td>
	<td><FONT SIZE=2 FACE=ARIAL>#orderdate#&nbsp;</td>
	<td><FONT SIZE=2 FACE=ARIAL>#closingstatus#&nbsp;
	</td>


<td><FONT SIZE=2 FACE=ARIAL>
	<CFIF #closingstatus# EQ 'open'>
		&nbsp;
	<CFELSE>
		#closingdate#&nbsp;#closingtime#
	</CFIF>
</td>
<!--- this gets assigned in detailclosing.cfm --->

	<td align="center"><FONT SIZE=2 FACE=ARIAL><FORM action="./showclosing.cfm">
	<input type="hidden" name="adminid" value="#adminid#">
<input type="hidden" name="adminlogin" value="#adminlogin#">
<input type="hidden" name="adminpassword" value="#adminpassword#">
	<input type="hidden" name="customerid" value="#customerid#">
	<input type="submit" value="Edit">
	</FORM> </td>


</tr></cfoutput>

</table>


<center>
<form action="./adminmain.cfm" method="post">
<cfoutput>
<input type="hidden" name="adminid" value="#adminid#">
<input type="hidden" name="adminlogin" value="#adminlogin#">
<input type="hidden" name="adminpassword" value="#adminpassword#">
</cfoutput>
<input type="submit" value="Main Admin Page">
</form></center>

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
