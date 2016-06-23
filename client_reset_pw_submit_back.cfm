<cfset successful_change = 0>
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="new_password" DEFAULT="">
<CFPARAM NAME="retype_new_password" DEFAULT="">
<cfset lower_case_letters = 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z'>
<cfset upper_case_letters = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z'>
<cfset numbers_and_special = '0,1,2,3,4,5,6,7,8,9'>
<cfset error_message = ''>
<cfset contains_upper = 0>
<cfset contains_lower = 0>
<cfset contains_number = 0>



<!--- check to see if this both fields match --->
<cfif new_password eq retype_new_password>
<cfelse>
<cfset error_message = error_message & '<br>New Password and Confirm New Password must match Exactly'>
</cfif>


<!--- check to see if this new password is of proper length --->
<cfif Len(new_password) GTE 6>
<cfelse>
<cfset error_message = error_message & '<br>New Password must contain at least 6 characters'>
</cfif>



<!--- check to see if this new password contains all valid characters --->
<cfloop index="i" from="1" to="#Len(new_password)#">
<cfif ListContains(lower_case_letters, Mid(new_password, i, 1), ',')>
<cfset contains_lower = 1>
</cfif>
<cfif ListContains(upper_case_letters, Mid(new_password, i, 1), ',')>
<cfset contains_upper = 1>
</cfif>
<cfif ListContains(numbers_and_special, Mid(new_password, i, 1), ',')>
<cfset contains_number = 1>
</cfif>
<cfif ListContains(lower_case_letters, Mid(new_password, i, 1), ',') or ListContains(upper_case_letters, Mid(new_password, i, 1), ',') or ListContains(numbers_and_special, Mid(new_password, i, 1), ',')>
<cfelse>
<cfset error_message = error_message & '<br>New Password must contain only letters and numbers'>
</cfif>
</cfloop>

<cfif contains_upper eq 0>
<cfset error_message = error_message & '<br>New Password must contain at least one UPPER CASE letter'>
</cfif>
<cfif contains_lower eq 0>
<cfset error_message = error_message & '<br>New Password must contain at least one lower case letter'>
</cfif>
<cfif contains_number eq 0>
<cfset error_message = error_message & '<br>New Password must contain at least one number'>
</cfif>


<cfif IsDefined("session.comp_pass_reset") and session.comp_pass_reset neq '' and session.comp_pass_reset neq 'NULL'>
<cfset comppassreset = session.comp_pass_reset>
</cfif>

<cfif IsDefined("comppassreset") and comppassreset neq '' and comppassreset neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="check_username">
		select * from companies
		where (a_user = '#username#'
		and a_pass = '#new_password#'
		and ID <> #comppassreset#)
</CFQUERY>
</cfif>
<cfif check_username.recordcount GTE 1>
<cfset error_message = error_message & '<br>Username is already registered, please choose another'>
</cfif>

<!--- if there are errors --->
<cfif error_message neq ''>
<CFLOCATION URL="/client_reset_pw.cfm?user_id_1=0&lo_id=0&error_message=#error_message#">
</cfif>

<!--- if there are no errors, password is good and we should reset it it, and log them in --->
<cfif error_message eq ''>
<CFQUERY datasource="#request.dsn#" NAME="update_pass">
		update companies set a_pass = '#new_password#',
		last_password_change = #CreateODBCDateTime(Now())#,
		reset_password_due = 'False',
		a_user = '#username#'
		where ID = #comppassreset#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
		select * from companies
		where ID = #comppassreset#
</CFQUERY>

</cfif>


<html>
<head>
<title>Security</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
 <!--- P {font:bold 11px Courier,Verdana,Tahoma,Arial} --->
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
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}

.menu1 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu1:link    {text-decoration:none;color:#FFFFFF;}
.menu1:visited {text-decoration:none;color:#FFFFFF}
.menu1:hover   {font:normal bold 13px Arial, Helvetica, sans-serif;text-decoration:none;color:#000000}
.menu3 {color:#FFFFFF;font:normal bold 10px Verdana, Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu3:link    {text-decoration:none;color:#FFFFFF}
.menu3:visited {text-decoration:none;color:#FFFFFF}
.menu3:hover   {font:normal bold 11px Verdana, Arial, Helvetica, sans-serif;text-decoration:none;color:#FF3300}

.menu2 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu2:link    {text-decoration:none;color:#000000}
.menu2:visited {text-decoration:none;color:#000000}
.menu2:hover   {font:normal bold 14px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}
</STYLE>

</head>
<body bgcolor="#294163" link="#FF0000" vlink="#FF0000" alink="#FF0000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('/client/images/nav_company_on.jpg')">
<table width="780" height="110" border=0 cellpadding=0 cellspacing=0 background="client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="client/logo_swap_include.cfm"></td>
    <td valign="top" align="right">
	<br>
	<FORM name=formSearch action="javascript:startsearch() //">
	    <table align="right" cellpadding="0" cellspacing=0>
          <tr>
            <td align="center" valign="middle"><b><font color="96E102" size="2" face="Verdana, Helvetica, sans-serif">Search</font></b>&nbsp;</td>
            <td align="center" valign="center">
              <input type="text" name="txtSearch" size=20>&nbsp;</td>
            <td align="right" valign="bottom"><input type="image" src="https://www.firsttitleservices.com/client/images/searchgo2.jpg" border=0 alt="Begin your Web search"></td>
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
	<!--- navigation table begins---->

	<table cellpadding="0" cellspacing="0" border="0" width="780" bgcolor="000000">
	<cfif session.site.site_initials eq 'FT'>
			<tr>
				<td width="160" bgcolor="000000">&nbsp;</td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm"><img src="client/images/nav_login.jpg" border="0" alt="LOGIN" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/company.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('COMPANY','','client/images/nav_company_on.jpg',1);" ><img name="COMPANY" src="client/images/nav_company_off.jpg" border="0" alt="COMPANY" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/company.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/services.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('PRODUCTS','','client/images/nav_products_on.jpg',1);" ><img name="PRODUCTS" src="client/images/nav_products_off.jpg" alt="PRODUCTS" border="0" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/services.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/vendor.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('VENDORS','','client/images/nav_vendors_on.jpg',1);" ><img name="VENDORS" src="client/images/nav_vendors_off.jpg" alt="VENDORS" border="0" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/employment.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CAREERS','','client/images/nav_careers_on.jpg',1);" ><img name="CAREERS" src="client/images/nav_careers_off.jpg" alt="CAREERS" border="0" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/employment.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/contact.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CONTACT','','client/images/nav_contact_on.jpg',1);" ><img name="CONTACT" src="client/images/nav_contact_off.jpg" alt="CONTACT US" border="0" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/contact.cfm';return false;"></a></td>
			</tr>
</cfif>
			<tr>
				<td width="160"><img src="client/images/nav_login_bar_left.jpg" border="0"></td>
				<cfif session.site.site_initials eq 'FT'>
				<td colspan="6"><img src="client/images/nav_login_bar_right.jpg" border="0"></td>
				<cfelse>
				<td colspan="6"><img src="client/images/nav_login_bar_right_blank.jpg" border="0"></td>
				</cfif>

			</tr>
	</table>

	<!--- navigation table ends---->
<table cellpadding="0" cellspacing="0" border="0" width="780">
	<tr>
		<td bgcolor="FECE62" valign="top" width="160"><br>
		<table cellpadding="1" cellspacing="1" border="0" width="160">
	        <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm"><nobr>Customer Login</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/vlogin.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/vlogin.cfm"><nobr>Vendor Login</nobr></font></a></td></tr>
          <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/tlogin.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/tlogin.cfm"><nobr>Third Party Login</nobr></font></a></td></tr>
       	 <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/alogin.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/alogin.cfm"><nobr>Admin Login</nobr></font></a></td></tr>
		<tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/registerb.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/registerb.cfm"><nobr>New Customer Signup</nobr></font></a></td></tr>
	<tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm"><nobr>New Vendor Signup</nobr></font></a></td></tr>

					 </table><br>
<br>

<!--- <div align="center">
<script src="https://siteseal.thawte.com/cgi/server/thawte_seal_generator.exe"></script>
</div>
 --->
</td>
		<td bgcolor="FFFFFF" valign="top">
			<!---- body text starts ----->
			<table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
				<tr>

					<td align="center" valign="center"><br><font color="#CC6633" face="Arial"><H3><B>CLIENT PASSWORD RESET</B></H3></FONT></td>
				</tr>
				<tr>
					<td>
					<table width="410" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
			  <tr>
					<td align="left">
			 	<p><font face="Arial, Helvetica, sans-serif" size="2">

				Your password has now been reset. Your username for this account is:<br>
<br>
<strong><cfoutput>#GET_COMP.a_USER#</cfoutput></strong><br>
<br>
To continue to your account, click below to be automatically logged in.<br>
<br>

<cfoutput><CFFORM action="https://#CGI.SERVER_NAME#/client_login_submit.cfm">
<input name="user_name" type="hidden"  value="#GET_COMP.a_user#">
<input name="password" type="hidden"   value="#GET_COMP.a_pass#">
<input type="submit" name="Submit" value="Log Me In"></p>
</cfform></cfoutput>


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>



				</td></tr></table></td></tr></table>
			<!---- body text ends ----->
		</td>
	</tr>
	<tr>
		<td bgcolor="D98002" width="160">&nbsp;</td>
		<td bgcolor="000000">
			<table cellpadding="0" cellspacing="0" border="0" width="98%" align="center">
				<tr>
					<td width="47%"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b><a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/main.cfm">Home<a> | <a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/termuse.cfm">Terms of Use<a>  | <a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/policy.cfm">Privacy Policy<a></b></font></td>
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>© 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> <cfoutput>#session.site.Long_Name#</cfoutput></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
