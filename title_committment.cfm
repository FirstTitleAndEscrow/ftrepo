<CFPARAM NAME="emp" DEFAULT="0">
<CFPARAM NAME="url.pdf" DEFAULT="">
<cfif url.pdf eq 1>
<cfset url.pdf = "_pdf">
</cfif>
<CFPARAM NAME="url.calyx" DEFAULT="0">
<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
SELECT * FROM Doc_Title_Insurance_Title WHERE Title_ID = #rec_ID#
</CFQUERY>


<cfif read_ins_committments.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_committments">
insert into doc_title_insurance_title (title_id, insurance_co)
values (#rec_id#, 19)
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
SELECT * FROM Doc_Title_Insurance_Title WHERE Title_ID = #rec_ID#
</CFQUERY>
</cfif>



<CFQUERY datasource="#request.dsn#" NAME="assurance_abs">
SELECT * FROM title WHERE Title_ID = #rec_ID#
</CFQUERY>
<cfif url.pdf EQ "_pdf">
<cfif #assurance_abs.comp_id# eq "804">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_assurance_abstract#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelseif #read_ins_committments.insurance_co# eq "15">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_amer_pioneer_ins_all#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelseif #read_ins_committments.insurance_co# eq "16">
 <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_stewart_title_ins#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelseif #read_ins_committments.insurance_co# eq "25">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_first_american2#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelseif #read_ins_committments.insurance_co# eq "26">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_land_america#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelseif #read_ins_committments.insurance_co# eq "30">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_north_american#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelse>
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_stewart_title_ins#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
</cfif>

<cfelse>

<cfif #assurance_abs.comp_id# eq "804">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_assurance_abstract#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelseif #read_ins_committments.insurance_co# eq "15">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_amer_pioneer_ins_all#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelseif #read_ins_committments.insurance_co# eq "16">
 <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_stewart_title_ins#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelseif #read_ins_committments.insurance_co# eq "25">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_first_american2#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelseif #read_ins_committments.insurance_co# eq "26">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_land_america#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelseif #read_ins_committments.insurance_co# eq "30">
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_north_american#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
  <cfelse>
  <CFLOCATION URL="https://#cgi.server_name#/title_committment_view_stewart_title_ins#url.pdf#.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&calyx=#url.calyx#">
</cfif>


</cfif>


<!---  This is a change I made for Gary above. Below is the original code. Gary is going to check it change it back to this if it is not what he wants.

<CFPARAM NAME="emp" DEFAULT="0">


	<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

<cfif #read_ins_committments.insurance_co# eq "15">

<CFLOCATION URL="https://#cgi.server_name#/title_committment_view_amer_pioneer_ins_all.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">

	<cfelseif #read_ins_committments.insurance_co# eq "16">
	<CFLOCATION URL="https://#cgi.server_name#/title_committment_view_stewart_title_ins.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
<cfelse>
<CFLOCATION URL="https://#cgi.server_name#/title_committment_view_amer_pioneer_ins_fl.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
</cfif>

--->