
<html>
<head>
<title>Login</title>
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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#294163" link="#FF0000" vlink="#FF0000" alink="#FF0000">
<p><H1><font color="#FFFFFF">LOGO</font></H1></p>
<p></p>
<p><img src="loginbg.jpg" width="780" border="0" usemap="#Map">
  <map name="Map">
    <area shape="rect" coords="177,2,230,17" href="login.cfm">
    <area shape="rect" coords="272,3,329,15" href="company.cfm">
    <area shape="rect" coords="357,3,475,18" href="service.cfm">
    <area shape="rect" coords="505,3,565,16" href="vendor.cfm">
    <area shape="rect" coords="594,3,655,16" href="employment.cfm">
    <area shape="rect" coords="684,4,755,17" href="contact.cfm">
  </map>
</p>
<div id="Layer1" style="position:absolute; width:780px; height:560px; z-index:1; left: 0px; top: 90px;">
  <table width="780"  height="560" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <cfif isdefined ("url.loginflg")>
        <cfif url.loginflg is 1>
          <td width="126"  valign="top" bgcolor="#FFFF99" >
            <div align="left"><font color="#FF0000" size="2" face="Arial"><img src="orgarrow1.jpg" width="9" height="6"><strong>Customer
              Login</strong><br>
              &nbsp;-Existing Member<br>
              &nbsp;-New Member &nbsp;&nbsp;Signup<br>
              <img src="orgarrow.jpg" width="9" height="6"><strong><a href="login.cfm?loginflg=2">Vendor
              Login</a></strong> </font></div></td>
          <cfelse>
          <td width="126" valign="top" bgcolor="#FFFF99" >
            <div align="left"><font color="#FF0000" size="2" face="Arial"><img src="orgarrow.jpg" width="9" height="6"><strong><a href="login.cfm?loginflg=1">Customer
              Login</a></strong><br>
              <img src="orgarrow1.jpg" width="9" height="6"><strong>Vendor Login</strong><br>
              &nbsp;-Existing Member<br>
              <font size="1">&nbsp;&nbsp;&nbsp;-Abstractor/Title
              &nbsp;&nbsp;&nbsp;Information<br>
              &nbsp;&nbsp;&nbsp;-Title Agent<br>
              &nbsp;&nbsp;&nbsp;-Attorney Closing Agent<br>
              &nbsp;&nbsp;&nbsp;-Notary Closing Agent<br>
              &nbsp;&nbsp;&nbsp;-Appraiser<br>
              &nbsp;&nbsp;&nbsp;-Ancillary Service &nbsp;&nbsp;&nbsp;&nbsp;Provider<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Flood Determination
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vendor<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Credit Vendor<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-AVM Vendor</font><br>
              &nbsp;-New Member &nbsp;&nbsp;Signup<br>
              <font size="1">&nbsp;&nbsp;&nbsp;-Abstractor/Title
              &nbsp;&nbsp;&nbsp;Information<br>
              &nbsp;&nbsp;&nbsp;-Title Agent<br>
              &nbsp;&nbsp;&nbsp;-Attorney Closing Agent<br>
              &nbsp;&nbsp;&nbsp;-Notary Closing Agent<br>
              &nbsp;&nbsp;&nbsp;-Appraiser<br>
              &nbsp;&nbsp;&nbsp;-Ancillary Service &nbsp;&nbsp;&nbsp;&nbsp;Provider<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Flood Determination
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vendor<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Credit Vendor<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-AVM Vendor</font><br>
              &nbsp;-Administrative Login </font></div></td>
        </cfif>
        <cfelse>
        <td width="124" valign="top" > <div align="left"><font color="#FF0000" size="2" face="Arial"><img src="orgarrow3.jpg" width="6" height="9"><strong><a href="login.cfm?loginflg=1">Customer
            Login</a></strong><br>
            <img src="orgarrow2.jpg" width="9" height="6"><strong><a href="login.cfm?loginflg=2">Vendor
            Login</a></strong> </font></div></td>
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
      <td width="458" rowspan="2" valign="top" bordercolor="#FFFFFF"> <table  align="center" width="440" >
          <tr>
            <td colspan="2"><div align="center">
                <p>&nbsp;</p>
                <p><font color="#CC6633" size="3" face="Arial"><H3><B>CUSTOMER LOGIN</B></H1></FONT><!--- <img src="loginpic.jpg" width="400" height="108"> ---></p>
              </div></td>
          </tr>
          <tr>
            <td colspan="2"><div align="justify"><font color="#666666">Welcome
                to the gateway to <cfoutput>#session.site.short_name#</cfoutput>&#8217;s automated, web-based, ordering
                and tracking system. To login please type your username and password
                below. Having trouble logging in? Click on one of the links below
                the login for help. </font></div></td>
          </tr>
          <tr>
            <td colspan="2"> <div align="center"><B><font color="#CC6633" face="Arial">Username:</font>
                <input name="textfield" type="text" size="20" maxlength="20">
              </div></td>
          </tr>
          <tr>
            <td height="21" colspan="2"> <div align="center"><B><font color="#CC6633" face="Arial">Password:</font>
                <input name="textfield2" type="text" size="20" maxlength="20">
              </div></td>
          </tr>
          <tr>
            <td width="235" height="24">&nbsp;</td>
            <td width="193"><input type="submit" name="Submit" value="Submit"></td>
          </tr>
          <tr>
            <td colspan="2"><div align="center">
                <p><font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="retpassword.cfm" target="_blank">Forgot
                  your Password? Click</a></font></p>
              </div></td>
          </tr>
          <tr>
            <td colspan="2"><div align="center"><font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="register.cfm">Don&#8217;t
                have a username and password? Click</a></font></div></td>
          </tr>
        </table></td>
      <td width="26" rowspan="2">&nbsp;</td>
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
