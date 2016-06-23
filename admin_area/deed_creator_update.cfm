<cfparam name="form.rec_id" type="integer">
<cfparam name="form.assessed_value">
<cfparam name="form.poa_info">
<cfparam name="form.title_insurer">
<cfparam name="form.signature">

<CFQUERY datasource="#request.dsn#" NAME="find_record">
SELECT *
FROM closing_form_mods
WHERE Title_ID = #form.rec_id#
</CFQUERY>

<cfif find_record.recordcount EQ 0>

	<CFQUERY datasource="#request.dsn#" NAME="insert_record">
		insert into closing_form_mods (assessed_value, poa_info, title_id, signature)
		values ('#form.assessed_value#', '#form.poa_info#', #form.rec_id#, '#form.signature#')
	</CFQUERY>
	
<cfelse>

	<CFQUERY datasource="#request.dsn#" NAME="update_record">
		update closing_form_mods
		set assessed_value  = '#form.assessed_value#',
		poa_info = '#form.poa_info#',
		signature = '#form.signature#'
		WHERE Title_ID = #form.rec_id#
	</CFQUERY>
	
</cfif>