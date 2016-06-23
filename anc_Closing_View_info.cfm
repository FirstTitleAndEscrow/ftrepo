
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="2">



	<cfquery name="get_id" datasource="#request.dsn#">
SELECT *
FROM ancillary
Where anc_Id = #URL.rec_id#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="Read_Title">
				SELECT *
				FROM ancillary
				Where anc_Id = #URL.rec_id#
			</CFQUERY>
<cfquery name="getorderinfo" datasource="#request.dsn#">
SELECT *
FROM Title_Closing_Order_Request_anc
Where anc_Id = #get_id.anc_id#
</cfquery>
<cfquery name="get_name" datasource="#request.dsn#">
select *
from ancillary
where anc_id = #getorderinfo.anc_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="aaaa">
				SELECT *
				FROM ancillary
				Where anc_Id = #URL.rec_id#
			</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title_order">
				SELECT *
				FROM ancillary
				Where anc_Id = #URL.rec_id#
			</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request_anc
				Where anc_Id = #rec_id#
			</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_info">
				SELECT *
				FROM eventlist
				Where anc_Id = #rec_id#
			</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="aaaa">
				SELECT *
				FROM eventlist
				Where anc_Id = #URL.rec_id#
			</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE ID = '#comp_id#'
ORDER BY company ASC
</CFQUERY>
<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_company.team_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>

<cfif #read_company.recordcount# GT 0>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
SELECT *
FROM users
WHERE comp_id = #read_company.id#
ORDER BY lp_lname ASC
</CFQUERY>
</cfif>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
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
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
	<tr><td align="right" valign="center">
  <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
&nbsp;&nbsp;</td>
  <td align="right" valign="center"><input type="text" name="number" size=10></td>
  <td align="right" valign="center">&nbsp;<input type="image" src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
  </tr>
   <tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr></table>
 </cfFORM>
</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>





<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">

		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		 <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='FECE62'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='E79DF5'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='FF0000'" onMouseOut="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='00FF66'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='FF9900'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='0066CC'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT>
			        	 </table></center>




		<table width=770 border="0" cellpadding="0" cellspacing="0" >
  <TBODY>


	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>


<table WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0" bgcolor="#00339A" height="57">
<tr>
<td>
<table WIDTH="672" CELLPADDING="0" CELLSPACING="0" BORDER="0" border="0">
<cfoutput><tr>
<td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><b><a href="https://#cgi.server_name#/client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order Detail for Number: SN-#read_title.anc_id#</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></span>
</td>
</tr></cfoutput>
<tr>
<td HEIGHT="20" ALIGN="Left" VALIGN="Bottom" >

</td></tr></table></td></tr></table>


	<TR>

	<cfoutput><td HEIGHT="3"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="3" width="1" /></td>
</TR><TR><td VALIGN="Middle"><table class="tbl" CELLPADDING="0" CELLSPACING="0" border="0">
		<TR><td><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="27" /></td></cfoutput>
<cfoutput><td><a class="lnk_mhsubnavsel" href="./title_report_nav_credit.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">View Order</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />

<CFIF (#Read_Title_Order_Req.request_date# eq "")>
<a class="lnk_mhsubnavsel" href="./form_anc_closing_order_request.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Request</font></a>
<cfelse><a class="lnk_mhsubnavsel" href="./anc_closing_report_nav.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Request</font></a>
</cfif>


<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />

<CFIF (#Read_Title_Order_info.c_month# neq "")>
<a class="lnk_mhsubnavsel" href="./anc_Closing_View_info.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Information</font></a>
<cfelse><font face="arial,helvetica" color="gray" size="2">Closing Information</font></cfif>



<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:#team_email#"><font face="arial,helvetica" color="0033CC" size="2">Contact Pre-Closing Team</font></a><img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:#team_email#"><font face="arial,helvetica" color="0033CC" size="2">Contact Closing/Post-Closing Team</font></a>
</td></cfoutput>

	</table></TR>

<TR><td HEIGHT="16" VALIGN="Top"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	<center><font face="arial,helvetica" color="Blue" size="2">

<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	</td>
</TR></td>
<TR>

<td align = "center" HEIGHT="16" VALIGN="Top"><br>



<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr><cfoutput>
			<td width=780 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closing Information for order #getorderinfo.anc_id#</B></CENTER>
			</TD>


		</TR>
	</table>
<TABLE WIDTH=455 BORDER=0 CELLSPACING=0 align="center" bgcolor=d3d3d3>
                <TBODY><br><br>
<!--- <TR><br><br>
<TD ALIGN=middle>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Individual Closing</FONT>
<HR>

</TD></TR> --->

<tr><td>




<center>
	<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>
		<!--- <tr>
			<td width=620 align=center valign=top bgcolor=e1e1e1>

			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
			</td>
		</tr> --->



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
			<center><NOBR>State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR></center>
			</td>
		</tr>


		<!--- <tr>
			<td width=620 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<center><NOBR>Job number - <font face=verdana size=2 color=blue><B> #getorderinfo.Job_Number#</B></NOBR></center>
			</td>
		</tr>
	 --->
</center>


</center>
<table border=1 cellspacing=0 cellpadding=3 align=center width=620 bgcolor=d3d3d3>
<tr>
	<br><br><td colspan=2 align="center"><b><font size=2 face=arial color="blue">Closing Info</font></b> </td>
</tr>


<tr>
	<td><font size=2 face=arial>Closing Date Assigned</font> </td>
	<td><font size=2 face=arial>

<!--- <select name="confirm_mon">
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

		</select> --->
<font color="Blue" size="2"><b>#aaaa.c_month#/#aaaa.c_day#/#aaaa.c_year#</b> </font>

</font></td>
</tr>

<tr>
	<td><font size=2 face=arial>Closing Time Assigned</font> </td>
	<td><font size=2 face=arial>
<!--- <SELECT name="confirm_time">
<option value="">
<option value="08:00 am">8:00 am
<option value="08:30 am">8:30 am
<option value="09:00 am">9:00 am
<option value="09:30 am">9:30 am
<option value="10:00 am">10:00 am
<option value="10:30 am">10:30 am
<option value="11:00 am">11:00 am
<option value="11:30 am">11:30 am
<option value="12:00 am">12:00 pm
<option value="12:30 am">12:30 pm
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
</SELECT> --->
<font color="Blue" size="2"><b>#TimeFormat(aaaa.c_time, "HH:mm:ss")#</b> </font>


	</td>
</tr>
</table>
<table border=1 cellspacing=0 cellpadding=3 align=center width=620 bgcolor=d3d3d3>
<tr>
	<td><font size=2 face=arial>Closing Info Comments</font> </td>
	<td><font size=2 face=arial><font color="Blue" size="2"><b>#aaaa.c_comment# </b></font></td>
</tr>

</table><p></p>






</CFOUTPUT>



<!---button for property report--->

<!--- <cfoutput>
<table border=0 align=center width=455 bgcolor=d3d3d3>
                            <TBODY>

<tr><td valign="center" align="center">
<input type="submit" name="update" value="Update & Email Closing Info.">
<input type="hidden" name="title_id" value="#getorderinfo.title_id#">
<input type="hidden" name="verifyemail" value="#get_name.verifyemail#">
<input type="hidden" name="blastname1" value="#get_name.blastname1#"><br>
<input type="hidden" name="bfirstname1" value="#get_name.bfirstname1#">
</td>
</form>
</tr>
</CFOUTPUT> --->


<!--- </table> ---></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TABLE>


</TD>
	</TR>


		</td>
	</tr><!--- ====================================================================== ---><!--- ====================================================================== ---><!--- ====================================================================== --->





	</table>


			</td>
		</tr>

	</table>

	</td></tr>
	<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>

	</tbody></table>


	</CENTER></CENTER>

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

