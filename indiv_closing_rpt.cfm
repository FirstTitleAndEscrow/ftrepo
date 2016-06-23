<CFQUERY DATASOURCE="First_Title_Services" NAME="readin">
SELECT loginID, acct_num, password, company
FROM login
WHERE acct_num = '#acct_num#' AND password = '#password#'
</CFQUERY>





<cfquery name="getorderinfo" DATASOURCE="First_Title_Services">
select O.closingid, O.orderdate, O.closingstatus, O.closingdate, O.closingtime, O.closingtype, O.closingoption, O.closingloantype, O.confirmaddress, O.confirmcity, O.confirmstate, O.confirmzip, C.oname, C.pname,  C.blastname1, C.bfirstname1, C.blastname2, C.bfirstname2,  C.paddress, C.pcity, C.pstate, C.pzip, C.pcounty, O.comment, O.confirmcontact, O.confirmphone, O.confirmfax, O.confirmemail
from Closing O, Customers C
where C.customerid=O.customerid and O.closingid=#closingid# and O.loginid=#loginid#
</cfquery>






<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

<HMTL>
<HEAD>
<TITLE>1st Title & Escrow, Inc. - Order Status Detail</TITLE>
<BODY BGCOLOR=FFFFFF>

<TABLE BORDER=0 WIDTH=100%>
  <TR><TD>
  <cfoutput><FONT FACE=ARIAL SIZE=5><B>Closing Detail: #readin.company#</B></FONT><BR>
          <FONT FACE=ARIAL SIZE=2> #datnow# - #timnow# (EST)<BR>
                                  1st Title & Escrow, Inc.</FONT>
</cfoutput>
      </TD>
</TABLE>

<HR>


<P><FONT FACE=ARIAL SIZE=2>

<FORM METHOD=POST ACTION="./adobe_rpt.cfm">

<cfoutput>
<input type="hidden" name="loginid" value="#loginid#">
<input type="hidden" name="acct_num" value="#url.acct_num#">
<input type="hidden" name="password" value="#url.password#">
</cfoutput>

<input type="submit" value="Print Report">
</FORM>
<P></FONT>



<P><FONT FACE=ARIAL SIZE=1>

<TABLE BORDER="0">
<TR><TD>

<TABLE BORDER=0>

<cfoutput query="getorderinfo">

<!--- <TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2><b>Product:</b></TD>
    <TD CLASS=htmldw5EF1><font size=-2><b>Closing</b></TD>
</TR> --->

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Closing No.:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#Closingid#</TD>
</TR>


<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>1st Borrower/2nd Borrower:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#bfirstname1# #blastname1#/#bfirstname2# #blastname2#</TD>
</TR>
<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Property Address:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#paddress#</TD>
</TR>
<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>City,&nbsp;State&nbsp;Zip:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#pcity#,&nbsp;#pstate#&nbsp; #pzip#</TD>
</TR>
<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2> Property County:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#pcounty#</TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=center colspan="2"><font size=2><P><b><u>Closer Information</u></b></TD>
</TR>


<!--- <TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Date Ordered:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#orderdate#</TD>
</TR> --->

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Contact Name:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#confirmcontact#<!--- #oname#/#pname# ---></TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Telephone Number:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#confirmphone#<!--- #oname#/#pname# ---></TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Fax Number:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#confirmfax#<!--- #oname#/#pname# ---></TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Email Address:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#confirmemail#<!--- #oname#/#pname# ---></TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Street Address:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#confirmaddress#</TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>City, State, Zip:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#confirmcity#, #confirmstate# #confirmzip#</TD>
</TR>
<!--- <TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Current Status:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#closingstatus#</TD>
</TR>
 --->



<!--- <TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Closing Type:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#closingtype#</TD>
</TR>
 --->


<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Closing Option:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#closingoption#</TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Closing Loan Type:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#closingloantype#</TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Closing Date:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#closingdate#</TD>
</TR>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Closing Time:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#closingtime#</TD>
</TR>


<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right><font size=-2>Comments:</TD>
    <TD CLASS=htmldw5EF1><font size=-2>#comment#</TD>
</TR></cfoutput>

<TR CLASS=htmldw5EF0>
    <TD CLASS=htmldw5EF4 ALIGN=right colspan="2">&nbsp;</TD>
</TR>

</TABLE>
</FONT>

</TD>


<TD CLASS=htmldw5EF0 valign="top" align="right">
<font size=-1><b>Closing package should be sent to loan closer at the stated address.  <BR>The closing will occur at this location as well unless otherwise indicated in the notes.<p>If the closing information received is not to your satisfaction, <BR>please contact us by <A HREF="mailto:sdari@firsttitleservices.com">email</a><BR> or phone at 301-279-0303.</b>
</TD></TR>
</TABLE>

<TABLE>


<FORM METHOD="POST" ACTION="./account_menu.cfm">

<cfoutput>
<input type="hidden" name="loginid" value="#loginid#">
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
