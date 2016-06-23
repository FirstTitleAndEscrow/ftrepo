<!--- Add (Start) Added by Synechron Development for ticket# 737 --->
<cfset this_appraisal_status = 'Loan Closed'>
<cfif isDefined("form.submit")>
<cfset form.status_type = 'Loan Closed'>
<cfset lookup_field = 'cl_dateandtime'>
<CFQUERY datasource="#request.dsn#" NAME="read_tx">
	select * from first_admin
			WHERE tx_employee = 'True'
</CFQUERY>
<cfset tx_ids = ValueList(read_tx.id, ",")>



<CFIF IsDefined("FORM.STARTDATE")>	
	<CFSET START_DATE = #DateFormat(FORM.STARTDATE, "MM/dd/yyyy")#>
</CFIF>
<CFIF IsDefined("FORM.ENDDATE")>	
	<CFSET END_DATE = #DateFormat(Dateadd("d",1,FORM.ENDDATE),"MM/dd/yyyy")#>
</CFIF>

            <cfquery name="get_files_ft" datasource="#request.dsn#">
                SELECT  t.*, c.ID, c.company, c.intsales, e.cl_dateandtime, e.fl_dateandtime, c.streamline_client, e.c_day, e.c_month, e.c_year, f.fname as sales_fname, f.lname as sales_lname
                FROM title t, companies c, eventlist e, first_admin f where  e.#lookup_field# between '#Start_date#' and '#End_Date#'
                and t.cancelled IS NULL 
                and c.streamline_client = 'False'
                and c.ID = t.comp_id
                and e.title_id = t.title_id
                and f.ID = c.intsales
                order by e.#lookup_field#
            </cfquery>
            <cfquery name="get_files_st" datasource="#request.dsn#">
                SELECT  t.*, c.ID, c.company, c.intsales, e.cl_dateandtime, e.fl_dateandtime, c.streamline_client, e.c_day, e.c_month, e.c_year, f.fname as sales_fname, f.lname as sales_lname
                FROM title t, companies c, eventlist e, first_admin f where  e.#lookup_field# between '#Start_date#' and '#End_Date#'
                and t.cancelled IS NULL
                and c.streamline_client = 'True'
                and c.ID = t.comp_id
                and e.title_id = t.title_id
                and f.ID = c.intsales
                order by e.#lookup_field#
            </cfquery>

</cfif>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>

<meta charset="utf-8" />
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/smoothness/jquery-ui.css" />
	<style>
	.ui-widget 
	{font-family: Tahoma, Verdana, sans-serif; font-size: 12px;}		
	.ui-datepicker select.ui-datepicker-month { width: 60px;},
    .ui-datepicker select.ui-datepicker-year { width: 60px;}

	</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="/javascript/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/javascript/TableTools.min.js"></script>

<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables_themeroller.css">

<link rel="stylesheet" type="text/css" href="/css/TableTools.css">
<link rel="stylesheet" type="text/css" href="/css/TableTools_JUI.css">
<script type="text/javascript">	
	  	
	$(document).ready(function(){
		$('#MainTable').dataTable({
			
			"bPaginate": false,			
		    "bLengthChange": true,
	        "bFilter": true,
	        "bSort": true,
			"bStateSave": true,
	        "bInfo": false,
			"bAutoWidth": true,
			"iDisplayLength": 100,
			"sDom": 'T<"clear">lfrtip',
			"oTableTools": {
			"aButtons": [
				{
					"sExtends": "csv",
					"sButtonText": "Save to CSV"
				},
				
				{
					"sExtends": "xls",
					"sButtonText": "Save to Excel"
				},
				
				{
					"sExtends": "pdf",
					"sButtonText": "Save to PDF"
				}
			],
			
			"sSwfPath": "/media/swf/copy_csv_xls_pdf.swf"	
		  }      	
				
		});			 
				
	});
</script>

 <script>

  $(function() {
    $( "#StartDate" ).datepicker({ 
	minDate: new Date(1990, 1 - 1, 1), 
	maxDate: new Date(2020, 12-1, 31),
	 showOn: "button",
	  altField: "#EndDate",
       changeMonth: true,
      changeYear: true,
      buttonImage: "/admin_area/images/cal.gif",
      buttonImageOnly: true,
	  yearRange: "1990:2020"
	});
	
	    $( "#EndDate" ).datepicker({ 
	minDate: new Date(2000, 1 - 1, 1), 
	maxDate: new Date(2020, 12-1, 31),
	 showOn: "button",
       changeMonth: true,
      changeYear: true,
      buttonImage: "/admin_area/images/cal.gif",
      buttonImageOnly: true,
	  yearRange: "1990:2020"
	});
	$("#lst_Ext").click(function(){
	
	ToggleAllSelection(this);
	});	
  });



  
  function validateForm()
{

	var x=document.forms["frm"]["StartDate"].value;
	if (x==null || x=="")
	{
		alert("Start date can not be left blank");
		return false;
	}
	
	var x=document.forms["frm"]["EndDate"].value;
	if (x==null || x=="")
	{
		alert("End date can not be left blank");
		return false;
	}
	
	
	if (Date.parse(document.forms["frm"]["StartDate"].value) > Date.parse(document.forms["frm"]["EndDate"].value)) 
	{
		alert("Invalid Date Range!\nStart Date cannot be after End Date!")
		return false;
	}
}

function ToggleAllSelection(thisObj)
	{
		var items=[];
			
			$(thisObj).find(":selected").each(function(i,selected){
					
					items[i]=$(selected).text();		
			});
			
			if (items.indexOf("All") > -1  && items.length > 1)
			{
				$(thisObj).find("option[value=" + 0 + "]").attr("selected",false);
			}
	}
 </script>

</HEAD>
<BODY BGCOLOR=e1e1e1 TEXT="Black" LINK="Blue" VLINK="Blue" ALINK="Blue" BACKGROUND="./" TopMargin=0 LeftMargin=0 MarginHeight=0 MarginWidth=0>
<BODY>

<form action="" method="post" name="frm"  onsubmit="return validateForm()"   >
<strong>Loans Closed Date Selection</strong>
	<table>
<cfoutput>
	<tr>
	     <td>From Date</td>
	     <td><input type="text" name="StartDate" id="StartDate" <CFIF IsDefined('FORM.STARTDATE')>value="#FORM.STARTDATE#"</cfif> readonly ></td>
	</tr>
		<tr>
	     
	     <td>To Date</td>
		 <td><input type="text" name="EndDate" id="EndDate" <CFIF IsDefined('FORM.ENDDATE')>value="#FORM.ENDDATE#"</cfif> readonly ></td>
		 
	</tr>
		<!---<tr>
	     
	     <td>Search File Types</td>
		 <td><input type="radio" name="status_type" id="status_type" value='Loan Closed' >Loans Closed&nbsp;&nbsp;<input type="radio" name="status_type" id="status_type" value='Loan Funded' >Loans Funded</td>
		 
	</tr>--->
	<tr>

	<tr>
		<td  align="top" valign="left" colspan=3><input name="submit" type="submit" value="Submit"></td>
	</tr>
    </cfoutput>
	</table>       
</form>


<cfif isDefined("form.submit")>
	<form action="" method="post">
		<table id="MainTable" class="dataTable" width="80%" border=1>	
			<thead>
				 <tr>            
					<th align="Left" valign="top">Order Num</th>	 	       
					<th align="Left" valign="top">REO Num</th>	 	       
					<th align="Left" valign="top">Borrower 1</th>	 	       
					<th align="Left" valign="top">Company</th>	 	       
					<th align="Left" valign="top">Closed Date</th>	 	       
					<th align="Left" valign="top">Status</th>	 	       
					<th align="Left" valign="top">State</th>	 	       
					<th align="Left" valign="top">Loan Type</th>	 	       
					<th align="Left" valign="top">Property Address</th>	 	       
					<th align="Left" valign="top">Sales</th>	 	       
				 </tr>
			</thead>
			<tbody>
<cfoutput query="get_files_ft">
<cfset tx_file = 0>
<cfset richmond = 0>
<cfset fx = 0>
<cfif get_files_ft.pstate eq 'TX' or ListFind(tx_ids, get_files_ft.intsales, ",") gte 1>
<cfset tx_file = 1>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
		Select va_employee, ft_fairfax_employee
		from First_Admin where ID = #get_files_ft.intSales#
</CFQUERY>
	
<cfif check_richmond.va_employee eq 1>
	<cfset richmond = 1>
</cfif>
	
<cfif check_richmond.ft_fairfax_employee eq 1 or (Mid(get_files_ft.company, 1, 3) eq 'GMH' and get_files_ft.company contains 'Construction')>
	<cfset fx = 1>
</cfif>

				<tr >
					<td align="Left" valign="top"><cfif richmond eq 1>(R) </cfif><cfif fx eq 1>(FX) </cfif><cfif tx_file eq 1>(TX) </cfif>T-#get_files_ft.title_id#</td>
					<td align="Left" valign="top">#get_files_ft.reo_number#</td>
					<td align="Left" valign="top">#get_files_ft.bfirstname1# #get_files_ft.blastname1#</td>
					<td align="Left" valign="top">#get_files_ft.company#</td>
					<td align="Left" valign="top">#DateFormat(get_files_ft.cl_dateandtime, "mm/dd/yyyy")#</td>
					<td align="Left" valign="top">#get_files_ft.appraisal_status#</td>
					<td align="Left" valign="top">#get_files_ft.pstate#</td>
					<td align="Left" valign="top">#get_files_ft.SearchType#</td>
					<td align="Left" valign="top">#get_files_ft.paddress#, #get_files_ft.pcity#, #get_files_ft.pzip#</td>
					<td align="Left" valign="top">#get_files_ft.sales_fname# #get_files_ft.sales_lname#</td>
				</tr>
                
                    
				</cfoutput>	
<cfoutput query="get_files_st">
				<tr >
					<td align="Left" valign="top">ST-#get_files_st.title_id#</td>
					<td align="Left" valign="top">#get_files_st.reo_number#</td>
					<td align="Left" valign="top">#get_files_st.bfirstname1# #get_files_st.blastname1#</td>
					<td align="Left" valign="top">#get_files_st.company#</td>
					<td align="Left" valign="top">#DateFormat(get_files_st.cl_dateandtime, "mm/dd/yyyy")#</td>
					<td align="Left" valign="top">#get_files_st.appraisal_status#</td>
					<td align="Left" valign="top">#get_files_st.pstate#</td>
					<td align="Left" valign="top">#get_files_st.SearchType#</td>
					<td align="Left" valign="top">#get_files_st.paddress#, #get_files_st.pcity#, #get_files_st.pzip#</td>
					<td align="Left" valign="top">#get_files_st.sales_fname# #get_files_st.sales_lname#</td>
				</tr>
                
                    
				</cfoutput>	
                			</tbody>				
		</table>
	</form>



            <!---<cfif session.ft_user_id eq 651>
            <cfdump var="#get_files_ft#">
            <cfabort>
            </cfif>--->

</cfif>	
</BODY>
</HTML>
<!--- Add (End) Added by Synechron Development for ticket# 737 --->