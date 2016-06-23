<cfparam name="url.vendor_id" default=0>
<cfparam name="form.vendor_id" default=0>
<CFPARAM NAME="vendor"     DEFAULT="">
<CFPARAM NAME="a_state"       DEFAULT="">
<CFPARAM NAME="a_trigger"       DEFAULT="">
<cfparam name="form.vd" default="All">
<cfif form.vendor_id neq 0>
<cflocation url="vendor_modify2_sb.cfm?vendor_id=#form.vendor_id#" addtoken="no">
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state_list">
			SELECT *
			FROM first_title_states_all
			ORDER BY st_abbrev ASC
</CFQUERY>


<cfif url.vendor_id neq 0>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_vendor">
			SELECT *
			FROM Vendors_Stacie_sb
			where vendor_id = #url.vendor_id#
			ORDER BY company
		</CFQUERY>
<cfelse>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_vendor">
			SELECT *
			FROM Vendors_Stacie_sb
			<cfif form.vd neq 'ALL'>
			Where service_type like'%#form.vd#%'
			</cfif>
			ORDER BY company
		</CFQUERY>
</cfif>

<cfif url.vendor_id NEQ 0>
<cfif listFindNoCase(read_vendor.service_type,"abstract") OR listFindNoCase(read_vendor.service_type,"Taxprep") OR listFindNoCase(read_vendor.service_type,"ICL") OR listFindNoCase(read_vendor.service_type,"DeedPrep")>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstractor">

			SELECT *
			FROM Abstractors_sb
			WHERE username = '#read_vendor.username#'
			and password = '#read_vendor.password#'
		</CFQUERY>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states_all
			ORDER BY st_abbrev ASC

		</CFQUERY>


		<CFSET a_states_list = ArrayNew(1)>
		<CFSET a_count = "1">

		<CFOUTPUT QUERY="read_state_list">
			<CFSET a_states_list[a_count] = #st_abbrev#>
			<CFSET a_count = #a_count# + "1">

		</CFOUTPUT>

			<CFSET a_state_cty_list = ArrayNew(2)>
			<CFSET a_county_count = ArrayNew(1)>

		<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="TTT">

			<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state_cty_list">

				SELECT DISTINCT COUNTY
				FROM zip_info
				WHERE state = '#a_states_list[TTT]#'
				ORDER BY county ASC

			</CFQUERY>

				<CFSET b_count = "1">

				<CFOUTPUT QUERY="read_state_cty_list">
					<CFSET a_state_cty_list[TTT][b_count] = #county#>

					<CFSET b_count = #b_count# + "1">
				</CFOUTPUT>

				<CFSET a_county_count[TTT] = #b_count# - "1">

		</CFLOOP>



		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstractors_county_list">

			SELECT st_abbrev, ct_name
			FROM Abstractors_county_sb
			WHERE Abstractor_ID = #read_abstractor.Abstractor_ID#
			ORDER BY st_abbrev ASC, ct_name ASC

		</CFQUERY>


		<CFSET a_app_states_1 = ArrayNew(1)>
		<CFSET a_app_county_1 = ArrayNew(1)>
		<CFSET c_count = "1">

		<CFOUTPUT QUERY="read_abstractors_county_list">
			<CFSET a_app_states_1[c_count] = #st_abbrev#>
			<CFSET a_app_county_1[c_count] = #ct_name#>
			<CFSET c_count = #c_count# + "1">
		</CFOUTPUT>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_rank">

			SELECT *
			FROM abstractors_county_sb
			WHERE abstractor_ID = #read_abstractor.abstractor_ID#

		</CFQUERY>

</cfif>



<cfif listFindNoCase(read_vendor.service_type,"closer")>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_closer">

		SELECT *
		FROM closer_sb
		WHERE username = '#read_vendor.username#'
		and password = '#read_vendor.password#'
	</CFQUERY>



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state_list">
		SELECT *
		FROM first_title_states
		ORDER BY st_abbrev ASC
	</CFQUERY>


	<CFSET a_states_list = ArrayNew(1)>
	<CFSET a_count = "1">

	<CFOUTPUT QUERY="read_state_list">
		<CFSET a_states_list[a_count] = #st_abbrev#>
		<CFSET a_count = #a_count# + "1">
	</CFOUTPUT>

	<CFSET a_state_cty_list = ArrayNew(2)>
	<CFSET a_county_count = ArrayNew(1)>

	<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="TTT">

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state_cty_list">
			SELECT DISTINCT COUNTY
			FROM zip_info
			WHERE state = '#a_states_list[TTT]#'
			ORDER BY county ASC
		</CFQUERY>

		<CFSET b_count = "1">

		<CFOUTPUT QUERY="read_state_cty_list">
			<CFSET a_state_cty_list[TTT][b_count] = #county#>
			<CFSET b_count = #b_count# + "1">
		</CFOUTPUT>

		<CFSET a_county_count[TTT] = #b_count# - "1">

	</CFLOOP>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_Closers_county_list">
		SELECT st_abbrev, ct_name
		FROM Closer_county_sb
		WHERE Closer_ID = #read_closer.Closer_ID#
		ORDER BY st_abbrev ASC, ct_name ASC
	</CFQUERY>

	<CFSET a_app_states_1 = ArrayNew(1)>
	<CFSET a_app_county_1 = ArrayNew(1)>
	<CFSET c_count = "1">

	<CFOUTPUT QUERY="read_Closers_county_list">
		<CFSET a_app_states_1[c_count] = #st_abbrev#>
		<CFSET a_app_county_1[c_count] = #ct_name#>
		<CFSET c_count = #c_count# + "1">
	</CFOUTPUT>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_rank">
		SELECT *
		FROM Closer_county_sb
		WHERE Closer_ID = #read_closer.Closer_ID#
	</CFQUERY>


</cfif>



</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>
<script type="text/javascript">
function ValidateForm(frm) {
var valid = true;
var message = "The following fields must be completed before submitting:\n";
if (document.frm.company.value=='') {
message = message + "Company Name\n"
valid = false;
}
if (document.frm.username.value=='') {
message = message + "Username\n"
valid = false;
}
if (document.frm.password.value=='') {
message = message + "Password\n"
valid = false;
}
if (document.frm.fname.value=='') {
message = message + "First Name\n"
valid = false;
}
if (document.frm.lname.value=='') {
message = message + "Last Name\n"
valid = false;
}
if (document.frm.phone.value=='') {
message = message + "Phone Number\n"
valid = false;
}
if (document.frm.email.value=='') {
message = message + "Email Address\n"
valid = false;
}
<!---
if (document.frm.addr1.value=='') {
message = message + "Address\n"
valid = false;
}
if (document.frm.city.value=='') {
message = message + "City\n"
valid = false;
}
if (document.frm.state.value=='') {
message = message + "State\n"
valid = false;
}
if (document.frm.zip_code.value=='') {
message = message + "Zip Code\n"
valid = false;
}
--->
if (valid == false) {
alert(message);
}
return valid;
}


 </script>
</HEAD>


<cfif url.vendor_id eq 0>
<!--- Vendor Select Start --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>

<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Modify Vendor </B>
			<p>
			Select a Vendor to modify</CENTER></NOBR><font size=2 color=black face=arial>
		</td>
	</tr>
</CFOUTPUT>

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>


<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>

<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/vendor_modify2_sb.cfm?uid=#URL.uid#&al=#URL.al#">
</CFOUTPUT>

	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="./images/clear.gif" height=10 width=85>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Vendors


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
		<SELECT NAME="vendor_id"
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
			><CFOUTPUT QUERY="read_vendor"><OPTION VALUE="#vendor_id#">#Company# -  #lname#, #fname#</OPTION></CFOUTPUT>
			</SELECT>


		</td>
	</tr>

	<tr>

		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>



</table>

</FORM>
		</td>



	</tr>
</table>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>




	</td>
</tr>
</table>

	</td>
</tr>
</table>


</BODY>
</HTML>


<cfelse>
<!--- VENDOR MODIFY START --->

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=800 align=center valign=top>

<table width=799 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=799 align=center valign=top bgcolor=e3e3e3>
			<FONT SIZE=2 color=black face=arial>

<table width=798 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=748 align=center valign=top bgcolor=e3e3e3>
			<font size=2 color=green face=arial><B>Modify a Vendor </B><br>
#read_vendor.company#<br>
		</td>
		<td width=50 align=center valign=top bgcolor=e3e3e3>
			<font size=2 color=green face=arial><B><a href="https://#cgi.SERVER_NAME#/admin_area/vendor_delete.cfm?vendor_id=#url.vendor_id#" onClick="javascript: return confirm('Are you sure you want to ENTIRELY DELETE this Vendor? Deleting the Vendor will completely erase all of their account information. \n \nTHIS ACTION CANNOT BE UNDONE! \n \n You may wish to simply deactivate the account by changing the Status to DISABLED \n\n To continue with DELETING THIS ACCOUNT, press OK, otherwise, press CANCEL');">DELETE THIS VENDOR</a><br>
		</td>
	</tr>
</CFOUTPUT>

</table>

		</td>
	</tr>

	<tr>
		<td width=799 align=center valign=top bgcolor=e3e3e3>


<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>


	<cfFORM name = "frm" ACTION="vendor_modify_submit2_sb.cfm?vendor_id=#url.vendor_id#" ENCTYPE="multipart/form-data" METHOD=POST>


	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="./images/clear.gif" height=10 width=85>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Company Name -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<cfinput  Required="Yes" Message="You must enter a Company Name (or the Vendor's Name)" type=text name="company" VALUE="#read_vendor.company#" size=25 maxlength=90 style="font-size: 9;
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
			<font size=2 color=black face=arial>
			(or Vendor's name)

		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			TSS Code -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="tss_id"  size=35 maxlength=75
			VALUE="<cfoutput>#read_vendor.tss_id#</cfoutput>"
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>User Name -
		</b>

		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<cfinput  Required="Yes" Message="You must enter a User Name" type=text name="username" VALUE="#read_vendor.username#" size=20 maxlength=90

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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=blue face=arial>
			Password -
		</b>

		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<cfinput  Required="Yes" Message="You must enter a Password" type=text name="password" VALUE="#read_vendor.password#" size=20 maxlength=90

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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			First Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfinput  Required="Yes" Message="You must enter a First Name" type=text name="fname" VALUE="#read_vendor.fname#" size=35 maxlength=50

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
				clear: none; ">


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Last Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfinput  Required="Yes" Message="You must enter a Last Name" type=text name="lname" VALUE="#read_vendor.lname#" size=35 maxlength=50

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
				clear: none; ">


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfinput  Required="Yes" Message="You must enter a Phone Number" type=text name="phone" VALUE="#read_vendor.phone#" size=25 maxlength=22

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
				clear: none; ">


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="fax" VALUE="<cfoutput>#read_vendor.fax#</cfoutput>" size=25 maxlength=22

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
				clear: none; ">


		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Cell -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="cell" VALUE="<cfoutput>#read_vendor.cell#</cfoutput>" size=25 maxlength=22

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
				clear: none; ">


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Pager -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="pager" VALUE="<cfoutput>#read_vendor.pager#</cfoutput>" size=25 maxlength=22

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
				clear: none; ">


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Email -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfinput  Required="Yes" Message="You must enter an Email Address" type=text name="email" VALUE="#read_vendor.email#" size=35 maxlength=160

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
				clear: none; ">


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfinput type=text name="addr1" VALUE="#read_vendor.addr1#" size=25 maxlength=90 style="font-size: 9;
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Suite or Unit Number -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="addr2" VALUE="<cfoutput>#read_vendor.addr2#</cfoutput>" size=40 maxlength=120

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
				clear: none; ">


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Notes -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="a_note_1" VALUE="<cfoutput>#read_vendor.a_note_1#</cfoutput>" size=40 maxlength=400

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
				clear: none; ">


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			City -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfinput type=text name="city" VALUE="#read_vendor.city#" size=25 maxlength=90 style="font-size: 9;
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			State -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfinput type=text name="state" VALUE="#read_vendor.state#" size=25 maxlength=90 style="font-size: 9;
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Zip Code -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfinput  type=text name="zip_code" VALUE="#read_vendor.zip_code#" size=25 maxlength=90 style="font-size: 9;
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax ID -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfinput  Required="No" type=text name="taxid" VALUE="#read_vendor.taxID#" size=25 maxlength=90 style="font-size: 9;
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Charge for SVC -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfinput  Required="No" type=text name="a_cost" VALUE="#read_vendor.a_cost#" size=25 maxlength=90 style="font-size: 9;
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			W9 -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfif read_vendor.w9 EQ "">
			<input type="file" name="w9" size=25 style="font-size: 9;
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
				clear: none;">
				<input type="hidden" name="upload_w9" value="0">
				<input type="hidden" name="delete_w9" value="0">
			<cfelse>
			<cfset FileSys = createObject('component','cfc.FileManagement')>
			<cfset fileurl = fileSys.FindFilePath(read_vendor.w9, 'url')>
			<cfoutput>
			<FONT SIZE=1 FACE=ARIAL>(click to view)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="vendor_modify_submit2.cfm?delete_w9=1&vendor_id=#read_vendor.vendor_id#&w9filename=#read_vendor.w9#">delete</a><br>
<FONT SIZE=2 FACE=ARIAL><A HREF="#fileurl#" target="new">#Mid(read_vendor.w9, 1, 20)#<cfif Len(read_vendor.w9) GT 20>...</cfif></a></font>
			</cfoutput>
			</cfif>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6 nowrap>
			<font size=2 color=black face=arial>
			E & O Certificate -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<cfif read_vendor.e_and_o_cert EQ "">
			<input type="file" name="e_and_o_cert" size=25 style="font-size: 9;
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
				clear: none;">
				<input type="hidden" name="upload_cert" value="0">
				<input type="hidden" name="delete_cert" value="0">
			<cfelse>
				<cfset FileSys = createObject('component','cfc.FileManagement')>
				<cfset fileurl = fileSys.FindFilePath(read_vendor.e_and_o_cert, 'url')>
			<cfoutput>
			<FONT SIZE=1 FACE=ARIAL>(click to view)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="vendor_modify_submit2.cfm?delete_cert=1&vendor_id=#read_vendor.vendor_id#&filename=#read_vendor.e_and_o_cert#">delete</a><br>
<FONT SIZE=2 FACE=ARIAL><A HREF="#fileurl#" target="new">#Mid(read_vendor.e_and_o_cert, 1, 20)#<cfif Len(read_vendor.e_and_o_cert) GT 20>...</cfif></a></font>
			</cfoutput>
			</cfif>
		</td>
	</tr>
	<tr>
<td width=130 align=right valign=top bgcolor=e6e6e6 nowrap>
			<font size=2 color=black face=arial>
			E & O Exp Date -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	<cfinput  Required="No" type=text name="e_and_o_expiration" VALUE="#DateFormat(read_vendor.e_and_o_expiration, 'm/d/yyyy')#" size=25 maxlength=90 style="font-size: 9;
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
				clear: none;" >&nbsp;<cftry><cfif DateDiff("d", read_vendor.e_and_o_expiration, Now()) gte 1><font color="RED"><strong>EXPIRED</strong></font></cfif><cfcatch type="any"></cfcatch></cftry><br>
</td></tr>
<tr>
	<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			E & O Carrier -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	<cfinput  Required="No" Message="Please enter a carrier name" type=text name="e_and_o_carrier" VALUE="#read_vendor.e_and_o_carrier#" size=25 maxlength=90 style="font-size: 9;
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
				clear: none;" ><br>

	</tr>
	<tr>
	<td width=130 align=right valign=top bgcolor=e6e6e6 nowrap>
			<font size=2 color=black face=arial>
			E & O Pol Number -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>

	<cfinput  Required="No" Message="Please enter an E & O Policy Number" type=text name="e_and_o_policy_num" VALUE="#read_vendor.e_and_o_policy_num#" size=25 maxlength=90 style="font-size: 9;
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
				clear: none;" ><br>
	</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Acct Status -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			&nbsp;<input  type=radio name="status" VALUE="0" style="font-size: 9;
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
				clear: none;" <cfif read_vendor.status neq 1>checked</cfif>> <font size=2 color=black face=arial>Disabled
				&nbsp;&nbsp;&nbsp;
			<input  type=radio name="status" VALUE="1" style="font-size: 9;
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
				clear: none;" <cfif read_vendor.status eq 1>checked</cfif>> <font size=2 color=black face=arial>Active
		</td>
	</tr>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_services">
			SELECT *
			FROM vendor_service
</CFQUERY>


<tr>
		<td  align=left valign=top bgcolor=cccccc colspan="3">
			<font size=2 color=black face=arial>
			<strong><font size=+1>Vendor Services</font></strong>:<BR><i>Check all services this vendor can perform, pricing and areas of service will come next</i>
		</td>
</tr>

<cfoutput query="read_services">
	<tr>
		<td width=130 align=left valign=top bgcolor="cccccc" colspan=2 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;">
			<font size=2 color=black face=arial>
			<input type="checkbox" name="service_type" value="#vendor_service_dbname#" <cfif ListContainsNoCase(read_vendor.service_type, vendor_service_dbname, ',')>checked</cfif> onclick="if(document.frm.service_type[#currentrow-1#].checked == false){document.getElementById('#lcase(vendor_service_dbname)#_info').style.display = 'none'; } else {document.getElementById('#lcase(vendor_service_dbname)#_info').style.display = 'block';}">&nbsp;#vendor_service_name#
		</td>
</tr>
</cfoutput>





	<tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Comments


		</td>
	</tr>

	<tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
				<TEXTAREA name="a_comments"  COLS=60 ROWS=6
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
					clear: none;"><cfoutput>#read_vendor.a_comments#</cfoutput></TEXTAREA>


		</td>
	</tr>

	<tr>
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			<a name="abstractor_pricing"></a>
			Preferences for recieving Vendor Notices

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=black face=arial>
			<NOBR>Email - <input type=radio name="pref_for_send" VALUE="Email" <cfif read_vendor.pref_for_send eq 'Email'>checked</cfif>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fax - <input type=radio name="pref_for_send" VALUE="Fax"  <cfif read_vendor.pref_for_send eq 'Fax'>checked</cfif>></NOBR>


		</td>
	</tr>





	<tr>

		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="./images/button_submit.gif" border=0 onclick="return ValidateForm(this);"><img src="./images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>



</table>

</cfFORM>

<!--- Abstractor Pricing Table --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstract_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'Abstract'
			ORDER BY state, county ASC
</CFQUERY>
<br>

<table id="abstract_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'Abstract', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>Abstract Pricing</td>
</tr>
<cfif read_abstract_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Full Search
		</td>
		<td align=right valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Current Owner
		</td>
		<td align=right valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Doc. Retrieval
		</td>
		<td align=right valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Two Owner
		</td>
		<td align=right valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Bring to Date
		</td>
		<td align=right colspan="2" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			&nbsp;
		</td>
	</tr>
<cfoutput query="read_abstract_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_abstract_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_abstract_prices.county#
		</td>
		<td align=right valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_abstract_prices.FULL_SEARCH#
		</td>
		<td align=right valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_abstract_prices.CURRENT_OWNER#
		</td>
		<td align=right valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_abstract_prices.doc_retrieval#
		</td>
		<td align=right valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_abstract_prices.TWO_OWNER#
		</td>
		<td align=right valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_abstract_prices.BRING_TO_DATE#
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_abstractor_modify_sb.cfm?billing_id=#read_abstract_prices.billing_id#','mywindow','width=700,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete_sb.cfm?vendor_id=#read_abstract_prices.vendor_id#&billing_id=#read_abstract_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add Abstract Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_abstractor_sb.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=700,height=125')"></td>
	</tr>
</table>
<a name="closer_pricing"></a>
<!--- APPRAISAL PRICING TABLE --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_appraisal_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'Appraisal'
			ORDER BY state, county ASC
</CFQUERY>

<br>
<table id="appraisal_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'Appraisal', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>Appraisal Pricing</td>
</tr>
<cfif read_appraisal_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right with="100" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Price
		</td>
		<td align=right colspan=5 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_appraisal_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_appraisal_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_appraisal_prices.county#
		</td>
		<td align=right width=100 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_appraisal_prices.appraisal_fee#
		</td>
		<td align=right colspan=3 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_appraisal_modify_sb.cfm?billing_id=#read_appraisal_prices.billing_id#','mywindow','width=500,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete_sb.cfm?vendor_id=#read_appraisal_prices.vendor_id#&billing_id=#read_appraisal_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add Appraisal Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_appraisal_sb.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=500,height=125')"></td>
	</tr>
</table>

<!--- CLOSER PRICING TABLE --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_closer_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'Closer'
			ORDER BY state, county ASC
</CFQUERY>

<br>
<table id="closer_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'Closer', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>Closer Pricing</td>
</tr>
<cfif read_closer_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right with="100" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Price
		</td>
		<td align=right colspan=5 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_closer_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_closer_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_closer_prices.county#
		</td>
		<td align=right width=100 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_closer_prices.closer_fee#
		</td>
		<td align=right colspan=3 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_closer_modify_sb.cfm?billing_id=#read_closer_prices.billing_id#','mywindow','width=500,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete_sb.cfm?vendor_id=#read_closer_prices.vendor_id#&billing_id=#read_closer_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add Closer Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_closer_sb.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=500,height=125')"></td>
	</tr>
</table>

<!--- TAXPREP PRICING TABLE --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_taxprep_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'TaxPrep'
			ORDER BY state, county ASC
</CFQUERY>

<br>
<table id="taxprep_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'TaxPrep', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>Tax Preparation Pricing</td>
</tr>
<cfif read_taxprep_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right with="100" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Price
		</td>
		<td align=right colspan=5 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_taxprep_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_taxprep_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_taxprep_prices.county#
		</td>
		<td align=right width=100 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_taxprep_prices.taxprep_fee#
		</td>
		<td align=right colspan=3 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_taxprep_modify_sb.cfm?billing_id=#read_taxprep_prices.billing_id#','mywindow','width=500,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete_sb.cfm?vendor_id=#read_taxprep_prices.vendor_id#&billing_id=#read_taxprep_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add Tax Prep Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_taxprep_sb.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=500,height=125')"></td>
	</tr>
</table>
<a name="payoff_pricing"></a>
<!--- ICL PRICING TABLE --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_ICL_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'ICL'
			ORDER BY state, county ASC
</CFQUERY>

<br>
<table id="icl_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'ICL', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>ICL Pricing</td>
</tr>
<cfif read_ICL_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right with="100" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Price
		</td>
		<td align=right colspan=5 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_ICL_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_ICL_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_ICL_prices.county#
		</td>
		<td align=right width=100 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_ICL_prices.ICL_fee#
		</td>
		<td align=right colspan=3 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_ICL_modify_sb.cfm?billing_id=#read_ICL_prices.billing_id#','mywindow','width=500,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete_sb.cfm?vendor_id=#read_ICL_prices.vendor_id#&billing_id=#read_ICL_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add ICL Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_ICL_sb.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=500,height=125')"></td>
	</tr>
</table>

<!--- PAYOFF PRICING TABLE --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_PAYOFF_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'PAYOFF'
			ORDER BY state, county ASC
</CFQUERY>

<br>
<table id="payoff_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'PAYOFF', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>Payoff Pricing</td>
</tr>
<cfif read_PAYOFF_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right with="100" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Price
		</td>
		<td align=right colspan=5 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_PAYOFF_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_PAYOFF_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_PAYOFF_prices.county#
		</td>
		<td align=right width=100 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_PAYOFF_prices.PAYOFF_fee#
		</td>
		<td align=right colspan=3 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_PAYOFF_modify.cfm?billing_id=#read_PAYOFF_prices.billing_id#','mywindow','width=500,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete.cfm?vendor_id=#read_PAYOFF_prices.vendor_id#&billing_id=#read_PAYOFF_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add Payoff Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_PAYOFF.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=500,height=125')"></td>
	</tr>
</table>


<!--- DEEDPREP PRICING TABLE --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_deedprep_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'deedprep'
			ORDER BY state, county ASC
</CFQUERY>

<br>
<table id="deedprep_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'deedprep', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>Deed Preparation Pricing</td>
</tr>
<cfif read_deedprep_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right with="100" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Price
		</td>
		<td align=right colspan=5 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_deedprep_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_deedprep_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_deedprep_prices.county#
		</td>
		<td align=right width=100 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_deedprep_prices.deedprep_fee#
		</td>
		<td align=right colspan=3 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_deedprep_modify.cfm?billing_id=#read_deedprep_prices.billing_id#','mywindow','width=500,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete.cfm?vendor_id=#read_deedprep_prices.vendor_id#&billing_id=#read_deedprep_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add Deed Prep Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_deedprep.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=500,height=125')"></td>
	</tr>
</table>

<!--- Typing PRICING TABLE --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_Typing_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'Typing'
			ORDER BY state, county ASC
</CFQUERY>

<br>
<table id="typing_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'Typing', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>Typing Pricing</td>
</tr>
<cfif read_Typing_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right with="100" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Price
		</td>
		<td align=right colspan=5 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_Typing_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_Typing_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_Typing_prices.county#
		</td>
		<td align=right width=100 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_Typing_prices.Typing_fee#
		</td>
		<td align=right colspan=3 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_Typing_modify.cfm?billing_id=#read_Typing_prices.billing_id#','mywindow','width=500,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete.cfm?vendor_id=#read_Typing_prices.vendor_id#&billing_id=#read_Typing_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add Typing Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_Typing.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=500,height=125')"></td>
	</tr>
</table>


<!--- Review PRICING TABLE --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_Review_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'Review'
			ORDER BY state, county ASC
</CFQUERY>

<br>
<table id="review_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'Review', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>Title Commitment Review Pricing</td>
</tr>
<cfif read_Review_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right with="100" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Price
		</td>
		<td align=right colspan=5 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_Review_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_Review_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_Review_prices.county#
		</td>
		<td align=right width=100 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_Review_prices.Review_fee#
		</td>
		<td align=right colspan=3 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_Review_modify.cfm?billing_id=#read_Review_prices.billing_id#','mywindow','width=500,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete.cfm?vendor_id=#read_Review_prices.vendor_id#&billing_id=#read_Review_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add Commitment Review Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_Review.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=500,height=125')"></td>
	</tr>
</table>

<!--- REO PRICING TABLE --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_REO_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'REO'
			ORDER BY state, county ASC
</CFQUERY>

<br>
<table id="reo_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'REO', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>REO Package Retrieval</td>
</tr>
<cfif read_REO_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right with="100" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Price
		</td>
		<td align=right colspan=5 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_REO_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_REO_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_REO_prices.county#
		</td>
		<td align=right width=100 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_REO_prices.reo_fee#
		</td>
		<td align=right colspan=3 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_REO_modify.cfm?billing_id=#read_REO_prices.billing_id#','mywindow','width=500,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete.cfm?vendor_id=#read_REO_prices.vendor_id#&billing_id=#read_REO_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add REO Document Retrieval Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_REO.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=500,height=125')"></td>
	</tr>
</table>


<!--- Recording PRICING TABLE --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_Recording_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'Recording'
			ORDER BY state, county ASC
</CFQUERY>

<br>
<table id="recording_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'Recording', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>Recording Services</td>
</tr>
<cfif read_Recording_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right with="100" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Price
		</td>
		<td align=right colspan=5 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_Recording_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_Recording_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_Recording_prices.county#
		</td>
		<td align=right width=100 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_Recording_prices.recording_fee#
		</td>
		<td align=right colspan=3 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_Recording_modify.cfm?billing_id=#read_Recording_prices.billing_id#','mywindow','width=500,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete.cfm?vendor_id=#read_Recording_prices.vendor_id#&billing_id=#read_Recording_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add Recording Services Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_Recording.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=500,height=125')"></td>
	</tr>
</table>



<!--- ORDER ENTRY PRICING TABLE --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_orderentry_prices">
			SELECT * from Vendor_Pricing_sb
			where vendor_id = #url.vendor_id# and service_type = 'OrderEntry'
			ORDER BY state, county ASC
</CFQUERY>

<br>
<table id="orderentry_info" style="display:<cfif ListContainsNoCase(read_vendor.service_type, 'OrderEntry', ',')>block<cfelse>none</cfif>;" width="100%" cellspacing=1  cellpadding=1 bgcolor=000000>
<tr bgcolor=e1e1e1>
<td bgcolor="cccccc" colspan=9 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;"><font size=3 color=black face=arial>Order Entry/Opening Services</td>
</tr>
<cfif read_orderentry_prices.recordcount eq 0>
<tr>
<td bgcolor=e6e6e6 colspan=9><font size=1 color=black face=arial>No Pricing Found</td>
</tr>
<cfelse>
	<tr bgcolor=000000>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			State
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			County
		</td>
		<td align=right with="100" valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			Price
		</td>
		<td align=right colspan=5 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
	</tr>
<cfoutput query="read_orderentry_prices">
	<tr>
		<td width=50 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_orderentry_prices.state#
		</td>
		<td width=250 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_orderentry_prices.county#
		</td>
		<td align=right width=100 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			#read_orderentry_prices.orderentry_fee#
		</td>
		<td align=right colspan=3 valign=top bgcolor=e6e6e6>&nbsp;

		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_orderentry_modify.cfm?billing_id=#read_orderentry_prices.billing_id#','mywindow','width=500,height=125')"><img src="images/button_m.gif" length=14 width=14 border=0></a>
		</td>
		<td align=right width=16 valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=arial>
			<a onclick="question = confirm('Are you sure you want to delete this entry?'); if (question==true) {document.location.href='https://#cgi.SERVER_NAME#/admin_area/vendor_pricing_delete.cfm?vendor_id=#read_orderentry_prices.vendor_id#&billing_id=#read_orderentry_prices.billing_id#'}; "><img src="images/button_d.gif" length=14 width=14 border=0></a>
		</td>
	</tr>
</cfoutput>
</cfif>
	<tr>
	<td colspan=9 align=right valign=top bgcolor=e6e6e6><input type="button" value="Add Order Entry/Opening Pricing Tier" onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_pricing_orderentry.cfm?vendor_id=<cfoutput>#read_vendor.vendor_id#</cfoutput>','mywindow','width=500,height=125')"></td>
	</tr>
</table>









	</tr>




		</td>



	</tr>
</table>

	<tr>
		<td width=799 align=center valign=top bgcolor=white>

	</td>
</tr>
</table>

	</td>
</tr>
</table>
<cfif listFindNoCase(read_vendor.service_type,"abstract") OR listFindNoCase(read_vendor.service_type,"Taxprep") OR listFindNoCase(read_vendor.service_type,"ICL") OR listFindNoCase(read_vendor.service_type,"DeedPrep")>
<table>
	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Counties Currently Serviced</b>
		</td>
	</tr>
<CFIF #read_abstractors_county_list.recordcount# EQ "0">


	</td>
	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=f1f1f1>
		<p>
		<bR>
		<font size=2 color=blue face=arial>
		This Abstractor does not have any "Counties Serviced" in their list.
		<p>
		</td>
	</tr>

<CFELSE>
	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		This is the current List of States and Counties for this Abstractor.
		<p>
		To
		Delete Counties from this list, click on each one to be deleted
		then click on the submit button.
		<p>
		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/abstractors_modify_countys_delete_sb.cfm?uid=#session.ft_user_id#&al=1&Abstractor_ID=#read_abstractor.Abstractor_ID#&a_state=#a_state#&vendor=#vendor#">
</CFOUTPUT>
				<SELECT NAME="zip_id" MULTIPLE
					size="6"
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
					<CFLOOP FROM="1" TO="#ArrayLen(a_app_states_1)#" INDEX="UUU">
						<CFOUTPUT >
							<OPTION VALUE="#a_app_states_1[UUU]#|#a_app_county_1[UUU]#">#a_app_states_1[UUU]# --- #a_app_county_1[UUU]#</OPTION>
						</CFOUTPUT>
					</CFLOOP>
			</SELECT>
		</td>
	</tr>

	<tr>
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<INPUT TYPE=IMAGE src="./images/button_delete.gif" BORDER=0>
</FORM>
		</td>
	</tr>

</CFIF>

	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Counties NOT Currently Serviced</b>
		</td>
	</tr>

	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		Click on any of the items in the list to add them to this Abstractors "Countys
		Serviced" List.
		<p><font size=1 color=blue face=arial> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(hold down the CTRL key to select more than one)
		<p>
		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/abstractors_modify_countys_add_sb.cfm?uid=#session.ft_user_id#&al=1&Abstractor_ID=#read_abstractor.Abstractor_ID#&a_state=#a_state#&vendor=#vendor#">
</CFOUTPUT>
				<SELECT NAME="zip_id" MULTIPLE
					size="6"
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


					<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="DDD">
						<CFSET a_trigger = "1">

						<CFLOOP FROM="1" TO="#a_county_count[DDD]#" INDEX="RRR">
							<CFOUTPUT>
								<OPTION VALUE="#a_states_list[DDD]#|#a_state_cty_list[DDD][RRR]#">#a_states_list[DDD]# --- #a_state_cty_list[DDD][RRR]#</OPTION>
							</CFOUTPUT>
						</CFLOOP>
					</CFLOOP>



			</SELECT>
		</td>
	</tr>

	<tr>
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<INPUT TYPE=IMAGE src="./images/button_add.gif" BORDER=0>
</FORM>
		</td>
	</tr>



	</table>

	</cfif>

	<cfif listFindNoCase(read_vendor.service_type,"closer")>
	<table>
	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Counties Currently Serviced</b>
		</td>
	</tr>
<CFIF #read_Closers_county_list.recordcount# EQ "0">
		<tr>
			<td width=498 colspan=2 align=left valign=top bgcolor=f1f1f1>
				<p>
				<bR>
				<font size=2 color=blue face=arial>
				This Closer does not have any "Counties Serviced" in their list.
				<p>
			</td>
		</tr>
<CFELSE>
		<tr>
			<td width=348 align=left valign=top bgcolor=f1f1f1>
				<font size=2 color=black face=arial>
				This is the current List of States and Counties for this Closer.
				<p>
				To
				Delete Counties from this list, click on each one to be deleted
				then click on the submit button.
				<p>
			</td>
			<td width=150 align=left valign=top bgcolor=f1f1f1>
	<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/Closer_modify_countys_delete_sb.cfm?uid=#session.ft_user_id#&al=1&Closer_ID=#read_closer.Closer_ID#&a_state=#a_state#&vendor=#vendor#">
	</CFOUTPUT>
				<SELECT NAME="zip_id" MULTIPLE
					size="6"
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
					<CFLOOP FROM="1" TO="#ArrayLen(a_app_states_1)#" INDEX="UUU">
						<CFOUTPUT >
							<OPTION VALUE="#a_app_states_1[UUU]#|#a_app_county_1[UUU]#">#a_app_states_1[UUU]# --- #a_app_county_1[UUU]#</OPTION>
						</CFOUTPUT>
					</CFLOOP>
				</SELECT>
			</td>
		</tr>
		<tr>
			<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
				<INPUT TYPE=IMAGE src="./images/button_delete.gif" BORDER=0>
	</FORM>
			</td>
		</tr>
</CFIF>
		<tr>
			<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
				<font size=2 color=blue face=arial>
				<b>Counties NOT Currently Serviced</b>
			</td>
		</tr>
		<tr>
			<td width=348 align=left valign=top bgcolor=f1f1f1>
				<font size=2 color=black face=arial>
				Click on any of the items in the list to add them to this Closer "Countys
				Serviced" List.
				<p><font size=1 color=blue face=arial> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(hold down the CTRL key to select more than one)
				<p>
			</td>
			<td width=150 align=left valign=top bgcolor=f1f1f1>
<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/Closer_modify_countys_add_sb.cfm?uid=#session.ft_user_id#&al=1&Closer_ID=#read_closer.Closer_ID#&a_state=#a_state#&vendor=#vendor#">
</CFOUTPUT>
				<SELECT NAME="zip_id" MULTIPLE
					size="6"
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

					<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="DDD">
						<CFSET a_trigger = "1">

						<CFLOOP FROM="1" TO="#a_county_count[DDD]#" INDEX="RRR">
							<CFOUTPUT>
								<OPTION VALUE="#a_states_list[DDD]#|#a_state_cty_list[DDD][RRR]#">#a_states_list[DDD]# --- #a_state_cty_list[DDD][RRR]#</OPTION>
							</CFOUTPUT>
						</CFLOOP>
					</CFLOOP>


				</SELECT>
			</td>
		</tr>
		<tr>
			<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
				<INPUT TYPE=IMAGE src="./images/button_add.gif" BORDER=0>
	</FORM>
			</td>
		</tr>
	</table>

	</cfif>


</BODY>
</cfif>
</HTML>

