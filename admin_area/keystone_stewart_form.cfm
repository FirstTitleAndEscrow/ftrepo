
<cfparam name = "form.ATTN" default = "">
<cfparam name = "form.ATTN_PHONE" default = "">
<cfparam name = "form.BANKRUPTCY_CASE_NUMBER" default = "">
<cfparam name = "form.BANKRUPTCY_DATE_FILED" default = "">
<cfparam name = "form.BANKRUPTCY_FILED_BY" default = "">
<cfparam name = "form.BANKRUPTCY_STATE" default = "">
<cfparam name = "form.BOOK_NUM" default = "">
<cfparam name = "form.CONFIRMED_EXPIRATION" default = "">
<cfparam name = "form.DELINQUENT_BREAKDOWN" default = "">
<cfparam name = "form.DOC_NUM" default = "">
<cfparam name = "form.FC_HELD" default = "">
<cfparam name = "form.FED_TAX_LIEN1_AMOUNT" default = "">
<cfparam name = "form.FED_TAX_LIEN1_DATE" default = "">
<cfparam name = "form.FED_TAX_LIEN2_AMOUNT" default = "">
<cfparam name = "form.FED_TAX_LIEN2_DATE" default = "">
<cfparam name = "form.FIRST_LIEN" default = "">
<cfparam name = "form.FIRST_LIEN_OTHER" default = "">
<cfparam name = "form.INDEMNITY_LETTER" default = "">
<cfparam name = "form.IRS_NOTIFICATION" default = "">
<cfparam name = "form.LAND_SURVEY_ISSUES" default = "">
<cfparam name = "form.MOBILE_HOME_ISSUES" default = "">
<cfparam name = "form.OTHER_ISSUES" default = "">
<cfparam name = "form.PAGE_NUM" default = "">
<cfparam name = "form.PRIOR_LIEN1_BENEFICIARY" default = "">
<cfparam name = "form.PRIOR_LIEN1_BOOKPAGE" default = "">
<cfparam name = "form.PRIOR_LIEN1_GRANTEE" default = "">
<cfparam name = "form.PRIOR_LIEN1_RECORDED" default = "">
<cfparam name = "form.PRIOR_LIEN2_BENEFICIARY" default = "">
<cfparam name = "form.PRIOR_LIEN2_BOOKPAGE" default = "">
<cfparam name = "form.PRIOR_LIEN2_GRANTEE" default = "">
<cfparam name = "form.PRIOR_LIEN2_RECORDED" default = "">
<cfparam name = "form.PRIOR_LIEN1_AMOUNT" default = "">
<cfparam name = "form.PRIOR_LIEN1_DATE" default = "">
<cfparam name = "form.PRIOR_LIEN2_AMOUNT" default = "">
<cfparam name = "form.PRIOR_LIEN2_DATE" default = "">
<cfparam name = "form.REASON_NOT_RECORDED" default = "">
<cfparam name = "form.REVIEWED_BY" default = "">
<cfparam name = "form.REVIEWED_DATE" default = "">
<cfparam name = "form.SALE_RECORDED_DATE" default = "">
<cfparam name = "form.SECOND_LIEN" default = "">
<cfparam name = "form.SENIOR_LIEN" default = "">
<cfparam name = "form.SPECIAL_TAXES_AMOUNT" default = "">
<cfparam name = "form.SPECIAL_TAXES_DUE" default = "">
<cfparam name = "form.SPECIAL_TAXES_TYPE" default = "">
<cfparam name = "form.SUB_LIEN1_AMOUNT" default = "">
<cfparam name = "form.SUB_LIEN1_BENEFICIARY" default = "">
<cfparam name = "form.SUB_LIEN1_BOOKPAGE" default = "">
<cfparam name = "form.SUB_LIEN1_DATE" default = "">
<cfparam name = "form.SUB_LIEN1_GRANTEE" default = "">
<cfparam name = "form.SUB_LIEN1_RECORDED" default = "">
<cfparam name = "form.SUB_LIEN2_AMOUNT" default = "">
<cfparam name = "form.SUB_LIEN2_BENEFICIARY" default = "">
<cfparam name = "form.SUB_LIEN2_BOOKPAGE" default = "">
<cfparam name = "form.SUB_LIEN2_DATE" default = "">
<cfparam name = "form.SUB_LIEN2_GRANTEE" default = "">
<cfparam name = "form.SUB_LIEN2_RECORDED" default = "">
<cfparam name = "form.TAXES_DUE_AMOUNT" default = "">
<cfparam name = "form.TAXES_DUE_TYPE" default = "">
<cfparam name = "form.TAXES_DUE_YEARS" default = "">
<cfparam name = "form.TAXES_NEXT_DUE" default = "">
<cfparam name = "form.TITLE_VESTED_NAME" default = "">
<cfparam name = "form.SUBMIT" default = "">



<cfif form.submit eq 'Save' or form.submit eq 'Save and Mark As Sent'>

<CFQUERY datasource="#request.dsn#" NAME="find_data">
Select * from keystone where order_id = #form.order_id#
</cfquery>
<cfif find_data.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_data">
Insert Into Keystone
(ATTN, ATTN_PHONE, BANKRUPTCY_CASE_NUMBER, BANKRUPTCY_DATE_FILED, BANKRUPTCY_FILED_BY, BANKRUPTCY_STATE, BOOK_NUM, CONFIRMED_EXPIRATION, DELINQUENT_BREAKDOWN, DOC_NUM, FC_HELD, FED_TAX_LIEN1_AMOUNT, FED_TAX_LIEN1_DATE, FED_TAX_LIEN2_AMOUNT, FED_TAX_LIEN2_DATE, FIRST_LIEN, FIRST_LIEN_OTHER, INDEMNITY_LETTER, IRS_NOTIFICATION, LAND_SURVEY_ISSUES, MOBILE_HOME_ISSUES, OTHER_ISSUES, PAGE_NUM, PRIOR_LIEN1_BENEFICIARY, PRIOR_LIEN1_BOOKPAGE, PRIOR_LIEN1_GRANTEE, PRIOR_LIEN1_RECORDED, PRIOR_LIEN2_BENEFICIARY, PRIOR_LIEN2_BOOKPAGE, PRIOR_LIEN2_GRANTEE, PRIOR_LIEN2_RECORDED, PRIOR_LIEN1_AMOUNT, PRIOR_LIEN1_DATE, PRIOR_LIEN2_AMOUNT, PRIOR_LIEN2_DATE, REASON_NOT_RECORDED, REVIEWED_BY, REVIEWED_DATE, SALE_RECORDED_DATE, SECOND_LIEN, SENIOR_LIEN, SPECIAL_TAXES_AMOUNT, SPECIAL_TAXES_DUE, SPECIAL_TAXES_TYPE, SUB_LIEN1_AMOUNT, SUB_LIEN1_BENEFICIARY, SUB_LIEN1_BOOKPAGE, SUB_LIEN1_DATE, SUB_LIEN1_GRANTEE, SUB_LIEN1_RECORDED, SUB_LIEN2_AMOUNT, SUB_LIEN2_BENEFICIARY, SUB_LIEN2_BOOKPAGE, SUB_LIEN2_DATE, SUB_LIEN2_GRANTEE, SUB_LIEN2_RECORDED, TAXES_DUE_AMOUNT, TAXES_DUE_TYPE, TAXES_DUE_YEARS, TAXES_NEXT_DUE, TITLE_VESTED_NAME, ORDER_ID)
values
('#form.ATTN#', '#form.ATTN_PHONE#', '#form.BANKRUPTCY_CASE_NUMBER#', '#form.BANKRUPTCY_DATE_FILED#', '#form.BANKRUPTCY_FILED_BY#', '#form.BANKRUPTCY_STATE#', '#form.BOOK_NUM#', '#form.CONFIRMED_EXPIRATION#', '#form.DELINQUENT_BREAKDOWN#', '#form.DOC_NUM#', '#form.FC_HELD#', '#form.FED_TAX_LIEN1_AMOUNT#', '#form.FED_TAX_LIEN1_DATE#', '#form.FED_TAX_LIEN2_AMOUNT#', '#form.FED_TAX_LIEN2_DATE#', '#form.FIRST_LIEN#', '#form.FIRST_LIEN_OTHER#', '#form.INDEMNITY_LETTER#', '#form.IRS_NOTIFICATION#', '#form.LAND_SURVEY_ISSUES#', '#form.MOBILE_HOME_ISSUES#', '#form.OTHER_ISSUES#', '#form.PAGE_NUM#', '#form.PRIOR_LIEN1_BENEFICIARY#', '#form.PRIOR_LIEN1_BOOKPAGE#', '#form.PRIOR_LIEN1_GRANTEE#', '#form.PRIOR_LIEN1_RECORDED#', '#form.PRIOR_LIEN2_BENEFICIARY#', '#form.PRIOR_LIEN2_BOOKPAGE#', '#form.PRIOR_LIEN2_GRANTEE#', '#form.PRIOR_LIEN2_RECORDED#', '#form.PRIOR_LIEN1_AMOUNT#', '#form.PRIOR_LIEN1_DATE#', '#form.PRIOR_LIEN2_AMOUNT#', '#form.PRIOR_LIEN2_DATE#', '#form.REASON_NOT_RECORDED#', '#form.REVIEWED_BY#', '#form.REVIEWED_DATE#', '#form.SALE_RECORDED_DATE#', '#form.SECOND_LIEN#', '#form.SENIOR_LIEN#', '#form.SPECIAL_TAXES_AMOUNT#', '#form.SPECIAL_TAXES_DUE#', '#form.SPECIAL_TAXES_TYPE#', '#form.SUB_LIEN1_AMOUNT#', '#form.SUB_LIEN1_BENEFICIARY#', '#form.SUB_LIEN1_BOOKPAGE#', '#form.SUB_LIEN1_DATE#', '#form.SUB_LIEN1_GRANTEE#', '#form.SUB_LIEN1_RECORDED#', '#form.SUB_LIEN2_AMOUNT#', '#form.SUB_LIEN2_BENEFICIARY#', '#form.SUB_LIEN2_BOOKPAGE#', '#form.SUB_LIEN2_DATE#', '#form.SUB_LIEN2_GRANTEE#', '#form.SUB_LIEN2_RECORDED#', '#form.TAXES_DUE_AMOUNT#', '#form.TAXES_DUE_TYPE#', '#form.TAXES_DUE_YEARS#', '#form.TAXES_NEXT_DUE#', '#form.TITLE_VESTED_NAME#', '#form.ORDER_ID#')
</cfquery>

<cfelse>


<CFQUERY datasource="#request.dsn#" NAME="insert_data">
Update Keystone 
set ATTN = '#form.ATTN#',
ATTN_PHONE = '#form.ATTN_PHONE#',
BANKRUPTCY_CASE_NUMBER = '#form.BANKRUPTCY_CASE_NUMBER#',
BANKRUPTCY_DATE_FILED = '#form.BANKRUPTCY_DATE_FILED#',
BANKRUPTCY_FILED_BY = '#form.BANKRUPTCY_FILED_BY#',
BANKRUPTCY_STATE = '#form.BANKRUPTCY_STATE#',
BOOK_NUM = '#form.BOOK_NUM#',
CONFIRMED_EXPIRATION = '#form.CONFIRMED_EXPIRATION#',
DELINQUENT_BREAKDOWN = '#form.DELINQUENT_BREAKDOWN#',
DOC_NUM = '#form.DOC_NUM#',
FC_HELD = '#form.FC_HELD#',
FED_TAX_LIEN1_AMOUNT = '#form.FED_TAX_LIEN1_AMOUNT#',
FED_TAX_LIEN1_DATE = '#form.FED_TAX_LIEN1_DATE#',
FED_TAX_LIEN2_AMOUNT = '#form.FED_TAX_LIEN2_AMOUNT#',
FED_TAX_LIEN2_DATE = '#form.FED_TAX_LIEN2_DATE#',
FIRST_LIEN = '#form.FIRST_LIEN#',
FIRST_LIEN_OTHER = '#form.FIRST_LIEN_OTHER#',
INDEMNITY_LETTER = '#form.INDEMNITY_LETTER#',
IRS_NOTIFICATION = '#form.IRS_NOTIFICATION#',
LAND_SURVEY_ISSUES = '#form.LAND_SURVEY_ISSUES#',
MOBILE_HOME_ISSUES = '#form.MOBILE_HOME_ISSUES#',
OTHER_ISSUES = '#form.OTHER_ISSUES#',
PAGE_NUM = '#form.PAGE_NUM#',
PRIOR_LIEN1_BENEFICIARY = '#form.PRIOR_LIEN1_BENEFICIARY#',
PRIOR_LIEN1_BOOKPAGE = '#form.PRIOR_LIEN1_BOOKPAGE#',
PRIOR_LIEN1_GRANTEE = '#form.PRIOR_LIEN1_GRANTEE#',
PRIOR_LIEN1_RECORDED = '#form.PRIOR_LIEN1_RECORDED#',
PRIOR_LIEN2_BENEFICIARY = '#form.PRIOR_LIEN2_BENEFICIARY#',
PRIOR_LIEN2_BOOKPAGE = '#form.PRIOR_LIEN2_BOOKPAGE#',
PRIOR_LIEN2_GRANTEE = '#form.PRIOR_LIEN2_GRANTEE#',
PRIOR_LIEN2_RECORDED = '#form.PRIOR_LIEN2_RECORDED#',
PRIOR_LIEN1_AMOUNT = '#form.PRIOR_LIEN1_AMOUNT#',
PRIOR_LIEN1_DATE = '#form.PRIOR_LIEN1_DATE#',
PRIOR_LIEN2_AMOUNT = '#form.PRIOR_LIEN2_AMOUNT#',
PRIOR_LIEN2_DATE = '#form.PRIOR_LIEN2_DATE#',
REASON_NOT_RECORDED = '#form.REASON_NOT_RECORDED#',
REVIEWED_BY = '#form.REVIEWED_BY#',
REVIEWED_DATE = '#form.REVIEWED_DATE#',
SALE_RECORDED_DATE = '#form.SALE_RECORDED_DATE#',
SECOND_LIEN = '#form.SECOND_LIEN#',
SENIOR_LIEN = '#form.SENIOR_LIEN#',
SPECIAL_TAXES_AMOUNT = '#form.SPECIAL_TAXES_AMOUNT#',
SPECIAL_TAXES_DUE = '#form.SPECIAL_TAXES_DUE#',
SPECIAL_TAXES_TYPE = '#form.SPECIAL_TAXES_TYPE#',
SUB_LIEN1_AMOUNT = '#form.SUB_LIEN1_AMOUNT#',
SUB_LIEN1_BENEFICIARY = '#form.SUB_LIEN1_BENEFICIARY#',
SUB_LIEN1_BOOKPAGE = '#form.SUB_LIEN1_BOOKPAGE#',
SUB_LIEN1_DATE = '#form.SUB_LIEN1_DATE#',
SUB_LIEN1_GRANTEE = '#form.SUB_LIEN1_GRANTEE#',
SUB_LIEN1_RECORDED = '#form.SUB_LIEN1_RECORDED#',
SUB_LIEN2_AMOUNT = '#form.SUB_LIEN2_AMOUNT#',
SUB_LIEN2_BENEFICIARY = '#form.SUB_LIEN2_BENEFICIARY#',
SUB_LIEN2_BOOKPAGE = '#form.SUB_LIEN2_BOOKPAGE#',
SUB_LIEN2_DATE = '#form.SUB_LIEN2_DATE#',
SUB_LIEN2_GRANTEE = '#form.SUB_LIEN2_GRANTEE#',
SUB_LIEN2_RECORDED = '#form.SUB_LIEN2_RECORDED#',
TAXES_DUE_AMOUNT = '#form.TAXES_DUE_AMOUNT#',
TAXES_DUE_TYPE = '#form.TAXES_DUE_TYPE#',
TAXES_DUE_YEARS = '#form.TAXES_DUE_YEARS#',
TAXES_NEXT_DUE = '#form.TAXES_NEXT_DUE#',
TITLE_VESTED_NAME = '#form.TITLE_VESTED_NAME#'
WHERE ORDER_ID = '#form.order_id#'
</cfquery>
</cfif>
<cfif form.submit eq "Save and Mark As Sent">

<cflocation url="/admin_area/title_committment_submit.cfm?#cgi.query_string#&go_through=1">
<cfelse>
<center><BR><font color="red">The Title Commitment Checklist has been Saved</font></center><br>
</cfif>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="find_data">
Select * from keystone where order_id = #url.rec_id#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_title_info">
Select * from title where title_id = #url.rec_id#
</cfquery>


<center>
<font face="Arial, Helvetica, sans-serif">The Client has requested that the following information be<BR> filled-out, which will be sent along with the Title Commitment:</center><br>
<br>

<form action="<cfoutput>#cgi.SCRIPT_NAME#?#CGI.QUERY_STRING#</cfoutput>" method="post">
<cfoutput>
<input type="hidden" name="order_id" value="#rec_id#">

<style>
TD {font-family:Arial, Helvetica, sans-serif; font-size:12px; color:black;}
.tableframe {border-top-color:black; 
          border-top-width:1px;
		  border-top-style:solid;
		  border-bottom-color:black; 
          border-bottom-width:1px;
		  border-bottom-style:solid;
		  border-left-color:black; 
          border-left-width:1px;
		  border-left-style:solid;
		  border-right-color:black; 
          border-right-width:1px;
		  border-right-style:solid;}
input   {font-size: 9; 
		font-family: verdana; 
		font-style: normal; 
		color: 003F1E; 
		background-color: E4E3E3; 
		border-color: white; 
		border-left-width: thin; 
		border-right-width: thin; 
		border-top-width: thin; 
		border-bottom-width: thin; 
		border-width: thin; 
		border-style: bar; 
		clear: none;}
</style>
<table width="700" class="tableframe" cellpadding="6" cellspacing="6">
<tr>
<td width="100%"> 

<div align="center">
<table width="200" cellpadding="6" cellspacing="6"><tr><td class="tableframe" align="center">
<strong>REO Title Summary</strong>
</td></tr></table>
</div>
<br>
<br>
REO ##: <BR>
Client Name: <BR>
Loan ##:  #get_title_info.loan_number#<BR>
Property Address: #get_title_info.paddress#, #get_title_info.pcity#, #get_title_info.pstate# #get_title_info.pzip#5<BR>
<BR>
<BR>
<BR>
<table>
<tr>
<td width="50" align="left" valign="top">TO:</td>
<td align="left" valign="top"><strong>Streamline, Title & Escrow Services, LLC</strong><br>
Attention: <input type="text" size="35" name="attn" value="#find_data.attn#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone ##  <input type="text" size="14" name="attn_phone" value="#find_data.attn_phone#"></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">FC Sale Held: <input type="text" size="10" name="FC_held" value="#find_data.FC_held#">&nbsp;&nbsp;Confirmed/Redemption Expiration: <input type="text" size="10" name="confirmed_expiration" value="#find_data.confirmed_expiration#">&nbsp;&nbsp;FC Sale Deed Recorded:&nbsp;&nbsp;Date <input type="text" size="10" name="sale_recorded_date" value="#find_data.sale_recorded_date#"></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Doc ##: <input type="text" size="10" name="doc_num" value="#find_data.doc_num#">&nbsp;&nbsp;Book ##: <input type="text" size="10" name="book_num" value="#find_data.book_num#">&nbsp;&nbsp;Page ##: <input type="text" size="10" name="page_num" value="#find_data.page_num#"></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Reason if not recorded:: <input type="text" size="35" name="reason_not_recorded" value="#find_data.reason_not_recorded#"></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>

<tr>
<td colspan="2" align="left" valign="top">Please review title and verify the following:</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Title vested in name of: <input type="text" size="35" name="title_vested_name" value="#find_data.title_vested_name#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Client’s lien position:    1st <input type="text" size="5" name="first_lien" value="#find_data.first_lien#">&nbsp;&nbsp;&nbsp;2nd <input type="text" size="5" name="second_lien" value="#find_data.second_lien#">&nbsp;&nbsp;&nbsp;(Sr. lien held by: <input type="text" size="35" name="senior_lien" value="#find_data.senior_lien#">)</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">If other, explain: <input type="text" size="55" name="first_lien_other" value="#find_data.first_lien#"><br>
<br>
</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Please note any issues, including but not limited to:</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Taxes:</td>
<td align="left" valign="top">Next Due <input type="text" size="12" name="taxes_next_due" value="#find_data.taxes_next_due#">&nbsp;&nbsp;&nbsp;$ <input type="text" size="12" name="taxes_due_amount" value="#find_data.taxes_due_amount#">&nbsp;&nbsp;&nbsp;Year(s) <input type="text" size="12" name="taxes_due_years" value="#find_data.taxes_due_years#">&nbsp;&nbsp;&nbsp;Type <input type="text" size="12" name="taxes_due_type" value="#find_data.taxes_due_type#">
</td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Delinquent  (breakdown) <input type="text" size="62" name="delinquent_breakdown" value="#find_data.delinquent_breakdown#"></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Special Assessment / Utility Taxes:</td>
<td align="left" valign="top">Due: <input type="text" size="12" name="special_taxes_due" value="#find_data.special_taxes_due#">&nbsp;&nbsp;&nbsp;Type <input type="text" size="12" name="special_taxes_type" value="#find_data.special_taxes_type#">&nbsp;&nbsp;&nbsp;$ <input type="text" size="12" name="special_taxes_amount" value="#find_data.special_taxes_amount#"></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Open Bankruptcy:</td>
<td align="left" valign="top">Filed By: <input type="text" size="25" name="bankruptcy_filed_by" value="#find_data.bankruptcy_filed_by#">&nbsp;&nbsp;&nbsp;Date Filed <input type="text" size="12" name="bankruptcy_date_filed" value="#find_data.bankruptcy_date_filed#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Case ##/Chapter: <input type="text" size="12" name="bankruptcy_case_number" value="#find_data.bankruptcy_case_number#">&nbsp;&nbsp;&nbsp;District & State: <input type="text" size="25" name="bankruptcy_state" value="#find_data.bankruptcy_state#"></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Exceptions  (MUST list all loans/liens that are showing of record):</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Prior/open liens:</td>
<td align="left" valign="top">Dated: <input type="text" size="12" name="prior_lien1_date" value="#find_data.prior_lien1_date#">&nbsp;&nbsp;&nbsp;$ <input type="text" size="25" name="prior_lien1_amount" value="#find_data.prior_lien1_amount#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Recorded: <input type="text" size="12" name="prior_lien1_recorded" value="#find_data.prior_lien1_recorded#">&nbsp;&nbsp;&nbsp;Book/Page ##: <input type="text" size="25" name="prior_lien1_bookpage" value="#find_data.prior_lien1_bookpage#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Beneficiary: <input type="text" size="25" name="prior_lien1_beneficiary" value="#find_data.prior_lien1_beneficiary#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Grantee: <input type="text" size="25" name="prior_lien1_grantee" value="#find_data.prior_lien1_grantee#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">&nbsp;</td>
</tr>




<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Dated: <input type="text" size="12" name="prior_lien2_date" value="#find_data.prior_lien2_date#">&nbsp;&nbsp;&nbsp;$ <input type="text" size="25" name="prior_lien2_amount" value="#find_data.prior_lien2_amount#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Recorded: <input type="text" size="12" name="prior_lien2_recorded" value="#find_data.prior_lien2_recorded#">&nbsp;&nbsp;&nbsp;Book/Page ##: <input type="text" size="25" name="prior_lien2_bookpage" value="#find_data.prior_lien2_bookpage#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Beneficiary: <input type="text" size="25" name="prior_lien2_beneficiary" value="#find_data.prior_lien2_beneficiary#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Grantee: <input type="text" size="25" name="prior_lien2_grantee" value="#find_data.prior_lien2_grantee#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">&nbsp;</td>
</tr>

<tr>
<td colspan="2" align="left" valign="top">Assignment issue(s) (specify):</td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">If lien (s) still existing, did we receive an indemnity letter from originating title company to clear these issues?: <input type="text" size="5" name="indemnity_letter" value="#find_data.indemnity_letter#"></td>
</tr>




<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Subordinate loans/liens:</td>
<td align="left" valign="top">Dated: <input type="text" size="12" name="sub_lien1_date" value="#find_data.sub_lien1_date#">&nbsp;&nbsp;&nbsp;$ <input type="text" size="25" name="sub_lien1_amount" value="#find_data.sub_lien1_amount#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Recorded: <input type="text" size="12" name="sub_lien1_recorded" value="#find_data.sub_lien1_recorded#">&nbsp;&nbsp;&nbsp;Book/Page ##: <input type="text" size="25" name="sub_lien1_bookpage" value="#find_data.sub_lien1_bookpage#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Beneficiary: <input type="text" size="25" name="sub_lien1_beneficiary" value="#find_data.sub_lien1_beneficiary#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Grantee: <input type="text" size="25" name="sub_lien1_grantee" value="#find_data.sub_lien1_grantee#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">&nbsp;</td>
</tr>


<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Dated: <input type="text" size="12" name="sub_lien2_date" value="#find_data.sub_lien2_date#">&nbsp;&nbsp;&nbsp;$ <input type="text" size="25" name="sub_lien2_amount" value="#find_data.sub_lien2_amount#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Recorded: <input type="text" size="12" name="sub_lien2_recorded" value="#find_data.sub_lien2_recorded#">&nbsp;&nbsp;&nbsp;Book/Page ##: <input type="text" size="25" name="sub_lien2_bookpage" value="#find_data.sub_lien2_bookpage#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Beneficiary: <input type="text" size="25" name="sub_lien2_beneficiary" value="#find_data.sub_lien2_beneficiary#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Grantee: <input type="text" size="25" name="sub_lien2_grantee" value="#find_data.sub_lien2_grantee#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">&nbsp;</td>
</tr>

<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Federal Tax Liens:</td>
<td align="left" valign="top">Dated: <input type="text" size="12" name="fed_tax_lien1_date" value="#find_data.fed_tax_lien1_date#">&nbsp;&nbsp;&nbsp;$ <input type="text" size="25" name="fed_tax_lien1_amount" value="#find_data.fed_tax_lien1_amount#"></td>
</tr>
<tr>
<td width="125" align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">Dated: <input type="text" size="12" name="fed_tax_lien2_date" value="#find_data.fed_tax_lien2_date#">&nbsp;&nbsp;&nbsp;$ <input type="text" size="25" name="fed_tax_lien2_amount" value="#find_data.fed_tax_lien2_amount#"></td>
</tr>



<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Was the IRS given proper notification and therefore lien(s) no longer an issue?: <input type="text" size="5" name="irs_notification" value="#find_data.irs_notification#"></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Mobile Home issues (i.e. not converted to Real Property): <input type="text" size="55" name="mobile_home_issues" value="#find_data.mobile_home_issues#"></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top">Land/survey/encroachment issues: <input type="text" size="55" name="land_survey_issues" value="#find_data.land_survey_issues#"></td>
</tr>
<tr>
<td colspan="2" align="left" valign="top"><HR></td>
</tr>
<tr>
<td width="125" align="left" valign="top">Other:</td>
<td align="left" valign="top"><input type="text" size="65" name="other_issues" value="#find_data.other_issues#"><br>
<br>
<br>
<br>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td align="left" valign="top">Reviewed By: <input type="text" size="25" name="reviewed_by" value="#find_data.reviewed_by#">&nbsp;&nbsp;&nbsp;&nbsp;Date: <input type="text" size="12" name="reviewed_date" value="#find_data.reviewed_date#"></td>
</tr>
  <tr>
    <td align="center" valign="top" colspan="3"><input name="submit" type="submit" value="Save">&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="submit" value="Save and Mark As Sent"></td>
  </tr>
</table> 
<br>
<br>
<br>

 
</td></tr></table>
</cfoutput>
<br>
<br></font>
<cfinclude template="../title_committment_view_stewart_title_ins.cfm">
</form>