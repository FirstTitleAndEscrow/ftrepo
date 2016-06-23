<CFPARAM NAME="a_flag" DEFAULT="0">
<CFSET r_count = "0">

	
<CFINCLUDE TEMPLATE="./includes/companies.cfm">
<CFQUERY datasource="#request.dsn#" NAME="get_all_comps">
		
			SELECT ID, company
			FROM companies where ID in (#full_list_comp_ids#)
			ORDER BY company
		
		</CFQUERY>




		<CFSET c_count = "1">
		<CFSET a_company_name = ArrayNew(1)>
		<CFSET a_company_id   = ArrayNew(1)>
		
		<CFOUTPUT QUERY="read_companies">
			<CFSET a_company_name[c_count] = #company#>
			<CFSET   a_company_id[c_count] = #ID#>
			
			<CFSET c_count = #c_count# + "1">
		</CFOUTPUT>
		
	<!---=========================================== --->	
	<!---===================================================================== --->
	<!--- ===/ Use the list of companies to get a list of all their users \=== --->

		<CFSET    users_fname = ArrayNew(2)>
		<CFSET    users_lname = ArrayNew(2)>
		<CFSET       users_id = ArrayNew(2)>
		<CFSET    a_rec_count = ArrayNew(1)>
		
		<CFSET a_count = "1">
		<CFSET b_count = "1">
		
<!--- 			<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="CCC">
				<CFQUERY datasource="#request.dsn#" NAME="read_users" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
					SELECT *
					FROM users
					Where comp_id = #a_company_id[CCC]#
					ORDER BY lp_lname ASC, lp_fname ASC
				</CFQUERY>

					<CFOUTPUT QUERY="read_users">
						<CFSET users_fname[CCC][b_count] = #lp_fname#>
						<CFSET users_lname[CCC][b_count] = #lp_lname#>
						<CFSET    users_id[CCC][b_count] = #ID#>

						<CFSET b_count = #b_count# + "1">
					</CFOUTPUT>
						<CFSET a_rec_count[CCC] = #read_users.recordcount#>
						<CFSET b_count = "1">
			</CFLOOP> --->
	<!---===================================================================== --->		
		
<CFQUERY datasource="#request.dsn#" NAME="read_states" cachedwithin="#CreateTimeSpan(0,0,5,0)#">
		
			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC
		
		</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

<script type="text/javascript">
function prodSelect() {
var frm;
frm = document.frm;


if (frm.product.value == 'appraisal') {
location.href="http://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/statistics_select2.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=3&company_id=0";
  }
else if (frm.product.value == 'property') {
location.href="http://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/statistics_select2.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=2&company_id=0";

}
else if (frm.product.value == 'flood') {
location.href="http://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/statistics_select2.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=4&company_id=0";

}
else if (frm.product.value == 'avm') {
location.href="http://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/statistics_select2.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=9&company_id=0";

}
else if (frm.product.value == 'credit') {
location.href="http://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/statistics_select2.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=8&company_id=0";

}
else if (frm.product.value == 'signing') {
location.href="http://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/statistics_select2.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=7&company_id=0";

}
else if (frm.product.value == 'title') {
location.href="http://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/statistics_select2.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=1&company_id=0";

}

else if (frm.product.value == 'closing') {
location.href="http://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/statistics_select2.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=5&company_id=0";
}
else {

 location.href="http://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/statistics_select2.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=6&company_id=0";

 
}
}
</script>
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
function stateSelect() {
var frm;
frm = document.frm;


  frm.state.options[0].selected = false;


}

</script>
</head>



<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=780 align=center valign=top>
		
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=780 align=center valign=top bgcolor=e1e1e1>
		
<!--- 	<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=elelel>
	<tr>
			<td width=780 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<B>1. Send daily emails with a list of 'Abstracts Unreceived' order numbers to abstractors.<br>  
							2. Send reminder emails to customers if their file is not marked 'Clear to Close' 2 days before the Closing Schedule<br>
							-- Click <a href="./send_report_email.cfm?a_trigger=1" target="New" onClick="window.open('','New','width=370,height=370,left=40,top=40,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">EMAIL</a> to trigger the above events. (PLEASE CLICK ONLY ONCE A DAY)
							</B>
			<br>
			</TD>
		</TR>
</table> --->
<!--- ================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->

<cfif #url.a_trigger# eq "1">


 
<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
	SELECT title_id
	FROM title where cancelled is null
	<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True' or read_user.ft_fairfax_admin eq 'True'>
		<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
		and comp_id IN(#companylist#)
	</CFIF>			
	<cfif IsDefined("session.ft_user_id") and (session.mi_employee eq 1)>
	and order_date > '7/14/2008'
	<cfelseif IsDefined("session.ft_user_id") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
	and order_date > '10/01/2010'
	</CFIF>
	ORDER BY Title_id
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_vendor_list">
				SELECT distinct *
				FROM Abstractors
				ORDER BY company ASC
			</CFQUERY>


			
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for title</B></CENTER>
			</TD>
		</TR>
<CFFORM NAME="frm" ACTION="./title_statistics_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" METHOD=POST>
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0>

					
					<table width=350 cellpadding=1 cellspacing=1 border=0>
		<tr>		
<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
						</td>
</tr>
						<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<SELECT NAME="product"	onchange="prodSelect()"		
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
									<cfif #url.a_trigger# eq "1">
								<OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "2">
								<OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "3">
								<OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "4">
								<OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "9">
								<OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "7">
								<OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "5">
								<OPTION VALUE="closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
							</cfif>
							</SELECT>
						</td>
					</tr>
				</table>

					
					
					<table width=600 cellpadding=1 cellspacing=1 border=0>
							<tr>
						<nobr><td bgcolor=d3d3d3 width=600 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="black">
							
						
						<B>FROM</B>
		<select name="confirm_mon" onChange="monthresult()"
		
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		</TD></TR>		
		
						
						
					
					</TABLE>
				
				<table width=600 cellpadding=1 cellspacing=1 border=0>			
					<br><tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Title_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1" 
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
								clear: none;" 
								>
						</td>
					</tr>
				
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients 
						</td>
						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="company_id"	multiple		
								size="5" 
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
								
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<CFOUTPUT QUERY="get_all_comps"><OPTION VALUE="#get_all_comps.ID#">#get_all_comps.Company#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
		<!--- ================================================== --->
<!--- 					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="user_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>
							
							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
					<tr>
		<!--- ================================================== --->						
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Abstractor
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Abstractor"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<cfoutput query="read_vendor_list"><option value="#abstractor_id#" style="thin">#company#</OPTION></cfoutput>	 
	
	</SELECT>
						
						</td>
					</tr>
					<tr>
		<!--- ================================================== --->						
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Appraisal_status"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="In Process" style="thin">In Process</OPTION>	 
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	
	
	</SELECT>
						
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="comments"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
		<option value="Call for Detail">Call for Detail</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
	<option value="Clear to Close">Clear to Close</OPTION>
	<option value="Court House Closed">Court House Closed</OPTION>
	<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
	<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>	
	<option value="Judgments Exist">Judgments Exist</OPTION>
	<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
	<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
   <option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
   <option value="Not Clear to Close">Not Clear to Close</OPTION>
   <option value="OK to fund" style="thin">OK to fund</OPTION>
   <option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   <option value="Package Received" style="thin">Package Received</OPTION>  
   <option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
	<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>
   <option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
	<option value="Subordination Needed">Subordination Needed</OPTION>
	<option value="Subordination Received">Subordination Received</OPTION>
	<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
	<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	<option value="Vesting Issue">Vesting Issue</OPTION>
    <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
	<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  </SELECT>
						</td>
					</tr>
					
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1" 
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
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1" 
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
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
					<SELECT NAME="state" multiple
												size="5" 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: blue; 
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
										<OPTION VALUE="none" selected>ALL</OPTION>		
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
					</CFOUTPUT>
				</CFLOOP>	

					</SELECT><FONT FACE=verdana SIZE=1 color="black">(ALL should not be selected if you select state(s))</td></tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sortorder"			
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
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="a.check_date">Date Ordered</OPTION>
<OPTION VALUE="a.title_id">Order Number</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION>
 ---><OPTION VALUE="f.company">Abstractor</OPTION>
</SELECT>
						</td>
					</tr>	
					
		
		</table>
		
		<!--- ================================================== --->						
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -  
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
								size="1" 
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
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
								size="1" 
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
					</tr> --->
		<!--- ================================================== 	--->					
					
					
			<table width=800 cellpadding=1 cellspacing=1 border=0>	
			
			
						
					<br>	
					
					<tr>
						<td bgcolor=d3d3d3 width=75 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Fulfilled</b> Events
						</td>
						<td bgcolor=d3d3d3 width=370 align=left valign=top>
							<SELECT NAME="event1"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Assigned">Abstracts Assigned</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Abstracts Assigned<br>
							
							<SELECT NAME="event2"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Received">Abstracts Received</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Abstracts Received<br>
								<SELECT NAME="datamerged"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Data Merged">Data Merged</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Binder Data Merged<br>
							<SELECT NAME="event3"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Payoffs Ordered">Payoffs Ordered</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Payoffs Ordered<br>
								<SELECT NAME="event4"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Payoffs Received">Payoffs Received</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Payoffs Received<br>
							
								<SELECT NAME="event5"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Title Ins completed">Title Ins completed</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Title Ins completed<br>
							
								<SELECT NAME="event7"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Tax Data Completed">Tax Data Completed</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Tax Data Completed<br>
								
								<SELECT NAME="event8"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Abstract sent data<br>
								
								<SELECT NAME="event9"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Abstract sent files
								
							
								
								<SELECT NAME="event17"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Vendor note added">Vendor note added</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Vendor note added
							
							
							
							<SELECT NAME="event20"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Full Closing

									<SELECT NAME="event21"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Seller Rep Only
							
							
							<!--- <SELECT NAME="subordination_needed"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Subordination Needed">Subordination Needed</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Subordination Needed --->

							
							
							</td>
					<td bgcolor=d3d3d3 width=75 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Unfulfilled</b> Events
						</td>
						<td bgcolor=d3d3d3 width=370 align=left valign=top>
							<SELECT NAME="event10"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Not Assigned">Abstracts Unassigned</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Abstracts Unassigned<br>
							<SELECT NAME="event11"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Not Received">Abstracts Unreceived</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Abstracts Unreceived<br>
								
							<SELECT NAME="datanotmerged"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Data Not Merged">Data Not Merged</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Data Not Merged<br>
							
							<SELECT NAME="event12"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Payoffs Not Ordered">Payoffs Not Ordered</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Payoffs Not Ordered<br>
								
								<SELECT NAME="event13"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Payoffs Not Received">Payoffs Not Received</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Payoffs Not Received<br>
								
								<SELECT NAME="event14"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Title Ins Uncompleted">Title Ins Uncompleted</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Title Ins Uncompleted<br>
								
									<SELECT NAME="event16"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Tax Data Not Completed">Tax Data Uncompl</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Tax Data Uncompleted<br>
								<SELECT NAME="clear_close"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Not Clear to Close">Unclear to close</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Not Clear to Close<br>
								<SELECT NAME="event17"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Uncompleted ICL orders">Uncompleted ICLs</OPTION>
								
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Uncompleted ICL orders
								
								<!--- <SELECT NAME="subordination_not_received"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Subordination NOT Received">Subordination NOT Received</OPTION>
								
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Subordination NOT Received --->
								
		

						</td>
					</tr>
				<tr>
						<td bgcolor=d3d3d3 colspan=2 width=800 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> 
						</td>

					</tr></TABLE>
</CFFORM>
<!--- ======================================================================== --->

				</table>
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		</TR>

	</table>


<cfelseif #a_trigger# eq "2">
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_p">
		
			SELECT prop_id
			FROM property where 0 = 0
	<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True' or read_user.ft_fairfax_admin eq 'True'>
		<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
		and comp_id IN(#companylist#)
	</CFIF>			
			<cfif IsDefined("session.ft_user_id") and (session.mi_employee eq 1)>
	and order_date > '7/14/2008'
	<cfelseif IsDefined("session.ft_user_id") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
	and order_date > '10/01/2010'
	</CFIF>

			ORDER BY prop_id
		
		</CFQUERY>
	<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=purple>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Property</B></CENTER>
			</TD>
		</TR>
<CFFORM NAME="frm" ACTION="./title_statistics_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=2" METHOD=POST>
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>

					
					<table width=350 cellpadding=1 cellspacing=1 border=0>
		<tr>		
<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
						</td>
</tr>
						<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<SELECT NAME="product"	onchange="prodSelect()"		
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
								<cfif #url.a_trigger# eq "1">
								<OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "2">
								<OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "3">
								<OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "4">
								<OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "9">
								<OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "7">
								<OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "5">
								<OPTION VALUE="closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
							</cfif>
							</SELECT>
						</td>
					</tr>
				</table>

					
					
					<table width=600 cellpadding=1 cellspacing=1 border=0>
							<tr>
						<nobr><td bgcolor=d3d3d3 width=600 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="black">
							
						
						<B>FROM</B>
		<select name="confirm_mon" onChange="monthresult()"
		
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		</TD></TR>		
		
						
						
					
					</TABLE>
				
				<table width=600 cellpadding=1 cellspacing=1 border=0>			
					<br><tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Property Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="prop_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_p"><OPTION VALUE="#prop_ID#">#prop_ID#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1" 
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
								clear: none;" 
								>
						</td>
					</tr>
				
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="company_id"	multiple		
								size="5" 
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<CFOUTPUT QUERY="get_all_comps"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
		<!--- ================================================== --->
<!--- 					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="user_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>
							
							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<tr>					
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Appraisal_status"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="In Process" style="thin">In Process</OPTION>	 
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION></SELECT>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="comments"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
							<option value="Call for Detail">Call for Detail</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
	<option value="Clear to Close">Clear to Close</OPTION>
	<option value="Court House Closed">Court House Closed</OPTION>
	<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
	<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>	
	<option value="Judgments Exist">Judgments Exist</OPTION>
		<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
	<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
	<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
   <option value="Not Clear to Close">Not Clear to Close</OPTION>
   <option value="OK to fund" style="thin">OK to fund</OPTION>
   <option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   <option value="Package Received" style="thin">Package Received</OPTION>  
   <option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>	
   <option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
	<option value="Subordination Needed">Subordination Needed</OPTION>
	<option value="Subordination Received">Subordination Received</OPTION>
	<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
	<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	<option value="Vesting Issue">Vesting Issue</OPTION>
    <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
	<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  </SELECT>
	
						</td>
					</tr>
					
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1" 
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
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1" 
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
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
					<SELECT NAME="state" multiple
												size="5" 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: blue; 
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
								<OPTION VALUE="none" selected>ALL</OPTION>				
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
					</CFOUTPUT>
				</CFLOOP>	

					</SELECT><FONT FACE=verdana SIZE=1 color="black">(ALL should not be selected if you select state(s))</td></tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sortorder"			
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
<OPTION VALUE="NONE">N/A</OPTION>
<!--- <OPTION VALUE="oda_month">Month</OPTION> --->
<OPTION VALUE="a.prop_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION>
 ---></SELECT>
						</td>
					</tr>	
					
		
		</table>
		
		<!--- ================================================== --->						
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -  
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
								size="1" 
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
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
								size="1" 
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
					</tr> --->
		<!--- ================================================== 	--->					
					
					
			<table width=800 cellpadding=1 cellspacing=1 border=0>	
			
			
						
					<br>	
					
					<tr>
						<td bgcolor=d3d3d3 width=75 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Fulfilled</b> Events
						</td>
						<td bgcolor=d3d3d3 width=250 align=left valign=top>
							<SELECT NAME="event1"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Assigned">Abstracts Assigned</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Abstracts Assigned<br>
							
							<SELECT NAME="event2"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Received">Abstracts Received</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Abstracts Received<br>
							
							
							
								<SELECT NAME="event5"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Report completed">Report completed</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Report completed<br>
							
								<SELECT NAME="event7"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Tax Data Completed">Tax Data Completed</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black"> Tax Data Completed<br>
								
								<SELECT NAME="event8"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Abstract sent data <br>
								
								<SELECT NAME="propdatamerge"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Property Report Data Merged">Property Report Data Merged</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Property Report Data Merged<br>
								
								<SELECT NAME="event9"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Abstract sent files
								
								
								
								<SELECT NAME="event17"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Vendor note added">Vendor note added</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Vendor note added
							
							<SELECT NAME="event20"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Full Closing
							
							
							<SELECT NAME="event21"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Seller Rep Only
							
							</td>
					<td bgcolor=d3d3d3 width=75 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Unfulfilled</b> Events
						</td>
						<td bgcolor=d3d3d3 width=350 align=left valign=top>
							<SELECT NAME="event10"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Not Assigned">Abstracts Unassigned</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Abstracts Unassigned<br>
							<SELECT NAME="event11"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Not Received">Abstracts Unreceived</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Abstracts Unreceived<br>
							
							
								
								<SELECT NAME="event14"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Report Uncompleted">Report Uncompleted</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Report Uncompleted<br>
								<SELECT NAME="propdatanotmerge"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Property Report Data Not Merged">Property Report Data Not Merged</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Property Report Data Not Merged
								
								
								<SELECT NAME="event16"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Tax Data Not Completed">Tax Data Unompleted</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Tax Data Uncompleted
								
						</td>
					</tr>
						
						
				
				
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=800 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> 
						</td>

					</tr></TABLE>
</CFFORM>
<!--- ======================================================================== --->

				</table>
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		</TR>

	</table>
	
<cfelseif #a_trigger# eq "5">


<CFQUERY datasource="#request.dsn#" NAME="read_titleid_c">
SELECT *
FROM Title C, Title_Closing_Order_Request O 
WHERE O.a_Req_closing_month IS NOT NULL and c.cancelled is null
<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True' or read_user.ft_fairfax_admin eq 'True'>
<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
and c.comp_id IN(#companylist#)
</CFIF>	
	<cfif IsDefined("session.ft_user_id") and (session.mi_employee eq 1)>
	and c.order_date > '7/14/2008'
	<cfelseif IsDefined("session.ft_user_id") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
	and c.order_date > '10/01/2010'
	</CFIF>
and C.title_id = O.title_id
ORDER BY o.Title_id
</CFQUERY>
	<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Closing</B></CENTER>
			</TD>
		</TR>
<CFFORM NAME="frm" ACTION="./title_statistics_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=5" METHOD=POST>
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>

					
					<table width=350 cellpadding=1 cellspacing=1 border=0>
		<tr>		
<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
						</td>
</tr>
						<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<SELECT NAME="product"	onchange="prodSelect()"		
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
								<cfif #url.a_trigger# eq "1">
								<OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "2">
								<OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "3">
								<OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "4">
								<OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "9">
								<OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "7">
								<OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "5">
								<OPTION VALUE="closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
							</cfif>
							</SELECT>
						</td>
					</tr>
				</table>

					
					
					<table width=600 cellpadding=1 cellspacing=1 border=0>
							<tr>
						<nobr><td bgcolor=d3d3d3 width=600 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="black">
							
						
						<B>FROM</B>
		<select name="confirm_mon" onChange="monthresult()"
		
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		</TD></TR>		
		
						
						
					
					</TABLE>
					
				<table width=600 cellpadding=1 cellspacing=1 border=0>			
					<br><tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Title_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_c"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1" 
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
								clear: none;" 
								>
						</td>
					</tr>
				
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="company_id"	multiple		
								size="5" 
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								
								<CFOUTPUT QUERY="get_all_comps"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
		<!--- ================================================== --->
<!--- 					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="user_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>
							
							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== 						
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Appraisal_status"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<option value="Closing Requested" style="thin">Closing Requested</OPTION>
	<option value="Closer Assigned" style="thin">Closer Assigned</OPTION>
	<option value="Closing Complete" style="thin">Closing Complete</OPTION>
	<option value="Loan Closed" style="thin"> Loan Closed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION></SELECT>
						</td>
					</tr>--->
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="comments"			
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
									<OPTION VALUE="NONE">N/A</OPTION>
							<option value="Call for Detail">Call for Detail</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
	<option value="Clear to Close">Clear to Close</OPTION>
	<option value="Court House Closed">Court House Closed</OPTION>
	<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
	<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>	
	<option value="Judgments Exist">Judgments Exist</OPTION>
		<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
	<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
	<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
   <option value="Not Clear to Close">Not Clear to Close</OPTION>
   <option value="OK to fund" style="thin">OK to fund</OPTION>
   <option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   <option value="Package Received" style="thin">Package Received</OPTION>  
   <option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>	
   <option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
	<option value="Subordination Needed">Subordination Needed</OPTION>
	<option value="Subordination Received">Subordination Received</OPTION>
	<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
	<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	<option value="Vesting Issue">Vesting Issue</OPTION>
    <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
	<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
					</SELECT>	</td>
					</tr>
					
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1" 
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
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1" 
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
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
					<SELECT NAME="state" multiple
												size="5" 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: blue; 
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
				<OPTION VALUE="none" selected>ALL</OPTION>
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
					</CFOUTPUT>
				</CFLOOP>	

					</SELECT><FONT FACE=verdana SIZE=1 color="black">(ALL should not be selected if you select state(s))</td></tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sortorder"			
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
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="f.request_date">Order date</OPTION>
<OPTION VALUE="a.Title_id">Order Number</OPTION>
<!--- <OPTION VALUE="a.paddress">Property Address</OPTION> --->
<!--- <OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION> --->
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION>
 ---></SELECT>
						</td>
					</tr>	
					
		
		</table>
	
			<table width=800 cellpadding=1 cellspacing=1 border=0>	
			
			
						
					<br>	
					
		<tr>
						<td bgcolor=d3d3d3 width=75 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Fulfilled</b> Events
						</td>
						<td bgcolor=d3d3d3 width=350 align=left valign=top>
							

							<SELECT NAME="event7"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Closer Assigned">Closer Assigned</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Closer Assigned<br>
							
							<SELECT NAME="event2"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Closing Info Submitted">Closing Info Submitted</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Closing Info Submitted<br>
														<SELECT NAME="instructions_received"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Instructions Received">Instructions Received</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Instructions Received<br>
								
															<SELECT NAME="Final_HUD_Complete"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Final HUD Complete">Final HUD Complete</OPTION>
								</SELECT> <FONT FACE=verdana SIZE=1 color="black">Final HUD Complete<br>
								<SELECT NAME="event3"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Orders with closer files">Closer sent files</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black"> Closer sent files<br>
							
							<SELECT NAME="event4"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Orders with closer data">Closer sent data</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Closer sent data<br>
							
							<SELECT NAME="event8"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Loan Closed">Loan Closed</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Loan Closed<br>
							
							
							
							<SELECT NAME="sellerreploanclosed"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Seller Rep - Loan Closed">Seller Rep - Loan Closed</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Seller Rep - Loan Closed<br>
						
							<SELECT NAME="loanfun"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Loan Funded">Loan Funded</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Loan Funded<br>
							
							
							
							
							
							<SELECT NAME="loancloseorfun"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Loan Closed OR Funded">Loan Closed OR Funded</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Loan Closed OR Funded<br>
							
							
							<SELECT NAME="mortrec"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Mortgage Recorded">Mortgage Recorded</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Mortgage Recorded
							<SELECT NAME="titlepol"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Title Policy Completed">Title Policy Completed</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Title Policy Completed
							
<SELECT NAME="prefunding"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Pre-Funding Completed">Pre-Funding Completed</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Pre-Funding Completed

</td>
					<td bgcolor=d3d3d3 width=75 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Unfulfilled</b> Events
						</td>
						<td bgcolor=d3d3d3 width=550 align=left valign=top>
							
								<SELECT NAME="event5"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Closing Info Not Submitted">Closing Info Unsubmitted</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Closing Info Unsubmitted<br>
							<SELECT NAME="event6"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Closer Not Assigned">Closer Not Assigned</OPTION>
								 
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Closer Not Assigned<br>
														<SELECT NAME="Instructions_Unreceived"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Instructions Unreceived">Instructions Unreceived</OPTION>
								 
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Instructions Unreceived<br>
															<SELECT NAME="Final_HUD_Uncomplete"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Final HUD Uncomplete">Final HUD Uncomplete</OPTION>
								 
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Final HUD Uncomplete<br>
							<SELECT NAME="event19"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Loan Not Closed">Loan Not Closed</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Loan Not Closed<br>
							
							<SELECT NAME="loannotfun"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Loan Not Funded">Loan Not Funded</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Loan Not Funded<br>
							<SELECT NAME="mortnotrec"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Mortgage Not Recorded">Mortgage Not Recorded</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Mortgage Not Recorded
							<SELECT NAME="titlenotpol"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Title Policy Uncompleted">Title Policy Uncompleted</OPTION>
								  
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Title Policy Uncompleted


<SELECT NAME="prenotfunding"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Pre-Funding Not Completed">Pre-Funding Not Completed</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Pre-Funding Not Completed<br>

<SELECT NAME="packagenotreceived"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Package Not Received">Package Not Received</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Package Not Received<br>

<SELECT NAME="closingnotinvoiced"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Closing Not Invoiced">Closing Not Invoiced</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Closing Not Invoiced<br>
<SELECT NAME="srclosingnotpaid"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Seller-Rep Closing Not Paid">Seller-Rep Closing Not Paid</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Seller-Rep Closing Not Paid<br>

<SELECT NAME="mortgagerecordingissue"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Mortgage Recording Issue">Mortgage Recording Issue</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Mortgage Recording Issue


							</td>
					</tr>
						
					
					
				
				
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=800 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> 
						</td>

					</tr></TABLE>
</CFFORM>
<!--- ======================================================================== --->

				</table>
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		</TR>

	</table>
	
	
<cfelseif #a_trigger# eq "3">
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_a">
			SELECT app_id
			FROM appraisal where 0 = 0
	<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True' or read_user.ft_fairfax_admin eq 'True'>
		<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
		and comp_id IN(#companylist#)
	</CFIF>			
<cfif IsDefined("session.ft_user_id") and (session.mi_employee eq 1)>
	and order_date_adjusted > '7/14/2008'
<cfelseif IsDefined("session.ft_user_id") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
	and order_date_adjusted > '10/01/2010'
	</CFIF>
		
			ORDER BY app_id
</CFQUERY>	
	<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Appraisal</B></CENTER>
			</TD>
		</TR>
<CFFORM NAME="frm" ACTION="./title_statistics_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=3" METHOD=POST>
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>

					
					<table width=350 cellpadding=1 cellspacing=1 border=0>
		<tr>		
<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
						</td>
</tr>
						<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<SELECT NAME="product"	onchange="prodSelect()"		
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
								<cfif #url.a_trigger# eq "1">
								<OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "2">
								<OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "3">
								<OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "4">
								<OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "9">
								<OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "7">
								<OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "5">
								<OPTION VALUE="closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
							</cfif>
							</SELECT>
						</td>
					</tr>
				</table>

					
					
					<table width=600 cellpadding=1 cellspacing=1 border=0>
							<tr>
						<nobr><td bgcolor=d3d3d3 width=600 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="black">
							
						
						<B>FROM</B>
		<select name="confirm_mon" onChange="monthresult()"
		
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		</TD></TR>		
		
						
						
					
					</TABLE>
				
				<table width=600 cellpadding=1 cellspacing=1 border=0>			
					<br><tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appraisal Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="app_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_a"><OPTION VALUE="#app_ID#">#app_ID#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1" 
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
								clear: none;" 
								>
						</td>
					</tr>
				
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="company_id"	multiple		
								size="5" 
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								
								<CFOUTPUT QUERY="get_all_comps"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
		<!--- ================================================== --->
					<!--- <tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="user_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>
							
							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<tr>					
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Appraisal_status"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="In Process" style="thin">In Process</OPTION>	 
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION></SELECT>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="comments"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<option value="Call for Detail">Call for Detail</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
	<option value="Clear to Close">Clear to Close</OPTION>
	<option value="Court House Closed">Court House Closed</OPTION>
	<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
	<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>	
	<option value="Judgments Exist">Judgments Exist</OPTION>
		<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
	<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
	<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
   <option value="Not Clear to Close">Not Clear to Close</OPTION>
   <option value="OK to fund" style="thin">OK to fund</OPTION>
   <option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   <option value="Package Received" style="thin">Package Received</OPTION>  
   <option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>	
   <option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
	<option value="Subordination Needed">Subordination Needed</OPTION>
	<option value="Subordination Received">Subordination Received</OPTION>
	<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
	<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	<option value="Vesting Issue">Vesting Issue</OPTION>
    <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
	<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  
	  </SELECT>
	
						</td>
					</tr>
					
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1" 
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
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1" 
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
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
					<SELECT NAME="state" multiple
												size="5" 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: blue; 
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
								<OPTION VALUE="none" selected>ALL</OPTION>			
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
					</CFOUTPUT>
				</CFLOOP>	

					</SELECT><FONT FACE=verdana SIZE=1 color="black">(ALL should not be selected if you select state(s))</td></tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sortorder"			
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
<OPTION VALUE="NONE">N/A</OPTION>
<!--- <OPTION VALUE="oda_month">Month</OPTION> --->
<OPTION VALUE="a.app_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION>
 ---></SELECT>
						</td>
					</tr>	
					
		
		</table>
		
		<!--- ================================================== --->						
			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller First Name -  
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="Seller_fname"  size=25 maxlength=15
								size="1" 
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
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
								size="1" 
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
					</tr> --->
		<!--- ================================================== 	--->					
					
					
			<table width=800 cellpadding=1 cellspacing=1 border=0>	
			
			
						
					<br>	
					
					<tr>
						<td bgcolor=d3d3d3 width=75 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Fulfilled</b> Events
						</td>
						<td bgcolor=d3d3d3 width=250 align=left valign=top>
							<SELECT NAME="event1"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Assigned">Abstracts Assigned</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Abstracts Assigned<br>
							
							<SELECT NAME="event2"		
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Received">Abstracts Received</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Abstracts Received<br>
							
							
								
								<SELECT NAME="event8"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Abstract sent data <br>
								
								<SELECT NAME="event9"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>
								
							</SELECT> <FONT FACE=verdana SIZE=1 color="black">Abstract sent files
								
								
								
								<SELECT NAME="event17"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Vendor note added">Vendor note added</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Vendor note added



							<SELECT NAME="event20"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Full Closing
							
							
							<SELECT NAME="event21"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Seller Rep Only
							
							</td>
					<td bgcolor=d3d3d3 width=75 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Unfulfilled</b> Events
						</td>
						<td bgcolor=d3d3d3 width=350 align=left valign=top>
							<SELECT NAME="event10"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Not Assigned">Abstracts Unassigned</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Abstracts Unassigned<br>
							<SELECT NAME="event11"			
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<OPTION VALUE="Abstracts Not Received">Abstracts Unreceived</OPTION>
								</SELECT><FONT FACE=verdana SIZE=1 color="black">Abstracts Unreceived<br>
							
		</td>

				
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=800 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> 
						</td>

					</tr></TABLE>
</CFFORM>
<!--- ======================================================================== --->

				</table>
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		</TR>

	</table>
	
<cfelseif #a_trigger# eq 4>
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_anc">
			SELECT anc_id
			FROM ancillary where codeFlood is not null 
	<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True' or read_user.ft_fairfax_admin eq 'True'>
		<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
		and comp_id IN(#companylist#)
	</CFIF>			
			<cfif IsDefined("session.ft_user_id") and (session.mi_employee eq 1)>
	and order_date_adjusted > '7/14/2008'
			<cfelseif IsDefined("session.ft_user_id") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
	and order_date_adjusted > '10/01/2010'
	</CFIF>
	
			ORDER BY anc_id
</CFQUERY>

		<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=black>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Flood</B></CENTER>
			</TD>
		</TR>
<CFFORM NAME="frm" ACTION="./title_statistics_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=4" METHOD=POST>
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>

					
					<table width=350 cellpadding=1 cellspacing=1 border=0>
		<tr>		
<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
						</td>
</tr>
						<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<SELECT NAME="product"	onchange="prodSelect()"		
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
								<cfif #url.a_trigger# eq "1">
								<OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "2">
								<OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "3">
								<OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "4">
								<OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "9">
								<OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "7">
								<OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "5">
								<OPTION VALUE="closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
							</cfif>
							</SELECT>
						</td>
					</tr>
				</table>

					
					
					<table width=600 cellpadding=1 cellspacing=1 border=0>
							<tr>
						<nobr><td bgcolor=d3d3d3 width=600 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="black">
							
						
						<B>FROM</B>
		<select name="confirm_mon" onChange="monthresult()"
		
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		</TD></TR>		
		
						
						
					
					</TABLE>
				
				<table width=600 cellpadding=1 cellspacing=1 border=0>			
					<br><tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Flood Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="anc_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_anc"><OPTION VALUE="#anc_ID#">#anc_ID#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1" 
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
								clear: none;" 
								>
						</td>
					</tr>
				
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="company_id"	multiple		
								size="5" 
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								
								<CFOUTPUT QUERY="get_all_comps"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
		<!--- ================================================== --->
<!--- 					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="user_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>
							
							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<tr>					
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Appraisal_status"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="In Process" style="thin">In Process</OPTION>	 
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION></SELECT>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="comments"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
							<option value="Call for Detail">Call for Detail</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
	<option value="Clear to Close">Clear to Close</OPTION>
	<option value="Court House Closed">Court House Closed</OPTION>
	<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
	<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>	
	<option value="Judgments Exist">Judgments Exist</OPTION>
		<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
	<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
	<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
   <option value="Not Clear to Close">Not Clear to Close</OPTION>
   <option value="OK to fund" style="thin">OK to fund</OPTION>
   <option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   <option value="Package Received" style="thin">Package Received</OPTION>  
   <option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>	
   <option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
	<option value="Subordination Needed">Subordination Needed</OPTION>
	<option value="Subordination Received">Subordination Received</OPTION>
	<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
	<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	<option value="Vesting Issue">Vesting Issue</OPTION>
    <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
	<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  
	  </SELECT>
	
						</td>
					</tr>
					
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1" 
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
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1" 
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
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
					<SELECT NAME="state" multiple
												size="5" 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: blue; 
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
								<OPTION VALUE="none" selected>ALL</OPTION>				
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
					</CFOUTPUT>
				</CFLOOP>	

					</SELECT><FONT FACE=verdana SIZE=1 color="black">(ALL should not be selected if you select state(s))</td></tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sortorder"			
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
<OPTION VALUE="NONE">N/A</OPTION>
<!--- <OPTION VALUE="oda_month">Month</OPTION> --->
<OPTION VALUE="a.anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION>
 ---></SELECT>
						</td>
					</tr>	
				<br>	
					
					<tr>
						<td bgcolor=d3d3d3 colspan = 2 width=499 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Fulfilled</b> Events
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							
							<FONT FACE=verdana SIZE=1 color="black">Abstract sent data
								</td>
								<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="event8"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>
								
							</SELECT>
								</td>
					</tr>
						<tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
					<FONT FACE=verdana SIZE=1 color="black">Abstract sent files	
					</td>
					<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="event9"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>
								
							</SELECT> 
								
						</td>
					</tr>
						<tr>
							<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Vendor note added
							</td>
							<td bgcolor=d3d3d3 width=400 align=left valign=top>		
								
							<SELECT NAME="event17"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Vendor note added">Vendor note added</OPTION>
								
							</SELECT>
							


							<SELECT NAME="event20"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Full Closing
							
							
							<SELECT NAME="event21"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Seller Rep Only
						</td>
					</tr>	
		
		</table>
		
		
					
				<table width=600 cellpadding=1 cellspacing=1 border=0>	
			
		
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> 
						</td>

					</tr></TABLE>
</CFFORM>
<!--- ======================================================================== --->

				</table>
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		</TR>

	</table>
	
<cfelseif #a_trigger# eq 9>	
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_avm">		
			SELECT anc_id
			FROM ancillary where codeAVM is not null
	<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True' or read_user.ft_fairfax_admin eq 'True'>
		<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
		and comp_id IN(#companylist#)
	</CFIF>			
			<cfif IsDefined("session.ft_user_id") and (session.mi_employee eq 1)>
	and order_date_adjusted > '7/14/2008'
			<cfelseif IsDefined("session.ft_user_id") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
	and order_date_adjusted > '10/01/2010'
	</CFIF>
	
			ORDER BY anc_id
</CFQUERY>
		<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=red>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for AVM</B></CENTER>
			</TD>
		</TR>
<CFFORM NAME="frm" ACTION="./title_statistics_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=9" METHOD=POST>
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>

					
					<table width=350 cellpadding=1 cellspacing=1 border=0>
		<tr>		
<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
						</td>
</tr>
						<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<SELECT NAME="product"	onchange="prodSelect()"		
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
								<cfif #url.a_trigger# eq "1">
								<OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "2">
								<OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "3">
								<OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "4">
								<OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "9">
								<OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "7">
								<OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "5">
								<OPTION VALUE="closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
							</cfif>
							</SELECT>
						</td>
					</tr>
				</table>

					
					
					<table width=600 cellpadding=1 cellspacing=1 border=0>
							<tr>
						<nobr><td bgcolor=d3d3d3 width=600 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="black">
							
						
						<B>FROM</B>
		<select name="confirm_mon" onChange="monthresult()"
		
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		</TD></TR>		
		
						
						
					
					</TABLE>
				
				<table width=600 cellpadding=1 cellspacing=1 border=0>			
					<br><tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							AVM Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="avm_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_avm"><OPTION VALUE="#anc_ID#">#anc_ID#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1" 
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
								clear: none;" 
								>
						</td>
					</tr>
				
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="company_id"	multiple		
								size="5" 
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								
								<CFOUTPUT QUERY="get_all_comps"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
		<!--- ================================================== --->
<!--- 					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="user_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>
							
							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<tr>					
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Appraisal_status"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="In Process" style="thin">In Process</OPTION>	 
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION></SELECT>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="comments"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<option value="Call for Detail">Call for Detail</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
	<option value="Clear to Close">Clear to Close</OPTION>
	<option value="Court House Closed">Court House Closed</OPTION>
	<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
	<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>	
	<option value="Judgments Exist">Judgments Exist</OPTION>
		<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
	<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
	<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
   <option value="Not Clear to Close">Not Clear to Close</OPTION>
   <option value="OK to fund" style="thin">OK to fund</OPTION>
   <option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   <option value="Package Received" style="thin">Package Received</OPTION>  
   <option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>	
   <option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
	<option value="Subordination Needed">Subordination Needed</OPTION>
	<option value="Subordination Received">Subordination Received</OPTION>
	<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
	<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	<option value="Vesting Issue">Vesting Issue</OPTION>
    <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
	<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  
	  </SELECT>
	
						</td>
					</tr>
					
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1" 
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
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1" 
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
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
					<SELECT NAME="state" multiple
												size="5" 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: blue; 
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
								<OPTION VALUE="none" selected>ALL</OPTION>				
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
					</CFOUTPUT>
				</CFLOOP>	

					</SELECT><FONT FACE=verdana SIZE=1 color="black">(ALL should not be selected if you select state(s))</td></tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sortorder"			
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
<OPTION VALUE="NONE">N/A</OPTION>
<!--- <OPTION VALUE="oda_month">Month</OPTION> --->
<OPTION VALUE="a.anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION>
 ---></SELECT>
						</td>
					</tr>	
				<br>	
					
					<tr>
						<td bgcolor=d3d3d3 colspan = 2 width=499 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Fulfilled</b> Events
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							
							<FONT FACE=verdana SIZE=1 color="black">Abstract sent data
								</td>
								<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="event8"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>
								
							</SELECT>
								</td>
					</tr>
						<tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
					<FONT FACE=verdana SIZE=1 color="black">Abstract sent files	
					</td>
					<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="event9"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>
								
							</SELECT> 
								
						</td>
					</tr>
						<tr>
							<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Vendor note added
							</td>
							<td bgcolor=d3d3d3 width=400 align=left valign=top>		
								
							<SELECT NAME="event17"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Vendor note added">Vendor note added</OPTION>
								
							</SELECT>
							
							
							<SELECT NAME="event20"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Full Closing
							
							
							<SELECT NAME="event21"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Seller Rep Only

							</td>
					</tr>	
		
		</table>
		
		
					
				<table width=600 cellpadding=1 cellspacing=1 border=0>	
			
		
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> 
						</td>

					</tr></TABLE>
</CFFORM>
<!--- ======================================================================== --->

				</table>
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		</TR>

	</table>
	
<cfelseif #a_trigger# eq 8>
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_cr">		
			SELECT anc_id
			FROM ancillary where codeCR is not null
	<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True' or read_user.ft_fairfax_admin eq 'True'>
		<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
		and comp_id IN(#companylist#)
	</CFIF>			
			<cfif IsDefined("session.ft_user_id") and (session.mi_employee eq 1)>
	and order_date_adjusted > '7/14/2008'
			<cfelseif IsDefined("session.ft_user_id") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
	and order_date_adjusted > '10/01/2010'
	</CFIF>

			ORDER BY anc_id
</CFQUERY>
		<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=brown>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Credit</B></CENTER>
			</TD>
		</TR>
<CFFORM NAME="frm" ACTION="./title_statistics_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=8" METHOD=POST>
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>

					
					<table width=350 cellpadding=1 cellspacing=1 border=0>
		<tr>		
<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
						</td>
</tr>
						<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<SELECT NAME="product"	onchange="prodSelect()"		
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
								<cfif #url.a_trigger# eq "1">
								<OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "2">
								<OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "3">
								<OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "4">
								<OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "9">
								<OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "7">
								<OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "5">
								<OPTION VALUE="closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
							</cfif>
							</SELECT>
						</td>
					</tr>
				</table>

					
					
					<table width=600 cellpadding=1 cellspacing=1 border=0>
							<tr>
						<nobr><td bgcolor=d3d3d3 width=600 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="black">
							
						
						<B>FROM</B>
		<select name="confirm_mon" onChange="monthresult()"
		
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		</TD></TR>		
		
						
						
					
					</TABLE>
				
				<table width=600 cellpadding=1 cellspacing=1 border=0>			
					<br><tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Credit Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="cr_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_cr"><OPTION VALUE="#anc_ID#">#anc_ID#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1" 
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
								clear: none;" 
								>
						</td>
					</tr>
				
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="company_id"	multiple		
								size="5" 
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								
								<CFOUTPUT QUERY="get_all_comps"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
		<!--- ================================================== --->
<!--- 					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="user_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>
							
							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<tr>					
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Appraisal_status"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="In Process" style="thin">In Process</OPTION>	 
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION></SELECT>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="comments"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<option value="Call for Detail">Call for Detail</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
	<option value="Clear to Close">Clear to Close</OPTION>
	<option value="Court House Closed">Court House Closed</OPTION>
	<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
	<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>	
	<option value="Judgments Exist">Judgments Exist</OPTION>
		<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
	<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
	<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
   <option value="Not Clear to Close">Not Clear to Close</OPTION>
   <option value="OK to fund" style="thin">OK to fund</OPTION>
   <option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   <option value="Package Received" style="thin">Package Received</OPTION>  
   <option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>	
   <option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
	<option value="Subordination Needed">Subordination Needed</OPTION>
	<option value="Subordination Received">Subordination Received</OPTION>
	<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
	<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	<option value="Vesting Issue">Vesting Issue</OPTION>
    <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
	<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  </SELECT>
	
						</td>
					</tr>
					
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1" 
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
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1" 
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
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
					<SELECT NAME="state" multiple
												size="5" 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: blue; 
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
								<OPTION VALUE="none" selected>ALL</OPTION>				
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
					</CFOUTPUT>
				</CFLOOP>	

					</SELECT><FONT FACE=verdana SIZE=1 color="black">(ALL should not be selected if you select state(s))</td></tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sortorder"			
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
<OPTION VALUE="NONE">N/A</OPTION>
<!--- <OPTION VALUE="oda_month">Month</OPTION> --->
<OPTION VALUE="a.anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION>
 ---></SELECT>
						</td>
					</tr>	
				<br>	
					
					<tr>
						<td bgcolor=d3d3d3 colspan = 2 width=499 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Fulfilled</b> Events
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							
							<FONT FACE=verdana SIZE=1 color="black">Abstract sent data
								</td>
								<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="event8"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>
								
							</SELECT>
								</td>
					</tr>
						<tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
					<FONT FACE=verdana SIZE=1 color="black">Abstract sent files	
					</td>
					<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="event9"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>
								
							</SELECT> 
								
						</td>
					</tr>
						<tr>
							<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Vendor note added
							</td>
							<td bgcolor=d3d3d3 width=400 align=left valign=top>		
								
							<SELECT NAME="event17"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Vendor note added">Vendor note added</OPTION>
								
							</SELECT>


							<SELECT NAME="event20"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Full Closing
							
							
							<SELECT NAME="event21"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Seller Rep Only
							
							</td>
					</tr>	
		
		</table>
		
		
					
				<table width=600 cellpadding=1 cellspacing=1 border=0>	
			
		
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> 
						</td>

					</tr></TABLE>
</CFFORM>
<!--- ======================================================================== --->

				</table>
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		</TR>

	</table>
	
<cfelseif #a_trigger# eq 7>	
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_sn">		
			SELECT anc_id
			FROM ancillary where codeSigning is not null
	<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True' or read_user.ft_fairfax_admin eq 'True'>
		<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
		and comp_id IN(#companylist#)
	</CFIF>			
			<cfif IsDefined("session.ft_user_id") and (session.mi_employee eq 1)>
	and order_date_adjusted > '7/14/2008'
			<cfelseif IsDefined("session.ft_user_id") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
	and order_date_adjusted > '10/01/2010'
	</CFIF>

			ORDER BY anc_id
</CFQUERY>
		<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=orange>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Signing</B></CENTER>
			</TD>
		</TR>
<CFFORM NAME="frm" ACTION="./title_statistics_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=7" METHOD=POST>
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>

					
					<table width=350 cellpadding=1 cellspacing=1 border=0>
		<tr>		
<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
						</td>
</tr>
						<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<SELECT NAME="product"	onchange="prodSelect()"		
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
								<cfif #url.a_trigger# eq "1">
								<OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "2">
								<OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "3">
								<OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "4">
								<OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "9">
								<OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "7">
								<OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "5">
								<OPTION VALUE="closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
							</cfif>
							</SELECT>
						</td>
					</tr>
				</table>

					
					
					<table width=600 cellpadding=1 cellspacing=1 border=0>
							<tr>
						<nobr><td bgcolor=d3d3d3 width=600 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="black">
							
						
						<B>FROM</B>
		<select name="confirm_mon" onChange="monthresult()"
		
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		</TD></TR>		
		
						
						
					
					</TABLE>
				
				<table width=600 cellpadding=1 cellspacing=1 border=0>			
					<br><tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Signing Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sn_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_sn"><OPTION VALUE="#anc_ID#">#anc_ID#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1" 
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
								clear: none;" 
								>
						</td>
					</tr>
				
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="company_id"		multiple	
								size="5" 
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
								
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<CFOUTPUT QUERY="get_all_comps"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
		<!--- ================================================== --->
<!--- 					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="user_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>
							
							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<tr>					
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Appraisal_status"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="In Process" style="thin">In Process</OPTION>	 
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION></SELECT>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="comments"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
							<option value="Call for Detail">Call for Detail</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
	<option value="Clear to Close">Clear to Close</OPTION>
	<option value="Court House Closed">Court House Closed</OPTION>
	<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
	<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>	
	<option value="Judgments Exist">Judgments Exist</OPTION>
		<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
	<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
	<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
   <option value="Not Clear to Close">Not Clear to Close</OPTION>
   <option value="OK to fund" style="thin">OK to fund</OPTION>
   <option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   <option value="Package Received" style="thin">Package Received</OPTION>  
   <option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>	
   <option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
	<option value="Subordination Needed">Subordination Needed</OPTION>
	<option value="Subordination Received">Subordination Received</OPTION>
	<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
	<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	<option value="Vesting Issue">Vesting Issue</OPTION>
    <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
	<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  </SELECT>
	
						</td>
					</tr>
					
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1" 
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
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1" 
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
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
					<SELECT NAME="state" multiple
												size="5" 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: blue; 
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
								<OPTION VALUE="none" selected>ALL</OPTION>				
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
					</CFOUTPUT>
				</CFLOOP>	

					</SELECT><FONT FACE=verdana SIZE=1 color="black">(ALL should not be selected if you select state(s))</td></tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sortorder"			
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
<OPTION VALUE="NONE">N/A</OPTION>
<!--- <OPTION VALUE="oda_month">Month</OPTION> --->
<OPTION VALUE="a.anc_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION>
 ---></SELECT>
						</td>
					</tr>	
				<br>	
					
					<tr>
						<td bgcolor=d3d3d3 colspan = 2 width=499 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Fulfilled</b> Events
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							
							<FONT FACE=verdana SIZE=1 color="black">Abstract sent data
								</td>
								<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="event8"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract data">Abstract sent data</OPTION>
								
							</SELECT>
								</td>
					</tr>
						<tr>
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
					<FONT FACE=verdana SIZE=1 color="black">Abstract sent files	
					</td>
					<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="event9"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Orders with abstract files">Abstract sent files</OPTION>
								
							</SELECT> 
								
						</td>
					</tr>
						<tr>
							<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Vendor note added
							</td>
							<td bgcolor=d3d3d3 width=400 align=left valign=top>		
								
							<SELECT NAME="event17"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Vendor note added">Vendor note added</OPTION>
								
							</SELECT>
							
							
							<SELECT NAME="event20"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Full Closing
							
							
							<SELECT NAME="event21"			
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
								<OPTION VALUE="NONE"selected>N/A</OPTION>
									<OPTION VALUE="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>
								
							</SELECT><FONT FACE=verdana SIZE=1 color="black">Sales Call - Seller Rep Only

							</td>
					</tr>	
		
		</table>
		
		
					
				<table width=600 cellpadding=1 cellspacing=1 border=0>	
			
		
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> 
						</td>

					</tr></TABLE>
</CFFORM>
<!--- ======================================================================== --->

				</table>
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		</TR>

	</table>
	
	<cfelse>
		<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=gray>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for ALL products</B></CENTER>
			</TD>
		</TR>
<CFFORM NAME="frm" ACTION="./title_statistics_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6" METHOD=POST>
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>

					
					<table width=350 cellpadding=1 cellspacing=1 border=0>
		<tr>		
<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
						</td>
</tr>
						<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<SELECT NAME="product"	onchange="prodSelect()"		
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
								<cfif #url.a_trigger# eq "1">
								<OPTION VALUE="title" selected>Title</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "2">
								<OPTION VALUE="property" selected>Property</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "3">
								<OPTION VALUE="appraisal" selected>Appraisal</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "4">
								<OPTION VALUE="flood" selected>Flood</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "8">
								<OPTION VALUE="credit" selected>Credit</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "9">
								<OPTION VALUE="avm" selected>AVM</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "7">
								<OPTION VALUE="signing" selected>Signing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
								<cfelseif #url.a_trigger# eq "5">
								<OPTION VALUE="closing" selected>Closing</OPTION>
								<OPTION VALUE="all">All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<cfelse>
								<OPTION VALUE="all" selected>All</OPTION>
								<OPTION VALUE="title">Title</OPTION>
								<OPTION VALUE="property">Property</OPTION>
								<OPTION VALUE="appraisal">Appraisal</OPTION>
								<OPTION VALUE="flood">Flood</OPTION>
								<OPTION VALUE="credit">Credit</OPTION>
								<OPTION VALUE="avm">AVM</OPTION>
								<OPTION VALUE="signing">Signing</OPTION>
								<OPTION VALUE="closing">Closing</OPTION>
							</cfif>
							</SELECT>
						</td>
					</tr>
				</table>

					
					
					<table width=600 cellpadding=1 cellspacing=1 border=0>
							<tr>
						<nobr><td bgcolor=d3d3d3 width=600 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="black">
							
						
						<B>FROM</B>
		<select name="confirm_mon" onChange="monthresult()"
		
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
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
											color: BLUE; 
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
											color: BLUE; 
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
		</TD></TR>		
		
						
						
					
					</TABLE>
				
				<table width=600 cellpadding=1 cellspacing=1 border=0>			
					<br>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1" 
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
								clear: none;" 
								>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients 
						</td>

<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="company_id"	multiple		
								size="5" 
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
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								
								<CFOUTPUT QUERY="get_all_comps"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
		<!--- ================================================== --->
<!--- 					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="user_id"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>
							
							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<tr>					
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Appraisal_status"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="In Process" style="thin">In Process</OPTION>	 
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION></SELECT>
						</td>
					</tr>
						<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="comments"			
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
								<OPTION VALUE="NONE">N/A</OPTION>
							<option value="Call for Detail">Call for Detail</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
	<option value="Clear to Close">Clear to Close</OPTION>
	<option value="Court House Closed">Court House Closed</OPTION>
	<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
	<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>	
	<option value="Judgments Exist">Judgments Exist</OPTION>
		<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
	<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
	<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
   <option value="Not Clear to Close">Not Clear to Close</OPTION>
   <option value="OK to fund" style="thin">OK to fund</OPTION>
   <option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   <option value="Package Received" style="thin">Package Received</OPTION>  
   <option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>	
   <option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
	<option value="Subordination Needed">Subordination Needed</OPTION>
	<option value="Subordination Received">Subordination Received</OPTION>
     <option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
	<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	<option value="Vesting Issue">Vesting Issue</OPTION>
    <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
	<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  </SELECT>
	
						</td>
					</tr>
					
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1" 
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
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1" 
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
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
					<SELECT NAME="state" multiple
												size="5" 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: blue; 
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
								<OPTION VALUE="none" selected>ALL</OPTION>				
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
					</CFOUTPUT>
				</CFLOOP>	

					</SELECT><FONT FACE=verdana SIZE=1 color="black">(ALL should not be selected if you select state(s))</td></tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sortorder"			
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
<OPTION VALUE="NONE">N/A</OPTION>

<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<!--- <OPTION VALUE="User_ID">Loan Processor</OPTION>
 ---></SELECT>
						</td>
					</tr>	
				
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=800 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> <br>
						</td>

					</tr>
					
				
		<tr>
						<td bgcolor=d3d3d3 colspan=2 width=800 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>NOTE* For more detailed reports such as 'Fulfilled/Unfulfilled events, select a product from above</b>
						</td>

					</tr>				
					
					</TABLE>
</CFFORM>
<!--- ======================================================================== --->

				</table>
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		</TR>

	</table>
	
	</cfif>
	
	
	
	
	
			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	