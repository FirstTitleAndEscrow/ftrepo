<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="a_flag" DEFAULT="0">
<CFPARAM NAME="email" DEFAULT="">

<CFQUERY datasource="#request.dsn#" NAME="read_user">

			SELECT *
			FROM First_Admin
			WHERE id = #URL.uid#


		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_id">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>


<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>



<cfquery name="get_file" datasource="#request.dsn#">
SELECT t.*, e.closing_date, r.contract_busted_date
FROM title t, eventlist e, title_closing_order_request r
WHERE t.title_id = #URL.rec_id#
and e.title_id = t.title_id
and r.title_id = t.title_id
</CFQUERY>

<cfset date_to_use = "test">
<cfif IsDate(get_file.closing_date) and IsDate(get_file.contract_busted_date)>
	<cfif get_file.closing_date LT get_file.contract_busted_date>
	<cfset date_to_use = get_file.closing_date>
	<cfelse>
	<cfset date_to_use = get_file.contract_busted_date>
	</cfif>
<cfelse>
<cfif IsDate(get_file.closing_date) neq 'NULL' and get_file.closing_date neq ''>
<cfset date_to_use = get_file.closing_date>
<cfelse>
<cfset date_to_use = get_file.contract_busted_date>
</cfif>
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

<cfif #email# neq "">
<cfset new_loan_number = "">
<cfif get_file.loan_number neq "">
<cfset new_loan_number = "REO No. - " & get_file.loan_number & ", ">
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_email">
SELECT email from First_admin where ID = #session.ft_user_id#
</CFQUERY>
<cfset from_email = ReplaceNoCase(get_email.email, '@firsttitleservices.com', '@streamline-title.com', "ALL")>

<CFMAIL
TO="#email#"
FROM="#from_email#"
SERVER="127.0.0.1"
Subject="#new_loan_number##get_file.paddress#, #get_file.pcity#, #get_file.pstate# #get_file.pzip#, #DateFormat(date_to_use, 'm/d/yyyy')#, HOA/Condo Lien for order #rec_id#"
TIMEOUT="600"
type="HTML"
>

Notes from sender:<br>
#email_notes#<br>
<br>
<br>


View/Print HOA/Condo Lien <A HREF="#fileSys.FindFilePath('#get_file.hoa_condo_lien#', 'url')#" target="new">#get_file.hoa_condo_lien#</a> for order #rec_id#  - #get_id.bfirstname1# #get_id.blastname1#</B></font><br><br>
Thank You,<BR>
Streamline Title Staff
</cfmail>
<CFQUERY datasource="#request.dsn#">
		    INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
			VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'HOA/Condo Lien emailed to #email#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
</CFQUERY>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_upload_reo_data.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=20&company_id=0">

</cfif>


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
		<B>1st Title & Escrow, Inc. -HOA/Condo Lien File Upload for Order <CFOUTPUT query="get_id">#title_id#</CFOUTPUT></B>
		<p>



		</td>
		</td>
		<tr>

		<td width=455 align=center valign=top>
		<CFOUTPUT query="get_id">
<FORM action="./upload_hoa_condo_lien_final.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#"  ENCTYPE="multipart/form-data" method="post">

<input type="hidden" name="title_id" value="#title_id#">
Insert HOA/Condo Lien to upload <input type="file" size = 15 name="file_upload"><br>
<!--- Enter email address to send a link of the file -- <input type="text" name = "email" size = "15"><br> --->
<input type="submit" value="Upload File">
</CFOUTPUT>
</FORM>

		</td>
		</tr>
		</table>



    </td>
  </tr>
</table>
  </td>
  </tr>
</table>

</BODY>
</HTML>