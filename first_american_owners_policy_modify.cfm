<cfparam name="form.submit" default="">
<CFQUERY datasource="#request.dsn#" NAME="read_Title">
    SELECT *
	FROM Title
	WHERE Title_ID = #rec_ID#
</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_FT_company">
    SELECT *
	FROM Companies
	WHERE ID = #read_Title.comp_id#
</CFQUERY>


<script language="javascript">

function clear_mort_one() {
document.form.mort1_1.value='';
document.form.lienintro1.value='';
document.form.mort1_2.value='';
document.form.mort1_3.value='';
document.form.amt1.value='';
document.form.docnum1.value='';
document.form.book1.value='';
document.form.page1.value='';
document.form.inst_mon1.value='';
document.form.inst_day1.value='';
document.form.inst_year1.value='';
document.form.rec_mon1.value='';
document.form.rec_day1.value='';
document.form.rec_year1.value='';
document.form.openend1.value='';
document.form.trustee1.value='';
document.form.info1_1.value='';
document.form.info1_2.value='';
document.form.ass1_1.value='';
document.form.doc_num1_1.value='';
document.form.book1_1.value='';
document.form.page1_1.value='';
document.form.rec_mon1_1.value='';
document.form.rec_day1_1.value='';
document.form.rec_year1_1.value='';
document.form.ass1_2.value='';
document.form.doc_num1_2.value='';
document.form.book1_2.value='';
document.form.page1_2.value='';
document.form.rec_mon1_2.value='';
document.form.rec_day1_2.value='';
document.form.rec_year1_2.value='';
document.form.ass1_3.value='';
document.form.doc_num1_3.value='';
document.form.book1_3.value='';
document.form.page1_3.value='';
document.form.rec_mon1_3.value='';
document.form.rec_day1_3.value='';
document.form.rec_year1_3.value='';
document.form.ass1_4.value='';
document.form.doc_num1_4.value='';
document.form.book1_4.value='';
document.form.page1_4.value='';
document.form.rec_mon1_4.value='';
document.form.rec_day1_4.value='';
document.form.rec_year1_4.value='';
}


function clear_mort_two() {
document.form.mort2_1.value='';
document.form.lienintro2.value='';
document.form.mort2_2.value='';
document.form.mort2_3.value='';
document.form.amt2.value='';
document.form.docnum2.value='';
document.form.book2.value='';
document.form.page2.value='';
document.form.inst_mon2.value='';
document.form.inst_day2.value='';
document.form.inst_year2.value='';
document.form.rec_mon2.value='';
document.form.rec_day2.value='';
document.form.rec_year2.value='';
document.form.openend2.value='';
document.form.trustee2.value='';
document.form.info2_1.value='';
document.form.info2_2.value='';
document.form.ass2_1.value='';
document.form.doc_num2_1.value='';
document.form.book2_1.value='';
document.form.page2_1.value='';
document.form.rec_mon2_1.value='';
document.form.rec_day2_1.value='';
document.form.rec_year2_1.value='';
document.form.ass2_2.value='';
document.form.doc_num2_2.value='';
document.form.book2_2.value='';
document.form.page2_2.value='';
document.form.rec_mon2_2.value='';
document.form.rec_day2_2.value='';
document.form.rec_year2_2.value='';
document.form.ass2_3.value='';
document.form.doc_num2_3.value='';
document.form.book2_3.value='';
document.form.page2_3.value='';
document.form.rec_mon2_3.value='';
document.form.rec_day2_3.value='';
document.form.rec_year2_3.value='';
document.form.ass2_4.value='';
document.form.doc_num2_4.value='';
document.form.book2_4.value='';
document.form.page2_4.value='';
document.form.rec_mon2_4.value='';
document.form.rec_day2_4.value='';
document.form.rec_year2_4.value='';
}


</script>

<cfif form.submit eq 'Save Changes'>
<cfparam name="form.AMT1" default="NULL">
<cfparam name="form.AMT2" default="NULL">
<cfparam name="form.ASS1_1" default="NULL">
<cfparam name="form.ASS1_2" default="NULL">
<cfparam name="form.ASS1_3" default="NULL">
<cfparam name="form.ASS1_4" default="NULL">
<cfparam name="form.ASS2_1" default="NULL">
<cfparam name="form.ASS2_2" default="NULL">
<cfparam name="form.ASS2_3" default="NULL">
<cfparam name="form.ASS2_4" default="NULL">
<cfparam name="form.BOOK1" default="NULL">
<cfparam name="form.BOOK1_1" default="NULL">
<cfparam name="form.BOOK1_2" default="NULL">
<cfparam name="form.BOOK1_3" default="NULL">
<cfparam name="form.BOOK1_4" default="NULL">
<cfparam name="form.BOOK2" default="NULL">
<cfparam name="form.BOOK2_1" default="NULL">
<cfparam name="form.BOOK2_2" default="NULL">
<cfparam name="form.BOOK2_3" default="NULL">
<cfparam name="form.BOOK2_4" default="NULL">
<cfparam name="form.DOCNUM1" default="NULL">
<cfparam name="form.DOCNUM2" default="NULL">
<cfparam name="form.DOC_NUM1_1" default="NULL">
<cfparam name="form.DOC_NUM1_2" default="NULL">
<cfparam name="form.DOC_NUM1_3" default="NULL">
<cfparam name="form.DOC_NUM1_4" default="NULL">
<cfparam name="form.DOC_NUM2_1" default="NULL">
<cfparam name="form.DOC_NUM2_2" default="NULL">
<cfparam name="form.DOC_NUM2_3" default="NULL">
<cfparam name="form.DOC_NUM2_4" default="NULL">
<cfparam name="form.INFO1_1" default="NULL">
<cfparam name="form.INFO1_2" default="NULL">
<cfparam name="form.INFO2_1" default="NULL">
<cfparam name="form.INFO2_2" default="NULL">
<cfparam name="form.INST_DAY1" default="NULL">
<cfparam name="form.INST_DAY2" default="NULL">
<cfparam name="form.INST_MON1" default="NULL">
<cfparam name="form.INST_MON2" default="NULL">
<cfparam name="form.INST_YEAR1" default="NULL">
<cfparam name="form.INST_YEAR2" default="NULL">
<cfparam name="form.LIENINTRO1" default="NULL">
<cfparam name="form.LIENINTRO2" default="NULL">
<cfparam name="form.MORT1_1" default="NULL">
<cfparam name="form.MORT1_2" default="NULL">
<cfparam name="form.MORT1_3" default="NULL">
<cfparam name="form.MORT2_1" default="NULL">
<cfparam name="form.MORT2_2" default="NULL">
<cfparam name="form.MORT2_3" default="NULL">
<cfparam name="form.OPENEND1" default="NULL">
<cfparam name="form.OPENEND2" default="NULL">
<cfparam name="form.PAGE1" default="NULL">
<cfparam name="form.PAGE1_1" default="NULL">
<cfparam name="form.PAGE1_2" default="NULL">
<cfparam name="form.PAGE1_3" default="NULL">
<cfparam name="form.PAGE1_4" default="NULL">
<cfparam name="form.PAGE2" default="NULL">
<cfparam name="form.PAGE2_1" default="NULL">
<cfparam name="form.PAGE2_2" default="NULL">
<cfparam name="form.PAGE2_3" default="NULL">
<cfparam name="form.PAGE2_4" default="NULL">
<cfparam name="form.REC_DAY1" default="NULL">
<cfparam name="form.REC_DAY1_1" default="NULL">
<cfparam name="form.REC_DAY1_2" default="NULL">
<cfparam name="form.REC_DAY1_3" default="NULL">
<cfparam name="form.REC_DAY1_4" default="NULL">
<cfparam name="form.REC_DAY2" default="NULL">
<cfparam name="form.REC_DAY2_1" default="NULL">
<cfparam name="form.REC_DAY2_2" default="NULL">
<cfparam name="form.REC_DAY2_3" default="NULL">
<cfparam name="form.REC_DAY2_4" default="NULL">
<cfparam name="form.REC_MON1" default="NULL">
<cfparam name="form.REC_MON1_1" default="NULL">
<cfparam name="form.REC_MON1_2" default="NULL">
<cfparam name="form.REC_MON1_3" default="NULL">
<cfparam name="form.REC_MON1_4" default="NULL">
<cfparam name="form.REC_MON2" default="NULL">
<cfparam name="form.REC_MON2_1" default="NULL">
<cfparam name="form.REC_MON2_2" default="NULL">
<cfparam name="form.REC_MON2_3" default="NULL">
<cfparam name="form.REC_MON2_4" default="NULL">
<cfparam name="form.REC_YEAR1" default="NULL">
<cfparam name="form.REC_YEAR1_1" default="NULL">
<cfparam name="form.REC_YEAR1_2" default="NULL">
<cfparam name="form.REC_YEAR1_3" default="NULL">
<cfparam name="form.REC_YEAR1_4" default="NULL">
<cfparam name="form.REC_YEAR2" default="NULL">
<cfparam name="form.REC_YEAR2_1" default="NULL">
<cfparam name="form.REC_YEAR2_2" default="NULL">
<cfparam name="form.REC_YEAR2_3" default="NULL">
<cfparam name="form.REC_YEAR2_4" default="NULL">
<cfparam name="form.TRUSTEE1" default="NULL">
<cfparam name="form.TRUSTEE2" default="NULL">
<cfparam name="form.prop_tax_day" default="NULL">
<cfparam name="form.prop_tax_month" default="NULL">
<cfparam name="form.prop_tax_year" default="NULL">

<CFQUERY datasource="#request.dsn#" name="check_morts">
select * from Owner_policy_Morts
where title_id = #url.rec_id#
</CFQUERY>

<cfif check_morts.recordcount>
<CFQUERY datasource="#request.dsn#" name="update_morts">
Update owner_policy_morts
set AMT1 = '#AMT1#',
AMT2 = '#AMT2#',
ASS1_1 = '#ASS1_1#',
ASS1_2 = '#ASS1_2#',
ASS1_3 = '#ASS1_3#',
ASS1_4 = '#ASS1_4#',
ASS2_1 = '#ASS2_1#',
ASS2_2 = '#ASS2_2#',
ASS2_3 = '#ASS2_3#',
ASS2_4 = '#ASS2_4#',
BOOK1 = '#BOOK1#',
BOOK1_1 = '#BOOK1_1#',
BOOK1_2 = '#BOOK1_2#',
BOOK1_3 = '#BOOK1_3#',
BOOK1_4 = '#BOOK1_4#',
BOOK2 = '#BOOK2#',
BOOK2_1 = '#BOOK2_1#',
BOOK2_2 = '#BOOK2_2#',
BOOK2_3 = '#BOOK2_3#',
BOOK2_4 = '#BOOK2_4#',
DOCNUM1 = '#DOCNUM1#',
DOCNUM2 = '#DOCNUM2#',
DOC_NUM1_1 = '#DOC_NUM1_1#',
DOC_NUM1_2 = '#DOC_NUM1_2#',
DOC_NUM1_3 = '#DOC_NUM1_3#',
DOC_NUM1_4 = '#DOC_NUM1_4#',
DOC_NUM2_1 = '#DOC_NUM2_1#',
DOC_NUM2_2 = '#DOC_NUM2_2#',
DOC_NUM2_3 = '#DOC_NUM2_3#',
DOC_NUM2_4 = '#DOC_NUM2_4#',
INFO1_1 = '#INFO1_1#',
INFO1_2 = '#INFO1_2#',
INFO2_1 = '#INFO2_1#',
INFO2_2 = '#INFO2_2#',
INST_DAY1 = '#INST_DAY1#',
INST_DAY2 = '#INST_DAY2#',
INST_MON1 = '#INST_MON1#',
INST_MON2 = '#INST_MON2#',
INST_YEAR1 = '#INST_YEAR1#',
INST_YEAR2 = '#INST_YEAR2#',
LIENINTRO1 = '#LIENINTRO1#',
LIENINTRO2 = '#LIENINTRO2#',
MORT1_1 = '#MORT1_1#',
MORT1_2 = '#MORT1_2#',
MORT1_3 = '#MORT1_3#',
MORT2_1 = '#MORT2_1#',
MORT2_2 = '#MORT2_2#',
MORT2_3 = '#MORT2_3#',
OPENEND1 = '#OPENEND1#',
OPENEND2 = '#OPENEND2#',
PAGE1 = '#PAGE1#',
PAGE1_1 = '#PAGE1_1#',
PAGE1_2 = '#PAGE1_2#',
PAGE1_3 = '#PAGE1_3#',
PAGE1_4 = '#PAGE1_4#',
PAGE2 = '#PAGE2#',
PAGE2_1 = '#PAGE2_1#',
PAGE2_2 = '#PAGE2_2#',
PAGE2_3 = '#PAGE2_3#',
PAGE2_4 = '#PAGE2_4#',
REC_DAY1 = '#REC_DAY1#',
REC_DAY1_1 = '#REC_DAY1_1#',
REC_DAY1_2 = '#REC_DAY1_2#',
REC_DAY1_3 = '#REC_DAY1_3#',
REC_DAY1_4 = '#REC_DAY1_4#',
REC_DAY2 = '#REC_DAY2#',
REC_DAY2_1 = '#REC_DAY2_1#',
REC_DAY2_2 = '#REC_DAY2_2#',
REC_DAY2_3 = '#REC_DAY2_3#',
REC_DAY2_4 = '#REC_DAY2_4#',
REC_MON1 = '#REC_MON1#',
REC_MON1_1 = '#REC_MON1_1#',
REC_MON1_2 = '#REC_MON1_2#',
REC_MON1_3 = '#REC_MON1_3#',
REC_MON1_4 = '#REC_MON1_4#',
REC_MON2 = '#REC_MON2#',
REC_MON2_1 = '#REC_MON2_1#',
REC_MON2_2 = '#REC_MON2_2#',
REC_MON2_3 = '#REC_MON2_3#',
REC_MON2_4 = '#REC_MON2_4#',
REC_YEAR1 = '#REC_YEAR1#',
REC_YEAR1_1 = '#REC_YEAR1_1#',
REC_YEAR1_2 = '#REC_YEAR1_2#',
REC_YEAR1_3 = '#REC_YEAR1_3#',
REC_YEAR1_4 = '#REC_YEAR1_4#',
REC_YEAR2 = '#REC_YEAR2#',
REC_YEAR2_1 = '#REC_YEAR2_1#',
REC_YEAR2_2 = '#REC_YEAR2_2#',
REC_YEAR2_3 = '#REC_YEAR2_3#',
REC_YEAR2_4 = '#REC_YEAR2_4#',
TRUSTEE1 = '#TRUSTEE1#',
TRUSTEE2 = '#TRUSTEE2#'
where title_id = #url.rec_id#
</cfquery>
<cfelse>
<CFQUERY datasource="#request.dsn#" name="insert_morts">
Insert into owner_policy_morts (TITLE_ID, AMT1, AMT2, ASS1_1, ASS1_2, ASS1_3, ASS1_4, ASS2_1, ASS2_2, ASS2_3, ASS2_4, BOOK1, BOOK1_1, BOOK1_2, BOOK1_3, BOOK1_4, BOOK2, BOOK2_1, BOOK2_2, BOOK2_3, BOOK2_4, DOCNUM1, DOCNUM2, DOC_NUM1_1, DOC_NUM1_2, DOC_NUM1_3, DOC_NUM1_4, DOC_NUM2_1, DOC_NUM2_2, DOC_NUM2_3, DOC_NUM2_4, INFO1_1, INFO1_2, INFO2_1, INFO2_2, INST_DAY1, INST_DAY2, INST_MON1, INST_MON2, INST_YEAR1, INST_YEAR2, LIENINTRO1, LIENINTRO2, MORT1_1, MORT1_2, MORT1_3, MORT2_1, MORT2_2, MORT2_3, OPENEND1, OPENEND2, PAGE1, PAGE1_1, PAGE1_2, PAGE1_3, PAGE1_4, PAGE2, PAGE2_1, PAGE2_2, PAGE2_3, PAGE2_4, REC_DAY1, REC_DAY1_1, REC_DAY1_2, REC_DAY1_3, REC_DAY1_4, REC_DAY2, REC_DAY2_1, REC_DAY2_2, REC_DAY2_3, REC_DAY2_4, REC_MON1, REC_MON1_1, REC_MON1_2, REC_MON1_3, REC_MON1_4, REC_MON2, REC_MON2_1, REC_MON2_2, REC_MON2_3, REC_MON2_4, REC_YEAR1, REC_YEAR1_1, REC_YEAR1_2, REC_YEAR1_3, REC_YEAR1_4, REC_YEAR2, REC_YEAR2_1, REC_YEAR2_2, REC_YEAR2_3, REC_YEAR2_4, TRUSTEE1, TRUSTEE2)
Values
('#form.rec_id#', '#AMT1#', '#AMT2#', '#ASS1_1#', '#ASS1_2#', '#ASS1_3#', '#ASS1_4#', '#ASS2_1#', '#ASS2_2#', '#ASS2_3#', '#ASS2_4#', '#BOOK1#', '#BOOK1_1#', '#BOOK1_2#', '#BOOK1_3#', '#BOOK1_4#', '#BOOK2#', '#BOOK2_1#', '#BOOK2_2#', '#BOOK2_3#', '#BOOK2_4#', '#DOCNUM1#', '#DOCNUM2#', '#DOC_NUM1_1#', '#DOC_NUM1_2#', '#DOC_NUM1_3#', '#DOC_NUM1_4#', '#DOC_NUM2_1#', '#DOC_NUM2_2#', '#DOC_NUM2_3#', '#DOC_NUM2_4#', '#INFO1_1#', '#INFO1_2#', '#INFO2_1#', '#INFO2_2#', '#INST_DAY1#', '#INST_DAY2#', '#INST_MON1#', '#INST_MON2#', '#INST_YEAR1#', '#INST_YEAR2#', '#LIENINTRO1#', '#LIENINTRO2#', '#MORT1_1#', '#MORT1_2#', '#MORT1_3#', '#MORT2_1#', '#MORT2_2#', '#MORT2_3#', '#OPENEND1#', '#OPENEND2#', '#PAGE1#', '#PAGE1_1#', '#PAGE1_2#', '#PAGE1_3#', '#PAGE1_4#', '#PAGE2#', '#PAGE2_1#', '#PAGE2_2#', '#PAGE2_3#', '#PAGE2_4#', '#REC_DAY1#', '#REC_DAY1_1#', '#REC_DAY1_2#', '#REC_DAY1_3#', '#REC_DAY1_4#', '#REC_DAY2#', '#REC_DAY2_1#', '#REC_DAY2_2#', '#REC_DAY2_3#', '#REC_DAY2_4#', '#REC_MON1#', '#REC_MON1_1#', '#REC_MON1_2#', '#REC_MON1_3#', '#REC_MON1_4#', '#REC_MON2#', '#REC_MON2_1#', '#REC_MON2_2#', '#REC_MON2_3#', '#REC_MON2_4#', '#REC_YEAR1#', '#REC_YEAR1_1#', '#REC_YEAR1_2#', '#REC_YEAR1_3#', '#REC_YEAR1_4#', '#REC_YEAR2#', '#REC_YEAR2_1#', '#REC_YEAR2_2#', '#REC_YEAR2_3#', '#REC_YEAR2_4#', '#TRUSTEE1#', '#TRUSTEE2#')
</cfquery>
</cfif>

<CFQUERY datasource="#request.dsn#" name="update_title">
update title
set
POLICY_NUMBER = '#form.POLICY_NUMBER#',
SIMULTANEOUS_NUMBER = '#form.SIMULTANEOUS_NUMBER#',
LOAN_NUMBER_OVERRIDE = '#form.LOAN_NUMBER_OVERRIDE#',
PADDRESS_OVERRIDE = '#form.PADDRESS_OVERRIDE#',
INS_AMOUNT_OVERRIDE = '#form.INS_AMOUNT_OVERRIDE#',
PREMIUM_OVERRIDE = '#form.PREMIUM_OVERRIDE#',
POLICY_DATE_OVERRIDE = '#form.POLICY_DATE_OVERRIDE#',
INS_NAME_OVERRIDE = '#form.INS_NAME_OVERRIDE#',
INTEREST_OVERRIDE = '#form.INTEREST_OVERRIDE#',
VESTED_OVERRIDE = '#form.VESTED_OVERRIDE#',
TAX_ID_OVERRIDE = '#form.TAX_ID_OVERRIDE#',
prop_tax_day = '#form.prop_tax_day#',
prop_tax_month = '#form.prop_tax_month#',
prop_tax_year = '#form.prop_tax_year#'
where title_id = #url.rec_id#
</CFQUERY>

<cflocation url="first_american_owners_policy.cfm?#cgi.QUERY_STRING#" addtoken="no">
</cfif>

<CFQUERY datasource="#request.dsn#" name="read_morts">
select * from Owner_policy_Morts
where title_id = #url.rec_id#
</CFQUERY>
<cfparam name="read_morts.AMT1" default="">
<cfparam name="read_morts.AMT2" default="">
<cfparam name="read_morts.ASS1_1" default="">
<cfparam name="read_morts.ASS1_2" default="">
<cfparam name="read_morts.ASS1_3" default="">
<cfparam name="read_morts.ASS1_4" default="">
<cfparam name="read_morts.ASS2_1" default="">
<cfparam name="read_morts.ASS2_2" default="">
<cfparam name="read_morts.ASS2_3" default="">
<cfparam name="read_morts.ASS2_4" default="">
<cfparam name="read_morts.BOOK1" default="">
<cfparam name="read_morts.BOOK1_1" default="">
<cfparam name="read_morts.BOOK1_2" default="">
<cfparam name="read_morts.BOOK1_3" default="">
<cfparam name="read_morts.BOOK1_4" default="">
<cfparam name="read_morts.BOOK2" default="">
<cfparam name="read_morts.BOOK2_1" default="">
<cfparam name="read_morts.BOOK2_2" default="">
<cfparam name="read_morts.BOOK2_3" default="">
<cfparam name="read_morts.BOOK2_4" default="">
<cfparam name="read_morts.DOCNUM1" default="">
<cfparam name="read_morts.DOCNUM2" default="">
<cfparam name="read_morts.DOC_NUM1_1" default="">
<cfparam name="read_morts.DOC_NUM1_2" default="">
<cfparam name="read_morts.DOC_NUM1_3" default="">
<cfparam name="read_morts.DOC_NUM1_4" default="">
<cfparam name="read_morts.DOC_NUM2_1" default="">
<cfparam name="read_morts.DOC_NUM2_2" default="">
<cfparam name="read_morts.DOC_NUM2_3" default="">
<cfparam name="read_morts.DOC_NUM2_4" default="">
<cfparam name="read_morts.INFO1_1" default="">
<cfparam name="read_morts.INFO1_2" default="">
<cfparam name="read_morts.INFO2_1" default="">
<cfparam name="read_morts.INFO2_2" default="">
<cfparam name="read_morts.INST_DAY1" default="">
<cfparam name="read_morts.INST_DAY2" default="">
<cfparam name="read_morts.INST_MON1" default="">
<cfparam name="read_morts.INST_MON2" default="">
<cfparam name="read_morts.INST_YEAR1" default="">
<cfparam name="read_morts.INST_YEAR2" default="">
<cfparam name="read_morts.LIENINTRO1" default="">
<cfparam name="read_morts.LIENINTRO2" default="">
<cfparam name="read_morts.MORT1_1" default="">
<cfparam name="read_morts.MORT1_2" default="">
<cfparam name="read_morts.MORT1_3" default="">
<cfparam name="read_morts.MORT2_1" default="">
<cfparam name="read_morts.MORT2_2" default="">
<cfparam name="read_morts.MORT2_3" default="">
<cfparam name="read_morts.OPENEND1" default="">
<cfparam name="read_morts.OPENEND2" default="">
<cfparam name="read_morts.PAGE1" default="">
<cfparam name="read_morts.PAGE1_1" default="">
<cfparam name="read_morts.PAGE1_2" default="">
<cfparam name="read_morts.PAGE1_3" default="">
<cfparam name="read_morts.PAGE1_4" default="">
<cfparam name="read_morts.PAGE2" default="">
<cfparam name="read_morts.PAGE2_1" default="">
<cfparam name="read_morts.PAGE2_2" default="">
<cfparam name="read_morts.PAGE2_3" default="">
<cfparam name="read_morts.PAGE2_4" default="">
<cfparam name="read_morts.REC_DAY1" default="">
<cfparam name="read_morts.REC_DAY1_1" default="">
<cfparam name="read_morts.REC_DAY1_2" default="">
<cfparam name="read_morts.REC_DAY1_3" default="">
<cfparam name="read_morts.REC_DAY1_4" default="">
<cfparam name="read_morts.REC_DAY2" default="">
<cfparam name="read_morts.REC_DAY2_1" default="">
<cfparam name="read_morts.REC_DAY2_2" default="">
<cfparam name="read_morts.REC_DAY2_3" default="">
<cfparam name="read_morts.REC_DAY2_4" default="">
<cfparam name="read_morts.REC_MON1" default="">
<cfparam name="read_morts.REC_MON1_1" default="">
<cfparam name="read_morts.REC_MON1_2" default="">
<cfparam name="read_morts.REC_MON1_3" default="">
<cfparam name="read_morts.REC_MON1_4" default="">
<cfparam name="read_morts.REC_MON2" default="">
<cfparam name="read_morts.REC_MON2_1" default="">
<cfparam name="read_morts.REC_MON2_2" default="">
<cfparam name="read_morts.REC_MON2_3" default="">
<cfparam name="read_morts.REC_MON2_4" default="">
<cfparam name="read_morts.REC_YEAR1" default="">
<cfparam name="read_morts.REC_YEAR1_1" default="">
<cfparam name="read_morts.REC_YEAR1_2" default="">
<cfparam name="read_morts.REC_YEAR1_3" default="">
<cfparam name="read_morts.REC_YEAR1_4" default="">
<cfparam name="read_morts.REC_YEAR2" default="">
<cfparam name="read_morts.REC_YEAR2_1" default="">
<cfparam name="read_morts.REC_YEAR2_2" default="">
<cfparam name="read_morts.REC_YEAR2_3" default="">
<cfparam name="read_morts.REC_YEAR2_4" default="">
<cfparam name="read_morts.TRUSTEE1" default="">
<cfparam name="read_morts.TRUSTEE2" default="">

<cfparam name="read_title.prop_tax_year" default="">
<cfparam name="read_title.prop_tax_month" default="">
<cfparam name="read_title.prop_tax_day" default="">


<CFQUERY datasource="#request.dsn#" name="check_shapiro">
Select child_ids from companies where ID = 2368 or ID = 3011 or ID = 2372
</CFQUERY>
<cfset children = check_shapiro.child_ids>
<cfloop query="check_shapiro" startrow="2">
<cfif check_shapiro.child_ids neq "" and check_shapiro.child_ids neq 'NULL'>
<cfset children = children & "," & "#check_shapiro.child_ids#">
</cfif>
</cfloop>

<CFQUERY datasource="#request.dsn#" NAME="read_data2">
			SELECT *
			FROM hud_form_title_pg2
			WHERE Title_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title_update">
            select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
            is not null </cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_deeds">
SELECT     *
FROM         title_ins_view
WHERE     (type = 'DATA') AND (title_id = #url.rec_ID#)
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
        is not null
        </cfquery>


<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFQUERY datasource="#request.dsn#" NAME="read_tax">
			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_Title">
    SELECT *
	FROM Title
	WHERE Title_ID = #rec_ID#
</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_FT_company">
    SELECT *
	FROM Companies
	WHERE ID = #read_Title.comp_id#
</CFQUERY>



<CFSET Buyer_1 = #read_Title.bfirstname1# & " " & #read_Title.bminame1# & " " & #read_Title.blastname1#>
<CFSET Buyer_2 = #read_Title.bfirstname2# & " " & #read_Title.bminame2# & " " & #read_Title.blastname2#>
<CFSET Seller_1 = #read_Title.sfirstname1# & " " & #read_Title.sminame1# & " " & #read_Title.slastname1#>
<CFSET Seller_2 = #read_Title.sfirstname2# & " " & #read_Title.sminame2# & " " & #read_Title.slastname2#>

<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">
    SELECT *
	FROM Doc_Title_Insurance_Title
	WHERE Title_ID = #rec_ID# and Insurance_co = 16
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
    SELECT *
	FROM Doc_Title_Insurance_Title
	WHERE Title_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
    SELECT *
	FROM  Company_Billing_states
	WHERE company_id = #read_title.comp_id# AND a_states = '#read_title.pstate#'
</CFQUERY>

<cfif #get_billing_states.recordcount# GT "0">
    <CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values
		WHERE company_id = #read_title.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>

    <CFQUERY datasource="#request.dsn#" NAME="read_age">
		SELECT *
		FROM  company_agency_assoc
		WHERE billing_id = '#get_billing_states.billing_id#'
    </CFQUERY>

<cfif #read_age.recordcount# gt "0">

      <!---If the State is California or Nevada then they need to be the company 21 which is E-Title--->
      <CFIF #read_title.pstate# eq "CA">
          <CFSET 	title_ft_agency_id = "21">
      <CFELSEIF #read_title.pstate# eq "NV">
              <CFSET 	title_ft_agency_id = "21">
      <CFELSE>
          <CFSET 	title_ft_agency_id = "#read_age.title_ft_agency_id#">
      </CFIF>

      <CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
          SELECT *
      	FROM  title_ft_agencies
      	WHERE title_ft_agency_id = #title_ft_agency_id#
      </CFQUERY>

      <cfset FT_Agency = #trim(read_Title_FT_Agency_company.Company)#>
<cfelse>
        <CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		    SELECT *
		    FROM  title_ft_agencies
		    WHERE 0=1
	    </CFQUERY>
</cfif>

<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		SELECT *
		FROM  title_ft_agencies
		WHERE 0 = 1

</CFQUERY>

</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="Read_Doc">
			SELECT *
			FROM Doc_Amer_Pioneer_Ins_ALL_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM Title_Companies
			WHERE Title_Co_ID = 16
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">
			SELECT *
			FROM Doc_Amer_Pioneer_Ins_ALL_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>


				<CFQUERY datasource="#request.dsn#" NAME="read_tax_info">

			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_deed_info">
		SELECT     *
FROM         title_ins_view
WHERE     (title_id = #rec_id#) AND (type = 'DATA')
ORDER BY insert_date, insert_time DESC
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_data_info">
		SELECT     *
FROM        doc_title_insurance_title
WHERE     (title_id = #rec_id#)
</CFQUERY>

<HEAD>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


</head>
<BODY>

<cfform action="#CGI.SCRIPT_NAME#?#cgi.QUERY_STRING#" method="post" name="form">
<cfoutput>
<input type="hidden" name="rec_id" value="#rec_id#">
</cfoutput>
<style>
TD {font-size:9pt}
</style>

<P>


<!----1st page starts ----->
<!----------body table starts---------->
<!--- <table width=98% cellpadding=0 cellspacing=0 border=2 align="center" bordercolor="000000" bordercolordark="000000" bordercolorlight="000000">
<tr><td valign="top" align="center">
====================================================================== --->

<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td align="left"><div align="center"><br>
<br>
<br>
<font size="+2"><strong>ALTA Owner's Policy 2006</strong></font><br>
<br>
<strong>OWNER'S POLICY OF TITLE INSURANCE<br>
<br>
Issued by<br>
<br>
<font size="+1">FIRST AMERICAN TITLE INSURANCE COMPANY</font><br>
<br>
SCHEDULE A</strong></div><br>
<br>
<br>
<cfoutput>
File No.: <strong>T-#rec_id#</strong> &nbsp;&nbsp;&nbsp; Policy No.:

<INPUT type="text" NAME="policy_number" SIZE=25 MAXLENGTH=50
									VALUE="<cfif #read_title.policy_number# neq "" and #read_title.policy_number# neq 'NULL'>#read_title.policy_number#</cfif>"
									style="font-size: 9pt;
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
									clear: none;" ><br><br>


Simultaneous Number: <INPUT type="text" NAME="simultaneous_number" SIZE=25 MAXLENGTH=50
									VALUE="<cfif #read_title.simultaneous_number# neq "" and #read_title.simultaneous_number# neq 'NULL'>#read_title.simultaneous_number#</cfif>"
									style="font-size: 9pt;
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
									border-style: bar;" > &nbsp;&nbsp;&nbsp; Loan Number:


<INPUT type="text" NAME="loan_number_override" SIZE=25 MAXLENGTH=50
									VALUE="<cfif #read_title.loan_number_override# neq "" and #read_title.loan_number_override# neq 'NULL'>#read_title.loan_number_override#<cfelse><cfif #read_title.loan_number# neq "" and #read_title.loan_number# neq 'NULL'>#read_title.loan_number#</cfif></cfif>"
									style="font-size: 9pt;
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
									clear: none;" ><br><br>
Address Reference: <INPUT type="text" NAME="paddress_override" SIZE=70 MAXLENGTH=100
									VALUE="<cfif #read_title.paddress_override# neq "" and #read_title.paddress_override# neq 'NULL'>#read_title.paddress_override#<cfelse>#read_title.paddress#, #read_title.pcity#, #read_title.pstate# #read_title.pzip#</cfif>"
									style="font-size: 9pt;
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
									clear: none;" ><br><br>

Amount of Insurance: $<INPUT type="text" NAME="ins_amount_override" SIZE=25 MAXLENGTH=50
									VALUE="<cfif #read_title.ins_amount_override# neq "" and #read_title.ins_amount_override# neq 'NULL'>#read_title.ins_amount_override#<cfelse><cfif IsNumeric(Trim(read_title.purchase)) and #read_title.purchase# neq "" and #read_title.purchase# neq 0 and #read_title.purchase# neq 'NULL'>#read_title.Purchase#<cfelse>TBD</cfif></cfif>"
									style="font-size: 9pt;
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
									clear: none;" > &nbsp;&nbsp;&nbsp; Premium: $<INPUT type="text" NAME="premium_override" SIZE=25 MAXLENGTH=50
									VALUE="<cfif #read_title.premium_override# neq "" and #read_title.premium_override# neq 'NULL'>#read_title.premium_override#<cfelse><cfif isnumeric(read_data2.a_1108_a)>#read_data2.a_1108_a#<cfelse>#read_data2.a_1108_a#</cfif></cfif>"
									style="font-size: 9pt;
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
									clear: none;" ><br><br>



Date of Policy: <INPUT type="text" NAME="policy_date_override" SIZE=25 MAXLENGTH=50
									VALUE="<cfif #read_title.policy_date_override# neq "" and #read_title.policy_date_override# neq 'NULL'>#read_title.policy_date_override#<cfelse><CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data1# neq "">
				#DateFormat(read_title_update.data37, "mm")#/#DateFormat(read_title_update.data37, "dd")#/#DateFormat(read_title_update.data37, "yyyy")#</cfif></cfif>"
									style="font-size: 9pt;
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
									clear: none;" ><br>
<br>

<br><br>
1. Name of Insured:<br><br>
<INPUT type="text" NAME="ins_name_override" SIZE=50 MAXLENGTH=50
									VALUE="<cfif #read_title.ins_name_override# neq "" and #read_title.ins_name_override# neq 'NULL'>#read_title.ins_name_override#<cfelse>#Buyer_1#, &nbsp;&nbsp;#Buyer_2#</cfif>"
									style="font-size: 9pt;
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
									clear: none;" >

									<br><br>
2. The estate or interest in the Land that is insured by this policy is:<br><br>
<INPUT type="text" NAME="interest_override" SIZE=50 MAXLENGTH=50
									VALUE="<cfif #read_title.interest_override# neq "" and #read_title.interest_override# neq 'NULL'>#read_title.interest_override#<cfelse><CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data38# neq "">
				#read_title_update.data38#</cfif></cfif>"
									style="font-size: 9pt;
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
									clear: none;" ><br><br>
3. Title Vested in:<br><br>
<INPUT type="text" NAME="vested_override" SIZE=50 MAXLENGTH=50
									VALUE="<cfif #read_title.vested_override# neq "" and #read_title.vested_override# neq 'NULL'>#read_title.vested_override#<cfelse>#Buyer_1#, &nbsp;&nbsp;#Buyer_2#</cfif>"
									style="font-size: 9pt;
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
									clear: none;" ><br><br>
4. The Land referred to in this policy is described as follows:<br><br>
See attached Legal Description<br><br>
TAX ID NUMBER: <INPUT type="text" NAME="tax_id_override" SIZE=25 MAXLENGTH=50
									VALUE="<cfif #read_title.tax_id_override# neq "" and #read_title.tax_id_override# neq 'NULL'>#read_title.tax_id_override#<cfelse><cfif #read_tax.acctnum# neq "" and #read_tax.acctnum# neq 'NULL'>#read_tax.acctnum#</cfif></cfif>"
									style="font-size: 9pt;
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
									clear: none;" ><br><br>
<table>
<tr>
<td width="60%" align="left" valign="top"><strong>First American Title Insurance Company</strong><br>
<br>
<br>
<br>
______________________________<br>
<strong>Countersigned Authorized Signature</strong>
</td>
<td width="40%" align="left" valign="top"><strong>Dated this 14 Day of May, 2008<br>
Issued by:<br>
<cfif read_FT_company.streamline_client eq 'True'>Streamline Title<cfelse>First Title</cfif> & Escrow Services, LLC<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive, Suite 450<br>
Rockville, MD 20850</strong><br>
<cfelse>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855</strong><br>
</cfif>

</td>
</tr>
</table><br>
<br>
<HR>


</cfoutput>
</td>
	</tr>
</table>





MORTGAGES<br>
<br>

<table>
<!--- ===/ LOAN PROCESSOR INFO \=== --->

	<tr>
		<td width=498 colspan="3" align=left valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<nobr><B>Mortgage 1</B> Information : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="clear_mort_one_button" value="clear" onClick="clear_mort_one();"></nobr></td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgagee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="mort1_1"  value="#read_morts.mort1_1#" size=40 maxlength=100
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage Intro


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<select name="lienintro1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">


<option value="" <cfif read_morts.lienintro1 eq ''>selected</cfif>>Leave Blank</option>
<option value="Satisfaction and/or release of" <cfif read_morts.lienintro1 eq 'Satisfaction and/or release of'>selected</cfif>>Satisfaction and/or release of</option>
<option value="Borrowers affidavit that he is not the same person as mentioned in the" <cfif read_morts.lienintro1 eq 'Borrowers affidavit that he is not the same person as mentioned in the'>selected</cfif>>Borrowers affidavit that he is not the same person as mentioned in the</option>
<option value="Subject to the effects of the foreclosure of" <cfif read_morts.lienintro1 eq 'Subject to the effects of the foreclosure of'>selected</cfif>>Subject to the effects of the foreclosure of</option>
<option value="Subordination of mortgage" <cfif read_morts.lienintro1 eq 'Subordination of mortgage'>selected</cfif>>Subordination of mortgage</option>
</select>


		</td>
	</tr>
<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgagor 1


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="mort1_2"  value="#read_morts.mort1_2#" size=40 maxlength=100
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgagor 2


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="mort1_3"  value="#read_morts.mort1_3#" size=40 maxlength=100
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>


	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Amount


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="amt1" value="#read_morts.amt1#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="docnum1"  value="#read_morts.docnum1#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="book1"  value="#read_morts.book1#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="page1" value="#read_morts.page1#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Date of Mortgage


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="inst_mon1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.inst_mon1 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.inst_mon1 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.inst_mon1 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.inst_mon1 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.inst_mon1 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.inst_mon1 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.inst_mon1 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.inst_mon1 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.inst_mon1 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.inst_mon1 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.inst_mon1 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.inst_mon1 eq '12'>selected</cfif>>December</option>


</select>

<select name="inst_day1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.inst_day1 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.inst_day1 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.inst_day1 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.inst_day1 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.inst_day1 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.inst_day1 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.inst_day1 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.inst_day1 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.inst_day1 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.inst_day1 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.inst_day1 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.inst_day1 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.inst_day1 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.inst_day1 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.inst_day1 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.inst_day1 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.inst_day1 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.inst_day1 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.inst_day1 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.inst_day1 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.inst_day1 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.inst_day1 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.inst_day1 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.inst_day1 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.inst_day1 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.inst_day1 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.inst_day1 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.inst_day1 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.inst_day1 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.inst_day1 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.inst_day1 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="inst_year1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.inst_year1 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.inst_year1 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.inst_year1 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.inst_year1 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.inst_year1 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.inst_year1 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.inst_year1 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.inst_year1 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.inst_year1 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.inst_year1 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.inst_year1 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.inst_year1 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.inst_year1 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.inst_year1 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.inst_year1 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.inst_year1 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.inst_year1 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.inst_year1 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.inst_year1 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.inst_year1 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.inst_year1 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.inst_year1 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.inst_year1 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.inst_year1 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.inst_year1 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.inst_year1 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.inst_year1 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.inst_year1 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.inst_year1 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.inst_year1 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.inst_year1 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.inst_year1 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.inst_year1 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.inst_year1 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.inst_year1 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.inst_year1 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.inst_year1 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.inst_year1 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.inst_year1 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.inst_year1 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.inst_year1 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.inst_year1 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.inst_year1 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.inst_year1 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.inst_year1 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.inst_year1 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.inst_year1 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.inst_year1 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.inst_year1 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.inst_year1 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.inst_year1 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.inst_year1 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.inst_year1 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.inst_year1 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.inst_year1 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.inst_year1 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.inst_year1 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.inst_year1 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.inst_year1 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.inst_year1 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.inst_year1 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.inst_year1 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.inst_year1 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.inst_year1 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.inst_year1 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.inst_year1 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.inst_year1 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.inst_year1 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.inst_year1 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.inst_year1 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.inst_year1 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.inst_year1 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.inst_year1 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.inst_year1 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.inst_year1 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.inst_year1 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.inst_year1 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.inst_year1 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.inst_year1 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.inst_year1 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.inst_year1 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.inst_year1 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.inst_year1 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.inst_year1 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.inst_year1 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.inst_year1 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.inst_year1 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.inst_year1 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.inst_year1 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.inst_year1 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.inst_year1 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.inst_year1 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.inst_year1 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.inst_year1 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.inst_year1 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.inst_year1 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.inst_year1 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.inst_year1 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.inst_year1 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.inst_year1 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.inst_year1 eq '1920'>selected</cfif>>1920</option>
		</select> </nobr>



		</td>
	</tr>
		<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mon1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.rec_mon1 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.rec_mon1 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.rec_mon1 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.rec_mon1 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.rec_mon1 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.rec_mon1 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.rec_mon1 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.rec_mon1 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.rec_mon1 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.rec_mon1 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.rec_mon1 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.rec_mon1 eq '12'>selected</cfif>>December</option>


</select>

<select name="rec_day1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.rec_day1 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.rec_day1 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.rec_day1 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.rec_day1 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.rec_day1 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.rec_day1 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.rec_day1 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.rec_day1 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.rec_day1 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.rec_day1 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.rec_day1 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.rec_day1 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.rec_day1 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.rec_day1 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.rec_day1 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.rec_day1 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.rec_day1 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.rec_day1 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.rec_day1 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.rec_day1 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.rec_day1 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.rec_day1 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.rec_day1 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.rec_day1 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.rec_day1 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.rec_day1 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.rec_day1 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.rec_day1 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.rec_day1 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.rec_day1 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.rec_day1 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="rec_year1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.rec_year1 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.rec_year1 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.rec_year1 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.rec_year1 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.rec_year1 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.rec_year1 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.rec_year1 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.rec_year1 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.rec_year1 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.rec_year1 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.rec_year1 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.rec_year1 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.rec_year1 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.rec_year1 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.rec_year1 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.rec_year1 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.rec_year1 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.rec_year1 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.rec_year1 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.rec_year1 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.rec_year1 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.rec_year1 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.rec_year1 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.rec_year1 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.rec_year1 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.rec_year1 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.rec_year1 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.rec_year1 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.rec_year1 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.rec_year1 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.rec_year1 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.rec_year1 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.rec_year1 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.rec_year1 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.rec_year1 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.rec_year1 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.rec_year1 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.rec_year1 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.rec_year1 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.rec_year1 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.rec_year1 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.rec_year1 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.rec_year1 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.rec_year1 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.rec_year1 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.rec_year1 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.rec_year1 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.rec_year1 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.rec_year1 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.rec_year1 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.rec_year1 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.rec_year1 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.rec_year1 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.rec_year1 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.rec_year1 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.rec_year1 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.rec_year1 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.rec_year1 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.rec_year1 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.rec_year1 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.rec_year1 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.rec_year1 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.rec_year1 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.rec_year1 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.rec_year1 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.rec_year1 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.rec_year1 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.rec_year1 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.rec_year1 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.rec_year1 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.rec_year1 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.rec_year1 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.rec_year1 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.rec_year1 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.rec_year1 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.rec_year1 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.rec_year1 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.rec_year1 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.rec_year1 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.rec_year1 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.rec_year1 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.rec_year1 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.rec_year1 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.rec_year1 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.rec_year1 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.rec_year1 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.rec_year1 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.rec_year1 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.rec_year1 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.rec_year1 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.rec_year1 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.rec_year1 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.rec_year1 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.rec_year1 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.rec_year1 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.rec_year1 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.rec_year1 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.rec_year1 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.rec_year1 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.rec_year1 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.rec_year1 eq '1920'>selected</cfif>>1920</option>
		</select> </nobr>



		</td>
	</tr>



	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Open End


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="openend1"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none;"
			rows="5"
			cols="45"
			>
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Yes" <cfif read_morts.openend1 eq 'Yes'>selected</cfif>>Yes</OPTION>
			<OPTION VALUE="No" <cfif read_morts.openend1 eq 'No'>selected</cfif>>No</OPTION>


			</SELECT>
</td>
	</tr>


	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Trustee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="trustee1"  value="#read_morts.trustee1#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Information


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="info1_1" value="#read_morts.info1_1#"  size=40 maxlength=150
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >

		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>



		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="info1_2" value="#read_morts.info1_2#"  size=40 maxlength=150
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >

		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1st Assignee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="ass1_1" value="#read_morts.ass1_1#"  size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="doc_num1_1" value="#read_morts.doc_num1_1#"  size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="book1_1" value="#read_morts.book1_1#"  size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="page1_1" value="#read_morts.page1_1#"  size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mon1_1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.rec_mon1_1 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.rec_mon1_1 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.rec_mon1_1 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.rec_mon1_1 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.rec_mon1_1 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.rec_mon1_1 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.rec_mon1_1 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.rec_mon1_1 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.rec_mon1_1 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.rec_mon1_1 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.rec_mon1_1 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.rec_mon1_1 eq '12'>selected</cfif>>December</option>


</select>

<select name="rec_day1_1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.rec_day1_1 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.rec_day1_1 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.rec_day1_1 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.rec_day1_1 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.rec_day1_1 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.rec_day1_1 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.rec_day1_1 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.rec_day1_1 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.rec_day1_1 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.rec_day1_1 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.rec_day1_1 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.rec_day1_1 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.rec_day1_1 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.rec_day1_1 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.rec_day1_1 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.rec_day1_1 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.rec_day1_1 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.rec_day1_1 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.rec_day1_1 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.rec_day1_1 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.rec_day1_1 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.rec_day1_1 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.rec_day1_1 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.rec_day1_1 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.rec_day1_1 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.rec_day1_1 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.rec_day1_1 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.rec_day1_1 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.rec_day1_1 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.rec_day1_1 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.rec_day1_1 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="rec_year1_1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.rec_year1_1 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.rec_year1_1 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.rec_year1_1 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.rec_year1_1 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.rec_year1_1 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.rec_year1_1 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.rec_year1_1 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.rec_year1_1 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.rec_year1_1 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.rec_year1_1 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.rec_year1_1 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.rec_year1_1 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.rec_year1_1 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.rec_year1_1 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.rec_year1_1 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.rec_year1_1 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.rec_year1_1 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.rec_year1_1 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.rec_year1_1 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.rec_year1_1 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.rec_year1_1 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.rec_year1_1 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.rec_year1_1 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.rec_year1_1 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.rec_year1_1 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.rec_year1_1 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.rec_year1_1 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.rec_year1_1 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.rec_year1_1 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.rec_year1_1 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.rec_year1_1 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.rec_year1_1 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.rec_year1_1 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.rec_year1_1 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.rec_year1_1 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.rec_year1_1 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.rec_year1_1 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.rec_year1_1 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.rec_year1_1 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.rec_year1_1 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.rec_year1_1 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.rec_year1_1 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.rec_year1_1 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.rec_year1_1 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.rec_year1_1 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.rec_year1_1 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.rec_year1_1 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.rec_year1_1 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.rec_year1_1 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.rec_year1_1 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.rec_year1_1 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.rec_year1_1 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.rec_year1_1 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.rec_year1_1 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.rec_year1_1 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.rec_year1_1 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.rec_year1_1 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.rec_year1_1 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.rec_year1_1 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.rec_year1_1 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.rec_year1_1 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.rec_year1_1 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.rec_year1_1 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.rec_year1_1 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.rec_year1_1 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.rec_year1_1 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.rec_year1_1 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.rec_year1_1 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.rec_year1_1 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.rec_year1_1 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.rec_year1_1 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.rec_year1_1 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.rec_year1_1 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.rec_year1_1 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.rec_year1_1 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.rec_year1_1 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.rec_year1_1 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.rec_year1_1 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.rec_year1_1 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.rec_year1_1 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.rec_year1_1 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.rec_year1_1 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.rec_year1_1 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.rec_year1_1 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.rec_year1_1 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.rec_year1_1 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.rec_year1_1 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.rec_year1_1 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.rec_year1_1 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.rec_year1_1 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.rec_year1_1 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.rec_year1_1 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.rec_year1_1 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.rec_year1_1 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.rec_year1_1 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.rec_year1_1 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.rec_year1_1 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.rec_year1_1 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.rec_year1_1 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.rec_year1_1 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.rec_year1_1 eq '1920'>selected</cfif>>1920</option>
		</select> </nobr>



		</td>
	</tr>
		<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			2nd Assignee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="ass1_2" value="#read_morts.ass1_2#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="doc_num1_2"  value="#read_morts.doc_num1_2#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="book1_2"  value="#read_morts.book1_2#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="page1_2"  value="#read_morts.page1_2#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mon1_2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.rec_mon1_2 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.rec_mon1_2 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.rec_mon1_2 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.rec_mon1_2 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.rec_mon1_2 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.rec_mon1_2 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.rec_mon1_2 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.rec_mon1_2 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.rec_mon1_2 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.rec_mon1_2 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.rec_mon1_2 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.rec_mon1_2 eq '12'>selected</cfif>>December</option>


</select>

<select name="rec_day1_2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.rec_day1_2 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.rec_day1_2 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.rec_day1_2 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.rec_day1_2 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.rec_day1_2 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.rec_day1_2 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.rec_day1_2 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.rec_day1_2 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.rec_day1_2 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.rec_day1_2 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.rec_day1_2 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.rec_day1_2 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.rec_day1_2 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.rec_day1_2 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.rec_day1_2 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.rec_day1_2 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.rec_day1_2 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.rec_day1_2 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.rec_day1_2 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.rec_day1_2 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.rec_day1_2 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.rec_day1_2 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.rec_day1_2 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.rec_day1_2 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.rec_day1_2 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.rec_day1_2 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.rec_day1_2 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.rec_day1_2 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.rec_day1_2 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.rec_day1_2 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.rec_day1_2 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="rec_year1_2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.rec_year1_2 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.rec_year1_2 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.rec_year1_2 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.rec_year1_2 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.rec_year1_2 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.rec_year1_2 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.rec_year1_2 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.rec_year1_2 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.rec_year1_2 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.rec_year1_2 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.rec_year1_2 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.rec_year1_2 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.rec_year1_2 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.rec_year1_2 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.rec_year1_2 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.rec_year1_2 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.rec_year1_2 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.rec_year1_2 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.rec_year1_2 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.rec_year1_2 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.rec_year1_2 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.rec_year1_2 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.rec_year1_2 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.rec_year1_2 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.rec_year1_2 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.rec_year1_2 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.rec_year1_2 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.rec_year1_2 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.rec_year1_2 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.rec_year1_2 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.rec_year1_2 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.rec_year1_2 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.rec_year1_2 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.rec_year1_2 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.rec_year1_2 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.rec_year1_2 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.rec_year1_2 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.rec_year1_2 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.rec_year1_2 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.rec_year1_2 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.rec_year1_2 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.rec_year1_2 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.rec_year1_2 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.rec_year1_2 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.rec_year1_2 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.rec_year1_2 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.rec_year1_2 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.rec_year1_2 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.rec_year1_2 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.rec_year1_2 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.rec_year1_2 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.rec_year1_2 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.rec_year1_2 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.rec_year1_2 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.rec_year1_2 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.rec_year1_2 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.rec_year1_2 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.rec_year1_2 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.rec_year1_2 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.rec_year1_2 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.rec_year1_2 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.rec_year1_2 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.rec_year1_2 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.rec_year1_2 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.rec_year1_2 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.rec_year1_2 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.rec_year1_2 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.rec_year1_2 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.rec_year1_2 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.rec_year1_2 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.rec_year1_2 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.rec_year1_2 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.rec_year1_2 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.rec_year1_2 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.rec_year1_2 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.rec_year1_2 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.rec_year1_2 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.rec_year1_2 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.rec_year1_2 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.rec_year1_2 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.rec_year1_2 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.rec_year1_2 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.rec_year1_2 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.rec_year1_2 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.rec_year1_2 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.rec_year1_2 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.rec_year1_2 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.rec_year1_2 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.rec_year1_2 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.rec_year1_2 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.rec_year1_2 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.rec_year1_2 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.rec_year1_2 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.rec_year1_2 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.rec_year1_2 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.rec_year1_2 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.rec_year1_2 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.rec_year1_2 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.rec_year1_2 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.rec_year1_2 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.rec_year1_2 eq '1920'>selected</cfif>>1920</option>
		</select> </nobr>



		</td>
	</tr>

		<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			3rd Assignee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="ass1_3" value="#read_morts.ass1_3#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="doc_num1_3" value="#read_morts.doc_num1_3#"  size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="book1_3" value="#read_morts.book1_3#"  size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="page1_3" value="#read_morts.page1_3#"  size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mon1_3"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.rec_mon1_3 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.rec_mon1_3 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.rec_mon1_3 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.rec_mon1_3 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.rec_mon1_3 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.rec_mon1_3 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.rec_mon1_3 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.rec_mon1_3 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.rec_mon1_3 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.rec_mon1_3 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.rec_mon1_3 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.rec_mon1_3 eq '12'>selected</cfif>>December</option>


</select>

<select name="rec_day1_3"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.rec_day1_3 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.rec_day1_3 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.rec_day1_3 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.rec_day1_3 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.rec_day1_3 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.rec_day1_3 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.rec_day1_3 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.rec_day1_3 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.rec_day1_3 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.rec_day1_3 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.rec_day1_3 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.rec_day1_3 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.rec_day1_3 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.rec_day1_3 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.rec_day1_3 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.rec_day1_3 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.rec_day1_3 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.rec_day1_3 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.rec_day1_3 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.rec_day1_3 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.rec_day1_3 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.rec_day1_3 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.rec_day1_3 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.rec_day1_3 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.rec_day1_3 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.rec_day1_3 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.rec_day1_3 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.rec_day1_3 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.rec_day1_3 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.rec_day1_3 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.rec_day1_3 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="rec_year1_3"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.rec_year1_3 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.rec_year1_3 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.rec_year1_3 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.rec_year1_3 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.rec_year1_3 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.rec_year1_3 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.rec_year1_3 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.rec_year1_3 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.rec_year1_3 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.rec_year1_3 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.rec_year1_3 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.rec_year1_3 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.rec_year1_3 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.rec_year1_3 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.rec_year1_3 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.rec_year1_3 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.rec_year1_3 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.rec_year1_3 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.rec_year1_3 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.rec_year1_3 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.rec_year1_3 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.rec_year1_3 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.rec_year1_3 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.rec_year1_3 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.rec_year1_3 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.rec_year1_3 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.rec_year1_3 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.rec_year1_3 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.rec_year1_3 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.rec_year1_3 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.rec_year1_3 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.rec_year1_3 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.rec_year1_3 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.rec_year1_3 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.rec_year1_3 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.rec_year1_3 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.rec_year1_3 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.rec_year1_3 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.rec_year1_3 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.rec_year1_3 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.rec_year1_3 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.rec_year1_3 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.rec_year1_3 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.rec_year1_3 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.rec_year1_3 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.rec_year1_3 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.rec_year1_3 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.rec_year1_3 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.rec_year1_3 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.rec_year1_3 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.rec_year1_3 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.rec_year1_3 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.rec_year1_3 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.rec_year1_3 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.rec_year1_3 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.rec_year1_3 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.rec_year1_3 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.rec_year1_3 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.rec_year1_3 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.rec_year1_3 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.rec_year1_3 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.rec_year1_3 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.rec_year1_3 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.rec_year1_3 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.rec_year1_3 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.rec_year1_3 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.rec_year1_3 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.rec_year1_3 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.rec_year1_3 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.rec_year1_3 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.rec_year1_3 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.rec_year1_3 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.rec_year1_3 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.rec_year1_3 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.rec_year1_3 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.rec_year1_3 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.rec_year1_3 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.rec_year1_3 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.rec_year1_3 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.rec_year1_3 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.rec_year1_3 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.rec_year1_3 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.rec_year1_3 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.rec_year1_3 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.rec_year1_3 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.rec_year1_3 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.rec_year1_3 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.rec_year1_3 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.rec_year1_3 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.rec_year1_3 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.rec_year1_3 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.rec_year1_3 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.rec_year1_3 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.rec_year1_3 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.rec_year1_3 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.rec_year1_3 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.rec_year1_3 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.rec_year1_3 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.rec_year1_3 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.rec_year1_3 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.rec_year1_3 eq '1920'>selected</cfif>>1920</option>
		</select></nobr>



		</td>
	</tr>

		<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			4th Assignee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="ass1_4"  value="#read_morts.ass1_4#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="doc_num1_4"  value="#read_morts.doc_num1_4#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="book1_4"  value="#read_morts.book1_4#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="page1_4"  value="#read_morts.page1_4#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mon1_4"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.rec_mon1_4 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.rec_mon1_4 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.rec_mon1_4 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.rec_mon1_4 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.rec_mon1_4 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.rec_mon1_4 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.rec_mon1_4 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.rec_mon1_4 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.rec_mon1_4 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.rec_mon1_4 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.rec_mon1_4 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.rec_mon1_4 eq '12'>selected</cfif>>December</option>


</select>

<select name="rec_day1_4"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.rec_day1_4 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.rec_day1_4 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.rec_day1_4 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.rec_day1_4 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.rec_day1_4 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.rec_day1_4 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.rec_day1_4 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.rec_day1_4 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.rec_day1_4 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.rec_day1_4 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.rec_day1_4 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.rec_day1_4 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.rec_day1_4 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.rec_day1_4 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.rec_day1_4 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.rec_day1_4 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.rec_day1_4 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.rec_day1_4 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.rec_day1_4 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.rec_day1_4 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.rec_day1_4 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.rec_day1_4 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.rec_day1_4 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.rec_day1_4 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.rec_day1_4 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.rec_day1_4 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.rec_day1_4 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.rec_day1_4 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.rec_day1_4 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.rec_day1_4 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.rec_day1_4 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="rec_year1_4"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.rec_year1_4 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.rec_year1_4 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.rec_year1_4 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.rec_year1_4 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.rec_year1_4 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.rec_year1_4 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.rec_year1_4 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.rec_year1_4 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.rec_year1_4 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.rec_year1_4 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.rec_year1_4 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.rec_year1_4 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.rec_year1_4 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.rec_year1_4 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.rec_year1_4 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.rec_year1_4 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.rec_year1_4 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.rec_year1_4 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.rec_year1_4 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.rec_year1_4 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.rec_year1_4 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.rec_year1_4 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.rec_year1_4 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.rec_year1_4 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.rec_year1_4 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.rec_year1_4 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.rec_year1_4 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.rec_year1_4 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.rec_year1_4 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.rec_year1_4 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.rec_year1_4 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.rec_year1_4 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.rec_year1_4 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.rec_year1_4 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.rec_year1_4 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.rec_year1_4 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.rec_year1_4 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.rec_year1_4 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.rec_year1_4 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.rec_year1_4 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.rec_year1_4 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.rec_year1_4 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.rec_year1_4 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.rec_year1_4 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.rec_year1_4 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.rec_year1_4 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.rec_year1_4 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.rec_year1_4 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.rec_year1_4 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.rec_year1_4 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.rec_year1_4 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.rec_year1_4 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.rec_year1_4 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.rec_year1_4 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.rec_year1_4 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.rec_year1_4 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.rec_year1_4 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.rec_year1_4 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.rec_year1_4 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.rec_year1_4 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.rec_year1_4 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.rec_year1_4 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.rec_year1_4 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.rec_year1_4 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.rec_year1_4 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.rec_year1_4 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.rec_year1_4 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.rec_year1_4 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.rec_year1_4 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.rec_year1_4 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.rec_year1_4 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.rec_year1_4 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.rec_year1_4 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.rec_year1_4 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.rec_year1_4 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.rec_year1_4 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.rec_year1_4 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.rec_year1_4 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.rec_year1_4 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.rec_year1_4 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.rec_year1_4 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.rec_year1_4 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.rec_year1_4 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.rec_year1_4 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.rec_year1_4 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.rec_year1_4 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.rec_year1_4 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.rec_year1_4 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.rec_year1_4 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.rec_year1_4 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.rec_year1_4 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.rec_year1_4 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.rec_year1_4 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.rec_year1_4 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.rec_year1_4 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.rec_year1_4 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.rec_year1_4 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.rec_year1_4 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.rec_year1_4 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.rec_year1_4 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.rec_year1_4 eq '1920'>selected</cfif>>1920</option>
		</select> </nobr>



		</td>
	</tr>

</table><br>
<br>





















<br>

<table border=0>
<!--- ===/ LOAN PROCESSOR INFO \=== --->

	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<nobr><B>Mortgage 2</B> Information : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="clear_mort_two_button" value="clear" onClick="clear_mort_two();"></nobr></td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgagee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="mort2_1"  value="#read_morts.mort2_1#" size=40 maxlength=100
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage Intro


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<select name="lienintro2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">


<option value="" <cfif read_morts.lienintro2 eq ''>selected</cfif>>Leave Blank</option>
<option value="Satisfaction and/or release of" <cfif read_morts.lienintro2 eq 'Satisfaction and/or release of'>selected</cfif>>Satisfaction and/or release of</option>
<option value="Borrowers affidavit that he is not the same person as mentioned in the" <cfif read_morts.lienintro2 eq 'Borrowers affidavit that he is not the same person as mentioned in the'>selected</cfif>>Borrowers affidavit that he is not the same person as mentioned in the</option>
<option value="Subject to the effects of the foreclosure of" <cfif read_morts.lienintro2 eq 'Subject to the effects of the foreclosure of'>selected</cfif>>Subject to the effects of the foreclosure of</option>
<option value="Subordination of mortgage" <cfif read_morts.lienintro2 eq 'Subordination of mortgage'>selected</cfif>>Subordination of mortgage</option>
</select>


		</td>
	</tr>
<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgagor 1


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="mort2_2"  value="#read_morts.mort2_2#" size=40 maxlength=100
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgagor 2


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="mort2_3"  value="#read_morts.mort2_3#" size=40 maxlength=100
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>


	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Amount


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="amt2" value="#read_morts.amt2#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="docnum2"  value="#read_morts.docnum2#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="book2"  value="#read_morts.book2#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="page2" value="#read_morts.page2#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Date of Mortgage


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="inst_mon2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.inst_mon2 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.inst_mon2 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.inst_mon2 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.inst_mon2 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.inst_mon2 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.inst_mon2 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.inst_mon2 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.inst_mon2 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.inst_mon2 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.inst_mon2 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.inst_mon2 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.inst_mon2 eq '12'>selected</cfif>>December</option>


</select>

<select name="inst_day2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.inst_day2 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.inst_day2 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.inst_day2 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.inst_day2 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.inst_day2 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.inst_day2 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.inst_day2 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.inst_day2 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.inst_day2 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.inst_day2 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.inst_day2 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.inst_day2 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.inst_day2 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.inst_day2 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.inst_day2 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.inst_day2 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.inst_day2 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.inst_day2 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.inst_day2 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.inst_day2 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.inst_day2 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.inst_day2 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.inst_day2 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.inst_day2 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.inst_day2 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.inst_day2 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.inst_day2 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.inst_day2 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.inst_day2 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.inst_day2 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.inst_day2 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="inst_year2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.inst_year2 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.inst_year2 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.inst_year2 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.inst_year2 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.inst_year2 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.inst_year2 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.inst_year2 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.inst_year2 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.inst_year2 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.inst_year2 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.inst_year2 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.inst_year2 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.inst_year2 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.inst_year2 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.inst_year2 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.inst_year2 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.inst_year2 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.inst_year2 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.inst_year2 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.inst_year2 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.inst_year2 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.inst_year2 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.inst_year2 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.inst_year2 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.inst_year2 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.inst_year2 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.inst_year2 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.inst_year2 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.inst_year2 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.inst_year2 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.inst_year2 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.inst_year2 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.inst_year2 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.inst_year2 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.inst_year2 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.inst_year2 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.inst_year2 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.inst_year2 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.inst_year2 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.inst_year2 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.inst_year2 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.inst_year2 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.inst_year2 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.inst_year2 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.inst_year2 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.inst_year2 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.inst_year2 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.inst_year2 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.inst_year2 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.inst_year2 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.inst_year2 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.inst_year2 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.inst_year2 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.inst_year2 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.inst_year2 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.inst_year2 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.inst_year2 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.inst_year2 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.inst_year2 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.inst_year2 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.inst_year2 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.inst_year2 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.inst_year2 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.inst_year2 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.inst_year2 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.inst_year2 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.inst_year2 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.inst_year2 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.inst_year2 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.inst_year2 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.inst_year2 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.inst_year2 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.inst_year2 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.inst_year2 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.inst_year2 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.inst_year2 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.inst_year2 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.inst_year2 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.inst_year2 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.inst_year2 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.inst_year2 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.inst_year2 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.inst_year2 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.inst_year2 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.inst_year2 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.inst_year2 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.inst_year2 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.inst_year2 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.inst_year2 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.inst_year2 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.inst_year2 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.inst_year2 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.inst_year2 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.inst_year2 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.inst_year2 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.inst_year2 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.inst_year2 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.inst_year2 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.inst_year2 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.inst_year2 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.inst_year2 eq '1920'>selected</cfif>>1920</option>
		</select> </nobr>



		</td>
	</tr>
		<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mon2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.rec_mon2 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.rec_mon2 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.rec_mon2 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.rec_mon2 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.rec_mon2 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.rec_mon2 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.rec_mon2 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.rec_mon2 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.rec_mon2 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.rec_mon2 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.rec_mon2 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.rec_mon2 eq '12'>selected</cfif>>December</option>


</select>

<select name="rec_day2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.rec_day2 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.rec_day2 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.rec_day2 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.rec_day2 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.rec_day2 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.rec_day2 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.rec_day2 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.rec_day2 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.rec_day2 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.rec_day2 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.rec_day2 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.rec_day2 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.rec_day2 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.rec_day2 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.rec_day2 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.rec_day2 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.rec_day2 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.rec_day2 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.rec_day2 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.rec_day2 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.rec_day2 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.rec_day2 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.rec_day2 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.rec_day2 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.rec_day2 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.rec_day2 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.rec_day2 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.rec_day2 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.rec_day2 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.rec_day2 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.rec_day2 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="rec_year2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.rec_year2 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.rec_year2 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.rec_year2 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.rec_year2 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.rec_year2 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.rec_year2 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.rec_year2 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.rec_year2 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.rec_year2 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.rec_year2 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.rec_year2 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.rec_year2 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.rec_year2 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.rec_year2 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.rec_year2 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.rec_year2 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.rec_year2 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.rec_year2 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.rec_year2 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.rec_year2 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.rec_year2 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.rec_year2 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.rec_year2 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.rec_year2 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.rec_year2 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.rec_year2 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.rec_year2 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.rec_year2 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.rec_year2 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.rec_year2 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.rec_year2 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.rec_year2 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.rec_year2 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.rec_year2 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.rec_year2 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.rec_year2 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.rec_year2 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.rec_year2 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.rec_year2 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.rec_year2 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.rec_year2 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.rec_year2 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.rec_year2 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.rec_year2 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.rec_year2 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.rec_year2 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.rec_year2 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.rec_year2 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.rec_year2 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.rec_year2 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.rec_year2 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.rec_year2 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.rec_year2 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.rec_year2 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.rec_year2 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.rec_year2 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.rec_year2 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.rec_year2 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.rec_year2 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.rec_year2 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.rec_year2 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.rec_year2 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.rec_year2 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.rec_year2 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.rec_year2 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.rec_year2 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.rec_year2 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.rec_year2 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.rec_year2 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.rec_year2 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.rec_year2 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.rec_year2 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.rec_year2 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.rec_year2 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.rec_year2 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.rec_year2 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.rec_year2 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.rec_year2 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.rec_year2 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.rec_year2 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.rec_year2 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.rec_year2 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.rec_year2 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.rec_year2 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.rec_year2 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.rec_year2 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.rec_year2 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.rec_year2 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.rec_year2 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.rec_year2 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.rec_year2 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.rec_year2 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.rec_year2 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.rec_year2 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.rec_year2 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.rec_year2 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.rec_year2 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.rec_year2 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.rec_year2 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.rec_year2 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.rec_year2 eq '1920'>selected</cfif>>1920</option>
		</select> </nobr>



		</td>
	</tr>



	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Open End


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="openend2"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none;"
			rows="5"
			cols="45"
			>
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Yes" <cfif read_morts.openend2 eq 'Yes'>selected</cfif>>Yes</OPTION>
			<OPTION VALUE="No" <cfif read_morts.openend2 eq 'No'>selected</cfif>>No</OPTION>


			</SELECT>
</td>
	</tr>


	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Trustee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="trustee2"  value="#read_morts.trustee2#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Information


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="info2_1" value="#read_morts.info2_1#"  size=40 maxlength=150
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >

		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>



		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="info2_2" value="#read_morts.info2_2#"  size=40 maxlength=150
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >

		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1st Assignee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="ass2_1" value="#read_morts.ass2_1#"  size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="doc_num2_1" value="#read_morts.doc_num2_1#"  size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="book2_1" value="#read_morts.book2_1#"  size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="page2_1" value="#read_morts.page2_1#"  size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mon2_1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.rec_mon2_1 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.rec_mon2_1 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.rec_mon2_1 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.rec_mon2_1 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.rec_mon2_1 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.rec_mon2_1 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.rec_mon2_1 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.rec_mon2_1 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.rec_mon2_1 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.rec_mon2_1 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.rec_mon2_1 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.rec_mon2_1 eq '12'>selected</cfif>>December</option>


</select>

<select name="rec_day2_1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.rec_day2_1 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.rec_day2_1 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.rec_day2_1 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.rec_day2_1 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.rec_day2_1 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.rec_day2_1 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.rec_day2_1 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.rec_day2_1 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.rec_day2_1 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.rec_day2_1 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.rec_day2_1 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.rec_day2_1 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.rec_day2_1 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.rec_day2_1 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.rec_day2_1 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.rec_day2_1 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.rec_day2_1 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.rec_day2_1 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.rec_day2_1 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.rec_day2_1 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.rec_day2_1 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.rec_day2_1 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.rec_day2_1 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.rec_day2_1 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.rec_day2_1 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.rec_day2_1 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.rec_day2_1 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.rec_day2_1 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.rec_day2_1 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.rec_day2_1 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.rec_day2_1 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="rec_year2_1"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.rec_year2_1 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.rec_year2_1 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.rec_year2_1 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.rec_year2_1 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.rec_year2_1 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.rec_year2_1 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.rec_year2_1 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.rec_year2_1 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.rec_year2_1 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.rec_year2_1 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.rec_year2_1 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.rec_year2_1 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.rec_year2_1 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.rec_year2_1 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.rec_year2_1 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.rec_year2_1 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.rec_year2_1 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.rec_year2_1 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.rec_year2_1 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.rec_year2_1 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.rec_year2_1 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.rec_year2_1 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.rec_year2_1 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.rec_year2_1 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.rec_year2_1 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.rec_year2_1 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.rec_year2_1 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.rec_year2_1 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.rec_year2_1 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.rec_year2_1 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.rec_year2_1 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.rec_year2_1 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.rec_year2_1 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.rec_year2_1 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.rec_year2_1 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.rec_year2_1 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.rec_year2_1 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.rec_year2_1 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.rec_year2_1 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.rec_year2_1 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.rec_year2_1 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.rec_year2_1 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.rec_year2_1 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.rec_year2_1 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.rec_year2_1 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.rec_year2_1 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.rec_year2_1 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.rec_year2_1 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.rec_year2_1 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.rec_year2_1 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.rec_year2_1 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.rec_year2_1 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.rec_year2_1 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.rec_year2_1 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.rec_year2_1 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.rec_year2_1 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.rec_year2_1 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.rec_year2_1 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.rec_year2_1 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.rec_year2_1 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.rec_year2_1 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.rec_year2_1 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.rec_year2_1 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.rec_year2_1 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.rec_year2_1 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.rec_year2_1 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.rec_year2_1 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.rec_year2_1 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.rec_year2_1 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.rec_year2_1 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.rec_year2_1 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.rec_year2_1 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.rec_year2_1 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.rec_year2_1 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.rec_year2_1 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.rec_year2_1 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.rec_year2_1 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.rec_year2_1 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.rec_year2_1 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.rec_year2_1 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.rec_year2_1 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.rec_year2_1 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.rec_year2_1 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.rec_year2_1 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.rec_year2_1 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.rec_year2_1 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.rec_year2_1 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.rec_year2_1 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.rec_year2_1 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.rec_year2_1 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.rec_year2_1 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.rec_year2_1 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.rec_year2_1 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.rec_year2_1 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.rec_year2_1 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.rec_year2_1 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.rec_year2_1 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.rec_year2_1 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.rec_year2_1 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.rec_year2_1 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.rec_year2_1 eq '1920'>selected</cfif>>1920</option>
		</select> </nobr>



		</td>
	</tr>
		<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			2nd Assignee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="ass2_2" value="#read_morts.ass2_2#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="doc_num2_2"  value="#read_morts.doc_num2_2#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="book2_2"  value="#read_morts.book2_2#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="page2_2"  value="#read_morts.page2_2#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mon2_2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.rec_mon2_2 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.rec_mon2_2 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.rec_mon2_2 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.rec_mon2_2 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.rec_mon2_2 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.rec_mon2_2 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.rec_mon2_2 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.rec_mon2_2 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.rec_mon2_2 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.rec_mon2_2 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.rec_mon2_2 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.rec_mon2_2 eq '12'>selected</cfif>>December</option>


</select>

<select name="rec_day2_2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.rec_day2_2 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.rec_day2_2 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.rec_day2_2 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.rec_day2_2 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.rec_day2_2 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.rec_day2_2 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.rec_day2_2 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.rec_day2_2 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.rec_day2_2 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.rec_day2_2 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.rec_day2_2 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.rec_day2_2 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.rec_day2_2 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.rec_day2_2 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.rec_day2_2 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.rec_day2_2 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.rec_day2_2 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.rec_day2_2 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.rec_day2_2 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.rec_day2_2 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.rec_day2_2 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.rec_day2_2 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.rec_day2_2 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.rec_day2_2 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.rec_day2_2 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.rec_day2_2 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.rec_day2_2 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.rec_day2_2 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.rec_day2_2 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.rec_day2_2 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.rec_day2_2 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="rec_year2_2"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.rec_year2_2 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.rec_year2_2 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.rec_year2_2 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.rec_year2_2 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.rec_year2_2 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.rec_year2_2 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.rec_year2_2 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.rec_year2_2 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.rec_year2_2 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.rec_year2_2 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.rec_year2_2 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.rec_year2_2 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.rec_year2_2 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.rec_year2_2 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.rec_year2_2 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.rec_year2_2 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.rec_year2_2 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.rec_year2_2 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.rec_year2_2 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.rec_year2_2 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.rec_year2_2 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.rec_year2_2 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.rec_year2_2 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.rec_year2_2 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.rec_year2_2 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.rec_year2_2 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.rec_year2_2 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.rec_year2_2 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.rec_year2_2 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.rec_year2_2 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.rec_year2_2 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.rec_year2_2 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.rec_year2_2 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.rec_year2_2 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.rec_year2_2 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.rec_year2_2 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.rec_year2_2 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.rec_year2_2 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.rec_year2_2 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.rec_year2_2 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.rec_year2_2 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.rec_year2_2 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.rec_year2_2 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.rec_year2_2 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.rec_year2_2 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.rec_year2_2 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.rec_year2_2 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.rec_year2_2 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.rec_year2_2 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.rec_year2_2 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.rec_year2_2 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.rec_year2_2 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.rec_year2_2 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.rec_year2_2 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.rec_year2_2 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.rec_year2_2 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.rec_year2_2 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.rec_year2_2 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.rec_year2_2 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.rec_year2_2 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.rec_year2_2 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.rec_year2_2 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.rec_year2_2 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.rec_year2_2 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.rec_year2_2 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.rec_year2_2 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.rec_year2_2 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.rec_year2_2 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.rec_year2_2 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.rec_year2_2 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.rec_year2_2 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.rec_year2_2 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.rec_year2_2 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.rec_year2_2 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.rec_year2_2 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.rec_year2_2 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.rec_year2_2 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.rec_year2_2 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.rec_year2_2 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.rec_year2_2 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.rec_year2_2 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.rec_year2_2 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.rec_year2_2 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.rec_year2_2 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.rec_year2_2 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.rec_year2_2 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.rec_year2_2 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.rec_year2_2 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.rec_year2_2 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.rec_year2_2 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.rec_year2_2 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.rec_year2_2 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.rec_year2_2 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.rec_year2_2 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.rec_year2_2 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.rec_year2_2 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.rec_year2_2 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.rec_year2_2 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.rec_year2_2 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.rec_year2_2 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.rec_year2_2 eq '1920'>selected</cfif>>1920</option>
		</select> </nobr>



		</td>
	</tr>

		<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			3rd Assignee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="ass2_3" value="#read_morts.ass2_3#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="doc_num2_3" value="#read_morts.doc_num2_3#"  size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="book2_3" value="#read_morts.book2_3#"  size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="page2_3" value="#read_morts.page2_3#"  size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mon2_3"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.rec_mon2_3 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.rec_mon2_3 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.rec_mon2_3 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.rec_mon2_3 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.rec_mon2_3 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.rec_mon2_3 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.rec_mon2_3 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.rec_mon2_3 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.rec_mon2_3 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.rec_mon2_3 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.rec_mon2_3 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.rec_mon2_3 eq '12'>selected</cfif>>December</option>


</select>

<select name="rec_day2_3"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.rec_day2_3 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.rec_day2_3 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.rec_day2_3 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.rec_day2_3 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.rec_day2_3 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.rec_day2_3 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.rec_day2_3 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.rec_day2_3 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.rec_day2_3 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.rec_day2_3 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.rec_day2_3 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.rec_day2_3 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.rec_day2_3 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.rec_day2_3 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.rec_day2_3 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.rec_day2_3 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.rec_day2_3 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.rec_day2_3 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.rec_day2_3 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.rec_day2_3 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.rec_day2_3 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.rec_day2_3 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.rec_day2_3 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.rec_day2_3 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.rec_day2_3 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.rec_day2_3 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.rec_day2_3 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.rec_day2_3 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.rec_day2_3 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.rec_day2_3 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.rec_day2_3 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="rec_year2_3"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.rec_year2_3 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.rec_year2_3 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.rec_year2_3 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.rec_year2_3 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.rec_year2_3 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.rec_year2_3 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.rec_year2_3 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.rec_year2_3 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.rec_year2_3 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.rec_year2_3 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.rec_year2_3 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.rec_year2_3 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.rec_year2_3 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.rec_year2_3 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.rec_year2_3 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.rec_year2_3 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.rec_year2_3 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.rec_year2_3 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.rec_year2_3 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.rec_year2_3 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.rec_year2_3 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.rec_year2_3 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.rec_year2_3 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.rec_year2_3 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.rec_year2_3 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.rec_year2_3 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.rec_year2_3 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.rec_year2_3 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.rec_year2_3 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.rec_year2_3 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.rec_year2_3 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.rec_year2_3 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.rec_year2_3 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.rec_year2_3 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.rec_year2_3 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.rec_year2_3 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.rec_year2_3 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.rec_year2_3 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.rec_year2_3 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.rec_year2_3 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.rec_year2_3 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.rec_year2_3 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.rec_year2_3 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.rec_year2_3 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.rec_year2_3 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.rec_year2_3 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.rec_year2_3 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.rec_year2_3 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.rec_year2_3 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.rec_year2_3 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.rec_year2_3 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.rec_year2_3 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.rec_year2_3 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.rec_year2_3 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.rec_year2_3 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.rec_year2_3 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.rec_year2_3 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.rec_year2_3 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.rec_year2_3 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.rec_year2_3 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.rec_year2_3 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.rec_year2_3 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.rec_year2_3 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.rec_year2_3 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.rec_year2_3 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.rec_year2_3 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.rec_year2_3 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.rec_year2_3 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.rec_year2_3 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.rec_year2_3 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.rec_year2_3 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.rec_year2_3 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.rec_year2_3 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.rec_year2_3 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.rec_year2_3 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.rec_year2_3 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.rec_year2_3 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.rec_year2_3 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.rec_year2_3 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.rec_year2_3 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.rec_year2_3 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.rec_year2_3 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.rec_year2_3 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.rec_year2_3 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.rec_year2_3 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.rec_year2_3 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.rec_year2_3 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.rec_year2_3 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.rec_year2_3 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.rec_year2_3 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.rec_year2_3 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.rec_year2_3 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.rec_year2_3 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.rec_year2_3 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.rec_year2_3 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.rec_year2_3 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.rec_year2_3 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.rec_year2_3 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.rec_year2_3 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.rec_year2_3 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.rec_year2_3 eq '1920'>selected</cfif>>1920</option>
		</select></nobr>



		</td>
	</tr>

		<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			4th Assignee


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="ass2_4"  value="#read_morts.ass2_4#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="doc_num2_4"  value="#read_morts.doc_num2_4#" size=40 maxlength=50
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="book2_4"  value="#read_morts.book2_4#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="page2_4"  value="#read_morts.page2_4#" size=25 maxlength=30
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			<nobr><select name="rec_mon2_4"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Month</option>


	   	<option value="01" <cfif read_morts.rec_mon2_4 eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_morts.rec_mon2_4 eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_morts.rec_mon2_4 eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_morts.rec_mon2_4 eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_morts.rec_mon2_4 eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_morts.rec_mon2_4 eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_morts.rec_mon2_4 eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_morts.rec_mon2_4 eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_morts.rec_mon2_4 eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_morts.rec_mon2_4 eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_morts.rec_mon2_4 eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_morts.rec_mon2_4 eq '12'>selected</cfif>>December</option>


</select>

<select name="rec_day2_4"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<OPTION VALUE="">Day</OPTION>


		<OPTION VALUE="01" <cfif read_morts.rec_day2_4 eq '01'>selected</cfif>>01</OPTION>
		<OPTION VALUE="02" <cfif read_morts.rec_day2_4 eq '02'>selected</cfif>>02</OPTION>
		<OPTION VALUE="03" <cfif read_morts.rec_day2_4 eq '03'>selected</cfif>>03</OPTION>
		<OPTION VALUE="04" <cfif read_morts.rec_day2_4 eq '04'>selected</cfif>>04</OPTION>
		<OPTION VALUE="05" <cfif read_morts.rec_day2_4 eq '05'>selected</cfif>>05</OPTION>
		<OPTION VALUE="06" <cfif read_morts.rec_day2_4 eq '06'>selected</cfif>>06</OPTION>
		<OPTION VALUE="07" <cfif read_morts.rec_day2_4 eq '07'>selected</cfif>>07</OPTION>
		<OPTION VALUE="08" <cfif read_morts.rec_day2_4 eq '08'>selected</cfif>>08</OPTION>
		<OPTION VALUE="09" <cfif read_morts.rec_day2_4 eq '09'>selected</cfif>>09</OPTION>
		<OPTION VALUE="10" <cfif read_morts.rec_day2_4 eq '10'>selected</cfif>>10</OPTION>
		<OPTION VALUE="11" <cfif read_morts.rec_day2_4 eq '11'>selected</cfif>>11</OPTION>
		<OPTION VALUE="12" <cfif read_morts.rec_day2_4 eq '12'>selected</cfif>>12</OPTION>
		<OPTION VALUE="13" <cfif read_morts.rec_day2_4 eq '13'>selected</cfif>>13</OPTION>
		<OPTION VALUE="14" <cfif read_morts.rec_day2_4 eq '14'>selected</cfif>>14</OPTION>
		<OPTION VALUE="15" <cfif read_morts.rec_day2_4 eq '15'>selected</cfif>>15</OPTION>
		<OPTION VALUE="16" <cfif read_morts.rec_day2_4 eq '16'>selected</cfif>>16</OPTION>
		<OPTION VALUE="17" <cfif read_morts.rec_day2_4 eq '17'>selected</cfif>>17</OPTION>
		<OPTION VALUE="18" <cfif read_morts.rec_day2_4 eq '18'>selected</cfif>>18</OPTION>
		<OPTION VALUE="19" <cfif read_morts.rec_day2_4 eq '19'>selected</cfif>>19</OPTION>
		<OPTION VALUE="20" <cfif read_morts.rec_day2_4 eq '20'>selected</cfif>>20</OPTION>
		<OPTION VALUE="21" <cfif read_morts.rec_day2_4 eq '21'>selected</cfif>>21</OPTION>
		<OPTION VALUE="22" <cfif read_morts.rec_day2_4 eq '22'>selected</cfif>>22</OPTION>
		<OPTION VALUE="23" <cfif read_morts.rec_day2_4 eq '23'>selected</cfif>>23</OPTION>
		<OPTION VALUE="24" <cfif read_morts.rec_day2_4 eq '24'>selected</cfif>>24</OPTION>
		<OPTION VALUE="25" <cfif read_morts.rec_day2_4 eq '25'>selected</cfif>>25</OPTION>
		<OPTION VALUE="26" <cfif read_morts.rec_day2_4 eq '26'>selected</cfif>>26</OPTION>
		<OPTION VALUE="27" <cfif read_morts.rec_day2_4 eq '27'>selected</cfif>>27</OPTION>
		<OPTION VALUE="28" <cfif read_morts.rec_day2_4 eq '28'>selected</cfif>>28</OPTION>
		<OPTION VALUE="29" <cfif read_morts.rec_day2_4 eq '29'>selected</cfif>>29</OPTION>
		<OPTION VALUE="30" <cfif read_morts.rec_day2_4 eq '30'>selected</cfif>>30</OPTION>
		<OPTION VALUE="31" <cfif read_morts.rec_day2_4 eq '31'>selected</cfif>>31</OPTION>
</select>
<select name="rec_year2_4"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value="">Year</option>
<option value="2020" <cfif read_morts.rec_year2_4 eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_morts.rec_year2_4 eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_morts.rec_year2_4 eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_morts.rec_year2_4 eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_morts.rec_year2_4 eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_morts.rec_year2_4 eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_morts.rec_year2_4 eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_morts.rec_year2_4 eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_morts.rec_year2_4 eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_morts.rec_year2_4 eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_morts.rec_year2_4 eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_morts.rec_year2_4 eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_morts.rec_year2_4 eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_morts.rec_year2_4 eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_morts.rec_year2_4 eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_morts.rec_year2_4 eq '2005'>selected</cfif>>2005</option>
			<option value="2004" <cfif read_morts.rec_year2_4 eq '2004'>selected</cfif>>2004</option>
	   	   	<option value="2003" <cfif read_morts.rec_year2_4 eq '2003'>selected</cfif>>2003</option>
		<option value="2002" <cfif read_morts.rec_year2_4 eq '2002'>selected</cfif>>2002</option>
		<option value="2001" <cfif read_morts.rec_year2_4 eq '2001'>selected</cfif>>2001</option>
		<option value="2000" <cfif read_morts.rec_year2_4 eq '2000'>selected</cfif>>2000</option>
		<option value="1999" <cfif read_morts.rec_year2_4 eq '1999'>selected</cfif>>1999</option>
		<option value="1998" <cfif read_morts.rec_year2_4 eq '1998'>selected</cfif>>1998</option>
		<option value="1997" <cfif read_morts.rec_year2_4 eq '1997'>selected</cfif>>1997</option>
		<option value="1996" <cfif read_morts.rec_year2_4 eq '1996'>selected</cfif>>1996</option>
		<option value="1995" <cfif read_morts.rec_year2_4 eq '1995'>selected</cfif>>1995</option>
		<option value="1994" <cfif read_morts.rec_year2_4 eq '1994'>selected</cfif>>1994</option>
		<option value="1993" <cfif read_morts.rec_year2_4 eq '1993'>selected</cfif>>1993</option>
		<option value="1992" <cfif read_morts.rec_year2_4 eq '1992'>selected</cfif>>1992</option>
		<option value="1991" <cfif read_morts.rec_year2_4 eq '1991'>selected</cfif>>1991</option>
		<option value="1990" <cfif read_morts.rec_year2_4 eq '1990'>selected</cfif>>1990</option>
		<option value="1989" <cfif read_morts.rec_year2_4 eq '1989'>selected</cfif>>1989</option>
		<option value="1988" <cfif read_morts.rec_year2_4 eq '1988'>selected</cfif>>1988</option>
		<option value="1987" <cfif read_morts.rec_year2_4 eq '1987'>selected</cfif>>1987</option>
		<option value="1986" <cfif read_morts.rec_year2_4 eq '1986'>selected</cfif>>1986</option>
		<option value="1985" <cfif read_morts.rec_year2_4 eq '1985'>selected</cfif>>1985</option>
		<option value="1984" <cfif read_morts.rec_year2_4 eq '1984'>selected</cfif>>1984</option>
		<option value="1983" <cfif read_morts.rec_year2_4 eq '1983'>selected</cfif>>1983</option>
		<option value="1982" <cfif read_morts.rec_year2_4 eq '1982'>selected</cfif>>1982</option>
		<option value="1981" <cfif read_morts.rec_year2_4 eq '1981'>selected</cfif>>1981</option>
		<option value="1980" <cfif read_morts.rec_year2_4 eq '1980'>selected</cfif>>1980</option>
		<option value="1979" <cfif read_morts.rec_year2_4 eq '1979'>selected</cfif>>1979</option>
		<option value="1978" <cfif read_morts.rec_year2_4 eq '1978'>selected</cfif>>1978</option>
		<option value="1977" <cfif read_morts.rec_year2_4 eq '1977'>selected</cfif>>1977</option>
		<option value="1976" <cfif read_morts.rec_year2_4 eq '1976'>selected</cfif>>1976</option>
		<option value="1975" <cfif read_morts.rec_year2_4 eq '1975'>selected</cfif>>1975</option>
		<option value="1974" <cfif read_morts.rec_year2_4 eq '1974'>selected</cfif>>1974</option>
		<option value="1973" <cfif read_morts.rec_year2_4 eq '1973'>selected</cfif>>1973</option>
		<option value="1972" <cfif read_morts.rec_year2_4 eq '1972'>selected</cfif>>1972</option>
		<option value="1971" <cfif read_morts.rec_year2_4 eq '1971'>selected</cfif>>1971</option>
		<option value="1970" <cfif read_morts.rec_year2_4 eq '1970'>selected</cfif>>1970</option>
		<option value="1969" <cfif read_morts.rec_year2_4 eq '1969'>selected</cfif>>1969</option>
		<option value="1968" <cfif read_morts.rec_year2_4 eq '1968'>selected</cfif>>1968</option>
		<option value="1967" <cfif read_morts.rec_year2_4 eq '1967'>selected</cfif>>1967</option>
		<option value="1966" <cfif read_morts.rec_year2_4 eq '1966'>selected</cfif>>1966</option>
		<option value="1965" <cfif read_morts.rec_year2_4 eq '1965'>selected</cfif>>1965</option>
		<option value="1964" <cfif read_morts.rec_year2_4 eq '1964'>selected</cfif>>1964</option>
		<option value="1963" <cfif read_morts.rec_year2_4 eq '1963'>selected</cfif>>1963</option>
		<option value="1962" <cfif read_morts.rec_year2_4 eq '1962'>selected</cfif>>1962</option>
		<option value="1961" <cfif read_morts.rec_year2_4 eq '1961'>selected</cfif>>1961</option>
		<option value="1960" <cfif read_morts.rec_year2_4 eq '1960'>selected</cfif>>1960</option>
		<option value="1959" <cfif read_morts.rec_year2_4 eq '1959'>selected</cfif>>1959</option>
		<option value="1958" <cfif read_morts.rec_year2_4 eq '1958'>selected</cfif>>1958</option>
		<option value="1957" <cfif read_morts.rec_year2_4 eq '1957'>selected</cfif>>1957</option>
		<option value="1956" <cfif read_morts.rec_year2_4 eq '1956'>selected</cfif>>1956</option>
		<option value="1955" <cfif read_morts.rec_year2_4 eq '1955'>selected</cfif>>1955</option>
		<option value="1954" <cfif read_morts.rec_year2_4 eq '1954'>selected</cfif>>1954</option>
		<option value="1953" <cfif read_morts.rec_year2_4 eq '1953'>selected</cfif>>1953</option>
		<option value="1952" <cfif read_morts.rec_year2_4 eq '1952'>selected</cfif>>1952</option>
		<option value="1951" <cfif read_morts.rec_year2_4 eq '1951'>selected</cfif>>1951</option>
		<option value="1950" <cfif read_morts.rec_year2_4 eq '1950'>selected</cfif>>1950</option>
		<option value="1949" <cfif read_morts.rec_year2_4 eq '1949'>selected</cfif>>1949</option>
		<option value="1948" <cfif read_morts.rec_year2_4 eq '1948'>selected</cfif>>1948</option>
		<option value="1947" <cfif read_morts.rec_year2_4 eq '1947'>selected</cfif>>1947</option>
		<option value="1946" <cfif read_morts.rec_year2_4 eq '1946'>selected</cfif>>1946</option>
		<option value="1945" <cfif read_morts.rec_year2_4 eq '1945'>selected</cfif>>1945</option>
		<option value="1944" <cfif read_morts.rec_year2_4 eq '1944'>selected</cfif>>1944</option>
		<option value="1943" <cfif read_morts.rec_year2_4 eq '1943'>selected</cfif>>1943</option>
		<option value="1942" <cfif read_morts.rec_year2_4 eq '1942'>selected</cfif>>1942</option>
		<option value="1941" <cfif read_morts.rec_year2_4 eq '1941'>selected</cfif>>1941</option>
		<option value="1940" <cfif read_morts.rec_year2_4 eq '1940'>selected</cfif>>1940</option>
		<option value="1939" <cfif read_morts.rec_year2_4 eq '1939'>selected</cfif>>1939</option>
		<option value="1938" <cfif read_morts.rec_year2_4 eq '1938'>selected</cfif>>1938</option>
		<option value="1937" <cfif read_morts.rec_year2_4 eq '1937'>selected</cfif>>1937</option>
		<option value="1936" <cfif read_morts.rec_year2_4 eq '1936'>selected</cfif>>1936</option>
		<option value="1935" <cfif read_morts.rec_year2_4 eq '1935'>selected</cfif>>1935</option>
		<option value="1934" <cfif read_morts.rec_year2_4 eq '1934'>selected</cfif>>1934</option>
		<option value="1933" <cfif read_morts.rec_year2_4 eq '1933'>selected</cfif>>1933</option>
		<option value="1932" <cfif read_morts.rec_year2_4 eq '1932'>selected</cfif>>1932</option>
		<option value="1931" <cfif read_morts.rec_year2_4 eq '1931'>selected</cfif>>1931</option>
		<option value="1930" <cfif read_morts.rec_year2_4 eq '1930'>selected</cfif>>1930</option>
		<option value="1929" <cfif read_morts.rec_year2_4 eq '1929'>selected</cfif>>1929</option>
		<option value="1928" <cfif read_morts.rec_year2_4 eq '1928'>selected</cfif>>1928</option>
		<option value="1927" <cfif read_morts.rec_year2_4 eq '1927'>selected</cfif>>1927</option>
		<option value="1926" <cfif read_morts.rec_year2_4 eq '1926'>selected</cfif>>1926</option>
		<option value="1925" <cfif read_morts.rec_year2_4 eq '1925'>selected</cfif>>1925</option>
		<option value="1924" <cfif read_morts.rec_year2_4 eq '1924'>selected</cfif>>1924</option>
		<option value="1923" <cfif read_morts.rec_year2_4 eq '1923'>selected</cfif>>1923</option>
		<option value="1922" <cfif read_morts.rec_year2_4 eq '1922'>selected</cfif>>1922</option>
		<option value="1921" <cfif read_morts.rec_year2_4 eq '1921'>selected</cfif>>1921</option>
		<option value="1920" <cfif read_morts.rec_year2_4 eq '1920'>selected</cfif>>1920</option>
		</select> </nobr>



		</td>
	</tr>

</table><br>
<br>

Property Taxes, subsequent to <select name="prop_tax_month"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value=""></option>
<option value="" selected >Month</option>


	   	<option value="01" <cfif read_title.prop_tax_month eq '01'>selected</cfif>>January</option>
		<option value="02" <cfif read_title.prop_tax_month eq '02'>selected</cfif>>February</option>
		<option value="03" <cfif read_title.prop_tax_month eq '03'>selected</cfif>>March</option>
		<option value="04" <cfif read_title.prop_tax_month eq '04'>selected</cfif>>April</option>
		<option value="05" <cfif read_title.prop_tax_month eq '05'>selected</cfif>>May</option>
		<option value="06" <cfif read_title.prop_tax_month eq '06'>selected</cfif>>June</option>
		<option value="07" <cfif read_title.prop_tax_month eq '07'>selected</cfif>>July</option>
		<option value="08" <cfif read_title.prop_tax_month eq '08'>selected</cfif>>August</option>
		<option value="09" <cfif read_title.prop_tax_month eq '09'>selected</cfif>>September</option>
		<option value="10" <cfif read_title.prop_tax_month eq '10'>selected</cfif>>October</option>
		<option value="11" <cfif read_title.prop_tax_month eq '11'>selected</cfif>>November</option>
		<option value="12" <cfif read_title..prop_tax_month eq '12'>selected</cfif>>December</option>


</select>&nbsp;&nbsp;<select name="prop_tax_day"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value=""></option>
<option value="" selected >Day</option>
<option value="1" <cfif read_title.prop_tax_day eq '1'>selected</cfif>>1</option>
<option value="2" <cfif read_title.prop_tax_day eq '2'>selected</cfif>>2</option>
<option value="3" <cfif read_title.prop_tax_day eq '3'>selected</cfif>>3</option>
<option value="4" <cfif read_title.prop_tax_day eq '4'>selected</cfif>>4</option>
<option value="5" <cfif read_title.prop_tax_day eq '5'>selected</cfif>>5</option>
<option value="6" <cfif read_title.prop_tax_day eq '6'>selected</cfif>>6</option>
<option value="7" <cfif read_title.prop_tax_day eq '7'>selected</cfif>>7</option>
<option value="8" <cfif read_title.prop_tax_day eq '8'>selected</cfif>>8</option>
<option value="9" <cfif read_title.prop_tax_day eq '9'>selected</cfif>>9</option>
<option value="10" <cfif read_title.prop_tax_day eq '10'>selected</cfif>>10</option>
<option value="11" <cfif read_title.prop_tax_day eq '11'>selected</cfif>>11</option>
<option value="12" <cfif read_title.prop_tax_day eq '12'>selected</cfif>>12</option>
<option value="13" <cfif read_title.prop_tax_day eq '13'>selected</cfif>>13</option>
<option value="14" <cfif read_title.prop_tax_day eq '14'>selected</cfif>>14</option>
<option value="15" <cfif read_title.prop_tax_day eq '15'>selected</cfif>>15</option>
<option value="16" <cfif read_title.prop_tax_day eq '16'>selected</cfif>>16</option>
<option value="17" <cfif read_title.prop_tax_day eq '17'>selected</cfif>>17</option>
<option value="18" <cfif read_title.prop_tax_day eq '18'>selected</cfif>>18</option>
<option value="19" <cfif read_title.prop_tax_day eq '19'>selected</cfif>>19</option>
<option value="20" <cfif read_title.prop_tax_day eq '20'>selected</cfif>>20</option>
<option value="21" <cfif read_title.prop_tax_day eq '21'>selected</cfif>>21</option>
<option value="22" <cfif read_title.prop_tax_day eq '22'>selected</cfif>>22</option>
<option value="23" <cfif read_title.prop_tax_day eq '23'>selected</cfif>>23</option>
<option value="24" <cfif read_title.prop_tax_day eq '24'>selected</cfif>>24</option>
<option value="25" <cfif read_title.prop_tax_day eq '25'>selected</cfif>>25</option>
<option value="26" <cfif read_title.prop_tax_day eq '26'>selected</cfif>>26</option>
<option value="27" <cfif read_title.prop_tax_day eq '27'>selected</cfif>>27</option>
<option value="28" <cfif read_title.prop_tax_day eq '28'>selected</cfif>>28</option>
<option value="29" <cfif read_title.prop_tax_day eq '29'>selected</cfif>>29</option>
<option value="30" <cfif read_title.prop_tax_day eq '30'>selected</cfif>>30</option>
<option value="31" <cfif read_title.prop_tax_day eq '31'>selected</cfif>>31</option>
</select>,
&nbsp;&nbsp;<select name="prop_tax_year"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">

<option value=""></option>
<option value="" selected >Year</option>
<option value="2020" <cfif read_title.prop_tax_year eq '2020'>selected</cfif>>2020</option>
<option value="2019" <cfif read_title.prop_tax_year eq '2019'>selected</cfif>>2019</option>
<option value="2018" <cfif read_title.prop_tax_year eq '2018'>selected</cfif>>2018</option>
<option value="2017" <cfif read_title.prop_tax_year eq '2017'>selected</cfif>>2017</option>
<option value="2016" <cfif read_title.prop_tax_year eq '2016'>selected</cfif>>2016</option>
<option value="2015" <cfif read_title.prop_tax_year eq '2015'>selected</cfif>>2015</option>
<option value="2014" <cfif read_title.prop_tax_year eq '2014'>selected</cfif>>2014</option>
<option value="2013" <cfif read_title.prop_tax_year eq '2013'>selected</cfif>>2013</option>
<option value="2012" <cfif read_title.prop_tax_year eq '2012'>selected</cfif>>2012</option>
<option value="2011" <cfif read_title.prop_tax_year eq '2011'>selected</cfif>>2011</option>
<option value="2010" <cfif read_title.prop_tax_year eq '2010'>selected</cfif>>2010</option>
<option value="2009" <cfif read_title.prop_tax_year eq '2009'>selected</cfif>>2009</option>
<option value="2008" <cfif read_title.prop_tax_year eq '2008'>selected</cfif>>2008</option>
<option value="2007" <cfif read_title.prop_tax_year eq '2007'>selected</cfif>>2007</option>
<option value="2006" <cfif read_title.prop_tax_year eq '2006'>selected</cfif>>2006</option>
<option value="2005" <cfif read_title.prop_tax_year eq '2005'>selected</cfif>>2005</option>

		</select>,  which are a lien not yet due and payable, including any assessments collected with taxes to be levied; including increases occasioned be retroactive revaluation, changes in land usage or loss of any homestead exemption status for the insured premises.





<div align="center"><input name="submit" type="submit" value="Save Changes"></div>
</cfform>



<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</HTML>