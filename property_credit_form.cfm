
<CFPARAM NAME="loan_number" DEFAULT="0">
<CFPARAM NAME="blastname1" DEFAULT="">
<CFPARAM NAME="bfirstname1" DEFAULT="">
<CFPARAM NAME="bminame1" DEFAULT="">
<CFPARAM NAME="bssn1" DEFAULT="">
<CFPARAM NAME="bhphone1" DEFAULT="">
<CFPARAM NAME="bwphone1" DEFAULT="">
<CFPARAM NAME="bext1" DEFAULT="">
<CFPARAM NAME="blastname2" DEFAULT="">
<CFPARAM NAME="bfirstname2" DEFAULT="">
<CFPARAM NAME="hud" DEFAULT="">
<CFPARAM NAME="loanamt_float" DEFAULT="">
<CFPARAM NAME="bminame2" DEFAULT="">
<CFPARAM NAME="bssn2" DEFAULT="">
<CFPARAM NAME="bhphone2" DEFAULT="">
<CFPARAM NAME="bwphone2" DEFAULT="">
<CFPARAM NAME="bext2" DEFAULT="">
<CFPARAM NAME="slastname1" DEFAULT="">
<CFPARAM NAME="sfirstname1" DEFAULT="">
<CFPARAM NAME="sminame1" DEFAULT="">
<CFPARAM NAME="sssn1" DEFAULT="">
<CFPARAM NAME="shphone1" DEFAULT="">
<CFPARAM NAME="swphone1" DEFAULT="">
<CFPARAM NAME="sext1" DEFAULT="">
<CFPARAM NAME="slastname2" DEFAULT="">
<CFPARAM NAME="sfirstname2" DEFAULT="">
<CFPARAM NAME="sminame2" DEFAULT="">
<CFPARAM NAME="sssn2" DEFAULT="">
<CFPARAM NAME="shphone2" DEFAULT="">
<CFPARAM NAME="swphone2" DEFAULT="">
<CFPARAM NAME="sext2" DEFAULT="">
<CFPARAM NAME="paddress" DEFAULT="">
<CFPARAM NAME="pcity" DEFAULT="">
<CFPARAM NAME="pstate" DEFAULT="">
<CFPARAM NAME="pzip" DEFAULT="">
<CFPARAM NAME="pcounty" DEFAULT="">
<CFPARAM NAME="plegaldesc" DEFAULT="">
<CFPARAM NAME="prop_use_type" DEFAULT="">
<CFPARAM NAME="condo_pud" DEFAULT="">
<CFPARAM NAME="a_comment" DEFAULT="">
<CFPARAM NAME="polender1" DEFAULT="">
<CFPARAM NAME="poacctno1" DEFAULT="">
<CFPARAM NAME="pophone1" DEFAULT="">
<CFPARAM NAME="polender2" DEFAULT="">
<CFPARAM NAME="poacctno2" DEFAULT="">
<CFPARAM NAME="pophone2" DEFAULT="">
<CFPARAM NAME="Verifyemail" DEFAULT="">
<CFPARAM NAME="Verifyemail_2" DEFAULT="">
<CFPARAM NAME="Verifyemail_3" DEFAULT="">
<CFPARAM NAME="RptbyEmail" DEFAULT="">
<CFPARAM NAME="do_appraisal" DEFAULT="">
<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="0">
<CFPARAM NAME="payment_type_1" DEFAULT="">
<CFPARAM NAME="partial_cod" DEFAULT="0">
<CFPARAM NAME="pay_by" DEFAULT="">
<CFPARAM NAME="app_credit_card" DEFAULT="">
<CFPARAM NAME="app_cc_num" DEFAULT="">
<CFPARAM NAME="app_cc_exp_month" DEFAULT="">
<CFPARAM NAME="app_cc_exp_year" DEFAULT="">
<CFPARAM NAME="app_cc_name" DEFAULT="">
<CFPARAM NAME="app_ck_acct_name" DEFAULT="">
<CFPARAM NAME="app_ck_addr1" DEFAULT="">
<CFPARAM NAME="app_ck_addr2" DEFAULT="">
<CFPARAM NAME="app_ck_city" DEFAULT="">
<CFPARAM NAME="app_ck_state" DEFAULT="">
<CFPARAM NAME="app_ck_acct_no" DEFAULT="">
<CFPARAM NAME="app_ck_bank" DEFAULT="">
<CFPARAM NAME="app_ck_route_no" DEFAULT="">
<CFPARAM NAME="SearchType" DEFAULT="">
<CFPARAM NAME="Deedtransfer" DEFAULT="">
<CFPARAM NAME="Insured" DEFAULT="">
<CFPARAM NAME="otherpro" DEFAULT="">
<CFPARAM NAME="loan_type_111" DEFAULT="">
<CFPARAM NAME="loan_program_333" DEFAULT="">
<CFPARAM NAME="Verifyemail" DEFAULT="">
<CFPARAM NAME="Verifyemail_2" DEFAULT="">
<CFPARAM NAME="Verifyemail_3" DEFAULT="">
<CFPARAM NAME="fax_no" DEFAULT="">
<CFPARAM NAME="RptbyEmail" DEFAULT="">
<CFPARAM NAME="request_icl" DEFAULT="">
<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="">



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>


		<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
<title>1st Title & Escrow, Inc. - Title Request Form</title>
</head>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
	<tr><td align="right" valign="center">
  <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
&nbsp;&nbsp;</td>
  <td align="right" valign="center"><input type="text" name="number" size=10></td>
  <td align="right" valign="center">&nbsp;<input type="image" src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
  							</tr><tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr></table>
 </cfFORM>
</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>


</td></tr></tbody></table>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>
<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
		<center>
		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#comp_id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#comp_id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#comp_id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#comp_id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
        <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=#comp_id#';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=#comp_id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#comp_id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#comp_id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>
				<p>
				<img src="./images/property_title.gif">



<center>

				<CFFORM NAME="frm" ACTION="https://www.firsttitleservices.com/property_credit.cfm?comp_id=#comp_id#&estimate_value=#estimate_value#&appraisal_type=#appraisal_type#&loan_number=#loan_number#&prop_id=#prop_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&blastname1=#blastname1#&bfirstname1=#bfirstname1#&bminame1=#bminame1#&bssn1=#bssn1#&bhphone1=#bhphone1#&bwphone1=#bwphone1#&bext1=#bext1#&blastname2=#blastname2#&bfirstname2=#bfirstname2#&bminame2=#bminame2#&bssn2=#bssn2#&bhphone2=#bhphone2#&bwphone2=#bwphone2#&bext2=#bext2#&slastname1=#slastname1#&sfirstname1=#sfirstname1#&sminame1=#sminame1#&sssn1=#sssn1#&shphone1=#shphone1#&swphone1=#swphone1#&sext1=#sext1#&slastname2=#slastname2#&sfirstname2=#sfirstname2#&sminame2=#sminame2#&sssn2=#sssn2#&shphone2=#shphone2#&swphone2=#swphone2#&sext2=#sext2#&paddress=#paddress#&pcity=#pcity#&pstate=#pstate#&pzip=#pzip#&pcounty=#pcounty#&plegaldesc=#plegaldesc#&prop_use_type=#prop_use_type#&condo_pud=#condo_pud#&a_comment=#a_comment#&Verifyemail=#Verifyemail#&Verifyemail_2=#Verifyemail_2#&Verifyemail_3=#Verifyemail_3#&fax_no=#fax_no#&RptbyEmail=#RptbyEmail#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&pay_by=#pay_by#&trigger_a=1" ENCTYPE="multipart/form-data" METHOD=POST>


				   <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CREDIT CARD INFORMATION</B></CENTER>
			</TD>

</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>




					<TR>
						<TD width=250 bgcolor="f1f1f1" align="right">


										<FONT FACE=verdana SIZE=1 color="gray" >Credit Card
									</td>
									<td bgcolor="f1f1f1" width=250 align=left valign=top>
											<SELECT NAME="app_credit_card"
												size="1"
												style="font-size: 9;
												font-family: verdana;
												font-style: normal;
												color: 003F1E;
												background-color: E4E3E3;
												border-color: white;
												border-left-width: thin;
												border-right-width: thin;
												border-top-width: thin;
												border-bottom-width: thin;
												border-width: thin;
												border-style: bar;
												clear: none;
												float: none;"
												rows="3"
												cols="45"
												>
											<OPTION VALUE="MasterCard" SELECTED>MasterCard</OPTION>
											<OPTION VALUE="VISA">VISA</OPTION>
											<OPTION VALUE="DISCOVER">DISCOVER</OPTION>
										</SELECT>
									</td>
								</tr>

								<tr>
									<TD width=250 bgcolor="f1f1f1" align="right">


										<FONT FACE=verdana SIZE=1 color="gray" >Card No.
									</td>
									<td bgcolor="f1f1f1" width=250 align=left valign=top>
										<input type="text" name="app_cc_num" value="" size=25 maxlength=19
													style="font-size: 9;
													font-family: verdana;
													font-style: normal;
													color: 003F1E;
													background-color: E4E3E3;
													border-color: white;
													border-left-width: thin;
													border-right-width: thin;
													border-top-width: thin;
													border-bottom-width: thin;
													border-width: thin;
													border-style: bar;
												clear: none;" >
									</td>
								</tr>


								<tr>
									<TD width=250 bgcolor="f1f1f1" align="right">


										<FONT FACE=verdana SIZE=1 color="gray" >Card Exp Month
									</td>
									<td bgcolor="f1f1f1" width=250 align=left valign=top>

									<SELECT NAME="app_cc_exp_month"
										size="1"
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: 003F1E;
										background-color: E4E3E3;
										border-color: white;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;
										float: none;"
										rows="3"
										cols="45"
										>
										<OPTION VALUE="1" SELECTED> 1</OPTION>
										<OPTION VALUE="2"> 2</OPTION>
										<OPTION VALUE="3"> 3</OPTION>
										<OPTION VALUE="4"> 4</OPTION>
										<OPTION VALUE="5"> 5</OPTION>
										<OPTION VALUE="6"> 6</OPTION>
										<OPTION VALUE="7"> 7</OPTION>
										<OPTION VALUE="8"> 8</OPTION>
										<OPTION VALUE="9"> 9</OPTION>
										<OPTION VALUE="10">10</OPTION>
										<OPTION VALUE="11">11</OPTION>
										<OPTION VALUE="12">12</OPTION>
										</SELECT>

								</td>
							</tr>

								<tr>
								<TD width=250 bgcolor="f1f1f1" align="right">


										<FONT FACE=verdana SIZE=1 color="gray" >Card Exp Year
									</td>
									<td bgcolor="f1f1f1" width=250 align=left valign=top>

									<SELECT NAME="app_cc_exp_year"
										size="1"
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: 003F1E;
										background-color: E4E3E3;
										border-color: white;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;
										float: none;"
										rows="3"
										cols="45"
										>
										<OPTION VALUE="2002" SELECTED>2002</OPTION>
										<OPTION VALUE="2003">2003</OPTION>
										<OPTION VALUE="2004">2004</OPTION>
										<OPTION VALUE="2005">2005</OPTION>
										<OPTION VALUE="2006">2006</OPTION>
										<OPTION VALUE="2007">2007</OPTION>
										<OPTION VALUE="2008">2008</OPTION>
										<OPTION VALUE="2009">2009</OPTION>
										<OPTION VALUE="2010">2010</OPTION>
										<OPTION VALUE="2011">2011</OPTION>
										<OPTION VALUE="2012">2012</OPTION>
										<OPTION VALUE="2013">2013</OPTION>
										<OPTION VALUE="2014">2014</OPTION>
										<OPTION VALUE="2015">2015</OPTION>
										<OPTION VALUE="2016">2016</OPTION>
										<OPTION VALUE="2017">2017</OPTION>
										<OPTION VALUE="2018">2018</OPTION>
										<OPTION VALUE="2019">2019</OPTION>
										<OPTION VALUE="2020">2020</OPTION>
										</SELECT>

								</td>
							</tr>

								<tr>
									<TD width=250 bgcolor="f1f1f1" align="right">


										<FONT FACE=verdana SIZE=1 color="gray" >Card Holder Name
									</td>
									<td bgcolor="f1f1f1" width=250 align=left valign=top>
										<input type="text" name="app_cc_name" value="" size=15 maxlength=20
													style="font-size: 9;
													font-family: verdana;
													font-style: normal;
													color: 003F1E;
													background-color: E4E3E3;
													border-color: white;
													border-left-width: thin;
													border-right-width: thin;
													border-top-width: thin;
													border-bottom-width: thin;
													border-width: thin;
													border-style: bar;
												clear: none;" >
									</td>
								</tr>




							<tr><td width=607 align=right colspan = 2 valign=bottom>

			<NOBR><input type=image border=0 src="./images/button_submit_title.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>

	<tr></table>

									</td>
								</tr>
				<tr><Td height="57" bgcolor="#FFFFFF"><div align="center">
                  <div align="center"><a href="https://www.geotrust.com" target="_blank"><img src="images/geotrust_certificate.jpg" width="115" height="55" border="0"></a></div></Td></tr>
                    <tr><Td bgcolor="#FFFFFF"><div align="justify"><font size="1"><strong><font face="Arial, Helvetica, sans-serif">Our
                    credit card transaction module is protected by 128-bit encryption
                    with a GeoTrust digital SSL certificate. Transactions between
                    your browser and our website (such as credit card details
                    entered in secured forms) are encrypted, thereby protecting
                    the information from third party interception.</font></strong></font></div>
                  <font face="Arial, Helvetica, sans-serif"></div></font></Td>
              </tr>

							</table>
				</center>
<p>

</cfform>


		<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>


</CENTER>
