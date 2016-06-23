  

			<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Doc_Abstract_Title set abstractor_doc_upload6 = '#new_file_name#'
			WHERE title_id = #rec_ID#
			</cfquery> 

<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
			UPDATE Doc_Abstract_Title
			set
			a_Recieved_by = #uid#,
			a_Date_Completed = '#DateFormat(Now(), "mm/dd/yyyy")#',
			r_dateandtime = '#order_date_adj#',
			a_Time_Completed = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE title_ID = #rec_ID#
		</CFQUERY>
		
<CFQUERY datasource="#request.dsn#" NAME="read_title">
Select * from Title
WHERE title_ID = #rec_ID#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_company">
Select * from companies
WHERE ID = #read_title.comp_ID#
</CFQUERY>

<!--- even if the file has been sent, this will set it back to unsent if a new update is uploaded --->
		<CFQUERY datasource="#request.dsn#" NAME="check_record">
			Select * from Doc_Title_Insurance_Title
			where title_id = #rec_id#
		</CFQUERY>
		<cfif check_record.recordcount eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="insert_record">
			insert into  Doc_Title_Insurance_Title (title_id)
			values (#rec_id#)
		</CFQUERY>
		</cfif>
			<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Doc_Title_Insurance_Title set a_recieved_date = NULL
			WHERE title_id = #rec_ID#
			</cfquery> 
		<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
			UPDATE Title
			set
			appraisal_status = 'In Typing'
			WHERE title_ID = #rec_ID#		
		</CFQUERY>
<!--- end even if the file has been sent, this will set it back to unsent if a new update is uploaded --->



<!--- <cfif read_company.streamline_client eq 'True'>	
<cfmail to="title_delivery@streamline-title.com" from="webmaster@firsttitleservices.com" subject="Updated Abstract Uploaded for Order ST-#rec_id#">
An updated Abstract has been uploaded into Slot 2 for Order ST-###rec_id#
</cfmail>
<cfelse>
<cfmail to="title_delivery@firsttitleservices.com" from="webmaster@firsttitleservices.com" subject="Updated Abstract Uploaded for Order T-#rec_id#">
An updated Abstract has been uploaded into Slot 2 for Order T-###rec_id#
</cfmail>
</cfif>
 --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">




<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>


<table width=455 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=455 align=center valign=top bgcolor=d3d3d3>
		<cfoutput>
		<input type="hidden" name="company_id" value="#url.company_id#"></cfoutput>
			<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
			</td></tr></table>
<table width=455 cellpadding=1 cellspacing=1 border=0>
		
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<img src="images/clear.gif" width=455 height=10 alt="" border="0">
		</td>
		</tr>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=3 align=center color=blue face=arial>
		<B>1st Title & Escrow, Inc. - File Upload Complete</B>
		<p>
		</td>
		</tr>
		
		
		</tr>
		</table>
		
	      

    </td>
  </tr>
</table>
  </td>
  </tr>
</table>
</center>
</BODY>
</HTML>