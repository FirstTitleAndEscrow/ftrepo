<CFPARAM NAME="a_trigger" DEFAULT=0>

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>

<CFIF #a_trigger# eq 1>

<CFQUERY datasource="#request.dsn#" NAME="read_deed">

			SELECT *
			FROM title_ins_add
			where title_id = #rec_id# and type = 'DATA' AND seq_num = #URL.seq_num#
		</CFQUERY>
<CFSET effective = #CreateDate(#year#, #month#, #day#)#>
<CFSET instdate = #CreateDate(#inst_year#, #inst_mon#, #inst_day#)#>
<CFSET recdate = #CreateDate(#rec_year#, #rec_mon#, #rec_day#)#>
<cfif #inst_yeart# NEQ "" AND #inst_mont# NEQ "" AND #inst_dayt# NEQ "">
<CFSET instdatet = #CreateDate(#inst_yeart#, #inst_mont#, #inst_dayt#)#>
<cfelse>
<cfset instdatet = "">
</cfif>
<cfif #rec_yeart# NEQ "" AND #rec_mont# NEQ "" AND #rec_dayt# NEQ "">
<CFSET recdatet = #CreateDate(#rec_yeart#, #rec_mont#, #rec_dayt#)#>
<cfelse>
<cfset recdatet = "">
</cfif>

<CFQUERY datasource="#request.dsn#" >

			UPDATE title_ins_add
			SET status = 'U',
			data1 = '#grantor1#',
			data2 = '#grantor2#',
			data3 ='#grantee1#',
			data4 ='#grantee2#',
			data5 ='#deedtype#',
			data6 ='#mannertitle#',
			data7 ='#docnum#',
			data8 ='#book#',
			data9 ='#page#',
			data10 ='#DateFormat(instdate, "mm/dd/yyyy")#',
			data11 ='#DateFormat(recdate, "mm/dd/yyyy")#',
			data12 ='#trustee#',
			data13 ='#vest#',
			data14 ='#info#',
			data15 ='#info2#',
			data16 ='#consider#',
			data17 ='#township#',

			data18 ='#proptype#',
data19 ='#taxid#',
data20 ='#parcel#',
data21 ='#exempt#',
data22 ='#amount#',
data23 ='#extype#',
data24 ='#land#',
data25 ='#impass#',
data26 ='#other#',
data27 ='#val#',
data28 ='#tx#',
data29 ='#tax_year#',
data30 ='#DateFormat(instdatet, "mm/dd/yyyy")#',
data31 ='#stat#',
data32 ='#txamt#',
data33 ='#del_year#',
data34 ='#infotax#',
data35 ='#infotax2#',
data36 ='#DateFormat(recdatet, "mm/dd/yyyy")#',
data37 ='#DateFormat(instdatee, "mm/dd/yyyy")#',
data38 ='#select1#',
notes = '#a_comments#'
WHERE  title_id = #rec_id# AND type = 'DATA' AND seq_num = #seq_num#

		</CFQUERY>

<CFQUERY datasource="#request.dsn#" >

			UPDATE title_ins_view
			SET status = 'U',
			data1 = '#grantor1#',
			data2 = '#grantor2#',
			data3 ='#grantee1#',
			data4 ='#grantee2#',
			data5 ='#deedtype#',
			data6 ='#mannertitle#',
			data7 ='#docnum#',
			data8 ='#book#',
			data9 ='#page#',
			data10 ='#DateFormat(instdate, "mm/dd/yyyy")#',
			data11 ='#DateFormat(recdate, "mm/dd/yyyy")#',
			data12 ='#trustee#',
			data13 ='#vest#',
			data14 ='#info#',
			data15 ='#info2#',
			data16 = '#consider#',
			data17 ='#township#',

			data18 ='#proptype#',
data19 ='#taxid#',
data20 ='#parcel#',
data21 ='#exempt#',
data22 ='#amount#',
data23 ='#extype#',
data24 ='#land#',
data25 ='#impass#',
data26 ='#other#',
data27 ='#val#',
data28 ='#tx#',
data29 ='#tax_year#',
data30 ='#DateFormat(instdatet, "mm/dd/yyyy")#',
data31 ='#stat#',
data32 ='#txamt#',
data33 ='#del_year#',
data34 ='#infotax#',
data35 ='#infotax2#',
data36 ='#DateFormat(recdatet, "mm/dd/yyyy")#',
data37 ='#DateFormat(instdatee, "mm/dd/yyyy")#',
data38 ='#select1#',
notes = '#a_comments#'
WHERE  title_id = #rec_id# AND type = 'DATA' AND seq_num = #seq_num#

		</CFQUERY>

</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM title_ins_add
			where title_id = #rec_id# and type = 'DATA' AND seq_num = #URL.seq_num#
		</CFQUERY>

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
else if (frm.mannertitle.value=='') {
alert("The Manner of Title cannot be left blank")
return false;
}
else if (frm.inst_mon.value=='' || frm.inst_day.value=='' || frm.inst_year.value=='') {
alert("The Instrument date cannot be left blank")
return false; }

else if (frm.rec_mon.value=='' || frm.rec_day.value=='' || frm.rec_year.value=='') {
alert("The Recording date cannot be left blank")
return false; }

else if (frm.docnum.value != '') {
		if (frm.book.value=='' && frm.page.value=='') {
		alert("When document Number is filled either book or page should be filled in as well")
return false; }
}
else if (frm.tx.value != '') {
		if (frm.tax_year.value=='') {
		alert("Tax Year cannot be left blank")
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

</table>

		</td>
	</tr>

	<tr>
		<td width=798 align=center valign=top bgcolor=e6e6e6>

<center>
<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
<CFOUTPUT><tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
Click here to go back to the main page.<a href="./title_vendor_data_form.cfm?username=#url.username#&password=#url.password#&rec_id=#url.rec_id#"><img src="./images/button_return.gif" border=0 ALT="Click this button to return to main"></a>

	</td>
	</tr></CFOUTPUT>
	<CFFORM METHOD=POST ACTION="https://#cgi.server_name#/abstractor_deed_modify.cfm?username=#url.username#&password=#url.password#&rec_id=#url.rec_id#&seq_num=#read_report.seq_num#&company_id=0&a_trigger=1" name="frm" ENABLECAB="Yes" onSubmit="return put();">

<cfoutput query = "read_report">
	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=85>


		</td>
	</tr>


<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Effective</B> Date:


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Effective Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="inst_mone"
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

<option value="#DateFormat(data37, "mm")#">#DateFormat(data37, "mm")#</option>

	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>


</select>

<select name="inst_daye"
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
<option value="#DateFormat(data37, "dd")#">#DateFormat(data37, "dd")#</option>


		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>
</select>
<select name="inst_yeare"
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

<option value="#DateFormat(data37, "yyyy")#">#DateFormat(data37, "yyyy")#</option>

	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
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
			<option value="#data38#">#data38#</option>
			<OPTION VALUE="Fee Simple">Fee Simple</OPTION>
			<OPTION VALUE="Leasehold">Leasehold</OPTION>
			<OPTION VALUE="Deed type is land contract">Deed type is land Contract</OPTION>
			<OPTION VALUE="Property has oil or gas lease recorded">Property has oil or gas lease recorded</OPTION>
			<OPTION VALUE="Property is tribal property">Property is tribal property</OPTION>
			<OPTION VALUE="Property grantee is a trust">Property grantee is a trust</OPTION>
			<OPTION VALUE="Property is leasehold">Property is leasehold</OPTION>

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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantor 1


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT value = "#data1#" Required="Yes"  Message="You must enter a Grantor's NAME" type=text name="grantor1"  size=40 maxlength=600
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantor 2


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT value = "#data2#" type=text name="grantor2" size=40 maxlength=600
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Grantee 1


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT value = "#data3#" Required="Yes" Message="You must enter a Grantee 1 name" type=text name="grantee1"  size=40 maxlength=600
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantee 2


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  value = "#data4#" type=text name="Grantee2"  size=40 maxlength=600
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
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
			<OPTION VALUE="#data5#">#data5#</OPTION>
			<OPTION VALUE="Warranty">Warranty</OPTION>
			<OPTION VALUE="Quit Claim">Quit Claim</OPTION>
			<OPTION VALUE="Abridgement of Judgment">Abridgement of Judgment</OPTION>
			<OPTION VALUE="Administrator's">Administrator's</OPTION>
			<OPTION VALUE="Condominium">Condominium</OPTION>
			<OPTION VALUE="Contract for Deed">Contract for Deed</OPTION>
			<OPTION VALUE="Corporate">Corporate</OPTION>
			<OPTION VALUE="Corporate Warranty">Corporate Warranty</OPTION>
			<OPTION VALUE="Deed in Trust">Deed in Trust</OPTION>
			<OPTION VALUE="Divorce Decree">Divorce Decree</OPTION>
			<OPTION VALUE="Executor's/Executrix's">Executor's/Executrix's</OPTION>
			<OPTION VALUE="Land Contract">Land Contract</OPTION>
			<OPTION VALUE="Limited Warranty">Limited Warranty</OPTION>
			<OPTION VALUE="Personal Representative's">Personal Representative's</OPTION>
			<OPTION VALUE="Probate Action">Probate Action</OPTION>
			<OPTION VALUE="Sheriff's">Sheriff's</OPTION>
			<OPTION VALUE="Special Warranty">Special Warranty</OPTION>
			<OPTION VALUE="Tax Sale">Tax Sale</OPTION>
			<OPTION VALUE="Termination of Decedents Poperty Interes">Termination of Decedents Poperty Interes</OPTION>
			<OPTION VALUE="Trustee's">Trustee's</OPTION>
			<OPTION VALUE="Deed in Lieu of Foreclosure">Deed in Lieu of Foreclosure</OPTION>
            </SELECT>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Manner of Tile


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
			<OPTION VALUE="#data6#">#data6#</OPTION>
			<OPTION VALUE="H/W JTWROS">H/W JTWROS</OPTION>
			<OPTION VALUE="H/W">H/W</OPTION>
			<OPTION VALUE="J/T">J/T</OPTION>
			<OPTION VALUE="Survivor of either">Survivor of either</OPTION>
			<OPTION VALUE="S/P">S/P</OPTION>
			<OPTION VALUE="Divorced N/S/R">Divorced N/S/R</OPTION>
			<OPTION VALUE="T/B/E">T/B/E</OPTION>
			<OPTION VALUE="Of legal age">Of legal age</OPTION>
			<OPTION VALUE="A Widow">A Widow</OPTION>
			<OPTION VALUE="J/M/P">J/M/P</OPTION>
			<OPTION VALUE="W/F/R/S">W/F/R/S</OPTION>
			<OPTION VALUE="H/H">H/H</OPTION>
			<OPTION VALUE="Married to each other">Married to each other</OPTION>
			<OPTION VALUE="H/S">H/S</OPTION>
			<OPTION VALUE="A/S/M/P">A/S/M/P</OPTION>
			<OPTION VALUE="T/I/C">T/I/C</OPTION>
			<OPTION VALUE="Over the age of eighteen">Over the age of eighteen</OPTION>
			<OPTION VALUE="An adult">An adult</OPTION>
			<OPTION VALUE="A Spinster">A Spinster</OPTION>
			<OPTION VALUE="As Trustee">As Trustee</OPTION>
			<OPTION VALUE="W/R/S">W/R/S</OPTION>
			<OPTION VALUE="A/M/M/S/E">A/M/M/S/E</OPTION>
			<OPTION VALUE="A/S/A/S/P">A/S/A/S/P</OPTION>
			<OPTION VALUE="A/S/M">A/S/M</OPTION>
			<OPTION VALUE="A/T/B/T/E">A/T/B/T/E</OPTION>
			<OPTION VALUE="H/H/A/F">H/H/A/F</OPTION>
			<OPTION VALUE="J/T/F/L/W">J/T/F/L/W</OPTION>
			<OPTION VALUE="J/T/W/R/O/S">J/T/W/R/O/S</OPTION>
			<OPTION VALUE="M/W/A/H/S/A/S/P">M/W/A/H/S/A/S/P</OPTION>
			<OPTION VALUE="N/A/T/I/C">N/A/T/I/C</OPTION>
			<OPTION VALUE="S/S/E/E">S/S/E/E</OPTION>
			<OPTION VALUE="T/E">T/E</OPTION>
			<OPTION VALUE="H/W CPROS">H/W CPROS</OPTION>
			<OPTION VALUE="None Stated">None Stated</OPTION>

			</SELECT>

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Document Number

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="docnum" value="#data7#"  size=25 maxlength=30
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="book" value="#data8#"  size=25 maxlength=30
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="page" value="#data9#"  size=25 maxlength=30
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
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

<option value="#DateFormat(data10, "mm")#">#DateFormat(data10, "mm")#</option>


	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>


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

<OPTION VALUE="#DateFormat(data10, "dd")#">#DateFormat(data10, "dd")#</OPTION>


		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>
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

<option value="#DateFormat(data10, "yyyy")#">#DateFormat(data10, "yyyy")#</option>


	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
		</select> </nobr>



		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
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

<option value="#DateFormat(data11, "mm")#">#DateFormat(data11, "mm")#</option>


	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>


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

<OPTION VALUE="#DateFormat(data11, "dd")#">#DateFormat(data11, "dd")#</OPTION>


		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>
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

<option value="#DateFormat(data11, "yyyy")#">#DateFormat(data11, "yyyy")#</option>


	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
		</select> </nobr>



		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Trustee


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  value = "#data12#" type=text name="trustee"  size=40 maxlength=50
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
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
			<OPTION VALUE="#data13#">#data12#</OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>

			</SELECT>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Consideration

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="consider" value="#data16#"  size=25 maxlength=30
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Township

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="township" value="#data17#"  size=40 maxlength=50
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


	<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Additional Info

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="info" value="#data14#"  size=40 maxlength=150
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
<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		</td>

<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="info2" value="#data15#"  size=40 maxlength=150
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
			<B>Tax</B> Information:


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property Type


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="proptype"
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
			<OPTION VALUE="#data18#">#data18#</OPTION>
			<OPTION VALUE="Multi-Family Residence (5+ Units)">Multi-Family Residence (5+ Units)</OPTION>
			<OPTION VALUE="Condominium, PUD">Condominium, PUD</OPTION>
			<OPTION VALUE="Cooperative">Cooperative</OPTION>
			<OPTION VALUE="Duplex">Duplex</OPTION>
			<OPTION VALUE="Multi-Family Residence (2-4 Units)">Multi-Family Residence (2-4 Units)</OPTION>
			<OPTION VALUE="Mobile Home">Mobile Home</OPTION>
			<OPTION VALUE="Miscellaneous">Miscellaneous</OPTION>
			<OPTION VALUE="Quadruplex">Quadruplex</OPTION>
			<OPTION VALUE="Single Family Residence">Single Family Residence</OPTION>
			<OPTION VALUE="Triplex">Triplex</OPTION>

			</SELECT>


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax ID


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT value="#data19#" type=text name="taxid"  size=40 maxlength=50
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Parcel


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="parcel" value="#data20#"  size=20 maxlength=30
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Exempt


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="exempt"
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
			<OPTION VALUE="#data21#">#data21#</OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>


			</SELECT>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Exempt Amount


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="amount" value="#data22#" size=30 maxlength=50
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Exempt Type


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT value="#data23#" type=text name="extype"  size=40 maxlength=50
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Land Assessments


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT value="#data24#" type=text name="land"  size=30 maxlength=50
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Improvements Assessments


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT value="#data25#" type=text name="impass"  size=30 maxlength=50
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Other Assessments


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT value="#data26#" type=text name="other"  size=30 maxlength=50
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Total Assessed Value


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT value="#data27#" type=text name="val"  size=30 maxlength=50
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Amount


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT value="#data28#" type=text name="tx"  size=30 maxlength=50
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Year


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<select name="tax_year"
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

<option value="#data29#">#data29#</option>


	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
		</select>


		</td>
	</tr>

	<tr>
	<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
	Payable to

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="infotax2" value = "#data35#"  size=40 maxlength=130
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Due Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="inst_mont"
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

<option value="#DateFormat(data30, "mm")#">#DateFormat(data30, "mm")#</option>



	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>


</select>

<select name="inst_dayt"
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

<option value="#DateFormat(data30, "dd")#">#DateFormat(data30, "dd")#</option>



		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>
</select>
<select name="inst_yeart"
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

<option value="#DateFormat(data30, "yyyy")#">#DateFormat(data30, "yyyy")#</option>



	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
		</select> </nobr>



		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Taxes Paid Through


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mont"
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

<option value="#DateFormat(data36, "mm")#">#DateFormat(data36, "mm")#</option>



	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>


</select>

<select name="rec_dayt"
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

<option value="#DateFormat(data36, "dd")#">#DateFormat(data36, "dd")#</option>



		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>
</select>
<select name="rec_yeart"
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

<option value="#DateFormat(data36, "yyyy")#">#DateFormat(data36, "yyyy")#</option>



	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
		</select> </nobr>



		</td>
	</tr>



	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Status


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
						<SELECT NAME="stat"
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
			<OPTION VALUE="#data31#">#data31#</OPTION>
			<OPTION VALUE="Not Available">Not Available</OPTION>
			<OPTION VALUE="Delinquent (w/ Penalty)">Delinquent (w/ Penalty)</OPTION>
			<OPTION VALUE="Not yet due or payable">Not yet due or payable</OPTION>
			<OPTION VALUE="Paid">Paid</OPTION>
			<OPTION VALUE="Too new has not been assessed yet">Too new has not been assessed yet</OPTION>
			<OPTION VALUE="Unpaid">Unpaid</OPTION>


			</SELECT>

		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Delinquent Tax Amount


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  value = "#data32#" type=text name="txamt"  size=30 maxlength=50
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Delinquent Tax Year


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<select name="del_year"
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

<option value="#data33#">#data33#</option>


	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
		</select>


		</td>
	</tr>
	<tr>
	<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Additional Info

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="infotax" value = "#data34#"  size=40 maxlength=130
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Legal


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<TEXTAREA name="a_comments"  COLS=70 ROWS=26
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
					clear: none;">#notes#</TEXTAREA>


		</td>
	</tr>



</cfoutput>

	<tr>

		<td width=498 colspan = 2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_modify.gif" border=0><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=40></NOBR>


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


</BODY>
</HTML>