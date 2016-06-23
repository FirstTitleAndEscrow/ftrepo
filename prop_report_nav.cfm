

			<CFQUERY datasource="#request.dsn#" NAME="read_property">

				SELECT *
				FROM property
				WHERE prop_ID = #rec_ID#

			</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_property.comp_ID#

		</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=830 align=center valign=top>

<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=830 align=center valign=top bgcolor=e1e1e1>
			<IMG SRC="./images/logo_prop_reports.gif">

		</td>
	</tr>



	<tr>
		<td width=830 align=center valign=top bgcolor=e1e1e1>






	<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">







<CFOUTPUT QUERY="read_property">
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CLIENT SPECIFIC INFORMATION</B></CENTER>
			</TD>
		</TR>
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>



				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td width=100 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Order Date
						</TD>

						<td width=255 colspan=3 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Due Date -
						</TD>

						<td width=155 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Appraisal Status -

						</TD>
					</tr>

					<tr>
						<td width=100 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"> <b>#a_month#/#a_day#/#a_year#</b>
						</TD>

						<td width=85 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Month -	<FONT FACE=verdana SIZE=1 color="blue"><b>#oda_month#</b></font>
						</TD>

						<td width=85 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Day - <FONT FACE=verdana SIZE=1 color="blue"><b>#oda_day#</b></font>
						</TD>

						<td width=85 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Year - <FONT FACE=verdana SIZE=1 color="blue"><b>#oda_year#</b></font>
						</TD>

						<td width=155 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#appraisal_status#</b></font>
						</TD>
					</tr>
				</table>
</CFOUTPUT>

<CFOUTPUT QUERY="read_property">
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Officer:</b>
						</TD>

						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Processor:</b>
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
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>
					</tr>

					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#o_email#</b>
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#p_email#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

</table>
<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
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
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.blastname1#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bfirstname1#</B>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bminame1#</B>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bssn1#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bhphone1#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bwphone1#</B>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bext1#</B>
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
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.blastname2#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bfirstname2#</B>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bminame2#</B>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bssn2#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bhphone2#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bwphone2#</B>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.bext2#</B>
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
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.slastname1#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.sfirstname1#</B>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.sminame1#</B>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.sssn1#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.shphone1#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.swphone1#</B>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.sext1#</B>
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
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.slastname2#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.sfirstname2#</B>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.sminame2#</B>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.sssn2#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.shphone2#</B>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.swphone2#</B>

						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.sext2#</B>
						</td>

					</tr>
				</table>
			</td>
		</tr>
</table>

<!--- ======================================================================== --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PROPERTY ADDRESS</B></CENTER>
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
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.paddress#</B>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							City, State, Zip:</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<NOBR><FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.pcity# #read_property.pstate# #read_property.pzip#
							</B></NOBR>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.pcounty#</B>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Legal Description <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.plegaldesc#</B>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Property Use <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.prop_use_type#</B>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is this a Condo or PUD <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.condo_pud#</B>
						</td>
					</tr>

				</table>
			</td>
		</tr>


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
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.a_COMMENT#</B>
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

		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1>Please forward borrower authorization if needed for payoff requests by facsimile (301-279-7930) or <a href="mailto:sdari@firsttitleservices.com">email</a>.</FONT>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Payoff Lender  [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.polender1#</B>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.poacctno1#</B>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.pophone1#</B>
						</td>
					</tr>

		<!--- ==================================== --->
		<!--- ===/ Payoff Lender  [ SECOND ]  \=== --->
		<!--- ==================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Second Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.polender2#</B>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.poacctno2#</B>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.pophone2#</B>
						</td>
					</tr>
				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->

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
							<FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT><FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.Verifyemail#</B>
						</td>
					</tr>

					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to up to two other e-mail addresses.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT><FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.Verifyemail_2#</B> <br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT><FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.Verifyemail_3#</B>
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
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT><FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.RptbyEmail#</B>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<p>
<!--- ======================================================================== --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>APPRAISAL REQUEST</B></CENTER><br>
				<font size=1 color=blue face=arial> OPTIONAL - Fill this out only if you want an Appraisal with this property report.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=518 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- ==================================== --->
		<!--- ===/ Appraisal  Info [       ]  \=== --->
		<!--- ==================================== --->
					<tr>
						<td width=201 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Want an appraisal?
						</td>

						<td width=313  bgcolor="f1f1f1" align=left valign=top><FONT FACE=ARIAL SIZE=2 color="red">
								<cfif #read_property.do_appraisal# eq "No"><NOBR>&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif"><INPUT TYPE="RADIO" NAME="do_appraisal" VALUE="No" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="do_appraisal" VALUE="Yes"></NOBR>
								<CFELSE>
									<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif"><INPUT TYPE="RADIO" NAME="do_appraisal" VALUE="No"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO" checked NAME="do_appraisal" VALUE="Yes"></NOBR>
								</CFIF>

						</td>
					</tr>

					<tr>
						<td width=201  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							Appraisal Type</td>
						<td width=313  bgcolor="f1f1f1" align=left>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.appraisal_type#</B>
						</td>
					</tr>

					<tr>
						<td width=201 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Estimated Value <br>
							<FONT FACE=verdana SIZE=1 color="gray" >(format xxxxxxxxxx.xx)
						</td>

						<td width=313  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.estimate_value#</B>
						</td>
					</tr>

					<TR>
						<TD width=514 bgcolor="d3d3d3" colspan=4 align="center">

					<!--- ===/ Payment Type \=== --->

							<table width=515 cellpadding=1 cellspacing=1 border=0>
								<tr>
									<td width=514 colspan=3 align=left valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Appraisal Payment <FONT FACE=ARIAL SIZE=2 color="maroon">Options - </B></FONT> <FONT FACE=arial SIZE=1 color="gray"><b>Completed only if you are requesting a payment method other than "Bill Us" in the pulldown list below.</B>
									</td>
								</tr>

								<tr>
									<td width=200 bgcolor="f1f1f1" align=right valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Payment Type
									</td>

									<td width=121  bgcolor="f1f1f1" align=center valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.payment_type_1#</B>
									</td>

									<TD bgcolor="f1f1f1" WIDTH=188 align=left>
										<FONT FACE=ARIAL SIZE=2 color="gray" > <img src="./images/arrow_left.gif">If Partial COD<br> <font size=1 color=black face=arial><NOBR>Fill in the Partial COD Amount<img src="./images/arrow_down.gif"></NOBR>

									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" colspan=3 WIDTH=512 align=right>
										<NOBR><FONT FACE=verdana SIZE=1 color="gray" >(format xxxxxxxxxx.xx)<img src="./images/arrow_right.gif"><FONT FACE=ARIAL SIZE=2 color="gray" ><FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.partial_cod#</B></NOBR>
									</td>
								</tr>

								<tr>
									<td width=512 colspan=3 align=left valign=top>

					<!--- ===/ Payment Method \=== --->

							<table width=511 cellpadding=1 cellspacing=1 border=0>
								<tr>
									<td width=511 colspan=2 align=left valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Appraisal Payment <FONT FACE=ARIAL SIZE=2 color="maroon">Method - </B></FONT> <FONT FACE=arial SIZE=1 color="gray"><b>Choose which method for payment, and fill in all fields accordingly.</B>
									</td>
								</tr>

								<tr>
									<td bgcolor="f1f1f1" width=254  align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Pay by Credit Card</B> <img src="./images/arrow_right.gif">
										<cfif #read_property.pay_by# eq "Credit">
											<input type=radio name="pay_by" VALUE="Credit" CHECKED>
										<CFELSE>
											<input type=radio name="pay_by" VALUE="Credit">
										</CFIF>
									</td>

									<td bgcolor="f1f1f1" width=254  align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Pay by Check</B> <img src="./images/arrow_right.gif">
										<cfif #read_property.pay_by# eq "Check">
											<input type=radio name="pay_by" VALUE="Check" CHECKED>
										<CFELSE>
											<input type=radio name="pay_by" VALUE="Check">
										</CFIF>
									</td>

								</tr>

								<tr>
									<td bgcolor="f3f3f3" width=254  align=left valign=top>

						<!--- ============================ --->
						<!--- ===/ PAY BY CREDIT CARD \=== --->
						<!--- ============================ --->

			<cfif #read_property.pay_by# eq "Credit">

							<table width=252 cellpadding=0 cellspacing=0 border=0>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Credit Card
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_credit_card#</B>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card No.
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_cc_num#</B>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Exp Month
									</td>

									<td bgcolor="f1f1f1" width=140 align=left valign=top>

									<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_cc_exp_month#</B>

								</td>
							</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Exp Year
									</td>

									<td bgcolor="f1f1f1" width=140 align=left valign=top>

									<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_cc_exp_year#</B>

								</td>
							</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Holder Name
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_cc_name#</B>
									</td>
								</tr>
							</table>
				</CFIF>
								</td>

								<td bgcolor="f3f3f3" width=254  align=left valign=top>

						<!--- ============================ --->
						<!--- ===/    PAY BY CHECK    \=== --->
						<!--- ============================ --->
				<cfif #read_property.pay_by# eq "Check">

							<table width=252 cellpadding=0 cellspacing=0 border=0>
								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Account Holder Name
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<FONT FACE=verdana SIZE=1 color="blue">
											<b>#read_property.app_ck_acct_name#</B>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Street / PO Box
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_ck_addr1#</B>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Street / PO Box
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_ck_addr2#</B>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >City
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_ck_city#</B>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >State
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_ck_state#</B>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Account No.
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_ck_acct_no#</B>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Bank Name
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_ck_bank#</B>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Routing No.
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_property.app_ck_route_no#</B>
									</td>
								</tr>
							</table>
				</CFIF>
						</td>
					</tr>
							</table>
									</td>
								</tr>

							</table>
						</TD>
					</TR>
				</table>
			</td>
		</tr>
</table>
<p>
		</TD>
	</TR>


		</table>


</cfoutput>





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
