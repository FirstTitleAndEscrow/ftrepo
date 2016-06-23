<CFQUERY DATASOURCE="First_Title_Services" NAME="readin">
SELECT loginID, acct_num, password, company
FROM login
WHERE acct_num = '#acct_num#' AND password = '#password#'
</CFQUERY>




<cfparam name="customerid" default="">
<cfparam name="blastname1" default="">
<cfparam name="bfirstname1" default="">
<cfparam name="pstate" default="">


<cfquery name="getorderinfo" DATASOURCE="First_Title_Services">
select O.orderid, O.servicetype, O.orderdate, O.status, C.blastname1, C.bfirstname1, C.blastname2, C.bfirstname2, C.pcity, C.pstate, C.pcounty, C.customerid, C.oname, C.pname

from Orders O, Customers C

where O.customerid=C.customerid and status not in ('closing', 'cancelled')
AND O.loginid=#loginid#



<cfif Trim(blastname1) is not "">
and C.blastname1 like '%#Trim(blastname1)#%'

</cfif>

<cfif Trim(bfirstname1) is not "">
and C.bfirstname1 like '%#Trim(bfirstname1)#%'
</cfif>


<cfif Trim(pstate) is not "">
and C.pstate = '#pstate#'
</cfif>

<cfif #Trim(oname)# is not "">
and (C.oname LIKE '%#Trim(oname)#%')
</cfif>

<cfif #Trim(pname)# is not "">
and (C.pname LIKE '%#Trim(pname)#%')
</cfif>

ORDER BY O.customerid, C.blastname1
</cfquery>

<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>1st Title & Escrow, Inc. - Closing - Show Previous Customer Information</title>
</head>




<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><td colspan="2" valign=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.gif"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT><img src="images/clear.gif" width=69 height=1 alt="" border="0">
<a href="./welcome.cfm"><img src="images/home.gif" width=55 height=18 alt="" border="0"></a></td></tr><tr><td colspan="2" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./title_services.cfm"><IMG src="./images/nav_02.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./closing_services.cfm"><IMG src="./images/nav_04.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><A href="./customer_login.cfm"><IMG border=0 src="./images/nav_06.gif"></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./contact_info.cfm"><IMG src="./images/nav_08.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./mail.cfm?pass=0"><IMG src="./images/nav_10.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><br><IMG height=1 src="./images/clear.gif" width=20><br></TD><TD>




<TABLE WIDTH=440 BORDER=0 CELLSPACING=0 align="center">
<TR>
<TD ALIGN=middle>
<FONT FACE=ARIAL COLOR="red" SIZE=4><b><CFOUTPUT query="readin">#company#</CFOUTPUT>:<BR>
Closing - Customer Information</b></FONT><br>
<HR>
<cfif #getorderinfo.RecordCount# is 0>
<br><FONT FACE=ARIAL SIZE=3>
No Data Found. Please try again.</cfif>
</td></tr></table><p>




<cfif #getorderinfo.RecordCount# is 0>

</TD>
  </TR>
</TABLE>

<cfelse>

<!---<form action="./closing.cfm" method="post">--->


<!---<cfoutput>
<input type="hidden" name="loginid" value="#loginid#">
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#">
</CFOUTPUT>
   <input type="submit" value="Process to Closing">--->




<center>
<font size=2 face=arial><b>Please click on the Order Number to process closing.</b><p></P></center>
<TABLE  border=1 cellspacing=0 cellpadding=3 align=center>
<TR align = center>
    <TH ALIGN=left><font size=2>Order No.</TH>
    <TH ALIGN=left><font size=2>Product</TH>
    <TH ALIGN=left><font size=2>1st Borrower's<br>Last Name</TH>
	<TH ALIGN=left><font size=2>1st Borrower's<br>First Name</TH>
    <TH ALIGN=left><font size=2>Loan Officer's<br>Name</TH>
	<TH ALIGN=left><font size=2>Loan Processor's<br>Name</TH>
	<TH ALIGN=left><font size=2>City</TH>
    <TH ALIGN=left><font size=2>State</TH>
    <TH ALIGN=left><font size=2>County</TH>
<!---     <TH ALIGN=left><font size=2>Order Date</TH>
    <TH ALIGN=left><font size=2>Current Status</TH> --->
    </TR>


<TR align=center>

<cfoutput query="getorderinfo">
<TD align=center><font size=-2>
<A HREF="closing.cfm?orderid=#getorderinfo.orderid#&customerid=#customerid#&loginid=#loginid#&acct_num=#acct_num#&password=#password#">#orderid#</A></TD>
    <TD align=center><font size=-2>#servicetype#&nbsp;</TD>
    <TD align=center><font size=-2>#blastname1#&nbsp;</TD>
	<TD align=center><font size=-2>#bfirstname1#&nbsp;</TD>
    <TD align=center><font size=-2>#oname#&nbsp;</TD>
	<TD align=center><font size=-2>#pname#&nbsp;</TD>
   <TD align=center><font size=-2>#pcity#&nbsp;</TD>
    <TD align=center><font size=-2>#pstate#&nbsp;</TD>
    <TD align=center><font size=-2>#pcounty#&nbsp;</TD>
<!---     <TD align=center><font size=-2>#DateFormat("#Left("#orderdate#","9")#", "mm/dd/yyyy")# #Mid("#orderdate#","11", "18")#&nbsp;</TD>
    <TD align=center><font size=-2>#status#&nbsp;</TD> --->
</TR></cfoutput>

</TABLE><p></P>
</FONT>



<TABLE border=0 align=center>

<FORM METHOD="POST" ACTION="./account_menu.cfm">

<cfoutput>
<input type="hidden" name="loginid" value="#loginid#">
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#">
</cfoutput>

<TR ALIGN=CENTER><TD><input type="submit" value="Back to Menu"></TD></TR>
</FORM>
</TABLE><p></p>


</TD>
  </TR>
</TABLE>



</cfif>
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



