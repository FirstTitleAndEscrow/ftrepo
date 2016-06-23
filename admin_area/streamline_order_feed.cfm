<cfsetting requesttimeout="600"> 
<cfparam name="form.file_upload" default="">
<cfparam name="form.assign_company" default="">


<CFQUERY datasource="#request.dsn#" NAME="read_user">
			SELECT *
			FROM users
			WHERE id = #URL.uid#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_companies">
			SELECT *
			FROM companies
			WHERE streamline_client = 'True'
			order by company
</CFQUERY>


<cfif form.file_upload neq '' and form.assign_company neq ''>

<CFFILE
	DESTINATION="c:\uploads\"
	ACTION="UPLOAD"
	NAMECONFLICT="MAKEUNIQUE"
	FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<!--- <cfx_excel2query
    name="read_all"
    file="#fileSys.FindFilePath('#new_file_name#', 'file')#"
    sheetNumber="0"
	headerrow="1">
 --->
<cfspreadsheet 
        action = "read" 
        src="#fileSys.FindFilePath('#new_file_name#', 'file')#" 
        query="read_all"
		excludeHeaderRow="true"
		columnNames="REO_ID,Fannie_Mae_Loan,Seller,Street_Address,City_State_Zip,County,Servicer,Broker,State,Zip,Vendor_Loan_Number,Servicer_Name,Servicer_Contact_Name,Servicer_Contact_Phone,Broker_Name,Broker_Contact_Name,Broker_Contact_Phone,Attorney_Name,Attorney_Contact_Name,Attorney_Contact_Phone"
		HeaderRow="1" 
        sheet="1"> 


<cfset company_id =  100>
<cfset lo_id =  5138>
<cfset lp_id =  4444>

<cfif form.assign_company eq 'fannie' or form.assign_company eq 'fannie update'>
<cfset company_id =  3568>
<cfset lo_id =  6401>
<cfset lp_id =  5516>
<cfelseif form.assign_company eq 'freddie' or form.assign_company eq 'freddie update'>
<cfset company_id =  2372>
<cfset lo_id =  6738>
<cfset lp_id =  6250>
</cfif>




<CFQUERY datasource="#request.dsn#" NAME="get_company_info">
			SELECT *
			FROM companies
			WHERE ID = #company_id#
</CFQUERY>
</cfif>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">




<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
<style type="text/css" media="screen">
<!--
body, TD {
margin: 3;
padding: 3;
font: 10px verdana, arial, sans-serif;
}
input {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
select, option {
margin: 3;
padding: 3;
font: 14px verdana, arial, sans-serif;
}
.header {

font: 14px verdana, arial, sans-serif;
}
-->
</style>
<style>
table {
	background-attachment: scroll;
	background-color: CCCCCC;
	height: auto;
	border: 1px solid;
}
TR {
	font-family: Arial, sans-serif;
	font-size: 10px;
	font-style: normal;
	line-height: 19px;
	color: 00066;
	text-decoration: none;
	text-align: left;
	vertical-align: top;
	background-color: FFFFFF;
}
.data {
	font-family: Arial, sans-serif;
	font-size: 10px;
	font-style: normal;
	line-height: 19px;
	color: 00066;
	text-decoration: none;
	text-align: left;
	vertical-align: top;
	background-color: FFFFFF;
}
OPTION, SELECT {
	font-family: Arial, sans-serif;
	font-size: 10px;
	font-style: normal;
	line-height: 19px;
	color: 00066;
	text-decoration: none;
	text-align: left;
	vertical-align: top;
	background-color: FFFFFF;
}

LI{
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-style: normal;
	line-height: 19px;
	color: 00066;
	text-decoration: none;
	text-align: left;
	vertical-align: top;
	background-color: FFFFFF;
}
.data_header {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-style: normal;
	line-height: 19px;
	color: 000000;
	text-decoration: bold;
	text-align: center;
	vertical-align: top;
	background-color: ;
}
</style>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND=""  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<cfoutput><FORM action="./streamline_order_feed.cfm?uid=#URL.uid#&al=#URL.al#"  ENCTYPE="multipart/form-data" method="post"></cfoutput>
			<font size=3 align=center color=blue face=arial>
		<B>STREAMLINE TITLE ORDER FEED</B><br>
<br>

<table cellpadding=2 cellspacing=2 border=0  width=500>
<tr>
<td align=center valign="top" class="data_header">Step 1</td>
</tr>
<tr>
<td align=Left valign="top">Select an excel file on your computer. For proper formatting, please download the sample files below.<br><BR>
<input type="file" name="file_upload" style="width:300px;">
</td>
</tr>
<tr>
<td align=center valign="top"><a href="FANNIE_SAMPLE.xls" target="_new"><font color="navy">FANNIE MAE SAMPLE FILE</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="FREDDIE_SAMPLE.xls" target="_new"><font color="navy">FREDDIE MAC SAMPLE FILE</font></a>
</td>
</tr>
<tr>
<td align=center valign="top" class="data_header">Step 2</td>
</tr>
<tr>
<td align=Left valign="top">Select either FANNIE MAE or FREDDIE MAC from the list below.<br>
<select name="assign_company">
<option value="fannie">FANNIE MAE - Assign to FNMA - Shapiro/Burson </option>
<option value="freddie">FREDDIE MAC - Assign to Freddie Mac - VA/MD - Shapiro & Burson (will assign automatically)</option>
<cfif cgi.REMOTE_ADDR eq '98.233.232.47'>
<option value="fannie update">FANNIE MAE - Update Records</option>
<option value="freddie update">FREDDIE MAC - Update Records</option>
</cfif>
</select>
</td>
</tr>
<tr>
<td align=center valign="top" class="data_header">Step 3</td>
</tr>
<tr>
<td align=center valign="top" ><input type="submit" value="Click Here to Submit Orders"></td>
</tr>
</table>
</FORM><br>
<br>
<cfif form.file_upload neq '' and form.assign_company eq 'fannie'>

<div align="left">Importing orders and assigning to company: <cfoutput>#get_company_info.company#</cfoutput><br><br>
<cfflush>
<cfoutput query="read_all">
<cfset found_dupe = 0>
<CFQUERY datasource="#request.dsn#" NAME="find_dupe">
			SELECT *
			FROM Title
			WHERE (comp_id = 3568 or comp_id = 2372 or comp_id = 2368) and (loan_number = '#read_all.Fannie_Mae_Loan#' or REO_number = '#read_all.REO_ID#')
</CFQUERY>
<cfif find_dupe.recordcount neq 0>
<cfset found_dupe = 1>
</cfif>
<!--- <cfif cgi.REMOTE_ADDR eq '98.233.232.47'>
<cfdump var="#read_all#"><br>
</cfif>
 --->

<cfif read_all.Street_Address neq '' and read_all.Street_Address neq 'NULL' and read_all.Street_Address neq ' ' and found_dupe eq 0>
<cfhttp url="https://#cgi.server_name#/order_verify_title.cfm?emp=0&comp_id=#company_id#&user_id_1=#lp_id#&lo_id=#lo_id#&zip_id=#ListLast(read_all.city_state_zip, ' ')#&title=1&property=0&appraisal=0&other=0&ordering_co=0" method="post" timeout="600" >
<cfhttpparam type="Formfield" name="comp_id" value="#company_id#">
<cfhttpparam type="Formfield" name="auto_feed" value="1">
<cfhttpparam type="Formfield" name="BFIRSTNAME1" value="TBD">
<cfhttpparam type="Formfield" name="BLASTNAME1" value="TBD">
<cfhttpparam type="Formfield" name="BMINAME1" value="">
<cfhttpparam type="Formfield" name="BSSN1" value="111111111">
<cfhttpparam type="Formfield" name="BHPHONE1" value="">
<cfhttpparam type="Formfield" name="BWPHONE1" value="">
<cfhttpparam type="Formfield" name="BEXT1" value="">
<cfhttpparam type="Formfield" name="b1mstatus" value="">
<cfhttpparam type="Formfield" name="borrower1_dob" value="">
<cfhttpparam type="Formfield" name="SFIRSTNAME1" value="FANNIE">
<cfhttpparam type="Formfield" name="SLASTNAME1" value="MAE">
<cfhttpparam type="Formfield" name="SMINAME1" value="">
<cfhttpparam type="Formfield" name="SSSN1" value="111111111">
<cfhttpparam type="Formfield" name="SWPHONE1" value="">
<cfhttpparam type="Formfield" name="SHPHONE1" value="">
<cfhttpparam type="Formfield" name="COMPANY1" value="">
<cfhttpparam type="Formfield" name="COMPANY2" value="">
<cfhttpparam type="Formfield" name="CONDO_PUD" value="N/A">
<cfhttpparam type="Formfield" name="DEEDTRANSFER" value="N">
<cfhttpparam type="Formfield" name="ENHANCED_COVERAGE" value="0">
<cfhttpparam type="Formfield" name="ESTIMATED_LOAN_FLOAT" value="0">
<cfhttpparam type="Formfield" name="FAX_NO" value="">
<cfhttpparam type="Formfield" name="FILE_UPLOAD" value="">
<cfhttpparam type="Formfield" name="HUD_TYPE" value="0">
<cfhttpparam type="Formfield" name="INS" value="0">
<cfhttpparam type="Formfield" name="INSURED" value="TBD">
<cfhttpparam type="Formfield" name="JLP_POLICY" value="0">
<cfhttpparam type="Formfield" name="LOANAMT_FLOAT" value="1">
<cfhttpparam type="Formfield" name="LOAN_NUMBER" value="#read_all.Fannie_Mae_Loan#">
<cfhttpparam type="Formfield" name="REO_NUMBER" value="#read_all.REO_ID#">
<cfhttpparam type="Formfield" name="LOAN_PROGRAM_333" value="Fixed Rate">
<cfhttpparam type="Formfield" name="LOAN_TYPE_111" value="Conventional">
<cfhttpparam type="Formfield" name="OTHERPRO" value="Other">
<cfhttpparam type="Formfield" name="PADDRESS" value="#read_all.street_address#">
<cfhttpparam type="Formfield" name="UNIT_NUM" value="">
<cfhttpparam type="Formfield" name="PAYOFF_NEEDED" value="0">
<cfhttpparam type="Formfield" name="PCITY" value="#ListFirst(read_all.city_state_zip, ',')#">
<cfhttpparam type="Formfield" name="PCOUNTY" value="#ReplaceNoCase(read_all.county, '''', '', 'ALL')#">
<cfhttpparam type="Formfield" name="PIGGY" value="0">
<cfhttpparam type="Formfield" name="PLEGALDESC" value="">
<cfhttpparam type="Formfield" name="POACCTNO1" value="">
<cfhttpparam type="Formfield" name="POACCTNO2" value="">
<cfhttpparam type="Formfield" name="POLENDER1" value="">
<cfhttpparam type="Formfield" name="POLENDER2" value="">
<cfhttpparam type="Formfield" name="POPHONE1" value="">
<cfhttpparam type="Formfield" name="POPHONE2" value="">
<cfhttpparam type="Formfield" name="PREV_LOAN_MO" value="">
<cfhttpparam type="Formfield" name="PREV_LOAN_YEAR" value="">
<cfhttpparam type="Formfield" name="PROPTYPE" value="SFR">
<cfhttpparam type="Formfield" name="PROP_USE_TYPE" value="Primary Residence">
<cfhttpparam type="Formfield" name="PSTATE" value="#ListFirst(ListGetAt(read_all.city_state_zip, 2, ','), ' ')#">
<cfhttpparam type="Formfield" name="PURCHASE" value="1">
<cfhttpparam type="Formfield" name="PZIP" value="#ListLast(read_all.city_state_zip, ' ')#">
<cfhttpparam type="Formfield" name="REISSUE_RATES" value="0">
<cfhttpparam type="Formfield" name="REQUEST_ICL" value="0">
<cfhttpparam type="Formfield" name="RPTBYEMAIL" value="reckhardt@streamline-title.com">
<cfhttpparam type="Formfield" name="SAME_LENDER" value="0">
<cfhttpparam type="Formfield" name="SEARCHTYPE" value="Purchase">
<cfhttpparam type="Formfield" name="SECLOAN" value="">
<cfhttpparam type="Formfield" name="TAXID1" value="">
<cfhttpparam type="Formfield" name="TAXID2" value="">
<cfhttpparam type="Formfield" name="THIRDP" value="">
<cfhttpparam type="Formfield" name="VERIFYEMAIL" value="">
<cfhttpparam type="Formfield" name="VERIFYEMAIL_2" value="">
<cfhttpparam type="Formfield" name="VERIFYEMAIL_3" value="">
<cfhttpparam type="Formfield" name="mailing_address" value="">
<cfhttpparam type="Formfield" name="a_comment" value="">
</cfhttp>
#read_all.Street_Address# - completed<BR>
<!--- #cfhttp.FileContent# --->
<cfflush>
<cfelse>
		<cfif found_dupe eq 1>
<font color="red">#read_all.street_address# - already in system (#find_dupe.title_id#)</font><BR>
		</cfif>
</cfif>
</cfoutput><br>
<br>
All Orders imported<br></div>
<cfflush>
</cfif>










<cfif form.file_upload neq '' and form.assign_company eq 'freddie'>
<div align="left">Importing orders and assigning to company: <cfoutput>#get_company_info.company#</cfoutput><br><br>
<cfflush>
<cfoutput query="read_all">

<cfif read_all.ADDR_ST eq 'MD'>
<cfset company_id =  2372>
<cfset lo_id =  6738>
<cfset lp_id =  6250>
<cfelseif read_all.ADDR_ST eq 'VA'>
<cfset company_id =  2368>
<cfset lo_id =  7112>
<cfset lp_id =  6300>
</cfif>


<cfset found_dupe = 0>
<CFQUERY datasource="#request.dsn#" NAME="find_dupe">
			SELECT *
			FROM Title
			WHERE (comp_id = 3568 or comp_id = 2372 or comp_id = 2368) and (loan_number = '#read_all.NBR_LN#' or REO_number = '#read_all.ID_AST#')
</CFQUERY>
<cfif find_dupe.recordcount neq 0>
<cfset found_dupe = 1>
</cfif>


<cfif read_all.ADDR_STRT neq '' and read_all.ADDR_STRT neq 'NULL' and read_all.ADDR_STRT neq ' ' and found_dupe eq 0>
<cfhttp url="https://#cgi.server_name#/order_verify_title.cfm?emp=0&comp_id=#company_id#&user_id_1=#lp_id#&lo_id=#lo_id#&zip_id=#ADDR_ZIP_CD#&title=1&property=0&appraisal=0&other=0&ordering_co=0" method="post" timeout="600">
<cfhttpparam type="Formfield" name="comp_id" value="#company_id#">
<cfhttpparam type="Formfield" name="auto_feed" value="1">
<cfhttpparam type="Formfield" name="BFIRSTNAME1" value="TBD">
<cfhttpparam type="Formfield" name="BLASTNAME1" value="TBD">
<cfhttpparam type="Formfield" name="BMINAME1" value="">
<cfhttpparam type="Formfield" name="BSSN1" value="111111111">
<cfhttpparam type="Formfield" name="BHPHONE1" value="">
<cfhttpparam type="Formfield" name="BWPHONE1" value="">
<cfhttpparam type="Formfield" name="BEXT1" value="">
<cfhttpparam type="Formfield" name="b1mstatus" value="">
<cfhttpparam type="Formfield" name="borrower1_dob" value="">
<cfhttpparam type="Formfield" name="SFIRSTNAME1" value="FREDDIE">
<cfhttpparam type="Formfield" name="SLASTNAME1" value="MAC">
<cfhttpparam type="Formfield" name="SMINAME1" value="">
<cfhttpparam type="Formfield" name="SSSN1" value="111111111">
<cfhttpparam type="Formfield" name="SWPHONE1" value="">
<cfhttpparam type="Formfield" name="SHPHONE1" value="">
<cfhttpparam type="Formfield" name="COMPANY1" value="">
<cfhttpparam type="Formfield" name="COMPANY2" value="">
<cfhttpparam type="Formfield" name="CONDO_PUD" value="N/A">
<cfhttpparam type="Formfield" name="DEEDTRANSFER" value="N">
<cfhttpparam type="Formfield" name="ENHANCED_COVERAGE" value="0">
<cfhttpparam type="Formfield" name="ESTIMATED_LOAN_FLOAT" value="0">
<cfhttpparam type="Formfield" name="FAX_NO" value="">
<cfhttpparam type="Formfield" name="FILE_UPLOAD" value="">
<cfhttpparam type="Formfield" name="HUD_TYPE" value="0">
<cfhttpparam type="Formfield" name="INS" value="0">
<cfhttpparam type="Formfield" name="INSURED" value="TBD">
<cfhttpparam type="Formfield" name="JLP_POLICY" value="0">
<cfhttpparam type="Formfield" name="LOANAMT_FLOAT" value="1">
<cfhttpparam type="Formfield" name="LOAN_NUMBER" value="#read_all.NBR_LN#">
<cfhttpparam type="Formfield" name="REO_NUMBER" value="#read_all.ID_AST#">
<cfhttpparam type="Formfield" name="LOAN_PROGRAM_333" value="Fixed Rate">
<cfhttpparam type="Formfield" name="LOAN_TYPE_111" value="Conventional">
<cfhttpparam type="Formfield" name="OTHERPRO" value="Other">
<cfhttpparam type="Formfield" name="PADDRESS" value="#read_all.ADDR_STRT#">
<cfhttpparam type="Formfield" name="UNIT_NUM" value="">
<cfhttpparam type="Formfield" name="PAYOFF_NEEDED" value="0">
<cfhttpparam type="Formfield" name="PCITY" value="#read_all.ADDR_CITY#">
<cfhttpparam type="Formfield" name="PCOUNTY" value="#read_all.ADDR_CNTY#">
<cfhttpparam type="Formfield" name="PIGGY" value="0">
<cfhttpparam type="Formfield" name="PLEGALDESC" value="">
<cfhttpparam type="Formfield" name="POACCTNO1" value="">
<cfhttpparam type="Formfield" name="POACCTNO2" value="">
<cfhttpparam type="Formfield" name="POLENDER1" value="">
<cfhttpparam type="Formfield" name="POLENDER2" value="">
<cfhttpparam type="Formfield" name="POPHONE1" value="">
<cfhttpparam type="Formfield" name="POPHONE2" value="">
<cfhttpparam type="Formfield" name="PREV_LOAN_MO" value="">
<cfhttpparam type="Formfield" name="PREV_LOAN_YEAR" value="">
<cfhttpparam type="Formfield" name="PROPTYPE" value="SFR">
<cfhttpparam type="Formfield" name="PROP_USE_TYPE" value="Primary Residence">
<cfhttpparam type="Formfield" name="PSTATE" value="#read_all.ADDR_ST#">
<cfhttpparam type="Formfield" name="PURCHASE" value="1">
<cfhttpparam type="Formfield" name="PZIP" value="#ADDR_ZIP_CD#">
<cfhttpparam type="Formfield" name="REISSUE_RATES" value="0">
<cfhttpparam type="Formfield" name="REQUEST_ICL" value="0">
<cfhttpparam type="Formfield" name="RPTBYEMAIL" value="reckhardt@streamline-title.com">
<cfhttpparam type="Formfield" name="SAME_LENDER" value="0">
<cfhttpparam type="Formfield" name="SEARCHTYPE" value="Purchase">
<cfhttpparam type="Formfield" name="SECLOAN" value="">
<cfhttpparam type="Formfield" name="TAXID1" value="">
<cfhttpparam type="Formfield" name="TAXID2" value="">
<cfhttpparam type="Formfield" name="THIRDP" value="">
<cfhttpparam type="Formfield" name="VERIFYEMAIL" value="">
<cfhttpparam type="Formfield" name="VERIFYEMAIL_2" value="">
<cfhttpparam type="Formfield" name="VERIFYEMAIL_3" value="">
<cfhttpparam type="Formfield" name="mailing_address" value="">
<cfhttpparam type="Formfield" name="a_comment" value="">
</cfhttp>
#read_all.ADDR_STRT# - completed<BR>
<!--- #cfhttp.FileContent# --->
<cfflush>
<cfelse>
		<cfif found_dupe eq 1>
<font color="red">#read_all.ADDR_STRT# - already in system  (#find_dupe.title_id#)</font><BR>
		</cfif>

</cfif>
</cfoutput><br>
<br>
All Orders imported<br></div>
<cfflush>
</cfif>


<cfif form.file_upload neq '' and form.assign_company eq 'freddie update'>
<div align="left">Updating Orders for: <cfoutput>#get_company_info.company#</cfoutput><br><br>
<cfflush>
<cfoutput query="read_all">

<cfif read_all.ADDR_STRT neq '' and read_all.ADDR_STRT neq 'NULL' and read_all.ADDR_STRT neq ' '>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
			update title
			set loan_number = '#read_all.NBR_LN#',
			reo_number = '#read_all.ID_AST#'
			WHERE paddress = '#read_all.ADDR_STRT#' and comp_id = #get_company_info.ID#
</CFQUERY>

#read_all.ADDR_STRT# - updated<BR>
<!--- #cfhttp.FileContent# --->
<cfflush>
</cfif>
</cfoutput><br>
<br>
All Records updated<br></div>
<cfflush>
</cfif>











<cfif form.file_upload neq '' and form.assign_company eq 'fannie update'>
<div align="left">Updating Orders for: <cfoutput>#get_company_info.company#</cfoutput><br><br>
<cfflush>
<cfoutput query="read_all">

<cfif read_all.ADDR_STRT neq '' and read_all.ADDR_STRT neq 'NULL' and read_all.ADDR_STRT neq ' '>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
			update title
			set loan_number = '#read_all.NBR_LN#',
			reo_number = '#read_all.ID_AST#'
			WHERE paddress = '#read_all.ADDR_STRT#' and comp_id = #get_company_info.ID#
</CFQUERY>

#read_all.ADDR_STRT# - updated<BR>
<!--- #cfhttp.FileContent# --->
<cfflush>
</cfif>
</cfoutput><br>
<br>
All Records updated<br></div>
<cfflush>
</cfif>
</BODY>
</HTML>