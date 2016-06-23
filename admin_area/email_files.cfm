<cfparam name="a_trigger" default="0">
<cfif #email# neq "">
<cfif #a_trigger# eq 20>
<CFMAIL
TO="#email#"
FROM="titlereview@firsttitleservices.com" Subject="First Title - Title Insurance Commitment for order #rec_id#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/title_committment_view_amer_pioneer_ins_all.cfm?comp_id=115&user_id_1=723&lo_id=1217&rec_id=#rec_id#&a_trigger=1&company_id=0" target="new">American Pioneer Title Insurance Commitment</a> for order #rec_id#</B></font><br><br>

First Title staff
</cfmail>

<CFLOCATION URL="https://#cgi.server_name#/title_committment_view_amer_pioneer_ins_all.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=20&company_id=0">


<cfelseif #a_trigger# eq 21>
<CFMAIL
TO="#email#"
FROM="titlereview@firsttitleservices.com" Subject="First Title - FL American Pioneer Title Insurance Commitment for order #rec_id#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/title_committment_view_amer_pioneer_ins_fl.cfm?comp_id=115&user_id_1=723&lo_id=1217&rec_id=#rec_id#&a_trigger=1&company_id=0" target="new">FL American Pioneer Title Insurance Commitment</a> for order #rec_id#</B></font><br><br>

First Title staff
</cfmail>

<CFLOCATION URL="https://#cgi.server_name#/title_committment_view_amer_pioneer_ins_fl.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=21&company_id=0">


<cfelseif #a_trigger# eq 22>
<CFMAIL
TO="#email#"
FROM="titlereview@firsttitleservices.com" Subject="First Title - Stewart Title Insurance Commitment for order #rec_id#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/title_committment_view_stewart_title_ins.cfm?comp_id=115&user_id_1=723&lo_id=1217&rec_id=#rec_id#&a_trigger=1&company_id=0" target="new">Stewart Title Insurance Commitment</a> for order #rec_id#</B></font><br><br>

First Title staff
</cfmail>

<CFLOCATION URL="https://#cgi.server_name#/title_committment_view_stewart_title_ins.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=22&company_id=0">


<cfelseif #a_trigger# eq 23>
<CFMAIL
TO="#email#"
FROM="hudprep@firsttitleservices.com" Subject="First Title - HUD1 for order #rec_id#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/title_view_hud_pg1.cfm?comp_id=115&user_id_1=723&lo_id=1217&rec_id=#rec_id#&a_trigger=1&company_id=0" target="new">HUD1</a> for order #rec_id#</B></font><br><br>

First Title staff
</cfmail>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_view_hud_pg1.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=23&company_id=0">


</cfif>




</cfif>

