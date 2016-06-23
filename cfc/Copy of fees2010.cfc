<cfcomponent>

<cffunction name="getRecFees" output="true">
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
<cfargument name="previous_purch_year" default=1>
<cfargument name="previous_purch_month" default=1996>
<cfargument name="previous_purch_amount" default=0>
<cfargument name="enhanced_coverage" type="string" default="0">
<cfargument name="same_lender" type="string" default="0">
<cfargument name="reissue_rates" type="string" default="0">
<cfargument name="jlp_policy" type="string" default="0">
<cfargument name="property_report" type="string" default="0">
<cfargument name="appraised_value" type="string" default="0">
<cfargument name="seller_paid_lender_policy" type="string" default="0">
<cfargument name="seller_paid_owner_policy" type="string" default="0">
<cfargument name="buyer_paid_lender_policy" type="string" default="0">
<cfargument name="buyer_paid_owner_policy" type="string" default="0">
<cfargument name="asset_manager" type="string" default="">
<cfargument name="cema" type="string" default="0">
<cfargument name="transfer_tax_paid_by" type="string" default="">
<cfargument name="title_id"  default="">
<cfargument name="first_time_buyer"  default="0">
<cfargument name="encompass"  default="0">
<cfargument name="underwriter_choice"  default="0">
<cfargument name="delinquency"  default="0">
<cfargument name="insured"  default="">

<!--- get all recording fees for this state (and/or county) from our database --->
<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
SELECT * FROM recording_fees WHERE (state = '#arguments.property_state#' and county = '#arguments.property_county#' and city = '#arguments.property_city#')
<cfif arguments.property_state eq 'KY'>
or (state = '#arguments.property_state#' and (county = '' or county IS NULL) and city = '#arguments.property_city#')
</cfif>
</CFQUERY>
<cfif read_rec_fees.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
SELECT * FROM recording_fees WHERE state = '#arguments.property_state#' and county = '#arguments.property_county#' and (city = 'ALL' or city = '')
</CFQUERY>
</cfif>
<cfif read_rec_fees.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
SELECT * FROM recording_fees WHERE state = '#arguments.property_state#' and (county = 'ALL' or county = '')
</CFQUERY>
</cfif>


<!--- 1201 rec fee --->
<!--- 1201 Deed recording fee --->
<cfif arguments.transaction_type eq 'Reverse Mortgage'>
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", 1202)>
<cfset temp = QuerySetCell(fees_query, "Description", "Mortgage Recording Fee")>
<cfif arguments.property_state eq 'VA'>
<cfset temp = QuerySetCell(fees_query, "Amount", 92)>
<cfset roll_up_1201 = roll_up_1201 + 92>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Amount", read_rec_fees.mort_rec_fee * 2)>
<cfset roll_up_1201 = roll_up_1201 + (read_rec_fees.mort_rec_fee * 2)>
</cfif>
<cfset temp = QuerySetCell(fees_query, "Payer", "Buyer")>
<cfset temp = QuerySetCell(fees_query, "Outside", 1)>
<cfelse>

<CFIF (#read_rec_fees.mort_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# NEQ 0 and (arguments.loan_amount gt 0)) or ((arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702) and (arguments.insured neq 'cash' and arguments.insured neq 'deferred'))>
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", 1202)>
<cfset temp = QuerySetCell(fees_query, "Description", "Mortgage Recording Fee")>
<cfif arguments.company_id eq 3722 or  arguments.company_id eq 4752>
		<cfset temp = QuerySetCell(fees_query, "Amount", 120)>
		<cfset roll_up_1201 = roll_up_1201 + 120>
<cfelseif arguments.company_id eq 4702>
<cfset temp = QuerySetCell(fees_query, "Amount", 75)>
<cfset roll_up_1201 = roll_up_1201 + 75>
<cfelseif arguments.property_state eq 'NY' and arguments.cema eq 1>
<cfset temp = QuerySetCell(fees_query, "Amount", 400)>
<cfset roll_up_1201 = roll_up_1201 + 400>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Amount", read_rec_fees.mort_rec_fee)>
<cfset roll_up_1201 = roll_up_1201 + read_rec_fees.mort_rec_fee>
</cfif>
<cfset temp = QuerySetCell(fees_query, "Payer", "Buyer")>
<cfset temp = QuerySetCell(fees_query, "Outside", 1)>
</cfif>
</cfif>
<CFIF (arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702) or #read_rec_fees.deedrecfees# NEQ "" and #read_rec_fees.deedrecfees# NEQ 0 and (arguments.transaction_type eq 'Purchase' or arguments.company_id eq 3276)>
<Cfset deed_rec_fee = #read_rec_fees.deedrecfees#>
		<cfif arguments.company_id eq 3722 or  arguments.company_id eq 4752>
		<Cfset deed_rec_fee = 120>
		<cfelseif arguments.company_id eq 4702>
		<Cfset deed_rec_fee = 75>
		</cfif>
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", 1202)>
<cfset temp = QuerySetCell(fees_query, "Description", "Deed Recording Fee")>
<cfset temp = QuerySetCell(fees_query, "Amount", deed_rec_fee)>
<cfif arguments.company_id eq 3276 or  arguments.company_id eq 4680 or  arguments.company_id eq 3722 or  arguments.company_id eq 4752 or  arguments.company_id eq 4702 or arguments.asset_manager eq 3568 or arguments.asset_manager eq 2368 or arguments.property_state eq 'VA'>
<cfset temp = QuerySetCell(fees_query, "Payer", "Buyer")>
<cfset temp = QuerySetCell(fees_query, "Outside", 1)>
<cfset roll_up_1201 = roll_up_1201 + deed_rec_fee>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Payer", "Seller")>
<cfset temp = QuerySetCell(fees_query, "Outside", 0)>
</cfif>
</cfif>

<!--- <cfif arguments.company_id eq 3722 or arguments.company_id eq 4702>
		<cfif arguments.company_id eq 3722>
		<Cfset mort_rec_fee = 75>
		<cfelseif arguments.company_id eq 4702>
		<Cfset mort_rec_fee = 120>
		</cfif>

<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", 1202)>
<cfset temp = QuerySetCell(fees_query, "Description", "Mortgage Recording Fee")>
<cfset temp = QuerySetCell(fees_query, "Amount", 120)>
<cfset temp = QuerySetCell(fees_query, "Payer", "Buyer")>
<cfset temp = QuerySetCell(fees_query, "Outside", 1)>
<cfset roll_up_1201 = roll_up_1201 + mort_rec_fee>
</cfif>
 --->


<!--- NEW RECORDING FEES, STATE, CITY, COUNTY TRANSFER TAXES --->
<cfset total_city_county_transfer_tax_buyer = 0>
<cfset total_state_transfer_tax_buyer = 0>
<cfset total_city_county_transfer_tax_seller = 0>
<cfset total_state_transfer_tax_seller = 0>

<cfif arguments.property_state eq 'NJ'>

	<cfif arguments.purchase_price LTE 350000>
	
		<cfif arguments.purchase_price lte 150000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (arguments.purchase_price / 500) * 2>
		<cfelseif arguments.purchase_price lte 200000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 150000) / 500) * 3.35>
		<cfelse>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((50000) / 500) * 3.35>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 200000) / 500) * 3.9>
		</cfif>
	
	
	
	<cfelse>
	<!--- purchase price over 350000 --->
		<cfif arguments.purchase_price lte 150000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (arguments.purchase_price / 500) * 2.9>
		<cfelseif arguments.purchase_price lte 200000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2.9>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 150000) / 500) * 4.25>
		<cfelseif arguments.purchase_price lte 550000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2.9>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((50000) / 500) * 4.25>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 200000) / 500) * 4.80>
		<cfelseif arguments.purchase_price lte 850000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2.9>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((50000) / 500) * 4.25>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((350000) / 500) * 4.80>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 550000) / 500) * 5.30>
		<cfelseif arguments.purchase_price lte 1000000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2.9>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((50000) / 500) * 4.25>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((350000) / 500) * 4.80>

		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((300000) / 500) * 5.30>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 850000) / 500) * 5.80>
		<cfelse>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2.9>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((50000) / 500) * 4.25>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((350000) / 500) * 4.80>

		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((300000) / 500) * 5.30>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((150000) / 500) * 5.80>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 1000000) / 500) * 6.05>
		</cfif>
	
	</cfif>
	
	
<!--- Add Mansion Tax if purchase price is over 1,000,000 --->
<cfif arguments.purchase_price gt 1000000>
<cfset total_state_transfer_tax_buyer = total_state_transfer_tax_buyer + (arguments.purchase_price  * .01)>
</cfif>

<cfif total_state_transfer_tax_seller neq 0>
<cfset descr = "State tax/stamps: Deed">
<cfif arguments.asset_manager neq 2368 and  arguments.asset_manager neq 3568><!--- Fannie and  Freddie are exempt --->
<cfset temp = AddQueryItem(1205, descr, NumberFormat(total_state_transfer_tax_seller, '_____.__'), "Seller", 0)>
</cfif>
<!--- <cfset roll_up_1203 = roll_up_1203 + total_state_transfer_tax_buyer> --->
</cfif>


<cfelseif arguments.property_state eq 'DC' and arguments.purchase_price LT 400000>
<cfset state_money = arguments.purchase_price>
<cfset state_transfer_buyer = (state_money * .022) / 2>
<cfset state_transfer_seller = (state_money * .022) / 2>
<cfset descr = "State tax/stamps: Deed">
<cfif arguments.asset_manager neq 2368 and  arguments.asset_manager neq 3568><!--- Fannie and  Freddie are exempt --->
<cfset temp = AddQueryItem(1205, descr, NumberFormat(state_transfer_seller, '_____.__'), "Seller", 0)>
</cfif>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(state_transfer_buyer, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + state_transfer_buyer>




<cfelse>
<!--- ok, we're not in NJ, or CT and we're not (in DC and the purchase_price is less than 400,000), following code is for all other states --->
<cfparam name="read_rec_fees.state_Transfer_Tax" default=0>
<cfif Not IsNumeric(read_rec_fees.state_Transfer_Tax)>
<cfset read_rec_fees.state_Transfer_Tax = 0>
</cfif>
<cfparam name="read_rec_fees.county_Transfer_Tax" default=0>
<cfif Not IsNumeric(read_rec_fees.county_Transfer_Tax)>
<cfset read_rec_fees.county_Transfer_Tax = 0>
</cfif>
<cfparam name="read_rec_fees.city_Transfer_Tax" default=0>
<cfif Not IsNumeric(read_rec_fees.city_Transfer_Tax)>
<cfset read_rec_fees.city_Transfer_Tax = 0>
</cfif>
<cfset state_money = arguments.purchase_price>
<cfset county_money = arguments.purchase_price>
<cfset city_money = arguments.purchase_price>
<cfif Len(read_rec_fees.State_Transfer_Exempt)>
<cfset state_money = state_money - read_rec_fees.State_Transfer_Exempt>
</cfif>
<cfif Len(read_rec_fees.County_Transfer_Exempt)>
<cfset county_money = county_money - read_rec_fees.County_Transfer_Exempt>
<cfif county_money lte 0>
<cfset county_money = 0>
</cfif>

</cfif>
<cfif Len(read_rec_fees.City_Transfer_Exempt)>
<cfset city_money = city_money - read_rec_fees.City_Transfer_Exempt>
</cfif>

<cfset state_transfer_buyer = 0>
<cfset state_transfer_seller = 0>

<cfif IsNumeric(read_rec_fees.State_Transfer_Tax) and read_rec_fees.State_Transfer_Tax neq 'NULL'>

<cfif arguments.property_state eq 'CT'>
  <cfset state_money = arguments.purchase_price>
  <cfif arguments.purchase_price LTE 800000>
	<cfset state_transfer_seller = (state_money * read_rec_fees.state_Transfer_Tax)>
  <cfelse>
	<cfset state_transfer_seller = (800000 * read_rec_fees.state_Transfer_Tax)>
	<cfset state_transfer_seller = ((state_transfer_seller + (state_money-800000)) * read_rec_fees.state_Transfer_Tax)>
    </cfif>
	
<cfelse>

<cfif read_rec_fees.State_Transfer_Paidby eq 'seller'>
<cfset state_transfer_seller = state_money * read_rec_fees.State_Transfer_Tax>
<cfelseif read_rec_fees.State_Transfer_Paidby eq 'buyer'>
<cfset state_transfer_buyer = state_money * read_rec_fees.State_Transfer_Tax>
<cfelseif read_rec_fees.State_Transfer_Paidby eq 'split'>
<cfset state_transfer_buyer = state_money * read_rec_fees.State_Transfer_buyer_split>
<cfset state_transfer_seller = state_money * read_rec_fees.State_Transfer_seller_split>
</cfif>

</cfif>
</cfif>


<cfset county_transfer_buyer = 0>
<cfset county_transfer_seller = 0>

<cfif IsNumeric(read_rec_fees.county_Transfer_Tax) and read_rec_fees.county_Transfer_Tax neq 'NULL'>
<cfif read_rec_fees.county_Transfer_Paidby eq 'seller'>
<cfset county_transfer_seller = county_money * read_rec_fees.county_Transfer_Tax>
<cfelseif read_rec_fees.county_Transfer_Paidby eq 'buyer'>
<cfset county_transfer_buyer = county_money * read_rec_fees.county_Transfer_Tax>
<cfelseif read_rec_fees.county_Transfer_Paidby eq 'split'>
<cfset county_transfer_buyer = county_money * read_rec_fees.county_Transfer_buyer_split>
<cfset county_transfer_seller = county_money * read_rec_fees.county_Transfer_seller_split>
</cfif>
</cfif>


<cfset city_transfer_buyer = 0>
<cfset city_transfer_seller = 0>
<cfif IsNumeric(read_rec_fees.city_Transfer_Tax) and read_rec_fees.city_Transfer_Tax neq 'NULL'>
<cfif read_rec_fees.city_Transfer_Paidby eq 'seller'>
<cfif Len(read_rec_fees.city_Flat_Transfer_Tax)>
<cfset city_transfer_seller = read_rec_fees.city_Flat_Transfer_Tax>
<cfelse>
<cfset city_transfer_seller = city_money * read_rec_fees.city_Transfer_Tax>

</cfif>
<cfelseif read_rec_fees.city_Transfer_Paidby eq 'buyer'>
<cfif Len(read_rec_fees.city_Flat_Transfer_Tax)>
<cfset city_transfer_buyer = read_rec_fees.city_Flat_Transfer_Tax>
<cfelse>
<cfset city_transfer_buyer = city_money * read_rec_fees.city_Transfer_Tax>
</cfif>
<cfelseif read_rec_fees.city_Transfer_Paidby eq 'split'>
<cfif Len(read_rec_fees.city_Flat_Transfer_Tax)>
<cfset city_transfer_buyer = read_rec_fees.city_Flat_Transfer_Tax * read_rec_fees.city_Transfer_buyer_split>
<cfset city_transfer_SELLER = read_rec_fees.city_Flat_Transfer_Tax * read_rec_fees.city_Transfer_SELLER_split>
<cfelse>
<cfset city_transfer_buyer = CITY_MONEY  * read_rec_fees.city_Transfer_buyer_split>
<cfset city_transfer_seller = CITY_MONEY * read_rec_fees.city_Transfer_seller_split>
</cfif>
</cfif>
</cfif>

<cfset total_city_county_transfer_tax_buyer = county_transfer_buyer + city_transfer_buyer>
<cfset total_state_transfer_tax_buyer = state_transfer_buyer>
<cfset total_city_county_transfer_tax_seller = county_transfer_seller + city_transfer_seller>
<cfset total_state_transfer_tax_seller = state_transfer_seller>




<cfif total_city_county_transfer_tax_buyer neq 0>
<cfset descr = "City/County tax/stamps: Deed">
<cfset temp = AddQueryItem(1204, descr, NumberFormat(total_city_county_transfer_tax_buyer, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + total_city_county_transfer_tax_buyer>
</cfif>

<cfif total_city_county_transfer_tax_seller neq 0>
<cfset descr = "City/County tax/stamps: Deed">
<cfif arguments.asset_manager neq 2368 and  arguments.asset_manager neq 3568><!--- Fannie and  Freddie are exempt --->
  <cfset temp = AddQueryItem(1204, descr, NumberFormat(total_city_county_transfer_tax_seller, '_____.__'), "Seller", 0)>
</cfif>
</cfif>

<cfif total_state_transfer_tax_buyer neq 0>
<cfif arguments.property_state eq 'MD' and arguments.first_time_buyer eq 1>
<!--- if it's a Maryland property and a first time home buyer, they do not pay the buyer's portion of the state deed, so do nothing here --->
<cfelse> 
    
<cfif arguments.property_state eq 'VA'>
<cfset descr = "State tax/stamps: Grantee Tax">
<cfelse>
<cfset descr = "State tax/stamps: Deed">
</cfif>


<cfif arguments.transfer_tax_paid_by eq 'Seller'>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(total_state_transfer_tax_buyer, '_____.__'), "Seller", 0)>
<cfelse>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(total_state_transfer_tax_buyer, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + total_state_transfer_tax_buyer>
</cfif>

</cfif>
</cfif>



<cfif total_state_transfer_tax_seller neq 0>
<cfif arguments.property_state eq 'VA'>
<cfset descr = "State tax/stamps: Grantor Tax">
<cfelse>
<cfset descr = "State tax/stamps: Deed">
</cfif>

<cfif arguments.company_id eq 4680>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(total_state_transfer_tax_seller, '_____.__'), "Buyer", 0)>
<cfset roll_up_1203 = roll_up_1203 + total_state_transfer_tax_buyer>
<cfelse>
<cfif arguments.company_id neq 3722 and arguments.company_id neq 4752 and arguments.company_id neq 4702 and arguments.company_id neq 2368 and  arguments.company_id neq 3568><!--- Fannie and  Freddie are exempt --->

<cfif arguments.property_state eq 'KY'>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(4, '_____.__'), "Buyer", 0)>
<cfset roll_up_1203 = roll_up_1203 + 4>
<cfelse>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(total_state_transfer_tax_seller, '_____.__'), "Seller", 0)>
</cfif>

</cfif>
</cfif>
</cfif>


<cfif arguments.purchase_price gt 1000000 and arguments.property_state eq 'NY'>
<cfset mansion_tax =  arguments.purchase_price  * .01>
<cfset temp = AddQueryItem(1205, "Mansion Tax", NumberFormat(mansion_tax, '_____.__'), "Buyer", 0)>
<cfset roll_up_1203 = roll_up_1203 + mansion_tax>
</cfif>



</cfif>
<!--- end Transfer Tax (Deed) --->




<!--- 1202 Mortgage Stamps --->
<CFSET city_mort_stamps = 0>
<cfif #arguments.transaction_type# eq 'Reverse Mortgage' and IsDefined("read_rec_fees.mort_stamps")>
<cfif arguments.property_state eq 'VA'>
<CFSET city_mort_stamps = (arguments.loan_amount * 1.5) * .00333>
<cfelseif arguments.property_state eq 'MD'>
<cfset city_mort_stamps=#NumberFormat(ROUND(((arguments.loan_amount*1.5) - arguments.previous_loan_amount)*read_rec_fees.mort_stamps),'_____.__')#>
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
<cfif IsNumeric(arguments.loan_amount) and arguments.loan_amount gt 0>
<cfset city_mort_stamps = (read_rec_fees.mort_stamps * arguments.loan_amount)>
</cfif>
<cfelse>
<cfif isnumeric(read_rec_fees.mort_stamps)>
<CFSET city_mort_stamps = #round(arguments.loan_amount)# * #read_rec_fees.mort_stamps#>
<cfelse>
<cfset city_mort_stamps = 0>
</cfif>
</cfif>
<cfif city_mort_stamps LT 0>
<CFSET city_mort_stamps = 0>
</cfif>


<cfelseif #arguments.transaction_type# neq 'Purchase' and #arguments.transaction_type# neq 'Reverse Mortgage'>
<!--- not a purchase --->


<cfif (#arguments.property_state# EQ "MD")><!--- If this is not a purchase (it's a refi or a 2nd) and the Porperty Use Type is Primary Residence, Mortgage Stamps are based on the loan amount (arguments.loan_amount) minus the existing loan (orig_loan_amt), otherwise, use the regular calculation --->
<cfif (arguments.property_use_type eq '1'  or arguments.property_use_type eq 'Primary Residence')>

<cfset city_mort_stamps=#NumberFormat(ROUND((arguments.loan_amount-arguments.previous_loan_amount)*read_rec_fees.mort_stamps),'_____.__')#>
<cfelse>
<cfset city_mort_stamps=#NumberFormat(ROUND((arguments.loan_amount)*read_rec_fees.mort_stamps),'_____.__')#>
</cfif>

<cfif arguments.property_state eq 'MD' and arguments.property_county eq 'Montgomery' and (arguments.property_use_type eq '1'  or arguments.property_use_type eq 'Primary Residence')>
<cfif arguments.loan_amount gte arguments.previous_loan_amount>
<cfset new_money = arguments.loan_amount - arguments.previous_loan_amount>
<cfelse>
<cfset new_money = 0>
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
<cfelse>
</cfif>			

<cfif IsDefined("City_mort_stamps") and city_mort_stamps neq 0 and city_mort_stamps neq "">
<cfif arguments.property_state eq 'NY'>
<cfif arguments.cema eq 1>
<cfif arguments.previous_loan_amount LTE arguments.loan_amount >
<CFSET city_mort_stamps = #round(arguments.loan_amount-arguments.previous_loan_amount)# * #percent_calc#>
<cfelse>
<CFSET city_mort_stamps = #round(arguments.loan_amount)# * #percent_calc#>
</cfif>
</cfif>
<cfset lender_cost = city_mort_stamps * .25>
<cfset descr = "City/County tax/stamps: Mortgage Stamps ($" & lender_cost & " POC Lender)">
<cfset temp = AddQueryItem(1204, descr, NumberFormat(city_mort_stamps, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + city_mort_stamps>
<cfelseif arguments.property_state eq 'VA' and arguments.transaction_type eq 'Refinance'>
<cfif arguments.loan_amount GT arguments.previous_loan_amount and arguments.same_lender eq 1>
<!--- if this Chase, and the it's Fairfax VA and and old loan is prior to 1/1/05 they don't get the discount --->
<CFQUERY datasource="#request.dsn#" NAME="read_comp_name">
	SELECT company
	FROM companies
	WHERE id = #arguments.company_id# and (chase_acct = 1 or company like 'Chase%')
</CFQUERY>
<cfif read_comp_name.recordcount and arguments.previous_loan_year LT 2005 and (arguments.property_county eq 'Fairfax City' or arguments.property_county eq 'Fairfax')>
<cfset state_mort_stamps = #round(arguments.loan_amount)# * .0025> 
<CFSET city_mort_stamps = #round(arguments.loan_amount)# * .00083>
<cfelse>
	<cfset new_money = arguments.loan_amount - arguments.previous_loan_amount>
	<cfset state_mort_stamps = #round(new_money)# * .0025> 
	<CFSET city_mort_stamps = #round(new_money)# * .000833>
</cfif>
<cfelse>
<cfif arguments.loan_amount GT arguments.previous_loan_amount or arguments.same_lender eq 0>
	<cfset state_mort_stamps = #round(arguments.loan_amount)# * .0025> 
	<CFSET city_mort_stamps = #round(arguments.loan_amount)# * .00083>
<cfelse>
	<cfset state_mort_stamps = 0> 
	<CFSET city_mort_stamps = 0>
</cfif>
</cfif>

<cfset temp = AddQueryItem(1204, "City/County Tax Stamps", NumberFormat(city_mort_stamps, '_____.__'), "Buyer", 1)>	
<cfset roll_up_1203 = roll_up_1203 + city_mort_stamps>
<cfif IsDefined("state_mort_stamps")>
<cfset temp = AddQueryItem(1205, "State tax/stamps: Mortgage Stamps", NumberFormat(state_mort_stamps, '_____.__'), "Buyer", 1)>	
<cfset roll_up_1203 = roll_up_1203 + state_mort_stamps>
</cfif>

<cfelse>
<cfif arguments.property_state eq 'VA' and arguments.transaction_type eq 'Purchase'>
<cfset state_mort_stamps = #round(arguments.loan_amount)# * .0025> 
<CFSET city_mort_stamps = #round(arguments.loan_amount)# * .00083>
</cfif>
<cfif arguments.property_state eq 'MD' and arguments.transaction_type eq 'Purchase'><!--- if it's a purchase Maryland splits hte fee, on a refi, buyer pays it all, according to Dustin Haskins 8/25/2010 --->
<cfset temp = AddQueryItem(1204, "City/County Tax Stamps", NumberFormat(city_mort_stamps * .5, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + (city_mort_stamps * .5)>
<cfif arguments.asset_manager neq 2368 and  arguments.asset_manager neq 3568><!--- Fannie and  Freddie are exempt --->
<cfset temp = AddQueryItem(1204, "City/County Tax Stamps", NumberFormat(city_mort_stamps * .5, '_____.__'), "Seller", 0)>
</cfif>
<cfelse>
<cfset temp = AddQueryItem(1204, "City/County Tax Stamps", NumberFormat(city_mort_stamps, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + city_mort_stamps>
</cfif>
<cfif IsDefined("state_mort_stamps")>
<cfset temp = AddQueryItem(1205, "State tax/stamps: Mortgage Stamps", NumberFormat(state_mort_stamps, '_____.__'), "Buyer", 1)>	
<cfset roll_up_1203 = roll_up_1203 + state_mort_stamps>
</cfif>

</cfif>
</cfif>
</cffunction>


<cffunction name="GetReissuerates" >
<cfargument name="a_ins_premium">
<cfargument name="previous_loan_year">
<cfargument name="previous_loan_month">
<cfargument name="previous_purch_year">
<cfargument name="previous_purch_month">
<cfargument name="previous_purch_amount">
<cfargument name="transaction_type">
<cfargument name="property_state">
<cfargument name="previous_loan_amount">
<cfargument name="loan_amount">
<cfargument name="company_id">
<cfargument name="reissue_rates">
<cfargument name="underwriter_choice">

<CFQUERY datasource="#request.dsn#" NAME="get_comp_info" maxrows="1">
SELECT * FROM companies WHERE ID = #arguments.company_id#
</CFQUERY>	

<cfif get_comp_info.allow_reissue_rates eq 'True' and arguments.reissue_rates eq 1 and underwriter_choice eq 16>
<cfset owners_states = "DC,FL,LA,MD,MO,OH,VA,WV" >

<cfif ListFindNoCase(owners_states, arguments.property_state, ",")>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_purch_year, arguments.previous_purch_month, 1), Now())>
<cfelse>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
</cfif>

<cfif arguments.property_state eq 'AL'>
<cfset a_ins_premium = a_ins_premium * .66>
<cfelseif arguments.property_state eq 'AZ'>
<cfset a_ins_premium = a_ins_premium * .65>
   <cfif a_ins_premium LT 323>
   <cfset a_ins_premium = 323>
   </cfif>
<cfelseif arguments.property_state eq 'CO'>
<cfset a_ins_premium = read_ins_calc.refinance>
<cfelseif arguments.property_state eq 'CT'>
<cfset a_ins_premium = read_ins_calc.sale * .6>

<!--- District of Columbia – 7 yrs, 2.70 up to 50k, 2.34 up to 100, 1.98 100-500, 1.62 – 500k-$10mil  --->
<cfelseif arguments.property_state eq 'DC' and Numyears LTE 7>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 50000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 2.70)>
 <cfelseif arguments.loan_amount lte 100000>
  <cfset a_ins_premium =  (((50000) / 1000) * 2.70)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 50000) / 1000) * 2.34)>
 <cfelseif arguments.loan_amount lte 500000>
  <cfset a_ins_premium =  (((50000) / 1000) * 2.70)>
   <cfset a_ins_premium =  a_ins_premium + (((50000) / 1000) * 2.34)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 100000) / 1000) * 1.98)>
 <cfelseif arguments.loan_amount lte 10000000>
  <cfset a_ins_premium =  (((50000) / 1000) * 2.70)>
   <cfset a_ins_premium =  a_ins_premium + (((50000) / 1000) * 2.34)>
 <cfset a_ins_premium =  a_ins_premium + (((400000) / 1000) * 1.98)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 500000) / 1000) * 1.62)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>

<!--- Delaware – policy 5 yrs old - $1.50 up to 100k, 1.20 – 100k to $1mil, 1.05, $1mil o $5mil --->
<cfelseif arguments.property_state eq 'DE' and Numyears LTE 5>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 100000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 1.50)>
 <cfelseif arguments.loan_amount lte 1000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 1.50)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 100000) / 1000) * 1.20)>
 <cfelseif arguments.loan_amount lte 5000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 1.50)>
   <cfset a_ins_premium =  a_ins_premium + (((1000000) / 1000) * 1.20)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 1000000) / 1000) * 1.05)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>

<!--- Florida – 3 yrs, 3.30 up to 100k, 3.00, 100 to 1mil, 2, $1mil to $10mil --->
<cfelseif arguments.property_state eq 'FL' and Numyears LTE 3>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 100000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 3.30)>
 <cfelseif arguments.loan_amount lte 1000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 3.30)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 100000) / 1000) * 3.00)>
 <cfelseif arguments.loan_amount lte 10000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 3.30)>
   <cfset a_ins_premium =  a_ins_premium + (((1000000) / 1000) * 3.00)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 1000000) / 1000) * 2.00)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>

<cfelseif arguments.property_state eq 'ID' and Numyears LTE 2>
<cfset a_ins_premium = a_ins_premium * .50>
<cfelseif arguments.property_state eq 'IN' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
<cfelseif arguments.property_state eq 'IL' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .70>
<cfelseif arguments.property_state eq 'IA' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .70>
<cfelseif arguments.property_state eq 'LA' and Numyears LTE 7>
<cfset a_ins_premium = a_ins_premium * .60>

<!--- Maryland – 7 yrs – up to 250k - 1.56, up to 500k - 1.35, up to $1mil - 1.14, up to $5mil- .96 --->
<cfelseif arguments.property_state eq 'MD' and Numyears LTE 7>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 250000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 1.56)>
 <cfelseif arguments.loan_amount lte 500000>
  <cfset a_ins_premium =  (((250000) / 1000) * 1.56)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 250000) / 1000) * 1.35)>
 <cfelseif arguments.loan_amount lte 1000000>
  <cfset a_ins_premium =  (((250000) / 1000) * 1.56)>
 <cfset a_ins_premium =  a_ins_premium + (((250000) / 1000) * 1.35)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 500000) / 1000) * 1.14)>
 <cfelseif arguments.loan_amount gt 1000000>
  <cfset a_ins_premium =  (((250000) / 1000) * 1.56)>
 <cfset a_ins_premium =  a_ins_premium + (((250000) / 1000) * 1.35)>
 <cfset a_ins_premium =  a_ins_premium + (((500000) / 1000) * 1.14)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 1000000) / 1000) * .96)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>

<cfelseif arguments.property_state eq 'MI'>
<cfset a_ins_premium = read_ins_calc.refinance>
<cfelseif arguments.property_state eq 'MS' and Numyears LTE 6>
<cfset a_ins_premium = a_ins_premium * .60>
<cfelseif arguments.property_state eq 'MS' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .80>
<cfelseif arguments.property_state eq 'MO' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
<cfelseif arguments.property_state eq 'MT' and Numyears LTE 3>
<cfset a_ins_premium = a_ins_premium * .5>
<cfelseif arguments.property_state eq 'NE' and Numyears LTE 5>
<cfset a_ins_premium = a_ins_premium * .6>
<cfelseif arguments.property_state eq 'NY' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
<cfelseif arguments.property_state eq 'NJ'>
<cfset a_ins_premium = read_ins_calc.refinance>
<cfelseif arguments.property_state eq 'NC' and Numyears LTE 15>
<cfset a_ins_premium = a_ins_premium * .50>
<cfelseif arguments.property_state eq 'ND' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
<cfelseif arguments.property_state eq 'OH' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .70>
<cfelseif arguments.property_state eq 'RI' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
<cfelseif arguments.property_state eq 'SC' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
<cfelseif arguments.property_state eq 'SD'>
<cfset a_ins_premium = a_ins_premium * .75>
<cfelseif arguments.property_state eq 'TN' and Numyears LTE 15>
<cfset a_ins_premium = a_ins_premium * .70>
<cfelseif arguments.property_state eq 'UT' and Numyears LTE 7>
<cfset a_ins_premium = a_ins_premium * .60>
<cfelseif arguments.property_state eq 'VT'>
<cfset a_ins_premium = a_ins_premium * .5>
<cfelseif arguments.property_state eq 'VA' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .70>
<cfelseif arguments.property_state eq 'WA' and Numyears LTE 5>
<cfset a_ins_premium = a_ins_premium * .80>
<cfif a_ins_premium LT 270>
<cfset a_ins_premium = 270>
</cfif>
<cfelseif arguments.property_state eq 'WV' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
<cfelseif arguments.property_state eq 'WY' and Numyears LTE 5>
<cfset a_ins_premium = a_ins_premium * .50>
</cfif>

<cfelseif get_comp_info.allow_reissue_rates eq 'True' and arguments.reissue_rates eq 1 and underwriter_choice eq 29><!--- Chicago Title --->
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>

<cfif arguments.property_state eq 'WV' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
<cfelseif arguments.property_state eq 'MD'>
<cfset a_ins_premium = read_ins_calc.reissue>
<cfelseif arguments.property_state eq 'DC' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
<cfelseif arguments.property_state eq 'VA' and Numyears LTE 10>
<cfset a_ins_premium = read_ins_calc.reissue>
</cfif>


<cfelseif get_comp_info.allow_reissue_rates eq 'True' and arguments.reissue_rates eq 1 and underwriter_choice eq 25>
<cfif arguments.property_state eq 'DC' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
</cfif>

</cfif>

<cfreturn  a_ins_premium>
</cffunction>

<cffunction name="GetSubrates" >
<cfargument name="a_ins_premium">
<cfargument name="previous_loan_year">
<cfargument name="previous_loan_month">
<cfargument name="previous_purch_year">
<cfargument name="previous_purch_month">
<cfargument name="previous_purch_amount">
<cfargument name="transaction_type">
<cfargument name="same_lender">
<cfargument name="property_state">
<cfargument name="previous_loan_amount">
<cfargument name="loan_amount">
<cfargument name="underwriter_choice" default="16">
<cfset a_ins_premium = arguments.a_ins_premium>

<!--- SUBSTITUTION RATES - these rates are applied to the Loan Policy rate if the policy is issued by the same lender --->
<!--- now we'll see if this company is allowed Substitution Rates, and if so, figure them out --->
<cfset current_ins_premium = a_ins_premium>
<cfif get_all_comp_info.allow_subrates eq 1>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfif arguments.transaction_type eq 'Refinance' and arguments.same_lender eq 1 and NumYears LT 15>
<cfif arguments.property_state eq 'DC'>
<CFSET   x_final  = #Round(arguments.previous_loan_amount)#>
		<CFQUERY datasource="#request.dsn#" NAME="get_subrates" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
		<!--- <cfif cgi.REMOTE_ADDR eq '98.233.232.47'><cfabort></cfif> --->
		<cfif arguments.underwriter_choice eq 29><!--- First American --->
        <cfif NumYears LTE 3>
		<cfset a_ins_premium = (get_subrates.refinance * .30)>
		<cfelseif  NumYears LTE 4>
		<cfset a_ins_premium = (get_subrates.refinance * .40)>
		<cfelseif  NumYears LTE 5>
		<cfset a_ins_premium = (get_subrates.refinance * .50)>
		<cfelseif  NumYears GT 5>
		<cfset a_ins_premium = (get_subrates.refinance * .60)>
		</cfif>
		<cfelse>
        <cfif NumYears LTE 3>
		<cfset a_ins_premium = (get_subrates.refinance * .30)>
		<cfelseif  NumYears LT 4>
		<cfset a_ins_premium = (get_subrates.refinance * .40)>
		<cfelseif  NumYears LT 5>
		<cfset a_ins_premium = (get_subrates.refinance * .50)>
		<cfelseif  NumYears LTE 7>
		<cfset a_ins_premium = (get_subrates.refinance * .60)>
		</cfif>
		</cfif>
		<cfif arguments.loan_amount GT arguments.previous_loan_amount>
		<CFSET   x_final  = #Round(arguments.loan_amount-arguments.previous_loan_amount)#>
		<CFQUERY datasource="#request.dsn#" NAME="get_rates" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
		<cfset a_ins_premium = a_ins_premium + (get_rates.refinance)>
        </cfif>
        <cfset current_ins_premium = a_ins_premium>
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
<cfelseif arguments.property_state eq 'IN'>
	<cfif arguments.loan_amount LT 100000>
	<cfset a_ins_premium = (a_ins_premium * .60)>
	<cfelseif arguments.loan_amount LT 5000000>
	<cfset a_ins_premium = (a_ins_premium * .75)>
	</cfif>
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

<cfelseif arguments.property_state eq 'FL' or  arguments.property_state eq 'IL' or  arguments.property_state eq 'WI'>

<cfif Numyears LT 3>
<cfset a_ins_premium = (a_ins_premium * .30)>
<cfelseif Numyears LT 4>
<cfset a_ins_premium = (a_ins_premium * .40)>
<cfelseif Numyears LT 5>
<cfset a_ins_premium = (a_ins_premium * .50)>
<cfelseif Numyears LTE 10>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>

<cfelseif arguments.property_state eq 'KS'>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelseif arguments.property_state eq 'LA'>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelseif arguments.property_state eq 'MA'>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelseif arguments.property_state eq 'ME'>
<cfif Numyears LTE 5>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .80)>
</cfif>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>

<!--- Maryland – 7 yrs – up to 250k - 1.56, up to 500k - 1.35, up to $1mil - 1.14, up to $5mil- .96 --->

<cfelseif arguments.property_state eq 'MD' and Numyears LTE 7>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 250000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 1.56)>
 <cfelseif arguments.loan_amount lte 500000>
  <cfset a_ins_premium =  (((250000) / 1000) * 1.56)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 250000) / 1000) * 1.35)>
 <cfelseif arguments.loan_amount lte 1000000>
  <cfset a_ins_premium =  (((250000) / 1000) * 1.56)>
 <cfset a_ins_premium =  a_ins_premium + (((250000) / 1000) * 1.35)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 500000) / 1000) * 1.14)>
 <cfelseif arguments.loan_amount gt 1000000>
  <cfset a_ins_premium =  (((250000) / 1000) * 1.56)>
 <cfset a_ins_premium =  a_ins_premium + (((250000) / 1000) * 1.35)>
 <cfset a_ins_premium =  a_ins_premium + (((500000) / 1000) * 1.14)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 1000000) / 1000) * .96)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>


<cfelseif arguments.property_state eq 'MN'>
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
<cfif Numyears LTE 3>
<cfset a_ins_premium = (a_ins_premium * .50)>
</cfif>
<cfelseif arguments.property_state eq 'NC'>
<cfif Numyears LTE 15>
<cfset a_ins_premium = (a_ins_premium * .50)>
</cfif>
<cfelseif arguments.property_state eq 'ND'>
	<cfif Numyears LTE 3>
	<cfset a_ins_premium = (a_ins_premium * .30)>
	<cfelseif Numyears LTE 4>
	<cfset a_ins_premium = (a_ins_premium * .40)>
	<cfelseif Numyears LTE 5>
	<cfset a_ins_premium = (a_ins_premium * .50)>
	<cfelseif Numyears LTE 10>
	<cfset a_ins_premium = (a_ins_premium * .60)>
	</cfif>
<cfelseif arguments.property_state eq 'NM'>
<CFSET   x_final  = #Round(arguments.previous_loan_amount)#>
		<CFQUERY datasource="#request.dsn#" NAME="get_subrates" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
        <cfif NumYears LT 2>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .40), "____.__")>
        <cfelseif NumYears LT 3>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .45), "____.__")>
        <cfelseif NumYears LT 4>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .50), "____.__")>
        <cfelseif NumYears LT 5>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .55), "____.__")>
        <cfelseif NumYears LT 6>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .60), "____.__")>
        <cfelseif NumYears LT 7>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .65), "____.__")>
        <cfelseif NumYears LT 8>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .70), "____.__")>
        <cfelseif NumYears LT 9>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .75), "____.__")>
        <cfelseif NumYears LT 10>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .80), "____.__")>
		</cfif>
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
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .80)>
</cfif>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>
<cfelseif arguments.property_state eq 'TN'>
<cfif Numyears LTE 5>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
</cfif>
<cfelseif arguments.property_state eq 'VA'>
<cfif Numyears LTE 15>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
</cfif>
<cfelseif arguments.property_state eq 'VT'>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelseif arguments.property_state eq 'WV'>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelse>
<cfset current_ins_premium = a_ins_premium>

</cfif>
</cfif>
</cfif>
<cfset current_ins_premium = a_ins_premium>
</cffunction>

<cffunction name="DetermineAltaLine" >
<cfquery dbtype="query" name="get_1100s"> 
SELECT *
FROM fees_query where line_number between 1100 and 1199
order by line_number
</cfquery>
<cfset line_num = 1122>
<cfset used_numbers = ValueList(get_1100s.line_number, ",")>
<cfset possible_numbers = "1122,1121,1120,1119,1118,1117,1116,1115,1114,1113,1112,1111,1110">
<cfloop index="i" list="#possible_numbers#" delimiters=",">
<cfif NOT ListContainsNoCase(used_numbers, i, ",")>
<cfset line_num = i>
</cfif>
</cfloop>

	<cfreturn line_num>
</cffunction>



<cffunction name="AddXMLItem" >
<cfargument name="LINE_NUMBER">
<cfargument name="DESCRIPTION">
<cfargument name="AMOUNT">
<cfargument name="PAYEE" default="Buyer">
<cfargument name="COMP_ID" default="0">
<cfargument name="OUTSIDE" default="0">
<cfargument name="PAYTO" default="">
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
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToType = arguments.payto>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "#arguments.DESCRIPTION#">
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._SpecifiedHUDLineNumber = "#arguments.LINE_NUMBER#">
<cfif arguments.COMP_ID neq 3704 and arguments.COMP_ID neq 3746 and  arguments.COMP_ID neq 3747 and  arguments.COMP_ID neq 3748>
<cfif (arguments.LINE_NUMBER eq 1301 or arguments.LINE_NUMBER eq 1302 or arguments.LINE_NUMBER eq 1303 or arguments.LINE_NUMBER eq 1304 or arguments.LINE_NUMBER eq 1305 or arguments.LINE_NUMBER eq 1306 or arguments.LINE_NUMBER eq 1307 or arguments.LINE_NUMBER eq 1308 or arguments.LINE_NUMBER eq 1309)>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "First Title">
</cfif>
</cfif>

<cfif arguments.COMP_ID eq 3722 or arguments.COMP_ID eq 4752>
<cfif (arguments.LINE_NUMBER eq 1301 or arguments.LINE_NUMBER eq 1302 or arguments.LINE_NUMBER eq 1303 or arguments.LINE_NUMBER eq 1304 or arguments.LINE_NUMBER eq 1305 or arguments.LINE_NUMBER eq 1306 or arguments.LINE_NUMBER eq 1307 or arguments.LINE_NUMBER eq 1308 or arguments.LINE_NUMBER eq 1309)>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "Community Real Estate Services, LLC">
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
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].XmlChildren[1].xmlAttributes._Amount = "#Trim(arguments.AMOUNT)#">
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].XmlChildren[1].xmlAttributes._PaidByType = "#Trim(arguments.PAYEE)#">
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].XmlChildren[1].xmlAttributes._OutsideCharge = "#Trim(arguments.OUTSIDE)#">

<CFSET item_count = item_count +1>
</cffunction>

<cffunction name="AddQueryItem" output="false">
<cfargument name="line_number" type="string" default="">
<cfargument name="Description" type="string" default="">
<cfargument name="amount" type="string" default="">
<cfargument name="payer" type="string" default="">			
<cfargument name="outside" type="numeric" default="0">			
<cfargument name="payto" type="string" default="">			
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", arguments.line_number)>
<cfset temp = QuerySetCell(fees_query, "Description", arguments.description)>
<cfif IsNumeric(arguments.amount)>
<cfset temp = QuerySetCell(fees_query, "Amount", arguments.amount)>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Amount", arguments.amount)>
</cfif>
<cfset temp = QuerySetCell(fees_query, "Payer", arguments.payer)>			
<cfset temp = QuerySetCell(fees_query, "Payto", arguments.payto)>			
<cfset temp = QuerySetCell(fees_query, "Outside", arguments.outside)>		
</cffunction>

<cffunction name="GetLineCosts" >

<cfargument name="asset_manager" default="">
<cfargument name="company_id" default="">
<cfargument name="property_state" default="">
<cfargument name="transaction_type" default="">
<cfargument name="loan_amount" default="">
<cfargument name="delinquency" default="0">
<cfargument name="cema" default="0">

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

<cfif ((#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage"))>	

<cfif (arguments.company_id neq 3492 and arguments.company_id neq 5223) or ((arguments.company_id eq 3492 or arguments.company_id eq 5223) and arguments.loan_amount GTE 500000)>
<!--- don't show these if this is AXCIDION and the loan amount is less than 500000 --->
<cfif Len(read_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE)>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_01_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_01_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_02_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_02_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_02_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_02_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_02_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_03_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_03_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_03_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_03_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_03_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_04_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_04_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_04_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_04_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_04_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_05_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_05_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_05_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_05_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_05_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_06_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_06_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_06_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_06_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_06_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_07_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_07_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_07_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_07_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_07_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_08_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_08_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_08_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_08_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_08_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_09_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_09_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_09_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_09_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_09_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_10_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_10_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_10_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_10_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_10_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_11_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_11_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_11_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_11_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_11_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_12_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_12_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_12_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_12_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_12_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_13_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_13_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_13_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_13_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_13_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_14_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_14_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_14_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_14_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_14_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_15_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_15_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_15_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_15_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_15_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_16_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_16_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_16_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_16_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_16_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_17_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_17_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_17_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_17_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_17_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_18_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_18_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_18_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_18_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_18_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_19_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_19_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_19_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_19_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_19_REFINANCE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_20_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_20_REFINANCE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_20_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_20_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_20_REFINANCE>
</cfif>
</cfif>

<cfif arguments.loan_amount neq 0 and arguments.loan_amount neq '' and arguments.loan_amount neq 'NULL'>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_REFINANCE# neq "">
<cfset a_801 = #read_this_sets_billing_values.A_0801_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(801, read_this_sets_billing_values.A_0801_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0801_AMOUNT_REFINANCE, '_____.__'), "Buyer", 1, #read_agency.title_ft_agency_name#)>
</cfif>


<cfif #read_this_sets_billing_values.A_0802_AMOUNT_REFINANCE# neq "">
<cfset a_802 = #read_this_sets_billing_values.A_0802_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(802, read_this_sets_billing_values.A_0802_DESCRIPTION_REFINANCE, ReplaceNoCase(read_this_sets_billing_values.A_0802_AMOUNT_REFINANCE, " ", "", "ALL"), "Buyer", 1, #read_agency.title_ft_agency_name#)>
</cfif>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_REFINANCE# neq "" and #read_this_sets_billing_values.A_0802_AMOUNT_REFINANCE# neq "">
<cfset temp = AddQueryItem(803, "Your adjusted origination charges", NumberFormat((read_this_sets_billing_values.A_0802_AMOUNT_REFINANCE + read_this_sets_billing_values.A_0801_AMOUNT_REFINANCE), '_____.__'), "Buyer", 0)>
</cfif>


<cfif #read_this_sets_billing_values.A_0804_AMOUNT_REFINANCE# neq "">
<cfset a_804 = #read_this_sets_billing_values.A_0804_AMOUNT_REFINANCE#>
<cfif (arguments.company_id eq 3722 or arguments.company_id eq 4752) and IsNumeric(arguments.loan_amount) and arguments.loan_amount gt 0>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_REFINANCE, '_____.__'), "Buyer", 1, read_this_sets_billing_values.A_0804_PAYTO_REFINANCE)>
<cfelseif (arguments.company_id eq 4702) and IsNumeric(arguments.loan_amount) and arguments.loan_amount gt 0>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0804_PAYTO_REFINANCE)>
<cfelse>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0804_PAYTO_REFINANCE)>
</cfif>
</cfif>

<cfif #read_this_sets_billing_values.A_0805_AMOUNT_REFINANCE# neq "">
<cfset a_805 = #read_this_sets_billing_values.A_0805_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.A_0805_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0805_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0805_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0806_AMOUNT_REFINANCE# neq "">
<cfset a_806 = #read_this_sets_billing_values.A_0806_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.A_0806_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0806_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0806_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0807_AMOUNT_REFINANCE# neq "">
<cfset a_807 = #read_this_sets_billing_values.A_0807_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.A_0807_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0807_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0807_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0808_AMOUNT_REFINANCE# neq "">
<cfset a_808 = #read_this_sets_billing_values.A_0808_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.A_0808_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0808_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0808_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0809_AMOUNT_REFINANCE# neq "">
<cfset a_809 = #read_this_sets_billing_values.A_0809_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(809, read_this_sets_billing_values.A_0809_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0809_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0809_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0810_AMOUNT_REFINANCE# neq "">
<cfset a_810 = #read_this_sets_billing_values.A_0810_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.A_0810_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0810_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0810_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0811_AMOUNT_REFINANCE# neq "">
<cfset a_811 = #read_this_sets_billing_values.A_0811_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.A_0811_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0811_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0811_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0812_AMOUNT_REFINANCE# neq "">
<cfset a_812 = #read_this_sets_billing_values.A_0812_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(812, read_this_sets_billing_values.A_0812_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0812_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0812_PAYTO_REFINANCE)>
</cfif>

</cfif>


<cfif #read_this_sets_billing_values.A_1102_AMOUNT_REFINANCE# neq "">

<cfif arguments.property_state eq 'NY' and arguments.cema eq 1>
<cfset roll_up_1101 = roll_up_1101 + 325>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102_DESCRIPTION_REFINANCE, NumberFormat(325, '_____.__'), "Buyer", 1, read_this_sets_billing_values.A_1102_PAYTO_REFINANCE)>
<cfelse>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102_AMOUNT_REFINANCE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1102_AMOUNT_REFINANCE, '_____.__'), "Buyer", 1, read_this_sets_billing_values.A_1102_PAYTO_REFINANCE)>
</cfif>
</cfif>

<cfif #read_this_sets_billing_values.A_1109_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1109_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1109_AMOUNT_REFINANCE>
</cfif>
<cfset a_1109 = #read_this_sets_billing_values.A_1109_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(1109, read_this_sets_billing_values.A_1109_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1109_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1109_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1109_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1110_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1110_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1110_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1110, read_this_sets_billing_values.A_1110_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1110_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1110_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1110_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1111_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1111_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1111_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.A_1111_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1111_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1111_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1111_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1112_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1112_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1112_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.A_1112_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1112_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1112_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1112_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1113_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1113_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1113_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.A_1113_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1113_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1113_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1113_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1302_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1302_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1302_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1302, read_this_sets_billing_values.A_1302_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1302_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1302_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1302_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1303_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1303_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1303_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.A_1303_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1303_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1303_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1303_PAYTO_REFINANCE)>
</cfif>

<cfif #arguments.delinquency# neq '' and #arguments.delinquency# neq 'NULL' and #arguments.delinquency# neq 0 and (arguments.company_id eq 3722 or arguments.company_id eq 4752)>
<cfset roll_up_1301 = roll_up_1301 + arguments.delinquency>
<cfset temp = AddQueryItem(1303, "Past Due Maintenance", NumberFormat(arguments.delinquency, '_____.__'), "Buyer", 0, "6901 Oglesby Avenue Apt. Corp.")>
</cfif>

<cfif #read_this_sets_billing_values.A_1304_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1304_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1304_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.A_1304_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1304_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1304_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1304_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1305_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1305_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1305_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.A_1305_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1305_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1305_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1305_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1306_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1306_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1306_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1306, read_this_sets_billing_values.A_1306_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1306_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1306_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1306_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1307_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1307_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1307_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1307, read_this_sets_billing_values.A_1307_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1307_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1307_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1307_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1308_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1308_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1308_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1308, read_this_sets_billing_values.A_1308_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1308_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1308_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1308_PAYTO_REFINANCE)>
</cfif>
</cfif>

<!--- PURCHASE --->
<cfelseif (#arguments.transaction_type# eq "Purchase")>	

<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_01_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_01_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_02_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_02_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_03_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_03_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_04_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_04_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_05_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_05_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_06_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_06_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_07_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_07_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_08_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_08_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_09_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_09_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_10_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_10_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_11_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_11_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_12_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_12_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_13_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_13_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_14_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_14_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_15_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_15_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_16_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_16_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_17_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_17_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_18_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_18_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_19_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_19_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_20_PURCHASE neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_20_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE>
</cfif>



<cfif #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE# neq "">
<cfset a_801 = #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(801, read_this_sets_billing_values.A_0801_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE, '_____.__'), "Buyer", 1)>
</cfif>


<cfif #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE# neq "">
<cfset a_802 = #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(802, read_this_sets_billing_values.A_0802_DESCRIPTION_PURCHASE, ReplaceNoCase(read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE, " ", "", "ALL"), "Buyer", 1)>
</cfif>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE# neq "" and #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE# neq "">
<cfset temp = AddQueryItem(803, "Your adjusted origination charges", NumberFormat((read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE + read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE), '_____.__'), "Buyer", 0)>
</cfif>


<cfif #read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE# neq "">
<cfset a_804 = #read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0804_PAYTO_PURCHASE)>
</cfif>


<cfif #read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE# neq "">
<cfset a_805 = #read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.A_0805_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0805_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE# neq "">
<cfset a_806 = #read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.A_0806_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0806_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE# neq "">
<cfset a_807 = #read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.A_0807_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0807_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE# neq "">
<cfset a_808 = #read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.A_0808_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0808_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE# neq "">
<cfset a_809 = #read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(809, read_this_sets_billing_values.A_0809_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0809_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE# neq "">
<cfset a_810 = #read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.A_0810_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0810_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE# neq "">
<cfset a_811 = #read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.A_0811_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0811_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE# neq "">
<cfset a_812 = #read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(812, read_this_sets_billing_values.A_0812_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0812_PAYTO_PURCHASE)>
</cfif>


<cfif #read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE>
<cfset a_1102 = #read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE, '_____.__'), "Buyer", 1, read_this_sets_billing_values.A_1102_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1109_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1109_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1109_AMOUNT_PURCHASE>
</cfif>


<cfset temp = AddQueryItem(1109, read_this_sets_billing_values.A_1109_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1109_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1109_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1109_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1110_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1110_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1110_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1110, read_this_sets_billing_values.A_1110_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1110_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1110_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1110_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1111_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1111_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1111_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.A_1111_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1111_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1111_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1111_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1112_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1112_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1112_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.A_1112_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1112_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1112_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1112_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1113_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1113_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1113_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.A_1113_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1113_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1113_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1113_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1302_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1302_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1302_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1302, read_this_sets_billing_values.A_1302_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1302_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1302_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1302_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1303_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1303_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1303_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.A_1303_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1303_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1303_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1303_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1304_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1304_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1304_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.A_1304_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1304_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1304_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1304_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1305_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1305_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1305_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.A_1305_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1305_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1305_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1305_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1306_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1306_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1306_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1306, read_this_sets_billing_values.A_1306_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1306_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1306_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1306_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1307_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1307_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1307_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1307, read_this_sets_billing_values.A_1307_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1307_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1307_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1307_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1308_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1308_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1308_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1308, read_this_sets_billing_values.A_1308_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1308_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1308_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1308_PAYTO_PURCHASE)>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_01_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_02_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_03_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_04_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_05_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_06_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_07_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_08_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_09_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_10_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_11_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_11_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_12_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_12_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_13_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_13_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_14_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_14_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_15_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_15_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_16_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_16_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_17_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_17_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_18_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_18_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_19_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_19_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_20_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_20_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER>
</cfif>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_801 = #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(801, read_this_sets_billing_values.A_0801_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0)>
</cfif>


<cfif #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_802 = #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(802, read_this_sets_billing_values.A_0802_DESCRIPTION_PURCHASE_SELLER, ReplaceNoCase(read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE_SELLER, " ", "", "ALL"), "Seller", 0)>
</cfif>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE_SELLER# neq "" and #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(803, "Your adjusted origination charges", NumberFormat((read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE_SELLER + read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE_SELLER), '_____.__'), "Buyer", 0)>
</cfif>


<cfif #read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_804 = #read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0804_PAYTO_PURCHASE_SELLER)>
</cfif>


<cfif #read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_805 = #read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.A_0805_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0805_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_806 = #read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.A_0806_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0806_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_807 = #read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.A_0807_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0807_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_808 = #read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.A_0808_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0808_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_809 = #read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(809, read_this_sets_billing_values.A_0809_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0809_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_810 = #read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.A_0810_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0810_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_811 = #read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.A_0811_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0811_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_812 = #read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(812, read_this_sets_billing_values.A_0812_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0812_PAYTO_PURCHASE_SELLER)>
</cfif>


<cfif #read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1102_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1109_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1109, read_this_sets_billing_values.A_1109_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1109_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1109_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1110_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1110, read_this_sets_billing_values.A_1110_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1110_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1110_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1111_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.A_1111_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1111_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1111_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1112_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.A_1112_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1112_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1112_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1113_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.A_1113_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1113_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1113_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1302_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1302, read_this_sets_billing_values.A_1302_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1302_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1302_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1303_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.A_1303_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1303_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1303_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1304_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.A_1304_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1304_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1304_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1305_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.A_1305_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1305_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1305_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1306_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1306, read_this_sets_billing_values.A_1306_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1306_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1306_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1307_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1307, read_this_sets_billing_values.A_1307_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1307_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1307_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1308_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1308, read_this_sets_billing_values.A_1308_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1308_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1308_PAYTO_PURCHASE_SELLER)>
</cfif>

<!--- 2ND Mortgage --->
<cfelseif (#arguments.transaction_type# eq "New Second Mortgage")>	
	

<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>


<cfif #read_this_sets_billing_values.A_0801_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_801 = #read_this_sets_billing_values.A_0801_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(801, read_this_sets_billing_values.A_0801_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0801_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 1)>
</cfif>


<cfif #read_this_sets_billing_values.A_0802_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_802 = #read_this_sets_billing_values.A_0802_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(802, read_this_sets_billing_values.A_0802_DESCRIPTION_2ND_WITH_TI, ReplaceNoCase(read_this_sets_billing_values.A_0802_AMOUNT_2ND_WITH_TI, " ", "", "ALL"), "Buyer", 1)>
</cfif>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_2ND_WITH_TI# neq "" and #read_this_sets_billing_values.A_0802_AMOUNT_2ND_WITH_TI# neq "">
<cfset temp = AddQueryItem(803, "Your adjusted origination charges", NumberFormat((read_this_sets_billing_values.A_0802_AMOUNT_2ND_WITH_TI + read_this_sets_billing_values.A_0801_AMOUNT_2ND_WITH_TI), '_____.__'), "Buyer", 0)>
</cfif>


<cfif #read_this_sets_billing_values.A_0804_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_804 = #read_this_sets_billing_values.A_0804_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0804_PAYTO_2ND_WITH_TI)>
</cfif>


<cfif #read_this_sets_billing_values.A_0805_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_805 = #read_this_sets_billing_values.A_0805_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.A_0805_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0805_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0805_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0806_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_806 = #read_this_sets_billing_values.A_0806_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.A_0806_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0806_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0806_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0807_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_807 = #read_this_sets_billing_values.A_0807_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.A_0807_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0807_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0807_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0808_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_808 = #read_this_sets_billing_values.A_0808_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.A_0808_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0808_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0808_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0809_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_809 = #read_this_sets_billing_values.A_0809_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(809, read_this_sets_billing_values.A_0809_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0809_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0809_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0810_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_810 = #read_this_sets_billing_values.A_0810_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.A_0810_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0810_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0810_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0811_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_811 = #read_this_sets_billing_values.A_0811_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.A_0811_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0811_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0811_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0812_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_812 = #read_this_sets_billing_values.A_0812_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(812, read_this_sets_billing_values.A_0812_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0812_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0812_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1101_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1101_AMOUNT_2ND_WITH_TI>
</cfif>

<cfif #read_this_sets_billing_values.A_1102_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102_AMOUNT_2ND_WITH_TI>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1102_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_1102_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1109_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1109_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1109_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1109, read_this_sets_billing_values.A_1109_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1109_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1109_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1109_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1110_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1110_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1110_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1110, read_this_sets_billing_values.A_1110_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1110_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1110_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1110_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1111_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1111_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1111_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.A_1111_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1111_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1111_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1111_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1112_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1112_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1112_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.A_1112_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1112_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1112_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1112_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1113_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1113_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1113_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.A_1113_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1113_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1113_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1113_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1302_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1302_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1302_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1302, read_this_sets_billing_values.A_1302_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1302_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1302_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1302_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1303_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1303_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1303_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.A_1303_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1303_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1303_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1303_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1304_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1304_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1304_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.A_1304_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1304_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1304_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1304_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1305_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1305_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1305_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.A_1305_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1305_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1305_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1305_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1306_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1306_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1306_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1306, read_this_sets_billing_values.A_1306_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1306_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1306_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1306_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1307_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1307_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1307_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1307, read_this_sets_billing_values.A_1307_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1307_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1307_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1307_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1308_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1308_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1308_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1308, read_this_sets_billing_values.A_1308_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1308_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1308_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1308_PAYTO_2ND_WITH_TI)>
</cfif>

</cfif>

<cfif roll_up_1301 neq 0>
<cfset temp = AddQueryItem(1301, "Additional Settlement Charges", NumberFormat(roll_up_1301, '_____.__'), "Buyer", 0, "")>
</cfif>

</cffunction>

<cffunction name="GetAltas" >
<cfargument name="opt_alta_4" type="string" default="0">
<cfargument name="opt_alta_4_1" type="string" default="0">
<cfargument name="opt_alta_5" type="string" default="0">
<cfargument name="opt_alta_5_1" type="string" default="0">
<cfargument name="opt_alta_6" type="string" default="0">
<cfargument name="opt_alta_6_1" type="string" default="0">
<cfargument name="opt_alta_6_2" type="string" default="0">
<cfargument name="opt_alta_7" type="string" default="0">
<cfargument name="opt_alta_8_1" type="string" default="0">
<cfargument name="opt_alta_9" type="string" default="0">

<cfargument name="opt_tx_1" type="string" default="1">
<cfargument name="opt_tx_2" type="string" default="1">
<cfargument name="opt_tx_3" type="string" default="1">
<cfargument name="opt_tx_4" type="string" default="1">
<cfargument name="opt_tx_5" type="string" default="1">
<cfargument name="opt_tx_6" type="string" default="1">
<cfargument name="opt_tx_7" type="string" default="0">
<cfargument name="opt_tx_8" type="string" default="0">
<cfargument name="opt_tx_9" type="string" default="0">
<cfargument name="opt_tx_10" type="string" default="0">

<cfargument name="opt_ut_4" type="string" default="0">
<cfargument name="opt_ut_41" type="string" default="0">
<cfargument name="opt_ut_5" type="string" default="0">
<cfargument name="opt_ut_51" type="string" default="0">
<cfargument name="opt_ut_6" type="string" default="0">
<cfargument name="opt_ut_61" type="string" default="0">
<cfargument name="opt_ut_62" type="string" default="0">
<cfargument name="opt_ut_81" type="string" default="0">
<cfargument name="opt_ut_9" type="string" default="0">


<cfargument name="opt_sd_comp" type="string" default="0">
<cfargument name="opt_sd_balloon" type="string" default="0">
<cfargument name="opt_sd_credit" type="string" default="0">
<cfargument name="opt_sd_7" type="string" default="0">
<cfargument name="opt_sd_6" type="string" default="0">
<cfargument name="opt_sd_4" type="string" default="0">
<cfargument name="opt_sd_5" type="string" default="0">
<cfargument name="opt_sd_9" type="string" default="0">
<cfargument name="opt_sd_8" type="string" default="0">


<cfargument name="property_state" type="string" default="">
<cfargument name="property_county" type="string" default="">
<cfargument name="transaction_type" type="string" default="">
<cfargument name="loan_amount" type="string" default="0">
<cfargument name="company_id" type="string" default="0">
<cfset trigger_stifel = 0>


<cfif arguments.company_id eq 4177 and arguments.loan_amount NEQ 0 and arguments.loan_amount NEQ 'NULL'>
<cfset trigger_stifel = 1>
</cfif>
<cfif arguments.property_state EQ "TX">
	<!--- <cfif arguments.opt_tx_1 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "POLICY GUARANTEE", NumberFormat(5, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 5>
	</cfif> --->
	<cfif arguments.opt_tx_2 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "EPA (T-36)", NumberFormat(25, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 25>
	</cfif>
	<cfif arguments.opt_tx_3 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "NOT YET DUE AND PAYABLE", NumberFormat(5, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 5>
	</cfif>
	<cfif arguments.opt_tx_4 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "PUD (T-17)", NumberFormat(25, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 25>
	</cfif>
	<cfif arguments.opt_tx_5 eq 1>
	<cfset amount = a_ins_premium * .05>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "SURVEY (T-19)", NumberFormat(amount, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + amount>
	</cfif>
	<cfif arguments.opt_tx_6 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "MINERAL (T-19.2)", NumberFormat(50, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 50>
	</cfif>
	<cfif arguments.opt_tx_7 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ARM (T-33)", NumberFormat(20, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 20>
	</cfif>
	<cfif arguments.opt_tx_8 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "BALLOON", NumberFormat(25, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 25>
	</cfif>
	<cfif arguments.opt_tx_9 eq 1>
	<cfset amount = a_ins_premium * .10>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "(T-42)", NumberFormat(amount, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + amount>
	</cfif>
	<cfif arguments.opt_tx_10 eq 1>
	<cfset amount = a_ins_premium * .15>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "(T-42.1)", NumberFormat(amount, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + amount>
	</cfif>
</cfif>

<cfif arguments.property_state eq "SD">

	<cfif arguments.opt_sd_comp eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "Comprehensive Endorsement", NumberFormat(25, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 25>
	</cfif>
	
	<cfif arguments.opt_sd_balloon eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "Balloon Endorsement", NumberFormat(50, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 50>
	</cfif>
	
	<cfif arguments.opt_sd_credit eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "Line of Credit Endorsement", NumberFormat(50, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 50>
	</cfif>
	
	<cfif arguments.opt_sd_7 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7-06 Manufactured Housing Unit", NumberFormat(50, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 50>
	</cfif>
	
	<cfif arguments.opt_sd_6 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6-06 Variable Rate Mortgage (ARM)", NumberFormat(50, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 50>
	</cfif>
	
	<cfif arguments.opt_sd_4 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4-06 Condominium", NumberFormat(50, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 50>
	</cfif>
	
	<cfif arguments.opt_sd_5 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5-06 Planned Unit Development", NumberFormat(50, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 50>
	</cfif>
	
	<cfif arguments.opt_sd_9 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9-06 Restrictions, Encroachments, Minerals", NumberFormat(50, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 50>
	</cfif>
	
	<cfif arguments.opt_sd_8 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1-06 Environmental Protection Lien", NumberFormat(0, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 0>
	</cfif>
</cfif>

<cfif arguments.property_state eq "UT">

	<cfif arguments.opt_ut_4 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 and 4-06 Condominium", NumberFormat(20, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 20>
	</cfif>
	
	<cfif arguments.opt_ut_41 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 and 4.1-06 Condominium", NumberFormat(20, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 20>
	</cfif>
	
	<cfif arguments.opt_ut_5 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 and 5-06 Planned Unit Development", NumberFormat(20, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 20>
	</cfif>
	
	<cfif arguments.opt_ut_51 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 and 5.1-06 Planned Unit Development", NumberFormat(20, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 20>
	</cfif>
	
	<cfif arguments.opt_ut_6 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 and 6-06 Variable Rqate Mortgage", NumberFormat(25, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 25>
	</cfif>
	
	<cfif arguments.opt_ut_61 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 and 6.1-06 Variable Rate Mortgage - Regulations", NumberFormat(25, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 25>
	</cfif>
	
	<cfif arguments.opt_ut_62 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 and 6.2-06 Variable Rate Mortgage - Negative Amortization", NumberFormat(25, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 25>
	</cfif>
	
	
	<cfif arguments.opt_ut_81 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 and 8.1-06 Environmental Protect Lien", NumberFormat(25, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 25>
	</cfif>
	
	<cfif arguments.opt_ut_9 eq 1>
	<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 and 9-06 Restrictions, Encroachments, Minerals", NumberFormat(20, '_____.__'), "Buyer", 1)>
	<cfset total_alta = total_alta + 20>
	</cfif>

</cfif>

<cfif arguments.property_state EQ "AZ">

<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfif arguments.property_county eq 'Santa Cruz' or arguments.property_county eq 'Coconino'>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
<cfelseif arguments.property_county neq 'Yavapai'>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(100, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 100>
</cfif>
</cfif>
               
<!--- optional ALTAs --->
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(100, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 100>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(100, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 100>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(100, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 100>
</cfif>


<cfelseif arguments.property_state EQ "CA">

<cfelseif arguments.property_state EQ "CO">

<cfquery dbtype="query" name="check_title_ins"> 
	SELECT *
	FROM Fees_query
	where Line_Number = 1104
	order by line_number
</cfquery>

<cfset ti_total = 0>
<cfloop query="check_title_ins">
<cfset ti_total = ti_total + check_title_ins.amount>
</cfloop>
<cfset alta_charge = ti_total * .1> 
 
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(alta_charge, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + alta_charge>
</cfif>


<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(alta_charge, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + alta_charge>
</cfif>

<cfelseif arguments.property_state EQ "DE">
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>

<cfelseif arguments.property_state EQ "FL">
<cfset alta9 = 0>
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif (arguments.property_state eq "FL") and (a_ins_premium NEQ "Call for quote!") and (IsNumeric(a_ins_premium))>
<cfif arguments.transaction_type eq 'Purchase' and arguments.loan_amount eq 0>
<cfset alta9 =	 #pre_35_ins_premium#/10>
<cfelse>
<cfset alta9 =	 #a_ins_premium#/10>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(alta9, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + alta9>
</cfif>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>

<cfelseif arguments.property_state EQ "IL">
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>

<cfelseif arguments.property_state EQ "IA">
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>

<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>

<cfelseif arguments.property_state EQ "LA">
<!--- optional ALTAs --->
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(80, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 80>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(80, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 80>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(80, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 80>
</cfif>

<cfelseif arguments.property_state EQ "ME">
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>

<cfelseif arguments.property_state EQ "MS">
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(35, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(35, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(35, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(35, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 35>
</cfif>


<cfelseif arguments.property_state EQ "MT">

<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(20, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 20>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(20, '_____.__'), "Buyer", 1)>


<cfset total_alta = total_alta + 20>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(20, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 20>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(20, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 20>
</cfif>

<cfelseif arguments.property_state EQ "NE">
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>

<cfelseif arguments.property_state EQ "NV">
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>

<cfelseif arguments.property_state EQ "NH">
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>

<cfelseif arguments.property_state EQ "NJ">
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>

<cfelseif arguments.property_state EQ "NY" and IsNumeric(a_ins_premium)>
<cfset alta9 =	0>
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfset alta9 =	 #a_ins_premium#/10>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(alta9, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + alta9>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(25, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 25>
</cfif>

<cfelseif arguments.property_state EQ "PA" and IsNumeric(a_ins_premium)>
<cfset alta9 =	0>
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
<cfset alta9 =	 #a_ins_premium#/10>
</cfif>
<cfif alta9 lt 75>
<cfset alta9 = 75>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(alta9, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + alta9>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>

<cfelseif arguments.property_state EQ "TN" and IsNumeric(a_ins_premium)>
<!--- optional ALTAs --->
<cfset alta6 =	 #a_ins_premium#/10>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(alta6, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + alta6>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(alta6, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + alta6>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(alta6, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + alta6>
</cfif>

<cfelseif arguments.property_state EQ "OH">
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(150, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 150>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(100, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 100>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 50>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(100, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 100>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 75>
</cfif>

<cfelseif arguments.property_state EQ "WV">
<cfif arguments.opt_alta_8_1 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 8.1 Endorsement Fee", NumberFormat(15, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 15>
</cfif>
<cfif arguments.opt_alta_9 eq 1 or trigger_stifel eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 9 Endorsement fee", NumberFormat(15, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 15>
</cfif>
<!--- optional ALTAs --->
<cfif arguments.opt_alta_4 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4 Endorsement Fee", NumberFormat(15, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 15>
</cfif>
<cfif arguments.opt_alta_4_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 4.1 Endorsement Fee", NumberFormat(15, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 15>
</cfif>
<cfif arguments.opt_alta_5 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5 Endorsement Fee", NumberFormat(15, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 15>
</cfif>
<cfif arguments.opt_alta_5_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 5.1 Endorsement Fee", NumberFormat(15, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 15>
</cfif>
<cfif arguments.opt_alta_6 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6 Endorsement Fee", NumberFormat(15, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 15>
</cfif>
<cfif arguments.opt_alta_6_1 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.1 Endorsement Fee", NumberFormat(15, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 15>
</cfif>
<cfif arguments.opt_alta_6_2 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 6.2 Endorsement Fee", NumberFormat(15, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 15>
</cfif>
<cfif arguments.opt_alta_7 eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "ALTA 7 Endorsement Fee", NumberFormat(15, '_____.__'), "Buyer", 1)>
<cfset total_alta = total_alta + 15>
</cfif>

<cfelseif arguments.property_state EQ "WI">

</cfif>


</cffunction>
<!--- end ALTAS --->

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
<cfargument name="previous_purch_year" default=1>
<cfargument name="previous_purch_month" default=1996>
<cfargument name="previous_purch_amount" default=0>
<cfargument name="enhanced_coverage" type="string" default="0">
<cfargument name="same_lender" type="string" default="0">
<cfargument name="reissue_rates" type="string" default="0">
<cfargument name="jlp_policy" type="string" default="0">
<cfargument name="property_report" type="string" default="0">
<cfargument name="appraised_value" type="string" default="0">
<cfargument name="seller_paid_lender_policy" type="string" default="0">
<cfargument name="seller_paid_owner_policy" type="string" default="0">
<cfargument name="buyer_paid_lender_policy" type="string" default="0">
<cfargument name="buyer_paid_owner_policy" type="string" default="0">
<cfargument name="asset_manager" type="string" default="">
<cfargument name="opt_alta_4" type="string" default="0">
<cfargument name="opt_alta_4_1" type="string" default="0">
<cfargument name="opt_alta_5" type="string" default="0">
<cfargument name="opt_alta_5_1" type="string" default="0">
<cfargument name="opt_alta_6" type="string" default="0">
<cfargument name="opt_alta_6_1" type="string" default="0">
<cfargument name="opt_alta_6_2" type="string" default="0">
<cfargument name="opt_alta_7" type="string" default="0">
<cfargument name="opt_alta_8_1" type="string" default="0">
<cfargument name="opt_alta_9" type="string" default="0">


<cfargument name="opt_tx_1" type="string" default="1">
<cfargument name="opt_tx_2" type="string" default="1">
<cfargument name="opt_tx_3" type="string" default="1">
<cfargument name="opt_tx_4" type="string" default="1">
<cfargument name="opt_tx_5" type="string" default="1">
<cfargument name="opt_tx_6" type="string" default="1">
<cfargument name="opt_tx_7" type="string" default="0">
<cfargument name="opt_tx_8" type="string" default="0">
<cfargument name="opt_tx_9" type="string" default="0">
<cfargument name="opt_tx_10" type="string" default="0">

<cfargument name="opt_ut_4" type="string" default="0">
<cfargument name="opt_ut_41" type="string" default="0">
<cfargument name="opt_ut_5" type="string" default="0">
<cfargument name="opt_ut_51" type="string" default="0">
<cfargument name="opt_ut_6" type="string" default="0">
<cfargument name="opt_ut_61" type="string" default="0">
<cfargument name="opt_ut_62" type="string" default="0">
<cfargument name="opt_ut_81" type="string" default="0">
<cfargument name="opt_ut_9" type="string" default="0">

<cfargument name="opt_sd_comp" type="string" default="0">
<cfargument name="opt_sd_balloon" type="string" default="0">
<cfargument name="opt_sd_credit" type="string" default="0">
<cfargument name="opt_sd_7" type="string" default="0">
<cfargument name="opt_sd_6" type="string" default="0">
<cfargument name="opt_sd_4" type="string" default="0">
<cfargument name="opt_sd_5" type="string" default="0">
<cfargument name="opt_sd_9" type="string" default="0">
<cfargument name="opt_sd_8" type="string" default="0">

<cfargument name="cema" type="string" default="0">

<cfargument name="transfer_tax_paid_by" type="string" default="">
<cfargument name="title_id"  default="">
<cfargument name="first_time_buyer"  default="0">
<cfargument name="encompass"  default="0">
<cfargument name="underwriter_choice"  default="0">
<cfargument name="delinquency"  default="0">
<cfargument name="insured"  default="">
<cfif Trim(previous_loan_amount) eq ''>
<cfset previous_loan_amount = 0>
</cfif>

<cfif arguments.underwriter_choice eq '25' and (arguments.property_state eq 'MD' or arguments.property_state eq 'DC')>
<cfset arguments.reissue_rates = 0>
</cfif>

<cfset total_1101 = 0>
<cfset roll_up_1101 = 0>
<cfset roll_up_1104 = 0>
<cfset roll_up_1201 = 0>
<cfset roll_up_1203 = 0>
<cfset roll_up_1301 = 0>
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
<cfif isDefined("session.comp_id") AND Len(session.comp_id)>
<CFQUERY datasource="#request.dsn#" NAME="insert_hit">
Insert into Fee_Generator_Hits (date_of_use, comp_id, state, transaction_type)
values (#createodbcdatetime(now())#, #session.comp_id#, '#arguments.property_state#', '#arguments.transaction_type#')
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="insert_hit">
Insert into Fee_Generator_Hits (date_of_use, comp_id, state, transaction_type)
values (#createodbcdatetime(now())#, #arguments.company_id#, '#arguments.property_state#', '#arguments.transaction_type#')
</CFQUERY>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="get_all_comp_info">
SELECT * FROM Companies where ID = #trim(arguments.company_id)#
</CFQUERY>
<cfset fees_query = QueryNew("Line_Number, Description, Amount, Payer, Outside, Payto")>	

<cfset temp = #GetRecFees(arguments.transaction_type,arguments.property_state,arguments.property_county,arguments.property_city,arguments.loan_amount,arguments.purchase_price,arguments.previous_loan_amount,arguments.property_use_type,arguments.company_id,arguments.return_data,arguments.previous_loan_month,arguments.previous_loan_year,arguments.previous_purch_year,arguments.previous_purch_month,arguments.previous_purch_amount,arguments.enhanced_coverage,arguments.same_lender,arguments.reissue_rates,arguments.jlp_policy,arguments.property_report,arguments.appraised_value,arguments.seller_paid_lender_policy,arguments.seller_paid_owner_policy,arguments.buyer_paid_lender_policy,arguments.buyer_paid_owner_policy,arguments.asset_manager,arguments.cema,arguments.transfer_tax_paid_by,arguments.title_id,arguments.first_time_buyer,arguments.encompass,arguments.underwriter_choice,arguments.delinquency,arguments.insured)#>


<cfset pre_enhanced_amount = 0>
<cfset buyers_portion_owner_policy = 0>
<cfif arguments.property_report eq 0>

<cfif arguments.company_id eq 2632>
<cfset title_co_name = "Axiom Title">
<cfelseif  arguments.company_id eq 3722 or arguments.company_id eq 4752>
<cfset title_co_name = "Community Real Estate Services, LLC">
<cfelse>
<cfset title_co_name = "First Title & Escrow, Inc.">
</cfif>


<!--- 1109 TITLE INSURANCE --->
<!--- is this an ROA Hutton file, even though it's a refi, needs to record Title Insurance as if it's a purchase, so we'll temporarily make this a purchase, figure out TI, then change it back to a refi --->
<cfif arguments.company_id eq 3276 or arguments.company_id eq 3943 or arguments.company_id eq 4043 or arguments.company_id eq 4042 or arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702>
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
<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", NumberFormat(a_ins_premium, '_____.__'), "Buyer", 1)>

<cfset roll_up_1101 = roll_up_1101 + a_ins_premium>
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
<cfset underwriter_name = "Stewart Title Guaranty Company">

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

<cfif Mid(get_all_comp_info.company,1,10) eq 'First Home'>
<cfset read_title_companies_states.title_co_id = 29>
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
<cfelseif read_title_companies_states.title_co_id eq 29>
<cfset underwriter_table = "rate_table_chicago">
<cfelse>
<cfset underwriter_table = "rate_table_stewart">
</cfif>

<cfif underwriter_choice eq 16>
<cfset underwriter_table = "rate_table_stewart">
<cfelseif underwriter_choice eq 25>
<cfset underwriter_table = "rate_table_first_american">
<cfelseif underwriter_choice eq 29>
<cfset underwriter_table = "rate_table_chicago">
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
</cfif>



<!--- simultaneous issue fees --->
<cfset simul_rate = 0>
<cfset first_american_simul_rate_MD = 150>
<cfset first_american_simul_rate_VA = 150>
<cfset stewart_simul_rate_MD = 50>
<cfset stewart_ENHANCED_simul_rate_MD = 75>
<cfset stewart_simul_rate_VA = 100>
<cfset stewart_simul_rate_DC = 100>

<cfif underwriter_table contains 'stewart'>

<cfif arguments.property_state eq 'MD'>
	<cfif arguments.enhanced_coverage eq 1 and arguments.transaction_type eq 'Purchase'>
	<cfset simul_rate = stewart_ENHANCED_simul_rate_MD>
	<cfelse>
	<cfset simul_rate = stewart_simul_rate_MD>
	</cfif>
<cfelseif arguments.property_state eq 'VA'>
<cfset simul_rate = stewart_simul_rate_VA>
<cfelseif arguments.property_state eq 'DC'>
<cfset simul_rate = stewart_simul_rate_DC>
</cfif>

<cfelseif underwriter_table contains 'first_american'>

<cfif arguments.property_state eq 'MD'>
<cfset simul_rate = first_american_simul_rate_MD>
<cfelseif arguments.property_state eq 'VA'>
<cfset simul_rate = first_american_simul_rate_VA>
</cfif>

<cfelseif underwriter_table contains 'chicago'>

<cfif arguments.property_state eq 'MD'>
<cfset simul_rate = 50>
<cfelseif arguments.property_state eq 'VA'>
<cfset simul_rate = 150>
<cfelseif arguments.property_state eq 'DC'>
<cfset simul_rate = 100>
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
<!--- tthis part checks to see that whatever table is selected, that it has fees in it, and if not, it'll default back to the regular (Ticor) tables) --->
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

<cfif get_table.table_to_use eq 'StateVirginiaStewart' and arguments.enhanced_coverage eq '1' and arguments.transaction_type eq 'Purchase'>
<cfset get_table.table_to_use = 'StateVirginiaStewartEnhanced'>
</cfif>
<cfif get_table.table_to_use eq 'StateVirginiaFirstAmerican' and arguments.enhanced_coverage eq '1' and arguments.transaction_type eq 'Purchase'>
<cfset get_table.table_to_use = 'StateVirginiaFirstAmericanEnhanced'>
</cfif>

<cfif get_table.table_to_use eq 'StateMichiganStewart' and arguments.enhanced_coverage eq '1' and arguments.transaction_type eq 'Purchase'>
<cfset get_table.table_to_use = 'StateMichiganStewartEnhanced'>
</cfif>

<!--- this part checks if a company has its own custom rate table, and if it does, we'll use that --->
<cfif Len(get_all_comp_info.custom_rate_table) and get_all_comp_info.custom_rate_table neq 0 and arguments.property_state eq 'IL'>
<cfset get_table.table_to_use = get_all_comp_info.custom_rate_table>
</cfif>


<cfset out_of_range = 0>

<cfif arguments.transaction_type eq 'Purchase'>
<CFSET   x_final  = #Round(arguments.purchase_price)#>
<cfelse>
<cfif NOT IsNumeric(arguments.loan_amount) or arguments.loan_amount eq '' or arguments.loan_amount eq 'NULL'>
<CFSET   arguments.loan_amount = 0>
</cfif>
<CFSET   x_final  = #Round(arguments.loan_amount)#>
</cfif>			
<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to>= #x_final# order by a_to
</CFQUERY>

<cfif read_ins_calc.recordcount eq 0>
<cfset out_of_range = 1>
</cfif>


<cfif (arguments.transaction_type eq "Refinance" or arguments.transaction_type eq "Reverse Mortgage")>
<CFIF (arguments.company_id eq 1847 or arguments.company_id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
<CFSET a_ins_premium = #read_ins_calc.expedite#>
<cfelse>
<cfif arguments.property_state eq 'MI'>
<cfif IsNumeric(read_ins_calc.sale) and read_ins_calc.sale NEQ 'Call for Quote!'>
<CFSET a_ins_premium = (read_ins_calc.sale * .60)>
<cfelse>
<CFSET a_ins_premium = "Call for Quote!">
</cfif>
<cfelse>


<cfif arguments.underwriter_choice eq '25' and arguments.property_state eq 'MD' and arguments.enhanced_coverage eq 1>
<CFSET a_ins_premium = #read_ins_calc.enhanced_lenders#>
<cfelse>
<CFSET a_ins_premium = #read_ins_calc.Refinance#>
</cfif>


</cfif>
</CFIF>

<cfelseif arguments.transaction_type eq "Purchase">
<cfif a_ins_premium neq 'Call for Quote!'>
<CFSET a_ins_premium = #read_ins_calc.sale#>
</cfif>

<cfelseif arguments.transaction_type contains "Second Mortgage">
<CFSET a_ins_premium = #read_ins_calc.second_mortgage#>
</cfif>			



<cfif arguments.property_state eq 'NV' and arguments.transaction_type eq 'Refinance'>
<CFSET a_ins_premium = read_ins_calc.sale>
<cfset NumYears = 0>
<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfcatch>
<cfset NumYears = 0>
</cfcatch>
</cftry>

<cfif NumYears  LTE 3>
<CFSET a_ins_premium = read_ins_calc.short_term>
</cfif>
</cfif>




<!--- 1. Purchases and seconds hsould be charged basic rate 2. Refinances should be charged "re-issue" rate which is 90% of basic, unless loan last loan was done within last 4 yrs. Discount is given for loan less than 2 yrs (charge 70% of re-issue), and loan between 2 and 4 yrs old (charge 80% of re-issue). As a result, we will need to add loan date info in box, just like in other states  --->


<cfif arguments.property_state eq 'PA' and arguments.transaction_type eq 'Refinance' and read_ins_calc.sale gt 0>

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

<CFQUERY datasource="#request.dsn#" NAME="check_streamline">
SELECT * FROM companies where (id = #arguments.company_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="is_shapiro">
SELECT * FROM companies where (id = 2368 or master_co_id = 2368) and (id <> 3568)
</CFQUERY>
<cfset all_shapiro = ValueList(is_shapiro.ID, ",")>

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


<cfset a_ins_premium = #GetReissuerates(a_ins_premium, arguments.previous_loan_year, arguments.previous_loan_month,  arguments.previous_purch_year, arguments.previous_purch_month, arguments.previous_purch_amount, arguments.transaction_type, arguments.property_state, arguments.previous_loan_amount, arguments.loan_amount, arguments.company_id,  arguments.reissue_rates,  arguments.underwriter_choice)#>

<cfset temp = GetSubrates(a_ins_premium, arguments.previous_loan_year, arguments.previous_loan_month,  arguments.previous_purch_year, arguments.previous_purch_month, arguments.previous_purch_amount, arguments.transaction_type, arguments.same_lender, arguments.property_state, arguments.previous_loan_amount, arguments.loan_amount)>

<!--- if this is Chase, we need to take 70% off the current title ins premium, and record this new number for future use in the code (line 1101) --->
<cfif arguments.company_id eq 3343>
<cfif a_ins_premium lt 200>
<cfset a_ins_premium = 200>
</cfif>
<cfset chase_ti = a_ins_premium>
</cfif>
<!--- end --->

<!--- if this is Axcidion, and loan is less than, they get a 40% discount, then use the resulting number to figure out 1101 --->
<cfif (arguments.company_id eq 3492 or  arguments.company_id eq 5223) and arguments.loan_amount LT 500000>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>


<cfif (arguments.company_id eq 3492 or arguments.company_id eq 5223) and arguments.loan_amount LT 500000 and arguments.transaction_type neq 'Purchase'>
<cfset a_1101 = 1070 - 320 - a_ins_premium>
<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1070, '_____.__'), "Buyer")>
<cfif a_1101 gt 0>
<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
<cfset total_1101 = total_1101 + a_1101>
</cfif>
</cfif>



<!--- take this out if it doesn't solve the problem --->
<cfif (arguments.property_state eq 'MI' and arguments.transaction_type eq 'Refinance') and IsNumeric(read_ins_calc.sale)>
<cfset a_ins_premium = read_ins_calc.sale * .6>
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
<cfset new_ins_premium = a_ins_premium>


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


<!--- ALL Purchases --->
<CFIF arguments.transaction_type eq "Purchase">

<!-- this next chunk figures out simul rates for various states --->
<cftry>
<CFQUERY datasource="#request.dsn#" NAME="check_for_simul" maxrows="1">
	SELECT * FROM #get_table.table_to_use# order by a_to
</CFQUERY>
<cfif IsNumeric(check_for_simul.simul_rate) and check_for_simul.simul_rate neq 'NULL'>
<cfset simul_rate = check_for_simul.simul_rate>
</cfif>
<cfcatch type="any"></cfcatch></cftry>

<!--- these states use a formula to determine the simul_rate --->
<cfif  arguments.property_state eq 'AR'>
<CFSET   x_final  = #Round(arguments.purchase_price)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_simul" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset full_owners_simul = read_owners_simul.simul_rate>
    <cfset simul_rate = (read_owners_simul.simul_rate - read_owners_simul.sale)>



<cfelseif arguments.property_state eq 'CA'>
<CFSET   x_final  = #Round(arguments.purchase_price)#>
<CFSET   x_final2  = #Round(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final2# order by a_to
	</CFQUERY>
<cfif read_owners_ins_calc.sale GT read_owners_ins_calc.refinance>
<cfset full_owners_simul = (read_lenders_ins_calc.refinance + 500)>
<cfelse>
<cfset full_owners_simul = (read_owners_ins_calc.sale + 500)>
</cfif>


<cfelseif arguments.property_state eq 'ID'>
<CFSET   x_final  = #Round(arguments.purchase_price)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfif x_final LTE 500000>
	<cfset simul_rate = 75>
	<cfelse>
	<cfset simul_rate = (read_owners_ins_calc.sale * .10) >
	<cfif simul_rate LT 75>
	<cfset simul_rate = 75>
	</cfif>
	</cfif>
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>



<cfelseif arguments.property_state eq 'NY'>
<CFSET   x_final  = #Round(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset simul_rate = (read_owners_ins_calc.sale * .30) >
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>

<cfelseif arguments.property_state eq 'NC'>
<CFSET   x_final  = #Round(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
<CFSET   x_final  = #Round(arguments.purchase_price)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfif read_lenders_ins_calc.refinance GT read_owners_ins_calc.sale>
	<cfset full_owners_simul = read_lenders_ins_calc.refinance>
	<cfelse>
	<cfset full_owners_simul = read_owners_ins_calc.sale>
	</cfif>


<cfelseif arguments.property_state eq 'NV'>
<CFSET   x_final  = #Round(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset simul_rate = (read_owners_ins_calc.simul_rate) >
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>


<cfelseif arguments.property_state eq 'ND'>
<CFSET   x_final  = #Round(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
    <cfset simul_rate = (read_lenders_ins_calc.sale * .30) >
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>

<cfelseif arguments.property_state eq 'SD'>
<CFSET   x_final  = #Round(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset simul_rate = (read_owners_ins_calc.simul_rate) >
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>

<cfelseif arguments.property_state eq 'UT'>
<CFSET   x_final  = #Round(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
    <cfset simul_rate = (read_lenders_ins_calc.sale * .20) >
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>


<cfelseif arguments.property_state eq 'WI'>
		<CFSET   x_final  = #Round(arguments.loan_amount)#>
		
		<cfif x_final GTE 1000000>
		<cfset simul_rate = 800>
		<cfelseif x_final GTE 400000>
		<cfset simul_rate = 650>
		<cfelseif x_final GTE 300000>
		<cfset simul_rate = 500>
		<cfelseif x_final GTE 250000>
		<cfset simul_rate = 400>
		<cfelseif x_final GTE 15000>
		<cfset simul_rate = 250>
		<cfelse>
		<cfset simul_rate = 150>
		</cfif>
		<cfset full_owners_simul = read_ins_calc.sale + simul_rate>


<cfelseif arguments.property_state eq 'MI' and arguments.loan_amount gt 0>
 <CFSET   x_final  = #Round(arguments.loan_amount)#>
	<cfif arguments.loan_amount gt 0>
	<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	</cfif>
	<cfif arguments.loan_amount LTE 47000>
	<CFQUERY datasource="#request.dsn#" NAME="get_simul" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= 1000 order by a_to
	</CFQUERY>
    <cfset simul_rate = get_simul.sale>
    <cfelse>
	<cfset simul_rate = read_lenders_ins_calc.sale * .5>
    </cfif>
<cfset full_owners_simul = read_ins_calc.sale + simul_rate>
<cfelse>
<cfset full_owners_simul = read_ins_calc.sale>
</cfif>


<cfset seller_paid_owners = 0>
<cfset owners_amount = 0>
<cfset seller_paid_lenders = 0>
<cfset buyer_paid_owners = 0>
<cfset buyer_paid_lenders = 0>
<!--- these states use the simul_rate listed in their rate table --->
<cfif arguments.property_state eq 'MD' or arguments.property_state eq 'AL' or arguments.property_state eq 'AK'  or arguments.property_state eq 'CT' or arguments.property_state eq 'DE' or arguments.property_state eq 'DC' or arguments.property_state eq 'FL' or arguments.property_state eq 'GA' or arguments.property_state eq 'HI' or arguments.property_state eq 'IL' or arguments.property_state eq 'IN' or arguments.property_state eq 'KS' or arguments.property_state eq 'AZ' or arguments.property_state eq 'LA' or arguments.property_state eq 'MA' or arguments.property_state eq 'ME' or arguments.property_state eq 'MS' or arguments.property_state eq 'MO' or arguments.property_state eq 'MT' or arguments.property_state eq 'NE' or arguments.property_state eq 'NH' or arguments.property_state eq 'NM' or arguments.property_state eq 'OH' or arguments.property_state eq 'OK' or arguments.property_state eq 'OR' or arguments.property_state eq 'RI' or arguments.property_state eq 'SC' or arguments.property_state eq 'WV' or arguments.property_state eq 'TN' or arguments.property_state eq 'MN' or arguments.property_state eq 'KY'>
<cfif IsNumeric(read_ins_calc.sale)>

<cfif arguments.property_state eq 'MD' and arguments.enhanced_coverage eq 1 and arguments.underwriter_choice eq 25>
<cfset full_owners_simul = read_ins_calc.enhanced_owners + simul_rate>
<cfelse>
<cfset full_owners_simul = read_ins_calc.sale + simul_rate>
</cfif>
<cfelse>
<cfset full_owners_simul = read_ins_calc.sale>
</cfif>



<cfif arguments.loan_amount GT arguments.purchase_price>
<CFSET   x_final  = #Round(arguments.loan_amount-arguments.purchase_price)#>
	<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>

<cfif property_state eq 'AL' or property_state eq 'DC'> 
<cfset full_owners_simul = full_owners_simul + (read_lenders_ins_calc.sale * .30)>
</cfif>
<cfif property_state eq 'AK'> 
<cfset full_owners_simul = full_owners_simul + (read_lenders_ins_calc.sale * .80)>
</cfif>
<cfif property_state eq 'MA'> 
<cfset full_owners_simul = full_owners_simul + (read_lenders_ins_calc.refinance)>
</cfif>
<cfif property_state eq 'LA'> 
<cfset full_owners_simul = full_owners_simul + (read_lenders_ins_calc.refinance)>
</cfif>
</cfif>
<cfelse>
<!--- if not one of the that uses the simul_rate in the table, and not one that use a formula above, then the simul_rate is coded into the table as part of the "sale" field --->
 <cfif arguments.property_state neq 'AR' and arguments.property_state neq 'CA' and arguments.property_state neq 'ID' and arguments.property_state neq 'NY' and arguments.property_state neq 'NC' and arguments.property_state neq 'ND' and arguments.property_state neq 'UT' and arguments.property_state neq 'WI' and arguments.property_state neq 'MI' and arguments.property_state neq 'NV'>
	<cfset full_owners_simul = read_ins_calc.sale>
 </cfif>
</cfif>

<cfset full_lenders = 0>
<cfset set_amount2 = 0>




<cfif NOT IsNumeric(arguments.loan_amount)>
<cfset arguments.loan_amount = 0>
</cfif>
<CFSET   x_final  = #Round(arguments.loan_amount)#>
	<cfif arguments.loan_amount gt 0>
	<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset full_lenders = read_ins_calc.refinance>
	</cfif>
<cfset lenders_amount = full_lenders>


<cftry>
<cfset owners_amount = full_owners_simul - full_lenders>
<cfcatch type="any"></cfcatch></cftry>


<cfif owners_amount gt 0>
<cfset buyer_paid_owners = owners_amount>
<cfelse>
<cfset buyer_paid_owners = simul_rate>
</cfif>


<cfset buyer_paid_lenders = lenders_amount>
	<cfif arguments.enhanced_coverage eq 1>
		<cfif arguments.property_state neq 'MD' and arguments.property_state neq 'VA'  and arguments.property_state neq 'MI'  and arguments.property_state neq 'NJ'>
		<cfif full_owners_simul neq 'Call for Quote!' and full_owners_simul neq ''>
		<cfset pre_enhanced_amount = (full_owners_simul - simul_rate) * .80>
		</cfif>
		</cfif>
	<!--- MD & VA  Purchases with enhanced Coverage, need to find out the pre-enhanced amount so we can substract it later if needed --->
		<cfif get_table.table_to_use eq 'StateMarylandStewartEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateMarylandStewart WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateMarylandFirstAmerican'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateMarylandFirstAmerican WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateVirginiaStewartEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateVirginiaStewart WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateVirginiaFirstAmericanEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateVirginiaFirstAmerican WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateMichiganStewartEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateMichiganStewart WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		</cfif>
		
	</cfif>


<cfif arguments.seller_paid_owner_policy eq 1 or (arguments.property_state eq 'IL' and arguments.buyer_paid_owner_policy neq 1)>
	<cfif arguments.enhanced_coverage eq 1>
		<cftry>
		<!--- <cfset seller_paid_owners = pre_enhanced_amount - buyer_paid_lenders> --->
		<cfset seller_paid_owners = buyer_paid_owners - (full_owners_simul - pre_enhanced_amount)>
		<cfcatch type="any">
		<cfset seller_paid_owners = 'Call for Quote'>
		</cfcatch>
		</cftry>
		<!--- <cfset buyer_paid_owners = full_owners_simul - pre_enhanced_amount> --->
		<cftry>
		<cfset buyer_paid_owners = buyer_paid_owners - seller_paid_owners>
		<cfcatch type="any">
		<cfset buyer_paid_owners = 'Call for Quote'>
		</cfcatch>
		</cftry>
	<cfelse>
		<cfset seller_paid_owners = full_owners_simul>
		<cfset buyer_paid_owners = 0>
		<cfif arguments.loan_amount gt 0>
			<cftry>
			<cfset seller_paid_owners = full_owners_simul - full_lenders>
			<cfset buyer_paid_lenders = full_lenders>
			<cfcatch type="any">
			<cfset seller_paid_owners = 'Call for Quote'>
			</cfcatch>
			</cftry>
			<cfset buyer_paid_owners = 0>
		</cfif>
	</cfif>	
</cfif>
	

	<cfif arguments.seller_paid_lender_policy eq 1>
	<cfset seller_paid_lenders = full_lenders - simul_rate>
	<cfset buyer_paid_lenders = simul_rate>
	</cfif>


<cfif arguments.property_state eq 'TX'>
<cfset underwriter_name = 'Fidelity National Title'>
<cfset title_co_name = 'Allegiance Title Company'>
</cfif>

<cfif buyer_paid_owners neq 0>
<cftry>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", NumberFormat(buyer_paid_owners, '_____.__'), "Buyer",0, underwriter_name)>
<cfcatch type="any">
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", "Call for Quote!", "Buyer",0, underwriter_name)>
</cfcatch>
</cftry>
</cfif>
<cfif buyer_paid_lenders neq 0>
<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", buyer_paid_lenders, "Buyer",1,title_co_name)>
<cfif IsNumeric(buyer_paid_lenders)>
<cfset roll_up_1101 = roll_up_1101 + buyer_paid_lenders>
</cfif>
</cfif>

<cfif seller_paid_owners eq 'Call for Quote'>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", seller_paid_owners, "Seller", 0, underwriter_name)>
<cfelseif seller_paid_owners neq 0>
<cfif arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", NumberFormat(seller_paid_owners, '_____.__'), "Buyer",0, underwriter_name)>
<cfelse>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", NumberFormat(seller_paid_owners, '_____.__'), "Seller", 0, underwriter_name)>
</cfif>
</cfif>
<cfif seller_paid_lenders neq 0>
<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", NumberFormat(seller_paid_lenders, '_____.__'), "Seller", 0, title_co_name)>
</cfif>

</cfif>

<cfif arguments.transaction_type eq 'Purchase' and out_of_range eq 1>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", "Call for Quote!", "Buyer",0, underwriter_name)>
</cfif>


<cfif a_ins_premium neq 0 and trim(a_ins_premium) neq '' and arguments.transaction_type neq 'Purchase'>
<cfif current_ins_premium NEQ "" and current_ins_premium LT a_ins_premium >
<cfset a_ins_premium = current_ins_premium>
</cfif>

<cfif arguments.property_state eq 'CO' and IsDefined("new_ins_premium")>
<cfset a_ins_premium = new_ins_premium>
</cfif>
<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", a_ins_premium, "Buyer", 1, title_co_name)>
<cfif IsNumeric(a_ins_premium)>
 <cfset roll_up_1101 = roll_up_1101 + a_ins_premium>
</cfif>
</cfif>

</cfif>

<!--- is this an ROA Hutton file, even though it's a refi, needs to record Title Insurance as if it's a purchase, so we've already temporarily made this a purchase, and figured out TI, so now lets change it back to a refi --->			
<cfif arguments.company_id eq 3276 or arguments.company_id eq 3943 or arguments.company_id eq 4043 or arguments.company_id eq 4042 or arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702>
<cfset arguments.transaction_type = "Refinance">
</cfif>

</cfif>
	
<cfif arguments.loan_amount gt 0>
<cfset temp = AddQueryItem(1105, "Lender's Title Policy Limit - (" & DollarFormat(arguments.loan_amount) & ")" , arguments.loan_amount, "Buyer", 1)>
</cfif>
<cfif arguments.purchase_price gt 0>
<cfset temp = AddQueryItem(1106, "Owner's Title Policy Limit - (" & DollarFormat(arguments.purchase_price) & ")" , arguments.purchase_price, "Buyer", 1)>
</cfif>


<cfset total_ti = 0>
<cfset county_ti_tax = 0>
<cfset city_ti_tax = 0>
<cfloop query="fees_query">
<cfif (fees_query.line_number eq 1103 or fees_query.line_number eq 1104) and IsNumeric(fees_query.amount)>
<cfset total_ti = total_ti + fees_query.amount>
</cfif>
</cfloop>

<cfif arguments.property_state eq 'KY'>
<cfset city_ti_tax = 0>
<cfset county_ti_tax = 0>
<cfif read_rec_fees.ti_premium_tax_county neq 'NULL' and read_rec_fees.ti_premium_tax_county neq ''>
<cfset county_ti_tax = total_ti * read_rec_fees.ti_premium_tax_county>
<cfif county_ti_tax GT 0>
<cfset temp = AddQueryItem(DetermineAltaLine(), "County Title Insurance Premium Tax", NumberFormat(county_ti_tax, '_____.__'), "Buyer", 0)>
</cfif>
</cfif>
<cfif read_rec_fees.ti_premium_tax_city neq 'NULL' and read_rec_fees.ti_premium_tax_city neq ''>
<cfset city_ti_tax = total_ti * read_rec_fees.ti_premium_tax_city>
<cfif city_ti_tax GT 0>
<cfset temp = AddQueryItem(DetermineAltaLine(), "City Title Insurance Premium Tax", NumberFormat(city_ti_tax, '_____.__'), "Buyer", 0)>
</cfif>
</cfif>
</cfif>




		
<!--- here we are going to see if we should get the fees from a different account, if an 'asset manager' is chosen, we'll get the fees from that company, otherwise, we'll get them from the company placing the order --->
<cfif arguments.asset_manager neq '' and arguments.asset_manager neq 'NULL' and arguments.asset_manager neq 0>
<cfset billing_co_id_to_use = arguments.asset_manager>
<cfelse>
<cfset billing_co_id_to_use = arguments.company_id>
</cfif>		




<!--- 1204 Intangible Tax --->
<cfif arguments.company_id neq 3722 and arguments.company_id neq 4752 and arguments.company_id neq 4702>
<CFIF #read_rec_fees.intangible_tax# neq 0 and isnumeric(read_rec_fees.intangible_tax)>
<cfif arguments.transaction_type eq 'Reverse Mortgage'>
<CFSET intang_tax = #round(arguments.loan_amount * 1.5)# * #read_rec_fees.intangible_tax#>
<cfelse>
<CFSET intang_tax = #round(arguments.loan_amount)# * #read_rec_fees.intangible_tax#>
</cfif>
<cfset temp = AddQueryItem(1207, "State tax/stamps: Intangible Tax", NumberFormat(intang_tax, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + intang_tax>
</cfif>
</cfif>

<cfif roll_up_1201 neq 0>
	<cfset temp = AddQueryItem(1201, "Government Recording Charges", NumberFormat(roll_up_1201, '_____.__'), "Buyer", 0)>
</cfif>


<cfif arguments.company_id neq 3722 and arguments.company_id neq 4752 and arguments.company_id neq 4702>


<cfif arguments.transfer_tax_paid_by eq 'Buyer'>
	<cfset temp = AddQueryItem(1203, "Transfer Taxes", NumberFormat(roll_up_1203, '_____.__'), "Buyer", 0)>
<!--- <cfelseif  arguments.transfer_tax_paid_by eq 'Seller'>
	<cfset temp = AddQueryItem(1203, "Transfer Taxes", NumberFormat(roll_up_1203, '_____.__'), "Seller", 0)>
 ---><cfelse>
	<cfset temp = AddQueryItem(1203, "Transfer Taxes", NumberFormat(roll_up_1203, '_____.__'), "Buyer", 0)>
</cfif>
</cfif>


<!--- get custom fees for this client --->
<!--- First let's make sure they even have fees set up for this state, because if not, there's no reason to do it, and it would throw an error anyway --->
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states_HUD2010 WHERE company_id = '#billing_co_id_to_use#' and a_states = '#arguments.property_state#' and county = '#arguments.property_county#'
order by state_id desc
</CFQUERY>
<cfif read_this_sets_billing_states.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states_HUD2010 WHERE company_id = '#billing_co_id_to_use#' and a_states = '#arguments.property_state#'
order by state_id desc
</CFQUERY>
</cfif>




<cfif read_this_sets_billing_states.recordcount neq 0>
<cfset temp = #GetLineCosts(arguments.asset_manager,arguments.company_id,arguments.property_state,arguments.transaction_type,arguments.loan_amount, arguments.delinquency, arguments.cema)#>
</cfif>


 <!--- 1300 Series ALTA --->
<cfset total_alta = 0>



<!--- gonna add up alta fees to add them to lender's title premium so we can split them between agency and underwriter --->
<cfset temp = #GetAltas(arguments.opt_alta_4, arguments.opt_alta_4_1, arguments.opt_alta_5, arguments.opt_alta_5_1, arguments.opt_alta_6, arguments.opt_alta_6_1, arguments.opt_alta_6_2, arguments.opt_alta_7, arguments.opt_alta_8_1, arguments.opt_alta_9, arguments.opt_tx_1, arguments.opt_tx_2, arguments.opt_tx_3, arguments.opt_tx_4, arguments.opt_tx_5, arguments.opt_tx_6, arguments.opt_tx_7, arguments.opt_tx_8, arguments.opt_tx_9, arguments.opt_tx_10, arguments.opt_ut_4, arguments.opt_ut_41, arguments.opt_ut_5, arguments.opt_ut_51, arguments.opt_ut_6, arguments.opt_ut_61, arguments.opt_ut_62, arguments.opt_ut_81, arguments.opt_ut_9, arguments.opt_sd_comp, arguments.opt_sd_balloon, arguments.opt_sd_credit, arguments.opt_sd_7, arguments.opt_sd_6, arguments.opt_sd_4, arguments.opt_sd_5, arguments.opt_sd_9, arguments.opt_sd_8, arguments.property_state, arguments.property_county, arguments.transaction_type, arguments.loan_amount, arguments.company_id)#>

<cfif arguments.property_state eq 'DE'>
<cfset temp = AddQueryItem(DetermineAltaLine(), "Closing Protection Letter", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 75>
</cfif>

<cfif arguments.property_state eq 'PA'>
<cfset temp = AddQueryItem(DetermineAltaLine(), "Tax Search", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 50>
</cfif>


<cfif roll_up_1101 neq 0>
<cfset total_1101 = total_1101 + roll_up_1101>
</cfif>
<cfif total_alta neq 0>
<cfset total_1101 = total_1101 + total_alta>
</cfif>




<cfif total_1101 neq 0 and ((arguments.company_id neq 3492 and arguments.company_id neq 5223) or ((arguments.company_id eq 3492 or arguments.company_id eq 5223) and arguments.loan_amount gte 500000) or ((arguments.company_id eq 3492 or arguments.company_id eq 5223) and arguments.transaction_type eq 'Purchase'))>
<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(total_1101, '_____.__'), "Buyer", 0, "")>
</cfif>



<!--- end --->




<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>


<cfloop query="fee_detail">
<cfif fee_detail.line_number eq 1103>
<cfset owners_premium = fee_detail.amount>
</cfif>
<cfif fee_detail.line_number eq 1104>
<cfset row_num = fee_detail.currentrow>
<cfset pre_alta_lenders_premium = fee_detail.amount>
<cfif IsNumeric(fee_detail.amount)>
<cfset lenders_premium = fee_detail.amount + total_alta>
<cfelse>
<cfset lenders_premium = "Call for Quote!">
</cfif>
<cfif IsNumeric(fee_detail.amount)>
<cfset temp = QuerySetCell(fee_detail, "Amount", lenders_premium, row_num)>
<cfelse>
<cfset temp = QuerySetCell(fee_detail, "Amount", total_alta, row_num)>
</cfif>
<cfset temp = AddQueryItem(999, "Lender's Title Insurance Pre-Alta", pre_alta_lenders_premium, "Buyer", 0, "")>
</cfif>
</cfloop>



<cfparam name="owners_premium" default=0>
<cfparam name="lenders_premium" default=0>
<cfif lenders_premium neq 'Call for Quote!' and owners_premium neq 'Call For Quote!'>

<cfset agency_portion = 0>
<cfset ft_portion = 0>
<cfset total_combined_policies = ReplaceNoCase(lenders_premium, " ", "", "ALL")>

<cftry>
<cfset total_combined_policies = ReplaceNoCase(lenders_premium, " ", "", "ALL") + ReplaceNoCase(owners_premium, " ", "", "ALL")>
<cfcatch type="any"></cfcatch></cftry>




<!--- Missouri uses its own tables for figuring out the splits between underwriter and agency --->
<cfif arguments.property_state eq 'MO'>
<cfset agency_portion = 0>
	<cfif arguments.transaction_type eq 'Purchase'>
	<CFSET   x_final  = #Round(arguments.purchase_price)#>
	<cfelse>
	<CFSET   x_final  = #Round(arguments.loan_amount)#>
	</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_split_rate" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
</CFQUERY>
<cfif arguments.transaction_type eq 'Purchase'>
 <cfset agency_portion = get_split_rate.owners_risk_rate>
<cfelse>
	<cfif arguments.reissue_rates eq 1><!--- if this is a reissue --->
	<cfset agency_portion = get_split_rate.reissue_risk_rate>
	<cfelseif get_all_comp_info.allow_subrates eq 1 and arguments.same_lender eq 1><!--- if this is a sub_rate --->
	<cfset agency_portion = get_split_rate.reissue_risk_rate>
	<cfelse>
	<cfset agency_portion = get_split_rate.loan_risk_rate>
	</cfif>
</cfif>
<cfset ft_portion = total_combined_policies - agency_portion>


<cfelse> <!--- not MO --->


<CFQUERY datasource="#request.dsn#" NAME="get_split">
	Select * from FT_Agency_Splits where agency_id = #read_title_companies_states.title_co_id# and state = '#arguments.property_state#'
</CFQUERY>
	<cfif get_split.recordcount>
	 <cfif get_split.fee_per_thousand neq 'NULL' and get_split.fee_per_thousand neq ''>
	 <cfif arguments.purchase_price gt arguments.loan_amount>
	 <cfset agency_portion = ((arguments.purchase_price/1000) * get_split.fee_per_thousand)>
	 <cfelse>
	 <cfset agency_portion = ((arguments.loan_amount/1000) * get_split.fee_per_thousand)>
	 </cfif>
	 <cfset ft_portion = total_combined_policies - agency_portion>
	 <cfelse>
	 <cfset agency_portion = total_combined_policies * (get_split.agency_percent/100)>
	 <cfset ft_portion = total_combined_policies * (get_split.ft_percent/100)>
	 </cfif>
	<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="get_split">
	Select * from FT_Agency_Splits where agency_id = #read_title_companies_states.title_co_id# and state = 'default'
</CFQUERY>
     <cfif get_split.fee_per_thousand neq 'NULL' and get_split.fee_per_thousand neq ''>
	 <cfset agency_portion = ((arguments.loan_amount/1000) * get_split.fee_per_thousand)>
	 <cfset ft_portion = total_combined_policies - agency_portion>
	 <cfelse>
	 <cfset agency_portion = total_combined_policies * (get_split.agency_percent/100)>
	 <cfset ft_portion = total_combined_policies * (get_split.ft_percent/100)>
	 </cfif>
	</cfif>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  Company_Agency_Assoc_HUD2010
		WHERE billing_id = '#read_this_sets_billing_states.billing_id#'	
</CFQUERY>	


<cfif ft_portion neq 0>
<cfif arguments.property_state eq 'CA'>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to Placer Title - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, "Placer Title")>

<cfelseif arguments.property_state eq 'TX'>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to Allegiance Title Company - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, "Allegiance Title Company")>

<cfelseif arguments.property_state eq 'CT'>
<!--- don't send this line cost --->
<cfelse>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to #title_co_name# - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, title_co_name)>
</cfif>

 </cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_Title_Companies" maxrows="1">		
SELECT *
FROM  title_companies t
where t.title_co_id = #read_title_companies_states.title_co_id#
</CFQUERY>





<cfif agency_portion neq 0>
<cfif property_state eq 'CT'>

<cfset temp = AddQueryItem(1108, "Underwriter's portion of the total title insurance premium to #read_Title_Companies.company# - (" & DollarFormat((agency_portion + ft_portion)) & ")", NumberFormat((agency_portion + ft_portion), '_____.__'), "Buyer", 1, read_Title_Companies.company)>
<cfelseif property_state eq 'TX'>
<cfset temp = AddQueryItem(1108, "Underwriter's portion of the total title insurance premium to Fidelity National Title - (" & DollarFormat(agency_portion) & ")", NumberFormat(agency_portion, '_____.__'), "Buyer", 1, "Fidelity National Title")>
<cfelse>
<cfset temp = AddQueryItem(1108, "Underwriter's portion of the total title insurance premium to #read_Title_Companies.company# - (" & DollarFormat(agency_portion) & ")", NumberFormat(agency_portion, '_____.__'), "Buyer", 1, read_Title_Companies.company)>
</cfif>

</cfif>		
</cfif>



<cfloop query="fees_query">
<cfif fees_query.line_number eq 1104>
<cfset row_num = fees_query.currentrow>
<cfif IsNumeric(fee_detail.amount)>
<cfset lenders_premium = fee_detail.amount + total_alta>
</cfif>
<cfif IsNumeric(fee_detail.amount)>
<cfset temp = QuerySetCell(fee_detail, "Amount", lenders_premium, row_num)>
<cfelse>
<cfset temp = QuerySetCell(fee_detail, "Amount", "Call for Quote!", row_num)>
</cfif>
</cfif>
</cfloop>


<cfif arguments.encompass eq 1>
<cfinclude template="../encompass/encompass_xml_transform.cfm" >
<cfelse>
<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>
</cfif>


<cfloop query="fee_detail">
<cfif IsNumeric(fee_detail.amount)>
<cfset temp = AddXMLItem(fee_detail.line_number, fee_detail.description, NumberFormat(fee_detail.amount, '_____.__'), fee_detail.payer, arguments.company_id, fee_detail.outside, fee_detail.payto)>
<cfelse>
<cfset temp = AddXMLItem(fee_detail.line_number, fee_detail.description, fee_detail.amount, fee_detail.payer, arguments.company_id, fee_detail.outside, fee_detail.payto)>
</cfif>
</cfloop>



<cffile action="write" addnewline="no" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\temp_xml.xml" output="#ReturnXML#" nameconflict="overwrite">

<cfif arguments.return_data eq 2>
<cfset session.XMLOUT = ReturnXML>
</cfif>
<cfreturn fees_query>			
</cffunction>

</cfcomponent>
