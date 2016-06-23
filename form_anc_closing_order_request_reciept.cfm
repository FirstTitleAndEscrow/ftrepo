
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="input_date" DEFAULT="">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="2">


<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM companies
		WHERE id = #comp_id#

	</CFQUERY>
<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_user.team_id#">
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


	<CFQUERY datasource="#request.dsn#" NAME="get_user">

			SELECT *
			FROM user_client_assoc
			WHERE company_id = #read_user.id#
			order by id
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_title">

			SELECT *
			FROM ancillary
			WHERE anc_ID = #rec_ID#



		</cfquery>
			<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT company
		FROM companies
		WHERE id = #get_title.comp_id#

	</CFQUERY>

		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->

	<CFQUERY datasource="#request.dsn#" NAME="read_title">
		SELECT *
		FROM ancillary
		WHERE anc_ID = #rec_ID#
	</cfquery>

	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT company
		FROM companies
		WHERE id = #read_title.comp_id#
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">
		SELECT *
		FROM First_Admin
		WHERE ID = #read_title.comp_ID#
	</CFQUERY>



				<CFQUERY datasource="#request.dsn#" NAME="bbb">
					SELECT *
					FROM Title_Closing_Order_Request_anc
					Where anc_Id = #rec_id#
				</CFQUERY>
				<CFSET requestDate = #DateFormat(input_date, "mm/dd/yyyy")#>
				<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
							<CFQUERY datasource="#request.dsn#">
				UPDATE Title_Closing_Order_Request_anc
				SET
					A_Req_Closing_Day   	 = '#DateFormat(requestDate, "dd")#',
					A_Req_Closing_Time		 = '#A_Req_Closing_Time#',
					A_Req_Closing_month		 = '#DateFormat(requestDate, "mm")#',
					A_Req_Closing_year		 = '#DateFormat(requestDate, "yyyy")#',
					A_Settle_Location		 = '#A_Settle_Location#',
					request_date  		= '#DateFormat(input_date, "mm/dd/yyyy")#',
					A_Req_By_Company 		 = '#A_Req_By_Company#',
					A_Req_By_Phone 			 = '#A_Req_By_Phone#',
					A_Req_By_Ext 			 = '#A_Req_By_Ext#',
					A_Req_By_Fax 			 = '#A_Req_By_Fax#',
					A_Req_By_Email 			 = '#A_Req_By_Email#',
					A_Req_By_After_Hours_Phone = '#A_Req_By_After_Hours_Phone#',
					A_Managers_Name 		 = '#A_Managers_Name#',
					A_Managers_Phone		 = '#A_Managers_Phone#',
					c_dateandtime		 = '#order_date_adj#',
					A_How_Will_Be_Shipped	 = '#A_How_Will_Be_Shipped#',
					c_comp_id = #read_title.comp_id#,
						A_Special_Inst			 = '#A_Special_Inst#',
						a_filled_out_date        = '#DateFormat(Now(), "m/d/yyyy")#',
						a_filled_out_time        = '#TimeFormat(Now(), "HH:mm:ss")#',
						a_filled_out_by          = #USER_ID_1#
				WHERE anc_ID = #rec_id#
			</CFQUERY>

			<cfif #bbb.request_dateold# neq "">

			<CFQUERY datasource="#request.dsn#" NAME="read_com">

			select * from Title_Notes
			WHERE order_ID = #rec_id# and N_Note like 'Postponed%'

		</CFQUERY>

			<cfif #read_com.recordcount# eq 0>
<cfinvoke	component = "cfc.team_info"	method = "getTeam"	returnVariable = "get_team_info" comp_id="#read_title.comp_id#">
<CFQUERY datasource="#request.dsn#" NAME="get_leader">
SELECT * from first_admin where ID = #get_team_info.leader_id#
</cfquery>
<cfset leader_email = get_leader.email>
<cfset leader_fname = get_leader.fname>
<cfset leader_lname = get_leader.lname>

			<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#leader_fname#', '#leader_lname#', #rec_id#, 'Closing request received by client', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>

		<cfelse>

		<cfquery datasource="#request.dsn#">
update Title_Notes
set  N_Note = 'Postponed to #DateFormat(requestDate, "mm")# #A_Req_Closing_Time#',
N_Date = '#DateFormat(Now(), "m/d/yyyy")#',
 N_Time = '#TimeFormat(Now(), "HH:mm:ss")#',
 access = '1',
 access2 = '1'
where order_ID = #rec_id# and N_Note like 'Postponed%'
</cfquery>

		</cfif>

			</cfif>


			<cfinvoke	component = "cfc.team_info"	method = "getTeam"	returnVariable = "get_team_info" comp_id="#read_title.comp_id#">
<CFQUERY datasource="#request.dsn#" NAME="get_leader">
SELECT * from first_admin where ID = #get_team_info.leader_id#
</cfquery>
<cfset leader_email = get_leader.email>
<cfset leader_fname = get_leader.fname>
<cfset leader_lname = get_leader.lname>

			<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#leader_fname#', '#leader_lname#', #rec_id#, 'Closing request received by client', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="read_event">
				select * from eventlist
				WHERE anc_ID = #rec_id#
			</CFQUERY>
		<cfif #read_event.c_day# neq "">



<cfquery name="get_old1" datasource="#request.dsn#">
select request_date, a_req_closing_date from Title_Closing_Order_Request_anc
where anc_id = #URL.rec_id#
</cfquery>

<cfquery name="upd2" datasource="#request.dsn#">
update Title_Closing_Order_Request_anc
set

	request_dateold = #get_old1.request_date#,
	a_req_closing_dateold = #get_old1.a_req_closing_date#
	where anc_id = #URL.rec_id#
</cfquery>

<cfquery name="get_old" datasource="#request.dsn#">
select yearmonth, c_time from eventlist
where anc_id = #URL.rec_id#
</cfquery>

<cfquery name="upd" datasource="#request.dsn#">
update eventlist
set

	yearmonthold = #get_old.yearmonth#,
	c_timeold = #get_old.c_time#
	where anc_id = #URL.rec_id#
</cfquery>

		<cfquery name="updateclosing" datasource="#request.dsn#">
update eventlist
set
	yearmonth = null,
	sc_dateandtime = null,
	yearmonthday = null,
	c_day = null,
	c_time = null,
	c_year = null,
	c_month = null,
	c_comment = null,
	s_time = null,
	s_date = null,
	l_date = null,
	l_time = null,
	closing_date = null
where anc_id = #URL.rec_id#
</cfquery>
	</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_cl">

			select * from doc_closer_anc
			WHERE anc_ID = #rec_id#

		</CFQUERY>
			<cfif #read_cl.a_date_assigned# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_t">


		UPDATE Doc_closer_anc
			SET closer_ID = null,
			a_Assigned_by = null,
			ac_dateandtime = null,
			a_Date_Assigned = null,
			a_Time_Assigned = null
			WHERE anc_ID = #rec_ID#

		</CFQUERY></cfif>



		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM ancillary
			WHERE anc_ID = #rec_ID#
		</cfquery>

		<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT company
		FROM companies
		WHERE id = #read_title.comp_id#

	</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">
				SELECT *
				FROM First_Admin
				WHERE ID = #read_title.comp_ID#
			</CFQUERY>



				<CFQUERY datasource="#request.dsn#" NAME="bbb">
					SELECT *
					FROM Title_Closing_Order_Request_anc
					Where anc_Id = #rec_id#
				</CFQUERY>


<CFQUERY datasource="#request.dsn#">
				UPDATE ancillary
				SET	appraisal_status = 'Closing Requested'
				WHERE anc_ID = #rec_id#
</cfquery>


		<cfquery name="getorderinfo" datasource="#request.dsn#">
SELECT *
FROM Title_Closing_Order_Request_anc
Where anc_Id = #rec_id#
</cfquery>

	<!--- Read all of the Notes for this title --->

			<CFQUERY datasource="#request.dsn#" NAME="aaaa">
				SELECT *
				FROM Title_Closing_Order_Request_anc
				Where anc_Id = #rec_id#
			</CFQUERY>

				<CFIF #aaaa.a_sent_by# GT 0>
					<CFSET a_sent = "1">
				<CFELSE>
					<CFSET a_sent = "0">
				</CFIF>

				<CFIF #aaaa.a_filled_out_by# GT 0>
					<CFSET a_filled = "1">
				<CFELSE>
					<CFSET a_filled = "0">
				</CFIF>


			<CFQUERY datasource="#request.dsn#" NAME="Read_Title">
				SELECT *
				FROM ancillary
				Where anc_Id = #rec_id#
			</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
				FROM ancillary
				Where anc_Id = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states
		WHERE company_id = #get_titleid.comp_id# AND a_states = '#get_titleid.pstate#'

</CFQUERY>
<cfif #get_billing_states.recordcount# GT "0">
<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  company_agency_assoc
		WHERE billing_id = '#get_billing_states.billing_id#'

</CFQUERY>

<cfelse>
<cfset #read_agency.TITLE_FT_AGENCY_NAME# = "Agency N/A">
</cfif>






		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
				FROM ancillary
				Where anc_Id = #rec_id#


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

					<CFIF #Read_Title_Order_Req.a_sent_by# GT 0 AND #Read_Title_Order_Req.a_filled_out_by# GT 0>
						<CFSET A_Update_DB_Flag = 3>
					<CFELSE>
						<CFSET A_Update_DB_Flag = 0>
					</CFIF>








		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
				FROM ancillary
				Where anc_Id = #rec_id#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE ID = '#comp_id#'
ORDER BY company ASC
</CFQUERY>
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
  							</tr><tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
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
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>PREMIUM CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="https://#cgi.server_name#/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="https://#cgi.server_name#/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="https://#cgi.server_name#/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="https://#cgi.server_name#/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
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
<!--- <td rowspan="2" VALIGN="Middle" width="210"><font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></td>
 ---><td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><b><a href="https://#cgi.server_name#/client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order Detail for Number: SN-#read_title.anc_id#</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></span>
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

		<p>
<cfoutput>

<center><b><font face=verdana size=3 color=blue> THANK YOU! CLOSING HAS BEEN REQUESTED FOR ORDER SN-#READ_TITLE.ANC_ID#</font></b></center>
<P><p>


</cfoutput><table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


	<tr>
		<td width=700 align=center valign=top>
		<B><font face=verdana size=2 color=white>Property Closing Order Request Form</FONT></B><br>
</tr>


		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>
<CFOUTPUT>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>
			<p>
			<br>
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>0232#URL.rec_id#</B></font></NOBR>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=350 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
			<td width=349 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
		</tr>
		<tr>
			<td width=350 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# #Read_Title.BLastName1#</B>
			</td>
			<td width=349 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# #Read_Title.BLastName2#</B>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR>
			</td>
		</tr>
	</table>


</CFOUTPUT>
<CFOUTPUT QUERY="aaaa">
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>

	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Date of Request -
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Date#</B>
			</td>

			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Time of Request -
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Time#</B>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_month#/#aaaa.A_Req_Closing_Day#/#aaaa.A_Req_Closing_year#</B>
			</td>

			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_Time#</B>
			</td>
		</tr>
	</table>


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
				<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>

					<tr>
			<td width=268 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			Location for Closing -
			</td>
			<td width=410 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue><B>#aaaa.A_Settle_Location#</B></PRE>
			</td>
				</tr>
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requesting Company -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Company#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Phone#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Ext#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Fax -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Fax#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Email -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Email#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						After Hours / Weekend Phone and Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_After_Hours_Phone#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Name -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Name#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Phone  -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Phone#</B>
						</td>

				</tr>
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					How will package be shipped  -
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_How_Will_Be_Shipped#</B>
				</td>
				</tr>
				<!--- ============================================================== --->
			</table>


				<font face=verdana size=2 color=black>
				Special Instructions :<br>
				<PRE><font face=verdana size=2 color=blue><B>#aaaa.A_Special_Inst#</B></PRE>

			</td>
		</tr>
	</table>


</CFOUTPUT>

<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=760 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=760 align=center colspan = 5 valign=top bgcolor=elelel>

			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR <cfoutput>#read_agency.title_ft_agency_name#</cfoutput> CONTACT LIST</b></FONT></center>
				</td>
				</tr>

		</center>
			<tr>
		<td width=150 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=150 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=150 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=150 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>






			<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">
				SELECT *
				FROM first_admin
				WHERE role_id = 5
				order by position desc
		</CFQUERY>

		<cfif #retrieve_user.recordcount# GT 0>
		<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="retrieve_user">
		<tr>
		<td width=150 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.Position#</td>
			<td width=150 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=150 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#retrieve_user.fax#</td>
			<td width=150 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black><a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
			</TR>
			</CFOUTPUT>
		</cfif>








</cfif> </table>



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


<CFSET b_emails_to_first_title = "malvarez@firsttitleservices.com,cshoup@firsttitleservices.com">


<CFIF #read_title.comp_id# eq "1835"> <!--- Union Mortgage - Annendale --->
	<CFSET b_emails_to_first_title = #b_emails_to_first_title# & ";closingdepartment@union-mtg.com">
	</CFIF>

	<cfif (#read_title.comp_id# neq "115") OR (#read_title.comp_id# neq "621")>
<CFMAIL
TO="#A_Req_By_Email#,#b_emails_to_first_title#"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="#session.site.short_name# - Closing Request for order #read_title.anc_id# -- Loan number-#read_title.loan_number#, #read_title.bfirstname1# #read_title.blastname1#"
TIMEOUT="600"
type="HTML"
>


<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


	<tr>
		<td width=700 align=center valign=top>
		<B><font face=verdana size=2 color=white>Property Closing Order Request Form</FONT></B><br>
</tr>


		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>
			<p>
			<br>
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=350 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
			<td width=349 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
		</tr>
		<tr>
			<td width=350 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# #Read_Title.BLastName1#</B>
			</td>
			<td width=349 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# #Read_Title.BLastName2#</B>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>State - <font face=verdana size=2 color=blue><b>#read_title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR>
			</td>
		</tr>
	</table>




	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Date of Request -
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Date#</B>
			</td>

			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Time of Request -
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Time#</B>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_month#/#aaaa.A_Req_Closing_Day#/#aaaa.A_Req_Closing_year#</B>
			</td>

			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_Time#</B>
			</td>
		</tr>
	</table>


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
				<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>

					<tr>
			<td width=268 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			Location for Closing -
			</td>
			<td width=410 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue><B>#aaaa.A_Settle_Location#</B></PRE>
			</td>
				</tr>
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requesting Company -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Company#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Phone#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Ext#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Fax -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Fax#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Email -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Email#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						After Hours / Weekend Phone and Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_After_Hours_Phone#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Name -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Name#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Phone  -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Phone#</B>
						</td>

				</tr>
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					How will package be shipped  -
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_How_Will_Be_Shipped#</B>
				</td>
				</tr>

			</table>


				<font face=verdana size=2 color=black>
				Special Instructions :<br>
				<PRE><font face=verdana size=2 color=blue><B>#aaaa.A_Special_Inst#</B></PRE>

			</td>
		</tr>
	</table>

</CFMAIL>
	<cfelse>
	<CFMAIL
TO="#b_emails_to_first_title#"
FROM="#team_email#"
Subject="#session.site.short_name# - Closing Request for order #read_title.anc_id# -- Loan number-#read_title.loan_number#, #read_title.bfirstname1# #read_title.blastname1#"
TIMEOUT="600"
type="HTML"
>


<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


	<tr>
		<td width=700 align=center valign=top>
		<B><font face=verdana size=2 color=white>Property Closing Order Request Form</FONT></B><br>
</tr>


		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>
			<p>
			<br>
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=350 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
			<td width=349 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
		</tr>
		<tr>
			<td width=350 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# #Read_Title.BLastName1#</B>
			</td>
			<td width=349 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# #Read_Title.BLastName2#</B>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>State - <font face=verdana size=2 color=blue><b>#read_title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR>
			</td>
		</tr>
	</table>




	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Date of Request -
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Date#</B>
			</td>

			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Time of Request -
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Time#</B>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_month#/#aaaa.A_Req_Closing_Day#/#aaaa.A_Req_Closing_year#</B>
			</td>

			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_Time#</B>
			</td>
		</tr>
	</table>


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
				<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>

					<tr>
			<td width=268 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			Location for Closing -
			</td>
			<td width=410 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue><B>#aaaa.A_Settle_Location#</B></PRE>
			</td>
				</tr>
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requesting Company -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Company#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Phone#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Ext#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Fax -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Fax#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Email -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Email#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						After Hours / Weekend Phone and Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_After_Hours_Phone#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Name -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Name#</B>
						</td>
					</tr>

					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Phone  -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Phone#</B>
						</td>

				</tr>
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					How will package be shipped  -
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_How_Will_Be_Shipped#</B>
				</td>
				</tr>

			</table>


				<font face=verdana size=2 color=black>
				Special Instructions :<br>
				<PRE><font face=verdana size=2 color=blue><B>#aaaa.A_Special_Inst#</B></PRE>

			</td>
		</tr>
	</table>

</CFMAIL>
	</cfif>
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
