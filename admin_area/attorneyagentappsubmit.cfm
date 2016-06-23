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
<CFPARAM NAME="email" DEFAULT="">
<CFPARAM NAME="phone" DEFAULT="">
<CFPARAM NAME="fax" DEFAULT="">
<CFPARAM NAME="spref" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">
<cfoutput><cfif #PhonePrimary1# neq "" and #PhonePrimary2# neq "" and #PhonePrimary3# neq "">
<CFSET phone = '#PhonePrimary1##PhonePrimary2##PhonePrimary3# #PhonePrimaryExt#'> </cfif>
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
TO="closerrecruit@firsttitleservices.com"
FROM="closerrecruit@firsttitleservices.com" Subject="Attorney Agent form application"
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
                    #Addr1#
                              </DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                                #City#
                              </DIV></TD>
                            <TD class=data> <DIV class=data>
                               #State#
                              </DIV></TD>
                            <TD class=data> <DIV class=data>
                               #Zip_Code#
                              </DIV></TD>
                          </TR>
						    <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Telephone
                                Numbers</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Office No:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                              #PhonePrimary1#
                                -
                               #PhonePrimary2#
                                -
                               #PhonePrimary3#
                                #PhonePrimaryExt#
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3>Home No:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                              #PhoneHome1#
                                -
                               #PhoneHome2#
                                -
                               #PhoneHome3#
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
                            <TD class=head3> <DIV class=head3>Cell No:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
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
                            <TD class=head3> <DIV class=head3>Other No:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                               #PhoneOther1#
                                -
                               #PhoneOther2#
                                -
                               #PhoneOther3#
                              </DIV></TD>
                          </TR>
                          <tr>
							<td colspan="3" class="head3"><div class="head3">Method by which you wish to receive your abstract report request</div></td>
							<td colspan="3" class="data"><div class="data2">#spref#</div></td>
						</tr>
						  <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Do you intent access if document download is required?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                                #ViaEmail#
                                      </DIV></TD>
                          </TR>
						    <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Can you
                                accept a loan package via email?</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data2>
                              #ViaEmail2#
                             </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Qualifications</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3><FONT color=red></FONT>Fed
                                Tax ID:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                              #FedTaxId1#
                                #FedTaxId2#
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3><FONT color=red></FONT>SSN:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                              #SSN1#
                               #SSN2#
                               #SSN3#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=4> <DIV class=head3>Are you
                                currently carrying Errors &amp; Omissions insurance
                                on your work?</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data2>
                             #EOInsurance#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>If yes,
                                with which Company:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
                               #EOCompany#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Amount
                                of Coverage:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>$
                              #EOAmount#
                              </DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Expiration
                                date:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
                              #EOExpireDate#
                              </DIV></TD>
                          </TR>
                        <!---   <TR>
                            <TD class=head2 colSpan=6> <DIV class=head2>Service
                                Areas</DIV></TD>
                          </TR>
                          <TR>
                            <TD class=head3> <DIV class=head3>Primary County:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                              #PrimaryCounty#
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3>Primary State:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data>
                               #PrimaryState#
                              </DIV></TD>
                          </TR> --->
                          <TR>
                            <TD class=head3 vAlign=top colSpan=3> <DIV class=head3>List
                                all counties where you feel qualified to complete
                                work. You could also travel to close loans</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
                              <CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
		#st_abbrv_1[SSS]#--#cty_name_1[SSS]#,

		</CFLOOP>
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
                               #a_cost#
                              </DIV></TD>
                            <TD class=head3> <DIV class=head3>Cancellation Fee:</DIV></TD>
                            <TD class=data colSpan=2> <DIV class=data><NOBR>$
                               #CancellationFee#
                                </NOBR></DIV></TD>
                          </TR>

                          <TR>
                            <TD class=head3 colSpan=3> <DIV class=head3>Additional
                                Fee Information:</DIV></TD>
                            <TD class=data colSpan=3> <DIV class=data>
                                #additionalFee#
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
	  	 <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
<tr>
		<td align=center valign=top bgcolor=yellow>
			<font size=3 color=RED face=arial><B>Click <NOBR><a href="https://#cgi.server_name#/admin_area/closer_add_submit.cfm?uid=59&al=1&company=#company#&fname=#fname#&lname=#lname#&phone=#phone#&fax=#fax#&email=#email#&SSN=#SSN#&TaxID=#TaxID#&homephone=#homephone#&internetAccess=#InternetAccess#&otherphone=#otherphone#&eocompany=#eocompany#&eoamount=#eoamount#&eoexpiredate=#eoexpiredate#&addr1=#addr1#&addr2=#addr2#&cell=#cell#&pager=#pager#&a_note_1=#a_note_1#&city=#city#&state=#state#&zip=#zip#&a_cost=#a_cost#&a_comments=#a_comments#&zip_id=#zip_id#&spref=#spref#">HERE</a></NOBR>
to send to Database</B>
		</td>
	</tr>
</table>


</cfmail>
	<CFMAIL
TO="#email#"
FROM="webmaster@firsttitleservices.com" Subject="Attorney Agent form application"
TIMEOUT="600"
type = "HTML"
>

	 <tr>

    <td bgcolor="99FFCC" ><br>



<p> Thank you for submitting your application to First Title Services.  Your application will be processed as soon as possible.
 Thank you for your interest in working with First Title Services.      <br>
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
		<td bgcolor="99FFCC" valign="top">
			<!---- body text starts ----->

<cfoutput>



   <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

  <tr>

    <td bgcolor="99FFCC" >

		<br><br>

<center>
<p> Thank you for submitting your application to First Title Services.  Your application will be processed as soon as possible.
 Thank you for your interest in working with First Title Services.      <br>
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
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>© 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> First Title & Escrow Inc.</b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>