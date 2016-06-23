<cfparam name="previous_loan_month" default="1">
<cfparam name="previous_loan_year" default="">

<cfparam name="opt_alta_4" default="0">
<cfparam name="opt_alta_4_1" default="0">
<cfparam name="opt_alta_5" default="0">
<cfparam name="opt_alta_5_1" default="0">
<cfparam name="opt_alta_6" default="0">
<cfparam name="opt_alta_6_1" default="0">
<cfparam name="opt_alta_6_2" default="0">
<cfparam name="opt_alta_7" default="0">
<cfparam name="opt_alta_8_1" default="1">
<cfparam name="opt_alta_9" default="1">



<cfparam name="opt_tx_1" default="0">
<cfparam name="opt_tx_2" default="1">
<cfparam name="opt_tx_3" default="0">
<cfparam name="opt_tx_4" default="0">
<cfparam name="opt_tx_5" default="1">
<cfparam name="opt_tx_6" default="0">
<cfparam name="opt_tx_7" default="0">
<cfparam name="opt_tx_8" default="0">
<cfparam name="opt_tx_9" default="0">
<cfparam name="opt_tx_10" default="0">
<cfparam name="opt_tx_11" default="0">
<cfparam name="opt_tx_12" default="0">
<cfparam name="opt_tx_13" default="0">
<cfparam name="opt_tx_14" default="0">


<cfset missing_fields = "">






<cftry>
<CFSET prop_use_type = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes.PropertyUsageType>
<cfif prop_use_type eq 'PrimaryResidence'>
<cfset prop_use_type = '1'>
<cfelse>
<cfset prop_use_type = '2'>
</cfif>
<cfcatch>
<cfset missing_fields = ListAppend(missing_fields, "Property Usage Type", ",")>
</cfcatch>
</cftry>


<cfset pstate = ''>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State neq "">
<CFSET pstate = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "Property State", ",")>
</cfif>


<CFSET prop_type = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Product_Data.Loan_Features.xmlattributes.GSEPropertyType>

<cfif prop_type eq 'ManufacturedHousing'>
<cfset opt_alta_7 = 1>
</cfif>

<cfif prop_type eq 'Cooperative'>
</cfif>

<cfset condo_indicator = ''>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlChildren[1].XmlATTRIBUTES.CondominiumIndicator" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlChildren[1].XmlATTRIBUTES.CondominiumIndicator neq "">
<CFSET condo_indicator = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlChildren[1].XmlATTRIBUTES.CondominiumIndicator>
</cfif>
<cfif condo_indicator eq 'Y'>
<cfset opt_alta_4_1 = 1>
<cfelse>
<cfset opt_alta_4_1 = 0>
</cfif>

<cfset PUD_indicator = ''>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES.PlannedUnitDevelopmentIndicator" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES.PlannedUnitDevelopmentIndicator neq "">
<CFSET PUD_indicator = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES.PlannedUnitDevelopmentIndicator>
</cfif>
<cfif PUD_indicator eq 'Y'>
<cfset opt_alta_5_1 = 1>
<cfelse>
<cfset opt_alta_5_1 = 0>
</cfif>


<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress neq "">
<CFSET paddress = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress>
<cfelse>
<CFSET paddress = "">
</cfif>


<cfset condo_indicator = ''>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY._DETAILS.XmlATTRIBUTES.CondominiumIndicator" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY._DETAILS.XmlATTRIBUTES.CondominiumIndicator neq "">
<CFSET condo_indicator = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY._DETAILS.XmlATTRIBUTES.CondominiumIndicator>
</cfif>
<cfif condo_indicator eq 'Y'>
<cfset form.opt_alta_4_1 = 1>
<cfset opt_alta_4_1 = 1>
<cfelse>
<cfset form.opt_alta_4_1 = 0>
<cfset opt_alta_4_1 = 0>
</cfif>

<cfset PUD_indicator = ''>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES.PlannedUnitDevelopmentIndicator" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES.PlannedUnitDevelopmentIndicator neq "">
<CFSET PUD_indicator = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES.PlannedUnitDevelopmentIndicator>
</cfif>
<cfif PUD_indicator eq 'Y'>
<cfif pstate eq 'TX'>
<cfset form.opt_tx_4 = 1>
<cfset opt_tx_4 = 1>
<cfelse>
<cfset form.opt_alta_5_1 = 1>
<cfset opt_alta_5_1 = 1>
</cfif>
<cfelse>
<cfset form.opt_alta_5_1 = 0>
<cfset opt_alta_5_1 = 0>
<cfset form.opt_tx_4 = 0>
<cfset opt_tx_4 = 0>
</cfif>

<cfset cashoutrefi_indicator = 'N'>
<cfset opt_tx_9 = 0>
<cfset opt_tx_10 = 0>
<cftry>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.CONSTRUCTION_REFINANCE_DATA.xmlattributes.GSERefinancePurposeType" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.CONSTRUCTION_REFINANCE_DATA.xmlattributes.GSERefinancePurposeType eq "CashOutOther" and pstate eq 'TX'>
<CFSET cashoutrefi_indicator = 'Y'>
</cfif>
<cfif cashoutrefi_indicator eq 'Y'>
<cfset opt_tx_9 = 1>
<cfset opt_tx_10 = 1>
<cfelse>
<cfset opt_tx_9 = 0>
<cfset opt_tx_10 = 0>
</cfif>
<cfcatch>
<cfset opt_tx_9 = 0>
<cfset opt_tx_10 = 0>
</cfcatch>
</cftry>

<cfset closing_type = ''>

<cftry>
<CFSET type = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes._Type>
<CFSET SearchType = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes._Type>
<cfif SearchType eq 'ConstructionOnly'>
<CFSET SearchType = 'Construction'>
<cfset closing_type = 2>
</cfif>
<cfcatch>
<cfset missing_fields = ListAppend(missing_fields, "Loan Purpose", ",")>
</cfcatch>
</cftry>



<!--- <cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes.PropertyUsageType" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes.PropertyUsageType neq "">
<CFSET prop_use_type = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes.PropertyUsageType>
<cfif prop_use_type eq 'PrimaryResidence'>
<cfset prop_use_type = 'Primary Residence'>
<cfelse>
<cfset prop_use_type = 'Investment/Other'>
</cfif>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Property City", ",")>
</cfif> --->


<!--- <cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes.PropertyUsageType" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes.PropertyUsageType neq "">
<CFSET prop_use_type = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes.PropertyUsageType>
<cfif prop_use_type eq 'PrimaryResidence'>
<cfset prop_use_type = 'Primary Residence'>
<cfelse>
<cfset prop_use_type = 'Investment/Other'>
</cfif>
<cfelse>
<cfset prop_use_type = 'Primary Residence'>
</cfif> --->



<!--- first time home buyer --->
<CFSET first_time_buyer = 0>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].BORROWER.DECLARATION.XmlATTRIBUTES.BorrowerFirstTimeHomebuyerIndicator" default="N">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].BORROWER.DECLARATION.XmlATTRIBUTES.BorrowerFirstTimeHomebuyerIndicator eq "Y">
<CFSET first_time_buyer = 1>
</cfif>

<cftry>
<CFSET pcounty = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._County>
<cfcatch>
<cfset missing_fields = ListAppend(missing_fields, "Property Address must have a valid County", ",")>
</cfcatch>
</cftry>


<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._City" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._City neq "">
<CFSET pcity = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._City>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "Property City", ",")>
</cfif>



<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._PostalCode" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._PostalCode neq "">
<CFSET pzip = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._PostalCode>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "Property Zip Code", ",")>
</cfif>


<!--- <cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress neq "">
<CFSET paddress = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Property Address", ",")>
</cfif> --->
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress neq "">
<CFSET paddress = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress>
<cfelse>
<CFSET paddress = "">
</cfif>



<cftry>
<CFSET type = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes._Type>
<CFSET SearchType = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes._Type>
<cfcatch>
<cfset missing_fields = ListAppend(missing_fields, "Loan Purpose", ",")>
</cfcatch>
</cftry>

<!--- <cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes._Type" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes._Type neq "">
<CFSET type = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes._Type>
<CFSET SearchType = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes._Type>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Loan Purpose", ",")>
</cfif>
 --->




<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.BorrowerRequestedLoanAmount" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.BorrowerRequestedLoanAmount neq "">
<CFSET loan_amount = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.BorrowerRequestedLoanAmount>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "Loan Amount", ",")>
</cfif>



<cfparam name="MyXml.request.Data.Main.Loan.XmlChildren[1].BORROWER.DECLARATION.XmlAttributes.BorrowerFirstTimeHomebuyerIndicator" default="">
<cfif MyXml.request.Data.Main.Loan.XmlChildren[1].BORROWER.DECLARATION.XmlAttributes.BorrowerFirstTimeHomebuyerIndicator eq "Y">
<CFSET first_time_buyer = 1>
<cfelse>
<CFSET first_time_buyer = 0>
</cfif>



<CFQUERY datasource="#request.dsn#" NAME="get_all_comp_info">
SELECT * FROM Companies where ID = #trim(comp_id)#
</CFQUERY>


<cfif IsDefined("SearchType") and SearchType eq 'Purchase' and (pstate eq 'HI' or pstate eq 'AK' or pstate eq 'OR' or pstate eq 'CA' or pstate eq 'WA' or pstate eq 'NV' or pstate eq 'UT' or pstate eq 'ID' or pstate eq 'NM' or pstate eq 'WY' or pstate eq 'OK' or pstate eq 'SD' or pstate eq 'AR' or pstate eq 'IA')   and (get_all_comp_info.ID NEQ 9165 and get_all_comp_info.ID NEQ 11726)>
<cfinvoke	component = "cfc.encompass"	method = "throwError" message="We are currently not accepting Purchase transactions in #pstate#." encompass_transaction_id="#encompass_id#" condition="Error"><cfabort>
</cfif>

<cfif IsDefined("SearchType") and SearchType eq 'Purchase'>
<cftry>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].TRANSACTION_DETAIL.xmlattributes.PurchasePriceAmount" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].TRANSACTION_DETAIL.xmlattributes.PurchasePriceAmount neq "">
<CFSET purchase_price = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].TRANSACTION_DETAIL.xmlattributes.PurchasePriceAmount>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "Purchase Price", ",")>
</cfif>
<cfcatch>
<cfset missing_fields = ListAppend(missing_fields, "Purchase Price", ",")>
</cfcatch>
</cftry>
<cfelse>
<cfset purchase_price = 0>
</cfif>

<!--- <cfoutput>
searchtype = #SearchType#<br>
prop_use_type = #prop_use_type#<br>
pstate = #pstate#<br>
</cfoutput>
<cfabort> --->


<cfparam name="orig_loan_amount" default=""><br>
<cftry>
<CFSET orig_loan_amount = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LOAN_PURPOSE.CONSTRUCTION_REFINANCE_DATA.xmlattributes.PropertyExistingLienAmount>
<cfcatch></cfcatch></cftry>


<cfif IsDefined("SearchType") and SearchType neq 'Purchase' and IsDefined("pstate") and (pstate eq "NY" or pstate eq "MD" or pstate eq "TX" or pstate eq "VA") and IsDefined("prop_use_type") and prop_use_type eq 'Primary Residence'>




<cfif orig_loan_amount neq "">
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "Original Loan Amount (complete the Existing Lien field on page 1 of the 1003 under 'Refinance Loan'", ",")>
</cfif>


<cfparam name="previous_loan_year" default=""><br>
<cftry>
<CFSET previous_loan_year = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LOAN_PURPOSE.CONSTRUCTION_REFINANCE_DATA.xmlattributes.PropertyAcquiredYear>
<cfcatch></cfcatch></cftry>
<cfif previous_loan_year neq "">
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "Year Acquired (complete the Year Acq field on page 1 of the 1003 under 'Refinance Loan'", ",")>
</cfif>
<cfelse>
<CFSET orig_loan_amount = 0>
<CFSET previous_loan_year = 0>
</cfif>

<cftry>
<CFSET orig_loan_amount = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LOAN_PURPOSE.CONSTRUCTION_REFINANCE_DATA.xmlattributes.PropertyExistingLienAmount>
<cfcatch></cfcatch></cftry>


<!---<cfif MyXml.request.DATA.CUSTOM.CUSTOM_INFO.EmailAddress.xmlText eq 'rick@eaglebankcorp.com'>
<cfoutput>original loan amount = #ReplaceNocase(orig_loan_amount, '$', '', 'ALL')#<br />

MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LOAN_PURPOSE.CONSTRUCTION_REFINANCE_DATA.xmlattributes.PropertyExistingLienAmount = #MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LOAN_PURPOSE.CONSTRUCTION_REFINANCE_DATA.xmlattributes.PropertyExistingLienAmount#<br />
</cfoutput>
<cfabort>
</cfif>
--->

<cftry>
<cfset pcounty = ReplaceNoCase(pcounty, "'s", "s", "All")>

<CFQUERY datasource="#request.dsn#" NAME="check_for_county_state">
SELECT rate_table as table_to_use FROM Zip_info WHERE state = '#pstate#'
and county = '#pcounty#'
</CFQUERY>

<cfif check_for_county_state.recordcount eq 0>
<cfinvoke	component = "cfc.encompass"	method = "throwError" message="Could not find that State/City/County combination in our database" encompass_transaction_id="#encompass_id#" condition="Error"><cfabort>
</cfif>
<cfcatch type="any"></cfcatch>
</cftry>

<cfif missing_fields neq "">
<cfinvoke	component = "cfc.encompass"	method = "throwError" message="The Following fields must be completed to proceed: #ReplaceNoCase(missing_fields, ",", "", "ALL")#" encompass_transaction_id="#encompass_id#" condition="Error"><cfabort>
</cfif>

<!--- <cfoutput>pstate:  #pstate#<BR>
pcounty = #pcounty#<BR>
pcity = #pcity#<BR>
type = #type#<BR>
loan_amount = #loan_amount#<BR>
purchase_price = #purchase_price#<BR>
comp_id = #comp_id#<BR></cfoutput>

 --->


<cfparam name="get_titleid.title_id" default="0">

<cfparam name="count_inquiries" default="1">

<!--- <cfif count_inquiries eq 1>
<CFQUERY datasource="#request.dsn#" NAME="check_existing_inquiry">
 SELECT *
 FROM Encompass_Fee_Inquiries
 WHERE comp_id = #comp_id#
 and Encompass_Loan_ID = '#encompass_id#'
 </CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="check_confirm">
 SELECT encompass_gfe_confirm
 FROM Companies
 WHERE id = #comp_id#
 </CFQUERY>
 <cfif check_existing_inquiry.recordcount and check_confirm.encompass_gfe_confirm eq 0>
 <cfinvoke	component = "cfc.encompass"	method = "throwError" message="Please go to your First Title account login to activate the GFE quote module" encompass_transaction_id="#encompass_id#" condition="Error"><cfabort>
 </cfif>
 </cfif> --->
 


<CFSET HUD_version = "">
<cfparam name="MyXml.request.DATA.MAIN.LOAN.xmlattributes.HUD_version" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.xmlattributes.HUD_version neq "">
<CFSET HUD_version = MyXml.request.DATA.MAIN.LOAN.xmlattributes.HUD_version>
</cfif>



<!--- get underwriter --->
<CFQUERY datasource="#request.dsn#" NAME="get_all_comp_info">
SELECT * FROM Companies where ID = #trim(comp_id)#
</CFQUERY>


<!--- get rate table --->
<CFQUERY datasource="#request.dsn#" NAME="read_Title_Companies_States" maxrows="1">		
SELECT *
FROM Title_Companies_States s, title_companies t
where s.st_abbrev = '#pstate#'
and s.title_co_id = t.title_co_id
</CFQUERY>

<cfset request.underwriter_choice = 16>
<cfset underwriter_table = "rate_table_stewart">
<cfset underwriter_name = "Stewart Title Guaranty Company">

<!--- this part makes sure all streamline clients are put on Stewart until changed, also update order_verify_title.cfm line 1016 --->

<cfif get_all_comp_info.streamline_client eq 'True' and SearchType eq 'Purchase'>
<cfset request.underwriter_choice = 25>
<cfelseif get_all_comp_info.streamline_client eq 'True' and SearchType neq 'Purchase'>
<cfset request.underwriter_choice = 25>
</cfif>


<cfif Mid(get_all_comp_info.company,1,10) eq 'First Home'>
<cfset request.underwriter_choice = 29>
</cfif>


<!--- this part checks to see if the client has an exception in the Underwriter_Default_Exceptions table, that determines their preferred underwriter for this state --->
<CFQUERY datasource="#request.dsn#" NAME="exceptions" maxrows="1">		
SELECT *
FROM Underwriter_Default_Exceptions
where comp_id = #comp_id# 
and state = '#pstate#'
</CFQUERY>

<cfif exceptions.recordcount GTE 1>
<cfset read_title_companies_states.title_co_id = exceptions.title_co_id>
<cfset request.underwriter_choice = exceptions.title_co_id>



</cfif>
<!--- END this part checks to see if the client has an exception in the Underwriter_Default_Exceptions table, that determines their preferred underwriter for this state --->







<cfif request.underwriter_choice eq 15>
<cfset underwriter_table = "rate_table">
<cfelseif request.underwriter_choice eq 25>
<cfset underwriter_table = "rate_table_first_american">
<cfelseif request.underwriter_choice eq 14>
<cfset underwriter_table = "rate_table">
<cfelseif request.underwriter_choice eq 16>
<cfset underwriter_table = "rate_table_stewart">
<cfelseif request.underwriter_choice eq 19>
<cfset underwriter_table = "rate_table">
<cfelseif request.underwriter_choice eq 29>
<cfset underwriter_table = "rate_table_chicago">
<cfelseif request.underwriter_choice eq 30>
<cfset underwriter_table = "rate_table_natic">
<cfelse>
<cfset underwriter_table = "rate_table_stewart">
</cfif>

<cfif request.underwriter_choice eq 16>
<cfset underwriter_table = "rate_table_stewart">
<cfelseif request.underwriter_choice eq 25>
<cfset underwriter_table = "rate_table_first_american">
<cfelseif request.underwriter_choice eq 29>
<cfset underwriter_table = "rate_table_chicago">
<cfelseif request.underwriter_choice eq 30>
<cfset underwriter_table = "rate_table_natic">
<cfelse>
<cfset underwriter_table = "rate_table_stewart">
</cfif>

<cfset underwriter_name = "">
<cfif underwriter_table eq 'rate_table_stewart'>
<cfset underwriter_name = "Stewart Title Guaranty Company">
<cfelseif underwriter_table eq 'rate_table_first_american'>
<cfset underwriter_name = "First American Insurance Company">
<cfelseif underwriter_table eq 'rate_table_chicago'>
<cfset underwriter_name = "Chicago Title">
<cfelseif underwriter_table eq 'rate_table_natic'>
<cfset underwriter_name = "North American Title">
</cfif>

<!--- if this is CA and one of the counties NATIC servers, switch underwriter to NATIC --->
<cfif pstate eq 'CA'>
<CFQUERY datasource="#request.dsn#" NAME="check_natic" maxrows="1">		
SELECT *
FROM Zip_info
where state = '#pstate#' and county = '#pcounty#' and rate_table_natic = 'StateCaliforniaNatic'
</CFQUERY>

<cfif check_natic.recordcount gte 1>
<cfset underwriter_choice = 30>
<cfset request.underwriter_choice = 30>
<cfset underwriter_table = "rate_table_natic">
<cfset underwriter_name = "North American Title">
<cfset is_natic = 1>
</cfif>
</cfif>





<CFQUERY datasource="#request.dsn#" NAME="get_underwriters">
SELECT * FROM J_Companies_Underwriters WHERE comp_id = '#comp_id#'
and state = '#pstate#'
</CFQUERY>
<cfif get_underwriters.recordcount>
<cfif get_underwriters.underwriter eq 'Stewart'>
<cfset underwriter_table = "rate_table_stewart">
<cfelseif get_underwriters.underwriter eq 'FirstAmerican'>
<cfset underwriter_table = "rate_table_first_american">
</cfif>
</cfif>



<!--- enD get underwriter --->



<!--- <cfif HUD_version eq ''>
<cfinvoke	component = "cfc.fees"	method = "getFees"	returnVariable = "get_fee_query" company_id="#comp_id#" transaction_type="#SearchType#" property_state="#pstate#" property_county="#pcounty#" property_city="#pcity#" loan_amount="#loan_amount#" purchase_price="#purchase_price#" previous_loan_amount="#ReplaceNocase(orig_loan_amount, '$', '', 'ALL')#" previous_loan_year="#previous_loan_year#" previous_loan_month="#previous_loan_month#" property_use_type="#prop_use_type#" return_data="2">
<cfelse>
<cfinvoke	component = "cfc.fees2010"	method = "getFees"	returnVariable = "get_fee_query" company_id="#comp_id#" transaction_type="#SearchType#" property_state="#pstate#" property_county="#pcounty#" property_city="#pcity#" loan_amount="#loan_amount#" purchase_price="#purchase_price#" previous_loan_amount="#ReplaceNocase(orig_loan_amount, '$', '', 'ALL')#" previous_loan_year="#previous_loan_year#" previous_loan_month="#previous_loan_month#" property_use_type="#prop_use_type#" opt_alta_4="#opt_alta_4#" opt_alta_4_1="#opt_alta_4_1#" opt_alta_5="#opt_alta_5#" opt_alta_5_1="#opt_alta_5_1#" opt_alta_6="#opt_alta_6#" opt_alta_6_1="#opt_alta_6_1#" opt_alta_6_2="#opt_alta_6_2#" opt_alta_7="#opt_alta_7#" opt_alta_8_1="#opt_alta_8_1#" opt_alta_9="#opt_alta_9#" return_data="2" encompass=1 first_time_buyer="#first_time_buyer#">
</cfif>
 --->
 
 
<CFSET lo_email = "">
<CFSET lp_email = "">
<cftry>
<CFSET lo_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<CFSET form.lo_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<CFSET rlo.lo_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<CFSET lp_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<CFSET form.lp_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<CFSET ru.lp_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<cfcatch type="any"></cfcatch></cftry>




<cfinvoke	component = "cfc.fees2010"	method = "getFees"	returnVariable = "get_fee_query" 
company_id="#comp_id#" 
transaction_type="#SearchType#" 
property_state="#pstate#" 
property_county="#pcounty#" 
property_city="#pcity#"  
property_zip="#pzip#" 
loan_amount="#loan_amount#" 
purchase_price="#purchase_price#" 
previous_loan_amount="#ReplaceNocase(orig_loan_amount, '$', '', 'ALL')#" 
previous_loan_year="#previous_loan_year#" 
previous_loan_month="#previous_loan_month#" 
property_use_type="#prop_use_type#" 
opt_alta_4="#opt_alta_4#" 
opt_alta_4_1="#opt_alta_4_1#" 
opt_alta_5="#opt_alta_5#" 
opt_alta_5_1="#opt_alta_5_1#" 
opt_alta_6="#opt_alta_6#" 
opt_alta_6_1="#opt_alta_6_1#" 
opt_alta_6_2="#opt_alta_6_2#" 
opt_alta_7="#opt_alta_7#" 
opt_alta_8_1="#opt_alta_8_1#" 
opt_alta_9="#opt_alta_9#" 
opt_tx_1 = "#opt_tx_1#"
opt_tx_2 = "#opt_tx_2#"
opt_tx_3 = "#opt_tx_3#"
opt_tx_4 = "#opt_tx_4#"
opt_tx_5 = "#opt_tx_5#"
opt_tx_6 = "#opt_tx_6#"
opt_tx_7 = "#opt_tx_7#"
opt_tx_8 = "#opt_tx_8#"
opt_tx_9 = "#opt_tx_9#"
opt_tx_10 = "#opt_tx_10#"
opt_tx_11 = "#opt_tx_11#"
opt_tx_12 = "#opt_tx_12#"
opt_tx_13 = "#opt_tx_13#"
opt_tx_14 = "#opt_tx_14#" 
return_data="2" 
encompass=1 
first_time_buyer="#first_time_buyer#" 
underwriter_choice="#request.underwriter_choice#" 
closing_type="#closing_type#" 
p_email="#lp_email#" 
o_email="#lo_email#"
prop_type="#prop_type#"
>


<cfset form.comp_id = "#comp_id#">
<cfset form.transaction_type = "#SearchType#">
<cfset form.property_state = "#pstate#">
<cfset form.property_county = "#pcounty#">
<cfset form.property_city = "#pcity#">
<cfset form.property_zip = "#pzip#">
<cfset form.loan_amount = "#loan_amount#">
<cfset form.purchase_price = "#purchase_price#">
<cfset form.previous_loan_amount = "#ReplaceNocase(orig_loan_amount, '$', '', 'ALL')#">
<cfset form.previous_loan_year = "#previous_loan_year#">
<cfset form.previous_loan_month = "#previous_loan_month#">
<cfset form.property_use_type = "#prop_use_type#">
<cfset form.return_data = "1">
<cfset form.opt_alta_4 = "#opt_alta_4#">
<cfset form.opt_alta_4_1 = "#opt_alta_4_1#">
<cfset form.opt_alta_5 = "#opt_alta_5#">
<cfset form.opt_alta_5_1 = "#opt_alta_5_1#">
<cfset form.opt_alta_6 = "#opt_alta_6#">
<cfset form.opt_alta_6_1 = "#opt_alta_6_1#">
<cfset form.opt_alta_6_2 = "#opt_alta_6_2#">
<cfset form.opt_alta_7 = "#opt_alta_7#">
<cfset form.opt_alta_8_1 = "#opt_alta_8_1#">
<cfset form.opt_alta_9 = "#opt_alta_9#">

<cfset form.opt_tx_1 = "#opt_tx_1#">
<cfset form.opt_tx_2 = "#opt_tx_2#">
<cfset form.opt_tx_3 = "#opt_tx_3#">
<cfset form.opt_tx_4 = "#opt_tx_4#">
<cfset form.opt_tx_5 = "#opt_tx_5#">
<cfset form.opt_tx_6 = "#opt_tx_6#">
<cfset form.opt_tx_7 = "#opt_tx_7#">
<cfset form.opt_tx_8 = "#opt_tx_8#">
<cfset form.opt_tx_9 = "#opt_tx_9#">
<cfset form.opt_tx_10 = "#opt_tx_10#">
<cfset form.opt_tx_11 = "#opt_tx_11#">
<cfset form.opt_tx_12 = "#opt_tx_12#">
<cfset form.opt_tx_13 = "#opt_tx_13#">
<cfset form.opt_tx_14 = "#opt_tx_14#">
<cfset form.prop_type = "#prop_type#">

<cfset form.first_time_buyer = "#first_time_buyer#">
<!--- comp_id eq 8712 or comp_id eq 8618 or comp_id eq 2641 --->

<CFQUERY datasource="#request.dsn#" NAME="get_company">
		SELECT *
		FROM Companies
		where id = #comp_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_company">
		SELECT *
		FROM Companies
		where id = #comp_id#
</CFQUERY>

<!--- this next part send the quote to the email address provided --->
<cfset dont_show = 1>
<cfset form.fee_submit = 'Calculate Fees'>
<CFQUERY datasource="#request.dsn#" NAME="get_user">
		SELECT *
		FROM First_admin
		where id = #get_company.intSales#
</CFQUERY>

<cfif get_company.streamline_client eq 'True'>
<cfset our_company = "Streamline Title">
<cfelse>
<cfset our_company = "First Title">
</cfif>



<cfdocument format="PDF" pagetype="custom" pageheight="14" pagewidth="8.5" margintop=".25" marginbottom=".25" marginleft=".25" marginright=".25" filename="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\saved_calcs\QUOTE_#form.property_city#_#form.property_state#_#form.property_zip#.pdf" overwrite="yes">
<cfset session.comp_id = comp_id>
<cfset session.encompass = 1>
<cfinclude template="../new_calc_form_display.cfm">
<cfset session.comp_id = 0>
<cfset session.encompass = 0>
</cfdocument>

<cfif read_company.ID NEQ 9066>

<CFQUERY datasource="#request.dsn#" NAME="insert_record">
		insert into Sent_Quotes (sender_name, sender_email, agent_name, agent_email, sent_date, company_id)
		values ('Encompass Integration', '#email_address_to_send#', 'Encompass Integration', '#email_address_to_send#', #CreateODBCDateTime(Now())#, #comp_id#)
</CFQUERY>




<cfif our_company eq "Streamline Title">
<cfset user_email = ReplaceNoCase(get_user.email, "firsttitleservices", "streamline-title", "ALL")>
<cfelse>
<cfset user_email = ReplaceNoCase(get_user.email, "streamline-title", "firsttitleservices", "ALL")>
</cfif>



<cfif email_address_to_send neq ''>
 <CFMAIL
	TO="#email_address_to_send#"
	FROM="#user_email#"
	BCC="rjermain@firsttitleservices.com"
	Subject="Your Closing Cost Quote from #our_company#, #form.property_city#/#form.property_state#/#form.property_zip#"
	TIMEOUT="600" type="html">
<cfmailparam file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\saved_calcs\QUOTE_#form.property_city#_#form.property_state#_#form.property_zip#.pdf">

<style type="text/css" media="screen">
<!--
body, TD {
margin: 3;
padding: 3;
font: 12px verdana, arial, sans-serif;
}
.small {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
input {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
select, option {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
.header {

font: 14px verdana, arial, sans-serif;
}
-->
</style>
<table width="544" cellpadding="1" cellspacing="1" bgcolor="##000000">
<tr><td align="left" valign="top">
<table width="100%" cellpadding="0" cellspacing="4" bgcolor="##ffffff" border=0>

<tr>
<td width="544" align="left" valign="top">
<strong>Dear #form.agent_name#,</strong><br>
<br>
<table cellpadding=1 cellspacing=1>
<tr>
<td align="left" valign="top" colspan="2">#our_company# & Escrow Fee Quote</td>
</tr>
<tr>
<td width="100" align="left" valign="top">State:</td>
<td width="100" align="left" valign="top">#form.property_state#</td>
</tr>
<tr>
<td width="100" align="left" valign="top">City:</td>
<td width="100" align="left" valign="top">#form.property_city#</td>
</tr>
<tr>
<td width="100" align="left" valign="top">Zip Code:</td>
<td width="100" align="left" valign="top">#form.property_zip#</td>
</tr>
<tr>
<td width="100" align="left" valign="top">Loan Amount:</td>
<td width="100" align="left" valign="top">#DollarFormat(form.loan_amount)#</td>
</tr>
<tr>
<td width="100" align="left" valign="top">Purchase Price:</td>
<td width="100" align="left" valign="top">#DollarFormat(form.purchase_price)#</td>
</tr>
</table><br>


Attached please find your closing cost quote for the above referenced Property.<br>
<br>
Please contact me directly if I can be of any further assistance. We look forward to being of service to you.
<br>
<br>
Sincerely,<br>
#get_user.fname# #get_user.lname#, #get_user.position#<br>
#our_company# & Escrow<BR>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive, 4th Floor<BR>
Rockville, MD 20850<BR>
<cfelse>
7361 Calhoun Place, Suite 200<BR>
Rockville, MD 20855<BR>
</cfif>

Phone: #get_user.phone#<br>
Fax: #get_user.fax#<br>
<cfif our_company eq "Streamline Title">
Web Address: <a href="https://www.streamline-title.com">www.streamline-title.com</a><br>
<cfelse>
Web Address: <a href="https://www.firsttitleservices.com">www.firsttitleservices.com</a><br>
</cfif>


</td>
</tr>

</table>
</td></tr>
</table>
</CFMAIL> 
</cfif>
<!--- END  this next part send the quote to the email address provided --->
</cfif>





<!---<cfif pcity eq 'Glen Cove'>
<cfoutput>
<cfdump var="#session.XMLOUT#"><br>
</cfoutput>
<cfabort>
</cfif>
--->
<cfset ReturnXML = session.XMLOUT>

<CFSET item_count = 1>


<cfif transaction eq 'Order'>

<cfif read_company.company does not contain 'Prime Lending'>

<cffile action="READBINARY" file="C:\cds\CD_#get_titleid.title_id#_buyer.pdf" variable="pdf">
<cfset send_pdf = ToBase64(pdf)>
		
<cfset ReturnXml.RESPONSE.ATTACHMENT = XmlElemNew(ReturnXml, "ATTACHMENT")>
<cfset ReturnXml.RESPONSE.ATTACHMENT[1].xmlAttributes.MIMETypeDescription = "application/pdf">
<cfset ReturnXml.RESPONSE.ATTACHMENT[1].xmlAttributes.EncodingTypeDescription = "Base64">
<cfset ReturnXml.RESPONSE.ATTACHMENT[1].xmlAttributes.Type = "PrelimCD">
<cfset ReturnXml.RESPONSE.ATTACHMENT[1].xmlText = "#send_pdf#">

</cfif>


<!---<cffile action="READBINARY" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\saved_calcs\QUOTE_#form.property_city#_#form.property_state#_#form.property_zip#.pdf" variable="pdf2">
<cfset send_pdf2 = ToBase64(pdf2)>
		
<cfset ReturnXml.RESPONSE.xmlChildren[3] = XmlElemNew(ReturnXml, "ATTACHMENT")>
<cfset ReturnXml.RESPONSE.ATTACHMENT[2].xmlAttributes.MIMETypeDescription = "application/pdf">
<cfset ReturnXml.RESPONSE.ATTACHMENT[2].xmlAttributes.EncodingTypeDescription = "Base64">
<cfset ReturnXml.RESPONSE.ATTACHMENT[2].xmlAttributes.Type = "Fee Summary Worksheet">
<cfset ReturnXml.RESPONSE.ATTACHMENT[2].xmlText = "#send_pdf2#">--->


<cfset ReturnXml.RESPONSE.xmlAttributes.OrderID = "#get_titleid.title_id#">

</cfif>


<cfif transaction eq 'FeeInquiry'>

<cffile action="READBINARY" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\saved_calcs\QUOTE_#form.property_city#_#form.property_state#_#form.property_zip#.pdf" variable="pdf">
<cfset send_pdf = ToBase64(pdf)>
		
<cfset ReturnXml.RESPONSE.ATTACHMENT = XmlElemNew(ReturnXml, "ATTACHMENT")>
<cfset ReturnXml.RESPONSE.ATTACHMENT.xmlAttributes.MIMETypeDescription = "application/pdf">
<cfset ReturnXml.RESPONSE.ATTACHMENT.xmlAttributes.EncodingTypeDescription = "Base64">
<cfset ReturnXml.RESPONSE.ATTACHMENT.xmlAttributes.Type = "Fee Summary Worksheet">
<cfset ReturnXml.RESPONSE.ATTACHMENT.xmlText = "#send_pdf#">
<cfset ReturnXml.RESPONSE.xmlAttributes.OrderID = "#get_titleid.title_id#">

</cfif>






<cfset ReturnXml.RESPONSE.xmlAttributes.Type = "#transaction#">




<cfset session.XMLOUT = ReturnXml>

<cflocation url="return_XML.cfm?company_id=#comp_id#" addtoken="yes">