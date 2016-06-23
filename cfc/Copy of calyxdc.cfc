<cfcomponent>
<cffunction name="throwError" output="true">
	<cfargument name="message" required="true">
	<cfargument name="condition" required="true">
	<cfargument name="calyx_transaction_id" required="true">
	<cfargument name="title_id" required="no">
	<cfargument name="embed_file" required="no" default="">
	<cfargument name="embed_file_2" required="no" default="">
<CFCONTENT 
  TYPE="text/xml" 
  RESET="Yes"><CFOUTPUT><?xml version="1.0" encoding="UTF-8"?>
<RESPONSE_GROUP MISMOVersionID="2.3.1">
   <RESPONSE>
        <KEY _Name="Calyx Transaction ID" _Value="#calyx_transaction_id#"/>
        <STATUS _Condition="#condition#" _Code="0" _Description="#message#"/>
<cfif IsDefined("title_id")>
	  <RESPONSE_DATA>
	     <TITLE_RESPONSE>
		   <PRODUCT_FULFILLMENT VendorOrderIdentifier="#title_id#" />
		   <cfif embed_file NEQ ''>
		   <EMBEDDED_FILE _Name="HUD-#title_id#.pdf" _EncodingType="base64" MIMEType="PDF">
               <DOCUMENT>#embed_file#</DOCUMENT>
            </EMBEDDED_FILE>
			</cfif>
			<cfif embed_file_2 NEQ ''>
		   <EMBEDDED_FILE _Name="TC-#title_id#.pdf" _EncodingType="base64" MIMEType="PDF">
               <DOCUMENT>#embed_file_2#</DOCUMENT>
            </EMBEDDED_FILE>
			</cfif>
		 </TITLE_RESPONSE>	  
	  </RESPONSE_DATA>
</cfif>
   </RESPONSE>
</RESPONSE_GROUP></CFOUTPUT></cffunction>

<cffunction name="SuccessfulOrder" output="true">
	<cfargument name="message" required="true">
	<cfargument name="calyx_transaction_id" required="true">
	<cfargument name="title_id" required="true">
	<cfargument name="embed_file" required="no">
<CFCONTENT 
  TYPE="text/xml" 
  RESET="Yes"><CFOUTPUT><?xml version="1.0" encoding="UTF-8"?>
<RESPONSE_GROUP MISMOVersionID="2.3.1">
   <RESPONSE>
      <KEY _Name="Calyx Transaction ID" _Value="#calyx_transaction_id#"/>
      <RESPONSE_DATA>
         <TITLE_RESPONSE>
            <PROPERTY>
               <_LEGAL_DESCRIPTION _TextDescription="Long Legal Description" _Type="MetesAndBounds"/>
            </PROPERTY>
            <EMBEDDED_FILE _Name="HUD-#title_id#.pdf" _EncodingType="base64" MIMEType="PDF">
               <DOCUMENT>#embed_file#</DOCUMENT>
            </EMBEDDED_FILE>
            <PRODUCT_FULFILLMENT VendorOrderIdentifier="#title_id#"/>
         </TITLE_RESPONSE>
      </RESPONSE_DATA>
      <STATUS _Condition="Success" _Code="0" _Description="Completed"/>
   </RESPONSE>
</RESPONSE_GROUP></CFOUTPUT></cffunction>
</cfcomponent>
