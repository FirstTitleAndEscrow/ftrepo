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

<input type="button" id="addApr" value="Add New APR Record" style="text-align:center" >
<CFQUERY datasource="#request.dsn#" NAME="get_recs">
select a.file_id, a.file_type, c.company from apr_files a
left join title t on (t.title_id = a.file_id AND a.file_type = 'T')
left join property p on (p.prop_id = a.file_id AND a.file_type = 'P')

inner join companies c on (c.id = t.comp_id OR c.id = p.comp_id)
where a.paid_in_full = 0
order by file_id, aprdate desc
</CFQUERY>

<center>
<span class="large_header"><strong>APR Orders</strong></span><br>





<cfif get_recs.recordcount>
	<table border=1 cellspacing=2 cellpadding=2 class="table_border" id="aprtable">
	<thead>
	<tr>
	<td align="left" valign="bottom"><strong>File #</strong></td>
	<td align="left" valign="bottom"><strong>File Type</strong></td>
	<td align="left" valign="bottom"><strong>Client</strong></td>
	<td align="left" valign="bottom"><strong>Due From FT</strong></td>
	<td align="left" valign="bottom"><strong>Due From Client</strong></td>
	<td>&nbsp</td>
	
	</tr>
	</thead>
	<tbody>
	<cfoutput query="get_recs" group="file_id">
		<CFQUERY datasource="#request.dsn#" NAME="getdueft">
			select coalesce(sum(a.price),0) as due from apr_files a
			where a.file_id = '#file_id#'
			and a.paid_by <> 'client'
		</cfquery>
		<CFQUERY datasource="#request.dsn#" NAME="getdueclient">
			select coalesce(sum(a.price),0) as due from apr_files a
			where a.file_id = '#file_id#'
			and a.paid_by = 'client'
		</cfquery>
		<CFQUERY datasource="#request.dsn#" NAME="getamtft">
			select coalesce(sum(a.price),0) as due, coalesce(sum(p.amtpaid),0) as paid from apr_files a
			left join apr_payments p on p.apr_file_id = a.id
			where a.file_id = '#file_id#'
			and a.paid_by <> 'client'
		</cfquery>
		<CFQUERY datasource="#request.dsn#" NAME="getamtclient">
			select coalesce(sum(a.price),0) as due, coalesce(sum(p.amtpaid),0) as paid from apr_files a
			left join apr_payments p on p.apr_file_id = a.id
			where a.file_id = '#file_id#'
			and a.paid_by = 'client'
		</cfquery>
		<cfset bgcolor = 'efefef'>
		
			<tr bgcolor="#bgcolor#">
			<td>#file_id#</td>
			<td>#file_type#</td>
			<td>#company#</td>
			<td>#getdueft.due-getamtft.paid#</td>
			<td>#getdueclient.due-getamtclient.paid#</td>
			<td><a href="apr_files.cfm?file_id=#file_id#">Modify</a></td>
			</tr>
			<cfif bgcolor eq 'efefef'>
				<cfset bgcolor = 'ffffff'>
				<cfelse>
				<cfset bgcolor = 'efefef'>
			</cfif>
	</cfoutput>
<cfelse>
	<p>There are currently no title orders in the APR system.</p>
</cfif>
</tbody>

</table>
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
			"bAutoWidth": true		
		});
	
$('#addApr').click(function() {
    $( "#dialog" ).dialog();
  });
  
   });
  
</script>

