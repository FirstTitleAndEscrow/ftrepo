<CFQUERY datasource="#request.dsn#" name="get_team_info">
Select * from Teams where name like 'Inactive%'
</CFQUERY>
<cfset inactive_id = get_team_info.ID>


<CFPARAM NAME="custom_rate_table" DEFAULT="">
<CFPARAM NAME="intCustServ" DEFAULT="">
<CFPARAM NAME="intSales" DEFAULT="">
<CFPARAM NAME="companies_switch" DEFAULT="">
<CFPARAM NAME="company" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_pass" DEFAULT="">
<CFPARAM NAME="phone" DEFAULT="">
<CFPARAM NAME="fax" DEFAULT="">
<CFPARAM NAME="addr1" DEFAULT="">
<CFPARAM NAME="addr2" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="zip_code" DEFAULT="">
<CFPARAM NAME="email" DEFAULT="">
<CFPARAM NAME="proposed_monthly_transactions" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="a_status" DEFAULT="">
<CFPARAM NAME="comment" DEFAULT="">
<CFPARAM NAME="special_inst" DEFAULT="">
<CFPARAM NAME="special_abs_inst" DEFAULT="">
<CFPARAM NAME="uid" DEFAULT="">
<CFPARAM NAME="uid1" DEFAULT="">
<CFPARAM NAME="report" DEFAULT="">
<CFPARAM NAME="commit" DEFAULT="">
<CFPARAM NAME="FullService" DEFAULT="">
<CFPARAM NAME="clearc" DEFAULT="">
<CFPARAM NAME="payoff" DEFAULT="">
<CFPARAM NAME="disbursements" DEFAULT="">
<CFPARAM NAME="recording" DEFAULT="">
<CFPARAM NAME="appraisal" DEFAULT="">
<CFPARAM NAME="signing" DEFAULT="">
<CFPARAM NAME="shipping" DEFAULT="">
<CFPARAM NAME="lstVesting" DEFAULT="NULL">
<CFPARAM NAME="lstOwner" DEFAULT="NULL">
<CFPARAM NAME="lstFullSearch" DEFAULT="NULL">
<CFPARAM NAME="lstCommitOnly" DEFAULT="NULL">
<CFPARAM NAME="lstSigning" DEFAULT="NULL">
<CFPARAM NAME="FeeRecording" DEFAULT="NULL">
<CFPARAM NAME="lstAppraisal" DEFAULT="NULL">
<CFPARAM NAME="cid" DEFAULT="">
<CFPARAM NAME="trigger" DEFAULT="0">
<CFPARAM NAME="master_co" DEFAULT="">
<CFPARAM NAME="auto_email_opt_out" DEFAULT="0">
<CFPARAM NAME="contact_fname" DEFAULT="">
<CFPARAM NAME="contact_lname" DEFAULT="">
<CFPARAM NAME="team_id" DEFAULT="">
<CFPARAM NAME="realecclientid" DEFAULT="">
<CFPARAM NAME="enhanced_coverage" DEFAULT="1">
<CFPARAM NAME="allow_subrates" DEFAULT="0">

<CFPARAM NAME="Infile" DEFAULT="">
<CFPARAM NAME="Reissue" DEFAULT="">
<CFPARAM NAME="Safe" DEFAULT="">
<CFPARAM NAME="Basic" DEFAULT="">
<CFPARAM NAME="Census" DEFAULT="">
<CFPARAM NAME="Life" DEFAULT="">
<CFPARAM NAME="LifeCensus" DEFAULT="">
<CFPARAM NAME="streamline_client" DEFAULT="False">
<CFPARAM NAME="attach_icl" DEFAULT="0">
<CFPARAM NAME="attach_eando" DEFAULT="0">

<cfif not isDefined("url.uid1")>
	<cfset url.uid1=#url.uid#>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_teams">
		SELECT *
		FROM Teams
</CFQUERY>


<cfif master_co NEQ 0>
<CFQUERY datasource="#request.dsn#" NAME="master_co_query">
		SELECT *
		FROM Companies
		WHERE ID = '#master_co#'
</CFQUERY>
</cfif>

<cfset cmpid=#cid#>

<CFSET pos= #Find(",", URL.UID, 1 )#-1>

<CFIF pos gt 0>
   <cfset URL.UID= Left(URL.UID,pos)>
</CFIF>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM First_Admin
		WHERE ID = '#URL.UID#'
</CFQUERY>
<!--- <cfoutput>Current user:#URL.UID#</cfoutput> --->

		<!--- <CFIF #Len(intSales)# gte 1 and #intSales# neq "null">
	<CFSET numberTime = #Find(",", intSales, 1 )#>
	<CFSET numberTime = #numbertime# + 1>
	<cfset startS=#numberTime#>
	<cfset endS=len(intsales)>
   <cfset intSales = #Mid(intSales,startS,endS)#>  </CFIF>
		 --->
		<!---<cfoutput>intSales: #intsales#</cfoutput>
	<cfoutput>pos: #pos#</cfoutput>
	<cfoutput>uid: #url.uid#</cfoutput>--->

	<!---<CFIF #Len(intSales)# gte 4 and #intSales# neq "null">
	<CFSET numberTime = #Find(",", intSales, 1 )#>
	<CFSET numberTime = #numbertime# - 1>
    <cfset intSales = #Mid(intSales,1,numbertime)#>  </CFIF>	--->


	<!---Customer Service Name ---->
<!--- 08/14 NS S --->
	 <!--- and #intCustServ# neq "null" --->
	<CFIF #intCustServ# neq "">
		<CFQUERY datasource="#request.dsn#" NAME="read_company_cserv">
			SELECT   fname + ' ' + lname AS Name
			FROM     First_Admin
			WHERE    (ID = #intCustServ#)
 	 	</CFQUERY>
  	<CFELSE>
  		<!--- <CFSET intCustServ = "null"> --->
  		<CFSET intCustServ = "">
	</CFIF>
	<!---Salesman Name --->
	 <!--- and #intSales# neq "null" --->
	<CFIF #intSales# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_company_Sales">
					  SELECT   fname + ' ' + lname AS Name
					  FROM     First_Admin
					  WHERE    (ID = #intSales#)
	</CFQUERY>
	<CFELSE>
	<!--- <CFSET intSales = "null"> --->
	   <CFSET intSales = "">
	</CFIF>
<!--- NS 08/14 F --->

	<!---Set Boolean Values that are "on" to one and all others to zero--->
	<!--- N 07/18/05 When modification is confirmed "on" becomes 1 --->

	<CFIF #Infile# eq "ON">
    <CFSet #Infile# = "Infile">
<CFELSE>
    <CFSet #Infile# = "">
</CFIF>
<CFIF #Reissue# eq "ON">
    <CFSet #Reissue# = "Reissue">
<CFELSE>
    <CFSet #Reissue# = "">
</CFIF>
<CFIF #Safe# eq "ON">
    <CFSet #Safe# = "Safe">
<CFELSE>
    <CFSet #Safe# = "">
</CFIF>
<CFIF #Basic# eq "ON">
    <CFSet #Basic# = "Basic">
<CFELSE>
    <CFSet #Basic# = "">
</CFIF>
<CFIF #Census# eq "ON">
    <CFSet #Census# = "Census">
<CFELSE>
    <CFSet #Census# = "">
</CFIF>
<CFIF #Life# eq "ON">
    <CFSet #Life# = "Life">
<CFELSE>
    <CFSet #Life# = "">
</CFIF>
<CFIF #LifeCensus# eq "ON">
    <CFSet #LifeCensus# = "LifeCensus">
<CFELSE>
    <CFSet #LifeCensus# = "">
</CFIF>


	<CFIF #report# eq "On" or #report# eq 1>
		<CFSET report = "1">
	<cfelse>
		<CFSET report = "0">
	</CFIF>
	<CFIF #Commit# eq "On" or #Commit# eq 1>
		<CFSET Commit = "1">
	<cfelse>
		<CFSET Commit = "0">
	</CFIF>
	<CFIF #ClearC# eq "On" or #ClearC# eq 1>
		<CFSET ClearC = "1">
	<cfelse>
		<CFSET ClearC = "0">
	</CFIF>
	<CFIF #FullService# eq "On" or #FullService# eq 1>
		<CFSET FullService = "1">
	<cfelse>
		<CFSET FullService = "0">
	</CFIF>
	<CFIF #Payoff# eq "On" or #Payoff# eq 1>
		<CFSET Payoff = "1">
	<cfelse>
		<CFSET Payoff = "0">
	</CFIF>
	<CFIF #disbursements# eq "On" or #disbursements# eq 1>
		<CFSET disbursements = "1">
	<cfelse>
		<CFSET disbursements = "0">
	</CFIF>
	<CFIF #recording# eq "On" or #recording# eq 1>
		<CFSET recording = "1">
        <CFSET Feerecording = "60">
	<cfelse>
		<CFSET recording = "0">
        <CFSET Feerecording = "null">
	</CFIF>
	<CFIF #appraisal# eq "On" or #appraisal# eq 1 >
		<CFSET appraisal = "1">
	<cfelse>
		<CFSET appraisal = "0">
	</CFIF>
	<CFIF #signing# eq "On" or #signing# eq 1>
		<CFSET signing = "1">
	<cfelse>
		<CFSET signing = "0">
	</CFIF>
	<CFIF #shipping# eq "On" or #shipping# eq 1>
		<CFSET shipping = "1">
	<cfelse>
		<CFSET shipping = "0">
	</CFIF>

    <CFIF #recording# eq "1" or #recording# eq 1>
        <cfset feerecording = "60">
    <CFELSE>
            <cfset feerecording = "null">
    </CFIF>

	<cfif isDefined("url.cmpid")>
		<cfset cmpid=#url.cmpid#>
	</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="read_company">
					  SELECT   *
					  FROM     Companies
					  WHERE    (ID = #cmpid#)
	</CFQUERY>

<!--- <cfif #read_user.lname# eq "Hays" > --->
<!--- nelli@firsttitleservices.com  --->
<cfif #read_user.role_id# eq "15" or #read_user.role_id# eq "20"
	or #read_user.role_id# eq "24"
	or #read_user.role_id# eq "31"
	or #read_user.role_id# eq "32" >

<!--- put the information in a temp database --->
<CFQUERY datasource="#request.dsn#" name="find_comp">
			Select * FROM companies_temp_mods
			WHERE ID = #cmpid#
		</CFQUERY>
<cfif form.a_status eq 1>
<cfif form.team_id eq inactive_id>
<CFQUERY datasource="#request.dsn#" name="get_info">
Select * from Companies where ID = #cmpid#
</CFQUERY>
<cfset team_id = get_info.prev_team_id>
<cfelse>
<CFQUERY datasource="#request.dsn#" name="get_info">
Select * from Companies where ID = #cmpid#
</CFQUERY>
<cfset team_id = form.team_id>
</cfif>
<cfelse>
<cfset team_id = inactive_id>
</cfif>

<cfif find_comp.recordcount>
		<CFQUERY datasource="#request.dsn#">
			UPDATE companies_temp_mods
			SET company = '#company#',
			    a_user = '#a_user#',
				a_pass = '#a_pass#',
				phone = '#phone#',
				fax = '#fax#',
				addr1 = '#addr1#',
				addr2 = '#addr2#',
				city = '#city#',
				state = '#state#',
				zip_code = '#zip_code#',
				email = '#email#',
				a_note_1 = '#a_note_1#',
				a_date_mod = '#DateFormat(Now(), "mm/dd/yy")#',
				a_time_mod = '#TimeFormat(Now(), "HH:mm:ss")#',
				a_status = '#a_status#',
				comment = '#comment#',
				special_inst = '#special_inst#',
				special_abs_inst = '#special_abs_inst#',
				a_uid_mod = '#URL.uid1#',
				intCustServ = '#intCustServ#',
				intSales = '#intSales#',
				blnCommit = '#commit#',
				blnFullServ = '#FullService#',
				blnClearc = '#clearc#',
				blnPayoff = '#payoff#',
				blnDisbursements = '#disbursements#',
				blnRecording = '#recording#',
				blnAppraisal = '#appraisal#',
				blnSigning = '#signing#',
				blnShipping = '#shipping#',
				FeeVestingLegal = #lstVesting#,
				FeeCurrentOwner = #lstOwner#,
				FeeFullSearch = #lstFullSearch#,
				FeePolicyOnly = #lstCommitOnly#,
				FeeSigning = #lstSigning#,
				FeeRecording = #FeeRecording#,
				FeeAppraisal = #lstAppraisal#,
        		companies_switch = #companies_switch#,
				proposed_monthly_transactions = '#proposed_monthly_transactions#',
				master_co_id = '#master_co#',
				contact_fname = '#contact_fname#',
				contact_lname = '#contact_lname#',
				auto_email_opt_out = #auto_email_opt_out#,
				team_id = #team_id#,
				<cfif form.a_status eq 1 and form.team_id neq inactive_id>
				prev_team_id = '#team_id#',
				</cfif>
				realECclientID = '#realECclientID#',
				avmproduct = '#avmproduct#',
				enhanced_coverage = #enhanced_coverage#,
				allow_subrates = #allow_subrates#,
				streamline_client = '#form.streamline_client#',
				attach_icl = '#form.attach_icl#',
				attach_eando = '#form.attach_eando#',
				custom_rate_table = '#custom_rate_table#'
			WHERE ID = #cmpid#
		</CFQUERY>
		<cfelse>
		<CFQUERY datasource="#request.dsn#">
			INSERT INTO companies_temp_mods			(company,a_user,a_pass,phone,fax,addr1,addr2,city,state,zip_code,email,a_note_1,a_date_mod,a_time_mod,a_status,comment,a_uid_mod,intCustServ,intSales,blnCommit,blnFullServ,blnClearc,blnPayoff,blnDisbursements,blnRecording,blnAppraisal,blnSigning,blnShipping,FeeVestingLegal,FeeCurrentOwner,FeeFullSearch,FeePolicyOnly,FeeSigning,FeeRecording,FeeAppraisal,companies_switch,proposed_monthly_transactions,master_co_id,contact_fname,contact_lname,auto_email_opt_out,ID, team_id, <cfif form.a_status eq 1 and form.team_id neq inactive_id>prev_team_id, </cfif>realECclientid, avmproduct, special_inst, special_abs_inst, enhanced_coverage, allow_subrates, streamline_client, attach_icl, attach_eando, custom_rate_table)
			Values
			('#company#',
			    '#a_user#',
				'#a_pass#',
				'#phone#',
				'#fax#',
				'#addr1#',
				'#addr2#',
				'#city#',
				'#state#',
				'#zip_code#',
				'#email#',
				'#a_note_1#',
				'#DateFormat(Now(), "mm/dd/yy")#',
				'#TimeFormat(Now(), "HH:mm:ss")#',
				'#a_status#',
				'#comment#',
				'#URL.uid1#',
				'#intCustServ#',
				'#intSales#',
				'#commit#',
				'#FullService#',
				'#clearc#',
				'#payoff#',
				'#disbursements#',
				'#recording#',
				'#appraisal#',
				'#signing#',
				'#shipping#',
				#lstVesting#,
				#lstOwner#,
				#lstFullSearch#,
				#lstCommitOnly#,
				#lstSigning#,
				#FeeRecording#,
				#lstAppraisal#,
        		#companies_switch#,
				'#proposed_monthly_transactions#',
				'#master_co#',
				'#contact_fname#',
				'#contact_lname#',
				#auto_email_opt_out#,
			    #cmpid#,
				#team_id#,
				<cfif form.a_status eq 1 and form.team_id neq inactive_id>
				#team_id#,
				</cfif>
				'#realECclientID#',
				'#avmproduct#',
				'#special_inst#',
				'#special_abs_inst#',
				#enhanced_coverage#,
				#allow_subrates#,
				'#form.streamline_client#',
				'#form.attach_icl#',
				'#form.attach_eando#',
				'#custom_rate_table#')
		</CFQUERY>
		</cfif>

<CFMAIL
TO="spape@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com"
BCC="rjermain@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Client info change request"
TIMEOUT="600"
type="HTML"
>


	<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>
<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=red face=arial>Mortgage Client/Customer Modify Request
		</td>
	</tr>

</table>
<table width=498>
<tr>
		<td width=498 align=center valign=top bgcolor=white><!---  # 477 client_modify_submit_dev.cfm --->
			<font size=2 color=green face=arial><B>Click <A HREF="https://#CGI.SERVER_NAME#/admin_area/client_modify_approve.cfm?uid=59&cmpid=#cmpid#&al=1">HERE</a> to allow the modification</B>
		</td>
	</tr>
</table>
		</td>
	</tr>
	<tr>
		<td width=499 align=center valign=top bgcolor=white>
<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>
	<tr>
		<td width=130 align=left valign=top bgcolor=d3d3d3>
			<FONT SIZE=2 color=green face=arial>
			<b>This company has been requested to be modified.</b>
			<p>

		</td>
		<td width=368 align=left valign=top bgcolor=e1e1e1>
<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<tr>
		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>

		</td>
	</tr>
    <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Company Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#company#</B>
		</td>
	</tr>
	<cfif master_co NEQ 0>
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
			Custom Rate Table
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#custom_rate_table#</B>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Contact First Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#contact_fname#</B>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Contact Last Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#contact_lname#</B>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=blue face=arial>
			Username - </b>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=red face=arial>
			<b>#a_user#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=blue face=arial>
			Password - </b>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=red face=arial>
			<b>#a_pass#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address1 -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#addr1#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address2 -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#addr2#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Note -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#a_note_1#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			City -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#city#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			State -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#state#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Zip Code -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#zip_CODE#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Phone -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#phone#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fax -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#fax#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Email -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#email#</b>
		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Proposed Monthly Transactions -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#proposed_monthly_transactions#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Customer Service -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<CFIF #intCustServ# neq "" AND #intCustServ# neq "null">
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
			<CFIF get_teams.id eq #team_id#>
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
			<CFIF #intSales# neq "" AND #intSales# neq "null">
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
					<CFIF #a_status# EQ "0">
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
					<CFIF #companies_switch# NEQ "1">
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
					<CFIF #auto_email_opt_out# EQ "0">
						<font size=2 color=red face=arial><B>Yes</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>No</B></FONT>
					</CFIF>
		</td>
	</tr>
		<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Streamline Client
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.streamline_client# EQ "True">
						<font size=2 color=red face=arial><B>Yes</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>No</B></FONT>
					</CFIF>
		</td>
	</tr>

		<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Attach ICL
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.attach_icl# EQ "True">
						<font size=2 color=red face=arial><B>Yes</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>No</B></FONT>
					</CFIF>
		</td>
	</tr>
		<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Attach E & O
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.attach_eando# EQ "True">
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
			<b>#Comment#</b>
		</td>
	</tr>
	<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Special Instructions
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#special_inst#</b>
		</td>
	</tr>
	<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Special Abstractors Instructions
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#special_abs_inst#</b>
		</td>
	</tr>


	<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Enhanced T.I. Coverage
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b><cfif enhanced_coverage eq 1>Yes<cfelse>No</cfif></b>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Required Services
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial><b>
			 	<CFIF #read_company.blnCommit# eq 1>
					Insurance Commitment Policy<BR>
				</CFIF>
				<CFIF #read_company.blnFullServ# eq 1>
					Full Closing Services<BR>
				</CFIF>
				<CFIF #read_company.blnClearc# eq 1>
					Clearc<BR>
				</CFIF>
				<CFIF #read_company.blnPayoff# eq 1>
					Payoff<BR>
				</CFIF>
				<CFIF #read_company.blnDisbursements# eq 1>
					Disbursements<BR>
				</CFIF>
				<CFIF #read_company.blnRecording# eq 1>
					Recording<BR>
				</CFIF>
                <CFIF #read_company.blnAppraisal# eq 1>
					Appraisal<BR>
				</CFIF>
                <CFIF #read_company.blnSigning# eq 1>
					Signing Services<BR>
				</CFIF>
				<CFIF #read_company.blnShipping# eq 1>
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
			<CFIF #Len(read_company.FeeVestingLegal)# gte 1 >
				Vesting + Legal #dollarformat(read_company.FeeVestingLegal)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeCurrentOwner)# gte 1 >
				Current Owner #dollarformat(read_company.FeeCurrentOwner)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeFullSearch)# gte 1 >
				Full Search #dollarformat(read_company.FeeFullSearch)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeePolicyOnly)# gte 1 >
				Commit/Policy Only $295 + Policy & &nbsp;&nbsp;&nbsp;Binder #dollarformat(read_company.FeePolicyOnly)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeSigning)# gte 1 >
				National Signing Services  #Dollarformat(read_company.FeeSigning)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeRecording)# gte 1 >
				Recording Services #DollarFormat(read_company.FeeRecording)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeAppraisal)# gte 1 >
				Appraisal #DollarFormat(read_company.FeeAppraisal)#
			</CFIF>
	</tr>
<!--- <tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			RealEC ClientID
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#realECclientID#</b>
		</td>
	</tr>
<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM Product
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#avmproduct#</b>
		</td>
	</tr> --->
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#AVMproduct#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM ClientID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#AVMclientID#</b>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM ProviderID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#AVMproID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Flood Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial><b>
		    <CFIF #read_company.Basic# is "Basic">
                Basic Certification<BR>
            </CFIF>
            <CFIF #read_company.Census# is "Census">
              Basic Certification with Census Information<BR>
            </CFIF>
            <CFIF #read_company.Life# is "Life">
               Life of Loan Certification<BR>
            </CFIF>
			<CFIF #read_company.LifeCensus# is "LifeCensus">
               Life of Loan Certification with Census Information<BR>
            </CFIF>
			</b></font>
		</td>

	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Flood ClientID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FclientID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Flood ProviderID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FproID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Credit Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial><b>
			 	<CFIF#read_company.Infile# is "Infile">
					Infile Report<BR>
				</CFIF>
				<CFIF #read_company.Reissue# is "Reissue">
					Re-Issue<BR>
				</CFIF>
				<CFIF #read_company.Safe# is "Safe">
					SAFE (1 Bureau In File)<BR>
				</CFIF>

			</b></font>
		</td>

	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Credit ClientID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#CRclientID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Credit ProviderID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#CRproID#</b>
		</td>
	</tr>

    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Substitution Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_subrates# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
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







	</cfmail>



	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
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
			<FONT SIZE=2 color=red face=arial>
			<b>An email has been sent to the administrator to process your request.		</b></font>
			<p><FONT SIZE=2 color=green face=arial>
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
			<B>#company#</B>
		</td>
	</tr>
	<cfif master_co NEQ 0>
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
			Custom Rate Table
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#custom_rate_table#</B>
		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Contact First Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#contact_fname#</B>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Contact Last Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#contact_lname#</B>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=blue face=arial>
			Username - </b>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=red face=arial>
			<b>#a_user#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=blue face=arial>
			Password - </b>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=red face=arial>
			<b>#a_pass#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address1 -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#addr1#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address2 -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#addr2#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Note -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#a_note_1#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			City -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#city#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			State -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#state#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Zip Code -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#zip_CODE#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Phone -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#phone#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fax -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#fax#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Email -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#email#</b>
		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Proposed Monthly Transactions -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#proposed_monthly_transactions#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Customer Service -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<CFIF #intCustServ# neq "" AND #intCustServ# neq "null">
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
			<CFIF get_teams.id eq #team_id#>
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
			<CFIF #intSales# neq "" AND #intSales# neq "null">
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
					<CFIF #a_status# EQ "0">
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
					<CFIF #companies_switch# NEQ "1">
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
					<CFIF #auto_email_opt_out# EQ "0">
						<font size=2 color=red face=arial><B>Yes</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>No</B></FONT>
					</CFIF>
		</td>
	</tr>
		<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Streamline Client
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.streamline_client# EQ "True">
						<font size=2 color=red face=arial><B>Yes</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>No</B></FONT>
					</CFIF>
		</td>
	</tr>
		<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Attach ICL
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.attach_icl# EQ "True">
						<font size=2 color=red face=arial><B>Yes</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>No</B></FONT>
					</CFIF>
		</td>
	</tr>
		<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Attach E & O
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.attach_eando# EQ "True">
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
			<b>#Comment#</b>
		</td>
	</tr>

		<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Enhanced T.I. Coverage
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b><cfif enhanced_coverage eq 1>Yes<cfelse>No</cfif></b>
		</td>
	</tr>

<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Special Instructions
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#special_inst#</b>
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
			 	<CFIF #read_company.blnCommit# eq 1>
					Insurance Commitment Policy<BR>
				</CFIF>
				<CFIF #read_company.blnFullServ# eq 1>
					Full Closing Services<BR>
				</CFIF>
				<CFIF #read_company.blnClearc# eq 1>
					Clearc<BR>
				</CFIF>
				<CFIF #read_company.blnPayoff# eq 1>
					Payoff<BR>
				</CFIF>
				<CFIF #read_company.blnDisbursements# eq 1>
					Disbursements<BR>
				</CFIF>
				<CFIF #read_company.blnRecording# eq 1>
					Recording<BR>
				</CFIF>
                <CFIF #read_company.blnAppraisal# eq 1>
					Appraisal<BR>
				</CFIF>
                <CFIF #read_company.blnSigning# eq 1>
					Signing Services<BR>
				</CFIF>
				<CFIF #read_company.blnShipping# eq 1>
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
			<CFIF #Len(read_company.FeeVestingLegal)# gte 1 >
				Vesting + Legal #dollarformat(read_company.FeeVestingLegal)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeCurrentOwner)# gte 1 >
				Current Owner #dollarformat(read_company.FeeCurrentOwner)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeFullSearch)# gte 1 >
				Full Search #dollarformat(read_company.FeeFullSearch)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeePolicyOnly)# gte 1 >
				Commit/Policy Only $295 + Policy & &nbsp;&nbsp;&nbsp;Binder #dollarformat(read_company.FeePolicyOnly)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeSigning)# gte 1 >
				National Signing Services  #Dollarformat(read_company.FeeSigning)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeRecording)# gte 1 >
				Recording Services #DollarFormat(read_company.FeeRecording)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeAppraisal)# gte 1 >
				Appraisal #DollarFormat(read_company.FeeAppraisal)#
			</CFIF>
	</tr>
<!--- <tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			RealEC ClientID
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#realECclientID#</b>
		</td>
	</tr>
<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM Product
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#avmproduct#</b>
		</td>
	</tr> --->

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#AVMproduct#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM ClientID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#AVMclientID#</b>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM ProviderID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#AVMproID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Flood Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial><b>
		    <CFIF #read_company.Basic# is "Basic">
                Basic Certification<BR>
            </CFIF>
            <CFIF #read_company.Census# is "Census">
              Basic Certification with Census Information<BR>
            </CFIF>
            <CFIF #read_company.Life# is "Life">
               Life of Loan Certification<BR>
            </CFIF>
			<CFIF #read_company.LifeCensus# is "LifeCensus">
               Life of Loan Certification with Census Information<BR>
            </CFIF>
			</b></font>
		</td>

	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Flood ClientID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FclientID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Flood ProviderID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FproID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Credit Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial><b>
			 	<CFIF#read_company.Infile# is "Infile">
					Infile Report<BR>
				</CFIF>
				<CFIF #read_company.Reissue# is "Reissue">
					Re-Issue<BR>
				</CFIF>
				<CFIF #read_company.Safe# is "Safe">
					SAFE (1 Bureau In File)<BR>
				</CFIF>

			</b></font>
		</td>

	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Credit ClientID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#CRclientID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Credit ProviderID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#CRproID#</b>
		</td>
	</tr>

	    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Substitution Rate
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_subrates# NEQ "1">
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
	<!--- if  president   needs to modify - no email 	<cfset url.uid1=59>--->
<cfelse>
<cfif not isDefined("url.uid1")>
	<cfset url.uid1=#url.uid#>
</cfif>

<!--- <cfoutput>full servise query=#FullService#</cfoutput>	 --->
<CFQUERY datasource="#request.dsn#" name="get_team_info">
Select * from Teams where name like 'Inactive%'
</CFQUERY>
<cfset inactive_id = get_team_info.ID>

<cfif form.a_status eq 1>
<cfif form.team_id eq inactive_id>
<CFQUERY datasource="#request.dsn#" name="get_info">
Select * from Companies where ID = #cmpid#
</CFQUERY>
<cfset team_id = get_info.prev_team_id>
<cfelse>
<CFQUERY datasource="#request.dsn#" name="get_info">
Select * from Companies where ID = #cmpid#
</CFQUERY>
<cfset team_id = form.team_id>
</cfif>
<cfelse>
<cfset team_id = inactive_id>
</cfif>
<CFQUERY datasource="#request.dsn#">
			UPDATE companies
			SET company = '#company#',
			    a_user = '#a_user#',
				a_pass = '#a_pass#',
				phone = '#phone#',
				fax = '#fax#',
				addr1 = '#addr1#',
				addr2 = '#addr2#',
				city = '#city#',
				state = '#state#',
				zip_code = '#zip_code#',
				email = '#email#',
				a_note_1 = '#a_note_1#',
				a_date_mod = '#DateFormat(Now(), "mm/dd/yy")#',
				a_time_mod = '#TimeFormat(Now(), "HH:mm:ss")#',
				a_status = '#a_status#',
				comment = '#comment#',
				a_uid_mod = '#URL.uid1#',
				intCustServ = '#intCustServ#',
				intSales = '#intSales#',
				blnCommit = '#commit#',
				blnFullServ = '#FullService#',
				blnClearc = '#clearc#',
				blnPayoff = '#payoff#',
				blnDisbursements = '#disbursements#',
				blnRecording = '#recording#',
				blnAppraisal = '#appraisal#',
				blnSigning = '#signing#',
				blnShipping = '#shipping#',
				FeeVestingLegal = #lstVesting#,
				FeeCurrentOwner = #lstOwner#,
				FeeFullSearch = #lstFullSearch#,
				FeePolicyOnly = #lstCommitOnly#,
				FeeSigning = #lstSigning#,
				FeeRecording = #FeeRecording#,
				FeeAppraisal = #lstAppraisal#,
        		companies_switch = #companies_switch#,
				proposed_monthly_transactions = '#proposed_monthly_transactions#',
				master_co_id = '#master_co#',
				contact_fname = '#contact_fname#',
				contact_lname = '#contact_lname#',
				auto_email_opt_out = #auto_email_opt_out#,
				team_id = '#team_id#',
				<cfif form.a_status eq 1 and form.team_id neq inactive_id>
				prev_team_id = '#team_id#',
				</cfif>
				AVMproduct = '#AVMproduct#',
				AVMclientID = '#AVMclientID#',
				AVMproID = '#AVMproID#',
				Basic = '#Basic#',
				Census = '#Census#',
				Life = '#Life#',
				LifeCensus = '#LifeCensus#',
				FclientID = '#FclientID#',
				FproID = '#FproID#',
				Infile = '#Infile#',
				Reissue = '#Reissue#',
				Safe = '#Safe#',
				CRclientID = '#CRclientID#',
				CRproID = '#CRproID#',
				special_inst = '#special_inst#',
				special_abs_inst = '#special_abs_inst#',
				enhanced_coverage = #enhanced_coverage#,
				allow_subrates = #allow_subrates#,
				streamline_client = '#form.streamline_client#',
				attach_icl = '#form.attach_icl#',
				attach_eando = '#form.attach_eando#',
				custom_rate_table = '#custom_rate_table#'
			WHERE ID = #cmpid#
		</CFQUERY>



<cfif read_company.a_status eq 0 and read_company.auto_email_opt_out eq 0 and form.a_status eq 1>
<cfif read_company.ID eq 2368 or read_company.master_co_id eq 2368>
<cfinclude template="../auto_emails/new_streamline_account.cfm">
<cfelse>
<cfinclude template="../auto_emails/new_account.cfm">
<HTML><HEAD></cfif>
</cfif>
<!--- update complete!!! --->


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
			<B>#company#</B>
		</td>
	</tr>
	<cfif master_co NEQ 0>
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
			Custom Rate Table
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#custom_rate_table#</B>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Contact First Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#contact_fname#</B>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Contact Last Name
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#contact_lname#</B>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=blue face=arial>
			Username - </b>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=red face=arial>
			<b>#a_user#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<b><font size=2 color=blue face=arial>
			Password - </b>
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=red face=arial>
			<b>#a_pass#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address1 -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#addr1#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address2 -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#addr2#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Note -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#a_note_1#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			City -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#city#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			State -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#state#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Zip Code -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#zip_CODE#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Phone -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#phone#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fax -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#fax#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Email -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#email#</b>
		</td>
	</tr>
<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Proposed Monthly Transactions -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#proposed_monthly_transactions#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Customer Service -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<CFIF #intCustServ# neq "" AND #intCustServ# neq "null">
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
			<CFIF get_teams.id eq #team_id#>
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
			<CFIF #intSales# neq "" AND #intSales# neq "null">
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
					<CFIF #a_status# EQ "0">
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
					<CFIF #companies_switch# NEQ "1">
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
					<CFIF #auto_email_opt_out# EQ "0">
						<font size=2 color=red face=arial><B>Yes</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>No</B></FONT>
					</CFIF>
		</td>
	</tr>
	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Streamline Client
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.streamline_client# EQ "True">
						<font size=2 color=red face=arial><B>Yes</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>No</B></FONT>
					</CFIF>
		</td>
	</tr>
	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Attach ICL
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.attach_icl# EQ "True">
						<font size=2 color=red face=arial><B>Yes</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>No</B></FONT>
					</CFIF>
		</td>
	</tr>
	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Attach E & O
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.attach_eando# EQ "True">
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
			<b>#Comment#</b>
		</td>
	</tr>
		<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Enhanced T.I. Coverage
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b><cfif enhanced_coverage eq 1>Yes<cfelse>No</cfif></b>
		</td>
	</tr>
<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Special Instructions
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#special_inst#</b>
		</td>
	</tr>
	<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Special Abstractors Instructions
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#special_abs_inst#</b>
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
			 	<CFIF #read_company.blnCommit# eq 1>
					Insurance Commitment Policy<BR>
				</CFIF>
				<CFIF #read_company.blnFullServ# eq 1>
					Full Closing Services<BR>
				</CFIF>
				<CFIF #read_company.blnClearc# eq 1>
					Clearc<BR>
				</CFIF>
				<CFIF #read_company.blnPayoff# eq 1>
					Payoff<BR>
				</CFIF>
				<CFIF #read_company.blnDisbursements# eq 1>
					Disbursements<BR>
				</CFIF>
				<CFIF #read_company.blnRecording# eq 1>
					Recording<BR>
				</CFIF>
                <CFIF #read_company.blnAppraisal# eq 1>
					Appraisal<BR>
				</CFIF>
                <CFIF #read_company.blnSigning# eq 1>
					Signing Services<BR>
				</CFIF>
				<CFIF #read_company.blnShipping# eq 1>
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
			<CFIF #Len(read_company.FeeVestingLegal)# gte 1 >
				Vesting + Legal #dollarformat(read_company.FeeVestingLegal)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeCurrentOwner)# gte 1 >
				Current Owner #dollarformat(read_company.FeeCurrentOwner)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeFullSearch)# gte 1 >
				Full Search #dollarformat(read_company.FeeFullSearch)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeePolicyOnly)# gte 1 >
				Commit/Policy Only $295 + Policy & &nbsp;&nbsp;&nbsp;Binder #dollarformat(read_company.FeePolicyOnly)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeSigning)# gte 1 >
				National Signing Services  #Dollarformat(read_company.FeeSigning)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeRecording)# gte 1 >
				Recording Services #DollarFormat(read_company.FeeRecording)#<br>
			</CFIF>
			<CFIF #Len(read_company.FeeAppraisal)# gte 1 >
				Appraisal #DollarFormat(read_company.FeeAppraisal)#
			</CFIF>
	</tr>
	<!--- <tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			RealEC ClientID
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#realECclientID#</b>
		</td>
	</tr>
<tr>
		<td width=130  align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM Product
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#avmproduct#</b>
		</td>
	</tr> --->
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#AVMproduct#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM ClientID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#AVMclientID#</b>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			AVM ProviderID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#AVMproID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Flood Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial><b>
		    <CFIF #read_company.Basic# is "Basic">
                Basic Certification<BR>
            </CFIF>
            <CFIF #read_company.Census# is "Census">
              Basic Certification with Census Information<BR>
            </CFIF>
            <CFIF #read_company.Life# is "Life">
               Life of Loan Certification<BR>
            </CFIF>
			<CFIF #read_company.LifeCensus# is "LifeCensus">
               Life of Loan Certification with Census Information<BR>
            </CFIF>
			</b></font>
		</td>

	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Flood ClientID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FclientID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Flood ProviderID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#FproID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Credit Product -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial><b>
			 	<CFIF#read_company.Infile# is "Infile">
					Infile Report<BR>
				</CFIF>
				<CFIF #read_company.Reissue# is "Reissue">
					Re-Issue<BR>
				</CFIF>
				<CFIF #read_company.Safe# is "Safe">
					SAFE (1 Bureau In File)<BR>
				</CFIF>

			</b></font>
		</td>

	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Credit ClientID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#CRclientID#</b>
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Credit ProviderID -
		</td>
		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>#CRproID#</b>
		</td>
	</tr>


    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Substitution Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_subrates# NEQ "1">
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

</cfif>


