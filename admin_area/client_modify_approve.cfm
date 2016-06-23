<CFQUERY datasource="#request.dsn#" NAME="get_teams">
		SELECT *
		FROM Teams
</CFQUERY>


<cfif not isDefined("url.uid1")>
	<cfset url.uid1=#url.uid#>
</cfif>

<CFQUERY datasource="#request.dsn#" name="read_mods">
			Select * FROM companies_temp_mods
			WHERE ID = #cmpid#		
</CFQUERY>

<cfif read_mods.master_co_id NEQ 0>
<CFQUERY datasource="#request.dsn#" NAME="master_co_query">
		SELECT *
		FROM Companies
		WHERE ID = '#read_mods.master_co_id#'
</CFQUERY>
</cfif>
<CFIF read_mods.intCustServ neq "">
		<CFQUERY datasource="#request.dsn#" NAME="read_company_cserv">
			SELECT   fname + ' ' + lname AS Name
			FROM     First_Admin
			WHERE    (ID = #read_mods.intCustServ#)
 	 	</CFQUERY>
  	<CFELSE>
  		<!--- <CFSET intCustServ = "null"> --->					 
  		<CFSET intCustServ = "">					 
	</CFIF>
	<!---Salesman Name --->
	 <!--- and #intSales# neq "null" --->
	<CFIF read_mods.intSales neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_company_Sales">
					  SELECT   fname + ' ' + lname AS Name
					  FROM     First_Admin
					  WHERE    (ID = #read_mods.intSales#)
	</CFQUERY>					  
	<CFELSE>	
	<!--- <CFSET intSales = "null"> --->					 
	   <CFSET intSales = "">					 
	</CFIF>
<CFQUERY datasource="#request.dsn#" NAME="read_current_settings">
		SELECT *
		FROM Companies
		WHERE ID = #cmpid#
</CFQUERY>
<cfif #read_mods.prev_team_id# eq "">
<cfset pti = read_current_settings.team_id>
<cfelse>
<cfset pti = read_mods.prev_team_id>
</cfif>
<CFQUERY datasource="#request.dsn#">
			UPDATE companies
			SET company = '#read_mods.company#', 
			    a_user = '#read_mods.a_user#', 
				a_pass = '#read_mods.a_pass#',
				phone = '#read_mods.phone#', 
				fax = '#read_mods.fax#', 
				addr1 = '#read_mods.addr1#', 
				addr2 = '#read_mods.addr2#', 
				city = '#read_mods.city#', 
				state = '#read_mods.state#', 
				zip_code = '#read_mods.zip_code#', 
				email = '#read_mods.email#',
				a_note_1 = '#read_mods.a_note_1#',
				a_date_mod = '#DateFormat(Now(), "mm/dd/yy")#',
				a_time_mod = '#TimeFormat(Now(), "HH:mm:ss")#', 
				a_status = '#read_mods.a_status#',
				comment = '#read_mods.comment#',
				a_uid_mod = '#URL.uid1#',
				intCustServ = '#read_mods.intCustServ#',
				intSales = '#read_mods.intSales#',
				blnCommit = '#read_mods.blnCommit#',
				blnFullServ = '#read_mods.blnFullServ#',
				blnClearc = '#read_mods.blnClearc#',
				blnPayoff = '#read_mods.blnPayoff#',
				blnDisbursements = '#read_mods.blnDisbursements#',
				blnRecording = '#read_mods.blnRecording#',
				blnAppraisal = '#read_mods.blnAppraisal#',
				blnSigning = '#read_mods.blnSigning#',
				blnShipping = '#read_mods.blnShipping#',
				<cfif read_mods.FeeVestingLegal eq ''>
				FeeVestingLegal = 0,
				<cfelse>
				FeeVestingLegal = #read_mods.FeeVestingLegal#,
				</cfif>
				<cfif read_mods.FeeCurrentOwner eq ''>
				FeeCurrentOwner = 0,
				<cfelse>
				FeeCurrentOwner = #read_mods.FeeCurrentOwner#,
				</cfif>
				<cfif read_mods.FeeFullSearch eq ''>
				FeeFullSearch = 0,
				<cfelse>
				FeeFullSearch = #read_mods.FeeFullSearch#,
				</cfif>
				<cfif read_mods.FeePolicyOnly eq ''>
				FeePolicyOnly = 0,
				<cfelse>
				FeePolicyOnly = #read_mods.FeePolicyOnly#,
				</cfif>
				<cfif read_mods.FeeSigning eq ''>
				FeeSigning = 0,
				<cfelse>
				FeeSigning = #read_mods.FeeSigning#,
				</cfif>
				<cfif read_mods.FeeRecording eq ''>
				FeeRecording = 0,
				<cfelse>
				FeeRecording = #read_mods.FeeRecording#,
				</cfif>
				<cfif read_mods.FeeAppraisal eq ''>
				FeeAppraisal = 0,
				<cfelse>
				FeeAppraisal = #read_mods.FeeAppraisal#,
				</cfif>
        		companies_switch = #read_mods.companies_switch#,
				proposed_monthly_transactions = '#read_mods.proposed_monthly_transactions#',
				master_co_id = '#read_mods.master_co_id#',
				contact_fname = '#read_mods.contact_fname#',
				contact_lname = '#read_mods.contact_lname#',
				auto_email_opt_out = #read_mods.auto_email_opt_out#,
				special_inst = '#read_mods.special_inst#',
				special_abs_inst = '#read_mods.special_abs_inst#',
				team_id = #read_mods.team_id#,
				prev_team_id = #pti#,
				enhanced_coverage = #read_mods.enhanced_coverage#,
				allow_subrates = #read_mods.allow_subrates#,
				allow_reissue_rates = #read_mods.allow_reissue_rates#
			WHERE ID = #cmpid#		
		</CFQUERY>

<cfif read_current_settings.a_status eq 0 and read_current_settings.auto_email_opt_out eq 0 and read_mods.a_status eq 1>
<cfif read_current_settings.ID eq 2368 or read_current_settings.master_co_id eq 2368>
<cfinclude template="../auto_emails/new_streamline_account.cfm">
<cfelse>
<cfinclude template="../auto_emails/new_account.cfm">
<HTML><HEAD></cfif>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">


<TITLE>First Title Services Admin</TITLE>
</HEAD>
<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>
<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=black face=arial>Modify Mortgage Client/Customer
		</td>
	</tr>
</CFOUTPUT>	
</table>
		</td>
	</tr>
	<tr>
		<td width=499 align=center valign=top bgcolor=white>
<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>
	<tr>
		<td width=130 align=left valign=top bgcolor=d3d3d3>
			<FONT SIZE=2 color=green face=arial>
			The Client has been sucessfully MODIFIED.		
			<p>
			To adjust the charges associated with line items on the HUD form for this client, click on the link below.
			<p><FONT SIZE=2 color=black face=arial>
<CFOUTPUT>
			<a href="./client_line_costs_select.cfm?uid=#URL.uid#&al=#URL.al#&cid=#cmpid#"><img src="./images/button_line_costs.gif" border=0></a>
			<p>
			<a href="./client_lenders_select.cfm?uid=#URL.uid#&al=#URL.al#&cid=#cmpid#"><img src="./images/button_lenders.gif" border=0></a>
</CFOUTPUT>				
		</td>
		<td width=368 align=left valign=top bgcolor=e1e1e1>
<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<CFOUTPUT>
	<tr>		
		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
			<img src="./images/clear.gif" height=10 width=85>
		</td>
	</tr>
    <tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Company Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<B>#read_mods.company#</B>
		</td>
	</tr>
	<cfif read_mods.master_co_id NEQ 0>
    <tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Master Company Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<B>#master_co_query.company#</B>
		</td>
	</tr>
	</cfif>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Contact First Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<B>#read_mods.contact_fname#</B>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Contact Last Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<B>#read_mods.contact_lname#</B>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<b><font size=2 color=blue face=arial>
			Username - </b>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=red face=arial>
			<b>#read_mods.a_user#</b>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<b><font size=2 color=blue face=arial>
			Password - </b>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=red face=arial>
			<b>#read_mods.a_pass#</b>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Address1 - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.addr1#</b>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Address2 - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.addr2#</b>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Note - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.a_note_1#</b>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			City - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.city#</b>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			State - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.state#</b>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Zip Code - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#read_mods.zip_CODE#</b>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Phone - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.phone#</b>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Fax - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.fax#</b>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Email - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.email#</b>
		</td>
	</tr>
<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Proposed Monthly Transactions - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.proposed_monthly_transactions#</b>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Customer Service - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<CFIF #read_mods.intCustServ# neq "" AND #read_mods.intCustServ# neq "null">
			<b>#read_company_cserv.name#</b>
			</CFIF>
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Customer Service Team- 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
		<cfloop query="get_teams">
			<CFIF get_teams.id eq #read_mods.team_id#>
			<b>#get_teams.name#</b>
			</CFIF>
			</cfloop>
		</td>
	</tr>
		<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Sales Person - 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<CFIF #read_mods.intSales# neq "" AND #read_mods.intSales# neq "null">
				<b>#read_company_Sales.name#</b>
			</CFIF>
		</td>
	</tr>
	<tr>		
		<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Status
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
					<CFIF #read_mods.a_status# EQ "0"> 
						<font size=2 color=red face=arial><B>In-Active</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Active</B></FONT>
					</CFIF>
		</td>
	</tr>
    <tr>		
		<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Allow Employee Authentication
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
					<CFIF #read_mods.companies_switch# NEQ "1"> 
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
	<tr>		
		<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Send Automatic Reminder/Thank You Emails
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
					<CFIF #read_mods.auto_email_opt_out# EQ "0"> 
						<font size=2 color=red face=arial><B>Yes</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>No</B></FONT>
					</CFIF>
		</td>
	</tr>
	<tr>		
		<td width=130  align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Comment
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.Comment#</b>
		</td>
	</tr>
		<tr>		
		<td width=130  align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Enhanced T.I. Coverage
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b><cfif read_mods.enhanced_coverage eq 1>Yes<cfelse>No</cfif></b>
		</td>
	</tr>
<tr>		
		<td width=130  align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Special Instructions
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.special_inst#</b>
		</td>
	</tr>
	<tr>		
		<td width=130  align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Special Abstractors Instructions
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>#read_mods.special_abs_inst#</b>
		</td>
	</tr>
	<!---New Stuff - Harry 091504 --->
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Required Services 
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial><b>
			 	<CFIF #read_mods.blnCommit# eq 1> 
					Insurance Commitment Policy<BR>
				</CFIF>
				<CFIF #read_mods.blnFullServ# eq 1> 
					Full Closing Services<BR>	
				</CFIF>
				<CFIF #read_mods.blnClearc# eq 1> 
					Clearc<BR>		
				</CFIF>
				<CFIF #read_mods.blnPayoff# eq 1> 
					Payoff<BR>
				</CFIF>
				<CFIF #read_mods.blnDisbursements# eq 1> 
					Disbursements<BR>	
				</CFIF>
				<CFIF #read_mods.blnRecording# eq 1> 
					Recording<BR>
				</CFIF>
                <CFIF #read_mods.blnAppraisal# eq 1> 
					Appraisal<BR>
				</CFIF>
                <CFIF #read_mods.blnSigning# eq 1> 
					Signing Services<BR>
				</CFIF>
				<CFIF #read_mods.blnShipping# eq 1> 
					Special Shipping Requirements
				</CFIF>
			</b></font>
		</td>
	</tr>
	<tr>
	<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Fees
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial><b>
			<CFIF #Len(read_mods.FeeVestingLegal)# gte 1 > 
				Vesting + Legal #dollarformat(read_mods.FeeVestingLegal)#<br>
			</CFIF>	
			<CFIF #Len(read_mods.FeeCurrentOwner)# gte 1 > 
				Current Owner #dollarformat(read_mods.FeeCurrentOwner)#<br>
			</CFIF>
			<CFIF #Len(read_mods.FeeFullSearch)# gte 1 > 
				Full Search #dollarformat(read_mods.FeeFullSearch)#<br>
			</CFIF>	
			<CFIF #Len(read_mods.FeePolicyOnly)# gte 1 > 
				Commit/Policy Only $295 + Policy & &nbsp;&nbsp;&nbsp;Binder #dollarformat(read_mods.FeePolicyOnly)#<br>
			</CFIF>
			<CFIF #Len(read_mods.FeeSigning)# gte 1 > 
				National Signing Services  #Dollarformat(read_mods.FeeSigning)#<br>
			</CFIF>
			<CFIF #Len(read_mods.FeeRecording)# gte 1 > 
				Recording Services #DollarFormat(read_mods.FeeRecording)#<br>
			</CFIF>
			<CFIF #Len(read_mods.FeeAppraisal)# gte 1 > 
				Appraisal #DollarFormat(read_mods.FeeAppraisal)#
			</CFIF>
	</tr>
	
	
	   <tr>		
		<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Allow Substitution Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
					<CFIF #read_mods.allow_subrates# NEQ "1"> 
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
	   <tr>		
		<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Allow Reissue Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
					<CFIF #read_mods.allow_reissue_rates# NEQ "1"> 
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
</CFOUTPUT>
</table>
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