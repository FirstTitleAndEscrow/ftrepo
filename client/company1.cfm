
<html>
<head>
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
<body bgcolor="#294163" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<p><font color="#FFFFFF">LOGO</font></p>
<p><img src="companybg.jpg" width="780" height="560" border="0" usemap="#Map"> 
  <map name="Map">
    <area shape="rect" coords="177,2,230,17" href="login.cfm">
    <area shape="rect" coords="254,4,311,16" href="company.cfm">
    <area shape="rect" coords="357,3,475,18" href="service.cfm">
    <area shape="rect" coords="505,3,565,16" href="vendor.cfm">
    <area shape="rect" coords="594,3,655,16" href="employment.cfm">
    <area shape="rect" coords="684,4,755,17" href="contact.cfm">
  </map>
</p>
<div id="Layer1" style="position:absolute; width:780px; height:560px; z-index:1; left: 10px; top: 95px;">
  <table width="780"  height="560" >
    <tr> 
      <cfif isdefined ("url.loginflg")>
        <cfif url.loginflg is 1>
          <td width="153"  valign="top" bgcolor="#003366" > 
            <div align="left"> &nbsp;&nbsp;<font color="#FFFFFF" size="2"><strong><font color="#FFFFFF" size="2" face="Arial">Mission 
              Statement</font></strong><font size="2" face="Arial"><br>
              <img src="orgarrow1.jpg" width="9" height="6"><font color="#FFFFFF"><strong>Product 
              Overview</strong> <br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Title Insurance Programs<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Title Search Products</font></font><font color="#FF0000" size="2" face="Arial"><font color="#FFFFFF"><br>
              &nbsp;&nbsp;&nbsp;-&nbsp;</font></font><font color="#FFFFFF" size="2" face="Arial">Closing 
              Management Services<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Appraisal Management<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Credit Reporting Products<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Flood Determination Products<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Affiliated Business Arrangement Opportunities<br>
              &nbsp;&nbsp;&nbsp;-&nbsp;Technology<br>
              &nbsp;&nbsp;<strong>Testimonials</strong><br>
              &nbsp;&nbsp;<strong>Letter from the President</strong> </font> </div></td>
		  </cfif>      
	<cfelse>
		<td width="153" valign="top" bgcolor="#003366" > 
            <div align="left"><font color="#FF0000" size="2" face="Arial"><strong><font color="#FFFFFF" size="2" face="Arial">Mission 
              Statement</font></strong><font size="2" face="Arial"></font><br>
              <img src="orgarrow.jpg" width="9" height="6"><strong><a href="company.cfm?loginflg=1">Product 
              Overview</a></strong><br>
            <strong></strong><font color="#FFFFFF" size="2" face="Arial">&nbsp;&nbsp;<strong>Testimonials</strong><br>
              &nbsp;&nbsp;<strong>Letter from the President</strong></font></font></div></td>
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
      <td width="466" rowspan="2" valign="top" bordercolor="#FFFFFF"> <p><font color="#333399">&quot;MIS 
          consistently provides timely title searches, appraisal reports, and 
          closing related services to lending institutions, while maintaining 
          the highest standards of quality through the effective use of technology 
          delivered by a well trained, professional staff.&quot; </font><br>
          MIS Home Office 4877 Galaxy Parkway, Suite I 44128 <br>
          Cleveland, OH <br>
          Phone: (800) 326-5335<br>
          (216) 514-1330<br>
          Fax: (216) 514-1338 </p>
        <p>MIS provides quality information and services to the national mortgage 
          lending industry. Since our inception in 1990 we have expanded into 
          21 states through direct operations and service most other states using 
          an extensive network of contractors and affiliates. <br>
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
          of all mortgage lenders</p>
        <p><font color="#990000"><strong><cfoutput>#session.site.short_name#</cfoutput> &#8211; Background Company</strong></font><br>
          General American Corporation is a full service real estate settlement 
          services company providing nationwide assistance to the first mortgage, 
          refinance, and equity lenders industry. <cfoutput>#session.site.short_name#</cfoutput> DIRECT along with 
          our in-house GATORS settlement services tracking system, provides all 
          the services you need to get your loan closed with speed, quality and 
          accuracy. <cfoutput>#session.site.short_name#</cfoutput> DIRECT's business model has been designed to have 
          a direct impact in reducing your time to close, your direct costs, and 
          your customers' costs. <br>
        </p></td>
      <td width="145" rowspan="2">&nbsp;</td>
    </tr>
    <tr> 
      <td  height="500" valign="top" >&nbsp;</td>
    </tr>
  </table>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
