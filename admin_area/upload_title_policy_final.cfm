<cfset objChase = CreateObject('component','cfc.chaseRealEC')>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
select * from title
WHERE title_id = #rec_ID#
</cfquery>


			<CFFILE
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

			 <CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
			update eventlist set
			titlepol = '#new_file_name#'
			WHERE title_id = #rec_ID#
			</cfquery>
			<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">

			select * from first_admin

			WHERE ID = #session.ft_user_id#

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Title Policy completed and Imaged to System', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
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
<cfset documentInfo.documentversion = "1">
<cfset documentInfo.documentStatus = "FINAL">
<cfset documentInfo.documentType = "FPOL">
<cfset documentInfo.documentPath = "#ReplaceNoCase(fileSys.FindFilePath('#new_file_name#', 'file'), '#new_file_name#', '', 'ALL')#">
<cfset documentInfo.documentDesc = "Title Policy">
<cfset objChase.processEvent(eventCode=780, documentInfo=documentInfo, productCode=3, title_id=#read_title.title_id#)>
</cfif>
<!--- RealEC --->



<cfif #read_title.loan_number# neq "">
<cfset loannum_info = ", Loan No. - " & read_title.loan_number & "">
<cfelse>
<cfset loannum_info = " ">
</cfif>

<cfif read_title.logstransactionid neq '' and read_title.logstransactionid neq 'NULL'>
<cfinvoke	component = "cfc.LOGS"	method = "sendTitlePolicy" order_ID="#read_title.title_id#" filename="#new_file_name#">
</cfif>


	<!--- <CFMAIL
TO="#read_title.p_email#"
FROM="#read_user.email#"
SERVER="127.0.0.1"
Subject="First Title & Escrow - Title Policy uploaded for #read_title.title_id#-#read_title.bfirstname1# #read_title.blastname1##loannum_info#"
TIMEOUT="600"
>
Title Policy has been uploaded to our website for order #read_title.title_id#-#read_title.bfirstname1# #read_title.blastname1#

First Title staff

</cfmail> --->

<cfif #email# neq "">
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_file">
			select titlepol from eventlist
			WHERE title_id = #rec_ID#
</cfquery>
<!--- <CFMAIL
TO="#email#"
FROM="policies@firsttitleservices.com" Subject="First Title & Escrow - Title Policy file for order #rec_id#<cfif #read_title.loan_number# neq "">, Loan No. - #read_title.loan_number#</cfif>"
type="HTML"
TIMEOUT="600"
>

To view/print Title Policy for order #rec_id# click <A HREF="#fileSys.FindFilePath('#get_file.titlepol#', 'url')#" target="new">#get_file.titlepol#</a><br><br>
Thank you<br>
First Title staff

</cfmail> --->
</cfif>

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
		<B>1st Title & Escrow, Inc. - Title Policy File Upload Complete for order <cfoutput>#rec_id#</cfoutput></B>
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