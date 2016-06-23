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

<!--- oname, pname --->
<cfquery name="getorderinfo" DATASOURCE="First_Title_Services">
select O.orderid, O.servicetype, O.orderdate, O.servicetype, O.status, O.s_day, O.s_mon, O.s_year, O.s_time, C.blastname1, C.bfirstname1, C.oname, C.pname, C.blastname2, C.bfirstname2, C.pcity, C.pstate, C.pcounty, O.duedate, O.delivery_date, O.delayreason, C.customerid
from Orders O, Customers C
where O.customerid=C.customerid  and O.loginid=#loginid# AND O.do_appraisal = 'Yes'



<cfif #start_month_pass# is not "">
and O.orderdate LIKE '%#start_month_pass#%'
</cfif>

<cfif #get_id# is not "">
and O.orderid = #get_id#
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




<cfquery name="get_open_info" DATASOURCE="First_Title_Services">
SELECT C.blastname1, C.bfirstname1, C.blastname2,  O.servicetype,  C.bfirstname2, O.orderdate, O.s_day, O.s_mon, O.s_year, O.s_time,O.delivery_date, O.servicetype, O.orderid,  O.status, C.pcity, C.pstate, C.pcounty, O.duedate, O.delayreason, C.oname, C.pname
FROM customers C, orders O
WHERE C.customerid=O.customerid AND servicetype = 'Appraisal'
AND O.loginid=#loginid#

<cfif #start_month_pass# is not "">
and O.orderdate LIKE '%#start_month_pass#%'
</cfif>

<cfif #get_id# is not "">
and O.orderid = #get_id#
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
  <TR><TD>
  <cfoutput><FONT FACE=ARIAL SIZE=5><B>Appraisal Status: #readin.company#</B></FONT><BR>
          <FONT FACE=verdana SIZE=2> #datnow# - #timnow# (EST)<BR>
                                  1st Title & Escrow, Inc.
<p align="center">All orders placed after 3:00 pm (Eastern Standard Time) are processed the <br>Next Business Day and reflected on the "Order Date" Below.  (Business Days are Mon - Fri)<br>
If the order number is highlighted in blue, your report is completed. <BR>Click the appropriate order number to download to your printer.
</CFOUTPUT></TD></tr>

</table>
<HR>

<P><FONT FACE=ARIAL SIZE=1>
<cfif (#getorderinfo.RecordCount# is 0) AND (#get_open_info.RecordCount# is 0)>

		No Data Found<br>

<cfelse>
		<TABLE  border=1 cellspacing=0 cellpadding=3 align=center>
		<TR align = center>
			<TH ALIGN=left><font size=2>Order No.</TH>
			<TH ALIGN=left><font size=2>1st Borrower's<BR> Last Name</TH>
			<TH ALIGN=left><font size=2>1st Borrower's<BR> First Name</TH>
			<TH ALIGN=left><font size=2>Loan Officer's<BR>Name</TH>
			<TH ALIGN=left><font size=2>Loan Processor's<BR>Name</TH>
			<TH ALIGN=left><font size=2>Order Date</TH>
			<TH ALIGN=left><font size=2>Status</TH>
			<TH Align=left><font size=2>Appt Date / Time</TH>
			<TH ALIGN=left><font size=2>Delivery Date</TH>
			<TH ALIGN=left><font size=2>Comments</TH>
			</TR>

		<!--- here is where we are calculating the number of days --->




		<TR align=center>

		<cfoutput query="getorderinfo">
		<TD align=center><font face=verdana size=1 color=black>

			<CFIF (#status# EQ "Report Trans") >

				<A HREF="./appraisal_report_detail.cfm?orderid=#getorderinfo.orderid#&servicetype=#getorderinfo.servicetype#&loginid=#loginid#&acct_num=#acct_num#&password=#password#">#orderid#</A>
			<CFELSE>

				#orderid#

			</CFIF>

				</TD>
			<TD align=center><font face=verdana size=1 color=black>#blastname1#&nbsp;</TD>
			<TD align=center><font face=verdana size=1 color=black>#bfirstname1#&nbsp;</TD>
			<TD align=center><font face=verdana size=1 color=black>#oname#&nbsp;</TD>
			<TD align=center><font face=verdana size=1 color=black>#pname#&nbsp;</TD>
			<TD align=center><font face=verdana size=1 color=black>#orderdate#&nbsp;</TD>
		  <TD align=center><font face=verdana size=1 color=black>#status#&nbsp;</TD>
		  <TD align=center><font face=verdana size=1 color=black><CFIF #s_day# NEQ "">#s_day#/#s_mon#/#s_year# &nbsp;&nbsp;#s_time#</CFIF></TD>
		  <TD align=center><font face=verdana size=1 color=blue>#DateFormat(delivery_date, "d-mmm-yy")#<br>#TimeFormat(delivery_date, "hh:mm tt")#</TD>
		  <TD align=center><font face=verdana size=1 color=black>

			<!--- <CFIF #getorderinfo.app_comments# NEQ "">
				<A HREF="./appraisal_comment.cfm?orderid=#getorderinfo.orderid#&servicetype=#getorderinfo.servicetype#&loginid=#loginid#&acct_num=#acct_num#&password=#password#" onClick="window.open('appraisal_comment.cfm','Del_it','width=620,height=450,status=0,resizable=1,scrollbars=1,left=200,top=200')"><img src="./images/button_view_comment.gif" border="0"></A></CFIF>
			--->
			</TD>


		</TR>
		</cfoutput>


		<CFOUTPUT query="get_open_info">


		<TR>
			<TD align=center><font face=verdana size=1 color=black>#orderid#&nbsp;</TD>
			<TD align=center><font face=verdana size=1 color=black>#blastname1#&nbsp;</TD>
			<TD align=center><font face=verdana size=1 color=black>#bfirstname1#&nbsp;</TD>
			<TD align=center><font face=verdana size=1 color=black>#oname#&nbsp;</TD>
			<TD align=center><font face=verdana size=1 color=black>#pname#&nbsp;</TD>
				<TD align=center><font face=verdana size=1 color=black>#orderdate#&nbsp;</TD>
		  <TD align=center><font face=verdana size=1 color=black>#status#&nbsp;</TD>
		  <TD align=center><font face=verdana size=1 color=black><CFIF #s_day# NEQ "">#s_day#/#s_mon#/#s_year# &nbsp;&nbsp;#s_time#</CFIF></TD>
		  <TD align=center><font face=verdana size=1 color=blue>#DateFormat(delivery_date, "d-mmm-yy")#<br>#TimeFormat(delivery_date, "hh:mm tt")#</TD>
		  <TD align=center><font face=verdana size=1 color=black>

			<!--- <CFIF #getorderinfo.app_comments# NEQ "">
				<A HREF="./appraisal_comment.cfm?orderid=#getorderinfo.orderid#&servicetype=#getorderinfo.servicetype#&loginid=#loginid#&acct_num=#acct_num#&password=#password#" onClick="window.open('appraisal_comment.cfm','Del_it','width=620,height=450,status=0,resizable=1,scrollbars=1,left=200,top=200')"><img src="./images/button_view_comment.gif" border="0"></A>
				</CFIF>
				--->
			</TD>
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
		</TABLE><p align="center">To either cancel any of the above orders, or edit any<BR> of the order information originally provided to us, please advise us by <A HREF="mailto:pgibb@firsttitleservices.com">email</a>, <BR>and indicate (by order number) the information that you wish to transmit.</p>
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



