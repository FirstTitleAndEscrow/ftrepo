<CFPARAM NAME="user_id_1" DEFAULT="">
<CFPARAM NAME="lo_id" DEFAULT="">
<CFPARAM NAME="zip_id" DEFAULT="">
<CFPARAM NAME="title" DEFAULT="">
<CFPARAM NAME="appraisal" DEFAULT="">
<CFPARAM NAME="property" DEFAULT="">
<CFPARAM NAME="other" DEFAULT="">
<CFPARAM NAME="emp" DEFAULT="">
<cfparam name="read_title.prev_loan_year" default=1996>
<cfparam name="read_title.prev_loan_mo" default=1>
<CFSET  a_list_of_all_states = "AL|AK|AZ|AR|CA|CO|CT|DE|DC|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY">

<CFSET a_list_of_all_states_1 = #ListToArray(a_list_of_all_states, "|")#>

        <CFQUERY datasource="#request.dsn#" NAME="read_search">
            SELECT     SearchType, SearchType AS Expr1
            FROM         Title
            WHERE     (SearchType IS NOT NULL AND NOT (SearchType LIKE 'Refinance,test'))
            GROUP BY SearchType, LEN(SearchType)
            HAVING      (LEN(SearchType) > 1)
        </CFQUERY>

		<!---This is a temp view until all roles are in use --->
		<CFQUERY datasource="#request.dsn#" NAME="read_role">
			SELECT role_id
			FROM First_admin
			WHERE ID = #URL.uid#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#
		</CFQUERY>

<cfif read_title.prev_loan_year eq 'NULL' or read_title.prev_loan_year eq ''>
<cfset read_title.prev_loan_year = 1996>
</cfif>
<cfif read_title.prev_loan_mo eq 'NULL' or read_title.prev_loan_mo eq ''>
<cfset read_title.prev_loan_mo = 1>
</cfif>

<cfparam name="read_title.prev_loan_year" default=1996>
<cfparam name="read_title.prev_loan_mo" default=1>


		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM title
		WHERE title_ID = #rec_ID#
	</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">

			SELECT *
			FROM title
		WHERE title_ID = #rec_ID#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">

			SELECT *
			FROM zip_info
			WHERE state = '#read_title.pstate#'

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sales">
			SELECT *
			FROM First_Admin
			WHERE ID = #read_sel_company.IntSales#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_team_info">
			SELECT t.*, f.FNAME, f.LNAME
			FROM TEAMS t, FIRST_ADMIN f
			WHERE t.ID = #read_sel_company.Team_ID#
			and t.Leader_ID = f.ID
		</CFQUERY>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<SCRIPT>
<!--

function testbox(form) {
Ctrl = form.inputbox1;
if (Ctrl.value == "" || Ctrl.value.indexOf ('@', 0) == -1) {
return (false);
} else
return (true);
}
//-->
</SCRIPT>
<!---  --->
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

if (frm.Purchase_Price.value=='') {
  if (frm.SearchType.value=='Purchase') {

alert("Please fill out the Purchase field in the Tilte Insurance Information when selecting Purchase")
 frm.Purchase_Price.focus();
      return false;
}
}
if (frm.SearchType.value=='Purchase')  {
  if (!isNumeric(frm.Purchase_Price.value)) {

 alert("Only numbers are allowed in the PURCHASE field!")
 frm.Purchase_Price.focus();
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

return true;

 }
 </script>


</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<TR>
	<TD>
	<CFIF #read_role.role_id# neq "">
		<CFINCLUDE TEMPLATE="./includes/menu_header.cfm">
	</CFIF>
	</TD>
	</TR>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Committment Report</B></CENTER>
			</TD>
		</TR>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>



		<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">





		</td>
	</tr>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

	<CFFORM NAME="frm" ACTION="./title_report_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>

<CFOUTPUT QUERY="read_title">
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>

		<TR>
			<TD width=519 align=left valign=top bgcolor=blue>
				<FONT SIZE=3 color=white face=arial>
				Order Number is...<b>#read_title.title_id#</b>
			</tD>
		</tr>
		<CFIF #Len(read_title.title_abstract)# gt 1>
				<tr>
					<TD width=519 align=left valign=top bgcolor=red>
						<FONT SIZE=3 color=white face=arial>
						<B>This Order has already been searched.  Refer to #read_title.title_abstract#</B></FONT>
					</TD>
				</tr>
			</CFIF>
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td width=100 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Order Date
						</TD>

						<td width=255 colspan=3 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Due Date -
						</TD>

						<td width=155 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">


						</TD>
					</tr>

					<tr>
						<td width=100 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"> <b>#a_month#/#a_day#/#a_year#</b>
						</TD>

						<td width=85 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Month -	<CFINPUT type="text" NAME="oda_month" SIZE=5 MAXLENGTH=2
									VALUE="#DateFormat(duedate, "mm")#"
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
						</TD>

						<td width=85 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Day - <CFINPUT type="text" NAME="oda_day" SIZE=5 MAXLENGTH=2
									VALUE="#DateFormat(duedate, "dd")#"
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
						</TD>

						<td width=85 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Year - <CFINPUT type="text" NAME="oda_year" SIZE=5 MAXLENGTH=4
									VALUE="#DateFormat(duedate, "yyyy")#"
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
						</TD>

						<td width=155 align=center valign=top bgcolor=d3d3d3>


						</TD>
					</tr>
				</table>
</CFOUTPUT>

				</td>
			</tr>

	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CLIENT SPECIFIC INFORMATION</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

<CFOUTPUT>

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
							<B>
							<CFINPUT type="text" NAME="oname" SIZE=21 MAXLENGTH=25
								VALUE="#read_title.oname#"
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
									clear: none;" > </B>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B><CFINPUT type="text" NAME="pname" SIZE=21 MAXLENGTH=25
								VALUE="#read_title.pname#"
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
									clear: none;" ></B>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="ophone" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.ophone#"
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
									clear: none;" ></b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B><CFINPUT type="text" NAME="pphone" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.pphone#"
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
									clear: none;" ></b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="oext" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.oext#"
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
									clear: none;" ></b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="pext" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.pext#"
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
									clear: none;" ></b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="ofax" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.ofax#"
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
									clear: none;" ></b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="pfax" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.pfax#"
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
									clear: none;" ></b>
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
							<b><CFINPUT type="text" NAME="o_email" SIZE=39 MAXLENGTH=65
								VALUE="#read_title.o_email#"
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
									clear: none;" ></b>
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="p_email" SIZE=39 MAXLENGTH=65
								VALUE="#read_title.p_email#"
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
									clear: none;" ></b>
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
			<td width=519 align=left colspan=2 valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Third Party Access Request</B></CENTER><br>
					<FONT FACE=arial SIZE=1 color="black"><B>This feature allows you to give access to third parties to your orders.

				</TD>
		</TR>

		<CFQUERY datasource="#request.dsn#" NAME="third_party2">
			SELECT *
			FROM thirdparty a inner join  thirdpartyorders b on a.ID = b.thirdpID
			WHERE orderid = #read_title.title_id#

		</CFQUERY>

				<CFQUERY datasource="#request.dsn#" NAME="third_party">
			SELECT *
			FROM thirdparty
			WHERE comp_id = #read_title.comp_ID#

		</CFQUERY>
		<tr>
			<td width=519 bgcolor="f1f1f1" align=center valign=top>

							<FONT FACE=ARIAL SIZE=1 color="black">
							<b>Select Third Party(ies) -- hold 'CTRL' for multiple select </b> </font>
			<SELECT NAME="thirdp" 		multiple
			size="3"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none;"
			rows="5"
			cols="45"
			>
			<OPTION VALUE="" selected>NONE</OPTION>
			<cfoutput query="third_party"><OPTION VALUE="#ID#">#FIRST# #LAST# - #EMAIL#</OPTION></CFOUTPUT>
			</SELECT>

				<CFOUTPUT>		 <br> <font color="990000" size="2" face="Times New Roman, Times, serif"><a href="https://#cgi.server_name#/registertp.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#" target="registertp" onClick="window.open('','registertp','width=620,height=400,status=0,resizable=0,scrollbars=0')">Click here to add new Third Party</a>
	</CFOUTPUT></font>
		</td>


		</TR>






















		<cfoutput  QUERY="read_title">



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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<CFINPUT type="text" NAME="blastname1" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.blastname1#"
									REQUIRED="yes" Message="You must enter the borrower last name in the Borrower/Seller Information Section"
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
							<CFINPUT type="text" NAME="bfirstname1" SIZE=11 MAXLENGTH=15
								VALUE="#read_title.bfirstname1#"
									REQUIRED="yes" Message="You must enter the borrower first name in the Borrower/Seller Information Section"

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
							<CFINPUT type="text" NAME="bminame1" SIZE=1 MAXLENGTH=1
									VALUE="#read_title.bminame1#"
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
							<CFINPUT type="text" NAME="bssn1" SIZE=13 MAXLENGTH=11
									VALUE="#read_title.bssn1#"
									REQUIRED="yes" Message="You must enter the borrower last name in the Borrower/Seller Information Section"
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
							<CFINPUT type="text" NAME="bhphone1" SIZE=12 MAXLENGTH=15
										VALUE="#read_title.bhphone1#"
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
							<CFINPUT type="text" NAME="bwphone1" SIZE=12 MAXLENGTH=15
									VALUE="#read_title.bwphone1#"
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
							<CFINPUT type="text" NAME="bext1" SIZE=4 MAXLENGTH=5
								VALUE="#read_title.bext1#"
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
							<CFINPUT type="text" NAME="blastname2" SIZE=11 MAXLENGTH=25
									VALUE="#read_title.blastname2#"
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
							<CFINPUT type="text" NAME="bfirstname2" SIZE=11 MAXLENGTH=15
									VALUE="#read_title.bfirstname2#"
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
							<CFINPUT type="text" NAME="bminame2" SIZE=1 MAXLENGTH=1
								VALUE="#read_title.bminame2#"
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
							<CFINPUT type="text" NAME="bssn2" SIZE=13 MAXLENGTH=11
								VALUE="#read_title.bssn2#"
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
							<CFINPUT type="text" NAME="bhphone2" SIZE=12 MAXLENGTH=15
								VALUE="#read_title.bhphone2#"
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
							<CFINPUT type="text" NAME="bwphone2" SIZE=12 MAXLENGTH=15
							VALUE="#read_title.bwphone2#"
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
							<CFINPUT type="text" NAME="bext2" SIZE=4 MAXLENGTH=5
									VALUE="#read_title.bext2#"
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
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td width=25 colspan=1 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							&nbsp;
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Company Name<br>
								<CFINPUT type="text" NAME="company1" SIZE=25 MAXLENGTH=50
									VALUE="#read_title.company1#"
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
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Tax ID <br>
							<CFINPUT type="text" NAME="taxID1" SIZE=13 MAXLENGTH=13
									VALUE="#read_title.taxID1#"
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
							<CFINPUT type="text" NAME="slastname1" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.slastname1#"
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
							<CFINPUT type="text" NAME="sfirstname1" SIZE=11 MAXLENGTH=15
								VALUE="#read_title.sfirstname1#"
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
							<CFINPUT type="text" NAME="sminame1" SIZE=1 MAXLENGTH=1
									VALUE="#read_title.sminame1#"
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
							<CFINPUT type="text" NAME="sssn1" SIZE=13 MAXLENGTH=11
										VALUE="#read_title.sssn1#"
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
							<CFINPUT type="text" NAME="shphone1" SIZE=12 MAXLENGTH=15
									VALUE="#read_title.shphone1#"
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
							<CFINPUT type="text" NAME="swphone1" SIZE=12 MAXLENGTH=15
									VALUE="#read_title.swphone1#"
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
							<CFINPUT type="text" NAME="sext1" SIZE=4 MAXLENGTH=5
								VALUE="#read_title.sext1#"
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
							<CFINPUT type="text" NAME="slastname2" SIZE=11 MAXLENGTH=25
									VALUE="#read_title.slastname2#"
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
							<CFINPUT type="text" NAME="sfirstname2" SIZE=11 MAXLENGTH=15
									VALUE="#read_title.sfirstname2#"
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
							<CFINPUT type="text" NAME="sminame2" SIZE=1 MAXLENGTH=1
									VALUE="#read_title.sminame2#"
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
							<CFINPUT type="text" NAME="sssn2" SIZE=13 MAXLENGTH=11
									VALUE="#read_title.sssn2#"
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
							<CFINPUT type="text" NAME="shphone2" SIZE=12 MAXLENGTH=15
									VALUE="#read_title.shphone2#"
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
							<CFINPUT type="text" NAME="swphone2" SIZE=12 MAXLENGTH=15
									VALUE="#read_title.swphone2#"
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
							<CFINPUT type="text" NAME="sext2" SIZE=4 MAXLENGTH=5
									VALUE="#read_title.sext2#"
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
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td width=25 colspan=1 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							&nbsp;
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Company Name<br>
								<CFINPUT type="text" NAME="company2" SIZE=25 MAXLENGTH=50
									VALUE="#read_title.company2#"
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
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Tax ID <br>
							<CFINPUT type="text" NAME="taxID2" SIZE=13 MAXLENGTH=13
									VALUE="#read_title.taxID2#"
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
			</td>
		</tr>


</table>



<!--- ======================================================================== --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<NOBR><B>PROPERTY ADDRESS</B></NOBR>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Street Address <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<CFINPUT type="text" NAME="paddress" SIZE=50 MAXLENGTH=80
									VALUE="#read_title.paddress#"
									REQUIRED="yes" Message="You must enter Property Address"
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
						<td width=860 colspan = 2  bgcolor="f1f1f1" align=center><FONT FACE=ARIAL SIZE=1 color="gray">
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><NOBR>City
							<CFINPUT type="text" NAME="pcity" SIZE=11 MAXLENGTH=35
								VALUE="#read_title.pcity#"
									REQUIRED="yes" Message="You must enter the City of Property"
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

							 State
</cfoutput>
							 <select name="pstate"
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
								<CFOUTPUT><OPTION VALUE="#read_title.pstate#">#read_title.pstate#</OPTION></CFOUTPUT>
							<cfoutput query ="read_state_list"><OPTION VALUE="#st_abbrev#">#st_abbrev#</OPTION></cfoutput>
								</select>

							<CFOUTPUT>
							  Zip:

							  	 <CFINPUT type="text" NAME="pzip" SIZE=11 MAXLENGTH=15
								VALUE="#read_title.pzip#"
									REQUIRED="yes" Message="You must enter zip of property address"
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
							  </td></NOBR></b>

					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="pcounty" SIZE=25 MAXLENGTH=55
								VALUE="#read_title.pcounty#"
									REQUIRED="yes" Message="You must enter county of property address"
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
									clear: none;" > </b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Legal Description <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<CFINPUT type="text" name="plegaldesc" size=50 maxlength=150
									VALUE="#read_title.plegaldesc#"
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
								<CFIF #read_title.prop_use_type# EQ "Primary Residence">
									<OPTION VALUE="Primary Residence" SELECTED>Primary Residence</OPTION>
								<CFELSE>
									<OPTION VALUE="Primary Residence">Primary Residence</OPTION>
								</CFIF>

								<CFIF #read_title.prop_use_type# EQ "Investment/Other">
									<OPTION VALUE="Investment/Other" SELECTED>Investment/Other</OPTION>
								<CFELSE>
									<OPTION VALUE="Investment/Other">Investment/Other</OPTION>
								</CFIF>
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
								<CFIF #read_title.condo_pud# EQ "N/A">
									<OPTION VALUE="N/A" SELECTED>N/A</OPTION>
								<CFELSE>
									<OPTION VALUE="N/A">N/A</OPTION>
								</CFIF>

								<CFIF #read_title.condo_pud# EQ "Condo">
									<OPTION VALUE="Condo" SELECTED>Condo</OPTION>
								<CFELSE>
									<OPTION VALUE="Condo">Condo</OPTION>
								</CFIF>

								<CFIF #read_title.condo_pud# EQ "PUD">
									<OPTION VALUE="PUD" SELECTED>PUD</OPTION>
								<CFELSE>
									<OPTION VALUE="PUD">PUD</OPTION>
								</CFIF>
							</select>
						</td>
					</tr>

				</table>
			</td>
		</tr>


</table>
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
							<cfif #read_title.comp_id# eq "254">
							<CFINPUT TYPE="Text" NAME="loan_number"
									 REQUIRED="yes" Message="You must enter a Loan Number"
									VALUE="#read_title.loan_number#"
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
									<CFINPUT TYPE="Text" NAME="loan_number"
									VALUE="#read_title.loan_number#"
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

			<tr>
			<td width=519 bgcolor="f1f1f1" colspan = 2 align=center valign=top>

							<FONT FACE=ARIAL SIZE=1 color="gray">
							Select the type of HUD you would like:

		<!--- </td><td width=259  bgcolor="f1f1f1" align=left valign=top> ---><FONT FACE=ARIAL SIZE=2 color="red">
							<cfif #read_title.hud_type# eq 0><NOBR>&nbsp;&nbsp;&nbsp;&nbsp;HUD1 <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO" NAME="HUD_TYPE" VALUE="0" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">HUD1A <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="HUD_TYPE" VALUE="1"></NOBR>
						<cfelse>
						<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;HUD1 <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO" NAME="HUD_TYPE" VALUE="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">HUD1A <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="HUD_TYPE" VALUE="1" checked></NOBR>

		</td></cfif>


		</TR>




</table>
<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/       [ COMMENTS ]  TOP         \=== --->
<!--- ========================================= --->
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
									clear: none;" >#read_title.a_COMMENT#</textarea>

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
						<td bgcolor="f1f1f1" align=center valign=top colspan=3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
<CENTER>Do payoffs need to be ordered?&nbsp;&nbsp;YES <input type="radio" name="payoff_needed" value="1" <cfif read_title.payoff_needed eq 1>checked</cfif>>&nbsp;&nbsp;NO <input type="radio" name="payoff_needed" value="0" <cfif read_title.payoff_needed eq 0>checked</cfif>></CENTER>
						</td>
					</tr>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1>Please forward borrower authorization if needed for payoff requests by facsimile (301-279-7930) or <a href="mailto:webmaster@firsttitleservices.com">email</a>.</FONT>
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
							<CFINPUT type="text" NAME="polender1" size=15 maxlength=25 VALUE="#read_title.polender1#"
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
							<CFINPUT type="text" NAME="poacctno1" size=20 maxlength=30 VALUE="#read_title.poacctno1#"
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
							<CFINPUT type="text" NAME="pophone1"  size=12 maxlength=20
							 VALUE="#read_title.pophone1#"
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
							<CFINPUT type="text" NAME="polender2" size=15 maxlength=25 VALUE="#read_title.polender2#"
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
							<CFINPUT type="text" NAME="poacctno2" size=20 maxlength=30 VALUE="#read_title.poacctno2#"
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
							<CFINPUT type="text" NAME="pophone2"  size=12 maxlength=20
							VALUE="#read_title.pophone2#"
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
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
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
										<!---<select name="SearchType"
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
											ONVALIDATE="testbox"
 											MESSAGE="Sorry, invalid entry.">--->
 								<CFSELECT Name="searchtype"
	                                QUERY="read_search"
	                                Selected = "#read_title.searchtype#"
                                    Value="SearchType"
	                                Display="Expr1">
                                </CFSELECT>
                               <!--- </select>--->
						</td>

						<td width=100 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Deed Transfer
						</td>

						<td width=144 bgcolor="f1f1f1" align=left valign=top>
										<select name="Deedtransfer"
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
								<CFIF #read_title.Deedtransfer# EQ "Yes">
									<OPTION VALUE="Yes" SELECTED>Yes</OPTION>
								<CFELSE>
									<OPTION VALUE="Yes">Yes</OPTION>
								</CFIF>

								<CFIF #read_title.Deedtransfer# EQ "No">
									<OPTION VALUE="No" SELECTED>No</OPTION>
								<CFELSE>
									<OPTION VALUE="No">No</OPTION>
								</CFIF>
										</select>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Proposed Insured
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<CFINPUT type="text" NAME="Insured" SIZE=40 MAXLENGTH=120
							    VALUE="#read_title.Insured#"
									REQUIRED="yes" Message="You must enter Proposed Insured"
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
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Property Purchase Price
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<CFINPUT type="text" NAME="Purchase" SIZE=40 MAXLENGTH=120 VALUE="#read_title.Purchase#"
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
						<td width=125 bgcolor="f1f1f1" align=right valign=top>

						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=ARIAL SIZE=1 color="red">
							(enter numbers only, do not use commas, or $
						</td>
					</tr>


					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Amount
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<INPUT type="text" NAME="loanamt_float" SIZE=40 MAXLENGTH=120 VALUE="#read_title.loanamt_float#"
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
						<td width=125 bgcolor="f1f1f1" align=right valign=top>

						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=ARIAL SIZE=1 color="red">
							(enter numbers only, do not use commas, or $
						</td>
					</tr>


<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Current Loan Balances
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<INPUT type="text" NAME="estimated_loan_float" SIZE=40 MAXLENGTH=120 VALUE="#read_title.estimated_loan_float#"
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
						<td width=125 bgcolor="f1f1f1" align=right valign=top>

						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=ARIAL SIZE=1 color="red">
							(enter numbers only, do not use commas, or $
						</td>
					</tr>



















<cfif read_sel_company.allow_subrates eq 1 and read_title.searchtype eq 'Refinance'>
			<tr id="same_lender_td" bgcolor="f1f1f1">
                <td colspan=4 align=left valign=top>&nbsp;<b><FONT FACE=ARIAL SIZE=1 color="gray"><font color="red">*</font>&nbsp;Was the previous policy issued by the same lender?</b>
				<input type="radio" name="same_lender" value="1" <cfif read_title.same_lender eq 1>checked</cfif>>Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="same_lender" value="0" <cfif read_title.same_lender eq 0>checked</cfif>>No
				  </td>
              </tr>

</cfif>

<cfset excluded_states = "CA,CO,ID,IL,AK,UT,SD,NM,WA,OR,WY,TX,OK">
<cfif (read_sel_company.id eq 2878 or read_sel_company.master_co_id eq 2878 or read_sel_company.id eq 100) and read_title.searchtype eq 'Refinance' and not ListFind(excluded_states, read_title.pstate, ",")>
			<tr id="reissue_rates_td" bgcolor="f1f1f1">
                <td colspan=4 align=left valign=top>&nbsp;<b><FONT FACE=ARIAL SIZE=1 color="gray"><font color="red">*</font>&nbsp;Do reissue rates apply to this loan?</b>
				<input type="radio" name="reissue_rates" value="1" <cfif read_title.reissue_rates eq 1>checked</cfif>>Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="reissue_rates" value="0" <cfif read_title.reissue_rates eq 0>checked</cfif>>No
				  </td>
              </tr>

</cfif>

			  <cfif (read_title.pstate eq 'TX' and read_title.searchtype eq 'Refinance') or (read_sel_company.allow_subrates eq 1 and read_title.searchtype eq 'Refinance')>
			  <tr id="prev_loan_date_td" bgcolor="f1f1f1">
                <td width=170 align=left valign=top>&nbsp;<b><FONT FACE=ARIAL SIZE=1 color="black"><font color="red">*</font>&nbsp;<font color="gray">Current Loan Date</font></b> </td>
                <td COLSPAN=3 width=349 align=left valign=top>
				<FONT FACE=ARIAL SIZE=1 color="gray">Month</font> <INPUT NAME="previous_loan_month" SIZE=2 MAXLENGTH=2 value="#read_title.prev_loan_mo#"

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
									<FONT FACE=ARIAL SIZE=1 color="gray">Year</font> <INPUT NAME="previous_loan_year" SIZE=4 MAXLENGTH=4  value="#read_title.prev_loan_year#"

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
                  <FONT FACE=ARIAL SIZE=1 color="blue"> format&nbsp; ^ xxxxxx^ &nbsp;numbers only</font><br>
				  </td>
              </tr>
<cfelse>
<input type="hidden" name="previous_loan_month" value="1">
<input type="hidden" name="previous_loan_year" value="1996">
<input type="hidden" name="same_lender" value="0">
</cfif>








<input type="hidden" name="jlp_policy" value="0">
<!---<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is this a Junior Loan Policy?
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<INPUT type="radio" NAME="jlp_policy" SIZE=40 MAXLENGTH=120 VALUE="1" <cfif read_title.jlp_policy eq 1>checked</cfif>> Yes&nbsp;&nbsp;<INPUT type="radio" NAME="jlp_policy" SIZE=40 MAXLENGTH=120 VALUE="0" <cfif read_title.jlp_policy eq 0>checked</cfif>> No
						</td>
					</tr>
--->


<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Will there be Enhanced Title Insurance Coverage with the above loan?
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<INPUT type="radio" NAME="enhanced_coverage" SIZE=40 MAXLENGTH=120 VALUE="1" <cfif read_title.enhanced_coverage eq 1>checked</cfif>> Yes&nbsp;&nbsp;<INPUT type="radio" NAME="enhanced_coverage" SIZE=40 MAXLENGTH=120 VALUE="0" <cfif read_title.enhanced_coverage eq 0>checked</cfif>> No
						</td>
					</tr>


<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Will there be a piggyback second mortgage closed with the above loan?
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<INPUT type="radio" NAME="piggy" SIZE=40 MAXLENGTH=120 VALUE="1" <cfif read_title.piggy eq 1>checked</cfif>> Yes&nbsp;&nbsp;<INPUT type="radio" NAME="piggy" SIZE=40 MAXLENGTH=120 VALUE="0" <cfif read_title.piggy eq 0>checked</cfif>> No
						</td>
					</tr>


<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Will title insurance be required on this piggyback loan?
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<INPUT type="radio" NAME="ins" SIZE=40 MAXLENGTH=120 VALUE="1" <cfif read_title.ins eq 1>checked</cfif>> Yes&nbsp;&nbsp;<INPUT type="radio" NAME="ins" SIZE=40 MAXLENGTH=120 VALUE="0" <cfif read_title.ins eq 0>checked</cfif>> No
						</td>
					</tr>


<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							What is the loan amount of this second mortgage loan?
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<INPUT type="text" NAME="secloan" SIZE=40 MAXLENGTH=120 VALUE="#read_title.secloan#" style="font-size: 9;
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
									clear: none;">
						</td>
					</tr>



					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Type
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
										<select name="loan_type_111"
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

								<CFIF #read_title.loan_type_111# EQ "Conventional">
									<OPTION VALUE="Conventional" SELECTED>Conventional</OPTION>
								<CFELSE>
									<OPTION VALUE="Conventional">Conventional</OPTION>
								</CFIF>

								<CFIF #read_title.loan_type_111# EQ "Sub-Prime">
									<OPTION VALUE="Sub-Prime" SELECTED>Sub-Prime</OPTION>
								<CFELSE>
									<OPTION VALUE="Sub-Prime">Sub-Prime</OPTION>
								</CFIF>

								<CFIF #read_title.loan_type_111# EQ "VA">
									<OPTION VALUE="VA" SELECTED>VA</OPTION>
								<CFELSE>
									<OPTION VALUE="VA">VA</OPTION>
								</CFIF>

								<CFIF #read_title.loan_type_111# EQ "FHA">
									<OPTION VALUE="FHA" SELECTED>FHA</OPTION>
								<CFELSE>
									<OPTION VALUE="FHA">FHA</OPTION>
								</CFIF>
										</select>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Program
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
										<select name="loan_program_333"
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
								<CFIF #read_title.loan_program_333# EQ "Fixed Rate">
									<OPTION VALUE="Fixed Rate" SELECTED>Fixed Rate</OPTION>
								<CFELSE>
									<OPTION VALUE="Fixed Rate">Fixed Rate</OPTION>
								</CFIF>

								<CFIF #read_title.loan_program_333# EQ "ARM">
									<OPTION VALUE="ARM" SELECTED>ARM</OPTION>
								<CFELSE>
									<OPTION VALUE="ARM">ARM</OPTION>
								</CFIF>

								<CFIF #read_title.loan_program_333# EQ "Neg. Amort.">
									<OPTION VALUE="Neg. Amort." SELECTED>Neg. Amort.</OPTION>
								<CFELSE>
									<OPTION VALUE="Neg. Amort.">Neg. Amort.</OPTION>
								</CFIF>
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
<!--- ===/    ICL REQUESTED        \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ICL</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=150 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Lender:</FONT>
							</td>
						<td width=350 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><input type="text" size="25" maxlength="50" value="#read_title.aname#" NAME="ANAME" style="font-size: 9;
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
									clear: none;">
						</td>
					</tr>
					<tr>
						<td width=150 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Address:</FONT>
						</td>
						<td width=350 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><input type="text" size="25" maxlength="50" value="#read_title.aaddress#" NAME="AADDRESS" Style="font-size: 9;
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
									clear: none;">
						</td>
					</tr>
					<tr>
						<td width=150 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>City:</FONT>
						</td>
						<td width=350 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><input type="text" size="25" maxlength="50" value="#read_title.acity#" NAME="ACITY" style="font-size: 9;
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
									clear: none;">
						</td>
					</tr>
					<tr>
						<td width=150 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>State:</FONT>
							</td>
						<td width=350 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><input type="text" size="2" maxlength="2" value="#read_title.astate#" NAME="ASTATE" style="font-size: 9;
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
									clear: none;">
						</td>
					</tr>
						<tr>
						<td width=150 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Zip:</FONT>
						</td>
						<td width=350 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><input type="text" size="5" maxlength="5" value="#read_title.azip#" NAME="AZIP" style="font-size: 9;
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
									clear: none;">
						</td>
					</tr>

				</table>
			</td>
		</tr>
	</table>


<!--- ========================================= --->
<!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Verify Order was Received</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address, you will receive a confirmation  e-mail of your order having been received by us.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT><CFINPUT type="text"  NAME="Verifyemail" SIZE=40 MAXLENGTH=120
							VALUE="#read_title.Verifyemail#"
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
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to up to two other e-mail addresses.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT><CFINPUT  TYPE=TEXT NAME="Verifyemail_2"  SIZE=40 MAXLENGTH=120
							VALUE="#read_title.Verifyemail_2#"
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
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT><CFINPUT  TYPE=TEXT NAME="Verifyemail_3"   SIZE=40 MAXLENGTH=120
							VALUE="#read_title.Verifyemail_3#"
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
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<!--- =========================================== --->
<!--- ===/    [ RECEIVE REPORT ]  TOP        \=== --->
<!--- =========================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Request copy of Final Report</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>If you would like to receive a copy of the final report, please provide us with an email address.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT><CFINPUT type="text"  NAME="RptbyEmail" SIZE=40 MAXLENGTH=120
							VALUE="#read_title.RptbyEmail#"
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
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Title Commitment to be Issued:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>
<CFQUERY datasource="#request.dsn#" NAME="title_companies">
			SELECT *
			FROM Title_companies where title_co_id <> 14 and title_co_id <> 15
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="current_title_co">
			SELECT insurance_co from Doc_Title_Insurance_Title
			where title_id = #read_title.title_id#
</CFQUERY>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Title Commitment:</FONT><select NAME="title_committment" style="font-size: 9;
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
									clear: none;">
<cfloop query="title_companies">
<option value="#title_companies.title_co_id#" <cfif title_companies.title_co_id eq current_title_co.insurance_co>selected</cfif>>#title_companies.company#</option></cfloop>
							</select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->


</CFOUTPUT>


<!--- <CFOUTPUT QUERY="read_zip_code">

	<INPUT TYPE=HIDDEN NAME="pcity"   VALUE="#city#">
	<INPUT TYPE=HIDDEN NAME="pstate"  VALUE="#state#">
	<INPUT TYPE=HIDDEN NAME="pzip"    VALUE="#zip#">
	<INPUT TYPE=HIDDEN NAME="pcounty" VALUE="#county#">



</CFOUTPUT> --->


		</TD>
	</TR>
		<tr><td width=607 align=right valign=bottom>
			<NOBR><input type=image border=0 src="./images/button_submit.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>


	</table>

</CFFORM>




</body>
</html>
