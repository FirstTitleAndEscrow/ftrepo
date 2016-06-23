
<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		
			SELECT *
			FROM companies
			ORDER BY company ASC
		
</CFQUERY>
<!---Query for Roles.  Status of 1 means active--->
<CFQUERY datasource="#request.dsn#" NAME="read_role">
		
			SELECT *
			FROM Roles
			where Role_Status = 1 order by Role_ID
		
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			SELECT *
			FROM first_admin
			where ID = #URL.UID#
		
</CFQUERY>
		<CFSET a_company_id = ArrayNew(1)>
		<CFSET a_company_name = ArrayNew(1)>
		<CFSET a_count = "1">
		
		
		<CFOUTPUT QUERY="read_companies">
				<CFSET a_company_id[a_count] = #ID#>
				<CFSET a_company_name[a_count] = #company#>
				<CFSET a_count = #a_count# + "1">			
		</CFOUTPUT>
		

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
$( document ).ready(function() {
    $("#role_id").change(function(){
		if($("#role_id").val() == "24"){
			$("#salesfields").show();
		}
		else{
			$("#salesfields").hide();	
		}
	});
});

function addRow(){
	if($("#visiblerows").val() == '4'){
		$("#row5").show();
		$("#visiblerows").val(5);
		
	}
	if($("#visiblerows").val() == '3'){
		$("#row4").show();
		$("#visiblerows").val(4);
		
	}
	
	if($("#visiblerows").val() == '2'){
		$("#row3").show();
		$("#visiblerows").val(3);
		
	}
	
	if($("#visiblerows").val() == '1'){
		$("#row2").show();
		$("#visiblerows").val(2);
		
	}
	
	
	
	
}

function deleteRow(){
	if($("#visiblerows").val() == '2'){
		$("#row2").hide();
		$("#visiblerows").val(1);
		$("#rev3").val("");
		$("#rev4").val("");
		
	}
	
	if($("#visiblerows").val() == '3'){
		$("#row3").hide();
		$("#visiblerows").val(2);
		$("#rev5").val("");
		$("#rev6").val("");
		
	}
	
	if($("#visiblerows").val() == '4'){
		$("#row4").hide();
		$("#visiblerows").val(3);
		$("#rev7").val("");
		$("#rev8").val("");
		
	}
	
	if($("#visiblerows").val() == '5'){
		$("#row5").hide();
		$("#visiblerows").val(4);
		$("#rev9").val("");
		$("#rev10").val("");
		
	}
	
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
									<font size=2 color=green face=arial><B>ADD User</B><font size=2 color=black face=arial>
									<p>
									<FONT SIZE=2 COLOR=red FACE=VERDANA>
									<B>Site Administrators Section</B>					
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width=499 align=left valign=top bgcolor=e1e1e1>
						<a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_return.gif" border=0 ALT="Return to -- Add Users"></a>
						</td>
					</tr>
						</CFOUTPUT>	
					<tr>
						<td width=499 align=center valign=top bgcolor=white>
							<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
							<CFFORM METHOD=POST ACTION="./user_admin_add_submit.cfm?uid=#URL.uid#&al=#URL.al#">
						<CFOUTPUT>
					<tr>		
						<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
							<img src="./images/clear.gif" height=10 width=85>
						</td>
					</tr>
					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=black face=arial>
						First Name
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<CFINPUT  type=text name="fname"  size=20 maxlength=30
						REQUIRED=YES MESSAGE="You must enter a FIRST NAME"
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
						Last Name
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<CFINPUT type=text name="lname"  size=20 maxlength=30
						REQUIRED=YES MESSAGE="You must enter a LAST NAME"
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
						Position
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<CFINPUT type=text name="position"  size=30 maxlength=60
						REQUIRED=YES MESSAGE="You must enter a POSITION"
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
					<TR>
						<td width=130 align=right valign=top bgcolor=e6e6e6>
						<font size=2 color=black face=arial>
						Role
						</td>
						</CFOUTPUT>
						<td width=145 align=left valign=top bgcolor=e1e1e1>	
						<SELECT NAME="role_id" 	
						id="role_id"	
						REQUIRED="Yes"
						Message="You Must Assign A Role"
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
						clear: none; 
						float: none;" 
						rows="3" 
						cols="45" 
						>
						<OPTION VALUE=""></OPTION>
						<CFOUTPUT QUERY="read_role">
							<option value="#Role_id#">#Role_Name#</option>
						</CFOUTPUT>
						</SELECT>
						</td>
					</tr>
					<input type="hidden" name="visiblerows" value="1" id="visiblerows">
					<tr id="salesfields" style="display:none">
					<td colspan="3" style="background-color:#e6e6e6;text-align:center">
					<table style="background-color:#e6e6e6;text-align:center">
					<tr>
					<td colspan="3"><font size=2 color=black face=arial>Time based on: <input name="timebased" type="radio" value="revenue" onClick="$('#commrate').show();$('#time').hide()"> Revenue <input name="timebased" type="radio" value="time" onClick="$('#commrate').hide();$('#time').show()"> Time</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr id="time" style="display:none">
					<td colspan="3"><font size=2 color=black face=arial><!---Time Tier:<br>--->
					<cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="time_tier_months" style="width:20px"> months from First Order <input name="time_tier" type="radio" value="months"> OR <br>
					First Closing <input type="radio" name="time_tier" value="percentage"> = <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="time_tier_percentage" style="width:20px">%
					</td>
					</tr>
					
					<tbody id="commrate" style="display:none">
					<tr>
					<td>
						<font size=2 color=black face=arial>Rev In Thousands
					</td>
					<td>&nbsp;
					
					</td>
					<td> <font size=2 color=black face=arial>Commission Rate</td>
					</tr>
					<tr>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="rev1" style="width:40px"> to <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="rev2" style="width:40px"></td>
					<td>=</td>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="per1" style="width:40px">%
					
					</td>
					<td><input type="button" value="Add" id="addr" onClick="addRow()" style="height:18px">
					<input type="button" value="Delete" id="deleter" onclick="deleteRow()" onclick="if(confirm('Are you sure you want to delete a row?'))deleteRow();" style="height:18px"></td>
					</tr>
					<tr id="row2" style="display:none">
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="rev3" id="rev3" style="width:40px"> <font size=2 color=black face=arial>to <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="rev4" id="rev4" style="width:40px"></td>
					<td>=</td>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="per2" id="per2" style="width:40px">%</td>
					</tr>
					<tr id="row3" style="display:none">
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="rev5" id="rev5" style="width:40px"> <font size=2 color=black face=arial>to <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="rev6" id="rev6" style="width:40px"></td>
					<td>=</td>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="per3"  id="per3" style="width:40px">%</td>
					</tr>
					<tr id="row4" style="display:none">
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="rev7" id="rev7" style="width:40px"> <font size=2 color=black face=arial>to <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="rev8" id="rev8" style="width:40px"></td>
					<td>=</td>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="per4" id="per4" style="width:40px">%</td>
					</tr>
					<tr id="row5" style="display:none">
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="rev9" id="rev9" style="width:40px"> <font size=2 color=black face=arial>to <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="rev10" id="rev10" style="width:40px"></td>
					<td>=</td>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="per5" id="per5" style="width:40px">%</td>
					</tr>
					</table>
					</td>
					</tr>
					</tbody>
					<CFOUTPUT>
					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=black face=arial>
						Email
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<CFINPUT  type=text name="email"  size=30 maxlength=160
						REQUIRED=YES MESSAGE="You must an EMAIL Address"
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
						Phone & Ext.
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<CFINPUT  type=text name="phone"  size=30 maxlength=60
						REQUIRED=YES MESSAGE="You must ENTER a phone Number"
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
						Direct Fax
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<CFINPUT  type=text name="fax"  size=30 maxlength=60
						REQUIRED=YES MESSAGE="You must ENTER a Direct Fax"
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
						<font size=2 color=blue face=arial>
						<B>User Name</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<CFINPUT  type=text name="username"  size=20 maxlength=30
						REQUIRED=YES MESSAGE="You must enter a USERNAME"
						style="font-size: 9; 
						font-family: verdana; 
						font-style: bold; 
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
						<B>1st Password</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<CFINPUT  type=text name="password"  size=20 maxlength=30
						REQUIRED=YES MESSAGE="You must enter a 1st PASSWORD"
						style="font-size: 9; 
						font-family: verdana; 
						font-style: bold; 
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
						<font size=2 color=blue face=arial>
						<B>2nd Password</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<CFINPUT  type=text name="password2"  size=20 maxlength=30
						REQUIRED=YES MESSAGE="You must enter a 2nd PASSWORD"
						style="font-size: 9; 
						font-family: verdana; 
						font-style: bold; 
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
						<B>Streamline Employee?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="streamline_employee" VALUE=1 > Yes<br>
						<input type=radio name="streamline_employee" VALUE=0 checked > No<br>

					</td>
				</tr>




					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Michigan Office Employee?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="mi_employee" VALUE=1 > Yes<br>
						<input type=radio name="mi_employee" VALUE=0 checked > No<br>

					</td>
				</tr>


				
					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Michigan Office Admin?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="mi_admin" VALUE=1 > Yes<br>
						<input type=radio name="mi_admin" VALUE=0 checked > No<br>

					</td>
				</tr>


					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Missouri Office Admin?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="mo_admin" VALUE=1 > Yes<br>
						<input type=radio name="mo_admin" VALUE=0 checked > No<br>

					</td>
				</tr>

					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Missouri Office Employee?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="mo_employee" VALUE=1 > Yes<br>
						<input type=radio name="mo_employee" VALUE=0 checked > No<br>

					</td>
				</tr>




					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Michigan Flushing Office Employee?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="mi_flushing_employee" VALUE=1 > Yes<br>
						<input type=radio name="mi_flushing_employee" VALUE=0 checked > No<br>

					</td>
				</tr>


				
					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Michigan Flushing Office Admin?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="mi_flushing_admin" VALUE=1 > Yes<br>
						<input type=radio name="mi_flushing_admin" VALUE=0 checked > No<br>

					</td>
				</tr>
				
					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Texas Office Employee?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="tx_employee" VALUE=1 > Yes<br>
						<input type=radio name="tx_employee" VALUE=0 checked > No<br>

					</td>
				</tr>


				
					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Texas Office Admin?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="tx_admin" VALUE=1 > Yes<br>
						<input type=radio name="tx_admin" VALUE=0 checked > No<br>

					</td>
				</tr>
				
									<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Virginia Office Employee?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="va_employee" VALUE=1 > Yes<br>
						<input type=radio name="va_employee" VALUE=0 checked > No<br>

					</td>
				</tr>


				
					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Virginia Office Admin?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="va_admin" VALUE=1 > Yes<br>
						<input type=radio name="va_admin" VALUE=0 checked > No<br>

					</td>
				</tr>


					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Streamline Fairfax Office Admin?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="fairfax_admin" VALUE=1 > Yes<br>
						<input type=radio name="fairfax_admin" VALUE=0 checked > No<br>

					</td>
				</tr>
				
					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>First Title Fairfax Office Employee?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="ft_fairfax_employee" VALUE=1 > Yes<br>
						<input type=radio name="ft_fairfax_employee" VALUE=0 checked > No<br>

					</td>
				</tr>
				
					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>First Title Fairfax Office Admin?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="ft_fairfax_admin" VALUE=1 > Yes<br>
						<input type=radio name="ft_fairfax_admin" VALUE=0 checked > No<br>

					</td>
				</tr>
				
					<tr>		
						<td width=130 align=right valign=top bgcolor=e6e6e6>	
						<font size=2 color=blue face=arial>
						<B>Receive Closing Notifications?</B>
						</td>
						<td width=237 align=left valign=top bgcolor=e6e6e6>	
						<input type=radio name="closing_emails" VALUE=1 > Yes<br>
						<input type=radio name="closing_emails" VALUE=0 checked > No<br>

					</td>
				</tr>

				<cfif #read_user.Lvl_access# eq 1>
				<tr>		
					<td width=130 align=right valign=top bgcolor=e6e6e6>	
					<font size=2 color=blue face=arial>
					<B>Access Level  </B>
					</td>
					<td width=237 align=left valign=top bgcolor=e6e6e6>	
					<font size=2 color=black face=arial>
					<NOBR><input type=radio name="lvl_access" VALUE="0" CHECKED> - User</NOBR>
					<br><font size=2 color=red face=arial>
					<NOBR><input type=radio name="lvl_access"  VALUE="1"> - Admin</NOBR><br>
				</td>
			</tr>
			<cfelse>
			<input type=hidden name="lvl_access" VALUE="0"> 
			</cfif>
				</CFOUTPUT>	
		<table width=364 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
			<tr>		
				<td width=364 align=CENTER valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>
				<B>Choose Client(s) this user will serve  </B>
				</td>
			</tr>
			<tr>		
				<td width=364  align=CENTER valign=top bgcolor=e1e1e1>	
				<SELECT NAME="comp_id" 	MULTIPLE		
				size="10" 
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
				float: none; 
				rows="5" 
				cols="45">
				<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="PPP">
						<CFOUTPUT>
								<OPTION VALUE="#a_company_ID[PPP]#">#a_company_name[PPP]# </OPTION>
						</CFOUTPUT>
				</CFLOOP>
				</SELECT>		
				</td>
			</tr>
			<CFOUTPUT>
			<tr>		
				<td width=364 colspan=2 align=RIGHT valign=top bgcolor=e6e6e6>	
				<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
				</td>
			</tr>
			</CFOUTPUT>
		</TABLE>
			</CFFORM>
	</table>
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


	