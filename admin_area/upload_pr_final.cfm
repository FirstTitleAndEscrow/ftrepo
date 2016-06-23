<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
 

			<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update policy_recovery
			set policy_recovery_upload = '#new_file_name#',
			upload_date = '#datnow#',
			upload_time = '#timnow#'
			WHERE pr_id = #rec_ID#
			</cfquery> 
			<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			select * from first_admin

			WHERE ID = #session.ft_user_id#
		
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Policy Recovery uploaded', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'PR', '1', '1')		
		</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="get_order">		
				SELECT *
				FROM Policy_Recovery
				Where pr_Id = #URL.rec_id#
			</CFQUERY>
<cfif #email# neq ""> 
<CFQUERY datasource="#request.dsn#" NAME="get_file">
			SELECT policy_recovery_upload
				FROM Policy_Recovery
				Where pr_Id = #URL.rec_id#
</cfquery> 
<CFMAIL
TO="#email#"
FROM="#read_user.email#"
SERVER="127.0.0.1"
Subject="First Title Policy Recovery file for order PR-#rec_id#<cfif #get_order.loan_number# neq "">, Loan No. - #get_order.loan_number#</cfif>"
type="HTML"
TIMEOUT="600"
>

To view/print Policy Recovery for order PR-#rec_id# click <A HREF="#fileSys.FindFilePath('#get_file.policy_recovery_upload#', 'url')#" target="new">#get_file.policy_recovery_upload#</a><br><br>
Thank you<br>
First Title staff

</cfmail>

		<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Policy delivered to Client', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'PR', '1', '1')		
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_file">
			update Policy_Recovery
			set appraisal_status = 'File Complete'
				Where pr_Id = #URL.rec_id#
</cfquery> 
</cfif>

<cflocation url="title_report_modify_pr.cfm?uid=#session.ft_user_id#&al=#al#&rec_id=#rec_id#&a_trigger=0&company_id=#company_id#">
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
		
			<CFINCLUDE TEMPLATE="./includes/title_top_nav_pr.cfm">
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
		<B>1st Title & Escrow, Inc. - Policy Recovery File Upload Complete for order <cfoutput>PR-#rec_id#</cfoutput></B>
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