<cfsetting showdebugoutput="no">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js" ></script>
<script type="text/javascript" src="/js/jquery.dataTables.min.js" ></script>

<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables.css" />
<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables_themeroller.css" />
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css" />

<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:#000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>

<CFQUERY datasource="#request.dsn#" NAME="read_file">
	select * from apr_files
	where id = #id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_payments">
	select apr_payment_id,amtpaid,datepaid,checkNum from apr_payments
	where apr_file_id = #id#
	
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_total">
	select coalesce(sum(amtpaid),0) as totalpaid from apr_payments
	where apr_file_id = #id#
	
</CFQUERY>
<input type="button" value="Return To Report" style="text-align:center" onclick="window.location='<cfif isDefined("returnUrl")><cfoutput>#returnUrl#</cfoutput><cfelse>apr_files.cfm</cfif>'">
<center>
<span class="large_header"><strong>Edit APR File</strong></span><br>
<br><br>



<cfoutput>
<form action ="apr_file_submit.cfm" method="post">
	<cfif isDefined("returnUrl")><input type="hidden" name="returnUrl" value="#returnUrl#"></cfif>
	<input type="hidden" name="action" value="edit">
	<input type="hidden" name="id" value="#read_file.id#">
	<table border=1 cellspacing=0 cellpadding=6 class="table_border" width="100%">
	<tr>
	<td align="left" valign="bottom"><strong>File ##</strong></td>
	<td align="left" valign="bottom">#read_file.file_id#</td>
	</tr>
	<tr bgcolor = 'efefef'>
	<td align="left" valign="bottom"><strong>File Type</strong></td>
	<td align="left" valign="bottom">
		#read_file.file_type#
	
	</td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Paid By</strong></td>
	<td align="left" valign="bottom">
		<select name="paid_by">
			<option value=""></option>
			<option value="First Title" <cfif read_file.paid_by EQ 'First Title'>selected</cfif>>First Title</option>
			<option value="Streamline" <cfif read_file.paid_by EQ 'Streamline'>selected</cfif>>Streamline</option>
			<option value="Texas" <cfif read_file.paid_by EQ 'Texas'>selected</cfif>>Texas</option>
			<option value="Client" <cfif read_file.paid_by EQ 'Client'>selected</cfif>>Client</option>
		</select>
	
	</td>
	</tr>
	<tr bgcolor = 'efefef'>
		<td align="left" valign="bottom"><strong>Product</strong></td>
	<td align="left" valign="bottom">
		<select name="product">
			<option value=""></option>
			<option value="TC" <cfif read_file.product EQ 'TC'>selected</cfif>>Title Commitment</option>
			<option value="TP" <cfif read_file.product EQ 'TP'>selected</cfif>>Title Policy</option>
			<option value="TU" <cfif read_file.product EQ 'TU'>selected</cfif>>Title Update</option>
			<option value="10" <cfif read_file.product EQ '10'>selected</cfif>>10-Year Lien Search</option>
			<option value="CC" <cfif read_file.product EQ 'CC'>selected</cfif>>Closing Coordination</option>
			<option value="JS" <cfif read_file.product EQ 'JS'>selected</cfif>>Judgement Search</option>
			<option value="FS" <cfif read_file.product EQ 'FS'>selected</cfif>>Full Search</option>
			<option value="TO" <cfif read_file.product EQ 'TO'>selected</cfif>>Two Owner Search</option>
			<option value="CO" <cfif read_file.product EQ 'CO'>selected</cfif>>Current Owner Search</option>
			<option value="MS" <cfif read_file.product EQ 'MS'>selected</cfif>>Municipal Search</option>
			<option value="DR" <cfif read_file.product EQ 'DR'>selected</cfif>>Document Retrieval</option>
			<option value="BK" <cfif read_file.product EQ 'BK'>selected</cfif>>Bankruptcy</option>
			<option value="ICL" <cfif read_file.product EQ 'ICL'>selected</cfif>>ICL</option>
			<option value="TY" <cfif read_file.product EQ 'TY'>selected</cfif>>Typing</option>
			<option value="DP" <cfif read_file.product EQ 'DP'>selected</cfif>>Deed Prep</option>
			<option value="TX" <cfif read_file.product EQ 'TX'>selected</cfif>>Tax Prep</option>
			<option value="OO" <cfif read_file.product EQ 'OO'>selected</cfif>>One Owner Search</option>
			<option value="RC" <cfif read_file.product EQ 'RC'>selected</cfif>>Recording</option>
		</select>

	</td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Amount Paid</strong></td>
	<td align="left" valign="bottom">#DollarFormat(read_total.totalpaid)#</td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Date</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="aprdate" value="#DateFormat(read_file.aprdate,'mm/dd/yyyy')#"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Product Received Date</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="productreceiveddate" value="#DateFormat(read_file.productreceiveddate,'mm/dd/yyyy')#"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Price</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="price" value="#numberformat(read_file.price,'0.00')#"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Vendor Name</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="vendorname" value="#read_file.vendorname#"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Paid In Full</strong></td>
	<td align="left" valign="bottom"><select name="paid_in_full"><option value="0" <cfif read_file.paid_in_full EQ 0>selected</cfif>>No</option><option value="1" <cfif read_file.paid_in_full EQ 1>selected</cfif>>Yes</option></select></td>
	</tr>
	<!---
	<tr>
	<td align="left" valign="bottom"><strong>Amount Due</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="amtdue" value="#read_file.amtdue#"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Amount Paid</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="amtpaid" value="#read_file.amtpaid#"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Paid Date</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="paiddate" value="#DateFormat(read_file.paidDate,'mm/dd/yyyy')#"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Check ##</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="checknum" value="#read_file.checkNum#"></td>
	</tr>
	<tr><td colspan="2"><input type="submit" value="Modify File"></td></tr>
	--->
	<tr><td colspan="2"><input type="submit" value="Modify File"></td></tr>
</table>
</form>
<br><h3>Payments Received</h3>
<cfif read_payments.recordcount EQ 0>
	There are no payments applied to this file.
<cfelse>
	<table border=1 cellspacing=0 cellpadding=6 class="table_border" width="100%">
		<cfset bgcolor = 'efefef'>
		
		<tr bgcolor="#bgcolor#"><td>Amount Paid</td><td>Date Paid</td><td>Check Number</td><td>&nbsp;</td></tr>
		<cfloop query="read_payments">
			<tr><td>#DollarFormat(amtpaid)#</td><td>#DateFormat(datePaid,"mm/dd/yyyy")#</td><td>#checkNum#</td><td><a href="apr_payment_delete.cfm?apr_payment_id=#apr_payment_id#&apr_file_id=#id#<cfif isDefined('returnUrl')>&returnUrl=#UrlEncodedFormat(returnUrl)#</cfif>" onclick="return confirm('Are you sure?')">Delete</a></td></tr>
			<cfif bgcolor eq 'efefef'>
				<cfset bgcolor = 'ffffff'>
				<cfelse>
				<cfset bgcolor = 'efefef'>
			</cfif>
		</cfloop>
	</table>

</cfif>
</cfoutput>
</center>

<div id="dialog" title="Add APR File" style="display:none">
<center>
<span class="large_header"><strong>Add Payment</strong></span><br>
<br><br>




<form action="apr_payment_submit.cfm" method="post">
	<cfif isDefined("returnUrl")><input type="hidden" name="returnUrl" value="<cfoutput>#returnUrl#</cfoutput>"></cfif>
	<input type="hidden" name="action" value="add">
	<input type="hidden" name="apr_file_id" value="<cfoutput>#id#</cfoutput>">
	<table border=1 cellspacing=0 cellpadding=6 class="table_border">
	
	<tr>
	<td align="left" valign="bottom"><strong>Date Paid</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="datepaid"></td>
	</tr>
	<tr>
	<td align="left" valign="bottom"><strong>Amount Paid</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="amtpaid"></td>
	</tr>	
	<tr>
	<td align="left" valign="bottom"><strong>Check Number</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="checkNum"></td>
	</tr>
	<tr><td colspan="2"><input type="submit" value="Add Payment"></td></tr>


</table>
</form>
</center>
</div>

<br>
<div style="text-align:center">
<input type="button" value="Add A Payment"  id="addApr"> 
<!---
<input type="button" value="Mark As Paid In Full"  onclick="window.location='apr_file_complete.cfm?id=<cfoutput>#id#</cfoutput>'">
--->
</div>


<script type="text/javascript">	
 $(function() {

	
	
$('#addApr').click(function() {
    $( "#dialog" ).dialog();
  });
  
   });
  
</script>


