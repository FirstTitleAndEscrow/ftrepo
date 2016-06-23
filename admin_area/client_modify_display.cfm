<cfif IsDefined("url.modify_client_id")>
<cfset company_id = url.modify_client_id>
</cfif>
<CFPARAM NAME="Sales" DEFAULT="InHouse">
<CFPARAM NAME="Salestrigger" DEFAULT="">
<CFPARAM NAME="companies_switch" DEFAULT="0">

<CFQUERY datasource="#request.dsn#" NAME="get_all_custom_rate_tables">
select NAME from SYSOBJECTS
where TYPE = 'U'
and (NAME LIKE 'Custom_Rate_Table_%')
order by NAME
</CFQUERY>

<!---Get all Teams--->
<CFQUERY datasource="#request.dsn#" NAME="get_teams">
		SELECT *
		FROM Teams
</CFQUERY>
<!---Read current User Gary Hays--->
<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM First_Admin
		WHERE ID = '#URL.UID#'
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_all_companies">
		SELECT *
		FROM companies
		where company <> 'NULL'
		and company <> ''
		<cfif read_user.role_id eq 24>
		and intSales  = #read_user.ID#
		</cfif>
		and a_status = 1
		order by company
	</CFQUERY>

<!--- curr company info --->
<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE ID = #company_id#
</CFQUERY>

<CFSET intCustServ = #read_company.intCustServ#>
<CFSET intSales = #read_company.intSales#>
<!--- id and name of csr 200, JasonGoldman--->
<CFQUERY datasource="#request.dsn#" NAME="read_company_cserv">
	SELECT   Companies.intCustServ, First_Admin.fname + ' ' + First_Admin.lname AS Name
	FROM     Companies LEFT OUTER JOIN
           First_Admin ON Companies.intCustServ = First_Admin.ID
	WHERE    (Companies.ID = #read_company.ID#)
</CFQUERY>

<!--- id and name of isales person  56, PamGibbons--->
<CFQUERY datasource="#request.dsn#" NAME="read_company_isales">
	SELECT     Companies.intSales, First_Admin.fname + ' '+ First_Admin.lname AS Name
	FROM       Companies LEFT OUTER JOIN
             First_Admin ON Companies.intSales = First_Admin.ID
	WHERE     (Companies.ID = #read_company.ID#)
</CFQUERY>
<!--- read csr staff --->
<CFQUERY datasource="#request.dsn#" NAME="read_cserv">
	SELECT   ID, fname + ' ' + lname AS Name
	FROM     First_Admin
	WHERE    status = 1
	and role_id = 5
</CFQUERY>
<!--- read isales staff --->
<CFQUERY datasource="#request.dsn#" NAME="read_isales">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id IN(15,25,26))
	and status = 1
	ORDER BY fname + ' ' + lname
</CFQUERY>
<!--- read osales staff --->
<CFQUERY datasource="#request.dsn#" NAME="read_osales">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id = 24 or role_id = 34)
	<!---<CFIF #len(intSales)# gte 1>
	and ID <> #read_company.intSales#
	</CFIF>--->
	and status = 1
	ORDER BY fname + ' ' + lname
</CFQUERY>
<!--- who modified --->
<CFIF #read_company.a_date_mod# GT "">
	<CFQUERY datasource="#request.dsn#" NAME="read_admin_modify">
		SELECT *
		FROM first_admin
		WHERE ID = #read_company.a_uid_mod#
	</CFQUERY>
<!--- who created --->
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
<!--- read about current sales person 100, test abc, 56, vice-president, role_id=26 --->
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
<!--- inhouse or outsidesales --->
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
				<CFCASE VALUE = 20>
					   <CFSET sales = "InHouse">
				</CFCASE>
			     <CFCASE VALUE = 25>
				    	   <CFSET sales = "InHouse">
				</CFCASE>
				<CFCASE VALUE = 26>
				    	   <CFSET sales = "InHouse">
				</CFCASE>
				<CFCASE VALUE = 31>
				    	   <CFSET sales = "InHouse">
				</CFCASE>
				<CFCASE VALUE = 32>
				    	   <CFSET sales = "InHouse">
				</CFCASE>

			     <CFCASE VALUE = 24>
					   <CFSET sales = "OutsideSales">
          		</CFCASE>
				<CFDEFAULTCASE>
					   <CFSET sales = "OutsideSales"><!--- no modify!!! --->
				</CFDEFAULTCASE>
	</CFSWITCH>


	<CFSET intSales = "#read_company_isales.intSales#">
	<CFSET Name = "#read_company_isales.Name#">

</CFIF>

	<!--- <cfoutput>#read_company_isales.intSales#</cfoutput>
	<cfoutput>#read_company_isales.Name#</cfoutput>		 --->
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
		<td width=600 align=center valign=top>
<table width=599 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=599 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>
<table width=598 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<CFOUTPUT>
		<td width=598 align=center valign=top bgcolor=white>
			<font size=2 color=blue face=arial><B>Modify Mortgage Client/Customer</B>
		</td>
	</tr>
	<tr>
		<td width=598 align=left valign=top bgcolor=white>
<table width=597 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
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
		<td width=599 align=center valign=top bgcolor=white>
<table width=598 cellpadding=0 cellspacing=0 border=0 bgcolor=white>
	<tr>
		<td width=130 align=left valign=top bgcolor=d3d3d3>
			<FONT SIZE=1 color=black face=arial>
			Make any changes to the clients information on the form.
			<p>
			To adjust the charges associated with line items on the HUD form for this client, click on the link below.
			<p>
<CFOUTPUT>
			

			<!--- <a href="./client_line_costs_select_2010.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#read_company.ID#"><img src="./images/button_line_costs_2010.gif" border=0></a>
			<p> --->

			<a href="./client_lenders_select.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#read_company.ID#"><img src="./images/button_lenders.gif" border=0></a>
			<a href="./client_agency_select.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#read_company.ID#"><img src="./images/button_ft_agencies.gif" border=0></a>
</CFOUTPUT><br>
<br>

<cfif #read_user.ID# eq 472 or #read_user.role_id# eq "25"
	or #read_user.role_id# eq "26" or (#read_user.role_id# eq "24" and read_company.intSales eq read_user.ID)>
<cfoutput><a href="./client_line_costs_select_2010.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#read_company.ID#"><img src="./images/button_line_costs.gif" border=0></a></cfoutput>
			<p>
			
<cfoutput><a href="client_custom_fees.cfm?modify_client_id=#read_company.ID#&uid=#URL.uid#&al=#URL.al#"><font size=2 face=arial>Custom Fees</font></a></cfoutput><br><br>


<cfoutput><a href="client_bulk_rates.cfm?modify_client_id=#read_company.ID#&uid=#URL.uid#&al=#URL.al#"><font size=2 face=arial>Stewart Bulk Rate Setup</font></a></cfoutput>

<br><br>


<cfoutput><a href="client_bulk_rates_Natic.cfm?modify_client_id=#read_company.ID#&uid=#URL.uid#&al=#URL.al#"><font size=2 face=arial>NATIC Bulk Rate Setup</font></a></cfoutput>
<br>
<br>
</cfif>

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
				</CFIF><!--- #260  client_modify_display_dev.cfm--->
				onClick="go('../admin_area/client_modify_display.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<CFOUTPUT>#URL.al#</CFOUTPUT>&company_id=<CFOUTPUT>#read_company.id#</CFOUTPUT>&company=<CFOUTPUT>#read_company.company#</CFOUTPUT>&Sales=InHouse&SalesTrigger=1');"
				>In House
				<Input type="radio" Name="Sales" Value="OutsideSales"
				<CFIF #Sales# eq "OutsideSales">
					Checked
				</CFIF><!--- #266  client_modify_display_dev.cfm--->
				onClick="go('../admin_area/client_modify_display.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<CFOUTPUT>#URL.al#</CFOUTPUT>&company_id=<CFOUTPUT>#read_company.id#</CFOUTPUT>&company=<CFOUTPUT>#read_company.company#</CFOUTPUT>&Sales=OutsideSales&SalesTrigger=1');"
				>Outside Sales
			</CFIF>
		</TD>
	</tr><!--- client_modify_submit_dev.cfm --->
<CFFORM METHOD=POST ACTION="./client_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#">
<CFOUTPUT>
<!--- <input type="hidden" name="intSales" value="#intSales#"> --->
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
					<!--- <option value="#intSales#">#Name#</option> --->
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
				<option value="" selected> </option>
				<CFLOOP INDEX="Counter" FROM=1 TO="#rowcount1#">
					<option value="#MyArray1[Counter][1]#" <cfif (read_company.intSales eq #MyArray1[Counter][1]#)>selected</cfif>>#MyArray1[Counter][2]#</option>
				</CFLOOP>
				</SELECT>

		</td>
		</tr>
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
				<input type="password" name="a_pass" VALUE="#read_company.a_pass#" size=25 maxlength=200
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
			Contact First Name -</font>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="contact_fname" VALUE="#read_company.contact_fname#" size=25 maxlength=200
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
			Contact Last Name - </font>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="contact_lname" VALUE="#read_company.contact_lname#" size=25 maxlength=200
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Proposed Monthly Transactions -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<select name="proposed_monthly_transactions" id="proposed_monthly_transactions" style="font-size: 9;
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
					float: none;" >
<option value="10" <cfif read_company.proposed_monthly_transactions eq "10">selected</cfif>>10</option>
<option value="20" <cfif read_company.proposed_monthly_transactions eq "20">selected</cfif>>20</option>
<option value="30" <cfif read_company.proposed_monthly_transactions eq "30">selected</cfif>>30</option>
<option value="40" <cfif read_company.proposed_monthly_transactions eq "40">selected</cfif>>40</option>
<option value="50" <cfif read_company.proposed_monthly_transactions eq "50">selected</cfif>>50</option>
<option value="100" <cfif read_company.proposed_monthly_transactions eq "100">selected</cfif>>100</option>
<option value="200" <cfif read_company.proposed_monthly_transactions eq "200">selected</cfif>>200</option>
								</select>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Enhanced T.I. Coverage</font>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6 >
		<font size=1 color=blue face=arial><input type="radio" name="enhanced_coverage" value="1" <CFIF #read_company.enhanced_coverage# eq 1>checked</CFIF>>&nbsp;Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="enhanced_coverage" value="0" <CFIF #read_company.enhanced_coverage# eq 0>checked</CFIF>>&nbsp;No
			</font><BR>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Required Services</font>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6 >
			<font size=1 color=blue face=arial>
			<INPUT TYPE="checkbox" NAME="Commit"
				<CFIF #read_company.blnCommit# eq 1>
					Checked
				</CFIF>
				>&nbsp;&nbsp;
				Insurance Commitment Policy<BR>
			<INPUT TYPE="checkbox" NAME="FullService"
				<CFIF #read_company.blnFullServ# eq 1>
					Checked
				</CFIF>
				>&nbsp;&nbsp;
				Full Closing Services<BR>
			<INPUT TYPE="checkbox" NAME="clearc"
				<CFIF #read_company.blnClearc# eq 1>
					Checked
				</CFIF>
				>&nbsp;&nbsp;
				Clearc<BR>
			<INPUT TYPE="checkbox" NAME="payoff"
				<CFIF #read_company.blnPayoff# eq 1>
					Checked
				</CFIF>
				>&nbsp;&nbsp;
				Payoff<BR>
			<INPUT TYPE="checkbox" NAME="disbursements"
				<CFIF #read_company.blnDisbursements# eq 1>
					Checked
				</CFIF>>&nbsp;&nbsp;
				Disbursements<BR>
			<INPUT TYPE="checkbox" NAME="recording"
				<CFIF #read_company.blnRecording# eq 1>
					Checked
				</CFIF>>&nbsp;&nbsp;
				Recording<BR>
            <INPUT TYPE="checkbox" NAME="appraisal"
				<CFIF #read_company.blnAppraisal# eq 1>
					Checked
				</CFIF>>&nbsp;&nbsp;
				Appraisal<BR>
            <INPUT TYPE="checkbox" NAME="signing"
				<CFIF #read_company.blnSigning# eq 1>
					Checked
				</CFIF>>&nbsp;&nbsp;
				Signing<BR>
			<INPUT TYPE="checkbox" NAME="shipping"
				<CFIF #read_company.blnShipping# eq 1>
					Checked
				</CFIF>>&nbsp;&nbsp;
				Special Shipping Requirements (see<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comments)<BR>
		</td>
	</tr>
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
			<CFIF #Len(read_company.FeeVestingLegal)# eq 0 >
				<option value=null selected></option>
			<CFELSE>
				<CFSET numberLength =  #Len(read_company.FeeVestingLegal)# - 5 >
				<option value=#read_company.FeeVestingLegal# selected>#Mid(read_company.FeeVestingLegal,1,numberLength)#&nbsp;</option>
			</CFIF>
                <option value="null">&nbsp;&nbsp;&nbsp;</option>
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
				<CFIF #LEN(read_company.FeeCurrentOwner)# eq 0 >
					<option value=null selected></option>
				<CFELSE>
					<CFSET numberLength =  #Len(read_company.FeeCurrentOwner)# - 5 >
					<option value=#read_company.FeeCurrentOwner# selected>#Mid(read_company.FeeCurrentOwner,1,numberLength)#</option>
				</CFIF>
                <option value="null">&nbsp;&nbsp;&nbsp;</option>
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
				<CFIF #Len(read_company.FeeFullSearch)# eq 0 >
					<option value=null selected></option>
				<CFELSE>
					<CFSET numberLength =  #Len(read_company.FeeFullSearch)# - 5 >
						<option value=#read_company.FeeFullSearch# selected>#Mid(read_company.FeeFullSearch,1,numberlength)#</option>
				</CFIF>
                <option value="null">&nbsp;&nbsp;&nbsp;</option>
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
				<CFIF #Len(read_company.FeePolicyOnly)# eq 0 >
					<option value=null selected></option>
				<CFELSE>
					<CFSET numberLength =  #Len(read_company.FeePolicyOnly)# - 6 >
					<option value=#read_company.FeePolicyOnly# selected><!---#Mid(read_company.FeePolicyOnly,1,numberlength)#--->#dollarformat(read_company.FeePolicyOnly)#</option>
				</CFIF>
				<option value="null">&nbsp;&nbsp;&nbsp;</option>
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
				<CFIF #Len(read_company.FeeSigning)# eq 0 >
					<option value=null selected></option>
				<CFELSE>
					<CFSET numberLength =  #Len(read_company.FeeSigning)# - 5 >
					<option value=#read_company.FeeSigning# selected>#Mid(read_company.FeeSigning,1,numberlength)#</option>
				</CFIF>
                <option value="null">&nbsp;&nbsp;&nbsp;</option>
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
				<CFIF #Len(read_company.FeeAppraisal)# eq 0 >
					<option value=null selected></option>
				<CFELSE>
					<CFSET numberLength =  #Len(read_company.FeeAppraisal)# - 5 >
					<option value=#read_company.FeeAppraisal# selected>#Mid(read_company.FeeAppraisal,1,numberlength)#</option>
				</CFIF>
                <option value="null">&nbsp;&nbsp;&nbsp;</option>
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

<hr>
			<table>
			<tr>
			<td>&nbsp;</td><td align="right"><font size=1 color=blue face=arial>Reg.</td><td align="right"><font size=1 color=blue face=arial>MD</td><td align="right"><font size=1 color=blue face=arial>DC</td><td align="right"><font size=1 color=blue face=arial>VA</td>
			</tr>
<tr>
			<td><font size=1 color=blue face=arial>Bankruptcy</td>
			<td align="right"><input type=text name="bankruptcy_reg" VALUE="#read_company.bankruptcy_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="bankruptcy_MD" VALUE="#read_company.bankruptcy_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="bankruptcy_DC" VALUE="#read_company.bankruptcy_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="bankruptcy_VA" VALUE="#read_company.bankruptcy_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>
<tr>
			<td><font size=1 color=blue face=arial>FHA</td>
			<td align="right"><input type=text name="FHA_reg" VALUE="#read_company.FHA_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="FHA_MD" VALUE="#read_company.FHA_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="FHA_DC" VALUE="#read_company.FHA_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="FHA_VA" VALUE="#read_company.FHA_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>
<tr>
			<td><font size=1 color=blue face=arial>VA</td>
			<td align="right"><input type=text name="VA_reg" VALUE="#read_company.VA_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="VA_MD" VALUE="#read_company.VA_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="VA_DC" VALUE="#read_company.VA_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="VA_VA" VALUE="#read_company.VA_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>

	<tr>
			<td><font size=1 color=blue face=arial>CONV</td>
			<td align="right"><input type=text name="CONV_reg" VALUE="#read_company.CONV_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="CONV_MD" VALUE="#read_company.CONV_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="CONV_DC" VALUE="#read_company.CONV_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="CONV_VA" VALUE="#read_company.CONV_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>
	<tr>
			<td><font size=1 color=blue face=arial>FHLMC</td>
			<td align="right"><input type=text name="FHLMC_reg" VALUE="#read_company.FHLMC_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="FHLMC_MD" VALUE="#read_company.FHLMC_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="FHLMC_DC" VALUE="#read_company.FHLMC_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="FHLMC_VA" VALUE="#read_company.FHLMC_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>

	<tr>
			<td><font size=1 color=blue face=arial>FNMA</td>
			<td align="right"><input type=text name="FNMA_reg" VALUE="#read_company.FNMA_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="FNMA_MD" VALUE="#read_company.FNMA_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="FNMA_DC" VALUE="#read_company.FNMA_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="FNMA_VA" VALUE="#read_company.FNMA_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>

		<tr>
			<td><font size=1 color=blue face=arial>Updates</td>
			<td align="right"><input type=text name="Updates_reg" VALUE="#read_company.Updates_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="Updates_MD" VALUE="#read_company.Updates_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="Updates_DC" VALUE="#read_company.Updates_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="Updates_VA" VALUE="#read_company.Updates_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>

<tr>
			<td><font size=1 color=blue face=arial>FHA_HUD</td>
			<td align="right"><input type=text name="FHA_HUD_reg" VALUE="#read_company.FHA_HUD_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="FHA_HUD_MD" VALUE="#read_company.FHA_HUD_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="FHA_HUD_DC" VALUE="#read_company.FHA_HUD_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="FHA_HUD_VA" VALUE="#read_company.FHA_HUD_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>

<tr>
			<td><font size=1 color=blue face=arial>Vet_Aff</td>
			<td align="right"><input type=text name="Vet_Aff_reg" VALUE="#read_company.Vet_Aff_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="Vet_Aff_MD" VALUE="#read_company.Vet_Aff_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="Vet_Aff_DC" VALUE="#read_company.Vet_Aff_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="Vet_Aff_VA" VALUE="#read_company.Vet_Aff_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>



<tr>
			<td><font size=1 color=blue face=arial>Document Retrieval</td>
			<td align="right"><input type=text name="DocRetrieval_reg" VALUE="#read_company.DocRetrieval_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="DocRetrieval_MD" VALUE="#read_company.DocRetrieval_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="DocRetrieval_DC" VALUE="#read_company.DocRetrieval_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="DocRetrieval_VA" VALUE="#read_company.DocRetrieval_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>

<tr>
			<td><font size=1 color=blue face=arial>Recissions</td>
			<td align="right"><input type=text name="Recissions_reg" VALUE="#read_company.Recissions_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="Recissions_MD" VALUE="#read_company.Recissions_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="Recissions_DC" VALUE="#read_company.Recissions_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="Recissions_VA" VALUE="#read_company.Recissions_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>
<tr>
			<td><font size=1 color=blue face=arial>Deed in Lieu</td>
			<td align="right"><input type=text name="DIL_reg" VALUE="#read_company.DIL_reg#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="DIL_MD" VALUE="#read_company.DIL_MD#" size=5 maxlength=22
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
				clear: none; "></td>
			<td align="right"><input type=text name="DIL_DC" VALUE="#read_company.DIL_DC#" size=5 maxlength=22
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
				clear: none; "></td>
				<td align="right"><input type=text name="DIL_VA" VALUE="#read_company.DIL_VA#" size=5 maxlength=22
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
				clear: none; "></td>
		</tr>
			</table>

			</font>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			AVM Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<select name="AVMproduct" size="1"
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
					cols="45" >
				<option value=""></option>
				<OPTION VALUE="First" <cfif read_company.AVMproduct is "First">selected</cfif>>AVM Upgrade</OPTION>
				<OPTION VALUE="CASA" <cfif read_company.AVMproduct is "CASA">selected</cfif>>CASA (Case Schiller Weiss AVM)</OPTION>
				<OPTION VALUE="HPA" <cfif read_company.AVMproduct is "HPA">selected</cfif>>HPA (Basis 100 - Home Price Analyzer)</OPTION>
				<OPTION VALUE="Home" <cfif read_company.AVMproduct is "Home">selected</cfif>>Home Value Explorer (Freddie Mac AVM)</OPTION>
				<OPTION VALUE="ValueLogix" <cfif read_company.AVMproduct is "ValueLogix">selected</cfif>>ValueLogix (customized AVM)</OPTION>

			</select>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			AVM ClientID
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="AVMclientID" VALUE="#read_company.AVMclientID#" size=25 maxlength=200
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
			<font size=2 color=black face=arial>
			AVM ProviderID
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="AVMproID" VALUE="#read_company.AVMproID#" size=25 maxlength=200
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
			<font size=2 color=black face=arial>
			Flood Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6 >
			<font size=1 color=blue face=arial>
			<INPUT TYPE="checkbox" NAME="Basic"
				<CFIF #read_company.Basic# is "Basic">
					Checked
				</CFIF>
				>&nbsp;&nbsp;
				Basic Certification<BR>
			<INPUT TYPE="checkbox" NAME="Census"
				<CFIF #read_company.Census# is "Census">
					Checked
				</CFIF>
				>&nbsp;&nbsp;
				Basic Certification with Census Information<BR>
			<INPUT TYPE="checkbox" NAME="Life"
				<CFIF #read_company.Life# is "Life">
					Checked
				</CFIF>
				>&nbsp;&nbsp;
				Life of Loan Certification<BR>
			<INPUT TYPE="checkbox" NAME="LifeCensus"
				<CFIF #read_company.LifeCensus# is "LifeCensus">
					Checked
				</CFIF>
				>&nbsp;&nbsp;
				Life of Loan Certification with Census Information
		</td>


	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Flood ClientID
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="FclientID" VALUE="#read_company.FclientID#" size=25 maxlength=200
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
			<font size=2 color=black face=arial>
			Flood ProviderID
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="FproID" VALUE="#read_company.FproID#" size=25 maxlength=200
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
			<font size=2 color=black face=arial>
			Credit Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6 >
			<font size=1 color=blue face=arial>
			<INPUT TYPE="checkbox" NAME="Infile"
				<CFIF #read_company.Infile# is "Infile">
					Checked
				</CFIF>
				>&nbsp;&nbsp;
				Infile Report<BR>
			<INPUT TYPE="checkbox" NAME="Reissue"
				<CFIF #read_company.Reissue# is "Reissue">
					Checked
				</CFIF>
				>&nbsp;&nbsp;
				Re-Issue<BR>
			<INPUT TYPE="checkbox" NAME="Safe"
				<CFIF #read_company.Safe# is "Safe">
					Checked
				</CFIF>
				>&nbsp;&nbsp;
				SAFE (1 Bureau In File)<BR>
		</td>

	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Credit ClientID
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="CRclientID" VALUE="#read_company.CRclientID#" size=25 maxlength=200
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
			<font size=2 color=black face=arial>
			Credit ProviderID
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="CRproID" VALUE="#read_company.CRproID#" size=25 maxlength=200
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
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Comments
		</td>
	</tr>
	<tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<TEXTAREA name="comment"  COLS=55 ROWS=10
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
	</tr><tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Special Instructions
		</td>
	</tr>
	<tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<TEXTAREA name="special_inst"  COLS=55 ROWS=10
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
				clear: none;">#read_company.special_inst#</TEXTAREA>
		</td>
	</tr><tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Special Abstractors Instructions
		</td>
	</tr>
	<tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<TEXTAREA name="special_abs_inst"  COLS=55 ROWS=10
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
				clear: none;">#read_company.special_abs_inst#</TEXTAREA>

				<input type="hidden" NAME="intCustServ" value=0>
		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Customer Service Team
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="team_id"
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

						<CFLOOP query="get_teams">
							<option value="#get_teams.id#" <cfif get_teams.id eq read_company.team_id>selected</cfif>>#get_teams.Name#</option>
						</CFLOOP>
				</SELECT>
		</td>

	</tr>

	 <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Allow Employee Authentication
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<CFIF #read_company.companies_switch# nEQ "1">
				<NOBR><input type=radio name="companies_switch" value="0" checked> -<font size=2 color=red face=arial><B>No</B></NOBR></FONT><br>
				<NOBR><input type=radio name="companies_switch" value="1"> -<font size=2 color=green face=arial><B>Yes</B></NOBR></FONT>
			<CFELSE>
				<NOBR><input type=radio name="companies_switch" value="0"> -<font size=2 color=red face=arial><B>No</B></NOBR></FONT><br>
				<NOBR><input type=radio name="companies_switch" value="1" checked> -<font size=2 color=green face=arial><B>Yes</B></NOBR></FONT>
			</CFIF>
		</td>
	</tr>




		 <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Allow Substitution Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="allow_subrates" value="0" <CFIF #read_company.allow_subrates# eq 0>checked</cfif>> -<font size=2 color=red face=arial><B>No</B></NOBR></FONT><br>
				<NOBR><input type=radio name="allow_subrates" value="1" <CFIF #read_company.allow_subrates# eq 1>checked</cfif>> -<font size=2 color=green face=arial><B>Yes</B></NOBR></FONT>
		</td>
	</tr>

		 <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Allow Reissue Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="allow_reissue_rates" value="0" <CFIF #read_company.allow_reissue_rates# eq 0>checked</cfif>> -<font size=2 color=red face=arial><B>No</B></NOBR></FONT><br>
				<NOBR><input type=radio name="allow_reissue_rates" value="1" <CFIF #read_company.allow_reissue_rates# eq 1>checked</cfif>> -<font size=2 color=green face=arial><B>Yes</B></NOBR></FONT>
		</td>
	</tr>

		 <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Allow Chicago Bucket Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="allow_chicago_rates" value="0" <CFIF #read_company.allow_chicago_rates# eq 0>checked</cfif>> -<font size=2 color=red face=arial><B>No</B></NOBR></FONT><br>
				<NOBR><input type=radio name="allow_chicago_rates" value="1" <CFIF #read_company.allow_chicago_rates# eq 1>checked</cfif>> -<font size=2 color=green face=arial><B>Yes</B></NOBR></FONT>
		</td>
	</tr>


		 <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Allow Chicago LOCAL Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="allow_chicago_rates2" value="0" <CFIF #read_company.allow_chicago_rates2# eq 0>checked</cfif>> -<font size=2 color=red face=arial><B>No</B></NOBR></FONT><br>
				<NOBR><input type=radio name="allow_chicago_rates2" value="1" <CFIF #read_company.allow_chicago_rates2# eq 1>checked</cfif>> -<font size=2 color=green face=arial><B>Yes</B></NOBR></FONT>
		</td>
	</tr>
	
	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Use APR System
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="use_apr" value="0" <CFIF #read_company.use_apr# eq 0>checked</cfif>> -<font size=2 color=red face=arial><B>No</B></NOBR></FONT><br>
				<NOBR><input type=radio name="use_apr" value="1" <CFIF #read_company.use_apr# eq 1>checked</cfif>> -<font size=2 color=green face=arial><B>Yes</B></NOBR></FONT>
		</td>
	</tr>


	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Send Automatic Reminder/Thank You Emails
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="auto_email_opt_out" value="0" <CFIF #read_company.auto_email_opt_out# EQ 0>checked</CFIF>> -<font size=2 color=red face=arial><B>Yes</B></NOBR></FONT><br>
				<NOBR><input type=radio name="auto_email_opt_out" value="1" <CFIF #read_company.auto_email_opt_out# EQ 1>checked</CFIF>> -<font size=2 color=green face=arial><B>No</B></NOBR></FONT>
		</td>
	</tr>


	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Chase Acct
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="chase_acct" value="True" <CFIF #read_company.chase_acct# EQ 'True'>checked</CFIF>> -<font size=2 color=red face=arial><B>Yes</B></NOBR></FONT><br>
				<NOBR><input type=radio name="chase_acct" value="False" <CFIF #read_company.chase_acct# NEQ 'True'>checked</CFIF>> -<font size=2 color=green face=arial><B>No</B></NOBR></FONT>
		</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Streamline Client
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="streamline_client" value="True" <CFIF #read_company.streamline_client# EQ 'True'>checked</CFIF>> -<font size=2 color=red face=arial><B>Yes</B></NOBR></FONT><br>
				<NOBR><input type=radio name="streamline_client" value="False" <CFIF #read_company.streamline_client# NEQ 'True'>checked</CFIF>> -<font size=2 color=green face=arial><B>No</B></NOBR></FONT>
		</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fairfax Client
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="fairfax_client" value="True" <CFIF #read_company.fairfax_client# EQ 'True'>checked</CFIF>> -<font size=2 color=red face=arial><B>Yes</B></NOBR></FONT><br>
				<NOBR><input type=radio name="fairfax_client" value="False" <CFIF #read_company.fairfax_client# NEQ 'True'>checked</CFIF>> -<font size=2 color=green face=arial><B>No</B></NOBR></FONT>
		</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Attach ICL
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="attach_icl" value="True" <CFIF #read_company.attach_icl# EQ 'True'>checked</CFIF>> -<font size=2 color=red face=arial><B>Yes</B></NOBR></FONT><br>
				<NOBR><input type=radio name="attach_icl" value="False" <CFIF #read_company.attach_icl# NEQ 'True'>checked</CFIF>> -<font size=2 color=green face=arial><B>No</B></NOBR></FONT>
		</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			ICL Address
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<textarea name="icl_address" style="font-size: 9;
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
					rows="15"
					cols="45">#read_company.icl_address#</textarea>
		</td>
	</tr>


	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Attach E & O
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="attach_eando" value="True" <CFIF #read_company.attach_eando# EQ 'True'>checked</CFIF>> -<font size=2 color=red face=arial><B>Yes</B></NOBR></FONT><br>
				<NOBR><input type=radio name="attach_eando" value="False" <CFIF #read_company.attach_eando# NEQ 'True'>checked</CFIF>> -<font size=2 color=green face=arial><B>No</B></NOBR></FONT>
		</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			Always include Alta 8.1
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="alta_8_1" value="True" <CFIF #read_company.alta_8_1# EQ 'True'>checked</CFIF>> -<font size=2 color=red face=arial><B>Yes</B></NOBR></FONT><br>
				<NOBR><input type=radio name="alta_8_1" value="False" <CFIF #read_company.alta_8_1# NEQ 'True'>checked</CFIF>> -<font size=2 color=green face=arial><B>No</B></NOBR></FONT>
		</td>
	</tr>



	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			Always include Alta 9
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="alta_9" value="True" <CFIF #read_company.alta_9# EQ 'True'>checked</CFIF>> -<font size=2 color=red face=arial><B>Yes</B></NOBR></FONT><br>
				<NOBR><input type=radio name="alta_9" value="False" <CFIF #read_company.alta_9# NEQ 'True'>checked</CFIF>> -<font size=2 color=green face=arial><B>No</B></NOBR></FONT>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Master Company
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<select name="master_co" id="master_co" size="1"
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
					cols="45" >
<option value="0" <cfif read_company.master_co_id eq '' or read_company.master_co_id eq 0 or read_company.master_co_id eq 'NULL'>selected</cfif>>None</option>
<cfloop query="get_all_companies">
<cfset this_ID = get_all_companies.ID>
<option value="#this_ID#" <cfif read_company.master_co_id eq this_ID>selected</cfif>>#Left(Company, 50)#<cfif Len(Company) gt 50>...</cfif></option>
</cfloop>
								</select><br>
<font size=2 color=black face=arial><input type="checkbox" value=1 name="copy_new_fees">&nbsp;Copy new fee set from this account</font>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Custom Rate Table
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<select name="custom_rate_table" id="custom_rate_table" size="1"
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
					cols="45" >
<option value="" <cfif read_company.custom_rate_table eq '' or read_company.custom_rate_table eq 0 or read_company.custom_rate_table eq 'NULL'>selected</cfif>>None</option>
<cfloop query="get_all_custom_rate_tables">
<cfset this_ID = get_all_custom_rate_tables.Name>
<option value="#this_ID#" <cfif read_company.custom_rate_table eq this_ID>selected</cfif>>#Mid(this_ID, 19, Len(this_id))#</option>
</cfloop>
								</select>
		</td>
	</tr>


	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Child Companies
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<cfif read_company.child_ids NEQ 'NULL' and read_company.child_ids neq ''>
		<CFQUERY datasource="#request.dsn#" NAME="children">
			SELECT *
			FROM companies where ID in (#read_company.child_ids#)
			order by ID
        </CFQUERY>
        </cfif>
			<textarea style="font-size: 9;
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
					rows="15"
					cols="45"><cfif read_company.child_ids NEQ 'NULL' and read_company.child_ids neq ''><cfloop query="children">(#children.ID#) - #children.company#</cfloop></cfif></textarea><br>
<INPUT type="button" value="Manage Child Accounts" onClick="window.open('https://#cgi.server_name#/admin_area/met/child_accounts.cfm?comp_id=#read_company.id#','mywindow','width=880,height=400')">
		</td>
	</tr>
	
	
	
	
	
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Exclude from Ordering States
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
<input type=text name="exclude_states" VALUE="#read_company.exclude_states#" size=25 maxlength=200
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
				clear: none;" ><br>
<font size=2 color=black face=arial>List states, separated by commas (AZ,AL,AR...)</font>
		</td>
	</tr>
    
    
 	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>Client Will Upload Commitment
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
				<NOBR><input type=radio name="client_commitment" value="True" <CFIF #read_company.client_commitment# EQ 'True'>checked</CFIF>> -<font size=2 color=red face=arial><B>Yes</B></NOBR></FONT><br>
				<NOBR><input type=radio name="client_commitment" value="False" <CFIF #read_company.client_commitment# NEQ 'True'>checked</CFIF>> -<font size=2 color=green face=arial><B>No</B></NOBR></FONT>
		</td>
	</tr>
 

	<!--- <tr>
								<td width=130 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									realEC ClientID
								</td>
								<td width=237 align=left valign=top bgcolor=e6e6e6>
									<input type=text name="realECclientID" VALUE="#read_company.realECclientID#" size=30 maxlength=50
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
									AVM Product
								</td>
								<td width=237 bgcolor="e6e6e6" align=left valign=top>
									<SELECT NAME="avmproduct" style="font-size: 9;
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
					float: none;" >
										<OPTION VALUE="">Select</OPTION>
										<OPTION VALUE="First" <cfif read_company.avmproduct eq 'First'>checked</cfif> >AVM Upgrade</OPTION>
										<OPTION VALUE="CASA" <cfif read_company.avmproduct eq 'CASA'>checked</cfif>>CASA (Case Schiller Weiss AVM)</OPTION>
										<OPTION VALUE="HPA" <cfif read_company.avmproduct eq 'HPA'>checked</cfif>>HPA (Basis 100 - Home Price Analyzer)</OPTION>
										<OPTION VALUE="Home" <cfif read_company.avmproduct eq 'Home'>checked</cfif> >Home Value Explorer (Freddie Mac AVM)</OPTION>
										<OPTION VALUE="ValueLogix" <cfif read_company.avmproduct eq 'ValueLogix'>checked</cfif>>ValueLogix (customized AVM)</OPTION>
									</select>
							</td>
							</tr>
 --->






		<INPUT TYPE=HIDDEN NAME="cid" VALUE="#company_id#">
	<tr>
		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><A HREF="client_modify.cfm?uid=#URL.uid#&al=#URL.al#"><IMG SRC="./images/button_back.gif"  BORDER=0></A><img src="./images/clear.gif" height=10 width=30>

<cfif #read_user.ID# eq 472 or #read_user.role_id# eq "25"
	or #read_user.role_id# eq "26" or (#read_user.role_id# eq "24" and read_company.intSales eq read_user.ID)>
		<input type=image src="./images/button_submit.gif" border=0>
		<img src="./images/clear.gif" height=10 width=40>
</cfif></NOBR>
<input type="hidden" name="Report">
<input type="hidden" name="Commit">
<input type="hidden" name="FullService">
<input type="hidden" name="Clearc">
<input type="hidden" name="payoff" >
<input type="hidden" name="disbursements" >
<input type="hidden" name="recording" >
<input type="hidden" name="appraisal">
<input type="hidden" name="signing">
<input type="hidden" name="shipping">
</td></tr></CFOUTPUT>
</CFFORM>


</table>
		</td>
	</tr>
</table>
		</td>
	</tr>
</table>
</BODY>
</HTML>