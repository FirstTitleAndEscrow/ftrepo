<cfparam name="a_trigger" default="0">
<cfparam name="files_uploaded" default="0" >

<CFQUERY name="get" DATASOURCE="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #rec_id#
</CFQUERY>

<cfif Len(get.realec_transactionid)>
<cflocation url="add_blob_realec.cfm?rec_id=#rec_id#">
</cfif>

<html>
<head>
<title>Blob - Choose File</title>
<link rel=stylesheet href="./css/defaults.css">


<style type="text/css">
  		 #results{
      	 padding:5 5 5 5px;
  		 }
    
    	.blue{
        color:blue;        
   		 }
    
    	.red{
        color:red;
  		 }
	</style>
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script language="JavaScript" >		
		
		 //Will be called when the file upload was successful
    	function uploadSuccess(res)
		{
            var newID = Math.floor(Math.random()*1001); //Generate random number
	        //Append our success message to results Div
	       	 $("#results").append('<span class="blue" id="id_' + newID + '">Uploaded File : ' + res.FILENAME + '</span> <br/>');
	        //Hide the appended message then fade it in 
	        $("#id_" + newID).hide().fadeIn();
		
		}
    
	    function uploadError(res){
	        var newID = Math.floor(Math.random()*101);
	        $("#results").append('<span class="red" id="id_' + newID + '">Error Uploading File : ' + res.FILENAME + '</span> <br/>');
	        $("#id_" + newID).hide().fadeIn();    
	    }
		
		 function allDone(){        
	        /*
ColdFusion.MessageBox.show('finalmsg');	
*/			
	    } 
		
	
	/*
function GetURLParameter(sParam)  

 	{  

	   var sPageURL = window.location.search.substring(1);  
	
	    var sURLVariables = sPageURL.split('&');  
	
	    for (var i = 0; i < sURLVariables.length; i++)   
	     {  
	         var sParameterName = sURLVariables[i].split('=');  
	         if (sParameterName[0] == sParam)   
	         {  
             return sParameterName[1];  
       		}  
   		 }  
}?     	    	
*/
		
</script>

</head>
<body>
<center>
<table cellspacing="5">
<tr>
<td align="center">
	Please select the file you would like <br /> to upload and add to the database.
</td>
</tr>
</table>

<cfform name="MultiFileUpload">
<div align="center">
	
<table cellspacing="5">
<!--- <tr>
<td align="center">
	Please select the file you would like <br /> to upload and add to the database:
</td>
</tr> --->
<tr>
<td style="margin:100px" align="center">
			
		<cffileupload align="center" name="MultiFileupload" addbuttonlabel="Add File" uploadbuttonlabel="Upload the files" url="https://machine1.firsttitleservices.com/admin_area/UploadFile.cfm?rec_id=#url.rec_id#&Files=Multiple" 
					 onComplete="uploadSuccess" onError="uploadError" onUploadComplete="allDone" maxUploadSize="40">
</td>
</tr>
</table>

<cfif #a_trigger# eq 2>
<table>
<tr>
<td align="center" colspan="2">
Thank you, file uploaded successfully<br>
<br>
<cfif form.file_upload neq FILE.ServerFile>
<cfoutput><font color="red">There is already a file by that name uploaded on our server. To avoid overwriting existing files, tyur upload has been renamed to "#new_file_name#"</font></cfoutput><br>
<br>

</td></tr></cfif>
</cfif>
</table>
<div id="results" align="bottom">       			
</div>
<table>
<!--- <tr>
<cfoutput>
<td>
&nbsp;&nbsp;<a href="./blob_list.cfm?rec_id=#url.rec_id#">[View existing files]</a>
</td>
</cfoutput>
</tr> --->
</table>	
</div>
</cfform>
<table<tr><td>&nbsp;&nbsp;<a href="./blob_list.cfm?rec_id=<cfoutput>#url.rec_id#</cfoutput>">[View existing files]</a>
</td>
</table>
</center>
</body>
</html>