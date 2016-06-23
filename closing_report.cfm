<CFQUERY DATASOURCE="First_Title_Services" NAME="readin">
SELECT loginID, acct_num, password, company
FROM login
WHERE acct_num = '#acct_num#' AND password = '#password#'
</CFQUERY>




<cfparam name="startdate" default="">
<cfparam name="enddate" default="">
<cfparam name="company_pass" default="">
<cfparam name="get_id" default="">
<cfparam name="blastname_pass" default="">
<cfparam name="bfirstname_pass" default="">
<cfparam name="oname" default="">
<cfparam name="pname" default="">

<cfoutput>
<cfset date1=#DateFormat("#startdate#", "d-mmm-yy")#>
<cfset date2=#DateFormat("#enddate#", "d-mmm-yy")#>
</cfoutput>
<!--- not in ('completed') --->

<cfquery name="get_closing_info" DATASOURCE="First_Title_Services">
SELECT C.blastname1, C.bfirstname1, C.blastname2, C.bfirstname2, O.orderdate,  O.closingid,  C.oname, C.pname, C.pcity, C.pstate, C.pcounty, O.closingstatus, O.duedate, O.delayreason, O.closingdate, O.closingtime, O.comment
FROM Customers C, Closing O
WHERE C.customerid=O.customerid AND (O.closingstatus is null or O.closingstatus != '%completed%')
AND O.loginid=#loginid# and O.orderdate LIKE '%-03%'

<cfif #start_month_pass# is not "">
and O.orderdate LIKE '%#start_month_pass#%'
</cfif>

<cfif #get_id# is not "">
and O.closingid = #get_id#
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

<cfif #Trim(oname)# is not "">
and (C.oname LIKE '%#Trim(oname)#%')
</cfif>

<cfif #Trim(pname)# is not "">
and (C.pname LIKE '%#Trim(pname)#%')
</cfif>

ORDER BY #sortorder#
</cfquery>


<cfquery name="getorderinfo" DATASOURCE="First_Title_Services">
select O.closingid,  O.orderdate, O.closingstatus, C.blastname1, C.bfirstname1, C.blastname2, C.bfirstname2, C.pcity, C.pstate, C.pcounty, C.customerid, C.oname, C.pname, O.delayreason, O.closingdate, O.closingtime, O.comment
from Closing O, Customers C
where O.customerid=C.customerid and O.closingstatus = 'completed' and O.loginid=#loginid# and O.orderdate LIKE '%-03%'


<cfif #start_month_pass# is not "">
and O.orderdate LIKE '%#start_month_pass#%'
</cfif>

<cfif #get_id# is not "">
and O.closingid = #get_id#
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

<cfif #Trim(oname)# is not "">
and (C.oname LIKE '%#Trim(oname)#%')
</cfif>

<cfif #Trim(pname)# is not "">
and (C.pname LIKE '%#Trim(pname)#%')
</cfif>

ORDER BY #sortorder#
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
  <TR><TD><FONT FACE=ARIAL SIZE=5><B><cfoutput>Closing Status: #readin.company#</B></FONT><BR>
          <FONT FACE=ARIAL SIZE=2> #datnow# - #timnow#</CFOUTPUT> (EST)<BR>
                                  1st Title & Escrow, Inc.</FONT>
<p align="center">
<b>If the order number is highlighted in blue, your report is completed. <BR>Click the appropriate order number to obtain your closing information.</b>
      </TD></tr>

</table>
<HR>

<P><FONT FACE=ARIAL SIZE=1>
<cfif (#getorderinfo.RecordCount# is 0) AND (#get_closing_info.RecordCount# is 0)>

No Data Found<br>

<cfelse>
<TABLE  border=1 cellspacing=0 cellpadding=3 align=center>
<TR align = center>
    <TH ALIGN=center><font size=2>Closing No.</TH>

    <TH ALIGN=center><font size=2>Borrower's <BR>Last Name</TH>
	<TH ALIGN=center><font size=2>Borrower's <BR>First Name</TH>
	<TH ALIGN=center><font size=2>Loan Officer's<BR>Name</TH>
	<TH ALIGN=center><font size=2>Loan Processor's<BR>Name</TH>
<!---     <TH ALIGN=left><font size=2>City</TH> --->
    <TH ALIGN=center><font size=2>State</TH>
    <TH ALIGN=center><font size=2>Closing Request Date</TH>
    <TH ALIGN=center><font size=2>Status</TH>
	<TH ALIGN=center><font size=2>Date/Time Scheduled</TH>
	<TH ALIGN=center><font size=2>Comments</TH>
    </TR>


<TR align=center>

<cfoutput query="getorderinfo">
<TD align=center><font size=-2>
<A HREF="indiv_closing_rpt.cfm?closingid=#getorderinfo.closingid#&loginid=#loginid#&acct_num=#acct_num#&password=#password#">#closingid#</A></TD>

    <TD align=center><font size=-2>#blastname1#&nbsp;</TD>
	<TD align=center><font size=-2>#bfirstname1#&nbsp;</TD>
	<TD align=center><font size=-2>#oname#&nbsp;</TD>
	<TD align=center><font size=-2>#pname#&nbsp;</TD>
<!---    	<TD align=center><font size=-2>#pcity#&nbsp;</TD> --->
    <TD align=center><font size=-2>#pstate#&nbsp;</TD>
    <TD align=center><font size=-2>#DateFormat("#orderdate#", "mm/dd/yyyy")#&nbsp;</TD>


  	<TD align=center><font size=-2>#closingstatus#&nbsp;</TD>
	<TD align=center><font size=-2>#closingdate#<BR>#closingtime#&nbsp;</TD>
	<TD align=center><font size=-2>#comment#&nbsp;</TD>

</TR></cfoutput>

<cfoutput query="get_closing_info">
<TR align=center>


	<TD align=center><font size=-2>#closingid#&nbsp;</TD>
    <TD align=center><font size=-2>#blastname1#&nbsp;</TD>
	<TD align=center><font size=-2>#bfirstname1#&nbsp;</TD>
	<TD align=center><font size=-2>#oname#&nbsp;</TD>
	<TD align=center><font size=-2>#pname#&nbsp;</TD>
<!---    	<TD align=center><font size=-2>#pcity#&nbsp;</TD> --->
    <TD align=center><font size=-2>#pstate#&nbsp;</TD>
    <TD align=center><font size=-2>#DateFormat("#orderdate#", "mm/dd/yyyy")#&nbsp;</TD>


  	<TD align=center><font size=-2>#closingstatus#&nbsp;</TD>
	<TD align=center><font size=-2>#closingdate#<BR>#closingtime#&nbsp;</TD>
	<TD align=center><font size=-2>#comment#&nbsp;</TD>

</TR>
</CFOUTPUT>

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
</TABLE><p align="center">To edit any of the closing request information,<BR> or cancel a closing request, please advise us by <A HREF="mailto:sdari@firsttitleservices.com">email</a>, <BR>and indicate (by order number) the information that you wish to transmit.</p>
</TD>
  </TR>

</TABLE><p></p>


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



