<CFQUERY datasource="#request.dsn#" name="check_shapiro">
Select child_ids from companies where ID = 2368 or ID = 3011 or ID = 2372
</CFQUERY>
<cfset children = check_shapiro.child_ids>
<cfloop query="check_shapiro" startrow="2">
<cfif check_shapiro.child_ids neq "" and check_shapiro.child_ids neq 'NULL'>
<cfset children = children & "," & "#check_shapiro.child_ids#">
</cfif>
</cfloop>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>


<TITLE>First Title Abstractor Services</TITLE>
<script type="text/javascript">
function put() {
var frm;
frm = document.frm;
if (frm.month.value=='' || frm.day.value=='' || frm.year.value=='') {
alert("The effective date cannot be left blank")
return false; }
else if (frm.select1.value=='') {
alert("The type of Vesting cannot be left blank")
return false;
}
else if (frm.deedtype.value=='') {
alert("The type of Deed cannot be left blank")
return false;
}
// else if (frm.mannertitle.value=='') {
// alert("The Manner of Title cannot be left blank")
// return false;
// }

else if (frm.inst_mon.value=='' || frm.inst_day.value=='' || frm.inst_year.value=='') {
alert("The Instrument date cannot be left blank")
return false; }

else if (frm.rec_mon.value=='' || frm.rec_day.value=='' || frm.rec_year.value=='') {
alert("The Recording date cannot be left blank")
return false; }

else if (frm.docnum.value == '') {
		if (frm.book.value=='' || frm.page.value=='') {
		alert("When document Number is empty book and page fields should be filled in")
 frm.book.focus();
return false; }
}
else if (frm.tx.value != '') {
		if (frm.tax_year.value=='') {
		alert("Tax Year cannot be left blank")
return false; }
if (frm.inst_monx.value=='' || frm.inst_dayx.value=='' || frm.inst_yearx.value=='') {
		alert("Paid Date cannot be left blank")
return false; }
if (frm.inst_mont.value=='' || frm.inst_dayt.value=='' || frm.inst_yeart.value=='') {
		alert("Due Date cannot be left blank")
return false; }
if (frm.rec_mont.value=='' || frm.rec_dayt.value=='' || frm.rec_yeart.value=='') {
		alert("Taxes Paid Through cannot be left blank")
return false; }

}

}
</script>
</HEAD>

<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#
		</CFQUERY>

<cfparam name="effective_month" default="">
<cfparam name="effective_day" default="">
<cfparam name="effective_year" default="">
<cfparam name="vesting_type" default="">
<cfparam name="grantor1" default="">
<cfparam name="grantee1" default="">
<cfparam name="deed_type" default="">
<cfparam name="tile_manner" default="">
<cfparam name="book" default="">
<cfparam name="page" default="">
<cfparam name="instrument_date_month" default="">
<cfparam name="instrument_date_day" default="">
<cfparam name="instrument_date_year" default="">
<cfparam name="recording_date_month" default="">
<cfparam name="recording_date_day" default="">
<cfparam name="recording_date_year" default="">
<cfparam name="vesting" default="">
<cfparam name="consideration" default="">
<cfparam name="legal" default="">
<cfparam name="additional_exceptions" default="">
<cfparam name="covenants" default="">

<!--- the following code pre-fills the fields for the accounts listed in the IF statement, if there is no info there already --->
<CFQUERY datasource="#request.dsn#" NAME="check_if_prefill">
	SELECT company
	FROM Companies
	where ID = '#read_title.comp_id#'
</CFQUERY>
<cfif check_if_prefill.company contains '(AURORA ONLY)'>
<cfif read_title.paddress contains '7915 Eastern'>
<cfset vesting_type = "Fee Simple">
<cfset grantor1 = "LHL Realty Company DC LLC, Successor by Merger to LHL Realty Company">
<cfset grantee1 = "WW-Silver Spring, LLC">
<cfset deed_type = "Warranty Deed">
<cfset tile_manner = "None Stated">
<cfset book = "24442">
<cfset page = "465.">
<cfset instrument_date_month = "06">
<cfset instrument_date_day = "11">
<cfset instrument_date_year = "2003">
<cfset recording_date_month = "07">
<cfset recording_date_day = "10">
<cfset recording_date_year = "2003">
<cfset vesting = "Yes">
<cfset consideration = "$5,000,000.00">
<cfset legal = "SITUATED IN MONTGOMERY COUNTY, MD: Condominium Unit No. ___ ('The Unit') together with the Common Elements appurtenant thereto, in the Aurora Condominium South, Montgomery County, Maryland, pursuant to the Declaration of Condominium recorded in Liber 31561 at folio 418 et seq., among the Land Records of Montgomery County, Maryland, and the Condominium Plat recorded at Plat No. 8990, as amended by that Corrective Amendment to Declaration for Aurora South Condominium recorded in Liber 31591 at folio 247.">
<cfset additional_exceptions = "1. Covenants, Conditions, Restrictions, Terms and Conditions as set forth in the Declaration of Condominium for the Aurora South Condominium and the By-Laws and the Condominium Plats attached thereto recorded 01/03/06 in Liber 31561 at folio 418, as amended in Liber 31591 at folio 247. Note: Policy, when issued, will contain an ALTA Form 4 Endorsement.
<BR><BR>
2. Covenants, Conditions, Restrictions, Terms and Conditions as set forth in the Declaration for Aurora Land Condominium and the By-Laws and the Condominium Plats attached thereto recorded December 21, 2005 in Liber 31489 at folio 196, as amended in Liber 31561 at folio 412.
<BR><BR>
3. Declaration of Covenants, Conditions, Easements and Restrictions for the Aurora Homeowners Association recorded December 21, 2005 in Liber 31489 at folio 226.
<BR><BR>
4. Easement Agreement recorded December 21, 2005 in Liber 31489 at folio 168.
<BR><BR>
5. Declaration of Deferred Water and Sewer Charges recorded December 21, 2005 in Liber 31489 at folio 184.
<br><br>
6. Projection Easement Agreement recorded December 22, 2005 in Liber 31494 at folio 290.
<BR><BR>
7. Moderately Priced Dwelling Units Declaration of Covenants recorded January 9, 2006 in Liber 31594 at folio 500. Note: This only affects MPDU Units.">
<cfelse>
<cfset vesting_type = "Fee Simple">
<cfset grantor1 = "WW-Silver Spring, LLC">
<cfset grantee1 = "Diamond Farms Associates, Inc.">
<cfset deed_type = "Warranty Deed">
<cfset tile_manner = "None Stated">
<cfset book = "31570">
<cfset page = "229.">
<cfset instrument_date_month = "12">
<cfset instrument_date_day = "29">
<cfset instrument_date_year = "2005">
<cfset recording_date_month = "01">
<cfset recording_date_day = "04">
<cfset recording_date_year = "2006">
<cfset vesting = "Yes">
<cfset consideration = "$2,100,000.00">
<cfset legal = "SITUATED IN MONTGOMERY COUNTY, MD: Condominium Unit No. ___ ('The Unit') together with the Common Elements appurtenant thereto, in the Aurora Condominium North, Montgomery County, Maryland, pursuant to the Declaration of Condominium recorded in Liber 32066 at folio 063 et seq., among the Land Records of Montgomery County, Maryland, and the Condominium Plat recorded at Plat No. 9044 et seq.">
<cfset additional_exceptions = "1. Covenants, Conditions, Restrictions, Terms and Conditions as set forth in the Declaration of Condominium for the Aurora North Condominium and the By-Laws and the Condominium Plats attached thereto recorded March 30, 2006 in Liber 32066 at folio 063. Note: Policy, when issued, will contain an ALTA Form 4 Endorsement.
<BR><BR>
2. Covenants, Conditions, Restrictions, Terms and Conditions as set forth in the Declaration for Aurora Land Condominium and the By-Laws and the Condominium Plats attached thereto recorded December 21, 2005 in Liber 31489 at folio 196, as amended in Liber 31561 at folio 412.
<BR><BR>
3. Declaration of Covenants, Conditions, Easements and Restrictions for the Aurora Homeowners Association recorded December 21, 2005 in Liber 31489 at folio 226.
<BR><BR>
4. Easement Agreement recorded December 21, 2005 in Liber 31489 at folio 168.
<BR><BR>
5. Declaration of Deferred Water and Sewer Charges recorded December 21, 2005 in Liber 31489 at folio 184.
<br><br>
6. Projection Easement Agreement recorded December 22, 2005 in Liber 31494 at folio 290.
<BR><BR>
7. Moderately Priced Dwelling Units Declaration of Covenants recorded January 9, 2006 in Liber 31594 at folio 500. Note: This only affects MPDU Units.">
</cfif>
</cfif>





<cfif check_if_prefill.company contains 'MICA -'>
<cfset vesting_type = "Fee Simple">
<cfset grantor1 = "Springwood Joint Venture">
<cfset grantee1 = "Springwood Blair Mill Associates, LLC">
<cfset deed_type = "Warranty Deed">
<cfset tile_manner = "">
<cfset book = "21483">
<cfset page = "706.">
<cfset instrument_date_month = "07">
<cfset instrument_date_day = "10">
<cfset instrument_date_year = "2002">
<cfset recording_date_month = "07">
<cfset recording_date_day = "24">
<cfset recording_date_year = "2002">
<cfset vesting = "">
<cfset consideration = "">
<cfset legal = "Condominium Unit No. ____ (the Unit) together with the appurtenant Limited Common Element Parking Space Number _____ and Common Elements appurtenant thereto, in the Mica Condominium as Silver Spring Metro, Montgomery County, Maryland, pursuant to the Declaration of Condominium recorded in Liber 32944 at folio 001 et seq., as amended by that certain Amendment to Declaration for Mica Condominium at Silver Spring Metro recorded in Liber 32994 at folio 535 among the Land Records of Montgomery County, Maryland, and the Condominium Plat recorded as Condominium Plat No. 92111 et seq., and recorded at Plat no. 9234, et seq. among the Land Records of Montgomery County, Maryland.">
<cfset additional_exceptions = "1. Covenants, Conditions, Restrictions, Terms and Conditions as set forth in the Declaration of Condominium for the Mica Condominium at Silver Spring Metro and the By-Laws and the Condominium Plats attached thereto recorded ______________in Liber _________ at folio _____. Note: Policy, when issued, will contain an ALTA Form 4 Endorsement. <br><br>
2. Swimming Pool Access Easement and Agreement regarding Operating Expenses recorded in Liber 7474 at folio 693">
</cfif>



<!--- <cfif check_if_prefill.company contains 'ROA Hutton'> --->


<cfif check_if_prefill.company contains 'ROA Hutton'>
<cfset effective_month = "07">
<cfset effective_day = "14">
<cfset effective_year = "2008">


<cfset vesting_type = "Fee Simple">
<cfset grantor1 = "Geddes Lake Cooperative Home, Inc a Non-Profit Michigan Corporation">
<cfset grantee1 = "GEDDES LAKE CONDOMINIUM ASSOCIATION, INC.">
<cfset deed_type = "Warranty Deed">
<cfset tile_manner = "">
<cfset book = "4690">
<cfset page = "720.">
<cfset instrument_date_month = "07">
<cfset instrument_date_day = "13">
<cfset instrument_date_year = "2008">
<cfset recording_date_month = "07">
<cfset recording_date_day = "14">
<cfset recording_date_year = "2008">
<cfset vesting = "">
<cfset consideration = "">
<cfset unit_no = ReplaceNoCase(Listgetat(read_title.paddress, 2, ", "), "##", "", "ALL")>
<cfset legal = "The Condominium Unit (the 'Unit') known as Unit ## #Evaluate('unit_no')# (also known as #read_title.paddress#, Ann Arbor, MI, 48105) at Geddes Lake Condominiums (the “Condominium”) in the Master Deed establishing a plan for Condominium Ownership of said premises under of the State of Michigan (the 'Michigan Condominium Act') dated July 14, 2008 recorded in the Office of the Clerk/Register of Washtenaw County  (the “Register's Office') as File No. L-4690 P-720 and as Condominium Subdivision Plan No: 568.  The premises within which the Unit is located (the “Property”) is more particularly described in Schedule A attached hereto and made a part hereof.">

<cfset additional_exceptions = "SUBJECT TO THE DECLARATIONS, COVENANTS RESTRICTIONS AND TERMS AS DESCRIBED IN THE MASTER DEED RECORDED JULY 14, 2008 IN LIBER 4690 AT PAGE 720">
</cfif>


<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>

<CENTER>

<table width=798 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=798 align=center valign=top>
	<CENTER>
<table width=798 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


	<tr>
		<td width=798 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>
	<CFINCLUDE TEMPLATE="./includes/title_top_navt.cfm">
<CENTER>
<table width=798 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>


<CFOUTPUT>
	<tr>
		<td width=798 align=center valign=top bgcolor=d3d3d3>
			<font size=2 color=black face=arial>Enter the information for the Title Insurance of </font><font size=2 color=green face=arial><b>#url.rec_id#</b></font> <font size=2 color=black face=arial>order in the form below.
		</td>
	</tr>
</CFOUTPUT>

</table>

		</td>
	</tr>

	<tr>
		<td width=798 align=center valign=top bgcolor=e6e6e6>

<center>
<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


	<CFFORM METHOD=POST ACTION="https://#CGI.SERVER_NAME#/admin_area/abstractor_admin_add_deed_submit.cfm?uid=#URL.uid#&al=#URL.al#&&rec_id=#url.rec_id#" name="frm" ENABLECAB="Yes" onSubmit="return put();">


	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="../images/clear.gif" height=10 width=85>


		</td>
	</tr>

	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Effective</B> Date:


		</td>
	</tr>

	<tr>
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Effective Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="month"
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

<option value="">Month</option>
<option value="01" <cfif effective_month eq '01'>SELECTED</cfif>>January</option>
		<option value="02" <cfif effective_month eq '02'>SELECTED</cfif>>February</option>
		<option value="03" <cfif effective_month eq '03'>SELECTED</cfif>>March</option>
		<option value="04" <cfif effective_month eq '04'>SELECTED</cfif>>April</option>
		<option value="05" <cfif effective_month eq '05'>SELECTED</cfif>>May</option>
		<option value="06" <cfif effective_month eq '06'>SELECTED</cfif>>June</option>
		<option value="07" <cfif effective_month eq '07'>SELECTED</cfif>>July</option>
		<option value="08" <cfif effective_month eq '08'>SELECTED</cfif>>August</option>
		<option value="09" <cfif effective_month eq '09'>SELECTED</cfif>>September</option>
		<option value="10" <cfif effective_month eq '10'>SELECTED</cfif>>October</option>
		<option value="11" <cfif effective_month eq '11'>SELECTED</cfif>>November</option>
		<option value="12" <cfif effective_month eq '12'>SELECTED</cfif>>December</option>


</select>

<select name="day"
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

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif effective_day eq '01'>SELECTED</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif effective_day eq '02'>SELECTED</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif effective_day eq '03'>SELECTED</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif effective_day eq '04'>SELECTED</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif effective_day eq '05'>SELECTED</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif effective_day eq '06'>SELECTED</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif effective_day eq '07'>SELECTED</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif effective_day eq '08'>SELECTED</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif effective_day eq '09'>SELECTED</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif effective_day eq '10'>SELECTED</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif effective_day eq '11'>SELECTED</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif effective_day eq '12'>SELECTED</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif effective_day eq '13'>SELECTED</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif effective_day eq '14'>SELECTED</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif effective_day eq '15'>SELECTED</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif effective_day eq '16'>SELECTED</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif effective_day eq '17'>SELECTED</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif effective_day eq '18'>SELECTED</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif effective_day eq '19'>SELECTED</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif effective_day eq '20'>SELECTED</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif effective_day eq '21'>SELECTED</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif effective_day eq '22'>SELECTED</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif effective_day eq '23'>SELECTED</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif effective_day eq '24'>SELECTED</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif effective_day eq '25'>SELECTED</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif effective_day eq '26'>SELECTED</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif effective_day eq '27'>SELECTED</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif effective_day eq '28'>SELECTED</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif effective_day eq '29'>SELECTED</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif effective_day eq '30'>SELECTED</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif effective_day eq '31'>SELECTED</cfif>>31</OPTION>
</select>
<select name="year"
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

<option value="">Year</option>

<option value="2020" <cfif effective_year eq "2020">SELECTED</cfif>>2020</option>
<option value="2019" <cfif effective_year eq "2019">SELECTED</cfif>>2019</option>
<option value="2018" <cfif effective_year eq "2018">SELECTED</cfif>>2018</option>
<option value="2017" <cfif effective_year eq "2017">SELECTED</cfif>>2017</option>
<option value="2016" <cfif effective_year eq "2016">SELECTED</cfif>>2016</option>
		<option value="2015" <cfif effective_year eq '2015'>SELECTED</cfif>>2015</option>
		<option value="2014" <cfif effective_year eq '2014'>SELECTED</cfif>>2014</option>
		<option value="2013" <cfif effective_year eq '2013'>SELECTED</cfif>>2013</option>
		<option value="2012" <cfif effective_year eq '2012'>SELECTED</cfif>>2012</option>
		<option value="2011" <cfif effective_year eq '2011'>SELECTED</cfif>>2011</option>
		<option value="2010" <cfif effective_year eq '2010'>SELECTED</cfif>>2010</option>
		<option value="2009" <cfif effective_year eq '2009'>SELECTED</cfif>>2009</option>
		<option value="2008" <cfif effective_year eq '2008'>SELECTED</cfif>>2008</option>
		<option value="2007" <cfif effective_year eq '2007'>SELECTED</cfif>>2007</option>
		<option value="2006" <cfif effective_year eq '2006'>SELECTED</cfif>>2006</option>
		<option value="2005" <cfif effective_year eq '2005'>SELECTED</cfif>>2005</option>
	   		<option value="2004" <cfif effective_year eq '2004'>SELECTED</cfif>>2004</option>
			<option value="2003" <cfif effective_year eq '2003'>SELECTED</cfif>>2003</option>

		</select> </nobr>



		</td>
	</tr>

	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Type of Vesting:</B>


		</td>
	</tr>

	<tr>
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Type of Vesting


		</td>

	<td width=237 align=left valign=top bgcolor=e6e6e6>

	<SELECT NAME="select1"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Fee Simple" <cfif vesting_type eq 'Fee Simple'>SELECTED</cfif>>Fee Simple</OPTION>
			<OPTION VALUE="Life Estate" <cfif vesting_type eq 'Life Estate'>SELECTED</cfif>>Life Estate</OPTION>
			<OPTION VALUE="Leasehold" <cfif vesting_type eq 'Leasehold'>SELECTED</cfif>>Leasehold</OPTION>
			<OPTION VALUE="Deed type is land contract" <cfif vesting_type eq 'Deed type is land contract'>SELECTED</cfif>>Deed type is land Contract</OPTION>
			<OPTION VALUE="Property has oil or gas lease recorded" <cfif vesting_type eq 'Property has oil or gas lease recorded'>SELECTED</cfif>>Property has oil or gas lease recorded</OPTION>
			<OPTION VALUE="Property is tribal property" <cfif vesting_type eq 'Property is tribal property'>SELECTED</cfif>>Property is tribal property</OPTION>
			<OPTION VALUE="Property grantee is a trust" <cfif vesting_type eq 'Property grantee is a trust'>SELECTED</cfif>>Property grantee is a trust</OPTION>
			<OPTION VALUE="Property is leasehold" <cfif vesting_type eq 'Property is leasehold'>SELECTED</cfif>>Property is leasehold</OPTION>

			</SELECT>


		</td>
	</tr>
	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Deed</B> Information :


		</td>
	</tr>

	<tr>
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantor 1


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT Required="Yes" Message="You must enter a Grantor's NAME" type=text name="grantor1"  size=40 value="#grantor1#" maxlength=600
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantor 2


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="grantor2" size=40 maxlength=600
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Grantee 1


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT Required="Yes" Message="You must enter a Grantee 1 name" type=text name="grantee1"  size=40  value="#grantee1#" maxlength=600
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantee 2


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="Grantee2"  size=40 maxlength=600
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Type of Deed


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="deedtype"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Warranty Deed" <cfif deed_type eq 'Warranty Deed'>SELECTED</cfif>>Warranty Deed</OPTION>
			<OPTION VALUE="Quit Claim Deed" <cfif deed_type eq 'Quit Claim Deed'>SELECTED</cfif>>Quit Claim Deed</OPTION>
			<OPTION VALUE="Assignment of Lease" <cfif deed_type eq 'Assignment of Lease'>SELECTED</cfif>>Assignment of Lease</OPTION>
			<OPTION VALUE="Abridgement of Judgment" <cfif deed_type eq 'Abridgement of Judgment'>SELECTED</cfif>>Abridgement of Judgment</OPTION>
			<OPTION VALUE="Administrator's Deed" <cfif deed_type eq "Administrator's Deed">SELECTED</cfif>>Administrator's Deed</OPTION>
			<OPTION VALUE="Community Property with Right of Supervisorship" <cfif deed_type eq 'Community Property with Right of Supervisorship'>SELECTED</cfif>>Community Property with Right of Supervisorship</OPTION>
			<OPTION VALUE="Condominium Deed" <cfif deed_type eq 'Condominium Deed'>SELECTED</cfif>>Condominium Deed</OPTION>
			<OPTION VALUE="Contract for Deed" <cfif deed_type eq 'Contract for Deed'>SELECTED</cfif>>Contract for Deed</OPTION>
			<OPTION VALUE="Corporate Deed" <cfif deed_type eq 'Corporate Deed'>SELECTED</cfif>>Corporate Deed</OPTION>
			<OPTION VALUE="Corporate Warranty Deed" <cfif deed_type eq 'Corporate Warranty Deed'>SELECTED</cfif>>Corporate Warranty Deed</OPTION>
			<OPTION VALUE="Deed in Trust" <cfif deed_type eq 'Deed in Trust'>SELECTED</cfif>>Deed in Trust</OPTION>
			<OPTION VALUE="Divorce Decree" <cfif deed_type eq 'Divorce Decree'>SELECTED</cfif>>Divorce Decree</OPTION>
			<OPTION VALUE="Executor's/Executrix's Deed" <cfif deed_type eq "Executor's/Executrix's Deed">SELECTED</cfif>>Executor's/Executrix's Deed</OPTION>
			<OPTION VALUE="Land Contract" <cfif deed_type eq 'Land Contract'>SELECTED</cfif>>Land Contract</OPTION>
			<OPTION VALUE="Last Will and Testament" <cfif deed_type eq 'Last Will and Testament'>SELECTED</cfif>>Last Will and Testament</OPTION>
			<OPTION VALUE="Limited Warranty Deed" <cfif deed_type eq 'Limited Warranty Deed'>SELECTED</cfif>>Limited Warranty Deed</OPTION>
			<OPTION VALUE="Personal Representative's Deed" <cfif deed_type eq "Personal Representative's Deed">SELECTED</cfif>>Personal Representative's Deed</OPTION>
			<OPTION VALUE="Probate Action" <cfif deed_type eq 'Probate Action'>SELECTED</cfif>>Probate Action</OPTION>
			<OPTION VALUE="Sheriff's Deed" <cfif deed_type eq "Sheriff's Deed">SELECTED</cfif>>Sheriff's Deed</OPTION>
			<OPTION VALUE="Special Warranty Deed" <cfif deed_type eq 'Special Warranty Deed'>SELECTED</cfif>>Special Warranty Deed</OPTION>
			<OPTION VALUE="Tax Sale Deed" <cfif deed_type eq 'Tax Sale Deed'>SELECTED</cfif>>Tax Sale Deed</OPTION>
			<OPTION VALUE="Termination of Decedents Poperty Interes" <cfif deed_type eq 'Termination of Decedents Poperty Interes'>SELECTED</cfif>>Termination of Decedents Poperty Interes</OPTION>
			<OPTION VALUE="Trustee's Deed" <cfif deed_type eq "Trustee's Deed">SELECTED</cfif>>Trustee's Deed</OPTION>
			<OPTION VALUE="Deed in Lieu of Foreclosure">Deed in Lieu of Foreclosure</OPTION>
            </SELECT>


		</td>
	</tr>

	<tr>
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Manner of Title


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
						<SELECT NAME="mannertitle"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Husband and Wife, Joint Tenants with Right of Survivorship" <cfif tile_manner eq "Husband and Wife, Joint Tenants with Right of Survivorship">SELECTED</cfif>>Husband and Wife, Joint Tenants with Right of Survivorship</OPTION>
			<OPTION VALUE="Husband and Wife" <cfif tile_manner eq "Husband and Wife">SELECTED</cfif>>Husband and Wife</OPTION>
			<OPTION VALUE="Joint Tenants" <cfif tile_manner eq "Joint Tenants">SELECTED</cfif>>Joint Tenants</OPTION>
			<OPTION VALUE="Survivor of either" <cfif tile_manner eq "Survivor of either">SELECTED</cfif>>Survivor of either</OPTION>
			<OPTION VALUE="A Single Person" <cfif tile_manner eq "A Single Person">SELECTED</cfif>>A Single Person</OPTION>
			<OPTION VALUE="Divorced, Not Since Remarried" <cfif tile_manner eq "Divorced, Not Since Remarried">SELECTED</cfif>>Divorced, Not Since Remarried</OPTION>
			<OPTION VALUE="Tenants by the Entirety" <cfif tile_manner eq "Tenants by the Entirety">SELECTED</cfif>>Tenants by the Entirety</OPTION>
			<OPTION VALUE="Sole Tenant" <cfif tile_manner eq "Sole Tenant">SELECTED</cfif>>Sole Tenant</OPTION>
			<OPTION VALUE="Of legal age" <cfif tile_manner eq "Of legal age">SELECTED</cfif>>Of legal age</OPTION>
			<OPTION VALUE="A Widow" <cfif tile_manner eq "A Widow">SELECTED</cfif>>A Widow</OPTION>
			<OPTION VALUE="A Single Man" <cfif tile_manner eq "A Single Man">SELECTED</cfif>>A Single Man</OPTION>
			<OPTION VALUE="A Single Woman" <cfif tile_manner eq "A Single Woman">SELECTED</cfif>>A Single Woman</OPTION>
			<OPTION VALUE="A Married Man" <cfif tile_manner eq "A Married Man">SELECTED</cfif>>A Married Man</OPTION>
		  <OPTION VALUE="An Unmarried Man" <cfif tile_manner eq "An Unmarried Man">SELECTED</cfif>>An Unmarried Man</OPTION>
			<OPTION VALUE="A Married Woman" <cfif tile_manner eq "A Married Woman">SELECTED</cfif>>A Married Woman</OPTION>
			<OPTION VALUE="An Unmarried Woman" <cfif tile_manner eq "An Unmarried Woman">SELECTED</cfif>>An Unmarried Woman</OPTION>
			<OPTION VALUE="A Married Person" <cfif tile_manner eq "A Married Person">SELECTED</cfif>>A Married Person</OPTION>
			<OPTION VALUE="An Unmarried Person" <cfif tile_manner eq "An Unmarried Person">SELECTED</cfif>>An Unmarried Person</OPTION>
			<OPTION VALUE="No Tenancy Stated" <cfif tile_manner eq "No Tenancy Stated">SELECTED</cfif>>No Tenancy Stated</OPTION>
			<OPTION VALUE="Surviving Spouse" <cfif tile_manner eq "Surviving Spouse">SELECTED</cfif>>Surviving Spouse</OPTION>
			<OPTION VALUE="Married to each other" <cfif tile_manner eq "Married to each other">SELECTED</cfif>>Married to each other</OPTION>
			<OPTION VALUE="Tenants in Common" <cfif tile_manner eq "Tenants in Common">SELECTED</cfif>>Tenants in Common</OPTION>
			<OPTION VALUE="Over the age of eighteen" <cfif tile_manner eq "Over the age of eighteen">SELECTED</cfif>>Over the age of eighteen</OPTION>
			<OPTION VALUE="An adult" <cfif tile_manner eq "An adult">SELECTED</cfif>>An adult</OPTION>
			<OPTION VALUE="A Spinster" <cfif tile_manner eq "A Spinster">SELECTED</cfif>>A Spinster</OPTION>
			<OPTION VALUE="As Trustee" <cfif tile_manner eq "As Trustee">SELECTED</cfif>>As Trustee</OPTION>
			<OPTION VALUE="W/R/S" <cfif tile_manner eq "W/R/S">SELECTED</cfif>>W/R/S</OPTION>
			<OPTION VALUE="A/M/M/S/E" <cfif tile_manner eq "A/M/M/S/E">SELECTED</cfif>>A/M/M/S/E</OPTION>
			<OPTION VALUE="A/S/A/S/P" <cfif tile_manner eq "A/S/A/S/P">SELECTED</cfif>>A/S/A/S/P</OPTION>
			<OPTION VALUE="A/S/M" <cfif tile_manner eq "A/S/M">SELECTED</cfif>>A/S/M</OPTION>
			<OPTION VALUE="A/T/B/T/E" <cfif tile_manner eq "A/T/B/T/E">SELECTED</cfif>>A/T/B/T/E</OPTION>
			<OPTION VALUE="H/H/A/F" <cfif tile_manner eq "H/H/A/F">SELECTED</cfif>>H/H/A/F</OPTION>
			<OPTION VALUE="J/T/F/L/W" <cfif tile_manner eq "J/T/F/L/W">SELECTED</cfif>>J/T/F/L/W</OPTION>
			<OPTION VALUE="J/T/W/R/O/S" <cfif tile_manner eq "J/T/W/R/O/S">SELECTED</cfif>>J/T/W/R/O/S</OPTION>
			<OPTION VALUE="M/W/A/H/S/A/S/P" <cfif tile_manner eq "M/W/A/H/S/A/S/P">SELECTED</cfif>>M/W/A/H/S/A/S/P</OPTION>
			<OPTION VALUE="N/A/T/I/C" <cfif tile_manner eq "N/A/T/I/C">SELECTED</cfif>>N/A/T/I/C</OPTION>
			<OPTION VALUE="S/S/E/E" <cfif tile_manner eq "S/S/E/E">SELECTED</cfif>>S/S/E/E</OPTION>
			<OPTION VALUE="T/E" <cfif tile_manner eq "T/E">SELECTED</cfif>>T/E</OPTION>
			<OPTION VALUE="H/W CPROS" <cfif tile_manner eq "H/W CPROS">SELECTED</cfif>>H/W CPROS</OPTION>
			<OPTION VALUE="None Stated" <cfif tile_manner eq "None Stated">SELECTED</cfif>>None Stated</OPTION>

			</SELECT><br><CFINPUT type=text name="mannertitle2" size=40 maxlength=150
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Document Number

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="docnum" value=""  size=25 maxlength=30
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="book" value="#book#"  size=25 maxlength=30
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="page" value="#page#"  size=25 maxlength=30
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Instrument Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="inst_mon"
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

<option value="">Month</option>


	   	<option value="01" <cfif instrument_date_month eq "01">SELECTED</cfif>>January</option>
		<option value="02" <cfif instrument_date_month eq "02">SELECTED</cfif>>February</option>
		<option value="03" <cfif instrument_date_month eq "03">SELECTED</cfif>>March</option>
		<option value="04" <cfif instrument_date_month eq "04">SELECTED</cfif>>April</option>
		<option value="05" <cfif instrument_date_month eq "05">SELECTED</cfif>>May</option>
		<option value="06" <cfif instrument_date_month eq "06">SELECTED</cfif>>June</option>
		<option value="07" <cfif instrument_date_month eq "07">SELECTED</cfif>>July</option>
		<option value="08" <cfif instrument_date_month eq "08">SELECTED</cfif>>August</option>
		<option value="09" <cfif instrument_date_month eq "09">SELECTED</cfif>>September</option>
		<option value="10" <cfif instrument_date_month eq "10">SELECTED</cfif>>October</option>
		<option value="11" <cfif instrument_date_month eq "11">SELECTED</cfif>>November</option>
		<option value="12" <cfif instrument_date_month eq "12">SELECTED</cfif>>December</option>



</select>

<select name="inst_day"
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

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif instrument_date_day eq "01">SELECTED</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif instrument_date_day eq "02">SELECTED</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif instrument_date_day eq "03">SELECTED</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif instrument_date_day eq "04">SELECTED</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif instrument_date_day eq "05">SELECTED</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif instrument_date_day eq "06">SELECTED</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif instrument_date_day eq "07">SELECTED</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif instrument_date_day eq "08">SELECTED</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif instrument_date_day eq "09">SELECTED</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif instrument_date_day eq "10">SELECTED</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif instrument_date_day eq "11">SELECTED</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif instrument_date_day eq "12">SELECTED</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif instrument_date_day eq "13">SELECTED</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif instrument_date_day eq "14">SELECTED</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif instrument_date_day eq "15">SELECTED</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif instrument_date_day eq "16">SELECTED</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif instrument_date_day eq "17">SELECTED</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif instrument_date_day eq "18">SELECTED</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif instrument_date_day eq "19">SELECTED</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif instrument_date_day eq "20">SELECTED</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif instrument_date_day eq "21">SELECTED</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif instrument_date_day eq "22">SELECTED</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif instrument_date_day eq "23">SELECTED</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif instrument_date_day eq "24">SELECTED</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif instrument_date_day eq "25">SELECTED</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif instrument_date_day eq "26">SELECTED</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif instrument_date_day eq "27">SELECTED</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif instrument_date_day eq "28">SELECTED</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif instrument_date_day eq "29">SELECTED</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif instrument_date_day eq "30">SELECTED</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif instrument_date_day eq "31">SELECTED</cfif>>31</OPTION>
</select>
<select name="inst_year"
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

<option value="">Year</option>
<option value="2020" <cfif instrument_date_year eq "2020">SELECTED</cfif>>2020</option>
<option value="2019" <cfif instrument_date_year eq "2019">SELECTED</cfif>>2019</option>
<option value="2018" <cfif instrument_date_year eq "2018">SELECTED</cfif>>2018</option>
<option value="2017" <cfif instrument_date_year eq "2017">SELECTED</cfif>>2017</option>
<option value="2016" <cfif instrument_date_year eq "2016">SELECTED</cfif>>2016</option>
<option value="2015" <cfif instrument_date_year eq "2015">SELECTED</cfif>>2015</option>
<option value="2014" <cfif instrument_date_year eq "2014">SELECTED</cfif>>2014</option>
<option value="2013" <cfif instrument_date_year eq "2013">SELECTED</cfif>>2013</option>
<option value="2012" <cfif instrument_date_year eq "2012">SELECTED</cfif>>2012</option>
<option value="2011" <cfif instrument_date_year eq "2011">SELECTED</cfif>>2011</option>
<option value="2010" <cfif instrument_date_year eq "2010">SELECTED</cfif>>2010</option>
<option value="2009" <cfif instrument_date_year eq "2009">SELECTED</cfif>>2009</option>
<option value="2008" <cfif instrument_date_year eq "2008">SELECTED</cfif>>2008</option>
<option value="2007" <cfif instrument_date_year eq "2007">SELECTED</cfif>>2007</option>
<option value="2006" <cfif instrument_date_year eq "2006">SELECTED</cfif>>2006</option>
<option value="2005" <cfif instrument_date_year eq "2005">SELECTED</cfif>>2005</option>
		<option value="2004" <cfif instrument_date_year eq "2004">SELECTED</cfif>>2004</option>
	   		<option value="2003" <cfif instrument_date_year eq "2003">SELECTED</cfif>>2003</option>
		<option value="2002" <cfif instrument_date_year eq "2002">SELECTED</cfif>>2002</option>
		<option value="2001" <cfif instrument_date_year eq "2001">SELECTED</cfif>>2001</option>
		<option value="2000" <cfif instrument_date_year eq "2000">SELECTED</cfif>>2000</option>
		<option value="1999" <cfif instrument_date_year eq "1999">SELECTED</cfif>>1999</option>
		<option value="1998" <cfif instrument_date_year eq "1998">SELECTED</cfif>>1998</option>
		<option value="1997" <cfif instrument_date_year eq "1997">SELECTED</cfif>>1997</option>
		<option value="1996" <cfif instrument_date_year eq "1996">SELECTED</cfif>>1996</option>
		<option value="1995" <cfif instrument_date_year eq "1995">SELECTED</cfif>>1995</option>
		<option value="1994" <cfif instrument_date_year eq "1994">SELECTED</cfif>>1994</option>
		<option value="1993" <cfif instrument_date_year eq "1993">SELECTED</cfif>>1993</option>
		<option value="1992" <cfif instrument_date_year eq "1992">SELECTED</cfif>>1992</option>
		<option value="1991" <cfif instrument_date_year eq "1991">SELECTED</cfif>>1991</option>
		<option value="1990" <cfif instrument_date_year eq "1990">SELECTED</cfif>>1990</option>
		<option value="1989" <cfif instrument_date_year eq "1989">SELECTED</cfif>>1989</option>
		<option value="1988" <cfif instrument_date_year eq "1988">SELECTED</cfif>>1988</option>
		<option value="1987" <cfif instrument_date_year eq "1987">SELECTED</cfif>>1987</option>
		<option value="1986" <cfif instrument_date_year eq "1986">SELECTED</cfif>>1986</option>
		<option value="1985" <cfif instrument_date_year eq "1985">SELECTED</cfif>>1985</option>
		<option value="1984" <cfif instrument_date_year eq "1984">SELECTED</cfif>>1984</option>
		<option value="1983" <cfif instrument_date_year eq "1983">SELECTED</cfif>>1983</option>
		<option value="1982" <cfif instrument_date_year eq "1982">SELECTED</cfif>>1982</option>
		<option value="1981" <cfif instrument_date_year eq "1981">SELECTED</cfif>>1981</option>
		<option value="1980" <cfif instrument_date_year eq "1980">SELECTED</cfif>>1980</option>
		<option value="1979" <cfif instrument_date_year eq "1979">SELECTED</cfif>>1979</option>
		<option value="1978" <cfif instrument_date_year eq "1978">SELECTED</cfif>>1978</option>
		<option value="1977" <cfif instrument_date_year eq "1977">SELECTED</cfif>>1977</option>
		<option value="1976" <cfif instrument_date_year eq "1976">SELECTED</cfif>>1976</option>
		<option value="1975" <cfif instrument_date_year eq "1975">SELECTED</cfif>>1975</option>
		<option value="1974" <cfif instrument_date_year eq "1974">SELECTED</cfif>>1974</option>
		<option value="1973" <cfif instrument_date_year eq "1973">SELECTED</cfif>>1973</option>
		<option value="1972" <cfif instrument_date_year eq "1972">SELECTED</cfif>>1972</option>
		<option value="1971" <cfif instrument_date_year eq "1971">SELECTED</cfif>>1971</option>
		<option value="1970" <cfif instrument_date_year eq "1970">SELECTED</cfif>>1970</option>
		<option value="1969" <cfif instrument_date_year eq "1969">SELECTED</cfif>>1969</option>
		<option value="1968" <cfif instrument_date_year eq "1968">SELECTED</cfif>>1968</option>
		<option value="1967" <cfif instrument_date_year eq "1967">SELECTED</cfif>>1967</option>
		<option value="1966" <cfif instrument_date_year eq "1966">SELECTED</cfif>>1966</option>
		<option value="1965" <cfif instrument_date_year eq "1965">SELECTED</cfif>>1965</option>
		<option value="1964" <cfif instrument_date_year eq "1964">SELECTED</cfif>>1964</option>
		<option value="1963" <cfif instrument_date_year eq "1963">SELECTED</cfif>>1963</option>
		<option value="1962" <cfif instrument_date_year eq "1962">SELECTED</cfif>>1962</option>
		<option value="1961" <cfif instrument_date_year eq "1961">SELECTED</cfif>>1961</option>
		<option value="1960" <cfif instrument_date_year eq "1960">SELECTED</cfif>>1960</option>
		<option value="1959" <cfif instrument_date_year eq "1959">SELECTED</cfif>>1959</option>
		<option value="1958" <cfif instrument_date_year eq "1958">SELECTED</cfif>>1958</option>
		<option value="1957" <cfif instrument_date_year eq "1957">SELECTED</cfif>>1957</option>
		<option value="1956" <cfif instrument_date_year eq "1956">SELECTED</cfif>>1956</option>
		<option value="1955" <cfif instrument_date_year eq "1955">SELECTED</cfif>>1955</option>
		<option value="1954" <cfif instrument_date_year eq "1954">SELECTED</cfif>>1954</option>
		<option value="1953" <cfif instrument_date_year eq "1953">SELECTED</cfif>>1953</option>
		<option value="1952" <cfif instrument_date_year eq "1952">SELECTED</cfif>>1952</option>
		<option value="1951" <cfif instrument_date_year eq "1951">SELECTED</cfif>>1951</option>
		<option value="1950" <cfif instrument_date_year eq "1950">SELECTED</cfif>>1950</option>
		<option value="1949" <cfif instrument_date_year eq "1949">SELECTED</cfif>>1949</option>
		<option value="1948" <cfif instrument_date_year eq "1948">SELECTED</cfif>>1948</option>
		<option value="1947" <cfif instrument_date_year eq "1947">SELECTED</cfif>>1947</option>
		<option value="1946" <cfif instrument_date_year eq "1946">SELECTED</cfif>>1946</option>
		<option value="1945" <cfif instrument_date_year eq "1945">SELECTED</cfif>>1945</option>
		<option value="1944" <cfif instrument_date_year eq "1944">SELECTED</cfif>>1944</option>
		<option value="1943" <cfif instrument_date_year eq "1943">SELECTED</cfif>>1943</option>
		<option value="1942" <cfif instrument_date_year eq "1942">SELECTED</cfif>>1942</option>
		<option value="1941" <cfif instrument_date_year eq "1941">SELECTED</cfif>>1941</option>
		<option value="1940" <cfif instrument_date_year eq "1940">SELECTED</cfif>>1940</option>
		<option value="1939" <cfif instrument_date_year eq "1939">SELECTED</cfif>>1939</option>
		<option value="1938" <cfif instrument_date_year eq "1938">SELECTED</cfif>>1938</option>
		<option value="1937" <cfif instrument_date_year eq "1937">SELECTED</cfif>>1937</option>
		<option value="1936" <cfif instrument_date_year eq "1936">SELECTED</cfif>>1936</option>
		<option value="1935" <cfif instrument_date_year eq "1935">SELECTED</cfif>>1935</option>
		<option value="1934" <cfif instrument_date_year eq "1934">SELECTED</cfif>>1934</option>
		<option value="1933" <cfif instrument_date_year eq "1933">SELECTED</cfif>>1933</option>
		<option value="1932" <cfif instrument_date_year eq "1932">SELECTED</cfif>>1932</option>
		<option value="1931" <cfif instrument_date_year eq "1931">SELECTED</cfif>>1931</option>
		<option value="1930" <cfif instrument_date_year eq "1930">SELECTED</cfif>>1930</option>
		<option value="1929" <cfif instrument_date_year eq "1929">SELECTED</cfif>>1929</option>
		<option value="1928" <cfif instrument_date_year eq "1928">SELECTED</cfif>>1928</option>
		<option value="1927" <cfif instrument_date_year eq "1927">SELECTED</cfif>>1927</option>
		<option value="1926" <cfif instrument_date_year eq "1926">SELECTED</cfif>>1926</option>
		<option value="1925" <cfif instrument_date_year eq "1925">SELECTED</cfif>>1925</option>
		<option value="1924" <cfif instrument_date_year eq "1924">SELECTED</cfif>>1924</option>
		<option value="1923" <cfif instrument_date_year eq "1923">SELECTED</cfif>>1923</option>
		<option value="1922" <cfif instrument_date_year eq "1922">SELECTED</cfif>>1922</option>
		<option value="1921" <cfif instrument_date_year eq "1921">SELECTED</cfif>>1921</option>
		<option value="1920" <cfif instrument_date_year eq "1920">SELECTED</cfif>>1920</option>
		<option value="1919" <cfif instrument_date_year eq "1919">SELECTED</cfif>>1919</option>
		<option value="1918" <cfif instrument_date_year eq "1918">SELECTED</cfif>>1918</option>
		<option value="1917" <cfif instrument_date_year eq "1917">SELECTED</cfif>>1917</option>
		<option value="1916" <cfif instrument_date_year eq "1916">SELECTED</cfif>>1916</option>
		<option value="1915" <cfif instrument_date_year eq "1915">SELECTED</cfif>>1915</option>
		</select> </nobr>



		</td>
	</tr>
		<tr>
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mon"
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

<option value="">Month</option>


	   	<option value="01" <cfif recording_date_month eq "01">SELECTED</cfif>>January</option>
		<option value="02" <cfif recording_date_month eq "02">SELECTED</cfif>>February</option>
		<option value="03" <cfif recording_date_month eq "03">SELECTED</cfif>>March</option>
		<option value="04" <cfif recording_date_month eq "04">SELECTED</cfif>>April</option>
		<option value="05" <cfif recording_date_month eq "05">SELECTED</cfif>>May</option>
		<option value="06" <cfif recording_date_month eq "06">SELECTED</cfif>>June</option>
		<option value="07" <cfif recording_date_month eq "07">SELECTED</cfif>>July</option>
		<option value="08" <cfif recording_date_month eq "08">SELECTED</cfif>>August</option>
		<option value="09" <cfif recording_date_month eq "09">SELECTED</cfif>>September</option>
		<option value="10" <cfif recording_date_month eq "10">SELECTED</cfif>>October</option>
		<option value="11" <cfif recording_date_month eq "11">SELECTED</cfif>>November</option>
		<option value="12" <cfif recording_date_month eq "12">SELECTED</cfif>>December</option>


</select>

<select name="rec_day"
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

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif recording_date_day eq "01">SELECTED</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif recording_date_day eq "02">SELECTED</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif recording_date_day eq "03">SELECTED</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif recording_date_day eq "04">SELECTED</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif recording_date_day eq "05">SELECTED</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif recording_date_day eq "06">SELECTED</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif recording_date_day eq "07">SELECTED</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif recording_date_day eq "08">SELECTED</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif recording_date_day eq "09">SELECTED</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif recording_date_day eq "10">SELECTED</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif recording_date_day eq "11">SELECTED</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif recording_date_day eq "12">SELECTED</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif recording_date_day eq "13">SELECTED</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif recording_date_day eq "14">SELECTED</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif recording_date_day eq "15">SELECTED</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif recording_date_day eq "16">SELECTED</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif recording_date_day eq "17">SELECTED</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif recording_date_day eq "18">SELECTED</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif recording_date_day eq "19">SELECTED</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif recording_date_day eq "20">SELECTED</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif recording_date_day eq "21">SELECTED</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif recording_date_day eq "22">SELECTED</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif recording_date_day eq "23">SELECTED</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif recording_date_day eq "24">SELECTED</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif recording_date_day eq "25">SELECTED</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif recording_date_day eq "26">SELECTED</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif recording_date_day eq "27">SELECTED</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif recording_date_day eq "28">SELECTED</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif recording_date_day eq "29">SELECTED</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif recording_date_day eq "30">SELECTED</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif recording_date_day eq "31">SELECTED</cfif>>31</OPTION>
</select>
<select name="rec_year"
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

<option value="">Year</option>
<option value="2020" <cfif recording_date_year eq "2020">SELECTED</cfif>>2020</option>
<option value="2019" <cfif recording_date_year eq "2019">SELECTED</cfif>>2019</option>
<option value="2018" <cfif recording_date_year eq "2018">SELECTED</cfif>>2018</option>
<option value="2017" <cfif recording_date_year eq "2017">SELECTED</cfif>>2017</option>
<option value="2016" <cfif recording_date_year eq "2016">SELECTED</cfif>>2016</option>
<option value="2015" <cfif recording_date_year eq "2015">SELECTED</cfif>>2015</option>
<option value="2014" <cfif recording_date_year eq "2014">SELECTED</cfif>>2014</option>
<option value="2013" <cfif recording_date_year eq "2013">SELECTED</cfif>>2013</option>
<option value="2012" <cfif recording_date_year eq "2012">SELECTED</cfif>>2012</option>
<option value="2011" <cfif recording_date_year eq "2011">SELECTED</cfif>>2011</option>
<option value="2010" <cfif recording_date_year eq "2010">SELECTED</cfif>>2010</option>
<option value="2009" <cfif recording_date_year eq "2009">SELECTED</cfif>>2009</option>
<option value="2008" <cfif recording_date_year eq "2008">SELECTED</cfif>>2008</option>
<option value="2007" <cfif recording_date_year eq "2007">SELECTED</cfif>>2007</option>
<option value="2006" <cfif recording_date_year eq "2006">SELECTED</cfif>>2006</option>
<option value="2005" <cfif recording_date_year eq "2005">SELECTED</cfif>>2005</option>
		<option value="2004" <cfif recording_date_year eq "2004">SELECTED</cfif>>2004</option>
	   		<option value="2003" <cfif recording_date_year eq "2003">SELECTED</cfif>>2003</option>
		<option value="2002" <cfif recording_date_year eq "2002">SELECTED</cfif>>2002</option>
		<option value="2001" <cfif recording_date_year eq "2001">SELECTED</cfif>>2001</option>
		<option value="2000" <cfif recording_date_year eq "2000">SELECTED</cfif>>2000</option>
		<option value="1999" <cfif recording_date_year eq "1999">SELECTED</cfif>>1999</option>
		<option value="1998" <cfif recording_date_year eq "1998">SELECTED</cfif>>1998</option>
		<option value="1997" <cfif recording_date_year eq "1997">SELECTED</cfif>>1997</option>
		<option value="1996" <cfif recording_date_year eq "1996">SELECTED</cfif>>1996</option>
		<option value="1995" <cfif recording_date_year eq "1995">SELECTED</cfif>>1995</option>
		<option value="1994" <cfif recording_date_year eq "1994">SELECTED</cfif>>1994</option>
		<option value="1993" <cfif recording_date_year eq "1993">SELECTED</cfif>>1993</option>
		<option value="1992" <cfif recording_date_year eq "1992">SELECTED</cfif>>1992</option>
		<option value="1991" <cfif recording_date_year eq "1991">SELECTED</cfif>>1991</option>
		<option value="1990" <cfif recording_date_year eq "1990">SELECTED</cfif>>1990</option>
		<option value="1989" <cfif recording_date_year eq "1989">SELECTED</cfif>>1989</option>
		<option value="1988" <cfif recording_date_year eq "1988">SELECTED</cfif>>1988</option>
		<option value="1987" <cfif recording_date_year eq "1987">SELECTED</cfif>>1987</option>
		<option value="1986" <cfif recording_date_year eq "1986">SELECTED</cfif>>1986</option>
		<option value="1985" <cfif recording_date_year eq "1985">SELECTED</cfif>>1985</option>
		<option value="1984" <cfif recording_date_year eq "1984">SELECTED</cfif>>1984</option>
		<option value="1983" <cfif recording_date_year eq "1983">SELECTED</cfif>>1983</option>
		<option value="1982" <cfif recording_date_year eq "1982">SELECTED</cfif>>1982</option>
		<option value="1981" <cfif recording_date_year eq "1981">SELECTED</cfif>>1981</option>
		<option value="1980" <cfif recording_date_year eq "1980">SELECTED</cfif>>1980</option>
		<option value="1979" <cfif recording_date_year eq "1979">SELECTED</cfif>>1979</option>
		<option value="1978" <cfif recording_date_year eq "1978">SELECTED</cfif>>1978</option>
		<option value="1977" <cfif recording_date_year eq "1977">SELECTED</cfif>>1977</option>
		<option value="1976" <cfif recording_date_year eq "1976">SELECTED</cfif>>1976</option>
		<option value="1975" <cfif recording_date_year eq "1975">SELECTED</cfif>>1975</option>
		<option value="1974" <cfif recording_date_year eq "1974">SELECTED</cfif>>1974</option>
		<option value="1973" <cfif recording_date_year eq "1973">SELECTED</cfif>>1973</option>
		<option value="1972" <cfif recording_date_year eq "1972">SELECTED</cfif>>1972</option>
		<option value="1971" <cfif recording_date_year eq "1971">SELECTED</cfif>>1971</option>
		<option value="1970" <cfif recording_date_year eq "1970">SELECTED</cfif>>1970</option>
		<option value="1969" <cfif recording_date_year eq "1969">SELECTED</cfif>>1969</option>
		<option value="1968" <cfif recording_date_year eq "1968">SELECTED</cfif>>1968</option>
		<option value="1967" <cfif recording_date_year eq "1967">SELECTED</cfif>>1967</option>
		<option value="1966" <cfif recording_date_year eq "1966">SELECTED</cfif>>1966</option>
		<option value="1965" <cfif recording_date_year eq "1965">SELECTED</cfif>>1965</option>
		<option value="1964" <cfif recording_date_year eq "1964">SELECTED</cfif>>1964</option>
		<option value="1963" <cfif recording_date_year eq "1963">SELECTED</cfif>>1963</option>
		<option value="1962" <cfif recording_date_year eq "1962">SELECTED</cfif>>1962</option>
		<option value="1961" <cfif recording_date_year eq "1961">SELECTED</cfif>>1961</option>

		<option value="1960" <cfif recording_date_year eq "1960">SELECTED</cfif>>1960</option>
		<option value="1959" <cfif recording_date_year eq "1959">SELECTED</cfif>>1959</option>
		<option value="1958" <cfif recording_date_year eq "1958">SELECTED</cfif>>1958</option>
		<option value="1957" <cfif recording_date_year eq "1957">SELECTED</cfif>>1957</option>
		<option value="1956" <cfif recording_date_year eq "1956">SELECTED</cfif>>1956</option>
		<option value="1955" <cfif recording_date_year eq "1955">SELECTED</cfif>>1955</option>
		<option value="1954" <cfif recording_date_year eq "1954">SELECTED</cfif>>1954</option>
		<option value="1953" <cfif recording_date_year eq "1953">SELECTED</cfif>>1953</option>
		<option value="1952" <cfif recording_date_year eq "1952">SELECTED</cfif>>1952</option>
		<option value="1951" <cfif recording_date_year eq "1951">SELECTED</cfif>>1951</option>
		<option value="1950" <cfif recording_date_year eq "1950">SELECTED</cfif>>1950</option>
		<option value="1949" <cfif recording_date_year eq "1949">SELECTED</cfif>>1949</option>
		<option value="1948" <cfif recording_date_year eq "1948">SELECTED</cfif>>1948</option>
		<option value="1947" <cfif recording_date_year eq "1947">SELECTED</cfif>>1947</option>
		<option value="1946" <cfif recording_date_year eq "1946">SELECTED</cfif>>1946</option>
		<option value="1945" <cfif recording_date_year eq "1945">SELECTED</cfif>>1945</option>
		<option value="1944" <cfif recording_date_year eq "1944">SELECTED</cfif>>1944</option>
		<option value="1943" <cfif recording_date_year eq "1943">SELECTED</cfif>>1943</option>
		<option value="1942" <cfif recording_date_year eq "1942">SELECTED</cfif>>1942</option>
		<option value="1941" <cfif recording_date_year eq "1941">SELECTED</cfif>>1941</option>
		<option value="1940" <cfif recording_date_year eq "1940">SELECTED</cfif>>1940</option>
		<option value="1939" <cfif recording_date_year eq "1939">SELECTED</cfif>>1939</option>
		<option value="1938" <cfif recording_date_year eq "1938">SELECTED</cfif>>1938</option>
		<option value="1937" <cfif recording_date_year eq "1937">SELECTED</cfif>>1937</option>
		<option value="1936" <cfif recording_date_year eq "1936">SELECTED</cfif>>1936</option>
		<option value="1935" <cfif recording_date_year eq "1935">SELECTED</cfif>>1935</option>
		<option value="1934" <cfif recording_date_year eq "1934">SELECTED</cfif>>1934</option>
		<option value="1933" <cfif recording_date_year eq "1933">SELECTED</cfif>>1933</option>
		<option value="1932" <cfif recording_date_year eq "1932">SELECTED</cfif>>1932</option>
		<option value="1931" <cfif recording_date_year eq "1931">SELECTED</cfif>>1931</option>
		<option value="1930" <cfif recording_date_year eq "1930">SELECTED</cfif>>1930</option>
		<option value="1929" <cfif recording_date_year eq "1929">SELECTED</cfif>>1929</option>
		<option value="1928" <cfif recording_date_year eq "1928">SELECTED</cfif>>1928</option>
		<option value="1927" <cfif recording_date_year eq "1927">SELECTED</cfif>>1927</option>
		<option value="1926" <cfif recording_date_year eq "1926">SELECTED</cfif>>1926</option>
		<option value="1925" <cfif recording_date_year eq "1925">SELECTED</cfif>>1925</option>
		<option value="1924" <cfif recording_date_year eq "1924">SELECTED</cfif>>1924</option>
		<option value="1923" <cfif recording_date_year eq "1923">SELECTED</cfif>>1923</option>
		<option value="1922" <cfif recording_date_year eq "1922">SELECTED</cfif>>1922</option>
		<option value="1921" <cfif recording_date_year eq "1921">SELECTED</cfif>>1921</option>
		<option value="1920" <cfif recording_date_year eq "1920">SELECTED</cfif>>1920</option>
		<option value="1919" <cfif instrument_date_year eq "1919">SELECTED</cfif>>1919</option>
		<option value="1918" <cfif instrument_date_year eq "1918">SELECTED</cfif>>1918</option>
		<option value="1917" <cfif instrument_date_year eq "1917">SELECTED</cfif>>1917</option>
		<option value="1916" <cfif instrument_date_year eq "1916">SELECTED</cfif>>1916</option>
		<option value="1915" <cfif instrument_date_year eq "1915">SELECTED</cfif>>1915</option>
		</select> </nobr>



		</td>
	</tr>

	<tr>
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Trustee


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="trustee"  size=40 maxlength=50
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Vesting


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="vest"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Yes" <cfif vesting eq "Yes">SELECTED</cfif>>Yes</OPTION>
			<OPTION VALUE="No" <cfif vesting eq "No">SELECTED</cfif>>No</OPTION>

			</SELECT>


		</td>
	</tr>

	<tr>
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Consideration

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="consider" value="#consideration#"  size=25 maxlength=30
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Township

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="township" value=""  size=40 maxlength=50
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		District

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="district" value=""  size=40 maxlength=50
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Section

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="section" value=""  size=40 maxlength=50
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Block

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="block" value=""  size=40 maxlength=50
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
		<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Lot

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="lot" value=""  size=40 maxlength=50
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
	
	
	<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Additional Info

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="info" value=""  size=40 maxlength=170
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
<td width=170 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		</td>

<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="info2" value=""  size=40 maxlength=170
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
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Legal</B> Information:


		</td>
	</tr>
	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<TEXTAREA name="a_comments"  COLS=80 ROWS=26
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
					clear: none;"><cfoutput>#legal#</cfoutput></TEXTAREA>


		</td>
	</tr>
	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			Additional Requirement:


		</td>
	</tr>
	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<TEXTAREA name="addreq"  COLS=80 ROWS=5
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
					clear: none;"></TEXTAREA>


		</td>
	</tr>
	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			Additional Exceptions:


		</td>
	</tr>
	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<TEXTAREA name="addex"  COLS=80 ROWS=5
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
					clear: none;"><cfoutput>#additional_exceptions#</cfoutput></TEXTAREA>


		</td>
	</tr>	
	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			Restrictive Covenants:


		</td>
	</tr>
	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<TEXTAREA name="covenants"  COLS=80 ROWS=5
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
					clear: none;"><cfoutput>#covenants#</cfoutput></TEXTAREA>


		</td>
	</tr>
	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="../images/button_submit.gif" border=0><img src="../images/clear.gif" height=10 width=40></NOBR>


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

<cfoutput>
<cfif #read_title.comp_id# EQ 3182 OR #read_title.comp_id# EQ 2368 OR #read_title.comp_id# EQ 3011  or #read_title.comp_id# eq 2372 or #read_title.comp_id# eq 3444 or ListContainsNoCase(children, read_title.Comp_id, ",")>
<cfset new_addreq = "Subject to the proper instrument(s) creating the estate or interest to be insured must be executed and duly filed for record, to wit.\n\nTrustees’ deed from Trustee of record from Deed of Trust or from Substitution of Trustee(s), vesting fee simple title to purchaser.<BR><BR>Subject to the final order of ratification and audit.">
<cfset new_addex = "THIS CONVEYANCE IS MADE EXPRESSLY SUBJECT TO THE EASEMENTS, CONDITIONS, RESTRICTIONS, AND RIGHTS-OF-WAY OF RECORD CONTAINED IN THE INSTRUMENTS FORMING THE CHAIN OF TITLE TO THE PROPERTY CONVEYED HEREIN AND TO MATTERS VISIBLE UPON INSPECTION.">
<script language = "javascript">
document.frm.addreq.value = '#new_addreq#';
document.frm.addex.value = '#new_addex#';
</script>
</cfif>
</cfoutput>

<cfoutput>
<cfif #read_title.comp_id# EQ 3276>
<cfset new_addreq = "new language to be inserted here">
<cfset new_addex = "new language to be inserted here">
<script language = "javascript">
document.frm.addreq.value = '#new_addreq#';
document.frm.addex.value = '#new_addex#';
</script>
</cfif>
</cfoutput>

</BODY>
</HTML>


