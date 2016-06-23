<html>
<head>

</head>
<body>
<!--- <CFQUERY datasource="#request.dsn#" name="new_2">		
	Select * from Zip_Info	
</CFQUERY>

<cfoutput query="new_2">
<CFQUERY datasource="#request.dsn#" name="insert_zips">		
	Insert into Zip_info_backup
	(zip_id, city, state, zip, area_code, fips, county, a_pref, a_time_zone, dist, a_type, rate_table, pref_abstractor1, pref_abstractor2, 
                      pref_abstractor3, pref_ab1_count, pref_ab2_count, pref_ab3_count, county_tax_percentage, city_tax_percentage, rate_table_stewart, rate_table_first_american, existing, has_stewart_rates, jlp_table, stateFIPS)
	values
	(#new_2.zip_id#, '#new_2.city#', '#new_2.state#', '#new_2.zip#', '#new_2.area_code#', '#new_2.fips#', '#new_2.county#', '#new_2.a_pref#', '#new_2.a_time_zone#', '#new_2.dist#', '#new_2.a_type#', '#new_2.rate_table#', '#new_2.pref_abstractor1#', '#new_2.pref_abstractor2#', '#new_2.pref_abstractor3#', '#new_2.pref_ab1_count#', '#new_2.pref_ab2_count#', '#new_2.pref_ab3_count#', '#new_2.county_tax_percentage#', '#new_2.city_tax_percentage#', '#new_2.rate_table_stewart#', '#new_2.rate_table_first_american#', '#new_2.existing#', '#new_2.has_stewart_rates#', '#new_2.jlp_table#', '#new_2.stateFIPS#')
</CFQUERY>
.<cfflush>
</cfoutput><BR>
DONE!
<cfabort> --->




 <CFQUERY datasource="#request.dsn#" name="new_2">		
	Select * from Zip_Info_Temp
	
</CFQUERY>

<CFQUERY datasource="#request.dsn#" name="new_1">		
	Select * from Zip_Info_backup

</CFQUERY>

<cfoutput>
Zip_info_backup: #new_1.recordcount#<br>
Zip_info_temp: #new_2.recordcount#<br>
<br>

</cfoutput>
<cfabort>


<!--- <cfparam name="url.letter" default="A">
<CFSET current_letter = #url.letter#>
<cfoutput>
UPDATING LETTER: #current_letter#<br>
</cfoutput>UPDATED EXISTING RECORDS:
<cfflush>
 --->




















<!--- 
<cfset get_rows = 3000>
<cfset start_time = Now()>



<cfset unfound = "">
<CFQUERY datasource="#request.dsn#" name="uncomplete">		
	Select * from Zip_Info_Temp
	where updated = 0
</CFQUERY>
<cfoutput>Getting #get_rows# records out of #uncomplete.recordcount# unfinished records:</cfoutput> 
<cfflush>
<CFQUERY datasource="#request.dsn#" name="new_zips" maxrows="#get_rows#">		
	Select * from Zip_Info_Temp
	where updated = 0
</CFQUERY>

<cfif not new_zips.recordcount>
<br>
No more records
<cfabort>
</cfif>
 Done<br>
Updating Records: 
<cfflush>

<cfoutput query="new_zips">
<CFQUERY datasource="#request.dsn#" name="check_existing" maxrows=1>		
	Select * from Zip_info_backup
	where city = '#new_zips.city#' and zip = '#new_zips.zip#' and county = '#new_zips.county#' and state = '#new_zips.state#'
</CFQUERY>
<cfif check_existing.recordcount>
<CFQUERY datasource="#request.dsn#" name="update_zips1">		
	Update Zip_info_backup
	set city = '#new_zips.city#',
	state = '#new_zips.state#',
	zip = '#new_zips.zip#',
<!--- 	area_code = '#new_zips.area_code#',
 --->	fips = '#new_zips.fips#',
	county = '#new_zips.county#',
	a_pref = '#new_zips.a_pref#',
<!--- 	a_time_zone = '#new_zips.a_time_zone#',
	dist = '#new_zips.dist#',
 --->	a_type = '#new_zips.a_type#'
	where zip_id = '#check_existing.zip_id#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="update_zips2">		
	Update Zip_Info_Temp
	set updated = 1
	where zip_id = '#new_zips.zip_id#'
</CFQUERY>
<cfelse>
<cfset unfound = ListAppend(unfound, new_zips.zip_id, ",")>
</cfif>
</cfoutput>

DONE<br>

<cfoutput>CREATING #ListLen(unfound, ",")# RECORDS</cfoutput>
<CFFLUSH>



<cfif listlen(unfound, ",")>
<CFQUERY datasource="#request.dsn#" name="unfound_zips">		
	Select * from Zip_Info_Temp
	where zip_id IN (#unfound#)
</CFQUERY>

<cfoutput query="unfound_zips">
<CFQUERY datasource="#request.dsn#" name="insert_zips">		
	Insert into Zip_info_backup
	(city, state, zip, area_code, fips, county, a_pref, a_time_zone, dist, a_type)
	values
	('#unfound_zips.city#', '#unfound_zips.state#', '#unfound_zips.zip#', '#unfound_zips.area_code#', '#unfound_zips.fips#', '#unfound_zips.county#', '#unfound_zips.a_pref#', '#unfound_zips.a_time_zone#', '#unfound_zips.dist#', '#unfound_zips.a_type#')
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="update_zips3">		
	Update Zip_Info_Temp
	set updated = 1
	where zip_id = '#unfound_zips.zip_id#'
</CFQUERY>
inserting '#unfound_zips.city#', '#unfound_zips.state#', '#unfound_zips.zip#', '#unfound_zips.area_code#', '#unfound_zips.fips#', '#unfound_zips.county#', '#unfound_zips.a_pref#', '#unfound_zips.a_time_zone#', '#unfound_zips.dist#', '#unfound_zips.a_type#'<br>
<cfflush>
</cfoutput>
</cfif> 

<cfoutput>Added #ListLen(unfound, ",")# records</cfoutput>
 --->


<!--- <CFQUERY datasource="#request.dsn#" name="new_zips" maxrows="#get_rows#">		
	Select * from Zip_info_backup
	where existing = 0 
</CFQUERY>
DELETING OLD RECORDS: 

<cfif not new_zips.recordcount>
No more records to update<br>
<cfabort>
</cfif>

<CFQUERY datasource="#request.dsn#" name="total_left">		
	Select * from Zip_info_backup
	where existing = 0 
</CFQUERY>
<cfoutput>#total_left.recordcount# records to go<BR></cfoutput>
<CFFLUSH>

<cfoutput query="new_zips">
<CFQUERY datasource="#request.dsn#" name="check_existing" maxrows="1">		
	Select * from Zip_Info_Temp
	where city = '#new_zips.city#' and zip = '#new_zips.zip#' and state = '#new_zips.state#'
</CFQUERY>
<cfif NOT check_existing.recordcount>
<CFQUERY datasource="#request.dsn#" name="update_zips">		
	Delete from Zip_info_backup
	where zip_id = '#new_zips.zip_id#'
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" name="update_zips">		
	Update Zip_info_backup
	set existing = 1
	where zip_id = '#new_zips.zip_id#'
</CFQUERY>
</cfif>
</cfoutput>

<cfset end_time = Now()>
<cfset time_diff = DateDiff("s", start_time, End_time)>
DONE<br><br>

<cfoutput>#get_rows# Records Took: #time_diff#</cfoutput> seconds to process<br>
<cfflush>

<br>

 --->

</body>
</html>