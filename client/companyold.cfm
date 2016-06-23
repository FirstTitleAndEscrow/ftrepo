
<html>
<head>
<title>About <cfoutput>#session.site.short_name#</cfoutput></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
body
{
    BACKGROUND-COLOR: #284466;
    FONT-FAMILY: Verdana;
    FONT-SIZE: 10px;
    MARGIN: 0px
}
P
{
    COLOR: #66CCFF;
    FONT-FAMILY: Verdana;
    FONT-SIZE: 10px;
    MARGIN-BOTTOM: 7px;
    MARGIN-TOP: 7px
	line-height: 12px;
}
A:link
{
    Color: #66CC00;
    FONT-FAMILY: Verdana;
    FONT-SIZE: 10px;
    FONT-WEIGHT: bold
}
A:visited
{
    Color: #66CC00;
    FONT-FAMILY: Verdana;
    FONT-SIZE: 10px;
    FONT-WEIGHT: bold
}
.HP_STOCK
{
    COLOR: #ffffff;
    FONT-FAMILY: Verdana;
    FONT-SIZE: 12px;
    MARGIN: 0px;
    PADDING-BOTTOM: 0px;
    PADDING-LEFT: 0px;
    PADDING-RIGHT: 0px;
    PADDING-TOP: 0px
}
LI
{
    MARGIN: 5px 0px 0px
}
   </style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#294163" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<p><H1><font color="#FFFFFF">LOGO</font></H1></p>
<p></p>
<p><img src="companybg.jpg" width="780" border="0" usemap="#Map">
  <map name="Map">
    <area shape="rect" coords="177,2,230,17" href="login.cfm">
    <area shape="rect" coords="254,4,311,16" href="company.cfm">
    <area shape="rect" coords="357,3,475,18" href="service.cfm">
    <area shape="rect" coords="505,3,565,16" href="vendor.cfm">
    <area shape="rect" coords="594,3,655,16" href="employment.cfm">
    <area shape="rect" coords="684,4,755,17" href="contact.cfm">
  </map>
</p>
<div id="Layer1" style="position:absolute; width:780px; height:560px; z-index:1; left: 0px; top: 92px;">
  <table width="780"  height="560" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <cfif isdefined ("url.loginflg")>
        <cfif url.loginflg is 1>
          <td width="154"  valign="top" bgcolor="#003366" >
            <div align="left"> &nbsp;&nbsp;<font color="#FFFFFF" size="2"><strong><font color="#FFFFFF" size="2" face="Arial">Mission
              Statement</font></strong><font size="2" face="Arial"><br>
              <img src="bluearrow2.jpg" width="9" height="9"><font color="#FFFFFF"><strong>Product
              Overview</strong> <br>
              <font size="1">&nbsp;&nbsp;&nbsp;-&nbsp;Title Insurance Programs<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Title Search Products</font></font></font><font color="#FF0000" size="1" face="Arial"><font color="#FFFFFF"><br>
              &nbsp;&nbsp;&nbsp;-&nbsp;</font></font><font color="#FFFFFF" size="1" face="Arial">Closing
              Management &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Services<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Appraisal Management<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Credit Reporting Products<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Flood Determination &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Products<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Affiliated Business &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Arrangement
              Opportunities<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Technology</font><font color="#FFFFFF" size="2" face="Arial"><br>
              &nbsp;&nbsp;<strong>Testimonials</strong><br>
              &nbsp;&nbsp;<strong>Letter of President</strong> </font> </div></td>
		  </cfif>
	<cfelse>
		<td width="154" valign="top" bgcolor="#003366" >
            <div align="left"><font color="#FF0000" size="2" face="Arial"><strong><font color="#FFFFFF" size="2" face="Arial">&nbsp;&nbsp;Mission
              Statement</font></strong><font size="2" face="Arial"></font><br>
              <img src="bluearrow1.jpg" width="9" height="9"><strong><a href="company.cfm?loginflg=1">Product
              Overview</a></strong><br>
            <strong></strong><font color="#FFFFFF" size="2" face="Arial">&nbsp;&nbsp;<strong>Testimonials</strong><br>
            &nbsp;&nbsp;<strong>Letter of President</strong></font></font></div></td>
    </cfif>
      <!--- 030303 steven wang
    <td width="153" valign="top" bgcolor="#FFFF99" > <p><font color="#FF0000" size="2" face="Arial">
        </font><font color="#FF0000" size="2" face="Arial"><img src="orgarrow1.jpg" width="9" height="6"><strong>Customer
        Login</strong><br>
        &nbsp;&nbsp;&nbsp;-&nbsp;Existing Member<br>
        &nbsp;&nbsp;&nbsp;-&nbsp;New Member Sign Up<br>
        <img src="orgarrow1.jpg" width="9" height="6"><strong>Vendor Login</strong><br>
        &nbsp;&nbsp;&nbsp;-&nbsp;Existing Member<br>
        <font size="1"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Abstractor/Title
        Information<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Title Agent<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Attorney Closing Agent<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Notary Closing Agent<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Appraiser<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Ancillary Service Provider<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Flood Determination Vendor<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Credit Vendor<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;AVM Vendor</font><br>
        &nbsp;&nbsp;&nbsp;-&nbsp;New Member Sign Up<br>
        <font size="1"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Abstractor/Title
        Information<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Title Agent<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Attorney Closing Agent<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Notary Closing Agent<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Appraiser<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Ancillary Service Provider<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Flood Determination Vendor<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Credit Vendor<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;AVM Vendor&nbsp;&nbsp;&nbsp;</font><br>
        &nbsp;&nbsp;&nbsp;-&nbsp;Administrative Login</font></p></td>
--->
      <td width="450" rowspan="2" valign="top" bordercolor="#FFFFFF"> <p align="justify"><font color="#000066" size="2">&quot;
	  		<!--- MIS
          consistently provides timely title searches, appraisal reports, and
          closing related services to lending institutions, while maintaining
          the highest standards of quality through the effective use of technology
          delivered by a well trained, professional staff.&quot; </font><font size="2">
          </font><br><br>
        <font color="#666666" size="2">MIS provides quality information and
          services to the national mortgage lending industry. Since our inception
          in 1990 we have expanded into 21 states through direct operations and
          service most other states using an extensive network of contractors
          and affiliates. <br>
          MIS has become one of the premier providers in our field because of
          our commitment to providing superior customer service while continuing
          to meet the changing needs of our customers. We utilize dedicated staff
          appraisers, closers and abstractors wherever possible to ensure a high
          level of control over our customer service and quality. <br>
          MIS currently offers title searches, title insurance, residential appraisals,
          loan closings and all related services. Our services and reports can
          be customized to meet the specialized needs of every lender and can
          be ordered and delivered electronically via the web or direct computer
          communications. <br>
          MIS also has a National Processing Center (NPC) to service the needs
          of our many multi-state customers who prefer one point of contact. Through
          the NPC we offer appraisal services in all 50 states as well as title
          insurance and search services in many states other than those serviced
          by direct MIS operations. While MIS specializes in services to the home
          equity lending industry, we welcome the opportunity to meet the needs
          of all mortgage lenders. --->

		  <cfoutput>#session.site.long_name#</cfoutput> is a full service company dedicated to providing exceptional title insurance, real estate closing and related services to lenders, brokers and purchasers around the country.  <cfoutput>#session.site.short_name#</cfoutput> is licensed to write title insurance in thirty-four states for your residential or commercial real estate transactions.  <cfoutput>#session.site.short_name#</cfoutput> performs non-title insurance transactions, appraisals and settlement services in all fifty states.<br><br>





<cfoutput>#session.site.short_name#</cfoutput> provides a centralized single point of contact designed to streamline the processing and tracking of real estate transactions nationwide.  We at <cfoutput>#session.site.short_name#</cfoutput> are dedicated to our goal of ensuring that your real estate transaction proceeds flawlessly from opening to closing. We accomplish this by harmonizing our technology-intensive,

comprehensive business processing solutions with traditional, time tested methods in order to meet diverse and ever changing client and company requirements. <br><br>



<cfoutput>#session.site.short_name#</cfoutput> believes that service is the single most important element of the vendor management and closing.  We are dedicated to providing your company with the highest quality of title and other services; and conducting our business for your company in a pro-active manner that exhibits the greatest standards of integrity, professionalism, proficiency, courtesy and dedication.

		  </font><br>
          <br>
        </td>
      <td width="145" rowspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td  height="500" valign="top" >&nbsp;</td>
    </tr>
  </table>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
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
