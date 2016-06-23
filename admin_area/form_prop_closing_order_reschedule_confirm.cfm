
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Resched" DEFAULT="0">
<CFQUERY datasource="#request.dsn#" NAME="read_cserv">
	SELECT username, phone, email, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id = 5)
	and status = 1
	order by username
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_title">
	SELECT *
	FROM Property
	WHERE prop_ID = #rec_ID#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT company, team_id
	FROM companies
	WHERE id = #get_title.comp_id#
</CFQUERY>
<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_comp.team_id#">
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

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	SELECT fname, lname
	FROM First_Admin
	WHERE id = #url.uid#
</CFQUERY>

<CFIF #Resched# eq 1>
	<CFQUERY datasource="#request.dsn#">
		INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#trim(read_user.fname)#', '#trim(read_user.lname)#', #URL.rec_id#, 'Closing Postponed, Original Fee.','#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1', '1')
	</CFQUERY>

	<cfset send_mail = #get_title.o_email#>
	<CFIF #get_title.comp_id# eq "1835"> <!--- Union Mortgage - Annendale --->
	<CFSET send_mail = #send_mail# & ";closingdepartment@union-mtg.com">
	</CFIF>

	<CFMAIL
		TO="#send_mail#"
		FROM="closings@firsttitleservices.com" Subject="First Title Order Number 0232#get_title.prop_id#"
		TIMEOUT="600"
		type="HTML"
		>
	Closing Postponed for Order Number Borrower #get_title.bfirstname1# #get_title.blastname1#.
	</CFMAIL>



<CFELSEIF #Resched# eq 2>
	<CFIF get_title.pstate eq "NY" or get_title.pstate eq "MA" OR get_title.pstate eq "SC"
		OR get_title.pstate eq "WV" OR get_title.pstate eq "GA"  OR get_title.pstate eq "NC"
		OR get_title.pstate eq "DE"
		>
		<CFSET Fee = 250>
	<CFELSE>
		<CFSET Fee = 125>
	</CFIF>

	<CFQUERY datasource="#request.dsn#" NAME="read_data2">
			SELECT *
			FROM hud_form_prop_pg2
			WHERE prop_ID = #rec_id#
	</CFQUERY>

	<CFSET Result = 0>
	<cfif #read_data2.a_1303_a# eq "0" or #Len(read_data2.a_1303_a)# eq 0>
		<CFSET TotalFee = #read_data2.a_1400_a# + #Fee#>
		<CFQUERY datasource="#request.dsn#">
			Update hud_form_prop_pg2
			Set a_1303_text = 'Reclosing Fee',
				a_1303_a = '#Fee#',
				a_1400_a = '#TotalFee#'
			where prop_ID = #rec_id#
		</CFQUERY>
		<CFSET Result = 1>
	</CFIF>

	<CFIF #Result# eq 0>
		<cfif #read_data2.a_1304_a# eq "0" or #Len(read_data2.a_1304_a)# eq 0>
			<CFSET TotalFee = #read_data2.a_1400_a# + #Fee#>
			<CFQUERY datasource="#request.dsn#">
				Update hud_form_prop_pg2
				Set a_1304_text = 'Reclosing Fee',
					a_1304_a = '#Fee#',
					a_1400_a = '#TotalFee#'
				where prop_ID = #rec_id#
			</CFQUERY>
			<CFSET Result = 1>
		</CFIF>
	</CFIF>

	<CFIF #Result# eq 0>
		<cfif #read_data2.a_1305_a# eq "0" or #Len(read_data2.a_1305_a)# eq 0>
			<CFSET TotalFee = #read_data2.a_1400_a# + #Fee#>
			<CFQUERY datasource="#request.dsn#">
				Update hud_form_prop_pg2
				Set a_1305_text = 'Reclosing Fee',
					a_1305_a = '#Fee#',
					a_1400_a = '#TotalFee#'
				where prop_ID = #rec_id#
			</CFQUERY>
			<CFSET Result = 1>
		</CFIF>
	</CFIF>

	<CFIF #Result# eq 0>
		<cfif #read_data2.a_1306_a# eq "0" or #Len(read_data2.a_1306_a)# eq 0>
			<CFSET TotalFee = #read_data2.a_1400_a# + #Fee#>
			<CFQUERY datasource="#request.dsn#">
				Update hud_form_prop_pg2
				Set a_1306_text = 'Reclosing Fee',
					a_1306_b = '#Fee#',
					a_1400_a = '#TotalFee#'
				where prop_ID = #rec_id#
			</CFQUERY>
			<CFSET Result = 1>
		</CFIF>
	</CFIF>

	<CFIF #Result# eq 0>
		<cfif #read_data2.a_1307_a# eq "0" or #Len(read_data2.a_1307_a)# eq 0>
			<CFSET TotalFee = #read_data2.a_1400_a# + #Fee#>
			<CFQUERY datasource="#request.dsn#">
				Update hud_form_prop_pg2
				Set a_1307_text = 'Reclosing Fee',
					a_1307_a = '#Fee#',
					a_1400_a = '#TotalFee#'
				where prop_ID = #rec_id#
			</CFQUERY>
			<CFSET Result = 1>
		</CFIF>
	</CFIF>

	<CFIF #Result# eq 0>
		<cfif #read_data2.a_1308_a# eq "0" or #Len(read_data2.a_1308_a)# eq 0>
		<CFSET TotalFee = #read_data2.a_1400_a# + #Fee#>
			<CFQUERY datasource="#request.dsn#">
				Update hud_form_prop_pg2
				Set a_1308_text = 'Reclosing Fee',
					a_1308_a = '#Fee#',
					a_1400_a = '#TotalFee#'
				where prop_ID = #rec_id#
			</CFQUERY>

			<CFSET Result = 1>
		</CFIF>
	</CFIF>

	<CFIF #Result# eq 0>
		<!---There is a problem--->
		<CFMAIL
			TO="webmaster@firsttitleservices.com"
			FROM="closings@firsttitleservices.com" Subject="#get_title.prop_id# Problem."
			TIMEOUT="600"
			type="HTML"
		>
	Problem on form_title_closing_order_reschedule_confirm.cfm - Fee did not make it to the HUD.
		</CFMAIL>
	<cfelse>

	<cfset send_mail = #get_title.o_email#>
	<CFIF #get_title.comp_id# eq "1835"> <!--- Union Mortgage - Annendale --->
	<CFSET send_mail = #send_mail# & ";closingdepartment@union-mtg.com">
	</CFIF>

		<CFMAIL
		TO="#send_mail#"
		FROM="closings@firsttitleservices.com" Subject="First Title Order Number- 0232#get_title.prop_id#"
		TIMEOUT="600"
		type="HTML"
		>
	Closing Rescheduled for Order Number-#get_title.prop_ID# Borrower - #get_title.bfirstname1# #get_title.blastname1#.  There will be an additional fee of $#Fee#.
	</CFMAIL>
	</CFIF>

	<CFQUERY datasource="#request.dsn#">
		INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#trim(read_user.fname)#', '#trim(read_user.lname)#', #URL.rec_id#, 'Closing Rescheduled. Fee is $#Fee#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1', '1')
	</CFQUERY>

</CFIF>

<CFIF #Resched# eq 3>
	<CFQUERY datasource="#request.dsn#">
		Update Property
		set appraisal_status = 'Cancelled, fee to closer'
		where Prop_ID = #rec_ID#
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#">
		INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#trim(read_user.fname)#', '#trim(read_user.lname)#', #URL.rec_id#, 'Cancelled, Fee to Closer', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1', '1')
	</CFQUERY>


<cfset send_mail = #get_title.o_email#>
	<CFIF #get_title.comp_id# eq "1835"> <!--- Union Mortgage - Annendale --->
	<CFSET send_mail = #send_mail# & ";closingdepartment@union-mtg.com">
	</CFIF>

<cftry>
<cfinvoke	component = "cfc.team_info"	method = "getTeam"	returnVariable = "get_team_info" comp_id="#get_title.comp_id#">
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
<cfif IsDefined("Send_email")>
	<CFMAIL
		TO="#send_email#"
		FROM="#team_email#" Subject="First Title Order Number #get_title.prop_id#"
		TIMEOUT="600"
		type="HTML"
		>
	Closing Cancelled for First Title Order Number -#get_title.prop_ID# Borrower - #get_title.bfirstname1# #get_title.blastname1#. Fee to Closer.<br>
<br>

<br>
<cfoutput query="get_team_info">
<cfif get_team_info.Member_id eq get_team_info.Leader_id>
#get_team_info.fname# #get_team_info.lname#<br>
</cfif>
</cfoutput>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
First Title & Escrow <br>
30 West Gude Drive, 4th Floor<br>
Rockville, MD 20850<br>
Main Phone:  301-279-0303<br>
Direct Fax: 301-315-8146<br>
Web Site: <a href="https://#cgi.server_name#">https://#cgi.server_name#</a><br>
<cfelse>
First Title & Escrow <br>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br>
Main Phone:  301-279-0303<br>
Direct Fax: 301-315-8146<br>
Web Site: <a href="https://#cgi.server_name#">https://#cgi.server_name#</a><br>
</cfif>
	</CFMAIL>
</cfif>
</CFIF>

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

</head>


<BODY BGCOLOR="white" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
			<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<tr>
					<td width=790 align=left valign=top bgcolor=blue>
						<FONT FACE=ARIAL SIZE=2 color="white">
						<CENTER><B>Title Closing Order Reschedule Form</B></CENTER>
					</TD>
				</TR>
<CFIF #resched# eq 1>
				<tr>
					<td width=790 align=left valign=top bgcolor=white>
						<FONT FACE=ARIAL SIZE=3 color="black">
						<CENTER>Closing Postponed.  Original Fee.</CENTER>
					</td>
				</tr>
<CFELSEIF #resched# eq 2>
				<tr>
					<td width=790 align=left valign=top bgcolor=white>
						<FONT FACE=ARIAL SIZE=3 color="black">
						<CENTER>Closing Reschedule.  Fee will be <CFOUTPUT>#Fee#.</CFOUTPUT></CENTER>
					</td>
				</tr>
<CFELSE>
				<tr>
					<td width=790 align=left valign=top bgcolor=white>
						<FONT FACE=ARIAL SIZE=3 color="black">
						<CENTER>Closing Cancelled.  No Fee.</CENTER>
					</td>
				</tr>
</CFIF>
			</table>
		</td>
	</tr>
</table>
</BODY>
</HTML>



