<cfparam name="startDate" default="">
<cfparam name="endDate" default="">
<cfparam name="excel" default="0">
<CFQUERY datasource="#request.dsn#" NAME="getorders">
	select p.*, coalesce(d.invoice_amt_paid,0) as invoice_amt_paid,vt.assigned_price,vt.assign_date as assigned_date, vt.product_ordered, vt.id, (select top 1 task from vendor_tracker_new where order_id = p.prop_ID and task = 'Abstract') as assigned from Property p
	inner join doc_abstract_prop d on d.prop_id = p.prop_id
	inner join vendor_tracker_new vt on (vt.order_id = p.prop_id and vt.task = 'Abstract')
	where (comp_id = 6415
	OR comp_id IN (select ID from companies where master_co_id = 6415))
	<cfif Len(startDate)>
		AND dateandtime >= '#startDate#'
	</cfif>
	<cfif Len(endDate)>
		AND dateandtime <= '#endDate#'
	</cfif>
	AND p.pstate IN ('MD','DC','VA')
	order by p.prop_id, vt.assign_date asc
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="gettitleorders">
	select t.*, coalesce(d.invoice_amt_paid,0) as invoice_amt_paid,vt.assigned_price,vt.assign_date as assigned_date, vt.product_ordered, vt.id, (select top 1 task from vendor_tracker_new where order_id = t.title_ID and task = 'Abstract') as assigned from Title t
	inner join doc_abstract_title d on d.title_id = t.title_id
	inner join vendor_tracker_new vt on (vt.order_id = t.title_id and vt.task = 'Abstract')
	where (comp_id = 6415

	OR comp_id IN (select ID from companies where master_co_id = 6415))
	<cfif Len(startDate)>
		AND dateandtime >= '#startDate#'
	</cfif>
	<cfif Len(endDate)>
		AND dateandtime <= '#endDate#'
	</cfif>
	AND t.pstate IN ('MD','DC','VA')
	order by t.title_id, vt.assign_date asc
</CFQUERY>



<!--- <cfif cgi.REMOTE_ADDR eq '98.233.100.254'>
<CFQUERY datasource="#request.dsn#" NAME="getorders2">
	select p.*, d.*, (select top 1 task from vendor_tracker_new where order_id = p.prop_ID and task = 'Abstract') as assigned from Property p
	inner join doc_abstract_prop d on d.prop_id = p.prop_id
	where (comp_id = 6415
	OR comp_id IN (select ID from companies where master_co_id = 6415))
	<cfif Len(startDate)>
		AND dateandtime >= '#startDate#'
	</cfif>
	<cfif Len(endDate)>
		AND dateandtime <= '#endDate#'
	</cfif>
	order by p.prop_id
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="gettitleorders2">
	select t.*, d.*, (select top 1 task from vendor_tracker_new where order_id = t.title_ID and task = 'Abstract') as assigned from Title t
	inner join doc_abstract_title d on d.title_id = t.title_id

	where (comp_id = 6415

	OR comp_id IN (select ID from companies where master_co_id = 6415))
	<cfif Len(startDate)>
		AND dateandtime >= '#startDate#'
	</cfif>
	<cfif Len(endDate)>
		AND dateandtime <= '#endDate#'
	</cfif>
	order by t.title_id
</CFQUERY>
<cfdump var="#getorders2#"><br>
<br>
<cfdump var="#gettitleorders2#"><br>
<br>

</cfif> --->

<cfif excel EQ 1>
<cfcontent type="application/msexcel">

 
<cfheader name="Content-Disposition" value="filename=ClientInvoices.xls">
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Client Orders</title>

</head>

<body>
<cfif excel NEQ 1>
<cfoutput>
<form action="client_invoices.cfm" method="post">
<input type="hidden" name="excel" value="1">
<input type="hidden" name="startdate" value="#startdate#">
<input type="hidden" name="enddate" value="#endDate#">
<input type="submit" value="Export to Excel">
</form>
</cfoutput>

<form action="client_invoices.cfm" method="post">
<p>Start Date: <input type="text" name="startDate">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;End Date: <input type="text" name="endDate">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Filter">
</p>
</form>
</cfif>
<cfif getOrders.recordcount OR getTitleOrders.recordcount>
<table cellpadding="5" cellspacing="0" border="1" style="border:1px solid black">
<tr>
	<td style="background-color:#d4d4d4">File Number</td>
	<td style="background-color:#d4d4d4">Invoice Number</td>
	<td style="background-color:#d4d4d4">S&B Number</td>
	<!---
	<td style="background-color:#d4d4d4">Order Date</td>
	<td style="background-color:#d4d4d4">Borrower Last Name</td>
	--->
	<td style="background-color:#d4d4d4">Invoice Date</td>
	<td style="background-color:#d4d4d4">Loan Type</td>
	<td style="background-color:#d4d4d4">State</td>
	<td style="background-color:#d4d4d4">Invoice</td>
	<td style="background-color:#d4d4d4">Amount Due</td>
	<td style="background-color:#d4d4d4">Amount Paid</td>
	
<cfif cgi.REMOTE_ADDR eq '98.233.100.254'>
	<td style="background-color:#d4d4d4">Status</td>
</cfif>
</tr>
<cfset totaldue = 0>
<cfset totalpaid = 0>
<cfoutput query="getTitleOrders" group="title_ID">
	
	<cfset invloopcount = 1>
	<cfoutput>
	<tr>
		<td>T-#title_id#</td>
		<td>T-#title_id#-#invloopcount#</td>
		<td>#loan_number#</td>
		<!---
		<td>#DateFormat(dateandtime, "mm/dd/yyyy")#</td>
		<td>#blastName1#</td>
		--->
		<td>#DateFormat(assigned_date, "mm/dd/yyyy")#</td>
		<td>&nbsp;#loantype#</td>
		
		<td>#pstate#</td>
		<td>
		<cfif Len(assigned) EQ 0>
			Invoice Unavailable, no Abstractor assigned
		<cfelseif Len(loantype) EQ 0>
			Invoice Unavailable, file does not have a loan type
		<cfelse>
		<cfset totalPrice =0>
		
			<cfif Len(loantype)>
	<cfif loantype EQ "FNMA_free">
		<cfset invprice = 0>
	<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="read_pricing">
			select <cfif product_ordered EQ "bring_to_date">Updates<cfelse>#loantype#</cfif>_#pstate# as price
			from companies
			where id = #comp_id#
		</CFQUERY>
		<cfset invprice = read_pricing.price>
		<cfset totalPrice = totalPrice + invprice>
	</cfif>
	</cfif>
		<a href="title_download_invoice.cfm?title_id=#title_id#&id=#id#&invoicecount=#invloopcount#" target="_blank">Download</a> <cfif Len(loantype)>#dollarformat(invprice)#<cfelse>&nbsp;</cfif> #Replace(product_ordered,"_","","ALL")#
		<br>
		

		</cfif>
		</td>
		<td>#dollarformat(Max(invprice-invoice_amt_paid,0))# <cfset totaldue = totaldue + Max(invprice-invoice_amt_paid,0)></td>
		<td>#dollarformat(invoice_amt_paid)# <cfset totalpaid = totalpaid + invoice_amt_paid></td>
		
<cfif cgi.REMOTE_ADDR eq '98.233.100.254'>
	<td style="background-color:##d4d4d4">#appraisal_status#</td>
</cfif>
	</tr>
	<cfset invloopcount = invloopcount + 1>
</cfoutput>

</cfoutput>
<cfoutput query="getOrders" group="prop_id">
	
	<cfset invloopcount = 1>
	<cfoutput>
	<tr>
		<td>P-#prop_id#</td>
		<td >P-#prop_id#-#invloopcount#</td>
		<td>#loan_number#</td>
		<!---
		<td>#DateFormat(dateandtime, "mm/dd/yyyy")#</td>
		<td>#blastName1#</td>
		--->
		<td>#DateFormat(assigned_date, "mm/dd/yyyy")#</td>
		<td>&nbsp;#loantype#</td>
		
		<td>#pstate#</td>
		<td>
		<cfif Len(assigned) EQ 0>
			Invoice Unavailable, no Abstractor assigned
		<cfelseif Len(loantype) EQ 0>
			Invoice Unavailable, file does not have a loan type
		<cfelse>
		<cfset totalPrice =0>
		
			<cfif Len(loantype)>
	<cfif loantype EQ "FNMA_free">
		<cfset invprice = 0>
	<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="read_pricing">
			select <cfif product_ordered EQ "bring_to_date">Updates<cfelse>#loantype#</cfif>_#pstate# as price
			from companies
			where id = #comp_id#
		</CFQUERY>
		<cfset invprice = read_pricing.price>
		<cfset totalPrice = totalPrice + invprice>
	</cfif>
	</cfif>
		<a href="prop_download_invoice.cfm?prop_id=#prop_id#&id=#id#&invoicecount=#invloopcount#" target="_blank">Download</a> <cfif Len(loantype)>#dollarformat(invprice)#<cfelse>&nbsp;</cfif> #Replace(product_ordered,"_","","ALL")#
		<br>
		

		</cfif>
		</td>
		<td>#dollarformat(Max(invprice-invoice_amt_paid,0))# <cfset totaldue = totaldue + Max(invprice-invoice_amt_paid,0)></td>
		<td>#dollarformat(invoice_amt_paid)# <cfset totalpaid = totalpaid + invoice_amt_paid></td>
<cfif cgi.REMOTE_ADDR eq '98.233.100.254'>
	<td style="background-color:##d4d4d4">#appraisal_status#</td>
</cfif>
	</tr>
<cfset invloopcount = invloopcount + 1>
</cfoutput>
</cfoutput>

</table>
<cfelse>
	<p>There are no property orders assigned to this account.</p>
</cfif>

<b>Total Due: <cfoutput>#DollarFormat(totaldue)#</cfoutput></b><br>
<b>Total Paid: <cfoutput>#DollarFormat(totalpaid)#</cfoutput></b>

</body>
</html>
