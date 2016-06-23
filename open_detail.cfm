<CFQUERY DATASOURCE="First_Title_Services" NAME="readin">
SELECT loginID, acct_num, password, company
FROM login
WHERE acct_num = '#acct_num#' AND password = '#password#'
</CFQUERY>


<cfparam name="startdate" default="">
<cfparam name="enddate" default="">
<cfparam name="sort" default="">
<cfparam name="blastname" default="">
<cfparam name="bfirstname" default="">

<cfoutput>
<cfset date1=#DateFormat("#startdate#", "d-mmm-yy")#>
<cfset date2=#DateFormat("#enddate#", "d-mmm-yy")#>
</cfoutput>


<!--- ADDED "Closing L"  information MUST DEBUG! , L.orderdate,  L.closingid,  L.closingstatus, L.duedate, L.delayreason
, Closing L--->
<cfquery name="getorderinfo" DATASOURCE="First_Title_Services">
select O.orderid, O.servicetype, O.orderdate, O.status, C.blastname1, C.bfirstname1, C.oname, C.pname, C.blastname2, C.bfirstname2, C.pcity, C.pstate, C.pcounty, O.duedate, O.delayreason, C.customerid

from Orders O, Customers C

where O.customerid=C.customerid and O.loginid=#loginid# and O.orderdate LIKE '%-03%'

order by C.blastname1
</cfquery>




<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>1st Title & Escrow, Inc. - Report Parameters</title>
</head>


<BODY BGCOLOR=FFFFFF>


<TABLE BORDER=0 WIDTH=100%>
  <TR><TD>
  <cfoutput><FONT FACE=ARIAL SIZE=5><B>Detailed Report: #readin.company#</B></FONT><BR>
          <FONT FACE=ARIAL SIZE=2> #datnow# - #timnow# (EST)<BR>
                                  1st Title & Escrow, Inc.</FONT>
<p>
</CFOUTPUT></TD></tr>

</table>
<HR>

<P><FONT FACE=ARIAL SIZE=1>
<cfif #getorderinfo.RecordCount# is 0>

No Data Found<br>

<cfelse>
<TABLE  border=1 cellspacing=0 cellpadding=3 align=center>
<TR align = center>
<!---     <TH ALIGN=left><font size=2>Closing No.</TH> --->
    <TH ALIGN=left><font size=2>Order No.</TH>
    <TH ALIGN=left><font size=2>Product</TH>
    <TH ALIGN=left><font size=2>1st Borrower's<BR> Last Name</TH>
	<TH ALIGN=left><font size=2>1st Borrower's<BR> First Name</TH>
	<TH ALIGN=left><font size=2>Loan Officer's<BR>Name</TH>
	<TH ALIGN=left><font size=2>Loan Processor's<BR>Name</TH>
    <TH ALIGN=left><font size=2>City</TH>
    <TH ALIGN=left><font size=2>State</TH>
    <TH ALIGN=left><font size=2>Order Date</TH>
<!--- 	<TH ALIGN=left><font size=2>Closing Request Date</TH> --->
    <TH ALIGN=left><font size=2>Status</TH>
	<TH ALIGN=left><font size=2>Comments</TH>
    </TR>


<TR align=center>

<cfoutput query="getorderinfo">
<!--- <TD align=center><font size=-2>LINK</TD> ---><!--- link to closing detail report--->
<TD align=center><font size=-2>#orderid#</TD>
    <TD align=center><font size=-2>#servicetype#</TD>
    <TD align=center><font size=-2>#blastname1#</TD>
	<TD align=center><font size=-2>#bfirstname1#</TD>
	<TD align=center><font size=-2>#oname#</TD>
	<TD align=center><font size=-2>#pname#</TD>
   <TD align=center><font size=-2>#pcity#</TD>
    <TD align=center><font size=-2>#pstate#</TD>
    <TD align=center><font size=-2>#DateFormat("#orderdate#", "mm/dd/yyyy")#</TD>
<!--- 	<TD align=center><font size=-2>DATE</TD> ---><!--- CLosing request date--->

  <TD align=center><font size=-2>#status#</TD>
  <TD align=center><font size=-2>#delayreason#</TD>


</TR></cfoutput>


<!--- <CFOUTPUT query="get_open_info">


<TR>
    <TD align=center><font size=-2>#orderid#</TD>
    <TD align=center><font size=-2>#servicetype#</TD>
    <TD align=center><font size=-2>#blastname1#</TD>
	<TD align=center><font size=-2>#bfirstname1#</TD>
	<TD align=center><font size=-2>#oname#</TD>
	<TD align=center><font size=-2>#pname#</TD>
   <TD align=center><font size=-2>#pcity#</TD>
    <TD align=center><font size=-2>#pstate#</TD>
    <TD align=center><font size=-2>#pcounty#</TD>
    <TD align=center><font size=-2>#DateFormat("#orderdate#", "mm/dd/yyyy")#</TD>


  <TD align=center><font size=-2>#status#</TD>
  <TD align=center><font size=-2>#DateFormat("#duedate#", "mm/dd/yyyy")#</TD>
  <TD align=center><font size=-2>#delayreason#</TD>
</TR>

</CFOUTPUT> --->

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
</TABLE><p align="center">To cancel any of the above orders, please  <A HREF="mailto:sdari@firsttitleservices.com">email us</a>, <BR>and indicate (by order number) the work that is no longer needed.</p>


</TD>
  </TR>
</TABLE>


<HR>
<FONT FACE=ARIAL SIZE=2>1st Title & Escrow, Inc.</FONT>
<HR>
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



