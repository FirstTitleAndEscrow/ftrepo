<!--- Add (Start) Added by Synechron Development for ticket# 737 --->
<cfif isDefined("form.submit")>
<CFIF IsDefined("FORM.STARTDATE")>	
	<CFSET START_DATE = #STARTDATE#>
</CFIF>
<CFIF IsDefined("FORM.ENDDATE")>	
	<CFSET END_DATE = #DateFormat(Dateadd("d",1,ENDDATE),"MM/dd/yyyy")#>
</CFIF>

<cfquery name="GetTitleClosed" datasource="#request.dsn#">
	SELECT  A.fname+ ' ' +A.Lname 'ProsessorName',COUNT(A.fname+ ' ' +A.Lname)'TitlesClosed'
	FROM Title T
	INNER JOIN First_Admin A ON T.ip_id = A.ID and A.Processor = 'True'
	INNER JOIN EventList E ON T.Title_ID = E.Title_id
	where E.cl_dateandtime between '#START_DATE#' and '#END_DATE#'	group by A.fname+ ' ' +A.Lname;
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
		<table id="MainTable" class="dataTable" width="60%">	

			<thead>
				 <tr>            
				 	<th align="Left" style="width:60%">Processor Name</th> 
					<th align="right" style="width:40%">Number Closed Loans</th>	 	       
				 </tr>
			</thead>
			<tbody>
				<cfoutput query="GetTitleClosed">
				<tr >
					<td align="Left">#ProsessorName#</td>
					<td align="right">#TitlesClosed#</td>
				</tr>
				</cfoutput>							
			</tbody>				
		</table>
	</form>

</cfif>	
</BODY>
</HTML>
<!--- Add (End) Added by Synechron Development for ticket# 737 --->