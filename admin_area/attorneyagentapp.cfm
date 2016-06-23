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
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/company.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('COMPANY','','images/nav_company_on.jpg',1);" ><img name="COMPANY" src="images/nav_company_off.jpg" border="0" alt="COMPANY"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/services.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('PRODUCTS','','images/nav_products_on.jpg',1);" ><img name="PRODUCTS" src="images/nav_products_off.jpg" alt="PRODUCTS" border="0"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/vendor.cfm"><img src="images/nav_vendors.jpg" border="0" alt="VENDORS"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/employment.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CAREERS','','images/nav_careers_on.jpg',1);" ><img name="CAREERS" src="images/nav_careers_off.jpg" alt="CAREERS" border="0"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/contact.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CONTACT','','images/nav_contact_on.jpg',1);" ><img name="CONTACT" src="images/nav_contact_off.jpg" alt="CONTACT US" border="0"></a></td>
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
		<CFFORM NAME="frm"  ACTION="https://#cgi.server_name#/client/attorneyagentappsubmit.cfm?a_trigger=1" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>

      <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

  <tr>

    <td bgcolor="#99FFCC" >

					<table cellspacing="1" cellpadding="2" class="forms" border="1" >
						<tr>
							<td class="head2" align = "center" colspan="6"><div class="head2"><b>ATTORNEY CLOSING AGENT APPLICATION</b></div></td>
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
									 >  Last name <cfINPUT TYPE="Text" NAME="lname" SIZE=41 MAXLENGTH=15
									REQUIRED="yes" Message="You must enter your last name"
									 >
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=6> <DIV class=head3>Physical Address:</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=2> <DIV class=head3>Street
                                Address:</DIV></TD>
                            <TD class=head3 colSpan=2> <DIV class=head3>City:</DIV></TD>
                            <TD class=head3> <DIV class=head3>State:</DIV></TD>
                            <TD class=head3> <DIV class=head3>ZipCode:</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=data colSpan=2> <DIV class=data>
                                <INPUT class=form size=30
                name=addr1>
                              </DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                                <INPUT class=form size=30 name=City>
                              </DIV></TD>
                            <TD class=data> <DIV class=data>
                                <SELECT onchange=null name=State>
                                  <OPTION
                    value="" selected></OPTION>
                                  <OPTION value=AK>AK</OPTION>
                                  <OPTION value=AL>AL</OPTION>
                                  <OPTION value=AR>AR</OPTION>
                                  <OPTION value=AZ>AZ</OPTION>
                                  <OPTION value=CA>CA</OPTION>
                                  <OPTION value=CO>CO</OPTION>
                                  <OPTION value=CT>CT</OPTION>
                                  <OPTION value=DC>DC</OPTION>
                                  <OPTION value=DE>DE</OPTION>
                                  <OPTION value=FL>FL</OPTION>
                                  <OPTION value=GA>GA</OPTION>
                                  <OPTION value=GU>GU</OPTION>
                                  <OPTION value=HI>HI</OPTION>
                                  <OPTION value=IA>IA</OPTION>
                                  <OPTION value=ID>ID</OPTION>
                                  <OPTION value=IL>IL</OPTION>
                                  <OPTION value=IN>IN</OPTION>
                                  <OPTION value=KS>KS</OPTION>
                                  <OPTION value=KY>KY</OPTION>
                                  <OPTION value=LA>LA</OPTION>
                                  <OPTION value=MA>MA</OPTION>
                                  <OPTION value=MD>MD</OPTION>
                                  <OPTION value=ME>ME</OPTION>
                                  <OPTION value=MI>MI</OPTION>
                                  <OPTION value=MN>MN</OPTION>
                                  <OPTION value=MO>MO</OPTION>
                                  <OPTION value=MS>MS</OPTION>
                                  <OPTION value=MT>MT</OPTION>
                                  <OPTION value=NC>NC</OPTION>
                                  <OPTION value=ND>ND</OPTION>
                                  <OPTION value=NE>NE</OPTION>
                                  <OPTION value=NH>NH</OPTION>
                                  <OPTION value=NJ>NJ</OPTION>
                                  <OPTION value=NM>NM</OPTION>
                                  <OPTION value=NV>NV</OPTION>
                                  <OPTION value=NY>NY</OPTION>
                                  <OPTION value=OH>OH</OPTION>
                                  <OPTION value=OK>OK</OPTION>
                                  <OPTION value=OR>OR</OPTION>
                                  <OPTION value=PA>PA</OPTION>
                                  <OPTION value=PR>PR</OPTION>
                                  <OPTION value=RI>RI</OPTION>
                                  <OPTION value=SC>SC</OPTION>
                                  <OPTION value=SD>SD</OPTION>
                                  <OPTION value=TN>TN</OPTION>
                                  <OPTION value=TX>TX</OPTION>
                                  <OPTION value=UT>UT</OPTION>
                                  <OPTION value=VA>VA</OPTION>
                                  <OPTION value=VI>VI</OPTION>
                                  <OPTION value=VT>VT</OPTION>
                                  <OPTION value=WA>WA</OPTION>
                                  <OPTION value=WI>WI</OPTION>
                                  <OPTION value=WV>WV</OPTION>
                                  <OPTION value=WY>WY</OPTION>
                                </SELECT>
                              </DIV></TD>
                            <TD class=data> <DIV class=data>
                                <INPUT class=form maxLength=5 size=5
                  name=Zip_Code>
                              </DIV></TD>
                          </TR>
						    <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Telephone
                                Numbers</DIV></TD>
                          </TR>
                          <TR>
                            <TD colspan = 3 class=head3> <DIV class=head3>Office No:</DIV>
                            <DIV class=data>
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
                            <TD colspan = 4 class=head3> <DIV class=head3>Home No:</DIV><DIV class=data>
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
                            <TD colspan = 3 class=head3> <DIV class=head3>Pager No:</DIV><DIV class=data>
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
                            <TD colspan = 4 class=head3> <DIV class=head3>Cell No:</DIV><DIV class=data>
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
                            <TD colspan = 3 class=head3> <DIV class=head3>Fax No:</DIV> <DIV class=data>
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
                            <TD colspan = 4 class=head3> <DIV class=head3>Other No:</DIV><DIV class=data>
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
                            <TD class=head3 colSpan=3> <DIV class=head3>Method by which you wish to receive your abstract report request</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                            <div class="data2"><input class="form" type="radio" name="spref" value="Email"/ checked>Email&nbsp;<input class="form" type="radio" name="spref" value="Fax"/>Fax</div></TD>
                          </TR>
						  <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Do you have internet access if document download is required?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=InternetAccess>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=InternetAccess>
                                No</DIV></TD>
                          </TR>
						    <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Can you
                                accept a loan package via email?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=ViaEmail2>
                                Yes&nbsp;
                                <INPUT class=form type=radio value=No
                  name=ViaEmail2>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Qualifications</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3><FONT color=red></FONT>Fed
                                Tax ID:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                                <INPUT class=form
                  onkeydown="TabNext(this,'down',2)"
                  onkeyup="TabNext(this,'up',2,this.form.FedTaxId2)" maxLength=2
                  size=2 name=FedTaxId1>
                                <INPUT class=form maxLength=7 size=7
                  name=FedTaxId2>
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3><FONT color=red></FONT>SSN:</DIV></TD>
                            <TD class=data style="BORDER-RIGHT: #62725a 1px solid"
colSpan=2> <DIV class=data>
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
                            <TD class=head3 colSpan=4> <DIV class=head3>Are you
                                currently carrying Errors &amp; Omissions insurance
                                on your work?</DIV></TD>
                            <TD class=data style="BORDER-RIGHT: #62725a 1px solid"
colSpan=2> <DIV class=data2>
                                <INPUT class=form type=radio value=Yes
                  name=EOInsurance>
                                Yes&nbsp;
                                <INPUT class=form type=radio
                  value=No name=EOInsurance>
                                No</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>If yes,
                                with which Company:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
                                <INPUT class=form maxLength=50
                  name=EOCompany>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Amount
                                of Coverage:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>$
                                <INPUT class=form maxLength=20
                  name=EOAmount>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Expiration
                                date:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
                                <INPUT class=form maxLength=20
                  name=EOExpireDate>
                              </DIV></TD>
                          </TR>
                          <!--- <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Service
                                Areas</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Primary County:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                                <INPUT class=form maxLength=20
                  name=PrimaryCounty>
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3>Primary State:</DIV></TD>
                            <TD class=data style="BORDER-RIGHT: #62725a 1px solid"
colSpan=2> <DIV class=data>
                                <INPUT class=form maxLength=20
                  name=PrimaryState>
                              </DIV></TD>
                          </TR> --->
                          <TR>
                            <TD class=head3 vAlign=top colSpan=3> <DIV class=head3>List
                                all counties where you feel qualified to perform witness closings, including those
                                in which you are able to travel to. (Hold CTRL key to select multiple counties.)</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
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
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Fee Schedule</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text>Please indicate
                                what fees you will charge First Title
                                for the following services:</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Witness Only Fee:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>$
                               <cfINPUT TYPE="Text" NAME="a_cost" SIZE=11 MAXLENGTH=15
									REQUIRED="yes" Message="You must enter your a fee"
									 >
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3>Cancellation Fee:</DIV></TD>
                            <TD class=data style="BORDER-RIGHT: #62725a 1px solid"
colSpan=2> <DIV class=data><NOBR>$
                                <INPUT class=form maxLength=20 size=19
                  name=CancellationFee>
                                </NOBR></DIV></TD>
                          </TR>

                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Additional
                                Fee Information:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
                                <TEXTAREA name=additionalFee rows=1 cols=32></TEXTAREA>
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 align = "center" colSpan=6> <DIV class=form_button>
                                <INPUT class=form type=hidden
                  value=True name=form>
                                <INPUT class=form type=hidden
                  value=/work/closingvendor.html name=_form_refurl>
                                <INPUT
                  class=form type=hidden value="Closing Vendor application"
                  name=_form_emailsubject>
                                <INPUT class=form type=hidden
                  value=CLOSINGVENDORFORM_TEMPLATE name=_form_template>
                                <INPUT
                  class=form type=hidden value=jmiller@gac.com,oschmidt@gac.com
                  name=_form_emailto>
                                <INPUT class=form type=hidden value=email
                  name=_form_action>
                                <INPUT class=button type=submit value="Submit Form">
                              </DIV></TD>
                          </TR>
                        </TBODY>
                      </TABLE></TD>




			  </td>
        </tr>
       <!---  <tr>
          <td><p>
		  </p>
            <p>&nbsp;</p></td>
        </tr> --->
      </table>
			</cfform>
			<!---- body text ends ----->
		</td>
	</tr>
	<tr>
		<td bgcolor="008D00">&nbsp;</td>
		<td bgcolor="000000">
			<table cellpadding="0" cellspacing="0" border="0" width="98%" align="center">
				<tr>
					<td width="47%"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b><a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/main.cfm">Home<a> | <a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/termuse.cfm">Terms of Use<a>  | <a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/policy.cfm">Privacy Policy<a></b></font></td>
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>� 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> First Title & Escrow Inc.</b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>