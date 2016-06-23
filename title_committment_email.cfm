<cfif url.rec_id eq 133235>
test1<br />
<cfabort>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_file">
SELECT * FROM Title WHERE Title_ID = #rec_ID#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
SELECT * FROM Doc_Title_Insurance_Title WHERE Title_ID = #rec_ID#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="assurance_abs">
SELECT comp_id FROM title WHERE Title_ID = #rec_ID#
</CFQUERY>

<cfif #assurance_abs.comp_id# eq "804">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_assurance_abstract.cfm?al=0&uid=0&comp_id=#comp_id#&rec_id=#rec_id#&a_trigger=1">
  <cfelseif #read_ins_committments.insurance_co# eq "15">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_amer_pioneer_ins_all.cfm?al=0&uid=0&comp_id=#comp_id#&rec_id=#rec_id#&a_trigger=1">
  <cfelseif #read_ins_committments.insurance_co# eq "16">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_stewart_title_ins.cfm?al=0&uid=0&comp_id=#comp_id#&rec_id=#rec_id#&a_trigger=1">
  <cfelseif #read_ins_committments.insurance_co# eq "30" and read_file.pstate eq 'TX'>
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_natic_title_ins_TX.cfm?al=0&uid=0&comp_id=#comp_id#&rec_id=#rec_id#&a_trigger=1">
  <cfelseif #read_ins_committments.insurance_co# eq "30">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_north_american.cfm?al=0&uid=0&comp_id=#comp_id#&rec_id=#rec_id#&a_trigger=1">
  <cfelseif #read_ins_committments.insurance_co# eq "33" and read_file.pstate eq 'TX'>
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_WFG_TX.cfm?al=0&uid=0&comp_id=#comp_id#&rec_id=#rec_id#&a_trigger=1">
  <cfelseif #read_ins_committments.insurance_co# eq "33">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_WFG.cfm?al=0&uid=0&comp_id=#comp_id#&rec_id=#rec_id#&a_trigger=1">
  <cfelseif #read_ins_committments.insurance_co# eq "25">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_first_american.cfm?al=0&uid=0&comp_id=#comp_id#&rec_id=#rec_id#&a_trigger=1">
  <cfelseif #read_ins_committments.insurance_co# eq "26">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_land_america.cfm?al=0&uid=0&comp_id=#comp_id#&rec_id=#rec_id#&a_trigger=1">
  <cfelse>
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_amer_pioneer_ins_fl.cfm?al=0&uid=0&comp_id=#comp_id#&rec_id=#rec_id#&a_trigger=1">
</cfif>
