<cfcomponent>
<cfset fileSys = CreateObject('component','cfc.FileManagement')>

<!--- URL we post to when posting to LOGS --->

<cfset posting_url = "https://uatintegration.logs.com/netdirectorintegrationwebservice/streamlinetitleintegration.asmx?WSDL">
<cfset catch_url = "http://www.streamline-title.com/LOGS/catch_outgoing.cfm">


<!--- Our credentials for posting to LOGS --->
<cfset our_LOGS_username = "STLOGS">
<cfset our_LOGS_password = "STLOGSPass">
<!--- <cfset our_LOGS_username = "NetDirInt">
<cfset our_LOGS_password = "InTeg3R@t4Ion!wS"> --->
<!--- LOGS's credentials for posting to us --->
<cfset LOGS_username = "LOGS">
<cfset LOGS_password = "LOGStest4782">

<cfset company_id =  1754><!--- TEST ACCOUNT --->
<cfset lo_id =  6295> <!--- Rick jermain --->
<cfset lp_id =  4614> <!--- Rick jermain --->
<cfset team_id =  11> <!--- Inactive/TestAccounts --->
<cfset team_email =  'rick@jermain.com'> <!--- Inactive/TestAccounts --->

<!--- <cfset xml_opener = '<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:web="http://tempuri.org/">
   <soapenv:Header/>
   <soapenv:Body>
      <web:PostStreamLineProductResults>
   '>


<cfset xml_closer = '</web:PostStreamLineProductResults>
   </soapenv:Body>
</soapenv:Envelope>'>
 --->



<cfset xml_opener = '<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><PostStreamLineProductResults xmlns="http://www.logs.com/WebServices/StreamLineTitleIntegration.asmx"><StreamLineProductXMLData>
   '>


<cfset xml_closer = '</StreamLineProductXMLData></PostStreamLineProductResults></s:Body></s:Envelope>'>


<cffunction name="sendEmailNotification" output="true">
	<cfargument name="message" required="true">
	<cfargument name="title_id" required="true">
	<cfargument name="subject" required="true">

<cfmail to="#team_email#" from="LOGSIntegration@streamline-title.com" subject="ST-#arguments.title_id#: #arguments.subject#" type="html">
<h3><font color="0099FF" face="Arial, Helvetica, sans-serif">Message from Streamline/LOGS Integration</font></h2><br>
<br>
<font color="333333" face="Arial, Helvetica, sans-serif">ST-#arguments.title_id#: #arguments.message#</font><br>
<br>
<font color="999999">This message was generated automatically, please do not reply to it.</font>
</cfmail>

</cffunction>










<cffunction name="sendSuccess" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="order_id" required="true">
	<cfargument name="posted_xml_filename" required="true">
<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\LOGS\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::SUCCESSFUL::. Posted XML file #arguments.posted_xml_filename#">
<CFCONTENT 
  TYPE="text/xml" 
  RESET="Yes"><CFOUTPUT><?xml version="1.0" encoding="UTF-8"?>
<Message id="#CreateUUID()#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<TransmissionStatus>SUCCESS</TransmissionStatus>
		<OrderID>#arguments.order_id#</OrderID>
	</Header>
</Message></CFOUTPUT>
</cffunction>



<cffunction name="sendOrderTitlePolicySuccess" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="order_id" required="true">
	<cfargument name="posted_xml_filename" required="true">
<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\LOGS\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::SUCCESSFUL::. Posted XML file #arguments.posted_xml_filename#">
<CFCONTENT 
  TYPE="text/xml" 
  RESET="Yes"><CFOUTPUT><?xml version="1.0" encoding="UTF-8"?>
<Message id="#CreateUUID()#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<TransmissionStatus>SUCCESS</TransmissionStatus>
		<OrderID>#arguments.order_id#</OrderID>
	</Header>
</Message></CFOUTPUT>

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('LOGS', 'Integration', #arguments.order_id#, 'Title Policy - ordered through LOGS system', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>






<cffunction name="sendFailure" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="posted_xml_filename" required="true">
<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\LOGS\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::ERROR::. Posted XML file #arguments.posted_xml_filename# '#arguments.message#'">
<CFCONTENT 
  TYPE="text/xml" 
  RESET="Yes"><CFOUTPUT><?xml version="1.0" encoding="UTF-8"?>
<Message id="#createUUID()#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<TransmissionStatus>FAILURE</TransmissionStatus>
		<Reason>#arguments.message#</Reason>
	</Header>
</Message></CFOUTPUT>
<cfabort>
</cffunction>



<cffunction name="checkCredentials" output="true">
	<cfargument name="sent_username" required="true">
	<cfargument name="sent_password" required="true">
	<cfargument name="posted_xml_filename" required="true">

<cfif (arguments.sent_username neq LOGS_username) or  (arguments.sent_password neq LOGS_password)>

<cfinvoke	component = "cfc.LOGS"	method = "sendFailure" message="Post Failed" posted_xml_filename="#arguments.posted_xml_filename#" condition="Fail">
</cfif>
</cffunction>







<cffunction name="sendPropReportProduct" output="true">
<cfargument name="order_id" required="true">
<cfargument name="filename" required="true">
		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Property where prop_id = '#arguments.order_id#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\LOGS\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Product Delivered - #lookup_transaction.search_type# ::. LOGS_TractionID '#lookup_transaction.LOGStransactionID#'">

<cffile action="READ" file="#fileSys.FindFilePath('#arguments.filename#', 'file')#" variable="M1">
<cfset base64_file = ToBase64(m1)>

<cfset send_xml = '<?xml version="1.0" encoding="UTF-8"?>
<Message  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_logs_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_logs_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="ORDER_COMPLETE" transactionID="#arguments.order_id#" type="#lookup_transaction.search_type#">
				<Document name="#arguments.filename#" type="PDF">
	<Payload>#base64_file#</Payload>
				</Document>
				<Comments></Comments>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = xml_opener & send_xml & xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>

<cfset posted_xml_filename = "LOGS_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\logs\logs_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('LOGS', 'Integration', #arguments.order_id#, 'Prop Report - #lookup_transaction.search_type# - sent to LOGS: File #arguments.filename#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>








<cffunction name="sendTitleCommitment" output="true">
<cfargument name="order_id" required="true">
<cfargument name="filename" required="true">

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.order_id#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\LOGS\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Title Commitment Delivered -  ::. LOGS_TransactionID '#lookup_transaction.LOGStransactionID#'">

<cffile action="READ" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\admin_area\tcs\#arguments.filename#" variable="M1">
<cfset base64_file = ToBase64(m1)>


<cfset send_xml = '<Message  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_logs_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_logs_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="ORDER_COMPLETE" transactionID="#arguments.order_id#" type="TitleCommitment">
				<Document name="#arguments.filename#" type="PDF">
	<Payload>#base64_file#</Payload>
				</Document>
				<Comments></Comments>
		</Order>
	</Body>
</Message>'>



    <cfset full_xml = send_xml>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<!--- <cfhttp url="#posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp> --->
	
	<cfinvoke 
    webservice = "#posting_url#"
    method = "PostStreamLineProductResults"
    returnVariable = "logs_return"
    timeout = "120">
	<cfinvokeargument name="StreamLineProductXMLData" value="#send_xml#">
	</cfinvoke>

<cfset arr=ReplaceNoCase(logs_return, '&lt;', '<', 'ALL')>
<cfset arr=ReplaceNoCase(arr, '&gt;', '>', 'ALL')>
<cfset logs_returned_xml = arr>

<cfset posted_xml_filename = "LOGS_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\logs\logs_responses\#posted_xml_filename#" nameconflict="makeunique" output="#logs_returned_xml#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('LOGS', 'Integration', #lookup_transaction.title_id#, 'Title Committment - sent to LOGS: File #arguments.filename#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>







<cffunction name="sendTitlePolicy" output="true">
<cfargument name="order_id" required="true">
<cfargument name="filename" required="true">

		<CFQUERY datasource="#request.dsn#" NAME="lookup_transaction">
			select * from Title where title_id = '#arguments.order_id#'
		</CFQUERY>

<cffile action="append" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\LOGS\activity_log.txt" addnewline="yes" output="#DateFormat(Now(), 'yyyy-mm-dd')# #TimeFormat(Now(), 'hh:mm:ss')# .::Title Commitment Delivered -  ::. LOGS_TransactionID '#lookup_transaction.LOGStransactionID#'">

<cffile action="READ" file="#fileSys.FindFilePath('#arguments.filename#', 'file')#" variable="M1">
<cfset base64_file = ToBase64(m1)>


<cfset send_xml = '<?xml version="1.0" encoding="UTF-8"?>
<Message  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<Header>
		<LoginAccountIdentifier>#our_logs_username#</LoginAccountIdentifier>
		<LoginAccountPassword>#our_logs_password#</LoginAccountPassword>		
	</Header>
	<Body>
		<Order action="ORDER_COMPLETE" transactionID="#arguments.order_id#" type="TitlePolicy">
				<Document name="#arguments.filename#" type="PDF">
	<Payload>#base64_file#</Payload>
				</Document>
				<Comments></Comments>
		</Order>
	</Body>
</Message>'>

    <cfset full_xml = xml_opener & send_xml & xml_closer>

	<cfhttp url="#catch_url#" method="post" resolveurl="no">
	<cfhttpparam type="body" name="raw_xml" value="#trim(full_xml)#">
	</cfhttp>

	<cfhttp url="#posting_url#" method="post" resolveurl="no">
	<cfhttpparam type="xml" value="#trim(full_xml)#" />
	</cfhttp>


<cfset posted_xml_filename = "LOGS_RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\logs\logs_responses\#posted_xml_filename#" nameconflict="makeunique" output="#cfhttp.filecontent#">

<CFQUERY datasource="#request.dsn#">		
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('LOGS', 'Integration', #lookup_transaction.title_id#, 'Title Policy - sent to LOGS: File #arguments.filename#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>

</cffunction>





</cfcomponent>

