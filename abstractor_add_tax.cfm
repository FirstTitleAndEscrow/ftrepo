
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>


<TITLE><cfoutput>#session.site.short_name#</cfoutput> Abstractor Services</TITLE>

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
	<CFINCLUDE TEMPLATE="./includes/title_top_nava.cfm">
<CENTER>
<table width=798 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=798 align=center valign=top bgcolor=d3d3d3>
			<font size=2 color=green face=arial><b>Add Tax</b><font size=2 color=black face=arial>
			<p>
			<!--- Company - <B>#read_companies.company#</B> --->
			<p>
			Enter the tax info in the form below for order number <font size=2 color=green face=arial><b>#url.rec_id#</b>.
		</td>
	</tr>
</CFOUTPUT>

</table></CENTER>

		</td>
	</tr>

	<tr>
		<td width=798 align=center valign=top bgcolor=e6e6e6>

<center>
<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>



	<CFFORM METHOD=POST ACTION="https://#cgi.server_name#/abstractor_add_tax_submit.cfm?rec_id=#url.rec_id#" name="frm" ENABLECAB="Yes">


	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=85>


		</td>
	</tr>


<!--- ===/ LOAN PROCESSOR INFO \=== --->

	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Tax</B> Information :


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property Type


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
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
			<OPTION VALUE=""></OPTION>
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax ID #


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT Required="Yes" Message="You must enter a Tax ID" type=text name="taxid"  size=40 maxlength=50
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Parcel


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="parcel" Required="Yes" Message="You must enter a GRANTOR2 NAME"  size=20 maxlength=30
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Exempt


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>


			</SELECT>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Exempt Amount


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="amount"  size=30 maxlength=50
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Exempt Type


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT Required="Yes" Message="You must enter an exempt type" type=text name="extype"  size=40 maxlength=50
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Land Assessments


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="land"  size=30 maxlength=50
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Improvements Assessments


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="impass"  size=30 maxlength=50
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Other Assessments


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="other"  size=30 maxlength=50
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Total Assessed Value


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="val"  size=30 maxlength=50
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Amount


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="tx"  size=30 maxlength=50
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Year


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
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


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Due Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Taxes Paid Through


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Status


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
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
			<OPTION VALUE=""></OPTION>
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Delinquent Tax Amount


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="txamt"  size=30 maxlength=50
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
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Delinquent Tax Year


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
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


		</td>
	</tr>
	<tr>
	<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Additional Info

		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="info" value=""  size=40 maxlength=183
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
	<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="info2" value=""  size=40 maxlength=183
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

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_add.gif" border=0><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>



</table>
</center>
</CFFORM>
		</td>

	</tr>
</table>
</center>

	</td>
</tr>
</table>
</center>
	</td>
</tr>
</table>
</center>

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


