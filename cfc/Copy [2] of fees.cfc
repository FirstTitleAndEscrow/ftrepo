<cfcomponent>
<cffunction name="AddXMLItem" >
<cfargument name="LINE_NUMBER">
<cfargument name="DESCRIPTION">
<cfargument name="AMOUNT">
<cfargument name="PAYEE" default="Buyer">
<cfargument name="COMP_ID" default="0">
<cfset count = 1>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count] = XmlElemNew(ReturnXml, "RESPA_FEE")>
<cfif Mid(arguments.LINE_NUMBER, 1, 2) eq 11>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes.RESPASectionClassificationType = "1100: Settlement Closing Fees">
<cfelseif  Mid(arguments.LINE_NUMBER, 1, 2) eq 12>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes.RESPASectionClassificationType = "1200: RecordingAndTransferCharges">
<cfelseif  Mid(arguments.LINE_NUMBER, 1, 2) eq 13>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes.RESPASectionClassificationType = "1300: AdditionalSettlementCharges">
<cfelse>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes.RESPASectionClassificationType = "ALTA">
</cfif>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToType = "Other">
<cfif arguments.LINE_NUMBER eq 1201 or arguments.LINE_NUMBER eq 1202 or arguments.LINE_NUMBER eq 1203 or arguments.LINE_NUMBER eq 1204>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "City/County/State">
</cfif>
<cfif arguments.LINE_NUMBER eq 1107 >
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "TBD">
</cfif>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._SpecifiedHUDLineNumber = "#arguments.LINE_NUMBER#">
<cfif arguments.COMP_ID neq 3704 and arguments.COMP_ID neq 3746 and  arguments.COMP_ID neq 3747 and  arguments.COMP_ID neq 3748>
<cfif (arguments.LINE_NUMBER eq 1301 or arguments.LINE_NUMBER eq 1302 or arguments.LINE_NUMBER eq 1303 or arguments.LINE_NUMBER eq 1304 or arguments.LINE_NUMBER eq 1305 or arguments.LINE_NUMBER eq 1306 or arguments.LINE_NUMBER eq 1307 or arguments.LINE_NUMBER eq 1308 or arguments.LINE_NUMBER eq 1309)>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "First Title">
</cfif>
</cfif>
<cfif arguments.LINE_NUMBER eq 1303>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "#arguments.DESCRIPTION#">
</cfif>
<cfif arguments.Description  contains 'ALTA'>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "#arguments.DESCRIPTION#">
</cfif>
<cfif  arguments.LINE_NUMBER eq 1112>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "#arguments.DESCRIPTION#">
</cfif>
<cfif arguments.LINE_NUMBER eq 1205>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "#arguments.DESCRIPTION#">
</cfif>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].XmlChildren[1] = XmlElemNew(ReturnXml, "_PAYMENT")>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].XmlChildren[1].xmlAttributes._Amount = "#arguments.AMOUNT#">
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].XmlChildren[1].xmlAttributes._PaidByType = "#arguments.PAYEE#">
<!--- lend america code --->
<cfif arguments.COMP_ID eq 3704 or arguments.COMP_ID eq 3746 or  arguments.COMP_ID eq 3747 or  arguments.COMP_ID eq 3748>
<cfif arguments.LINE_NUMBER eq 1101>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "EAM Settlement">
</cfif>
<cfif arguments.LINE_NUMBER eq 1102 or arguments.LINE_NUMBER eq 1103 or arguments.LINE_NUMBER eq 1104 or arguments.LINE_NUMBER eq 1109>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "Worldwide Abstract">
</cfif>
<cfif arguments.LINE_NUMBER eq 1205>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
</cfif>
<cfif (arguments.LINE_NUMBER eq 1301 or arguments.LINE_NUMBER eq 1302 or arguments.LINE_NUMBER eq 1303 or arguments.LINE_NUMBER eq 1304 or arguments.LINE_NUMBER eq 1305 or arguments.LINE_NUMBER eq 1306 or arguments.LINE_NUMBER eq 1307 or arguments.LINE_NUMBER eq 1308 or arguments.LINE_NUMBER eq 1309)>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
</cfif>
<cfif arguments.LINE_NUMBER eq 1303>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "Title Closing Pick Up Fee">
</cfif>
<cfif arguments.LINE_NUMBER eq 1306>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "ALTA 8.1">
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
</cfif>
<cfif arguments.Description  contains 'ALTA'>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "#arguments.DESCRIPTION#">
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
</cfif>
<cfif arguments.LINE_NUMBER eq 1112>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "Signing fee">
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
</cfif>
<cfif arguments.LINE_NUMBER eq 1205>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "Recording fee">
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
</cfif>
<cfif (arguments.LINE_NUMBER eq 1301 or arguments.LINE_NUMBER eq 1302 or arguments.LINE_NUMBER eq 1303 or arguments.LINE_NUMBER eq 1304 or arguments.LINE_NUMBER eq 1305 or arguments.LINE_NUMBER eq 1306 or arguments.LINE_NUMBER eq 1307 or arguments.LINE_NUMBER eq 1308 or arguments.LINE_NUMBER eq 1309)>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = " ">
</cfif>
<cfif (arguments.LINE_NUMBER eq 811)>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = " ">
</cfif>
<cfif (arguments.LINE_NUMBER eq 1112)>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = " ">
</cfif>
<cfif (arguments.LINE_NUMBER eq 1205)>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = " ">
</cfif>
</cfif>
<!--- end lend america code --->
<CFSET item_count = item_count +1>
</cffunction>
<cffunction name="AddQueryItem" output="false">
<cfargument name="line_number" type="string" default="">
<cfargument name="Description" type="string" default="">
<cfargument name="amount" type="string" default="">
<cfargument name="payer" type="string" default="">			
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", arguments.line_number)>
<cfset temp = QuerySetCell(fees_query, "Description", arguments.description)>
<cfif IsNumeric(amount)>
<cfset temp = QuerySetCell(fees_query, "Amount", NumberFormat(amount, '_____.__'))>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Amount", amount)>
</cfif>
<cfset temp = QuerySetCell(fees_query, "Payer", payer)>			
</cffunction>


<cffunction name="Get800Series" >
<cfargument name="asset_manager" default="">
<cfargument name="company_id" default="">
<cfargument name="property_state" default="">
<cfargument name="transaction_type" default="">
<!--- here we are going to see if we should get the fees from a different account, if an 'asset manager' is chosen, we'll get the fees from that company, otherwise, we'll get them from the company placing the order --->
<cfif arguments.asset_manager neq '' and arguments.asset_manager neq 'NULL'>
<cfset billing_co_id_to_use = arguments.asset_manager>
<cfelse>
<cfset billing_co_id_to_use = arguments.company_id>
</cfif>		
<!--- get custom fees for this client --->
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states WHERE company_id = '#billing_co_id_to_use#' and a_states = '#arguments.property_state#'
</CFQUERY>   
<cfif read_this_sets_billing_states.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states WHERE company_id = '426' and a_states = '#arguments.property_state#'
</CFQUERY>   
</cfif>
         
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
SELECT * FROM company_billing_values WHERE billing_id = #read_this_sets_billing_states.billing_id#
</CFQUERY>  
<!--- 803 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>		
<cfif #read_this_sets_billing_values.a_803# neq "">
<cfset a_803 = #read_this_sets_billing_values.a_803#>
<cfset temp = AddQueryItem(803, read_this_sets_billing_values.a_803_text, NumberFormat(read_this_sets_billing_values.a_803, '_____.__'), "Buyer")>
<cfelse>
<cfset a_803 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_803b# neq "">
<cfset a_803b = #read_this_sets_billing_values.a_803b#>
<cfset temp = AddQueryItem(803, read_this_sets_billing_values.a_803_textb, NumberFormat(read_this_sets_billing_values.a_803b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_803b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_803c# neq "">
<cfset a_803c = #read_this_sets_billing_values.a_803c#>
<cfset temp = AddQueryItem(803, read_this_sets_billing_values.a_803_textc, NumberFormat(read_this_sets_billing_values.a_803c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_803c = 0>
</cfif>			
</cfif>
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_803f# neq "">
<cfset temp = AddQueryItem(803, read_this_sets_billing_values.a_803_textf, NumberFormat(read_this_sets_billing_values.a_803f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 804 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>			
<cfif #read_this_sets_billing_values.a_804# neq "">
<cfset a_804 = #read_this_sets_billing_values.a_804#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.a_804_text, NumberFormat(read_this_sets_billing_values.a_804, '_____.__'), "Buyer")>
<cfelse>
<cfset a_804 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_804b# neq "">
<cfset a_804b = #read_this_sets_billing_values.a_804b#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.a_804_textb, NumberFormat(read_this_sets_billing_values.a_804b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_804b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_804c# neq "">
<cfset a_804c = #read_this_sets_billing_values.a_804c#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.a_804_textc, NumberFormat(read_this_sets_billing_values.a_804c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_804c = 0>
</cfif>			
</cfif>
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_804f# neq "">
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.a_804_textf, NumberFormat(read_this_sets_billing_values.a_804f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 805 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>		
<cfif #read_this_sets_billing_values.a_805# neq "">
<cfset a_805 = #read_this_sets_billing_values.a_805#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.a_805_text, NumberFormat(read_this_sets_billing_values.a_805, '_____.__'), "Buyer")>
<cfelse>
<cfset a_805 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_805b# neq "">
<cfset a_805b = #read_this_sets_billing_values.a_805b#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.a_805_textb, NumberFormat(read_this_sets_billing_values.a_805b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_805b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_805c# neq "">
<cfset a_805c = #read_this_sets_billing_values.a_805c#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.a_805_textc, NumberFormat(read_this_sets_billing_values.a_805c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_805c = 0>
</cfif>			
</cfif>
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_805f# neq "">
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.a_805_textf, NumberFormat(read_this_sets_billing_values.a_805f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 806 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>		
<cfif #read_this_sets_billing_values.a_806# neq "">
<cfset a_806 = #read_this_sets_billing_values.a_806#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.a_806_text, NumberFormat(read_this_sets_billing_values.a_806, '_____.__'), "Buyer")>
<cfelse>
<cfset a_806 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_806b# neq "">
<cfset a_806b = #read_this_sets_billing_values.a_806b#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.a_806_textb, NumberFormat(read_this_sets_billing_values.a_806b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_806b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_806c# neq "">
<cfset a_806c = #read_this_sets_billing_values.a_806c#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.a_806_textc, NumberFormat(read_this_sets_billing_values.a_806c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_806c = 0>
</cfif>			
</cfif>
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_806f# neq "">
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.a_806_textf, NumberFormat(read_this_sets_billing_values.a_806f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 807 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>		
<cfif #read_this_sets_billing_values.a_807# neq "">
<cfset a_807 = #read_this_sets_billing_values.a_807#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.a_807_text, NumberFormat(read_this_sets_billing_values.a_807, '_____.__'), "Buyer")>
<cfelse>
<cfset a_807 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_807b# neq "">
<cfset a_807b = #read_this_sets_billing_values.a_807b#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.a_807_textb, NumberFormat(read_this_sets_billing_values.a_807b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_807b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_807c# neq "">
<cfset a_807c = #read_this_sets_billing_values.a_807c#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.a_807_textc, NumberFormat(read_this_sets_billing_values.a_807c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_807c = 0>
</cfif>			
</cfif>
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_807f# neq "">
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.a_807_textf, NumberFormat(read_this_sets_billing_values.a_807f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 808 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>			
<cfif #read_this_sets_billing_values.a_808# neq "">
<cfset a_808 = #read_this_sets_billing_values.a_808#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.a_808_text, NumberFormat(read_this_sets_billing_values.a_808, '_____.__'), "Buyer")>
<cfelse>
<cfset a_808 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_808b# neq "">
<cfset a_808b = #read_this_sets_billing_values.a_808b#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.a_808_textb, NumberFormat(read_this_sets_billing_values.a_808b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_808b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_808c# neq "">
<cfset a_808c = #read_this_sets_billing_values.a_808c#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.a_808_textc, NumberFormat(read_this_sets_billing_values.a_808c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_808c = 0>
</cfif>			
</cfif>
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_808f# neq "">
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.a_808_textf, NumberFormat(read_this_sets_billing_values.a_808f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 810 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>			
<cfif #read_this_sets_billing_values.a_810# neq "">
<cfset a_810 = #read_this_sets_billing_values.a_810#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.a_810_text, NumberFormat(read_this_sets_billing_values.a_810, '_____.__'), "Buyer")>
<cfelse>
<cfset a_810 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_810b# neq "">
<cfset a_810b = #read_this_sets_billing_values.a_810b#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.a_810_textb, NumberFormat(read_this_sets_billing_values.a_810b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_810b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_810c# neq "">
<cfset a_810c = #read_this_sets_billing_values.a_810c#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.a_810_textc, NumberFormat(read_this_sets_billing_values.a_810c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_810c = 0>
</cfif>			
</cfif>
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_810f# neq "">
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.a_810_textf, NumberFormat(read_this_sets_billing_values.a_810f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 811 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>		
<cfif #read_this_sets_billing_values.a_811# neq "">
<cfset a_811 = #read_this_sets_billing_values.a_811#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.a_811_text, NumberFormat(read_this_sets_billing_values.a_811, '_____.__'), "Buyer")>
<cfelse>
<cfset a_811 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_811b# neq "">
<cfset a_811b = #read_this_sets_billing_values.a_811b#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.a_811_textb, NumberFormat(read_this_sets_billing_values.a_811b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_811b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_811c# neq "">
<cfset a_811c = #read_this_sets_billing_values.a_811c#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.a_811_textc, NumberFormat(read_this_sets_billing_values.a_811c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_811c = 0>
</cfif>			
</cfif>
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_811f# neq "">
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.a_811_textf, NumberFormat(read_this_sets_billing_values.a_811f, '_____.__'), "Seller")>
</cfif>
</cfif>
</cffunction>



<cffunction name="getRecFees" output="true" returntype="any">

<cfargument name="transaction_type" type="string"default="">
<cfargument name="property_state" type="string" default="">
<cfargument name="property_county" type="string" default="">
<cfargument name="property_city" type="string" default="">
<cfargument name="loan_amount" type="string" default="0">
<cfargument name="purchase_price" type="string" default="0">
<cfargument name="previous_loan_amount" default=0>
<cfargument name="property_use_type" type="string" default="">
<cfargument name="company_id" type="string" default="">
<cfargument name="return_data" type="string" default="1">
<cfargument name="previous_loan_month" default=1>
<cfargument name="previous_loan_year" default=1996>
<cfargument name="enhanced_coverage" type="string" default="0">
<cfargument name="same_lender" type="string" default="0">
<cfargument name="reissue_rates" type="string" default="0">
<cfargument name="jlp_policy" type="string" default="0">
<cfargument name="property_report" type="string" default="0">
<cfargument name="appraised_value" type="string" default="0">
<cfargument name="seller_paid_lender_policy" type="string" default="0">
<cfargument name="seller_paid_owner_policy" type="string" default="0">
<cfargument name="asset_manager" type="string" default="">
<cfargument name="title_id" default="">
<!--- get all recording fees for this state (and/or county) from our database --->
<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
SELECT * FROM recording_fees WHERE state = '#arguments.property_state#'
</CFQUERY>
<CFIF #read_rec_fees.recordcount# gt "1">
<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
SELECT * FROM recording_fees WHERE state = '#arguments.property_state#' and county Like '#trim(arguments.property_county)#'
</CFQUERY>
<CFIF #read_rec_fees.recordcount# eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
SELECT * FROM recording_fees WHERE state = '#arguments.property_state#' and (county Like 'All' or county = '')
</CFQUERY>			
<CFELSEIF #read_rec_fees.recordcount# gt "1">
<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
SELECT * FROM recording_fees WHERE state = '#arguments.property_state#' and county Like '#trim(arguments.property_county)#' and city Like '#trim(arguments.property_city)#'
</CFQUERY>
<CFIF #read_rec_fees.recordcount# eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
SELECT * FROM recording_fees WHERE state = '#arguments.property_state#' and county Like '#trim(arguments.property_county)#' and (city Like 'All' or city = '')
</CFQUERY>
</cfif>
</CFIF>
</cfif>
<!--- 1201 rec fee --->
<!--- 1201 Deed recording fee --->
<cfif arguments.transaction_type eq 'Reverse Mortgage'>
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", 1201)>
<cfset temp = QuerySetCell(fees_query, "Description", "Mortgage Recording Fee")>
<cfif arguments.property_state eq 'VA'>
<cfset temp = QuerySetCell(fees_query, "Amount", 92)>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Amount", read_rec_fees.mort_rec_fee * 2)>
</cfif>
<cfset temp = QuerySetCell(fees_query, "Payer", "Buyer")>
<cfelse>
<CFIF #read_rec_fees.mort_rec_fee# NEQ "">
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", 1201)>
<cfset temp = QuerySetCell(fees_query, "Description", "Mortgage Recording Fee")>
<cfset temp = QuerySetCell(fees_query, "Amount", read_rec_fees.mort_rec_fee)>
<cfset temp = QuerySetCell(fees_query, "Payer", "Buyer")>
</cfif>
</cfif>
<CFIF #read_rec_fees.deedrecfees# NEQ "" and (arguments.transaction_type eq 'Purchase' or arguments.company_id eq 3276)>
<Cfset deed_rec_fee = #read_rec_fees.deedrecfees#>
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", 1201)>
<cfset temp = QuerySetCell(fees_query, "Description", "Deed Recording Fee")>
<cfset temp = QuerySetCell(fees_query, "Amount", deed_rec_fee)>
<cfif arguments.company_id eq 3276>
<cfset temp = QuerySetCell(fees_query, "Payer", "Buyer")>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Payer", "Seller")>
</cfif>
</cfif>
<!--- 1201 release fee --->
<!--- if asset manager is set to Fannie or Freddie, 1203 and 1202 are not charged --->
<!--- 1203 State Deed (also called Transfer Tax) --->
<cfset state_deed_1 = 0>
<cfif #arguments.transaction_type# eq "Purchase" or (#arguments.transaction_type# eq "Reverse Mortgage" and #arguments.property_state# eq "VA") or (#arguments.transaction_type# eq "Refinance" and #arguments.property_state# eq "VA")>
<!--- calculate a default state Deed --->
<CFIF #read_rec_fees.recordcount# gt 0>
<CFIF #read_rec_fees.transfer_tax# NEQ 0 and #read_rec_fees.transfer_tax# NEQ '' and #read_rec_fees.transfer_tax# NEQ 'NULL'>
<cfset state_deed_1 = #arguments.purchase_price# * #read_rec_fees.transfer_tax#>
</cfif>
</CFIF>			
<!--- the following states calculate State Deed differently, so these states will overwrite the default State Deed calculated above --->
<!--- NJ Transfer Tax --->
<cfif arguments.property_state eq "NJ">
<cfset state_deed_1 = 0>
<cfif arguments.purchase_price LT 350000>
<cfif arguments.purchase_price GT 150000>
<cfset state_deed_1 = 150000 * 0.004>
</cfif>
<cfif arguments.purchase_price GT 200000>
<cfset state_deed_1 = state_deed_1 + (50000 * 0.0067)>

<cfset state_deed_1 = state_deed_1 + ((arguments.purchase_price - 200000) * 0.0078)>
<cfelse>
<cfset state_deed_1 = state_deed_1 + ((arguments.purchase_price) * 0.0067)>
</cfif>
<cfelse>
<cfif arguments.purchase_price GT 150000>
<cfset state_deed_1 = 150000 * 0.0058>
<cfelse>
<cfset state_deed_1 = arguments.purchase_price * 0.0058>
</cfif>
<cfif arguments.purchase_price GT 200000>
<cfset state_deed_1 = state_deed_1 + (50000 * 0.0085)>
<cfelse>
<cfset state_deed_1 = state_deed_1 + ((arguments.purchase_price - 150000) * 0.0085)>
</cfif>
<cfif arguments.purchase_price GT 550000>
<cfset state_deed_1 = state_deed_1 + (250000 * 0.0096)>
<cfelse>
<cfset state_deed_1 = state_deed_1 + ((arguments.purchase_price - 2000000) * 0.0096)>
</cfif>
<cfif arguments.purchase_price GT 850000>
<cfset state_deed_1 = state_deed_1 + (300000 * 0.0106)>
<cfelse>
<cfset state_deed_1 = state_deed_1 + ((arguments.purchase_price - 550000) * 0.0106)>
</cfif>
<cfif arguments.purchase_price GT 1000000>
<cfset state_deed_1 = state_deed_1 + (150000 * 0.0116)>
<cfset state_deed_1 = state_deed_1 + ((arguments.purchase_price - 850000) * 0.0121)>
<cfelse>
<cfset state_deed_1 = state_deed_1 + ((arguments.purchase_price - 850000) * 0.0116)>
</cfif>
</cfif>
<cfif arguments.purchase_price GT 1000000>
<cfset state_deed_1 = state_deed_1 + (arguments.purchase_price * 0.01)>
</cfif>
</cfif>
<!--- END NJ Transfer Tax --->	
<!--- LA Transfer Tax --->
<cfif arguments.property_state eq "LA" and arguments.property_county eq "Orleans" and arguments.property_city eq "New Orleans">
<cfset state_deed_1 = 325>
</cfif>
<!--- END LA Transfer Tax --->	
<!--- HI Transfer Tax --->
<cfif arguments.property_state eq "HI">
<cfset state_deed_1 = 0>
<cfif arguments.purchase_price LT 600000>
<cfset state_deed_1 = arguments.purchase_price * 0.0015>
<cfelseif arguments.purchase_price LT 1000000>
<cfset state_deed_1 = arguments.purchase_price * 0.0025>
<cfelse>
<cfset state_deed_1 = arguments.purchase_price * 0.0035>
</cfif>
</cfif>
<!--- END HI Transfer Tax --->
<!--- DC Transfer Tax --->
<cfif arguments.property_state eq "DC">
<cfset state_deed_1 = 0>
<cfif arguments.purchase_price LT 400000>
<cfset state_deed_1 = arguments.purchase_price * 0.022>
<cfelse>
<cfset state_deed_1 = arguments.purchase_price * 0.029>
</cfif>
</cfif>
<!--- END DC Transfer Tax --->	
<!--- VT Transfer Tax --->
<cfif arguments.property_state eq "VT">		
<cfset state_deed_1 = 0>	
<cfif arguments.purchase_price GT 100000>
<cfset state_deed_1 = 100000 * 0.005>
<cfset state_deed_1 = state_deed_1 + ((arguments.purchase_price-100000) * 0.0125)>
<cfelse>
<cfset state_deed_1 = arguments.purchase_price * 0.005>
</cfif>
<!--- if prop use type is investment, than calculate at .0125 from dollar 1 --->		  
<cfif arguments.property_use_type neq '1' and arguments.property_use_type neq 'Primary Residence'>
<cfset state_deed_1 = arguments.purchase_price * 0.0125>
</cfif>		  
</cfif>
<!--- END VT Transfer Tax --->
<!--- CT Transfer Tax --->
<!--- if prop use type is investment, than calculate at .015 from dollar 1, except in 13 cities it'll be--->
<cfif arguments.property_state eq "CT">
<cfset state_deed_1 = 0>
<cfif arguments.property_city eq 'Bloomfield' or arguments.property_city eq 'Bridgeport' or arguments.property_city eq 'Bristol' or arguments.property_city eq 'East Hartford' or arguments.property_city eq 'Groton' or arguments.property_city eq 'Hamden' or arguments.property_city eq 'Hartford' or arguments.property_city eq 'Meriden' or arguments.property_city eq 'Middletown' or arguments.property_city eq 'New Britain' or arguments.property_city eq 'New Haven' or arguments.property_city eq 'New London' or arguments.property_city eq 'Norwalk' or arguments.property_city eq 'Norwich' or arguments.property_city eq 'Southington' or arguments.property_city eq 'Waterbury' or arguments.property_city eq 'Windham'>
<cfif arguments.purchase_price GT 800000>
<cfset state_deed_1 = 800000 * 0.0086>
<cfset state_deed_1 = state_deed_1 + (arguments.purchase_price-800000 * 0.0136)>
<cfelse>
<cfset state_deed_1 = (arguments.purchase_price * 0.0086)>			
</cfif>
<cfelse>
<cfif arguments.purchase_price GT 800000>
<cfset state_deed_1 = 800000 * 0.0061>
<cfset state_deed_1 = state_deed_1 + (arguments.purchase_price-800000 * 0.0111)>			
<cfelse>
<cfset state_deed_1 = (arguments.purchase_price * 0.0061)>			
</cfif>
</cfif>
<!--- if prop use type is investment, than calculate at .37 from dollar 1 --->		  
<cfif arguments.property_use_type neq '1' and arguments.property_use_type neq 'Primary Residence'>
<cfif arguments.property_city eq 'Bloomfield' or arguments.property_city eq 'Bridgeport' or arguments.property_city eq 'Bristol' or arguments.property_city eq 'East Hartford' or arguments.property_city eq 'Groton' or arguments.property_city eq 'Hamden' or arguments.property_city eq 'Hartford' or arguments.property_city eq 'Meriden' or arguments.property_city eq 'Middletown' or arguments.property_city eq 'New Britain' or arguments.property_city eq 'New Haven' or arguments.property_city eq 'New London' or arguments.property_city eq 'Norwalk' or arguments.property_city eq 'Norwich' or arguments.property_city eq 'Southington' or arguments.property_city eq 'Waterbury' or arguments.property_city eq 'Windham'>
<cfset state_deed_1 = (arguments.purchase_price * 0.0136)>
<cfelse>
<cfset state_deed_1 = (arguments.purchase_price * 0.111)>
</cfif>
</cfif>		  
</cfif>
<!--- END CT Transfer Tax --->
<!--- NY Transfer Tax --->
<cfif arguments.property_state eq "NY">			
<cfif #arguments.property_county# eq "Bronx" or #arguments.property_county# eq "Kings" or #arguments.property_county# eq "New York" or #arguments.property_county# eq "Queens" or #arguments.property_county# eq "Richmond">
<cfif arguments.purchase_price GT 1000000>
<cfset state_deed_1 = (arguments.purchase_price) * 0.01825>
<cfelseif arguments.purchase_price GTE 500000>
<cfset state_deed_1 = (arguments.purchase_price) * 0.01825>
<cfelse>
<cfset state_deed_1 = (arguments.purchase_price) * 0.014>
</cfif>
</cfif>
<!--- 		<cfif arguments.purchase_price GT 1000000>
<cfset state_deed_1 = state_deed_1 + (arguments.purchase_price * 0.01)>
</cfif>
--->		</cfif>
<!--- END NY Transfer Tax --->				
<!--- Alabama Transfer Tax --->
<cfif arguments.property_state eq "AL">
<cfif arguments.purchase_price GT arguments.loan_amount>
<cfset state_deed_1 = (arguments.purchase_price-arguments.loan_amount) * read_rec_fees.transfer_tax>
<cfelse>
<cfset state_deed_1 = 0>
</cfif>
</cfif>
<!--- END Alabama Transfer Tax --->			
<!--- Virgina Transfer Tax --->
<cfif arguments.property_state eq "VA">
<cfif arguments.transaction_type eq 'Reverse Mortgage'>
<cfset total_1203 = (arguments.loan_amount * 1.5)  * .0025>
<cfelse>
<cfset total_1203 = arguments.purchase_price * .0025>
<cfif IsNumeric(arguments.loan_amount) and arguments.loan_amount gt 0>
<cfset total_1203 = total_1203 + (arguments.loan_amount * .0025)>
</cfif>
</cfif>
<cfif arguments.loan_amount LTE arguments.previous_loan_amount and arguments.same_lender eq 1>
<cfset total_1203 = 0>
<cfelseif arguments.loan_amount GT arguments.previous_loan_amount and arguments.same_lender eq 1>
<cfset total_1203 = (arguments.loan_amount - arguments.previous_loan_amount) * .0025>	
</cfif>
<cfset state_deed_1 = total_1203>
</cfif>
<!--- END Virginia Transfer Tax --->			

<!--- if this order or calculation is done by ROA Hutton (3276 or 3983), these are purchases that are transferring from co-op to single ownership...since these folks already "own" the property, there is no transfer, so no transfer tax, set it to 0 --->
<cfif arguments.company_id eq 3276 or arguments.company_id eq 3943 or arguments.company_id eq 4043 or arguments.company_id eq 4042>
<cfset state_deed_1 = 0>
</cfif>
<!--- now we need to split the Transfer Fee between the buyer and seller based on different states --->
<cfif state_deed_1 gt 0>
<cfset current_state_deed = state_deed_1>
<cfset seller_pays_list = "AL,CO,NJ,TN,IL,FL">
<cfset buyer_pays_list = "CA,CT,GA,IA,KY,MA,MI,MN,NE,NV,NC,OH,OK,RI,SC,SD,WA,WI,WV,VA">
<cfset split_states_list = "AR,DC,DE,ME,NH,PA,MD,VT">
<cfif ListFindNoCase(seller_pays_list, arguments.property_state, ",") neq 0>
	<cfif arguments.asset_manager neq 2368 and arguments.asset_manager neq 3568>			
	<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat(current_state_deed, '_____.__'), "Seller")>
	</cfif>
<cfelseif ListFindNoCase(buyer_pays_list, arguments.property_state, ",") neq 0>
<cfif arguments.transaction_type eq 'Reverse Mortgage' or arguments.transaction_type eq 'Refinance'>
<cfset temp = AddQueryItem(1203, "State Mortgage Stamps", NumberFormat(current_state_deed, '_____.__'), "Buyer")>	
<cfelse>
<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat(current_state_deed, '_____.__'), "Buyer")>	
</cfif>
<cfelseif ListFindNoCase(split_states_list, arguments.property_state, ",") neq 0>
<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat((current_state_deed / 2), '_____.__'), "Buyer")>
	<cfif arguments.asset_manager neq 2368 and arguments.asset_manager neq 3568>
	<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat((current_state_deed / 2), '_____.__'), "Seller")>
	</cfif>
<cfelse>
<cfif arguments.property_state eq 'HI'>			
<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat((current_state_deed * .40), '_____.__'), "Buyer")>

	<cfif arguments.asset_manager neq 2368 and arguments.asset_manager neq 3568>
	<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat((current_state_deed * .60), '_____.__'), "Seller")>	
	</cfif>
					
<cfelseif arguments.property_state eq 'OR' and arguments.property_county eq 'Washington'>
<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat((current_state_deed / 2), '_____.__'), "Buyer")>

	<cfif arguments.asset_manager neq 2368 and arguments.asset_manager neq 3568>
	<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat((current_state_deed / 2), '_____.__'), "Seller")>	
	</cfif>		
<cfelseif arguments.property_state eq 'NY' and arguments.purchase_price GTE 1000000>
<cfset buyer_cost = arguments.purchase_price * .01>
<cfset seller_cost = current_state_deed>			
<cfset temp = AddQueryItem(1203, "Mansion Tax", NumberFormat(buyer_cost, '_____.__'), "Buyer")>

	<cfif arguments.asset_manager neq 2368 and arguments.asset_manager neq 3568>
	<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat(seller_cost, '_____.__'), "Seller")>
	</cfif>			
<cfelseif arguments.property_state eq 'NY' and arguments.purchase_price LT 1000000>	
	<cfif arguments.asset_manager neq 2368 and arguments.asset_manager neq 3568>
	<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat(current_state_deed, '_____.__'), "Seller")>	
	</cfif>		
<cfelse>			
<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat(current_state_deed, '_____.__'), "Buyer")>			
</cfif>
</cfif>		
<cfelseif arguments.property_state eq 'VT'>
<cfset sellers_amount = Ceiling((arguments.purchase_price / 1000))>
<cfset buyers_amount = Ceiling((current_state_deed - sellers_amount))>
<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat(buyers_amount, '_____.__'), "Buyer")>
	<cfif arguments.asset_manager neq 2368 and arguments.asset_manager neq 3568>
	<cfset temp = AddQueryItem(1203, "State Deed", NumberFormat(sellers_amount, '_____.__'), "Seller")>			
	</cfif>
<cfelse>
<cfset state_deed_1 = "0">
</cfif>						
</cfif>
<!--- 1202 Mortgage Stamps --->
<cfif #arguments.transaction_type# eq 'Reverse Mortgage' and IsDefined("read_rec_fees.mort_stamps")>
<cfif arguments.property_state eq 'VA'>
<CFSET city_mort_stamps = (arguments.loan_amount * 1.5) * .000834>
<cfelse>
<cfset city_mort_stamps=#NumberFormat(ROUND((arguments.loan_amount*1.5)*read_rec_fees.mort_stamps),'_____.__')#>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">
<cfif arguments.property_state eq "MD">
<!--- for Maryland Purchases, Mortgage Stamps are based on read_rec_fees.mort_stamps mulitplied by the Purchase Price, or the Loan Amount, whichever is greater --->
<cfif arguments.purchase_price gt arguments.loan_amount>
<cfset city_mort_stamps=#NumberFormat(ROUND((arguments.purchase_price)*read_rec_fees.mort_stamps),'_____.__')#>
<cfelse>
<cfset city_mort_stamps=#NumberFormat(ROUND((arguments.loan_amount)*read_rec_fees.mort_stamps),'_____.__')#>
</cfif>
<!--- for Maryland Purchases, if the Loan Amount (arguments.loan_amount) is greater than the purchase price (arguments.purchase_price), then Mortgage Stamps are calculated based on the difference between the Loan Amount and Purchase price. If Purchase Price is greater than Loan Amount, No Mortgage Stamps --->
<cfif arguments.property_state eq 'MD' and arguments.property_county eq 'Montgomery'>
<cfif arguments.loan_amount lte 500000>
<cfset city_mort_stamps=#NumberFormat(ROUND((arguments.loan_amount)*read_rec_fees.mort_stamps),'_____.__')#>
<cfelse>
<cfset first_amount = #NumberFormat(ROUND((500000)*read_rec_fees.mort_stamps),'_____.__')#>
<cfset second_amount = ((arguments.loan_amount - 500000) * .01)>
<cfset city_mort_stamps=#NumberFormat((first_amount + second_amount) ,'_____.__')#>
</cfif>
</cfif>
<cfelseif arguments.property_state eq "VA">
<cfset city_mort_stamps = .000834 * arguments.purchase_price>
<cfif IsNumeric(arguments.loan_amount) and arguments.loan_amount gt 0>
<cfset city_mort_stamps = city_mort_stamps + (.000834 * arguments.loan_amount)>
</cfif>
<cfelse>
<cfif isnumeric(read_rec_fees.mort_stamps) and read_rec_fees.mort_stamps neq 0>
<CFSET city_mort_stamps = #round(arguments.loan_amount)# * #read_rec_fees.mort_stamps#>
<cfelse>
<cfset city_mort_stamps = 0>
</cfif>
</cfif>
<cfif city_mort_stamps LT 0>
<CFSET city_mort_stamps = 0>
</cfif>
<cfelseif #arguments.transaction_type# neq 'Purchase' and #arguments.transaction_type# neq 'Reverse Mortgage'><!--- not a purchase --->
<cfif (#arguments.property_state# EQ "MD")>
<!--- If this is not a purchase (it's a refi or a 2nd) and the Porperty Use Type is Primary Residence, Mortgage Stamps are based on the loan amount (arguments.loan_amount) minus the existing loan (orig_loan_amt), otherwise, use the regular calculation --->
<cfif IsNumeric(arguments.loan_amount) eq 0>
<cfset arguments.loan_amount = 0>
</cfif>
<cfif IsNumeric(arguments.previous_loan_amount) eq 0>
<cfset arguments.previous_loan_amount = 0>
</cfif>
<cfparam name="arguments.loan_amount" default="0">
<cfparam name="arguments.previous_loan_amount" default="0">
<cfparam name="read_rec_fees.mort_stamps" default="0">
<cfif arguments.property_use_type eq '1'  or arguments.property_use_type eq 'Primary Residence'>
<cfset city_mort_stamps=0>
<cfelse>
<cfset city_mort_stamps=0>
</cfif>
<cfif arguments.property_state eq 'MD' and arguments.property_county eq 'Montgomery'>
<cfif arguments.loan_amount gte arguments.previous_loan_amount>
<cfset new_money = arguments.loan_amount - arguments.previous_loan_amount>
<cfelse>
<cfset new_money = arguments.loan_amount>
</cfif>
<cfif new_money lte 500000>
<cfset city_mort_stamps=#NumberFormat(ROUND((new_money)*read_rec_fees.mort_stamps),'_____.__')#>
<cfelse>
<cfset first_amount = #NumberFormat(ROUND((500000)*read_rec_fees.mort_stamps),'_____.__')#>
<cfset second_amount = ((new_money - 500000) * .01)>
<cfset city_mort_stamps=#NumberFormat((first_amount + second_amount) ,'_____.__')#>
</cfif>
</cfif>
<cfelseif arguments.property_state eq "NY">
<!--- If this is not a purchase (it's a refi or a 2nd) and the Porperty Use Type is Primary Residence, Mortgage Stamps are based on the loan amount (arguments.loan_amount) minus the existing loan (orig_loan_amt), otherwise, use the regular calculation --->
<cfif #arguments.property_county# eq "Bronx" or #arguments.property_county# eq "Kings" or #arguments.property_county# eq "New York" or #arguments.property_county# eq "Queens" or #arguments.property_county# eq "Richmond">
<cfif arguments.loan_amount LTE 500000>
<cfset percent_calc = 0.0205>
<cfelse>
<cfset percent_calc = 0.02175>
</cfif>
<cfelse>
<cfset percent_calc = read_rec_fees.mort_stamps>
</cfif>

<cfparam name="arguments.loan_amount" default="0">
<cfparam name="percent_calc" default="0">

<cfif Not IsNumeric(arguments.loan_amount)>
<CFSET arguments.loan_amount = 0>
</cfif>
<cfif Not IsNumeric(percent_calc)>
<CFSET percent_calc = 0>
</cfif>

<CFSET city_mort_stamps = #round(arguments.loan_amount)# * #percent_calc#>
<cfelse>
<cftry>
<CFSET city_mort_stamps = round(arguments.loan_amount) * read_rec_fees.mort_stamps>			
<cfcatch type="any"><cfset city_mort_stamps= 0></cfcatch>
</cftry>

</cfif>
<cfif city_mort_stamps LT 0>
<CFSET city_mort_stamps = 0>
</cfif>
</cfif>			
<cfif IsDefined("City_mort_stamps") and city_mort_stamps neq 0 and city_mort_stamps neq "">
<cfif arguments.property_state eq 'NY'>
<cfset lender_cost = city_mort_stamps * .25>
<cfset descr = "City Mortgage Stamps ($" & lender_cost & " POC Lender)">
<cfset temp = AddQueryItem(1202, descr, NumberFormat(city_mort_stamps, '_____.__'), "Buyer")>
<cfelseif arguments.property_state eq 'VA' and arguments.transaction_type eq 'Refinance'>
<cfif arguments.loan_amount GT arguments.previous_loan_amount and arguments.same_lender eq 1>
<cfset new_money = arguments.loan_amount - arguments.previous_loan_amount>
<CFSET city_mort_stamps = #round(new_money)# * #read_rec_fees.mort_stamps#>
<cfelse>
<CFSET city_mort_stamps = #round(arguments.loan_amount)# * .000834>
</cfif>
<cfset temp = AddQueryItem(1202, "City Mortgage Stamps", NumberFormat(city_mort_stamps, '_____.__'), "Buyer")>	
<cfelse>
<cfset temp = AddQueryItem(1202, "City Mortgage Stamps", NumberFormat(city_mort_stamps, '_____.__'), "Buyer")>
</cfif>
</cfif>
</cffunction>



<cffunction name="getFees" output="true" returntype="query">
<cfargument name="transaction_type" type="string"default="">
<cfargument name="property_state" type="string" default="">
<cfargument name="property_county" type="string" default="">
<cfargument name="property_city" type="string" default="">
<cfargument name="loan_amount" type="string" default="0">
<cfargument name="purchase_price" type="string" default="0">
<cfargument name="previous_loan_amount" default=0>
<cfargument name="property_use_type" type="string" default="">
<cfargument name="company_id" type="string" default="">
<cfargument name="return_data" type="string" default="1">
<cfargument name="previous_loan_month" default=1>
<cfargument name="previous_loan_year" default=1996>
<cfargument name="enhanced_coverage" type="string" default="0">
<cfargument name="same_lender" type="string" default="0">
<cfargument name="reissue_rates" type="string" default="0">
<cfargument name="jlp_policy" type="string" default="0">
<cfargument name="property_report" type="string" default="0">
<cfargument name="appraised_value" type="string" default="0">
<cfargument name="seller_paid_lender_policy" type="string" default="0">
<cfargument name="seller_paid_owner_policy" type="string" default="0">
<cfargument name="asset_manager" type="string" default="">
<cfargument name="title_id" default="">
<cfif Trim(previous_loan_amount) eq ''>
<cfset previous_loan_amount = 0>
</cfif>
<cfset bulk_rate = 0>
<cfset current_ins_premium = "">
<cfif arguments.previous_loan_month eq 'NULL' or arguments.previous_loan_month eq '' or arguments.previous_loan_month eq '0'>
<cfset arguments.previous_loan_month = 1>
</cfif>
<cfif arguments.previous_loan_year eq 'NULL' or arguments.previous_loan_year eq '' or arguments.previous_loan_year eq '0'>
<cfset arguments.previous_loan_year = 2006>
</cfif>
<cfif arguments.purchase_price eq "">
<cfset arguments.purchase_price = 0>
</cfif>
<cfset arguments.property_county = ReplaceNoCase(arguments.property_county, "'", "", "ALL")>
<cfif arguments.transaction_type eq "ConstructionOnly">
<cfset arguments.transaction_type = "Purchase">
</cfif>	
<CFSET item_count = 1>
<CFSET ReturnXml = XmlNew()>
<CFSET ReturnXml.XmlRoot = XmlElemNew(ReturnXml, "RESPONSE")>
<cfset ReturnXml.RESPONSE.xmlAttributes.Type = "FeeInquiry">
<cfset ReturnXml.RESPONSE.DATA = XmlElemNew(ReturnXml, "DATA")>
<cfset ReturnXml.RESPONSE.DATA.MAIN = XmlElemNew(ReturnXml, "MAIN")>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN = XmlElemNew(ReturnXml, "LOAN")>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN._APPLICATION = XmlElemNew(ReturnXml, "_APPLICATION")>
<cfif isDefined("session.comp_id") and IsNumeric(session.comp_id)>
<!--- <CFQUERY datasource="#request.dsn#" NAME="insert_hit">
Insert into Fee_Generator_Hits (date_of_use, comp_id, state, transaction_type)
values (#createodbcdatetime(now())#, #session.comp_id#, '#arguments.property_state#', '#arguments.transaction_type#')
</CFQUERY>
 ---><cfelse>
<!--- <CFQUERY datasource="#request.dsn#" NAME="insert_hit">
Insert into Fee_Generator_Hits (date_of_use)
values (#createodbcdatetime(now())#)
</CFQUERY>
 ---></cfif>
<CFQUERY datasource="#request.dsn#" NAME="get_all_comp_info">
SELECT * FROM Companies where ID = #trim(arguments.company_id)#
</CFQUERY>
<cfset fees_query = QueryNew("Line_Number, Description, Amount, Payer")>			






<cfset temp = #GetRecFees(arguments.transaction_type,arguments.property_state,arguments.property_county,arguments.property_city,arguments.loan_amount,arguments.purchase_price,arguments.previous_loan_amount,arguments.property_use_type,arguments.company_id,arguments.return_data,arguments.previous_loan_month,arguments.previous_loan_year,arguments.enhanced_coverage,arguments.same_lender,arguments.reissue_rates,arguments.jlp_policy,arguments.property_report,arguments.appraised_value,arguments.seller_paid_lender_policy,arguments.seller_paid_owner_policy,arguments.asset_manager,arguments.title_id)#>



<cfset pre_enhanced_amount = 0>
<cfset buyers_portion_owner_policy = 0>
<cfif arguments.property_report eq 0>
<!--- 1109 TITLE INSURANCE --->
<!--- is this an ROA Hutton file, even though it's a refi, needs to record Title Insurance as if it's a purchase, so we'll temporarily make this a purchase, figure out TI, then change it back to a refi --->
<cfif arguments.company_id eq 3276 or arguments.company_id eq 3943 or arguments.company_id eq 4043 or arguments.company_id eq 4042>
<cfset arguments.transaction_type = "Purchase">
</cfif>
<cfset a_ins_premium = "">
<!--- now let's check if this is a Junior Loan Policy, and if so, calculate the insurance --->
<cfif arguments.transaction_type contains 'Second Mortgage' and arguments.jlp_policy eq 1 and arguments.loan_amount LTE 200000>
<CFSET   x_final  = #Round(arguments.loan_amount)#>	
<CFQUERY datasource="#request.dsn#" NAME="get_table_name" maxrows="1">		
SELECT jlp_table
FROM Zip_info
where state = '#arguments.property_state#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT second_mortgage FROM #get_table_name.jlp_table# WHERE a_to >= #x_final# order by a_to
</CFQUERY>
<cfset a_ins_premium = read_ins_calc.second_mortgage>
<cfset temp = AddQueryItem(1109, "Title Insurance Premium", NumberFormat(a_ins_premium, '_____.__'), "Buyer")>
<cfelse>
<cfset expedite_states = "AL,AR,DE,DC,GA,IL,IN,IA,KY,LA,ME,MD,MA,MN,MI,MO,NH,NC,ND,OK,SC,VT,VA,WV">
<!--- get rate table --->
<CFQUERY datasource="#request.dsn#" NAME="read_Title_Companies_States" maxrows="1">		
SELECT *
FROM Title_Companies_States s, title_companies t
where s.st_abbrev = '#arguments.property_state#'
and s.title_co_id = t.title_co_id
</CFQUERY>
<cfset read_title_companies_states.title_co_id = 16>
<cfset underwriter_table = "rate_table_stewart">
<!--- this part makes sure all streamline clients are put on Stewart until changed, also update order_verify_title.cfm line 1016 --->
<cfif arguments.title_id neq ''>
<CFQUERY datasource="#request.dsn#" NAME="read_underwriter" maxrows="1">		
SELECT *
FROM Doc_title_insurance_title
where title_id = #arguments.title_id#
</CFQUERY>
<cfset read_title_companies_states.title_co_id = #read_underwriter.insurance_co#>

<cfelse>


<cfif get_all_comp_info.streamline_client eq 'True' and arguments.transaction_type eq 'Purchase'>
<cfset read_title_companies_states.title_co_id = 16>
<cfelseif get_all_comp_info.streamline_client eq 'True' and arguments.transaction_type neq 'Purchase'>
<cfset read_title_companies_states.title_co_id = 25>
</cfif>
</cfif>
<cfif read_title_companies_states.title_co_id eq 15>
<cfset underwriter_table = "rate_table">
<cfelseif read_title_companies_states.title_co_id eq 25>
<cfset underwriter_table = "rate_table_first_american">
<cfelseif read_title_companies_states.title_co_id eq 14>
<cfset underwriter_table = "rate_table">
<cfelseif read_title_companies_states.title_co_id eq 16>
<cfset underwriter_table = "rate_table_stewart">
<cfelseif read_title_companies_states.title_co_id eq 19>
<cfset underwriter_table = "rate_table">
<cfelse>
<cfset underwriter_table = "rate_table_stewart">
</cfif>

<!--- simultaneous issue fees --->
<cfset first_american_simul_rate_MD = 150>
<cfset first_american_simul_rate_VA = 150>
<cfset stewart_simul_rate_MD = 35>
<cfset stewart_simul_rate_VA = 100>
<cfif underwriter_table contains 'stewart'>

<cfif arguments.property_state eq 'MD'>
<cfset simul_rate = stewart_simul_rate_MD>
<cfelseif arguments.property_state eq 'VA'>
<cfset simul_rate = stewart_simul_rate_VA>
</cfif>

<cfelseif underwriter_table contains 'first_american'>

<cfif arguments.property_state eq 'MD'>
<cfset simul_rate = first_american_simul_rate_MD>
<cfelseif arguments.property_state eq 'VA'>
<cfset simul_rate = first_american_simul_rate_VA>
</cfif>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="get_underwriters">
SELECT * FROM J_Companies_Underwriters WHERE comp_id = '#arguments.company_id#'
and state = '#arguments.property_state#'
</CFQUERY>
<cfif get_underwriters.recordcount>
<cfif get_underwriters.underwriter eq 'Stewart'>
<cfset underwriter_table = "rate_table_stewart">
<cfelseif get_underwriters.underwriter eq 'FirstAmerican'>
<cfset underwriter_table = "rate_table_first_american">
</cfif>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="get_table" maxrows="1">
SELECT #underwriter_table# as table_to_use FROM Zip_info WHERE state = '#arguments.property_state#'
and county = '#arguments.property_county#'
</CFQUERY>
<cfif get_table.table_to_use eq '' or get_table.table_to_use eq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_table" maxrows="1">
SELECT rate_table as table_to_use FROM Zip_info WHERE state = '#arguments.property_state#'
and county = '#arguments.property_county#'
</CFQUERY>
</cfif>			
<!--- this part checks to see that whatever table is selected, that it has fees in it, and if not, it'll default back to the regular (Ticor) tables) --->
<CFQUERY datasource="#request.dsn#" NAME="check_table" maxrows="1">
SELECT * FROM #get_table.table_to_use#
</CFQUERY>
<cfif check_table.recordcount eq 0>
<cfset underwriter_table = "rate_table">
<CFQUERY datasource="#request.dsn#" NAME="get_table" maxrows="1">
SELECT #underwriter_table# as table_to_use FROM Zip_info WHERE state = '#arguments.property_state#'
and county = '#arguments.property_county#'
</CFQUERY>			
</cfif>
<!--- end this part checks to see that whatever table is selected, that it has fees in it, and if not, it'll default back to the regular (Ticor) tables) --->

<cfif get_table.table_to_use eq 'StateMarylandStewart' and arguments.enhanced_coverage eq 1 and arguments.transaction_type eq 'Purchase'>
<cfset get_table.table_to_use = 'StateMarylandStewartEnhanced'>
</cfif>
<cfif get_table.table_to_use eq 'StateMarylandFirstAmerican' and arguments.enhanced_coverage eq '1' and arguments.transaction_type eq 'Purchase'>
<cfset get_table.table_to_use = 'StateMarylandFirstAmericanEnhanced'>
</cfif>
<cfif get_table.table_to_use eq 'StateVirginiaStewart' and arguments.enhanced_coverage eq '1' and arguments.transaction_type eq 'Purchase'>
<cfset get_table.table_to_use = 'StateVirginiaStewartEnhanced'>
</cfif>
<cfif get_table.table_to_use eq 'StateVirginiaFirstAmerican' and arguments.enhanced_coverage eq '1' and arguments.transaction_type eq 'Purchase'>
<cfset get_table.table_to_use = 'StateVirginiaFirstAmericanEnhanced'>
</cfif>

<!--- this part checks if a company has its own custom rate table, and if it does, we'll use that --->
<cfif Len(get_all_comp_info.custom_rate_table) and get_all_comp_info.custom_rate_table neq 0 and arguments.property_state eq 'IL'>
<cfset get_table.table_to_use = get_all_comp_info.custom_rate_table>
</cfif>
<cfif arguments.transaction_type eq 'Purchase'>
<CFSET   x_final  = #Round(arguments.purchase_price)#>
<cfelse>
<CFSET   x_final  = #Round(arguments.loan_amount)#>
</cfif>			
<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to>= #x_final# order by a_to
</CFQUERY>	
	
<cfif (arguments.transaction_type eq "Refinance" or arguments.transaction_type eq "Reverse Mortgage")>
<CFIF (arguments.company_id eq 1847 or arguments.company_id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
<CFSET a_ins_premium = #read_ins_calc.expedite#>
<cfelse>
<cfif arguments.property_state eq 'MI'>
<cfif IsNumeric(read_ins_calc.sale) and read_ins_calc.sale NEQ 'Call for Quote!'>
<cfif underwriter_table eq 'rate_table_landam'>
<CFSET a_ins_premium = (read_ins_calc.sale * .60)>
<cfelse>
<CFSET a_ins_premium = (read_ins_calc.sale * .5)>
</cfif>
<cfelse>
<CFSET a_ins_premium = "Call for Quote!">
</cfif>
<cfelse>
<CFSET a_ins_premium = #read_ins_calc.Refinance#>
</cfif>
</CFIF>
<cfelseif arguments.transaction_type eq "Purchase">
<CFSET a_ins_premium = #read_ins_calc.sale#>
<cfelseif arguments.transaction_type contains "Second Mortgage">
<CFSET a_ins_premium = #read_ins_calc.second_mortgage#>
</cfif>			
<!--- 1. Purchases and seconds hsould be charged basic rate 2. Refinances should be charged "re-issue" rate which is 90% of basic, unless loan last loan was done within last 4 yrs. Discount is given for loan less than 2 yrs (charge 70% of re-issue), and loan between 2 and 4 yrs old (charge 80% of re-issue). As a result, we will need to add loan date info in box, just like in other states  --->

<cfif arguments.property_state eq 'PA' and arguments.transaction_type eq 'Refinance'>
<CFSET a_ins_premium = (#read_ins_calc.sale# * .90)>
<cfset NumYears = 0>
<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfcatch>
<cfset NumYears = 0>
</cfcatch>
</cftry>
<cfif NumYears GTE 2 and NumYears LTE 4>
<CFSET a_ins_premium = (#a_ins_premium# * .80)>
<cfelseif NumYears LT 2>
<CFSET a_ins_premium = (#a_ins_premium# * .70)>
</cfif>
</cfif>
<!--- Michigan Purchases --->
<CFIF #arguments.property_state# eq "MI" and arguments.transaction_type eq "Purchase">
<cfset set_amount1 = read_ins_calc.sale>
<cfset a_ins_premium = read_ins_calc.sale>
<CFSET   x_final  = #Round(arguments.loan_amount)#>
<cfif arguments.loan_amount gt 0>
<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
</CFQUERY>
<cfif arguments.company_id eq 3276 or  arguments.company_id eq 100>
<cfset set_amount2 = ((set_amount1 * .5) * .40)>
<cfelse>
<cfif underwriter_table eq 'rate_table_landam'>
<cfset set_amount2 = read_ins_calc.sale * .50>
<cfelse>
<cfset set_amount2 = read_ins_calc.refinance * .40>
</cfif>
</cfif>
<cfif underwriter_table eq 'rate_table_landam'>
<cfif set_amount2 LT 230>
<cfset set_amount2 = 230>
</cfif>
<cfelse>
<cfif set_amount2 LT 210>
<cfset set_amount2 = 210>
</cfif>
</cfif>
<cfset a_ins_premium = set_amount1 + set_amount2>
</cfif>
</cfif>
<!--- end Michgan Purchases --->


<CFQUERY datasource="#request.dsn#" NAME="check_streamline">
SELECT * FROM companies where (id = #arguments.company_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="is_shapiro">
SELECT * FROM companies where (id = 2368 or master_co_id = 2368) and (id <> 3568)
</CFQUERY>
<cfset all_shapiro = ValueList(is_shapiro.ID, ",")>

<CFIF #arguments.property_state# eq "VA" and arguments.transaction_type eq "Purchase">
<cfif arguments.company_ID eq 2368 or ListContains(all_shapiro, arguments.company_id, ",") or check_streamline.streamline_client eq 'True' or arguments.company_id eq 100>


<!--- Virginia Purchases --->
<cfset set_amount1 = read_ins_calc.sale - 100> 

<cfif NOT IsNumeric(arguments.loan_amount)>
<cfset arguments.loan_amount = 0>
</cfif>
<cfset a_ins_premium = read_ins_calc.sale>
<CFSET   x_final  = #Round(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
</CFQUERY>
<cfif arguments.loan_amount gt 0>
<cfset set_amount2 = read_ins_calc.refinance>
<cfset a_ins_premium = set_amount1 + set_amount2>
</cfif>
<cfelse>
<cfset a_ins_premium = read_ins_calc.sale>
<cfif arguments.loan_amount lte 0>
<cfset a_ins_premium = read_ins_calc.sale - 100>
</cfif>
</cfif>
<!--- end Virginia Purchases --->
<!--- if enhanced coverage is selected, need to figure out the -pre-enhanced coverage so we can subtract it later --->
<cfif arguments.enhanced_coverage eq 1 and get_table.table_to_use eq 'StateVirginiaStewartEnhanced'>
<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
SELECT * FROM StateVirginiaStewart WHERE a_to >= #arguments.purchase_price# order by a_to
</CFQUERY>
<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
<cfelseif arguments.enhanced_coverage eq 1 and get_table.table_to_use eq 'StateVirginiaFirstAmericanEnhanced'>
<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
SELECT * FROM StateVirginiaFirstAmerican WHERE a_to >= #arguments.purchase_price# order by a_to
</CFQUERY>
<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
</cfif>
</cfif>

<cfset new_ins_premium = 0>
<!--- Florida Refi but only for company ID 3910 --->
<cfif arguments.property_state eq 'FL' and arguments.transaction_type eq 'Refinance' and arguments.company_id eq 3910>
<cfset a_ins_premium = read_ins_calc.sale - 35>
<!--- the -35 part is because we have 35 dollars added to the "sale" transaction rate in the florida table --->
</cfif>
<!--- texas refi's and 2nds 1109--->
<CFIF arguments.property_state eq "TX" and (arguments.transaction_type eq "Refinance" or arguments.transaction_type contains "Second Mortgage" or arguments.transaction_type contains "Reverse Mortgage")>
<CFQUERY datasource="#request.dsn#" NAME="read_prev_ins_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #arguments.previous_loan_amount# order by a_to
</CFQUERY>
<cfset NumYears = 0>
<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfcatch>
<cfset NumYears = 0>
</cfcatch>
</cftry>
<cfswitch expression="#NumYears#">
<cfcase value="6">
<CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .15)>
</cfcase>
<cfcase value="5">
<CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .20)>
</cfcase>
<cfcase value="4">
<CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .25)>
</cfcase>
<cfcase value="3">
<CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .30)>
</cfcase>
<cfcase value="2">
<CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .35)>
</cfcase>
<cfcase value="1">
<CFSET a_ins_premium = #read_ins_calc.sale# - (#read_prev_ins_calc.sale# * .40)>
</cfcase>
<cfdefaultcase>
<CFSET a_ins_premium = #read_ins_calc.sale#>
</cfdefaultcase>
</cfswitch>
</cfif>
<cfif arguments.property_state neq 'MI' and arguments.property_state neq 'VA'>  
<!--- set what the insurance premium would have been, if not for the $35 charge we have built into the system for purchases --->
<cfif IsNumeric(a_ins_premium)>
<cfset pre_35_ins_premium = a_ins_premium - 35>  
<cfif a_ins_premium neq "" and a_ins_premium neq 0>
<!--- if this is a cash purchase (no loan amount), then we're not charging the extra $35 for the dual-policy which is already built into our fees--->
<cfif arguments.transaction_type eq 'Purchase' and arguments.loan_amount eq 0>
<cfset a_ins_premium = a_ins_premium - 35>
</cfif>
</cfif>
</cfif>   
</cfif>
<cfset NumYears = 0>
<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfcatch>
<cfset NumYears = 0>
</cfcatch>
</cftry>
<cfif IsNumeric(a_ins_premium)>
<cfif arguments.transaction_type eq "Purchase" AND (arguments.enhanced_coverage eq 1) and (a_ins_premium neq "" and a_ins_premium neq 0) and IsNumeric(a_ins_premium) and arguments.property_state neq 'MD' and arguments.property_state neq 'VA'>
<cfset a_ins_premium = (a_ins_premium + (a_ins_premium * .20))>
<cfset pre_enhanced_amount = a_ins_premium>
</cfif> 	
<!--- if refi, and not one of the excluded state, and this is NASB, or one of their children, AND the reissue checkbox was checked, reduce Title Ins by 40% --->
<cfset excluded_states = "CA,CO,ID,NJ,IL,AK,UT,SD,NM,WA,OR,WY,TX,OK">
<cfif (arguments.company_id eq 2878 or get_all_comp_info.master_co_id eq 2878) and not ListFind(excluded_states, arguments.property_state, ",") and arguments.transaction_type eq 'Refinance' and arguments.reissue_rates eq 1>
<cfset a_ins_premium = a_ins_premium - (a_ins_premium * .40)>
</cfif>
<!--- end if this is NASB, or one of their children, reduce Title Ins by 40% --->
<!--- now we'll see if this company is allowed Substitution Rates, and if so, figure them out --->
<cfset current_ins_premium = a_ins_premium>
<cfif get_all_comp_info.allow_subrates eq 1>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfif arguments.transaction_type eq 'Refinance' and arguments.same_lender eq 1 and NumYears LT 15>
<cfif arguments.property_state eq 'DC'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'AL'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'AZ'>
<cfset a_ins_premium = (a_ins_premium * .65)>
<cfelseif arguments.property_state eq 'CT'>
<cfif Numyears LTE 10>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelseif arguments.property_state eq 'DE'>
<cfif Numyears LTE 5>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelseif arguments.property_state eq 'GA'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'IL'>
<cfset a_ins_premium = (a_ins_premium * .70)>
<cfelseif arguments.property_state eq 'IN'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'KY'>
<cfif Numyears LTE 3>
<cfset a_ins_premium = (a_ins_premium * .30)>
<cfelseif Numyears LTE 4>
<cfset a_ins_premium = (a_ins_premium * .40)>
<cfelseif Numyears LTE 5>
<cfset a_ins_premium = (a_ins_premium * .50)>
<cfelseif Numyears LTE 6>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif Numyears LTE 7>
<cfset a_ins_premium = (a_ins_premium * .70)>
<cfelseif Numyears LTE 8>
<cfset a_ins_premium = (a_ins_premium * .80)>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>
<cfelseif arguments.property_state eq 'KS'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'LA'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'MA'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'ME'>
<cfif Numyears LTE 5>
<cfset a_ins_premium = (a_ins_premium * .80)>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>
<cfelseif arguments.property_state eq 'MD'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'MN'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'MO'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'MS'>
<cfif Numyears LTE 6>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif Numyears LTE 10>
<cfset a_ins_premium = (a_ins_premium * .80)>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>
<cfelseif arguments.property_state eq 'MO'>
<cfset a_ins_premium = (a_ins_premium * .75)>
<cfelseif arguments.property_state eq 'MT'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'NC'>
<cfif Numyears LTE 15>
<cfset a_ins_premium = (a_ins_premium * .50)>
</cfif>
<cfelseif arguments.property_state eq 'ND'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'NY'>
<cfset a_ins_premium = (a_ins_premium * .50)>
<cfelseif arguments.property_state eq 'NH'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'NE'>
<cfif Numyears LTE 3>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>
<cfelseif arguments.property_state eq 'NV'>
<cfset a_ins_premium = (a_ins_premium * .40)>
<cfelseif arguments.property_state eq 'OH'>
<cfif Numyears LTE 10>
<cfset a_ins_premium = (a_ins_premium * .70)>
</cfif>
<cfelseif arguments.property_state eq 'RI'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'SC'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'ME'>
<cfif Numyears LTE 5>
<cfset a_ins_premium = (a_ins_premium * .80)>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>
<cfelseif arguments.property_state eq 'TN'>
<cfif Numyears LTE 5>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelseif arguments.property_state eq 'VA'>
<cfif Numyears LTE 15>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelseif arguments.property_state eq 'VT'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'WV'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'WI'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>
</cfif>
</cfif>
<!--- end now we'll see if this company is allowed Substitution Rates, and if so, figure thenm out --->
<!--- if this is Chase, we need to take 70% off the current title ins premium, and record this new number for future use in the code (line 1101) --->
<cfif arguments.company_id eq 3343>
<cfif a_ins_premium lt 200>
<cfset a_ins_premium = 200>
</cfif>
<cfset chase_ti = a_ins_premium>
</cfif>
<!--- end --->
<!--- if this is Axcidion, they get a 40% discount, then use the resulting number to figure out 1101 --->
<cfif (arguments.company_id eq 3492 or arguments.company_id eq 5223)>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfset a_1101 = 1000 - 250 - a_ins_premium + 100>
<cfif a_1101 gt 0>
<cfset temp = AddQueryItem(1101, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
</cfif>
</cfif>
<!--- end --->
<!--- take this out if it doesn't solve the problem --->
<cfif (arguments.property_state eq 'MI' and arguments.transaction_type eq 'Refinance')>
<cfif underwriter_table eq 'rate_table_landam'>
<cfset a_ins_premium = read_ins_calc.sale * .6>
<cfelse>
<cfset a_ins_premium = read_ins_calc.sale / 2>
</cfif>
</cfif>

<!--- new code for Colorado Refinance --->
<cfif arguments.property_state eq 'CO' and arguments.transaction_type eq 'Refinance'>
<cfset NumYears = 0>
<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfcatch>
<cfset NumYears = 0>
</cfcatch>
</cftry>
<!--- get the purchase rate, and then we're going to figure out what percentage of the purchase rate to use, based on county and age of old loan...we fucking hate colorado --->
<cfset a_ins_premium = read_ins_calc.sale>
<cfif numYears LTE 3>
<cfset new_ins_premium = a_ins_premium * .5>
<cfelseif numYears LTE 6>
<cfset new_ins_premium = a_ins_premium * .65>
</cfif>
<cfif 
arguments.property_county eq 'Adams' or
arguments.property_county eq 'Arapahoe' or
arguments.property_county eq 'Broomfield' or
arguments.property_county eq 'Denver' or
arguments.property_county eq 'Douglas' or
arguments.property_county eq 'Elbert' or
arguments.property_county eq 'Jefferson'>
<cfif numYears LTE 3>
<cfset new_ins_premium = a_ins_premium * .5>
<cfelseif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .60>
<cfelseif numYears LTE 6>
<cfset new_ins_premium = a_ins_premium * .65>
</cfif>
<cfelseif 
arguments.property_county eq 'Alamosa' or
arguments.property_county eq 'Archuleta' or
arguments.property_county eq 'Conejos' or
arguments.property_county eq 'Costilla' or
arguments.property_county eq 'Hinsdale' or
arguments.property_county eq 'Mineral' or
arguments.property_county eq 'Rio Grande' or
arguments.property_county eq 'Saguache'>
<cfif numYears LTE 3>
<cfset new_ins_premium = a_ins_premium * .5>
<cfelseif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .60>
<cfelseif numYears LTE 6>
<cfset new_ins_premium = a_ins_premium * .65>

</cfif>
<cfelseif 
arguments.property_county eq 'Boulder' or
arguments.property_county eq 'Larimer' or
arguments.property_county eq 'Pueblo' or
arguments.property_county eq 'Weld'>
<cfif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .5>
</cfif>
<cfelseif 
arguments.property_county eq 'Custer' or
arguments.property_county eq 'Fremont'>
<cfif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .5>
</cfif>
<cfelseif 
arguments.property_county eq 'Eagle'>
<cfif numYears LTE 3>
<cfset new_ins_premium = a_ins_premium * .5>
<cfelseif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .65>
</cfif>
<cfelseif 
arguments.property_county eq 'El Paso'>
<cfif numYears LTE 10>
<cfset new_ins_premium = a_ins_premium * .5>
</cfif>
<cfelseif 
arguments.property_county eq 'Garfield'>
<cfif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .5>
</cfif>
<cfelseif 
arguments.property_county eq 'Grand'>
<cfif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .5>
<cfelseif numYears LTE 7>
<cfset new_ins_premium = a_ins_premium * .65>
</cfif>
<cfelseif 
arguments.property_county eq 'Huerfano'>
<cfif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .5>
</cfif>
<cfelseif 
arguments.property_county eq 'Jackson'>
<cfif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .5>
</cfif>
<cfelseif 
arguments.property_county eq 'La Plata'>
<cfif numYears LTE 3>
<cfset new_ins_premium = a_ins_premium * .5>
<cfelseif numYears LTE 4>
<cfset new_ins_premium = a_ins_premium * .60>
<cfelseif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .75>
</cfif>
<cfelseif 
arguments.property_county eq 'Mesa'>
<cfif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .5>
</cfif>
<cfelseif 
arguments.property_county eq 'Montrose'>
<cfif numYears LTE 3>
<cfset new_ins_premium = a_ins_premium * .5>
<cfelseif numYears LTE 4>
<cfset new_ins_premium = a_ins_premium * .60>
<cfelseif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .75>
</cfif>
<cfelseif 
arguments.property_county eq 'Pitkin'>
<cfif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .5>
</cfif>
<cfelseif 
arguments.property_county eq 'Summit'>
<cfif numYears LTE 5>
<cfset new_ins_premium = a_ins_premium * .5>
</cfif>
<cfset a_ins_premium = new_ins_premium>
</cfif>
</cfif>
<!--- end new code for Colorado Refinance --->




<!--- NY Refinance --->
<cfif arguments.property_state eq 'NY' and arguments.transaction_type eq 'Refinance'>
	<cfset NumYears = 0>
	<cftry>
	<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
	<cfcatch>
	<cfset NumYears = 0>
	</cfcatch>
	</cftry>
	<cfif NumYears LTE 10>
		<cfif arguments.loan_amount gte 250000>
		<CFSET a_ins_premium = (#a_ins_premium# * .70)>
		<cfelse>
		<CFSET a_ins_premium = (#a_ins_premium# * .50)>
		</cfif>
	<cfelse>
	<CFSET a_ins_premium = #a_ins_premium#>
	</cfif>
</cfif>
<!--- end NY Refi --->



<!--- NJ Refinance --->
<cfif arguments.property_state eq 'NJ' and arguments.transaction_type eq 'Refinance'>
<cfif arguments.same_lender eq 1>
<cfif arguments.previous_loan_amount gt 0 and arguments.previous_loan_amount lt arguments.loan_amount>
<cfset new_money = arguments.loan_amount - arguments.previous_loan_amount>
<CFQUERY datasource="#request.dsn#" NAME="new_money_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #new_money# order by a_to
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="orig_money_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #arguments.previous_loan_amount# order by a_to
</CFQUERY>
<cfset a_ins_premium = new_money_calc.sale + orig_money_calc.refinance>
</cfif>
</cfif>
</cfif>
<!--- end NJ Refi --->

<!--- MD Purchases with enhanced Coverage, need to find out the pre-enhanced amount so we can substract it later if needed --->
<cfif arguments.enhanced_coverage eq 1 and get_table.table_to_use eq 'StateMarylandStewartEnhanced'>
<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
SELECT * FROM StateMarylandStewart WHERE a_to >= #arguments.purchase_price# order by a_to
</CFQUERY>
<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>


<cfelseif arguments.enhanced_coverage eq 1 and get_table.table_to_use eq 'FirstAmericanEnhanced'>
<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
SELECT * FROM StateMarylandFirstAmerican WHERE a_to >= #arguments.purchase_price# order by a_to
</CFQUERY>
<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
</cfif>




<!--- take this out if it doesn't solve the problem --->
<cfif (arguments.property_state eq 'MI' and arguments.transaction_type eq 'Purchase' and arguments.company_id neq 3276 and arguments.company_id neq 3943 and arguments.company_id neq 4043 and arguments.company_id neq 4042) or (arguments.property_state eq 'VA' and arguments.transaction_type eq 'Purchase' and check_streamline.streamline_client eq 'True' and arguments.company_id neq 3276 and arguments.company_id neq 3943 and arguments.company_id neq 4043 and arguments.company_id neq 4042 and (arguments.company_id eq 2368 or arguments.company_id eq 100 or ListContains(all_shapiro, arguments.company_id, ",")))>
<cfif arguments.seller_paid_owner_policy eq 1>
<cfif IsDefined("set_amount1") and set_amount1 neq 0>
<cfif arguments.enhanced_coverage eq 1>
<cfset buyers_portion_owner_policy = set_amount1 - pre_enhanced_amount>
<cfset set_amount1 = pre_enhanced_amount>
</cfif>

<cfset temp = AddQueryItem(1109, "Title Insurance Premium - Owner's Policy", NumberFormat(set_amount1, '_____.__'), "Seller")>
</cfif>
<cfelse>
<cfif IsDefined("set_amount1") and set_amount1 neq 0>
<cfset temp = AddQueryItem(1109, "Title Insurance Premium - Owner's Policy", NumberFormat(set_amount1, '_____.__'), "Buyer")>
</cfif>
</cfif>
<cfif arguments.seller_paid_lender_policy eq 1>
<cfif IsDefined("set_amount2") and set_amount2 neq 0>
<cfset temp = AddQueryItem(1109, "Title Insurance Premium - Lender's Policy", NumberFormat(set_amount2, '_____.__'), "Seller")>
</cfif>
<cfelse>
<cfif IsDefined("set_amount2") and set_amount2 neq 0>
<cfif arguments.enhanced_coverage eq 1 and arguments.seller_paid_owner_policy eq 1>
<cfset lenders_amount = set_amount2>
<cfset set_amount2 = set_amount2 + buyers_portion_owner_policy>
<cfset temp = AddQueryItem(1109, "Title Insurance Premium - Lender's ($#NumberFormat(lenders_amount, '_____.__')#)/Owner's ($#NumberFormat(buyers_portion_owner_policy, '_____.__')#) Policy", NumberFormat(set_amount2, '_____.__'), "Buyer")>
<cfelse>
<cfset temp = AddQueryItem(1109, "Title Insurance Premium - Lender's Policy", NumberFormat(set_amount2, '_____.__'), "Buyer")>
</cfif>
</cfif>
</cfif>
<cfelse>
<cfif arguments.property_state eq 'MD' and arguments.company_id neq 3276 and arguments.company_id neq 3943 and arguments.company_id neq 4043 and arguments.company_id neq 4042 and (arguments.company_id eq 2368 or arguments.company_id eq 100 or ListContains(all_shapiro, arguments.company_id, ",")) or check_streamline.streamline_client eq 'True'>
   <cfif arguments.seller_paid_owner_policy eq 'True' and arguments.seller_paid_lender_policy eq 'True'>
   <cfset temp = AddQueryItem(1109, "Title Insurance Premium", NumberFormat(a_ins_premium, '_____.__'), "Seller")>
   <cfelseif arguments.seller_paid_owner_policy eq 'True'>
   <cfset temp = AddQueryItem(1109, "Title Insurance Premium", NumberFormat(a_ins_premium-simul_rate, '_____.__'), "Seller")>
   <cfset temp = AddQueryItem(1109, "Title Insurance Premium", NumberFormat(simul_rate, '_____.__'), "Buyer")>
   <cfelseif arguments.seller_paid_lender_policy eq 'True'>
   <cfset temp = AddQueryItem(1109, "Title Insurance Premium", NumberFormat(a_ins_premium-simul_rate, '_____.__'), "Buyer")>
   <cfset temp = AddQueryItem(1109, "Title Insurance Premium", NumberFormat(simul_rate, '_____.__'), "Seller")>
   <cfelse>
   <cfset temp = AddQueryItem(1109, "Title Insurance Premium", NumberFormat(a_ins_premium, '_____.__'), "Buyer")>
   </cfif>
<cfelse>
<cfset temp = AddQueryItem(1109, "Title Insurance Premium", NumberFormat(a_ins_premium, '_____.__'), "Buyer")>

</cfif></cfif>
<cfelse>
<cfif a_ins_premium neq 0 and trim(a_ins_premium) neq ''>
<cfif current_ins_premium NEQ "" and current_ins_premium LT a_ins_premium>
<cfset a_ins_premium = current_ins_premium>
</cfif>
<cfset temp = AddQueryItem(1109, "Title Insurance Premium", a_ins_premium, "Buyer")>
</cfif>
</cfif>
</cfif>
<!--- is this an ROA Hutton file, even though it's a refi, needs to record Title Insurance as if it's a purchase, so we've already temporarily made this a purchase, and figured out TI, so now lets change it back to a refi --->			
<cfif arguments.company_id eq 3276 or arguments.company_id eq 3943 or arguments.company_id eq 4043 or arguments.company_id eq 4042>
<cfset arguments.transaction_type = "Refinance">
</cfif>

<cfif arguments.company_id eq 3276 or arguments.company_id eq 3943 or arguments.company_id eq 4043 or arguments.company_id eq 4042>
<cfif arguments.loan_amount gt 0>
<cfset temp = AddQueryItem(1108, "(#DollarFormat(arguments.loan_amount)#)", set_amount2, "Buyer")>
</cfif>
<cfset temp = AddQueryItem(1110, "(#DollarFormat(arguments.purchase_price)#)", set_amount1, "Buyer")>
</cfif>
</cfif>
			
<cfset temp = #Get800Series(arguments.asset_manager,arguments.company_id,arguments.property_state,arguments.transaction_type)#>


<cfif arguments.loan_amount lt 250000>
<cfset bulk_rate = 850>
<cfelseif arguments.loan_amount lt 500000>
<cfset bulk_rate = 925>
<cfelseif arguments.loan_amount lt 750000>
<cfset bulk_rate = 975>
<cfelseif arguments.loan_amount lt 1000000>
<cfset bulk_rate = 1025>
<cfelseif arguments.loan_amount lt 1250000>
<cfset bulk_rate = 1136>
<cfelseif arguments.loan_amount lt 1500000>
<cfset bulk_rate = 1225>
</cfif>
<!--- get 1101 fee --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>
<!--- ok here we're gonna tell it to do nothing if the company is Axcidion and loan amount is under 500k, we'll calculate 1101 after we have the title insurance number --->
<cfif (arguments.company_id eq 3492 or arguments.company_id eq 5223) and arguments.loan_amount LT 500000>
<!--- do nothing --->
<cfelseif #read_this_sets_billing_values.a_1101# neq "" OR #arguments.property_state# EQ "OR" OR #arguments.property_state# EQ "NV">
<cfif #arguments.property_state# EQ "OR" OR #arguments.property_state# EQ "NV" and #arguments.company_id# eq 729>
<cfif #read_ins_calc.escrow# EQ "">		
<cfset a_1101 = 0>
<cfelse>			
<cfset a_1101 = #read_ins_calc.escrow#>
<cfif arguments.company_id neq 3343>
<cfset temp = AddQueryItem(1101, "Settlement or Closing Fee", NumberFormat(read_ins_calc.escrow, '_____.__'), "Buyer")>
</cfif>
</CFIF>
<CFELSE>
<cfset a_1101 = #read_this_sets_billing_values.a_1101#>
<cfif arguments.company_id eq 3276 and arguments.loan_amount GT 0>
<cfset a_1101 = a_1101 - 100>
</cfif>
<cfif arguments.company_id neq 3343>
<cfset temp = AddQueryItem(1101, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
</cfif>
</CFIF>
</cfif>		
<cfelseif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1101b# neq "" OR #arguments.property_state# EQ "OR" OR #arguments.property_state# EQ "NV">
<cfif #arguments.property_state# EQ "OR" OR #arguments.property_state# EQ "NV" and #arguments.company_id# eq 729>
<cfif #read_ins_calc.escrow# EQ "">
<cfset a_1101b = 0>
<cfelse>
<cfset a_1101b = #read_ins_calc.escrow#>
<cfif arguments.company_id neq 3343>
<cfset temp = AddQueryItem(1101, "Settlement or Closing Fee", NumberFormat(read_ins_calc.escrow, '_____.__'), "Buyer")>
</cfif>
</CFIF>
<CFELSE>
<cfset a_1101b = #read_this_sets_billing_values.a_1101b#>
<cfif arguments.company_id neq 3343>
<cfset temp = AddQueryItem(1101, "Settlement or Closing Fee", NumberFormat(read_this_sets_billing_values.a_1101b, '_____.__'), "Buyer")>		
</cfif>	
</CFIF>
<cfelse>
<cfset a_1101b = 0>
</cfif>
<cfelseif #arguments.transaction_type# contains "Second Mortgage">
<cfif #read_this_sets_billing_values.a_1101c# neq "" or #arguments.property_state# EQ "OR" OR #arguments.property_state# EQ "NV">
<cfif #arguments.property_state# EQ "OR" OR #arguments.property_state# EQ "NV" and #arguments.company_id# eq 729>
<cfif #read_ins_calc.escrow# EQ "">
<cfset a_1101c = 0>
<cfelse>
<cfset a_1101c = #read_ins_calc.escrow#>
<cfif arguments.company_id neq 3343>
<cfset temp = AddQueryItem(1101, "Settlement or Closing Fee", NumberFormat(read_ins_calc.escrow, '_____.__'), "Buyer")>
</cfif>
</cfif>
<CFELSE>
<cfset a_1101c = #read_this_sets_billing_values.a_1101c#>		
<cfif arguments.company_id neq 3343>
<cfset temp = AddQueryItem(1101, "Settlement or Closing Fee", NumberFormat(read_this_sets_billing_values.a_1101c, '_____.__'), "Buyer")>
</cfif>
</CFIF>
<cfelse>
<cfset a_1101c = 0>
</cfif>
</cfif>
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1101f# neq "">
<cfif arguments.company_id neq 3343>
<cfset temp = AddQueryItem(1101, "Settlement or Closing Fee", NumberFormat(read_this_sets_billing_values.a_1101f, '_____.__'), "Seller")>
</cfif>
</cfif>
</cfif>
<!--- 1102 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>	
<cfif (arguments.company_id eq 3492 or arguments.company_id eq 5223) and arguments.loan_amount LT 500000>
<cfset a_1102 = 125>
<cfset temp = AddQueryItem(1102, "Abstract or Title Search", NumberFormat(125, '_____.__'), "Buyer")>
<cfelseif #read_this_sets_billing_values.a_1102# neq "">
<cfset a_1102 = #read_this_sets_billing_values.a_1102#>
<cfset temp = AddQueryItem(1102, "Abstract or Title Search", NumberFormat(read_this_sets_billing_values.a_1102, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1102>
<cfelse>
<cfset a_1102 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1102b# neq "">
<cfset a_1102b = #read_this_sets_billing_values.a_1102b#>
<cfset temp = AddQueryItem(1102, "Abstract or Title Search", NumberFormat(read_this_sets_billing_values.a_1102b, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1102b>
<cfelse>
<cfset a_1102b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1102c# neq "">
<cfset a_1102c = #read_this_sets_billing_values.a_1102c#>
<cfset temp = AddQueryItem(1102, "Abstract or Title Search", NumberFormat(read_this_sets_billing_values.a_1102c, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1102c>
<cfelse>
<cfset a_1102c = 0>
</cfif>			
</cfif>
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1102f# neq "">
<cfset temp = AddQueryItem(1102, "Abstract or Title Search", NumberFormat(read_this_sets_billing_values.a_1102f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 1103 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>		
<cfif (arguments.company_id eq 3492 or arguments.company_id eq 5223) and arguments.loan_amount LT 500000>
<cfset a_1103 = 125>
<cfset temp = AddQueryItem(1103, "Title Examination", NumberFormat(125, '_____.__'), "Buyer")>
<cfelseif #read_this_sets_billing_values.a_1103# neq "">
<cfset a_1103 = #read_this_sets_billing_values.a_1103#>
<cfset temp = AddQueryItem(1103, "Title Examination", NumberFormat(read_this_sets_billing_values.a_1103, '_____.__'), "Buyer")>			
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1103>
<cfelse>
<cfset a_1103 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1103b# neq "">
<cfset a_1103b = #read_this_sets_billing_values.a_1103b#>
<cfset temp = AddQueryItem(1103, "Title Examination", NumberFormat(read_this_sets_billing_values.a_1103b, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1103b>
<cfelse>
<cfset a_1103b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1103c# neq "">
<cfset a_1103c = #read_this_sets_billing_values.a_1103c#>
<cfset temp = AddQueryItem(1103, "Title Examination", NumberFormat(read_this_sets_billing_values.a_1103c, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1103c>
<cfelse>
<cfset a_1103c = 0>
</cfif>
</cfif>	
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1103f# neq "">
<cfset temp = AddQueryItem(1103, "Title Examination", NumberFormat(read_this_sets_billing_values.a_1103f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 1104 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>			
<cfif #read_this_sets_billing_values.a_1104# neq "">
<cfset a_1104 = #read_this_sets_billing_values.a_1104#>
<cfset temp = AddQueryItem(1104, "Title Insurance Binder", NumberFormat(read_this_sets_billing_values.a_1104, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1104>
<cfelse>
<cfset a_1104 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">				
<cfif #read_this_sets_billing_values.a_1104b# neq "">
<cfset a_1104b = #read_this_sets_billing_values.a_1104b#>
<cfset temp = AddQueryItem(1104, "Title Insurance Binder", NumberFormat(read_this_sets_billing_values.a_1104b, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1104b>
<cfelse>
<cfset a_1104b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1104c# neq "">
<cfset a_1104c = #read_this_sets_billing_values.a_1104c#>
<cfset temp = AddQueryItem(1104, "Title Insurance Binder", NumberFormat(read_this_sets_billing_values.a_1104c, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1104c>
<cfelse>
<cfset a_1104c = 0>
</cfif>
</cfif>			
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1104f# neq "">
<cfset temp = AddQueryItem(1104, "Title Insurance Binder", NumberFormat(read_this_sets_billing_values.a_1104f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 1105 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>			
<cfif #read_this_sets_billing_values.a_1105# neq "">
<cfset a_1105 = #read_this_sets_billing_values.a_1105#>
<cfset temp = AddQueryItem(1105, "Document Preparation", NumberFormat(read_this_sets_billing_values.a_1105, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1105>
<cfelse>
<cfset a_1105 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1105b# neq "">
<cfset a_1105b = #read_this_sets_billing_values.a_1105b#>
<cfset temp = AddQueryItem(1105, "Document Preparation", NumberFormat(read_this_sets_billing_values.a_1105b, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1105b>
<cfelse>
<cfset a_1105b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1105c# neq "">
<cfset a_1105c = #read_this_sets_billing_values.a_1105c#>
<cfset temp = AddQueryItem(1105, "Document Preparation", NumberFormat(read_this_sets_billing_values.a_1105c, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1105c>
<cfelse>
<cfset a_1105c = 0>
</cfif>
</cfif>			
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1105f# neq "">
<cfset temp = AddQueryItem(1105, "Document Preparation", NumberFormat(read_this_sets_billing_values.a_1105f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 1106 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>		
<cfif #read_this_sets_billing_values.a_1106# neq "">
<cfset a_1106 = #read_this_sets_billing_values.a_1106#>
<cfset temp = AddQueryItem(1106, "Notary Fees", NumberFormat(read_this_sets_billing_values.a_1106, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1106>
<cfelse>
<cfset a_1106 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1106b# neq "">
<cfset a_1106b = #read_this_sets_billing_values.a_1106b#>
<cfset temp = AddQueryItem(1106, "Notary Fees", NumberFormat(read_this_sets_billing_values.a_1106b, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1106b>
<cfelse>
<cfset a_1106b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1106c# neq "">
<cfset a_1106c = #read_this_sets_billing_values.a_1106c#>
<cfset temp = AddQueryItem(1106, "Notary Fees", NumberFormat(read_this_sets_billing_values.a_1106c, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1106c>
<cfelse>
<cfset a_1106c = 0>
</cfif>			
</cfif>						
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1106f# neq "">
<cfset temp = AddQueryItem(1106, "Notary Fees", NumberFormat(read_this_sets_billing_values.a_1106f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 1107 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>
<cfif #read_this_sets_billing_values.a_1107# neq "">
<cfset a_1107 = #read_this_sets_billing_values.a_1107#>
<cfset temp = AddQueryItem(1107, "Attorney's Fees", NumberFormat(read_this_sets_billing_values.a_1107, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1107>
<cfelse>
<cfset a_1107 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1107b# neq "">
<cfset a_1107b = #read_this_sets_billing_values.a_1107b#>
<cfset temp = AddQueryItem(1107, "Attorney's Fees", NumberFormat(read_this_sets_billing_values.a_1107b, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1107b>
<cfelse>
<cfset a_1107b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1107c# neq "">
<cfset a_1107c = #read_this_sets_billing_values.a_1107c#>
<cfset temp = AddQueryItem(1107, "Attorney's Fees", NumberFormat(read_this_sets_billing_values.a_1107c, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1107c>
<cfelse>
<cfset a_1107c = 0>
</cfif>			
</cfif>						
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1107f# neq "">
<cfset temp = AddQueryItem(1107, "Attorney's Fees", NumberFormat(read_this_sets_billing_values.a_1107f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 1111 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>			
<cfif #read_this_sets_billing_values.a_1111# neq "">
<cfset a_1111 = #read_this_sets_billing_values.a_1111#>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.a_1111_text, NumberFormat(read_this_sets_billing_values.a_1111, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1111>
<cfelse>
<cfset a_1111 = 0>
</cfif>			
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1111b# neq "">
<cfset a_1111b = #read_this_sets_billing_values.a_1111b#>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.a_1111_textb, NumberFormat(read_this_sets_billing_values.a_1111b, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1111b>
<cfelse>
<cfset a_1111b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1111c# neq "">
<cfset a_1111c = #read_this_sets_billing_values.a_1111c#>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.a_1111_textc, NumberFormat(read_this_sets_billing_values.a_1111c, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1111c>
<cfelse>
<cfset a_1111c = 0>
</cfif>			
</cfif>		
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1111f# neq "">
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.a_1111_textf, NumberFormat(read_this_sets_billing_values.a_1111f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 1112 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>		
<cfif #read_this_sets_billing_values.a_1112# neq "">
<cfset a_1112 = #read_this_sets_billing_values.a_1112#>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.a_1112_text, NumberFormat(read_this_sets_billing_values.a_1112, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1112>
<cfelse>
<cfset a_1112 = 0>
</cfif>			
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1112b# neq "">
<cfset a_1112b = #read_this_sets_billing_values.a_1112b#>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.a_1112_textb, NumberFormat(read_this_sets_billing_values.a_1112b, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1112b>
<cfelse>
<cfset a_1112b = 0>
</cfif>						
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1112c# neq "">
<cfset a_1112c = #read_this_sets_billing_values.a_1112c#>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.a_1112_textc, NumberFormat(read_this_sets_billing_values.a_1112c, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1112c>
<cfelse>
<cfset a_1112c = 0>
</cfif>			
</cfif>			
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1112f# neq "">
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.a_1112_textf, NumberFormat(read_this_sets_billing_values.a_1112f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 1113 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>	
<cfif #read_this_sets_billing_values.a_1113# neq "">
<cfset a_1113 = #read_this_sets_billing_values.a_1113#>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.a_1113_text, NumberFormat(read_this_sets_billing_values.a_1113, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1113>
<cfelse>
<cfset a_1113 = 0>
</cfif>			
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1113b# neq "">
<cfset a_1113b = #read_this_sets_billing_values.a_1113b#>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.a_1113_textb, NumberFormat(read_this_sets_billing_values.a_1113b, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1113b>
<cfelse>
<cfset a_1113b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1113c# neq "">
<cfset a_1113c = #read_this_sets_billing_values.a_1113c#>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.a_1113_textc, NumberFormat(read_this_sets_billing_values.a_1113c, '_____.__'), "Buyer")>
<cfset bulk_rate = bulk_rate - read_this_sets_billing_values.a_1113c>
<cfelse>
<cfset a_1113c = 0>
</cfif>
</cfif>			
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1113f# neq "">
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.a_1113_textf, NumberFormat(read_this_sets_billing_values.a_1113f, '_____.__'), "Seller")>
</cfif>
</cfif>
<cfif arguments.company_id eq 3343>
<cfset bulk_rate = bulk_rate - chase_ti>
<cfset temp = AddQueryItem(1101, "Settlement or Closing Fee", NumberFormat(bulk_rate, '_____.__'), "Buyer")>
</cfif>
<!--- 1205 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>			
<cfif #read_this_sets_billing_values.a_1205# neq "">
<cfset a_1205 = #read_this_sets_billing_values.a_1205#>
<cfset temp = AddQueryItem(1205, read_this_sets_billing_values.a_1205_text, NumberFormat(read_this_sets_billing_values.a_1205, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1205 = 0>
</cfif>			
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1205b# neq "">
<cfset a_1205b = #read_this_sets_billing_values.a_1205b#>
<cfset temp = AddQueryItem(1205, read_this_sets_billing_values.a_1205_textb, NumberFormat(read_this_sets_billing_values.a_1205b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1205b = 0>
</cfif>						
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1205c# neq "">
<cfset a_1205c = #read_this_sets_billing_values.a_1205c#>
<cfset temp = AddQueryItem(1205, read_this_sets_billing_values.a_1205_textc, NumberFormat(read_this_sets_billing_values.a_1205c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1205c = 0>
</cfif>			
</cfif>				
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1205f# neq "">
<cfset temp = AddQueryItem(1205, read_this_sets_billing_values.a_1205_textf, NumberFormat(read_this_sets_billing_values.a_1205f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 1303 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>			
<cfif #read_this_sets_billing_values.a_1303# neq "">
<cfset a_1303 = #read_this_sets_billing_values.a_1303#>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.a_1303_text, NumberFormat(read_this_sets_billing_values.a_1303, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1303 = 0>
</cfif>			
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1303b# neq "">
<cfset a_1303b = #read_this_sets_billing_values.a_1303b#>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.a_1303_textb, NumberFormat(read_this_sets_billing_values.a_1303b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1303b = 0>
</cfif>						
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1303c# neq "">
<cfset a_1303c = #read_this_sets_billing_values.a_1303c#>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.a_1303_textc, NumberFormat(read_this_sets_billing_values.a_1303c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1303c = 0>
</cfif>			
</cfif>			
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1303f# neq "">
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.a_1303_textf, NumberFormat(read_this_sets_billing_values.a_1303f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 1304 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>			
<cfif #read_this_sets_billing_values.a_1304# neq "">
<cfset a_1304 = #read_this_sets_billing_values.a_1304#>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.a_1304_text, NumberFormat(read_this_sets_billing_values.a_1304, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1304 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1304b# neq "">
<cfset a_1304b = #read_this_sets_billing_values.a_1304b#>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.a_1304_textb, NumberFormat(read_this_sets_billing_values.a_1304b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1304b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1304c# neq "">
<cfset a_1304c = #read_this_sets_billing_values.a_1304c#>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.a_1304_textc, NumberFormat(read_this_sets_billing_values.a_1304c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1304c = 0>
</cfif>			
</cfif>			
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1304f# neq "">
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.a_1304_textf, NumberFormat(read_this_sets_billing_values.a_1304f, '_____.__'), "Seller")>
</cfif>
</cfif>
<!--- 1305 --->
<cfif (#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage")>			
<cfif #read_this_sets_billing_values.a_1305# neq "">
<cfset a_1305 = #read_this_sets_billing_values.a_1305#>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.a_1305_text, NumberFormat(read_this_sets_billing_values.a_1305, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1305 = 0>
</cfif>
<cfelseif #arguments.transaction_type# eq "Purchase">			
<cfif #read_this_sets_billing_values.a_1305b# neq "">
<cfset a_1305b = #read_this_sets_billing_values.a_1305b#>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.a_1305_textb, NumberFormat(read_this_sets_billing_values.a_1305b, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1305b = 0>
</cfif>			
<cfelseif #arguments.transaction_type# contains "Second Mortgage">			
<cfif #read_this_sets_billing_values.a_1305c# neq "">
<cfset a_1305c = #read_this_sets_billing_values.a_1305c#>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.a_1305_textc, NumberFormat(read_this_sets_billing_values.a_1305c, '_____.__'), "Buyer")>
<cfelse>
<cfset a_1305c = 0>
</cfif>			
</cfif>			
<!--- if this is a purchase, and there are fees set up for the "Seller" columns in the client's line costs, add them here --->
<cfif #arguments.transaction_type# eq "Purchase">
<cfif #read_this_sets_billing_values.a_1305f# neq "">
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.a_1305_textf, NumberFormat(read_this_sets_billing_values.a_1305f, '_____.__'), "Seller")>
</cfif>
</cfif>


<!--- 1204 Intangible Tax --->
<CFIF #read_rec_fees.intangible_tax# neq 0 and isnumeric(read_rec_fees.intangible_tax)>
<cfparam name="arguments.loan_amount" default=0>
<cfparam name="read_rec_fees.intangible_tax" default=0>
<cfif arguments.transaction_type eq 'Reverse Mortgage'>
<CFSET intang_tax = #round(arguments.loan_amount * 1.5)# * #read_rec_fees.intangible_tax#>
<cfelse>
	<cftry>
	<CFSET intang_tax = #round(arguments.loan_amount)# * #read_rec_fees.intangible_tax#>
	<cfcatch type="any">
	<CFSET intang_tax = 0>
	</cfcatch>
	</cftry>
</cfif>
<cfset temp = AddQueryItem(1204, "Intangible Tax", NumberFormat(intang_tax, '_____.__'), "Buyer")>
</cfif>
<cfif arguments.property_state eq "VA" and arguments.transaction_type eq 'Purchase'>
<cfset Grantor_Tax = .001 * arguments.purchase_price>
<cfif arguments.property_city eq 'Alexandria' or arguments.property_county eq 'Fairfax' or arguments.property_county eq 'Loudoun' or arguments.property_county eq 'Prince William' or  arguments.property_county eq 'Arlington' >
<cfif IsNumeric(arguments.loan_amount) and arguments.loan_amount gt 0>
<cfset Grantor_Tax = Grantor_tax + (.004 * arguments.loan_amount)>
</cfif>
</cfif>
	<cfif arguments.asset_manager neq 2368 and arguments.asset_manager neq 3568>
	<cfset temp = AddQueryItem(1204, "Grantor Tax", NumberFormat(grantor_tax, '_____.__'), "Seller")>
	</cfif>
</cfif>
<cfparam name="a_ins_premium" default="0">
<!--- 1300 Series ALTA --->
<cfif arguments.property_state EQ "AZ">
<cfif arguments.property_county eq 'Santa Cruz' or arguments.property_county eq 'Coconino'>
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(75, '_____.__'), "Buyer")>
<cfelseif arguments.property_county neq 'Yavapai'>
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(100, '_____.__'), "Buyer")>
</cfif>                
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(100, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(100, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(100, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "CA">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(75, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<!--- none --->
<cfelseif arguments.property_state EQ "DE">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(50, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(50, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "FL">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<cfif (arguments.property_state eq "FL") and (a_ins_premium NEQ "Call for quote!") and (IsNumeric(a_ins_premium))>
<cfif arguments.transaction_type eq 'Purchase' and arguments.loan_amount eq 0>
<cfset alta9 =	 #pre_35_ins_premium#/10>
<cfelse>
<cfset alta9 =	 #a_ins_premium#/10>
</cfif>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(alta9, '_____.__'), "Buyer")>
</cfif>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(25, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "IL" and (arguments.company_id neq 4111 and arguments.company_id neq 4112 and arguments.company_id neq 4113 and arguments.company_id neq 4114 and arguments.company_id neq 4115 and arguments.company_id neq 4132 and arguments.company_id neq 4141)>
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(75, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(75, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "IA">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(75, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(75, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "LA">
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(80, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(80, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(80, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "ME">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(25, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "MS">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(35, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(35, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(35, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(35, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "MS">
<!---     <cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
--->    
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(20, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(20, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(20, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(25, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "NE">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(25, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "NV">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(25, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "NH">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(25, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "NJ">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(25, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "NY" and IsNumeric(a_ins_premium)>
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer")>
<cfset alta9 =	 #a_ins_premium#/10>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(alta9, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(25, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(25, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "PA" and IsNumeric(a_ins_premium)>
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(50, '_____.__'), "Buyer")>
<cfset alta9 =	 #a_ins_premium#/10>
<cfif alta9 lt 75>
<cfset alta9 = 75>
</cfif>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(alta9, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(50, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "TN" and IsNumeric(a_ins_premium)>
<!--- optional ALTAs --->
<cfset alta6 =	 #a_ins_premium#/10>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(alta6, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(alta6, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "OH">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(150, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(100, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(50, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(100, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(75, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(75, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "WV">
<cfset temp = AddQueryItem(1306, "Alta 8.1 Endorsement fee", NumberFormat(15, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(15, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 4", NumberFormat(15, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 4.1", NumberFormat(15, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5", NumberFormat(15, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 5.1", NumberFormat(15, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(15, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(15, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(15, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(15, '_____.__'), "Buyer")>
<cfelseif arguments.property_state EQ "WI">
<cfset temp = AddQueryItem(1307, "Alta 9 Endorsement fee", NumberFormat(50, '_____.__'), "Buyer")>
<!--- optional ALTAs --->
<cfset temp = AddQueryItem("", "ALTA 6", NumberFormat(60, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.1", NumberFormat(60, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 6.2", NumberFormat(60, '_____.__'), "Buyer")>
<cfset temp = AddQueryItem("", "ALTA 7", NumberFormat(60, '_____.__'), "Buyer")>
</cfif>
<!--- end ALTAS --->	 
<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>
<cfloop query="fee_detail">
<cfif IsNumeric(fee_detail.amount)>
<cfset temp = AddXMLItem(fee_detail.line_number, fee_detail.description, NumberFormat(fee_detail.amount, '_____.__'), fee_detail.payer, arguments.company_id)>
<cfelse>
<cfset temp = AddXMLItem(fee_detail.line_number, fee_detail.description, fee_detail.amount, fee_detail.payer, arguments.company_id)>
</cfif>
</cfloop>
<cfif arguments.return_data eq 2>
<cfset session.XMLOUT = ReturnXML>
</cfif>
<cfreturn fees_query>			
</cffunction>

</cfcomponent>
