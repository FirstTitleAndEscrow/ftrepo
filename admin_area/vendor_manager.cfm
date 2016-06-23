<cfparam name="url.order_type" default="T">
<cfparam name="url.selected_abstract_vendor_id" default=0>
<cfparam name="url.selected_typing_vendor_id" default=0>
<cfparam name="url.selected_review_vendor_id" default=0>
<cfparam name="url.selected_appraisal_vendor_id" default=0>
<cfparam name="url.selected_taxprep_vendor_id" default=0>
<cfparam name="url.selected_icl_vendor_id" default=0>
<cfparam name="url.selected_payoff_vendor_id" default=0>
<cfparam name="url.selected_deedprep_vendor_id" default=0>
<cfparam name="url.selected_reo_vendor_id" default=0>
<cfparam name="url.selected_recording_vendor_id" default=0>
<cfparam name="url.selected_orderentry_vendor_id" default=0>
<cfparam name="url.product_ordered" default="">


<cfif url.order_type eq 'T'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			Select * from Title
			where title_id = #url.rec_id#
</CFQUERY>
<cfelseif url.order_type eq 'App'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			Select * from appraisal
			where app_id = #url.rec_id#
</CFQUERY>
<cfelseif url.order_type eq 'P'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			Select *, prop_id as title_id from Property
			where prop_id = #url.rec_id#
</CFQUERY>
<cfelseif url.order_type eq 'PR'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			Select *, pr_id as title_id from Policy_Recovery
			where pr_id = #url.rec_id#
</CFQUERY>
<cfelseif url.order_type eq 'FDR'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			Select *, fdr_id as title_id from Final_Document_Retrieval
			where fdr_id = #url.rec_id#
</CFQUERY>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="retrieve_user">
	SELECT *
	FROM user_client_assoc a, first_admin b
	WHERE a.company_id = #read_title.comp_id# and a.id = b.id and b.position = 'Title Ordering/Tracking'
</CFQUERY>



<cfif url.order_type eq 'T'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="check_abstract">
			Select * from
			Doc_abstract_title where title_id = #url.rec_id# and abstractor_doc_upload IS NOT NULL
</CFQUERY>
</cfif>

<cfif url.order_type eq 'P'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="check_abstract">
			Select * from
			Doc_abstract_prop where prop_id = #url.rec_id# and abstractor_doc_upload IS NOT NULL
</CFQUERY>
</cfif>


<cfif url.order_type eq 'PR'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="check_abstract">
			Select * from
			Doc_abstract_PR where PR_id = #url.rec_id# and abstractor_doc_upload IS NOT NULL
</CFQUERY>
</cfif>

<cfif url.order_type eq 'FDR'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="check_abstract">
			Select * from
			Doc_abstract_FDR where FDR_id = #url.rec_id# and abstractor_doc_upload IS NOT NULL
</CFQUERY>
</cfif>


<cfif url.order_type eq 'T' or url.order_type eq 'P' or url.order_type eq 'PR' or url.order_type eq 'FDR'>
<cfif url.selected_abstract_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstractor_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_abstract_vendor_id#
</CFQUERY>

</cfif>


<cfswitch expression="#url.product_ordered#">
<cfcase value="Bring To Date">
<cfset url.product_ordered = "bring_to_date">
</cfcase>
<cfcase value="Full Search">
<cfset url.product_ordered = "full_search">
</cfcase>
<cfcase value="10-Year Search">
<cfset url.product_ordered = "ten_year">
</cfcase>
<cfcase value="Current Owner Search with 24 month chain of title">
<cfset url.product_ordered = "current_owner">
</cfcase>
<cfcase value="Document Retrieval">
<cfset url.product_ordered = "doc_retrieval">
</cfcase>
<cfcase value="Two Owner Search">
<cfset url.product_ordered = "two_owner">
</cfcase>
<cfcase value="Bankruptcy">
<cfset url.product_ordered = "bankruptcy">
</cfcase>
</cfswitch>

<cfif findNoCase("bring to date",url.product_ordered)>
	<cfset url.product_ordered = "bring_to_date">
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="get_state">
		select ft_st_id
		from first_title_states
		where st_abbrev = '#read_title.pstate#'

	</cfquery>

<cfif url.product_ordered EQ "current_owner">



	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstractor1">
		select distinct(v.vendor_id), v.company, vp.current_owner, 1 as orderNum
		from vendors_stacie v inner join vendor_routing_table vr on v.vendor_id = vr.current_owner_1st_tier_id
		inner join vendor_pricing vp on vp.vendor_id = v.vendor_ID
		where vr.state = <cfqueryparam value="#get_state.ft_st_id#" cfsqltype="cf_sql_varchar">
		AND vr.county = <cfqueryparam value="#read_title.pcounty#" cfsqltype="cf_sql_varchar">
		AND (vp.state = <cfqueryparam value="#read_title.pstate#" cfsqltype="cf_sql_varchar"> OR vp.state = 'All')
		AND (vp.county = <cfqueryparam value="#read_title.pcounty#" cfsqltype="cf_sql_varchar"> OR vp.county = 'All')
		<cfif session.ft_user_id EQ 462>
				AND  v.sb = 1
			</cfif>
	</CFQUERY>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstractor2">
		select distinct(v.vendor_id), v.company, vp.current_owner, 2 as orderNum
		from vendors_stacie v inner join vendor_routing_table vr on v.vendor_id = vr.current_owner_2nd_tier_id
		inner join vendor_pricing vp on vp.vendor_id = v.vendor_ID
		where vr.state = <cfqueryparam value="#get_state.ft_st_id#" cfsqltype="cf_sql_varchar">
		AND vr.county = <cfqueryparam value="#read_title.pcounty#" cfsqltype="cf_sql_varchar">
		AND (vp.state = <cfqueryparam value="#read_title.pstate#" cfsqltype="cf_sql_varchar"> OR vp.state = 'All')
		AND (vp.county = <cfqueryparam value="#read_title.pcounty#" cfsqltype="cf_sql_varchar"> OR vp.county = 'All')
		<cfif session.ft_user_id EQ 462>
				AND  v.sb = 1
			</cfif>
	</CFQUERY>

	<cfquery dbType="query" name="read_abstractors">
		select * from read_abstractor1
		UNION
		select * from read_abstractor2
		order by ordernum
	</cfquery>
</cfif>

<cfif url.product_ordered EQ "two_owner">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstractor1">
		select distinct(v.vendor_id), v.company, vp.two_owner, 1 as orderNum
		from vendors_stacie v inner join vendor_routing_table vr on v.vendor_id = vr.two_owner_1st_tier_id
		inner join vendor_pricing vp on vp.vendor_id = v.vendor_ID
		where vr.state = <cfqueryparam value="#get_state.ft_st_id#" cfsqltype="cf_sql_varchar">
		AND vr.county = <cfqueryparam value="#read_title.pcounty#" cfsqltype="cf_sql_varchar">
		AND (vp.state = <cfqueryparam value="#read_title.pstate#" cfsqltype="cf_sql_varchar"> OR vp.state = 'All')
		AND (vp.county = <cfqueryparam value="#read_title.pcounty#" cfsqltype="cf_sql_varchar"> OR vp.county = 'All')
		<cfif session.ft_user_id EQ 462>
				AND  v.sb = 1
			</cfif>
	</CFQUERY>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstractor2">
		select distinct(v.vendor_id), v.company, vp.two_owner, 2 as orderNum
		from vendors_stacie v inner join vendor_routing_table vr on v.vendor_id = vr.two_owner_2nd_tier_id
		inner join vendor_pricing vp on vp.vendor_id = v.vendor_ID
		where vr.state = <cfqueryparam value="#get_state.ft_st_id#" cfsqltype="cf_sql_varchar">
		AND vr.county = <cfqueryparam value="#read_title.pcounty#" cfsqltype="cf_sql_varchar">
		AND (vp.state = <cfqueryparam value="#read_title.pstate#" cfsqltype="cf_sql_varchar"> OR vp.state = 'All')
		AND (vp.county = <cfqueryparam value="#read_title.pcounty#" cfsqltype="cf_sql_varchar"> OR vp.county = 'All')
		<cfif session.ft_user_id EQ 462>
				AND  v.sb = 1
			</cfif>
	</CFQUERY>

	<cfquery dbType="query" name="read_abstractors">
		select * from read_abstractor1
		UNION
		select * from read_abstractor2
		order by ordernum
	</cfquery>
</cfif>

<cfif url.product_ordered EQ "full_search">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstractors">
		select distinct(v.vendor_id), v.company, vp.full_search, 1 as orderNum
		from vendors_stacie v inner join vendor_routing_table vr on v.vendor_id = vr.full_search_id
		inner join vendor_pricing vp on vp.vendor_id = v.vendor_ID
		where vr.state = <cfqueryparam value="#get_state.ft_st_id#" cfsqltype="cf_sql_varchar">
		AND vr.county = <cfqueryparam value="#read_title.pcounty#" cfsqltype="cf_sql_varchar">
		AND (vp.state = <cfqueryparam value="#read_title.pstate#" cfsqltype="cf_sql_varchar"> OR vp.state = 'All')
		AND (vp.county = <cfqueryparam value="#read_title.pcounty#" cfsqltype="cf_sql_varchar"> OR vp.county = 'All')
		<cfif session.ft_user_id EQ 462>
				AND  v.sb = 1
			</cfif>
	</CFQUERY>

</cfif>

<cfif not isDefined("read_abstractors") OR read_abstractors.recordcount EQ 0>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstractors">
				Select * from Vendor_Pricing p, Vendors_Stacie s
				where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
				and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%'
				<cfif url.product_ordered eq ''>
				and s.Vendor_id = 999999999999999999999999
				<cfelse>
				and p.#url.product_ordered# IS NOT NULL
				and p.#url.product_ordered# <> ''
				</cfif>
				 and p.vendor_id = s.vendor_id)
				or (p.state = '#read_title.pstate#' and p.county = 'All'
				and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%'
				<cfif url.product_ordered eq ''>
				and s.Vendor_id = 999999999999999999999999
				<cfelse>
				and p.#url.product_ordered# IS NOT NULL
				and p.#url.product_ordered# <> ''
				</cfif>
				 and p.vendor_id = s.vendor_id)
				or
				(p.state = 'ALL' and p.county = 'All'
				and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%'
				<cfif url.product_ordered eq ''>
				and s.Vendor_id = 999999999999999999999999
				<cfelse>
				and p.#url.product_ordered# IS NOT NULL
				and p.#url.product_ordered# <> ''
				</cfif>
				 and p.vendor_id = s.vendor_id)
				<cfif session.ft_user_id EQ 462>
				AND  s.sb = 1
			</cfif>

				 <cfif url.product_ordered neq ''>
				order by p.#url.product_ordered#
				</cfif>

	</CFQUERY>

</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_abstract" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'Abstract'
			and v.vendor_id = s.vendor_id
			order by v.assign_date desc, ID desc
</CFQUERY>

<cfset the_product = "">
<cfif read_assigned_abstract.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstract_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_abstract.assigned_by#
</CFQUERY>
<cfswitch expression="#read_assigned_abstract.product_ordered#">
<cfcase value="bring_to_date">
<cfset the_product = "Bring To Date">
</cfcase>
<cfcase value="ten_year">
<cfset the_product = "10-Year">
</cfcase>
<cfcase value="full_search">
<cfset the_product = "Full Search">
</cfcase>
<cfcase value="current_owner">
<cfset the_product = "Current Owner Search with 24 month chain of title">
</cfcase>
<cfcase value="doc_retrieval">
<cfset the_product = "Document Retrieval">
</cfcase>
<cfcase value="two_owner">
<cfset the_product = "Two Owner Search">
</cfcase>
</cfswitch>
</cfif>

<cfif url.selected_abstract_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstractor_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%'
			and p.vendor_id = #url.selected_abstract_vendor_id#
			 <cfif url.product_ordered eq ''>
			and s.Vendor_id = 999999999999999999999999
			<cfelse>
			and p.#url.product_ordered# IS NOT NULL
			and p.#url.product_ordered# <> ''
			</cfif>
			 and p.vendor_id = s.vendor_id)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%'
			and p.vendor_id = #url.selected_abstract_vendor_id#
			 <cfif url.product_ordered eq ''>
			and s.Vendor_id = 999999999999999999999999
			<cfelse>
			and p.#url.product_ordered# IS NOT NULL
			and p.#url.product_ordered# <> ''
			</cfif>
			 and p.vendor_id = s.vendor_id)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%'
			and p.vendor_id = #url.selected_abstract_vendor_id#
			 <cfif url.product_ordered eq ''>
			and s.Vendor_id = 999999999999999999999999
			<cfelse>
			and p.#url.product_ordered# IS NOT NULL
			and p.#url.product_ordered# <> ''
			</cfif>
			 and p.vendor_id = s.vendor_id)

			 <cfif url.product_ordered neq ''>
			order by p.#url.product_ordered#
			</cfif>
</CFQUERY>

<cfoutput>
<script language="javascript">


function fill_abstractor_prices() {
var bring_to_date_price = '#read_abstractor_pricing.bring_to_date#';
var two_owner_price = '#read_abstractor_pricing.two_owner#';
var doc_retrieval_price = '#read_abstractor_pricing.doc_retrieval#';
var current_owner_price = '#read_abstractor_pricing.current_owner#';
var full_search_price = '#read_abstractor_pricing.full_search#';
var ten_year_price = '#read_abstractor_pricing.ten_year#';

if (document.abstractor_form.product_ordered[0].checked == true) {
document.abstractor_form.abstract_price.value = bring_to_date_price;
}

if (document.abstractor_form.product_ordered[1].checked == true) {
document.abstractor_form.abstract_price.value = full_search_price;
}

if (document.abstractor_form.product_ordered[2].checked == true) {
document.abstractor_form.abstract_price.value = ten_year_price;
}

if (document.abstractor_form.product_ordered[3].checked == true) {
document.abstractor_form.abstract_price.value = current_owner_price;
}

if (document.abstractor_form.product_ordered[4].checked == true) {
document.abstractor_form.abstract_price.value = doc_retrieval_price;
}

if (document.abstractor_form.product_ordered[5].checked == true) {
document.abstractor_form.abstract_price.value = two_owner_price;
}

enable_abstract_assign();

}
</script>

</cfoutput>

</cfif>


</cfif>




<cfif url.order_type eq 'T' or url.order_type eq 'P' or url.order_type eq 'PR' or url.order_type eq 'FDR'>
<!--- TYPING --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_typing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%' and p.vendor_id = s.vendor_id)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%' and p.vendor_id = s.vendor_id)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%' and p.vendor_id = s.vendor_id)

			 order by p.typing_fee
</CFQUERY>
 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_typing" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'Typing'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_typing.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_typing_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_typing.assigned_by#
</CFQUERY>
</cfif>
<!--- END TYPING --->
</cfif>



<cfif url.order_type eq 'T' or url.order_type eq 'P' or url.order_type eq 'PR' or url.order_type eq 'FDR'>
<!--- COMMITMENT REVIEW --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_review">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#Read_title.pcounty#'
			and p.service_type = 'Review' and s.service_type LIKE '%Review%' and p.vendor_id = s.vendor_id)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Review' and s.service_type LIKE '%Review%' and p.vendor_id = s.vendor_id)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Review' and s.service_type LIKE '%Review%' and p.vendor_id = s.vendor_id)

			 order by p.review_fee
</CFQUERY>
 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_review" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'Review'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_review.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_review_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_review.assigned_by#
</CFQUERY>
</cfif>
<!--- END COMMITMENT REVIEW --->
</cfif>

<cfif url.order_type eq 'App'>
<!--- APPRAISAL --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_appraisall">
			Select distinct s.vendor_id, * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%' and p.vendor_id = s.vendor_id)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%' and p.vendor_id = s.vendor_id)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%' and p.vendor_id = s.vendor_id)

			 order by p.appraisal_fee
</CFQUERY>

 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_Appraisal" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.app_id#
			and v.task = 'Appraisal'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_Appraisal.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_Appraisal_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_Appraisal.assigned_by#
</CFQUERY>
</cfif>
<!--- END APPRAISAL --->
</cfif>


<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<!--- TAXPREP --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_taxprep">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%' and p.vendor_id = s.vendor_id)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%' and p.vendor_id = s.vendor_id)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%' and p.vendor_id = s.vendor_id)

			 order by p.taxprep_fee
</CFQUERY>
 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_TaxPrep" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'TaxPrep'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_TaxPrep.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_TaxPrep_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_TaxPrep.assigned_by#
</CFQUERY>
</cfif>
<!--- END TAXPREP --->
</cfif>

<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<!--- ICL --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_ICL">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%' and p.vendor_id = s.vendor_id)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%' and p.vendor_id = s.vendor_id)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%' and p.vendor_id = s.vendor_id)

			 order by p.ICL_fee
</CFQUERY>
 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_ICL" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'ICL'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_ICL.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_ICL_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_ICL.assigned_by#
</CFQUERY>
</cfif>
<!--- END ICL --->
</cfif>





<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<!--- payoff --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_payoff">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%' and p.vendor_id = s.vendor_id)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%' and p.vendor_id = s.vendor_id)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%' and p.vendor_id = s.vendor_id)
			 order by p.payoff_fee
</CFQUERY>
 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_payoff" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'Payoff'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_payoff.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_payoff_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_payoff.assigned_by#
</CFQUERY>
</cfif>
<!--- END payoff --->
</cfif>



<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<!--- deedprep --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_deedprep">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'DeedPrep' and s.service_type LIKE '%DeedPrep%' and p.vendor_id = s.vendor_id)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'DeedPrep' and s.service_type LIKE '%DeedPrep%' and p.vendor_id = s.vendor_id)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'DeedPrep' and s.service_type LIKE '%DeedPrep%' and p.vendor_id = s.vendor_id)
			 order by p.deedprep_fee
</CFQUERY>
 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_deedprep" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'DeedPrep'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_deedprep.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_deedprep_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_deedprep.assigned_by#
</CFQUERY>
</cfif>
<!--- END deedprep --->
</cfif>

<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<!--- reo --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_reo">
			Select distinct s.vendor_id, * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'REO' and s.service_type LIKE '%REO%' and p.vendor_id = s.vendor_id)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'REO' and s.service_type LIKE '%REO%' and p.vendor_id = s.vendor_id)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'REO' and s.service_type LIKE '%REO%' and p.vendor_id = s.vendor_id)

			 order by p.reo_fee
</CFQUERY>
 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_reo" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'REO'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_reo.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_reo_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_reo.assigned_by#
</CFQUERY>
</cfif>
<!--- END reo --->
</cfif>


<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<!--- recording --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_recording">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Recording' and s.service_type LIKE '%Recording%' and p.vendor_id = s.vendor_id)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Recording' and s.service_type LIKE '%Recording%' and p.vendor_id = s.vendor_id)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Recording' and s.service_type LIKE '%Recording%' and p.vendor_id = s.vendor_id)
			 order by p.recording_fee
</CFQUERY>
 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_recording" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'Recording'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_recording.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_recording_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_recording.assigned_by#
</CFQUERY>
</cfif>
<!--- END recording --->
</cfif>

<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<!--- order entry --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_orderentry">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'OrderEntry' and s.service_type LIKE '%OrderEntry%' and p.vendor_id = s.vendor_id)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'OrderEntry' and s.service_type LIKE '%OrderEntry%' and p.vendor_id = s.vendor_id)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'OrderEntry' and s.service_type LIKE '%OrderEntry%' and p.vendor_id = s.vendor_id)
			 order by p.orderentry_fee
</CFQUERY>
 <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_orderentry" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'OrderEntry'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_orderentry.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_orderentry_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_orderentry.assigned_by#
</CFQUERY>
</cfif>
<!--- END order entry --->
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
<style type="text/css" media="screen">
<!--
body, TD {
font: 10px verdana, arial, sans-serif;
}
input {
font: 9px verdana, arial, sans-serif;
}
select, option {
font: 9px verdana, arial, sans-serif;
}
.header {

font: 14px verdana, arial, sans-serif;
}
-->
</style>

<script language="javascript">
function enable_buttons () {
<cfif url.order_type eq 'T' or url.order_type eq 'P' or url.order_type eq 'PR' or url.order_type eq 'FDR'>
if (document.abstractor_form.abstract_price.value == '') {
document.abstractor_form.abstract_assign_button.disabled = true;
document.abstractor_form.abstract_assign_button.style.backgroundColor='#E1E1E1';
} else {
document.abstractor_form.abstract_assign_button.disabled = false;
document.abstractor_form.abstract_assign_button.style.backgroundColor='#FFFFCC';
}
</cfif>
<cfif url.order_type eq 'T' or url.order_type eq 'P' or url.order_type eq 'PR' or url.order_type eq 'FDR'>
if (document.typing_form.typing_price.value == '') {
document.typing_form.typing_assign_button.disabled = true;
document.typing_form.typing_assign_button.style.backgroundColor='#E1E1E1';
} else {
document.typing_form.typing_assign_button.disabled = false;
document.typing_form.typing_assign_button.style.backgroundColor='#FFFFCC';
}
</cfif>
<cfif url.order_type eq 'T' or url.order_type eq 'P' or url.order_type eq 'PR' or url.order_type eq 'FDR'>
if (document.review_form.review_price.value == '') {
document.review_form.review_assign_button.disabled = true;
document.review_form.review_assign_button.style.backgroundColor='#E1E1E1';
} else {
document.review_form.typing_assign_button.disabled = false;
document.review_form.typing_assign_button.style.backgroundColor='#FFFFCC';
}
</cfif>
<cfif url.order_type eq 'App'>
if (document.appraisal_form.appraisal_price.value == '') {
document.appraisal_form.appraisal_assign_button.disabled = true;
document.appraisal_form.appraisal_assign_button.style.backgroundColor='#E1E1E1';
} else {
document.appraisal_form.appraisal_assign_button.disabled = false;
document.appraisal_form.appraisal_assign_button.style.backgroundColor='#FFFFCC';
}
</cfif>
<cfif url.order_type eq 'T' or url.order_type eq 'P'>
if (document.taxprep_form.taxprep_price.value == '') {
document.taxprep_form.taxprep_assign_button.disabled = true;
document.taxprep_form.taxprep_assign_button.style.backgroundColor='#E1E1E1';
} else {
document.taxprep_form.taxprep_assign_button.disabled = false;
document.taxprep_form.taxprep_assign_button.style.backgroundColor='#FFFFCC';
}
</cfif>
<cfif url.order_type eq 'T' or url.order_type eq 'P'>
if (document.ICL_form.ICL_price.value == '') {
document.ICL_form.icl_assign_button.disabled = true;
document.ICL_form.icl_assign_button.style.backgroundColor='#E1E1E1';
} else {
document.ICL_form.icl_assign_button.disabled = false;
document.ICL_form.icl_assign_button.style.backgroundColor='#FFFFCC';
}
</cfif>
<cfif url.order_type eq 'T' or url.order_type eq 'P'>
if (document.payoff_form.payoff_price.value == '') {
document.payoff_form.payoff_assign_button.disabled = true;
document.payoff_form.payoff_assign_button.style.backgroundColor='#E1E1E1';
} else {
document.payoff_form.payoff_assign_button.disabled = false;
document.payoff_form.payoff_assign_button.style.backgroundColor='#FFFFCC';
}
</cfif>
<cfif url.order_type eq 'T' or url.order_type eq 'P'>
if (document.deedprep_form.deedprep_price.value == '') {
document.deedprep_form.deedprep_assign_button.disabled = true;
document.deedprep_form.deedprep_assign_button.style.backgroundColor='#E1E1E1';
} else {
document.deedprep_form.deedprep_assign_button.disabled = false;
document.deedprep_form.deedprep_assign_button.style.backgroundColor='#FFFFCC';
}
</cfif>
<cfif url.order_type eq 'T' or url.order_type eq 'P'>
if (document.REO_form.REO_price.value == '') {
document.REO_form.reo_assign_button.disabled = true;
document.REO_form.reo_assign_button.style.backgroundColor='#E1E1E1';
} else {
document.REO_form.reo_assign_button.disabled = false;
document.REO_form.reo_assign_button.style.backgroundColor='#FFFFCC';
}
</cfif>
<!---
<cfif url.order_type eq 'T' or url.order_type eq 'P'>
if (document.recording_form.recording_price.value == '') {
document.recording_form.recording_assign_button.disabled = true;
document.recording_form.recording_assign_button.style.backgroundColor='#E1E1E1';
} else {
document.recording_form.recording_assign_button.disabled = false;
document.recording_form.recording_assign_button.style.backgroundColor='#FFFFCC';
}
</cfif>

<cfif url.order_type eq 'T' or url.order_type eq 'P'>
if (document.orderentry_form.orderentry_price.value == '') {
document.orderentry_form.orderentry_assign_button.disabled = true;
document.orderentry_form.orderentry_assign_button.style.backgroundColor='#E1E1E1';
} else {
document.orderentry_form.orderentry_assign_button.disabled = false;
document.orderentry_form.orderentry_assign_button.style.backgroundColor='#FFFFCC';
}
</cfif>
--->
}
</script>
</head>

<body bgcolor="#E1E1E1" onload="enable_buttons();">
<cfif url.order_type eq 'T'>
<cfinclude template="../admin_area/includes/title_top_nav.cfm">
<cfelseif url.order_type eq 'P'>
<cfinclude template="../admin_area/includes/prop_top_nav.cfm">
<cfelseif url.order_type eq 'PR'>
<cfinclude template="../admin_area/includes/title_top_nav_pr.cfm">
<cfelseif url.order_type eq 'FDR'>
<cfinclude template="../admin_area/includes/title_top_nav_fdr.cfm">
<cfelseif url.order_type eq 'App'>
<cfinclude template="title_top_nav.cfm">
</cfif>

<!--- <cfif url.order_type eq 'T' or url.order_type eq 'P'>
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" colspan=8 align="left" valign="middle"><strong><font size=2>Quick View</font></strong></td>
<td bgcolor="#FFFFFF" colspan=2 align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.title_id#</cfoutput>&task=All&order_type=#order_type#','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr><tr>
<td bgcolor="#CCCCCC" width="75" align="left" valign="middle"><strong><font color="#000000">Abstract</font></strong>&nbsp;<cfif read_assigned_abstract.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif check_abstract.recordcount eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>


<td bgcolor="#CCCCCC" width="65" align="left" valign="middle"><strong><font color="#000000">Typing</font></strong>&nbsp;<cfif read_assigned_typing.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_typing.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>
<cfif url.order_type eq 'App'>
<td bgcolor="#CCCCCC" width="75" align="left" valign="middle"><strong><font color="#000000">Appraisal</font></strong>&nbsp;<cfif read_assigned_appraisal.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_appraisal.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>
</cfif>
<td bgcolor="#CCCCCC" width="75" align="left" valign="middle"><strong><font color="#000000">Tax Prep</font></strong>&nbsp;<cfif read_assigned_taxprep.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_taxprep.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>


<td bgcolor="#CCCCCC" width="50" align="left" valign="middle"><strong><font color="#000000">ICL</font></strong>&nbsp;<cfif read_assigned_icl.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_icl.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>

<td bgcolor="#CCCCCC" width="75" align="left" valign="middle"><strong><font color="#000000">Payoffs</font></strong>&nbsp;<cfif read_assigned_payoff.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_payoff.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>

<td bgcolor="#CCCCCC" width="85" align="left" valign="middle"><strong><font color="#000000">Deed Prep</font></strong>&nbsp;<cfif read_assigned_deedprep.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_deedprep.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>


<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">Closing Req.</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">Closing Sched.</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
</tr>


<td bgcolor="#CCCCCC" width="85" align="left" valign="middle"><strong><font color="#000000">REO Docs</font></strong>&nbsp;<cfif read_assigned_reo.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_reo.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>

<td bgcolor="#CCCCCC" width="85" align="left" valign="middle"><strong><font color="#000000">Recording</font></strong>&nbsp;<cfif read_assigned_recording.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_recording.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>


<td bgcolor="#CCCCCC" width="85" align="left" valign="middle"><strong><font color="#000000">Order Entry</font></strong>&nbsp;<cfif read_assigned_orderentry.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_orderentry.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>

</table>
</td>
</tr>
</table>
</cfif> --->
<a name="abstract_plot"></a>
<br>
<br>
<br>
<cfif url.order_type eq 'T' or url.order_type eq 'P' or  url.order_type eq 'PR' or url.order_type eq 'FDR'>
<!--- ABSTRACTOR --->
<form action="../admin_area/vendor_assign_abstract.cfm?uid=<cfoutput>#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#read_title.title_id#</cfoutput>" method="post" enctype="multipart/form-data" name="abstractor_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>ABSTRACT</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.title_id#</cfoutput>&task=Abstract&order_type=#order_type#','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif check_abstract.recordcount eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSEIF read_assigned_abstract.recordcount>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
<cfif read_assigned_abstract.recordcount>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_abstract.company#</cfoutput><br><BR>
<strong>Product Ordered</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#the_product# <cfif read_assigned_abstract.bring_to_date neq '1900-01-01 00:00:00.0'>#DateFormat(read_assigned_abstract.bring_to_date, "mm/dd/yyyy")#</cfif> </cfoutput><BR><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_abstract.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_abstract.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_abstract.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_abstract.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_abstract.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_abstract_assigned_by.fname# #read_abstract_assigned_by.lname#<br><br></cfoutput>
<cfif Len(read_assigned_abstract.assignment_upload) and read_assigned_abstract.assignment_upload neq 'NULL'>
<strong>File Sent to Abstractor</strong>:<br>
<cfoutput><A HREF="#fileSys.FindFilePath('#read_assigned_abstract.assignment_upload#', 'url')#" target="new">#read_assigned_abstract.assignment_upload#</a></cfoutput>
</cfif>
<cfelse>
Unassigned<BR><BR>
</cfif>
<cfif read_assigned_abstract.recordcount AND (session.ft_user_id EQ 462 OR session.ft_user_id EQ 458)>
<cfif order_type EQ "T">
<a href="../title_download_invoice.cfm?title_id=<cfoutput>#rec_id#</cfoutput>" target="_blank">Download Invoice</a>
<cfelse>
<a href="../prop_download_invoice.cfm?prop_id=<cfoutput>#rec_id#</cfoutput>" target="_blank">Download Invoice</a>
</cfif>
</cfif>

</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="top"><font size=2><cfif read_assigned_abstract.recordcount>RE-</cfif>ASSIGN THIS FILE<br>
</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="top">
Select Product first to get list of available Vendors<br>

<input type="radio" name="product_ordered" value="bring_to_date" onclick="document.abstractor_form.submit();" <cfif url.product_ordered eq 'bring_to_date'>checked</cfif>>Bring to Date&nbsp;&nbsp;<input type=text name="bring_to_date" VALUE="" size=6 maxlength=22

				style="width: 75px; ">&nbsp;<em>'mm/dd/yyyy'</em><br>
<input type="radio" name="product_ordered" value="full_search" onclick="document.abstractor_form.submit();" <cfif url.product_ordered eq 'full_search'>checked</cfif>>Full Search<br>
<input type="radio" name="product_ordered" value="ten_year" onclick="document.abstractor_form.submit();" <cfif url.product_ordered eq 'ten_year'>checked</cfif>>10-Year Search<br>
<input type="radio" name="product_ordered" value="current_owner" onclick="document.abstractor_form.submit();" <cfif url.product_ordered eq 'current_owner'>checked</cfif>>Current Owner Search with 24 month chain of title<br>
<input type="radio" name="product_ordered" value="doc_retrieval" onclick="document.abstractor_form.submit();" <cfif url.product_ordered eq 'doc_retrieval'>checked</cfif>>Document Retrieval<br>
<input type="radio" name="product_ordered" value="two_owner" onclick="document.abstractor_form.submit();" <cfif url.product_ordered eq 'two_owner'>checked</cfif>>Two Owner Search<br>
<input type="radio" name="product_ordered" value="bankruptcy" onclick="document.abstractor_form.submit();" <cfif url.product_ordered eq 'bankruptcy'>checked</cfif>>Bankruptcy<br>
<input type="checkbox" name="title_update" value="1">Title Update Only<br>
<input type="checkbox" name="taxes_from_search" value="1">Complete Taxes from Search<br>
<br>
<SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.abstractor_form.submit();">
				<OPTION VALUE="0" selected>To <cfif read_assigned_abstract.recordcount>re-</cfif>assign this file's Abstract work, select a product, then select a Vendor here</OPTION>
	<CFQUERY datasource="#request.dsn#" NAME="exceptions" maxrows="1">
	SELECT *
	FROM Underwriter_Default_Exceptions
	where comp_id = #read_title.comp_id#
	and state = '#read_title.pstate#'
	</CFQUERY>


<cfoutput query="read_abstractors">
					<cfif url.product_ordered neq ''>
					<OPTION VALUE="#read_abstractors.vendor_id#" <cfif url.selected_abstract_vendor_id eq read_abstractors.vendor_id>selected</cfif>>#read_abstractors.Company# ($#Evaluate("read_abstractors.#url.product_ordered#")#)</OPTION>
					</cfif>
</cfoutput>

				</select>
<cfif url.selected_abstract_vendor_id neq 0>
<cfset abstract_info_form_view = 'block'>
<cfelse>
<cfset abstract_info_form_view = 'none'>
</cfif><br>

<div id="abstract_info_form" style="display: <cfoutput>#abstract_info_form_view#</cfoutput>;">
<CFOUTPUT>
						<table width=450 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
							<tr>
								<td width=200 align=right valign=top bgcolor=f3f3f3>
									<font size=1 color=black face=arial>
									PRESENT OWNER:
								</td>
								<td width=250 align=left valign=top bgcolor=f3f3f3>
									<font size=1 color=blue face=arial>
									<cfif order_type EQ "T" or order_type EQ "P"><B>#read_title.sfirstname1# #read_title.sminame1# #read_title.slastname1#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_title.sssn1# </B><br>
									<B>#read_title.sfirstname2# #read_title.sminame2# #read_title.slastname2#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_title.sssn2#</B><cfelse>&nbsp;</cfif>
								</td>
							</tr>
							<tr>
								<td width=200 align=right valign=top bgcolor=f3f3f3>
									<font size=1 color=black face=arial>
									PURCHASER:
								</td>
								<td width=250 align=left valign=top bgcolor=f3f3f3>
									<font size=1 color=blue face=arial>
									<B>#read_title.bfirstname1# #read_title.bminame1# #read_title.blastname1#&nbsp;&nbsp;&nbsp;&nbsp;SSN: #read_title.bssn1#
									<cfif #read_title.bhphone1# neq "">
										<br>Phone: #read_title.bhphone1#
									</cfif>
										</B><br>
									<CFIF #READ_TITLE.BLASTNAME2# NEQ "">
										<B>#read_title.bfirstname2# #read_title.bminame2# #read_title.blastname2#&nbsp;&nbsp;&nbsp;&nbsp;SSN: #read_title.bssn2#
										<cfif #read_title.bhphone2# neq "">
											<br>Phone: #read_title.bhphone2#
										</cfif>
										</B>
										</CFIF>
								</td>
							</tr>
		<!--- =========================================================== --->
							<tr>
								<td width=200 align=right valign=top bgcolor=f3f3f3>
									<font size=1 color=black face=arial>
									PROPERTY ADDRESS:
								</td>
								<td width=250 align=left valign=top bgcolor=f3f3f3>
									<font size=1 color=blue face=arial>
									<B>#read_title.paddress#</B><br>
									<font size=1 color=blue face=arial>
									<B>#read_title.pcity#,</B>&nbsp;
									<font size=1 color=blue face=arial>
									<B>#read_title.pstate#</B>&nbsp;
									<font size=1 color=blue face=arial>
									<B>#read_title.pzip#</B><br>
								</td>
							</tr>
							<tr>
								<td width=200 align=right valign=top bgcolor=f3f3f3>
									<font size=1 color=black face=arial>
									COUNTY:
								</td>
								<td width=250 align=left valign=top bgcolor=f3f3f3>
									<font size=1 color=blue face=arial>
									<B>#read_title.pcounty#</B>
								</td>
							</tr>
						</table>
<!--- =========================================================== --->
<table width=450 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
							<tr>
								<td width=450 colspan=2  align=left valign=top bgcolor=f3f3f3>
									<font size=2 color=black face=arial>
									<B>Instructions:</B>
									<p>
								</td>
								<td width=450 colspan=2  align=left valign=top bgcolor=f3f3f3>
								<textarea name="Instructions" cols="30" rows="10"></textarea>
								</td>
							</tr>
							<tr>
								<td width=450 colspan=2  align=left valign=top bgcolor=f3f3f3>
									<font size=2 color=black face=arial>
									<B>File Upload for Vendor:</B>
									<p>
								</td>
								<td width=450 colspan=2  align=left valign=top bgcolor=f3f3f3>
								<input type="file" name="assignment_upload" style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none; width: 350px;">
								</td>
							</tr>
							<TR>
								<td>
								   <cfif #retrieve_user.recordcount# GT 0>
								   		<li>PLEASE FAX REPORT TO #retrieve_user.fax# OR EMAIL TO
										<a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a>
									</cfif>
									</UL>
								</td>
							</tr>
						</table>

				<input type="hidden" name="company_id" value="#url.company_id#">
				<input type="hidden" name="uid" value="#URL.uid#">
				<input type="hidden" name="al" value="#URL.al#">
				<input type="hidden" name="rec_id" value="#rec_id#">
				<input type="hidden" name="owner" value="<cfif order_type EQ "T" or order_type EQ "P">#read_title.sfirstname1# #read_title.sminame1# #read_title.slastname1# #read_title.sfirstname2# #read_title.sminame2# #read_title.slastname2# #read_title.sssn1# #read_title.sssn2#</cfif>">
				<input type="hidden" name="purchaser" value="#read_title.bfirstname1# #read_title.bminame1# #read_title.blastname1# #read_title.bfirstname2# #read_title.bminame2# #read_title.blastname2# #read_title.bssn2# #read_title.bssn2#">
				<input type="hidden" name="addr" value="#read_title.paddress#">
				<input type="hidden" name="city" value="#read_title.pcity#">
				<input type="hidden" name="state" value="#read_title.pstate#">
				<input type="hidden" name="zip" value="#read_title.pzip#">
				<input type="hidden" name="county" value="#read_title.pcounty#">
				<!---input type="hidden" name="est" value="#NumberFormat(read_title.estimate_value, "999,999,999.99")#"> --->
						<table width=450 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
							<tr>
								<td width=450 colspan=2 align=center valign=top bgcolor=e1e1e1>
									<b>This information will be sent as an email or fax depending on Vendor's option</b>
								</td>
							</tr>
						</table>
			</CFOUTPUT>
			<br>
<br>
<br>
</div>
<cfif url.selected_abstract_vendor_id eq 0>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</cfif>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="abstract_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="abs_commit" value="0"><input name="abstract_assign_button" type="button" value="<cfif read_assigned_abstract.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.abstractor_form.abs_commit.value=1;document.abstractor_form.submit();" ><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong><br>
</td>

</tr>

<cfif url.product_ordered neq '' and url.selected_abstract_vendor_id neq 0>
<script language="javascript">
fill_abstractor_prices();
</script>
</cfif>


<tr>
<td colspan=3>
<table width="800" cellpadding=0 cellspacing=0><tr bgcolor=000000>
<td bgcolor="#CCCCCC" width="266" align="left" valign="top">
<cfif url.order_type eq 'T'>
<cfquery DATASOURCE="#request.dsn#" name="get_file" >
	SELECT abstractor_doc_upload
	FROM  Doc_Abstract_Title
	WHERE title_id = #read_title.title_ID#
</CFQUERY>
<cfelseif url.order_type eq 'P'>
<cfquery DATASOURCE="#request.dsn#" name="get_file" >
	SELECT abstractor_doc_upload
	FROM  Doc_Abstract_Prop
	WHERE prop_id = #read_title.title_ID#
</CFQUERY>
<cfelseif url.order_type eq 'PR'>
<cfquery DATASOURCE="#request.dsn#" name="get_file" >
	SELECT abstractor_doc_upload
	FROM  Doc_Abstract_PR
	WHERE PR_id = #read_title.title_ID#
</CFQUERY>
<cfelseif url.order_type eq 'FDR'>
<cfquery DATASOURCE="#request.dsn#" name="get_file" >
	SELECT abstractor_doc_upload
	FROM  Doc_Abstract_FDR
	WHERE FDR_id = #read_title.title_ID#
</CFQUERY>
</cfif>
<cfoutput query="get_file">
<table width="100%" cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF align="left">
	<tr>
	<td valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=1 FACE=ARIAL>
	<CFIF get_file.abstractor_doc_upload EQ "">
	Upload file 1<br>
<input type="file" name="file_upload1"><br>
	<input type="hidden" name="upload_file1" value="0">
	<input type="hidden" name="delete_file1" value="0">
	<input type="button" value="Upload File"  onclick="document.abstractor_form.upload_file1.value=1;document.abstractor_form.submit();"><br>
Completed by:<br>
<input type="radio" name="abstract_completed_by" value="In-House"> In-House <input type="radio" name="abstract_completed_by" value="abstractor"> assigned Abstractor
	</td>
	</tr>
	<CFELSE>
	<tr>
	<td align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>Uploaded file:<br>
	<A HREF="#fileSys.FindFilePath('#get_file.abstractor_doc_upload#', 'url')#" target="new">#Mid(get_file.abstractor_doc_upload, 1, 20)#<cfif Len(get_file.abstractor_doc_upload) GT 20>...</cfif></a><br>
	<a href="vendor_assign_abstract.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#&delete_file=1">delete</a></TD></tr></NOBR>
	</CFIF>
</table>
</cfoutput>
</td>
<td bgcolor="#CCCCCC" width="266" align="left" valign="top">
<cfif url.order_type eq 'T'>
<cfquery DATASOURCE="#request.dsn#" name="get_file2" >
	SELECT abstractor_doc_upload2
	FROM  Doc_Abstract_Title
	WHERE title_id = #read_title.title_ID#
</CFQUERY>
<cfelseif url.order_type eq 'P'>
<cfquery DATASOURCE="#request.dsn#" name="get_file2" >
	SELECT abstractor_doc_upload2
	FROM  Doc_Abstract_Prop
	WHERE prop_id = #read_title.title_ID#
</CFQUERY>
<cfelseif url.order_type eq 'PR'>
<cfquery DATASOURCE="#request.dsn#" name="get_file2" >
	SELECT abstractor_doc_upload2
	FROM  Doc_Abstract_PR
	WHERE pr_id = #read_title.title_ID#
</CFQUERY>
<cfelseif url.order_type eq 'FDR'>
<cfquery DATASOURCE="#request.dsn#" name="get_file2" >
	SELECT abstractor_doc_upload2
	FROM  Doc_Abstract_FDR
	WHERE FDR_id = #read_title.title_ID#
</CFQUERY>
</cfif>
<cfoutput query="get_file2">
<table width="100%" cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
	<tr>
	<td valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=1 FACE=ARIAL>
	<CFIF get_file2.abstractor_doc_upload2 EQ "">
	Upload file 2<br>
<input type="file" name="file_upload2"><br>
	<input type="hidden" name="upload_file2" value="0">
	<input type="hidden" name="delete_file2" value="0">
	<input type="button" value="Upload File"  onclick="document.abstractor_form.upload_file2.value=1;document.abstractor_form.submit();"><br>
<br>
<br>
	</td>
	</tr>
	<CFELSE>
	<tr>
	<td align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>Uploaded file:<br>
<A HREF="#fileSys.FindFilePath('#get_file2.abstractor_doc_upload2#', 'url')#" target="new">#Mid(get_file2.abstractor_doc_upload2, 1, 20)#<cfif Len(get_file2.abstractor_doc_upload2) GT 20>...</cfif></a><br>
	<a href="./delete-uploaded-file2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>
	</CFIF>
</table>
</cfoutput>
</td>
<td bgcolor="#CCCCCC" width="266" align="left" valign="top">
<cfif url.order_type eq 'T'>
<cfquery DATASOURCE="#request.dsn#" name="get_file3" >
	SELECT abstractor_doc_upload3
	FROM  Doc_Abstract_Title
	WHERE title_id = #read_title.title_ID#
</CFQUERY>
<cfelseif url.order_type eq 'P'>
<cfquery DATASOURCE="#request.dsn#" name="get_file3" >
	SELECT abstractor_doc_upload3
	FROM  Doc_Abstract_Prop
	WHERE prop_id = #read_title.title_ID#
</CFQUERY>
<cfelseif url.order_type eq 'PR'>
<cfquery DATASOURCE="#request.dsn#" name="get_file3" >
	SELECT abstractor_doc_upload3
	FROM  Doc_Abstract_PR
	WHERE pr_id = #read_title.title_ID#
</CFQUERY>
<cfelseif url.order_type eq 'FDR'>
<cfquery DATASOURCE="#request.dsn#" name="get_file3" >
	SELECT abstractor_doc_upload3
	FROM  Doc_Abstract_FDR
	WHERE FDR_id = #read_title.title_ID#
</CFQUERY>
</cfif>
<cfoutput query="get_file3">
<table width="100%" cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
	<tr>
	<td valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=1 FACE=ARIAL>
	<CFIF get_file3.abstractor_doc_upload3 EQ "">
	Upload file 3<BR>
<input type="file" name="file_upload3"><br>
	<input type="hidden" name="upload_file3" value="0">
	<input type="hidden" name="delete_file3" value="0">
	<input type="button" value="Upload File"  onclick="document.abstractor_form.upload_file3.value=1;document.abstractor_form.submit();"><br>
<br>
<br>
	</td>
	</tr>
	<CFELSE>
	<tr>
	<td align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>Uploaded file:<br>
<A HREF="#fileSys.FindFilePath('#get_file3.abstractor_doc_upload3#', 'url')#" target="new">#Mid(get_file3.abstractor_doc_upload3, 1, 20)#<cfif Len(get_file3.abstractor_doc_upload3) GT 20>...</cfif></a><br>
	<a href="./delete-uploaded-file3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>
	</CFIF>
</table>
</cfoutput>


</td>
</tr></table>
</td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>
<!--- END ABSTRACTOR --->
</cfif>


<cfif url.order_type eq 'T' or url.order_type eq 'P' or url.order_type eq 'PR' or url.order_type eq 'FDR'>
<a name="typing_plot"></a>
<br>
<br>
<!--- TYPING --->
<form action="../admin_area/vendor_assign_typing.cfm?uid=<cfoutput>#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#read_title.title_id#</cfoutput>" method="post" name="typing_form" ID="typing_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>TYPING</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.title_id#</cfoutput>&task=Typing&order_type=#order_type#','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_typing.recordcount>
<cfif read_assigned_typing.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_typing.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_typing.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_typing.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_typing.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_typing.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_typing.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_typing_assigned_by.fname# #read_typing_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_typing.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.typing_form.submit();">

<CFQUERY datasource="#request.dsn#" NAME="check_inhouse">
            SELECT *
			FROM Title_Companies_States
			WHERE title_co_id = 19
			and st_abbrev = '#read_title.pstate#'
			ORDER BY st_abbrev ASC
</cfquery>

<!--- <cfif check_inhouse.recordcount eq 0>
		<OPTION VALUE="0" selected>To <cfif read_assigned_typing.recordcount>re-</cfif>assign this file's Typing work, select a Vendor here</OPTION>
		<cfif read_typing.recordcount>
		<cfoutput query="read_typing">
		<OPTION VALUE="#read_typing.vendor_id#" <cfif url.selected_typing_vendor_id eq read_typing.vendor_id>selected</cfif>>#read_typing.Company# ($#read_typing.typing_fee#)</OPTION>
		</cfoutput>
		</cfif>
<cfelse>
		<OPTION VALUE="0" selected style="color:#FF0000;">Title Commitment must be uploaded, do not assign to typing</OPTION>
</cfif> --->




		<OPTION VALUE="0" selected>To <cfif read_assigned_typing.recordcount>re-</cfif>assign this file's Typing work, select a Vendor here</OPTION>
		<cfif read_typing.recordcount>
		<cfoutput query="read_typing">
		<OPTION VALUE="#read_typing.vendor_id#" <cfif url.selected_typing_vendor_id eq read_typing.vendor_id>selected</cfif>>#read_typing.Company# ($#read_typing.typing_fee#)</OPTION>
		</cfoutput>
		</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="typing_price" id="typing_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="typing_commit" value="0"><input type="button" value="<cfif read_assigned_typing.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.typing_form.typing_commit.value=1;document.typing_form.submit();" name="typing_assign_button" ><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_typing_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_typing_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%'  and p.vendor_id = #url.selected_typing_vendor_id#)
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%'  and p.vendor_id = #url.selected_typing_vendor_id#)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%'  and p.vendor_id = #url.selected_typing_vendor_id#)
			 and p.vendor_id = s.vendor_id
			
</CFQUERY>

<cfoutput>
<script language="javascript">
document.typing_form.typing_price.value = "#read_typing_pricing.typing_fee#";
</script>
</cfoutput>
</cfif>

<!--- END TYPING --->
</cfif>





<cfif url.order_type eq 'T' or url.order_type eq 'P' or url.order_type eq 'PR' or url.order_type eq 'FDR'>
<a name="review_plot"></a>
<br>
<br>
<!--- COMMITTMENT REVIEW --->
<form action="../admin_area/vendor_assign_review.cfm?uid=<cfoutput>#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#read_title.title_id#</cfoutput>" method="post" name="review_form" ID="review_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="review_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>COMMITMENT REVIEW</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.title_id#</cfoutput>&task=Review&order_type=#order_type#','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_review.recordcount>
<cfif read_assigned_review.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_review.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_review.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_review.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_review.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_review.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_review.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_review_assigned_by.fname# #read_review_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_review.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.review_form.submit();">
				<OPTION VALUE="0" selected>To <cfif read_assigned_review.recordcount>re-</cfif>assign this file's Commitment Review work, select a Vendor here</OPTION>
<cfif read_review.recordcount>
<cfoutput query="read_review">
					<OPTION VALUE="#read_review.vendor_id#" <cfif url.selected_review_vendor_id eq read_review.vendor_id>selected</cfif>>#read_review.Company# ($#read_review.review_fee#)</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="review_price" id="review_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="review_commit" value="0"><input type="button" value="<cfif read_assigned_review.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.review_form.review_commit.value=1;document.review_form.submit();" name="review_assign_button" ><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_review_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_review_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Review' and s.service_type LIKE '%Review%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Review' and s.service_type LIKE '%Review%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Review' and s.service_type LIKE '%Review%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_review_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.review_form.review_price.value = "#read_review_pricing.review_fee#";
</script>
</cfoutput>
</cfif>

<!--- END COMMITMENT REVIEW --->
</cfif>

<cfif url.order_type eq 'App'>
<a name="appraisal_plot"></a>
<br>


<!--- APPRAISAL --->
<form action="../admin_area/vendor_assign_appraisal.cfm?uid=<cfoutput>#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#read_title.app_id#&order_type=App</cfoutput>" method="post" name="appraisal_form" ID="appraisal_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.app_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>APPRAISAL</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.app_id#</cfoutput>&task=Appraisal&order_type=App','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_appraisal.recordcount>
<cfif read_assigned_appraisal.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_appraisal.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_appraisal.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_appraisal.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_appraisal.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_appraisal.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_appraisal.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_appraisal_assigned_by.fname# #read_appraisal_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_appraisal.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.appraisal_form.submit();">
				<OPTION VALUE="0" selected>To <cfif read_assigned_appraisal.recordcount>re-</cfif>assign this file's Appraisal work, select a Vendor here</OPTION>
<cfif read_appraisall.recordcount>
<CFQUERY DATASOURCE="#request.dsn#" NAME="find_this_file">
select * from appraisal where app_id = '#read_title.app_id#'
</cfquery>
<cfset current_vendor = 0>
<cfoutput query="read_appraisall">
<cfif read_appraisall.vendor_id eq 10>
<cfif IsDefined("find_this_file.estimate_value") and find_this_file.estimate_value GTE 1000000>
<cfset read_appraisall.appraisal_fee = read_appraisall.appraisal_fee + 150>
<cfelseif IsDefined("find_this_file.estimate_value") and find_this_file.estimate_value GTE 500000>
<cfset read_appraisall.appraisal_fee = read_appraisall.appraisal_fee + 75>
</cfif>
</cfif>
<cfif read_appraisall.vendor_id neq current_vendor>
					<OPTION VALUE="#read_appraisall.vendor_id#" <cfif url.selected_appraisal_vendor_id eq read_appraisall.vendor_id>selected</cfif>>#read_appraisall.Company# ($#read_appraisall.appraisal_fee#)</OPTION>
</cfif>
<cfset current_vendor = read_appraisall.vendor_id>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="appraisal_price" id="appraisal_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="appraisal_commit" value="0"><input type="button" value="<cfif read_assigned_appraisal.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.appraisal_form.appraisal_commit.value=1;document.appraisal_form.submit();"  name="appraisal_assign_button" ><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_appraisal_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_appraisal_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_appraisal_vendor_id#
</CFQUERY>
<cfif read_appraisal_pricing.recordcount eq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_appraisal_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_appraisal_vendor_id#
</CFQUERY>
</cfif>
<cfif read_appraisal_pricing.recordcount eq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_appraisal_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = 'All' and p.county = 'All'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_appraisal_vendor_id#
</CFQUERY>
</cfif>

<cfif url.selected_appraisal_vendor_id eq 10>
<cfif IsDefined("find_this_file.estimate_value") and find_this_file.estimate_value GTE 1000000>
<cfset read_appraisal_pricing.appraisal_fee = read_appraisal_pricing.appraisal_fee + 150>
<cfelseif IsDefined("find_this_file.estimate_value") and find_this_file.estimate_value GTE 500000>
<cfset read_appraisal_pricing.appraisal_fee = read_appraisal_pricing.appraisal_fee + 75>
</cfif>
</cfif>

<cfoutput>
<script language="javascript">
document.appraisal_form.appraisal_price.value = "#read_appraisal_pricing.appraisal_fee#";
</script>
</cfoutput>
</cfif>

<!--- END APPRAISAL --->
</cfif>





<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<a name="taxprep_plot"></a>

<br>


<!--- taxprep --->
<form action="../admin_area/vendor_assign_taxprep.cfm?uid=<cfoutput>#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#read_title.title_id#</cfoutput>" method="post" name="taxprep_form" ID="taxprep_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>TAX PREPARATION</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.title_id#</cfoutput>&task=TaxPrep&order_type=#order_type#','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_taxprep.recordcount>
<cfif read_assigned_taxprep.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_taxprep.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_taxprep.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_taxprep.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_taxprep.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_taxprep.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_taxprep.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_taxprep_assigned_by.fname# #read_taxprep_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_taxprep.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.taxprep_form.submit();">
				<OPTION VALUE="0" selected>To <cfif read_assigned_taxprep.recordcount>re-</cfif>assign this file's Tax Preparation work, select a Vendor here</OPTION>
<cfif read_taxprep.recordcount>
<cfoutput query="read_taxprep">
					<OPTION VALUE="#read_taxprep.vendor_id#" <cfif url.selected_taxprep_vendor_id eq read_taxprep.vendor_id>selected</cfif>>#read_taxprep.Company# ($#read_taxprep.taxprep_fee#)</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="taxprep_price" id="taxprep_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="taxprep_commit" value="0"><input type="button" value="<cfif read_assigned_taxprep.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.taxprep_form.taxprep_commit.value=1;document.taxprep_form.submit();"  name="taxprep_assign_button" ><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_taxprep_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_taxprep_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_taxprep_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.taxprep_form.taxprep_price.value = "#read_taxprep_pricing.taxprep_fee#";
</script>
</cfoutput>
</cfif>

<!--- END taxprep --->
</cfif>

<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<a name="icl_plot"></a>

<br>


<!--- ICL --->
<form action="../admin_area/vendor_assign_ICL.cfm?uid=<cfoutput>#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#read_title.title_id#</cfoutput>" method="post" name="ICL_form" ID="ICL_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>ICL PREPARATION</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.title_id#</cfoutput>&task=ICL&order_type=#order_type#','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_ICL.recordcount>
<cfif read_assigned_ICL.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_ICL.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_ICL.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_ICL.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_ICL.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_ICL.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_ICL.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_ICL_assigned_by.fname# #read_ICL_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_ICL.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.ICL_form.submit();">
				<OPTION VALUE="0" selected>To <cfif read_assigned_ICL.recordcount>re-</cfif>assign this file's ICL preparation work, select a Vendor here</OPTION>
<cfif read_ICL.recordcount>
<cfoutput query="read_ICL">
					<OPTION VALUE="#read_ICL.vendor_id#" <cfif url.selected_ICL_vendor_id eq read_ICL.vendor_id>selected</cfif>>#read_ICL.Company# ($#read_icl.icl_fee#)</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="ICL_price" id="ICL_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="ICL_commit" value="0"><input type="button" value="<cfif read_assigned_ICL.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.ICL_form.ICL_commit.value=1;document.ICL_form.submit();"  name="icl_assign_button" ><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong><!---<br><br>
<input type="checkbox" name="include_update">This is an update to an existing ICL---></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_ICL_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_ICL_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_ICL_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.ICL_form.ICL_price.value = "#read_ICL_pricing.ICL_fee#";
</script>
</cfoutput>
</cfif>

<!--- END ICL --->
</cfif>


<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<a name="payoff_plot"></a>

<br>


<!--- payoff --->
<form action="../admin_area/vendor_assign_payoff.cfm?uid=<cfoutput>#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#read_title.title_id#</cfoutput>" method="post" name="payoff_form" ID="payoff_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>PAYOFFS</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.title_id#</cfoutput>&task=Payoff&order_type=#order_type#','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_payoff.recordcount>
<cfif read_assigned_payoff.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_payoff.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_payoff.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_payoff.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_payoff.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_payoff.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_payoff.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_payoff_assigned_by.fname# #read_payoff_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_payoff.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.payoff_form.submit();">
				<OPTION VALUE="0" selected>To <cfif read_assigned_payoff.recordcount>re-</cfif>assign this file's Payoff work, select a Vendor here</OPTION>
<cfif read_payoff.recordcount>
<cfoutput query="read_payoff">
					<OPTION VALUE="#read_payoff.vendor_id#" <cfif url.selected_payoff_vendor_id eq read_payoff.vendor_id>selected</cfif>>#read_payoff.Company# ($#read_payoff.payoff_fee#)</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="payoff_price" id="payoff_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="payoff_commit" value="0"><input type="button" value="<cfif read_assigned_payoff.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.payoff_form.payoff_commit.value=1;document.payoff_form.submit();"  name="payoff_assign_button" ><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_payoff_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_payoff_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_payoff_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.payoff_form.payoff_price.value = "#read_payoff_pricing.payoff_fee#";
</script>
</cfoutput>
</cfif>

<!--- END payoff --->
</cfif>

<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<a name="deedprep_plot"></a>

<br>


<!--- deedprep --->
<form action="../admin_area/vendor_assign_deedprep.cfm?uid=<cfoutput>#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#read_title.title_id#</cfoutput>" method="post" name="deedprep_form" ID="deedprep_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>DEED PREPARATION</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.title_id#</cfoutput>&task=DeedPrep&order_type=#order_type#','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_deedprep.recordcount>
<cfif read_assigned_deedprep.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_deedprep.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_deedprep.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_deedprep.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_deedprep.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_deedprep.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_deedprep.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_deedprep_assigned_by.fname# #read_deedprep_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_deedprep.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.deedprep_form.submit();">
				<OPTION VALUE="0" selected>To <cfif read_assigned_deedprep.recordcount>re-</cfif>assign this file's Deed Preparation work, select a Vendor here</OPTION>
<cfif read_deedprep.recordcount>
<cfoutput query="read_deedprep">
					<OPTION VALUE="#read_deedprep.vendor_id#" <cfif url.selected_deedprep_vendor_id eq read_deedprep.vendor_id>selected</cfif>>#read_deedprep.Company# ($#read_deedprep.deedprep_fee#)</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="deedprep_price" id="deedprep_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="deedprep_commit" value="0"><input type="button" value="<cfif read_assigned_deedprep.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.deedprep_form.deedprep_commit.value=1;document.deedprep_form.submit();"  name="deedprep_assign_button" ><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_deedprep_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_deedprep_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'deedprep' and s.service_type LIKE '%deedprep%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'deedprep' and s.service_type LIKE '%deedprep%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'deedprep' and s.service_type LIKE '%deedprep%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_deedprep_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.deedprep_form.deedprep_price.value = "#read_deedprep_pricing.deedprep_fee#";
</script>
</cfoutput>
</cfif>

<!--- END deedprep --->
</cfif>
<a name="reo_plot"></a>

<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<!--- REO --->
<form action="../admin_area/vendor_assign_REO.cfm?uid=<cfoutput>#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#read_title.title_id#&order_type=#url.order_type#&code=#url.order_type#</cfoutput>" method="post" name="REO_form" ID="REO_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>REO PACKAGE RETRIEVAL</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.title_id#</cfoutput>&task=REO&order_type=#order_type#','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_REO.recordcount>
<cfif read_assigned_REO.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_REO.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_REO.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_REO.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_REO.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_REO.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_REO.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_REO_assigned_by.fname# #read_REO_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_REO.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.REO_form.submit();">
				<OPTION VALUE="0" selected>To <cfif read_assigned_REO.recordcount>re-</cfif>assign this file's REO Package Retrieval work, select a Vendor here</OPTION>
<cfif read_REO.recordcount>
<cfoutput query="read_REO">
					<OPTION VALUE="#read_REO.vendor_id#" <cfif url.selected_REO_vendor_id eq read_REO.vendor_id>selected</cfif>>#read_REO.Company# ($#read_reo.reo_fee#)</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br>
<cfquery DATASOURCE="#request.dsn#" name="get_file" >
	SELECT reo_package
	FROM  Title
	WHERE title_id = #read_title.title_ID#
</CFQUERY>
<cfoutput query="get_file">
<table width="100%" cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF align="left">
	<tr>
	<td valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=1 FACE=ARIAL>
	<CFIF get_file.reo_package EQ "" or get_file.reo_package EQ "NULL">
	Upload REO Package<br>
<input type="file" name="file_reo"><br>
	<input type="hidden" name="upload_reo" value="0">
	<input type="hidden" name="delete_reo" value="0">
	<input type="button" value="Upload File"  onclick="document.reo_form.upload_reo.value=1;document.reo_form.submit();"><br>
Completed by:<br>
<input type="radio" name="reo_completed_by" value="In-House"> In-House <input type="radio" name="reo_completed_by" value="vendor"> assigned Vendor
	</td>
	</tr>
	<CFELSE>
	<tr>
	<td align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>Uploaded REO Package:<br>
<A HREF="https://#cgi.server_name#/admin_area/uploads/#get_file.reo_package#" target="new">#Mid(get_file.reo_package, 1, 20)#<cfif Len(get_file.reo_package) GT 20>...</cfif></a><br>
	<a href="vendor_assign_reo.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#&delete_file=1">delete</a></TD></tr></NOBR>
	</CFIF>
</table>
</cfoutput>
<br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="REO_price" id="REO_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="REO_commit" value="0"><input type="button" value="<cfif read_assigned_REO.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.REO_form.REO_commit.value=1;document.REO_form.submit();"  name="reo_assign_button" ><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_REO_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_REO_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'REO' and s.service_type LIKE '%REO%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'REO' and s.service_type LIKE '%REO%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'REO' and s.service_type LIKE '%REO%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_REO_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.REO_form.REO_price.value = "#read_REO_pricing.REO_fee#";
</script>
</cfoutput>
</cfif>

<!--- END REO --->
</cfif>

<!--- <cfif url.order_type eq 'T' or url.order_type eq 'P'>
<a name="recording_plot"></a>

<br>


<!--- recording --->
<form action="../admin_area/vendor_assign_recording.cfm?uid=<cfoutput>#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#read_title.title_id#</cfoutput>" method="post" name="recording_form" ID="recording_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>RECORDING SERVICES</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.title_id#</cfoutput>&task=recording&order_type=#order_type#','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_recording.recordcount>
<cfif read_assigned_recording.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_recording.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_recording.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_recording.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_recording.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_recording.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_recording.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_recording_assigned_by.fname# #read_recording_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_recording.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.recording_form.submit();">
				<OPTION VALUE="0" selected>To <cfif read_assigned_recording.recordcount>re-</cfif>assign this file's Recording Services work, select a Vendor here</OPTION>
<cfif read_recording.recordcount>
<cfoutput query="read_recording">
					<OPTION VALUE="#read_recording.vendor_id#" <cfif url.selected_recording_vendor_id eq read_recording.vendor_id>selected</cfif>>#read_recording.Company# ($#read_recording.recording_fee#)</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="recording_price" id="recording_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="recording_commit" value="0"><input type="button" value="<cfif read_assigned_recording.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.recording_form.recording_commit.value=1;document.recording_form.submit();"  name="recording_assign_button" ><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_recording_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_recording_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'recording' and s.service_type LIKE '%recording%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'recording' and s.service_type LIKE '%recording%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'recording' and s.service_type LIKE '%recording%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_recording_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.recording_form.recording_price.value = #read_recording_pricing.recording_fee#;
</script>
</cfoutput>
</cfif>

<!--- END recording --->
</cfif>



<cfif url.order_type eq 'T' or url.order_type eq 'P'>
<a name="orderentry_plot"></a>

<br>


<!--- orderentry --->
<form action="../admin_area/vendor_assign_orderentry.cfm?uid=<cfoutput>#url.uid#&al=#url.al#&company_id=#url.company_id#&rec_id=#read_title.title_id#</cfoutput>" method="post" name="orderentry_form" ID="orderentry_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>ORDER ENTRY/OPENING</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2 color="blue"><a onClick="window.open('https://www.firsttitleservices.com/admin_area/vendor_file_history.cfm?rec_id=<cfoutput>#read_title.title_id#</cfoutput>&task=orderentry&order_type=#order_type#','myhistorywindow','width=610,height=400,scrollbars=yes')">history</a></font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="800">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_orderentry.recordcount>
<cfif read_assigned_orderentry.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_orderentry.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_orderentry.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_orderentry.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_orderentry.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_orderentry.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_orderentry.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_orderentry_assigned_by.fname# #read_orderentry_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_orderentry.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.orderentry_form.submit();">
				<OPTION VALUE="0" selected>To <cfif read_assigned_orderentry.recordcount>re-</cfif>assign this file's Order Entry work, select a Vendor here</OPTION>
<cfif read_orderentry.recordcount>
<cfoutput query="read_orderentry">
					<OPTION VALUE="#read_orderentry.vendor_id#" <cfif url.selected_orderentry_vendor_id eq read_orderentry.vendor_id>selected</cfif>>#read_orderentry.Company# ($#read_orderentry.orderentry_fee#)</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="orderentry_price" id="orderentry_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="orderentry_commit" value="0"><input type="button" value="<cfif read_assigned_orderentry.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.orderentry_form.orderentry_commit.value=1;document.orderentry_form.submit();"  name="orderentry_assign_button" ><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_orderentry_vendor_id neq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_orderentry_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'orderentry' and s.service_type LIKE '%orderentry%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'orderentry' and s.service_type LIKE '%orderentry%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'orderentry' and s.service_type LIKE '%orderentry%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_orderentry_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.orderentry_form.orderentry_price.value = #read_orderentry_pricing.orderentry_fee#;
</script>
</cfoutput>
</cfif>

<!--- END orderentry --->
</cfif> --->

</body>
</html>
