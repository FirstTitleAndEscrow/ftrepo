<!--- Add (Start) Added by Synechron Development for ticket# 737 --->
<cfset melanies_companies_list = "9711,10436,9810,10402,10497">
<cfif isDefined("form.submit")>
<CFIF IsDefined("FORM.STARTDATE")>	
	<CFSET START_DATE = #DateFormat(FORM.STARTDATE, "MM/dd/yyyy")#>
</CFIF>
<CFIF IsDefined("FORM.ENDDATE")>	
	<CFSET END_DATE = #DateFormat(Dateadd("d",1,FORM.ENDDATE),"MM/dd/yyyy")#>
</CFIF>

            <cfquery name="get_files_t" datasource="#request.dsn#">
                SELECT  t.*, c.ID, c.company
                FROM title t, companies c where (t.comp_id IN (#melanies_companies_list#)
                and t.order_date between '#Start_date#' and '#End_Date#'
                and t.cancelled IS NULL and (t.appraisal_status <> 'Loan Closed' and t.appraisal_status <> 'Loan Funded' and t.appraisal_status <> 'Loan Closed-Seller Rep')
                and c.ID = t.comp_id)
                order by t.comp_id, t.order_date
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
<strong>Internal Processor Report Date Selection</strong>
	<table>

	<tr>
	     <td>From Date</td>
	     <td><input type="text" name="StartDate" id="StartDate"  readonly ></td>
	</tr>
		<tr>
	     
	     <td>To Date</td>
		 <td><input type="text" name="EndDate" id="EndDate" readonly ></td>
		 
	</tr>
	<tr>

	<tr>
		<td  align="top" valign="left" colspan=3><input name="submit" type="submit" value="Submit"></td>
	</tr>
	</table>       
</form>


<cfif isDefined("form.submit")>
	<form action="" method="post">
		<table id="MainTable" class="dataTable" width="80%" border=1>	

			<thead>
				 <tr>            
				 	<th align="Left" valign="top">Processor Name</th> 
					<th align="Left" valign="top">Client</th>	 	       
					<th align="Left" valign="top">REO #</th>	 	       
					<th align="Left" valign="top">Title_id</th>	 	       
					<th align="Left" valign="top">Address</th>	 	       
					<th align="Left" valign="top">Status</th>	 	       
					<th align="Left" valign="top"><nobr>Clear to Close?</nobr></th>	 	       
					<th align="Left" valign="top"><nobr>Scheduled Closing Date</nobr></th>	 	       
					<th align="Left" valign="top">Last Comment</th>	 	       
				 </tr>
			</thead>
			<tbody>
<cfoutput query="get_files_t">
<cfset ip = 'None set'>
<cfif Len(get_files_t.ip_id) and get_files_t.ip_id neq 'NULL' >
             <cfquery name="get_ip" datasource="#request.dsn#" maxrows="1">
                SELECT  *
                FROM first_Admin 
                where ID = #get_files_t.ip_id#
            </cfquery>
<cfset ip = #get_ip.fname# & ' ' & #get_ip.lname#>
</cfif>

                <cfquery name="get_nctc" datasource="#request.dsn#" maxrows="1">
                SELECT  * from title_notes where (order_id = #get_files_t.title_id#
                and note_type = 'T' and n_note like 'not clear to close%' and (nctc_cleared IS NULL or nctc_cleared = 'False'))
                order by n_date desc
                </cfquery>

                
				<tr >
					<td align="Left" valign="top">#ip#</td>
					<td align="Left" valign="top">#get_files_t.company#</td>
					<td align="Left" valign="top">#get_files_t.reo_number#</td>
					<td align="Left" valign="top">#get_files_t.title_id#</td>
					<td align="Left" valign="top">#get_files_t.paddress#, #get_files_t.pcity#, #get_files_t.pstate# #get_files_t.pzip#</td>
					<td align="Left" valign="top">#get_files_t.appraisal_status#</td>
					<td align="Left" valign="top"><cfif #get_nctc.recordcount#>No<BR>
                    <cfloop query="get_nctc" startrow="1" endrow="3">
                    <nobr>#DateFormat(get_nctc.N_Date, "mm/dd/yyyy")# <cfif Len(get_nctc.n_note)> - #get_nctc.n_note#</cfif><cfif Len(get_nctc.issue_type)> - #get_nctc.issue_type#</cfif><cfif Len(get_nctc.issue)> - #get_nctc.issue#</cfif></nobr>
                    </cfloop>
                    <cfelse>
                <cfquery name="get_ctc" datasource="#request.dsn#" maxrows="1">
                SELECT  * from title_notes where (order_id = #get_files_t.title_id#
                and note_type = 'T' and n_note like 'Clear to close%')
                order by n_date desc
                </cfquery>
                <cfif #get_ctc.recordcount#>Yes<Cfelse>Unmarked</cfif></cfif></td>
               
                
             <cfquery name="get_close_date" datasource="#request.dsn#" maxrows="1">
                SELECT  request_date
                FROM Title_Closing_Order_Request 
                where title_id = #get_files_t.title_id#
            </cfquery>

                
                <td align="Left" valign="top"><cfif get_close_date.recordcount>#DateFormat(get_close_date.request_date, "mm/dd/yyyy")#<cfelse>none scheduled</cfif></td>
                
                <cfquery name="last_comment" datasource="#request.dsn#" maxrows="1">
                SELECT  * from title_notes where order_id = #get_files_t.title_id#
                and note_type = 'T'
                order by n_date desc
                </cfquery>

                <td align="Left" valign="top"><cfif #last_comment.recordcount#>#DateFormat(last_comment.N_Date, "mm/dd/yyyy")#<br>
#last_comment.fname# #last_comment.lname#<br>
#last_comment.n_note#<cfelse>&nbsp;</cfif></td>
                
				</tr>
                
                    
				</cfoutput>	
                			</tbody>				
		</table>
	</form>

</cfif>	
</BODY>
</HTML>
<!--- Add (End) Added by Synechron Development for ticket# 737 --->