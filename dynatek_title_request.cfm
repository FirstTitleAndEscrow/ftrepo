	<CFPARAM NAME="a_flag" DEFAULT="0">

<CFPARAM NAME="purchase" DEFAULT="">
<CFQUERY datasource="#request.dsn#" NAME="read_title_temp">
	Select * from Title_temp_Dynatek
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="end_rates">
		SELECT *
		FROM end_rates
		ORDER BY ENDORSEMENTS ASC
	</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE id = #USER_ID_1#
		ORDER BY lp_lname ASC
	</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">

			SELECT *
			FROM loan_officers
			WHERE ID = #lo_ID#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="get_lender">

			SELECT *
			FROM company_lender_assoc
			WHERE company_id = #read_user.comp_id#

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="get_user">

			SELECT *
			FROM user_client_assoc
			WHERE company_id = #read_user.comp_id#

		</CFQUERY>
		<cfif #get_user.recordcount# GT "0">
		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #get_user.id#

		</CFQUERY>
		</cfif>

			<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE ID = '#comp_id#'
ORDER BY company ASC
</CFQUERY>
<!--- <cfif #read_company.recordcount# GT 0>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
SELECT *
FROM users
WHERE id = #user_id_1#
ORDER BY lp_lname ASC
</CFQUERY>
</cfif>	 --->

			<cfif #a_flag# eq 1>

			<SCRIPT LANGUAGE="JavaScript">
window.alert("The LOAN AMOUNT you have entered does not match with any title insurance fees we have on our system for the state you have chosen. Please try to re-process the order inputing another Loan amount.")

</SCRIPT>


					</cfif>



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
  if (frm.SearchType.value != 'Purchase') {
frm.purchase.value = ''; }
}
</script>
<script type="text/javascript">
function cant_edit(box)
{
if (frm.SearchType.value!='Purchase') {

  alert("You can't edit text in this field.");
  box.blur();
 return true;
 }
}
</script>

<!--- <script type="text/javascript">
function cant_edit2(box)
{
if (frm.piggy.value != 'yes') {

  alert("You can't edit text in this field.");
  box.blur();
 return true;
 }
}
</script> --->

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
if (frm.purchase.value=='') {
  if (frm.SearchType.value=='Purchase') {

alert("Please fill out the Purchase field in the Tilte Insurance Information when selecting Purchase")
 frm.purchase.focus();
      return false;
}
}

if (frm.SearchType.value=='Purchase')  {
  if (!isNumeric(frm.purchase.value)) {

 alert("Only numbers are allowed in the PURCHASE field!")
 frm.purchase.focus();
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
										<table border=0 align="right" cellpadding="0" cellspacing=0>
	<tr><td align="right" valign="center">
  <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
&nbsp;&nbsp;</td>
  <td align="right" valign="center"><input type="text" name="number" size=10></td>
  <td align="right" valign="center">&nbsp;<input type="image" src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
  							</tr><tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr></table>
									</td>
  								</tr>
  								<tr>
    								<td valign="top" align="center" width="560"><nobr></nobr><br>
      									&nbsp;
									</td>
  								</tr>
							</table>
						</td>
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
										<CFOUTPUT><TR>
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          										<td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
        <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
												<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
												<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
												<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>--->
											</tr>
										</CFOUTPUT>
									</center>
			        	 		</table>
							<p>
								<img src="./images/label_title.gif">
								<CFFORM NAME="frm" ACTION="./calyx_order_verify_title.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&appraisal=#appraisal#" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST >
								<CFOUTPUT>
<center>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=519 align=CENTER valign=top bgcolor=navy>
			<b><FONT FACE=ARIAL SIZE=2 color="yellow">NOTE: Highlighted areas are required</b>
	</TD>
		</TR>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CLIENT SPECIFIC INFORMATION</B></CENTER>

			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Officer:</b>
						</TD>

						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Processor:</b>
						</TD>

					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_loan_offcr.lo_lname#, #read_loan_offcr.lo_fname#</B>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_user.lp_lname#, #read_user.lp_fname#</B>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_phone#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_user.lp_phone#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_ext#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_ext#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_fax#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_fax#</b>
						</td>
					</tr>

					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>
					</tr>

					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_email#</b>
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_email#</b>
						</td>
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
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>BORROWER / SELLER INFORMATION</B></CENTER><br><FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Borrowers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>

						<td width=90 bgcolor="yellow" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Last Name<br><b>
							<CFINPUT TYPE="Text" NAME="blastname1" SIZE=11 MAXLENGTH=25 VALUE="#read_title_temp.blastname1#"

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

						<td width=90 bgcolor="yellow" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							First Name<br></b>
							<cfINPUT TYPE="Text" NAME="bfirstname1" SIZE=11 MAXLENGTH=15 VALUE="#read_title_temp.bfirstname1#"
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

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
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

						<td width=100 bgcolor="yellow" align=center valign=top>
						<b>	<FONT FACE=ARIAL SIZE=1 color="black">
							Social Sec. No.<br></b>
							<cfINPUT TYPE="Text" NAME="bssn1" SIZE=13 MAXLENGTH=11 VALUE="#read_title_temp.bssn1#"
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

				<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<cfINPUT TYPE="Text" NAME="bhphone1" SIZE=12 MAXLENGTH=15 VALUE="#read_title_temp.bhphone1#"
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



					<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<cfINPUT TYPE="Text" NAME="bwphone1" SIZE=12 MAXLENGTH=15 VALUE="#read_title_temp.bwphone1#"
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

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
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
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<CFINPUT TYPE="Text" NAME="blastname2" SIZE=11 MAXLENGTH=25 VALUE="#read_title_temp.blastname2#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<CFINPUT TYPE="Text" NAME="bfirstname2" SIZE=11 MAXLENGTH=15 VALUE="#read_title_temp.bfirstname2#"
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

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
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

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<CFINPUT TYPE="Text" NAME="bssn2" SIZE=13 MAXLENGTH=11 VALUE="#read_title_temp.bssn2#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<CFINPUT TYPE="Text" NAME="bhphone2" SIZE=12 MAXLENGTH=15 VALUE="#read_title_temp.bhphone2#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<CFINPUT TYPE="Text" NAME="bwphone2" SIZE=12 MAXLENGTH=15 VALUE="#read_title_temp.bwphone2#"
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

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
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
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->

		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Sellers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- ================================== --->
		<!--- ===/  SELLERS Info [ FIRST ]  \=== --->
		<!--- ================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<CFINPUT TYPE="Text" NAME="slastname1" SIZE=11 MAXLENGTH=25 VALUE="#read_title_temp.slastname1#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<CFINPUT TYPE="Text" NAME="sfirstname1" SIZE=11 MAXLENGTH=15
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

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
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

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<INPUT TYPE="Text" NAME="sssn1" SIZE=13 MAXLENGTH=11 <!---Not in the table --->
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<INPUT TYPE="Text" NAME="shphone1" SIZE=12 MAXLENGTH=15 <!---Not in the table --->
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<INPUT TYPE="Text" NAME="swphone1" SIZE=12 MAXLENGTH=15 <!---Not in the table --->
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

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
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
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<CFINPUT TYPE="Text" NAME="slastname2" SIZE=11 MAXLENGTH=25 VALUE="#read_title_temp.slastname2#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<CFINPUT TYPE="Text" NAME="sfirstname2" SIZE=11 MAXLENGTH=15
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

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
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

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
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

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
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
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxxxxxxxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>

				</table>
			</td>
		</tr>


</table>


<!--- ======================================================================== --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=right valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<center><B>PROPERTY ADDRESS</B></center>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=205 bgcolor="yellow" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Street Address <br><b>
						</td>
<CFOUTPUT>
						<td width=314  bgcolor="yellow" align=left valign=top>
							<CFINPUT TYPE="Text" NAME="paddress" REQUIRED="Yes" Message="You must enter the PROPRTY ADDRESS" SIZE=50 MAXLENGTH=80 VALUE="#read_title_temp.paddress#"
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
						<td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							City, State, Zip:</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><NOBR><!--Insert City, state, zip here --->
							</NOBR></b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><!--Zip---></b>
						</td>
					</tr>
</CFOUTPUT>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Legal Description <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<CFinput type="text" name="plegaldesc" size=50 maxlength=150 VALUE="#read_title_temp.plegaldesc#"
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
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Property Use <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<select name="prop_use_type"
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
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is this a Condo or PUD <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<select name="condo_pud"
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
			<td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>LOAN NUMBER</B></CENTER>
			</TD>
		</TR>
		<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Number <br>
						</td>
		<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<cfif #comp_id# eq "254">
							<CFINPUT TYPE="Text" NAME="loan_number" VALUE="#read_title_temp.loan_number#"
									 REQUIRED="yes" Message="You must enter a Loan Number"
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
									<cfelse>
									<CFINPUT TYPE="Text" NAME="loan_number" VALUE="#read_title_temp.loan_number#"
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
									 </cfif>
						</td>
		</tr>
</table>
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>COMMENTS</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<TEXTAREA NAME="a_COMMENT" rows=9 cols=70 wrap="virtual"
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
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PAYOFF INFORMATION:</B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=519 align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1>Please forward borrower authorization if needed for payoff requests by facsimile (301-279-7930) or <a href="mailto:pgibb@firsttitleservices.com">email</a>
				<br>or upload a file <FONT FACE=ARIAL SIZE=1 color="gray">
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
						</FONT>

			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Payoff Lender  [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Lender<br>
							<CFINPUT TYPE="Text" NAME="polender1" size=15 maxlength=25 VALUE="#read_title_temp.polender1#"
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

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
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

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
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
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Second Lender<br>
							<CFINPUT TYPE="Text" NAME="polender2" size=15 maxlength=25 VALUE="#read_title_temp.polender2#"
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

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
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

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
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
						<td width=172 bgcolor="f1f1f1" align=right valign=top>

							</td>

						 <td width=172  bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->

								<!--- ================================================ --->
								<!--- ===/          [ TITLE INSURANCE ]           \=== --->
								<!--- ================================================ --->
								<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
									<tr>
										<td width=519 align=left valign=top bgcolor=d3d3d3>
											<FONT FACE=ARIAL SIZE=2 color="black">
											<CENTER><B>TITLE INSURANCE INFORMATION:</B></CENTER>
										</TD>
									</TR>
									<TR>
										<TD width=519 align=center valign=top bgcolor=d3d3d3>
											<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
												<tr>
													<td width=125 bgcolor="f1f1f1" align=right valign=top>
													<FONT FACE=ARIAL SIZE=1 color="gray">
													Transaction Type
													</td>
													<td width=150 bgcolor="f1f1f1" align=left valign=top>
														<select name="SearchType" onchange="put()"
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
												</tr>
												<tr>
													<td width=205 bgcolor="f1f1f1" align=right valign=top>
														<FONT FACE=ARIAL SIZE=1 color="gray">
														Is this a Condo or PUD <br>
													</td>
													<td width=314  bgcolor="f1f1f1" align=left valign=top>
														<select name="condo_pud"
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
												<tr>
													<td width=125 bgcolor="yellow" align=right valign=top>
													<b><FONT FACE=ARIAL SIZE=1 color="black">
													Proposed Insured</b>
													</td>
													<!--- <CFIF #get_lender.recordcount# GT 1> --->
													<td width=394 COLSPAN=3 bgcolor="yellow" align=left valign=top>
														<select name="otherpro" onchange="result()"
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
														<OPTION VALUE="">
														</OPTION>
         												<CFOUTPUT QUERY="get_lender">
														<OPTION VALUE="#Lender_name#">#Lender_Name# </OPTION>
														</CFOUTPUT>
														<OPTION VALUE="Other">Other </OPTION>
														</select>
													</td>
												</tr>
												<tr>
													<td width=125 bgcolor="yellow" align=right valign=top>
													<b><FONT FACE=ARIAL SIZE=1 color="black">
													Your Choice
													</td>
													</b>
													<td width=394 bgcolor="yellow" COLSPAN=3 align=left valign=top>
													<cfINPUT TYPE="Text" NAME="Insured"  size=50 maxlength=70 onFocus = "ChangeVal()"
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
												<tr>
													<td width=519 colspan = 4 bgcolor="f1f1f1" align=right valign=top>
													<NOBR><FONT FACE=ARIAL SIZE=1 color="gray">
													Will there be a piggyback second mortgage closed with the above loan?
													<FONT FACE=ARIAL SIZE=2 color="red">
													&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif">
													<INPUT TYPE="RADIO" NAME="piggy" VALUE="0" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="piggy" VALUE="1"></NOBR>
													</td>
												</TR>
												<tr>
													<td width=519 colspan = 4 bgcolor="f1f1f1" align=right valign=top>
													<NOBR><FONT FACE=ARIAL SIZE=1 color="gray">
													Will title insurance be required on this piggyback loan?
													<FONT FACE=ARIAL SIZE=2 color="red">
													&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO" NAME="ins" VALUE="0" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="ins" VALUE="1"></NOBR>
													</td>
												</TR>
												<tr>
													<tr>
														<td width=519 align=left colspan=2 valign=top bgcolor=d3d3d3>
														<FONT FACE=ARIAL SIZE=2 color="black">
														<CENTER><B>ICL REQUEST</B></CENTER><br>
														</TD>
													</TR>
													<tr>
														<td width=519 bgcolor="f1f1f1" align=center valign=top>
														<FONT FACE=ARIAL SIZE=1 color="gray">
														Closing Protection Letter Needed ?"
														<!--- </td><td width=259  bgcolor="f1f1f1" align=left valign=top> ---><FONT FACE=ARIAL SIZE=2 color="red">
														<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO" NAME="request_ICL" VALUE="No" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="request_icl" VALUE="Yes"></NOBR>
														</td>
													</TR>
													<tr>
														<td width=519 bgcolor="f1f1f1" align=center valign=top>
														<FONT FACE=ARIAL SIZE=1 color="gray">
														Select the type of HUD you would like:
														<!--- </td><td width=259  bgcolor="f1f1f1" align=left valign=top> --->
														<FONT FACE=ARIAL SIZE=2 color="red">
														<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;HUD1 <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO" NAME="HUD_TYPE" VALUE="0" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">HUD1A <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="HUD_TYPE" VALUE="1"></NOBR>
														</td>
													</TR>
								<!-- Email Information -->
													<tr>
														<td width=519 align=left colspan=2 valign=top bgcolor=d3d3d3>
														<FONT FACE=ARIAL SIZE=2 color="black">
														<CENTER><B>VERIFY ORDER WAS RECEIVED</B></CENTER><br>
														</TD>
													</TR>
													<TR>
														<TD colspan=2>
														<cfoutput>
														<FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address or fax number, you will receive a confirmation  e-mail of your order having been received by us.
														</TD>
													</TR>
													<TR>
														<td width=519 align=center colspan=2 valign=top bgcolor=d3d3d3>
														<FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT><INPUT NAME="Verifyemail" SIZE=40 MAXLENGTH=120 value="#read_user.lp_email#"
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
													</TR>
													<TR>
														<td width=519 align=center colspan=2 valign=top bgcolor=d3d3d3>
														<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to another other e-mail address.</FONT><br>
														</td>
													</TR>
													<TR>
														<td width=519 align=center colspan=2 valign=top bgcolor=d3d3d3>
														<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT><INPUT NAME="Verifyemail_2" VALUE="" SIZE=40 MAXLENGTH=120
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
																	clear: none;" > <br>
															</td>
													</tr>
										</CFoutput>
										<!---Email End--->
										<cfif #appraisal# eq 1>
												</tr>
												<tr>
													<td width=519 align=left colspan=2 valign=top bgcolor=d3d3d3>
													<FONT FACE=ARIAL SIZE=2 color="black">
													<CENTER><B>APPRAISAL REQUEST</B></CENTER><br>
													</TD>
												</TR>
												<tr>
													<td width=519 bgcolor="navy" colspan = 2 align=center valign=top>
													<FONT FACE=ARIAL SIZE=2 color="yellow">
													<b>Since you have requested an appraisal, please provide us with an appraisal type</b>
													</td>
												</TR>
												<tr>
													<td width=519 colspan = 2 bgcolor="yellow" align=center valign=top>
													<b><FONT FACE=ARIAL SIZE=2 color="red">Appraisal Type<img src="./images/arrow_down.gif"></b> <br>
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
												<td width=519 colspan=2 bgcolor="yellow" align=left valign=top>
													<b><FONT FACE=ARIAL SIZE=1 color="black">
													Estimated Value <FONT FACE=verdana SIZE=1 color="red">(format xxxxxxxxxx)<b>&nbsp;&nbsp;&nbsp;
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
								</td>
							</tr>
							<tr>
								<td width=518  bgcolor="d3d3d3" align=center valign=top>
								<NOBR><input type=image border=0 src="./images/button_proceed.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>
								<cfoutput QUERY="read_title_temp">
									<Input TYPE=HIDDEN NAME ="blastname1" Value ="#blastname1#">
									<Input TYPE=HIDDEN NAME ="bfirstname1" Value ="#bfirstname1#">
									<Input TYPE=HIDDEN NAME ="bssn1" Value ="#bssn1#">
									<Input TYPE=HIDDEN NAME ="bhphone1" Value ="#bhphone1#">
									<Input TYPE=HIDDEN NAME ="bwphone1" Value ="#bwphone1#">
									<Input TYPE=HIDDEN NAME ="blastname2" Value ="#blastname2#">
									<Input TYPE=HIDDEN NAME ="bfirstname2" Value ="#bfirstname2#">
									<Input TYPE=HIDDEN NAME ="bssn2" Value ="#bssn2#">
									<Input TYPE=HIDDEN NAME ="bhphone2" Value ="#bhphone2#">
									<Input TYPE=HIDDEN NAME ="bwphone2" Value ="#bwphone2#">
									<Input TYPE=HIDDEN NAME ="paddress" Value = "#paddress#">
									<Input TYPE=HIDDEN NAME ="pcity" Value = "#pcity#">
									<Input TYPE=HIDDEN NAME ="pzip" Value = "#pzip#">
									<Input TYPE=HIDDEN NAME ="pcounty" Value = "#pcounty#">
									<Input TYPE=HIDDEN NAME ="loan_number" Value ="#loan_number#">
									<Input TYPE=HIDDEN NAME ="polender1" Value = "#polender1#">
									<Input TYPE=HIDDEN NAME ="loanamt_float" Value = "#loanamt_float#">
									<Input TYPE=HIDDEN NAME ="purchase" Value = "#purchase#">
									<Input TYPE=HIDDEN NAME ="shphone1" Value = "#shphone1#">
									<Input TYPE=HIDDEN NAME ="polender2" Value = "#polender2#">
									<Input TYPE=HIDDEN NAME ="slastname1" Value = "#slastname1#">
									<Input TYPE=HIDDEN NAME ="plegaldesc" Value = "#plegaldesc#">
									<Input TYPE=HIDDEN NAME ="condo_pud" Value = "#condo_pud#">
									<Input TYPE=HIDDEN NAME ="slastname2" Value = "#slastname2#">
									<Input TYPE=HIDDEN NAME ="prop_use_type" Value = "#prop_use_type#">
									<Input TYPE=HIDDEN NAME ="pstate" Value = "#pstate#">
								</cfoutput>
							</CFFORM>
						</TABLE>
						<tr>
							<td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780">
							</td>
						</tr>
					</TBODY>
				</TABLE>
