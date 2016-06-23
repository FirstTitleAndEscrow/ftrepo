    <CFPARAM NAME="proc_name" DEFAULT="">
    <CFPARAM NAME="preproc_name" DEFAULT="">
    <CFSET variables.uploadFileDestination = "c:\uploads\">
  
    <CFFILE 			
	    DESTINATION="#variables.uploadFileDestination#"
		ACTION="UPLOAD"
		NAMECONFLICT="MAKEUNIQUE"
		FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>
        
        <CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			 
		<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
		    update title set reo_signed_Deed = '#new_file_name#',
			reo_signed_Deed_date = '#order_date_adj#'
			WHERE title_id = #rec_ID#
		</cfquery> 
			
		<CFQUERY datasource="#request.dsn#" NAME="read_user">
		    select * from first_admin

			WHERE ID = #session.ft_user_id#
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#">		
		    INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
			VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'REO Signed Deed uploaded and ready for viewing', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>
			
		<CFQUERY datasource="#request.dsn#" NAME="get_order">		
		    SELECT *
			FROM Title
			Where title_id = #URL.rec_id#
		</CFQUERY>
			
        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
        <CFSET datnow = "#DateFormat(Now())#">
        <CFSET timnow = "#TimeFormat(Now())#">


<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>

<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3>
		
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
		<B>1st Title & Escrow, Inc. - REO Signed Deed File Upload Complete for order <cfoutput>#rec_id#</cfoutput></B>
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