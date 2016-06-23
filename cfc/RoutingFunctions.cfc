<cfcomponent>



<cffunction name="CheckForRouting" output="true" returntype="string" >
<cfargument name="file_id" default="">
<cfargument name="file_type" default="">
<cfargument name="trigger_point" default="">

<cfset ReturnAction = 'none'>
<!--- first get the file info --->
<cfif arguments.file_type eq 'P'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, prop_ID AS order_ID
	FROM Property
	WHERE prop_ID = #arguments.file_id#
</CFQUERY>
<cfelseif arguments.file_type eq 'T'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, title_ID AS order_ID
	FROM Title
	WHERE title_ID = #arguments.file_id#
</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="check_test_companies">
	SELECT company, test_account
	FROM Companies
	WHERE ID = #get_file_info.comp_id#
</CFQUERY>

<!--- (check_test_companies.test_account neq 'True' and check_test_companies.test_account neq 1 and MID(check_test_companies.company, 1, 4) neq 'test' and get_file_info.streamline_client neq 'True' and get_file_info.streamline_client neq 1 and get_file_info.comp_id eq 1754) or (get_file_info.comp_id eq 1754) --->

<cfif (get_file_info.comp_id eq 8258)>


<CFQUERY datasource="#request.dsn#" NAME="check_companies_routing">
	SELECT *
	FROM Companies_Routing
	WHERE 
<!--- now check to see if there is any routing set up specifically for this client, in this state at this trigger_point --->
	(comp_id = #get_file_info.comp_id#
	and state = '#get_file_info.pstate#'
	and file_type = '#arguments.file_type#'
	and trigger_point = '#arguments.trigger_point#')
</cfquery>
<!--- ok, not found, so check to see if there is any routing set up specifically for this client, in  ALL states, at this trigger_point --->
<cfif check_companies_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_companies_routing">
	SELECT *
	FROM Companies_Routing
	WHERE 
	(comp_id = #get_file_info.comp_id#
	and state = '0'
	and file_type = '#arguments.file_type#'
	and trigger_point = '#arguments.trigger_point#')
</cfquery>
</cfif>	
<!--- ok, still not found, so check to see if there is any routing set up specifically for ALL clients, in  this state, at this trigger_point --->	
<cfif check_companies_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_companies_routing">
	SELECT *
	FROM Companies_Routing
	WHERE 
	(comp_id = 0
	and state = '#get_file_info.pstate#'
	and file_type = '#arguments.file_type#'
	and trigger_point = '#arguments.trigger_point#')
</cfquery>
</cfif>	

<!--- ok, still not found, so finally check to see if there is any routing set up for ALL clients, in  ALL states, at this trigger_point --->	
<cfif check_companies_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_companies_routing">
	SELECT *
	FROM Companies_Routing
	WHERE 
	(comp_id = 0
	and state = '0'
	and file_type = '#arguments.file_type#'
	and trigger_point = '#arguments.trigger_point#')
</cfquery>
</cfif>	

<cfif check_companies_routing.recordcount gt 0>

<cfoutput query="check_companies_routing">
<cfset ReturnAction = check_companies_routing.Event_Name>
<cfif ReturnAction eq 'Order_Abstract'>
<cfset temp = #TriggerOrderAbstract(arguments.file_id,arguments.file_type)#>
<cfelseif ReturnAction eq 'Order_Inhouse_Abstract'>
<cfset temp = #TriggerOrderInhouseAbstract(arguments.file_id,arguments.file_type)#>
<cfelseif ReturnAction eq 'Order_Taxes'>
<cfset temp = #TriggerOrderTaxes(arguments.file_id,arguments.file_type)#>
<cfelseif ReturnAction eq 'Order_ICL'>
<cfset temp = #TriggerOrderICL(arguments.file_id,arguments.file_type)#>
<cfelseif ReturnAction eq 'Order_Typing'>
<cfset temp = #TriggerOrderTyping(arguments.file_id,arguments.file_type)#>
</cfif>
</cfoutput>
<cfelse>
<!--- ok, nothing found, so don't do anything --->

</cfif>
</cfif>
</cffunction>










<cffunction name="TriggerOrderAbstract" output="true" returntype="string" >
<cfargument name="file_id">
<cfargument name="file_type">


<!--- first get the file info --->
<cfif arguments.file_type eq 'P'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, prop_ID AS order_ID
	FROM Property
	WHERE prop_ID = #arguments.file_id#
</CFQUERY>
<cfelseif arguments.file_type eq 'T'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, title_ID AS order_ID
	FROM Title
	WHERE title_ID = #arguments.file_id#
</CFQUERY>
</cfif>


<!--- we need a function to determine what type of abstract to order, but for now, we're just going to set it to Full Search --->
<!--- 
purchases - full search
refinance  - two owner
prop report - current owner
--->
<cfif arguments.file_type eq 'P'>
<cfset vendor_product = 'Current_Owner'>
<cfelseif arguments.file_type eq 'T' and get_file_info.searchType eq 'Purchase'>
<cfset vendor_product = 'Full_Search'>
<cfelse>
<cfset vendor_product = 'Two_Owner'>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
<!--- now check to see if there is any Vendor routing set up specifically for this client, Product, in this state, in this county --->
	(comp_id = #get_file_info.comp_id#
	and state = '#get_file_info.pstate#'
	and county = '#get_file_info.pcounty#'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = #get_file_info.comp_id#
	and state = '#get_file_info.pstate#'
	and (county = '0')
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = #get_file_info.comp_id#
	and (state = '0')
	and (county = '0')
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '#get_file_info.pstate#'
	and county = '#get_file_info.pcounty#'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '#get_file_info.pstate#'
	and county = '0'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>


<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '0'
	and county = '0'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</CFQUERY>
</cfif>


<cfif check_routing.recordcount gt 0>

<cfset first_tier_id = Evaluate("check_routing.#vendor_product#_1st_Tier_ID")>
<cfset second_tier_id = Evaluate("check_routing.#vendor_product#_1st_Tier_ID")>
<cfset roundrobin = Evaluate("check_routing.UseRoundRobin#ReplaceNoCase(vendor_product, "_", "", "ALL")#")>
<cfset daily_max = Evaluate("check_routing.MaxPerDay#ReplaceNoCase(vendor_product, "_", "", "ALL")#")>



<cfset temp = #PlaceOrderAbstract(vendor_product,arguments.file_id,arguments.file_type, first_tier_id, second_tier_id, roundrobin, daily_max)#>

<cfelse>

<!--- do nothing --->
</cfif>





</cffunction>


<cffunction name="PlaceOrderAbstract" output="true" returntype="string" >
<cfargument name="vendor_product">
<cfargument name="file_id">
<cfargument name="file_type">
<cfargument name="tier_1_id">
<cfargument name="tier_2_id">
<cfargument name="round_robin">
<cfargument name="max_per_day">


<cfif arguments.vendor_product eq 'Full_Search'>
<cfset product_ordered = 'full_search'>
<cfelseif arguments.vendor_product eq 'Current_owner'>
<cfset product_ordered = 'current_owner'>
<cfelseif arguments.vendor_product eq 'Two_Owner'>
<cfset product_ordered = 'two_owner'>
</cfif>

<!--- first get the file info --->
<cfif arguments.file_type eq 'P'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, prop_ID AS order_ID
	FROM Property
	WHERE prop_ID = #arguments.file_id#
</CFQUERY>
<cfelseif arguments.file_type eq 'T'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, title_ID AS order_ID
	FROM Title
	WHERE title_ID = #arguments.file_id#
</CFQUERY>
</cfif>

<!--- now lets get the current daily counts for these products, for these vendors --->
<CFQUERY datasource="#request.dsn#" NAME="get_tier_1">
	SELECT *, daily_#product_ordered#_count as tier1count
	FROM Vendors_Stacie
	WHERE vendor_ID = #arguments.tier_1_id#
</CFQUERY>
<cfset tier_1_count = get_tier_1.tier1count>

<cfif arguments.tier_2_id neq '' and arguments.tier_2_id neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_tier_2">
	SELECT *, daily_#product_ordered#_count as tier2count
	FROM Vendors_Stacie
	WHERE vendor_ID = #arguments.tier_2_id#
</CFQUERY>
<cfset tier_2_count = get_tier_2.tier2count>
<cfelse>
<cfset tier_2_count = get_tier_1.tier1count>
<cfset get_tier_2.status = 'False'>
</cfif>

<!--- we're gonna do this two different ways, depending on whether RoundRobin is turned on for this astract Product --->
<cfif arguments.round_robin eq 1>
	<cfif (tier_1_count eq tier_2_count) and (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) and get_tier_1.status eq 'True'>
	<!--- assign abstract here to tier 1 vendor, and increase their count --->
	<cfset temp = #SendOrderAbstract(product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
	<cfelse>
			<cfif IsDefined("get_tier_2.recordcount") and (get_tier_2.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_2.e_and_o_expiration) gte 0) and get_tier_2.status eq 'True'>
			<cfset temp = #SendOrderAbstract(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_2_id, tier_2_count)#>
			<cfelse>
				<cfif (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) and get_tier_1.status eq 'True'>
				<cfset temp = #SendOrderAbstract(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
				</cfif>
			</cfif>
	</cfif>

<cfelse><!--- not round robin --->

	<cfif (tier_1_count lt arguments.max_per_day) and (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) and get_tier_1.status eq 'True'>
	<!--- assign abstract here to tier 1 vendor, and increase their count --->
	<cfset temp = #SendOrderAbstract(product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
	<cfelse>
			<cfif IsDefined("get_tier_2.recordcount") and (tier_2_count lt arguments.max_per_day) and (get_tier_2.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_2.e_and_o_expiration) gte 0) and get_tier_2.status eq 'True'>
			<cfset temp = #SendOrderAbstract(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_2_id, tier_2_count)#>
			<cfelse>
				<cfif (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) and get_tier_1.status eq 'True'>
				<cfset temp = #SendOrderAbstract(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
				</cfif>
			</cfif>
	</cfif>

</cfif>


</cffunction>




<cffunction name="SendOrderAbstract" output="true" returntype="string" >
<cfargument name="vendor_product">
<cfargument name="file_id">
<cfargument name="file_type">
<cfargument name="vendor_id">
<cfargument name="current_count">



<cfset new_count = current_count + 1>

<!--- get this vendor's pricing --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abstractor_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#get_file_info.pstate#' and p.county = '#get_file_info.pcounty#'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%'
			and p.vendor_id = #arguments.vendor_id#)
			or (p.state = '#get_file_info.pstate#' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%'
			and p.vendor_id = #arguments.vendor_id#)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%'
			and p.vendor_id = #arguments.vendor_id#)
			 and p.vendor_id = s.vendor_id
			 
</CFQUERY>

<cfset price = Evaluate("read_abstractor_pricing.#arguments.vendor_product#")>

<cfhttp url="https://#cgi.server_name#/admin_area/vendor_assign_abstract.cfm?al=1&company_id=0&rec_id=#arguments.file_id#&uid=264&bypass=1" method="post">
 <cfhttpparam type="Formfield" name="ABSTRACT_PRICE" value="#price#">
 <cfhttpparam type="Formfield" name="ABS_COMMIT" value="1">
 <cfhttpparam type="Formfield" name="ADDR" value="#get_file_info.paddress#">
 <cfhttpparam type="Formfield" name="AL" value="1">
 <cfhttpparam type="Formfield" name="ASSIGNMENT_UPLOAD" value="">
 <cfhttpparam type="Formfield" name="BRING_TO_DATE" value="">
 <cfhttpparam type="Formfield" name="CITY" value="#get_file_info.pcity#">
 <cfhttpparam type="Formfield" name="COMPANY_ID" value="0">
 <cfhttpparam type="Formfield" name="COUNTY" value="#get_file_info.pcounty#">
 <cfhttpparam type="Formfield" name="DELETE_FILE1" value="0">
 <cfhttpparam type="Formfield" name="DELETE_FILE2" value="0">
 <cfhttpparam type="Formfield" name="DELETE_FILE3" value="0">
 <cfhttpparam type="Formfield" name="FILE_UPLOAD1" value="">
 <cfhttpparam type="Formfield" name="FILE_UPLOAD2" value="">
 <cfhttpparam type="Formfield" name="FILE_UPLOAD3" value="">
 <cfhttpparam type="Formfield" name="INSTRUCTIONS" value="">
 <cfhttpparam type="Formfield" name="ORDER_ID" value="#arguments.file_id#">
 <cfhttpparam type="Formfield" name="ORDER_TYPE" value="#arguments.file_type#">
 <cfhttpparam type="Formfield" name="OWNER" value="#get_file_info.sfirstname1# #get_file_info.slastname1# *****#Right(get_file_info.sssn1,4)#">
 <cfhttpparam type="Formfield" name="PRODUCT_ORDERED" value="#arguments.vendor_product#">
 <cfhttpparam type="Formfield" name="PURCHASER" value="#get_file_info.bfirstname1# #get_file_info.bminame1# #get_file_info.blastname1#">
 <cfhttpparam type="Formfield" name="REC_ID" value="#arguments.file_id#">
 <cfhttpparam type="Formfield" name="STATE" value="#get_file_info.pstate#">
 <cfhttpparam type="Formfield" name="UID" value="264"><!--- Web System --->
 <cfhttpparam type="Formfield" name="UPLOAD_FILE1" value="0">
 <cfhttpparam type="Formfield" name="UPLOAD_FILE2" value="0">
 <cfhttpparam type="Formfield" name="UPLOAD_FILE3" value="0">
 <cfhttpparam type="Formfield" name="VENDOR_ID" value="#arguments.vendor_id#">
 <cfhttpparam type="Formfield" name="ZIP" value="#get_file_info.pzip#">
</cfhttp>

<!--- <cfmail from="webmaster@firsttitleservices.com" to="rjermain@firsttitleservices.com"  subject="ABSTRACT TEST" type="html">

<br>
<br>
#cfhttp.FileContent#
<br>
<br>

</cfmail> --->


<!--- update the vendor count --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="update_vendor_count">
			update Vendors_Stacie
			set daily_#arguments.vendor_product#_count = #new_count#
			where vendor_id = #arguments.vendor_id#
</CFQUERY>

<cfmail from="webmaster@firsttitleservices.com" to="rjermain@firsttitleservices.com"  cc="jmoore@firsttitleservices.com"  subject="AutoOrder: Abstract file ###arguments.file_id#" type="html">

Abstract file (#arguments.vendor_product#) has been automatically ordered for file: ###arguments.file_id#<br>
<br>
Sent to Vendor: #read_abstractor_pricing.company#

</cfmail>


</cffunction>




































<cffunction name="TriggerOrderICL" output="true" returntype="string" >
<cfargument name="file_id">
<cfargument name="file_type">
<cfargument name="vendor_product" default="ICL">


<!--- first get the file info --->
<cfif arguments.file_type eq 'P'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, prop_ID AS order_ID
	FROM Property
	WHERE prop_ID = #arguments.file_id#
</CFQUERY>
<cfelseif arguments.file_type eq 'T'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, title_ID AS order_ID
	FROM Title
	WHERE title_ID = #arguments.file_id#
</CFQUERY>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
<!--- now check to see if there is any Vendor routing set up specifically for this client, Product, in this state, in this county --->
	(comp_id = #get_file_info.comp_id#
	and state = '#get_file_info.pstate#'
	and county = '#get_file_info.pcounty#'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = #get_file_info.comp_id#
	and state = '#get_file_info.pstate#'
	and (county = '0')
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = #get_file_info.comp_id#
	and (state = '0')
	and (county = '0')
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '#get_file_info.pstate#'
	and county = '#get_file_info.pcounty#'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '#get_file_info.pstate#'
	and county = '0'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '0'
	and county = '0'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</CFQUERY>
</cfif>

<cfif check_routing.recordcount gt 0>
<cfset first_tier_id = Evaluate("check_routing.#vendor_product#_1st_Tier_ID")>
<cfset second_tier_id = Evaluate("check_routing.#vendor_product#_1st_Tier_ID")>
<cfset roundrobin = Evaluate("check_routing.UseRoundRobin#ReplaceNoCase(vendor_product, "_", "", "ALL")#")>
<cfset daily_max = Evaluate("check_routing.MaxPerDay#ReplaceNoCase(vendor_product, "_", "", "ALL")#")>



<cfset temp = #PlaceOrderICL(vendor_product,arguments.file_id,arguments.file_type, first_tier_id, second_tier_id, roundrobin, daily_max)#>

<cfelse>
<!--- do nothing --->
</cfif>





</cffunction>


<cffunction name="PlaceOrderICL" output="true" returntype="string" >
<cfargument name="vendor_product">
<cfargument name="file_id">
<cfargument name="file_type">
<cfargument name="tier_1_id">
<cfargument name="tier_2_id">
<cfargument name="round_robin">
<cfargument name="max_per_day">

<cfset product_ordered = 'ICL'>


<!--- first get the file info --->
<cfif arguments.file_type eq 'P'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, prop_ID AS order_ID
	FROM Property
	WHERE prop_ID = #arguments.file_id#
</CFQUERY>
<cfelseif arguments.file_type eq 'T'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, title_ID AS order_ID
	FROM Title
	WHERE title_ID = #arguments.file_id#
</CFQUERY>
</cfif>

<!--- now lets get the current daily counts for these products, for these vendors --->
<CFQUERY datasource="#request.dsn#" NAME="get_tier_1">
	SELECT *, daily_#product_ordered#_count as tier1count
	FROM Vendors_Stacie
	WHERE vendor_ID = #arguments.tier_1_id#
</CFQUERY>
<cfset tier_1_count = get_tier_1.tier1count>

<cfif arguments.tier_2_id neq '' and arguments.tier_2_id neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_tier_2">
	SELECT *, daily_#product_ordered#_count as tier2count
	FROM Vendors_Stacie
	WHERE vendor_ID = #arguments.tier_2_id#
</CFQUERY>
<cfset tier_2_count = get_tier_2.tier2count>
<cfelse>
<cfset tier_2_count = get_tier_1.tier1count>
<cfset get_tier_2.status = 'False'>
</cfif>



<!--- we're gonna do this two different ways, depending on whether RoundRobin is turned on for this astract Product --->
<cfif arguments.round_robin eq 1>

	<cfif (tier_1_count eq tier_2_count) <!--- and (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) ---> and get_tier_1.status eq 'True'>
	<!--- assign abstract here to tier 1 vendor, and increase their count --->
	<cfset temp = #SendOrderICL(product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
	<cfelse>
			<cfif IsDefined("get_tier_2.recordcount")  <!--- and (get_tier_2.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_2.e_and_o_expiration) gte 0) ---> and get_tier_2.status eq 'True'>
			<cfset temp = #SendOrderICL(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_2_id, tier_2_count)#>
			<cfelse>
				<cfif  <!--- (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) and ---> get_tier_1.status eq 'True'>
				<cfset temp = #SendOrderICL(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
				</cfif>
			</cfif>
	</cfif>

<cfelse><!--- not round robin --->

	<cfif (tier_1_count lt arguments.max_per_day) <!--- and (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0)---> and get_tier_1.status eq 'True'>
	<!--- assign abstract here to tier 1 vendor, and increase their count --->
	<cfset temp = #SendOrderICL(product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
	<cfelse>
			<cfif IsDefined("get_tier_2.recordcount") and (tier_2_count lt arguments.max_per_day) <!--- and (get_tier_2.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_2.e_and_o_expiration) gte 0)--->  and get_tier_2.status eq 'True'>
			<cfset temp = #SendOrderICL(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_2_id, tier_2_count)#>
			<cfelse>
				<cfif <!--- (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) and ---> get_tier_1.status eq 'True'>
				<cfset temp = #SendOrderICL(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
				</cfif>
			</cfif>
	</cfif>

</cfif>



</cffunction>




<cffunction name="SendOrderICL" output="true" returntype="string" >
<cfargument name="vendor_product" default="ICL">
<cfargument name="file_id">
<cfargument name="file_type">
<cfargument name="vendor_id">
<cfargument name="current_count">
<cfset new_count = current_count + 1>

<!--- get this vendor's pricing --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_ICL_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#get_file_info.pstate#' and p.county = '#get_file_info.pcounty#'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%'
    		 and p.vendor_id = #arguments.vendor_id#)
			or (p.state = '#get_file_info.pstate#' and p.county = 'All'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%'
    		 and p.vendor_id = #arguments.vendor_id#)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%'
    		 and p.vendor_id = #arguments.vendor_id#)
			 and p.vendor_id = s.vendor_id
</CFQUERY>

<cfset price = Evaluate("read_ICL_pricing.icl_fee")>

<cfhttp url="https://#cgi.server_name#/admin_area/vendor_assign_ICL.cfm?al=1&company_id=0&rec_id=#arguments.file_id#&uid=264&bypass=1" method="post">
 <cfhttpparam type="Formfield" name="ICL_COMMIT" value="1">
 <cfhttpparam type="Formfield" name="ICL_PRICE" value="#price#">
 <cfhttpparam type="Formfield" name="ORDER_ID" value="#arguments.file_id#">
 <cfhttpparam type="Formfield" name="ORDER_TYPE" value="#arguments.file_type#">
 <cfhttpparam type="Formfield" name="VENDOR_ID" value="#arguments.vendor_id#">
</cfhttp>

<!--- <cfmail from="webmaster@firsttitleservices.com" to="rjermain@firsttitleservices.com"  subject="ICL TEST" type="html">

<br>
<br>
#cfhttp.FileContent#
<br>
<br>

</cfmail> --->

<!--- update the vendor count --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="update_vendor_count">
			update Vendors_Stacie
			set daily_#arguments.vendor_product#_count = #new_count#
			where vendor_id = #arguments.vendor_id#
</CFQUERY>

<cfmail from="webmaster@firsttitleservices.com" to="rjermain@firsttitleservices.com"  cc="jmoore@firsttitleservices.com"  subject="AutoOrder: ICL file ###arguments.file_id#" type="html">

ICL has been automatically ordered for file: ###arguments.file_id#<br>
<br>
Sent to Vendor: #read_icl_pricing.company#
<br>


</cfmail>

</cffunction>






















<cffunction name="TriggerOrderTaxes" output="true" returntype="string" >
<cfargument name="file_id">
<cfargument name="file_type">
<cfargument name="vendor_product" default="Taxes">


<CFQUERY datasource="#request.dsn#" NAME="get_oof">

SELECT     St_ID, Title_Co_id, St_Abbrev, site
FROM         Title_Companies_States
WHERE     (Title_Co_id = 19)
</cfquery>

<cfset OOF_States = ValueList(get_oof.st_abbrev, ",")>



<!--- first get the file info --->
<cfif arguments.file_type eq 'P'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, prop_ID AS order_ID
	FROM Property
	WHERE prop_ID = #arguments.file_id#
</CFQUERY>
<cfelseif arguments.file_type eq 'T'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, title_ID AS order_ID
	FROM Title
	WHERE title_ID = #arguments.file_id#
</CFQUERY>
</cfif>


<cfif OOF_States does not contain get_file_info.pstate>

<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
<!--- now check to see if there is any Vendor routing set up specifically for this client, Product, in this state, in this county --->
	(comp_id = #get_file_info.comp_id#
	and state = '#get_file_info.pstate#'
	and county = '#get_file_info.pcounty#'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>


<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = #get_file_info.comp_id#
	and state = '#get_file_info.pstate#'
	and (county = '0')
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = #get_file_info.comp_id#
	and (state = '0')
	and (county = '0')
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '#get_file_info.pstate#'
	and county = '#get_file_info.pcounty#'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '#get_file_info.pstate#'
	and county = '0'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '0'
	and county = '0'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</CFQUERY>
</cfif>

<cfif check_routing.recordcount gt 0>
<cfset first_tier_id = Evaluate("check_routing.#vendor_product#_1st_Tier_ID")>
<cfset second_tier_id = Evaluate("check_routing.#vendor_product#_1st_Tier_ID")>
<cfset roundrobin = Evaluate("check_routing.UseRoundRobin#ReplaceNoCase(vendor_product, "_", "", "ALL")#")>
<cfset daily_max = Evaluate("check_routing.MaxPerDay#ReplaceNoCase(vendor_product, "_", "", "ALL")#")>



<cfset temp = #PlaceOrderTaxes(vendor_product,arguments.file_id,arguments.file_type, first_tier_id, second_tier_id, roundrobin, daily_max)#>

<cfelse>
<!--- do nothing --->
</cfif>


</cfif>


</cffunction>


<cffunction name="PlaceOrderTaxes" output="true" returntype="string" >
<cfargument name="vendor_product">
<cfargument name="file_id">
<cfargument name="file_type">
<cfargument name="tier_1_id">
<cfargument name="tier_2_id">
<cfargument name="round_robin">
<cfargument name="max_per_day">

<cfset product_ordered = 'Taxes'>


<!--- first get the file info --->
<cfif arguments.file_type eq 'P'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, prop_ID AS order_ID
	FROM Property
	WHERE prop_ID = #arguments.file_id#
</CFQUERY>
<cfelseif arguments.file_type eq 'T'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, title_ID AS order_ID
	FROM Title
	WHERE title_ID = #arguments.file_id#
</CFQUERY>
</cfif>

<!--- now lets get the current daily counts for these products, for these vendors --->
<CFQUERY datasource="#request.dsn#" NAME="get_tier_1">
	SELECT *, daily_#product_ordered#_count as tier1count
	FROM Vendors_Stacie
	WHERE vendor_ID = #arguments.tier_1_id#
</CFQUERY>
<cfset tier_1_count = get_tier_1.tier1count>

<cfif arguments.tier_2_id neq '' and arguments.tier_2_id neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_tier_2">
	SELECT *, daily_#product_ordered#_count as tier2count
	FROM Vendors_Stacie
	WHERE vendor_ID = #arguments.tier_2_id#
</CFQUERY>
<cfset tier_2_count = get_tier_2.tier2count>
<cfelse>
<cfset tier_2_count = get_tier_1.tier1count>
<cfset get_tier_2.status = 'False'>
</cfif>

<!--- we're gonna do this two different ways, depending on whether RoundRobin is turned on for this astract Product --->
<cfif arguments.round_robin eq 1>
	<cfif (tier_1_count eq tier_2_count) <!--- and (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) ---> and get_tier_1.status eq 'True'>
	<!--- assign abstract here to tier 1 vendor, and increase their count --->
	<cfset temp = #SendOrderTaxes(product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
	<cfelse>
			<cfif IsDefined("get_tier_2.recordcount") <!--- and (get_tier_2.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_2.e_and_o_expiration) gte 0) --->  and get_tier_2.status eq 'True'>
			<cfset temp = #SendOrderTaxes(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_2_id, tier_2_count)#>
			<cfelse>
				<cfif <!--- (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) and ---> get_tier_1.status eq 'True'>
				<cfset temp = #SendOrderTaxes(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
				</cfif>
			</cfif>
	</cfif>

<cfelse><!--- not round robin --->

	<cfif (tier_1_count lt arguments.max_per_day) <!--- and (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0)--->  and get_tier_1.status eq 'True'>
	<!--- assign abstract here to tier 1 vendor, and increase their count --->
	<cfset temp = #SendOrderTaxes(product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
	<cfelse>
			<cfif IsDefined("get_tier_2.recordcount")  and (tier_2_count lt arguments.max_per_day) <!--- and (get_tier_2.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_2.e_and_o_expiration) gte 0) ---> and get_tier_2.status eq 'True'>
			<cfset temp = #SendOrderTaxes(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_2_id, tier_2_count)#>
			<cfelse>
				<cfif  <!--- (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) and ---> get_tier_1.status eq 'True'>
				<cfset temp = #SendOrderTaxes(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
				</cfif>
			</cfif>
	</cfif>

</cfif>



</cffunction>




<cffunction name="SendOrderTaxes" output="true" returntype="string" >
<cfargument name="vendor_product" default="Taxes">
<cfargument name="file_id">
<cfargument name="file_type">
<cfargument name="vendor_id">
<cfargument name="current_count">


<cfif get_file_info.pstate eq 'PA'>
<cfmail from="webmaster@firsttitleservices.com" to="pataxes@firsttitleservices.com"  <!--- cc="jmoore@firsttitleservices.com" ---> subject="AutoOrder: Taxes Need for file ###arguments.file_id#" type="html">

Please order taxes for this file from the Charles Jones website.

-Web System

</cfmail>

<cfmail from="webmaster@firsttitleservices.com" to="rjermain@firsttitleservices.com" cc="jmoore@firsttitleservices.com" subject="AutoOrder: TaxPrep file ###arguments.file_id#" type="html">

Email sent to pataxes@firsttitleservices.com to order taxes for this file from the Charles Jones website. File ###arguments.file_id#<br>
<br>

</cfmail>

<cfelse>

<cfset new_count = current_count + 1>

<!--- get this vendor's pricing --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_taxprep_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#get_file_info.pstate#' and p.county = '#get_file_info.pcounty#'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%'
			and p.vendor_id = #arguments.vendor_id#)
			or (p.state = '#get_file_info.pstate#' and p.county = 'All'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%'
			and p.vendor_id = #arguments.vendor_id#)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%'
			and p.vendor_id = #arguments.vendor_id#)
			 and p.vendor_id = s.vendor_id
			 
</CFQUERY>

<cfset price = Evaluate("read_taxprep_pricing.taxprep_fee")>

<cfhttp url="https://#cgi.server_name#/admin_area/vendor_assign_taxprep.cfm?al=1&company_id=0&rec_id=#arguments.file_id#&uid=264&bypass=1" method="post">
 <cfhttpparam type="Formfield" name="TAXPREP_COMMIT" value="1">


 <cfhttpparam type="Formfield" name="TAXPREP_PRICE" value="#price#">
 <cfhttpparam type="Formfield" name="ORDER_ID" value="#arguments.file_id#">
 <cfhttpparam type="Formfield" name="ORDER_TYPE" value="#arguments.file_type#">
 <cfhttpparam type="Formfield" name="VENDOR_ID" value="#arguments.vendor_id#">
</cfhttp>

<!--- <cfmail from="webmaster@firsttitleservices.com" to="rjermain@firsttitleservices.com"  subject="TAXES TEST" type="html">

<br>
<br>
#cfhttp.FileContent#
<br>
<br>

</cfmail> --->

<!--- update the vendor count --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="update_vendor_count">
			update Vendors_Stacie
			set daily_#arguments.vendor_product#_count = #new_count#
			where vendor_id = #arguments.vendor_id#
</CFQUERY>

<cfmail from="webmaster@firsttitleservices.com" to="rjermain@firsttitleservices.com" cc="jmoore@firsttitleservices.com" subject="AutoOrder: TaxPrep file ###arguments.file_id#" type="html">

Taxes have been automatically ordered for file: ###arguments.file_id#<br>
<br>
Sent to Vendor: #read_taxprep_pricing.company#
<br>

</cfmail>
</cfif>

</cffunction>
























<cffunction name="TriggerOrderTyping" output="true" returntype="string" >
<cfargument name="file_id">
<cfargument name="file_type">
<cfargument name="vendor_product" default="Typing">


<!--- first get the file info --->
<cfif arguments.file_type eq 'P'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, prop_ID AS order_ID
	FROM Property
	WHERE prop_ID = #arguments.file_id#
</CFQUERY>
<cfelseif arguments.file_type eq 'T'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, title_ID AS order_ID
	FROM Title
	WHERE title_ID = #arguments.file_id#
</CFQUERY>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
<!--- now check to see if there is any Vendor routing set up specifically for this client, Product, in this state, in this county --->
	(comp_id = #get_file_info.comp_id#
	and state = '#get_file_info.pstate#'
	and county = '#get_file_info.pcounty#'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>


<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = #get_file_info.comp_id#
	and state = '#get_file_info.pstate#'
	and (county = '0')
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = #get_file_info.comp_id#
	and (state = '0')
	and (county = '0')
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '#get_file_info.pstate#'
	and county = '#get_file_info.pcounty#'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '#get_file_info.pstate#'
	and county = '0'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</cfquery>
</cfif>

<cfif check_routing.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="check_routing">
	SELECT *
	FROM Vendor_Routing_Table_Companies
	WHERE 
	(comp_id = 0
	and state = '0'
	and county = '0'
	and (#vendor_product#_1st_Tier_ID <> 0 and #vendor_product#_1st_Tier_ID IS NOT NULL))
</CFQUERY>
</cfif>

<cfif check_routing.recordcount gt 0>
<cfset first_tier_id = Evaluate("check_routing.#vendor_product#_1st_Tier_ID")>
<cfset second_tier_id = Evaluate("check_routing.#vendor_product#_1st_Tier_ID")>
<cfset roundrobin = Evaluate("check_routing.UseRoundRobin#ReplaceNoCase(vendor_product, "_", "", "ALL")#")>
<cfset daily_max = Evaluate("check_routing.MaxPerDay#ReplaceNoCase(vendor_product, "_", "", "ALL")#")>



<cfset temp = #PlaceOrderTyping(vendor_product,arguments.file_id,arguments.file_type, first_tier_id, second_tier_id, roundrobin, daily_max)#>

<cfelse>
<!--- do nothing --->
</cfif>





</cffunction>


<cffunction name="PlaceOrderTyping" output="true" returntype="string" >
<cfargument name="vendor_product">
<cfargument name="file_id">
<cfargument name="file_type">
<cfargument name="tier_1_id">
<cfargument name="tier_2_id">
<cfargument name="round_robin">
<cfargument name="max_per_day">

<cfset product_ordered = 'Typing'>


<!--- first get the file info --->
<cfif arguments.file_type eq 'P'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, prop_ID AS order_ID
	FROM Property
	WHERE prop_ID = #arguments.file_id#
</CFQUERY>
<cfelseif arguments.file_type eq 'T'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, title_ID AS order_ID
	FROM Title
	WHERE title_ID = #arguments.file_id#
</CFQUERY>
</cfif>

<!--- now lets get the current daily counts for these products, for these vendors --->
<CFQUERY datasource="#request.dsn#" NAME="get_tier_1">
	SELECT *, daily_#product_ordered#_count as tier1count
	FROM Vendors_Stacie
	WHERE vendor_ID = #arguments.tier_1_id#
</CFQUERY>
<cfset tier_1_count = get_tier_1.tier1count>

<cfif arguments.tier_2_id neq '' and arguments.tier_2_id neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_tier_2">
	SELECT *, daily_#product_ordered#_count as tier2count
	FROM Vendors_Stacie
	WHERE vendor_ID = #arguments.tier_2_id#
</CFQUERY>
<cfset tier_2_count = get_tier_2.tier2count>
<cfelse>
<cfset tier_2_count = get_tier_1.tier1count>
<cfset get_tier_2.status = 'False'>
</cfif>

<!--- we're gonna do this two different ways, depending on whether RoundRobin is turned on for this astract Product --->
<cfif arguments.round_robin eq 1>
	<cfif (tier_1_count eq tier_2_count) <!---  and (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) ---> and get_tier_1.status eq 'True'>
	<!--- assign abstract here to tier 1 vendor, and increase their count --->
	<cfset temp = #SendOrderTyping(product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
	<cfelse>
			<cfif IsDefined("get_tier_2.recordcount") <!--- and (get_tier_2.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_2.e_and_o_expiration) gte 0) ---> and get_tier_2.status eq 'True'>
			<cfset temp = #SendOrderTyping(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_2_id, tier_2_count)#>
			<cfelse>
				<cfif <!--- (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) and ---> get_tier_1.status eq 'True'>
				<cfset temp = #SendOrderTyping(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
				</cfif>
			</cfif>
	</cfif>

<cfelse><!--- not round robin --->



	<cfif (tier_1_count lt arguments.max_per_day) <!--- and (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) ---> and get_tier_1.status eq 'True'>
	<!--- assign abstract here to tier 1 vendor, and increase their count --->
	<cfset temp = #SendOrderTyping(product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
	<cfelse>
			<cfif IsDefined("get_tier_2.recordcount") and (tier_2_count lt arguments.max_per_day) <!--- and (get_tier_2.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_2.e_and_o_expiration) gte 0) ---> and get_tier_2.status eq 'True'>
			<cfset temp = #SendOrderTyping(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_2_id, tier_2_count)#>
			<cfelse>
				<cfif  <!--- (get_tier_1.e_and_o_cert neq 'NULL') and (DateDiff("d", Now(), get_tier_1.e_and_o_expiration) gte 0) and ---> get_tier_1.status eq 'True'>
				<cfset temp = #SendOrderTyping(arguments.product_ordered,arguments.file_id,arguments.file_type, arguments.tier_1_id, tier_1_count)#>
				</cfif>
			</cfif>
	</cfif>

</cfif>



</cffunction>




<cffunction name="SendOrderTyping" output="true" returntype="string" >
<cfargument name="vendor_product" default="Typing">
<cfargument name="file_id">
<cfargument name="file_type">
<cfargument name="vendor_id">
<cfargument name="current_count">

<cfset new_count = current_count + 1>

<!--- get this vendor's pricing --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_typing_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#get_file_info.pstate#' and p.county = '#get_file_info.pcounty#'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%'
			and p.vendor_id = #arguments.vendor_id#)
			or (p.state = '#get_file_info.pstate#' and p.county = 'All'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%'
			and p.vendor_id = #arguments.vendor_id#)
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%'
			and p.vendor_id = #arguments.vendor_id#)
			 and p.vendor_id = s.vendor_id
			 
</CFQUERY>

<cfset price = Evaluate("read_taxprep_pricing.typing_fee")>

<cfhttp url="https://#cgi.server_name#/admin_area/vendor_assign_typing.cfm?al=1&company_id=0&rec_id=#arguments.file_id#&uid=264&bypass=1" method="post">
 <cfhttpparam type="Formfield" name="TYPING_COMMIT" value="1">
 <cfhttpparam type="Formfield" name="TYPING_PRICE" value="#price#">
 <cfhttpparam type="Formfield" name="ORDER_ID" value="#arguments.file_id#">
 <cfhttpparam type="Formfield" name="ORDER_TYPE" value="#arguments.file_type#">
 <cfhttpparam type="Formfield" name="VENDOR_ID" value="#arguments.vendor_id#">
</cfhttp>

<!--- <cfmail from="webmaster@firsttitleservices.com" to="rjermain@firsttitleservices.com"  subject="TYPING TEST" type="html">

<br>
<br>
#cfhttp.FileContent#
<br>
<br>

</cfmail> --->

<!--- update the vendor count --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="update_vendor_count">
			update Vendors_Stacie
			set daily_#arguments.vendor_product#_count = #new_count#
			where vendor_id = #arguments.vendor_id#
</CFQUERY>

<cfmail from="webmaster@firsttitleservices.com" to="rjermain@firsttitleservices.com" cc="jmoore@firsttitleservices.com"  subject="AutoOrder: Typing file ###arguments.file_id#" type="html">

Typing has been automatically ordered for file: ###arguments.file_id#<br>
<br>
Sent to Vendor: #read_typing_pricing.company#
<br>

</cfmail>

</cffunction>


















<cffunction name="TriggerOrderInhouseAbstract" output="true" returntype="string" >
<cfargument name="file_id">
<cfargument name="file_type">


<!--- first get the file info --->
<cfif arguments.file_type eq 'P'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, prop_ID AS order_ID
	FROM Property
	WHERE prop_ID = #arguments.file_id#
</CFQUERY>
<cfelseif arguments.file_type eq 'T'>
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
	SELECT *, title_ID AS order_ID
	FROM Title
	WHERE title_ID = #arguments.file_id#
</CFQUERY>
</cfif>


<!--- we need a function to determine what type of abstract to order, but for now, we're just going to set it to Full Search --->
<!--- 
purchases - full search
refinance  - two owner
prop report - current owner
--->
<cfset vendor_product = 'Current_Owner'>
<cfset temp = #SendOrderInhouseAbstract(vendor_product,arguments.file_id,arguments.file_type)#>
</cffunction>




<cffunction name="SendOrderInhouseAbstract" output="true" returntype="string" >
<cfargument name="vendor_product">
<cfargument name="file_id">
<cfargument name="file_type">


<!--- get this vendor's pricing --->

<cfset price = 0>

<cfhttp url="https://#cgi.server_name#/admin_area/vendor_assign_abstract.cfm?al=1&company_id=0&rec_id=#arguments.file_id#&uid=264&bypass=1" method="post">
 <cfhttpparam type="Formfield" name="ABSTRACT_PRICE" value="#price#">
 <cfhttpparam type="Formfield" name="ABS_COMMIT" value="1">
 <cfhttpparam type="Formfield" name="ADDR" value="#get_file_info.paddress#">
 <cfhttpparam type="Formfield" name="AL" value="1">
 <cfhttpparam type="Formfield" name="ASSIGNMENT_UPLOAD" value="">
 <cfhttpparam type="Formfield" name="BRING_TO_DATE" value="">
 <cfhttpparam type="Formfield" name="CITY" value="#get_file_info.pcity#">
 <cfhttpparam type="Formfield" name="COMPANY_ID" value="0">
 <cfhttpparam type="Formfield" name="COUNTY" value="#get_file_info.pcounty#">
 <cfhttpparam type="Formfield" name="DELETE_FILE1" value="0">
 <cfhttpparam type="Formfield" name="DELETE_FILE2" value="0">
 <cfhttpparam type="Formfield" name="DELETE_FILE3" value="0">
 <cfhttpparam type="Formfield" name="FILE_UPLOAD1" value="">
 <cfhttpparam type="Formfield" name="FILE_UPLOAD2" value="">
 <cfhttpparam type="Formfield" name="FILE_UPLOAD3" value="">
 <cfhttpparam type="Formfield" name="INSTRUCTIONS" value="">
 <cfhttpparam type="Formfield" name="ORDER_ID" value="#arguments.file_id#">
 <cfhttpparam type="Formfield" name="ORDER_TYPE" value="#arguments.file_type#">
 <cfhttpparam type="Formfield" name="OWNER" value="#get_file_info.sfirstname1# #get_file_info.slastname1# *****#Right(get_file_info.sssn1,4)#">
 <cfhttpparam type="Formfield" name="PRODUCT_ORDERED" value="#arguments.vendor_product#">
 <cfhttpparam type="Formfield" name="PURCHASER" value="#get_file_info.bfirstname1# #get_file_info.bminame1# #get_file_info.blastname1#">
 <cfhttpparam type="Formfield" name="REC_ID" value="#arguments.file_id#">
 <cfhttpparam type="Formfield" name="STATE" value="#get_file_info.pstate#">
 <cfhttpparam type="Formfield" name="UID" value="264"><!--- Web System --->
 <cfhttpparam type="Formfield" name="UPLOAD_FILE1" value="0">
 <cfhttpparam type="Formfield" name="UPLOAD_FILE2" value="0">
 <cfhttpparam type="Formfield" name="UPLOAD_FILE3" value="0">
 <cfhttpparam type="Formfield" name="VENDOR_ID" value="5"> <!--- first title inhouse --->
 <cfhttpparam type="Formfield" name="ZIP" value="#get_file_info.pzip#">
</cfhttp>

<!--- <cfmail from="webmaster@firsttitleservices.com" to="rjermain@firsttitleservices.com"  subject="INHOUSE ABSTRACT TEST" type="html">

<br>
<br>
#cfhttp.FileContent#
<br>
<br>

</cfmail> --->

<cfmail from="webmaster@firsttitleservices.com" to="rjermain@firsttitleservices.com"  cc="jmoore@firsttitleservices.com" subject="AutoOrder: InHouse Abstract file ###arguments.file_id#" type="html">

InHouse Abstract file  has been automatically ordered for file: ###arguments.file_id#
<br>
Sent to Vendor: InHouse
<br>

</cfmail>


</cffunction>







</cfcomponent>




