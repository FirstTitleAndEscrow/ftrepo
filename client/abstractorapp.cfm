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
	function ValidateForm(frm)
{
frm = document.frm;

if (frm.zip_id.value=='') {
 alert("Please select county(ies)/state(s)")
 frm.zip_id.focus();
      return false;
 }

 return true;

 }
 </script>

</head>
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

	<CFFORM NAME="frm"  ACTION="https://#cgi.server_name#/client/abstractorappsubmit.cfm?a_trigger=1" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" method="post">
      <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

  <tr>

    <td bgcolor="#99FFCC" >

				    <td bgcolor="#99FFCC" >

					<table cellspacing="1" cellpadding="2" class="forms" border="1" >
						<tr>
							<td class="head2" align = "center" colspan="6"><div class="head2"><b>ABSTRACT VENDOR APPLICATION</b></div></td>
						</tr>
						             <TR>
                            <TD class=head3> <DIV class=head3>Company/Firm Name:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                             <cfINPUT TYPE="Text" NAME="company" SIZE=20 MAXLENGTH=45
									REQUIRED="yes" Message="You must enter the company or firm name"
									 >
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3>E-Mail:</DIV></TD>
                            <TD class=data style="BORDER-RIGHT: #62725a 1px solid"
colSpan=2> <DIV class=data>
                               <cfINPUT TYPE="Text" NAME="email" SIZE=11 MAXLENGTH=45
									REQUIRED="yes" Message="You must enter an email address"
									 >
                              </DIV></TD>
                          </TR>

                          <TR>
                            <TD class=head3> <DIV class=head3>Contact:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                               First name <cfINPUT TYPE="Text" NAME="fname" SIZE=11 MAXLENGTH=45
									REQUIRED="yes" Message="You must enter your first name"
									 >  Last name <cfINPUT TYPE="Text" NAME="lname" SIZE=11 MAXLENGTH=45
									REQUIRED="yes" Message="You must enter your last name"
									 >
                              </DIV></TD>
                          </TR>


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
							<td colspan="2" class="data"><div class="data"><input class="form" type="text" size="30" name="City"/></div></td>
							<td colspan="1" class="data"><div class="data"><select name="State" onchange="null">
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
							<td colspan="1" class="data"><div class="data"><input class="form" type="text" size="5" maxlength="5" name="Zip_Code"/></div></td>
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
							<td colspan="2" class="data"><div class="data"><input class="form" type="text" size="30" name="addr2"/></div></td>
							<td colspan="2" class="data"><div class="data"><input class="form" type="text" size="30" name="City2"/></div></td>
							<td colspan="1" class="data"><div class="data"><select name="State2" onchange="null">
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
							<td colspan="1" class="data"><div class="data"><input class="form" type="text" size="5" maxlength="5" name="Zip_Code2"/></div></td>
						</tr>
						<tr>
							<td class="head3" colspan="6"><div class="head3">Previous Address:</div></td>
						</tr>
						<tr>
							<td class="head3" colspan="2"><div class="head3">Street Address:</div></td>
							<td class="head3" colspan="2"><div class="head3">City:</div></td>
							<td class="head3" colspan="1"><div class="head3">State:</div></td>
							<td class="head3" colspan="1"><div class="head3">ZipCode:</div></td>

						</tr>
						<tr>
							<td colspan="2" class="data"><div class="data"><input class="form" type="text" size="30" name="PreviousAddress"/></div></td>
							<td colspan="2" class="data"><div class="data"><input class="form" type="text" size="30" name="PreviousCity"/></div></td>
							<td colspan="1" class="data"><div class="data"><select name="PreviousState" onchange="null">
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
							<td colspan="1" class="data"><div class="data"><input class="form" type="text" size="5" maxlength="5" name="PreviousZipCode"/></div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">How Long? (if less than 2 years at current)</div></td>
							<td colspan="3" class="data"><div class="data"><input class="form" type="text" size="30" maxlength="50" name="AddressHowLong"/></div></td>
						</tr>
						<tr>
							<td class="head2" colspan="6"><div class="head2">Telephone Numbers</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">Office No:</div><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhonePrimary1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhonePrimary2)">-<input class="form" type="text" size="3" maxlength="3" name="PhonePrimary2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhonePrimary3)">-<input class="form" type="text" size="4" maxlength="4" name="PhonePrimary3" onKeyDown="TabNext(this,'down',4)" onKeyUp="TabNext(this,'up',4,this.form.PhonePrimaryExt)"> <input class="form" type="text" size="5" maxlength="5" name="PhonePrimaryExt">
							</div></td>
							<td colspan="4" class="head3"><div class="head3">Home No:</div><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhoneHome1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneHome2)">-<input class="form" type="text" size="3" maxlength="3" name="PhoneHome2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneHome3)">-<input class="form" type="text" size="4" maxlength="4" name="PhoneHome3">
							</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">Courthouse No:</div><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhoneOther1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneOther2)">-<input class="form" type="text" size="3" maxlength="3" name="PhoneOther2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneOther3)">-<input class="form" type="text" size="4" maxlength="4" name="PhoneOther3">
							</div></td>
							<td colspan="4" class="head3"><div class="head3">Cell No:</div><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhoneCell1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneCell2)">-<input class="form" type="text" size="3" maxlength="3" name="PhoneCell2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneCell3)">-<input class="form" type="text" size="4" maxlength="4" name="PhoneCell3">
							</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">Pager No:</div><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhonePager1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhonePager2)">-<input class="form" type="text" size="3" maxlength="3" name="PhonePager2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhonePager3)">-<input class="form" type="text" size="4" maxlength="4" name="PhonePager3">
							</div></td>
							<td colspan="4" class="head3"><div class="head3">Fax No:</div><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="PhoneFax1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneFax2)">-<input class="form" type="text" size="3" maxlength="3" name="PhoneFax2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.PhoneFax3)">-<input class="form" type="text" size="4" maxlength="4" name="PhoneFax3">
							</div></td>
						</tr>
								<tr>
							<td colspan="3" class="head3"><div class="head3">Method by which you wish to receive your abstract report request</div></td>
							<td colspan="3" class="data"><div class="data2"><input class="form" type="radio" name="pref_for_send" value="Email"/ checked>Email&nbsp;<input class="form" type="radio" name="pref_for_send" value="Fax"/>Fax</div></td>
						</tr>
						<tr>
							<td class="head2" colspan="6"><div class="head2">Qualifications</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">If your company is organizzed, what type?</div></td>
							<td colspan="3" class="data"><div class="data2"><select name="PreviousState" onchange="null">
					<option value="" selected></option>
					<option value="corporation">Corporation</option>
					<option value="Sole Prop">Sole Prop</option>
					<option value="other">other</option>


				</select></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3"><font color="red"></font>Fed Tax ID:</div></td>
							<td colspan="2" class="data"><div class="data">
								<input class="form" type="text" size="2" maxlength="2" name="FedTaxId1" onKeyDown="TabNext(this,'down',2)" onKeyUp="TabNext(this,'up',2,this.form.FedTaxId2)"><input class="form" type="text" size="7" maxlength="7" name="FedTaxId2">
							</div></td>
							<td class="head3"><div class="head3"><font color="red"></font>SSN:</div></td>
							<td colspan="2" class="data" style="border-right: 1px solid #62725A"><div class="data">
								<input class="form" type="text" size="3" maxlength="3" name="SSN1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.SSN2)"><input class="form" type="text" size="2" maxlength="2" name="SSN2" onKeyDown="TabNext(this,'down',2)" onKeyUp="TabNext(this,'up',2,this.form.SSN3)"><input class="form" type="text" size="4" maxlength="4" name="SSN3">
							</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">Are you currently carrying Errors & Omissions insurance on your work?</div></td>
							<td colspan="3" class="data"><div class="data2"><input class="form" type="radio" name="EOInsurance" value="Yes"/>Yes&nbsp;<input class="form" type="radio" name="EOInsurance" value="No"/>No</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">If yes, with which Company:</div></td>
							<td colspan="3" class="data"><div class="data"><input class="form" type="text" size="30" maxlength="50" name="EOCompany"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Amount of Coverage:</div></td>
							<td colspan="5" class="data"><div class="data">$<input class="form" type="text" size="20" maxlength="20" name="EOAmount"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Expiration date:</div></td>
							<td colspan="5" class="data"><div class="data"><input class="form" type="text" size="20" maxlength="20" name="EOExpireDate"/></div></td>
						</tr>

						<tr>
							<td class="head2" colspan="6"><div class="head2">Service Area</div></td>
						</tr>
						<tr>
							<td colspan="2" class="head3"><div class="head3">List all counties where you feel qualified to complete title searches.</div></td>
							<td colspan="4" class="data"><div class="data">
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

							</div></td>
						</tr>
						<tr>
							<td class="head2" colspan="6"><div class="head2">References</div></td>
						</tr>
						<tr>
							<td colspan="6" class="text"><div class="text">To summarize your experience, list two clients and or employers which you have performed Searches for and may be contacted by our Vendor Management. Please make certain that your reference information is correct.</div></td>
						</tr>
						<tr>
							<td class="head3" colspan="6"><div class="head4">Reference 1</div></td></tr>
						<tr>
							<td class="head3"><div class="head3">Company Name and Address</div></td>
							<td colspan="5" class="data"><div class="data"><input class="form" type="text" size="30" name="RefCo1"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Contact/Title</div></td>
							<td colspan="5" class="data"><div class="data"><input class="form" type="text" size="30" name="RefContact1"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Type of Business</div></td>
							<td colspan="5" class="data"><div class="data"><input class="form" type="text" size="30" name="RefBusinessType1"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Phone Number</div></td>
							<td colspan="5" class="data"><div class="data">
						 		<input class="form" type="text" size="3" maxlength="3" name="Ref1Phone1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.Ref1Phone2)">-<input class="form" type="text" size="3" maxlength="3" name="Ref1Phone2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.Ref1Phone3)">-<input class="form" type="text" size="4" maxlength="4" name="Ref1Phone3" onKeyDown="TabNext(this,'down',4)" onKeyUp="TabNext(this,'up',4,this.form.Ref1PhoneExt)"> ext-<input class="form" type="text" size="5" maxlength="5" name="Ref1PhoneExt">
							</div></td>
						</tr>
						<tr>
							<td class="head3" colspan="6"><div class="head4">Reference 2</div></td></tr>
						<tr>
							<td class="head3"><div class="head3">Company Name and Address</div></td>
							<td colspan="5" class="data"><div class="data"><input class="form" type="text" size="30" name="RefCo2"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Contact/Title</div></td>
							<td colspan="5" class="data"><div class="data"><input class="form" type="text" size="30" name="RefContact2"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Type of Business</div></td>
							<td colspan="5" class="data"><div class="data"><input class="form" type="text" size="30" name="RefBusinessType2"/></div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Phone Number</div></td>
							<td colspan="5" class="data"><div class="data">
						 		<input class="form" type="text" size="3" maxlength="3" name="Ref2Phone1" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.Ref2Phone2)">-<input class="form" type="text" size="3" maxlength="3" name="Ref2Phone2" onKeyDown="TabNext(this,'down',3)" onKeyUp="TabNext(this,'up',3,this.form.Ref2Phone3)">-<input class="form" type="text" size="4" maxlength="4" name="Ref2Phone3" onKeyDown="TabNext(this,'down',4)" onKeyUp="TabNext(this,'up',4,this.form.Ref2PhoneExt)"> ext-<input class="form" type="text" size="5" maxlength="5" name="Ref2PhoneExt">
							</div></td>
						</tr>
						<tr>
							<td class="head2" colspan="6"><div class="head2">Fee Schedule/Turn Times</div></td>
						</tr>
						<tr>
							<td colspan="6" class="text"><div class="text">Please indicate the fees you will charge along with your turn time for the following services:</div></td>
						</tr>
						<tr>

							<td colspan="3" class="data">Current O+E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Turn Time</u><div class="data">$<input class="form" type="text" size="10" maxlength="20" name="oe1"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form" type="text" size="10" maxlength="20" name="Pricetime1"/></div></td>

							<td colspan="3" class="data">Mortgage Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Turn Time</u><div class="data">$<input class="form" type="text" size="10" maxlength="20" name="mort"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form" type="text" size="10" maxlength="20" name="Pricetime2"/></div></td>
						</tr>
						<tr>

							<td colspan="3" class="data">O+E to 1 owner&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="data">$<input class="form" type="text" size="10" maxlength="20" name="a_cost"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form" type="text" size="10" maxlength="20" name="Pricetime3"/></div></td>

							<td colspan="3" class="data">Judgment Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="data">$<input class="form" type="text" size="10" maxlength="20" name="judg"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form" type="text" size="10" maxlength="20" name="Pricetime4"/></div></td>
						</tr>
						<tr>

							<td colspan="3" class="data">O+E to 2 owner&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="data">$<input class="form" type="text" size="10" maxlength="20" name="oe2"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form" type="text" size="10" maxlength="20" name="Pricetime5"/></div></td>

							<td colspan="3" class="data">Recording&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="data">$<input class="form" type="text" size="10" maxlength="20" name="rec"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form" type="text" size="10" maxlength="20" name="Pricetime6"/></div></td>
						</tr>
						<tr>
							<td colspan="3" class="data">Deed Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="data">$<input class="form" type="text" size="10" maxlength="20" name="deedonly"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form" type="text" size="10" maxlength="20" name="Pricetime7"/></div></td>

							<td colspan="3" class="data">Recording with title update&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="data">$<input class="form" type="text" size="10" maxlength="20" name="rec_update"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form" type="text" size="10" maxlength="20" name="Pricetime8"/></div></td>
						</tr>
						<!--- <tr>

							<td colspan="2" class="data"><div class="data">$<input class="form" type="text" size="10" maxlength="20" name="PriceRecording"/><input class="form" type="text" size="10" maxlength="20" name="PriceUpdate"/></div></td>

							<td colspan="2" class="data"><div class="data">$<input class="form" type="text" size="10" maxlength="20" name="PriceDeedReport"/><input class="form" type="text" size="10" maxlength="20" name="PriceUpdate"/></div></td>
						</tr>
						<tr>

							<td colspan="2" class="data"><div class="data">$<input class="form" type="text" size="10" maxlength="20" name="PriceMiniSearch"/><input class="form" type="text" size="10" maxlength="20" name="PriceUpdate"/></div></td>

							<td colspan="2" class="data"><div class="data">$<input class="form" type="text" size="10" maxlength="20" name="PriceMortgage"/><input class="form" type="text" size="10" maxlength="20" name="PriceUpdate"/></div></td>
						</tr> --->
						<tr>
							<td class="head3" align = "left" colspan="6"><div class="form_button">
								<input class="form" type="hidden" name="form" value="True"/>
								<input class="form" type="hidden" name="_form_refurl" value="/work/abstractor.html"/>
								<input class="form" type="hidden" name="_form_emailsubject" value="Abstractor application"/>
								<input class="form" type="hidden" name="_form_template" value="ABSTRACTORFORM_TEMPLATE"/>
								<input class="form" type="hidden" name="_form_emailto" value="jmiller@gac.com,smcnamara@gac.com"/>
								<input class="form" type="hidden" name="_form_action" value="email"/>
						** O & E - Ownership & Encumbrance Search&nbsp;&nbsp;&nbsp;<input class="button" type="submit" value="Submit Form"/>
							</div></td>
						</tr>
					</table>



			  </td>
        </tr>
       <!---  <tr>
          <td><p>
		  </p>
            <p>&nbsp;</p></td>
        </tr> --->
      </table>
			<!---- body text ends ----->
		</cfform>


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