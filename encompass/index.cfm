<cfset missing_fields = "">

<cfset x = GetHttpRequestData()>
<cfset dataString = ToString(x.content)>


<CFSET MyXml = XmlParse(dataString)>


<CFSET transaction = MyXml.request.xmlattributes.Type>

<cfif transaction eq 'FeeInquiry' or transaction eq 'ORDER'>
<cftry>
<cfparam name="MyXml.request.DATA.Custom.Custom_Info.EmailAddress.xmlText" default="">
<CFSET email_address_to_send = MyXml.request.DATA.Custom.Custom_Info.EmailAddress.xmlText>
<cfcatch type="any">
<CFSET email_address_to_send = 'rick@jermain.com'>
</cfcatch>
</cftry>
</cfif>




<!--- check user account --->
<cfif transaction eq 'ORDER' or transaction eq 'FeeInquiry'>
<CFSET encompass_id = MyXml.request.xmlattributes.LoanID>
<cfelse>
<CFSET encompass_id = 0>
</cfif>
<CFSET comp_username = MyXml.request.customer_info.xmlattributes.AccountID>
<CFSET comp_password = MyXml.request.customer_info.xmlattributes.Password>
<!--- <CFSET comp_password = "wrongpassword"> --->

<CFQUERY datasource="#request.dsn#" NAME="check_login">
						SELECT *
						FROM Companies
						WHERE a_user = '#comp_username#'
						and a_pass = '#comp_password#'
						and a_status = '1'
					</CFQUERY>

<cfif Not check_login.recordcount>
<cfinvoke	component = "cfc.encompass"	method = "throwError" message="Incorrect user ID and password combination. Please try again." encompass_transaction_id="#encompass_id#" condition="Error">
<cfabort>
<cfelse>
<cfset posted_xml_filename = "POST" & "_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & "_CID_" & #check_login.ID# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\encompass\Posted_XML\#posted_xml_filename#" nameconflict="makeunique" output="#Trim(datastring)#">

<cfset comp_id = check_login.ID>
<cfset RU.comp_id = check_login.ID>
<cfset url.comp_id = check_login.ID>
<cfset form.comp_id = check_login.ID>
</cfif>
<!--- end check user account --->
<!--- if this is Stifel, write a copy of their input XML to a file --->
<cfif RU.comp_id eq 4177 or RU.comp_id eq 5592>
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\encompass\Posted_Stifel_XML\#posted_xml_filename#" nameconflict="makeunique" output="#Trim(datastring)#">
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
SELECT * FROM first_title_states ORDER BY st_abbrev ASC
</CFQUERY>
<cfset states_list = "">

<cfoutput query="read_state_list">
<cfset states_list = ListAppend(states_list, st_abbrev, ",")>
</cfoutput>



<cfswitch expression="#transaction#">
<cfcase value="FeeInquiry">
<cfparam name="pstate" default="">
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State neq "">
<CFSET pstate = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Property State", ",")>
</cfif>


<cfinclude template="calculator_xml.cfm">
</cfcase>
<cfcase value="Order">
<cfparam name="pstate" default="">
<cfparam name="MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State" default="">
<cfif MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State neq "">
<CFSET pstate = MyXml.request.DATA.MAIN.LOAN.XmlChildren[1].PROPERTY.XmlATTRIBUTES._State>
<cfelse>
<cfset missing_fields = ListAppend(missing_fields, "
Property State", ",")>
</cfif>

<cfinclude template="original_order.cfm">
</cfcase>
<cfcase value="OrderStatus">
<cfinclude template="order_status.cfm">
</cfcase>
<cfcase value="Cancellation">
<cfinclude template="cancel_order.cfm">
</cfcase>
<cfcase value="Change">
<cfinclude template="change_order.cfm">
</cfcase>
<cfcase value="Update">
<cfinclude template="update_order.cfm">
</cfcase>
</cfswitch>