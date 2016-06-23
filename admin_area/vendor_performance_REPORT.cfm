<CFPARAM NAME="vendor"     DEFAULT="">
<CFPARAM NAME="state"       DEFAULT="">
<CFPARAM NAME="foo"       DEFAULT="">
<CFPARAM NAME="a_trigger"       DEFAULT="0">

<CFQUERY datasource="#request.dsn#" NAME="read_county_list">
	SELECT DISTINCT COUNTY
	FROM zip_info
	ORDER BY county ASC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
	SELECT *
	FROM first_title_states
	ORDER BY st_abbrev ASC
</CFQUERY>

<CFIF #vendor# eq "Abstractors">
	<CFQUERY datasource="#request.dsn#" NAME="read_vendor_list">
		SELECT distinct *
		FROM Abstractors
		ORDER BY company ASC
	</CFQUERY>
<CFELSEIF #vendor# eq "Closers">
	<CFQUERY datasource="#request.dsn#" NAME="read_vendor_list">
		SELECT distinct *
		FROM Closer
		ORDER BY company ASC
	</CFQUERY>
<CFELSE>
	<CFQUERY datasource="#request.dsn#" NAME="read_vendor_list">
		SELECT distinct *
		FROM Appraisers
		ORDER BY company ASC
	</CFQUERY>		
</CFIF>
		
<CFQUERY datasource="#request.dsn#" NAME="read_county_list">
	SELECT DISTINCT COUNTY
	FROM zip_info
	ORDER BY county ASC
</CFQUERY>
			
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>1st Title & Escrow, Inc. Vendor Area</title>

<script type="text/javascript">
function monthresult() {
var frm;
frm = document.frm;


if (frm.confirm_mon.value != 'Month') {

  frm.confirm_mon_to.value = frm.confirm_mon.options[frm.confirm_mon.selectedIndex].value;

}


}

</script>
<script type="text/javascript">
function dayresult() {
var frm;
frm = document.frm;
if (frm.comfirm_day.value != 'Day') {
 frm.comfirm_day_to.value = frm.comfirm_day.options[frm.comfirm_day.selectedIndex].value;
}
}
</script>
<script type="text/javascript">
function yearresult() {
var frm;
frm = document.frm;
if (frm.confirm_year.value != 'Year') {

frm.confirm_year_to.value = frm.confirm_year.options[frm.confirm_year.selectedIndex].value;
}
}

</script>
<script type="text/javascript">
function checkState() {
var frm;
frm = document.frm;

if (frm.state.value != 'N/A')
{
var foo;

location.href='vendor_performance_report.cfm?uid=<cfoutput>#url.uid#</cfoutput>&vendor=<cfoutput>#vendor#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=10&foo=' + frm.state.value;
}

}
</script>
 <script type="text/javascript">
function checkCounty() {
var frm;
frm = document.frm;

if (frm.county.value != 'N/A')
{
var coo;

location.href='vendor_performance_report.cfm?uid=<cfoutput>#url.uid#</cfoutput>&vendor=<cfoutput>#vendor#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=11&foo=' + frm.state.value + '&coo=' + frm.county.value;
}

}
</script>
</head>
<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
<CENTER>
<CENTER>
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width="98%" align=center valign=top>
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width="98%" align=center valign=top bgcolor=white>
		
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width="100%" align=left valign=top bgcolor=white>
			<FONT FACE=ARIAL SIZE=2 color="black"><br>
			<CENTER><B>Vendor Performance <CFOUTPUT>#Vendor#</CFOUTPUT></B></CENTER>
		</TD>
	</TR>
<cfFORM name = "frm"  ACTION="./vendor_performance_report_result.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1&Type=#Vendor#" METHOD=POST>
	<tr>
		<td width="100%" align=center valign=top bgcolor=d3d3d3>
<table width="100%" cellpadding=1 cellspacing=1 border=0>
<cfif #a_trigger# eq 10>
	<CFQUERY datasource="#request.dsn#" NAME="read_county_state">
		SELECT DISTINCT COUNTY
		FROM zip_info where state = '#foo#'
		ORDER BY county ASC
	</CFQUERY>		
	
	<CFIF #Vendor# eq "Abstractors">
		<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
			SELECT distinct company, abstractor_id
			FROM Abstractors_county
			where st_abbrev = '#foo#' 
			order by company
		</CFQUERY>
	</CFIF>
	<CFIF #Vendor# eq "Closers">
		<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
			SELECT distinct company, closer_id
			FROM closer_county
			where st_abbrev = '#foo#' 
			order by company
		</CFQUERY>
	</CFIF>
	<CFIF #Vendor# eq "Appraisers">
		<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
			SELECT distinct company, appraiser_ID
			FROM Appraisers_County
			where st_abbrev = '#foo#' 
			order by company
		</CFQUERY>
	</CFIF>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
				Select State   
				<select name="state" onChange="checkState()">
					<cfoutput><option value="#foo#" selected>#foo#</option></cfoutput>
					<option value="AK">AK</option>
					<option value="AL">AL</option>
					<option value="AR">AR</option>
					<option value="AZ">AZ</option>
					<option value="CA">CA</option>
					<option value="CO">CO</option>
					<option value="CT">CT</option>
					<option value="DC">DC</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="GU">GU</option>
					<option value="HI">HI</option>
					<option value="IA">IA</option>
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="MA">MA</option>
					<option value="MD">MD</option>
					<option value="ME">ME</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MO">MO</option>
					<option value="MS">MS</option>
					<option value="MT">MT</option>
					<option value="NC">NC</option>
					<option value="ND">ND</option>
					<option value="NE">NE</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>
					<option value="NV">NV</option>
					<option value="NY">NY</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="PR">PR</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VA">VA</option>
					<option value="VI">VI</option>
					<option value="VT">VT</option>
					<option value="WA">WA</option>
					<option value="WI">WI</option>
					<option value="WV">WV</option>
					<option value="WY">WY</option>
				</select></div>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
				  <INPUT class=form type=hidden value="" name=temp>
				Select County   <select name="county" onChange="checkCounty()">
							<option value="">N/A</option>
					<cfoutput query="read_county_state"><option value="#county#">#county#</option></cfoutput>
					
				</select></div>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
			<CFIF #vendor# eq "Abstractors">
				Select Abstractor   
				<select name="vendor">
					<option value="">N/A</option>
					<cfoutput query="read_all_abstractors">
					<option value="#abstractor_ID#">#COMPANY#</option>
					</cfoutput>
				<CFELSEIF #Vendor# eq "Closers">
					Select Closer
					<select name="vendor">
					<option value="">N/A</option>
					<cfoutput query="read_all_abstractors">	
					<option value="#closer_ID#">#COMPANY#</option>
					</cfoutput>
				<CFELSE>
					Select Appraiser
					<select name="vendor">
					<option value="">N/A</option>
					<cfoutput query="read_all_abstractors">
					<option value="#appraiser_ID#">#COMPANY#</option>
					</cfoutput>
				</CFIF>
				
			</select></div>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
			<b>FROM</b>
			<select name="confirm_mon" onChange="monthresult()"
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
			<option value="Month">Month</option>

		
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

<select name="comfirm_day" onChange="dayresult()"
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



<OPTION VALUE="Day">Day</OPTION>

	 	
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
<select name="confirm_year" onChange="yearresult()"
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
		


<option value="Year">Year</option>

		
		
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>TO</b>

		<select name="confirm_mon_to"
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

<option value="Month">Month</option>

		
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

<select name="comfirm_day_to"
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



<OPTION VALUE="Day">Day</OPTION>

	 	
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
<select name="confirm_year_to"
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
		


<option value="Year">Year</option>

		
		
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
<cfelseif #a_trigger# eq 11>
	<CFQUERY datasource="#request.dsn#" NAME="read_county_state">
		SELECT DISTINCT COUNTY
		FROM zip_info where state = '#foo#'
		ORDER BY county ASC
	</CFQUERY>		
		
	<CFIF #Vendor# eq "Abstractors">
		<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
			SELECT distinct company, abstractor_id
			FROM Abstractors_county
			where st_abbrev = '#foo#' AND ct_name = '#coo#'
			order by company
		</CFQUERY>
	</CFIF>
	<CFIF #Vendor# eq "Closers">
		<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
			SELECT distinct company, closer_id
			FROM Closer_county
			where st_abbrev = '#foo#' AND ct_name = '#coo#'
			order by company
		</CFQUERY>
	</CFIF>
	<CFIF #Vendor# eq "Appraisers">
		<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
			SELECT distinct company, appraiser_ID
			FROM Appraisers_county
			where st_abbrev = '#foo#' AND ct_name = '#coo#'
			order by company
		</CFQUERY>
	</CFIF>	
	
	
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
				Select State   <select name="state" onChange="checkState()">
					<cfoutput><option value="#foo#" selected>#foo#</option></cfoutput>
					<option value="AK">AK</option>
					<option value="AL">AL</option>
					<option value="AR">AR</option>
					<option value="AZ">AZ</option>
					<option value="CA">CA</option>
					<option value="CO">CO</option>
					<option value="CT">CT</option>
					<option value="DC">DC</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="GU">GU</option>
					<option value="HI">HI</option>
					<option value="IA">IA</option>
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="MA">MA</option>
					<option value="MD">MD</option>
					<option value="ME">ME</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MO">MO</option>
					<option value="MS">MS</option>
					<option value="MT">MT</option>
					<option value="NC">NC</option>
					<option value="ND">ND</option>
					<option value="NE">NE</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>
					<option value="NV">NV</option>
					<option value="NY">NY</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="PR">PR</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VA">VA</option>
					<option value="VI">VI</option>
					<option value="VT">VT</option>
					<option value="WA">WA</option>
					<option value="WI">WI</option>
					<option value="WV">WV</option>
					<option value="WY">WY</option>
				</select></div>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
				  <INPUT class=form type=hidden value="" name=temp>
				Select County   <select name="county" onChange="checkCounty()">
							<cfoutput><option value="#coo#">#coo#</option></cfoutput>
					<cfoutput query="read_county_state"><option value="#county#">#county#</option></cfoutput>
					
				</select></div>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
			<CFIF #vendor# eq "Abstractors">
				Select Abstractor   
				<select name="vendor">
					<option value="">N/A</option>
					<cfoutput query="read_all_abstractors">
					<option value="#abstractor_ID#">#COMPANY#</option>
					</cfoutput>
				<CFELSEIF #Vendor# eq "Closers">
					Select Closer
					<select name="vendor">
					<option value="">N/A</option>
					<cfoutput query="read_all_abstractors">	
					<option value="#closer_ID#">#COMPANY#</option>
					</cfoutput>
				<CFELSE>
					Select Appraiser
					<select name="vendor">
					<option value="">N/A</option>
					<cfoutput query="read_all_abstractors">
					<option value="#appraiser_ID#">#COMPANY#</option>
					</cfoutput>
				</CFIF>
				
			</select></div>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
				<b>FROM</b>
		<select name="confirm_mon" onChange="monthresult()"
		
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
<option value="Month">Month</option>

		
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

<select name="comfirm_day" onChange="dayresult()"
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



<OPTION VALUE="Day">Day</OPTION>

	 	
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
<select name="confirm_year" onChange="yearresult()"
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
		


<option value="Year">Year</option>

		
		
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>TO</b>

		<select name="confirm_mon_to"
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

<option value="Month">Month</option>

		
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

<select name="comfirm_day_to"
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



<OPTION VALUE="Day">Day</OPTION>

	 	
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
<select name="confirm_year_to"
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
		


<option value="Year">Year</option>

		
		
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
<cfelse>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
				  <INPUT class=form type=hidden value="" name=temp>
				Select State   <select name="state" onChange="checkState()">
					<option value="" selected>N/A</option>
					<option value="AK">AK</option>
					<option value="AL">AL</option>
					<option value="AR">AR</option>
					<option value="AZ">AZ</option>
					<option value="CA">CA</option>
					<option value="CO">CO</option>
					<option value="CT">CT</option>
					<option value="DC">DC</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="GU">GU</option>
					<option value="HI">HI</option>
					<option value="IA">IA</option>
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="MA">MA</option>
					<option value="MD">MD</option>
					<option value="ME">ME</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MO">MO</option>
					<option value="MS">MS</option>
					<option value="MT">MT</option>
					<option value="NC">NC</option>
					<option value="ND">ND</option>
					<option value="NE">NE</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>
					<option value="NV">NV</option>
					<option value="NY">NY</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="PR">PR</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VA">VA</option>
					<option value="VI">VI</option>
					<option value="VT">VT</option>
					<option value="WA">WA</option>
					<option value="WI">WI</option>
					<option value="WV">WV</option>
					<option value="WY">WY</option>
				</select></div>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
				
				Select County   <select name="county">
							<option value="">N/A</option>
					<cfoutput query="read_county_list"><option value="#county#">#county#</option></cfoutput>
					
				</select></div>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
			<CFIF #vendor# eq "Abstractors">
				Select Abstractor   
				<select name="vendor">
					<option value="">N/A</option>
					<cfoutput query="read_vendor_list">
					<option value="#abstractor_ID#">#COMPANY#</option>
					</cfoutput>
				<CFELSEIF #Vendor# eq "Closers">
					Select Closer
					<select name="vendor">
					<option value="">N/A</option>
					<cfoutput query="read_vendor_list">	
					<option value="#closer_ID#">#COMPANY#</option>
					</cfoutput>
				<CFELSE>
					Select Appraiser
					<select name="vendor">
					<option value="">N/A</option>
					<cfoutput query="read_vendor_list">
					<option value="#appraiser_ID#">#COMPANY#</option>
					</cfoutput>
				</CFIF>
				
			</select></div>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
				<b>FROM</b>
		<select name="confirm_mon" onChange="monthresult()"
		
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
<option value="Month">Month</option>

		
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

<select name="comfirm_day" onChange="dayresult()"
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



<OPTION VALUE="Day">Day</OPTION>

	 	
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
<select name="confirm_year" onChange="yearresult()"
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
		


<option value="Year">Year</option>

		
		
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>TO</b>

		<select name="confirm_mon_to"
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

<option value="Month">Month</option>

		
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

<select name="comfirm_day_to"
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



<OPTION VALUE="Day">Day</OPTION>

	 	
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
<select name="confirm_year_to"
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
		


<option value="Year">Year</option>

		
		
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
</cfif>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
<INPUT TYPE=image src="./images/button_proceed.gif" border=0> 	
		</td>
	</tr>

</cfform>
</table>
		</TD>
	</TR>
</table>
		</TD>
	</TR>
</table>
	
</BODY>
</HTML>
	
	
	