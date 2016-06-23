<cfparam name="session.encompass" default="0">
<cfparam name="form.prop_type" default="">
<cfinclude template="new_calc_form.cfm">

<cfif form.fee_submit eq 'Calculate Fees' or form.place_order eq "Place Title Order">

<cfset form.previous_loan_amount = ReplaceNocase(form.previous_loan_amount, '$', '', 'ALL')>
<cfset form.previous_loan_amount = ReplaceNocase(form.previous_loan_amount, ',', '', 'ALL')>

<cfset form.loan_amount = ReplaceNocase(form.loan_amount, '$', '', 'ALL')>
<cfset form.loan_amount = ReplaceNocase(form.loan_amount, ',', '', 'ALL')>

<cfset form.purchase_price = ReplaceNocase(form.purchase_price, '$', '', 'ALL')>
<cfset form.purchase_price = ReplaceNocase(form.purchase_price, ',', '', 'ALL')>

<cfset form.previous_purch_amount = ReplaceNocase(form.previous_purch_amount, '$', '', 'ALL')>
<cfset form.previous_purch_amount = ReplaceNocase(form.previous_purch_amount, ',', '', 'ALL')>

<!--- new hud --->
<cfif not isDefined("calc_id")>
<cfinvoke	component = "cfc.fees2010"	method = "getFees"	returnVariable = "get_fee_query" company_id="#comp_id#" transaction_type="#form.transaction_type#" property_state="#form.property_state#" property_county="#form.property_county#" property_city="#form.property_city#" loan_amount="#form.loan_amount#" purchase_price="#form.purchase_price#" previous_loan_amount="#ReplaceNocase(form.previous_loan_amount, '$', '', 'ALL')#" previous_loan_year="#form.previous_loan_year#" previous_loan_month="#form.previous_loan_month#" previous_purch_amount="#ReplaceNocase(form.previous_purch_amount, '$', '', 'ALL')#" previous_purch_year="#form.previous_purch_year#" previous_purch_month="#form.previous_purch_month#" property_use_type="#form.property_use_type#" return_data="#form.return_data#" enhanced_coverage="#form.enhanced_coverage#" same_lender="#form.same_lender#" reissue_rates="#form.reissue_rates#" jlp_policy="#form.jlp_policy#"  seller_paid_lender_policy="#form.seller_paid_lender_policy#" seller_paid_owner_policy="#form.seller_paid_owner_policy#" asset_manager="#form.asset_manager#" opt_alta_4="#form.opt_alta_4#" opt_alta_4_1="#form.opt_alta_4_1#" opt_alta_5="#form.opt_alta_5#" opt_alta_5_1="#form.opt_alta_5_1#" opt_alta_6="#form.opt_alta_6#" opt_alta_6_1="#form.opt_alta_6_1#" opt_alta_6_2="#form.opt_alta_6_2#" opt_alta_7="#form.opt_alta_7#" opt_alta_8_1="#form.opt_alta_8_1#" opt_alta_9="#form.opt_alta_9#" opt_tx_1="#form.opt_tx_1#" opt_tx_2="#form.opt_tx_2#" opt_tx_3="#form.opt_tx_3#" opt_tx_4="#form.opt_tx_4#" opt_tx_5="#form.opt_tx_5#" opt_tx_6="#form.opt_tx_6#" opt_tx_7="#form.opt_tx_7#" opt_tx_8="#form.opt_tx_8#" opt_tx_9="#form.opt_tx_9#" opt_tx_10="#form.opt_tx_10#" opt_tx_11="#form.opt_tx_11#" opt_tx_12="#form.opt_tx_12#" opt_tx_13="#form.opt_tx_13#" opt_tx_14="#form.opt_tx_14#" opt_ut_4 = "#form.opt_ut_4#" opt_ut_41 = "#form.opt_ut_41#" opt_ut_5 = "#form.opt_ut_5#" opt_ut_51 = "#form.opt_ut_51#" opt_ut_6 = "#form.opt_ut_6#" opt_ut_61 = "#form.opt_ut_61#" opt_ut_62 = "#form.opt_ut_62#" opt_ut_81 = "#form.opt_ut_81#" opt_ut_9 = "#form.opt_ut_9#" opt_sd_comp = "#form.opt_sd_comp#" opt_sd_balloon = "#form.opt_sd_balloon#" opt_sd_credit = "#form.opt_sd_credit#" opt_sd_7 = "#form.opt_sd_7#" opt_sd_6 = "#form.opt_sd_6#" opt_sd_4 = "#form.opt_sd_4#" opt_sd_5 = "#form.opt_sd_5#" opt_sd_9 = "#form.opt_sd_9#" opt_sd_8 = "#form.opt_sd_8#" transfer_tax_paid_by="#form.transfer_tax_paid_by#" first_time_buyer="#form.first_time_buyer#" underwriter_choice="#form.underwriter_choice#" cema="#form.cema#" assessed_value="#form.assessed_value#" new_deed="#form.new_deed#" current_deed_num="#form.current_deed_num#" add_or_remove="#form.add_or_remove#" add_or_remove_num="#form.add_or_remove_num#" construction_draws="#form.construction_draws#" end_loan_original_loan_amount="#form.end_loan_original_loan_amount#" closing_type="#form.closing_type#" borrower_owns="#form.borrower_owns#" previous_purchase_mortgage="#form.previous_purchase_mortgage#" came_from="new_calc_form_display" prop_type="#form.prop_type#" mortgage_pages="#form.mortgage_pages#">




<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT * FROM companies WHERE id = '#session.comp_id#'
</CFQUERY>


<cfif (session.comp_id eq 9172 or session.comp_id eq 9244  or session.comp_id eq 11142) or (Mid(read_company.company,1,3) eq 'GMH' and read_company.company contains 'Construction') and (form.transaction_type eq 'Purchase' or form.transaction_type eq 'Refinance' or allow_construction_loans eq 1)>
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states_HUD2010 WHERE company_id = '#session.comp_id#' and a_states = '#form.property_state#'
and county = '#form.property_county#'
order by state_id desc
</CFQUERY>
<cfif read_this_sets_billing_states.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states_HUD2010 WHERE company_id = '#session.comp_id#' and a_states = '#form.property_state#'
order by state_id desc
</CFQUERY>
</cfif>

<cfif read_this_sets_billing_states.recordcount neq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
SELECT     *
FROM         Company_Billing_Values_HUD2010 AS h1 INNER JOIN
             Company_Billing_Values_B_HUD2010 AS h2 ON h1.Billing_ID = h2.Billing_ID
WHERE     (h1.Billing_ID = #read_this_sets_billing_states.billing_id#)
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  Company_Agency_Assoc_HUD2010
		WHERE billing_id = '#read_this_sets_billing_states.billing_id#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_itemized">
		SELECT * FROM
		ITEMIZED_1101_CHARGES
		WHERE billing_id = '#read_this_sets_billing_states.billing_id#'
		order by ID desc
</CFQUERY>
</cfif>




<!--- <cfset closing_amount = read_this_sets_billing_values.a_1102_amount_purchase + 95> --->
<cfparam name="get_fee_query" default="">
<cfset temp = QueryAddRow(get_fee_query)>
<cfset temp = QuerySetCell(get_fee_query, "Line_Number", 0)>
<cfset temp = QuerySetCell(get_fee_query, "Description", "Optional Detitling Fee")>
<cfset temp = QuerySetCell(get_fee_query, "Amount", 175)>
<cfset temp = QuerySetCell(get_fee_query, "Payer", "Buyer")>

<cfset temp = QueryAddRow(get_fee_query)>
<cfset temp = QuerySetCell(get_fee_query, "Line_Number", 0)>
<cfset temp = QuerySetCell(get_fee_query, "Description", "Optional 2XC Closing Service")>
<cfset temp = QuerySetCell(get_fee_query, "Amount", 280)>
<cfset temp = QuerySetCell(get_fee_query, "Payer", "Buyer")> 

<cfoutput query="get_fee_query">
<cfif get_fee_query.line_number eq 1101>
<cfset temp = QuerySetCell(get_fee_query, "Amount", (get_fee_query.amount + 175  + 280), get_fee_query.currentRow)>
</cfif>
</cfoutput>

</cfif>


<!--- <cfinvoke	component = "cfc.fees"	method = "getFees"	returnVariable = "get_fee_query" company_id="#comp_id#" transaction_type="#form.transaction_type#" property_state="#form.property_state#" property_county="#form.property_county#" property_city="#form.property_city#" loan_amount="#form.loan_amount#" purchase_price="#form.purchase_price#" previous_loan_amount="#ReplaceNocase(form.previous_loan_amount, '$', '', 'ALL')#" previous_loan_year="#form.previous_loan_year#" previous_loan_month="#form.previous_loan_month#" property_use_type="#form.property_use_type#" return_data="#form.return_data#" enhanced_coverage="#form.enhanced_coverage#" same_lender="#form.same_lender#" reissue_rates="#form.reissue_rates#" jlp_policy="#form.jlp_policy#"  seller_paid_lender_policy="#form.seller_paid_lender_policy#" seller_paid_owner_policy="#form.seller_paid_owner_policy#" asset_manager="#form.asset_manager#">
 --->


<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="read_quotes">
        SELECT *
        FROM saved_calcs
	where savedcalcid = #calc_id#
    </CFQUERY>
	<cfwddx action = "wddx2cfml" input = #read_quotes.feeQuery# output = "get_fee_query">
</cfif>



<cfquery dbtype="query" name="fee_detail"> 
	SELECT *
	FROM get_fee_query
	order by line_number
</cfquery>



<cfif form.return_data eq 1>
<center>
<!--- new hud --->
<cfif dont_show eq 1>
<cfoutput>
<table>
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
</table><br></cfoutput>
</cfif>

<!---<cfquery dbtype="query" name="get1101">
		select * from fee_detail
		where line_number = 1101
	</cfquery>
<cfif get1101.recordcount eq 0 or get1101.amount eq '' or get1101.amount eq 'NULL'>
<cfset total1101 = 0>
<cfelse>
<cfset total1101 = get1101.amount>
</cfif>    
<cfquery dbtype="query" name="get1104">
		select * from fee_detail
		where line_number = 1104
	</cfquery>
<cfif get1104.recordcount eq 0 or get1104.amount eq '' or get1104.amount eq 'NULL'>
<cfset total1104 = 0>
<cfelse>
<cfset total1104 = get1104.amount>
</cfif>    
<cfquery dbtype="query" name="get1102">
		select * from fee_detail
		where line_number = 1102
	</cfquery>
<cfif get1102.recordcount eq 0 or get1102.amount eq '' or get1102.amount eq 'NULL'>
<cfset total1102 = 0>
<cfelse>
<cfset total1102 = get1102.amount>
</cfif>    
<cfquery dbtype="query" name="get1109">
		select * from fee_detail
		where line_number = 1109
	</cfquery>
	
<cfif get1109.recordcount eq 0 or get1109.amount eq '' or get1109.amount eq 'NULL' or get1109.payer neq 'Buyer' or get1109.outside EQ 1>
<cfset total1109 = 0>
<cfelse>
<cfset total1109 = get1109.amount>
<cfset desc1109 = get1109.description>
</cfif>    
<cfquery dbtype="query" name="get1110">
		select * from fee_detail
		where line_number = 1110
	</cfquery>
<cfif get1110.recordcount eq 0 or get1110.amount eq '' or get1110.amount eq 'NULL' or get1110.payer neq 'Buyer' or get1110.outside EQ 1>
<cfset total1110 = 0>
<cfelse>
<cfset total1110 = get1110.amount>
<cfset desc1110 = get1110.description>
</cfif> 
<cfquery dbtype="query" name="get1103">
		select * from fee_detail
		where line_number = 1103
	</cfquery>
<cfif get1103.recordcount eq 0 or get1103.amount eq '' or get1103.amount eq 'NULL' or get1103.payer neq 'Buyer' or get1103.outside EQ 1>
<cfset total1103 = 0>
<cfelse>
<cfset total1103 = get1103.amount>
</cfif>    
<cfquery dbtype="query" name="get1201">
		select * from fee_detail
		where line_number = 1201
	</cfquery>
<cfif get1201.recordcount eq 0 or get1201.amount eq '' or get1201.amount eq 'NULL'>
<cfset total1201 = 0>
<cfelse>
<cfset total1201 = get1201.amount>
</cfif>    
<cfquery dbtype="query" name="get1203">
		select * from fee_detail
		where line_number = 1203
	</cfquery>
<cfif get1203.recordcount eq 0 or get1203.amount eq '' or get1203.amount eq 'NULL'>
<cfset total1203 = 0>
<cfelse>
<cfset total1203 = get1203.amount>
</cfif>  
<!---
EMB changing
<cfset final_total =  total1203 + total1201 + total1103 + total1109 + total1102 + total1104 + total1101 >
--->
<cfset final_total =  total1203 + total1201 + total1101 + total1103 + total1109 + total1110>

<table width="500" cellpadding="3" cellspacing="0" border=1 style="border-color:#000000; border-width:1px; border-style:inset;">
<tr>
<td align="center" valign="top" bgcolor="#CCCCFF" colspan="2">&nbsp;</td>
<td align="center" valign="top" bgcolor="#CCCCFF" >Fees Description</td>
<td align="center" valign="top" bgcolor="#CCCCFF" colspan="2">Fees Totals</td>
</tr>
<tr>
<td align="center" valign="top" bgcolor="#CCCCFF">Buyer</td>
<td align="center" valign="top" bgcolor="#CCCCFF">Seller</td>
<td align="center" valign="top" bgcolor="#CCCCFF" >&nbsp;</td>
<td align="center" valign="top" bgcolor="#CCCCFF">Buyer</td>
<td align="center" valign="top" bgcolor="#CCCCFF">Seller</td>
</tr>
<tr>
<td bgcolor="#d4d4d4">&nbsp</td>
<td bgcolor="#d4d4d4">&nbsp;</td>
<td bgcolor="#d4d4d4" align="center"><b>Total Title/Escrow Settlement Charges</b></td>
<td bgcolor="#d4d4d4">&nbsp;</td>
<td bgcolor="#d4d4d4">&nbsp;</td>
</tr>


<tr>
<td align="center">100%</td>
<td align="center">0%</td>
<td align="center">Title - Title services and lender's title insurance</td>
<td align="right"><cfoutput>#get1101.amount#</cfoutput></td>
<td>&nbsp;</td>
</tr>
<!---
<tr>
<td align="center">100%</td>
<td align="center">0%</td>
<td align="center">Title - Owner's title insurance</td>
<td align="center"><cfoutput>#get1103.amount#</cfoutput></td>
<td>&nbsp;</td>
</tr>
--->
<tr>
<td align="center">100%</td>
<td align="center">0%</td>
<td align="center">Title - Lender's title insurance</td>
<td align="right"><cfoutput>#get1104.amount#</cfoutput></td>
<td align="right">&nbsp;</td>
</tr>
<tr>
<td align="center">100%</td>
<td align="center">0%</td>
<td align="center">Title - Settlement or closing fee</td>
<td align="right"><cfoutput>#get1102.amount#</cfoutput></td>
<td align="right">&nbsp;</td>
</tr>
<cfif total1109 NEQ 0>
<tr>
<td align="center">100%</td>
<td align="center">0%</td>
<td align="center">Title - <cfoutput>#desc1109#</cfoutput></td>
<td align="right"><cfoutput>#get1109.amount#</cfoutput></td>
<td align="right">&nbsp;</td>
</tr>
</cfif>
<cfif total1110 NEQ 0>
<tr>
<td align="center">100%</td>
<td align="center">0%</td>
<td align="center">Title - <cfoutput>#desc1110#</cfoutput></td>
<td align="right"><cfoutput>#get1110.amount#</cfoutput></td>
<td align="right">&nbsp;</td>
</tr>
</cfif>
<tr>
<td bgcolor="#d4d4d4">&nbsp</td>
<td bgcolor="#d4d4d4">&nbsp;</td>
<td align="center" bgcolor="#d4d4d4"><b>Government Recording and Transfer Charges</b></td>
<td align="right" bgcolor="#d4d4d4">&nbsp;</td>
<td align="right" bgcolor="#d4d4d4">&nbsp;</td>
</tr>
<tr>
<td align="center">100%</td>
<td align="center">0%</td>
<td align="center">Government and recording charges</td>
<td align="right"><cfoutput>#get1201.amount#</cfoutput></td>
<td align="right">&nbsp;</td>
</tr>
<tr>
<td align="center">100%</td>
<td align="center">0%</td>
<td align="center">Transfer Taxes</td>
<td align="right"><cfoutput>#get1203.amount#</cfoutput></td>
<td align="right">&nbsp;</td>
</tr>
<tr>
<td bgcolor="#d4d4d4">&nbsp</td>
<td bgcolor="#d4d4d4">&nbsp;</td>
<td align="center" bgcolor="#d4d4d4"><b>Other Charges</b></td>
<td align="right" bgcolor="#d4d4d4">&nbsp;</td>
<td align="right" bgcolor="#d4d4d4">&nbsp;</td>
</tr>
<tr>
<td align="center">100%</td>
<td align="center">0%</td>
<td align="center">Title - Owner's Title Policy (Optional)</td>
<td align="right"><cfoutput>#get1103.amount#</cfoutput></td>
<td>&nbsp;</td>
</tr>
<tr>
<td bgcolor="#d4d4d4">&nbsp</td>
<td bgcolor="#d4d4d4">&nbsp;</td>
<td align="center" bgcolor="#d4d4d4"><b>Total Charges and Government Fees</b></td>
<td align="right" bgcolor="#d4d4d4"><cfoutput>#NumberFormat(final_total)#</cfoutput></td>
<td align="right" bgcolor="#d4d4d4">&nbsp;</td>
</tr>
</table>
<br><br>
--->


<table width="500" cellpadding="3" cellspacing="0" border=1 style="border-color:#000000; border-width:1px; border-style:inset;">
<tr>
<td align="left" valign="top" bgcolor="#CCCCFF">HUD Line #</td>
<td align="left" valign="top" bgcolor="#CCCCFF">Description</td>
<td align="left" valign="top" bgcolor="#CCCCFF">Itemized Roll-ups</td>
<td align="left" valign="top" bgcolor="#CCCCFF">Buyer</td>
<td align="right" valign="top" bgcolor="#CCCCFF">Seller</td>
<!--- <cfif session.comp_id eq 100>
<td align="right" valign="top" bgcolor="#CCCCFF">Outside Column</td>
</cfif>
 ---></tr>
<cfset seller_total = 0>
<cfset buyer_total = 0>
<cfset optionals = 0>
<cfset itemized_come_next = 0>
<cfoutput query="fee_detail">
<cfif fee_detail.line_number neq '' and fee_detail.line_number neq 0 and fee_detail.line_number neq 999>
<cfif IsNumeric(fee_detail.amount)>
<cfif fee_detail.payer eq 'Seller'>
<cfset seller_total = seller_total + fee_detail.amount>
<cfelseif fee_detail.payer eq 'Buyer' and fee_detail.outside neq 1>
<cfset buyer_total = buyer_total + fee_detail.amount>
</cfif>
</cfif>
<tr <cfif fee_detail.payer eq 'Seller'>bgcolor="##e9e9e9"<cfelse>bgcolor="##FFFFFF"</cfif>>
<td align="left" valign="top">#fee_detail.line_number#</td>

<td align="left" valign="top">#ReplaceNoCase(fee_detail.Description, "Owner's Policy", "<a href=""https://#cgi.server_name#/ti_help.cfm"" onclick=""javascript:void window.open('https://#cgi.server_name#/ti_help.cfm','1400168751950','width=400,height=400,toolbar=0,menubar=0,location=0,status=0,scrollbars=0,resizable=0,left=0,top=0');return false;""><font color='003366'>Owner's Policy</font></a>", "ALL")#</td>
<cfif (IsNumeric(ReplaceNoCase(fee_detail.amount, "- ", "", "ALL")) or fee_detail.amount eq 'Call for Quote!') and fee_detail.outside eq 1 and fee_detail.amount neq 0 and fee_detail.line_number neq 1105 and fee_detail.line_number neq 1106 and fee_detail.line_number neq 1107 and fee_detail.line_number neq 1108 and fee_detail.payer neq 'Seller'>
<td align="right" valign="top"><cfif fee_detail.amount contains "-">-</cfif><cfif fee_detail.amount neq 'Call for Quote!'>#NumberFormat(ReplaceNoCase(fee_detail.amount, "- ", "", "ALL"), "___,___,___.__")#<cfelse>Call for Quote!</cfif></td>
<cfelse>
<td align="right" valign="top">&nbsp;</td>
</cfif>
<cfif fee_detail.outside neq 1 and fee_detail.payer eq 'Buyer' and fee_detail.amount gt 0>
<td align="right" valign="top"><cfif IsNumeric(fee_detail.amount)>#NumberFormat(fee_detail.amount, "___,___,___.__")#<cfelse>#fee_detail.amount#</cfif></td>
<cfelse>
<td align="right" valign="top">&nbsp;</td>
</cfif>
<cfif IsNumeric(fee_detail.amount)  and fee_detail.payer eq 'Seller' and fee_detail.amount gt 0>
<td align="right" valign="top">#NumberFormat(fee_detail.amount, "___,___,___.__")#</td>
<cfelse>
<td align="right" valign="top">&nbsp;</td>
</cfif>
</tr>

<cfif fee_detail.line_number eq 1101>
<cfset itemized_come_next = 1>
</cfif>

<cfif itemized_come_next eq 1>
<cfset temp_query = fee_detail>
<cfloop query="temp_query">
<cfif temp_query.line_number eq 0>
<tr bgcolor="##FFFFFF">
<td align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">#temp_query.Description#</td>
<cfif (IsNumeric(ReplaceNoCase(temp_query.amount, "- ", "", "ALL")) or temp_query.amount eq 'Call for Quote!')>
<td align="right" valign="top"><cfif temp_query.amount contains "-">-</cfif><cfif temp_query.amount neq 'Call for Quote!'>#NumberFormat(ReplaceNoCase(temp_query.amount, "- ", "", "ALL"), "___,___,___.__")#<cfelse>Call for Quote!</cfif></td>
<cfelse>
<td align="right" valign="top">&nbsp;</td>
</cfif>
<td align="right" valign="top">&nbsp;</td>
<td align="right" valign="top">&nbsp;</td>
</tr>
</cfif>
</cfloop>
<cfset itemized_come_next = 0>
</cfif>


<cfelse>
<cfset optionals = 1>
</cfif>
</cfoutput>


<cfoutput>
<cfif buyer_total neq 0>
<tr>
<td align="right" valign="top" bgcolor="##CCCCFF" colspan="3">&nbsp;</td>
<td align="right" valign="top" bgcolor="##CCCCFF">#NumberFormat(buyer_total, "___,___,___.__")#</td>
</cfif>
<cfif seller_total neq 0>
<td align="right" valign="top" bgcolor="##CCCCFF">#NumberFormat(seller_total, "___,___,___.__")#</td>
</tr>
</cfif>
</cfoutput>
</table>

<br>
<table width="700" cellpadding="3" cellspacing="0" border=1 style="border-color:#000000; border-width:1px; border-style:inset;">
<tr>
<td align="center" valign="top" bgcolor="#FFFFFF" colspan="2"><font size=3>New GFE – Categorized Title and Closing Charges</font></td>
</tr>
<tr>
<td align="left" valign="bottom" bgcolor="#FFFFFF" width="80%"><strong>4. Title services and lender's title insurance</strong><BR>
This charge includes the services of a title or settlement agent, for example, and title insurance to protect the lender, if required.</td>
<td align="right" valign="bottom" bgcolor="#FFFFFF" width="20%">&nbsp;<cfoutput query="fee_detail">
<cfif fee_detail.line_number eq 1101 and fee_detail.payer eq 'Buyer'>#NumberFormat(fee_detail.Amount, '___,___,___.__')#</cfif></cfoutput></td>
</tr>
<tr>
<td align="left" valign="bottom" bgcolor="#FFFFFF"><strong>5. Owner's title insurance</STRONG><BR>
You may purchase an owner's title insurance policy to protect your interest in the property.</td>
<td align="right" valign="bottom" bgcolor="#FFFFFF">&nbsp;<cfoutput query="fee_detail">
<cfif fee_detail.line_number eq 1103 and fee_detail.payer eq 'Buyer'><cfif IsNumeric(fee_detail.Amount)>#NumberFormat(fee_detail.Amount, '___,___,___.__')#<cfelse>#fee_detail.Amount#</cfif></cfif></cfoutput></td>
</tr>
<tr>
<td align="left" valign="bottom" bgcolor="#FFFFFF"><strong>7. Government recording charges</strong><BR>
These charges are for state and local fees to record your loan and title documents. </td>
<td align="right" valign="bottom" bgcolor="#FFFFFF">&nbsp;<cfoutput query="fee_detail">
<cfif fee_detail.line_number eq 1201 and fee_detail.payer eq 'Buyer'>#NumberFormat(fee_detail.Amount, '___,___,___.__')#</cfif></cfoutput></td>
</tr>
<tr>
<td align="left" valign="bottom" bgcolor="#FFFFFF"<strong>8. Transfer taxes</strong><BR> 
These charges are for state and local fees on mortgages and home sales.</td>
<td align="right" valign="bottom" bgcolor="#FFFFFF">&nbsp;<cfoutput query="fee_detail">
<cfif fee_detail.line_number eq 1203 and fee_detail.payer eq 'Buyer'>#NumberFormat(ReplaceNoCase(fee_detail.Amount, ' ', '', 'ALL'), '___,___,___.__')#</cfif></cfoutput></td>
</tr>
</table>





<!---<cfif optionals eq 1>
<cfset optionals_buyer_total = 0>
<cfset optionals_seller_total = 0>
<br>

<table width="500" cellpadding="3" cellspacing="0" border=1 style="border-color:#000000; border-width:1px; border-style:inset;">
<tr>
<td align="center" valign="top" bgcolor="#FFFFFF" colspan="2">Line 1101 Non-Itemized Charges</td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#e9e9e9" width=400>Description</td>
<td align="right" valign="top" bgcolor="#e9e9e9" width=100>Amount</td>
</tr>
<cfoutput query="fee_detail">
<cfif fee_detail.line_number eq 0>
<cfif fee_detail.payer eq "Buyer">
<cfif IsNumeric("fee_detail.Amount")>
<cfset optionals_buyer_total = optionals_buyer_total + fee_detail.Amount>
</cfif>
<cfelse>
<cfset optionals_seller_total = optionals_seller_total + fee_detail.Amount>
</cfif>
<tr>
<td align="left" valign="top" bgcolor="##FFFFFF">#fee_detail.Description#</td>
<td align="right" valign="top" bgcolor="##FFFFFF"><cfif IsNumeric(#fee_detail.Amount#)>#NumberFormat(fee_detail.Amount, '___,___,___.__')#<cfelse>TBD</cfif></td>
</tr>
</cfif>
</cfoutput>
<cfoutput>
<cfif optionals_buyer_total>
<tr>
<td align="right" valign="top" bgcolor="##e9e9e9" colspan="3"> Total (Buyer):&nbsp;&nbsp;&nbsp;#NumberFormat(optionals_buyer_total, '___,___,___.__')#</td>
</tr>
</cfif>
<cfif optionals_seller_total>
<tr>
<td align="right" valign="top" bgcolor="##e9e9e9" colspan="3"> Total (Seller):&nbsp;&nbsp;&nbsp;#NumberFormat(optionals_seller_total, '___,___,___.__')#</td>
</tr>
</cfif>
</cfoutput>

</table>
</cfif>--->


</cfif></cfif>


























<!--- <table width="500" cellpadding="3" cellspacing="0" border=1 style="border-color:#000000; border-width:1px; border-style:inset;">
<tr>
<td align="left" valign="top" bgcolor="#CCCCFF">HUD Line #</td>
<td align="left" valign="top" bgcolor="#CCCCFF">Description</td>
<td align="left" valign="top" bgcolor="#CCCCFF">Buyer</td>
<td align="right" valign="top" bgcolor="#CCCCFF">Seller</td>
<!--- <cfif session.comp_id eq 100>
<td align="right" valign="top" bgcolor="#CCCCFF">Outside Column</td>
</cfif>
 ---></tr>
<cfset seller_total = 0>
<cfset buyer_total = 0>
<cfset optionals = 0>
<cfoutput query="fee_detail">
<cfif fee_detail.line_number neq ''>
<cfif IsNumeric(fee_detail.amount)>
<cfif fee_detail.payer eq 'Seller'>
<cfset seller_total = seller_total + fee_detail.amount>
<cfelseif fee_detail.payer eq 'Buyer'>
<cfset buyer_total = buyer_total + fee_detail.amount>
</cfif>
</cfif>
<tr <cfif fee_detail.payer eq 'Seller'>bgcolor="##e9e9e9"<cfelse>bgcolor="##FFFFFF"</cfif>>
<td align="left" valign="top">#fee_detail.line_number#</td>
<td align="left" valign="top">#fee_detail.Description#</td>
<cfif IsNumeric(fee_detail.amount) and fee_detail.payer eq 'Buyer'>
<td align="right" valign="top">#NumberFormat(fee_detail.amount, "___,___,___.__")#</td>
<cfelse>
<td align="right" valign="top">&nbsp;</td>
</cfif>
<cfif IsNumeric(fee_detail.amount) and fee_detail.payer eq 'Seller'>
<td align="right" valign="top">#NumberFormat(fee_detail.amount, "___,___,___.__")#</td>
<cfelse>
<td align="right" valign="top">&nbsp;</td>
</cfif>
</tr>
<cfelse>
<cfset optionals = 1>
</cfif>
</cfoutput>

<cfoutput>
<cfif buyer_total neq 0>
<tr>
<td align="right" valign="top" bgcolor="##CCCCFF" colspan="2">&nbsp;</td>
<td align="right" valign="top" bgcolor="##CCCCFF">#NumberFormat(buyer_total, "___,___,___.__")#</td>
</cfif>
<cfif seller_total neq 0>
<td align="right" valign="top" bgcolor="##CCCCFF">#NumberFormat(seller_total, "___,___,___.__")#</td>
</tr>
</cfif>
</cfoutput>
</table>

<cfif optionals eq 1>
<cfset optionals_buyer_total = 0>
<cfset optionals_seller_total = 0>
<br>

<table width="500" cellpadding="3" cellspacing="0" border=1 style="border-color:#000000; border-width:1px; border-style:inset;">
<tr>
<td align="center" valign="top" bgcolor="#FFFFFF" colspan="4">OPTIONAL ENDORSEMENTS FOR <cfoutput>#form.property_state#</cfoutput></td>
</tr>
<tr>
<td align="left" valign="top" bgcolor="#e9e9e9" colspan="2">Description</td>
<td align="left" valign="top" bgcolor="#e9e9e9">Paid By:</td>
<td align="right" valign="top" bgcolor="#e9e9e9">Amount</td>
</tr>
<cfoutput query="fee_detail">
<cfif fee_detail.line_number eq ''>
<cfif fee_detail.payer eq "Buyer">
<cfset optionals_buyer_total = optionals_buyer_total + fee_detail.Amount>
<cfelse>
<cfset optionals_seller_total = optionals_seller_total + fee_detail.Amount>
</cfif>
<tr>
<td align="left" valign="top" bgcolor="##FFFFFF" colspan="2">#fee_detail.Description#</td>
<td align="left" valign="top" bgcolor="##FFFFFF">#fee_detail.Payer#</td>
<td align="right" valign="top" bgcolor="##FFFFFF">#NumberFormat(fee_detail.Amount, '___,___,___.__')#</td>
</tr>
</cfif>
</cfoutput>
<cfoutput>
<cfif optionals_buyer_total>
<tr>
<td align="right" valign="top" bgcolor="##e9e9e9" colspan="4">Optional Endorsements Total (Buyer):&nbsp;&nbsp;&nbsp;#NumberFormat(optionals_buyer_total, '___,___,___.__')#</td>
</tr>
</cfif>
<cfif optionals_seller_total>
<tr>
<td align="right" valign="top" bgcolor="##e9e9e9" colspan="4">Optional Endorsements Total (Seller):&nbsp;&nbsp;&nbsp;#NumberFormat(optionals_seller_total, '___,___,___.__')#</td>
</tr>
</cfif>
</cfoutput>
</cfif>
</table>






</cfif>
</cfif>	
</center> --->









<center>
<span class="adtext"><br>
<cfif form.transaction_type eq "Purchase">
<font size=1 color=red>*Enhanced Title Insurance Policy is available to homeowners on purchase transactions different<br>
from the standard Owner's Policy, that includes coverage for items such as  Items<br>
occurring Pre and Post Policy, Restrictive Covenant Violations, Building Permit Violations,<br>
Subdivision Law Violations, Zoning Law Violations, Encroachment Protections,  Water and<br>
Mineral Rights Damage, Supplemental Tax Liens, Map/Location Inconsistencies, which coverage<br>
that continues even if they no longer have title.</font>
<BR>
<br>
</cfif>
The calculation above does not include any fees for municipal lien searches or estoppel letter<br> fees charged by HOA
or Condo Associations, as those fees vary by each individual property. <br>Please also note that the
fee calculator is an estimate of the fees and are subject to change.<br><br>
<cfoutput>This quote valid through #DateFormat(DateAdd("d", 60, Now()), "mm/dd/yyyy")# </cfoutput>
</span>
</center>

<!--- END NEW CALC STUFF --->