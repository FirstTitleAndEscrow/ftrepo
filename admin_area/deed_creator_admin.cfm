<!--- 
	This tool doesn't delete any files.  they're either left 
unattached to a deed_id or overwritten if named the same 
	To add the ability to delete files (should be done; time allowing)
you'll have to change the upload process to strip bad characters (blanks mostly)
from the file names.  then you can add cffile delete tags.
--->
<cfoutput>
<HTML>
<HEAD>
<title>Deed Creator Admin</title>
<style type="text/css">
	form { margin:0; padding:0 }
</style>
</head>
<BODY>
<h2><a href="deed_creator_admin.cfm">Deed Creator Admin</a></h2>

<cfif NOT IsDefined('url.action')>
	
	<cfquery datasource="#request.dsn#" name="getdeeds">
		SELECT deed_id, deed_filename, deed_title
		FROM deed
		ORDER BY deed_title
	</cfquery>
	<h3>Add Deed</h3>	
	<a href="deed_creator_admin.cfm?action=add">Add a new deed</a>
	<h3>Manage Deeds</h3>
	<cfif IsDefined('url.insert_success')>
		<cfif url.insert_success>
			<span style="color:green;">New Deed Addition SUCCESS @ #Now()#</span> <br />
		<cfelse>
			<span style="color:red;">New Deed Addition FAILED @ #Now()#</span> <br />
		</cfif>
	</cfif>
	<cfif IsDefined('url.delete_deed_success')>		
		<span style="color:green;">Deed Deleted Successfully @ #Now()#</span> <br />	
	</cfif>
	<a href="deed_creator_fieldlist.cfm" target="_blank">Deed Creator Field List</a> (opens in a new window)
	<br><br>
	<table border="1">
		<tr>
			<th>Admin Actions</th>
			<th>Deed Title</th>
			<th>File Name</th>
			<th>View Actions</th>		
		</tr>
	<cfloop query="getdeeds">
		<tr>
			<td>
				
				<form name="deed_creator_admin_#getdeeds.deed_id#" action="deed_creator_action.cfm" method="post">								
					<input type="hidden" name="deed_id" value="#getdeeds.deed_id#">
					
					<input type="button" name="upload_original" value="Edit" onClick="parent.location='deed_creator_admin.cfm?action=edit&deed_id=#getdeeds.deed_id#'">
					<input type="button" name="delete_deed" value="Delete" onclick="javascript:if(confirm('WHAT THE FUCK!?\nAre you sure you want to delete this deed?\nSeriously, it will be gone like forever and stuff.')){ parent.location='deed_creator_admin.cfm?action=delete&deed_id=#getdeeds.deed_id#'; }">
					
			</td>
			<td>#getdeeds.deed_title# </td>
			<td>#getdeeds.deed_filename# </td>
			<td>
			<input type="submit" name="dl_original" value="Download">
				</form>
			</td>
		</tr>
	</cfloop>
	</table>

<cfelse>

	<cfswitch expression="#url.action#">	
		
		<cfcase value="add">
			<h3>Add Deed</h3>			
			This form adds a new deed to the system.  
			<br><br>
			You'll have to specify a title (that the deed will show up as in the Deed Creator Deed dropdown)
			and upload a file for automerging.
			<br><br>
			 The file must be Rich Text Format(RTF) format, which is editable in MS Word and other word processing software.
			<br>
			For a list of the auto-merge fields that correspond to the fields in the Deed Creator form, 
			<a href="deed_creator_fieldlist.cfm" target="_blank">click here</a> (opens in a new window).
			<br><Br>
			<cfform enctype="multipart/form-data" name="add_deed" action="deed_creator_admin.cfm?action=insert" method="post">
				Deed Title: <cfinput type="text" size="50" required="yes" name="deed_title"> <br />
				Deed File: <input type="file" accept="application/rtf" name="fileUpload" /> <br />
				<input type="submit" name="add_deed" value="Add New Deed" />				
			</cfform>	
		</cfcase>
		
		<cfcase value="edit">
			<cfparam name="url.deed_id" type="numeric">
			<cfquery datasource="#request.dsn#" name="getdeed">
				SELECT deed_id, deed_filename, deed_title
				FROM deed
				WHERE deed_id = #url.deed_id#
			</cfquery>
			<h3>Edit Deed</h3>	
			<strong>Deed ID: </strong>#getdeed.deed_id# <br />
			<strong>Deed Title:</strong> #getdeed.deed_title# <br />
			<strong>Deed File: </strong>#getdeed.deed_filename# <br />
			<hr>
			<h4>Form 1 : Update Deed Title</h4>	
			This form changes the name that the deed will show up as in the Deed Creator Deed dropdown.
			<br><br>
			<cfform name="update_name" action="deed_creator_admin.cfm?action=update_name" method="post">
				<input type="hidden" name="deed_id" value="#getdeed.deed_id#">
				Deed Title: <cfinput size="50" type="text" required="yes" name="deed_title" value="#getdeed.deed_title#"> <br />
				<input type="submit" name="change_name" value="Update Deed Title" /> 
				<cfif IsDefined('url.update_name_success')>
					<br /> <span style="color:green;">Deed Title Updated @ #Now()#</span>
				</cfif>				
			</cfform>			
			<hr>	
			<h4>Form 2 : Update Deed File</h4>	
			This form changes the file that will be used when the above Deed Title is chosen in Deed Creator.
			<br>			
			You can't actually edit the file on the web, you must download it (or use a copy you already have), make your
			changes and then upload the file with this form. The file must be Rich Text Format(RTF) format, which is editable
			in MS Word and other word processing software.  
			<br>
			For a list of the auto-merge fields that correspond to the fields in the Deed Creator form, 
			<a href="deed_creator_fieldlist.cfm" target="_blank">click here</a> (opens in a new window).
			<br><br>
			<form name="deed_creator_admin_#getdeed.deed_id#" action="deed_creator_action.cfm" method="post">								
					<input type="hidden" name="deed_id" value="#getdeed.deed_id#">					
					Current Deed File: <span style="color:blue;">#getdeed.deed_filename#</span>
					<input type="submit" name="dl_original" value="Download">
				</form>
			<cfform enctype="multipart/form-data" name="update_file" action="deed_creator_admin.cfm?action=update_file" method="post">
				<input type="hidden" name="deed_id" value="#getdeed.deed_id#">						
				New Deed File: <input type="file" accept="application/rtf" name="fileUpload" /> <br />
				<input type="submit" name="add_deed" value="Update Deed File" />
			</cfform>	
			<hr>
		</cfcase>
		
		<cfcase value="insert">
			<cfparam name="form.deed_title">
			<cfparam name="form.fileUpload">			
			<CFSET attachfile = ''>
			<CFSET localpath = GetDirectoryFromPath(GetCurrentTemplatePath()) & "deeds">
			
			<CFIF FindNoCase('Mac','#CGI.HTTP_USER_AGENT#') GT 0 AND FindNoCase('MSIE','#CGI.HTTP_USER_AGENT#')>
			  <CFTRY>
				<CFFILE ACTION="ReadBinary" 
				  FILE="#form.fileUpload#" 
				  VARIABLE="aBinaryObj">
				<CFCATCH TYPE="Any"><CFSET aBinaryObj = 'abc'></CFCATCH>
			  </CFTRY>
			<CFELSE>
			  <CFSET aBinaryObj = 'abc'>
			</CFIF>
			
			<CFIF len(aBinaryObj) gt 2 AND Len(Trim(FORM.fileUpload)) GT 0>			 
			 	<cftry>
					 <CFFILE ACTION="UPLOAD"
							FILEFIELD="fileUpload"
							DESTINATION="#localpath#"
							NAMECONFLICT="overwrite">
				
					<CFSET attachfile = File.ServerFile>					
					<cfcatch type="any">
						<cflocation url="deed_creator_admin.cfm?insert_success=false" addtoken="no">
					</cfcatch>
				</cftry>	
			<cfelse>		 
			 	<cflocation url="deed_creator_admin.cfm?insert_success=false" addtoken="no">
			</CFIF>
			
			<cfquery datasource="#request.dsn#" name="getdeed">
				INSERT INTO deed (deed_title, deed_filename) 
				VALUES ('#form.deed_title#','#attachfile#');			
			</cfquery>
			<cflocation url="deed_creator_admin.cfm?insert_success=true" addtoken="no">			
		</cfcase>
		
		<cfcase value="update_name">
			<cfparam name="form.deed_id" type="numeric">
			<cfparam name="form.deed_title">
			<cfquery datasource="#request.dsn#" name="getdeed">
				UPDATE deed SET
				deed_title = '#form.deed_title#'				
				WHERE deed_id = #form.deed_id#;
			</cfquery>
			<cflocation url="deed_creator_admin.cfm?action=edit&deed_id=#form.deed_id#&update_name_success=true" addtoken="no">
		</cfcase>
		
		<cfcase value="update_file">
			<cfparam name="form.deed_id" type="numeric">
			<cfparam name="form.fileUpload">			
			<CFSET attachfile = ''>
			<CFSET localpath = GetDirectoryFromPath(GetCurrentTemplatePath()) & "deeds">
			
			<CFIF FindNoCase('Mac','#CGI.HTTP_USER_AGENT#') GT 0 AND FindNoCase('MSIE','#CGI.HTTP_USER_AGENT#')>
			  <CFTRY>
				<CFFILE ACTION="ReadBinary" 
				  FILE="#form.fileUpload#" 
				  VARIABLE="aBinaryObj">
				<CFCATCH TYPE="Any"><CFSET aBinaryObj = 'abc'></CFCATCH>
			  </CFTRY>
			<CFELSE>
			  <CFSET aBinaryObj = 'abc'>
			</CFIF>
			
			<CFIF len(aBinaryObj) gt 2 AND Len(Trim(FORM.fileUpload)) GT 0>			 
			 	<cftry>
					 <CFFILE ACTION="UPLOAD"
							FILEFIELD="fileUpload"
							DESTINATION="#localpath#"
							NAMECONFLICT="overwrite">
				
					<CFSET attachfile = File.ServerFile>					
					<cfcatch type="any">
						<cflocation url="deed_creator_admin.cfm?action=edit&deed_id=#form.deed_id#&update_file_success=false" addtoken="no">
					</cfcatch>
				</cftry>	
			<cfelse>		 
			 	<cflocation url="deed_creator_admin.cfm?action=edit&deed_id=#form.deed_id#&update_file_success=false" addtoken="no">
			</CFIF>
			
			<cfquery datasource="#request.dsn#" name="getdeed">
				UPDATE deed SET
				deed_filename = '#attachfile#'
				WHERE deed_id = #form.deed_id#;			
			</cfquery>
			<cflocation url="deed_creator_admin.cfm?action=edit&deed_id=#form.deed_id#&update_file_success=true" addtoken="no">
		</cfcase>
		
		<cfcase value="delete">
			<cfparam name="url.deed_id" type="numeric">
			<cfquery datasource="#request.dsn#" name="getdeed">
				DELETE FROM deed 
				WHERE deed_id = #url.deed_id#;			
			</cfquery>
			<cflocation url="deed_creator_admin.cfm?delete_deed_success=true" addtoken="no">
		</cfcase>
		
		<cfdefaultcase>
			<cflocation url="deed_creator_admin.cfm" addtoken="no">
		</cfdefaultcase>
	</cfswitch>

</cfif>

</body>
</html>
</cfoutput>