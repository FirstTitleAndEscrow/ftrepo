<cfif isDefined("url.pst")>
<cfset this_state = url.pst>
</cfif>
<cfif isDefined("url.pstate")>
<cfset this_state = url.pstate>
</cfif>

<cffunction name="get_rec_fee">

	<cfargument name="current_rec_fee" default="#rec_fee#">
	<cfargument name="current_state" default="#url.pst#">


<cfoutput>
<cfset seller_pays_list = "AL,CO,TN,VT,IL">
<cfset buyer_pays_list = "CA,CT,FL,GA,IA,KY,MA,MI,MN,NE,NV,NJ,NC,OH,OK,RI,SC,SD,WA,WI,WV">
<cfset split_states_list = "AR,DC,DE,ME,NH,PA">
<cfset temp = "">


<cfif ListFindNoCase(seller_pays_list, arguments.current_state, ",") neq 0>
<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(rec_fee, '_____.__')# (Seller)</td>
                  </tr>

<cfelseif ListFindNoCase(buyer_pays_list, arguments.current_state, ",") neq 0>

<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(rec_fee, '_____.__')#</td>
                  </tr>

<cfelseif ListFindNoCase(split_states_list, arguments.current_state, ",") neq 0>

<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat((rec_fee / 2), '_____.__')#</td>
                  </tr>
<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat((rec_fee / 2), '_____.__')# (Seller)</td>
                  </tr>
<cfelse>
  <cfif arguments.current_state eq 'HI'>
<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording FeeHI </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat((rec_fee * .60), '_____.__')# (Seller)</td>
                  </tr>
<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording FeeHI </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat((rec_fee * .40), '_____.__')#</td>
                  </tr>

  <cfelseif arguments.current_state eq 'OR' and url.pcnt eq 'Washington'>
<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording FeeOR</td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat((rec_fee / 2), '_____.__')#</td>
                  </tr>
<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording FeeOR </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat((rec_fee / 2), '_____.__')# (Seller)</td>
                  </tr>

  <cfelseif arguments.current_state eq 'NY' and url.loanamt_float GTE 1000000>
	<cfset buyer_cost = url.loanamt_float * .01>
	<cfset seller_cost = current_rec_fee - buyer_cost>

<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording FeeNY </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(buyer_cost, '_____.__')#</td>
                  </tr>
<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording FeeNY </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(seller_cost, '_____.__')# (Seller)</td>
                  </tr>

  <cfelseif arguments.current_state eq 'NY' and url.loanamt_float LT 1000000>
<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording FeeNY </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(rec_fee, '_____.__')# (Seller)</td>
                  </tr>

  <cfelseif arguments.current_state eq 'VA'>
	<cfset buyer_cost = url.loanamt_float * .001>
	<cfset seller_cost = current_rec_fee - buyer_cost>
<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording FeeVA </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(buyer_cost, '_____.__')#</td>
                  </tr>
<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording FeeVA </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(seller_cost, '_____.__')# (Seller)</td>
                  </tr>
  <cfelse>
<tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src='./images/info-01.gif' ALT='Recording fee'> Recording FeeDEFAULT </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(rec_fee, '_____.__')# (Seller)</td>
                  </tr>
  </cfif>
</cfif></cfoutput>
</cffunction>


<cfset expedite_states = "AL,AR,DE,DC,GA,IL,IN,IA,KY,LA,ME,MD,MA,MN,MI,MO,NH,NC,ND,OK,SC,VT,VA,WV">


<cfparam name="loc" default="0">
<cfparam name="a_trigger" default="0">
<CFPARAM NAME="SearchType" DEFAULT="Refinance">
<CFPARAM NAME="FORM.searchtype" DEFAULT="Refinance">
<CFPARAM NAME="FORM.pstate"       DEFAULT="">
<CFPARAM NAME="pstate"       DEFAULT="">
<CFPARAM NAME="FORM.pcity"       DEFAULT="">
<CFPARAM NAME="pcity"       DEFAULT="">
<CFPARAM NAME="loanamt_float4"    DEFAULT="123456">
<CFPARAM NAME="loanamt_float"    DEFAULT="123456">
<CFPARAM NAME="FORM.loanamt_float4"    DEFAULT="123456">
<CFPARAM NAME="FORM.loanamt_float"    DEFAULT="123456">
<CFPARAM NAME="input_val"     DEFAULT="">
<CFPARAM NAME="emp" DEFAULT="0">
<CFPARAM NAME="estimated_loan" DEFAULT="0">
<CFPARAM NAME="property_use" DEFAULT="2">
<CFPARAM NAME="a_ins_premium" DEFAULT="">
<!--- for calyx part 07/29/05 N--->
<cfparam name ="user_id_1" default="0">
<cfparam name ="lo_id" default="0">
<CFPARAM NAME="pcounty" DEFAULT="">
<cfparam name="line" default="0">
<cfparam name="comp_id" default="1056">
<cfparam name="url.comp_id" default="0">
<cfparam name="form.prev_loan_amt" default="0">
<cfparam name="form.prev_loan_mo" default="0">
<cfparam name="form.prev_loan_year" default="0">
<cfparam name="form.ESTIMATED_LOAN" default="0">

<cfparam name="url.prev_loan_amt" default="0">
<cfparam name="url.prev_loan_mo" default="0">
<cfparam name="url.prev_loan_year" default="0">



<cfif IsDefined("url.ln")>
   <cfset line=#url.ln#>
</cfif>

<cfif IsDefined("url.pcnt")>
   <cfset pcounty=#url.pcnt#>
</cfif>
<cfif IsDefined("url.srcht")>
   <cfset FORM.searchtype=#url.srcht#>
   <cfset SearchType=#url.srcht#>
</cfif>
<cfif IsDefined("url.pst")>
   <cfset FORM.pstate=#url.pst#>
   <cfset pstate=#url.pst#>
</cfif>
<cfif IsDefined("url.pcty")>
   <cfset FORM.pcity=#url.pcty#>
   <cfset pcity=#url.pcty#>
</cfif>
<cfif IsDefined("url.pcnt")>
   <cfset pcounty=#url.pcnt#>
</cfif>
<cfif IsDefined("url.lnmt")>
   <cfset loanamt_float=#url.lnmt#>
   <cfset FORM.loanamt_float=#url.lnmt#>
</cfif>
<cfif IsDefined("url.lnmt4")>
   <cfset loanamt_float4=#url.lnmt4#>
   <cfset FORM.loanamt_float4=#url.lnmt4#>
</cfif>
<cfif IsDefined("url.loc")>
   <cfset loc=#url.loc#>
</cfif>
<cfif IsDefined("url.a_trigger")>
   <cfset a_trigger=#url.a_trigger#>
</cfif>
<cfif IsDefined("url.msg1109")>
   <cfset a_ins_premium=#url.msg1109#>
</cfif>

<cfif (#property_use# eq 2) OR (#pstate# NEQ 'MD') OR (#SearchType# EQ 'Purchase') >
	<cfset estimated_loan=0>
</cfif>


<!--- <cfif IsDefined("url.a_trigger")>
 <cfoutput>  trg=#a_trigger# loc=#loc# lnmt=#loanamt_float# pcnt=#pcounty#
   srcht=#searchtype# pstt=#FORM.pstate#
   prp_use=#property_use# estln=#estimated_loan#</cfoutput>
</cfif>
 --->

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
<cfif #a_trigger# eq 20>
  <SCRIPT LANGUAGE="JavaScript">
window.alert("CALL FOR QUOTE FOR CALIFORNIA! The state you have chosen is not served by our company. Please try to re-process your request by inputing the correct data. We apologize for the inconvenience!")

</SCRIPT>
</cfif>
<cfif #a_trigger# eq 22>
  <SCRIPT LANGUAGE="JavaScript">
window.alert("CALL FOR QUOTE FOR CA! THE LOAN AMOUNT you have entered does not match with the any fees in our database. Please try to re-process your request by inputing the correct data. We apologize for the inconvenience!")

</SCRIPT>
</cfif>
<script type="text/javascript">
function go(frm) {
window.location=frm;
}


</script>
<script type="text/javascript">
function isNumeric(str)
// returns true if str is numeric
// that is it contains only the digits 0-9
// returns false otherwise
// returns false if empty
{
  var len= str.length;
  if (len==0)
    return false;
  //else
  var p=0;
  var ok= true;
  var ch= "";
  while (ok && p<len)
  {
    ch= str.charAt(p);
    if ('0'<=ch && ch<='9')
      p++;
    else
      ok= false;
  }
  return ok;
}



function ValidateForm(frm)
{
frm = document.frm;
if (frm.SearchType.value=='') {
 alert("Please select a search type in order to proceed!")
 frm.SearchType.focus();
      return false;
 }


if (frm.pcity.value=='') {

 alert("The CITY field cannot be left blank!")
 frm.pcity.focus();
      return false;
 }

if (frm.loanamt_float.value=='') {

 alert("The LOAN AMOUNT field cannot be left blank!")
 frm.loanamt_float.focus();
      return false;
 }

if (!isNumeric(frm.loanamt_float.value)) {

 alert("Only numbers are allowed in the LOAN AMOUNT field!")
 frm.loanamt_float.focus();
      return false;
 }
 if (frm.loanamt_float.value.length < 3 || frm.loanamt_float.value.length > 8) {
 alert("Only numbers between 3 and 8 digits can be entered in the loan amount field!")
  frm.loanamt_float.focus();
      return false;
 }

if (frm.pstate.value=='MD' || frm.pstate.value=='DE' || frm.pstate.value=='NY' || frm.pstate.value=='CA') {
 if (frm.pcounty.value=='') {
 alert("The State needs a county!")
 frm.pcounty.focus();
      return false;
 }
 }
return true;

 }


function prodSelect() {
 <cfoutput>
 var current_comp_id = #url.comp_id#;
 </cfoutput>


if (((document.frm.pstate.value == "CA")&&(document.frm.SearchType.value == "Purchase") || (document.frm.pstate.value == "MI")&&(document.frm.SearchType.value == "Purchase")) || (current_comp_id == 729 && (document.frm.pstate.value == "AZ")&&(document.frm.SearchType.value == "Purchase"))) {
document.getElementById('table_cell').innerHTML = '<FONT FACE=verdana SIZE=1 color="black">Purchase Price';
document.getElementById('tbl2').style.display = 'block';
} else {
document.getElementById('table_cell').innerHTML = '<FONT FACE=verdana SIZE=1 color="black">Loan Amount/<BR>Purchase Price';
document.getElementById('tbl2').style.display = 'none';
}


if ((document.frm.pstate.value == "TX")&&(document.frm.SearchType.value != "Purchase")) {
document.getElementById('tbl3').style.display = 'block';
document.getElementById('tbl4').style.display = 'block';
} else {
document.getElementById('tbl3').style.display = 'none';
document.getElementById('tbl4').style.display = 'none';
}


}
</script>
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
    <table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>

    <tr>
      <td width=770 align=left valign=top bgcolor="blue"><CENTER>
          <FONT FACE=ARIAL SIZE=2 color="white"><B>Closing Fees Calculator</B></font>
        </CENTER></TD>
    </TR>
    <tr>
      <td width=770 align=left valign=top bgcolor=elelel><FONT FACE=ARIAL SIZE=2 color="blue"> <nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput>
        <CENTER>
          <B>Please indicate the following</B>
        </CENTER>
        </nobr> </TD>
    </TR>
    <CFFORM ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" METHOD=POST>
      <input type="hidden" name="emp" value = "#emp#">
      <td width=770 align=center valign=top bgcolor=d3d3d3>
        <table width=600 cellpadding=1 cellspacing=1 border=0>
        <br>
        <tr>
          <td bgcolor=d3d3d3 width=350 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> This is a calculation for an existing order </td>
          <td bgcolor=d3d3d3 width=250 align=left valign=top><input type="radio" name="loc" value = "1" onClick="go('./calculator.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&loc=1');">
          </td>
        </tr>
        <tr>
          <td bgcolor=d3d3d3 width=350 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> This is for calculation purposes only </td>
          <td bgcolor=d3d3d3 width=250 align=left valign=top><input type="radio" name="loc" value = "2" onClick="go('./calculator.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&loc=2');">
          </td>
        </tr>
    </cfform>
    <table width=770 cellpadding=1 cellspacing=1 border=0>
      <tr>
        <td width=770 align=left colspan = 4 valign=top bgcolor=elelel><FONT FACE=ARIAL SIZE=2 color="blue">
          <CENTER>
            <B>**NOTE: Calculation for existing order allows you to modify loan amount for the order</B>
          </CENTER></TD>
      </TR>
    </table>
    <CFIF IsDefined("form.loc") is True>
      <cfset loc=#loc#>
    </cfif>
    <cfif #loc# eq 1>
      <table width=600 cellpadding=1 cellspacing=1 border=0>

      <tr>
        <td bgcolor=d3d3d3 width=600 colspan = 5 align=center valign=top><br>
          <FONT FACE=verdana SIZE=2 color="blue"> <b>You have chosen to perfom a calculation for an existing order.</font> <br>
          <FONT FACE=verdana SIZE=1 color="red">To Proceed your request enter the appropriate information below:</FONT></b> <br>
          <br>
        </td>
      </tr>
      <tr>
        <td bgcolor=d3d3d3 width=160 align=left valign=top><FONT FACE=verdana SIZE=1 color="black"> Transaction Type </td>
        <td bgcolor=d3d3d3 width=100 align=center valign=top><FONT FACE=verdana SIZE=1 color="black"> State </td>
        <td bgcolor=d3d3d3 width=100 align=center valign=top><FONT FACE=verdana SIZE=1 color="black"> County </td>
		<td bgcolor=d3d3d3 width=100 align=center valign=top><FONT FACE=verdana SIZE=1 color="black"> City </td>
        <td bgcolor=d3d3d3 width=190 align=center valign=top id="table_cell"><FONT FACE=verdana SIZE=1 color="black">Loan Amount/<BR>Purchase Price </td>
        <td bgcolor=d3d3d3 width=68 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">&nbsp; </td>
      </tr>
      <tr>

       <CFFORM name = "frm" ACTION="./interim_calc_form.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=3&a_trigger=11" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>
<!---        <CFFORM name = "frm" ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=3&a_trigger=11" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>  --->

       <input type="hidden" name="emp" value = "#emp#">
        <td width=160 bgcolor="d3d3d3" align=left valign=top><select name="SearchType" onchange="prodSelect()"
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
            <option value="">Select</option>
            <option value="Purchase">Purchase</option>
            <option value="Refinance">Refinance</option>
            <option value="New Second Mortgage">New Second Mortgage</option>
          </select></td>
        <td bgcolor=d3d3d3 width=100 align=center valign=top><Select NAME="pstate" onchange="prodSelect()"
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
            <CFOUTPUT QUERY="read_state_list">
              <OPTION VALUE="#st_abbrev#">#st_abbrev# </OPTION>
            </CFOUTPUT>
          </select>
        </td>
        <td bgcolor=d3d3d3 width=100 align=center valign=top><INPUT NAME="pcounty" SIZE=20 MAXLENGTH=120

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
		<td bgcolor=d3d3d3 width=100 align=center valign=top><INPUT NAME="pcity" SIZE=20 MAXLENGTH=120

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
        <td bgcolor=d3d3d3 width=190 align=center valign=top><INPUT NAME="loanamt_float" SIZE=20 MAXLENGTH=120

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

            <TR id="tbl2" style="display:none">
              <td bgcolor=d3d3d3 colspan="4"  align=center valign=top>&nbsp;</td><td bgcolor=d3d3d3 width=190 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Enter Loan Amount<br>
                <INPUT NAME="loanamt_float4" SIZE=20 MAXLENGTH=120

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


			<TR id="tbl3" style="display:none">
              <td bgcolor=d3d3d3 colspan="4"  align=center valign=top>&nbsp;</td><td bgcolor=d3d3d3 width=190 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Previous Loan Amount<br>
                <INPUT NAME="prev_loan_amt" SIZE=20 MAXLENGTH=120

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

			<TR id="tbl4" style="display:none">
              <td bgcolor=d3d3d3 colspan="4"  align=center valign=top>&nbsp;</td><td bgcolor=d3d3d3 width=190 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Previous Loan Date<br>
                Month <INPUT NAME="prev_loan_mo" SIZE=2 MAXLENGTH=2

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
									Year <INPUT NAME="prev_loan_year" SIZE=4 MAXLENGTH=4

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

            <TR >
              <td colspan="4">&nbsp;</td><td bgcolor=d3d3d3 align=right valign=top width="190"><INPUT TYPE=image src="./images/button_submit.gif" border=0>&nbsp;&nbsp;&nbsp;
              </td>
            </tr>

          </table>

      </cfform>
    </cfif>
    <cfif #loc# eq 2>
      <table width=600 cellpadding=1 cellspacing=1 border=0>

      <tr>
        <td bgcolor=d3d3d3 width=600 colspan = 5 align=center valign=top><br>
          <FONT FACE=verdana SIZE=2 color="blue"> <b>You have choosen to proceed for calculation purposes only. </font><br>
          <FONT FACE=verdana SIZE=1 color="red">To proceed your request enter the appropriate information below:</FONT></b> <br>
          <br>
        </td>
      </tr>
      <tr>
        <td bgcolor=d3d3d3 width=160 align=left valign=top><FONT FACE=verdana SIZE=1 color="black"> Transaction Type </td>
        <td bgcolor=d3d3d3 width=100 align=center valign=top><FONT FACE=verdana SIZE=1 color="black"> State </td>
        <td bgcolor=d3d3d3 width=100 align=center valign=top><FONT FACE=verdana SIZE=1 color="black"> County </td>
		<td bgcolor=d3d3d3 width=100 align=center valign=top><FONT FACE=verdana SIZE=1 color="black"> City </td>
        <td bgcolor=d3d3d3 width=190 align=center valign=top id="table_cell"><FONT FACE=verdana SIZE=1 color="black">Loan Amount/<BR>Purchase Price </td>
        <td bgcolor=d3d3d3 width=68 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">&nbsp; </td>
      </tr>
      <tr>
      <!--- <CFFORM name = "frm" ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=4&a_trigger=11" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST> --->
        <CFFORM name = "frm" ACTION="./interim_calc_form.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=4&a_trigger=11" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>
		 <input type="hidden" name="emp" value = "#emp#">
        <td width=160 bgcolor="d3d3d3" align=left valign=top><select name="SearchType" onchange="prodSelect()"
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
            <option value="">Select</option>
            <option value="Purchase">Purchase</option>
            <option value="Refinance">Refinance</option>
            <option value="New Second Mortgage">New Second Mortgage</option>
          </select></td>
        <td bgcolor=d3d3d3 width=100 align=center valign=top><Select NAME="pstate" onchange="prodSelect()"
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
            <CFOUTPUT QUERY="read_state_list">
              <OPTION VALUE="#st_abbrev#">#st_abbrev# </OPTION>
            </CFOUTPUT>
          </select>
        </td>
        <td bgcolor=d3d3d3 width=100 align=center valign=top><INPUT NAME="pcounty" SIZE=20 MAXLENGTH=120

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
        <td bgcolor=d3d3d3 width=100 align=center valign=top><INPUT NAME="pcity" SIZE=20 MAXLENGTH=120

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
		<td bgcolor=d3d3d3 width=190 align=center valign=top><INPUT NAME="loanamt_float" SIZE=20 MAXLENGTH=120

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

            <TR id="tbl2" style="display:none">
              <td bgcolor=d3d3d3 colspan="4"  align=center valign=top>&nbsp;</td><td bgcolor=d3d3d3 width=190 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Enter Loan Amount<br>
                <INPUT NAME="loanamt_float4" SIZE=20 MAXLENGTH=120

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

			<TR id="tbl3" style="display:none">
              <td bgcolor=d3d3d3 colspan="4"  align=center valign=top>&nbsp;</td><td bgcolor=d3d3d3 width=190 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Previous Loan Amount<br>
                <INPUT NAME="prev_loan_amt" SIZE=20 MAXLENGTH=120

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

			<TR id="tbl4" style="display:none">
              <td bgcolor=d3d3d3 colspan="4"  align=center valign=top>&nbsp;</td><td bgcolor=d3d3d3 width=190 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Previous Loan Date<br>
                Month <INPUT NAME="prev_loan_mo" SIZE=2 MAXLENGTH=2

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
									Year <INPUT NAME="prev_loan_year" SIZE=4 MAXLENGTH=4

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

            <TR >
              <td colspan="4">&nbsp;</td><td bgcolor=d3d3d3 align=right valign=top width="190"><INPUT TYPE=image src="./images/button_submit.gif" border=0>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </td>
            </tr>

          </table>

      </cfform>
    </cfif>
    <cfif #a_trigger# eq 11>
      <cfset a_trigger = 12>
    </cfif>
    <cfif #a_trigger# eq 12>
      <CFOUTPUT>
        <cfif (#FORM.pstate# NEQ "CA") and (#FORM.pstate# NEQ "AL") and (#FORM.pstate# NEQ "NE") and (#FORM.pstate# NEQ "CO") and (#FORM.pstate# NEQ "GA") and (#FORM.pstate# NEQ "MI") and (#FORM.pstate# NEQ "NY") and (#FORM.pstate# NEQ "TN") and (#FORM.pstate# NEQ "AZ") and (#FORM.pstate# NEQ "WA")>
          <CFIF #pstate# EQ "AR">
            <CFSET a_tble_to_read = "StateArkansas">
            <CFELSEIF #pstate# EQ "AK">
            <CFSET a_tble_to_read = "StateAlaska">
            <CFELSEIF #pstate# EQ "MT">
						 <CFIF (#read_company.id# eq 729) >
						 <CFSET a_tble_to_read = "StateMontanaStewart"><cfelse>
            <CFSET a_tble_to_read = "StateMontana">
						</cfif>
            <CFELSEIF #pstate# EQ "CT">
            <CFSET a_tble_to_read = "StateConnecticut">
            <CFELSEIF #pstate# EQ "DC">
            <CFSET a_tble_to_read = "StateDistrictColombia">
            <CFELSEIF #pstate# EQ "DE">
            <CFSET a_tble_to_read = "StateDelaware">
            <CFELSEIF #pstate# EQ "FL">
            <CFIF (#read_company.id# eq 465) >
              <CFSET a_tble_to_read = "StateFloridaSuperior">
              <CFELSE>
              <CFSET a_tble_to_read = "StateFlorida">
            </CFIF>
            <CFELSEIF #pstate# EQ "HI">
            <CFSET a_tble_to_read = "StateHawaii">
            <CFELSEIF #pstate# EQ "ID">
            <CFSET a_tble_to_read = "StateIdaho">
            <CFELSEIF #pstate# EQ "IL">
            <CFSET a_tble_to_read = "StateIllinois">
            <CFELSEIF #pstate# EQ "IN">
            <CFSET a_tble_to_read = "StateIndiana">
            <CFELSEIF #pstate# EQ "IA">
            <CFSET a_tble_to_read = "StateIowa">
            <CFELSEIF #pstate# EQ "KS">
            <CFSET a_tble_to_read = "StateKansas">
            <CFELSEIF #pstate# EQ "KY">
            <CFSET a_tble_to_read = "StateKentucky">
            <CFELSEIF #pstate# EQ "LA">
            <CFSET a_tble_to_read = "StateLouisianna">
            <CFELSEIF #pstate# EQ "ME">
            <CFSET a_tble_to_read = "StateMaine">
            <CFELSEIF #pstate# EQ "MD">
            <CFSET a_tble_to_read = "StateMaryland">
            <CFELSEIF #pstate# EQ "MA">
            <CFSET a_tble_to_read = "StateMassachusetts">
            <CFELSEIF #pstate# EQ "MN">
            <CFSET a_tble_to_read = "StateMinnesota">
            <CFELSEIF #pstate# EQ "MS">
            <CFSET a_tble_to_read = "StateMississipi">
            <CFELSEIF #pstate# EQ "MO">
            <CFSET a_tble_to_read = "StateMissouri">
            <CFELSEIF #pstate# EQ "NV">
            <CFIF (#read_company.id# eq 729) >
              <CFSET a_tble_to_read = "StateNevadaStewart">
              <cfelse>
              <CFSET a_tble_to_read = "StateNevada">
            </cfif>
            <CFELSEIF #pstate# EQ "NJ">
            <CFSET a_tble_to_read = "StateNewJersey">
            <CFELSEIF #pstate# EQ "NC">
            <CFSET a_tble_to_read = "StateNorthCarolina">
            <CFELSEIF #pstate# EQ "ND">
            <CFIF (#read_company.id# eq 729) >
              <CFSET a_tble_to_read = "StateNorthDakotaStewart">
              <cfelse>
              <CFSET a_tble_to_read = "StateNorthDakota">
            </cfif>
            <CFELSEIF #pstate# EQ "NH">
            <CFSET a_tble_to_read = "StateNewHampshire">
            <CFELSEIF #pstate# EQ "NM">
            <CFSET a_tble_to_read = "StateNewMexico">
            <CFELSEIF #pstate# EQ "OH">
            <CFSET a_tble_to_read = "StateOhio">
            <CFELSEIF #pstate# EQ "OR">
            <CFSET a_tble_to_read = "StateOregon">
            <CFELSEIF #pstate# EQ "PA">
            <CFSET a_tble_to_read = "StatePennsylvania">
            <CFELSEIF #pstate# EQ "RI">
            <CFSET a_tble_to_read = "StateRhodeIsland">
            <CFELSEIF #pstate# EQ "SC">
            <CFSET a_tble_to_read = "StateSouthCarolina">
            <CFELSEIF #pstate# EQ "SD">
            <CFSET a_tble_to_read = "StateSouthDakota">
            <CFELSEIF #pstate# EQ "UT">
            <CFSET a_tble_to_read = "StateUtah">
            <CFELSEIF #pstate# EQ "TX">
            <CFSET a_tble_to_read = "StateTexas">
            <CFELSEIF #pstate# EQ "VT">
            <CFSET a_tble_to_read = "StateVermont">
            <CFELSEIF #pstate# EQ "VA">
            <CFSET a_tble_to_read = "StateVirginia">
			<CFELSEIF #pstate# EQ "WV">
            <CFSET a_tble_to_read = "StateWestVirginia">
            <CFELSEIF #pstate# EQ "WI">
            <CFSET a_tble_to_read = "StateWisconsin">
            <CFELSEIF #pstate# EQ "WY">
            <CFSET a_tble_to_read = "StateWyoming">
          </cfif>

          <!--- Round up the value of the loan amount --->
          <!--- remove any potential decimal values --->
          <CFSET   x  = #Round(loanamt_float)#>
          <CFSET   x_len  = #Len(x)#>
          <CFIF #x_len# EQ "3">
            <CFSET x_temp = #x# / 10>
            <CFSET   x_final  = #Round(x_temp)# * 10>
            <CFELSEIF #x_len# EQ "4">
            <CFSET x_temp = #x# / 100>
            <CFSET   x_final  = #Round(x_temp)# * 100>
            <CFELSEIF #x_len# EQ "5">
            <CFSET x_temp = #x# / 1000>
            <CFSET   x_final  = #Round(x_temp)# * 1000>
            <CFELSEIF #x_len# EQ "6">
            <CFSET x_temp = #x# / 1000>
            <CFSET   x_final  = #Round(x_temp)# * 1000>
            <CFELSEIF #x_len# EQ "7">
            <CFSET x_temp = #x# / 10000>
            <CFSET   x_final  = #Round(x_temp)# * 10000>
            <CFELSEIF #x_len# EQ "8">
            <CFSET x_temp = #x# / 100000>
            <CFSET   x_final  = #Round(x_temp)# * 100000>
          </CFIF>


          <!--- Now decide which field to use to do the calc  --->
          <!--- then Query the proper table                   --->
          <CFIF (#pstate# eq "NM")  or (#pstate# eq "ID") or (#pstate# eq "SD") or (#pstate# eq "TX")  OR (#pstate# eq "WA") OR (#pstate# eq "WY")>
            <CFIF a_ins_premium NEQ "Call for quote!">
				<CFSET a_ins_premium = 0>
			</CFIF>
            <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc">
            SELECT * FROM StateUtah WHERE 0 = 1
            </CFQUERY>
            <CFELSE>
            <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
	  order by a_to
      </CFQUERY>
            <CFIF (#pstate# eq "NM")  or (#pstate# eq "ID")  or (#pstate# eq "SD") or (#pstate# eq "WA") OR (#pstate# eq "WY")>
            	<CFIF a_ins_premium NEQ "Call for quote!">
					<CFSET a_ins_premium = 0>
				</CFIF>
             <CFELSE>
              <CFIF #searchtype# EQ "Refinance">
	            	<CFIF a_ins_premium NEQ "Call for quote!">
					<CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>
			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>

					</CFIF>
                <CFELSE>
	            	<CFIF a_ins_premium NEQ "Call for quote!">
                  		<CFSET a_ins_premium = #read_ins_calc.sale#>
					</CFIF>
              </CFIF>
            </CFIF>
          </cfif>
        </cfif>
      </CFOUTPUT>

<!--- figure out texas insurance rates along with R-8 credit --->
<CFIF (#pstate# eq "TX")>
<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM StateTexas WHERE a_to >= #x_final#
	  order by a_to
      </CFQUERY>


<!--- <cfdump var="#read_prev_ins_calc#"><br>
<cfdump var="#read_ins_calc#"><br>
<cfoutput>#numYears#</cfoutput><br> --->

   <cfif (#SearchType# eq "Purchase")>
   <CFSET a_ins_premium = #read_ins_calc.sale#>
   <cfelse>
   <cfset NumYears = DateDiff("yyyy", CreateDate(prev_loan_year, prev_loan_mo, 1), Now())>

   <CFQUERY datasource="#request.dsn#" NAME="read_prev_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #prev_loan_amt#
	  order by a_to
     </CFQUERY>
   <cfswitch expression="#NumYears#">
   <cfcase value="6">
   <CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .15)>
   </cfcase>
   <cfcase value="5">
   <CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .20)>
   </cfcase>
   <cfcase value="4">
   <CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .25)>
   </cfcase>
   <cfcase value="3">
   <CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .30)>
   </cfcase>
   <cfcase value="2">
   <CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .35)>
   </cfcase>
   <cfcase value="1">
   <CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .40)>
   </cfcase>




   <cfdefaultcase>
   <CFSET a_ins_premium = #read_ins_calc.sale#>
   </cfdefaultcase>
   </cfswitch>


   </cfif>


</cfif>

      <!--- =================================== --->
      <!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
      <!--- =================================== --->
      <table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>

      <tr>
        <td width=780 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>Closing Fees Calculator Result</B>
          </CENTER></TD>
      </TR>
      <cfif (#FORM.pstate# NEQ "CA") and (#FORM.pstate# NEQ "AL") and (#FORM.pstate# NEQ "CO") and (#FORM.pstate# NEQ "GA") and (#FORM.pstate# NEQ "MI") and (#FORM.pstate# NEQ "NY") and (#FORM.pstate# NEQ "NE") and (#FORM.pstate# NEQ "TN") and (#FORM.pstate# NEQ "AZ") and (#FORM.pstate# NEQ "WA")>
        <cfif #read_ins_calc.recordcount# gt "0" or 1 eq 1>
          <CFOUTPUT>
            <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
            SELECT * FROM recording_fees WHERE state = '#pstate#'
            </CFQUERY>
            <CFIF #read_rec_fees.recordcount# gt "1">
              <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
              </CFQUERY>
			<CFIF #read_rec_fees.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
			<CFELSEIF #read_rec_fees.recordcount# gt "1">
              <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city Like '#trim(pcity)#'
              </CFQUERY>
			  <CFIF #read_rec_fees.recordcount# eq 0>
              <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = 'All'
              </CFQUERY>
			 </cfif>
            </CFIF>
			</CFIF>

            <CFIF #read_rec_fees.recordcount# gt "0">

		    <CFIF IsDefined("read_rec_fees.mort_stamps")>

				<CFSET city_mort_stamps = #round(loanamt_float-estimated_loan)# * #read_rec_fees.mort_stamps#>
			<CFELSE>

               	<CFSET city_mort_stamps = 0>
			</CFIF>

			<cfif #searchType# eq "Purchase">
                <CFIF #read_rec_fees.transfer_tax# NEQ "0">
                  <cfif #read_rec_fees.recordcount# GT 1>
                    <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees2">
                    SELECT * FROM recording_fees WHERE state = '#pstate#' and county like '%#pcounty#%'
                    </CFQUERY>
					<CFIF #read_rec_fees2.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees2">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
			<CFELSEIF #read_rec_fees2.recordcount# gt "1">
                    <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees2">
                    SELECT * FROM recording_fees WHERE state = '#pstate#' and county like '%#pcounty#%' and city like '%#pcity#%'
                    </CFQUERY>
					<cfif #read_rec_fees2.recordcount# eq 0>
                    <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees2">
                    SELECT * FROM recording_fees WHERE state = '#pstate#' and county like '%#pcounty#%' and city = 'All'
                    </CFQUERY>
					</cfif>
					</cfif>
                    <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees2.transfer_tax#>
                    <cfelse>
                    <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
                  </cfif>
                  <cfelse>
                  <CFSET state_deed_1 = "0">
                  <!-- 1203 total -->
                </cfif>
                <cfelse>
                <CFSET state_deed_1 = "0">
              </cfif>
              <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
                <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
                <CFELSE>
                <Cfset rec_fee = "0">
              </cfif>
              <CFIF #read_rec_fees.release_rec_fee# NEQ "">
			  <Cfset rel_fee = "0">
			  <!--- commented out the below line to zero out releease fees --->
                <!--- <Cfset rel_fee = #read_rec_fees.release_rec_fee#> --->
                <CFELSE>
                <Cfset rel_fee = "0">
              </cfif>
              <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
                <CFSET a_fee_total = "0">
                <cfelse>
                <CFSET a_fee_total = "0">
              </cfif>
              <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
                <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
                <cfelse>
                <CFSET intang_tax = "0">
              </cfif>
              <cfelse>
              <CFSET rec_fee = "0">
              <CFSET rel_fee = "0">
              <CFSET city_mort_stamps = "0">
              <CFSET a_fee_total = "0">
              <CFSET state_deed_1 = "0">
              <CFSET intang_tax = "0">
            </cfif>
          </CFOUTPUT>
		  <cfif pstate eq "MD" and searchtype eq "Purchase">
		  <cfset city_mort_stamps = 0>
		  </cfif>
          <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
          SELECT * FROM company_billing_states WHERE company_id = '#comp_id#' and a_states = '#form.pstate#'
          </CFQUERY>
          <cfoutput query="read_this_sets_billing_states">
            <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
            SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
            </CFQUERY>
            <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

            <tr>

            <td width=780 align=center valign=top bgcolor=e6e6e6>

            <cfif #searchType# eq "Refinance">
              <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
                <tr>
                  <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><center>
                      <font size=2 color=blue face=arial><b>Refinance</b></font>
                    </center></td>
                </tr>
                <cfif #read_this_sets_billing_values.a_1101# neq "" OR #FORM.pstate# EQ "OR" OR #FORM.pstate# EQ "NV">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                      <cfif #FORM.pstate# EQ "OR" OR #FORM.pstate# EQ "NV" and #read_company.id# eq 729>
                        <cfif #read_ins_calc.escrow# EQ "">

                          <cfset a_1101 = 0>
                          <cfelse>

                          #NumberFormat(read_ins_calc.escrow, '_____.__')#
                          <cfset a_1101 = #read_ins_calc.escrow#>
                        </CFIF>
                        <CFELSE>
                        #NumberFormat(read_this_sets_billing_values.a_1101, '_____.__')#

                        <cfset a_1101 = #read_this_sets_billing_values.a_1101#>
                      </CFIF>
                    </td>
                  </tr>
                  <cfelse>

                  <cfset a_1101 = 0>
                </cfif>
<!--- <cfoutput>#line#</cfoutput> --->
                <cfif #read_this_sets_billing_values.a_1102# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1102, '_____.__')#
                      <cfset a_1102 = #read_this_sets_billing_values.a_1102#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1102 = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1103# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1103, '_____.__')#
                      <cfset a_1103 = #read_this_sets_billing_values.a_1103#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1103 = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1104# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1104, '_____.__')#
                      <cfset a_1104 = #read_this_sets_billing_values.a_1104#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1104 = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1105# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1106, '_____.__')#
                      <cfset a_1105 = #read_this_sets_billing_values.a_1105#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1105 = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1106# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1106, '_____.__')#
                      <cfset a_1106 = #read_this_sets_billing_values.a_1106#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1106 = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1107# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1107, '_____.__')#
                      <cfset a_1107 = #read_this_sets_billing_values.a_1107#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1107 = 0>
                </cfif>
                <CFQUERY datasource="#request.dsn#" NAME="read_states">
                SELECT * FROM first_title_states where st_abbrev = '#pstate#'
                </CFQUERY>
                <cfif #read_states.recordcount# gt 0>
                  <cfif (#a_ins_premium# neq "")>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                        <cfset a_ins_premium = #a_ins_premium#>
                      </td>
                    </tr>
                    <cfelse>
     	            	<CFIF a_ins_premium NEQ "Call for quote!">
			               <cfset a_ins_premium = 0>
						</cfif>
                  </cfif>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1111# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_text# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1111, '_____.__')#
                      <cfset a_1111 = #read_this_sets_billing_values.a_1111#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1111 = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1112# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_text# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1112, '_____.__')#

                      <cfset a_1112 = #read_this_sets_billing_values.a_1112#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1112 = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1113# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_text# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1113, '_____.__')#
                      <cfset a_1113 = #read_this_sets_billing_values.a_1113#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1113 = 0>
                </cfif>
                <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
				<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
                <cfif #rel_fee# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(rel_fee, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #a_fee_total# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(a_fee_total, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #city_mort_stamps# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
                  </tr>
                </cfif>


                <cfif #state_deed_1# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #intang_tax# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intangible Tax"> Intangible Tax </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1205# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_text# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1205, '_____.__')#
                      <cfset a_1205 = #read_this_sets_billing_values.a_1205#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1205 = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1303# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_text# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1303, '_____.__')#
                      <cfset a_1303 = #read_this_sets_billing_values.a_1303#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1303 = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1304# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_text# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1304, '_____.__')#
                      <cfset a_1304 = #read_this_sets_billing_values.a_1304#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1304 = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1305# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_text# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1305, '_____.__')#
                      <cfset a_1305 = #read_this_sets_billing_values.a_1305#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1305 = 0>
                </cfif>
                <CFQUERY datasource="#request.dsn#" NAME="read_states">
                SELECT * FROM first_title_states where st_abbrev = '#pstate#'
                </CFQUERY>
                <cfif #read_states.recordcount# gt 0>
                  <cfif #pstate# EQ "AR" OR #pstate# EQ "CO" OR #pstate# EQ "FL" OR #pstate# EQ "ME" OR #pstate# EQ "NE" OR #pstate# EQ "MT"OR #pstate# EQ "NH" OR #pstate# EQ "NJ" OR #pstate# EQ "NY" OR #pstate# EQ "TN" OR #pstate# EQ "VT">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00
                        <cfset alta8 = 25.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "ID">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 10.00
                        <cfset alta8 = 10.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "OH">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00
                        <cfset alta8 = 75.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "PA">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00
                        <cfset alta8 = 50.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "WI">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00
                        <cfset alta8 = 15.00>
                      </td>
                    </tr>
                    <cfelse>
                    <cfset alta8 = 0>
                  </cfif>
                  <cfif (#pstate# eq "FL") and (a_ins_premium NEQ "Call for quote!")>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1307. <img src="./images/info-01.gif" ALT="Alta 9 Endorsement fee"> Alta 9 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta9 =	 #a_ins_premium#/10>
                        #NumberFormat(alta9, '_____.__')#
                        <cfset alta9 = #alta9#>
                      </td>
                    </tr>
                    <cfelse>
                    <cfset alta9 = 0>
                  </cfif>
                  <tr>
                    <td width=250 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <b>TOTAL</b> </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                      <cfset total = #rec_fee# + #rel_fee# + #city_mort_stamps# + #a_fee_total# + #state_deed_1# + #intang_tax# + #alta9# + #alta8# + #a_1305# + #a_1304# + #a_1303# + #a_1205# + #a_1113#  + #a_1112#  + #a_1111#  + #a_1107# + #a_1106# + #a_1105# + #a_1104# + #a_1103# + #a_1102# + #a_1101#>
	            	<CFIF a_ins_premium NEQ "Call for quote!">
					  <cfset total = total+ #a_ins_premium#>
					  </cfif>
                      #NumberFormat(total, '_____.__')# </td>
                  </tr>
                  <CFIF #pstate# eq "AR">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>

                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <CFELSEIF #pstate# eq "CO">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
	            		<CFIF a_ins_premium NEQ "Call for quote!">
                        	<cfset alta4 =	 #a_ins_premium#/10>
						</cfif>
                        #NumberFormat(alta4, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
	            		<CFIF a_ins_premium NEQ "Call for quote!">
                        	<cfset alta41 =	 #a_ins_premium#/10>
						</cfif>
                        #NumberFormat(alta41, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
	            		<CFIF a_ins_premium NEQ "Call for quote!">
                        	<cfset alta5 =	 #a_ins_premium#/10>
						</cfif>
                        #NumberFormat(alta5, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
	            		<CFIF a_ins_premium NEQ "Call for quote!">
                        	<cfset alta51 =	 #a_ins_premium#/10>
						</cfif>
                        #NumberFormat(alta51, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 20.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 20.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 20.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "FL">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 9 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
	            		<CFIF a_ins_premium NEQ "Call for quote!">
                        	<cfset alta9FL =	 #a_ins_premium#/10>
						</cfif>
                        #NumberFormat(alta9FL, '_____.__')# </td>
                    </tr>
                    <cfelseif #pstate# eq "ID">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 35.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 35.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 10.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "ME" OR #pstate# eq "NE" or #pstate# eq "NH" or #pstate# eq "NJ">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "PA">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "MT">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "OH">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 9 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
	            		<CFIF a_ins_premium NEQ "Call for quote!">
                        	<cfset alta9OH =	 #a_ins_premium#/10>
						</cfif>
                        #NumberFormat(alta9OH, '_____.__')# </td>
                    </tr>
                    <cfelseif #pstate# eq "NY">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 9 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
	            		<CFIF a_ins_premium NEQ "Call for quote!">
                        	<cfset alta9NY =	 #a_ins_premium#/10>
						</cfif>
                        #NumberFormat(alta9NY, '_____.__')# </td>
                    </tr>
                    <cfelseif #pstate# eq "WV">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 60.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 60.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 60.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "WI">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                  </cfif>
                </cfif>
              </table>
              <cfelseif #searchtype# eq "purchase">
              <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
                <tr>
                  <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2  color=blue face=arial><b>Purchase</b></font> </td>
                </tr>
                <cfif #read_this_sets_billing_values.a_1101b# neq "" OR #FORM.pstate# EQ "OR" OR #FORM.pstate# EQ "NV">
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>



                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                      <cfif #FORM.pstate# EQ "OR" OR #FORM.pstate# EQ "NV" and #read_company.id# eq 729>
                        <cfif #read_ins_calc.escrow# EQ "">

                          <cfset a_1101b = 0>
                          <cfelse>
                          #NumberFormat(read_ins_calc.escrow, '_____.__')#
                          <cfset a_1101b = #read_ins_calc.escrow#>
                        </CFIF>
                        <CFELSE>
                        #NumberFormat(read_this_sets_billing_values.a_1101b, '_____.__')#
                        <cfset a_1101b = #read_this_sets_billing_values.a_1101b#>
                      </CFIF>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1101b = 0>
                </cfif>
<!--- <cfoutput>#line#</cfoutput> --->
                <cfif #read_this_sets_billing_values.a_1102b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1102b, '_____.__')#
                      <cfset a_1102b = #read_this_sets_billing_values.a_1102b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1102b = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1103b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1103b, '_____.__')#
                      <cfset a_1103b = #read_this_sets_billing_values.a_1103b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1103b = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1104b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1104b, '_____.__')#
                      <cfset a_1104b = #read_this_sets_billing_values.a_1104b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1104b = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1105b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1105b, '_____.__')#
                      <cfset a_1105b = #read_this_sets_billing_values.a_1105b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1105b = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1106b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1106b, '_____.__')#
                      <cfset a_1106b = #read_this_sets_billing_values.a_1106b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1106b = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1107b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1107b, '_____.__')#
                      <cfset a_1107b = #read_this_sets_billing_values.a_1107b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1107b = 0>
                </cfif>
                <CFQUERY datasource="#request.dsn#" NAME="read_states">
                SELECT * FROM first_title_states where st_abbrev = '#pstate#'
                </CFQUERY>
                <cfif #read_states.recordcount# gt 0>
                  <cfif (#a_ins_premium# neq "")>
				  <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                        <cfset a_ins_premium = #a_ins_premium#>
                      </td>
                    </tr>
                    <cfelse>
                    <cfset a_ins_premium = 0>
                  </cfif>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1111b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textb# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1111b, '_____.__')#
                      <cfset a_1111b = #read_this_sets_billing_values.a_1111b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1111b = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1112b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textb# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1112b, '_____.__')#
                      <cfset a_1112b = #read_this_sets_billing_values.a_1112b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1112b = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1113b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textb# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1113b, '_____.__')#
                      <cfset a_1113b = #read_this_sets_billing_values.a_1113b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1113b = 0>
                </cfif>
                <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
				<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
                <cfif #rel_fee# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(rel_fee, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #a_fee_total# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(a_fee_total, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #city_mort_stamps# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
                  </tr>
                </cfif>




				<!--- NJ Transfer Tax --->
	<cfif pstate eq "NJ">
	<cfset state_deed_1 = 0>
	  <cfif form.loanamt_float LT 350000>
		<cfif form.loanamt_float GT 150000>
		  <cfset state_deed_1 = 150000 * 0.004>
	    <cfelse>
	      <cfset state_deed_1 = form.loanamt_float * 0.004>
	    </cfif>

        <cfif form.loanamt_float GT 200000>
		  <cfset state_deed_1 = state_deed_1 + (50000 * 0.0067)>
		  <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 200000) * 0.0078)>
	    <cfelse>
	      <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 150000) * 0.0067)>
	    </cfif>

	  <cfelse>

	  <cfif form.loanamt_float GT 150000>
		<cfset state_deed_1 = 150000 * 0.0058>
	  <cfelse>
	    <cfset state_deed_1 = form.loanamt_float * 0.0058>
	  </cfif>

      <cfif form.loanamt_float GT 200000>
		<cfset state_deed_1 = state_deed_1 + (50000 * 0.0085)>
	  <cfelse>
	    <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 150000) * 0.0085)>
	  </cfif>

	  <cfif form.loanamt_float GT 550000>
		<cfset state_deed_1 = state_deed_1 + (250000 * 0.0096)>
	  <cfelse>
	    <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 2000000) * 0.0096)>
	  </cfif>

	  <cfif form.loanamt_float GT 850000>
		<cfset state_deed_1 = state_deed_1 + (300000 * 0.0106)>
	  <cfelse>
	    <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 550000) * 0.0106)>
	  </cfif>

	  <cfif form.loanamt_float GT 1000000>
		<cfset state_deed_1 = state_deed_1 + (150000 * 0.0116)>
		<cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 850000) * 0.0121)>
	  <cfelse>
	    <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 850000) * 0.0116)>
	  </cfif>
	  </cfif>
	  <cfif form.LOANAMT_FLOAT GT 1000000>
		<cfset state_deed_1 = state_deed_1 + (form.LOANAMT_FLOAT * 0.01)>
	</cfif>
	</cfif>
<!--- END NJ Transfer Tax --->
<!--- LA Transfer Tax --->
	<cfif pstate eq "LA" and url.PCNT eq "Orleans" and url.PCTY eq "New Orleans">
	<cfset state_deed_1 = 325>
	</cfif>
<!--- END LA Transfer Tax --->
<!--- HI Transfer Tax --->
	<cfif pstate eq "HI">
	<cfset state_deed_1 = 0>
	  <cfif form.loanamt_float LT 600000>
		<cfset state_deed_1 = form.loanamt_float * 0.0015>
	  <cfelseif form.loanamt_float LT 1000000>
	    <cfset state_deed_1 = form.loanamt_float * 0.0025>
      <cfelse>
	    <cfset state_deed_1 = form.loanamt_float * 0.0035>
	  </cfif>
	</cfif>
<!--- END HI Transfer Tax --->
<!--- DC Transfer Tax --->
	<cfif pstate eq "DC">
	<cfset state_deed_1 = 0>
	  <cfif form.loanamt_float LT 400000>
		<cfset state_deed_1 = form.loanamt_float * 0.022>
	  <cfelse>
	    <cfset state_deed_1 = form.loanamt_float * 0.029>
	  </cfif>
	</cfif>
<!--- END DC Transfer Tax --->

<!--- VT Transfer Tax --->
	<cfif pstate eq "VT">

	<cfset state_deed_1 = 0>
	  <cfif form.loanamt_float GT 100000>
		<cfset state_deed_1 = 100000 * 0.005>
		<cfset state_deed_1 = state_deed_1 + ((form.loanamt_float-100000) * 0.0125)>
	  <cfelse>
	    <cfset state_deed_1 = form.loanamt_float * 0.005>
	  </cfif>
	</cfif>
<!--- END VT Transfer Tax --->


<!--- CT Transfer Tax --->
	<cfif pstate eq "CT">
	<cfset state_deed_1 = 0>
	  <cfif form.loanamt_float GT 800000>
		<cfset state_deed_1 = 800000 * 0.0075>
		<cfset state_deed_1 = form.loanamt_float-800000 * 0.0125>
	  <cfelse>
	    <cfset state_deed_1 = form.loanamt_float * 0.0075>
	  </cfif>
	</cfif>
<!--- END CT Transfer Tax --->


                <cfif #state_deed_1# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #intang_tax# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1205b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textb# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1205b, '_____.__')#
                      <cfset a_1205b = #read_this_sets_billing_values.a_1205b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1205b = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1303b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textb# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1303b, '_____.__')#
                      <cfset a_1303b = #read_this_sets_billing_values.a_1303b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1303b = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1304b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textb# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1304b, '_____.__')#
                      <cfset a_1304b = #read_this_sets_billing_values.a_1304b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1304b = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1305b# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textb# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1305b, '_____.__')#
                      <cfset a_1305b = #read_this_sets_billing_values.a_1305b#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1305b = 0>
                </cfif>
                <CFQUERY datasource="#request.dsn#" NAME="read_states">
                SELECT * FROM first_title_states where st_abbrev = '#pstate#'
                </CFQUERY>
                <cfif #read_states.recordcount# gt 0>
                  <cfif #pstate# EQ "AR" OR #pstate# EQ "CO" OR #pstate# EQ "FL" OR #pstate# EQ "ME" OR #pstate# EQ "NE" OR #pstate# EQ "MT"OR #pstate# EQ "NH" OR #pstate# EQ "NJ" OR #pstate# EQ "NY" OR #pstate# EQ "TN" OR #pstate# EQ "VT">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00
                        <cfset alta8 = 25.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "ID">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 10.00
                        <cfset alta8 = 10.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "OH">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00
                        <cfset alta8 = 75.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "PA">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00
                        <cfset alta8 = 50.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "WI">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00
                        <cfset alta8 = 15.00>
                      </td>
                    </tr>
                    <cfelse>
                    <cfset alta8 = 0>
                  </cfif>
                  <cfif #pstate# eq "FL">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1307. <img src="./images/info-01.gif" ALT="Alta 9 Endorsement fee"> Alta 9 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta9 =	 #a_ins_premium#/10>
                        #NumberFormat(alta9, '_____.__')#
                        <cfset alta9 = #alta9#>
                      </td>
                    </tr>
                    <cfelse>
                    <cfset alta9 = 0>
                  </cfif>
                  <tr>
                    <td width=250 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <b>TOTAL</b> </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                      <cfset total = #rec_fee# + #rel_fee# + #city_mort_stamps# + #a_fee_total# + #state_deed_1# + #intang_tax# + #alta9# + #alta8# + #a_1305b# + #a_1304b# + #a_1303b# + #a_1205b# + #a_1113b#  + #a_1112b#  + #a_1111b#  + #a_1107b# + #a_1106b# + #a_1105b# + #a_1104b# + #a_1103b# + #a_1102b# + #a_1101b# + #a_ins_premium#>
                      #NumberFormat(total, '_____.__')# </td>
                  </tr>
                  <CFIF #pstate# eq "AR">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <CFELSEIF #pstate# eq "CO">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta4 =	 #a_ins_premium#/10>
                        #NumberFormat(alta4, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta41 =	 #a_ins_premium#/10>
                        #NumberFormat(alta41, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta5 =	 #a_ins_premium#/10>
                        #NumberFormat(alta5, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta51 =	 #a_ins_premium#/10>
                        #NumberFormat(alta51, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 20.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 20.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 20.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "FL">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 9 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta9FL =	 #a_ins_premium#/10>
                        #NumberFormat(alta9FL, '_____.__')# </td>
                    </tr>
                    <cfelseif #pstate# eq "ID">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 35.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 35.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 10.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "ME" OR #pstate# eq "NE" or #pstate# eq "NH" or #pstate# eq "NJ">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "PA">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "MT">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "OH">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 9 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta9OH =	 #a_ins_premium#/10>
                        #NumberFormat(alta9OH, '_____.__')# </td>
                    </tr>
                    <cfelseif #pstate# eq "NY">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 9 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta9NY =	 #a_ins_premium#/10>
                        #NumberFormat(alta9NY, '_____.__')# </td>
                    </tr>
                    <cfelseif #pstate# eq "WV">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 60.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 60.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 60.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "WI">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                  </cfif>
                </cfif>
              </table>
              <!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
              <cfelse>
              <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
                <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
                <tr>
                  <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial><b>Second Mortgage<b></font> </td>
                </tr>
                <cfif #read_this_sets_billing_values.a_1101c# neq "" or #FORM.pstate# EQ "OR" OR #FORM.pstate# EQ "NV">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                      <cfif #FORM.pstate# EQ "OR" OR #FORM.pstate# EQ "NV" and #read_company.id# eq 729>
                        <cfif #read_ins_calc.escrow# EQ "">

                          <cfset a_1101c = 0>
                          <cfelse>
                          #NumberFormat(read_ins_calc.escrow, '_____.__')#

                          <cfset a_1101c = #read_ins_calc.escrow#>
                        </cfif>
                        <CFELSE>
                        #NumberFormat(read_this_sets_billing_values.a_1101c, '_____.__')#

                        <cfset a_1101c = #read_this_sets_billing_values.a_1101c#>
                      </CFIF>
                    </td>
                  </tr>
                  <cfelse>

                  <cfset a_1101c = 0>
                </cfif>
<!--- <cfoutput>#line#</cfoutput>	 --->
                <cfif #read_this_sets_billing_values.a_1102c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1102c, '_____.__')#
                      <cfset a_1102c = #read_this_sets_billing_values.a_1102c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1102c = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1103c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1103c, '_____.__')#
                      <cfset a_1103c = #read_this_sets_billing_values.a_1103c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1103c = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1104c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1104c, '_____.__')#
                      <cfset a_1104c = #read_this_sets_billing_values.a_1104c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1104c = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1105c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1105c, '_____.__')#
                      <cfset a_1105c = #read_this_sets_billing_values.a_1105c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1105c = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1106c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1106c, '_____.__')#
                      <cfset a_1106c = #read_this_sets_billing_values.a_1106c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1106c = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1107c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1107c, '_____.__')#
                      <cfset a_1107c = #read_this_sets_billing_values.a_1107c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1107c = 0>
                </cfif>
                <CFQUERY datasource="#request.dsn#" NAME="read_states">
                SELECT * FROM first_title_states where st_abbrev = '#pstate#'
                </CFQUERY>
                <cfif #read_states.recordcount# gt 0>
                  <cfif (#a_ins_premium# neq "")>
				  <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                        <cfset a_ins_premium = #a_ins_premium#>
                      </td>
                    </tr>
                    <cfelse>
                    <cfset a_ins_premium = 0>
                  </cfif>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1111c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textc# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1111c, '_____.__')#
                      <cfset a_1111c = #read_this_sets_billing_values.a_1111c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1111c = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1112c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textc# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1112c, '_____.__')#
                      <cfset a_1112c = #read_this_sets_billing_values.a_1112c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1112c = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1113c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textc# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1113c, '_____.__')#
                      <cfset a_1113c = #read_this_sets_billing_values.a_1113c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1113c = 0>
                </cfif>
                <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
				<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
                <cfif #rel_fee# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(rel_fee, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #a_fee_total# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(a_fee_total, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #city_mort_stamps# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
                  </tr>
                </cfif>






                <cfif #state_deed_1# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #intang_tax# neq "0">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
                  </tr>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1205c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textc# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1205c, '_____.__')#
                      <cfset a_1205c = #read_this_sets_billing_values.a_1205c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1205c = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1303c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textc# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1303c, '_____.__')#
                      <cfset a_1303c = #read_this_sets_billing_values.a_1303c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1303c = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1304c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textc# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1304c, '_____.__')#
                      <cfset a_1304c = #read_this_sets_billing_values.a_1304c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1304c = 0>
                </cfif>
                <cfif #read_this_sets_billing_values.a_1305c# neq "">
                  <tr>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textc# </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(read_this_sets_billing_values.a_1305c, '_____.__')#
                      <cfset a_1305c = #read_this_sets_billing_values.a_1305c#>
                    </td>
                  </tr>
                  <cfelse>
                  <cfset a_1305c = 0>
                </cfif>
                <CFQUERY datasource="#request.dsn#" NAME="read_states">
                SELECT * FROM first_title_states where st_abbrev = '#pstate#'
                </CFQUERY>
                <cfif #read_states.recordcount# gt 0>
                  <cfif #pstate# EQ "AR" OR #pstate# EQ "CO" OR #pstate# EQ "FL" OR #pstate# EQ "ME" OR #pstate# EQ "NE" OR #pstate# EQ "MT"OR #pstate# EQ "NH" OR #pstate# EQ "NJ" OR #pstate# EQ "NY" OR #pstate# EQ "TN" OR #pstate# EQ "VT">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00
                        <cfset alta8 = 25.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "ID">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 10.00
                        <cfset alta8 = 10.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "OH">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00
                        <cfset alta8 = 75.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "PA">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00
                        <cfset alta8 = 50.00>
                      </td>
                    </tr>
                    <cfelseif #pstate# EQ "WI">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1306. <img src="./images/info-01.gif" ALT="Alta 8.1 Endorsement fee"> Alta 8.1 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00
                        <cfset alta8 = 15.00>
                      </td>
                    </tr>
                    <cfelse>
                    <cfset alta8 = 0>
                  </cfif>
                  <cfif #pstate# eq "FL">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1307. <img src="./images/info-01.gif" ALT="Alta 9 Endorsement fee"> Alta 9 Endorsement fee </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta9 =	 #a_ins_premium#/10>
                        #NumberFormat(alta9, '_____.__')#
                        <cfset alta9 = #alta9#>
                      </td>
                    </tr>
                    <cfelse>
                    <cfset alta9 = 0>
                  </cfif>
                  <tr>
                    <td width=250 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <b> TOTAL</b> </td>
                    <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                      <cfset total = #rec_fee# + #rel_fee# + #city_mort_stamps# + #a_fee_total# + #state_deed_1# + #intang_tax# + #alta9# + #alta8# + #a_1305c# + #a_1304c# + #a_1303c# + #a_1205c# + #a_1113c#  + #a_1112c#  + #a_1111c#  + #a_1107c# + #a_1106c# + #a_1105c# + #a_1104c# + #a_1103c# + #a_1102c# + #a_1101c# + #a_ins_premium#>
                      #NumberFormat(total, '_____.__')# </td>
                  </tr>
                  <CFIF #pstate# eq "AR">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <CFELSEIF #pstate# eq "CO">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta4 =	 #a_ins_premium#/10>
                        #NumberFormat(alta4, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta41 =	 #a_ins_premium#/10>
                        #NumberFormat(alta41, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta5 =	 #a_ins_premium#/10>
                        #NumberFormat(alta5, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta51 =	 #a_ins_premium#/10>
                        #NumberFormat(alta51, '_____.__')# </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 20.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 20.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 20.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "FL">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 9 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta9FL =	 #a_ins_premium#/10>
                        #NumberFormat(alta9FL, '_____.__')# </td>
                    </tr>
                    <cfelseif #pstate# eq "ID">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 35.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 35.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 10.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "ME" OR #pstate# eq "NE" or #pstate# eq "NH" or #pstate# eq "NJ">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "PA">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "MT">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 50.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "OH">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 75.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 9 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta9OH =	 #a_ins_premium#/10>
                        #NumberFormat(alta9OH, '_____.__')# </td>
                    </tr>
                    <cfelseif #pstate# eq "NY">
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 25.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 9 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial>
                        <cfset alta9NY =	 #a_ins_premium#/10>
                        #NumberFormat(alta9NY, '_____.__')# </td>
                    </tr>
                    <cfelseif #pstate# eq "WV">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 60.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 60.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 60.00 </td>
                    </tr>
                    <cfelseif #pstate# eq "WI">
                    <tr>
                      <td COLSPAN=2 width=500 align=center valign=top bgcolor=elelel><font size=2 color=blue face=arial> ALTA Endorsement Fees for <b>#pstate#</b> </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 4.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 5.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 6.2 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                    <tr>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> ALTA 8.1 </td>
                      <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> 15.00 </td>
                    </tr>
                  </cfif>
                </cfif>
              </table>
            </cfif>
          </cfoutput> <CFOUTPUT>
            <cfif #loc# eq 4>
              <table>

              <tr>
                <td bgcolor="d3d3d3" width=780 align=center valign=top><FONT FACE=verdana SIZE=2 color="black">
<!--- <cfoutput>#line#</cfoutput> ---> <br><br><br>
				   <b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
				 </td>
              </tr>
              <cfelse>
              <tr>
                <td bgcolor="d3d3d3" width=780 align=center valign=top>
<!--- <cfoutput>#line#</cfoutput> ---> <br><br><br>
				   <FONT FACE=verdana SIZE=2 color="black"> <b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b>
				</td>
              </tr>
            </cfif>
            <tr>
              <td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1><A href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A> </td>
            </tr>
            </table>

          </CFOUTPUT>
          <cfelse>
          <tr>
            <td width=780 colspan=3 align=center valign=top bgcolor=e1e1e1><FONT FACE=verdana SIZE=2 color="black"> Sorry, there is no match of the loan amout you entered with any fees in out database. </td>
          </tr>
        </cfif>
        <cfelseif #FORM.pstate# EQ "AL">
        <cfoutput>

          <FORM METHOD=POST ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=17&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&prev_loan_amt=#url.prev_loan_amt#&prev_loan_mo=#url.prev_loan_mo#&prev_loan_year=#url.prev_loan_year#&pcnt=#pcounty#&pcty=#pcity#&loanamt_float=#FORM.loanamt_float#">

        </cfoutput>
        <TR>
          <td bgcolor=white width=780 align=center valign=top><font SIZE="2" face="arial"> Please choose a county. </font> </TD>
        </TR>
        <TR>
          <td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">
            <input type=radio name="input_val" value = "0" CHECKED>
            Metro Rates: Cherokee, Colbert, Dekalb, Etowah, Franklin, Jackson, Lauderdale, Lawrence, Limestone, Madison, Marion, Marshall and Winston Counties <BR>
            <input type=radio name="input_val" value = "1">
            National Rates: All Other Counties<BR>
          </TD>
        </tr>
        <TR>
          <td bgcolor=d3d3d3 width=780 align=right valign=top><INPUT TYPE=image src="./images/button_continue.gif" border=0>
          </td>
        <TR>
          </form>
          <!---California--->
          <cfelseif #FORM.pstate# EQ "CA">
          <cfoutput>
            <FORM METHOD=POST ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=17&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&prev_loan_amt=#url.prev_loan_amt#&prev_loan_mo=#url.prev_loan_mo#&prev_loan_year=#url.prev_loan_year#&pcnt=#pcounty#&pcty=#pcity#&loanamt_float=#FORM.loanamt_float#&loanamt_float4=#FORM.loanamt_float4#">
          </cfoutput>
        <TR>
          <td bgcolor=white width=780 align=center valign=top><font SIZE="2" face="arial"> Please choose a county. </font> </TD>
        </TR>
        <TR>
          <td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">
            <input type=radio name="input_val" value = "0" CHECKED>
            Zone 1: Butte, Colusa, Del Norte, Glenn, Humboldt, and Lake Counties <BR>
            <input type=radio name="input_val" value = "1">
            All Other Zones<BR>
          </TD>
        </tr>
        <TR>
          <td bgcolor=d3d3d3 width=780 align=right valign=top><INPUT TYPE=image src="./images/button_continue.gif" border=0>
          </td>
        <TR>
          </form>
          <cfelseif #FORM.pstate# EQ "CO">
          <cfoutput>
            <FORM METHOD=POST ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=6&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&prev_loan_amt=#url.prev_loan_amt#&pcnt=#pcounty#&pcty=#pcity#&loanamt_float=#loanamt_float#">
            <input type="hidden" name="loanamt_float" value="#loanamt_float#">
          </cfoutput>
        <TR>
          <td bgcolor=white width=780 align=center valign=top><font SIZE="2" face="arial"> Please choose a county. </font> </TD>
        </TR>
        <TR>
          <td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">
            <input type=radio name="input_val" value = "13" CHECKED>
            Adams, Arapahoe, Broomfield, Clear Creek, Denver, Douglas, Elbert, Jefferson Counties<BR>
            <input type=radio name="input_val" value = "14">
            Alamosa, Conejos, Rio Grande and Saguache Counties<br>
            <input type=radio name="input_val" value = "15">
            Archuleta and Mineral Counties<br>
            <input type=radio name="input_val" value = "16">
            Boulder County<br>
            <input type=radio name="input_val" value = "17">
            Chaffee County<br>
            <input type=radio name="input_val" value = "30">
            Custer, Fremont Counties<br>
            <input type=radio name="input_val" value = "31">
            Dolorse, LaPlata, Montezuma Counties<br>
            <input type=radio name="input_val" value = "32">
            Eagle, Garfield, Grand, Jackson, Lake, Park, Pitkin, Routt, Summit Counties<br>
            <input type=radio name="input_val" value = "33">
            El Paso County<br>
            <input type=radio name="input_val" value = "34">
            Moffatt County<br>
            <input type=radio name="input_val" value = "35">
            Larimer County<br>
            <input type=radio name="input_val" value = "36">
            Montrose, Ouray Counties<br>
            <input type=radio name="input_val" value = "37">
            Phillips County<br>
            <input type=radio name="input_val" value = "38">
            Pueblo County<br>
            <input type=radio name="input_val" value = "39">
            Rio Blanco County<br>
            <input type=radio name="input_val" value = "40">
            Weld County<br>
            <input type=radio name="input_val" value = "41">
            All other CO counties<br>
          </TD>
        </tr>
        <TR>
          <td bgcolor=d3d3d3 width=780 align=right valign=top><INPUT TYPE=image src="./images/button_continue.gif" border=0>
          </td>
        <TR>
          </form>
          <cfelseif #FORM.pstate# EQ "GA">
          <cfoutput>
            <FORM METHOD=POST ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=2&searchtype=#FORM.searchtype#&pstate=#FORM.pstate#&prev_loan_amt=#url.prev_loan_amt#&pcnt=#pcounty#&pcty=#pcity#&loanamt_float=#loanamt_float#&prev_loan_mo=#url.prev_loan_mo#&prev_loan_year=#url.prev_loan_year#">
            <input type="hidden" name="loanamt_float" value="#loanamt_float#">
          </cfoutput>
        <TR>
          <td bgcolor=white width=780 align=center valign=top><font SIZE="2" face="arial"> Please choose a county. </font> </TD>
        </TR>
        <TR>
          <td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">
            <input type=radio name="input_val" value = "2" CHECKED>
            Metro Rates: Fulton, Cobb, Clayton, Cherokee, Dekalb, Gwinnett, Henry, Douglas, Forsyth, Paulding and Carroll Counties <BR>
            <input type=radio name="input_val" value = "3">
            National Rates: All Other Counties<BR>
          </TD>
        </tr>
        <TR>
          <td bgcolor=d3d3d3 width=780 align=right valign=top><INPUT TYPE=image src="./images/button_continue.gif" border=0>
          </td>
        <TR>
          </form>
          <cfelseif #FORM.pstate# EQ "MI">
          <cfoutput>
            <FORM METHOD=POST ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=3&searchtype=#searchtype#&pstate=#pstate#&pcnt=#pcounty#&pcty=#pcity#&loanamt_float=#loanamt_float#&lnmt4=#loanamt_float4#&loanamt_float4=#loanamt_float4#&prev_loan_amt=#url.prev_loan_amt#&prev_loan_mo=#url.prev_loan_mo#&prev_loan_year=#url.prev_loan_year#">
          </cfoutput>
        <TR>
          <td bgcolor=white width=780 align=center valign=top><font SIZE="2" face="arial"> Please choose a county. </font> </TD>
        </TR>
        <TR>
          <td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">
            <input type=radio name="input_val" value = "4" CHECKED>
            Metro Rates: Allegan, Barry, Clinton, Eaton, Grand Traverse, Ingham, Ionia, Kent, Leelanau, Montcalm, Muskegon, Newaygo and Ottawa Counties <BR>
            <input type=radio name="input_val" value = "6">
            Metro Rates: Wayne<BR>
			<input type=radio name="input_val" value = "5">
            National Rates: All Other Counties<BR>
          </TD>
        </tr>
        <TR>
          <td bgcolor=d3d3d3 width=780 align=right valign=top><INPUT TYPE=image src="./images/button_continue.gif" border=0>
          </td>
        <TR>
          </form>
          <cfelseif #FORM.pstate# EQ "NY">
          <cfoutput>
            <FORM METHOD=POST ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=4&searchtype=#searchtype#&pstate=#pstate#&pcnt=#pcounty#&pcty=#pcity#&loanamt_float=#loanamt_float#&prev_loan_amt=#url.prev_loan_amt#&prev_loan_mo=#url.prev_loan_mo#&prev_loan_year=#url.prev_loan_year#&estimated_loan=#form.estimated_loan#">
			<input type="hidden" name="estimated_loan" value="#form.estimated_loan#">
          </cfoutput>
        <TR>
          <td bgcolor=white width=780 align=center valign=top><font SIZE="2" face="arial"> Please choose a county. </font> </TD>
        </TR>
        <TR>
          <td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">
            <input type=radio name="input_val"   value = "6" CHECKED>
            Albany, Bronx, Columbia, Dutchess, Greene, Kings, Nassau, New York, Orange, Putnam, Queens, Rensselaer, Richmond, Rockland, Suffolk, Sullivan, Ulster or Westchester<BR>
            <BR>
            <input type=radio name="input_val"   value = "7">
            Allegany, Broome, Cattaraugus, Cayuga, Chautauqua, Chemung, Chenango, Clinton, Cortland, Delaware, Erie, Essex, Franklin, Fulton, Genesee, Hamilton, Herkimer, Jefferson, Lewis, Livingston, Madison, Monroe, Montgomery, Niagara, Oneida, Onodaga, Ontario, Orleans, Oswego, Otsego, St. Lawrence, Saratoga, Schenectady, Schoharie, Schuyler, Seneca, Steuben, Tioga, Tompkins, Warren, Washington, Wayne, Wyoming or Yates<BR>
          </TD>
        </tr>
        <TR>
          <td bgcolor=d3d3d3 width=498 align=right valign=top><INPUT TYPE=image src="./images/button_continue.gif" border=0>
          </td>
        <TR>
          </form>
          <cfelseif #FORM.pstate# EQ "NE">
          <cfoutput>
            <FORM METHOD=POST ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=15&searchtype=#searchtype#&pstate=#pstate#&pcnt=#pcounty#&pcty=#pcity#&loanamt_float=#loanamt_float#&prev_loan_amt=#url.prev_loan_amt#&prev_loan_mo=#url.prev_loan_mo#&prev_loan_year=#url.prev_loan_year#">
          </cfoutput>
        <TR>

          <td bgcolor=white width=780 align=center valign=top><font SIZE="2" face="arial"> Please choose a county. </font> </TD>
        </TR>
        <TR>
          <td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">
            <input type=radio name="input_val"   value = "150" CHECKED>
            Douglas, Sarpy, Washington, Dodge, Lancaster<BR>
            <input type=radio name="input_val"   value = "151">
            National Rates: All other counties<BR>
          </TD>
        </tr>
        <TR>
          <td bgcolor=d3d3d3 width=780 align=right valign=top><INPUT TYPE=image src="./images/button_continue.gif" border=0>
          </td>
        <TR>
          </form>
        </TD>

        </TR>

        <cfelseif #FORM.pstate# EQ "TN">
        <cfoutput>
          <FORM METHOD=POST ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=5&searchtype=#searchtype#&pstate=#pstate#&pcnt=#pcounty#&pcty=#pcity#&loanamt_float=#loanamt_float#&prev_loan_amt=#url.prev_loan_amt#&prev_loan_mo=#url.prev_loan_mo#&prev_loan_year=#url.prev_loan_year#">

        </cfoutput>
        <TR>
          <td bgcolor=white width=780 align=center valign=top><font SIZE="2" face="arial"> Please choose a county. </font> </TD>
        </TR>
        <TR>
          <td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">
            <input type=radio name="input_val"   value = "8" CHECKED>
            Davidson County<BR>
            <input type=radio name="input_val"   value = "9" >
            Hamilton County<BR>
            <input type=radio name="input_val"   value = "10" >
            Knox County<BR>
            <input type=radio name="input_val"   value = "11">
            Shelby County<BR>
            <input type=radio name="input_val"   value = "12">
            National Rates: All other counties<BR>
          </TD>
        </tr>
        <TR>
          <td bgcolor=d3d3d3 width=780 align=right valign=top><INPUT TYPE=image src="./images/button_continue.gif" border=0>
          </td>
        <TR>
          </form>
          </TD>
        </TR>




        <cfelseif #FORM.pstate# EQ "WA">
        <cfoutput>
          <FORM METHOD=POST ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=8&searchtype=#searchtype#&pstate=#pstate#&pcnt=#pcounty#&pcty=#pcity#&loanamt_float=#loanamt_float#&prev_loan_amt=#url.prev_loan_amt#&prev_loan_mo=#url.prev_loan_mo#&prev_loan_year=#url.prev_loan_year#">

        </cfoutput>
        <TR>
          <td bgcolor=white width=780 align=center valign=top><font SIZE="2" face="arial"> Please choose a county. </font> </TD>
        </TR>
        <TR>
          <td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">
            <input type=radio name="input_val"   value = "50" CHECKED>
            Douglas, Chelan Counties<BR>
            <input type=radio name="input_val"   value = "51" >
            Grays Harbor County<BR>
            <input type=radio name="input_val"   value = "52" >
            Lewis County<BR>
            <input type=radio name="input_val"   value = "53">
            Spokane County<BR>
            <input type=radio name="input_val"   value = "54">
            King, Pierce, Snohomish Counties<BR>
            <input type=radio name="input_val"   value = "55">
            Clark, Cowlitz Counties<BR>
            <input type=radio name="input_val"   value = "56">
            Whitman County<BR>
            <input type=radio name="input_val"   value = "57">
            National Rates: All other counties<BR>
          </TD>
        </tr>
        <TR>
          <td bgcolor=d3d3d3 width=780 align=right valign=top><INPUT TYPE=image src="./images/button_continue.gif" border=0>
          </td>
        <TR>
          </form>
          </TD>
        </TR>


        <cfelseif #FORM.pstate# EQ "AZ">
        <cfoutput>
          <FORM METHOD=POST ACTION="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loc=#loc#&a_trigger=7&searchtype=#searchtype#&pstate=#pstate#&pcnt=#pcounty#&pcty=#pcity#&loanamt_float=#loanamt_float#&loanamt_float4=#loanamt_float4#&prev_loan_amt=#url.prev_loan_amt#&prev_loan_mo=#url.prev_loan_mo#&prev_loan_year=#url.prev_loan_year#">

        </cfoutput>
        <TR>
          <td bgcolor=white width=780 align=center valign=top><font SIZE="2" face="arial"> Please choose a county. </font> </TD>
        </TR>
        <TR>
          <td bgcolor=elelel width=780 align=left valign=top><font SIZE="2" face="arial">
            <cfif #comp_id# eq 729>
              <input type=radio name="input_val"   value = "18" CHECKED>
              Apache, Cochise, Gila, Graham, Greenlee, Maricopa, Mohave, Pina, Pinal<BR>
              <input type=radio name="input_val"   value = "19" >
              Yuma, Lapaz<BR>
              <input type=radio name="input_val"   value = "20">
              Coconino, Yavapai<BR>
              <input type=radio name="input_val"   value = "21">
              Navajo<BR>
              <input type=radio name="input_val"   value = "22">
              Santa Cruz<BR>
              <cfelse>
              <input type=radio name="input_val"   value = "18" CHECKED>
              Maricopa, Pima, Pinal Counties<BR>
              <input type=radio name="input_val"   value = "19" >
              Coconino County<BR>
              <input type=radio name="input_val"   value = "20" >
              Cochise County<BR>
              <input type=radio name="input_val"   value = "21">
              Yavapai County<BR>
              <input type=radio name="input_val"   value = "22">
              Mohave County<BR>
              <input type=radio name="input_val"   value = "23">
              National Rates: All other counties<BR>
            </cfif>
          </TD>
        </tr>
        <TR>
          <td bgcolor=d3d3d3 width=780 align=right valign=top><INPUT TYPE=image src="./images/button_continue.gif" border=0>
          </td>
        <TR>
          </form>
          </TD>
        </TR>
        <cfelse>
        <font SIZE="2" face="arial"> This State is not served by our company. </font>
      </cfif>
      </table>

    </cfif>
    <CFIF #a_trigger# EQ "1">
      <cfif isdefined ("form.input_val") and #FORM.input_val# is "0">
        <CFSET a_tble_to_read = "StateAlabamaMetro">
        <cfelse>
        <CFSET a_tble_to_read = "StateAlabamaState">
      </cfif>
      <CFSET   x  = #Round(loanamt_float)#>
      <CFSET   x_len  = #Len(x)#>
      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>
      <!--- Now decide which field to use to do the calc  --->
      <!--- then Query the proper table                   --->
      <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>





      <!--- * #loanamt_float# --->
      <CFIF #searchtype# EQ "Refinance">
        <CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>

			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>
        <CFELSE>
        <CFSET a_ins_premium = #read_ins_calc.sale#>
      </CFIF>



      <CFelseIF #a_trigger# EQ "2">
      <cfif #comp_id# eq 729 >
        <CFSET a_tble_to_read = "StateGeorgiaStewart">
        <cfelse>
        <cfif isdefined ("form.input_val") and #FORM.input_val# is "2">
          <CFSET a_tble_to_read = "StateGeorgiaMetro">
          <cfelse>
          <CFSET a_tble_to_read = "StateGeorgiaState">
        </cfif>
      </cfif>
      <CFSET   x  = #Round(loanamt_float)#>
      <CFSET   x_len  = #Len(x)#>
      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>
      <!--- Now decide which field to use to do the calc  --->
      <!--- then Query the proper table                   --->
      <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
      <!--- * #loanamt_float# --->
      <CFIF #searchtype# EQ "Refinance">
        <CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>
			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>
        <CFELSE>
        <CFSET a_ins_premium = #read_ins_calc.sale#>
      </CFIF>
      <!---California--->
      <CFelseIF #a_trigger# EQ "17">
      <cfif isdefined ("form.input_val") and #FORM.input_val# is "0">
        <CFSET a_tble_to_read = "StateCaliforniaZone1">
        <cfelse>
        <CFSET a_tble_to_read = "StateCaliforniaZone2">
      </cfif>

      <CFSET   x  = #Round(loanamt_float)#>
      <CFSET   x_len  = #Len(x)#>
      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>



      <!--- Now decide which field to use to do the calc  --->
      <!--- then Query the proper table                   --->
      <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
      <!--- * #loanamt_float# --->
      <CFIF #searchtype# EQ "Refinance">
       <CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>
			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>
        <CFELSE>
        <CFSET a_ins_premium = #read_ins_calc.sale#>

		<cfif pstate eq "CA">
		<CFSET   x  = #Round(loanamt_float4)#>
      <CFSET   x_len  = #Len(x)#>

      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>
      <!--- Now decide which field to use to do the calc  --->
      <!--- then Query the proper table                   --->
      <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
		<cfset alta_loan_policy_rate = read_ins_calc.sale / 3 + 110>
		<cfif a_ins_premium NEQ 'Call for Quote!'>
		<CFSET a_ins_premium = a_ins_premium + alta_loan_policy_rate>
		</cfif>
		</cfif>
		</CFIF>
      <!---End California --->
      <!---Michigan--->

      <CFelseIF #a_trigger# EQ "3">
	  <!--- <CFOUTPUT>a_trigger = #a_trigger#<br>
	  form.input_val = #form.input_val#<br>
	  loanamt_float = #loanamt_float#<br>
	  loanamt_float4 = #loanamt_float4#<br></CFOUTPUT>
	  <cfabort> --->
      <cfif isdefined ("form.input_val") and #FORM.input_val# is "4">
        <CFSET a_tble_to_read = "StateMichiganZone2">
		<cfelseif #FORM.input_val# is "6">
		<CFSET a_tble_to_read = "StateMichiganZone3">
        <cfelse>
        <CFSET a_tble_to_read = "StateMichiganZone1">
      </cfif>

      <CFSET   x  = #Round(loanamt_float)#>
      <CFSET   x_len  = #Len(x)#>
      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>



      <!--- Now decide which field to use to do the calc  --->
      <!--- then Query the proper table                   --->
      <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
      <!--- * #loanamt_float# --->
      <CFIF #searchtype# EQ "Refinance">
      <CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>
			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>
        <CFELSE>
        <CFSET a_ins_premium = #read_ins_calc.sale#>

		<cfif pstate eq "MI">
		<CFIF #searchtype# EQ "Purchase">
		<CFSET   x  = #Round(loanamt_float4)#>
		<cfelse>
		<CFSET   x  = #Round(loanamt_float)#>
		</cfif>
      <CFSET   x_len  = #Len(x)#>
      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>

        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>
      <!--- Now decide which field to use to do the calc  --->
      <!--- then Query the proper table                   --->
      <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
		<cfset alta_loan_policy_rate = read_ins_calc.refinance * .40>
		<cfif a_ins_premium NEQ 'Call for Quote!'>
		<CFIF #searchtype# EQ "Purchase">
		<CFSET a_ins_premium = a_ins_premium + alta_loan_policy_rate>
		<cfelse>
		<CFSET a_ins_premium = read_ins_calc.second_mortgage>
		</cfif>
		</cfif>
		</cfif>
		</CFIF>
      <!---End Michigan --->
      <CFelseIF #a_trigger# EQ "4">


      <cfif isdefined ("form.input_val") and #FORM.input_val# is "6">
        <CFSET a_tble_to_read = "StateNewYorkZone2">
        <cfelse>
        <CFSET a_tble_to_read = "StateNewYorkZone1">
      </cfif>
      <CFSET   x  = #Round(loanamt_float)#>
      <CFSET   x_len  = #Len(x)#>
      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>
      <!--- Now decide which field to use to do the calc  --->
      <!--- then Query the proper table                   --->
      <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
      <!--- * #loanamt_float# --->
      <CFIF #searchtype# EQ "Refinance">
       <CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>
			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>
        <CFELSE>
        <CFSET a_ins_premium = #read_ins_calc.sale#>
      </CFIF>
      <CFelseIF #a_trigger# EQ "5">
      <cfif isdefined ("form.input_val") and #FORM.input_val# is "8">
        <CFSET a_tble_to_read = "StateTennesseeZone1">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "9">
        <CFSET a_tble_to_read = "StateTennesseeZone2">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "10">
        <CFSET a_tble_to_read = "StateTennesseeZone3">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "11">
        <CFSET a_tble_to_read = "StateTennesseeZone4">
        <cfelse>
        <CFSET a_tble_to_read = "StateTennessee">
      </cfif>
      <CFSET   x  = #Round(loanamt_float)#>
      <CFSET   x_len  = #Len(x)#>
      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>
      <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
      <CFIF #searchtype# EQ "Refinance">
        <CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>
			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>
        <CFELSE>
        <CFSET a_ins_premium = #read_ins_calc.sale#>
      </CFIF>
      <CFelseIF #a_trigger# EQ "7">
      <cfif #comp_id# eq "115">
        <CFSET a_tble_to_read = "StateArizonaMIC">
        <cfelseif #comp_id# eq 729>
        <cfif isdefined ("form.input_val") and #FORM.input_val# is "18">
          <CFSET a_tble_to_read = "StateArizonaStewartZone1">
          <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "19">
          <CFSET a_tble_to_read = "StateArizonaStewartZone2">
          <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "20">
          <CFSET a_tble_to_read = "StateArizonaStewartZone3">
          <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "21">
          <CFSET a_tble_to_read = "StateArizonaStewartZone4">
          <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "22">
          <CFSET a_tble_to_read = "StateArizonaStewartZone5">
          <cfelse>
          <CFSET a_tble_to_read = "StateArizonaStewartZone1">
        </cfif>
        <cfelse>
        <cfif isdefined ("form.input_val") and #FORM.input_val# is "18">
          <CFSET a_tble_to_read = "StateArizonaZone1">
          <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "19">
          <CFSET a_tble_to_read = "StateArizonaZone2">
          <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "20">
          <CFSET a_tble_to_read = "StateArizonaZone3">
          <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "21">
          <CFSET a_tble_to_read = "StateArizonaZone4">
          <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "22">
          <CFSET a_tble_to_read = "StateArizonaZone5">
          <cfelse>
          <CFSET a_tble_to_read = "StateArizona">
        </cfif>
      </cfif>
      <CFSET   x  = #Round(loanamt_float)#>
      <CFSET   x_len  = #Len(x)#>
      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>
      <cfif  #comp_id# eq "729">
        <cfif  #searchType# eq "Purchase" and #pstate# eq "AZ">
        <CFSET   x  = #Round(loanamt_float4)#>
        <CFSET   x_len  = #Len(x)#>
        <CFIF #x_len# EQ "3">
          <CFSET x_temp = #x# / 10>
          <CFSET   x_final4  = #Round(x_temp)# * 10>
          <CFELSEIF #x_len# EQ "4">
          <CFSET x_temp = #x# / 100>
          <CFSET   x_final4  = #Round(x_temp)# * 100>
          <CFELSEIF #x_len# EQ "5">
          <CFSET x_temp = #x# / 1000>
          <CFSET   x_final4  = #Round(x_temp)# * 1000>
          <CFELSEIF #x_len# EQ "6">
          <CFSET x_temp = #x# / 1000>
          <CFSET   x_final4  = #Round(x_temp)# * 1000>
          <CFELSEIF #x_len# EQ "7">
          <CFSET x_temp = #x# / 10000>
          <CFSET   x_final4  = #Round(x_temp)# * 10000>
          <CFELSEIF #x_len# EQ "8">
          <CFSET x_temp = #x# / 100000>
          <CFSET   x_final4  = #Round(x_temp)# * 100000>
        </cfif></cfif>
        <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
        <cfif  #searchType# eq "Purchase" and #pstate# eq "AZ">
	        <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc2">
    	    	SELECT * FROM #a_tble_to_read# WHERE a_to = #x_final4#
				order by a_to
        	</CFQUERY>
		</cfif>
        <CFIF #searchType# EQ "Refinance">
        <CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>
			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>
          <CFELSE>
          <CFIF #pstate# EQ "AZ">
            <CFSET a_ins_premium = #read_ins_calc.purchase1# + #read_ins_calc2.purchase2#>
            <cfelse>
            <CFSET a_ins_premium = #read_ins_calc.sale#>
          </cfif>
        </cfif>
        <cfelse>
        <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
        <CFIF #searchType# EQ "Refinance">
        <CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>
			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>
          <CFELSE>
          <CFSET a_ins_premium = #read_ins_calc.sale#>
        </cfif>
      </cfif>
      <CFelseIF #a_trigger# EQ "15">
      <cfif isdefined ("form.input_val") and #FORM.input_val# is "150">
        <CFSET a_tble_to_read = "StateNebraskaZone1">
        <cfelse>
        <CFSET a_tble_to_read = "StateNebraska">
      </cfif>
      <CFSET   x  = #Round(loanamt_float)#>
      <CFSET   x_len  = #Len(x)#>
      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>
      <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
      <CFIF #searchType# EQ "Refinance">
       <CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>
			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>
        <CFELSE>
        <CFSET a_ins_premium = #read_ins_calc.sale#>
      </CFIF>
      <CFelseIF #a_trigger# EQ "6">
      <cfif isdefined ("form.input_val") and #FORM.input_val# is "13">
        <CFSET a_tble_to_read = "StateColoradoZone1">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "14">
        <CFSET a_tble_to_read = "StateColoradoZone2">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "15">
        <CFSET a_tble_to_read = "StateColoradoZone3">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "16">
        <CFSET a_tble_to_read = "StateColoradoZone4">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "17">
        <CFSET a_tble_to_read = "StateColoradoZone5">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "30">
        <CFSET a_tble_to_read = "StateColoradoZone6">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "31">
        <CFSET a_tble_to_read = "StateColoradoZone7">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "32">
        <CFSET a_tble_to_read = "StateColoradoZone8">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "33">
        <CFSET a_tble_to_read = "StateColoradoZone9">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "34">
        <CFSET a_tble_to_read = "StateColoradoZone10">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "35">
        <CFSET a_tble_to_read = "StateColoradoZone11">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "36">
        <CFSET a_tble_to_read = "StateColoradoZone12">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "37">
        <CFSET a_tble_to_read = "StateColoradoZone13">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "38">
        <CFSET a_tble_to_read = "StateColoradoZone14">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "39">
        <CFSET a_tble_to_read = "StateColoradoZone15">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "40">
        <CFSET a_tble_to_read = "StateColoradoZone16">
        <cfelse>
        <CFSET a_tble_to_read = "StateColoradoZone17">
      </cfif>
      <CFSET   x  = #Round(loanamt_float)#>
      <CFSET   x_len  = #Len(x)#>
      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>
      <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
      <CFIF #searchtype# EQ "Refinance">
       <CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>
			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>
        <CFELSE>
        <CFSET a_ins_premium = #read_ins_calc.sale#>
      </CFIF>




	        <CFelseIF #a_trigger# EQ "8">
      <cfif isdefined ("form.input_val") and #FORM.input_val# is "50">
        <CFSET a_tble_to_read = "StateWashingtonZone1">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "51">
        <CFSET a_tble_to_read = "StateWashingtonZone2">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "52">
        <CFSET a_tble_to_read = "StateWashingtonZone3">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "53">
        <CFSET a_tble_to_read = "StateWashingtonZone4">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "54">
        <CFSET a_tble_to_read = "StateWashingtonZone5">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "55">
        <CFSET a_tble_to_read = "StateWashingtonZone6">
        <cfelseif isdefined ("form.input_val") and #FORM.input_val# is "56">
        <CFSET a_tble_to_read = "StateWashingtonZone7">
        <cfelse>
        <CFSET a_tble_to_read = "StateWashington">
      </cfif>
      <CFSET   x  = #Round(loanamt_float)#>
      <CFSET   x_len  = #Len(x)#>
      <CFIF #x_len# EQ "3">
        <CFSET x_temp = #x# / 10>
        <CFSET   x_final  = #Round(x_temp)# * 10>
        <CFELSEIF #x_len# EQ "4">
        <CFSET x_temp = #x# / 100>
        <CFSET   x_final  = #Round(x_temp)# * 100>
        <CFELSEIF #x_len# EQ "5">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "6">
        <CFSET x_temp = #x# / 1000>
        <CFSET   x_final  = #Round(x_temp)# * 1000>
        <CFELSEIF #x_len# EQ "7">
        <CFSET x_temp = #x# / 10000>
        <CFSET   x_final  = #Round(x_temp)# * 10000>
        <CFELSEIF #x_len# EQ "8">
        <CFSET x_temp = #x# / 100000>
        <CFSET   x_final  = #Round(x_temp)# * 100000>
      </CFIF>
      <CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final#
order by a_to
      </CFQUERY>
      <CFIF #searchtype# EQ "Refinance">
       <CFIF (read_company.id eq 1847 or read_company.id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
			   <CFSET a_ins_premium = #read_ins_calc.expedite#>
			   <cfelse>
			   <CFSET a_ins_premium = #read_ins_calc.Refinance#>
			   </CFIF>
        <CFELSE>
        <CFSET a_ins_premium = #read_ins_calc.sale#>
      </CFIF>




      <cfelse>
    </cfif>



  <cfif #a_trigger# eq "1">
    <cfif #read_ins_calc.recordcount# GT 0 or #read_ins_calc.recordcount# eq 0>
      <CFOUTPUT>
        <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
		<CFELSEIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city Like '#trim(pcity)#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = 'All'
        </CFQUERY>
		</cfif>
		</cfif>
		</cfif>

        <CFIF #read_rec_fees.recordcount# gt "0">
          <CFIF #read_rec_fees.mort_stamps# NEQ "0">
            <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
            <cfelse>
            <CFSET city_mort_stamps = "0">
          </cfif>
          <cfif #searchType# eq "Purchase">
            <CFIF #read_rec_fees.transfer_tax# NEQ "0">
              <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
              <cfelse>
              <CFSET state_deed_1 = "0">
              <!-- 1203 total -->
            </cfif>
            <cfelse>
            <CFSET state_deed_1 = "0">
          </cfif>
          <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
            <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
            <CFELSE>
            <Cfset rec_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "">
		  <!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <!--- <Cfset rel_fee = #read_rec_fees.release_rec_fee#> --->
            <CFELSE>
            <Cfset rel_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
            <CFSET a_fee_total = "0">
            <cfelse>
            <CFSET a_fee_total = "0">
          </cfif>
          <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
            <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
            <cfelse>
            <CFSET intang_tax = "0">
          </cfif>
          <cfelse>
          <CFSET rec_fee = "0">
          <CFSET rel_fee = "0">
          <CFSET city_mort_stamps = "0">
          <CFSET a_fee_total = "0">
          <CFSET state_deed_1 = "0">
          <CFSET intang_tax = "0">
        </cfif>





		    <!--
					<tr>
						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>

						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Recording fees are:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#city_mort_stamps#</b></font>
						</td>
						</tr>
						-->
      </CFOUTPUT>
      <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
      SELECT * FROM company_billing_states WHERE company_id = '#comp_id#' and a_states = '#pstate#'
      </CFQUERY>

      <cfoutput query="read_this_sets_billing_states">
        <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
        SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
        </CFQUERY>number: #a_ins_premium#
        <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

        <!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
        <!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
        <tr>

        <td width=780 align=center valign=top bgcolor=e6e6e6>

        <cfif #searchType# eq "Refinance">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><center>
                  <font size=2 color=blue face=arial><b>Refinance</b></font>
                </center></td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
                  <cfif (#a_ins_premium# neq "")>
				  <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif></td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>



            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelseif #searchtype# eq "purchase">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2  color=blue face=arial><b>Purchase</b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104b# </td>

              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305b# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
            <cfif (#a_ins_premium# neq "")>

                <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>





            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelse>
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial><b>Second Mortgage<b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111c# neq "">

              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305c# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "")>
                <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>


            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
        </cfif>
      </cfoutput> <CFOUTPUT>
        <cfif #loc# eq 4>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top>
<!--- <cfoutput>#line#</cfoutput> ---> <br><br><br>
			   <FONT FACE=verdana SIZE=2 color="black"> <b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
			</td>
          </tr>
          <cfelse>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top><FONT FACE=verdana SIZE=2 color="black"> <b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b> </td>
          </tr>
        </cfif>
        <tr>
          <td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1><A href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A> </td>
        </tr>
      </CFOUTPUT>
      <cfelse>
      <tr>
        <td width=780 align=center valign=top bgcolor=e1e1e1><FONT FACE=verdana SIZE=2 color="black"> Sorry, there is no match of the loan amout you entered with any fees in out database. </td>
      </tr>
    </cfif>
    <cfelseif #a_trigger# EQ "2">
    <cfif #read_ins_calc.recordcount# GT "0" or #read_ins_calc.recordcount# eq 0>
      <CFOUTPUT>
        <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
		<CFELSEIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = '#pcity#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = 'All'
        </CFQUERY>
		</cfif>
		</cfif>
		</cfif>
        <CFIF #read_rec_fees.recordcount# gt "0">
          <CFIF #read_rec_fees.mort_stamps# NEQ "0">
            <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
            <cfelse>
            <CFSET city_mort_stamps = "0">
          </cfif>
          <cfif #searchType# eq "Purchase">
            <CFIF #read_rec_fees.transfer_tax# NEQ "0">
              <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
              <cfelse>
              <CFSET state_deed_1 = "0">
              <!-- 1203 total -->
            </cfif>
            <cfelse>
            <CFSET state_deed_1 = "0">
          </cfif>
          <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
            <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
            <CFELSE>
            <Cfset rec_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "">
		  <!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <!--- <Cfset rel_fee = #read_rec_fees.release_rec_fee#> --->
            <CFELSE>
            <Cfset rel_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
            <CFSET a_fee_total = "0">
            <cfelse>
            <CFSET a_fee_total = "0">
          </cfif>
          <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
            <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
            <cfelse>
            <CFSET intang_tax = "0">
          </cfif>
          <cfelse>
          <CFSET rec_fee = "0">
          <CFSET rel_fee = "0">
          <CFSET city_mort_stamps = "0">
          <CFSET a_fee_total = "0">
          <CFSET state_deed_1 = "0">
          <CFSET intang_tax = "0">
        </cfif>
        <!--
					<tr>
						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>

						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Recording fees are:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#city_mort_stamps#</b></font>
						</td>
						</tr>
						-->
      </CFOUTPUT>
      <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
      SELECT * FROM company_billing_states WHERE company_id = '#comp_id#' and a_states = '#pstate#'
      </CFQUERY>
      <cfoutput query="read_this_sets_billing_states">
        <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
        SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
        </CFQUERY>
        <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

        <!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
        <!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
        <tr>

        <td width=780 align=center valign=top bgcolor=e6e6e6>

        <cfif #searchType# eq "Refinance">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><center>
                  <font size=2 color=blue face=arial><b>Refinance</b></font>
                </center></td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "")>
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>






            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelseif #searchtype# eq "purchase">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2  color=blue face=arial><b>Purchase</b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305b# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "")>
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>






            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelse>
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial><b>Second Mortgage<b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305c# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "")>
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>






            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
        </cfif>
      </cfoutput> <CFOUTPUT>
        <cfif #loc# eq 4>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top>
<!--- <cfoutput>#line#</cfoutput> ---> <br><br><br>
			   <FONT FACE=verdana SIZE=2 color="black"> <b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
			</td>
          </tr>
          <cfelse>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top><FONT FACE=verdana SIZE=2 color="black"> <b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b> </td>
          </tr>
        </cfif>
        <tr>
          <td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1><A href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A> </td>
        </tr>
      </CFOUTPUT>
      <cfelse>
      <tr>
        <td width=780 align=center valign=top bgcolor=e1e1e1><FONT FACE=verdana SIZE=2 color="black"> Sorry, there is no match of the loan amout you entered with any fees in out database. </td>
      </tr>
    </cfif>
    <!---California Start--->
    <cfelseif #a_trigger# EQ "17">
    <cfif #read_ins_calc.recordcount# GT "0" or #read_ins_calc.recordcount# eq 0>
      <CFOUTPUT>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
		<CFELSEIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = '#pcity#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = 'All'
        </CFQUERY>
		</cfif>
		</cfif>
		</cfif>
        <CFIF #read_rec_fees.recordcount# gt "0">
          <CFIF #read_rec_fees.mort_stamps# NEQ "0">
            <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
            <cfelse>
            <CFSET city_mort_stamps = "0">
          </cfif>
          <cfif #searchType# eq "Purchase">
            <CFIF #read_rec_fees.transfer_tax# NEQ "0">
              <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
              <cfelse>
              <CFSET state_deed_1 = "0">
              <!-- 1203 total -->
            </cfif>
            <cfelse>
            <CFSET state_deed_1 = "0">
          </cfif>
          <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
            <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
            <CFELSE>
            <Cfset rec_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "">
		  <!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <!--- <Cfset rel_fee = #read_rec_fees.release_rec_fee#> --->
            <CFELSE>
            <Cfset rel_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
            <CFSET a_fee_total = "0">
            <cfelse>
            <CFSET a_fee_total = "0">
          </cfif>
          <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
            <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
            <cfelse>
            <CFSET intang_tax = "0">
          </cfif>
          <cfelse>
          <CFSET rec_fee = "0">
          <CFSET rel_fee = "0">
          <CFSET city_mort_stamps = "0">
          <CFSET a_fee_total = "0">
          <CFSET state_deed_1 = "0">
          <CFSET intang_tax = "0">
        </cfif>
      </CFOUTPUT>
      <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
      SELECT * FROM company_billing_states WHERE company_id = '#comp_id#' and a_states = '#pstate#'
      </CFQUERY>
      <cfoutput >
        <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
        SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
        </CFQUERY>
        <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

        <tr>

        <td width=780 align=center valign=top bgcolor=e6e6e6>

        <cfif #searchType# eq "Refinance">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><center>
                  <font size=2 color=blue face=arial><b>Refinance</b></font>
                </center></td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee</td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>






            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelseif #searchtype# eq "purchase">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2  color=blue face=arial><b>Purchase</b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305b# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>
			<!--- Alabama Transfer Tax --->
	<!--- <cfif pstate eq "AL">
		<cfif form.LOANAMT_FLOAT4 GT form.LOANAMT_FLOAT>
		<cfset state_deed_1 = (form.LOANAMT_FLOAT4-form.LOANAMT_FLOAT) * read_rec_fees.transfer_tax>
		<cfelse>
		<cfset state_deed_1 = 0>
		</cfif>
	</cfif> --->
	<cfset state_deed_1 = 0>
<!--- END Alabama Transfer Tax --->

            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelse>
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial><b>Second Mortgage<b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305c# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>





            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
        </cfif>
      </cfoutput> <CFOUTPUT>
        <cfif #loc# eq 4>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top>
<!--- <cfoutput>#line#</cfoutput> ---> <br><br><br>
			   <FONT FACE=verdana SIZE=2 color="black"> <b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
			</td>
          </tr>
          <cfelse>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top><FONT FACE=verdana SIZE=2 color="black"> <b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b> </td>
          </tr>
        </cfif>
        <tr>
          <td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1><A href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A> </td>
        </tr>
      </CFOUTPUT>
      <cfelse>
      <tr>
        <td width=780 align=center valign=top bgcolor=e1e1e1><FONT FACE=verdana SIZE=2 color="black"> Sorry, there is no match of the loan amout you entered with any fees in out database. </td>
      </tr>
    </cfif>
    <!---California End--->



	    <!---Washington Start--->
    <cfelseif #a_trigger# EQ "8">
    <cfif #read_ins_calc.recordcount# GT "0" or #read_ins_calc.recordcount# eq 0>
      <CFOUTPUT>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
		<CFELSEIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = '#pcity#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = 'All'
        </CFQUERY>
		</cfif>
		</cfif>
		</cfif>
        <CFIF #read_rec_fees.recordcount# gt "0">
          <CFIF #read_rec_fees.mort_stamps# NEQ "0">
            <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
            <cfelse>
            <CFSET city_mort_stamps = "0">
          </cfif>
          <cfif #searchType# eq "Purchase">
            <CFIF #read_rec_fees.transfer_tax# NEQ "0">
              <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
              <cfelse>
              <CFSET state_deed_1 = "0">
              <!-- 1203 total -->
            </cfif>
            <cfelse>
            <CFSET state_deed_1 = "0">
          </cfif>
          <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
            <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
            <CFELSE>
            <Cfset rec_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "">
		  <!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <!--- <Cfset rel_fee = #read_rec_fees.release_rec_fee#> --->
            <CFELSE>
            <Cfset rel_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
            <CFSET a_fee_total = "0">
            <cfelse>
            <CFSET a_fee_total = "0">
          </cfif>
          <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
            <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
            <cfelse>
            <CFSET intang_tax = "0">
          </cfif>
          <cfelse>
          <CFSET rec_fee = "0">
          <CFSET rel_fee = "0">
          <CFSET city_mort_stamps = "0">
          <CFSET a_fee_total = "0">
          <CFSET state_deed_1 = "0">
          <CFSET intang_tax = "0">
        </cfif>
      </CFOUTPUT>
      <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
      SELECT * FROM company_billing_states WHERE company_id = '#comp_id#' and a_states = '#pstate#'
      </CFQUERY>
      <cfoutput >
        <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
        SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
        </CFQUERY>
        <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

        <tr>

        <td width=780 align=center valign=top bgcolor=e6e6e6>

        <cfif #searchType# eq "Refinance">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><center>
                  <font size=2 color=blue face=arial><b>Refinance</b></font>
                </center></td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee</td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>





            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelseif #searchtype# eq "purchase">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2  color=blue face=arial><b>Purchase</b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305b# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>


            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelse>
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial><b>Second Mortgage<b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102c# neq "">

              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305c# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>





            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
        </cfif>
      </cfoutput> <CFOUTPUT>
        <cfif #loc# eq 4>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top>
<!--- <cfoutput>#line#</cfoutput> ---> <br><br><br>
			   <FONT FACE=verdana SIZE=2 color="black"> <b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
			</td>
          </tr>
          <cfelse>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top><FONT FACE=verdana SIZE=2 color="black"> <b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b> </td>
          </tr>
        </cfif>
        <tr>
          <td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1><A href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A> </td>
        </tr>
      </CFOUTPUT>
      <cfelse>
      <tr>
        <td width=780 align=center valign=top bgcolor=e1e1e1><FONT FACE=verdana SIZE=2 color="black"> Sorry, there is no match of the loan amout you entered with any fees in out database. </td>
      </tr>
    </cfif>
    <!---Washington End--->




    <cfelseif #a_trigger# EQ "3">
    <cfif #read_ins_calc.recordcount# GT "0" or #read_ins_calc.recordcount# eq 0>
      <CFOUTPUT>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
		<CFELSEIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = '#pcity#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = 'All'
        </CFQUERY>
		</cfif>
		</cfif>
		</cfif>
        <CFIF #read_rec_fees.recordcount# gt "0">
          <CFIF #read_rec_fees.mort_stamps# NEQ "0">
            <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
            <cfelse>
            <CFSET city_mort_stamps = "0">
          </cfif>
          <cfif #searchType# eq "Purchase">
            <CFIF #read_rec_fees.transfer_tax# NEQ "0">
              <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
              <cfelse>
              <CFSET state_deed_1 = "0">
              <!-- 1203 total -->
            </cfif>
            <cfelse>
            <CFSET state_deed_1 = "0">
          </cfif>
          <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
            <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
            <CFELSE>
            <Cfset rec_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "">
		  <!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
           <!---  <Cfset rel_fee = #read_rec_fees.release_rec_fee#> --->
            <CFELSE>
            <Cfset rel_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
            <CFSET a_fee_total = "0">
            <cfelse>
            <CFSET a_fee_total = "0">
          </cfif>
          <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
            <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
            <cfelse>
            <CFSET intang_tax = "0">
          </cfif>
          <cfelse>
          <CFSET rec_fee = "0">
          <CFSET rel_fee = "0">
          <CFSET city_mort_stamps = "0">
          <CFSET a_fee_total = "0">
          <CFSET state_deed_1 = "0">
          <CFSET intang_tax = "0">
        </cfif>
        <!--
					<tr>
						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>

						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Recording fees are:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#city_mort_stamps#</b></font>
						</td>
						</tr>
						-->
      </CFOUTPUT>
      <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
      SELECT * FROM company_billing_states WHERE company_id = '#comp_id#' and a_states = '#pstate#'
      </CFQUERY>
      <cfoutput query="read_this_sets_billing_states">
        <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
        SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
        </CFQUERY>
        <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

        <!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
        <!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
        <tr>

        <td width=780 align=center valign=top bgcolor=e6e6e6>

        <cfif #searchType# eq "Refinance">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><center>
                  <font size=2 color=blue face=arial><b>Refinance</b></font>
                </center></td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee</td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>



            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelseif #searchtype# eq "purchase">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2  color=blue face=arial><b>Purchase</b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305b# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>




            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelse>
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial><b>Second Mortgage<b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305c# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>



            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
        </cfif>
      </cfoutput> <cfoutput>
        <cfif #loc# eq 4>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top>
<!--- <cfoutput>#line#</cfoutput>  ---><br><br><br>
			   <FONT FACE=verdana SIZE=2 color="black"> <b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
			</td>
          </tr>
          <cfelse>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top><FONT FACE=verdana SIZE=2 color="black"> <b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loanamt_float=#loanamt_float#&calc=yes&a_trigger=1">click here</A> (HUD1 will be recalculated)</b> </td>
          </tr>
        </cfif>
        <tr>
          <td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1><A href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A> </td>
        </tr>
      </CFOUTPUT>
      <cfelse>
      <tr>
        <td width=780 align=center valign=top bgcolor=e1e1e1><FONT FACE=verdana SIZE=2 color="black"> Sorry, there is no match of the loan amout you entered with any fees in out database. </td>
      </tr>
    </cfif>
    <cfelseif #a_trigger# EQ "4">
    <CFOUTPUT>
      <CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
		<CFELSEIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = '#pcity#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = 'All'
        </CFQUERY>
		</cfif>
		</cfif>
		</cfif>
      <CFIF #read_rec_fees.recordcount# gt "0">
        <CFIF #read_rec_fees.mort_stamps# NEQ "0">
          <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
          <cfelse>
          <CFSET city_mort_stamps = "0">
        </cfif>
        <cfif #searchType# eq "Purchase">
          <CFIF #read_rec_fees.transfer_tax# NEQ "0">
            <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
            <cfelse>
            <CFSET state_deed_1 = "0">
            <!-- 1203 total -->
          </cfif>
          <cfelse>
          <CFSET state_deed_1 = "0">
        </cfif>
        <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
          <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
          <CFELSE>
          <Cfset rec_fee = "0">
        </cfif>
        <CFIF #read_rec_fees.release_rec_fee# NEQ "">
		<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
         <!---  <Cfset rel_fee = #read_rec_fees.release_rec_fee#> --->
          <CFELSE>
          <Cfset rel_fee = "0">
        </cfif>
        <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
          <CFSET a_fee_total = "0">
          <cfelse>
          <CFSET a_fee_total = "0">
        </cfif>
        <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
          <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
          <cfelse>
          <CFSET intang_tax = "0">
        </cfif>
        <cfelse>
        <CFSET rec_fee = "0">
        <CFSET rel_fee = "0">
        <CFSET city_mort_stamps = "0">
        <CFSET a_fee_total = "0">
        <CFSET state_deed_1 = "0">
        <CFSET intang_tax = "0">
      </cfif>
      <!--
					<tr>
						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>

						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Recording fees are:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#city_mort_stamps#</b></font>
						</td>
						</tr>
						-->
    </CFOUTPUT>
    <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
    SELECT * FROM company_billing_states WHERE company_id = '#comp_id#' and a_states = '#pstate#'
    </CFQUERY>
    <cfoutput query="read_this_sets_billing_states">
      <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
      SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
      </CFQUERY>
      <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

      <!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
      <!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
      <tr>

      <td width=780 align=center valign=top bgcolor=e6e6e6>

      <cfif #searchType# eq "Refinance">
        <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
          <tr>
            <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><center>
                <font size=2 color=blue face=arial><b>Refinance</b></font>
              </center></td>
          </tr>
          <cfif #read_this_sets_billing_values.a_1101# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1111# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_text# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1102# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1112# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_text# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1103# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1113# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_text# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1104# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1205# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_text# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1105# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1303# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_text# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1106# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1304# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_text# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1107# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1305# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_text# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305# </td>
            </tr>
          </cfif>
          <CFQUERY datasource="#request.dsn#" NAME="read_states">
          SELECT * FROM first_title_states where st_abbrev = '#pstate#'
          </CFQUERY>
          <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                      <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                  <cfset a_ins_premium = #a_ins_premium#>
                </td>
              </tr>
              <cfelse>
              <cfset a_ins_premium = 0>
            </cfif>
          </cfif>
          <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
		  <!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
          <cfif #rel_fee# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
            </tr>
          </cfif>
          <cfif #a_fee_total# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
            </tr>
          </cfif>
          <cfif #city_mort_stamps# neq "0">

		  <cfif pstate eq "NY">
		  <!--- get the right percentage --->
			  <cfif #pcounty# eq "Bronx" or #pcounty# eq "Kings" or #pcounty# eq "New York" or #pcounty# eq "Queens" or #pcounty# eq "Richmond">
				   <cfif loanamt_float LTE 500000>
				   <cfset percent_calc = 0.0205>
				   <cfelse>
				   <cfset percent_calc = 0.02175>
				   </cfif>
			  <cfelse>
			  <cfset percent_calc = read_rec_fees.mort_stamps>
			  </cfif>
		         <CFSET city_mort_stamps = #round(url.loanamt_float-url.estimated_loan)# * #percent_calc#>
		  </cfif>

            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
            </tr>
          </cfif>



          <cfif #state_deed_1# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
            </tr>
          </cfif>
          <cfif #intang_tax# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
            </tr>
          </cfif>
        </table>
        <!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
        <cfelseif #searchtype# eq "purchase">
        <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
          <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->
          <tr>
            <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2  color=blue face=arial><b>Purchase</b></font> </td>
          </tr>
          <cfif #read_this_sets_billing_values.a_1101b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1111b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textb# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1102b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1112b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textb# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1103b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1113b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textb# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1104b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1205b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textb# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1105b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1303b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textb# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1106b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1304b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textb# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1107b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107b# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1305b# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textb# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305b# </td>
            </tr>
          </cfif>
          <CFQUERY datasource="#request.dsn#" NAME="read_states">
          SELECT * FROM first_title_states where st_abbrev = '#pstate#'
          </CFQUERY>
          <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                      <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                  <cfset a_ins_premium = #a_ins_premium#>
                </td>
              </tr>
              <cfelse>
              <cfset a_ins_premium = 0>
            </cfif>
          </cfif>
          <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
		  <!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
          <cfif #rel_fee# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
            </tr>
          </cfif>
          <cfif #a_fee_total# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
            </tr>
          </cfif>
          <cfif #city_mort_stamps# neq "0">
		  <cfif pstate eq "NY">
		  <!--- get the right percentage --->
			  <cfif #pcounty# eq "Bronx" or #pcounty# eq "Kings" or #pcounty# eq "New York" or #pcounty# eq "Queens" or #pcounty# eq "Richmond">
				   <cfif loanamt_float LTE 500000>
				   <cfset percent_calc = 0.0205>
				   <cfelse>
				   <cfset percent_calc = 0.02175>
				   </cfif>
			  <cfelse>
			  <cfset percent_calc = read_rec_fees.mort_stamps>
			  </cfif>

				 <CFSET city_mort_stamps = #round(url.loanamt_float)# * #percent_calc#>

		  </cfif>
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
            </tr>
          </cfif>


<!--- NY Transfer Tax --->
	<cfif pstate eq "NY">
	   <cfif #url.PCNT# eq "Bronx" or #url.PCNT# eq "Kings" or #url.PCNT# eq "New York" or #url.PCNT# eq "Queens" or #url.PCNT# eq "Richmond">
		    <cfif form.LOANAMT_FLOAT GT 1000000>
		       <cfset state_deed_1 = (form.LOANAMT_FLOAT) * 0.01825>
		          <cfif form.LOANAMT_FLOAT GTE 500000>
		            <cfset state_deed_1 = (form.LOANAMT_FLOAT) * 0.01825>
		          <cfelse>
		             <cfset state_deed_1 = (form.LOANAMT_FLOAT) * 0.014>
		          </cfif>
		     </cfif>
			 </cfif>
	<cfif form.LOANAMT_FLOAT GT 1000000>
		<cfset state_deed_1 = state_deed_1 + (form.LOANAMT_FLOAT * 0.01)>
	</cfif>
	</cfif>
<!--- END NY Transfer Tax --->
          <cfif #state_deed_1# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
            </tr>
          </cfif>
          <cfif #intang_tax# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
            </tr>
          </cfif>
        </table>
        <!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
        <cfelse>
        <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
          <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
          <tr>
            <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial><b>Second Mortgage<b></font> </td>
          </tr>
          <cfif #read_this_sets_billing_values.a_1101# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1111c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textc# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1102c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1112c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textc# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1103c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1113c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textc# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1104c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1205c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textc# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1105c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1303c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textc# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1106c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1304c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textc# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1107c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107c# </td>
            </tr>
          </cfif>
          <cfif #read_this_sets_billing_values.a_1305c# neq "">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textc# </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305c# </td>
            </tr>
          </cfif>
          <CFQUERY datasource="#request.dsn#" NAME="read_states">
          SELECT * FROM first_title_states where st_abbrev = '#pstate#'
          </CFQUERY>
          <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                      <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                  <cfset a_ins_premium = #a_ins_premium#>
                </td>
              </tr>
              <cfelse>
              <cfset a_ins_premium = 0>
            </cfif>
          </cfif>
          <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
		  <!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
          <cfif #rel_fee# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
            </tr>
          </cfif>
          <cfif #a_fee_total# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
            </tr>
          </cfif>
          <cfif #city_mort_stamps# neq "0">
		 <cfif pstate eq "NY">
		  <!--- get the right percentage --->
			  <cfif #pcounty# eq "Bronx" or #pcounty# eq "Kings" or #pcounty# eq "New York" or #pcounty# eq "Queens" or #pcounty# eq "Richmond">
				   <cfif loanamt_float LTE 500000>
				   <cfset percent_calc = 0.0205>
				   <cfelse>
				   <cfset percent_calc = 0.02175>
				   </cfif>
			  <cfelse>
			  <cfset percent_calc = read_rec_fees.mort_stamps>
			  </cfif>
		         <cfif url.searchtype neq "Purchase">
		         <CFSET city_mort_stamps = #round(url.loanamt_float-url.estimated_loan)# * #percent_calc#>
				 <cfelse>
				 <CFSET city_mort_stamps = #round(url.loanamt_float)# * #percent_calc#>
		         </cfif>
		  </cfif>
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
            </tr>
          </cfif>



          <cfif #state_deed_1# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
            </tr>
          </cfif>
          <cfif #intang_tax# neq "0">
            <tr>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
              <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
            </tr>
          </cfif>
        </table>
      </cfif>
    </cfoutput> <CFOUTPUT>
      <cfif #loc# eq 4>
        <tr>
          <td bgcolor="d3d3d3" width=780 align=center valign=top>
<!--- <cfoutput>#line#</cfoutput>  ---><br><br><br>
		     <FONT FACE=verdana SIZE=2 color="black"> <b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
		  </td>
        </tr>
        <cfelse>
        <tr>
          <td bgcolor="d3d3d3" width=780 align=center valign=top><FONT FACE=verdana SIZE=2 color="black"> <b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b> </td>
        </tr>
      </cfif>
      <tr>
        <td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1><A href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A> </td>
      </tr>
    </CFOUTPUT>
    <cfelseif #a_trigger# EQ "5">
    <cfif #read_ins_calc.recordcount# gt "0" or #read_ins_calc.recordcount# eq 0>
      <CFOUTPUT>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
		<CFELSEIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = '#pcity#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = 'All'
        </CFQUERY>
		</cfif>
		</cfif>
		</cfif>
        <CFIF #read_rec_fees.recordcount# gt "0">
          <CFIF #read_rec_fees.mort_stamps# NEQ "0">
            <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
            <cfelse>
            <CFSET city_mort_stamps = "0">
          </cfif>
          <cfif #searchType# eq "Purchase">
            <CFIF #read_rec_fees.transfer_tax# NEQ "0">
              <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
              <cfelse>
              <CFSET state_deed_1 = "0">
              <!-- 1203 total -->
            </cfif>
            <cfelse>
            <CFSET state_deed_1 = "0">
          </cfif>
          <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
            <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
            <CFELSE>
            <Cfset rec_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "">
<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
           <!---  <Cfset rel_fee = #read_rec_fees.release_rec_fee#> --->
            <CFELSE>
            <Cfset rel_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
            <CFSET a_fee_total = "0">
            <cfelse>
            <CFSET a_fee_total = "0">
          </cfif>
          <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
            <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
            <cfelse>
            <CFSET intang_tax = "0">
          </cfif>
          <cfelse>
          <CFSET rec_fee = "0">
          <CFSET rel_fee = "0">
          <CFSET city_mort_stamps = "0">
          <CFSET a_fee_total = "0">
          <CFSET state_deed_1 = "0">
          <CFSET intang_tax = "0">
        </cfif>
        <!--
					<tr>
						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>

						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Recording fees are:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#city_mort_stamps#</b></font>
						</td>
						</tr>
						-->
      </CFOUTPUT>
      <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
      SELECT * FROM company_billing_states WHERE company_id = '#comp_id#' and a_states = '#pstate#'
      </CFQUERY>
      <cfoutput query="read_this_sets_billing_states">
        <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
        SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
        </CFQUERY>
        <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

        <!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
        <!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
        <tr>

        <td width=780 align=center valign=top bgcolor=e6e6e6>

        <cfif #searchType# eq "Refinance">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><center>
                  <font size=2 color=blue face=arial><b>Refinance</b></font>
                </center></td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105# </td>

              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>




           <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelseif #searchtype# eq "purchase">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2  color=blue face=arial><b>Purchase</b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee</td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305b# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>


            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelse>
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial><b>Second Mortgage<b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee</td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305c# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>


            <cfif #state_deed_1# neq "0">

              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
        </cfif>
      </cfoutput> <CFOUTPUT>
        <cfif #loc# eq 4>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top>
<!--- <cfoutput>#line#</cfoutput> ---> <br><br><br>
			   <FONT FACE=verdana SIZE=2 color="black"> <b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
			</td>
          </tr>
          <cfelse>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top><FONT FACE=verdana SIZE=2 color="black"> <b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b> </td>
          </tr>
        </cfif>
        <tr>
          <td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1><A href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A> </td>
        </tr>
      </CFOUTPUT>
      <cfelse>
      <tr>
        <td width=780 align=center valign=top bgcolor=e1e1e1><FONT FACE=verdana SIZE=2 color="black"> Sorry, there is no match of the loan amout you entered with any fees in out database. </td>
      </tr>
    </cfif>
    <cfelseif #a_trigger# EQ "7">
    <cfif #read_ins_calc.recordcount# gt "0" or #read_ins_calc.recordcount# eq 0>
      <CFOUTPUT>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
		<CFELSEIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = '#pcity#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = 'All'
        </CFQUERY>
		</cfif>
		</cfif>
		</cfif>
        <CFIF #read_rec_fees.recordcount# gt "0">
          <CFIF #read_rec_fees.mort_stamps# NEQ "0">
            <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
            <cfelse>
            <CFSET city_mort_stamps = "0">
          </cfif>
          <cfif #searchType# eq "Purchase">
            <CFIF #read_rec_fees.transfer_tax# NEQ "0">
              <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
              <cfelse>
              <CFSET state_deed_1 = "0">
              <!-- 1203 total -->
            </cfif>
            <cfelse>
            <CFSET state_deed_1 = "0">
          </cfif>
          <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
            <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
            <CFELSE>
            <Cfset rec_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "">
		  <!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <!--- <Cfset rel_fee = #read_rec_fees.release_rec_fee#> --->
            <CFELSE>
            <Cfset rel_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
            <CFSET a_fee_total = "0">
            <cfelse>
            <CFSET a_fee_total = "0">
          </cfif>
          <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
            <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
            <cfelse>
            <CFSET intang_tax = "0">
          </cfif>
          <cfelse>
          <CFSET rec_fee = "0">
          <CFSET rel_fee = "0">
          <CFSET city_mort_stamps = "0">
          <CFSET a_fee_total = "0">
          <CFSET state_deed_1 = "0">
          <CFSET intang_tax = "0">
        </cfif>
        <!--
					<tr>
						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>

						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Recording fees are:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#city_mort_stamps#</b></font>
						</td>
						</tr>
						-->
      </CFOUTPUT>
      <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
      SELECT * FROM company_billing_states WHERE company_id = '#comp_id#' and a_states = '#pstate#'
      </CFQUERY>
      <cfoutput query="read_this_sets_billing_states">
        <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
        SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
        </CFQUERY>
        <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

        <!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
        <!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
        <tr>

        <td width=780 align=center valign=top bgcolor=e6e6e6>

        <cfif #searchType# eq "Refinance">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><center>
                  <font size=2 color=blue face=arial><b>Refinance</b></font>
                </center></td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee</td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>


            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelseif #searchtype# eq "purchase">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2  color=blue face=arial><b>Purchase</b></font> </td>
            </tr>
<!--- NS 08/11 S --->
            <cfif pstate neq "AZ">
			    <cfset NS_1101b=read_this_sets_billing_values.a_1101b>
			<cfelseif comp_id eq "621" or comp_id eq "115">
			    <cfset NS_1101b="100">
		    <cfelse>
			    <cfset LAMNT=Int(loanamt_float/1000)*1000>
				<cfquery name="ESCROW_rate" datasource="#request.dsn#">
				   SELECT * FROM az_escrow_rates
				   WHERE LoanAmt = #LAMNT#
				</cfquery>
			    <cfset NS_1101b=#ESCROW_rate.Rate#>
			</cfif>
            <cfif #NS_1101b# neq "" >
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NS_1101b# </td>
              </tr>
            </cfif>
<!--- NS 08/11 F --->
            <cfif #read_this_sets_billing_values.a_1111b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">  Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">#read_this_sets_billing_values.a_1112_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable">#read_this_sets_billing_values.a_1113_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable">#read_this_sets_billing_values.a_1205_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation">Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable">#read_this_sets_billing_values.a_1303_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees">Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable">#read_this_sets_billing_values.a_1304_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">#read_this_sets_billing_values.a_1305_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305b# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium">Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Recording fee">Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rec_fee# </td>
              </tr>
            </cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee">Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee">Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>





            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelse>
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial><b>Second Mortgage<b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106c# neq "">
              <tr>

                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305c# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >

                <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>

                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>





            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
        </cfif>
      </cfoutput> <CFOUTPUT>
        <cfif #loc# eq 4>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top>
<!--- <cfoutput>#line#</cfoutput> ---> <br><br><br>
			   <FONT FACE=verdana SIZE=2 color="black"> <b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
			</td>
          </tr>
          <cfelse>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top><FONT FACE=verdana SIZE=2 color="black"> <b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b> </td>
          </tr>
        </cfif>
        <tr>
          <td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1><A href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A> </td>
        </tr>
      </CFOUTPUT>
      <cfelse>
      <tr>
        <td width=780 align=center valign=top bgcolor=e1e1e1><FONT FACE=verdana SIZE=2 color="black"> Sorry, there is no match of the loan amout you entered with any fees in out database. </td>
      </tr>
    </cfif>
    <cfelseif #a_trigger# EQ "15">
    <cfif #read_ins_calc.recordcount# gt "0" or #read_ins_calc.recordcount# eq 0>
      <CFOUTPUT>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
		<CFELSEIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = '#pcity#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = 'All'
        </CFQUERY>
		</cfif>
		</cfif>
		</cfif>
        <CFIF #read_rec_fees.recordcount# gt "0">
          <CFIF #read_rec_fees.mort_stamps# NEQ "0">
            <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
            <cfelse>
            <CFSET city_mort_stamps = "0">
          </cfif>
          <cfif #searchType# eq "Purchase">
            <CFIF #read_rec_fees.transfer_tax# NEQ "0">
              <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
              <cfelse>
              <CFSET state_deed_1 = "0">
              <!-- 1203 total -->
            </cfif>
            <cfelse>
            <CFSET state_deed_1 = "0">
          </cfif>
          <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
            <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
            <CFELSE>
            <Cfset rec_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "">
		  <!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
           <!---  <Cfset rel_fee = #read_rec_fees.release_rec_fee#> --->
            <CFELSE>
            <Cfset rel_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
            <CFSET a_fee_total = "0">
            <cfelse>
            <CFSET a_fee_total = "0">
          </cfif>
          <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
            <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
            <cfelse>
            <CFSET intang_tax = "0">
          </cfif>
          <cfelse>
          <CFSET rec_fee = "0">
          <CFSET rel_fee = "0">
          <CFSET city_mort_stamps = "0">
          <CFSET a_fee_total = "0">
          <CFSET state_deed_1 = "0">
          <CFSET intang_tax = "0">
        </cfif>
        <!--
					<tr>
						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Title Insurance Premmium is:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#a_ins_premium#</b></font>
						</td>

						<td bgcolor="d3d3d3" width=340 align=center valign=top>
							<FONT FACE=verdana SIZE=2 color="BLACK">Recording fees are:&nbsp;</FONT>
							<FONT FACE=verdana SIZE=3 color="blue"><b>#city_mort_stamps#</b></font>
						</td>
						</tr>
						-->
      </CFOUTPUT>
      <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
      SELECT * FROM company_billing_states WHERE company_id = '#comp_id#' and a_states = '#pstate#'
      </CFQUERY>
      <cfoutput query="read_this_sets_billing_states">
        <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
        SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
        </CFQUERY>
        <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

        <!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
        <!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
        <tr>

        <td width=780 align=center valign=top bgcolor=e6e6e6>

        <cfif #searchType# eq "Refinance">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><center>
                  <font size=2 color=blue face=arial><b>Refinance</b></font>
                </center></td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >

                <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>



            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelseif #searchtype# eq "purchase">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2  color=blue face=arial><b>Purchase</b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305b# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>





            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelse>
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial><b>Second Mortgage<b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305c# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>





            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
        </cfif>
      </cfoutput> <CFOUTPUT>
        <cfif #loc# eq 4>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top>
<!--- <cfoutput>#line#</cfoutput> ---> <br><br><br>
			  <FONT FACE=verdana SIZE=2 color="black"> <b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
			</td>
          </tr>
          <cfelse>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top><FONT FACE=verdana SIZE=2 color="black"> <b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b> </td>
          </tr>
        </cfif>
        <tr>
          <td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1><A href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A> </td>
        </tr>
      </CFOUTPUT>
      <cfelse>
      <tr>
        <td width=780 align=center valign=top bgcolor=e1e1e1><FONT FACE=verdana SIZE=2 color="black"> Sorry, there is no match of the loan amout you entered with any fees in out database. </td>
      </tr>
    </cfif>
    <cfelseif #a_trigger# EQ "6">
    <cfif #read_ins_calc.recordcount# gt "0" or #read_ins_calc.recordcount# eq 0>
      <CFOUTPUT>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
              SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like 'All'
              </CFQUERY>
		<CFELSEIF #read_rec_fees.recordcount# gt "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = '#pcity#'
        </CFQUERY>
		<CFIF #read_rec_fees.recordcount# eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
        SELECT * FROM recording_fees WHERE state = '#pstate#' and county Like '#trim(pcounty)#' and city = 'All'
        </CFQUERY>
		</cfif>
		</cfif>
		</cfif>
        <CFIF #read_rec_fees.recordcount# gt "0">
          <CFIF #read_rec_fees.mort_stamps# NEQ "0">
            <CFSET city_mort_stamps = #round(loanamt_float)# * #read_rec_fees.mort_stamps#>
            <cfelse>
            <CFSET city_mort_stamps = "0">
          </cfif>
          <cfif #searchType# eq "Purchase">
            <CFIF #read_rec_fees.transfer_tax# NEQ "0">
              <CFSET state_deed_1 = #loanamt_float# * #read_rec_fees.transfer_tax#>
              <cfelse>
              <CFSET state_deed_1 = "0">
              <!-- 1203 total -->
            </cfif>
            <cfelse>
            <CFSET state_deed_1 = "0">
          </cfif>
          <CFIF #read_rec_fees.mort_rec_fee# NEQ "">
            <Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
            <CFELSE>
            <Cfset rec_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "">
		  <!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <!--- <Cfset rel_fee = #read_rec_fees.release_rec_fee#> --->
            <CFELSE>
            <Cfset rel_fee = "0">
          </cfif>
          <CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">

            <CFSET a_fee_total = "0">
            <cfelse>
            <CFSET a_fee_total = "0">
          </cfif>
          <CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
            <CFSET intang_tax = #round(loanamt_float)# * #read_rec_fees.intangible_tax#>
            <cfelse>
            <CFSET intang_tax = "0">
          </cfif>
          <cfelse>
          <CFSET rec_fee = "0">
          <CFSET rel_fee = "0">
          <CFSET city_mort_stamps = "0">
          <CFSET a_fee_total = "0">
          <CFSET state_deed_1 = "0">
          <CFSET intang_tax = "0">
        </cfif>
      </CFOUTPUT>
      <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
      SELECT * FROM company_billing_states WHERE company_id = '#comp_id#' and a_states = '#pstate#'
      </CFQUERY>
      <cfoutput query="read_this_sets_billing_states">
        <CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
        SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
        </CFQUERY>
        <table width=780 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

        <!---<tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
        <!---<table width=780 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


			 --->
        <tr>

        <td width=780 align=center valign=top bgcolor=e6e6e6>

        <cfif #searchType# eq "Refinance">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><center>
                  <font size=2 color=blue face=arial><b>Refinance</b></font>
                </center></td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee</td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_text# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >

                <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>




            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---</td>
			<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelseif #searchtype# eq "purchase">
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>			 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2  color=blue face=arial><b>Purchase</b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107b# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305b# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textb# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305b# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>




            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
          <!---
	</td>

		<td width=250 align=left valign=top bgcolor=e6e6e6>	--->
          <cfelse>
          <table width=500 cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
            <!--- <tr>
		<td width=250 align=left valign=top bgcolor=e6e6e6>	 --->
            <tr>
              <td width=500 colspan = 2 align=center valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial><b>Second Mortgage<b></font> </td>
            </tr>
            <cfif #read_this_sets_billing_values.a_1101# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee"> Settlement or Closing Fee</td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1101c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1111c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1111. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1111_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1111c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1102c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search"> Abstract or Title Search </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1102c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1112c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1112. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1112_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1112c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1103c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1103. <img src="./images/info-01.gif" ALT="Title Examination"> Title Examination </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1103c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1113c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1113. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1113_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1113c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1104c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder"> Title Insurance Binder </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1104c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1205c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1205. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1205_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1205c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1105c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1105. <img src="./images/info-01.gif" ALT="Document Preparation"> Document Preparation </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1105c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1303c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1303. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1303_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1303c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1106c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1106. <img src="./images/info-01.gif" ALT="Notary Fees"> Notary Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1106c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1304c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1304. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1304_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1304c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1107c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1107. <img src="./images/info-01.gif" ALT="Attorney's Fees"> Attorney's Fees </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1107c# </td>
              </tr>
            </cfif>
            <cfif #read_this_sets_billing_values.a_1305c# neq "">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1305. <img src="./images/info-01.gif" ALT="Data on this line is variable"> #read_this_sets_billing_values.a_1305_textc# </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #read_this_sets_billing_values.a_1305c# </td>
              </tr>
            </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_states">
            SELECT * FROM first_title_states where st_abbrev = '#pstate#'
            </CFQUERY>
            <cfif #read_states.recordcount# gt 0>
          <cfif (#a_ins_premium# neq "") >
                        <tr>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1109. <img src="./images/info-01.gif" ALT="Title Insurance Premium"> Title Insurance Premium </td>
                  <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <cfif a_ins_premium neq 'Call for Quote!'>#NumberFormat(a_ins_premium, "_____.__")#<cfelse>#a_ins_premium#</cfif>
                    <cfset a_ins_premium = #a_ins_premium#>
                  </td>
                </tr>
                <cfelse>
                <cfset a_ins_premium = 0>
              </cfif>
            </cfif>
            <cfif #rec_fee# neq "0">
<cfset get_rec_fee(#rec_fee#, #this_state#)>
</cfif>
			<!--- add below to zero out release fees --->
				<cfset rel_fee = 0>
            <cfif #rel_fee# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Release Fee"> Release Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #rel_fee# </td>
              </tr>
            </cfif>
            <cfif #a_fee_total# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1201. <img src="./images/info-01.gif" ALT="Total Recording Fee"> Total Recording Fee </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #a_fee_total# </td>
              </tr>
            </cfif>
            <cfif #city_mort_stamps# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1202. <img src="./images/info-01.gif" ALT="	City Mortgage Stamps"> City Mortgage Stamps </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(city_mort_stamps, '_____.__')# </td>
              </tr>
            </cfif>




            <cfif #state_deed_1# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1203. <img src="./images/info-01.gif" ALT="State Deed"> State Deed </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(state_deed_1, '_____.__')# </td>
              </tr>
            </cfif>
            <cfif #intang_tax# neq "0">
              <tr>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> 1204. <img src="./images/info-01.gif" ALT="Intagible Tax"> Intagible Tax </td>
                <td width=250 align=left valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> #NumberFormat(intang_tax, '_____.__')# </td>
              </tr>
            </cfif>
          </table>
        </cfif>
      </cfoutput> <CFOUTPUT>
        <cfif #loc# eq 4>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top>
<!--- <cfoutput>#line#</cfoutput> ---> <br><br><br>
			<FONT FACE=verdana SIZE=2 color="black"> <b>Please <A href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">click here</A> if you would like to place a new order</b>
			</td>
          </tr>
          <cfelse>
          <tr>
            <td bgcolor="d3d3d3" width=780 align=center valign=top><FONT FACE=verdana SIZE=2 color="black"> <b>If you wish to change loan amount <A href="./title_client_rep_view_calc.cfm?emp=#emp#&comp_id=#comp_id#&pstate=#pstate#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&calc=yes&loanamt_float=#loanamt_float#&a_trigger=1">click here</A> (HUD1 will be recalculated)</b> </td>
          </tr>
        </cfif>
        <tr>
          <td width=780 colspan=3 align=left valign=top bgcolor=e1e1e1><A href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0></A> </td>
        </tr>
      </CFOUTPUT>
      <cfelse>
      <tr>
        <td width=780 align=center valign=top bgcolor=e1e1e1><FONT FACE=verdana SIZE=2 color="black"> Sorry, there is no match of the loan amout you entered with any fees in out database. </td>
      </tr>
    </cfif>
  </cfif>
<!--- <cfoutput>#line#</cfoutput> --->
</table>
</TD>
</TR>
</table>
<!--- </td> <tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>
</tr></tbody></table> --->
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
