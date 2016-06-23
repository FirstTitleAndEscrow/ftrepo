<cfparam name="filename" default="">
<cfparam name="vendor_id" default="0">

<CFQUERY DATASOURCE="#request.dsn#" NAME="get_states">
select distinct state from zip_info order by state
</CFQUERY>

<cfset states_list = ValueList(get_states.state, ",")>

<CFQUERY DATASOURCE="#request.dsn#" NAME="get_vendor">
select * from vendors_stacie_sb where vendor_id = #url.vendor_id#
</cfquery> 

<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_current_pricing">
Delete from Vendor_Pricing_sb 
where vendor_id = #url.vendor_id#
</cfquery> 



<cfx_excel2query
    name="test_import"
    file="c:\uploads\#url.filename#"
    sheetNumber="0">


<!--- <cfdump var="#test_import#">
 --->
<cfset service_type = ''>

<cfoutput query="test_import">
<cfswitch expression="#test_import.COLUMN1#">
  <cfcase value="SAMPLE PRICING">
    <cfset service_type = 'Sample'>
  </cfcase>
  <cfcase value="ABSTRACT PRICING">
    <cfset service_type = 'Abstract'>
  </cfcase>
  <cfcase value="TYPING PRICING">
    <cfset service_type = 'Typing'>
  </cfcase>
  <cfcase value="APPRAISAL PRICING">
    <cfset service_type = 'Appraisal'>
  </cfcase>
  <cfcase value="TAX PREPARATION PRICING">
    <cfset service_type = 'TaxPrep'>
  </cfcase>
  <cfcase value="ICL PREPARATION PRICING">
    <cfset service_type = 'ICL'>
  </cfcase>
  <cfcase value="PAYOFF PREPARATION PRICING">
    <cfset service_type = 'Payoff'>
  </cfcase>
  <cfcase value="DEED PREPARATION PRICING">
    <cfset service_type = 'DeedPrep'>
  </cfcase>
  <cfcase value="REO PACKAGE RETRIEVAL PRICING">
    <cfset service_type = 'REO'>
  </cfcase>
  <cfcase value="ORDER ENTRY PRICING">
    <cfset service_type = 'OrderEntry'>
  </cfcase>
</cfswitch>


<cfif test_import.COLUMN1 neq '' and service_type neq 'Sample' and (test_import.COLUMN1 eq 'All' or ListContainsNoCase(states_list,test_import.COLUMN1, ","))>


<cfswitch expression="#service_type#">
  <cfcase value="Abstract">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
Insert into Vendor_Pricing_sb
(state, county, bring_to_date, current_owner, full_search, doc_retrieval, two_owner, service_type, vendor_id)
values
('#COLUMN1#', '#COLUMN2#', '#COLUMN4#', '#COLUMN5#', '#COLUMN6#', '#COLUMN7#', '#COLUMN8#', '#service_type#', #url.vendor_id#)
</cfquery> 
  </cfcase>
  <cfcase value="Typing">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
Insert into Vendor_Pricing_sb 
(state, county, typing_fee, service_type, vendor_id)
values
('#COLUMN1#', '#COLUMN2#', '#COLUMN3#', '#service_type#', #url.vendor_id#)
</cfquery> 
  </cfcase>
  <cfcase value="Appraisal">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
Insert into Vendor_Pricing_sb 
(state, county, appraisal_fee, service_type, vendor_id)
values
('#COLUMN1#', '#COLUMN2#', '#COLUMN3#', '#service_type#', #url.vendor_id#)
</cfquery> 
  </cfcase>
  <cfcase value="TaxPrep">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
Insert into Vendor_Pricing_sb 
(state, county, taxprep_fee, service_type, vendor_id)
values
('#COLUMN1#', '#COLUMN2#', '#COLUMN3#', '#service_type#', #url.vendor_id#)
</cfquery> 
  </cfcase>
  <cfcase value="ICL">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
Insert into Vendor_Pricing_sb 
(state, county, icl_fee, service_type, vendor_id)
values
('#COLUMN1#', '#COLUMN2#', '#COLUMN3#', '#service_type#', #url.vendor_id#)
</cfquery> 
  </cfcase>
  <cfcase value="Payoff">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
Insert into Vendor_Pricing_sb
(state, county, payoff_fee, service_type, vendor_id)
values
('#COLUMN1#', '#COLUMN2#', '#COLUMN3#', '#service_type#', #url.vendor_id#)
</cfquery> 
  </cfcase>
  <cfcase value="DeedPrep">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
Insert into Vendor_Pricing_sb 
(state, county, deedprep_fee, service_type, vendor_id)
values
('#COLUMN1#', '#COLUMN2#', '#COLUMN3#', '#service_type#', #url.vendor_id#)
</cfquery> 
  </cfcase>
  <cfcase value="REO">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
Insert into Vendor_Pricing_sb
(state, county, reo_fee, service_type, vendor_id)
values
('#COLUMN1#', '#COLUMN2#', '#COLUMN3#', '#service_type#', #url.vendor_id#)
</cfquery> 
  </cfcase>
  <cfcase value="OrderEntry">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
Insert into Vendor_Pricing_sb 
(state, county, orderentry_fee, service_type, vendor_id)
values
('#COLUMN1#', '#COLUMN2#', '#COLUMN3#', '#service_type#', #url.vendor_id#)
</cfquery> 
  </cfcase>
</cfswitch>
</cfif>

</cfoutput>

<CFQUERY DATASOURCE="#request.dsn#" NAME="update_vendor">
update Vendors_STACIE_sb
set last_pricing_activation_date = '#DateFormat(Now(), "m/d/yyyy")#'
where vendor_id = #url.vendor_id#
</CFQUERY>


Fee Import Completed for Vendor: <cfoutput>#get_vendor.company#</cfoutput><br>
<br>

