<cftransaction>
<CFQUERY datasource="#request.dsn#" NAME="read_title">
SELECT *
FROM Title
WHERE title_ID = #rec_ID#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="mods">
			SELECT *
			FROM closing_form_mods
			WHERE Title_ID = #rec_id#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" name="get_user">
select * from First_Admin where ID = #session.ft_user_id#
</CFQUERY>


<CFQUERY datasource="#request.dsn#">
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
						VALUES('#get_user.FName#', '#get_user.LName#', #rec_ID#, 'Combined Closing Forms emailed<cfif email neq ""> to #email#</cfif>', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T')
					</CFQUERY>



<cfdocument format="PDF" pagetype="letter" margintop="0" marginbottom="0" marginleft="0" marginright="0" filename="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\rick_tests\HUD_Spooler\huds\Closing_Forms_#rec_id#.pdf" overwrite="yes">

<cfinclude template="../COMBINED_CLOSING_FORMS_client_view_PDF.cfm">

<!--- <cfhttp url="https://#cgi.server_name#/COMBINED_CLOSING_FORMS_client_view_PDF.cfm?rec_id=#rec_id#" method="get" resolveURL="true">
        </cfhttp>
         <cfoutput>#cfhttp.filecontent#</cfoutput>
 --->
</cfdocument>

<cfinvoke	component = "cfc.FileManagement"	method = "PDFcompress" file2="Closing_Forms_#rec_id#.pdf" filepath="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\rick_tests\HUD_Spooler\huds\">

<CFMAIL
TO="#read_title.p_email#"
FROM="fanniemae@streamline-title.com"
SERVER="127.0.0.1"
Subject="Streamline Title - Seller's Closing Instructions - #read_title.paddress#, #read_title.pcity#, #read_title.pstate# #read_title.pzip#"
TIMEOUT="600"
mimeattach="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\rick_tests\HUD_Spooler\huds\Closing_Forms_#rec_id#.pdf" type="html"
>

View/Print <A HREF="https://#cgi.server_name#/COMBINED_CLOSING_FORMS_client_view.cfm?rec_id=#rec_id#" target="new">CLOSING FORMS</a> for order #read_title.title_id#</B></font><br><br>

<cfif mods.title_co neq '' and mods.title_co neq 'NULL'>
Dear #mods.title_co#,
<cfelse>
Dear Title Company,
</cfif><br>
<br>
Seller's Closing Instructions for above referenced transaction located at:<BR>
#read_title.paddress#, #read_title.pcity#, #read_title.pstate# #read_title.pzip# have been attached to this email.<br>
<br>
For your convenience you may also click to <A HREF="https://#cgi.server_name#/COMBINED_CLOSING_FORMS_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a> <br>
<br>
Please contact us with any questions.<br>
<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
Streamline Title<br>
30 West Gude Drive, Suite 450,<br>
Rockville, MD 20850<BR>
<cfelse>
Streamline Title<br>
7361 Calhoun Place, Suite 200,<br>
Rockville, MD 20855<BR>
</cfif>
Phone:  (301) 315-8140<br>
Fax:  (301) 315-8153<br>
<a href="mailto:fanniemae@streamline-title.com">fanniemae@streamline-title.com</a><br>


</cfmail>


<cfif #email# neq "">
	<CFMAIL
TO="#email#"
FROM="fanniemae@streamline-title.com"
SERVER="127.0.0.1"
Subject="Streamline Title - Seller's Closing Instructions - #read_title.paddress#, #read_title.pcity#, #read_title.pstate# #read_title.pzip#"
TIMEOUT="600"
mimeattach="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\rick_tests\HUD_Spooler\huds\Closing_Forms_#rec_id#.pdf" type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/COMBINED_CLOSING_FORMS_client_view.cfm?rec_id=#rec_id#" target="new">CLOSING FORMS</a> for order #read_title.title_id#</B></font><br><br>

<cfif mods.title_co neq '' and mods.title_co neq 'NULL'>
Dear #mods.title_co#,
<cfelse>
Dear Title Company,
</cfif><br><br>

Seller's Closing Instructions for above referenced transaction located at:<BR>
#read_title.paddress#, #read_title.pcity#, #read_title.pstate# #read_title.pzip# have been attached to this email.<br>
<br>
For your convenience you may also click to <A HREF="https://#cgi.server_name#/COMBINED_CLOSING_FORMS_client_view.cfm?rec_id=#rec_id#" target="new">view/print</a> <br>
<br>
<br>
Please contact us with any questions.<br>
<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
Streamline Title<br>
30 West Gude Drive, Suite 450,<br>
Rockville, MD 20850<BR>
<cfelse>
Streamline Title<br>
7361 Calhoun Place, Suite 200,<br>
Rockville, MD 20855<BR>
</cfif>
Phone:  (301) 315-8140<br>
Fax:  (301) 315-8153<br>
<a href="mailto:fanniemae@streamline-title.com">fanniemae@streamline-title.com</a><br>
</cfmail>
</cfif>

</cftransaction>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/COMBINED_CLOSING_FORMS.cfm?rec_id=#read_title.title_id#&a_trigger=2">
