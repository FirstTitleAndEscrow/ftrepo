
<cfparam name="customerid" default="">

<cfparam name="ClosingType" default="">

<cfparam name="ClosingOption" default="">
<cfparam name="ClosingLoanType" default="">




<cfquery name="getcustomerinfo" DATASOURCE="First_Title_Services">
SELECT DISTINCT * FROM customers WHERE customerid=#customerid#
</cfquery>

<cfquery name="getstate" DATASOURCE="First_Title_Services">
SELECT state FROM taxtable ORDER BY state
</cfquery>


 <cfquery name="getcompany" DATASOURCE="First_Title_Services">
SELECT company FROM login WHERE loginid=#loginid#
</cfquery>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">





<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><td colspan="2" valign=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.gif"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT><img src="images/clear.gif" width=69 height=1 alt="" border="0">
<a href="./welcome.cfm"><img src="images/home.gif" width=55 height=18 alt="" border="0"></a></td></tr><tr><td colspan="2" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./title_services.cfm"><IMG src="./images/nav_02.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./closing_services.cfm"><IMG src="./images/nav_04.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><A href="./customer_login.cfm"><IMG border=0 src="./images/nav_06.gif"></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./contact_info.cfm"><IMG src="./images/nav_08.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./mail.cfm?pass=0"><IMG src="./images/nav_10.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><br><IMG height=1 src="./images/clear.gif" width=20><br></TD><TD>

<TABLE WIDTH=440 BORDER=0 CELLSPACING=0 align="center">
<TR>
<TD ALIGN=middle>
<cfoutput query="getcompany">
<FONT FACE=ARIAL COLOR="red" SIZE=4><b>Welcome:&nbsp;#Ucase("#company#")#</b></FONT>
<p>
</cfoutput>
<A href="./help.htm" target=new>Click Here for Help</A>
<HR>
<CENTER>


<!---- Account Information--->


<TABLE BORDER=1 CELLSPACING=0 width=520 bgcolor="a2a3fe">
<FORM  ACTION="./closing_verify.cfm" METHOD=post>

<cfoutput query = getcustomerinfo>

<TR BGCOLOR="blue">
<TD ALIGN=middle colspan=4>
<FONT FACE=ARIAL SIZE=2 color="white">
<B>A C C O U N T &nbsp; I N F O R M A T I O N</B></FONT>
</TD></TR>

<TR>
<TD bgcolor="a2a3fe" colspan=4>
<FONT FACE=ARIAL SIZE=2 color="black"><b>Loan Officer:</b></FONT>
</TD>
</TR>

<tr>
<td bgcolor="a2a3fe" ><FONT FACE=ARIAL SIZE=2 color="black">
Name (Last, First)<br>
<INPUT NAME="oname" size=15 maxlength="25" value="#oname#" requried     = yes message =
                                "Please enter the officer's full name."></FONT>
</td>

<td bgcolor="a2a3fe" ><FONT FACE=ARIAL SIZE=2 color="black">
Phone No.<br>
<INPUT NAME="ophone" size=10 maxlength          =15 value="#ophone#"  message = "Please enter the officer's phone no. in the format of xxx-xxx-xxxx."
                                validate = telephone require = yes></FONT>
</td>

<td bgcolor="a2a3fe" ><FONT FACE=ARIAL SIZE=2 color="black">
Ext.<br>
<INPUT NAME="oext" size=5 maxlength="15" message         =
                                "Please enter an integer for the loan officer's Ext."
                                validate = integer>
<input type="hidden" name="oext_integer" value="Please enter an integer for the officer's Ext."
                               ></FONT>
</td>

<td bgcolor="a2a3fe" ><FONT FACE=ARIAL SIZE=2 color="black">
Fax No.<br>
<INPUT NAME="ofax" size=10 maxlength          =15  value="#ofax#" message =
                                "Please enter the office's fax no. in the format of xxx-xxx-xxxx."
                                validate = telephone></FONT>
</td>
</tr>

<TR>
<TD COLSPAN=4  bgcolor="a2a3fe"><FONT FACE=ARIAL SIZE=2 color="black"><b>Loan Processor:</b></FONT>
</TD>
</TR>


<tr>
<td bgcolor="a2a3fe" ><FONT FACE=ARIAL SIZE=2 color="black">
Name (Last, First)<br>
<INPUT NAME="pname" size=15 maxlength=25 value="#pname#"></FONT></td>

<td bgcolor="a2a3fe" ><FONT FACE=ARIAL SIZE=2 color="black">
Phone No.<br>
<INPUT NAME="pphone" size=10 maxlength          =15  value="#pphone#" message =
                                "Please enter the processor's phone no. in the format of xxx-xxx-xxxx."
                                validate = telephone></FONT>
</td>

<td bgcolor="a2a3fe" ><FONT FACE=ARIAL SIZE=2 color="black">
Ext.<br>
<INPUT NAME="pext" size=5 maxlength="15" value="#pext#" message        = "Please enter an integer for the loan processer's Ext."
                                validate = integer>
<input type="hidden" name="pext_integer" value="Please enter an integer for the loan processer's Ext."></FONT>

</td>

<td bgcolor="a2a3fe" ><FONT FACE=ARIAL SIZE=2 color="black">
Fax No.<br>
<INPUT NAME="pfax" size=10 maxlength          =15  value="#pfax#" message =
                                "Please enter the processor's fax no. in the format of xxx-xxx-xxxx."
                                validate = telephone></FONT>
</td>

</tr>
</TABLE>



<!---Borrower/Seller Information--->

<TABLE BORDER=1 CELLSPACING=0 width=520 bgcolor="a2a3fe">

<TR BGCOLOR="blue">
<TD COLSPAN=7 ALIGN=middle>
<FONT FACE=ARIAL SIZE=2 color="white"><B>B O R R O W E R /S E L L E R &nbsp;&nbsp; I N F O R M A T I O N</B></FONT></TD></TR>

<TR bgcolor="a2a3fe">
<TD colspan=7 ><FONT FACE=ARIAL SIZE=2><b>Borrowers:</b>
</FONT>
</TD>
</TR>


<TR bgcolor="a2a3fe">
<TD ><FONT FACE=ARIAL SIZE=2>Last Name<br>
<INPUT NAME="blastname1" size=10 maxlength    =15 value="#blastname1#" message = "Borrower's last name is required." required =
                                Yes>
<input type="hidden" name="blastname1_required" value="Borrower's last name is required."></FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>First Name<br>
<INPUT NAME="bfirstname1" size=6 maxlength    =15 value="#bfirstname1#" message = "Borrower's first name is required." required
                                = Yes>
<input type="hidden" name="bfirstname1_required" value="Borrower's first name is required.">
</FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>Mi<br>
<INPUT NAME="bminame1" size=1 maxlength=1 VALUE="#bminame1#"></FONT>

</TD>

<TD ><FONT FACE=ARIAL SIZE=2>SSN<br>
<INPUT NAME="bssn1" size=10 maxlength             =15 value="#bssn1#" message =
                                "Please enter the borrower's social security no. in the format of xxx-xx-xxxx."
                                validate = social_security_number>
</FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>Home Phone<br>
<INPUT NAME="bhphone1" size=10 maxlength           =20  value="#bhphone1#" message =
                                "Please enter the borrower's home phone no. in the format of xxx-xxx-xxxx."
                                validate = telephone>
</FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>Work Phone<br>
<INPUT NAME="bwphone1" size=10 maxlength           =20 value="#bwphone1#" message =
                                "Please enter the borrower's work phone no. in the format of xxx-xxx-xxxx."
                                validate = telephone>
</FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>Ext.<br>
<INPUT NAME="bext1" size=4 maxlength="10" value="#bext1#" message       = "Please enter an integer for the borrower's Ext."
                                validate = integer>
<input type="hidden" name="bext1_integer" value="Please enter an integer for the borrower's Ext.">
</FONT>
</TD>
</TR>

<TR bgcolor="a2a3fe">
<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="blastname2" size=10 maxlength=15 VALUE="#blastname2#"></FONT>

</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="bfirstname2" size=6 maxlength=15 VALUE="#bfirstname2#"></FONT>

</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="bminame2" size=1 maxlength=15 VALUE="#bminame2#"></FONT>

</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="bssn2" size=10 maxlength            =15 value="#bssn2#" message =
                                "Please enter the borrower's social security no. in the format of xxx-xx-xxxx."
                                validate = social_security_number>
</FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="bhphone2" size=10 maxlength           =20 value="#bhphone2#" message =
                                "Please enter the borrower's home phone no. in the format of xxx-xxx-xxxx."
                                validate = telephone>
</FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="bwphone2" size=10 maxlength           =20 value="#bwphone2#" message =
                                "Please enter the borrower's work phone no. in the format of xxx-xxx-xxxx."
                                validate = telephone>
</FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="bext2" size=4 maxlength="10" value="#bext2#" message       = "Please enter an integer for the borrower's Ext."
                                validate = integer>
<input type="hidden" name="bext2_integer" value="Please enter an integer for the borrower's Ext."></FONT>
</TD>
</TR>


<TR bgcolor="a2a3fe">
<TD colspan=7 ><FONT FACE=ARIAL SIZE=2><b>Sellers:</b>
</FONT>
</TD>
</TR>

<TR bgcolor="a2a3fe">
<TD ><FONT FACE=ARIAL SIZE=2>Last Name<br>
<INPUT NAME="slastname1" size=10 maxlength=15 VALUE="#slastname1#"></FONT>

</TD>

<TD ><FONT FACE=ARIAL SIZE=2>First Name<br>
<INPUT NAME="sfirstname1" size=6 maxlength=15 VALUE="#sfirstname1#"></FONT>

</TD>

<TD ><FONT FACE=ARIAL SIZE=2>Mi<br>
<INPUT NAME="sminame1" size=1 maxlength=15 VALUE="#sminame1#"></FONT>

</TD>

<TD ><FONT FACE=ARIAL SIZE=2>SSN<br>
<INPUT NAME="sssn1" size=10 maxlength            =15 value="#sssn1#" message =
                                "Please enter the seller's social security no. in the format of xxx-xx-xxxx."
                                validate = social_security_number>
</FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>Home Phone<br>
<INPUT NAME="shphone1" size=10 maxlength           =20 value="#shphone1#" message =
                                "Please enter the seller's home phone no. in the format of xxx-xxx-xxxx."
                                validate = telephone>
</FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>Work Phone<br>
<INPUT NAME="swphone1" size=10 maxlength           =20 value="#swphone1#" message =
                                "Please enter the seller's work phone no. in the format of xxx-xxx-xxxx."
                                validate = telephone> </FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>Ext.<br>
<INPUT NAME="sext1" size=4 maxlength="10" value="#sext1#" message       = "Please enter an integer for the seller's Ext."
                                validate = integer>
<input type="hidden" name="sext1_integer" value="Please enter an integer for the seller's Ext.">
</FONT>
</TD>
</TR>


<TR bgcolor="a2a3fe">
<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="slastname2" size=10 maxlength=15 VALUE="#slastname2#"></FONT>

</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="sfirstname2" size=6 maxlength=15 VALUE="#sfirstname2#"></FONT>

</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="sminame2" size=1 maxlength=15 VALUE="#sminame2#"></FONT>

</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="sssn2" size=10 maxlength            =15 VALUE="#sssn2#" message =
                                "Please enter the seller's social security no. in the format of xxx-xx-xxxx."
                                validate = social_security_number> </FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="shphone2" size=10 maxlength           =20 VALUE="#shphone2#" message =
                                "Please enter the seller's home phone no. in the format of xxx-xxx-xxxx."
                                validate = telephone> </FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="swphone2" size=10 maxlength           =20 VALUE="#swphone2#" message =
                                "Please enter the seller's work phone no. in the format of xxx-xxx-xxxx."
                                validate = telephone>
</FONT>
</TD>

<TD ><FONT FACE=ARIAL SIZE=2>
<INPUT NAME="sext2" size=4 maxlength="10" VALUE="#sext2#" message       = "Please enter an integer for the seller's Ext."
                                validate = integer>
<input type="hidden" name="sext2_integer" value="Please enter an integer for the seller's Ext."></FONT>
</TD>
</TR>
</TABLE>



<!--- Property Addresses--->


<TABLE BORDER=1 CELLSPACING=0 width=520 bgcolor="a2a3fe">


<TR BGCOLOR="blue">
<TD ALIGN=middle colspan=2>
<FONT FACE=ARIAL SIZE=2 color="white">
<B>P R O P E R T Y  &nbsp; A D D R E S S </B></FONT>
</TD></TR>

<TR>
<TD bgcolor="a2a3fe" WIDTH=150 align=right>
<FONT FACE=ARIAL SIZE=2 color="black">Street Address:</FONT>
</TD>
<td>
<INPUT NAME="paddress" size=40 maxlength="50" VALUE="#paddress#" message   = "Property Address is required." required = yes>
<input type="hidden" name="paddress_required" value="Property Address is required.">
</td>
</TR>

<tr>
<td bgcolor="a2a3fe" align=right ><FONT FACE=ARIAL SIZE=2 color="black">
City, State,
                                Zip:</FONT>
  </td>
<td>
<INPUT NAME="pcity" size=19 maxlength="25" VALUE="#pcity#" message   = "Property city is required." required = yes>
<input type="hidden" name="pcity_required" value="Property city is required.">,

<input name="pstate" size=2 value="#pstate#">
<input type="hidden" name="pstate_required" value="Property state is required.">

<INPUT NAME="pzip" size=10 maxlength="10" VALUE="#pzip#" message   = "Property zip is required." required = yes>
<input type="hidden" name="pzip_required" value="Property zip is required.">
</td>
</tr>

<TR>
<TD bgcolor="a2a3fe" WIDTH=150 align=right>
<FONT FACE=ARIAL SIZE=2 color="black" >County:</FONT>
</TD>
<td><INPUT NAME="pcounty" size=40 maxlength=50 value="#pcounty#">

</td>
</TR>

<!---Delete 5/17/200 per request Steve Papermaster

<TR>
<TD bgcolor="a2a3fe" WIDTH=150 align=right>
<FONT FACE=ARIAL SIZE=2 color="black">Searched Before:</FONT>
</TD>
<td><select name="psearchbefore">
<option value="#psearchbefore#" selected>#psearchbefore#
<option value="U">Unknown
<option value="Y">Yes
<option value="N">No
</select>

</td>
</TR> --->


<tr>
<TD bgcolor="a2a3fe" WIDTH=150 align=right>
<FONT FACE=ARIAL SIZE=2 color="black" >Legal Description:</FONT>
</TD>
<td><input name="plegaldesc" size=50 maxlength=150 value="#plegaldesc#" >


</td>
</tr></CFOUTPUT>

</TABLE>


<TABLE BORDER=1 CELLSPACING=0 width=520 bgcolor="a2a3fe">


<TR BGCOLOR="blue">
<TD ALIGN=middle colspan=2>
<FONT FACE=ARIAL SIZE=2 color="white">
<B>C O M M E N T S </B></FONT>
</TD></TR>

<TR>
<TD bgcolor="a2a3fe" COLSPAN=2 align=middle><TEXTAREA cols=55 name=COMMENT rows=4 wrap=virtual></TEXTAREA></TD>
</TR>

</TABLE>







<TABLE BORDER=1 CELLPADDING=1 WIDTH=520 CELLSPACING=0 BGCOLOR=a2a3fe>
<TR><TD COLSPAN=4 BGCOLOR=blue ALIGN=middle><FONT FACE=ARIAL SIZE=3 color="white"><B>C L O S I N G</B></FONT></TD></TR>

<TR>
<TD width="209" align="right">
<FONT FACE=ARIAL SIZE=2>Requested Closing Date:</FONT></TD>
<TD colspan="2" align="left">
<select name="confirm_mon">
	 	<option value="">Month</option>
	   	<option value="Jan">January</option>
		<option value="Feb">February</option>
		<option value="Mar">March</option>
		<option value="Apr">April</option>
		<option value="May">May</option>
		<option value="Jun">June</option>
		<option value="Jul">July</option>
		<option value="Aug">August</option>
		<option value="Sep">September</option>
		<option value="Oct">October</option>
		<option value="Nov">November</option>
		<option value="Dec">December</option>
</select>
<select name="comfirm_day">
	 	<OPTION VALUE="">Day</OPTION>
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
<select name="confirm_year">
		<option value="">Year</option>
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
<TD align="right">
<FONT FACE=ARIAL SIZE=2>Closing Time:</font>
<SELECT name="closingtime">
<option value="">
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
</TD>
</TR>




<!---Delete 5/17/200 per request Steve Papermaster

 <TR>
<TD width="140" align="right">
<FONT FACE=ARIAL SIZE=2>Closing Type:</FONT></TD>
<TD colspan=3><SELECT NAME="ClosingType">
                <OPTION VALUE="Complete Closing"
                                selected>Complete Closing
                <OPTION VALUE="Non-Disbursement Closing with Prop\Title">Non-Disbursement Closing with Prop\Title
                <OPTION VALUE="Non-Disbursement Closing only">Non-Disbursement Closing only
                </SELECT></TD>
</TR> --->




<TR><TD width="209" align="right"><FONT FACE=ARIAL SIZE=2>Closing Option:</FONT></TD>
        <TD colspan=3><SELECT NAME="ClosingOption" VALUE = >
                <OPTION VALUE="Attorney/Title Agent"
                                selected>Attorney/Title Agent
				<OPTION VALUE="Mail Away">Mail Away</SELECT></TD></TR>


<TR><TD width="209" ALIGN=right><FONT FACE=ARIAL SIZE=2>Loan Type:</FONT></TD>
         <TD colspan=3><SELECT NAME="ClosingLoanType">
                <OPTION VALUE="Purchase" selected>Purchase
				<OPTION VALUE="Refinance">Refinance
                <OPTION VALUE="Home Equity">Home Equity
				</SELECT></TD></TR>


<TR><TD bgcolor="a2a3fe" WIDTH=197 align=right><FONT FACE=ARIAL SIZE=2 color="black" >After-hours contact # :<br>(Processor or Loan Officer)</FONT></TD>
<td colspan=3><INPUT NAME="phonecontact" SIZE=20 MAXLENGTH=40 value=""></TD></TR>

<TD width="209" align="right">
<FONT FACE=ARIAL SIZE=2>Date package will be ready:</FONT></TD>
<TD colspan=3 align="left">
<select name="select_mon">
	 	<option value="">Month</option>
	   	<option value="Jan">January</option>
		<option value="Feb">February</option>
		<option value="Mar">March</option>
		<option value="Apr">April</option>
		<option value="May">May</option>
		<option value="Jun">June</option>
		<option value="Jul">July</option>
		<option value="Aug">August</option>
		<option value="Sep">September</option>
		<option value="Oct">October</option>
		<option value="Nov">November</option>
		<option value="Dec">December</option>
</select>
<select name="select_day">
	 	<OPTION VALUE="">Day</OPTION>
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
<select name="select_year">
		<option value="">Year</option>
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

</select></td></tr>
<TR><TD bgcolor="a2a3fe" WIDTH=209 align=right><FONT FACE=ARIAL SIZE=2 color="black" >How will package be sent:</FONT></TD>
<td colspan=3><INPUT NAME="packagesent" SIZE=20 MAXLENGTH=40 value=""></TD></TR>

<TR><TD bgcolor="a2a3fe" WIDTH=209 align=left><FONT FACE=ARIAL SIZE=2 color="black" >Other contact num for the borrower:</FONT></TD>
<td colspan=3><INPUT NAME="borrowernum" SIZE=20 MAXLENGTH=40 value=""></TD></TR>

<TR><TD bgcolor="a2a3fe" WIDTH=209 align=right><FONT FACE=ARIAL SIZE=2 color="black" >Lender contact for Loan Docs:</FONT></TD>
<td colspan=3><INPUT NAME="lendernum" SIZE=20 MAXLENGTH=40 value=""></TD></TR>
</TABLE>

<TABLE BORDER=0 CELLSPACING=0 width=520 bgcolor="a2a3fe">


<TR><TD ALIGN=middle WIDTH=520 ><FONT FACE=ARIAL SIZE=2><B>Special Instructions </B></FONT></TD></TR>
<TR><TD ALIGN=middle><TEXTAREA cols=42 name=instructions rows=4 wrap=virtual></TEXTAREA></TD></TR>
</TABLE>
<!-- E-MAIL VERIFICATION -->

<cfoutput query = getcustomerinfo>
<TABLE BORDER=1 CELLPADDING=1 WIDTH=520 CELLSPACING=0 BGCOLOR=a2a3fe>
<TR BGCOLOR="blue"><TD ALIGN=middle><FONT FACE=ARIAL SIZE=3 color="white"><B>Verify Order was Received</B></FONT></TD></TR>
<TR><TD WIDTH=520 ALIGN=middle><FONT FACE=ARIAL SIZE=2>Your E-Mail Address:</FONT><INPUT NAME="Verifyemail" SIZE=40 MAXLENGTH=40 value="#verifyemail#"></TD></TR>
<TR><TD WIDTH=520 ALIGN=middle><FONT SIZE=-1>You will receive an e-mail when the order is received by us.</FONT></TD></TR>
</TABLE></CFOUTPUT>





<CENTER>
<FONT FACE=ARIAL SIZE=2>IMPORTANT! Only Click Submit Once.<BR>Double clicking causes duplicate orders.</FONT><BR>


<cfoutput>
<input type="hidden" name="orderid" value="#orderid#">
<input type="hidden" name="loginid" value="#loginid#">
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#"></CFOUTPUT>


<INPUT NAME="Submit" TYPE="submit" VALUE="Submit Order"> <INPUT TYPE="reset" VALUE="Clear Form"><BR>
</CENTER>
<HR>
                        </FORM>


<table border=0 align=center>
<FORM METHOD="post" ACTION="./account_menu.cfm">


<cfoutput>
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#"></CFOUTPUT>
                            <TBODY>


<TR ALIGN=middle><TD><input type="submit"  value="Back to Menu"></TD></TR>
</FORM></TABLE>

<HR>
                        </CENTER>
</td></tr></table></TD></TR></TBODY></TABLE></NOBR>

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
</html>



