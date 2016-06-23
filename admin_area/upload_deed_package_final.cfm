<!--- <cfset objChase = CreateObject('component','cfc.chaseRealEC')> --->


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
		    update doc_closer_title set deed_package = '#new_file_name#'			
			WHERE title_id = #rec_ID#
		</cfquery> 
			
		<CFQUERY datasource="#request.dsn#" NAME="read_user">
		    select * from first_admin

			WHERE ID = #session.ft_user_id#
		</CFQUERY>
		
		
		
		
		<CFQUERY datasource="#request.dsn#">		
		    INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
			VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Deed Package uploaded and ready for viewing', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>
			
		<CFQUERY datasource="#request.dsn#" NAME="get_order">		
		    SELECT *
			FROM Title
			Where Title_Id = #URL.rec_id#
		</CFQUERY>



<!--- <cfif get_order.realEC_TransactionID neq '' and get_order.realEC_TransactionID neq 'NULL'>
<cfset documentInfo = StructNew()>
<cfset documentInfo.document = "#FILE.ServerFile#">
<cfset documentInfo.documentversion = "1">
<cfset documentInfo.documentStatus = "DRAFT">
<cfset documentInfo.documentType = "CLSINST">
<cfset documentInfo.documentPath = "c:\uploads\">
<cfset objChase.processEvent(eventCode=406, productCode=29, title_id=#get_order.title_id#,documentInfo=documentInfo,comment=form.comment)>
</cfif> --->


			
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
		<B>1st Title & Escrow, Inc. - Deed Package File Upload Complete for order <cfoutput>#rec_id#</cfoutput></B>
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