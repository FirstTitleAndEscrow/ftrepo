<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:#000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>



<center>
<span class="large_header"><strong>Add APR File</strong></span><br>
<br><br>




<form action="apr_file_submit.cfm" method="post">
	<input type="hidden" name="action" value="add">
	<table border=1 cellspacing=0 cellpadding=6 class="table_border">
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
	<tr>
	<td align="left" valign="bottom"><strong>Paid By</strong></td>
	<td align="left" valign="bottom">
		<select name="paid_by">
			<option value=""></option>
			<option value="First Title">First Title</option>
			<option value="Streamline">Streamline</option>
			<option value="Texas">Texas</option>
			<option value="Client">Client</option>
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
	<td align="left" valign="bottom"><strong>Price</strong></td>
	<td align="left" valign="bottom"><input type="text" size="20" name="price"></td>
	</tr>	
	<tr><td colspan="2"><input type="submit" value="Add File"></td></tr>


</table>
</center>

<br>
<br>
<br>



