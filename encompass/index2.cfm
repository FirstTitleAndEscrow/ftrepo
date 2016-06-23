
<cfset missing_fields = "">

<cfset x = GetHttpRequestData()>
<cfset dataString = ToString(x.content)>

<cfdump var="#x#">
<br>
<br>
<cfdump var="#datastring#">
<br>
<br>
<cfabort>
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\encompass\temp_file.xml" nameconflict="overwrite" output="#datastring#">
<cffile action="append" addnewline="yes" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\encompass\running_orders.xml" output="#datastring#">
<CFSET MyXml = XmlParse(dataString)>


<CFSET transaction = MyXml.request.xmlattributes.Type>


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
<cfset comp_id = check_login.ID>
<cfset RU.comp_id = check_login.ID>
</cfif>
<!--- end check user account --->
<!--- if this is Stifel, write a copy of their input XML to a file --->
<cfif RU.comp_id eq 4177>
<cffile action="append" addnewline="yes" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\encompass\stifel_orders.xml" output="#datastring#">
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