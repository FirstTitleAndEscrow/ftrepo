<CFSET  a_list_of_all_states = "AL|AK|AZ|AR|CA|CO|CT|DE|DC|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY">

<CFSET a_list_of_all_states_1 = #ListToArray(a_list_of_all_states, "|")#>

		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE id = #read_title.user_id#
	</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">

			SELECT *
			FROM loan_officers
			WHERE ID = #read_title.loan_off_id#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">

			SELECT *
			FROM zip_info
			WHERE state = '#read_title.pstate#'

		</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<SCRIPT>
<!--

function testbox(form) {
Ctrl = form.inputbox1;
if (Ctrl.value == "" || Ctrl.value.indexOf ('@', 0) == -1) {
return (false);
} else
return (true);
}
//-->
</SCRIPT>

</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Committment Report</B></CENTER>
			</TD>
		</TR>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>



		<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">





		</td>
	</tr>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

	<CFFORM NAME="frm" ACTION="./title_report_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" METHOD=POST>

<CFOUTPUT QUERY="read_title">
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>

		<TR>
			<TD width=519 align=left valign=top bgcolor=blue>
				<FONT SIZE=3 color=white face=arial>
				Order Number is...<b>#read_title.title_id#</b>
			</tD>
		</tr>

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
							Month -	<CFINPUT type="text" NAME="oda_month" SIZE=5 MAXLENGTH=2
									VALUE="#DateFormat(duedate, "mm")#"
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
						</TD>

						<td width=85 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Day - <CFINPUT type="text" NAME="oda_day" SIZE=5 MAXLENGTH=2
									VALUE="#DateFormat(duedate, "dd")#"
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
						</TD>

						<td width=85 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Year - <CFINPUT type="text" NAME="oda_year" SIZE=5 MAXLENGTH=4
									VALUE="#DateFormat(duedate, "yyyy")#"
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
						</TD>

						<td width=155 align=center valign=top bgcolor=d3d3d3>

			<CFIF #do_appraisal# EQ "No">

					<FONT FACE=ARIAL SIZE=2 color="red">
					No Appraisal

			<CFELSE>
							<select name="appraisal_status"
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
								<CFIF #appraisal_status# EQ "0">
									<OPTION VALUE="0" SELECTED>N/A</OPTION>
								<CFELSE>
									<OPTION VALUE="0">N/A</OPTION>
								</CFIF>

								<CFIF #appraisal_status# EQ "In Process">
									<OPTION VALUE="In Process" SELECTED>In Process</OPTION>
								<CFELSE>
									<OPTION VALUE="In Process">In Process</OPTION>
								</CFIF>

								<CFIF #appraisal_status# EQ "Completed">
									<OPTION VALUE="Completed" SELECTED>Completed</OPTION>
								<CFELSE>
									<OPTION VALUE="Completed">Completed</OPTION>
								</CFIF>
							</select>
				</CFIF>
						</TD>
					</tr>
				</table>
</CFOUTPUT>

				</td>
			</tr>

	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CLIENT SPECIFIC INFORMATION</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

<CFOUTPUT>

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
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_loan_offcr.lo_lname#, #read_loan_offcr.lo_fname#</B>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_user.lp_lname#, #read_user.lp_fname#</B>
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
							<b>#read_loan_offcr.lo_email#</b>
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_user.lp_email#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

</table>

</CFOUTPUT>


<CFOUTPUT QUERY="read_title">

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
							<CFINPUT type="text" NAME="blastname1" SIZE=11 MAXLENGTH=25
								VALUE="#blastname1#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<CFINPUT type="text" NAME="bfirstname1" SIZE=11 MAXLENGTH=15
								VALUE="#bfirstname1#"
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

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<CFINPUT type="text" NAME="bminame1" SIZE=1 MAXLENGTH=1
									VALUE="#bminame1#"
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

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<CFINPUT type="text" NAME="bssn1" SIZE=13 MAXLENGTH=11
									VALUE="#bssn1#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<CFINPUT type="text" NAME="bhphone1" SIZE=12 MAXLENGTH=15
										VALUE="#bhphone1#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<CFINPUT type="text" NAME="bwphone1" SIZE=12 MAXLENGTH=15
									VALUE="#bwphone1#"
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

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<CFINPUT type="text" NAME="bext1" SIZE=4 MAXLENGTH=5
								VALUE="#bext1#"
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
							<CFINPUT type="text" NAME="blastname2" SIZE=11 MAXLENGTH=25
									VALUE="#blastname2#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<CFINPUT type="text" NAME="bfirstname2" SIZE=11 MAXLENGTH=15
									VALUE="#bfirstname2#"
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

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<CFINPUT type="text" NAME="bminame2" SIZE=1 MAXLENGTH=1
								VALUE="#bminame2#"
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

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<CFINPUT type="text" NAME="bssn2" SIZE=13 MAXLENGTH=11
								VALUE="#bssn2#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<CFINPUT type="text" NAME="bhphone2" SIZE=12 MAXLENGTH=15
								VALUE="#bhphone2#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<CFINPUT type="text" NAME="bwphone2" SIZE=12 MAXLENGTH=15
							VALUE="#bwphone2#"
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

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<CFINPUT type="text" NAME="bext2" SIZE=4 MAXLENGTH=5
									VALUE="#bext2#"
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
							<CFINPUT type="text" NAME="slastname1" SIZE=11 MAXLENGTH=25
								VALUE="#slastname1#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<CFINPUT type="text" NAME="sfirstname1" SIZE=11 MAXLENGTH=15
								VALUE="#sfirstname1#"
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

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<CFINPUT type="text" NAME="sminame1" SIZE=1 MAXLENGTH=1
									VALUE="#sminame1#"
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

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<CFINPUT type="text" NAME="sssn1" SIZE=13 MAXLENGTH=11
										VALUE="#sssn1#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<CFINPUT type="text" NAME="shphone1" SIZE=12 MAXLENGTH=15
									VALUE="#shphone1#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<CFINPUT type="text" NAME="swphone1" SIZE=12 MAXLENGTH=15
									VALUE="#swphone1#"
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

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<CFINPUT type="text" NAME="sext1" SIZE=4 MAXLENGTH=5
								VALUE="#sext1#"
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
							<CFINPUT type="text" NAME="slastname2" SIZE=11 MAXLENGTH=25
									VALUE="#slastname2#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<CFINPUT type="text" NAME="sfirstname2" SIZE=11 MAXLENGTH=15
									VALUE="#sfirstname2#"
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

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<CFINPUT type="text" NAME="sminame2" SIZE=1 MAXLENGTH=1
									VALUE="#sminame2#"
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

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<CFINPUT type="text" NAME="sssn2" SIZE=13 MAXLENGTH=11
									VALUE="#sssn2#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<CFINPUT type="text" NAME="shphone2" SIZE=12 MAXLENGTH=15
									VALUE="#shphone2#"
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

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<CFINPUT type="text" NAME="swphone2" SIZE=12 MAXLENGTH=15
									VALUE="#swphone2#"
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

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<CFINPUT type="text" NAME="sext2" SIZE=4 MAXLENGTH=5
									VALUE="#sext2#"
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
				<NOBR><B>PROPERTY ADDRESS</B></NOBR>
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
							<CFINPUT type="text" NAME="paddress" SIZE=50 MAXLENGTH=80
									VALUE="#paddress#"
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
</CFOUTPUT>

<CFOUTPUT>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							City, State, Zip:</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><NOBR>#read_zip_code.city#, &nbsp;#read_zip_code.state# &nbsp;&nbsp;#read_zip_code.zip#
							</NOBR></b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#read_zip_code.county#</b>
						</td>
					</tr>
</CFOUTPUT>
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Legal Description <br>
						</td>
<CFOUTPUT QUERY="read_title">
						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<CFINPUT type="text" name="plegaldesc" size=50 maxlength=150
									VALUE="#plegaldesc#"
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

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Property Use <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<select name="prop_use_type"
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
								<CFIF #prop_use_type# EQ "Primary Residence">
									<OPTION VALUE="Primary Residence" SELECTED>Primary Residence</OPTION>
								<CFELSE>
									<OPTION VALUE="Primary Residence">Primary Residence</OPTION>
								</CFIF>

								<CFIF #prop_use_type# EQ "Investment/Other">
									<OPTION VALUE="Investment/Other" SELECTED>Investment/Other</OPTION>
								<CFELSE>
									<OPTION VALUE="Investment/Other">Investment/Other</OPTION>
								</CFIF>
							</select>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is this a Condo or PUD <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<select name="condo_pud"
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
								<CFIF #condo_pud# EQ "N/A">
									<OPTION VALUE="N/A" SELECTED>N/A</OPTION>
								<CFELSE>
									<OPTION VALUE="N/A">N/A</OPTION>
								</CFIF>

								<CFIF #condo_pud# EQ "Condo">
									<OPTION VALUE="Condo" SELECTED>Condo</OPTION>
								<CFELSE>
									<OPTION VALUE="Condo">Condo</OPTION>
								</CFIF>

								<CFIF #condo_pud# EQ "PUD">
									<OPTION VALUE="PUD" SELECTED>PUD</OPTION>
								<CFELSE>
									<OPTION VALUE="PUD">PUD</OPTION>
								</CFIF>
							</select>
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

							<TEXTAREA NAME="a_COMMENT" rows=9 cols=70 wrap="virtual"
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
									clear: none;" >#a_COMMENT#</textarea>

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
				<FONT FACE=ARIAL SIZE=1>Please forward borrower authorization if needed for payoff requests by facsimile (301-279-7930) or <a href="mailto:webmaster@firsttitleservices.com">email</a>.</FONT>
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
							<CFINPUT type="text" NAME="polender1" size=15 maxlength=25 VALUE="#polender1#"
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

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<CFINPUT type="text" NAME="poacctno1" size=20 maxlength=30 VALUE="#poacctno1#"
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

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<CFINPUT type="text" NAME="pophone1"  size=12 maxlength=20
							 VALUE="#pophone1#"
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

		<!--- ==================================== --->
		<!--- ===/ Payoff Lender  [ SECOND ]  \=== --->
		<!--- ==================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Second Lender<br>
							<CFINPUT type="text" NAME="polender2" size=15 maxlength=25 VALUE="#polender2#"
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

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<CFINPUT type="text" NAME="poacctno2" size=20 maxlength=30 VALUE="#poacctno2#"
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

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<CFINPUT type="text" NAME="pophone2"  size=12 maxlength=20
							VALUE="#pophone2#"
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
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Transaction Type
						</td>

						<td width=150 bgcolor="f1f1f1" align=left valign=top>
										<cfselect name="SearchType"
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
											ONVALIDATE="testbox"
 											MESSAGE="Sorry, invalid entry.">
 								<CFIF #SearchType# EQ "Purchase">

									 <cfif #slastname1# EQ "">


										 </cfif>
							<cfelse>
							<OPTION VALUE="Purchase"SELECTED>Purchase</OPTION>
								</CFIF>

 								<CFIF #SearchType# EQ "Refinance">
 									<OPTION VALUE="Refinance" SELECTED>Refinance</OPTION>
 								<CFELSE>
 									<OPTION VALUE="Refinance">Refinance</OPTION>
								</CFIF>

 								<CFIF #SearchType# EQ "New Second Mortgage">
 									<OPTION VALUE="New Second Mortgage" SELECTED>New Second Mortgage</OPTION>
 								<CFELSE>
 									<OPTION VALUE="New Second Mortgage">New Second Mortgage</OPTION>
								</CFIF>
										</cfselect>
						</td>

						<td width=100 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Deed Transfer
						</td>

						<td width=144 bgcolor="f1f1f1" align=left valign=top>
										<select name="Deedtransfer"
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
								<CFIF #Deedtransfer# EQ "Yes">
									<OPTION VALUE="Yes" SELECTED>Yes</OPTION>
								<CFELSE>
									<OPTION VALUE="Yes">Yes</OPTION>
								</CFIF>

								<CFIF #Deedtransfer# EQ "No">
									<OPTION VALUE="No" SELECTED>No</OPTION>
								<CFELSE>
									<OPTION VALUE="No">No</OPTION>
								</CFIF>
										</select>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Proposed Insured
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<CFINPUT type="text" NAME="Insured" SIZE=40 MAXLENGTH=120
							    VALUE="#Insured#"
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

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Property Purchase Price
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<CFINPUT type="text" NAME="Purchase_Price" SIZE=40 MAXLENGTH=120 VALUE="#Purchase_Price#"
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

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>

						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=ARIAL SIZE=1 color="red">
							(enter numbers only, do not use commas, or $
						</td>
					</tr>


					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Amount
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<CFINPUT type="text" NAME="loanamt_float" SIZE=40 MAXLENGTH=120 VALUE="#loanamt_float#"
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

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>

						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=ARIAL SIZE=1 color="red">
							(enter numbers only, do not use commas, or $
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Type
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
										<select name="loan_type_111"
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

								<CFIF #loan_type_111# EQ "Conventional">
									<OPTION VALUE="Conventional" SELECTED>Conventional</OPTION>
								<CFELSE>
									<OPTION VALUE="Conventional">Conventional</OPTION>
								</CFIF>

								<CFIF #loan_type_111# EQ "Sub-Prime">
									<OPTION VALUE="Sub-Prime" SELECTED>Sub-Prime</OPTION>
								<CFELSE>
									<OPTION VALUE="Sub-Prime">Sub-Prime</OPTION>
								</CFIF>

								<CFIF #loan_type_111# EQ "VA">
									<OPTION VALUE="VA" SELECTED>VA</OPTION>
								<CFELSE>
									<OPTION VALUE="VA">VA</OPTION>
								</CFIF>

								<CFIF #loan_type_111# EQ "FHA">
									<OPTION VALUE="FHA" SELECTED>FHA</OPTION>
								<CFELSE>
									<OPTION VALUE="FHA">FHA</OPTION>
								</CFIF>
										</select>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Program
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
										<select name="loan_program_333"
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
								<CFIF #loan_program_333# EQ "Fixed Rate">
									<OPTION VALUE="Fixed Rate" SELECTED>Fixed Rate</OPTION>
								<CFELSE>
									<OPTION VALUE="Fixed Rate">Fixed Rate</OPTION>
								</CFIF>

								<CFIF #loan_program_333# EQ "ARM">
									<OPTION VALUE="ARM" SELECTED>ARM</OPTION>
								<CFELSE>
									<OPTION VALUE="ARM">ARM</OPTION>
								</CFIF>

								<CFIF #loan_program_333# EQ "Neg. Amort.">
									<OPTION VALUE="Neg. Amort." SELECTED>Neg. Amort.</OPTION>
								<CFELSE>
									<OPTION VALUE="Neg. Amort.">Neg. Amort.</OPTION>
								</CFIF>
							</select>
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
							<FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT><CFINPUT type="text"  NAME="Verifyemail" SIZE=40 MAXLENGTH=120
							VALUE="#Verifyemail#"
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

					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to up to two other e-mail addresses.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT><CFINPUT  TYPE=TEXT NAME="Verifyemail_2"  SIZE=40 MAXLENGTH=120
							VALUE="#Verifyemail_2#"
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
									clear: none;" > <br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT><CFINPUT  TYPE=TEXT NAME="Verifyemail_3"   SIZE=40 MAXLENGTH=120
							VALUE="#Verifyemail_3#"
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
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<!--- =========================================== --->
<!--- ===/    [ RECIEVE REPORT ]  TOP        \=== --->
<!--- =========================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Request copy of Final Report</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>If you would like to recieve a copy of the final report, please provide us with an email addres.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT><CFINPUT type="text"  NAME="RptbyEmail" SIZE=40 MAXLENGTH=120
							VALUE="#RptbyEmail#"
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
							<CFIF #do_appraisal# EQ "No">
									<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO" NAME="do_appraisal" VALUE="No" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="do_appraisal" VALUE="Yes"></NOBR>
								<CFELSE>
									<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;No <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO" NAME="do_appraisal" VALUE="No" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=2 color="green">Yes <img src="./images/arrow_right.gif"> <INPUT TYPE="RADIO"  NAME="do_appraisal" VALUE="Yes" checked></NOBR>
								</CFIF>
						</td>
					</tr>

					<tr>
						<td width=201  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							Appraisal Type</td>
						<td width=313  bgcolor="f1f1f1" align=left>
							<select name="appraisal_type"
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
								<CFIF #appraisal_type# EQ "0">
									<OPTION VALUE="0" SELECTED>No Appraisal</OPTION>
									<OPTION VALUE="1004">Full Appraisal (1004)</OPTION>
									<OPTION VALUE="2055">Drive-by Appraisal (2055)</OPTION>
								<CFELSEIF #appraisal_type# EQ "1004">
									<OPTION VALUE="0">No Appraisal</OPTION>
									<OPTION VALUE="1004" SELECTED>Full Appraisal (1004)</OPTION>
									<OPTION VALUE="2055">Drive-by Appraisal (2055)</OPTION>
								<CFELSE>
									<OPTION VALUE="0">No Appraisal</OPTION>
									<OPTION VALUE="1004">Full Appraisal (1004)</OPTION>
									<OPTION VALUE="2055" SELECTED>Drive-by Appraisal (2055)</OPTION>
								</CFIF>
							</select>
						</td>
					</tr>

					<tr>
						<td width=201 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Estimated Value <br>
							<FONT FACE=verdana SIZE=1 color="gray" >(format xxxxxxxxxx.xx)
						</td>

						<td width=313  bgcolor="f1f1f1" align=left valign=top>
							<CFINPUT type="text" name="estimate_value" size=35 maxlength=25
							VALUE="#estimate_value#"
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
									<td width="50%" bgcolor="f1f1f1" align=right valign=top>
										<FONT FACE=ARIAL SIZE=1 color="gray">
										Payment Type
									</td>

									<td width="50%"  bgcolor="f1f1f1" align=left valign=top colspan="2">
										<select name="payment_type_1"
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
								<CFIF #payment_type_1# EQ "Bill Us">
									<OPTION VALUE="Bill Us" SELECTED>Bill Us</OPTION>
								<CFELSE>
									<OPTION VALUE="Bill Us">Bill Us</OPTION>
								</CFIF>

								<CFIF #payment_type_1# EQ "COD">
									<OPTION VALUE="COD" SELECTED>COD</OPTION>
								<CFELSE>
									<OPTION VALUE="COD">COD</OPTION>
								</CFIF>


										</select>
									</td>

<!--- 									<TD bgcolor="f1f1f1" WIDTH=188 align=left>
										<FONT FACE=ARIAL SIZE=2 color="gray" > <img src="./images/arrow_left.gif">If Partial COD<br> <font size=1 color=black face=arial><NOBR>Fill in the Partial COD Amount<img src="./images/arrow_down.gif"></NOBR>
									</td> --->
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

				<CFIF #pay_by# EQ "Credit">
								<tr>
									<td bgcolor="f1f1f1" width=254  align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Pay by Credit Card</B> <img src="./images/arrow_right.gif"> <input type=radio name="pay_by" VALUE="Credit" checked>
									</td>

									<td bgcolor="f1f1f1" width=254  align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Pay by Check</B> <img src="./images/arrow_right.gif"> <input type=radio name="pay_by" VALUE="Check">
									</td>

								</tr>
				<CFELSE>
								<tr>
									<td bgcolor="f1f1f1" width=254  align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Pay by Credit Card</B> <img src="./images/arrow_right.gif"> <input type=radio name="pay_by" VALUE="Credit">
									</td>

									<td bgcolor="f1f1f1" width=254  align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Pay by Check</B> <img src="./images/arrow_right.gif"> <input type=radio name="pay_by" VALUE="Check" checked>
									</td>

								</tr>
				</CFIF>

								<tr>
									<td bgcolor="f3f3f3" width=254  align=left valign=top>

						<!--- ============================ --->
						<!--- ===/ PAY BY CREDIT CARD \=== --->
						<!--- ============================ --->

							<table width=252 cellpadding=0 cellspacing=0 border=0>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Credit Card
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<SELECT NAME="app_credit_card"
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
								<CFIF #app_credit_card# EQ "MasterCard">
									<OPTION VALUE="MasterCard" SELECTED>MasterCard</OPTION>
								<CFELSE>
									<OPTION VALUE="MasterCard">MasterCard</OPTION>
								</CFIF>

								<CFIF #app_credit_card# EQ "VISA">
									<OPTION VALUE="VISA" SELECTED>VISA</OPTION>
								<CFELSE>
									<OPTION VALUE="VISA">VISA</OPTION>
								</CFIF>

								<CFIF #app_credit_card# EQ "DISCOVER">
									<OPTION VALUE="DISCOVER" SELECTED>DISCOVER</OPTION>
								<CFELSE>
									<OPTION VALUE="DISCOVER">DISCOVER</OPTION>
								</CFIF>
										</SELECT>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card No.
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<CFINPUT type="text" name="app_cc_num" VALUE="#app_cc_num#" size=25 maxlength=19
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


								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Exp Month
									</td>

									<td bgcolor="f1f1f1" width=140 align=left valign=top>

									<SELECT NAME="app_cc_exp_month"
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
								<CFIF #app_cc_exp_month# EQ "1">
									<OPTION VALUE="1" SELECTED> 1</OPTION>
								<CFELSE>
									<OPTION VALUE="1"> 1</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "2">
									<OPTION VALUE="2" SELECTED> 2</OPTION>
								<CFELSE>
									<OPTION VALUE="2"> 2</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "3">
									<OPTION VALUE="3" SELECTED> 3</OPTION>
								<CFELSE>
									<OPTION VALUE="3"> 3</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "4">
									<OPTION VALUE="4" SELECTED> 4</OPTION>
								<CFELSE>
									<OPTION VALUE="4"> 4</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "5">
									<OPTION VALUE="5" SELECTED> 5</OPTION>
								<CFELSE>
									<OPTION VALUE="5"> 5</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "6">
									<OPTION VALUE="6" SELECTED> 6</OPTION>
								<CFELSE>
									<OPTION VALUE="6"> 6</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "7">
									<OPTION VALUE="7" SELECTED> 7</OPTION>
								<CFELSE>
									<OPTION VALUE="7"> 7</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "7">
									<OPTION VALUE="7" SELECTED> 7</OPTION>
								<CFELSE>
									<OPTION VALUE="7"> 7</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "8">
									<OPTION VALUE="8" SELECTED> 8</OPTION>
								<CFELSE>
									<OPTION VALUE="8"> 8</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "9">
									<OPTION VALUE="9" SELECTED> 9</OPTION>
								<CFELSE>
									<OPTION VALUE="9"> 9</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "10">
									<OPTION VALUE="10" SELECTED>10</OPTION>
								<CFELSE>
									<OPTION VALUE="10">10</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "11">
									<OPTION VALUE="11" SELECTED>11</OPTION>
								<CFELSE>
									<OPTION VALUE="11">11</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_month# EQ "12">
									<OPTION VALUE="12" SELECTED>12</OPTION>
								<CFELSE>
									<OPTION VALUE="12">12</OPTION>
								</CFIF>
										</SELECT>

								</td>
							</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Exp Year
									</td>

									<td bgcolor="f1f1f1" width=140 align=left valign=top>

									<SELECT NAME="app_cc_exp_year"
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
								<CFIF #app_cc_exp_year# EQ "2002">
									<OPTION VALUE="2002" SELECTED>2002</OPTION>
								<CFELSE>
									<OPTION VALUE="2002">2002</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2003">
									<OPTION VALUE="2003" SELECTED>2003</OPTION>
								<CFELSE>
									<OPTION VALUE="2003">2003</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2004">
									<OPTION VALUE="2004" SELECTED>2004</OPTION>
								<CFELSE>
									<OPTION VALUE="2004">2004</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2005">
									<OPTION VALUE="2005" SELECTED>2005</OPTION>
								<CFELSE>
									<OPTION VALUE="2005">2005</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2006">
									<OPTION VALUE="2006" SELECTED>2006</OPTION>
								<CFELSE>
									<OPTION VALUE="2006">2006</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2007">
									<OPTION VALUE="2007" SELECTED>2007</OPTION>
								<CFELSE>
									<OPTION VALUE="2007">2007</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2008">
									<OPTION VALUE="2008" SELECTED>2008</OPTION>
								<CFELSE>
									<OPTION VALUE="2008">2008</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2009">
									<OPTION VALUE="2009" SELECTED>2009</OPTION>
								<CFELSE>
									<OPTION VALUE="2009">2009</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2010">
									<OPTION VALUE="2010" SELECTED>2010</OPTION>
								<CFELSE>
									<OPTION VALUE="2010">2010</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2011">
									<OPTION VALUE="2011" SELECTED>2011</OPTION>
								<CFELSE>
									<OPTION VALUE="2011">2011</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2012">
									<OPTION VALUE="2012" SELECTED>2012</OPTION>
								<CFELSE>
									<OPTION VALUE="2012">2012</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2013">
									<OPTION VALUE="2013" SELECTED>2013</OPTION>
								<CFELSE>
									<OPTION VALUE="2013">2013</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2014">
									<OPTION VALUE="2014" SELECTED>2014</OPTION>
								<CFELSE>
									<OPTION VALUE="2014">2014</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2015">
									<OPTION VALUE="2015" SELECTED>2015</OPTION>
								<CFELSE>
									<OPTION VALUE="2015">2015</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2016">
									<OPTION VALUE="2016" SELECTED>2016</OPTION>
								<CFELSE>
									<OPTION VALUE="2016">2016</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2017">
									<OPTION VALUE="2017" SELECTED>2017</OPTION>
								<CFELSE>
									<OPTION VALUE="2017">2017</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2018">
									<OPTION VALUE="2018" SELECTED>2018</OPTION>
								<CFELSE>
									<OPTION VALUE="2018">2018</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2019">
									<OPTION VALUE="2019" SELECTED>2019</OPTION>
								<CFELSE>
									<OPTION VALUE="2019">2019</OPTION>
								</CFIF>

								<CFIF #app_cc_exp_year# EQ "2020">
									<OPTION VALUE="2020" SELECTED>2020</OPTION>
								<CFELSE>
									<OPTION VALUE="2020">2020</OPTION>
								</CFIF>
										</SELECT>

								</td>
							</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Holder Name
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<CFINPUT type="text" name="app_cc_name" VALUE="#app_cc_name#" size=15 maxlength=20
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
							</table>

								</td>

								<td bgcolor="f3f3f3" width=254  align=left valign=top>

						<!--- ============================ --->
						<!--- ===/    PAY BY CHECK    \=== --->
						<!--- ============================ --->

							<table width=252 cellpadding=0 cellspacing=0 border=0>
								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Account Holder Name
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<CFINPUT type="text" name="app_ck_acct_name" VALUE="#app_ck_acct_name#" size=25 maxlength=35
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

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Street / PO Box
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<CFINPUT type="text" name="app_ck_addr1" VALUE="#app_ck_addr1#" size=25 maxlength=120
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

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Street / PO Box
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<CFINPUT type="text" name="app_ck_addr2" VALUE="#app_ck_addr2#"  size=25 maxlength=120
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

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >City
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<CFINPUT type="text" name="app_ck_city" VALUE="#app_ck_city#"  size=15 maxlength=65
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
</CFOUTPUT>
								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >State
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<SELECT NAME="app_ck_state"
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
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<CFIF #read_title.app_ck_state# EQ "#a_list_of_all_states_1[NNN]#">
							<option value="#a_list_of_all_states_1[NNN]#" SELECTED>#a_list_of_all_states_1[NNN]#</option>
						<CFELSE>
							<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
						</CFIF>
					</CFOUTPUT>
				</CFLOOP>
										</SELECT>
									</td>
								</tr>
<CFOUTPUT QUERY="read_title">
								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Account No.
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<CFINPUT type="text" name="app_ck_acct_no" VALUE="#app_ck_acct_no#" size=23 maxlength=100
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

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Bank Name
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<CFINPUT type="text" name="app_ck_bank" VALUE="#app_ck_bank#" size=23 maxlength=65
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

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Routing No.
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<CFINPUT type="text" name="app_ck_route_no" VALUE="#app_ck_route_no#" size=23 maxlength=85
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
							</table>
						</td>
					</tr>
							</table>

									</td>
								</tr>

							</table>
						</TD>
					</TR>
				</table>
		</TD>
	</TR>
</TABLE>
<p>

</CFOUTPUT>


<CFOUTPUT QUERY="read_zip_code">

	<INPUT TYPE=HIDDEN NAME="pcity"   VALUE="#city#">
	<INPUT TYPE=HIDDEN NAME="pstate"  VALUE="#state#">
	<INPUT TYPE=HIDDEN NAME="pzip"    VALUE="#zip#">
	<INPUT TYPE=HIDDEN NAME="pcounty" VALUE="#county#">



</CFOUTPUT>

<CFOUTPUT>
	<INPUT TYPE=HIDDEN NAME="do_appraisal_current_value" VALUE="#read_title.do_appraisal#">
</CFOUTPUT>
		</TD>
	</TR>
		<tr><td width=607 align=right valign=bottom>
			<NOBR><input type=image border=0 src="./images/button_submit.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>


	</table>

</CFFORM>




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
