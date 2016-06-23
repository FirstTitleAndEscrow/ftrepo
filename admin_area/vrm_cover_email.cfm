<CFQUERY datasource="#request.dsn#" NAME="read_title">
SELECT *
FROM Title
WHERE title_ID = #rec_ID#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
SELECT *
FROM title
WHERE Title_ID = #rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="mods">
SELECT *
FROM closing_form_mods
WHERE Title_ID = #rec_id#
</CFQUERY>




<cfset to_email = email>

<CFMAIL
TO="#to_email#"
FROM="vrm@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="VRM Deed Cover Sheet"
TIMEOUT="600"
type="HTML"
>

<h2>VRM Deed Cover Sheet</h2>
<br><br>
<table  cellpadding="5" cellspacing="0" border="0">
	<tr>
		<td><b>VRM Asset ##:</b></td>
		<td>#get_titleid.reo_number#</td>
	</tr>
	<tr>
		<td><b>VRM Loan ##:</b></td>
		<td>#get_titleid.loan_number#</td>
	</tr>
	<tr>
		<td><b>Closing Vendor:</b></td>
		<td>First Title and Escrow</td>
	</tr>
	<tr>
		<td><b>Type of Deed:</b></td>
		<td>#mods.type_of_deed#</td>
	</tr>
	<tr>
		<td valign="top"><b>Property Address:</b></td>
		<td>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</td>
	</tr>
	<tr><td colspan="2"><b>State Specific (Deed) or Special Instructions<br> (i.e. deed needs overnighting directly to buyers closing vendor, please provide overnight label):</b></td></tr>
	<tr><td colspan="2">
	#mods.state_specific_deed#
	</td></tr>
	
</table>
<br>
<br>

View/Print <A HREF="https://#cgi.server_name#/vrm_cover_client_view.cfm?rec_id=#rec_id#" target="new">VRM Cover Deed</a> for order #read_title.title_id#</B></font><br><br>

</cfmail>

<CFQUERY datasource="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#ListFirst(get_titleid.pname, " ")#', '#ListLast(get_titleid.pname, " ")#', #read_title.title_id#, 'VRM Deed Cover Sheet Emailed', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>



<CFLOCATION URL="https://#cgi.server_name#/admin_area/vrm_cover.cfm?rec_id=#read_title.title_id#&a_trigger=2">
