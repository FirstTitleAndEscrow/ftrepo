		<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM Final_Document_Retrieval
			WHERE fdr_id = #url.rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="get_company">
			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE id = #read_title.USER_ID#
		ORDER BY lp_lname ASC
	</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">

			SELECT *
			FROM loan_officers
			WHERE ID = #read_title.loan_off_id#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>


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
    		<td align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
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
								><input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM>
</CFOUTPUT> </TD>
		</TR>
	</table>

<CFINCLUDE TEMPLATE="./includes/title_top_nav_fdr.cfm">

<!-- navigation screen completed -->
<cfflush>



<CFOUTPUT QUERY="read_title"> <!--- =================================== ---><!--- ===/    [ CLIENT INFO ]  TOP   \=== ---><!--- =================================== --->
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
				Order Number is...<b>FDR-#read_title.fdr_id#</b></FONT>
			</TD>
			</tr>
		<TR>
			<TD width=519 align=middle valign=top bgcolor=d3d3d3>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=100 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Order Date</FONT>

						</td>


						<td width=155 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Status -</FONT>


						</td>
					</tr>

					<tr>
						<td width=100 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"> <b>#DateFormat(read_title.order_date, "mm/dd/yyyy")#</b></FONT>
						</td>

						<td width=155 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#appraisal_status#</b></FONT>
						</td>
					</tr>
				</table></CFOUTPUT>

<CFOUTPUT>
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Loan Officer:</b>
						</TD>

						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Loan Processor:</b>
						</TD>

					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_loan_offcr.oname#</B>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_user.pname#</B>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_phone#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_user.lp_phone#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_ext#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_ext#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_loan_offcr.lo_fax#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_fax#</b>
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
							<b>#read_loan_offcr.lo_email#</b>
						</td>

						<td width=400 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_email#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

</table>

</cfoutput>
<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
<!--- ========================================= --->
<CFOUTPUT QUERY="read_title">
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>





		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>BORROWER INFORMATION</B></CENTER><br><FONT FACE=ARIAL SIZE=2 color="maroon">
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
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn1#</b>
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
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn2#</b>
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
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn3#</b>
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
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn4#</b>
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

</table>
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>LOAN INFORMATION</B></CENTER>
			</TD>
		</TR>
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td width=205 bgcolor="white" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Loan Number <br>
						</td>
		<td COLSPAN=3 width=314 bgcolor="white" align=left valign=top>
							#loan_number#
						</td>
		</tr>
									<tr>
						<td width=205 bgcolor="white" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Original Lender Name<br></b>
						</td>


						<td width=314 bgcolor="white" align=left valign=top>
										#original_lender_name#
						</td>
						</tr>
						
									<tr>
						<td width=205 bgcolor="white" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Original Loan Date<br></b>
						</td>


						<td width=314 bgcolor="white" align=left valign=top>
									#DateFormat(read_title.original_loan_date, "mm/dd/yyyy")#
						</td>
						</tr>
						
	

						<tr>
				<td width=205 bgcolor="white" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Original Loan Amount </b>
						</td>

						<td COLSPAN=3 width=314 bgcolor="white" align=left valign=top>
							#original_loan_amount#
						</td>
					</tr>


						
												


		</table>
</td>
</tr>
</table>

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
				<tr>
		<td width=215 bgcolor="yellow" align=right valign=bottom>
			<FONT FACE=ARIAL SIZE=1 color="black">
				SLA option:  </td><td width=304  bgcolor="yellow" align=left valign=bottom>
				<FONT FACE=ARIAL SIZE=1 color="black">
							&nbsp;&nbsp;&nbsp;&nbsp;Standard <input name="sla_option" id="sla_option"  type="radio" value="standard"  <cfif sla_option eq 'standard'>checked</cfif> />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rush  <input name="sla_option" id="sla_option"  type="radio" value="rush" <cfif sla_option eq 'rush'>checked</cfif> /></NOBR>


		</td></TR>
				<tr>
		<td width=215 bgcolor="yellow" align=right valign=bottom>
			<FONT FACE=ARIAL SIZE=1 color="black">
				Order Type:  </td><td width=304  bgcolor="yellow" align=left valign=bottom>
				<FONT FACE=ARIAL SIZE=1 color="black">
							&nbsp;&nbsp;&nbsp;&nbsp;Image Only <input name="order_type" id="order_type"  type="radio" value="image"  <cfif order_type eq 'image'>checked</cfif> />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Paper  <input name="order_type" id="order_type"  type="radio" value="paper" <cfif order_type eq 'paper'>checked</cfif> /></NOBR>


		</td></TR>

				<tr>
		<td width=215 bgcolor="yellow" align=right valign=bottom>
							<FONT FACE=ARIAL SIZE=1 color="black">

							Document Type:  </td><td width=304  bgcolor="yellow" align=left valign=bottom>
						<FONT FACE=ARIAL SIZE=1 color="black">
						<select name="document_type" id="document_type" style="font-size:10px" >

						<option value="Mortgage" <cfif document_type eq 'Mortgage'>selected</cfif> >Mortgage</option>
						<option value="Deed of Trust" <cfif document_type eq 'Deed of Trust'>selected</cfif> >Deed of Trust</option>
						<option value="Assignment" <cfif document_type eq 'Assignment'>selected</cfif> >Assignment</option>
						<option value="Substitution of Trustees" <cfif document_type eq 'Substitution of Trustees'>selected</cfif> >Substitution of Trustees</option>
						</select>
		</td></TR>

				</table>








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
							#a_COMMENT#
						</td>
					</tr>

				</table>
			</td>
		</tr>
	</table>
	</cfoutput>
<!--- ======================================================================= --->

<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/        [ PAYOFF ]  TOP          \=== --->
<!--- ========================================= --->

<!--- ========================================= --->
<!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Verify Order was Received</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address or fax number, you will receive a confirmation  e-mail of your order having been received by us.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>
<cfoutput query="read_title">
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<CFIF (#comp_id# eq "115") OR (#comp_id# eq "621") >
	                    <CFSET Verifyemail1 = "">
											<CFSET Verifyemail2 = "">
											<CFSET Verifyemail3 = "">
                    <CFELSE>
	                    <CFSET Verifyemail1 = "#read_user.lp_email#">
											 <CFSET Verifyemail2 = "#read_user.cc_email_1#">
											 <CFSET Verifyemail3 = "#read_user.cc_email_2#">
                    </CFIF>
                    <tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							#read_title.Verifyemail#
						</td>
					</tr>

					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to another other e-mail address.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT> #read_title.Verifyemail_3# <br>

						</td>
						</tr>








				</table>
			</td>
		</tr>
	</table>


</cfoutput>
	<cfoutput>

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
                      	<CFIF (#read_title.comp_id# eq "115") OR (#read_title.comp_id# eq "621") >
	                    <CFSET Verifyemail1 = "">
											<CFSET Verifyemail2 = "">
											<CFSET Verifyemail3 = "">
                    <CFELSE>
	                    <CFSET Verifyemail1 = "#read_user.lp_email#">
											 <CFSET Verifyemail2 = "#read_user.cc_email_1#">
											 <CFSET Verifyemail3 = "#read_user.cc_email_2#">
                    </CFIF>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT> #read_title.Verifyemail_2#
							 <br>
						</td>
					</tr>



				</table></cfoutput>


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





