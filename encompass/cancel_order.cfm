<!--- Get the Order Number --->
<CFSET title_id = MyXml.request_group.request.request_data.Title_Request.xmlattributes.VendorOrderIdentifier>

<CFQUERY datasource="#request.dsn#" NAME="find_order">
	select * from title
	WHERE title_id = #title_id#
	and comp_id = #comp_id#
</CFQUERY>

<cfif find_order.recordcount>
<CFQUERY datasource="#request.dsn#">		
	Update tax_cert_title
	set cancelled_client = 1 
	where title_id = #title_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#">		
	Update title
	set cancelled = 1 
	where title_id = #title_id#
</CFQUERY>	
			
<CFQUERY datasource="#request.dsn#">		
	INSERT INTO Title_Notes(Order_ID, N_Note, N_Date, N_Time, note_type)
	VALUES(#title_id#,'Cancelled per client','#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T')		
</CFQUERY>
<cfinvoke	component = "cfc.encompass"	method = "throwError" message="Your order was cancelled." encompass_transaction_id="#encompass_id#" condition="Success" order_id="#title_id#">
<cfabort>
<cfelse>
<cfinvoke	component = "cfc.encompass"	method = "throwError" message="No such order number on file." encompass_transaction_id="#encompass_id#" condition="Error" order_id="#title_id#">
<cfabort>
</cfif>


