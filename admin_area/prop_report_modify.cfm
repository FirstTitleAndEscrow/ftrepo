<CFPARAM NAME="reo_number" DEFAULT="">
<CFPARAM NAME="loan_number" DEFAULT="">
<CFPARAM NAME="sale_date" DEFAULT="">
<CFPARAM NAME="due_date" DEFAULT="">

<CFSET  a_list_of_all_states = "AL|AK|AZ|AR|CA|CO|CT|DE|DC|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY">

<CFSET a_list_of_all_states_1 = #ListToArray(a_list_of_all_states, "|")#>

		<CFQUERY datasource="#request.dsn#" NAME="read_role">
			SELECT role_id
			FROM First_admin
			WHERE ID = #URL.uid#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_property">

			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_property.comp_ID#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#
	</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">

		SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">

			SELECT *
			FROM zip_info
			WHERE zip = '#read_property.pzip#'

		</CFQUERY>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

<script language="javascript">

function updateDueDate() {
var d = document.getElementById("sale_date").value;
if ( Object.prototype.toString.call(d) === "[object Date]" ) {
d.setDate(d.getDate() - 10);
document.getElementById("due_date").value = d;
}
}
<!--- Edit (Start) Added by Synechron Development for ticket# 501 --->
function ValidateAddress()
 {
  	var City="<cfoutput>#read_zip_code.city#</cfoutput>";
 	var State="<cfoutput>#read_zip_code.state#</cfoutput>";
 	var zip="<cfoutput>#read_zip_code.zip#</cfoutput>";
 	var Address=document.getElementById('paddress').value;

 	if (Address == '')
 	{
 		alert("You need to specify Address before you validate!");
 		return false;
 	}
 		window.open("../USPSAddressValidate.cfm?Address="+ Address + "&City=" + City + "&State="+State + "&zip=" +zip + "&div=Address","PopupWindow","menubar=0, scrollbars=0, resizable=0, width=590, height=225,left=400");
  }

  function setCursor()
  {
  	document.getElementById('lbl_validate').style.cursor="hand";
  	document.getElementById('lbl_map').style.cursor="hand";
  }

  function CreateGoogleMap()
  {
  		var City="<cfoutput>#read_zip_code.city#</cfoutput>";
 		var State="<cfoutput>#read_zip_code.state#</cfoutput>";
 		var zip="<cfoutput>#read_zip_code.zip#</cfoutput>";
 		var Address=document.getElementById('paddress').value;

  		window.open("../USPSAddressValidate.cfm?Address="+ Address + "&City=" + City + "&State="+State + "&zip=" +zip+ "&div=Map","PopupWindow","menubar=0, scrollbars=0, resizable=0,width=525, height=390,left=400");
  }
  	<!--- Edit (End) Added by Synechron Development for ticket# 501 --->
</script>


</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<TR>
		<TD>
			<CFIF #read_role.role_id# neq "">
				<CFINCLUDE TEMPLATE="./includes/menu_header.cfm">
			</CFIF>
		</TD>
	</TR>
	<tr>
		<td width=790 align=center valign=top>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=maroon>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report</B></CENTER>
			</TD>
		</TR>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>


		<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">




	<CFFORM NAME="frm" ACTION="./prop_report_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" METHOD=POST>

<CFOUTPUT QUERY="read_property">

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<TR>
			<TD width=519 align=left valign=top bgcolor=blue>
				<FONT SIZE=3 color=white face=arial>
				Order Number is...<b>#prop_id#</b>
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

						<td width=85 colspan=3 align=center valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<CFINPUT type="text" NAME="duedate" SIZE=12 MAXLENGTH=10
									VALUE="#DateFormat(duedate, 'm/d/yyyy')#"
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
#appraisal_status#

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
							<b><CFINPUT type="text" NAME="o_email" SIZE=21 MAXLENGTH=80
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
							<b><CFINPUT type="text" NAME="p_email" SIZE=21 MAXLENGTH=80
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

				</table>
			</td>
		</tr>

</table>

</CFOUTPUT>



<CFOUTPUT QUERY="read_property">

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
							<CFINPUT TYPE="Text" NAME="blastname1" SIZE=11 MAXLENGTH=25
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
							<CFINPUT TYPE="Text" NAME="bfirstname1" SIZE=11 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="bminame1" SIZE=1 MAXLENGTH=1
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
							<CFINPUT TYPE="Text" NAME="bssn1" SIZE=13 MAXLENGTH=11
								VALUE="#Right(bssn1, 4)#"
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
							<CFINPUT TYPE="Text" NAME="bhphone1" SIZE=12 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="bwphone1" SIZE=12 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="bext1" SIZE=4 MAXLENGTH=5
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
					<tr>
						<td width=25 colspan=1 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							&nbsp;
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Company Name<br>
								<CFINPUT type="text" NAME="company1" SIZE=25 MAXLENGTH=50
									VALUE="#read_title.company1#"
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
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Tax ID <br>
							<CFINPUT type="text" NAME="taxID1" SIZE=13 MAXLENGTH=13
									VALUE="#read_title.taxID1#"
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
							<CFINPUT TYPE="Text" NAME="blastname2" SIZE=11 MAXLENGTH=25
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
							<CFINPUT TYPE="Text" NAME="bfirstname2" SIZE=11 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="bminame2" SIZE=1 MAXLENGTH=1
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
							<CFINPUT TYPE="Text" NAME="bssn2" SIZE=13 MAXLENGTH=11
								VALUE="#Right(bssn2, 4)#"
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
							<CFINPUT TYPE="Text" NAME="bhphone2" SIZE=12 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="bwphone2" SIZE=12 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="bext2" SIZE=4 MAXLENGTH=5
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
					<tr>
						<td width=25 colspan=1 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							&nbsp;
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Company Name<br>
								<CFINPUT type="text" NAME="company2" SIZE=25 MAXLENGTH=50
									VALUE="#read_title.company1#"
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
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Tax ID <br>
							<CFINPUT type="text" NAME="taxID2" SIZE=13 MAXLENGTH=13
									VALUE="#read_title.taxID1#"
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
							<CFINPUT TYPE="Text" NAME="slastname1" SIZE=11 MAXLENGTH=25
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
							<CFINPUT TYPE="Text" NAME="sfirstname1" SIZE=11 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="sminame1" SIZE=1 MAXLENGTH=1
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
							<CFINPUT TYPE="Text" NAME="sssn1" SIZE=13 MAXLENGTH=11
								VALUE="#Right(sssn1, 4)#"
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
							<CFINPUT TYPE="Text" NAME="shphone1" SIZE=12 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="swphone1" SIZE=12 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="sext1" SIZE=4 MAXLENGTH=5
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
							<CFINPUT TYPE="Text" NAME="slastname2" SIZE=11 MAXLENGTH=25
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
							<CFINPUT TYPE="Text" NAME="sfirstname2" SIZE=11 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="sminame2" SIZE=1 MAXLENGTH=1
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
							<CFINPUT TYPE="Text" NAME="sssn2" SIZE=13 MAXLENGTH=11
								VALUE="#Right(sssn2, 4)#"
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
							<CFINPUT TYPE="Text" NAME="shphone2" SIZE=12 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="swphone2" SIZE=12 MAXLENGTH=15
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
							<CFINPUT TYPE="Text" NAME="sext2" SIZE=4 MAXLENGTH=5
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
							<CFINPUT TYPE="Text" Id="paddress" NAME="paddress" SIZE=50 MAXLENGTH=80
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
						<td id="cityStateZip" width=314  bgcolor="f1f1f1" align=left>
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
							<CFINPUT TYPE="Text" id="pcounty" NAME="pcounty" SIZE=50 MAXLENGTH=80
								VALUE="#read_property.pcounty#"
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
					<!--- Edit (Start) Added by Synechron Development for ticket# 501 --->
					<tr>
						<td align="center" colspan="2" bgcolor="f1f1f1" valign="top">
							<label id="lbl_validate" onclick='ValidateAddress()' onmouseover='setCursor()'><font face="Verdana" size="1" color="blue" style="text-decoration:underline;text-transform:capitalize;">Validate Address</font></label>&nbsp;&nbsp;
							<label id="lbl_map" onclick='CreateGoogleMap()' onmouseover='setCursor()' ><font face="Verdana" size="1" color="blue" style="text-decoration:underline;text-transform:capitalize;">View Map</font></label>
						</td>
					</tr>
					<!--- Edit (End) Added by Synechron Development for ticket# 501 --->
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Legal Description <br>
						</td>

<CFOUTPUT QUERY="read_property">

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<CFINPUT TYPE="Text" name="plegaldesc" size=50 maxlength=150
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


</CFOUTPUT>

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
<CFOUTPUT QUERY="read_property">
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
</td></tr></CFOUTPUT>


	</table>
<!--- ======================================================================= --->


<!--- ========================================= --->
<!--- ===/       [ COMMENTS ]  TOP         \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>COMMENTS TO APPEAR ON PROPERTY REPORT</B></CENTER>
			</TD>
		</TR>
<CFOUTPUT QUERY="read_property">
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<TEXTAREA NAME="comments_to_appear" rows=9 cols=70 wrap="virtual"
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
									clear: none;" >#comments_to_appear#</textarea>
						</td>
					</tr>
				</table>
</td></tr></CFOUTPUT>


	</table>
<!--- ======================================================================= --->




<!--- ========================================= --->
<!--- ===/       [ COMMENTS ]  TOP         \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>LOAN NUMBER</B></CENTER>
			</TD>
		</TR>
<CFOUTPUT QUERY="read_property">
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<input type="text" NAME="loan_number" value="#loan_number#"
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
</td></tr>



</CFOUTPUT>


	</table>
<!--- ======================================================================= --->
<cfif read_sel_company.fairfax_client eq 'True'  or	read_sel_company.fairfax_client eq 1 OR 1 EQ 1>

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>LOAN Type</B></CENTER>
			</TD>
		</TR>
<CFOUTPUT QUERY="read_property">
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<select name="loanType"
											size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: black;
											background-color: white;
											border-color: E4E3E3;
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
         						<OPTION VALUE="">Select</OPTION>
							<option value="FHA" <cfif loanType EQ "FHA">selected</cfif>>FHA</option>
							<option value="VA" <cfif loanType EQ "VA">selected</cfif>>VA</option>
							<option value="CONV" <cfif loanType EQ "CONV">selected</cfif>>CONV</option>
							<option value="FHLMC" <cfif loanType EQ "FHLMC">selected</cfif>>FHLMC</option>
							<option value="FNMA" <cfif loanType EQ "FNMA">selected</cfif>>FNMA</option>
							<option value="FNMA_free" <cfif loanType EQ "FNMA_free">selected</cfif>>FNMA Free Update</option>

							<option value="FFTVA" <cfif loanType EQ "FFTVA">selected</cfif>>FFTVA</option>
							<option value="FHA_HUD" <cfif loanType EQ "FHA_HUD">selected</cfif>>FHA_HUD</option>
							<option value="Vet_aff" <cfif loanType EQ "Vet_aff">selected</cfif>>Vet_aff</option>
							<option value="Bankruptcy" <cfif loanType EQ "Bankruptcy">selected</cfif>>Bankruptcy</option>
							<option value="DocRetrieval" <cfif loanType EQ "DocRetrieval">selected</cfif>>Document Retrieval</option>

										</select>
						</td>
					</tr>
				</table>
</td></tr>



</CFOUTPUT>


	</table>
<cfelse>
<input type="hidden" name="loanType" value="">
</cfif>

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>COST PER COPY</B></CENTER>
			</TD>
		</TR>
<CFOUTPUT QUERY="read_property">
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<input type="text" NAME="cost_per_copy" value="#cost_per_copy#"
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
</td></tr>



</CFOUTPUT>


	</table>

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>TOTAL COPIES</B></CENTER>
			</TD>
		</TR>
<CFOUTPUT QUERY="read_property">
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<input type="text" NAME="total_copies" value="#total_copies#"
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
</td></tr>



</CFOUTPUT>


	</table>
<!--- ======================================================================= --->
<!--- ======================================================================= --->
<!--- ======================================================================= --->


<!--- ========================================= --->
<!--- ===/       [ COMMENTS ]  TOP         \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>REO NUMBER</B></CENTER>
			</TD>
		</TR>
<CFOUTPUT QUERY="read_property">
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<input type="text" NAME="reo_number" value="#reo_number#"
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
</td></tr></CFOUTPUT>


		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>SALE DATE</B></CENTER>
			</TD>
		</TR>
<CFOUTPUT QUERY="read_property">
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<input type="text" NAME="sale_date" ID="sale_date" value="<cfif sale_date neq ''>#DateFormat(sale_date, 'mm/dd/yyyy')#</cfif>"
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
									clear: none;" onBlur="updateDueDate();">
						</td>
					</tr>


		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>DUE DATE</B></CENTER>
			</TD>
		</TR>
		</cfoutput>
<CFOUTPUT QUERY="read_property">
		<TR>

			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<input type="text" NAME="due_date" ID="due_date" value="<cfif due_date neq ''>#DateFormat(due_date, 'mm/dd/yyyy')#</cfif>"
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
</td></tr></CFOUTPUT>


	</table>
<!--- ======================================================================= --->



<!--- ======================================================================== --->


<CFOUTPUT QUERY="read_property">

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
							<CFINPUT TYPE="Text" NAME="polender1" size=15 maxlength=25 VALUE="#polender1#"
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
							<CFINPUT TYPE="Text" NAME="poacctno1" size=20 maxlength=30 VALUE="#poacctno1#"
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
							<CFINPUT TYPE="Text" NAME="pophone1"  size=12 maxlength=20
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
							<CFINPUT TYPE="Text" NAME="polender2" size=15 maxlength=25 VALUE="#polender2#"
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
							<CFINPUT TYPE="Text" NAME="poacctno2" size=20 maxlength=30 VALUE="#poacctno2#"
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
							<CFINPUT TYPE="Text" NAME="pophone2"  size=12 maxlength=20
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
							<FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT><CFINPUT TYPE="TEXT" NAME="Verifyemail" SIZE=40 MAXLENGTH=120
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
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT><CFINPUT  type="text" NAME="Verifyemail_2"  SIZE=40 MAXLENGTH=120
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
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT><CFINPUT type=text NAME="Verifyemail_3" VALUE="#Verifyemail_3#" SIZE=40 MAXLENGTH=120
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
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT><CFINPUT type=text NAME="RptbyEmail" SIZE=40 MAXLENGTH=120
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



									</td>
								</tr>

							</table>
						</TD>
					</TR>
				</table>
			</td>
		</tr>
</table>

</CFOUTPUT>

<CFOUTPUT QUERY="read_zip_code">

	<INPUT TYPE=HIDDEN NAME="pcity"   VALUE="#city#">
	<INPUT TYPE=HIDDEN NAME="pstate"  VALUE="#state#">
	<INPUT TYPE=HIDDEN NAME="pzip"    VALUE="#zip#">
<!--- 	<INPUT TYPE=HIDDEN NAME="pcounty" VALUE="#county#">
 --->
</CFOUTPUT>

<CFOUTPUT>
	<INPUT TYPE=HIDDEN NAME="do_appraisal_current_value" VALUE="#read_property.do_appraisal#">
</CFOUTPUT>


<p>
		</TD>
	</TR>
		<tr><td width=607 align=right valign=bottom>
			<NOBR><input type=image border=0 src="./images/button_continue.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>

</table>
</TABLE>

</CFFORM>






</body>
</html>
