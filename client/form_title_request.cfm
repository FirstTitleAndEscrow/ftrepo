<CFPARAM NAME="a_flag" DEFAULT="0">
<CFQUERY datasource="#request.dsn#" NAME="read_user">
SELECT * FROM users WHERE id = #USER_ID_1# ORDER BY lp_lname ASC
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">
SELECT * FROM loan_officers WHERE ID = #lo_ID#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
SELECT * FROM first_title_states ORDER BY st_abbrev ASC
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">
SELECT * FROM zip_info WHERE zip_id = #zip_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_lender">
SELECT * FROM company_lender_assoc WHERE company_id = #read_user.comp_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_user">
SELECT * FROM user_client_assoc WHERE company_id = #read_user.comp_id#
</CFQUERY>
<cfif #get_user.recordcount# GT "0">
  <CFQUERY datasource="#request.dsn#" NAME="retrieve_user">
  SELECT * FROM first_admin WHERE id = #get_user.id#
  </CFQUERY>
</cfif>
<cfif #a_flag# eq 1>
  <SCRIPT LANGUAGE="JavaScript">
window.alert("The LOAN AMOUNT you have entered does not match with any title insurance fees we have on our system for the state you have chosen. Please try to re-process the order inputing another Loan amount.")

</SCRIPT>
</cfif>
<CFIF #title# eq 1>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <html>
  <head>
  <script type="text/javascript">
function put() {
var frm;
frm = document.frm;
if (frm.slastname1.value=='' || frm.sfirstname1.value=='' || frm.sssn1.value=='') {
  if (frm.SearchType.value=='Purchase') {

alert("Since you are selecting Purchase, you need to fill out the FIRST NAME, LAST NAME, SSN in the Seller Information")
frm.slastname1.focus();


}
}
}
</script>
  <script type="text/javascript">
function puta() {
var frm;
frm = document.frm;
if (frm.bhphone1.value=='' || frm.bwphone1.value=='') {
  if (frm.appraisal_type.value=='1004' || frm.appraisal_type.value=='2055') {

alert("The appraisal type you choose, requires to fill out the PHONE numbers from the borrower section")
frm.bhphone1.focus();


}
}
}
</script>
  <script type="text/javascript">
function result() {
var frm;
frm = document.frm;
if (frm.otherpro.value != 'Other') {

  frm.Insured.value = frm.otherpro.options[frm.otherpro.selectedIndex].value;
}else{

frm.Insured.value = 'Type Proposed Insured here';
}
}

</script>
  <script type="text/javascript">
function ChangeVal() {

var frm;
frm = document.frm;

if (frm.otherpro.value == 'Other') {
sl = new String(frm.Insured.value);
 sl = "";
  frm.Insured.value = sl.toUpperCase();

}

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

if (frm.slastname1.value=='' ) {
  if (frm.SearchType.value=='Purchase') {

alert("Please fill out LAST NAME in the Seller Information because it is required when selecting Purchase")
 frm.slastname1.focus();
      return false;
}
}

if (frm.sfirstname1.value=='') {
  if (frm.SearchType.value=='Purchase') {

alert("Please fill out the FIRST NAME in the Seller Information because it is required when selecting Purchase")
 frm.sfirstname1.focus();
      return false;
}
}

if (frm.sssn1.value=='') {
  if (frm.SearchType.value=='Purchase') {

alert("Please fill out the SOCIAL SECURITY NUMBER in the Seller Information because it is required when selecting Purchase")
 frm.sssn1.focus();
      return false;
}
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

if (!isNumeric(frm.bssn1.value)) {

 alert("Only numbers in the format XXXXXXX are allowed in the Social Security field field!")
 frm.bssn1.focus();
      return false;
 }
 if (frm.bssn1.value.length < 9 || frm.bssn1.length > 9) {
 alert("Only 9 digit numbers are allowed for the social security field!")
  frm.bssn1.focus();
      return false;
 }
  if (frm.loanamt_float.value < 100) {
 alert("The number you have entered is too small to qualify for a loan amount!")
  frm.loanamt_float.focus();
      return false;
 }

 if (frm.appraisal_type.value=='') {
 alert("Please select an Appraisal type in order to proceed!")
 frm.appraisal_type.focus();
      return false;
 }

if (frm.bhphone1.value=='') {
  if (frm.appraisal_type.value=='1004' || frm.appraisal_type.value=='2055') {

alert("Please fill out Home Phone in the Seller Information because it is required when selecting 1004 or 2055 Appraisal Type")
 frm.bhphone1.focus();
      return false;
}
}

if (frm.estimate_value.value=='') {

 alert("The Estimate Value field cannot be left blank!")
 frm.estimate_value.focus();
      return false;
 }

if (!isNumeric(frm.estimate_value.value)) {

 alert("Only numbers are allowed in the Estimate Value field!")
 frm.estimate_value.focus();
      return false;
 }
 if (frm.estimate_value.value.length < 1 || frm.estimate_value.value.length > 20) {
 alert("Only numbers between 1 and 20 digits can be entered in the Estimate Value field!")
  frm.estimate_value.focus();
      return false;
 }

if (frm.bwphone1.value=='') {
  if (frm.appraisal_type.value=='1004' || frm.appraisal_type.value=='2055') {

alert("Please fill out the Work Phone in the Borrower Information because it is required when selecting 1004 or 2055 Appraisal Type")
 frm.bwphone1.focus();
      return false;
}
}

  if (frm.bhphone1.value!='') {
if (!isNumeric(frm.bhphone1.value)) {

alert("Only numbers of format XXXXXXXXXX should be placed in the borrower home phone field")
 frm.bhphone1.focus();
      return false;
}
}
  if (frm.bwphone1.value!='') {
if (!isNumeric(frm.bhphone1.value)) {

alert("Only numbers of format XXXXXXXXXX should be placed in the borrower work  phone field")
 frm.bwphone1.focus();
      return false;
}
}

  if (frm.bhphone1.value!='') {
 if (frm.bhphone1.value.length < 10 || frm.bhphone1.value.length > 11) {
 alert("Please enter an existing number including the area code!")
  frm.bhphone1.focus();
      return false;
 }
 }

   if (frm.bwphone1.value!='') {
   if (frm.bwphone1.value.length < 10 || frm.bwphone1.value.length > 11) {
 alert("Please enter an existing number including the area code!")
  frm.bwphone1.focus();
      return false;
 }
 }
return true;

 }
 </script>
  <!---
    if (!IsNumeric(document.frm.loanamt_float.value)){alert('Please enter only numbers or decimal points in the account field')}

      return false;
   frm.loanamt_float.focus();
return true; --->
  <title>1st Title&Escrow, Inc. - Title Request Form</title>
  </head>
  <BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
  <CENTER>
  <table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
  <tr>
    <td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td>
  </tr>
  <tr>
    <td width=607 align=center valign=top><NOBR>
      <!--- <a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a> --->
      <a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td>
  </tr>
  <tr>
    <td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT>
      <p><br>
      <p></td>
  </tr>
  <tr>
    <td width=590 align=center valign=top bgcolor=d3d3d3></TD>
  </tr>
  <tr>
  <td width=607 align=center valign=top>
  <img src="./images/label_title.gif">
  <p>
  <CFFORM NAME="frm" ACTION="./order_verify_title.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST >
    <CFOUTPUT>
      <!--- =================================== --->
      <!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
      <!--- =================================== --->
      <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
        <tr>
          <td width=519 align=CENTER valign=top bgcolor=navy><b><FONT FACE=ARIAL SIZE=2 color="yellow">NOTE: Highlighted areas are required</b> </TD>
        </TR>
        <tr>
          <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
            <CENTER>
              <B>CLIENT SPECIFIC INFORMATION</B>
            </CENTER></TD>
        </TR>
        <TR>
          <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
              <tr>
                <td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Unit No./Loan Officer:</b> </TD>
                <td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Unit No./Loan Processor:</b> </TD>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Name (Last, First) </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_loan_offcr.lo_lname#, #read_loan_offcr.lo_fname#</B> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Name (Last, First) </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_user.lp_lname#, #read_user.lp_fname#</B> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone No. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_phone#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone No. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_user.lp_phone#</b> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_ext#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_ext#</b> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Fax </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_fax#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Fax </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_fax#</b> </td>
              </tr>
              <tr>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Email </td>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Email </td>
              </tr>
              <tr>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_email#</b> </td>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_email#</b> </td>
              </tr>
            </table></td>
        </tr>
      </table>
    </CFOUTPUT>
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>BORROWER / SELLER INFORMATION</B>
          </CENTER>
          <br>
          <FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Borrowers Info:</b> </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- =================================== --->
            <!--- ===/ Borrowers Info [ FIRST ]  \=== --->
            <!--- =================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  1.>> </td>
              <td width=90 bgcolor="yellow" align=center valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Last Name<br>
                <b>
                <CFINPUT TYPE="Text" NAME="blastname1" SIZE=11 MAXLENGTH=25

							        REQUIRED="yes" Message="You must enter the last name of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
              </td>
              <td width=90 bgcolor="yellow" align=center valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> First Name<br>
                </b>
                <cfINPUT TYPE="Text" NAME="bfirstname1" SIZE=11 MAXLENGTH=15
									REQUIRED="yes" Message="You must enter the first name of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
              </td>
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="bminame1" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="yellow" align=center valign=top><b> <FONT FACE=ARIAL SIZE=1 color="black"> Social Sec. No.<br>
                </b>
                <cfINPUT TYPE="Text" NAME="bssn1" SIZE=13 MAXLENGTH=11
									REQUIRED="yes" Message="You must enter the social security of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;"
									>
              </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <cfINPUT TYPE="Text" NAME="bhphone1" SIZE=12 MAXLENGTH=15
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
									clear: none;"
									 >
              </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <cfINPUT TYPE="Text" NAME="bwphone1" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="bext1" SIZE=4 MAXLENGTH=5
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
            <!--- =================================== --->
            <!--- ===/ Borrowers Info [ SECOND ] \=== --->
            <!--- =================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  2.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="blastname2" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="bfirstname2" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="bminame2" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="bssn2" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="bhphone2" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="bwphone2" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="bext2" SIZE=4 MAXLENGTH=5
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
              <td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR> </td>
              <td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxxx</font>&nbsp;&nbsp; ^ </td>
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> &nbsp; </td>
            </tr>
          </table></td>
      </tr>
      <!--- ======================================================================= --->
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Sellers Info:</b> </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- ================================== --->
            <!--- ===/  SELLERS Info [ FIRST ]  \=== --->
            <!--- ================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  1.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="slastname1" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="sfirstname1" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="sminame1" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="sssn1" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="shphone1" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="swphone1" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="sext1" SIZE=4 MAXLENGTH=5
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
            <!--- ================================== --->
            <!--- ===/ SELLERS  Info [ SECOND ] \=== --->
            <!--- ================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  2.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="slastname2" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="sfirstname2" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="sminame2" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="sssn2" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="shphone2" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="swphone2" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="sext2" SIZE=4 MAXLENGTH=5
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
              <td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR> </td>
              <td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxxx</font>&nbsp;&nbsp; ^ </td>
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> &nbsp; </td>
            </tr>
          </table></td>
      </tr>
    </table>
    <!--- ======================================================================== --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=right valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <center>
            <B>PROPERTY ADDRESS</B>
          </center></TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- =================================== --->
            <!--- ===/ Property  Info [ FIRST ]  \=== --->
            <!--- =================================== --->
            <tr>

            <td width=205 bgcolor="yellow" align=right valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Street Address <br>
              <b> </td>
            <CFOUTPUT>
              <td width=314  bgcolor="yellow" align=left valign=top><CFINPUT TYPE="Text" NAME="paddress" REQUIRED="Yes" Message="You must enter the PROPRTY ADDRESS" SIZE=50 MAXLENGTH=80
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
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
                <td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray"> City, State, Zip:</td>
                <td width=314  bgcolor="f1f1f1" align=left><FONT FACE=verdana SIZE=1 color="blue"> <b><NOBR>#read_zip_code.city#, &nbsp;#read_zip_code.state# &nbsp;&nbsp;#read_zip_code.zip# </NOBR></b> </td>
              </tr>
              <tr>
                <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> County <br>
                </td>
                <td width=314  bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_zip_code.county#</b> </td>
              </tr>
            </CFOUTPUT>
            <tr>
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Legal Description <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><input type="text" name="plegaldesc" size=50 maxlength=150
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
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Property Use <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><select name="prop_use_type"
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
                  <OPTION VALUE="Primary Residence" SELECTED>Primary Residence</OPTION>
                  <OPTION Value="Investment/Other">Investment/Other</OPTION>
                </select>
              </td>
            </tr>
            <tr>
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Is this a Condo or PUD <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><select name="condo_pud"
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
                  <OPTION VALUE="N/A" SELECTED>N/A</OPTION>
                  <OPTION VALUE="Condo" >Condo</OPTION>
                  <OPTION Value="PUD">PUD</OPTION>
                </select>
              </td>
            </tr>
          </table></td>
      </tr>
    </table>
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/       [ COMMENTS ]  TOP         \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>LOAN NUMBER</B>
          </CENTER></TD>
      </TR>
      <tr>
        <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Loan Number <br>
        </td>
        <td width=314  bgcolor="f1f1f1" align=left valign=top><CFINPUT TYPE="Text" NAME="loan_number"
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
    </table>
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>COMMENTS</B>
          </CENTER></TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <tr>
              <td width=519 bgcolor="f1f1f1" align=center valign=top><TEXTAREA NAME="a_COMMENT" rows=9 cols=70 wrap="virtual"
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
									clear: none;" ></textarea>
              </td>
            </tr>
          </table></td>
      </tr>
    </table>
    <!--- ======================================================================= --->
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/        [ PAYOFF ]  TOP          \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>PAYOFF INFORMATION:</B>
          </CENTER></TD>
      </TR>
      <tr>
        <td width=519 align=center valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=1>Please forward borrower authorization if needed for payoff requests by facsimile (301-279-7930) or <a href="mailto:webmaster@firsttitleservices.com">email</a><br>
          or upload a file <FONT FACE=ARIAL SIZE=1 color="gray">
          <input type="file" name="file_upload"
									size=25 maxlength=75
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
          </FONT> </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- =================================== --->
            <!--- ===/ Payoff Lender  [ FIRST ]  \=== --->
            <!--- =================================== --->
            <tr>
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Lender<br>
                <INPUT TYPE="Text" NAME="polender1" size=15 maxlength=25 VALUE=""
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
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Account Number<br>
                <INPUT TYPE="Text" NAME="poacctno1" size=20 maxlength=30 VALUE=""
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
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone Number<br>
                <INPUT TYPE="Text" NAME="pophone1"  size=12 maxlength=20
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
            <!--- ==================================== --->
            <!--- ===/ Payoff Lender  [ SECOND ]  \=== --->
            <!--- ==================================== --->
            <tr>
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Second Lender<br>
                <INPUT TYPE="Text" NAME="polender2" size=15 maxlength=25 VALUE=""
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
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Account Number<br>
                <INPUT TYPE="Text" NAME="poacctno2" size=20 maxlength=30 VALUE=""
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
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone Number<br>
                <INPUT TYPE="Text" NAME="pophone2"  size=12 maxlength=20
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
              <td width=172 bgcolor="f1f1f1" align=right valign=top></td>
              <td width=172  bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> &nbsp; </td>
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^ </td>
            </tr>
          </table></td>
      </tr>
      <!--- ======================================================================= --->
    </table>
    <!--- ======================================================================== --->
    <!--- ================================================ --->
    <!--- ===/          [ TITLE INSURANCE ]           \=== --->
    <!--- ================================================ --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>TITLE INSURANCE INFORMATION:</B>
          </CENTER></TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <tr>
              <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Transaction Type </td>
              <td width=150 bgcolor="f1f1f1" align=left valign=top><select name="SearchType" onchange="put()"
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
                  <OPTION VALUE="Purchase">Purchase</OPTION>
                  <OPTION VALUE="Refinance" selected>Refinance</OPTION>
                  <OPTION VALUE="New Second Mortgage">New Second Mortgage</OPTION>
                </select>
              </td>
              <td width=100 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Deed Transfer </td>
              <td width=144 bgcolor="f1f1f1" align=left valign=top><select name="Deedtransfer"
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
                  <OPTION VALUE="N" SELECTED>No</OPTION>
                  <OPTION VALUE="Y" selected>Yes</OPTION>
                </select>
              </td>
            </tr>
            <tr>
              <td width=125 bgcolor="yellow" align=right valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Proposed Insured</b> </td>
              <!--- <CFIF #get_lender.recordcount# GT 1> --->
              <td width=394 COLSPAN=3 bgcolor="yellow" align=left valign=top><select name="otherpro" onchange="result()"
											size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: 003F1E;
											background-color: white;
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
                  <OPTION VALUE=""></OPTION>
                  <CFOUTPUT QUERY="get_lender">
                    <OPTION VALUE="#Lender_name#">#Lender_Name# </OPTION>
                  </CFOUTPUT>
                  <OPTION VALUE="Other">Other </OPTION>
                </select>
              </td>
            </tr>
            <tr>
              <td width=125 bgcolor="yellow" align=right valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Your Choice </td>
              </b>
              <td width=394 bgcolor="yellow" COLSPAN=3 align=left valign=top><cfINPUT TYPE="Text" NAME="Insured"  size=50 maxlength=70 onFocus = "ChangeVal()"
									REQUIRED="yes" Message="You must enter Proposed Insured in the TITLE INSURANCE Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;"
									>
              </td>
            </tr>
            <!--- <cfelse>
<cfoutput><td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#get_lender.lender_name#</b>

						</td></tr></cfoutput>
				</cfif>		 --->
            <tr>
              <td width=125 bgcolor="yellow" align=right valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Loan Amt </b> </td>
              <td COLSPAN=3 width=394 bgcolor="yellow" align=left valign=top><INPUT NAME="loanamt_float" SIZE=20 MAXLENGTH=120

									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
                <FONT FACE=ARIAL SIZE=1 color="blue">format &nbsp;&nbsp;^ xxxxxx^ &nbsp;&nbsp; numbers only</font></td>
            </tr>
            <!--- REQUIRED="yes" Message="You must enter the LOAN AMOUNT in the TITLE INSURANCE Section" --->
            <tr>
              <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Loan Type </td>
              <td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top><select name="loan_type_111"
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
                  <OPTION VALUE="Conventional" selected>Conventional</OPTION>
                  <!--- <OPTION VALUE="Sub-Prime" >Sub-Prime</OPTION> --->
                  <OPTION VALUE="VA">VA</OPTION>
                  <OPTION VALUE="FHA">FHA</OPTION>
                </select>
              </td>
            </tr>
            <tr>
              <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Loan Program </td>
              <td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top><select name="loan_program_333"
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
                  <OPTION VALUE="Fixed Rate" selected>Fixed Rate</OPTION>
                  <OPTION VALUE="ARM" >ARM</OPTION>
                  <OPTION VALUE="Neg. Amort.">Neg. Amort.</OPTION>
                </select>
              </td>
            </tr>
          </table></td>
      </tr>
      <!--- ======================================================================= --->
    </table>
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
    <tr>
      <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
        <CENTER>
          <B>Verify Order was Received</B>
        </CENTER>
        <br>
        <FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address or fax number, you will receive a confirmation e-mail of your order having been received by us. </TD>
    </TR>
    <TR>
    <TD width=519 align=center valign=top bgcolor=d3d3d3>
    <cfoutput>
      <table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT>
            <INPUT NAME="Verifyemail" SIZE=40 MAXLENGTH=120 value="#read_user.lp_email#"
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
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to another other e-mail address.</FONT><br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
            <INPUT NAME="Verifyemail_2" VALUE="" SIZE=40 MAXLENGTH=120
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
            <br>
          </td>
        </tr>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL color=black SIZE=1>If you do not request email verification, enter fax number below.</FONT><br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Fax:</FONT>
            <INPUT NAME="fax_no" VALUE="" SIZE=40 MAXLENGTH=120
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
            <br>
          </td>
        </tr>
        <tr>
          <td width=519 align=left colspan=2 valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
            <CENTER>
              <B>Third Party Access Request</B>
            </CENTER>
            <br>
          </TD>
        </TR>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> (Optional) Enter Third Party ID </font>
            <INPUT NAME="fax_no" VALUE="" SIZE=40 MAXLENGTH=120
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
            <br>
            <p><font color="#990000#" size="2" face="Times New Roman, Times, serif"><a href="https://#cgi.server_name#/thirdpartyregister.cfm" target="thirdpartyregister" onClick="window.open('','thirdpartyregister','width=620,height=400,status=0,resizable=0,scrollbars=0')">Forgot your password? Click here</a> </font></p></td>
        </TR>
      </table>
      </td>
      </tr>
      </table>
      <!--- ======================================================================= --->
      <!--- =========================================== --->
      <!--- ===/    [ RECEIVE REPORT ]  TOP        \=== --->
      <!--- =========================================== --->
      <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>Request copy of Final Report</B>
          </CENTER>
          <br>
          <FONT FACE=arial SIZE=1 color="black"><B>If you would like to receive a copy of the final report, please provide us with an email address. </TD>
      </TR>
      <TR>
      <TD width=519 align=center valign=top bgcolor=d3d3d3>
      <table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT>
            <INPUT NAME="RptbyEmail" SIZE=40 MAXLENGTH=120 value="#read_user.lp_email#"
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
            <br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
            <INPUT NAME="Verifyemail_3" VALUE=""  SIZE=40 MAXLENGTH=120
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
        <tr>
          <td width=519 align=left colspan=2 valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
            <CENTER>
              <B>ICL REQUEST</B>
            </CENTER>
            <br>
          </TD>
        </TR>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Closing Protection Letter Needed ?"
            <!--- </td><td width=259  bgcolor="f1f1f1" align=left valign=top> --->
            <FONT FACE=ARIAL SIZE=2 color="red"> <NOBR>&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif">
            <INPUT TYPE="RADIO" NAME="request_ICL" VALUE="No" checked>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif">
            <INPUT TYPE="RADIO"  NAME="request_icl" VALUE="Yes" onSelect="ClickVal()">
            </NOBR> </td>
        </TR>
        <cfif #appraisal# eq 1>
          </tr>

          <tr>
            <td width=519 align=left colspan=2 valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
              <CENTER>
                <B>APPRAISAL REQUEST</B>
              </CENTER>
              <br>
            </TD>
          </TR>
          <tr>
            <td width=519 bgcolor="navy" colspan = 2 align=center valign=top><FONT FACE=ARIAL SIZE=2 color="yellow"> <b> Since you have requested an appraisal, please provide us with an appraisal type </b> </td>
          </TR>
          <tr>
            <td width=519 colspan = 2 bgcolor="yellow" align=center valign=top><b><FONT FACE=ARIAL SIZE=2 color="red">Appraisal Type<img src="./images/arrow_down.gif"></b> <br>
              <select name="appraisal_type" onchange="puta()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: 003F1E;
								background-color: white;
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
                <OPTION VALUE="" SELECTED>Select</OPTION>
                <OPTION VALUE="1004">1004 - Full Appraisal</OPTION>
                <OPTION VALUE="1073">1073 - Condo)</OPTION>
                <OPTION VALUE="1025">1025 - Multi-family</OPTION>
                <OPTION VALUE="2055">2055 - Inerior</OPTION>
                <OPTION VALUE="2055d">2055 - Drive By</OPTION>
                <OPTION VALUE="704">704 - Drive By</OPTION>
                <OPTION VALUE="2070">2070 or 2075 - Evaluation</OPTION>
                <OPTION VALUE="2000">2000 - Review</OPTION>
              </select>
            </td>
          </TR>
          <tr>
            <td width=519 bgcolor="yellow" align=left valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Estimated Value <FONT FACE=verdana SIZE=1 color="red">(format xxxxxxxxxx)<b>&nbsp;&nbsp;&nbsp;
              <input type="text" name="estimate_value" size=25 maxlength=25
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
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
        </cfif>
      </table>
    </cfoutput>
    </td>
    </tr>
    </table>
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
    <!--- <tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>APPRAISAL REQUEST</B></CENTER>
				</TD>
		</TR> --->
    <TR>
    <TD width=519 align=center valign=top bgcolor=d3d3d3>
    <table width=518 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
    <!--- ==================================== --->
    <!--- ===/ Appraisal  Info [       ]  \=== --->
    <!--- ==================================== --->
    <!--- 	<tr>
						<td width=518 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Want an appraisal?
					 <NOBR>&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif">  <INPUT TYPE="RADIO" NAME="do_appraisal" VALUE="No" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="do_appraisal" VALUE="Yes"></NOBR>
						</td></tr>
				 --->
    <tr>
      <td width=518  bgcolor="d3d3d3" align=right valign=top><br>
        <NOBR>
        <input type=image border=0 src="./images/button_proceed.gif">
&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td>
    </tr>
    </td>
    </tr>
    <CFOUTPUT QUERY="read_zip_code">
      <INPUT TYPE=HIDDEN NAME="pcity"   VALUE="#city#">
      <INPUT TYPE=HIDDEN NAME="pstate"  VALUE="#state#">
      <INPUT TYPE=HIDDEN NAME="pzip"    VALUE="#zip#">
      <INPUT TYPE=HIDDEN NAME="pcounty" VALUE="#county#">
    </CFOUTPUT>
  </cfform>
  </body>
  </html>
  <cfelseif #property# eq 1>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <html>
  <head>
  <script type="text/javascript">
function puta() {
var frm;
frm = document.frm;
if (frm.bhphone1.value=='' || frm.bwphone1.value=='') {
  if (frm.appraisal_type.value=='1004' || frm.appraisal_type.value=='2055') {

alert("The appraisal type you choose, requires to fill out the PHONE numbers from the borrower section")
frm.bhphone1.focus();


}
}
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


if (!isNumeric(frm.bssn1.value)) {

 alert("Only numbers in the format XXXXXXX are allowed in the Social Security field field!")
 frm.bssn1.focus();
      return false;
 }
 if (frm.bssn1.value.length < 9 || frm.bssn1.length > 9) {
 alert("Only 9 digit numbers are allowed for the social security field!")
  frm.bssn1.focus();
      return false;
 }

 if (frm.appraisal_type.value=='') {
 alert("Please select an Appraisal type in order to proceed!")
 frm.appraisal_type.focus();
      return false;
 }


 if (frm.estimate_value.value=='') {

 alert("The Estimate Value field cannot be left blank!")
 frm.estimate_value.focus();
      return false;
 }

if (!isNumeric(frm.estimate_value.value)) {

 alert("Only numbers are allowed in the Estimate Value field!")
 frm.estimate_value.focus();
      return false;
 }
 if (frm.estimate_value.value.length < 1 || frm.estimate_value.value.length > 20) {
 alert("Only numbers between 1 and 20 digits can be entered in the Estimate Value field!")
  frm.estimate_value.focus();
      return false;
 }

if (frm.bhphone1.value=='') {
  if (frm.appraisal_type.value=='1004' || frm.appraisal_type.value=='2055') {

alert("Please fill out Home Phone in the Seller Information because it is required when selecting 1004 or 2055 Appraisal Type")
 frm.bhphone1.focus();
      return false;
}
}

if (frm.bwphone1.value=='') {
  if (frm.appraisal_type.value=='1004' || frm.appraisal_type.value=='2055') {

alert("Please fill out the Work Phone in the Borrower Information because it is required when selecting 1004 or 2055 Appraisal Type")
 frm.bwphone1.focus();
      return false;
}
}

 if (frm.bhphone1.value!='') {
if (!isNumeric(frm.bhphone1.value)) {

alert("Only numbers of format XXXXXXXXXX should be placed in the borrower home phone field")
 frm.bhphone1.focus();
      return false;
}
}
  if (frm.bwphone1.value!='') {
if (!isNumeric(frm.bhphone1.value)) {

alert("Only numbers of format XXXXXXXXXX should be placed in the borrower work  phone field")
 frm.bwphone1.focus();
      return false;
}
}
 if (frm.bhphone1.value!='') {
 if (frm.bhphone1.value.length < 10 || frm.bhphone1.value.length > 11) {
 alert("Please enter an existing number including the area code!")
  frm.bhphone1.focus();
      return false;
 }
 }

   if (frm.bwphone1.value!='') {
   if (frm.bwphone1.value.length < 10 || frm.bwphone1.value.length > 11) {
 alert("Please enter an existing number including the area code!")
  frm.bwphone1.focus();
      return false;
 }
 }
return true;

 }
 </script>
  <title>1st Title&Escrow, Inc. - Title Request Form</title>
  </head>
  <BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
  <CENTER>
  <table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
  <tr>
    <td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td>
  </tr>
  <tr>
    <td width=607 align=center valign=top><NOBR>
      <!--- <a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a> --->
      <a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td>
  </tr>
  <tr>
    <td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT>
      <p><br>
      <p></td>
  </tr>
  <tr>
    <td width=590 align=center valign=top bgcolor=d3d3d3></TD>
  </tr>
  <tr>
  <td width=607 align=center valign=top>
  <img src="./images/property_title.gif">
  <p>
  <CFFORM NAME="frm" ACTION="./order_verify_property.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>
    <CFOUTPUT>
      <!--- =================================== --->
      <!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
      <!--- =================================== --->
      <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
        <tr>
          <td width=519 align=CENTER valign=top bgcolor=navy><b><FONT FACE=ARIAL SIZE=2 color="yellow">NOTE: Highlighted areas are required</b> </TD>
        </TR>
        <tr>
          <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
            <CENTER>
              <B>CLIENT SPECIFIC INFORMATION</B>
            </CENTER>
          </TD>
        </TR>
        <TR>
          <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
              <tr>
                <td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Unit No./Loan Officer:</b> </TD>
                <td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Unit No./Loan Processor:</b> </TD>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Name (Last, First) </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_loan_offcr.lo_lname#, #read_loan_offcr.lo_fname#</B> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Name (Last, First) </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_user.lp_lname#, #read_user.lp_fname#</B> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone No. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_phone#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone No. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_user.lp_phone#</b> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_ext#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_ext#</b> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Fax </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_fax#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Fax </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_fax#</b> </td>
              </tr>
              <tr>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Email </td>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Email </td>
              </tr>
              <tr>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_email#</b> </td>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_email#</b> </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </CFOUTPUT>
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>BORROWER / SELLER INFORMATION</B>
          </CENTER>
          <br>
          <FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Borrowers Info:</b> </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- =================================== --->
            <!--- ===/ Borrowers Info [ FIRST ]  \=== --->
            <!--- =================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  1.>> </td>
              <td width=90 bgcolor="yellow" align=center valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Last Name<br>
                </b>
                <CFINPUT TYPE="Text" NAME="blastname1" SIZE=11 MAXLENGTH=25

							        REQUIRED="yes" Message="You must enter the last name of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
              </td>
              <td width=90 bgcolor="yellow" align=center valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> First Name<br>
                </b>
                <cfINPUT TYPE="Text" NAME="bfirstname1" SIZE=11 MAXLENGTH=15
									REQUIRED="yes" Message="You must enter the first name of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
              </td>
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="bminame1" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="yellow" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="black"> <b>Social Sec. No.<br>
                </b>
                <cfINPUT TYPE="Text" NAME="bssn1" SIZE=13 MAXLENGTH=11
									REQUIRED="yes" Message="You must enter the social security of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
              </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <cfINPUT TYPE="Text" NAME="bhphone1" SIZE=12 MAXLENGTH=15
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
									clear: none;"
									 >
              </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <cfINPUT TYPE="Text" NAME="bwphone1" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="bext1" SIZE=4 MAXLENGTH=5
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
            <!--- =================================== --->
            <!--- ===/ Borrowers Info [ SECOND ] \=== --->
            <!--- =================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  2.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="blastname2" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="bfirstname2" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="bminame2" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="bssn2" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="bhphone2" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="bwphone2" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="bext2" SIZE=4 MAXLENGTH=5
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
              <td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR> </td>
              <td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxxx</font>&nbsp;&nbsp; ^ </td>
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> &nbsp; </td>
            </tr>
          </table>
        </td>
      </tr>
      <!--- ======================================================================= --->
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Sellers Info:</b> </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- ================================== --->
            <!--- ===/  SELLERS Info [ FIRST ]  \=== --->
            <!--- ================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  1.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="slastname1" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="sfirstname1" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="sminame1" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="sssn1" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="shphone1" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="swphone1" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="sext1" SIZE=4 MAXLENGTH=5
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
            <!--- ================================== --->
            <!--- ===/ SELLERS  Info [ SECOND ] \=== --->
            <!--- ================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  2.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="slastname2" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="sfirstname2" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="sminame2" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="sssn2" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="shphone2" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="swphone2" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="sext2" SIZE=4 MAXLENGTH=5
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
              <td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR> </td>
              <td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxxx</font>&nbsp;&nbsp; ^ </td>
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> &nbsp; </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <!--- ======================================================================== --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=right valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <center>
            <B>PROPERTY ADDRESS</B>
          </center>
        </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- =================================== --->
            <!--- ===/ Property  Info [ FIRST ]  \=== --->
            <!--- =================================== --->
            <tr>

            <td width=205 bgcolor="yellow" align=right valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Street Address <br>
              </b> </td>
            <CFOUTPUT>
              <td width=314  bgcolor="yellow" align=left valign=top><CFINPUT TYPE="Text" NAME="paddress" REQUIRED="Yes" Message="You must enter the PROPRTY ADDRESS" SIZE=50 MAXLENGTH=80
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
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
                <td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray"> City, State, Zip:</td>
                <td width=314  bgcolor="f1f1f1" align=left><FONT FACE=verdana SIZE=1 color="blue"> <b><NOBR>#read_zip_code.city#, &nbsp;#read_zip_code.state# &nbsp;&nbsp;#read_zip_code.zip# </NOBR></b> </td>
              </tr>
              <tr>
                <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> County <br>
                </td>
                <td width=314  bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_zip_code.county#</b> </td>
              </tr>
            </CFOUTPUT>
            <tr>
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Legal Description <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><input type="text" name="plegaldesc" size=50 maxlength=150
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
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Property Use <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><select name="prop_use_type"
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
                  <OPTION VALUE="Primary Residence" SELECTED>Primary Residence</OPTION>
                  <OPTION Value="Investment/Other">Investment/Other</OPTION>
                </select>
              </td>
            </tr>
            <tr>
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Is this a Condo or PUD <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><select name="condo_pud"
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
                  <OPTION VALUE="N/A" SELECTED>N/A</OPTION>
                  <OPTION VALUE="Condo" >Condo</OPTION>
                  <OPTION Value="PUD">PUD</OPTION>
                </select>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/       [ COMMENTS ]  TOP         \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>LOAN NUMBER</B>
          </CENTER>
        </TD>
      </TR>
      <tr>
        <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Loan Number <br>
        </td>
        <td width=314  bgcolor="f1f1f1" align=left valign=top><CFINPUT TYPE="Text" NAME="loan_number"
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
    </table>
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>COMMENTS</B>
          </CENTER>
        </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <tr>
              <td width=519 bgcolor="f1f1f1" align=center valign=top><TEXTAREA NAME="a_COMMENT" rows=9 cols=70 wrap="virtual"
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
									clear: none;" ></textarea>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <!--- ======================================================================= --->
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/        [ PAYOFF ]  TOP          \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>PAYOFF INFORMATION:</B>
          </CENTER>
        </TD>
      </TR>
      <tr>
        <td width=519 align=center valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=1>Please forward borrower authorization if needed for payoff requests by facsimile (301-279-7930) or <a href="mailto:webmaster@firsttitleservices.com">email</a><br>
          or upload a file <FONT FACE=ARIAL SIZE=1 color="gray">
          <input type="file" name="file_upload"
									size=25 maxlength=75
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
          </FONT> </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- =================================== --->
            <!--- ===/ Payoff Lender  [ FIRST ]  \=== --->
            <!--- =================================== --->
            <tr>
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Lender<br>
                <INPUT TYPE="Text" NAME="polender1" size=15 maxlength=25 VALUE=""
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
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Account Number<br>
                <INPUT TYPE="Text" NAME="poacctno1" size=20 maxlength=30 VALUE=""
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
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone Number<br>
                <INPUT TYPE="Text" NAME="pophone1"  size=12 maxlength=20
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
            <!--- ==================================== --->
            <!--- ===/ Payoff Lender  [ SECOND ]  \=== --->
            <!--- ==================================== --->
            <tr>
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Second Lender<br>
                <INPUT TYPE="Text" NAME="polender2" size=15 maxlength=25 VALUE=""
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
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Account Number<br>
                <INPUT TYPE="Text" NAME="poacctno2" size=20 maxlength=30 VALUE=""
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
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone Number<br>
                <INPUT TYPE="Text" NAME="pophone2"  size=12 maxlength=20
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
              <td width=172 bgcolor="f1f1f1" align=right valign=top></td>
              <td width=172  bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> &nbsp; </td>
              <td width=172 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^ </td>
            </tr>
          </table>
        </td>
      </tr>
      <!--- ======================================================================= --->
    </table>
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
    <tr>
      <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
        <CENTER>
          <B>Verify Order was Received</B>
        </CENTER>
        <br>
        <FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address or fax number, you will receive a confirmation e-mail of your order having been received by us. </TD>
    </TR>
    <TR>
    <TD width=519 align=center valign=top bgcolor=d3d3d3>
    <cfoutput>
      <table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT>
            <INPUT NAME="Verifyemail" SIZE=40 MAXLENGTH=120 value="#read_user.lp_email#"
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
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to another other e-mail address.</FONT><br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
            <INPUT NAME="Verifyemail_2" VALUE="" SIZE=40 MAXLENGTH=120
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
            <br>
          </td>
        </tr>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL color=black SIZE=1>If you do not request email verification, enter fax number below.</FONT><br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Fax:</FONT>
            <INPUT NAME="fax_no" VALUE="" SIZE=40 MAXLENGTH=120
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
            <br>
          </td>
        </tr>
      </table>
      </td>
      </tr>
      </table>
      <!--- ======================================================================= --->
      <!--- =========================================== --->
      <!--- ===/    [ RECEIVE REPORT ]  TOP        \=== --->
      <!--- =========================================== --->
      <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>Request copy of Final Report</B>
          </CENTER>
          <br>
          <FONT FACE=arial SIZE=1 color="black"><B>If you would like to receive a copy of the final report, please provide us with an email address. </TD>
      </TR>
      <TR>
      <TD width=519 align=center valign=top bgcolor=d3d3d3>
      <table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT>
            <INPUT NAME="RptbyEmail" SIZE=40 MAXLENGTH=120 value="#read_user.lp_email#"
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
            <br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
            <INPUT NAME="Verifyemail_3" VALUE=""  SIZE=40 MAXLENGTH=120
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
        <cfif #appraisal# eq 1>
          </tr>

          <tr>
            <td width=519 align=left colspan=2 valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
              <CENTER>
                <B>APPRAISAL REQUEST</B>
              </CENTER>
              <br>
            </TD>
          </TR>
          <tr>
            <td width=519 colspan=2 bgcolor="navy" align=center valign=top><FONT FACE=ARIAL SIZE=2 color="yellow"> <b> Since you have requested an appraisal, please provide us with an appraisal type </b> </td>
          </TR>
          <tr>
            <td width=519 colspan = 2 bgcolor="yellow" align=center valign=top><b><FONT FACE=ARIAL SIZE=2 color="red">Appraisal Type<img src="./images/arrow_down.gif"></b> <br>
              <select name="appraisal_type" onchange="puta()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: 003F1E;
								background-color: white;
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
                <OPTION VALUE="" SELECTED>Select</OPTION>
                <OPTION VALUE="1004">1004 - Full Appraisal</OPTION>
                <OPTION VALUE="1073">1073 - Condo)</OPTION>
                <OPTION VALUE="1025">1025 - Multi-family</OPTION>
                <OPTION VALUE="2055">2055 - Inerior</OPTION>
                <OPTION VALUE="2055d">2055 - Drive By</OPTION>
                <OPTION VALUE="704">704 - Drive By</OPTION>
                <OPTION VALUE="2070">2070 or 2075 - Evaluation</OPTION>
                <OPTION VALUE="2000">2000 - Review</OPTION>
              </select>
            </td>
          </TR>
          <tr>
            <td width=519 bgcolor="yellow" align=left valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Estimated Value <FONT FACE=verdana SIZE=1 color="red">(format xxxxxxxxxx)<b>&nbsp;&nbsp;&nbsp;
              <input type="text" name="estimate_value" size=25 maxlength=25
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
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
        </cfif>
      </table>
    </cfoutput>
    </td>
    </tr>
    </table>
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
    <!--- <tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>APPRAISAL REQUEST</B></CENTER>
				</TD>
		</TR> --->
    <TR>
    <TD width=519 align=center valign=top bgcolor=d3d3d3>
    <table width=518 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
    <!--- ==================================== --->
    <!--- ===/ Appraisal  Info [       ]  \=== --->
    <!--- ==================================== --->
    <!--- 	<tr>
						<td width=518 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Want an appraisal?
					 <NOBR>&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif">  <INPUT TYPE="RADIO" NAME="do_appraisal" VALUE="No" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="do_appraisal" VALUE="Yes"></NOBR>
						</td></tr>
				 --->
    <tr>
      <td width=518  bgcolor="d3d3d3" align=right valign=top><br>
        <NOBR>
        <input type=image border=0 src="./images/button_proceed.gif">
&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td>
    </tr>
    </td>
    </tr>
    <CFOUTPUT QUERY="read_zip_code">
      <INPUT TYPE=HIDDEN NAME="pcity"   VALUE="#city#">
      <INPUT TYPE=HIDDEN NAME="pstate"  VALUE="#state#">
      <INPUT TYPE=HIDDEN NAME="pzip"    VALUE="#zip#">
      <INPUT TYPE=HIDDEN NAME="pcounty" VALUE="#county#">
    </CFOUTPUT>
  </cfform>
  </body>
  </html>
  <cfelseif #appraisal# eq 1>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <html>
  <head>
  <script type="text/javascript">
function puta() {
var frm;
frm = document.frm;
if (frm.bhphone1.value=='' || frm.bwphone1.value=='') {
  if (frm.appraisal_type.value=='1004' || frm.appraisal_type.value=='2055') {

alert("The appraisal type you choose, requires to fill out the PHONE numbers from the borrower section")
frm.bhphone1.focus();


}
}
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


if (!isNumeric(frm.bssn1.value)) {

 alert("Only numbers in the format XXXXXXX are allowed in the Social Security field field!")
 frm.bssn1.focus();
      return false;
 }
 if (frm.bssn1.value.length < 9 || frm.bssn1.length > 9) {
 alert("Only 9 digit numbers are allowed for the social security field!")
  frm.bssn1.focus();
      return false;
 }

 if (frm.appraisal_type.value=='') {
 alert("Please select an Appraisal type in order to proceed!")
 frm.appraisal_type.focus();
      return false;
 }

if (frm.bhphone1.value=='') {
  if (frm.appraisal_type.value=='1004' || frm.appraisal_type.value=='2055') {

alert("Please fill out Home Phone in the Seller Information because it is required when selecting 1004 or 2055 Appraisal Type")
 frm.bhphone1.focus();
      return false;
}
}

if (frm.bwphone1.value=='') {
  if (frm.appraisal_type.value=='1004' || frm.appraisal_type.value=='2055') {

alert("Please fill out the Work Phone in the Borrower Information because it is required when selecting 1004 or 2055 Appraisal Type")
 frm.bwphone1.focus();
      return false;
}
}

 if (frm.bhphone1.value!='') {
if (!isNumeric(frm.bhphone1.value)) {

alert("Only numbers of format XXXXXXXXXX should be placed in the borrower home phone field")
 frm.bhphone1.focus();
      return false;
}
}
  if (frm.bwphone1.value!='') {
if (!isNumeric(frm.bhphone1.value)) {

alert("Only numbers of format XXXXXXXXXX should be placed in the borrower work  phone field")
 frm.bwphone1.focus();
      return false;
}
}
 if (frm.bhphone1.value!='') {
 if (frm.bhphone1.value.length < 10 || frm.bhphone1.value.length > 11) {
 alert("Please enter an existing number including the area code!")
  frm.bhphone1.focus();
      return false;
 }
 }

   if (frm.bwphone1.value!='') {
   if (frm.bwphone1.value.length < 10 || frm.bwphone1.value.length > 11) {
 alert("Please enter an existing number including the area code!")
  frm.bwphone1.focus();
      return false;
 }
 }
 if (!isNumeric(frm.estimate_value.value)) {

 alert("Only numbers are allowed in the Estimate Value field!")
 frm.estimate_value.focus();
      return false;
 }
 if (frm.estimate_value.value.length < 1 || frm.estimate_value.value.length > 20) {
 alert("Only numbers between 1 and 20 digits can be entered in the Estimate Value field!")
  frm.estimate_value.focus();
      return false;
 }

if (!isNumeric(frm.bssn1.value)) {

 alert("Only numbers in the format XXXXXXX are allowed in the Social Security field field!")
 frm.bssn1.focus();
      return false;
 }
return true;

 }
 </script>
  <title>1st Title&Escrow, Inc. - Title Request Form</title>
  </head>
  <BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
  <CENTER>
  <table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
  <tr>
    <td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td>
  </tr>
  <tr>
    <td width=607 align=center valign=top><NOBR>
      <!--- <a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a> --->
      <a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td>
  </tr>
  <tr>
    <td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT>
      <p><br>
      <p></td>
  </tr>
  <tr>
    <td width=590 align=center valign=top bgcolor=d3d3d3></TD>
  </tr>
  <tr>
  <td width=607 align=center valign=top>
  <img src="./images/appraisal_title.gif">
  <p>
  <CFFORM NAME="frm" ACTION="./title_appraisal_form.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>
    <CFOUTPUT>
      <!--- =================================== --->
      <!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
      <!--- =================================== --->
      <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
        <tr>
          <td width=519 align=CENTER valign=top bgcolor=navy><b><FONT FACE=ARIAL SIZE=2 color="yellow">NOTE: Highlighted areas are required</b> </TD>
        </TR>
        <tr>
          <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
            <CENTER>
              <B>CLIENT SPECIFIC INFORMATION</B>
            </CENTER>
          </TD>
        </TR>
        <TR>
          <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
              <tr>
                <td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Unit No./Loan Officer:</b> </TD>
                <td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Unit No./Loan Processor:</b> </TD>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Name (Last, First) </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_loan_offcr.lo_lname#, #read_loan_offcr.lo_fname#</B> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Name (Last, First) </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_user.lp_lname#, #read_user.lp_fname#</B> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone No. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_phone#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone No. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_user.lp_phone#</b> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_ext#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_ext#</b> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Fax </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_fax#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Fax </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_fax#</b> </td>
              </tr>
              <tr>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Email </td>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Email </td>
              </tr>
              <tr>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_email#</b> </td>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_email#</b> </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </CFOUTPUT>
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>BORROWER / SELLER INFORMATION</B>
          </CENTER>
          <br>
          <FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Borrowers Info:</b> </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- =================================== --->
            <!--- ===/ Borrowers Info [ FIRST ]  \=== --->
            <!--- =================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  1.>> </td>
              <td width=90 bgcolor="yellow" align=center valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Last Name<br>
                </b>
                <CFINPUT TYPE="Text" NAME="blastname1" SIZE=11 MAXLENGTH=25

							        REQUIRED="yes" Message="You must enter the last name of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
              </td>
              <td width=90 bgcolor="yellow" align=center valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> First Name<br>
                </b>
                <cfINPUT TYPE="Text" NAME="bfirstname1" SIZE=11 MAXLENGTH=15
									REQUIRED="yes" Message="You must enter the first name of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
              </td>
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="bminame1" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="yellow" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="black"> <b>Social Sec. No.<br>
                </b>
                <cfINPUT TYPE="Text" NAME="bssn1" SIZE=13 MAXLENGTH=11
									REQUIRED="yes" Message="You must enter the social security of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
              </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="bhphone1" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="bwphone1" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="bext1" SIZE=4 MAXLENGTH=5
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
            <!--- =================================== --->
            <!--- ===/ Borrowers Info [ SECOND ] \=== --->
            <!--- =================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  2.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="blastname2" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="bfirstname2" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="bminame2" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="bssn2" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="bhphone2" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="bwphone2" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="bext2" SIZE=4 MAXLENGTH=5
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
              <td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR> </td>
              <td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxxx</font>&nbsp;&nbsp; ^ </td>
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> &nbsp; </td>
            </tr>
          </table>
        </td>
      </tr>
      <!--- ======================================================================= --->
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Sellers Info:</b> </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- ================================== --->
            <!--- ===/  SELLERS Info [ FIRST ]  \=== --->
            <!--- ================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  1.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="slastname1" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="sfirstname1" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="sminame1" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="sssn1" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="shphone1" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="swphone1" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="sext1" SIZE=4 MAXLENGTH=5
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
            <!--- ================================== --->
            <!--- ===/ SELLERS  Info [ SECOND ] \=== --->
            <!--- ================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  2.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="slastname2" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="sfirstname2" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="sminame2" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="sssn2" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="shphone2" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="swphone2" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="sext2" SIZE=4 MAXLENGTH=5
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
              <td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR> </td>
              <td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxxx</font>&nbsp;&nbsp; ^ </td>
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> &nbsp; </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <!--- ======================================================================== --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=right valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <center>
            <B>PROPERTY ADDRESS</B>
          </center>
        </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- =================================== --->
            <!--- ===/ Property  Info [ FIRST ]  \=== --->
            <!--- =================================== --->
            <tr>

            <td width=205 bgcolor="yellow" align=right valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Street Address <br>
              </b> </td>
            <CFOUTPUT>
              <td width=314  bgcolor="yellow" align=left valign=top><CFINPUT TYPE="Text" NAME="paddress" REQUIRED="Yes" Message="You must enter the PROPERTY ADDRESS" SIZE=50 MAXLENGTH=80
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
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
                <td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray"> City, State, Zip:</td>
                <td width=314  bgcolor="f1f1f1" align=left><FONT FACE=verdana SIZE=1 color="blue"> <b><NOBR>#read_zip_code.city#, &nbsp;#read_zip_code.state# &nbsp;&nbsp;#read_zip_code.zip# </NOBR></b> </td>
              </tr>
              <tr>
                <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> County <br>
                </td>
                <td width=314  bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_zip_code.county#</b> </td>
              </tr>
            </CFOUTPUT>
            <tr>
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Legal Description <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><input type="text" name="plegaldesc" size=50 maxlength=150
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
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Property Use <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><select name="prop_use_type"
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
                  <OPTION VALUE="Primary Residence" SELECTED>Primary Residence</OPTION>
                  <OPTION Value="Investment/Other">Investment/Other</OPTION>
                </select>
              </td>
            </tr>
            <tr>
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Is this a Condo or PUD <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><select name="condo_pud"
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
                  <OPTION VALUE="N/A" SELECTED>N/A</OPTION>
                  <OPTION VALUE="Condo" >Condo</OPTION>
                  <OPTION Value="PUD">PUD</OPTION>
                </select>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/       [ COMMENTS ]  TOP         \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>LOAN NUMBER</B>
          </CENTER>
        </TD>
      </TR>
      <tr>
        <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Loan Number <br>
        </td>
        <td width=314  bgcolor="f1f1f1" align=left valign=top><CFINPUT TYPE="Text" NAME="loan_number"
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
    </table>
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>COMMENTS</B>
          </CENTER>
        </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <tr>
              <td width=519 bgcolor="f1f1f1" align=center valign=top><TEXTAREA NAME="a_COMMENT" rows=9 cols=70 wrap="virtual"
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
									clear: none;" ></textarea>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>APPRAISAL INFORMATION</B>
          </CENTER>
        </TD>
      </TR>
      <tr>
        <td width=519 colspan = 2 bgcolor="yellow" align=center valign=top><b><FONT FACE=ARIAL SIZE=2 color="red">Appraisal Type<img src="./images/arrow_down.gif"></b> <br>
          <select name="appraisal_type" onchange="puta()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: 003F1E;
								background-color: white;
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
            <OPTION VALUE="" SELECTED>Select</OPTION>
            <OPTION VALUE="1004">1004 - Full Appraisal</OPTION>
            <OPTION VALUE="1073">1073 - Condo)</OPTION>
            <OPTION VALUE="1025">1025 - Multi-family</OPTION>
            <OPTION VALUE="2055">2055 - Inerior</OPTION>
            <OPTION VALUE="2055d">2055 - Drive By</OPTION>
            <OPTION VALUE="704">704 - Drive By</OPTION>
            <OPTION VALUE="2070">2070 or 2075 - Evaluation</OPTION>
            <OPTION VALUE="2000">2000 - Review</OPTION>
          </select>
        </td>
      </TR>
      <tr>
        <td width=519 bgcolor="yellow" align=left valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Estimated Value <FONT FACE=verdana SIZE=1 color="red">(format xxxxxxxxxx)<b>&nbsp;&nbsp;&nbsp;
          <input type="text" name="estimate_value" size=25 maxlength=25
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
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
      </td>

      </tr>

    </table>
    <!--- ========================================= --->
    <!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
    <tr>
      <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
        <CENTER>
          <B>Verify Order was Received</B>
        </CENTER>
        <br>
        <FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address or fax number, you will receive a confirmation e-mail of your order having been received by us. </TD>
    </TR>
    <TR>
    <TD width=519 align=center valign=top bgcolor=d3d3d3>
    <cfoutput>
      <table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT>
            <INPUT NAME="Verifyemail" SIZE=40 MAXLENGTH=120 value="#read_user.lp_email#"
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
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to another other e-mail address.</FONT><br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
            <INPUT NAME="Verifyemail_2" VALUE="" SIZE=40 MAXLENGTH=120
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
            <br>
          </td>
        </tr>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL color=black SIZE=1>If you do not request email verification, enter fax number below.</FONT><br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Fax:</FONT>
            <INPUT NAME="fax_no" VALUE="" SIZE=40 MAXLENGTH=120
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
            <br>
          </td>
        </tr>
      </table>
      </td>
      </tr>
      </table>
      <!--- ======================================================================= --->
      <!--- =========================================== --->
      <!--- ===/    [ RECEIVE REPORT ]  TOP        \=== --->
      <!--- =========================================== --->
      <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>Request copy of Final Report</B>
          </CENTER>
          <br>
          <FONT FACE=arial SIZE=1 color="black"><B>If you would like to receive a copy of the final report, please provide us with an email address. </TD>
      </TR>
      <TR>
      <TD width=519 align=center valign=top bgcolor=d3d3d3>
      <table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT>
            <INPUT NAME="RptbyEmail" SIZE=40 MAXLENGTH=120 value="#read_user.lp_email#"
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
            <br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
            <INPUT NAME="Verifyemail_3" VALUE=""  SIZE=40 MAXLENGTH=120
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
      </table>
    </cfoutput>
    </td>
    </tr>
    </table>
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
    <!--- <tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>APPRAISAL REQUEST</B></CENTER>
				</TD>
		</TR> --->
    <TR>
    <TD width=519 align=center valign=top bgcolor=d3d3d3>
    <table width=518 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
    <!--- ==================================== --->
    <!--- ===/ Appraisal  Info [       ]  \=== --->
    <!--- ==================================== --->
    <!--- 	<tr>
						<td width=518 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Want an appraisal?
					 <NOBR>&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif">  <INPUT TYPE="RADIO" NAME="do_appraisal" VALUE="No" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="do_appraisal" VALUE="Yes"></NOBR>
						</td></tr>
				 --->
    <tr>
      <td width=518  bgcolor="d3d3d3" align=right valign=top><br>
        <NOBR>
        <input type=image border=0 src="./images/button_proceed.gif">
&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td>
    </tr>
    </td>
    </tr>
    <CFOUTPUT QUERY="read_zip_code">
      <INPUT TYPE=HIDDEN NAME="pcity"   VALUE="#city#">
      <INPUT TYPE=HIDDEN NAME="pstate"  VALUE="#state#">
      <INPUT TYPE=HIDDEN NAME="pzip"    VALUE="#zip#">
      <INPUT TYPE=HIDDEN NAME="pcounty" VALUE="#county#">
    </CFOUTPUT>
  </cfform>
  </body>
  </html>
  <cfelseif #other# eq 1>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <html>
  <head>
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


if (!isNumeric(frm.bssn1.value)) {

 alert("Only numbers in the format XXXXXXX are allowed in the Social Security field field!")
 frm.bssn1.focus();
      return false;
 }
 if (frm.bssn1.value.length < 9 || frm.bssn1.length > 9) {
 alert("Only 9 digit numbers are allowed for the social security field!")
  frm.bssn1.focus();
      return false;
 }




 if (frm.bhphone1.value!='') {
if (!isNumeric(frm.bhphone1.value)) {

alert("Only numbers of format XXXXXXXXXX should be placed in the borrower home phone field")
 frm.bhphone1.focus();
      return false;
}
}
  if (frm.bwphone1.value!='') {
if (!isNumeric(frm.bhphone1.value)) {

alert("Only numbers of format XXXXXXXXXX should be placed in the borrower work  phone field")
 frm.bwphone1.focus();
      return false;
}
}
 if (frm.bhphone1.value!='') {
 if (frm.bhphone1.value.length < 10 || frm.bhphone1.value.length > 11) {
 alert("Please enter an existing number including the area code!")
  frm.bhphone1.focus();
      return false;
 }
 }

   if (frm.bwphone1.value!='') {
   if (frm.bwphone1.value.length < 10 || frm.bwphone1.value.length > 11) {
 alert("Please enter an existing number including the area code!")
  frm.bwphone1.focus();
      return false;
 }
 }


if (!isNumeric(frm.bssn1.value)) {

 alert("Only numbers in the format XXXXXXX are allowed in the Social Security field field!")
 frm.bssn1.focus();
      return false;
 }
return true;

 }
 </script>
  <title>1st Title&Escrow, Inc. - Title Request Form</title>
  </head>
  <BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
  <CENTER>
  <table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
  <tr>
    <td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td>
  </tr>
  <tr>
    <td width=607 align=center valign=top><NOBR>
      <!--- <a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a> --->
      <a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td>
  </tr>
  <tr>
    <td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT>
      <p><br>
      <p></td>
  </tr>
  <tr>
    <td width=590 align=center valign=top bgcolor=d3d3d3></TD>
  </tr>
  <tr>
  <td width=607 align=center valign=top>
  <img src="./images/ancillary_title.gif">
  <p>
  <CFFORM NAME="frm" ACTION="./order_verify_title_ancillary.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>
    <CFOUTPUT>
      <!--- =================================== --->
      <!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
      <!--- =================================== --->
      <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
        <tr>
          <td width=519 align=CENTER valign=top bgcolor=navy><b><FONT FACE=ARIAL SIZE=2 color="yellow">NOTE: Highlighted areas are required</b> </TD>
        </TR>
        <tr>
          <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
            <CENTER>
              <B>CLIENT SPECIFIC INFORMATION</B>
            </CENTER>
          </TD>
        </TR>
        <TR>
          <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
              <tr>
                <td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Unit No./Loan Officer:</b> </TD>
                <td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Unit No./Loan Processor:</b> </TD>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Name (Last, First) </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_loan_offcr.lo_lname#, #read_loan_offcr.lo_fname#</B> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Name (Last, First) </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_user.lp_lname#, #read_user.lp_fname#</B> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone No. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_phone#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Phone No. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <B>#read_user.lp_phone#</b> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_ext#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext. </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_ext#</b> </td>
              </tr>
              <tr>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Fax </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_fax#</b> </td>
                <td width=125 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Fax </td>
                <td width=134 bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_fax#</b> </td>
              </tr>
              <tr>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Email </td>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Email </td>
              </tr>
              <tr>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_loan_offcr.lo_email#</b> </td>
                <td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_user.lp_email#</b> </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </CFOUTPUT>
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>BORROWER / SELLER INFORMATION</B>
          </CENTER>
          <br>
          <FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Borrowers Info:</b> </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- =================================== --->
            <!--- ===/ Borrowers Info [ FIRST ]  \=== --->
            <!--- =================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  1.>> </td>
              <td width=90 bgcolor="yellow" align=center valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Last Name<br>
                </b>
                <CFINPUT TYPE="Text" NAME="blastname1" SIZE=11 MAXLENGTH=25

							        REQUIRED="yes" Message="You must enter the last name of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
              </td>
              <td width=90 bgcolor="yellow" align=center valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> First Name<br>
                </b>
                <cfINPUT TYPE="Text" NAME="bfirstname1" SIZE=11 MAXLENGTH=15
									REQUIRED="yes" Message="You must enter the first name of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
              </td>
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="bminame1" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="yellow" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="black"> <b>Social Sec. No.<br>
                </b>
                <cfINPUT TYPE="Text" NAME="bssn1" SIZE=13 MAXLENGTH=11
									REQUIRED="yes" Message="You must enter the social security of the borrower in the Borrower/Seller Information Section"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
              </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="bhphone1" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="bwphone1" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="bext1" SIZE=4 MAXLENGTH=5
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
            <!--- =================================== --->
            <!--- ===/ Borrowers Info [ SECOND ] \=== --->
            <!--- =================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  2.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="blastname2" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="bfirstname2" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="bminame2" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="bssn2" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="bhphone2" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="bwphone2" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="bext2" SIZE=4 MAXLENGTH=5
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
              <td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR> </td>
              <td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxxx</font>&nbsp;&nbsp; ^ </td>
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> &nbsp; </td>
            </tr>
          </table>
        </td>
      </tr>
      <!--- ======================================================================= --->
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="maroon"> <b>Sellers Info:</b> </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- ================================== --->
            <!--- ===/  SELLERS Info [ FIRST ]  \=== --->
            <!--- ================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  1.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="slastname1" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="sfirstname1" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="sminame1" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="sssn1" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="shphone1" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="swphone1" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="sext1" SIZE=4 MAXLENGTH=5
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
            <!--- ================================== --->
            <!--- ===/ SELLERS  Info [ SECOND ] \=== --->
            <!--- ================================== --->
            <tr>
              <td width=25 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray">
                <p> <br>
                  2.>> </td>
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Last Name<br>
                <INPUT TYPE="Text" NAME="slastname2" SIZE=11 MAXLENGTH=25
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> First Name<br>
                <INPUT TYPE="Text" NAME="sfirstname2" SIZE=11 MAXLENGTH=15
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
              <td width=30 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> MI.<br>
                <INPUT TYPE="Text" NAME="sminame2" SIZE=1 MAXLENGTH=1
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
              <td width=100 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Social Sec. No.<br>
                <INPUT TYPE="Text" NAME="sssn2" SIZE=13 MAXLENGTH=11
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Home Ph.<br>
                <INPUT TYPE="Text" NAME="shphone2" SIZE=12 MAXLENGTH=15
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
              <td width=90 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Work Ph.<br>
                <INPUT TYPE="Text" NAME="swphone2" SIZE=12 MAXLENGTH=15
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
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Ext.<br>
                <INPUT TYPE="Text" NAME="sext2" SIZE=4 MAXLENGTH=5
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
              <td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR> </td>
              <td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> ^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxxx</font>&nbsp;&nbsp; ^ </td>
              <td width=40 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> &nbsp; </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <!--- ======================================================================== --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=right valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <center>
            <B>PROPERTY ADDRESS</B>
          </center>
        </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <!--- =================================== --->
            <!--- ===/ Property  Info [ FIRST ]  \=== --->
            <!--- =================================== --->
            <tr>

            <td width=205 bgcolor="yellow" align=right valign=top><b><FONT FACE=ARIAL SIZE=1 color="black"> Street Address <br>
              </b> </td>
            <CFOUTPUT>
              <td width=314  bgcolor="yellow" align=left valign=top><CFINPUT TYPE="Text" NAME="paddress" REQUIRED="Yes" Message="You must enter the PROPRTY ADDRESS" SIZE=50 MAXLENGTH=80
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
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
                <td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray"> City, State, Zip:</td>
                <td width=314  bgcolor="f1f1f1" align=left><FONT FACE=verdana SIZE=1 color="blue"> <b><NOBR>#read_zip_code.city#, &nbsp;#read_zip_code.state# &nbsp;&nbsp;#read_zip_code.zip# </NOBR></b> </td>
              </tr>
              <tr>
                <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> County <br>
                </td>
                <td width=314  bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue"> <b>#read_zip_code.county#</b> </td>
              </tr>
            </CFOUTPUT>
            <tr>
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Legal Description <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><input type="text" name="plegaldesc" size=50 maxlength=150
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
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Property Use <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><select name="prop_use_type"
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
                  <OPTION VALUE="Primary Residence" SELECTED>Primary Residence</OPTION>
                  <OPTION Value="Investment/Other">Investment/Other</OPTION>
                </select>
              </td>
            </tr>
            <tr>
              <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Is this a Condo or PUD <br>
              </td>
              <td width=314  bgcolor="f1f1f1" align=left valign=top><select name="condo_pud"
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
                  <OPTION VALUE="N/A" SELECTED>N/A</OPTION>
                  <OPTION VALUE="Condo" >Condo</OPTION>
                  <OPTION Value="PUD">PUD</OPTION>
                </select>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/       [ COMMENTS ]  TOP         \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>LOAN NUMBER</B>
          </CENTER>
        </TD>
      </TR>
      <tr>
        <td width=205 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Loan Number <br>
        </td>
        <td width=314  bgcolor="f1f1f1" align=left valign=top><CFINPUT TYPE="Text" NAME="loan_number"
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
    </table>
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>COMMENTS</B>
          </CENTER>
        </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <tr>
              <td width=519 bgcolor="f1f1f1" align=center valign=top><TEXTAREA NAME="a_COMMENT" rows=9 cols=70 wrap="virtual"
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
									clear: none;" ></textarea>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <!--- ======================================================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>ANCILLARY PRODUCT CHOICES:</B>
          </CENTER>
        </TD>
      </TR>
      <TR>
        <TD width=519 align=center valign=top bgcolor=d3d3d3><table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
            <tr>
              <td width=200 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Flood </td>
              <td width=219 bgcolor="f1f1f1" align=left valign=top><select name="flood"
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
                  <OPTION VALUE="" SELECTED>Select</OPTION>
                  <OPTION VALUE="Basic">Basic Flood Certification</OPTION>
                  <OPTION VALUE="Life">Life of Loan Certification</OPTION>
                  <OPTION VALUE="hmda">HMDA</OPTION>
                </select>
              </td>
            </tr>
            <tr>
              <td width=200 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> AVM </td>
              <td width=219 bgcolor="f1f1f1" align=left valign=top><select name="avm"
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
                  <OPTION VALUE="Home">Home Value Explorer</OPTION>
                  <OPTION VALUE="First" >First AVM</OPTION>
                  <!--- <OPTION VALUE="Phone" >Phone Closing</OPTION>
								<OPTION VALUE="Platinium" >Platinium Signing (phone or notary)</OPTION>
							 --->
                </select>
              </td>
            </tr>
            <tr>
              <td width=200 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Credit </td>
              <td width=519 bgcolor="f1f1f1" align=left valign=top><select name="credit"
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
                  <OPTION VALUE="singind">Single Infile Report -- Individual</OPTION>
                  <OPTION VALUE="singjoint">Single Infile Report -- Joint</OPTION>
                  <OPTION VALUE="doubleind">Double Merge Report -- Individual</OPTION>
                  <OPTION VALUE="doublejoint">Double Merge Report -- Joint</OPTION>
                  <OPTION VALUE="trind">Tri-Merge Report -- Individual</OPTION>
                  <OPTION VALUE="trijoint">Tri-Merge Report -- Joint</OPTION>
                  <OPTION VALUE="rcmr">RCMR'S</OPTION>
                  <OPTION VALUE="trade">Trade Update</OPTION>
                </select>
              </td>
            </tr>
            <tr>
              <td width=200 bgcolor="f1f1f1" align=right valign=top><FONT FACE=ARIAL SIZE=1 color="gray"> Signing </td>
              <td width=519 bgcolor="f1f1f1" align=left valign=top><select name="signing"
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
                  <OPTION VALUE="attorney">Attorney/Title Agent</OPTION>
                  <OPTION VALUE="notary" >Notary</OPTION>
                  <OPTION VALUE="Phone" >Phone Closing</OPTION>
                  <OPTION VALUE="Platinium" >Platinium Closing (Phone close w/notary)</OPTION>
                </select>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <!--- ======================================================================= --->
    </table>
    <!--- ======================================================================== --->
    <!--- ========================================= --->
    <!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
    <!--- ========================================= --->
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
    <tr>
      <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
        <CENTER>
          <B>Verify Order was Received</B>
        </CENTER>
        <br>
        <FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address or fax number, you will receive a confirmation e-mail of your order having been received by us. </TD>
    </TR>
    <TR>
    <TD width=519 align=center valign=top bgcolor=d3d3d3>
    <cfoutput>
      <table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT>
            <INPUT NAME="Verifyemail" SIZE=40 MAXLENGTH=120 value="#read_user.lp_email#"
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
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to another other e-mail address.</FONT><br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
            <INPUT NAME="Verifyemail_2" VALUE="" SIZE=40 MAXLENGTH=120
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
            <br>
          </td>
        </tr>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL color=black SIZE=1>If you do not request email verification, enter fax number below.</FONT><br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Fax:</FONT>
            <INPUT NAME="fax_no" VALUE="" SIZE=40 MAXLENGTH=120
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
            <br>
          </td>
        </tr>
      </table>
      </td>
      </tr>
      </table>
      <!--- ======================================================================= --->
      <!--- =========================================== --->
      <!--- ===/    [ RECEIVE REPORT ]  TOP        \=== --->
      <!--- =========================================== --->
      <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
      <tr>
        <td width=519 align=left valign=top bgcolor=d3d3d3><FONT FACE=ARIAL SIZE=2 color="black">
          <CENTER>
            <B>Request copy of Final Report</B>
          </CENTER>
          <br>
          <FONT FACE=arial SIZE=1 color="black"><B>If you would like to receive a copy of the final report, please provide us with an email address. </TD>
      </TR>
      <TR>
      <TD width=519 align=center valign=top bgcolor=d3d3d3>
      <table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
        <tr>
          <td width=519 bgcolor="f1f1f1" align=center valign=top><FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT>
            <INPUT NAME="RptbyEmail" SIZE=40 MAXLENGTH=120 value="#read_user.lp_email#"
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
            <br>
            <FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
            <INPUT NAME="Verifyemail_3" VALUE=""  SIZE=40 MAXLENGTH=120
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
      </table>
    </cfoutput>
    </td>
    </tr>
    </table>
    <table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
    <!--- <tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>APPRAISAL REQUEST</B></CENTER>
				</TD>
		</TR> --->
    <TR>
    <TD width=519 align=center valign=top bgcolor=d3d3d3>
    <table width=518 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
    <!--- ==================================== --->
    <!--- ===/ Appraisal  Info [       ]  \=== --->
    <!--- ==================================== --->
    <!--- 	<tr>
						<td width=518 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Want an appraisal?
					 <NOBR>&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif">  <INPUT TYPE="RADIO" NAME="do_appraisal" VALUE="No" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="do_appraisal" VALUE="Yes"></NOBR>
						</td></tr>
				 --->
    <tr>
      <td width=518  bgcolor="d3d3d3" align=right valign=top><br>
        <NOBR>
        <input type=image border=0 src="./images/button_proceed.gif">
&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td>
    </tr>
    </td>
    </tr>
    <CFOUTPUT QUERY="read_zip_code">
      <INPUT TYPE=HIDDEN NAME="pcity"   VALUE="#city#">
      <INPUT TYPE=HIDDEN NAME="pstate"  VALUE="#state#">
      <INPUT TYPE=HIDDEN NAME="pzip"    VALUE="#zip#">
      <INPUT TYPE=HIDDEN NAME="pcounty" VALUE="#county#">
    </CFOUTPUT>
  </cfform>
  </body>
  </html>
  <cfelse>
</cfif>
