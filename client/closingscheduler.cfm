<cfset twilioUsername = "AC81ebd9ed78692ef63a36efd73499d23f" />
<cfset twilioPassword = "159e672a604836c2a167cb6726638511" />

<cfset twilioFrom = "443-648-9210" />
<cfset twilioSMSResource = (
    "https://api.twilio.com/2008-08-01" &
    "/Accounts/#twilioUsername#/SMS/Messages"
    ) />
	
	<!--- closingmanage.cfm?rec_id=52555&a=2--->
	<!--- closingmanage.cfm?rec_id=52555&a=3--->

<cfif a EQ 2>
<CFQUERY datasource="#request.dsn#" NAME="get">
	select * from Title_Closing_Order_Request where title_id = #rec_id#
</cfquery>
<cfset phoneto = get.notary_phone>
<cfsavecontent variable="message">Please click link to confirm you will be on time for First Title closing http://machine1.firsttitleservices.com/client/closingmanage.cfm?rec_id=<cfoutput>#rec_id#</cfoutput>&a=2</cfsavecontent>
<cfelseif a Eq 3>
<CFQUERY datasource="#request.dsn#" NAME="get">
	select * from Title_Closing_Order_Request where title_id = #rec_id#
</cfquery>
<cfset phoneto = get.notary_phone>
<cfsavecontent variable="message">Please click link to confirm whether the First Title closing took place http://machine1.firsttitleservices.com/client/closingmanage.cfm?rec_id=<cfoutput>#rec_id#</cfoutput>&a=3</cfsavecontent>

</cfif>
<cfif Len(phoneto)>
<cfhttp
        result="post"
        method="post"
        url="#twilioSMSResource#"
        username="#twilioUsername#"
        password="#twilioPassword#">

        <cfhttpparam
            type="formfield"
            name="From"
            value="#twilioFrom#"
            />


        <cfhttpparam
            type="formfield"
            name="To"
            value="#phoneto#"
            />

        <cfhttpparam
            type="formfield"
            name="Body"
            value="#message#"
            />



    </cfhttp>
</cfif>