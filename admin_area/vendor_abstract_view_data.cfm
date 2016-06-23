<cfparam name="Im_a_Vendor" default=0>
<cfparam name="username" default="">
<cfparam name="password" default="">

<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
    SELECT *
	FROM Doc_Title_Insurance_Title
	WHERE Title_ID = #rec_ID#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get">
    SELECT *
	FROM Title
	WHERE Title_ID = #rec_ID#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_comp">
    SELECT *
	FROM companies
	WHERE ID = #get.comp_ID#
</CFQUERY>


<cfset doj = 0>
<cfif (get.pstate eq 'CA') and (get.comp_id eq 8260 or get.comp_id eq 8487 or get.comp_id eq 8490 or get.comp_id eq 8489 or get.comp_id eq 8488)>
<cfset doj = 1>
</cfif>



<cfif get.title_id eq '130392' or get.title_id eq '130747'>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment_display_stewart_title_ins.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&IM_A_Vendor=#Im_a_Vendor#&username=#username#&password=#password#"><cfelseif get_comp.client_commitment eq 'True'>
 <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment_display_other.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&IM_A_Vendor=#Im_a_Vendor#&username=#username#&password=#password#">
<cfelseif #read_ins_committments.insurance_co# eq "15">
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment_display_amer_pioneer_ins_all.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&IM_A_Vendor=#Im_a_Vendor#&username=#username#&password=#password#">
<cfelseif #read_ins_committments.insurance_co# eq "16">
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment_display_stewart_title_ins.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&IM_A_Vendor=#Im_a_Vendor#&username=#username#&password=#password#">
<!--- <cfelseif #read_ins_committments.insurance_co# eq "17">
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment_display_ins_ut.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"> --->
<cfelseif #read_ins_committments.insurance_co# eq "14">
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment_display_amer_pioneer_ins_fl.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&IM_A_Vendor=#Im_a_Vendor#&username=#username#&password=#password#">
<cfelseif #read_ins_committments.insurance_co# eq "25">
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment_display_first_american.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&IM_A_Vendor=#Im_a_Vendor#&username=#username#&password=#password#">
<cfelseif #read_ins_committments.insurance_co# eq "30">
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment_display_north_american.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&IM_A_Vendor=#Im_a_Vendor#&username=#username#&password=#password#">
<cfelseif #read_ins_committments.insurance_co# eq "33">
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment_display_wfg_TX.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&IM_A_Vendor=#Im_a_Vendor#&username=#username#&password=#password#">
<cfelseif #read_ins_committments.insurance_co# eq "26">
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment_display_land_america.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&IM_A_Vendor=#Im_a_Vendor#&username=#username#&password=#password#">
<cfelse>
 <CFLOCATION URL="https://#cgi.server_name#/admin_area/title_committment_display_other.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&IM_A_Vendor=#Im_a_Vendor#&username=#username#&password=#password#">
</cfif>

