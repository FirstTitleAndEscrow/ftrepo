<cfset objChase = CreateObject('component','cfc.chaseRealEC')>


			<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			 <CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
			update doc_closer_title set
			pre_HUD = '#new_file_name#',
			preHUD_upload_date = '#order_date_adj#'
			WHERE title_id = #rec_ID#
			</cfquery>
			<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">

			select * from first_admin

			WHERE ID = #session.ft_user_id#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="isFlagstar">
			select t.title_id
			from title t
			inner join companies c on c.id = t.comp_id
			where c.company LIKE '%Flagstar%'
		</cfquery>

		<cfif isFlagstar.recordcount>
			<CFQUERY DATASOURCE="#request.dsn#">
				Update title
				set flagstar_hud_completed  = #CreateODBCDateTime(Now())#
				where title_id = #rec_id#
			</CFQUERY>
		</cfif>

		<CFQUERY DATASOURCE="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Pre HUD uploaded and ready for viewing', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
			select * from first_admin
			WHERE id = #url.uID#
			</cfquery>
			<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			select * from title
			WHERE title_id = #rec_ID#
			</cfquery>

<!--- RealEC --->




<cfif Len(read_title.realec_transactionid)>

<cfset documentInfo = StructNew()>
<cfset documentInfo.document = "#new_file_name#">
<cfset documentInfo.documentversion = "1.0">

<cfset documentInfo.documentStatus = "DRAFT">
<cfset documentInfo.documentDesc = "Pre HUD">
<cfset documentInfo.documentType = "HUD1">
<cfset documentInfo.documentPath = "#ReplaceNoCase(fileSys.FindFilePath('#new_file_name#', 'file'), '#new_file_name#', '', 'ALL')#">
<cfset objChase.addTurnTimeEvent(title_id=url.rec_id,event_type="marker",event_description="pre_hud_sent")>
<cfset objChase.processEvent(eventCode=406, productCode=29, title_id=#read_title.title_id#,documentInfo=documentInfo, comment=form.comment)>
</cfif>
<!--- RealEC --->


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_comp_id">
	SELECT team_id from companies where id = #read_title.comp_id#
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
		<B>1st Title & Escrow, Inc. - Pre HUD File Upload Complete for order <cfoutput>#rec_id#</cfoutput></B>
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