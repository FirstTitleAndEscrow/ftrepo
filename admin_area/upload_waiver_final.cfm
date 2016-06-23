<cfset add_note = 0>


			<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update doc_closer_title set 
			waiver = '#new_file_name#',
			waiver_date = '#DateFormat(Now())#',
			waiver_time = '#TimeFormat(Now())#'
			WHERE title_id = #rec_ID#
			</cfquery> 
			<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			select * from first_admin

			WHERE ID = #session.ft_user_id#
		
		</CFQUERY>
 		<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Waiver uploaded and ready for viewing', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
			select * from first_admin
			WHERE id = #url.uID#
			</cfquery>
			<CFQUERY datasource="#request.dsn#" NAME="read_title">
			select * from title
			WHERE title_id = #rec_ID#
			</cfquery> 
			
<CFQUERY datasource="#request.dsn#" NAME="read_comp_id">
	SELECT team_id from companies where id = #read_title.comp_id#
</CFQUERY>
<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_comp_id.team_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>

<cfif read_title.p_email eq '' or read_title.p_email eq 'NULL'>
<cfset add_note = 1>
<cfset read_title.p_email = 'rjermain@firsttitleservices.com'>
</cfif>

	<cfif #read_title.comp_id# neq "115">
	
<CFMAIL
TO="#read_title.p_email#"
FROM="#read_user.email#"
SERVER="127.0.0.1"
Subject="First Title & Escrow - Waiver uploaded for #read_title.title_id#-#read_title.bfirstname1# #read_title.blastname1#<cfif #read_title.loan_number# neq "">, Loan No. - #read_title.loan_number#</cfif>"
TIMEOUT="600"
>		
Waiver has been uploaded to our website for order #read_title.title_id#-#read_title.bfirstname1# #read_title.blastname1#

First Title staff
<cfif add_note eq 1>


(no loan processor email address is set on this file)
</cfif>

</cfmail>
</cfif>

<!--- <cfif #email# neq ""> 
<CFQUERY datasource="#request.dsn#" NAME="get_file">
			select waiver from doc_closer_title
			WHERE title_id = #rec_ID#
</cfquery> 
<CFMAIL
TO="#email#"
FROM="#team_email#"
Subject="First Title Waiver for order #rec_id#<cfif #read_title.loan_number# neq "">, Loan No. - #read_title.loan_number#</cfif>"
type="HTML"
TIMEOUT="600"
>

To view/print the Waiver for order #rec_id# click <A HREF="#fileSys.FindFilePath('#get_file.waiver#', 'url')#" target="new">#get_file.waiver#</a><br><br>
Thank you<br>
First Title staff

</cfmail>
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
		<B>1st Title & Escrow, Inc. - Waiver Upload Complete for order <cfoutput>#rec_id#</cfoutput></B>
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