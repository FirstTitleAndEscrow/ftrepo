<cfcomponent>
<cffunction name="throwError" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="wipro_transaction_id" required="no">
	<cfargument name="title_id" required="no">
	<cfargument name="embed_file" required="no" default="">
	<cfargument name="embed_file_2" required="no" default="">
<CFCONTENT 
  TYPE="text/xml" 
  RESET="Yes"><CFOUTPUT><?xml version="1.0" encoding="UTF-8" ?> 
<RESPONSE Type="Error">
<MESSAGE>
<![CDATA[ "#message#"
  ]]> 
</MESSAGE>
</RESPONSE></CFOUTPUT></cffunction>
  
  

<cffunction name="checkStatus" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="wipro_transaction_id" required="no">
	<cfargument name="title_id" required="no">
	<cfargument name="embed_file" required="no" default="">
	<cfargument name="embed_file_2" required="no" default="">
<CFCONTENT 
  TYPE="text/xml" 
  RESET="Yes"><CFOUTPUT><?xml version="1.0" encoding="UTF-8"?>
<!-- The order response will return the status of the report being prepared for the order.  Possible -->
<!-- status's are "Ready", "Pending", "Unknown".  Use "Unknown" if you have no record of the -->
<!-- OrderID that was passed. -->
<RESPONSE Type="OrderStatus" Status="#condition#">
<cfif embed_file_2 neq "">
	<ATTACHMENT MIMETypeDescription="application/pdf" EncodingTypeDescription="Base64" Type="ClosingReport">#embed_file_2#</ATTACHMENT>
</cfif>
	<!-- The message node below is optional if a message needs to be shown to the user.  Usually for a -->
	<!-- Status of "Pending" or "Unknown", a message may be appropriate. -->
	<MESSAGE><![CDATA["#message#"]]></MESSAGE>
</RESPONSE>
</CFOUTPUT></cffunction>
  
  


<cffunction name="SuccessfulOrder" output="false">
	<cfargument name="message" required="true">
	<cfargument name="wipro_transaction_id" required="true">
	<cfargument name="title_id" required="true">
	<cfargument name="embed_file" required="no">
<!--- <CFCONTENT 
  TYPE="text/xml" 
  RESET="Yes"><CFOUTPUT><?xml version="1.0" encoding="UTF-8"?>
<!-- The order response from First Title will pass back an OrderID for the order they have just received.
Additional requests by EllieMae will then use the OrderID to identify the order. -->
<RESPONSE Type="Order" OrderID="#title_id#">
	<ATTACHMENT MIMETypeDescription="application/pdf" EncodingTypeDescription="Base64" Type="FeeSummary">
		#embed_file#
	</ATTACHMENT>
</RESPONSE></CFOUTPUT> ---></cffunction>
</cfcomponent>
