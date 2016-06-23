<!--- <cfset testing_app = 1>
<!--- the following code finds all companies that have placed an order with, but have NOT placed an order in the last 30 days --->

<cfset email_sent_30 = "">
<cfset today = CreateODBCDate(Now())>
<cfset thirty_two_days = CreateODBCDate(DateAdd("d", -32, today))>
<cfset cutoff_date = CreateODBCDate('1/1/2005')>
<cfset comp_ids_30_days = "">

<cfset build_query = QueryNew("Company, ID, email, intSales_fname, intSales_lname, intSales_phone, intCustServ_fname, intCustServ_lname, intCustServ_phone, intSales_position, intCustServ_position, intCustServ_fax, intSales_fax, intCustServ_email, intSales_email")>
<cfset used_email_addresses = "">

<CFQUERY datasource="#request.dsn#" NAME="get_companies">
Select *
FROM Companies
where last_order_date IS NOT NULL
and last_order_date >= #cutoff_date#
and last_order_date <= #thirty_two_days#
and sent_thirty_day_email = 0
and a_status = 1
and auto_email_opt_out = 0
and test_account = 0
order by last_order_date DESC
</cfquery>


<cfoutput>
<cfloop query="get_companies">
<cfset company = get_companies.Company>
<cfset this_id = get_companies.id>
<cfset intCustServ = get_companies.intCustServ>
<cfset intSales = get_companies.intSales>

<CFQUERY datasource="#request.dsn#" NAME="get_officers">
			SELECT *
			FROM loan_officers
			WHERE comp_id = #this_id#
			and a_status = 1
			ORDER BY lo_lname ASC
		</CFQUERY>
<!--- <CFQUERY datasource="#request.dsn#" NAME="get_officers">
Select p_email as Title_P_Email, o_email as Title_O_Email
FROM Title
where comp_id = '#get_companies.ID#'
</cfquery>
 --->
 <CFQUERY datasource="#request.dsn#" NAME="get_intCustServ">
Select fname, lname, phone, position, fax, email
FROM First_Admin
where ID = '#intCustServ#'
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_intSales">
Select fname, lname, phone, position, fax, email
FROM First_Admin
where ID = '#intSales#'
</cfquery>

<cfloop query="get_officers">
<cfif Not ListContains(used_email_addresses, LCase(lo_email), ",") and lo_email NEQ "">
<cfset used_email_addresses = ListAppend(used_email_addresses, LCase(lo_email), ",")>
<cfset temp = QueryAddRow(build_query)>
<cfset temp = QuerySetCell(build_query, "Company", Company)>
<cfset temp = QuerySetCell(build_query, "ID", this_id)>
<cfset temp = QuerySetCell(build_query, "Email", lo_email)>
<cfset temp = QuerySetCell(build_query, "intSales_fname", get_intSales.fname)>
<cfset temp = QuerySetCell(build_query, "intSales_lname", get_intSales.lname)>
<cfset temp = QuerySetCell(build_query, "intSales_phone", get_intSales.phone)>
<cfset temp = QuerySetCell(build_query, "intCustServ_fname", get_intCustServ.fname)>
<cfset temp = QuerySetCell(build_query, "intCustServ_lname", get_intCustServ.lname)>
<cfset temp = QuerySetCell(build_query, "intCustServ_phone", get_intCustServ.phone)>
<cfset temp = QuerySetCell(build_query, "intSales_position", get_intSales.position)>
<cfset temp = QuerySetCell(build_query, "intCustServ_position", get_intCustServ.position)>
<cfset temp = QuerySetCell(build_query, "intSales_fax", get_intSales.fax)>
<cfset temp = QuerySetCell(build_query, "intCustServ_fax", get_intCustServ.fax)>
<cfset temp = QuerySetCell(build_query, "intSales_email", get_intSales.email)>
<cfset temp = QuerySetCell(build_query, "intCustServ_email", get_intCustServ.email)>
</cfif>

<!--- <cfif Not ListContains(used_email_addresses, LCase(Title_O_Email), ",") and Title_O_Email NEQ "">
<cfset used_email_addresses = ListAppend(used_email_addresses, LCase(Title_O_Email), ",")>
<cfset temp = QueryAddRow(build_query)>
<cfset temp = QuerySetCell(build_query, "Company", Company)>
<cfset temp = QuerySetCell(build_query, "ID", ID)>
<cfset temp = QuerySetCell(build_query, "Email", Title_O_Email)>
<cfset temp = QuerySetCell(build_query, "intSales_fname", get_intSales.fname)>
<cfset temp = QuerySetCell(build_query, "intSales_lname", get_intSales.lname)>
<cfset temp = QuerySetCell(build_query, "intSales_phone", get_intSales.phone)>
<cfset temp = QuerySetCell(build_query, "intCustServ_fname", get_intCustServ.fname)>
<cfset temp = QuerySetCell(build_query, "intCustServ_lname", get_intCustServ.lname)>
<cfset temp = QuerySetCell(build_query, "intCustServ_phone", get_intCustServ.phone)>
<cfset temp = QuerySetCell(build_query, "intCustServ_position", get_intCustServ.position)>
<cfset temp = QuerySetCell(build_query, "intSales_position", get_intSales.position)>
<cfset temp = QuerySetCell(build_query, "intCustServ_fax", get_intCustServ.fax)>
<cfset temp = QuerySetCell(build_query, "intSales_fax", get_intSales.fax)>
<cfset temp = QuerySetCell(build_query, "intSales_email", get_intSales.email)>
<cfset temp = QuerySetCell(build_query, "intCustServ_email", get_intCustServ.email)>

</cfif> --->
</cfloop>

<CFQUERY datasource="#request.dsn#" NAME="get_officers">

			SELECT *
			FROM users
			WHERE comp_id = #this_id#
			and a_status = 1
			ORDER BY  lp_lname ASC

		</CFQUERY>
<!--- <CFQUERY datasource="#request.dsn#" NAME="get_officers">
Select p_email as Prop_P_Email, o_email as Prop_O_Email
FROM Property
where comp_id = '#get_companies.ID#'
</cfquery>
 --->
<cfloop query="get_officers">
<cfif Not ListContains(used_email_addresses, LCase(lp_email), ",") and lp_email NEQ "">
<cfset used_email_addresses = ListAppend(used_email_addresses, LCase(lp_email), ",")>
<cfset temp = QueryAddRow(build_query)>
<cfset temp = QuerySetCell(build_query, "Company", Company)>
<cfset temp = QuerySetCell(build_query, "ID", this_id)>
<cfset temp = QuerySetCell(build_query, "Email", lp_email)>
<cfset temp = QuerySetCell(build_query, "intSales_fname", get_intSales.fname)>
<cfset temp = QuerySetCell(build_query, "intSales_lname", get_intSales.lname)>
<cfset temp = QuerySetCell(build_query, "intSales_phone", get_intSales.phone)>
<cfset temp = QuerySetCell(build_query, "intCustServ_fname", get_intCustServ.fname)>
<cfset temp = QuerySetCell(build_query, "intCustServ_lname", get_intCustServ.lname)>
<cfset temp = QuerySetCell(build_query, "intCustServ_phone", get_intCustServ.phone)>
<cfset temp = QuerySetCell(build_query, "intSales_position", get_intSales.position)>
<cfset temp = QuerySetCell(build_query, "intCustServ_position", get_intCustServ.position)>
<cfset temp = QuerySetCell(build_query, "intSales_fax", get_intSales.fax)>
<cfset temp = QuerySetCell(build_query, "intCustServ_fax", get_intCustServ.fax)>
<cfset temp = QuerySetCell(build_query, "intSales_email", get_intSales.email)>
<cfset temp = QuerySetCell(build_query, "intCustServ_email", get_intCustServ.email)>


</cfif>
<!--- <cfif Not ListContains(used_email_addresses, LCase(Prop_O_Email), ",") and Prop_O_Email NEQ "">
<cfset used_email_addresses = ListAppend(used_email_addresses, LCase(Prop_O_Email), ",")>
<cfset temp = QueryAddRow(build_query)>
<cfset temp = QuerySetCell(build_query, "Company", Company)>
<cfset temp = QuerySetCell(build_query, "ID", ID)>
<cfset temp = QuerySetCell(build_query, "Email", Prop_O_Email)>
<cfset temp = QuerySetCell(build_query, "intSales_fname", get_intSales.fname)>
<cfset temp = QuerySetCell(build_query, "intSales_lname", get_intSales.lname)>
<cfset temp = QuerySetCell(build_query, "intSales_phone", get_intSales.phone)>
<cfset temp = QuerySetCell(build_query, "intCustServ_fname", get_intCustServ.fname)>
<cfset temp = QuerySetCell(build_query, "intCustServ_lname", get_intCustServ.lname)>
<cfset temp = QuerySetCell(build_query, "intCustServ_phone", get_intCustServ.phone)>
<cfset temp = QuerySetCell(build_query, "intSales_position", get_intSales.position)>
<cfset temp = QuerySetCell(build_query, "intCustServ_position", get_intCustServ.position)>
<cfset temp = QuerySetCell(build_query, "intSales_fax", get_intSales.fax)>
<cfset temp = QuerySetCell(build_query, "intCustServ_fax", get_intCustServ.fax)>
<cfset temp = QuerySetCell(build_query, "intSales_email", get_intSales.email)>
<cfset temp = QuerySetCell(build_query, "intCustServ_email", get_intCustServ.email)>


</cfif> --->
</cfloop>
</cfloop>
</cfoutput>

<cfquery dbtype="query" name="send_query">
Select * from
build_query
order by ID
</cfquery>



<cfset previous_query_id = 000>
<cfoutput query="send_query">
<cfset this_query_id = send_query.ID>
<cfif send_query.ID NEQ previous_query_id>
<cfset new_comp_to_add = "" & send_query.Company & " (" & send_query.ID & ")">
<cfset email_sent_30 = ListAppend(email_sent_30, new_comp_to_add, "|")>
</cfif>
<cfset previous_query_id = send_query.ID>

<cfif testing_app eq 1 >
<cfset this_email = "rjermain@firsttitleservices.com">
<cfset this_subject = "TEST-">
<cfelse>
<cfset this_email = send_query.email>
<cfset this_subject = "">
</cfif>



<!--- <cfmail to="#this_email#" from="#intsales_email#" subject="#this_subject#First Title & Escrow / #send_query.Company#" type="html" bcc="rjermain@firsttitleservices.com">
<cfif testing_app eq 1>
#send_query.email#
</cfif>
Your team at First Title misses you! We haven't heard from you in some time with regard to your ordering of title closing services from us. As a quick reminder to you of what First Title can offer your group, here are some highlights:<br>
<br>
<ul><li><strong>Title and Closing Coverage</strong> in 41 states nationwide for your purchase, refinance and equity loan transactions</li>
<li><strong>Web-Based Tools</strong> To Boost Your Productivity, including: </li>
<ul><li><span style="text-decoration: underline;">Generation of an Instant Pre-Calculated HUD-1</span> on Order Placement - with all title insurance and state/county recordation fees </li>
<li><span style="text-decoration: underline;">Web-Based Closing Calendar</span> - Choose where and when you want to close 24/7 </li>
<li><span style="text-decoration: underline;">Instant Endorsement Generator</span> - Change Investor or Loan Amount on your Title Commitment, Online Instantly!</li>
<li><span style="text-decoration: underline;">Closing Cost Calculator</span> - Get actual closing fees, title insurance and recording fees for your transactions 24/7</li>
<li><span style="text-decoration: underline;">Dashboard Transaction Manager</span> - View EVERY document, note, and communication related to each of your transactions with us, ONLINE</li>
</ul></ul><br>

We believe that with a combination of nationwide coverage and our proprietary technology solutions, we can be a powerful partner in making your organization successful.<br>
<br>
Again, thank you for the opportunity to be of service to you. We look forward to hearing from you soon.<br>
<br>
#intsales_fname# #intsales_lname#, #intsales_position#<br>
Phone: #intsales_phone#<br>
Fax: #intsales_fax#<br>
#intcustserv_fname# #intcustserv_lname#, #intcustserv_position#<br>
Phone: #intcustserv_phone#<br>
Fax: #intcustserv_fax#<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
First Title & Escrow<br>
30 West Gude Drive, 4th Floor<br>
Rockville, MD 20850<br>
<cfelse>
First Title & Escrow<br>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br>
</cfif>

Web Address: <a href="https://www.firsttitleservices.com">www.firsttitleservices.com</a><br>
<br>
</cfmail> --->



<cfif testing_app eq 0>
<CFQUERY datasource="#request.dsn#" NAME="update_companies">
Update Companies
Set sent_thirty_day_email = 1
where id = '#send_query.ID#'
</cfquery>
</cfif>

#send_query.ID#<br>
</cfoutput>

<cfabort> --->

<!--- <cfset table_list = "StateAlabamaState"> --->


<!--- <cfset table_list = "StateAlabamaState,StateAlabamaMetro,StateArkansas,StateDelaware,StateDelawareStewart,StateDistrictColombia,StateGeorgiaState,StateGeorgiaMetro,StateGeorgiaStewart,StateIllinois,StateIndiana,StateIowa,StateKentucky,StateLouisianna,StateMaine,StateMaryland,StateMassachusetts,StateMinnesota,StateMinnesota1,StateMississipi,StateMissouri,StateNewHampshire,StateNorthCarolina,StateNorthDakota,StateNorthDakotaStewart,StateSouthCarolina,StateVermont,StateVirginia,StateVirginia2,StateVirginiaStewart,StateWestVirginia"> --->
<!---
<cfset table_list = "StateArizona,StateArizonaMIC,StateArizonaStewartZone1,StateArizonaStewartZone2,StateArizonaStewartZone3,StateArizonaStewartZone4,StateArizonaStewartZone5,StateArizonaZone1,StateArizonaZone2,StateArizonaZone3,StateArizonaZone4,StateArizonaZone5,StateKansas,StateMichiganZone1,StateMichiganZone2,StateMichiganZone3,StateMontana,StateMontanaStewart,StateNebraska,StateNebraskaZone1,StateNevada,StateNevadaStewart,StateUtah,StateWisconsin">



<cfoutput>
<cfloop index="this_table" list="#table_list#" delimiters=",">
<CFQUERY datasource="#request.dsn#" NAME="update_rates">
Update #this_table#
set expedite = '300'
where a_to <= '250000'
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="update_rates">
Update #this_table#
set expedite = '450'
where a_to > '250000'
and a_to <= '500000'
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="update_rates">
Update #this_table#
set expedite = '550'
where a_to > '500000'
and a_to <= '750000'
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="update_rates">
Update #this_table#
set expedite = '660'
where a_to > '750000'
and a_to <= '1000000'
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="update_rates">
Update #this_table#
set expedite = '760'
where a_to > '1000000'
and a_to <= '1250000'
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="update_rates">
Update #this_table#
set expedite = '860'
where a_to > '1250000'
and a_to <= '1500000'
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="update_rates">
Update #this_table#
set expedite = 'Call for Quote!'
where a_to > '1500000'
</cfquery>
</cfloop>
</cfoutput>
updated!!!<br>
<br>
--->
<!---
<table border="1" cellspacing=0 cellpadding=0 align = "center" width="98%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
<tr>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
</tr>
<tr>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
</tr>
<tr>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
</tr>
<tr>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
</tr>
<tr>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
<td width="25%"><font face="Arial, Helvetica, sans-serif" size="1">Testing</font></td>
</tr>
</table>
--->
<!--- <cfparam name="form.employee_grid" default="">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
		SELECT *
		FROM companies
		ORDER BY company ASC
	</CFQUERY>

	<cfform action="#CGI.SCRIPT_NAME#" method="post">
	<cfgrid name="employee_grid" height="500" width="600" vspace="3" hspace="3" query="read_company" insert="no" delete="no" sort="no" italic="no" bold="no" appendkey="yes" highlighthref="no" griddataalign="left" gridlines="no" rowheaders="no" rowheaderalign="left" rowheaderitalic="no" rowheaderbold="no" colheaders="yes" colheaderalign="left" colheaderitalic="no" colheaderbold="no"
			selectmode="single" picturebar="no" autowidth="true">
		<cfgridcolumn name="ID" headeralign="left" dataalign="left" bold="no" italic="no" select="no" display="yes" headerbold="no" headeritalic="no" textcolor="##CC0000" bgcolor="##CCCCCC">
		<cfgridcolumn name="Company">
		<cfgridcolumn name="Email">
	</cfgrid>
<br><input type="Submit" value="Submit">


</cfform>
<cfdump var="#form.employee_grid#"> --->


<!--- <cftry>
		<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_sel_company.team_id#">
		<cfcatch type="Any">
		<cfoutput>
		<!--- <cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure"> --->
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		<!--- </cfmail> --->
        </cfoutput>
	</cfcatch>
</cftry> --->

<!---
<CFQUERY datasource="#request.dsn#" NAME="read_company">
		SELECT Company, sign_up_date
		FROM companies
		where sign_up_date > '10/1/2006'
		and a_status = 1
		and test_account = 0
		and company  not like 'TEST%'
		ORDER BY company ASC
	</CFQUERY>

<!--- <cfdump var="#read_company#"> --->
<table>
<tr>
<td align="left" valign="top"><strong>Company</strong></td>
<td align="right" valign="top"><strong>Sign-Up Date</strong></td>
</tr>
<cfoutput query="read_company">
<tr>
<td align="left" valign="top">#Company#</td>
<td align="right" valign="top">#DateFormat(sign_up_date, "mm/dd/yyyy")#</td>
</tr>
</cfoutput>
</table> --->

<!--- <CFQUERY NAME="get_stuff" DataSource="dec_comps">
SELECT * FROM `Sheet1$`
</CFQUERY>



<table width="100%"  border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td>ID</td>
    <td>Company</td>
    <td>Orders</td>
    <td>Team</td>
  </tr>
<cfoutput><CFLOOP query="get_stuff">
<CFQUERY datasource="#request.dsn#" NAME="comp">
		SELECT *
		FROM Companies c, Teams t
		where c.ID = '#ID#'
		and t.ID = c.team_id
	</CFQUERY>
<tr>
    <td>#get_stuff.ID#</td>
    <td>#get_stuff.Company#</td>
    <td>#get_stuff.Orders#</td>
    <td>#comp.name#</td>
  </tr>
</CFLOOP></cfoutput>
</table>
 --->
 <CFQUERY datasource="#request.dsn#" NAME="comp">
		update First_Admin
		set username = 'dthomas3' where username = 'dionne3'
	</CFQUERY>

 <CFQUERY datasource="#request.dsn#" NAME="comp">
		SELECT *
		FROM First_Admin
		where fname = 'Dionne' and lname = 'thomas'
	</CFQUERY>

	<cfdump var="#comp#">