<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
SELECT * 
FROM Doc_Title_Insurance_Title 
WHERE Title_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="assurance_abs">
SELECT *
FROM title
WHERE Title_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_streamline">
SELECT streamline_client
FROM companies
WHERE ID = #assurance_abs.comp_ID#
</CFQUERY>

<cfif #assurance_abs.comp_id# eq "804">
  <CFLOCATION URL="../title_committment_view_assurance_abstract.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
  <cfelseif #read_ins_committments.insurance_co# eq "15">
  <CFLOCATION URL="../title_committment_view_amer_pioneer_ins_all.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
  <cfelseif #read_ins_committments.insurance_co# eq "16">
  <CFLOCATION URL="../title_committment_view_stewart_title_ins.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
  <cfelseif #read_ins_committments.insurance_co# eq "17">
  <CFLOCATION URL="../title_committment_view_ins_ut.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
  <cfelseif #read_ins_committments.insurance_co# eq "25">
	<cfif ListFindNoCase("TN,CO,MI",assurance_abs.pstate) and get_streamline.streamline_client eq 'True'>
		<CFLOCATION URL="../title_committment_view_fa_TNCO.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
	<cfelse>
  		<CFLOCATION URL="../title_committment_view_first_american2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
  	</cfif>
  <cfelseif #read_ins_committments.insurance_co# eq "26">
  <CFLOCATION URL="../title_committment_view_land_america.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
 <cfelseif #read_ins_committments.insurance_co# eq "30" and assurance_abs.pstate eq 'TX'>
  <CFLOCATION URL="../title_committment_view_natic_title_ins_tx.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
 <cfelseif #read_ins_committments.insurance_co# eq "30">
  <CFLOCATION URL="../title_committment_view_north_american.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
 <cfelseif #read_ins_committments.insurance_co# eq "33" and assurance_abs.pstate eq 'TX'>
  <CFLOCATION URL="../title_committment_view_wfg_tx.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
 <cfelseif #read_ins_committments.insurance_co# eq "33">
  <CFLOCATION URL="../title_committment_view_wfg.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">

  <cfelse>
  <CFLOCATION URL="../title_committment_view_stewart_title_ins.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
</cfif>
