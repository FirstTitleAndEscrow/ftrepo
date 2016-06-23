<CFQUERY DATASOURCE="First_Title_Services" NAME="readin">
SELECT loginID, acct_num, password, company
FROM login
WHERE acct_num = '#acct_num#' AND password = '#password#'
</CFQUERY>


<cfif #servicetype# is "Property Report">


<cfquery name="getorderinfo" DATASOURCE="First_Title_Services">
select O.orderid, O.orderdate, O.status, O.rpttype, O.polender1, O.poacctno1, O.pophone1, O.polender2, O.poacctno2, O.pophone2, O.file_upload, C.oname, C.pname,  C.blastname1, C.bfirstname1, C.blastname2, C.bfirstname2,  C.paddress, C.pcity, C.pstate, C.pzip, C.pcounty, C.comment from Orders O, Customers C where C.customerid=O.customerid and O.orderid=#orderid# and O.loginid=#loginid#
</cfquery>


<cfelse>


<cfquery name="getorderinfo" DATASOURCE="First_Title_Services">
select O.orderid, O.orderdate, O.status, O.searchtype,  O.deedtransfer, O.insured, O.loanamt, O.polender1, O.poacctno1, O.pophone1, O.polender2, O.poacctno2, O.pophone2, O.file_upload, C.oname, C.pname,  C.blastname1, C.bfirstname1, C.blastname2, C.bfirstname2,  C.paddress, C.pcity, C.pstate, C.pzip, C.pcounty, C.comment from Orders O, Customers C where C.customerid=O.customerid and O.orderid=#orderid# and O.loginid=#loginid#
</cfquery>

</cfif>


<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

<HMTL>
<HEAD>
<TITLE>1st Title & Escrow, Inc. - Order Status Detail</TITLE>
<BODY BGCOLOR=FFFFFF>

<TABLE BORDER=0 WIDTH=100%>
  <TR><TD>
  <cfoutput><FONT FACE=ARIAL SIZE=5><B>Order Detail: #readin.company#</B></FONT><BR>
          <FONT FACE=ARIAL SIZE=2> #datnow# - #timnow# (EST)<BR>
                                  1st Title & Escrow, Inc.</FONT>
<BR>
</CFOUTPUT></TD></tr>
</TABLE>

<HR>


<P><FONT FACE=ARIAL SIZE=2>
<cfoutput>
<A HREF="#fileSys.FindFilePath('#getorderinfo.file_upload#', 'url')#" target="new">Click to View/Print Report</a><BR>
Adobe Acrobat Reader Required
</cfoutput>
<P></FONT>



<P><FONT FACE=ARIAL SIZE=1>
<TABLE BORDER=0>

<cfoutput query="getorderinfo">

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2><b>Product:</b></TD>
    <TD CLASS=htmldw5EF1><font size=-2><b>#servicetype#</b></TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Order No.:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#orderid#</TD>
</TR>
<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Date Ordered:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#orderdate#</TD>
</TR>

<!--- <TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Contact Name:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#oname#/#pname#</TD>
</TR> --->

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Current Status:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#status#</TD>
</TR>


<cfif #servicetype# is "Property Report">

<!--- <TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Report Type:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#rpttype#</TD>
</TR> --->

<cfelse>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Search Type:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#searchtype#</TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Deed Transfer:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#deedtransfer#</TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Proposed Insured:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#insured#</TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Loan Amount:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#Numberformat("#loanamt#", "$999,999,999.99")#</TD>
</TR>


</cfif>

<!--- <TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>1st Lender/2nd Lender:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#polender1#/#polender2#</TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>1st Acct. No./2nd Acct. NO.:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#poacctno1#/#poacctno2#</TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>1st Phone No./2nd Phone No.:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#pophone1#/#pophone2#</TD>
</TR> --->



<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>1st Borrower/2nd Borrower:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#bfirstname1# #blastname1#/#bfirstname2# #blastname2#</TD>
</TR>
<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Address:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#paddress#</TD>
</TR>
<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>City,&nbsp;State&nbsp;Zip:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#pcity#,&nbsp;#pstate#&nbsp; #pzip#</TD>
</TR>
<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>County:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#pcounty#</TD>
</TR>


<!--- <TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Comments:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#comment#</TD>
</TR> ---></cfoutput>
</TABLE>
</FONT>



<TABLE>


<FORM METHOD="POST" ACTION="./account_menu.cfm">

<cfoutput>
<input type="hidden" name="acct_num" value="#url.acct_num#">
<input type="hidden" name="password" value="#url.password#">
</cfoutput>

          <TD><input type="submit"  value="Back to Menu"></TD>
		  </TR>
 </FORM>
 </TABLE>



<HR>
<FONT FACE=ARIAL SIZE=2>1st Title & Escrow, Inc.</FONT>
<HR>



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
