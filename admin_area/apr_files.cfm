<cfsetting showdebugoutput="no">
<cfparam name="view" default="FT">
<cfparam name="paid" default="0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="/javascript/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/javascript/datables.scroller.js"></script>
<script type="text/javascript" src="/javascript/TableTools.min.js"></script>
<script type="text/javascript" src="/javascript/ZeroClipboard.js"></script>

<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="/css/TableTools.css">
<link rel="stylesheet" type="text/css" href="/css/TableTools_JUI.css">


<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:#000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
th {text-align:left;}
</style>


<cfif isDefined("file_id")>
	<cfset rec_id = file_id>
	<cfif file_type EQ "T">
		<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
	<cfelse>
		<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">
	</cfif>
	<cfif file_type EQ "T">
		<cfset returnUrl = "apr_files.cfm?file_id=#file_id#&file_type=T&uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
	<cfelse>
		<cfset returnUrl = "apr_files.cfm?file_id=#file_id#&file_type=P&uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
	</cfif>
<cfelse>
	<cfset returnUrl = "apr_files.cfm?view=#view#&paid=#paid#">
</cfif>	


<CFQUERY datasource="#request.dsn#" NAME="get_recsTop">
select a.id, a.file_id, a.file_type, a.paid_by, a.product, a.aprdate, a.productreceiveddate, a.price, a.paid_in_full, c.company, c.use_apr, coalesce(t.pstate,p.pstate) as state, ap.amtpaid, ap.checkNum, coalesce(a.vendorname,vs.company) as vendor
,max(vt.id),ap.apr_payment_id, fa.fname, fa.lname, fa.va_employee, fa.mi_employee, fa.mo_employee, fa.mi_flushing_employee, fa.tx_employee,
(
select coalesce(sum(price),0) from apr_files 
			where id = a.id
			AND product = a.product
			AND paid_by = a.paid_by
) as due,
(
select coalesce(sum(pp.amtpaid),0) from apr_files aa
			left join apr_payments pp on pp.apr_file_id = aa.id
			where aa.id = a.id
			AND aa.product = a.product
			AND aa.paid_by = a.paid_by
) as paid
 from apr_files a
left join title t on (t.title_id = a.file_id AND a.file_type = 'T')
left join property p on (p.prop_id = a.file_id AND a.file_type = 'P')
left join apr_payments ap on a.id = ap.apr_file_id
inner join companies c on (c.id = t.comp_id OR c.id = p.comp_id)
left join first_admin fa on fa.id = c.intsales
left join vendor_tracker_new vt on (vt.order_id = a.file_id
									and vt.order_type = a.file_type
									and (vt.product_ordered =
									CASE 
									when a.product = 'TU' THEN 'bring_to_date'
									when a.product = '10' THEN 'ten_year'
									when a.product = 'FS' THEN 'full_search'
									when a.product = 'TO' THEN 'two_owner'
									when a.product = 'CO' THEN 'current_owner'
									when a.product = 'DR' THEN 'doc_retrieval'
									when a.product = 'BK' THEN 'bankruptcy'
									
									ELSE '1'
									END
									OR vt.task = 
									CASE
									when a.product = 'TY' THEN 'typing'
									when a.product = 'ICL' THEN 'icl'
									when a.product = 'DP' THEN 'deedprep'
									when a.product = 'TX' THEN 'taxprep'
									ELSE '1'
									END

									)
									)
left join vendors_stacie vs on vs.vendor_id = vt.vendor_id
where 1 = 1
<cfif not isDefined("file_id") AND paid EQ 0> 
	AND a.paid_in_full = 0
</cfif>
<cfif isDefined("file_id")>
	AND a.file_id = '#file_id#'
</cfif>
<cfif not isDefined("file_id")>
	<cfif view EQ "FT">
		AND c.streamline_client <> 1
	<cfelse>
		AND c.streamline_client = 1
	</cfif>
</cfif>
<cfif paid EQ 1>
	AND a.paid_in_full = 1
</cfif>


group by a.id, a.file_id, a.file_type, a.paid_by, a.product, a.aprdate, a.productreceiveddate, a.price, a.vendorname, a.paid_in_full, c.company, c.use_apr, coalesce(t.pstate,p.pstate), ap.amtpaid, ap.checkNum, vs.company, ap.apr_payment_id, fa.fname, fa.lname, fa.va_employee, fa.tx_employee, fa.mi_employee, fa.mo_employee, fa.mi_flushing_employee
order by a.id, ap.apr_payment_id asc, max(vt.id) desc, aprdate asc
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_tx">
	select * from first_admin
			WHERE tx_employee = 'True'
</CFQUERY>
<cfset tx_ids = ValueList(read_tx.id, ",")>

<cfquery name="get_recs" dbType="query">
	select * from get_recsTop
	where paid_by <> 'Client'
</cfquery>

<cfquery name="get_recs2" dbType="query">
	select * from get_recsTop
	where paid_by = 'Client'
	AND use_apr = 1
</cfquery>

<cfif isDefined("excel")>
	<cfif report EQ "company">
		<cfset exceloutput = QueryNew("FileNo,PaidBy,Product,Client,State,Salesperson,Vendor,Payment,DateOrdered,ProductReceivedDate,TotalPaid,Price,BalanceDue")>
		<cfoutput query="get_recs" group="id">
			<cfsavecontent variable="payment"><cfoutput group="apr_payment_id"><cfif Len(amtPaid)>#DollarFormat(amtpaid)#</cfif> <cfif Len(checkNum)>###checkNum#</cfif><cfif Len(amtPaid)>  --  </cfif></cfoutput></cfsavecontent>
			<cfset temp = QueryAddRow(exceloutput)>
			<cfset temp = QuerySetCell(exceloutput, "FileNo",file_id)>
			<cfset temp = QuerySetCell(exceloutput, "PaidBy",paid_by)>
			<cfset temp = QuerySetCell(exceloutput, "Product",product)>
			<cfset temp = QuerySetCell(exceloutput, "Client",company)>
		    <cfset temp = QuerySetCell(exceloutput, "State",state)>
		    <cfset temp = QuerySetCell(exceloutput, "Salesperson",fname&" "&lname)>
			<cfset temp = QuerySetCell(exceloutput, "Vendor",vendor)>
			<cfset temp = QuerySetCell(exceloutput, "DateOrdered",DateFormat(aprdate,"mm/dd/yyyy"))>
			<cfset temp = QuerySetCell(exceloutput, "ProductReceivedDate",DateFormat(productreceiveddate,"mm/dd/yyyy"))>
			<cfset temp = QuerySetCell(exceloutput, "Payment",payment)>
			<cfset temp = QuerySetCell(exceloutput, "TotalPaid",paid)>
			<cfset temp = QuerySetCell(exceloutput, "Price",due)>
			<cfset temp = QuerySetCell(exceloutput, "BalanceDue",due-paid)>
			<cfset fileName = CreateUUID()&".xls">
		
		</cfoutput>
	<cfelse>
		<cfset exceloutput = QueryNew("FileNo,PaidBy,Product,Client,State,Salesperson,Vendor,Payment,DateOrdered,ProductReceivedDate,TotalPaid,Price,BalanceDue")>
		<cfoutput query="get_recs2" group="id">
			<cfsavecontent variable="payment"><cfoutput group="apr_payment_id"><cfif Len(amtPaid)>#DollarFormat(amtpaid)#</cfif> <cfif Len(checkNum)>###checkNum#</cfif><cfif Len(amtPaid)>  --  </cfif></cfoutput></cfsavecontent>
			<cfset temp = QueryAddRow(exceloutput)>
			<cfset temp = QuerySetCell(exceloutput, "FileNo",file_id)>
			<cfset temp = QuerySetCell(exceloutput, "PaidBy",paid_by)>
			<cfset temp = QuerySetCell(exceloutput, "Product",product)>
			<cfset temp = QuerySetCell(exceloutput, "Client",company)>
		    <cfset temp = QuerySetCell(exceloutput, "State",state)>
		    <cfset temp = QuerySetCell(exceloutput, "Salesperson",fname&" "&lname)>
			<cfset temp = QuerySetCell(exceloutput, "Vendor",vendor)>
			<cfset temp = QuerySetCell(exceloutput, "Payment",payment)>
			<cfset temp = QuerySetCell(exceloutput, "DateOrdered",DateFormat(aprdate,"mm/dd/yyyy"))>
			<cfset temp = QuerySetCell(exceloutput, "ProductReceivedDate",DateFormat(productreceiveddate,"mm/dd/yyyy"))>
			<cfset temp = QuerySetCell(exceloutput, "TotalPaid",paid)>
			<cfset temp = QuerySetCell(exceloutput, "Price",due)>
			<cfset temp = QuerySetCell(exceloutput, "BalanceDue",due-paid)>
			<cfset fileName = CreateUUID()&".xls">
		
		</cfoutput>
	</cfif>
	
	<cfspreadsheet
			action="write"
		
		  	Filename="#expandPath('.')##fileName#"
		  	Query="exceloutput"
		  	overwrite="true"
		  
		  	>
	
	
			<cfset contentType = "unknown">
	
			<cfheader name="Content-Disposition" value="inline; filename=apr.xls">
			<cfcontent type="#contentType#"	file="#expandPath('.')##fileName#" deleteFile="yes">
			<cfabort>

</cfif>

<span class="large_header"><strong>Accounts Payable <cfif paid>(Paid In Full)</cfif></strong></span>
<cfif not isDefined("file_id")>
	<p><a href="<cfoutput>#returnurl#</cfoutput>&excel=1&report=company">Export To Excel</a></p>
</cfif>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
	<thead>
		<tr>
			<th>File No</th>
			<th>Paid By</th>
			<th>Product</th>
			<th>Client</th>
			<th>State</th>
			<th>Salesperson</th>
			<th>Vendor</th>
			<th>Payment</th>
			<th>Date Ordered</th>
			<th>Product Received Date</th>
			<th>Total Paid</th>
			<th>Price</th>
			<th>Balance Due</th>
			
			<th></th>
			<th></th>
			
		</tr>
	</thead>
</table>


<br><br><br><br>
<span class="large_header"><strong>Account Receivable Due To Company <cfif paid>(Paid In Full)</cfif></strong></span>
<cfif not isDefined("file_id")>
	<p><a href="<cfoutput>#returnurl#</cfoutput>&excel=1&report=client">Export To Excel</a></p>
</cfif>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="example2">
	<thead>
		<tr>
			<th>File No</th>
			<th>Paid By</th>
			<th>Product</th>
			<th>Client</th>
			<th>State</th>
			<th>Salesperson</th>
			<th>Vendor</th>
			<th>Payment</th>
			<th>Date Ordered</th>
			<th>Product Received Date</th>
			<th>Total Paid</th>
			<th>Price</th>
			<th>Balance Due</th>
			
			<th></th>
			<th></th>
		
		</tr>
	</thead>
</table>
<script>
$(document).ready(function() {	
$('#addApr').click(function() {
	
    $( "#dialog" ).dialog();
  });	
});
	
$(document).ready(function() {
	var aaData = [];
	//for ( var i=1 ; i<50000 ; i++ ) {
	//	aaData.push( [ i, i, i, i, i ] );
	//}
	
	<cfoutput query="get_recs" group="id">
		<cfif file_type EQ "P">
			<cfset prefix = "P-">
		<cfelse>
			<cfset prefix = "T-">
		</cfif>
		<cfif va_employee EQ 1>
			<cfset prefix = "(R) "&prefix>
		</cfif>
		<cfif tx_employee EQ 1>
			<cfset prefix = "(TX) "&prefix>
		</cfif>
		<cfif mi_employee EQ 1>
			<cfset prefix = "(MI) "&prefix>
		</cfif>
		<cfif mo_employee EQ 1>
			<cfset prefix = "(MI) "&prefix>
		</cfif>
		<cfif mi_flushing_employee EQ 1>
			<cfset prefix = "(MF) "&prefix>
		</cfif>
		
		aaData.push( ['#prefix##file_id#', '#paid_by#', '#product#', '#JsStringFormat(company)#', '#state#','#fname# #JsStringFormat(lname)#','#JsStringFormat(vendor)#','<cfoutput group="apr_payment_id"><cfif Len(amtPaid)>#JsStringFormat(DollarFormat(amtpaid))#</cfif> <cfif Len(checkNum)>###JsStringFormat(checkNum)#</cfif><cfif Len(amtPaid)>  --  </cfif></cfoutput>','#JsStringFormat(DateFormat(aprdate,"mm/dd/yyyy"))#','#JsStringFormat(DateFormat(productreceivedDate,"mm/dd/yyyy"))#','#JsStringFormat(dollarFormat(paid))#','#JsStringFormat(dollarFormat(due))#','#JsStringFormat(dollarFormat(due-paid))#','<a href="apr_file_modify.cfm?id=#id#<cfif isDefined('returnUrl')>&returnUrl=#UrlEncodedFormat(returnUrl)#</cfif>">Modify</a>','<a href="apr_file_delete.cfm?id=#id#<cfif isDefined('returnUrl')>&returnUrl=#UrlEncodedFormat(returnUrl)#</cfif>">Delete</a>' ] );
	</cfoutput>
	
	var aaData2 = [];
	//for ( var i=1 ; i<50000 ; i++ ) {
	//	aaData.push( [ i, i, i, i, i ] );
	//}
	
	<cfoutput query="get_recs2" group="id">	
		<cfif file_type EQ "P">
			<cfset prefix = "P-">
		<cfelse>
			<cfset prefix = "T-">
		</cfif>
		<cfif va_employee EQ 1>
			<cfset prefix = "(R) "&prefix>
		</cfif>
		<cfif tx_employee EQ 1>
			<cfset prefix = "(TX) "&prefix>
		</cfif>
		<cfif mi_employee EQ 1>
			<cfset prefix = "(MI) "&prefix>
		</cfif>	
		<cfif mo_employee EQ 1>
			<cfset prefix = "(MI) "&prefix>
		</cfif>	
		<cfif mi_flushing_employee EQ 1>
			<cfset prefix = "(MF) "&prefix>
		</cfif>	
		aaData2.push( ['#prefix##file_id#', '#paid_by#', '#product#', '#JsStringFormat(company)#', '#state#','#fname# #JsStringFormat(lname)#','First Title','<cfoutput group="apr_payment_id"><cfif Len(amtPaid)>#JsStringFormat(DollarFormat(amtpaid))#</cfif> <cfif Len(checkNum)>###JsStringFormat(checkNum)#</cfif><cfif Len(amtPaid)>  --  </cfif></cfoutput>','#JsStringFormat(DateFormat(aprdate,"mm/dd/yyyy"))#','#JsStringFormat(DateFormat(productreceivedDate,"mm/dd/yyyy"))#','#JsStringFormat(dollarFormat(paid))#','#JsStringFormat(dollarFormat(due))#','#JsStringFormat(dollarFormat(due-paid))#','<a href="apr_file_modify.cfm?id=#id#<cfif isDefined('returnUrl')>&returnUrl=#UrlEncodedFormat(returnUrl)#</cfif>">Modify</a>','<a href="apr_file_delete.cfm?id=#id#<cfif isDefined('returnUrl')>&returnUrl=#UrlEncodedFormat(returnUrl)#</cfif>">Delete</a>' ] );
	</cfoutput>
	
	var oTable = $('#example').dataTable( {
		"sScrollY": "<cfif isDefined('file_id')>130<cfelse>500</cfif>px",
		"aaData": aaData,
		"sDom": "frtiS",
		"bDeferRender": true
	} );
	
	var oTable2 = $('#example2').dataTable( {
		"sScrollY": "<cfif isDefined('file_id')>130<cfelse>500</cfif>px",
		"aaData": aaData2,
		"sDom": "frtiS",
		"bDeferRender": true
	} );
} );

</script>
<br><br>
<div id="dialog" title="Add APR File" style="display:none">
<center>
<span class="large_header"><strong>Add APR Record</strong></span><br>
<br><br>
<form action="apr_file_submit.cfm" method="post">
	<input type="hidden" name="action" value="add">
	
	<table border=1 cellspacing=0 cellpadding=6 class="table_border">
	<cfif isDefined("file_id")>
		<input type="hidden" name="file_id" value="<cfoutput>#file_id#</cfoutput>">
		<input type="hidden" name="returnUrl" value="<cfoutput>#returnUrl#</cfoutput>">
		<input type="hidden" name="file_type" value="<cfoutput>#file_type#</cfoutput>">
		<tr>
		<td align="left" valign="bottom"><strong>File #</strong></td>
		<td align="left" valign="bottom"><cfoutput>#file_id#</cfoutput></td>
		</tr>
		<tr>
		<td align="left" valign="bottom"><strong>File Type</strong></td>
		<td align="left" valign="bottom">
			<cfoutput>#file_type#</cfoutput>
		
		</td>
		</tr>
	<cfelse>
		<tr>
		<td align="left" valign="bottom"><strong>File #</strong></td>
		<td align="left" valign="bottom"><input type="text" size="20" name="file_id"></td>
		</tr>
		<tr>
		<td align="left" valign="bottom"><strong>File Type</strong></td>
		<td align="left" valign="bottom">
			<select name="file_type">
				<option value=""></option>
				<option value="T">Title</option>
				<option value="P">Property</option>
			</select>
		
		</td>
		</tr>
	</cfif>
	<tr>
	<td align="left" valign="bottom"><strong>Paid By</strong></td>
	<td align="left" valign="bottom">
		<select name="paid_by">
			<option value=""></option>
			<option value="First Title">First Title</option>
			<option value="Streamline">Streamline</option>
			<option value="Texas">Texas</option>
			<cfif isDefined("file_id")><cfif get_RecsTop.use_apr EQ 1><option value="Client">Client</option></cfif>
			<cfelse><option value="Client">Client</option>
			</cfif>
		</select>
	
	</td>
	</tr>
	<tr>
		<td align="left" valign="bottom"><strong>Product</strong></td>
	<td align="left" valign="bottom">
		<select name="product">
			<option value=""></option>
			<option value="TC">Title Commitment</option>
			<option value="TP">Title Policy</option>
			<option value="TU">Title Update</option>
			<option value="10">10-Year Lien Search</option>
			<option value="CC">Closing Coordination</option>
			<option value="JS">Judgement Search</option>
			<option value="FS">Full Search</option>
			<option value="TO">Two Owner Search</option>
			<option value="CO">Current Owner Search</option>
			<option value="MS">Municipal Search</option>
			<option value="DR">Document Retrieval</option>
			<option value="BK">Bankruptcy</option>
			<option value="ICL">ICL</option>
			<option value="TY">Typing</option>
			<option value="DP">Deed Prep</option>
			<option value="TX">Tax Prep</option>
			<option value="OO">One Owner Search</option>
			<option value="RC">Recording</option>
		</select>

	</td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Date</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="aprdate"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Product Received Date</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="productreceiveddate"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Price</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="price"></td>
	</tr>	
	<tr><td colspan="2"><input type="submit" value="Add"><br> <input type="button" value="Close" onclick="$( '#dialog' ).dialog('close');"></td></tr>


</table>
</center>

</div>
<cfif not paid><input type="button" id="addApr" value="Add New APR Record" style="text-align:center" ></cfif>
<cfabort>




<CFQUERY datasource="#request.dsn#" NAME="get_recsTop">
select a.*, c.company, c.use_apr, coalesce(t.pstate,p.pstate) as state, ap.amtpaid, ap.checkNum from apr_files a
left join title t on (t.title_id = a.file_id AND a.file_type = 'T')
left join property p on (p.prop_id = a.file_id AND a.file_type = 'P')
left join apr_payments ap on a.id = ap.apr_file_id
inner join companies c on (c.id = t.comp_id OR c.id = p.comp_id)
where <!---a.file_id = #file_id#--->
a.paid_in_full = 0
<cfif isDefined("file_id")>
	AND a.file_id = '#file_id#'
</cfif>
order by id, aprdate desc
</CFQUERY>

<center>


<cfquery name="get_recs" dbType="query">
	select * from get_recsTop
	where paid_by <> 'Client'
</cfquery>


<span class="large_header"><strong>Accounts Payable</strong></span><br>

<cfif get_recs.recordcount>
	<table border=1 cellspacing=2 cellpadding=2 class="table_border" id="aprtable">
	<thead>
	<tr>
	<td align="left" valign="bottom"><strong>File No</strong></td>
	<td align="left" valign="bottom"><strong>Paid By</strong></td>
	<td align="left" valign="bottom"><strong>Product</strong></td>
	<td align="left" valign="bottom"><strong>Client</strong></td>
	<td align="left" valign="bottom"><strong>State</strong></td>
	<td align="left" valign="bottom"><strong>Vendor</strong></td>
	<td align="left" valign="bottom"><strong>Payment</strong></td>
	<td align="left" valign="bottom" width=150><strong>Date Ordered</strong></td>
	<td align="left" valign="bottom" width=150><strong>Total Paid</strong></td>
	<td align="left" valign="bottom" width=150><strong>Price</strong></td>
	<td align="left" valign="bottom" width=150><strong>Balance Due</strong></td>
	<td>&nbsp</td>
	<td>&nbsp;</td>
	</tr>
	</thead>
	<tbody>
	<cfoutput query="get_recs" group="id">
	<!---
		<CFQUERY datasource="#request.dsn#" NAME="get_vendor">
			select vs.company from vendors_stacie vs
			inner join vendor_tracker_new vt on vs.vendor_id = vt.vendor_id
			where vt.order_id = '#file_id#'
			and vt.order_type = '#file_type#'
			<cfif product EQ "TU">
				AND vt.product_ordered = 'bring_to_date'
			<cfelseif product EQ "10">
				AND vt.product_ordered = 'ten_year'
			<cfelseif product EQ "FS">
				AND vt.product_ordered = 'full_search'
			<cfelseif product EQ "TO">
				AND vt.product_ordered = 'two_owner'
			<cfelseif product EQ "CO">
				AND vt.product_ordered = 'current_owner'
			<cfelseif product EQ "DR">
				AND vt.product_ordered = 'doc_retrieval'
			<cfelseif product EQ "BK">
				AND vt.product_ordered = 'bankruptcy'
			<cfelseif product EQ "TY">
				AND vt.task = 'typing'
			<cfelseif product EQ "ICL">
				AND vt.task = 'ICL'
			<cfelseif product EQ "DP">
				AND vt.task = 'DeedPrep'
			<cfelseif product EQ "TX">
				AND vt.task = 'TaxPrep'
			<cfelse>
				AND 1 = 0
			</cfif>
			order by vt.id desc
		</cfquery>
		--->
		<CFQUERY datasource="#request.dsn#" NAME="getdue">
			select coalesce(sum(a.price),0) as due from apr_files a
			where a.file_id = '#file_id#'
			AND a.product = '#product#'
			AND a.paid_by = '#paid_by#'
		</cfquery>
		
		<CFQUERY datasource="#request.dsn#" NAME="getamt">
			select coalesce(sum(a.price),0) as due, coalesce(sum(p.amtpaid),0) as paid from apr_files a
			left join apr_payments p on p.apr_file_id = a.id
			where a.file_id = '#file_id#'
			AND a.product = '#product#'
			AND a.paid_by = '#paid_by#'
		</cfquery>
		<cfset bgcolor = 'efefef'>
		
			<tr bgcolor="#bgcolor#">
			<td>#file_id#</td>
			<td>#paid_by#</td>
			<td>#product#</td>
			<td>#company#</td>
			<td>#state#</td>
			<td></td>
			<td></td>
			<td>#DateFormat(aprdate,"mm/dd/yyyy")#</td>
			<td>#dollarFormat(getamt.paid)#</td>
			<td>#dollarFormat(getdue.due)#</td>
			<td>#dollarFormat(getdue.due-getamt.paid)#</td>
			<td><a href="apr_file_modify.cfm?id=#id#<cfif isDefined('returnUrl')>&returnUrl=#UrlEncodedFormat(returnUrl)#</cfif>">Modify</a></td>
			<td><a href="apr_file_delete.cfm?id=#id#<cfif isDefined('returnUrl')>&returnUrl=#UrlEncodedFormat(returnUrl)#</cfif>" onclick="return confirm('Are you sure?')">Delete</a></td>
			</tr>
			<cfif bgcolor eq 'efefef'>
				<cfset bgcolor = 'ffffff'>
				<cfelse>
				<cfset bgcolor = 'efefef'>
			</cfif>
	</cfoutput>
<cfelse>
	<!---<p>There are currently no records paid by First Title.</p>--->
</cfif>
</tbody>

</table>



<cfquery name="get_recs" dbType="query">
	select * from get_recsTop
	where paid_by = 'Client'
	AND use_apr = 1
</cfquery>
<br><br>
<span class="large_header"><strong>Account Receivable Due To Company</strong></span><br>

<cfif get_recs.recordcount>
	<table border=1 cellspacing=2 cellpadding=2 class="table_border" id="aprtable2">
	<thead>
	<tr>
	<td align="left" valign="bottom"><strong>File No</strong></td>
	<td align="left" valign="bottom"><strong>Paid By</strong></td>
	<td align="left" valign="bottom"><strong>Product</strong></td>
	<td align="left" valign="bottom"><strong>Client</strong></td>
	<td align="left" valign="bottom"><strong>State</strong></td>
	<td align="left" valign="bottom"><strong>Vendor</strong></td>
	<td align="left" valign="bottom"><strong>Payment</strong></td>
	<td align="left" valign="bottom" width=150><strong>Date Ordered</strong></td>
	<td align="left" valign="bottom" width=150><strong>Total Paid</strong></td>
	<td align="left" valign="bottom" width=150><strong>Price</strong></td>
	<td align="left" valign="bottom" width=150><strong>Balance Due</strong></td>
	<td>&nbsp</td>
	<td>&nbsp;</td>
	</tr>
	</thead>
	<tbody>
	<cfoutput query="get_recs" group="id">
		
		
		<CFQUERY datasource="#request.dsn#" NAME="getdue">
			select coalesce(sum(a.price),0) as due from apr_files a
			where a.id = '#id#'
		</cfquery>
		
		<CFQUERY datasource="#request.dsn#" NAME="getamt">
			select coalesce(sum(a.price),0) as due, coalesce(sum(p.amtpaid),0) as paid from apr_files a
			left join apr_payments p on p.apr_file_id = a.id
			where a.id = '#id#'
		</cfquery>
		<cfset bgcolor = 'efefef'>
		
			<tr bgcolor="#bgcolor#">
			<td>#file_id#</td>
			<td>#paid_by#</td>
			<td>#product#</td>
			<td>#company#</td>
			<td>#state#</td>
			<td>First Title</td>
			<td><cfoutput><cfif Len(amtPaid)>#DollarFormat(amtpaid)#</cfif> <cfif Len(checkNum)>###checkNum#</cfif><cfif Len(amtPaid)><br></cfif></cfoutput></td>
			<td>#DateFormat(aprdate,"mm/dd/yyyy")#</td>
			<td>#dollarFormat(getamt.paid)#</td>
			<td>#dollarFormat(getdue.due)#</td>
			<td>#dollarFormat(getdue.due-getamt.paid)#</td>
			<td><a href="apr_file_modify.cfm?id=#id#<cfif isDefined('returnUrl')>&returnUrl=#UrlEncodedFormat(returnUrl)#</cfif>">Modify</a></td>
			<td><a href="apr_file_delete.cfm?id=#id#<cfif isDefined('returnUrl')>&returnUrl=#UrlEncodedFormat(returnUrl)#</cfif>" onclick="return confirm('Are you sure?')">Delete</a></td>
			</tr>
			<cfif bgcolor eq 'efefef'>
				<cfset bgcolor = 'ffffff'>
				<cfelse>
				<cfset bgcolor = 'efefef'>
			</cfif>
	</cfoutput>
<cfelse>
	<!---<p>There are currently no records paid by Client.</p>--->
</cfif>
</tbody>

</table>
<input type="button" id="addApr" value="Add New APR Record" style="text-align:center" >
<!---
<CFQUERY datasource="#request.dsn#" NAME="get_recs">
select a.*, c.company from apr_files a
inner join property p on p.prop_id = a.file_id
inner join companies c on c.id = p.comp_id
where a.file_type = 'P'
order by aprdate desc
</CFQUERY>

<br><br><br>
<center>
<span class="large_header"><strong>APR Property Orders</strong></span><br>





<cfif get_recs.recordcount>
	<table border=1 cellspacing=2 cellpadding=2 class="table_border">
	<tr>
	<td align="left" valign="bottom"><strong>File #</strong></td>
	<td align="left" valign="bottom"><strong>Client</strong></td>
	<td align="left" valign="bottom"><strong>Product</strong></td>
	<td align="left" valign="bottom" width=150><strong>Date Ordered</strong></td>
	<td>&nbsp</td>
	<td>&nbsp;</td>
	</tr>
	<cfoutput query="get_recs">
		<cfset bgcolor = 'efefef'>
		
			<tr bgcolor="#bgcolor#">
			<td>#file_id#</td>
			<td>#company#</td>
			<td>#product#</td>
			<td>#DateFormat(aprdate,"mm/dd/yyyy")#</td>
			<td><a href="apr_file_modify.cfm?id=#id#">Modify</a></td>
			<td><a href="apr_file_delete.cfm?id=#id#" onclick="return confirm('Are you sure?')">Delete</a></td>
			</tr>
			<cfif bgcolor eq 'efefef'>
				<cfset bgcolor = 'ffffff'>
				<cfelse>
				<cfset bgcolor = 'efefef'>
			</cfif>
	</cfoutput>
<cfelse>
	<p>There are currently no property orders in the APR system.</p>
</cfif>


</table>
--->
</center>


<div id="dialog" title="Add APR File" style="display:none">
<center>
<span class="large_header"><strong>Add APR Record</strong></span><br>
<br><br>
<form action="apr_file_submit.cfm" method="post">
	<input type="hidden" name="action" value="add">
	
	<table border=1 cellspacing=0 cellpadding=6 class="table_border">
	<cfif isDefined("file_id")>
		<input type="hidden" name="file_id" value="<cfoutput>#file_id#</cfoutput>">
		<input type="hidden" name="returnUrl" value="<cfoutput>#returnUrl#</cfoutput>">
		<input type="hidden" name="file_type" value="<cfoutput>#get_recsTop.file_type#</cfoutput>">
		<tr>
		<td align="left" valign="bottom"><strong>File #</strong></td>
		<td align="left" valign="bottom"><cfoutput>#file_id#</cfoutput></td>
		</tr>
		<tr>
		<td align="left" valign="bottom"><strong>File Type</strong></td>
		<td align="left" valign="bottom">
			<cfoutput>#get_recsTop.file_type#</cfoutput>
		
		</td>
		</tr>
	<cfelse>
		<tr>
		<td align="left" valign="bottom"><strong>File #</strong></td>
		<td align="left" valign="bottom"><input type="text" size="20" name="file_id"></td>
		</tr>
		<tr>
		<td align="left" valign="bottom"><strong>File Type</strong></td>
		<td align="left" valign="bottom">
			<select name="file_type">
				<option value=""></option>
				<option value="T">Title</option>
				<option value="P">Property</option>
			</select>
		
		</td>
		</tr>
	</cfif>
	<tr>
	<td align="left" valign="bottom"><strong>Paid By</strong></td>
	<td align="left" valign="bottom">
		<select name="paid_by">
			<option value=""></option>
			<option value="First Title">First Title</option>
			<option value="Streamline">Streamline</option>
			<option value="Texas">Texas</option>
			<cfif isDefined("file_id")><cfif get_RecsTop.use_apr EQ 1><option value="Client">Client</option></cfif>
			<cfelse><option value="Client">Client</option>
			</cfif>
		</select>
	
	</td>
	</tr>
	<tr>
		<td align="left" valign="bottom"><strong>Product</strong></td>
	<td align="left" valign="bottom">
		<select name="product">
			<option value=""></option>
			<option value="TC">Title Commitment</option>
			<option value="TP">Title Policy</option>
			<option value="TU">Title Update</option>
			<option value="10">10-Year Lien Search</option>
			<option value="CC">Closing Coordination</option>
			<option value="JS">Judgement Search</option>
			<option value="FS">Full Search</option>
			<option value="TO">Two Owner Search</option>
			<option value="CO">Current Owner Search</option>
			<option value="MS">Municipal Search</option>
			<option value="DR">Document Retrieval</option>
			<option value="BK">Bankruptcy</option>
			<option value="ICL">ICL</option>
			<option value="TY">Typing</option>
			<option value="DP">Deed Prep</option>
			<option value="TX">Tax Prep</option>
			<option value="OO">One Owner Search</option>
		</select>

	</td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Date</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="aprdate"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Product Received Date</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="productreceiveddate"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Price</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="price"></td>
	</tr>	
	<tr><td colspan="2"><input type="submit" value="Add"><br> <input type="button" value="Close" onclick="$( '#dialog' ).dialog('close');"></td></tr>


</table>
</center>

</div>

<br>
<br>
<br>

<script type="text/javascript">	
 $(function() {

	$('#aprtable').dataTable({
			
			"bPaginate": true,
		    "bLengthChange": true,
	        "bFilter": true,
	        "bSort": true,
			"bStateSave": true,
	        "bInfo": false,
			"bAutoWidth": true,
			"iDisplayLength": 50,
		    "sDom": 'T<"clear">lfrtip',
		    
        "oTableTools": {
            "aButtons": [
				{
					"sExtends": "csv",
					"sButtonText": "Save to CSV"
				}
			],
            "sSwfPath": "../media/swf/copy_csv_xls_pdf.swf"
        }
		});
		
	$('#aprtable2').dataTable({
			
			"bPaginate": true,
		    "bLengthChange": true,
	        "bFilter": true,
	        "bSort": true,
			"bStateSave": true,
	        "bInfo": false,
			"bAutoWidth": true,
			"iDisplayLength": 50,
			"sDom": 'T<"clear">lfrtip',
		    
        "oTableTools": {
            "aButtons": [
				{
					"sExtends": "csv",
					"sButtonText": "Save to CSV"
				}
			],
            "sSwfPath": "../media/swf/copy_csv_xls_pdf.swf"
        }
		});
	
$('#addApr').click(function() {
    $( "#dialog" ).dialog();
  });
  
   });
  
</script>

