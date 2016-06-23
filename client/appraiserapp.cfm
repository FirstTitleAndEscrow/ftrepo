<CFPARAM NAME="a_trigger" DEFAULT="0">

<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>


		<CFSET a_states_list = ArrayNew(1)>
		<CFSET a_count = "1">

		<CFOUTPUT QUERY="read_state_list">
			<CFSET a_states_list[a_count] = #st_abbrev#>
			<CFSET a_count = #a_count# + "1">

		</CFOUTPUT>

			<CFSET a_state_cty_list = ArrayNew(2)>
			<CFSET a_county_count = ArrayNew(1)>

		<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="TTT">

			<CFQUERY datasource="#request.dsn#" NAME="read_state_cty_list">

				SELECT DISTINCT COUNTY
				FROM zip_info
				WHERE state = '#a_states_list[TTT]#'
				ORDER BY county ASC

			</CFQUERY>

				<CFSET b_count = "1">

				<CFOUTPUT QUERY="read_state_cty_list">
					<CFSET a_state_cty_list[TTT][b_count] = #county#>

					<CFSET b_count = #b_count# + "1">
				</CFOUTPUT>

				<CFSET a_county_count[TTT] = #b_count# - "1">

		</CFLOOP>

<html>
<head>
<title>Vendors</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}

.menu1 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu1:link    {text-decoration:none;color:#FFFFFF}
.menu1:visited {text-decoration:none;color:#FFFFFF}
.menu1:hover   {text-decoration:none;color:#000000}
.menu3 {color:#FFFFFF;font:normal bold 10px Verdana, Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu3:link    {text-decoration:none;color:#FFFFFF}
.menu3:visited {text-decoration:none;color:#FFFFFF}
.menu3:hover   {font:normal bold 11px Verdana, Arial, Helvetica, sans-serif;text-decoration:none;color:#FF3300}

</STYLE>
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

<!--- <cfoutput><link rel="stylesheet" href="https://#cgi.server_name#/client/style/style.css" type="text/css"></cfoutput>  --->
	<title>Abstractor Application</title>
	<cfoutput><script type="text/javascript" src="https://#cgi.server_name#/client/komodo_util.js"></script></cfoutput>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-22259646-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</head>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-22259646-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<body onresize="reposition(notab,true)" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#294163" link="#FF0000" vlink="#FF0000" alink="#FF0000">
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
            <td align="right" valign="bottom"><input type="image" src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/searchgo2.jpg" border=0 alt="Begin your Web search"></td>
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
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/loginb.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('LOGIN','','images/nav_login_on.jpg',1);" ><img name="LOGIN" src="images/nav_login_off.jpg" border="0" alt="LOGIN"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/company.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('COMPANY','','images/nav_company_on.jpg',1);" ><img name="COMPANY" src="images/nav_company_off.jpg" border="0" alt="COMPANY" onClick="document.location.href='/client/company.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/services.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('PRODUCTS','','images/nav_products_on.jpg',1);" ><img name="PRODUCTS" src="images/nav_products_off.jpg" alt="PRODUCTS" border="0"  onClick="document.location.href='/client/services.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/vendor.cfm"><img src="images/nav_vendors.jpg" border="0" alt="VENDORS"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/employment.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CAREERS','','images/nav_careers_on.jpg',1);" ><img name="CAREERS" src="images/nav_careers_off.jpg" alt="CAREERS" border="0" onClick="document.location.href='/client/employment.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/contact.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CONTACT','','images/nav_contact_on.jpg',1);" ><img name="CONTACT" src="images/nav_contact_off.jpg" alt="CONTACT US" border="0" onClick="document.location.href='/client/contact.cfm';return false;"></a></td>
			</tr>
			<tr>
				<td width="160"><img src="images/nav_vendors_bar_left.jpg" border="0"></td>
				<td colspan="6"><img src="images/nav_vendors_bar_right.jpg" border="0"></td>
			</tr>
	</table>

<cfoutput>
<table cellpadding="0" cellspacing="0" border="0" width="780">

	<tr>
		<td bgcolor="##00FF66" valign="top" width="160"><br>
		<table cellpadding="1" cellspacing="1" border="0" width="160">
		<tr>
		<!--- <td width="174" nowrap><img src="https://#cgi.server_name#/new/pictures/1blank.gif" width="174" height="8"></td></tr> --->
       <tr> <td width="189" ALIGN = "CENTER" bgcolor="##99FFCC"><font face="Arial, Helvetica, sans-serif" size="2"><b>BECOME A VENDOR</b></font></td></tr>

	  <tr> <td width="89" bgcolor="##008D00" nowrap onmouseover="this.bgColor='##99FFCC'" onmouseout="this.bgColor='##008D00'" onClick="document.location.href='https://#cgi.server_name#/client/titlevendor.cfm';return false;"><a class="menu1" href="https://#cgi.server_name#/client/titlevendor.cfm"><nobr>Abstractor/Title Info</nobr></font></a></td></tr>

         <tr> <td width="89" bgcolor="##008D00" nowrap onmouseover="this.bgColor='##99FFCC'" onmouseout="this.bgColor='##008D00'" onClick="document.location.href='https://#cgi.server_name#/client/attorneyagent.cfm';return false;"><a class="menu1" href="https://#cgi.server_name#/client/attorneyagent.cfm"><nobr>Attorney Closing Agent</nobr></font></a></td></tr>
			         <tr> <td width="89" bgcolor="##008D00" nowrap onmouseover="this.bgColor='##99FFCC'" onmouseout="this.bgColor='##008D00'" onClick="document.location.href='https://#cgi.server_name#/client/titleagent.cfm';return false;"><a class="menu1" href="https://#cgi.server_name#/client/titleagent.cfm"><nobr>Title Closing Agent</nobr></font></a></td></tr>
			<tr> <td width="89" bgcolor="##008D00" nowrap onmouseover="this.bgColor='##99FFCC'" onmouseout="this.bgColor='##008D00'" onClick="document.location.href='https://#cgi.server_name#/client/closeagent.cfm';return false;"><a class="menu1" href="https://#cgi.server_name#/client/closeagent.cfm"><nobr>Notary Closing Agent</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="##008D00" nowrap onmouseover="this.bgColor='##99FFCC'" onmouseout="this.bgColor='##008D00'" onClick="document.location.href='https://#cgi.server_name#/client/appraisalvendor.cfm';return false;"><a class="menu1" href="https://#cgi.server_name#/client/appraisalvendor.cfm"><nobr>Appraiser</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="##008D00" nowrap onmouseover="this.bgColor='##99FFCC'" onmouseout="this.bgColor='##008D00'" onClick="document.location.href='https://#cgi.server_name#/client/floodvendor.cfm';return false;"><a class="menu1" href="https://#cgi.server_name#/client/floodvendor.cfm"><nobr>Flood Vendor</nobr></font></a></td></tr>
			 <tr> <td width="89" bgcolor="##008D00" nowrap onmouseover="this.bgColor='##99FFCC'" onmouseout="this.bgColor='##008D00'" onClick="document.location.href='https://#cgi.server_name#/client/creditvendor.cfm';return false;"><a class="menu1" href="https://#cgi.server_name#/client/creditvendor.cfm"><nobr>Credit Vendor</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="##008D00" nowrap onmouseover="this.bgColor='##99FFCC'" onmouseout="this.bgColor='##008D00'" onClick="document.location.href='https://#cgi.server_name#/client/avmvendor.cfm';return false;"><a class="menu1" href="https://#cgi.server_name#/client/avmvendor.cfm"><nobr>AVM Vendor</nobr></font></a></td></tr>
</table>
</cfoutput>

		</td>
		<td bgcolor="#99FFCC" valign="top">
			<!---- body text starts ----->

      <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
   	<FORM METHOD=POST ACTION="https://<cfoutput>#cgi.server_name#</cfoutput>/client/appraiserappsubmit.cfm?a_trigger=1">
  <tr>

    <td bgcolor="#99FFCC" >

					<table cellspacing="1" cellpadding="2" class="forms" border="1" >
						<tr>
							<td class="head2" align = "center" colspan="6"><div class="head2"><b>APPRAISER INFORMATION APPLICATION</b></div></td>
						</tr>
						<tr>
							<td class="head3" colspan="1"><div class="head3">First Name:</div></td>
							<td class="head3" colspan="2"><div class="head3">Last Name:</div></td>
							<td class="head3" colspan="3"><div class="head3">Company:</div></td>

						</tr>

									<tr>
							<td colspan="1" class="data"><div class="data"><input class="form" type="text" size="15" maxlength="40" name="fname"/></div></td>
							<td colspan="2" class="data"><div class="data"><input class="form" type="text" size="15" maxlength="40" name="lname"/></div></td>
							<td colspan="3" class="data"><div class="data"><input class="form" type="text" size="15" maxlength="40" name="company"/></div></td>

						</tr>

						<tr>
								<td class="head3"><div class="head3">E-Mail Address:</div></td>
							<td colspan="5" class="data"><div class="data"><input class="form" type="text" size="30" maxlength="50" name="email"/></div></td>
						</tr>

						<tr>
							<td class="head3" colspan="6"><div class="head3">Physical Address:</div></td>
						</tr>
						<tr>
							<td class="head3" colspan="2"><div class="head3">Street Address:</div></td>
							<td class="head3" colspan="2"><div class="head3">City:</div></td>
							<td class="head3" colspan="1"><div class="head3">State:</div></td>
							<td class="head3" colspan="1"><div class="head3">ZipCode:</div></td>
						</tr>
						<tr>
							<td colspan="2" class="data"><div class="data"><input class="form" type="text" size="30" name="addr1"/></div></td>
							<td colspan="2" class="data"><div class="data"><input class="form" type="text" size="30" name="city"/></div></td>
							<td colspan="1" class="data"><div class="data"><select name="state" onchange="null">
					<option value="" selected></option>
					<option value="AK">AK</option>
					<option value="AL">AL</option>
					<option value="AR">AR</option>
					<option value="AZ">AZ</option>
					<option value="CA">CA</option>
					<option value="CO">CO</option>
					<option value="CT">CT</option>
					<option value="DC">DC</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="GU">GU</option>
					<option value="HI">HI</option>
					<option value="IA">IA</option>
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="MA">MA</option>
					<option value="MD">MD</option>
					<option value="ME">ME</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MO">MO</option>
					<option value="MS">MS</option>
					<option value="MT">MT</option>
					<option value="NC">NC</option>
					<option value="ND">ND</option>
					<option value="NE">NE</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>
					<option value="NV">NV</option>
					<option value="NY">NY</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="PR">PR</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VA">VA</option>
					<option value="VI">VI</option>
					<option value="VT">VT</option>
					<option value="WA">WA</option>
					<option value="WI">WI</option>
					<option value="WV">WV</option>
					<option value="WY">WY</option>
				</select></div></td>
							<td colspan="1" class="data"><div class="data"><input class="form" type="text" size="5" maxlength="5" name="zip"/></div></td>
						</tr>
						<tr>
							<td class="head3" colspan="6"><div class="head3">Mailing Address:</div></td>
						</tr>
						<tr>
							<td class="head3" colspan="2"><div class="head3">Street Address:</div></td>
							<td class="head3" colspan="2"><div class="head3">City:</div></td>
							<td class="head3" colspan="1"><div class="head3">State:</div></td>
							<td class="head3" colspan="1"><div class="head3">ZipCode:</div></td>
						</tr>
						<tr>
							<td colspan="2" class="data"><div class="data"><input class="form" type="text" size="30" name="MailingAddress"/></div></td>
							<td colspan="2" class="data"><div class="data"><input class="form" type="text" size="30" name="MailingCity"/></div></td>
							<td colspan="1" class="data"><div class="data"><select name="MailingState" onchange="null">
					<option value="" selected></option>
					<option value="AK">AK</option>
					<option value="AL">AL</option>
					<option value="AR">AR</option>
					<option value="AZ">AZ</option>
					<option value="CA">CA</option>
					<option value="CO">CO</option>
					<option value="CT">CT</option>
					<option value="DC">DC</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="GU">GU</option>
					<option value="HI">HI</option>
					<option value="IA">IA</option>
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="MA">MA</option>
					<option value="MD">MD</option>
					<option value="ME">ME</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MO">MO</option>
					<option value="MS">MS</option>
					<option value="MT">MT</option>
					<option value="NC">NC</option>
					<option value="ND">ND</option>
					<option value="NE">NE</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>
					<option value="NV">NV</option>
					<option value="NY">NY</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="PR">PR</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VA">VA</option>
					<option value="VI">VI</option>
					<option value="VT">VT</option>
					<option value="WA">WA</option>
					<option value="WI">WI</option>
					<option value="WV">WV</option>
					<option value="WY">WY</option>
				</select></div></td>
							<td colspan="1" class="data"><div class="data"><input class="form" type="text" size="5" maxlength="5" name="MailingZipCode"/></div></td>
						</tr>
						  <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Telephone
                                Numbers</DIV></TD>
                          </TR>
                          <TR>
                            <TD colSpan=3 class=head3> <DIV class=head3>Office No:

                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhonePrimary2)"
                  maxLength=3 size=3 name=PhonePrimary1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhonePrimary3)"
                  maxLength=3 size=3 name=PhonePrimary2>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',4)"
                  onkeyup="TabNext(this,'up',4,this.form.PhonePrimaryExt)"
                  maxLength=4 size=4 name=PhonePrimary3>
                                <INPUT class=form
                  maxLength=5 size=5 name=PhonePrimaryExt>
                              </DIV></TD>
                            <TD colspan = 3 class=head3> <DIV class=head3>Home:

                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhoneHome2)"
                  maxLength=3 size=3 name=PhoneHome1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhoneHome3)"
                  maxLength=3 size=3 name=PhoneHome2>
                                -
                                <INPUT class=form
                  maxLength=4 size=4 name=PhoneHome3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD colSpan=3 class=head3> <DIV class=head3>Pager No:

                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhonePager2)"
                  maxLength=3 size=3 name=PhonePager1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhonePager3)"
                  maxLength=3 size=3 name=PhonePager2>
                                -
                                <INPUT class=form
                  maxLength=4 size=4 name=PhonePager3>
                              </DIV></TD>
                            <TD colSpan=3 class=head3> <DIV class=head3>Cell:

                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhoneCell2)"
                  maxLength=3 size=3 name=PhoneCell1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhoneCell3)"
                  maxLength=3 size=3 name=PhoneCell2>
                                -
                                <INPUT class=form
                  maxLength=4 size=4 name=PhoneCell3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD colSpan=3 class=head3> <DIV class=head3>Fax No:
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhoneFax2)" maxLength=3
                  size=3 name=PhoneFax1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhoneFax3)" maxLength=3
                  size=3 name=PhoneFax2>
                                -
                                <INPUT class=form maxLength=4 size=4
                  name=PhoneFax3>
                              </DIV></TD>
                            <TD colSpan=3 class=head3> <DIV class=head3>Other:
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhoneOther2)"
                  maxLength=3 size=3 name=PhoneOther1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.PhoneOther3)"
                  maxLength=3 size=3 name=PhoneOther2>
                                -
                                <INPUT class=form
                  maxLength=4 size=4 name=PhoneOther3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Qualifications</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                incorporated?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value= "Yes" name = "Incorporated">
                                Yes&nbsp;
                                <INPUT class=form type=radio value="No" name = "Incorporated">
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                licensed?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=Licensed>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=Licensed>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                certified?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=Certified>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=Certified>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                a HUD approved appraiser?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=Approved>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=Approved>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD colSpan=3 class=head3> <DIV class=head3><FONT color=red></FONT>Fed
                                Tax ID:

                                <INPUT class=form
                  onkeydown="TabNext(this,'down',2)"
                  onkeyup="TabNext(this,'up',2,this.form.FedTaxId2)" maxLength=2
                  size=2 name=FedTaxId1>
                                <INPUT class=form maxLength=7 size=7
                  name=FedTaxId2>
                              </DIV></TD>
                            <TD colSpan=3 class=head3> <DIV class=head3><FONT color=red></FONT>SSN:

                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.SSN2)" maxLength=3
                  size=3 name=SSN1>
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',2)"
                  onkeyup="TabNext(this,'up',2,this.form.SSN3)" maxLength=2
                  size=2 name=SSN2>
                                <INPUT class=form maxLength=4 size=4
                  name=SSN3>
                              </DIV></TD>
                          </TR>
                   <TR>
                            <TD colspan = 2> License/Certification
                                Number:
                                <INPUT class=form
                  name=LicenseCertification>
                              </TD>
                            <TD colspan = 4>Expiration: (MM/DD/YY)<br>
                                <INPUT class=form
              name=ExpirationDate>
                              </TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Type of License:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=TypeOfLicense>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Have
                                you ever had any Real Estate License suspended,restricted
                                or revoked OR have you ever been convicted of
                                a felony or any public offense having as one of
                                its elements a fraudulent or dishonest act?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value = "Yes" name = "Suspended">
                                Yes&nbsp;
                                <INPUT class=form type=radio value = "No" name = "Suspended">
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>If yes, please furnish
                                details:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <TEXTAREA name=furnishDetailofSuspended rows=4 cols=35></TEXTAREA>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                currently carrying Errors &amp; Omissions insurance
                                on your work?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value = "Yes" name = "EOInsuranceAppraiser">
                                Yes&nbsp;
                                <INPUT class=form type=radio value = "No" name = "EOInsuranceAppraiser">
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>If yes, with which
                                Company:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                                <INPUT class=form size=30
                name=EOCompany>
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3>Policy Limit:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>$
                                <INPUT class=form size=8
                  name=EOPolicyLimit>
                              </DIV></TD>
                          </TR>
                      <TR>
                            <TD colspan = 2> Policy Number:
                                <INPUT class=form name=EOPolicyNo>
                              </TD>
                            <TD colspan = 4> Expiration: (MM/DD/YY)<br>

                                <INPUT class=form
                  name=PolicyExpirationDate>
                              </TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Appraisal
                                Service Areas</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>List all
                                counties where can complete
                                appraisal assignments.</DIV></TD>
                          </TR>
                          <TR>

                            <TD class=data colSpan=6> <DIV class=data>
                                <SELECT NAME="zip_id" MULTIPLE
					size="6"
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: e1e1e1;
					border-color: e1e1e1;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;
					clear: none;
					float: none;"
					rows="5"
					cols="45"
					>

					<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="DDD">
						<CFSET a_trigger = "1">

						<CFLOOP FROM="1" TO="#a_county_count[DDD]#" INDEX="RRR">
							<cfoutput>
								<OPTION VALUE="#a_states_list[DDD]#|#a_state_cty_list[DDD][RRR]#">#a_states_list[DDD]# --- #a_state_cty_list[DDD][RRR]#</OPTION>
							</CFOUTPUT>
						</CFLOOP>
					</CFLOOP>	</SELECT>
                              </DIV> Choose area or area(s) from select box to pick multiple counties, use curser and hold down "ctrl" key</TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Is there
                                any section of your service area that does not
                                have access to MLS?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=AccessMLS>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=AccessMLS>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>If so, what areas?:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                name=MLSarea>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Prior
                                Employment</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>Beginning
                                with your present position, list all employment
                                related to appraising in reverse chronological
                                order for the last 5 years:</DIV></TD>
                          </TR>
                          <!--***** Employer 1 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Employer
                                1</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year From:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrFrom1>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year To:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrTo1>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Name and Address
                                of Employer</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <TEXTAREA name=PriorNameAddressFrom1 rows=3 cols=35></TEXTAREA>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>% of Time Devoted
                                to Appraising</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  name=PriorDevotedtoAppraisingFrom1>
                              </DIV></TD>
                          </TR>
                          <!--***** Employer 2 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Employer
                                2</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year From:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrFrom2>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year To:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrTo2>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Name and Address
                                of Employer</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <TEXTAREA name=PriorNameAddressFrom2 rows=3 cols=35></TEXTAREA>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>% of Time Devoted
                                to Appraising</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  name=PriorDevotedtoAppraisingFrom2>
                              </DIV></TD>
                          </TR>
                          <!--***** Employer 3 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Employer
                                3</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year From:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrFrom3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year To:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=15
                  name=PriorMoYrTo3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Name and Address
                                of Employer</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <TEXTAREA name=PriorNameAddressFrom3 rows=3 cols=35></TEXTAREA>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>% of Time Devoted
                                to Appraising</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  name=PriorDevotedtoAppraisingFrom3>
                              </DIV></TD>
                          </TR>

                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>References</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>List three
                                clients and/or employers which
                                have accepted your appraisal reports, and may
                                be contacted by our Vendor management department.
                               </DIV></TD>
                          </TR>
                          <!--***** Reference 1 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Reference
                                1</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Company Name and
                                Address</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefCompanyName1>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Contact/Title</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefContact1>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Type of Business</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefBusinessType1>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Phone Number</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref1Phone2)"
                  maxLength=3 size=3 name=Ref1Phone1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref1Phone3)"
                  maxLength=3 size=3 name=Ref1Phone2>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',4)"
                  onkeyup="TabNext(this,'up',4,this.form.Ref1PhoneExt)"
                  maxLength=4 size=4 name=Ref1Phone3>
                                ext-
                                <INPUT class=form
                  maxLength=5 size=5 name=Ref1PhoneExt>
                              </DIV></TD>
                          </TR>
                          <!--***** Reference 2 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Reference
                                2</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Company Name and
                                Address</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefCompanyName2>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Contact/Title</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefContact2>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Type of Business</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefBusinessType2>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Phone Number</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref2Phone2)"
                  maxLength=3 size=3 name=Ref2Phone1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref2Phone3)"
                  maxLength=3 size=3 name=Ref2Phone2>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',4)"
                  onkeyup="TabNext(this,'up',4,this.form.Ref2PhoneExt)"
                  maxLength=4 size=4 name=Ref2Phone3>
                                ext-
                                <INPUT class=form
                  maxLength=5 size=5 name=Ref2PhoneExt>
                              </DIV></TD>
                          </TR>
                          <!--***** Reference 3 *****-->
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head4>Reference
                                3</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Company Name and
                                Address</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefCompanyName3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Contact/Title</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefContact3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Type of Business</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=RefBusinessType3>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Phone Number</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref3Phone2)"
                  maxLength=3 size=3 name=Ref3Phone1>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',3)"
                  onkeyup="TabNext(this,'up',3,this.form.Ref3Phone3)"
                  maxLength=3 size=3 name=Ref3Phone2>
                                -
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',4)"
                  onkeyup="TabNext(this,'up',4,this.form.Ref3PhoneExt)"
                  maxLength=4 size=4 name=Ref3Phone3>
                                ext-
                                <INPUT class=form
                  maxLength=5 size=5 name=Ref3PhoneExt>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Software</DIV></TD>
                          </TR>
                        <TR>
                            <TD class=head3 colSpan=2> <DIV class=head3>
							Type of appraisal software</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <SELECT onchange=null name=AppraiserSoftware>
                                  <OPTION value=WinTotal selected>A La Mode -
                                  WinTotal</OPTION>
                                 <OPTION value=HighPerForm>United Systems - HighPerForm</OPTION>

                                     <OPTION value="ACI Collection">Polaroid Digital
                                  Solutions - ACI Collection</OPTION>
								  <OPTION
                    value=AppraisalWorks>Day One - AppraisalWorks</OPTION>
					 <OPTION value="Appraiser's Tool">Bradford Technologies
                                  - Appraiser's Toolbox</OPTION>
                                 <OPTION
                    value=Nova>Day One - Nova</OPTION>

                                  <OPTION
                    value=Other>Other</OPTION>
                                </SELECT>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>If other,
                                please describe</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                <INPUT class=form size=30
                  name=AppOtherSoftware>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2><b>Fee Schedule</b></DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Single
                                Family Residential:</B> (Please list fees for
                                a 1004 form and the 2055 form) This appraisal
                                is for a second mortage or equity Line,it meets
                                FNMA requirements &amp; FIRREA regulations, however,
                                along with the 1004/2055 we only require an exterior
                                perimeter sketch and a location map. We don't
                                require deed copies or plat maps. Any addenda
                                are kept to a minimum(whatever is an absolute
                                necessity).</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>1004/1073 Form:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                name=Form1004>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>2055 Exterior Form:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=ExteriorForm2055>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>2055 Interior Form:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=InteriorForm2055>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>External
                                Foreclosure:</B> This appraisal is used when the
                                appraiser is unable to gain access to a property
                                being foreclosed upon. It will require the ERC
                                listing grid as above. Also requires External
                                Foreclosure Addendum(available upon request) as
                                well as original photos as specified above.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>704 Form:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                name=Form704>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Reinspection
                                or Final Inspection:</B> Reinspection is used
                                when there was a cost to cure on the original
                                appraisal or when the appraisal was completed
                                "subject to" and the lender wants to be sure that
                                the work was completed. Final Inspection is used
                                when the original appraisal was completed on a
                                property that was under construction with the
                                use of plans and specifications and is now complete
                                and needs final inspection.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Reinspection or
                                Final Inspection:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=ReFinalInspection>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Recertification:</B>
                                Recertifications are used if an appraisal was
                                completed less than 6 months prior on the property
                                and the homeowner wants additional funds. The
                                appraiser will recertify the value.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Recertification:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=Recertification>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Final
                                Inspection:</B> (Form 442)</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Form 442:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                name=Form442>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Field
                                Review:</B> (FNMA 2000) <cfoutput>#session.site.short_name#</cfoutput> uses field reviews
                                primarily for quality control purposes. The appraiser
                                will receive as much of the original appraisal
                                as we have available.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>FNMA 2000:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                name=FNMA2000>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Multi Family: (1025
                                Form):</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=FormMulti1025>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>FHA/HUD Appraisal
                                URAR: (1004 Form):</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=FormFHAAppraisal1004>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Desktop:</B>
                                (FNMA 2006) The appraiser will receive as much
                                of the original appraisal as available.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>FNMA 2006:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                name=FNMA2006>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>On occasion,
                                we will ask for a report without requiring comp
                                photos. If this situation occurs would your fee
                                differ? If yes, list the amount to be deducted
                                from each product type when comp photos are not
                                required.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Amount deducted:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                                <INPUT class=form size=25
                  name=AmountDeducted>
                              </DIV></TD>
                          </TR>

                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2><b>Licensing
                                &amp; Insurance Information</b></DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><b>Please Fax
                                a copy of state appraiser license(s) or certificate(s).
                                Also attach a copy of the declaration page of
                                your E &amp; O insurance. Please Fax to: 1-301-315-8161</b></DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Statement</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>The foregoing
                                application has been completed by me to induce
                                <cfoutput>#session.site.short_name#</cfoutput> to approve me as
                                a Real Estate Property Appraiser. I hereby certify
                                that the answers and statements given herein are
                                true and correct to the best of my knowledge and
                                belief. In connection with my applicaiton, I understand
                                that my references and/or previous employers will
                                be contacted.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 align = "right" colSpan=6> <DIV class=form_button>
                                <INPUT class=form type=hidden
                  value=True name=form>
                                <INPUT class=form type=hidden
                  value=/work/appraiser.html name=_form_refurl>
                                <INPUT
                  class=form type=hidden value="Appraiser application"
                  name=_form_emailsubject>
                                <INPUT class=form type=hidden
                  value=APPRAISERFORM_TEMPLATE name=_form_template>
                                <INPUT
                  class=form type=hidden value=jmiller@gac.com,nrivers@gac.com
                  name=_form_emailto>
                                <INPUT class=form type=hidden value=email
                  name=_form_action>
                                <INPUT class=button type=submit value="Submit Form">
                              </DIV></TD>
                          </TR>
                        </TBODY>
                      </TABLE>



			  </td>
        </tr>
       <!---  <tr>
          <td><p>
		  </p>
            <p>&nbsp;</p></td>
        </tr> --->
    </form>
	  </table>
			<!---- body text ends ----->
		</td>
	</tr>
	<tr>
		<td bgcolor="008D00">&nbsp;</td>
		<td bgcolor="000000">
			<table cellpadding="0" cellspacing="0" border="0" width="98%" align="center">
				<tr>
					<td width="47%"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b><a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/main.cfm">Home<a> | <a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/termuse.cfm">Terms of Use<a>  | <a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/policy.cfm">Privacy Policy<a></b></font></td>
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>© 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> <cfoutput>#session.site.long_name#</cfoutput></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>


