 <cfset temp = #GetRecFees(arguments.transaction_type,arguments.property_state,arguments.property_county,arguments.property_city,arguments.loan_amount,arguments.purchase_price,arguments.previous_loan_amount,arguments.property_use_type,arguments.company_id,arguments.return_data,arguments.previous_loan_month,arguments.previous_loan_year,arguments.previous_purch_year,arguments.previous_purch_month,arguments.previous_purch_amount,arguments.enhanced_coverage,arguments.same_lender,arguments.reissue_rates,arguments.jlp_policy,arguments.property_report,arguments.appraised_value,arguments.seller_paid_lender_policy,arguments.seller_paid_owner_policy,arguments.buyer_paid_lender_policy,arguments.buyer_paid_owner_policy,arguments.asset_manager,arguments.cema,arguments.transfer_tax_paid_by,arguments.title_id,arguments.first_time_buyer,arguments.encompass,arguments.underwriter_choice,arguments.delinquency,arguments.insured,arguments.assessed_value,arguments.new_deed,arguments.current_deed_num,arguments.add_or_remove,arguments.add_or_remove_num,arguments.previous_purchase_mortgage)#>

<cftry>
<cfsavecontent variable="xmlrequest" >
    <cfoutput>
    <Request>
<Version>2</Version>
<Authentication>
<UserID>frsttitlet</UserID>
<Password>TE16273</Password>
</Authentication>
<TransactionDate>#DateFormat(Now(),"m/d/yyyy")#</TransactionDate>
<ErnstRequest>
<Version>1</Version>
<TransactionCode>100</TransactionCode>
<DataSource>P</DataSource>
<Property>
<Page></Page>
<County>#property_county#</County>
<City>#property_city#</City>
<State>#property_state#</State>
<EstimatedValue>#purchase_price#</EstimatedValue>
<MortgageAmount>#loan_amount#</MortgageAmount>
<StateQuestions>
<Q1>0</Q1>
<Q2>0</Q2>
<Q3>0</Q3>
<Q4>0</Q4>
<Q5>0</Q5>
<Q6>0</Q6>
<Q7>0</Q7>
<Q8>0</Q8>
<Q9>0</Q9>
<Q10><cfif property_use_type EQ 1>1<cfelse>0</cfif></Q10>
<Q11>0</Q11>
<Q12>0</Q12>
<Q13>0</Q13>
<Q14>0</Q14>
<Q15>0</Q15>
<Q16>0</Q16>
<Q17>0</Q17>
<Q18>0</Q18>
<Q19>0</Q19>
<Q20>0</Q20>
<Q21>0</Q21>
<Q22>0</Q22>
<Q23>0</Q23>
<Q24>0</Q24>
<Q25>0</Q25>
<Q26>0</Q26>
<Q27>0</Q27>
<Q28>0</Q28>
<Q29>0</Q29>
<Q30>0</Q30>
<Q31>0</Q31>
<Q32>0</Q32>
<Q33>0</Q33>
<Q34>0</Q34>
<Q35>0</Q35>
<Q36>0</Q36>
<Q37>0</Q37>
<Q38>0</Q38>
<Q39>0</Q39>
<Q40>0</Q40>
<Q41>0</Q41>
<Q42>0</Q42>
<Q43>0</Q43>
<Q44>0</Q44>
<Q45>0</Q45>
<Q46>0</Q46>
<Q47>0</Q47>
<Q48>0</Q48>
<Q49>0</Q49>
<Q50>0</Q50>
<V1>0</V1>
<V2>0</V2>
<V3>0</V3>
<V4>0</V4>
<V5>0</V5>
<V6>0</V6>
<V7>0</V7>
<V8>0</V8>
<V9>0</V9>
<V10>0</V10>
<V11>0</V11>
<V12>0</V12>
<V13>0</V13>
<V14>0</V14>
<V15>0</V15>
<V16>0</V16>
<V17>0</V17>
<V18>0</V18>
<V19>0</V19>
<V20>0</V20>
<V21>0</V21>
<V22>0</V22>
<V23>0</V23>
<V24>0</V24>
<V25>0</V25>
<V26>0</V26>
<V27>0</V27>
<V28>0</V28>
<V29>0</V29>
<V30>0</V30>
<V31>0</V31>
<V32>0</V32>
<V33>0</V33>
<V34>0</V34>
<V35>0</V35>
<V36>0</V36>
<V37>0</V37>
<V38>0</V38>
<V39>0</V39>
<V40>0</V40>
<V41>0</V41>
<V42>0</V42>
<V43>0</V43>
<V44>0</V44>
<V45>0</V45>
<V46>0</V46>
<V47>0</V47>
<V48>0</V48>
<V49>0</V49>
<V50>0</V50></StateQuestions></Property>
<NumberOfPages>
<Mortgage>#mortgage_pages#</Mortgage>
<Deed>2</Deed></NumberOfPages></ErnstRequest>
</Request>

    </cfoutput>
 </cfsavecontent>

 <!--- Post the Ernst Request to Ernst Web Service --->
 <cfhttp
 url="https://api.ernstpublishing.com/xml_webservice/processxml.asmx/Request"
 method="Post"
 result="httpResponse" >

 <!--- Define No-Compression Header --->
 <cfhttpparam type="formfield"
 name="xmlrequest"
 value="#trim(xmlrequest)#" />
 
 <!--- Trim XML --->

 </cfhttp>
 
<cfset returnxml2 = Replace(httpresponse.filecontent,"&lt;","<","ALL")>
<cfset returnxml2 = Replace(returnxml2,"&gt;",">","ALL")>
<cfset xmlResp = xmlparse(returnxml2)>

<cfquery name="fees_query" dbtype="query">
	select * from fees_query
	where description <> 'Mortgage Recording Fee'
</cfquery>

<cfset arrFees = Xmlsearch(xmlResp,"/:string/:Response/:ErnstResponse/:Display/:Calculation/:HUDRESPA2010/:HUDLine1202/:Mortgage2010")>
<cfif isArray(arrFees) AND ArrayisDefined(arrfees,1)>
<cfset MortgageAmount = arrfees[1].xmlchildren[2].xmltext>

<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query,"Description","Mortgage Recording Fee")>
<cfset temp = QuerySetCell(fees_query,"Line_number","1202")>
<cfset temp = QuerySetCell(fees_query,"Outside","1")>
<cfset temp = QuerySetCell(fees_query,"Payer","Buyer")>
<cfset temp = QuerySetCell(fees_query,"Amount",MortgageAmount)>
</cfif>

<cfquery name="rollup1201" dbtype="query">
	select sum(amount) as sumamount from fees_query
	where line_number = 1202
</cfquery>

<cfset roll_up_1201 = rollup1201.sumamount>

<cfset arrBase = Xmlsearch(xmlResp,"/:string/:Response/:ErnstResponse/:Display/:Calculation/:CFPB2015/:CFPBTax")>

<cfif transaction_type EQ "purchase">
<cfloop array="#arrBase#" index="arr">


<cfset taxtype = arr.xmlchildren[1].xmltext>
<cfif not findnocase("recordation",taxtype) and not findnocase("deed",taxtype) and not findnocase("grant",taxtype) and not findnocase("mortgage",taxtype)>
<cfloop array ="#arr.xmlchildren#" index="arr2">
	<cfif arr2.xmlName EQ "TotalBuyerSplit">
		<cfset temp = QueryAddRow(fees_query)>
		<cfset temp = QuerySetCell(fees_query,"Description",taxtype)>
		<cfset temp = QuerySetCell(fees_query,"Line_number","1204")>
		<cfset temp = QuerySetCell(fees_query,"Outside","1")>
		<cfset temp = QuerySetCell(fees_query,"Payer","Buyer")>
		<cfset temp = QuerySetCell(fees_query,"Amount",arr2.xmltext)>


	</cfif>
	<cfif arr2.xmlName EQ "TotalSellerSplit">
		<cfset temp = QueryAddRow(fees_query)>
		<cfset temp = QuerySetCell(fees_query,"Description",taxtype)>
		<cfset temp = QuerySetCell(fees_query,"Line_number","1204")>
		<cfset temp = QuerySetCell(fees_query,"Outside","1")>
		<cfset temp = QuerySetCell(fees_query,"Payer","Seller")>
		<cfset temp = QuerySetCell(fees_query,"Amount",arr2.xmltext)>


	</cfif>
</cfloop>
</cfif>
	

</cfloop>

</cfif>

<cfcatch>
</cfcatch>
</cftry>





