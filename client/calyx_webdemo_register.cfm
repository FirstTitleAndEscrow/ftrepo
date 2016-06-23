

<html>
<head>
<title><cfoutput>#session.site.short_name#</cfoutput>
/Calyx Direct Connect - Getting Started</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
P {font:bold 11px Courier,Verdana,Tahoma,Arial}
.menu1 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu1:link    {text-decoration:none;color:#FFFFFF} 
.menu1:visited {text-decoration:none;color:#FFFFFF} 
.menu1:hover   {font:normal bold 13px Arial, Helvetica, sans-serif;text-decoration:none;color:#000000} 
.menu2 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu2:link    {text-decoration:none;color:#000000} 
.menu2:visited {text-decoration:none;color:#000000} 
.menu2:hover   {font:normal bold 14px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}
.menu3 {color:#FFFFFF;font:normal bold 10px Verdana, Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu3:link    {text-decoration:none;color:#FFFFFF} 
.menu3:visited {text-decoration:none;color:#FFFFFF} 
.menu3:hover   {font:normal bold 11px Verdana, Arial, Helvetica, sans-serif;text-decoration:none;color:#FF3300}

</STYLE> 

<script language="javascript">

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<script language="JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
//-->
</script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#294163" link="#FF0000" vlink="#FF0000" alink="#FF0000">
<table width="780" height="110" border=0 cellpadding=0 cellspacing=0 background="images/banner_black_wout_logo.jpg" valign=top>
  <tr> 
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right">
	<br>
	<FORM name=formSearch action="javascript:startsearch() //">
	    <table align="right" cellpadding="0" cellspacing=0>
          <tr> 
            <td align="center" valign="middle"><b><font color="96E102" size="2" face="Verdana, Helvetica, sans-serif">Search</font></b>&nbsp;</td>
            <td align="center" valign="center"> 
              <input type="text" name="txtSearch" size=20>&nbsp;</td>
            <td align="right" valign="bottom"><input type="image" src="/client/images/searchgo2.jpg" border=0 alt="Begin your Web search"></td>
			<td width="30">&nbsp;</td>
		  </tr>
		</table>
  </FORM>
</td>
  </tr>
  <tr> 
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>
<table cellpadding="0" cellspacing="0" border="0" width="780" bgcolor="000000">
			<tr>
				<td width="160" bgcolor="000000">&nbsp;</td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/loginb.cfm"><img src="images/nav_login.jpg" border="0" alt="LOGIN"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/company.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('COMPANY','','images/nav_company_on.jpg',1);" ><img name="COMPANY" src="images/nav_company_off.jpg" border="0" alt="COMPANY" onClick="document.location.href='/client/company.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/services.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('PRODUCTS','','images/nav_products_on.jpg',1);" ><img name="PRODUCTS" src="images/nav_products_off.jpg" alt="PRODUCTS" border="0"  onClick="document.location.href='/client/services.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/vendor.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('VENDORS','','images/nav_vendors_on.jpg',1);" ><img name="VENDORS" src="images/nav_vendors_off.jpg" alt="VENDORS" border="0" onClick="document.location.href='/client/vendor.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/employment.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CAREERS','','images/nav_careers_on.jpg',1);" ><img name="CAREERS" src="images/nav_careers_off.jpg" alt="CAREERS" border="0" onClick="document.location.href='/client/employment.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/contact.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CONTACT','','images/nav_contact_on.jpg',1);" ><img name="CONTACT" src="images/nav_contact_off.jpg" alt="CONTACT US" border="0" onClick="document.location.href='/client/contact.cfm';return false;"></a></td>
				</tr>
			<tr>
				<td width="160"><img src="images/nav_login_bar_left.jpg" border="0"></td>
				<td colspan="6"><img src="images/nav_login_bar_right.jpg" border="0"></td>
			</tr>
	</table>
	<table cellpadding="0" cellspacing="0" border="0" width="780">
	<tr>
		<td bgcolor="FECE62" valign="top" width = "160"><br>
		<table cellpadding="1" cellspacing="1" border="0" width="160">
		   <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/loginb.cfm';return false;"><a class="menu1" href="/client/loginb.cfm"><nobr>Customer Login</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/vlogin.cfm';return false;"><a class="menu1" href="/client/vlogin.cfm"><nobr>Vendor Login</nobr></font></a></td></tr>
          <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/tlogin.cfm';return false;"><a class="menu1" href="/client/tlogin.cfm"><nobr>Third Party Login</nobr></font></a></td></tr>
       	 <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/alogin.cfm';return false;"><a class="menu1" href="/client/alogin.cfm"><nobr>Admin Login</nobr></font></a></td></tr>
		<tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='FF9900'" onClick="document.location.href='/client/registerb.cfm';return false;"><a class="menu1" href="/client/contact.cfm"><nobr>New Customer Signup</nobr></font></a></td></tr>
	<tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='FF9900'" onClick="document.location.href='/client/vendor.cfm';return false;"><a class="menu1" href="/client/vendor.cfm"><nobr>New Vendor Signup</nobr></font></a></td></tr>
		
					 </table>


		</td>
		<td bgcolor="FFFFFF" valign="top">
			<!---- body text starts ----->
			
      <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
        <tr> 
          <td align="center" valign="center">
<style>
.label {font-size: 12px; color:black; font-family:Arial, Helvetica, sans-serif;}
.header {font-size: 20px; color:#000066; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
.header2 {font-size: 14px; color:#FF6600; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
.smallprint {font-size: 10px; color:black; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
.bodytext {font-size: 12px; color:black; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
.alert {font-size: 16px; color:red; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
</style>

 <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
 <tr><td>
<table width="100%"  border="0" cellspacing="3" cellpadding="3">
  <tr>
  <td colspan="2" align="center">
<table width="100%">
<tr>
<td align="left" valign="middle"><img src="images/FT_bug.gif" width="44" height="50"></td>
<td align="center" valign="middle" class="header">Welcome Calyx Point User<br>
<span class="header2"><cfoutput>#session.site.short_name#</cfoutput>
 Web Demo Registration</span></td>
<td align="left" valign="middle"><img src="images/Calyx_bug.gif" width="80" height="33"></td>
</tr>
</table>
</td>
  </tr>
  <tr>
    <td align="center" valign="top" class="header2">Join us every Tues. at 10 AM and Thurs. at 4 PM EST for  '<cfoutput>#session.site.short_name#</cfoutput>
 Web Training'<br>
<br>
<!--- <span class="bodytext">Text about the demos will go here<br> --->
<br>
<!--- <span class="alert">Remember to store your Username and Password in Point for Auto login</span><br>
<br>
 ---><a href="https://www.gotomeeting.com/register/409240122">Register for Webinar to take place Feb 6th, 10 AM EST</a><br>
<br><a href="https://www.gotomeeting.com/register/751208216">Register for Webinar to take place Feb 8th, 4 PM EST</a><br>

<br>
</span></td></tr>
</table>
</td></tr></table>

		  </td>
        </tr>
      </table>
			<!---- body text ends ----->
		</td>
	</tr>
	<tr>
		<td bgcolor="D98002">&nbsp;</td>
		<td bgcolor="000000">
			<table cellpadding="0" cellspacing="0" border="0" width="98%" align="center">
				<tr>
				<td width="47%"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b><a class="menu3" href="./main.cfm">Home<a> | <a class="menu3" href="./termuse.cfm">Terms of Use<a>  | <a class="menu3" href="./policy.cfm">Privacy Policy<a></b></font></td>
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>© 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> <cfoutput>#session.site.Long_Name#</cfoutput></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</body>
</html>
