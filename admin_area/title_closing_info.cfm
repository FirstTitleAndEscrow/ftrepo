<cfparam name="url.cancelled" default=0>
<cfquery name="get_id" DATASOURCE="#request.dsn#">
	SELECT *
	FROM Title
	Where Title_Id = #URL.rec_id#
</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" NAME="Read_Title">
	SELECT *
	FROM Title
	Where Title_Id = #URL.rec_id#
</CFQUERY>

<cfquery name="read_signing" DATASOURCE="#request.dsn#">
select * from Title_Closing_Order_Request

where title_id = #URL.rec_id#
</cfquery>

<cfquery name="getorderinfo" DATASOURCE="#request.dsn#">
SELECT *
FROM Title_Closing_Order_Request
Where Title_Id = #get_id.title_id#
</cfquery>

<cfquery name="get_name" DATASOURCE="#request.dsn#">
	select *
	from title
	where title_id =  #URL.rec_id#
</cfquery>

<CFQUERY DATASOURCE="#request.dsn#" NAME="aaaa">
				SELECT *
				FROM eventlist
				Where Title_Id = #URL.rec_id#
			</CFQUERY>

<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
     <CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_closer">

			SELECT *
			FROM Doc_closer_Title
			WHERE title_ID = #rec_id#

		</CFQUERY>
     <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_closer">

			SELECT *
			FROM closer
			WHERE closer_ID = '#read_title_closer.closer_ID#'

		</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_notes">
				SELECT *
				FROM closer_info
				Where title_Id = #URL.rec_id#

			</CFQUERY>
<html>
<head>



	<title>1st Title & Escrow, Inc. - Show Detail Order</title>
<script type="text/javascript">
var cancel_it = 0;


function ValidateForm(frm)
if (cancel_it == 0) {
{
frm = document.frm;

if (frm.confirm_mon.value=='') {
 alert("Please select a month to schedule closing!")
 frm.confirm_mon.focus();
      return false;
 }
if (frm.confirm_day.value=='') {
 alert("Please select a day to schedule closing!")
 frm.confirm_day.focus();
      return false;
 }
 if (frm.confirm_year.value=='') {
 alert("Please select a year to schedule closing!")
 frm.confirm_year.focus();
      return false;
 }
}
}
</script>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0" bgcolor="elelel">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" align="center"valign=bottom><IMG height=1 src="./images/clear.gif" width=10><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30>
<cfif url.cancelled eq 1><font color="red" size=2>Closing for this order has been cancelled</font><br>
<br>
</cfif>
<cfoutput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT></td></tr><br>

<TABLE WIDTH=620 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>
<TR><br>
<TD ALIGN=middle>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Individual Closing</FONT>
<HR>

</TD></TR>
</table>
<CFOUTPUT>
<center>
	<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>
		<tr>
			<td width=620 align=center valign=top bgcolor=e1e1e1>

			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
			</td>
		</tr>



		<tr>
			<td width=110 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>1st Borrower Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# &nbsp;&nbsp;#Read_Title.BLastName1#</B></NOBR>
			</td>

		</tr>


		<tr>
			<td width=110 align=center valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>2nd Borrower Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# &nbsp;&nbsp;#Read_Title.BLastName2#</B></NOBR>
			</td>


		</tr>



		<tr>
			<td width=620 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<center><NOBR>Address - <font face=verdana size=2 color=blue><b>#Read_Title.pADDRESS#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font></NOBR></center>
			</td>
		</tr>


		<!--- <tr>
			<td width=620 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<center><NOBR>Job number - <font face=verdana size=2 color=blue><B> #getorderinfo.Job_Number#</B></NOBR></center>
			</td>
		</tr> --->


</table>
</center>
</CFOUTPUT>
<center>


<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>


<cfform name = "frm" action="./update_title_closing.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&comp_id=#read_title.comp_ID#" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>
<cfoutput>

<tr>
	<td width=620 colspan = "2" align=center valign=top bgcolor=d3d3d3><font size=2 face=arial><b>Closing Information</font></b> </td>
</tr>

<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Fee (for Funding)
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

			 <INPUT TYPE=TEXT NAME="fee" VALUE="#aaaa.fee#" MaxLength=50 Size=16
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
</td></tr>
<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Notary Name
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

			 <INPUT TYPE=TEXT NAME="notary_name" VALUE="#read_signing.notary_name#" MaxLength=50 Size=26
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
</td></tr>
<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Notary Phone
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

			 <INPUT TYPE=TEXT NAME="notary_phone" VALUE="#read_signing.notary_phone#" MaxLength=50 Size=26
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
</td></tr>
<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Notary Email
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

			 <INPUT TYPE=TEXT NAME="notary_email" VALUE="#read_signing.notary_email#" MaxLength=50 Size=26
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
</td></tr>


		<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Assign
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

<select name="confirm_mon"
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
	 	<Cfif (#aaaa.c_month# neq "")>

<option value="#aaaa.c_month#"selected>#aaaa.c_month#</OPTION>


<option value="01">01</option>
		<option value="02">02</option>
		<option value="03">03</option>
		<option value="04">04</option>
		<option value="05">05</option>
		<option value="06">06</option>
		<option value="07">07</option>
		<option value="08">08</option>
		<option value="09">09</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
<cfelse>
<option value="">Month</option>


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
</cfif>

</select>

<select name="confirm_day"
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
<Cfif (#aaaa.c_day# neq "")>


<option value="#aaaa.c_day#" selected>#aaaa.c_day#</OPTION>
<cfelse>
<OPTION VALUE="">Day</OPTION>
</cfif>

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
<select name="confirm_year"
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
		<Cfif (#aaaa.c_year# neq "")>
<option value="#aaaa.c_year#"selected>#aaaa.c_year#</OPTION>
<cfelse>
<option value="">Year</option>
</cfif>


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

<BR><font color="Blue" size="2"><i>requested: #getorderinfo.A_Req_Closing_month#/#getorderinfo.A_Req_Closing_day#/#getorderinfo.A_Req_Closing_year#</i> </font>
</td></tr>
<TR>
			<td width = "30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Assign
			</td>


	 <td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<SELECT name="confirm_time"
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
<Cfif (#aaaa.c_Time# neq "")>
<option value="#TimeFormat(aaaa.c_Time, "HH:mm tt")#"selected>#TimeFormat(aaaa.c_Time, "HH:mm tt")#</OPTION>
<cfelse>
<option value="">Time</option>
</cfif>
<option value="08:00 am">8:00 am
<option value="08:30 am">8:30 am
<option value="09:00 am">9:00 am
<option value="09:30 am">9:30 am
<option value="10:00 am">10:00 am
<option value="10:30 am">10:30 am
<option value="11:00 am">11:00 am
<option value="11:30 am">11:30 am
<option value="12:00 pm">12:00 pm
<option value="12:30 pm">12:30 pm
<option value="1:00 pm">1:00 pm
<option value="1:30 pm">1:30 pm
<option value="2:00 pm">2:00 pm
<option value="2:30 pm">2:30 pm
<option value="3:00 pm">3:00 pm
<option value="3:30 pm">3:30 pm
<option value="4:00 pm">4:00 pm
<option value="4:30 pm">4:30 pm
<option value="5:00 pm">5:00 pm
<option value="5:30 pm">5:30 pm
<option value="6:00 pm">6:00 pm
<option value="6:30 pm">6:30 pm
<option value="7:00 pm">7:00 pm
<option value="7:30 pm">7:30 pm
<option value="8:00 pm">8:00 pm
<option value="8:30 pm">8:30 pm
<option value="9:00 pm">9:00 pm
<option value="9:30 pm">9:30 pm
<option value="10:30 pm">10:30 pm
<option value="11:00 pm">11:00 pm
</SELECT>
<BR><font color="Blue" size="2"><i>requested: #getorderinfo.A_Req_Closing_Time#</i> </font>


</td>
		</tr>




		<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Contract Busted Date
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

<select name="confirm_busted_mon"
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
	 	<Cfif (#getorderinfo.contract_busted_date# neq "")>

<option value="#DatePart('m', getorderinfo.contract_busted_date)#"selected>#DatePart('m', getorderinfo.contract_busted_date)#</OPTION>


<option value="01">01</option>
		<option value="02">02</option>
		<option value="03">03</option>
		<option value="04">04</option>
		<option value="05">05</option>
		<option value="06">06</option>
		<option value="07">07</option>
		<option value="08">08</option>
		<option value="09">09</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
<cfelse>
<option value="">Month</option>


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
</cfif>

</select>

<select name="confirm_busted_day"
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
<Cfif (#getorderinfo.contract_busted_date# neq "")>


<option value="#DatePart('d', getorderinfo.contract_busted_date)#" selected>#DatePart('d', getorderinfo.contract_busted_date)#</OPTION>
<cfelse>
<OPTION VALUE="">Day</OPTION>
</cfif>

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
<select name="confirm_busted_year"
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
		<Cfif (#getorderinfo.contract_busted_date# neq "")>
<option value="#DatePart('yyyy', getorderinfo.contract_busted_date)#"selected>#DatePart('yyyy', getorderinfo.contract_busted_date)#</OPTION>
<cfelse>
<option value="">Year</option>
</cfif>


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

<BR><font color="Blue" size="2"><i>previous: #DateFormat(getorderinfo.contract_busted_date, "m/d/yyyy")#</i> </font>
</td></tr>

</table></center>
	<center>
	<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>

<tr>
	<td width="30%" align=right valign=middle bgcolor=e1e1e1><font size=2 face=arial>Info</font> </td>
	 <td width="70%" align=center valign=top bgcolor=e1e1e1><font size=2 face=arial>
	<TEXTAREA name="comments"  COLS=110 ROWS=8
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
					clear: none;"><Cfif (#aaaa.c_comment# neq "")>#aaaa.c_comment#<cfelse><cfif #getorderinfo.A_Special_Inst# neq "">Info from client: #getorderinfo.A_Special_Inst#</cfif><cfif #read_title_closer.a_assigned_by# GT 0><CFIF #read_assigned_closer.company# neq ""> Closing company: #read_assigned_closer.company#</cfif><CFIF #read_assigned_closer.recordcount# neq ""> Closer ID: 24043#read_assigned_closer.closer_id#</cfif><cfif #read_assigned_closer.addr1# neq ""> Address: #read_assigned_closer.addr1# #read_assigned_closer.city#, #read_assigned_closer.state# #read_assigned_closer.zip_code#</cfif><cfif #read_assigned_closer.phone# neq ""> Closer phone: #read_assigned_closer.phone# </cfif><cfif #read_assigned_closer.email# neq ""> Closer email: #read_assigned_closer.email#</cfif><cfif #read_assigned_closer.ext# neq ""> Ext: #read_assigned_closer.ext#</cfif><cfif #read_assigned_closer.fax# neq ""> Fax: #read_assigned_closer.fax#</cfif><cfif #read_assigned_closer.pref_for_send# neq ""> Preference for send: #read_assigned_closer.pref_for_send#</cfif><cfif #read_title_closer.closer_info# neq ""> Vendor info: #read_title_closer.closer_info#</cfif></cfif></cfif>
</TEXTAREA>
					<p>

<!--- #aaaa.c_comment# --->

</tr>
<cfif Len(read_title.realec_ds1_uid) OR Len(read_title.realec_ds2_uid)>
<tr>
	<td width=620 colspan = "2" align=center valign=top bgcolor=d3d3d3><font size=2 face=arial><b>Document Signing Information</font></b> </td>
</tr>

<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				 Address
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

			 <INPUT TYPE=TEXT NAME="signing_location_address" VALUE="#read_signing.signing_location_address#" MaxLength=50 Size=50
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
</td></tr>
<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				 City
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

			 <INPUT TYPE=TEXT NAME="signing_location_city" VALUE="#read_signing.signing_location_city#" MaxLength=50 Size=50
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
</td></tr>
<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				 State
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

			 <INPUT TYPE=TEXT NAME="signing_location_state" VALUE="#read_signing.signing_location_state#" MaxLength=50 Size=50
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
</td></tr>
<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				 Zip
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

			 <INPUT TYPE=TEXT NAME="signing_location_zip" VALUE="#read_signing.signing_location_zip#" MaxLength=50 Size=50
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
</td></tr>


		<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Location
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

<select name="signing_location"
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

<option value=""></option>	 	
<option value="BHOME" <cfif read_signing.signing_location EQ "BHOME">selected</cfif>>Borrower Home </option><option value="BOFFICE" <cfif read_signing.signing_location EQ "BOFFICE">selected</cfif>>Borrower Office</option><option value="BOTHER" <cfif read_signing.signing_location EQ "BOTHER">selected</cfif>>Borrower Other</option><option value="COFFICE" <cfif read_signing.signing_location EQ "COFFICE">selected</cfif>>Closing Agent Office</option><option value="COTHER" <cfif read_signing.signing_location EQ "COTHER">selected</cfif>>Closing Agent Other</option><option value="ONLINE" <cfif read_signing.signing_location EQ "ONLINE">selected</cfif>>Online</option>


</select>


</td></tr>
<tr>

			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Signing Method
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

<select name="signing_method_type"
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

<option value=""></option>	 	
<option value="TRD" <cfif read_signing.signing_method_type EQ "TRD">selected</cfif>>Traditional</option>
																																	
																	<option value="AGT" <cfif read_signing.signing_method_type EQ "AGT">selected</cfif>>Agent Arranged</option>
																																	
																	<option value="NOTARY" <cfif read_signing.signing_method_type EQ "NOTARY">selected</cfif>>Notary</option>
																																	
																	<option value="FACETOFACE" <cfif read_signing.signing_method_type EQ "FACETOFACE">selected</cfif>>FACETOFACE</option>


</select>


</td></tr>
<tr><td width="70%" align=left valign=top bgcolor=e1e1e1 colspan="2"><input type="checkbox" name="locationchange"> Location Change
<input type="checkbox" name="datetimechange"> Date/Time Change

</td></tr>
</cfif>



</table></center>




</CFOUTPUT>



<!---button for property report--->

<cfoutput>
<table border=0 align=center width=455 bgcolor=elelel>
                            <TBODY>

<tr><td valign="center" align="center">

<input type="submit" name="update" value="Update & Email Closing Info.">

<br><br><br>
<cfif (IsDefined("getorderinfo.confirm_day") and IsDefined("getorderinfo.confirm_month") and IsDefined("getorderinfo.confirm_year"))    or   ((#getorderinfo.a_req_closing_day# GT 0))>
<input type="submit" name="cancel_closing" value="Cancel This Closing" style="background-color:##FF9966;" onClick="cancel_it=1;">
</cfif>
<input type="hidden" name="title_id" value="#getorderinfo.title_id#">
<input type="hidden" name="verifyemail" value="#get_name.verifyemail#">

</td>

</tr>
</CFOUTPUT>

</cfform>
</table></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></NOBR>

</body>
</html>
