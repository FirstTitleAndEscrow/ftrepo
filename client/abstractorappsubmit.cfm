<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="EOInsurance" DEFAULT="">
<CFPARAM NAME="ViaEmail2" DEFAULT="">
<CFPARAM NAME="ViaEmail" DEFAULT="">
<CFPARAM NAME="zip_id" DEFAULT="">
<CFPARAM NAME="fname" DEFAULT="">
<CFPARAM NAME="lname" DEFAULT="">
<CFPARAM NAME="company" DEFAULT="">
<CFPARAM NAME="addr1" DEFAULT="">
<CFPARAM NAME="addr2" DEFAULT="">
<CFPARAM NAME="zip" DEFAULT="">
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="zip2" DEFAULT="">
<CFPARAM NAME="oe1" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="oe2" DEFAULT="">
<CFPARAM NAME="deedonly" DEFAULT="">
<CFPARAM NAME="mort" DEFAULT="">
<CFPARAM NAME="judg" DEFAULT="">
<CFPARAM NAME="rec" DEFAULT="">
<CFPARAM NAME="pref_for_send" DEFAULT="">
<CFPARAM NAME="rec_update" DEFAULT="">
<CFPARAM NAME="zip2" DEFAULT="">
<CFPARAM NAME="state2" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="city2" DEFAULT="">
<CFPARAM NAME="email" DEFAULT="">
<CFPARAM NAME="phone" DEFAULT="">
<CFPARAM NAME="pager" DEFAULT="">
<CFPARAM NAME="cell" DEFAULT="">
<CFPARAM NAME="taxid" DEFAULT="">
<CFPARAM NAME="ssn" DEFAULT="">
<CFPARAM NAME="homephone" DEFAULT="">
<CFPARAM NAME="otherphone" DEFAULT="">
<CFPARAM NAME="RefPhone1" DEFAULT="">
<CFPARAM NAME="RefPhone2" DEFAULT="">
<CFPARAM NAME="fax" DEFAULT="">
<CFPARAM NAME="spref" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="pricetime1" DEFAULT="">
<CFPARAM NAME="pricetime2" DEFAULT="">
<CFPARAM NAME="pricetime3" DEFAULT="">
<CFPARAM NAME="pricetime4" DEFAULT="">
<CFPARAM NAME="pricetime5" DEFAULT="">
<CFPARAM NAME="pricetime6" DEFAULT="">
<CFPARAM NAME="pricetime7" DEFAULT="">
<CFPARAM NAME="pricetime8" DEFAULT="">
<cfoutput><cfif #PhonePrimary1# neq "" and #PhonePrimary2# neq "" and #PhonePrimary3# neq "">
<CFSET phone = '#PhonePrimary1##PhonePrimary2##PhonePrimary3##PhonePrimaryExt#'> </cfif>
<cfif #PhoneFax1# neq "" and #PhoneFax2# neq "" and #PhoneFax3# neq "">
<CFSET fax = '#PhoneFax1##PhoneFax2##PhoneFax3#'></cfif>
<cfif #Phonecell1# neq "" and #Phonecell2# neq "" and #Phonecell3# neq "">
<CFSET cell = '#Phonecell1# #Phonecell2# #Phonecell3#'> </cfif>
<cfif #Phoneother1# neq "" and #Phoneother2# neq "" and #Phoneother3# neq "">
<CFSET otherphone = '#Phoneother1# #Phoneother2# #Phoneother3#'> </cfif>
<cfif #Phonehome1# neq "" and #Phonehome2# neq "" and #Phonehome3# neq "">
<CFSET homephone = '#Phonehome1# #Phonehome2# #Phonehome3#'> </cfif>
<cfif #Phonepager1# neq "" and #Phonepager2# neq "" and #Phonepager3# neq "">
<CFSET pager = '#Phonepager1##Phonepager2##Phonepager3#'></cfif>
<cfif #SSN1# neq "" and #SSN2# neq "">
<CFSET SSN = '#SSN1##SSN2#'></cfif>
<cfif #FedTaxId1# neq "" and #FedTaxId2# neq "">
<CFSET TaxID = '#FedTaxId1##FedTaxId2#'></cfif>
<cfif #Ref1Phone1# neq "" and #Ref1Phone2# neq "" and #Ref1Phone3# neq "">
<CFSET RefPhone1 = '#Ref1Phone1##Ref1Phone1##Ref1Phone1# #Ref1PhoneExt#'> </cfif>
<cfif #Ref2Phone1# neq "" and #Ref2Phone2# neq "" and #Ref2Phone3# neq "">
<CFSET RefPhone2 = '#Ref2Phone1##Ref2Phone1##Ref2Phone1# #Ref2PhoneExt#'> </cfif>
</cfoutput>

<CFSET zip_id_2 = #ListToArray(zip_id, ",")#>
	<CFSET st_abbrv_1 = ArrayNew(1)>
	<CFSET cty_name_1 = ArrayNew(1)>

		<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

				<CFSET st_abbrv_1[MMM] = #st_temp[1]#>
				<CFSET cty_name_1[MMM] = #st_temp[2]#>


		</CFLOOP>



	<cfif #a_trigger# eq 1>
<CFMAIL
TO="abstractrecruit@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Abstractor form application"
TIMEOUT="600"
type = "HTML"
>



				  <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

  <tr>

    <td bgcolor="99FFCC" >

					<table cellspacing="1" cellpadding="2" class="forms" border="1" >
						<tr>
							<td class="head2" align = "center" colspan="6"><div class="head2"><b>TITLE CLOSING AGENT APPLICATION</b></div></td>
						</tr>
						             <TR>
                            <TD class=head3> <DIV class=head3>Name:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                                #company#

                              </DIV></TD>
                            <TD class=head3> <DIV class=head3>E-Mail:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                  #email#
                              </DIV></TD>
                          </TR>

                          <TR>
                            <TD class=head3> <DIV class=head3>Contact Name:</DIV></TD>
                            <TD class=data colSpan=5> <DIV class=data>
                                #fname#  #lname#
                              </DIV></TD>
                          </TR>
                          <TR>
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
							<td colspan="2" class="data"><div class="data">#City#</div></td>
							<td colspan="1" class="data"><div class="data">#State#</div></td>
							<td colspan="1" class="data"><div class="data">#Zip_Code#</div></td>
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
							<td colspan="2" class="data"><div class="data">#Addr2#</div></td>
							<td colspan="2" class="data"><div class="data">#City2#</div></td>
							<td colspan="1" class="data"><div class="data">#State2#</div></td>
							<td colspan="1" class="data"><div class="data">#Zip_Code2#</div></td>
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
							<td colspan="2" class="data"><div class="data">#PreviousAddress#</div></td>
							<td colspan="2" class="data"><div class="data">#PreviousCity#</div></td>
							<td colspan="1" class="data"><div class="data">#PreviousState#
				</div></td>
							<td colspan="1" class="data"><div class="data">#PreviousZipCode#</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">How Long? (if less than 2 years at current)</div></td>
							<td colspan="3" class="data"><div class="data">#AddressHowLong#</div></td>
						</tr>
						<tr>
							<td class="head2" colspan="6"><div class="head2">Telephone Numbers</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Office No:</div></td>
							<td colspan="2" class="data"><div class="data">
								#PhonePrimary1#-#PhonePrimary2#-#PhonePrimary3# #PhonePrimaryExt#
							</div></td>
							<td class="head3"><div class="head3">Home No:</div></td>
							<td colspan="2" class="data" ><div class="data">
								#PhoneHome1#-#PhoneHome2#-#PhoneHome3#
							</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Courthouse No:</div></td>
							<td colspan="2" class="data"><div class="data">
								#PhoneOther1#-#PhoneOther2#-#PhoneOther3#
							</div></td>
							<td class="head3"><div class="head3">Cell No:</div></td>
							<td colspan="2" class="data" ><div class="data">
								#PhoneCell1#-#PhoneCell2#-#PhoneCell3#
							</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Pager No:</div></td>
							<td colspan="2" class="data"><div class="data">
							#PhonePager1#-#PhonePager2#-#PhonePager3#
							</div></td>
							<td class="head3"><div class="head3">Fax No:</div></td>
							<td colspan="2" class="data" ><div class="data">
								#PhoneFax1#-#PhoneFax2#-#PhoneFax3#
							</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">Method by which you wish to receive your abstract report request</div></td>
							<td colspan="3" class="data"><div class="data2">#pref_for_send#</div></td>
						</tr>
						<tr>
							<td class="head2" colspan="6"><div class="head2">Qualifications</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">If your company is organized, what type?</div></td>
							<td colspan="3" class="data"><div class="data2">#PreviousState#
				</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3"><font color="red"></font>Fed Tax ID:</div></td>
							<td colspan="2" class="data"><div class="data">
								#FedTaxId1# #FedTaxId2#
							</div></td>
							<td class="head3"><div class="head3"><font color="red"></font>SSN:</div></td>
							<td colspan="2" class="data" ><div class="data">
								#SSN1# #SSN2# #SSN3#
							</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">Are you currently carrying Errors & Omissions insurance on your work?</div></td>
							<td colspan="3" class="data"><div class="data2">#EOInsurance#</div></td>
						</tr>
						<tr>
							<td colspan="3" class="head3"><div class="head3">If yes, with which Company:</div></td>
							<td colspan="3" class="data"><div class="data">#EOCompany#</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Amount of Coverage:</div></td>
							<td colspan="5" class="data"><div class="data">$#EOAmount#</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Expiration date:</div></td>
							<td colspan="5" class="data"><div class="data">#EOExpireDate#</div></td>
						</tr>

						<tr>
							<td class="head2" colspan="6"><div class="head2">Service Area</div></td>
						</tr>
						<tr>
							<td colspan="2" class="head3"><div class="head3">List all counties where you feel qualified to complete title searches.</div></td>
							<td colspan="4" class="data">	  <DIV class=data>

							<CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
		#st_abbrv_1[SSS]#--#cty_name_1[SSS]#,

		</CFLOOP>
                              </DIV></td>
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
							<td colspan="5" class="data"><div class="data">#RefCo1#</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Contact/Title</div></td>
							<td colspan="5" class="data"><div class="data">#RefContact1#</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Type of Business</div></td>
							<td colspan="5" class="data"><div class="data">#RefBusinessType1#</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Phone Number</div></td>
							<td colspan="5" class="data"><div class="data">
						 		#Ref1Phone1#-#Ref1Phone2#-#Ref1Phone3# ext-#Ref1PhoneExt#
							</div></td>
						</tr>
						<tr>
							<td class="head3" colspan="6"><div class="head4">Reference 2</div></td></tr>
						<tr>
							<td class="head3"><div class="head3">Company Name and Address</div></td>
							<td colspan="5" class="data"><div class="data">#RefCo2#</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Contact/Title</div></td>
							<td colspan="5" class="data"><div class="data">#RefContact2#</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Type of Business</div></td>
							<td colspan="5" class="data"><div class="data">#RefBusinessType2#</div></td>
						</tr>
						<tr>
							<td class="head3"><div class="head3">Phone Number</div></td>
							<td colspan="5" class="data"><div class="data">
						 		#Ref2Phone1#-#Ref2Phone2#-#Ref2Phone3# ext-#Ref2PhoneExt#
							</div></td>
						</tr>
						<tr>
							<td class="head2" colspan="6"><div class="head2">Fee Schedule/Turn Times</div></td>
						</tr>
						<tr>
							<td colspan="6" class="text"><div class="text">Please indicate the fees you will charge along with your turn time for the following services:</div></td>
						</tr>
						<tr>

							<td colspan="2" class="data">Current O+E/Turn time<div class="data">$#oe1#/ #Pricetime1#</div></td>

							<td colspan="2" class="data">Mortgage Search/Turn time <div class="data">$#mort#/ #Pricetime2#</div></td>
						</tr>
						<tr>

							<td colspan="2" class="data">O+E to 1 owner/Turn time<div class="data">$#a_cost#/ #Pricetime3#</div></td>

							<td colspan="2" class="data">Judgment Search/Turn time<div class="data">$#judg# /#Pricetime4#</div></td>
						</tr>
						<tr>

							<td colspan="2" class="data">O+E to 2 owner/Turn time<div class="data">$#oe2#/ #Pricetime5#</div></td>

							<td colspan="2" class="data">Recording/Turn time<div class="data">$#rec# /#Pricetime6#</div></td>
						</tr>
						<tr>
							<td colspan="2" class="data">Deed Search/Turn time<div class="data">$#deedonly# /#Pricetime7#</div></td>

							<td colspan="2" class="data">Recording with title update/Turn time<div class="data">$#rec_update#/ #Pricetime8#</div></td>
						</tr>

						<tr>
							<td class="head3" align = "left" colspan="6"><div class="form_button">

						** O & E - Ownership & Encumbrance Search
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
 	 <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
<tr>
		<td align=center valign=top bgcolor=yellow>
			<font size=3 color=RED face=arial><B>Click <NOBR><a href="https://#cgi.server_name#/admin_area/abstractors_add_submit.cfm?uid=59&al=1&company=#company#&fname=#fname#&lname=#lname#&phone=#phone#&fax=#fax#&email=#email#&SSN=#SSN#&TaxID=#TaxID#&homephone=#homephone#&otherphone=#otherphone#&refCo1=#refCo1#&refCo2=#refCo2#&refPhone2=#refPhone2#&refPhone1=#refPhone1#&eocompany=#eocompany#&eoamount=#eoamount#&eoexpiredate=#eoexpiredate#&addr1=#addr1#&addr2=#addr2#&state2=#state2#&zip_code2=#zip_code2#&city2=#city2#&cell=#cell#&pager=#pager#&a_note_1=#a_note_1#&city=#city#&state=#state#&zip_code=#zip_code#&a_cost=#a_cost#&a_comments=#a_comments#&zip_id=#zip_id#&spref=#spref#&a_cost=#a_cost#&oe1=#oe1#&oe2=#oe2#&deedonly=#deedonly#&mort=#mort#&judg=#judg#&rec=#rec#&rec_update=#rec_update#&pref_for_send=#pref_for_send#">HERE</a></NOBR>
to send to Database</B>
		</td>
	</tr>
</table>


</cfmail>
	<CFMAIL
TO="#email#"
FROM="abstractrecruit@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Abstractor form application"
TIMEOUT="600"
type = "HTML"
>

	 <tr>

    <td bgcolor="99FFCC" ><br>



<p> Thank you for submitting your application to <cfoutput>#session.site.short_name#</cfoutput>.  Your application will be processed as soon as practicable.
 Thank you for your interest in working with <cfoutput>#session.site.short_name#</cfoutput>.      <br>
<br>  <br>
<br><br>

           - Vendor Management <br>


</p>

			  </td>
        </tr>
	</cfmail>
</cfif>

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

<cfoutput>



   <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

  <tr>

    <td bgcolor="99FFCC" >

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
	  </cfoutput>

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