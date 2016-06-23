<!--- <cfset objChase = CreateObject('component','cfc.chaseRealEC')> --->
        <CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Pay_Off_Lender_1_Title set payoff1_upload = '#new_file_name#'
			WHERE title_id = #rec_ID#
			</cfquery> 
			
			<CFQUERY datasource="#request.dsn#" NAME="get_title">
			Select * from Title where title_id = #rec_id#
			</cfquery> 
			
<cfif get_title.p_email neq '' and get_title.o_email neq ''>
<cfmail to="#get_title.p_email#; #get_title.o_email#" from="webmaster@firsttitleservices.com" subject="Payoff for Order ###rec_id# has been received" mimeattach="#fileSys.FindFilePath('#new_file_name#', 'file')#">
Payoff for Order ###rec_id# has been received.<br>
<br>

-First Title Services<br>		
</cfmail>
</cfif>
			
<!--- <cfif Len(get_title.realec_transactionid)>
<cfset documentInfo = StructNew()>
<cfset documentInfo.document = "#FILE.ServerFile#">
<cfset documentInfo.documentversion = "1">
<cfset documentInfo.documentStatus = "DRAFT">
<cfset documentInfo.documentType = "PAYOFF">
<cfset documentInfo.documentPath = "c:\uploads\">
<cfset objChase.processEvent(eventCode=726, productCode=29, title_id=#get_title.title_id#,documentInfo=documentInfo)>
</cfif> --->			
			
			
            <CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<CFQUERY datasource="#request.dsn#">	
			UPDATE Pay_Off_Lender_1_Title
			SET
			a_Recieved_by = #uid#,
			p_dateandtime = '#order_date_adj#',
			a_recieved_Date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_recieved_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE title_ID = #rec_ID#	
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

<table width=455 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=455 align=center valign=top bgcolor=d3d3d3>
		
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