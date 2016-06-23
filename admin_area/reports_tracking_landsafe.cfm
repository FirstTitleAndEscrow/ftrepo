<cfparam name="excel" default="0">

<CFQUERY datasource="#request.dsn#" NAME="get_recs">
	select t.title_id, t.paddress, t.pcity, t.pcounty, t.pstate, t.pzip, t.on_hold, t.loanamt_float, t.disposition_type, t.a_insert_date, t.a_insert_time, t.loan_number, t.docs_recorded_date, t.sec_inst_date, t.pname, t.flagstar_hud_req, t.flagstar_hud_completed, t.flagstar_policy_issued, l.closing_date,l.l_date,
		min(t1.n_date) as n_date, min(t1.n_time) as n_time, min(t2.n_date) as n_date2, min(t2.n_time) as n_time2,
		t3.n_date as schedCompDate, t3.n_time as schedCompTime,
		dac.a_Date_Completed as commitmentuploaded,
		dct.deed_package_date, dct.seller_executed_deed_package_date,
		tor.a_filled_out_date, dct.preHUD_upload_date, dct.final_hud_date, dac.effective_date, dac.effective_date2, l.dsfr_dateandtime,
		l.hw_dateandtime, l.cc_dateandtime, t.responsibleparty_rollover, t.rolloverexplanation_rollover, t.responsibleparty_exception, t.rolloverexplanation_exception
		 from title t
		 inner join companies c on c.id = t.comp_id
		left join title_notes t1 on (t1.order_ID = t.title_ID AND (t1.n_note LIKE '%Binder Completed%' OR t1.n_note LIKE '%Title Commitment Delivered%'))
		left join title_notes t2 on (t2.order_ID = t.title_ID AND (t2.n_note LIKE '%Loan Funded%'))
		left join title_notes t3 on (t3.order_ID = t.title_ID AND (t3.n_note LIKE '%Closing assigned to vendor%'))
		inner join eventlist l on l.title_id = t.title_id
		left join doc_abstract_title dac on dac.title_id = t.title_id
		left join doc_closer_title dct on dct.title_id = t.title_id
		left join Title_Closing_Order_Request tor on tor.title_id = t.title_id
		where c.id = 9711
		AND (t.title_id > 98792 OR t2.n_date > '1/1/2013')
		AND t.appraisal_status <> 'Cancelled Per Client'
		AND t.appraisal_status <> 'Order Cancelled'
		AND t.cancelled IS NULL
		group by  t.title_id, t.paddress, t.pcity, t.pzip, t.pcounty, t.pstate, t.on_hold, t.loanamt_float, t.disposition_type, t.a_insert_date, t.a_insert_time, t.loan_number, t.docs_recorded_date, t.sec_inst_date, t.pname, t.flagstar_hud_req, t.flagstar_hud_completed, t.flagstar_policy_issued, l.closing_date,l.l_date,
		t3.n_date, t3.n_time, dac.a_Date_Completed, dct.deed_package_date, dct.seller_executed_deed_package_date,tor.a_filled_out_date,
		dct.preHUD_upload_date, dct.final_hud_date, dac.effective_date, dac.effective_date2, l.dsfr_dateandtime, l.hw_dateandtime, l.cc_dateandtime
		,t.responsibleparty_rollover, t.rolloverexplanation_rollover, t.responsibleparty_exception, t.rolloverexplanation_exception
		order by t.title_id

</CFQUERY>

<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:##000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>

<h3>Landsafe Report</h3>

<table border=1 cellspacing=0 cellpadding=4 class="table_border">
<tr>
	<td align="left" valign="bottom"><strong>Order Number</strong></td>
	<td align="left" valign="bottom"><strong>Supplier File #</strong></td>
	<td align="left" valign="bottom"><strong>Property Address</strong></td>
	<td align="left" valign="bottom"><strong>Property State</strong></td>
	<td align="left" valign="bottom"><strong>Open Date</strong></td>
	<td align="left" valign="bottom"><strong>Current Status</strong></td>
	<td align="left" valign="bottom"><strong>Contract Received</strong></td>
	<td align="left" valign="bottom"><strong>Commitment Received</strong></td>
	<td align="left" valign="bottom"><strong>Disposition Type</strong></td>
	<td align="left" valign="bottom"><strong>Deal (Mtg or Cash)</strong></td>
	<td align="left" valign="bottom"><strong>Deed Package Sent To Seller</strong></td>
	<td align="left" valign="bottom"><strong>Confirmed Receipt of Seller Executed Deed Package</strong></td>
	<td align="left" valign="bottom"><strong>Schedule and Confirm Signed Date with Buyer</strong></td>
	<td align="left" valign="bottom"><strong>Sent Estimated HUD</strong></td>
	<td align="left" valign="bottom"><strong>Rcvd Approved HUD</strong></td>
	<td align="left" valign="bottom"><strong>Original PCOE Date</strong></td>
	<td align="left" valign="bottom"><strong>Updated PCOE Date</strong></td>
	<td align="left" valign="bottom"><strong>Actual Closing Date</strong></td>
	<td align="left" valign="bottom"><strong>Date Doc Sent For Recording</strong></td>
	<td align="left" valign="bottom"><strong>Days Until Close</strong></td>
	<td align="left" valign="bottom"><strong>N/A</strong></td>
	<td align="left" valign="bottom"><strong>Final HUD/Wire Conf Date</strong></td>
	<td align="left" valign="bottom"><strong>Confirm Closing w/Landsafe Default</strong></td>
	<td align="left" valign="bottom"><strong>Closing Package Sent to Landsafe Default</strong></td>
	<td align="left" valign="bottom"><strong>Vendor Comments</strong></td>
	<td align="left" valign="bottom"><strong>Rollover Responsible Party</strong></td>
	<td align="left" valign="bottom"><strong>Rollover Explanation</strong></td>
	<td align="left" valign="bottom"><strong>Exception Responsible Party</strong></td>
	<td align="left" valign="bottom"><strong>Exception Explanation</strong></td>
	<td align="left" valign="bottom"><strong>Deed Package Turn Time</strong></td>
	<td align="left" valign="bottom"><strong>Closing Confirms and Provide Final HUD</strong></td>
	<td align="left" valign="bottom"><strong>Closing Package</strong></td>
	<td align="left" valign="bottom"><strong>Calendar Days Until Close</strong></td>
</tr>
<cfset bgcolor = 'efefef'>
<cfoutput query="get_recs" group="title_id">
	<tr bgcolor="#bgcolor#">
		<td>&nbsp;#title_id#</td>
		<td>&nbsp;</td>
		<td>&nbsp;#paddress#, #pcity#, #pstate# #pzip#</td>
		<td>&nbsp;#pstate#</td>
		<td>&nbsp;#DateFormat(a_insert_date,"mm/dd/yyyy")#</td>
		<td>&nbsp;</td>
		<td>&nbsp;#DateFormat(a_insert_date,"mm/dd/yyyy")#</td>
		<td>&nbsp;#DateFormat(commitmentuploaded,"mm/dd/yyyy")#</td>
		<td>&nbsp;#disposition_type#</td>
		<td>&nbsp;<cfif Len(loanamt_float)>Mtg<cfelse>Cash</cfif></td>
		<td>&nbsp;#DateFormat(deed_package_date,"mm/dd/yyyy")#</td>
		<td>&nbsp;#DateFormat(seller_executed_deed_package_date,"mm/dd/yyyy")#</td>
		<td>&nbsp;#DateFormat(a_filled_out_date,"mm/dd/yyyy")#</td>
		<td>&nbsp;#DateFormat(preHUD_upload_date,"mm/dd/yyyy")#</td>
		<td>&nbsp;#DateFormat(final_hud_date,"mm/dd/yyyy")#</td>
		<td>&nbsp;#effective_date#</td>
		<td>&nbsp;#effective_date2#</td>
		<td>&nbsp;#DateFormat(closing_date,"mm/dd/yyyy")#</td>
		<td>&nbsp;#DateFormat(dsfr_dateandtime,"mm/dd/yyyy")#</td>
		<td><cfif Len(closing_date)>#DateDiff("d",a_insert_date,closing_date)#</cfif></td>
		<td></td>
		<td>&nbsp;#DateFormat(hw_dateandtime,"mm/dd/yyyy")#</td>
		<td>&nbsp;#DateFormat(cc_dateandtime,"mm/dd/yyyy")#</td>
		<td></td>
		<td></td>
		<td>#responsibleparty_rollover#</td>
		<td>#rolloverexplanation_rollover#</td>
		<td>#responsibleparty_exception#</td>
		<td>#rolloverexplanation_exception#</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
<cfif bgcolor eq 'efefef'>
<cfset bgcolor = 'ffffff'>
<cfelse>
<cfset bgcolor = 'efefef'>
</cfif>
</cfoutput>
</table>
<br>
<form action="reports_tracking_landsafe.cfm" method="post">
<input type="hidden" name="excel" value="1">
<input type="submit" value="Export To Excel">
</form>

<cfif excel EQ 1>
	<cfquery dbtype="query" name="getls">
		select title_ID, '' as supplierfileno, paddress+' '+pcity+' '+pstate+' '+pzip as address,
		pstate,a_insert_date,'' as opendate,a_insert_date as contract_received, commitmentuploaded, disposition_type, 'Mtg' as deal,
		deed_package_date,seller_executed_deed_package_date,a_filled_out_date,prehud_upload_date,
		final_hud_date,effective_date,effective_date2,closing_date,dsfr_dateandtime,'' as daysuntilclose,'' as n_a,
		hw_dateandtime,cc_dateandtime, '' as closingpackagesent, '' as vendorcomments, 
		responsibleparty_rollover, rolloverexplanation_rollover, responsibleparty_exception, rolloverexplanation_exception
		from get_recs
	</cfquery>
	
	
	<cfspreadsheet action="write" filename="#expandpath('.')#\landsafe.xls"   
	   query="getls" overwrite=true> 
	<cfspreadsheet action="read" src="#expandpath('.')#\landsafe.xls" name="landsafe" excludeheaderrow="true">
	<cfset spreadsheetDeleteRow(landsafe,1)>
	<cfspreadsheet action="write" name="landsafe" overwrite=true filename="#expandpath('.')#\landsafe.xls">
	
	<cfset contentType = "unknown">
	
	<cfheader name="Content-Disposition" value="inline; filename=landsafe.xls">
	<cfcontent type="#contentType#"	file="#expandpath('.')#\landsafe.xls" deleteFile="yes">
	<cfabort>
</cfif>