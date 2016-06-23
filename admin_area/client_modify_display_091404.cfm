
<CFPARAM NAME="intSales" DEFAULT="InHouse">
<CFPARAM NAME="Salestrigger" DEFAULT="">

<!---Read current User --->
<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM First_Admin
		WHERE ID = '#URL.UID#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE ID = #company_id#
</CFQUERY>

<CFSET intCustServ = #read_company.intCustServ#>
<CFSET intSales = #read_company.intSales#>

<CFQUERY datasource="#request.dsn#" NAME="read_company_cserv">
	SELECT   Companies.intCustServ, First_Admin.fname + First_Admin.lname AS Name
	FROM     Companies LEFT OUTER JOIN
           First_Admin ON Companies.intCustServ = First_Admin.ID
	WHERE    (Companies.ID = #read_company.ID#)
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_company_isales">
	SELECT     Companies.intSales, First_Admin.fname + First_Admin.lname AS Name
	FROM       Companies LEFT OUTER JOIN
             First_Admin ON Companies.intSales = First_Admin.ID
	WHERE     (Companies.ID = #read_company.ID#)
</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_cserv">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id = 5)
	<CFIF #len(intCustServ)# gte 1>
			   and ID <> #read_company.intCustServ#
	</CFIF>
	ORDER BY fname + ' ' + lname
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_isales">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id IN(15,25,26))
	<!---<CFIF #len(intSales)# gte 1>
			   and ID <> #read_company.intSales#
  </CFIF>--->
	ORDER BY fname + ' ' + lname
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_osales">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id = 24)
	<!---<CFIF #len(intSales)# gte 1>
	and ID <> #read_company.intSales#
	</CFIF>--->
	ORDER BY fname + ' ' + lname
</CFQUERY>

<CFIF #read_company.a_date_mod# GT "">
	<CFQUERY datasource="#request.dsn#" NAME="read_admin_modify">
		SELECT *
		FROM first_admin
		WHERE ID = #read_company.a_uid_mod#
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_admin">
		SELECT *
		FROM first_admin
		WHERE ID = #read_company.a_uid#
	</CFQUERY>
<CFELSE>
	<CFQUERY datasource="#request.dsn#" NAME="read_admin">
		SELECT *
		FROM first_admin
		WHERE ID = #read_company.a_uid#
	</CFQUERY>
</CFIF>

<CFQUERY datasource="#request.dsn#" NAME="read_current_sales">
				SELECT     Companies.ID, Companies.company, Companies.intSales,
					 	 Roles.Role_Name, Roles.Role_Id
				FROM       Roles RIGHT OUTER JOIN
           		 First_Admin ON Roles.Role_Id = First_Admin.role_id RIGHT OUTER JOIN
           		 Companies ON First_Admin.ID = Companies.intSales
				WHERE      Companies.ID = #company_id#

</CFQUERY>

<!---Who is the sales person--->
<CFIF #SalesTrigger# eq 1>
	<CFSET sales = "#Sales#">
	<CFSET intSales = "">
	<CFSET Name = "">
<CFELSE>

<CFSWITCH EXPRESSION="#read_current_sales.role_id#">
				<CFCASE VALUE = "">
					   <CFSET sales = "InHouse">
				</CFCASE>
				<CFCASE VALUE = IsNull>
					   <CFSET sales = "InHouse">
				</CFCASE>
				<CFCASE VALUE = 15>
					   <CFSET sales = "InHouse">
				</CFCASE>
				<CFCASE VALUE = 25>
					   <CFSET sales = "InHouse">
				</CFCASE>
			     <CFCASE VALUE = 26>
				    	   <CFSET sales = "InHouse">
				</CFCASE>
			     <CFCASE VALUE = 24>
					   <CFSET sales = "InHouse">
          </CFCASE>
				<CFDEFAULTCASE>
					   <CFSET sales = "OutsideSales">
				</CFDEFAULTCASE>
</CFSWITCH>

<CFSET intSales = "#read_company_isales.intSales#">
<CFSET Name = "#read_company_isales.Name#">

</CFIF>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<SCRIPT LANGUAGE="JavaScript">
<!-- Original:  Wayne Nolting (w.nolting@home.com) -->

<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! https://javascript.internet.com -->

<!-- Begin
function go(loc) {
window.location.href = loc;
}
//  End -->
</script>

<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>
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

								<td width=498 align=center valign=top bgcolor=white>
									<font size=2 color=blue face=arial><B>Modify Mortgage Client/Customer</B>
								</td>
							</tr>
							<tr>
								<td width=498 align=left valign=top bgcolor=white>
									<table width=497 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<CFIF #read_company.a_date_mod# GT "">
										<tr>
											<td width=245 align=center valign=top bgcolor=e4e4e4>
												<font size=2 color=blue face=arial>
												Original Entry:
											</td>
											<td width=245 align=center valign=top bgcolor=e4e4e4>
												<font size=2 color=blue face=arial>
												Last Modified:
											</td>
										</tr>
										<tr>
											<td width=245 align=center valign=top bgcolor=f1f1f1>
												<font size=2 color=blue face=arial>
												<B>#read_company.a_date# -- #read_company.a_time# <br><nobr>#read_admin.fname# #read_admin.lname#</NOBR></B>
											</td>
											<td width=245 align=center valign=top bgcolor=f1f1f1>
												<font size=2 color=blue face=arial>
												<B>#read_company.a_date_mod# -- #read_company.a_time_mod# <br><nobr>#read_admin_modify.fname#  #read_admin_modify.lname#</B></nobr>
											</td>
										</tr>
<CFELSE>
										<tr>
											<td width=245 align=center valign=top bgcolor=e4e4e4>
												<font size=2 color=blue face=arial>
												Original Entry:
											</td>
											<td width=245 align=center valign=top bgcolor=e4e4e4>
												<font size=2 color=blue face=arial>
												Last Modified:
											</td>
										</tr>
										<tr>
											<td width=245 align=center valign=top bgcolor=f1f1f1>
												<font size=2 color=blue face=arial>
												<B>#read_company.a_date# -- #read_company.a_time# -- #read_admin.fname# #read_admin.lname#</B>
											</td>
											<td width=245 align=center valign=top bgcolor=f1f1f1>
												<font size=2 color=blue face=arial>
												<B>Not Modified</B>
											</td>
										</tr>
</CFIF>
</CFOUTPUT>
									</table>
								</td>
							</tr>
							<tr>
								<td width=499 align=center valign=top bgcolor=white>
									<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>
										<tr>
											<td width=130 align=left valign=top bgcolor=d3d3d3>
												<FONT SIZE=1 color=black face=arial>
												Make any changes to the clients information on the form.
												<p>
												To adjust the charges associated with line items on the HUD form for this client, click on the link below.
												<p>
<CFOUTPUT>
												<a href="./client_line_costs_select.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#read_company.ID#"><img src="./images/button_line_costs.gif" border=0></a>
												<p>
												<a href="./client_lenders_select.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#read_company.ID#"><img src="./images/button_lenders.gif" border=0></a>
												<a href="./client_agency_select.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#read_company.ID#"><img src="./images/button_ft_agencies.gif" border=0></a>
</CFOUTPUT>
											</td>
											<td width=368 align=left valign=top bgcolor=e1e1e1>
												<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
													<tr>
													<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Client Origination
														</td>

														<td width=237 align=left valign=top bgcolor=e6e6e6>
													         <CFIF #read_user.role_id# eq 24>
																Outside Sales
															<CFELSE>
															 <input type=radio name="Sales" value="InHouse"
																 <CFIF #Sales# eq "InHouse">
																	 Checked
																 </CFIF>
																					onClick="go('https://<CFOUTPUT>#cgi.server_name#</CFOUTPUT>/admin_area/client_modify_display.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<CFOUTPUT>#URL.al#</CFOUTPUT>&company_id=<CFOUTPUT>#read_company.id#</CFOUTPUT>&company=<CFOUTPUT>#read_company.company#</CFOUTPUT>&Sales=InHouse&SalesTrigger=1');"
																>In House
														  	<Input type="radio" Name="Sales" Value="OutsideSales"
																  <CFIF #Sales# eq "OutsideSales">
																	Checked
																</CFIF>
												onClick="go('https://<CFOUTPUT>#cgi.server_name#</CFOUTPUT>/admin_area/client_modify_display.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<CFOUTPUT>#URL.al#</CFOUTPUT>&company_id=<CFOUTPUT>#read_company.id#</CFOUTPUT>&company=<CFOUTPUT>#read_company.company#</CFOUTPUT>&Sales=OutsideSales&SalesTrigger=1');"
																>Outside Sales
															</CFIF>
							 						</TD>
												</tr>
<!---<CFFORM METHOD=POST ACTION="./Test_Page.cfm">--->
<CFFORM METHOD=POST ACTION="./client_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#">
<CFOUTPUT>
<input type="hidden" name="intSales" value="#intSales#">
																										<tr>
														<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
															<img src="./images/clear.gif" height=10 width=85>
														</td>
													</tr>
													<tr>
															<td width=130 align=right valign=top bgcolor=e6e6e6>
																	<font size=2 color=black face=arial>
																	Sales Person
															</td>
															<td width=237 align=left valign=top bgcolor=e6e6e6>
																<CFIF #read_user.role_id# eq 24>
																	#read_user.fname# #read_user.lname#
																<CFELSE>
															<SELECT NAME="intSales"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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

															<option value="#intSales#">#Name#</option>
															<!---Read isales or read osales --->
<!--- Populate the array row by row --->

<CFIF #sales# eq "InHouse">
     <CFSET rowcount1 = #read_isales.RecordCount#>										     <!--- Declare the array --->
     <CFSET myarray1=ArrayNew(2)>

     <CFLOOP QUERY="read_isales">
          <CFSET myarray1[CurrentRow][1]=read_isales.id[CurrentRow]>
	        <CFSET myarray1[CurrentRow][2]=read_isales.NAME[CurrentRow]>
     </CFLoop>
<CFELSE>
    <CFSET rowcount1 = #read_osales.RecordCount#>										    <!--- Declare the array --->
    <CFSET myarray1=ArrayNew(2)>

     <CFLOOP QUERY="read_osales">
          <CFSET myarray1[CurrentRow][1]=read_osales.id[CurrentRow]>
	  <CFSET myarray1[CurrentRow][2]=read_osales.NAME[CurrentRow]>
     </CFLoop>
</CFIF>

<CFLOOP INDEX="Counter" FROM=1 TO="#rowcount1#">

<option value="#MyArray1[Counter][1]#">#MyArray1[Counter][2]#</option>

															</CFLOOP>

															</SELECT>
															</CFIF>
														</td>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Company Name
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<input type=text name="company" VALUE="#read_company.company#" size=25 maxlength=200
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
															<font size=2 color=red face=arial>
															<B>Username - </B>
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<input type=text name="a_user" VALUE="#read_company.a_user#" size=25 maxlength=200
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
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=red face=arial>
															<B>Password - </B>
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<input type=text name="a_pass" VALUE="#read_company.a_pass#" size=25 maxlength=200
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
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Address -
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<input type=text name="addr1" VALUE="#read_company.addr1#" size=40 maxlength=120
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
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Address -
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<input type=text name="addr2" VALUE="#read_company.addr2#" size=40 maxlength=120
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
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Note -
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<input type=text name="a_note_1" VALUE="#read_company.a_note_1#" size=40 maxlength=120
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
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															City -
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<input type=text name="city" VALUE="#read_company.city#" size=30 maxlength=50
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
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															State -
														</td>
</cfoutput>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<SELECT NAME="state"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
														<!--- Declare the array --->
<CFSET myarray=ArrayNew(2)>

<!--- Populate the array row by row --->
<CFLOOP QUERY="read_cserv">
	<CFSET myarray[CurrentRow][1]=read_cserv.id[CurrentRow]>
	<CFSET myarray[CurrentRow][2]=read_cserv.NAME[CurrentRow]>
</CFLoop>





<CFOUTPUT>
															<option value="#read_company.state#">#read_company.state#</option>
</CFOUTPUT>
															<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
<CFOUTPUT>
															<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>

</CFOUTPUT>
															</CFLOOP>

															</SELECT>
														</td>
<cfoutput>
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Zip Code -
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<input type=text name="zip_code" VALUE="#read_company.zip_code#" size=20 maxlength=20
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
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Phone -
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<input type=text name="phone" VALUE="#read_company.phone#" size=25 maxlength=22
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
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Fax -
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<input type=text name="fax" VALUE="#read_company.fax#" size=25 maxlength=22
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
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Email -
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<input type=text name="email" VALUE="#read_company.email#" size=35 maxlength=160
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
													</tr>
													<tr>
														<td width=200 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Status
														</td>
														<td width=298 align=left valign=top bgcolor=e6e6e6>
															<font size=2 color=blue face=arial>
<CFIF #read_company.a_status# EQ "0">
															<NOBR><input type=radio name="a_status" value="0" checked> -<font size=2 color=red face=arial><B>In-Active</B></NOBR></FONT><br>
															<NOBR><input type=radio name="a_status" value="1"> -<font size=2 color=green face=arial><B>Active</B></NOBR></FONT>
<CFELSE>
															<NOBR><input type=radio name="a_status" value="0"> -<font size=2 color=red face=arial><B>In-Active</B></NOBR></FONT><br>
															<NOBR><input type=radio name="a_status" value="1" checked> -<font size=2 color=green face=arial><B>Active</B></NOBR></FONT>
</CFIF>
														</td>
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Customer Service
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<SELECT NAME="intCustServ"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
															<CFSET rowcount = #read_cserv.recordcount#>
															<option value="#read_company_cserv.intCustServ#">#read_company_cserv.Name#</option>

															<CFLOOP INDEX="Counter" FROM=1 TO="#rowcount#">

															<option value="#MyArray[Counter][1]#">#MyArray[Counter][2]#</option>

															</CFLOOP>
															<option value=""></option>
															</SELECT>
														</td>
														</td>
													</tr>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Required Services</font>
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6 >
															<font size=1 color=blue face=arial>
															<INPUT TYPE="checkbox" NAME="Report" <!---Value = "#read_company.blnReport#"--->
																<CFIF #read_company.blnReport# eq 1>
																	Checked
																</CFIF>>&nbsp;&nbsp;
																Title/Property Report<BR>
															<INPUT TYPE="checkbox" NAME="Commit" <!---Value = "#read_company.blnCommit#"--->
																<CFIF #read_company.blnCommit# eq 1>
																	Checked
																</CFIF>>&nbsp;&nbsp;
																Insurance Commitment Policy<BR>
															<INPUT TYPE="checkbox" NAME="FullService" <!---Value = "#read_company.blnFullServ#"--->
																<CFIF #read_company.blnFullServ# eq 1>
																	Checked
																</CFIF>>&nbsp;&nbsp;
																Full Closing Services<BR>
															<INPUT TYPE="checkbox" NAME="clearc" <!---Value = "#read_company.blnFullServ#"--->
																<CFIF #read_company.blnClearc# eq 1>
																	Checked
																</CFIF>>&nbsp;&nbsp;
																Clearc<BR>
															<INPUT TYPE="checkbox" NAME="payoff" <!---Value = "#read_company.blnPayoff#"--->
																<CFIF #read_company.blnPayoff# eq 1>
																	Checked
																</CFIF>>&nbsp;&nbsp;
																Payoff<BR>
															<INPUT TYPE="checkbox" NAME="disbursements" <!---VALUE = "#read_company.blnDisbursements#"--->
																<CFIF #read_company.blnDisbursements# eq 1>
																	Checked
																</CFIF>>&nbsp;&nbsp;
																Disbursements<BR>
															<INPUT TYPE="checkbox" NAME="recording" <!---VALUE="#read_company.blnRecording#"--->
																<CFIF #read_company.blnRecording# eq 1>
																	Checked
																</CFIF>>&nbsp;&nbsp;
																Recording<BR>
															<INPUT TYPE="checkbox" NAME="appraisal" <!---VALUE="#read_company.blnAppraisal#"--->
																<CFIF #read_company.blnAppraisal# eq 1>
																	Checked
																</CFIF>>&nbsp;&nbsp;
																Appraisal<BR>
															<INPUT TYPE="checkbox" NAME="Signing" <!---VALUE = "#read_company.blnSigning#" --->
																<CFIF #read_company.blnAppraisal# eq 1>
																	Checked
																</CFIF>>&nbsp;&nbsp;
																Signing Services Only<BR>
														</td>
													<tr>
														<td width=130 align=right valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Fees</font>
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>
															<font size=1 color=blue face=arial>
															Title Property Report<br>
															&nbsp;&nbsp;&nbsp;Vesting + Legal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstVesting"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="10"
																>
																<CFIF #read_company.FeeVestingLegal# eq "null">
																	<option value=null selected></option>
																<CFELSE>
																	<CFSET numberLength =  #Len(read_company.FeeVestingLegal)# - 5 >
																	<option value=#read_company.FeeVestingLegal# selected>#Mid(read_company.FeeVestingLegal,1,numberLength)#&nbsp;</option>
																</CFIF>
																<option value=25>25&nbsp;</option>
																<option value=30>30&nbsp;</option>
																<option value=35>35&nbsp;</option>
																<option value=40>40&nbsp;</option>
																<option value=45>45&nbsp;</option>
																<option value=50>50&nbsp;</option>
																<option value=55>55&nbsp;</option>
																<option value=60>60&nbsp;</option>
																<option value=65>65&nbsp;</option>
															</select>
																<br>
															&nbsp;&nbsp;&nbsp;Current Owner&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstOwner"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="22"
																>
																<CFIF #read_company.FeeCurrentOwner# eq "null">
																	<option value=null selected></option>
																<CFELSE>
																	<CFSET numberLength =  #Len(read_company.FeeCurrentOwner)# - 5 >
																	<option value=#read_company.FeeCurrentOwner# selected>#Mid(read_company.FeeCurrentOwner,1,numberLength)#</option>
																</CFIF>
																<option value=95>95</option>
																<option value=100>100</option>
																<option value=105>105</option>
																<option value=110>110</option>
																<option value=115>115</option>
																<option value=120>120</option>
																<option value=125>125</option>
																<option value=130>130</option>
																<option value=135>135</option>
																<option value=140>140</option>
																<option value=145>145</option>
																<option value=150>150</option>
																<option value=155>155</option>
																<option value=160>160</option>
																<option value=165>165</option>
																<option value=170>170</option>
																<option value=175>175</option>
																<option value=180>180</option>
																<option value=185>185</option>
																<option value=190>190</option>
																<option value=195>195</option>
															</SELECT>
															<br>
															&nbsp;&nbsp;&nbsp;Full Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstFullSearch"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="57"
																>
																<CFIF #read_company.FeeFullSearch# eq "null">
																	<option value=null selected></option>
																<CFELSE>
																	<CFSET numberLength =  #Len(read_company.FeeCurrentOwner)# - 5 >
																	<option value=#read_company.FeeFullSearch# selected>#Mid(read_company.FeeFullSearch,1,numberlength)#</option>
																</CFIF>
																<option value=225>225</option>
																<option value=230>230</option>
																<option value=235>235</option>
																<option value=240>240</option>
																<option value=245>245</option>
																<option value=250>250</option>
																<option value=255>255</option>
																<option value=260>260</option>
																<option value=265>265</option>
																<option value=270>270</option>
																<option value=275>275</option>
																<option value=280>280</option>
																<option value=285>285</option>
																<option value=290>290</option>
																<option value=295>295</option>
																<option value=300>300</option>
																<option value=305>305</option>
																<option value=310>310</option>
																<option value=315>315</option>
																<option value=320>320</option>
																<option value=325>325</option>
																<option value=330>330</option>
																<option value=335>335</option>
																<option value=340>340</option>
																<option value=345>345</option>
																<option value=350>350</option>
																<option value=355>355</option>
																<option value=360>360</option>
																<option value=365>365</option>
																<option value=370>370</option>
																<option value=375>375</option>
																<option value=380>380</option>
																<option value=385>385</option>
																<option value=390>390</option>
																<option value=395>395</option>
																<option value=400>400</option>
																<option value=405>405</option>
																<option value=410>410</option>
																<option value=415>415</option>
																<option value=420>420</option>
																<option value=425>425</option>
																<option value=430>430</option>
																<option value=435>435</option>
																<option value=440>440</option>
																<option value=445>445</option>
																<option value=450>450</option>
																<option value=455>455</option>
																<option value=460>460</option>
																<option value=465>465</option>
																<option value=470>470</option>
																<option value=475>475</option>
																<option value=480>480</option>
																<option value=485>485</option>
																<option value=490>490</option>
																<option value=495>495</option>
																<option value=500>500</option>
															</SELECT>
															<br>
															<br>
															Commit/Policy Only $295 + <br>
															&nbsp;&nbsp;&nbsp;Policy & Binder&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstCommitOnly"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="57"
																>
																<CFIF #read_company.FeePolicyOnly# eq "null">
																	<option value=null selected></option>
																<CFELSE>
																	<CFSET numberLength =  #Len(read_company.FeeCurrentOwner)# - 5 >
																	<option value=#read_company.FeePolicyOnly# selected>#Mid(read_company.FeePolicyOnly,1,numberlength)#</option>
																</CFIF>
																<option value=25>25</option>
																<option value=30>30</option>
																<option value=35>35</option>
															</SELECT>
																<br>
															National Signing Services&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstSigning"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="57"
																>
																<CFIF #read_company.FeeSigning# eq "null">
																	<option value=null selected></option>
																<CFELSE>
																	<CFSET numberLength =  #Len(read_company.FeeCurrentOwner)# - 5 >
																	<option value=#read_company.FeeSigning# selected>#Mid(read_company.FeeSigning,1,numberlength)#</option>
																</CFIF>
																<option value=225>225</option>
																<option value=230>230</option>
																<option value=235>235</option>
																<option value=240>240</option>
																<option value=245>245</option>
																<option value=250>255</option>
																<option value=255>255</option>
																<option value=260>260</option>
																<option value=265>265</option>
																<option value=270>270</option>
																<option value=275>275</option>
																<option value=280>280</option>
																<option value=285>285</option>
																<option value=290>290</option>
																<option value=295>295</option>
																<option value=300>300</option>
																<option value=305>305</option>
																<option value=310>310</option>
																<option value=315>315</option>
																<option value=320>320</option>
																<option value=325>325</option>
																<option value=330>330</option>
																<option value=335>335</option>
																<option value=340>340</option>
																<option value=345>345</option>
																<option value=350>350</option>
																<option value=355>355</option>
																<option value=360>360</option>
																<option value=365>365</option>
																<option value=370>370</option>
																<option value=375>375</option>
															</SELECT>
															<br>
															Recording Services&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$60.00<br>
															Appraisal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<SELECT NAME="lstAppraisal"
																size="1"
																style="font-size: 9;
																font-family: verdana;
																font-style: normal;
																color: blue;
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
																cols="57"
																>
																<CFIF #read_company.FeeAppraisal# eq "null">
																	<option value=null selected></option>
																<CFELSE>
																	<CFSET numberLength =  #Len(read_company.FeeCurrentOwner)# - 5 >
																	<option value=#read_company.FeeAppraisal# selected>#Mid(read_company.FeeAppraisal,1,numberlength)#</option>
																</CFIF>
																<option value=325>325</option>
																<option value=330>330</option>
																<option value=335>335</option>
																<option value=340>340</option>
																<option value=345>245</option>
																<option value=350>350</option>
																<option value=355>355</option>
																<option value=360>360</option>
																<option value=365>365</option>
																<option value=370>370</option>
																<option value=375>375</option>
																<option value=380>380</option>
																<option value=385>385</option>
																<option value=390>390</option>
																<option value=395>395</option>
																<option value=400>400</option>
																<option value=405>405</option>
																<option value=410>410</option>
																<option value=415>415</option>
																<option value=420>420</option>
																<option value=425>425</option>
																<option value=430>430</option>
																<option value=435>435</option>
																<option value=440>440</option>
																<option value=445>445</option>
																<option value=450>450</option>
																<option value=455>455</option>
																<option value=460>460</option>
																<option value=465>465</option>
																<option value=470>470</option>
																<option value=475>475</option>
															</SELECT>
															</font>
														</td>
													</tr>
														<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
															<font size=2 color=black face=arial>
															Comments
														</td>
													</tr>
													<tr>
														<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
															<TEXTAREA name="comment"  COLS=50 ROWS=15
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
																clear: none;">#read_company.comment#</TEXTAREA>
														</td>
													</tr>
														<INPUT TYPE=HIDDEN NAME="company_id" VALUE="#company_id#">
													<tr>
														<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
															<NOBR><A HREF="client_modify.cfm?uid=#URL.uid#&al=#URL.al#"><IMG SRC="./images/button_back.gif"  BORDER=0></A><img src="./images/clear.gif" height=10 width=30><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>

<input type="hidden" name="Report">
<input type="hidden" name="Commit">
<input type="hidden" name="FullService">
<input type="hidden" name="Clearc">
<input type="hidden" name="payoff" >
<input type="hidden" name="disbursements" >
<input type="hidden" name="recording" >
<input type="hidden" name="appraisal">
<input type="hidden" name="signing">

</CFOUTPUT>
</CFFORM>
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

