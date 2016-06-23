<cfset enc_fees_query = QueryNew("Line_Number, Description, Amount, Payer, Outside, Payto")>			

<cffunction name="AddEncompassQueryItem" output="false">
<cfargument name="line_number" type="string" default="">
<cfargument name="Description" type="string" default="">
<cfargument name="amount" type="string" default="">
<cfargument name="payer" type="string" default="">			
<cfargument name="outside" type="numeric" default="0">			
<cfargument name="payto" type="string" default="Other">			
<cfset temp = QueryAddRow(enc_fees_query)>
<cfset temp = QuerySetCell(enc_fees_query, "Line_Number", arguments.line_number)>
<cfset temp = QuerySetCell(enc_fees_query, "Description", arguments.description)>
<cfif IsNumeric(arguments.amount)>
<cfset temp = QuerySetCell(enc_fees_query, "Amount", arguments.amount)>
<cfelse>
<cfset temp = QuerySetCell(enc_fees_query, "Amount", arguments.amount)>
</cfif>
<cfset temp = QuerySetCell(enc_fees_query, "Payer", arguments.payer)>			
<cfset temp = QuerySetCell(enc_fees_query, "Payto", arguments.payto)>			
<cfset temp = QuerySetCell(enc_fees_query, "Outside", arguments.outside)>			
</cffunction>


<cfset dump_list = "Binder,binder,Couier,Couier/Delivery,Courier,courier,Courier fee,Courier Fees,Courier/Delivery,Courier/Delivery Fee,Courier/Delviery,Courier/Overnight,Del,Deliv./Overnight,Delivery,Delivery / Courier,Delivery / Overnight,Delivery Cost,Delivery Fee,Delivery Fee to FTE,Delivery Payoff Fee,Delivery/Courier,Delivery/Courier Fee,Delivery/Courier to First Title & Escrow,Delivery/Fedex,Delivery/Overnight,Delivery/UPS,Deoivery/Courier,Dlivery,Shipping,Shipping Fee,Wire,Wire Fee,Wire Fees">

<CFQUERY datasource="#request.dsn#" NAME="get_comp_info" maxrows="1">		
SELECT *
FROM  companies
where id = #arguments.company_id#
</CFQUERY>



<cfset add_to_1109_list = "Judgment Run,Judgment Search,Judgment Run,Judgment Runs,Judgment Search,Tax Cert,Tax Cert.,Tax Certificate,Tax Certification,Tax certification,Tax Info / Cert,Tax Info /Cert,Tax Info/Cert,Closing Protection Letter Fee">

<cfset enc_total_1109 = 0>
<cfset substract_from_1101 = 0>
<cfset enc_total_1101 = 0>
<cfif get_comp_info.company contains 'Mason-McDuffie'>
<cfset name_1109 = "Closing Protection Letter Fee">
<cfset payto_1109 = "Abstracts USA">
<cfelse>
<cfset name_1109 = "Closing Services Fee">
<cfset payto_1109 = "Abstracts USA">
</cfif>
<cfset outside_1109 = 0>
<cfset payer_1109 = "Buyer">
<cfset original_amount_1101 = 0>
<cfset name_1101 = "Settlement or Closing Fees">
<cfset payer_1101 = "Buyer">
<cfset outside_1101 = 0>
<cfset payto_1101 = "">
<cfset original_amount_1203 = 0>
<cfset subtract_from_1203 = 0>



<cfloop query="fees_query">
<cfif NOT ListContainsNoCase(dump_list, fees_query.description, ",")>


  <cfif ListContainsNoCase(add_to_1109_list, fees_query.description, ",") and fees_query.line_number eq 0>
  <cfset enc_total_1109 = enc_total_1109 + fees_query.amount>
  <!--- <cfset substract_from_1101 = substract_from_1101 + fees_query.amount> --->
  <cfelseif fees_query.line_number eq 1109>
  <cfset enc_total_1109 = enc_total_1109 + fees_query.amount>
  <cfset name_1109 = fees_query.Description>
  <cfset payer_1109 = fees_query.payer>
  <cfset outside_1109 = 0<!--- fees_query.outside --->>
  <cfset payto_1109 = fees_query.payto>
  <cfelseif fees_query.line_number eq 1101>
  <cfset name_1101 = fees_query.Description>
  <cfset original_amount_1101 = fees_query.amount>
  <cfset payer_1101 = fees_query.payer>
  <cfset outside_1101 = fees_query.outside>
  <cfset payto_1101 = fees_query.payto>
  
  <cfelseif fees_query.line_number eq 1203>
  <cfset name_1203 = fees_query.Description>
  <cfset original_amount_1203 = fees_query.amount>
  <cfset payer_1203 = fees_query.payer>
  <cfset outside_1203 = fees_query.outside>
  <cfset payto_1203 = fees_query.payto>
   
    <cfelseif fees_query.line_number eq 1204 and fees_query.description contains 'POC'>
  <!--- <cfset new_amount = fees_query.amount * .75>
  <cfset subtract_from_1203 = fees_query.amount * .25> --->
  <cfset new_amount = fees_query.amount>
  <cfset subtract_from_1203 = 0>
  <cfset new_description = ReplaceNoCase(fees_query.description, "Stamps (", "Stamps (Additional ", "ALL")>
  <cfset temp = AddEncompassQueryItem(fees_query.line_number, new_description, new_amount, fees_query.payer, 0, fees_query.payto)>

<cfelseif fees_query.line_number eq 1102 or fees_query.line_number eq 1104 or fees_query.line_number eq 1109 or fees_query.line_number eq 1201 or fees_query.line_number eq 1202 or fees_query.line_number eq 1204 or fees_query.line_number eq 1205 or fees_query.line_number eq 1206 or fees_query.line_number eq 1207 or fees_query.line_number eq 1208 or fees_query.line_number eq 1209>
  <cfset temp = AddEncompassQueryItem(fees_query.line_number, fees_query.description, fees_query.amount, fees_query.payer, 0, fees_query.payto)>
  <cfelse>
  <cfset temp = AddEncompassQueryItem(fees_query.line_number, fees_query.description, fees_query.amount, fees_query.payer, fees_query.outside, fees_query.payto)>
  </cfif>
 
  
</cfif>
</cfloop>
<cfif original_amount_1203 neq 0>
<cfif subtract_from_1203 neq 0>
<cfset original_amount_1203 = original_amount_1203 - subtract_from_1203>
</cfif>
<!--- <cfset temp = AddEncompassQueryItem(1203, name_1203, original_amount_1203, payer_1203, 0, payto_1203)> --->
</cfif>


<cfif original_amount_1101 neq 0>
<cfset enc_total_1101 = original_amount_1101 - substract_from_1101>
<cfset temp = AddEncompassQueryItem(1101, name_1101, enc_total_1101, payer_1101, outside_1101, payto_1101)>
</cfif>
<cfif enc_total_1109 neq 0>
<cfset temp = AddEncompassQueryItem(1109, name_1109, enc_total_1109, payer_1109, outside_1109, payto_1109)>
</cfif>



<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM enc_fees_query
order by line_number
</cfquery>



<cfloop query="fee_detail">

<cfif (fee_detail.line_number eq 1204 or fee_detail.line_number eq 1205) and fee_detail.description does not contain 'Deed'>
<cfif arguments.property_state eq 'MD'>
<cfset fee_detail[ "description" ][ fee_detail.currentrow ] = fee_detail.description & ': Deed'>
<cfelse>
<cfset fee_detail[ "description" ][ fee_detail.currentrow ] = fee_detail.description & ': Mortgage'>
</cfif>
</cfif>

</cfloop>
