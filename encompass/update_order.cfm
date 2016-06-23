<!--- Get the Order Number --->
<CFSET title_id = MyXml.request_group.request.request_data.Title_Request.xmlattributes.VendorOrderIdentifier>
<CFSET update_order_id = MyXml.request_group.request.request_data.Title_Request.xmlattributes.VendorOrderIdentifier>


<!--- look up the order --->
<CFQUERY datasource="#request.dsn#" NAME="find_order">
	select * from title
	WHERE title_id = #title_id#
	and comp_id = #comp_id#
</CFQUERY>


<!--- if order is found, proceed --->
<cfif find_order.recordcount>
<!--- get values stored in current order --->
	<CFSET pstate = MyXml.request_group.request.request_data.Title_Request.Property.xmlattributes._State>
	<CFSET pcounty = MyXml.request_group.request.request_data.Title_Request.Property.xmlattributes._County>
	<CFSET paddress = MyXml.request_group.request.request_data.Title_Request.Property.xmlattributes._StreetAddress>
	<CFSET pcity = MyXml.request_group.request.request_data.Title_Request.Property.xmlattributes._City>
	<CFSET pzip = MyXml.request_group.request.request_data.Title_Request.Property.xmlattributes._PostalCode>


<!--- compare address values stored in current order, to values being passed --->
		<cfif (pstate NEQ find_order.pstate) or (pcounty NEQ find_order.pcounty) or (paddress NEQ find_order.paddress) or (pcity NEQ find_order.pcity) or (pzip NEQ find_order.pzip)>
<!--- if any of the info is different, cancel the order... --->
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

<!--- ... and create a new order --->
			<cfinclude template="original_order.cfm">

		<cfelse>
<!--- otherwise set a flag to let "original_order.cfm" know that this is an update --->
			<cfset update_order = 1>

<!--- get values from current order for loan info --->
			<CFSET SearchType = MyXml.request_group.request.request_data.Title_Request.Loan_Purpose.xmlattributes._Type>
			<CFSET purchase = MyXml.request_group.request.request_data.Title_Request.Property.xmlattributes._SalesAmount>
			<CFSET loanamt_float = MyXml.request_group.request.request_data.Title_Request.Mortgage_Terms.xmlattributes.BaseLoanAmount>
			
			<!--- compare to values being sent --->
			<cfif (SearchType NEQ find_order.SearchType) or (purchase NEQ find_order.purchase) or (loanamt_float NEQ find_order.loanamt_float)>
<!--- if they've changed, HUD needs to be re-calculated --->
				<cfset recalculate_hud = 1>
			</cfif>
<cfinclude template="original_order.cfm">
		</cfif>
<cfelse>
<cfinvoke	component = "cfc.calyxdc"	method = "throwError" message="No such order number on file." calyx_transaction_id="#calyxdc_id#" condition="Error" order_id="#title_id#">
<cfabort>
</cfif>


