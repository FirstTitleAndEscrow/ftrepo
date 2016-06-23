<!--- Add (Start) Added by Synechron Development for ticket# 737 --->
<cfset melanies_companies_list = "9711,10436,9810,10402,10497,1754">
<cfif isDefined("form.submit")>
<CFIF IsDefined("FORM.STARTDATE")>	
	<CFSET START_DATE = #STARTDATE#>
</CFIF>
<CFIF IsDefined("FORM.ENDDATE")>	
	<CFSET END_DATE = #DateFormat(Dateadd("d",1,ENDDATE),"MM/dd/yyyy")#>
</CFIF>

<!---<cfquery name="GetTitleClosed" datasource="#request.dsn#">
	SELECT  A.fname+ ' ' +A.Lname 'ProsessorName',COUNT(A.fname+ ' ' +A.Lname)'TitlesClosed'
	FROM Title T
	INNER JOIN First_Admin A ON T.ip_id = A.ID and A.Processor = 'True'
	INNER JOIN EventList E ON T.Title_ID = E.Title_id
	where E.cl_dateandtime between '#START_DATE#' and '#END_DATE#'	group by A.fname+ ' ' +A.Lname;
</cfquery>--->
</cfif>

<cfquery name="get_processors" datasource="#request.dsn#">
	SELECT  *
	FROM First_admin where
	Processor = 'True'
</cfquery>


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
<script type="text/javascript" src="https://www.firsttitleservices.com/admin_area/javascript/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://www.firsttitleservices.com/admin_area/javascript/TableTools.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://www.firsttitleservices.com/admin_area/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://www.firsttitleservices.com/admin_area/css/jquery.dataTables_themeroller.css">

<link rel="stylesheet" type="text/css" href="https://www.firsttitleservices.com/admin_area/css/TableTools.css">
<link rel="stylesheet" type="text/css" href="https://www.firsttitleservices.com/admin_area/css/TableTools_JUI.css">
<script type="text/javascript">	
	  	
	$(document).ready(function(){
		$('#MainTable').dataTable({
			
			"bPaginate": true,			
		    "bLengthChange": false,
	        "bFilter": true,
	        "bSort": true,
			"bStateSave": true,
	        "bInfo": false,
			"bAutoWidth": true,
			"iDisplayLength": 25,
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
				 	<th align="Left" style="width:10%">Processor Name</th> 
					<th align="Left" style="width:10%">Client</th>	 	       
					<th align="Left" style="width:10%">Title_id</th>	 	       
					<th align="Left" style="width:10%">Status</th>	 	       
					<th align="Left" style="width:10%"><nobr>Clear to Close?</nobr></th>	 	       
					<th align="Left" style="width:10%"><nobr>Scheduled Closing Date</nobr></th>	 	       
					<th align="Left" style="width:10%">Last Comment</th>	 	       
				 </tr>
			</thead>


<cfloop query="get_processors">
<cfquery name="get_files_t" datasource="#request.dsn#">
	SELECT  t.*, c.ID, c.company
	FROM title t, companies c where t.ip_id = '#get_processors.ID#'
    and t.cancelled IS NULL and (t.appraisal_status <> 'Loan Closed' and t.appraisal_status <> 'Loan Funded' and t.appraisal_status <> 'Loan Closed-Seller Rep')
    and t.comp_id IN (#melanies_companies_list#)
    and c.ID = t.comp_id order by t.comp_id, t.order_date
</cfquery>



			<tbody>
				<cfoutput query="get_files_t">
                <cfquery name="get_nctc" datasource="#request.dsn#">
                SELECT  * from title_notes where order_id = #get_files_t.title_id#
                and note_type = 'T' and (nctc_cleared IS NULL or nctc_cleared = 'False')
                order by n_date
                </cfquery>

                
				<tr >
					<td align="Left">#get_processors.fname# #get_processors.lname#</td>
					<td align="Left">#get_files_t.company#</td>
					<td align="Left">#get_files_t.title_id#</td>
					<td align="Left">#get_files_t.appraisal_status#</td>
					<td align="Left"><cfif #get_nctc.recordcount#>No<BR>
                    <cfloop query="get_nctc" startrow="1" endrow="3">
                    <nobr>#DateFormat(get_nctc.N_Date, "mm/dd/yyyy")# - <cfif Len(get_nctc.issue_type)>#get_nctc.issue_type#</cfif><cfif Len(get_nctc.issue)>, #get_nctc.issue#</cfif></nobr>
                    </cfloop>
                    <cfelse>
                <cfquery name="get_ctc" datasource="#request.dsn#">
                SELECT  * from title_notes where order_id = #get_files_t.title_id#
                and note_type = 'T' and n_note like 'Clear to close%'
                order by n_date
                </cfquery>
                <cfif #get_nctc.recordcount#>Yes<Cfelse>Unmarked</cfif></cfif></td>
                
                <td align="Left"></td>
                <td align="Left"></td>
                
				</tr>
                
                <!---<th align="right" style="width:20%">Clear to Close?</th>	 	       
					<th align="right" style="width:20%">Scheduled Closing Date</th>	 	       
					<th align="right" style="width:20%">Last Comment</th>--->
                    
                    
                    
				</cfoutput>							
			</tbody>				
</cfloop>
		</table>
	</form>
</cfif>	
</BODY>
</HTML>
<!--- Add (End) Added by Synechron Development for ticket# 737 --->