<cfcomponent>
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset our_ft_vendor_id = 35221>
<!---'35250'  - QA number- 
'35221' - production Number --->

<!--- URL we post to when posting to Equator --->

<cfset title_posting_url = "https://servicemart.equator.com/VendorIntegrationInbound-VendorOrderWS/FnmaTitleVendorOrderWS?wsdl">
<cfset closing_posting_url = "https://servicemart.equator.com/VendorIntegrationInbound-VendorOrderWS/FnmaClosingVendorOrderWS?wsdl">

<cfset catch_url = "http://www.streamline-title.com/equator/catch_outgoing.cfm">
<!--- Our credentials for posting to Equator Streamline --->
<cfset our_equator_st_username = "fanniemae@streamline-title.com">
<cfset our_equator_st_password = "Stream123">


<!--- Our credentials for posting to Equator First Title --->
<cfset our_equator_ft_username = "fanniemae1@firsttitleservices.com">
<cfset our_equator_ft_password = "First123">


<!--- Equator's credentials for posting to us --->
<cfset equator_username = "Equator">
<cfset equator_password = "EquatorPass">

<!--- <cfset company_id =  1754><!--- TEST ACCOUNT --->
<cfset lo_id =  6295> <!--- Rick jermain --->
<cfset lp_id =  4614> <!--- Rick jermain --->
<cfset team_id =  11> <!--- Inactive/TestAccounts --->
 --->


<!--- use these when we go live --->
<!--- Streamline --->

<cfset st_company_id =  3568><!--- Fannie Mae - Sharpiro & Burson --->
<cfset lo_id =  56> <!--- Pam --->
<cfset lp_id =  56> <!--- Pam --->
<cfset st_team_id =  46> <!--- Team Equator --->

<!--- use these when we go live --->
<!--- First Title --->

<cfset ft_company_id =  12324><!--- Fannie Mae National --->
<cfset lo_id =  56> <!--- Pam --->
<cfset lp_id =  56> <!--- Pam --->
<cfset ft_team_id =  97> <!--- Fannie Mae --->


<cfset st_team_email =  'TeamEquator@streamline-title.com'> <!--- Inactive/TestAccounts --->
<cfset ft_team_email =  'FannieMae1@firsttitleservices.com.com'>  <!--- Inactive/TestAccounts --->




<cfset title_xml_opener = '<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:web="http://webservice.servicemart.equator.com/">
   <soapenv:Header/>
   <soapenv:Body>
      <web:updateFnmaTitleOrder>
	  '>


<cfset title_xml_closer = '</web:updateFnmaTitleOrder>
   </soapenv:Body>
</soapenv:Envelope>'>

<cfset closing_xml_opener = '<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:web="http://webservice.servicemart.equator.com/">
   <soapenv:Header/>
   <soapenv:Body>
      <web:updateFnmaClosingOrder>
	  '>


<cfset closing_xml_closer = '</web:updateFnmaClosingOrder>
   </soapenv:Body>
</soapenv:Envelope>'>


<cffunction name="setupVariables" output="true">
	<cfargument name="titleid" required="false">
	<cfargument name="transactionId" required="false">


<cfif IsDefined("arguments.titleid")>
      <CFQUERY datasource="#request.dsn#" NAME="is_first_title">
          select comp_id from title where title_id = '#arguments.titleid#'
      </CFQUERY>
<cfelseif IsDefined("arguments.transactionId")>

      <CFQUERY datasource="#request.dsn#" NAME="is_first_title">
          select comp_id from title where (equator_title_transactionID = '#arguments.transactionId#') or (equator_closing_transactionID = '#arguments.transactionId#')
      </CFQUERY>
      
      
      <cfif is_first_title.recordcount eq 0>
      <CFQUERY datasource="#request.dsn#" NAME="is_first_title">
          select vendorID as comp_id from equator_temp_orders where (transactionID = '#arguments.transactionId#')
      </CFQUERY>
      </cfif>

</cfif>



<cfif is_first_title.comp_id eq our_ft_vendor_id or is_first_title.comp_id eq ft_company_id>

<cfset use_team_email = ft_team_email>
<cfset use_company_id = ft_company_id>
<cfset use_prefix = 'FT'>
<cfset use_Email = 'EquatorIntegration@firsttitleservices.com'>
<cfset our_equator_username = our_equator_ft_username>
<cfset our_equator_password = our_equator_ft_password>
<!---<cfset title_posting_url = "https://servicemartrem.equator.com/VendorIntegrationInbound-VendorOrderWS/FnmaTitleVendorOrderWS?wsdl">
<cfset closing_posting_url = "https://servicemartrem.equator.com/VendorIntegrationInbound-VendorOrderWS/FnmaClosingVendorOrderWS?wsdl">
   use this version for QA --->

<cfelse>

<cfset use_team_email = st_team_email>
<cfset use_company_id = st_company_id>
<cfset use_prefix = 'ST'>
<cfset use_Email = 'EquatorIntegration@streamline-title.com'>
<cfset our_equator_username = our_equator_st_username>
<cfset our_equator_password = our_equator_st_password>
<!---<cfset title_posting_url = "https://servicemartrem.equator.com/VendorIntegrationInbound-VendorOrderWS/FnmaTitleVendorOrderWS?wsdl">
<cfset closing_posting_url = "https://servicemartrem.equator.com/VendorIntegrationInbound-VendorOrderWS/FnmaClosingVendorOrderWS?wsdl">
   use this version for QA --->
</cfif>
</cffunction>


<cffunction name="sendEmailNotification" output="true">
	<cfargument name="message" required="true">
	<cfargument name="title_id" required="true">
	<cfargument name="subject" required="true">

<cfset temp = setupVariables(titleId=arguments.title_id)>

<cfmail to="#use_team_email#" bcc="rjermain@firsttitleservices.com" from="#use_Email#" subject="#use_prefix#-#arguments.title_id#: #arguments.subject#" type="html">
<h3><font color="0099FF" face="Arial, Helvetica, sans-serif">Message from Equator Integration</font></h2><br>
<br>
<font color="333333" face="Arial, Helvetica, sans-serif">#use_prefix#-#arguments.title_id#: #arguments.message#</font><br>
<br>
<font color="999999">This message was generated automatically, please do not reply to it.</font>
</cfmail>

</cffunction>










<cffunction name="sendSuccess" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="posted_xml_filename" required="true">
<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::SUCCESSFUL::. Posted XML file #arguments.posted_xml_filename#">
<CFCONTENT 
  TYPE="text/xml" 
  RESET="Yes"><CFOUTPUT><?xml version="1.0" encoding="UTF-8"?>
<Message id="#CreateUUID()#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<TransmissionStatus>SUCCESS</TransmissionStatus>
	</Header>
</Message></CFOUTPUT>
</cffunction>






<cffunction name="sendFailure" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="posted_xml_filename" required="true">
<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::ERROR::. Posted XML file #arguments.posted_xml_filename# '#arguments.message#'">
<CFCONTENT 
  TYPE="text/xml" 
  RESET="Yes"><CFOUTPUT><?xml version="1.0" encoding="UTF-8"?>
<Message id="#createUUID()#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<TransmissionStatus>ERROR</TransmissionStatus>
		<ErrorTypeCode>#arguments.condition#</ErrorTypeCode>
		<Description>#arguments.message#</Description>
	</Header>
</Message></CFOUTPUT>
<cfabort>
</cffunction>



<cffunction name="checkCredentials" output="true">
	<cfargument name="sent_username" required="true">
	<cfargument name="sent_password" required="true">
	<cfargument name="posted_xml_filename" required="true">
    
<cfset first_title_equator_username = 'FirstEquator'>
<cfset first_title_equator_password = 'FirstEQ9639'>
<cfset streamline_equator_username = 'Equator'>
<cfset streamline_equator_password = 'EquatorPass'>
<cfset allow_login = 0>

<cfif (arguments.sent_username eq first_title_equator_username and arguments.sent_password eq first_title_equator_password) or (arguments.sent_username eq streamline_equator_username and arguments.sent_password eq streamline_equator_password)>
<cfset allow_login = 1>
</cfif>

<cfif allow_login eq 0>

<cfinvoke	component = "cfc.equator"	method = "sendFailure" message="Post Failed" posted_xml_filename="#arguments.posted_xml_filename#" condition="Fail">
</cfif>
</cffunction>



<cffunction name="sendAccept" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="posted_xml_filename" required="true">
	<cfargument name="transactionId" required="false">
    
<cfset temp = setupVariables(transactionId=arguments.transactionId)>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::ORDER ACCEPTED::. Posted XML file #arguments.posted_xml_filename# '#arguments.message#'">

<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#arguments.transactionID#">
			<AcceptReject id="#CreateUUID()#">
				<AcceptReject>ACCEPT</AcceptReject>
			</AcceptReject>
		</Order>
	</Body>
</Message>
'>
    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

</cffunction>




<cffunction name="sendReject" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="posted_xml_filename" required="true">
	<cfargument name="transactionID" required="true">

<cfset temp = setupVariables(transactionId=arguments.transactionId)>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::ORDER REJECTED::. Posted XML file #arguments.posted_xml_filename# '#arguments.message#'">
<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#arguments.transactionID#">
			<AcceptReject id="#CreateUUID()#">
				<AcceptReject>REJECT</AcceptReject>
				<IfRejectWhy>#arguments.message#</IfRejectWhy>
			</AcceptReject>
		</Order>
	</Body>
</Message>'>
    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">


<cfabort>
</cffunction>








<!---<cffunction name="sendTitleGrade" output="true">
<cfargument name="transactionID" required="true">

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where equator_title_transactionID = '#arguments.transactionID#'
		</CFQUERY>

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_transaction.title_grade_document#', 'file')#" variable="M1">
<cfset base64_file = ToBase64(m1)>
<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::TITLE GRADE SENT::. Equator_Title_TractionID '#arguments.transactionID#'">
<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#arguments.transactionID#">
			
		<SupplyTitleAndGrade>
				<REOTitleGrade>#lookup_transaction.title_grade#</REOTitleGrade>
				<TitleDocument name="#lookup_transaction.title_grade_document#" type="PDF" description="Title Grade" id="#CreateUUID()#">
					<Checksum></Checksum>
					<Payload>#base64_file#</Payload>
				</TitleDocument>
			</SupplyTitleAndGrade>				
		</Order>
	</Body>
</Message>'>
    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">
</cffunction>--->



<cffunction name="sendTitleGrade" output="true">
<cfargument name="transactionID" required="true">
<cfset temp = setupVariables(transactionId=arguments.transactionId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where equator_title_transactionID = '#arguments.transactionID#'
		</CFQUERY>

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_transaction.title_grade_document#', 'file')#" variable="M1">
<cfset base64_file = ToBase64(m1)>
<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::TITLE GRADE SENT::. Equator_Title_TractionID '#arguments.transactionID#'">
<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#arguments.transactionID#">
			
		<SupplyTitleAndGradeFM>
				<REOTitleGrade>#lookup_transaction.title_grade#</REOTitleGrade>
				<TitleDocument name="#lookup_transaction.title_grade_document#" type="PDF" description="Title Grade" id="#CreateUUID()#">
					<Checksum></Checksum>
					<Payload>#base64_file#</Payload>
				</TitleDocument>
                     <ParcelNumber>#lookup_transaction.parcel#</ParcelNumber>
                     <LotNumber>#lookup_transaction.lot#</LotNumber>
			</SupplyTitleAndGradeFM>				
		</Order>
	</Body>
</Message>'>
    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>



<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

</cffunction>

  
  
  
<cffunction name="sendPackageReceived" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="transactionID" required="true">
	<cfargument name="fname">
	<cfargument name="lname">
<cfset temp = setupVariables(transactionId=arguments.transactionId)>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::SENT CONTRACT RECEIVED NOTICE::.  '#arguments.message#' : #arguments.condition# : transID: #arguments.transactionID#">

<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#arguments.transactionID#">
			<ReceiveContractPackage>
				<Comments>#arguments.message#</Comments>
			</ReceiveContractPackage>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

</cffunction>  
  
  
  
  
<cffunction name="sendPackageAmendmentReceived" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="transactionID" required="true">
	<cfargument name="fname">
	<cfargument name="lname">
<cfset temp = setupVariables(transactionId=arguments.transactionId)>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::SENT CONTRACT AMENDMENT RECEIVED NOTICE::.  '#arguments.message#' : #arguments.condition# : transID: #arguments.transactionID#">

<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#arguments.transactionID#">
			<ReceiveContractAmendment>
				<Comments>#arguments.message#</Comments>
			</ReceiveContractAmendment>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

</cffunction>  
  

<cffunction name="sendDeedAndHud" output="true">
<cfargument name="titleID" required="true">
	<cfargument name="fname">
	<cfargument name="lname">
<cfset temp = setupVariables(titleid=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_hud_data">
			SELECT *
			FROM HUD2010_TITLE_DATA
			WHERE Title_ID = #arguments.titleID#
</cfquery>		

<CFQUERY datasource="#request.dsn#" NAME="get_hud_data_b">
			SELECT *
			FROM HUD2010_TITLE_DATA_B
			WHERE Title_ID = #arguments.titleID#
</cfquery>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::DEED AND EST HUD SENT::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_transaction.deed_prep_vendor_upload#', 'file')#" variable="M1">
<cfset base64_deed = ToBase64(m1)>


<cfhttp url="http://machine1.firsttitleservices.com/HUD1_2010_PDF.cfm?rec_id=#arguments.titleID#&bypass=1" method="get" resolveURL="true">
</cfhttp>
        <cfdocument format="PDF" pagetype="custom" pageheight="14" pagewidth="8.5" margintop=".25" marginbottom=".25" marginleft=".25" marginright=".25" filename="c:\huds\HUD_#arguments.titleID#.pdf" overwrite="yes"> <cfoutput>#cfhttp.filecontent#</cfoutput> </cfdocument>

<cffile action="READBINARY" file="c:\huds\HUD_#arguments.titleID#.pdf" variable="M2">
<cfset base64_hud = ToBase64(m2)>



<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
		<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_closing_transactionID#">
			<SupplyEstimatedHUDAndDeed>
				<EstimatedHUD name="HUD_#arguments.titleID#.pdf" type="PDF">
					<Checksum></Checksum>
					<Payload>#base64_hud#</Payload>
				</EstimatedHUD>
				<Deed name="#lookup_transaction.deed_prep_vendor_upload#" type="DOC">
					<Checksum>0</Checksum>
					<Payload>#base64_deed#</Payload>
				</Deed>
				<SettlementDate>2012-12-01</SettlementDate>
				<DisbursementDate>2012-12-01</DisbursementDate>
<!-- 				<SellerPaidBuyerExpenses></SellerPaidBuyerExpenses>
				<HUDForm>
					<SummaryOfSellerTransaction>
						<GrossAmountDueToSeller>
							<Line401ContractSalesPriceBCC></Line401ContractSalesPriceBCC>
							<Line402PersonalProperty></Line402PersonalProperty>
							<Line402PersonalPropertyBCC></Line402PersonalPropertyBCC>
							<Line403RentsFrom></Line403RentsFrom>
							<Line403RentsTo></Line403RentsTo>
							<Line403Rents></Line403Rents>
							<Line403RentsBCC></Line403RentsBCC>
							<Line404Desc></Line404Desc>
							<Line404></Line404>
							<Line404BCC></Line404BCC>
							<Line405Desc></Line405Desc>
							<Line405></Line405>
							<Line405BCC></Line405BCC>
							<Line406CityTownTaxesFrom></Line406CityTownTaxesFrom>
							<Line406CityTownTaxesTo></Line406CityTownTaxesTo>
							<Line406CityTownTaxes></Line406CityTownTaxes>
							<Line406CityTownTaxesBCC></Line406CityTownTaxesBCC>
							<Line407CountyTaxesFrom></Line407CountyTaxesFrom>
							<Line407CountyTaxesTo></Line407CountyTaxesTo>
							<Line407CountyTaxes></Line407CountyTaxes>
							<Line407CountyTaxesBCC></Line407CountyTaxesBCC>
							<Line408HOADuesFrom></Line408HOADuesFrom>
							<Line408HOADuesTo></Line408HOADuesTo>
							<Line408HOADues></Line408HOADues>
							<Line408HOADuesBCC></Line408HOADuesBCC>
							<Line409HOADuesFrom></Line409HOADuesFrom>
							<Line409HOADuesTo></Line409HOADuesTo>
							<Line409HOADues></Line409HOADues>
							<Line409HOADuesBCC></Line409HOADuesBCC>
							<Line410AssessmentsFrom></Line410AssessmentsFrom>
							<Line410AssessmentsTo></Line410AssessmentsTo>
							<Line410Assessments></Line410Assessments>
							<Line410AssessmentsBCC></Line410AssessmentsBCC>
							<Line411OfferPerDiemBCC></Line411OfferPerDiemBCC>
							<Line412Desc></Line412Desc>
							<Line412></Line412>
							<Line412BCC></Line412BCC>
							<Line413Desc></Line413Desc>
							<Line413></Line413>
							<Line413BCC></Line413BCC>
							<Line414Desc></Line414Desc>
							<Line414></Line414>
							<Line414BCC></Line414BCC>
							<Line415Desc></Line415Desc>
							<Line415></Line415>
							<Line415BCC></Line415BCC>
							<Line416Desc></Line416Desc>
							<Line416></Line416>
							<Line416BCC></Line416BCC>
							<Line417Desc></Line417Desc>
							<Line417></Line417>
							<Line417BCC></Line417BCC>
							<Line418Desc></Line418Desc>
							<Line418></Line418>
							<Line418BCC></Line418BCC>
						</GrossAmountDueToSeller>
						<ReductionInAmountDueToSeller>
							<Line501Amount></Line501Amount>
							<Line501AmountBCC></Line501AmountBCC>
							<Line502SettlementChargesToSellerBCC></Line502SettlementChargesToSellerBCC>
							<Line503ExistingLoanTakenSubjectToDesc></Line503ExistingLoanTakenSubjectToDesc>
							<Line503ExistingLoanTakenSubjectTo></Line503ExistingLoanTakenSubjectTo>
							<Line503ExistingLoanTakenSubjectToBCC></Line503ExistingLoanTakenSubjectToBCC>
							<Line504PayoffOfFirstMortgageLoan></Line504PayoffOfFirstMortgageLoan>
							<Line504PayoffOfFirstMortgageLoanBCC></Line504PayoffOfFirstMortgageLoanBCC>
							<Line505PayoffOfSecondMortgageLoan></Line505PayoffOfSecondMortgageLoan>
							<Line505PayoffOfSecondMortgageLoanBCC></Line505PayoffOfSecondMortgageLoanBCC>
							<Line506Desc></Line506Desc>
							<Line506></Line506>
							<Line506BCC></Line506BCC>
							<Line507></Line507>
							<Line507Desc></Line507Desc>
							<Line507BCC></Line507BCC>
							<Line508></Line508>
							<Line508Desc></Line508Desc>
							<Line508BCC></Line508BCC>
							<Line509></Line509>
							<Line509Desc></Line509Desc>
							<Line509BCC></Line509BCC>
							<Line510CityTownTaxesFromDate></Line510CityTownTaxesFromDate>
							<Line510CityTownTaxesToDate></Line510CityTownTaxesToDate>
							<Line510CityTownTaxes></Line510CityTownTaxes>
							<Line510CityTownTaxesBCC></Line510CityTownTaxesBCC>
							<Line511CountyTaxesFromDate></Line511CountyTaxesFromDate>
							<Line511CountyTaxesToDate></Line511CountyTaxesToDate>
							<Line511CountyTaxes></Line511CountyTaxes>
							<Line511CountyTaxesBCC></Line511CountyTaxesBCC>
							<Line512SchoolTaxesFromDate></Line512SchoolTaxesFromDate>
							<Line512SchoolTaxesToDate></Line512SchoolTaxesToDate>
							<Line512SchoolTaxes></Line512SchoolTaxes>
							<Line512SchoolTaxesBCC></Line512SchoolTaxesBCC>
							<Line513Desc></Line513Desc>
							<Line513></Line513>
							<Line513BCC></Line513BCC>
	<Line514DelinquentTaxes>123.12</Line514DelinquentTaxes>						<Line514DelinquentTaxesBCC></Line514DelinquentTaxesBCC>
							<Line515SpecialAssessmentsFromDate></Line515SpecialAssessmentsFromDate>
							<Line515SpecialAssessmentsToDate></Line515SpecialAssessmentsToDate>
							<Line515SpecialAssessments></Line515SpecialAssessments>
							<Line515SpecialAssessmentsBCC></Line515SpecialAssessmentsBCC>
							<Line516DelinquentSpecialAssessmentsFromDate></Line516DelinquentSpecialAssessmentsFromDate>
							<Line516DelinquentSpecialAssessmentsToDate></Line516DelinquentSpecialAssessmentsToDate>
							<Line516DelinquentSpecialAssessments></Line516DelinquentSpecialAssessments>
							<Line516DelinquentSpecialAssessmentsBCC></Line516DelinquentSpecialAssessmentsBCC>
							<Line517HOADuesFromDate></Line517HOADuesFromDate>
							<Line517HOADuesToDate></Line517HOADuesToDate>
							<Line517HOADues></Line517HOADues>
							<Line517HOADuesBCC></Line517HOADuesBCC>
	<Line518TotalDelinquentHOA>6465.12</Line518TotalDelinquentHOA>						<Line518TotalDelinquentHOABCC></Line518TotalDelinquentHOABCC>
							<Line519Desc></Line519Desc>
							<Line519></Line519>
							<Line519BCC></Line519BCC>
						</ReductionInAmountDueToSeller>
					</SummaryOfSellerTransaction>
					<SettlementCharges>
						<TotalCommission>
							<Line704ListingAgentBonus></Line704ListingAgentBonus>
							<Line705SellingAgentBonus></Line705SellingAgentBonus>
							<Line706Desc></Line706Desc>
							<Line706></Line706>
							<Line707Desc></Line707Desc>
							<Line707></Line707>
						</TotalCommission>
						<ItemsPayableInConnectionWithLoan>
							<Line801LoanOriginationFee></Line801LoanOriginationFee>
							<Line801LoanOriginationFeeBCC></Line801LoanOriginationFeeBCC>
							<Line802LoanDiscount></Line802LoanDiscount>
							<Line802LoanDiscountBCC></Line802LoanDiscountBCC>
							<Line803AppraisalFee></Line803AppraisalFee>
							<Line803AppraisalFeeBCC></Line803AppraisalFeeBCC>
							<Line804CreditReport></Line804CreditReport>
							<Line804CreditReportBCC></Line804CreditReportBCC>
							<Line805Desc></Line805Desc>
							<Line805></Line805>
							<Line805BCC></Line805BCC>
							<Line806Desc></Line806Desc>
							<Line806></Line806>
							<Line806BCC></Line806BCC>
							<Line807Desc></Line807Desc>
							<Line807></Line807>
							<Line807BCC></Line807BCC>
							<Line808Desc></Line808Desc>
							<Line808></Line808>
							<Line808BCC></Line808BCC>
							<Line809Desc></Line809Desc>
							<Line809></Line809>
							<Line809BCC></Line809BCC>
							<Line810Desc></Line810Desc>
							<Line810></Line810>
							<Line810BCC></Line810BCC>
							<Line811Desc></Line811Desc>
							<Line811></Line811>
							<Line811BCC></Line811BCC>
						</ItemsPayableInConnectionWithLoan>
						<ItemsRequiredByLenderPaidInAdvance>
							<Line901Interest></Line901Interest>
							<Line901InterestBCC></Line901InterestBCC>
							<Line902MortgageInsurancePremium></Line902MortgageInsurancePremium>
							<Line902MortgageInsurancePremiumBCC></Line902MortgageInsurancePremiumBCC>
							<Line903HazardInsurance></Line903HazardInsurance>
							<Line903HazardInsuranceBCC></Line903HazardInsuranceBCC>
							<Line904Desc></Line904Desc>
							<Line904></Line904>
							<Line904BCC></Line904BCC>
							<Line905Desc></Line905Desc>
							<Line905></Line905>
							<Line905BCC></Line905BCC>
						</ItemsRequiredByLenderPaidInAdvance>
						<ReservesDepositedWithLender>
							<Line1001HazardInsurance></Line1001HazardInsurance>
							<Line1001HazardInsuranceBCC></Line1001HazardInsuranceBCC>
							<Line1002MortgageInsurance></Line1002MortgageInsurance>
							<Line1002MortgageInsuranceBCC></Line1002MortgageInsuranceBCC>
							<Line1003CityPropertyTaxes></Line1003CityPropertyTaxes>
							<Line1003CityPropertyTaxesBCC></Line1003CityPropertyTaxesBCC>
							<Line1004CountyPropertyTaxes></Line1004CountyPropertyTaxes>
							<Line1004CountyPropertyTaxesBCC></Line1004CountyPropertyTaxesBCC>
							<Line1005AnnualAssessments></Line1005AnnualAssessments>
							<Line1005AnnualAssessmentsBCC></Line1005AnnualAssessmentsBCC>
							<Line1006Desc></Line1006Desc>
							<Line1006></Line1006>
							<Line1006BCC></Line1006BCC>
							<Line1007Desc></Line1007Desc>
							<Line1007></Line1007>
							<Line1007BCC></Line1007BCC>
							<Line1008Desc></Line1008Desc>
							<Line1008></Line1008>
							<Line1008BCC></Line1008BCC>
							<Line1011AggregateAdjustment></Line1011AggregateAdjustment>
							<Line1011AggregateAdjustmentBCC></Line1011AggregateAdjustmentBCC>
						</ReservesDepositedWithLender>
						<TitleCharges>
							<Line1101SettlementFeePaymentTo></Line1101SettlementFeePaymentTo>
							<Line1101SettlementFee></Line1101SettlementFee>
							<Line1101SettlementFeeBCC></Line1101SettlementFeeBCC>
							<Line1102AbstractToPaymentTo></Line1102AbstractToPaymentTo>
							<Line1102AbstractTo></Line1102AbstractTo>
							<Line1102AbstractToBCC></Line1102AbstractToBCC>
							<Line1103TitleExaminationToPaymentTo></Line1103TitleExaminationToPaymentTo>
							<Line1103TitleExaminationTo></Line1103TitleExaminationTo>
							<Line1103TitleExaminationToBCC></Line1103TitleExaminationToBCC>
							<Line1104TitleInsuranceBinderToPaymentTo></Line1104TitleInsuranceBinderToPaymentTo>
							<Line1104TitleInsuranceBinderTo></Line1104TitleInsuranceBinderTo>
							<Line1104TitleInsuranceBinderToBCC></Line1104TitleInsuranceBinderToBCC>
							<Line1105DocumentPreparationToPaymentTo></Line1105DocumentPreparationToPaymentTo>
							<Line1105DocumentPreparationTo></Line1105DocumentPreparationTo>
							<Line1105DocumentPreparationToBCC></Line1105DocumentPreparationToBCC>
							<Line1106NotaryFeesToPaymentTo></Line1106NotaryFeesToPaymentTo>
							<Line1106NotaryFeesTo></Line1106NotaryFeesTo>
							<Line1106NotaryFeesToBCC></Line1106NotaryFeesToBCC>
							<Line1107AttorneyFeesToPaymentTo></Line1107AttorneyFeesToPaymentTo>
							<Line1107AttorneyFeesTo></Line1107AttorneyFeesTo>
							<Line1107AttorneyFeesToBCC></Line1107AttorneyFeesToBCC>
							<Line1108TitleInsuranceToPaymentTo></Line1108TitleInsuranceToPaymentTo>
							<Line1108TitleInsuranceTo></Line1108TitleInsuranceTo>
							<Line1108TitleInsuranceToBCC></Line1108TitleInsuranceToBCC>
							<Line1109LendersCoveragePolicyAmount></Line1109LendersCoveragePolicyAmount>
							<Line1109LendersCoveragePolicyCost></Line1109LendersCoveragePolicyCost>
							<Line1109LendersCoverage></Line1109LendersCoverage>
							<Line1109LendersCoverageBCC></Line1109LendersCoverageBCC>
							<Line1110OwnersCoveragePolicyAmount></Line1110OwnersCoveragePolicyAmount>
							<Line1110OwnersCoveragePolicyCost></Line1110OwnersCoveragePolicyCost>
							<Line1110OwnersCoverage></Line1110OwnersCoverage>
							<Line1110OwnersCoverageBCC></Line1110OwnersCoverageBCC>
							<Line1111OutstandingLiens></Line1111OutstandingLiens>
							<Line1111OutstandingLiensBCC></Line1111OutstandingLiensBCC>
							<Line1112SellerRepresentationFeePaymentTo></Line1112SellerRepresentationFeePaymentTo>
							<Line1112SellerRepresentationFee></Line1112SellerRepresentationFee>
							<Line1112SellerRepresentationFeeBCC></Line1112SellerRepresentationFeeBCC>
							<Line1113ForeclosureCosts></Line1113ForeclosureCosts>
							<Line1113ForeclosureCostsBCC></Line1113ForeclosureCostsBCC>
							<Line1114LandRent></Line1114LandRent>
							<Line1114LandRentBCC></Line1114LandRentBCC>
							<Line1115OutstandingLiens></Line1115OutstandingLiens>
							<Line1115OutstandingLiensBCC></Line1115OutstandingLiensBCC>
							<Line1116Desc></Line1116Desc>
							<Line1116></Line1116>
							<Line1116BCC></Line1116BCC>
							<Line1117Desc></Line1117Desc>
							<Line1117></Line1117>
							<Line1117BCC></Line1117BCC>
							<Line1118Desc></Line1118Desc>
							<Line1118></Line1118>
							<Line1118BCC></Line1118BCC>
						</TitleCharges>
						<GovernmentRecordingCharges>
							<Line1201RecordingFeesDeed></Line1201RecordingFeesDeed>
							<Line1201RecordingFeesMortgage></Line1201RecordingFeesMortgage>
							<Line1201RecordingFeesRelease></Line1201RecordingFeesRelease>
							<Line1201RecordingFees></Line1201RecordingFees>
							<Line1201RecordingFeesBCC></Line1201RecordingFeesBCC>
							<Line1202CityCountyTaxStamps></Line1202CityCountyTaxStamps>
							<Line1202CityCountyTaxStampsDeed></Line1202CityCountyTaxStampsDeed>
							<Line1202CityCountyTaxStampsMortgage></Line1202CityCountyTaxStampsMortgage>
							<Line1202CityCountyTaxStampsBCC></Line1202CityCountyTaxStampsBCC>
							<Line1203StateTaxStamps></Line1203StateTaxStamps>
							<Line1203StateTaxStampsDeed></Line1203StateTaxStampsDeed>
							<Line1203StateTaxStampsMortgage></Line1203StateTaxStampsMortgage>
							<Line1203StateTaxStampsBCC></Line1203StateTaxStampsBCC>
							<Line1204POARecordingFee></Line1204POARecordingFee>
							<Line1204POARecordingFeeBCC></Line1204POARecordingFeeBCC>
							<Line1205ConveyanceCharges></Line1205ConveyanceCharges>
							<Line1205ConveyanceChargesBCC></Line1205ConveyanceChargesBCC>
							<Line1206Desc></Line1206Desc>
							<Line1206></Line1206>
							<Line1206BCC></Line1206BCC>
							<Line1207Desc></Line1207Desc>
							<Line1207></Line1207>
							<Line1207BCC></Line1207BCC>
							<Line1208Desc></Line1208Desc>
							<Line1208></Line1208>
							<Line1208BCC></Line1208BCC>
							<Line1209Desc></Line1209Desc>
							<Line1209></Line1209>
							<Line1209BCC></Line1209BCC>
							<Line1210Desc></Line1210Desc>
							<Line1210></Line1210>
							<Line1210BCC></Line1210BCC>
						</GovernmentRecordingCharges>
						<AdditionalSettlementCharges>
							<Line1301SurveyToPaidTo></Line1301SurveyToPaidTo>
							<Line1301SurveyTo></Line1301SurveyTo>
							<Line1301SurveyToBCC></Line1301SurveyToBCC>
							<Line1302DelinquentUtilities></Line1302DelinquentUtilities>
							<Line1302DelinquentUtilitiesBCC></Line1302DelinquentUtilitiesBCC>
							<Line1303Desc></Line1303Desc>
							<Line1303></Line1303>
							<Line1303BCC></Line1303BCC>
							<Line1304Desc></Line1304Desc>
							<Line1304></Line1304>
							<Line1304BCC></Line1304BCC>
							<Line1305WireFee></Line1305WireFee>
							<Line1305WireFeeBCC></Line1305WireFeeBCC>
							<Line1306Desc></Line1306Desc>
							<Line1306></Line1306>
							<Line1306BCC></Line1306BCC>
							<Line1307BuyersPremiumBCC></Line1307BuyersPremiumBCC>
							<Line1308Desc></Line1308Desc>
							<Line1308></Line1308>
							<Line1308BCC></Line1308BCC>
							<Line1309Desc></Line1309Desc>
							<Line1309></Line1309>
							<Line1309BCC></Line1309BCC>
							<Line1310Desc></Line1310Desc>
							<Line1310></Line1310>
							<Line1310BCC></Line1310BCC>
							<Line1311Desc></Line1311Desc>
							<Line1311></Line1311>
							<Line1311BCC></Line1311BCC>
							<Line1312Desc></Line1312Desc>
							<Line1312></Line1312>
							<Line1312BCC></Line1312BCC>
						</AdditionalSettlementCharges>
					</SettlementCharges>
				</HUDForm> -->
			</SupplyEstimatedHUDAndDeed>
		</Order>
	</Body>
</Message>'>
    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">


<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Deed and Estimated HUD sent to Equator', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="update_this_title">
			update Title 
			set equator_deed_sent = 1
			where title_id = '#arguments.titleID#'
		</CFQUERY>
</cffunction>  



<cffunction name="resendDeedAndHud" output="true">
<cfargument name="titleID" required="true">
	<cfargument name="fname">
	<cfargument name="lname">
<cfset temp = setupVariables(titleId=arguments.titleId)>
		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_hud_data">
			SELECT *
			FROM HUD2010_TITLE_DATA
			WHERE Title_ID = #arguments.titleID#
</cfquery>		

<CFQUERY datasource="#request.dsn#" NAME="get_hud_data_b">
			SELECT *
			FROM HUD2010_TITLE_DATA_B
			WHERE Title_ID = #arguments.titleID#
</cfquery>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::DEED AND EST HUD RE-SENT::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_transaction.deed_prep_vendor_upload#', 'file')#" variable="M1">
<cfset base64_deed = ToBase64(m1)>


<cfhttp url="http://machine1.firsttitleservices.com/HUD1_2010_PDF.cfm?rec_id=#arguments.titleID#&bypass=1" method="get" resolveURL="true">
</cfhttp>
        <cfdocument format="PDF" pagetype="custom" pageheight="14" pagewidth="8.5" margintop=".25" marginbottom=".25" marginleft=".25" marginright=".25" filename="c:\huds\HUD_#arguments.titleID#.pdf" overwrite="yes"> <cfoutput>#cfhttp.filecontent#</cfoutput> </cfdocument>

<cffile action="READBINARY" file="c:\huds\HUD_#arguments.titleID#.pdf" variable="M2">
<cfset base64_hud = ToBase64(m2)>



<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
		<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_closing_transactionID#">
			<ReSupplyEstimatedHUDAndDeed>
				<EstimatedHUD name="HUD_#arguments.titleID#.pdf" type="PDF">
					<Checksum></Checksum>
					<Payload>#base64_hud#</Payload>
				</EstimatedHUD>
				<Deed name="#lookup_transaction.deed_prep_vendor_upload#" type="DOC">
					<Checksum>0</Checksum>
					<Payload>#base64_deed#</Payload>
				</Deed>
				<SettlementDate>2012-01-01</SettlementDate>
				<DisbursementDate>2012-01-01</DisbursementDate>
		<!--		<SellerPaidBuyerExpenses></SellerPaidBuyerExpenses>
				<HUDForm>
					<SummaryOfSellerTransaction>
						<GrossAmountDueToSeller>
							<Line401ContractSalesPriceBCC></Line401ContractSalesPriceBCC>
							<Line402PersonalProperty></Line402PersonalProperty>
							<Line402PersonalPropertyBCC></Line402PersonalPropertyBCC>
							<Line403RentsFrom></Line403RentsFrom>
							<Line403RentsTo></Line403RentsTo>
							<Line403Rents></Line403Rents>
							<Line403RentsBCC></Line403RentsBCC>
							<Line404Desc></Line404Desc>
							<Line404></Line404>
							<Line404BCC></Line404BCC>
							<Line405Desc></Line405Desc>
							<Line405></Line405>
							<Line405BCC></Line405BCC>
							<Line406CityTownTaxesFrom></Line406CityTownTaxesFrom>
							<Line406CityTownTaxesTo></Line406CityTownTaxesTo>
							<Line406CityTownTaxes></Line406CityTownTaxes>
							<Line406CityTownTaxesBCC></Line406CityTownTaxesBCC>
							<Line407CountyTaxesFrom></Line407CountyTaxesFrom>
							<Line407CountyTaxesTo></Line407CountyTaxesTo>
							<Line407CountyTaxes></Line407CountyTaxes>
							<Line407CountyTaxesBCC></Line407CountyTaxesBCC>
							<Line408HOADuesFrom></Line408HOADuesFrom>
							<Line408HOADuesTo></Line408HOADuesTo>
							<Line408HOADues></Line408HOADues>
							<Line408HOADuesBCC></Line408HOADuesBCC>
							<Line409HOADuesFrom></Line409HOADuesFrom>
							<Line409HOADuesTo></Line409HOADuesTo>
							<Line409HOADues></Line409HOADues>
							<Line409HOADuesBCC></Line409HOADuesBCC>
							<Line410AssessmentsFrom></Line410AssessmentsFrom>
							<Line410AssessmentsTo></Line410AssessmentsTo>
							<Line410Assessments></Line410Assessments>
							<Line410AssessmentsBCC></Line410AssessmentsBCC>
							<Line411OfferPerDiemBCC></Line411OfferPerDiemBCC>
							<Line412Desc></Line412Desc>
							<Line412></Line412>
							<Line412BCC></Line412BCC>
							<Line413Desc></Line413Desc>
							<Line413></Line413>
							<Line413BCC></Line413BCC>
							<Line414Desc></Line414Desc>
							<Line414></Line414>
							<Line414BCC></Line414BCC>
							<Line415Desc></Line415Desc>
							<Line415></Line415>
							<Line415BCC></Line415BCC>
							<Line416Desc></Line416Desc>
							<Line416></Line416>
							<Line416BCC></Line416BCC>
							<Line417Desc></Line417Desc>
							<Line417></Line417>
							<Line417BCC></Line417BCC>
							<Line418Desc></Line418Desc>
							<Line418></Line418>
							<Line418BCC></Line418BCC>
						</GrossAmountDueToSeller>
						<ReductionInAmountDueToSeller>
							<Line501Amount></Line501Amount>
							<Line501AmountBCC></Line501AmountBCC>
							<Line502SettlementChargesToSellerBCC></Line502SettlementChargesToSellerBCC>
							<Line503ExistingLoanTakenSubjectToDesc></Line503ExistingLoanTakenSubjectToDesc>
							<Line503ExistingLoanTakenSubjectTo></Line503ExistingLoanTakenSubjectTo>
							<Line503ExistingLoanTakenSubjectToBCC></Line503ExistingLoanTakenSubjectToBCC>
							<Line504PayoffOfFirstMortgageLoan></Line504PayoffOfFirstMortgageLoan>
							<Line504PayoffOfFirstMortgageLoanBCC></Line504PayoffOfFirstMortgageLoanBCC>
							<Line505PayoffOfSecondMortgageLoan></Line505PayoffOfSecondMortgageLoan>
							<Line505PayoffOfSecondMortgageLoanBCC></Line505PayoffOfSecondMortgageLoanBCC>
							<Line506Desc></Line506Desc>
							<Line506></Line506>
							<Line506BCC></Line506BCC>
							<Line507></Line507>
							<Line507Desc></Line507Desc>
							<Line507BCC></Line507BCC>
							<Line508></Line508>
							<Line508Desc></Line508Desc>
							<Line508BCC></Line508BCC>
							<Line509></Line509>
							<Line509Desc></Line509Desc>
							<Line509BCC></Line509BCC>
							<Line510CityTownTaxesFromDate></Line510CityTownTaxesFromDate>
							<Line510CityTownTaxesToDate></Line510CityTownTaxesToDate>
							<Line510CityTownTaxes></Line510CityTownTaxes>
							<Line510CityTownTaxesBCC></Line510CityTownTaxesBCC>
							<Line511CountyTaxesFromDate></Line511CountyTaxesFromDate>
							<Line511CountyTaxesToDate></Line511CountyTaxesToDate>
							<Line511CountyTaxes></Line511CountyTaxes>
							<Line511CountyTaxesBCC></Line511CountyTaxesBCC>
							<Line512SchoolTaxesFromDate></Line512SchoolTaxesFromDate>
							<Line512SchoolTaxesToDate></Line512SchoolTaxesToDate>
							<Line512SchoolTaxes></Line512SchoolTaxes>
							<Line512SchoolTaxesBCC></Line512SchoolTaxesBCC>
							<Line513Desc></Line513Desc>
							<Line513></Line513>
							<Line513BCC></Line513BCC>
	<Line514DelinquentTaxes>123.12</Line514DelinquentTaxes>						<Line514DelinquentTaxesBCC></Line514DelinquentTaxesBCC>
							<Line515SpecialAssessmentsFromDate></Line515SpecialAssessmentsFromDate>
							<Line515SpecialAssessmentsToDate></Line515SpecialAssessmentsToDate>
							<Line515SpecialAssessments></Line515SpecialAssessments>
							<Line515SpecialAssessmentsBCC></Line515SpecialAssessmentsBCC>
							<Line516DelinquentSpecialAssessmentsFromDate></Line516DelinquentSpecialAssessmentsFromDate>
							<Line516DelinquentSpecialAssessmentsToDate></Line516DelinquentSpecialAssessmentsToDate>
							<Line516DelinquentSpecialAssessments></Line516DelinquentSpecialAssessments>
							<Line516DelinquentSpecialAssessmentsBCC></Line516DelinquentSpecialAssessmentsBCC>
							<Line517HOADuesFromDate></Line517HOADuesFromDate>
							<Line517HOADuesToDate></Line517HOADuesToDate>
							<Line517HOADues></Line517HOADues>
							<Line517HOADuesBCC></Line517HOADuesBCC>
	<Line518TotalDelinquentHOA>6465.12</Line518TotalDelinquentHOA>						<Line518TotalDelinquentHOABCC></Line518TotalDelinquentHOABCC>
							<Line519Desc></Line519Desc>
							<Line519></Line519>
							<Line519BCC></Line519BCC>
						</ReductionInAmountDueToSeller>
					</SummaryOfSellerTransaction>
					<SettlementCharges>
						<TotalCommission>
							<Line704ListingAgentBonus></Line704ListingAgentBonus>
							<Line705SellingAgentBonus></Line705SellingAgentBonus>
							<Line706Desc></Line706Desc>
							<Line706></Line706>
							<Line707Desc></Line707Desc>
							<Line707></Line707>
						</TotalCommission>
						<ItemsPayableInConnectionWithLoan>
							<Line801LoanOriginationFee></Line801LoanOriginationFee>
							<Line801LoanOriginationFeeBCC></Line801LoanOriginationFeeBCC>
							<Line802LoanDiscount></Line802LoanDiscount>
							<Line802LoanDiscountBCC></Line802LoanDiscountBCC>
							<Line803AppraisalFee></Line803AppraisalFee>
							<Line803AppraisalFeeBCC></Line803AppraisalFeeBCC>
							<Line804CreditReport></Line804CreditReport>
							<Line804CreditReportBCC></Line804CreditReportBCC>
							<Line805Desc></Line805Desc>
							<Line805></Line805>
							<Line805BCC></Line805BCC>
							<Line806Desc></Line806Desc>
							<Line806></Line806>
							<Line806BCC></Line806BCC>
							<Line807Desc></Line807Desc>
							<Line807></Line807>
							<Line807BCC></Line807BCC>
							<Line808Desc></Line808Desc>
							<Line808></Line808>
							<Line808BCC></Line808BCC>
							<Line809Desc></Line809Desc>
							<Line809></Line809>
							<Line809BCC></Line809BCC>
							<Line810Desc></Line810Desc>
							<Line810></Line810>
							<Line810BCC></Line810BCC>
							<Line811Desc></Line811Desc>
							<Line811></Line811>
							<Line811BCC></Line811BCC>
						</ItemsPayableInConnectionWithLoan>
						<ItemsRequiredByLenderPaidInAdvance>
							<Line901Interest></Line901Interest>
							<Line901InterestBCC></Line901InterestBCC>
							<Line902MortgageInsurancePremium></Line902MortgageInsurancePremium>
							<Line902MortgageInsurancePremiumBCC></Line902MortgageInsurancePremiumBCC>
							<Line903HazardInsurance></Line903HazardInsurance>
							<Line903HazardInsuranceBCC></Line903HazardInsuranceBCC>
							<Line904Desc></Line904Desc>
							<Line904></Line904>
							<Line904BCC></Line904BCC>
							<Line905Desc></Line905Desc>
							<Line905></Line905>
							<Line905BCC></Line905BCC>
						</ItemsRequiredByLenderPaidInAdvance>
						<ReservesDepositedWithLender>
							<Line1001HazardInsurance></Line1001HazardInsurance>
							<Line1001HazardInsuranceBCC></Line1001HazardInsuranceBCC>
							<Line1002MortgageInsurance></Line1002MortgageInsurance>
							<Line1002MortgageInsuranceBCC></Line1002MortgageInsuranceBCC>
							<Line1003CityPropertyTaxes></Line1003CityPropertyTaxes>
							<Line1003CityPropertyTaxesBCC></Line1003CityPropertyTaxesBCC>
							<Line1004CountyPropertyTaxes></Line1004CountyPropertyTaxes>
							<Line1004CountyPropertyTaxesBCC></Line1004CountyPropertyTaxesBCC>
							<Line1005AnnualAssessments></Line1005AnnualAssessments>
							<Line1005AnnualAssessmentsBCC></Line1005AnnualAssessmentsBCC>
							<Line1006Desc></Line1006Desc>
							<Line1006></Line1006>
							<Line1006BCC></Line1006BCC>
							<Line1007Desc></Line1007Desc>
							<Line1007></Line1007>
							<Line1007BCC></Line1007BCC>
							<Line1008Desc></Line1008Desc>
							<Line1008></Line1008>
							<Line1008BCC></Line1008BCC>
							<Line1011AggregateAdjustment></Line1011AggregateAdjustment>
							<Line1011AggregateAdjustmentBCC></Line1011AggregateAdjustmentBCC>
						</ReservesDepositedWithLender>
						<TitleCharges>
							<Line1101SettlementFeePaymentTo></Line1101SettlementFeePaymentTo>
							<Line1101SettlementFee></Line1101SettlementFee>
							<Line1101SettlementFeeBCC></Line1101SettlementFeeBCC>
							<Line1102AbstractToPaymentTo></Line1102AbstractToPaymentTo>
							<Line1102AbstractTo></Line1102AbstractTo>
							<Line1102AbstractToBCC></Line1102AbstractToBCC>
							<Line1103TitleExaminationToPaymentTo></Line1103TitleExaminationToPaymentTo>
							<Line1103TitleExaminationTo></Line1103TitleExaminationTo>
							<Line1103TitleExaminationToBCC></Line1103TitleExaminationToBCC>
							<Line1104TitleInsuranceBinderToPaymentTo></Line1104TitleInsuranceBinderToPaymentTo>
							<Line1104TitleInsuranceBinderTo></Line1104TitleInsuranceBinderTo>
							<Line1104TitleInsuranceBinderToBCC></Line1104TitleInsuranceBinderToBCC>
							<Line1105DocumentPreparationToPaymentTo></Line1105DocumentPreparationToPaymentTo>
							<Line1105DocumentPreparationTo></Line1105DocumentPreparationTo>
							<Line1105DocumentPreparationToBCC></Line1105DocumentPreparationToBCC>
							<Line1106NotaryFeesToPaymentTo></Line1106NotaryFeesToPaymentTo>
							<Line1106NotaryFeesTo></Line1106NotaryFeesTo>
							<Line1106NotaryFeesToBCC></Line1106NotaryFeesToBCC>
							<Line1107AttorneyFeesToPaymentTo></Line1107AttorneyFeesToPaymentTo>
							<Line1107AttorneyFeesTo></Line1107AttorneyFeesTo>
							<Line1107AttorneyFeesToBCC></Line1107AttorneyFeesToBCC>
							<Line1108TitleInsuranceToPaymentTo></Line1108TitleInsuranceToPaymentTo>
							<Line1108TitleInsuranceTo></Line1108TitleInsuranceTo>
							<Line1108TitleInsuranceToBCC></Line1108TitleInsuranceToBCC>
							<Line1109LendersCoveragePolicyAmount></Line1109LendersCoveragePolicyAmount>
							<Line1109LendersCoveragePolicyCost></Line1109LendersCoveragePolicyCost>
							<Line1109LendersCoverage></Line1109LendersCoverage>
							<Line1109LendersCoverageBCC></Line1109LendersCoverageBCC>
							<Line1110OwnersCoveragePolicyAmount></Line1110OwnersCoveragePolicyAmount>
							<Line1110OwnersCoveragePolicyCost></Line1110OwnersCoveragePolicyCost>
							<Line1110OwnersCoverage></Line1110OwnersCoverage>
							<Line1110OwnersCoverageBCC></Line1110OwnersCoverageBCC>
							<Line1111OutstandingLiens></Line1111OutstandingLiens>
							<Line1111OutstandingLiensBCC></Line1111OutstandingLiensBCC>
							<Line1112SellerRepresentationFeePaymentTo></Line1112SellerRepresentationFeePaymentTo>
							<Line1112SellerRepresentationFee></Line1112SellerRepresentationFee>
							<Line1112SellerRepresentationFeeBCC></Line1112SellerRepresentationFeeBCC>
							<Line1113ForeclosureCosts></Line1113ForeclosureCosts>
							<Line1113ForeclosureCostsBCC></Line1113ForeclosureCostsBCC>
							<Line1114LandRent></Line1114LandRent>
							<Line1114LandRentBCC></Line1114LandRentBCC>
							<Line1115OutstandingLiens></Line1115OutstandingLiens>
							<Line1115OutstandingLiensBCC></Line1115OutstandingLiensBCC>
							<Line1116Desc></Line1116Desc>
							<Line1116></Line1116>
							<Line1116BCC></Line1116BCC>
							<Line1117Desc></Line1117Desc>
							<Line1117></Line1117>
							<Line1117BCC></Line1117BCC>
							<Line1118Desc></Line1118Desc>
							<Line1118></Line1118>
							<Line1118BCC></Line1118BCC>
						</TitleCharges>
						<GovernmentRecordingCharges>
							<Line1201RecordingFeesDeed></Line1201RecordingFeesDeed>
							<Line1201RecordingFeesMortgage></Line1201RecordingFeesMortgage>
							<Line1201RecordingFeesRelease></Line1201RecordingFeesRelease>
							<Line1201RecordingFees></Line1201RecordingFees>
							<Line1201RecordingFeesBCC></Line1201RecordingFeesBCC>
							<Line1202CityCountyTaxStamps></Line1202CityCountyTaxStamps>
							<Line1202CityCountyTaxStampsDeed></Line1202CityCountyTaxStampsDeed>
							<Line1202CityCountyTaxStampsMortgage></Line1202CityCountyTaxStampsMortgage>
							<Line1202CityCountyTaxStampsBCC></Line1202CityCountyTaxStampsBCC>
							<Line1203StateTaxStamps></Line1203StateTaxStamps>
							<Line1203StateTaxStampsDeed></Line1203StateTaxStampsDeed>
							<Line1203StateTaxStampsMortgage></Line1203StateTaxStampsMortgage>
							<Line1203StateTaxStampsBCC></Line1203StateTaxStampsBCC>
							<Line1204POARecordingFee></Line1204POARecordingFee>
							<Line1204POARecordingFeeBCC></Line1204POARecordingFeeBCC>
							<Line1205ConveyanceCharges></Line1205ConveyanceCharges>
							<Line1205ConveyanceChargesBCC></Line1205ConveyanceChargesBCC>
							<Line1206Desc></Line1206Desc>
							<Line1206></Line1206>
							<Line1206BCC></Line1206BCC>
							<Line1207Desc></Line1207Desc>
							<Line1207></Line1207>
							<Line1207BCC></Line1207BCC>
							<Line1208Desc></Line1208Desc>
							<Line1208></Line1208>
							<Line1208BCC></Line1208BCC>
							<Line1209Desc></Line1209Desc>
							<Line1209></Line1209>
							<Line1209BCC></Line1209BCC>
							<Line1210Desc></Line1210Desc>
							<Line1210></Line1210>
							<Line1210BCC></Line1210BCC>
						</GovernmentRecordingCharges>
						<AdditionalSettlementCharges>
							<Line1301SurveyToPaidTo></Line1301SurveyToPaidTo>
							<Line1301SurveyTo></Line1301SurveyTo>
							<Line1301SurveyToBCC></Line1301SurveyToBCC>
							<Line1302DelinquentUtilities></Line1302DelinquentUtilities>
							<Line1302DelinquentUtilitiesBCC></Line1302DelinquentUtilitiesBCC>
							<Line1303Desc></Line1303Desc>
							<Line1303></Line1303>
							<Line1303BCC></Line1303BCC>
							<Line1304Desc></Line1304Desc>
							<Line1304></Line1304>
							<Line1304BCC></Line1304BCC>
							<Line1305WireFee></Line1305WireFee>
							<Line1305WireFeeBCC></Line1305WireFeeBCC>
							<Line1306Desc></Line1306Desc>
							<Line1306></Line1306>
							<Line1306BCC></Line1306BCC>
							<Line1307BuyersPremiumBCC></Line1307BuyersPremiumBCC>
							<Line1308Desc></Line1308Desc>
							<Line1308></Line1308>
							<Line1308BCC></Line1308BCC>
							<Line1309Desc></Line1309Desc>
							<Line1309></Line1309>
							<Line1309BCC></Line1309BCC>
							<Line1310Desc></Line1310Desc>
							<Line1310></Line1310>
							<Line1310BCC></Line1310BCC>
							<Line1311Desc></Line1311Desc>
							<Line1311></Line1311>
							<Line1311BCC></Line1311BCC>
							<Line1312Desc></Line1312Desc>
							<Line1312></Line1312>
							<Line1312BCC></Line1312BCC>
						</AdditionalSettlementCharges>
					</SettlementCharges>
				</HUDForm>      -->
			</ReSupplyEstimatedHUDAndDeed>
		</Order>
	</Body>
</Message>'>
    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Deed and Estimated HUD sent to Equator', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="update_this_title">
			update Title 
			set equator_deed_sent = 1
			where title_id = '#arguments.titleID#'
		</CFQUERY>
</cffunction>  














<cffunction name="sendFinalHUDandWaiver" output="true">
<cfargument name="titleID" required="true">
<cfargument name="fname">
<cfargument name="lname">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="lookup_docs">
			select * from Doc_Closer_Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cfif lookup_transaction.hud_signed eq 1>
<cfset hud_is_signed = 'true'>
<cfelse>
<cfset hud_is_signed = 'false'>
</cfif>
<cfif lookup_transaction.waiver_signed eq 1>
<cfset waiver_is_signed = 'true'>
<cfelse>
<cfset waiver_is_signed = 'false'>
</cfif>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Final HUD and Waiver Sent::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_docs.final_HUD#', 'file')#" variable="M1">
<cfset base64_hud = ToBase64(m1)>

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_docs.waiver#', 'file')#" variable="M2">
<cfset base64_waiver = ToBase64(m2)>


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
		<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_closing_transactionID#">
			<SupplyFinalHUDAndWaiver>
				<FinalHUD name="#lookup_docs.final_HUD#" type="PDF">
					<Checksum>0</Checksum>
					<Payload>#base64_hud#</Payload>
				</FinalHUD>
				<WaiverAndReleaseForm name="#lookup_docs.waiver#" type="PDF">
					<Checksum>0</Checksum>
					<Payload>#base64_waiver#</Payload>
				</WaiverAndReleaseForm>
				<IsFinalHUDSignedAndExecuted>#hud_is_signed#</IsFinalHUDSignedAndExecuted>
				<IsWaiverSignedAndExecuted>#waiver_is_signed#</IsWaiverSignedAndExecuted>
				<SettlementDate>2012-11-15</SettlementDate>
				<DisbursementDate>2012-11-15</DisbursementDate>
				<HUDForm>
				<!--		<SummaryOfSellerTransaction>
						<GrossAmountDueToSeller>
							<Line401ContractSalesPriceBCC></Line401ContractSalesPriceBCC>
							<Line402PersonalProperty></Line402PersonalProperty>
							<Line402PersonalPropertyBCC></Line402PersonalPropertyBCC>
							<Line403RentsFrom></Line403RentsFrom>
							<Line403RentsTo></Line403RentsTo>
							<Line403Rents></Line403Rents>
							<Line403RentsBCC></Line403RentsBCC>
							<Line404Desc></Line404Desc>
							<Line404></Line404>
							<Line404BCC></Line404BCC>
							<Line405Desc></Line405Desc>
							<Line405></Line405>
							<Line405BCC></Line405BCC>
							<Line406CityTownTaxesFrom></Line406CityTownTaxesFrom>
							<Line406CityTownTaxesTo></Line406CityTownTaxesTo>
							<Line406CityTownTaxes></Line406CityTownTaxes>
							<Line406CityTownTaxesBCC></Line406CityTownTaxesBCC>
							<Line407CountyTaxesFrom></Line407CountyTaxesFrom>
							<Line407CountyTaxesTo></Line407CountyTaxesTo>
							<Line407CountyTaxes></Line407CountyTaxes>
							<Line407CountyTaxesBCC></Line407CountyTaxesBCC>
							<Line408HOADuesFrom></Line408HOADuesFrom>
							<Line408HOADuesTo></Line408HOADuesTo>
							<Line408HOADues></Line408HOADues>
							<Line408HOADuesBCC></Line408HOADuesBCC>
							<Line409HOADuesFrom></Line409HOADuesFrom>
							<Line409HOADuesTo></Line409HOADuesTo>
							<Line409HOADues></Line409HOADues>
							<Line409HOADuesBCC></Line409HOADuesBCC>
							<Line410AssessmentsFrom></Line410AssessmentsFrom>
							<Line410AssessmentsTo></Line410AssessmentsTo>
							<Line410Assessments></Line410Assessments>
							<Line410AssessmentsBCC></Line410AssessmentsBCC>
							<Line411OfferPerDiemBCC></Line411OfferPerDiemBCC>
							<Line412Desc></Line412Desc>
							<Line412></Line412>
							<Line412BCC></Line412BCC>
							<Line413Desc></Line413Desc>
							<Line413></Line413>
							<Line413BCC></Line413BCC>
							<Line414Desc></Line414Desc>
							<Line414></Line414>
							<Line414BCC></Line414BCC>
							<Line415Desc></Line415Desc>
							<Line415></Line415>
							<Line415BCC></Line415BCC>
							<Line416Desc></Line416Desc>
							<Line416></Line416>
							<Line416BCC></Line416BCC>
							<Line417Desc></Line417Desc>
							<Line417></Line417>
							<Line417BCC></Line417BCC>
							<Line418Desc></Line418Desc>
							<Line418></Line418>
							<Line418BCC></Line418BCC>
						</GrossAmountDueToSeller>
						<ReductionInAmountDueToSeller>
							<Line501Amount></Line501Amount>
							<Line501AmountBCC></Line501AmountBCC>
							<Line502SettlementChargesToSellerBCC></Line502SettlementChargesToSellerBCC>
							<Line503ExistingLoanTakenSubjectToDesc></Line503ExistingLoanTakenSubjectToDesc>
							<Line503ExistingLoanTakenSubjectTo></Line503ExistingLoanTakenSubjectTo>
							<Line503ExistingLoanTakenSubjectToBCC></Line503ExistingLoanTakenSubjectToBCC>
							<Line504PayoffOfFirstMortgageLoan></Line504PayoffOfFirstMortgageLoan>
							<Line504PayoffOfFirstMortgageLoanBCC></Line504PayoffOfFirstMortgageLoanBCC>
							<Line505PayoffOfSecondMortgageLoan></Line505PayoffOfSecondMortgageLoan>
							<Line505PayoffOfSecondMortgageLoanBCC></Line505PayoffOfSecondMortgageLoanBCC>
							<Line506Desc></Line506Desc>
							<Line506></Line506>
							<Line506BCC></Line506BCC>
							<Line507></Line507>
							<Line507Desc></Line507Desc>
							<Line507BCC></Line507BCC>
							<Line508></Line508>
							<Line508Desc></Line508Desc>
							<Line508BCC></Line508BCC>
							<Line509></Line509>
							<Line509Desc></Line509Desc>
							<Line509BCC></Line509BCC>
							<Line510CityTownTaxesFromDate></Line510CityTownTaxesFromDate>
							<Line510CityTownTaxesToDate></Line510CityTownTaxesToDate>
							<Line510CityTownTaxes></Line510CityTownTaxes>
							<Line510CityTownTaxesBCC></Line510CityTownTaxesBCC>
							<Line511CountyTaxesFromDate></Line511CountyTaxesFromDate>
							<Line511CountyTaxesToDate></Line511CountyTaxesToDate>
							<Line511CountyTaxes></Line511CountyTaxes>
							<Line511CountyTaxesBCC></Line511CountyTaxesBCC>
							<Line512SchoolTaxesFromDate></Line512SchoolTaxesFromDate>
							<Line512SchoolTaxesToDate></Line512SchoolTaxesToDate>
							<Line512SchoolTaxes></Line512SchoolTaxes>
							<Line512SchoolTaxesBCC></Line512SchoolTaxesBCC>
							<Line513Desc></Line513Desc>
							<Line513></Line513>
							<Line513BCC></Line513BCC>
		<Line514DelinquentTaxes>14.12</Line514DelinquentTaxes>					<Line514DelinquentTaxesBCC></Line514DelinquentTaxesBCC>
							<Line515SpecialAssessmentsFromDate></Line515SpecialAssessmentsFromDate>
							<Line515SpecialAssessmentsToDate></Line515SpecialAssessmentsToDate>
							<Line515SpecialAssessments></Line515SpecialAssessments>
							<Line515SpecialAssessmentsBCC></Line515SpecialAssessmentsBCC>
							<Line516DelinquentSpecialAssessmentsFromDate></Line516DelinquentSpecialAssessmentsFromDate>
							<Line516DelinquentSpecialAssessmentsToDate></Line516DelinquentSpecialAssessmentsToDate>
							<Line516DelinquentSpecialAssessments></Line516DelinquentSpecialAssessments>
							<Line516DelinquentSpecialAssessmentsBCC></Line516DelinquentSpecialAssessmentsBCC>
							<Line517HOADuesFromDate></Line517HOADuesFromDate>
							<Line517HOADuesToDate></Line517HOADuesToDate>
							<Line517HOADues></Line517HOADues>
							<Line517HOADuesBCC></Line517HOADuesBCC>
		<Line518TotalDelinquentHOA>112.12</Line518TotalDelinquentHOA>					<Line518TotalDelinquentHOABCC></Line518TotalDelinquentHOABCC>
							<Line519Desc></Line519Desc>
							<Line519></Line519>
							<Line519BCC></Line519BCC>
						</ReductionInAmountDueToSeller>
					</SummaryOfSellerTransaction>
					<SettlementCharges>
						<TotalCommission>
							<Line704ListingAgentBonus></Line704ListingAgentBonus>
							<Line705SellingAgentBonus></Line705SellingAgentBonus>
							<Line706Desc></Line706Desc>
							<Line706></Line706>
							<Line707Desc></Line707Desc>
							<Line707></Line707>
						</TotalCommission>
						<ItemsPayableInConnectionWithLoan>
							<Line801LoanOriginationFee></Line801LoanOriginationFee>
							<Line801LoanOriginationFeeBCC></Line801LoanOriginationFeeBCC>
							<Line802LoanDiscount></Line802LoanDiscount>
							<Line802LoanDiscountBCC></Line802LoanDiscountBCC>
							<Line803AppraisalFee></Line803AppraisalFee>
							<Line803AppraisalFeeBCC></Line803AppraisalFeeBCC>
							<Line804CreditReport></Line804CreditReport>
							<Line804CreditReportBCC></Line804CreditReportBCC>
							<Line805Desc></Line805Desc>
							<Line805></Line805>
							<Line805BCC></Line805BCC>
							<Line806Desc></Line806Desc>
							<Line806></Line806>
							<Line806BCC></Line806BCC>
							<Line807Desc></Line807Desc>
							<Line807></Line807>
							<Line807BCC></Line807BCC>
							<Line808Desc></Line808Desc>
							<Line808></Line808>
							<Line808BCC></Line808BCC>
							<Line809Desc></Line809Desc>
							<Line809></Line809>
							<Line809BCC></Line809BCC>
							<Line810Desc></Line810Desc>
							<Line810></Line810>
							<Line810BCC></Line810BCC>
							<Line811Desc></Line811Desc>
							<Line811></Line811>
							<Line811BCC></Line811BCC>
						</ItemsPayableInConnectionWithLoan>
						<ItemsRequiredByLenderPaidInAdvance>
							<Line901Interest></Line901Interest>
							<Line901InterestBCC></Line901InterestBCC>
							<Line902MortgageInsurancePremium></Line902MortgageInsurancePremium>
							<Line902MortgageInsurancePremiumBCC></Line902MortgageInsurancePremiumBCC>
							<Line903HazardInsurance></Line903HazardInsurance>
							<Line903HazardInsuranceBCC></Line903HazardInsuranceBCC>
							<Line904Desc></Line904Desc>
							<Line904></Line904>
							<Line904BCC></Line904BCC>
							<Line905Desc></Line905Desc>
							<Line905></Line905>
							<Line905BCC></Line905BCC>
						</ItemsRequiredByLenderPaidInAdvance>
						<ReservesDepositedWithLender>
							<Line1001HazardInsurance></Line1001HazardInsurance>
							<Line1001HazardInsuranceBCC></Line1001HazardInsuranceBCC>
							<Line1002MortgageInsurance></Line1002MortgageInsurance>
							<Line1002MortgageInsuranceBCC></Line1002MortgageInsuranceBCC>
							<Line1003CityPropertyTaxes></Line1003CityPropertyTaxes>
							<Line1003CityPropertyTaxesBCC></Line1003CityPropertyTaxesBCC>
							<Line1004CountyPropertyTaxes></Line1004CountyPropertyTaxes>
							<Line1004CountyPropertyTaxesBCC></Line1004CountyPropertyTaxesBCC>
							<Line1005AnnualAssessments></Line1005AnnualAssessments>
							<Line1005AnnualAssessmentsBCC></Line1005AnnualAssessmentsBCC>
							<Line1006Desc></Line1006Desc>
							<Line1006></Line1006>
							<Line1006BCC></Line1006BCC>
							<Line1007Desc></Line1007Desc>
							<Line1007></Line1007>
							<Line1007BCC></Line1007BCC>
							<Line1008Desc></Line1008Desc>
							<Line1008></Line1008>
							<Line1008BCC></Line1008BCC>
							<Line1011AggregateAdjustment></Line1011AggregateAdjustment>
							<Line1011AggregateAdjustmentBCC></Line1011AggregateAdjustmentBCC>
						</ReservesDepositedWithLender>
						<TitleCharges>
							<Line1101SettlementFeePaymentTo></Line1101SettlementFeePaymentTo>
							<Line1101SettlementFee></Line1101SettlementFee>
							<Line1101SettlementFeeBCC></Line1101SettlementFeeBCC>
							<Line1102AbstractToPaymentTo></Line1102AbstractToPaymentTo>
							<Line1102AbstractTo></Line1102AbstractTo>
							<Line1102AbstractToBCC></Line1102AbstractToBCC>
							<Line1103TitleExaminationToPaymentTo></Line1103TitleExaminationToPaymentTo>
							<Line1103TitleExaminationTo></Line1103TitleExaminationTo>
							<Line1103TitleExaminationToBCC></Line1103TitleExaminationToBCC>
							<Line1104TitleInsuranceBinderToPaymentTo></Line1104TitleInsuranceBinderToPaymentTo>
							<Line1104TitleInsuranceBinderTo></Line1104TitleInsuranceBinderTo>
							<Line1104TitleInsuranceBinderToBCC></Line1104TitleInsuranceBinderToBCC>
							<Line1105DocumentPreparationToPaymentTo></Line1105DocumentPreparationToPaymentTo>
							<Line1105DocumentPreparationTo></Line1105DocumentPreparationTo>
							<Line1105DocumentPreparationToBCC></Line1105DocumentPreparationToBCC>
							<Line1106NotaryFeesToPaymentTo></Line1106NotaryFeesToPaymentTo>
							<Line1106NotaryFeesTo></Line1106NotaryFeesTo>
							<Line1106NotaryFeesToBCC></Line1106NotaryFeesToBCC>
							<Line1107AttorneyFeesToPaymentTo></Line1107AttorneyFeesToPaymentTo>
							<Line1107AttorneyFeesTo></Line1107AttorneyFeesTo>
							<Line1107AttorneyFeesToBCC></Line1107AttorneyFeesToBCC>
							<Line1108TitleInsuranceToPaymentTo></Line1108TitleInsuranceToPaymentTo>
							<Line1108TitleInsuranceTo></Line1108TitleInsuranceTo>
							<Line1108TitleInsuranceToBCC></Line1108TitleInsuranceToBCC>
							<Line1109LendersCoveragePolicyAmount></Line1109LendersCoveragePolicyAmount>
							<Line1109LendersCoveragePolicyCost></Line1109LendersCoveragePolicyCost>
							<Line1109LendersCoverage></Line1109LendersCoverage>
							<Line1109LendersCoverageBCC></Line1109LendersCoverageBCC>
							<Line1110OwnersCoveragePolicyAmount></Line1110OwnersCoveragePolicyAmount>
							<Line1110OwnersCoveragePolicyCost></Line1110OwnersCoveragePolicyCost>
							<Line1110OwnersCoverage></Line1110OwnersCoverage>
							<Line1110OwnersCoverageBCC></Line1110OwnersCoverageBCC>
							<Line1111OutstandingLiens></Line1111OutstandingLiens>
							<Line1111OutstandingLiensBCC></Line1111OutstandingLiensBCC>
							<Line1112SellerRepresentationFeePaymentTo></Line1112SellerRepresentationFeePaymentTo>
							<Line1112SellerRepresentationFee></Line1112SellerRepresentationFee>
							<Line1112SellerRepresentationFeeBCC></Line1112SellerRepresentationFeeBCC>
							<Line1113ForeclosureCosts></Line1113ForeclosureCosts>
							<Line1113ForeclosureCostsBCC></Line1113ForeclosureCostsBCC>
							<Line1114LandRent></Line1114LandRent>
							<Line1114LandRentBCC></Line1114LandRentBCC>
							<Line1115OutstandingLiens></Line1115OutstandingLiens>
							<Line1115OutstandingLiensBCC></Line1115OutstandingLiensBCC>
							<Line1116Desc></Line1116Desc>
							<Line1116></Line1116>
							<Line1116BCC></Line1116BCC>
							<Line1117Desc></Line1117Desc>
							<Line1117></Line1117>
							<Line1117BCC></Line1117BCC>
							<Line1118Desc></Line1118Desc>
							<Line1118></Line1118>
							<Line1118BCC></Line1118BCC>
						</TitleCharges>
						<GovernmentRecordingCharges>
							<Line1201RecordingFeesDeed></Line1201RecordingFeesDeed>
							<Line1201RecordingFeesMortgage></Line1201RecordingFeesMortgage>
							<Line1201RecordingFeesRelease></Line1201RecordingFeesRelease>
							<Line1201RecordingFees></Line1201RecordingFees>
							<Line1201RecordingFeesBCC></Line1201RecordingFeesBCC>
							<Line1202CityCountyTaxStamps></Line1202CityCountyTaxStamps>
							<Line1202CityCountyTaxStampsDeed></Line1202CityCountyTaxStampsDeed>
							<Line1202CityCountyTaxStampsMortgage></Line1202CityCountyTaxStampsMortgage>
							<Line1202CityCountyTaxStampsBCC></Line1202CityCountyTaxStampsBCC>
							<Line1203StateTaxStamps></Line1203StateTaxStamps>
							<Line1203StateTaxStampsDeed></Line1203StateTaxStampsDeed>
							<Line1203StateTaxStampsMortgage></Line1203StateTaxStampsMortgage>
							<Line1203StateTaxStampsBCC></Line1203StateTaxStampsBCC>
							<Line1204POARecordingFee></Line1204POARecordingFee>
							<Line1204POARecordingFeeBCC></Line1204POARecordingFeeBCC>
							<Line1205ConveyanceCharges></Line1205ConveyanceCharges>
							<Line1205ConveyanceChargesBCC></Line1205ConveyanceChargesBCC>
							<Line1206Desc></Line1206Desc>
							<Line1206></Line1206>
							<Line1206BCC></Line1206BCC>
							<Line1207Desc></Line1207Desc>
							<Line1207></Line1207>
							<Line1207BCC></Line1207BCC>
							<Line1208Desc></Line1208Desc>
							<Line1208></Line1208>
							<Line1208BCC></Line1208BCC>
							<Line1209Desc></Line1209Desc>
							<Line1209></Line1209>
							<Line1209BCC></Line1209BCC>
							<Line1210Desc></Line1210Desc>
							<Line1210></Line1210>
							<Line1210BCC></Line1210BCC>
						</GovernmentRecordingCharges>
						<AdditionalSettlementCharges>
							<Line1301SurveyToPaidTo></Line1301SurveyToPaidTo>
							<Line1301SurveyTo></Line1301SurveyTo>
							<Line1301SurveyToBCC></Line1301SurveyToBCC>
							<Line1302DelinquentUtilities></Line1302DelinquentUtilities>
							<Line1302DelinquentUtilitiesBCC></Line1302DelinquentUtilitiesBCC>
							<Line1303Desc></Line1303Desc>
							<Line1303></Line1303>
							<Line1303BCC></Line1303BCC>
							<Line1304Desc></Line1304Desc>
							<Line1304></Line1304>
							<Line1304BCC></Line1304BCC>
							<Line1305WireFee></Line1305WireFee>
							<Line1305WireFeeBCC></Line1305WireFeeBCC>
							<Line1306Desc></Line1306Desc>
							<Line1306></Line1306>
							<Line1306BCC></Line1306BCC>
							<Line1307BuyersPremiumBCC></Line1307BuyersPremiumBCC>
							<Line1308Desc></Line1308Desc>
							<Line1308></Line1308>
							<Line1308BCC></Line1308BCC>
							<Line1309Desc></Line1309Desc>
							<Line1309></Line1309>
							<Line1309BCC></Line1309BCC>
							<Line1310Desc></Line1310Desc>
							<Line1310></Line1310>
							<Line1310BCC></Line1310BCC>
							<Line1311Desc></Line1311Desc>
							<Line1311></Line1311>
							<Line1311BCC></Line1311BCC>
							<Line1312Desc></Line1312Desc>
							<Line1312></Line1312>
							<Line1312BCC></Line1312BCC>
						</AdditionalSettlementCharges>
					</SettlementCharges>  -->
				</HUDForm>
			</SupplyFinalHUDAndWaiver>
		</Order>
	</Body>
</Message>'>
    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Final HUD and Waiver sent to Equator', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="update_title">
			update Title
			set equator_hud_waiver_sent = 1
			where title_id = '#arguments.titleID#'
		</CFQUERY>

</cffunction>  

















<cffunction name="resendFinalHUDandWaiver" output="true">
<cfargument name="titleID" required="true">
<cfargument name="fname">
<cfargument name="lname">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="lookup_docs">
			select * from Doc_Closer_Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cfif lookup_transaction.hud_signed eq 1>
<cfset hud_is_signed = 'true'>
<cfelse>
<cfset hud_is_signed = 'false'>
</cfif>
<cfif lookup_transaction.waiver_signed eq 1>
<cfset waiver_is_signed = 'true'>
<cfelse>
<cfset waiver_is_signed = 'false'>
</cfif>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Final HUD and Waiver Sent::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_docs.final_HUD#', 'file')#" variable="M1">
<cfset base64_hud = ToBase64(m1)>

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_docs.waiver#', 'file')#" variable="M2">
<cfset base64_waiver = ToBase64(m2)>


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
		<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_closing_transactionID#">
			<ReSupplyFinalHUDAndWaiver>
				<FinalHUD name="#lookup_docs.final_HUD#" type="PDF">
					<Checksum>0</Checksum>
					<Payload>#base64_hud#</Payload>
				</FinalHUD>
				<WaiverAndReleaseForm name="#lookup_docs.waiver#" type="PDF">
					<Checksum>0</Checksum>
					<Payload>#base64_hud#</Payload>
				</WaiverAndReleaseForm>
				<IsFinalHUDSignedAndExecuted>#hud_is_signed#</IsFinalHUDSignedAndExecuted>
				<IsWaiverSignedAndExecuted>#waiver_is_signed#</IsWaiverSignedAndExecuted>
				<SettlementDate>2012-11-15</SettlementDate>
				<DisbursementDate>2012-11-15</DisbursementDate>
				<HUDForm>
		<!--			<SummaryOfSellerTransaction>
						<GrossAmountDueToSeller>
							<Line401ContractSalesPriceBCC></Line401ContractSalesPriceBCC>
							<Line402PersonalProperty></Line402PersonalProperty>
							<Line402PersonalPropertyBCC></Line402PersonalPropertyBCC>
							<Line403RentsFrom></Line403RentsFrom>
							<Line403RentsTo></Line403RentsTo>
							<Line403Rents></Line403Rents>
							<Line403RentsBCC></Line403RentsBCC>
							<Line404Desc></Line404Desc>
							<Line404></Line404>
							<Line404BCC></Line404BCC>
							<Line405Desc></Line405Desc>
							<Line405></Line405>
							<Line405BCC></Line405BCC>
							<Line406CityTownTaxesFrom></Line406CityTownTaxesFrom>
							<Line406CityTownTaxesTo></Line406CityTownTaxesTo>
							<Line406CityTownTaxes></Line406CityTownTaxes>
							<Line406CityTownTaxesBCC></Line406CityTownTaxesBCC>
							<Line407CountyTaxesFrom></Line407CountyTaxesFrom>
							<Line407CountyTaxesTo></Line407CountyTaxesTo>
							<Line407CountyTaxes></Line407CountyTaxes>
							<Line407CountyTaxesBCC></Line407CountyTaxesBCC>
							<Line408HOADuesFrom></Line408HOADuesFrom>
							<Line408HOADuesTo></Line408HOADuesTo>
							<Line408HOADues></Line408HOADues>
							<Line408HOADuesBCC></Line408HOADuesBCC>
							<Line409HOADuesFrom></Line409HOADuesFrom>
							<Line409HOADuesTo></Line409HOADuesTo>
							<Line409HOADues></Line409HOADues>
							<Line409HOADuesBCC></Line409HOADuesBCC>
							<Line410AssessmentsFrom></Line410AssessmentsFrom>
							<Line410AssessmentsTo></Line410AssessmentsTo>
							<Line410Assessments></Line410Assessments>
							<Line410AssessmentsBCC></Line410AssessmentsBCC>
							<Line411OfferPerDiemBCC></Line411OfferPerDiemBCC>
							<Line412Desc></Line412Desc>
							<Line412></Line412>
							<Line412BCC></Line412BCC>
							<Line413Desc></Line413Desc>
							<Line413></Line413>
							<Line413BCC></Line413BCC>
							<Line414Desc></Line414Desc>
							<Line414></Line414>
							<Line414BCC></Line414BCC>
							<Line415Desc></Line415Desc>
							<Line415></Line415>
							<Line415BCC></Line415BCC>
							<Line416Desc></Line416Desc>
							<Line416></Line416>
							<Line416BCC></Line416BCC>
							<Line417Desc></Line417Desc>
							<Line417></Line417>
							<Line417BCC></Line417BCC>
							<Line418Desc></Line418Desc>
							<Line418></Line418>
							<Line418BCC></Line418BCC>
						</GrossAmountDueToSeller>
						<ReductionInAmountDueToSeller>
							<Line501Amount></Line501Amount>
							<Line501AmountBCC></Line501AmountBCC>
							<Line502SettlementChargesToSellerBCC></Line502SettlementChargesToSellerBCC>
							<Line503ExistingLoanTakenSubjectToDesc></Line503ExistingLoanTakenSubjectToDesc>
							<Line503ExistingLoanTakenSubjectTo></Line503ExistingLoanTakenSubjectTo>
							<Line503ExistingLoanTakenSubjectToBCC></Line503ExistingLoanTakenSubjectToBCC>
							<Line504PayoffOfFirstMortgageLoan></Line504PayoffOfFirstMortgageLoan>
							<Line504PayoffOfFirstMortgageLoanBCC></Line504PayoffOfFirstMortgageLoanBCC>
							<Line505PayoffOfSecondMortgageLoan></Line505PayoffOfSecondMortgageLoan>
							<Line505PayoffOfSecondMortgageLoanBCC></Line505PayoffOfSecondMortgageLoanBCC>
							<Line506Desc></Line506Desc>
							<Line506></Line506>
							<Line506BCC></Line506BCC>
							<Line507></Line507>
							<Line507Desc></Line507Desc>
							<Line507BCC></Line507BCC>
							<Line508></Line508>
							<Line508Desc></Line508Desc>
							<Line508BCC></Line508BCC>
							<Line509></Line509>
							<Line509Desc></Line509Desc>
							<Line509BCC></Line509BCC>
							<Line510CityTownTaxesFromDate></Line510CityTownTaxesFromDate>
							<Line510CityTownTaxesToDate></Line510CityTownTaxesToDate>
							<Line510CityTownTaxes></Line510CityTownTaxes>
							<Line510CityTownTaxesBCC></Line510CityTownTaxesBCC>
							<Line511CountyTaxesFromDate></Line511CountyTaxesFromDate>
							<Line511CountyTaxesToDate></Line511CountyTaxesToDate>
							<Line511CountyTaxes></Line511CountyTaxes>
							<Line511CountyTaxesBCC></Line511CountyTaxesBCC>
							<Line512SchoolTaxesFromDate></Line512SchoolTaxesFromDate>
							<Line512SchoolTaxesToDate></Line512SchoolTaxesToDate>
							<Line512SchoolTaxes></Line512SchoolTaxes>
							<Line512SchoolTaxesBCC></Line512SchoolTaxesBCC>
							<Line513Desc></Line513Desc>
							<Line513></Line513>
							<Line513BCC></Line513BCC>
		<Line514DelinquentTaxes>14.12</Line514DelinquentTaxes>					<Line514DelinquentTaxesBCC></Line514DelinquentTaxesBCC>
							<Line515SpecialAssessmentsFromDate></Line515SpecialAssessmentsFromDate>
							<Line515SpecialAssessmentsToDate></Line515SpecialAssessmentsToDate>
							<Line515SpecialAssessments></Line515SpecialAssessments>
							<Line515SpecialAssessmentsBCC></Line515SpecialAssessmentsBCC>
							<Line516DelinquentSpecialAssessmentsFromDate></Line516DelinquentSpecialAssessmentsFromDate>
							<Line516DelinquentSpecialAssessmentsToDate></Line516DelinquentSpecialAssessmentsToDate>
							<Line516DelinquentSpecialAssessments></Line516DelinquentSpecialAssessments>
							<Line516DelinquentSpecialAssessmentsBCC></Line516DelinquentSpecialAssessmentsBCC>
							<Line517HOADuesFromDate></Line517HOADuesFromDate>
							<Line517HOADuesToDate></Line517HOADuesToDate>
							<Line517HOADues></Line517HOADues>
							<Line517HOADuesBCC></Line517HOADuesBCC>
		<Line518TotalDelinquentHOA>112.12</Line518TotalDelinquentHOA>					<Line518TotalDelinquentHOABCC></Line518TotalDelinquentHOABCC>
							<Line519Desc></Line519Desc>
							<Line519></Line519>
							<Line519BCC></Line519BCC>
						</ReductionInAmountDueToSeller>
					</SummaryOfSellerTransaction>
					<SettlementCharges>
						<TotalCommission>
							<Line704ListingAgentBonus></Line704ListingAgentBonus>
							<Line705SellingAgentBonus></Line705SellingAgentBonus>
							<Line706Desc></Line706Desc>
							<Line706></Line706>
							<Line707Desc></Line707Desc>
							<Line707></Line707>
						</TotalCommission>
						<ItemsPayableInConnectionWithLoan>
							<Line801LoanOriginationFee></Line801LoanOriginationFee>
							<Line801LoanOriginationFeeBCC></Line801LoanOriginationFeeBCC>
							<Line802LoanDiscount></Line802LoanDiscount>
							<Line802LoanDiscountBCC></Line802LoanDiscountBCC>
							<Line803AppraisalFee></Line803AppraisalFee>
							<Line803AppraisalFeeBCC></Line803AppraisalFeeBCC>
							<Line804CreditReport></Line804CreditReport>
							<Line804CreditReportBCC></Line804CreditReportBCC>
							<Line805Desc></Line805Desc>
							<Line805></Line805>
							<Line805BCC></Line805BCC>
							<Line806Desc></Line806Desc>
							<Line806></Line806>
							<Line806BCC></Line806BCC>
							<Line807Desc></Line807Desc>
							<Line807></Line807>
							<Line807BCC></Line807BCC>
							<Line808Desc></Line808Desc>
							<Line808></Line808>
							<Line808BCC></Line808BCC>
							<Line809Desc></Line809Desc>
							<Line809></Line809>
							<Line809BCC></Line809BCC>
							<Line810Desc></Line810Desc>
							<Line810></Line810>
							<Line810BCC></Line810BCC>
							<Line811Desc></Line811Desc>
							<Line811></Line811>
							<Line811BCC></Line811BCC>
						</ItemsPayableInConnectionWithLoan>
						<ItemsRequiredByLenderPaidInAdvance>
							<Line901Interest></Line901Interest>
							<Line901InterestBCC></Line901InterestBCC>
							<Line902MortgageInsurancePremium></Line902MortgageInsurancePremium>
							<Line902MortgageInsurancePremiumBCC></Line902MortgageInsurancePremiumBCC>
							<Line903HazardInsurance></Line903HazardInsurance>
							<Line903HazardInsuranceBCC></Line903HazardInsuranceBCC>
							<Line904Desc></Line904Desc>
							<Line904></Line904>
							<Line904BCC></Line904BCC>
							<Line905Desc></Line905Desc>
							<Line905></Line905>
							<Line905BCC></Line905BCC>
						</ItemsRequiredByLenderPaidInAdvance>
						<ReservesDepositedWithLender>
							<Line1001HazardInsurance></Line1001HazardInsurance>
							<Line1001HazardInsuranceBCC></Line1001HazardInsuranceBCC>
							<Line1002MortgageInsurance></Line1002MortgageInsurance>
							<Line1002MortgageInsuranceBCC></Line1002MortgageInsuranceBCC>
							<Line1003CityPropertyTaxes></Line1003CityPropertyTaxes>
							<Line1003CityPropertyTaxesBCC></Line1003CityPropertyTaxesBCC>
							<Line1004CountyPropertyTaxes></Line1004CountyPropertyTaxes>
							<Line1004CountyPropertyTaxesBCC></Line1004CountyPropertyTaxesBCC>
							<Line1005AnnualAssessments></Line1005AnnualAssessments>
							<Line1005AnnualAssessmentsBCC></Line1005AnnualAssessmentsBCC>
							<Line1006Desc></Line1006Desc>
							<Line1006></Line1006>
							<Line1006BCC></Line1006BCC>
							<Line1007Desc></Line1007Desc>
							<Line1007></Line1007>
							<Line1007BCC></Line1007BCC>
							<Line1008Desc></Line1008Desc>
							<Line1008></Line1008>
							<Line1008BCC></Line1008BCC>
							<Line1011AggregateAdjustment></Line1011AggregateAdjustment>
							<Line1011AggregateAdjustmentBCC></Line1011AggregateAdjustmentBCC>
						</ReservesDepositedWithLender>
						<TitleCharges>
							<Line1101SettlementFeePaymentTo></Line1101SettlementFeePaymentTo>
							<Line1101SettlementFee></Line1101SettlementFee>
							<Line1101SettlementFeeBCC></Line1101SettlementFeeBCC>
							<Line1102AbstractToPaymentTo></Line1102AbstractToPaymentTo>
							<Line1102AbstractTo></Line1102AbstractTo>
							<Line1102AbstractToBCC></Line1102AbstractToBCC>
							<Line1103TitleExaminationToPaymentTo></Line1103TitleExaminationToPaymentTo>
							<Line1103TitleExaminationTo></Line1103TitleExaminationTo>
							<Line1103TitleExaminationToBCC></Line1103TitleExaminationToBCC>
							<Line1104TitleInsuranceBinderToPaymentTo></Line1104TitleInsuranceBinderToPaymentTo>
							<Line1104TitleInsuranceBinderTo></Line1104TitleInsuranceBinderTo>
							<Line1104TitleInsuranceBinderToBCC></Line1104TitleInsuranceBinderToBCC>
							<Line1105DocumentPreparationToPaymentTo></Line1105DocumentPreparationToPaymentTo>
							<Line1105DocumentPreparationTo></Line1105DocumentPreparationTo>
							<Line1105DocumentPreparationToBCC></Line1105DocumentPreparationToBCC>
							<Line1106NotaryFeesToPaymentTo></Line1106NotaryFeesToPaymentTo>
							<Line1106NotaryFeesTo></Line1106NotaryFeesTo>
							<Line1106NotaryFeesToBCC></Line1106NotaryFeesToBCC>
							<Line1107AttorneyFeesToPaymentTo></Line1107AttorneyFeesToPaymentTo>
							<Line1107AttorneyFeesTo></Line1107AttorneyFeesTo>
							<Line1107AttorneyFeesToBCC></Line1107AttorneyFeesToBCC>
							<Line1108TitleInsuranceToPaymentTo></Line1108TitleInsuranceToPaymentTo>
							<Line1108TitleInsuranceTo></Line1108TitleInsuranceTo>
							<Line1108TitleInsuranceToBCC></Line1108TitleInsuranceToBCC>
							<Line1109LendersCoveragePolicyAmount></Line1109LendersCoveragePolicyAmount>
							<Line1109LendersCoveragePolicyCost></Line1109LendersCoveragePolicyCost>
							<Line1109LendersCoverage></Line1109LendersCoverage>
							<Line1109LendersCoverageBCC></Line1109LendersCoverageBCC>
							<Line1110OwnersCoveragePolicyAmount></Line1110OwnersCoveragePolicyAmount>
							<Line1110OwnersCoveragePolicyCost></Line1110OwnersCoveragePolicyCost>
							<Line1110OwnersCoverage></Line1110OwnersCoverage>
							<Line1110OwnersCoverageBCC></Line1110OwnersCoverageBCC>
							<Line1111OutstandingLiens></Line1111OutstandingLiens>
							<Line1111OutstandingLiensBCC></Line1111OutstandingLiensBCC>
							<Line1112SellerRepresentationFeePaymentTo></Line1112SellerRepresentationFeePaymentTo>
							<Line1112SellerRepresentationFee></Line1112SellerRepresentationFee>
							<Line1112SellerRepresentationFeeBCC></Line1112SellerRepresentationFeeBCC>
							<Line1113ForeclosureCosts></Line1113ForeclosureCosts>
							<Line1113ForeclosureCostsBCC></Line1113ForeclosureCostsBCC>
							<Line1114LandRent></Line1114LandRent>
							<Line1114LandRentBCC></Line1114LandRentBCC>
							<Line1115OutstandingLiens></Line1115OutstandingLiens>
							<Line1115OutstandingLiensBCC></Line1115OutstandingLiensBCC>
							<Line1116Desc></Line1116Desc>
							<Line1116></Line1116>
							<Line1116BCC></Line1116BCC>
							<Line1117Desc></Line1117Desc>
							<Line1117></Line1117>
							<Line1117BCC></Line1117BCC>
							<Line1118Desc></Line1118Desc>
							<Line1118></Line1118>
							<Line1118BCC></Line1118BCC>
						</TitleCharges>
						<GovernmentRecordingCharges>
							<Line1201RecordingFeesDeed></Line1201RecordingFeesDeed>
							<Line1201RecordingFeesMortgage></Line1201RecordingFeesMortgage>
							<Line1201RecordingFeesRelease></Line1201RecordingFeesRelease>
							<Line1201RecordingFees></Line1201RecordingFees>
							<Line1201RecordingFeesBCC></Line1201RecordingFeesBCC>
							<Line1202CityCountyTaxStamps></Line1202CityCountyTaxStamps>
							<Line1202CityCountyTaxStampsDeed></Line1202CityCountyTaxStampsDeed>
							<Line1202CityCountyTaxStampsMortgage></Line1202CityCountyTaxStampsMortgage>
							<Line1202CityCountyTaxStampsBCC></Line1202CityCountyTaxStampsBCC>
							<Line1203StateTaxStamps></Line1203StateTaxStamps>
							<Line1203StateTaxStampsDeed></Line1203StateTaxStampsDeed>
							<Line1203StateTaxStampsMortgage></Line1203StateTaxStampsMortgage>
							<Line1203StateTaxStampsBCC></Line1203StateTaxStampsBCC>
							<Line1204POARecordingFee></Line1204POARecordingFee>
							<Line1204POARecordingFeeBCC></Line1204POARecordingFeeBCC>
							<Line1205ConveyanceCharges></Line1205ConveyanceCharges>
							<Line1205ConveyanceChargesBCC></Line1205ConveyanceChargesBCC>
							<Line1206Desc></Line1206Desc>
							<Line1206></Line1206>
							<Line1206BCC></Line1206BCC>
							<Line1207Desc></Line1207Desc>
							<Line1207></Line1207>
							<Line1207BCC></Line1207BCC>
							<Line1208Desc></Line1208Desc>
							<Line1208></Line1208>
							<Line1208BCC></Line1208BCC>
							<Line1209Desc></Line1209Desc>
							<Line1209></Line1209>
							<Line1209BCC></Line1209BCC>
							<Line1210Desc></Line1210Desc>
							<Line1210></Line1210>
							<Line1210BCC></Line1210BCC>
						</GovernmentRecordingCharges>
						<AdditionalSettlementCharges>
							<Line1301SurveyToPaidTo></Line1301SurveyToPaidTo>
							<Line1301SurveyTo></Line1301SurveyTo>
							<Line1301SurveyToBCC></Line1301SurveyToBCC>
							<Line1302DelinquentUtilities></Line1302DelinquentUtilities>
							<Line1302DelinquentUtilitiesBCC></Line1302DelinquentUtilitiesBCC>
							<Line1303Desc></Line1303Desc>
							<Line1303></Line1303>
							<Line1303BCC></Line1303BCC>
							<Line1304Desc></Line1304Desc>
							<Line1304></Line1304>
							<Line1304BCC></Line1304BCC>
							<Line1305WireFee></Line1305WireFee>
							<Line1305WireFeeBCC></Line1305WireFeeBCC>
							<Line1306Desc></Line1306Desc>
							<Line1306></Line1306>
							<Line1306BCC></Line1306BCC>
							<Line1307BuyersPremiumBCC></Line1307BuyersPremiumBCC>
							<Line1308Desc></Line1308Desc>
							<Line1308></Line1308>
							<Line1308BCC></Line1308BCC>
							<Line1309Desc></Line1309Desc>
							<Line1309></Line1309>
							<Line1309BCC></Line1309BCC>
							<Line1310Desc></Line1310Desc>
							<Line1310></Line1310>
							<Line1310BCC></Line1310BCC>
							<Line1311Desc></Line1311Desc>
							<Line1311></Line1311>
							<Line1311BCC></Line1311BCC>
							<Line1312Desc></Line1312Desc>
							<Line1312></Line1312>
							<Line1312BCC></Line1312BCC>
						</AdditionalSettlementCharges>
					</SettlementCharges>   -->
				</HUDForm>
			</ReSupplyFinalHUDAndWaiver>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Final HUD and Waiver re-sent to Equator', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="update_title">
			update Title
			set equator_hud_waiver_sent = 1
			where title_id = '#arguments.titleID#'
		</CFQUERY>

</cffunction>  



<cffunction name="sendWireConfirmation" output="true">
<cfargument name="titleID" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>


		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleid#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Wire Confirmation SENT::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">
<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_closing_transactionID#">
			<WireConfirmation>
				<WireConfirmationNumber>#lookup_transaction.wire_conf_number#</WireConfirmationNumber>
				<Comments>#lookup_transaction.wire_conf_comments#</Comments>
			</WireConfirmation>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Wire Confirmation sent to Equator: Conf: ## #lookup_transaction.wire_conf_number#; Comments: #lookup_transaction.wire_conf_comments#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>




<cffunction name="sendReportTitleIssue" output="true">
<cfargument name="titleID" required="true">
<cfargument name="issue" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>


		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleid#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Report Title Issue SENT::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">
<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="NEW_DELIVERABLE" transactionID="#lookup_transaction.equator_closing_transactionID#">
			<ReportTitleIssue>
				<Comments>#arguments.issue#</Comments>
			</ReportTitleIssue>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Report Title Issue sent to Equator: #arguments.issue#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>






<cffunction name="sendReportClosingDelay" output="true">
<cfargument name="titleID" required="true">
<cfargument name="issue" required="true">
<cfargument name="code" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>


		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleid#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Report Closing Delay SENT::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">
<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="NEW_DELIVERABLE" transactionID="#lookup_transaction.equator_closing_transactionID#">
            <ReportClosingDelay>
				<DelayCode>#arguments.code#</DelayCode>
				<Comments>#arguments.issue#</Comments>
			</ReportClosingDelay>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Report Closing Delay sent to Equator: #arguments.code# - #arguments.issue#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>











<cffunction name="sendConfirmClosing" output="true">
<cfargument name="titleID" required="true">
<cfargument name="issue" required="true">
<cfargument name="code" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleid#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Confirm Closing  SENT::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">

<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_closing_transactionID#">
			<ConfirmClosing>
				<ClosingOccured>#lookup_transaction.closing_occurred#</ClosingOccured>
				'>
				
				<cfif Len(lookup_transaction.new_hud_closing_date)>
				<cfset send_xml = send_xml & '<NewEstimatedHUDClosingDate>#DateFormat(lookup_transaction.new_hud_closing_date, "yyyy-mm-dd")#</NewEstimatedHUDClosingDate>
				'>
			    </cfif>
				
				<cfset send_xml = send_xml & '<HaveDocumentsBeenRecorded>#lookup_transaction.documents_recorded#</HaveDocumentsBeenRecorded>
				'>
				
				
				<cfif Len(lookup_transaction.delay_code)>
				<cfset send_xml = send_xml & '<DelayCode>#lookup_transaction.delay_code#</DelayCode>
				'>
			    </cfif>
				
				<cfset send_xml = send_xml & '<Comments>#lookup_transaction.confirm_closing_comments#</Comments>
			</ConfirmClosing>
		</Order>
	</Body>
</Message>
'>

    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Confirm Closing sent to Equator: #arguments.code# - #arguments.issue#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>






<cffunction name="sendResolveHUDShortage" output="true">
<cfargument name="titleID" required="true">
<cfargument name="issue" required="true">
<cfargument name="resolve_method" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="lookup_docs">
			select * from Doc_Closer_Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Resolve HUD Shortage SENT::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_docs.final_HUD#', 'file')#" variable="M1">
<cfset base64_hud = ToBase64(m1)>

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_docs.waiver#', 'file')#" variable="M2">
<cfset base64_waiver = ToBase64(m2)>


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_closing_transactionID#">
			<ResolveHUDShortage>
				<ShortfallResolution>#arguments.resolve_method#</ShortfallResolution>
				<Comments>#arguments.issue#</Comments>
				<FinalHUD name="#lookup_docs.final_HUD#" type="PDF">
					<Checksum>0</Checksum>
					<Payload>#base64_hud#</Payload>
				</FinalHUD>
				<WaiverAndReleaseForm name="#lookup_docs.waiver#" type="PDF">
					<Checksum>0</Checksum>
					<Payload>#base64_hud#</Payload>
				</WaiverAndReleaseForm>
				<SettlementDate>2013-01-01</SettlementDate>
				<DisbursementDate>2013-01-01</DisbursementDate>
				<HUDForm>
		<!--			<SummaryOfSellerTransaction>
						<GrossAmountDueToSeller>
							<Line401ContractSalesPriceBCC></Line401ContractSalesPriceBCC>
							<Line402PersonalProperty></Line402PersonalProperty>
							<Line402PersonalPropertyBCC></Line402PersonalPropertyBCC>
							<Line403RentsFrom></Line403RentsFrom>
							<Line403RentsTo></Line403RentsTo>
							<Line403Rents></Line403Rents>
							<Line403RentsBCC></Line403RentsBCC>
							<Line404Desc></Line404Desc>
							<Line404></Line404>
							<Line404BCC></Line404BCC>
							<Line405Desc></Line405Desc>
							<Line405></Line405>
							<Line405BCC></Line405BCC>
							<Line406CityTownTaxesFrom></Line406CityTownTaxesFrom>
							<Line406CityTownTaxesTo></Line406CityTownTaxesTo>
							<Line406CityTownTaxes></Line406CityTownTaxes>
							<Line406CityTownTaxesBCC></Line406CityTownTaxesBCC>
							<Line407CountyTaxesFrom></Line407CountyTaxesFrom>
							<Line407CountyTaxesTo></Line407CountyTaxesTo>
							<Line407CountyTaxes></Line407CountyTaxes>
							<Line407CountyTaxesBCC></Line407CountyTaxesBCC>
							<Line408HOADuesFrom></Line408HOADuesFrom>
							<Line408HOADuesTo></Line408HOADuesTo>
							<Line408HOADues></Line408HOADues>
							<Line408HOADuesBCC></Line408HOADuesBCC>
							<Line409HOADuesFrom></Line409HOADuesFrom>
							<Line409HOADuesTo></Line409HOADuesTo>
							<Line409HOADues></Line409HOADues>
							<Line409HOADuesBCC></Line409HOADuesBCC>
							<Line410AssessmentsFrom></Line410AssessmentsFrom>
							<Line410AssessmentsTo></Line410AssessmentsTo>
							<Line410Assessments></Line410Assessments>
							<Line410AssessmentsBCC></Line410AssessmentsBCC>
							<Line411OfferPerDiemBCC></Line411OfferPerDiemBCC>
							<Line412Desc></Line412Desc>
							<Line412></Line412>
							<Line412BCC></Line412BCC>
							<Line413Desc></Line413Desc>
							<Line413></Line413>
							<Line413BCC></Line413BCC>
							<Line414Desc></Line414Desc>
							<Line414></Line414>
							<Line414BCC></Line414BCC>
							<Line415Desc></Line415Desc>
							<Line415></Line415>
							<Line415BCC></Line415BCC>
							<Line416Desc></Line416Desc>
							<Line416></Line416>
							<Line416BCC></Line416BCC>
							<Line417Desc></Line417Desc>
							<Line417></Line417>
							<Line417BCC></Line417BCC>
							<Line418Desc></Line418Desc>
							<Line418></Line418>
							<Line418BCC></Line418BCC>
						</GrossAmountDueToSeller>
						<ReductionInAmountDueToSeller>
							<Line501Amount></Line501Amount>
							<Line501AmountBCC></Line501AmountBCC>
							<Line502SettlementChargesToSellerBCC></Line502SettlementChargesToSellerBCC>
							<Line503ExistingLoanTakenSubjectToDesc></Line503ExistingLoanTakenSubjectToDesc>
							<Line503ExistingLoanTakenSubjectTo></Line503ExistingLoanTakenSubjectTo>
							<Line503ExistingLoanTakenSubjectToBCC></Line503ExistingLoanTakenSubjectToBCC>
							<Line504PayoffOfFirstMortgageLoan></Line504PayoffOfFirstMortgageLoan>
							<Line504PayoffOfFirstMortgageLoanBCC></Line504PayoffOfFirstMortgageLoanBCC>
							<Line505PayoffOfSecondMortgageLoan></Line505PayoffOfSecondMortgageLoan>
							<Line505PayoffOfSecondMortgageLoanBCC></Line505PayoffOfSecondMortgageLoanBCC>
							<Line506Desc></Line506Desc>
							<Line506></Line506>
							<Line506BCC></Line506BCC>
							<Line507></Line507>
							<Line507Desc></Line507Desc>
							<Line507BCC></Line507BCC>
							<Line508></Line508>
							<Line508Desc></Line508Desc>
							<Line508BCC></Line508BCC>
							<Line509></Line509>
							<Line509Desc></Line509Desc>
							<Line509BCC></Line509BCC>
							<Line510CityTownTaxesFromDate></Line510CityTownTaxesFromDate>
							<Line510CityTownTaxesToDate></Line510CityTownTaxesToDate>
							<Line510CityTownTaxes></Line510CityTownTaxes>
							<Line510CityTownTaxesBCC></Line510CityTownTaxesBCC>
							<Line511CountyTaxesFromDate></Line511CountyTaxesFromDate>
							<Line511CountyTaxesToDate></Line511CountyTaxesToDate>
							<Line511CountyTaxes></Line511CountyTaxes>
							<Line511CountyTaxesBCC></Line511CountyTaxesBCC>
							<Line512SchoolTaxesFromDate></Line512SchoolTaxesFromDate>
							<Line512SchoolTaxesToDate></Line512SchoolTaxesToDate>
							<Line512SchoolTaxes></Line512SchoolTaxes>
							<Line512SchoolTaxesBCC></Line512SchoolTaxesBCC>
							<Line513Desc></Line513Desc>
							<Line513></Line513>
							<Line513BCC></Line513BCC>
							<Line514DelinquentTaxes>123.12</Line514DelinquentTaxes>				
							<Line514DelinquentTaxesBCC></Line514DelinquentTaxesBCC>
							<Line515SpecialAssessmentsFromDate></Line515SpecialAssessmentsFromDate>
							<Line515SpecialAssessmentsToDate></Line515SpecialAssessmentsToDate>
							<Line515SpecialAssessments></Line515SpecialAssessments>
							<Line515SpecialAssessmentsBCC></Line515SpecialAssessmentsBCC>
							<Line516DelinquentSpecialAssessmentsFromDate></Line516DelinquentSpecialAssessmentsFromDate>
							<Line516DelinquentSpecialAssessmentsToDate></Line516DelinquentSpecialAssessmentsToDate>
							<Line516DelinquentSpecialAssessments></Line516DelinquentSpecialAssessments>
							<Line516DelinquentSpecialAssessmentsBCC></Line516DelinquentSpecialAssessmentsBCC>
							<Line517HOADuesFromDate></Line517HOADuesFromDate>
							<Line517HOADuesToDate></Line517HOADuesToDate>
							<Line517HOADues></Line517HOADues>
							<Line517HOADuesBCC></Line517HOADuesBCC>
	<Line518TotalDelinquentHOA>154.23</Line518TotalDelinquentHOA>						<Line518TotalDelinquentHOABCC></Line518TotalDelinquentHOABCC>
							<Line519Desc></Line519Desc>
							<Line519></Line519>
							<Line519BCC></Line519BCC>
						</ReductionInAmountDueToSeller>
					</SummaryOfSellerTransaction>
					<SettlementCharges>
						<TotalCommission>
							<Line704ListingAgentBonus></Line704ListingAgentBonus>
							<Line705SellingAgentBonus></Line705SellingAgentBonus>
							<Line706Desc></Line706Desc>
							<Line706></Line706>
							<Line707Desc></Line707Desc>
							<Line707></Line707>
						</TotalCommission>
						<ItemsPayableInConnectionWithLoan>
							<Line801LoanOriginationFee></Line801LoanOriginationFee>
							<Line801LoanOriginationFeeBCC></Line801LoanOriginationFeeBCC>
							<Line802LoanDiscount></Line802LoanDiscount>
							<Line802LoanDiscountBCC></Line802LoanDiscountBCC>
							<Line803AppraisalFee></Line803AppraisalFee>
							<Line803AppraisalFeeBCC></Line803AppraisalFeeBCC>
							<Line804CreditReport></Line804CreditReport>
							<Line804CreditReportBCC></Line804CreditReportBCC>
							<Line805Desc></Line805Desc>
							<Line805></Line805>
							<Line805BCC></Line805BCC>
							<Line806Desc></Line806Desc>
							<Line806></Line806>
							<Line806BCC></Line806BCC>
							<Line807Desc></Line807Desc>
							<Line807></Line807>
							<Line807BCC></Line807BCC>
							<Line808Desc></Line808Desc>
							<Line808></Line808>
							<Line808BCC></Line808BCC>
							<Line809Desc></Line809Desc>
							<Line809></Line809>
							<Line809BCC></Line809BCC>
							<Line810Desc></Line810Desc>
							<Line810></Line810>
							<Line810BCC></Line810BCC>
							<Line811Desc></Line811Desc>
							<Line811></Line811>
							<Line811BCC></Line811BCC>
						</ItemsPayableInConnectionWithLoan>
						<ItemsRequiredByLenderPaidInAdvance>
							<Line901Interest></Line901Interest>
							<Line901InterestBCC></Line901InterestBCC>
							<Line902MortgageInsurancePremium></Line902MortgageInsurancePremium>
							<Line902MortgageInsurancePremiumBCC></Line902MortgageInsurancePremiumBCC>
							<Line903HazardInsurance></Line903HazardInsurance>
							<Line903HazardInsuranceBCC></Line903HazardInsuranceBCC>
							<Line904Desc></Line904Desc>
							<Line904></Line904>
							<Line904BCC></Line904BCC>
							<Line905Desc></Line905Desc>
							<Line905></Line905>
							<Line905BCC></Line905BCC>
						</ItemsRequiredByLenderPaidInAdvance>
						<ReservesDepositedWithLender>
							<Line1001HazardInsurance></Line1001HazardInsurance>
							<Line1001HazardInsuranceBCC></Line1001HazardInsuranceBCC>
							<Line1002MortgageInsurance></Line1002MortgageInsurance>
							<Line1002MortgageInsuranceBCC></Line1002MortgageInsuranceBCC>
							<Line1003CityPropertyTaxes></Line1003CityPropertyTaxes>
							<Line1003CityPropertyTaxesBCC></Line1003CityPropertyTaxesBCC>
							<Line1004CountyPropertyTaxes></Line1004CountyPropertyTaxes>
							<Line1004CountyPropertyTaxesBCC></Line1004CountyPropertyTaxesBCC>
							<Line1005AnnualAssessments></Line1005AnnualAssessments>
							<Line1005AnnualAssessmentsBCC></Line1005AnnualAssessmentsBCC>
							<Line1006Desc></Line1006Desc>
							<Line1006></Line1006>
							<Line1006BCC></Line1006BCC>
							<Line1007Desc></Line1007Desc>
							<Line1007></Line1007>
							<Line1007BCC></Line1007BCC>
							<Line1008Desc></Line1008Desc>
							<Line1008></Line1008>
							<Line1008BCC></Line1008BCC>
							<Line1011AggregateAdjustment></Line1011AggregateAdjustment>
							<Line1011AggregateAdjustmentBCC></Line1011AggregateAdjustmentBCC>
						</ReservesDepositedWithLender>
						<TitleCharges>
							<Line1101SettlementFeePaymentTo></Line1101SettlementFeePaymentTo>
							<Line1101SettlementFee></Line1101SettlementFee>
							<Line1101SettlementFeeBCC></Line1101SettlementFeeBCC>
							<Line1102AbstractToPaymentTo></Line1102AbstractToPaymentTo>
							<Line1102AbstractTo></Line1102AbstractTo>
							<Line1102AbstractToBCC></Line1102AbstractToBCC>
							<Line1103TitleExaminationToPaymentTo></Line1103TitleExaminationToPaymentTo>
							<Line1103TitleExaminationTo></Line1103TitleExaminationTo>
							<Line1103TitleExaminationToBCC></Line1103TitleExaminationToBCC>
							<Line1104TitleInsuranceBinderToPaymentTo></Line1104TitleInsuranceBinderToPaymentTo>
							<Line1104TitleInsuranceBinderTo></Line1104TitleInsuranceBinderTo>
							<Line1104TitleInsuranceBinderToBCC></Line1104TitleInsuranceBinderToBCC>
							<Line1105DocumentPreparationToPaymentTo></Line1105DocumentPreparationToPaymentTo>
							<Line1105DocumentPreparationTo></Line1105DocumentPreparationTo>
							<Line1105DocumentPreparationToBCC></Line1105DocumentPreparationToBCC>
							<Line1106NotaryFeesToPaymentTo></Line1106NotaryFeesToPaymentTo>
							<Line1106NotaryFeesTo></Line1106NotaryFeesTo>
							<Line1106NotaryFeesToBCC></Line1106NotaryFeesToBCC>
							<Line1107AttorneyFeesToPaymentTo></Line1107AttorneyFeesToPaymentTo>
							<Line1107AttorneyFeesTo></Line1107AttorneyFeesTo>
							<Line1107AttorneyFeesToBCC></Line1107AttorneyFeesToBCC>
							<Line1108TitleInsuranceToPaymentTo></Line1108TitleInsuranceToPaymentTo>
							<Line1108TitleInsuranceTo></Line1108TitleInsuranceTo>
							<Line1108TitleInsuranceToBCC></Line1108TitleInsuranceToBCC>
							<Line1109LendersCoveragePolicyAmount></Line1109LendersCoveragePolicyAmount>
							<Line1109LendersCoveragePolicyCost></Line1109LendersCoveragePolicyCost>
							<Line1109LendersCoverage></Line1109LendersCoverage>
							<Line1109LendersCoverageBCC></Line1109LendersCoverageBCC>
							<Line1110OwnersCoveragePolicyAmount></Line1110OwnersCoveragePolicyAmount>
							<Line1110OwnersCoveragePolicyCost></Line1110OwnersCoveragePolicyCost>
							<Line1110OwnersCoverage></Line1110OwnersCoverage>
							<Line1110OwnersCoverageBCC></Line1110OwnersCoverageBCC>
							<Line1111OutstandingLiens></Line1111OutstandingLiens>
							<Line1111OutstandingLiensBCC></Line1111OutstandingLiensBCC>
							<Line1112SellerRepresentationFeePaymentTo></Line1112SellerRepresentationFeePaymentTo>
							<Line1112SellerRepresentationFee></Line1112SellerRepresentationFee>
							<Line1112SellerRepresentationFeeBCC></Line1112SellerRepresentationFeeBCC>
							<Line1113ForeclosureCosts></Line1113ForeclosureCosts>
							<Line1113ForeclosureCostsBCC></Line1113ForeclosureCostsBCC>
							<Line1114LandRent></Line1114LandRent>
							<Line1114LandRentBCC></Line1114LandRentBCC>
							<Line1115OutstandingLiens></Line1115OutstandingLiens>
							<Line1115OutstandingLiensBCC></Line1115OutstandingLiensBCC>
							<Line1116Desc></Line1116Desc>
							<Line1116></Line1116>
							<Line1116BCC></Line1116BCC>
							<Line1117Desc></Line1117Desc>
							<Line1117></Line1117>
							<Line1117BCC></Line1117BCC>
							<Line1118Desc></Line1118Desc>
							<Line1118></Line1118>
							<Line1118BCC></Line1118BCC>
						</TitleCharges>
						<GovernmentRecordingCharges>
							<Line1201RecordingFeesDeed></Line1201RecordingFeesDeed>
							<Line1201RecordingFeesMortgage></Line1201RecordingFeesMortgage>
							<Line1201RecordingFeesRelease></Line1201RecordingFeesRelease>
							<Line1201RecordingFees></Line1201RecordingFees>
							<Line1201RecordingFeesBCC></Line1201RecordingFeesBCC>
							<Line1202CityCountyTaxStamps></Line1202CityCountyTaxStamps>
							<Line1202CityCountyTaxStampsDeed></Line1202CityCountyTaxStampsDeed>
							<Line1202CityCountyTaxStampsMortgage></Line1202CityCountyTaxStampsMortgage>
							<Line1202CityCountyTaxStampsBCC></Line1202CityCountyTaxStampsBCC>
							<Line1203StateTaxStamps></Line1203StateTaxStamps>
							<Line1203StateTaxStampsDeed></Line1203StateTaxStampsDeed>
							<Line1203StateTaxStampsMortgage></Line1203StateTaxStampsMortgage>
							<Line1203StateTaxStampsBCC></Line1203StateTaxStampsBCC>
							<Line1204POARecordingFee></Line1204POARecordingFee>
							<Line1204POARecordingFeeBCC></Line1204POARecordingFeeBCC>
							<Line1205ConveyanceCharges></Line1205ConveyanceCharges>
							<Line1205ConveyanceChargesBCC></Line1205ConveyanceChargesBCC>
							<Line1206Desc></Line1206Desc>
							<Line1206></Line1206>
							<Line1206BCC></Line1206BCC>
							<Line1207Desc></Line1207Desc>
							<Line1207></Line1207>
							<Line1207BCC></Line1207BCC>
							<Line1208Desc></Line1208Desc>
							<Line1208></Line1208>
							<Line1208BCC></Line1208BCC>
							<Line1209Desc></Line1209Desc>
							<Line1209></Line1209>
							<Line1209BCC></Line1209BCC>
							<Line1210Desc></Line1210Desc>
							<Line1210></Line1210>
							<Line1210BCC></Line1210BCC>
						</GovernmentRecordingCharges>
						<AdditionalSettlementCharges>
							<Line1301SurveyToPaidTo></Line1301SurveyToPaidTo>
							<Line1301SurveyTo></Line1301SurveyTo>
							<Line1301SurveyToBCC></Line1301SurveyToBCC>
							<Line1302DelinquentUtilities></Line1302DelinquentUtilities>
							<Line1302DelinquentUtilitiesBCC></Line1302DelinquentUtilitiesBCC>
							<Line1303Desc></Line1303Desc>
							<Line1303></Line1303>
							<Line1303BCC></Line1303BCC>
							<Line1304Desc></Line1304Desc>
							<Line1304></Line1304>
							<Line1304BCC></Line1304BCC>
							<Line1305WireFee></Line1305WireFee>
							<Line1305WireFeeBCC></Line1305WireFeeBCC>
							<Line1306Desc></Line1306Desc>
							<Line1306></Line1306>
							<Line1306BCC></Line1306BCC>
							<Line1307BuyersPremiumBCC></Line1307BuyersPremiumBCC>
							<Line1308Desc></Line1308Desc>
							<Line1308></Line1308>
							<Line1308BCC></Line1308BCC>
							<Line1309Desc></Line1309Desc>
							<Line1309></Line1309>
							<Line1309BCC></Line1309BCC>
							<Line1310Desc></Line1310Desc>
							<Line1310></Line1310>
							<Line1310BCC></Line1310BCC>
							<Line1311Desc></Line1311Desc>
							<Line1311></Line1311>
							<Line1311BCC></Line1311BCC>
							<Line1312Desc></Line1312Desc>
							<Line1312></Line1312>
							<Line1312BCC></Line1312BCC>
						</AdditionalSettlementCharges>
					</SettlementCharges>   -->
				</HUDForm>
			</ResolveHUDShortage>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Resolve HUD Shortage sent to Equator: #arguments.resolve_method# - #arguments.issue#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>







<cffunction name="sendResolveHUDOverage" output="true">
<cfargument name="titleID" required="true">
<cfargument name="issue" required="true">
<cfargument name="resolve_method" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="lookup_docs">
			select * from Doc_Closer_Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Resolve HUD Overage SENT::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_docs.final_HUD#', 'file')#" variable="M1">
<cfset base64_hud = ToBase64(m1)>

<cffile action="READBINARY" file="#fileSys.FindFilePath('#lookup_docs.waiver#', 'file')#" variable="M2">
<cfset base64_waiver = ToBase64(m2)>


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_closing_transactionID#">
			<ResolveHUDOverage>
				<OverageResolution>#arguments.resolve_method#</OverageResolution>
				<Comments>#arguments.issue#</Comments>
				<FinalHUD name="#lookup_docs.final_HUD#" type="PDF">
					<Checksum>0</Checksum>
					<Payload>#base64_hud#</Payload>
				</FinalHUD>
				<WaiverAndReleaseForm name="#lookup_docs.waiver#" type="PDF">
					<Checksum>0</Checksum>
					<Payload>#base64_hud#</Payload>
				</WaiverAndReleaseForm>
				<SettlementDate>2013-01-01</SettlementDate>
				<DisbursementDate>2013-01-01</DisbursementDate>
				<HUDForm>
		<!--			<SummaryOfSellerTransaction>
						<GrossAmountDueToSeller>
							<Line401ContractSalesPriceBCC></Line401ContractSalesPriceBCC>
							<Line402PersonalProperty></Line402PersonalProperty>
							<Line402PersonalPropertyBCC></Line402PersonalPropertyBCC>
							<Line403RentsFrom></Line403RentsFrom>
							<Line403RentsTo></Line403RentsTo>
							<Line403Rents></Line403Rents>
							<Line403RentsBCC></Line403RentsBCC>
							<Line404Desc></Line404Desc>
							<Line404></Line404>
							<Line404BCC></Line404BCC>
							<Line405Desc></Line405Desc>
							<Line405></Line405>
							<Line405BCC></Line405BCC>
							<Line406CityTownTaxesFrom></Line406CityTownTaxesFrom>
							<Line406CityTownTaxesTo></Line406CityTownTaxesTo>
							<Line406CityTownTaxes></Line406CityTownTaxes>
							<Line406CityTownTaxesBCC></Line406CityTownTaxesBCC>
							<Line407CountyTaxesFrom></Line407CountyTaxesFrom>
							<Line407CountyTaxesTo></Line407CountyTaxesTo>
							<Line407CountyTaxes></Line407CountyTaxes>
							<Line407CountyTaxesBCC></Line407CountyTaxesBCC>
							<Line408HOADuesFrom></Line408HOADuesFrom>
							<Line408HOADuesTo></Line408HOADuesTo>
							<Line408HOADues></Line408HOADues>
							<Line408HOADuesBCC></Line408HOADuesBCC>
							<Line409HOADuesFrom></Line409HOADuesFrom>
							<Line409HOADuesTo></Line409HOADuesTo>
							<Line409HOADues></Line409HOADues>
							<Line409HOADuesBCC></Line409HOADuesBCC>
							<Line410AssessmentsFrom></Line410AssessmentsFrom>
							<Line410AssessmentsTo></Line410AssessmentsTo>
							<Line410Assessments></Line410Assessments>
							<Line410AssessmentsBCC></Line410AssessmentsBCC>
							<Line411OfferPerDiemBCC></Line411OfferPerDiemBCC>
							<Line412Desc></Line412Desc>
							<Line412></Line412>
							<Line412BCC></Line412BCC>
							<Line413Desc></Line413Desc>
							<Line413></Line413>
							<Line413BCC></Line413BCC>
							<Line414Desc></Line414Desc>
							<Line414></Line414>
							<Line414BCC></Line414BCC>
							<Line415Desc></Line415Desc>
							<Line415></Line415>
							<Line415BCC></Line415BCC>
							<Line416Desc></Line416Desc>
							<Line416></Line416>
							<Line416BCC></Line416BCC>
							<Line417Desc></Line417Desc>
							<Line417></Line417>
							<Line417BCC></Line417BCC>
							<Line418Desc></Line418Desc>
							<Line418></Line418>
							<Line418BCC></Line418BCC>
						</GrossAmountDueToSeller>
						<ReductionInAmountDueToSeller>
							<Line501Amount></Line501Amount>
							<Line501AmountBCC></Line501AmountBCC>
							<Line502SettlementChargesToSellerBCC></Line502SettlementChargesToSellerBCC>
							<Line503ExistingLoanTakenSubjectToDesc></Line503ExistingLoanTakenSubjectToDesc>
							<Line503ExistingLoanTakenSubjectTo></Line503ExistingLoanTakenSubjectTo>
							<Line503ExistingLoanTakenSubjectToBCC></Line503ExistingLoanTakenSubjectToBCC>
							<Line504PayoffOfFirstMortgageLoan></Line504PayoffOfFirstMortgageLoan>
							<Line504PayoffOfFirstMortgageLoanBCC></Line504PayoffOfFirstMortgageLoanBCC>
							<Line505PayoffOfSecondMortgageLoan></Line505PayoffOfSecondMortgageLoan>
							<Line505PayoffOfSecondMortgageLoanBCC></Line505PayoffOfSecondMortgageLoanBCC>
							<Line506Desc></Line506Desc>
							<Line506></Line506>
							<Line506BCC></Line506BCC>
							<Line507></Line507>
							<Line507Desc></Line507Desc>
							<Line507BCC></Line507BCC>
							<Line508></Line508>
							<Line508Desc></Line508Desc>
							<Line508BCC></Line508BCC>
							<Line509></Line509>
							<Line509Desc></Line509Desc>
							<Line509BCC></Line509BCC>
							<Line510CityTownTaxesFromDate></Line510CityTownTaxesFromDate>
							<Line510CityTownTaxesToDate></Line510CityTownTaxesToDate>
							<Line510CityTownTaxes></Line510CityTownTaxes>
							<Line510CityTownTaxesBCC></Line510CityTownTaxesBCC>
							<Line511CountyTaxesFromDate></Line511CountyTaxesFromDate>
							<Line511CountyTaxesToDate></Line511CountyTaxesToDate>
							<Line511CountyTaxes></Line511CountyTaxes>
							<Line511CountyTaxesBCC></Line511CountyTaxesBCC>
							<Line512SchoolTaxesFromDate></Line512SchoolTaxesFromDate>
							<Line512SchoolTaxesToDate></Line512SchoolTaxesToDate>
							<Line512SchoolTaxes></Line512SchoolTaxes>
							<Line512SchoolTaxesBCC></Line512SchoolTaxesBCC>
							<Line513Desc></Line513Desc>
							<Line513></Line513>
							<Line513BCC></Line513BCC>
							<Line514DelinquentTaxes>123.12</Line514DelinquentTaxes>				
							<Line514DelinquentTaxesBCC></Line514DelinquentTaxesBCC>
							<Line515SpecialAssessmentsFromDate></Line515SpecialAssessmentsFromDate>
							<Line515SpecialAssessmentsToDate></Line515SpecialAssessmentsToDate>
							<Line515SpecialAssessments></Line515SpecialAssessments>
							<Line515SpecialAssessmentsBCC></Line515SpecialAssessmentsBCC>
							<Line516DelinquentSpecialAssessmentsFromDate></Line516DelinquentSpecialAssessmentsFromDate>
							<Line516DelinquentSpecialAssessmentsToDate></Line516DelinquentSpecialAssessmentsToDate>
							<Line516DelinquentSpecialAssessments></Line516DelinquentSpecialAssessments>
							<Line516DelinquentSpecialAssessmentsBCC></Line516DelinquentSpecialAssessmentsBCC>
							<Line517HOADuesFromDate></Line517HOADuesFromDate>
							<Line517HOADuesToDate></Line517HOADuesToDate>
							<Line517HOADues></Line517HOADues>
							<Line517HOADuesBCC></Line517HOADuesBCC>
	<Line518TotalDelinquentHOA>154.23</Line518TotalDelinquentHOA>						<Line518TotalDelinquentHOABCC></Line518TotalDelinquentHOABCC>
							<Line519Desc></Line519Desc>
							<Line519></Line519>
							<Line519BCC></Line519BCC>
						</ReductionInAmountDueToSeller>
					</SummaryOfSellerTransaction>
					<SettlementCharges>
						<TotalCommission>
							<Line704ListingAgentBonus></Line704ListingAgentBonus>
							<Line705SellingAgentBonus></Line705SellingAgentBonus>
							<Line706Desc></Line706Desc>
							<Line706></Line706>
							<Line707Desc></Line707Desc>
							<Line707></Line707>
						</TotalCommission>
						<ItemsPayableInConnectionWithLoan>
							<Line801LoanOriginationFee></Line801LoanOriginationFee>
							<Line801LoanOriginationFeeBCC></Line801LoanOriginationFeeBCC>
							<Line802LoanDiscount></Line802LoanDiscount>
							<Line802LoanDiscountBCC></Line802LoanDiscountBCC>
							<Line803AppraisalFee></Line803AppraisalFee>
							<Line803AppraisalFeeBCC></Line803AppraisalFeeBCC>
							<Line804CreditReport></Line804CreditReport>
							<Line804CreditReportBCC></Line804CreditReportBCC>
							<Line805Desc></Line805Desc>
							<Line805></Line805>
							<Line805BCC></Line805BCC>
							<Line806Desc></Line806Desc>
							<Line806></Line806>
							<Line806BCC></Line806BCC>
							<Line807Desc></Line807Desc>
							<Line807></Line807>
							<Line807BCC></Line807BCC>
							<Line808Desc></Line808Desc>
							<Line808></Line808>
							<Line808BCC></Line808BCC>
							<Line809Desc></Line809Desc>
							<Line809></Line809>
							<Line809BCC></Line809BCC>
							<Line810Desc></Line810Desc>
							<Line810></Line810>
							<Line810BCC></Line810BCC>
							<Line811Desc></Line811Desc>
							<Line811></Line811>
							<Line811BCC></Line811BCC>
						</ItemsPayableInConnectionWithLoan>
						<ItemsRequiredByLenderPaidInAdvance>
							<Line901Interest></Line901Interest>
							<Line901InterestBCC></Line901InterestBCC>
							<Line902MortgageInsurancePremium></Line902MortgageInsurancePremium>
							<Line902MortgageInsurancePremiumBCC></Line902MortgageInsurancePremiumBCC>
							<Line903HazardInsurance></Line903HazardInsurance>
							<Line903HazardInsuranceBCC></Line903HazardInsuranceBCC>
							<Line904Desc></Line904Desc>
							<Line904></Line904>
							<Line904BCC></Line904BCC>
							<Line905Desc></Line905Desc>
							<Line905></Line905>
							<Line905BCC></Line905BCC>
						</ItemsRequiredByLenderPaidInAdvance>
						<ReservesDepositedWithLender>
							<Line1001HazardInsurance></Line1001HazardInsurance>
							<Line1001HazardInsuranceBCC></Line1001HazardInsuranceBCC>
							<Line1002MortgageInsurance></Line1002MortgageInsurance>
							<Line1002MortgageInsuranceBCC></Line1002MortgageInsuranceBCC>
							<Line1003CityPropertyTaxes></Line1003CityPropertyTaxes>
							<Line1003CityPropertyTaxesBCC></Line1003CityPropertyTaxesBCC>
							<Line1004CountyPropertyTaxes></Line1004CountyPropertyTaxes>
							<Line1004CountyPropertyTaxesBCC></Line1004CountyPropertyTaxesBCC>
							<Line1005AnnualAssessments></Line1005AnnualAssessments>
							<Line1005AnnualAssessmentsBCC></Line1005AnnualAssessmentsBCC>
							<Line1006Desc></Line1006Desc>
							<Line1006></Line1006>
							<Line1006BCC></Line1006BCC>
							<Line1007Desc></Line1007Desc>
							<Line1007></Line1007>
							<Line1007BCC></Line1007BCC>
							<Line1008Desc></Line1008Desc>
							<Line1008></Line1008>
							<Line1008BCC></Line1008BCC>
							<Line1011AggregateAdjustment></Line1011AggregateAdjustment>
							<Line1011AggregateAdjustmentBCC></Line1011AggregateAdjustmentBCC>
						</ReservesDepositedWithLender>
						<TitleCharges>
							<Line1101SettlementFeePaymentTo></Line1101SettlementFeePaymentTo>
							<Line1101SettlementFee></Line1101SettlementFee>
							<Line1101SettlementFeeBCC></Line1101SettlementFeeBCC>
							<Line1102AbstractToPaymentTo></Line1102AbstractToPaymentTo>
							<Line1102AbstractTo></Line1102AbstractTo>
							<Line1102AbstractToBCC></Line1102AbstractToBCC>
							<Line1103TitleExaminationToPaymentTo></Line1103TitleExaminationToPaymentTo>
							<Line1103TitleExaminationTo></Line1103TitleExaminationTo>
							<Line1103TitleExaminationToBCC></Line1103TitleExaminationToBCC>
							<Line1104TitleInsuranceBinderToPaymentTo></Line1104TitleInsuranceBinderToPaymentTo>
							<Line1104TitleInsuranceBinderTo></Line1104TitleInsuranceBinderTo>
							<Line1104TitleInsuranceBinderToBCC></Line1104TitleInsuranceBinderToBCC>
							<Line1105DocumentPreparationToPaymentTo></Line1105DocumentPreparationToPaymentTo>
							<Line1105DocumentPreparationTo></Line1105DocumentPreparationTo>
							<Line1105DocumentPreparationToBCC></Line1105DocumentPreparationToBCC>
							<Line1106NotaryFeesToPaymentTo></Line1106NotaryFeesToPaymentTo>
							<Line1106NotaryFeesTo></Line1106NotaryFeesTo>
							<Line1106NotaryFeesToBCC></Line1106NotaryFeesToBCC>
							<Line1107AttorneyFeesToPaymentTo></Line1107AttorneyFeesToPaymentTo>
							<Line1107AttorneyFeesTo></Line1107AttorneyFeesTo>
							<Line1107AttorneyFeesToBCC></Line1107AttorneyFeesToBCC>
							<Line1108TitleInsuranceToPaymentTo></Line1108TitleInsuranceToPaymentTo>
							<Line1108TitleInsuranceTo></Line1108TitleInsuranceTo>
							<Line1108TitleInsuranceToBCC></Line1108TitleInsuranceToBCC>
							<Line1109LendersCoveragePolicyAmount></Line1109LendersCoveragePolicyAmount>
							<Line1109LendersCoveragePolicyCost></Line1109LendersCoveragePolicyCost>
							<Line1109LendersCoverage></Line1109LendersCoverage>
							<Line1109LendersCoverageBCC></Line1109LendersCoverageBCC>
							<Line1110OwnersCoveragePolicyAmount></Line1110OwnersCoveragePolicyAmount>
							<Line1110OwnersCoveragePolicyCost></Line1110OwnersCoveragePolicyCost>
							<Line1110OwnersCoverage></Line1110OwnersCoverage>
							<Line1110OwnersCoverageBCC></Line1110OwnersCoverageBCC>
							<Line1111OutstandingLiens></Line1111OutstandingLiens>
							<Line1111OutstandingLiensBCC></Line1111OutstandingLiensBCC>
							<Line1112SellerRepresentationFeePaymentTo></Line1112SellerRepresentationFeePaymentTo>
							<Line1112SellerRepresentationFee></Line1112SellerRepresentationFee>
							<Line1112SellerRepresentationFeeBCC></Line1112SellerRepresentationFeeBCC>
							<Line1113ForeclosureCosts></Line1113ForeclosureCosts>
							<Line1113ForeclosureCostsBCC></Line1113ForeclosureCostsBCC>
							<Line1114LandRent></Line1114LandRent>
							<Line1114LandRentBCC></Line1114LandRentBCC>
							<Line1115OutstandingLiens></Line1115OutstandingLiens>
							<Line1115OutstandingLiensBCC></Line1115OutstandingLiensBCC>
							<Line1116Desc></Line1116Desc>
							<Line1116></Line1116>
							<Line1116BCC></Line1116BCC>
							<Line1117Desc></Line1117Desc>
							<Line1117></Line1117>
							<Line1117BCC></Line1117BCC>
							<Line1118Desc></Line1118Desc>
							<Line1118></Line1118>
							<Line1118BCC></Line1118BCC>
						</TitleCharges>
						<GovernmentRecordingCharges>
							<Line1201RecordingFeesDeed></Line1201RecordingFeesDeed>
							<Line1201RecordingFeesMortgage></Line1201RecordingFeesMortgage>
							<Line1201RecordingFeesRelease></Line1201RecordingFeesRelease>
							<Line1201RecordingFees></Line1201RecordingFees>
							<Line1201RecordingFeesBCC></Line1201RecordingFeesBCC>
							<Line1202CityCountyTaxStamps></Line1202CityCountyTaxStamps>
							<Line1202CityCountyTaxStampsDeed></Line1202CityCountyTaxStampsDeed>
							<Line1202CityCountyTaxStampsMortgage></Line1202CityCountyTaxStampsMortgage>
							<Line1202CityCountyTaxStampsBCC></Line1202CityCountyTaxStampsBCC>
							<Line1203StateTaxStamps></Line1203StateTaxStamps>
							<Line1203StateTaxStampsDeed></Line1203StateTaxStampsDeed>
							<Line1203StateTaxStampsMortgage></Line1203StateTaxStampsMortgage>
							<Line1203StateTaxStampsBCC></Line1203StateTaxStampsBCC>
							<Line1204POARecordingFee></Line1204POARecordingFee>
							<Line1204POARecordingFeeBCC></Line1204POARecordingFeeBCC>
							<Line1205ConveyanceCharges></Line1205ConveyanceCharges>
							<Line1205ConveyanceChargesBCC></Line1205ConveyanceChargesBCC>
							<Line1206Desc></Line1206Desc>
							<Line1206></Line1206>
							<Line1206BCC></Line1206BCC>
							<Line1207Desc></Line1207Desc>
							<Line1207></Line1207>
							<Line1207BCC></Line1207BCC>
							<Line1208Desc></Line1208Desc>
							<Line1208></Line1208>
							<Line1208BCC></Line1208BCC>
							<Line1209Desc></Line1209Desc>
							<Line1209></Line1209>
							<Line1209BCC></Line1209BCC>
							<Line1210Desc></Line1210Desc>
							<Line1210></Line1210>
							<Line1210BCC></Line1210BCC>
						</GovernmentRecordingCharges>
						<AdditionalSettlementCharges>
							<Line1301SurveyToPaidTo></Line1301SurveyToPaidTo>
							<Line1301SurveyTo></Line1301SurveyTo>
							<Line1301SurveyToBCC></Line1301SurveyToBCC>
							<Line1302DelinquentUtilities></Line1302DelinquentUtilities>
							<Line1302DelinquentUtilitiesBCC></Line1302DelinquentUtilitiesBCC>
							<Line1303Desc></Line1303Desc>
							<Line1303></Line1303>
							<Line1303BCC></Line1303BCC>
							<Line1304Desc></Line1304Desc>
							<Line1304></Line1304>
							<Line1304BCC></Line1304BCC>
							<Line1305WireFee></Line1305WireFee>
							<Line1305WireFeeBCC></Line1305WireFeeBCC>
							<Line1306Desc></Line1306Desc>
							<Line1306></Line1306>
							<Line1306BCC></Line1306BCC>
							<Line1307BuyersPremiumBCC></Line1307BuyersPremiumBCC>
							<Line1308Desc></Line1308Desc>
							<Line1308></Line1308>
							<Line1308BCC></Line1308BCC>
							<Line1309Desc></Line1309Desc>
							<Line1309></Line1309>
							<Line1309BCC></Line1309BCC>
							<Line1310Desc></Line1310Desc>
							<Line1310></Line1310>
							<Line1310BCC></Line1310BCC>
							<Line1311Desc></Line1311Desc>
							<Line1311></Line1311>
							<Line1311BCC></Line1311BCC>
							<Line1312Desc></Line1312Desc>
							<Line1312></Line1312>
							<Line1312BCC></Line1312BCC>
						</AdditionalSettlementCharges>
					</SettlementCharges>     -->
				</HUDForm>
			</ResolveHUDOverage>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Resolve HUD Overage sent to Equator: #arguments.resolve_method# - #arguments.issue#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>








<cffunction name="sendProvideRecordingInfo" output="true">
<cfargument name="titleID" required="true">
<cfargument name="issue" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Provide Recording Info SENT::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_closing_transactionID#">
			<ProvideRecordingInfo>
				<DeedRecordingDate>#DateFormat(lookup_transaction.deed_recording_date, "yyyy-mm-dd")#</DeedRecordingDate>
				<InstrumentNumber>#lookup_transaction.deed_instrument_number#</InstrumentNumber>
				<Comments>#lookup_transaction.deed_comments#</Comments>
			</ProvideRecordingInfo>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Provide Recording Info sent to Equator: #arguments.issue#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>




<cffunction name="sendInvoiceandComplete" output="true">
<cfargument name="titleID" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Invoice and Complete Response SENT::. Equator_Closing_TractionID '#lookup_transaction.equator_closing_transactionID#'">


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_closing_transactionID#">
			<InvoiceAndComplete id="#CreateUUID()#">
				<InvoiceOrder>NO, INVOICE OUT OF THE EQ SYSTEM</InvoiceOrder>
			</InvoiceAndComplete>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = closing_xml_opener & send_xml & closing_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#closing_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Invoice and Complete Response sent to Equator: NO, INVOICE OUT OF THE EQ SYSTEM', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>






<cffunction name="sendInvoiceandCompleteTitle" output="true">
<cfargument name="titleID" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Invoice and Complete Title Response SENT::. Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
			<TitleInvoiceAndComplete>
				<InvoiceOrder>NO, INVOICE OUT OF THE EQ SYSTEM</InvoiceOrder>
			</TitleInvoiceAndComplete>
		</Order>
	</Body>
</Message>'>



    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Invoice and Complete Title Response sent to Equator: NO, INVOICE OUT OF THE EQ SYSTEM', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>







<cffunction name="sendTitleVendorUpdate" output="true">
<cfargument name="titleID" required="true">
<cfargument name="message" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Title Update Response SENT::. #arguments.message# Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#" status="REOPEN">
			<TitleUpdateVendor>
				<Comments>#arguments.message#</Comments>
			</TitleUpdateVendor>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Title Update Response SENT sent to Equator: #arguments.message#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>









<cffunction name="sendTitlePayableUpdate" output="true">
<cfargument name="titleID" required="true">
<cfargument name="message" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Title Payable Update Response SENT::. #arguments.message# Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
		
			<TitlePayableUpdate>
				<Comments>#arguments.message#</Comments>
			</TitlePayableUpdate>		
		</Order>
	</Body>
</Message>'>


    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Title Payable Update Response SENT sent to Equator: #arguments.message#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>









<cffunction name="sendClearVesting" output="true">
<cfargument name="titleID" required="true">
<cfargument name="filename" required="true">
<cfargument name="clear_vesting_type" required="true">
<cfargument name="message" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Clear Vesting - #arguments.clear_vesting_type# - SENT - file #arguments.filename# added to Misc Docs ::. Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">

<cffile action="READBINARY" file="#fileSys.FindFilePath('#arguments.filename#', 'file')#" variable="M1">
<cfset base64_file = ToBase64(m1)>


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
			<ClearVesting>
				<TitleDocument name="#arguments.filename#" type="#ListLast(arguments.filename, '.')#">
					<Checksum></Checksum>
					<Payload>#base64_file#</Payload>
				</TitleDocument>
				<Comments>#arguments.message#</Comments>
				<AdditionalComments1></AdditionalComments1>
				<AdditionalComments2></AdditionalComments2>
				<AdditionalComments3></AdditionalComments3>
				<AdditionalComments4></AdditionalComments4>
				<FindingCleared>#arguments.clear_vesting_type#</FindingCleared>
			</ClearVesting>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Clear Vesting - #arguments.clear_vesting_type# - sent to Equator: #arguments.message#: File #arguments.filename# uploaded to Misc Docs', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>



<cffunction name="sendClearCurative" output="true">
<cfargument name="titleID" required="true">
<cfargument name="filename" required="true">
<cfargument name="clear_curative_type" required="true">
<cfargument name="message" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Clear Curative - #arguments.clear_curative_type# - SENT - file #arguments.filename# added to Misc Docs ::. Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">

<cffile action="READBINARY" file="#fileSys.FindFilePath('#arguments.filename#', 'file')#" variable="M1">
<cfset base64_file = ToBase64(m1)>


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
			<ClearCurative>
				<TitleDocument name="#arguments.filename#" type="#ListLast(arguments.filename, '.')#">
					<Checksum></Checksum>
					<Payload>#base64_file#</Payload>
				</TitleDocument>
				<Comments>#arguments.message#</Comments>
				<AdditionalComments1></AdditionalComments1>
				<AdditionalComments2></AdditionalComments2>
				<AdditionalComments3></AdditionalComments3>
				<AdditionalComments4></AdditionalComments4>
				<FindingCleared>#arguments.clear_curative_type#</FindingCleared>
			</ClearCurative>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Clear Curative - #arguments.clear_curative_type# - sent to Equator: #arguments.message#: File #arguments.filename# uploaded to Misc Docs', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>








<cffunction name="sendRequestAssistanceResponse" output="true">
<cfargument name="titleID" required="true">
<cfargument name="request_assistance_type" required="true">
<cfargument name="message" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Respond to Request for Assistance - #arguments.request_assistance_type# - SENT ::.Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">

<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
			
			<RequestAssistanceTitle>
				<NeedAssistanceWithFinding>#arguments.request_assistance_type#</NeedAssistanceWithFinding>
				<Comments>#arguments.message#</Comments>
			</RequestAssistanceTitle>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Request Assistance Response - #arguments.request_assistance_type# - sent to Equator: #arguments.message#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>





<cffunction name="sendRequestAssistance" output="true">
<cfargument name="titleID" required="true">
<cfargument name="request_assistance_type" required="true">
<cfargument name="message" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Request Assistance - #arguments.request_assistance_type# - SENT ::.Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">

<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="NEW_DELIVERABLE" transactionID="#lookup_transaction.equator_title_transactionID#">
			
			<RequestAssistanceTitle>
				<NeedAssistanceWithFinding>#arguments.request_assistance_type#</NeedAssistanceWithFinding>
				<Comments>#arguments.message#</Comments>
			</RequestAssistanceTitle>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Request Assistance - #arguments.request_assistance_type# - sent to Equator: #arguments.message#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>








<cffunction name="sendAdditionalTitleCostRequest" output="true">
<cfargument name="titleID" required="true">
<cfargument name="additional_cost_type" required="true">
<cfargument name="additional_cost" required="true">
<cfargument name="message" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Additional Title Cost Request - SENT ::. Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">

<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="NEW_DELIVERABLE" transactionID="#lookup_transaction.equator_title_transactionID#">
				<AdditionalTitleCosts>
				<AdditionalTitleCost>#arguments.additional_cost#</AdditionalTitleCost>
				<NeedAssistanceWithFinding>#arguments.additional_cost_type#</NeedAssistanceWithFinding>
				<Comments>#arguments.message#</Comments>
			</AdditionalTitleCosts>	
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Additional Title Cost Request - #arguments.additional_cost_type#: #DollarFormat(arguments.additional_cost)#  - sent to Equator: #arguments.message#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>




<cffunction name="RespondToAdditionalTitleCostRequest" output="true">
<cfargument name="titleID" required="true">
<cfargument name="additional_cost_type" required="true">
<cfargument name="additional_cost" required="true">
<cfargument name="message" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Response to Additional Title Cost Request - SENT ::. Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">

<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
				<AdditionalTitleCosts>
				<AdditionalTitleCost>#arguments.additional_cost#</AdditionalTitleCost>
				<NeedAssistanceWithFinding>#arguments.additional_cost_type#</NeedAssistanceWithFinding>
				<Comments>#arguments.message#</Comments>
			</AdditionalTitleCosts>	
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Responded to Additional Title Cost Request - #arguments.additional_cost_type#: #DollarFormat(arguments.additional_cost)#  - sent to Equator: #arguments.message#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>







<cffunction name="sendAdditionalTitleCostResponse" output="true">
<cfargument name="titleID" required="true">
<cfargument name="message" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Additional Cost Response - SENT ::. Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">

<cfset send_xml = '<Message id="String" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
			<AdditionalTitleCostsResponse>
				<Comments>#arguments.message#</Comments>
			</AdditionalTitleCostsResponse>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Additional Title Cost Response - #arguments.message# - sent to Equator', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>







<cffunction name="sendVestingPayableTaxes" output="true">
<cfargument name="titleID" required="true">
<cfargument name="filename">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="lookup_findings">
			select * from Equator_Vesting_Curative_Payable where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Vesting Payable Taxes - SENT ::. Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">

<cfset the_fileName =  ''>
<cfset the_ext =  ''>
<cfset base64_file = ''>

<cfif Len(arguments.filename)>
<cfset the_fileName =  arguments.filename>
<cfset the_ext =  ListLast(arguments.filename, '.')>
<cffile action="READBINARY" file="#fileSys.FindFilePath('#arguments.filename#', 'file')#" variable="M1">
<cfset base64_file = ToBase64(m1)>
</cfif>


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
			<VestingPayableReportTaxes>
				<TaxType1>#lookup_findings.tax_type_1#</TaxType1>
				<TaxFromDate1>#DateFormat(lookup_findings.tax_from_date_1, 'yyyy-mm-dd')#</TaxFromDate1>
				<TaxToDate1>#DateFormat(lookup_findings.tax_to_date_1, 'yyyy-mm-dd')#</TaxToDate1>
				<TaxBaseAmount1>#lookup_findings.tax_base_amount_1#</TaxBaseAmount1>
				<TaxPenaltyInterestAmount1>#lookup_findings.tax_penalty_1#</TaxPenaltyInterestAmount1>
				<TaxType2>#lookup_findings.tax_type_2#</TaxType2>
				<TaxFromDate2>#DateFormat(lookup_findings.tax_from_date_2, 'yyyy-mm-dd')#</TaxFromDate2>
				<TaxToDate2>#DateFormat(lookup_findings.tax_to_date_2, 'yyyy-mm-dd')#</TaxToDate2>
				<TaxBaseAmount2>#lookup_findings.tax_base_amount_2#</TaxBaseAmount2>
				<TaxPenaltyInterestAmount2>#lookup_findings.tax_penalty_2#</TaxPenaltyInterestAmount2>
				<TaxType3>#lookup_findings.tax_type_3#</TaxType3>
				<TaxFromDate3>#DateFormat(lookup_findings.tax_from_date_3, 'yyyy-mm-dd')#</TaxFromDate3>
				<TaxToDate3>#DateFormat(lookup_findings.tax_to_date_3, 'yyyy-mm-dd')#</TaxToDate3>
				<TaxBaseAmount3>#lookup_findings.tax_base_amount_3#</TaxBaseAmount3>
				<TaxPenaltyInterestAmount3>#lookup_findings.tax_penalty_3#</TaxPenaltyInterestAmount3>
				<TaxType4>#lookup_findings.tax_type_3#</TaxType4>
				<TaxFromDate4>#DateFormat(lookup_findings.tax_from_date_4, 'yyyy-mm-dd')#</TaxFromDate4>
				<TaxToDate4>#DateFormat(lookup_findings.tax_to_date_4, 'yyyy-mm-dd')#</TaxToDate4>
				<TaxBaseAmount4>#lookup_findings.tax_base_amount_4#</TaxBaseAmount4>
				<TaxPenaltyInterestAmount4>#lookup_findings.tax_penalty_4#</TaxPenaltyInterestAmount4>
				<UploadDocuments name="#the_fileName#" type="#the_ext#">
					<Checksum></Checksum>
					<Payload>#base64_file#</Payload>
				</UploadDocuments>
			    <Comments>#lookup_findings.taxes_comments#</Comments>
			    </VestingPayableReportTaxes>	
                    	</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Vesting Payable Taxes sent to Equator', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>




<cffunction name="sendVestingPayableHOA" output="true">
<cfargument name="titleID" required="true">
<cfargument name="filename">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="lookup_findings">
			select * from Equator_Vesting_Curative_Payable where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Vesting Payable HOA - SENT ::. Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">

<cfset the_fileName =  ''>
<cfset the_ext =  ''>
<cfset base64_file = ''>

<cfif Len(arguments.filename)>
<cfset the_fileName =  arguments.filename>
<cfset the_ext =  ListLast(arguments.filename, '.')>
<cffile action="READBINARY" file="#fileSys.FindFilePath('#arguments.filename#', 'file')#" variable="M1">
<cfset base64_file = ToBase64(m1)>
</cfif>


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
						<VestingPayableReportHOA>
				<HOA1>#lookup_findings.hoa_type_1#</HOA1>
				<HOAToDate1>#DateFormat(lookup_findings.hoa_to_date_1, 'yyyy-mm-dd')#</HOAToDate1>
				<HOAFromDate1>#DateFormat(lookup_findings.hoa_from_date_1, 'yyyy-mm-dd')#</HOAFromDate1>
				<HOAAllDuesAmount1>#lookup_findings.hoa_all_dues_amount_1#</HOAAllDuesAmount1>
				<HOASpecialAssessmentsAmount1>#lookup_findings.hoa_special_assessments_amount_1#</HOASpecialAssessmentsAmount1>
				<HOAStatementFeeAmount1>#lookup_findings.hoa_statement_fee_amount_1#</HOAStatementFeeAmount1>
				<HOATransferResaleDisclosureFeeAmount1>#lookup_findings.hoa_transfer_fee_amount_1#</HOATransferResaleDisclosureFeeAmount1>
				<HOAOutOfStatuteFeesPenaltiesChargesAmount1>#lookup_findings.hoa_out_of_statute_amount_1#</HOAOutOfStatuteFeesPenaltiesChargesAmount1>
				<HOALateFeesPenaltiesInterestAmount1>#lookup_findings.hoa_late_fees_amount_1#</HOALateFeesPenaltiesInterestAmount1>
				<HOAAttorneyFeesAmount1>#lookup_findings.hoa_attorney_fees_amount_1#</HOAAttorneyFeesAmount1>
				<HOA2>#lookup_findings.hoa_type_2#</HOA2>
				<HOAToDate2>#DateFormat(lookup_findings.hoa_to_date_2, 'yyyy-mm-dd')#</HOAToDate2>
				<HOAFromDate2>#DateFormat(lookup_findings.hoa_from_date_2, 'yyyy-mm-dd')#</HOAFromDate2>
				<HOAAllDuesAmount2>#lookup_findings.hoa_all_dues_amount_2#</HOAAllDuesAmount2>
				<HOASpecialAssessmentsAmount2>#lookup_findings.hoa_special_assessments_amount_2#</HOASpecialAssessmentsAmount2>
				<HOAStatementFeeAmount2>#lookup_findings.hoa_statement_fee_amount_2#</HOAStatementFeeAmount2>
				<HOATransferResaleDisclosureFeeAmount2>#lookup_findings.hoa_transfer_fee_amount_2#</HOATransferResaleDisclosureFeeAmount2>
				<HOAOutOfStatuteFeesPenaltiesChargesAmount2>#lookup_findings.hoa_out_of_statute_amount_2#</HOAOutOfStatuteFeesPenaltiesChargesAmount2>
				<HOALateFeesPenaltiesInterestAmount2>#lookup_findings.hoa_late_fees_amount_2#</HOALateFeesPenaltiesInterestAmount2>
				<HOAAttorneyFeesAmount2>#lookup_findings.hoa_attorney_fees_amount_2#</HOAAttorneyFeesAmount2>
				<HOA3>#lookup_findings.hoa_type_3#</HOA3>
				<HOAToDate3>#DateFormat(lookup_findings.hoa_to_date_3, 'yyyy-mm-dd')#</HOAToDate3>
				<HOAFromDate3>#DateFormat(lookup_findings.hoa_from_date_3, 'yyyy-mm-dd')#</HOAFromDate3>
				<HOAAllDuesAmount3>#lookup_findings.hoa_all_dues_amount_3#</HOAAllDuesAmount3>
				<HOASpecialAssessmentsAmount3>#lookup_findings.hoa_special_assessments_amount_3#</HOASpecialAssessmentsAmount3>
				<HOAStatementFeeAmount3>#lookup_findings.hoa_statement_fee_amount_3#</HOAStatementFeeAmount3>
				<HOATransferResaleDisclosureFeeAmount3>#lookup_findings.hoa_transfer_fee_amount_3#</HOATransferResaleDisclosureFeeAmount3>
				<HOAOutOfStatuteFeesPenaltiesChargesAmount3>#lookup_findings.hoa_out_of_statute_amount_3#</HOAOutOfStatuteFeesPenaltiesChargesAmount3>
				<HOALateFeesPenaltiesInterestAmount3>#lookup_findings.hoa_late_fees_amount_3#</HOALateFeesPenaltiesInterestAmount3>
				<HOAAttorneyFeesAmount3>#lookup_findings.hoa_attorney_fees_amount_3#</HOAAttorneyFeesAmount3>
				<HOA4>#lookup_findings.hoa_type_4#</HOA4>
				<HOAToDate4>#DateFormat(lookup_findings.hoa_to_date_4, 'yyyy-mm-dd')#</HOAToDate4>
				<HOAFromDate4>#DateFormat(lookup_findings.hoa_from_date_4, 'yyyy-mm-dd')#</HOAFromDate4>
				<HOAAllDuesAmount4>#lookup_findings.hoa_all_dues_amount_4#</HOAAllDuesAmount4>
				<HOASpecialAssessmentsAmount4>#lookup_findings.hoa_special_assessments_amount_4#</HOASpecialAssessmentsAmount4>
				<HOAStatementFeeAmount4>#lookup_findings.hoa_statement_fee_amount_4#</HOAStatementFeeAmount4>
				<HOATransferResaleDisclosureFeeAmount4>#lookup_findings.hoa_transfer_fee_amount_4#</HOATransferResaleDisclosureFeeAmount4>
				<HOAOutOfStatuteFeesPenaltiesChargesAmount4>#lookup_findings.hoa_out_of_statute_amount_4#</HOAOutOfStatuteFeesPenaltiesChargesAmount4>
				<HOALateFeesPenaltiesInterestAmount4>#lookup_findings.hoa_late_fees_amount_4#</HOALateFeesPenaltiesInterestAmount4>
				<HOAAttorneyFeesAmount4>#lookup_findings.hoa_attorney_fees_amount_4#</HOAAttorneyFeesAmount4>
				<UploadDocuments name="#the_fileName#" type="#the_ext#">
					<Checksum></Checksum>
					<Payload>#base64_file#</Payload>
				</UploadDocuments>				
				<Comments>#lookup_findings.hoa_comments#</Comments>
			</VestingPayableReportHOA>
                    	</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Vesting Payable HOA sent to Equator', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>








<cffunction name="sendVestingPayableLien" output="true">
<cfargument name="titleID" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="lookup_findings">
			select * from Equator_Vesting_Curative_Payable where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Vesting Payable Liens - SENT ::. Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
			<CurativePayableReportLiens>
				<LienType1>#lookup_findings.lien_type_1#</LienType1>
				<LienRecordedDate1>#DateFormat(lookup_findings.lien_recorded_date_1, 'yyyy-mm-dd')#</LienRecordedDate1>
				<LienBaseAmount1>#lookup_findings.lien_base_amount_1#</LienBaseAmount1>
				<LienPenaltyInterestAmount1>#lookup_findings.lien_penalty_amount_1#</LienPenaltyInterestAmount1>
				<LienType2>#lookup_findings.lien_type_2#</LienType2>
				<LienRecordedDate2>#DateFormat(lookup_findings.lien_recorded_date_2, 'yyyy-mm-dd')#</LienRecordedDate2>
				<LienBaseAmount2>#lookup_findings.lien_base_amount_2#</LienBaseAmount2>
				<LienPenaltyInterestAmount2>#lookup_findings.lien_penalty_amount_2#</LienPenaltyInterestAmount2>
				<LienType3>#lookup_findings.lien_type_3#</LienType3>
				<LienRecordedDate3>#DateFormat(lookup_findings.lien_recorded_date_3, 'yyyy-mm-dd')#</LienRecordedDate3>
				<LienBaseAmount3>#lookup_findings.lien_base_amount_3#</LienBaseAmount3>
				<LienPenaltyInterestAmount3>#lookup_findings.lien_penalty_amount_3#</LienPenaltyInterestAmount3>
				<Comments>#lookup_findings.lien_comments#</Comments>
			</CurativePayableReportLiens>
        </Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Vesting Payable Liens sent to Equator', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>






<cffunction name="sendVestingPayableLand" output="true">
<cfargument name="titleID" required="true">
<cfargument name="filename">
<cfset temp = setupVariables(titleId=arguments.titleId)>

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="lookup_findings">
			select * from Equator_Vesting_Curative_Payable where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Vesting Payable Land Rent - SENT ::. Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">

<cfset the_fileName =  ''>
<cfset the_ext =  ''>
<cfset base64_file = ''>

<cfif Len(arguments.filename)>
<cfset the_fileName =  arguments.filename>
<cfset the_ext =  ListLast(arguments.filename, '.')>
<cffile action="READBINARY" file="#fileSys.FindFilePath('#arguments.filename#', 'file')#" variable="M1">
<cfset base64_file = ToBase64(m1)>
</cfif>


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
						<CurativePayableReportLand>
				<LandRentFromDate>#DateFormat(lookup_findings.land_rent_from_date, 'yyyy-mm-dd')#</LandRentFromDate>
				<LandRentToDate>#DateFormat(lookup_findings.land_rent_to_date, 'yyyy-mm-dd')#</LandRentToDate>
				<LandRentBaseAmount>#lookup_findings.land_rent_base_amount#</LandRentBaseAmount>
				<LandRentPenaltyInterestAmount>#lookup_findings.land_rent_penalty_amount#</LandRentPenaltyInterestAmount>
				<UploadDocuments name="#the_FileName#" type="#the_ext#">
					<Checksum></Checksum>
					<Payload>#base64_file#</Payload>
				</UploadDocuments>
				<Comments>#lookup_findings.land_rent_comments#</Comments>
			</CurativePayableReportLand>
                    	</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Vesting Payable Land Rent sent to Equator', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>

















<cffunction name="sendReportTitleFindings" output="true">
<cfargument name="titleID" required="true">
<cfset temp = setupVariables(titleId=arguments.titleId)>

<cfset pool_file = 0>
<cfset element_text = "ReportTitleFindings">
		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="lookup_findings">
			select * from equator_report_findings where title_id = '#arguments.titleID#'
		</CFQUERY>
<cfif lookup_transaction.pool_file eq 'True'>
<cfset element_text = "ReportTitlePoolFindings">
</cfif>
<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Report Title Findings - SENT ::. Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">

<cfset is_clear = 0>

<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
			<#element_text#>'>

<cfif Len(lookup_findings.REASON_FOR_DELAY_TYPE) or Len(lookup_findings.CAUSE_TYPE) or Len(lookup_findings.TAX_TYPE_1) or Len(lookup_findings.HOA_TYPE_1) or Len(lookup_findings.LEGAL_DESCRIPTION_ISSUE_TYPE) or Len(lookup_findings.IRS_FORECLOSURE_TYPE) or Len(lookup_findings.LIEN_TYPE_1) or Len(lookup_findings.MORTGAGE_JUDGMENT_TYPE_1) or Len(lookup_findings.MOBILE_HOME_STATUS) or Len(lookup_findings.CODE_VIOLATION_DATE_1) or Len(lookup_findings.LAND_RENT_FROM_DATE)>
				<cfset send_xml = send_xml & '<ReviewTitle>CURE</ReviewTitle>'>
				<cfelse>
				<cfset send_xml = send_xml & '<ReviewTitle>CLEAR</ReviewTitle>'>
				<cfset is_clear = 1>
				</cfif>


<cfif is_clear eq 0>
				<cfif Len(lookup_findings.REASON_FOR_DELAY_TYPE)>
				<cfset send_xml = send_xml & '<TitleFindings>NO FORECLOSURE DEED - VESTING</TitleFindings>'>
				</cfif>
				<cfif Len(lookup_findings.CAUSE_TYPE)>
				<cfset send_xml = send_xml & '<TitleFindings>FANNIE MAE IS NOT IN TITLE - VESTING</TitleFindings>'>
				</cfif>
				<cfif Len(lookup_findings.TAX_TYPE_1)>
				<cfset send_xml = send_xml & '<TitleFindings>TAXES - VESTING</TitleFindings>'>
				</cfif>
				<cfif Len(lookup_findings.HOA_TYPE_1)>
				<cfset send_xml = send_xml & '<TitleFindings>HOA - VESTING</TitleFindings>'>
				</cfif>
				<cfif Len(lookup_findings.LEGAL_DESCRIPTION_ISSUE_TYPE)>
				<cfset send_xml = send_xml & '<TitleFindings>LEGAL DESCRIPTION - CURATIVE</TitleFindings>'>
				</cfif>
				<cfif Len(lookup_findings.IRS_FORECLOSURE_TYPE)>
				<cfset send_xml = send_xml & '<TitleFindings>IRS REDEMPTION - CURATIVE</TitleFindings>'>
				</cfif>
				<cfif Len(lookup_findings.LIEN_TYPE_1)>
				<cfset send_xml = send_xml & '<TitleFindings>LIENS - CURATIVE</TitleFindings>'>
				</cfif>
				<cfif Len(lookup_findings.MORTGAGE_JUDGMENT_TYPE_1)>
				<cfset send_xml = send_xml & '<TitleFindings>MORTGAGES AND JUDGEMENTS - CURATIVE</TitleFindings>'>
				</cfif>
				<cfif Len(lookup_findings.MOBILE_HOME_STATUS)>
				<cfset send_xml = send_xml & '<TitleFindings>MOBILE HOME?MANUFACTURED HOUSING - CURATIVE</TitleFindings>'>
				</cfif>
				<cfif Len(lookup_findings.CODE_VIOLATION_DATE_1)>
				<cfset send_xml = send_xml & '<TitleFindings>CODE VIOLATION - CURATIVE</TitleFindings>'>
				</cfif>
				<cfif Len(lookup_findings.LAND_RENT_FROM_DATE)>
				<cfset send_xml = send_xml & '<TitleFindings>LAND RENT - CURATIVE</TitleFindings>'>
				</cfif>



                <cfif Len(lookup_findings.REASON_FOR_DELAY_TYPE)>
				<cfset send_xml = send_xml & '<ReasonForDelay>#lookup_findings.REASON_FOR_DELAY_TYPE#</ReasonForDelay>'>
                </cfif>
                <cfif Len(lookup_findings.CAUSE_TYPE)>
				<cfset send_xml = send_xml & '<Cause>#lookup_findings.CAUSE_TYPE#</Cause>'>
                </cfif>
                <cfif Len(lookup_findings.CURRENT_OWNER)>
				<cfset send_xml = send_xml & '<CurrentOwner>#lookup_findings.CURRENT_OWNER#</CurrentOwner>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_TYPE_1)>
				<cfset send_xml = send_xml & '<TaxType1>#lookup_findings.TAX_TYPE_1#</TaxType1>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_FROM_DATE_1)>
				<cfset send_xml = send_xml & '<TaxFromDate1>#DateFormat(lookup_findings.TAX_FROM_DATE_1, 'yyyy-mm-dd')#</TaxFromDate1>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_TO_DATE_1)>
				<cfset send_xml = send_xml & '<TaxToDate1>#DateFormat(lookup_findings.TAX_TO_DATE_1, 'yyyy-mm-dd')#</TaxToDate1>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_BASE_AMOUNT_1)>
				<cfset send_xml = send_xml & '<TaxBaseAmount1>#lookup_findings.TAX_BASE_AMOUNT_1#</TaxBaseAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_PENALTY_1)>
				<cfset send_xml = send_xml & '<TaxPenaltyInterestAmount1>#lookup_findings.TAX_PENALTY_1#</TaxPenaltyInterestAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_TYPE_2)>
				<cfset send_xml = send_xml & '<TaxType2>#lookup_findings.TAX_TYPE_2#</TaxType2>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_FROM_DATE_2)>
				<cfset send_xml = send_xml & '<TaxFromDate2>#DateFormat(lookup_findings.TAX_FROM_DATE_2, 'yyyy-mm-dd')#</TaxFromDate2>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_TO_DATE_2)>
				<cfset send_xml = send_xml & '<TaxToDate2>#DateFormat(lookup_findings.TAX_TO_DATE_2, 'yyyy-mm-dd')#</TaxToDate2>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_BASE_AMOUNT_2)>
				<cfset send_xml = send_xml & '<TaxBaseAmount2>#lookup_findings.TAX_BASE_AMOUNT_2#</TaxBaseAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_PENALTY_2)>
				<cfset send_xml = send_xml & '<TaxPenaltyInterestAmount2>#lookup_findings.TAX_PENALTY_2#</TaxPenaltyInterestAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_TYPE_3)>
				<cfset send_xml = send_xml & '<TaxType3>#lookup_findings.TAX_TYPE_3#</TaxType3>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_FROM_DATE_3)>
				<cfset send_xml = send_xml & '<TaxFromDate3>#DateFormat(lookup_findings.TAX_FROM_DATE_3, 'yyyy-mm-dd')#</TaxFromDate3>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_TO_DATE_3)>
				<cfset send_xml = send_xml & '<TaxToDate3>#DateFormat(lookup_findings.TAX_TO_DATE_3, 'yyyy-mm-dd')#</TaxToDate3>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_BASE_AMOUNT_3)>
				<cfset send_xml = send_xml & '<TaxBaseAmount3>#lookup_findings.TAX_BASE_AMOUNT_3#</TaxBaseAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_PENALTY_3)>
				<cfset send_xml = send_xml & '<TaxPenaltyInterestAmount3>#lookup_findings.TAX_PENALTY_3#</TaxPenaltyInterestAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_TYPE_4)>
				<cfset send_xml = send_xml & '<TaxType4>#lookup_findings.TAX_TYPE_4#</TaxType4>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_FROM_DATE_4)>
				<cfset send_xml = send_xml & '<TaxFromDate4>#DateFormat(lookup_findings.TAX_FROM_DATE_4, 'yyyy-mm-dd')#</TaxFromDate4>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_TO_DATE_4)>
				<cfset send_xml = send_xml & '<TaxToDate4>#DateFormat(lookup_findings.TAX_TO_DATE_4, 'yyyy-mm-dd')#</TaxToDate4>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_BASE_AMOUNT_4)>
				<cfset send_xml = send_xml & '<TaxBaseAmount4>#lookup_findings.TAX_BASE_AMOUNT_4#</TaxBaseAmount4>'>
                </cfif>
                <cfif Len(lookup_findings.TAX_PENALTY_4)>
				<cfset send_xml = send_xml & '<TaxPenaltyInterestAmount4>#lookup_findings.TAX_PENALTY_4#</TaxPenaltyInterestAmount4>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TYPE_1)>
				<cfset send_xml = send_xml & '<HOA1>#lookup_findings.HOA_TYPE_1#</HOA1>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TO_DATE_1)>
				<cfset send_xml = send_xml & '<HOAToDate1>#DateFormat(lookup_findings.HOA_TO_DATE_1, 'yyyy-mm-dd')#</HOAToDate1>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_FROM_DATE_1)>
				<cfset send_xml = send_xml & '<HOAFromDate1>#DateFormat(lookup_findings.HOA_FROM_DATE_1, 'yyyy-mm-dd')#</HOAFromDate1>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_ALL_DUES_AMOUNT_1)>
				<cfset send_xml = send_xml & '<HOAAllDuesAmount1>#lookup_findings.HOA_ALL_DUES_AMOUNT_1#</HOAAllDuesAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_1)>
				<cfset send_xml = send_xml & '<HOASpecialAssessmentsAmount1>#lookup_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_1#</HOASpecialAssessmentsAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_STATEMENT_FEE_AMOUNT_1)>
				<cfset send_xml = send_xml & '<HOAStatementFeeAmount1>#lookup_findings.HOA_STATEMENT_FEE_AMOUNT_1#</HOAStatementFeeAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TRANSFER_FEE_AMOUNT_1)>
				<cfset send_xml = send_xml & '<HOATransferResaleDisclosureFeeAmount1>#lookup_findings.HOA_TRANSFER_FEE_AMOUNT_1#</HOATransferResaleDisclosureFeeAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_OUT_OF_STATUTE_AMOUNT_1)>
				<cfset send_xml = send_xml & '<HOAOutOfStatuteFeesPenaltiesChargesAmount1>#lookup_findings.HOA_OUT_OF_STATUTE_AMOUNT_1#</HOAOutOfStatuteFeesPenaltiesChargesAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_LATE_FEES_AMOUNT_1)>
				<cfset send_xml = send_xml & '<HOALateFeesPenaltiesInterestAmount1>#lookup_findings.HOA_LATE_FEES_AMOUNT_1#</HOALateFeesPenaltiesInterestAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_ATTORNEY_FEES_AMOUNT_1)>
				<cfset send_xml = send_xml & '<HOAAttorneyFeesAmount1>#lookup_findings.HOA_ATTORNEY_FEES_AMOUNT_1#</HOAAttorneyFeesAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TYPE_2)>
				<cfset send_xml = send_xml & '<HOA2>#lookup_findings.HOA_TYPE_2#</HOA2>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TO_DATE_2)>
				<cfset send_xml = send_xml & '<HOAToDate2>#DateFormat(lookup_findings.HOA_TO_DATE_2, 'yyyy-mm-dd')#</HOAToDate2>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_FROM_DATE_2)>
				<cfset send_xml = send_xml & '<HOAFromDate2>#DateFormat(lookup_findings.HOA_FROM_DATE_2, 'yyyy-mm-dd')#</HOAFromDate2>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_ALL_DUES_AMOUNT_2)>
				<cfset send_xml = send_xml & '<HOAAllDuesAmount2>#lookup_findings.HOA_ALL_DUES_AMOUNT_2#</HOAAllDuesAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_2)>
				<cfset send_xml = send_xml & '<HOASpecialAssessmentsAmount2>#lookup_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_2#</HOASpecialAssessmentsAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_STATEMENT_FEE_AMOUNT_2)>
				<cfset send_xml = send_xml & '<HOAStatementFeeAmount2>#lookup_findings.HOA_STATEMENT_FEE_AMOUNT_2#</HOAStatementFeeAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TRANSFER_FEE_AMOUNT_2)>
				<cfset send_xml = send_xml & '<HOATransferResaleDisclosureFeeAmount2>#lookup_findings.HOA_TRANSFER_FEE_AMOUNT_2#</HOATransferResaleDisclosureFeeAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_OUT_OF_STATUTE_AMOUNT_2)>
				<cfset send_xml = send_xml & '<HOAOutOfStatuteFeesPenaltiesChargesAmount2>#lookup_findings.HOA_OUT_OF_STATUTE_AMOUNT_2#</HOAOutOfStatuteFeesPenaltiesChargesAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_LATE_FEES_AMOUNT_2)>
				<cfset send_xml = send_xml & '<HOALateFeesPenaltiesInterestAmount2>#lookup_findings.HOA_LATE_FEES_AMOUNT_2#</HOALateFeesPenaltiesInterestAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_ATTORNEY_FEES_AMOUNT_2)>
				<cfset send_xml = send_xml & '<HOAAttorneyFeesAmount2>#lookup_findings.HOA_ATTORNEY_FEES_AMOUNT_2#</HOAAttorneyFeesAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TYPE_3)>
				<cfset send_xml = send_xml & '<HOA3>#lookup_findings.HOA_TYPE_3#</HOA3>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TO_DATE_3)>
				<cfset send_xml = send_xml & '<HOAToDate3>#DateFormat(lookup_findings.HOA_TO_DATE_3, 'yyyy-mm-dd')#</HOAToDate3>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_FROM_DATE_3)>
				<cfset send_xml = send_xml & '<HOAFromDate3>#DateFormat(lookup_findings.HOA_FROM_DATE_3, 'yyyy-mm-dd')#</HOAFromDate3>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_ALL_DUES_AMOUNT_3)>
				<cfset send_xml = send_xml & '<HOAAllDuesAmount3>#lookup_findings.HOA_ALL_DUES_AMOUNT_3#</HOAAllDuesAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_3)>
				<cfset send_xml = send_xml & '<HOASpecialAssessmentsAmount3>#lookup_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_3#</HOASpecialAssessmentsAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_STATEMENT_FEE_AMOUNT_3)>
				<cfset send_xml = send_xml & '<HOAStatementFeeAmount3>#lookup_findings.HOA_STATEMENT_FEE_AMOUNT_3#</HOAStatementFeeAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TRANSFER_FEE_AMOUNT_3)>
				<cfset send_xml = send_xml & '<HOATransferResaleDisclosureFeeAmount3>#lookup_findings.HOA_TRANSFER_FEE_AMOUNT_3#</HOATransferResaleDisclosureFeeAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_OUT_OF_STATUTE_AMOUNT_3)>
				<cfset send_xml = send_xml & '<HOAOutOfStatuteFeesPenaltiesChargesAmount3>#lookup_findings.HOA_OUT_OF_STATUTE_AMOUNT_3#</HOAOutOfStatuteFeesPenaltiesChargesAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_LATE_FEES_AMOUNT_3)>
				<cfset send_xml = send_xml & '<HOALateFeesPenaltiesInterestAmount3>#lookup_findings.HOA_LATE_FEES_AMOUNT_3#</HOALateFeesPenaltiesInterestAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_ATTORNEY_FEES_AMOUNT_3)>
				<cfset send_xml = send_xml & '<HOAAttorneyFeesAmount3>#lookup_findings.HOA_ATTORNEY_FEES_AMOUNT_3#</HOAAttorneyFeesAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TYPE_4)>
				<cfset send_xml = send_xml & '<HOA4>#lookup_findings.HOA_TYPE_4#</HOA4>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TO_DATE_4)>
				<cfset send_xml = send_xml & '<HOAToDate4>#DateFormat(lookup_findings.HOA_TO_DATE_4, 'yyyy-mm-dd')#</HOAToDate4>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_FROM_DATE_4)>
				<cfset send_xml = send_xml & '<HOAFromDate4>#DateFormat(lookup_findings.HOA_FROM_DATE_4, 'yyyy-mm-dd')#</HOAFromDate4>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_ALL_DUES_AMOUNT_4)>
				<cfset send_xml = send_xml & '<HOAAllDuesAmount4>#lookup_findings.HOA_ALL_DUES_AMOUNT_4#</HOAAllDuesAmount4>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_4)>
				<cfset send_xml = send_xml & '<HOASpecialAssessmentsAmount4>#lookup_findings.HOA_SPECIAL_ASSESSMENTS_AMOUNT_4#</HOASpecialAssessmentsAmount4>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_STATEMENT_FEE_AMOUNT_4)>
				<cfset send_xml = send_xml & '<HOAStatementFeeAmount4>#lookup_findings.HOA_STATEMENT_FEE_AMOUNT_4#</HOAStatementFeeAmount4>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_TRANSFER_FEE_AMOUNT_4)>
				<cfset send_xml = send_xml & '<HOATransferResaleDisclosureFeeAmount4>#lookup_findings.HOA_TRANSFER_FEE_AMOUNT_4#</HOATransferResaleDisclosureFeeAmount4>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_OUT_OF_STATUTE_AMOUNT_4)>
				<cfset send_xml = send_xml & '<HOAOutOfStatuteFeesPenaltiesChargesAmount4>#lookup_findings.HOA_OUT_OF_STATUTE_AMOUNT_4#</HOAOutOfStatuteFeesPenaltiesChargesAmount4>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_LATE_FEES_AMOUNT_4)>
				<cfset send_xml = send_xml & '<HOALateFeesPenaltiesInterestAmount4>#lookup_findings.HOA_LATE_FEES_AMOUNT_4#</HOALateFeesPenaltiesInterestAmount4>'>
                </cfif>
                <cfif Len(lookup_findings.HOA_ATTORNEY_FEES_AMOUNT_4)>
				<cfset send_xml = send_xml & '<HOAAttorneyFeesAmount4>#lookup_findings.HOA_ATTORNEY_FEES_AMOUNT_4#</HOAAttorneyFeesAmount4>'>
                </cfif>
                <cfif Len(lookup_findings.LEGAL_DESCRIPTION_ISSUE_TYPE)>
				<cfset send_xml = send_xml & '<LegalDescriptionIssue>#lookup_findings.LEGAL_DESCRIPTION_ISSUE_TYPE#</LegalDescriptionIssue>'>
                </cfif>
                <cfif Len(lookup_findings.SURVEY_STATUS)>
				<cfset send_xml = send_xml & '<SurveyStatus>#lookup_findings.SURVEY_STATUS#</SurveyStatus>'>
                </cfif>
                <cfif Len(lookup_findings.IRS_FORECLOSURE_TYPE)>
				<cfset send_xml = send_xml & '<IRSForeclosureNotice>#lookup_findings.IRS_FORECLOSURE_TYPE#</IRSForeclosureNotice>'>
                </cfif>
                <cfif Len(lookup_findings.IRS_EXPIRATION_DATE)>
				<cfset send_xml = send_xml & '<IRSExpirationDate>#DateFormat(lookup_findings.IRS_EXPIRATION_DATE, 'yyyy-mm-dd')#</IRSExpirationDate>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_TYPE_1)>
				<cfset send_xml = send_xml & '<LienType1>#lookup_findings.LIEN_TYPE_1#</LienType1>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_RECORDED_DATE_1)>
				<cfset send_xml = send_xml & '<LienRecordedDate1>#DateFormat(lookup_findings.LIEN_RECORDED_DATE_1, 'yyyy-mm-dd')#</LienRecordedDate1>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_BASE_AMOUNT_1)>
				<cfset send_xml = send_xml & '<LienBaseAmount1>#lookup_findings.LIEN_BASE_AMOUNT_1#</LienBaseAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_PENALTY_AMOUNT_1)>
				<cfset send_xml = send_xml & '<LienPenaltyInterestAmount1>#lookup_findings.LIEN_PENALTY_AMOUNT_1#</LienPenaltyInterestAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_TYPE_2)>
				<cfset send_xml = send_xml & '<LienType2>#lookup_findings.LIEN_TYPE_2#</LienType2>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_RECORDED_DATE_2)>
				<cfset send_xml = send_xml & '<LienRecordedDate2>#DateFormat(lookup_findings.LIEN_RECORDED_DATE_2, 'yyyy-mm-dd')#</LienRecordedDate2>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_BASE_AMOUNT_2)>
				<cfset send_xml = send_xml & '<LienBaseAmount2>#lookup_findings.LIEN_BASE_AMOUNT_2#</LienBaseAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_PENALTY_AMOUNT_2)>
				<cfset send_xml = send_xml & '<LienPenaltyInterestAmount2>#lookup_findings.LIEN_PENALTY_AMOUNT_2#</LienPenaltyInterestAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_TYPE_3)>
				<cfset send_xml = send_xml & '<LienType3>#lookup_findings.LIEN_TYPE_3#</LienType3>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_RECORDED_DATE_3)>
				<cfset send_xml = send_xml & '<LienRecordedDate3>#DateFormat(lookup_findings.LIEN_RECORDED_DATE_3, 'yyyy-mm-dd')#</LienRecordedDate3>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_BASE_AMOUNT_3)>
				<cfset send_xml = send_xml & '<LienBaseAmount3>#lookup_findings.LIEN_BASE_AMOUNT_3#</LienBaseAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.LIEN_PENALTY_AMOUNT_3)>
				<cfset send_xml = send_xml & '<LienPenaltyInterestAmount3>#lookup_findings.LIEN_PENALTY_AMOUNT_3#</LienPenaltyInterestAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_TYPE_1)>
				<cfset send_xml = send_xml & '<MortgageJudgement1>#lookup_findings.MORTGAGE_JUDGMENT_TYPE_1#</MortgageJudgement1>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_LEVY_DATE_1)>
				<cfset send_xml = send_xml & '<MortgageJudgementLevyDate1>#DateFormat(lookup_findings.MORTGAGE_JUDGMENT_LEVY_DATE_1, 'yyyy-mm-dd')#</MortgageJudgementLevyDate1>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_LIEN_AMOUNT_1)>
				<cfset send_xml = send_xml & '<MortgageJudgementLienDollarValue1>#lookup_findings.MORTGAGE_JUDGMENT_LIEN_AMOUNT_1#</MortgageJudgementLienDollarValue1>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_IN_FAVOR_OF_1)>
				<cfset send_xml = send_xml & '<MortgageJudgementInFavorOf1>#lookup_findings.MORTGAGE_JUDGMENT_IN_FAVOR_OF_1#</MortgageJudgementInFavorOf1>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_TYPE_2)>
				<cfset send_xml = send_xml & '<MortgageJudgement2>#lookup_findings.MORTGAGE_JUDGMENT_TYPE_2#</MortgageJudgement2>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_LEVY_DATE_2)>
				<cfset send_xml = send_xml & '<MortgageJudgementLevyDate2>#DateFormat(lookup_findings.MORTGAGE_JUDGMENT_LEVY_DATE_2, 'yyyy-mm-dd')#</MortgageJudgementLevyDate2>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_LIEN_AMOUNT_2)>
				<cfset send_xml = send_xml & '<MortgageJudgementLienDollarValue2>#lookup_findings.MORTGAGE_JUDGMENT_LIEN_AMOUNT_2#</MortgageJudgementLienDollarValue2>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_IN_FAVOR_OF_2)>
				<cfset send_xml = send_xml & '<MortgageJudgementInFavorOf2>#lookup_findings.MORTGAGE_JUDGMENT_IN_FAVOR_OF_2#</MortgageJudgementInFavorOf2>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_TYPE_3)>
				<cfset send_xml = send_xml & '<MortgageJudgement3>#lookup_findings.MORTGAGE_JUDGMENT_TYPE_3#</MortgageJudgement3>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_LEVY_DATE_3)>
				<cfset send_xml = send_xml & '<MortgageJudgementLevyDate3>#DateFormat(lookup_findings.MORTGAGE_JUDGMENT_LEVY_DATE_3, 'yyyy-mm-dd')#</MortgageJudgementLevyDate3>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_LIEN_AMOUNT_3)>
				<cfset send_xml = send_xml & '<MortgageJudgementLienDollarValue3>#lookup_findings.MORTGAGE_JUDGMENT_LIEN_AMOUNT_3#</MortgageJudgementLienDollarValue3>'>
                </cfif>
                <cfif Len(lookup_findings.MORTGAGE_JUDGMENT_IN_FAVOR_OF_3)>
				<cfset send_xml = send_xml & '<MortgageJudgementInFavorOf3>#lookup_findings.MORTGAGE_JUDGMENT_IN_FAVOR_OF_3#</MortgageJudgementInFavorOf3>'>
                </cfif>
                <cfif Len(lookup_findings.MOBILE_HOME_STATUS)>
				<cfset send_xml = send_xml & '<MobileHomeManufacturedHousingRealPropertyStatus>#lookup_findings.MOBILE_HOME_STATUS#</MobileHomeManufacturedHousingRealPropertyStatus>'>
                </cfif>
                <cfif Len(lookup_findings.MOBILE_HOME_CONVERSION_TYPE)>
				<cfset send_xml = send_xml & '<MobileHomeManufacturedHouseRequiredConversionDocument>#lookup_findings.MOBILE_HOME_CONVERSION_TYPE#</MobileHomeManufacturedHouseRequiredConversionDocument>'>
                </cfif>
                <cfif Len(lookup_findings.MOBILE_HOME_COMPLETION_DATE)>
				<cfset send_xml = send_xml & '<MobileHomeManufacturedHouseEstimatedCompletionDate>#DateFormat(lookup_findings.MOBILE_HOME_COMPLETION_DATE, 'yyyy-mm-dd')#</MobileHomeManufacturedHouseEstimatedCompletionDate>'>
                </cfif>
                <cfif Len(lookup_findings.CODE_VIOLATION_DATE_1)>
				<cfset send_xml = send_xml & '<CodeViolationDate1>#DateFormat(lookup_findings.CODE_VIOLATION_DATE_1, 'yyyy-mm-dd')#</CodeViolationDate1>'>
                </cfif>
                <cfif Len(lookup_findings.CODE_VIOLATION_AMOUNT_1)>
				<cfset send_xml = send_xml & '<CodeViolationAmount1>#lookup_findings.CODE_VIOLATION_AMOUNT_1#</CodeViolationAmount1>'>
                </cfif>
                <cfif Len(lookup_findings.CODE_VIOLATION_TYPE_1)>
				<cfset send_xml = send_xml & '<CodeViolationViolation1>#lookup_findings.CODE_VIOLATION_TYPE_1#</CodeViolationViolation1>'>
                </cfif>
                <cfif Len(lookup_findings.CODE_VIOLATION_DATE_2)>
				<cfset send_xml = send_xml & '<CodeViolationDate2>#DateFormat(lookup_findings.CODE_VIOLATION_DATE_2, 'yyyy-mm-dd')#</CodeViolationDate2>'>
                </cfif>
                <cfif Len(lookup_findings.CODE_VIOLATION_AMOUNT_2)>
				<cfset send_xml = send_xml & '<CodeViolationAmount2>#lookup_findings.CODE_VIOLATION_AMOUNT_2#</CodeViolationAmount2>'>
                </cfif>
                <cfif Len(lookup_findings.CODE_VIOLATION_TYPE_2)>
				<cfset send_xml = send_xml & '<CodeViolationViolation2>#lookup_findings.CODE_VIOLATION_TYPE_2#</CodeViolationViolation2>'>
                </cfif>
                <cfif Len(lookup_findings.CODE_VIOLATION_DATE_3)>
				<cfset send_xml = send_xml & '<CodeViolationDate3>#DateFormat(lookup_findings.CODE_VIOLATION_DATE_3, 'yyyy-mm-dd')#</CodeViolationDate3>'>
                </cfif>
                <cfif Len(lookup_findings.CODE_VIOLATION_AMOUNT_3)>
				<cfset send_xml = send_xml & '<CodeViolationAmount3>#lookup_findings.CODE_VIOLATION_AMOUNT_3#</CodeViolationAmount3>'>
                </cfif>
                <cfif Len(lookup_findings.CODE_VIOLATION_TYPE_3)>
				<cfset send_xml = send_xml & '<CodeViolationViolation3>#lookup_findings.CODE_VIOLATION_TYPE_3#</CodeViolationViolation3>'>
                </cfif>
                <cfif Len(lookup_findings.LAND_RENT_FROM_DATE)>
				<cfset send_xml = send_xml & '<LandRentFromDate>#DateFormat(lookup_findings.LAND_RENT_FROM_DATE, 'yyyy-mm-dd')#</LandRentFromDate>'>
                </cfif>
                <cfif Len(lookup_findings.LAND_RENT_TO_DATE)>
				<cfset send_xml = send_xml & '<LandRentToDate>#DateFormat(lookup_findings.LAND_RENT_TO_DATE, 'yyyy-mm-dd')#</LandRentToDate>'>
                </cfif>
                <cfif Len(lookup_findings.LAND_RENT_BASE_AMOUNT)>
				<cfset send_xml = send_xml & '<LandRentBaseAmount>#lookup_findings.LAND_RENT_BASE_AMOUNT#</LandRentBaseAmount>'>
                </cfif>
                <cfif Len(lookup_findings.LAND_RENT_PENALTY_AMOUNT)>
				<cfset send_xml = send_xml & '<LandRentPenaltyInterestAmount>#lookup_findings.LAND_RENT_PENALTY_AMOUNT#</LandRentPenaltyInterestAmount>'>
                </cfif>
                <cfif Len(lookup_findings.COMMENTS)>
				<cfset send_xml = send_xml & '<Comments>#lookup_findings.COMMENTS#</Comments>'>
                </cfif>
	</cfif>
				<cfset send_xml = send_xml & '</#element_text#>
			</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Report Title Findings sent to Equator', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>



<cffunction name="sendTitleUpdate" output="true">
<cfargument name="titleID" required="true">
<cfargument name="filename">
<cfargument name="message">
<cfset temp = setupVariables(titleId=arguments.titleId)>




		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.titleID#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Title Update - SENT ::. #message# Equator_Title_TractionID '#lookup_transaction.equator_title_transactionID#'">


<cfset the_fileName =  ''>
<cfset the_ext =  ''>
<cfset base64_file = ''>

<cfif Len(arguments.filename)>
<cfset the_fileName =  arguments.filename>
<cfset the_ext =  ListLast(arguments.filename, '.')>
<cffile action="READBINARY" file="#fileSys.FindFilePath('#arguments.filename#', 'file')#" variable="M1">
<cfset base64_file = ToBase64(m1)>
</cfif>


<cfset send_xml = '<Message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_equator_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_equator_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="UPDATE" transactionID="#lookup_transaction.equator_title_transactionID#">
			<Comment priority="1">
				<Subject>Message From Streamline Title</Subject>
				<Body>#arguments.message#</Body>
			</Comment>
			<Attachment name="#the_fileName#" type="#the_ext#"  description="#the_fileName#">
				<Checksum></Checksum>
				<Payload>#base64_file#</Payload>
			</Attachment>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = title_xml_opener & send_xml & title_xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#title_posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "EQ_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\equator_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('Equator', 'Integration', #lookup_transaction.title_id#, 'Title Update - SENT - to Equator: #message#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>

</cfcomponent>

