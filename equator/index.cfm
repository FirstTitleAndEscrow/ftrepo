<cfset first_title_equator_username = 'FirstEquator'>
<cfset first_title_equator_password = 'FirstEQ9639'>
<cfset streamline_equator_username = 'Equator'>
<cfset streamline_equator_password = 'EquatorPass'>


<CFSETTING enablecfoutputonly="yes">
<cfset our_st_vendor_id = 27235>
<cfset our_ft_vendor_id = 35221>
<!---'35250'  - QA number- 
'35221' - production Number --->


<!--- use these when we go live --->
<!--- Streamline --->

<cfset st_company_id =  3568><!--- Fannie Mae - Sharpiro & Burson --->
<cfset lo_id =  56> <!--- Pam --->
<cfset lp_id =  56> <!--- Pam --->
<cfset st_team_id =  46> <!--- Team Equator --->

<!--- use these when we go live --->
<!--- First Title --->

<cfset ft_company_id =  12324><!--- Fannie Mae National --->
<cfset lo_id =  56> <!--- Pam --->
<cfset lp_id =  56> <!--- Pam --->
<cfset ft_team_id =  97> <!--- Fannie Mae --->


<cfset testing_email = 'rjermain@firsttitleservices.com'>

<!--- all orders will go to the same account, and same loan officer and loan processor --->

<!---
<cfset company_id =  1754><!--- TEST ACCOUNT --->
<cfset lo_id =  6295> <!--- Rick jermain --->
<cfset lp_id =  4614> <!--- Rick jermain --->
<cfset team_id =  11> <!--- Inactive/TestAccounts --->
--->



<cfset missing_fields = "">

<cfset x = GetHttpRequestData()>
<cfset dataString = ToString(x.content)>
<cfset posted_xml_filename = "POST_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\posted_xml\#posted_xml_filename#" nameconflict="makeunique" output="#Trim(datastring)#">

<cfset xml_successful = 0>
<!--- let's make sure they sent valid XML and if so send back a Success message --->
<cftry>
<CFSET MyXml = XmlParse(Trim(dataString))>
<!--- if successful, return succes --->
<cfset xml_successful = 1>
<cfcatch type="any">
<!--- if fails, return failure --->
<cfset xml_successful = 0>
<cfinvoke	component = "cfc.equator"	method = "sendFailure" message="Post Failed - Bad XML" posted_xml_filename="#posted_xml_filename#" condition="XSD_VALIDATION">
</cfcatch>
</cftry>

<cfif xml_successful eq 1> <!--- let's make sure the post is sent with Equator's proper credentials --->
<cfset user = MyXml.message.header.LoginAccountIdentifier.xmltext>
<cfset pass = MyXml.message.header.LoginAccountPassword.xmltext>
<cfinvoke	component = "cfc.equator"	method = "checkCredentials" sent_username="#user#" sent_password="#pass#" posted_xml_filename="#posted_xml_filename#">
</cfif>
<cfif xml_successful eq 1>
<cfinvoke	component = "cfc.equator"	method = "sendSuccess" message="Successfully Accepted Post" posted_xml_filename="#posted_xml_filename#" condition="Success">
</cfif>

<cfset company_id = st_company_id>
<cfset team_id = st_team_id>

<CFSETTING enablecfoutputonly="yes">
<cfif xml_successful eq 1>
<cfset transactionId = MyXml.message.body.order.xmlattributes.transactionID>


<cftry>

<cfif user eq 'FirstEquator' and pass eq 'FirstEQ9639'>
<cfset vendorId = 35221>
<cfelseif user eq 'Equator' and pass eq 'EquatorPass'>
<cfset vendorId = 27235>
</cfif>

<cfif vendorID eq our_ft_vendor_id>
<cfset company_id = ft_company_id>
<cfset team_id = ft_team_id>
<cfelse>
<cfset company_id = st_company_id>
<cfset team_id = st_team_id>
</cfif>

<cfcatch type="any"></cfcatch>
</cftry>



<cftry>
<cfset order_type = MyXml.message.body.order.Type.xmltext>
<cfcatch type="any">
</cfcatch>
</cftry>


		<CFQUERY datasource="#request.dsn#" NAME="find_file">
			select * from title
			where equator_closing_transactionID = '#transactionId#'
			and comp_id = '#company_id#'
		</CFQUERY>
		<cfif find_file.recordcount gte 1>
		<cfset order_type = 'closing'>
		<cfelse>
				<CFQUERY datasource="#request.dsn#" NAME="find_file">
					select * from title
					where equator_title_transactionID = '#transactionId#'
					and comp_id = '#company_id#'
				</CFQUERY>
				<cfif find_file.recordcount gte 1>
				<cfset order_type = 'title'>
				</cfif>
		</cfif>
</cfif>


<cfparam name="order_type" default="title">


	<cfif MyXml.message.body.order.xmlattributes.action eq 'NEW_ORDER'>

		<cfinclude template="templates/add_temp_new_order.cfm">


	
	<cfelseif MyXml.message.body.order.xmlattributes.action eq 'NEW_DELIVERABLE'>

        <cfif order_type eq 'title'>
            <cfif IsDefined("MyXml.message.body.order.AcceptRejectRequest")>
			<cfinclude template="templates/accept_reject_new_order.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.SupplyTitleAndGradeRequest")>
				<cfinclude template="templates/supply_title_grade.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ReportTitleFindingsFormRequest")>
			<cfset pool_file = 0>
				<cfinclude template="templates/report_title_findings_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ReportTitleFindingsRequest")>
			<cfset pool_file = 0>
				<cfinclude template="templates/report_title_findings_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ReportTitleFindingsFormPoolRequest")>
			<cfset pool_file = 1>
				<cfinclude template="templates/report_title_findings_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ReportTitleFindingsPoolRequest")>
			<cfset pool_file = 1>
				<cfinclude template="templates/report_title_findings_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.TitleUpdateVendorRequest")>
				<cfinclude template="templates/title_update_vendor.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.TitlePayableUpdateRequest")>
				<cfinclude template="templates/title_payable_update.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ClearCurativeRequest")>
				<cfinclude template="templates/clear_curative_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.RequestAssistanceTitleRequest")>
				<cfinclude template="templates/request_assistance_title.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.AdditionalTitleCostsRequest")>
				<cfinclude template="templates/additional_title_costs_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.AdditionalTitleCostsResponseRequest")>
				<cfinclude template="templates/additional_title_costs_response_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.VestingPayableReportTaxesRequest")>
				<cfinclude template="templates/vesting_payable_report_taxes.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.VestingPayableReportHOARequest")>
				<cfinclude template="templates/vesting_payable_report_hoa.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.CurativePayableReportLiensRequest")>
				<cfinclude template="templates/curative_payable_report_liens.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.CurativePayableReportLandRequest")>
				<cfinclude template="templates/curative_payable_report_land.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.InvoiceAndCompleteRequest")>
				<cfinclude template="templates/invoice_and_complete_title.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order") and MyXml.message.body.order.xmlAttributes.action eq 'CANCEL'>
				<cfinclude template="templates/cancel_title_order.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order") and MyXml.message.body.order.xmlAttributes.action eq 'HOLD'>
				<cfinclude template="templates/hold_title_order.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order") and MyXml.message.body.order.xmlAttributes.action eq 'REOPEN'>
				<cfinclude template="templates/reopen_closing_order.cfm">
				<cfabort>
			</cfif>
        <cfelseif order_type eq 'closing'>
        

            <cfif IsDefined("MyXml.message.body.order.AcceptRejectRequest")>
			<cfinclude template="templates/accept_reject_new_order.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ReceiveContractPackageRequest")>
				<cfinclude template="templates/receive_contract_package_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ReceiveContractAmendmentRequest")>
				<cfinclude template="templates/receive_contract_package_amendment_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.SupplyEstimatedHUDAndDeedRequest")>
				<cfinclude template="templates/supply_est_deed_hud.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ReSupplyEstimatedHUDAndDeedRequest")>
				<cfinclude template="templates/resupply_est_deed_hud.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.SupplyFinalHUDAndWaiverRequest")>
				<cfinclude template="templates/supply_final_hud_and_waiver.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ReSupplyFinalHUDAndWaiverRequest")>
				<cfinclude template="templates/resupply_final_hud_and_waiver.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.WireConfirmationRequest")>
				<cfinclude template="templates/wire_confirmation_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ReportTitleIssueRequest")>
				<cfinclude template="templates/report_title_issue_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ReportClosingDelayRequest")>
				<cfinclude template="templates/report_closing_delay_request.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ResolveHUDShortageRequest")>
				<cfinclude template="templates/resolve_hud_shortage.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ResolveHUDOverageRequest")>
				<cfinclude template="templates/resolve_hud_overage.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.ProvideRecordingInfoRequest")>
				<cfinclude template="templates/provide_recording_info.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order.InvoiceAndCompleteRequest")>
				<cfinclude template="templates/invoice_and_complete.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order") and MyXml.message.body.order.xmlAttributes.action eq 'CANCEL'>
				<cfinclude template="templates/cancel_closing_order.cfm">
				<cfabort>
			<cfelseif IsDefined("MyXml.message.body.order") and MyXml.message.body.order.xmlAttributes.action eq 'HOLD'>
				<cfinclude template="templates/hold_closing_order.cfm">
				<cfabort>
			</cfif>
		</cfif>

<cfelseif MyXml.message.body.order.xmlattributes.action eq 'HOLD'>
    <cfif order_type eq 'title'>
				<cfinclude template="templates/hold_title_order.cfm">
				<cfabort>
     <cfelse>
				<cfinclude template="templates/hold_closing_order.cfm">
				<cfabort>
	 </cfif> 

<cfelseif MyXml.message.body.order.xmlattributes.action eq 'CANCEL'>
     <cfif order_type eq 'title'>
				<cfinclude template="templates/cancel_title_order.cfm">
				<cfabort>
     <cfelse>
				<cfinclude template="templates/cancel_closing_order.cfm">
				<cfabort>
	 </cfif>

<cfelseif MyXml.message.body.order.xmlattributes.action eq 'REOPEN'>
     <cfif order_type eq 'title'>
				<cfinclude template="templates/reopen_title_order.cfm">
				<cfabort>
     <cfelse>
				<cfinclude template="templates/reopen_closing_order.cfm">
				<cfabort>
	 </cfif>
	 
	 
<cfelseif MyXml.message.body.order.xmlattributes.action eq 'UPDATE'>
    <cfif order_type eq 'title'>
	   			<cfif IsDefined("MyXml.message.body.order.ClearVestingRequest")>
				<cfinclude template="templates/clear_vesting_request.cfm">
				<cfabort>
	   			<cfelseif IsDefined("MyXml.message.body.order.ClearCurativeRequest")>
				<cfinclude template="templates/clear_curative_request.cfm">
				<cfabort>
				</cfif>
     <cfelse>
				<cfinclude template="templates/reopen_closing_order.cfm">
				<cfabort>
	 </cfif>
	 
	 
</cfif>
