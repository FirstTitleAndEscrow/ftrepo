
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="0">

<!---This is a temp view until all roles are in use --->
<CFQUERY datasource="#request.dsn#" NAME="read_role">
	SELECT role_id
	FROM First_admin
	WHERE ID = #URL.uid#
</CFQUERY>

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
	
	
	
	
				<cfif #otherpro# eq "On Hold">
				<CFQUERY DATASOURCE="#request.dsn#" name="update_on_hold">
				update Property set on_hold = 1,
				on_hold_date = #CreateODBCDateTime(Now())#
				where prop_id = #rec_id#
				</cfquery>
				
                </cfif>
				<cfif #otherpro# eq "On Hold Removed">
				<CFQUERY DATASOURCE="#request.dsn#" name="update_on_hold">
				update Property set on_hold = 0,
				on_hold_date = NULL
				where prop_id = #rec_id#
				</cfquery>
				</cfif>	
	
	
			<cfif #N_Note_1# neq "" and #N_Note_1# CONTAINS "POSTPONED">
				<CFQUERY datasource="#request.dsn#" NAME="read_com">
					select * from Title_Notes
					WHERE order_ID = #rec_id# and N_Note like 'Postponed%'
				</CFQUERY>
				
				<cfif #read_com.recordcount# eq 0>
					<CFQUERY datasource="#request.dsn#">		
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type <CFIF IsDefined("form.title") is True>, access</cfif><CFIF IsDefined("form.title2") is True>, access2</cfif>)
						VALUES('#read_uder_info.FName#', '#read_uder_info.LName#', #URL.rec_id#, <cfif #N_Note_1# neq "">'#N_Note_1#',<cfelse>'#otherpro#   <cfif IsDefined("form.on_hold_reason") and Len(form.on_hold_reason)>#form.on_hold_reason# </cfif><cfif IsDefined("form.on_hold_removed_reason") and Len(form.on_hold_removed_reason)>#form.on_hold_removed_reason# </cfif>',</cfif> '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P' <CFIF IsDefined("form.title") is True>, '#title#'</cfif><CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
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
					VALUES('#read_uder_info.FName#', '#read_uder_info.LName#', #URL.rec_id#, <cfif #N_Note_1# neq "">'#N_Note_1#',<cfelse>'#otherpro#   <cfif IsDefined("form.on_hold_reason") and Len(form.on_hold_reason)>#form.on_hold_reason# </cfif><cfif IsDefined("form.on_hold_removed_reason") and Len(form.on_hold_removed_reason)>#form.on_hold_removed_reason# </cfif>',</cfif> '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P' <CFIF IsDefined("form.title") is True>, '#title#'</cfif><CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
				</CFQUERY>	
			</cfif>
			
			<cfif #otherpro# neq "">
				<cfif #otherpro# eq "Abstract sent - waiting for contract">
                    <CFQUERY DATASOURCE="#request.dsn#">
						Update Property
						set appraisal_status = '#otherpro#'
						where prop_id = #url.rec_id#
					</CFQUERY>
                 </cfif>
				<cfif #otherpro# eq "Call for Detail">
					<CFQUERY datasource="#request.dsn#">		
						Update tax_cert_prop
						set call_detail = 1 
						where prop_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Cancelled per client">
					<CFQUERY datasource="#request.dsn#">		
						Update tax_cert_prop
						set cancelled_client = 1 
						where prop_id = #url.rec_id#
					</CFQUERY>
					
					<CFQUERY datasource="#request.dsn#">		
						Update Property
						set cancelled = 1 
						where prop_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Clear to Close">
					<CFQUERY datasource="#request.dsn#">		
						Update tax_cert_prop
						set clear_close = 1 
						where prop_id = #url.rec_id#
					</CFQUERY>
					<!---If the old message was Not Clear To Close and this was on a 
					processors screen then the data and time needs to be changed--->
					<CFQUERY datasource="#request.dsn#" NAME="Not_Clear_To_Close">
						SELECT     *
						FROM         Title_Notes
						WHERE     (N_Note = 'Not Clear To Close') and Order_ID = #url.rec_id#
					</CFQUERY>
					<CFIF #Not_Clear_To_Close.RecordCount# gte 1>
						<!---Is the Title_ID in Processing or Pre-Processing--->
						<!---If it's in neither then don't worry about it. --->
						<CFQUERY datasource="#request.dsn#" NAME="Not_Preprocessing">
							sqlPreprocessing_NotClearToClose where Title_ID = #url.rec_id#
						</CFQUERY>
						<CFIF #Not_Preprocessing.RecordCount# gte 1>
							<!---update time --->
							Update title_Closing_Order_Request_prop 
							set dateandtime = #Now()#
							where prop_ID = #rec_id#
						</CFIF>
						<CFQUERY datasource="#request.dsn#" NAME="Not_Processing">
							sqlProcessing_NotClearToClose where Title_ID = #url.rec_id#
						</CFQUERY>
						<CFIF #Not_Processing.RecordCount# gte 1>
							<!---Update time --->
							Update title
							set proc_dateandtime = #Now()#
							where prop_ID = #rec_id#
						</CFIF>
					</CFIF>							
				</cfif>
				<cfif #otherpro# eq "Court House Closed">
					<CFQUERY datasource="#request.dsn#">		
						Update tax_cert_prop
						set court_house = 1 
						where prop_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Call for Detail">
					<CFQUERY datasource="#request.dsn#">		
						Update tax_cert_prop
						set call_detail = 1 
						where prop_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "FT Shipped Pack">
					<CFQUERY datasource="#request.dsn#">		
						Update tax_cert_prop
						set ft_shipped = 1 
						where prop_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Funds Not Received">
					<CFQUERY datasource="#request.dsn#">		
						Update tax_cert_prop
						set funds_received = 1 
						where prop_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Judgments Exist">
					<CFQUERY datasource="#request.dsn#">		
						Update tax_cert_prop
						set judge_exist = 1 
						where prop_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				
				
				
				
				
				<cfif #otherpro# eq "Loan Funded">
				
				<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
<cfquery datasource="#request.dsn#">

update eventlist
set loanfun = 1,
fl_dateandtime = '#order_date_adj#'
where prop_id = #rec_ID#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			select * from first_admin
			WHERE ID = #session.ft_user_id#
		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_uder_info.FName#', '#read_uder_info.LName#', #URL.rec_id#, 'Loan Funded', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1', '1')		
		</CFQUERY>
		
<!--- send out Loan Funded Emails --->
<cfinclude template="send_loan_funded_emails_prop.cfm">
</cfif>
				
				
				<cfif #otherpro# eq "Loan Closed">
				<cfparam name="form.close_month" default="">
<cfparam name="form.close_day" default="">
<cfparam name="form.close_year" default="">
<cfparam name="form.close_time" default="">

<cfquery datasource="#request.dsn#" name="getuser">
    select * 
    from first_admin
    where id = #session.ft_user_id#
</cfquery>

<cfquery name="get_order" datasource="#request.dsn#">
    select * 
    from Property
    where prop_id = #URL.rec_id#
</cfquery>

<cfquery name="get_comp" datasource="#request.dsn#">
    select * 
    from companies
    where id = #get_order.comp_id#
</cfquery>

<cfquery name="get_list" datasource="#request.dsn#">
    select * from eventlist
    where title_id = #get_order.prop_id#
</cfquery>

<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

        <cfquery name="updateclosing" datasource="#request.dsn#">
            update Property
            set 
	        Appraisal_status = 'Loan Closed'
            where prop_id = #URL.rec_id#
        </cfquery>

        <!--- <CFSET order_date_adj = form.close_month & "/" &  form.close_day & "/" & form.close_year & " " & form.close_time> --->
		 <CFSET cl_button_pushed = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
		<cfquery name="up" datasource="#request.dsn#">
                update eventlist
                set 
	            l_date = '#DateFormat(Now(), "m/d/yyyy")#',
	            cl_dateandtime = '#cl_button_pushed#',
				cl_button_pushed = '#cl_button_pushed#',
	            l_time = '#TimeFormat(Now(), "HH:mm:ss")#'
                where prop_id = #URL.rec_id#
            </cfquery>

            <CFQUERY datasource="#request.dsn#" NAME="read_user">
		        select * 
                from first_admin
			    WHERE ID = #session.ft_user_id#
		    </CFQUERY>
		    <CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Loan Closed', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1', '1')		
		    </CFQUERY>

<cfinclude template="send_loan_closed_emails_prop.cfm">

                </cfif>
				<cfif #otherpro# eq "Name/Address found not matching order">
					<CFQUERY datasource="#request.dsn#">		
						Update tax_cert_prop
						set name_address = 1 
						where prop_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Not Clear to Close">
					<CFQUERY datasource="#request.dsn#">		
						Update tax_cert_prop
						set not_clear_close = 1 
						where prop_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "OK to fund">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set ok_fund = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Order Reinstated">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set order_reinstate = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Package Received">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set package_recieve = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Package Due/Unrec.">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set package_due = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Pre-Funding Completed">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set pre_funding = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Pre-Funding Problem">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set funding_prob = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Subordination Needed">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set subordination_need = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Subordination Received">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set subordination_received = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Supervisor Notification">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set supervisor_notify = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Unreleased Mortgages Exists">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set unreleased_mort = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Vesting Issue">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set vesting_issue = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Waiting on Judgment Info">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set waiting_judgment = 1 
					where prop_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Waiting on Tax Info.">
				<CFQUERY datasource="#request.dsn#">		
					Update tax_cert_prop
					set waiting_tax = 1 
					where prop_id = #url.rec_id#
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
				update doc_abstract_prop
				set vendor_Date = '#read_info.n_date#',
				vendor_Time = '#read_info.n_time#'
				where prop_ID = #URL.rec_id#
			</CFQUERY>	
		</cfif>
		<cfif #read_info.n_note# eq "Not Clear to Close">
			<CFQUERY datasource="#request.dsn#">		
				Update doc_title_insurance_prop
				set clear_close = null 
				where prop_id = #url.rec_id#
			</CFQUERY>	
		</cfif>
		<cfif #read_info.n_note# eq "Order Reinstated">
			<CFQUERY datasource="#request.dsn#">		
				Update Property
				set cancelled = null 
				where prop_id = #url.rec_id#
			</CFQUERY>	
		</cfif>
		<cfif #read_info.n_note# eq "Cancelled per client">
		<CFQUERY datasource="#request.dsn#">		
				Update Property
				set cancelled = 1 
				where prop_id = #url.rec_id#
			</CFQUERY>	
		</cfif>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_notes">		
			SELECT *
			FROM Title_Notes
			WHERE order_id = #URL.rec_id# and note_type = 'P' and N_Note = 'Clear to Close'
		</CFQUERY>	
		
		<cfif #read_notes.recordcount# GT 0>
			<CFQUERY datasource="#request.dsn#">		
				Update Title_Notes
				set status = 1 
				where note_id = #read_info.note_id# and N_Note != 'Clear to Close'
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#">		
				Update doc_title_insurance_prop
				set clear_close = 1 
				where prop_id = #url.rec_id#
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
			FROM Property
			Where prop_id = #rec_id#
		</CFQUERY>		
		<CFQUERY datasource="#request.dsn#" NAME="read_company">		
			SELECT team_id
			FROM companies
			Where ID = #read_email.comp_id#
		</CFQUERY>		
<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_company.team_id#">
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
	
		<CFIF IsDefined("form.title") is True>	
        
			<CFSWITCH EXPRESSION="#read_email.comp_id#">			
    <CFCASE VALUE = 115>
        <cfset Sendemail = "False">
    </CFCASE>
    <CFCASE VALUE = 621>
        <cfset Sendemail = "False">
    </CFCASE>    
<CFDEFAULTCASE>
<CFMAIL
TO="#read_email.p_email#"
FROM="#team_email#" Subject="Comment has been added by your First Title team for order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
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
			
			</CFDEFAULTCASE>
</CFSWITCH>
            
		</cfif>
<!---Put Note here --->
<cfif #read_info.N_note# eq "Commitment Sent Taxes to Follow">
			<CFMAIL
TO="akumar@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com" Subject=" order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
TIMEOUT="600"
>

Binder Sent with Updated Tax Info.

			</cfmail>
</cfif>
			
<cfif #read_info.N_note# eq "Supervisor Notification">
			<CFMAIL
TO="webmaster@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com" Subject="Supervisor Notification comment has been added for order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
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
		
		
		<cfif #email# neq "" >
			
			<CFMAIL
TO="#email#"
FROM="#team_email#"
Subject="First Title comment for order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
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
		
		
	</cfif>
</cfif>

<!--- Read all of the Notes for this title --->
<CFQUERY datasource="#request.dsn#" NAME="read_notes">		
	SELECT *
	FROM Property
	Where prop_id = #rec_id#
</CFQUERY>
			
<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">		
	SELECT *
	FROM Title_Notes
	Where N_Note is not null AND Order_Id = #URL.rec_id#  <!--- and note_type = 'P' ---> 
	and N_Date > #DateADD("yyyy", -7, Now())#
	ORDER BY Note_ID ASC
</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_vendor_notes">		
	SELECT *
	FROM Title_Notes
	Where N_Note is not null AND Order_Id = #URL.rec_id# and note_type = 'VP'
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

if (document.frm.otherpro.value == 'On Hold') {
document.getElementById('on_hold_table').style.display = 'block';
} else {
document.getElementById('on_hold_table').style.display = 'none';
 }
 
 if (document.frm.otherpro.value == 'On Hold Removed') {
document.getElementById('on_hold_removed_table').style.display = 'block';
} else {
document.getElementById('on_hold_removed_table').style.display = 'none';
 } 

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

<script type="text/javascript">
function holdcheck() {
 }
 
 //break insertion function
 function insertBreak() {

 N_Note_1.replace(/[\r]/g, '<br>');
 
 }
 
</script>
<style>
.latest_Notes { table-layout: fixed;  word-wrap: break-word; }
</style>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=580 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=590 align=center valign=top>
			<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<td width=590 align=center valign=top bgcolor=e1e1e1>
					<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
						<tr>
							<td width=590  align=right valign=top bgcolor=e1e1e1>
								<cfif #read_all_notes.recordcount# GT 0>
									<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
										<TR>
											<TD>
										<CFIF #read_role.role_id# neq "">
											<CFINCLUDE TEMPLATE="./includes/menu_header_small.cfm">
										</CFIF>
											</TD>
										</TR>
										<tr>
											<td width=590 align=center valign=top bgcolor=e1e1e1>
												<B><font face=verdana size=2 color=blue>Processing Notes</FONT></B>
											</td>
										</tr>
									</table>
								</cfif>
<CFOUTPUT QUERY="Read_all_notes">
									<table class="latest_Notes" width=650 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
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
												<font face=verdana size=1 color=black>#N_Note#
											</td>
										</tr>
									</table>
</CFOUTPUT>
<cfif #Read_vendor_notes.recordcount# GT 0>
									<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
										<tr>
											<td width=590 align=center valign=top bgcolor=e1e1e1>
												<B><font face=verdana size=2 color=blue>Vendor Management Notes</FONT></B>
											</td>
										</tr>
									</table>
</cfif>
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
<CFFORM NAME="frm" ACTION="./prop_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#url.rec_id#&a_trigger=1&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=1" METHOD=POST>
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
                                                <option value="Abstract sent - waiting for contract">Abstract sent - waiting for contract</OPTION>
												<option value="Call for Detail">Call for Detail</OPTION>
												<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
												<option value="Clear to Close">Clear to Close</OPTION>
												<option value="Commitment Resent Tax Data Now Complete" style="thin">Commitment Resent Tax Data Now Complete</OPTION>
												<option value="Commitment Sent Taxes to Follow" style="thin">Commitment Sent Taxes to Follow</OPTION>
												<option value="Court House Closed">Court House Closed</OPTION>
												<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
												<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>	
												<option value="Judgments Exist">Judgments Exist</OPTION>
												<option value="Loan Closed">Loan Closed</OPTION>
												<option value="Loan Funded">Loan Funded</OPTION>
												<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
												<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
												<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
												<option value="Not Clear to Close">Not Clear to Close</OPTION>
												<option value="OK to fund" style="thin">OK to fund</OPTION>
   												<option value="On Hold" style="thin">On Hold</OPTION>
   												<option value="On Hold Removed" style="thin">On Hold Removed</OPTION>
   												<option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   												<option value="Package Received" style="thin">Package Received</OPTION>  
   												<option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
   												<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>	
   												<option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
												<option value="Subordination Needed">Subordination Needed</OPTION>
												<option value="Subordination Received">Subordination Received</OPTION>
												<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
												<option value="THIS FILE WILL BE CLEARED BY " style="thin">THIS FILE WILL BE CLEARED BY </OPTION>
												<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
												<option value="Vesting Issue">Vesting Issue</OPTION>
    											<option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
												<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>		
	 	 										<option value=""></option>
											  </select> 
											  <br>
<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="on_hold_table" name="on_hold_table">
					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="maroon">
							<b>Please type in the reason this file in being placed On Hold:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="on_hold_reason"  ID="on_hold_reason" style="font-size: 9;
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
									clear: none; width:200px;" value="">
						</TD>
					</tr>
</table>
<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="on_hold_removed_table" name="on_hold_removed_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="maroon">
							<b>Please type in the reason the On Hold is being removed:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="on_hold_removed_reason" ID="on_hold_removed_reason" style="font-size: 9;
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
									clear: none; width:200px;">
						</TD>
					</tr>
</table>
	
	 	 										<br><br><font face=verdana size=1 color=blue>Or type additional comments below and click "Add" <br><br>
	  	  
												<TEXTAREA id="NotesBox" name="N_Note_1" onFocus=cant_edit(this) COLS=80 ROWS=5 onkeyup="insertBreak()"
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
												<br>
												Email address to send note to: 
						 <INPUT TYPE=TEXT NAME="email" VALUE="" MaxLength=300 Size=50
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
<br><br>
		<a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a>	
	</td>
</tr>

	</table>

			
			</TD>
		</TR>


	</table>
</CFFORM>	
</BODY>
</HTML>