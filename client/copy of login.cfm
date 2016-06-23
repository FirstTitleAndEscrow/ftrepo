
<html>
<head>

<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body bgcolor="#294163">
<p><font color="#FFFFFF">LOGO</font></p>
<p>&nbsp;</p>
<table width="780"  height="560" background="loginbg.jpg" >
  <Tr>
    <Td height="42" colspan="3">&nbsp;</Td>
  </Tr>

  <tr>
  <cfif isdefined ("url.loginflg")>
  	<cfif url.loginflg is 1>
		<td width="153"  valign="top" bgcolor="#FFFF99" >
          <div align="left"><font color="#FF0000" size="2" face="Arial"><img src="orgarrow1.jpg" width="9" height="6"><strong>Customer
            Login</strong><br>
            &nbsp;&nbsp;&nbsp;-&nbsp;Existing Member<br>
            &nbsp;&nbsp;&nbsp;-&nbsp;New Member Sign Up<br>
            <img src="orgarrow.jpg" width="9" height="6"><strong><a href="login.cfm?loginflg=2">Vendor
            Login</a></strong>
			</font></div></td>
	<cfelse>
		<td width="153" valign="top" bgcolor="#FFFF99" >
          <div align="left"><font color="#FF0000" size="2" face="Arial"><img src="orgarrow.jpg" width="9" height="6"><strong><a href="login.cfm?loginflg=1">Customer
            Login</a></strong><br>
            <img src="orgarrow1.jpg" width="9" height="6"><strong>Vendor Login</strong><br>
            &nbsp;&nbsp;&nbsp;-&nbsp;Existing Member<br>
            <font size="1"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Abstractor/Title
            Information<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Title Agent<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Attorney Closing Agent<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Notary Closing Agent<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Appraiser<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Ancillary Service Provider<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Flood Determination
            Vendor<br>
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Flood Determination
            Vendor<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;Credit Vendor<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;AVM Vendor&nbsp;&nbsp;&nbsp;</font><br>
            &nbsp;&nbsp;&nbsp;-&nbsp;Administrative Login
			</font></div></td>
	</cfif>
  <cfelse>

      <td width="153" valign="top" bgcolor="#FFCC66" > <div align="left"><font color="#FF0000" size="2" face="Arial">
          </font><font color="#FF0000" size="2" face="Arial"><img src="orgarrow.jpg" width="9" height="6"><strong><a href="login.cfm?loginflg=1">Customer
          Login</a></strong><br>
          <img src="orgarrow.jpg" width="9" height="6"><strong><a href="login.cfm?loginflg=2">Vendor
          Login</a></strong>
          </font></div></td>
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
    <td width="466" rowspan="2" valign="top" bordercolor="#FFFFFF">
	<table  align="center" width="458" >
        <tr>
          <td colspan="2"><div align="center">
              <p>&nbsp;</p>
              <p><img src="loginpic.jpg" width="400" height="108"></p>
            </div></td>
        </tr>
        <tr>
          <td colspan="2"><div align="justify"><font color="#666666">Welcome to
              the gateway to <cfoutput>#session.site.short_name#</cfoutput>&#8217;s automated, web-based, ordering
              and tracking system. To login please type your username and password
              below. Having trouble logging in? Click on one of the links below
              the login for help. </font></div></td>
        </tr>
        <tr>
          <td colspan="2"> <div align="center"><font color="#CC6633" face="Arial">Username:</font>
              <input name="textfield" type="text" size="20" maxlength="20">
            </div></td>
        </tr>
        <tr>
          <td height="21" colspan="2"> <div align="center"><font color="#CC6633" face="Arial">Password:</font>
              <input name="textfield2" type="text" size="20" maxlength="20">
            </div></td>
        </tr>
        <tr>
          <td width="233" height="24">&nbsp;</td>
          <td width="213"><input type="submit" name="Submit" value="Submit"></td>
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
    <td width="145" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td  height="500" valign="top" >&nbsp;</td>
  </tr>
</table>
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
