<CFPARAM NAME="a_state"     DEFAULT="None">
<CFPARAM NAME="a_zip"       DEFAULT="None">
<CFPARAM NAME="a_county"    DEFAULT="None">
<CFPARAM NAME="a_city"      DEFAULT="None">
<CFPARAM NAME="a_area_code" DEFAULT="None">
<CFPARAM NAME="confirm_mon" DEFAULT="">
<CFPARAM NAME="confirm_mon_to" DEFAULT="">
<CFPARAM NAME="comfirm_day" DEFAULT="">
<CFPARAM NAME="comfirm_day_to" DEFAULT="">
<CFPARAM NAME="confirm_year" DEFAULT="">
<CFPARAM NAME="confirm_year_to" DEFAULT="">
<CFPARAM NAME="a_trigger"   DEFAULT="1">
<CFPARAM NAME="r_count"     DEFAULT="0">
<CFPARAM NAME="comp_id"     DEFAULT="">
<CFPARAM NAME="product" DEFAULT="">
<cfparam name="a_flag" default="1">

<!--- ===================================================== --->
<cfset comp_id = #url.comp_id#>

<cfquery datasource="#request.dsn#" name="getuser">
	select * from first_admin
	where id = #session.ft_user_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
			SELECT *
			FROM first_title_states_all
			ORDER BY st_abbrev ASC
</CFQUERY>

<CFSET a_state_abbrev = ArrayNew(1)>
<CFSET a_count = "1">

<CFOUTPUT QUERY="read_state_list">
	<CFIF #a_count# EQ "1">
		<CFSET a_state_abbrev[a_count] = "none">
	<CFELSE>
		<CFSET a_state_abbrev[a_count] = #st_abbrev#>
	</CFIF>

	<CFSET a_count = #a_count# + "1">
</CFOUTPUT>

<!---If not all of the companies were selected --->
<cfif #comp_id# NEQ "ALL">
	<cfif #a_flag# eq 1>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where comp_id = 0
			ORDER BY prop_id
		</CFQUERY>
	</cfif>

	<cfif #a_flag# eq 2>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where comp_id = 0 and appraisal_status = 'Closing Requested'
			ORDER BY prop_id
		</CFQUERY>
	</cfif>

	<cfif #a_flag# eq 3>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where comp_id = 0 and appraisal_status = 'Closer Assigned'
			ORDER BY Prop_id
		</CFQUERY>
	</cfif>

	<cfif #a_flag# eq 4>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where comp_id = 0 and appraisal_status = 'Closing Scheduled'
			ORDER BY prop_id
		</CFQUERY>
	</cfif>

	<cfif #a_flag# eq 5>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where comp_id = 0 and appraisal_status = 'Closing Scheduled'
			ORDER BY prop_id
		</CFQUERY>
	</cfif>

	<cfif #a_flag# eq 6>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where comp_id = 0 and appraisal_status = 'Loan Closed'
			ORDER BY prop_id
		</CFQUERY>
	</cfif>

	<cfif #a_flag# eq 7>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where appraisal_status = 'In Process' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed' or appraisal_status = 'Report Faxed'
			ORDER BY prop_id
		</CFQUERY>
	</cfif>

<cfelse>
	<!---All companies selected--->
	<!---If these people select all companies limit the companies they can see (added by Harry 04/02/04) 92 ?,
		93 - Cindy Mills, 185 - Cindy Miropol --->
	<cfif #a_flag# eq 1>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property
			where 0 = 0
			<cfif #url.uid# eq 185>
				and (comp_ID = 404 or comp_ID = 408 or comp_id = 397)
			</cfif>
			ORDER BY prop_id
		</CFQUERY>
	</cfif>

	<cfif #a_flag# eq 2>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where appraisal_status = 'Closing Requested'

			<cfif #url.uid# eq 185>
				and (comp_ID = 404 or comp_ID = 408 or comp_id = 397)
			</cfif>
			ORDER BY Prop_id
		</CFQUERY>
	</cfif>

	<cfif #a_flag# eq 3>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where appraisal_status = 'Closer Assigned'

			<cfif #url.uid# eq 185>
				and (comp_ID = 404 or comp_ID = 408 or comp_id = 397)
			</cfif>
			ORDER BY Prop_id
		</CFQUERY>
	</cfif>

	<cfif #a_flag# eq 4>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where appraisal_status = 'Closing Scheduled'

			<cfif #url.uid# eq 185>
				and (comp_ID = 404 or comp_ID = 408 or comp_id = 397)
			</cfif>
			ORDER BY Prop_id
		</CFQUERY>
	</cfif>

	<cfif #a_flag# eq 5>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where appraisal_status = 'Closing Scheduled'

			<cfif #url.uid# eq 185>
				and (comp_ID = 404 or comp_ID = 408 or comp_id = 397)
			</cfif>
			ORDER BY Prop_id
		</CFQUERY>
	</cfif>

	<cfif #a_flag# eq 6>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where appraisal_status = 'Loan Closed'

			<cfif #url.uid# eq 185>
				and (comp_ID = 404 or comp_ID = 408 or comp_id = 397)
			</cfif>
			ORDER BY Prop_id
		</CFQUERY>
	</cfif>
	<cfif #a_flag# eq 7>
		<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
			SELECT prop_id
			FROM Property where appraisal_status = 'In Process' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed' or appraisal_status = 'Report Faxed'

			<cfif #url.uid# eq 185>
				and (comp_ID = 404 or comp_ID = 408 or comp_id = 397)
			</cfif>
			ORDER BY prop_id
		</CFQUERY>
	</cfif>
</CFIF>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Closing Search Form</title>

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
function prodSelect() {
var frm;
frm = document.frm;


if (frm.product.value == 'All') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/calendar_search_prop.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_flag=1&comp_id=<cfoutput>#comp_id#</cfoutput>";

}
if (frm.product.value == 'Closing Requested') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/calendar_search_prop.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_flag=2&comp_id=<cfoutput>#comp_id#</cfoutput>";

}
if (frm.product.value == 'Closing Assigned') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/calendar_search_prop.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_flag=3&comp_id=<cfoutput>#comp_id#</cfoutput>";

}
if (frm.product.value == 'Closing Submitted') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/calendar_search_prop.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_flag=4&comp_id=<cfoutput>#comp_id#</cfoutput>";

}
if (frm.product.value == 'Closing Scheduled') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/calendar_search_prop.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_flag=5&comp_id=<cfoutput>#comp_id#</cfoutput>";

}
if (frm.product.value == 'Loan Closed') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/calendar_search_prop.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_flag=6&comp_id=<cfoutput>#comp_id#</cfoutput>";

}
if (frm.product.value == 'Unrequested Closings') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/calendar_search_prop.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_flag=7&comp_id=<cfoutput>#comp_id#</cfoutput>";

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
<cfoutput>
						<table width="100%" bgcolor="white">
							<tr>
								<td>
								</td>
								<td>
									<div align="center">
									<font color = "blue" size="3"><b>User logged in: #getuser.fname#&nbsp;#getuser.lname# </b></font>
									</div>
								</td>
							</tr>
						</table>
</cfoutput>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
						<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
							<tr>
								<td width="100%" align=left valign=top bgcolor=f1f1f1>
									<FONT FACE=ARIAL SIZE=2 color="black">
									<CENTER><B>Status</B></CENTER>
								</TD>
							</TR>
<cfif #comp_id# NEQ "ALL">
	<CFFORM NAME="frm" ACTION="./calendar_search_prop.cfm?uid=#getuser.id#&al=#URL.al#&comp_id=#comp_id#&a_trigger=2" METHOD=POST>

		<cfquery datasource="#request.dsn#" name="getuser">
			select * from first_admin
			where id = #session.ft_user_id#
		</cfquery>

		<cfif #a_trigger# eq "2">
							<tr>
								<td width="100%" align=left valign=top bgcolor=elelel>
									<FONT FACE=ARIAL SIZE=2 color="black">
									<CENTER>
									<select name="product" onChange="prodSelect()"
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
									<cfoutput>
									<OPTION VALUE="#product#" selected>#product#</OPTION>
									</cfoutput>
	 								<OPTION VALUE="All">All</OPTION>
									<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
									<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
									<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
									<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
									<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
									<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>
									</select>
									</CENTER>
								</TD>
							</TR>
							<tr>
								<td width="100%" align=center valign=top bgcolor=d3d3d3>
									<table width="100%" cellpadding=1 cellspacing=1 border=0>
										<tr>
											<td bgcolor=d3d3d3 width="100%" align=center valign=top>
												<FONT FACE=verdana SIZE=1 color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<FONT FACE=verdana SIZE=1 color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<FONT FACE=verdana SIZE=1 color="black">Order Number
											</td>
										</tr>
										<tr>
											<cfoutput>
											<td bgcolor=d3d3d3 width="100%" align=center valign=top>
											<INPUT TYPE=TEXT NAME="a_county" VALUE="#a_county#" MaxLength=50 Size=16
												style="font-size: 9;
												font-family: verdana;
												font-style: normal;
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
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

											<INPUT TYPE=TEXT NAME="a_zip" VALUE="#a_zip#" MaxLength=50 Size=16
												style="font-size: 9;
												font-family: verdana;
												font-style: normal;
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
											</cfoutput>
					 						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

											<select name="order"
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
											<cfoutput>
											<OPTION VALUE="#order#" selected>0232#order#</OPTION>
											</cfoutput>
											<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#prop_ID#">0232#prop_ID#</OPTION></CFOUTPUT>
											</SELECT>
											</td>
										</tr>
									</table>
									<table width="100%" cellpadding=1 cellspacing=1 border=0>
										<TR>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
										<cfoutput>
											<OPTION VALUE="#confirm_mon#" selected>#confirm_mon#</OPTION></cfoutput>
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

										<cfoutput>
												<OPTION VALUE="#comfirm_day#" selected>#comfirm_day#</OPTION></cfoutput>
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

											<cfoutput>
											<OPTION VALUE="#confirm_year#" selected>#confirm_year#</OPTION></cfoutput>
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
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>TO</b>
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

											<cfoutput>
												<OPTION VALUE="#confirm_mon_to#" selected>#confirm_mon_to#</OPTION></cfoutput>
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

											<cfoutput>
											<OPTION VALUE="#comfirm_day_to#" selected>#comfirm_day_to#</OPTION></cfoutput>
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

											<cfoutput>
											<OPTION VALUE="#confirm_year_to#" selected>#confirm_year_to#</OPTION></cfoutput>
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
										</tr>
										<tr>

		<cfelse>
										<tr>
											<td width="100%" align=left valign=top bgcolor=elelel>
												<FONT FACE=ARIAL SIZE=2 color="black">
												<CENTER>
												<select name="product" onChange="prodSelect()"
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
			 <cfif #a_flag# eq "1">
												<OPTION VALUE="All" selected>All</OPTION>
												<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
												<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
												<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
												<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
												<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
												<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>

			<cfelseif #a_flag# eq "2">
												<OPTION VALUE="Closing Requested" selected>Closing Requested</OPTION>
												<OPTION VALUE="All">All</OPTION>
												<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
												<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
												<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
												<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
												<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>

			<cfelseif #a_flag# eq "3">
												<OPTION VALUE="Closing Assigned" selected>Closing Assigned</OPTION>
												<OPTION VALUE="All">All</OPTION>
												<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
												<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
												<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
												<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
												<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>

			<cfelseif #a_flag# eq "4">
												<OPTION VALUE="Closing Submitted" selected>Closing Submitted</OPTION>
												<OPTION VALUE="All">All</OPTION>
												<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
												<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
												<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
												<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
												<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>

			<cfelseif #a_flag# eq "5">
												<OPTION VALUE="Closing Scheduled" selected>Closing Scheduled</OPTION>
												<OPTION VALUE="All">All</OPTION>
												<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
												<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
												<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
												<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
												<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>

			<cfelseif #a_flag# eq "6">
												<OPTION VALUE="Loan Closed" selected>Loan Closed</OPTION>
												<OPTION VALUE="All">All</OPTION>
												<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
												<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
												<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
												<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
												<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>
			<cfelse>

												<OPTION VALUE="Unrequested Closings" selected>Unrequested Closings</OPTION>
												<OPTION VALUE="All">All</OPTION>
												<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
												<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
												<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
												<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
												<OPTION VALUE="Loan Closed" >Loan Closed</OPTION>
			</cfif>


												</select>
												</CENTER>
											</TD>
										</TR>
										<tr>
											<td width="100%" align=center valign=top bgcolor=d3d3d3>
												<table width="100%" cellpadding=1 cellspacing=1 border=0>
													<tr>
														<td bgcolor=d3d3d3 width="100%" align=center valign=top>
															<FONT FACE=verdana SIZE=1 color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<FONT FACE=verdana SIZE=1 color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<FONT FACE=verdana SIZE=1 color="black">Order Number
														</td>
													</tr>
													<tr>
														<td bgcolor=d3d3d3 width="100%" align=center valign=top>
															<INPUT TYPE=TEXT NAME="a_county" VALUE="none" MaxLength=50 Size=16
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
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
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

															<INPUT TYPE=TEXT NAME="a_zip" VALUE="none" MaxLength=50 Size=16
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
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
					 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

															<select name="order"
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

															<OPTION VALUE="NONE">N/A</OPTION>
																<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#prop_ID#">0232#prop_ID#</OPTION></CFOUTPUT>
															</SELECT>
														</td>
													</tr>
												</table>
												<table width="100%" cellpadding=1 cellspacing=1 border=0>
													<TR>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>TO</b>

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





		</tr>
<tr>




		</cfif>



						<td bgcolor=d3d3d3 width="90%" align=right valign=top>
						<INPUT TYPE=image src="./images/button_search.gif" border=0>
				</td>

</tr>


			</table>
</CFFORM>
<cfelse>

<cfFORM NAME="frm" ACTION="./calendar_search_prop.cfm?uid=#getuser.id#&al=#URL.al#&comp_id=#comp_id#&a_trigger=2" METHOD=POST>

			<tr>
			<td width="100%" align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER>
						<cfif #a_trigger# eq 2>
						<select name="product" onChange="prodSelect()"
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

				<cfoutput><OPTION VALUE="#product#" selected>#product#</OPTION></cfoutput>
								<OPTION VALUE="All">All</OPTION>
								<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
								<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
								<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
								<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
								<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
								<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>

</select></CENTER>
			</TD>
		</TR>


	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=d3d3d3 width="100%" align=center valign=top>
						<FONT FACE=verdana SIZE=1 color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<FONT FACE=verdana SIZE=1 color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<FONT FACE=verdana SIZE=1 color="black">Order Number
						</td>



					<tr>
					<cfoutput>
						<td bgcolor=d3d3d3 width="100%" align=center valign=top>
							<INPUT TYPE=TEXT NAME="a_county" VALUE="#a_county#" MaxLength=50 Size=16
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<INPUT TYPE=TEXT NAME="a_zip" VALUE="#a_zip#" MaxLength=50 Size=16
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
					 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</cfoutput>
									<select name="order"

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
<cfoutput><OPTION VALUE="#order#" selected>#order#</OPTION></cfoutput>
								<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#prop_ID#">0232#prop_ID#</OPTION></CFOUTPUT>
							</SELECT>

						</td>
		</tr>
		</table>
<table width="100%" cellpadding=1 cellspacing=1 border=0>

<TR>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>
		FROM</b><select name="confirm_mon" onChange="monthresult()"
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
<cfoutput><OPTION VALUE="#confirm_mon#" selected>#confirm_mon#</OPTION></cfoutput>


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




<cfoutput><OPTION VALUE="#comfirm_day#" selected>#comfirm_day#</OPTION></cfoutput>


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



<cfoutput><OPTION VALUE="#confirm_year#" selected>#confirm_year#</OPTION></cfoutput>



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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>TO</b>

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

<cfoutput><OPTION VALUE="#confirm_mon_to#" selected>#confirm_mon_to#</OPTION></cfoutput>


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



<cfoutput><OPTION VALUE="#comfirm_day_to#" selected>#comfirm_day_to#</OPTION></cfoutput>


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



<cfoutput><OPTION VALUE="#confirm_year_to#" selected>#confirm_year_to#</OPTION></cfoutput>



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




		</tr>

		<cfelse>

								<select name="product" onChange="prodSelect()"
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

				 <cfif #a_flag# eq "1">
								<OPTION VALUE="All" selected>All</OPTION>
								<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
								<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
								<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
								<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
								<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
								<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>

		<cfelseif #a_flag# eq "2">
								<OPTION VALUE="Closing Requested" selected>Closing Requested</OPTION>
								<OPTION VALUE="All">All</OPTION>
								<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
								<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
								<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
								<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
								<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>

		<cfelseif #a_flag# eq "3">
								<OPTION VALUE="Closing Assigned" selected>Closing Assigned</OPTION>
								<OPTION VALUE="All">All</OPTION>
								<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
								<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
								<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
								<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
								<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>

			<cfelseif #a_flag# eq "4">
								<OPTION VALUE="Closing Submitted" selected>Closing Submitted</OPTION>
								<OPTION VALUE="All">All</OPTION>
								<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
								<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
								<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
								<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
					<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>

					<cfelseif #a_flag# eq "5">
								<OPTION VALUE="Closing Scheduled" selected>Closing Scheduled</OPTION>
								<OPTION VALUE="All">All</OPTION>
								<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
								<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
								<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
								<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
								<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>

			<cfelseif #a_flag# eq "6">
							<OPTION VALUE="Loan Closed" selected>Loan Closed</OPTION>
							<OPTION VALUE="All">All</OPTION>
								<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
								<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
								<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
								<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
								<OPTION VALUE="Unrequested Closings">Unrequested Closings</OPTION>
			<cfelse>

							<OPTION VALUE="Unrequested Closings" selected>Unrequested Closings</OPTION>
								<OPTION VALUE="All">All</OPTION>
								<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
								<OPTION VALUE="Closing Assigned">Closing Assigned</OPTION>
								<OPTION VALUE="Closing Submitted">Closing Submitted</OPTION>
								<OPTION VALUE="Closing Scheduled">Closing Scheduled</OPTION>
								<OPTION VALUE="Loan Closed" >Loan Closed</OPTION>

							</cfif>

</select></CENTER>
			</TD>
		</TR>


	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=d3d3d3 width="100%" align=center valign=top>
						<FONT FACE=verdana SIZE=1 color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<FONT FACE=verdana SIZE=1 color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<FONT FACE=verdana SIZE=1 color="black">Order Number
						</td>



					<tr>

						<td bgcolor=d3d3d3 width="100%" align=center valign=top>
							<INPUT TYPE=TEXT NAME="a_county" VALUE="none" MaxLength=50 Size=16
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<INPUT TYPE=TEXT NAME="a_zip" VALUE="none" MaxLength=50 Size=16
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
					 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									<select name="order"

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
<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#prop_ID#">0232#prop_ID#</OPTION></CFOUTPUT>
							</SELECT>

						</td>
		</tr>
		</table>
<table width="100%" cellpadding=1 cellspacing=1 border=0>

<TR>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>
		FROM</b><select name="confirm_mon" onChange="monthresult()"
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>TO</b>

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




		</tr>


		</cfif><tr>
						<td bgcolor=d3d3d3 width="90%" align=center valign=top>
						<INPUT TYPE=image src="./images/button_search.gif" border=0>
				</td>
					</tr>


				</table>
</CFFORM>

</TD></TR></cfif>





<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
	<CFIF #a_trigger# EQ "2">

	<tr>
		<td width="98%" align=left valign=top bgcolor=e1e1e1>
			<!--- <a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a> --->



<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->



<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<table width="98%" cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Time
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							First name
						</td>

						<td bgcolor=gray width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Last name
						</td>

						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Number
						</td>
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Fee
						</td>
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Inst Upl
						</td>
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							HUD Upl
						</td>
					<td bgcolor=gray width=15 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REQ
						</td>
					<td bgcolor=gray width=15 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							ASS
						</td>
					<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Cl Req
					</td>
					<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Cl Ass
					</td>
					<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Cl Sub
					</td>
					<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Cl
					</td>
					<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #UID# EQ "10" OR #UID# EQ "21" OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "159" OR #UID# EQ "198">
								Fund
							<cfelse>
								Susp
							</cfif>
					</td>
					<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Comm
					</td>
				</tr>

<!--- ======================================================================== --->
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<cfoutput>
	<CFIF IsDefined("form.confirm_mon")>
		<cfif #confirm_mon# NEQ "Month">
			<CFSET confirm_mon = #confirm_mon#>
		</cfif>
	</CFIF>

 	<CFIF IsDefined("form.order")>
		<cfif #order# NEQ "NONE">
			<CFSET order = #order#>
		</cfif>
	</CFIF>

	<CFIF IsDefined("form.comfirm_day")>
		<cfif #comfirm_day# NEQ "Day">
			<CFSET comfirm_day = #comfirm_day#>
		</cfif>
	</CFIF>

	<CFIF IsDefined("form.confirm_year")>
		<cfif #confirm_year# NEQ "Year">
			<CFSET confirm_year = #confirm_year#>
		</cfif>
	</CFIF>

	<CFIF IsDefined("form.confirm_mon_to")>
		<cfif #confirm_mon_to# NEQ "Month">
			<CFSET confirm_mon_to = #confirm_mon_to#>
		</cfif>
	</CFIF>

	<CFIF IsDefined("form.comfirm_day_to")>
		<cfif #comfirm_day_to# NEQ "Day">
			<CFSET comfirm_day_to = #comfirm_day_to#>
		</cfif>
	</CFIF>

	<CFIF IsDefined("form.confirm_year_to")>
		<cfif #confirm_year_to# NEQ "Year">
			<CFSET confirm_year_to = #confirm_year_to#>
		</cfif>
	</CFIF>

	<CFIF IsDefined("form.product")>
		<cfif #product# NEQ "">
			<CFSET product = #product#>
		</cfif>
	</CFIF>

</cfoutput>
<!---If not all of the companies were selected --->
<cfif #comp_id# neq "ALL">

<CFSET zip_id_2 = #ListToArray(comp_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
	<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>
	<CFSET cty_name_1[MMM] = #st_temp[1]#>
</CFLOOP>
<!---cty_name is the company name.  Loop through and create view by a_Flag which is not Product.
	 View is being named read report --->
<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
	<cfif #product# eq "Closing Requested">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id  and request_date is not null and c.c_day is null and (appraisal_status = 'Closing Requested' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')
			and a.comp_id = '#cty_name_1[TTT]#'

		<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
			<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
			and (request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
		</cfif>
		<CFIF #a_county# NEQ "None">
			AND a.bfirstname1 LIKE '%#a_county#%'
		</CFIF>
		<CFIF #a_zip# NEQ "None">
			AND a.blastname1 LIKE '%#a_zip#%'
		</CFIF>
		<CFIF #order# NEQ "None">
			AND a.prop_id = #order#
		</CFIF>
			ORDER BY blastname1 ASC
		</CFQUERY>
		<CFSET r_count = #read_report.recordcount#>

	<cfelseif #product# eq "Closing Assigned">

		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c, doc_closer_prop d
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and a.prop_id = d.prop_id and d.a_date_assigned is not null and (a.appraisal_status = 'Closer Assigned' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')
			and a.comp_id = '#cty_name_1[TTT]#'

		<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
		<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
		<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
			and (request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#' )
		</cfif>

		<CFIF #a_county# NEQ "None">
			AND a.bfirstname1 LIKE '%#a_county#%'
		</CFIF>
		<CFIF #a_zip# NEQ "None">
			AND a.blastname1 LIKE '%#a_zip#%'
		</CFIF>
		<CFIF #order# NEQ "None">
			AND a.prop_id = #order#
		</CFIF>
			ORDER BY blastname1 ASC
		</CFQUERY>

		<CFSET r_count = #read_report.recordcount#>

	<cfelseif #product# eq "Closing Submitted">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and c.s_date is not null and (appraisal_status = 'Closing Scheduled' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')
			and a.comp_id = '#cty_name_1[TTT]#'
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
				<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
				<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
				and (closing_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#' )
			</cfif>
			<CFIF #a_county# NEQ "None">
				AND a.bfirstname1 LIKE '%#a_county#%'
			</CFIF>
			<CFIF #a_zip# NEQ "None">
				AND a.blastname1 LIKE '%#a_zip#%'
			</CFIF>
			<CFIF #order# NEQ "None">
				AND a.prop_id = #order#
			</CFIF>
			ORDER BY blastname1 ASC
		</CFQUERY>
	<CFSET r_count = #read_report.recordcount#>
	<cfelseif #product# eq "Closing Scheduled">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and c.yearmonth is not null and (appraisal_status = 'Closing Scheduled' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')
			and a.comp_id = '#cty_name_1[TTT]#'
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
				<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
				<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
				and (yearmonth between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#' )
			</cfif>
			<CFIF #a_county# NEQ "None">
				AND a.bfirstname1 LIKE '%#a_county#%'
			</CFIF>
			<CFIF #a_zip# NEQ "None">
				AND a.blastname1 LIKE '%#a_zip#%'
			</CFIF>
			<CFIF #order# NEQ "None">
				AND a.prop_id = #order#
			</CFIF>
			ORDER BY blastname1 ASC
		</CFQUERY>

		<CFSET r_count = #read_report.recordcount#>

	<cfelseif #product# eq "Loan Closed">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and l_date is not null and (appraisal_status = 'Loan Closed' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')
			and a.comp_id = '#cty_name_1[TTT]#'
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
				<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
				<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
				and (yearmonth between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#' )
			</cfif>

			<CFIF #a_county# NEQ "None">
				AND a.bfirstname1 LIKE '%#a_county#%'
			</CFIF>
			<CFIF #a_zip# NEQ "None">
				AND a.blastname1 LIKE '%#a_zip#%'
			</CFIF>
			<CFIF #order# NEQ "None">
				AND a.prop_id = #order#
			</CFIF>
			ORDER BY blastname1 ASC
		</CFQUERY>
		<CFSET r_count = #read_report.recordcount#>

	<cfelseif #product# eq "Unrequested Closings">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and b.request_date is null
			and a.comp_id = '#cty_name_1[TTT]#'
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
				<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
				<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
				and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#' )
			</cfif>
			<CFIF #a_county# NEQ "None">
				AND a.bfirstname1 LIKE '%#a_county#%'
			</CFIF>
			<CFIF #a_zip# NEQ "None">
				AND a.blastname1 LIKE '%#a_zip#%'
			</CFIF>
			<CFIF #order# NEQ "None">
				AND a.prop_id = #order#
			</CFIF>
			ORDER BY blastname1 ASC
		</CFQUERY>

		<CFSET r_count = #read_report.recordcount#>
	<!---If all Companies were selected --->
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report1">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and request_date is not null and (appraisal_status = 'Closing Requested' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')
			and a.comp_id = '#cty_name_1[TTT]#'

			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
				<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
				<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
				and (request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			<CFIF #a_county# NEQ "None">
				AND a.bfirstname1 LIKE '%#a_county#%'
			</CFIF>
			<CFIF #a_zip# NEQ "None">
				AND a.blastname1 LIKE '%#a_zip#%'
			</CFIF>
			<CFIF #order# NEQ "None">
				AND a.prop_id = #order#
			</CFIF>
			ORDER BY a.blastname1 ASC
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_report2">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c, doc_closer_title_prop d
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and a.prop_id = d.prop_id and d.a_date_assigned is not null and (appraisal_status = 'Closer Assigned' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')
			and a.comp_id = '#cty_name_1[TTT]#'
				<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
					<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
					and (request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
				<CFIF #a_county# NEQ "None">
					AND a.bfirstname1 LIKE '%#a_county#%'
				</CFIF>
				<CFIF #a_zip# NEQ "None">
					AND a.blastname1 LIKE '%#a_zip#%'
				</CFIF>
				<CFIF #order# NEQ "None">
					AND a.prop_id = #order#
				</CFIF>
				ORDER BY a.blastname1 ASC
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_report4">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and c.yearmonth is not null and (appraisal_status = 'Closing Scheduled' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')
			and a.comp_id = '#cty_name_1[TTT]#'
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
				<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
				<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
				and (yearmonth between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			<CFIF #a_county# NEQ "None">
				AND a.bfirstname1 LIKE '%#a_county#%'
			</CFIF>
			<CFIF #a_zip# NEQ "None">
				AND a.blastname1 LIKE '%#a_zip#%'
			</CFIF>
			<CFIF #order# NEQ "None">
				AND a.prop_id = #order#
			</CFIF>
			ORDER BY a.blastname1 ASC
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_report5">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and c.l_date is not null and (appraisal_status = 'Loan Closed' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')
			and a.comp_id = '#cty_name_1[TTT]#'

			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
				<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
				<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
				and (yearmonth between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			<CFIF #a_county# NEQ "None">
				AND a.bfirstname1 LIKE '%#a_county#%'
			</CFIF>
			<CFIF #a_zip# NEQ "None">
				AND a.blastname1 LIKE '%#a_zip#%'
			</CFIF>
			<CFIF #order# NEQ "None">
				AND a.prop_id = #order#
			</CFIF>
			ORDER BY a.blastname1 ASC

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_report6">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and b.request_date is null
			and a.comp_id = '#cty_name_1[TTT]#'

           <cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
				<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
				<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
				and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			<CFIF #a_county# NEQ "None">
				AND a.bfirstname1 LIKE '%#a_county#%'
			</CFIF>
			<CFIF #a_zip# NEQ "None">
				AND a.blastname1 LIKE '%#a_zip#%'
			</CFIF>
			<CFIF #order# NEQ "None">
				AND a.prop_id = #order#
			</CFIF>
			ORDER BY a.blastname1 ASC
		</CFQUERY>

		<CFSET r_count = #read_report1.recordcount# + #read_report2.recordcount#  + #read_report4.recordcount# + #read_report5.recordcount# + #read_report6.recordcount#>
		<!--- + #read_report3.recordcount# --->
	</cfif>

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
		<CFQUERY datasource="#request.dsn#" NAME="read_comp">
			SELECT *
			FROM Companies
			WHERE ID = #cty_name_1[TTT]#
		</CFQUERY>

	<cfif #r_count# neq "0">
			<tr>
				<td bgcolor="#a_bgcolor#" colspan = 13 width="100%" align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfoutput>#r_count# records found for #read_comp.company#</cfoutput>
				</td>
			<tr>
	</cfif>
	<!---All Selections --->
	<cfif #product# eq "All">
		<CFOUTPUT QUERY="read_report1">
			<tr>
				<!---time 1 --->
				<CFQUERY datasource="#request.dsn#" NAME="read_time1">
					SELECT a_Req_Closing_Time
					FROM Title_Closing_Order_Request_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfif #read_time1.a_Req_Closing_Time# eq"">
						N/A
					<cfelse>
						#TimeFormat(read_time1.a_Req_closing_time, "h:mm tt")#
					</cfif>
				</td>
				<!---First Name 1--->
				<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#bfirstname1#
				</td>
				<!---Last Name 1--->
				<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#blastname1#
				</td>
				<!---Order Number 1--->
				<td bgcolor="#a_bgcolor#" width=10 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>
				</td>
				<!--Fee 1-->
				<CFQUERY datasource="#request.dsn#" NAME="read_Fee1">
					SELECT Fee
					FROM EventList
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<cfif  #read_Fee1.fee# neq "">
	 					<font size=1 color=black face=verdana><b>#read_Fee1.fee#</FONT></B>
				<cfelse>
						<font size=1 color=black face=verdana><b>N/A</FONT></B>
				</cfif>
				</td>
				<!---Ins Upl 1--->
				<CFQUERY datasource="#request.dsn#" NAME="read_inst_1">
					SELECT closing_instructions,closing_inst_date,closing_inst_time
					FROM Doc_Closer_Title_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<cfif #read_inst_1.closing_instructions# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_inst_1.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_inst_1.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(read_inst_1.closing_inst_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
				</td>
				<!---HUD Upl 1--->
				<CFQUERY datasource="#request.dsn#" NAME="read_hud_1">
					SELECT final_hud,final_hud_date,final_hud_time
					FROM Doc_Closer_Title_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<cfif #read_hud_1.final_hud# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_hud_1.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_hud_1.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(read_hud_1.final_hud_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
				<!---Requested Date 1--->
				<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
						#DateFormat(a_filled_out_date,'m/d/yy')#

				</td>
				<!---Scheduled Date 1--->
				<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
						#c_month#/#c_day#/#right(c_year,2)#
				</td>
		<cfif #request_date# NEQ "">
				<!---Closing Request 1--->
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
						<a href="./Prop_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
				</td>
		<CFELSE>
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
							<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report1.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
				</td>
		</CFIF>
		<CFQUERY datasource="#request.dsn#" NAME="read_cl">
			SELECT *
			FROM doc_closer_prop
			WHERE prop_ID = #prop_id#
		</CFQUERY>
			<!---Closer Assign --->
		<cfif (#read_cl.a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
				</td>
		<CFELSE>
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report1.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
				</td>
		</CFIF>
		<!---Closing Submit --->
		<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#"><font size=1 color=blue face=verdana>SUB</font></a>
				</td>
		<CFELSE>
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#"><font size=1 color=red face=verdana>SUB</font></a>
				</td>
		</CFIF>
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
		<!---Closed --->
		<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>
			<FONT FACE=verdana SIZE=1 color="black">
			Closed
		<cfelse>
			<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>
		</cfif>
				</td>
		<!---Suspend --->
		<cfif #UID# EQ "10" OR #UID# EQ "21" OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198">
			<cfif #read_report1.loanfun# eq "">
			<td bgcolor="#a_bgcolor#" width=30 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="red">
				<a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&a_trigger=1" target="fund_prop" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><FONT FACE=verdana SIZE=1 color="red">fund</font></a>
			<cfelse><FONT FACE=verdana SIZE=1 color="blue">funded</font>
			</cfif>
		<cfelse>
			<td bgcolor="#a_bgcolor#" width=30 align=center valign=top><br>
			<FONT FACE=verdana SIZE=1 color="red">
			<a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&a_trigger=1">
			<font size=1 color="red" FACE=verdana>susp</font></a>
		</cfif>
			</td>
		<!---Comments --->
			</td>
			<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="red"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
			</td>
		</tr>
		<CFIF #a_color_trigger# eq "1">
			<CFSET a_bgcolor = "white">
			<CFSET a_color_trigger = "2">
		<CFELSE>
			<CFSET a_bgcolor = "d3d3d3">
			<CFSET a_color_trigger = "1">
		</CFIF>
		</CFOUTPUT>
		<CFOUTPUT QUERY="read_report2">
		<tr>
			<!---Time 2--->
			<CFQUERY datasource="#request.dsn#" NAME="read_time2">
					SELECT a_Req_Closing_Time
					FROM Title_Closing_Order_Request_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfif #read_time2.a_Req_Closing_Time# eq"">
						N/A
					<cfelse>
						#TimeFormat(read_time1.a_Req_closing_time, "h:mm tt")#
					</cfif>
				</td>
			<!---First Name 2--->
			<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#bfirstname1#
			</td>
			<!---Last Name 2--->
			<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#blastname1#
			</td>
			<!---Order Number 2--->
			<td bgcolor="#a_bgcolor#" width=10 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>
			</td>
			<!--Fee 2--->
			<CFQUERY datasource="#request.dsn#" NAME="read_Fee2">
					SELECT Fee
					FROM EventList
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<cfif  #read_Fee2.fee# neq "">
	 					<font size=1 color=black face=verdana><b>#read_Fee2.fee#</FONT></B>
				<cfelse>
						<font size=1 color=black face=verdana><b>N/A</FONT></B>
				</cfif>
				</td>
			<!---Ins Upl 2--->
			<CFQUERY datasource="#request.dsn#" NAME="read_inst_2">
					SELECT closing_instructions,closing_inst_date,closing_inst_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<cfif #read_inst_2.closing_instructions# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_inst_2.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_inst_2.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(read_inst_2.closing_inst_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
				</td>
			<!---HUD Upl 2--->
			<CFQUERY datasource="#request.dsn#" NAME="read_hud_2">
					SELECT final_hud,final_hud_date,final_hud_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<cfif #read_hud_2.final_hud# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_hud_2.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_hud_2.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(read_hud_2.final_hud_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
			<!---Requested Date 2--->
			<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#DateFormat(a_filled_out_date,'m/d/yy')#
			</td>
			<!---Scheduled Date 2--->
			<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#c_month#/#c_day#/#right(c_year,2)#
			</td>
			<!---Closing Request 2--->
			<cfif #request_date# NEQ "">
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<a href="./Prop_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
				</td>
			<CFELSE>
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report2.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
				</td>
			</CFIF>
			<!---Closer Assign 2--->
			<cfif (#a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
				</td>
			<CFELSE>
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report2.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
				</td>
			</CFIF>
			<!---Closing Submit 2--->
			<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					 <a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#"><font size=1 color=blue face=verdana>SUB</font></a>
				</td>
			<CFELSE>
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#"><font size=1 color=red face=verdana>SUB</font></a>
				</td>
			</CFIF>
			<!---Closed 2 --->
				<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
			<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>
				<FONT FACE=verdana SIZE=1 color="black">
							Closed
			<cfelse>
				<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>
			</cfif>
				</td>
				<!---Suspend 2 --->
				<td bgcolor="#a_bgcolor#" width=30 align=center valign=top>
			<cfif #UID# EQ "10" OR #UID# EQ "21" OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198"><cfif #read_report2.loanfun# eq ""><FONT FACE=verdana SIZE=1 color="red"><a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&a_trigger=1" target="fund_title" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><FONT FACE=verdana SIZE=1 color="red">fund</font></a><cfelse><FONT FACE=verdana SIZE=1 color="blue">funded</font></cfif>
			<cfelse><a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&a_trigger=1"><font size=1 color="red" FACE=verdana>susp</font></a></cfif>
				</td>
			</td>
			<!---Comments 2 --->
			<td bgcolor="#a_bgcolor#" width=30 align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="red"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
			</td>
		</tr>
			<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
	</CFOUTPUT>
	<CFOUTPUT QUERY="read_report4">
		<tr><!---time 3--->
			<CFQUERY datasource="#request.dsn#" NAME="read_time3">
					SELECT a_Req_Closing_Time
					FROM Title_Closing_Order_Request_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfif #read_time3.a_Req_Closing_Time# eq"">
						N/A
					<cfelse>
						#TimeFormat(read_time3.a_Req_closing_time, "h:mm tt")#
					</cfif>
				</td>
			<!---First Name 3 --->
			<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#bfirstname1#
			</td>
			<!---Last Name 3--->
			<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#blastname1#
			</td>
			<!---Order Number 3 --->
			<td bgcolor="#a_bgcolor#" width=10 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>#prop_id#</font></a>
			</td>
			<!--Fee 3--->
			<CFQUERY datasource="#request.dsn#" NAME="read_Fee3">
					SELECT Fee
					FROM EventList
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<cfif  #read_Fee3.fee# neq "">
	 					<font size=1 color=black face=verdana><b>#read_Fee3.fee#</FONT></B>
				<cfelse>
						<font size=1 color=black face=verdana><b>N/A</FONT></B>
				</cfif>
				</td>
			<!---Ins Upl 3--->
			<CFQUERY datasource="#request.dsn#" NAME="read_inst_3">
					SELECT closing_instructions,closing_inst_date,closing_inst_time
					FROM Doc_Closer_Prop
					WHERE Prop_ID = #Prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<cfif #read_inst_3.closing_instructions# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_inst_3.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_inst_3.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(read_inst_3.closing_inst_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
				</td>
			<!---HUD Upl 3--->
			<CFQUERY datasource="#request.dsn#" NAME="read_hud_3">
					SELECT final_hud
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<cfif #read_hud_3.final_hud# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_hud_3.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_hud_3.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(read_hud_3.final_hud_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
			<!---Requested Date 3--->
			<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#DateFormat(a_filled_out_date,'m/d/yy')#
			</td>
			<!---Scheduled Date 3--->
			<td bgcolor="#a_bgcolor#" width=25 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#c_month#/#c_day#/#right(c_year,2)#
			</td>
			<!---Closing Request 3--->
		<cfif #request_date# NEQ "">
			<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./Prop_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" width=50 align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report4.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
			</td>
		</CFIF>
		<!---Closer Assign 3--->
		<CFQUERY datasource="#request.dsn#" NAME="read_cl">
			SELECT *
			FROM doc_closer_prop
			WHERE prop_ID = #prop_id#
		</CFQUERY>
		<cfif (#read_cl.a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report4.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
			</td>
		</CFIF>
		<!---Closing Submit 3--->
		<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#"><font size=1 color=blue face=verdana>SUB</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#"><font size=1 color=red face=verdana>SUB</font></a>
			</td>
		</CFIF>
		<!---Closed 3--->
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
		<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>
			<FONT FACE=verdana SIZE=1 color="black">
				Closed
		<cfelse>
			<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>
		</cfif>
			</td>
			<!---Suspend 3--->
			<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
		<cfif #UID# EQ "10" OR #UID# EQ "21" OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198"><cfif #read_report4.loanfun# eq ""><FONT FACE=verdana SIZE=1 color="red"><a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&a_trigger=1" target="fund_prop" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><FONT FACE=verdana SIZE=1 color="red">fund</font></a><cfelse><FONT FACE=verdana SIZE=1 color="blue">funded</font></cfif>
		<cfelse><a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&a_trigger=1"><font size=1 color="red" FACE=verdana>susp</font></a></cfif>
			</td>
		</td>
		<!---Comments 3--->
		<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="red"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
		</td>
	</tr>
		<CFIF #a_color_trigger# eq "1">
			<CFSET a_bgcolor = "white">
			<CFSET a_color_trigger = "2">
		<CFELSE>
			<CFSET a_bgcolor = "d3d3d3">
			<CFSET a_color_trigger = "1">
		</CFIF>
	</CFOUTPUT>
	<CFOUTPUT QUERY="read_report5">
	<tr>
		<!---time 4--->
		<CFQUERY datasource="#request.dsn#" NAME="read_time4">
					SELECT a_Req_Closing_Time
					FROM Title_Closing_Order_Request_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfif #read_time4.a_Req_Closing_Time# eq"">
						N/A
					<cfelse>
						#TimeFormat(read_time4.a_Req_closing_time, "h:mm tt")#
					</cfif>
				</td>
		<!---First Name 4--->
		<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#bfirstname1#
		</td>
		<!---Last Name 4--->
		<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#blastname1#
		</td>
		<!---Order Number 4--->
		<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>
		</td>
		<!--Fee  4--->
		<CFQUERY datasource="#request.dsn#" NAME="read_Fee4">
					SELECT Fee
					FROM EventList
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif  #read_Fee4.fee# neq "">
	 					<font size=1 color=black face=verdana><b>#read_Fee4.fee#</FONT></B>
				<cfelse>
						<font size=1 color=black face=verdana><b>N/A</FONT></B>
				</cfif>
				</td>
		<!---Ins Upl 4--->
		<CFQUERY datasource="#request.dsn#" NAME="read_inst_4">
					SELECT closing_instructions,closing_inst_date,closing_inst_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_inst_4.closing_instructions# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_inst_4.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_inst_4.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(read_inst_4.closing_inst_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
				</td>
		<!---HUD Upl 4--->
		<CFQUERY datasource="#request.dsn#" NAME="read_hud_4">
					SELECT final_hud,final_hud_date,final_hud_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_hud_4.final_hud# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_hud_4.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_hud_4.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(read_hud_4.final_hud_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
		<!---Requested Date 4--->
		<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(a_filled_out_date,'m/d/yy')#
		</td>
		<!---Scheduled Date 4--->
		<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#c_month#/#c_day#/#right(c_year,2)#
		</td>
		<!---Closing Request 4--->
		<cfif #request_date# NEQ "">
		<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			<a href="./PROP_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
		</td>
		<CFELSE>
		<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report5.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
		</td>
		</CFIF>
		<CFQUERY datasource="#request.dsn#" NAME="read_cl">
			SELECT *
			FROM doc_closer_prop
			WHERE prop_ID = #prop_id#
		</CFQUERY>
		<!---Closer Assign 4--->
		<cfif (#read_cl.a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report5.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
			</td>
		</CFIF>
		<!---Closing Submit 4--->
		<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#"><font size=1 color=blue face=verdana>SUB</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#"><font size=1 color=red face=verdana>SUB</font></a>
			</td>
		</CFIF>
		<!---Closed 4--->
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
		<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>
			<FONT FACE=verdana SIZE=1 color="black">
			Closed
		<cfelse>
			<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>
		</cfif>
			</td>
			<!---Suspend 4--->
			<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
		<cfif #UID# EQ "10" OR #UID# EQ "21" OR #UID# EQ "74"  OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198"><cfif #read_report5.loanfun# eq ""><FONT FACE=verdana SIZE=1 color="red"><a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&a_trigger=1" target="fund_prop" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><FONT FACE=verdana SIZE=1 color="red">fund</font></a><cfelse><FONT FACE=verdana SIZE=1 color="blue">funded</font></cfif>
		<cfelse><a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&a_trigger=1"><FONT FACE=verdana SIZE=1 color="red">susp</font></a></cfif>
			</td>
		</td>
		<!---Comments 4--->
		<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="red"><a href="./prop_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
		</td>
	</tr>
		<CFIF #a_color_trigger# eq "1">
			<CFSET a_bgcolor = "white">
			<CFSET a_color_trigger = "2">
		<CFELSE>
			<CFSET a_bgcolor = "d3d3d3">
			<CFSET a_color_trigger = "1">
		</CFIF>
	</CFOUTPUT>
	<CFOUTPUT QUERY="read_report6">
	<tr>
		<!---time 5--->
		<CFQUERY datasource="#request.dsn#" NAME="read_time5">
					SELECT a_Req_Closing_Time
					FROM Title_Closing_Order_Request_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfif #read_time5.a_Req_Closing_Time# eq"">
						N/A
					<cfelse>
						#TimeFormat(read_time5.a_Req_closing_time, "h:mm tt")#
					</cfif>
				</td>
		<!---First Name 5--->
		<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#bfirstname1#
		</td>
		<!---Last Name 5--->
		<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#blastname1#
		</td>
		<!---Order Number 5--->
		<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>
		</td>
		<!--Fee 5--->
		<CFQUERY datasource="#request.dsn#" NAME="read_Fee5">
					SELECT Fee
					FROM EventList
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif  #read_Fee5.fee# neq "">
	 					<font size=1 color=black face=verdana><b>#read_Fee5.fee#</FONT></B>
				<cfelse>
						<font size=1 color=black face=verdana><b>N/A</FONT></B>
				</cfif>
				</td>
		<!---Ins Upl 5--->
		<CFQUERY datasource="#request.dsn#" NAME="read_inst_5">
					SELECT closing_instructions,closing_inst_date,closing_inst_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_inst_5.closing_instructions# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_inst_5.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_inst_5.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(read_inst_5.closing_inst_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
				</td>
		<!---HUD Upl 5--->
		<CFQUERY datasource="#request.dsn#" NAME="read_hud_5">
					SELECT final_hud,final_hud_date,final_hud_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_hud_5.final_hud# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_hud_5.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_hud_5.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(read_hud_5.final_hud_time, "HH:mm:ss")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
		<!---Requested Date 5--->
		<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(a_filled_out_date,'m/d/yy')#
		</td>
		<!---Scheduled Date 5--->
		<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#c_month#/#c_day#/#right(c_year,2)#
		</td>
		<!---Closing Request 5--->
		<cfif #request_date# NEQ "">
		<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			<a href="./Prop_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
		</td>
		<CFELSE>
		<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report6.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
		</td>
		</CFIF>
		<CFQUERY datasource="#request.dsn#" NAME="read_cl">
			SELECT *
			FROM doc_closer_prop
			WHERE prop_ID = #prop_id#
		</CFQUERY>
		<!---Closer Assign 5--->
		<cfif (#read_cl.a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report6.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
			</td>
		</CFIF>
		<!---Closing Submit 5--->
		<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#"><font size=1 color=blue face=verdana>SUB</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#"><font size=1 color=red face=verdana>SUB</font></a>
			</td>
		</CFIF>
		<!---Closed 5--->
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
		<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>
			<FONT FACE=verdana SIZE=1 color="black">
			Closed
		<cfelse>
			<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>
		</cfif>
			</td>
			<!---Suspend 5--->
			<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
		<cfif #UID# EQ "10" OR #UID# EQ "21"  OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198"><cfif #read_report6.loanfun# eq ""><FONT FACE=verdana SIZE=1 color="red"><a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&a_trigger=1" target="fund_prop" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><FONT FACE=verdana SIZE=1 color="red">fund</font></a><cfelse><FONT FACE=verdana SIZE=1 color="blue">funded</font></cfif>
		<cfelse><a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&a_trigger=1"><font size=1 color="red" FACE=verdana>susp</font></a></cfif>
			</td>
		</td>
		<!---Comments 5--->
		<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="red"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
		</td>
	</tr>
		<CFIF #a_color_trigger# eq "1">
			<CFSET a_bgcolor = "white">
			<CFSET a_color_trigger = "2">
		<CFELSE>
			<CFSET a_bgcolor = "d3d3d3">
			<CFSET a_color_trigger = "1">
		</CFIF>
	</CFOUTPUT>
		<cfelse>
			<CFOUTPUT QUERY="read_report">
	<tr>
		<!---time 5 --->
		<!---First Name 5--->
		<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#bfirstname1#
		</td>
		<!---Last Name 5--->
		<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#blastname1#
		</td>
		<!---Order Number 5--->
		<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>#prop_id#</font></a>
		</td>
		<!--Fee 5--->
		<!---Ins Upl 5--->
		<!---HUD Upl 5--->
		<!---Requested Date 5--->
		<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
				#a_filled_out_date#
		</td>
		<!---Scheduled Date 5--->
		<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
				#c_month#/#c_day#/#c_year#
		</td>
		<!---Closing Request 5--->
		<cfif #request_date# NEQ "">
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
			</td>
		</CFIF>
		<CFQUERY datasource="#request.dsn#" NAME="read_cl">
			SELECT *
			FROM doc_closer_prop
			WHERE prop_ID = #prop_id#
		</CFQUERY>
		<!---Closer Assign 5--->
		<cfif (#read_cl.a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
			</td>
		</CFIF>
		<!---Closing Submit 5--->
		<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#"><font size=1 color=blue face=verdana>SUB</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#"><font size=1 color=red face=verdana>SUB</font></a>
			</td>
		</CFIF>
		<!---Closed 5--->
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
		<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>
			<FONT FACE=verdana SIZE=1 color="black">
			Closed
		<cfelse>
			<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>
		</cfif>
			</td>
			<!---Suspend 5--->
			<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
		<cfif #UID# EQ "10" OR #UID# EQ "21"  OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198"><cfif #read_report.loanfun# eq ""><FONT FACE=verdana SIZE=1 color="red"><a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&a_trigger=1" target="fund_title" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><FONT FACE=verdana SIZE=1 color="red">fund</font></a><cfelse><FONT FACE=verdana SIZE=1 color="blue">funded</font></cfif>
		<cfelse>
			<a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&a_trigger=1"><font size=1 color="red" FACE=verdana>susp</font></a></cfif>
			</td>
		</td>
		<!---Comments 5--->
		<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="red"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
		</td>
	</tr>
		<CFIF #a_color_trigger# eq "1">
			<CFSET a_bgcolor = "white">
			<CFSET a_color_trigger = "2">
		<CFELSE>
			<CFSET a_bgcolor = "d3d3d3">
			<CFSET a_color_trigger = "1">
		</CFIF>
	</CFOUTPUT>
</cfif>
</CFLOOP>

<cfelse>

<cfoutput>
		 <CFIF IsDefined("form.confirm_mon")>
		 	<cfif #confirm_mon# NEQ "Month">
				<CFSET confirm_mon = #confirm_mon#>
			</cfif>
		</CFIF>

		<CFIF IsDefined("form.order")>
			<cfif #order# NEQ "NONE">
				<CFSET order = #order#>
			</cfif>
		</CFIF>
		<CFIF IsDefined("form.comfirm_day")>
			<cfif #comfirm_day# NEQ "Day">
				<CFSET comfirm_day = #comfirm_day#>
			</cfif>
		</CFIF>
		<CFIF IsDefined("form.confirm_year")>
			<cfif #confirm_year# NEQ "Year">
				<CFSET confirm_year = #confirm_year#>
			</cfif>
		</CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")>
		 	<cfif #confirm_mon_to# NEQ "Month">
				<CFSET confirm_mon_to = #confirm_mon_to#>
			</cfif>
		</CFIF>
		<CFIF IsDefined("form.comfirm_day_to")>
			<cfif #comfirm_day_to# NEQ "Day">
				<CFSET comfirm_day_to = #comfirm_day_to#>
			</cfif>
		</CFIF>
		<CFIF IsDefined("form.confirm_year_to")>
			<cfif #confirm_year_to# NEQ "Year">
				<CFSET confirm_year_to = #confirm_year_to#>
			</cfif>
		</CFIF>
		<CFIF IsDefined("form.product")>
			<cfif #product# NEQ "">
				<CFSET product = #product#>
			</cfif>
		</CFIF>
</cfoutput>
		<cfif #product# eq "Closing Requested">
			<CFQUERY datasource="#request.dsn#" NAME="read_report">
				SELECT *
				FROM property a, title_closing_order_request_prop b, eventlist c
				WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and request_date is not null and c.c_day is null and (appraisal_status = 'Closing Requested' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')
			<cfif #url.uid# eq 185>
				and (a.comp_ID = 404 or a.comp_ID = 408 or a.comp_id = 397)
			</cfif>
          	<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
			<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
				and (request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			<CFIF #a_county# NEQ "None">
				AND a.bfirstname1 LIKE '%#a_county#%'
			</CFIF>
			<CFIF #a_zip# NEQ "None">
				AND a.blastname1 LIKE '%#a_zip#%'
			</CFIF>
			<CFIF #order# NEQ "None">
				AND a.prop_id = #order#
			</CFIF>
			ORDER BY blastname1 ASC
		</CFQUERY>
		<CFSET r_count = #read_report.recordcount#>
	<cfelseif #product# eq "Closing Assigned">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c, doc_closer_prop d
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and a.prop_id = d.prop_id and d.a_date_assigned is not null and (a.appraisal_status = 'Closer Assigned' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')

	<cfif #url.uid# eq 185>
			and (a.comp_ID = 404 or a.comp_ID = 408 or a.comp_id = 397)
	</cfif>
	<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
	<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
	<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
		and (yearmonth between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#' )
	</cfif>
	<CFIF #a_county# NEQ "None">
		AND a.bfirstname1 LIKE '%#a_county#%'
	</CFIF>
	<CFIF #a_zip# NEQ "None">
		AND a.blastname1 LIKE '%#a_zip#%'
	</CFIF>
	<CFIF #order# NEQ "None">
		AND a.prop_id = #order#
	</CFIF>
		ORDER BY blastname1 ASC
	</CFQUERY>
	<CFSET r_count = #read_report.recordcount#>
	<cfelseif #product# eq "Closing Scheduled">
	<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and c.yearmonth is not null and (appraisal_status = 'Closing Scheduled' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')

	<cfif #url.uid# eq 185>
			and (a.comp_ID = 404 or a.comp_ID = 408 or a.comp_id = 397)
	</cfif>

	<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
			<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
			and (yearmonth between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#' )
	</cfif>
	<CFIF #a_county# NEQ "None">
			AND a.bfirstname1 LIKE '%#a_county#%'
	</CFIF>
	<CFIF #a_zip# NEQ "None">
			AND a.blastname1 LIKE '%#a_zip#%'
	</CFIF>
	<CFIF #order# NEQ "None">
			AND a.prop_id = #order#
	</CFIF>
			ORDER BY blastname1 ASC
	</CFQUERY>

	<CFSET r_count = #read_report.recordcount#>
	<cfelseif #product# eq "Closing Submitted">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and c.closing_date is not null and (appraisal_status = 'Closing Scheduled' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')
	<cfif #url.uid# eq 185>
			and (a.comp_ID = 404 or a.comp_ID = 408 or a.comp_id = 397)
	</cfif>
	<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
		<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
		<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
			and (closing_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#' )
	</cfif>
	<CFIF #a_county# NEQ "None">
			AND a.bfirstname1 LIKE '%#a_county#%'
	</CFIF>
	<CFIF #a_zip# NEQ "None">
			AND a.blastname1 LIKE '%#a_zip#%'
	</CFIF>
	<CFIF #order# NEQ "None">
			AND a.prop_id = #order#
	</CFIF>
			ORDER BY blastname1 ASC
	</CFQUERY>
	<CFSET r_count = #read_report.recordcount#>
	<cfelseif #product# eq "Loan Closed">

	<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and c.l_date is not null and (appraisal_status = 'Loan Closed' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')

	<cfif #url.uid# eq 185>
			and (a.comp_ID = 404 or a.comp_ID = 408 or a.comp_id = 397)
	</cfif>

	<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
			<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
			and (yearmonth between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#' )
	</cfif>
	<CFIF #a_county# NEQ "None">
			AND a.bfirstname1 LIKE '%#a_county#%'
	</CFIF>
	<CFIF #a_zip# NEQ "None">
			AND a.blastname1 LIKE '%#a_zip#%'
	</CFIF>
	<CFIF #order# NEQ "None">
			AND a.prop_id = #order#
	</CFIF>
			ORDER BY blastname1 ASC
	</CFQUERY>

	<CFSET r_count = #read_report.recordcount#>

	<cfelseif #product# eq "Unrequested Closings">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and b.request_date is null

	<cfif #url.uid# eq 185>
			and (a.comp_ID = 404 or a.comp_ID = 408 or a.comp_id = 397)
	</cfif>
	<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
		<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
		<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
		and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#' )
	</cfif>
	<CFIF #a_county# NEQ "None">
		AND a.bfirstname1 LIKE '%#a_county#%'
			</CFIF>
			<CFIF #a_zip# NEQ "None">
				AND a.blastname1 LIKE '%#a_zip#%'
			</CFIF>
			<CFIF #order# NEQ "None">
				AND a.prop_id = #order#
			</CFIF>
			ORDER BY blastname1 ASC

		</CFQUERY>
		<CFSET r_count = #read_report.recordcount#>
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report1">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and b.request_date is not null and (appraisal_status = 'Closing Requested' or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')

	<cfif #url.uid# eq 185>
			and (a.comp_ID = 404 or a.comp_ID = 408 or a.comp_id = 397)
	</cfif>
	<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
		<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
		<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
			and (request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	</cfif>
	<CFIF #a_county# NEQ "None">
			AND a.bfirstname1 LIKE '%#a_county#%'
	</CFIF>
	<CFIF #a_zip# NEQ "None">
			AND a.blastname1 LIKE '%#a_zip#%'
	</CFIF>
	<CFIF #order# NEQ "None">
			AND a.prop_id = #order#
	</CFIF>
			ORDER BY a.blastname1 ASC
			</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_report2">
			SELECT *
			FROM property a, title_closing_order_request_prop b, eventlist c, doc_closer_prop d
			WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and a.prop_id = d.prop_id and d.a_date_assigned is not null and (appraisal_status = 'Closer Assigned'  or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')

	<cfif #url.uid# eq 185>
			and (a.comp_ID = 404 or a.comp_ID = 408 or a.comp_id = 397)
	</cfif>

	<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
			<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
			and (request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	</cfif>
	<CFIF #a_county# NEQ "None">
			AND a.bfirstname1 LIKE '%#a_county#%'
	</CFIF>
	<CFIF #a_zip# NEQ "None">
			AND a.blastname1 LIKE '%#a_zip#%'
	</CFIF>
	<CFIF #order# NEQ "None">
			AND a.prop_id = #order#
	</CFIF>
			ORDER BY a.blastname1 ASC
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="read_report4">
				SELECT *
				FROM property a, title_closing_order_request_prop b, eventlist c
				WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and c.yearmonth is not null and (appraisal_status = 'Closing Scheduled'  or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')

	<cfif #url.uid# eq 185>
				and (a.comp_ID = 404 or a.comp_ID = 408 or a.comp_id = 397)
	</cfif>
	<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
		<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
		<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
			and (yearmonth between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	</cfif>
	<CFIF #a_county# NEQ "None">
			AND a.bfirstname1 LIKE '%#a_county#%'
	</CFIF>
	<CFIF #a_zip# NEQ "None">
			AND a.blastname1 LIKE '%#a_zip#%'
	</CFIF>
	<CFIF #order# NEQ "None">
			AND a.prop_id = #order#
	</CFIF>
			ORDER BY a.blastname1 ASC
	</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_report5">
				SELECT *
				FROM property a, title_closing_order_request_prop b, eventlist c
				WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and c.l_date is not null and (appraisal_status = 'Loan Closed'  or appraisal_status = 'In Typing' or appraisal_status = 'Report E-mailed')

	<cfif #url.uid# eq 185>
				and (a.comp_ID = 404 or a.comp_ID = 408 or a.comp_id = 397)
	</cfif>
    <cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
			<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>
			and (yearmonth between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	</cfif>
	<CFIF #a_county# NEQ "None">
			AND a.bfirstname1 LIKE '%#a_county#%'
	</CFIF>
	<CFIF #a_zip# NEQ "None">
			AND a.blastname1 LIKE '%#a_zip#%'
	</CFIF>
	<CFIF #order# NEQ "None">
			AND a.prop_id = #order#
	</CFIF>
			ORDER BY a.blastname1 ASC
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="read_report6">
				SELECT *
				FROM property a, title_closing_order_request_prop b, eventlist c
				WHERE a.prop_id = b.prop_id and a.prop_id = c.prop_id and b.request_date is null

<cfif #url.uid# eq 185>
			and (a.comp_ID = 404 or a.comp_ID = 408 or a.comp_id = 397)
			</cfif>
           <cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
			<CFSET YearMonto = CreateDate(FORM.confirm_year_to, FORM.confirm_mon_to, FORM.comfirm_day_to)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			<CFIF #a_county# NEQ "None">
				AND a.bfirstname1 LIKE '%#a_county#%'
			</CFIF>
			<CFIF #a_zip# NEQ "None">
				AND a.blastname1 LIKE '%#a_zip#%'
			</CFIF>
			<CFIF #order# NEQ "None">
				AND a.prop_id = #order#
			</CFIF>
			ORDER BY a.blastname1 ASC

		</CFQUERY>

<CFSET r_count = #read_report1.recordcount# + #read_report2.recordcount# +  #read_report4.recordcount# + #read_report5.recordcount# + #read_report6.recordcount#>

		</cfif>

	<!--- #read_report3.recordcount# + --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
			<cfif #r_count# neq "0">
				<tr>
					<td bgcolor="#a_bgcolor#" colspan = 15 width="100%" align=center valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						<cfoutput>#r_count#</cfoutput> records found for 'ALL' clients
					</td>
				<tr>
			</cfif>

			<cfif #product# eq "All">
				<CFOUTPUT QUERY="read_report1">
				<tr>
					<!---time 6 --->
					<CFQUERY datasource="#request.dsn#" NAME="read_time6">
						SELECT a_Req_Closing_Time
						FROM Title_Closing_Order_Request_Prop
						WHERE prop_ID = #prop_id#
					</CFQUERY>
					<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfif #read_time6.a_Req_Closing_Time# eq"">
						N/A
					<cfelse>
						#TimeFormat(read_time6.a_Req_closing_time, "h:mm tt")#
					</cfif>
					</td>
						<!---First Name 6 --->
					<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						#bfirstname1#
					</td>
						<!---Last Name 6--->
					<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						#blastname1#
					</td>
						<!---Order Number 6--->
					<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>
					</td>
					<!--Fee 6--->
					<CFQUERY datasource="#request.dsn#" NAME="read_Fee6">
						SELECT Fee
						FROM EventList
						WHERE prop_ID = #prop_id#
					</CFQUERY>
					<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
					<cfif  #read_Fee6.fee# neq "">
	 					<font size=1 color=black face=verdana><b>#read_Fee6.fee#</FONT></B>
					<cfelse>
						<font size=1 color=black face=verdana><b>N/A</FONT></B>
					</cfif>
					</td>
					<!---Ins Upl 6--->
					<CFQUERY datasource="#request.dsn#" NAME="read_inst_6">
						SELECT closing_instructions,closing_inst_date,closing_inst_time
						FROM Doc_Closer_Prop
						WHERE prop_ID = #prop_id#
					</CFQUERY>
					<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
					<cfif #read_inst_6.closing_instructions# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_inst_6.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_inst_6.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(read_inst_6.closing_inst_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
					<!---HUD Upl 6--->
					<CFQUERY datasource="#request.dsn#" NAME="read_hud_6">
						SELECT final_hud,final_hud_date,final_hud_time
						FROM Doc_Closer_Prop
						WHERE prop_ID = #prop_id#
					</CFQUERY>
					<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
					<cfif #read_hud_6.final_hud# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_hud_6.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_hud_6.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(read_hud_6.final_hud_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
						<!---Requested Date 6--->
					<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						#DateFormat(a_filled_out_date,'m/d/yy')#
					</td>
					<!---Scheduled Date 6--->
					<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						#c_month#/#c_day#/#right(c_year,2)#
					</td>
					<!---Closing Request 6--->
					<cfif #request_date# NEQ "">
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						<a href="./Prop_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
					</td>
					<CFELSE>
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report1.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
					</td>
					</CFIF>
					<CFQUERY datasource="#request.dsn#" NAME="read_cl">
						SELECT *
						FROM doc_closer_prop
						WHERE prop_ID = #prop_id#
					</CFQUERY>
					<!---Closer Assign 6--->
					<cfif (#read_cl.a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
						</td>
					<CFELSE>

					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report1.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
					</td>
					</CFIF>
					<!---Closing Submit 6--->
					<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#"><font size=1 color=blue face=verdana>SUB</font></a>
					</td>
					<CFELSE>
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#"><font size=1 color=red face=verdana>SUB</font></a>

					</td>
					</CFIF>
					<!---Closed --->
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
					<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>
						<FONT FACE=verdana SIZE=1 color="black">
							Closed
					<cfelse>
						<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>
					</cfif>
					</td>
					<!---Suspend 6--->
					<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
					<cfif #UID# EQ "10" OR #UID# EQ "21"  OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198">
						<cfif #read_report1.loanfun# eq "">
							<FONT FACE=verdana SIZE=1 color="red"><a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&a_trigger=1" target="fund_prop" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><font size=1 color="red" FACE=verdana>fund</font></a>
						<cfelse>
							<FONT FACE=verdana SIZE=1 color="blue">funded</font>
						</cfif>
					<cfelse><a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&a_trigger=1"><font size=1 color="red" FACE=verdana color="red">susp</font></a></cfif>
					</td>
					</td>
					<!---Comments 6--->
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
						<FONT FACE=verdana SIZE=1 color="red"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report1.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
					</td>
				</tr>
					<CFIF #a_color_trigger# eq "1">
					<CFSET a_bgcolor = "white">
					 	<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>
			<CFOUTPUT QUERY="read_report2">
					<tr>
						<!---time 7--->
						<CFQUERY datasource="#request.dsn#" NAME="read_time7">
					SELECT a_Req_Closing_Time
					FROM Title_Closing_Order_Request_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfif #read_time7.a_Req_Closing_Time# eq"">
						N/A
					<cfelse>
						#TimeFormat(read_time7.a_Req_closing_time, "h:mm tt")#
					</cfif>
				</td>
						<!---First Name 7--->
						<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#bfirstname1#
						</td>
						<!---Last Name 7--->
						<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#blastname1#
						</td>
						<!---Order Number 7--->
						<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>#prop_id#</font></a>
						  </td>
						<!--Fee 7--->
						<CFQUERY datasource="#request.dsn#" NAME="read_Fee7">
					SELECT Fee
					FROM EventList
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif  #read_Fee7.fee# neq "">
	 					<font size=1 color=black face=verdana><b>#read_Fee7.fee#</FONT></B>
				<cfelse>
						<font size=1 color=black face=verdana><b>N/A</FONT></B>
				</cfif>
				</td>
						<!---Ins Upl 7--->
						<CFQUERY datasource="#request.dsn#" NAME="read_inst_7">
					SELECT closing_instructions,closing_inst_date,closing_inst_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_inst_7.closing_instructions# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_inst_7.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_inst_7.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(read_inst_7.closing_inst_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
				</td>
						<!---HUD Upl 7--->
						<CFQUERY datasource="#request.dsn#" NAME="read_hud_7">
					SELECT final_hud,final_hud_date,final_hud_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_hud_7.final_hud# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_hud_7.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_hud_7.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(read_hud_7.final_hud_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
						<!---Requested Date 7--->
						<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(a_filled_out_date,'m/d/yy')#
						</td>
						<!---Scheduled Date 7--->
						<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">

							#c_month#/#c_day#/#right(c_year,2)#
						</td>
						<!---Closing Request 7--->
<cfif #request_date# NEQ "">
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./Prop_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
						</td>
				<CFELSE>

					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report2.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
						</td>
					</CFIF>

					<!---Closer Assign 7--->
					<cfif (#a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
						</td>
				<CFELSE>
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report2.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
						</td>
					</CFIF>
					<!---Closing Submit 7--->
		<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#"><font size=1 color=blue face=verdana>SUB</font></a>
						</td>
				<CFELSE>
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#"><font size=1 color=red face=verdana>SUB</font></a>

						</td>
					</CFIF>
					<!---Closed 7--->

			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>

							<FONT FACE=verdana SIZE=1 color="black">
							Closed
							<cfelse>
							<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>

							</cfif>
					</td>
							<!---Suspend 7--->
							<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
							<cfif #UID# EQ "10" OR #UID# EQ "21"  OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198"><cfif #read_report2.loanfun# eq ""><FONT FACE=verdana SIZE=1 color="red"><a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&a_trigger=1" target="fund_prop" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><FONT FACE=verdana SIZE=1 color="red">fund</font></a><cfelse><FONT FACE=verdana SIZE=1 color="blue">funded</font></cfif>
	<cfelse><a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&a_trigger=1"><font size=1 color="red" FACE=verdana>susp</font></a></cfif>
						</td>
					</td>	<!---Comments 7--->
							<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="red"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report2.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

					</td>
					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>
			<CFOUTPUT QUERY="read_report4">
					<tr>
						<!---time 8--->
						<CFQUERY datasource="#request.dsn#" NAME="read_time8">
					SELECT a_Req_Closing_Time
					FROM Title_Closing_Order_Request_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfif #read_time8.a_Req_Closing_Time# eq"">
						N/A
					<cfelse>
						#TimeFormat(read_time8.a_Req_closing_time, "h:mm tt")#
					</cfif>
				</td>
						<!---First Name 8--->
						<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#bfirstname1#
						</td>
						<!---Last Name 8--->
						<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#blastname1#
						</td>
						<!---Order Number 8--->
						<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>
						 </td>
						<!--Fee 8--->
						<CFQUERY datasource="#request.dsn#" NAME="read_Fee8">
					SELECT Fee
					FROM EventList
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif  #read_Fee8.fee# neq "">
	 					<font size=1 color=black face=verdana><b>#read_Fee8.fee#</FONT></B>
				<cfelse>
						<font size=1 color=black face=verdana><b>N/A</FONT></B>
				</cfif>
				</td>
						<!---Ins Upl 8--->
						<CFQUERY datasource="#request.dsn#" NAME="read_inst_8">
					SELECT closing_instructions,closing_inst_date,closing_inst_time
					FROM Doc_Closer_TitleProp
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_inst_8.closing_instructions# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_inst_8.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_inst_8.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(read_inst_8.closing_inst_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
				</td>
						<!---HUD Upl 8--->
						<CFQUERY datasource="#request.dsn#" NAME="read_hud_8">
					SELECT final_hud,final_hud_date,final_hud_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_hud_8.final_hud# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_hud_8.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_hud_8.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(read_hud_8.final_hud_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
						<!---Requested Date 8--->
						<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(a_filled_out_date,'m/d/yy')#
						</td>
						<!---Scheduled Date 8--->
						<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">

							#c_month#/#c_day#/#right(c_year,2)#
						</td>
						<!---Closing Request 8--->
<cfif #request_date# NEQ "">
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./PROP_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
						</td>
				<CFELSE>

					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report4.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
						</td>
					</CFIF>

					<CFQUERY datasource="#request.dsn#" NAME="read_cl">
						SELECT *
						FROM doc_closer_prop
						WHERE prop_ID = #prop_id#
					</CFQUERY>
					<!---Closer Assign 8--->
					<cfif (#read_cl.a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
						</td>
				<CFELSE>

					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report4.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
						</td>
					</CFIF>
					<!---Closing Submit 8--->
		<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#"><font size=1 color=blue face=verdana>SUB</font></a>
						</td>
				<CFELSE>
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#"><font size=1 color=red face=verdana>SUB</font></a>

						</td>
					</CFIF>

			<!---Closed 8--->
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>

							<FONT FACE=verdana SIZE=1 color="black">
							Closed
							<cfelse>
							<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>

							</cfif>
					</td>
						<!---Suspend 8--->
							<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
							<cfif #UID# EQ "10" OR #UID# EQ "21"  OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198"><cfif #read_report4.loanfun# eq ""><FONT FACE=verdana SIZE=1 color="red"><a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&a_trigger=1" target="fund_prop" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><FONT FACE=verdana SIZE=1 color="red">fund</font></a><cfelse><FONT FACE=verdana SIZE=1 color="blue">funded</font></cfif>
		<cfelse><a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&a_trigger=1"><font size=1 color="red" FACE=verdana>susp</font></a></cfif>
						</td>
					</td>
						<!---Comments 8--->
							<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="red"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report4.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

					</td>
					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>
			<CFOUTPUT QUERY="read_report5">
					<tr>
						<!---time 9--->
						<CFQUERY datasource="#request.dsn#" NAME="read_time9">
					SELECT a_Req_Closing_Time
					FROM Title_Closing_Order_Request_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfif #read_time9.a_Req_Closing_Time# eq"">
						N/A
					<cfelse>
						#TimeFormat(read_time9.a_Req_closing_time, "h:mm tt")#
					</cfif>
				</td>
						<!---First Name 9--->
						<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#bfirstname1#
						</td>
						<!---Last Name 9--->
						<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#blastname1#
						</td>
						<!---Order Number 9--->
						<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>

						</td>
						<!--Fee  9--->
						<CFQUERY datasource="#request.dsn#" NAME="read_Fee9">
					SELECT Fee
					FROM EventList
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif  #read_Fee9.fee# neq "">
	 					<font size=1 color=black face=verdana><b>#read_Fee9.fee#</FONT></B>
				<cfelse>
						<font size=1 color=black face=verdana><b>N/A</FONT></B>
				</cfif>
				</td>
						<!---Ins Upl 9--->
						<CFQUERY datasource="#request.dsn#" NAME="read_inst_9">
					SELECT closing_instructions,closing_inst_date,closing_inst_time
					FROM Doc_Closer_Prop
					WHERE propID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_inst_9.closing_instructions# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_inst_9.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_inst_9.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(read_inst_9.closing_inst_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
				</td>
						<!---HUD Upl 9--->
						<CFQUERY datasource="#request.dsn#" NAME="read_hud_9">
					SELECT final_hud,final_hud_date,final_hud_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_hud_9.final_hud# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_hud_9.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_hud_9.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(read_hud_9.final_hud_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
						<!---Requested Date 9--->
						<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(a_filled_out_date,'m/d/yy')#
						</td>
						<!---Scheduled Date 9--->
						<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">

							#c_month#/#c_day#/#right(c_year,2)#
						</td>
						<!---Closing Request 9--->
<cfif #request_date# NEQ "">
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./PROPERTY_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
						</td>
				<CFELSE>

					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report5.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
						</td>
					</CFIF>

					<CFQUERY datasource="#request.dsn#" NAME="read_cl">
						SELECT *
						FROM doc_closer_prop
						WHERE prop_ID = #prop_id#
					</CFQUERY>
					<!---Closer Assign 9--->
					<cfif (#read_cl.a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
						</td>
				<CFELSE>

					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report5.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
						</td>
					</CFIF>

					<!---Closing Submit 9--->
		<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#"><font size=1 color=blue face=verdana>SUB</font></a>
						</td>
				<CFELSE>
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#"><font size=1 color=red face=verdana>SUB</font></a>

						</td>
					</CFIF>

					<!---Closed 9--->
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>

							<FONT FACE=verdana SIZE=1 color="black">
							Closed
							<cfelse>
							<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>

							</cfif>
					</td>
							<!---Suspend 9--->
							<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
							<cfif #UID# EQ "10" OR #UID# EQ "21"  OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198"><cfif #read_report5.loanfun# eq ""><FONT FACE=verdana SIZE=1 color="red"><a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&a_trigger=1" target="fund_prop" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><FONT FACE=verdana SIZE=1 color="red">fund</font></a><cfelse><FONT FACE=verdana SIZE=1 color="blue">funded</font></cfif>
	<cfelse><a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&a_trigger=1"><font size=1 color="red" FACE=verdana>susp</font></a></cfif>
					</td>
					</td>
						<!---Comments 9--->
							<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="red"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report5.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

					</td>
					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>
			<CFOUTPUT QUERY="read_report6">
					<tr>
						<!---time 10--->
						<CFQUERY datasource="#request.dsn#" NAME="read_time10">
					SELECT a_Req_Closing_Time
					FROM Title_Closing_Order_Request_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=80 align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfif #read_time10.a_Req_Closing_Time# eq"">
						N/A
					<cfelse>
						#TimeFormat(read_time10.a_Req_closing_time, "h:mm tt")#
					</cfif>
				</td>
						<!---First Name 10--->
						<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#bfirstname1#
						</td>
						<!---Last Name 10--->
						<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#blastname1#
						</td>
						<!---Order Number 10--->
						<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>#prop_id#</font></a>
						</td>
						<!--Fee 10--->
						<CFQUERY datasource="#request.dsn#" NAME="read_Fee10">
					SELECT Fee
					FROM EventList
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif  #read_Fee10.fee# neq "">
	 					<font size=1 color=black face=verdana><b>#read_Fee10.fee#</FONT></B>
				<cfelse>
						<font size=1 color=black face=verdana><b>N/A</FONT></B>
				</cfif>
				</td>
						<!---Ins Upl 10--->
				<CFQUERY datasource="#request.dsn#" NAME="read_inst_10">
					SELECT closing_instructions,closing_inst_date,closing_inst_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_inst_10.closing_instructions# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_inst_10.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_inst_10.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(read_inst_10.closing_inst_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
				</td>
						<!---HUD Upl 10--->
					<CFQUERY datasource="#request.dsn#" NAME="read_hud_10">
					SELECT final_hud,final_hud_date,final_hud_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_hud_10.final_hud# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_hud_10.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_hud_10.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(read_hud_10.final_hud_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
						<!---Requested Date 10--->

						<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(a_filled_out_date,'m/d/yy')#
						</td>
						<!---Scheduled Date 10 --->
						<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">

							#c_month#/#c_day#/#right(c_year,2)#
						</td>

<cfif #request_date# NEQ "">
						<!---Closing Request 10--->
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./PROP_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
						</td>
				<CFELSE>

					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report6.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
						</td>
					</CFIF>

					<CFQUERY datasource="#request.dsn#" NAME="read_cl">
						SELECT *
						FROM doc_closer_prop
						WHERE prop_ID = #prop_id#
					</CFQUERY>
					<!---Closer Assign 10--->
					<cfif (#read_cl.a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
						</td>
				<CFELSE>

					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report6.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
						</td>
					</CFIF>
					<!---Closing Submit 10--->
		<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#"><font size=1 color=blue face=verdana>SUB</font></a>
						</td>
				<CFELSE>
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#"><font size=1 color=red face=verdana>SUB</font></a>

						</td>
					</CFIF>

			<!---Closed 10--->
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>

							<FONT FACE=verdana SIZE=1 color="black">
							Closed
							<cfelse>
							<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>

							</cfif>
					</td>
					<!---Suspend 10--->
							<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
							<cfif #UID# EQ "10" OR #UID# EQ "21" OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198"><cfif #read_report6.loanfun# eq ""><FONT FACE=verdana SIZE=1 color="red"><a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&a_trigger=1" target="fund_prop" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><FONT FACE=verdana SIZE=1 color="red">fund</font></a><cfelse><FONT FACE=verdana SIZE=1 color="blue">funded</font></cfif>
	<cfelse><a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&a_trigger=1"><font size=1 color="red" FACE=verdana>susp</font></a></cfif>
					</td>
					</td>
						<!---Comments 10--->
							<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="red"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report6.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

					</td>
					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>
			<cfelse>
			<CFOUTPUT QUERY="read_report">
					<tr>
						<!---time 11--->
						<CFQUERY datasource="#request.dsn#" NAME="read_time11">
					SELECT a_Req_Closing_Time
					FROM Title_Closing_Order_Request_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfif #read_time11.a_Req_Closing_Time# eq"">
						N/A
					<cfelse>
						#TimeFormat(read_time11.a_Req_closing_time, "h:mm tt")#
					</cfif>
				</td>
						<!---First Name 11--->
						<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#bfirstname1#
						</td>
						<!---Last Name 11--->
						<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#blastname1#
						</td>
						<!---Order Number 11--->
						<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&a_trigger=1&company_id=#comp_id#"><font size=1 color=blue face=verdana>0232#prop_id#</font></a>

						</td>
						<!--Fee 11--->
						<CFQUERY datasource="#request.dsn#" NAME="read_Fee11">
					SELECT Fee
					FROM EventList
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif  #read_Fee11.fee# neq "">
	 					<font size=1 color=black face=verdana><b>#read_Fee11.fee#</FONT></B>
				<cfelse>
						<font size=1 color=black face=verdana><b>N/A</FONT></B>
				</cfif>
				</td>
						<!---Ins Upl 11--->
				<CFQUERY datasource="#request.dsn#" NAME="read_inst_11">
					SELECT closing_instructions,closing_inst_date,closing_inst_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_inst_11.closing_instructions# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_inst_11.closing_instructions#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_inst_11.closing_inst_date,'m/d/yy')#&nbsp;#TimeFormat(read_inst_11.closing_inst_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
				</td>
						<!---HUD Upl 11--->
						<CFQUERY datasource="#request.dsn#" NAME="read_hud_11">
					SELECT final_hud,final_hud_date,final_hud_time
					FROM Doc_Closer_Prop
					WHERE prop_ID = #prop_id#
				</CFQUERY>
				<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
				<cfif #read_hud_11.final_hud# neq "">
	     				<A HREF="#fileSys.FindFilePath('#read_hud_11.final_HUD#', 'url')#" target="new"><font size=1 color=black face=verdana><b>#DateFormat(read_hud_11.final_hud_date,'m/d/yy')#&nbsp;#TimeFormat(read_hud_11.final_hud_time, "HH:mm")#</b></a>
		 			<cfelse>
						<B><font size=1 color=black face=verdana>N/A</B>
					</cfif>
					</td>
						<!---Requested Date 11--->

						<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(a_filled_out_date,'m/d/yy')#
						</td>
						<!---Scheduled Date 11--->
						<td bgcolor="#a_bgcolor#" width=25 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">

							#c_month#/#c_day#/#right(c_year,2)#
						</td>

<cfif #request_date# NEQ "">
						<!---Closing Request 11--->
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./PROP_CLOSING_ORDER_REQUEST_VIEW_ONLY.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#"><font size=1 color=blue face=verdana>REQ</font></a>
						</td>
				<CFELSE>

					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./form_prop_closing_order_requesta.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report.prop_id#"><font size=1 color=red face=verdana>REQ</font></a>
						</td>
					</CFIF>

					<CFQUERY datasource="#request.dsn#" NAME="read_cl">
						SELECT *
						FROM doc_closer_prop
						WHERE prop_ID = #prop_id#
					</CFQUERY>
					<!---Closer Assign 11--->
					<cfif (#read_cl.a_date_assigned# NEQ "") and (#appraisal_status# eq 'Closer Assigned' or #appraisal_status# eq 'Closing Scheduled' or #appraisal_status# eq 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&company_id=#comp_id#"><font size=1 color=blue face=verdana>ASS</font></a>
						</td>
				<CFELSE>

					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_doc_view.cfm?uid=#getuser.id#&al=#URL.al#&rec_id=#read_report.prop_id#&company_id=#comp_id#"><font size=1 color=red face=verdana>ASS</font></a>
						</td>
					</CFIF>
					<!---Closing Submit 11--->
		<cfif (#c_month# NEQ "") and (#appraisal_status# EQ 'Closing Scheduled' or #appraisal_status# EQ 'Loan Closed' or #appraisal_status# EQ 'In Typing' or #appraisal_status# EQ 'Report E-mailed')>
						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						 <a href="./calendar_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#"><font size=1 color=blue face=verdana>Submitted</font></a>
						</td>
				<CFELSE>
					<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#"><font size=1 color=red face=verdana>Submit</font></a>

						</td>
					</CFIF>

			<!---Closed 11--->
			<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<cfif (#l_date# neq "") and (#appraisal_status# EQ "Loan Closed" or #appraisal_status# eq "In Typing" or #appraisal_status# eq "Report E-mailed")>
							<FONT FACE=verdana SIZE=1 color="black">
							Closed
							<cfelse>
							<FONT FACE=verdana SIZE=1 color="black"><a href="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&a_trigger=1"><font size=1 color=red face=verdana>Close</font></a>
							</cfif>
					</td>
							<!---Suspend 11--->
							<td bgcolor="#a_bgcolor#" width=30 align=right valign=top>
							<cfif #UID# EQ "10" OR #UID# EQ "21" OR #UID# EQ "74" OR #UID# EQ "80" OR #UID# EQ "85" OR #UID# EQ "110" OR #UID# EQ "159" OR #UID# EQ "198"><cfif #read_report.loanfun# eq ""><FONT FACE=verdana SIZE=1 color="red"><a href="./fund_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&a_trigger=1" target="fund_prop" onClick="window.open('','fund_prop','width=420,height=200,status=0,resizable=0,scrollbars=0')"><FONT FACE=verdana SIZE=1 color="red">fund</font></a><cfelse><FONT FACE=verdana SIZE=1 color="blue">funded</font></cfif>
		<cfelse><a href="./suspend_closing_prop.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&a_trigger=1"><font size=1 color="red" FACE=verdana>susp</font></a></cfif>
					</td>
					</td>
						<!---Comments 11--->
							<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="red"><a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&user_id=0&company_id=0&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

					</td>
					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>

			</cfif>
	</CFIF>	</CFIF>







				</table>





			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

</BODY>
</HTML>


