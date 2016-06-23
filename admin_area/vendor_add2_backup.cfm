		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
		
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
		
			<CFQUERY datasource="#request.dsn#" NAME="read_state_cty_list">

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
	
	






		<CFQUERY datasource="#request.dsn#" NAME="read_vendors">
		
			SELECT *
			FROM Vendors_Stacie
			ORDER BY company ASC, lname ASC, fname ASC
		
		</CFQUERY>







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
if (document.frm.zip_id.value=='') {
message = message + "In order to add a new Vendor you need to choose county(ies)/state(s) this Vendor will serve\n"
valid = false;
}
if (valid == false) {
alert(message);
} 
return valid;
}


 </script>
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
			<font size=2 color=green face=arial><B>Add a Vendor </B>
		</td>
	</tr>
</CFOUTPUT>	

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>


	<cfFORM name = "frm" ACTION="vendor_add_submit2.cfm?uid=#URL.uid#&al=#URL.al#" ENCTYPE="multipart/form-data" METHOD=POST>


	<tr>		
		
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>	
			<img src="./images/clear.gif" height=10 width=85>
					
		
		</td>
	</tr>

	<!--- <tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			TSS Code -  
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="tss_id"  size=35 maxlength=75
			VALUE=""
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
	--->
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Company Name - 
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
			<cfinput  Required="Yes" Message="You must enter a Company Name (or the Vendor's Name)" type=text name="company" VALUE="" size=25 maxlength=90 style="font-size: 9; 
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
			<font size=2 color=blue face=arial>
			<b>User Name - 
		</b>
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
			<cfinput  Required="Yes" Message="You must enter a User Name" type=text name="username" VALUE="" size=20 maxlength=90
							
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
			<cfinput  Required="Yes" Message="You must enter a Password" type=text name="password" VALUE="" size=20 maxlength=90
							
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
			<cfinput  Required="Yes" Message="You must enter a First Name" type=text name="fname" VALUE="" size=35 maxlength=50
				
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
			<cfinput  Required="Yes" Message="You must enter a Last Name" type=text name="lname" VALUE="" size=35 maxlength=50
				
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
			<cfinput  Required="Yes" Message="You must enter a Phone Number" type=text name="phone" VALUE="" size=25 maxlength=22
				
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
			<input type=text name="fax" VALUE="" size=25 maxlength=22
				
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
			<input type=text name="cell" VALUE="" size=25 maxlength=22
				
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
			<input type=text name="pager" VALUE="" size=25 maxlength=22
				
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
			<cfinput  Required="Yes" Message="You must enter an Email Address" type=text name="email" VALUE="" size=35 maxlength=160
				
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
			<cfinput  Required="Yes" Message="You must enter an Address" type=text name="addr1" VALUE="" size=25 maxlength=90 style="font-size: 9; 
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
			<input type=text name="addr2" VALUE="" size=40 maxlength=120
				
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
			<input type=text name="a_note_1" VALUE="" size=40 maxlength=400
				
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
			<cfinput  Required="Yes" Message="You must enter a City" type=text name="city" VALUE="" size=25 maxlength=90 style="font-size: 9; 
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
			<cfinput  Required="Yes" Message="You must enter a State" type=text name="state" VALUE="" size=25 maxlength=90 style="font-size: 9; 
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
			<cfinput  Required="Yes" Message="You must enter a Zip Code" type=text name="zip_code" VALUE="" size=25 maxlength=90 style="font-size: 9; 
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
		<td  align=left valign=top bgcolor=cccccc colspan="3">	
			<font size=2 color=black face=arial>
			<strong><font size=+1>Vendor Services</font></strong>:<BR><i>Check all services this vendor can perform, and fill in the appropriate fields</i>
		</td>
</tr>
<tr>		
		<td width=130 align=left valign=top bgcolor="cccccc" colspan=2 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;">	
			<font size=2 color=black face=arial>
			<input type="checkbox" name="service_type" value=1 onClick="if (document.getElementById('abstractor_info').style.display == 'block') {document.getElementById('abstractor_info').style.display = 'none';
 document.frm.a_cost.value = '';
 document.frm.deedonly.value = '';
 document.frm.oe1.value = '';
 document.frm.oe2.value = '';
 document.frm.mort.value = '';
 document.frm.judg.value = '';
 document.frm.rec.value = '';
 document.frm.rec_update.value = '';
 
 } else {document.getElementById('abstractor_info').style.display = 'block';}">&nbsp;Abstracting
		</td>
</tr>
<tr id="abstractor_info" style="display:none"><td colspan=3>
	<table width="100%"><tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			O&E(1) + Update -
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="a_cost" VALUE="" size=15 maxlength=20
				
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
			Deed only -
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="deedonly" VALUE="" size=15 maxlength=20
				
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
			O&E -
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="oe1" VALUE="" size=15 maxlength=20
				
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
			O&E(2) -
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="oe2" VALUE="" size=15 maxlength=20
				
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
			Mortgage -
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="mort" VALUE="" size=15 maxlength=20
				
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
			Judgment -
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="judg" VALUE="" size=15 maxlength=20
				
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
			Recording -
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="rec" VALUE="" size=15 maxlength=20
				
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
			Rec w/update
		
		
		</td>

		<td align=left valign=top bgcolor=e6e6e6 colspan=2>	
			<input type=text name="rec_update" VALUE="" size=15 maxlength=20
			
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
		</table>
</td>	
</tr>
	
<tr>		
		<td width=130 align=left valign=top bgcolor="cccccc" colspan=2 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;">		
			<font size=2 color=black face=arial>
			<input type="checkbox" name="service_type" value=2 onClick="if (document.getElementById('appraiser_info').style.display == 'block') {document.getElementById('appraiser_info').style.display = 'none';} else {document.getElementById('appraiser_info').style.display = 'block';}">&nbsp;Appraisal
		</td>
</tr>





<tr id="appraiser_info" style="display:none"><td align=left valign=top bgcolor="e6e6e6" colspan=3>
	<table>
	<tr>		
		<td width=50% align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Charge for Service - 
		
		
		</td>

		<td width="60%" align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="appraiser_charge" VALUE="" size=20 maxlength=80
				
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
		</table>
</td>	
</tr>








<tr>		
		<td width=130 align=left valign=top bgcolor="cccccc" colspan=2 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;">		
			<font size=2 color=black face=arial>
			<input type="checkbox" name="service_type" value=3 onClick="if (document.getElementById('closer_info').style.display == 'block') {document.getElementById('closer_info').style.display = 'none';} else {document.getElementById('closer_info').style.display = 'block';}">&nbsp;Closer
		</td>
</tr>





<tr id="closer_info" style="display:none"><td align=left valign=top bgcolor="e6e6e6" colspan=3>
	<table>
	<tr>		
		<td width=50% align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Charge for Service - 
		
		
		</td>

		<td width="60%" align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="closer_charge" VALUE="" size=20 maxlength=80
				
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
		</table>
</td>	
</tr>








<tr>		
		<td width=130 align=left valign=top bgcolor="cccccc" colspan=2 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;">		
			<font size=2 color=black face=arial>
			<input type="checkbox" name="service_type" value=3 onClick="if (document.getElementById('tax_info').style.display == 'block') {document.getElementById('tax_info').style.display = 'none';} else {document.getElementById('tax_info').style.display = 'block';}">&nbsp;Tax Preparation
		</td>
</tr>





<tr id="tax_info" style="display:none"><td align=left valign=top bgcolor="e6e6e6" colspan=3>
	<table>
	<tr>		
		<td width=50% align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Charge for Service - 
		
		
		</td>

		<td width="60%" align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="tax_charge" VALUE="" size=20 maxlength=80
				
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
		</table>
</td>	
</tr>







<tr>		
		<td width=130 align=left valign=top bgcolor="cccccc" colspan=2 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;">		
			<font size=2 color=black face=arial>
			<input type="checkbox" name="service_type" value=3 onClick="if (document.getElementById('icl_info').style.display == 'block') {document.getElementById('icl_info').style.display = 'none';} else {document.getElementById('icl_info').style.display = 'block';}">&nbsp;ICL Vendor
		</td>
</tr>





<tr id="icl_info" style="display:none"><td align=left valign=top bgcolor="e6e6e6" colspan=3>
	<table>
	<tr>		
		<td width=50% align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Charge for Service - 
		
		
		</td>

		<td width="60%" align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="icl_charge" VALUE="" size=20 maxlength=80
				
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
		</table>
</td>	
</tr>






<tr>		
		<td width=130 align=left valign=top bgcolor="cccccc" colspan=2 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;">		
			<font size=2 color=black face=arial>
			<input type="checkbox" name="service_type" value=3 onClick="if (document.getElementById('payoff_info').style.display == 'block') {document.getElementById('payoff_info').style.display = 'none';} else {document.getElementById('payoff_info').style.display = 'block';}">&nbsp;Payoff Vendor
		</td>
</tr>





<tr id="payoff_info" style="display:none"><td align=left valign=top bgcolor="e6e6e6" colspan=3>
	<table>
	<tr>		
		<td width=50% align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Charge for Service - 
		
		
		</td>

		<td width="60%" align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="payoff_charge" VALUE="" size=20 maxlength=80
				
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
		</table>
</td>	
</tr>










<tr>		
		<td align=left valign=top bgcolor="cccccc" colspan=3 style="border-top-style:solid; border-top-width:thin; border-top-color:e6e6e6; border-bottom-style:solid; border-bottom-width:thin; border-bottom-color:e6e6e6;">		
			<font size=2 color=black face=arial>
			<input type="checkbox" name="service_type" value=3 onClick="if (document.getElementById('deed_info').style.display == 'block') {document.getElementById('deed_info').style.display = 'none';} else {document.getElementById('deed_info').style.display = 'block';}">&nbsp;Deed Preparation Vendor
		</td>
</tr>

<tr id="deed_info" style="display:none"><td align=left valign=top bgcolor="e6e6e6" colspan=3>
	<table>
	<tr>		
		<td width=50% align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Charge for Service - 
		
		
		</td>

		<td width="60%" align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="deed_charge" VALUE="" size=20 maxlength=80
				
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
		</table>
</td>	
</tr>


<!--- <tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			O&E(1) + Update -
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="oe" VALUE="" size=15 maxlength=20
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
				clear: none; ">
					
		
		</td>
	</tr> --->

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
					clear: none;"></TEXTAREA>
					
		
		</td>
	</tr>

	<tr>		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Select County and State Vendor is going to serve
	
		</td>
		<tr>
		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
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
		<!--- <CFIF #ArrayLen(a_app_county_1)# EQ "0"> --->

					<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="DDD">
						<CFSET a_trigger = "1">
						
						<CFLOOP FROM="1" TO="#a_county_count[DDD]#" INDEX="RRR">
							<CFOUTPUT>
								<OPTION VALUE="#a_states_list[DDD]#|#a_state_cty_list[DDD][RRR]#">#a_states_list[DDD]# --- #a_state_cty_list[DDD][RRR]#</OPTION>
							</CFOUTPUT>
						</CFLOOP>
					</CFLOOP>	
	</td>
	</tr>


	<tr>		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Preferences for recieving Vendor Notices
	
		</td>
	</tr>
	
	<tr>
		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
		<font size=2 color=black face=arial>
			<NOBR>Email - <input type=radio name="pref_for_send" VALUE="Email" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fax - <input type=radio name="pref_for_send" VALUE="Fax"></NOBR>

		
		</td>
	</tr>





	<tr>		
		
		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
			<NOBR><input type=image src="./images/button_submit.gif" border=0 onclick="return ValidateForm(this);"><img src="./images/clear.gif" height=10 width=40></NOBR>
					
		
		</td>
	</tr>


	
</table>

</cfFORM>		
		</td>		

		

	</tr>
</table>
		
	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			

<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>		
		
		<td width=497 align=center valign=top bgcolor=e1e1e1>	
			<img src="./images/clear.gif" height=10 width=85>
			<font size=1 color=red face=arial>
			Review the list below to ensure the Vendor isn't already in the Database
		
		</td>
	</tr>		

	<tr>		
		
		<td width=497  align=right valign=top bgcolor=e1e1e1>	
			<FORM><SELECT NAME="a" MULTIPLE			
			size="4" 
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
			><CFOUTPUT QUERY="read_vendors"><OPTION VALUE="#company#">#Company# ---  #lname#, #fname#</OPTION></CFOUTPUT>			
			</SELECT></FORM>		
		</td>
	</tr>


</table>	

	</td>
</tr>
</table>	

	</td>
</tr>
</table>


</BODY>
</HTML>

