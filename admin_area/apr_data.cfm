<CFQUERY datasource="#request.dsn#" NAME="get_Recstop">
select a.*, c.company, c.use_apr, coalesce(t.pstate,p.pstate) as state, ap.amtpaid, ap.checkNum from apr_files a
left join title t on (t.title_id = a.file_id AND a.file_type = 'T')
left join property p on (p.prop_id = a.file_id AND a.file_type = 'P')
left join apr_payments ap on a.id = ap.apr_file_id
inner join companies c on (c.id = t.comp_id OR c.id = p.comp_id)
where <!---a.file_id = #file_id#--->
a.paid_in_full = 0
<cfif isDefined("file_id")>
	AND a.file_id = '#file_id#'
</cfif>
order by aprdate desc
</CFQUERY>
<cfquery name="get_recs" dbType="query">
	select * from get_recsTop
	where paid_by = 'Client'
	AND use_apr = 1
</cfquery>

{ "aaData": [
	<cfoutput query="get_Recs">
		<CFQUERY datasource="#request.dsn#" NAME="get_vendor">
			select vs.company from vendors_stacie vs
			inner join vendor_tracker_new vt on vs.vendor_id = vt.vendor_id
			where vt.order_id = '#file_id#'
			and vt.order_type = '#file_type#'
			<cfif product EQ "TU">
				AND vt.product_ordered = 'bring_to_date'
			<cfelseif product EQ "10">
				AND vt.product_ordered = 'ten_year'
			<cfelseif product EQ "FS">
				AND vt.product_ordered = 'full_search'
			<cfelseif product EQ "TO">
				AND vt.product_ordered = 'two_owner'
			<cfelseif product EQ "CO">
				AND vt.product_ordered = 'current_owner'
			<cfelseif product EQ "DR">
				AND vt.product_ordered = 'doc_retrieval'
			<cfelseif product EQ "BK">
				AND vt.product_ordered = 'bankruptcy'
			<cfelseif product EQ "TY">
				AND vt.task = 'typing'
			<cfelseif product EQ "ICL">
				AND vt.task = 'ICL'
			<cfelseif product EQ "DP">
				AND vt.task = 'DeedPrep'
			<cfelseif product EQ "TX">
				AND vt.task = 'TaxPrep'
			<cfelse>
				AND 1 = 0
			</cfif>
			order by vt.id desc
		</cfquery>
		<CFQUERY datasource="#request.dsn#" NAME="getdue">
			select coalesce(sum(a.price),0) as due from apr_files a
			where a.file_id = '#file_id#'
			AND a.product = '#product#'
			AND a.paid_by = '#paid_by#'
		</cfquery>
		
		<CFQUERY datasource="#request.dsn#" NAME="getamt">
			select coalesce(sum(a.price),0) as due, coalesce(sum(p.amtpaid),0) as paid from apr_files a
			left join apr_payments p on p.apr_file_id = a.id
			where a.file_id = '#file_id#'
			AND a.product = '#product#'
			AND a.paid_by = '#paid_by#'
		</cfquery>
		["#file_id#","#paid_by#","#product#","#company#","#state#","#get_vendor.company#","<cfoutput><cfif Len(amtPaid)>#DollarFormat(amtpaid)#</cfif> <cfif Len(checkNum)>###checkNum#</cfif><br></cfoutput>",#DateFormat(aprdate,"mm/dd/yyyy")#","#dollarFormat(getamt.paid)#","#dollarFormat(getdue.due)#","#dollarFormat(getdue.due-getamt.paid)#"]<cfif currentrow NEQ recordcount>,</cfif>
	</cfoutput>
	] }