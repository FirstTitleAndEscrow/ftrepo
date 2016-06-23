<cfif NOT IsDefined("session.Is_Logged_in") and CGI.SCRIPT_NAME NEQ '/admin_area/login.cfm'>
<script language="javascript">
alert("Please log in before accessing this page");
</script>
<cflocation url="https://#CGI.SERVER_NAME#/client/loginb.cfm">
</cfif>


<cfparam name="app_id" default="">
<cfparam name="anc_id" default="">
<cfparam name="avm_id" default="">
<cfparam name="cr_id" default="">
<cfparam name="sn_id" default="">
<cfparam name="prop_id" default="">
<cfparam name="buyer_lname" default="">
<cfparam name="buyer_fname" default="">
<cfparam name="seller_fname" default="">
<cfparam name="seller_lname" default="">
<cfparam name="comments" default="">
<cfparam name="event1" default="">
<cfparam name="clear_close" default="">
<cfparam name="Instructions_Received" default="">
<cfparam name="Instructions_unReceived" default="">
<cfparam name="Final_HUD_complete" default="">
<cfparam name="Final_HUD_uncomplete" default="">
<cfparam name="loanfun" default="">
<cfparam name="mortrec" default="">
<cfparam name="titlepol" default="">
<cfparam name="titlenotpol" default="">
<cfparam name="loannotfun" default="">
<cfparam name="mortnotrec" default="">
<cfparam name="datamerged" default="">
<cfparam name="datanotmerged" default="">
<cfparam name="event2" default="">
<cfparam name="event3" default="Payoffs Ordered">
<cfparam name="event4" default="">
<cfparam name="event5" default="">
<cfparam name="event6" default="">
<cfparam name="event7" default="">
<cfparam name="event8" default="">
<cfparam name="event9" default="">
<cfparam name="event10" default="">
<cfparam name="event11" default="">
<cfparam name="event12" default="">
<cfparam name="event13" default="Payoffs Not Received">
<cfparam name="event14" default="">
<cfparam name="event15" default="">
<cfparam name="event16" default="">
<cfparam name="event17" default="">
<cfparam name="event18" default="">
<cfparam name="abstract" default="">
<cfparam name="appraisal_status" default="">
<cfparam name="sortorder" default="">
<cfparam name="user_id" default="">
<cfparam name="form.abstractor" default="none">
<cfparam name="form.confirm_mon" default="7">
<cfparam name="form.comfirm_day" default="01">
<cfparam name="form.confirm_year" default="2006">
<cfparam name="form.comfirm_day_to" default="#DatePart('d', Now())#">
<cfparam name="form.confirm_mon_to" default="#DatePart('m', Now())#">
<cfparam name="form.confirm_year_to" default="#DatePart('yyyy', Now())#">
<cfparam name="title_id" default="">
<cfparam name="order_id" default="">
<cfparam name="abstract_id" default="">
<cfparam name="abstract_file" default="">
<cfparam name="icl_file" default="">
<cfparam name="closer_file" default="">
<cfparam name="company_id" default="none">
<cfparam name="state" default="none">
<cfparam name="a_trigger" default="1">
<cfparam name="loan_number" default="">
<cfparam name="url.uid" default="277">
<cfparam name="url.AL" default="1">
<CFSET r_count = "0">



<cfset all_queries = QueryNew("title_id, check_date, bfirstname1, blastname1, merge_date, company, a_date_completed, a_time_completed, appraisal_status, pay_off_ID, pay_off_num")>


<script language="javascript">
function upload_payoff(id, num, type) {
var set_url = 'ctc_upload.cfm?payoff_id=' + id + '&pnum=' + num + '&type=' + type + '';

window.open(set_url,null,
    'height=150,width=500,status=yes,toolbar=no,menubar=no,location=no, scrollbars=yes');

}

</script>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	SELECT  *
	FROM	First_Admin
	where id = #url.uid#
</CFQUERY>

		<cfoutput>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
	<CFSET comfirm_day = #comfirm_day#>
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
	<CFSET confirm_year = #confirm_year#>
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	<CFSET confirm_mon_to = #confirm_mon_to#>
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
	<CFSET comfirm_day_to = #comfirm_day_to#>
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
	<CFSET confirm_year_to = #confirm_year_to#>
</cfif></CFIF>
		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.datamerged")><cfif #datamerged# NEQ "NONE">
	<CFSET datamerged = #datamerged#>
</cfif></CFIF>
<CFIF IsDefined("form.datanotmerged")><cfif #datanotmerged# NEQ "NONE">
	<CFSET datanotmerged = #datanotmerged#>
</cfif></CFIF>
<CFIF IsDefined("form.loanfun")><cfif #loanfun# NEQ "NONE">
	<CFSET loanfun = #loanfun#>
</cfif></CFIF>
<CFIF IsDefined("form.mortrec")><cfif #mortrec# NEQ "NONE">
	<CFSET mortrec = #mortrec#>
</cfif></CFIF>
<CFIF IsDefined("form.titlepol")><cfif #titlepol# NEQ "NONE">
	<CFSET titlepol = #titlepol#>
</cfif></CFIF>
<CFIF IsDefined("form.titlenotpol")><cfif #titlenotpol# NEQ "NONE">
	<CFSET titlenotpol = #titlenotpol#>
</cfif></CFIF>
<CFIF IsDefined("form.loannotfun")><cfif #loannotfun# NEQ "NONE">
	<CFSET loannotfun = #loannotfun#>
</cfif></CFIF>
<CFIF IsDefined("form.mortnotrec")><cfif #mortnotrec# NEQ "NONE">
	<CFSET mortnotrec = #mortnotrec#>
</cfif></CFIF>
<CFIF IsDefined("form.clear_close")><cfif #clear_close# NEQ "NONE">
	<CFSET clear_close = #clear_close#>
</cfif></CFIF>
<CFIF IsDefined("form.instructions_received")><cfif #instructions_received# NEQ "NONE">
	<CFSET instructions_received = #instructions_received#>
</cfif></CFIF>
<CFIF IsDefined("form.instructions_unreceived")><cfif #instructions_unreceived# NEQ "NONE">
	<CFSET instructions_unreceived = #instructions_unreceived#>
</cfif></CFIF>
<CFIF IsDefined("form.final_HUD_complete")><cfif #final_HUD_complete# NEQ "NONE">
	<CFSET final_HUD_complete = #final_HUD_complete#>
</cfif></CFIF>
<CFIF IsDefined("form.final_HUD_uncomplete")><cfif #final_HUD_uncomplete# NEQ "NONE">
	<CFSET final_HUD_uncomplete = #final_HUD_uncomplete#>
</cfif></CFIF>
<CFIF IsDefined("form.event1")><cfif #event1# NEQ "NONE">
	<CFSET event1 = #event1#>
</cfif></CFIF>
<CFIF IsDefined("form.event2")><cfif #event2# NEQ "NONE">
	<CFSET event2 = #event2#>
</cfif></CFIF>
<CFIF IsDefined("form.event3")><cfif #event3# NEQ "NONE">
	<CFSET event3 = #event3#>
</cfif></CFIF>
<CFIF IsDefined("form.event4")><cfif #event4# NEQ "NONE">
	<CFSET event4 = #event4#>
</cfif></CFIF>
<CFIF IsDefined("form.event5")><cfif #event5# NEQ "NONE">
	<CFSET event5 = #event5#>
</cfif></CFIF>
<CFIF IsDefined("form.abstractor")><cfif #abstractor# NEQ "NONE">
	<CFSET abstractor = #abstractor#>
</cfif></CFIF>
<CFIF IsDefined("form.event7")><cfif #event7# NEQ "NONE">
	<CFSET event7 = #event7#>
</cfif></CFIF>
<CFIF IsDefined("form.event8")><cfif #event8# NEQ "NONE">
	<CFSET event8 = #event8#>
</cfif></CFIF>
<CFIF IsDefined("form.event9")><cfif #event9# NEQ "NONE">
	<CFSET event9 = #event9#>
</cfif></CFIF>
<CFIF IsDefined("form.event10")><cfif #event10# NEQ "NONE">
	<CFSET event10 = #event10#>
</cfif></CFIF>
<CFIF IsDefined("form.event11")><cfif #event11# NEQ "NONE">
	<CFSET event11 = #event11#>
</cfif></CFIF>
<CFIF IsDefined("form.event12")><cfif #event12# NEQ "NONE">
	<CFSET event12 = #event12#>
</cfif></CFIF>
<CFIF IsDefined("form.event13")><cfif #event13# NEQ "NONE">
	<CFSET event13 = #event13#>
</cfif></CFIF>
<CFIF IsDefined("form.event14")><cfif #event14# NEQ "NONE">
	<CFSET event14 = #event14#>
</cfif></CFIF>

<CFIF IsDefined("form.event16")><cfif #event16# NEQ "NONE">
	<CFSET event16 = #event16#>
</cfif></CFIF>
<CFIF IsDefined("form.event17")><cfif #event17# NEQ "NONE">
	<CFSET event17 = #event17#>
</cfif></CFIF>
<CFIF IsDefined("form.event18")><cfif #event18# NEQ "NONE">
	<CFSET event18 = #event18#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>

<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	<CFSET loan_amount = #loan_amount#>
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	<CFSET title_id = #title_id#>
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	<CFSET prop_id = #prop_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>
</cfoutput>


	<!---- BEGIN MODIFY  ----->

<center>
	<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	#state#,
</cfif></CFIF>
<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	#comments#,
</cfif></CFIF>
<CFIF IsDefined("form.clear_close")><cfif #clear_close# NEQ "NONE">
	#clear_close#,
</cfif></CFIF>
<CFIF IsDefined("form.instructions_received")><cfif #instructions_received# NEQ "NONE">
	#instructions_received#,
</cfif></CFIF>
<CFIF IsDefined("form.instructions_unreceived")><cfif #instructions_unreceived# NEQ "NONE">
	#instructions_unreceived#,
</cfif></CFIF>
<CFIF IsDefined("form.final_HUD_complete")><cfif #final_HUD_complete# NEQ "NONE">
	#final_HUD_complete#,
</cfif></CFIF>
<CFIF IsDefined("form.final_HUD_uncomplete")><cfif #final_HUD_uncomplete# NEQ "NONE">
	#final_HUD_uncomplete#,
</cfif></CFIF>
<CFIF IsDefined("form.event1")><cfif #event1# NEQ "NONE">
	#event1#,
</cfif></CFIF>
<CFIF IsDefined("form.event2")><cfif #event2# NEQ "NONE">
	#event2#,
</cfif></CFIF>
<CFIF IsDefined("form.event3")><cfif #event3# NEQ "NONE">
	#event3#,
</cfif></CFIF>
<CFIF IsDefined("form.event4")><cfif #event4# NEQ "NONE">
	#event4#,
</cfif></CFIF>
<CFIF IsDefined("form.event5")><cfif #event5# NEQ "NONE">
	#event5#,
</cfif></CFIF>
<CFIF IsDefined("form.datamerged")><cfif #datamerged# NEQ "NONE">
	#datamerged#,
</cfif></CFIF>
<CFIF IsDefined("form.datanotmerged")><cfif #datanotmerged# NEQ "NONE">
	#datanotmerged#,
</cfif></CFIF>
<CFIF IsDefined("form.loanfun")><cfif #loanfun# NEQ "NONE">
	#loanfun#,
</cfif></CFIF>
<CFIF IsDefined("form.mortrec")><cfif #mortrec# NEQ "NONE">
	#mortrec#,
</cfif></CFIF>
<CFIF IsDefined("form.loannotfun")><cfif #loannotfun# NEQ "NONE">
	#loannotfun#,
</cfif></CFIF>
<CFIF IsDefined("form.mortnotrec")><cfif #mortnotrec# NEQ "NONE">
	#mortnotrec#,
</cfif></CFIF>
<CFIF IsDefined("form.titlepol")><cfif #titlepol# NEQ "NONE">
	#titlepol#,
</cfif></CFIF>
<CFIF IsDefined("form.titlenotpol")><cfif #titlenotpol# NEQ "NONE">
	#titlenotpol#,
</cfif></CFIF>
<CFIF IsDefined("form.abstractor")><cfif #abstractor# NEQ "NONE">
	#abstractor#,
</cfif></CFIF>
<CFIF IsDefined("form.event7")><cfif #event7# NEQ "NONE">
	#event7#,
</cfif></CFIF>
<CFIF IsDefined("form.event8")><cfif #event8# NEQ "NONE">
	#event8#,
</cfif></CFIF>
<CFIF IsDefined("form.event9")><cfif #event9# NEQ "NONE">
	#event9#,
</cfif></CFIF>
<CFIF IsDefined("form.event10")><cfif #event10# NEQ "NONE">
	#event10#,
</cfif></CFIF>
<CFIF IsDefined("form.event11")><cfif #event11# NEQ "NONE">
	#event11#,
</cfif></CFIF>
<CFIF IsDefined("form.event12")><cfif #event12# NEQ "NONE">
	#event12#,
</cfif></CFIF>
<CFIF IsDefined("form.event13")><cfif #event13# NEQ "NONE">
	#event13#,
</cfif></CFIF>
<CFIF IsDefined("form.event14")><cfif #event14# NEQ "NONE">
	#event14#,
</cfif></CFIF>
<CFIF IsDefined("form.event16")><cfif #event16# NEQ "NONE">
	#event16#,
</cfif></CFIF>
<CFIF IsDefined("form.event17")><cfif #event17# NEQ "NONE">
	#event17#,
</cfif></CFIF>
<CFIF IsDefined("form.event18")><cfif #event18# NEQ "NONE">
	#event18#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	#abstract_id#,
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	#abstract_file#,
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	#icl_file#,
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	#closer_file#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

</center>

<cfif #a_trigger# eq "1">
	<CFIF #state# eq "none" and #company_id# eq "none">
		<CFQUERY datasource="#request.dsn#" NAME="search1">
			SELECT *
			FROM Title a, doc_title_insurance_title d, tax_cert_title e, doc_abstract_title f, pay_off_lender_1_title g
			WHERE a.title_id = d.title_id and a.title_id = e.title_id and a.title_id = f.title_id and a.title_id = g.title_id
			and a.cancelled is null

		<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
			<cfif (#event3# NEQ "NONE") and (#event3# is "Payoffs Ordered")>
				and (g.a_assigned_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
		</cfif>






		<cfif (#event13# NEQ "NONE") and (#event13# is "Payoffs Not Received")>
			and (a.title_id = g.title_id AND g.a_recieved_by is null)
		</cfif>
		<cfif (#event3# NEQ "NONE") and (#event3# is "Payoffs Ordered")>
			AND a.title_id = g.title_id AND g.a_assigned_by is not null
		</cfif>
		order by a.title_id
	</CFQUERY>




<cfloop query="search1">
<cfset temp = QueryAddRow(all_queries)>
<cfif search1.title_id neq 'NULL' and search1.title_id neq ''>
<cfset temp = QuerySetCell(all_queries, "title_id", search1.title_id)>
<cfelse>
<cfset temp = QuerySetCell(all_queries, "title_id", "")>
</cfif>

<cfif search1.check_date neq 'NULL' and search1.check_date neq ''>
<cfset temp = QuerySetCell(all_queries, "check_date", search1.check_date)>
</cfif>

<cfif search1.bfirstname1 neq 'NULL' and search1.bfirstname1 neq ''>
<cfset temp = QuerySetCell(all_queries, "bfirstname1", search1.bfirstname1)>
</cfif>

<cfif search1.blastname1 neq 'NULL' and search1.blastname1 neq ''>
<cfset temp = QuerySetCell(all_queries, "blastname1", search1.blastname1)>
</cfif>

<cfif search1.merge_date neq 'NULL' and search1.merge_date neq ''>
<cfset temp = QuerySetCell(all_queries, "merge_date", search1.merge_date)>
</cfif>

<cfif search1.company neq 'NULL' and search1.company neq ''>
<cfset temp = QuerySetCell(all_queries, "company", search1.company)>
</cfif>

<cfif search1.a_date_completed neq 'NULL' and search1.a_date_completed neq ''>
<cfset temp = QuerySetCell(all_queries, "a_date_completed", search1.a_date_completed)>
</cfif>

<cfif search1.a_time_completed neq 'NULL' and search1.a_time_completed neq ''>
<cfset temp = QuerySetCell(all_queries, "a_time_completed", search1.a_time_completed)>
</cfif>

<cfif search1.appraisal_status neq 'NULL' and search1.appraisal_status neq ''>
<cfset temp = QuerySetCell(all_queries, "appraisal_status", search1.appraisal_status)>
</cfif>

<cfif search1.pay_off_1_ID neq 'NULL' and search1.pay_off_1_ID neq ''>
<cfset temp = QuerySetCell(all_queries, "pay_off_id", search1.pay_off_1_ID)>
</cfif>


<cfset temp = QuerySetCell(all_queries, "pay_off_num", 1)>
</cfloop>



<CFQUERY datasource="#request.dsn#" NAME="search2">
			SELECT *
			FROM Title a, doc_title_insurance_title d, tax_cert_title e, doc_abstract_title f, pay_off_lender_2_title g
			WHERE a.title_id = d.title_id and a.title_id = e.title_id and a.title_id = f.title_id and a.title_id = g.title_id
			and a.cancelled is null

		<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
			<cfif (#event3# NEQ "NONE") and (#event3# is "Payoffs Ordered")>
				and (g.a_assigned_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
		</cfif>






		<cfif (#event13# NEQ "NONE") and (#event13# is "Payoffs Not Received")>
			and (a.title_id = g.title_id AND g.a_recieved_by is null)
		</cfif>
		<cfif (#event3# NEQ "NONE") and (#event3# is "Payoffs Ordered")>
			AND a.title_id = g.title_id AND g.a_assigned_by is not null
		</cfif>
		order by a.title_id
	</CFQUERY>



<cfloop query="search2">
<cfset temp = QueryAddRow(all_queries)>
<cfif search2.title_id neq 'NULL' and search2.title_id neq ''>
<cfset temp = QuerySetCell(all_queries, "title_id", search2.title_id)>
<cfelse>
<cfset temp = QuerySetCell(all_queries, "title_id", "")>
</cfif>

<cfif search2.check_date neq 'NULL' and search2.check_date neq ''>
<cfset temp = QuerySetCell(all_queries, "check_date", search2.check_date)>
</cfif>

<cfif search2.bfirstname1 neq 'NULL' and search2.bfirstname1 neq ''>
<cfset temp = QuerySetCell(all_queries, "bfirstname1", search2.bfirstname1)>
</cfif>

<cfif search2.blastname1 neq 'NULL' and search2.blastname1 neq ''>
<cfset temp = QuerySetCell(all_queries, "blastname1", search2.blastname1)>
</cfif>

<cfif search2.merge_date neq 'NULL' and search2.merge_date neq ''>
<cfset temp = QuerySetCell(all_queries, "merge_date", search2.merge_date)>
</cfif>

<cfif search2.company neq 'NULL' and search2.company neq ''>
<cfset temp = QuerySetCell(all_queries, "company", search2.company)>
</cfif>

<cfif search2.a_date_completed neq 'NULL' and search2.a_date_completed neq ''>
<cfset temp = QuerySetCell(all_queries, "a_date_completed", search2.a_date_completed)>
</cfif>

<cfif search2.a_time_completed neq 'NULL' and search2.a_time_completed neq ''>
<cfset temp = QuerySetCell(all_queries, "a_time_completed", search2.a_time_completed)>
</cfif>

<cfif search2.appraisal_status neq 'NULL' and search2.appraisal_status neq ''>
<cfset temp = QuerySetCell(all_queries, "appraisal_status", search2.appraisal_status)>
</cfif>

<cfif search2.pay_off_2_ID neq 'NULL' and search2.pay_off_2_ID neq ''>
<cfset temp = QuerySetCell(all_queries, "pay_off_id", search2.pay_off_2_ID)>
</cfif>






<cfset temp = QuerySetCell(all_queries, "pay_off_num", 2)>
</cfloop>



<cfquery dbtype="query" name="read_report">
	SELECT *
	FROM all_queries
	order by check_date, title_id, pay_off_num
</cfquery>





	<CFSET r_count = #read_report.recordcount#>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=820 align=center valign=top>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=820 align=center valign=top bgcolor=e1e1e1>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for titles</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>

	<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>

		</TD>
				</TR>
	<tr>

			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
						<td bgcolor=gray width=201 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif (#datamerged# NEQ "NONE") and (#datamerged# is "Data Merged")>
								Date Merged
							<cfelse>
								Abstractor
							</cfif>
						</td>
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Rpt Recv'd
						</td>
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Notes
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Upload
						</td>
					</tr>
<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	<CFLOOP QUERY="read_report">
		<CFOUTPUT>
			<!--- <CFQUERY datasource="#request.dsn#" NAME="read_time">
				SELECT *
				FROM Title a, doc_title_insurance_title d
				WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and a.cancelled is null
			</cfquery> --->
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=201 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif (#datamerged# NEQ "NONE") and (#datamerged# is "Data Merged")>
								#DateFormat(read_report.merge_date, "m/d/yyyy")# #TimeFormat(read_report.merge_time, "HH:mm:ss")#
							<cfelse>
								#read_report.Company#
							</cfif>
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
								#DateFormat(read_report.a_date_completed, "m/d/yyyy")# #TimeFormat(read_report.a_time_completed, "HH:mm:ss")#
						</td>
                       <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="https://#cgi.server_name#/admin_area/title_comments_nav.cfm?uid=277&al=0&rec_id=#title_id#&user_id=277&title_id=#title_id#&comments=&appraisal_status=&a_trigger=0&code=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">add/view</a>
						</td>
						<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="green"><a href="##" onClick="upload_payoff(#pay_off_id#, #pay_off_num#, 'title');">upload</a></font>
						</td>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
				</tr>
	</CFOUTPUT>	</CFLOOP>
	</table>



			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

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



</cfif></cfif>


































