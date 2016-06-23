
<!---Inserts new Record in the database --->
<cfif StructKeyExists(URL,'action') && #URL.action# eq 'add'>
	<cfif #session.role_id# eq 25>
		<cftransaction>
			<cfif #FORM.lstCategoriesadd# eq 0>
					<cfquery datasource="#request.dsn#" result="NewCategory">
						INSERT INTO Categories (DESCRIPTION) VALUES (<cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.AddCategory#" />)
					</cfquery>
			
					<cfquery datasource="#request.dsn#" result="NewReport" >
						 Insert into Report_Master(Report_name,URL,Report_Desc,CategoryId)
						 values(
						 <cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.ReportName#" />,
						 <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.AddURL#" />,
						 <cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.ReportDesc#" />,	
						 <cfqueryparam  cfsqltype="cf_sql_integer" value="#NewCategory.IDENTITYCOL#" />)
					</cfquery>
			<cfelse>
					<cfquery datasource="#request.dsn#" result="NewReport" >
					 Insert into Report_Master(Report_name,URL,Report_Desc,CategoryId)
					 values(
					 <cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.ReportName#" />,
					 <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.AddURL#" />,
					 <cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.ReportDesc#" />,	
					 <cfqueryparam  cfsqltype="cf_sql_integer" value="#FORM.lstCategoriesadd#" />)
				</cfquery>
			</cfif>
		</cftransaction>
	<cfelse>
		<cftransaction >
			<cfif #FORM.lstCategoriesadd# eq 0>
					<cfquery datasource="#request.dsn#" result="NewCategory">
						INSERT INTO Categories (DESCRIPTION) VALUES (<cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.AddCategory#" />)
					</cfquery>
					<cfquery datasource="#request.dsn#" result="NewReport" >
						Insert into Report_Master(Report_name,URL,Report_Desc,CategoryId)
						values(
					 	<cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.ReportName#" />,
					 	<cfqueryparam cfsqltype="cf_sql_varchar"  value="#FORM.AddURL#" />,
					 	<cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.ReportDesc#" />,	
						<cfqueryparam  cfsqltype="cf_sql_integer" value="#NewCategory.IDENTITYCOL#" />)
					</cfquery>
					
					<cfset ReportId=#NewReport.IDENTITYCOL#>
					
					<cfquery datasource="#request.dsn#">
						INSERT INTO Report_Access VALUES (#ReportId#,#session.FT_user_id#)
					</cfquery>
			<cfelse>
					<cfquery datasource="#request.dsn#" result="NewReport" >
						Insert into Report_Master(Report_name,URL,Report_Desc,CategoryId)
						values(
					 	<cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.ReportName#" />,
					 	<cfqueryparam cfsqltype="cf_sql_varchar"  value="#FORM.AddURL#" />,
					 	<cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.ReportDesc#" />,	
						<cfqueryparam  cfsqltype="cf_sql_integer" value="#FORM.lstCategoriesadd#" />)
					</cfquery>
					
					<cfset ReportId=#NewReport.IDENTITYCOL#>
					
					<cfquery datasource="#request.dsn#">
						INSERT INTO Report_Access VALUES (#ReportId#,#session.FT_user_id#)
					</cfquery>
			</cfif>		
		</cftransaction>
	</cfif>
	<cflocation url="ReportInterface.cfm" >
</cfif>

<!---Updates existing Record in the database --->
<cfif StructKeyExists(URL,'action') && #URL.action# eq 'update'>
	
	<cfquery datasource="#request.dsn#">
			Update Report_Master
			SET Report_name=<cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.Report_Name#" />,
			URL= <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.URL#" />,
			Report_Desc = <cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.Report_Desc#" />,
			CategoryId= <cfqueryparam  cfsqltype="cf_sql_integer" value="#FORM.lstCategoriesupd#" />
			WHERE Report_Id= <cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.hdnReport_Id#" />			
	</cfquery>	
	<cflocation url="ReportInterface.cfm" >		
</cfif>

<!---Deletes selected Record from the database --->
<cfif StructKeyExists(URL,'action') && #URL.action# eq 'delete'>
	<cfif #session.role_id# eq 25>
			<cftransaction>
				<cfquery datasource="#request.dsn#">
					DELETE FROM REPORT_MASTER WHERE REPORT_ID= <cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.hdnReport_Id#" />		
				</cfquery>	
			</cftransaction>
	<cfelse>
			<cftransaction>
				<cfquery datasource="#request.dsn#">
					DELETE FROM REPORT_ACCESS WHERE REPORT_ID= <cfqueryparam  cfsqltype="cf_sql_varchar" value="#FORM.hdnReport_Id#" />	 AND User_Id= <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.FT_user_id#" />	
				</cfquery>	
			</cftransaction>
	</cfif>
	<!---<cflocation url="ReportInterface.cfm" >--->
</cfif>

<!--- Query the database for all report names and their associated values --->

<cfif #session.role_id# eq 25>
	<cfquery name="GetReport" datasource=#request.dsn# >
	       SELECT Report_Id,Report_Name,URL,Report_Desc,Category.Id as CategoryId, Category.Description as Description
	  	   FROM Report_Master Join Categories Category on Report_Master.CategoryId=Category.Id
	</cfquery>
<cfelse>	
	<cfobject type="component" name="ReportObject" component="GetUserList">
	<cfset GetReport=ReportObject.getReportsList(session.FT_user_id)>	
</cfif>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">	
<head>

<script type="text/javascript" src="./javascript/jquery.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="./javascript/jquery.dataTables.min.js"></script>
</head>

<link rel="stylesheet" type="text/css" href="./css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="./css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" href="./css/jquery-ui.css" />

<style>

#AssignUsersDiv {
    top: 50%;
    left: 50%;
    position: absolute;
}

#message {
	
     position: relative;
     margin-left: -100px;   
     margin-top: -120px;	 
}

td, th
{
	font-family:"Arial";
	font-size:small;	
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


#InsertRowDiv{
position: fixed;
margin-left:-220px;
border: 1px solid black;
padding: 10px;
background: lightgray;
width: 475px;
height: 125px;
display:none;
}

#UpdateRowDiv{
position: fixed;
margin-left:-220px;
border: 1px solid black;
padding: 10px;
background: lightgray;
width: 475px;
height: 125px;
display:none;
}

#AssignUsersDiv{
position: fixed;
margin-left:-220px;
border: 1px solid black;
padding: 10px;
background: lightgray;
width: 475px;
height: 125px;
display:none;
}


#btn_add
{
	cursor:hand;
}

.web_dialog
{
   display: none;
   position: fixed;
   width: 180px;
   height: 170px;
   top: 50%;
   left: 50%;
   margin-left: 130px;
   margin-top: -170px;
   background-color: #ffffff;
   border: 2px solid #336699;
   padding: 0px;
   z-index: 102;
   font-family: Verdana;
   font-size: 10pt;
   overflow:auto;
}

.web_dialog_title
{
   border-bottom: solid 2px #336699;
   background-color: #336699;
   padding: 4px;
   color: White;
   font-weight:bold;
}

.web_dialog_title a
{
   color: White;
   text-decoration: none;
}
.align_left
{
   text-align: left;
}

.web_dialog_title_input
{
	background-color: #336699;
	color: White;
	font-family:"Arial";
	font-size:small;
	font-weight:normal;
	width:50px;
}

</style>

<script type="text/javascript">	
  	
	var $AssignUsers;
	var $Availableusers;
	var $Assignedusers;
	var RecordIds;
	
	$(document).ready(function () {
		
		$('#ReportGrid').dataTable({
			
			"bPaginate": true,
		    "bLengthChange": false,
	        "bFilter": true,
	        "bSort": true,
			"bStateSave": true,
	        "bInfo": false,
			"bAutoWidth": true		
		});
		
			$("#btn_add").click(function (){
			
			$("#tblAdd").dialog({title:"New Report"},{height:230},{width:500},{modal:false},{ resizable: false },{dialogClass:"dialog"}).parent().appendTo($('form:first'));			
			
			$("#UpdateRowDiv").hide();
			$("#AssignUsersDiv").hide();
			
		});
		
		$("#tblAdd").keypress(function(e){
			CatchKeyEvent_OnAdd(e);
		});
		
		$("#tblUpd").keypress(function (e){
			CatchKeyEvent_OnUpdate(e);
		});
					  			
		   
		$("#ReportGrid tbody tr a").mouseover(function (e){			
			
			$("#tbl_list tbody tr").remove();			
								
         	e.preventDefault();
		});
		
		$("#getSelectedValues").click(function (){
				AddSelectedNames();								
		});
		
		$("#getDeselectedValues").click(function(){
				RemoveSelectedNames();					
		});				
			
		<cfif StructKeyExists(URL,'action') AND #action# eq 'assign'>					
				$("#tblAssignUsers").dialog({title:"Assign Users"},{height:230},{width:600},{modal:false},{ resizable: false },{dialogClass:"dialog"}).parent().appendTo($('form:first'));
		</cfif>
		
		Init();	
		
		$("#AssignUsers").click(function(){
				SaveAssignedUsers();													
		});	
		
    });	
			
	function ShowDialog()
   {
     $("#dialog").fadeIn(300);     
   }

   function HideDialog()
   {
       $("#dialog").fadeOut(300);
   }	
	
	function AjaxCall(recordid)
	{
		ShowDialog();
		
		$(document).ready(function (){				
			
			$.ajax({
				type:"POST",
				url:"./GetUserList.cfc?method=getUsersList",
				data:({
				Report_Id:recordid
				}),
				dataType:"JSON",
				success: function(resultJSON){
				
					$(resultJSON.DATA).each(function(i){
					
						$("#tbl_list").append("<tr><td style=color:blue>" + resultJSON.DATA[i][0] + "</td><td style=color:blue>" + resultJSON.DATA[i][1] + "</td><tr>");
						
					});
					
					$("#tbl_list").append("<tr><td><input type=button value=Close class=web_dialog_title_input align_left /></td></tr>").click(
					function (e)
			         {
			            $("#tbl_list tbody tr").remove();
						HideDialog();
					 });		
				}
			})		
			
		});		
		
	}
	
	function Init()
	{
		$("#AssignUsers").attr('disabled','disabled');
		$("#RemoveUsers").attr('disabled','disabled');
		$("#AddCategory").hide();
		$("#lstCategoriesadd" ).change(function(){
			
			var value=$("#lstCategoriesadd" ).val();
			
			 // If the select option is chosen as "Add New Category"
			 if (value == 0) { 
				$("#AddCategory").show();
				$("#AddCategory").focus();
			 }
			else
			{ 
				$("#AddCategory").hide(); 
			}			
		});
		
		$AssignUsers=$("#tblAssignUsers");
		$Availableusers	=$("#Users");
		$Assignedusers=	$("#AssignedUsers"); 
	}
	
	function EnableAccessButton()
	{
		$("#AssignUsers").removeAttr("disabled");
	}
	
	function EnableDeleteButton()
	{
		$("#RemoveUsers").removeAttr("disabled");
	}		
	
	function ShowUsers(id,reportname)
	{				
			
			 //document.getElementById('hdnReport_Id').value=id;
			 	$AssignUsers.dialog({title:"Assign Users"},{height:230},{width:600},{modal:false},{ resizable: false },{dialogClass:"dialog"}).parent().appendTo($('form:first'));
			 	RecordIds=id;
				
				$("#ReportNamediv1 strong").html(reportname);
				$("#ReportNamediv2 strong").html(reportname);
				
				$Availableusers.find('option').remove();
				$Assignedusers.find('option').remove();
				
				LoadAvailableUsers(id);
				LoadAssignedUsers(id);			
							
	}		
		
	function GetSelectedRow(Id,Name,URL,Description,CategoryId)
	{
		var ReportId=document.getElementById('ReportId');		
		var ReportName=document.getElementById('Report_Name');
		var ReportURL=document.getElementById('URL');
		var ReportDescription=document.getElementById('Report_Desc');
		 		
		$("#tblUpd").dialog({title:"Update Report"},{height:230},{width:500},{modal:false},{ resizable: false },{dialogClass:"dialog"}).parent().appendTo($('form:first'));		
		$("#InsertRowDiv").hide();
		$("#AssignUsersDiv").hide();
		//$("#btn_add").show(); CategoryId lstCategoriesupd
		
		ReportName.value=Name;
		ReportURL.value=URL;
		ReportDescription.value=Description;		
		document.getElementById('hdnReport_Id').value=Id;
		document.getElementById('lstCategoriesupd').value=CategoryId;	
	}
	
	function CloseDialog()
	{
			$AssignUsers.dialog("close");			
			document.getElementById("ReportForm").submit();
	}
	
	function Validate(action)
	{
		var IsValid=true;
		
		if (action == 'add') {
		
			var ReportName = document.getElementById('ReportName');
			var ReportURL = document.getElementById('AddURL');
			var ReportDescription = document.getElementById('ReportDesc');
			var CategoryDescription= document.getElementById('AddCategory');
			var selectedvalue= document.getElementById('lstCategoriesadd' );
			
			if (ReportName.value == '') {
				//alert('Report Name cannot be left blank.');
				IsValid= false;
			}
			
			if (ReportURL.value == '') {
				//alert('URL cannot be left blank.');
				IsValid= false;
			}
			
			if (selectedvalue.value==0 && CategoryDescription.value == '')	{
				IsValid=false;
			}		
			
		}
		
		else if(action =='update')
		{
		
			var ReportName = document.getElementById('Report_Name');
			var ReportURL = document.getElementById('URL');
			var ReportDescription = document.getElementById('Report_Desc');
						
			if (ReportName.value == '') {
				//alert('Report Name cannot be left blank.');
				IsValid= false;
			}
			
			if (ReportURL.value == '') {
				//alert('URL cannot be left blank.');
				IsValid= false;
			}	
			
		}
		
		return IsValid;
	}
		
	function SaveInsert()
	{
		if (Validate('add')) {
		
			if (confirm('Are you sure to save this record?') == true) {
				document.getElementById("ReportForm").action = "ReportInterface.cfm?action=add";			
				document.getElementById("ReportForm").submit();
			}				
					
		}
		
		else
		{
			alert("Please enter information in the required fields");
		}	
			
	}
	
	function SaveUpdate()
	{
		if (Validate('update')) {
		
			if (confirm('Are you sure to update this record?') == true) {
				document.getElementById("ReportForm").action = "ReportInterface.cfm?action=update";				
				document.getElementById("ReportForm").submit();
			}				
		
		}
		
		else
		{
			alert("Please enter information in the required fields");
		}		
			
	}
	
	function ShowDeleteMessage(RecordId)
	{
		if (confirm('Are you sure you wish to delete this report? ') == true)	
		{
			document.getElementById('hdnReport_Id').value=RecordId;
			document.forms[0].action="ReportInterface.cfm?action=delete";			
			document.getElementById("ReportForm").submit();
		}	
		
	}	
	
    function closeform()
	{
		document.getElementById("ReportForm").action = "ReportInterface.cfm";				
		document.getElementById("ReportForm").submit();
	}
	
	function CatchKeyEvent_OnAdd(e)
	{
		var theKey=0;
  		 e=(window.event)?event:e;
  		 theKey=(e.keyCode)?e.keyCode:e.charCode;
   		if (theKey == "13") { 
		// 13 is the key code for ENTER
   			SaveInsert();
		}
	}
	
	function CatchKeyEvent_OnUpdate(e)
	{
		var theKey=0;
  		 e=(window.event)?event:e;
  		 theKey=(e.keyCode)?e.keyCode:e.charCode;
   		if (theKey == "13") {
		 // 13 is the key code for ENTER
   			SaveUpdate();
		}
	}
	
	function AddSelectedNames()
	{
			return !$('#Users option:selected').appendTo('#AssignedUsers');		
	}
	
	function RemoveSelectedNames()
	{
			return !$('#AssignedUsers option:selected').appendTo('#Users');
	}
	
	function LoadAvailableUsers(recordid)	{			
			
			
			$(document).ajaxStart(function()
			{
				$("#message").show();				
			});
			
			$.ajax({
					type:"GET",
					url:"./GetUserList.cfc?method=GetAvailableUsers",
					data:({
					Report_Id:recordid
					}),
					dataType:"JSON",
					success: function(resultJSON){
					var options = '';
					
						$(resultJSON.DATA).each(function(i)
						{
						  options+='<option value="' + resultJSON.DATA[i][0] +'">' + resultJSON.DATA[i][1] + '</option>';							
						});
						
						$("#Users").html(options);								
					}
				});
				
				$(document).ajaxStop(function(){
					$("#message").hide();
				});
										
			}
	
	function LoadAssignedUsers(recordid)
	{
						
			$.ajax({
					type:"GET",
					url:"./GetUserList.cfc?method=GetAssignedUsers",
					data:({
					Report_Id:recordid
					}),
					dataType:"JSON",
					success: function(result){
					var options = '';
					
						$(result.DATA).each(function(i)
						{
						  options+='<option value="' + result.DATA[i][0] +'">' + result.DATA[i][1] + '</option>';
							
						});
						
						$("#AssignedUsers").html(options);										
							
					}
				});
				
			}	
	
	function SaveAssignedUsers()
	{
		var selectedUsers=[];
			
			$("#AssignedUsers > option").each(function(i){
								
			selectedUsers[i]= $(this).val();	
			
			});	
			
			var UserIdList=selectedUsers.join(",");
			
			$.ajax({
				
				type:"POST",
				url:"./ReportInterfaceActionPage.cfc?method=InsertNewUsers",
				data:({
					Report_Id:RecordIds,
					get_selected_users:UserIdList
				}),
				
				dataType:"JSON",
				success: function(resultObj){
					
					alert("Data successfully saved");
				}
				
			});		
			
	}

</script>					 
</head>
<body bgcolor="lightgray">
<cfform id="ReportForm" method="Post" >	
<div id="MainDiv">
        <table id="ReportGrid" class="dataTable" width="100%">
       	<thead align="middle">           
		    <tr>
               <!--- <th>Report Id</th>--->
                <th>Report Name</th>
				<!---<th>URL</th>--->
				<th>Report Description</th>
				<th>Category</th>
				<cfif #session.role_id# eq 25> <th>User Access</th></cfif>
				<th>Action</th>
            </tr>
		</thead>
		<tbody align="center">
            <cfoutput query="GetReport">
              <tr>
                <!---<td>#Report_Id#</td>--->
                <td width="20%"><a href=#URL# target="_blank">#Report_Name#</a></td>
				<!---<td width="20%"><a href=#URL# target="_blank" >#wrap(URL,20)#</a></td>--->
				<td width="30%">#Report_Desc#</td>
				<td width="15%">#Description#</td>
			<cfquery name="GetUser" datasource=#request.dsn# >
				  SELECT fname as name
				  FROM dbo.Report_Access 
				  join First_Admin on First_Admin.ID =Report_Access.User_Id where Report_Id=#Report_Id# 
			</cfquery>			
			
			<cfif #session.role_id# eq 25>
				<cfif Getuser.RecordCount lte 1>
						<td width="10%">#GetUser.name#</td>
				<cfelse>				
						<td width="10%">#GetUser.name#<a onmouseover="AjaxCall('#Report_Id#')" style="color:blue;cursor:hand">>> </a></td>
				</cfif>
			</cfif>			
					<td width="35%"><img id="btn_upd" name="btn_upd" style="cursor:hand" src="../Images/modify_button.gif" onclick="GetSelectedRow('#Report_Id#','#Report_Name#','#URL#','#Report_Desc#','#CategoryId#')" /> <!---<a href="update_form.cfm?Report_Id=#Report_Id#">Update</a>---> 
                    <img id="btn_del" name="btn_del" style="cursor:hand" src="../Images/delete.gif" value="Delete" onclick="ShowDeleteMessage('#Report_Id#')" /><!---<a href="delete_form.cfm?Report_Id=#Report_Id#">Delete</a>---> 
			<cfif #session.role_id# eq 25><img id="btn_AssignUser" name="btn_AssignUser" style="cursor:hand" src="../Images/access_button.gif" value="Assign Users" onclick="ShowUsers('#Report_Id#','#Report_Name#')" /> </cfif></td>
				</tr>
            </cfoutput>              			 
		 </tbody> 
       </table>	
	   <table width="100%">
   		 <tr align="center">
            	<td><img id="btn_add" src="../Images/new_report_button.gif" value="Add a New Record" /></td>               
    	 </tr>		
	  </table>	 
		<!--- THE BELOW DIV WILL BE USED TO INSERT NEW RECORD IN THE REPORT GRID --->	  
		  <div id="InsertRowDiv">		  	
		  	<table id="tblAdd" style="background-color:lightgray" width="500px">		  		 
	           <tr>
	              <td align="right">Report Name <font color="Red">*</font></td>
	                <td> <cfinput type="Text" name="ReportName" id="ReportName"
					required="no" message="Report Name cannot be left blank." size="50"></td>
	            </tr>
				<tr> 
				<td align="right">URL <font color="Red">*</font></td>
	                <td> <cfinput type="Text" name="AddURL" id="AddURL" required="no" message="URL cannot be left blank." size="50"></td>
	            </tr>
				<tr>
				<td align="right">Report Description</td>
	                <td> <cfinput type="Text" name="ReportDesc" id="ReportDesc" size="50" maxlength="50"></td>
	            </tr>
				<tr>
				<td  align="right">Select Category <font color="Red">*</font></td>
				<cfquery name="GetCategories" datasource="#request.dsn#" >
					SELECT ID,DESCRIPTION FROM CATEGORIES ORDER BY ID					
				</cfquery>
	                <td colspan="2" style="color:blue;">
	                	<cfselect id="lstCategoriesadd" name="lstCategoriesadd" >
	                		<cfoutput query="GetCategories" >
								<option style="color:blue;" value=#ID#>#Description# </option>
							</cfoutput>
								<option  style="color:blue;" value="0">Add New Category</option>
	                	</cfselect>	
						<cfinput name="AddCategory"	id="AddCategory" type="text" tooltip="Add a New Category" />
				    </td>			    
	              </tr>				
				 <tr>
			 		<td colspan="3"><img name="addbtn" style="cursor:hand" src="../Images/button_submit.gif" value = "Add" onclick="SaveInsert()" />&nbsp;&nbsp;&nbsp;&nbsp;<img name="btncloseadd" value = "close" style="cursor:hand" src="../Images/button_close.gif"  /><font color='black'>&nbsp;&nbsp;Fields marked as '*' are required</font></td>
	            </tr>	            
	          </table>			  
		  </div>
	 	<!--- THE BELOW DIV WILL BE USED TO UPDATE SELECTED RECORD IN THE REPORT GRID --->
	 	 <div id="UpdateRowDiv">
	  		<table id="tblUpd" style="background-color:lightgray" width="500px">				 		
	  			<tr>
	                <!---<td>Report ID: </td> 
	                <td><label id="ReportId"></label>---><cfinput type="hidden" name="hdnReport_Id">
						<cfinput type="hidden" id="hdnRpt_id" name="hdnRpt_id" />
						<cfinput type="hidden" id="hdnRpt_name" name="hdnRpt_name" />
						<cfinput type="hidden" id="hdnRpt_url" name="hdnRpt_url" />
						<cfinput type="hidden" id="hdnRpt_desc" name="hdnRpt_desc" />					
					</td>
				</tr>
				<tr>
	                <td>Report Name <font color="Red">*</font></td>
	                <td><cfinput name="Report_Name" id="Report_Name" type="text" size="50" 
					required="no" message="Report Name cannot be left blank." ></cfinput></td>
				</tr>
							
				<tr>
					<td>URL <font color="Red">*</font></td>
	                <td><cfinput type="Text" name="URL" id="URL"
					required="no" message="URL cannot be left blank." size="50"></cfinput></td>
	            </tr> 
				
				<tr>
					<td>Report Description</td>
	                <td> <cfinput type="Text" name="Report_Desc" id="Report_Desc" size="50" maxlength="50"></cfinput></td>
	            </tr>
				<tr>
				<td align="right">Select Category <font color="Red">*</font></td>
				<cfquery name="GetCategories" datasource="#request.dsn#" >
					SELECT ID,DESCRIPTION FROM CATEGORIES ORDER BY ID					
				</cfquery>
	               		 <td colspan="2" style="color:blue;">
		                	<cfselect id="lstCategoriesupd" name="lstCategoriesupd" >
		                		<cfoutput query="GetCategories" >
									<option  style="color:blue;" value=#ID#>#Description# </option>
								</cfoutput>						
		                	</cfselect>			                					                		
				   		 </td>
				    	<td>				    	
				    </td>
	           	 </tr>		 
				<tr>
	                <td>&nbsp;</td>
	                <td><img name="updbtn" style="cursor:hand" value = "Update" src="../Images/button_update.gif" onclick="SaveUpdate()" />&nbsp;&nbsp;&nbsp;&nbsp;<img name="btncloseupdate" style="cursor:hand" value = "close" src="../Images/button_close.gif" onclick="closeform()" ></img><font style="font-family:Arial;" color='black'>&nbsp;&nbsp; Fields marked as '*' are required</font></td>
				</tr>	        
		  </table>
	  </div>
   		<!--- THE BELOW CONDITION WILL DECIDE WHETHER TO SHOW THE DIV FOR ASSIGNING THE USERS --->
		<!---<cfif StructKeyExists(URL,'action') AND #action# eq 'assign'> --->  
	   		 <div id="AssignUsersDiv" align="center">	   		 		  				
				<table id="tblAssignUsers" cellpadding="0" cellspacing="20">
					<tr>
						<!--- <cfquery name="GetName" datasource=#request.dsn# >
						 	 SELECT Report_Name from REPORT_MASTER WHERE Report_Id=<cfqueryparam  cfsqltype="cf_sql_varchar" value="#Report_ID#" />
						 </cfquery>
						 <cfquery name="GetUsers" datasource=#request.dsn#> 
			    			SELECT ID as uid, cast(fname + ' ' + lname as varchar(50)) as username, position from dbo.FIRST_ADMIN
							WHERE ID NOT IN (SELECT USER_ID FROM DBO.Report_Access WHERE REPORT_ID= <cfqueryparam  cfsqltype="cf_sql_varchar" value="#Report_ID#" />) AND STATUS=1
							ORDER BY UID
						  </cfquery>	
						  <cfquery name="GetAssignedUsers" datasource="#request.dsn#"> 
								SELECT DISTINCT ID as uid, cast(fname + ' ' + lname as varchar(50)) as username, position from dbo.FIRST_ADMIN FA JOIN REPORT_ACCESS RPT_ACCESS
								ON FA.ID = RPT_ACCESS.USER_ID AND RPT_ACCESS.Report_Id= <cfqueryparam  cfsqltype="cf_sql_varchar" value="#Report_ID#" /> ORDER BY FA.ID
							</cfquery>--->
							<!---<cfif #GetUsers.RecordCount# gt 0>--->
							    <td colspan="2"><strong>Assign users to :</strong>
									<div id='ReportNamediv1'><strong><!---<cfoutput query="GetName">#Report_Name#</cfoutput>---></strong></div>							
								</td>
							<!---</cfif>--->
								
							<!---<cfif #GetAssignedUsers.RecordCount# gt 0>--->
								<td><strong>Users Assigned to :</strong>
									<div id='ReportNamediv2'><strong><!---<cfoutput query="GetName">#Report_Name#</cfoutput>---></strong></div>
								</td>
							<!---</cfif>--->
					 	</tr>
					 	<tr>
					 		<!---<cfif #GetUsers.RecordCount# gt 0>--->
								<td align="left" valign="top">
										<cfset optsize=10>									 									 
										<!---<cfselect name="Users" query="GetUsers" style="color:blue" value="uid" display="username" size="#optsize#" multiple="true" onclick="EnableAccessButton()" ></cfselect>--->									
										<select id="Users" style="color:blue;width:180px"  size="10" multiple="true" onclick="EnableAccessButton()" ></select>
								</td>							
						 	<!---</cfif>	--->					
								<td>
									<input  type="button" id="getSelectedValues" width="30px" value=">>"  alt="Select the values" /> <br /><br />
									<input  type="button" id="getDeselectedValues" width="30px" value="<<" alt="Deselect the values" />										
								</td>					 			
							<!---<cfif #GetAssignedUsers.RecordCount# gt 0>--->						
							<td align="left" valign="top">															
									<cfset optsize=10> 							
									<!---<cfselect name="AssignedUsers"  query="GetAssignedUsers"  style="color:blue;width:180px" value="uid" display="username" size="#optsize#" multiple="true" onclick="EnableDeleteButton()" ></cfselect>--->						 		
									<select id="AssignedUsers" style="color:blue;width:180px"  size="10" multiple="true" onclick="EnableDeleteButton()" ></select>
							 </td>					
						<!---</cfif>--->
						</tr>					 
					<tr>
						<!---<cfif #GetUsers.RecordCount# gt 0>--->
							<td align="right" colspan="2"><img id="AssignUsers"  src="../Images/access_button.gif" value="Assign"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
						<!---</cfif>--->
						<!---<cfif #GetAssignedUsers.RecordCount# gt 0>
							<td align="left"><input name="RemoveUsers" id="RemoveUsers"  src="../Images/delete.gif" value="Remove" type="image" ></input>&nbsp;&nbsp;
						</cfif>--->
								<img name="CancelRemove" style="cursor:hand" value="cancel" src="../Images/button_close.gif" onclick="CloseDialog()"></input>
						</td>
						<td><div id="message" align="top">
								<!---<strong>Loading.... Please Wait.</strong>--->
								<img src="./images/ajax-loader.gif"></img>
							</div>	
						</td>
					</tr>					
					<tr><td colspan="3" align="center"><span style="color:black"><h10>Note:  Press "ctrl" to select multiple users</h10></span></td></tr>				
				</table>				
	 		 </div>	   	  
		<!---</cfif>--->	   	
 	
	 	<div id="dialog" class="web_dialog">
		   		<table id="tbl_list" border: 0px;" cellpadding="3" cellspacing="3">		   
			   		<thead>
			   			<tr class="web_dialog_title align_right">
					         <th>First Name</th>
					         <th>Last Name</th>
						</tr>
			   		</thead>
					<tbody>					
					</tbody>				   
				</table>
		</div>		
	</div>
</cfform>
</body>
</html>
