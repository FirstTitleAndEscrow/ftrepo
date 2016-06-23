

<cfcomponent>
	<cfset variables.eventXml = "">
	<cfset variables.transactionID = "">
	<cfset variables.productUniqueID = "">
	<cfset variables.productCode = "">
	<cfset variables.document = "">
	<cfset variables.documentPath = "c:\uploads\">
	<cfset variables.documentDesc = "">
	<cfset variables.comment = "">
	<cfset variables.comp_id = "">
	<cfset variables.team_id = "">
	<cfset variables.team_email = "">
	<cfset variables.intsales = "">
	<cfset variables.intsalesfname = "">
	<cfset variables.intsaleslname = "">
	<cfset variables.intsalesemail = "">
	<cfset variables.title_id = "">
	<cfset variables.reasonCode = "">
	<cfset variables.reasonDesc = "">
	

	<cfif request.envName EQ "dev">
		<cfset variables.sourceID = "7001122">
		<cfset variables.sourceApp = "FT-RealEC">
		<cfset variables.partyID = "7001124">
		<cfset variables.username = "recdemo">
		<cfset variables.urlToPost = "#request.httpurl#/chaseRealEC/eventPost.cfm">
	<cfelse>
		<cfset variables.sourceID = "1780">
		<cfset variables.sourceApp = "FT-RealEC">
		<cfset variables.partyID = "13452775">
		<cfset variables.username = "recdemo">
		<cfset variables.urlToPost = "http://machine1.firsttitleservices.com/chaseRealEC/eventPost.cfm">
	</cfif>

	<cffunction name="processEvent" access="public" output="true" returntype="void" hint="I process all RealEC events">
		<cfargument name="eventCode" type="numeric" required="true" hint="I am the realEC event code">
		<cfargument name="eventxml" type="xml" required="false">
		<cfargument name="title_id" type="numeric" required="false">
		<cfargument name="firstTitleSending" type="boolean" required="false" hint="I am true if first title sends this event and false if firstitle receives this event" default="false">
		<cfargument name="documentInfo" type="struct" required="false">
		<cfargument name="productCode" type="string" required="false">
		<cfargument name="comment" type="string" required="false">
		<cfargument name="signingMethod" type="struct" required="false">
		<cfargument name="signingLocation" type="struct" required="false">
		<cfargument name="reasonInfo" type="struct" required="false">
		<cfargument name="senderTrackingInfo" type="struct" required="false">
		<cfargument name="recordingInfo" type="struct" required="false">
		<cfargument name="reasonCode" type="string" required="false">
		<cfargument name="reasonDesc" type="string" required="false">
		<cfargument name="payoffno" type="numeric" required="false">
		<cfset var returnXml = "">
		
		<cfif isDefined("arguments.eventXml")>
			<cfset setEventXml(arguments.eventXml)>
		</cfif>
		<cfif isDefined("arguments.title_id")>
			<cfset transID = getRealECTransactionID(title_id)>
			<cfset setTitleID(arguments.title_id)>
		</cfif>
		<cfif isDefined("arguments.productCode")>
			<cfset setProductCode(arguments.productCode)>
			<cfset getRealECProductUniqueID()>
		</cfif>
		<cfif isDefined("arguments.documentInfo.document")>
			<cfset setDocument(arguments.documentInfo.document)>
		</cfif>
		<cfif isDefined("arguments.documentInfo.documentDesc")>
			<cfset setDocumentDesc(arguments.documentInfo.documentDesc)>
		</cfif>
		<cfif isDefined("arguments.documentInfo.documentPath")>
			<cfset setDocumentPath(arguments.documentInfo.documentPath)>
		</cfif>
		<cfif isDefined("arguments.comment")>
			<cfset setComment(arguments.comment)>
		</cfif>
		<cfif isDefined("arguments.reasonCode")>
			<cfset setReasonCode(arguments.reasonCode)>
		</cfif>
		<cfif isDefined("arguments.reasonDesc")>
			<cfset setReasonDesc(arguments.reasonDesc)>
		</cfif>
		
		<cfif arguments.eventCode NEQ 100 AND arguments.firsttitlesending EQ "false">
			<cfswitch expression="#arguments.eventCode#">
				<cfcase value="220">
					<cfset event="Comment">
					<cfset product="General">
				</cfcase>
				<cfcase value="222">
					<cfset event="Comment Action Required">
					<cfset product="General">
				</cfcase>
				<cfcase value="230">
					<cfset event="Service On Hold">
					<cfset product="General">
				</cfcase>
				<cfcase value="240">
					<cfset event="Service Cancelled">
					<cfset product="General">
				</cfcase>
				<cfcase value="260">
					<cfset event="Service Resume">
					<cfset product="General">
				</cfcase>
				<cfcase value="325">
					<cfset event="Loan Contact Updated">
					<cfset product="General">
				</cfcase>
				<cfcase value="460">
					<cfset event="Document Delivered">
					<cfset product="General">
				</cfcase>
				<cfcase value="431">
					<cfset event="Closing Instructions">
					<cfset product="Closing">
				</cfcase>
				<cfcase value="432">
					<cfset event="Closing Modifications Requested">
					<cfset product="Closing">
				</cfcase>
				<cfcase value="434">
					<cfset event="Closing Statement Approved">
					<cfset product="Closing">
				</cfcase>
				<cfcase value="724">
					<cfset event="Order Payoff Requested">
					<cfset product="Closing">
				</cfcase>
				<cfcase value="737">
					<cfset event="Funding Approved By Lender">
					<cfset product="Closing">
				</cfcase>
				<cfcase value="760">
					<cfset event="Document Package Delivered By Lender">
					<cfset product="Closing">
				</cfcase>
				<cfcase value="824">
					<cfset event="Subordination Order Request">
					<cfset product="Subordination">
				</cfcase>
			</cfswitch>
			<!---
			<cfif isDefined("event") AND isDefined("product")>
			
			<cfmail to="ericmbrancaccio@gmail.com" from="chaseorders@firsttitleservices.com" subject="RealEC Event Received" type="html">
				Event: #event#
				Product: #product#
			</cfmail>
			
			</cfif>
			--->
		</cfif>
		
		<cfswitch expression="#arguments.eventCode#">
			<cfcase value="100">
				<!--- Insert logic here to determine 130 vs 140--->
				<cfset processEvent100()>
			</cfcase>
			<cfcase value="130">
				<cfset process130Or140Event(130)>
			</cfcase>
			<cfcase value="140">
				<cfset process130Or140Event(140)>
			</cfcase>
			<!---Product delivered by provider --->
			<cfcase value="150">
				<cfset process150Event(documentInfo=arguments.documentInfo)>
			</cfcase>
			<!---Document delivered by provider --->
			<cfcase value="180">
				<cfset process180Event(documentInfo=arguments.documentInfo)>
			</cfcase>
			<!---Comment --->
			<cfcase value="220">
				<cfset process220Event(firstTitleSending=arguments.firstTitleSending)>
			</cfcase>
			
			<!---Comment With Action--->
			<cfcase value="222">
				<cfset process222Event(firstTitleSending=arguments.firstTitleSending)>
			</cfcase>
			
			<!---Service On Hold --->
			<cfcase value="230">
				<cfset process230Event(firstTitleSending=arguments.firstTitleSending)>
			</cfcase>
			
			<!---Service Cancelled --->
			<cfcase value="240">
				<cfset process240Event()>
			</cfcase>
			
			<!---Service Resume --->
			<cfcase value="260">
				<cfset process260Event(firstTitleSending=arguments.firstTitleSending)>
			</cfcase>
			
			<!---Service Cancel Confirm --->
			<cfcase value="280">
				<cfset process280Event()>
			</cfcase>
			
			<!---Service Completed --->
			<cfcase value="270">
				<cfset process270Event()>
			</cfcase>
			
			<!---Scheduled --->
			<cfcase value="300">
				<cfset process300Event(signingMethod=arguments.signingMethod)>
			</cfcase>
			
			
			
			<!---Schedule Information Update --->
			<cfcase value="303">
				<cfset process303Event(signingLocation=arguments.signingLocation)>
			</cfcase>
			
			<!---Rescheduled --->
			<cfcase value="310">
				<cfif isDefined("arguments.signingmethod")>
					<cfset process310Event(signingMethod=arguments.signingMethod,firstTitleSending=arguments.firstTitleSending)>
				<cfelse>
						<cfset process310Event(firstTitleSending=arguments.firstTitleSending)>
				</cfif>
			</cfcase>
			
			<!---Loan Contact Update --->
			<cfcase value="325">
				<cfset process325Event()>
			</cfcase>
			
			<!---Closing Statement Delivered --->
			<cfcase value="406">
				<cfset process406Event(documentInfo=arguments.documentInfo)>
			</cfcase>
			
			<!---Order assigned information --->
			<cfcase value="410">
				<cfset process410Event()>
			</cfcase>
			
			<!---Closing Instuctions --->
			<cfcase value="431">
				<cfset process431Event()>
			</cfcase>
			
			<!---Closing Modifications Requested --->
			<cfcase value="432">
				<cfset process432Event()>
			</cfcase>
			
			<!---Closing Statement Modifications Complete --->
			<cfcase value="433">
				<cfset process433Event(documentInfo=arguments.documentInfo)>
			</cfcase>
			
			<!---Closing Statement Approved By Lender --->
			<cfcase value="434">
				<cfset process434Event()>
			</cfcase>
			
			<!---Closing Statement Distributed By Provider --->
			<cfcase value="435">
				<cfset process435Event(documentInfo=arguments.documentInfo)>
			</cfcase>
			
			<!---Document attached by lender --->
			<cfcase value="460">
				<cfset process460Event()>
			</cfcase>
			
			<!---Curative Pending --->
			<cfcase value="492">
				<cfset process492Event(reasonInfo=arguments.reasonInfo)>
			</cfcase>
			
			<!---Curative Cleared --->
			<cfcase value="500">
				<cfset process500Event()>
			</cfcase>
			
			<!---Documents Shipped Information --->
			<cfcase value="690">
				<cfset process690Event(senderTrackingInfo=arguments.senderTrackingInfo)>
			</cfcase>
			
			<!---Documents Shipped Received --->
			<cfcase value="691">
				<cfset process691Event(senderTrackingInfo=arguments.senderTrackingInfo)>
			</cfcase>
			
			<!---Ready For Recording --->
			<cfcase value="694">
				<cfset process694Event(senderTrackingInfo=arguments.senderTrackingInfo)>
			</cfcase>

			<!---Recorded --->
			<cfcase value="695">
				<cfset process695Event(recordingInfo=arguments.recordingInfo)>
			</cfcase>
			
			<!---Order Payoff requested --->
			<cfcase value="724">
				<cfset process724Event()>
			</cfcase>
			
			<!---Payoff ordered --->
			<cfcase value="725">
				<cfset process725Event(payoffno=arguments.payoffno)>
			</cfcase>
			
			<!---Payoff delivered--->
			<cfcase value="726">
				
				<cfset process726Event(documentInfo=arguments.documentInfo)>
			</cfcase>
			
			<!---Clear to fund --->
			<cfcase value="732">
				<cfset process732Event()>
			</cfcase>
			
			<!---Not clear to fund --->
			<cfcase value="733">
				<cfset process733Event()>
			</cfcase>
			
			
			<!---Provider disbursed funds --->
			<cfcase value="734">
				<cfset process734Event(documentInfo=arguments.documentInfo)>
			</cfcase>
			
			<!---Funding Approved By Lender --->
			<cfcase value="737">
				<cfset process737Event()>
			</cfcase>
			
			<!---Document Package Delivered By Lender --->
			<cfcase value="760">
				<cfset process760Event()>
			</cfcase>
			
			<!---Closing documents not executed --->
			<cfcase value="766">
				<cfset process766Event()>
			</cfcase>
			
			<!---Critical Documents Posted --->
			<cfcase value="768">
				<cfset process768Event(documentInfo=arguments.documentInfo)>
			</cfcase>

			
			
			<!---Final Documents Posted --->
			<cfcase value="780">
				<cfset process780Event(documentInfo=arguments.documentInfo)>
			</cfcase>
			
			<!---Subordination Request --->
			<cfcase value="824">
				<cfset process824Event()>
			</cfcase>
			
			<!---Subordination Agreement Received from Lender --->
			<cfcase value="826">
				<cfset process826Event(documentInfo=arguments.documentInfo)>
			</cfcase>
			
			<cfdefaultcase>
				<cfset processGenericEvent(arguments.eventCode)>
			</cfdefaultcase>
			
			
		</cfswitch>
		
	
	</cffunction>
	
	<cffunction name="getRealECCurrentDateTime" returnType="string"><cfreturn DateFormat(Now(),'yyyy/mm/dd')&" "& TimeFormat(Now(),'hh:mm:ss')></cffunction>
	
	<cffunction name="getEventCode" access="public" output="false" returntype="numeric">
		<cfargument name="eventxml" type="xml" required="true">
		<cfset var eventCode = "">
		<cfset var pEventXml = "">
		<cfset var strEvent = StructNew()>
		
		<cfset pEventXml = XmlParse(arguments.eventXml)>
		<cfset strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		
		<cfset eventCode = strEvent.Transaction.ProductList.Product.Event.Reccode>
		
		<cfreturn eventCode>
	</cffunction>
	
	
	<cffunction name="postXml" access="private" output="true" returntype="void">
		<cfargument name="returnXml" type="xml" required="true">
		
		<cfhttp url="#variables.urlToPost#" method="post">
			<cfhttpparam value="#arguments.returnXml.Trim()#" type="xml">
		</cfhttp>
         <cfoutput>#cfhttp.filecontent#</cfoutput>
	</cffunction>
	
	
	<cffunction name="createUniqueDocName" returnType="string">
		<cfargument name="docName" type="String" required="true">
		<cfset var fullPath = getDocumentPath()&arguments.docName>
		<cfif FileExists(fullPath)>
			<cfset fileName = ListFirst(docName,".")>
			<cfset extension = ListLast(docName,".")>
			<cfset returnFile = fileName&RandRange(1,1000)&"."&extension>
			<cfreturn returnFile>
			
		<cfelse>
			<cfreturn arguments.docName>
		</cfif>
		
	</cffunction>
	
	<cffunction name="saveDocuments" access="private" output="false" returntype="void">
		<cfset var pEventXml = XmlParse(getEventXml())>
		<cfset var strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		<cfset var team = CreateObject('component','team_info')>
		
		<cfset documents = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/DocumentList/Document")>
		<cfif ArrayLen(documents)>
			<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_data">
			Delete
			FROM ChaseRealEC_DocumentList
			WHERE TransactionID = '#getTransactionID()#'
			</CFQUERY>
			
			<cfloop from="1" to="#arrayLen(documents)#" index="i">
				<cfset strDocument = flattenXmlToStruct(documents[i])>
				<cfparam name="strDocument.Content" default="">
				<cfparam name="strDocument.Description" default="">
				<cfparam name="strDocument.DocDate" default="">
				<cfparam name="strDocument.DocName" default="">
				<cfparam name="strDocument.FileName" default="">
				<cfparam name="strDocument.DocPassword" default="">
				<cfparam name="strDocument.DocStatus" default="">
				<cfparam name="strDocument.DocType" default="">
				<cfparam name="strDocument.DocUserID" default="">
				<cfparam name="strDocument.DocVersion" default="">
				<cfparam name="strDocument.EncodeType" default="">
				 
				<cfset temp = ToBinary(strDocument.Content)>
				<cfset fileName = createUniqueDocName(strDocument.FileName)>
				
				<cffile action="write" addnewline="no" file="c:\uploads\#FileName#" output="#temp#">
				 
				<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">
				Insert into ChaseRealEC_DocumentList (TransactionID,Trns_PrdList_Prod_DocList_Doc_Description,Trns_PrdList_Prod_DocList_Doc_DocDate,Trns_PrdList_Prod_DocList_Doc_DocName,Trns_PrdList_Prod_DocList_Doc_DocPassword,Trns_PrdList_Prod_DocList_Doc_DocStatus,Trns_PrdList_Prod_DocList_Doc_DocType,Trns_PrdList_Prod_DocList_Doc_DocUserID,Trns_PrdList_Prod_DocList_Doc_DocVersion,Trns_PrdList_Prod_DocList_Doc_EncodeType,doc_name_on_server)
				values
				('#getTransactionID()#','#strDocument.Description#',<cfif len(strDocument.docDate)>#CreateODBCDateTime(strDocument.DocDate)#<cfelse>null</cfif>,'#strDocument.FileName#','#strDocument.DocPassword#','#strDocument.DocStatus#','#strDocument.DocType#','#strDocument.DocUserID#','#strDocument.DocVersion#','#strDocument.EncodeType#','#fileName#')
				</CFQUERY>

				<cfset email_subject = 'Document ' & #fileName# & ' uploaded'>
				<cfset email_content = 'Document ' & #fileName# & ' uploaded'>
				 <cfif len(strDocument.Description)> 
				   <cfset email_subject = email_subject & ': #strDocument.Description#'>
				   <cfset email_content = email_content & ': #strDocument.Description#'>
				 </cfif>
				 <cfif len(strDocument.DocPassword)> 
				   <cfset email_content = email_content & ': Document Password: #strDocument.Description#'>
				 </cfif>
				 <!--- insert a note --->				
				<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, '#email_content#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
				</CFQUERY>
				<!--- send email to the team --->
				<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject=#email_subject#, email_content=#email_content#)>
				<!--- add doc to the file info --->
				<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
				<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
				<cfquery name="addFile" DATASOURCE="#request.dsn#">
							INSERT INTO upload_many (title_id, fileDate, filetime, fileupload, realec_productID)
							VALUES('#getTitleID()#', '#a_insert_date#', '#a_insert_time#', '#fileName#', '#getProductCode()#')
				</cfquery>
				
				<cfif getEventCode(getEventXml()) EQ 431>
					<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
					<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
					    update doc_closer_title set closing_instructions = '#filename#',
						closing_inst_date = '#DateFormat(Now())#',
						inst_dateandtime = '#order_date_adj#',
						closing_inst_time = '#TimeFormat(Now())#'			
						WHERE title_id = '#getTitleID()#'
					</cfquery>
				</cfif>

				
			</cfloop>
		</cfif>
	</cffunction>
	


	
	<cffunction name="getHeader" access="private" output="false" returnType="string">
		<cfset var returnString = "">
		
		<cfsavecontent variable="returnString">
			<cfoutput>
			<Header>
			  <AckRef>1</AckRef> 
			  <Created>#getRealECCurrentDateTime()#</Created> 
			  <Format>RealEC</Format> 
			  <GMTOffset>-6</GMTOffset> 
			  <SourceApp>#variables.sourceApp#</SourceApp> 
			  <SourceID>#variables.sourceID#</SourceID>
			  <SourceVer>1</SourceVer> 
			  <Version>1</Version> 
			  <UserName>#variables.username#</UserName>  
			  <CreatedBy>#variables.partyID#</CreatedBy> 
			</Header>
			</cfoutput>
		</cfsavecontent>
		<cfreturn returnString>
	</cffunction>
	
	<cffunction name="getAckHeader" access="private" output="false" returnType="string">
		<cfset var returnString = "">
		
		<cfsavecontent variable="returnString">
			<cfoutput>
			<Header>
			  <AckRef>1</AckRef> 
			  <Created>#getRealECCurrentDateTime()#</Created> 
			  <Format>RealEC</Format> 
			  <GMTOffset>-6</GMTOffset> 
			  <SourceApp>HTTPPost</SourceApp> 
			  <SourceID>#variables.sourceID#</SourceID>
			  <SourceVer>1</SourceVer> 
			  <Version>1</Version> 
			  <UserName>#variables.username#</UserName>  
			  <CreatedBy>#variables.partyID#</CreatedBy> 
			</Header>
			</cfoutput>
		</cfsavecontent>
		<cfreturn returnString>
	</cffunction>
	
	<cffunction name="getAckNo" access="private" output="false" returnType="string">
		<cfset var returnString = "">
		
		<cfsavecontent variable="returnString">
			<cfoutput>
				<RealEC-XML>
				#getAckHeader()#
				<Transaction>
				  <TransactionID>N/A</TransactionID> 
				</Transaction>
				<Acknowledgement>
				<Errors>
				<ErrorType>#error_type#</ErrorType>
				<Description>#error_msg#</Description>
				</Errors>
				   <Validated>No</Validated> 
				</Acknowledgement>
				</RealEC-XML>
			</cfoutput>
		</cfsavecontent>
		<cffile action="write" file="#ExpandPath('./logs/ackrecent.xml')#" output="#returnString#" charset="utf-8">
		<cffile action="append" file="#ExpandPath('./logs/allacks.xml')#" output="#returnString#">
	
		<cfreturn returnString>
	</cffunction>
	
	<cffunction name="getAckYes" access="private" output="true" returnType="string">
		<cfset var returnString = "">
		
		<cfsavecontent variable="returnString">
			<cfoutput>
				<RealEC-XML>
				#getAckHeader()#
				<Transaction>
				  <TransactionID>#getTransactionID()#</TransactionID> 
				</Transaction>
				<Acknowledgement>
				<Errors>
				</Errors>
				   <Validated>Yes</Validated> 
				</Acknowledgement>
				</RealEC-XML>
			</cfoutput>
		</cfsavecontent>
		<cffile action="write" file="#ExpandPath('./logs/ackrecent.xml')#" output="#returnString#">
		<cffile action="append" file="#ExpandPath('./logs/allacks.xml')#" output="#returnString#">
		<!---
		<cfhttp url="http://stagepost.realec.com/rechttppost/receivexml.ashx" method="post">
		<cfhttpparam type="formfield" name="username" value="firsttitlestagepost">
		<cfhttpparam type="formfield" name="password" value="Houston713">
		<cfhttpparam name="upfile1" file="#request.rootDir#\www\chaseRealEC\logs\ackrecent.xml" type="file" mimetype="text/xml">
		</cfhttp>
		--->
		<cfreturn returnString>
	</cffunction>
	
	
	<cffunction name="getRealECTransactionID" returntype="string">
		<cfargument name="title_id" type="numeric" required="true">
		<CFQUERY DATASOURCE="#request.dsn#" NAME="q">
		    SELECT realEC_TransactionID from title
			WHERE title_id = #arguments.title_id#
		</CFQUERY>
		<cfif q.recordcount EQ 0>
			<cfabort showerror="no title record exists for this title ID">
		</cfif>
		<cfset settransactionID(q.realEC_TransactionID)>
		<cfreturn q.realEC_TransactionID>
	</cffunction>
	
	<cffunction name="getTitleIDFromTransID" returntype="string">
		<cfargument name="transactionID" type="string" required="true">
		<CFQUERY DATASOURCE="#request.dsn#" NAME="q">
		    SELECT title_id from title
			WHERE realEC_TransactionID = '#arguments.transactionID#'
		</CFQUERY>
		<cfif q.recordcount EQ 0>
			<cfabort showerror="no title record exists for this transactionID ID">
		</cfif>
		<cfset setTitleID(q.title_id)>
		<cfreturn q.title_id>
	</cffunction>
	
	<cffunction name="getRealECProductUniqueID" returntype="void">
	    
		<cfif getProductCode() EQ 3>
			<!--- title --->
			<CFQUERY DATASOURCE="#request.dsn#" NAME="q">
			    SELECT realec_title_uid from title
				WHERE realEC_transactionID = '#getTransactionID()#'	
			</CFQUERY>
			<cfif q.recordcount EQ 0 OR q.realec_title_uid EQ "">
				<cfabort showerror="no product unique ID record found">
			</cfif>
			<cfset setProductUniqueID(q.realec_title_uid)>
		<cfelseif getProductCode() EQ 29>
			<!--- closing --->
			<CFQUERY DATASOURCE="#request.dsn#" NAME="q">
			    SELECT realec_closing_uid from title
				WHERE realEC_transactionID = '#getTransactionID()#'	
			</CFQUERY>
			<cfif q.recordcount EQ 0 OR q.realec_closing_uid EQ "">
				<cfabort showerror="no product unique ID record found">
			</cfif>
			<cfset setProductUniqueID(q.realec_closing_uid)>
			
			
		<cfelseif getProductCode() EQ 284>
			<!--- title --->
			<CFQUERY DATASOURCE="#request.dsn#" NAME="q">
			    SELECT realec_ds1_uid from title
				WHERE realEC_transactionID = '#getTransactionID()#'	
			</CFQUERY>
			<cfif q.recordcount EQ 0 OR q.realec_ds1_uid EQ "">
				<cfabort showerror="no product unique ID record found">
			</cfif>
			<cfset setProductUniqueID(q.realec_ds1_uid)>
		<cfelseif getProductCode() EQ 285>
			<!--- title --->
			<CFQUERY DATASOURCE="#request.dsn#" NAME="q">
			    SELECT realec_ds2_uid from title
				WHERE realEC_transactionID = '#getTransactionID()#'	
			</CFQUERY>
			<cfif q.recordcount EQ 0 OR q.realec_ds2_uid EQ "">
				<cfabort showerror="no product unique ID record found">
			</cfif>
			<cfset setProductUniqueID(q.realec_ds2_uid)>	
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="checkAuth" output="true">
		<cfset pEventXml = XmlParse(getEventXml())>
		<cfset strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		
		<!--- get account adn transaction info --->
		<cfif isDefined("strEvent.transaction.recclientid")>
			<cfset realECclientID = strEvent.transaction.recclientid>
		<cfelse>
			<cfset realECclientID = "">	
		</cfif>
		<!---
		<cfset username = strEvent.transaction.productlist.product.security.username>
		<cfset password = strEvent.transaction.productlist.product.security.password>
		--->
		<cfset TransactionID = strEvent.transaction.TransactionID>
		<cfset error_msg = "">
		<cfset error_type = "">
		<cfset comp_id = "00000">
		<cfset missing_fields = "">
		
		<CFQUERY DATASOURCE="#request.dsn#" NAME="lookup_state">
			select pstate from title
			where realec_transactionID = '#transactionID#'
		</cfquery>
		
		
		
		<cfif lookup_state.pstate EQ "MD" OR lookup_state.pstate EQ "VA">
			<cfset comp_id = 7402>
		<cfelse>
			<cfset comp_id = 7393>
		</cfif>
		
		
		<!--- make sure account exists --->
		<cfif Len(realECClientID)>
			<CFQUERY DATASOURCE="#request.dsn#" NAME="lookup_company">
				SELECT a_user, a_pass, ID, company, realECclientID, intSales, team_id
				from companies where
				<!---
				a_user = '#username#' and
				a_pass = '#password#'
				--->
				<!---realECclientID = '#realECclientID#'---> ID = #comp_ID#
			</CFQUERY>
		
		<cfelse>
		
			<CFQUERY DATASOURCE="#request.dsn#" NAME="lookup_title">
				SELECT comp_id
				from title
				where
				realEC_transactionID = '#transactionID#'
			</CFQUERY>
			
			<CFQUERY DATASOURCE="#request.dsn#" NAME="lookup_company">
				SELECT a_user, a_pass, ID, company, realECclientID, intSales, team_id
				from companies where
				id = '#lookup_title.comp_id#'
			</CFQUERY>
		</cfif>
		
<!--- this part, if it's a closing order or a doc signing order, this checks to see that the TransactionID exists --->
		<cfif productCode eq 29>
					<CFQUERY DATASOURCE="#request.dsn#" NAME="lookup_title_order">
						SELECT comp_id
						from title
						where
						realEC_transactionID = '#transactionID#'
					</CFQUERY>
					<!---
		<cfif lookup_title_order.recordcount eq 0>
					<cfset error_msg = 'TransactionID not found'>
					<cfset error_type = "UnauthorizedAccessException">
		</cfif>
		--->
		</cfif>
<!--- END this part, if it's a closing order or a doc signing order, this checks to see that the TransactionID exists --->



		<cfif lookup_company.recordcount eq 0>

		  	<cfset error_msg = 'Incorrect Username or Password'>
		  	<cfset error_type = "UnauthorizedAccessException">
		  <cfelse>
		  
	
			<CFQUERY DATASOURCE="#request.dsn#" NAME="lookup_sales">
				SELECT fname, lname, email
				from First_Admin where
				ID =  #lookup_company.intSales#
			</CFQUERY>
			<CFQUERY DATASOURCE="#request.dsn#" NAME="lookup_team">
				SELECT email
				from Teams where
				ID =  #lookup_company.team_id#
			</CFQUERY>
		
		<cfset setCompID(lookup_company.id)>
		<cfset setTeamID(lookup_company.team_id)>
		<cfset setTeamEmail(lookup_team.Email)>
		<cfset setIntSales(lookup_company.intSales)>
		<cfset setIntSalesFname(lookup_sales.Fname)>
		<cfset setIntSalesLname(lookup_sales.Lname)>
		<cfset setIntSalesEmail(lookup_sales.Email)>
		</cfif>


		
		<cfif Len(error_msg)>
			<!--- send bad login ACK with error_msg and abort --->
			
			<cfoutput>#getAckNo()#</cfoutput>
			<cfset processEvent(140)>

			<cfabort>
		</cfif>
	</cffunction>
	
	
	<cffunction name="processEvent100" access="public" output="true" returntype="void" hint="I process 100 Events">
		
		<cfset var pEventXml = XmlParse(getEventXml())>
		<cfset var strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		<cfset var team = CreateObject('component','team_info')>
		
		
		
		<!--- get all data from XML and store it in ChaseRealEC Tables --->
		<!--- set defaults in case info doesn't come over in XML --->
		<cfparam name="Hdr_AckRef" Default="">
		<cfparam name="Hdr_AckRequest" Default="">
		<cfparam name="Hdr_Created" Default="">
		<cfparam name="Hdr_CreatedBy" Default="">
		<cfparam name="Hdr_Format" Default="">
		<cfparam name="Hdr_GMTOffset" Default="">
		<cfparam name="Hdr_PrivNetID" Default="">
		<cfparam name="Hdr_SourceApp" Default="">
		<cfparam name="Hdr_SourceID" Default="">
		<cfparam name="Hdr_SourceVer" Default="">
		<cfparam name="Hdr_TestFile" Default="">
		<cfparam name="Hdr_UserName" Default="">
		<cfparam name="Hdr_Version" Default="">
		<cfparam name="Trns_CostCenter" Default="">
		<cfparam name="Trns_RECClientID" Default="">
		<cfparam name="Trns_RefNumList_RefNum_Reference" Default="">
		<cfparam name="Trns_RefNumList_RefNum_Type" Default="">
		<cfparam name="Trns_TrnsID" Default="">
		<cfparam name="uid" default="">

		<!--- set the actual variables as they come across in XML --->
		<cftry>
		<cfset Hdr_AckRef = strEvent.Header.AckRef>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_AckRequest = strEvent.Header.AckRequest>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_Created = CreateODBCDateTime(strEvent.Header.Created)>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_CreatedBy = strEvent.Header.CreatedBy>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_Format = strEvent.Header.Format>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_GMTOffset = strEvent.Header.GMTOffset>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_PrivNetID = strEvent.Header.PrivNetID>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_SourceApp = strEvent.Header.SourceApp>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_SourceID = strEvent.Header.SourceID>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_SourceVer = strEvent.Header.SourceVer>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_TestFile = strEvent.Header.TestFile>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_UserName = strEvent.Header.UserName>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Hdr_Version = strEvent.Header.Version>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Trns_CostCenter = strEvent.Transaction.CostCenter>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Trns_RECClientID = strEvent.Transaction.RECClientID>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Trns_RefNumList_RefNum_Reference = strEvent.Transaction.ReferenceNumberList.ReferenceNumber.Reference>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Trns_RefNumList_RefNum_Type = strEvent.Transaction.ReferenceNumberList.ReferenceNumber.Type>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset Trns_TrnsID = strEvent.Transaction.TransactionID>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cfset setTransactionID(trns_TrnsID)>
		<cfset productcode = strEvent.Transaction.ProductList.product.productCode>
		<cfset setproductCode(productCode)>
		<cfset uniqueID = strEvent.Transaction.ProductList.product.uniqueID>
		<cfset setProductUniqueID(uniqueID)>
		
		<cfset checkAuth()>
		<cfif getProductCode() eq 3><!---title order --->
		
		<CFQUERY DATASOURCE="#request.dsn#" NAME="check_title">
			SELECT *
			from title
			where
			realEC_transactionID = '#gettransactionID()#'
		</CFQUERY>
		<cfif check_title.recordcount>
			<cfoutput>#getAckYes()#</cfoutput>
			
		</cfif>

		<cfparam name="SearchType" default="">
		<cfparam name="paddress" default="">
		<cfparam name="pcity" default="">
		<cfparam name="pcounty" default="">
		<cfparam name="pstate" default="">
		<cfparam name="pzip" default="">
		<cfparam name="unit_num" default="">
		<cfparam name="prop_use_type" default="">
		<cfparam name="proptype" default="">
		<cfparam name="plegaldesc" default="">
		<cfparam name="bfirstname1" default="">
		<cfparam name="blastname1" default="">
		<cfparam name="bminame1" default="">
		<cfparam name="bssn1" default="">
		<cfparam name="borrower1_dob" default="">
		
		<cfparam name="bhphone1" default="">
		<cfparam name="bwphone1" default="">
		<cfparam name="b1mstatus" default="">
		<cfparam name="sfirstname1" default="">
		<cfparam name="slastname1" default="">
		<cfparam name="sminame1" default="">
		<cfparam name="swphone1" default="">
		<cfparam name="shphone1" default="">
		<cfparam name="sssn1" default="">
		<cfparam name="proposed_insured" default="JPMorgan Chase Bank NA">
		<cfparam name="loan_amount" default="">
		<cfparam name="purchase_price" default="">
		<cfparam name="lo_name" default="">
		<cfparam name="lo_email" default="">
		<cfparam name="polender1" default="">
		<cfparam name="polender2" default="">
		<cfparam name="poacctno1" default="">
		<cfparam name="poacctno2" default="">
		<cfparam name="previous_loan_amount" default="0">
		<cfparam name="previous_loan_month" default="1">
		<cfparam name="previous_loan_year" default="1996">
		<cfparam name="loan_number" default="">
		<cfparam name="comments" default="">
		<cfparam name="sublender" default="">
		<cfparam name="subaccountNo" default="">
		<cfparam name="subAmount" default="">
		


		<!--- get account and transaction info --->
		<cfset realECclientID = strEvent.transaction.recclientid>
		<!---
		<cfset username = strEvent.transaction.productlist.product.security.username>
		<cfset password = strEvent.transaction.productlist.product.security.password>
		--->
		<cfset TransactionID = strEvent.transaction.TransactionID>
		<cfset comp_id = "7393">
		<cfset missing_fields = "">
		
			
					
		<!--- get order type and loan info --->
		<CFSET SearchType = strEvent.transaction.loanlist.loan.purpose>
		<cfif isDefined("strEvent.transaction.productlist.product.event.comment")>
			<CFSET comments = strEvent.transaction.productlist.product.event.comment>
		</cfif>
		<!---
		<cfif isDefined("strEvent.transaction.loanlist.loan.OriginalLoanAmount")>
			<CFSET previous_loan_amount = strEvent.transaction.loanlist.loan.OriginalLoanAmount>
		</cfif>
		--->
		<cfif isDefined("strEvent.transaction.loanlist.loan.OriginationDate")>
			<CFSET previous_loan_year = DatePart("yyyy",strEvent.transaction.loanlist.loan.OriginationDate)>
		</cfif>
		<cfif isDefined("strEvent.transaction.loanlist.loan.OriginationDate")>
			<CFSET previous_loan_month = DatePart("m",strEvent.transaction.loanlist.loan.OriginationDate)>
		</cfif>

		<cfset loans = XmlSearch(pEventXml, "/RealEC-XML/Transaction/LoanList/Loan")>
		<cfloop from="1" to="#arrayLen(loans)#" index="i">
			<cfset strLoan = flattenXmlToStruct(loans[i])>
			
			<cfif strLoan.purpose EQ "REFI">
				<cfset loan_amount = strLoan.amount>
				<cfset loan_number = strLoan.reference>
				<cfset SearchType = "Refinance">
			</cfif>
			<cfif isDefined("strLoan.payoff") AND strLoan.payoff EQ "YES">
				<CFSET previous_loan_amount = previous_loan_amount + strLoan.amount>
				<cfif Len(polender1)>
					<cfset polender2 = strLoan.LenderName>
					<cfset poacctno2 = strLoan.reference>
				<cfelse>
					<cfset polender1 = strLoan.LenderName>
					<cfset poacctno1 = strLoan.reference>
				</cfif>
			</cfif>
			<cfif isDefined("strLoan.subordinate") AND strLoan.subordinate EQ "YES">
				<cfset subLender = strLoan.lenderName>
				<cfset subaccountNo = strLoan.reference>
				<cfset subamount =  strLoan.amount>
			</cfif>
		</cfloop>
		
		
		<cfif not Len(loan_amount)>
			<CFSET loan_amount = strEvent.transaction.loanlist.loan.Amount>
		</cfif>

		<cfif isDefined("strEvent.transaction.loanlist.loan.OriginationDate")>
			<CFSET loan_amount = strEvent.transaction.loanlist.loan.SalesAmount>
		</cfif>
		<cfif isDefined("strEvent.transaction.loanlist.loan.LenderName")>
			<!---
			<CFSET proposed_insured = strEvent.transaction.loanlist.loan.LenderName>
			--->
		</cfif>
		<cfif not Len(loan_number)>
			<CFSET loan_number = strEvent.transaction.loanlist.loan.Reference>
		</cfif>
		<!--- get loan officer info --->

		<CFSET lo_name = strEvent.transaction.loanlist.loan.Contact.Name>
		<cfif isDefined("strEvent.transaction.loanlist.loan.Contact.Email")>
			<CFSET lo_email = strEvent.transaction.loanlist.loan.Contact.Email>
		</cfif>
		<cfif isDefined("strEvent.transaction.loanlist.loan.Contact.Dayphone")>
			<CFSET lo_phone = strEvent.transaction.loanlist.loan.Contact.DayPhone>
		</cfif>
		<cfif isDefined("strEvent.transaction.loanlist.loan.Contact.Fax")>
			<CFSET lo_fax = strEvent.transaction.loanlist.loan.Contact.Fax>
		</cfif>

		<!--- get neccessary property info --->
		<cfset paddress = strEvent.transaction.propertylist.property.addr1>
		<cfif isDefined("strEvent.transaction.propertylist.property.addr2")>
			<cfset unit_num = strEvent.transaction.propertylist.property.addr2>
		</cfif>
		<cfset pcity = strEvent.transaction.propertylist.property.city>
		<cfset pcounty = strEvent.transaction.propertylist.property.location>
		<cfset pstate = strEvent.transaction.propertylist.property.state>
		<cfif pstate EQ "MD" OR pstate EQ "VA">
			<cfset comp_id = "7402">
		</cfif>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="check_for_county_state">
			SELECT rate_table as table_to_use FROM Zip_info WHERE state = '#pstate#'
			and county = '#pcounty#'
		</CFQUERY>						
		<cfif check_for_county_state.recordcount eq 0>
			<cfset error_msg = "That State/County combination was not found in our system">
			<cfset error_type = "ClientDataException">
		</cfif>
		<cfset pzip = strEvent.transaction.propertylist.property.zip>
		<cfif isDefined("strEvent.transaction.propertylist.property.usagetype")>
			<cfset prop_use_type = strEvent.transaction.propertylist.property.usagetype>
		</cfif>
        <cfif prop_use_type eq 'PRIMRES'>
        	<cfset prop_use_type = 'Primary Residence'>
        <cfelse>
        	<cfset prop_use_type = 'Investment/Other'>
        </cfif>
		<cfset proptype = strEvent.transaction.propertylist.property.type>
        <cfif proptype eq 'COOP'>
             <cfset proptype = 'COOPT'>
        </cfif>
		
		<cfif isDefined("strEvent.transaction.propertylist.property.Description")>
			<CFSET plegaldesc = strEvent.transaction.propertylist.property.Description>
		</cfif>
		
		<!--- get borrowers --->
		<cfset count = 0>
		<cfset party = XmlSearch(pEventXml, "/RealEC-XML/Transaction/PartyList/Party")>
		<cfloop from="1" to="#arrayLen(party)#" index="i">
			<cfset strParty = flattenXmlToStruct(party[i])>
			<cfif (strParty.type eq 'BORR' or strParty.type eq 'COAPP') and count LT 4>
				<cfset count = count + 1>
				<cfif count eq 1>
					<CFSET bfirstname1 = strParty.FirstName>
					<CFSET blastname1 = strParty.LastName>
					<cfif isDefined("strParty.MiddleName")>
						<CFSET bminame1 = strParty.MiddleName>
					</cfif>
					<cfif isDefined("strParty.ssn")>
						<CFSET bssn1 = strParty.SSN>
					</cfif>
					<cfif isDefined("strParty.dayphone")>
						<CFSET bhphone1 = strParty.DayPhone>
					</cfif>
					<cfif isDefined("strParty.evenphone")>
						<CFSET bwphone1 = strParty.EvenPhone>
					</cfif>
					<cfif isDefined("strParty.MaritalStatus")>
						<CFSET b1mstatus = strParty.MaritalStatus>
					</cfif>
					
					<cfif isDefined("strParty.dob")>
						<CFSET borrower1_dob = #DateFormat(strParty.DOB, "m/d/yyyy")#>
					</cfif>
				<cfelseif count eq 2>
					<CFSET bfirstname2 = strParty.FirstName>
					<CFSET blastname2 = strParty.LastName>
					<cfif isDefined("strParty.MiddleName")>
						<CFSET bminame2 = strParty.MiddleName>
					</cfif>
					<cfif isDefined("strParty.ssn")>
						<CFSET bssn2 = strParty.SSN>
					</cfif>
					<cfif isDefined("strParty.dayphone")>
						<CFSET bhphone2 = strParty.DayPhone>
					</cfif>
					<cfif isDefined("strParty.evenphone")>
						<CFSET bwphone2 = strParty.EvenPhone>
					</cfif>
					<cfif isDefined("strParty.MaritalStatus")>
						<CFSET b2mstatus = strParty.MaritalStatus>
					</cfif>
					<cfif isDefined("strParty.dob")>
						<CFSET borrower2_dob = #DateFormat(strParty.DOB, "m/d/yyyy")#>
					</cfif>
				<cfelseif count eq 3>
					<CFSET bfirstname3 = strParty.FirstName>
					<CFSET blastname3 = strParty.LastName>
					<cfif isDefined("strParty.MiddleName")>
						<CFSET bminame3 = strParty.MiddleName>
					</cfif>
					<cfif isDefined("strParty.ssn")>
						<CFSET bssn3 = strParty.SSN>
					</cfif>
					<cfif isDefined("strParty.dayphone")>
						<CFSET bhphone3 = strParty.DayPhone>
					</cfif>
					<cfif isDefined("strParty.evenphone")>
						<CFSET bwphone3 = strParty.EvenPhone>
					</cfif>
					<cfif isDefined("strParty.MaritalStatus")>
						<CFSET b3mstatus = strParty.MaritalStatus>
					</cfif>
					<cfif isDefined("strParty.dob")>
						<CFSET borrower3_dob = #DateFormat(strParty.DOB, "m/d/yyyy")#>
					</cfif>
				<cfelseif count eq 4>
					<CFSET bfirstname4 = strParty.FirstName>
					<CFSET blastname4 = strParty.LastName>
					<cfif isDefined("strParty.MiddleName")>
						<CFSET bminame4 = strParty.MiddleName>
					</cfif>
					<cfif isDefined("strParty.ssn")>
						<CFSET bssn4 = strParty.SSN>
					</cfif>
					<cfif isDefined("strParty.dayphone")>
						<CFSET bhphone4 = strParty.DayPhone>
					</cfif>
					<cfif isDefined("strParty.evenphone")>
						<CFSET bwphone4 = strParty.EvenPhone>
					</cfif>
					<cfif isDefined("strParty.MaritalStatus")>
						<CFSET b4mstatus = strParty.MaritalStatus>
					</cfif>
					<cfif isDefined("strParty.dob")>
						<CFSET borrower4_dob = #DateFormat(strParty.DOB, "m/d/yyyy")#>
					</cfif>
				</cfif>
			</cfif>
		</cfloop>


				<!--- get seller info --->
		<cftry> 
				<CFSET sfirstname1 = ListFirst(strEvent.transaction.propertylist.property.contact.Name, " ")>
				<CFSET slastname1 = ListLast(strEvent.transaction.propertylist.property.contact.Name, " ")>
				<CFSET swphone1 = strEvent.transaction.propertylist.property.contact.DayPhone>
				<CFSET shphone1 = strEvent.transaction.propertylist.property.contact.EvenPhone>
		<cfcatch type="any">
		</cfcatch>
		</cftry>

		<!--- check for missing info --->
		<cfset missing_fields = ''>
		
		<cfif Len(SearchType) eq 0>
			<cfset missing_fields =  ListAppend(missing_fields, 'Transaction Type', ",")>
		</cfif>


		<cfif Len(paddress) eq 0>
			<cfset missing_fields =  ListAppend(missing_fields, 'Property Address', ",")>
		</cfif>


		<cfif Len(pcity) eq 0>
			<cfset missing_fields =  ListAppend(missing_fields, 'Property City', ",")>
		</cfif>
		
		
		<cfif Len(pcounty) eq 0>
			<cfset missing_fields =  ListAppend(missing_fields, 'Property County', ",")>
		</cfif>
		
		
		<cfif Len(pzip) eq 0>
			<cfset missing_fields =  ListAppend(missing_fields, 'Property Zip Code', ",")>
		</cfif>
		
		<cfif Len(prop_use_type) eq 0>
			<cfset missing_fields =  ListAppend(missing_fields, 'Property Use Type', ",")>
		</cfif>
		
		<cfif Len(bfirstname1) eq 0>
			<cfset missing_fields =  ListAppend(missing_fields, 'Borrower First Name', ",")>
		</cfif>

		<cfif Len(blastname1) eq 0>
			<cfset missing_fields =  ListAppend(missing_fields, 'Borrower Last Name', ",")>
		</cfif>
		
		


		<cfif Len(SearchType) eq 'Purchase'>
			<cfif Len(sfirstname1) eq 0>
				<cfset missing_fields =  ListAppend(missing_fields, 'Seller First Name', ",")>
			</cfif>
	
			<cfif Len(slastname1) eq 0>
				<cfset missing_fields =  ListAppend(missing_fields, 'Seller Last Name', ",")>
			</cfif>
			
			
			<cfif Len(shphone1) eq 0 and Len(swphone1) eq 0>
				<cfset missing_fields =  ListAppend(missing_fields, 'Seller Phone', ",")>
			</cfif>
		</cfif>



		<cfif Len(proposed_insured) eq 0>
			<cfset proposed_insured =  ListAppend(missing_fields, 'Lender Name', ",")>
		</cfif>
		
		<cfif Len(loan_amount) eq 0>
			<cfset loan_amount =  ListAppend(missing_fields, 'Loan Amount', ",")>
		</cfif>
		
		<cfif Len(SearchType) eq 'Purchase'>
			<cfif Len(purchase_price) eq 0>
				<cfset purchase_price =  ListAppend(missing_fields, 'Purchase Price', ",")>
			</cfif>
		</cfif>


		<cfif Len(lo_name) eq 0>
			<cfset lo_name =  ListAppend(missing_fields, 'Loan Officer Name', ",")>
		</cfif>

		<cfif Len(lo_email) eq 0>
			<cfset lo_email =  ListAppend(missing_fields, 'Loan Officer Email', ",")>
		</cfif>

		<cfif  IsDefined("SearchType") and SearchType neq 'Purchase' and  IsDefined("pstate")  and pstate eq "NY" or pstate eq "MD">
			<cfif Len(previous_loan_amount) eq 0>
				<cfset previous_loan_amount =  ListAppend(missing_fields, 'Previous Loan Amount', ",")>
			</cfif>
	
			<cfif Len(previous_loan_month) eq 0>
				<cfset previous_loan_month =  ListAppend(missing_fields, 'Previous Loan Month', ",")>
			</cfif>
			
			<cfif Len(previous_loan_year) eq 0>
				<cfset previous_loan_year =  ListAppend(missing_fields, 'Previous Loan Year', ",")>
			</cfif>
		</cfif>


		<CFQUERY DATASOURCE="#request.dsn#" NAME="check_for_order">
		    SELECT * from title
			WHERE paddress = '#paddress#' and pzip = '#pzip#' and comp_id = #comp_id#
		</CFQUERY>
		<!---
		<cfif check_for_order.recordcount>
			<cfset error_msg = 'Our system indicates an order has already been placed for this property'>
			<cfset error_type = "ClientDataException">
		</cfif>
		
		
		
		<cfif Len(error_msg)>
			<!--- send bad login ACK with error_msg and abort --->
			
			<cfoutput>#getAckNo()#</cfoutput>
			<cfset processEvent(140)>
			
			
			<cfabort>
		</cfif>
		--->
		<cfif ListLen(missing_fields, ",") AND 1 IS 0>
			<!--- spit out Decline ACK, with 'missing info' message here --->
			<cfoutput>#getAckNo()#</cfoutput>
			<cfset processEvent(140)>
			
		<cfabort>
		<cfelse>

			
			<!--- all good, call the insert/update template to store the XML --->
			<cfoutput>#getAckYes()#</cfoutput>
			<cfinclude template="insert_or_update.cfm">
			<!--- place the order --->
			<cfhttp url="#request.httpurl#/order_verify_title.cfm?emp=0&comp_id=#comp_id#&user_id_1=0&lo_id=0&zip_id=#pzip#&title=1&property=0&appraisal=0&other=0&ordering_co=0" method="post">
			<cfhttpparam type="Formfield" name="auto_feed" value="0">
			<cfhttpparam type="Formfield" name="RealEC_TransactionId" value="#transactionID#">
			<cfhttpparam type="Formfield" name="user_id_1" value="0">
			<cfhttpparam type="Formfield" name="lo_id" value="0">
			<cfhttpparam type="Formfield" name="BFIRSTNAME1" value="#bfirstname1#">
			<cfhttpparam type="Formfield" name="BLASTNAME1" value="#blastname1#">
			<cfhttpparam type="Formfield" name="BMINAME1" value="#bminame1#">
			<cfhttpparam type="Formfield" name="BSSN1" value="#bssn1#">
			<cfhttpparam type="Formfield" name="BHPHONE1" value="#BHPHONE1#">
			<cfhttpparam type="Formfield" name="BWPHONE1" value="#BWPHONE1#"> 
			<cfhttpparam type="Formfield" name="b1mstatus" value="#b1mstatus#">
			<cfhttpparam type="Formfield" name="borrower1_dob" value="#borrower1_dob#">
			<cfhttpparam type="Formfield" name="SFIRSTNAME1" value="#sfirstname1#">  
			<cfhttpparam type="Formfield" name="SLASTNAME1" value="#slastname1#">  
			<cfhttpparam type="Formfield" name="SMINAME1" value="#sminame1#">  
			<cfhttpparam type="Formfield" name="SSSN1" value="#sssn1#">  
			<cfhttpparam type="Formfield" name="SWPHONE1" value="#SWPHONE1#">  
			<cfhttpparam type="Formfield" name="SHPHONE1" value="#SHPHONE1#">  
			<cfhttpparam type="Formfield" name="CONDO_PUD" value="N/A">  
			<cfhttpparam type="Formfield" name="DEEDTRANSFER" value="N"> 
			<cfhttpparam type="Formfield" name="ENHANCED_COVERAGE" value="0">  
			<cfhttpparam type="Formfield" name="ESTIMATED_LOAN_FLOAT" value="#previous_loan_amount#">  
			<cfhttpparam type="Formfield" name="FAX_NO" value="">  
			<cfhttpparam type="Formfield" name="FILE_UPLOAD" value="">  
			<cfhttpparam type="Formfield" name="HUD_TYPE" value="0">  
			<cfhttpparam type="Formfield" name="INS" value="0">
			<cfhttpparam type="Formfield" name="INSURED" value="#proposed_insured#">
			<cfhttpparam type="Formfield" name="JLP_POLICY" value="0">
			<cfhttpparam type="Formfield" name="LOANAMT_FLOAT" value="#loan_amount#">
			<cfhttpparam type="Formfield" name="LOAN_NUMBER" value="#loan_number#">  
			<cfhttpparam type="Formfield" name="REO_NUMBER" value="">  
			<cfhttpparam type="Formfield" name="LOAN_PROGRAM_333" value="Fixed Rate">  
			<cfhttpparam type="Formfield" name="LOAN_TYPE_111" value="Conventional">  
			<cfhttpparam type="Formfield" name="OTHERPRO" value="Other">  
			<cfhttpparam type="Formfield" name="PADDRESS" value="#paddress#">  
			<cfhttpparam type="Formfield" name="UNIT_NUM" value="#unit_num#">  
			<cfhttpparam type="Formfield" name="PCITY" value="#pcity#">  
			<cfhttpparam type="Formfield" name="PCOUNTY" value="#pcounty#">  
			<cfhttpparam type="Formfield" name="PIGGY" value="0">  
			<cfhttpparam type="Formfield" name="PLEGALDESC" value="#plegaldesc#">  
			<cfhttpparam type="Formfield" name="PAYOFF_NEEDED" value="0">  
			<cfhttpparam type="Formfield" name="POACCTNO1" value="#poacctno1#">  
			<cfhttpparam type="Formfield" name="POACCTNO2" value="#poacctno2#">  
			<cfhttpparam type="Formfield" name="POLENDER1" value="#polender1#">  
			<cfhttpparam type="Formfield" name="POLENDER2" value="#polender2#">  
			<cfhttpparam type="Formfield" name="POPHONE1" value="">  
			<cfhttpparam type="Formfield" name="POPHONE2" value="">  
			<cfhttpparam type="Formfield" name="PREV_LOAN_MO" value="#previous_loan_month#">  
			<cfhttpparam type="Formfield" name="PREV_LOAN_YEAR" value="#previous_loan_year#">  
			<cfhttpparam type="Formfield" name="PROPTYPE" value="#PROPTYPE#"> 
			<cfhttpparam type="Formfield" name="PROP_USE_TYPE" value="#prop_use_type#">
			<cfhttpparam type="Formfield" name="PSTATE" value="#pstate#">  
			<cfhttpparam type="Formfield" name="PURCHASE" value="#purchase_price#">  
			<cfhttpparam type="Formfield" name="PZIP" value="#pzip#">  
			<cfhttpparam type="Formfield" name="REISSUE_RATES" value="0">  
			<cfhttpparam type="Formfield" name="REQUEST_ICL" value="0">  
			<cfhttpparam type="Formfield" name="RPTBYEMAIL" value="">  
			<cfhttpparam type="Formfield" name="SAME_LENDER" value="0">  
			<cfhttpparam type="Formfield" name="SEARCHTYPE" value="#searchtype#">  
			<cfhttpparam type="Formfield" name="SECLOAN" value="">  
			<cfhttpparam type="Formfield" name="TAXID1" value="">  
			<cfhttpparam type="Formfield" name="TAXID2" value="">  
			<cfhttpparam type="Formfield" name="THIRDP" value="">  
			<cfhttpparam type="Formfield" name="VERIFYEMAIL" value="">  
			<cfhttpparam type="Formfield" name="VERIFYEMAIL_2" value="">  
			<cfhttpparam type="Formfield" name="VERIFYEMAIL_3" value=""> 
			<cfhttpparam type="Formfield" name="mailing_address" value=""> 
			<cfhttpparam type="Formfield" name="a_comment" value="#comments#">
			<cfhttpparam type="Formfield" name="comp_id" value="#comp_id#">
			</cfhttp>
			</cfif>
			
			<CFQUERY DATASOURCE="#request.dsn#" NAME="get_order_info">
			    SELECT * from title
				WHERE realEC_TransactionID = '#getTransactionID()#'
			</CFQUERY>
			
	
			<cfset setTitleID(get_order_info.title_id)>
			
			<CFQUERY DATASOURCE="#request.dsn#" NAME="updateTitle">
			    update title
			    set realEC_title_uid = #getProductUniqueID()#,
				subLender = '#subLender#',
				subAccountNo = '#subAccountNo#',
				subAmount = '#subAmount#'
				WHERE realEC_TransactionID = '#getTransactionID()#'
			</CFQUERY>
			
							 <!--- insert a note --->				
				<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Order placed through Web Integration', '#DateFormat(Now(), "m/d/yyyy")#', 
				'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
				</CFQUERY>
				<!--- send email to the team --->
				<cfset email_subject="New Order" & #getTitleID()#  & "received through RealEC/Chase Integration">
				<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject=#email_subject#, email_content=#email_subject#)>

			<cfset saveDocuments()>
			<cfmail to="ericmbrancaccio@gmail.com" from="chaseOrders@firsttitleservices.com" subject="New Chase Title Order Received">
				File Number: #getTitleID()#	
			</cfmail>
			<cfset processEvent(130)>
			<cfset addTurnTimeEvent(title_id=getTitleID(),event_type="start",event_code="130")>
			<cfset addTurnTimeEvent(title_id=getTitleID(),event_type="marker",event_description="start")>


		<cfelseif getProductCode() eq 284 or getProductCode() eq 285><!--- doc signing --->
			<cfif Len(error_msg)>
				<!--- send bad login ACK with error_msg and abort --->
				
				<cfoutput>#getAckNo()#</cfoutput>
				<cfset processEvent(140)>
				
				<cfabort>
			<cfelse>
			<cfoutput>#getAckYes()#</cfoutput>
			<cfif getProductCode() EQ 284>
			
				<CFQUERY DATASOURCE="#request.dsn#" NAME="updateTitle">
				    update title
				    set realEC_ds1_uid = #getProductUniqueID()#
					WHERE realEC_TransactionID = '#getTransactionID()#'
				</CFQUERY>
			
			</cfif>
			
			<cfif getProductCode() EQ 285>
			
				<CFQUERY DATASOURCE="#request.dsn#" NAME="updateTitle">
				    update title
				    set realEC_ds2_uid = #getProductUniqueID()#
					WHERE realEC_TransactionID = '#getTransactionID()#'
				</CFQUERY>
			
			</cfif>
		
			<CFQUERY DATASOURCE="#request.dsn#" NAME="get_order_info">
			    SELECT * from title
				WHERE realEC_TransactionID = '#getTransactionID()#'
			</CFQUERY>

			<cfset titleID = getTitleIDFromTransID(gettransactionID())>
			
			<cfset setTitleID(get_order_info.title_id)>
			
		<cfparam name="A_HOW_WILL_BE_SHIPPED" default="Overnight">
		<cfparam name="A_MANAGERS_NAME" default="">
		<cfparam name="A_MANAGERS_PHONE" default="">
		<cfparam name="A_REQ_BY_AFTER_HOURS_PHONE" default="">
		<cfparam name="A_REQ_BY_COMPANY" default="">
		<cfparam name="A_REQ_BY_EMAIL" default="">
		<cfparam name="A_REQ_BY_EXT" default="">
		<cfparam name="A_REQ_BY_FAX" default="">
		<cfparam name="A_REQ_BY_PHONE" default="">
		<cfparam name="A_REQ_CLOSING_TIME" default="">
		<cfparam name="A_SETTLE_LOCATION" default="">
		<cfparam name="A_SPECIAL_INST" default="">
		<cfparam name="CANCEL_IT" default="0">
		<cfparam name="CONFIRM_BUSTED_DAY" default="">
		<cfparam name="CONFIRM_BUSTED_MON" default="">
		<cfparam name="CONFIRM_BUSTED_YEAR" default="">
		<cfparam name="COMFIRM_DAY" default="">
		<cfparam name="CONFIRM_MON" default="">
		<cfparam name="CONFIRM_YEAR" default="">
		<cfparam name="IS_LENDER" default="1">
		<cfparam name="LENDER_CONTACT_NAME" default="">
		<cfparam name="LENDER_NAME" default="">
		<cfparam name="LENDER_PHONE" default="">
		<cfparam name="REF_NUMBER" default="">
		<cfparam name="LOCATION" default="">
		<cfparam name="INSTRUCTIONS" default=""> 
		<cfif productCode eq 285>
		<cfparam name="MULTIPLE_SETS" default="1">
		<cfelse>
		<cfparam name="MULTIPLE_SETS" default="0">
		</cfif>
		<cfparam name="sign_loc_addr" default="">
		<cfparam name="sign_loc_city" default="">
		<cfparam name="sign_loc_state" default="">
		<cfparam name="sign_loc_zip" default="">
		<cfparam name="sign_meth" default="">
		
		
		
		
		<cftry>
		<cfset A_MANAGERS_NAME = strEvent.transaction.LoanList.Loan.Contact.Name>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset A_MANAGERS_PHONE = strEvent.Transaction.LoanList.Loan.Contact.DayPhone>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset A_REQ_BY_AFTER_HOURS_PHONE = strEvent.Transaction.LoanList.Loan.Contact.DayPhone>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<CFQUERY DATASOURCE="#request.dsn#" NAME="get_company_data">
			Select c.ID, c.company, c.email, c.phone, c.fax, t.title_id 
			FROM Companies c, Title t
			WHERE t.title_ID = #titleID#
			and t.comp_id = c.ID
		</cfquery>
		
		
		<cftry>
		<cfset A_REQ_BY_COMPANY = get_company_data.company>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset A_REQ_BY_EMAIL = get_company_data.email>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset A_REQ_BY_EXT = ''>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset A_REQ_BY_FAX = get_company_data.fax>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset A_REQ_BY_PHONE = strEvent.Transaction.LoanList.Loan.Contact.DayPhone>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset A_REQ_CLOSING_TIME = TimeFormat(strEvent.Transaction.ProductList.Product.DocServicesInfo.ReqSigningDateTime, "hh:mm tt")>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset location = strEvent.Transaction.ProductList.Product.DocServicesInfo.SigningLocationList.SigningLocation.Type>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset instructions = strEvent.Transaction.ProductList.Product.Instructions>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cfif Len(instructions)>
			<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
			INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
			VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Instructions for order #getTitleID()#: #instructions#', '#DateFormat(Now(), "m/d/yyyy")#', 
			'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
			</CFQUERY>
			<!--- send email to the team --->
			<cfset email_subject="Instructions for order #getTitleID()#">
			<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject=#email_subject#, email_content=#instructions#)>
		</cfif>

		
		<cfif location eq 'PROPADDR'>
		<cfset A_SETTLE_LOCATION = 'Property Address'>
		<cfelse>
		<cfset A_SETTLE_LOCATION = 'Other'>
		</cfif>
		<cfset signing_location = location>
		<cfswitch expression="#location#">
			<cfcase value="PROPADDR">
				<cfset location = 'Property Address'>
			</cfcase>
			<cfcase value="BHOME">
				<cfset location = 'Borrower Home'>
			</cfcase>
			<cfcase value="BOFFICE">
				<cfset location = 'Borrower Office'>
			</cfcase>
			<cfcase value="COFFICE">
				<cfset location = 'Closing Agent Office'>
			</cfcase>
			<cfcase value="BOTHER">
				<cfset location = 'Borrower Other Office'>
			</cfcase>
			<cfcase value="COTHER">
				<cfset location = 'Closing Agent Other Office'>
			</cfcase>
			<cfcase value="ONLINE">
				<cfset location = 'Online'>
			</cfcase>
			<cfdefaultcase>
				<cfset location = 'Other'>
			</cfdefaultcase>
		</cfswitch>
		
		<cftry>
		<cfset location = Transaction.ProductList.Product.DocServicesInfo.SigningLocationList.SigningLocation.Type>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset sign_loc_addr = strEvent.Transaction.ProductList.Product.DocServicesInfo.SigningLocationList.SigningLocation.Addr1>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset sign_loc_city = strEvent.Transaction.ProductList.Product.DocServicesInfo.SigningLocationList.SigningLocation.City>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset sign_loc_state = strEvent.Transaction.ProductList.Product.DocServicesInfo.SigningLocationList.SigningLocation.State>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset sign_loc_zip = strEvent.Transaction.ProductList.Product.DocServicesInfo.SigningLocationList.SigningLocation.Zip>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset sign_meth = strEvent.Transaction.ProductList.Product.DocServicesInfo.SigningLocationList.SigningLocation.SigningMethod>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cfquery datasource="#request.dsn#" name="chkDS">
			select * from title_closing_order_request
			where title_id = #getTitleID()#
		</cfquery>
		
		<cfif chkDS.recordcount>
			<cfquery datasource="#request.dsn#" name="insDSinfo">
				update title_closing_order_request
				set 
				signing_method_type = '#sign_meth#',
				signing_location_address = '#sign_loc_addr#',
				signing_location_city = '#sign_loc_city#',
				signing_location_state = '#sign_loc_state#',
				signing_location_zip = '#sign_loc_zip#',
				signing_location = '#signing_location#',
				multiple_sets = #MULTIPLE_SETS#
				where title_id = #getTitleID()#
			</cfquery>
		<cfelse>	
			<cfquery datasource="#request.dsn#" name="insDSinfo">
			insert into title_closing_order_request(title_id,signing_method_type,signing_location_address,signing_location_city,signing_location_state,signing_location_zip,signing_location,multiple_sets)
			values(#getTitleID()#,'#sign_meth#','#sign_loc_addr#','#sign_loc_city#','#sign_loc_state#','#sign_loc_zip#','#signing_location#',#multiple_sets#)
			</cfquery>
		</cfif>
		
		<cftry>
		<cfset A_SPECIAL_INST = A_SPECIAL_INST & 'Settlement Location:<BR>'>
		<cfset A_SPECIAL_INST = A_SPECIAL_INST & location & '<BR>'>
		<cfset A_SPECIAL_INST = A_SPECIAL_INST & ', ' & sign_loc_addr & '<BR>'>
		<cfset A_SPECIAL_INST = A_SPECIAL_INST & ', ' & sign_loc_city & '<BR>'>
		<cfset A_SPECIAL_INST = A_SPECIAL_INST & ', ' & sign_loc_state & ' ' & sign_loc_zip & '<BR>'>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		
		<cftry>
		<cfset COMFIRM_DAY = DateFormat(strEvent.Transaction.ProductList.Product.DocServicesInfo.ReqSigningDateTime, "dd")>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset CONFIRM_MON = DateFormat(strEvent.Transaction.ProductList.Product.DocServicesInfo.ReqSigningDateTime, "mm")>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset CONFIRM_YEAR = DateFormat(strEvent.Transaction.ProductList.Product.DocServicesInfo.ReqSigningDateTime, "yyyy")>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cfset busted_date = DateAdd("d", 30, strEvent.Transaction.ProductList.Product.DocServicesInfo.ReqSigningDateTime)>
		
		<cftry>
		<cfset CONFIRM_BUSTED_DAY = DateFormat(busted_date, "dd")>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset CONFIRM_BUSTED_MON = DateFormat(busted_date, "mm")>
		<cfcatch type="any"></cfcatch>
		</cftry>
		<cftry>
		<cfset CONFIRM_BUSTED_YEAR = DateFormat(busted_date, "yyyy")>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		
		
		<cftry>
		<cfset LENDER_CONTACT_NAME = strEvent.Transaction.LoanList.Loan.Contact.Name>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset LENDER_NAME = strEvent.Transaction.LoanList.Loan.LenderName>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset LENDER_PHONE = strEvent.Transaction.LoanList.Loan.Contact.DayPhon>
		<cfcatch type="any"></cfcatch>
		</cftry>
		
		<cftry>
		<cfset REF_NUMBER = strEvent.Transaction.LoanList.Loan.Reference>
		<cfcatch type="any"></cfcatch>
		</cftry>

		<cfhttp url="#request.httpurl#/form_title_closing_request_reciept_admin.cfm?A_TRIGGER=1&A_UPDATE_DB_FLAG=2&REC_ID=#titleID#&TITLE_INS_CO_IS=0&UID=264" method="post">
		 <cfhttpparam type="Formfield" name="A_HOW_WILL_BE_SHIPPED" value="#A_HOW_WILL_BE_SHIPPED#">
		 <cfhttpparam type="Formfield" name="A_MANAGERS_NAME" value="#A_MANAGERS_NAME#">
		 <cfhttpparam type="Formfield" name="A_MANAGERS_PHONE" value="#A_MANAGERS_PHONE#">
		 <cfhttpparam type="Formfield" name="A_REQ_BY_AFTER_HOURS_PHONE" value="#A_REQ_BY_AFTER_HOURS_PHONE#">
		 <cfhttpparam type="Formfield" name="A_REQ_BY_COMPANY" value="#A_REQ_BY_COMPANY#">
		 <cfhttpparam type="Formfield" name="A_REQ_BY_EMAIL" value="#A_REQ_BY_EMAIL#">
		 <cfhttpparam type="Formfield" name="A_REQ_BY_EXT" value="#A_REQ_BY_EXT#">
		 <cfhttpparam type="Formfield" name="A_REQ_BY_FAX" value="#A_REQ_BY_FAX#">
		 <cfhttpparam type="Formfield" name="A_REQ_BY_PHONE" value="#A_REQ_BY_PHONE#">
		 <cfhttpparam type="Formfield" name="A_REQ_CLOSING_TIME" value="#A_REQ_CLOSING_TIME#">
		 <cfhttpparam type="Formfield" name="A_SETTLE_LOCATION" value="#A_SETTLE_LOCATION#">
		 <cfhttpparam type="Formfield" name="A_SPECIAL_INST" value="#A_SPECIAL_INST#">
		 <cfhttpparam type="Formfield" name="CANCEL_IT" value="#CANCEL_IT#">
		 <cfhttpparam type="Formfield" name="CONFIRM_BUSTED_DAY" value="#CONFIRM_BUSTED_DAY#">
		 <cfhttpparam type="Formfield" name="CONFIRM_BUSTED_MON" value="#CONFIRM_BUSTED_MON#">
		 <cfhttpparam type="Formfield" name="CONFIRM_BUSTED_YEAR" value="#CONFIRM_BUSTED_YEAR#">
		 <cfhttpparam type="Formfield" name="COMFIRM_DAY" value="#COMFIRM_DAY#">
		 <cfhttpparam type="Formfield" name="CONFIRM_MON" value="#CONFIRM_MON#">
		 <cfhttpparam type="Formfield" name="CONFIRM_YEAR" value="#CONFIRM_YEAR#">
		 <cfhttpparam type="Formfield" name="IS_LENDER" value="#IS_LENDER#">
		 <cfhttpparam type="Formfield" name="LENDER_CONTACT_NAME" value="#LENDER_CONTACT_NAME#">
		 <cfhttpparam type="Formfield" name="LENDER_NAME" value="#LENDER_NAME#">
		 <cfhttpparam type="Formfield" name="LENDER_PHONE" value="#LENDER_PHONE#">
		 <cfhttpparam type="Formfield" name="REF_NUMBER" value="#REF_NUMBER#">
		 <cfhttpparam type="Formfield" name="MULTIPLE_SETS" value="#MULTIPLE_SETS#">
		</cfhttp>
		
		<cfmail to="ericmbrancaccio@gmail.com" from="chaseOrders@firsttitleservices.com" subject="New Chase Doc Signing Order Received">
				File Number: #getTitleID()#	
		</cfmail>
		<cfset processEvent(130)>
		<cfset addTurnTimeEvent(title_id=getTitleID(),event_type="marker",event_description="closing_req")>	
		<cfif hour(Now()) LT 9 OR hour(Now()) GT 17 OR 1 EQ 1>
			<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
			UPDATE Doc_closer_Title
				SET closer_ID = 3538,
				a_Assigned_by = 478,
				a_Date_Assigned = '#DateFormat(Now(), "mm/dd/yyyy")#',
				ac_dateandtime = '#order_date_adj#',
				a_Time_Assigned = '#TimeFormat(Now(), "HH:mm:ss")#'
				WHERE title_ID = #getTitleID()#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="read_status">
				UPDATE Title
				SET appraisal_status = 'Closer Assigned'
				WHERE title_ID = #getTitleID()#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Closing assigned to vendor', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
			</CFQUERY>
			<cfset addTurnTimeEvent(title_id=#getTitleID()#,event_type="marker",event_description="closing_scheduled")>
			<cfset signingmethod = structNew()>
			<cfset signingmethod.signingmethod = sign_meth>
			<cfset processEvent(eventCode=300,  productCode=#getproductCode()#, title_id=#getTitleID()#, signingmethod=signingmethod)>
			<cfset processEvent(eventCode=410, firstTitleSending=1, productCode=#getproductCode()#, title_id=#getTitleID()#)>
		</cfif>
			
		</cfif>	
			
		<cfelseif getProductCode() eq 29><!--- closing order --->
			<CFQUERY DATASOURCE="#request.dsn#" NAME="updateTitle">
			    update title
			    set realEC_closing_uid = #getProductUniqueID()#
				WHERE realEC_TransactionID = '#getTransactionID()#'
			</CFQUERY>
			<cfif Len(error_msg)>
				<!--- send bad login ACK with error_msg and abort --->
				
				<cfoutput>#getAckNo()#</cfoutput>
				<cfset processEvent(140)>
				
				<cfabort>
			<cfelse>
			<cfoutput>#getAckYes()#</cfoutput>
			<cfmail to="ericmbrancaccio@gmail.com" from="chaseOrders@firsttitleservices.com" subject="New Chase Closing Order Received">
				File Number: #getTitleID()#	
			</cfmail>
			<!---
			<cfset transactionID = strEvent.transaction.transactionID>
			<cfset titleID = getTitleIDFromTransID(transactionID)>
			<cfset comment = "Closing Order Indication Received, details to follow">
			<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, '#comment#', '#DateFormat(Now(), "m/d/yyyy")#', 
				'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
			</CFQUERY>
			--->
						<cfset processEvent(130)>
						
			</cfif>
		</cfif>
		
	</cffunction>
	
	<cffunction name="process130Or140Event" access="private" output="true" returntype="void">
		<cfargument name="recCode" type="numeric" required="true">
		<cfset var returnXml = "">
		<cfset var pEventXml = "">
		<cfset var strEvent = StructNew()>
		<cfset var strProduct = StructNew()>
		<cfset var products = "">
		<cfset pEventXml = XmlParse(getEventXml())>
		<cfset strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		<cfset RecCode = arguments.reccode>
		<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
		
		<cfsavecontent variable="returnXml">
			<cfoutput>
				<RealEC-XML>
				  #getHeader()#
				  <Transaction>
				  	<TransactionID>#strEvent.transaction.transactionID#</TransactionID>
				  	<ProductList>
				  		<Count>#strEvent.transaction.productList.count#</Count>
				  		<cfloop from="1" to="#arrayLen(products)#" index="i">
				  			<cfset strProduct = flattenXmlToStruct(products[i])>
				  			<Product>
				  				<UniqueID>#getProductUniqueID()#</UniqueID>
				  				<ProviderOrderNbr>#getTitleID()#</ProviderOrderNbr>
						        <Event>
						          <RECCode>#reccode#</RECCode>
						          <EventDate>#strProduct.event.eventDate#</EventDate>
						         </Event> 
						         <cfif arguments.recCode EQ 130>
									<AssignedToInfo>
							          <AssignedTo>
							            <Name>First Title Services</Name>						        
							            <DayPhone>301 279-0303</DayPhone>					            
							            <Contact>				              
							              <Name>Joe Demo</Name>
							              <DayPhone>713 273-7300</DayPhone>						              
							            </Contact>
							          </AssignedTo>
							        </AssignedToInfo>
								 </cfif>
								 
				  			</Product>
				  		</cfloop>
				  	</ProductList>
				  </Transaction>
				 </RealEC-XML>
			  </cfoutput>
		</cfsavecontent>
		
		<!--- post the xml back to server --->
		<cfset postXml(returnXml.trim())>
		
	</cffunction>

	
	
	<cffunction name="process150Event" access="private" output="true" returntype="void">
		<cfargument name="DocumentInfo" type="struct" required="true">
		
		<cfset var returnXml = "">
		
		<cfset document = getDocument()>
		<cfset fullPath = getDocumentPath()&getDocument()>
		<cfset fileInfo = getFileInformation(fullPath)>
		<cffile action="readBinary" file="#fullPath#" variable="objFile">
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>150</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		          <cfif Len(getComment())>
		          	<Comment>#getComment()#</Comment>
		          </cfif>
		        </Event>
		        <DocumentList>
		          <Count>1</Count>
		          <Document>
		            <Description>#getDocumentDesc()#</Description>
		            <DocVersion>#arguments.DocumentInfo.documentVersion#</DocVersion>
		            <DocStatus>#arguments.DocumentInfo.Documentstatus#</DocStatus>
		            <DocDate>#DateFormat(fileInfo.lastModified,'yyyy/mm/dd')# #TimeFormat(fileInfo.lastModified,'hh:mm:ss')#</DocDate>
		            <FileName>#getDocument()#</FileName>
		            <FileType>#Ucase(ListLast(getDocument(),'.'))#</FileType>
		            <Content>#ToBase64(objFile)#</Content>
		            <EncodeType>Base64</EncodeType>
		            <DocType>#arguments.DocumentInfo.DocumentType#</DocType>       
		          </Document>
		        </DocumentList>
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset addTurnTimeEvent(title_id=getTitleID(),event_type="pause",event_code="150")>
		
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process180Event" access="private" output="true" returntype="void">
		<cfargument name="DocumentInfo" type="struct" required="true">
		
		<cfset var returnXml = "">
	
		<cfset document = getDocument()>
		<cfset documentDescription = getDocumentDesc()>

		<cfset fullPath = getDocumentPath()&getDocument()>
		

		
		<cfset fileInfo = getFileInformation(fullPath)>
		<cffile action="readBinary" file="#fullPath#" variable="objFile">
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>180</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
			  		<cfif Len(getComment())>
			          	<Comment>#getComment()#</Comment>
			          </cfif>
		        </Event>
		        <DocumentList>
		          <Count>1</Count>
		          <Document>
		            <Description>#getDocumentDesc()#</Description>
		            <DocVersion>#arguments.DocumentInfo.documentVersion#</DocVersion>
		            <DocStatus>#arguments.DocumentInfo.Documentstatus#</DocStatus>
		            <DocDate>#DateFormat(fileInfo.lastModified,'yyyy/mm/dd')# #TimeFormat(fileInfo.lastModified,'hh:mm:ss')#</DocDate>
		            <FileName>#getDocument()#</FileName>
		            <FileType>#Ucase(ListLast(getDocument(),'.'))#</FileType>
		            <Content>#ToBase64(objFile)#</Content>
		            <EncodeType>Base64</EncodeType>
		            <DocType>#arguments.DocumentInfo.DocumentType#</DocType>       
		          </Document>
		        </DocumentList>
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process220Event" access="private" output="true" returntype="void">
		<cfargument name="firstTitleSending" type="boolean" required="true">
		<cfset var returnXml = "">
		<cfset var team = CreateObject('component','team_info')>
		
		
		<cfif firstTitleSending>
			<cfsavecontent variable="returnXml">
				<RealEC-XML>
				  #getHeader()#
				  <Transaction>
				    <TransactionID>#getTransactionID()#</TransactionID>
				    <ProductList>
				      <Count>1</Count>
				      <Product>
				        <UniqueID>#getProductUniqueID()#</UniqueID>
				        <Event>
				          <RECCode>220</RECCode>
				          <EventDate>#getRealECCurrentDateTime()#</EventDate>
				          <Comment>#getComment()#</Comment>
				        </Event>
				       </Product>
				       </ProductList>
				  </Transaction>
				</RealEC-XML>
			</cfsavecontent>
			<cfset postXml(returnXml.trim())>
		<cfelse>
			<cfset pEventXml = XmlParse(getEventXml())>
			<cfset strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
			<cfset checkAuth()>
			<cfoutput>#getAckYes()#</cfoutput>
			<cfset transactionID = strEvent.transaction.transactionID>
			<cfset titleID = getTitleIDFromTransID(transactionID)>
			<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
			
			<cfloop from="1" to="#arrayLen(products)#" index="i">
			  <cfset strProduct = flattenXmlToStruct(products[i])>
			  <cfset comment = strProduct.event.comment>
				<!--- insert into db--->
	
				<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
					INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
					VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, '#comment#', '#DateFormat(Now(), "m/d/yyyy")#', 
					'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
				</CFQUERY>
				<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment has been added for file #getTitleID()#' , email_content=#comment#)>
			</cfloop>
		</cfif>
		
	
	</cffunction>
	
	<cffunction name="process222Event" access="private" output="true" returntype="void">
		<cfargument name="firstTitleSending" type="boolean" required="true">
		<cfset var returnXml = "">
		<cfset var team = CreateObject('component','team_info')>
		
		<cfif firstTitleSending>
			<cfsavecontent variable="returnXml">
				<RealEC-XML>
				  #getHeader()#
				  <Transaction>
				    <TransactionID>#getTransactionID()#</TransactionID>
				    <ProductList>
				      <Count>1</Count>
				      <Product>
				        <UniqueID>#getProductUniqueID()#</UniqueID>
				        <Event>
				          <RECCode>222</RECCode>
				          <EventDate>#getRealECCurrentDateTime()#</EventDate>
				          <cfif Len(getComment())>
				          	<Comment>#getComment()#</Comment>
				          </cfif>
				        </Event>
				       </Product>
				       </ProductList>
				  </Transaction>
				</RealEC-XML>
			</cfsavecontent>
			<cfset postXml(returnXml.trim())>
		<cfelse>
			<cfset pEventXml = XmlParse(getEventXml())>
			<cfset strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
			<cfset checkAuth()>
			<cfoutput>#getAckYes()#</cfoutput>
			<cfset transactionID = strEvent.transaction.transactionID>
			<cfset titleID = getTitleIDFromTransID(transactionID)>
			<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
			
			<cfloop from="1" to="#arrayLen(products)#" index="i">
			  
			  <cfset strProduct = flattenXmlToStruct(products[i])>
			  
			  <cfif isDefined("strProduct.event.comment")>
				  <cfset comment = strProduct.event.comment>
				  <cfset setComment(comment)>	
			  </cfif>	
			<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
			INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
			VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, '#getComment()#', '#DateFormat(Now(), "m/d/yyyy")#', 
			'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>
				<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment with Action Required has been added for file #getTitleID()#' , email_content=#comment#)>
			
			</cfloop>
		</cfif>
		
		
		
	</cffunction>
	
	<cffunction name="process230Event" access="private" output="true" returntype="void">
		<cfargument name="firstTitleSending" type="boolean" required="true">
		<cfset var returnXml = "">
		<cfset var team = CreateObject('component','team_info')>

		<cfif firstTitleSending>
			<cfsavecontent variable="returnXml">
				<RealEC-XML>
				  #getHeader()#
				  <Transaction>
				    <TransactionID>#getTransactionID()#</TransactionID>
				    <ProductList>
				      <Count>1</Count>
				      <Product>
				        <UniqueID>#getProductUniqueID()#</UniqueID>
				        <Event>
				          <RECCode>230</RECCode>
				          <EventDate>#getRealECCurrentDateTime()#</EventDate>
				          <cfif Len(getComment())>
				          	<Comment>#getComment()#</Comment>
				          </cfif>
				          <ReasonList>
				          
				            <Reason>
				              <ReasonCode>#getReasonCode()#</ReasonCode>
				              <ReasonDesc>#getReasonDesc()#</ReasonDesc>			           
				            </Reason>
				           
				            
				          </ReasonList>
				        </Event>
				       </Product>
				       </ProductList>
				  </Transaction>
				</RealEC-XML>
			</cfsavecontent>
			<cfset postXml(returnXml.trim())>
		<cfelse>
			<cfset pEventXml = XmlParse(getEventXml())>
			<cfset strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
			<cfset checkAuth()>
			<cfoutput>#getAckYes()#</cfoutput>
			<cfset transactionID = strEvent.transaction.transactionID>
			<cfset titleID = getTitleIDFromTransID(transactionID)>
			<cfset setTitleID(titleID)>
			<cfset reasons = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product/Event/ReasonList/Reason")>
			
			<cfloop from="1" to="#arrayLen(reasons)#" index="i">
			  <cfset strReason = flattenXmlToStruct(reasons[i])>
			  
			  <cfset reasonCode = strReason.reasonCode>	
	
				<CFQUERY DATASOURCE="#request.dsn#" name="lookup_reason">		
					Select reason from ChaseRealEC_ReasonCodes where code = #reasoncode#
				</CFQUERY>
				
				<cfset comment = "On Hold - " & lookup_reason.reason>
				
				<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
					INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
					VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, '#comment#', '#DateFormat(Now(), "m/d/yyyy")#', 
					'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
				</CFQUERY>
				<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment has been added for file #getTitleID()#' , email_content=#comment#)>
			</cfloop>
		</cfif>
		
		<cfset addTurnTimeEvent(title_id=getTitleID(),event_type="pause",event_code="230")>
	
	</cffunction>
	
	<cffunction name="process240Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		
		<cfset var pEventXml = XmlParse(getEventXml())>
		<cfset var strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		<cfset var team = CreateObject('component','team_info')>
		
		<cfset transactionID = strEvent.transaction.transactionID>
		<cfset titleID = getTitleIDFromTransID(transactionID)>
		<cfset setTitleID(titleID)>
		
		<cfset checkAuth()>
		<cfoutput>#getAckYes()#</cfoutput>
		<cfset setTransactionID(strEvent.transaction.transactionID)>
		<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
		
		<cfloop from="1" to="#arrayLen(products)#" index="i">
		  <cfset strProduct = flattenXmlToStruct(products[i])>
		  <cfset setProductUniqueID(strProduct.uniqueID)>
		  <cfset comment = "">
		  <cfif isDefined("strProduct.event.comment") AND Len(strProduct.event.comment)>
			  <cfset comment = ListAppend(comment, strProduct.event.comment)>
		  </cfif>
		  <cfif isDefined("strProduct.event.reasonlist.reason.reasondesc") AND Len(strProduct.event.reasonlist.reason.reasondesc)>
			  <cfset comment = ListAppend(comment, strProduct.event.reasonlist.reason.reasondesc)>
		  </cfif>	  
			<!--- insert into db--->

			<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, '#comment#', '#DateFormat(Now(), "m/d/yyyy")#', 
				'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
			</CFQUERY>
			<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment has been added for file #getTitleID()#' , email_content=#comment#)>
		
		  <cfif getProductUniqueID() EQ 284 OR getProductUniqueID() EQ 285>
		  		<CFQUERY datasource="#request.dsn#" NAME="delete_request">
					delete
					FROM Title_Closing_order_Request
					WHERE title_ID = #getTitleID()#
				</cfquery>
		  <cfelse>
		  
		  
			  <CFQUERY DATASOURCE="#request.dsn#" name="cancel">
				Update tax_cert_title
				set cancelled_client = 1
				where title_id = #getTitleID()#
	
				update title
				set appraisal_status = 'Cancelled per client',
				cancelled = 1
				where title_id = #getTitleID()#
			</CFQUERY>
		 </cfif>
		 <cfset processEvent(280)>
		</cfloop>
			
	
	</cffunction>
	
	<cffunction name="process260Event" access="private" output="true" returntype="void">
		<cfargument name="firstTitleSending" type="boolean" required="true">
		<cfset var returnXml = "">
		<cfset var team = CreateObject('component','team_info')>
		
		
		<cfif firstTitleSending>
			<cfsavecontent variable="returnXml">
				<RealEC-XML>
				  #getHeader()#
				  <Transaction>
				    <TransactionID>#getTransactionID()#</TransactionID>
				    <ProductList>
				      <Count>1</Count>
				      <Product>
				        <UniqueID>#getProductUniqueID()#</UniqueID>
				        <Event>
				          <RECCode>260</RECCode>
				          <EventDate>#getRealECCurrentDateTime()#</EventDate>
				          <cfif Len(getComment())>
				          	<Comment>#getComment()#</Comment>
				          </cfif>
				        </Event>
				       </Product>
				       </ProductList>
				  </Transaction>
				</RealEC-XML>
			</cfsavecontent>
			<cfset postXml(returnXml.trim())>
		<cfelse>
			<cfset pEventXml = XmlParse(getEventXml())>
			<cfset strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
			<cfset checkAuth()>
			<cfoutput>#getAckYes()#</cfoutput>
			<cfset transactionID = strEvent.transaction.transactionID>
			<cfset titleID = getTitleIDFromTransID(transactionID)>
			<cfset setTitleID(titleID)>
			<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
			
			<cfloop from="1" to="#arrayLen(products)#" index="i">
			  <cfset strProduct = flattenXmlToStruct(products[i])>
			  <cfset comment = "On Hold Removed - ">
			  <cfif isDefined("strProduct.event.comment") AND Len(strProduct.event.comment)>
				  <cfset comment = ListAppend(comment, strProduct.event.comment)>
			  </cfif>
			  <cfif isDefined("strProduct.event.reasonlist.reason.reasondesc") AND Len(strProduct.event.reasonlist.reason.reasondesc)>
				  <cfset comment = ListAppend(comment, strProduct.event.reasonlist.reason.reasondesc)>
			  </cfif>	  
				<!--- insert into db--->
	
				<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
					INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
					VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, '#comment#', '#DateFormat(Now(), "m/d/yyyy")#', 
					'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
				</CFQUERY>
				<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment has been added for file #getTitleID()#' , email_content=#comment#)>
			</cfloop>
		</cfif>
		<cfset addTurnTimeEvent(title_id=getTitleID(),event_type="resume",event_code="260")>
	
	
	</cffunction>
	
	<cffunction name="process280Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
			<RealEC-XML>
			  #getHeader()#
			  <Transaction>
			    <TransactionID>#getTransactionID()#</TransactionID>
			    <ProductList>
			      <Count>1</Count>
			      <Product>
			        <UniqueID>#getProductUniqueID()#</UniqueID>
			        <Event>
			          <RECCode>280</RECCode>
			          <EventDate>#getRealECCurrentDateTime()#</EventDate>
			        </Event>
			       </Product>
			       </ProductList>
			  </Transaction>
			</RealEC-XML>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
		
		
	
	</cffunction>
	
	<cffunction name="process270Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
			<RealEC-XML>
			  #getHeader()#
			  <Transaction>
			    <TransactionID>#getTransactionID()#</TransactionID>
			    <ProductList>
			      <Count>1</Count>
			      <Product>
			        <UniqueID>#getProductUniqueID()#</UniqueID>
			        <Event>
			          <RECCode>270</RECCode>
			          <EventDate>#getRealECCurrentDateTime()#</EventDate>
			        </Event>
			       </Product>
			       </ProductList>
			  </Transaction>
			</RealEC-XML>
		</cfsavecontent>
		
		<cfset postXml(returnXml.trim())>	
	
	</cffunction>
	
	
	<cffunction name="process300Event" access="private" output="true" returntype="void">
		<cfargument name="signingMethod" required="true">
		<cfset var returnXml = "">
		
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_closer">
           SELECT *
           FROM Doc_closer_Title
		   WHERE title_id = '#getTitleID()#'
          </CFQUERY>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_order">
           SELECT *
           FROM title_closing_order_request
		   WHERE title_id = '#getTitleID()#'
          </CFQUERY>

         <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_closer">

                                                                  SELECT *

                                                                  FROM closer

                                                                  WHERE closer_ID = '#read_title_closer.closer_id#'

                              </CFQUERY>


		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <SigningMethod>#arguments.signingMethod.signingmethod#</SigningMethod>
			<ScheduledDate>#DateFormat(read_order.request_date,"yyyy/mm/dd")#</ScheduledDate>
			<ScheduledTime>#read_order.a_req_closing_time#</ScheduledTime>
		        <Event>
		          <RECCode>300</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		        </Event>
			<ContactList>
			<Contact>

                                      <Name>#read_assigned_closer.fname# #read_assigned_closer.lname#</Name>

                                      <DayPhone>#read_assigned_closer.phone#</DayPhone>

                                      <EMail>#read_assigned_closer.email#</EMail>   

                                    </Contact>
			</ContactList>
		      
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process303Event" access="private" output="true" returntype="void">
		<cfargument name="signingLocation" required="true">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>303</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		        </Event>
		      	<SigningLocationList>
	          <SigningLocation>
	            <UniqueID>1</UniqueID>
	            <Type>#arguments.signingLocation.Type#</Type>
	            <Addr1>#arguments.signingLocation.addr1#</Addr1>
	            
	            <City>#arguments.signingLocation.city#</City>
	            <State>#arguments.signingLocation.state#</State>
	            <Zip>#arguments.signingLocation.zip#</Zip>
            	<SigningMethod>#arguments.signingLocation.signingmethod#</SigningMethod>

	          </SigningLocation>
	        </SigningLocationList>

		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process310Event" access="private" output="true" returntype="void">
		<cfargument name="signingMethod" required="false">
		<cfargument name="firstTitleSending" type="boolean" required="true">
		<cfset var returnXml = "">
		<cfset var team = CreateObject('component','team_info')>
		
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_closer">
           SELECT *
           FROM Doc_closer_Title
		   WHERE title_id = '#getTitleID()#'
          </CFQUERY>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_order">
           SELECT *
           FROM title_closing_order_request
		   WHERE title_id = '#getTitleID()#'
          </CFQUERY>

         <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_closer">

                                                                  SELECT *

                                                                  FROM closer

                                                                  WHERE closer_ID = '#read_title_closer.closer_id#'

                              </CFQUERY>
		
		<cfif firsttitlesending>
			<cfsavecontent variable="returnXml">
			<cfoutput>
			<RealEC-XML>
			  #getHeader()#
			  <Transaction>
			    <TransactionID>#getTransactionID()#</TransactionID>
			    <ProductList>
			      <Count>1</Count>
			      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <SigningMethod>#arguments.signingMethod.signingmethod#</SigningMethod>
			<ScheduledDate>#DateFormat(read_order.request_date,"yyyy/mm/dd")#</ScheduledDate>
			<ScheduledTime>#read_order.a_req_closing_time#</ScheduledTime>
		        <Event>
		          <RECCode>310</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		        </Event>
			<ContactList>
			<Contact>

                                      <Name>#read_assigned_closer.fname# #read_assigned_closer.lname#</Name>

                                      <DayPhone>#read_assigned_closer.phone#</DayPhone>

                                      <EMail>#read_assigned_closer.email#</EMail>   

                                    </Contact>
			</ContactList>
		      
		    </Product>
	    		</ProductList>
	   
			  </Transaction>
			</RealEC-XML>
			</cfoutput>
			</cfsavecontent>
		<cfelse>
			<cfset pEventXml = XmlParse(getEventXml())>
			<cfset strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
			<cfset checkAuth()>
			<cfoutput>#getAckYes()#</cfoutput>
			<cfset transactionID = strEvent.transaction.transactionID>
			<cfset titleID = getTitleIDFromTransID(transactionID)>
			<cfset setTitleID(titleID)>
			<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
			
			<cfloop from="1" to="#arrayLen(products)#" index="i">
			  <cfset strProduct = flattenXmlToStruct(products[i])>
			  	<cfset scheduledDate = strProduct.scheduledDate>
				<cfset scheduledTime = strProduct.scheduledTime>

				<cfquery name="updateclosing" DATASOURCE="#request.dsn#">
					update eventlist
					set
						
						yearmonthday = '#Year(scheduledDate)##Month(ScheduledDate)##Day(scheduledDate)#',
					yearmonth = '#DateFormat(scheduledDate,"mm/dd/yyyy")# #scheduledTime#',
					s_date = '#DateFormat(Now(), "m/d/yyyy")#',
					s_time = '#TimeFormat(Now(), "HH:mm:ss")#',
					closing_date = '#DateFormat(Now(), "m/d/yyyy")#',
					sc_dateandtime = '#DateFormat(scheduledDate,"mm/dd/yyyy")#',
						c_Day = '#Day(scheduledDate)#',
						c_month = '#Month(scheduledDate)#',
						c_year = '#Year(scheduledDate)#',
						c_Time = '#DateFormat(scheduledDate,"mm/dd/yyyy")# #scheduledTime#'
						
					where title_id = #getTitleID()#
				</cfquery>	
				<CFQUERY datasource="#request.dsn#">
					UPDATE Title_Closing_Order_Request
					SET A_Req_Closing_Day   	 = '#Day(scheduledDate)#',
						A_Req_Closing_Time		 = '#scheduledTime#',
						A_Req_Closing_month		 = '#Month(scheduledDate)#',
						A_Req_Closing_year		 = '#Year(scheduledDate)#',
						request_date  		= '#DateFormat(scheduledDate,"mm/dd/yyyy")# #scheduledTime#',
				a_sent_date        = '#DateFormat(Now(), "m/d/yyyy")#',
						a_sent_time     = '#TimeFormat(Now(), "HH:mm:ss")#',
	
						a_filled_out_date        = '#DateFormat(Now(), "m/d/yyyy")#',
							a_filled_out_time        = '#TimeFormat(Now(), "HH:mm:ss")#'
	
					WHERE Title_ID = #getTitleID()#
				</CFQUERY>		  	  
				

				<!--- insert into db--->
	
				<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
					INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
					VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Closing Rescheduled', '#DateFormat(Now(), "m/d/yyyy")#', 
					'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
				</CFQUERY>
				<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment has been added for file #getTitleID()#' , email_content='Closing Rescheduled')>
			</cfloop>
		</cfif>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process325Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		
		<cfset var pEventXml = XmlParse(getEventXml())>
		<cfset var strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		
		<cfset checkAuth()>
		<cfoutput>#getAckYes()#</cfoutput>
		<cfset setTransactionID(strEvent.transaction.transactionID)>
		<cfset titleID = getTitleIDFromTransID(strEvent.transaction.transactionID)>
		<cfset setTitleID(titleID)>
		<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
		
		<cfloop from="1" to="#arrayLen(products)#" index="i">

		  <cfset strProduct = flattenXmlToStruct(products[i])>
		  <cfset pProductXml = XmlParse(products[i])>
		  <cfparam name="jobname" default="">
		  <cfparam name="email" default="">
		  <cfparam name="eveningPhone" default="">
		  <cfparam name="fax" default="">
		  <cfparam name="pager" default="">
		  
		  <cfif isDefined("strProduct.AssignedToInfo.AssignedTo.Contact.JobName")>
		  	<cfset jobName = strProduct.AssignedToInfo.AssignedTo.Contact.JobName>
		  </cfif>
		  <cfset firstname = ListFirst(strProduct.AssignedToInfo.AssignedTo.Contact.Name, " ")>
		  <cfset lastname = ListLast(strProduct.AssignedToInfo.AssignedTo.Contact.Name, " ")>
		  
		  <cfif isDefined("strProduct.AssignedToInfo.AssignedTo.Contact.Email")>
		  	<cfset email = strProduct.AssignedToInfo.AssignedTo.Contact.Email>
		  </cfif>
		  <cfset dayPhone = strProduct.AssignedToInfo.AssignedTo.Contact.DayPhone>
		  <cfif isDefined("strProduct.AssignedToInfo.AssignedTo.Contact.EvenPhone")>
		  	<cfset eveningPhone = strProduct.AssignedToInfo.AssignedTo.Contact.EvenPhone>
		  </cfif>
		  <cfif isDefined("strProduct.AssignedToInfo.AssignedTo.Contact.fax")>
		  	<cfset fax = strProduct.AssignedToInfo.AssignedTo.Contact.fax>
		  </cfif>
		  <cfif isDefined("strProduct.AssignedToInfo.AssignedTo.Contact.pager")>
		  	<cfset pager = strProduct.AssignedToInfo.AssignedTo.Contact.pager>
		  </cfif>
		  
		  <cfif Len(jobname)>
			  <cfswitch expression="#jobName#">
			  	<cfcase value="Loan Processor">
			  		<CFQUERY DATASOURCE="#request.dsn#" NAME="find_processor">              
	                     SELECT *
	                     FROM Users
	                     WHERE lp_lname = '#lastName#'
	                     and lp_fname = '#firstName#'
	                     and comp_id = #getCompID()#
		            </CFQUERY>               
		            
		            <cfif find_processor.recordcount>
	                       <!--- found em, so let’s update their info --->
	                       <CFQUERY DATASOURCE="#request.dsn#" NAME="update_processor">                     
	                           Update Users
	                           Set lp_email = '#email#',
	                           lp_phone = '#dayPhone#',
	                           lp_fax = '#fax#'
	                           WHERE lp_lname = '#lastName#'
	                           and lp_fname = '#firstName#'
	                           and comp_id = #getCompID()#
	                       </CFQUERY>
		            <cfelse> <!--- not found, add a new record --->
	                     <CFQUERY DATASOURCE="#request.dsn#" NAME="insert_processor">                        
	                           Insert into Users (lp_lname, lp_fname, lp_email, lp_phone, lp_fax, comp_id)
	                           Values
	                           ('#lastName#',
								'#firstName#',
								 '#email#',
								  '#dayPhone#',
								   '#fax#', 
								   #getCompID()#)
	                     </CFQUERY>
				<cfinclude template="emailLoanProcessor.cfm">
		            </cfif>
	            
	            	<!--- update the file with the new loan_processor --->
	                <CFQUERY DATASOURCE="#request.dsn#" NAME="update_file">                    
	                    Update Title
	                    Set pname = '#firstName# #lastName#',
	                    pphone = '#dayPhone#',
	                    pfax = '#fax#',
	                    p_email = '#email#'
	                    WHERE realec_transactionID = '#getTransactionID()#'
	                </CFQUERY>  
			
			
			
			  	</cfcase>
			  	
			  	<cfcase value="Loan Officer">
			  		<!--- let’s see if that person exists already --->
	
		           <CFQUERY DATASOURCE="#request.dsn#" NAME="find_officer">                   
	                     SELECT *
	                     FROM Loan_Officers
	                     WHERE lo_lname = '#lastName#'
	                     and lo_fname = '#firstName#'
	                     and comp_id = #getCompID()#
		           </CFQUERY>               
	            
		            <cfif find_officer.recordcount>
	                   <!--- found em, so let’s update their info --->
	                   <CFQUERY DATASOURCE="#request.dsn#" NAME="update_processor">                     
	                         Update Loan_Officers
	                         Set lo_email = '#email#',
	                         lo_phone = '#dayPhone#',
	                         lo_fax = '#fax#'
	                         WHERE lo_lname = '#lastName#'
	                         and lo_fname = '#firstName#'
	                         and comp_id = #getCompID()#
	                   </CFQUERY>
		            <cfelse> <!--- not found, add a new record --->
		                   <CFQUERY DATASOURCE="#request.dsn#" NAME="insert_officer">                 
		                        Insert into Loan_Officers (lo_lname, lo_fname, lo_email, lo_phone, lo_fax, comp_id)
		                        Values
		                        ('#lastName#', '#firstName#', '#email#', '#dayphone#', '#fax#', #getCompID()#)
		                   </CFQUERY>
					<cfinclude template="emailLoanProcessor.cfm">
		            </cfif>
		            
		            <CFQUERY DATASOURCE="#request.dsn#" NAME="update_file">                    
		                 Update Title
		                 Set oname = '#firstName# #lastName#',
		                 ophone = '#dayPhone#',
		                 ofax = '#fax#',
		                 o_email = '#email#'
		                 WHERE realec_transactionID = '#getTransactionID()#'
		             </CFQUERY> 
				
			  	</cfcase>
			  	<cfcase value="Loan Assistant">
			  		<CFQUERY DATASOURCE="#request.dsn#" NAME="update_file">                    
		                 Update Title
		                 Set loan_asst_name = '#firstName# #lastName#',
		                 loan_asst_day_phone = '#dayPhone#',
		                 loan_asst_eve_phone = '#eveningPhone#',
		                 loan_asst_fax = '#fax#',
		                 loan_asst_email = '#email#',
		                 loan_asst_pager = '#pager#'          
		                 WHERE realec_transactionID = '#getTransactionID()#'
		             </CFQUERY> 
			  	</cfcase>
			  	<cfcase value="Underwriter">
			  		<CFQUERY DATASOURCE="#request.dsn#" NAME="update_file">                    
		                 Update Title
		                 Set underwriter_name = '#firstName# #lastName#',
		                 underwriter_day_phone = '#dayPhone#',
		                 underwriter_eve_phone = '#eveningPhone#',
		                 underwriter_fax = '#fax#',
		                 underwriter_email = '#email#',
		                 underwriter_pager = '#pager#'
		                 WHERE realec_transactionID = '#getTransactionID()#'
		             </CFQUERY> 
			  	</cfcase>
			  	<cfcase value="Branch Manager">
			  		<CFQUERY DATASOURCE="#request.dsn#" NAME="update_file">                    
		                 Update Title
		                 Set branch_manager_name = '#firstName# #lastName#',
		                 branch_manager_phone = '#dayPhone#',
		                 branch_manager_phone = '#eveningPhone#',
		                 branch_manager_fax = '#fax#',
		                 branch_manager_email = '#email#',
		                 branch_manager_pager = '#pager#'
		                 WHERE realec_transactionID = '#getTransactionID()#'
		             </CFQUERY> 
			  	</cfcase>
			  	<cfcase value="Closer">
			  		<CFQUERY DATASOURCE="#request.dsn#" NAME="update_file">                    
		                 Update Title
		                 Set closer_name = '#firstName# #lastName#',
		                 closer_day_phone = '#dayPhone#',
		                 closer_eve_phone = '#eveningPhone#',
		                 closer_fax = '#fax#',
		                 closer_email = '#email#',
		                 closer_pager = '#pager#'
		                 WHERE realec_transactionID = '#getTransactionID()#'
		             </CFQUERY> 
			  	</cfcase>
			  	<cfcase value="Vendor Manager">
			  		<CFQUERY DATASOURCE="#request.dsn#" NAME="update_file">                    
		                 Update Title
		                 Set vendor_manager_name = '#firstName# #lastName#',
		                 vendor_manager_day_phone = '#dayPhone#',
		                 vendor_manager_eve_phone = '#eveningPhone#',
		                 vendor_manager_fax = '#fax#',
		                 vendor_manager_email = '#email#',
		                 vendor_manager_pager = '#pager#'
		                 WHERE realec_transactionID = '#getTransactionID()#'
		             </CFQUERY> 
			  	</cfcase>
			  </cfswitch>
			  
			 <cfelse>
				<CFQUERY DATASOURCE="#request.dsn#" NAME="update_file">                    
	                 Update Title
	                 Set loan_asst_name = '#firstName# #lastName#',
	                 loan_asst_day_phone = '#dayPhone#',
	                 loan_asst_eve_phone = '#eveningPhone#',
	                 loan_asst_fax = '#fax#',
	                 loan_asst_email = '#email#',
	                 loan_asst_pager = '#pager#'          
	                 WHERE realec_transactionID = '#getTransactionID()#'
	             </CFQUERY> 
			</cfif>
		</cfloop>	
		
		<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Chase/RealEC', 'Web Integration', '#getTitleID()#', 'Loan Contact Info Updated #firstName# #lastName# #dayphone# #email#', '#DateFormat(Now(), "m/d/yyyy")#', 
				'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>
	</cffunction>
	
	<cffunction name="process406Event" access="private" output="true" returntype="void">
		<cfargument name="documentInfo" type="struct" required="true">
		
		<cfset var returnXml = "">
		
		<cfset document = getDocument()>
		<cfset fullPath = getDocumentPath()&getDocument()>
		<cfset fileInfo = getFileInformation(fullPath)>
		<cffile action="readBinary" file="#fullPath#" variable="objFile">
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>406</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
			 	  <cfif Len(getComment())>
		          	<Comment>#getComment()#</Comment>
		          </cfif>	
		        </Event>
		        <DocumentList>
		          <Count>1</Count>
		          <Document>
		            <Description>#getDocumentDesc()#</Description>
		            <DocDate>#DateFormat(fileInfo.lastModified,'yyyy/mm/dd')# #TimeFormat(fileInfo.lastModified,'hh:mm:ss')#</DocDate>
		            <DocVersion>#arguments.documentInfo.documentVersion#</DocVersion>
		            <DocStatus>DRAFT</DocStatus>
		            <FileName>#getDocument()#</FileName>
		            <FileType>#Ucase(ListLast(getDocument(),'.'))#</FileType>
		            <Content>#ToBase64(objFile)#</Content>
		            <EncodeType>Base64</EncodeType>
		            <DocType>#arguments.documentInfo.documentType#</DocType>
		          </Document>
		        </DocumentList>
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process410Event" access="private" output="true" returntype="void">
		
		<cfset var returnXml = "">	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_closer">
           SELECT *
           FROM Doc_closer_Title
		   WHERE title_id = '#getTitleID()#'
          </CFQUERY>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_order">
           SELECT *
           FROM title_closing_order_request
		   WHERE title_id = '#getTitleID()#'
          </CFQUERY>

         <CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_closer">

                                                                  SELECT *

                                                                  FROM closer

                                                                  WHERE closer_ID = '#read_title_closer.closer_id#'

                              </CFQUERY>


                       

                        <cfsavecontent variable="returnXml">

                        <cfoutput>

                        <RealEC-XML>

                          #getHeader()#

                          <Transaction>

                            <TransactionID>#getTransactionID()#</TransactionID>

                            <ProductList>

                              <Count>1</Count>

                              <Product>

                                <UniqueID>#getProductUniqueID()#</UniqueID>

                                <Event>

                                  <RECCode>410</RECCode>

                                  <EventDate>#getRealECCurrentDateTime()#</EventDate>

                                </Event>
				<AssignedToInfo>
				<AssignedTo>
					<Name>#XmlFormat(read_assigned_closer.company)#</Name> 
					<Contact>

                                      <Name>#read_order.notary_name#</Name>

                                      <DayPhone>#read_order.notary_phone#</DayPhone>

                                      <EMail>#read_order.notary_email#</EMail>   

                                    </Contact>
		
				</AssignedTo>
				</AssignedToInfo>

                                
				<!---
				<ClosingEscrowInfo>
									
									
                                  <Agent>

                                    <Name>#read_assigned_closer.company#</Name>  

                                    <Contact>

                                      <Name>#read_assigned_closer.fname# #read_assigned_closer.lname#</Name>

                                      <DayPhone>#read_assigned_closer.phone#</DayPhone>

                                      <EMail>#read_assigned_closer.email#</EMail>   

                                    </Contact>

                                  </Agent>
									
                                </ClosingEscrowInfo>
				--->

                            </Product>

                        </ProductList>

  

                          </Transaction>

                        </RealEC-XML>

                        </cfoutput>

                        </cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process431Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		<cfset var team = CreateObject('component','team_info')>
		
		<cfset var pEventXml = XmlParse(getEventXml())>
		<cfset var strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		
		<cfset checkAuth()>
		<cfoutput>#getAckYes()#</cfoutput>
		<cfset setTransactionID(strEvent.transaction.transactionID)>
		<cfset titleID = getTitleIDFromTransID(strEvent.transaction.transactionID)>
		<cfset setTitleID(titleID)>
		<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
		
		<cfset saveDocuments()>
		<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Closing Documents uploaded and ready for viewing', '#DateFormat(Now(), "m/d/yyyy")#', 
				'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
			</CFQUERY>
		<!---		

		<cfloop from="1" to="#arrayLen(products)#" index="i">
		  <cfset strProduct = flattenXmlToStruct(products[i])>
		  <cfset setProductUniqueID(strProduct.uniqueID)>
		  <cfset pProductXml = XmlParse(products[i])>
		  <cfset documents = XmlSearch(pProductXml, "/Product/DocumentList/Document")>
		  <cfloop from="1" to="#arrayLen(documents)#" index="j">
		  	<cfset strDocument = flattenXmlToStruct(documents[j])>
		  	<cfset temp = ToBinary(strDocument.Content)>
			<cfset fileName = createUniqueDocName(strDocument.FileName)>
			
			<cffile action="write" addnewline="no" file="c:\uploads\#FileName#" output="#temp#">
			
			<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
                update doc_closer_title set closing_instructions = '#fileName#',
                 closing_inst_date = '#DateFormat(Now())#',
                 inst_dateandtime = '#DateFormat(Now())#',
                 closing_inst_time = '#TimeFormat(Now())#'                                 
                 WHERE title_id = #getTitleID()#
            </cfquery> 
                        
            
			<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Closing Documents uploaded and ready for viewing', '#DateFormat(Now(), "m/d/yyyy")#', 
				'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
			</CFQUERY>
			<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment has been added for file #getTitleID()#' , email_content="HUD Approved By Client")>
			
            

		  </cfloop>
		
		</cfloop>--->	
		
		<cfset addTurnTimeEvent(title_id=getTitleID(),event_type="marker",event_description="closing_ins_received")>
	
	</cffunction>
	
	<cffunction name="process432Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		<cfset var team = CreateObject('component','team_info')>
		
		<cfset var pEventXml = XmlParse(getEventXml())>
		<cfset var strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		
		<cfset checkAuth()>
		<cfoutput>#getAckYes()#</cfoutput>
		<cfset setTransactionID(strEvent.transaction.transactionID)>
		<cfset titleID = getTitleIDFromTransID(strEvent.transaction.transactionID)>
		<cfset setTitleID(titleID)>
		<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
		
		<cfloop from="1" to="#arrayLen(products)#" index="i">
		   
		  
		    <CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
			INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
			VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Request for modifications to closing statement', '#DateFormat(Now(), "m/d/yyyy")#', 
			'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
			</CFQUERY>
			<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment has been added for file #getTitleID()#' , email_content="HUD Approved By Client")>
			
		</cfloop>	
	
	</cffunction>
	
	<cffunction name="process433Event" access="private" output="true" returntype="void">
		<cfargument name="DocumentInfo" type="struct" required="true">
		
		<cfset var returnXml = "">
		
		<cfset document = getDocument()>
		<cfset fullPath = getDocumentPath()&getDocument()>
		<cfset fileInfo = getFileInformation(fullPath)>
		<cffile action="readBinary" file="#fullPath#" variable="objFile">
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>433</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
			  		<cfif Len(getComment())>
			          	<Comment>#getComment()#</Comment>
			          </cfif>
		        </Event>
		        <DocumentList>
		          <Count>1</Count>
		          <Document>
		            <Description>#getDocumentDesc()#</Description>
		            <DocDate>#DateFormat(fileInfo.lastModified,'yyyy/mm/dd')# #TimeFormat(fileInfo.lastModified,'hh:mm:ss')#</DocDate>
		            <DocVersion>#arguments.DocumentInfo.documentVersion#</DocVersion>
		            <DocStatus>FINAL</DocStatus>
		            <FileName>#getDocument()#</FileName>
		            <FileType>#Ucase(ListLast(getDocument(),'.'))#</FileType>
		            <Content>#ToBase64(objFile)#</Content>
		            <EncodeType>Base64</EncodeType>
		            <DocType>#arguments.DocumentInfo.documentType#</DocType>
		            
		          </Document>
		        </DocumentList>
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process434Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		<cfset var team = CreateObject('component','team_info')>
		
		<cfset var pEventXml = XmlParse(getEventXml())>
		<cfset var strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		
		<cfset checkAuth()>
		<cfoutput>#getAckYes()#</cfoutput>
		<cfset setTransactionID(strEvent.transaction.transactionID)>
		<cfset titleID = getTitleIDFromTransID(strEvent.transaction.transactionID)>
		<cfset setTitleID(titleID)>
		<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
		
		<cfloop from="1" to="#arrayLen(products)#" index="i">
		  <cfset strProduct = flattenXmlToStruct(products[i])>
		  <cfset setProductUniqueID(strProduct.uniqueID)>
		  <cfset pProductXml = XmlParse(products[i])>
		  <cfset documents = XmlSearch(pProductXml, "/Product/DocumentList/Document")>
		  <cfloop from="1" to="#arrayLen(documents)#" index="j">
		  	<cfset strDocument = flattenXmlToStruct(documents[j])>
		  	<cfset temp = ToBinary(strDocument.Content)>
			<cfset fileName = createUniqueDocName(strDocument.FileName)>
			
			<cffile action="write" addnewline="no" file="c:\uploads\#FileName#" output="#temp#">
                        
            
			
			
		  </cfloop>
		  
		  <CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
			INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
			VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Closing Statements Approved By Customer', '#DateFormat(Now(), "m/d/yyyy")#', 
			'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>
		<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment has been added for file #getTitleID()#' , email_content="Closing Statements Approved By Customer")>
		
		  <!---
		  <CFQUERY DATASOURCE="#request.dsn#" name="getFinalHUD">		
			select final_hud
			from doc_closer_title
			where title_ID = #getTitleID()#		
		  </CFQUERY>
		  
		  <CFQUERY DATASOURCE="#request.dsn#" name="getHUDVersion">		
			select hud_version
			from title
			where title_ID = #getTitleID()#		
		  </CFQUERY>
		  
		  <cfset documentInfo = StructNew()>
          <cfset documentInfo.document = getFinalHUD.final_hud>
		  <cfset documentInfo.documentversion = getHUDVersion.hud_version>
		  <cfset documentInfo.documentType = "HUD1">
		  <cfset processEvent(eventCode=435,documentInfo=documentInfo)>
		--->
		</cfloop>	
	
	</cffunction>
	
	<cffunction name="process435Event" access="private" output="true" returntype="void">
		<cfargument name="DocumentInfo" type="struct" required="true">
	
		<cfset var returnXml = "">
		
		<cfset document = getDocument()>
		<cfset fullPath = getDocumentPath()&getDocument()>
		<cfset fileInfo = getFileInformation(fullPath)>
		<cffile action="readBinary" file="#fullPath#" variable="objFile">
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <DocInfo>
		        	<DocDate>#DateFormat(fileInfo.lastModified,'yyyy/mm/dd')# #TimeFormat(fileInfo.lastModified,'hh:mm:ss')#</DocDate>
		        </DocInfo>
		        <Event>
		          <RECCode>435</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
			  		<cfif Len(getComment())>
			          	<Comment>#getComment()#</Comment>
			          </cfif>
		        </Event>
		        <DocumentList>
		          <Count>1</Count>
		          <Document>
		            <Description>#getDocumentDesc()#</Description>
		            <DocDate>#DateFormat(fileInfo.lastModified,'yyyy/mm/dd')# #TimeFormat(fileInfo.lastModified,'hh:mm:ss')#</DocDate>
		            <DocVersion>#arguments.DocumentInfo.documentVersion#</DocVersion>
		            <DocStatus>FINAL</DocStatus>
		            <FileName>#getDocument()#</FileName>
		            <FileType>#Ucase(ListLast(getDocument(),'.'))#</FileType>
		            <Content>#ToBase64(objFile)#</Content>
		            <EncodeType>Base64</EncodeType>
		            <DocType>#arguments.DocumentInfo.documentType#</DocType>
		            
		          </Document>
		        </DocumentList>
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process460Event" access="private" output="true" returntype="void">

                        <cfset var returnXml = "">

                       

                        <cfset var pEventXml = XmlParse(getEventXml())>

                        <cfset var strEvent = flattenXmlToStruct(peventxml.xmlRoot)>

                        <cfset var team = CreateObject('component','team_info')>

                       

                        <cfset checkAuth()>

                        <cfoutput>#getAckYes()#</cfoutput>

                        <cfset setTransactionID(strEvent.transaction.transactionID)>

                        <cfset titleID = getTitleIDFromTransID(strEvent.transaction.transactionID)>

                        <cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>

                       

                        <cfloop from="1" to="#arrayLen(products)#" index="i">

                          <cfset strProduct = flattenXmlToStruct(products[i])>

                          <cfset setProductUniqueID(strProduct.uniqueID)>

                          <cfset pProductXml = XmlParse(products[i])>

                          <cfset documents = XmlSearch(pProductXml, "/Product/DocumentList/Document")>

                          <cfloop from="1" to="#arrayLen(documents)#" index="j">

                                    <cfset strDocument = flattenXmlToStruct(documents[j])>

                                    <cfset temp = ToBinary(strDocument.Content)>

                                    <cfset fileName = createUniqueDocName(strDocument.FileName)>

                                   

                                    <cffile action="write" addnewline="no" file="c:\uploads\#FileName#" output="#temp#">

                                   

                                    <CFQUERY DATASOURCE="#request.dsn#" name="write_note">                      

                                                INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)

                                                VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'File #Filename# uploaded', '#DateFormat(Now(), "m/d/yyyy")#',

                                                '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')             

                                    </CFQUERY>
									
									<cfquery name="addFile" DATASOURCE="#request.dsn#">
										   INSERT INTO upload_many (title_id, fileDate, filetime, fileupload)
										     VALUES('#getTitleID()#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "hh:mm:ss")#', '#Filename#')
										</cfquery>
									
                                   

                                    <cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment has been added for file #getTitleID()#' , email_content="Document #Filename# Uploaded by Client")>

                                   

                                    <cfif isDefined("strDocument.docType") AND strDocument.docType EQ "PAYOFF">

                                                <cfif j EQ 1>

                                                            <CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">

                                                                        insert into Pay_Off_Lender_1_Title(title_id,payoff1_upload)

                                                                        values(#getTitleID()#,'#fileName#')

                                                            </CFQUERY>

                                                <cfelseif j EQ 2>

                                                            <CFQUERY DATASOURCE="#request.dsn#" NAME="insert_data">

                                                                        insert into Pay_Off_Lender_2_Title(title_id,payoff2_upload)

                                                                        values(#getTitleID()#,'#fileName#')

                                                            </CFQUERY>


                                                

 

                                                </cfif>

                                   
												<!---
                                                <cfset documentInfo = StructNew()>

                                                <cfset documentInfo.document = fileName>

                                                <cfset documentInfo.documentversion = "1.0">

                                                <cfset documentInfo.documentStatus = "FINAL">

                                                <cfset documentInfo.documentType = "PAYOFF">

                                                <cfset processEvent(eventCode=726,documentInfo=documentInfo)>
											
                                    <cfelseif isDefined("strDocument.docType") AND strDocument.docType EQ "FEESHT">

                                    
									
									<cfhttp url="#request.httpUrl#/create_fee_sheet.cfm?rec_id=#getTitleID()#" method="get" resolveURL="true">

                                                            </cfhttp>

                            <cfset documentInfo = StructNew()>

                                                            <cfset documentInfo.document = "Fee_Sheet_" & getTitleID() & ".pdf">

                                                            <cfset documentInfo.documentversion = "1.0">

                                                            <cfset documentInfo.documentStatus = "FINAL">

                                                            <cfset documentInfo.documentType = "CLEARTOCLOSE">

                            <cfset processEvent(eventCode=150, productCode=3, title_id=#getTitleID()#,documentInfo=documentInfo)>
							 <cfset processEvent(eventCode=150, productCode=3, title_id=#getTitleID()#,documentInfo=documentInfo)>

                            <cfset processEvent(eventcode=270,title_ID=getTitleID(),firsttitlesending=true,productCode=3)>
									--->
                                    </cfif>

                          </cfloop>

                       

                        </cfloop>        

           

            </cffunction>
	
	<cffunction name="process492Event" access="private" output="true" returntype="void">
		<cfargument name="reasonInfo" type="struct" required="true">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
			<cfoutput>
			<RealEC-XML>
			  #getHeader()#
			  <Transaction>
			    <TransactionID>#getTransactionID()#</TransactionID>
			    <ProductList>
			      <Count>1</Count>
			      <Product>
			        <UniqueID>#getProductUniqueID()#</UniqueID>
			        <Event>
			          <RECCode>492</RECCode>
			          <EventDate>#getRealECCurrentDateTime()#</EventDate>
			          <CurativeReasonList>
			            <CurativeReason>
			              <ReasonCode>#getReasonCode()#</ReasonCode>
			              <ResponsibleParty>#arguments.ReasonInfo.responsibleParty#</ResponsibleParty>
			              <Type>#arguments.ReasonInfo.responsibletype#</Type>
			              <cfif Len(getComment())>
				          	<Comment>#getComment()#</Comment>
				          </cfif>
			            </CurativeReason>
			          </CurativeReasonList>

			        </Event>
			       </Product>
			       
			       </ProductList>
			  </Transaction>
			</RealEC-XML>
			</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	
	</cffunction>
	
	<cffunction name="process500Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
			<cfoutput>
			<RealEC-XML>
			  #getHeader()#
			  <Transaction>
			    <TransactionID>#getTransactionID()#</TransactionID>
			    <ProductList>
			      <Count>1</Count>
			      <Product>
			        <UniqueID>#getProductUniqueID()#</UniqueID>
			        <Event>
			          <RECCode>500</RECCode>
			          <EventDate>#getRealECCurrentDateTime()#</EventDate>
			        </Event>
			       </Product>
			       </ProductList>
			  </Transaction>
			</RealEC-XML>
			</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>	
	
	</cffunction>
	
	<cffunction name="process690Event" access="private" output="true" returntype="void">
		<cfargument name="senderTrackingInfo" type="struct" required="true">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        
		        <Event>
		          <RECCode>690</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		        </Event>
		        
		        <TrackingInfo>
		          <TrackingNumber>#arguments.senderTrackingInfo.trackingNumber#</TrackingNumber>
		          <ShippingDate>#arguments.senderTrackingInfo.shippingDate#</ShippingDate>
		          <Courier>#arguments.senderTrackingInfo.courier#</Courier>
		          <SenderInfo>
		            <Reference>#arguments.senderTrackingInfo.reference#</Reference>
		            <Name>#arguments.senderTrackingInfo.name#</Name>
		          </SenderInfo>
			 
		        </TrackingInfo>

		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process691Event" access="private" output="true" returntype="void">
		<cfargument name="senderTrackingInfo" type="struct" required="true">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>691</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		        </Event>
		        
		        <TrackingInfo>
		          <TrackingNumber>#arguments.senderTrackingInfo.trackingNumber#</TrackingNumber>
		        </TrackingInfo>
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	
	
	<cffunction name="process694Event" access="private" output="true" returntype="void">
		<cfargument name="senderTrackingInfo" type="struct" required="true">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        
		        <Event>
		          <RECCode>694</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		          <cfif Len(getComment())>
		          	<Comment>#getComment()#</Comment>
		          </cfif>
		        </Event>
		        <TrackingInfo>
		          <TrackingNumber>#arguments.senderTrackingInfo.trackingNumber#</TrackingNumber>
		          <ShippingDate>#arguments.senderTrackingInfo.shippingDate#</ShippingDate>
		          <Courier>#XmlFormat(arguments.senderTrackingInfo.courier)#</Courier>
		          <SenderInfo>
		            <Reference>#arguments.senderTrackingInfo.reference#</Reference>
		            <Name>#XmlFormat(arguments.senderTrackingInfo.name)#</Name>
		          </SenderInfo>
			 
		        </TrackingInfo>

		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>

	<cffunction name="process695Event" access="private" output="true" returntype="void">
		<cfargument name="recordingInfo" type="struct" required="true">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        
		        <Event>
		          <RECCode>695</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		          <cfif Len(getComment())>
		          	<Comment>#getComment()#</Comment>
		          </cfif>
		        </Event>
		        <RecordedInfo>
		          <DocumentDescription>#XmlFormat(arguments.recordingInfo.documentDescription)#</DocumentDescription>
		          <Position>#XmlFormat(arguments.recordingInfo.documentPosition)#</Position>
		          <Book>#XmlFormat(arguments.recordingInfo.documentBook)#</Book>
		          <Page>#XmlFormat(arguments.recordingInfo.documentPage)#</Page>
			  <RecordedDate>#arguments.recordingInfo.daterecorded#</RecordedDate>
			  <InstrumentNumber>#XmlFormat(arguments.recordingInfo.InstrumentNumber)#</InstrumentNumber>
		        </RecordedInfo>

		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process724Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		
		<cfset var pEventXml = XmlParse(getEventXml())>
		<cfset var strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		
		<cfset checkAuth()>
		<cfoutput>#getAckYes()#</cfoutput>
		<cfset setTransactionID(strEvent.transaction.transactionID)>
		<cfset title_id = getTitleIDFromTransID(strEvent.transaction.transactionID)>
		<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
		
		<cfloop from="1" to="#arrayLen(products)#" index="i">
		  <cfset strProduct = flattenXmlToStruct(products[i])>
		  <cfset setProductUniqueID(strProduct.uniqueID)>
		  <cfset pProductXml = XmlParse(products[i])>
		  <cfset payoffs = XmlSearch(pProductXml, "/Product/LoanPayoffList/Payoff")>
		  
		  <cfloop from="1" to="#arrayLen(payoffs)#" index="j">
		  	<cfset strPayoff = flattenXmlToStruct(payoffs[j])>
		  	<cfparam name="lendername" default="">
		  	<cfparam name="accountNumber" default="">
		  	<cfparam name="dayphone" default="">
		  	<cfparam name="amount" default="">
		  	<cfparam name="responsibleParty" default="">
		  	<cfif isDefined("strPayoff.LenderName")>
		  		<cfset lenderName = strPayoff.lenderName>
		  	</cfif>
		  	<cfif isDefined("strPayoff.accountNumber")>
		  		<cfset accountNumber = strPayoff.accountNumber>
		  	</cfif>
		  	<cfif isDefined("strPayoff.dayphone")>
		  		<cfset dayphone = strPayoff.dayphone>
		  	</cfif>
		  	<cfif isDefined("strPayoff.amount")>
		  		<cfset amount = strPayoff.amount>
		  	</cfif>
		  	<cfif isDefined("strPayoff.responsibleParty")>
		  		<cfset responsibleParty = strPayoff.responsibleParty>
		  	</cfif>
			
			<CFQUERY DATASOURCE="#request.dsn#" NAME="update_title">
				update title
				set
				<cfif j EQ 1>
					poLender1 = '#LenderName#',
					poAcctno1 = '#accountNumber#',
					poPhone1 = '#DayPhone#',
					poAmount1 = '#amount#',
					responsibleParty1 = '#responsibleParty#'
				<cfelseif j EQ 2>
					poLender2 = '#LenderName#',
					poAcctno2 = '#accountNumber#',
					poPhone2 = '#DayPhone#',
					poAmount2 = '#amount#',
					responsibleParty2 = '#responsibleParty#'
				</cfif>
				where title_ID = #getTitleID()#
			</CFQUERY>
			
			
		  </cfloop>
			<cfset processEvent(eventcode=222,title_ID=getTitleID(),comment="Payoff request received",firsttitlesending=true,productCode=29)>
		</cfloop>	
	
	</cffunction>
	
	<cffunction name="process725Event" access="private" output="true" returntype="void">
		<cfargument name="payoffno">
		<cfset var returnXml = "">
		
		
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
             Select * from  title
             Where title_id = '#getTitleID()#'
        </cfquery>
		
		
		<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
			INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
			VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Payoff ordered', '#DateFormat(Now(), "m/d/yyyy")#', 
			'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>
		
		
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>725</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		        </Event>
		        <!--- Need to populate this loanpayofflist  node from system--->
		        <LoanPayoffList>
		          <Payoff>
		          <cfif arguments.payoffno EQ 1>
		            <UniqueID>1</UniqueID>
		            <AccountNumber>#read_title.poacctno1#</AccountNumber>
		            <DateOrdered>#DateFormat(Now(),"yyyy/mm/dd")# 00:00:00</DateOrdered>
		            <OriginalLoanAmount>#read_title.poamount1#</OriginalLoanAmount>
		            <OrderedBy>
		              <Reference>#read_title.title_id#</Reference>
		              <Name>#read_title.responsibleParty1#</Name>
		            </OrderedBy>	            
		          </cfif> 
		          <cfif arguments.payoffno EQ 2>
		            <UniqueID>2</UniqueID>
		            <AccountNumber>#read_title.poacctno2#</AccountNumber>
		            <DateOrdered>#DateFormat(Now(),"yyyy/mm/dd")# 00:00:00</DateOrdered>
		            <OriginalLoanAmount>#read_title.poamount2#</OriginalLoanAmount>
		            <OrderedBy>
		              <Reference>#read_title.title_id#</Reference>
		              <Name>#read_title.responsibleParty2#</Name>
		            </OrderedBy>	            
		          </cfif> 
		          </Payoff>
		        </LoanPayoffList>

		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process726Event" access="private" output="true" returntype="void">
		<cfargument name="documentInfo" type="struct">
		<cfset var returnXml = "">
		<cfset document = getDocument()>
		<cfif Len(document)>
			<cfset fullPath = getDocumentPath()&getDocument()>
			<cfset fileInfo = getFileInformation(fullPath)>
			<cffile action="readBinary" file="#fullPath#" variable="objFile">
		</cfif>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
             Select * from  title
             Where title_id = '#getTitleID()#'
        </cfquery>
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		 
		        <Event>
		          <RECCode>726</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		        </Event>
		        <!--- Need to populate this payoffinfo node from system--->
		        <PayoffInfo>
		          <PayoffExpDate>#dateFormat(read_title.duedate,"yyyy/mm/dd")# 00:00:00</PayoffExpDate>
		          <LenderName>#read_title.polender1#</LenderName>
		          <Reference>#read_title.poacctno1#</Reference>
		          <Amount>#read_title.loanamt_float#</Amount>
		        </PayoffInfo>
				<cfif Len(document)>
					<DocumentList>
						<Count>1</Count>
						<Document>
				            <Description>#getDocumentDesc()#</Description>
				            <DocVersion>#arguments.DocumentInfo.documentVersion#</DocVersion>
				            <DocStatus>#arguments.DocumentInfo.Documentstatus#</DocStatus>
				            <DocDate>#DateFormat(fileInfo.lastModified,'yyyy/mm/dd')# #TimeFormat(fileInfo.lastModified,'hh:mm:ss')#</DocDate>
				            <FileName>#getDocument()#</FileName>
				            <FileType>#Ucase(ListLast(getDocument(),'.'))#</FileType>
				            <Content>#ToBase64(objFile)#</Content>
				            <EncodeType>Base64</EncodeType>
				            <DocType>#arguments.DocumentInfo.DocumentType#</DocType>  
				            
				          </Document>
					</DocumentList>
				</cfif>

		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process732Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>732</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		        </Event>
		      
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process733Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>733</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		          <ReasonList>
		            <Reason>
		              <ReasonCode>6</ReasonCode>
		              <!---<ReasonDesc>#getComment()#</ReasonDesc>--->
		            </Reason>
		          </ReasonList>

		        </Event>
		      
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	

	<cffunction name="process734Event" access="private" output="true" returntype="void">
		<cfargument name="DocumentInfo" type="struct" required="true">
	
		<cfset var returnXml = "">
		<!---
		<cfset document = getDocument()>
		<cfset fullPath = getDocumentPath()&getDocument()>
		<cfset fileInfo = getFileInformation(fullPath)>
		<cffile action="readBinary" file="#fullPath#" variable="objFile">
		--->
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>734</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		        </Event>
		        <!---
		        <DocumentList>
		          <Count>1</Count>
		          <Document>
		            <Description>#getDocumentDesc()#</Description>
		            <DocDate>#DateFormat(fileInfo.lastModified,'yyyy/mm/dd')# #TimeFormat(fileInfo.lastModified,'hh:mm:ss')#</DocDate>
		            <DocVersion>#arguments.DocumentInfo.documentVersion#</DocVersion>
		            <DocStatus>FINAL</DocStatus>
		            <FileName>#getDocument()#</FileName>
		            <FileType>#Ucase(ListLast(getDocument(),'.'))#</FileType>
		            <Content>#ToBase64(objFile)#</Content>
		            <EncodeType>Base64</EncodeType>
		            <DocType>#arguments.DocumentInfo.documentType#</DocType>
		            
		          </Document>
		        </DocumentList>
		        
		      <LoanList>
	          <Count>1</Count>
	          <Loan>
	            <FundedLoanAmount>125000.00</FundedLoanAmount>
	            <FundedType>WIRE</FundedType>
	            <DisbursementDate>2012/01/05 00:00:00</DisbursementDate>
	            <DisbursementReference>from bank</DisbursementReference>
	          </Loan>
	        </LoanList>
	        --->
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process737Event" access="private" output="true" returntype="void">
		
		<cfset var team = CreateObject('component','team_info')>
		<cfset pEventXml = XmlParse(getEventXml())>
			<cfset strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
			<cfset checkAuth()>
			<cfoutput>#getAckYes()#</cfoutput>
			<cfset transactionID = strEvent.transaction.transactionID>
			<cfset titleID = getTitleIDFromTransID(transactionID)>
			
		<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
		INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
		VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Funding Approved By Lender', '#DateFormat(Now(), "m/d/yyyy")#', 
		'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>
		
		<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='Funding Approved By Lender for file #getTitleID()#' , email_content="Funding approved by Lender for file #getTitleID()#")>
			
			
		
		
	</cffunction>
	
	<cffunction name="process760Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		<cfset var team = CreateObject('component','team_info')>
		
		<cfset var pEventXml = XmlParse(getEventXml())>
		<cfset var strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
		
		<cfset checkAuth()>
		<cfoutput>#getAckYes()#</cfoutput>
		<cfset setTransactionID(strEvent.transaction.transactionID)>
		<cfset titleID = getTitleIDFromTransID(strEvent.transaction.transactionID)>
		<cfset setTitleID(titleID)>
		<cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
		
		<cfloop from="1" to="#arrayLen(products)#" index="i">
		  <cfset strProduct = flattenXmlToStruct(products[i])>
		  <cfset setProductUniqueID(strProduct.uniqueID)>
		  <cfset pProductXml = XmlParse(products[i])>
		  <cfset documents = XmlSearch(pProductXml, "/Product/DocumentList/Document")>
		  <cfloop from="1" to="#arrayLen(documents)#" index="j">
		  	<cfset strDocument = flattenXmlToStruct(documents[j])>
		  	<cfset temp = ToBinary(strDocument.Content)>
			<cfset fileName = createUniqueDocName(strDocument.FileName)>
			
			<cffile action="write" addnewline="no" file="c:\uploads\#FileName#" output="#temp#">
			
			<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
                update doc_closer_title set unsigned_closing_package = '#fileName#'                                 
                 WHERE title_id = #getTitleID()#
            </cfquery> 
                        
            
			<CFQUERY DATASOURCE="#request.dsn#" name="write_note">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Document Package Delivered By Lender', '#DateFormat(Now(), "m/d/yyyy")#', 
				'#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
			</CFQUERY>
			<cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment has been added for file #getTitleID()#' , email_content="HUD Approved By Client")>
			<!---<cfset processEvent(761)>--->
            

		  </cfloop>
		
		</cfloop>	
	
	</cffunction>
	
	
	
	<cffunction name="process766Event" access="private" output="true" returntype="void">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>766</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		          <ReasonList>
		            <Reason>
		              <ReasonCode>#getReasonCode()#</ReasonCode>
		              <ReasonDesc>#getComment()#</ReasonDesc>
		            </Reason>
		          </ReasonList>

		        </Event>
		      
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process768Event" access="private" output="true" returntype="void">
		<cfargument name="DocumentInfo" type="struct" required="true">
	
		<cfset var returnXml = "">
		
		<cfset document = getDocument()>
		<cfset fullPath = getDocumentPath()&getDocument()>
		<cfset fileInfo = getFileInformation(fullPath)>
		<cffile action="readBinary" file="#fullPath#" variable="objFile">
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>768</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
			  <Comment>#getComment()#</Comment>
		        </Event>
		        <DocumentList>
		          <Count>1</Count>
		          <Document>
		            <Description>#getDocumentDesc()#</Description>
		            <DocDate>#DateFormat(fileInfo.lastModified,'yyyy/mm/dd')# #TimeFormat(fileInfo.lastModified,'hh:mm:ss')#</DocDate>
		            <DocVersion>#arguments.DocumentInfo.documentVersion#</DocVersion>
		            <DocStatus>FINAL</DocStatus>
		            <FileName>#getDocument()#</FileName>
		            <FileType>#Ucase(ListLast(getDocument(),'.'))#</FileType>
		            <Content>#ToBase64(objFile)#</Content>
		            <EncodeType>Base64</EncodeType>
		            <DocType>#arguments.DocumentInfo.documentType#</DocType>
		            
		          </Document>
		        </DocumentList>
		    </Product>
    		</ProductList>
   			
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process780Event" access="private" output="true" returntype="void">
		<cfargument name="documentInfo" type="struct">
		<cfset var returnXml = "">
		<cfset document = getDocument()>
		<cfif Len(document)>
			<cfset fullPath = getDocumentPath()&getDocument()>
			<cfset fileInfo = getFileInformation(fullPath)>
			<cffile action="readBinary" file="#fullPath#" variable="objFile">
		</cfif>
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		 
		        <Event>
		          <RECCode>780</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		        </Event>
		        	
				<DocumentList>
					<Count>1</Count>
					<Document>
			            <Description>#getDocumentDesc()#</Description>
			            <DocVersion>#arguments.DocumentInfo.documentVersion#</DocVersion>
			            <DocStatus>#arguments.DocumentInfo.Documentstatus#</DocStatus>
			            <DocDate>#DateFormat(fileInfo.lastModified,'yyyy/mm/dd')# #TimeFormat(fileInfo.lastModified,'hh:mm:ss')#</DocDate>
			            <FileName>#getDocument()#</FileName>
			            <FileType>#Ucase(ListLast(getDocument(),'.'))#</FileType>
			            <Content>#ToBase64(objFile)#</Content>
			            <EncodeType>Base64</EncodeType>
			            <DocType>FPOL</DocType>  
			            
			          </Document>
				</DocumentList>
				

		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="process824Event" access="private" output="true" returntype="void">
        <cfset var returnXml = "">
        <cfset var team = CreateObject('component','team_info')>
        
        <cfset var pEventXml = XmlParse(getEventXml())>
        <cfset var strEvent = flattenXmlToStruct(peventxml.xmlRoot)>
        
        <cfset checkAuth()>
        <cfoutput>#getAckYes()#</cfoutput>
        <cfset setTransactionID(strEvent.transaction.transactionID)>
        <cfset titleID = getTitleIDFromTransID(strEvent.transaction.transactionID)>
        <cfset setTitleID(titleID)>
        <cfset products = XmlSearch(pEventXml, "/RealEC-XML/Transaction/ProductList/Product")>
        
        <cfloop from="1" to="#arrayLen(products)#" index="i">
           
                    <cfparam name="loan_type" default="">
                    <cfparam name="lien_position" default="">
                    <cfparam name="acct_number" default="">
                    <cfparam name="original_loan_amount" default="">
                    <cfparam name="original_term" default="">
                    <cfparam name="original_payment" default="">
                    <cfparam name="date_recorded" default="">
                    <cfparam name="book" default="">
                    <cfparam name="page" default="">
                    <cfparam name="instrument_number" default="">
                    <cfparam name="recording_county" default="">
                    <cfparam name="recording_state" default="">
                    <cfparam name="lender_name" default="">
                    <cfparam name="lender_address1" default="">
					<cfparam name="lender_address2" default="">
                    <cfparam name="lender_city" default="">
                    <cfparam name="lender_state" default="">
                    <cfparam name="lender_zip" default="">
                    <cfparam name="lender_day_phone" default="">
                    <cfparam name="date_ordered" default="">
                    <cfparam name="responsible_party" default="">
                    
                    <cftry>
                    <cfset loan_type = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.type>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset lien_position = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.Position>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset acct_number = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.AccountNumber>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset original_loan_amount = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.SubordinatedMortgage.LoanAmount>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset original_term = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.SubordinatedMortgage.Term>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset original_payment = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.SubordinatedMortgage.Payment>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset date_recorded = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.SubordinatedMortgage.RecordedDate>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset book = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.SubordinatedMortgage.Book>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset page = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.SubordinatedMortgage.Page>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset instrument_number = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.SubordinatedMortgage.InstrumentNumber>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset recording_county = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.SubordinatedMortgage.CountyName>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset recording_state = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.SubordinatedMortgage.State>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset lender_name = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.Lender.LenderName>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset lender_address1 = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.Lender.Addr1>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset lender_address2 = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.Lender.Addr2>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset lender_city = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.Lender.City>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset lender_state = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.Lender.State>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset lender_zip = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.Lender.Zip>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset lender_day_phone = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.Lender.DayPhone>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset date_ordered = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.DateOrdered>
                    <cfcatch type="any"></cfcatch></cftry>
                    
                    <cftry>
                    <cfset responsible_party = strEvent.transaction.ProductList.Product.SubordinationList.Subordination.ResponsibleParty>
                    <cfcatch type="any"></cfcatch></cftry>


            <CFQUERY DATASOURCE="#request.dsn#" name="write_note">                   
                    INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
                    VALUES('Chase/RealEC', 'Web Integration', #getTitleID()#, 'Subordination request received', '#DateFormat(Now(), "m/d/yyyy")#', 
                    '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')              
                    </CFQUERY>
                    
            <CFQUERY DATASOURCE="#request.dsn#" name="write_sub">                   
                    INSERT INTO Title_Subordination(title_id, loan_type, lien_position, acct_number, original_loan_amount, original_term, original_payment, date_recorded, book, page, instrument_number, recording_county, recording_state, lender_name, lender_address1, lender_address2, lender_city, lender_state, lender_zip, lender_day_phone, date_ordered,responsible_party)
                    VALUES(#getTitleID()#, '#loan_type#', '#lien_position#', '#acct_number#', '#original_loan_amount#', '#original_term#', '#original_payment#', '#date_recorded#', '#book#', '#page#', '#instrument_number#', '#recording_county#', '#recording_state#', '#lender_name#', '#lender_address1#', '#lender_address2#', '#lender_city#', '#lender_state#', '#lender_zip#', '#lender_day_phone#', '#date_ordered#','#responsible_party#')              
                    </CFQUERY>
                    <cfset team.sendEmailToTeam(team_id=#getTeamID()#, email_subject='A comment has been added for file #getTitleID()#' , email_content="Subordination request received")>
                    
        </cfloop>         
            
    </cffunction>

	
	<cffunction name="process826Event" access="private" output="true" returntype="void">
		<cfargument name="DocumentInfo" type="struct" required="true">
	
		<cfset var returnXml = "">
		
		<cfset document = getDocument()>
		<cfset fullPath = getDocumentPath()&getDocument()>
		<cfset fileInfo = getFileInformation(fullPath)>
		<cffile action="readBinary" file="#fullPath#" variable="objFile">
		
		<CFQUERY DATASOURCE="#request.dsn#" name="title_sub">                   
        	select * from Title_Subordination
			where title_id = '#getTitleID()#'              
        </CFQUERY>
		
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>826</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
		        </Event>
		        <!---
		        <DocumentList>
		          <Count>1</Count>
		          <Document>
		            <Description>#getDocumentDesc()#</Description>
		            <DocDate>#DateFormat(fileInfo.lastModified,'yyyy/mm/dd')# #TimeFormat(fileInfo.lastModified,'hh:mm:ss')#</DocDate>
		            <DocVersion>#arguments.DocumentInfo.documentVersion#</DocVersion>
		            <DocStatus>FINAL</DocStatus>
		            <FileName>#getDocument()#</FileName>
		            <FileType>#Ucase(ListLast(getDocument(),'.'))#</FileType>
		            <Content>#ToBase64(objFile)#</Content>
		            <EncodeType>Base64</EncodeType>
		            <DocType>#arguments.DocumentInfo.documentType#</DocType>
		            
		          </Document>
		        </DocumentList>
		        --->
		      	<SubordinationInfo>
                    <SubordinationList>
		            <Subordination>
		              <AccountNumber>#title_sub.acct_number#</AccountNumber> 
					  <DateOrdered>#DateFormat(title_sub.date_ordered,"yyyy/mm/dd")#</DateOrdered> 
					  <ResponsibleParty>#title_sub.responsible_party#</ResponsibleParty> 
                   	  <SubordinatedMortgage>
                		<LoanAmount>#title_sub.original_loan_amount#</LoanAmount>
                		<RecordedDate>#DateFormat(title_sub.date_recorded,"yyyy/mm/dd")#</RecordedDate>
						</SubordinatedMortgage>
		            </Subordination>
		          </SubordinationList>
		        </SubordinationInfo>
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	

	
	<cffunction name="processGenericEvent" access="private" output="true" returntype="void">
		<cfargument name="eventCode" required="true">
		<cfset var returnXml = "">
		
		<cfsavecontent variable="returnXml">
		<cfoutput>
		<RealEC-XML>
		  #getHeader()#
		  <Transaction>
		    <TransactionID>#getTransactionID()#</TransactionID>
		    <ProductList>
		      <Count>1</Count>
		      <Product>
		        <UniqueID>#getProductUniqueID()#</UniqueID>
		        <Event>
		          <RECCode>#arguments.eventCode#</RECCode>
		          <EventDate>#getRealECCurrentDateTime()#</EventDate>
			  <cfif Len(getComment())><Comment>#getComment()#</Comment></cfif>
			   <cfif Len(getReasonCode())> 
				          <ReasonList>
				          
				            <Reason>
				              <ReasonCode>#getReasonCode()#</ReasonCode>
				              <ReasonDesc>#getReasonDesc()#</ReasonDesc>			           
				            </Reason>
				           
				            
				          </ReasonList>	
			   </cfif>	
		        </Event>
		      
		    </Product>
    		</ProductList>
   
		  </Transaction>
		</RealEC-XML>
		</cfoutput>
		</cfsavecontent>
		<cfset postXml(returnXml.trim())>
	</cffunction>
	
	<cffunction name="setEventXml" returnType="void" output="false" access="private">
		<cfargument name="eventXml" type="xml" required="true">
		
		<cfset variables.eventXml = arguments.eventXml>
	</cffunction>
	
	<cffunction name="getEventXml" returnType="xml" output="false" access="private">
		
		<cfreturn variables.eventXml>
	</cffunction>
	
	<cffunction name="setTransactionID" returnType="void" output="false" access="private">
		<cfargument name="transactionID" type="string" required="true">
		
		<cfset variables.transactionID = arguments.transactionID>
	</cffunction>
	
	<cffunction name="getTransactionID" returnType="string" output="false" access="private">
		
		<cfreturn variables.transactionID>
	</cffunction>
	

	<cffunction name="setTitleID" returnType="void" output="false" access="private">
		<cfargument name="titleID" type="string" required="true">
		
		<cfset variables.title_ID = arguments.titleID>
	</cffunction>
	
	<cffunction name="getTitleID" returnType="string" output="false" access="private">
		<cfreturn variables.Title_ID>
	</cffunction>

	
	<cffunction name="setProductUniqueID" returnType="void" output="false" access="private">
		<cfargument name="productUniqueID" type="string" required="true">
		
		<cfset variables.productUniqueID = arguments.productUniqueID>
	</cffunction>
	
	<cffunction name="getProductUniqueID" returnType="string" output="false" access="private">
		<cfreturn variables.productUniqueID>
	</cffunction>
	
	<cffunction name="setProductCode" returnType="void" output="false" access="private">
		<cfargument name="productCode" type="string" required="true">
		
		<cfset variables.productCode = arguments.productCode>
	</cffunction>
	
	<cffunction name="getProductCode" returnType="string" output="false" access="private">
		<cfreturn variables.productCode>
	</cffunction>
	
	<cffunction name="setDocument" returnType="void" output="false" access="private">
		<cfargument name="document" type="string" required="true">
		
		<cfset variables.document = arguments.document>
	</cffunction>

	
	<cffunction name="setDocumentPath" returnType="void" output="false" access="private">
		<cfargument name="documentPath" type="string" required="true">
		
		<cfset variables.documentPath = arguments.documentPath>
	</cffunction>

	<cffunction name="getDocumentPath" returnType="string" output="false" access="private">
		<cfreturn variables.documentPath>
	</cffunction>


	<cffunction name="setDocumentDesc" returnType="void" output="false" access="private">
		<cfargument name="documentDesc" type="string" required="true">
		
		<cfset variables.documentDesc = arguments.documentDesc>
	</cffunction>

	<cffunction name="getDocumentDesc" returnType="string" output="false" access="private">
		<cfreturn variables.documentDesc>
	</cffunction>

	<cffunction name="setReasonCode" returnType="void" output="false" access="private">
		<cfargument name="reasonCode" type="string" required="true">
		
		<cfset variables.reasonCode = arguments.reasonCode>
	</cffunction>

	<cffunction name="getReasonCode" returnType="string" output="false" access="private">
		<cfreturn variables.reasonCode>
	</cffunction>

	<cffunction name="setReasonDesc" returnType="void" output="false" access="private">
		<cfargument name="reasonDesc" type="string" required="true">
		
		<cfset variables.reasonDesc = arguments.reasonDesc>
	</cffunction>

	<cffunction name="getReasonDesc" returnType="string" output="false" access="private">
		<cfset reason = Replace(variables.reasonDesc,"-","","ALL")>
		<cfreturn reason>
	</cffunction>

	
	<cffunction name="getComment" returnType="string" output="false" access="private">
		<cfreturn XmlFormat(variables.comment)>
	</cffunction>
	
	<cffunction name="getDocument" returnType="string" output="false" access="private">
		<cfreturn variables.document>
	</cffunction>
	
	
	<cffunction name="setComment" returnType="void" output="false" access="private">
		<cfargument name="comment" type="string" required="true">
		
		<cfset variables.comment = arguments.comment>
	</cffunction>
	
	<cffunction name="getCompID" returnType="string" output="false" access="private">
		<cfreturn variables.comp_ID>
	</cffunction>
	
	<cffunction name="setCompID" returnType="void" output="false" access="private">
		<cfargument name="comp_id" type="string" required="true">
		
		<cfset variables.comp_id = arguments.comp_id>
	</cffunction>
	
		
	<cffunction name="getTeamID" returnType="string" output="false" access="private">
		<cfreturn variables.team_ID>
	</cffunction>
	
	<cffunction name="setTeamID" returnType="void" output="false" access="private">
		<cfargument name="team_id" type="string" required="true">
		
		<cfset variables.team_id = arguments.team_id>
	</cffunction>

	<cffunction name="getTeamEmail" returnType="string" output="false" access="private">
		<cfreturn variables.teamEmail>
	</cffunction>

	<cffunction name="setTeamEmail" returnType="void" output="false" access="private">
		<cfargument name="team_email" type="string" required="true">
		
		<cfset variables.team_email = arguments.team_email>
	</cffunction>
	
	<cffunction name="getIntSales" returnType="string" output="false" access="private">
		<cfreturn variables.intSales>
	</cffunction>
	
	<cffunction name="setIntSales" returnType="void" output="false" access="private">
		<cfargument name="intSales" type="string" required="true">
		
		<cfset variables.intSales = arguments.intSales>
	</cffunction>
	
	<cffunction name="getIntSalesFname" returnType="string" output="false" access="private">
		<cfreturn variables.intSalesFname>
	</cffunction>
	
	<cffunction name="setIntSalesFname" returnType="void" output="false" access="private">
		<cfargument name="intSalesFname" type="string" required="true">
		
		<cfset variables.intSalesFname = arguments.intSalesFname>
	</cffunction>
	
	<cffunction name="getIntSalesLname" returnType="string" output="false" access="private">
		<cfreturn variables.intSalesLname>
	</cffunction>
	
	<cffunction name="setIntSalesLname" returnType="void" output="false" access="private">
		<cfargument name="intSalesLname" type="string" required="true">
		
		<cfset variables.intSalesLname = arguments.intSalesLname>
	</cffunction>
	
	<cffunction name="getIntSalesEmail" returnType="string" output="false" access="private">
		<cfreturn variables.intSalesEmail>
	</cffunction>
	
	<cffunction name="setIntSalesEmail" returnType="void" output="false" access="private">
		<cfargument name="intSalesEmail" type="string" required="true">
		
		<cfset variables.intSalesEmail = arguments.intSalesEmail>
	</cffunction>
	
	<cffunction name="getFileInformation" returnType="struct" output="false" access="private">
		<cfargument name="fullPath" type="string" required="true">
		<cfset var fileInfo = structNew()>
		
		<cfset myFile = CreateObject("java", "java.io.File")>
		<cfset myFile.init(arguments.fullPath)>
		<!---
		<cfset fileInfo.lastModified = myFile.lastModified()>
		--->
		<cfset fileInfo.lastModified = "05/10/2011">
		<cfreturn fileInfo>
	</cffunction>
	
	<cffunction name="addTurnTimeEvent" returnType="void" output="false" access="public">
		<cfargument name="title_id" type="string" required="true">
		<cfargument name="event_type" type="string" required="true">
		<cfargument name="event_code" type="string" required="false" default="">
		<cfargument name="event_description" type="string" required="false" default="">
		
		<cfquery datasource="#request.dsn#" name="insturntimeevent">
			insert into turnTimeEvents(title_id,event_type,event_code,event_description)
			values('#arguments.title_id#','#arguments.event_type#','#arguments.event_code#','#arguments.event_description#')
		</cfquery>
	</cffunction>
		
	
	
	<cffunction name="flattenXmlToStruct" access="public" output="false" returntype="struct">
		<cfargument name="xmlObject" required="true" type="xml" />
		<cfargument name="delimiter" required="false" type="string" default="." />
		<cfargument name="prefix" required="false" type="string" default="" />
		<cfargument name="stResult" required="false" type="struct" />
		<cfargument name="addPrefix" required="false" type="boolean" default="true" />
		
		<cfset var sKey = '' />
	    <cfset var currentKey = "">
	    <cfset var arrIndx = "">
	    
	    <cfif NOT isDefined("arguments.stResult")>
	    	<cfset arguments.stResult = structNew()>
	    </cfif>
		
		<cfloop from="1" to="#ArrayLen(arguments.xmlObject.XmlChildren)#" index="arrIndx">
		    
		     <cfset sKey = arguments.xmlObject.XmlChildren[arrIndx].XmlName>
		    
		     <cfif ArrayLen(arguments.xmlObject.XmlChildren[arrIndx].XmlChildren) EQ 0>
				<cfif arguments.addPrefix and len(arguments.prefix)>
					<cfset arguments.stResult["#arguments.prefix##arguments.delimiter##sKey#"] = arguments.xmlObject.XmlChildren[arrIndx].XmlText />
				<cfelse>
					<cfset arguments.stResult[sKey] = arguments.xmlObject.XmlChildren[arrIndx].XmlText />
				</cfif>
		    
		     <cfelse>    <!--- Node has more children... --->
		
		     	<cfif arguments.prefix EQ "">
		             <cfset currentKey = sKey>
		        <cfelse>
		             <cfset currentKey = "#arguments.prefix##arguments.delimiter##sKey#">
		        </cfif>
				<cfset flattenXmlToStruct(arguments.xmlObject.XmlChildren[arrIndx], arguments.delimiter, currentKey, arguments.stResult) />
		    
		     </cfif>
		</cfloop>
		    
		<cfreturn arguments.stResult />
	</cffunction>
</cfcomponent>
