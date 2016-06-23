
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
</head>
<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0 onLoad="prodSelect();">
<CENTER>
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
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
      <table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
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

</center>
<cfinclude template="new_calc_form.cfm">


<cfif form.fee_submit eq 'Calculate Fees'>

<cfset form.previous_loan_amount = ReplaceNocase(form.previous_loan_amount, '$', '', 'ALL')>
<cfset form.previous_loan_amount = ReplaceNocase(form.previous_loan_amount, ',', '', 'ALL')>

<cfset form.loan_amount = ReplaceNocase(form.loan_amount, '$', '', 'ALL')>
<cfset form.loan_amount = ReplaceNocase(form.loan_amount, ',', '', 'ALL')>

<cfset form.purchase_price = ReplaceNocase(form.purchase_price, '$', '', 'ALL')>
<cfset form.purchase_price = ReplaceNocase(form.purchase_price, ',', '', 'ALL')>


<cfinvoke	component = "cfc.fees"	method = "getFees"	returnVariable = "get_fee_query" company_id="100" transaction_type="#form.transaction_type#" property_state="#form.property_state#" property_county="#form.property_county#" property_city="#form.property_city#" loan_amount="#form.loan_amount#" purchase_price="#form.purchase_price#" previous_loan_amount="#ReplaceNocase(form.previous_loan_amount, '$', '', 'ALL')#" previous_loan_year="#form.previous_loan_year#" previous_loan_month="#form.previous_loan_month#" property_use_type="#form.property_use_type#" return_data="#form.return_data#">

<cfquery dbtype="query" name="fee_detail">
	SELECT *
	FROM get_fee_query
	order by line_number
</cfquery>



<cfif form.return_data eq 1>
<center>
<table width="500" cellpadding="3" cellspacing="0" border=1 style="border-color:#000000; border-width:1px; border-style:inset;">
<tr>
<td align="left" valign="top" bgcolor="#CCCCFF">HUD Line #</td>
<td align="left" valign="top" bgcolor="#CCCCFF">Description</td>
<td align="left" valign="top" bgcolor="#CCCCFF">Paid By:</td>
<td align="right" valign="top" bgcolor="#CCCCFF">Amount</td>
</tr>
<cfset seller_total = 0>
<cfset buyer_total = 0>
<cfset optionals = 0>
<cfoutput query="fee_detail">
<cfif fee_detail.line_number neq ''>
<cfif fee_detail.payer eq 'Seller'>
<cfset seller_total = seller_total + fee_detail.amount>
<cfelse>
<cfset buyer_total = buyer_total + fee_detail.amount>
</cfif>
<tr <cfif fee_detail.payer eq 'Seller'>bgcolor="##e9e9e9"<cfelse>bgcolor="##FFFFFF"</cfif>>
<td align="left" valign="top">#fee_detail.line_number#</td>
<td align="left" valign="top">#fee_detail.Description#</td>
<td align="left" valign="top">#fee_detail.Payer#</td>
<td align="right" valign="top">#NumberFormat(fee_detail.Amount, '___,___,___.__')#</td>
</tr>
<cfelse>
<cfset optionals = 1>
</cfif>
</cfoutput>

<cfoutput>
<cfif buyer_total neq 0>
<tr>
<td align="right" valign="top" bgcolor="##CCCCFF" colspan="4">Total (Buyer):&nbsp;&nbsp;&nbsp;#NumberFormat(buyer_total, '___,___,___.__')#</td>
</tr>
</cfif>
<cfif seller_total neq 0>
<tr>
<td align="right" valign="top" bgcolor="##e9e9e9" colspan="4">Total (Seller):&nbsp;&nbsp;&nbsp;#NumberFormat(seller_total, '___,___,___.__')#</td>
</tr>
</cfif>
</cfoutput>
</table>

<cfif optionals eq 1>
<cfset optionals_buyer_total = 0>
<cfset optionals_seller_total = 0>
<br>

<table width="500" cellpadding="3" cellspacing="0" border=1 style="border-color:#000000; border-width:1px; border-style:inset;">
<tr>
<td align="center" valign="top" bgcolor="#FFFFFF" colspan="4">OPTIONAL ENDORSEMENTS FOR <cfoutput>#form.property_state#</cfoutput></td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#e9e9e9" colspan="2">Description</td>
<td align="left" valign="top" bgcolor="#e9e9e9">Paid By:</td>
<td align="right" valign="top" bgcolor="#e9e9e9">Amount</td>
</tr>
<cfoutput query="fee_detail">
<cfif fee_detail.line_number eq ''>
<cfif fee_detail.payer eq "Buyer">
<cfset optionals_buyer_total = optionals_buyer_total + fee_detail.Amount>
<cfelse>
<cfset optionals_seller_total = optionals_seller_total + fee_detail.Amount>
</cfif>
<tr>
<td align="left" valign="top" bgcolor="##FFFFFF" colspan="2">#fee_detail.Description#</td>
<td align="left" valign="top" bgcolor="##FFFFFF">#fee_detail.Payer#</td>
<td align="right" valign="top" bgcolor="##FFFFFF">#NumberFormat(fee_detail.Amount, '___,___,___.__')#</td>
</tr>
</cfif>
</cfoutput>
<cfoutput>
<cfif optionals_buyer_total>
<tr>
<td align="right" valign="top" bgcolor="##e9e9e9" colspan="4">Optional Endorsements Total (Buyer):&nbsp;&nbsp;&nbsp;#NumberFormat(optionals_buyer_total, '___,___,___.__')#</td>
</tr>
</cfif>
<cfif optionals_seller_total>
<tr>
<td align="right" valign="top" bgcolor="##e9e9e9" colspan="4">Optional Endorsements Total (Seller):&nbsp;&nbsp;&nbsp;#NumberFormat(optionals_seller_total, '___,___,___.__')#</td>
</tr>
</cfif>
</cfoutput>
</cfif>
</table>
</cfif>
</center>
</cfif>

<center>
<span class="adtext"><br>
The calculation above does not include any fees for municipal lien searches or estoppel letter<br> fees charged by HOA
or Condo Associations, as those fees vary by each individual property. <br>Please also note that the
fee calculator is an estimate of the fees and are subject to change.<br>
</span>
</center>

<!--- END NEW CALC STUFF --->


</td></tr></table>

</TD>
</TR>
</table>
</td> <tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>
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
