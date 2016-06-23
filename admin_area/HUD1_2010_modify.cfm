

<cfset dateCalendarStart = "01/01/2010">
<cfset dateCalendarEnd = "12/31/2014">
<cfparam name="uid" default="">
<cfparam name="lo_id" default="">
<cfparam name="rec_id" default="52555">
<cfparam name="url.viewprint" type="numeric" default=0>
<cfparam name="url.sendemail" type="numeric" default=0>
<cfparam name="url.sendtoaddr" default="">


<CFQUERY datasource="#request.dsn#" NAME="get_title_data">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_company_data">
			SELECT *
			FROM companies
			WHERE ID = #get_title_data.comp_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_hud_data">
			SELECT *
			FROM HUD2010_TITLE_DATA
			WHERE Title_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_hud_data_b">
			SELECT *
			FROM HUD2010_TITLE_DATA_B
			WHERE Title_ID = #rec_id#
		</CFQUERY>


<!--- here we are going to see if we should get the fees from a different account, if an 'asset manager' is chosen, we'll get the fees from that company, otherwise, we'll get them from the company placing the order --->
<cfif get_title_data.asset_manager neq '' and get_title_data.asset_manager neq 'NULL'>
<cfset billing_co_id_to_use = get_title_data.asset_manager>
<cfelse>
<cfset billing_co_id_to_use = get_title_data.comp_id>
</cfif>


<!--- get custom fees for this client --->
<!--- First let's make sure they even have fees set up for this state, because if not, there's no reason to do it, and it would throw an error anyway --->
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states_HUD2010 WHERE company_id = '#billing_co_id_to_use#' and a_states = '#get_title_data.pstate#'
order by state_id desc
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
SELECT     *
FROM         Company_Billing_Values_HUD2010 AS h1 INNER JOIN
             Company_Billing_Values_B_HUD2010 AS h2 ON h1.Billing_ID = h2.Billing_ID
WHERE     (h1.Billing_ID = #read_this_sets_billing_states.billing_id#)
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_itemized">
SELECT     *
FROM         ITEMIZED_1101_CHARGES
where Billing_ID = #read_this_sets_billing_states.billing_id#
order by ID desc
</CFQUERY>



<cfset extra_1101 = 0>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_01)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_01>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_02)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_02>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_03)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_03>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_04)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_04>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_05)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_05>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_06)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_06>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_07)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_07>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_08)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_08>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_09)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_09>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_10)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_10>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_11)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_11>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_12)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_12>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_13)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_13>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_14)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_14>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_15)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_15>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_16)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_16>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_17)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_17>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_18)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_18>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_19)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_19>
</cfif>
<cfif IsNumeric(get_hud_data_b.A_1101_ITEM_AMOUNT_20)>
<cfset extra_1101 = extra_1101 + get_hud_data_b.A_1101_ITEM_AMOUNT_20>
</cfif>



<!---<cfset extra_1101 = 0>
<cfif get_title_data.searchtype eq 'Refinance'>
<cfif (get_title_data.which_bulk_rate_used eq 'Natic' or get_title_data.which_bulk_rate_used eq 'Stewart' or get_title_data.which_bulk_rate_used eq 'none' or get_title_data.which_bulk_rate_used eq 'NULL' or get_title_data.which_bulk_rate_used eq '')>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_01_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_01_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 1, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_02_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_02_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_02_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 2, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_02_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_03_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_03_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_03_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 3, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_03_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_04_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_04_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_04_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 4, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_04_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_05_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_05_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_05_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 5, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_05_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_06_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_06_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_06_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 6, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_06_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_07_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_07_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_07_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 7, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_07_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_08_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_08_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_08_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 8, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_08_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_09_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_09_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_09_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 9, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_09_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_10_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_10_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_10_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 10, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_10_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_11_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_11_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_11_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 11, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_11_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_12_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_12_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_12_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 12, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_12_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_13_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_13_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_13_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 13, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_13_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_14_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_14_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_14_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 14, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_14_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_15_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_15_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_15_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 15, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_15_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_16_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_16_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_16_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 16, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_16_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_17_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_17_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_17_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 17, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_17_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_18_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_18_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_18_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 18, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_18_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_19_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_19_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_19_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 19, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_19_REFINANCE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_20_REFINANCE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_20_REFINANCE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_20_REFINANCE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 20, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_20_REFINANCE>
	</cfif>
	</cfif>
	<cfelse>

	<cfif get_title_data.which_bulk_rate_used eq 'Chicago Rates'>
	<cfset extra_1101 = extra_1101 + 225>
	<cfelseif get_title_data.which_bulk_rate_used eq 'Chicago Local Rates'>
	<cfset extra_1101 = extra_1101 + 275>
	<!--- <cfelseif get_title_data.which_bulk_rate_used eq 'Natic'>
	<cfset extra_1101 = extra_1101 + 425> --->
	</cfif>
	</cfif>
</cfif>

<cfif get_title_data.searchtype eq 'Purchase'>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_01_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_01_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 1, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_02_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_02_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 2, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_03_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_03_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 3, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_04_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_04_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 4, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_05_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_05_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 5, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_06_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_06_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 6, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_07_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_07_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 7, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_08_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_08_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 8, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_09_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_09_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 9, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_10_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_10_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 10, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_11_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_11_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 11, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_12_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_12_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 12, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_13_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_13_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 13, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_14_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_14_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 14, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_15_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_15_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 15, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_16_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_16_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 16, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_17_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_17_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 17, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_18_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_18_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 18, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_19_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_19_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 19, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_20_PURCHASE neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_20_PURCHASE eq 1 and ListContainsNoCase(get_title_data.custom_fees, 20, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE>
	</cfif>
	</cfif>
</cfif>
<cfif get_title_data.searchtype eq '2nd Mortgage'>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 1, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 2, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 3, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 4, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 5, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 6, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 7, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 8, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 9, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 10, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 11, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 12, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 13, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 14, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 15, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 16, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 17, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 18, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 19, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI>
	</cfif>
	</cfif>
    <cfif IsNumeric(get_itemized.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI)>
	<cfif get_itemized.A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI neq 1 or (get_itemized.A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI eq 1 and ListContainsNoCase(get_title_data.custom_fees, 20, ","))>
	<cfset extra_1101 = extra_1101 + get_itemized.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI>
	</cfif>
	</cfif>
</cfif>
--->



<cfif IsDefined("url.rec_id")>
<cfset rec_id = url.rec_id>
</cfif>
<cfif url.viewprint eq 1 or url.sendemail eq 1>
<cfhttp url="http://machine1.firsttitleservices.com/HUD1_2010_PDF.cfm?rec_id=#rec_id#" method="get" resolveURL="true">
</cfhttp>



 
 <cftry>
 <cffile action="delete" file="c:\huds\HUD_#rec_id#.pdf">
 <cfcatch type="any"></cfcatch>
 </cftry>
        <cfdocument format="PDF" pagetype="custom" pageheight="14" pagewidth="8.5" margintop=".25" marginbottom=".25" marginleft=".25" marginright=".25" filename="c:\huds\HUD_#rec_id#.pdf" overwrite="yes" > <cfoutput>#cfhttp.filecontent#</cfoutput> </cfdocument>

<cfif url.viewprint eq 1>
<script language="javascript">
open('showPDF.cfm?file=HUD_<cfoutput>#rec_id#</cfoutput>.pdf');
</script>
</cfif>

<cfif url.sendemail eq 1>
<CFMAIL
	TO="#url.sendtoaddr#"
	FROM="webmaster@firsttitleservices.com" Subject="Your HUD"
	TIMEOUT="600">


<cfmailparam file="c:\huds\HUD_#rec_id#.pdf">

</CFMAIL>


<!---<CFMAIL
	TO="rick@jermain.com"
	FROM="webmaster@firsttitleservices.com" Subject="testing"
	TIMEOUT="600">
</CFMAIL>--->

</cfif>

</cfif>


<cfoutput >
<html>
<head>
<title>Settlement Statement (HUD-1)</title>
<script type="text/javascript" language="javascript" src="calendar/calendar.js"></script>


<script language="javascript">
function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		return false
	}
return true
}


function IsNumeric(str)
// returns true if str is numeric
// that is it contains only the digits 0-9
// returns false otherwise
// returns false if empty
{
  var len= str.length;


  if (len==0)
    return false;
  //else
  var p=0;
  var ok= true;
  var ch= "";
  while (ok && p<len)
  {
    ch= str.charAt(p);
    if ('0'<=ch && ch<='9' || ch=='.' || ch=='-')
      p++;
    else
      ok= false;
  }
  return ok;
}


function roundit(n) {

  ans = n * 1000
  ans = Math.round(ans /10) + ""
  while (ans.length < 3) {ans = "0" + ans}
  len = ans.length
  ans = ans.substring(0,len-2) + "." + ans.substring(len-2,len)
  return ans
}

function roundit4(n) {

  ans = n * 100000
  ans = Math.round(ans /10) + ""
  while (ans.length < 3) {ans = "0" + ans}
  len = ans.length
  ans = ans.substring(0,len-2) + "." + ans.substring(len-2,len)
  return ans
}



function re_add_form() {
var extra_1101_value = 0;
extra_1101_value = <cfoutput>#extra_1101#</cfoutput>;
var temp = 0;
<cfoutput><cfif get_hud_data.PRE_ALTA_LENDERS_TITLE_INSURANCE neq ''>
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = parseFloat(#get_hud_data.PRE_ALTA_LENDERS_TITLE_INSURANCE#)
</cfif>
</cfoutput>


<!--- determine whether extra dynamic 1100's need to be shown --->
<cfif Len(get_hud_data.A_1114_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1114_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1114_SELLER_USERAMOUNT)>
 document.getElementById('row_1114').style.display = 'block';
</cfif>
<cfif Len(get_hud_data.A_1115_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1115_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1115_SELLER_USERAMOUNT)>
 document.getElementById('row_1115').style.display = 'block';
</cfif>
<cfif Len(get_hud_data.A_1116_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1116_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1116_SELLER_USERAMOUNT)>
 document.getElementById('row_1116').style.display = 'block';
</cfif>
<cfif Len(get_hud_data.A_1117_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1117_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1117_SELLER_USERAMOUNT)>
 document.getElementById('row_1117').style.display = 'block';
</cfif>
<cfif Len(get_hud_data.A_1118_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1118_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1118_SELLER_USERAMOUNT)>
 document.getElementById('row_1118').style.display = 'block';
</cfif>
<cfif Len(get_hud_data.A_1119_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1119_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1119_SELLER_USERAMOUNT)>
 document.getElementById('row_1119').style.display = 'block';
</cfif>
<cfif Len(get_hud_data.A_1120_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1120_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1120_SELLER_USERAMOUNT)>
 document.getElementById('row_1120').style.display = 'block';
</cfif>
<cfif Len(get_hud_data.A_1121_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1121_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1121_SELLER_USERAMOUNT)>
 document.getElementById('row_1121').style.display = 'block';
</cfif>
<cfif Len(get_hud_data.A_1122_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1122_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1122_SELLER_USERAMOUNT)>
 document.getElementById('row_1122').style.display = 'block';
</cfif>

<!--- 700 series --->
var total_700_borrower = 0;
var total_700_seller = 0;
var new_amount = 0;

if (IsNumeric(parseFloat(document.hud1_form.A_0701_COMMISSIONAMOUNT.value)) && document.hud1_form.A_0701_COMMISSIONAMOUNT.value != '') {
new_amount = new_amount + parseFloat(document.hud1_form.A_0701_COMMISSIONAMOUNT.value)
}
if (IsNumeric(parseFloat(document.hud1_form.A_0702_COMMISSIONAMOUNT.value)) && document.hud1_form.A_0702_COMMISSIONAMOUNT.value != '') {
new_amount = new_amount + parseFloat(document.hud1_form.A_0702_COMMISSIONAMOUNT.value)
}
if (new_amount != 0) {
document.hud1_form.A_0703_BORROWER_COMMISSIONAMOUNT.value = roundit(new_amount);
} else {
document.hud1_form.A_0703_BORROWER_COMMISSIONAMOUNT.value = '';
}



if (IsNumeric(parseFloat(document.hud1_form.A_0703_BORROWER_COMMISSIONAMOUNT.value)) && document.hud1_form.A_0703_BORROWER_COMMISSIONAMOUNT.value != '') {
total_700_borrower = total_700_borrower + parseFloat(document.hud1_form.A_0703_BORROWER_COMMISSIONAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0704_BORROWER_USERAMOUNT.value)) && document.hud1_form.A_0704_BORROWER_USERAMOUNT.value != '') {
total_700_borrower = total_700_borrower + parseFloat(document.hud1_form.A_0704_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0705_BORROWER_USERAMOUNT.value)) && document.hud1_form.A_0705_BORROWER_USERAMOUNT.value != '') {
total_700_borrower = total_700_borrower + parseFloat(document.hud1_form.A_0705_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0706_BORROWER_USERAMOUNT.value)) && document.hud1_form.A_0706_BORROWER_USERAMOUNT.value != '') {
total_700_borrower = total_700_borrower + parseFloat(document.hud1_form.A_0706_BORROWER_USERAMOUNT.value);
}


if (IsNumeric(parseFloat(document.hud1_form.A_0703_SELLER_COMMISSIONAMOUNT.value)) && document.hud1_form.A_0703_SELLER_COMMISSIONAMOUNT.value != '') {
total_700_seller = total_700_seller + parseFloat(document.hud1_form.A_0703_SELLER_COMMISSIONAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0704_SELLER_USERAMOUNT.value)) && document.hud1_form.A_0704_SELLER_USERAMOUNT.value != '') {
total_700_seller = total_700_seller + parseFloat(document.hud1_form.A_0704_SELLER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0705_SELLER_USERAMOUNT.value)) && document.hud1_form.A_0705_SELLER_USERAMOUNT.value != '') {
total_700_seller = total_700_seller + parseFloat(document.hud1_form.A_0705_SELLER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0706_SELLER_USERAMOUNT.value)) && document.hud1_form.A_0706_SELLER_USERAMOUNT.value != '') {
total_700_seller = total_700_seller + parseFloat(document.hud1_form.A_0706_SELLER_USERAMOUNT.value);
}

<!--- add up 800 series --->
var total_800_borrower = 0;
var total_800_seller = 0;

if (IsNumeric(parseFloat(document.hud1_form.A_0801_OUTSIDE_ORIGINATIONCHARGE.value)) && document.hud1_form.A_0801_OUTSIDE_ORIGINATIONCHARGE.value != ''  && IsNumeric(parseFloat(document.hud1_form.A_0802_OUTSIDE_POINTS.value)) && document.hud1_form.A_0802_OUTSIDE_POINTS.value != '') {
new_amount = parseFloat(document.hud1_form.A_0801_OUTSIDE_ORIGINATIONCHARGE.value) + parseFloat(document.hud1_form.A_0802_OUTSIDE_POINTS.value);
document.hud1_form.A_0803_BORROWER_ADJORIGINATIONCHARGE.value = roundit(parseFloat(new_amount));
}


if (IsNumeric(parseFloat(document.hud1_form.A_0801_OUTSIDE_ORIGINATIONCHARGE.value)) && document.hud1_form.A_0801_OUTSIDE_ORIGINATIONCHARGE.value != '') {
document.hud1_form.COMPARE_01_HUD_ORIGINCHARGE.value = roundit(parseFloat(document.hud1_form.A_0801_OUTSIDE_ORIGINATIONCHARGE.value));
}


if (IsNumeric(parseFloat(document.hud1_form.A_0802_OUTSIDE_POINTS.value)) && document.hud1_form.A_0802_OUTSIDE_POINTS.value != '') {
document.hud1_form.COMPARE_02_HUD_POINTS.value = roundit(parseFloat(document.hud1_form.A_0802_OUTSIDE_POINTS.value));
}


if (IsNumeric(parseFloat(document.hud1_form.A_0803_BORROWER_ADJORIGINATIONCHARGE.value)) && document.hud1_form.A_0803_BORROWER_ADJORIGINATIONCHARGE.value != '') {
document.hud1_form.COMPARE_03_HUD_ADJORIGINCHARGE.value = roundit(parseFloat(document.hud1_form.A_0803_BORROWER_ADJORIGINATIONCHARGE.value));
}



if (IsNumeric(parseFloat(document.hud1_form.A_0803_BORROWER_ADJORIGINATIONCHARGE.value)) && document.hud1_form.A_0803_BORROWER_ADJORIGINATIONCHARGE.value != '') {
total_800_borrower = total_800_borrower + parseFloat(document.hud1_form.A_0803_BORROWER_ADJORIGINATIONCHARGE.value);
}


if (IsNumeric(parseFloat(document.hud1_form.A_0804_BORROWER_APPRAISALFEE.value)) && document.hud1_form.A_0804_BORROWER_APPRAISALFEE.value != '') {
total_800_borrower = total_800_borrower + parseFloat(document.hud1_form.A_0804_BORROWER_APPRAISALFEE.value);
}


if (IsNumeric(parseFloat(document.hud1_form.A_0805_BORROWER_CREDITREPORT.value)) && document.hud1_form.A_0805_BORROWER_CREDITREPORT.value != '') {
total_800_borrower = total_800_borrower + parseFloat(document.hud1_form.A_0805_BORROWER_CREDITREPORT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0806_BORROWER_TAXSERVICE.value)) && document.hud1_form.A_0806_BORROWER_TAXSERVICE.value != '') {
total_800_borrower = total_800_borrower + parseFloat(document.hud1_form.A_0806_BORROWER_TAXSERVICE.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0807_BORROWER_FLOODCERT.value)) && document.hud1_form.A_0807_BORROWER_FLOODCERT.value != '') {
total_800_borrower = total_800_borrower + parseFloat(document.hud1_form.A_0807_BORROWER_FLOODCERT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0808_BORROWER_USERAMOUNT.value)) && document.hud1_form.A_0808_BORROWER_USERAMOUNT.value != '') {
total_800_borrower = total_800_borrower + parseFloat(document.hud1_form.A_0808_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0809_BORROWER_USERAMOUNT.value)) && document.hud1_form.A_0809_BORROWER_USERAMOUNT.value != '') {
total_800_borrower = total_800_borrower + parseFloat(document.hud1_form.A_0809_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0810_BORROWER_USERAMOUNT.value)) && document.hud1_form.A_0810_BORROWER_USERAMOUNT.value != '') {
total_800_borrower = total_800_borrower + parseFloat(document.hud1_form.A_0810_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0811_BORROWER_USERAMOUNT.value)) && document.hud1_form.A_0811_BORROWER_USERAMOUNT.value != '') {
total_800_borrower = total_800_borrower + parseFloat(document.hud1_form.A_0811_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0812_BORROWER_USERAMOUNT.value)) && document.hud1_form.A_0812_BORROWER_USERAMOUNT.value != '') {
total_800_borrower = total_800_borrower + parseFloat(document.hud1_form.A_0812_BORROWER_USERAMOUNT.value);
}


if (IsNumeric(parseFloat(document.hud1_form.A_0803_SELLER_ADJORIGINATIONCHARGE.value)) && document.hud1_form.A_0803_SELLER_ADJORIGINATIONCHARGE.value != '') {
total_800_seller = total_800_seller + parseFloat(document.hud1_form.A_0803_SELLER_ADJORIGINATIONCHARGE.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0804_SELLER_APPRAISALFEE.value)) && document.hud1_form.A_0804_SELLER_APPRAISALFEE.value != '') {
total_800_seller = total_800_seller + parseFloat(document.hud1_form.A_0804_SELLER_APPRAISALFEE.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0805_SELLER_CREDITREPORT.value)) && document.hud1_form.A_0805_SELLER_CREDITREPORT.value != '') {
total_800_seller = total_800_seller + parseFloat(document.hud1_form.A_0805_SELLER_CREDITREPORT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0806_SELLER_TAXSERVICE.value)) && document.hud1_form.A_0806_SELLER_TAXSERVICE.value != '') {
total_800_seller = total_800_seller + parseFloat(document.hud1_form.A_0806_SELLER_TAXSERVICE.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0807_SELLER_FLOODCERT.value)) && document.hud1_form.A_0807_SELLER_FLOODCERT.value != '') {
total_800_seller = total_800_seller + parseFloat(document.hud1_form.A_0807_SELLER_FLOODCERT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0808_SELLER_USERAMOUNT.value)) && document.hud1_form.A_0808_SELLER_USERAMOUNT.value != '') {
total_800_seller = total_800_seller + parseFloat(document.hud1_form.A_0808_SELLER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0809_SELLER_USERAMOUNT.value)) && document.hud1_form.A_0809_SELLER_USERAMOUNT.value != '') {
total_800_seller = total_800_seller + parseFloat(document.hud1_form.A_0809_SELLER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0810_SELLER_USERAMOUNT.value)) && document.hud1_form.A_0810_SELLER_USERAMOUNT.value != '') {
total_800_seller = total_800_seller + parseFloat(document.hud1_form.A_0810_SELLER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0811_SELLER_USERAMOUNT.value)) && document.hud1_form.A_0811_SELLER_USERAMOUNT.value != '') {
total_800_seller = total_800_seller + parseFloat(document.hud1_form.A_0811_SELLER_USERAMOUNT.value);
}

if (IsNumeric(parseFloat(document.hud1_form.A_0812_SELLER_USERAMOUNT.value)) && document.hud1_form.A_0812_SELLER_USERAMOUNT.value != '') {
total_800_seller = total_800_seller + parseFloat(document.hud1_form.A_0812_SELLER_USERAMOUNT.value);
}

<!--- add up 900 series --->
var total_900_borrower = 0;
var total_900_seller = 0;

document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value = '';
date1 = new Date();
date2 = new Date();
diff  = new Date();
date1temp = new Date(document.hud1_form.A_0901_DAILYINTERESTDATEFROM.value);
date1.setTime(date1temp.getTime());
date2temp = new Date(document.hud1_form.A_0901_DAILYINTERESTDATETO.value);
date2.setTime(date2temp.getTime());
// sets difference date to difference of first date and second date
diff.setTime(Math.abs(date1.getTime() - date2.getTime()));
timediff = diff.getTime();
days = Math.floor(timediff / (1000 * 60 * 60 * 24));
timediff -= days * (1000 * 60 * 60 * 24);


if (document.hud1_form.A_0901_OUTSIDE_DAILYINTERESTPERDAY.value != '') {
if (!IsNumeric(document.hud1_form.A_0901_OUTSIDE_DAILYINTERESTPERDAY.value)) {
 alert("Only numbers in this format XX or XX.XX are allowed in this field (901)")
  document.hud1_form.A_0901_OUTSIDE_DAILYINTERESTPERDAY.focus();
      return false;
 } }




 if ((document.hud1_form.A_0901_DAILYINTERESTDATEFROM.value != '') && (document.hud1_form.A_0901_DAILYINTERESTDATETO.value != '') && (document.hud1_form.A_0901_OUTSIDE_DAILYINTERESTPERDAY.value != '')) {
 if (document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value == '') {
 if (date1temp > date2temp) {
document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value = roundit(-days * parseFloat(document.hud1_form.A_0901_OUTSIDE_DAILYINTERESTPERDAY.value));
total_900_borrower = roundit(total_900_borrower + parseFloat(document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value));
} else {
document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value = roundit(days * parseFloat(document.hud1_form.A_0901_OUTSIDE_DAILYINTERESTPERDAY.value));
}
total_900_borrower = roundit(total_900_borrower + parseFloat(document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value));
}else {
 if (date1temp > date2temp) {
document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value = roundit(-days * parseFloat(document.hud1_form.A_0901_OUTSIDE_DAILYINTERESTPERDAY.value));
total_900_borrower = total_900_borrower + parseFloat(document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value);

}else{
document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value = roundit(days * parseFloat(document.hud1_form.A_0901_OUTSIDE_DAILYINTERESTPERDAY.value));
total_900_borrower = total_900_borrower + parseFloat(document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value);
}
}
}
else if (((document.hud1_form.A_0901_DAILYINTERESTDATEFROM.value == '')||(document.hud1_form.A_0901_DAILYINTERESTDATETO.value == '')||(document.hud1_form.A_0901_OUTSIDE_DAILYINTERESTPERDAY.value == ''))&&(document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value != '')) {
document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value = '';
}
document.hud1_form.COMPARE_14_INTERESTCHARGESPERDAY.value = roundit(document.hud1_form.A_0901_OUTSIDE_DAILYINTERESTPERDAY.value);
document.hud1_form.COMPARE_14_GFE_INTERESTCHARGES.value = roundit(document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value);
document.hud1_form.COMPARE_14_HUD_INTERESTCHARGES.value = roundit(document.hud1_form.A_0901_BORROWER_DAILYINTEREST.value);

if (IsNumeric(document.hud1_form.A_0902_BORROWER_MORTGAGEINS.value) &&  document.hud1_form.A_0902_BORROWER_MORTGAGEINS.value != 0) {
total_900_borrower = total_900_borrower + parseFloat(document.hud1_form.A_0902_BORROWER_MORTGAGEINS.value);
}

if (IsNumeric(document.hud1_form.A_0903_BORROWER_HOMEOWNERSINS.value) &&  document.hud1_form.A_0903_BORROWER_HOMEOWNERSINS.value != 0) {
total_900_borrower = total_900_borrower + parseFloat(document.hud1_form.A_0903_BORROWER_HOMEOWNERSINS.value);
document.hud1_form.COMPARE_15_GFE_HOMEOWNERSINS.value = roundit(parseFloat(document.hud1_form.A_0903_BORROWER_HOMEOWNERSINS.value));
document.hud1_form.COMPARE_15_HUD_HOMEOWNERSINS.value = roundit(parseFloat(document.hud1_form.A_0903_BORROWER_HOMEOWNERSINS.value));
}

if (IsNumeric(document.hud1_form.A_0904_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_0904_BORROWER_USERAMOUNT.value != 0) {
total_900_borrower = total_900_borrower + parseFloat(document.hud1_form.A_0904_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0901_SELLER_DAILYINTEREST.value) &&  document.hud1_form.A_0901_SELLER_DAILYINTEREST.value != 0) {
total_900_seller = total_900_seller + parseFloat(document.hud1_form.A_0901_SELLER_DAILYINTEREST.value);
}

if (IsNumeric(document.hud1_form.A_0902_SELLER_MORTGAGEINS.value) &&  document.hud1_form.A_0902_SELLER_MORTGAGEINS.value != 0) {
total_900_seller = total_900_seller + parseFloat(document.hud1_form.A_0902_SELLER_MORTGAGEINS.value);
}

if (IsNumeric(document.hud1_form.A_0903_SELLER_HOMEOWNERSINS.value) &&  document.hud1_form.A_0903_SELLER_HOMEOWNERSINS.value != 0) {
total_900_seller = total_900_seller + parseFloat(document.hud1_form.A_0903_SELLER_HOMEOWNERSINS.value);
}

if (IsNumeric(document.hud1_form.A_0904_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_0904_SELLER_USERAMOUNT.value != 0) {
total_900_seller = total_900_seller + parseFloat(document.hud1_form.A_0904_SELLER_USERAMOUNT.value);
}

<!--- 1000 series --->
var total_1001_borrower = 0;
var total_1000_borrower = 0;
var total_1000_seller = 0;

if (IsNumeric(document.hud1_form.A_1002_HOMEOWNERSINSMONTHS.value) &&  document.hud1_form.A_1002_HOMEOWNERSINSMONTHS.value != '' && IsNumeric(document.hud1_form.A_1002_HOMEOWNERSINSPERMONTH.value) &&  document.hud1_form.A_1002_HOMEOWNERSINSPERMONTH.value != '') {
new_amount = (parseFloat(document.hud1_form.A_1002_HOMEOWNERSINSMONTHS.value) * roundit(document.hud1_form.A_1002_HOMEOWNERSINSPERMONTH.value));
document.hud1_form.A_1002_OUTSIDE_HOMEOWNERSINS.value = parseFloat(new_amount);
total_1001_borrower = parseFloat(total_1001_borrower) + parseFloat(new_amount);
}

if (IsNumeric(document.hud1_form.A_1003_MORTGAGEINSMONTHS.value) &&  document.hud1_form.A_1003_MORTGAGEINSMONTHS.value != '' && IsNumeric(document.hud1_form.A_1003_MORTGAGEINSPERMONTH.value) &&  document.hud1_form.A_1003_MORTGAGEINSPERMONTH.value != '') {
new_amount = (parseFloat(document.hud1_form.A_1003_MORTGAGEINSMONTHS.value) * roundit(document.hud1_form.A_1003_MORTGAGEINSPERMONTH.value));
document.hud1_form.A_1003_OUTSIDE_MORTGAGEINS.value = parseFloat(new_amount);
total_1001_borrower = total_1001_borrower + new_amount;
}

if (IsNumeric(document.hud1_form.A_1004_CITYPROPTAXMONTHS.value) &&  document.hud1_form.A_1004_CITYPROPTAXMONTHS.value != '' && IsNumeric(document.hud1_form.A_1004_CITYPROPTAXPERMONTH.value) &&  document.hud1_form.A_1004_CITYPROPTAXPERMONTH.value != '') {
new_amount = (parseFloat(document.hud1_form.A_1004_CITYPROPTAXMONTHS.value) * roundit(document.hud1_form.A_1004_CITYPROPTAXPERMONTH.value));
document.hud1_form.A_1004_OUTSIDE_CITYPROPTAX.value = parseFloat(new_amount);

total_1001_borrower = total_1001_borrower + new_amount;
}

if (IsNumeric(document.hud1_form.A_1005_COUNTYPROPTAXMONTHS.value) &&  document.hud1_form.A_1005_COUNTYPROPTAXMONTHS.value != '' && IsNumeric(document.hud1_form.A_1005_COUNTYPROPTAXPERMONTH.value) &&  document.hud1_form.A_1005_COUNTYPROPTAXPERMONTH.value != '') {
new_amount = (parseFloat(document.hud1_form.A_1005_COUNTYPROPTAXMONTHS.value) * roundit(document.hud1_form.A_1005_COUNTYPROPTAXPERMONTH.value));
document.hud1_form.A_1005_OUTSIDE_COUNTYPROPTAX.value = roundit(parseFloat(new_amount));
total_1001_borrower = total_1001_borrower + new_amount;
}

if (IsNumeric(document.hud1_form.A_1006_ASSESSMENTSMONTHS.value) &&  document.hud1_form.A_1006_ASSESSMENTSMONTHS.value != '' && IsNumeric(document.hud1_form.A_1006_ASSESSMENTSPERMONTH.value) &&  document.hud1_form.A_1006_ASSESSMENTSPERMONTH.value != '') {
new_amount = (parseFloat(document.hud1_form.A_1006_ASSESSMENTSMONTHS.value) * roundit(document.hud1_form.A_1006_ASSESSMENTSPERMONTH.value));
document.hud1_form.A_1006_OUTSIDE_ASSESSMENTS.value = roundit(parseFloat(new_amount));
total_1001_borrower = total_1001_borrower + parseFloat(new_amount);
}

if (IsNumeric(document.hud1_form.A_1007_OUTSIDE_AGGREGATEADJUSTMENT.value) &&  document.hud1_form.A_1007_OUTSIDE_AGGREGATEADJUSTMENT.value != '') {
total_1001_borrower = total_1001_borrower + parseFloat(document.hud1_form.A_1007_OUTSIDE_AGGREGATEADJUSTMENT.value);
}

document.hud1_form.A_1001_BORROWER_INITIALESCROWDEPOSIT.value = roundit(parseFloat(total_1001_borrower));
document.hud1_form.COMPARE_13_GFE_ESCROWDEPOSIT.value = roundit(parseFloat(total_1001_borrower));
document.hud1_form.COMPARE_13_HUD_ESCROWDEPOSIT.value = roundit(parseFloat(total_1001_borrower));

if (IsNumeric(document.hud1_form.A_1001_BORROWER_INITIALESCROWDEPOSIT.value) &&  document.hud1_form.A_1001_BORROWER_INITIALESCROWDEPOSIT.value != '') {
total_1000_borrower = total_1000_borrower + parseFloat(document.hud1_form.A_1001_BORROWER_INITIALESCROWDEPOSIT.value);
}

if (IsNumeric(document.hud1_form.A_1002_BORROWER_HOMEOWNERSINS.value) &&  document.hud1_form.A_1002_BORROWER_HOMEOWNERSINS.value != '') {
total_1000_borrower = total_1000_borrower + parseFloat(document.hud1_form.A_1002_BORROWER_HOMEOWNERSINS.value);
}

if (IsNumeric(document.hud1_form.A_1003_BORROWER_MORTGAGEINS.value) &&  document.hud1_form.A_1003_BORROWER_MORTGAGEINS.value != '') {
total_1000_borrower = total_1000_borrower + parseFloat(document.hud1_form.A_1003_BORROWER_MORTGAGEINS.value);
}

if (IsNumeric(document.hud1_form.A_1004_BORROWER_CITYPROPTAX.value) &&  document.hud1_form.A_1004_BORROWER_CITYPROPTAX.value != '') {
total_1000_borrower = total_1000_borrower + parseFloat(document.hud1_form.A_1004_BORROWER_CITYPROPTAX.value);
}

if (IsNumeric(document.hud1_form.A_1005_BORROWER_COUNTYPROPTAX.value) &&  document.hud1_form.A_1005_BORROWER_COUNTYPROPTAX.value != '') {
total_1000_borrower = total_1000_borrower + parseFloat(document.hud1_form.A_1005_BORROWER_COUNTYPROPTAX.value);
}

if (IsNumeric(document.hud1_form.A_1006_BORROWER_ASSESSMENTS.value) &&  document.hud1_form.A_1006_BORROWER_ASSESSMENTS.value != '') {
total_1000_borrower = total_1000_borrower + parseFloat(document.hud1_form.A_1006_BORROWER_ASSESSMENTS.value);
}

if (IsNumeric(document.hud1_form.A_1007_BORROWER_AGGREGATEADJUSTMENT.value) &&  document.hud1_form.A_1007_BORROWER_AGGREGATEADJUSTMENT.value != '') {
total_1000_borrower = total_1000_borrower + parseFloat(document.hud1_form.A_1007_BORROWER_AGGREGATEADJUSTMENT.value);
}

if (IsNumeric(document.hud1_form.A_1001_SELLER_INITIALESCROWDEPOSIT.value) &&  document.hud1_form.A_1001_SELLER_INITIALESCROWDEPOSIT.value != '') {
total_1000_seller = total_1000_seller + parseFloat(document.hud1_form.A_1001_SELLER_INITIALESCROWDEPOSIT.value);
}

if (IsNumeric(document.hud1_form.A_1002_SELLER_HOMEOWNERSINS.value) &&  document.hud1_form.A_1002_SELLER_HOMEOWNERSINS.value != '') {
total_1000_seller = total_1000_seller + parseFloat(document.hud1_form.A_1002_SELLER_HOMEOWNERSINS.value);
}

if (IsNumeric(document.hud1_form.A_1003_SELLER_MORTGAGEINS.value) &&  document.hud1_form.A_1003_SELLER_MORTGAGEINS.value != '') {
total_1000_seller = total_1000_seller + parseFloat(document.hud1_form.A_1003_SELLER_MORTGAGEINS.value);
}

if (IsNumeric(document.hud1_form.A_1004_SELLER_CITYPROPTAX.value) &&  document.hud1_form.A_1004_SELLER_CITYPROPTAX.value != '') {
total_1000_seller = total_1000_seller + parseFloat(document.hud1_form.A_1004_SELLER_CITYPROPTAX.value);
}

if (IsNumeric(document.hud1_form.A_1005_SELLER_COUNTYPROPTAX.value) &&  document.hud1_form.A_1005_SELLER_COUNTYPROPTAX.value != '') {
total_1000_seller = total_1000_seller + parseFloat(document.hud1_form.A_1005_SELLER_COUNTYPROPTAX.value);
}

if (IsNumeric(document.hud1_form.A_1006_SELLER_ASSESSMENTS.value) &&  document.hud1_form.A_1006_SELLER_ASSESSMENTS.value != '') {
total_1000_seller = total_1000_seller + parseFloat(document.hud1_form.A_1006_SELLER_ASSESSMENTS.value);
}

if (IsNumeric(document.hud1_form.A_1007_SELLER_AGGREGATEADJUSTMENT.value) &&  document.hud1_form.A_1007_SELLER_AGGREGATEADJUSTMENT.value != '') {
total_1000_seller = total_1000_seller + parseFloat(document.hud1_form.A_1007_SELLER_AGGREGATEADJUSTMENT.value);
}

<!--- 1100 series --->
var total_1101_borrower = 0;
var total_1100_borrower = 0;
var total_1100_seller = 0;



if (extra_1101_value != 0) {
total_1101_borrower = total_1101_borrower + parseFloat(extra_1101_value);
}

if (IsNumeric(document.hud1_form.A_1102_OUTSIDE_CLOSINGFEE.value) &&  document.hud1_form.A_1102_OUTSIDE_CLOSINGFEE.value != '') {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1102_OUTSIDE_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102A_OUTSIDE_CLOSINGFEE.value) &&  document.hud1_form.A_1102A_OUTSIDE_CLOSINGFEE.value != '') {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1102A_OUTSIDE_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102B_OUTSIDE_CLOSINGFEE.value) &&  document.hud1_form.A_1102B_OUTSIDE_CLOSINGFEE.value != '') {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1102B_OUTSIDE_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102C_OUTSIDE_CLOSINGFEE.value) &&  document.hud1_form.A_1102C_OUTSIDE_CLOSINGFEE.value != '') {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1102C_OUTSIDE_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102D_OUTSIDE_CLOSINGFEE.value) &&  document.hud1_form.A_1102D_OUTSIDE_CLOSINGFEE.value != '') {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1102D_OUTSIDE_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102E_OUTSIDE_CLOSINGFEE.value) &&  document.hud1_form.A_1102E_OUTSIDE_CLOSINGFEE.value != '') {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1102E_OUTSIDE_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102F_OUTSIDE_CLOSINGFEE.value) &&  document.hud1_form.A_1102F_OUTSIDE_CLOSINGFEE.value != '') {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1102F_OUTSIDE_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102G_OUTSIDE_CLOSINGFEE.value) &&  document.hud1_form.A_1102G_OUTSIDE_CLOSINGFEE.value != '') {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1102G_OUTSIDE_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102H_OUTSIDE_CLOSINGFEE.value) &&  document.hud1_form.A_1102H_OUTSIDE_CLOSINGFEE.value != '') {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1102H_OUTSIDE_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102I_OUTSIDE_CLOSINGFEE.value) &&  document.hud1_form.A_1102I_OUTSIDE_CLOSINGFEE.value != '') {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1102I_OUTSIDE_CLOSINGFEE.value);
}


if (IsNumeric(document.hud1_form.A_1109_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1109_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1109_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1109_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1109_OUTSIDE_USERAMOUNT.value));
}
}

if (IsNumeric(document.hud1_form.A_1110_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1110_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1110_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1110_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1110_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1111_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1111_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1111_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1111_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1111_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1112_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1112_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1112_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1112_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1112_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1113_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1113_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1113_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1113_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1113_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1114_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1114_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1114_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1114_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1114_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1115_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1115_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1115_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1115_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1115_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1116_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1116_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1116_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1116_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1116_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1117_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1117_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1117_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1117_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1117_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1118_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1118_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1118_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1118_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1118_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1119_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1119_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1119_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1119_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1119_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1120_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1120_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1120_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1120_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1120_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1121_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1121_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1121_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1121_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1121_OUTSIDE_USERAMOUNT.value));
}
}
if (IsNumeric(document.hud1_form.A_1122_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1122_OUTSIDE_USERAMOUNT.value != '') {
if (document.hud1_form.A_1122_USERDESC.value.indexOf('ALTA') < 0) {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1122_OUTSIDE_USERAMOUNT.value);
} else {
document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value = roundit(parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) + parseFloat(document.hud1_form.A_1122_OUTSIDE_USERAMOUNT.value));
}
}


if (IsNumeric(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value) &&  document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value != '') {
total_1101_borrower = total_1101_borrower + parseFloat(document.hud1_form.A_1104_OUTSIDE_LENDERSTITLEINS.value);
}


if (IsNumeric(total_1101_borrower) &&  total_1101_borrower != '') {
document.hud1_form.A_1101_BORROWER_TITLESERVICES.value = roundit(parseFloat(total_1101_borrower));
}
if (IsNumeric(document.hud1_form.A_1101_BORROWER_TITLESERVICES.value) &&  document.hud1_form.A_1101_BORROWER_TITLESERVICES.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1101_BORROWER_TITLESERVICES.value);
}
if (IsNumeric(document.hud1_form.A_1102_BORROWER_CLOSINGFEE.value) &&  document.hud1_form.A_1102_BORROWER_CLOSINGFEE.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1102_BORROWER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102A_BORROWER_CLOSINGFEE.value) &&  document.hud1_form.A_1102A_BORROWER_CLOSINGFEE.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1102A_BORROWER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102B_BORROWER_CLOSINGFEE.value) &&  document.hud1_form.A_1102B_BORROWER_CLOSINGFEE.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1102B_BORROWER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102C_BORROWER_CLOSINGFEE.value) &&  document.hud1_form.A_1102C_BORROWER_CLOSINGFEE.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1102C_BORROWER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102D_BORROWER_CLOSINGFEE.value) &&  document.hud1_form.A_1102D_BORROWER_CLOSINGFEE.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1102D_BORROWER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102E_BORROWER_CLOSINGFEE.value) &&  document.hud1_form.A_1102E_BORROWER_CLOSINGFEE.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1102E_BORROWER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102F_BORROWER_CLOSINGFEE.value) &&  document.hud1_form.A_1102F_BORROWER_CLOSINGFEE.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1102F_BORROWER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102G_BORROWER_CLOSINGFEE.value) &&  document.hud1_form.A_1102G_BORROWER_CLOSINGFEE.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1102G_BORROWER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102H_BORROWER_CLOSINGFEE.value) &&  document.hud1_form.A_1102H_BORROWER_CLOSINGFEE.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1102H_BORROWER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102I_BORROWER_CLOSINGFEE.value) &&  document.hud1_form.A_1102I_BORROWER_CLOSINGFEE.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1102I_BORROWER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1103_BORROWER_OWNERSTITLEINS.value) &&  document.hud1_form.A_1103_BORROWER_OWNERSTITLEINS.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1103_BORROWER_OWNERSTITLEINS.value);
}
if (IsNumeric(document.hud1_form.A_1104_BORROWER_LENDERSTITLEINS.value) &&  document.hud1_form.A_1104_BORROWER_LENDERSTITLEINS.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1104_BORROWER_LENDERSTITLEINS.value);
}
if (IsNumeric(document.hud1_form.A_1109_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1109_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1109_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1110_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1110_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1110_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1111_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1111_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1111_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1112_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1112_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1112_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1113_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1113_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1113_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1114_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1114_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1114_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1115_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1115_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1115_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1116_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1116_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1116_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1117_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1117_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1117_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1118_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1118_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1118_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1119_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1119_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1119_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1120_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1120_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1120_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1121_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1121_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1121_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1122_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1122_BORROWER_USERAMOUNT.value != '') {
total_1100_borrower = total_1100_borrower + parseFloat(document.hud1_form.A_1122_BORROWER_USERAMOUNT.value);
}


if (IsNumeric(document.hud1_form.A_1101_SELLER_TITLESERVICES.value) &&  document.hud1_form.A_1101_SELLER_TITLESERVICES.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1101_SELLER_TITLESERVICES.value);
}
if (IsNumeric(document.hud1_form.A_1102_SELLER_CLOSINGFEE.value) &&  document.hud1_form.A_1102_SELLER_CLOSINGFEE.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1102_SELLER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102A_SELLER_CLOSINGFEE.value) &&  document.hud1_form.A_1102A_SELLER_CLOSINGFEE.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1102A_SELLER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102B_SELLER_CLOSINGFEE.value) &&  document.hud1_form.A_1102B_SELLER_CLOSINGFEE.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1102B_SELLER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102C_SELLER_CLOSINGFEE.value) &&  document.hud1_form.A_1102C_SELLER_CLOSINGFEE.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1102C_SELLER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102D_SELLER_CLOSINGFEE.value) &&  document.hud1_form.A_1102D_SELLER_CLOSINGFEE.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1102D_SELLER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102E_SELLER_CLOSINGFEE.value) &&  document.hud1_form.A_1102E_SELLER_CLOSINGFEE.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1102E_SELLER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102F_SELLER_CLOSINGFEE.value) &&  document.hud1_form.A_1102F_SELLER_CLOSINGFEE.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1102F_SELLER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102G_SELLER_CLOSINGFEE.value) &&  document.hud1_form.A_1102G_SELLER_CLOSINGFEE.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1102G_SELLER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102H_SELLER_CLOSINGFEE.value) &&  document.hud1_form.A_1102H_SELLER_CLOSINGFEE.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1102H_SELLER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1102I_SELLER_CLOSINGFEE.value) &&  document.hud1_form.A_1102I_SELLER_CLOSINGFEE.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1102I_SELLER_CLOSINGFEE.value);
}
if (IsNumeric(document.hud1_form.A_1103_SELLER_OWNERSTITLEINS.value) &&  document.hud1_form.A_1103_SELLER_OWNERSTITLEINS.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1103_SELLER_OWNERSTITLEINS.value);
}
if (IsNumeric(document.hud1_form.A_1104_SELLER_LENDERSTITLEINS.value) &&  document.hud1_form.A_1104_SELLER_LENDERSTITLEINS.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1104_SELLER_LENDERSTITLEINS.value);
}
if (IsNumeric(document.hud1_form.A_1109_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1109_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1109_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1110_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1110_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1110_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1111_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1111_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1111_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1112_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1112_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1112_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1113_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1113_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1113_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1114_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1114_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1114_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1115_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1115_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1115_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1116_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1116_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1116_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1117_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1117_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1117_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1118_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1118_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1118_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1119_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1119_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1119_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1120_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1120_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1120_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1121_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1121_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1121_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1122_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1122_SELLER_USERAMOUNT.value != '') {
total_1100_seller = total_1100_seller + parseFloat(document.hud1_form.A_1122_SELLER_USERAMOUNT.value);
}



<!--- 1200 series --->
var total_1201_borrower = 0;
var total_1203_borrower = 0;
var total_1200_borrower = 0;
var total_1200_seller = 0;


if (IsNumeric(document.hud1_form.A_1202_DEED_SELLER.value) &&  document.hud1_form.A_1202_DEED_SELLER.value != '') {
document.hud1_form.A_1202_SELLER_DEED.value = parseFloat(document.hud1_form.A_1202_DEED_SELLER.value);
}






if (IsNumeric(document.hud1_form.A_1202_DEED.value) &&  document.hud1_form.A_1202_DEED.value != '') {
total_1201_borrower = total_1201_borrower + parseFloat(document.hud1_form.A_1202_DEED.value);
}

if (IsNumeric(document.hud1_form.A_1202_DEEDMORTGAGE.value) &&  document.hud1_form.A_1202_DEEDMORTGAGE.value != '') {
total_1201_borrower = total_1201_borrower + parseFloat(document.hud1_form.A_1202_DEEDMORTGAGE.value);
}

if (IsNumeric(document.hud1_form.A_1202_DEEDRELEASES.value) &&  document.hud1_form.A_1202_DEEDRELEASES.value != '') {
total_1201_borrower = total_1201_borrower + parseFloat(document.hud1_form.A_1202_DEEDRELEASES.value);
}

if (IsNumeric(total_1201_borrower) &&  total_1201_borrower != '') {
document.hud1_form.A_1201_BORROWER_GOVTRECORDINGCHARGES.value = total_1201_borrower;
}


if (IsNumeric(document.hud1_form.A_1204_CITYCOUNTYTAXDEED.value) &&  document.hud1_form.A_1204_CITYCOUNTYTAXDEED.value != '') {
total_1203_borrower = total_1203_borrower + parseFloat(document.hud1_form.A_1204_CITYCOUNTYTAXDEED.value);
}

if (IsNumeric(document.hud1_form.A_1204_CITYCOUNTYTAXMORTGAGE.value) &&  document.hud1_form.A_1204_CITYCOUNTYTAXMORTGAGE.value != '') {
total_1203_borrower = total_1203_borrower + parseFloat(document.hud1_form.A_1204_CITYCOUNTYTAXMORTGAGE.value);
}

if (IsNumeric(document.hud1_form.A_1205_STATETRANSTAXDEED.value) &&  document.hud1_form.A_1205_STATETRANSTAXDEED.value != '') {
total_1203_borrower = total_1203_borrower + parseFloat(document.hud1_form.A_1205_STATETRANSTAXDEED.value);
}

if (IsNumeric(document.hud1_form.A_1205_STATETRANSTAXMORTGAGE.value) &&  document.hud1_form.A_1205_STATETRANSTAXMORTGAGE.value != '') {
total_1203_borrower = total_1203_borrower + parseFloat(document.hud1_form.A_1205_STATETRANSTAXMORTGAGE.value);
}

if (IsNumeric(document.hud1_form.A_1206_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1206_OUTSIDE_USERAMOUNT.value != '') {
total_1203_borrower = total_1203_borrower + parseFloat(document.hud1_form.A_1206_OUTSIDE_USERAMOUNT.value);
}


if (IsNumeric(total_1203_borrower) &&  total_1203_borrower != '') {
document.hud1_form.A_1203_BORROWER_TRANSFERTAXES.value = total_1203_borrower;
}






if (IsNumeric(document.hud1_form.A_1201_BORROWER_GOVTRECORDINGCHARGES.value) &&  document.hud1_form.A_1201_BORROWER_GOVTRECORDINGCHARGES.value != '') {
total_1200_borrower = total_1200_borrower + parseFloat(document.hud1_form.A_1201_BORROWER_GOVTRECORDINGCHARGES.value);
}
if (IsNumeric(document.hud1_form.A_1202_BORROWER_DEED.value) &&  document.hud1_form.A_1202_BORROWER_DEED.value != '') {
total_1200_borrower = total_1200_borrower + parseFloat(document.hud1_form.A_1202_BORROWER_DEED.value);
}
if (IsNumeric(document.hud1_form.A_1203_BORROWER_TRANSFERTAXES.value) &&  document.hud1_form.A_1203_BORROWER_TRANSFERTAXES.value != '') {
total_1200_borrower = total_1200_borrower + parseFloat(document.hud1_form.A_1203_BORROWER_TRANSFERTAXES.value);
}
if (IsNumeric(document.hud1_form.A_1204_BORROWER_CITYCOUNTYTAX.value) &&  document.hud1_form.A_1204_BORROWER_CITYCOUNTYTAX.value != '') {
total_1200_borrower = total_1200_borrower + parseFloat(document.hud1_form.A_1204_BORROWER_CITYCOUNTYTAX.value);
}

if (IsNumeric(document.hud1_form.A_1205_BORROWER_STATETRANSTAX.value) &&  document.hud1_form.A_1205_BORROWER_STATETRANSTAX.value != '') {
total_1200_borrower = total_1200_borrower + parseFloat(document.hud1_form.A_1205_BORROWER_STATETRANSTAX.value);
}

if (IsNumeric(document.hud1_form.A_1206_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1206_BORROWER_USERAMOUNT.value != '') {
total_1200_borrower = total_1200_borrower + parseFloat(document.hud1_form.A_1206_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1207_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1207_BORROWER_USERAMOUNT.value != '') {
total_1200_borrower = total_1200_borrower + parseFloat(document.hud1_form.A_1207_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1201_SELLER_GOVTRECORDINGCHARGES.value) &&  document.hud1_form.A_1201_SELLER_GOVTRECORDINGCHARGES.value != '') {
total_1200_seller = total_1200_seller + parseFloat(document.hud1_form.A_1201_SELLER_GOVTRECORDINGCHARGES.value);
}
if (IsNumeric(document.hud1_form.A_1202_SELLER_DEED.value) &&  document.hud1_form.A_1202_SELLER_DEED.value != '') {
total_1200_seller = total_1200_seller + parseFloat(document.hud1_form.A_1202_SELLER_DEED.value);
}
if (IsNumeric(document.hud1_form.A_1203_SELLER_TRANSFERTAXES.value) &&  document.hud1_form.A_1203_SELLER_TRANSFERTAXES.value != '') {
total_1200_seller = total_1200_seller + parseFloat(document.hud1_form.A_1203_SELLER_TRANSFERTAXES.value);
}



if (IsNumeric(document.hud1_form.A_1204_CITYCOUNTYTAXDEED_SELLER.value)  &&  document.hud1_form.A_1204_CITYCOUNTYTAXDEED_SELLER.value != '' && IsNumeric(document.hud1_form.A_1204_CITYCOUNTYTAXMORTGAGE_SELLER.value)  &&  document.hud1_form.A_1204_CITYCOUNTYTAXMORTGAGE_SELLER.value != '') {
document.hud1_form.A_1204_SELLER_CITYCOUNTYTAX.value = parseFloat(document.hud1_form.A_1204_CITYCOUNTYTAXDEED_SELLER.value) + parseFloat(document.hud1_form.A_1204_CITYCOUNTYTAXMORTGAGE_SELLER.value);
} 


if (IsNumeric(document.hud1_form.A_1204_CITYCOUNTYTAXDEED_SELLER.value)  &&  document.hud1_form.A_1204_CITYCOUNTYTAXDEED_SELLER.value != '' && document.hud1_form.A_1204_CITYCOUNTYTAXMORTGAGE_SELLER.value == '') {
document.hud1_form.A_1204_SELLER_CITYCOUNTYTAX.value = parseFloat(document.hud1_form.A_1204_CITYCOUNTYTAXDEED_SELLER.value);
} 



if (document.hud1_form.A_1204_CITYCOUNTYTAXDEED_SELLER.value == '' && IsNumeric(document.hud1_form.A_1204_CITYCOUNTYTAXMORTGAGE_SELLER.value)  &&  document.hud1_form.A_1204_CITYCOUNTYTAXMORTGAGE_SELLER.value != '') {
document.hud1_form.A_1204_SELLER_CITYCOUNTYTAX.value = parseFloat(document.hud1_form.A_1204_CITYCOUNTYTAXMORTGAGE_SELLER.value);
} 


if (document.hud1_form.A_1204_CITYCOUNTYTAXDEED_SELLER.value == '' && document.hud1_form.A_1204_CITYCOUNTYTAXMORTGAGE_SELLER.value == '') {
document.hud1_form.A_1204_SELLER_CITYCOUNTYTAX.value = '';
} 



if (IsNumeric(document.hud1_form.A_1204_SELLER_CITYCOUNTYTAX.value) &&  document.hud1_form.A_1204_SELLER_CITYCOUNTYTAX.value != '') {
total_1200_seller = total_1200_seller + parseFloat(document.hud1_form.A_1204_SELLER_CITYCOUNTYTAX.value);
}








if (IsNumeric(document.hud1_form.A_1205_STATETRANSTAXDEED_SELLER.value)  &&  document.hud1_form.A_1205_STATETRANSTAXDEED_SELLER.value != '' && (IsNumeric(document.hud1_form.A_1205_STATETRANSTAXMORTGAGE_SELLER.value)  &&  document.hud1_form.A_1205_STATETRANSTAXMORTGAGE_SELLER.value != '' )) {
document.hud1_form.A_1205_SELLER_STATETRANSTAX.value = parseFloat(document.hud1_form.A_1205_STATETRANSTAXDEED_SELLER.value) + parseFloat(document.hud1_form.A_1205_STATETRANSTAXMORTGAGE_SELLER.value);
}

if (IsNumeric(document.hud1_form.A_1205_STATETRANSTAXDEED_SELLER.value)  &&  document.hud1_form.A_1205_STATETRANSTAXDEED_SELLER.value != '' && (document.hud1_form.A_1205_STATETRANSTAXMORTGAGE_SELLER.value == '' )) {
document.hud1_form.A_1205_SELLER_STATETRANSTAX.value = parseFloat(document.hud1_form.A_1205_STATETRANSTAXDEED_SELLER.value);
}

if (document.hud1_form.A_1205_STATETRANSTAXDEED_SELLER.value == '' && (IsNumeric(document.hud1_form.A_1205_STATETRANSTAXMORTGAGE_SELLER.value)  &&  document.hud1_form.A_1205_STATETRANSTAXMORTGAGE_SELLER.value != '' )) {
document.hud1_form.A_1205_SELLER_STATETRANSTAX.value = parseFloat(document.hud1_form.A_1205_STATETRANSTAXMORTGAGE_SELLER.value);
}

if (document.hud1_form.A_1205_STATETRANSTAXDEED_SELLER.value == '' && (document.hud1_form.A_1205_STATETRANSTAXMORTGAGE_SELLER.value == '' )) {
document.hud1_form.A_1205_SELLER_STATETRANSTAX.value = '';
}






if (IsNumeric(document.hud1_form.A_1205_SELLER_STATETRANSTAX.value) &&  document.hud1_form.A_1205_SELLER_STATETRANSTAX.value != '') {
total_1200_seller = total_1200_seller + parseFloat(document.hud1_form.A_1205_SELLER_STATETRANSTAX.value);
}
if (IsNumeric(document.hud1_form.A_1206_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1206_SELLER_USERAMOUNT.value != '') {
total_1200_seller = total_1200_seller + parseFloat(document.hud1_form.A_1206_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1207_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1207_SELLER_USERAMOUNT.value != '') {
total_1200_seller = total_1200_seller + parseFloat(document.hud1_form.A_1207_SELLER_USERAMOUNT.value);
}



<!--- 1300 series --->
var total_1301_borrower = 0;
var total_1300_borrower = 0;
var total_1300_seller = 0;

if (IsNumeric(document.hud1_form.A_1302_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1302_OUTSIDE_USERAMOUNT.value != '') {
total_1301_borrower = total_1301_borrower + parseFloat(document.hud1_form.A_1302_OUTSIDE_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1303_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1303_OUTSIDE_USERAMOUNT.value != '') {
total_1301_borrower = total_1301_borrower + parseFloat(document.hud1_form.A_1303_OUTSIDE_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1304_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1304_OUTSIDE_USERAMOUNT.value != '') {
total_1301_borrower = total_1301_borrower + parseFloat(document.hud1_form.A_1304_OUTSIDE_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1305_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1305_OUTSIDE_USERAMOUNT.value != '') {
total_1301_borrower = total_1301_borrower + parseFloat(document.hud1_form.A_1305_OUTSIDE_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1306_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1306_OUTSIDE_USERAMOUNT.value != '') {
total_1301_borrower = total_1301_borrower + parseFloat(document.hud1_form.A_1306_OUTSIDE_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1307_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1307_OUTSIDE_USERAMOUNT.value != '') {
total_1301_borrower = total_1301_borrower + parseFloat(document.hud1_form.A_1307_OUTSIDE_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1308_OUTSIDE_USERAMOUNT.value) &&  document.hud1_form.A_1308_OUTSIDE_USERAMOUNT.value != '') {
total_1301_borrower = total_1301_borrower + parseFloat(document.hud1_form.A_1308_OUTSIDE_USERAMOUNT.value);
}

if (IsNumeric(total_1301_borrower) &&  total_1301_borrower != '') {
document.hud1_form.A_1301_BORROWER_SERVICESYOUCANSHOPFOR.value = roundit(parseFloat(total_1301_borrower));
}

if (IsNumeric(document.hud1_form.A_1301_BORROWER_SERVICESYOUCANSHOPFOR.value) &&  document.hud1_form.A_1301_BORROWER_SERVICESYOUCANSHOPFOR.value != '') {
total_1300_borrower = total_1300_borrower + parseFloat(document.hud1_form.A_1301_BORROWER_SERVICESYOUCANSHOPFOR.value);
}

if (IsNumeric(document.hud1_form.A_1302_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1302_BORROWER_USERAMOUNT.value != '') {
total_1300_borrower = total_1300_borrower + parseFloat(document.hud1_form.A_1302_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1303_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1303_BORROWER_USERAMOUNT.value != '') {
total_1300_borrower = total_1300_borrower + parseFloat(document.hud1_form.A_1303_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1304_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1304_BORROWER_USERAMOUNT.value != '') {
total_1300_borrower = total_1300_borrower + parseFloat(document.hud1_form.A_1304_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1305_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1305_BORROWER_USERAMOUNT.value != '') {
total_1300_borrower = total_1300_borrower + parseFloat(document.hud1_form.A_1305_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1306_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1306_BORROWER_USERAMOUNT.value != '') {
total_1300_borrower = total_1300_borrower + parseFloat(document.hud1_form.A_1306_BORROWER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1307_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1307_BORROWER_USERAMOUNT.value != '') {
total_1300_borrower = total_1300_borrower + parseFloat(document.hud1_form.A_1307_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1308_BORROWER_USERAMOUNT.value) &&  document.hud1_form.A_1308_BORROWER_USERAMOUNT.value != '') {
total_1300_borrower = total_1300_borrower + parseFloat(document.hud1_form.A_1308_BORROWER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1301_SELLER_SERVICESYOUCANSHOPFOR.value) &&  document.hud1_form.A_1301_SELLER_SERVICESYOUCANSHOPFOR.value != '') {
total_1300_seller = total_1300_seller + parseFloat(document.hud1_form.A_1301_SELLER_SERVICESYOUCANSHOPFOR.value);
}

if (IsNumeric(document.hud1_form.A_1302_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1302_SELLER_USERAMOUNT.value != '') {
total_1300_seller = total_1300_seller + parseFloat(document.hud1_form.A_1302_SELLER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1303_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1303_SELLER_USERAMOUNT.value != '') {
total_1300_seller = total_1300_seller + parseFloat(document.hud1_form.A_1303_SELLER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1304_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1304_SELLER_USERAMOUNT.value != '') {
total_1300_seller = total_1300_seller + parseFloat(document.hud1_form.A_1304_SELLER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1305_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1305_SELLER_USERAMOUNT.value != '') {
total_1300_seller = total_1300_seller + parseFloat(document.hud1_form.A_1305_SELLER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1306_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1306_SELLER_USERAMOUNT.value != '') {
total_1300_seller = total_1300_seller + parseFloat(document.hud1_form.A_1306_SELLER_USERAMOUNT.value);
}
if (IsNumeric(document.hud1_form.A_1307_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1307_SELLER_USERAMOUNT.value != '') {
total_1300_seller = total_1300_seller + parseFloat(document.hud1_form.A_1307_SELLER_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_1308_SELLER_USERAMOUNT.value) &&  document.hud1_form.A_1308_SELLER_USERAMOUNT.value != '') {
total_1300_seller = total_1300_seller + parseFloat(document.hud1_form.A_1308_SELLER_USERAMOUNT.value);
}


var total_1400_borrower = 0;
var total_1400_seller = 0;
total_1400_borrower = roundit((parseFloat(total_700_borrower) + parseFloat(total_800_borrower) + parseFloat(total_900_borrower) + parseFloat(total_1000_borrower) + parseFloat(total_1100_borrower) + parseFloat(total_1200_borrower) + parseFloat(total_1300_borrower)));

total_1400_seller = roundit((parseFloat(total_700_seller) + parseFloat(total_800_seller) + parseFloat(total_900_seller) + parseFloat(total_1000_seller) + parseFloat(total_1100_seller) + parseFloat(total_1200_seller) + parseFloat(total_1300_seller)));

document.hud1_form.A_1400_BORROWER_TOTALSETTLEMENTCHARGES.value = roundit(parseFloat(total_1400_borrower));
document.hud1_form.A_0103_SETTLEMENTCHARGESTOBORROWER.value = roundit(parseFloat(total_1400_borrower));

document.hud1_form.A_1400_SELLER_TOTALSETTLEMENTCHARGES.value = roundit(parseFloat(total_1400_seller));
document.hud1_form.A_0502_SETTLEMENTCHARGESTOSELLERAMOUNT.value = roundit(parseFloat(total_1400_seller));



<!--- add up 100 series --->
var total_100_borrower = 0;
var total_100_seller = 0;

if (IsNumeric(document.hud1_form.A_0101_CONTRACTSALESPRICE.value) &&  document.hud1_form.A_0101_CONTRACTSALESPRICE.value != '') {
total_100_borrower = total_100_borrower + parseFloat(document.hud1_form.A_0101_CONTRACTSALESPRICE.value);
}

if (IsNumeric(document.hud1_form.A_0102_PERSONALPROPERTY.value) &&  document.hud1_form.A_0102_PERSONALPROPERTY.value != '') {
total_100_borrower = total_100_borrower + parseFloat(document.hud1_form.A_0102_PERSONALPROPERTY.value);
}

if (IsNumeric(document.hud1_form.A_0103_SETTLEMENTCHARGESTOBORROWER.value) &&  document.hud1_form.A_0103_SETTLEMENTCHARGESTOBORROWER.value != '') {
total_100_borrower = total_100_borrower + parseFloat(document.hud1_form.A_0103_SETTLEMENTCHARGESTOBORROWER.value);
}

if (IsNumeric(document.hud1_form.A_0104_USERAMOUNT.value) &&  document.hud1_form.A_0104_USERAMOUNT.value != '') {
total_100_borrower = total_100_borrower + parseFloat(document.hud1_form.A_0104_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0105_USERAMOUNT.value) &&  document.hud1_form.A_0105_USERAMOUNT.value != '') {
total_100_borrower = total_100_borrower + parseFloat(document.hud1_form.A_0105_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0106_CITYTOWNTAXESAMOUNT.value) &&  document.hud1_form.A_0106_CITYTOWNTAXESAMOUNT.value != '') {
total_100_borrower = total_100_borrower + parseFloat(document.hud1_form.A_0106_CITYTOWNTAXESAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0107_COUNTYTAXESAMOUNT.value) &&  document.hud1_form.A_0107_COUNTYTAXESAMOUNT.value != '') {
total_100_borrower = total_100_borrower + parseFloat(document.hud1_form.A_0107_COUNTYTAXESAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0108_ASSESSMENTSAMOUNT.value) &&  document.hud1_form.A_0108_ASSESSMENTSAMOUNT.value != '') {
total_100_borrower = total_100_borrower + parseFloat(document.hud1_form.A_0108_ASSESSMENTSAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0109_USERAMOUNT.value) &&  document.hud1_form.A_0109_USERAMOUNT.value != '') {
total_100_borrower = total_100_borrower +parseFloat( document.hud1_form.A_0109_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0110_USERAMOUNT.value) &&  document.hud1_form.A_0110_USERAMOUNT.value != '') {
total_100_borrower = total_100_borrower + parseFloat(document.hud1_form.A_0110_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0111_USERAMOUNT.value) &&  document.hud1_form.A_0111_USERAMOUNT.value != '') {
total_100_borrower = total_100_borrower + parseFloat(document.hud1_form.A_0111_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0112_USERAMOUNT.value) &&  document.hud1_form.A_0112_USERAMOUNT.value != '') {
total_100_borrower = total_100_borrower + parseFloat(document.hud1_form.A_0112_USERAMOUNT.value);
}

if (IsNumeric(total_100_borrower) &&  total_100_borrower != 0) {
document.hud1_form.A_0120_GROSS_BORROWER_DUE_AMOUNT.value = roundit(parseFloat(total_100_borrower));
document.hud1_form.A_0301_GROSSDUEFROMBORROWERAMOUNT.value = roundit(parseFloat(total_100_borrower));
}

<!--- add up 200 series --->
var total_200_borrower = 0;
var total_200_seller = 0;

if (IsNumeric(document.hud1_form.A_0201_EARNESTMONEYAMOUNT.value) &&  document.hud1_form.A_0201_EARNESTMONEYAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0201_EARNESTMONEYAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0202_PRINCIPALNEWLOANAMOUNT.value) &&  document.hud1_form.A_0202_PRINCIPALNEWLOANAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0202_PRINCIPALNEWLOANAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0203_EXISTINGLOANSAMOUNT.value) &&  document.hud1_form.A_0203_EXISTINGLOANSAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0203_EXISTINGLOANSAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0204_USERAMOUNT.value) &&  document.hud1_form.A_0204_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0204_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0205_USERAMOUNT.value) &&  document.hud1_form.A_0205_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0205_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0206_USERAMOUNT.value) &&  document.hud1_form.A_0206_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0206_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0207_USERAMOUNT.value) &&  document.hud1_form.A_0207_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0207_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0208_USERAMOUNT.value) &&  document.hud1_form.A_0208_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0208_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0209_USERAMOUNT.value) &&  document.hud1_form.A_0209_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0209_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0210_CITYTOWNTAXESAMOUNT.value) &&  document.hud1_form.A_0210_CITYTOWNTAXESAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0210_CITYTOWNTAXESAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0211_COUNTYTAXESAMOUNT.value) &&  document.hud1_form.A_0211_COUNTYTAXESAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0211_COUNTYTAXESAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0212_ASSESSMENTSAMOUNT.value) &&  document.hud1_form.A_0212_ASSESSMENTSAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0212_ASSESSMENTSAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0213_USERAMOUNT.value) &&  document.hud1_form.A_0213_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0213_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0214_USERAMOUNT.value) &&  document.hud1_form.A_0214_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0214_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0215_USERAMOUNT.value) &&  document.hud1_form.A_0215_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0215_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0216_USERAMOUNT.value) &&  document.hud1_form.A_0216_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0216_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0217_USERAMOUNT.value) &&  document.hud1_form.A_0217_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0217_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0218_USERAMOUNT.value) &&  document.hud1_form.A_0218_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0218_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0219_USERAMOUNT.value) &&  document.hud1_form.A_0219_USERAMOUNT.value != '') {
total_200_borrower = total_200_borrower + parseFloat(document.hud1_form.A_0219_USERAMOUNT.value);
}

if (IsNumeric(total_200_borrower) &&  total_200_borrower != 0) {
document.hud1_form.A_0220_TOTALPAIDBYSELLERAMOUNT.value = roundit(parseFloat(total_200_borrower));
document.hud1_form.A_0302_LESSPAIDBYBORROWERAMOUNT.value = roundit(parseFloat(total_200_borrower));
}


var cashtofromborrower = 0;
cashtofromborrower = roundit(parseFloat(total_100_borrower) - parseFloat(total_200_borrower));

if (parseFloat(cashtofromborrower) < 0) {
cashtofromborrower = (-1 * (cashtofromborrower));
document.hud1_form.A_0303_CASHTOFROM[1].value = 'To';
document.hud1_form.A_0303_CASHTOFROM[1].checked = true;
} else {
document.hud1_form.A_0303_CASHTOFROM[0].value = 'From';
document.hud1_form.A_0303_CASHTOFROM[0].checked = true;
}

document.hud1_form.A_0303_CASHAMOUNT.value = roundit(parseFloat(cashtofromborrower));

<!--- add up 400 series --->
var total_400_borrower = 0;
var total_400_seller = 0;

if (IsNumeric(document.hud1_form.A_0401_CONTRACTSALESPRICE.value) &&  document.hud1_form.A_0401_CONTRACTSALESPRICE.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0401_CONTRACTSALESPRICE.value);
}

if (IsNumeric(document.hud1_form.A_0402_PERSONALPROPERTY.value) &&  document.hud1_form.A_0402_PERSONALPROPERTY.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0402_PERSONALPROPERTY.value);
}

if (IsNumeric(document.hud1_form.A_0403_USERAMOUNT.value) &&  document.hud1_form.A_0403_USERAMOUNT.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0403_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0404_USERAMOUNT.value) &&  document.hud1_form.A_0404_USERAMOUNT.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0404_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0405_USERAMOUNT.value) &&  document.hud1_form.A_0405_USERAMOUNT.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0405_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0406_CITYTOWNTAXESAMOUNT.value) &&  document.hud1_form.A_0406_CITYTOWNTAXESAMOUNT.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0406_CITYTOWNTAXESAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0407_COUNTYTAXESAMOUNT.value) &&  document.hud1_form.A_0407_COUNTYTAXESAMOUNT.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0407_COUNTYTAXESAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0408_ASSESSMENTSAMOUNT.value) &&  document.hud1_form.A_0408_ASSESSMENTSAMOUNT.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0408_ASSESSMENTSAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0409_USERAMOUNT.value) &&  document.hud1_form.A_0409_USERAMOUNT.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0409_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0410_USERAMOUNT.value) &&  document.hud1_form.A_0410_USERAMOUNT.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0410_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0411_USERAMOUNT.value) &&  document.hud1_form.A_0411_USERAMOUNT.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0411_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0412_USERAMOUNT.value) &&  document.hud1_form.A_0412_USERAMOUNT.value != '') {
total_400_seller = total_400_seller + parseFloat(document.hud1_form.A_0412_USERAMOUNT.value);
}

if (IsNumeric(total_400_seller) &&  total_400_seller != '') {
document.hud1_form.A_0420_GROSS_SELLER_DUE_AMOUNT.value = roundit(parseFloat(total_400_seller));
document.hud1_form.A_0601_GROSSDUETOSELLERAMOUNT.value = roundit(parseFloat(total_400_seller));
}

<!--- add up 500 series --->
var total_500_borrower = 0;
var total_500_seller = 0;

if (IsNumeric(document.hud1_form.A_0501_EXCESSDEPOSITAMOUNT.value) &&  document.hud1_form.A_0501_EXCESSDEPOSITAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0501_EXCESSDEPOSITAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0502_SETTLEMENTCHARGESTOSELLERAMOUNT.value) &&  document.hud1_form.A_0502_SETTLEMENTCHARGESTOSELLERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0502_SETTLEMENTCHARGESTOSELLERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0503_EXISTINGLOANSAMOUNT.value) &&  document.hud1_form.A_0503_EXISTINGLOANSAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0503_EXISTINGLOANSAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0504_PAYOFFFIRSTMORTGAGEAMOUNT.value) &&  document.hud1_form.A_0504_PAYOFFFIRSTMORTGAGEAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0504_PAYOFFFIRSTMORTGAGEAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0505_PAYOFFSECONDMORTGAGEAMOUNT.value) &&  document.hud1_form.A_0505_PAYOFFSECONDMORTGAGEAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0505_PAYOFFSECONDMORTGAGEAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0506_USERAMOUNT.value) &&  document.hud1_form.A_0506_USERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0506_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0507_USERAMOUNT.value) &&  document.hud1_form.A_0507_USERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0507_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0508_USERAMOUNT.value) &&  document.hud1_form.A_0508_USERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0508_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0509_USERAMOUNT.value) &&  document.hud1_form.A_0509_USERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0509_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0510_CITYTOWNTAXESAMOUNT.value) &&  document.hud1_form.A_0510_CITYTOWNTAXESAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0510_CITYTOWNTAXESAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0511_COUNTYTAXESAMOUNT.value) &&  document.hud1_form.A_0511_COUNTYTAXESAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0511_COUNTYTAXESAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0512_ASSESSMENTSAMOUNT.value) &&  document.hud1_form.A_0512_ASSESSMENTSAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0512_ASSESSMENTSAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0513_USERAMOUNT.value) &&  document.hud1_form.A_0513_USERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0513_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0514_USERAMOUNT.value) &&  document.hud1_form.A_0514_USERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0514_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0515_USERAMOUNT.value) &&  document.hud1_form.A_0515_USERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0515_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0516_USERAMOUNT.value) &&  document.hud1_form.A_0516_USERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0516_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0517_USERAMOUNT.value) &&  document.hud1_form.A_0517_USERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0517_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0518_USERAMOUNT.value) &&  document.hud1_form.A_0518_USERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0518_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.A_0519_USERAMOUNT.value) &&  document.hud1_form.A_0519_USERAMOUNT.value != '') {
total_500_seller = total_500_seller + parseFloat(document.hud1_form.A_0519_USERAMOUNT.value);
}

if (IsNumeric(total_500_seller) &&  total_500_seller != 0) {
document.hud1_form.A_0520_REDUCTIONDUESELLERAMOUNT.value = parseFloat(total_500_seller);
document.hud1_form.A_0602_LESSREDUCTIONSDUESELLERAMOUNT.value = parseFloat(total_500_seller);
}

var cashtofromseller = 0;
cashtofromseller = parseFloat(total_400_seller) - parseFloat(total_500_seller);
if (parseFloat(cashtofromseller) < 0) {
cashtofromseller = (-1 * (cashtofromseller));
document.hud1_form.A_0603_CASHTOFROM[1].value = 'To';
document.hud1_form.A_0603_CASHTOFROM[1].checked = true;
} else {
document.hud1_form.A_0603_CASHTOFROM[0].value = 'From';
document.hud1_form.A_0603_CASHTOFROM[0].checked = true;
}
document.hud1_form.A_0603_CASHAMOUNT.value = parseFloat(cashtofromseller);



var GFE_total = 0

var HUD_total = 0
if (IsNumeric(document.hud1_form.COMPARE_05_GFE_GOVTRECCHARGE.value) &&  document.hud1_form.COMPARE_05_GFE_GOVTRECCHARGE.value != '') {
GFE_total = GFE_total + parseFloat(document.hud1_form.COMPARE_05_GFE_GOVTRECCHARGE.value);
}

if (IsNumeric(document.hud1_form.COMPARE_06_GFE_USERAMOUNT.value) &&  document.hud1_form.COMPARE_06_GFE_USERAMOUNT.value != '') {
GFE_total = GFE_total + parseFloat(document.hud1_form.COMPARE_06_GFE_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.COMPARE_07_GFE_USERAMOUNT.value) &&  document.hud1_form.COMPARE_07_GFE_USERAMOUNT.value != '') {
GFE_total = GFE_total + parseFloat(document.hud1_form.COMPARE_07_GFE_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.COMPARE_08_GFE_USERAMOUNT.value) &&  document.hud1_form.COMPARE_08_GFE_USERAMOUNT.value != '') {
GFE_total = GFE_total + parseFloat(document.hud1_form.COMPARE_08_GFE_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.COMPARE_10_GFE_USERAMOUNT.value) &&  document.hud1_form.COMPARE_10_GFE_USERAMOUNT.value != '') {
GFE_total = GFE_total + parseFloat(document.hud1_form.COMPARE_10_GFE_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.COMPARE_11_GFE_USERAMOUNT.value) &&  document.hud1_form.COMPARE_11_GFE_USERAMOUNT.value != '') {
GFE_total = GFE_total + parseFloat(document.hud1_form.COMPARE_11_GFE_USERAMOUNT.value);
}

if (IsNumeric(document.hud1_form.COMPARE_12_GFE_USERAMOUNT.value) &&  document.hud1_form.COMPARE_12_GFE_USERAMOUNT.value != '') {
GFE_total = GFE_total + parseFloat(document.hud1_form.COMPARE_12_GFE_USERAMOUNT.value);
}


document.hud1_form.COMPARE_GFE_TOTAL_USERAMOUNT.value = roundit(GFE_total);

if (IsNumeric(document.hud1_form.COMPARE_GFE_TOTAL_USERAMOUNT.value) &&  document.hud1_form.COMPARE_GFE_TOTAL_USERAMOUNT.value != '' && IsNumeric(document.hud1_form.COMPARE_HUD_TOTAL_USERAMOUNT.value) &&  document.hud1_form.COMPARE_HUD_TOTAL_USERAMOUNT.value != '') {
temp_num =  parseFloat(document.hud1_form.COMPARE_HUD_TOTAL_USERAMOUNT.value) - parseFloat(document.hud1_form.COMPARE_GFE_TOTAL_USERAMOUNT.value);
temp_num_percentage =  parseFloat(temp_num) / parseFloat(document.hud1_form.COMPARE_GFE_TOTAL_USERAMOUNT.value);

if (temp_num_percentage == 1) {
temp_num_percentage = 0;
}

document.hud1_form.COMPARE_GFE_TOTAL_DIFFERENCE.value = roundit(temp_num);
document.hud1_form.COMPARE_HUD_TOTAL_DIFFERENCE.value = temp_num_percentage;

}

}
</script>




<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:10px;}
textarea { font-family:arial,sans-serif; font-size:10px; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; width:180px; }
input.userout { font-size:10px; width:160px; }
input.userin { font-size:10px; width:180px;  text-align:right;}
p.pagebreak { page-break-before:always }
.page_container { width:1110px; }
.page_title { font-size:20px; }
.table_header { font-weight:bold; background-color:black; color:white; }
.bsilver { border-right:1px solid black; border-left:1px solid black; border-bottom:1px solid black;  background-color:##dddddd; }
.bdarksilver { border:1px solid black; background-color:##bbbbbb; }
.bdarksilver_head { border:1px solid black; font-weight:bold; background-color:##bbbbbb; }
.black { font-weight:bold; background-color:black; color:white; }
.bordered { border-bottom:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.bordered_wleft { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
input.two_digit { width:100px}
input.date { width:100px; }
<cfif isDefined('form.populatevarnames')>
.page_container { width:1470px; }
textarea { font-family:arial,sans-serif; font-size:10px; color:##004000; background:##cdfed0; border:1px dotted ##004000; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; width:180px; color:##004000;background:##cdfed0; border:1px dotted ##004000; }
input.userout { font-size:10px; width:180px; color:##400000; background:##ffdfdf; border:1px dotted ##400000; }
input.userin { font-size:10px; width:180px; color:##400000; background:##ffdfdf; border:1px dotted ##400000; text-align:right;}
input.userinright { font-size:10px; width:80px; color:##400000; background:##ffdfdf; border:1px dotted ##400000; text-align:right;}
input.userinleft { font-size:10px; width:80px; color:##400000; background:##ffdfdf; border:1px dotted ##400000; text-align:left;}
input.two_digit { width:180px}
input.date { width:180px; }
-->
</style>
	<cfset fieldlist=form.fieldnames>
	<cfset fieldlist=ListDeleteAt(fieldlist,ListFindNoCase(fieldlist,'POPULATEVARNAMES'))>
	<script type="text/javascript" language="JavaScript"><!--
		function writeName() {
		<cfloop list="#fieldlist#" index="i">document.hud1_form.#i#.value = '#i#';
		</cfloop> }
	//--></script>
	</head>
	<body onLoad="re_add_form();">
<cfelse>
-->
</style>
	</head>
	<body onload="re_add_form();">
</cfif>



	<IFRAME STYLE="display:none;position:absolute;width:157;height:158;z-index=100" ID="CalFrame" MARGINHEIGHT=0 MARGINWIDTH=0 NORESIZE FRAMEBORDER=0 SCROLLING=NO SRC="calendar/popup_calendar.html"></IFRAME>

<div class="page_container">

<form action="https://#cgi.server_name#/admin_area/HUD1_2010_modify_submit.cfm" method="post" name="hud1_form">
<input type="hidden" name="rec_id" value="#rec_id#" >
<input type="hidden" name="viewprint" value="0" >
<input type="hidden" name="sendemail" value="0" ><br>
<center>
<table width="350" cellpadding=6 cellspacing=2 border=0>
<tr>
<td width="150" valign="bottom" align="center" ><input type="submit" name="submit" onClick="document.hud1_form.viewprint.value=1;" value="View or Print">
</td>
<td width="50" align="center" valign="bottom">&nbsp;or&nbsp;</td>
<td width="150" align="center" valign="bottom"><cfif Len(url.sendtoaddr)>HUD-1 emailed to #url.sendtoaddr#<br></cfif><input type="text" name="email_to_send" value=""><br>
<input type="submit" name="submit" onClick="document.hud1_form.sendemail.value=1;" value="Send to Email Address">
</td>
</tr>
</table>
</center><!--- <br /><br /><br />
<input type="submit" name="populatevarnames" value="Populate Variable Names" >
<input type="submit" name="clearvarnames" value="Clear Variable Names" >
<br /><br /><br />

	<cfif isDefined('form.populatevarnames')>
		<span class="page_title">#ListLen(form.fieldnames)# Form Fields Found</span>
		<br />
		<span class="left_text"><em>click below for details</em></span>
		<cfset structVarList=StructCopy(#form#)>
		<cfset boolDeleteSuccess=StructDelete(structVarList, "FIELDNAMES")>
		<cfdump var="#structVarList#" expand="false" label="Form Scope Dump (FORM.FIELDNAMES removed)">
	<cfelse>
		<span class="page_title">Press the button to populate the variable names. </span>
	</cfif>

<br /><br /><br />

<!-- HEADER
<img alt="HUD Logo" src="HUD%20Logo.png" height="64" width="70" />
<div style="position:absolute;top:24;left:82"><span class="page_title">A. Settlement Statement (HUD-1)</span></div>
<div style="position:absolute;top:23;left:518"><span>OMB Approval No. 2502-0265</span></div>
    	-->
 --->
<!-- TABLE: Type of Loan -->
<table width="100%" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td colspan="4" class="black">B. Type of Loan</td>
</tr>
<tr>
<td>
<table summary="Loan Types" cellpadding="0" cellspacing="0">
<tr>
<td><input type="radio" name="B_LOANTYPE" value="FHA" <cfif get_hud_data.B_LOANTYPE eq 'FHA'>checked</cfif> /></td><td>FHA</td>
<td><input type="radio" name="B_LOANTYPE" value="RHS" <cfif get_hud_data.B_LOANTYPE eq 'RHS'>checked</cfif> /></td><td>RHS</td>
<td><input type="radio" name="B_LOANTYPE" value="COU" <cfif get_hud_data.B_LOANTYPE eq 'COU'>checked</cfif> /></td><td>Conv. Unins.</td>
<tr>
<tr>
<td><input type="radio" name="B_LOANTYPE" value="VA" <cfif get_hud_data.B_LOANTYPE eq 'VA'>checked</cfif> /></td><td>VA</td>
<td><input type="radio" name="B_LOANTYPE" value="COI" <cfif get_hud_data.B_LOANTYPE eq 'COI'>checked</cfif> /></td><td>Conv. Ins.</td>
<tr>
</table>
</td>
<td>6. File Number: <br /> <input type="text" class="text" name="B_6_FILENUMBER" value="#get_title_data.title_id#" onFocus="this.blur();" /> </td>
<td>7. Loan Number: <br /> <input type="text" class="text" name="B_7_LOANNUMBER" value="#get_title_data.loan_number#" onFocus="this.blur();" /> </td>
<td>8. Mortgage Insurance Case Number: <br /> <input type="text" class="text" name="B_8_CASENUMBER" value="#get_hud_data.B_8_CASENUMBER#" /> </td>
</tr>
<tr>
<td colspan="4"><b>C. Note:</b> This form is furnished to give you a statement of actual settlement costs. Amounts paid to and by the settlement agent are shown. Items marked
"(p.o.c.)" were paid outside the closing; they are shown here for informational purposes and are not included in the totals.</td>
</tr>
<tr>
<td>D. Name &amp; Address of Borrower: <br /> <textarea cols="40" rows="3" name="D_BORROWERNAMEADDRESS" onFocus="this.blur();">#get_hud_data.D_BORROWERNAMEADDRESS#</textarea> </td>
<td colspan="2">E. Name &amp; Address of Seller: <br /> <textarea cols="40" rows="3" name="E_SELLERNAMEADDRESS">#get_hud_data.E_SELLERNAMEADDRESS#</textarea> </td>
<td>F. Name &amp; Address of Lender: <br /> <textarea cols="40" rows="3" name="F_LENDERNAMEADDRESS">#get_hud_data.F_LENDERNAMEADDRESS#</textarea> </td>
</tr>
<tr>
<td rowspan="2" valign="top">G. Property Location: <br />
<input type="text" class="text" name="PADDRESS"  value="#get_title_data.PADDRESS#" onFocus="this.blur();" /> <br />
<input type="text" class="text" name="PCOUNTY" value="#get_title_data.PCOUNTY#" onFocus="this.blur();" /> <br />
<input type="text" class="text" name="PCITY" value="#get_title_data.PCITY#" onFocus="this.blur();" /> <br />
<input type="text" class="text" name="PSTATE" value="#get_title_data.PSTATE#" onFocus="this.blur();" /> <br />
<input type="text" class="text" name="PZIP" value="#get_title_data.PZIP#" onFocus="this.blur();" />
</td>
<td colspan="2">H. Settlement Agent: <br /> <input type="text" class="text" name="H_SETTLEMENTAGENT"  value="<cfif Len(get_hud_data.H_SETTLEMENTAGENT)>#get_hud_data.H_SETTLEMENTAGENT#<cfelse><cfif get_company_data.streamline_client eq 'True'>Streamline Title & Escrow<cfelse>First Title & Escrow</cfif></cfif>" /> </td>
<td>I. Settlement Date: <br /> <input type="text" class="date" name="I_1_SETTLEMENTDATE"  value="<cfif get_hud_data.I_1_SETTLEMENTDATE NEQ 'NULL'>#DateFormat(get_hud_data.I_1_SETTLEMENTDATE, 'm/d/yyyy')#</cfif>" />
<A href="javascript:ShowCalendar(document.all('calpic'),document.all('I_1_SETTLEMENTDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A> </td>
</tr>
<tr>
<td colspan="2">Place of Settlement: <br /> <textarea cols="40" rows="3" name="I_2_SETTLEMENTADDRESS"><cfif Len(get_hud_data.I_2_SETTLEMENTADDRESS)>#get_hud_data.I_2_SETTLEMENTADDRESS#<cfelse>7361 Calhoun Place, Suite 200, Rockville, MD 20855</cfif></textarea></td>
<td>&nbsp;</td>
</tr>
</table><!-- TABLE: Type of Loan -->

<br />

<!-- TABLE: Summary of Transactions -->
<table width="100%" cellspacing="0" border="0" summary="Summary of Transactions">
<tr>
<td colspan="2" class="table_header">J. Summary of Borrower's Transaction</td>
<td>&nbsp;  </td>
<td colspan="2" class="table_header">K. Summary of Seller's Transaction</td>
</tr>
<tr><td height="1" colspan="2"></td><td></td><td height="1" colspan="2"></td></tr>
<tr>
<td colspan="2" class="bdarksilver_head">100. Gross Amount Due from Borrower</td>
<td></td>
<td colspan="2" class="bdarksilver_head">400. Gross Amount Due to Seller</td>
</tr>
<tr>
<td class="bsilver">101. Contract sales price</td>
<td class="bordered"><input type="text" class="userin" name="A_0101_CONTRACTSALESPRICE"  value="#Trim(get_hud_data.A_0101_CONTRACTSALESPRICE)#"  onFocus="this.blur();" /></td>
<td></td>
<td class="bsilver">401. Contract sales price</td>
<td class="bordered"><input type="text" class="userin" name="A_0401_CONTRACTSALESPRICE"  value="#get_hud_data.A_0401_CONTRACTSALESPRICE#" onChange="re_add_form();"  /></td>
</tr>
<tr>
<td class="bsilver">102. <cfif (get_title_data.comp_id eq 3722 or get_title_data.comp_id eq 4702 or get_title_data.comp_id eq 4752) and Len(get_title_data.share_loan_payoff)>Personal Share Loan Payoff<cfelse>Personal property</cfif></td>
<td class="bordered"><input type="text" class="userin" name="A_0102_PERSONALPROPERTY"  value="#get_hud_data.A_0102_PERSONALPROPERTY#" onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">402. Personal property</td>
<td class="bordered"><input type="text" class="userin" name="A_0402_PERSONALPROPERTY"  value="#get_hud_data.A_0402_PERSONALPROPERTY#" onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">103. Settlement charges to borrower (line 1400)</td>
<td class="bordered"><input type="text" class="userin" name="A_0103_SETTLEMENTCHARGESTOBORROWER"  value="#get_hud_data.A_0103_SETTLEMENTCHARGESTOBORROWER#" onChange="re_add_form();" onFocus="this.blur();" /></td>
<td></td>
<td class="bsilver">403. <input type="text" class="userout" name="A_0403_USERDESC"  value="#get_hud_data.A_0403_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0403_USERAMOUNT" value="#get_hud_data.A_0403_USERAMOUNT#" onChange="re_add_form();"  /></td>
</tr>
<tr>
<td class="bsilver">104. <input type="text" class="userout" name="A_0104_USERDESC"  value="#get_hud_data.A_0104_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0104_USERAMOUNT" value="#get_hud_data.A_0104_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">404. <input type="text" class="userout" name="A_0404_USERDESC" value="#get_hud_data.A_0404_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0404_USERAMOUNT" value="#get_hud_data.A_0404_USERAMOUNT#" onChange="re_add_form();"  /></td>
</tr>
<tr>
<td class="bsilver">105. <input type="text" class="userout" name="A_0105_USERDESC" value="#get_hud_data.A_0105_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0105_USERAMOUNT" value="#get_hud_data.A_0105_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">405. <input type="text" class="userout" name="A_0405_USERDESC" value="#get_hud_data.A_0405_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0405_USERAMOUNT" value="#get_hud_data.A_0405_USERAMOUNT#" onChange="re_add_form();"  /></td>
</tr>
<tr>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustment for items paid by seller in advance</td>
<td></td>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items paid by seller in advance</td>
</tr>
<tr>
<td class="bsilver">106. City/town taxes
<input type="text" class="date" name="A_0106_CITYTOWNTAXESDATEFROM"  value="<cfif get_hud_data.A_0106_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0106_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic2'),document.all('A_0106_CITYTOWNTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic2" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0106_CITYTOWNTAXESDATETO"  value="<cfif get_hud_data.A_0106_CITYTOWNTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0106_CITYTOWNTAXESDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic3'),document.all('A_0106_CITYTOWNTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic3" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0106_CITYTOWNTAXESAMOUNT"  value="#get_hud_data.A_0106_CITYTOWNTAXESAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">406. City/town taxes
<input type="text" class="date" name="A_0406_CITYTOWNTAXESDATEFROM" value="<cfif get_hud_data.A_0406_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0406_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic4'),document.all('A_0406_CITYTOWNTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic4" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0406_CITYTOWNTAXESDATETO" value="<cfif get_hud_data.A_0406_CITYTOWNTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0406_CITYTOWNTAXESDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic5'),document.all('A_0406_CITYTOWNTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic5" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0406_CITYTOWNTAXESAMOUNT"  value="#get_hud_data.A_0406_CITYTOWNTAXESAMOUNT#" onChange="re_add_form();"  /></td>
</tr>
<tr>
<td class="bsilver">107. County taxes
<input type="text" class="date" name="A_0107_COUNTYTAXESDATEFROM" value="<cfif get_hud_data.A_0107_COUNTYTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0107_COUNTYTAXESDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic6'),document.all('A_0107_COUNTYTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic6" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0107_COUNTYTAXESDATETO" value="<cfif get_hud_data.A_0107_COUNTYTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0107_COUNTYTAXESDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic7'),document.all('A_0107_COUNTYTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic7" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0107_COUNTYTAXESAMOUNT" value="#get_hud_data.A_0107_COUNTYTAXESAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">407. County taxes
<input type="text" class="date" name="A_0407_COUNTYTAXESDATEFROM" value="<cfif get_hud_data.A_0407_COUNTYTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0407_COUNTYTAXESDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic8'),document.all('A_0407_COUNTYTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic8" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0407_COUNTYTAXESDATETO" value="<cfif get_hud_data.A_0407_COUNTYTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0407_COUNTYTAXESDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic9'),document.all('A_0407_COUNTYTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic9" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0407_COUNTYTAXESAMOUNT" value="#get_hud_data.A_0407_COUNTYTAXESAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">108. Assessments
<input type="text" class="date" name="A_0108_ASSESSMENTSDATEFROM" value="<cfif get_hud_data.A_0108_ASSESSMENTSDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0108_ASSESSMENTSDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic10'),document.all('A_0108_ASSESSMENTSDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic10" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0108_ASSESSMENTSDATETO" value="<cfif get_hud_data.A_0108_ASSESSMENTSDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0108_ASSESSMENTSDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic11'),document.all('A_0108_ASSESSMENTSDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic11" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0108_ASSESSMENTSAMOUNT" value="#get_hud_data.A_0108_ASSESSMENTSAMOUNT#" onChange="re_add_form();"  /></td>
<td></td>
<td class="bsilver">408. Assessments
<input type="text" class="date" name="A_0408_ASSESSMENTSDATEFROM" value="<cfif get_hud_data.A_0408_ASSESSMENTSDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0408_ASSESSMENTSDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic12'),document.all('A_0408_ASSESSMENTSDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic12" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0408_ASSESSMENTSDATETO" value="<cfif get_hud_data.A_0408_ASSESSMENTSDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0408_ASSESSMENTSDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic13'),document.all('A_0408_ASSESSMENTSDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic13" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0408_ASSESSMENTSAMOUNT" value="#get_hud_data.A_0408_ASSESSMENTSAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">109. <input type="text" class="userout" name="A_0109_USERDESC" value="#get_hud_data.A_0109_USERDESC#" />
 to <input type="text" class="userout" name="A_0109_USERPAYTO" value="#get_hud_data.A_0109_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0109_USERAMOUNT" value="#get_hud_data.A_0109_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">409. <input type="text" class="userout" name="A_0409_USERDESC" value="#get_hud_data.A_0409_USERDESC#" />
to <input type="text" class="userout" name="A_0409_USERPAYTO" value="#get_hud_data.A_0409_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0409_USERAMOUNT" value="#get_hud_data.A_0409_USERAMOUNT#" onChange="re_add_form();"  /></td>
</tr>
<tr>
<td class="bsilver">110. <input type="text" class="userout" name="A_0110_USERDESC" value="#get_hud_data.A_0110_USERDESC#" />
to <input type="text" class="userout" name="A_0110_USERPAYTO" value="#get_hud_data.A_0110_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0110_USERAMOUNT" value="#get_hud_data.A_0110_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">410. <input type="text" class="userout" name="A_0410_USERDESC" value="#get_hud_data.A_0410_USERDESC#" />
to <input type="text" class="userout" name="A_0410_USERPAYTO" value="#get_hud_data.A_0410_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0410_USERAMOUNT" value="#get_hud_data.A_0410_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">111. <input type="text" class="userout" name="A_0111_USERDESC" value="#get_hud_data.A_0111_USERDESC#" />
to <input type="text" class="userout" name="A_0111_USERPAYTO" value="#get_hud_data.A_0111_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0111_USERAMOUNT" value="#get_hud_data.A_0111_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">411. <input type="text" class="userout" name="A_0411_USERDESC" value="#get_hud_data.A_0411_USERDESC#" />
to <input type="text" class="userout" name="A_0411_USERPAYTO" value="#get_hud_data.A_0411_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0411_USERAMOUNT" value="#get_hud_data.A_0411_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">112. <input type="text" class="userout" name="A_0112_USERDESC" value="#get_hud_data.A_0112_USERDESC#" />
to <input type="text" class="userout" name="A_0112_USERPAYTO" value="#get_hud_data.A_0112_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0112_USERAMOUNT" value="#get_hud_data.A_0112_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">412. <input type="text" class="userout" name="A_0412_USERDESC" value="#get_hud_data.A_0412_USERDESC#" />
to <input type="text" class="userout" name="A_0412_USERPAYTO" value="#get_hud_data.A_0412_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0412_USERAMOUNT" value="#get_hud_data.A_0412_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>

<tr>
<td class="bsilver"><br /><b>120. Gross Amount Due from Borrower</b></td>
<td class="bordered"><input type="text" class="userin" name="A_0120_GROSS_BORROWER_DUE_AMOUNT" value="#get_hud_data.A_0120_GROSS_BORROWER_DUE_AMOUNT#" onFocus="this.blur();" /></td>
<td></td>
<td class="bsilver"><br /><b>420. Gross Amount Due to Seller</b></td>
<td class="bordered"><input type="text" class="userin" name="A_0420_GROSS_SELLER_DUE_AMOUNT" value="#get_hud_data.A_0420_GROSS_SELLER_DUE_AMOUNT#" onFocus="this.blur();" /></td>
</tr>
<!-- 200 / 500 -->

<tr>
<td colspan="2" class="bdarksilver_head">200. Amounts Paid by or in Behalf of Borrower</td>
<td></td>
<td colspan="2" class="bdarksilver_head">500. Reductions In Amount Due to Seller</td>
</tr>
<tr>
<td class="bsilver">201. Deposit or earnest money</td>
<td class="bordered"><input type="text" class="userin" name="A_0201_EARNESTMONEYAMOUNT" value="#get_hud_data.A_0201_EARNESTMONEYAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">501. Excess deposit (see instructions)</td>
<td class="bordered"><input type="text" class="userin" name="A_0501_EXCESSDEPOSITAMOUNT" value="#get_hud_data.A_0501_EXCESSDEPOSITAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">202. Principal amount of new loan(s)</td>
<td class="bordered"><input type="text" class="userin" name="A_0202_PRINCIPALNEWLOANAMOUNT" value="#get_hud_data.A_0202_PRINCIPALNEWLOANAMOUNT#" onChange="re_add_form();"  /></td>
<td></td>
<td class="bsilver">502. Settlement charges to seller (line 1400)</td>
<td class="bordered"><input type="text" class="userin" name="A_0502_SETTLEMENTCHARGESTOSELLERAMOUNT" value="#get_hud_data.A_0502_SETTLEMENTCHARGESTOSELLERAMOUNT#"  onChange="re_add_form();" onFocus="this.blur();"  /></td>
</tr>
<tr>
<td class="bsilver">203. Existing loan(s) taken subject to</td>
<td class="bordered"><input type="text" class="userin" name="A_0203_EXISTINGLOANSAMOUNT" value="#get_hud_data.A_0203_EXISTINGLOANSAMOUNT#" onChange="re_add_form();"  /></td>
<td></td>
<td class="bsilver">503. Existing loan(s) taken subject to</td>
<td class="bordered"><input type="text" class="userin" name="A_0503_EXISTINGLOANSAMOUNT" value="#get_hud_data.A_0503_EXISTINGLOANSAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">204. <input type="text" class="userout" name="A_0204_USERDESC" value="#get_hud_data.A_0204_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0204_USERAMOUNT" value="#get_hud_data.A_0204_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">504. Payoff of first mortgage loan</td>
<td class="bordered"><input type="text" class="userin" name="A_0504_PAYOFFFIRSTMORTGAGEAMOUNT" value="#get_hud_data.A_0504_PAYOFFFIRSTMORTGAGEAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">205. <input type="text" class="userout" name="A_0205_USERDESC" value="#get_hud_data.A_0205_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0205_USERAMOUNT" value="#get_hud_data.A_0205_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">505. Payoff of second mortgage loan</td>
<td class="bordered"><input type="text" class="userin" name="A_0505_PAYOFFSECONDMORTGAGEAMOUNT" value="#get_hud_data.A_0505_PAYOFFSECONDMORTGAGEAMOUNT#" onChange="re_add_form();"  /></td>
</tr>
<tr>
<td class="bsilver">206. <input type="text" class="userout" name="A_0206_USERDESC" value="#get_hud_data.A_0206_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0206_USERAMOUNT" value="#get_hud_data.A_0206_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">506. <input type="text" class="userout" name="A_0506_USERDESC" value="#get_hud_data.A_0506_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0506_USERAMOUNT" value="#get_hud_data.A_0506_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">207. <input type="text" class="userout" name="A_0207_USERDESC" value="#get_hud_data.A_0207_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0207_USERAMOUNT" value="#get_hud_data.A_0207_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">507. <input type="text" class="userout" name="A_0507_USERDESC" value="#get_hud_data.A_0507_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0507_USERAMOUNT" value="#get_hud_data.A_0507_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">208. <input type="text" class="userout" name="A_0208_USERDESC" value="#get_hud_data.A_0208_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0208_USERAMOUNT" value="#get_hud_data.A_0208_USERAMOUNT#" onChange="re_add_form();"  /></td>
<td></td>
<td class="bsilver">508. <input type="text" class="userout" name="A_0508_USERDESC" value="#get_hud_data.A_0508_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0508_USERAMOUNT" value="#get_hud_data.A_0508_USERAMOUNT#" onChange="re_add_form();"  /></td>
</tr>
<tr>
<td class="bsilver">209. <input type="text" class="userout" name="A_0209_USERDESC" value="#get_hud_data.A_0209_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0209_USERAMOUNT" value="#get_hud_data.A_0209_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">509. <input type="text" class="userout" name="A_0509_USERDESC" value="#get_hud_data.A_0509_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0509_USERAMOUNT" value="#get_hud_data.A_0509_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>

<!-- Adjustments 200 / 500 -->

<tr>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items unpaid by seller</td>
<td></td>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items unpaid by seller</td>
</tr>
<tr>
<td class="bsilver">210. City/town taxes
<input type="text" class="date" name="A_0210_CITYTOWNTAXESDATEFROM" value="<cfif get_hud_data.A_0210_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0210_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic14'),document.all('A_0210_CITYTOWNTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic14" style="POSITION: relative"></A>
 to <input type="text" class="date" name="A_0210_CITYTOWNTAXESDATETO" value="<cfif get_hud_data.A_0210_CITYTOWNTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0210_CITYTOWNTAXESDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic15'),document.all('A_0210_CITYTOWNTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic15" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0210_CITYTOWNTAXESAMOUNT" value="#get_hud_data.A_0210_CITYTOWNTAXESAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">510. City/town taxes
<input type="text" class="date" name="A_0510_CITYTOWNTAXESDATEFROM" value="<cfif get_hud_data.A_0510_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0510_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#</cfif>" /> <A href="javascript:ShowCalendar(document.all('calpic16'),document.all('A_0510_CITYTOWNTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic16" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0510_CITYTOWNTAXESDATETO" value="<cfif get_hud_data.A_0510_CITYTOWNTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0510_CITYTOWNTAXESDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic17'),document.all('A_0510_CITYTOWNTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic17" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0510_CITYTOWNTAXESAMOUNT" value="#get_hud_data.A_0510_CITYTOWNTAXESAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">211. County taxes
<input type="text" class="date" name="A_0211_COUNTYTAXESDATEFROM" value="<cfif get_hud_data.A_0211_COUNTYTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0211_COUNTYTAXESDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic18'),document.all('A_0211_COUNTYTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic18" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0211_COUNTYTAXESDATETO" value="<cfif get_hud_data.A_0211_COUNTYTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0211_COUNTYTAXESDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic19'),document.all('A_0211_COUNTYTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic19" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0211_COUNTYTAXESAMOUNT" value="#get_hud_data.A_0211_COUNTYTAXESAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">511. County taxes
<input type="text" class="date" name="A_0511_COUNTYTAXESDATEFROM" value="<cfif get_hud_data.A_0511_COUNTYTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0511_COUNTYTAXESDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic20'),document.all('A_0511_COUNTYTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic20" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0511_COUNTYTAXESDATETO" value="<cfif get_hud_data.A_0511_COUNTYTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0511_COUNTYTAXESDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic21'),document.all('A_0511_COUNTYTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic21" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0511_COUNTYTAXESAMOUNT" value="#get_hud_data.A_0511_COUNTYTAXESAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">212. Assessments
<input type="text" class="date" name="A_0212_ASSESSMENTSDATEFROM" value="<cfif get_hud_data.A_0212_ASSESSMENTSDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0212_ASSESSMENTSDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic22'),document.all('A_0212_ASSESSMENTSDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic22" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0212_ASSESSMENTSDATETO" value="<cfif get_hud_data.A_0212_ASSESSMENTSDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0212_ASSESSMENTSDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic23'),document.all('A_0212_ASSESSMENTSDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic23" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0212_ASSESSMENTSAMOUNT" value="#get_hud_data.A_0212_ASSESSMENTSAMOUNT#" onChange="re_add_form();"  /></td>
<td></td>
<td class="bsilver">512. Assessments
<input type="text" class="date" name="A_0512_ASSESSMENTSDATEFROM" value="<cfif get_hud_data.A_0512_ASSESSMENTSDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0512_ASSESSMENTSDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic24'),document.all('A_0512_ASSESSMENTSDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic24" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0512_ASSESSMENTSDATETO" value="<cfif get_hud_data.A_0512_ASSESSMENTSDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0512_ASSESSMENTSDATETO, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic25'),document.all('A_0512_ASSESSMENTSDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic25" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="userin" name="A_0512_ASSESSMENTSAMOUNT" value="#get_hud_data.A_0512_ASSESSMENTSAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">213. <input type="text" class="userout" name="A_0213_USERDESC" value="#get_hud_data.A_0213_USERDESC#" />
 to <input type="text" class="userout" name="A_0213_USERPAYTO" value="#get_hud_data.A_0213_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0213_USERAMOUNT" value="#get_hud_data.A_0213_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">513.  <input type="text" class="userout" name="A_0513_USERDESC" value="#get_hud_data.A_0513_USERDESC#" />
to <input type="text" class="userout" name="A_0513_USERPAYTO" value="#get_hud_data.A_0513_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0513_USERAMOUNT" value="#get_hud_data.A_0513_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">214. <input type="text" class="userout" name="A_0214_USERDESC" value="#get_hud_data.A_0214_USERDESC#" />
to <input type="text" class="userout" name="A_0214_USERPAYTO" value="#get_hud_data.A_0214_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0214_USERAMOUNT" value="#get_hud_data.A_0214_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">514.  <input type="text" class="userout" name="A_0514_USERDESC" value="#get_hud_data.A_0514_USERDESC#" />
to <input type="text" class="userout" name="A_0514_USERPAYTO" value="#get_hud_data.A_0514_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0514_USERAMOUNT" value="#get_hud_data.A_0514_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">215. <input type="text" class="userout" name="A_0215_USERDESC" value="#get_hud_data.A_0215_USERDESC#" />
to <input type="text" class="userout" name="A_0215_USERPAYTO" value="#get_hud_data.A_0215_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0215_USERAMOUNT" value="#get_hud_data.A_0215_USERAMOUNT#" onChange="re_add_form();"  /></td>
<td></td>
<td class="bsilver">515.  <input type="text" class="userout" name="A_0515_USERDESC" value="#get_hud_data.A_0515_USERDESC#" />
to <input type="text" class="userout" name="A_0515_USERPAYTO" value="#get_hud_data.A_0515_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0515_USERAMOUNT" value="#get_hud_data.A_0515_USERAMOUNT#" onChange="re_add_form();"  /></td>
</tr>
<tr>
<td class="bsilver">216. <input type="text" class="userout" name="A_0216_USERDESC" value="#get_hud_data.A_0216_USERDESC#" />
to <input type="text" class="userout" name="A_0216_USERPAYTO" value="#get_hud_data.A_0216_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0216_USERAMOUNT" value="#get_hud_data.A_0216_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">516.  <input type="text" class="userout" name="A_0516_USERDESC" value="#get_hud_data.A_0516_USERDESC#" />
to <input type="text" class="userout" name="A_0516_USERPAYTO" value="#get_hud_data.A_0516_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0516_USERAMOUNT" value="#get_hud_data.A_0516_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">217. <input type="text" class="userout" name="A_0217_USERDESC" value="#get_hud_data.A_0217_USERDESC#" />
to <input type="text" class="userout" name="A_0217_USERPAYTO" value="#get_hud_data.A_0217_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0217_USERAMOUNT" value="#get_hud_data.A_0217_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">517.  <input type="text" class="userout" name="A_0517_USERDESC" value="#get_hud_data.A_0517_USERDESC#" />
to <input type="text" class="userout" name="A_0517_USERPAYTO" value="#get_hud_data.A_0517_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0517_USERAMOUNT" value="#get_hud_data.A_0517_USERAMOUNT#" onChange="re_add_form();"  /></td>
</tr>
<tr>
<td class="bsilver">218. <input type="text" class="userout" name="A_0218_USERDESC" value="#get_hud_data.A_0218_USERDESC#" />
to <input type="text" class="userout" name="A_0218_USERPAYTO" value="#get_hud_data.A_0218_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0218_USERAMOUNT" value="#get_hud_data.A_0218_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">518.  <input type="text" class="userout" name="A_0518_USERDESC" value="#get_hud_data.A_0518_USERDESC#" />
to <input type="text" class="userout" name="A_0518_USERPAYTO" value="#get_hud_data.A_0518_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0518_USERAMOUNT" value="#get_hud_data.A_0518_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">219. <input type="text" class="userout" name="A_0219_USERDESC" value="#get_hud_data.A_0219_USERDESC#" />
to <input type="text" class="userout" name="A_0219_USERPAYTO" value="#get_hud_data.A_0219_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0219_USERAMOUNT" value="#get_hud_data.A_0219_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td></td>
<td class="bsilver">519.  <input type="text" class="userout" name="A_0519_USERDESC" value="#get_hud_data.A_0519_USERDESC#" />
to <input type="text" class="userout" name="A_0519_USERPAYTO" value="#get_hud_data.A_0519_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0519_USERAMOUNT" value="#get_hud_data.A_0519_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>

<tr>
<td class="bsilver"><br /><b>220. Total Paid by/for Seller</b></td>
<td class="bordered"><input type="text" class="userin" name="A_0220_TOTALPAIDBYSELLERAMOUNT" value="#get_hud_data.A_0220_TOTALPAIDBYSELLERAMOUNT#" onFocus="this.blur();" /></td>
<td></td>
<td class="bsilver"><br /><b>520. Total Reduction Amount Due Seller</b></td>
<td class="bordered"><input type="text" class="userin" name="A_0520_REDUCTIONDUESELLERAMOUNT" value="#get_hud_data.A_0520_REDUCTIONDUESELLERAMOUNT#" onFocus="this.blur();" /></td>
</tr>

<!-- Cash at Settlement -->

<tr>
<td colspan="2" class="bdarksilver_head">300. Cash at Settlement from/to Borrower</td>
<td></td>
<td colspan="2" class="bdarksilver_head">600. Cash at Settlement to/from Seller</td>
</tr>
<tr>
<td class="bsilver">301. Gross amount due from borrower (line 120)</td>
<td class="bordered"><input type="text" class="text" name="A_0301_GROSSDUEFROMBORROWERAMOUNT" value="#get_hud_data.A_0301_GROSSDUEFROMBORROWERAMOUNT#" onFocus="this.blur();" /></td>
<td></td>
<td class="bsilver">601. Gross amount due to seller (line 420)</td>
<td class="bordered"><input type="text" class="text" name="A_0601_GROSSDUETOSELLERAMOUNT" value="#get_hud_data.A_0601_GROSSDUETOSELLERAMOUNT#" onFocus="this.blur();" /></td>
</tr>
<tr>
<td class="bsilver">302. Less amounts paid by/for borrower (line 220)</td>
<td class="bordered"><input type="text" class="text" name="A_0302_LESSPAIDBYBORROWERAMOUNT" value="#get_hud_data.A_0302_LESSPAIDBYBORROWERAMOUNT#" onFocus="this.blur();" /></td>
<td></td>
<td class="bsilver">602. Less reductions in amount due seller (line 520)</td>
<td class="bordered"><input type="text" class="text" name="A_0602_LESSREDUCTIONSDUESELLERAMOUNT" value="#get_hud_data.A_0602_LESSREDUCTIONSDUESELLERAMOUNT#" onFocus="this.blur();" /></td>
</tr>
<tr>
<td height="30" valign="middle" class="bsilver" style="font-weight:bold;">303. Cash
<input type="radio"  name="A_0303_CASHTOFROM" value="FROM" onClick="document.hud1_form.A_0603_CASHTOFROM[0].checked = true;" <cfif get_hud_data.A_0303_CASHTOFROM eq 'FROM'>CHECKED</cfif> /> From
<input type="radio"  name="A_0303_CASHTOFROM" value="TO"   onclick="document.hud1_form.A_0603_CASHTOFROM[1].checked = true;" <cfif get_hud_data.A_0303_CASHTOFROM eq 'TO'>CHECKED</cfif> />To Borrower</td>
<td class="bordered"><input type="text" class="text" name="A_0303_CASHAMOUNT" value="#get_hud_data.A_0303_CASHAMOUNT#" onFocus="this.blur();" /></td>
<td></td>
<td height="30" valign="middle" class="bsilver" style="font-weight:bold;">603. Cash
<input type="radio"  name="A_0603_CASHTOFROM" value="TO"   onclick="document.hud1_form.A_0303_CASHTOFROM[0].checked = true;" <cfif get_hud_data.A_0603_CASHTOFROM eq 'TO' >CHECKED</cfif> />To
<input type="radio"  name="A_0603_CASHTOFROM" value="FROM" onClick="document.hud1_form.A_0303_CASHTOFROM[1].checked = true;" <cfif get_hud_data.A_0603_CASHTOFROM eq 'FROM' >CHECKED</cfif> />From Seller</td>
<td class="bordered"><input type="text" class="text" name="A_0603_CASHAMOUNT" value="#get_hud_data.A_0603_CASHAMOUNT#" onFocus="this.blur();" /></td>
</tr>

</table><!-- TABLE: Summary of Transactions -->

<br />
<p>The Public Reporting Burden for this collection of information is estimated at 35 minutes per response for collecting, reviewing, and
reporting the data. This agency may not collect this information, and you are not required to complete this form, unless it displays a
currently valid OMB control number. No confidentiality is assured; this disclosure is mandatory. This is designed to provide the parties to
a RESPA covered transaction with information during the settlement process.</p>

<P CLASS="pagebreak"><!-- PAGE BREAK (printing) -->&nbsp;</p>


<!-- TABLE: Settlement Charges -->
<table width="100%" cellspacing="0" border="0" summary="Summary of Transactions">
<tr>
<td colspan="3" class="black">L. Settlement Charges</td>
</tr>
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td class="bdarksilver_head">700. Total Real Estate Broker Fees</td>
<td width="15%" rowspan="4" class="bdarksilver" align="center" valign="middle" style="border-left:none;">Paid From <br /> Borrower's <br />Funds at <br /> Settlement</td>
<td width="15%" rowspan="4" class="bdarksilver" align="center" valign="middle" style="border-left:none;">Paid From <br /> Seller's <br />Funds at <br /> Settlement</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;Division of commission (line 700) as follows:</td>
</tr>
<tr>
<td class="bsilver">701. $<input type="text" class="text" name="A_0701_COMMISSIONAMOUNT" value="#get_hud_data.A_0701_COMMISSIONAMOUNT#"  onChange="re_add_form();" /> to<input type="text" class="text" name="A_0701_COMMISSIONPAYTO" value="#get_hud_data.A_0701_COMMISSIONPAYTO#" onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">702. $<input type="text" class="text" name="A_0702_COMMISSIONAMOUNT" value="#get_hud_data.A_0702_COMMISSIONAMOUNT#"  onChange="re_add_form();" /> to<input type="text" class="text" name="A_0702_COMMISSIONPAYTO" value="#get_hud_data.A_0702_COMMISSIONPAYTO#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">703. Commission paid at settlement</td>
<td class="bordered"><input type="text" class="userin" name="A_0703_BORROWER_COMMISSIONAMOUNT" value="#get_hud_data.A_0703_BORROWER_COMMISSIONAMOUNT#"  onChange="re_add_form();" onFocus="this.blur();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0703_SELLER_COMMISSIONAMOUNT" value="#get_hud_data.A_0703_SELLER_COMMISSIONAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">704. <input type="text" class="userout" name="A_0704_USERDESC"  value="#get_hud_data.A_0704_USERDESC#" /> to <input type="text" class="userout" name="A_0704_USERPAYTO"  value="#get_hud_data.A_0704_USERPAYTO#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0704_BORROWER_USERAMOUNT" value="#get_hud_data.A_0704_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0704_SELLER_USERAMOUNT" value="#get_hud_data.A_0704_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">705. <input type="text" class="userout" name="A_0705_USERDESC" value="#get_hud_data.A_0705_USERDESC#"  /> to <input type="text" class="userout" name="A_0705_USERPAYTO" value="#get_hud_data.A_0705_USERPAYTO#"  /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0705_BORROWER_USERAMOUNT" value="#get_hud_data.A_0705_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0705_SELLER_USERAMOUNT" value="#get_hud_data.A_0705_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">706. <input type="text" class="userout" name="A_0706_USERDESC" value="#get_hud_data.A_0706_USERDESC#"  /> to <input type="text" class="userout" name="A_0706_USERPAYTO"  value="#get_hud_data.A_0706_USERPAYTO#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0706_BORROWER_USERAMOUNT" value="#get_hud_data.A_0706_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0706_SELLER_USERAMOUNT" value="#get_hud_data.A_0706_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>

<!-- 800 -->
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
</tr>
<tr>
<td class="bsilver">801. Our origination charge $<input type="text" class="text" name="A_0801_OUTSIDE_ORIGINATIONCHARGE" value="#get_hud_data.A_0801_OUTSIDE_ORIGINATIONCHARGE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0801_BORROWER_ORIGINATIONCHARGE" value="#get_hud_data.A_0801_BORROWER_ORIGINATIONCHARGE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0801_SELLER_ORIGINATIONCHARGE" value="#get_hud_data.A_0801_SELLER_ORIGINATIONCHARGE#" onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">802. Your credit or charge (points) for the specific interest rate chosen $<input type="text" class="text" name="A_0802_OUTSIDE_POINTS"  value="#ReplaceNoCase(get_hud_data.A_0802_OUTSIDE_POINTS, ' ' , '', 'ALL')#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0802_BORROWER_POINTS" value="#get_hud_data.A_0802_BORROWER_POINTS#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0802_SELLER_POINTS" value="#get_hud_data.A_0802_SELLER_POINTS#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">803. Your adjusted origination charges</td>
<td class="bordered"><input type="text" class="userin" name="A_0803_BORROWER_ADJORIGINATIONCHARGE" value="#get_hud_data.A_0803_BORROWER_ADJORIGINATIONCHARGE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0803_SELLER_ADJORIGINATIONCHARGE" value="#get_hud_data.A_0803_SELLER_ADJORIGINATIONCHARGE#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">804. Appraisal fee to<input type="text" class="text" name="A_0804_APPRAISALFEEPAYTO" value="#get_hud_data.A_0804_APPRAISALFEEPAYTO#" />&nbsp;&nbsp;$<input type="text" class="text" name="A_0804_APPRAISALFEE_OUTSIDE_AMOUNT" value="#get_hud_data.A_0804_APPRAISALFEE_OUTSIDE_AMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0804_BORROWER_APPRAISALFEE" value="#get_hud_data.A_0804_BORROWER_APPRAISALFEE#" onChange="re_add_form();"  /></td>
<td class="bordered"><input type="text" class="userin" name="A_0804_SELLER_APPRAISALFEE" value="#get_hud_data.A_0804_SELLER_APPRAISALFEE#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">805. Credit report to<input type="text" class="text" name="A_0805_CREDITREPORTPAYTO" value="#get_hud_data.A_0805_CREDITREPORTPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0805_BORROWER_CREDITREPORT" value="#get_hud_data.A_0805_BORROWER_CREDITREPORT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0805_SELLER_CREDITREPORT" value="#get_hud_data.A_0805_SELLER_CREDITREPORT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">806. Tax service to<input type="text" class="text" name="A_0806_TAXSERVICEPAYTO" value="#get_hud_data.A_0806_TAXSERVICEPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0806_BORROWER_TAXSERVICE" value="#get_hud_data.A_0806_BORROWER_TAXSERVICE#" onChange="re_add_form();"  /></td>
<td class="bordered"><input type="text" class="userin" name="A_0806_SELLER_TAXSERVICE" value="#get_hud_data.A_0806_SELLER_TAXSERVICE#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">807. Flood certification to <input type="text" class="text" name="A_0807_FLOODCERTPAYTO" value="#get_hud_data.A_0807_FLOODCERTPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0807_BORROWER_FLOODCERT" value="#get_hud_data.A_0807_BORROWER_FLOODCERT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0807_SELLER_FLOODCERT" value="#get_hud_data.A_0807_SELLER_FLOODCERT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" class="userout" name="A_0808_USERDESC"  value="#get_hud_data.A_0808_USERDESC#" /> to <input type="text" class="userout" name="A_0808_USERPAYTO"  value="#get_hud_data.A_0808_USERPAYTO#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0808_BORROWER_USERAMOUNT" value="#get_hud_data.A_0808_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0808_SELLER_USERAMOUNT" value="#get_hud_data.A_0808_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" class="userout" name="A_0809_USERDESC"  value="#get_hud_data.A_0809_USERDESC#" /> to <input type="text" class="userout" name="A_0809_USERPAYTO"  value="#get_hud_data.A_0809_USERPAYTO#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0809_BORROWER_USERAMOUNT" value="#get_hud_data.A_0809_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0809_SELLER_USERAMOUNT" value="#get_hud_data.A_0809_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" class="userout" name="A_0810_USERDESC"  value="#get_hud_data.A_0810_USERDESC#" /> to <input type="text" class="userout" name="A_0810_USERPAYTO" value="#get_hud_data.A_0810_USERPAYTO#"  /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0810_BORROWER_USERAMOUNT" value="#get_hud_data.A_0810_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0810_SELLER_USERAMOUNT" value="#get_hud_data.A_0810_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" class="userout" name="A_0811_USERDESC"  value="#get_hud_data.A_0811_USERDESC#" /> to <input type="text" class="userout" name="A_0811_USERPAYTO"  value="#get_hud_data.A_0811_USERPAYTO#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0811_BORROWER_USERAMOUNT" value="#get_hud_data.A_0811_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0811_SELLER_USERAMOUNT" value="#get_hud_data.A_0811_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" class="userout" name="A_0812_USERDESC"  value="#get_hud_data.A_0812_USERDESC#" /> to <input type="text" class="userout" name="A_0812_USERPAYTO" value="#get_hud_data.A_0812_USERPAYTO#"  /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0812_BORROWER_USERAMOUNT" value="#get_hud_data.A_0812_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0812_SELLER_USERAMOUNT" value="#get_hud_data.A_0812_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>


<!-- 900 -->
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">900. Items Required by Lender to Be Paid in Advance</td>
</tr>
<tr>
<td class="bsilver">901. Daily interest charges from
<input type="text" class="date" name="A_0901_DAILYINTERESTDATEFROM"  onBlur="re_add_form();" value="<cfif get_hud_data.A_0901_DAILYINTERESTDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0901_DAILYINTERESTDATEFROM, 'm/d/yyyy')#</cfif>" /><A href="javascript:ShowCalendar(document.all('calpic30'),document.all('A_0901_DAILYINTERESTDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic30" style="POSITION: relative"></A> to <input type="text" name="A_0901_DAILYINTERESTDATETO"  onBlur="re_add_form();" class="date" value="#DateFormat(get_hud_data.A_0901_DAILYINTERESTDATETO, 'm/d/yyyy')#"/><A href="javascript:ShowCalendar(document.all('calpic31'),document.all('A_0901_DAILYINTERESTDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onClick="event.cancelBubble=true;"><img src="../calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic31" style="POSITION: relative"></A>
@ $<input type="text" class="text" name="A_0901_OUTSIDE_DAILYINTERESTPERDAY" value="#get_hud_data.A_0901_OUTSIDE_DAILYINTERESTPERDAY#" onChange="re_add_form();"  /> /day</td>
<td class="bordered"><input type="text" class="userin" name="A_0901_BORROWER_DAILYINTEREST" value="#get_hud_data.A_0901_BORROWER_DAILYINTEREST#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0901_SELLER_DAILYINTEREST" value="#get_hud_data.A_0901_SELLER_DAILYINTEREST#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">902. Mortgage insurance premium for
<input type="text" class="date" name="A_0902_MORTGAGEINSMONTHS" value="#get_hud_data.A_0902_MORTGAGEINSMONTHS#" /> months
to <input type="text" class="text" name="A_0902_MORTGAGEINSPAYTO" value="#get_hud_data.A_0902_MORTGAGEINSPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0902_BORROWER_MORTGAGEINS" value="#get_hud_data.A_0902_BORROWER_MORTGAGEINS#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0902_SELLER_MORTGAGEINS" value="#get_hud_data.A_0902_SELLER_MORTGAGEINS#" onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">903. Homeowner's insurance for
<input type="text" class="date" name="A_0903_HOMEOWNERSINSMONTHS" value="#get_hud_data.A_0903_HOMEOWNERSINSMONTHS#" /> months
to <input type="text" class="text" name="A_0903_HOMEOWNERSINSPAYTO" value="#get_hud_data.A_0903_HOMEOWNERSINSPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0903_BORROWER_HOMEOWNERSINS" value="#get_hud_data.A_0903_BORROWER_HOMEOWNERSINS#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0903_SELLER_HOMEOWNERSINS" value="#get_hud_data.A_0903_SELLER_HOMEOWNERSINS#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">904. <input type="text" class="userout" name="A_0904_USERDESC" value="#get_hud_data.A_0904_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0904_BORROWER_USERAMOUNT" value="#get_hud_data.A_0904_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0904_SELLER_USERAMOUNT" value="#get_hud_data.A_0904_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>

<!-- 1000 -->
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1000. Reserves Deposited with Lender</td>
</tr>
<tr>
<td class="bsilver">1001. Initial deposit for your escrow account</td>
<td class="bordered"><input type="text" class="userin" name="A_1001_BORROWER_INITIALESCROWDEPOSIT" value="#get_hud_data.A_1001_BORROWER_INITIALESCROWDEPOSIT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1001_SELLER_INITIALESCROWDEPOSIT" value="#get_hud_data.A_1001_SELLER_INITIALESCROWDEPOSIT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1002. Homeowner's insurance</div>
<div style="float:right"> <input type="text" class="two_digit" name="A_1002_HOMEOWNERSINSMONTHS" value="#get_hud_data.A_1002_HOMEOWNERSINSMONTHS#" onChange="re_add_form();"  />months @
$<input type="text" class="text" name="A_1002_HOMEOWNERSINSPERMONTH" value="#get_hud_data.A_1002_HOMEOWNERSINSPERMONTH#"  onChange="re_add_form();" /> per month
$<input type="text" class="text" name="A_1002_OUTSIDE_HOMEOWNERSINS" value="#get_hud_data.A_1002_OUTSIDE_HOMEOWNERSINS#"  onChange="re_add_form();" /></div></td>
<td class="bordered"><input type="text" class="userin" name="A_1002_BORROWER_HOMEOWNERSINS" value="#get_hud_data.A_1002_BORROWER_HOMEOWNERSINS#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1002_SELLER_HOMEOWNERSINS" value="#get_hud_data.A_1002_SELLER_HOMEOWNERSINS#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1003. Mortgage insurance</div>
<div style="float:right"> <input type="text" class="two_digit" name="A_1003_MORTGAGEINSMONTHS" value="#get_hud_data.A_1003_MORTGAGEINSMONTHS#"   onChange="re_add_form();" />months @
$<input type="text" class="text" name="A_1003_MORTGAGEINSPERMONTH" value="#get_hud_data.A_1003_MORTGAGEINSPERMONTH#"  onChange="re_add_form();" /> per month
$<input type="text" class="text" name="A_1003_OUTSIDE_MORTGAGEINS" value="#get_hud_data.A_1003_OUTSIDE_MORTGAGEINS#"  onChange="re_add_form();" /></div></td>
<td class="bordered"><input type="text" class="userin" name="A_1003_BORROWER_MORTGAGEINS" value="#get_hud_data.A_1003_BORROWER_MORTGAGEINS#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1003_SELLER_MORTGAGEINS" value="#get_hud_data.A_1003_SELLER_MORTGAGEINS#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1004. City property tax</div>
<div style="float:right"> <input type="text" class="two_digit" name="A_1004_CITYPROPTAXMONTHS" value="#get_hud_data.A_1004_CITYPROPTAXMONTHS#"  onChange="re_add_form();" />months @
$<input type="text" class="text" name="A_1004_CITYPROPTAXPERMONTH" value="#get_hud_data.A_1004_CITYPROPTAXPERMONTH#"  onChange="re_add_form();" /> per month
$<input type="text" class="text" name="A_1004_OUTSIDE_CITYPROPTAX" value="#get_hud_data.A_1004_OUTSIDE_CITYPROPTAX#"  onChange="re_add_form();" /></div></td>
<td class="bordered"><input type="text" class="userin" name="A_1004_BORROWER_CITYPROPTAX" value="#get_hud_data.A_1004_BORROWER_CITYPROPTAX#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1004_SELLER_CITYPROPTAX" value="#get_hud_data.A_1004_SELLER_CITYPROPTAX#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1005. County property tax</div>
<div style="float:right"> <input type="text" class="two_digit" name="A_1005_COUNTYPROPTAXMONTHS" value="#get_hud_data.A_1005_COUNTYPROPTAXMONTHS#"  onChange="re_add_form();" />months @
$<input type="text" class="text" name="A_1005_COUNTYPROPTAXPERMONTH" value="#get_hud_data.A_1005_COUNTYPROPTAXPERMONTH#"  onChange="re_add_form();" /> per month
$<input type="text" class="text" name="A_1005_OUTSIDE_COUNTYPROPTAX" value="#get_hud_data.A_1005_OUTSIDE_COUNTYPROPTAX#"  onChange="re_add_form();" /></div></td>
<td class="bordered"><input type="text" class="userin" name="A_1005_BORROWER_COUNTYPROPTAX" value="#get_hud_data.A_1005_BORROWER_COUNTYPROPTAX#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1005_SELLER_COUNTYPROPTAX" value="#get_hud_data.A_1005_SELLER_COUNTYPROPTAX#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1006. Assessments</div>
<div style="float:right"> <input type="text" class="two_digit" name="A_1006_ASSESSMENTSMONTHS" value="#get_hud_data.A_1006_ASSESSMENTSMONTHS#"  onChange="re_add_form();" />months @
$<input type="text" class="text" name="A_1006_ASSESSMENTSPERMONTH" value="#get_hud_data.A_1006_ASSESSMENTSPERMONTH#"  onChange="re_add_form();" /> per month
$<input type="text" class="text" name="A_1006_OUTSIDE_ASSESSMENTS" value="#get_hud_data.A_1006_OUTSIDE_ASSESSMENTS#"  onChange="re_add_form();" /></div></td>
<td class="bordered"><input type="text" class="userin" name="A_1006_BORROWER_ASSESSMENTS" value="#get_hud_data.A_1006_BORROWER_ASSESSMENTS#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1006_SELLER_ASSESSMENTS" value="#get_hud_data.A_1006_SELLER_ASSESSMENTS#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver" valign="top">1007. Aggregate Adjustment
<div style="float:right"><input type="text" class="text" name="A_1007_OUTSIDE_AGGREGATEADJUSTMENT" value="#get_hud_data.A_1007_OUTSIDE_AGGREGATEADJUSTMENT#"  onChange="re_add_form();" /></div></td>
<td class="bordered"><input type="text" class="userin" name="A_1007_BORROWER_AGGREGATEADJUSTMENT" value="#get_hud_data.A_1007_BORROWER_AGGREGATEADJUSTMENT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1007_SELLER_AGGREGATEADJUSTMENT" value="#get_hud_data.A_1007_SELLER_AGGREGATEADJUSTMENT#"  onChange="re_add_form();" /></td>
</tr>

<!-- 1100 -->
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1100. Title Charges</td>
</tr>
<tr>
<td class="bsilver">1101. Title services and lender's title insurance</td>
<td class="bordered"><input type="text" class="userin" name="A_1101_BORROWER_TITLESERVICES" value="#get_hud_data.A_1101_BORROWER_TITLESERVICES#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1101_SELLER_TITLESERVICES" value="#get_hud_data.A_1101_SELLER_TITLESERVICES#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">1102. Settlement or closing fee
to <input type="text" class="text" name="A_1102_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102_CLOSINGFEEPAYTO#" />
$<input type="text" class="text" name="A_1102_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102_OUTSIDE_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102_BORROWER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102_SELLER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
</tr>
<cfif get_hud_data.A_1102A_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102A_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102A_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102A. <input type="text" class="text" name="A_1102A_DESCRIPTION" value="#get_hud_data.A_1102A_DESCRIPTION#" />
to <input type="text" class="text" name="A_1102A_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102A_CLOSINGFEEPAYTO#" />
$<input type="text" class="text" name="A_1102A_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102A_OUTSIDE_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102A_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102A_BORROWER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102A_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102A_SELLER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
</tr>
<cfelse>
<input type="hidden" name="A_1102A_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102A_CLOSINGFEEPAYTO#" />
<input type="hidden" name="A_1102A_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102A_OUTSIDE_CLOSINGFEE#" />
<input type="hidden" name="A_1102A_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102A_BORROWER_CLOSINGFEE#" />
<input type="hidden" name="A_1102A_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102A_SELLER_CLOSINGFEE#" />
</cfif>
<cfif get_hud_data.A_1102B_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102B_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102B_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102B. <input type="text" class="text" name="A_1102B_DESCRIPTION" value="#get_hud_data.A_1102B_DESCRIPTION#" />
to <input type="text" class="text" name="A_1102B_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102B_CLOSINGFEEPAYTO#" />
$<input type="text" class="text" name="A_1102B_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102B_OUTSIDE_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102B_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102B_BORROWER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102B_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102B_SELLER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
</tr>
<cfelse>
<input type="hidden" name="A_1102B_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102B_CLOSINGFEEPAYTO#" />
<input type="hidden" name="A_1102B_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102B_OUTSIDE_CLOSINGFEE#" />
<input type="hidden" name="A_1102B_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102B_BORROWER_CLOSINGFEE#" />
<input type="hidden" name="A_1102B_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102B_SELLER_CLOSINGFEE#" />
</cfif>
<cfif get_hud_data.A_1102C_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102C_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102C_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102C. <input type="text" class="text" name="A_1102C_DESCRIPTION" value="#get_hud_data.A_1102C_DESCRIPTION#" />
to <input type="text" class="text" name="A_1102C_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102C_CLOSINGFEEPAYTO#" />
$<input type="text" class="text" name="A_1102C_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102C_OUTSIDE_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102C_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102C_BORROWER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102C_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102C_SELLER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
</tr>
<cfelse>
<input type="hidden" name="A_1102C_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102C_CLOSINGFEEPAYTO#" />
<input type="hidden" name="A_1102C_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102C_OUTSIDE_CLOSINGFEE#" />
<input type="hidden" name="A_1102C_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102C_BORROWER_CLOSINGFEE#" />
<input type="hidden" name="A_1102C_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102C_SELLER_CLOSINGFEE#" />
</cfif>
<cfif get_hud_data.A_1102D_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102D_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102D_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102D. <input type="text" class="text" name="A_1102D_DESCRIPTION" value="#get_hud_data.A_1102D_DESCRIPTION#" />
to <input type="text" class="text" name="A_1102D_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102D_CLOSINGFEEPAYTO#" />
$<input type="text" class="text" name="A_1102D_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102D_OUTSIDE_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102D_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102D_BORROWER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102D_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102D_SELLER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
</tr>
<cfelse>
<input type="hidden" name="A_1102D_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102D_CLOSINGFEEPAYTO#" />
<input type="hidden" name="A_1102D_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102D_OUTSIDE_CLOSINGFEE#" />
<input type="hidden" name="A_1102D_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102D_BORROWER_CLOSINGFEE#" />
<input type="hidden" name="A_1102D_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102D_SELLER_CLOSINGFEE#" />
</cfif>
<cfif get_hud_data.A_1102E_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102E_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102E_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102E. <input type="text" class="text" name="A_1102E_DESCRIPTION" value="#get_hud_data.A_1102E_DESCRIPTION#" />
to <input type="text" class="text" name="A_1102E_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102E_CLOSINGFEEPAYTO#" />
$<input type="text" class="text" name="A_1102E_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102E_OUTSIDE_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102E_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102E_BORROWER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102E_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102E_SELLER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
</tr>
<cfelse>
<input type="hidden" name="A_1102E_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102E_CLOSINGFEEPAYTO#" />
<input type="hidden" name="A_1102E_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102E_OUTSIDE_CLOSINGFEE#" />
<input type="hidden" name="A_1102E_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102E_BORROWER_CLOSINGFEE#" />
<input type="hidden" name="A_1102E_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102E_SELLER_CLOSINGFEE#" />
</cfif>
<cfif get_hud_data.A_1102F_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102F_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102F_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102F. <input type="text" class="text" name="A_1102F_DESCRIPTION" value="#get_hud_data.A_1102F_DESCRIPTION#" />
to <input type="text" class="text" name="A_1102F_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102F_CLOSINGFEEPAYTO#" />
$<input type="text" class="text" name="A_1102F_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102F_OUTSIDE_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102F_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102F_BORROWER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102F_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102F_SELLER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
</tr>
<cfelse>
<input type="hidden" name="A_1102F_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102F_CLOSINGFEEPAYTO#" />
<input type="hidden" name="A_1102F_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102F_OUTSIDE_CLOSINGFEE#" />
<input type="hidden" name="A_1102F_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102F_BORROWER_CLOSINGFEE#" />
<input type="hidden" name="A_1102F_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102F_SELLER_CLOSINGFEE#" />
</cfif>
<cfif get_hud_data.A_1102G_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102G_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102G_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102G. <input type="text" class="text" name="A_1102G_DESCRIPTION" value="#get_hud_data.A_1102G_DESCRIPTION#" />
to <input type="text" class="text" name="A_1102G_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102G_CLOSINGFEEPAYTO#" />
$<input type="text" class="text" name="A_1102G_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102G_OUTSIDE_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102G_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102G_BORROWER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102G_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102G_SELLER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
</tr>
<cfelse>
<input type="hidden" name="A_1102G_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102G_CLOSINGFEEPAYTO#" />
<input type="hidden" name="A_1102G_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102G_OUTSIDE_CLOSINGFEE#" />
<input type="hidden" name="A_1102G_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102G_BORROWER_CLOSINGFEE#" />
<input type="hidden" name="A_1102G_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102G_SELLER_CLOSINGFEE#" />
</cfif>
<cfif get_hud_data.A_1102H_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102H_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102H_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102H. <input type="text" class="text" name="A_1102H_DESCRIPTION" value="#get_hud_data.A_1102H_DESCRIPTION#" />
to <input type="text" class="text" name="A_1102H_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102H_CLOSINGFEEPAYTO#" />
$<input type="text" class="text" name="A_1102H_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102H_OUTSIDE_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102H_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102H_BORROWER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102H_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102H_SELLER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
</tr>
<cfelse>
<input type="hidden" name="A_1102H_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102H_CLOSINGFEEPAYTO#" />
<input type="hidden" name="A_1102H_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102H_OUTSIDE_CLOSINGFEE#" />
<input type="hidden" name="A_1102H_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102H_BORROWER_CLOSINGFEE#" />
<input type="hidden" name="A_1102H_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102H_SELLER_CLOSINGFEE#" />
</cfif>
<cfif get_hud_data.A_1102I_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102I_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102I_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102I. <input type="text" class="text" name="A_1102I_DESCRIPTION" value="#get_hud_data.A_1102I_DESCRIPTION#" />
to <input type="text" class="text" name="A_1102I_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102I_CLOSINGFEEPAYTO#" />
$<input type="text" class="text" name="A_1102I_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102I_OUTSIDE_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102I_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102I_BORROWER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1102I_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102I_SELLER_CLOSINGFEE#"  onChange="re_add_form();" /></td>
</tr>
<cfelse>
<input type="hidden" name="A_1102I_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102I_CLOSINGFEEPAYTO#" />
<input type="hidden" name="A_1102I_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102I_OUTSIDE_CLOSINGFEE#" />
<input type="hidden" name="A_1102I_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102I_BORROWER_CLOSINGFEE#" />
<input type="hidden" name="A_1102I_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102I_SELLER_CLOSINGFEE#" />
</cfif>
<tr>
<td class="bsilver">1103. Owner's title insurance
to <input type="text" class="text" name="A_1103_OWNERSTITLEINSPAYTO" value="#get_hud_data.A_1103_OWNERSTITLEINSPAYTO#" />
$<input type="text" class="text" name="A_1103_OUTSIDE_OWNERSTITLEINS" value="#get_hud_data.A_1103_OUTSIDE_OWNERSTITLEINS#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1103_BORROWER_OWNERSTITLEINS" value="#get_hud_data.A_1103_BORROWER_OWNERSTITLEINS#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1103_SELLER_OWNERSTITLEINS" value="#get_hud_data.A_1103_SELLER_OWNERSTITLEINS#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">1104. Lender's title insurance
to <input type="text" class="text" name="A_1104_LENDERSTITLEINSPAYTO" value="#get_hud_data.A_1104_LENDERSTITLEINSPAYTO#" />
$<input type="text" class="text" name="A_1104_OUTSIDE_LENDERSTITLEINS" value="#get_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1104_BORROWER_LENDERSTITLEINS" value="#get_hud_data.A_1104_BORROWER_LENDERSTITLEINS#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1104_SELLER_LENDERSTITLEINS" value="#get_hud_data.A_1104_SELLER_LENDERSTITLEINS#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">1105. Lender's title policy limit
$<input type="text" class="text" name="A_1105_LENDERSTITLEPOLICYLIMIT" value="#get_hud_data.A_1105_LENDERSTITLEPOLICYLIMIT#" /> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1106. Owner's title policy limit
$<input type="text" class="text" name="A_1106_OWNERSTITLEPOLICYLIMIT" value="#get_hud_data.A_1106_OWNERSTITLEPOLICYLIMIT#" /> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1107. Agent's portion of the total title insurance premium
$<input type="text" class="text" name="A_1107_AGENTPREMIUMPORTION" value="#get_hud_data.A_1107_AGENTPREMIUMPORTION#" /> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1108. Underwriter's portion of the total title insurance premium
$<input type="text" class="text" name="A_1108_UNDERWRITERPREMIUMPORTION" value="#get_hud_data.A_1108_UNDERWRITERPREMIUMPORTION#"  /> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" class="userout" name="A_1109_USERDESC" value="#get_hud_data.A_1109_USERDESC#" />
to <input type="text" class="userout" name="A_1109_USERPAYTO"  value="#get_hud_data.A_1109_USERPAYTO#" />
$<input type="text" class="userout" name="A_1109_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1109_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1109_BORROWER_USERAMOUNT" value="#get_hud_data.A_1109_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1109_SELLER_USERAMOUNT" value="#get_hud_data.A_1109_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">1110. <input type="text" class="userout" name="A_1110_USERDESC"  value="#get_hud_data.A_1110_USERDESC#" />

to <input type="text" class="userout" name="A_1110_USERPAYTO"  value="#get_hud_data.A_1110_USERPAYTO#" />
$<input type="text" class="userout" name="A_1110_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1110_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1110_BORROWER_USERAMOUNT" value="#get_hud_data.A_1110_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1110_SELLER_USERAMOUNT" value="#get_hud_data.A_1110_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">1111. <input type="text" class="userout" name="A_1111_USERDESC"  value="#get_hud_data.A_1111_USERDESC#" />
to <input type="text" class="userout" name="A_1111_USERPAYTO"  value="#get_hud_data.A_1111_USERPAYTO#" />
$<input type="text" class="userout" name="A_1111_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1111_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1111_BORROWER_USERAMOUNT" value="#get_hud_data.A_1111_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1111_SELLER_USERAMOUNT" value="#get_hud_data.A_1111_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr>
<td class="bsilver">1112. <input type="text" class="userout" name="A_1112_USERDESC" value="#get_hud_data.A_1112_USERDESC#" />
to <input type="text" class="userout" name="A_1112_USERPAYTO" value="#get_hud_data.A_1112_USERPAYTO#" />
$<input type="text" class="userout" name="A_1112_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1112_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1112_BORROWER_USERAMOUNT" value="#get_hud_data.A_1112_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1112_SELLER_USERAMOUNT" value="#get_hud_data.A_1112_SELLER_USERAMOUNT#" onChange="re_add_form();"  /></td>
</tr>
<tr>
<td class="bsilver">1113. <input type="text" class="userout" name="A_1113_USERDESC" value="#get_hud_data.A_1113_USERDESC#" />
to <input type="text" class="userout" name="A_1113_USERPAYTO" value="#get_hud_data.A_1113_USERPAYTO#" />
$<input type="text" class="userout" name="A_1113_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1113_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1113_BORROWER_USERAMOUNT" value="#get_hud_data.A_1113_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1113_SELLER_USERAMOUNT" value="#get_hud_data.A_1113_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr id="row_1114" style="display: none;">
<td class="bsilver" >1114. <input type="text" class="userout" name="A_1114_USERDESC" value="#get_hud_data.A_1114_USERDESC#" />
to <input type="text" class="userout" name="A_1114_USERPAYTO" value="#get_hud_data.A_1114_USERPAYTO#" />
$<input type="text" class="userout" name="A_1114_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1114_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1114_BORROWER_USERAMOUNT" value="#get_hud_data.A_1114_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1114_SELLER_USERAMOUNT" value="#get_hud_data.A_1114_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr id="row_1115" style="display: none;">
<td class="bsilver" >1115. <input type="text" class="userout" name="A_1115_USERDESC" value="#get_hud_data.A_1115_USERDESC#" />
to <input type="text" class="userout" name="A_1115_USERPAYTO" value="#get_hud_data.A_1115_USERPAYTO#" />
$<input type="text" class="userout" name="A_1115_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1115_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1115_BORROWER_USERAMOUNT" value="#get_hud_data.A_1115_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1115_SELLER_USERAMOUNT" value="#get_hud_data.A_1115_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr id="row_1116" style="display: none;">
<td class="bsilver" >1116. <input type="text" class="userout" name="A_1116_USERDESC" value="#get_hud_data.A_1116_USERDESC#" />
to <input type="text" class="userout" name="A_1116_USERPAYTO" value="#get_hud_data.A_1116_USERPAYTO#" />
$<input type="text" class="userout" name="A_1116_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1116_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1116_BORROWER_USERAMOUNT" value="#get_hud_data.A_1116_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1116_SELLER_USERAMOUNT" value="#get_hud_data.A_1116_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr id="row_1117" style="display: none;">
<td class="bsilver" >1117. <input type="text" class="userout" name="A_1117_USERDESC" value="#get_hud_data.A_1117_USERDESC#" />
to <input type="text" class="userout" name="A_1117_USERPAYTO" value="#get_hud_data.A_1117_USERPAYTO#" />
$<input type="text" class="userout" name="A_1117_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1117_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1117_BORROWER_USERAMOUNT" value="#get_hud_data.A_1117_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1117_SELLER_USERAMOUNT" value="#get_hud_data.A_1117_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr id="row_1118" style="display: none;">
<td class="bsilver" >1118. <input type="text" class="userout" name="A_1118_USERDESC" value="#get_hud_data.A_1118_USERDESC#" />
to <input type="text" class="userout" name="A_1118_USERPAYTO" value="#get_hud_data.A_1118_USERPAYTO#" />
$<input type="text" class="userout" name="A_1118_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1118_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1118_BORROWER_USERAMOUNT" value="#get_hud_data.A_1118_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1118_SELLER_USERAMOUNT" value="#get_hud_data.A_1118_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr id="row_1119" style="display: none;">
<td class="bsilver" >1119. <input type="text" class="userout" name="A_1119_USERDESC" value="#get_hud_data.A_1119_USERDESC#" />
to <input type="text" class="userout" name="A_1119_USERPAYTO" value="#get_hud_data.A_1119_USERPAYTO#" />
$<input type="text" class="userout" name="A_1119_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1119_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1119_BORROWER_USERAMOUNT" value="#get_hud_data.A_1119_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1119_SELLER_USERAMOUNT" value="#get_hud_data.A_1119_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr id="row_1120" style="display: none;">
<td class="bsilver" >1120. <input type="text" class="userout" name="A_1120_USERDESC" value="#get_hud_data.A_1120_USERDESC#" />
to <input type="text" class="userout" name="A_1120_USERPAYTO" value="#get_hud_data.A_1120_USERPAYTO#" />
$<input type="text" class="userout" name="A_1120_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1120_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1120_BORROWER_USERAMOUNT" value="#get_hud_data.A_1120_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1120_SELLER_USERAMOUNT" value="#get_hud_data.A_1120_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr id="row_1121" style="display: none;">
<td class="bsilver" >1121. <input type="text" class="userout" name="A_1121_USERDESC" value="#get_hud_data.A_1121_USERDESC#" />
to <input type="text" class="userout" name="A_1121_USERPAYTO" value="#get_hud_data.A_1121_USERPAYTO#" />
$<input type="text" class="userout" name="A_1121_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1121_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1121_BORROWER_USERAMOUNT" value="#get_hud_data.A_1121_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1121_SELLER_USERAMOUNT" value="#get_hud_data.A_1121_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>
<tr id="row_1122" style="display: none;">
<td class="bsilver" >1122. <input type="text" class="userout" name="A_1122_USERDESC" value="#get_hud_data.A_1122_USERDESC#" />
to <input type="text" class="userout" name="A_1122_USERPAYTO" value="#get_hud_data.A_1122_USERPAYTO#" />
$<input type="text" class="userout" name="A_1122_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1122_OUTSIDE_USERAMOUNT#"  onChange="re_add_form();" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1122_BORROWER_USERAMOUNT" value="#get_hud_data.A_1122_BORROWER_USERAMOUNT#"  onChange="re_add_form();" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1122_SELLER_USERAMOUNT" value="#get_hud_data.A_1122_SELLER_USERAMOUNT#"  onChange="re_add_form();" /></td>
</tr>

</cfoutput>
<cfinclude template="HUD_2010_modify_b.cfm">

</form>




</div> <!-- page_container -->
</body>
</html>
