<!--- begin insert or update --->
<!--- check to see if data already exists for this Transaction --->
<cfparam name="comp_id" default="7393">
<CFQUERY DATASOURCE="#request.dsn#" NAME="find_order">
    SELECT *
	FROM ChaseRealEC_orders
	WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>

<!--- if it exists, update it --->
<cfif find_order.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="find_company">
    SELECT ID
	FROM companies
	WHERE RealECClientID = '#Trns_RECClientID#'
</CFQUERY>
<!---
<cfset comp_id = find_company.id>
--->

<CFQUERY DATASOURCE="#request.dsn#" NAME="update_order">
    update ChaseRealEC_orders
	set
	Hdr_AckRef = '#Hdr_AckRef#',
	Hdr_AckRequest = '#Hdr_AckRequest#',
	Hdr_Created = #Hdr_Created#,
	Hdr_CreatedBy = '#Hdr_CreatedBy#',
	Hdr_Format = '#Hdr_Format#',
	Hdr_GMTOffset = '#Hdr_GMTOffset#',
	Hdr_PrivNetID = '#Hdr_PrivNetID#',
	Hdr_SourceApp = '#Hdr_SourceApp#',
	Hdr_SourceID = '#Hdr_SourceID#',
	Hdr_SourceVer = '#Hdr_SourceVer#',
	Hdr_TestFile = '#Hdr_TestFile#',
	Hdr_UserName = '#Hdr_UserName#',
	Hdr_Version = '#Hdr_Version#',
	Trns_CostCenter = '#Trns_CostCenter#',
	Trns_RECClientID = '#Trns_RECClientID#',
	Trns_RefNumList_RefNum_Reference = '#Trns_RefNumList_RefNum_Reference#',
	Trns_RefNumList_RefNum_Type = '#Trns_RefNumList_RefNum_Type#',
	comp_id = '#comp_id#',
	Last_Update_date = #CreateODBCDateTime(Now())#
	
	WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>


<cfelse> <!--- if not found, created a new record --->

<CFQUERY DATASOURCE="#request.dsn#" NAME="find_company">
    SELECT ID
	FROM companies
	WHERE RealECClientID = '#Trns_RECClientID#'
</CFQUERY>
<!---
<cfset comp_id = find_company.id>
--->
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_Orders (TransactionID,Trns_TrnsID,Hdr_AckRef,Hdr_AckRequest,Hdr_Created,Hdr_CreatedBy,	Hdr_Format,Hdr_GMTOffset,Hdr_PrivNetID,Hdr_SourceApp,Hdr_SourceID,Hdr_SourceVer,Hdr_TestFile,Hdr_UserName,Hdr_Version,Trns_CostCenter,Trns_RECClientID,Trns_RefNumList_RefNum_Reference,Trns_RefNumList_RefNum_Type,comp_id, Init_Order_Date, Last_Update_Date)
values
('#Trns_TrnsID#','#Trns_TrnsID#','#Hdr_AckRef#','#Hdr_AckRequest#',#Hdr_Created#,'#Hdr_CreatedBy#','#Hdr_Format#','#Hdr_GMTOffset#','#Hdr_PrivNetID#','#Hdr_SourceApp#','#Hdr_SourceID#','#Hdr_SourceVer#','#Hdr_TestFile#','#Hdr_UserName#','#Hdr_Version#','#Trns_CostCenter#','#Trns_RECClientID#','#Trns_RefNumList_RefNum_Reference#','#Trns_RefNumList_RefNum_Type#','#comp_id#',#CreateODBCDateTime(Now())#,#CreateODBCDateTime(Now())#)
</CFQUERY>

</cfif>


<!--- update the other tables --->
  <!--- Loan List Table --->
<cfset Loan = XmlSearch(pEventXml, "/RealEC-XML/Transaction/LoanList/Loan")>
<cfif ArrayLen(Loan)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_LoanList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(Loan)#" index="i">
<cfset strLoan = flattenXmlToStruct(Loan[i])>
<cfparam name = "strLoan.APR" default="">
<cfparam name = "strLoan.ARMInd" default="">
<cfparam name = "strLoan.ARMMargin" default="">
<cfparam name = "strLoan.ARMTerm" default="">
<cfparam name = "strLoan.Addr1" default="">
<cfparam name = "strLoan.Addr2" default="">
<cfparam name = "strLoan.AgencyCaseNumber" default="">
<cfparam name = "strLoan.AgencyType" default="">
<cfparam name = "strLoan.Amount" default="">
<cfparam name = "strLoan.BondLoan" default="">
<cfparam name = "strLoan.CEM" default="">
<cfparam name = "strLoan.CLTV" default="">
<cfparam name = "strLoan.CashOut" default="">
<cfparam name = "strLoan.CashOutAmount" default="">
<cfparam name = "strLoan.City" default="">
<cfparam name = "strLoan.Contact.CellPhone" default="">
<cfparam name = "strLoan.Contact.DayPhone" default="">
<cfparam name = "strLoan.Contact.EMail" default="">
<cfparam name = "strLoan.Contact.EvenPhone" default="">
<cfparam name = "strLoan.Contact.Fax" default="">
<cfparam name = "strLoan.Contact.Name" default="">
<cfparam name = "strLoan.Contact.Pager" default="">
<cfparam name = "strLoan.DayPhone" default="">
<cfparam name = "strLoan.Existing" default="">
<cfparam name = "strLoan.ExpDisbDate" default="">
<cfparam name = "strLoan.FHACaseNumber" default="">
<cfparam name = "strLoan.FHAParsedCaseNumber" default="">
<cfparam name = "strLoan.FHAParsedSectionNumber" default="">
<cfparam name = "strLoan.InitialPayDate" default="">
<cfparam name = "strLoan.Instructions" default="">
<cfparam name = "strLoan.InvestorName" default="">
<cfparam name = "strLoan.LTV" default="">
<cfparam name = "strLoan.LenderName" default="">
<cfparam name = "strLoan.LienType" default="">
<cfparam name = "strLoan.OriginalLoanAmount" default="">
<cfparam name = "strLoan.OriginationDate" default="">
<cfparam name = "strLoan.Paydown" default="">
<cfparam name = "strLoan.PaydownAction" default="">
<cfparam name = "strLoan.PaydownAmount" default="">
<cfparam name = "strLoan.Payment" default="">
<cfparam name = "strLoan.Payoff" default="">
<cfparam name = "strLoan.PayoffAction" default="">
<cfparam name = "strLoan.PortfolioLoan" default="">
<cfparam name = "strLoan.Position" default="">
<cfparam name = "strLoan.Principal" default="">
<cfparam name = "strLoan.ProgramCode" default="">
<cfparam name = "strLoan.ProgramCodeDesc" default="">
<cfparam name = "strLoan.Purpose" default="">
<cfparam name = "strLoan.Reference" default="">
<cfparam name = "strLoan.RefinancedRecently" default="">
<cfparam name = "strLoan.SalesAmount" default="">
<cfparam name = "strLoan.Score" default="">
<cfparam name = "strLoan.State" default="">
<cfparam name = "strLoan.SubPrimeInd" default="">
<cfparam name = "strLoan.SubPrimeProgramType" default="">
<cfparam name = "strLoan.Subordinate" default="">
<cfparam name = "strLoan.SubordinateAction" default="">
<cfparam name = "strLoan.Term" default="">
<cfparam name = "strLoan.TermBalloon" default="">
<cfparam name = "strLoan.TexasHomeEquity" default="">
<cfparam name = "strLoan.Type" default="">
<cfparam name = "strLoan.UniqueID" default="">
<cfparam name = "strLoan.Zip" default="">
<!---
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_LoanList 
(TransactionID,Trns_LList_Loan_APR,Trns_LList_Loan_ARMInd,Trns_LList_Loan_ARMMargin,Trns_LList_Loan_ARMTerm,Trns_LList_Loan_Addr1,Trns_LList_Loan_Addr2,Trns_LList_Loan_AgencyCaseNumber,Trns_LList_Loan_AgencyType,Trns_LList_Loan_Amount,Trns_LList_Loan_BondLoan,Trns_LList_Loan_CEM,Trns_LList_Loan_CLTV,Trns_LList_Loan_CashOut,Trns_LList_Loan_CashOutAmount,Trns_LList_Loan_City,Trns_LList_Loan_Contact_CellPhone,Trns_LList_Loan_Contact_DayPhone,Trns_LList_Loan_Contact_EMail,Trns_LList_Loan_Contact_EvenPhone,Trns_LList_Loan_Contact_Fax,Trns_LList_Loan_Contact_Name,Trns_LList_Loan_Contact_Pager,Trns_LList_Loan_DayPhone,Trns_LList_Loan_Existing,Trns_LList_Loan_ExpDisbDate,Trns_LList_Loan_FHACaseNumber,Trns_LList_Loan_FHAParsedCaseNumber,Trns_LList_Loan_FHAParsedSectionNumber,Trns_LList_Loan_InitialPayDate,Trns_LList_Loan_Instructions,Trns_LList_Loan_InvestorName,Trns_LList_Loan_LTV,Trns_LList_Loan_LenderName,Trns_LList_Loan_LienType,Trns_LList_Loan_OriginalLoanAmount,Trns_LList_Loan_OriginationDate,Trns_LList_Loan_Paydown,Trns_LList_Loan_PaydownAction,Trns_LList_Loan_PaydownAmount,Trns_LList_Loan_Pmt,Trns_LList_Loan_Payoff,Trns_LList_Loan_PayoffAction,Trns_LList_Loan_PortfolioLoan,Trns_LList_Loan_Position,Trns_LList_Loan_Principal,Trns_LList_Loan_ProgramCode,Trns_LList_Loan_ProgramCodeDesc,Trns_LList_Loan_Purpose,Trns_LList_Loan_Reference,Trns_LList_Loan_RefinancedRecently,Trns_LList_Loan_SalesAmount,Trns_LList_Loan_Score,Trns_LList_Loan_State,Trns_LList_Loan_SubPrimeInd,Trns_LList_Loan_SubPrimeProgramType,Trns_LList_Loan_Subordinate,Trns_LList_Loan_SubordinateAction,Trns_LList_Loan_Term,Trns_LList_Loan_TermBalloon,Trns_LList_Loan_TexasHomeEquity,Trns_LList_Loan_Type,Trns_LList_Loan_UniqueID,Trns_LList_Loan_Zip)
values
('#Trns_TrnsID#','#strLoan.APR#','#strLoan.ARMInd#','#strLoan.ARMMargin#','#strLoan.ARMTerm#','#strLoan.Addr1#','#strLoan.Addr2#','#strLoan.AgencyCaseNumber#','#strLoan.AgencyType#','#strLoan.Amount#','#strLoan.BondLoan#','#strLoan.CEM#','#strLoan.CLTV#','#strLoan.CashOut#','#strLoan.CashOutAmount#','#strLoan.City#','#strLoan.Contact.CellPhone#','#strLoan.Contact.DayPhone#','#strLoan.Contact.EMail#','#strLoan.Contact.EvenPhone#','#strLoan.Contact.Fax#','#strLoan.Contact.Name#','#strLoan.Contact.Pager#','#strLoan.DayPhone#','#strLoan.Existing#',<cfif Len(strLoan.ExpDisbDate)>#CreateODBCDateTime(strLoan.ExpDisbDate)#<cfelse>null</cfif>,'#strLoan.FHACaseNumber#','#strLoan.FHAParsedCaseNumber#','#strLoan.FHAParsedSectionNumber#',<cfif Len(strLoan.InitialPayDate)>#CreateODBCDateTime(strLoan.InitialPayDate)#<cfelse>null</cfif>,'#strLoan.Instructions#','#strLoan.InvestorName#','#strLoan.LTV#','#strLoan.LenderName#','#strLoan.LienType#','#strLoan.OriginalLoanAmount#',<cfif Len(strLoan.OriginationDate)>#CreateODBCDateTime(strLoan.OriginationDate)#<cfelse>null</cfif>,'#strLoan.Paydown#','#strLoan.PaydownAction#','#strLoan.PaydownAmount#','#strLoan.Payment#','#strLoan.Payoff#','#strLoan.PayoffAction#','#strLoan.PortfolioLoan#','#strLoan.Position#','#strLoan.Principal#','#strLoan.ProgramCode#','#strLoan.ProgramCodeDesc#','#strLoan.Purpose#','#strLoan.Reference#','#strLoan.RefinancedRecently#','#strLoan.SalesAmount#','#strLoan.Score#','#strLoan.State#','#strLoan.SubPrimeInd#','#strLoan.SubPrimeProgramType#','#strLoan.Subordinate#','#strLoan.SubordinateAction#','#strLoan.Term#','#strLoan.TermBalloon#','#strLoan.TexasHomeEquity#','#strLoan.Type#','#strLoan.UniqueID#','#strLoan.Zip#')
</CFQUERY>
--->
</cfloop>




<!--- DataActionTable --->
<cfset dataAction = XmlSearch(pEventXml, "/RealEC-XML/Transaction/DataActionList/DataAction")>
<cfif ArrayLen(dataAction)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_DActList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(dataAction)#" index="i">
<cfset strdataAction = flattenXmlToStruct(dataAction[i])>
<cfparam name = "strdataAction.ActionDate" default="">
<cfparam name = "strdataAction.ActionDate" default="">
<cfparam name = "strdataAction.ActionType" default="">
<cfparam name = "strdataAction.DataPath" default="">
<cfparam name = "strdataAction.NewValue" default="">
<cfparam name = "strdataAction.OldValue" default="">
<cfparam name = "strdataAction.Process" default="">
<cfparam name = "strdataAction.UniqueID" default="">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_DActList (TransactionID,Trns_DActList_DAct_ActionDate,Trns_DActList_DAct_ActionType,Trns_DActList_DAct_DataPath,Trns_DActList_DAct_NewValue,Trns_DActList_DAct_OldValue,Trns_DActList_DAct_Process,Trns_DActList_DAct_UniqueID)
values
('#Trns_TrnsID#',<cfif Len(strdataAction.ActionDate)>#CreateODBCDateTime(strdataAction.ActionDate)#<cfelse>null</cfif>,'#strdataAction.ActionType#','#strdataAction.DataPath#','#strdataAction.NewValue#','#strdataAction.OldValue#','#strdataAction.Process#','#strdataAction.UniqueID#')
</CFQUERY>
</cfloop>

<!--- PartyTable --->
<cfset party = XmlSearch(pEventXml, "/RealEC-XML/Transaction/PartyList/Party")>
<cfif ArrayLen(party)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_PartyList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(party)#" index="i">
<cfset strParty = flattenXmlToStruct(party[i])>
<cfparam name = "strParty.Addr1" default="">
<cfparam name = "strParty.Addr2" default="">
<cfparam name = "strParty.BankruptcyLastSevenYears" default="">
<cfparam name = "strParty.CellPhone" default="">
<cfparam name = "strParty.City" default="">
<cfparam name = "strParty.CompanyName" default="">
<cfparam name = "strParty.DOB" default="">
<cfparam name = "strParty.DayPhone" default="">
<cfparam name = "strParty.EMail" default="">
<cfparam name = "strParty.EvenPhone" default="">
<cfparam name = "strParty.ExistingLienToBePaidOff" default="">
<cfparam name = "strParty.Fax" default="">
<cfparam name = "strParty.FirstName" default="">
<cfparam name = "strParty.ForeclosureLastSevenYears" default="">
<cfparam name = "strParty.Generation" default="">
<cfparam name = "strParty.LangInd" default="">
<cfparam name = "strParty.LastName" default="">
<cfparam name = "strParty.MaritalStatus" default="">
<cfparam name = "strParty.MiddleName" default="">
<cfparam name = "strParty.NoLienToBePaidOff" default="">
<cfparam name = "strParty.Pager" default="">
<cfparam name = "strParty.PendingLawsuit" default="">
<cfparam name = "strParty.PreferredPhone" default="">
<cfparam name = "strParty.PreferredTime" default="">
<cfparam name = "strParty.Prefix" default="">
<cfparam name = "strParty.PrimaryName" default="">
<cfparam name = "strParty.Reference" default="">
<cfparam name = "strParty.SSN" default="">
<cfparam name = "strParty.SpouseUniqueID" default="">
<cfparam name = "strParty.State" default="">
<cfparam name = "strParty.Type" default="">
<cfparam name = "strParty.TypeClass" default="">
<cfparam name = "strParty.UniqueID" default="">
<cfparam name = "strParty.Zip" default="">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_PartyList (TransactionID,Trns_PtyList_Party_Addr1,Trns_PtyList_Party_Addr2,Trns_PtyList_Party_BankruptcyLastSevenYears,Trns_PtyList_Party_CellPhone,Trns_PtyList_Party_City,Trns_PtyList_Party_CompanyName,Trns_PtyList_Party_DOB,Trns_PtyList_Party_DayPhone,Trns_PtyList_Party_EMail,Trns_PtyList_Party_EvenPhone,Trns_PtyList_Party_ExistingLienToBePaidOff,Trns_PtyList_Party_Fax,Trns_PtyList_Party_FirstName,Trns_PtyList_Party_ForeclosureLastSevenYears,Trns_PtyList_Party_Generation,Trns_PtyList_Party_LangInd,Trns_PtyList_Party_LastName,Trns_PtyList_Party_MaritalStatus,Trns_PtyList_Party_MiddleName,Trns_PtyList_Party_NoLienToBePaidOff,Trns_PtyList_Party_Pager,Trns_PtyList_Party_PendingLawsuit,Trns_PtyList_Party_PreferredPhone,Trns_PtyList_Party_PreferredTime,Trns_PtyList_Party_Prefix,Trns_PtyList_Party_PrimaryName,Trns_PtyList_Party_Reference,Trns_PtyList_Party_SSN,Trns_PtyList_Party_SpouseUniqueID,Trns_PtyList_Party_State,Trns_PtyList_Party_Type,Trns_PtyList_Party_TypeClass,Trns_PtyList_Party_UniqueID,Trns_PtyList_Party_Zip)
values
('#Trns_TrnsID#','#strParty.Addr1#','#strParty.Addr2#','#strParty.BankruptcyLastSevenYears#','#strParty.CellPhone#','#strParty.City#','#strParty.CompanyName#','#strParty.DOB#','#strParty.DayPhone#','#strParty.EMail#','#strParty.EvenPhone#','#strParty.ExistingLienToBePaidOff#','#strParty.Fax#','#strParty.FirstName#','#strParty.ForeclosureLastSevenYears#','#strParty.Generation#','#strParty.LangInd#','#strParty.LastName#','#strParty.MaritalStatus#','#strParty.MiddleName#','#strParty.NoLienToBePaidOff#','#strParty.Pager#','#strParty.PendingLawsuit#','#strParty.PreferredPhone#','#strParty.PreferredTime#','#strParty.Prefix#','#strParty.PrimaryName#','#strParty.Reference#','#strParty.SSN#','#strParty.SpouseUniqueID#','#strParty.State#','#strParty.Type#','#strParty.TypeClass#','#strParty.UniqueID#','#strParty.Zip#')
</CFQUERY>
</cfloop>



<!--- ProductTable --->
<cfset product = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
<cfif ArrayLen(product)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_ProductList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(product)#" index="i">
<cfset strProduct = flattenXmlToStruct(product[i])>
<cfparam name = "strProduct.BInfo.BankruptcyLastSevenYears" default = "">
<cfparam name = "strProduct.BInfo.ExistingLienToBePaidOff" default = "">
<cfparam name = "strProduct.BInfo.ForeclosureLastSevenYears" default = "">
<cfparam name = "strProduct.BInfo.NoLienToBePaidOff" default = "">
<cfparam name = "strProduct.BInfo.PendingLawsuit" default = "">
<cfparam name = "strProduct.BundleID" default = "">
<cfparam name = "strProduct.DueDate" default = "">
<cfparam name = "strProduct.Event.ClientCode" default = "">
<cfparam name = "strProduct.Event.ClientDesc" default = "">
<cfparam name = "strProduct.Event.Comment" default = "">
<cfparam name = "strProduct.Event.EventDate" default = "">
<cfparam name = "strProduct.Event.EventID" default = "">
<cfparam name = "strProduct.Event.OccurDate" default = "">
<cfparam name = "strProduct.Event.RECCode" default = "">
<cfparam name = "strProduct.Event.UDF1" default = "">
<cfparam name = "strProduct.Event.UDF2" default = "">
<cfparam name = "strProduct.Event.UDF3" default = "">
<cfparam name = "strProduct.HazInsInfo.InsAgentName" default = "">
<cfparam name = "strProduct.HazInsInfo.InsAgentPhone" default = "">
<cfparam name = "strProduct.HazInsInfo.InsCoAccount" default = "">
<cfparam name = "strProduct.HazInsInfo.InsCoName" default = "">
<cfparam name = "strProduct.Instructions" default = "">
<cfparam name = "strProduct.IssueTo.Addr1" default = "">
<cfparam name = "strProduct.IssueTo.Addr2" default = "">
<cfparam name = "strProduct.IssueTo.City" default = "">
<cfparam name = "strProduct.IssueTo.PrimaryName" default = "">
<cfparam name = "strProduct.IssueTo.Reference" default = "">
<cfparam name = "strProduct.IssueTo.State" default = "">
<cfparam name = "strProduct.IssueTo.Zip" default = "">
<cfparam name = "strProduct.MktIndicators.DecliningMarketIndicator" default = "">
<cfparam name = "strProduct.MktIndicators.HighCostAreaIndicator" default = "">
<cfparam name = "strProduct.ProductCode" default = "">
<cfparam name = "strProduct.ProviderID" default = "">
<cfparam name = "strProduct.QuoteRequest" default = "">
<cfparam name = "strProduct.Reference" default = "">
<cfparam name = "strProduct.RemitTo.Addr1" default = "">
<cfparam name = "strProduct.RemitTo.Addr2" default = "">
<cfparam name = "strProduct.RemitTo.Attn" default = "">
<cfparam name = "strProduct.RemitTo.City" default = "">
<cfparam name = "strProduct.RemitTo.Contact.CellPhone" default = "">
<cfparam name = "strProduct.RemitTo.Contact.DayPhone" default = "">
<cfparam name = "strProduct.RemitTo.Contact.EMail" default = "">
<cfparam name = "strProduct.RemitTo.Contact.EvenPhone" default = "">
<cfparam name = "strProduct.RemitTo.Contact.Fax" default = "">
<cfparam name = "strProduct.RemitTo.Contact.Name" default = "">
<cfparam name = "strProduct.RemitTo.Contact.Pager" default = "">
<cfparam name = "strProduct.RemitTo.Instructions" default = "">
<cfparam name = "strProduct.RemitTo.ProviderID" default = "">
<cfparam name = "strProduct.RemitTo.ProviderName" default = "">
<cfparam name = "strProduct.RemitTo.State" default = "">
<cfparam name = "strProduct.RemitTo.Zip" default = "">
<cfparam name = "strProduct.SLABasisDate" default = "">
<cfparam name = "strProduct.SLAPrice" default = "">
<cfparam name = "strProduct.Security.AccountNumber" default = "">
<cfparam name = "strProduct.Security.Password" default = "">
<cfparam name = "strProduct.Security.Type" default = "">
<cfparam name = "strProduct.Security.UserName" default = "">
<cfparam name = "strProduct.TitleInfo.TitleGrade" default = "">
<cfparam name = "strProduct.UniqueID" default = "">
<!--- <cfdump var="#strProduct#"><br> --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_ProductList (TransactionID,Trns_PrdList_Prod_BInfo_BankruptcyLastSevenYears,Trns_PrdList_Prod_BInfo_ExistingLienToBePaidOff,Trns_PrdList_Prod_BInfo_ForeclosureLastSevenYears,Trns_PrdList_Prod_BInfo_NoLienToBePaidOff,Trns_PrdList_Prod_BInfo_PendingLawsuit,Trns_PrdList_Prod_BundleID,Trns_PrdList_Prod_DueDate,Trns_PrdList_Prod_Event_ClientCode,Trns_PrdList_Prod_Event_ClientDesc,Trns_PrdList_Prod_Event_Comment,Trns_PrdList_Prod_Event_EventDate,Trns_PrdList_Prod_Event_EventID,Trns_PrdList_Prod_Event_OccurDate,Trns_PrdList_Prod_Event_RECCode,Trns_PrdList_Prod_Event_UDF1,Trns_PrdList_Prod_Event_UDF2,Trns_PrdList_Prod_Event_UDF3,Trns_PrdList_Prod_HazInsInfo_InsAgentName,Trns_PrdList_Prod_HazInsInfo_InsAgentPhone,Trns_PrdList_Prod_HazInsInfo_InsCoAccount,Trns_PrdList_Prod_HazInsInfo_InsCoName,Trns_PrdList_Prod_Instructions,Trns_PrdList_Prod_IssueTo_Addr1,Trns_PrdList_Prod_IssueTo_Addr2,Trns_PrdList_Prod_IssueTo_City,Trns_PrdList_Prod_IssueTo_PrimaryName,Trns_PrdList_Prod_IssueTo_Reference,Trns_PrdList_Prod_IssueTo_State,Trns_PrdList_Prod_IssueTo_Zip,Trns_PrdList_Prod_MktIndicators_DecliningMarketIndicator,Trns_PrdList_Prod_MktIndicators_HighCostAreaIndicator,Trns_PrdList_Prod_ProdCode,Trns_PrdList_Prod_ProviderID,Trns_PrdList_Prod_QuoteRequest,Trns_PrdList_Prod_Reference,Trns_PrdList_Prod_RemitTo_Addr1,Trns_PrdList_Prod_RemitTo_Addr2,Trns_PrdList_Prod_RemitTo_Attn,Trns_PrdList_Prod_RemitTo_City,Trns_PrdList_Prod_RemitTo_Contact_CellPhone,Trns_PrdList_Prod_RemitTo_Contact_DayPhone,Trns_PrdList_Prod_RemitTo_Contact_EMail,Trns_PrdList_Prod_RemitTo_Contact_EvenPhone,Trns_PrdList_Prod_RemitTo_Contact_Fax,Trns_PrdList_Prod_RemitTo_Contact_Name,Trns_PrdList_Prod_RemitTo_Contact_Pager,Trns_PrdList_Prod_RemitTo_Instructions,Trns_PrdList_Prod_RemitTo_ProviderID,Trns_PrdList_Prod_RemitTo_ProviderName,Trns_PrdList_Prod_RemitTo_State,Trns_PrdList_Prod_RemitTo_Zip,Trns_PrdList_Prod_SLABasisDate,Trns_PrdList_Prod_SLAPrice,Trns_PrdList_Prod_Security_AccountNumber,Trns_PrdList_Prod_Security_Password,Trns_PrdList_Prod_Security_Type,Trns_PrdList_Prod_Security_UserName,Trns_PrdList_Prod_TitleInfo_TitleGrade,Trns_PrdList_Prod_UniqueID)
values
('#Trns_TrnsID#','#strProduct.BInfo.BankruptcyLastSevenYears#','#strProduct.BInfo.ExistingLienToBePaidOff#','#strProduct.BInfo.ForeclosureLastSevenYears#','#strProduct.BInfo.NoLienToBePaidOff#','#strProduct.BInfo.PendingLawsuit#','#strProduct.BundleID#',<cfif Len(strProduct.DueDate)>#CreateODBCDateTime(strProduct.DueDate)#<cfelse>null</cfif>,'#strProduct.Event.ClientCode#','#strProduct.Event.ClientDesc#','#strProduct.Event.Comment#',<cfif Len(strProduct.Event.EventDate)>#CreateODBCDateTime(strProduct.Event.EventDate)#<cfelse>null</cfif>,'#strProduct.Event.EventID#',<cfif Len(strProduct.Event.OccurDate)>#CreateODBCDateTime(strProduct.Event.OccurDate)#<cfelse>null</cfif>,'#strProduct.Event.RECCode#','#strProduct.Event.UDF1#','#strProduct.Event.UDF2#','#strProduct.Event.UDF3#','#strProduct.HazInsInfo.InsAgentName#','#strProduct.HazInsInfo.InsAgentPhone#','#strProduct.HazInsInfo.InsCoAccount#','#strProduct.HazInsInfo.InsCoName#','#strProduct.Instructions#','#strProduct.IssueTo.Addr1#','#strProduct.IssueTo.Addr2#','#strProduct.IssueTo.City#','#strProduct.IssueTo.PrimaryName#','#strProduct.IssueTo.Reference#','#strProduct.IssueTo.State#','#strProduct.IssueTo.Zip#','#strProduct.MktIndicators.DecliningMarketIndicator#','#strProduct.MktIndicators.HighCostAreaIndicator#','#strProduct.ProductCode#','#strProduct.ProviderID#','#strProduct.QuoteRequest#','#strProduct.Reference#','#strProduct.RemitTo.Addr1#','#strProduct.RemitTo.Addr2#','#strProduct.RemitTo.Attn#','#strProduct.RemitTo.City#','#strProduct.RemitTo.Contact.CellPhone#','#strProduct.RemitTo.Contact.DayPhone#','#strProduct.RemitTo.Contact.EMail#','#strProduct.RemitTo.Contact.EvenPhone#','#strProduct.RemitTo.Contact.Fax#','#strProduct.RemitTo.Contact.Name#','#strProduct.RemitTo.Contact.Pager#','#strProduct.RemitTo.Instructions#','#strProduct.RemitTo.ProviderID#','#strProduct.RemitTo.ProviderName#','#strProduct.RemitTo.State#','#strProduct.RemitTo.Zip#',<cfif Len(strProduct.SLABasisDate)>#CreateODBCDateTime(strProduct.SLABasisDate)#<cfelse>null</cfif>,'#strProduct.SLAPrice#','#strProduct.Security.AccountNumber#','#strProduct.Security.Password#','#strProduct.Security.Type#','#strProduct.Security.UserName#','#strProduct.TitleInfo.TitleGrade#','#strProduct.UniqueID#')
</CFQUERY>
</cfloop>

<!--- Credit Score Info --->
<cfset cscr = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/CreditScoreInfoList/CreditScoreInfo")>
<cfif ArrayLen(cscr)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_CScrInfoList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(cscr)#" index="i">
<cfset strCscr = flattenXmlToStruct(cscr[i])>
<cfparam name = "strCscr.BorrowerUniqueID" default="">
<cfparam name = "strCscr.Score" default="">
<cfparam name = "strCscr.Type" default="">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_CScrInfoList (TransactionID,Trns_PrdList_Prod_CScrInfoList_CScrInfo_BorrowerUniqueID,Trns_PrdList_Prod_CScrInfoList_CScrInfo_Score,Trns_PrdList_Prod_CScrInfoList_CScrInfo_Type)
values
('#Trns_TrnsID#','#strCscr.BorrowerUniqueID#','#strCscr.Score#','#strCscr.Type#')
</CFQUERY>
</cfloop>


<!--- Additional Security --->
<cfset addsec = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/Security/AddlSecurityList/AddlSecurity")>
<cfif ArrayLen(addsec)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_AddSecList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(addsec)#" index="i">
<cfset strAddsec = flattenXmlToStruct(addsec[i])>
<cfparam name = "strAddsec.AccountNumber" default="">
<cfparam name = "strAddsec.Password" default="">
<cfparam name = "strAddsec.Type" default="">
<cfparam name = "strAddsec.UserName" default="">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_AddSecList (TransactionID,Trns_PrdList_Prod_Security_AddSecList_AddSec_AccountNumber,Trns_PrdList_Prod_Security_AddSecList_AddSec_Password, Trns_PrdList_Prod_Security_AddSecList_AddSec_Type,Trns_PrdList_Prod_Security_AddSecList_AddSec_UserName)
values
('#Trns_TrnsID#','#strAddsec.AccountNumber#','#strAddsec.Password#','#strAddsec.Type#','#strAddsec.UserName#')
</CFQUERY>
</cfloop>


<!--- XRef list --->
<cfset xref = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/XRefList/XRef")>
<cfif ArrayLen(xref)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_XRefList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(xref)#" index="i">
<cfset strXref = flattenXmlToStruct(xref[i])>
<cfparam name="strXref.XRefType" default="">
<cfparam name="strXref.XRefUniqueID" default="">

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_XRefList (TransactionID,  Trns_PrdList_Prod_XRefList_XRef_XRefType, Trns_PrdList_Prod_XRefList_XRef_XRefUniqueID)
values
('#Trns_TrnsID#', '#strXref.XRefType#', '#strXref.XRefUniqueID#')
</CFQUERY>
</cfloop>


<!--- Workflow list --->
<cfset workflow = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/WorkflowList/Workflow")>
<cfif ArrayLen(workflow)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_WFlowList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(workflow)#" index="i">
<cfset strWorkflow = flattenXmlToStruct(workflow[i])>
<cfparam name="strWorkflow.WorkFlowID" default="">
<cfparam name="strWorkflow.WorkFlowVersion" default="">

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_WFlowList (TransactionID, Trns_PrdList_Prod_WFlowList_WFlow_WFlowID, Trns_PrdList_Prod_WFlowList_WFlow_WFlowVersion)
values
('#Trns_TrnsID#','#strWorkflow.WorkFlowID#', '#strWorkflow.WorkFlowVersion#')
</CFQUERY>
</cfloop>


<!--- RTEvent list --->
<cfset rtevent = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/Event/RTEventIDList")>
<cfif ArrayLen(rtevent)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_RTEventIDList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(rtevent)#" index="i">
<cfset strRtevent = flattenXmlToStruct(rtevent[i])>
<cfparam name="strRtevent.RTEventID" default="">

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_RTEventIDList (TransactionID, Trns_PrdList_Prod_Event_RTEventIDList_RTEventID)
values
('#Trns_TrnsID#','#strRtevent.RTEventID#')
</CFQUERY>
</cfloop>




<!--- Restriction list --->
<cfset restrict = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/RestrictionList/Restriction")>
<cfif ArrayLen(restrict)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_RestrList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(restrict)#" index="i">
<cfset strRestrict = flattenXmlToStruct(restrict[i])>
<cfparam name="strRestrict.RestrictionType" default="">

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_RestrList (TransactionID, Trns_PrdList_Prod_RestrList_Restriction_RestrictionType)
values
('#Trns_TrnsID#','#strRestrict.RestrictionType#')
</CFQUERY>
</cfloop>




<!--- ref num list --->
<cfset refnum = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/ReferenceNumberList/ReferenceNumber")>
<cfif ArrayLen(refnum)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_RefNumList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(refnum)#" index="i">
<cfset strRefnum = flattenXmlToStruct(refnum[i])>
<cfparam name="strRefnum.Reference" default="">
<cfparam name="strRefnum.Type" default="">

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_RefNumList (TransactionID, Trns_PrdList_Prod_RefNumList_RefNum_Reference, Trns_PrdList_Prod_RefNumList_RefNum_Type)
values
('#Trns_TrnsID#','#strRefnum.Reference#', '#strRefnum.Type#')
</CFQUERY>
</cfloop>




<!--- Payment Info List--->
<cfset pmtinfo = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/PaymentInfo/PaymentInfoList/Payment")>
<cfif ArrayLen(pmtinfo)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_PmtInfoList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(pmtinfo)#" index="i">
<cfset strPmtinfo = flattenXmlToStruct(pmtinfo[i])>
<cfparam name="strPmtInfo.Amount" default="">
<cfparam name="strPmtInfo.BillingAddress" default="">
<cfparam name="strPmtInfo.BillingAddress2" default="">
<cfparam name="strPmtInfo.BillingCity" default="">
<cfparam name="strPmtInfo.BillingEmail" default="">
<cfparam name="strPmtInfo.BillingFirstName" default="">
<cfparam name="strPmtInfo.BillingLastName" default="">
<cfparam name="strPmtInfo.BillingPhone" default="">
<cfparam name="strPmtInfo.BillingState" default="">
<cfparam name="strPmtInfo.BillingZip" default="">
<cfparam name="strPmtInfo.CompanyName" default="">
<cfparam name="strPmtInfo.CreditCard.CCNumber" default="">
<cfparam name="strPmtInfo.CreditCard.CCSecurityCode" default="">
<cfparam name="strPmtInfo.CreditCard.CCType" default="">
<cfparam name="strPmtInfo.CreditCard.ExpMonth" default="">
<cfparam name="strPmtInfo.CreditCard.ExpYear" default="">
<cfparam name="strPmtInfo.CreditCard.NameOnCC" default="">
<cfparam name="strPmtInfo.Date" default="">
<cfparam name="strPmtInfo.Instructions" default="">
<cfparam name="strPmtInfo.PmtRef" default="">
<cfparam name="strPmtInfo.PmtType" default="">
<cfparam name="strPmtInfo.Reference" default="">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_PmtInfoList (TransactionID, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_Amount,Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_BillingAddress, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_BillingAddress2,Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_BillingCity, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_BillingEmail,Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_BillingFirstName, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_BillingLastName,Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_BillingPhone, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_BillingState,Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_BillingZip, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_CompanyName,Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_Date, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_Instructions,Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_PmtRef, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_PmtType,Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_Reference)
values
('#Trns_TrnsID#','#strPmtInfo.Amount#','#strPmtInfo.BillingAddress#','#strPmtInfo.BillingAddress2#','#strPmtInfo.BillingCity#','#strPmtInfo.BillingEmail#','#strPmtInfo.BillingFirstName#','#strPmtInfo.BillingLastName#','#strPmtInfo.BillingPhone#','#strPmtInfo.BillingState#','#strPmtInfo.BillingZip#','#strPmtInfo.CompanyName#',<cfif Len(strPmtInfo.Date)>#CreateODBCDateTime(strPmtInfo.Date)#<cfelse>null</cfif>,'#strPmtInfo.Instructions#','#strPmtInfo.PmtRef#','#strPmtInfo.PmtType#','#strPmtInfo.Reference#')
</CFQUERY>
</cfloop>




<!--- Credit Card List--->
<cfset cclist = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/PaymentInfo/PaymentInfoList/Payment/CreditCard")>
<cfif ArrayLen(cclist)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_CreditCardList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(cclist)#" index="i">
<cfset strCclist = flattenXmlToStruct(cclist[i])>
<cfparam name="strCclist.CCNumber" default="">
<cfparam name="strCclist.CCSecurityCode" default="">
<cfparam name="strCclist.CCType" default="">
<cfparam name="strCclist.ExpMonth" default="">
<cfparam name="strCclist.ExpYear" default="">
<cfparam name="strCclist.NameOnCC" default="">

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_CreditCardList (TransactionID, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_CC_CCNumber, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_CC_CCSecurityCode,Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_CC_CCType, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_CC_ExpMonth,Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_CC_ExpYear, Trns_PrdList_Prod_PmtInfo_PmtInfoList_Pmt_CC_NameOnCC)
values
('#Trns_TrnsID#','#strCclist.CCNumber#','#strCclist.CCSecurityCode#','#strCclist.CCType#','#strCclist.ExpMonth#','#strCclist.ExpYear#','#strCclist.NameOnCC#')
</CFQUERY>
</cfloop>

<!--- <cfdump var="#pEventXml#"><br>
<br>
 --->

<!--- CC Borrower Info Lst --->
<cfset binfo = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/CreditCardPaymentInfoList/Payment/BorrowerInfoList/BorrowerInfo")>
<cfif ArrayLen(binfo)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_BInfoList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(binfo)#" index="i">
<cfset strBinfo = flattenXmlToStruct(binfo[i])>

<cfparam name = "strBinfo.BorrowerAddress" default="">
<cfparam name = "strBinfo.BorrowerAddress2" default="">
<cfparam name = "strBinfo.BorrowerCity" default="">
<cfparam name = "strBinfo.BorrowerFirstName" default="">
<cfparam name = "strBinfo.BorrowerLastName" default="">
<cfparam name = "strBinfo.BorrowerState" default="">
<cfparam name = "strBinfo.BorrowerZip" default="">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_BInfoList (TransactionID,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BInfoList_BInfo_BorrowerAddress,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BInfoList_BInfo_BorrowerAddress2,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BInfoList_BInfo_BorrowerCity,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BInfoList_BInfo_BorrowerFirstName,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BInfoList_BInfo_BorrowerLastName,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BInfoList_BInfo_BorrowerState,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BInfoList_BInfo_BorrowerZip)
values
('#Trns_TrnsID#','#strBinfo.BorrowerAddress#','#strBinfo.BorrowerAddress2#','#strBinfo.BorrowerCity#','#strBinfo.BorrowerFirstName#','#strBinfo.BorrowerLastName#','#strBinfo.BorrowerState#','#strBinfo.BorrowerZip#')
</CFQUERY>
</cfloop>





<!--- Credit Card Payment List --->
<cfset ccpayment = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/CreditCardPaymentInfoList/Payment")>
<cfif ArrayLen(ccpayment)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_CCPmtInfoList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(ccpayment)#" index="i">
<cfset strCcpayment = flattenXmlToStruct(ccpayment[i])>
<cfparam name = "strCcpayment.Amount" default="">
<cfparam name = "strCcpayment.AuthorizingPersonnel.PersonnelFirstName" default="">
<cfparam name = "strCcpayment.AuthorizingPersonnel.PersonnelLastName" default="">
<cfparam name = "strCcpayment.AuthorizingPersonnel.PersonnelMiddleName" default="">
<cfparam name = "strCcpayment.BillingAddress" default="">
<cfparam name = "strCcpayment.BillingAddress2" default="">
<cfparam name = "strCcpayment.BillingCity" default="">
<cfparam name = "strCcpayment.BillingEmail" default="">
<cfparam name = "strCcpayment.BillingFirstName" default="">
<cfparam name = "strCcpayment.BillingLastName" default="">
<cfparam name = "strCcpayment.BillingPhone" default="">
<cfparam name = "strCcpayment.BillingState" default="">
<cfparam name = "strCcpayment.BillingZip" default="">
<cfparam name = "strCcpayment.CompanyName" default="">
<cfparam name = "strCcpayment.CreditCard.CreditCardNumber" default="">
<cfparam name = "strCcpayment.CreditCard.CreditCardSecurityCode" default="">
<cfparam name = "strCcpayment.CreditCard.CreditCardType" default="">
<cfparam name = "strCcpayment.CreditCard.ExpMonth" default="">
<cfparam name = "strCcpayment.CreditCard.ExpYear" default="">
<cfparam name = "strCcpayment.CreditCard.NameOnCreditCard" default="">
<cfparam name = "strCcpayment.Date" default="">
<cfparam name = "strCcpayment.Instructions" default="">
<cfparam name = "strCcpayment.PaymentRef" default="">
<cfparam name = "strCcpayment.PaymentType" default="">
<cfparam name = "strCcpayment.Reference" default="">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_CCPmtInfoList (TransactionID,Trns_PrdList_Prod_CCPmtInfoList_Pmt_Amount,Trns_PrdList_Prod_CCPmtInfoList_Pmt_APersonnel_PersonnelFirstName,Trns_PrdList_Prod_CCPmtInfoList_Pmt_APersonnel_PersonnelLastName,Trns_PrdList_Prod_CCPmtInfoList_Pmt_APersonnel_PersonnelMiddleName,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BillingAddress,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BillingAddress2,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BillingCity,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BillingEmail,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BillingFirstName,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BillingLastName,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BillingPhone,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BillingState,Trns_PrdList_Prod_CCPmtInfoList_Pmt_BillingZip,Trns_PrdList_Prod_CCPmtInfoList_Pmt_CompanyName,Trns_PrdList_Prod_CCPmtInfoList_Pmt_CC_CCNumber,Trns_PrdList_Prod_CCPmtInfoList_Pmt_CC_CCSecurityCode,Trns_PrdList_Prod_CCPmtInfoList_Pmt_CC_CCType,Trns_PrdList_Prod_CCPmtInfoList_Pmt_CC_ExpMonth,Trns_PrdList_Prod_CCPmtInfoList_Pmt_CC_ExpYear,Trns_PrdList_Prod_CCPmtInfoList_Pmt_CC_NameOnCC,Trns_PrdList_Prod_CCPmtInfoList_Pmt_Date,Trns_PrdList_Prod_CCPmtInfoList_Pmt_Instructions,Trns_PrdList_Prod_CCPmtInfoList_Pmt_PmtRef,Trns_PrdList_Prod_CCPmtInfoList_Pmt_PmtType,Trns_PrdList_Prod_CCPmtInfoList_Pmt_Reference)
values
('#Trns_TrnsID#','#strCcpayment.Amount#','#strCcpayment.AuthorizingPersonnel.PersonnelFirstName#','#strCcpayment.AuthorizingPersonnel.PersonnelLastName#','#strCcpayment.AuthorizingPersonnel.PersonnelMiddleName#','#strCcpayment.BillingAddress#','#strCcpayment.BillingAddress2#','#strCcpayment.BillingCity#','#strCcpayment.BillingEmail#','#strCcpayment.BillingFirstName#','#strCcpayment.BillingLastName#','#strCcpayment.BillingPhone#','#strCcpayment.BillingState#','#strCcpayment.BillingZip#','#strCcpayment.CompanyName#','#strCcpayment.CreditCard.CreditCardNumber#','#strCcpayment.CreditCard.CreditCardSecurityCode#','#strCcpayment.CreditCard.CreditCardType#','#strCcpayment.CreditCard.ExpMonth#','#strCcpayment.CreditCard.ExpYear#','#strCcpayment.CreditCard.NameOnCreditCard#',<cfif Len(strCcpayment.Date)>#CreateODBCDateTime(strCcpayment.Date)#<cfelse>null</cfif>,'#strCcpayment.Instructions#','#strCcpayment.PaymentRef#','#strCcpayment.PaymentType#','#strCcpayment.Reference#')
</CFQUERY>
</cfloop>



<!--- Attached User List --->
<cfset attuser = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/AttachedUserList/AttachedUser")>
<cfif ArrayLen(attuser)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_AttUserList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(attuser)#" index="i">
<cfset strAttuser = flattenXmlToStruct(attuser[i])>
<cfparam name = "strAttuser.CellPhone" default="">
<cfparam name = "strAttuser.DayPhone" default="">
<cfparam name = "strAttuser.EMail" default="">
<cfparam name = "strAttuser.EvenPhone" default="">
<cfparam name = "strAttuser.Fax" default="">
<cfparam name = "strAttuser.Name" default="">
<cfparam name = "strAttuser.Pager" default="">
<cfparam name = "strAttuser.Reference" default="">
<!--- <cfdump var="#strAttuser#"><BR> --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_AttUserList (TransactionID,Trns_PrdList_Prod_AttUserList_AttUser_CellPhone,Trns_PrdList_Prod_AttUserList_AttUser_DayPhone,Trns_PrdList_Prod_AttUserList_AttUser_EMail,Trns_PrdList_Prod_AttUserList_AttUser_EvenPhone,Trns_PrdList_Prod_AttUserList_AttUser_Fax,Trns_PrdList_Prod_AttUserList_AttUser_Name,Trns_PrdList_Prod_AttUserList_AttUser_Pager,Trns_PrdList_Prod_AttUserList_AttUser_Reference)
values
('#Trns_TrnsID#','#strAttuser.CellPhone#','#strAttuser.DayPhone#','#strAttuser.EMail#','#strAttuser.EvenPhone#','#strAttuser.Fax#','#strAttuser.Name#','#strAttuser.Pager#','#strAttuser.Reference#')
</CFQUERY>
</cfloop>

<!--- Additional Product Data --->
<cfset addproduct = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/AddlProductDataList/AddlProductData")>

<cfif ArrayLen(addproduct)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_AddlProdDataList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(addproduct)#" index="i">
<cfset strAddproduct = flattenXmlToStruct(addproduct[i])>
<cfparam name = "strAddproduct.DataName" default="">
<cfparam name = "strAddproduct.DataValue" default="">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_AddlProdDataList
(TransactionID,Trns_PrdList_Prod_AddlProdDataList_AddlProdData_DataName,Trns_PrdList_Prod_AddlProdDataList_AddlProdData_DataValue)
values
('#Trns_TrnsID#','#strAddproduct.DataName#','#strAddproduct.DataValue#')
</CFQUERY>
</cfloop>


<!--- AassignUser --->
<cfset assignuser = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/AssignUserList/AssignUser")>
<cfif ArrayLen(assignuser)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_AUserList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(assignuser)#" index="i">
<cfset strAssignuser = flattenXmlToStruct(assignuser[i])>
<cfparam name = "strAssignuser.OverrideEmail" default="">
<cfparam name = "strAssignuser.UserFunction" default="">
<cfparam name = "strAssignuser.UserName" default="">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_AUserList (TransactionID,Trns_PrdList_Prod_AUserList_AUser_OverrideEmail,Trns_PrdList_Prod_AUserList_AUser_UserFunction,Trns_PrdList_Prod_AUserList_AUser_UserName)
values
('#Trns_TrnsID#','#strAssignuser.OverrideEmail#','#strAssignuser.UserFunction#','#strAssignuser.UserName#')
</CFQUERY>
</cfloop>


<!--- PropertyTable --->
<cfset property = XmlSearch(pEventXml, "/RealEC-XML/Transaction/PropertyList/Property")>
<cfif ArrayLen(property)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_PropertyList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(property)#" index="i">
<cfset strProperty = flattenXmlToStruct(property[i])>
<!--- <cfdump var="#strProperty#"><br> ---> 

<cfparam name = "strProperty.Addr1" default = "">
<cfparam name = "strProperty.Addr2" default = "">
<cfparam name = "strProperty.Block" default = "">
<cfparam name = "strProperty.Book" default = "">
<cfparam name = "strProperty.Brief" default = "">
<cfparam name = "strProperty.City" default = "">
<cfparam name = "strProperty.ClassType" default = "">
<cfparam name = "strProperty.ClassTypeDesc" default = "">
<cfparam name = "strProperty.ConstructionToPerm" default = "">
<cfparam name = "strProperty.Contact.CellPhone" default = "">
<cfparam name = "strProperty.Contact.DayPhone" default = "">
<cfparam name = "strProperty.Contact.EMail" default = "">
<cfparam name = "strProperty.Contact.EvenPhone" default = "">
<cfparam name = "strProperty.Contact.Fax" default = "">
<cfparam name = "strProperty.Contact.Name" default = "">
<cfparam name = "strProperty.Contact.Pager" default = "">
<cfparam name = "strProperty.CountyFIPS" default = "">
<cfparam name = "strProperty.Description" default = "">
<cfparam name = "strProperty.Development" default = "">
<cfparam name = "strProperty.EstateType" default = "">
<cfparam name = "strProperty.LocType" default = "">
<cfparam name = "strProperty.Location" default = "">
<cfparam name = "strProperty.LockBox" default = "">
<cfparam name = "strProperty.LockBoxCombo" default = "">
<cfparam name = "strProperty.Lot" default = "">
<cfparam name = "strProperty.MannerTitleHeld" default = "">
<cfparam name = "strProperty.NumberOfUnits" default = "">
<cfparam name = "strProperty.Occupancy" default = "">
<cfparam name = "strProperty.PINAPN" default = "">
<cfparam name = "strProperty.PUDIndicator" default = "">
<cfparam name = "strProperty.Page" default = "">
<cfparam name = "strProperty.Phase" default = "">
<cfparam name = "strProperty.PolicyToFollow" default = "">
<cfparam name = "strProperty.ProjectName" default = "">
<cfparam name = "strProperty.Section" default = "">
<cfparam name = "strProperty.SectionTownRange" default = "">
<cfparam name = "strProperty.Situs.Direction1" default = "">
<cfparam name = "strProperty.Situs.Direction2" default = "">
<cfparam name = "strProperty.Situs.Name" default = "">
<cfparam name = "strProperty.Situs.Number" default = "">
<cfparam name = "strProperty.Situs.Type" default = "">
<cfparam name = "strProperty.Situs.Unit" default = "">
<cfparam name = "strProperty.State" default = "">
<cfparam name = "strProperty.StateFIPS" default = "">
<cfparam name = "strProperty.Subdivision" default = "">
<cfparam name = "strProperty.Tract" default = "">
<cfparam name = "strProperty.Type" default = "">
<cfparam name = "strProperty.UniqueID" default = "">
<cfparam name = "strProperty.Unit" default = "">
<cfparam name = "strProperty.UsageType" default = "">
<cfparam name = "strProperty.VestingInfo" default = "">
<cfparam name = "strProperty.Zip" default = "">

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_PropertyList (TransactionID,Trns_PropList_Prop_Addr1,Trns_PropList_Prop_Addr2,Trns_PropList_Prop_Block,Trns_PropList_Prop_Book,Trns_PropList_Prop_Brief,Trns_PropList_Prop_City,Trns_PropList_Prop_ClassType,Trns_PropList_Prop_ClassTypeDesc,Trns_PropList_Prop_ConstructionToPerm,Trns_PropList_Prop_Contact_CellPhone,Trns_PropList_Prop_Contact_DayPhone,Trns_PropList_Prop_Contact_EMail,Trns_PropList_Prop_Contact_EvenPhone,Trns_PropList_Prop_Contact_Fax,Trns_PropList_Prop_Contact_Name,Trns_PropList_Prop_Contact_Pager,Trns_PropList_Prop_CountyFIPS,Trns_PropList_Prop_Description,Trns_PropList_Prop_Development,Trns_PropList_Prop_EstateType,Trns_PropList_Prop_LocType,Trns_PropList_Prop_Location,Trns_PropList_Prop_LockBox,Trns_PropList_Prop_LockBoxCombo,Trns_PropList_Prop_Lot,Trns_PropList_Prop_MannerTitleHeld,Trns_PropList_Prop_NumberOfUnits,Trns_PropList_Prop_Occupancy,Trns_PropList_Prop_PINAPN,Trns_PropList_Prop_PUDIndicator,Trns_PropList_Prop_Page,Trns_PropList_Prop_Phase,Trns_PropList_Prop_PolicyToFollow,Trns_PropList_Prop_ProjectName,Trns_PropList_Prop_Section,Trns_PropList_Prop_SectionTownRange,Trns_PropList_Prop_Situs_Direction1,Trns_PropList_Prop_Situs_Direction2,Trns_PropList_Prop_Situs_Name,Trns_PropList_Prop_Situs_Number,Trns_PropList_Prop_Situs_Type,Trns_PropList_Prop_Situs_Unit,Trns_PropList_Prop_State,Trns_PropList_Prop_StateFIPS,Trns_PropList_Prop_Subdivision,Trns_PropList_Prop_Tract,Trns_PropList_Prop_Type,Trns_PropList_Prop_UniqueID,Trns_PropList_Prop_Unit,Trns_PropList_Prop_UsageType,Trns_PropList_Prop_VestingInfo,Trns_PropList_Prop_Zip)
values
('#Trns_TrnsID#','#strProperty.Addr1#','#strProperty.Addr2#','#strProperty.Block#','#strProperty.Book#','#strProperty.Brief#','#strProperty.City#','#strProperty.ClassType#','#strProperty.ClassTypeDesc#','#strProperty.ConstructionToPerm#','#strProperty.Contact.CellPhone#','#strProperty.Contact.DayPhone#','#strProperty.Contact.EMail#','#strProperty.Contact.EvenPhone#','#strProperty.Contact.Fax#','#strProperty.Contact.Name#','#strProperty.Contact.Pager#','#strProperty.CountyFIPS#','#strProperty.Description#','#strProperty.Development#','#strProperty.EstateType#','#strProperty.LocType#','#strProperty.Location#','#strProperty.LockBox#','#strProperty.LockBoxCombo#','#strProperty.Lot#','#strProperty.MannerTitleHeld#','#strProperty.NumberOfUnits#','#strProperty.Occupancy#','#strProperty.PINAPN#','#strProperty.PUDIndicator#','#strProperty.Page#','#strProperty.Phase#','#strProperty.PolicyToFollow#','#strProperty.ProjectName#','#strProperty.Section#','#strProperty.SectionTownRange#','','','#strProperty.Situs.Name#','#strProperty.Situs.Number#','#strProperty.Situs.Type#','#strProperty.Situs.Unit#','#strProperty.State#','#strProperty.StateFIPS#','#strProperty.Subdivision#','#strProperty.Tract#','#strProperty.Type#','#strProperty.UniqueID#','#strProperty.Unit#','#strProperty.UsageType#','#strProperty.VestingInfo#','#strProperty.Zip#')
</CFQUERY>
</cfloop>



<!--- Struct --->
 <cfset structure = XmlSearch(pEventXml, "/RealEC-XML/Transaction/PropertyList/Property/Structure")>
<cfif ArrayLen(structure)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_Structure
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(structure)#" index="i">
<cfset strStructure = flattenXmlToStruct(structure[i])>
<cfparam name = "strStructure.AttachedGarage" default="">
<cfparam name = "strStructure.Basement" default="">
<cfparam name = "strStructure.Bathrooms" default="">
<cfparam name = "strStructure.Bedrooms" default="">
<cfparam name = "strStructure.CentralAC" default="">
<cfparam name = "strStructure.CrawlSpace" default="">
<cfparam name = "strStructure.DetachedBldg" default="">
<cfparam name = "strStructure.EstValue" default="">
<cfparam name = "strStructure.Fireplaces" default="">
<cfparam name = "strStructure.FoundationType" default="">
<cfparam name = "strStructure.Garage" default="">
<cfparam name = "strStructure.GarageSpaces" default="">
<cfparam name = "strStructure.LivingArea" default="">
<cfparam name = "strStructure.LotSize" default="">
<cfparam name = "strStructure.LotSizeUnit" default="">
<cfparam name = "strStructure.OriginalAppraisalAmount" default="">
<cfparam name = "strStructure.Pool" default="">
<cfparam name = "strStructure.PrevEstValue" default="">
<cfparam name = "strStructure.PrevEstValueSource" default="">
<cfparam name = "strStructure.PropAge" default="">
<cfparam name = "strStructure.PurchaseMonth" default="">
<cfparam name = "strStructure.PurchaseYear" default="">
<cfparam name = "strStructure.Rooms" default="">
<cfparam name = "strStructure.Spa" default="">
<cfparam name = "strStructure.Stories" default="">
<cfparam name = "strStructure.ValueAsOfDate" default="">
<cfparam name = "strStructure.YearBuilt" default="">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_Structure (TransactionID,Trns_PropList_Prop_Strct_AttachedGarage,Trns_PropList_Prop_Strct_Basement,Trns_PropList_Prop_Strct_Bathrooms,Trns_PropList_Prop_Strct_Bedrooms,Trns_PropList_Prop_Strct_CentralAC,Trns_PropList_Prop_Strct_CrawlSpace,Trns_PropList_Prop_Strct_DetachedBldg,Trns_PropList_Prop_Strct_EstValue,Trns_PropList_Prop_Strct_Fireplaces,Trns_PropList_Prop_Strct_FoundationType,Trns_PropList_Prop_Strct_Garage,Trns_PropList_Prop_Strct_GarageSpaces,Trns_PropList_Prop_Strct_LivingArea,Trns_PropList_Prop_Strct_LotSize,Trns_PropList_Prop_Strct_LotSizeUnit,Trns_PropList_Prop_Strct_OriginalAppraisalAmount,Trns_PropList_Prop_Strct_Pool,Trns_PropList_Prop_Strct_PrevEstValue,Trns_PropList_Prop_Strct_PrevEstValueSource,Trns_PropList_Prop_Strct_PropAge,Trns_PropList_Prop_Strct_PurchaseMonth,Trns_PropList_Prop_Strct_PurchaseYear,Trns_PropList_Prop_Strct_Rooms,Trns_PropList_Prop_Strct_Spa,Trns_PropList_Prop_Strct_Stories,Trns_PropList_Prop_Strct_ValueAsOfDate,Trns_PropList_Prop_Strct_YearBuilt)
values
('#Trns_TrnsID#','#strStructure.AttachedGarage#','#strStructure.Basement#','#strStructure.Bathrooms#','#strStructure.Bedrooms#','#strStructure.CentralAC#','#strStructure.CrawlSpace#','#strStructure.DetachedBldg#','#strStructure.EstValue#','#strStructure.Fireplaces#','#strStructure.FoundationType#','#strStructure.Garage#','#strStructure.GarageSpaces#','#strStructure.LivingArea#','#strStructure.LotSize#','#strStructure.LotSizeUnit#','#strStructure.OriginalAppraisalAmount#','#strStructure.Pool#','#strStructure.PrevEstValue#','#strStructure.PrevEstValueSource#','#strStructure.PropAge#','#strStructure.PurchaseMonth#','#strStructure.PurchaseYear#','#strStructure.Rooms#','#strStructure.Spa#','#strStructure.Stories#',<cfif Len(strStructure.ValueAsOfDate)>#CreateODBCDateTime(strStructure.ValueAsOfDate)#<cfelse>null</cfif>,'#strStructure.YearBuilt#')
</CFQUERY>
</cfloop>

<!--- Documents --->
<cfset documents = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/DocumentList/Document")>
<cfif ArrayLen(documents)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
Delete
FROM ChaseRealEC_DocumentList
WHERE TransactionID = '#Trns_TrnsID#'
</CFQUERY>
</cfif>
<cfloop from="1" to="#arrayLen(documents)#" index="i">
<cfset strDocument = flattenXmlToStruct(documents[i])>
<cfparam name="strDocument.Content" default="">
<cfparam name="strDocument.Description" default="">
<cfparam name="strDocument.DocDate" default="">
<cfparam name="strDocument.DocName" default="">
<cfparam name="strDocument.DocPassword" default="">
<cfparam name="strDocument.DocStatus" default="">
<cfparam name="strDocument.DocType" default="">
<cfparam name="strDocument.DocUserID" default="">
<cfparam name="strDocument.DocVersion" default="">
<cfparam name="strDocument.EncodeType" default="">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
Insert into ChaseRealEC_DocumentList (TransactionID,Trns_PrdList_Prod_DocList_Doc_Content,Trns_PrdList_Prod_DocList_Doc_Description,Trns_PrdList_Prod_DocList_Doc_DocDate,Trns_PrdList_Prod_DocList_Doc_DocName,Trns_PrdList_Prod_DocList_Doc_DocPassword,Trns_PrdList_Prod_DocList_Doc_DocStatus,Trns_PrdList_Prod_DocList_Doc_DocType,Trns_PrdList_Prod_DocList_Doc_DocUserID,Trns_PrdList_Prod_DocList_Doc_DocVersion,Trns_PrdList_Prod_DocList_Doc_EncodeType)
values
('#Trns_TrnsID#','#strDocument.Content#','#strDocument.Description#',<cfif Len(strDocument.DocDate)>#CreateODBCDateTime(strDocument.DocDate)#<cfelse>null</cfif>,'#strDocument.DocName#','#strDocument.DocPassword#','#strDocument.DocStatus#','#strDocument.DocType#','#strDocument.DocUserID#','#strDocument.DocVersion#','#strDocument.EncodeType#')
</CFQUERY>
</cfloop>
