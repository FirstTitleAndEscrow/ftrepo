<CFPARAM NAME="user_id_1" DEFAULT="">
<CFPARAM NAME="lo_id" DEFAULT="">
<CFPARAM NAME="zip_id" DEFAULT="">
<CFPARAM NAME="title" DEFAULT="">
<CFPARAM NAME="appraisal" DEFAULT="">
<CFPARAM NAME="property" DEFAULT="">
<CFPARAM NAME="other" DEFAULT="">
<CFPARAM NAME="emp" DEFAULT="">


		<!---This is a temp view until all roles are in use --->
		<CFQUERY datasource="#request.dsn#" NAME="read_role">
			SELECT role_id, tx_admin, tx_employee
			FROM First_admin
			WHERE ID = #URL.uid#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM Final_Document_Retrieval
			WHERE fdr_ID = #rec_ID#
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

	<CFQUERY datasource="#request.dsn#" NAME="read_lp">
		SELECT *
		FROM users
		WHERE ID = #read_title.user_id#
	</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="all_loan_officers">
			SELECT *
			FROM Loan_Officers
			WHERE comp_ID = #read_title.comp_id#
			<cfif read_sel_company.streamline_client eq 'True'>
			or streamline_emp = 'True'
			</cfif>
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="all_loan_processors">
			SELECT *
			FROM Users
			WHERE comp_ID = #read_title.comp_id#
			<cfif read_sel_company.streamline_client eq 'True'>
			or streamline_emp = 'True'
			</cfif>
		</CFQUERY>
		
		<CFQUERY DATASOURCE="#request.dsn#" NAME="all_internal_processors">
			SELECT id, fname, lname, email, streamline_employee as streamline_emp
			FROM dbo.First_Admin
			WHERE Processor='True' order by id asc
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">

			SELECT *
			FROM zip_info
			WHERE state = '#read_title.pstate#'

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
		</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<TR>
	<TD>
	<CFIF #read_role.role_id# neq "">
		<CFINCLUDE TEMPLATE="./includes/menu_header.cfm">
	</CFIF>
	</TD>
	</TR>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Policy Recovery</B></CENTER>
			</TD>
		</TR>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>



		<CFINCLUDE TEMPLATE="./includes/title_top_nav_fdr.cfm">





		</td>
	</tr>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

	<CFFORM NAME="frm" ACTION="./title_report_modify_fdr_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>

<input type="hidden" name="change_loan_officer" value="0">
<input type="hidden" name="change_loan_processor" value="0">
<input type="hidden" name="change_internal_processor" value="0">
<input type="hidden" name="change_seller_rep" value="0">

<CFOUTPUT QUERY="read_title">
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>

		<TR>
			<TD width=519 align=left valign=top bgcolor=blue>
				<FONT SIZE=3 color=white face=arial>
				Order Number is...<b>FDR-#read_title.fdr_id#</b>
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


						</TD>
					</tr>



					<tr>
						<td width=100 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"> <b>#DateFormat(order_date, "mm/dd/yyyy")#</b>
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
<cfif read_role.tx_admin eq 1 or read_role.tx_admin eq 'True' or read_role.tx_employee eq 1 or read_role.tx_employee eq 'True'>
<tr>
						<td  width=519 align="left" valign=top bgcolor=d3d3d3>
                        <FONT FACE=ARIAL SIZE=1 color="black">
							<strong>Client:</strong> <cfoutput>#read_sel_company.company#
							<input type="hidden" name="client_id" value="#read_sel_company.ID#"></cfoutput>
							</td></tr>
<cfelse>
					<tr>
						<td  width=519 align="left" valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							<strong>Client:</strong> <SELECT NAME="client_id"
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
			<CFINCLUDE TEMPLATE="./includes/companies.cfm">
			<CFoutput QUERY="read_companies"><OPTION VALUE="#ID#" <cfif read_title.comp_id eq read_companies.ID>selected</cfif>>#Company#</OPTION></CFoutput>
			</SELECT>
						</TD>
					</tr>
</cfif>




<tr>
						<td  width=519 align="left" valign=top bgcolor=f1f1f1>&nbsp;
							</TD>
					</tr>

<tr>
						<td  align="left" valign=top bgcolor=d3d3d3>

							<table width="100%" border=1>
							<tr>
							<td width=230 align="left" valign="top"><FONT FACE=ARIAL SIZE=1 color="black">
							<strong>Change Loan Officer:</strong> <br>
<SELECT onChange="document.frm.change_loan_officer.value=1;" NAME="loan_off"
			style="width:225px; font-size: 9;
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
			>
			<OPTION VALUE=""></OPTION>
			<cfoutput query="all_loan_officers"><cfif all_loan_officers.streamline_emp neq 'True'><OPTION VALUE="#all_loan_officers.ID#">#all_loan_officers.lo_fname# #all_loan_officers.lo_lname# - #all_loan_officers.lo_EMAIL#</OPTION></cfif></CFOUTPUT>
			<cfoutput query="all_loan_officers"><cfif all_loan_officers.streamline_emp eq 'True'><OPTION VALUE="#all_loan_officers.ID#">(ST) #all_loan_officers.lo_fname# #all_loan_officers.lo_lname# - #all_loan_officers.lo_EMAIL#</OPTION></cfif></CFOUTPUT>
			</SELECT>
			</td>

			<td  width=230 align="left" valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							<strong>Change Loan Processor:</strong> <br>
<SELECT onChange="document.frm.change_loan_processor.value=1; " NAME="loan_procs"
			style="width:225px; font-size: 9;
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
			>
			<OPTION VALUE=""></OPTION>
			<cfoutput query="all_loan_processors"><cfif all_loan_processors.streamline_emp neq 'True'><OPTION VALUE="#all_loan_processors.ID#">#all_loan_processors.lp_fname# #all_loan_processors.lp_lname# - #all_loan_processors.lp_EMAIL#</OPTION></cfif></CFOUTPUT>
			<cfoutput query="all_loan_processors"><cfif all_loan_processors.streamline_emp eq 'True'><OPTION VALUE="#all_loan_processors.ID#">(ST) #all_loan_processors.lp_fname# #all_loan_processors.lp_lname# - #all_loan_processors.lp_EMAIL#</OPTION></cfif></CFOUTPUT>
			</SELECT>
			</td>



							</tr>
							</table>






							</TD>
					</tr>


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
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>
							<CFINPUT type="text" NAME="oname" SIZE=21 MAXLENGTH=25
								VALUE="#read_title.oname#"
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
									clear: none;" > </B>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B><CFINPUT type="text" NAME="pname" SIZE=21 MAXLENGTH=25
								VALUE="#read_title.pname#"
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
									clear: none;" ></B>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="ophone" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.ophone#"
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
									clear: none;" ></b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B><CFINPUT type="text" NAME="pphone" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.pphone#"
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
									clear: none;" ></b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="oext" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.oext#"
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
									clear: none;" ></b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="pext" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.pext#"
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
									clear: none;" ></b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="ofax" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.ofax#"
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
									clear: none;" ></b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="pfax" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.pfax#"
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
									clear: none;" ></b>
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
							<b><CFINPUT type="text" NAME="o_email" SIZE=39 MAXLENGTH=65
								VALUE="#read_title.o_email#"
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
									clear: none;" ></b>
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="p_email" SIZE=39 MAXLENGTH=65
								VALUE="#read_title.p_email#"
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
									clear: none;" ></b>
						</td>
					</tr>					 
							<tr>
									<td  colspan=2 width=259 align="left" valign=top bgcolor=d3d3d3>
										<FONT FACE=ARIAL SIZE=1 color="black">
												<strong>Change Internal Processor:</strong> <br>
												<SELECT onChange="document.frm.change_internal_processor.value=1;" NAME="Internal_procs" ID="Internal_procs"
												style="width:225px; font-size: 9;
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
												>
												<OPTION VALUE=""></OPTION>
										<cfoutput query="all_internal_processors">	
											<cfif all_internal_processors.streamline_emp neq 'True'><OPTION VALUE="#all_internal_processors.ID#">#all_internal_processors.fname# #all_internal_processors.lname# - #all_internal_processors.EMAIL#</OPTION></cfif>
											<cfif all_internal_processors.streamline_emp eq 'True'><OPTION VALUE="#all_internal_processors.ID#">(ST) #all_internal_processors.fname# #all_internal_processors.lname# - #all_internal_processors.EMAIL#</OPTION></cfif></cfoutput>
												</SELECT>
									</td>
									<td  colspan=2 width=260 align="left" valign=top bgcolor=d3d3d3></td>
							</tr>			
										
					<tr>
						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Internal Processor:</b>
						</TD>
						
						<!--- Edit (Start) Added by Synechron Development for ticket# 737 Code added for fdr_id id --->
						<cfoutput>
						<td  colspan=2 width=260 align="left" valign=top bgcolor=d3d3d3>
							<input type="hidden" name="ip_id" value="#read_title.ip_id#">
						</td>
						</cfoutput>
						
						
						<!--- Edit (Start) Added by Synechron Development for ticket# 737 --->
					</tr>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B><CFINPUT type="text" NAME="ipname" SIZE=21 MAXLENGTH=25
								VALUE="#read_title.ipname#"
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
									clear: none;" ></B>
						</td>
					</tr>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>
	
						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B><CFINPUT type="text" NAME="ipphone" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.ipphone#"
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
									clear: none;" ></b>
						</td>
					</tr>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="ipext" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.ipext#"
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
									clear: none;" ></b>
						</td>
					</tr>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="ipfax" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.ipfax#"
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
									clear: none;" ></b>
						</td>
					</tr>
					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>
					</tr>
					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b><CFINPUT type="text" NAME="ip_email" SIZE=39 MAXLENGTH=65
								VALUE="#read_title.ip_email#"
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
									clear: none;" ></b>
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
<table width=720 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>





		<tr>
			<td width=719 align=left colspan=2 valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Third Party Access Request</B></CENTER><br>
					<FONT FACE=arial SIZE=1 color="black"><B>This feature allows you to give access to third parties to your orders.

				</TD>
		</TR>

		<CFQUERY datasource="#request.dsn#" NAME="third_party2">
			SELECT *
			FROM thirdparty a inner join  thirdpartyorders b on a.ID = b.thirdpID
			WHERE orderid = #read_title.fdr_id#

		</CFQUERY>

				<CFQUERY datasource="#request.dsn#" NAME="third_party">
			SELECT *
			FROM thirdparty
			WHERE comp_id = #read_title.comp_ID#

		</CFQUERY>
		<tr>
			<td width=519 bgcolor="f1f1f1" align=center valign=top>

							<FONT FACE=ARIAL SIZE=1 color="black">
							<b>Select Third Party(ies) -- hold 'CTRL' for multiple select </b> </font>
			<SELECT NAME="thirdp" 		multiple
			size="3"
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
			<OPTION VALUE="" selected>NONE</OPTION>
			<cfoutput query="third_party"><OPTION VALUE="#ID#">#FIRST# #LAST# - #EMAIL#</OPTION></CFOUTPUT>
			</SELECT>

				<CFOUTPUT>		 <br> <font color="990000" size="2" face="Times New Roman, Times, serif"><a href="https://#cgi.server_name#/registertp.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=#zip_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#" target="registertp" onClick="window.open('','registertp','width=620,height=400,status=0,resizable=0,scrollbars=0')">Click here to add new Third Party</a>
	</CFOUTPUT></font>
		</td>


		</TR>






















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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="blastname1" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.blastname1#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bfirstname1" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bfirstname1#"
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
							<FONT FACE=verdana SIZE=1 color="blue">
							<CFINPUT type="text" NAME="bminame1" SIZE=2 MAXLENGTH=3
								VALUE="#read_title.bminame1#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bssn1" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bssn1#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bhphone1" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bhphone1#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bwphone1" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bwphone1#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bext1" SIZE=2 MAXLENGTH=4
								VALUE="#read_title.bext1#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="blastname2" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.blastname2#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bfirstname2" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bfirstname2#"
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
							<FONT FACE=verdana SIZE=1 color="blue">
							<CFINPUT type="text" NAME="bminame2" SIZE=2 MAXLENGTH=3
								VALUE="#read_title.bminame2#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bssn2" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bssn2#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bhphone2" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bhphone2#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bwphone2" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bwphone2#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bext2" SIZE=2 MAXLENGTH=4
								VALUE="#read_title.bext2#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="blastname3" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.blastname3#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bfirstname3" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bfirstname3#"
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
							<FONT FACE=verdana SIZE=1 color="blue">
							<CFINPUT type="text" NAME="bminame3" SIZE=2 MAXLENGTH=3
								VALUE="#read_title.bminame3#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bssn3" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bssn3#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bhphone3" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bhphone3#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bwphone3" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bwphone3#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bext3" SIZE=2 MAXLENGTH=4
								VALUE="#read_title.bext3#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="blastname4" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.blastname4#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bfirstname4" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bfirstname4#"
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
							<FONT FACE=verdana SIZE=1 color="blue">
							<CFINPUT type="text" NAME="bminame4" SIZE=2 MAXLENGTH=3
								VALUE="#read_title.bminame4#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bssn4" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bssn4#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bhphone4" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bhphone4#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bwphone4" SIZE=11 MAXLENGTH=25
								VALUE="#read_title.bwphone4#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="bext4" SIZE=2 MAXLENGTH=4
								VALUE="#read_title.bext4#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="paddress" SIZE=25 MAXLENGTH=50
								VALUE="#read_title.paddress#"
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
							<FONT FACE=verdana SIZE=1 color="blue"><CFINPUT type="text" NAME="pcounty" SIZE=20 MAXLENGTH=25
								VALUE="#read_title.pcounty#"
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
							<CFINPUT type="text" NAME="loan_number" SIZE=20 MAXLENGTH=25
								VALUE="#read_title.loan_number#"
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
						<td width=205 bgcolor="white" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Original Lender Name<br></b>
						</td>


						<td width=314 bgcolor="white" align=left valign=top><CFINPUT type="text" NAME="original_lender_name" SIZE=20 MAXLENGTH=25
								VALUE="#read_title.original_lender_name#"
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
						<td width=205 bgcolor="white" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Original Loan Date<br></b>
						</td>


						<td width=314 bgcolor="white" align=left valign=top><CFINPUT type="text" NAME="original_loan_date" SIZE=20 MAXLENGTH=25
								VALUE="#DateFormat(read_title.original_loan_date, 'mm/dd/yyyy')#"
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
				<td width=205 bgcolor="white" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Original Loan Amount </b>
						</td>

						<td COLSPAN=3 width=314 bgcolor="white" align=left valign=top>
							<CFINPUT type="text" NAME="original_loan_amount" SIZE=20 MAXLENGTH=25
								VALUE="#read_title.original_loan_amount#"
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

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
		<td width=215 bgcolor="white" align=right valign=bottom>
			<FONT FACE=ARIAL SIZE=1 color="black">
				SLA option:  </td><td width=304  bgcolor="white" align=left valign=bottom>
				<FONT FACE=ARIAL SIZE=1 color="black">
							&nbsp;&nbsp;&nbsp;&nbsp;Standard <INPUT TYPE="RADIO" NAME="sla_option" VALUE="standard" <cfif read_title.sla_option eq 'standard'>checked</cfif>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rush  <INPUT TYPE="RADIO"  NAME="sla_option" VALUE="rush" <cfif read_title.sla_option eq 'rush'>checked</cfif>></NOBR>


		</td></TR>

				<tr>
		<td width=215 bgcolor="white" align=right valign=bottom>
							<FONT FACE=ARIAL SIZE=1 color="black">

							Order Type:  </td><td width=304  bgcolor="white" align=left valign=bottom>
						<FONT FACE=ARIAL SIZE=1 color="black">
							&nbsp;&nbsp;&nbsp;&nbsp;Image Only  <INPUT NAME="order_type" TYPE="radio" VALUE="image" <cfif read_title.order_type eq 'image'>checked</cfif>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="black">Paper Copy  <INPUT TYPE="RADIO"  NAME="order_type" VALUE="paper" <cfif read_title.order_type eq 'paper'>checked</cfif>></NOBR>


		</td></TR>

				<tr>
		<td width=215 bgcolor="white" align=right valign=bottom>
							<FONT FACE=ARIAL SIZE=1 color="black">

							Document Type:  </td><td width=304  bgcolor="white" align=left valign=bottom>
						<FONT FACE=ARIAL SIZE=1 color="black">
						<input name="document_type" id="document_type"  type="radio" value="Mortgage"  <cfif read_title.document_type eq 'Mortgage'>checked</cfif>  />Mortgage<BR>
						<input name="document_type" id="document_type"  type="radio" value="Deed of Trust"  <cfif read_title.document_type eq 'Deed of Trust'>checked</cfif>  />Deed of Trust<BR>
						<input name="document_type" id="document_type"  type="radio" value="Assignment"  <cfif read_title.document_type eq 'Assignment'>checked</cfif>  />Assignment<BR>
						<input name="document_type" id="document_type"  type="radio" value="Substitution of Trustees"  <cfif read_title.document_type eq 'Substitution of Trustees'>checked</cfif>  />Substitution of Trustees<BR>
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
							<textarea name="a_COMMENT" cols="30" rows="10">#a_COMMENT#</textarea>
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
					<CFIF (#read_title.comp_id# eq "115") OR (#read_title.comp_id# eq "621") >
	                    <CFSET Verifyemail1 = "">
											<CFSET Verifyemail2 = "">
											<CFSET Verifyemail3 = "">
                    <CFELSE>
	                    <CFSET Verifyemail1 = "#read_lp.lp_email#">
											 <CFSET Verifyemail2 = "#read_lp.cc_email_1#">
											 <CFSET Verifyemail3 = "#read_lp.cc_email_2#">
                    </CFIF>
                    <tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<CFINPUT type="text" NAME="Verifyemail" SIZE=40 MAXLENGTH=50
								VALUE="#read_title.Verifyemail#"
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
							<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to another other e-mail address.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT> <CFINPUT type="text" NAME="Verifyemail2" SIZE=40 MAXLENGTH=50
								VALUE="#read_title.Verifyemail_3#"
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
	                    <CFSET Verifyemail1 = "#read_lp.lp_email#">
											 <CFSET Verifyemail2 = "#read_lp.cc_email_1#">
											 <CFSET Verifyemail3 = "#read_lp.cc_email_2#">
                    </CFIF>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT> <CFINPUT type="text" NAME="Verifyemail1" SIZE=40 MAXLENGTH=50
								VALUE="#read_title.Verifyemail_2#"
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
							 <br>
						</td>
					</tr>


		<tr><td align=right valign=bottom>
			<NOBR><input type=image border=0 src="./images/button_submit.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR> </td></tr>


				</table>
	</cfoutput>



	</table>

</CFFORM>
<br><br>
</body>
</html>
