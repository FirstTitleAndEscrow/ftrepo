


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
<cfparam name="event3" default=""> 
<cfparam name="event4" default=""> 
<cfparam name="event5" default=""> 
<cfparam name="event6" default=""> 
<cfparam name="event7" default=""> 
<cfparam name="event8" default=""> 
<cfparam name="event9" default=""> 
<cfparam name="event10" default=""> 
<cfparam name="event11" default=""> 
<cfparam name="event12" default=""> 
<cfparam name="event13" default=""> 
<cfparam name="event14" default=""> 
<cfparam name="event15" default=""> 
<cfparam name="event16" default=""> 
<cfparam name="event17" default="">
<cfparam name="event18" default=""> 
<cfparam name="event19" default=""> 
<cfparam name="event20" default=""> 
<cfparam name="event21" default=""> 
<cfparam name="abstract" default=""> 
<cfparam name="appraisal_status" default="">
<cfparam name="sortorder" default=""> 
<cfparam name="user_id" default="">
<cfparam name="confirm_mon" default="">
<cfparam name="comfirm_day" default="">
<cfparam name="confirm_year" default="">
<cfparam name="comfirm_day_to" default="">
<cfparam name="confirm_mon_to" default="">
<cfparam name="confirm_year_to" default="">
<cfparam name="title_id" default="">
<cfparam name="order_id" default="">
<cfparam name="abstract_id" default="">
<cfparam name="abstract_file" default="">
<cfparam name="icl_file" default="">
<cfparam name="closer_file" default="">
<cfparam name="company_id" default=""> 
<cfparam name="state" default=""> 
<cfparam name="a_trigger" default="0">
<cfparam name="loan_number" default="">
<cfparam name="packagenotreceived" default="">
<cfparam name="closingnotinvoiced" default="">
<cfparam name="srclosingnotpaid" default="">
<cfparam name="mortgagerecordingissue" default="">
<cfparam name="sellerreploanclosed" default="">
<cfparam name="subordination_needed" default="">
<cfparam name="subordination_not_received" default="">
<cfparam name="sellerreploanclosed" default="">
<CFSET r_count = "0">
<cfset forty_five_days_ago = DateFormat(DateAdd("d", -45, Now()), "m/dd/yyyy")>
<cfset ninety_days_ago = DateFormat(DateAdd("d", -90, Now()), "m/dd/yyyy")>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	SELECT  *
	FROM	First_Admin 
	where id = #url.uid#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_richmond_ids">
	SELECT  c.ID
	FROM	companies c, First_Admin f 
	where f.va_employee = 'True'
	and f.ID = c.intSales
</CFQUERY>
<cfset richmond_ids = ValueList(get_richmond_ids.ID)>

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
<CFIF IsDefined("form.event19")><cfif #event19# NEQ "NONE">
	<CFSET event19 = #event19#>
</cfif></CFIF>
<CFIF IsDefined("form.event20")><cfif #event20# NEQ "NONE">
	<CFSET event20 = #event20#>
</cfif></CFIF>
<CFIF IsDefined("form.event21")><cfif #event21# NEQ "NONE">
	<CFSET event21 = #event21#>
</cfif></CFIF>

<CFIF IsDefined("form.subordination_needed")><cfif #subordination_needed# NEQ "NONE">
	<CFSET subordination_needed = #subordination_needed#>
</cfif></CFIF>
<CFIF IsDefined("form.subordination_not_received")><cfif #subordination_not_received# NEQ "NONE">
	<CFSET subordination_not_received = #subordination_not_received#>
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
<CFIF IsDefined("form.packagenotreceived")><cfif #Trim(packagenotreceived)# is not "">
	<CFSET packagenotreceived = #packagenotreceived#>
</cfif></CFIF>
<CFIF IsDefined("form.closingnotinvoiced")><cfif #Trim(closingnotinvoiced)# is not "">
	<CFSET closingnotinvoiced = #closingnotinvoiced#>
</cfif></CFIF>
<CFIF IsDefined("form.srclosingnotpaid")><cfif #Trim(srclosingnotpaid)# is not "">
	<CFSET srclosingnotpaid = #srclosingnotpaid#>
</cfif></CFIF>
<CFIF IsDefined("form.mortgagerecordingissue")><cfif #Trim(mortgagerecordingissue)# is not "">
	<CFSET mortgagerecordingissue = #mortgagerecordingissue#>
</cfif></CFIF>
</cfoutput>
		
		
	<!---- BEGIN MODIFY  ----->

	
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
/#confirm_year_to#,
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
<CFIF IsDefined("form.event19")><cfif #event19# NEQ "NONE">
	#event19#,
</cfif></CFIF>
<CFIF IsDefined("form.event20")><cfif #event20# NEQ "NONE">
	#event20#,
</cfif></CFIF>
<CFIF IsDefined("form.event21")><cfif #event21# NEQ "NONE">
	#event21#,
</cfif></CFIF>
<CFIF IsDefined("form.subordination_needed")><cfif #subordination_needed# NEQ "NONE">
	<CFSET subordination_needed = #subordination_needed#>
</cfif></CFIF>
<CFIF IsDefined("form.subordination_not_received")><cfif #subordination_not_received# NEQ "NONE">
	<CFSET subordination_not_received = #subordination_not_received#>
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
</cfif></CFIF>
<CFIF IsDefined("form.packagenotreceived")><cfif #Trim(packagenotreceived)# is not "">
	#packagenotreceived#,
</cfif></CFIF>
<CFIF IsDefined("form.closingnotinvoiced")><cfif #Trim(closingnotinvoiced)# is not "">
	#closingnotinvoiced#,
</cfif></CFIF>
<CFIF IsDefined("form.srclosingnotpaid")><cfif #Trim(srclosingnotpaid)# is not "">
	#srclosingnotpaid#,
</cfif></CFIF>
<CFIF IsDefined("form.mortgagerecordingissue")><cfif #Trim(mortgagerecordingissue)# is not "">
	#mortgagerecordingissue#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>


<cfif #a_trigger# eq "1">
<CFIF #state# eq "none" and #company_id# eq "none">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, doc_title_insurance_title d, tax_cert_title e, doc_abstract_title f, pay_off_lender_1_title g
			WHERE a.oda_year > 2005 and  a.title_id = d.title_id and a.title_id = e.title_id and a.title_id = f.title_id and a.title_id = g.title_id 
			<cfif (#sellerreploanclosed# NEQ "NONE") and (#sellerreploanclosed# is "Seller Rep - Loan Closed")>
		AND a.appraisal_status = 'Loan Closed-Seller Rep'
		</cfif>
		<cfif #comments# neq "none">
			<cfif #comments# is "Cancelled per client">
				and a.cancelled = 1 
			<cfelse> 
    			and (a.cancelled is null or a.cancelled = 0)
			</cfif>
		<cfelse>
    		and (a.cancelled is null or a.cancelled = 0)
		</cfif>
		
		<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
			<cfif (#event1# NEQ "NONE") and (#event1# is "Abstracts Assigned")>
				and (f.a_Date_Assigned between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event2# NEQ "NONE") and (#event2# is "Abstracts Received")>
				and (f.a_Date_completed between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#datamerged# NEQ "NONE") and (#datamerged# is "Data Merged")>
				and (d.merge_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event17# NEQ "NONE") and (#event17# is "Vendor note added")>
				and (f.vendor_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event8# NEQ "NONE") and (#event8# is "Orders with abstract data")>
				and (f.abstract_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event5# NEQ "NONE") and (#event5# is "Title Ins completed")>
				and (d.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event3# NEQ "NONE") and (#event3# is "Payoffs Ordered")>
				and (g.a_assigned_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event4# NEQ "NONE") and (#event4# is "Payoffs Received")>
				and (g.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event7# NEQ "NONE") and (#event7# is "Tax Data Completed")>
				and (e.a_date_finished between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif #appraisal_status# NEQ "none">
				<cfif #appraisal_status# eq "In Typing">
					and (f.a_Date_completed between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				<cfelseif #appraisal_status# eq "Report E-mailed">
					and (d.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				<cfelse>
					and (d.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
			<cfelse>
					and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
		</cfif>
		<cfif #comments# neq "none">
			<cfif #comments# is "Call for Detail">
				and (e.call_detail = 1)</cfif>
			<cfif #comments# is "Cancelled per client">
				and (e.cancelled_client = 1)</cfif>
			<cfif #comments# is "Clear to Close">
				and (e.clear_close = 1)</cfif>
			<cfif #comments# is "Court House Closed">
				and (e.court_house = 1)</cfif>
			<cfif #comments# is "FT Shipped Pack">
				and (e.ft_shipped = 1)</cfif>
			<cfif #comments# is "Funds Not Received">
				and (e.funds_received = 1)</cfif>
			<cfif #comments# is "Judgments Exist">
				and (e.judge_exist = 1)</cfif>
			<cfif #comments# is "Name/Address found not matching order">
				and (e.name_address = 1)</cfif>
			<cfif #comments# is "Not Clear to Close">
				and (e.not_clear_close = 1)</cfif>
			<cfif #comments# is "OK to fund">
				and (e.ok_fund = 1)</cfif>
			<cfif #comments# is "Order Reinstated">
				and (e.order_reinstate = 1)</cfif>
			<cfif #comments# is "Package Received">
				and (e.package_recieve = 1)</cfif>
			<cfif #comments# is "Package Due/Unrec.">
				and (e.package_due = 1)</cfif>
			<cfif #comments# is "Pre-Funding Completed">
				and (e.pre_funding = 1)</cfif>
			<cfif #comments# is "Pre-Funding Problem">
				and (e.funding_prob = 1)</cfif>
			<cfif #comments# is "Subordination Needed">
				and (e.subordination_need = 1)</cfif>
			<cfif #comments# is "Subordination Received">
				and (e.subordination_received = 1)</cfif>
			<cfif #comments# is "Supervisor Notification">
				and (e.supervisor_notify = 1)</cfif>
			<cfif #comments# is "Unreleased Mortgages Exists">
				and (e.unreleased_mort = 1)</cfif>
			<cfif #comments# is "Vesting Issue">
				and (e.vesting_issue = 1)</cfif>
			<cfif #comments# is "Waiting on Judgment Info">
				and (e.waiting_judgment = 1)</cfif>
			<cfif #comments# is "Waiting on Tax Info.">
				and (e.waiting_tax = 1)
			</cfif>
		</cfif>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
		<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
		</CFIF>
		<CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
		</CFIF>
		<cfif #abstractor# NEQ "NONE">
			and f.abstractor_id = '#abstractor#'
		</cfif>
		<CFIF #title_id# NEQ "none">
			AND a.title_id = '#title_id#'
		</CFIF> 
		<CFIF #loan_number# NEQ "">
			AND a.loan_number = '#loan_number#'
		</CFIF>
		<CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
		</CFIF>  
		<CFIF IsDefined("FORM.buyer_fname")>
			AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
		</CFIF>			
		<CFIF IsDefined("FORM.buyer_lname")>
			AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
		</CFIF>
		<CFIF IsDefined("FORM.seller_fname")>
			AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
		</CFIF>			
		<CFIF IsDefined("FORM.seller_lname")>
			AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
		</CFIF> 				
      	<cfif (#event10# NEQ "NONE") and (#event10# is "Abstracts Not Assigned")>
			and (a.title_id = f.title_id AND f.a_assigned_by is null)
		</cfif>
		<cfif (#event11# NEQ "NONE") and (#event11# is "Abstracts Not Received")>
			and (a.title_id = f.title_id AND f.a_recieved_by is null) 
		</cfif>
		<cfif (#event1# NEQ "NONE") and (#event1# is "Abstracts Assigned")>
			AND a.title_id = f.title_id AND f.a_assigned_by is not null 
		</cfif>
		<cfif (#event2# NEQ "NONE") and (#event2# is "Abstracts Received")>
			AND a.title_id = f.title_id AND f.a_recieved_by is not null 
		</cfif>
		<cfif (#event8# NEQ "NONE") and (#event8# is "Orders with abstract data")>
			AND a.title_id = f.title_id AND f.abstract_date is not null 
		</cfif>
		<cfif (#event17# NEQ "NONE") and (#event17# is "Vendor note added")>
			AND a.title_id = f.title_id AND f.vendor_date is not null 
		</cfif>
		<cfif (#datamerged# NEQ "NONE") and (#datamerged# is "Data Merged")>
			AND a.title_id = d.title_id AND d.merge_date is not null 
		</cfif>
		<cfif (#datanotmerged# NEQ "NONE") and (#datanotmerged# is "Data Not Merged")>
			AND a.title_id = d.title_id AND d.merge_date is null 
		</cfif>
		<cfif (#event12# NEQ "NONE") and (#event12# is "Payoffs Not Ordered")>
			and (a.title_id = g.title_id AND g.a_assigned_by is null) 
		</cfif> 	
		<cfif (#event13# NEQ "NONE") and (#event13# is "Payoffs Not Received")>
			and (a.title_id = g.title_id AND g.a_recieved_by is null) 
		</cfif>	
		<cfif (#event3# NEQ "NONE") and (#event3# is "Payoffs Ordered")>
			AND a.title_id = g.title_id AND g.a_assigned_by is not null 
		</cfif> 	
		<cfif (#event4# NEQ "NONE") and (#event4# is "Payoffs Received")>
			AND a.title_id = g.title_id AND g.a_recieved_by is not null 
		</cfif>	
		<cfif (#clear_close# NEQ "NONE") and (#clear_close# is "Not Clear to Close")>
			and (a.title_id = d.title_id AND d.clear_close is null) 
		</cfif>
		<cfif (#event14# NEQ "NONE") and (#event14# is "Title Ins Uncompleted")>
			and (a.title_id = d.title_id AND d.s_status is null) 
		</cfif>
		<cfif (#event5# NEQ "NONE") and (#event5# is "Title Ins completed")>
			AND a.title_id = d.title_id AND d.s_status is not null 
		</cfif> 	
		<cfif (#event16# NEQ "NONE") and (#event16# is "Tax Data Not Completed")>
			and (a.title_id = e.title_id AND  e.taxes_completed <> 1) 
		</cfif>
	 	<cfif (#event17# NEQ "NONE") and (#event17# is "Uncompleted ICL orders")>
			AND (a.request_icl = 'Yes' and a.icl_upload is null and a.icl_upload2 is null)
	 	</cfif>
	 	<cfif (#event7# NEQ "NONE") and (#event7# is "Tax Data Completed")>
			AND a.title_id = e.title_id AND  e.taxes_completed = 1 
		</cfif>
		<cfif #event9# neq "none" and #event9# is "Orders with abstract files">
			AND a.title_id = f.title_id and a.e_status is null and (f.abstract_upload1 is not null OR f.abstract_upload2 is not null OR f.abstract_upload3 is not null) 
		</cfif>
	 	
		<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>

		<cfif #sortorder# NEQ "NONE">
			ORDER BY #sortorder#
		<CFELSE>
		 	ORDER BY  check_date
		</cfif> 
	</CFQUERY>  

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
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REO Num
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
							Comments
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>
<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	<cfset list_of_ids = "">
	<CFLOOP QUERY="read_report"> 
		<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_time">
				SELECT *
				FROM Title a, doc_title_insurance_title d
				WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and (a.cancelled is null or a.cancelled = 0)
			</cfquery>
			<cfif read_time.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			</cfif>
			<cfif ListContainsNoCase(richmond_ids, read_time.comp_id, ",")>
			<cfset a_bgcolor="FF99FF">
			</cfif>
			
			<cfif ListFind(list_of_ids, #title_id#, ",") eq 0>
			<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
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
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
						</td>
						<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
				<cfset list_of_ids = ListAppend(list_of_ids, #title_id#, ",")>
				</cfif>
	</CFOUTPUT>	</CFLOOP>
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
<cfelseif #state# neq "none" and #company_id# eq "none">
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
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REO Num
						</td>
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
	<td bgcolor=gray width=201 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif (#datamerged# NEQ "NONE") and (#datamerged# is "Data Merged")>
						Date Merged	<cfelse>
						Abstractor</cfif>
						</td>
						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> 

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>	--->		

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> 
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>--->
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
							Comments
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	<CFSET zip_id_2 = #ListToArray(state, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
	
	<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, doc_title_insurance_title d, tax_cert_title e, doc_abstract_title f, pay_off_lender_1_title g
			WHERE a.oda_year > 2005 and   a.title_id = d.title_id and a.title_id = e.title_id and a.title_id = f.title_id and a.title_id = g.title_id 
			<cfif #comments# neq "none">
				<cfif #comments# is "Cancelled per client">
					and a.cancelled = 1 
				<cfelse> 
					and (a.cancelled is null or a.cancelled = 0)
				</cfif>
			<cfelse>
			and (a.cancelled is null or a.cancelled = 0)
		</cfif>
		
		<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
			<cfif (#event1# NEQ "NONE") and (#event1# is "Abstracts Assigned")>
				and (f.a_Date_Assigned between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event2# NEQ "NONE") and (#event2# is "Abstracts Received")>
				and (f.a_Date_completed between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event5# NEQ "NONE") and (#event5# is "Title Ins completed")>
				and (d.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#datamerged# NEQ "NONE") and (#datamerged# is "Data Merged")>
				and (d.merge_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event17# NEQ "NONE") and (#event17# is "Vendor note added")>
				and (f.vendor_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event8# NEQ "NONE") and (#event8# is "Orders with abstract data")>
				and (f.abstract_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event3# NEQ "NONE") and (#event3# is "Payoffs Ordered")>
				and (g.a_assigned_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event4# NEQ "NONE") and (#event4# is "Payoffs Received")>
				and (g.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#event7# NEQ "NONE") and (#event7# is "Tax Data Completed")>
				and (e.a_date_finished between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				<cfif #appraisal_status# eq "In Typing">
					and (f.a_Date_completed between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				<cfelseif #appraisal_status# eq "Report E-mailed">
					and (d.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				<cfelse>  
					and (d.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
			<cfelse>
				and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
		</cfif>
		<cfif #comments# neq "none">
			<cfif #comments# is "Call for Detail">
				and (e.call_detail = 1)</cfif>
			<cfif #comments# is "Cancelled per client">
				and (e.cancelled_client = 1)</cfif>
		<cfif #comments# is "Clear to Close">
			and (e.clear_close = 1)</cfif>
		<cfif #comments# is "Court House Closed">
			and (e.court_house = 1)</cfif>
		<cfif #comments# is "FT Shipped Pack">
			and (e.ft_shipped = 1)</cfif>
		<cfif #comments# is "Funds Not Received">
			and (e.funds_received = 1)</cfif>
		<cfif #comments# is "Judgments Exist">
			and (e.judge_exist = 1)</cfif>
		<cfif #comments# is "Name/Address found not matching order">
			and (e.name_address = 1)</cfif>
		<cfif #comments# is "Not Clear to Close">
			and (e.not_clear_close = 1)</cfif>
		<cfif #comments# is "OK to fund">
			and (e.ok_fund = 1)</cfif>
		<cfif #comments# is "Order Reinstated">
			and (e.order_reinstate = 1)</cfif>
		<cfif #comments# is "Package Received">
			and (e.package_recieve = 1)</cfif>
		<cfif #comments# is "Pre-Funding Completed">
			and (e.pre_funding = 1)</cfif>
		<cfif #comments# is "Package Due/Unrec.">
			and (e.package_due = 1)</cfif>
		<cfif #comments# is "Pre-Funding Problem">
			and (e.funding_prob = 1)</cfif>
		<cfif #comments# is "Subordination Needed">
			and (e.subordination_need = 1)</cfif>
		<cfif #comments# is "Subordination Received">
			and (e.subordination_received = 1)</cfif>
		<cfif #comments# is "Supervisor Notification">
			and (e.supervisor_notify = 1)</cfif>
		<cfif #comments# is "Unreleased Mortgages Exists">
			and (e.unreleased_mort = 1)</cfif>
		<cfif #comments# is "Vesting Issue">
			and (e.vesting_issue = 1)</cfif>
		<cfif #comments# is "Waiting on Judgment Info">
			and (e.waiting_judgment = 1)</cfif>
		<cfif #comments# is "Waiting on Tax Info.">
			and (e.waiting_tax = 1)</cfif>
		</cfif>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
		<CFIF #appraisal_status# NEQ "none">
			AND a.appraisal_status = '#appraisal_status#'
		</CFIF>
		<CFIF #state# NEQ "none">
			AND a.pstate = '#cty_name_1[TTT]#'
		</CFIF>
		<cfif #abstractor# NEQ "NONE">
			and f.abstractor_id = '#abstractor#'
		</cfif>
		<CFIF #title_id# NEQ "none">
			AND a.title_id = '#title_id#'
		</CFIF> 
		<CFIF #loan_number# NEQ "">
			AND a.loan_number = '#loan_number#'
		</CFIF>
		<CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
		</CFIF> 
		<CFIF IsDefined("FORM.buyer_fname")>
			AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
		</CFIF>			
		<CFIF IsDefined("FORM.buyer_lname")>
			AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
		</CFIF>
		<CFIF IsDefined("FORM.seller_fname")>
			AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
		</CFIF>			
		<CFIF IsDefined("FORM.seller_lname")>
			AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
		</CFIF> 				
      	<cfif (#event10# NEQ "NONE") and (#event10# is "Abstracts Not Assigned")>
			and (a.title_id = f.title_id AND f.a_assigned_by is null)
		</cfif>
		<cfif (#event11# NEQ "NONE") and (#event11# is "Abstracts Not Received")>
			and (a.title_id = f.title_id AND f.a_recieved_by is null) 
		</cfif>
		<cfif (#event1# NEQ "NONE") and (#event1# is "Abstracts Assigned")>
			AND a.title_id = f.title_id AND f.a_assigned_by is not null 
		</cfif>
		<cfif (#event2# NEQ "NONE") and (#event2# is "Abstracts Received")>
			AND a.title_id = f.title_id AND f.a_recieved_by is not null 
		</cfif>
		<cfif (#event12# NEQ "NONE") and (#event12# is "Payoffs Not Ordered")>
			and (a.title_id = g.title_id AND g.a_assigned_by is null) 
		</cfif> 	
		<cfif (#event13# NEQ "NONE") and (#event13# is "Payoffs Not Received")>
			and (a.title_id = g.title_id AND g.a_recieved_by is null) 
		</cfif>	
		<cfif (#event3# NEQ "NONE") and (#event3# is "Payoffs Ordered")>
			AND a.title_id = g.title_id AND g.a_assigned_by is not null 
		</cfif> 	
		<cfif (#event4# NEQ "NONE") and (#event4# is "Payoffs Received")>
			AND a.title_id = g.title_id AND g.a_recieved_by is not null 
		</cfif>	
		<cfif (#event14# NEQ "NONE") and (#event14# is "Title Ins Uncompleted")>
			and (a.title_id = d.title_id AND d.s_status is null) 
		</cfif>
		<cfif (#event5# NEQ "NONE") and (#event5# is "Title Ins completed")>
			AND a.title_id = d.title_id AND d.s_status is not null 
		</cfif> 	
		<cfif (#clear_close# NEQ "NONE") and (#clear_close# is "Not Clear to Close")>
			and (a.title_id = d.title_id AND d.clear_close is null) 
		</cfif>
		<cfif (#event8# NEQ "NONE") and (#event8# is "Orders with abstract data")>
			AND a.title_id = f.title_id AND f.abstract_date is not null 
		</cfif>
		<cfif (#event17# NEQ "NONE") and (#event17# is "Vendor note added")>
			AND a.title_id = f.title_id AND f.vendor_date is not null 
		</cfif>
		<cfif (#datamerged# NEQ "NONE") and (#datamerged# is "Data Merged")>
			AND a.title_id = d.title_id AND d.merge_date is not null 
		</cfif>	
		<cfif (#datanotmerged# NEQ "NONE") and (#datanotmerged# is "Data Not Merged")>
			AND a.title_id = d.title_id AND d.merge_date is null 
		</cfif>
		<cfif (#event16# NEQ "NONE") and (#event16# is "Tax Data Not Completed")>
			and (a.title_id = e.title_id AND e.taxes_completed <> 1) 
		</cfif>
	 	<cfif (#event17# NEQ "NONE") and (#event17# is "Uncompleted ICL orders")>
			AND (a.request_icl = 'Yes' and a.icl_upload is null and a.icl_upload2 is null)
	 	</cfif>
	 	<cfif (#event7# NEQ "NONE") and (#event7# is "Tax Data Completed")>
			AND a.title_id = e.title_id AND  e.taxes_completed = 1 
		</cfif>
		<cfif #event9# neq "none" and #event9# is "Orders with abstract files">
			AND a.title_id = f.title_id and a.e_status is null and (f.abstract_upload1 is not null OR f.abstract_upload2 is not null OR f.abstract_upload3 is not null) 
		</cfif>
		<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>

<cfif (#sellerreploanclosed# NEQ "NONE") and (#sellerreploanclosed# is "Seller Rep - Loan Closed")>
		AND a.appraisal_status = 'Loan Closed-Seller Rep'
		</cfif>

<cfif #sortorder# NEQ "NONE">
			ORDER BY #sortorder#
		<CFELSE>
			 ORDER BY  check_date 
		</cfif>
</cfquery>
	
	<CFSET r_count = #read_report.recordcount#>

<cfset list_of_ids = "">

	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
					
					<CFQUERY datasource="#request.dsn#" NAME="read_time">
		
			SELECT *
			FROM Title a, doc_title_insurance_title d
			WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and (a.cancelled is null or a.cancelled = 0)
</cfquery>
			<cfif read_time.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			</cfif>
			<cfif ListContainsNoCase(richmond_ids, read_time.comp_id, ",")>
			<cfset a_bgcolor="FF99FF">
			</cfif>
			<cfif ListFind(list_of_ids, #title_id#, ",") eq 0>
			<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
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
						#read_report.Company#</cfif>
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> 

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>		--->	

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> 
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>--->
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
								<!--- <cfif #read_time.recordcount# GT 0>
					
								Days:#DATEDIFF("d", read_time.check_date, read_time.a_recieved_date)#&nbsp;Hours:#DATEDIFF("h", read_time.check_time, read_time.a_recieved_time)#	
						</cfif> --->#DateFormat(read_report.a_date_completed, "m/d/yyyy")# #TimeFormat(read_report.a_time_completed, "HH:mm:ss")#</td>
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
						</td>

		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
	<cfset list_of_ids = ListAppend(list_of_ids, #title_id#, ",")>
    </cfif>
			
			
		</tr>	
	</CFOUTPUT>	</CFLOOP></CFLOOP>
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>

	
	<cfelseif #company_id# neq "none" and #state# eq "none">
	
	
		

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
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REO Num
						</td>
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
	<td bgcolor=gray width=201 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif (#datamerged# NEQ "NONE") and (#datamerged# is "Data Merged")>
						Date Merged<cfelse>
						Abstractor</cfif>
						</td>
						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> 

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>	--->		

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> 
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>--->
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
							Comments
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	<CFSET zip_id_2 = #ListToArray(company_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
	
	<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title a, doc_title_insurance_title d, tax_cert_title e, doc_abstract_title f, pay_off_lender_1_title g
			WHERE a.oda_year > 2005 and   a.title_id = d.title_id and a.title_id = e.title_id and a.title_id = f.title_id and a.title_id = g.title_id 	<cfif #comments# neq "none">
			<cfif #comments# is "Cancelled per client">
		and a.cancelled = 1 
		<cfelse> 
		and (a.cancelled is null or a.cancelled = 0)
		</cfif>
		<cfelse>
		and (a.cancelled is null or a.cancelled = 0)
		</cfif>
			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
	<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
	<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
	<cfif (#event1# NEQ "NONE") and (#event1# is "Abstracts Assigned")>
		and (f.a_Date_Assigned between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	<cfelseif (#event2# NEQ "NONE") and (#event2# is "Abstracts Received")>
		and (f.a_Date_completed between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	<cfelseif (#event5# NEQ "NONE") and (#event5# is "Title Ins completed")>
		and (d.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	<cfelseif (#datamerged# NEQ "NONE") and (#datamerged# is "Data Merged")>
		and (d.merge_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	<cfelseif (#event17# NEQ "NONE") and (#event17# is "Vendor note added")>
		and (f.vendor_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	<cfelseif (#event8# NEQ "NONE") and (#event8# is "Orders with abstract data")>
		and (f.abstract_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	<cfelseif (#event3# NEQ "NONE") and (#event3# is "Payoffs Ordered")>
		and (g.a_assigned_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	<cfelseif (#event4# NEQ "NONE") and (#event4# is "Payoffs Received")>
		and (g.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	<cfelseif (#event7# NEQ "NONE") and (#event7# is "Tax Data Completed")>
		and (e.a_date_finished between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	<cfif #appraisal_status# eq "In Typing">
		and (f.a_Date_completed between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	<cfelseif #appraisal_status# eq "Report E-mailed">
		and (d.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	<cfelse>  
		and (d.a_recieved_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	</cfif>
<cfelse>
	and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
</cfif>
</cfif>
<cfif #comments# neq "none">
			<cfif #comments# is "Call for Detail">
		and (e.call_detail = 1)</cfif>
		<cfif #comments# is "Cancelled per client">
		and (e.cancelled_client = 1)</cfif>
		<cfif #comments# is "Clear to Close">
		and (e.clear_close = 1)</cfif>
		<cfif #comments# is "Court House Closed">
		and (e.court_house = 1)</cfif>
		<cfif #comments# is "FT Shipped Pack">
		and (e.ft_shipped = 1)</cfif>
		<cfif #comments# is "Funds Not Received">
		and (e.funds_received = 1)</cfif>
		<cfif #comments# is "Judgments Exist">
		and (e.judge_exist = 1)</cfif>
		<cfif #comments# is "Name/Address found not matching order">
		and (e.name_address = 1)</cfif>
		<cfif #comments# is "Not Clear to Close">
		and (e.not_clear_close = 1)</cfif>
		<cfif #comments# is "OK to fund">
		and (e.ok_fund = 1)</cfif>
		<cfif #comments# is "Order Reinstated">
		and (e.order_reinstate = 1)</cfif>
		<cfif #comments# is "Package Received">
		and (e.package_recieve = 1)</cfif>
		<cfif #comments# is "Pre-Funding Completed">
		and (e.pre_funding = 1)</cfif>
		<cfif #comments# is "Package Due/Unrec.">
		and (e.package_due = 1)</cfif>
			<cfif #comments# is "Pre-Funding Problem">
		and (e.funding_prob = 1)</cfif>
		<cfif #comments# is "Subordination Needed">
		and (e.subordination_need = 1)</cfif>
		<cfif #comments# is "Subordination Received">
		and (e.subordination_received = 1)</cfif>
		<cfif #comments# is "Supervisor Notification">
		and (e.supervisor_notify = 1)</cfif>
		<cfif #comments# is "Unreleased Mortgages Exists">
		and (e.unreleased_mort = 1)</cfif>
		<cfif #comments# is "Vesting Issue">
		and (e.vesting_issue = 1)</cfif>
		<cfif #comments# is "Waiting on Judgment Info">
		and (e.waiting_judgment = 1)</cfif>
			<cfif #comments# is "Waiting on Tax Info.">
		and (e.waiting_tax = 1)</cfif>
		
		</cfif>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
		<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
		
				 <cfif #abstractor# NEQ "NONE">
and f.abstractor_id = '#abstractor#'
</cfif>
				<CFIF #title_id# NEQ "none">
				AND a.title_id = '#title_id#'
			</CFIF> 
			 
			<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
			
			 
			 <CFIF #company_id# NEQ "none">
				AND a.comp_id = '#cty_name_1[TTT]#'
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	  <cfif (#event10# NEQ "NONE") and (#event10# is "Abstracts Not Assigned")>
		and (a.title_id = f.title_id AND f.a_assigned_by is null)
		</cfif>
		<cfif (#event11# NEQ "NONE") and (#event11# is "Abstracts Not Received")>
		and (a.title_id = f.title_id AND f.a_recieved_by is null) 
		</cfif>
		
		<cfif (#event1# NEQ "NONE") and (#event1# is "Abstracts Assigned")>
		AND a.title_id = f.title_id AND f.a_assigned_by is not null 
		</cfif>
		<cfif (#event2# NEQ "NONE") and (#event2# is "Abstracts Received")>
		AND a.title_id = f.title_id AND f.a_recieved_by is not null 
		</cfif>
		
		
		<cfif (#event12# NEQ "NONE") and (#event12# is "Payoffs Not Ordered")>
		and (a.title_id = g.title_id AND g.a_assigned_by is null) 
		</cfif> 	
			<cfif (#event13# NEQ "NONE") and (#event13# is "Payoffs Not Received")>
		and (a.title_id = g.title_id AND g.a_recieved_by is null) 
		</cfif>	
			
			<cfif (#event3# NEQ "NONE") and (#event3# is "Payoffs Ordered")>
		AND a.title_id = g.title_id AND g.a_assigned_by is not null 
		</cfif> 	
			<cfif (#event4# NEQ "NONE") and (#event4# is "Payoffs Received")>
		AND a.title_id = g.title_id AND g.a_recieved_by is not null 
		</cfif>	
			
			<cfif (#clear_close# NEQ "NONE") and (#clear_close# is "Not Clear to Close")>
		and (a.title_id = d.title_id AND d.clear_close is null) 
		</cfif>
			<cfif (#event14# NEQ "NONE") and (#event14# is "Title Ins Uncompleted")>
		and (a.title_id = d.title_id AND d.s_status is null) 
		</cfif>
		
		<cfif (#event5# NEQ "NONE") and (#event5# is "Title Ins completed")>
		AND a.title_id = d.title_id AND d.s_status is not null 
		</cfif> 	
		
		 	
			<cfif (#event16# NEQ "NONE") and (#event16# is "Tax Data Not Completed")>
		and (a.title_id = e.title_id AND  e.taxes_completed <> 1) 
		</cfif>
	 <cfif (#event17# NEQ "NONE") and (#event17# is "Uncompleted ICL orders")>
	AND (a.request_icl = 'Yes' and a.icl_upload is null and a.icl_upload2 is null)
	 </cfif>
	 		<cfif (#event8# NEQ "NONE") and (#event8# is "Orders with abstract data")>
		AND a.title_id = f.title_id AND f.abstract_date is not null 
		</cfif>
		<cfif (#event17# NEQ "NONE") and (#event17# is "Vendor note added")>
		AND a.title_id = f.title_id AND f.vendor_date is not null 
		</cfif>
			<cfif (#datamerged# NEQ "NONE") and (#datamerged# is "Data Merged")>
		AND a.title_id = d.title_id AND d.merge_date is not null 
		</cfif>	<cfif (#datanotmerged# NEQ "NONE") and (#datanotmerged# is "Data Not Merged")>
		AND a.title_id = d.title_id AND d.merge_date is null 
		</cfif>
			<cfif (#event7# NEQ "NONE") and (#event7# is "Tax Data Completed")>
		AND a.title_id = e.title_id AND  e.taxes_completed = 1 
		</cfif>
		
		<cfif #event9# neq "none" and #event9# is "Orders with abstract files">
		AND a.title_id = f.title_id and a.e_status is null and (f.abstract_upload1 is not null OR f.abstract_upload2 is not null OR f.abstract_upload3 is not null) 
		</cfif>
		
		<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif>
	
	</cfquery>
	<CFSET r_count = #read_report.recordcount#>
			 <cfif #r_count# neq 0>
			 <CFQUERY datasource="#request.dsn#" NAME="read_comp">
						SELECT *
						FROM Companies 
						WHERE ID = #cty_name_1[TTT]#
			</CFQUERY>
			 <tr>
						
		

						<td bgcolor=#a_bgcolor# colspan = 8 width="100%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfoutput>#r_count# records found for #read_comp.company# </cfoutput>
						</td>
						
						</tr></cfif>
					
	<cfset list_of_ids = "">	


	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
<CFQUERY datasource="#request.dsn#" NAME="check_st">
			SELECT streamline_client 
			FROM companies
			WHERE ID = #read_report.comp_id# 
</cfquery>
					
					<CFQUERY datasource="#request.dsn#" NAME="read_time">
		
			SELECT *
			FROM Title a, doc_title_insurance_title d
			WHERE a.title_id = #title_id# and a.title_id = d.title_id and a.check_date is not null and a.check_time is not null and d.a_recieved_time is not null and d.a_recieved_date is not null and (a.cancelled is null or a.cancelled = 0)
</cfquery>
			<cfif read_time.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			</cfif>
			<cfif ListContainsNoCase(richmond_ids, read_time.comp_id, ",")>
			<cfset a_bgcolor="FF99FF">
			</cfif>
			<cfif ListFind(list_of_ids, #title_id#, ",") eq 0>
			<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif cgi.REMOTE_ADDR eq '98.233.100.254'><cfif check_st.streamline_client eq 'True'>S</cfif></cfif>T-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
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
						#read_report.Company#</cfif>
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> 

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>		--->	

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> 
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>--->
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
								<!--- <cfif #read_time.recordcount# GT 0>
					
								Days:#DATEDIFF("d", read_time.check_date, read_time.a_recieved_date)#&nbsp;Hours:#DATEDIFF("h", read_time.check_time, read_time.a_recieved_time)#	
						</cfif> --->#DateFormat(read_report.a_date_completed, "m/d/yyyy")# #TimeFormat(read_report.a_time_completed, "HH:mm:ss")#</td>
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
						</td>

		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
	
			<cfset list_of_ids = ListAppend(list_of_ids, #title_id#, ",")>
</cfif>
			
		</tr>	
	</CFOUTPUT>	</CFLOOP></CFLOOP>
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	</CFIF>
	<!--- eeeeeeeeeeeeeeeeeeeeeeeeennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnndddddddddddddd of titleeeeeeeeeeeeeeeeeeeeeeeeeee ---> 
	
	
	
	<cfelseif #a_trigger# eq "2">
	
	
	<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM property a, doc_title_insurance_prop d, tax_cert_prop e, doc_abstract_prop f
			WHERE a.oda_year > 2005 and  a.prop_id = d.prop_id and a.prop_id = e.prop_id and a.prop_id = f.prop_id
			and cancelled is null
			 
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				<CFIF #prop_id# NEQ "none">
				AND a.prop_id = '#prop_id#'
			</CFIF> 
			 
			 
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	  <cfif (#event10# NEQ "NONE") and (#event10# is "Abstracts Not Assigned")>
		and (a.prop_id = f.prop_id AND f.a_assigned_by is null)
		</cfif>
		<cfif (#event11# NEQ "NONE") and (#event11# is "Abstracts Not Received")>
		and (a.prop_id = f.prop_id AND f.a_recieved_by is null) 
		</cfif>
		
		<cfif (#event1# NEQ "NONE") and (#event1# is "Abstracts Assigned")>
		AND a.prop_id = f.prop_id AND f.a_assigned_by is not null 
		</cfif>
		<cfif (#event2# NEQ "NONE") and (#event2# is "Abstracts Received")>
		AND a.prop_id = f.prop_id AND f.a_recieved_by is not null 
		</cfif>
		
		
			<cfif (#event14# NEQ "NONE") and (#event14# is "Report Uncompleted")>
		and (a.prop_id = d.prop_id AND d.s_status is null) 
		</cfif>
		
		<cfif (#event5# NEQ "NONE") and (#event5# is "Report completed")>
		AND a.prop_id = d.prop_id AND d.s_status is not null 
		</cfif> 	
		
			
			<cfif (#event16# NEQ "NONE") and (#event16# is "Tax Data Not Completed")>
		and (a.prop_id = e.prop_id AND  e.taxes_completed <> 1) 
		</cfif>
	
	 	
			<cfif (#event7# NEQ "NONE") and (#event7# is "Tax Data Completed")>
		AND a.prop_id = e.prop_id AND  e.taxes_completed = 1 
		</cfif>
		
		<cfif #event9# neq "none" and #event9# is "Orders with abstract files">
		AND a.prop_id = f.prop_id and a.e_status is null and (f.abstract_upload1 is not null OR f.abstract_upload2 is not null OR f.abstract_upload3 is not null) 
		</cfif>
		<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  



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
			<td width=820 align=left valign=top bgcolor=purple>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Property</B></CENTER>
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
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REO Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
					

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	
	
	<cfset list_of_ids = "">
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
			<cfif read_report.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			<cfelse>
			<cfset a_bgcolor="d3d3d3">
			</cfif>
					<cfif ListFind(list_of_ids, #prop_id#, ",") eq 0>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							P-0232#prop_id#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_pro.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
						</td>

		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
	
			<cfset list_of_ids = ListAppend(list_of_ids, #title_id#, ",")>
</cfif>
			
		</tr>	
	</CFOUTPUT>	</CFLOOP>
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	<cfelseif #a_trigger# eq "5">

	<cfif #state# eq "none" and #company_id# eq "none">
	
	
<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title a, title_closing_order_request f, doc_closer_title g, eventlist e, tax_cert_title b, companies c
			WHERE a.oda_year > 2005 and   a.title_id = b.title_id and a.title_id = f.title_id and a.title_id = e.title_id and a.title_id = g.title_id
			and c.ID = a.comp_id
 <!--- AND f.a_Req_closing_month IS NOT NULL --->

	<cfif #comments# neq "none">
			<cfif #comments# is "Cancelled per client">
		and a.cancelled = 1 
		<cfelse> 
		and (a.cancelled is null or a.cancelled = 0)
		</cfif>
		<cfelse>
		and (a.cancelled is null or a.cancelled = 0)
		</cfif>
		


<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
      
					
			<cfif (#loanfun# NEQ "NONE") and (#loanfun# is "Loan Funded")>
			and (e.fl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			<cfelseif (#event8# NEQ "NONE") and (#event8# is "Loan Closed")>
			and (e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			
			<cfelseif (#loancloseorfun# NEQ "NONE") and (#loancloseorfun# is "Loan Closed OR Funded")>
			and ((e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#') OR (e.fl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#'))
			
			
			<cfelseif (#sellerreploanclosed# NEQ "NONE") and (#sellerreploanclosed# is "Seller Rep - Loan Closed")>
			and (e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#') and (a.appraisal_status = 'Loan Closed-Seller Rep')
			<cfelseif (#event19# NEQ "NONE") and (#event19# is "Loan Not Closed")>
			and ((e.cl_dateandtime  = '' or e.cl_dateandtime IS NULL) and e.yearmonth between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			<cfelseif (#event20# NEQ "NONE") and (#event20# is "Sales Call - Full Closing")>
			and (a.sales_call_full = 1)
			<cfelseif (#event21# NEQ "NONE") and (#event21# is "Sales Call - Seller Rep Only")>
			and (a.sales_call_seller_rep = 1)
<!--- 			<cfelseif (#subordination_needed# NEQ "NONE") and (#subordination_needed# is "Subordination Needed")>
			and (b.subordination_need = 1)
			<cfelseif (#subordination_not_received# NEQ "NONE") and (#subordination_not_received# is "Subordination NOT Received")>
			and (b.subordination_received <> 1)
 --->			<cfelseif (#event2# NEQ "NONE") and (#event2# is "Closing Info Submitted")>
			and (e.yearmonth between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			<cfelse>			
			and (f.request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			
			
			</cfif>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
				<cfif #comments# neq "none">
			<cfif #comments# is "Call for Detail">
		and (b.call_detail = 1)</cfif>
		<cfif #comments# is "Cancelled per client">
		and (b.cancelled_client = 1)</cfif>
		<cfif #comments# is "Clear to Close">
		and (b.clear_close = 1)</cfif>
		<cfif #comments# is "Court House Closed">
		and (b.court_house = 1)</cfif>
		<cfif #comments# is "FT Shipped Pack">
		and (b.ft_shipped = 1)</cfif>
		<cfif #comments# is "Funds Not Received">
		and (b.funds_received = 1)</cfif>
		<cfif #comments# is "Judgments Exist">
		and (b.judge_exist = 1)</cfif>
		<cfif #comments# is "Name/Address found not matching order">
		and (b.name_address = 1)</cfif>
		<cfif #comments# is "Not Clear to Close">
		and (b.not_clear_close = 1)</cfif>
		<cfif #comments# is "OK to fund">
		and (b.ok_fund = 1)</cfif>
		<cfif #comments# is "Order Reinstated">
		and (b.order_reinstate = 1)</cfif>
		<cfif #comments# is "Package Received">
		and (b.package_recieve = 1)</cfif>
		<cfif #comments# is "Pre-Funding Completed">
		and (e.pre_funding = 1)</cfif>
		<cfif #comments# is "Package Due/Unrec.">
		and (b.package_due = 1)</cfif>
		<cfif #comments# is "Pre-Funding Problem">
		and (b.funding_prob = 1)</cfif>
		<cfif #comments# is "Subordination Needed">
		and (b.subordination_need = 1)</cfif>
		<cfif #comments# is "Subordination Received">
		and (b.subordination_received = 1)</cfif>
		<cfif #comments# is "Supervisor Notification">
		and (b.supervisor_notify = 1)</cfif>
		<cfif #comments# is "Unreleased Mortgages Exists">
		and (b.unreleased_mort = 1)</cfif>
		<cfif #comments# is "Vesting Issue">
		and (b.vesting_issue = 1)</cfif>
		<cfif #comments# is "Waiting on Judgment Info">
		and (b.waiting_judgment = 1)</cfif>
			<cfif #comments# is "Waiting on Tax Info.">
		and (b.waiting_tax = 1)</cfif>
		
		</cfif>
			<CFIF #title_id# NEQ "none">
				AND a.title_id = '#title_id#'
			</CFIF> 
			 
			 <CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			</CFIF> 
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	<cfif (#instructions_received# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.closing_instructions is NOT null
		</cfif>	
		
		<cfif (#instructions_unreceived# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.closing_instructions is null
		</cfif>	
			<cfif (#final_hud_complete# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.final_hud is NOT null
		</cfif>	
		
		<cfif (#final_hud_uncomplete# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.final_hud is null
		</cfif>	
		
			<cfif (#event2# NEQ "NONE") and (#event2# is "Closing Info Submitted")>
		AND a.title_id = f.title_id AND a.title_id = e.title_id AND f.a_filled_out_date is NOT null AND e.c_day is not null
		</cfif>	
	 <cfif (#event7# NEQ "NONE") and (#event7# is "ddre Assigned")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null and g.a_assigned_by is NOT NULL 
		</cfif> 	
		<cfif (#event8# NEQ "NONE") and (#event8# is "Loan Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed'
		</cfif>
		<cfif (#sellerreploanclosed# NEQ "NONE") and (#sellerreploanclosed# is "Seller Rep - Loan Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed-Seller Rep'
		</cfif>
		<cfif (#event19# NEQ "NONE") and (#event19# is "Loan NOT Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status <> 'Loan Closed'
		</cfif>
		<cfif (#event20# NEQ "NONE") and (#event20# is "Sales Call - Full Closing")>
		AND a.title_id = f.title_id AND t.sales_call_full = 1
		</cfif>
		<cfif (#event21# NEQ "NONE") and (#event21# is "Sales Call - Seller Rep Only")>
		AND a.title_id = f.title_id AND t.sales_call_seller_rep = 1
		</cfif>
<!--- 		<cfif (#subordination_needed# NEQ "NONE") and (#subordination_needed# is "Subordination Needed")>
		AND a.title_id = f.title_id AND b.subordination_need = 1
		</cfif>
		<cfif (#subordination_not_received# NEQ "NONE") and (#subordination_not_received# is "Subordination NOT Received")>
		AND a.title_id = f.title_id AND b.subordination_received <> 1
		</cfif>
 --->		<cfif (#prefunding# NEQ "NONE") and (#prefunding# is "Pre-Funding Completed")>
		AND a.title_id = b.title_id AND b.pre_funding is not NULL
		</cfif>
		
		<cfif (#prenotfunding# NEQ "NONE") and (#prenotfunding# is "Pre-Funding Not Completed")>
		AND a.title_id = b.title_id AND b.pre_funding is NULL AND (a.appraisal_status = 'Loan Closed' or a.appraisal_status = 'Loan Funded')
		</cfif>
		
		<cfif (#loanfun# NEQ "NONE") and (#loanfun# is "Loan Funded")>
		AND a.title_id = e.title_id AND e.loanfun is NOT null
		</cfif>
		
		<cfif (#loancloseorfun# NEQ "NONE") and (#loancloseorfun# is "Loan Closed OR Funded")>
		AND a.title_id = e.title_id AND (e.loanfun is NOT null or (f.a_filled_out_date is NOT null AND (a.appraisal_status = 'Loan Closed' or a.appraisal_status = 'Loan Funded')))
		</cfif>
		
		<cfif (#loannotfun# NEQ "NONE") and (#loannotfun# is "Loan Not Funded")>
		AND a.title_id = e.title_id AND e.loanfun is null
		</cfif>
		<cfif (#event4# NEQ "NONE") and (#event4# is "Orders with closer data")>
		AND a.title_id = g.title_id AND g.closer_date is not null and a.e_status is null
		</cfif>
		<cfif (#mortrec# NEQ "NONE") and (#mortrec# is "Mortgage Recorded")>
		AND a.title_id = e.title_id AND e.mortrec is NOT null
		</cfif>
		<cfif (#mortnotrec# NEQ "NONE") and (#mortnotrec# is "Mortgage Not Recorded")>
		AND a.title_id = e.title_id AND e.mortrec is null
		</cfif>
		<cfif (#titlepol# NEQ "NONE") and (#titlepol# is "Title Policy Completed")>
		AND a.title_id = e.title_id AND e.titlepol is NOT null
		</cfif>
		<cfif (#titlenotpol# NEQ "NONE") and (#titlenotpol# is "Title Policy Uncompleted")>
		AND a.title_id = e.title_id AND e.titlepol is null
		</cfif>
	 <cfif (#event6# NEQ "NONE") and (#event6# is "Closer Not Assigned")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null and g.a_assigned_by is NULL 
		</cfif> 	
			<cfif (#event5# NEQ "NONE") and (#event5# is "Closing Info Not Submitted")>
		AND a.title_id = f.title_id AND a.title_id = e.title_id AND f.a_filled_out_date is NOT null AND e.c_day is null
		</cfif>	
		
		<cfif #event3# neq "none" and #event3# is "Orders with closer files">
		AND a.title_id = f.title_id and g.closer_upload is not null and a.e_status is null 
		</cfif>
		
		
		<cfif #packagenotreceived# neq "none" and #packagenotreceived# is "Package Not Received">
		AND a.title_id not in (Select order_id from Title_Notes where N_Note = 'Package Received')
		</cfif>
		
		<cfif #closingnotinvoiced# neq "none" and #closingnotinvoiced# is "Closing Not Invoiced">
		AND (a.closing_invoiced is null or a.closing_invoiced = 0)
		</cfif>
		<cfif #srclosingnotpaid# neq "none" and #srclosingnotpaid# is "Seller-Rep Closing Not Paid">
		AND (a.sr_closing_paid is null or a.sr_closing_paid = 0)
		</cfif>
		
		<cfif #mortgagerecordingissue# neq "none" and #mortgagerecordingissue# is "Mortgage Recording Issue">
		AND a.title_id in (Select order_id from Title_Notes where N_Note = 'Mortgage Recording Issue')
		AND a.title_id NOT in (Select order_id from Title_Notes where N_Note = 'Mortgage Recording Issue RESOLVED')
		</cfif>
		
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  c.streamline_client, request_date 
		</cfif> </CFQUERY>   




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
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for closings</B></CENTER>
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
						

						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Scheduled Date
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REO Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

				
						
								<td bgcolor=gray width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
						</td>
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Type
						</td>
						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Property Address
						</td>
						
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	<CFSET is_streamline = "no">

<cfset list_of_ids = "">	
<tr><td colspan=10>FIRST TITLE - RICHMOND</td></tr>
<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
			<cfif read_report.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			<cfelse>
			<cfset a_bgcolor="d3d3d3">
			</cfif>
			
			
	<CFQUERY datasource="#request.dsn#" NAME="read_closer_id">
		
			SELECT *
			FROM closer
			WHERE closer_id = '#closer_id#'
</cfquery>	
										<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		
			SELECT company, streamline_client
			FROM companies
			WHERE id = '#comp_id#'
</cfquery>	
<cfif ListContainsNoCase(richmond_ids, comp_id, ",") and ListGetAt(richmond_ids, ListContainsNoCase(richmond_ids, comp_id, ",") , ",") eq comp_id>
				<cfif ListFind(list_of_ids, #title_id#, ",") eq 0>
				<tr>
						
		
                       <td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #request_date# neq "">
							#DateFormat(read_report.request_date, "m/d/yyyy")# : #read_report.a_Req_Closing_Time#</cfif>
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> 

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			--->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						
						<td bgcolor=#a_bgcolor# width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_comp.company#</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
							<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
						</td>
						
						<td bgcolor=#a_bgcolor# width=30 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#SearchType#</font>
						</td>
						<td bgcolor=#a_bgcolor# width=100 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#paddress#, #pcity#, #pstate# #pzip#</font>
						</td>
						

		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
<cfset list_of_ids = ListAppend(list_of_ids, #title_id#, ",")>
</cfif>					
					
</cfif>	

	</CFOUTPUT>	</CFLOOP>

<tr><td colspan=10>FIRST TITLE</td></tr>
<cfset list_of_ids = "">
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
			<cfif read_report.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			<cfelse>
			<cfset a_bgcolor="d3d3d3">
			</cfif>
			
			
	<CFQUERY datasource="#request.dsn#" NAME="read_closer_id">
		
			SELECT *
			FROM closer
			WHERE closer_id = '#closer_id#'
</cfquery>	
										<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		
			SELECT company, streamline_client
			FROM companies
			WHERE id = '#comp_id#'
</cfquery>	

<cfif read_comp.streamline_client eq 'True' and is_streamline eq 'no'>
<tr><td colspan=10>STREAMLINE</td></tr>
<cfset is_streamline = 'yes'>
</cfif>
<cfif NOT ListContainsNoCase(richmond_ids, comp_id, ",") or (ListContainsNoCase(richmond_ids, comp_id, ",") and ListGetAt(richmond_ids, ListContainsNoCase(richmond_ids, comp_id, ",") , ",") neq comp_id)>
<cfif ListFind(list_of_ids, #title_id#, ",") eq 0>

				<tr>
						
		
                       <td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #request_date# neq "">
							#DateFormat(read_report.request_date, "m/d/yyyy")# : #read_report.a_Req_Closing_Time#</cfif>
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> 

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			--->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						
						<td bgcolor=#a_bgcolor# width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_comp.company#</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
							<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
						</td>
						
						<td bgcolor=#a_bgcolor# width=30 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#SearchType#</font>
						</td>
						<td bgcolor=#a_bgcolor# width=100 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#paddress#, #pcity#, #pstate# #pzip#</font>
						</td>
						

		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
<cfset list_of_ids = ListAppend(list_of_ids, #title_id#, ",")>
</cfif>					
</cfif>
	</CFOUTPUT>	</CFLOOP>
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	<cfelseif #state# neq "none" and #company_id# eq "none">
				

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
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for closings</B></CENTER>
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


							Requested Date
						</td>			
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REO Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

					
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Scheduled Date
						</td>
							<td bgcolor=gray width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
						</td>
						<td bgcolor=gray width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Address
						</td>

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	
	
		<CFSET zip_id_2 = #ListToArray(state, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">

<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, title_closing_order_request f, doc_closer_title g, eventlist e, tax_cert_title b
			WHERE a.oda_year > 2005 and   a.title_id = b.title_id and a.title_id = f.title_id and a.title_id = e.title_id and a.title_id = g.title_id AND f.a_Req_closing_month IS NOT NULL
	<cfif #comments# neq "none">
			<cfif #comments# is "Cancelled per client">
		and a.cancelled = 1 
		<cfelse> 
		and (a.cancelled is null or a.cancelled = 0)
		</cfif>
		<cfelse>
		and (a.cancelled is null or a.cancelled = 0)
		</cfif>
			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

		  				
			<cfif (#loanfun# NEQ "NONE") and (#loanfun# is "Loan Funded")>
			and (e.fl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			<cfelseif (#event8# NEQ "NONE") and (#event8# is "Loan Closed")>
			and (e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			<cfelseif (#loancloseorfun# NEQ "NONE") and (#loancloseorfun# is "Loan Closed OR Funded")>
			and ((e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#') OR (e.fl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#'))

			<cfelseif (#sellerreploanclosed# NEQ "NONE") and (#sellerreploanclosed# is "Seller Rep - Loan Closed")>
			and (e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#') and (a.appraisal_status = 'Loan Closed-Seller Rep')
			<cfelseif (#event19# NEQ "NONE") and (#event19# is "Loan NOT Closed")>
			and (e.cl_dateandtime  = '' or e.cl_dateandtime IS NULL)
			<cfelseif (#event20# NEQ "NONE") and (#event20# is "Sales Call - Full Closing")>
			and (a.sales_call_full = 1)
			<cfelseif (#event21# NEQ "NONE") and (#event21# is "Sales Call - Seller Rep Only")>
			and (a.sales_call_seller_rep = 1)
<!--- 		<cfelseif (#subordination_needed# NEQ "NONE") and (#subordination_needed# is "Subordination Needed")>
		AND a.title_id = f.title_id AND b.subordination_need = 1
		<cfelseif (#subordination_not_received# NEQ "NONE") and (#subordination_not_received# is "Subordination NOT Received")>
		AND a.title_id = f.title_id AND b.subordination_received <> 1
 --->			<cfelseif (#event2# NEQ "NONE") and (#event2# is "Closing Info Submitted")>
			and (e.yearmonth between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			<cfelse>			
			and (f.request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>		</cfif>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			<cfif #comments# neq "none">
			<cfif #comments# is "Call for Detail">
		and (b.call_detail = 1)</cfif>
		<cfif #comments# is "Cancelled per client">
		and (b.cancelled_client = 1)</cfif>
		<cfif #comments# is "Clear to Close">
		and (b.clear_close = 1)</cfif>
		<cfif #comments# is "Court House Closed">
		and (b.court_house = 1)</cfif>
		<cfif #comments# is "FT Shipped Pack">
		and (b.ft_shipped = 1)</cfif>
		<cfif #comments# is "Funds Not Received">
		and (b.funds_received = 1)</cfif>
		<cfif #comments# is "Judgments Exist">
		and (b.judge_exist = 1)</cfif>
		<cfif #comments# is "Name/Address found not matching order">
		and (b.name_address = 1)</cfif>
		<cfif #comments# is "Not Clear to Close">
		and (b.not_clear_close = 1)</cfif>
		<cfif #comments# is "OK to fund">
		and (b.ok_fund = 1)</cfif>
		<cfif #comments# is "Order Reinstated">
		and (b.order_reinstate = 1)</cfif>
		<cfif #comments# is "Package Received">
		and (b.package_recieve = 1)</cfif>
		<cfif #comments# is "Pre-Funding Completed">
		and (e.pre_funding = 1)</cfif>
		<cfif #comments# is "Package Due/Unrec.">
		and (b.package_due = 1)</cfif>
		<cfif #comments# is "Pre-Funding Problem">
		and (b.funding_prob = 1)</cfif>
		<cfif #comments# is "Subordination Needed">
		and (b.subordination_need = 1)</cfif>
		<cfif #comments# is "Subordination Received">
		and (b.subordination_received = 1)</cfif>
		<cfif #comments# is "Supervisor Notification">
		and (b.supervisor_notify = 1)</cfif>
		<cfif #comments# is "Unreleased Mortgages Exists">
		and (b.unreleased_mort = 1)</cfif>
		<cfif #comments# is "Vesting Issue">
		and (b.vesting_issue = 1)</cfif>
		<cfif #comments# is "Waiting on Judgment Info">
		and (b.waiting_judgment = 1)</cfif>
			<cfif #comments# is "Waiting on Tax Info.">
		and (b.waiting_tax = 1)</cfif>
		
		</cfif>
				<cfif (#instructions_received# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.closing_instructions is NOT null
		</cfif>	
		
		<cfif (#instructions_unreceived# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.closing_instructions is null
		</cfif>	
			<cfif (#final_hud_complete# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.final_hud is NOT null
		</cfif>	
		
		<cfif (#final_hud_uncomplete# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.final_hud is null
		</cfif>	
		
				<CFIF #title_id# NEQ "none">
				AND a.title_id = '#title_id#'
			</CFIF> 
			 
			 <CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			</CFIF> 
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	
			<cfif (#event2# NEQ "NONE") and (#event2# is "Closing Info Submitted")>
		AND a.title_id = f.title_id AND a.title_id = e.title_id AND f.a_filled_out_date is NOT null AND e.c_day is not null
		</cfif>	
	 <cfif (#event7# NEQ "NONE") and (#event7# is "Closer Assigned")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null and g.a_assigned_by is NOT NULL 
		</cfif> 	
		<cfif (#event8# NEQ "NONE") and (#event8# is "Loan Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed'
		</cfif>
		<cfif (#sellerreploanclosed# NEQ "NONE") and (#sellerreploanclosed# is "Seller Rep - Loan Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed-Seller Rep'
		</cfif>
		<cfif (#event19# NEQ "NONE") and (#event19# is "Loan NOT Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status <> 'Loan Closed'
		</cfif>
		<cfif (#event20# NEQ "NONE") and (#event20# is "Sales Call - Full Closing")>
		AND a.title_id = f.title_id AND t.sales_call_full = 1
		</cfif>
		<cfif (#event21# NEQ "NONE") and (#event21# is "Sales Call - Seller Rep Only")>
		AND a.title_id = f.title_id AND t.sales_call_seller_rep = 1
		</cfif>
	<!--- 	<cfif (#subordination_needed# NEQ "NONE") and (#subordination_needed# is "Subordination Needed")>
		AND a.title_id = f.title_id AND b.subordination_need = 1
		</cfif>
		<cfif (#subordination_not_received# NEQ "NONE") and (#subordination_not_received# is "Subordination NOT Received")>
		AND a.title_id = f.title_id AND b.subordination_received <> 1
		</cfif>
 --->		<cfif (#loanfun# NEQ "NONE") and (#loanfun# is "Loan Funded")>
		AND a.title_id = e.title_id AND e.loanfun is NOT null
		</cfif>
		<cfif (#loancloseorfun# NEQ "NONE") and (#loancloseorfun# is "Loan Closed OR Funded")>
		AND a.title_id = e.title_id AND (e.loanfun is NOT null or (f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed'))
		</cfif>
		<cfif (#prefunding# NEQ "NONE") and (#prefunding# is "Pre-Funding Completed")>
		AND a.title_id = b.title_id AND b.pre_funding is not NULL
		</cfif>
		
		<cfif (#prenotfunding# NEQ "NONE") and (#prenotfunding# is "Pre-Funding Not Completed")>
		AND a.title_id = b.title_id AND b.pre_funding is NULL AND (a.appraisal_status = 'Loan Closed' or a.appraisal_status = 'Loan Funded')
		</cfif>
		<cfif (#loannotfun# NEQ "NONE") and (#loannotfun# is "Loan Not Funded")>
		AND a.title_id = e.title_id AND e.loanfun is null
		</cfif>
		<cfif (#mortrec# NEQ "NONE") and (#mortrec# is "Mortgage Recorded")>
		AND a.title_id = e.title_id AND e.mortrec is NOT null
		</cfif>
		<cfif (#mortnotrec# NEQ "NONE") and (#mortnotrec# is "Mortgage Not Recorded")>
		AND a.title_id = e.title_id AND e.mortrec is null
		</cfif>
			<cfif (#titlepol# NEQ "NONE") and (#titlepol# is "Title Policy Completed")>
		AND a.title_id = e.title_id AND e.titlepol is NOT null
		</cfif>
		<cfif (#titlenotpol# NEQ "NONE") and (#titlenotpol# is "Title Policy Uncompleted")>
		AND a.title_id = e.title_id AND e.titlepol is null
		</cfif>
	 <cfif (#event6# NEQ "NONE") and (#event6# is "Closer Not Assigned")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null and g.a_assigned_by is NULL 
		</cfif> 	
			<cfif (#event5# NEQ "NONE") and (#event5# is "Closing Info Not Submitted")>
		AND a.title_id = f.title_id AND a.title_id = e.title_id AND f.a_filled_out_date is NOT null AND e.c_day is null
		</cfif>	
		<cfif (#event4# NEQ "NONE") and (#event4# is "Orders with closer data")>
		AND a.title_id = g.title_id AND g.closer_date is not null and a.e_status is null
		</cfif>
		<cfif #event3# neq "none" and #event3# is "Orders with closer files">
		AND a.title_id = f.title_id and g.closer_upload is not null and a.e_status is null 
		</cfif>
		
		
		<cfif #packagenotreceived# neq "none" and #packagenotreceived# is "Package Not Received">
		AND a.title_id not in (Select order_id from Title_Notes where N_Note = 'Package Received')
		</cfif>
		
		<cfif #closingnotinvoiced# neq "none" and #closingnotinvoiced# is "Closing Not Invoiced">
		AND (a.closing_invoiced is null or a.closing_invoiced = 0)
		</cfif>
		
		<cfif #srclosingnotpaid# neq "none" and #srclosingnotpaid# is "Seller-Rep Closing Not Paid">
		AND (a.sr_closing_paid is null or a.sr_closing_paid = 0)
		</cfif>

		<cfif #mortgagerecordingissue# neq "none" and #mortgagerecordingissue# is "Mortgage Recording Issue">
		AND a.title_id in (Select order_id from Title_Notes where N_Note = 'Mortgage Recording Issue')
		AND a.title_id NOT in (Select order_id from Title_Notes where N_Note = 'Mortgage Recording Issue RESOLVED')
		</cfif>
		
		<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  request_date
		</cfif> </CFQUERY> 
	
<cfset list_of_ids = "">

	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
	
	
	<cfif read_report.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			<cfelse>
			<cfset a_bgcolor="d3d3d3">
			</cfif>
			
			
			<CFQUERY datasource="#request.dsn#" NAME="read_closer_id">
		
			SELECT *
			FROM closer
			WHERE closer_id = '#closer_id#'
</cfquery>		
					<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		
			SELECT company
			FROM companies
			WHERE id = '#comp_id#'
</cfquery>				
					<cfif ListFind(list_of_ids, #title_id#, ",") eq 0>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(request_date, "m/d/yyyy")# : #read_report.a_Req_Closing_Time#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> 

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			--->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(yearmonth, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_comp.company#</td>
						<td bgcolor=#a_bgcolor# width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.paddress#, #read_report.pcity#<BR>#read_report.pstate# #read_report.pzip#<!--- #read_closer_id.company# ---></td>
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
<cfset list_of_ids = ListAppend(list_of_ids, #title_id#, ",")>
</cfif>					
	</CFOUTPUT>	</CFLOOP></CFLOOP> 
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	<cfelseif #company_id# neq "none" and #state# eq "none">
	

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
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for closings</B></CENTER>
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
							Requested Date
						</td>			
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REO Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

			
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Scheduled Date
						</td>
							<td bgcolor=gray width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
						</td>
						<td bgcolor=gray width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Address
						</td>

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	
	
		<CFSET zip_id_2 = #ListToArray(company_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">

<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title a, title_closing_order_request f, doc_closer_title g, eventlist e, tax_cert_title b
			WHERE a.oda_year > 2005 and   a.title_id = b.title_id and a.title_id = f.title_id and a.title_id = e.title_id and a.title_id = g.title_id AND f.a_Req_closing_month IS NOT NULL
	<cfif #comments# neq "none">
			<cfif #comments# is "Cancelled per client">
		and a.cancelled = 1 
		<cfelse> 
		and (a.cancelled is null or a.cancelled = 0)
		</cfif>
		<cfelse>
		and (a.cancelled is null or a.cancelled = 0)
		</cfif>

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

		     				
			<cfif (#loanfun# NEQ "NONE") and (#loanfun# is "Loan Funded")>
			and (e.fl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			<cfelseif (#event8# NEQ "NONE") and (#event8# is "Loan Closed")>
			and (e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			
			<cfelseif (#loancloseorfun# NEQ "NONE") and (#loancloseorfun# is "Loan Closed OR Funded")>
			and ((e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#') OR (e.fl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#'))

			<cfelseif (#sellerreploanclosed# NEQ "NONE") and (#sellerreploanclosed# is "Seller Rep - Loan Closed")>

			and (e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#') and (a.appraisal_status = 'Loan Closed-Seller Rep')
			<cfelseif (#event19# NEQ "NONE") and (#event19# is "Loan NOT Closed")>
			and (e.cl_dateandtime = '' or e.cl_dateandtime IS NULL)
			<cfelseif (#event20# NEQ "NONE") and (#event20# is "Sales Call - Full Closing")>
			and (a.sales_call_full = 1)
			<cfelseif (#event21# NEQ "NONE") and (#event21# is "Sales Call - Seller Rep Only")>
			and (a.sales_call_seller_rep = 1)

<!--- 		<cfelseif (#subordination_needed# NEQ "NONE") and (#subordination_needed# is "Subordination Needed")>
		AND b.subordination_need = 1

		<cfelseif (#subordination_not_received# NEQ "NONE") and (#subordination_not_received# is "Subordination NOT Received")>
		AND b.subordination_received <> 1
 --->


			<cfelseif (#event2# NEQ "NONE") and (#event2# is "Closing Info Submitted")>
			and (e.yearmonth between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			<cfelse>			
			and (f.request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif></cfif>
			
			<cfif #comments# neq "none">
			<cfif #comments# is "Call for Detail">
		and (b.call_detail = 1)</cfif>
		<cfif #comments# is "Cancelled per client">
		and (b.cancelled_client = 1)</cfif>
		<cfif #comments# is "Clear to Close">
		and (b.clear_close = 1)</cfif>
		<cfif #comments# is "Court House Closed">
		and (b.court_house = 1)</cfif>
		<cfif #comments# is "FT Shipped Pack">
		and (b.ft_shipped = 1)</cfif>
		<cfif #comments# is "Funds Not Received">
		and (b.funds_received = 1)</cfif>
		<cfif #comments# is "Judgments Exist">
		and (b.judge_exist = 1)</cfif>
		<cfif #comments# is "Name/Address found not matching order">
		and (b.name_address = 1)</cfif>
		<cfif #comments# is "Not Clear to Close">
		and (b.not_clear_close = 1)</cfif>
		<cfif #comments# is "OK to fund">
		and (b.ok_fund = 1)</cfif>
		<cfif #comments# is "Order Reinstated">
		and (b.order_reinstate = 1)</cfif>
		<cfif #comments# is "Package Received">
		and (b.package_recieve = 1)</cfif>
		<cfif #comments# is "Pre-Funding Completed">
		and (e.pre_funding = 1)</cfif>
		<cfif #comments# is "Package Due/Unrec.">
		and (b.package_due = 1)</cfif>
		<cfif #comments# is "Pre-Funding Problem">
		and (b.funding_prob = 1)</cfif>
		<cfif #comments# is "Subordination Needed">
		and (b.subordination_need = 1)</cfif>
		<cfif #comments# is "Subordination Received">
		and (b.subordination_received = 1)</cfif>
		<cfif #comments# is "Supervisor Notification">
		and (b.supervisor_notify = 1)</cfif>
		<cfif #comments# is "Unreleased Mortgages Exists">
		and (b.unreleased_mort = 1)</cfif>
		<cfif #comments# is "Vesting Issue">
		and (b.vesting_issue = 1)</cfif>
		<cfif #comments# is "Waiting on Judgment Info">
		and (b.waiting_judgment = 1)</cfif>
			<cfif #comments# is "Waiting on Tax Info.">
		and (b.waiting_tax = 1)</cfif>
		
		</cfif>  
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
				<cfif (#instructions_received# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.closing_instructions is NOT null
		</cfif>	
		
		<cfif (#instructions_unreceived# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.closing_instructions is null
		</cfif>	
			<cfif (#final_hud_complete# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.final_hud is NOT null
		</cfif>	
		
		<cfif (#final_hud_uncomplete# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.final_hud is null
		</cfif>	
		
				<CFIF #title_id# NEQ "none">
				AND a.title_id = '#title_id#'
			</CFIF> 
			 
			 <CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			</CFIF> 
			 
             <CFIF #read_user.role_id# neq 24>
			    <CFIF #company_id# NEQ "none">
				    AND a.comp_id = '#cty_name_1[TTT]#'
			    </CFIF>
             </CFIF>    
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	
			<cfif (#event2# NEQ "NONE") and (#event2# is "Closing Info Submitted")>
		AND a.title_id = f.title_id AND a.title_id = e.title_id AND f.a_filled_out_date is NOT null AND e.c_day is not null
		</cfif>	
	 <cfif (#event7# NEQ "NONE") and (#event7# is "Closer Assigned")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null and g.a_assigned_by is NOT NULL 
		</cfif> 	
		<cfif (#event8# NEQ "NONE") and (#event8# is "Loan Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed'
		</cfif>
		<cfif (#sellerreploanclosed# NEQ "NONE") and (#sellerreploanclosed# is "Seller Rep - Loan Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed-Seller Rep'
		</cfif>
		<cfif (#event19# NEQ "NONE") and (#event19# is "Loan NOT Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status <> 'Loan Closed'
		</cfif>
		<cfif (#event20# NEQ "NONE") and (#event20# is "Sales Call - Full Closing")>
		AND a.title_id = f.title_id AND t.sales_call_full = 1
		</cfif>
		<cfif (#event21# NEQ "NONE") and (#event21# is "Sales Call - Seller Rep Only")>
		AND a.title_id = f.title_id AND t.sales_call_seller_rep = 1
		</cfif>
<!--- 		<cfif (#subordination_needed# NEQ "NONE") and (#subordination_needed# is "Subordination Needed")>
		AND a.title_id = f.title_id AND b.subordination_need = 1
		</cfif>
		<cfif (#subordination_not_received# NEQ "NONE") and (#subordination_not_received# is "Subordination NOT Received")>
		AND a.title_id = f.title_id AND b.subordination_received <> 1
		</cfif>
 --->		<cfif (#loanfun# NEQ "NONE") and (#loanfun# is "Loan Funded")>
		AND a.title_id = e.title_id AND e.loanfun is NOT null
		</cfif>
<cfif (#loancloseorfun# NEQ "NONE") and (#loancloseorfun# is "Loan Closed OR Funded")>
		AND a.title_id = e.title_id AND (e.loanfun is NOT null or (f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed'))
		</cfif>
		<cfif (#loannotfun# NEQ "NONE") and (#loannotfun# is "Loan Not Funded")>
		AND a.title_id = e.title_id AND e.loanfun is null
		</cfif>
		<cfif (#prefunding# NEQ "NONE") and (#prefunding# is "Pre-Funding Completed")>
		AND a.title_id = b.title_id AND b.pre_funding is not NULL
		</cfif>
		
		<cfif (#prenotfunding# NEQ "NONE") and (#prenotfunding# is "Pre-Funding Not Completed")>
		AND a.title_id = b.title_id AND b.pre_funding is NULL AND (a.appraisal_status = 'Loan Closed' or a.appraisal_status = 'Loan Funded')
		</cfif>
		<cfif (#mortrec# NEQ "NONE") and (#mortrec# is "Mortgage Recorded")>
		AND a.title_id = e.title_id AND e.mortrec is NOT null
		</cfif>
		<cfif (#mortnotrec# NEQ "NONE") and (#mortnotrec# is "Mortgage Not Recorded")>
		AND a.title_id = e.title_id AND e.mortrec is null
		</cfif>
			<cfif (#titlepol# NEQ "NONE") and (#titlepol# is "Title Policy Completed")>
		AND a.title_id = e.title_id AND e.titlepol is NOT null
		</cfif>
		<cfif (#titlenotpol# NEQ "NONE") and (#titlenotpol# is "Title Policy Uncompleted")>
		AND a.title_id = e.title_id AND e.titlepol is null
		</cfif>
	 <cfif (#event6# NEQ "NONE") and (#event6# is "Closer Not Assigned")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null and g.a_assigned_by is NULL 
		</cfif> 	
			<cfif (#event5# NEQ "NONE") and (#event5# is "Closing Info Not Submitted")>
		AND a.title_id = f.title_id AND a.title_id = e.title_id AND f.a_filled_out_date is NOT null AND e.c_day is null
		</cfif>	
		<cfif (#event4# NEQ "NONE") and (#event4# is "Orders with closer data")>
		AND a.title_id = g.title_id AND g.closer_date is not null and a.e_status is null
		</cfif>
		<cfif #event3# neq "none" and #event3# is "Orders with closer files">
		AND a.title_id = f.title_id and g.closer_upload is not null and a.e_status is null 
		</cfif>
		
		<cfif #packagenotreceived# neq "none" and #packagenotreceived# is "Package Not Received">
		AND a.title_id not in (Select order_id from Title_Notes where N_Note = 'Package Received')
		</cfif>
		
		<cfif #closingnotinvoiced# neq "none" and #closingnotinvoiced# is "Closing Not Invoiced">
		AND (a.closing_invoiced is null or a.closing_invoiced = 0)
		</cfif>
		<cfif #srclosingnotpaid# neq "none" and #srclosingnotpaid# is "Seller-Rep Closing Not Closed">
		AND (a.sr_closing_paid is null or a.sr_closing_paid = 0)
		</cfif>
		
		<cfif #mortgagerecordingissue# neq "none" and #mortgagerecordingissue# is "Mortgage Recording Issue">
		AND a.title_id in (Select order_id from Title_Notes where N_Note = 'Mortgage Recording Issue')
		AND a.title_id NOT in (Select order_id from Title_Notes where N_Note = 'Mortgage Recording Issue RESOLVED')
		</cfif>
		
		<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  request_date
		</cfif> </CFQUERY> 
	
<cfset list_of_ids = "">

<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
	<cfif read_report.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			<cfelse>
			<cfset a_bgcolor="d3d3d3">
			</cfif>
			
			
			<CFQUERY datasource="#request.dsn#" NAME="read_closer_id">
		
			SELECT *
			FROM closer
			WHERE closer_id = '#closer_id#'
</cfquery>		
						<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		
			SELECT company
			FROM companies
			WHERE id = '#comp_id#'
</cfquery>	
					<cfif ListFind(list_of_ids, #title_id#, ",") eq 0>	

<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(request_date, "m/d/yyyy")# : #read_report.a_Req_Closing_Time#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> 

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			--->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(yearmonth, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_comp.company#</td>
						<td bgcolor=#a_bgcolor# width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.paddress#, #read_report.pcity#<BR>#read_report.pstate# #read_report.pzip#<!--- #read_closer_id.company# ---></td>
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
<cfset list_of_ids = ListAppend(list_of_ids, #title_id#, ",")>
</cfif>
	</CFOUTPUT>	</CFLOOP></CFLOOP> 
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
		<cfelseif #company_id# neq "none" and #state# neq "none">
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
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for closings</B></CENTER>
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
							Requested Date
						</td>			
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REO Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

			
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Scheduled Date
						</td>
							<td bgcolor=gray width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
						</td>
						<td bgcolor=gray width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Address
						</td>

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	
	
		<CFSET zip_id_2 = #ListToArray(company_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>


<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title a, title_closing_order_request f, doc_closer_title g, eventlist e, tax_cert_title b
			WHERE a.oda_year > 2005 and   a.title_id = b.title_id and a.title_id = f.title_id and a.title_id = e.title_id and a.title_id = g.title_id AND f.a_Req_closing_month IS NOT NULL
	<cfif #comments# neq "none">
			<cfif #comments# is "Cancelled per client">
		and a.cancelled = 1 
		<cfelse> 
		and (a.cancelled is null or a.cancelled = 0)
		</cfif>
		<cfelse>
		and (a.cancelled is null or a.cancelled = 0)
		</cfif>

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

		     				
			<cfif (#loanfun# NEQ "NONE") and (#loanfun# is "Loan Funded")>
			and (e.fl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			<cfelseif (#event8# NEQ "NONE") and (#event8# is "Loan Closed")>
			and (e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			
			<cfelseif (#loancloseorfun# NEQ "NONE") and (#loancloseorfun# is "Loan Closed OR Funded")>
			and ((e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#') OR (e.fl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#'))

			<cfelseif (#sellerreploanclosed# NEQ "NONE") and (#sellerreploanclosed# is "Seller Rep - Loan Closed")>

			and (e.cl_dateandtime between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#') and (a.appraisal_status = 'Loan Closed-Seller Rep')
			<cfelseif (#event19# NEQ "NONE") and (#event19# is "Loan NOT Closed")>
			and (e.cl_dateandtime = '' or e.cl_dateandtime IS NULL)
			<cfelseif (#event20# NEQ "NONE") and (#event20# is "Sales Call - Full Closing")>
			and (a.sales_call_full = 1)
			<cfelseif (#event21# NEQ "NONE") and (#event21# is "Sales Call - Seller Rep Only")>
			and (a.sales_call_seller_rep = 1)

<!--- 		<cfelseif (#subordination_needed# NEQ "NONE") and (#subordination_needed# is "Subordination Needed")>
		AND b.subordination_need = 1

		<cfelseif (#subordination_not_received# NEQ "NONE") and (#subordination_not_received# is "Subordination NOT Received")>
		AND b.subordination_received <> 1
 --->


			<cfelseif (#event2# NEQ "NONE") and (#event2# is "Closing Info Submitted")>
			and (e.yearmonth between '#DateFormat(YearMon, "yyyy-mm-dd")# #TimeFormat(YearMon, "HH:mm:ss")#' AND '#DateFormat(YearMonto, "yyyy-mm-dd")# #TimeFormat(YearMonto, "HH:mm:ss")#')
			<cfelse>			
			and (f.request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif></cfif>
			
			<cfif #comments# neq "none">
			<cfif #comments# is "Call for Detail">
		and (b.call_detail = 1)</cfif>
		<cfif #comments# is "Cancelled per client">
		and (b.cancelled_client = 1)</cfif>
		<cfif #comments# is "Clear to Close">
		and (b.clear_close = 1)</cfif>
		<cfif #comments# is "Court House Closed">
		and (b.court_house = 1)</cfif>
		<cfif #comments# is "FT Shipped Pack">
		and (b.ft_shipped = 1)</cfif>
		<cfif #comments# is "Funds Not Received">
		and (b.funds_received = 1)</cfif>
		<cfif #comments# is "Judgments Exist">
		and (b.judge_exist = 1)</cfif>
		<cfif #comments# is "Name/Address found not matching order">
		and (b.name_address = 1)</cfif>
		<cfif #comments# is "Not Clear to Close">
		and (b.not_clear_close = 1)</cfif>
		<cfif #comments# is "OK to fund">
		and (b.ok_fund = 1)</cfif>
		<cfif #comments# is "Order Reinstated">
		and (b.order_reinstate = 1)</cfif>
		<cfif #comments# is "Package Received">
		and (b.package_recieve = 1)</cfif>
		<cfif #comments# is "Pre-Funding Completed">
		and (e.pre_funding = 1)</cfif>
		<cfif #comments# is "Package Due/Unrec.">
		and (b.package_due = 1)</cfif>
		<cfif #comments# is "Pre-Funding Problem">
		and (b.funding_prob = 1)</cfif>
		<cfif #comments# is "Subordination Needed">
		and (b.subordination_need = 1)</cfif>
		<cfif #comments# is "Subordination Received">
		and (b.subordination_received = 1)</cfif>
		<cfif #comments# is "Supervisor Notification">
		and (b.supervisor_notify = 1)</cfif>
		<cfif #comments# is "Unreleased Mortgages Exists">
		and (b.unreleased_mort = 1)</cfif>
		<cfif #comments# is "Vesting Issue">
		and (b.vesting_issue = 1)</cfif>
		<cfif #comments# is "Waiting on Judgment Info">
		and (b.waiting_judgment = 1)</cfif>
			<cfif #comments# is "Waiting on Tax Info.">
		and (b.waiting_tax = 1)</cfif>
		
		</cfif>  
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
				<cfif (#instructions_received# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.closing_instructions is NOT null
		</cfif>	
		
		<cfif (#instructions_unreceived# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.closing_instructions is null
		</cfif>	
			<cfif (#final_hud_complete# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.final_hud is NOT null
		</cfif>	
		
		<cfif (#final_hud_uncomplete# NEQ "NONE")>
		AND a.title_id = g.title_id AND g.final_hud is null
		</cfif>	
		
				<CFIF #title_id# NEQ "none">
				AND a.title_id = '#title_id#'
			</CFIF> 
			 
			 <CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			</CFIF> 
			 
             <CFIF #read_user.role_id# neq 24>
			    <CFIF #company_id# NEQ "none">
				    AND a.comp_id IN (#company_id#)
			    </CFIF>
             </CFIF>    
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	
			<cfif (#event2# NEQ "NONE") and (#event2# is "Closing Info Submitted")>
		AND a.title_id = f.title_id AND a.title_id = e.title_id AND f.a_filled_out_date is NOT null AND e.c_day is not null
		</cfif>	
	 <cfif (#event7# NEQ "NONE") and (#event7# is "Closer Assigned")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null and g.a_assigned_by is NOT NULL 
		</cfif> 	
		<cfif (#event8# NEQ "NONE") and (#event8# is "Loan Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed'
		</cfif>
		<cfif (#sellerreploanclosed# NEQ "NONE") and (#sellerreploanclosed# is "Seller Rep - Loan Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed-Seller Rep'
		</cfif>
		<cfif (#event19# NEQ "NONE") and (#event19# is "Loan NOT Closed")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null AND a.appraisal_status <> 'Loan Closed'
		</cfif>
		<cfif (#event20# NEQ "NONE") and (#event20# is "Sales Call - Full Closing")>
		AND a.title_id = f.title_id AND t.sales_call_full = 1
		</cfif>
		<cfif (#event21# NEQ "NONE") and (#event21# is "Sales Call - Seller Rep Only")>
		AND a.title_id = f.title_id AND t.sales_call_seller_rep = 1
		</cfif>
<!--- 		<cfif (#subordination_needed# NEQ "NONE") and (#subordination_needed# is "Subordination Needed")>
		AND a.title_id = f.title_id AND b.subordination_need = 1
		</cfif>
		<cfif (#subordination_not_received# NEQ "NONE") and (#subordination_not_received# is "Subordination NOT Received")>
		AND a.title_id = f.title_id AND b.subordination_received <> 1
		</cfif>
 --->		<cfif (#loanfun# NEQ "NONE") and (#loanfun# is "Loan Funded")>
		AND a.title_id = e.title_id AND e.loanfun is NOT null
		</cfif>
<cfif (#loancloseorfun# NEQ "NONE") and (#loancloseorfun# is "Loan Closed OR Funded")>
		AND a.title_id = e.title_id AND (e.loanfun is NOT null or (f.a_filled_out_date is NOT null AND a.appraisal_status = 'Loan Closed'))
		</cfif>
		<cfif (#loannotfun# NEQ "NONE") and (#loannotfun# is "Loan Not Funded")>
		AND a.title_id = e.title_id AND e.loanfun is null
		</cfif>
		<cfif (#prefunding# NEQ "NONE") and (#prefunding# is "Pre-Funding Completed")>
		AND a.title_id = b.title_id AND b.pre_funding is not NULL
		</cfif>
		
		<cfif (#prenotfunding# NEQ "NONE") and (#prenotfunding# is "Pre-Funding Not Completed")>
		AND a.title_id = b.title_id AND b.pre_funding is NULL AND (a.appraisal_status = 'Loan Closed' or a.appraisal_status = 'Loan Funded')
		</cfif>
		<cfif (#mortrec# NEQ "NONE") and (#mortrec# is "Mortgage Recorded")>
		AND a.title_id = e.title_id AND e.mortrec is NOT null
		</cfif>
		<cfif (#mortnotrec# NEQ "NONE") and (#mortnotrec# is "Mortgage Not Recorded")>
		AND a.title_id = e.title_id AND e.mortrec is null
		</cfif>
			<cfif (#titlepol# NEQ "NONE") and (#titlepol# is "Title Policy Completed")>
		AND a.title_id = e.title_id AND e.titlepol is NOT null
		</cfif>
		<cfif (#titlenotpol# NEQ "NONE") and (#titlenotpol# is "Title Policy Uncompleted")>
		AND a.title_id = e.title_id AND e.titlepol is null
		</cfif>
	 <cfif (#event6# NEQ "NONE") and (#event6# is "Closer Not Assigned")>
		AND a.title_id = f.title_id AND f.a_filled_out_date is NOT null and g.a_assigned_by is NULL 
		</cfif> 	
			<cfif (#event5# NEQ "NONE") and (#event5# is "Closing Info Not Submitted")>
		AND a.title_id = f.title_id AND a.title_id = e.title_id AND f.a_filled_out_date is NOT null AND e.c_day is null
		</cfif>	
		<cfif (#event4# NEQ "NONE") and (#event4# is "Orders with closer data")>
		AND a.title_id = g.title_id AND g.closer_date is not null and a.e_status is null
		</cfif>
		<cfif #event3# neq "none" and #event3# is "Orders with closer files">
		AND a.title_id = f.title_id and g.closer_upload is not null and a.e_status is null 
		</cfif>
		
		<cfif #packagenotreceived# neq "none" and #packagenotreceived# is "Package Not Received">
		AND a.title_id not in (Select order_id from Title_Notes where N_Note = 'Package Received')
		</cfif>
		
		<cfif #closingnotinvoiced# neq "none" and #closingnotinvoiced# is "Closing Not Invoiced">
		AND (a.closing_invoiced is null or a.closing_invoiced = 0)
		</cfif>
		<cfif #srclosingnotpaid# neq "none" and #srclosingnotpaid# is "Seller-Rep Closing Not Closed">
		AND (a.sr_closing_paid is null or a.sr_closing_paid = 0)
		</cfif>
		
		<cfif #mortgagerecordingissue# neq "none" and #mortgagerecordingissue# is "Mortgage Recording Issue">
		AND a.title_id in (Select order_id from Title_Notes where N_Note = 'Mortgage Recording Issue')
		AND a.title_id NOT in (Select order_id from Title_Notes where N_Note = 'Mortgage Recording Issue RESOLVED')
		</cfif>
		
		<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  request_date
		</cfif> </CFQUERY> 
	
<cfset list_of_ids = "">

<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
	<cfif read_report.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			<cfelse>
			<cfset a_bgcolor="d3d3d3">
			</cfif>
			
			
			<CFQUERY datasource="#request.dsn#" NAME="read_closer_id">
		
			SELECT *
			FROM closer
			WHERE closer_id = '#closer_id#'
</cfquery>		
						<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		
			SELECT company
			FROM companies
			WHERE id = '#comp_id#'
</cfquery>	
					<cfif ListFind(list_of_ids, #title_id#, ",") eq 0>	

<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(request_date, "m/d/yyyy")# : #read_report.a_Req_Closing_Time#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> 

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			--->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(yearmonth, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_comp.company#</td>
						<td bgcolor=#a_bgcolor# width=253 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.paddress#, #read_report.pcity#<BR>#read_report.pstate# #read_report.pzip#<!--- #read_closer_id.company# ---></td>
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
<cfset list_of_ids = ListAppend(list_of_ids, #title_id#, ",")>
</cfif>
	</CFOUTPUT>	</CFLOOP>
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	
	</cfif>
	<cfelseif #a_trigger# eq "3">
	<cfif #state# eq "none">
	
	<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM appraisal a
			WHERE 0=0

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
				and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				<CFIF #app_id# NEQ "none">
				AND a.app_id = '#app_id#'
			</CFIF> 
			 
			 
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>	
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  



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
			<td width=820 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Appraisal</B></CENTER>
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
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REO Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	<cfset list_of_ids = "">


	
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
	<cfif ListFind(list_of_ids, #title_id#, ",") eq 0>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>APP-210#app_id#</nobr>
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr><cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF></nobr>
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_app.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.app_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
<cfset list_of_ids = ListAppend(list_of_ids, #title_id#, ",")>
</cfif>
	</CFOUTPUT>	</CFLOOP>
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	<cfelse>
	

		


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
			<td width=820 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Appraisal</B></CENTER>
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
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
		
		<CFSET zip_id_2 = #ListToArray(state, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM appraisal a
			WHERE 0=0
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				<CFIF #app_id# NEQ "none">
				AND a.app_id = '#app_id#'
			</CFIF> 
			 
			 
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  


<cfset list_of_ids = "">

	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
<cfif ListFind(list_of_ids, #app_id#, ",") eq 0>

					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>APP-210#app_id#</nobr>
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_app.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.app_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
<cfset list_of_ids = ListAppend(list_of_ids, #app_id#, ",")>
</cfif>
	</CFOUTPUT>	</CFLOOP></CFLOOP>
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	
	</cfif>
	
	
	<cfelseif #a_trigger# eq 4>
		
	<cfif #state# eq "none">	

		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary a
			WHERE codeFlood is not null
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				<CFIF #anc_id# NEQ "none">
				AND a.anc_id = '#anc_id#'
			</CFIF> 
			 
			 
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  



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
			<td width=820 align=left valign=top bgcolor=black>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Flood</B></CENTER>
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
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<cfif #codeFlood# neq "">F</cfif>-#anc_id#
					
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<cfelse>
	



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
		
	

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=black>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Flood</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>



<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			
	
	<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
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
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>	
					
	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">


<CFSET zip_id_2 = #ListToArray(state, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary a
			WHERE 0=0
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				<CFIF #anc_id# NEQ "none">
				AND a.anc_id = '#anc_id#'
			</CFIF> 
			 
			 
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  



		


	

	
	
	
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeFlood# neq "">F</cfif>-#anc_id#
					
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	</CFOUTPUT>	</CFLOOP></CFLOOP>
	
	</cfif>
	
	
	
	
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	<cfelseif #a_trigger# eq 9>
		
	<cfif #state# eq "none">	

		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary a
			WHERE codeAVM is not null

			 
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				<CFIF #avm_id# NEQ "none">
				AND a.anc_id = '#avm_id#'
			</CFIF> 
			 
			 
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  



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
			<td width=820 align=left valign=top bgcolor=red>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for AVM</B></CENTER>
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
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	
	
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeAVM# neq "">AVM</cfif>-#anc_id#
					
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<cfelse>
	



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
		
	

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=red>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for AVM</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>



<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			
	
	<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
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
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>	
					
	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">


<CFSET zip_id_2 = #ListToArray(state, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary a
			WHERE codeAVM is not null
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				<CFIF #avm_id# NEQ "none">
				AND a.anc_id = '#avm_id#'
			</CFIF> 
			 
			 
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  



		


	

	
	
	
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeAVM# neq "">AVM</cfif>-#anc_id#
					
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	</CFOUTPUT>	</CFLOOP></CFLOOP>
	
	</cfif>
	
	
	
	
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	<cfelseif #a_trigger# eq 8>
		
	<cfif #state# eq "none">	

		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary a
			WHERE codeCR is not null
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				<CFIF #cr_id# NEQ "none">
				AND a.anc_id = '#cr_id#'
			</CFIF> 
			 
			 
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  



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
			<td width=820 align=left valign=top bgcolor=brown>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Credit</B></CENTER>
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
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeCR# neq "">CR</cfif>-#anc_id#
					
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<cfelse>
	



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
		
	

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=brown>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Credit</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>



<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			
	
	<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
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
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>	
					
	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">


<CFSET zip_id_2 = #ListToArray(state, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary a
			WHERE codeCR is not null

			 
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				<CFIF #cr_id# NEQ "none">
				AND a.anc_id = '#cr_id#'
			</CFIF> 
			 
			 
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>	
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  



		


	

	
	
	
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeCR# neq "">CR</cfif>-#anc_id#
					
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	</CFOUTPUT>	</CFLOOP></CFLOOP>
	
	</cfif>
	
	
	
	
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	
	<cfelseif #a_trigger# eq 7>
		
	<cfif #state# eq "none">	

		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary a
			WHERE codeSigning is not null

			 
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				<CFIF #sn_id# NEQ "none">
				AND a.anc_id = '#sn_id#'
			</CFIF> 
			 
			 
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>	
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  



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
			<td width=820 align=left valign=top bgcolor=orange>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Signing</B></CENTER>
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
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	
	
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeSigning# neq "">SN</cfif>-#anc_id#
					
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<cfelse>
	



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
		
	

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=orange>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for Signing</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>



<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			
	
	<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
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
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>	
					
	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">


<CFSET zip_id_2 = #ListToArray(state, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary a
			WHERE codeSigning is not null

			 
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				<CFIF #sn_id# NEQ "none">
				AND a.anc_id = '#sn_id#'
			</CFIF> 
			 
			 
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
 <cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>     
		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  



		


	

	
	
	
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeSigning# neq "">SN</cfif>-#anc_id#
					
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	</CFOUTPUT>	</CFLOOP></CFLOOP>
	
	</cfif>
	
	
	
	
	</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	<cfelse>
	
	
		
	
	
	
	
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
			<td width=820 align=left valign=top bgcolor=gray>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Statistics Search Engine for ALL products</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->

<cfif #state# eq "none">
	
<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title a
			WHERE a.oda_year > 2005 and   (a.cancelled is null or a.cancelled = 0)

			 
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		
							 
			<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      

<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  

		
		<CFQUERY datasource="#request.dsn#" NAME="read_prop">
		
			SELECT *
			FROM property a
			where a.oda_year > 2005 

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>
		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  

		
		<CFQUERY datasource="#request.dsn#" NAME="read_closing">
		
			SELECT *
			FROM Title a, title_closing_order_request f
			WHERE a.oda_year > 2005 and   a.title_id = f.title_id AND f.a_Req_closing_month IS NOT NULL and (a.cancelled is null or a.cancelled = 0)
			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (f.request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		
				
			 
			 <CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			</CFIF> 
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')

			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
     
	<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>	
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>   

		
		<CFQUERY datasource="#request.dsn#" NAME="read_app">
		
			SELECT *
			FROM appraisal a
			WHERE 0=0

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
		<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  

		
	<CFQUERY datasource="#request.dsn#" NAME="read_anc">
		
			SELECT *
			FROM ancillary a
			WHERE codeFlood is not null

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>	
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  	
		
		
	<CFQUERY datasource="#request.dsn#" NAME="read_avm">
		
			SELECT *
			FROM ancillary a
			WHERE codeAVM is not null

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  	
	
	<CFQUERY datasource="#request.dsn#" NAME="read_cr">
		
			SELECT *
			FROM ancillary a
			WHERE codeCR is not null

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>	
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  	
	
	<CFQUERY datasource="#request.dsn#" NAME="read_sn">
		
			SELECT *
			FROM ancillary a
			WHERE codeSigning is not null

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#state#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  	
	
	<CFSET r_count = #read_closing.recordcount# + #read_report.recordcount# + #read_prop.recordcount# + #read_app.recordcount# + #read_anc.recordcount# + #read_avm.recordcount# + #read_cr.recordcount# + #read_sn.recordcount#>

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
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REO Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> 

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			--->

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Rpt Recv'd
						</td>

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	

	
	
	
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_time">
		
			SELECT *
			FROM Title a, doc_title_insurance_title d
			WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and (a.cancelled is null or a.cancelled = 0)
</cfquery>
		
					<cfif #read_report.recordcount# GT "0">
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(read_report.check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#read_report.title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.BFirstName1# #read_report.BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> 

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.SFirstName1# #read_report.SLastName1#
						</td>			--->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(read_report.duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.do_appraisal#
						</td> --->
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #read_time.recordcount# GT 0>Days:#DATEDIFF("d", read_time.check_date, read_time.a_recieved_date)#&nbsp;Hours:#DATEDIFF("h", read_time.check_time, read_time.a_recieved_time)#	
					</cfif></td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#</td>
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						#pstate#
	
						</td>
						
						<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
						<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
		
						</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
	
			
			
		</tr>	 </CFIF>
	</CFOUTPUT>	</CFLOOP>   
	
	
	<CFLOOP QUERY="read_prop"> 
		
			
			<CFOUTPUT>
			<cfif read_prop.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			</cfif>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							P-0232#prop_id#
						</td>

						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<!--- <td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>	 --->		

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					
					<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>
					
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_pro.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_prop.prop_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	
		<CFLOOP QUERY="read_closing"> 
		
			
			<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_time">
		
			SELECT *
			FROM Title a, doc_title_insurance_title d
			WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and (a.cancelled is null or a.cancelled = 0)
</cfquery>
			<cfif read_time.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			</cfif>
			<cfif ListContainsNoCase(richmond_ids, read_time.comp_id, ",")>
			<cfset a_bgcolor="FF99FF">
			</cfif><tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> 

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			--->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #read_time.recordcount# GT 0>Days:#DATEDIFF("d", read_time.check_date, read_time.a_recieved_date)#&nbsp;Hours:#DATEDIFF("h", read_time.check_time, read_time.a_recieved_time)#	
					</cfif></td>
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<CFLOOP QUERY="read_app"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>APP-210#app_id#</nobr>
						</td>

						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>&nbsp;</nobr>
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<!--- <td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			
 --->
						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_app.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_app.app_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<CFLOOP QUERY="read_anc"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<cfif #codeFlood# neq "">F</cfif>-#anc_id#
					
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>&nbsp;</nobr>
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

					<!--- 	<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			 --->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_anc.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<CFLOOP QUERY="read_avm"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeAVM# neq "">AVM</cfif>-#anc_id#
					
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>&nbsp;</nobr>
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

					<!--- 	<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			 --->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_anc.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<CFLOOP QUERY="read_cr"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeCR# neq "">CR</cfif>-#anc_id#
					
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>&nbsp;</nobr>
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

					<!--- 	<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			 --->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_anc.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<CFLOOP QUERY="read_sn"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeSigning# neq "">SN</cfif>-#anc_id#
					
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>&nbsp;</nobr>
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

					<!--- 	<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			 --->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_anc.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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

<cfelse>


<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			
	
	<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				
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
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							REO Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> 

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			--->

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Rpt Recv'd
						</td>

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Events
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	

	<CFSET zip_id_2 = #ListToArray(state, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title a
			WHERE a.oda_year > 2005 and   (a.cancelled is null or a.cancelled = 0)

			 
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		
							 
			<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
			
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      

<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  

		
		<CFQUERY datasource="#request.dsn#" NAME="read_prop">
		
			SELECT *
			FROM property a
			where a.oda_year > 2005 

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  

		
		<CFQUERY datasource="#request.dsn#" NAME="read_closing">
		
			SELECT *
			FROM Title a, title_closing_order_request f
			WHERE a.oda_year > 2005 and   a.title_id = f.title_id AND f.a_Req_closing_month IS NOT NULL and (a.cancelled is null or a.cancelled = 0)
			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (f.request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		
				
			 
			 <CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			</CFIF> 
			 
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
     
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date > '07/15/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>   

		
		<CFQUERY datasource="#request.dsn#" NAME="read_app">
		
			SELECT *
			FROM appraisal a
			WHERE 0=0

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>	
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  

		
	<CFQUERY datasource="#request.dsn#" NAME="read_anc">
		
			SELECT *
			FROM ancillary a
			WHERE codeFlood is not null

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
				
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>	
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  	
		
	<CFQUERY datasource="#request.dsn#" NAME="read_avm">
		
			SELECT *
			FROM ancillary a
			WHERE codeAVM is not null

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">

		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  	
		<CFQUERY datasource="#request.dsn#" NAME="read_cr">
		
			SELECT *
			FROM ancillary a
			WHERE codeCR is not null 

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY> 
	
	
		
	
		<CFQUERY datasource="#request.dsn#" NAME="read_sn">
		
			SELECT *
			FROM ancillary a
			WHERE codeSigning is not null

			 

<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'
			
			</CFIF>
			<CFIF #state# NEQ "none">
				AND a.pstate = '#cty_name_1[TTT]#'
			
			</CFIF>
			
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'
			
			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'
			
			</CFIF>
		<CFIF #read_user.role_id# eq 24 or read_user.va_admin eq 'True'>
			<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
			and a.comp_id IN(#companylist#)
		</cfif>	
			 <CFIF #company_id# NEQ "none">
<CFIF #company_id# NEQ "none">
AND (
<cfset comp_id_count = 1>
<cfloop index="this_comp_id" list="#company_id#" delimiters=",">

<cfif comp_id_count neq ListLen(company_id, ",")>
a.comp_id = '#this_comp_id#' or 
<cfelse>
a.comp_id = '#this_comp_id#')
</cfif>
<cfset comp_id_count = comp_id_count + 1>
</cfloop>
</CFIF> 
			</CFIF> 
			

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (a.bfirstname1 LIKE '%#buyer_fname#%' OR a.bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (a.blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (a.sfirstname1 LIKE '%#seller_fname#%' OR a.sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (a.slastname1 LIKE '%#seller_lname#%' OR a.slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
<cfif IsDefined("session.is_logged_in") and (session.mi_employee eq 1)>
and a.order_date_adjusted > '07/14/2008'
		<cfelseif IsDefined("session.is_logged_in") and (session.va_employee eq 1 or session.tx_employee eq 1 or session.ft_fairfax_employee eq 1 or session.mi_flushing_employee eq 1 or session.mo_employee eq 1)>
and a.order_date_adjusted > '10/01/2010'
</cfif>		
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY> 
	
	
	<CFLOOP QUERY="read_report"> 
		
			
			<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_time">
		
			SELECT *
			FROM Title a, doc_title_insurance_title d
			WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and (a.cancelled is null or a.cancelled = 0)
</cfquery>
		
					<cfif #read_report.recordcount# GT "0">
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(read_report.check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#read_report.title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.BFirstName1# #read_report.BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> 

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.SFirstName1# #read_report.SLastName1#
						</td>			--->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(read_report.duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.do_appraisal#
						</td> --->
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #read_time.recordcount# GT 0>Days:#DATEDIFF("d", read_time.check_date, read_time.a_recieved_date)#&nbsp;Hours:#DATEDIFF("h", read_time.check_time, read_time.a_recieved_time)#	
					</cfif></td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#</td>
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						#pstate#
	
						</td>
						
						<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
						<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
		
						</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
	
			
			
		</tr>	 </CFIF>
	</CFOUTPUT>	</CFLOOP>   
	
	
	<CFLOOP QUERY="read_prop"> 
		
			
			<CFOUTPUT>
			
			<cfif read_prop.SearchType eq 'Purchase'>
			<cfset a_bgcolor="FFCC66">
			</cfif>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							P-0232#prop_id#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<!--- <td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>	 --->		

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					
					<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>
					
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_pro.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_prop.prop_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	
		<CFLOOP QUERY="read_closing"> 
		
			
			<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_time">
		
			SELECT *
			FROM Title a, doc_title_insurance_title d
			WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and (a.cancelled is null or a.cancelled = 0)
</cfquery>
					
					
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif IsDefined("REO_NUMBER")>#REO_NUMBER#</CFIF>
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> 

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			--->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #read_time.recordcount# GT 0>Days:#DATEDIFF("d", read_time.check_date, read_time.a_recieved_date)#&nbsp;Hours:#DATEDIFF("h", read_time.check_time, read_time.a_recieved_time)#	
					</cfif></td>
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<CFLOOP QUERY="read_app"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>APP-210#app_id#</nobr>
						</td>

						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>&nbsp;</nobr>
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<!--- <td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			
 --->
						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>
                       
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_app.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_app.app_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<CFLOOP QUERY="read_anc"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeFlood# neq "">F</cfif>-#anc_id#
					
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>&nbsp;</nobr>
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

					<!--- 	<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			 --->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_anc.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	
	<CFLOOP QUERY="read_avm"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeAVM# neq "">AVM</cfif>-#anc_id#
					
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>&nbsp;</nobr>
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

					<!--- 	<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			 --->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_anc.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<CFLOOP QUERY="read_cr"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeCR# neq "">CR</cfif>-#anc_id#
					
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>&nbsp;</nobr>
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

					<!--- 	<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			 --->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_anc.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	
	<CFLOOP QUERY="read_sn"> 
		
			
			<CFOUTPUT>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeSigning# neq "">SN/</cfif>-#anc_id#
					
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<nobr>&nbsp;</nobr>
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

					<!--- 	<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			 --->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
                       <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.appraisal_status#
						</td>
						
							<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
						</td>
						<td bgcolor=#a_bgcolor# width=163 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
	
						</td>
						
						
		<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<a href="./statistics_events_anc.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_anc.anc_id#&company_id=#company_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a>
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
	</CFOUTPUT>	</CFLOOP></CFLOOP>
	
	</table>




	

			</TD>
		</TR>

	</table>

</cfif>			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	

	

</cfif>
