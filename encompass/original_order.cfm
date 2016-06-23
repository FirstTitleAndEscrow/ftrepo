<CFPARAM NAME="blastname1" DEFAULT="">
<CFPARAM NAME="thirdp" DEFAULT="">
<CFPARAM NAME="zip_id" DEFAULT="0">
<CFPARAM NAME="bfirstname1" DEFAULT="">
<CFPARAM NAME="bminame1" DEFAULT="">
<CFPARAM NAME="bssn1" DEFAULT="">
<CFPARAM NAME="bhphone1" DEFAULT="">
<CFPARAM NAME="bwphone1" DEFAULT="">
<CFPARAM NAME="bext1" DEFAULT="">
<CFPARAM NAME="blastname2" DEFAULT="">
<CFPARAM NAME="bfirstname2" DEFAULT="">
<CFPARAM NAME="bminame2" DEFAULT="">
<CFPARAM NAME="bssn2" DEFAULT="">
<CFPARAM NAME="bhphone2" DEFAULT="">
<CFPARAM NAME="bwphone2" DEFAULT="">
<CFPARAM NAME="bext2" DEFAULT="">
<CFPARAM NAME="slastname1" DEFAULT="">
<CFPARAM NAME="sfirstname1" DEFAULT="">
<CFPARAM NAME="sminame1" DEFAULT="">
<CFPARAM NAME="shphone1" DEFAULT="">
<CFPARAM NAME="sssn1" DEFAULT="">
<CFPARAM NAME="swphone1" DEFAULT="">
<CFPARAM NAME="sext1" DEFAULT="">
<CFPARAM NAME="slastname2" DEFAULT="">
<CFPARAM NAME="sfirstname2" DEFAULT="">
<CFPARAM NAME="sminame2" DEFAULT="">
<CFPARAM NAME="sssn2" DEFAULT="">
<CFPARAM NAME="shphone2" DEFAULT="">
<CFPARAM NAME="swphone2" DEFAULT="">
<CFPARAM NAME="sext2" DEFAULT="">
<CFPARAM NAME="paddress" DEFAULT="">
<CFPARAM NAME="pcity" DEFAULT="">
<CFPARAM NAME="pstate" DEFAULT="">
<CFPARAM NAME="pzip" DEFAULT="">
<CFPARAM NAME="pcounty" DEFAULT="">
<CFPARAM NAME="plegaldesc" DEFAULT="">
<CFPARAM NAME="prop_use_type" DEFAULT="">
<CFPARAM NAME="condo_pud" DEFAULT="">
<CFPARAM NAME="a_comment" DEFAULT="">
<CFPARAM NAME="polender1" DEFAULT="">
<CFPARAM NAME="poacctno1" DEFAULT="">
<CFPARAM NAME="file_upload" DEFAULT="">
<CFPARAM NAME="pophone1" DEFAULT="">
<CFPARAM NAME="polender2" DEFAULT="">
<CFPARAM NAME="poacctno2" DEFAULT="">
<CFPARAM NAME="pophone2" DEFAULT="">
<CFPARAM NAME="SearchType" DEFAULT="">
<CFPARAM NAME="purchase" DEFAULT="">
<CFPARAM NAME="Deedtransfer" DEFAULT="">
<CFPARAM NAME="Insured" DEFAULT="">
<CFPARAM NAME="otherpro" DEFAULT="">
<CFPARAM NAME="loanamt_float" DEFAULT="0">
<CFPARAM NAME="loan_type_111" DEFAULT="">
<CFPARAM NAME="loan_program_333" DEFAULT="">
<CFPARAM NAME="Verifyemail" DEFAULT="">
<CFPARAM NAME="Verifyemail_2" DEFAULT="">
<CFPARAM NAME="Verifyemail_3" DEFAULT="">
<CFPARAM NAME="fax_no" DEFAULT="">
<CFPARAM NAME="RptbyEmail" DEFAULT="">
<CFPARAM NAME="request_icl" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="loan_number" DEFAULT="0">
<CFPARAM NAME="secloan" DEFAULT="0">
<CFPARAM NAME="appraisal_type" DEFAULT="">
<CFPARAM NAME="estimate_value" DEFAULT="">
<CFPARAM NAME="merge2" DEFAULT="">
<CFPARAM NAME="merge3" DEFAULT="">
<CFPARAM NAME="merge1" DEFAULT="">
<CFPARAM NAME="thirdp" DEFAULT="">
<CFPARAM NAME="search_type" DEFAULT="B">
<CFPARAM NAME="ctc_name" DEFAULT="">
<CFPARAM NAME="preproc_name" DEFAULT="">
<CFPARAM NAME="ctc_comment" DEFAULT="THIS FILE WILL BE CLEARED BY">
<CFPARAM NAME="company1" DEFAULT="">
<CFPARAM NAME="company2" DEFAULT="">
<CFPARAM NAME="taxID1" DEFAULT="">
<CFPARAM NAME="taxID2" DEFAULT="">
<CFPARAM NAME="MaxRows" DEFAULT="1">
<CFPARAM NAME="StartRow" DEFAULT="1">
<CFPARAM NAME="vendmgmt" DEFAULT="">
<CFPARAM NAME="taxes" DEFAULT="">
<CFPARAM NAME="vendmgmtIH" DEFAULT="">
<CFPARAM NAME="title_abstract" DEFAULT="">
<CFPARAM NAME="emp" DEFAULT="0">	
<cfparam name="estimated_loan_float" default="0">
<CFPARAM NAME="ordering_co" DEFAULT="0">


<CFPARAM NAME="PropType" DEFAULT="SFR">
<CFPARAM NAME="order_date" DEFAULT="#DateFormat(Now(), 'm/d/yyyy')#">
<CFPARAM NAME="hud_type" DEFAULT="0">
<CFPARAM NAME="piggy" DEFAULT="0">
<CFPARAM NAME="ins" DEFAULT="0">
<CFPARAM NAME="USER_ID_1" DEFAULT="0">
<CFPARAM NAME="url.USER_ID_1" DEFAULT="0">
<CFPARAM NAME="lo_id" DEFAULT="0">
<CFPARAM NAME="url.lo_id" DEFAULT="0">
<CFPARAM NAME="appraisal" DEFAULT="0">
<CFPARAM NAME="other" DEFAULT="0">
<CFPARAM NAME="url.title" DEFAULT="1">

<CFPARAM NAME="lo_name" DEFAULT="">
<CFPARAM NAME="lo_fax" DEFAULT="">
<CFPARAM NAME="lo_phone" DEFAULT="">
<CFPARAM NAME="lo_email" DEFAULT="">

<cfset missing_fields = "">


<!--- Property Info --->

<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State neq "">
<CFSET pstate = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Property State", ",")>
</cfif>

<!--- first time home buyer --->
<CFSET first_time_buyer = 0>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].BORROWER.DECLARATION.XmlATTRIBUTES.BorrowerFirstTimeHomebuyerIndicator" default="N">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].BORROWER.DECLARATION.XmlATTRIBUTES.BorrowerFirstTimeHomebuyerIndicator eq "Y">
<CFSET first_time_buyer = 1>
</cfif>


<cftry>
<CFSET pcounty = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._County>
<cfcatch>
<cfset missing_fields = ListAppend(missing_fields, "
Property County", ",")>
</cfcatch>
</cftry>



<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._City" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._City neq "">
<CFSET pcity = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._City>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Property City", ",")>
</cfif>



<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._PostalCode" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._PostalCode neq "">
<CFSET pzip = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._PostalCode>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Property Zip Code", ",")>
</cfif>


<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress neq "">
<CFSET paddress = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Property.xmlattributes._StreetAddress>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Property Address", ",")>
</cfif>



<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes.PropertyUsageType" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes.PropertyUsageType neq "">
<CFSET prop_use_type = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes.PropertyUsageType>
<cfif prop_use_type eq 'PrimaryResidence'>
<cfset prop_use_type = 'Primary Residence'>
</cfif>
<cfelse>
<cfset prop_use_type = 'Primary Residence'>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="check_for_county_state">
SELECT rate_table as table_to_use FROM Zip_info WHERE state = '#pstate#'
and county = '#pcounty#'
</CFQUERY>

<cfif check_for_county_state.recordcount eq 0>
<cfinvoke	component = "cfc.encompass"	method = "throwError" message="Could not find that State/City/County combination in our database" encompass_transaction_id="#encompass_id#" condition="Error"><cfabort>
</cfif>


<!--- Borrower Info --->
<cftry>
<CFSET bfirstname1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[1].xmlattributes._FirstName>
<CFSET blastname1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[1].xmlattributes._LastName>
<!--- <CFSET bminame1 = Left(MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[1].xmlattributes._MiddleName, 1)> --->
<CFSET bssn1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[1].xmlattributes._SSN>

<cfcatch type="any">
</cfcatch>
</cftry>


<cftry> 
<CFLOOP INDEX="i" FROM="1" TO="#ARRAYLEN(MyXml.REQUEST.DATA.MAIN.LOAN.XmlChildren[1].BORROWER)#">
<cfif i eq 1>
<CFSET bfirstname1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].xmlattributes._FirstName>
<CFSET blastname1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].xmlattributes._LastName>
<!--- <CFSET bminame1 = Left(MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].xmlattributes._MiddleName, 1)> --->
<CFSET bssn1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].xmlattributes._SSN>
 <CFLOOP INDEX="j" FROM="1" TO="#ARRAYLEN(MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].contact_point)#">
   <cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].contact_point[j].xmlattributes._roletype eq 'Home' and MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].contact_point[j].xmlattributes._type eq 'Phone'>
   <cfset bhphone1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].contact_point[j].xmlattributes._value>
   </cfif>
   <cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].contact_point[j].xmlattributes._roletype eq 'Work' and MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].contact_point[j].xmlattributes._type eq 'Phone'>
   <cfset bwphone1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].contact_point[j].xmlattributes._value>
   </cfif>
 </cfloop>
</cfif>
<cfif i eq 2>
<CFSET bfirstname2 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].xmlattributes._FirstName>
<CFSET blastname2 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].xmlattributes._LastName>
<!--- <CFSET bminame2 = Left(MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].xmlattributes._MiddleName, 1)> --->
<CFSET bssn2 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].borrower[i].xmlattributes._SSN>
</cfif>
</cfloop>
<cfcatch type="any">
</cfcatch>
</cftry>


<cfif not IsDefined("bfirstname1") or bfirstname1 eq "">
<cfset missing_fields = ListAppend(missing_fields, "
Borrower's First Name", ",")>
</cfif>
<cfif not IsDefined("blastname1") or blastname1 eq "">
<cfset missing_fields = ListAppend(missing_fields, "
Borrower's Last Name", ",")>
</cfif>
<cfif not IsDefined("bssn1") or bssn1 eq "">
<cfset missing_fields = ListAppend(missing_fields, "
Borrower's Social Security Number", ",")>
</cfif>
<cfif not IsDefined("bhphone1") AND not IsDefined("bwphone1")>
<cfset missing_fields = ListAppend(missing_fields, "
Borrower's Contact Phone Number", ",")>
</cfif>

<cfset construction_loan = 0>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes._Type" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes._Type neq "">
<CFSET SearchType = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Loan_Purpose.xmlattributes._Type>
<cfif SearchType eq 'ConstructionOnly'>
<cfset SearchType = 'Purchase'>
<cfset construction_loan = 1>
</cfif>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Loan Purpose", ",")>
</cfif>




<cfif  IsDefined("SearchType") and SearchType eq 'Purchase'>


<cftry>
<!--- Seller Info --->
<CFSET slastname1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].Seller.Contact_Detail.xmlattributes._Name>
<CFSET sfirstname1 = "">
<CFLOOP INDEX="j" FROM="1" TO="#ARRAYLEN(MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].Seller.contact_detail.contact_point)#">
   <cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].Seller.contact_detail.contact_point[j].xmlattributes._roletype eq 'Home' and MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].Seller.contact_detail.contact_point[j].xmlattributes._type eq 'Phone'>
   <CFSET shphone1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].Seller.contact_detail.contact_point[j].xmlattributes._Value>
   </cfif>
   <cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].Seller.contact_detail.contact_point[j].xmlattributes._roletype eq 'Work' and MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].Seller.contact_detail.contact_point[j].xmlattributes._type eq 'Phone'>
   <cfset swphone1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].Seller.contact_detail.contact_point[j].xmlattributes._value>
   </cfif>
 </cfloop>
 <cfcatch type="any">
</cfcatch>
</cftry>

<cfif not IsDefined("slastname1") or slastname1 eq "">
<cfset missing_fields = ListAppend(missing_fields, "
Seller's Last Name", ",")>
<cfelse>
<cfset sfirstname1 = "">
</cfif>
<cfif not IsDefined("sssn1")>
<cfset sssn1 = "TBD">
</cfif>
<cfif not IsDefined("shphone1") AND not IsDefined("swphone1")>
<cfset missing_fields = ListAppend(missing_fields, "
Seller's Contact Phone Number", ",")>
</cfif>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="get_all_comp_info">
SELECT * FROM Companies where ID = #trim(comp_id)#
</CFQUERY>

<cfif IsDefined("SearchType") and SearchType eq 'Purchase' and  IsDefined("pstate")  and  (pstate eq 'HI' or pstate eq 'AK' or pstate eq 'OR' or pstate eq 'CA' or pstate eq 'WA' or pstate eq 'NV' or pstate eq 'UT' or pstate eq 'ID' or pstate eq 'NM' or pstate eq 'WY' or pstate eq 'OK' or pstate eq 'SD' or pstate eq 'AR' or pstate eq 'IA')  and (get_all_comp_info.ID NEQ 9165 and get_all_comp_info.ID NEQ 11726)>
<cfinvoke	component = "cfc.encompass"	method = "throwError" message="We are currently not accepting Purchase transactions in #pstate#." encompass_transaction_id="#encompass_id#" condition="Error"><cfabort>
</cfif>



<!--- <cfif  IsDefined("SearchType") and SearchType neq 'Purchase' and  IsDefined("pstate")  and pstate eq "NY" or pstate eq "MD">

<cfparam name="orig_loan_amount" default="">
<cftry>
<CFSET orig_loan_amount = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LOAN_PURPOSE.CONSTRUCTION_REFINANCE_DATA.xmlattributes.PropertyExistingLienAmount>
<cfcatch></cfcatch></cftry>
<cfif orig_loan_amount neq "" and IsDefined("SearchType") and SearchType neq 'Purchase' and  IsDefined("pstate")  and pstate eq "NY" or pstate eq "MD">
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Original Loan Amount (complete the Existing Lien field on page 1 of the 1003 under 'Refinance Loan'", ",")>
</cfif>
</cfif>
this gets repeated below, so I commented this out
 --->

<!--- Proposed_Insured --->
<cftry>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].Lender.xmlattributes._UnparsedName" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].Lender.xmlattributes._UnparsedName neq "">
<CFSET Insured = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].Lender.xmlattributes._UnparsedName>
<cfelse>
<CFSET Insured = "TBD">
</cfif>
<cfcatch type="any">
<CFSET Insured = "TBD">
</cfcatch>
</cftry>


<!--- Payoff Info --->
<cftry> 
<CFLOOP INDEX="i" FROM="1" TO="#ARRAYLEN(MyXml.REQUEST.DATA.MAIN.LOAN.XmlChildren[1].LIABILITY)#">
<cfif i eq 1 and MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LIABILITY[i].xmlattributes._Type eq 'MortgageLoan'>
<CFSET polender1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LIABILITY[i].xmlattributes._HolderName>
<CFSET poacctno1 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LIABILITY[i].xmlattributes._AccountIdentifier>
</cfif>
<cfif i eq 2 and MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LIABILITY[i].xmlattributes._Type eq 'MortgageLoan'>
<CFSET polender2 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LIABILITY[i].xmlattributes._HolderName>
<CFSET poacctno2 = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LIABILITY[i].xmlattributes._AccountIdentifier>
</cfif>
</cfloop>
<cfcatch type="any">
</cfcatch>
</cftry>
<!--- Due Date --->

<!--- <CFSET child_num = XmlChildPos(MyXml.request.DATA.MAIN.LOAN.XmlChildren[2], "_Product", 1)>
<CFSET due_date = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].xmlChildren[#child_num#].xmlAttributes.ServiceRequestedCompletionDueDate>
<CFSET due_date = DateFormat(due_date, "mm/dd/yyyy")>
 --->


<!--- Loan Info --->
<cfset empty_fields = "">



<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].MORTGAGE_TERMS.xmlattributes.MortgageType" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].MORTGAGE_TERMS.xmlattributes.MortgageType neq "">
<CFSET loanType = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].MORTGAGE_TERMS.xmlattributes.MortgageType>
<cfelse>
<cfset loanType = 'CONV'>
</cfif>





<cfparam name="original_loan_amount" default="">
<cftry>
<CFSET original_loan_amount = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LOAN_PURPOSE.CONSTRUCTION_REFINANCE_DATA.xmlattributes.PropertyExistingLienAmount>
<cfcatch></cfcatch></cftry>


<cfif IsDefined("SearchType") and SearchType neq 'Purchase' and IsDefined("pstate") and (pstate eq "NY" or pstate eq "MD" or pstate eq "TX" or pstate eq "VA") and IsDefined("prop_use_type") and prop_use_type eq 'Primary Residence'>

<cfif original_loan_amount neq "">
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Original Loan Amount (complete the Existing Lien field on page 1 of the 1003 under 'Refinance Loan'", ",")>
</cfif>


<cfparam name="prev_loan_year" default=""><br>
<cftry>
<CFSET prev_loan_year = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LOAN_PURPOSE.CONSTRUCTION_REFINANCE_DATA.xmlattributes.PropertyAcquiredYear>
<cfcatch></cfcatch></cftry>
<cfif prev_loan_year neq "">
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Year Acquired (complete the Year Acq field on page 1 of the 1003 under 'Refinance Loan'", ",")>
</cfif>
<cfelse>
<CFSET original_loan_amount = 0>
<CFSET prev_loan_year = 0>
</cfif>



<cfif IsDefined("SearchType") and SearchType EQ 'Purchase'>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].TRANSACTION_DETAIL.xmlattributes.PurchasePriceAmount" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].TRANSACTION_DETAIL.xmlattributes.PurchasePriceAmount NEQ "" and MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].TRANSACTION_DETAIL.xmlattributes.PurchasePriceAmount GT 0>
<CFSET purchase = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].TRANSACTION_DETAIL.xmlattributes.PurchasePriceAmount>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Purchase Price", ",")>
</cfif>


<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.BorrowerRequestedLoanAmount" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.BorrowerRequestedLoanAmount NEQ "" and MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.BorrowerRequestedLoanAmount GTE 0>
<CFSET loanamt_float = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.BorrowerRequestedLoanAmount>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Loan Amount", ",")>
</cfif>
<cfelse>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.BorrowerRequestedLoanAmount" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.BorrowerRequestedLoanAmount NEQ "" and MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.BorrowerRequestedLoanAmount GT 0>
<CFSET loanamt_float = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.BorrowerRequestedLoanAmount>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Loan Amount", ",")>
</cfif>
</cfif>

<!--- Loan Officer/Processor Info --->

<cftry>

<CFSET lo_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.xmlattributes._name>
<CFSET form.lo_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.xmlattributes._name>
<CFSET rlo.lo_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.xmlattributes._name>
<CFSET lp_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.xmlattributes._name>
<CFSET form.lp_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.xmlattributes._name>
<CFSET ru.lp_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.xmlattributes._name>

<CFLOOP INDEX="a" FROM="1" TO="#ARRAYLEN(MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point)#">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Type eq "Phone">
<CFSET lo_phone = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET form.lo_phone = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET rlo.lo_phone = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET lp_phone = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET form.lp_phone = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET ru.lp_phone = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>



<cfelseif MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Type eq "Fax">
<CFSET lo_fax = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET form.lo_fax = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET rlo.lo_fax = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET lp_fax = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET form.lp_fax = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET ru.lp_fax = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>



<cfelseif MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Type eq "Email">
<CFSET lo_email = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET form.lo_email = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET rlo.lo_email = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET lp_email = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET form.lp_email = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
<CFSET ru.lp_email = MyXml.request.DATA.MAIN.LOAN.XmlChildren[2].LENDER.contact_detail.contact_point[a].xmlattributes._Value>
</cfif>
</cfloop>
<cfcatch type="any">
</cfcatch>
</cftry>





<cftry>
<CFSET a_comment = MyXml.request.ORDER_INFO.TITLE_REQUEST.Comments.XmlText>
<cfcatch type="any">
</cfcatch>
</cftry>


<cftry>
<CFSET lo_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].INTERVIEWER_INFORMATION.xmlattributes.InterviewersName>
<CFSET form.lo_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].INTERVIEWER_INFORMATION.xmlattributes.InterviewersName>
<CFSET rlo.lo_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].INTERVIEWER_INFORMATION.xmlattributes.InterviewersName>
<CFSET lp_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].INTERVIEWER_INFORMATION.xmlattributes.InterviewersName>
<CFSET form.lp_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].INTERVIEWER_INFORMATION.xmlattributes.InterviewersName>
<CFSET ru.lp_name = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].INTERVIEWER_INFORMATION.xmlattributes.InterviewersName>
<cfcatch type="any">
</cfcatch>
</cftry>


<cfif NOT IsDefined("lo_name") or lo_name eq "">
<cfset missing_fields = ListAppend(missing_fields, "
Broker's Name", ",")>
</cfif>



<!--- <cfset lo_email = "titles@firsttitleservices.com">
<cfset form.lo_email = "titles@firsttitleservices.com">
<cfset rlo.lo_email = "titles@firsttitleservices.com">
<cfset lp_email = "titles@firsttitleservices.com">
<cfset form.lp_email = "titles@firsttitleservices.com">
<cfset ru.lp_email = "titles@firsttitleservices.com"> --->

<cftry>
<CFSET lo_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<CFSET form.lo_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<CFSET rlo.lo_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<CFSET lp_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<CFSET form.lp_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<CFSET ru.lp_email = MyXml.request.DATA.CUSTOM.CONTACT_INFO.xmlattributes.EmailAddress>
<cfcatch type="any"></cfcatch></cftry>



<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.LenderLoanIdentifier" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.LenderLoanIdentifier NEQ "">
<CFSET loan_number = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].Mortgage_Terms.xmlattributes.LenderLoanIdentifier>
</cfif>


<!--- pstate: <cfoutput>#pstate#</cfoutput><br>
pcounty: <cfoutput>#pcounty#</cfoutput><br>
comp_id: <cfoutput>#comp_id#</cfoutput><br>
blastname1: <cfoutput>#blastname1#</cfoutput><br>
bfirstname1: <cfoutput>#bfirstname1#</cfoutput><br>
bminame1: <cfoutput>#bminame1#</cfoutput><br>
bssn1: <cfoutput>#bssn1#</cfoutput><br>
bwphone1: <cfoutput>#bwphone1#</cfoutput><br>
bhphone1: <cfoutput>#bhphone1#</cfoutput><br>
blastname2: <cfoutput>#blastname2#</cfoutput><br>
bfirstname2: <cfoutput>#bfirstname2#</cfoutput><br>
bminame2: <cfoutput>#bminame2#</cfoutput><br>
bssn2: <cfoutput>#bssn2#</cfoutput><br>
slastname1: <cfoutput>#slastname1#</cfoutput><br>
sfirstname1: <cfoutput>#sfirstname1#</cfoutput><br>
sminame1: <cfoutput>#sminame1#</cfoutput><br>
shphone1: <cfoutput>#shphone1#</cfoutput><br>
pstate: <cfoutput>#pstate#</cfoutput><br>
pcounty: <cfoutput>#pcounty#</cfoutput><br>
paddress: <cfoutput>#paddress#</cfoutput><br>
pcity: <cfoutput>#pcity#</cfoutput><br>
pzip: <cfoutput>#pzip#</cfoutput><br>
prop_use_type: <cfoutput>#prop_use_type#</cfoutput><br>
SearchType: <cfoutput>#SearchType#</cfoutput><br>
Purchase: <cfoutput>#Purchase#</cfoutput><br>
loanamt_float: <cfoutput>#loanamt_float#</cfoutput><br>
lo_name: <cfoutput>#lo_name#</cfoutput><br>
lo_phone: <cfoutput>#lo_phone#</cfoutput><br>
lo_fax: <cfoutput>#lo_fax#</cfoutput><br>
lo_email: <cfoutput>#lo_email#</cfoutput><br>
encompass_id: <cfoutput>#encompass_id#</cfoutput><br> --->

<cfset form.pstate = pstate>
<cfset form.pcounty = pcounty>
<cfset form.pcity = pcity>
<cfset count_inquiries = 0>
<cfset form.first_time_buyer = first_time_buyer>
<cfset form.loanType = loanType>


 <!--- <cfoutput>
lo_name: #lo_name#<br>
lo_phone: #lo_phone#<br>
lo_fax: #lo_fax#<br>
lo_email: #lo_email#<br>
lp_name: #lp_name#<br>
lp_phone: #lp_phone#<br>
lp_fax: #lp_fax#<br>
lp_email: #lp_email#<br>
</cfoutput>
<cfabort> --->
<cfif missing_fields neq "">
<cfinvoke	component = "cfc.encompass"	method = "throwError" message="The Following fields must be completed to proceed: #ReplaceNoCase(missing_fields, ",", "", "ALL")#" encompass_transaction_id="#encompass_id#" condition="Error"><cfabort>
</cfif>


<cfset form.pcounty = ReplaceNoCase(form.pcounty, "'s", "s", "All")>
<cfset pcounty = ReplaceNoCase(pcounty, "'s", "s", "All")>


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
<cfset form.opt_tx_9 = 0>
<cfset form.opt_tx_10 = 0>

<cftry>
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LOAN_PURPOSE.CONSTRUCTION_REFINANCE_DATA.xmlattributes.GSERefinancePurposeType" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].LOAN_PURPOSE.CONSTRUCTION_REFINANCE_DATA.xmlattributes.GSERefinancePurposeType eq "CashOutOther" and pstate eq 'TX'>
<CFSET cashoutrefi_indicator = 'Y'>
</cfif>
<cfif cashoutrefi_indicator eq 'Y'>
<cfset opt_tx_9 = 1>
<cfset opt_tx_10 = 1>
<cfset form.opt_tx_9 = 1>
<cfset form.opt_tx_10 = 1>
<cfelse>
<cfset opt_tx_9 = 0>
<cfset opt_tx_10 = 0>
</cfif>
<cfcatch>
<cfset form.opt_tx_9 = 0>
<cfset form.opt_tx_10 = 0>
</cfcatch>
</cftry>

<!--- <cfif paddress eq '3102 S Manchester Street Unit 738'>
<cfoutput>
form.opt_alta_4_1 = #form.opt_alta_4_1#<br>
form.opt_alta_5_1 = #form.opt_alta_5_1#<br>
opt_alta_4_1 = #opt_alta_4_1#<br>
opt_alta_5_1 = #opt_alta_5_1#<br>
<cfabort>
</cfoutput>
</cfif> --->

<cfset estimated_loan_float = original_loan_amount>
<cfset form.estimated_loan_float = original_loan_amount>


<CFINCLUDE TEMPLATE="../order_verify_title.cfm">