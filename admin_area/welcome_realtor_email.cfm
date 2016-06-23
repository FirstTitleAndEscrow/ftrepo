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



<cfif #email# neq "">
<cfset to_email = email>
<cfif get_titleid.pstate eq 'MD'>
<cfset to_email = to_email>
</cfif>
<CFMAIL
TO="#to_email#"
FROM="#get_titleid.p_email#"
SERVER="127.0.0.1"
Subject="Streamline - Welcome Realtor"
TIMEOUT="600"
type="HTML"
>

<table width="500" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
<table>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<tr>
<td align="left" valign="top" width="450"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/streamline_logo.jpg"></td>
<td align="left" valign="top" width="200"><br>
<br>
30 West Gude Drive, Suite 450<BR>
Rockville, MD 20850<BR>
301-315-8140 phone<BR>
</td>
</tr>
<cfelse>
<tr>
<td align="left" valign="top" width="450"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/streamline_logo.jpg"></td>
<td align="left" valign="top" width="200"><br>
<br>
7361 Calhoun Place, Suite 200<BR>
Rockville, MD 20855<BR>
301-315-8140 phone<BR>
</td>
</tr>
</cfif>
</table>

<br>
<div align="right">
<cfoutput><cfif mods.recordcount and IsDate(mods.welcome_create_date)>#DateFormat(mods.welcome_create_date, 'long')#</cfif></cfoutput>
</div><br>

Realtor name <cfoutput><cfif mods.recordcount and mods.realtor neq ''>#mods.realtor#</cfif></cfoutput> <br>
<br>


Via Email: <cfoutput><cfif mods.recordcount and mods.realtor_email neq ''>#mods.realtor_email#</cfif></cfoutput> <br>
<br>


	Re: Upcoming Closing on <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><br>
	Buyer Name(s): <cfoutput><cfif get_titleid.company1 neq '' and get_titleid.company1 neq 'NULL'>#get_titleid.company1#<cfelse><cfif get_titleid.bfirstname1 neq '' and get_titleid.bfirstname1 neq 'NULL'>#get_titleid.bfirstname1#</cfif> <cfif get_titleid.bminame1 neq '' and get_titleid.bminame1 neq 'NULL'>#get_titleid.bminame1#.</cfif> <cfif get_titleid.blastname1 neq '' and get_titleid.blastname1 neq 'NULL'>#get_titleid.blastname1#</cfif><cfif get_titleid.bfirstname2 neq '' and get_titleid.bfirstname2 neq 'NULL'> and #get_titleid.bfirstname2#</cfif> <cfif get_titleid.bminame2 neq '' and get_titleid.bminame2 neq 'NULL'>#get_titleid.bminame2#.</cfif> <cfif get_titleid.blastname2 neq '' and get_titleid.blastname2 neq 'NULL'>#get_titleid.blastname2#</cfif> <cfif get_titleid.bfirstname3 neq '' and get_titleid.bfirstname3 neq 'NULL'> and #get_titleid.bfirstname3#</cfif> <cfif get_titleid.bminame3 neq '' and get_titleid.bminame3 neq 'NULL'>#get_titleid.bminame3#.</cfif> <cfif get_titleid.blastname3 neq '' and get_titleid.blastname3 neq 'NULL'>#get_titleid.blastname3#</cfif><cfif get_titleid.bfirstname4 neq '' and get_titleid.bfirstname4 neq 'NULL'> and #get_titleid.bfirstname4#</cfif> <cfif get_titleid.bminame4 neq '' and get_titleid.bminame4 neq 'NULL'>#get_titleid.bminame4#.</cfif> <cfif get_titleid.blastname4 neq '' and get_titleid.blastname4 neq 'NULL'>#get_titleid.blastname4#</cfif></cfif></cfoutput><br>
<br>


Dear <cfoutput><cfif mods.recordcount and mods.realtor_fname neq ''>#mods.realtor_fname#</cfif></cfoutput>:  <br>
<br>


Welcome to Streamline Title! Thank you so much for entrusting your transaction to our company. We look forward to being of service to you and your buyer(s). <BR><BR>

We have received your contract, and look forward to seeing you and your client at closing. Our closing coordinator will contact you to confirm both a time and location preference for closing.   We automatically schedule according to the terms of the contract, however, if you need to move the date up please let us know by contacting Juanita at jartis@streamline-title.com.  <BR><BR>

Please send the following to the Processing Assistant listed below prior to closing to assist us in smooth transactions.
HOA information – Rekey invoices – Home Warranty Information
Water and utilities bills should be brought current prior to settlement so we can record our deed immediately after closing.  Please forward all paid receipts to prevent delays. <BR><BR>

At any time during the process please feel free to reach out to your team. We look forward to working with on this transaction and many more in the future.   <BR><BR>

Very truly yours,  <BR><BR>

<table>
<tr>
<td width=225 align="left" valign="top"><cfoutput>#get_titleid.pname#<br>
Settlement Processor<br>
#get_titleid.p_email#<br>
</cfoutput></td>
<td width=225 align="left" valign="top"><cfoutput>Processing Assistant<br>
Melissa Niosi<br>
mniosi@streamline-title.com<br>
</cfoutput></td>
<td width=225 align="left" valign="top"><cfoutput>Closing Coordinator<br>
Juanita Artis<br>
jartis@streamline-title.com<br>
</cfoutput></td>
</tr>
</table><br>
<br>
<i>You may immediately escalate any issues you have to Heidi Kelly – hkelly@streamline-title.com – mobile 301-602-8777; or Pamela Gibbons – pgibb@streamline-title.com – mobile – 301-922-9690 anytime.</i>
</td>
	</tr>
</table>
<br>
<br>

View/Print <A HREF="https://#cgi.server_name#/welcome_realtor_client_view.cfm?rec_id=#rec_id#" target="new">Realtor Welcome Document</a> for order #read_title.title_id#</B></font><br><br>
</cfmail>

<CFQUERY datasource="#request.dsn#" name="write_note">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#ListFirst(get_titleid.pname, " ")#', '#ListLast(get_titleid.pname, " ")#', #read_title.title_id#, 'Welcome Letter Emailed to Realtor', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>


</cfif>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/welcome_realtor.cfm?rec_id=#read_title.title_id#&a_trigger=2">
