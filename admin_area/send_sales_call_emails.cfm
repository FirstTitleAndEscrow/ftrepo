<!--- send out Loan Funded Emails --->

<cfquery name="read_comp" datasource="#request.dsn#">

select * from title
where title_id = #url.rec_id#
</cfquery>


<cfquery name="read_company" datasource="#request.dsn#">

select company, intsales from companies
where id = #read_comp.comp_id#
</cfquery>

<cfif FindNoCase(read_company.company, 'freddie')>
<cfset outgoing_email = "freddiecontract@streamline-title.com">
<cfelseif FindNoCase(read_company.company, 'fannie')>
<cfset outgoing_email = "fanniecontract@streamline-title.com">
<cfelse>
<cfset outgoing_email = "othercontract@streamline-title.com">
</cfif>


<!--- contracts@streamline-title.com --->
<CFMAIL
	    TO="#outgoing_email#"
        FROM="webmaster@firsttitleservices.com"
        SERVER="127.0.0.1"
        Subject="Sales Call Comment has been added for file #read_comp.title_id#"
        TIMEOUT="600"
        >

The following Comment has been added to File: #read_comp.title_id#

#otherpro#


</CFMAIL>
