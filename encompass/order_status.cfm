<!--- Get the Order Number --->
<CFSET title_id = MyXml.request.xmlattributes.OrderId>

<CFQUERY datasource="#request.dsn#" NAME="find_order">
	select * from title
	WHERE title_id = '#title_id#'
	and comp_id = '#comp_id#'
</CFQUERY>

<cfif NOT find_order.recordcount>
<cfinvoke	component = "cfc.encompass"	method = "checkStatus" message="Cannot find order with ID #title_id#" encompass_transaction_id="#encompass_id#" condition="Unknown" order_id="#title_id#">
<cfabort>

<cfelse>



<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">		
		SELECT *
		FROM Doc_Title_Insurance_Title
		WHERE Title_ID = #title_id#		
	</CFQUERY>
	
<CFQUERY datasource="#request.dsn#" NAME="read_title">
	select * from title
	WHERE title_id = '#title_id#'
	and comp_id = '#comp_id#'
</CFQUERY>
<cfset url.rec_id = #title_id#>
<cfset rec_id = #title_id#>


<CFIF (#read_current_Commitment_Clauses.a_recieved_by# NEQ "") OR (#read_current_Commitment_Clauses.a_recieved_by# GT 0)>
<cfif read_current_Commitment_Clauses.insurance_co eq 16>

	<cfif find_order.pstate eq 'NY'>
     <cfinclude template="..\admin_area\title_committment_stewart_NY_clean_pdf.cfm">
	<cfelseif find_order.pstate eq 'TX'>
     <cfinclude template="..\admin_area\title_committment_stewart_TX_clean_pdf.cfm">
	<cfelse>
     <cfinclude template="..\admin_area\title_committment_stewart_clean_pdf.cfm">
	</cfif>
<cfelseif read_current_Commitment_Clauses.insurance_co eq 30 and find_order.pstate eq 'TX'>
<cfinclude template="..\admin_area\title_committment_natic_TX_clean_pdf.cfm">
<cfelseif read_current_Commitment_Clauses.insurance_co eq 30>
<cfinclude template="..\admin_area\title_committment_north_american_clean_pdf.cfm">
<cfelseif read_current_Commitment_Clauses.insurance_co eq 33 and find_order.pstate eq 'TX'>
<cfinclude template="..\admin_area\title_committment_WFG_TX_clean_pdf.cfm">
<cfelseif read_current_Commitment_Clauses.insurance_co eq 33>
<cfinclude template="..\admin_area\title_committment_WFG_clean_pdf.cfm">
</cfif>
<cfif read_current_Commitment_Clauses.insurance_co eq 25>
<cfinclude template="..\admin_area\title_committment_first_american_clean_pdf.cfm">
</cfif>

        <cffile action="READBINARY" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\admin_area\tcs\TC-#title_id#.pdf" variable="pdf">
        <cfset send_pdf = ToBase64(pdf)>
        
        
        <cffile action="READBINARY" file="C:\cds\CD_#title_id#_buyer.pdf" variable="pdf2">
        <cfset send_pdf_2 = ToBase64(pdf2)>


<cfinvoke	component = "cfc.encompass"	method = "checkStatus" message="Your Title Commitment has been completed." encompass_transaction_id="#encompass_id#" title_id="#title_id#" embed_file="#send_pdf#" embed_file_2="#send_pdf_2#" condition="Ready">
<cfelse>
<cfinvoke	component = "cfc.encompass"	method = "checkStatus" message="Your order is currently pending." encompass_transaction_id="#encompass_id#" condition="Pending" order_id="#title_id#">
</cfif>


</cfif>


