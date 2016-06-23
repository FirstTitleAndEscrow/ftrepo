
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

<HTML>
<HEAD>
<TITLE>1st Title & Escrow, Inc. - Generate Report</TITLE>
<BODY BGCOLOR=FFFFFF>

<TABLE BORDER=0 WIDTH=100%>
  <TR><TD><FONT FACE=ARIAL SIZE=5><B>Generate Closing Report</B></FONT><BR>
          <FONT FACE=ARIAL SIZE=2>Title Commitment <cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)<BR>
                                  1st Title & Escrow, Inc.<BR>
                                  <!---<B>Please wait... This report may take up to 3 minutes...</B>---></FONT>
      </TD>
      <TD ALIGN=RIGHT VALIGN=TOP>

	</table>
<HR>

<P>
<A HREF="https://develop.a1is.com/paper_master/ReadMe.pdf">Download 40_00308336.pdf</A> &nbsp;&nbsp; (Filesize: ? k)<BR>
<P>
If you do not have Adobe Acrobat, please click <A HREF="https://www.adobe.com/prodindex/acrobat/readstep.html">HERE</A>.
<P>

<TABLE>
		<FORM METHOD="POST" ACTION="./account_menu.cfm">

<cfoutput>
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#">
</cfoutput>

          <TR ALIGN=CENTER><TD><input type="submit"  value="Back to Menu"></TD></TR>
        </FORM></TABLE>
      </TD>
  </TR>
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
