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
						VALUES('#get_user.FName#', '#get_user.LName#', #rec_ID#, 'VRM Closing Forms emailed<cfif email neq ""> to #email#</cfif>', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T')
					</CFQUERY>

<cfhttp url="http://#cgi.server_name#/disclosures/disclosure/index.cfm?rec_id=#rec_id#&mode=pdf&type=seller" method="get" resolveurl="true">


<cfdocument format="PDF" pagetype="letter" margintop="0" marginbottom="0" marginleft="0" marginright="0" filename="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\rick_tests\HUD_Spooler\huds\vrm_sellerrep_closinginstructions_#rec_id#.pdf" overwrite="yes">

<cfinclude template="../vrm_CLOSING_FORMS_client_view_PDF.cfm">

<!--- <cfhttp url="https://#cgi.server_name#/COMBINED_CLOSING_FORMS_client_view_PDF.cfm?rec_id=#rec_id#" method="get" resolveURL="true">
        </cfhttp>
         <cfoutput>#cfhttp.filecontent#</cfoutput>
 --->
</cfdocument>


<cfif Len(read_title.ip_email)><cfset email = ListAppend(email,read_title.ip_email)></cfif>



	<CFMAIL
TO="#email#"
FROM="vrm@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="ASSET ##: #read_title.reo_number#, ADDRESS: #read_title.paddress#, #read_title.pcity# #read_title.pstate#" 
TIMEOUT="600"
 type="HTML"
>
<cfmailparam file = "c:\inetpub\wwwroot\clients\firsttitleservices.com\www\rick_tests\HUD_Spooler\huds\vrm_sellerrep_closinginstructions_#rec_id#.pdf" > 

<cfmailparam file = "c:\cds\CD_#rec_id#_seller.pdf" > 

<cfmailparam file = "c:\inetpub\wwwroot\clients\firsttitleservices.com\www\rick_tests\HUD_Spooler\huds\vrmsigningauthority2.pdf" > 
<cfmailparam file = "c:\inetpub\wwwroot\clients\firsttitleservices.com\www\rick_tests\HUD_Spooler\huds\samplehud.pdf" >
<cfmailparam file = "c:\inetpub\wwwroot\clients\firsttitleservices.com\www\rick_tests\HUD_Spooler\huds\altasample.pdf" >

<cfif Len(read_title.reo_sales_contract)>
<cfmailparam file = "#fileSys.FindFilePath('#read_title.reo_sales_contract#')#">
</cfif>
Hello- 
<br><br>
First Title and Escrow is representing the Seller on the above listed transaction. Please check your Asset Information Sheet to see who your closing coordinator is at our office. We look forward to working with you for a smooth closing.
<br><br>
The following are five key points to a successful closing:
<br><br>
<i><ol start="1">

<LI><strong>NO outstanding bills</strong> are allowed to be on the HUD…this includes but is not limited to HOA, water, sewer, trash, front foot- any outstanding bills must submitted to the listing agent to resolve prior to closing. The only item that will be allowed on the HUD is a current due tax bill that do not contain any penalties or interest and it must be listed on the seller side of the HUD in the 1300 section </LI>

<LI><strong>HOA must be paid</strong> through the current month of closing with a zero balance statement provided by the HOA</LI>

<LI><strong>Any additional documents that need the seller signature</strong> must be provided with the HUD package and must contain the Seller Signature Block that matches the one on the HUD. NO additional documents can be submitted to the seller for signature after the HUD has been submitted.</LI>

<LI>Same day HUD submittals are not allowed. HUD packages for review need a minimum of 48 hours.</LI>
<!---
<LI>Please check the loan type on the approved contract and confirm with the lender, IF the loan type has been changed in any way --- notify the agents immediately --- an ammendment will be needed in order to proceed.</LI>
--->
<LI><strong>EMD confirmation is required</strong> by the seller. Your office must retain the EMD and send a copy of the wire or deposit slip that verifies you are retaining. <strong>This will cause delay in closing if not supplied properly.</strong></LI>
</OL></i>


<br><br>
<strong>If this is a cash transaction we would like to help you close as soon as possible. Please contact with any questions.</strong> 
<br><br>
PLEASE REVIEW THE HUD PREP CHECKLIST IN ITS ENTIRETY. HUDS WILL NOT BE SUBMITTED TO THE SELLER UNTIL EVERYTHING IS ACCURATE.<br> 
Thanks so much. 
<br><br>
FIRST TITLE & ESCROW, INC.<br>
VRM CLOSING TEAM <br>


</cfmail>


</cftransaction>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/vrm_CLOSING_FORMS.cfm?rec_id=#read_title.title_id#&a_trigger=2">
