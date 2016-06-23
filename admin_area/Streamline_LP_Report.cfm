
<cfparam name="url.processor" type="integer" default="0">
<cfparam name="form.processor" type="integer" default="#url.processor#">

<cfparam name="url.all_processors" default="off">
<cfparam name="form.all_processors" default="#url.all_processors#">
<cfif form.all_processors eq "on"><cfset form.processor="0"></cfif>

<cfparam  name="url.order_date_adjusted_START" default="#DateFormat(DateAdd('m', -3, CreateDate (year(Now()), month(Now()), '1')), 'mm/dd/yyyy')#">
<cfparam  name="form.order_date_adjusted_START" default="#url.order_date_adjusted_START#">

<cfparam name="url.order_date_adjusted_END" default="#DateFormat(now(), 'mm/dd/yyyy')#">
<cfparam name="form.order_date_adjusted_END" default="#url.order_date_adjusted_END#">

<cfparam name="url.a_Req_Closing_Date_START" default="">
<cfparam name="form.a_Req_Closing_Date_START" default="#url.a_Req_Closing_Date_START#">

<cfparam name="url.a_Req_Closing_Date_END" default="">
<cfparam name="form.a_Req_Closing_Date_END" default="#url.a_Req_Closing_Date_END#">

<cfparam name="url.contract_busted_date_START" default="">
<cfparam name="form.contract_busted_date_START" default="#url.contract_busted_date_START#">

<cfparam name="url.contract_busted_date_END" default="">
<cfparam name="form.contract_busted_date_END" default="#url.contract_busted_date_END#">

<CFQUERY datasource="#request.dsn#" NAME="get_proc_list">
	SELECT lp_fname, lp_lname, max(ID) as ID
	FROM users WHERE streamline_emp = 'True' AND pname <> 'Rick Jermain'
	GROUP BY lp_lname, lp_fname
	ORDER BY lp_lname, lp_fname
</CFQUERY>

<cfif form.processor neq "0" OR form.all_processors neq "off">
	
	<CFQUERY datasource="#request.dsn#" NAME="get_procs">
		SELECT lp_fname, lp_lname
		FROM users WHERE streamline_emp = 'True'
		AND <cfif form.all_processors eq "on">pname <> 'Rick Jermain'<cfelse>ID = #form.processor#</cfif>
	</CFQUERY>
	
	<CFIF #get_procs.RecordCount# gte "1">
		
		<CFQUERY datasource="#request.dsn#" NAME="get_files">
	    	SELECT t.pname,t.seller_rep,t.comp_id,t.title_id,t.paddress,t.pcity,t.pstate,t.pzip,t.loan_number,t.order_date_adjusted,c.Company,r.a_Req_Closing_Date,r.contract_busted_date
	   		 FROM title t, companies c, title_closing_order_Request r
			WHERE t.comp_id = c.id
			AND t.title_id = r.title_id
			AND t.appraisal_status <> 'Loan Closed'
			AND t.appraisal_status <> 'Loan Funded'
			AND t.appraisal_status <> 'Loan Closed-Seller Rep'	
			AND (t.cancelled IS NULL OR t.cancelled = '')	
			AND t.comp_id <> '100'		
			<CFLOOP QUERY="get_procs">
			    <cfif get_procs.CurrentRow eq 1> AND ( </cfif>
			    (t.pname Like '%#lp_fname# #lp_lname#%' or t.pname like '%#lp_fname##lp_lname#%') 
				<cfif get_procs.CurrentRow neq get_procs.RecordCount> OR <cfelse> ) </cfif>
			</cfloop>
			<cfif form.order_date_adjusted_START neq "" and form.order_date_adjusted_END neq "">
			 AND t.order_date_adjusted 
			 BETWEEN '#DateFormat(form.order_date_adjusted_START, 'mm/dd/yyyy')#' 
			 AND '#DateFormat(form.order_date_adjusted_END, 'mm/dd/yyyy')#'
			</cfif>	
			<cfif form.a_Req_Closing_Date_START neq "" and form.a_Req_Closing_Date_END neq "">
			AND r.a_Req_Closing_Date 
			BETWEEN '#DateFormat(form.a_Req_Closing_Date_START, 'mm/dd/yyyy')#'
			AND '#DateFormat(form.a_Req_Closing_Date_END, 'mm/dd/yyyy')#'
			</cfif>
			<cfif form.contract_busted_date_START neq "" and form.contract_busted_date_END neq "">
			AND r.contract_busted_date 
			BETWEEN '#DateFormat(form.contract_busted_date_START, 'mm/dd/yyyy')#'
			AND '#DateFormat(form.contract_busted_date_END, 'mm/dd/yyyy')#'
			</cfif>	
			ORDER BY t.pname					
 		</CFQUERY>	
		
	</cfif>
	
</cfif>

<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Streamline Loan Processor Report</title>
	<script type="text/javascript" src="DatePicker.js"></script>   
	<style type="text/css">
		<!--
		input.silver { font-size:10px; height:15px; width:80px; color:##532900; background:##EBE5D9; border:1px solid black; }
		select.silver { font-size:10px; color:##532900; background:##EBE5D9; border:1px solid black; }
		.page_container { width:1000px; }
		.page_header { position:absolute; top:2px; left:5px; font-size:20px; color:black;}
		.selections { text-align:right; float:left; padding:5px 5px 5px 5px; margin:5px; border:1px dotted ##532900; height:100px; }
		-->
	</style>
	<link rel="stylesheet" type="text/css" href="DatePicker.css" />
	<link rel="stylesheet" type="text/css" href="tabledesign.css" />
</head>

<body>
<div class="page_header">Streamline Loan Processor Report</div> 
<div class="page_container">

<form action="streamline_lp_report.cfm" method="post">
	<div class="selections" style="text-align:left;">
		<input type="radio" name="all_processors" value="on" <cfif form.all_processors eq "on">checked</cfif> /> All Processors		<br />
		<input type="radio" name="all_processors" value="off" <cfif form.all_processors eq "off">checked</cfif> /> Single Processor:
		<select class="silver" name="processor">
			<option value="0"> </option>
			<cfloop QUERY="get_proc_list"><option value="#ID#" <cfif form.processor eq ID>selected</cfif>>#lp_lname#, #lp_fname#</option></cfloop>
		</select><br /><br />
		<input type="submit" value="Run Report" />
		<CFIF isDefined('get_files.RecordCount')>&nbsp; &nbsp; <em><b>#get_files.RecordCount# Files Found</b></em></cfif>	
	</div>	
	<div class="selections"> 
		<b>Order Date</b><br /><br />
		From: <input class="silver" name="order_date_adjusted_START" value="#form.order_date_adjusted_START#" \><img style="vertical-align:bottom" hspace="1" vspace="0" src="calendar.png" onclick="displayDatePicker('order_date_adjusted_START');"><br /><br />
		To: <input class="silver" name="order_date_adjusted_END" value="#form.order_date_adjusted_END#" \><img style="vertical-align:bottom" hspace="1" vspace="0" src="calendar.png" onclick="displayDatePicker('order_date_adjusted_END');">
	</div>
	<div class="selections">
		<b>Closing Date</b><br /><br />
		From: <input class="silver" name="a_Req_Closing_Date_START" value="#form.a_Req_Closing_Date_START#" \><img style="vertical-align:bottom" hspace="1" vspace="0" src="calendar.png" onclick="displayDatePicker('a_Req_Closing_Date_START');"><br /><br />
		To: <input class="silver" name="a_Req_Closing_Date_END" value="#form.a_Req_Closing_Date_END#" \><img style="vertical-align:bottom" hspace="1" vspace="0" src="calendar.png" onclick="displayDatePicker('a_Req_Closing_Date_END');">
	</div>
	<div class="selections">
		<b>Busted Date</b><br /><br />
		From: <input class="silver" name="contract_busted_date_START" value="#form.contract_busted_date_START#" \><img style="vertical-align:bottom" hspace="1" vspace="0" src="calendar.png" onclick="displayDatePicker('contract_busted_date_START');"><br /><br />
		To: <input class="silver" name="contract_busted_date_END" value="#form.contract_busted_date_END#" \><img style="vertical-align:bottom" hspace="1" vspace="0" src="calendar.png" onclick="displayDatePicker('contract_busted_date_END');">
	</div>	
</form>

<div style="clear:both;"> </div>

<CFIF not isDefined('get_procs.RecordCount') or #get_procs.RecordCount# lt "1"><br /> No processors found for your selection. </div></body></html> <cfabort></cfif>
<CFIF not isDefined('get_files.RecordCount') or #get_files.RecordCount# lt "1"><br /> No files found for your selection. </div></body></html> <cfabort></cfif>

<table style="position:absolute;top:130px;" summary="Streamline Loan Processor Report">
	<caption>Streamline Loan Processor Report</caption>
	<thead>
		<tr>
		<th scope="col" class="sortable">Processor</th>
		<th scope="col" class="sortable">Order Number</th>		
        <th scope="col" class="sortable">Seller Rep</th>		
		<th scope="col" class="sortable">Order Date</th>
		<th scope="col" class="sortable">Closing Date</th>
        <th scope="col" class="sortable">Busted Date</th>
		<th scope="col" class="sortable">Loan Number</th>
		<th scope="col" class="sortable">Company</th>        
        <th scope="col" class="sortable">State</th>
    	</tr>
	</thead> 
	<tfoot>
		<tr>
		<th scope="row">Total</th>
		<td colspan="8">#get_files.RecordCount# Files</td>
		</tr>
	</tfoot>
    <tbody>
    	<cfloop query="get_files">			
		<tr>
		<td>#pname#</td>	
		<td>#title_id#</td>			 	
		<td><cfif seller_rep eq 'True'>YES<cfelse>&nbsp;</cfif></td>				
		<td><cfif IsDate(order_date_adjusted) and order_date_adjusted neq 'NULL'>#dateformat(order_date_adjusted,"mm/dd/yyyy")#<cfelse>&nbsp;</cfif></td>
        <td><cfif IsDate(a_Req_Closing_Date) and a_Req_Closing_Date neq 'NULL'>#dateFormat(a_Req_Closing_Date, 'mm/dd/yyyy')#<cfelse>&nbsp;</cfif></td>
        <td><cfif IsDate(contract_busted_date) and contract_busted_date neq 'NULL'>#dateFormat(contract_busted_date, 'mm/dd/yyyy')#<cfelse>&nbsp;</cfif></td>				
		<td>#loan_number#</td>
        <td>#company#</td>				
		<td>#pstate#</td>			
        </tr>			
        </cfloop>        
 	</tbody>
</table>
<script type="text/javascript" src="tablesort.js"></script>



</div>
</body>
</html>
</cfoutput>