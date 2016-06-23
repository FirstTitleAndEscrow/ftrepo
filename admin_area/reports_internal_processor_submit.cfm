<!--- Add (Start) Added by Synechron Development for ticket# 737 --->
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
	where E.cl_dateandtime between '#START_DATE#' and '#END_DATE#'
	group by A.fname+ ' ' +A.Lname;
</cfquery>


<html>
	<title>
		Internal Processor Report
	</title>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="/javascript/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/javascript/TableTools.min.js"></script>


<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="/css/TableTools.css">
<link rel="stylesheet" type="text/css" href="/css/TableTools_JUI.css">



</head>
<style>

#message 
{
     position: relative;
     margin-left: 100px;   
     margin-top: 20px;     
}

td, th
{
       font-family:"Arial";
       font-size:small;     
}

select
{
       color:blue;
}

.dialog{
       font-family:"Arial";
       font-size:small;
       background:lightgray;
}

.dialog input{
       background-color:#ffffdf;
       color:blue;
}

#btn_add btn_export
{
       cursor:hand;
}
</style>

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
<body bgcolor="lightgray" >
<center>
<table width=800><tr><td align="center">
	<form>						
		<table id="MainTable" class="dataTable" width="50%">
			<thead>
				 <tr>            
				 	<th align="center" colspan=2><cfoutput>#dateFormat(STARTDATE, "mm/dd/yyyy")# - #dateFormat(ENDDATE, "mm/dd/yyyy")#</cfoutput></th>	 	       
				 </tr>
			</thead>
			<thead>
				 <tr>            
				 	<th align="Left" style="width:25%">Processor Name</th> 
					<th align="right" style="width:25%">Number of Closed Loans</th>	 	       
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
</td></tr></table>
</center></body>
</html>
<!--- Add (End) Added by Synechron Development for ticket# 737 --->