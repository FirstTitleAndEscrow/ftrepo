<cfif IsDefined("url.company_id")>
<cfset session.comp_id = url.company_id>
</cfif>
<cfparam name="comp_id" default="">
<cfparam name="form.place_order" default = "">
<cfset dont_show = 0>
<cfparam name="form.send_quote" default = "0">
<cfparam name="form.print_quote" default = "0">
<cfparam name="form.save_quote" default = "0">
<cfif isDefined("calc_id")>
	<CFQUERY datasource="#request.dsn#" NAME="read_quotes">
        SELECT *
        FROM saved_calcs
	where savedcalcid = #calc_id#
    </CFQUERY>
	<cfwddx action = "wddx2cfml" input = #read_quotes.formdata# output = "form">
</cfif>
<cfparam name="form.email_to" default = "rick@jermain.com">
<cfparam name="form.transaction_type" default = "">
<cfparam name="form.first_time_buyer" default = "0">


<CFQUERY datasource="#request.dsn#" NAME="get_alta_vars">
select distinct short_id from Alta_fees order by short_id
</CFQUERY>
<cfoutput query="get_alta_vars">
<cfparam name="form.#get_alta_vars.short_id#" default="0">
</cfoutput>


<CFSET emp = "0" >
<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
SELECT * FROM first_title_states_all ORDER BY st_abbrev ASC
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT * FROM companies WHERE ID = '#comp_id#' ORDER BY company ASC
</CFQUERY>
<cfif #read_company.recordcount# GT 0>
  <CFQUERY datasource="#request.dsn#" NAME="read_user">
  SELECT * FROM users WHERE comp_id = #read_company.id# ORDER BY lp_lname ASC
  </CFQUERY>
  <CFIF #read_company.companies_switch# eq "1">
    <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
    SELECT * FROM companies_user WHERE ID = #emp#
    </CFQUERY>
    <CFSET emp = #read_company_user.ID#>
    <cfset session.emp = trim(#read_company_user.ID#)>
    <CFSET emp = #session.emp#>
  </CFIF>
</cfif>

<CFIF IsDefined("url.emp")>
	<CFSET emp = #url.emp#>
</CFIF>
<cfset session.emp = trim(#emp#)>
<CFSET emp = #session.emp#>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>1st Title&Escrow, Inc.</title>

<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
</head>
<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0 >
<CENTER>
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" style="border-color:#000000; border-width:1px; border-style:inset;">
  <TBODY>
    <tr>

    <td align = "center">

    <table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
      <tr>
        <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
        <td valign="top" align="right"><br>
          <cfFORM NAME="Search" METHOD="POST" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">
            <input type="hidden" name="emp" value = "#emp#">
            <table border=0 align="right" cellpadding="0" cellspacing=0>
              <tr>
                <td align="right" valign="center"><a href="./quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a> &nbsp;&nbsp;</td>
                <td align="right" valign="center"><input type="text" name="number" size=10></td>
                <td align="right" valign="center">&nbsp;
                  <input type="image" src="/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
              </tr>
  <tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr>
            </table>
          </cfFORM>
        </td>
      </tr>
      <tr>
        <td valign="top" align="center" width="560"><nobr></nobr><br>
&nbsp;</td>
      </tr>
    </table>
    <center>
      <table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25"  background="./images/back_03.gif">
        <center>
          <!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->
          <CFOUTPUT>
            <TR>
              <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
              <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
              <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
              <CFIF #read_company.companies_switch# eq "1">
                <CFIF #read_company_user.Administrator# eq "1">
                  <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"><a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
                </CFIF>
                <CFELSE>
                <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"><a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
              </CFIF>
              <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
              <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
              <!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 --->
            </tr>
          </CFOUTPUT>
        </center>
      </table>
    </center>
	<table><tr><td>
<!--- START NEW CALC STUFF --->

<style>
.adtext {font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#330099;}
.maintext {font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#000000;}
</style>

<center><img src="images/calc_header.jpg">
<!--- <br>
<span class="adtext">Go to <a href="https://<cfoutput>#cgi.server_name#</cfoutput>" target="_new"><cfoutput>#cgi.server_name#</cfoutput></a>, or <a href="https://<cfoutput>#cgi.server_name#</cfoutput>" target="_new">click here</a> to request more information<br>
on our company's products and services, nationwide.</span> ---><br><br>
<span class="maintext">Please enter the Property and Loan Information below, and click on "Calculate Fees".<br>
<font color="#CC0000">All fields are required.</font></span><br>
<cfoutput>
<a href="saved_quotes.cfm?comp_id=#comp_id#&user_id_1=0&lo_id=0&company_id=#comp_id#">View Saved Calculator Quotes</a><br>
<cfif comp_id EQ "1754">
<a href="saved_les.cfm?comp_id=#comp_id#&user_id_1=0&lo_id=0&company_id=#comp_id#">View Saved Loan Estimates</a><br>
</cfif>
</cfoutput>
</center>

<cfinclude template="new_calc_form_display2.cfm">
<!---
<cfif form.save_quote eq 1>
--->
<cfif (form.fee_submit eq 'Calculate Fees' or form.place_order eq "Place Title Order") AND not isDefined("calc_id")>
	<cfwddx action = "cfml2wddx" input = #form# output = "formData">
	<cfwddx action = "cfml2wddx" input = #get_fee_query# output = "wddxFeeQuery">
	<CFQUERY datasource="#request.dsn#" NAME="insCalc">
		insert into saved_calcs(comp_id,formData,feeQuery)
		values(#session.comp_id#,'#formData#','#wddxFeeQuery#')
	</cfquery>
	<!---
	<script>
		alert('Your Quote has been saved. To access it in the future follow the link at the top of the calculator to view saved quotes.');
	</script>
	--->
</cfif>

<cfif form.send_quote eq 1 OR form.print_quote eq 1>
<CFQUERY datasource="#request.dsn#" NAME="get_company">
		SELECT *
		FROM companies
		where id = #comp_id#
</CFQUERY>
<cfset our_company = "First Title">
<cfif get_company.streamline_client eq 'True'>
<cfset our_company = "Streamline Title">
</cfif>
<cfset dont_show = 1>
<cfdocument format="PDF" pagetype="custom" pageheight="14" pagewidth="8.5" margintop=".25" marginbottom=".25" marginleft=".25" marginright=".25" filename="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\saved_calcs\QUOTE_#form.property_city#_#form.property_state#_#form.property_zip#.pdf" overwrite="yes">
<cfinclude template="new_calc_form_display.cfm">
</cfdocument>
<cfif form.print_quote EQ 1>
<cflocation url="https://machine1.firsttitleservices.com/saved_calcs/QUOTE_#form.property_city#_#form.property_state#_#form.property_zip#.pdf">
</cfif>
<cfif form.send_quote eq 1>
<cfparam name="form.sender_name" default="">
<cfparam name="form.sender_email" default="">
<cfparam name="form.agent_name" default="">
<cfparam name="form.agent_email" default="">
<CFQUERY datasource="#request.dsn#" NAME="insert_record">
		insert into Sent_Quotes (sender_name, sender_email, agent_name, agent_email, sent_date, company_id)
		values ('#form.sender_name#', '#form.sender_email#', '#form.agent_name#', '#form.agent_email#', #CreateODBCDateTime(Now())#, #session.comp_id#)

</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_user">
		SELECT *
		FROM First_admin
		where id = #get_company.intSales#
</CFQUERY>


<cfif our_company eq "Streamline Title">
<cfset user_email = ReplaceNoCase(get_user.email, "firsttitleservices", "streamline-title", "ALL")>
<cfelse>
<cfset user_email = ReplaceNoCase(get_user.email, "streamline-title", "firsttitleservices", "ALL")>
</cfif>
<cfif user_email neq form.sender_email>
<cfset cc_list = user_email & ";" & form.sender_email>
<cfelse>
<cfset cc_list = user_email>
</cfif>
<CFMAIL
	TO="#form.agent_email#"
	FROM="#user_email#"
	BCC="rjermain@firsttitleservices.com"
    CC="#cc_list#"
	Subject="Your Closing Cost Quote from #our_company#, #form.property_city#/#form.property_state#/#form.property_zip#"
	TIMEOUT="600" type="html">
<cfmailparam file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\saved_calcs\QUOTE_#form.property_city#_#form.property_state#_#form.property_zip#.pdf">

<style type="text/css" media="screen">
<!--
body, TD {
margin: 3;
padding: 3;
font: 12px verdana, arial, sans-serif;
}
.small {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
input {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
select, option {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
.header {

font: 14px verdana, arial, sans-serif;
}
-->
</style>
<table width="544" cellpadding="1" cellspacing="1" bgcolor="##000000">
<tr><td align="left" valign="top">
<table width="100%" cellpadding="0" cellspacing="4" bgcolor="##ffffff" border=0>

<tr>
<td width="544" align="left" valign="top">
<strong>Dear #form.agent_name#,</strong><br>
<br>
<table cellpadding=1 cellspacing=1>
<tr>
<td align="left" valign="top" colspan="2">#our_company# & Escrow Fee Quote</td>
</tr>
<tr>
<td width="100" align="left" valign="top">State:</td>
<td width="100" align="left" valign="top">#form.property_state#</td>
</tr>
<tr>
<td width="100" align="left" valign="top">City:</td>
<td width="100" align="left" valign="top">#form.property_city#</td>
</tr>
<tr>
<td width="100" align="left" valign="top">Zip Code:</td>
<td width="100" align="left" valign="top">#form.property_zip#</td>
</tr>
<tr>
<td width="100" align="left" valign="top">Loan Amount:</td>
<td width="100" align="left" valign="top">#DollarFormat(form.loan_amount)#</td>
</tr>
<tr>
<td width="100" align="left" valign="top">Purchase Price:</td>
<td width="100" align="left" valign="top">#DollarFormat(form.purchase_price)#</td>
</tr>
</table><br>


Attached please find your closing cost quote for the above referenced Property.<br>
<br>
Please contact me directly if I can be of any further assistance. We look forward to being of service to you.
<br>
<br>
<!--- if it's Brian Thies, this changes, cause he's kind of an asshole, and has to customize everything --->
<cfif read_company.intsales eq 564> 
Respectfully,<br>
Brian Thies - National Sales Director<br>
First Title & Escrow<BR>
100 Chesterfield Business Parkway, Suite 200<BR>
Chesterfield, MO 63040<BR><BR>

BThies@FirstTitleServices.com<BR>
Cell:  314.477.3205<BR>
Fax:  301.315.8152<BR>
Processor/Closer:  Anne O'Neal<BR>
aoneal@firsttitleservices.com<BR>
Office:  636.451.7027<BR>
www.FirstTitleServices.com<BR>

<cfelse>

Sincerely,<br>
#get_user.fname# #get_user.lname#, #get_user.position#<br>
#our_company# & Escrow<BR>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive, 4th Floor<BR>
Rockville, MD 20850<BR>
<cfelse>
7361 Calhoun Place, Suite 200<BR>
Rockville, MD 20855<BR>
</cfif>

Phone: #get_user.phone#<br>
Fax: #get_user.fax#<br>
<cfif our_company eq "Streamline Title">
Web Address: <a href="https://www.streamline-title.com">www.streamline-title.com</a><br>
<cfelse>
Web Address: <a href="https://www.firsttitleservices.com">www.firsttitleservices.com</a><br>
</cfif>

</cfif>



</td>
</tr>

</table>
</td></tr>
</table>
</CFMAIL>

</cfif>
<cfset dont_show = 0>
</cfif>
</td></tr></table>

</TD>
</TR>
</table>
</td> </TBODY></TABLE>
</tr></tbody></table>
<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</HTML>
