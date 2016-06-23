
<cfquery name="getinfo" DATASOURCE="First_Title_Services">
SELECT C.blastname1, C.bfirstname1, C.blastname2, C.bfirstname2, O.orderdate,  O.closingid,  O.closingstatus, O.duedate, O.delayreason
FROM Customers C, Closing O
WHERE C.customerid=O.customerid AND O.closingstatus not in ('completed')
AND O.loginid=#loginid#

 ORDER by  C.blastname1
</cfquery>




<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

<HMTL>
<HEAD>
<TITLE>1st Title & Escrow, Inc. - Open Closing Status</TITLE>
<BODY BGCOLOR=FFFFFF>

<TABLE BORDER=0 WIDTH=100%>
  <TR><TD><FONT FACE=ARIAL SIZE=5><B>Open Status - Closing Order</B></FONT><BR>
          <FONT FACE=ARIAL SIZE=2><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)<BR>
                                  1st Title & Escrow, Inc.  </FONT>
</TABLE>
<HR>

<P><FONT FACE=ARIAL SIZE=1>



<TABLE BORDER=1 cellspacing=0 cellpadding=3 align=center>

<TR>
    <TD colspan=6><font size=2><b>Closing</b></TD>
   </TR>

<TR>
   <TD><font size=2><b>Closing No.</b></TD>
   <TD><font size=2><b>Order Date</b></TD>
    <TD><font size=2><b>Borrower Name</b></TD>
	<TD><font size=2><b>Status</b></TD>
    <TD><font size=2><b>Due Date</b></TD>
	   <TD><font size=2><b>Notes</b></TD>

</TR>
<cfoutput query="getinfo">
<TR>
    <TD><font size=-2>#closingid#</TD>
    <TD><font size=-2>#DateFormat("#Left("#orderdate#","9")#", "mm/dd/yyyy")# #Mid("#orderdate#","11", "18")#</TD>
    <TD><font size=-2>#bfirstname1# #blastname1#/#bfirstname2# #blastname2#</TD>


  <TD><font size=-2>#closingstatus#</TD>

   <TD><font size=-2>#DateFormat("#duedate#", "mm/dd/yyyy")#</TD>
	<TD><font size=-2>#delayreason#</TD>

</TR></cfoutput>
</TABLE>
</FONT>
<P>


<TABLE border=0 align=center>
 <FORM METHOD="POST" ACTION="./account_menu.cfm">

 <cfoutput>
 <input type="hidden" name="loginid" value="#loginid#">
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#">
</cfoutput>

 <TR ALIGN=CENTER><TD><input type="submit" value="Back to Menu"></TD></TR>
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
