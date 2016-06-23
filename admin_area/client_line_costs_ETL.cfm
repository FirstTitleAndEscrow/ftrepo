<cfparam name="url.step" default="0">
<cfparam name="form.step" default="#url.step#">
<cfset request.lastTimestamp = Now()>
<cfset variables.timeformat = "hh:mm:ss">
<cfset request.boolDebug = false>
<cfparam name="application.DS" default="First_Title_Main_Admin">

<cfoutput>

<cffunction name="PrintMessage">
	<cfargument name="message">
	<cfset cts = Now()>
	<div class="message">#TimeFormat(cts,variables.timeformat)# (#DateDiff('s', request.lastTimestamp, cts )# seconds) >>> #message#</div>
	<cfset request.lastTimestamp = cts>
	<cfflush>
</cffunction>

<cffunction name="PrintStatus">
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_Company_Billing_Values">
			SELECT count(billing_ID) as [count]
			FROM Company_Billing_Values
			WHERE company_id <> 100
		</CFQUERY>
		#PrintMessage('count_Company_Billing_Values returned: #count_Company_Billing_Values.count# records.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_company_billing_states">
			SELECT billing_id
			FROM company_billing_states
			WHERE company_ID <> 100
		</CFQUERY>
		#PrintMessage('count_company_billing_states returns #count_company_billing_states.recordcount# records.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_Company_Agency_Assoc">
			SELECT count(Assoc_ID) as [count]
			FROM Company_Agency_Assoc
			WHERE company_id <> 100
		</CFQUERY>
		#PrintMessage('count_Company_Agency_Assoc returned: #count_Company_Agency_Assoc.count# records.')#
		<br />
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_Company_Billing_Values_HUD2010">
			SELECT count(billing_ID) as [count]
			FROM Company_Billing_Values_HUD2010
		</CFQUERY>
		#PrintMessage('count_Company_Billing_Values_HUD2010 returned: #count_Company_Billing_Values_HUD2010.count# records.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_Company_Billing_Values_B_HUD2010">
			SELECT count(billing_ID) as [count]
			FROM Company_Billing_Values_B_HUD2010
		</CFQUERY>
		#PrintMessage('count_Company_Billing_Values_B_HUD2010 returned: #count_Company_Billing_Values_B_HUD2010.count# records.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_ITEMIZED_1101_CHARGES">
				SELECT count(billing_id) as [count]
				FROM ITEMIZED_1101_CHARGES
			</CFQUERY>
		#PrintMessage('count_ITEMIZED_1101_CHARGES returned: #count_ITEMIZED_1101_CHARGES.count# records.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_company_billing_states_HUD2010">
			SELECT count(state_ID) as [count]
			FROM company_billing_states_HUD2010
		</CFQUERY>
		#PrintMessage('count_company_billing_states_HUD2010 returned: #count_company_billing_states_HUD2010.count# records.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_Company_Agency_Assoc_HUD2010">
			SELECT count(Assoc_ID) as [count]
			FROM Company_Agency_Assoc_HUD2010
		</CFQUERY>
		#PrintMessage('count_Company_Agency_Assoc_HUD2010 returned: #count_Company_Agency_Assoc_HUD2010.count# records.')#
		<br />
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_Company_Billing_Values_HUD2010_C100">
			SELECT count(billing_ID) as [count]
			FROM Company_Billing_Values_HUD2010
			WHERE company_id = 100
		</CFQUERY>
		#PrintMessage('count_Company_Billing_Values_HUD2010_C100 returned: #count_Company_Billing_Values_HUD2010_C100.count# records.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_Company_Billing_Values_B_HUD2010_C100">
			SELECT count(billing_ID) as [count]
			FROM Company_Billing_Values_B_HUD2010
			WHERE company_id = 100
		</CFQUERY>
		#PrintMessage('count_Company_Billing_Values_B_HUD2010_C100 returned: #count_Company_Billing_Values_B_HUD2010_C100.count# records.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_company_billing_states_HUD2010_C100">
			SELECT count(state_ID) as [count]
			FROM company_billing_states_HUD2010
			WHERE company_id = 100
		</CFQUERY>
		#PrintMessage('count_company_billing_states_HUD2010_C100 returned: #count_company_billing_states_HUD2010_C100.count# records.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="count_Company_Agency_Assoc_HUD2010_C100">
			SELECT count(Assoc_ID) as [count]
			FROM Company_Agency_Assoc_HUD2010
			WHERE company_id = 100
		</CFQUERY>
		#PrintMessage('count_Company_Agency_Assoc_HUD2010_C100 returned: #count_Company_Agency_Assoc_HUD2010_C100.count# records.')#
		<br />
	<CFQUERY DATASOURCE="#application.DS#" NAME="get_2010_incomplete_billing_IDs_count">
		SELECT count(billing_ID) as cntbid
		FROM Company_Billing_Values_HUD2010
		WHERE company_ID <> 100
		AND conversion_complete = '1'
	</CFQUERY>
	#PrintMessage('#get_2010_incomplete_billing_IDs_count.cntbid# Records Flagged: Conversion Complete')#
</cffunction>


<cffunction name="InsertItemized1101">
	<cfargument name="BID">
	<cfargument name="itemnumber" type="numeric">
	<cfargument name="itemtype">
	<cfargument name="description">
	<cfargument name="amount" type="numeric">
	<cfif itemnumber LT 10>
		<cfset itemnumber = "0" & itemnumber>
	</cfif>
		<cfscript>
			StructInsert(Itemized_1101, 'A_1101_ITEM_DESCRIPTION_#itemnumber#_#itemtype#', '#description#');
			StructInsert(Itemized_1101, 'A_1101_ITEM_AMOUNT_#itemnumber#_#itemtype#', '#amount#');
		</cfscript>
	<cfif request.boolDebug>
		<cfdump var="#Itemized_1101#" expand="no" label="Itemized_1101">
	</cfif>
</cffunction>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Client Line Costs ETL</title>
<style type="text/css">
<!--
body { margin: 0px; padding: 0px; font-family: arial,sans-serif; font-size: 8px; }
table { font-size: 8px; }
.page_container { width: 670px; }
.section_title { font-size: 20px; }
.message { padding: 15px, 0px, 0px, 20px; color: ##336600; }
-->
</style>
	</head>
	<body>

	<div class="section_title">
		Pre Action Status:
	</div>
	<!--- #PrintStatus()# --->
	<CFQUERY DATASOURCE="#application.DS#" NAME="get_2010_incomplete_billing_IDs_count">
		SELECT count(billing_ID) as cntbid
		FROM Company_Billing_Values_HUD2010
		WHERE company_ID <> 100
		AND conversion_complete = '1'
	</CFQUERY>
	<CFQUERY DATASOURCE="#application.DS#" NAME="get_2010_complete_billing_IDs_count">
		SELECT count(billing_ID) as cntbid
		FROM Company_Billing_Values_HUD2010
		WHERE company_ID <> 100
		AND conversion_complete = '0'
	</CFQUERY>
	#PrintMessage('#get_2010_complete_billing_IDs_count.cntbid# Records Flagged: Conversion Not Complete')#
	#PrintMessage('#get_2010_incomplete_billing_IDs_count.cntbid# Records Flagged: Conversion Complete')#
	<br />
	<div id="form">
		<span class="section_title">Action Form:</span>
		<br />
		<form name="etl" id="etl" method="post" action="#cgi.SCRIPT_NAME#">

			<cfif form.step EQ 'D1'>-> </cfif><input type="submit" name="step" value="D1"> : DELETE FROM Company_Billing_Values_HUD2010 &amp; Company_Billing_Values_B_HUD2010 &amp; ITEMIZED_1101_CHARGES
			<br />
			<cfif form.step EQ 'D2'>-> </cfif><input type="submit" name="step" value="D2"> : DELETE FROM company_billing_states_HUD2010
			<br />
			<cfif form.step EQ 'D3'>-> </cfif><input type="submit" name="step" value="D3"> : DELETE FROM Company_Agency_Assoc_HUD2010
			<br />
			<cfif form.step EQ '1A'>-> </cfif><input type="submit" name="step" value="1A"> : Step 1A - INSERT_INTO_Company_Billing_Values_HUD2010 (copy all existing Billing IDs)
			<br />
			<cfif form.step EQ '1B'>-> </cfif><input type="submit" name="step" value="1B"> : Step 1B - INSERT_INTO_company_billing_states_HUD2010 (copy all existing states)
			<br />
			<cfif form.step EQ '1C'>-> </cfif><input type="submit" name="step" value="1C"> : Step 1C - INSERT_INTO_company_agency_assocs_HUD2010 (copy all existing assocs)
			<br />
			<cfif form.step EQ '2A'>-> </cfif><input type="submit" name="step" value="2A"> : Step 2A - STATE EXCEPTIONS INSERT billing_ID and DELETE state_id
			<br />
			<cfif form.step EQ '2B'>-> </cfif><input type="submit" name="step" value="2B"> : Step 2B - STATE EXCEPTIONS INSERT state_id by reference
			<br />
			<cfif form.step EQ '2C'>-> </cfif><input type="submit" name="step" value="2C"> : Step 2C - STATE EXCEPTIONS INSERT agency_assoc by reference
			<br />
			<cfif form.step EQ '3A'>-> </cfif><input type="submit" name="step" value="3A"> : Step 3A - INSERT_INTO_Company_Billing_Values_B_HUD2010 (copy value to value_b table)
			<br />
			<cfif form.step EQ '3B'>-> </cfif><input type="submit" name="step" value="3B"> : Step 3B - INSERT_INTO_ITEMIZED_1101_CHARGES (copy value to itemization table)
			<br />
			<cfif form.step EQ '4A'>-> </cfif><input type="submit" name="step" value="4A"> : Step 4A - (update values for reference_state EQ 'DE')
			<br />
			<cfif form.step EQ '4B'>-> </cfif><input type="submit" name="step" value="4B"> : Step 4B - (update values for everything else)
			<br />
		</form>

		<!---
		<cfif form.step EQ '2B'>-> </cfif><input type="submit" name="step" value="2B"> : Step 2B - INSERT_INTO_Company_Billing_Values_HUD2010 (create new IDs for states EQ 'DE')
			<br />

			<cfif form.step EQ '2C'>-> </cfif><input type="submit" name="step" value="2C"> : Step 2C - INSERT_INTO_company_billing_states_HUD2010 (create new states WHERE EQ 'DE' (for value.legacy EQ NULL))
			<br />
			<cfif form.step EQ '1C'>-> </cfif><input type="submit" name="step" value="1C"> : Step 1C - DELETE FROM Company_Billing_Values_HUD2010 &amp; Company_Billing_Values_B_HUD2010 (delete excess billing IDs - those for which a new DE only ID was created)
			<br />
			<cfif form.step EQ '3A'>-> </cfif><input type="submit" name="step" value="3A"> : Step 3A - (copy assoc)
			<br />
			<cfif form.step EQ '3B'>-> </cfif><input type="submit" name="step" value="3B"> : Step 3B - (create assoc)
			<br />
		--->


	</div>
	<br />
	<div class="section_title">
		Actions:
	</div>

<cfswitch expression="#form.step#">

	<cfcase value="1A">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="get_legacy_billing_IDs">
			SELECT billing_ID, company_ID, prior_billing_ID
			FROM Company_Billing_Values
			WHERE company_ID <> 100
			ORDER BY billing_ID
		</CFQUERY>
		#PrintMessage('get_legacy_billing_IDs returns #get_legacy_billing_IDs.recordcount# records.')#
		<cfloop query="get_legacy_billing_IDs">
			<cfif get_legacy_billing_IDs.prior_billing_ID EQ ''>
				<cfset PBID = "NULL">
			<cfelse>
				<cfset PBID = "#get_legacy_billing_IDs.prior_billing_ID#">
			</cfif>
			<CFQUERY DATASOURCE="#application.DS#" NAME="INSERT_INTO_Company_Billing_Values_HUD2010">
				INSERT INTO Company_Billing_Values_HUD2010 (legacy_billing_ID, company_ID, prior_billing_ID)
				VALUES ('#get_legacy_billing_IDs.billing_ID#', '#get_legacy_billing_IDs.company_ID#', #PBID#)
			</CFQUERY>
		</cfloop>
		#PrintMessage('INSERT_INTO_Company_Billing_Values_HUD2010 returns.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfcase value="1B">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="get_company_billing_states">
			SELECT s.company_ID, s.A_states, s.state_ID, v.billing_id, s.billing_id as [legbid]
			FROM company_billing_states s LEFT JOIN Company_Billing_Values_HUD2010 v ON
			s.billing_id = v.legacy_billing_id
			WHERE s.company_ID <> 100
			ORDER BY s.state_ID
		</CFQUERY>
		#PrintMessage('get_company_billing_states returns #get_company_billing_states.recordcount# records.')#
		<cfloop query="get_company_billing_states">
			<CFQUERY DATASOURCE="#application.DS#" NAME="INSERT_INTO_company_billing_states_HUD2010">
				INSERT INTO company_billing_states_HUD2010 (legacy_billing_state_ID, billing_ID, company_ID, A_states)
				VALUES ('#get_company_billing_states.state_ID#', '#get_company_billing_states.billing_ID#', '#get_company_billing_states.company_ID#', '#get_company_billing_states.A_states#')
			</CFQUERY>
		</cfloop>
		#PrintMessage('INSERT_INTO_company_billing_states_HUD2010 returns.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfcase value="1C">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="get_company_agency_assoc">
			SELECT v.billing_id, v.legacy_billing_id, a.assoc_ID, a.company_ID, a.title_FT_Agency_id, a.title_FT_Agency_name, a.title_FT_Agency_state
			FROM company_agency_assoc a LEFT JOIN Company_Billing_Values_HUD2010 v ON
			a.billing_id = v.legacy_billing_id
			WHERE a.company_ID <> 100
			ORDER BY a.assoc_ID
		</CFQUERY>
		#PrintMessage('get_company_agency_assoc returns #get_company_agency_assoc.recordcount# records.')#
		<cfloop query="get_company_agency_assoc">
			<CFQUERY DATASOURCE="#application.DS#" NAME="INSERT_INTO_company_agency_assocs_HUD2010">
				INSERT INTO company_agency_assoc_HUD2010 (legacy_assoc_ID, billing_ID, company_ID, title_FT_Agency_id, title_FT_Agency_name, title_FT_Agency_state)
				VALUES ('#get_company_agency_assoc.assoc_ID#', '#get_company_agency_assoc.billing_ID#', '#get_company_agency_assoc.company_ID#', '#get_company_agency_assoc.title_FT_Agency_id#', '#get_company_agency_assoc.title_FT_Agency_name#', '#get_company_agency_assoc.title_FT_Agency_state#')
			</CFQUERY>
		</cfloop>
		#PrintMessage('INSERT_INTO_company_agency_assocs_HUD2010 returns.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfcase value="2A">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="get_DE_billing_states">
			SELECT s.billing_id, s.company_id, s.state_id, s.a_states, v.legacy_billing_id
			FROM company_billing_states_HUD2010 s LEFT JOIN Company_Billing_Values_HUD2010 v ON
			s.billing_id = v.billing_id
			WHERE s.A_states = 'DE'
			OR s.A_states = 'WV'
			OR s.A_states = 'GA'
			OR s.A_states = 'MA'
			OR s.A_states = 'SC'
			AND s.Company_ID <> 100
		</CFQUERY>
		#PrintMessage('get_DE_billing_states returns #get_DE_billing_states.recordcount# records.')#
		<cfloop query="get_DE_billing_states">
			<CFQUERY DATASOURCE="#application.DS#" NAME="INSERT_INTO_company_billing_values_HUD2010">
				INSERT INTO Company_Billing_Values_HUD2010 (legacy_billing_id, reference_billing_ID, company_ID, reference_state)
				VALUES ('#get_DE_billing_states.legacy_billing_id#', '#get_DE_billing_states.billing_ID#', '#get_DE_billing_states.company_ID#', '#get_DE_billing_states.a_states#')
			</CFQUERY>
		</cfloop>
		#PrintMessage('INSERT_INTO_company_billing_values_HUD2010 returns.')#
		<cfloop query="get_DE_billing_states">
			<CFQUERY DATASOURCE="#application.DS#" NAME="DELETE_FROM_company_billing_states_HUD2010">
				DELETE FROM company_billing_states_HUD2010 WHERE state_id = #get_DE_billing_states.state_id#
			</CFQUERY>
		</cfloop>
		#PrintMessage('DELETE_FROM_company_billing_states_HUD2010 returns #get_DE_billing_states.recordcount# Deleted.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfcase value="2B">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="get_DE_billing_values">
			SELECT billing_id, company_id, reference_state
			FROM company_billing_values_HUD2010
			WHERE reference_billing_ID is not null
			and company_id <> 100
		</CFQUERY>
		#PrintMessage('get_DE_billing_values returns #get_DE_billing_values.recordcount# records.')#
		<cfloop query="get_DE_billing_values">
			<CFQUERY DATASOURCE="#application.DS#" NAME="INSERT_INTO_company_billing_states_HUD2010">
				INSERT INTO company_billing_states_HUD2010 (billing_ID, company_ID, A_states)
				VALUES ('#get_DE_billing_values.billing_ID#', '#get_DE_billing_values.company_ID#', '#get_DE_billing_values.reference_state#')
			</CFQUERY>
		</cfloop>
		#PrintMessage('INSERT_INTO_company_billing_states_HUD2010 returns.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfcase value="2C">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="get_DE_billing_values">
			SELECT v.billing_id, v.company_id, a.legacy_assoc_ID, a.title_FT_Agency_id, a.title_FT_Agency_name, a.title_FT_Agency_state
			FROM company_agency_assoc_HUD2010 a LEFT JOIN company_billing_values_HUD2010 v
			ON v.reference_billing_id = a.billing_id
			WHERE v.reference_billing_ID is not null
			and v.company_id <> 100
		</CFQUERY>
		#PrintMessage('get_DE_billing_values returns #get_DE_billing_values.recordcount# records.')#
		<cfloop query="get_DE_billing_values">
			<CFQUERY DATASOURCE="#application.DS#" NAME="INSERT_INTO_company_agency_assocs_HUD2010">
				INSERT INTO company_agency_assoc_HUD2010 (legacy_assoc_ID, billing_ID, company_ID, title_FT_Agency_id, title_FT_Agency_name, title_FT_Agency_state)
				VALUES ('#get_DE_billing_values.legacy_assoc_ID#', '#get_DE_billing_values.billing_ID#', '#get_DE_billing_values.company_ID#', '#get_DE_billing_values.title_FT_Agency_id#', '#get_DE_billing_values.title_FT_Agency_name#', '#get_DE_billing_values.title_FT_Agency_state#')
			</CFQUERY>
		</cfloop>
		#PrintMessage('INSERT_INTO_company_agency_assocs_HUD2010 returns.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfcase value="3A">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="get_2010_billing_IDs">
			SELECT billing_ID, company_ID
			FROM Company_Billing_Values_HUD2010
			WHERE company_ID <> 100
			ORDER BY billing_ID
		</CFQUERY>
		#PrintMessage('get_2010_billing_IDs returns #get_2010_billing_IDs.recordcount# records.')#
		<cfloop query="get_2010_billing_IDs">
			<CFQUERY DATASOURCE="#application.DS#" NAME="INSERT_INTO_Company_Billing_Values_B_HUD2010">
				INSERT INTO Company_Billing_Values_B_HUD2010 (billing_ID, company_ID)
				VALUES ('#get_2010_billing_IDs.billing_ID#', '#get_2010_billing_IDs.company_ID#')
			</CFQUERY>
		</cfloop>
		#PrintMessage('INSERT_INTO_Company_Billing_Values_B_HUD2010 returns.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfcase value="3B">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="get_2010_billing_IDs">
			SELECT billing_ID, company_ID
			FROM Company_Billing_Values_HUD2010
			WHERE company_ID <> 100
			ORDER BY billing_ID
		</CFQUERY>
		#PrintMessage('get_2010_billing_IDs returns #get_2010_billing_IDs.recordcount# records.')#
		<cfloop query="get_2010_billing_IDs">
			<CFQUERY DATASOURCE="#application.DS#" NAME="INSERT_INTO_ITEMIZED_1101_CHARGES">
				INSERT INTO ITEMIZED_1101_CHARGES (billing_ID, company_ID)
				VALUES ('#get_2010_billing_IDs.billing_ID#', '#get_2010_billing_IDs.company_ID#')
			</CFQUERY>
		</cfloop>
		#PrintMessage('INSERT_INTO_ITEMIZED_1101_CHARGES returns.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfcase value="4A">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="get_2010_DE_billing_IDs">
			SELECT billing_ID
			FROM Company_Billing_Values_HUD2010
			WHERE company_ID <> 100
			AND reference_state = 'DE'
			ORDER BY billing_ID
		</CFQUERY>
		#PrintMessage('get_2010_DE_billing_IDs returns #get_2010_DE_billing_IDs.recordcount# records.')#
		<cfloop query="get_2010_DE_billing_IDs">
			<CFQUERY DATASOURCE="#application.DS#" NAME="UPDATE_Company_Billing_Values_HUD2010">
				UPDATE Company_Billing_Values_HUD2010 SET
				A_1101_AMOUNT_PURCHASE_SELLER = '225',
				A_1101_AMOUNT_2ND_WITH_TI = '225',
				A_1101_AMOUNT_PURCHASE = '225',
				A_1101_AMOUNT_REFINANCE = '225',
				A_1101_AMOUNT_2ND_NO_TI = '225',
				A_1102_DESCRIPTION_PURCHASE_SELLER = 'Attorney Signing and Disbursement',
				A_1102_DESCRIPTION_2ND_WITH_TI = 'Attorney Signing and Disbursement',
				A_1102_DESCRIPTION_2ND_NO_TI = 'Attorney Signing and Disbursement',
				A_1102_DESCRIPTION_REFINANCE = 'Attorney Signing and Disbursement',
				A_1102_DESCRIPTION_PURCHASE = 'Attorney Signing and Disbursement',
				A_1102_PAYTO_PURCHASE_SELLER = 'TP Attorney Signer',
				A_1102_PAYTO_2ND_WITH_TI = 'TP Attorney Signer',
				A_1102_PAYTO_PURCHASE = 'TP Attorney Signer',
				A_1102_PAYTO_2ND_NO_TI = 'TP Attorney Signer',
				A_1102_PAYTO_REFINANCE = 'TP Attorney Signer',
				A_1102_AMOUNT_PURCHASE_SELLER = '525',
				A_1102_AMOUNT_2ND_WITH_TI = '525',
				A_1102_AMOUNT_2ND_NO_TI = '525',
				A_1102_AMOUNT_REFINANCE = '525',
				A_1102_AMOUNT_PURCHASE = '525',
				A_1109_DESCRIPTION_PURCHASE_SELLER = 'Search Fee',
				A_1109_DESCRIPTION_2ND_WITH_TI = 'Search Fee',
				A_1109_DESCRIPTION_2ND_NO_TI = 'Search Fee',
				A_1109_DESCRIPTION_REFINANCE = 'Search Fee',
				A_1109_DESCRIPTION_PURCHASE = 'Search Fee',
				A_1109_PAYTO_PURCHASE_SELLER = 'Roberto DiMichele',
				A_1109_PAYTO_2ND_WITH_TI = 'Roberto DiMichele',
				A_1109_PAYTO_2ND_NO_TI = 'Roberto DiMichele',
				A_1109_PAYTO_REFINANCE = 'Roberto DiMichele',
				A_1109_PAYTO_PURCHASE = 'Roberto DiMichele',
				A_1109_AMOUNT_PURCHASE_SELLER = '150',
				A_1109_AMOUNT_2ND_WITH_TI = '150',
				A_1109_AMOUNT_2ND_NO_TI = '150',
				A_1109_AMOUNT_REFINANCE = '150',
				A_1109_AMOUNT_PURCHASE = '150',
				A_1109_OUTSIDE_PURCHASE_SELLER = '1',
				A_1109_OUTSIDE_2ND_WITH_TI = '1',
				A_1109_OUTSIDE_2ND_NO_TI = '1',
				A_1109_OUTSIDE_REFINANCE = '1',
				A_1109_OUTSIDE_PURCHASE = '1',
				conversion_complete = '1'
				WHERE billing_id = #get_2010_DE_billing_IDs.billing_ID#
			</CFQUERY>
		</cfloop>
		#PrintMessage('UPDATE_Company_Billing_Values_HUD2010 returns.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfcase value="4B">
		#PrintMessage('Step[#form.step#] begins.')#

		<CFQUERY DATASOURCE="#application.DS#" NAME="get_2010_incomplete_billing_IDs" maxrows="500">
			SELECT billing_ID, legacy_billing_id, reference_billing_id
			FROM Company_Billing_Values_HUD2010
			WHERE company_ID <> 100
			AND conversion_complete = '0'
			ORDER BY billing_ID
		</CFQUERY>
		#PrintMessage('get_2010_incomplete_billing_IDs returns #get_2010_incomplete_billing_IDs.recordcount# records.')#
		<cfif request.boolDebug><cfdump var="#get_2010_incomplete_billing_IDs#" expand="false" label="get_2010_incomplete_billing_IDs"></cfif>

		<cfif NOT IsDefined('REQUEST.get_Company_Billing_XFORM')>
			<CFQUERY DATASOURCE="#application.DS#" NAME="REQUEST.get_Company_Billing_XFORM">
				SELECT [desc], linenum, desc_new, payee, outside
				FROM Company_Billing_XFORM
				ORDER BY [desc]
			</CFQUERY>
			#PrintMessage('REQUEST.get_Company_Billing_XFORM returns #REQUEST.get_Company_Billing_XFORM.recordcount# records.')#
			<!---	<cfif request.boolDebug><cfdump var="#REQUEST.get_Company_Billing_XFORM#" expand="false" label="REQUEST.get_Company_Billing_XFORM"></cfif>
			--->
		</cfif>

		<cfif NOT IsDefined('REQUEST.legacy_user_field_list')>
			<cfset request.legacy_user_field_list = "a_1111,a_1112,a_1113,a_1205,a_1303,a_1304,a_1305">
			<cfset request.legacy_user_field_suffix = " ,b,c,d,f">
		</cfif>

		<cfloop query="get_2010_incomplete_billing_IDs">

			<CFQUERY DATASOURCE="#application.DS#" NAME="Get_Legacy_Billing_Values_HUD2010">
				SELECT * FROM company_billing_values WHERE billing_id = #get_2010_incomplete_billing_IDs.legacy_billing_id#
			</CFQUERY>
			<cfif request.boolDebug><hr /><cfdump var="#Get_Legacy_Billing_Values_HUD2010#" expand="false" label="Get_Legacy_Billing_Values_HUD2010"></cfif>

			<cfscript>
				/* New 1102 Initialize only */
				variables.A_1102_AMOUNT_REFINANCE = 0;
				variables.A_1102_AMOUNT_PURCHASE = 0;
				variables.A_1102_AMOUNT_2ND_NO_TI = 0;
				variables.A_1102_AMOUNT_2ND_WITH_TI = 0;
				variables.A_1102_AMOUNT_PURCHASE_SELLER = 0;
			</cfscript>
			<cfloop list="#request.legacy_user_field_list#" index="fn">
				<cfloop list="#request.legacy_user_field_suffix#" index="fs">
					<cfif IsNumeric(Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & Trim(fs))) AND Len(Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & '_text' & Trim(fs)))>
						<cfquery dbtype="query" name="THIS_Company_Billing_XFORM">
							SELECT *
							FROM REQUEST.get_Company_Billing_XFORM
							WHERE [desc] = '#Trim(Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & '_text' & Trim(fs)))#'
						</cfquery>
						<cfswitch expression="#THIS_Company_Billing_XFORM.linenum#">
							<cfcase value="1102">
								<cfif request.boolDebug> Move to 1102: #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)# <br /></cfif>
								<cfswitch expression="#fs#">
									<cfcase value="b">
										<cfset variables.A_1102_AMOUNT_PURCHASE = variables.A_1102_AMOUNT_PURCHASE + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
									</cfcase>
									<cfcase value="c">
										<cfset variables.A_1102_AMOUNT_2ND_NO_TI = variables.A_1102_AMOUNT_2ND_NO_TI + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
									</cfcase>
									<cfcase value="d">
										<cfset variables.A_1102_AMOUNT_2ND_WITH_TI = variables.A_1102_AMOUNT_2ND_WITH_TI + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
									</cfcase>
									<cfcase value="f">
										<cfset variables.A_1102_AMOUNT_PURCHASE_SELLER = variables.A_1102_AMOUNT_PURCHASE_SELLER + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
									</cfcase>
									<cfdefaultcase>
										<cfset variables.A_1102_AMOUNT_REFINANCE = variables.A_1102_AMOUNT_REFINANCE + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
									</cfdefaultcase>
								</cfswitch>
							</cfcase>
							<cfdefaultcase>
								<!--- skip until next pass --->
							</cfdefaultcase>
						</cfswitch>
					</cfif>
				</cfloop>
			</cfloop>

			<cfscript>
				/* Structs */
				if(NOT IsDefined('Itemized_1101')) {
					Itemized_1101 = StructNew();
				}
				else {
					StructClear(Itemized_1101);
				}

				/* Counters */
				variables.newlines_REFINANCE = 0;
				variables.newlines_PURCHASE = 0;
				variables.newlines_2ND_NO_TI = 0;
				variables.newlines_2ND_WITH_TI = 0;
				variables.newlines_PURCHASE_SELLER = 0;

				variables.itemnumber_REFINANCE = 0;
				variables.itemnumber_PURCHASE = 0;
				variables.itemnumber_2ND_NO_TI = 0;
				variables.itemnumber_2ND_WITH_TI = 0;
				variables.itemnumber_PURCHASE_SELLER = 0;

				/* New 1101 = Old 1101 + 1103 + 1104 + 1105 + 1106 */
				variables.A_1101_AMOUNT_REFINANCE = 0;
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1101)) {
					modifier = 0;
					adjusted_a_1101 = 0;
					if(variables.A_1102_AMOUNT_REFINANCE EQ 0) {
						if(IsNumeric(get_2010_incomplete_billing_IDs.reference_billing_id))
							modifier = 325;
						else
							modifier = 125;
						}
					adjusted_a_1101 = Get_Legacy_Billing_Values_HUD2010.a_1101 - modifier;
					if(adjusted_a_1101 LT 0)
						adjusted_a_1101 = 0;
					variables.A_1101_AMOUNT_REFINANCE = variables.A_1101_AMOUNT_REFINANCE + adjusted_a_1101;
					variables.itemnumber_REFINANCE = variables.itemnumber_REFINANCE + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_REFINANCE,'REFINANCE','Settlement or Closing Fee',adjusted_a_1101);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1103)) {
					variables.A_1101_AMOUNT_REFINANCE = variables.A_1101_AMOUNT_REFINANCE + #Get_Legacy_Billing_Values_HUD2010.a_1103#;
					variables.itemnumber_REFINANCE = variables.itemnumber_REFINANCE + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_REFINANCE,'REFINANCE','Title Examination',#Get_Legacy_Billing_Values_HUD2010.a_1103#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1104)) {
					variables.A_1101_AMOUNT_REFINANCE = variables.A_1101_AMOUNT_REFINANCE + #Get_Legacy_Billing_Values_HUD2010.a_1104#;
					variables.itemnumber_REFINANCE = variables.itemnumber_REFINANCE + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_REFINANCE,'REFINANCE','Title Insurance Binder',#Get_Legacy_Billing_Values_HUD2010.a_1104#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1105)) {
					variables.A_1101_AMOUNT_REFINANCE = variables.A_1101_AMOUNT_REFINANCE + #Get_Legacy_Billing_Values_HUD2010.a_1105#;
					variables.itemnumber_REFINANCE = variables.itemnumber_REFINANCE + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_REFINANCE,'REFINANCE','Document Preparation',#Get_Legacy_Billing_Values_HUD2010.a_1105#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1106)) {
					variables.A_1101_AMOUNT_REFINANCE = variables.A_1101_AMOUNT_REFINANCE + #Get_Legacy_Billing_Values_HUD2010.a_1106#;
					variables.itemnumber_REFINANCE = variables.itemnumber_REFINANCE + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_REFINANCE,'REFINANCE','Notary Fees',#Get_Legacy_Billing_Values_HUD2010.a_1106#);
					}

				/* New 1101 = Old 1101 + 1103 + 1104 + 1105 + 1106 */
				variables.A_1101_AMOUNT_PURCHASE = 0;
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1101b)) {
					modifier = 0;
					adjusted_a_1101b = 0;
					if(variables.A_1102_AMOUNT_PURCHASE EQ 0) {
						if(IsNumeric(get_2010_incomplete_billing_IDs.reference_billing_id))
							modifier = 325;
						else
							modifier = 125;
						}
					adjusted_a_1101b = Get_Legacy_Billing_Values_HUD2010.a_1101b - modifier;
					if(adjusted_a_1101b LT 0)
						adjusted_a_1101b = 0;
					variables.A_1101_AMOUNT_PURCHASE = variables.A_1101_AMOUNT_PURCHASE + adjusted_a_1101b;
					variables.itemnumber_PURCHASE = variables.itemnumber_PURCHASE + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE,'PURCHASE','Settlement or Closing Fee',adjusted_a_1101b);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1103b)) {
					variables.A_1101_AMOUNT_PURCHASE = variables.A_1101_AMOUNT_PURCHASE + #Get_Legacy_Billing_Values_HUD2010.a_1103b#;
					variables.itemnumber_PURCHASE = variables.itemnumber_PURCHASE + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE,'PURCHASE','Title Examination',#Get_Legacy_Billing_Values_HUD2010.a_1103b#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1104b)) {
					variables.A_1101_AMOUNT_PURCHASE = variables.A_1101_AMOUNT_PURCHASE + #Get_Legacy_Billing_Values_HUD2010.a_1104b#;
					variables.itemnumber_PURCHASE = variables.itemnumber_PURCHASE + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE,'PURCHASE','Title Insurance Binder',#Get_Legacy_Billing_Values_HUD2010.a_1104b#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1105b)) {
					variables.A_1101_AMOUNT_PURCHASE = variables.A_1101_AMOUNT_PURCHASE + #Get_Legacy_Billing_Values_HUD2010.a_1105b#;
					variables.itemnumber_PURCHASE = variables.itemnumber_PURCHASE + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE,'PURCHASE','Document Preparation',#Get_Legacy_Billing_Values_HUD2010.a_1105b#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1106b)) {
					variables.A_1101_AMOUNT_PURCHASE = variables.A_1101_AMOUNT_PURCHASE + #Get_Legacy_Billing_Values_HUD2010.a_1106b#;
					variables.itemnumber_PURCHASE = variables.itemnumber_PURCHASE + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE,'PURCHASE','Notary Fees',#Get_Legacy_Billing_Values_HUD2010.a_1106b#);
					}

				/* New 1101 = Old 1101 + 1103 + 1104 + 1105 + 1106 */
				variables.A_1101_AMOUNT_2ND_NO_TI = 0;
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1101c)) {
					modifier = 0;
					adjusted_a_1101c = 0;
					if(variables.A_1102_AMOUNT_2ND_NO_TI EQ 0) {
						if(IsNumeric(get_2010_incomplete_billing_IDs.reference_billing_id))
							modifier = 325;
						else
							modifier = 125;
						}
					adjusted_a_1101c = Get_Legacy_Billing_Values_HUD2010.a_1101c - modifier;
					if(adjusted_a_1101c LT 0)
						adjusted_a_1101c = 0;
					variables.A_1101_AMOUNT_2ND_NO_TI = variables.A_1101_AMOUNT_2ND_NO_TI + adjusted_a_1101c;
					variables.itemnumber_2ND_NO_TI = variables.itemnumber_2ND_NO_TI + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_NO_TI,'2ND_NO_TI','Settlement or Closing Fee',adjusted_a_1101c);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1103c)) {
					variables.A_1101_AMOUNT_2ND_NO_TI = variables.A_1101_AMOUNT_2ND_NO_TI + #Get_Legacy_Billing_Values_HUD2010.a_1103c#;
					variables.itemnumber_2ND_NO_TI = variables.itemnumber_2ND_NO_TI + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_NO_TI,'2ND_NO_TI','Title Examination',#Get_Legacy_Billing_Values_HUD2010.a_1103c#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1104c)) {
					variables.A_1101_AMOUNT_2ND_NO_TI = variables.A_1101_AMOUNT_2ND_NO_TI + #Get_Legacy_Billing_Values_HUD2010.a_1104c#;
					variables.itemnumber_2ND_NO_TI = variables.itemnumber_2ND_NO_TI + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_NO_TI,'2ND_NO_TI','Title Insurance Binder',#Get_Legacy_Billing_Values_HUD2010.a_1104c#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1105c)) {
					variables.A_1101_AMOUNT_2ND_NO_TI = variables.A_1101_AMOUNT_2ND_NO_TI + #Get_Legacy_Billing_Values_HUD2010.a_1105c#;
					variables.itemnumber_2ND_NO_TI = variables.itemnumber_2ND_NO_TI + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_NO_TI,'2ND_NO_TI','Document Preparation',#Get_Legacy_Billing_Values_HUD2010.a_1105c#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1106c)) {
					variables.A_1101_AMOUNT_2ND_NO_TI = variables.A_1101_AMOUNT_2ND_NO_TI + #Get_Legacy_Billing_Values_HUD2010.a_1106c#;
					variables.itemnumber_2ND_NO_TI = variables.itemnumber_2ND_NO_TI + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_NO_TI,'2ND_NO_TI','Notary Fees',#Get_Legacy_Billing_Values_HUD2010.a_1106c#);
					}

				/* New 1101 = Old 1101 + 1103 + 1104 + 1105 + 1106 */
				variables.A_1101_AMOUNT_2ND_WITH_TI = 0;
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1101d)) {
					modifier = 0;
					adjusted_a_1101d = 0;
					if(variables.A_1102_AMOUNT_2ND_WITH_TI EQ 0) {
						if(IsNumeric(get_2010_incomplete_billing_IDs.reference_billing_id))
							modifier = 325;
						else
							modifier = 125;
						}
					adjusted_a_1101d = Get_Legacy_Billing_Values_HUD2010.a_1101d - modifier;
					if(adjusted_a_1101d LT 0)
						adjusted_a_1101d = 0;
					variables.A_1101_AMOUNT_2ND_WITH_TI = variables.A_1101_AMOUNT_2ND_WITH_TI + adjusted_a_1101d;
					variables.itemnumber_2ND_WITH_TI = variables.itemnumber_2ND_WITH_TI + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_WITH_TI,'2ND_WITH_TI','Settlement or Closing Fee',adjusted_a_1101d);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1103d)) {
					variables.A_1101_AMOUNT_2ND_WITH_TI = variables.A_1101_AMOUNT_2ND_WITH_TI + #Get_Legacy_Billing_Values_HUD2010.a_1103d#;
					variables.itemnumber_2ND_WITH_TI = variables.itemnumber_2ND_WITH_TI + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_WITH_TI,'2ND_WITH_TI','Title Examination',#Get_Legacy_Billing_Values_HUD2010.a_1103d#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1104d)) {
					variables.A_1101_AMOUNT_2ND_WITH_TI = variables.A_1101_AMOUNT_2ND_WITH_TI + #Get_Legacy_Billing_Values_HUD2010.a_1104d#;
					variables.itemnumber_2ND_WITH_TI = variables.itemnumber_2ND_WITH_TI + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_WITH_TI,'2ND_WITH_TI','Title Insurance Binder',#Get_Legacy_Billing_Values_HUD2010.a_1104d#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1105d)) {
					variables.A_1101_AMOUNT_2ND_WITH_TI = variables.A_1101_AMOUNT_2ND_WITH_TI + #Get_Legacy_Billing_Values_HUD2010.a_1105d#;
					variables.itemnumber_2ND_WITH_TI = variables.itemnumber_2ND_WITH_TI + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_WITH_TI,'2ND_WITH_TI','Document Preparation',#Get_Legacy_Billing_Values_HUD2010.a_1105d#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1106d)) {
					variables.A_1101_AMOUNT_2ND_WITH_TI = variables.A_1101_AMOUNT_2ND_WITH_TI + #Get_Legacy_Billing_Values_HUD2010.a_1106d#;
					variables.itemnumber_2ND_WITH_TI = variables.itemnumber_2ND_WITH_TI + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_WITH_TI,'2ND_WITH_TI','Notary Fees',#Get_Legacy_Billing_Values_HUD2010.a_1106d#);
					}

				/* New 1101 = Old 1101 + 1103 + 1104 + 1105 + 1106 */
				variables.A_1101_AMOUNT_PURCHASE_SELLER = 0;
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1101f)) {
					modifier = 0;
					adjusted_a_1101f = 0;
					if(variables.A_1102_AMOUNT_PURCHASE_SELLER EQ 0) {
						if(IsNumeric(get_2010_incomplete_billing_IDs.reference_billing_id))
							modifier = 325;
						else
							modifier = 125;
						}
					adjusted_a_1101f = Get_Legacy_Billing_Values_HUD2010.a_1101f - modifier;
					if(adjusted_a_1101f LT 0)
						adjusted_a_1101f = 0;
					variables.A_1101_AMOUNT_PURCHASE_SELLER = variables.A_1101_AMOUNT_PURCHASE_SELLER + adjusted_a_1101f;
					variables.itemnumber_PURCHASE_SELLER = variables.itemnumber_PURCHASE_SELLER + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE_SELLER,'PURCHASE_SELLER','Settlement or Closing Fee',adjusted_a_1101f);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1103f)) {
					variables.A_1101_AMOUNT_PURCHASE_SELLER = variables.A_1101_AMOUNT_PURCHASE_SELLER + #Get_Legacy_Billing_Values_HUD2010.a_1103f#;
					variables.itemnumber_PURCHASE_SELLER = variables.itemnumber_PURCHASE_SELLER + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE_SELLER,'PURCHASE_SELLER','Title Examination',#Get_Legacy_Billing_Values_HUD2010.a_1103f#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1104f)) {
					variables.A_1101_AMOUNT_PURCHASE_SELLER = variables.A_1101_AMOUNT_PURCHASE_SELLER + #Get_Legacy_Billing_Values_HUD2010.a_1104f#;
					variables.itemnumber_PURCHASE_SELLER = variables.itemnumber_PURCHASE_SELLER + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE_SELLER,'PURCHASE_SELLER','Title Insurance Binder',#Get_Legacy_Billing_Values_HUD2010.a_1104f#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1105f)) {
					variables.A_1101_AMOUNT_PURCHASE_SELLER = variables.A_1101_AMOUNT_PURCHASE_SELLER + #Get_Legacy_Billing_Values_HUD2010.a_1105f#;
					variables.itemnumber_PURCHASE_SELLER = variables.itemnumber_PURCHASE_SELLER + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE_SELLER,'PURCHASE_SELLER','Document Preparation',#Get_Legacy_Billing_Values_HUD2010.a_1105f#);
					}
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1106f)) {
					variables.A_1101_AMOUNT_PURCHASE_SELLER = variables.A_1101_AMOUNT_PURCHASE_SELLER + #Get_Legacy_Billing_Values_HUD2010.a_1106f#;
					variables.itemnumber_PURCHASE_SELLER = variables.itemnumber_PURCHASE_SELLER + 1;
					InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE_SELLER,'PURCHASE_SELLER','Notary Fees',#Get_Legacy_Billing_Values_HUD2010.a_1106f#);
					}


				/* New 1109 = Old 1102 */
				variables.A_1109_AMOUNT_REFINANCE = 0;
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1102))
					variables.A_1109_AMOUNT_REFINANCE = variables.A_1109_AMOUNT_REFINANCE + #Get_Legacy_Billing_Values_HUD2010.a_1102#;

				variables.A_1109_AMOUNT_PURCHASE = 0;
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1102b))
					variables.A_1109_AMOUNT_PURCHASE = variables.A_1109_AMOUNT_PURCHASE + #Get_Legacy_Billing_Values_HUD2010.a_1102b#;

				variables.A_1109_AMOUNT_2ND_NO_TI = 0;
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1102c))
					variables.A_1109_AMOUNT_2ND_NO_TI = variables.A_1109_AMOUNT_2ND_NO_TI + #Get_Legacy_Billing_Values_HUD2010.a_1102c#;

				variables.A_1109_AMOUNT_2ND_WITH_TI = 0;
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1102d))
					variables.A_1109_AMOUNT_2ND_WITH_TI = variables.A_1109_AMOUNT_2ND_WITH_TI + #Get_Legacy_Billing_Values_HUD2010.a_1102d#;

				variables.A_1109_AMOUNT_PURCHASE_SELLER = 0;
				if(IsNumeric(Get_Legacy_Billing_Values_HUD2010.a_1102f))
					variables.A_1109_AMOUNT_PURCHASE_SELLER = variables.A_1109_AMOUNT_PURCHASE_SELLER + #Get_Legacy_Billing_Values_HUD2010.a_1102f#;

				/* User Fields Initialize */
				variables.A_1110_AMOUNT_REFINANCE = 0;
				variables.A_1110_AMOUNT_PURCHASE = 0;
				variables.A_1110_AMOUNT_2ND_NO_TI = 0;
				variables.A_1110_AMOUNT_2ND_WITH_TI = 0;
				variables.A_1110_AMOUNT_PURCHASE_SELLER = 0;

				variables.A_1111_AMOUNT_REFINANCE = 0;
				variables.A_1111_AMOUNT_PURCHASE = 0;
				variables.A_1111_AMOUNT_2ND_NO_TI = 0;
				variables.A_1111_AMOUNT_2ND_WITH_TI = 0;
				variables.A_1111_AMOUNT_PURCHASE_SELLER = 0;

				variables.A_1112_AMOUNT_REFINANCE = 0;
				variables.A_1112_AMOUNT_PURCHASE = 0;
				variables.A_1112_AMOUNT_2ND_NO_TI = 0;
				variables.A_1112_AMOUNT_2ND_WITH_TI = 0;
				variables.A_1112_AMOUNT_PURCHASE_SELLER = 0;

				variables.A_1113_AMOUNT_REFINANCE = 0;
				variables.A_1113_AMOUNT_PURCHASE = 0;
				variables.A_1113_AMOUNT_2ND_NO_TI = 0;
				variables.A_1113_AMOUNT_2ND_WITH_TI = 0;
				variables.A_1113_AMOUNT_PURCHASE_SELLER = 0;

			</cfscript>

			<cfif request.boolDebug>

			get_2010_incomplete_billing_IDs.billing_ID = #get_2010_incomplete_billing_IDs.billing_ID# <br />
			get_2010_incomplete_billing_IDs.legacy_billing_ID = #get_2010_incomplete_billing_IDs.legacy_billing_ID# <br />
			<br />
			A_1101_AMOUNT_REFINANCE = #variables.A_1101_AMOUNT_REFINANCE#	<br />
			A_1101_AMOUNT_PURCHASE = #variables.A_1101_AMOUNT_PURCHASE#		<br />
			A_1101_AMOUNT_2ND_NO_TI = #variables.A_1101_AMOUNT_2ND_NO_TI#	<br />
			A_1101_AMOUNT_2ND_WITH_TI = #variables.A_1101_AMOUNT_2ND_WITH_TI#	<br />
			A_1101_AMOUNT_PURCHASE_SELLER = #variables.A_1101_AMOUNT_PURCHASE_SELLER#	<br />
			<br />
			A_1109_PAYTO_* = 'Abstracts USA, LLC' <br />
			A_1109_DESCRIPTION_* = 'Abstract' <br />
			A_1109_AMOUNT_REFINANCE = #variables.A_1109_AMOUNT_REFINANCE#	<br />
			A_1109_AMOUNT_PURCHASE = #variables.A_1109_AMOUNT_PURCHASE#		<br />
			A_1109_AMOUNT_2ND_NO_TI = #variables.A_1109_AMOUNT_2ND_NO_TI#	<br />
			A_1109_AMOUNT_2ND_WITH_TI = #variables.A_1109_AMOUNT_2ND_WITH_TI#	<br />
			A_1109_AMOUNT_PURCHASE_SELLER = #variables.A_1109_AMOUNT_PURCHASE_SELLER#	<br />

			</cfif>

			<cfloop list="#request.legacy_user_field_list#" index="fn">
				<cfloop list="#request.legacy_user_field_suffix#" index="fs">

					<cfif IsNumeric(Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & Trim(fs))) AND Len(Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & '_text' & Trim(fs)))>
						<cfquery dbtype="query" name="THIS_Company_Billing_XFORM">
							SELECT *
							FROM REQUEST.get_Company_Billing_XFORM
							WHERE [desc] = '#Trim(Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & '_text' & Trim(fs)))#'
						</cfquery>

						<cfif request.boolDebug>
						<br />
						Get_Legacy_Billing_Values_HUD2010.#fn#_text#fs# =
						'#Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & '_text' & fs)#' <br />
						Get_Legacy_Billing_Values_HUD2010.#fn##fs# =
						'#Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#' 						<br />
						MAPPING: #THIS_Company_Billing_XFORM.desc# to #THIS_Company_Billing_XFORM.desc_new# <br />
						</cfif>

						<cfswitch expression="#THIS_Company_Billing_XFORM.linenum#">

							<cfcase value="1101">
								<cfif request.boolDebug>Move to 1101: #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)# <br /></cfif>
								<cfswitch expression="#fs#">
									<cfcase value="b">
										<cfset variables.A_1101_AMOUNT_PURCHASE = variables.A_1101_AMOUNT_PURCHASE + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
										<cfset variables.itemnumber_PURCHASE = variables.itemnumber_PURCHASE + 1>
										<cfset temp = InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE,'PURCHASE',THIS_Company_Billing_XFORM.desc,#Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#)>
									</cfcase>
									<cfcase value="c">
										<cfset variables.A_1101_AMOUNT_2ND_NO_TI = variables.A_1101_AMOUNT_2ND_NO_TI + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
										<cfset variables.itemnumber_2ND_NO_TI = variables.itemnumber_2ND_NO_TI + 1>
										<cfset temp = InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_NO_TI,'2ND_NO_TI',THIS_Company_Billing_XFORM.desc,#Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#)>
									</cfcase>
									<cfcase value="d">
										<cfset variables.A_1101_AMOUNT_2ND_WITH_TI = variables.A_1101_AMOUNT_2ND_WITH_TI + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
										<cfset variables.itemnumber_2ND_WITH_TI = variables.itemnumber_2ND_WITH_TI + 1>
										<cfset temp = InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_2ND_WITH_TI,'2ND_WITH_TI',THIS_Company_Billing_XFORM.desc,#Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#)>
									</cfcase>
									<cfcase value="f">
										<cfset variables.A_1101_AMOUNT_PURCHASE_SELLER = variables.A_1101_AMOUNT_PURCHASE_SELLER + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
										<cfset variables.itemnumber_PURCHASE_SELLER = variables.itemnumber_PURCHASE_SELLER + 1>
										<cfset temp = InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_PURCHASE_SELLER,'PURCHASE_SELLER',THIS_Company_Billing_XFORM.desc,#Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#)>
									</cfcase>
									<cfdefaultcase>
										<cfset variables.A_1101_AMOUNT_REFINANCE = variables.A_1101_AMOUNT_REFINANCE + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
										<cfset variables.itemnumber_REFINANCE = variables.itemnumber_REFINANCE + 1>
										<cfset temp = InsertItemized1101(#get_2010_incomplete_billing_IDs.billing_id#,variables.itemnumber_REFINANCE,'REFINANCE',THIS_Company_Billing_XFORM.desc,#Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#)>
									</cfdefaultcase>
								</cfswitch>
							</cfcase>

							<cfcase value="NEW">
								<cfif request.boolDebug> Move to New Line: #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)# <br /></cfif>
								<cfswitch expression="#fs#">
									<cfcase value="b">
										<cfswitch expression="#variables.newlines_PURCHASE#">
											<cfcase value="0">
												<cfset variables.newlinenum = "1110">
												<cfset variables.newlines_PURCHASE = 1>
											</cfcase>
											<cfcase value="1">
												<cfset variables.newlinenum = "1111">
												<cfset variables.newlines_PURCHASE = 2>
											</cfcase>
											<cfcase value="2">
												<cfset variables.newlinenum = "1112">
												<cfset variables.newlines_PURCHASE = 3>
											</cfcase>
											<cfcase value="3">
												<cfset variables.newlinenum = "1113">
												<cfset variables.newlines_PURCHASE = 4>
											</cfcase>
											<cfdefaultcase>
												RAN OUT OF newlines_PURCHASE! <br />
												get_2010_incomplete_billing_IDs.billing_ID = #get_2010_incomplete_billing_IDs.billing_ID# <br />
												get_2010_incomplete_billing_IDs.legacy_billing_ID = #get_2010_incomplete_billing_IDs.legacy_billing_ID# <br />
												<cfabort>
											</cfdefaultcase>
										</cfswitch>
										<cfset 'variables.A_#variables.newlinenum#_AMOUNT_PURCHASE' = #Evaluate('variables.A_' & variables.newlinenum & '_AMOUNT_PURCHASE')# + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
										<cfset 'variables.A_#variables.newlinenum#_DESCRIPTION_PURCHASE' = THIS_Company_Billing_XFORM.desc_new>
										<cfset 'variables.A_#variables.newlinenum#_PAYTO_PURCHASE' = THIS_Company_Billing_XFORM.payee>
										<cfset 'variables.A_#variables.newlinenum#_OUTSIDE_PURCHASE' = THIS_Company_Billing_XFORM.outside>
									</cfcase>
									<cfcase value="c">
										<cfswitch expression="#variables.newlines_2ND_NO_TI#">
											<cfcase value="0">
												<cfset variables.newlinenum = "1110">
												<cfset variables.newlines_2ND_NO_TI = 1>
											</cfcase>
											<cfcase value="1">
												<cfset variables.newlinenum = "1111">
												<cfset variables.newlines_2ND_NO_TI = 2>
											</cfcase>
											<cfcase value="2">
												<cfset variables.newlinenum = "1112">
												<cfset variables.newlines_2ND_NO_TI = 3>
											</cfcase>
											<cfcase value="3">
												<cfset variables.newlinenum = "1113">
												<cfset variables.newlines_2ND_NO_TI = 4>
											</cfcase>
											<cfdefaultcase>
												RAN OUT OF newlines_2ND_NO_TI! <br />
												get_2010_incomplete_billing_IDs.billing_ID = #get_2010_incomplete_billing_IDs.billing_ID# <br />
												get_2010_incomplete_billing_IDs.legacy_billing_ID = #get_2010_incomplete_billing_IDs.legacy_billing_ID# <br />
												<cfabort>
											</cfdefaultcase>
										</cfswitch>
										<cfset 'variables.A_#variables.newlinenum#_AMOUNT_2ND_NO_TI' = #Evaluate('variables.A_' & variables.newlinenum & '_AMOUNT_2ND_NO_TI')# + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
										<cfset 'variables.A_#variables.newlinenum#_DESCRIPTION_2ND_NO_TI' = THIS_Company_Billing_XFORM.desc_new>
										<cfset 'variables.A_#variables.newlinenum#_PAYTO_2ND_NO_TI' = THIS_Company_Billing_XFORM.payee>
										<cfset 'variables.A_#variables.newlinenum#_OUTSIDE_2ND_NO_TI' = THIS_Company_Billing_XFORM.outside>
									</cfcase>
									<cfcase value="d">
										<cfswitch expression="#variables.newlines_2ND_WITH_TI#">
											<cfcase value="0">
												<cfset variables.newlinenum = "1110">
												<cfset variables.newlines_2ND_WITH_TI = 1>
											</cfcase>
											<cfcase value="1">
												<cfset variables.newlinenum = "1111">
												<cfset variables.newlines_2ND_WITH_TI = 2>
											</cfcase>
											<cfcase value="2">
												<cfset variables.newlinenum = "1112">
												<cfset variables.newlines_2ND_WITH_TI = 3>
											</cfcase>
											<cfcase value="3">
												<cfset variables.newlinenum = "1113">
												<cfset variables.newlines_2ND_WITH_TI = 4>
											</cfcase>
											<cfdefaultcase>
												RAN OUT OF newlines_2ND_WITH_TI! <br />
												get_2010_incomplete_billing_IDs.billing_ID = #get_2010_incomplete_billing_IDs.billing_ID# <br />
												get_2010_incomplete_billing_IDs.legacy_billing_ID = #get_2010_incomplete_billing_IDs.legacy_billing_ID# <br />
												<cfabort>
											</cfdefaultcase>
										</cfswitch>
										<cfset 'variables.A_#variables.newlinenum#_AMOUNT_2ND_WITH_TI' = #Evaluate('variables.A_' & variables.newlinenum & '_AMOUNT_2ND_WITH_TI')# + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
										<cfset 'variables.A_#variables.newlinenum#_DESCRIPTION_2ND_WITH_TI' = THIS_Company_Billing_XFORM.desc_new>
										<cfset 'variables.A_#variables.newlinenum#_PAYTO_2ND_WITH_TI' = THIS_Company_Billing_XFORM.payee>
										<cfset 'variables.A_#variables.newlinenum#_OUTSIDE_2ND_WITH_TI' = THIS_Company_Billing_XFORM.outside>
									</cfcase>
									<cfcase value="f">
										<cfswitch expression="#variables.newlines_PURCHASE_SELLER#">
											<cfcase value="0">
												<cfset variables.newlinenum = "1110">
												<cfset variables.newlines_PURCHASE_SELLER = 1>
											</cfcase>
											<cfcase value="1">
												<cfset variables.newlinenum = "1111">
												<cfset variables.newlines_PURCHASE_SELLER = 2>
											</cfcase>
											<cfcase value="2">
												<cfset variables.newlinenum = "1112">
												<cfset variables.newlines_PURCHASE_SELLER = 3>
											</cfcase>
											<cfcase value="3">
												<cfset variables.newlinenum = "1113">
												<cfset variables.newlines_PURCHASE_SELLER = 4>
											</cfcase>
											<cfdefaultcase>
												RAN OUT OF newlines_PURCHASE_SELLER! <br />
												get_2010_incomplete_billing_IDs.billing_ID = #get_2010_incomplete_billing_IDs.billing_ID# <br />
												get_2010_incomplete_billing_IDs.legacy_billing_ID = #get_2010_incomplete_billing_IDs.legacy_billing_ID# <br />
												<cfabort>
											</cfdefaultcase>
										</cfswitch>
										<cfset 'variables.A_#variables.newlinenum#_AMOUNT_PURCHASE_SELLER' = #Evaluate('variables.A_' & variables.newlinenum & '_AMOUNT_PURCHASE_SELLER')# + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
										<cfset 'variables.A_#variables.newlinenum#_DESCRIPTION_PURCHASE_SELLER' = THIS_Company_Billing_XFORM.desc_new>
										<cfset 'variables.A_#variables.newlinenum#_PAYTO_PURCHASE_SELLER' = THIS_Company_Billing_XFORM.payee>
										<cfset 'variables.A_#variables.newlinenum#_OUTSIDE_PURCHASE_SELLER' = THIS_Company_Billing_XFORM.outside>
									</cfcase>

									<cfdefaultcase>
										<cfswitch expression="#variables.newlines_REFINANCE#">
											<cfcase value="0">
												<cfset variables.newlinenum = "1110">
												<cfset variables.newlines_REFINANCE = 1>
											</cfcase>
											<cfcase value="1">
												<cfset variables.newlinenum = "1111">
												<cfset variables.newlines_REFINANCE = 2>
											</cfcase>
											<cfcase value="2">
												<cfset variables.newlinenum = "1112">
												<cfset variables.newlines_REFINANCE = 3>
											</cfcase>
											<cfcase value="3">
												<cfset variables.newlinenum = "1113">
												<cfset variables.newlines_REFINANCE = 4>
											</cfcase>
											<cfdefaultcase>
												RAN OUT OF newlines_REFINANCE! <br />
												get_2010_incomplete_billing_IDs.billing_ID = #get_2010_incomplete_billing_IDs.billing_ID# <br />
												get_2010_incomplete_billing_IDs.legacy_billing_ID = #get_2010_incomplete_billing_IDs.legacy_billing_ID# <br />
												<cfabort>
											</cfdefaultcase>
										</cfswitch>
										<cfset 'variables.A_#variables.newlinenum#_AMOUNT_REFINANCE' = #Evaluate('variables.A_' & variables.newlinenum & '_AMOUNT_REFINANCE')# + #Evaluate('Get_Legacy_Billing_Values_HUD2010.' & fn & fs)#>
										<cfset 'variables.A_#variables.newlinenum#_DESCRIPTION_REFINANCE' = THIS_Company_Billing_XFORM.desc_new>
										<cfset 'variables.A_#variables.newlinenum#_PAYTO_REFINANCE' = THIS_Company_Billing_XFORM.payee>
										<cfset 'variables.A_#variables.newlinenum#_OUTSIDE_REFINANCE' = THIS_Company_Billing_XFORM.outside>
									</cfdefaultcase>

								</cfswitch>

							</cfcase>

							<cfdefaultcase>
								<!--- handler VALUE found, but no XFORM mapping --->
							</cfdefaultcase>

						</cfswitch>

					</cfif>

				</cfloop>

			</cfloop>

			<!--- hack for signing fee : adjustments to 1101 and item table done if possible, but this forces a value of GT 0 regardless --->
			<cfif variables.A_1102_AMOUNT_REFINANCE GT 0>
				<!--- ignore --->
			<cfelseif IsNumeric(get_2010_incomplete_billing_IDs.reference_billing_id)>
				<cfset A_1102_AMOUNT_REFINANCE = 325>
			<cfelse>
				<cfset A_1102_AMOUNT_REFINANCE = 125>
			</cfif>

			<cfif variables.A_1102_AMOUNT_PURCHASE GT 0>
				<!--- ignore --->
			<cfelseif IsNumeric(get_2010_incomplete_billing_IDs.reference_billing_id)>
				<cfset A_1102_AMOUNT_PURCHASE = 325>
			<cfelse>
				<cfset A_1102_AMOUNT_PURCHASE = 125>
			</cfif>

			<cfif variables.A_1102_AMOUNT_2ND_NO_TI GT 0>
				<!--- ignore --->
			<cfelseif IsNumeric(get_2010_incomplete_billing_IDs.reference_billing_id)>
				<cfset A_1102_AMOUNT_2ND_NO_TI = 325>
			<cfelse>
				<cfset A_1102_AMOUNT_2ND_NO_TI = 125>
			</cfif>

			<cfif variables.A_1102_AMOUNT_2ND_WITH_TI GT 0>
				<!--- ignore --->
			<cfelseif IsNumeric(get_2010_incomplete_billing_IDs.reference_billing_id)>
				<cfset A_1102_AMOUNT_2ND_WITH_TI = 325>
			<cfelse>
				<cfset A_1102_AMOUNT_2ND_WITH_TI = 125>
			</cfif>

			<cfif variables.A_1102_AMOUNT_PURCHASE_SELLER GT 0>
				<!--- ignore --->
			<cfelseif IsNumeric(get_2010_incomplete_billing_IDs.reference_billing_id)>
				<cfset A_1102_AMOUNT_PURCHASE_SELLER = 325>
			<cfelse>
				<cfset A_1102_AMOUNT_PURCHASE_SELLER = 125>
			</cfif>

			<!---  ////////////////////////////////////////////////////////////////////////////////////////////////   --->
			<!---  ////////////////////////////////////THE QUERY OF DOOM///////////////////////////////////////////   --->
			<!---  ////////////////////////////////////////////////////////////////////////////////////////////////   --->

			<CFQUERY DATASOURCE="#application.DS#" NAME="UPDATE_BILLINGID_#get_2010_incomplete_billing_IDs.billing_ID#">
				UPDATE Company_Billing_Values_HUD2010 SET
				/* 1101 */
				<cfif variables.A_1101_AMOUNT_REFINANCE GT 0>
					A_1101_AMOUNT_REFINANCE = #variables.A_1101_AMOUNT_REFINANCE#,</cfif>
				<cfif variables.A_1101_AMOUNT_PURCHASE GT 0>
					A_1101_AMOUNT_PURCHASE = #variables.A_1101_AMOUNT_PURCHASE#,</cfif>
				<cfif variables.A_1101_AMOUNT_2ND_NO_TI GT 0>
					A_1101_AMOUNT_2ND_NO_TI = #variables.A_1101_AMOUNT_2ND_NO_TI#,</cfif>
				<cfif variables.A_1101_AMOUNT_2ND_WITH_TI GT 0>
					A_1101_AMOUNT_2ND_WITH_TI = #variables.A_1101_AMOUNT_2ND_WITH_TI#,</cfif>
				<cfif variables.A_1101_AMOUNT_PURCHASE_SELLER GT 0>
					A_1101_AMOUNT_PURCHASE_SELLER = #variables.A_1101_AMOUNT_PURCHASE_SELLER#,</cfif>
				/* 1102 */
					A_1102_AMOUNT_REFINANCE = #variables.A_1102_AMOUNT_REFINANCE#,
					A_1102_PAYTO_REFINANCE = 'TP Agent Signer',
					A_1102_DESCRIPTION_REFINANCE = 'Signing Fee',
					A_1102_AMOUNT_PURCHASE = #variables.A_1102_AMOUNT_PURCHASE#,
					A_1102_PAYTO_PURCHASE = 'TP Agent Signer',
					A_1102_DESCRIPTION_PURCHASE = 'Signing Fee',
					A_1102_AMOUNT_2ND_NO_TI = #variables.A_1102_AMOUNT_2ND_NO_TI#,
					A_1102_PAYTO_2ND_NO_TI = 'TP Agent Signer',
					A_1102_DESCRIPTION_2ND_NO_TI = 'Signing Fee',
					A_1102_AMOUNT_2ND_WITH_TI = #variables.A_1102_AMOUNT_2ND_WITH_TI#,
					A_1102_PAYTO_2ND_WITH_TI = 'TP Agent Signer',
					A_1102_DESCRIPTION_2ND_WITH_TI = 'Signing Fee',
					A_1102_AMOUNT_PURCHASE_SELLER = #variables.A_1102_AMOUNT_PURCHASE_SELLER#,
					A_1102_PAYTO_PURCHASE_SELLER = 'TP Agent Signer',
					A_1102_DESCRIPTION_PURCHASE_SELLER = 'Signing Fee',
				/* 1109 */
				<cfif variables.A_1109_AMOUNT_REFINANCE GT 0>
					A_1109_AMOUNT_REFINANCE = #variables.A_1109_AMOUNT_REFINANCE#,
					A_1109_PAYTO_REFINANCE = 'Abstracts USA, LLC',
					A_1109_DESCRIPTION_REFINANCE = 'Abstract',
					A_1109_OUTSIDE_REFINANCE = 1,
				</cfif>
				<cfif variables.A_1109_AMOUNT_PURCHASE GT 0>
					A_1109_AMOUNT_PURCHASE = #variables.A_1109_AMOUNT_PURCHASE#,
					A_1109_PAYTO_PURCHASE = 'Abstracts USA, LLC',
					A_1109_DESCRIPTION_PURCHASE = 'Abstract',
					A_1109_OUTSIDE_PURCHASE = 1,
				</cfif>
				<cfif variables.A_1109_AMOUNT_2ND_NO_TI GT 0>
					A_1109_AMOUNT_2ND_NO_TI = #variables.A_1109_AMOUNT_2ND_NO_TI#,
					A_1109_PAYTO_2ND_NO_TI = 'Abstracts USA, LLC',
					A_1109_DESCRIPTION_2ND_NO_TI = 'Abstract',
					A_1109_OUTSIDE_2ND_NO_TI = 1,
				</cfif>
				<cfif variables.A_1109_AMOUNT_2ND_WITH_TI GT 0>
					A_1109_AMOUNT_2ND_WITH_TI = #variables.A_1109_AMOUNT_2ND_WITH_TI#,
					A_1109_PAYTO_2ND_WITH_TI = 'Abstracts USA, LLC',
					A_1109_DESCRIPTION_2ND_WITH_TI = 'Abstract',
					A_1109_OUTSIDE_2ND_WITH_TI = 1,
				</cfif>
				<cfif variables.A_1109_AMOUNT_PURCHASE_SELLER GT 0>
					A_1109_AMOUNT_PURCHASE_SELLER = #variables.A_1109_AMOUNT_PURCHASE_SELLER#,
					A_1109_PAYTO_PURCHASE_SELLER = 'Abstracts USA, LLC',
					A_1109_DESCRIPTION_PURCHASE_SELLER = 'Abstract',
					A_1109_OUTSIDE_PURCHASE_SELLER = 1,
				</cfif>
				/* User Fields for REFINANCE */
				<cfswitch expression="#variables.newlines_REFINANCE#">
					<cfcase value="1">
						A_1110_AMOUNT_REFINANCE = #variables.A_1110_AMOUNT_REFINANCE#,
						A_1110_PAYTO_REFINANCE = '#variables.A_1110_PAYTO_REFINANCE#',
						A_1110_DESCRIPTION_REFINANCE = '#variables.A_1110_DESCRIPTION_REFINANCE#',
						A_1110_OUTSIDE_REFINANCE = #variables.A_1110_OUTSIDE_REFINANCE#,
					</cfcase>
					<cfcase value="2">
						A_1111_AMOUNT_REFINANCE = #variables.A_1111_AMOUNT_REFINANCE#,
						A_1111_PAYTO_REFINANCE = '#variables.A_1111_PAYTO_REFINANCE#',
						A_1111_DESCRIPTION_REFINANCE = '#variables.A_1111_DESCRIPTION_REFINANCE#',
						A_1111_OUTSIDE_REFINANCE = #variables.A_1111_OUTSIDE_REFINANCE#,
					</cfcase>
					<cfcase value="3">
						A_1112_AMOUNT_REFINANCE = #variables.A_1112_AMOUNT_REFINANCE#,
						A_1112_PAYTO_REFINANCE = '#variables.A_1112_PAYTO_REFINANCE#',
						A_1112_DESCRIPTION_REFINANCE = '#variables.A_1112_DESCRIPTION_REFINANCE#',
						A_1112_OUTSIDE_REFINANCE = #variables.A_1112_OUTSIDE_REFINANCE#,
					</cfcase>
					<cfcase value="4">
						A_1113_AMOUNT_REFINANCE = #variables.A_1113_AMOUNT_REFINANCE#,
						A_1113_PAYTO_REFINANCE = '#variables.A_1113_PAYTO_REFINANCE#',
						A_1113_DESCRIPTION_REFINANCE = '#variables.A_1113_DESCRIPTION_REFINANCE#',
						A_1113_OUTSIDE_REFINANCE = #variables.A_1113_OUTSIDE_REFINANCE#,
					</cfcase>
				</cfswitch>
				/* User Fields for PURCHASE */
				<cfswitch expression="#variables.newlines_PURCHASE#">
					<cfcase value="1">
						A_1110_AMOUNT_PURCHASE = #variables.A_1110_AMOUNT_PURCHASE#,
						A_1110_PAYTO_PURCHASE = '#variables.A_1110_PAYTO_PURCHASE#',
						A_1110_DESCRIPTION_PURCHASE = '#variables.A_1110_DESCRIPTION_PURCHASE#',
						A_1110_OUTSIDE_PURCHASE = #variables.A_1110_OUTSIDE_PURCHASE#,
					</cfcase>
					<cfcase value="2">
						A_1111_AMOUNT_PURCHASE = #variables.A_1111_AMOUNT_PURCHASE#,
						A_1111_PAYTO_PURCHASE = '#variables.A_1111_PAYTO_PURCHASE#',
						A_1111_DESCRIPTION_PURCHASE = '#variables.A_1111_DESCRIPTION_PURCHASE#',
						A_1111_OUTSIDE_PURCHASE = #variables.A_1111_OUTSIDE_PURCHASE#,
					</cfcase>
					<cfcase value="3">
						A_1112_AMOUNT_PURCHASE = #variables.A_1112_AMOUNT_PURCHASE#,
						A_1112_PAYTO_PURCHASE = '#variables.A_1112_PAYTO_PURCHASE#',
						A_1112_DESCRIPTION_PURCHASE = '#variables.A_1112_DESCRIPTION_PURCHASE#',
						A_1112_OUTSIDE_PURCHASE = #variables.A_1112_OUTSIDE_PURCHASE#,
					</cfcase>
					<cfcase value="4">
						A_1113_AMOUNT_PURCHASE = #variables.A_1113_AMOUNT_PURCHASE#,
						A_1113_PAYTO_PURCHASE = '#variables.A_1113_PAYTO_PURCHASE#',
						A_1113_DESCRIPTION_PURCHASE = '#variables.A_1113_DESCRIPTION_PURCHASE#',
						A_1113_OUTSIDE_PURCHASE = #variables.A_1113_OUTSIDE_PURCHASE#,
					</cfcase>
				</cfswitch>
				/* User Fields for 2ND_NO_TI */
				<cfswitch expression="#variables.newlines_2ND_NO_TI#">
					<cfcase value="1">
						A_1110_AMOUNT_2ND_NO_TI = #variables.A_1110_AMOUNT_2ND_NO_TI#,
						A_1110_PAYTO_2ND_NO_TI = '#variables.A_1110_PAYTO_2ND_NO_TI#',
						A_1110_DESCRIPTION_2ND_NO_TI = '#variables.A_1110_DESCRIPTION_2ND_NO_TI#',
						A_1110_OUTSIDE_2ND_NO_TI = #variables.A_1110_OUTSIDE_2ND_NO_TI#,
					</cfcase>
					<cfcase value="2">
						A_1111_AMOUNT_2ND_NO_TI = #variables.A_1111_AMOUNT_2ND_NO_TI#,
						A_1111_PAYTO_2ND_NO_TI = '#variables.A_1111_PAYTO_2ND_NO_TI#',
						A_1111_DESCRIPTION_2ND_NO_TI = '#variables.A_1111_DESCRIPTION_2ND_NO_TI#',
						A_1111_OUTSIDE_2ND_NO_TI = #variables.A_1111_OUTSIDE_2ND_NO_TI#,
					</cfcase>
					<cfcase value="3">
						A_1112_AMOUNT_2ND_NO_TI = #variables.A_1112_AMOUNT_2ND_NO_TI#,
						A_1112_PAYTO_2ND_NO_TI = '#variables.A_1112_PAYTO_2ND_NO_TI#',
						A_1112_DESCRIPTION_2ND_NO_TI = '#variables.A_1112_DESCRIPTION_2ND_NO_TI#',
						A_1112_OUTSIDE_2ND_NO_TI = #variables.A_1112_OUTSIDE_2ND_NO_TI#,
					</cfcase>
					<cfcase value="4">
						A_1113_AMOUNT_2ND_NO_TI = #variables.A_1113_AMOUNT_2ND_NO_TI#,
						A_1113_PAYTO_2ND_NO_TI = '#variables.A_1113_PAYTO_2ND_NO_TI#',
						A_1113_DESCRIPTION_2ND_NO_TI = '#variables.A_1113_DESCRIPTION_2ND_NO_TI#',
						A_1113_OUTSIDE_2ND_NO_TI = #variables.A_1113_OUTSIDE_2ND_NO_TI#,
					</cfcase>
				</cfswitch>
				/* User Fields for 2ND_WITH_TI */
				<cfswitch expression="#variables.newlines_2ND_WITH_TI#">
					<cfcase value="1">
						A_1110_AMOUNT_2ND_WITH_TI = #variables.A_1110_AMOUNT_2ND_WITH_TI#,
						A_1110_PAYTO_2ND_WITH_TI = '#variables.A_1110_PAYTO_2ND_WITH_TI#',
						A_1110_DESCRIPTION_2ND_WITH_TI = '#variables.A_1110_DESCRIPTION_2ND_WITH_TI#',
						A_1110_OUTSIDE_2ND_WITH_TI = #variables.A_1110_OUTSIDE_2ND_WITH_TI#,
					</cfcase>
					<cfcase value="2">
						A_1111_AMOUNT_2ND_WITH_TI = #variables.A_1111_AMOUNT_PURCHASE#,
						A_1111_PAYTO_2ND_WITH_TI = '#variables.A_1111_PAYTO_2ND_WITH_TI#',
						A_1111_DESCRIPTION_2ND_WITH_TI = '#variables.A_1111_DESCRIPTION_2ND_WITH_TI#',
						A_1111_OUTSIDE_2ND_WITH_TI = #variables.A_1111_OUTSIDE_2ND_WITH_TI#,
					</cfcase>
					<cfcase value="3">
						A_1112_AMOUNT_2ND_WITH_TI = #variables.A_1112_AMOUNT_PURCHASE#,
						A_1112_PAYTO_2ND_WITH_TI = '#variables.A_1112_PAYTO_2ND_WITH_TI#',
						A_1112_DESCRIPTION_2ND_WITH_TI = '#variables.A_1112_DESCRIPTION_2ND_WITH_TI#',
						A_1112_OUTSIDE_2ND_WITH_TI = #variables.A_1112_OUTSIDE_2ND_WITH_TI#,
					</cfcase>
					<cfcase value="4">
						A_1113_AMOUNT_2ND_WITH_TI = #variables.A_1113_AMOUNT_PURCHASE#,
						A_1113_PAYTO_2ND_WITH_TI = '#variables.A_1113_PAYTO_2ND_WITH_TI#',
						A_1113_DESCRIPTION_2ND_WITH_TI = '#variables.A_1113_DESCRIPTION_2ND_WITH_TI#',
						A_1113_OUTSIDE_2ND_WITH_TI = #variables.A_1113_OUTSIDE_2ND_WITH_TI#,
					</cfcase>
				</cfswitch>
				/* User Fields for PURCHASE_SELLER */
				<cfswitch expression="#variables.newlines_PURCHASE_SELLER#">
					<cfcase value="1">
						A_1110_AMOUNT_PURCHASE_SELLER = #variables.A_1110_AMOUNT_PURCHASE_SELLER#,
						A_1110_PAYTO_PURCHASE_SELLER = '#variables.A_1110_PAYTO_PURCHASE_SELLER#',
						A_1110_DESCRIPTION_PURCHASE_SELLER = '#variables.A_1110_DESCRIPTION_PURCHASE_SELLER#',
						A_1110_OUTSIDE_PURCHASE_SELLER = #variables.A_1110_OUTSIDE_PURCHASE_SELLER#,
					</cfcase>
					<cfcase value="2">
						A_1111_AMOUNT_PURCHASE_SELLER = #variables.A_1111_AMOUNT_PURCHASE_SELLER#,
						A_1111_PAYTO_PURCHASE_SELLER = '#variables.A_1111_PAYTO_PURCHASE_SELLER#',
						A_1111_DESCRIPTION_PURCHASE_SELLER = '#variables.A_1111_DESCRIPTION_PURCHASE_SELLER#',
						A_1111_OUTSIDE_PURCHASE_SELLER = #variables.A_1111_OUTSIDE_PURCHASE_SELLER#,
					</cfcase>
					<cfcase value="3">
						A_1112_AMOUNT_PURCHASE_SELLER = #variables.A_1112_AMOUNT_PURCHASE_SELLER#,
						A_1112_PAYTO_PURCHASE_SELLER = '#variables.A_1112_PAYTO_PURCHASE_SELLER#',
						A_1112_DESCRIPTION_PURCHASE_SELLER = '#variables.A_1112_DESCRIPTION_PURCHASE_SELLER#',
						A_1112_OUTSIDE_PURCHASE_SELLER = #variables.A_1112_OUTSIDE_PURCHASE_SELLER#,
					</cfcase>
					<cfcase value="4">
						A_1113_AMOUNT_PURCHASE_SELLER = #variables.A_1113_AMOUNT_PURCHASE_SELLER#,
						A_1113_PAYTO_PURCHASE_SELLER = '#variables.A_1113_PAYTO_PURCHASE_SELLER#',
						A_1113_DESCRIPTION_PURCHASE_SELLER = '#variables.A_1113_DESCRIPTION_PURCHASE_SELLER#',
						A_1113_OUTSIDE_PURCHASE_SELLER = #variables.A_1113_OUTSIDE_PURCHASE_SELLER#,
					</cfcase>
				</cfswitch>
				/* Logging Data */
				b_date = '#DateFormat(Now(),'mm/dd/yyyy')#',
				b_time = '#TimeFormat(Now(),'hh:mm:ss')#',
				conversion_complete = 1
				WHERE billing_id = #get_2010_incomplete_billing_IDs.billing_ID#;
			</CFQUERY>

			<cfif NOT StructIsEmpty(Itemized_1101)>
				<CFQUERY DATASOURCE="#application.DS#" NAME="UPDATE_ITEMIZED_1101_CHARGES">
					UPDATE ITEMIZED_1101_CHARGES SET
					<cfloop list="#StructKeyList(Itemized_1101)#" index="sk">
					#sk# = '#StructFind(Itemized_1101, sk)#',
					</cfloop>
					billing_ID = #get_2010_incomplete_billing_IDs.billing_ID#
					WHERE billing_ID = #get_2010_incomplete_billing_IDs.billing_ID#;
				</cfquery>
			</cfif>

			<cfif NOT IsDefined('pass1')>
				<form name="form_thisbillingid" id="form_thisbillingid">
					Conversion completed for Billing ID: <input name="thisbillingid" type="text" disabled>
				</form>
				<cfset pass1 = true>
			</cfif>
			<script type="text/javascript">
				temp = document.form_thisbillingid.thisbillingid.value = '#get_2010_incomplete_billing_IDs.billing_ID#';
			</script>
			<cfflush>
			<!--- #PrintMessage('Conversion completed for Billing ID: #get_2010_incomplete_billing_IDs.billing_ID#.')# --->
		</cfloop>
		<cfif request.boolDebug>
			<CFQUERY DATASOURCE="#application.DS#" NAME="post_UPDATE">
				SELECT * FROM Company_Billing_Values_HUD2010
				WHERE Billing_ID = #get_2010_incomplete_billing_IDs.billing_ID#
			</CFQUERY>
			<cfdump var="#post_UPDATE#" expand="no" label="post_UPDATE">
		</cfif>
		#PrintMessage('Step[#form.step#] ends.')#

		<cfif get_2010_incomplete_billing_IDs.recordcount GT 0>
			<script type="text/javascript">
		       window.location="https://www.firsttitleservices.com#cgi.SCRIPT_NAME#?step=4B";
			</script>
		</cfif>

	</cfcase>

	<cfcase value="D3">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="delete_Company_Agency_Assoc_HUD2010">
			DELETE FROM Company_Agency_Assoc_HUD2010
			WHERE Company_ID <> 100
		</CFQUERY>
		#PrintMessage('delete_Company_Agency_Assoc_HUD2010 returned.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfcase value="D2">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="delete_company_billing_states_HUD2010">
			DELETE FROM company_billing_states_HUD2010
			WHERE Company_ID <> 100
		</CFQUERY>
		#PrintMessage('delete_company_billing_states_HUD2010 returned.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfcase value="D1">
		#PrintMessage('Step[#form.step#] begins.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="delete_Company_Billing_Values_HUD2010">
			DELETE FROM Company_Billing_Values_HUD2010
			WHERE Company_ID <> 100
		</CFQUERY>
		#PrintMessage('delete_Company_Billing_Values_HUD2010 returned.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="delete_Company_Billing_Values_B_HUD2010">
			DELETE FROM Company_Billing_Values_B_HUD2010
			WHERE Company_ID <> 100
		</CFQUERY>
		#PrintMessage('delete_Company_Billing_Values_B_HUD2010 returned.')#
		<CFQUERY DATASOURCE="#application.DS#" NAME="delete_ITEMIZED_1101_CHARGES">
			DELETE FROM ITEMIZED_1101_CHARGES
			WHERE Company_ID <> 100
		</CFQUERY>
		#PrintMessage('delete_ITEMIZED_1101_CHARGES returned.')#
		#PrintMessage('Step[#form.step#] ends.')#
	</cfcase>

	<cfdefaultcase>
		#PrintMessage('Step[#form.step#] has no associated actions.')#
	</cfdefaultcase>

</cfswitch>
	<br />
	<div class="section_title">
		Post Action Status:
	</div>
	#PrintStatus()#
	</body>
</html>
</cfoutput>