<cfset objChase = CreateObject('component','cfc.chaseRealEC')>
<CFPARAM NAME="CODE" DEFAULT="T">
<CFPARAM NAME="form.otherpro" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_email_1" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_email_2" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_email_3" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_fname_1" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_fname_2" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_fname_3" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_lname_1" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_lname_2" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_lname_3" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_1" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_2" DEFAULT="">
<CFPARAM NAME="form.lender_realtor_3" DEFAULT="">
<CFPARAM NAME="read_title.realEC_transactionID" DEFAULT="">
<CFPARAM NAME="form.hud_signed" DEFAULT="0">
<CFPARAM NAME="form.waiver_signed" DEFAULT="0">
<CFPARAM NAME="form.realec_curative" DEFAULT="0">
<CFPARAM NAME="form.action_needed" DEFAULT="0">
<CFPARAM NAME="form.delay_code" DEFAULT="">
<CFPARAM NAME="form.new_hud_closing_date" DEFAULT="">
<cfset melanies_companies_list = "9711,10436,9810,10402,10497,1754">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_id">
	SELECT title_id, comp_id, equator_title_transactionID, equator_closing_transactionID, realec_transactionid, closingInsight_transactionId from title where title_id = #rec_id#
</CFQUERY>

<cfquery name="getorderinfo" DATASOURCE="#request.dsn#">
SELECT *
FROM Title_Closing_Order_Request
Where Title_Id = #rec_id#
</cfquery>

<cfif getorderinfo.multiple_sets EQ 1>
	<cfset dsprodID = 285>
<cfelse>
	<cfset dsprodID = 284>
</cfif>

<cfif url.code eq 'A'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_id">
	SELECT app_id, comp_id, closingInsight_transactionId from appraisal  where app_id = #rec_id#
</CFQUERY>
<cfelseif url.code eq 'P'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_id">
	SELECT prop_id, prop_id as title_id, comp_id, equator_title_transactionID, realec_transactionid, closingInsight_transactionId from Property where prop_id = #rec_id#
</CFQUERY>
<cfelse>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_id">
	SELECT title_id, comp_id, equator_title_transactionID, equator_closing_transactionID, realec_transactionid, closingInsight_transactionId from title where title_id = #rec_id#
</CFQUERY>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_comp_id">
	SELECT team_id, ID, IntSales, streamline_client, send_post_close_survey from companies where id = #read_id.comp_id#
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="realec_reasons">
	SELECT * from ChaseRealEC_ReasonCodes
	<!---where code IN (6,34,61,56,120,122,123,124,125,126,127,128)--->
	order by reason
</CFQUERY>

<cfif read_comp_id.send_post_close_survey eq 'True'>
<cfif (form.otherpro eq 'Loan Closed')
and form.lender_realtor_email_1 eq ''
and form.lender_realtor_email_2 eq ''
and form.lender_realtor_email_3 eq ''
>
<!---
<script type="text/javascript">
alert("Please fill out at least one entry in the 'Realtors/Lenders' section, so that we may send out the Post-Closing Survey");
history.back();
</script>
--->
<cfelseif (form.otherpro eq 'Loan Closed' or form.otherpro eq 'Loan Funded' or form.otherpro eq 'Loan Closed-Seller Rep')>
	
				
				

<CFQUERY DATASOURCE="#request.dsn#" NAME="update_emails">
	update title
	set
	lender_realtor_fname_1 = '#form.lender_realtor_fname_1#',
	lender_realtor_lname_1 = '#form.lender_realtor_lname_1#',
	lender_realtor_email_1 = '#form.lender_realtor_email_1#',
	lender_realtor_fname_2 = '#form.lender_realtor_fname_2#',
	lender_realtor_lname_2 = '#form.lender_realtor_lname_2#',
	lender_realtor_email_2 = '#form.lender_realtor_email_2#',
	lender_realtor_fname_3 = '#form.lender_realtor_fname_3#',
	lender_realtor_lname_3 = '#form.lender_realtor_lname_3#',
	lender_realtor_email_3 = '#form.lender_realtor_email_3#'
	where title_id = #rec_id#
</CFQUERY>

				


</cfif>
</cfif>



<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="0">
<CFPARAM NAME="read" DEFAULT="">
<CFPARAM NAME="url.rec_type" DEFAULT="">
<CFPARAM NAME="code" DEFAULT="">
<CFPARAM NAME="otherpro" DEFAULT="">
<CFPARAM NAME="email" DEFAULT="">

<!---<cfoutput> Record ID :#rec_id#</cfoutput>
<cfabort>--->

<cfset cmPlace=Find(',',rec_id)-1>
<cfif cmPlace gt 0>
	<cfset rec_id=Left(rec_id,cmPlace)>
</cfif>

<cfif url.rec_type eq 'app'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_id">
	SELECT app_id, comp_id, closingInsight_TransactionID from Appraisal where app_id = #rec_id#
</CFQUERY>
<cfelseif url.rec_type eq 'prop' or url.rec_type eq 'P' or code eq 'P'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_id">
	SELECT prop_id, prop_id as title_id, comp_id, equator_title_transactionID, realec_transactionid, closingInsight_TransactionID from Property where prop_id = #rec_id#
</CFQUERY>
<cfelse>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_id">
	SELECT title_id, comp_id, equator_title_transactionID, equator_closing_transactionID, realec_transactionid, closingInsight_TransactionID from title where title_id = #rec_id#
</CFQUERY>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_comp_id">
	SELECT team_id, ID, IntSales, send_post_close_survey from companies where id = #read_id.comp_id#
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="sales_email">
	SELECT email, closing_emails from First_Admin where id = #read_comp_id.intSales#
</CFQUERY>

<cfif read_comp_id.team_id eq 18>
<cfset title_co_name = "Axiom Title">
<cfelse>
<cfset title_co_name = "First Title">
</cfif>

<cftry>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_comp_id.team_id#">
<cfsetting enableCFoutputOnly = "no">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul><br>
Team ID: #read_comp_id.team_id#<br>
Comp _ID: #read_comp_id.team_id#<br>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>

<cfif #read_id.recordcount# eq 0>
<cfset #read# = 1>
</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_role">
	SELECT role_id, email
	FROM First_admin
	WHERE ID = #session.ft_user_id#
</CFQUERY>

		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->


<CFIF #A_Update_DB_Flag# GT "0">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_uder_info">
		SELECT *
		FROM First_Admin
		WHERE ID = #session.ft_user_id#
	</CFQUERY>


<cfif otherpro eq 'Not Clear to Close'>
<cfset form.title = 1>
<cfif Len(read_title.realec_transactionID)>
	<cfset objChase.addTurnTimeEvent(title_id=url.rec_id,event_type="marker",event_description="not_cleared")>
</cfif>
</cfif>



<cfif otherpro eq 'Title Policy Disclosure Complete'>
				<CFQUERY DATASOURCE="#request.dsn#" NAME="set_notify">
					update title
					set tpd_complete = 1
					WHERE title_ID = #rec_id#
				</CFQUERY>
</cfif>







<cfif otherpro eq 'Notify Me when Closing is Scheduled'>
<cfif url.code eq 'T'>
				<CFQUERY DATASOURCE="#request.dsn#" NAME="set_notify">
					update title
					set notify_closing_email = '#form.notify_closing_email#',
					 notify_closing_reason = '#form.notify_closing_reason#'
					WHERE title_ID = #rec_id#
				</CFQUERY>

<cfelseif url.code eq 'P'>
				<CFQUERY DATASOURCE="#request.dsn#" NAME="set_notify">
					update Property
					set notify_closing_email = '#form.notify_closing_email#',
					 notify_closing_reason = '#form.notify_closing_reason#'
					WHERE prop_ID = #rec_id#
				</CFQUERY>
</cfif>
<cfset otherpro = 'The following email address(es) have been requested<BR>to receive notification of closing scheduled:<BR>'>
<cfset otherpro = #otherpro# & #form.notify_closing_email#>
<cfset otherpro = #otherpro# & '<BR>Reason:<BR>'>
<cfset otherpro = #otherpro# & #form.notify_closing_reason#>
</cfif>


<cfif #N_Note_1# neq "" or #otherpro# neq "">

				<cfif #form.otherpro# eq "Flagstar Docs Recorded">
				<cfset form.otherpro = form.otherpro & ' ' & #form.docs_recorded_date#>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set docs_recorded_date  = '#form.docs_recorded_date#'
						where title_id = #url.rec_id#
					</CFQUERY>
</cfif>
				<cfif #form.otherpro# eq "Flagstar Security Instrument Received">
				<cfset form.otherpro = form.otherpro & ' ' & #form.sec_inst_date#>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set sec_inst_date  = '#form.sec_inst_date#'
						where title_id = #url.rec_id#
					</CFQUERY>
</cfif>

				<cfif #form.otherpro# eq "Flagstar HUD Requested">
				<cfset form.otherpro = form.otherpro & ' ' & #DateFormat(CreateODBCDateTime(Now()), "mm/dd/yyyy")#>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set flagstar_hud_req  = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
</cfif>

				<cfif #form.otherpro# eq "Flagstar HUD Completed">
				<cfset form.otherpro = form.otherpro & ' ' & #DateFormat(CreateODBCDateTime(Now()), "mm/dd/yyyy")#>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set flagstar_hud_completed  = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
</cfif>


				<cfif #form.otherpro# eq "Flagstar Policy Issued">
				<cfset form.otherpro = form.otherpro & ' ' & #CreateODBCDateTime(Now())#>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set flagstar_policy_issued  = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
</cfif>

<!--- --Edit (Start) Added by Synechron Development for ticket# 702 and 727 -------------------------------------------------------------------------- --->
	<cfif #form.otherpro# eq "Problem Alert - Customer Service" OR #form.otherpro# eq "Problem Alert - Processing" OR #form.otherpro# eq "Problem Solved - Customer Service" OR #form.otherpro# eq "Problem Solved - Processing" >
			<cfset N_ProblemResolvedNote=#form.otherpro# & " - " & #form.txtprobalert# />
	<cfelse>
			<cfset N_ProblemResolvedNote="" />
	</cfif>
	<cfif #form.otherpro# eq "Problem Alert - Customer Service" OR #form.otherpro# eq "Problem Solved - Customer Service">
			<cfset SendTeamEmail=0>
	<cfelseif #form.otherpro# eq "Problem Alert - Processing" OR #form.otherpro# eq "Problem Solved - Processing">
			<cfset SendTeamEmail=1>
	<cfelse>
			<cfset SendTeamEmail="">
	</cfif>
	

<!--- --Edit (End) Added by Synechron Development for ticket# 702 and 727 -------------------------------------------------------------------------- --->
<cfif #otherpro# eq "Loan Closed">
<cfinclude template="loan_closed_code.cfm">
</cfif>

<cfif #otherpro# EQ "Docs Sent For Recording">
	<cfquery datasource="#request.dsn#">
		update eventlist
		set dsfr_dateandtime = '#docs_recorded_datetime#'
		where title_id = #rec_ID#
	</cfquery>
</cfif>
<cfif #otherpro# EQ "Final HUD/Wire Confirmation Sent">
	<cfquery datasource="#request.dsn#">
		update eventlist
		set hw_dateandtime = '#hud_wire_datetime#'
		where title_id = #rec_ID#
	</cfquery>
</cfif>
<cfif #otherpro# EQ "Confirmed Closing with LandSafe">
	<cfquery datasource="#request.dsn#">
		update eventlist
		set cc_dateandtime = '#confirmed_closing_datetime#'
		where title_id = #rec_ID#
	</cfquery>
</cfif>

<cfif #otherpro# eq "Loan Funded">
	<cfif #otherpro# eq "Loan Funded" AND Len(read_id.realec_transactionid)>
		<cfset documentInfo = StructNew()>
		<cfset objChase.processEvent(eventCode=734, firstTitleSending=1,  productCode=29, title_id=#url.rec_id#,documentInfo=documentInfo)>
	</cfif>
<cfinclude template="loan_funded_code.cfm">
<!--- send out Loan Funded Emails --->
<cfinclude template="send_loan_funded_emails.cfm">
</cfif>

	<!--- add a checkbox for "Curative Issue RealEC", so if they fillout a comment and check that box, then that would also send a 492 event --->
	<cfif form.realec_curative eq 1>
		<cfset reasonInfo = structNew()>
		<cfset reasonInfo.responsibleParty = "CUSTOMER">
		<cfset reasonInfo.responsibleType="At Closing">
	<cfset objChase.processEvent(eventcode=492, productCode=#form.realec_productCode#, title_id=#url.rec_id#, firstTitleSending=1, comment='Curative Issue #N_Note_1# #otherpro#',reasonInfo=reasonInfo,reasonCode=6)>
	</cfif>


			<cfif #N_Note_1# neq "" and #N_Note_1# CONTAINS "POSTPONED">
				<CFQUERY DATASOURCE="#request.dsn#" NAME="read_com">
					select * from Title_Notes
					WHERE order_ID = #rec_id# and N_Note like 'Postponed%'
					order by n_date, n_time
				</CFQUERY>


				<cfif #read_com.recordcount# eq 0>
					<!--- <CFQUERY DATASOURCE="#request.dsn#">
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type <CFIF IsDefined("form.title") is True>, access</cfif><CFIF IsDefined("form.title2") is True>, access2</cfif>)
						VALUES('#read_uder_info.FName#', '#read_uder_info.LName#', #URL.rec_id#, <cfif #N_Note_1# neq "">'#N_Note_1#',<cfelse>'#otherpro#',</cfif> '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T' <CFIF IsDefined("form.title") is True>, '#title#'</cfif><CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)
					</CFQUERY> --->
					<CFQUERY DATASOURCE="#request.dsn#">
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type <CFIF IsDefined("form.title") is True>, access</cfif><CFIF IsDefined("form.title2") is True>, access2</cfif>)
						VALUES('#read_uder_info.FName#.', '#read_uder_info.LName#', #URL.rec_id#, <cfif #N_Note_1# neq "">'#N_Note_1#',<cfelse>'#otherpro#',</cfif> '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#url.code#'  <CFIF IsDefined("form.title") is True>, '#title#'</cfif><CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)
					</CFQUERY>


				<cfelse>
					<cfquery DATASOURCE="#request.dsn#">
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


				<cfif otherpro EQ "Assign Clearance To">
				<cfparam name="ctc_Review_AdditionalInfo" default="">
				
				<!---
				<CFQUERY datasource="#request.dsn#" NAME="is_VA">
				SELECT f.va_employee from companies c, first_admin f
				where c.ID = #read_id.comp_id#
				and f.ID = c.intSales
				</CFQUERY>
				<cfif is_VA.va_employee eq 'True'>
					<cfmail to="richmond@firsttitleservices.com" from="webmaster@firsttitleservices.com" subject="Richmond File Assigned For Clear to Close Review">File R-#url.rec_id# has been assigned to you as the clear to close reviewer. #ctc_Review_AdditionalInfo#
					</cfmail>
				</cfif>
				--->
				
				<cfif ctcReview EQ 505>
					<cfmail to="richmond@firsttitleservices.com" from="webmaster@firsttitleservices.com" subject="Clearance assigned to Richmond">Clearance has been assigned to Richmond for the following file: #url.rec_id# 
					</cfmail>
				</cfif>
			
				<CFQUERY DATASOURCE="#request.dsn#" name="getAdmin">
					select fname, lname, email
					from first_admin
					where id = #ctcReview#
				</cfquery>
				<cfset otherPro = otherpro&" "&getAdmin.fname&" "&getAdmin.lname&" "&ctc_Review_AdditionalInfo>
				<cfmail to="#getAdmin.email#" from="webmaster@firsttitleservices.com" subject="File Assigned For Clear to Close Review">File #url.rec_id# has been assigned to you as the clear to close reviewer. #ctc_Review_AdditionalInfo#
				</cfmail>
				<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set cleartoCloseReview_assignedToID = #ctcReview#,
						cleartoclosereview_assignedDate = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>

<cfif otherpro eq 'Loan Closed-Seller Rep' and Len(form.loan_closed_datetime)>
<cfif IsDefined("form.loan_closed_datetime")>
		 <CFSET cl_button_pushed = '#form.loan_closed_datetime#'>
		<cfelse>
		 <CFSET cl_button_pushed = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
		</cfif>
<cfset otherpro = 'Loan Closed-Seller Rep - ' & cl_button_pushed>
</cfif>

			<CFQUERY DATASOURCE="#request.dsn#">
					INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type <CFIF IsDefined("form.title") is True>, access</cfif><CFIF IsDefined("form.title2") is True>, access2</cfif>)
					VALUES('#read_uder_info.FName#', '#read_uder_info.LName#', #URL.rec_id#, <cfif #N_Note_1# neq "">'#N_Note_1#',<cfelseif N_ProblemResolvedNote neq ""> '#N_ProblemResolvedNote#', <cfelse>'#otherpro# <cfif IsDefined("form.on_hold_reason") and Len(form.on_hold_reason)>#form.on_hold_reason# </cfif><cfif IsDefined("form.on_hold_removed_reason") and Len(form.on_hold_removed_reason)>#form.on_hold_removed_reason# </cfif>',</cfif> '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#url.code#' <CFIF IsDefined("form.title") is True>, '#title#'</cfif><CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)
				</CFQUERY>
			</cfif>

<cfif otherpro contains 'Loan Closed-Seller Rep'>
<cfset otherpro = 'Loan Closed-Seller Rep'>
</cfif>

<!--- RealEC --->
<cfif IsDefined("form.realec_reason_code") and form.realec_reason_code neq ''>
<CFQUERY DATASOURCE="#request.dsn#" NAME="realec_reasonDef">
	SELECT * from ChaseRealEC_ReasonCodes
	where code = #form.realec_reason_code#
</CFQUERY>
</cfif>

				<!---
				<CFQUERY DATASOURCE="#request.dsn#">
					INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type <CFIF IsDefined("form.title") is True>, access</cfif><CFIF IsDefined("form.title2") is True>, access2</cfif>)
					VALUES('#read_uder_info.FName#', '#read_uder_info.LName#', #URL.rec_id#, <cfif #N_Note_1# neq "">'#N_Note_1#',<cfelse>'#otherpro#<cfif IsDefined("form.realec_reason_code") and form.realec_reason_code neq ''> - #realec_reasonDef.reason#</cfif>',</cfif> '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#url.code#' <CFIF IsDefined("form.title") is True>, '#title#'</cfif><CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)
				</CFQUERY>
				--->


 <cfif Len(read_title.realEC_TransactionID)>
<cfset reasonInfoInfo = StructNew()>
		<cfset reasonInfo.responsibleParty = "CUSTOMER">
		<cfset reasonInfo.responsibleType="At Closing">
		<cfset objChase.processEvent(eventcode=492,title_ID=url.rec_id,productCode=#form.realec_productCode#,reasonInfo=reasonInfo, comment="#N_Note_1# #otherpro#", reasonCode=#form.realec_reason_code#)>
</cfif>
<!--- END RealEC  --->


			<cfif Len(read_id.realec_transactionid)>
						<cfif #N_Note_1# neq "" AND realec_curative NEQ 1 AND not isDefined("form.internalonly")>
											<cfif form.action_needed eq 1>
											<cfset objChase.processEvent(eventcode=222, productCode=#form.realec_productCode#, title_id=#url.rec_id#, firstTitleSending=1, comment=XmlFormat('#N_Note_1# #otherpro#'))>
											<cfelse>
											<cfset objChase.processEvent(eventcode=220, productCode=#form.realec_productCode#, title_id=#url.rec_id#, firstTitleSending=1, comment=XmlFormat('#N_Note_1# #otherpro#'))>
											</cfif>
				</cfif></cfif>

			<cfif #otherpro# neq "">


<!--- realEC specific Comments --->
				<cfif #otherpro# eq "On Hold">
				<CFQUERY DATASOURCE="#request.dsn#" name="update_on_hold">
				update title set on_hold = 1,
				on_hold_date = #CreateODBCDateTime(Now())#
				where title_id = #url.rec_id#
				</cfquery>
				
				<cfif Len(read_id.realec_transactionid)>
				<cfset comment = 'On Hold 230 - ' & realec_reasonDef.reason & ''>
				<cfset otherpro = 'On Hold 230 - ' & realec_reasonDef.reason & ''>
		<cfset reasonInfoInfo = StructNew()>
		<cfset reasonInfo.responsibleParty = "">
		<cfset reasonInfo.responsibleType="">
		<cfset objChase.processEvent(eventcode=230,title_ID=#url.rec_id#,productCode=#form.realec_productCode#,reasonInfo=reasonInfo, comment="#realec_reasonDef.reason#", reasonCode=#form.realec_reason_code#, reasonDesc="#realec_reasonDef.reason#", firstTitleSending=1)>
				</cfif>
                </cfif>
				<cfif #otherpro# eq "On Hold Removed">
				<CFQUERY DATASOURCE="#request.dsn#" name="update_on_hold">
				update title set on_hold = 0,
				on_hold_date = NULL
				where title_id = #url.rec_id#
				</cfquery>

                <cfif Len(read_id.realec_transactionid)>
				<cfset reason = 'On Hold Removed'>
				<cfset objChase.processEvent(eventcode=260, productCode=#form.realec_productCode#, title_id=#url.rec_id#, firstTitleSending=1)>
				</cfif>
				</cfif>

				<cfif #otherpro# eq "Curative Cleared">
                <cfset objChase.processEvent(eventCode=500,  productCode=3, title_id=#url.rec_id#)>
				</cfif>




				<cfif #otherpro# eq "HUD Approved By Client">
				<CFQUERY DATASOURCE="#request.dsn#" name="find_hud">
				select final_hud from doc_closer_title set
				where title_id = #url.rec_id#
				</cfquery>

				<cfset documentInfo = StructNew()>
				 <cfset documentInfo.document = "#find_hud.final_hud#">
				 <cfset documentInfo.documentversion = "#hud_version#">
				 <cfset documentInfo.documentStatus = "FINAL">
				 <cfset documentInfo.documentType = "HUD1">

            <cfset objChase.processEvent(eventcode=435,title_ID=titleid,productCode=29,documentInfo=documentInfo)>
				</cfif>

				<cfif #otherpro# eq "Signed Closing Package Delivered to Customer or Lender">
				            <cfset senderTrackingInfo = StructNew()>
							<cfset senderTrackingInfo.trackingnumber = trackingNum>
							<cfset senderTrackingInfo.shippingDate = DateFormat(Now(), "yyyy/mm/dd") & ' ' & TimeFormat(Now(), "hh:mm:ss")>
							<cfset senderTrackingInfo.courier = courier>
							<cfset senderTrackingInfo.reference = read_title.realEC_transactionID>
							<cfset senderTrackingInfo.name = "">


				<cfset objChase.processEvent(eventCode=690, firstTitleSending=1, productCode=29, title_id=#url.rec_id#, senderTrackingInfo=senderTrackingInfo)>
				</cfif>

				<cfif Len(read_id.realec_transactionid)>
				<cfif #otherpro# eq "Signed Documents Received From Closer">
				<cfset senderTrackingInfo = StructNew()>
		<cfset senderTrackingInfo.trackingnumber = form.trackingNum>
				<cfset objChase.processEvent(eventCode=691, firstTitleSending=1, productCode=29, title_id=#url.rec_id#,sendertrackingInfo=sendertrackinginfo)>
				</cfif>

				<cfif #otherpro# eq "Closing Package Received">
				<cfset objChase.addTurnTimeEvent(title_id=url.rec_id,event_type="marker",event_description="closing_pack_received")>
				<cfset objChase.processEvent(eventCode=761, firstTitleSending=1, productCode=29, title_id=#url.rec_id#)>
				</cfif>

				<cfif #otherpro# eq "Provider Compliance Review FAILED">
				<cfset objChase.processEvent(eventCode=771, firstTitleSending=1, productCode=29, title_id=#url.rec_id#,reasonCode=#form.realec_reason_code_771#)>
				</cfif>

				</cfif>

				<cfif #otherpro# eq "Send Preliminary HUD">
				<cfhttp url="https://machine1.firsttitleservices.com/HUD1_2010_PDF.cfm?rec_id=#url.rec_id#&bypass=1" method="get" resolveURL="true">
				<cfhttpparam type="header" name="accept-encoding" value="deflate;q=0">
				<cfhttpparam type="header" name="te" value="deflate;q=0">
				</cfhttp>


				<cfdocument format="PDF" pagetype="custom" pageheight="14" pagewidth="8.5" margintop=".25" marginbottom=".25" marginleft=".25" marginright=".25" filename="c:\huds\HUD_#rec_id#.pdf" overwrite="yes"> <cfoutput>#cfhttp.filecontent#</cfoutput> </cfdocument>



				<cfset documentInfo = StructNew()>
				<cfset documentInfo.document = "HUD_#url.rec_id#.pdf">
				<cfset documentInfo.documentversion = "1.0">

				<cfset documentInfo.documentStatus = "DRAFT">
				<cfset documentInfo.documentDesc = "Fee Sheet">
				<cfset documentInfo.documentType = "FEESHT">
				<cfset documentInfo.documentPath = "c:\huds\">
				<!---
				<cfset objChase.addTurnTimeEvent(title_id=url.rec_id,event_type="marker",event_description="hud_sent")>
				--->
				<cfset objChase.processEvent(eventCode=180, productCode=3, title_id=#url.rec_id#,documentInfo=documentInfo, comment=form.n_note_1)>
				</cfif>

				<cfif #otherpro# eq "Provider Compliance Review PASSED">
				<cfset objChase.processEvent(eventCode=770, firstTitleSending=1, productCode=29, title_id=#url.rec_id#)>
				</cfif>

				<cfif #otherpro# eq "Schedule Confirmed">
				<cfset objChase.processEvent(eventCode=301, firstTitleSending=1, productCode=#dsprodID#, title_id=#url.rec_id#)>
				</cfif>
				<cfif #otherpro# eq "Order Assigned">
				<cfset objChase.processEvent(eventCode=410, firstTitleSending=1, productCode=#dsprodID#, title_id=#url.rec_id#)>
				</cfif>


				<cfif #otherpro# eq "Mortgage Sent for Recording">
				<cfset senderTrackingInfo = structNew()>
				<cfset senderTrackingInfo.trackingnumber = trackingNum>
							<cfset senderTrackingInfo.shippingDate = DateFormat(shipdate, "yyyy/mm/dd")>
							<cfset senderTrackingInfo.courier = courier>
							<cfset senderTrackingInfo.reference = read_title.realEC_transactionID>
							<cfset senderTrackingInfo.name = senderName>
				<cfset objChase.processEvent(eventCode=694, firstTitleSending=1,  productCode=29, title_id=#url.rec_id#, senderTrackingInfo=senderTrackingInfo)>
			</cfif>
				<cfif #otherpro# eq "Recorded">
				<cfset recordingInfo = structNew()>
				<cfset recordingInfo.documentDescription = documentDescription>
				<cfset recordingInfo.documentPosition = documentPosition>
				<cfset recordingInfo.documentBook = documentBook>
				<cfset recordingInfo.documentPage = documentPage>
				<cfset recordingInfo.dateRecorded = DateFormat(dateRecorded, "yyyy/mm/dd")>
				<cfset recordingInfo.instrumentNumber = instrumentNumber>
				<cfset objChase.processEvent(eventCode=695, firstTitleSending=1,  productCode=29, title_id=#url.rec_id#, recordingInfo=recordingInfo)>
				<cfset objChase.processEvent(eventCode=270, firstTitleSending=1,  productCode=29, title_id=#url.rec_id#)>
                		<cfset objchase.addTurnTimeEvent(title_id=#url.rec_id#,event_type="stop",event_code="270")>
				<cfset objchase.addTurnTimeEvent(title_id=#url.rec_id#,event_type="marker",event_description="stop")>
			</cfif>

				<cfif #otherpro# eq "Clear to Fund">
				<cfset objChase.processEvent(eventCode=732, firstTitleSending=1,  productCode=29, title_id=#url.rec_id#)>
                <CFMAIL
				            TO="#team_email#"
				            FROM="#team_email#"
				            Subject="#rec_id# has been marked Clear to Fund"
				            TIMEOUT="600"
				            >
				        #rec_id# has been marked Clear to Fund
                    </cfmail>
				</cfif>

				<cfif #otherpro# eq "Not Clear to Fund">
				<cfset objChase.processEvent(eventCode=733, firstTitleSending=1,  productCode=29, title_id=#url.rec_id#)>
                <CFMAIL
				            TO="#team_email#"
				            FROM="#team_email#"
				            Subject="#rec_id# has been marked Not Clear to Fund"
				            TIMEOUT="600"
				            >
				        #rec_id# has been marked Not Clear to Fund
                    </cfmail>
				</cfif>


				<cfif #otherpro# eq "Signed Documents Received">
				<cfset objChase.processEvent(eventCode=691, firstTitleSending=1,  productCode=#form.realec_product#, title_id=#url.rec_id#)>
                <CFMAIL
				            TO="#team_email#"
				            FROM="#team_email#"
				            Subject="#read_title.title_id# has been marked Not Clear to Fund"
				            TIMEOUT="600"
				            >
				        #read_title.title_id# has been marked Not Clear to Fund
                    </cfmail>
				</cfif>

				<!---
				<cfif #otherpro# eq "Loan Funded" AND Len(read_id.realec_transactionid)>
				<cfset documentInfo = StructNew()>
				<cfset objChase.processEvent(eventCode=734, firstTitleSending=1,  productCode=29, title_id=#url.rec_id#,documentInfo=documentInfo)>
				</cfif>
				--->
				<cfif #otherpro# eq "Loan Closed" AND Len(read_id.realec_transactionid)>
				<cfset objChase.processEvent(eventCode=765, firstTitleSending=1,  productCode=29, title_id=#url.rec_id#)>
				</cfif>
				
				<cfif #otherpro# eq "Wire Received">
				<cfset objChase.processEvent(eventCode=735, firstTitleSending=1,  productCode=29, title_id=#url.rec_id#)>
				</cfif>


				<cfif #otherpro# eq "Loan Not Closed">
				<cfset reason = 'Loan Not Closed'>
				<cfset reasonInfoInfo = StructNew()>
				<cfset reasonInfo.responsibleParty = "">
				<cfset reasonInfo.responsibleType="">
				<cfset objChase.processEvent(eventcode=766,title_ID=rec_id,productCode=29,reasonInfo=reasonInfo, comment="#reason#", reasonCode=form.realec_reason_code)>
				</cfif>

				<cfif #otherpro# eq "Subordination Request sent to Lender">
				<cfset objChase.processEvent(eventCode=825, firstTitleSending=1,  productCode=29, title_id=#url.rec_id#)>
				</cfif>
<!--- END realEC specific Comments --->


				<cfif #otherpro# eq "Title Claim">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set title_claim = 1
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>

				<cfif #otherpro# eq "Title Claim Cleared">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set title_claim = 0
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Title Issue">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set title_issue = 1
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Title Issue Cleared">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set title_issue = 0
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Client System Updated">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set client_system_updated = 1
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Call for Detail">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update tax_cert_title
						set call_detail = 1
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				
				<cfif #otherpro# eq "Flagstar Docs Recorded">
				<cfset otherpro = otherpro & ' ' & #form.docs_recorded_date#>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set docs_recorded_date  = '#form.docs_recorded_date#'
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>


				<cfif #otherpro# eq "Flagstar Security Instrument Received">
				<cfset otherpro = otherpro & ' ' & #form.sec_inst_date#>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set sec_inst_date  = '#form.sec_inst_date#'
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>


				<cfif #form.otherpro# eq "Flagstar HUD Requested">
				<cfset form.otherpro = form.otherpro & ' ' & #DateFormat(CreateODBCDateTime(Now()), "mm/dd/yyyy")#>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set flagstar_hud_req  = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
                 </cfif>

				<cfif #form.otherpro# eq "Flagstar HUD Completed">
				<cfset form.otherpro = form.otherpro & ' ' & #DateFormat(CreateODBCDateTime(Now()), "mm/dd/yyyy")#>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set flagstar_hud_completed  = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
                </cfif>


				<cfif #form.otherpro# eq "Flagstar Policy Issued">
				<cfset form.otherpro = form.otherpro & ' ' & #DateFormat(CreateODBCDateTime(Now()), "mm/dd/yyyy")#>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set flagstar_policy_issued  = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
                 </cfif>


				<!---Synechron 03/22/2013  --->	

				<cfif #otherpro# eq "Online Docs to Be Recorded">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set online_docs_to_be_recorded  = 'True', online_docs_recorded = NULL
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Online Docs Recorded">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set online_docs_recorded  = 'True'
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
		
				<cfif #otherpro# eq "Corporate Docs Needed">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set Corporate_Docs_Needed = 'True',Corporate_Docs_Received = NULL
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				
				<cfif #otherpro# eq "Corporate Docs Received">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set Corporate_Docs_Received = 'True'
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				
				<cfif #otherpro# eq "Trust Docs Needed">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set Trust_Docs_Needed = 'True',Trust_Docs_Received = NULL
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
		
				<cfif #otherpro# eq "Trust Docs Received">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set Trust_Docs_Received = 'True'
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				
				<cfif #otherpro# eq "Surveys Needed">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set Surveys_Needed = 'True',Surveys_Received = NULL
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
		
				<cfif #otherpro# eq "Surveys Received">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set Surveys_Received = 'True'
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>

		<!---Synechron 03/22/2013  --->	
				<cfif #otherpro# eq "Abstract sent - waiting for contract">
                    <CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set appraisal_status = '#otherpro#'
						where title_id = #url.rec_id#
					</CFQUERY>
                 </cfif>
                 <cfif #otherpro# eq "Cancelled per client">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update tax_cert_title
						set cancelled_client = 1
						where title_id = #url.rec_id#
					</CFQUERY>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set cancelled = 1,
						appraisal_status = 'Cancelled Per Client'
						where title_id = #url.rec_id#
					</CFQUERY>
					<cfif Len(read_id.realec_transactionid)>
						<cfset reasonInfoInfo = StructNew()>
						<cfset reasonInfo.responsibleParty = "">
						<cfset reasonInfo.responsibleType="">
									<!---
									<cfset objChase.processEvent(eventcode=230,title_ID=#url.rec_id#,productCode=#form.realec_productCode#,reasonInfo=reasonInfo, comment="#realec_reasonDef.reason#", reasonCode=#form.realec_reason_code#, firstTitleSending=1)>
									--->
									<cfset objChase.processEvent(eventcode=240, productCode=#form.realec_productCode#, title_id=#url.rec_id#, firstTitleSending=1)>
					</cfif>
				</cfif>
				

<!--- //Clear to close --->
<cfif #otherpro# eq "Clear to Close">
<CFQUERY DATASOURCE="#request.dsn#" NAME="update_nctc">
update title_notes
set nctc_cleared = 'True'
where (N_date between '01-01-1990'
and '#DateFormat(Now(), "mm-dd-yyyy")#'
and order_id = #url.rec_id# and note_type = '#url.code#')
</CFQUERY>


<!--- new Vendor Manager --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="find_new_vendor">
select vendor_id from Vendor_Tracker_New
where Order_id = #url.rec_ID#
and task = 'Review'
<!---and (completed = 0 or completed IS NULL)--->
</cfquery>
<cfif find_new_vendor.recordcount gt 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="find_new_vendor_info">
select company from Vendors_Stacie
where vendor_id = #find_new_vendor.vendor_id#
</cfquery>

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New
set return_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
return_time = '#TimeFormat(Now(), "HH:mm:ss")#',
completed = 1
where Order_id = #url.rec_ID#
and task = 'Review'

</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #url.rec_ID#, 'Title Review Completed by #find_new_vendor_info.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
</cfif>
<!--- new vendor manager end --->
<!--- RealEC --->

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
select * from Title
where title_id = #url.rec_id#
</cfquery>

<CFQUERY DATASOURCE="#request.dsn#" NAME="check_tc_state">
select * from Title_Companies_States
where st_abbrev = '#read_title.pstate#'
</cfquery>


<cfif Len(read_title.realec_transactionid)>
<cfset tc_version = 1>
	<cfif read_title.tc_version gte 1>
	<cfset tc_version = read_title.tc_version + 1>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="update_tc_version">
		update Title
		set tc_version = #tc_version#
		where title_id = #url.rec_id#
		</cfquery>
	</cfif>
<cfset documentInfo = StructNew()>

<cfif check_tc_state.title_co_id eq 19>
<CFQUERY DATASOURCE="#request.dsn#" NAME="find_tc_file">
    SELECT abstractor_doc_upload3
	FROM  Doc_Abstract_Title
	WHERE title_id = #url.rec_id#
</cfquery>
<cfset documentInfo.document = "#find_tc_file.abstractor_doc_upload3#">
<cfset documentInfo.documentversion = "#tc_version#">
<cfset documentInfo.documentStatus = "FINAL">
<cfset documentInfo.documentType = "CLEARTOCLOSE">
<cfset documentInfo.documentDesc = "Clear to Close">
<cfset documentInfo.documentPath = "c:\uploads\">

<cfelse>

<cfset documentInfo.document = "TC-#read_id.title_id#.pdf">
<cfset documentInfo.documentversion = "#tc_version#">
<cfset documentInfo.documentStatus = "FINAL">
<cfset documentInfo.documentType = "CLEARTOCLOSE">
<cfset documentInfo.documentDesc = "Clear to Close">
<cfset documentInfo.documentPath = "#request.rootdir#\admin_area\tcs\">

</cfif>
<cfset objChase.addTurnTimeEvent(title_id=url.rec_id,event_type="marker",event_description="cleared")>
<!---
<cfset objChase.processEvent(eventCode=500,  productCode=3, title_id=#read_title.title_id#)>
--->
<cfset objChase.processEvent(eventCode=150, productCode=3, title_id=#read_title.title_id#,documentInfo=documentInfo)>

<cfset objChase.processEvent(eventCode=270,  productCode=3, title_id=#read_title.title_id#)>
</cfif>

<!--- RealEC --->

					<CFQUERY DATASOURCE="#request.dsn#">
						Update tax_cert_title
						set clear_close = 1
						where title_id = #url.rec_id#
					</CFQUERY>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set cleartoclosereview_complete = 1
						where title_id = #url.rec_id#
					</CFQUERY>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update  Doc_Title_Insurance_Title
						set clear_close = 1
						where title_id = #url.rec_id#
					</CFQUERY>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update tblUser_Roles
						set cleartoclose_End_Datetime = getdate()
						where title_id = #url.rec_id#
					</CFQUERY>
                     <!---If this is Weichert then they need to receive an email.--->
                    <CFQUERY DATASOURCE="#request.dsn#" Name="read_title">
				        Select * from Title
				        where title_id = #url.rec_id#
			        </CFQUERY>
                    <!--- <CFIF #read_title.comp_id# eq "559"><!---Change to Weichert after testing--->
                        <CFMAIL
				            TO="#read_title.o_email#,#read_title.p_email#"
				            FROM="#team_email#"
				            Subject="First Title Order Number - #read_title.Title_ID# #read_title.bfirstname1# #read_title.blastname1#"
				            TIMEOUT="600"
				            >
				        First Title Order number #read_title.Title_ID# for #read_title.bfirstname1# #read_title.blastname1# is marked Clear To Close.
                        </cfmail>
                    </CFIF>  --->
					<cfset email_flag=0>
                    
                    <CFQUERY DATASOURCE="#request.dsn#" Name="get_comp_info">
				        Select * from Companies
				        where id = #read_title.comp_id#
			        </CFQUERY>
                    <cfif get_comp_info.company contains 'MB Financial' or get_comp_info.company contains'Inland Bank'>
							<cfset cleartoclose_email="#read_title.Verifyemail#">
							<cfset email_flag=1>
					<CFELSEIF #read_title.comp_id# eq "559">
							<cfset cleartoclose_email="#read_title.o_email#;#read_title.p_email#">
							<cfset email_flag=1>
					<cfelseif #read_title.comp_id# eq "859" or #read_title.comp_id# eq "919"
						   or #read_title.comp_id# eq "953" or #read_title.comp_id# eq "947"
						   or #read_title.comp_id# eq "946" or #read_title.comp_id# eq "948"
						   or #read_title.comp_id# eq "944" or #read_title.comp_id# eq "949"
						   or #read_title.comp_id# eq "951" or #read_title.comp_id# eq "945"
						   or #read_title.comp_id# eq "950" or #read_title.comp_id# eq "943"
						   or #read_title.comp_id# eq "941" or #read_title.comp_id# eq "942"
						   or #read_title.comp_id# eq "968">
							  <cfset cleartoclose_email="#read_title.o_email#;#read_title.p_email#;kklos@weichertfinancial.com">
					<cfset email_flag=1>
					</CFIF>

	<cfif read_comp_id.team_id eq 18>
	<cfset title_co_name = "Axiom Title">
	<cfelse>
	<cfset title_co_name = "First Title">
	</cfif>
					<cfif email_flag eq "1">
						<CFMAIL
				            TO="#cleartoclose_email#"
				            FROM="#team_email#"
				            Subject="#title_co_name# Order Number - #read_title.Title_ID# #read_title.bfirstname1# #read_title.blastname1#"
				            TIMEOUT="600"
				            >
				        #title_co_name# Order number #read_title.Title_ID# for #read_title.bfirstname1# #read_title.blastname1# is marked Clear To Close.
                    </cfmail>
					</cfif>

					<!---If the old message was Not Clear To Close and this was on a
					processors screen then the data and time needs to be changed--->
					<CFQUERY DATASOURCE="#request.dsn#" NAME="Not_Clear_To_Close">
						SELECT     *
						FROM         Title_Notes
						WHERE     (N_Note = 'Not Clear To Close') and Order_ID = #url.rec_id#
						order by n_date, n_time
					</CFQUERY>
					<CFIF #Not_Clear_To_Close.RecordCount# gte 1>
						<!---Is the Title_ID in Processing or Pre-Processing--->
						<!---If it's in neither then don't worry about it. --->
						<CFQUERY DATASOURCE="#request.dsn#" NAME="Not_Preprocessing">
							Select * from sqlPreprocessing_NotClearToClose where Title_ID = #url.rec_id#
						</CFQUERY>
						<CFIF #Not_Preprocessing.RecordCount# gte 1>
							<!---update time --->
                            <CFQUERY DATASOURCE="#request.dsn#">
							    Update tblUserRoles
							    set preprocessor_start_datetime = #Now()#
							    where Title_ID = #rec_id#
                            </CFQUERY>
						</CFIF>
						<CFQUERY DATASOURCE="#request.dsn#" NAME="Not_Processing">
							Select * from sqlProcessing_NotClearToClose where Title_ID = #url.rec_id#
						</CFQUERY>
						<CFIF #Not_Processing.RecordCount# gte 1>
							<!---Update time --->
							 <CFQUERY DATASOURCE="#request.dsn#">
							    Update tblUserRoles
							    set processor_start_datetime = #Now()#
							    where Title_ID = #rec_id#
                            </CFQUERY>
						</CFIF>
					</CFIF>
				</cfif>
<!--- //Clear to close END --->

				<cfif #otherpro# eq "Court House Closed">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update tax_cert_title
						set court_house = 1
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>





				<cfif #otherpro# eq "Closing Invoiced">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set closing_invoiced = 1,
						closing_invoiced_date = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "SR Closing Paid">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set sr_closing_paid = 1,
						sr_closing_paid_date = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>

<cfif #otherpro# eq "Sales Call - Full Closing">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set sales_call_full = 1
						where title_id = #url.rec_id#
					</CFQUERY>
</cfif>
 <cfif #otherpro# eq "Sales Call - Seller Rep Only">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set sales_call_seller_rep = 1
						where title_id = #url.rec_id#
					</CFQUERY>
</cfif>

<cfif #otherpro# eq "Sales Call - Full Closing" or  #otherpro# eq "Sales Call - Seller Rep Only">
<cfinclude template="send_sales_call_emails.cfm">
</cfif>






<cfif #otherpro# eq "Loan Closed-Seller Rep">

				<cfparam name="form.close_month" default="">
<cfparam name="form.close_day" default="">
<cfparam name="form.close_year" default="">
<cfparam name="form.close_time1" default="">

<cfquery datasource="#request.dsn#" name="getuser">
    select *
    from first_admin
    where id = #session.ft_user_id#
</cfquery>

<cfquery name="get_order" DATASOURCE="#request.dsn#">
    select *
    from Title
    where title_id = #URL.rec_id#
</cfquery>

<cfquery name="get_comp" DATASOURCE="#request.dsn#">
    select *
    from companies
    where id = #get_order.comp_id#
</cfquery>

<cfquery name="get_list" datasource="#request.dsn#">
    select * from eventlist
    where title_id = #get_order.title_id#
</cfquery>
<cfif get_list.recordcount eq 0>
<cfquery name="insert_this" DATASOURCE="#request.dsn#">
    Insert Into eventlist (title_id)
    values ('#get_order.title_id#')
</cfquery>
<cfquery name="get_list" datasource="#request.dsn#">
    select * from eventlist
    where title_id = #get_order.title_id#
</cfquery>
</cfif>


<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

        <cfquery name="updateclosing" datasource="#request.dsn#">
            update Title
            set 
	        Appraisal_status = 'Loan Closed-Seller Rep',
			lender_realtor_1 = '#form.lender_realtor_1#',
			lender_realtor_2 = '#form.lender_realtor_2#',
			lender_realtor_3 = '#form.lender_realtor_3#',
			lender_realtor_fname_1 = '#form.lender_realtor_fname_1#',
			lender_realtor_fname_2 = '#form.lender_realtor_fname_2#',
			lender_realtor_fname_3 = '#form.lender_realtor_fname_3#',
			lender_realtor_lname_1 = '#form.lender_realtor_lname_1#',
			lender_realtor_lname_2 = '#form.lender_realtor_lname_2#',
			lender_realtor_lname_3 = '#form.lender_realtor_lname_3#',
			lender_realtor_email_1 = '#form.lender_realtor_email_1#',
			lender_realtor_email_2 = '#form.lender_realtor_email_2#',
			lender_realtor_email_3 = '#form.lender_realtor_email_3#'			
            where title_id = #URL.rec_id#
        </cfquery>

        <!--- <CFSET order_date_adj = form.close_month & "/" &  form.close_day & "/" & form.close_year & " " & form.close_time> --->
		<cfif IsDefined("form.loan_closed_datetime")>
		 <CFSET cl_button_pushed = '#form.loan_closed_datetime#'>
		<cfelse>
		 <CFSET cl_button_pushed = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
		</cfif>

		<cfquery name="up" datasource="#request.dsn#">
                update eventlist
                set 
	            l_date = '#DateFormat(Now(), "m/d/yyyy")#',
	            cl_dateandtime = '#cl_button_pushed#',
				cl_button_pushed = '#cl_button_pushed#',
	            l_time = '#TimeFormat(Now(), "HH:mm:ss")#'
                where title_id = #URL.rec_id#
            </cfquery>

            <CFQUERY datasource="#request.dsn#" NAME="read_user">
		        select * 
                from first_admin
			    WHERE ID = #session.ft_user_id#
		    </CFQUERY>
		    <!--- <CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Loan Closed - #cl_button_pushed#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		    </CFQUERY> --->

<cfset otherpro = 'Loan Closed-Seller Rep - ' & cl_button_pushed>

<cfinclude template="send_loan_closed_emails.cfm">

</cfif>


<!--- secretary veteran affairs --->

				<cfif #otherpro# eq "BTC Closing Pack Received">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set closing_pack_received = 1,
						closing_pack_received_datetime = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Deed requested from JD Prep">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set deed_requested = 1,
						deed_requested_datetime = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Deed Received from JD Prep">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set deed_received = 1,
						deed_received_datetime = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Deed Approved">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set deed_approved = 1,
						deed_approved_datetime = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "HUD not Received from BTC">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set hud_not_received = 1,
						hud_not_received_datetime = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "HUD Received">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set hud_received = 1,
						hud_received_datetime = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "HUD Approved">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update title
						set hud_approved = 1,
						hud_approved_datetime = #CreateODBCDateTime(Now())#
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
<!--- secretary of veteran affairs --->







				<cfif #otherpro# eq "Call for Detail">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update tax_cert_title
						set call_detail = 1
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "FT Shipped Pack">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update tax_cert_title
						set ft_shipped = 1
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Funds Not Received">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update tax_cert_title
						set funds_received = 1
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Judgments Exist">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update tax_cert_title
						set judge_exist = 1
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
				<cfif #otherpro# eq "Name/Address found not matching order">
					<CFQUERY DATASOURCE="#request.dsn#">
						Update tax_cert_title
						set name_address = 1
						where title_id = #url.rec_id#
					</CFQUERY>
				</cfif>
<!--- //Not Clear to Close Start --->
				<cfif #otherpro# eq "Not Clear to Close">
<!--- new Vendor Manager --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="find_new_vendor">
select vendor_id from Vendor_Tracker_New
where Order_id = #url.rec_ID#
and task = 'Review'
<!---and (completed = 0 or completed IS NULL)--->
</cfquery>

	<cfif Len(read_id.realec_transactionid)>
	<cfset objChase.processEvent(eventcode=220, productCode=#form.realec_productCode#, title_id=#url.rec_id#, firstTitleSending=1, comment='Not CLear to Close')>
	</cfif>

<cfif find_new_vendor.recordcount gt 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="find_new_vendor_info">
select company from Vendors_Stacie
where vendor_id = #find_new_vendor.vendor_id#
</cfquery>

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_abs">
update Vendor_Tracker_New
set return_date = '#DateFormat(Now(), "mm/dd/yyyy")#',
return_time = '#TimeFormat(Now(), "HH:mm:ss")#',
completed = 1
where Order_id = #url.rec_ID#
and task = 'Review'

</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Web', 'System', #url.rec_ID#, 'Title Review Completed by #find_new_vendor_info.company#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
</cfif>
<!--- new vendor manager end --->
		<CFQUERY DATASOURCE="#request.dsn#">
						Update tax_cert_title
						set not_clear_close = 1
						where title_id = #url.rec_id#
					</CFQUERY>
					<CFQUERY DATASOURCE="#request.dsn#">
						Update Doc_Title_Insurance_Title
						set clear_close = NULL
						where title_id = #url.rec_id#
					</CFQUERY>

                    <!---If this is Weichert then they need to receive an email.--->
                    <CFQUERY DATASOURCE="#request.dsn#" Name="read_title">
				        Select * from Title
				        where title_id = #url.rec_id#
			        </CFQUERY>
			<!---   <CFIF #read_title.comp_id# eq "559"><!---Change to Weichert after testing--->
                        <CFMAIL
				            TO="#read_title.o_email#,#read_title.p_email#"
				            FROM="#team_email#"
				            Subject="First Title Order Number - #read_title.Title_ID# #read_title.bfirstname1# #read_title.blastname1#"
				            TIMEOUT="600"
				            >
				        First Title Order number #read_title.Title_ID# for #read_title.bfirstname1# #read_title.blastname1# is marked Not Clear To Close.
                        </cfmail>
                    </CFIF>
             --->
				    <cfset email_flag=0>
                   <CFQUERY DATASOURCE="#request.dsn#" Name="get_comp_info">
				        Select * from Companies
				        where id = #read_title.comp_id#
			        </CFQUERY>
                    <cfif get_comp_info.company contains 'MB Financial' or get_comp_info.company contains'Inland Bank'>
							<cfset NOTcleartoclose_email="#get_comp_info.email#">
							<cfset email_flag=1>
					<CFELSEIF #read_title.comp_id# eq "559">
							<cfset NOTcleartoclose_email="#read_title.o_email#;#read_title.p_email#">
							<cfset email_flag=1>
					<cfelseif #read_title.comp_id# eq "859" or #read_title.comp_id# eq "919"
						   or #read_title.comp_id# eq "953" or #read_title.comp_id# eq "947"
						   or #read_title.comp_id# eq "946" or #read_title.comp_id# eq "948"
						   or #read_title.comp_id# eq "944" or #read_title.comp_id# eq "949"
						   or #read_title.comp_id# eq "951" or #read_title.comp_id# eq "945"
						   or #read_title.comp_id# eq "950" or #read_title.comp_id# eq "943"
						   or #read_title.comp_id# eq "941" or #read_title.comp_id# eq "942"
						   or #read_title.comp_id# eq "968">
							  <cfset NOTcleartoclose_email="#read_title.o_email#;#read_title.p_email#;kklos@weichertfinancial.com">
								<cfset email_flag=1>
					</CFIF>
					<cfif email_flag eq "1">
						<CFMAIL
				            TO="#NOTcleartoclose_email#"
				            FROM="#team_email#"
				            Subject="#title_co_name# Order Number - #read_title.Title_ID# #read_title.bfirstname1# #read_title.blastname1#"
				            TIMEOUT="600"
				            >
 				        #title_co_name# Order number #read_title.Title_ID# for #read_title.bfirstname1# #read_title.blastname1# is marked Not Clear To Close.
						Issue type: #not_Clear_to_close_issue_type#
						Issue: #not_Clear_to_close_issue#

                     </cfmail>
					</cfif>
<CFQUERY datasource="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2, issue_type, issue)
				VALUES('#read_uder_info.FName#', '#read_uder_info.LName#', #url.rec_ID#, 'File marked Not Clear to Close - Issue Type: #not_Clear_to_close_issue_type#, Issue: #not_Clear_to_close_issue#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1', '#not_Clear_to_close_issue_type#', '#not_Clear_to_close_issue#' )
		</CFQUERY>
 				</cfif>
<!--- //Not Clear to Close END --->

				<cfif #otherpro# eq "OK to fund">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set ok_fund = 1
					where title_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Order Reinstated">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set order_reinstate = 1
					where title_id = #url.rec_id#
				</CFQUERY>
		 <cfset objChase.processEvent(eventcode=260, productCode=#form.realec_productCode#, title_id=#url.rec_id#, firstTitleSending=1, comment='Order Reinstated')>
			</cfif>
			<cfif #otherpro# eq "Package Received">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set package_recieve = 1
					where title_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Package Due/Unrec.">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set package_due = 1
					where title_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Pre-Funding Completed">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set pre_funding = 1
					where title_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Pre-Funding Problem">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set funding_prob = 1
					where title_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "ON HOLD-Subordination Needed">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set subordination_need = 1,
					subordination_date = '#DateFormat(Now(), "mm/dd/yyyy")#'
					where title_id = #url.rec_id#
				</CFQUERY> 
				<CFQUERY DATASOURCE="#request.dsn#">
					Update title
					set subordination_needed = 1
					where title_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Subordination Received">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set subordination_received = 1
					where title_id = #url.rec_id#
				</CFQUERY>
					<CFQUERY DATASOURCE="#request.dsn#">
					Update title
					set subordination_received = 1
					where title_id = #url.rec_id#
				</CFQUERY>
		</cfif>
			<cfif #otherpro# eq "Supervisor Notification">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set supervisor_notify = 1
					where title_id = #url.rec_id#
				</CFQUERY>
			</cfif>


			<cfif #otherpro# eq "Unreleased Mortgages Exists">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set unreleased_mort = 1
					where title_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Vesting Issue">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set vesting_issue = 1
					where title_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Waiting on Judgment Info">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set waiting_judgment = 1
					where title_id = #url.rec_id#
				</CFQUERY>
			</cfif>
			<cfif #otherpro# eq "Waiting on Tax Info.">
				<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set waiting_tax = 1
					where title_id = #url.rec_id#
				</CFQUERY>
			</cfif>
		</cfif>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_info_1">
        SELECT     MAX(DISTINCT Note_ID) AS Note_ID
        FROM         Title_Notes
        </CFQUERY>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_info">
			SELECT *
			FROM Title_Notes
			WHERE Note_ID = #read_info_1.note_id#
		</CFQUERY>

		<cfif #read_info.access2# eq 1>
			<CFQUERY DATASOURCE="#request.dsn#">
				update doc_abstract_title
				set vendor_Date = '#read_info.n_date#',
				vendor_Time = '#read_info.n_time#'
				where title_ID = #URL.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #read_info.n_note# eq "Not Clear to Close">
			<CFQUERY DATASOURCE="#request.dsn#">
				Update doc_title_insurance_title
				set clear_close = null
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>
		<cfif #read_info.n_note# eq "Order Reinstated">
			<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set cancelled = null
				where title_id = #url.rec_id#
			</CFQUERY>
		</cfif>



<!--- EQUATOR --->

		<cfif #otherpro# eq "Send Response for Title Update" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendTitleVendorUpdate" titleId="#read_id.title_id#" message="#form.title_update_message#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>


		<cfif #otherpro# eq "Send EQUATOR Update" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">
<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
<cfif Len(form.title_update_file)>
<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				 nameconflict="makeunique"
				FILEFIELD="title_update_file">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<cfquery name="addFile" datasource="#request.dsn#">
	INSERT INTO upload_many (title_id, fileDate, filetime, fileupload)
			VALUES(#read_id.title_id#, '#a_insert_date#', '#a_insert_time#', '#new_file_name#')
</cfquery>
<cfset filename = file.serverfile>
<cfelse>
<cfset filename = ''>
</cfif>


<cfinvoke	component = "cfc.equator"	method = "sendTitleUpdate" titleId="#read_id.title_id#" message="#form.title_update_message#" filename="#filename#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>
        
        
        
        
        
        
        
        
        
        
        
        
        
        		<cfif #otherpro# eq "Supply Title Grade" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">
<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
<cfif Len(form.title_grade_file)>
<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				 nameconflict="makeunique"
				FILEFIELD="title_grade_file">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<cfquery name="addFile" datasource="#request.dsn#">
	INSERT INTO upload_many (title_id, fileDate, filetime, fileupload)
			VALUES(#read_id.title_id#, '#a_insert_date#', '#a_insert_time#', '#new_file_name#')
</cfquery>

<cfquery name="updateFile" datasource="#request.dsn#">
	update Title
    set title_grade_document = '#new_file_name#',
    title_grade = '#form.title_grade#',
    lot = '#form.grade_lot#',
    parcel = '#grade_parcel#'
    where title_id = #read_id.title_id#
</cfquery>

<cfset filename = new_file_name>
<cfelse>
<cfset filename = ''>
</cfif>

<!---<CFQUERY DATASOURCE="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_uder_info.FName#', '#read_uder_info.LName#',  #url.rec_ID#, 'Supply Title Grade sent to Equator', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
--->

<cfinvoke	component = "cfc.equator"	method = "sendTitleGrade" transactionID="#read_id.equator_title_transactionID#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>
        
        
        
        
        
        
        

		<cfif #otherpro# eq "Send Title Payable Update" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendTitlePayableUpdate"  titleId="#read_id.title_id#" message="#form.title_payable_update_message#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>

		<cfif #otherpro# eq "Clear Vesting" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">
<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				 nameconflict="makeunique"
				FILEFIELD="clear_vesting_file">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<cfquery name="addFile" datasource="#request.dsn#">
	INSERT INTO upload_many (title_id, fileDate, filetime, fileupload)
			VALUES(#read_id.title_id#, '#a_insert_date#', '#a_insert_time#', '#new_file_name#')
</cfquery>

<cfinvoke	component = "cfc.equator"	method = "sendClearVesting"  titleId="#read_id.title_id#" message="#form.clear_vesting_message#" filename="#new_file_name#" clear_vesting_type="#form.clear_vesting_type#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>


		<cfif #otherpro# eq "Clear Curative" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">
<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				 nameconflict="makeunique"
				FILEFIELD="clear_curative_file">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<cfquery name="addFile" datasource="#request.dsn#">
	INSERT INTO upload_many (title_id, fileDate, filetime, fileupload)
			VALUES(#read_id.title_id#, '#a_insert_date#', '#a_insert_time#', '#new_file_name#')
</cfquery>

<cfinvoke	component = "cfc.equator"	method = "sendClearCurative"  titleId="#read_id.title_id#" message="#form.clear_curative_message#" filename="#new_file_name#" clear_curative_type="#form.clear_curative_type#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>



		<cfif #otherpro# eq "Respond to Request for Assistance" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">

<cfinvoke	component = "cfc.equator"	method = "sendRequestAssistanceResponse"  titleId="#read_id.title_id#" message="#form.request_assistance_message#" request_assistance_type="#form.request_assistance_type#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>

		<cfif #otherpro# eq "Request Assistance" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">

<cfinvoke	component = "cfc.equator"	method = "sendRequestAssistance"  titleId="#read_id.title_id#" message="#form.request_assistance_message#" request_assistance_type="#form.request_assistance_type#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>


		<cfif #otherpro# eq "Send Additional Title Cost Request" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">

<cfinvoke	component = "cfc.equator"	method = "sendAdditionalTitleCostRequest"  titleId="#read_id.title_id#" message="#form.additional_cost_message#" additional_cost_type="#form.additional_cost_type#" additional_cost="#form.additional_cost#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>

		<cfif #otherpro# eq "Respond to Additional Title Cost Request" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">

<cfinvoke	component = "cfc.equator"	method = "RespondToAdditionalTitleCostRequest"  titleId="#read_id.title_id#" message="#form.additional_cost_message#" additional_cost_type="#form.additional_cost_type#" additional_cost="#form.additional_cost#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>

		<cfif #otherpro# eq "Send FINAL Response to Additional Title Cost Request" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">

<cfinvoke	component = "cfc.equator"	method = "sendAdditionalTitleCostResponse"  titleId="#read_id.title_id#" message="#form.additional_cost_response_message#" >
<cfsetting enableCFoutputOnly = "no">
		</cfif>





		<cfif #otherpro# eq "Closing Package Received" and Len(read_id.equator_title_transactionID) gt 1>
<!--- 			not sure what to do here
                	<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set package_recieve = 1
					where title_id = #url.rec_id#
					</CFQUERY>
 --->
<cfsetting enableCFoutputOnly = "yes">
 <cfinvoke	component = "cfc.equator"	method = "sendPackageReceived" message="Closing Package Received" condition="Success" transactionID="#read_id.equator_closing_transactionID#" fname="#read_info.fname#" lname="#read_info.lname#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>

		<cfif #otherpro# eq "Closing Package Amendment Received" and Len(read_id.equator_title_transactionID) gt 1>
<!--- 			not sure what to do here
                	<CFQUERY DATASOURCE="#request.dsn#">
					Update tax_cert_title
					set package_recieve = 1
					where title_id = #url.rec_id#
					</CFQUERY>
 --->
 <cfsetting enableCFoutputOnly = "yes">
 <cfinvoke	component = "cfc.equator"	method = "sendPackageAmendmentReceived" message="Closing Package Amendment Received" condition="Success" transactionID="#read_id.equator_closing_transactionID#" fname="#read_info.fname#" lname="#read_info.lname#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>


		<cfif #otherpro# eq "Supply Deed and Estimated HUD" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendDeedAndHud" titleId="#read_id.title_id#" fname="#read_info.fname#" lname="#read_info.lname#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>

		<cfif #otherpro# eq "Re-supply Deed and Estimated HUD" and Len(read_id.equator_title_transactionID) gt 1>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "resendDeedAndHud" titleId="#read_id.title_id#" fname="#read_info.fname#" lname="#read_info.lname#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>


		<cfif #otherpro# eq "Send Final HUD and Waiver" and Len(read_id.equator_title_transactionID) gt 1>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set hud_signed = '#form.hud_signed#',
				waiver_signed = '#form.waiver_signed#'
				where title_id = #read_id.title_id#
			</CFQUERY>

<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendFinalHUDandWaiver" titleId="#read_id.title_id#" fname="#read_info.fname#" lname="#read_info.lname#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>



		<cfif #otherpro# eq "Resend Final HUD and Waiver" and Len(read_id.equator_title_transactionID) gt 1>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set hud_signed = '#form.hud_signed#',
				waiver_signed = '#form.waiver_signed#'
				where title_id = #read_id.title_id#
			</CFQUERY>

<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "resendFinalHUDandWaiver" titleId="#read_id.title_id#" fname="#read_info.fname#" lname="#read_info.lname#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>


		<cfif #otherpro# eq "Send Wire Confirmation" and Len(read_id.equator_title_transactionID) gt 1>

			<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set wire_conf_number = '#form.wire_conf_number#',
				wire_conf_comments = '#form.wire_conf_comments#'
				where title_id = #read_id.title_id#
			</CFQUERY>

<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendWireConfirmation" titleId="#read_id.title_id#" fname="#read_info.fname#" lname="#read_info.lname#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>


		<cfif #otherpro# eq "Title Issue" and Len(read_id.equator_title_transactionID) gt 1>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set
				title_issue_comments = '#form.title_issue_comments#'
				where title_id = #read_id.title_id#
			</CFQUERY>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendReportTitleIssue" titleId="#read_id.title_id#" issue="#form.title_issue_comments#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>


		<cfif #otherpro# eq "Report Closing Delay" and Len(read_id.equator_title_transactionID) gt 1>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set
				closing_delay_comments = '#form.closing_delay_code# - #form.closing_delay_comments#'
				where title_id = #read_id.title_id#
			</CFQUERY>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendReportClosingDelay" titleId="#read_id.title_id#" issue="#form.closing_delay_comments#" code="#form.closing_delay_code#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>



		<cfif #otherpro# eq "Confirm Closing" and Len(read_id.equator_title_transactionID) gt 1>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set
				confirm_closing_comments = '#form.confirm_closing_comments#',
				closing_occurred = '#form.closing_occurred#',
				new_hud_closing_date = '#DateFormat(form.new_hud_closing_date, "yyyy-mm-dd")#',
				documents_recorded = '#form.documents_recorded#',
				delay_code = '#form.delay_code#'
				where title_id = #read_id.title_id#
			</CFQUERY>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendConfirmClosing" titleId="#read_id.title_id#" issue="#form.closing_delay_comments#" code="#form.delay_code#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>



		<cfif #otherpro# eq "Resolve HUD Shortage" and Len(read_id.equator_title_transactionID) gt 1>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set
				resolve_hud_shortage = '#form.resolve_hud_shortage#'
				where title_id = #read_id.title_id#
			</CFQUERY>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendResolveHUDShortage" titleId="#read_id.title_id#" issue="#form.resolve_hud_shortage#" resolve_method="#form.resolve_shortage_method#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>

		<cfif #otherpro# eq "Resolve HUD Overage" and Len(read_id.equator_title_transactionID) gt 1>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set
				resolve_hud_overage = '#form.resolve_overage_method# #form.resolve_hud_overage#'
				where title_id = #read_id.title_id#
			</CFQUERY>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendResolveHUDOverage" titleId="#read_id.title_id#" issue="#form.resolve_hud_overage#" resolve_method="#form.resolve_overage_method#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>


		<cfif #otherpro# eq "Provide Recording Info" and Len(read_id.equator_title_transactionID) gt 1>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set
				deed_recording_date = '#DateFormat(form.deed_recording_date, "yyyy-mm-dd")#' ,
				deed_instrument_number = '#form.deed_instrument_number#' ,
				deed_comments = '#form.deed_comments#'
				where title_id = #read_id.title_id#
			</CFQUERY>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendProvideRecordingInfo" titleId="#read_id.title_id#" issue="Rec. Date:#DateFormat(form.deed_recording_date, 'yyyy-mm-dd')#; Inst. No: #form.deed_instrument_number#; Comments: #form.deed_comments#">
<cfsetting enableCFoutputOnly = "no">
		</cfif>


		<cfif #read_info.n_note# eq "Cancelled per client">
		<cfif #read# eq "">

		<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set cancelled = 1
				where title_id = #url.rec_id#
			</CFQUERY><CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set appraisal_status = 'Cancelled per Client'
				where title_id = #url.rec_id#
			</CFQUERY>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update tblUser_Roles
				set cancelled = 1
				where title_id = #url.rec_id#
			</CFQUERY>

			<cfelse>

					<CFQUERY DATASOURCE="#request.dsn#">
				Update property
				set cancelled = 1
				where prop_id = #url.rec_id#
			</CFQUERY>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update tblUser_Roles
				set cancelled = 1
				where prop_id = #url.rec_id#
			</CFQUERY>

			</cfif>

		</cfif>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_notes">
			SELECT *
			FROM Title_Notes
			WHERE order_id = #URL.rec_id# and N_Note = 'Clear to Close'
			order by n_date, n_time
		</CFQUERY>

		<cfif #read_notes.recordcount# GT 0>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update Title_Notes
				set status = 1
				where note_id = #read_info.note_id# and N_Note != 'Clear to Close'
			</CFQUERY>
<!--- 			<CFQUERY DATASOURCE="#request.dsn#">
				Update doc_title_insurance_title
				set clear_close = 1
				where title_id = #url.rec_id#
			</CFQUERY>
 --->		<cfelse>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update Title_Notes
				set status = 1
				where note_id = #read_info.note_id# and N_Note != 'Clear to Close'
			</CFQUERY>
		</cfif>
 		<cfset cmPlace=Find(',',rec_id)-1>
		<cfif cmPlace gt 0>
			<cfset rec_id=Left(rec_id,cmPlace)>
		</cfif>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_email">
			SELECT *
			FROM Title
			Where title_id = #rec_id#
		</CFQUERY>


		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_email_company">
			SELECT      Companies.ID, Companies.company, Title.Title_ID, Title.comp_id, Companies.intCustServ, First_Admin.fname,
                      	First_Admin.lname, First_Admin.email, First_Admin.phone
			FROM        Title INNER JOIN
                        Companies ON Title.comp_id = Companies.ID LEFT OUTER JOIN
                        First_Admin ON Companies.intCustServ = First_Admin.ID
			WHERE       (Title.Title_ID = #rec_id#)
		</CFQUERY>

		<CFIF IsDefined("form.title") is True>
			<CFSWITCH EXPRESSION="#read_email.comp_id#">
    <CFCASE VALUE = 115>
        <cfset Sendemail = "False">
    </CFCASE>
    <CFCASE VALUE = 621>
        <cfset Sendemail = "False">
    </CFCASE>
<CFDEFAULTCASE>
<cfif IsDefined("read_comments.N_Note")>
<CFIF IsDefined("read_comments.N_Note") and read_comments.N_Note eq "Problem Alert - Customer Service" OR read_comments.N_Note eq "Problem Alert - Processing">
<cfset this_subject_add = "Problem Alert! - ">
<cfelse>
<cfset this_subject_add = "">
</cfif>
 <!--- Edit (Start) Added by Synechron Development for ticket# 679 --->
<CFIF Isdefined("read_comments.N_Note") and read_comments.N_Note eq 'Problem Resolved'>
	<cfset this_subject_add="Problem Resolved! - ">
<cfelse>
	<cfset this_subject_add="">
</cfif>
</cfif>
 <!--- Edit (End) Added by Synechron Development for ticket# 679 --->

<!--- #read_email.p_email# --->
<cfset to_email = read_email.p_email>
<cfif Len(form.email)>
<cfset to_email = to_email & ';' & form.email>
</cfif>

<cfif N_Note_1 contains "Problem Alert" or otherpro contains "Problem Alert">
<cfset to_email = to_email & ';' & 'MGMT@FirstTitleServices.com' & ';' & 'jmulling@FirstTitleServices.com'>
</cfif>

<cfif Len(form.email) and form.email eq 'rick@jermain.com'>
<cfoutput>
TO="#to_email#"<br>
FROM="#team_email#"<br>
</cfoutput>
<cfabort>
</cfif>


<CFMAIL
TO="#to_email#"
FROM="#team_email#"
Subject="Comment has been added by your #title_co_name# team for order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
TIMEOUT="600"
>

The following comment below has been noted regarding the above referenced file:

Comment entered by: #read_info.FName#  #read_info.lName#
Date and time entered: #read_info.n_date# #TimeFormat(Now(), "HH:mm:tt")#

		<cfif Isdefined("N_ProblemResolvedNote") and Len(N_ProblemResolvedNote)>
		#N_ProblemResolvedNote#
		</cfif>
		<cfif Isdefined("N_Note_1") and Len(N_Note_1)>
		#N_Note_1#
		</cfif>
		<cfif Isdefined("otherpro") and Len(otherpro)>
		#otherpro#
		</cfif>

<!--- Please contact your First Title representative<CFIF #len(read_email_company.intCustServ)# gte 1>, #read_email_company.fname# #read_email_company.lname#</CFIF> with any questions.
<CFIF #len(read_email_company.intCustServ)# gte 1>She can be reached at #read_email_company.phone# or by email at #read_email_company.email#.</CFIF> --->


#title_co_name# & Escrow, Inc.
"Integrating People and Technology for your Real Estate Solutions"
www.firsttitleservices.com
Toll Free 1-866 4 Title (484-8537)

...
</cfmail>

<!--- RealEC --->
<cfif Len(read_email.realEC_TransactionID)>
<cfif form.action_needed eq 1>
<cfset objChase.processEvent(eventcode=222, productCode=#form.realec_productCode#, title_id=#url.rec_id#, firstTitleSending=1, comment='#N_Note_1# #otherpro#')>
<cfelse>
<cfset objChase.processEvent(eventcode=220, productCode=#form.realec_productCode#, title_id=#url.rec_id#, firstTitleSending=1, comment='#N_Note_1# #otherpro#')>
</cfif>
</cfif>


			</CFDEFAULTCASE>
</CFSWITCH>
            <!---End--->
		</cfif>
<!---Put Note here --->
<cfif #read_info.N_note# eq "Commitment Sent Taxes to Follow">
			<CFMAIL
TO="mhill@firsttitleservices.com;jslattery@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com"
Subject=" order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
TIMEOUT="600"
>

Binder Sent with Updated Tax Info.

			</cfmail>
</cfif>

<cfif #read_info.N_note# eq "Supervisor Notification">
<CFMAIL
TO="webmaster@firsttitleservices.com"
FROM="akumar@firsttitleservices.com"
Subject="Supervisor Notification comment has been added for order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
TIMEOUT="600"
>

The following comment below has been noted regarding the above referenced file:

Comment entered by: #read_info.FName#  #read_info.lName#
Date and time entered: #read_info.n_date#  #read_info.n_time#

		<cfif Isdefined("N_ProblemResolvedNote") and Len(N_ProblemResolvedNote)>
		#N_ProblemResolvedNote#
		</cfif>
		<cfif Isdefined("N_Note_1") and Len(N_Note_1)>
		#N_Note_1#
		</cfif>
		<cfif Isdefined("otherpro") and Len(otherpro)>
		#otherpro#
		</cfif>

Thank you.

#read_info.FName#  #read_info.lName#

</cfmail>
</cfif>

<cfif #ReplaceNoCase(email, ' ', ',', 'ALL')# neq "" >

<cfset email = 	ReplaceNoCase(email, ':', ',', 'ALL')>
<cfset email = 	ReplaceNoCase(email, ' ', ',', 'ALL')>

</cfif>
<!--- --Edit (Start) Added by Synechron Development for ticket# 702 and 727 -------------------------------------------------------------------------- --->
<cfset to_email = team_email>
<cfif Len(email)>
<cfset to_email = to_email & ';' & email>
</cfif>

<cfset subject_prefix = ''>
<cfif #form.otherpro# eq "Problem Alert - Processing" OR #form.otherpro# eq "Problem Solved - Processing" >
<cfset subject_prefix = '#form.otherpro#' & ' - '>
<cfset to_email = team_email & ';' & 'pgibb@firsttitleservices.com; jmoore@firsttitleservices.com; ssacks@firsttitleservices.com; jmajor@firsttitleservices.com; nashley@firsttitleservices.com; aoakes@firsttitleservices.com; nwood@firsttitleservices.com; jmulling@firsttitleservices.com'>
</cfif>

<cfif Len(email)>
<cfset to_email = to_email & ';' & email>
<cfset email = to_email>
</cfif>


<cfif (SendTeamEmail eq 1 or SendTeamEmail eq '') and Len(email)>
<CFMAIL
TO="#email#"
FROM="#team_email#"

Subject="#subject_prefix##title_co_name# comment for order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
TIMEOUT="600"
>

The following comment below has been noted regarding the above referenced file:

Comment entered by: #read_info.FName#  #read_info.lName#
Date and time entered: #DateFormat(read_info.n_date,"mm/dd/yyyy")# #TimeFormat(read_info.n_time, "HH:mm:tt")#

		<cfif Isdefined("N_ProblemResolvedNote") and Len(N_ProblemResolvedNote)>
		#N_ProblemResolvedNote#
		</cfif>
		<cfif Isdefined("N_Note_1") and Len(N_Note_1)>
		#N_Note_1#
		</cfif>
		<cfif Isdefined("otherpro") and Len(otherpro)>
		#otherpro#
		</cfif>

Thank you.

#read_info.FName#  #read_info.lName#

</cfmail>
<CFELSEIF  SendTeamEmail eq 0>
<cfset email="jmoore@firsttitleservices.com">
<cfset FromEmail="webmaster@firsttitleservices.com">
<cfset subject_prefix = ''>

<cfif #form.otherpro# eq "Problem Alert - Customer Service" OR #form.otherpro# eq "Problem Solved - Customer Service" >
<cfset subject_prefix = '#form.otherpro#' & ' - '>
<cfset to_email = team_email & ';' & 'pgibb@firsttitleservices.com; sflickinger@firsttitleservices.com; jmoore@firsttitleservices.com; jmulling@firsttitleservices.com'>
</cfif>
<cfif Len(email)>
<cfset to_email = to_email & ';' & email>
<cfset email = to_email>
</cfif>


	<CFMAIL
		TO="#email#"
		FROM="#FromEmail#" 
		
		Subject="#subject_prefix##title_co_name# comment for order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
		TIMEOUT="600" >
		
		The following comment below has been noted regarding the above referenced file:
		
		Comment entered by: #read_info.FName#  #read_info.lName#
		Date and time entered: #DateFormat(read_info.n_date,"mm/dd/yyyy")# #TimeFormat(read_info.n_time, "HH:mm:tt")#
		
		
		Comment: 
		<cfif Isdefined("N_ProblemResolvedNote") and Len(N_ProblemResolvedNote)>
		#N_ProblemResolvedNote#
		</cfif>
		<cfif Isdefined("N_Note_1") and Len(N_Note_1)>
		#N_Note_1#
		</cfif>
		<cfif Isdefined("otherpro") and Len(otherpro)>
		#otherpro#
		</cfif>

		Thank you.
		
		#read_info.FName#  #read_info.lName#

	</cfmail>
</cfif>
<!--- --Edit (End) Added by Synechron Development for ticket# 702 and 727-------------------------------------------------------------------------- --->
</cfif>
</cfif>

<!--- Read all of the Notes for this title --->
<cfset cmPlace=Find(',',rec_id)-1>
<cfif cmPlace gt 0>
	<cfset rec_id=Left(rec_id,cmPlace)>
</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_notes">
	SELECT *
	FROM Title
	Where title_id = #rec_id#
</CFQUERY>

<cfset cmPlace=Find(',',url.rec_id)-1>
<cfif cmPlace gt 0>
	<cfset url.rec_id=Left(url.rec_id,cmPlace)>
</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_all_notes">
	SELECT n.*, c.special_inst, t.title_id
	FROM Title_Notes n, Companies c, Title t
	Where n.N_Note is not null AND n.Order_Id = #URL.rec_id# and
		  n.note_type= '#url.code#'
		  and n.Order_id = t.title_id
		  and t.comp_id = c.ID
	ORDER BY n.N_DATE, n.N_TIME ASC
</CFQUERY>
<cfif url.rec_type eq 'app'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_all_notes">
	SELECT n.*, c.special_inst, a.app_id
	FROM Title_Notes n, Companies c, Appraisal a
	Where n.N_Note is not null AND n.Order_Id = #URL.rec_id# and
		  n.note_type= '#url.code#'
		  and n.Order_id = a.app_id
		  and a.comp_id = c.ID
	ORDER BY n.N_DATE, n.N_TIME ASC
</CFQUERY>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_vendor_notes">
	SELECT *
	FROM Title_Notes
	Where N_Note is not null AND Order_Id = #URL.rec_id# and note_type = 'V'
	ORDER BY N_DATE, N_TIME ASC
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_comments">
		SELECT *
		FROM Title_Notes
		WHERE N_date = '#DateFormat(Now(), "m/d/yyyy")#' AND N_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
		ORDER BY N_DATE, N_TIME
</CFQUERY>

<cfif #read_comments.note_type# eq "P">
	<CFIF #read_comments.N_Note# eq "Cancelled per client">
	  	<cfinvoke component="RealEC_EventManager" method="generate_xml">
			<cfinvokeargument name="TYPE" value="Property">
			<cfinvokeargument name="ORDER" value=#read_comments.Order_ID#>
			<cfinvokeargument name="EVENT" value="Service Cancelled">
		</cfinvoke>
	</cfif>
	 <cfif #form.N_Note_1# neq "" and #form.otherpro# eq "">
		<CFIF IsDefined("form.title2") is True>
			<cfif #form.title2# neq "">
				<cfinvoke component="RealEC_EventManager" method="generate_xml">
					<cfinvokeargument name="TYPE" value="Property">
					<cfinvokeargument name="ORDER" value=#read_comments.Order_ID#>
					<cfinvokeargument name="EVENT" value="Comment">
				</cfinvoke>
			</cfif>
		</CFIF>
	</cfif>
	<CFIF #read_comments.N_Note# eq "Notice of Order Status">
	  	<cfinvoke component="RealEC_EventManager" method="generate_xml">
			<cfinvokeargument name="TYPE" value="Property">
			<cfinvokeargument name="ORDER" value=#read_comments.Order_ID#>
			<cfinvokeargument name="EVENT" value="Notice of Order Status">
		</cfinvoke>
	</cfif>
	<CFIF #read_comments.N_Note# eq "Order Delinquency Notice">
	  	<cfinvoke component="RealEC_EventManager" method="generate_xml">
			<cfinvokeargument name="TYPE" value="Property">
			<cfinvokeargument name="ORDER" value=#read_comments.Order_ID#>
			<cfinvokeargument name="EVENT" value="Order Delinquency Notice">
		</cfinvoke>
	</cfif>
	<CFIF #read_comments.N_Note# eq "Service Completed">
	  	<cfinvoke component="RealEC_EventManager" method="generate_xml">
			<cfinvokeargument name="TYPE" value="Property">
			<cfinvokeargument name="ORDER" value=#read_comments.Order_ID#>
			<cfinvokeargument name="EVENT" value="Service Completed">
		</cfinvoke>
	</cfif>
	<CFIF #read_comments.N_Note# eq "Loan Withdrawn">
	  	<cfinvoke component="RealEC_EventManager" method="generate_xml">
			<cfinvokeargument name="TYPE" value="Property">
			<cfinvokeargument name="ORDER" value=#read_comments.Order_ID#>
			<cfinvokeargument name="EVENT" value="Loan Withdrawn">
		</cfinvoke>
	</cfif>
	<CFIF #read_comments.N_Note# eq "Product Revision Request">
	  	<cfinvoke component="RealEC_EventManager" method="generate_xml">
			<cfinvokeargument name="TYPE" value="Property">
			<cfinvokeargument name="ORDER" value=#read_comments.Order_ID#>
			<cfinvokeargument name="EVENT" value="Product Revision Request">
		</cfinvoke>
	</cfif>
	<CFIF #read_comments.N_Note# eq "Document Attached by Customer">
	  	<cfinvoke component="RealEC_EventManager" method="generate_xml">
			<cfinvokeargument name="TYPE" value="Property">
			<cfinvokeargument name="ORDER" value=#read_comments.Order_ID#>
			<cfinvokeargument name="EVENT" value="Document Attached by Customer">
		</cfinvoke>
	</cfif>
	<CFIF #read_comments.N_Note# eq "Service Cancel Confirmed">
	  	<cfinvoke component="RealEC_EventManager" method="generate_xml">
			<cfinvokeargument name="TYPE" value="Property">
			<cfinvokeargument name="ORDER" value=#read_comments.Order_ID#>
			<cfinvokeargument name="EVENT" value="Service Cancel Confirmed">
		</cfinvoke>
	</cfif>
	<CFIF #read_comments.N_Note# eq "Problem Alert! See Team Lead">
	  	<cfinvoke component="RealEC_EventManager" method="generate_xml">
			<cfinvokeargument name="TYPE" value="Property">
			<cfinvokeargument name="ORDER" value=#read_comments.Order_ID#>
			<cfinvokeargument name="EVENT" value="Problem Alert! See Team Lead">
		</cfinvoke>
	</cfif>
</cfif>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

<script type="text/javascript">
function cant_edit(box)
{
<cfif read_id.realec_transactionid eq '' or read_id.realec_transactionid eq 'NULL'>
if (document.frm.otherpro.value != '') {

  alert("You can't type in this box since you have selected a comment in the select box.");
  box.blur();
 return true;
 }
 </cfif>
}
</script>
<script type="text/javascript">
function change_it(box)
{
if (document.frm.otherpro.value != '') {
document.frm.N_Note_1.value = '';
document.frm.email.value = '';
 }


<cfif Len(read_id.realEC_transactionID) gt 1>
if (document.frm.otherpro.value == 'On Hold' || document.frm.otherpro.value == 'Loan Not Closed'  || document.frm.otherpro.value == 'Not Clear to Close' || document.frm.realec_curative.checked == true || document.frm.otherpro.value == 'Cancelled per client' || document.frm.otherpro.value == 'Not Clear to Fund') {

document.getElementById('realec_reasons_dropdown').style.display = 'block';

} else {

document.getElementById('realec_reasons_dropdown').style.display = 'none';

//document.getElementById('realec_reason_code').value = '';

 }

if (document.frm.otherpro.value == 'Provider Compliance Review FAILED') {

document.getElementById('realec_reasons_dropdown_771').style.display = 'block';

} else {

document.getElementById('realec_reasons_dropdown_771').style.display = 'none';



 }
</cfif>





if (document.frm.otherpro.value == 'Signed Closing Package Delivered to Customer or Lender' || document.frm.otherpro.value == 'Signed Documents Received From Closer' || document.frm.otherpro.value == 'Mortgage Sent for Recording') {
document.getElementById('realec_tracking_block').style.display = 'block';
} else {
document.getElementById('realec_tracking_block').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Recorded') {
document.getElementById('realec_recording_block').style.display = 'block';
} else {
document.getElementById('realec_recording_block').style.display = 'none';
 }


if (document.frm.otherpro.value == 'Assign Clearance To') {
document.getElementById('ctcStuff').style.display = 'block';

 }
else {
document.getElementById('ctcStuff').style.display = 'none';

}

if (document.frm.otherpro.value == 'Flagstar Docs Recorded') {
document.getElementById('docs_recorded_pop').style.display = 'block';

 }
else {
document.getElementById('docs_recorded_pop').style.display = 'none';

}

if (document.frm.otherpro.value == 'Flagstar Security Instrument Received') {
document.getElementById('sec_inst_pop').style.display = 'block';

 }
else {
document.getElementById('sec_inst_pop').style.display = 'none';

}
<!--- --Edit (Start) Added by Synechron Development for ticket# 702 and 727 -------------------------------------------------------------------------- --->
if (document.frm.otherpro.value == 'Problem Alert - Customer Service') 
 {
		document.getElementById('ProblemResolvediv').style.display='block';		
 }
 else if (document.frm.otherpro.value == 'Problem Alert - Processing')
 {
 		document.frm.email.value = 'pgibb@firsttitleservices.com;<cfoutput>#team_email#</cfoutput>'; 
		document.getElementById('ProblemResolvediv').style.display='block';
 }
 else if (document.frm.otherpro.value == 'Problem Solved - Customer Service' || document.frm.otherpro.value =='Problem Solved - Processing') 
 {
		document.frm.email.value = 'pgibb@firsttitleservices.com;<cfoutput>#team_email#</cfoutput>';
		document.getElementById('ProblemResolvediv').style.display='block';
 }
 else
 {
 		document.getElementById('ProblemResolvediv').style.display='none';
 }
<!--- --Edit (End) Added by Synechron Development for ticket# 702 and 727-------------------------------------------------------------------------- --->

<cfif read_comp_id.send_post_close_survey eq 'True'>
if (document.frm.otherpro.value == 'Loan Closed') {
document.getElementById('lender_realtor_table').style.display = 'block';
} else {
document.getElementById('lender_realtor_table').style.display = 'none';
 }
</cfif>

<cfif url.code eq 'T' or  url.code eq 'P'>


if (document.frm.otherpro.value == 'Not Clear to Close') {
document.getElementById('not_clear_to_close_table').style.display = 'block';
<cfif melanies_companies_list contains read_comp_id.ID>
document.getElementById('not_clear_to_close_table_additional').style.display = 'none';

if (document.frm.not_clear_to_close_issue_type.value == 'Other') {
document.getElementById('not_clear_to_close_table_additional').style.display = 'block';
}


<cfelse>
document.getElementById('not_clear_to_close_table_additional').style.display = 'block';
</cfif>
} else {
document.getElementById('not_clear_to_close_table').style.display = 'none';
 }


<cfif Len(read_id.equator_title_transactionID) GTE 1>
if (document.frm.otherpro.value == 'Send Wire Confirmation') {
document.getElementById('wire_conf_table').style.display = 'block';
} else {
document.getElementById('wire_conf_table').style.display = 'none';
 }


if (document.frm.otherpro.value == 'Title Issue') {
document.getElementById('title_issue_table').style.display = 'block';
} else {
document.getElementById('title_issue_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Send Final HUD and Waiver' || document.frm.otherpro.value == 'Resend Final HUD and Waiver') {
document.getElementById('hud_signed_table').style.display = 'block';
} else {
document.getElementById('hud_signed_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Confirm Closing') {
document.getElementById('confirm_closing_table').style.display = 'block';
} else {
document.getElementById('confirm_closing_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Report Closing Delay') {
document.getElementById('closing_delay_table').style.display = 'block';
} else {
document.getElementById('closing_delay_table').style.display = 'none';
 }


if (document.frm.otherpro.value == 'Resolve HUD Shortage') {
document.getElementById('resolve_hud_shortage_table').style.display = 'block';
} else {
document.getElementById('resolve_hud_shortage_table').style.display = 'none';
 }



if (document.frm.otherpro.value == 'Resolve HUD Overage') {
document.getElementById('resolve_hud_overage_table').style.display = 'block';
} else {
document.getElementById('resolve_hud_overage_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Provide Recording Info') {
document.getElementById('provide_recording_info_table').style.display = 'block';
} else {
document.getElementById('provide_recording_info_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Send Response for Title Update') {
document.getElementById('title_update_table').style.display = 'block';
} else {
document.getElementById('title_update_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Send EQUATOR Update') {
document.getElementById('title_update_equator_table').style.display = 'block';
} else {
document.getElementById('title_update_equator_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Supply Title Grade') {
document.getElementById('title_grade_equator_table').style.display = 'block';
} else {
document.getElementById('title_grade_equator_table').style.display = 'none';
 }


if (document.frm.otherpro.value == 'Send Title Payable Update') {
document.getElementById('title_payable_update_table').style.display = 'block';
} else {
document.getElementById('title_payable_update_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Clear Vesting') {
document.getElementById('clear_vesting_table').style.display = 'block';
} else {
document.getElementById('clear_vesting_table').style.display = 'none';
 }


if (document.frm.otherpro.value == 'Clear Curative') {
document.getElementById('clear_curative_table').style.display = 'block';
} else {
document.getElementById('clear_curative_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Request Assistance' || document.frm.otherpro.value == 'Respond to Request for Assistance') {
document.getElementById('request_assistance_table').style.display = 'block';
} else {
document.getElementById('request_assistance_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Send Additional Title Cost Request' || document.frm.otherpro.value == 'Respond to Additional Title Cost Request') {
document.getElementById('additional_cost_table').style.display = 'block';
} else {
document.getElementById('additional_cost_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Send FINAL Response to Additional Title Cost Request') {
document.getElementById('additional_cost_response_table').style.display = 'block';
} else {
document.getElementById('additional_cost_response_table').style.display = 'none';
 }

</cfif>

if (document.frm.otherpro.value == 'Notify Me when Closing is Scheduled') {
document.getElementById('notify_me_table').style.display = 'block';
} else {
document.getElementById('notify_me_table').style.display = 'none';
 }


</cfif>


if (document.frm.otherpro.value == 'Loan Closed' || document.frm.otherpro.value == 'Loan Closed-Seller Rep') {
document.getElementById('loan_closed_table').style.display = 'block';
} else {
document.getElementById('loan_closed_table').style.display = 'none';
 }

if (document.frm.otherpro.value == 'Loan Funded') {
document.getElementById('loan_funded_table').style.display = 'block';
} else {
document.getElementById('loan_funded_table').style.display = 'none';
 }
 
 if (document.frm.otherpro.value == 'Docs Sent For Recording') {
document.getElementById('docs_recorded_table').style.display = 'block';
} else {
document.getElementById('docs_recorded_table').style.display = 'none';
 }
 
  if (document.frm.otherpro.value == 'Final HUD/Wire Confirmation Sent') {
document.getElementById('hud_wire_table').style.display = 'block';
} else {
document.getElementById('hud_wire_table').style.display = 'none';
 }
 
  if (document.frm.otherpro.value == 'Confirmed Closing with LandSafe') {
document.getElementById('confirmed_closing_table').style.display = 'block';
} else {
document.getElementById('confirmed_closing_table').style.display = 'none';
 }
 
<!--- --Edit (Start) Added by Synechron Development for ticket# 179 -------------------------------------------------------------------------- --->

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
<!--- --Edit (End) Added by Synechron Development for ticket# 179 -------------------------------------------------------------------------- --->

  return true;


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
<style>
.title_Notes { table-layout: fixed;  word-wrap: normal; }
</style>
</head>

<cfif url.code eq 'A'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
	SELECT * from appraisal where app_id = #read_id.app_id#
</CFQUERY>
<cfelse>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
	SELECT * from title where title_id = #read_id.title_id#
</CFQUERY>
</cfif>


<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0 onLoad="change_it();">

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
<cfif read_id.closingInsight_transactionId neq '' and read_id.closingInsight_transactionId neq 'NULL'>
										<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
                                        <tr>
											<td width=590 align=center valign=top bgcolor="FFFF99">
												<B><font face=verdana size=2 color=red>THIS FILE MUST BE PROCESSED THROUGH THE REAL_EC SYSTEM</font></FONT></B>
											</td>
										</tr>
                                        </table>
</cfif>
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
<cfif read_all_notes.special_inst neq '' and read_all_notes.special_inst neq 'NULL'>
										<tr>
											<td width=590 align=center valign=top bgcolor="FFFF99">
												<B><font face=verdana size=2 color=blue>The following instructions must be followed on every order with this client:<br>
<font color="red"><cfoutput>#read_all_notes.special_inst#</cfoutput></font></FONT></B>
											</td>
										</tr>
</cfif>
									</table>
								</cfif>
<CFOUTPUT QUERY="Read_all_notes">
									<table class="title_Notes" width=650 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
										<tr>
												<cfset fontcolor = "black">
												<cfset fontweight = 'normal'>
												<cfif Trim(n_note) EQ "Clear To Close">
													<cfset fontcolor = "green">
												</cfif>
												<cfif Trim(n_note) EQ "Not Clear To Close">
													<cfset fontcolor = "red">
												</cfif>
												<cfif Trim(n_note) EQ "Collect For Subordination">
													<cfset fontcolor = "orange">
												</cfif>
												<!---Synechron Added 09/02 for Ticket 558 Start--->
                                                 <cfif Trim(n_note) EQ "Collect For Deed">
                                                     <cfset fontcolor = "orange">
                                                 </cfif>
												<!---Synechron Added 09/02 for Ticket 558  End--->
												<cfif Trim(n_note) EQ "Collect For Release">
													<cfset fontcolor = "orange">
                                                </cfif>
											<td width=255 align=left valign=top bgcolor=e1e1e1>
												<table width=255 cellpadding=1 cellspacing=1 border=0 >
													<tr <cfif fontcolor NEQ "black">style="font-weight:bold"</cfif>>
														<td width=65 align=center valign=middle bgcolor=d1d1d1>
															<font face=verdana size=1 color=#fontcolor#>
															#DateFormat(N_Date, "mm/dd/yyyy")#
														</td>
														<td width=65 align=center valign=middle bgcolor=d1d1d1>
															<font face=verdana size=1 color=#fontcolor#>
															#TimeFormat(N_Time, "HH:mm:ss")#
														</td>
														<td width=125 align=center valign=middle bgcolor=d1d1d1>
															<font face=verdana size=1 color=#fontcolor#>
															#Fname# #LName#
														</td>
													<tr>
												</table>
											<td width=444 align=left valign=top bgcolor=e1e1e1 style="word-wrap: break-word" 
											<cfif fontcolor NEQ "black">style="font-weight:bold"</cfif>>
												
												<pre><font face=verdana size=1 color=#fontcolor#>#N_Note#<cfif melanies_companies_list contains read_comp_id.ID><cfif Mid(N_Note,1,18) eq 'Not Clear To Close'> - <cfif nctc_cleared eq 'True'><font color="black">cleared</font><cfelse><a href="clear_nctc_issue.cfm?note_id=#Note_ID#"><font color="green">clear this</font></a></cfif></cfif></cfif></pre>
											</td>
										</tr>
									</table>
</CFOUTPUT>
<cfif IsDefined("session.ft_user_id") and session.ft_user_id neq 0>
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
												<pre><font face=verdana size=1 color=black>#N_Note#</pre>
											</td>
										</tr>
									</table>
</CFOUTPUT>
<p>
</cfif>
<CFFORM NAME="frm" ACTION="./Title_comments_nav.cfm?uid=#session.ft_user_id#&al=#URL.al#&rec_id=#url.rec_id#&a_trigger=1&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=1&code=#url.code#&rec_type=#url.rec_type#" METHOD=POST enctype="multipart/form-data">
<cfset RealECFlag=1>
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
												<select name="otherpro" onChange="change_it(this);"
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
<cfif (url.code eq 'T' and (read_title.comp_id eq 9016 or read_title.comp_id eq 8307)) or read_title.title_id eq 52555>
<option value=""></OPTION>
<option value="">-----------------------</OPTION>
<option value="">Secretary of Veterans Affairs Specific Events</OPTION>
<option value="">-----------------------</OPTION>
<option value="BTC Closing Pack Received">BTC Closing Pack Received</OPTION>
<option value="Deed requested from JD Prep">Deed requested from JD Prep</OPTION>
<option value="Deed Received from JD Prep">Deed Received from JD Prep</OPTION>
<option value="Deed Approved">Deed Approved</OPTION>
<option value="HUD not Received from BTC">HUD not Received from BTC</OPTION>
<option value="HUD Received">HUD Received</OPTION>
<option value="HUD Approved">HUD Approved</OPTION>
<option value=""></OPTION>
<option value="">-----------------------</OPTION>
<option value="">Other Events</OPTION>
<option value="">-----------------------</OPTION>
</cfif>







<cfif url.code neq 'A'>												>
<cfif Len(read_title.realEC_transactionID) gt 1>
<option value=""></OPTION>
<option value="">-----------------------</OPTION>
<option value="">RealEC Specific Events</OPTION>
<option value="">-----------------------</OPTION>
<option value="Send Preliminary HUD">Send Fee Sheet - 180</OPTION>
<option value="On Hold">On Hold - 230</OPTION>
<option value="On Hold Removed">On Hold Removed - 260</OPTION>

<option value="Clear to Close">Service Complete - 270 Title</OPTION>
<option value="Schedule Confirmed">Schedule Confirmed - 301</OPTION>
<option value="Order Assigned">Order Assigned - 410</OPTION>
<!---<option value="HUD Approved by Client">HUD Approved by Client - 435</OPTION>--->

<option value="Curative Cleared">Curative Cleared - 500</OPTION>
<option value="Signed Closing Package Delivered to Customer or Lender">Signed Closing Package Delivered to Customer or Lender - 690</OPTION>
<option value="Signed Documents Received From Closer">Signed Documents Received From Closer - 691</OPTION>
<option value="Mortgage Sent for Recording">Mortgage Sent for Recording - 694</OPTION>
<option value="Recorded">Recorded - 695</OPTION>
<option value="Clear to Fund">Clear to Fund - 732</OPTION>
<option value="Not Clear to Fund">Not Clear to Fund - 733</OPTION>
<option value="Loan Funded">Loan Funded - 734</OPTION>
<option value="Wire Received">Wire Received - 735</OPTION>
<option value="Closing Package Received">Closing Package Received - 761</OPTION>
<option value="Loan Closed">Loan Closed - 765</OPTION>
<option value="Loan Not Closed">Loan Not Closed - 766</OPTION>
<option value="Provider Compliance Review PASSED">Provider Compliance Review PASSED - 770</OPTION>
<option value="Provider Compliance Review FAILED">Provider Compliance Review FAILED - 771</OPTION>

<option value="Subordination Request sent to Lender">Subordination Request sent to Lender - 825</OPTION>





<option value=""></OPTION>
<option value="">-----------------------</OPTION>
<option value="">Other Events</OPTION>
<option value="">-----------------------</OPTION>
</cfif>



<cfif Len(read_title.equator_title_transactionID) gt 1>
<option value=""></OPTION>
<option value="">-----------------------</OPTION>
<option value="">Equator Specific Events</OPTION>
<option value="">-----------------------</OPTION>
<option value="Send Response for Title Update">Send Response for Title Update</OPTION>
<option value="Send Title Payable Update">Send Title Payable Update</OPTION>
<option value="Clear Vesting">Clear Vesting</OPTION>
<option value="Clear Curative">Clear Curative</OPTION>
<option value="Request Assistance">Request Assistance</OPTION>
<option value="Respond to Request for Assistance">Respond to Request for Assistance</OPTION>
<option value="Send Additional Title Cost Request">Send Additional Title Cost Request</OPTION>
<option value="Respond to Additional Title Cost Request">Respond to Additional Title Cost Request</OPTION>
<option value="Send FINAL Response to Additional Title Cost Request">Send FINAL Response to Additional Title Cost Request</OPTION>
<!--- <option value="HUD Approved by Client">HUD Approved by Client</OPTION>
<option value="Signed Closing Package Delivered to Vendor">Signed Closing Package Delivered to Vendor</OPTION>
<option value="Mortgage Sent for Recording">Mortgage Sent for Recording</OPTION>
<option value="Clear to Fund">Clear to Fund</OPTION>
<option value="Not Clear to Fund">Not Clear to Fund</OPTION>
<option value="Wire Received">Wire Received</OPTION>
<option value="Loan Not Closed">Loan Not Closed</OPTION>
<option value="Subordination Request sent to Lender">Subordination Request sent to Lender</OPTION>
<option value="Signed Documents Received">Signed Documents Received</OPTION>
<option value="Closing Instructions Uploaded">Closing Instructions Uploaded</OPTION> --->
<option value="Closing Package Received">Closing Package Received</OPTION>
<option value="Closing Package Amendment Received">Closing Package Amendment Received</OPTION>
<cfif read_title.equator_deed_sent eq 1>
<option value="Re-supply Deed and Estimated HUD">Re-supply Deed and Estimated HUD</OPTION>
<cfelse>
<option value="Supply Deed and Estimated HUD">Supply Deed and Estimated HUD</OPTION>
</cfif>

<!--- <cfif read_title.equator_hud_waiver_sent eq 1>
<option value="Resend Final HUD and Waiver">Resend Final HUD and Waiver</OPTION>
<cfelse>
<option value="Send Final HUD and Waiver">Send Final HUD and Waiver</OPTION>
</cfif> --->
<option value="Send Final HUD and Waiver">Send Final HUD and Waiver</OPTION>
<option value="Resend Final HUD and Waiver">Resend Final HUD and Waiver</OPTION>
<option value="Send Wire Confirmation">Send Wire Confirmation</OPTION>
<option value="Report Closing Delay">Report Closing Delay</OPTION>
<option value="Resolve HUD Shortage">Resolve HUD Shortage</OPTION>
<option value="Resolve HUD Overage">Resolve HUD Overage</OPTION>
<option value="Provide Recording Info">Provide Recording Info</OPTION>
<option value="Send EQUATOR Update">Send Comment or File to EQUATOR</OPTION>
<option value="Confirm Closing">Confirm Closing</OPTION>
<option value="Supply Title Grade">Supply Title Grade</OPTION>
<option value=""></OPTION>
<option value="">-----------------------</OPTION>
<option value="">Other Events</OPTION>
<option value="">-----------------------</OPTION>
</cfif>


</cfif>
	 											<option value="">Select</OPTION>
	 											<!--- --Edit (Start) Added by Synechron Development for ticket# 727 -------------------------------------------------------------------------- --->
												<option value="Problem Alert - Customer Service">Problem Alert - Customer Service</OPTION>
												<option value="Problem Alert - Processing">Problem Alert - Processing</OPTION>
												<!--- --Edit (End) Added by Synechron Development for ticket# 727 -------------------------------------------------------------------------- --->
												<!--- --Edit (Start) Added by Synechron Development for ticket# 702 -------------------------------------------------------------------------- --->
												<option value="Problem Solved - Customer Service">Problem Solved - Customer Service</OPTION>
												<option value="Problem Solved - Processing">Problem Solved - Processing</OPTION>
												<!--- --Edit (End) Added by Synechron Development for ticket# 702 -------------------------------------------------------------------------- --->
                                               
												<option value="Abstract sent - waiting for contract">Abstract sent - waiting for contract</OPTION>
                                                
												<option value="Call for Detail">Call for Detail</OPTION>
												<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
												<option value="Assign Clearance To">Assign Clearance To</OPTION>
												<option value="Clear to Close">Clear to Close</OPTION>
												<option value="Collect For Subordination">Collect For Subordination</OPTION>
												<!---Synechron Added 09/02 for Ticket 558 Start--->
                                                 <option value="Collect For Deed">Collect For Deed</OPTION>
                                                <!---Synechron Added 09/02 for Ticket 558 End--->
												<option value="Collect For Release">Collect For Release</OPTION>
												<option value="Client System Updated">Client System Updated</OPTION>
												
												<option value="Commitment Resent Tax Data Now Complete" style="thin">Commitment Resent Tax Data Now Complete</OPTION>
												<option value="Commitment Sent Taxes to Follow" style="thin">Commitment Sent Taxes to Follow</OPTION>
												<option value="Confirmed Closing with LandSafe">Confirmed Closing with LandSafe</OPTION>
												<option value="Court House Closed">Court House Closed</OPTION>
												<option value="Docs Sent For Recording">Docs Sent For Recording</OPTION>
												<option value="Final HUD/Wire Confirmation Sent">Final HUD/Wire Confirmation Sent</OPTION>
												<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
												<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>
												<option value="HUD Approval Outstanding " style="thin">HUD Approval Outstanding </OPTION>
												<option value="HUD Approval Received " style="thin">HUD Approval Received </OPTION>
												<option value="Judgments Exist">Judgments Exist</OPTION>
												<option value="Loan Closed">Loan Closed</OPTION>
												<option value="Loan Closed-Seller Rep">Loan Closed-Seller Rep</OPTION>
												<option value="Package Received" style="thin">Package Received</OPTION>
												<option value="Loan Funded">Loan Funded</OPTION>
												<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
												<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>
												<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
												<option value="Not Clear to Close">Not Clear to Close</OPTION>
												<option value="OK to fund" style="thin">OK to fund</OPTION>
												<!--- --Edit (Start) Added by Synechron Development for ticket# 179 -------------------------------------------------------------------------- --->
												<option value="On Hold">On Hold</OPTION>
												<option value="On Hold Removed">On Hold Removed</OPTION>
												<!--- --Edit (End) Added by Synechron Development for ticket# 179 -------------------------------------------------------------------------- --->
   												<option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   												<option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
   												<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>
   												<option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
												<option value="Sales Call - Full Closing">Sales Call - Full Closing</OPTION>
												<option value="Sales Call - Seller Rep Only">Sales Call - Seller Rep Only</OPTION>
												<option value="ON HOLD-Subordination Needed">ON HOLD-Subordination Needed</OPTION>
												<option value="Subordination Received">Subordination Received</OPTION>
												<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
												<option value="THIS FILE WILL BE CLEARED BY " style="thin">THIS FILE WILL BE CLEARED BY </OPTION>
												<option value="Title Policy Disclosure Complete" style="thin">Title Policy Disclosure Complete</OPTION>
												<option value="Title Update needed " style="thin">Title Update needed </OPTION>
												<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
												<option value="Vesting Issue">Vesting Issue</OPTION>
    											<option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
												<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
												<option value="Closing Invoiced">Closing Invoiced</OPTION>
												<option value="SR Closing Paid">SR Closing Paid</OPTION>
												<option value="Mortgage Recording Issue">Mortgage Recording Issue</OPTION>
												<option value="Mortgage Recording Issue RESOLVED">Mortgage Recording Issue RESOLVED</OPTION>
												<cfif #RealECFlag# eq 1>
													<option value="Notice of Order Status">Notice of Order Status</OPTION>
													<option value="Order Delinquency Notice">Order Delinquency Notice</OPTION>
													<option value="Loan Withdrawn">Loan Withdrawn</OPTION>
													<option value="Product Revision Request">Product Revision Request</OPTION><br>
													<option value="Document Attached by Customer">Document Attached by Customer</OPTION>
													<option value="Service Completed">Service Completed</OPTION>
													<option value="Service Cancel Confirmed">Service Cancel Confirmed</OPTION>
<option value="Title Claim">Title Claim</OPTION>
<option value="Title Claim Cleared">Title Claim Cleared</OPTION>
<option value="Not Ratified">Not Ratified</OPTION>
<option value="Ratified">Ratified</OPTION>
<option value="Title Issue">Title Issue</OPTION>
<option value="Title Issue Cleared">Title Issue Cleared</OPTION>



												</cfif>
<option value="Notify Me when Closing is Scheduled">Notify Me when Closing is Scheduled</OPTION>
<!---Synechron 03/22/2013  --->
<option value="Online Docs to Be Recorded">Online Docs to Be Recorded</OPTION>
<option value="Online Docs Recorded">Online Docs Recorded</OPTION>

<option value="Corporate Docs Needed">Corporate Docs Needed</OPTION>
<option value="Corporate Docs Received">Corporate Docs Received</OPTION>

<option value="Trust Docs Needed">Trust Docs Needed</OPTION>
<option value="Trust Docs Received">Trust Docs Received</OPTION>

<option value="Surveys Needed">Surveys Needed</OPTION>
<option value="Surveys Received">Surveys Received</OPTION>
<option value="Flagstar Docs Recorded">Flagstar Docs Recorded</OPTION>
<option value="Flagstar Security Instrument Received">Flagstar Security Instrument Received</OPTION>
<!---
<option value="Flagstar HUD Requested">Flagstar HUD Requested</OPTION>
<option value="Flagstar HUD Completed">Flagstar HUD Completed</OPTION>
--->
<option value="Flagstar Policy Issued">Flagstar Policy Issued</OPTION>

<!---Synechron 03/22/2013  --->

	 	 										<option value=""></option>
											  </select>
<div id="realec_reasons_dropdown" style="display:none">
												<font face=verdana size=1 color=blue>
												<br>Please select reason here</font>
												<select name="realec_reason_code" onChange="change_it(this);"
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
<cfoutput query="realec_reasons">
<option value="#realec_reasons.code#">#Mid(realec_reasons.reason, 1, 50)#<cfif Len(realec_reasons.reason) gt 50>...</cfif></OPTION>
</cfoutput>
</select>
<br>
</div>

<div id="realec_reasons_dropdown_771" style="display:none">
												<font face=verdana size=1 color=blue>
												<br>Please select reason here</font>
												<select name="realec_reason_code_771" 
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
<option value="58">AIV Form Missing</option>
<option value="59">Executed Form Missing</option>
<option value="6">Other</option>
</select>
<br>
</div>

<div id="realec_tracking_block" style="display:none">
<table>
<tr>
<td><font face=verdana size=1 color=blue>Shipping Date:</font></td>
<td><input type="text" maxlength="30" name="shipDate" style="font-size: 9;
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
													float: none; width:100px;"></td>
</tr>
<tr>
<td><font face=verdana size=1 color=blue>Courier:</font></td>
<td><input type="text" maxlength="30" name="courier" style="font-size: 9;
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
													float: none; width:100px;"></td>
</tr>
<tr>
<td><font face=verdana size=1 color=blue>Tracking Number:</font></td>
<td><input type="text" maxlength="30" name="trackingNum" style="font-size: 9;
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
													float: none; width:100px;"></td>
</tr>
<tr>
<td><font face=verdana size=1 color=blue>Sender Name:</font></td>
<td><input type="text" maxlength="30" name="senderName" style="font-size: 9;
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
													float: none; width:100px;"></td>
</tr>
</table>
</div>
<div id="realec_recording_block" style="display:none">
<table>
<tr>
<td><font face=verdana size=1 color=blue>Document Description:</font></td>
<td><input type="text" maxlength="30" name="DocumentDescription" style="font-size: 9;
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
													float: none; width:100px;"></td>
</tr>
<tr>
<td><font face=verdana size=1 color=blue>Position:</font></td>
<td><select name="documentposition" style="font-size: 9;
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
													float: none; width:100px;">

<option value=""></option>
<option value="1st">1st</option>
<option value="2nd">2nd</option>
<option value="3rd">3rd</option>
<option value="4th">4th</option>
</select></td>
</tr>
<tr>
<td><font face=verdana size=1 color=blue>Book:</font></td>
<td><input type="text" maxlength="30" name="documentBook" style="font-size: 9;
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
													float: none; width:100px;"></td>
</tr>
<tr>
<td><font face=verdana size=1 color=blue>Date Recorded:</font></td>
<td><input type="text" maxlength="30" name="dateRecorded" style="font-size: 9;
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
													float: none; width:100px;"></td>
</tr>
<tr>
<td><font face=verdana size=1 color=blue>Instrument Number:</font></td>
<td><input type="text" maxlength="30" name="instrumentNumber" style="font-size: 9;
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
													float: none; width:100px;"></td>
</tr>
<tr>
<td><font face=verdana size=1 color=blue>Page:</font></td>
<td><input type="text" maxlength="30" name="DocumentPage" style="font-size: 9;
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
													float: none; width:100px;"></td>
</tr>
</table>
</div>
<cfoutput>
<cfif url.code neq 'A'>
<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="lender_realtor_table" name="lender_realtor_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Realtors/Lenders:</b> <FONT FACE=ARIAL SIZE=1 color="black"><em>(in order for our survey to be sent, please fill at least one entry below)</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</TD>

						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name
						</TD>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name
						</TD>
						<td  width=219 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</TD>
					</tr>
					<tr>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select NAME="lender_realtor_1" style="font-size: 9;
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
									clear: none; width:75px;">
<option value="Realtor" <cfif read_title.lender_realtor_1 eq 'Realtor'>selected</cfif>>Realtor</option>
<option value="Lender" <cfif read_title.lender_realtor_1 eq 'Lender'>selected</cfif>>Lender</option>
							</select>
						</TD>

						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text" value="#read_title.lender_realtor_fname_1#" name="lender_realtor_fname_1" style="font-size: 9;
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
									clear: none;">
						</TD>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text" value="#read_title.lender_realtor_lname_1#" name="lender_realtor_lname_1" style="font-size: 9;
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
									clear: none;">
						</TD>
						<td  width=219 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text" value="#read_title.lender_realtor_email_1#" name="lender_realtor_email_1" style="font-size: 9;
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
<tr>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select NAME="lender_realtor_2" style="font-size: 9;
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
									clear: none; width:75px;">
<option value="Realtor" <cfif read_title.lender_realtor_2 eq 'Realtor'>selected</cfif>>Realtor</option>
<option value="Lender" <cfif read_title.lender_realtor_2 eq 'Lender'>selected</cfif>>Lender</option>
							</select>

						</TD>

						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text" value="#read_title.lender_realtor_fname_2#" name="lender_realtor_fname_2" style="font-size: 9;
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
									clear: none;">
						</TD>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text" value="#read_title.lender_realtor_lname_2#" name="lender_realtor_lname_2" style="font-size: 9;
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
									clear: none;">
						</TD>
						<td  width=219 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text" value="#read_title.lender_realtor_email_2#" name="lender_realtor_email_2" style="font-size: 9;
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
<tr>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select NAME="lender_realtor_3" style="font-size: 9;
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
									clear: none; width:75px;">
<option value="Realtor" <cfif read_title.lender_realtor_3 eq 'Realtor'>selected</cfif>>Realtor</option>
<option value="Lender" <cfif read_title.lender_realtor_3 eq 'Lender'>selected</cfif>>Lender</option>
							</select>
						</TD>

						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text" value="#read_title.lender_realtor_fname_3#" name="lender_realtor_fname_3" style="font-size: 9;
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
									clear: none;">
						</TD>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text" value="#read_title.lender_realtor_lname_3#" name="lender_realtor_lname_3" style="font-size: 9;
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
									clear: none;">
						</TD>
						<td  width=219 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text" value="#read_title.lender_realtor_email_3#" name="lender_realtor_email_3" style="font-size: 9;
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
									clear: none; width:200px;"><br>
<br>

						</TD>
					</tr>
			</td>
		</tr>
</table>
</cfif>


<cfif url.code eq 'T' or  url.code eq 'P'>
<cfif Len(read_id.equator_title_transactionID) GTE 1>
<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="title_update_equator_table" name="title_update_equator_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>

										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Upload a File

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="file"  NAME="title_update_file" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Comments

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="title_update_message" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>







<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="title_grade_equator_table" name="title_grade_equator_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>

										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Title Grade Document

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="file"  NAME="title_grade_file" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Grade: &nbsp;<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="title_grade" style="font-size: 9;
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
									clear: none; width:50px;">&nbsp;&nbsp;&nbsp;Lot: &nbsp;<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="grade_lot" style="font-size: 9;
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
									clear: none; width:50px;">&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="gray">
							Parcel: &nbsp;<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="grade_parcel" style="font-size: 9;
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
									clear: none; width:50px;">

						</TD>
					</tr>
</table>

</cfif>


<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="notify_me_table" name="notify_me_table">

					<tr>
						<td  colspan=2 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please enter the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=400 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email Addresses (if more than one, separate by semicolon)

						</TD>
					</tr>
					<tr>
						<td  width=400 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="notify_closing_email" style="font-size: 9;
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
									clear: none; width:350px;" value="<cfoutput>#read_role.email#</cfoutput>">
						</TD>
					</tr>
<tr>
						<td  width=400 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Reason for Notification
						</TD>
</tr>
<tr>
						<td  width=400 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="notify_closing_reason" style="font-size: 9;
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
									clear: none; width:350px;">
						</TD>
</tr>
			</td>
		</tr>
</table>

<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="not_clear_to_close_table" name="not_clear_to_close_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
<select NAME="not_clear_to_close_issue_type" style="font-size: 9;
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
									clear: none; width:200px;" onChange="change_it(this);">
<cfif melanies_companies_list contains read_comp_id.ID>
<option value="Liens" >Liens</option>
<option value="Unreleased Mortgage" >Unreleased Mortgage</option>
<option value="Survey" >Survey</option>
<option value="Other" >Other</option>
<cfelse>
<option value="Complex" <cfif read_title.lender_realtor_3 eq 'Complex'>selected</cfif>>Complex - Hard issues to resolve</option>
<option value="Simple" <cfif read_title.lender_realtor_3 eq 'Simple'>selected</cfif>>Simple - Solvable within expected time frame</option>
<option value="Customer Service Required" <cfif read_title.lender_realtor_3 eq 'Customer Service Required'>selected</cfif>>Customer Service Required - before we can move forward we need information or documents</option>
</cfif>

							</select>
						</TD>
					</tr>
</table>

<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="not_clear_to_close_table_additional" name="not_clear_to_close_table_additional">
<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Additional information

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="not_clear_to_close_issue" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>




<cfif Len(read_id.equator_title_transactionID) GTE 1>
<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="wire_conf_table" name="wire_conf_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Wire Confirmation Number

						</TD>
						<td  width=400 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Comments
						</TD>
					</tr>
					<tr>
						<td  width=100 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="wire_conf_number" style="font-size: 9;
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
									clear: none; width:75px;">
						</TD>

						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="wire_conf_comments" style="font-size: 9;
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
									clear: none; width:350px;">
						</TD>
					</tr>
			</td>
		</tr>
</table>





<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="hud_signed_table" name="hud_signed_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please check the appropriate boxes:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is Final HUD Signed And Executed?
						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="radio" name="hud_signed" id="hud_signed" value="0">No&nbsp;&nbsp;&nbsp;<input type="radio" name="hud_signed" id="hud_signed" value="1">Yes<br>
<br>

						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is Waiver Signed And Executed?
						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="radio" name="waiver_signed" id="waiver_signed" value="0">No&nbsp;&nbsp;&nbsp;<input type="radio" name="waiver_signed" id="waiver_signed" value="1">Yes<br>
<br>

						</TD>
					</tr>
			</td>
		</tr>
</table>



<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="title_issue_table" name="title_issue_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Title Issue

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="title_issue_comments" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>

			</td>
		</tr>
</table>



<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="confirm_closing_table" name="confirm_closing_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Did Closing Occur?

						</TD>
					</tr>
				<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
<select NAME="closing_occurred" style="font-size: 9;
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
									clear: none; width:75px;">
<option value="YES">YES</option>
<option value="NO - SET NEW SETTLEMENT DATE WITHIN CONTRACT PERIOD">NO - SET NEW SETTLEMENT DATE WITHIN CONTRACT PERIOD</option>
<option value="NO - EXTEND CONTRACT PERIOD">NO - EXTEND CONTRACT PERIOD</option>
							</select>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							New Estimated HUD Closing Date

						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="new_hud_closing_date" style="font-size: 9;
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
									clear: none; width:75px;">

						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Have Documents Been Recorded?

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select NAME="documents_recorded" style="font-size: 9;
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
									clear: none; width:75px;">
<option value="YES" >YES</option>
<option value="NO" >NO</option>
</select>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Closing Delay Code

						</TD>

					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select NAME="closing_delay_code" style="font-size: 9;
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
									clear: none; width:75px;">
<option value="" ></option>
<option value="REPAIRS NOT COMPLETED" >REPAIRS NOT COMPLETED</option>
<option value="VANDALISM/PROPERTY DAMAGE" >VANDALISM/PROPERTY DAMAGE</option>
<option value="DELAYED RECEIPT OF PACKAGE FROM LENDER" >DELAYED RECEIPT OF PACKAGE FROM LENDER</option>
<option value="LENDER DID NOT FUND" >LENDER DID NOT FUND</option>
<option value="LENDER DOCUMENTATION NOT COMPLETE" >LENDER DOCUMENTATION NOT COMPLETE</option>
<option value="BUYER WITHDREW FROM CONTRACT" >BUYER WITHDREW FROM CONTRACT</option>
<option value="BUYER DENIED FINANCING" >BUYER DENIED FINANCING</option>
<option value="BUYER DID NOT SHOW UP FOR CLOSING" >BUYER DID NOT SHOW UP FOR CLOSING</option>
<option value="BUYER DOES NOT HAVE FUNDS AVAILABLE TO CLOSE" >BUYER DOES NOT HAVE FUNDS AVAILABLE TO CLOSE</option>
<option value="TITLE VESTING ISSUE" >TITLE VESTING ISSUE</option>
<option value="TITLE CURATIVE ISSUE" >TITLE CURATIVE ISSUE</option>
<option value="HOA/ESTOPPEL INFORMATION NOT RECEIVED" >HOA/ESTOPPEL INFORMATION NOT RECEIVED</option>
<option value="CLOSING VENDOR DELAY" >CLOSING VENDOR DELAY</option>
<option value="WEATHER/NATURAL DISASTER" >WEATHER/NATURAL DISASTER</option>
</select>
						</TD>
					</tr>
						<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Comments

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="confirm_closing_comments" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>




<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="closing_delay_table" name="closing_delay_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
<select NAME="lender_realtor_3" style="font-size: 9;
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
									clear: none; width:75px;">
<option value="Realtor" <cfif read_title.lender_realtor_3 eq 'Realtor'>selected</cfif>>Realtor</option>
<option value="Lender" <cfif read_title.lender_realtor_3 eq 'Lender'>selected</cfif>>Lender</option>
							</select>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Closing Delay Code

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select NAME="closing_delay_code" style="font-size: 9;
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
									clear: none; width:75px;">
<option value="" ></option>
<option value="REPAIRS NOT COMPLETED" >REPAIRS NOT COMPLETED</option>
<option value="VANDALISM/PROPERTY DAMAGE" >VANDALISM/PROPERTY DAMAGE</option>
<option value="DELAYED RECEIPT OF PACKAGE FROM LENDER" >DELAYED RECEIPT OF PACKAGE FROM LENDER</option>
<option value="LENDER DID NOT FUND" >LENDER DID NOT FUND</option>
<option value="LENDER DOCUMENTATION NOT COMPLETE" >LENDER DOCUMENTATION NOT COMPLETE</option>
<option value="BUYER WITHDREW FROM CONTRACT" >BUYER WITHDREW FROM CONTRACT</option>
<option value="BUYER DENIED FINANCING" >BUYER DENIED FINANCING</option>
<option value="BUYER DID NOT SHOW UP FOR CLOSING" >BUYER DID NOT SHOW UP FOR CLOSING</option>
<option value="BUYER DOES NOT HAVE FUNDS AVAILABLE TO CLOSE" >BUYER DOES NOT HAVE FUNDS AVAILABLE TO CLOSE</option>
<option value="TITLE VESTING ISSUE" >TITLE VESTING ISSUE</option>
<option value="TITLE CURATIVE ISSUE" >TITLE CURATIVE ISSUE</option>
<option value="HOA/ESTOPPEL INFORMATION NOT RECEIVED" >HOA/ESTOPPEL INFORMATION NOT RECEIVED</option>
<option value="CLOSING VENDOR DELAY" >CLOSING VENDOR DELAY</option>
<option value="WEATHER/NATURAL DISASTER" >WEATHER/NATURAL DISASTER</option>
</select>
						</TD>
					</tr>					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Closing Delay information

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="closing_delay_comments" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>



<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="resolve_hud_shortage_table" name="resolve_hud_shortage_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Resolve HUD Shortage method

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select NAME="resolve_shortage_method" style="font-size: 9;
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
									clear: none; width:250px;">
<option value="CLOSING FELL THROUGH" >CLOSING FELL THROUGH</option>
<option value="CORRECT THE HUD" >CORRECT THE HUD</option>
<option value="WIRE FUNDS" >WIRE FUNDS</option>
</select>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Resolve HUD Shortage comments

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="resolve_hud_shortage" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>




<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="resolve_hud_overage_table" name="resolve_hud_overage_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Resolve HUD Overage method

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select NAME="resolve_overage_method" style="font-size: 9;
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
									clear: none; width:250px;">
<option value="REQUEST DISBURSEMENT FROM FNM" >REQUEST DISBURSEMENT FROM FNM</option>
<option value="CORRECT THE HUD" >CORRECT THE HUD</option>
</select>
						</TD>
					</tr>
										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Resolve HUD Overage comments

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="resolve_hud_overage" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>





<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="title_update_table" name="title_update_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Title Update

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="title_update_message" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>


<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="title_payable_update_table" name="title_payable_update_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Title Payable Update

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="title_payable_update_message" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>




<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="clear_vesting_table" name="clear_vesting_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Clear Vesting Type

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select name="clear_vesting_type" style="font-size: 9;
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
									clear: none; width:450px;">
							<option value="">---Select---</option>
							<option value="NO FORECLOSURE DEED - VESTING">NO FORECLOSURE DEED - VESTING</option>
							<option value="FANNIE MAE IS NOT IN TITLE - VESTING">FANNIE MAE IS NOT IN TITLE - VESTING</option>
							<option value="TAXES - VESTING">TAXES - VESTING</option>
							<option value="HOA - VESTING">HOA - VESTING</option>
							</select>
						</TD>
					</tr>
										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Upload a File

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="file"  NAME="clear_vesting_file" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Comments

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="clear_vesting_message" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>





<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="clear_curative_table" name="clear_curative_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Clear Curative Type

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select name="clear_curative_type" style="font-size: 9;
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
									clear: none; width:450px;">
							<option value="">---Select---</option>
							<option value="LEGAL DESCRIPTION - CURATIVE">LEGAL DESCRIPTION - CURATIVE</option>
							<option value="IRS REDEMPTION - CURATIVE">IRS REDEMPTION - CURATIVE</option>
							<option value="LIENS - CURATIVE">LIENS - CURATIVE</option>
							<option value="MORTGAGES AND JUDGEMENTS - CURATIVE">MORTGAGES AND JUDGEMENTS - CURATIVE</option>
							<option value="MOBILE HOME/MANUFACTURED HOUSING - CURATIVE">MOBILE HOME/MANUFACTURED HOUSING - CURATIVE</option>
							<option value="CODE VIOLATION - CURATIVE">CODE VIOLATION - CURATIVE</option>
							<option value="LAND RENT - CURATIVE">LAND RENT - CURATIVE</option>
							</select>
						</TD>
					</tr>
										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Upload a File

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="file"  NAME="clear_curative_file" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Comments

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="clear_curative_message" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>





<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="request_assistance_table" name="request_assistance_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Request Assistance Type

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select name="request_assistance_type" style="font-size: 9;
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
									clear: none; width:450px;">
							<option value="">---Select---</option>
							<option value="HOA ESTOPPELS">HOA ESTOPPELS</option>
							<option value="LEGAL FEES">LEGAL FEES</option>
							<option value="SURVEY FEES">SURVEY FEES</option>
							<option value="DOCUMENT PREPARATION">DOCUMENT PREPARATION</option>
							<option value="RECORDING FEES">RECORDING FEES</option>
							<option value="OTHER">OTHER</option>
							</select>
						</TD>
					</tr>
										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Comments

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="request_assistance_message" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>



<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="additional_cost_table" name="additional_cost_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Additional Cost

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="additional_cost" style="font-size: 9;
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
									clear: none; width:50px;">
						</TD>
					</tr>					<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Additional Cost Type

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<select name="additional_cost_type" style="font-size: 9;
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
									clear: none; width:450px;">
							<option value="">---Select---</option>
							<option value="HOA ESTOPPELS">HOA ESTOPPELS</option>
							<option value="LEGAL FEES">LEGAL FEES</option>
							<option value="SURVEY FEES">SURVEY FEES</option>
							<option value="DOCUMENT PREPARATION">DOCUMENT PREPARATION</option>
							<option value="RECORDING FEES">RECORDING FEES</option>
							<option value="OTHER">OTHER</option>
							</select>
						</TD>
					</tr>
										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Comments

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="additional_cost_message" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>





<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="additional_cost_response_table" name="additional_cost_response_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>

										<tr>
						<td  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Comments

						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="additional_cost_response_message" style="font-size: 9;
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
									clear: none; width:450px;">
						</TD>
					</tr>
</table>





<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="provide_recording_info_table" name="provide_recording_info_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Please send the following information:</em></font>
						</TD>
					</tr>
					<tr>
						<td  colspan=4  width=500 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Provide Recording Info

						</TD>
					</tr>
					<tr>
						<td  align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Deed Recording Date

						</TD>
						<td  align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Instrument No.

						</TD>
						<td  align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Comments

						</TD>
					</tr>
					<tr>
						<td align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="deed_recording_date" style="font-size: 9;
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
									clear: none; width:100px;">
						</TD>
						<td align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="deed_instrument_number" style="font-size: 9;
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
									clear: none; width:100px;">
						</TD>
						<td align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="deed_comments" style="font-size: 9;
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
									clear: none; width:300px;">
						</TD>
					</tr>
</table>




</cfif>
</cfif>
</cfoutput>
	<br><br>


<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="loan_closed_table" name="loan_closed_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="maroon">
							<b>The time/date shown below will be recorded as the Loan Closed Date/Time:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="loan_closed_datetime" style="font-size: 9;
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
									clear: none; width:200px;" value="<cfoutput>#DateFormat(Now(), 'mm/dd/yyyy')# #TimeFormat(Now(), 'short')#</cfoutput>">
						</TD>
					</tr>	
</table>


<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="loan_funded_table" name="loan_funded_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="maroon">
							<b>The time/date shown below will be recorded as the Loan Funded Date/Time:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="loan_funded_datetime" style="font-size: 9;
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
									clear: none; width:200px;" value="<cfoutput>#DateFormat(Now(), 'mm/dd/yyyy')# #TimeFormat(Now(), 'HH:mm:ss')#</cfoutput>">
						</TD>
					</tr>
</table>

<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="docs_recorded_table" name="docs_recorded_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="maroon">
							<b>The time/date shown below will be recorded as the Docs Sent For Recording Date/Time:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="docs_recorded_datetime" style="font-size: 9;
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
									clear: none; width:200px;" value="<cfoutput>#DateFormat(Now(), 'mm/dd/yyyy')# #TimeFormat(Now(), 'HH:mm:ss')#</cfoutput>">
						</TD>
					</tr>
</table>

<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="hud_wire_table" name="hud_wire_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="maroon">
							<b>The time/date shown below will be recorded as the Final HUD/Wire Confirmation Date/Time:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="hud_wire_datetime" style="font-size: 9;
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
									clear: none; width:200px;" value="<cfoutput>#DateFormat(Now(), 'mm/dd/yyyy')# #TimeFormat(Now(), 'HH:mm:ss')#</cfoutput>">
						</TD>
					</tr>
</table>

<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1  style="display:none;" id="confirmed_closing_table" name="confirmed_closing_table">

					<tr>
						<td  colspan=4 width=519 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="maroon">
							<b>The time/date shown below will be recorded as the Confirmed Closing with Landsafe Date/Time:</em></font>
						</TD>
					</tr>
					<tr>
						<td  width=300 align=left valign=top bgcolor=f1f1f1>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<input type="text"  NAME="confirmed_closing_datetime" style="font-size: 9;
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
									clear: none; width:200px;" value="<cfoutput>#DateFormat(Now(), 'mm/dd/yyyy')# #TimeFormat(Now(), 'HH:mm:ss')#</cfoutput>">
						</TD>
					</tr>
</table>


<!--- --Edit (Start) Added by Synechron Development for ticket# 179 -------------------------------------------------------------------------------------- --->
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
</table><!--- --Edit (End) Added by Synechron Development for ticket# 179 -------------------------------------------------------------------------------------- --->



<!--- --Edit (Start) Added by Synechron Development for ticket# 702 -------------------------------------------------------------------------- --->

<div name="ProblemResolvediv" id="ProblemResolvediv" style="display:none">
<font face=verdana size=1 color=blue>Problem/Resolution Text:<br>
<TEXTAREA type="text" name="txtprobalert" id="txtprobalert" COLS=80 ROWS=5 style="font-size: 9;
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
												clear: none;"></TEXTAREA><br>
</div>

<!--- --Edit (End) Added by Synechron Development for ticket# 702 -------------------------------------------------------------------------- --->

<div name="ctcStuff" id="ctcStuff" style="display:none;">
<font face=verdana size=1 color=blue>Assign To:<br>
<select name="ctcReview" id="ctcReview" style="font-size: 9;
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
									border-style: bar;">
                            <option value=""></option>
                            <option value="542">Alyssa Robinson</option>							                            <option value="630">Amber Lindamood</option>
							<option value="500">Amelia Bullick</option>
							<option value="643">Brandi White</option>
							<option value="642">Brandon	Chisolm</option>
							<option value="525">Corey Gentry</option>
							<option value="514">DIL</option>
							<option value="638">Evelyn Waithaka</option>
							<option value="535">Michigan</option>
							<option value="524">Nathan Wood</option>
							<option value="641">Jammie	Jackson</option>
							<option value="611">Kathryn	Baziluik</option>
							<option value="476">LaKeisha Wilson</option>
							<option value="597">P. Hunter Fahrney, Esq.</option>
							<option value="618">Pam	Starling</option>
							<option value="523">Pamela Fotherby</option>
							<option value="609">Patrick	Jones</option>
							<option value="536">Peggy McGinley</option>
							<option value="505">Richmond</option>
							<option value="632">Sarah Peterson</option>
							<option value="352">Shenique Perrin</option>
							<option value="633">Sherry Bratton</option>
							<option value="511">Streamline Title</option>
							<option value="504">Subordination Department</option>
							<option value="649">Sunday Smith</option>
							<option value="631">Tiffany Tomasino</option>
							<option value="507">Washington/Oregon</option>
							<!---<option value="495">Christina Frankenberg</option>--->
							<!---<option value="344">Randa Ibrahim</option>--->
							<!---<option value="490">Jennifer Mulling</option>--->
						    <!---<option value="318">Steve Sacks</option>--->
						    <!---<option value="526">Erin Smith</option>--->
						    <!--- <option value="527">Texas Office</option> --->
						    <!---<option value="483">Billie Thompson</option>--->
							<!---<option value="549">Jennifer Creel</option>--->
							
							<!---<option value="562">Douglas May</option>--->
							<!---<option value="586">Ana Azucena-Portillo</option>--->
							<!---<option value="615">Marissa	Bacino</option>--->
							<!---<option value="578">Alexandrea Redd</option>--->
</select>
<br>
<br>
<font face=verdana size=1 color=blue>
Additional Info:<br>
<TEXTAREA name="ctc_Review_AdditionalInfo"  id="ctc_Review_AdditionalInfo" COLS=80 ROWS=5
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
												clear: none;"></TEXTAREA><br>
<br>
<br>
</div>



<div name="docs_recorded_pop" id="docs_recorded_pop" style="display:none;">
Please enter the date Documents were recorded (mm/dd/yyyy):<br>
<input type="text" name="docs_recorded_date"  id="docs_recorded_date" size=12 
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
												clear: none;"><br>
<br>
<br>
</div>




<div name="sec_inst_pop" id="sec_inst_pop" style="display:none;">
Please enter the date Documents were recorded (mm/dd/yyyy):<br>
<input type="text" name="sec_inst_date"  id="sec_inst_date" size=12 
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
												clear: none;"><br>
<br>
<br>
</div>

<br><br><font face=verdana size=1 color=blue>Or type additional comments below and click "Add" <br><br>
<table><tr><td valign="top">
												<TEXTAREA name="N_Note_1" onFocus="cant_edit(this);" COLS=80 ROWS=5
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
<cfif url.code neq 'A'>
<cfif Len(read_title.realEC_transactionID) gt 1>
<font face=verdana size=1 color=black><b><BR>This comment relates to: <INPUT TYPE=radio NAME="realec_productcode" VALUE="3"
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
									clear: none;" >&nbsp;Title&nbsp;&nbsp;<INPUT TYPE=radio NAME="realec_productcode" VALUE="29"
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
									clear: none;" >&nbsp;Closing&nbsp;&nbsp;<INPUT TYPE=radio NAME="realec_productcode" VALUE="<cfoutput>#dsprodID#</cfoutput>"
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
									clear: none;" >&nbsp;Doc Signing</font></b>
												</td>
												<td valign="top" width="15"><INPUT TYPE=checkbox NAME="realec_curative" VALUE="1"
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

</td>
												<td valign="top">
						<font face=verdana size=1 color=black>
												<b>This a RealEC<br>
Curative Issue</font></b>
												</td>



												<td valign="top" width="15"><INPUT TYPE=checkbox NAME="action_needed" VALUE="1"
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

												</td>
																								<td valign="top">
																		<font face=verdana size=1 color=black>
																								<b>This Comment<br>
												Requires Action</font></b>
												</td>
												</cfif></cfif></tr></table>

												<br>
												Email address to send note to:
						 <INPUT TYPE=TEXT NAME="email" VALUE="" MaxLength=200 Size=75
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
										<cfif Len(read_title.realEC_transactionID)>
											<tr>
											<td width=590 align=left valign=top bgcolor=e1e1e1>
												<font face=verdana size=1 color=black>
												<b><INPUT TYPE="checkbox" NAME="internalOnly" value="1"> Check this box if you would like this comment NOT to be sent to RealEC
										</tr>
										</cfif>
										<tr>
											<td width=590 align=right valign=top bgcolor=e1e1e1>
												<input type=image src="./images/button_add.gif" border=0>
										</tr>
									</table>
								</table>
							</td>
						</tr>
				</table>
			
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


