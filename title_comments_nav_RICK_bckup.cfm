
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="0">

		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->



		<CFIF #A_Update_DB_Flag# GT "0">


			<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">
				SELECT *
				FROM First_Admin
				WHERE ID = #URL.uid#
			</CFQUERY>
		<cfif #N_Note_1# neq "" or #otherpro# neq "">

			<cfif #N_Note_1# neq "" and #N_Note_1# CONTAINS "POSTPONED">


						<CFQUERY datasource="#request.dsn#" NAME="read_com">

			select * from Title_Notes
			WHERE order_ID = #rec_id# and N_Note like 'Postponed%'

		</CFQUERY>

			<cfif #read_com.recordcount# eq 0>

		<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type <CFIF IsDefined("form.title") is True>, access</cfif><CFIF IsDefined("form.title2") is True>, access2</cfif>)
				VALUES('#read_uder_info.FName#', '#read_uder_info.LName#', #URL.rec_id#, <cfif #N_Note_1# neq "">'#N_Note_1#',<cfelse>'#otherpro#',</cfif> '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T' <CFIF IsDefined("form.title") is True>, '#title#'</cfif><CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)
			</CFQUERY>

<cfelse>
		<cfquery datasource="#request.dsn#">
update Title_Notes
set  N_Note = '#N_Note_1#',
N_Date = '#DateFormat(Now(), "m/d/yyyy")#',
 N_Time = '#TimeFormat(Now(), "HH:mm:ss")#',
 access = '1',
 access2 = '1'
where order_ID = #rec_id# and N_Note like 'Postponed%'
</cfquery>


</cfif>


		<cfelse>
			<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type <CFIF IsDefined("form.title") is True>, access</cfif><CFIF IsDefined("form.title2") is True>, access2</cfif>)
				VALUES('#read_uder_info.FName#', '#read_uder_info.LName#', #URL.rec_id#, <cfif #N_Note_1# neq "">'#N_Note_1#',<cfelse>'#otherpro#',</cfif> '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T' <CFIF IsDefined("form.title") is True>, '#title#'</cfif><CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)
			</CFQUERY>


		</cfif>


			<cfif #otherpro# neq "">
			<cfif #otherpro# eq "Call for Detail">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set call_detail = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Cancelled per client">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set cancelled_client = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Clear to Close">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set clear_close = 1
				where title_id = #url.rec_id#
			</CFQUERY>

<!--- new Vendor Manager --->
<CFQUERY datasource="#request.dsn#" NAME="find_new_vendor">
select vendor_id from Vendor_Tracker_New
where Order_id = #url.rec_ID#
and task = 'Review'
and (completed = 0 or completed IS NULL)
</cfquery>
<cfif find_new_vendor.recordcount gt 0>
<CFQUERY datasource="#request.dsn#" NAME="find_new_vendor_info">
select company from Vendors_Stacie
where vendor_id = #find_new_vendor.vendor_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New
set return_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
return_time = '#TimeFormat(Now(), "HH:mm:ss")#',
completed = 1
where Order_id = #url.rec_ID#
and task = 'Review'
and completed is NULL
</cfquery>
<CFQUERY datasource="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #url.rec_ID#, 'Title Review Completed by #find_new_vendor_info.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
</cfif>
<!--- new vendor manager end --->
		</cfif>
		<cfif #otherpro# eq "Court House Closed">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set court_house = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Call for Detail">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set call_detail = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "FT Shipped Pack">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set ft_shipped = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Funds Not Received">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set funds_received = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Judgments Exist">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set judge_exist = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Name/Address found not matching order">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set name_address = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Not Clear to Close">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set not_clear_close = 1
				where title_id = #url.rec_id#
			</CFQUERY>
<!--- new Vendor Manager --->
<CFQUERY datasource="#request.dsn#" NAME="find_new_vendor">
select vendor_id from Vendor_Tracker_New
where Order_id = #url.rec_ID#
and task = 'Review'
and (completed = 0 or completed IS NULL)
</cfquery>
<cfif find_new_vendor.recordcount gt 0>
<CFQUERY datasource="#request.dsn#" NAME="find_new_vendor_info">
select company from Vendors_Stacie
where vendor_id = #find_new_vendor.vendor_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New
set return_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
return_time = '#TimeFormat(Now(), "HH:mm:ss")#',
completed = 1
where Order_id = #url.rec_ID#
and task = 'Review'
and completed is NULL
</cfquery>
<CFQUERY datasource="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #url.rec_ID#, 'Title Review Completed by #find_new_vendor_info.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
</cfif>
<!--- new vendor manager end --->
		</cfif>
		<cfif #otherpro# eq "OK to fund">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set ok_fund = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Order Reinstated">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set order_reinstate = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>

		<cfif #otherpro# eq "Package Received">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set package_recieve = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Package Due/Unrec.">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set package_due = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>



		<cfif #otherpro# eq "Pre-Funding Completed">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set pre_funding = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>

		<cfif #otherpro# eq "Pre-Funding Problem">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set funding_prob = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Subordination Needed">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set subordination_need = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Subordination Received">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set subordination_received = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Supervisor Notification">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set supervisor_notify = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Unreleased Mortgages Exists">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set unreleased_mort = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Vesting Issue">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set vesting_issue = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Waiting on Judgment Info">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set waiting_judgment = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #otherpro# eq "Waiting on Tax Info.">
		<CFQUERY datasource="#request.dsn#">
				Update tax_cert_title
				set waiting_tax = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
			</cfif>

			<CFQUERY datasource="#request.dsn#" NAME="read_info">
				SELECT *
				FROM Title_Notes
				WHERE N_date = '#DateFormat(Now(), "m/d/yyyy")#' AND N_Time = '#TimeFormat(Now(), "HH:mm:ss")#' and order_id = #url.rec_id#
			</CFQUERY>
			<cfif #read_info.access2# eq 1>
			<CFQUERY datasource="#request.dsn#">
				update doc_abstract_title
				set vendor_Date = '#read_info.n_date#',
				vendor_Time = '#read_info.n_time#'
			where title_ID = #URL.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #read_info.n_note# eq "Not Clear to Close">
		<CFQUERY datasource="#request.dsn#">
				Update doc_title_insurance_title
				set clear_close = null
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #read_info.n_note# eq "Order Reinstated">
		<CFQUERY datasource="#request.dsn#">
				Update title
				set cancelled = null
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #read_info.n_note# eq "Cancelled per client">
		<CFQUERY datasource="#request.dsn#">
				Update title
				set cancelled = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_notes">
				SELECT *
				FROM Title_Notes
				WHERE order_id = #URL.rec_id# and N_Note = 'Clear to Close'
			</CFQUERY>
			<cfif #read_notes.recordcount# GT 0>
		<CFQUERY datasource="#request.dsn#">
				Update Title_Notes
				set status = 1
				where note_id = #read_info.note_id# and N_Note != 'Clear to Close'
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#">
				Update doc_title_insurance_title
				set clear_close = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		<cfelse>
		<CFQUERY datasource="#request.dsn#">
				Update Title_Notes
				set status = 1
				where note_id = #read_info.note_id# and N_Note != 'Clear to Close'
			</CFQUERY>

		</cfif>

	<CFQUERY datasource="#request.dsn#" NAME="read_email">
				SELECT *
				FROM Title
				Where title_id = #rec_id#
			</CFQUERY>
	<CFIF IsDefined("form.title") is True>
		<cfif (#read_email.comp_id# eq "115") OR (#read_email.comp_id# eq "621")>


<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
				SELECT *
				FROM Companies
				Where ID = #read_email.comp_id#
			</CFQUERY>

<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_comp.team_id#">

<CFMAIL
TO="#read_email.p_email#"
FROM="#team_email#"
Subject="Comment has been added by your First Title team for order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
TIMEOUT="600"
>

The following comment below has been noted regarding the above referenced file:

Comment entered by: #read_info.FName#  #read_info.lName#
Date and time entered: #read_info.n_date#  #read_info.n_time#

Comment: <cfif #N_Note_1# neq "">'#N_Note_1#'<cfelse>'#otherpro#'</cfif>

Please contact your First Title processing contact with any questions.
Thank you.

First Title staff

</cfmail>
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>
			</cfif></cfif>

			<cfif #read_info.N_note# eq "Supervisor Notification">

			<CFMAIL
TO="webmaster@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Supervisor Notification comment has been added for order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
TIMEOUT="600"
>

The following comment below has been noted regarding the above referenced file:

Comment entered by: #read_info.FName#  #read_info.lName#
Date and time entered: #read_info.n_date#  #read_info.n_time#

Comment: <cfif #N_Note_1# neq "">'#N_Note_1#'<cfelse>'#otherpro#'</cfif>

Thank you.

#read_info.FName#  #read_info.lName#

</cfmail>
			</cfif>


			</cfif></cfif>
	<!--- <cfif #otherpro# neq "">
				<CFQUERY datasource="#request.dsn#">
				Update Title
				set FName = '#read_uder_info.FName#',
				lName = '#read_uder_info.lName#',
				<CFIF IsDefined("form.title") is True>n_status = 1,</cfif>
				<CFIF IsDefined("form.title2") is True>v_status = 2,</cfif>
				n_date = '#DateFormat(Now(), "m/d/yyyy")#',
				n_time = '#TimeFormat(Now(), "HH:mm:ss")#',
				comments = '#otherpro#'
				where title_id = #rec_id#
			</CFQUERY>

				<CFQUERY datasource="#request.dsn#" NAME="read_email">
				SELECT *
				FROM Title
				Where title_id = #rec_id#
			</CFQUERY>

			</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_info">
				SELECT *
				FROM Title_Notes
				WHERE N_date = '#DateFormat(Now(), "m/d/yyyy")#' AND N_Time = '#TimeFormat(Now(), "HH:mm:ss")#' and order_id = #url.rec_id#
			</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_notes">
				SELECT *
				FROM Title_Notes
				WHERE order_id = #URL.rec_id# and N_Note LIKE '%Clear to Close%'
			</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_info">
				SELECT *
				FROM Title_Notes
				WHERE N_date = '#DateFormat(Now(), "m/d/yyyy")#' AND N_Time = '#TimeFormat(Now(), "HH:mm:ss")#' and order_id = #url.rec_id#
			</CFQUERY>

--->

	<!--- Read all of the Notes for this title --->
	<CFQUERY datasource="#request.dsn#" NAME="read_notes">
				SELECT *
				FROM Title
				Where title_id = #rec_id#
			</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where N_Note is not null AND Order_Id = #URL.rec_id# and note_type = 'T'
				ORDER BY Note_ID ASC
			</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_vendor_notes">
				SELECT *
				FROM Title_Notes
				Where N_Note is not null AND Order_Id = #URL.rec_id# and note_type = 'V'
				ORDER BY Note_ID ASC
			</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>


<script type="text/javascript">
function cant_edit(box)
{
if (frm.otherpro.value != '') {

  alert("You can't type in this box since you have selected a comment in the select box.");
  box.blur();
 return true;
 }
}
</script>
<script type="text/javascript">
function change_it(box)
{
if (frm.otherpro.value != '') {
document.frm.N_Note_1.value = '';
 return true;
 }
}
</script>
<script type="text/javascript">
function clientcheck()
{
      alert("This note will go to client as well. Be sure that this is intended.");
   }
</script>
<script type="text/javascript">
function vendorcheck()
{
alert("This note will go to vendor as well. Be sure that this is intended.");
}
</script>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=590 align=center valign=top>

<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

		<td width=590 align=center valign=top bgcolor=e1e1e1>


<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


		<tr>
			<td width=590  align=right valign=top bgcolor=e1e1e1>



<cfif #read_all_notes.recordcount# GT 0>
<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=590 align=center valign=top bgcolor=e1e1e1>
		<B><font face=verdana size=2 color=blue>Processing Notes</FONT></B>
</td></tr></table></cfif>




<CFOUTPUT QUERY="Read_all_notes">

	<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#DateFormat(N_Date, "mm/dd/yyyy")#
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#TimeFormat(N_Time, "HH:mm:ss")#
					</td>
					<td width=125 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#Fname# #LName#
					</td>

				<tr>
			</table>

		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#N_Note#</PRE>
		</td>
	</tr>
</table>

</CFOUTPUT>
<cfif #Read_vendor_notes.recordcount# GT 0>
<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=590 align=center valign=top bgcolor=e1e1e1>
		<B><font face=verdana size=2 color=blue>Vendor Management Notes</FONT></B>
</td></tr></table></cfif>
<CFOUTPUT QUERY="Read_vendor_notes">

	<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>

		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#DateFormat(N_Date, "mm/dd/yyyy")#
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#TimeFormat(N_Time, "HH:mm:ss")#
					</td>
					<td width=125 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#Fname# #LName#
					</td>
				<tr>
			</table>

		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#N_Note#</PRE>
		</td>
	</tr>
</table>

</CFOUTPUT>

<p>

<CFFORM NAME="frm" ACTION="./Title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#url.rec_id#&a_trigger=1&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=1" METHOD=POST>

	<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=590 align=center valign=top bgcolor=green>
				<font face=verdana size=1 color=white>
				<b>Add Comments for order <CFOUTPUT>#url.rec_id#</CFOUTPUT></a>
		</tr>
		<tr>
			<td width=590 align=center valign=top bgcolor=yellow>
				<font face=verdana size=1 color=red>
				<b>NOTE: PLEASE USE FIXED COMMENTS THAT APPLY. OTHERWISE, REPORTING WILL BE INCORRECT
		</tr>
		<tr>
			<td width=590 align=left valign=top bgcolor=e1e1e1>
		<font face=verdana size=1 color=blue>
		<br>Select a standard event here </font>
				<select name="otherpro" onChange=change_it(this)
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
	  <option value="">Select</OPTION>
	<option value="Call for Detail">Call for Detail</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
	<option value="Clear to Close">Clear to Close</OPTION>
	<option value="Court House Closed">Court House Closed</OPTION>
	<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
	<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>
	<option value="Judgments Exist">Judgments Exist</OPTION>
	<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
   <option value="Not Clear to Close">Not Clear to Close</OPTION>
   <option value="OK to fund" style="thin">OK to fund</OPTION>
   <option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   <option value="Package Received" style="thin">Package Received</OPTION>
   <option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>
   <option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
	<option value="Subordination Needed">Subordination Needed</OPTION>
	<option value="Subordination Received">Subordination Received</OPTION>
	<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
	<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	<option value="Vesting Issue">Vesting Issue</OPTION>
    <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
	<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value=""></option>
	  </select> <br><br><font face=verdana size=1 color=blue>Or type additional comments below and click "Add" <br><br>


				<TEXTAREA name="N_Note_1" onFocus=cant_edit(this) COLS=80 ROWS=5
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
		</tr>


	<tr>
			<td width=590 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=1 color=black>
				<b><INPUT TYPE="checkbox" NAME="title" VALUE=1 onClick="clientcheck();"> Check this box if you would like to send the entered note to client
		</tr>
		<tr>
			<td width=590 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=1 color=black>
				<b><INPUT TYPE="checkbox" NAME="title2" VALUE=1 onClick="vendorcheck();"> Check this box if you would like to send the entered note to vendor
		</tr>
		<tr>
			<td width=590 align=right valign=top bgcolor=e1e1e1>
				<input type=image src="./images/button_add.gif" border=0>
		</tr>


	</table>

</table>
			</td>
		</tr>
</table>

				</FORM>
<p>
<p>

<!---<font size=2 color=blue face=arial>
		<cfoutput>
		Click here to go back to the main page.<A HREF="./title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#url.rec_id#&a_trigger=1">
		<img src="./images/button_return.gif" border=0 ALT="Click this button to return to main"></a>
	 </cfoutput>

 &user_id=#user_id#&company_id=#url.company_id#&title_id=#url.title_id#&oda_year=#url.oda_year#&oda_day=#url.oda_day#&oda_month=#url.oda_month#&comments=#url.comments#&appraisal_status=#url.appraisal_status#&sortorder=#url.sortorder#&buyer_fname=#url.buyer_fname#&buyer_lname=#url.buyer_lname# --->

<br><br>
<a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a>
</td>
</tr>

	</table>


			</TD>
		</TR>

	</table>
</CFFORM>
<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</HTML>


