<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="Incorporated" DEFAULT="">
<CFPARAM NAME="Licensed" DEFAULT="">
<CFPARAM NAME="Certified" DEFAULT="">
<CFPARAM NAME="Approved" DEFAULT="">
<CFPARAM NAME="Suspended" DEFAULT="">
<CFPARAM NAME="EOInsuranceAppraiser" DEFAULT="">
<CFPARAM NAME="zip_id" DEFAULT="">
<CFPARAM NAME="AccessMLS" DEFAULT="">
<CFPARAM NAME="fname" DEFAULT="">
<CFPARAM NAME="lname" DEFAULT="">
<CFPARAM NAME="company" DEFAULT="">
<CFPARAM NAME="addr1" DEFAULT="">
<CFPARAM NAME="addr2" DEFAULT="">
<CFPARAM NAME="zip" DEFAULT="">
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="email" DEFAULT="">
<CFPARAM NAME="spref" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">
<cfoutput><cfif #PhonePrimary1# neq "" and #PhonePrimary2# neq "" and #PhonePrimary3# neq "">
<CFSET phone = '#PhonePrimary1# #PhonePrimary2# #PhonePrimary3# #PhonePrimaryExt#'> </cfif>
<cfif #PhoneFax1# neq "" and #PhoneFax2# neq "" and #PhoneFax3# neq "">
<CFSET fax = '#PhoneFax1##PhoneFax2##PhoneFax3#'></cfif>
</cfoutput>
<CFSET zip_id_2 = #ListToArray(zip_id, ",")#>
	<CFSET st_abbrv_1 = ArrayNew(1)>
	<CFSET cty_name_1 = ArrayNew(1)>

		<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

				<CFSET st_abbrv_1[MMM] = #st_temp[1]#>
				<CFSET cty_name_1[MMM] = #st_temp[2]#>


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

<!--- <link rel="stylesheet" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/style/style.css" type="text/css">  --->
	<title>Abstractor Application</title>
	<script type="text/javascript" src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/komodo_util.js"></script>

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
            <td align="right" valign="bottom"><input type="image" src="https://c/client/images/searchgo2.jpg" border=0 alt="Begin your Web search"></td>
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

<table cellpadding="0" cellspacing="0" border="0" width="780">

	<tr>
		<td bgcolor="#00FF66" valign="top" width="160"><br>
		<table cellpadding="1" cellspacing="1" border="0" width="160">
		<tr>
		<!--- <td width="174" nowrap><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/new/pictures/1blank.gif" width="174" height="8"></td></tr> --->
         <tr> <td width="189" ALIGN = "CENTER" bgcolor="#99FFCC"><font face="Arial, Helvetica, sans-serif" size="2"><b>BECOME A VENDOR</b></font></td></tr>

	  <tr> <td width="89" bgcolor="#008D00" nowrap onmouseover="this.bgColor='#99FFCC'" onmouseout="this.bgColor='#008D00'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/titlevendor.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/titlevendor.cfm"><nobr>Abstractor/Title Info</nobr></font></a></td></tr>

         <tr> <td width="89" bgcolor="#008D00" nowrap onmouseover="this.bgColor='#99FFCC'" onmouseout="this.bgColor='#008D00'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/attorneyagent.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/attorneyagent.cfm"><nobr>Attorney Closing Agent</nobr></font></a></td></tr>
			         <tr> <td width="89" bgcolor="#008D00" nowrap onmouseover="this.bgColor='#99FFCC'" onmouseout="this.bgColor='#008D00'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/titleagent.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/titleagent.cfm"><nobr>Title Closing Agent</nobr></font></a></td></tr>
			<tr> <td width="89" bgcolor="#008D00" nowrap onmouseover="this.bgColor='#99FFCC'" onmouseout="this.bgColor='#008D00'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/closeagent.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/closeagent.cfm"><nobr>Notary Closing Agent</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#008D00" nowrap onmouseover="this.bgColor='#99FFCC'" onmouseout="this.bgColor='#008D00'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/appraisalvendor.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/appraisalvendor.cfm"><nobr>Appraiser</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#008D00" nowrap onmouseover="this.bgColor='#99FFCC'" onmouseout="this.bgColor='#008D00'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/floodvendor.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/floodvendor.cfm"><nobr>Flood Vendor</nobr></font></a></td></tr>
			 <tr> <td width="89" bgcolor="#008D00" nowrap onmouseover="this.bgColor='#99FFCC'" onmouseout="this.bgColor='#008D00'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/creditvendor.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/creditvendor.cfm"><nobr>Credit Vendor</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#008D00" nowrap onmouseover="this.bgColor='#99FFCC'" onmouseout="this.bgColor='#008D00'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/avmvendor.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/avmvendor.cfm"><nobr>AVM Vendor</nobr></font></a></td></tr>



			 </table>

		</td>
		<td bgcolor="#99FFCC" valign="top">
			<!---- body text starts ----->

      <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

  <tr>

    <td bgcolor="#99FFCC" ><br>
<br><br>

<center>
<p> Thank you for submitting your application to <cfoutput>#session.site.long_name#</cfoutput>.  Your application will be processed as soon as practicable.
 Thank you for your interest in working with <cfoutput>#session.site.long_name#</cfoutput>.      <br>
<br>  <br>
<br><br>

           - Vendor Management <br>
<br>
<br>
<br>

</p></center>

			  </td>
        </tr>
       <!---  <tr>
          <td><p>
		  </p>
            <p>&nbsp;</p></td>
        </tr> --->

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
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>� 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> <cfoutput>#session.site.long_name#</cfoutput></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

	<cfif #a_trigger# eq 1>
	<CFMAIL
TO="#email#"
FROM="webmaster@firsttitleservices.com"
Subject="Appraiser form application"
TIMEOUT="600"
type = "HTML"
>

	 <tr>

    <td bgcolor="99FFCC" ><br>



<p> Thank you for submitting your application to <cfoutput>#session.site.long_name#</cfoutput>.  Your application will be processed as soon as practicable.
 Thank you for your interest in working with <cfoutput>#session.site.long_name#</cfoutput>.      <br>
<br>  <br>
<br><br>

           - Vendor Management <br>


</p>

			  </td>
        </tr>
	</cfmail>

<CFMAIL
TO="appraiserrecruit@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com"
Subject="Appraiser form application"
TIMEOUT="600"
type = "HTML"
>


      <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

  <tr>

    <td bgcolor="99FFCC" >

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
							<td colspan="1" class="data"><div class="data">#fname#</div></td>
							<td colspan="2" class="data"><div class="data">#lname#</div></td>
							<td colspan="3" class="data"><div class="data">#company#</div></td>

						</tr>

						<tr>
								<td class="head3"><div class="head3">E-Mail Address:</div></td>
							<td colspan="5" class="data"><div class="data">#email#</div></td>
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
							<td colspan="2" class="data"><div class="data">#addr1#</div></td>
							<td colspan="2" class="data"><div class="data">#city#</div></td>
							<td colspan="1" class="data"><div class="data">#state#</div></td>
							<td colspan="1" class="data"><div class="data">#zip#</div></td>
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
							<td colspan="2" class="data"><div class="data">#MailingAddress#</div></td>
							<td colspan="2" class="data"><div class="data">#MailingCity#</div></td>
							<td colspan="1" class="data"><div class="data">#MailingState#</div></td>
							<td colspan="1" class="data"><div class="data">#MailingZipCode#</div></td>
						</tr>
						  <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Telephone
                                Numbers</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Office No:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                                #PhonePrimary1# - #PhonePrimary2# - #PhonePrimary3# - #PhonePrimaryExt#
                            </DIV></TD>
                            <TD class=head3> <DIV class=head3>Home:</DIV></TD>
                            <TD class=data style="BORDER-RIGHT: 62725a 1px solid"
colSpan=2> <DIV class=data>
                               #PhoneHome1# - #PhoneHome2# - #PhoneHome3#


                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Pager No:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                             #PhonePager1#
                                -
                               #PhonePager2#
                                -
                               #PhonePager3#
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3>Cell:</DIV></TD>
                            <TD class=data style="BORDER-RIGHT: 62725a 1px solid"
colSpan=2> <DIV class=data>
                               #PhoneCell1#
                                -
                               #PhoneCell2#
                                -
                               #PhoneCell3#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Fax No:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                               #PhoneFax1#
                                -
                              #PhoneFax2#
                                -
                               #PhoneFax3#
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3>Other:</DIV></TD>
                            <TD class=data style="BORDER-RIGHT: 62725a 1px solid"
colSpan=2> <DIV class=data>
                                #PhoneOther1#
                                -
                               #PhoneOther2#
                                -
                               #PhoneOther3#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Qualifications</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                incorporated?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                #Incorporated#
                               </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                licensed?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                       #Licensed#</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                certified?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                             #Certified#</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                a HUD approved appraiser?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                           #Approved#</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3><FONT color=red></FONT>Fed
                                Tax ID:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                               #FedTaxId1#
                               #FedTaxId2#
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3><FONT color=red></FONT>SSN:</DIV></TD>
                            <TD class=data style="BORDER-RIGHT: 62725a 1px solid"
colSpan=2> <DIV class=data>
                               #SSN1#
                               #SSN2#
                               #SSN3#
                              </DIV></TD>
                          </TR>
                   <TR>
                            <TD colspan = 2> License/Certification
                                Number:
                              #LicenseCertification#
                              </TD>
                            <TD colspan = 4>Expiration: (MM/DD/YY)
                               #ExpirationDate#
                              </TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Type of License:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                               #TypeOfLicense#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Have
                                you ever had any Real Estate License suspended,restricted
                                or revoked OR have you ever been convicted of
                                a felony or any public offense having as one of
                                its elements a fraudulent or dishonest act?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                              #Suspended#
                               </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>If yes, please furnish
                                details:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                             #furnishDetailofSuspended#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Are you
                                currently carrying Errors and Omissions insurance
                                on your work?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                         #EOInsuranceAppraiser#
						       </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>If yes, with which
                                Company:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                               #EOCompany#
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3>Policy Limit:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>$
                                #EOPolicyLimit#
                              </DIV></TD>
                          </TR>
                      <TR>
                            <TD colspan = 2> Policy Number:
                               #EOPolicyNo#
                              </TD>
                            <TD colspan = 4> Expiration: (MM/DD/YY)
                           #PolicyExpirationDate#
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

                            <TD class=data colSpan=6>

							  <DIV class=data>  	<CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
		#st_abbrv_1[SSS]#--#cty_name_1[SSS]#,

		</CFLOOP>
                              </DIV>      </TD>
                          </TR>

						  <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Is there
                                any section of your service area that does not
                                have access to MLS?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                           #AccessMLS#</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>If so, what areas?:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                              #MLSarea#
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
                               #PriorMoYrFrom1#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year To:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                             #PriorMoYrTo1#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Name and Address
                                of Employer</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                #PriorNameAddressFrom1#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>% of Time Devoted
                                to Appraising</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                #PriorDevotedtoAppraisingFrom1#
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
                              #PriorMoYrFrom2#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year To:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                             #PriorMoYrTo2#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Name and Address
                                of Employer</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                #PriorNameAddressFrom2#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>% of Time Devoted
                                to Appraising</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                        #PriorDevotedtoAppraisingFrom2#
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
                               #PriorMoYrFrom3#                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Month/Year To:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                             #PriorMoYrTo3#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Name and Address
                                of Employer</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                               #PriorNameAddressFrom3#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>% of Time Devoted
                                to Appraising</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                             #PriorDevotedtoAppraisingFrom3#                              </DIV></TD>
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
                       #RefCompanyName1#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Contact/Title</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                       #RefContact1#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Type of Business</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                       #RefBusinessType1#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Phone Number</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                #Ref1Phone1#
                                -
                               #Ref1Phone2#
                                -
                             #Ref1Phone3#
                                ext-
                               #Ref1PhoneExt#
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
                      #RefCompanyName2#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Contact/Title</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                      #RefContact2#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Type of Business</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                      #RefBusinessType2#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Phone Number</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                             #Ref2Phone1#
                                -
                              #Ref2Phone2#
                                -
                                #Ref2Phone3#
                                ext-
                              #Ref2PhoneExt#
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
                     #RefCompanyName3#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Contact/Title</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                      #RefContact3#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Type of Business</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                      #RefBusinessType3#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Phone Number</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                              #Ref3Phone1#
                                -
                               #Ref3Phone2#
                                -
                              #Ref3Phone3#
                                ext-
                               #Ref3PhoneExt#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Software</DIV></TD>
                          </TR>
                        <TR>
                            <TD class=head3 colSpan=2> <DIV class=head3>
							Type of appraisal software</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                               #AppraiserSoftware#

                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>If other,
                                please describe</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                       #AppOtherSoftware#
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
                     #Form1004#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>2055 Exterior Form:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                      #ExteriorForm2055#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>2055 Interior Form:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                       #InteriorForm2055#
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
                   #Form704#
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
                      #ReFinalInspection#
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
                      #Recertification#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Final
                                Inspection:</B> (Form 442)</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Form 442:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                    #Form442#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=text colSpan=6> <DIV class=text><B>Field
                                Review:</B> (FNMA 2000) #session.site.short_name# uses field reviews
                                primarily for quality control purposes. The appraiser
                                will receive as much of the original appraisal
                                as we have available.</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>FNMA 2000:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                   #FNMA2000#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Multi Family: (1025
                                Form):</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                     #FormMulti1025#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>FHA/HUD Appraisal
                                URAR: (1004 Form):</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>$
                      #FormFHAAppraisal1004#
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
                    #FNMA2006#
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
                     #AmountDeducted#
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
                                your E &amp; O insurance. Please Fax to: 309-413-0434</b></DIV></TD>
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

	  </table>

	 <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
<tr>
		<td align=center valign=top bgcolor=yellow>
			<font size=3 color=RED face=arial><B>Click <NOBR><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/Appraisers_add_submit.cfm?uid=59&al=1&company=#company#&fname=#fname#&lname=#lname#&phone=#phone#&fax=#fax#&email=#email#&addr1=#addr1#&addr2=#addr2#&a_note_1=#a_note_1#&city=#city#&state=#state#&zip=#zip#&a_cost=#a_cost#&a_comments=#a_comments#&zip_id=#zip_id#&spref=#spref#">HERE</a></NOBR>
to send to Database</B>
		</td>
	</tr>
</table>

</cfmail>
</cfif>
