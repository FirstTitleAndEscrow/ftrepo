<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:#000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>



<center>
<span class="large_header"><strong>Add Payment</strong></span><br>
<br><br>




<form action="apr_payment_submit.cfm" method="post">
	<input type="hidden" name="action" value="add">
	<input type="hidden" name="apr_file_id" value="<cfoutput>#apr_file_id#</cfoutput>">
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
</center>

<br>
<br>
<br>



