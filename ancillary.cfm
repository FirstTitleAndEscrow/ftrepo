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
<CFPARAM NAME="SearchType" DEFAULT="">
<CFPARAM NAME="Deedtransfer" DEFAULT="">
<CFPARAM NAME="Insured" DEFAULT="">
<CFPARAM NAME="otherpro" DEFAULT="">
<CFPARAM NAME="loanamt_float" DEFAULT="0">
<CFPARAM NAME="loan_type_111" DEFAULT="">
<CFPARAM NAME="loan_program_333" DEFAULT="">
<CFPARAM NAME="Verifyemail" DEFAULT="">
<CFPARAM NAME="Verifyemail_2" DEFAULT="">
<CFPARAM NAME="Verifyemail_3" DEFAULT="">
<CFPARAM NAME="fax_no" DEFAULT="">
<CFPARAM NAME="RptbyEmail" DEFAULT="">
<CFPARAM NAME="request_icl" DEFAULT="">
<CFPARAM NAME="do_appraisal" DEFAULT="">
<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="">
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
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="file_upload" DEFAULT="">
<CFPARAM NAME="title_id" DEFAULT="">
<CFPARAM NAME="prop_id" DEFAULT="">
<CFPARAM NAME="app_id" DEFAULT="">
<CFQUERY datasource="#request.dsn#" NAME="check_order">
SELECT * FROM Ancillary WHERE (bfirstname1 = '#bfirstname1#') AND (blastname1= '#blastname1#') AND (bssn1 = '#bssn1#') AND (paddress = '#paddress#') AND (DATEDIFF(day, check_date, getdate() ) < 30 )
</CFQUERY>
<cfif (#check_order.recordcount# GT "0")>
<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT * FROM companies WHERE ID = '#comp_id#' ORDER BY company ASC
</CFQUERY>
<!---  </cfif> 4-8-05 Roger Herrera Added </cfif> it was missing and I am guessing it was supposed to be here --->
<cfif #read_company.recordcount# GT 0>
  <CFQUERY datasource="#request.dsn#" NAME="read_user">
  SELECT * FROM users WHERE comp_id = #read_company.id# ORDER BY lp_lname ASC
  </CFQUERY>
</cfif>
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
<title>1st Title&Escrow, Inc. - Title Request Form</title>
</head>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
    <tr>
      <td align = "center"><table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
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
                  </tr>
 <tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr>                </table>
              </cfFORM>
            </td>
          </tr>
          <tr>
            <td valign="top" align="center" width="560"><nobr></nobr><br>
&nbsp;</td>
          </tr>
        </table></td>
    </tr>
  </tbody>
</table>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
<TBODY>
  <tr>
  <td>
  <center>
  <table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
    <center>
      <!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->
      <CFOUTPUT>
        <TR>
          <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='FECE62'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='E79DF5'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
          <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')';return false;">
          <a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a>
        </td>

        <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='00FF66'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='https:/#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"><a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
          <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='FF9900'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
          <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='0066CC'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
          <!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 --->
        </tr>
      </CFOUTPUT>
    </center>
  </table>
  <p>
  <center>
  <table width="770">
  <tr>
    <td align=center colspan = 2 valign=bottom width = "700"><FONT FACE=ARIAL SIZE=2 color="red"> <br>
      <br>
      <center>
        <B>OUR RECORDS INDICATE THAT YOU HAVE RECENTLY ORDERED ANCILLARY PRODUCT WITH US! </B><br>
        <br>
        <FONT FACE=ARIAL SIZE=2 color="blue">If you still would like to process the order click on the "Submit Request" button, otherwise click the "Return" button to be redirected to the main menu.
      </center></td>
  </tr>
  <CFFORM NAME="frm" ACTION="./order_verify_title_ancillary_date.cfm?comp_id=#comp_id#&loan_number=#loan_number#&title_id=#title_id#&prop_id=#prop_id#&app_id=#app_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&blastname1=#blastname1#&bfirstname1=#bfirstname1#&bminame1=#bminame1#&bssn1=#bssn1#&bhphone1=#bhphone1#&bwphone1=#bwphone1#&bext1=#bext1#&blastname2=#blastname2#&bfirstname2=#bfirstname2#&bminame2=#bminame2#&bssn2=#bssn2#&bhphone2=#bhphone2#&bwphone2=#bwphone2#&bext2=#bext2#&slastname1=#slastname1#&sfirstname1=#sfirstname1#&sminame1=#sminame1#&sssn1=#sssn1#&shphone1=#shphone1#&swphone1=#swphone1#&sext1=#sext1#&slastname2=#slastname2#&sfirstname2=#sfirstname2#&sminame2=#sminame2#&sssn2=#sssn2#&shphone2=#shphone2#&swphone2=#swphone2#&sext2=#sext2#&paddress=#paddress#&pcity=#pcity#&pstate=#pstate#&pzip=#pzip#&pcounty=#pcounty#&plegaldesc=#plegaldesc#&prop_use_type=#prop_use_type#&condo_pud=#condo_pud#&a_comment=#a_comment#&flood=#flood#&avm=#avm#&credit=#credit#&signing=#signing#&Verifyemail=#Verifyemail#&Verifyemail_2=#Verifyemail_2#&Verifyemail_3=#Verifyemail_3#&fax_no=#fax_no#&RptbyEmail=#RptbyEmail#&request_icl=#request_icl#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#" ENCTYPE="multipart/form-data" METHOD=POST>
    </td>
    </tr>
    <tr>
    <td align=center valign=bottom width = "350"><cfoutput> <NOBR><a href="./client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0 ALT="Return to main menu"></a> </NOBR> </cfoutput> </td>
    <td align=center valign=bottom width = "390"><NOBR>
      <input type=image border=0 src="./images/button_submit_title.gif">
&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td>
  </cfform>
  <cfelse>
  <!--- here is where we check to see what time it is    --->
  <!--- when this order was submitted.  Because if it    --->
  <!--- was submitted after 3:00 pm, then we count it    --->
  <!--- as having been submitted at 8:30 am the next day --->
  <CFSET c_day_no = #DayOfWeek(Now())#>
  <CFSET c_day_number = #Day(Now())#>
  <CFSET c_month_no = #Month(Now())#>
  <CFSET c_year_no = #Year(Now())#>
  <CFIF #TimeFormat(Now(), "HH:mm:ss")# GT "15:00:00">
    <CFSET order_date_adjusted = #c_day_number# & "-" & #c_month_no# & "-" & #c_year_no# >
    <CFIF #c_day_no# EQ "6">
      <CFSET a_add_days = "3">
      <CFELSEIF #c_day_no# EQ "7">
      <CFSET a_add_days = "2">
      <CFELSE>
      <CFSET a_add_days = "1">
    </CFIF>
    <CFSET order_date_adj = #DateAdd("d", "#a_add_days#", order_date_adjusted)#>
    <CFSET order_date_adj = #DateFormat(order_date_adj, "d-mmm-yy")# & " " &  "8:30:00">
    <CFELSE>
    <CFSET order_date_adj = #DateFormat(Now(), "d-mmm-yy")# & " " &  #TimeFormat(Now(), "HH:mm:ss")#>
  </CFIF>
  <!---------- BEG FORMATTING FOR DUE DATE -------------->
  <CFOUTPUT>
    <CFSET dat = #DateFormat(Now())#>
    <!--- strip out day month and year from string --->
    <CFSET dat_1 = #ListToArray(dat, "-")#>
    <CFSET count=1>
    <CFLOOP FROM="1" TO="#ArrayLen(dat_1)#" INDEX="sss">
      <CFIF count EQ 1>
        <CFSET newdat = #dat_1[sss]#>
        <CFELSEIF count EQ 2>
        <CFSET newmon = #dat_1[sss]#>
        <CFELSEIF count EQ 3>
        <CFSET newyear = #dat_1[sss]#>
        <CFELSE>
        <!---do nothing--->
      </CFIF>
      <CFSET count = #count# + 1>
    </CFLOOP>
    <!--- convert Month word to number --->
    <CFIF '#newmon#' EQ 'Jan'>
      <CFSET newmon = '01'>
      <CFELSEIF '#newmon#' EQ 'Feb'>
      <CFSET newmon = '02'>
      <CFELSEIF '#newmon#' EQ 'Mar'>
      <CFSET newmon = '03'>
      <CFELSEIF '#newmon#' EQ 'Apr'>
      <CFSET newmon = '04'>
      <CFELSEIF '#newmon#' EQ 'May'>
      <CFSET newmon = '05'>
      <CFELSEIF '#newmon#' EQ 'Jun'>
      <CFSET newmon = '06'>
      <CFELSEIF '#newmon#' EQ 'Jul'>
      <CFSET newmon = '07'>
      <CFELSEIF '#newmon#' EQ 'Aug'>
      <CFSET newmon = '08'>
      <CFELSEIF '#newmon#' EQ 'Sep'>
      <CFSET newmon = '09'>
      <CFELSEIF '#newmon#' EQ 'Oct'>
      <CFSET newmon = '10'>
      <CFELSEIF '#newmon#' EQ 'Nov'>
      <CFSET newmon = '11'>
      <CFELSE>
      <CFSET newmon = '12'>
    </CFIF>
  </CFOUTPUT>
  <CFSET today = #CreateDate(#newyear#, #newmon#, #newdat#)#>
  <CFSET num_day = #DatePart('W', #today#)#>
  <!--- note: Sun = 1
				Mon = 2
				Tue = 3
				Wed = 4
				Thu = 5
				Fri = 6
				Sat = 7 --->
  <!--------------------------->
  <!--- Fourth Business Day --->
  <!--------------------------->
  <CFIF #num_day# EQ 1>
    <!--- If it's Sunday, 4th bus day is a Thursday (+4) --->
    <CFSET add_day = #DateAdd('D', 4, #today#)#>
    <CFELSEIF #num_day# EQ 2>
    <!--- If it's a Monday, 4th bus day is a Friday (+4) --->
    <CFSET add_day = #DateAdd('D', 4, #today#)#>
    <CFELSEIF #num_day# EQ 3>
    <!--- If it's a Tuesday, 4th bus day is a Monday (+6) --->
    <CFSET add_day = #DateAdd('D', 6, #today#)#>
    <CFELSEIF #num_day# EQ 4>
    <!--- If it's a Wednesday, 4th bus day is a Tuesday (+6) --->
    <CFSET add_day = #DateAdd('D', 6, #today#)#>
    <CFELSEIF #num_day# EQ 5>
    <!--- If it's a Thursday, 4th bus day is a Wednesday (+6) --->
    <CFSET add_day = #DateAdd('D', 6, #today#)#>
    <CFELSEIF #num_day# EQ 6>
    <!--- If it's a Friday, 4th bus day is a Thursday (+6) --->
    <CFSET add_day = #DateAdd('D', 6, #today#)#>
    <CFELSE>
    <!--- It's a Saturday, 4th bus day is a Thursday (+5) --->
    <CFSET add_day = #DateAdd('D', 5, #today#)#>
  </CFIF>
  <CFSET duedate = #DateFormat(#add_day#, "dd-mmm-yy")#>
  <CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
  <CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
  <!---------- END FORMATTING FOR DUE DATE -------------->
  <CFSET oda_day_1 = #Day(order_date_adj)#>
  <CFSET oda_month_1 = #Month(order_date_adj)#>
  <CFSET oda_year_1 = #Year(order_date_adj)#>
  <CFSET oda_day_of_year_1 = #DayOfYear(order_date_adj)#>
  <CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
  <CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
  <CFSET a_day_1 = #Day(a_insert_date)#>
  <CFSET a_month_1 = #Month(a_insert_date)#>
  <CFSET a_year_1 = #Year(a_insert_date)#>
  <CFSET a_day_of_year_1 = #DayOfYear(a_insert_date)#>
  <!---------- END FORMATTING FOR DUE DATE



<table width=455 border="1" cellspacing="0" cellpadding="3" align="center">

<tr align="middle" valign="center">
<td><font size=3><b>NOTE</b></font></td>
</TR>
<TR><P>

<td align=CENTER> <font size=2 face=arial> Our records indicate that we have recently received this order</td>
</tr>

</table>


-------------->
  <CFQUERY datasource="#request.dsn#" NAME="RU">
  SELECT * FROM users WHERE ID = #user_id_1#
  </CFQUERY>
  <CFSET ru_name = #RU.lp_fname# & #RU.lp_lname#>
  <CFQUERY datasource="#request.dsn#" NAME="RLO">
  SELECT * FROM loan_officers WHERE ID = #lo_id#
  </CFQUERY>
  <CFSET rlo_name = #RLO.lo_fname# & #RLO.lo_lname#>
  <!--- <CFIF #do_appraisal# EQ "No">
				<CFSET app_stat = "">
			<CFELSE>

			</CFIF> --->
  <CFSET app_stat = "In Process">
  <!--- <CFIF #Insured# EQ "Other">
			<CFSET pro_insured = #form.otherpro#>
			<cfelse>
			<CFSET pro_insured = #Insured#>
			</cfif> --->
  <cfquery  datasource="#request.dsn#">
  INSERT INTO Ancillary (loan_number, check_date,
  <cfif #flood# neq "">
    codeFlood,
  </cfif>
  <cfif #AVM# neq "">
    codeAVM,
  </cfif>
  <cfif #credit# neq "">
    codeCR,
  </cfif>
  <cfif #signing# neq "">
    codeSigning,
  </cfif>
  check_time, user_id, comp_id, loan_off_id, oname, ophone, oext, ofax, o_email, pname, pphone, pext, pfax, p_email, blastname1, bfirstname1, bminame1, bssn1, bhphone1, bwphone1, bext1, blastname2, bfirstname2, bminame2, bssn2, bhphone2, bwphone2, bext2, slastname1, sfirstname1, sminame1, sssn1, shphone1, swphone1, sext1, slastname2, sfirstname2, sminame2, sssn2, shphone2, swphone2, sext2, paddress, pcity, pstate, pzip, pcounty, plegaldesc, a_comment, verifyemail, verifyemail_2, verifyemail_3, fax_no, rptbyemail, a_insert_date, a_insert_time, duedate, order_date_adjusted, oda_day, oda_month, oda_year, oda_day_of_year, appraisal_status, a_day, a_month, a_year, a_day_of_year, polender1, poacctno1, pophone1, polender2, poacctno2, pophone2, order_status, prop_use_type, condo_pud, flood, avm, credit, signing) VALUES ('#loan_number#', '#DateFormat(Now(), "mm-dd-yyyy")#',
  <cfif #flood# neq "">
    'F',
  </cfif>
  <cfif #AVM# neq "">
    'AVM',
  </cfif>
  <cfif #credit# neq "">
    'CR',
  </cfif>
  <cfif #signing# neq "">
    'SN',
  </cfif>
  '#TimeFormat(Now(), "HH:mm:ss")#', #user_id_1#, #RU.comp_id#, #lo_id#, '#rlo_name#', '#RLO.lo_phone#', '#RLO.lo_ext#', '#RLO.lo_fax#', '#RLO.lo_email#', '#ru_name#', '#RU.lp_phone#', '#RU.lp_ext#', '#RU.lp_fax#', '#RU.lp_email#', '#blastname1#', '#bfirstname1#', '#bminame1#', '#bssn1#', '#bhphone1#', '#bwphone1#', '#bext1#', '#blastname2#', '#bfirstname2#', '#bminame2#', '#bssn2#', '#bhphone2#', '#bwphone2#', '#bext2#', '#slastname1#', '#sfirstname1#', '#sminame1#', '#sssn1#', '#shphone1#', '#swphone1#', '#sext1#', '#slastname2#', '#sfirstname2#', '#sminame2#', '#sssn2#', '#shphone2#', '#swphone2#', '#sext2#', '#paddress#', '#pcity#', '#pstate#', '#pzip#', '#pcounty#', '#plegaldesc#', '#a_comment#', '#verifyemail#', '#verifyemail_2#', '#verifyemail_3#', '#fax_no#', '#rptbyemail#', '#a_insert_date#', '#a_insert_time#', '#duedate#', '#order_date_adj#', #a_day_1#, #a_month_1#, #a_year_1#, #oda_day_of_year_1#, '#app_stat#', #a_day_1#, #a_month_1#, #a_year_1#, #a_day_of_year_1#, '#polender1#', '#poacctno1#', '#pophone1#', '#polender2#', '#poacctno2#', '#pophone2#', 1, '#prop_use_type#', '#condo_pud#', '#flood#', '#avm#', '#credit#', '#signing#')
  </cfquery>
  <CFQUERY datasource="#request.dsn#" NAME="get_titleid">
  SELECT * FROM Ancillary WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
  </CFQUERY>
  <CFQUERY datasource="#request.dsn#" NAME="getcompany">
  SELECT * FROM companies WHERE ID = #RU.comp_id#
  </CFQUERY>
  <!-------------------------------------------------------------------->
  <!--- ================================================= --->
  <!--- ===/ [ Output file for TSS Import Function ] \=== --->
  <!--- ================================================= --->
  <CFSET d_out = '"' & #get_titleid.anc_id# & '"' & ","  &
				'"' & #getcompany.company# & '"' & ","  &
				'"' & #RU_name# & '"' & ","  &
				'"' & "Loan Processor Phone: " & #RU.lp_phone# & " " &  " Ext " & '#RU.lp_ext#' & " Fax " & #RU.lp_fax# & '"' & "," &
				'"' & #blastname1# & "\" &  #bfirstname1# & #bminame1# & '"' & "," &
				'"' & #bssn1# & '"' & "," &
				'"' & #bhphone1# & '"' & "," &
				'"' & #bwphone1# & '"' & "," &
				'"' & "Work Phone Ext: " & #bext1# & '"' & "," &
				'"' & #blastname2# & "\" &  #bfirstname2# & #bminame2# & '"' & "," &
				'"' & #bssn2# & '"' & "," &
				'"' & #bhphone2# & " " & #bwphone2# & " " & "Work Phone Ext: " & #bext2# & '"' & "," &
				'"' & #slastname1# & "\" &  #sfirstname1# & #sminame1# & '"' & "," &
				'"' & #sssn1# & '"' & "," &
				'"' & #shphone1# & '"' & "," &
				'"' & #swphone1# & '"' & "," &
				'"' & "Work Phone Ext: " & #sext1# & '"' & "," &
				'"' & #slastname2# & "\" &  #sfirstname2# & #sminame2# & '"' & "," &
				'"' & #sssn2# & '"' & "," &
				'"' & #shphone2# & " " & #swphone2# & "Work Phone Ext: " & #sext2# & '"' & "," &
				'"' & #paddress# & '"' & "," &
				'"' & #pcity# & '"' & "," &
				'"' & #pstate# & '"' & "," &
				'"' & #pzip# & '"' & "," &
				'"' & #pcounty# & '"' & "," &
				'"' & #plegaldesc# & '"' & "," &
				'"' & #condo_pud# & '"' & "," &
				'"' & "Your E-Mail: " &  #verifyemail# & '"' & "," &
				'"' & "Other E-Mail1: " &  #verifyemail_2# & '"' & "," &
				'"' & "Other E-Mail2: " &  #verifyemail_3# & '"' & "," &
				'"' & "Receive E-Mail: " &  #rptbyemail# & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & "," &
				'"' & " " & '"' & ","
				>
  <CFQUERY datasource="#request.dsn#" NAME="read_user">
  SELECT * FROM users WHERE id = #url.USER_ID_1# ORDER BY lp_lname ASC
  </CFQUERY>
  <CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">
  SELECT * FROM loan_officers WHERE ID = #url.lo_ID#
  </CFQUERY>
  <CFQUERY datasource="#request.dsn#" NAME="read_title">
  SELECT * FROM ancillary WHERE anc_id = #get_titleid.anc_id#
  </CFQUERY>
  <CFIF (#pstate# EQ "AL") OR (#pstate# EQ "CT") or (#pstate# EQ "DC") or (#pstate# EQ "DE") or (#pstate# EQ "FL") or (#pstate# EQ "GA") or (#pstate# EQ "KY") or (#pstate# EQ "MA") or (#pstate# EQ "ME") or (#pstate# EQ "MD") or (#pstate# EQ "CO") or (#pstate# EQ "NJ")>
    <CFSET b_emails_to_first_title = "akumar@firsttitleservices.com">
    <CFELSEIF (#pstate# EQ "AR") OR (#pstate# EQ "NC") or (#pstate# EQ "IN") or (#pstate# EQ "MI") or (#pstate# EQ "MO") or (#pstate# EQ "TN") or (#pstate# EQ "VA") or (#pstate# EQ "WI") or (#pstate# EQ "AZ") or (#pstate# EQ "MT")>
    <CFSET b_emails_to_first_title = "akumar@firsttitleservices.com">
    <CFELSEIF (#pstate# EQ "IA") OR (#pstate# EQ "IL") or (#pstate# EQ "KS") or (#pstate# EQ "LA") or (#pstate# EQ "MN") or (#pstate# EQ "MS") or (#pstate# EQ "NH") or (#pstate# EQ "NY") or (#pstate# EQ "ND") or (#pstate# EQ "OH") or (#pstate# EQ "PA") or (#pstate# EQ "RI") or (#pstate# EQ "VT") or (#pstate# EQ "WV")>
    <CFSET b_emails_to_first_title = "akumar@firsttitleservices.com">
    <CFELSE>
    <CFSET b_emails_to_first_title = "akumar@firsttitleservices.com">
  </CFIF>
  <CFMAIL
				TO="#b_emails_to_first_title#"
				FROM="webmaster@firsttitleservices.com"

				Subject="Summary of Order #get_titleid.anc_id#-#get_titleid.bfirstname1# #get_titleid.blastname1#"
				TIMEOUT="600"
				type="HTML"
				>
  <CFIF #LEN(read_title.signing)# gte 1>
    <center>
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>Since you selected Signing some additional information will be required.</B>
          </CENTER></TD>
      </TR>
      <CFFORM>
        <tr>
          <td>Place of signing?</td>
          <td><select name="signing"
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
              <OPTION VALUE="">Select</OPTION>
              <OPTION VALUE="Home">Home</OPTION>
              <OPTION VALUE="other" >Other</OPTION>
            </select>
          </td>
        </tr>
        <tr>
          <td>Request Date for signing</td>
        </tr>
      </CFFORM>
    </table>
  </CFIF>
