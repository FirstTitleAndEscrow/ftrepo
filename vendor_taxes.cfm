


<CFPARAM NAME="Abstractor_ID_new" DEFAULT="">
	<CFPARAM NAME="username" DEFAULT="">
	<CFPARAM NAME="password" DEFAULT="">

	<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>

<CFQUERY NAME="prefill" DataSource="excel_datasource" maxrows="1">
SELECT * FROM `Sheet1$`
IN 'C:\inetpub\wwwroot\Clients\firsttitleservices.com\database\tax_collectors.xls' 'EXCEL 5.0;'
where state = '#read_title.pstate#' and county = '#read_title.pcounty#' and city = '#read_title.pcity#'
</CFQUERY>

<cfparam name="prefill.payto" default="">
<cfparam name="prefill.taxcoll" default="">
<cfparam name="prefill.addr1" default="">
<cfparam name="prefill.addr2" default="">
<cfparam name="prefill.taxcity" default="">
<cfparam name="prefill.taxstate" default="">
<cfparam name="prefill.taxzip" default="">
<cfparam name="prefill.phone" default="">
<cfparam name="prefill.web" default="">
<cfparam name="prefill.apn" default="">
<cfparam name="prefill.taxfreq" default="">



		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_Title
	WHERE title_ID = #rec_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor">
	SELECT *
	FROM Abstractors
	WHERE abstractor_ID = '#read_title_abstract.abstractor_tax_ID#'
</CFQUERY>
<CFIF #read_title_abstract.abstractor_ID_2# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor_2">
		SELECT *
		FROM Abstractors
		WHERE abstractor_ID = '#read_title_abstract.abstractor_ID_2#'
	</CFQUERY>
</CFIF>

<CFIF #read_title_abstract.abstractor_ID_3# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor_3">
		SELECT *
		FROM Abstractors
		WHERE abstractor_ID = '#read_title_abstract.abstractor_ID_3#'
	</CFQUERY>
</CFIF>

<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
	SELECT *
	FROM Abstractors where type = 4
	and (status <> '0' OR status IS NULL)
	ORDER BY company ASC, lname ASC, fname ASC

</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">
	SELECT *
	FROM title
	WHERE pstate = '#read_title.pstate#' AND UPPER(pcounty) = UPPER('#read_title.pcounty#')
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_state">
	SELECT *
	FROM Abstractors_county
	where st_abbrev = '#read_zip_code.pstate#' AND UPPER(ct_name) = UPPER('#read_zip_code.pcounty#')
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
	SELECT *
	FROM Abstractors_county a, abstractors b
	where a.st_abbrev = '#read_zip_code.pstate#' AND UPPER(a.ct_name) = UPPER('#ReplaceNoCase(read_zip_code.pcounty, "'", "", "ALL")#') AND a.abstractor_id = b.abstractor_id and b.type = 4
	and (b.status <> '0' OR b.status IS NULL)
</CFQUERY>


<!--- the following code pre-fills the fields for the accounts listed in the IF statement, if there is no info there already --->
<CFQUERY datasource="#request.dsn#" NAME="check_if_aurora">
	SELECT company
	FROM Companies
	where ID = '#read_title.comp_id#'
</CFQUERY>
<cfif check_if_aurora.company contains '(AURORA ONLY)'>
<cfif trim(read_report.payto) eq "" or read_report.payto eq "NULL">
<cfset read_report.payto = "MONTGOMERY COUNTY TAX COLLECTOR">
</cfif>
<cfif trim(read_report.add1) eq "" or read_report.add1 eq "NULL">
<cfset read_report.add1 = "255 ROCKVILLE PIKE, SUITE L-5">
</cfif>
<cfif trim(read_report.city) eq "" or read_report.city eq "NULL">
<cfset read_report.city = "ROCKVILLE">
</cfif>
<cfif trim(read_report.city) eq "" or read_report.city eq "NULL">
<cfset read_report.city = "ROCKVILLE">
</cfif>
<cfif trim(read_report.state) eq "" or read_report.state eq "NULL">
<cfset read_report.state = "MD">
</cfif>
<cfif trim(read_report.zip) eq "" or read_report.zip eq "NULL">
<cfset read_report.zip = "20850">
</cfif>
<cfif trim(read_report.phone) eq "" or read_report.phone eq "NULL">
<cfset read_report.phone = "240-777-8950">
</cfif>
<cfif trim(read_report.acctnum) eq "" or read_report.acctnum eq "NULL">
<cfset read_report.acctnum = "13-02950027">
</cfif>
<cfif trim(read_report.taxfreq) eq "" or read_report.taxfreq eq "NULL">
<cfset read_report.taxfreq = "Semi Annually">
</cfif>
<cfif trim(read_report.paiddate) eq "" or read_report.paiddate eq "NULL">
<cfset read_report.paiddate = "09/30/2005">
</cfif>
<cfif trim(read_report.paidfrom) eq "" or read_report.paidfrom eq "NULL">
<cfset read_report.paidfrom = "07/01/2005">
</cfif>
<cfif trim(read_report.paidto) eq "" or read_report.paidto eq "NULL">
<cfset read_report.paidto = "06/30/2006">
</cfif>
<cfif trim(read_report.lastamt) eq "" or read_report.lastamt eq "NULL">
<cfset read_report.lastamt = "62000.26">
</cfif>
<cfif trim(read_report.duedate) eq "" or read_report.duedate eq "NULL">
<cfset read_report.duedate = "09/30/2006">
</cfif>
<cfif trim(read_report.duefrom) eq "" or read_report.duefrom eq "NULL">
<cfset read_report.duefrom = "07/01/2006">
</cfif>
<cfif trim(read_report.dueto) eq "" or read_report.dueto eq "NULL">
<cfset read_report.dueto = "06/30/2007">
</cfif>
<cfif trim(read_report.dueamt) eq "" or read_report.dueamt eq "NULL">
<cfset read_report.dueamt = "Not Yet Known ">
</cfif>
<cfif Trim(read_report.comments) eq "" or Trim(read_report.comments) eq "NULL">
<cfset read_report.comments = "The projected annual taxes for Taxes for Year 2006/2007 for this Unit are $">
</cfif>
</cfif>







<cfif check_if_aurora.company contains 'MICA -'>
<cfif trim(read_report.payto) eq "" or read_report.payto eq "NULL">
<cfset read_report.payto = "MONTGOMERY COUNTY TAX COLLECTOR">
</cfif>
<cfif trim(read_report.add1) eq "" or read_report.add1 eq "NULL">
<cfset read_report.add1 = "255 ROCKVILLE PIKE, SUITE L-5">
</cfif>
<cfif trim(read_report.city) eq "" or read_report.city eq "NULL">
<cfset read_report.city = "ROCKVILLE">
</cfif>
<cfif trim(read_report.state) eq "" or read_report.state eq "NULL">
<cfset read_report.state = "MD">
</cfif>
<cfif trim(read_report.zip) eq "" or read_report.zip eq "NULL">
<cfset read_report.zip = "20850">
</cfif>
<cfif trim(read_report.phone) eq "" or read_report.phone eq "NULL">
<cfset read_report.phone = "240-777-8950">
</cfif>
<cfif trim(read_report.acctnum) eq "" or read_report.acctnum eq "NULL">
<cfset read_report.acctnum = "02681366">
</cfif>
<cfif trim(read_report.taxfreq) eq "" or read_report.taxfreq eq "NULL">
<cfset read_report.taxfreq = "Annually">
</cfif>
<cfif trim(read_report.paiddate) eq "" or read_report.paiddate eq "NULL">
<cfset read_report.paiddate = "09/30/2005">
</cfif>
<cfif trim(read_report.paidfrom) eq "" or read_report.paidfrom eq "NULL">
<cfset read_report.paidfrom = "07/01/2005">
</cfif>
<cfif trim(read_report.paidto) eq "" or read_report.paidto eq "NULL">
<cfset read_report.paidto = "06/30/2006">
</cfif>
<cfif trim(read_report.lastamt) eq "" or read_report.lastamt eq "NULL">
<cfset read_report.lastamt = "150518.37">
</cfif>
<cfif trim(read_report.duedate) eq "" or read_report.duedate eq "NULL">
<cfset read_report.duedate = "09/30/2006">
</cfif>
<cfif trim(read_report.duefrom) eq "" or read_report.duefrom eq "NULL">
<cfset read_report.duefrom = "07/01/2006">
</cfif>
<cfif trim(read_report.dueto) eq "" or read_report.dueto eq "NULL">
<cfset read_report.dueto = "06/30/2007">
</cfif>
<cfif trim(read_report.dueamt) eq "" or read_report.dueamt eq "NULL">
<cfset read_report.dueamt = "150518.37">
</cfif>
<cfif Trim(read_report.comments) eq "" or Trim(read_report.comments) eq "NULL">
<cfset read_report.comments = "The projected annual taxes for Taxes for Year 2006/2007 for this Unit are $______">
</cfif>
</cfif>

<!--- Prefills for MD Tax collectors --->
<cfif read_title.pstate IS "MD">
	<CFQUERY datasource="#request.dsn#" NAME="get_tax_payee_MD">
		SELECT *
		FROM tax_payee_MD
		where UPPER(county_name) = UPPER('#read_title.pcounty#')
	</CFQUERY>
	<cfif isDefined('get_tax_payee_MD.recordcount')>
		<cfif trim(read_report.taxcoll) eq "" or read_report.taxcoll eq "NULL">
			<cfset thispageishorrible.taxcoll = get_tax_payee_MD.tax_collector>
		</cfif>
		<cfif trim(read_report.payto) eq "" or read_report.payto eq "NULL">
			<cfset thispageishorrible.payto = get_tax_payee_MD.payable_to>
		</cfif>
		<cfif trim(read_report.add1) eq "" or read_report.add1 eq "NULL">
			<cfset thispageishorrible.add1 = get_tax_payee_MD.address_1>
		</cfif>
		<cfif trim(read_report.add2) eq "" or read_report.add1 eq "NULL">
			<cfset thispageishorrible.add2 = get_tax_payee_MD.address_2>
		</cfif>
		<cfif trim(read_report.city) eq "" or read_report.city eq "NULL">
			<cfset thispageishorrible.city = get_tax_payee_MD.city>
		</cfif>
		<cfif trim(read_report.state) eq "" or read_report.state eq "NULL">
			<cfset thispageishorrible.state = "MD">
		</cfif>
		<cfif trim(read_report.zip) eq "" or read_report.zip eq "NULL">
			<cfset thispageishorrible.zip = get_tax_payee_MD.zipcode>
		</cfif>
		<cfif trim(read_report.phone) eq "" or read_report.phone eq "NULL">
			<cfset thispageishorrible.phone = get_tax_payee_MD.phone>
		</cfif>
		<cfif trim(read_report.web) eq "" or read_report.web eq "NULL">
			<cfset thispageishorrible.web = get_tax_payee_MD.web_address>
		</cfif>
	</cfif>
</cfif>
<cfparam name="thispageishorrible.taxcoll" default="#read_report.taxcoll#">
<cfparam name="thispageishorrible.payto" default="#read_report.payto#">
<cfparam name="thispageishorrible.add1" default="#read_report.add1#">
<cfparam name="thispageishorrible.add2" default="#read_report.add2#">
<cfparam name="thispageishorrible.city" default="#read_report.city#">
<cfparam name="thispageishorrible.state" default="#read_report.state#">
<cfparam name="thispageishorrible.zip" default="#read_report.zip#">
<cfparam name="thispageishorrible.phone" default="#read_report.phone#">
<cfparam name="thispageishorrible.web" default="#read_report.web#">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<script language="JavaScript" type="text/javascript">
function trim(str, chars) {
    return ltrim(rtrim(str, chars), chars);
}

function ltrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}

function rtrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}

</script>

<script type="text/javascript">
function put() {
var frm;
frm = document.frm;


if ( frm.comments_only.checked == true ) {

var comments_text = trim(frm.comments.value);

if (trim(frm.comments.value)=='') {
frm.comments.value = '';
alert("Comments field cannot be left blank")
return false; }

// if ((trim(frm.comments.value)=='')) {
// alert("Comments field cannot be left blank")
// return false; }


} else {

// if ((frm.paidDate.value=='')&&(frm.assigned.value=='')) {
// alert("The paid Date cannot be left blank")
// return false; }

// if ((frm.assigned.value==1)&&(frm.Abstractor_ID_new.value=='')) {
// alert("The Abstractor field cannot be left blank")
// return false; }

}
}


function prefill_tax() {
<cfoutput>
var taxpayto = '#prefill.payto#';
var taxtaxcoll = '#prefill.taxcoll#';
var taxaddr1 = '#prefill.addr1#';
var taxaddr2 = '#prefill.addr2#';
var taxcity = '#prefill.city#';
var taxstate = '#prefill.state#';
var taxzip = '#prefill.zip#';
var taxphone = '#prefill.phone#';
var taxweb = '#prefill.web#';
var taxapn = '#prefill.apn#';
var taxfrequency = '#prefill.taxfreq#';

document.frm.payto.value = taxpayto;
document.frm.taxcoll.value = taxtaxcoll;
document.frm.add1.value = taxaddr1;
document.frm.add2.value = taxaddr2;
document.frm.city.value = taxcity;
document.frm.state.value = taxstate;
document.frm.zip.value = taxzip;
document.frm.phone.value = taxphone;
document.frm.web.value = taxweb;
document.frm.acctnum.value = taxapn;
document.frm.taxfreq.value = taxfrequency;
</cfoutput>



}


</script>



<cfoutput><script type="text/javascript" language="javascript" src="https://#cgi.server_name#/admin_area/calendar/calendar.js"></script></cfoutput>

</head>

<cfoutput><IFRAME STYLE="display:none;position:absolute;width:157;height:158;z-index=100" ID="CalFrame" MARGINHEIGHT=0 MARGINWIDTH=0 NORESIZE FRAMEBORDER=0 SCROLLING=NO SRC="https://#cgi.server_name#/calendar/popup_calendar.html"></IFRAME></cfoutput>


<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
 <STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;}
.menu1:hover   {font:normal bold 11px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}
</style>

<STYLE TYPE="text/css"><!--
		A { color:#0033CC; text-decoration:none}
		BODY { font-family:arial,helvetica; margin-left:0; margin-top:0; margin-right:0;}
		A:hover,A:active { text-decoration:underline}
		TD { font-family:arial,helvetica;}

	--></STYLE>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Tax Data</B></CENTER>
			</TD>
		</TR>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>


<!--- =================================== --->
<!--- =================================== --->


	<CFFORM action="https://#cgi.server_name#/vendor_taxes_submit.cfm?username=#username#&password=#password#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" METHOD=POST name="frm" ENABLECAB="Yes" onSubmit="return put();">



<CFOUTPUT>


<table width=719 cellpadding=1 cellspacing=1 border=0>
<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Property Address:</B>
			</td>
		</tr>

		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1>

				<table width=518 cellpadding=1 cellspacing=1 border=0>
					<tr>
						<td width=217 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.paddress#</B>
						</td>

						<td width=120 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcity#</B>
						</td>

						<td width=20 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pstate#</B>
						</td>

						<td width=60 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pzip#</B>
						</td>

						<td width=100 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcounty#</B>
						</td>
					</tr>
					<tr>
						<td width=517 colspan=5 align=right valign=top>
							<font size=2 color=blue face=arial>
							Loan Amount is.... <font size=2 color=blue face=arial>
							<B>$ #NumberFormat(read_title.loanamt_float, "999,999,999.99")#</B><br>

						</td>
					</tr>

				</table>

			</td>
		</tr>

</table><table width=719 cellpadding=1 cellspacing=1 border=0>


		<tr>
			<td width=719 colspan=2 align=left valign=top bgcolor=f3f3f3>
				<font size=3 color=blue face=arial>
				<B>Tax Information</B>
			</td>
		</tr>
</table>
<table width=719 cellpadding=1 cellspacing=1 border=0>
</cfoutput>

<cfoutput></table><table width=719 cellpadding=1 cellspacing=1 border=0>
<tr>
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Payable To:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="payto"  size=40 maxlength=50
				VALUE="#thispageishorrible.payto#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >&nbsp;<input type="button" name="prefill" value="Look-up" onclick="prefill_tax();">


		</td>
	</tr>

	<tr>
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Collector:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="taxcoll"  size=40 maxlength=50
				VALUE="#thispageishorrible.taxcoll#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
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
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Address-1:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="add1"  size=40 maxlength=50
				VALUE="#thispageishorrible.add1#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
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
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Address-2:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="add2"  size=40 maxlength=50
				VALUE="#thispageishorrible.add2#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
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
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			City:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="city"  size=30 maxlength=50
				VALUE="#thispageishorrible.city#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
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
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			State


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<select name="state"
size="1"
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
								cols="45">
	<cfif #thispageishorrible.state# neq "">
		<option value="#thispageishorrible.state#"  selected>#thispageishorrible.state#</option> <cfelse>
<option value="" SELECTED></option>
</cfif>
			</cfoutput>
		<CFOUTPUT QUERY="read_state_list">

							<option value="#st_abbrev#">#st_abbrev#</option>

					</CFOUTPUT>

		<cfoutput>
		</select>


		</td>
	</tr>










	<tr>
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Zip Code


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="zip"  size=20 maxlength=50
				VALUE="#thispageishorrible.zip#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
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
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="phone"  size=30 maxlength=50
				VALUE="#thispageishorrible.phone#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
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
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Web Address


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="web"  size=40 maxlength=50
				VALUE="#thispageishorrible.web#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
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
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		APN/Account Num:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="acctnum"  size=30 maxlength=50
				VALUE="#read_report.acctnum#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
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
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Frequency:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
	<SELECT NAME="taxfreq"
			size="1"
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

				<cfif #read_report.taxfreq# neq "">
		<option value="#read_report.taxfreq#"  selected>#read_report.taxfreq#</option> <cfelse>
<option value="" SELECTED></option>
</cfif>

			<OPTION VALUE="Annually">Annually</OPTION>
			<OPTION VALUE="Semi Annually">Semi Annually</OPTION>
			<OPTION VALUE="Quarterly">Quarterly</OPTION>

			</SELECT>



</td></tr>


		<tr>
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Paid Date:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=black face=arial>
		<cfINPUT type="text" NAME="paidDate"  SIZE=12 MAXLENGTH=10
							VALUE="#read_report.paidDate#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
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
							<A href="javascript:ShowCalendar(document.all('calpic'),document.all('paidDate'),document.all('null'),'01/1/2005', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A>



&nbsp;&nbsp;which covers from <cfINPUT type="text" NAME="paidFrom"  SIZE=12 MAXLENGTH=10
							VALUE="#read_report.paidFrom#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
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
							<A href="javascript:ShowCalendar(document.all('calpic1'),document.all('paidFrom'),document.all('null'),'01/1/2005', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic1" style="POSITION: relative"></A>&nbsp;&nbsp;to
							 <cfINPUT type="text" NAME="paidTo"  SIZE=12 MAXLENGTH=10
							VALUE="#read_report.paidTo#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
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
							<A href="javascript:ShowCalendar(document.all('calpic2'),document.all('paidTo'),document.all('null'),'01/1/2005', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic2" style="POSITION: relative"></A>




</td></tr>





<tr>
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Last Tax Amt:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="lastamt"  size=30 maxlength=50
				VALUE="#read_report.lastamt#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
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
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Next Tax Due(Date):


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
 	<font size=2 color=black face=arial>

			<cfINPUT type="text" NAME="dueDate"  SIZE=12 MAXLENGTH=10
							VALUE="#read_report.dueDate#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
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
							<A href="javascript:ShowCalendar(document.all('calpic0'),document.all('dueDate'),document.all('null'),'01/1/2005', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic0" style="POSITION: relative"></A>



	&nbsp;&nbsp;which covers from <cfINPUT type="text" NAME="dueFrom"  SIZE=12 MAXLENGTH=10
							VALUE="#read_report.dueFrom#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
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
							<A href="javascript:ShowCalendar(document.all('calpic3'),document.all('dueFrom'),document.all('null'),'01/1/2005', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic3" style="POSITION: relative"></A>&nbsp;&nbsp;to
							 <cfINPUT type="text" NAME="dueTo"  SIZE=12 MAXLENGTH=10
							VALUE="#read_report.dueTo#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
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
							<A href="javascript:ShowCalendar(document.all('calpic4'),document.all('dueTo'),document.all('null'),'01/1/2005', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic4" style="POSITION: relative"></A>




</td></tr>



	<tr>
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Due Amt:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="dueamt"  size=30 maxlength=50
				VALUE="#read_report.dueamt#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
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
			<td width=719 colspan=2 align=left valign=top bgcolor=f3f3f3>
				<font size=3 color=blue face=arial>
				<B>Delinquent Information</B>
			</td>
		</tr>





	<tr>
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Delinquent Amt:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="delamt"  size=30 maxlength=50
				VALUE="#read_report.delamt#"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
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
		<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Good Thru Date:


		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
	 <cfINPUT type="text" NAME="thruDate"  SIZE=12 MAXLENGTH=10
							VALUE="#read_report.thruDate#"
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
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

<A href="javascript:ShowCalendar(document.all('calpic5'),document.all('thruDate'),document.all('null'),'01/1/1503', '12/31/1509')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic5" style="POSITION: relative"></A>


</td></tr>

		<tr>
			<td width=719 colspan=2 align=left valign=top bgcolor=f3f3f3>
				<font size=3 color=blue face=arial>
				<B>Comments</B>
			</td>
		</tr>


	<tr>
	<td align=left valign=top bgcolor=e6e6e6 colspan="3">
			<font size=2 color=black face=arial><input name="comments_only" type="checkbox" value=1 <cfif read_report.comments_only eq 1>checked</cfif>>&nbsp;&nbsp;Check this box to opt-out of completion of form above. Comments below are required to complete tax information.

		</td>

	</tr>


		<tr>
	<td width=150 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Comments

		</td>

		<td width=469 align=left valign=top bgcolor=e6e6e6>
			<TEXTAREA name="comments"  COLS=50 ROWS=5
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: e6e6e6;
					border-color: e6e6e6;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;
					clear: none;">#read_report.comments#
					</TEXTAREA>

		</td>
	</tr>
  </CFOUTPUT>
		<tr>

<input type=hidden  name="submitted"  id="submitted"  value="">
			<td colspan=2   align=left valign=top bgcolor=e1e1e1><input type="checkbox" value=1 name="taxes_completed" <cfif read_report.taxes_completed eq 1>checked</cfif>>  <font size=2 color=black face=arial><strong>I certify that tax information for this file is complete based on the information provided</strong><br>
(taxes will not be completed unless box is checked)</font>
				<!--- <input type=Submit   value="Save"> --->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=image src="./images/button_submit.gif" onclick="document.frm.submitted.value=1;" border=0>
			</td>
		</tr>




	</table>


</CFFORM>
		</td>
	</tr>
</table>

		</td>
	</tr>
</table>

		</td>
	</tr>
</table>



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