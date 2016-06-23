<cfparam name="url.rec_id" default="0">
<cfparam name="rec_id" default="0">
<cfparam name="read_title.cema" default="0">
<cfparam name="read_title.opt_alta_4" default="">
<cfparam name="read_title.opt_alta_4_1" default="">
<cfparam name="read_title.opt_alta_5" default="">
<cfparam name="read_title.opt_alta_5_1" default="">
<cfparam name="read_title.opt_alta_6" default="">
<cfparam name="read_title.opt_alta_6_1" default="">
<cfparam name="read_title.opt_alta_6_2" default="">
<cfparam name="read_title.opt_alta_7" default="">
<cfparam name="read_title.opt_alta_8_1" default="">
<cfparam name="read_title.opt_alta_9" default="">
<cfparam name="read_title.opt_tx_1" default="0">
<cfparam name="read_title.opt_tx_2" default="0">
<cfparam name="read_title.opt_tx_3" default="0">
<cfparam name="read_title.opt_tx_4" default="0">
<cfparam name="read_title.opt_tx_5" default="0">
<cfparam name="read_title.opt_tx_6" default="0">
<cfparam name="read_title.opt_tx_7" default="0">
<cfparam name="read_title.opt_tx_8" default="0">
<cfparam name="read_title.opt_tx_9" default="0">
<cfparam name="read_title.opt_tx_10" default="0">
<cfparam name="read_title.opt_tx_11" default="0">
<cfparam name="read_title.opt_tx_12" default="0">
<cfparam name="read_title.opt_tx_13" default="0">
<cfparam name="read_title.opt_tx_14" default="0">
<cfparam name="read_title.opt_ut_4" default="0">
<cfparam name="read_title.opt_ut_41" default="0">
<cfparam name="read_title.opt_ut_5" default="0">
<cfparam name="read_title.opt_ut_51" default="0">
<cfparam name="read_title.opt_ut_6" default="0">
<cfparam name="read_title.opt_ut_61" default="0">
<cfparam name="read_title.opt_ut_62" default="0">
<cfparam name="read_title.opt_ut_81" default="0">
<cfparam name="read_title.opt_ut_9" default="0">
<cfparam name="read_title.opt_fl_nav" default="0">
<cfparam name="read_title.assessed_value" default="0">
<!--- 		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">
			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sales">
			SELECT *
			FROM First_Admin
			WHERE ID = #read_sel_company.IntSales#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_team_info">
			SELECT t.*, f.FNAME, f.LNAME
			FROM TEAMS t, FIRST_ADMIN f
			WHERE t.ID = #read_sel_company.Team_ID#
			and t.Leader_ID = f.ID
</CFQUERY> --->
		<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM Title
			WHERE title_ID = #url.rec_id#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="get_company">
			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<cfif read_title.asset_manager neq '' and read_title.asset_manager neq 'NULL'>
<cfset billing_co_id_to_use = read_title.asset_manager>
<cfelse>
<cfset billing_co_id_to_use = read_title.comp_id>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states_HUD2010 WHERE company_id = '#billing_co_id_to_use#' and a_states = '#read_title.pstate#'
order by state_id desc
</CFQUERY>

<cfif read_this_sets_billing_states.recordcount neq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
SELECT     *
FROM         Company_Billing_Values_HUD2010 AS h1 INNER JOIN
             Company_Billing_Values_B_HUD2010 AS h2 ON h1.Billing_ID = h2.Billing_ID
WHERE     (h1.Billing_ID = #read_this_sets_billing_states.billing_id#)
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  Company_Agency_Assoc_HUD2010
		WHERE billing_id = '#read_this_sets_billing_states.billing_id#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_itemized">
		SELECT * FROM
		ITEMIZED_1101_CHARGES
		WHERE billing_id = '#read_this_sets_billing_states.billing_id#'
		order by ID desc
</CFQUERY>
</cfif>
<!-- first queries finished -->
<cfflush>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>

<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	<!--- <tr>
		<td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td>
	</tr>
 --->


	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>


	<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
  		<tr>
    		<td align= "middle" height="76"><cfoutput><a href="" onclick="javascript:window.parent.document.location.href='#session.user_landing_page#';"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 brder=0></a></cfoutput></td>
  		</tr>
		<TR>
			<TD>
<CFOUTPUT>
<cfFORM NAME="Search" METHOD="post" ACTION="https://#cgi.server_name#/admin_area/title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" >
  				<FONT FACE=ARIAL SIZE=2 color="gray">Quick Search</font><input type=text name="number" size=10 maxlength=15
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
								><input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search"><br>
<font size="2"><a href="" onclick="javascript:window.parent.document.location.href='#session.user_landing_page#';">HOME</a></font>
</cfFORM>
</CFOUTPUT> </TD>
		</TR>
	</table>

	<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">

<!-- navigation screen completed -->
<cfflush>



<CFOUTPUT QUERY="read_title"> <!--- =================================== ---><!--- ===/    [ CLIENT INFO ]  TOP   \=== ---><!--- =================================== --->

<cfif read_title.closingInsight_transactionId neq '' and read_title.closingInsight_transactionId neq 'NULL'>
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
                                        <tr>
											<td width=590 align=center valign=top bgcolor="FFFF99">
												<B><font face=verdana size=2 color=red>THIS FILE MUST BE PROCESSED THROUGH THE REAL_EC SYSTEM</font></FONT></B>
											</td>
										</tr>
                                        </table></cfif>

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=bfbfbf>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CLIENT SPECIFIC INFORMATION</B></CENTER></FONT>
			</td>
		</tr>

		<TR>
			<TD width=519 align=left valign=top bgcolor=blue>
				<FONT SIZE=3 color=white face=arial>
				Order Number is...<b>T-#read_title.title_id#</b></FONT>
			</TD>
			</tr>
			<CFIF #Len(read_title.title_abstract)# gt 1>
				<tr>
					<TD width=519 align=left valign=top bgcolor=red>
						<FONT SIZE=3 color=white face=arial>
						<B>This Order has already been searched.  Refer to #read_title.title_abstract#</B></FONT>
					</TD>
				</tr>
			</CFIF>
		<TR>
			<TD width=519 align=middle valign=top bgcolor=d3d3d3>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=100 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Order Date</FONT>

						</td>

						<td width=255 colspan=3 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Due Date -</FONT>

						</td>

						<td width=155 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Status -</FONT>


						</td>
					</tr>

					<tr>
						<td width=100 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"> <b>#a_month#/#a_day#/#a_year#<br>
#TimeFormat(a_insert_time, "short")#</b></FONT>
						</td>

						<td width=85 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Month -	<FONT FACE=verdana SIZE=1 color="blue"><b>#DateFormat(duedate, "mm")#</b></FONT></FONT>
						</td>

						<td width=85 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Day - <FONT FACE=verdana SIZE=1 color="blue"><b>#DateFormat(duedate, "dd")#</b></FONT></FONT>
						</td>

						<td width=85 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Year - <FONT FACE=verdana SIZE=1 color="blue"><b>#DateFormat(duedate, "yyyy")#</b></FONT></FONT>
						</td>

						<td width=155 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#appraisal_status#</b></FONT>
						</td>
					</tr>
				</table></CFOUTPUT>

<CFOUTPUT QUERY="read_title">
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Loan Officer/Realtor:</b>
						</TD>

						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Loan Processor/Realtor:</b>
						</TD>

					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#oname#</B>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#pname#</B>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#ophone#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#pphone#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#oext#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#pext#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#ofax#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#pfax#</b>
						</td>
					</tr>

					<tr>
						<td width=300 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>

						<td width=300 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>
					</tr>

					<tr>
						<td width=400 colspan=2 bgcolor="f1f1f1" align=center valign=top> <!--- width=256 --->
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#o_email#</b>
						</td>

						<td width=400 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#p_email#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

</table>
<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td colspan=2 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Internal Processor:</b>
						</TD>					
					</tr>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name
						</td>


						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#ipname#</B>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#ipphone#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#ipext#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#ipfax#</b>
						</td>
					</tr>

					<tr>
						<td width=300 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>
					</tr>

					<tr>
						<td width=400 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#ip_email#</b>
						</td>
					</tr>
</table>

<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Realtors/Lenders:</b>
						</TD>
					</tr>
					<tr>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</TD>

						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name
						</TD>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name
						</TD>
						<td  width=219 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</TD>
					</tr>
					<tr>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title.lender_realtor_1#
						</TD>

						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="blue">
							#read_title.lender_realtor_fname_1#
						</TD>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="blue">
							#read_title.lender_realtor_lname_1#
						</TD>
						<td  width=219 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="blue">
							#read_title.lender_realtor_email_1#
						</TD>
					</tr>
<tr>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title.lender_realtor_2#
						</TD>

						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="blue">
							#read_title.lender_realtor_fname_2#
						</TD>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="blue">
							#read_title.lender_realtor_lname_2#
						</TD>
						<td  width=219 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="blue">
							#read_title.lender_realtor_email_2#
						</TD>
					</tr>
<tr>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title.lender_realtor_3#
						</TD>

						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="blue">
							#read_title.lender_realtor_fname_3#
						</TD>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="blue">
							#read_title.lender_realtor_lname_3#
						</TD>
						<td  width=219 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=verdana SIZE=1 color="blue">
							#read_title.lender_realtor_email_3#<br>
<br>

						</TD>
					</tr>

			</td>
		</tr>
</cfoutput>
<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>



						<tr>
			<td width=519 align=left colspan=2 valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Third Party Access Request</B></CENTER><br>
					<FONT FACE=arial SIZE=1 color="black"><B>This feature allows you to give access to third parties to your orders.

				</TD>
		</TR>	<CFQUERY datasource="#request.dsn#" NAME="third_party">
			SELECT *
			FROM thirdparty a inner join  thirdpartyorders b on a.ID = b.thirdpID
			WHERE orderid = #read_title.title_id#

		</CFQUERY>

		<tr>
			<td width=519 bgcolor="f1f1f1" align=left valign=top>

							<FONT FACE=ARIAL SIZE=1 color="black">
							<b>Selected Third Party(ies) for this order </b> </font><br><br>

			<B><cfoutput query="third_party"><FONT FACE=verdana SIZE=1 color="red">Name:</font> <FONT FACE=verdana SIZE=1 color="blue">#FIRST# #LAST# </font><FONT FACE=verdana SIZE=1 color="red">Company: </font><FONT FACE=verdana SIZE=1 color="blue">#COMPANY# </font><FONT FACE=verdana SIZE=1 color="red">Email:</font> <FONT FACE=verdana SIZE=1 color="blue">#EMAIL# </font><FONT FACE=verdana SIZE=1 color="red">Phone:</font><FONT FACE=verdana SIZE=1 color="blue"> #PHONE#</font><br></CFOUTPUT></b>
			<cfoutput  QUERY="read_title">

				</font><br>
		</td>


		</TR>




		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>BORROWER / SELLER INFORMATION</B></CENTER><br><FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Borrowers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname1#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame1#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>xxx-xx-#Right(bssn1, 4)#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone1#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext1#</b>
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Marital&nbsp;Status<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#b1mstatus#</b>
						</td>

					</tr>

		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ SECOND ] \=== --->
		<!--- =================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname2#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame2#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>xxx-xx-#Right(bssn2, 4)#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone2#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext2#</b>
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Marital&nbsp;Status<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#b2mstatus#</b>
						</td>

					</tr>


		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ THIRD ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							3.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname3#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname3#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame3#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>xxx-xx-#Right(bssn3, 4)#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone3#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone3#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext3#</b>
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Marital&nbsp;Status<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#b3mstatus#</b>
						</td>

					</tr>

		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ FOURTH ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							4.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname4#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname4#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame4#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>xxx-xx-#Right(bssn4, 4)#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone4#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone4#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext4#</b>
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Marital&nbsp;Status<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#b4mstatus#</b>
						</td>

					</tr>

					<tr>
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td width=25 colspan=1 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							&nbsp;
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Company Name<br></b>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#company1#</b>
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Tax ID <br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#taxID1#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>



	<!--- ======================================================================= --->

		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Sellers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- ================================== --->
		<!--- ===/  SELLERS Info [ FIRST ]  \=== --->
		<!--- ================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#slastname1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sfirstname1#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sminame1#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>xxx-xx-#Right(sssn1, 4)#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#shphone1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#swphone1#</b>

						</td>



						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sext1#</b>
						</td>

					</tr>

		<!--- ================================== --->
		<!--- ===/ SELLERS  Info [ SECOND ] \=== --->
		<!--- ================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#slastname2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sfirstname2#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sminame2#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>xxx-xx-#Right(sssn2, 4)#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#shphone2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#swphone2#</b>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sext2#</b>
						</td>

					</tr>

					<tr>
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td width=25 colspan=1 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							&nbsp;
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Company Name<br></b>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#company2#</b>
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Tax ID <br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#taxID2#</b>
						</td>
					</tr>
					<tr>
						<td width=25 colspan=1 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							&nbsp;
						</td>
						<td colspan=4 bgcolor="f1f1f1" align=left valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Company Address<br></b>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#company2addr#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>


</table>



<!--- ======================================================================== --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<B>PROPERTY ADDRESS</B>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Street Address <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#paddress#</b>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							City, State, Zip:</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<NOBR><FONT FACE=verdana SIZE=1 color="blue"><b>#pcity#,&nbsp;#pstate#  #pzip#</b>
							</NOBR>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pcounty#</b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Legal Description <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#plegaldesc#</b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Property Use <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#prop_use_type#</B>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is this a Condo or PUD <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#condo_pud#</b>
						</td>
					</tr>
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Time Home Buyer? <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b><cfif first_time_buyer eq 1>Yes<cfelse>No</cfif></b>
						</td>
					</tr>
					<cfif comp_id EQ 9711>
						<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Disposition Type<br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#disposition_type#</b>
						</td>
					</tr>
					<tr><td colspan="2" align="center">Rollover Fields</td></tr>
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Responsible Party<br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#responsibleparty_rollover#</b>
						</td>
					</tr>
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Rollover Explanation<br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#rolloverexplanation_rollover#</b>
						</td>
					</tr>
					<tr><td colspan="2" align="center">Exception Fields</td></tr>
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Responsible Party<br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#responsibleparty_exception#</b>
						</td>
					</tr>
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Rollover Explanation<br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#rolloverexplanation_exception#</b>
						</td>
					</tr>
					</cfif>

				</table>
			</td>
		</tr>


</table>



<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>MAILING ADDRESS</B></CENTER>
			</TD>
		</TR>
		<tr>
						<td width=519  COLSPAN = 2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							#mailing_address#
						</td>
		</tr>



				<tr>
			<td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>LOAN NUMBER</B></CENTER>
			</TD>
		</TR>
		<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Number&nbsp;&nbsp; <br>
						</td>
		<td width=314  bgcolor="f1f1f1" align=left valign=top>
							#loan_number#
						</td>
		</tr>
<cfif get_company.fairfax_client eq 'True'  or	get_company.fairfax_client eq 1>
		<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Type&nbsp;&nbsp; <br>
						</td>
		<td width=314  bgcolor="f1f1f1" align=left valign=top>
							#loanType#
						</td>
		</tr>
	</cfif>
				<tr>
			<td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>REO NUMBER</B></CENTER>
			</TD>
		</TR>
		<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							REO Number&nbsp;&nbsp; <br>
						</td>
		<td width=314  bgcolor="f1f1f1" align=left valign=top>
							#reo_number#
						</td>
		</tr>
				<tr>
			<td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CLOSING INSIGHT NUMBER</B></CENTER>
			</TD>
		</TR>
		<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Closing Insight Number&nbsp;&nbsp; <br>
						</td>
		<td width=314  bgcolor="f1f1f1" align=left valign=top>
							#closingInsight_transactionID#
						</td>
		</tr>

			<tr>
			<td width=519 colspan = 2 bgcolor="f1f1f1" align=center valign=top>

							<FONT FACE=ARIAL SIZE=1 color="gray">
							Type of HUD selected:


	<FONT FACE=ARIAL SIZE=2 color="red">
							<cfif #hud_type# eq 0>HUD1<cfelse>HUD1A</cfif>


		</td>


		</TR>

</table>
<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/       [ COMMENTS ]  TOP         \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>COMMENTS</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#a_COMMENT#</B>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->

<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/        [ PAYOFF ]  TOP          \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PAYOFF INFORMATION:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Payoff Lender  [ FIRST ]  \=== --->
		<!--- =================================== --->
	<tr>
						<td bgcolor="f1f1f1" align=center valign=top colspan=3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
<CENTER>Do payoffs need to be ordered?&nbsp;&nbsp;YES <input type="radio" name="payoff_needed" value="1" <cfif payoff_needed eq 1>checked</cfif>>&nbsp;&nbsp;NO <input type="radio" name="payoff_needed" value="0" <cfif payoff_needed eq 0>checked</cfif>></CENTER>
						</td>
					</tr>
									<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">First Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#polender1#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#poacctno1#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pophone1#</b>
						</td>
					</tr>

		<!--- ==================================== --->
		<!--- ===/ Payoff Lender  [ SECOND ]  \=== --->
		<!--- ==================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Second Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#polender2#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#poacctno2#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pophone2#</b>
						</td>
					</tr>


					<tr>
						<td width=172 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>

						<td width=172  bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->


<!--- ========================================= --->
<!--- ===/        [ PAYOFF ]  TOP          \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>SUBORDINATION INFORMATION:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Subordination Info  \=== --->
		<!--- =================================== --->
	
									<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#subLender#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#subaccountno#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Amount<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#subAmount#</b>
						</td>
					</tr>


	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->


<!--- ================================================ --->
<!--- ===/          [ TITLE INSURANCE ]           \=== --->
<!--- ================================================ --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>TITLE INSURANCE INFORMATION:</B></CENTER>
			</TD>
		</TR>

			<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
<cfif searchtype contains "Second Mortgage">
				<tr>
						<td bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Junior Loan Policy?</font>
						</td>
						<td colspan="3" bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b><cfif jlp_policy eq 1>Yes<cfelse>No</cfif></font>
						</td>
			        </tr>
</cfif>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Transaction Type
						</td>

						<td width=150 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#SearchType#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Deed Transfer
						</td>

						<td width=144 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Deedtransfer#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Proposed Insured
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Insured#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Amt
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#loanamt_float#</b>
						</td>
						</tr>

						<tr>
						<td width=140 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Current Loan Balances
						</td>

						<td COLSPAN=3 width=379 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#estimated_loan_float#</b>
						</td>
						</tr>

						<tr>

			<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Purchase Price </b>
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#purchase#</font></td>
					</tr>

						<tr>

			<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Assessed Value </b>
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#assessed_value#</font></td>
					</tr>


			<tr>
			<td width=519 colspan = 4 bgcolor="f1f1f1" align=left valign=top>

							<NOBR><FONT FACE=ARIAL SIZE=1 color="gray">
							Will there be a piggyback second mortgage closed with the above loan?
						<FONT FACE=ARIAL SIZE=2 color="red">
							<CFIF #piggy# EQ "0">NO<CFELSE>YES</CFIF></td>


		</TR>

			<tr>
			<td width=519 colspan = 4 bgcolor="f1f1f1" align=left valign=top>

							<NOBR><FONT FACE=ARIAL SIZE=1 color="gray">
							Will title insurance be required on this piggyback loan?
						<FONT FACE=ARIAL SIZE=2 color="red">
							<cfif #ins# eq 0>NO<cfelse>YES</CFIF>


		</td></TR>
				<tr>
			<td width=519 colspan = 4 bgcolor="f1f1f1" align=left valign=top>

							<NOBR><FONT FACE=ARIAL SIZE=1 color="gray">
							What is the loan amount of this second mortgage loan? #secloan#

		</td></TR>


					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Type
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#loan_type_111#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Program
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#loan_program_333#</b>
						</td>
					</tr>
<cfif read_title.pstate eq 'NY'>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is this a CEMA loan?
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b><cfif read_title.cema eq 1>Yes<cfelse>No</cfif></b>
						</td>
					</tr>
</cfif>


<!--- new altas --->
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Include ALTA Endorsements
						</td>

<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
<FONT FACE=ARIAL SIZE=1 color=black>




<!--- new Alta Form --->
<CFQUERY datasource="#request.dsn#" NAME="altas">
select * from Alta_fees where state = '#read_title.pstate#' and (transaction_type = '#read_title.searchtype#' or transaction_type = 'All') order by short_id
</CFQUERY>


<cfif altas.recordcount neq 0>
<table>
<tr>
<td align="left" valign="top" width="350"><font size="-2">ALTA Endorsements
</tr>
<tr>
<td align="left" valign="top" width="400"><font size="-2">
<cfloop query="altas">
<input type="checkbox" value="1" name="#altas.short_id#" <cfif #Evaluate("read_title.#altas.short_id#")# eq 1>checked</cfif> disabled >&nbsp;#altas.long_description#<br>
</cfloop>
</td>
</tr>
</table>
</cfif>
</td></tr></table>
<!--- END new Alta Form --->




<cfif get_company.streamline_client eq 'True' and SearchType eq 'Purchase' and (pstate eq 'MI' or pstate eq 'VA' or pstate eq 'MD')>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Seller Paid Lender Policy
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
										<input type="checkbox" name="seller_paid_lender_policy" value="1" <cfif seller_paid_lender_policy eq 1>checked</cfif> disabled>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Seller Paid Owner Policy
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
										<input type="checkbox" name="seller_paid_owner_policy" value="1" <cfif seller_paid_owner_policy eq 1>checked</cfif> disabled>
						</td>
					</tr>


</cfif>
				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->


<cfif read_title.aname neq "" and read_title.aname IS NOT 'NULL'>
	<!--- ========================================= --->
<!--- ===/    ICL REQUESTED        \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ICL has been requested</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Lender:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#read_title.aname#</b>
						</td>
					</tr>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Address:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#read_title.aaddress#</b><br>
<b>#read_title.acity#, #read_title.astate# #read_title.azip#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</cfif>


<!--- ========================================= --->
<!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Verify Order was Received</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address, you will receive a confirmation  e-mail of your order having been received by us.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail#</b>
						</td>
					</tr>

					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to up to two other e-mail addresses.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail_2#</b>
							<br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail_3#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<!--- =========================================== --->
<!--- ===/    [ RECEIVE REPORT ]  TOP        \=== --->
<!--- =========================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Request copy of Final Report</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>If you would like to receive a copy of the final report, please provide us with an email address.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#RptbyEmail#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>




	<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Title Commitment to be Issued By:</B></CENTER>
			</TD>
		</TR>
<CFQUERY datasource="#request.dsn#" NAME="title_companies">
			SELECT tc.company
			FROM title t, Title_companies tc, Doc_Title_Insurance_Title d
			where t.title_id = #read_title.title_id#
			and d.title_id = t.title_id
			and tc.title_co_id = d.insurance_co
</CFQUERY>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#title_companies.company#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>



	<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Revenue:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Revenue:&nbsp;$</FONT>
							#read_title.revenue#
						</td>
					</tr>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Original Revenue Entered:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Original Revenue Entered:&nbsp;$</FONT>
							<cfif Len(read_title.original_revenue_amt)>#read_title.original_revenue_amt#</cfif>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Subordination Fee:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Subordination Fee:&nbsp;$</FONT>
							#read_title.subordination#
						</td>
					</tr>
				</table>
			</td>
		</tr>


		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Title Grade:</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Title Grade:&nbsp;</FONT>
							#read_title.title_grade#<br>
<cfif Len(read_title.title_grade_document)><A HREF="#fileSys.FindFilePath('#read_title.title_grade_document#', 'url')#" target="new">#read_title.title_grade_document#</A></cfif>
						</td>
					</tr>
				</table>
			</td>
		</tr>

	</table>
<!--- ======================================================================= --->

<!--- ======================================================================== --->


<!--- ROA HUTTON Geddes --->
<cfif read_title.comp_id eq 3276>
	<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ROA Hutton Specific Information</B></CENTER>
			</TD>
		</TR>
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Share Loan Payoff:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>$#line_102#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Monthly Condo Fee:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>$#line_1304#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Payoff to University Bank:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>$#line_105#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Payoff to NCB:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>$#line_104#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Pre-Pay Penalty:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>$#prepay_penalty#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Power of Attorney Request:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#line_1112#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Assignment of Interest:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#line_1113#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Borrower 1 DOB:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
						<cfif DateFormat(borrower1_dob, 'm/d/yyyy') eq '1/1/1900'>
						<cfset dob_date = ''>
						<cfelse>
						<cfset dob_date = DateFormat(borrower1_dob, 'm/d/yyyy')>
						</cfif>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#dob_date#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Manner of Title:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#manner_of_title#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Appraised Value:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#appraised_value#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Charge Appraisal Fee:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b><cfif appraisal_fee eq 1>Yes<CFELSE>No</cfif></b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Date Opened:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
						<cfif DateFormat(roa_date_opened, 'm/d/yyyy') eq '1/1/1900'>
						<cfset opened_date = ''>
						<cfelse>
						<cfset opened_date = DateFormat(roa_date_opened, 'm/d/yyyy')>
						</cfif>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#opened_date#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Escrow Fee:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#escrow_fee#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Non-Escrow:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b><cfif non_escrow eq 1>Yes<CFELSE>No</cfif></b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Delinquency to<BR>Geddes Lake:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#delinquency#</b>
						</td>
					</tr>

					</table>
</cfif>

<cfif read_title.comp_id eq 3943 or  read_title.comp_id eq 4042 or  read_title.comp_id eq 4043>
<cfform>
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ROA Hutton Specific Information</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Underlying Mortgage Payoff:</b></FONT>&nbsp;&nbsp;
						<td bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue">#read_title.underlying_mortgage#
						</td>
					</tr>
<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Property Tax:</b></FONT>&nbsp;&nbsp;
						<td bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue">#read_title.prop_tax#
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Escrow, number of months:</b></FONT>&nbsp;&nbsp;
						<td bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue">#read_title.escrow_months#
						</td>
					</tr>

															<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Share Loan Payoff Est:</b></FONT>&nbsp;&nbsp;
						<td bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue">#read_title.share_loan_payoff#
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Share Loan Lender:</b></FONT>&nbsp;&nbsp;
						<td bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue">#read_title.share_loan_lender#
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Share Loan Account ##:</b></FONT>&nbsp;&nbsp;
						<td bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue">#read_title.share_loan_acct#
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Share Loan Payoff Phone:</b></FONT>&nbsp;&nbsp;
						<td bgcolor="f1f1f1" align=left valign=top><FONT FACE=verdana SIZE=1 color="blue">#read_title.share_loan_phone#
						</td>
					</tr>
<!---
				<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Power of Attorney Request:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text"  NAME="line_1112" SIZE=40 MAXLENGTH=120
							VALUE="#read_title.line_1112#"
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
						</td>
					</tr>
 --->

					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Manner of Title:</b>&nbsp;&nbsp;
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">#read_title.manner_of_title#</font></td>
					</tr>


					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Appraised Value:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">#read_title.appraised_value#
						</td>
					</tr>

					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Condo Fee:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">#read_title.condo_fee#
						</td>
					</tr>

					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Pre-Pay Penalty:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">#read_title.prepay_penalty#
						</td>
					</tr>


					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Full Vesting Name:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">#read_title.full_vesting#
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Schedule A ##4 Override:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">#read_title.vesting_override#
						</td>
					</tr>
<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Loan Admin Fee:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">#read_title.loan_admin_fee#
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Flood Certification Fee:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">#read_title.flood_cert_price#
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Origination Fee Percentage<BR>(1 = 1%):</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">#read_title.origination_fee_percentage#
						</td>
					</tr>
										</table>
			</td>
		</tr>
	</table>

<br>

<cfif read_title.comp_id eq 4042 or read_title.comp_id eq 4043 or read_title.comp_id eq 3943>
<cfset id_to_use = 3943>
<cfelse>
<cfset id_to_use = read_title.comp_id>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_custom_fees">
	SELECT *
	FROM custom_fees
	WHERE comp_id = #id_to_use# order by code
</CFQUERY>

	<table width=600 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=598 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ROA Hutton Villages - Custom Fees</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD  align=center valign=top bgcolor=d3d3d3>
				<table width=598 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td align=left valign=top bgcolor=e4e4e4>&nbsp;

		</td>
		<td width=40 align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			Code:
		</td>
		<td width=300 align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			Line Text:
		</td>
		<td  width=200 align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			Description:
		</td>
		<td width=50 align=right valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			HUD&nbsp;Line:
		</td>
		<td width=50 align=right valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			Amount:
		</td>
	</tr>
<cfloop query="get_custom_fees">
	<tr>
		<td align=left valign=top bgcolor=e4e4e4>

			<input type="checkbox" disabled name="custom_fees" value="#get_custom_fees.code#" <cfif ListContainsNoCase(read_title.custom_fees, #get_custom_fees.code#, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			#get_custom_fees.code#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			#get_custom_fees.line_description#
		</td>
		<td align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			#get_custom_fees.verbose_description#
		</td>
		<td align=right valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			#get_custom_fees.hud_line#
		</td>
		<td valign=top align="right" bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			#get_custom_fees.amount#
		</td>
	</tr>
	</cfloop>

		</td>
	</tr>

					</table>
</cfform>
</cfif>
</CFOUTPUT>

<cfif read_title.comp_id eq 3722 or read_title.comp_id eq 4702 or read_title.comp_id eq 4752>


	<table width=600 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=598 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Optional Fees (Non-itemized charges to appear on HUD 1101)</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD  align=center valign=top bgcolor=d3d3d3>
				<table width=598 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td align=left valign=top bgcolor=e4e4e4 width="20">&nbsp;

		</td>
		<td width=250 align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			Description:
		</td>
		<td width=328 align=left valign=top bgcolor=e4e4e4>
			<font size=1 color=blue face=arial>
			Amount:
		</td>
	</tr>
<cfoutput query="read_itemized">
<cfif read_title.searchtype eq 'Refinance'>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_01_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="1" <cfif ListContainsNoCase(read_title.custom_fees, 1, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_01_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_02_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="2" <cfif ListContainsNoCase(read_title.custom_fees, 2, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_02_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_02_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_03_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="3" <cfif ListContainsNoCase(read_title.custom_fees, 3, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_03_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_03_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_04_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="4" <cfif ListContainsNoCase(read_title.custom_fees, 4, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_04_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_04_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_05_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="5" <cfif ListContainsNoCase(read_title.custom_fees, 5, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_05_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_05_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_06_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="6" <cfif ListContainsNoCase(read_title.custom_fees, 6, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_06_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_06_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_07_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="7" <cfif ListContainsNoCase(read_title.custom_fees, 7, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_07_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_07_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_08_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="8" <cfif ListContainsNoCase(read_title.custom_fees, 8, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_08_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_08_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_09_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="9" <cfif ListContainsNoCase(read_title.custom_fees, 9, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_09_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_09_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_10_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="10" <cfif ListContainsNoCase(read_title.custom_fees, 10, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_10_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_10_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_11_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="11" <cfif ListContainsNoCase(read_title.custom_fees, 11, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_11_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_11_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_12_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="12" <cfif ListContainsNoCase(read_title.custom_fees, 12, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_12_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_12_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_13_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="13" <cfif ListContainsNoCase(read_title.custom_fees, 13, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_13_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_13_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_14_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="14" <cfif ListContainsNoCase(read_title.custom_fees, 14, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_14_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_14_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_15_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="15" <cfif ListContainsNoCase(read_title.custom_fees, 15, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_15_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_15_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_16_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="16" <cfif ListContainsNoCase(read_title.custom_fees, 16, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_16_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_16_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_17_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="17" <cfif ListContainsNoCase(read_title.custom_fees, 17, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_17_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_17_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_18_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="18" <cfif ListContainsNoCase(read_title.custom_fees, 18, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_18_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_18_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_19_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="19" <cfif ListContainsNoCase(read_title.custom_fees, 19, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_19_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_19_REFINANCE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_20_REFINANCE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="20" <cfif ListContainsNoCase(read_title.custom_fees, 20, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_20_REFINANCE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_20_REFINANCE#
		</td>
	</tr>
</cfif>

</cfif>
<cfif read_title.searchtype eq 'PURCHASE'>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_01_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="1" <cfif ListContainsNoCase(read_title.custom_fees, 1, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_01_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_02_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="2" <cfif ListContainsNoCase(read_title.custom_fees, 2, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_02_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_03_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="3" <cfif ListContainsNoCase(read_title.custom_fees, 3, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_03_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_04_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="4" <cfif ListContainsNoCase(read_title.custom_fees, 4, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_04_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_05_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="5" <cfif ListContainsNoCase(read_title.custom_fees, 5, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_05_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_06_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="6" <cfif ListContainsNoCase(read_title.custom_fees, 6, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_06_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_07_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="7" <cfif ListContainsNoCase(read_title.custom_fees, 7, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_07_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_08_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="8" <cfif ListContainsNoCase(read_title.custom_fees, 8, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_08_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_09_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="9" <cfif ListContainsNoCase(read_title.custom_fees, 9, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_09_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_10_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="10" <cfif ListContainsNoCase(read_title.custom_fees, 10, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_10_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_11_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="11" <cfif ListContainsNoCase(read_title.custom_fees, 11, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_11_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_12_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="12" <cfif ListContainsNoCase(read_title.custom_fees, 12, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_12_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_13_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="13" <cfif ListContainsNoCase(read_title.custom_fees, 13, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_13_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_14_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="14" <cfif ListContainsNoCase(read_title.custom_fees, 14, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_14_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_15_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="15" <cfif ListContainsNoCase(read_title.custom_fees, 15, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_15_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_16_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="16" <cfif ListContainsNoCase(read_title.custom_fees, 16, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_16_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_17_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="17" <cfif ListContainsNoCase(read_title.custom_fees, 17, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_17_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_18_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="18" <cfif ListContainsNoCase(read_title.custom_fees, 18, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_18_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_19_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="19" <cfif ListContainsNoCase(read_title.custom_fees, 19, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_19_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE#
		</td>
	</tr>
</cfif>
<cfif read_itemized.A_1101_ITEM_SELECTABLE_20_PURCHASE eq 1>
	<tr>
		<td disabled align=right valign=top bgcolor=e4e4e4 width="10">
			<input type="checkbox" name="custom_fees" value="20" <cfif ListContainsNoCase(read_title.custom_fees, 20, ",")>checked</cfif>>
		</td>
		<td align=left valign=top bgcolor=e4e4e4 width="250">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_DESCRIPTION_20_PURCHASE#
		</td>
		<td  align=left valign=top bgcolor=e4e4e4  width="328">
			<font size=1 color=blue face=arial>
			#read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE#
		</td>
	</tr>
</cfif>
</cfif>

	</cfoutput>
		</td>
	</tr>
</cfif>


			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<p>
<!--- ======================================================================== --->
<p></p>

		</TD>
	</TR>


		</td>
	</tr><!--- ====================================================================== ---><!--- ====================================================================== ---><!--- ====================================================================== --->


	<tr>
		<!--- <td width=830 align=left valign=top bgcolor=e1e1el>
		<nobr><A href="javascript:window.close();"><IMG src="./images/button_close.gif" border=0></a></nobr>



			</td>
		 --->

		</tr>



	</table>


			</td>
		</tr>

	</table></CENTER></CENTER>

	<!-- show order completed -->
	<cfflush>
</BODY>
</HTML>





