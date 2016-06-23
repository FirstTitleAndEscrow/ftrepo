<CFQUERY datasource="#request.dsn#" NAME="read_admin_user">
SELECT * FROM first_admin WHERE ID = #user_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_sales">
SELECT * FROM sales_commision_tiers WHERE UID = #read_admin_user.id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_role">
SELECT * FROM Roles where Role_Status = 1 order by Role_ID
</CFQUERY>
<CFIF #read_admin_user.role_id# neq"">
  <CFQUERY datasource="#request.dsn#" NAME="read_role_name">
  SELECT Role_Name FROM Roles WHERE role_ID = #read_admin_user.Role_id#
  </CFQUERY>
  <CFQUERY datasource="#request.dsn#" NAME="read_role_not_in_name">
  SELECT Role_ID,Role_Name FROM Roles WHERE role_ID<>#read_admin_user.Role_id# order by Role_ID
  </CFQUERY>
  <!---Information to create a loop --->
  <CFSET a_role_id = ArrayNew(1)>
  <CFSET a_role_name = ArrayNew(1)>
  <CFSET a_role_count = 1>
  <CFOUTPUT QUERY="read_role_not_in_name">
    <CFSET a_role_id[a_role_count] = #read_role_not_in_name.Role_ID#>
    <CFSET a_role_name[a_role_count] = #read_role_not_in_name.Role_Name#>
    <CFSET a_role_count = #a_role_count# + 1>
  </CFOUTPUT>
</CFIF>
<CFQUERY datasource="#request.dsn#" NAME="read_current_assoc">
SELECT * FROM user_client_assoc WHERE ID = #user_id# ORDER BY company_name ASC
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_companies">
SELECT * FROM companies ORDER BY Company ASC
</CFQUERY>
<CFSET a_company_x = "">
<CFOUTPUT QUERY="read_current_assoc">
  <CFSET a_company_x = #a_company_x# & #company_name# & ",">
</CFOUTPUT>
<CFSET a_company_list = #ListToArray(a_company_x, ",")#>
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
		$("#per2").val("");
		
	}
	
	if($("#visiblerows").val() == '3'){
		$("#row3").hide();
		$("#visiblerows").val(2);
		$("#rev5").val("");
		$("#rev6").val("");
		$("#per3").val("");
		
	}
	
	if($("#visiblerows").val() == '4'){
		$("#row4").hide();
		$("#visiblerows").val(3);
		$("#rev7").val("");
		$("#rev8").val("");
		$("#per4").val("");
		
	}
	
	if($("#visiblerows").val() == '5'){
		$("#row5").hide();
		$("#visiblerows").val(4);
		$("#rev9").val("");
		$("#per5").val("");
		$("#rev10").val("");
		
	}
	
}
</script>
</HEAD>
<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>
<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
  <tr>
    <td width=500 align=center valign=top><table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
        <tr>
        
        <td width=499 align=center valign=top bgcolor=e2e2e2>
        
        <FONT SIZE=2 color=black face=arial>
        
        <table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
        
        <CFOUTPUT>
          <tr>
            <td width=498 align=center valign=top bgcolor=white><font size=2 color=blue face=arial>Modify User<font size=2 color=black face=arial>
              <p> <FONT SIZE=2 COLOR=red FACE=VERDANA> <B>Site Administrators Section</B> </td>
          </tr>
          <tr>
            <td width=498 align=center valign=top bgcolor=e3e3e3><font size=3 color=blue face=arial> User - <B>#read_admin_user.fname#&nbsp;&nbsp;&nbsp;&nbsp;#read_admin_user.lname#</B> </td>
          </tr>
          </table>
          
          </td>
          
          </tr>
          
          <tr>
            <td width=499 align=left valign=top bgcolor=e1e1e1><a href="./user_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_return.gif" border=0 ALT="Return to -- Modify an existing User"></a> </td>
          </tr>
        </CFOUTPUT>
        <tr>
          <td width=498 align=center valign=top bgcolor=white><font size=2 color=blue face=arial><B>MODIFY clients associted with this user</B> </td>
        </tr>
        <tr>
          <td width=499 align=center valign=top bgcolor=white><table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
            <CFFORM METHOD=POST ACTION="./user_admin_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&user_id=#user_id#">
              <tr>
                <td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6><img src="./images/clear.gif" height=10 width=85> </td>
              </tr>
              <CFOUTPUT>
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> First Name </td>
                  <td width=237 align=left valign=top bgcolor=e6e6e6><CFINPUT VALUE="#read_admin_user.fname#" type=text name="fname"  size=20 maxlength=30
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
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> Last Name </td>
                  <td width=237 align=left valign=top bgcolor=e6e6e6><CFINPUT VALUE="#read_admin_user.lname#" type=text name="lname"  size=20 maxlength=30
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
              </CFOUTPUT>
              <tr>
                <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> Position </td>
                <td width=237 align=left valign=top bgcolor=e6e6e6><CFINPUT VALUE="#read_admin_user.position#" type=text name="position"  size=30 maxlength=50
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
              <!---Here is where Role Needs to be --->
              <tr>
                <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> Role </td>
                <td width=145 align=left valign=top bgcolor=e1e1e1><SELECT NAME="role_id" id="role_id" 		
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
                    <CFIF 	#read_admin_user.role_id# eq "">
                      <OPTION VALUE=""></OPTION>
                      <CFOUTPUT QUERY="read_role">
                        <option value="#Role_id#">#Role_Name#</option>
                      </CFOUTPUT>
                      <CFELSE>
                      <CFOUTPUT>
                        <option value="#read_admin_user.Role_id#">#read_role_name.Role_Name#</option>
                      </CFOUTPUT>
                      <!---This part here is so that the same Role Name doesn't show up twice in the drop down --->
                      <CFLOOP FROM="1" TO="#ArrayLen(a_role_id)#" INDEX="PPP">
                        <CFOUTPUT>
                          <OPTION VALUE="#a_role_ID[PPP]#">#a_role_name[PPP]# </OPTION>
                        </CFOUTPUT>
                      </CFLOOP>
                    </CFIF>
                  </SELECT>
                </td>
              </tr>
			  <cfoutput>
			  <input type="hidden" name="visiblerows" value="<cfif Len(read_sales.visiblerows)>#read_sales.visiblerows#<cfelse>1</cfif>" id="visiblerows">
			  <tr id="salesfields" <cfif read_admin_user.role_id NEQ 24>style="display:none"</cfif>>
					<td colspan="3" style="background-color:##e6e6e6;text-align:center">
					<table style="background-color:##e6e6e6;text-align:center">
					<tr>
					<td colspan="3" align=center valign=top bgcolor=e6e6e6><font size=2 color=black face=arial>Time based on: <input name="timebased" type="radio" value="revenue" onClick="$('##commrate').show();$('##time').hide()" <cfif read_sales.timebased EQ "revenue">checked</cfif>> Revenue <input name="timebased" type="radio" value="time" onClick="$('##commrate').hide();$('##time').show()" <cfif read_sales.timebased EQ "time">checked</cfif>> Time</td>
					</tr>
					<tr><td valign=top bgcolor=e6e6e6>&nbsp;</td></tr>
					<tr id="time" <cfif read_sales.timebased EQ "revenue" OR (read_sales.timebased EQ "" )>style="display:none"</cfif>>
					<td colspan="3" valign=top bgcolor=e6e6e6><!---Time Tier:<br>---><font size=2 color=black face=arial>
					<cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="time_tier_months" style="width:20px" value="#read_sales.time_tier_months#"> months from First Order <input name="time_tier" type="radio" value="months" <cfif read_sales.time_tier EQ "months">checked</cfif>> OR <br>
					First Closing <input type="radio" name="time_tier" value="percentage" <cfif read_sales.time_tier EQ "percentage">checked</cfif>> = <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="time_tier_percentage" style="width:20px">%
					</td>
					</tr>
					
					<tbody id="commrate" <cfif read_sales.timebased EQ "time" OR (read_sales.timebased EQ "" )>style="display:none"</cfif>>
					<tr>
					<td align=right valign=top bgcolor=e6e6e6>
						<font size=2 color=black face=arial>Rev In Thousands
					</td>
					<td>&nbsp;
					
					</td>
					<td align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> Commission Rate</td>
					</tr>
					<tr>
					<td align="center"><cfinput type="text"  value="#read_sales.rev1#" validate="integer" message="You have entered non-numeric data in a numeric field" name="rev1" style="width:40px"> <font size=2 color=black face=arial>to <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text"  value="#read_sales.rev2#" name="rev2" id="rev2" style="width:40px"></td>
					<td>=</td>
					<td align="center"><cfinput type="text" validate="integer" value="#read_sales.per1#" message="You have entered non-numeric data in a numeric field" name="per1" style="width:40px">%</td>
					<td><input type="button" value="Add" id="addr" onClick="addRow()" style="height:18px">
					<input type="button" value="Delete" id="deleter" onClick="if(confirm('Are you sure you want to delete a row?'))deleteRow();" style="height:18px"></td>
					</tr>
					</tr>
					<tr id="row2" <cfif read_sales.visiblerows LT 2>style="display:none"</cfif>>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="rev3" id="rev3" style="width:40px" value="#read_sales.rev3#"> <font size=2 color=black face=arial>to <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="rev4" id="rev4" value="#read_sales.rev4#" style="width:40px"></td>
					<td>=</td>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="per2" id="per2" style="width:40px" value="#read_sales.per2#">%</td>
					</tr>
					<tr id="row3" <cfif read_sales.visiblerows LT 3>style="display:none"</cfif>>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="rev5" id="rev5" style="width:40px" value="#read_sales.rev5#"> <font size=2 color=black face=arial>to <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="rev6" id="rev6" value="#read_sales.rev6#" style="width:40px"></td>
					<td>=</td>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="per3" id="per3" style="width:40px" value="#read_sales.per3#">%</td>
					</tr>
					<tr id="row4" <cfif read_sales.visiblerows LT 4>style="display:none"</cfif>>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="rev7" id="rev7" style="width:40px" value="#read_sales.rev7#"> <font size=2 color=black face=arial>to <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="rev8" id="rev8" value="#read_sales.rev8#" style="width:40px"></td>
					<td>=</td>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="per4" id="per4" style="width:40px" value="#read_sales.per4#">%</td>
					</tr>
					<tr id="row5" <cfif read_sales.visiblerows LT 5>style="display:none"</cfif>>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="rev9" id="rev9" style="width:40px" value="#read_sales.rev9#"> <font size=2 color=black face=arial>to <cfinput validate="integer" message="You have entered non-numeric data in a numeric field" type="text" name="rev10" id="rev10" value="#read_sales.rev10#" style="width:40px"></td>
					<td>=</td>
					<td align="center"><cfinput type="text" validate="integer" message="You have entered non-numeric data in a numeric field" name="per5" id="per5" style="width:40px" value="#read_sales.per5#">%</td>
					</tr>
					</table>
					</td>
					</tr>
					</tbody>
			  </cfoutput>
              <CFOUTPUT>
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> Email </td>
                  <td width=237 align=left valign=top bgcolor=e6e6e6><CFINPUT  VALUE="#read_admin_user.email#" type=text name="email"  size=30 maxlength=60
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
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> Phone & Ext. </td>
                  <td width=237 align=left valign=top bgcolor=e6e6e6><CFINPUT  VALUE="#read_admin_user.phone#" type=text name="phone"  size=30 maxlength=60
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
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> Direct Fax </td>
                  <td width=237 align=left valign=top bgcolor=e6e6e6><CFINPUT  VALUE="#read_admin_user.fax#" type=text name="fax"  size=30 maxlength=60
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
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>User Name</B> </td>
                  <td width=237 align=left valign=top bgcolor=e6e6e6><CFINPUT  VALUE="#read_admin_user.username#" type=text name="username"  size=20 maxlength=30
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
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>1st Password</B> </td>
                  <td width=237 align=left valign=top bgcolor=e6e6e6><CFINPUT VALUE="#read_admin_user.password#" type=password name="password"  size=20 maxlength=30
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
								clear: none;" >
                  </td>
                </tr>
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>2nd Password</B> </td>
                  <td width=237 align=left valign=top bgcolor=e6e6e6><CFINPUT VALUE="#read_admin_user.password2#" type=password name="password2"  size=20 maxlength=30
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
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Access Level </B> </td>
                  <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial>
                    <CFIF #read_admin_user.lvl_access# EQ "0">
                      <NOBR>
                      <input type=radio name="lvl_access" VALUE="0" CHECKED>
                      - User</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="lvl_access"  VALUE="1">
                      - Admin</NOBR><br>
                      <CFELSE>
                      <NOBR>
                      <input type=radio name="lvl_access" VALUE="0">
                      - User</NOBR><br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="lvl_access"  VALUE="1" CHECKED>
                      - Admin</NOBR><br>
                    </CFIF>
                  </td>
                </tr>
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Streamline Employee?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="streamline_employee" VALUE=1 <CFIF #read_admin_user.streamline_employee# eq 1>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="streamline_employee"  VALUE=0 <CFIF #read_admin_user.streamline_employee# eq 0>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>
				
				
				
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Missouri Office Employee?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="mo_employee" VALUE=1 <CFIF #read_admin_user.mo_employee# eq 1>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="mo_employee"  VALUE=0 <CFIF #read_admin_user.mo_employee# eq 0>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>
				
				
				
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Missouri Office Admin?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="mo_admin" VALUE=1 <CFIF #read_admin_user.mo_admin# eq 1>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="mo_admin"  VALUE=0 <CFIF #read_admin_user.mo_admin# eq 0>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>
                
                
                
                
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Michigan Office Employee?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="mi_employee" VALUE=1 <CFIF #read_admin_user.mi_employee# eq 1>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="mi_employee"  VALUE=0 <CFIF #read_admin_user.mi_employee# eq 0>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>
				
				
				
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Michigan Office Admin?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="mi_admin" VALUE=1 <CFIF #read_admin_user.mi_admin# eq 1>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="mi_admin"  VALUE=0 <CFIF #read_admin_user.mi_admin# eq 0>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>
                
                
                
                
                
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Michigan Flushing Office Employee?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="mi_flushing_employee" VALUE=1 <CFIF #read_admin_user.mi_flushing_employee# eq 1>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="mi_flushing_employee"  VALUE=0 <CFIF #read_admin_user.mi_flushing_employee# eq 0>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>
				
				
				
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Michigan Flushing Office Admin?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="mi_flushing_admin" VALUE=1 <CFIF #read_admin_user.mi_flushing_admin# eq 1>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="mi_flushing_admin"  VALUE=0 <CFIF #read_admin_user.mi_flushing_admin# eq 0>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>
				
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Texas Office Employee?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="tx_employee" VALUE=1 <CFIF #read_admin_user.tx_employee# eq 1>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="tx_employee"  VALUE=0 <CFIF #read_admin_user.tx_employee# neq 1>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>
				
				
				
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Texas Office Admin?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="tx_admin" VALUE=1 <CFIF #read_admin_user.tx_admin# eq 1>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="tx_admin"  VALUE=0 <CFIF #read_admin_user.tx_admin# neq 1>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>
				
				
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Virginia Office Employee?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="va_employee" VALUE=1 <CFIF #read_admin_user.va_employee# eq 1 or #read_admin_user.va_employee# eq 'True'>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="va_employee"  VALUE=0 <CFIF #read_admin_user.va_employee# neq 1>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>
				
				
				
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Virginia Office Admin?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="va_admin" VALUE=1 <CFIF #read_admin_user.va_admin# eq 1 or  #read_admin_user.va_admin# eq 'True'>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="va_admin"  VALUE=0 <CFIF #read_admin_user.va_admin# neq 1>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>


                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Streamline Fairfax Office Admin?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="fairfax_admin" VALUE=1 <CFIF #read_admin_user.fairfax_admin# eq 1 or  #read_admin_user.fairfax_admin# eq 'True'>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="fairfax_admin"  VALUE=0 <CFIF #read_admin_user.fairfax_admin# neq 1>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>


                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>First Title Fairfax Office Employee?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="ft_fairfax_employee" VALUE=1 <CFIF #read_admin_user.ft_fairfax_employee# eq 1 or  #read_admin_user.ft_fairfax_employee# eq 'True'>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="ft_fairfax_employee"  VALUE=0 <CFIF #read_admin_user.ft_fairfax_employee# neq 1>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>


                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>First Title Fairfax Office Admin?</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="ft_fairfax_admin" VALUE=1 <CFIF #read_admin_user.ft_fairfax_admin# eq 1 or  #read_admin_user.ft_fairfax_admin# eq 'True'>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="ft_fairfax_admin"  VALUE=0 <CFIF #read_admin_user.ft_fairfax_admin# neq 1>CHECKED</cfif>>
                      - No</NOBR><br>
                    </td>

                </tr>


                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Receive Closing Notifications???</B> </td>
                  
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="closing_emails" VALUE=1 <CFIF #read_admin_user.closing_emails# eq 1>CHECKED</cfif>>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="closing_emails"  VALUE=0 <CFIF #read_admin_user.closing_emails# neq 1>CHECKED</cfif>>
                      - No</NOBR>

                    </td>

                </tr>
				
				
				

                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Internal Processor?</B> </td>
                  <CFIF #read_admin_user.processor# eq 1>
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="processor" VALUE=1 CHECKED>
                      - Yes</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="processor"  VALUE=0>
                      - No</NOBR><br>
                    </td>
                    <CFELSE>
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="processor" VALUE=0 CHECKED>
                      - No</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="processor"  VALUE=1>
                      - Yes</NOBR><br>
                    </td>
                  </CFIF>
                </tr>
				
<cfif session.ft_user_id eq 56 or session.ft_user_id eq 59 or  session.ft_user_id eq 472 or  session.ft_user_id eq 340 or  session.ft_user_id eq 248>			
                <tr>
                  <td width=130 align=right valign=top bgcolor=e6e6e6><font size=2 color=blue face=arial> <B>Status</B> </td>
                  <CFIF #read_admin_user.status# eq 1>
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="status" VALUE=1 CHECKED>
                      - Active</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="status"  VALUE=0>
                      - Inactive</NOBR><br>
                    </td>
                    <CFELSE>
                    <td width=237 align=left valign=top bgcolor=e6e6e6><font size=2 color=black face=arial> <NOBR>
                      <input type=radio name="status" VALUE=0 CHECKED>
                      - Inactive</NOBR> <br>
                      <font size=2 color=red face=arial> <NOBR>
                      <input type=radio name="status"  VALUE=1>
                      - Active</NOBR><br>
                    </td>
                  </CFIF>
                </tr>
<cfelse>
<input type='hidden' name='status' value='#read_admin_user.status#'>
</cfif>				

                <tr>
                  <td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6><NOBR>
                    <input type=image src="./images/button_submit.gif" border=0>
                    <img src="./images/clear.gif" height=10 width=40></NOBR> </td>
                </tr>
                </table>
              </CFOUTPUT>
            </CFFORM>
            <cfoutput>
              <table width=497 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
              <FORM METHOD=POST ACTION="./client_user_modify.cfm?uid=#URL.uid#&al=#URL.al#&user_id=#user_id#&a_flag=1">
              <tr>
                <td width=497  align=left valign=top bgcolor=e6e6e6><font size=1 color=blue face=verdana> Below is a list of the Clients associated with this User. To remove a Client from the list below, Select all of the ones you want to remove, then click on the delete button.
                  <p> </td>
              </tr>
            </cfoutput>
        <tr>
          <td width=497 align=left valign=top bgcolor=e6e6e6><SELECT NAME="Current_companies_id" MULTIPLE		
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
							float: none;" 
							rows="5" 
							cols="45">
              <CFOUTPUT QUERY="read_current_assoc">
                <OPTION VALUE="#company_id#">#company_name# </OPTION>
              </CFOUTPUT>
            </SELECT>
            <p>
              <input type=image src="./images/button_delete.gif" border=0>
          </td>
        </tr>
        </FORM>
        
      </table></td>
  </tr>
  <!--- ============================================================ --->
  <CFOUTPUT>
    <tr>
    
    <td width=498 align=center valign=top bgcolor=e3e3e3>
    
    <table width=497 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
    
    <FORM METHOD=POST ACTION="./client_user_modify.cfm?uid=#URL.uid#&al=#URL.al#&user_ID=#user_id#&a_flag=2">
    
    <tr>
      <td width=497  align=left valign=top bgcolor=e6e6e6><font size=1 color=blue face=verdana> Select one or more Companies from the list below to be associated with this User
        <p> </td>
    </tr>
  </CFOUTPUT>
  <td width=497 align=left valign=top bgcolor=e6e6e6><SELECT NAME="New_company_id" 	MULTIPLE		
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
							float: none;" 
							rows="5" 
							cols="45" 
							>
        <!--- if you put a cfabort here it works find 
					 		<CFIF #read_current_assoc.recordcount# EQ "0">
								<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="PPP">
									<CFOUTPUT>
									<OPTION VALUE="#a_company_id[PPP]#">#a_company_name[PPP]# </OPTION>
									</CFOUTPUT>
								</CFLOOP>
							<CFELSE>
								<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="PPP">
									<CFSET xx_trigger = "1">
									<CFOUTPUT QUERY="read_current_assoc">
										<CFIF #company_ID# EQ #a_company_id[PPP]#>
											<CFSET xx_trigger = "2">	
										</CFIF>						
									</CFOUTPUT>
									<CFIF #xx_trigger# EQ "1">
										<CFOUTPUT>
										<OPTION VALUE="#a_company_ID[PPP]#">#a_company_name[PPP]# </OPTION>
										</CFOUTPUT>
									</CFIF>
									
								</CFLOOP> Roger Herrera Removed Should remove query assoicated with this
							</CFIF>  
		--->
		
      </SELECT>
      <p>
        <input type=image src="./images/button_add.gif" border=0>
    </td>
  </tr>
  </form>
  
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
