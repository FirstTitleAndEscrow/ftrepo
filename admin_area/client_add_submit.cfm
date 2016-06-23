<!--- set all new clients to team ID 5 --->
<cfparam name="form.team_id" default="5">
<cfparam name="form.custom_rate_table" default="">
<CFPARAM NAME="form.enhanced_coverage" DEFAULT="1">
<CFPARAM NAME="form.allow_subrates" DEFAULT="0">
<CFPARAM NAME="form.allow_reissue_rates" DEFAULT="0">
<CFPARAM NAME="form.allow_chicago_rates" DEFAULT="0">
<CFPARAM NAME="form.allow_chicago_rates2" DEFAULT="0">
<CFPARAM NAME="form.streamline_client" DEFAULT="0">
<CFPARAM NAME="form.chase_acct" DEFAULT="0">
<CFPARAM NAME="form.attach_icl" DEFAULT="0">
<CFPARAM NAME="form.attach_eando" DEFAULT="0">
<CFPARAM NAME="form.a_pass" DEFAULT="">
<CFPARAM NAME="form.fairfax_client" DEFAULT="0">
<CFPARAM NAME="newname" DEFAULT="56">


<CFQUERY datasource="#request.dsn#" NAME="check_companies">
		SELECT *
		FROM Companies
		WHERE a_user = '#form.a_user#'

</CFQUERY>



<cfif check_companies.recordcount>
<script language="javascript">
alert("That UserName is already in use, please choose another");
history.go(-1);
</script>
<cfabort>
</cfif>


<CFPARAM NAME="master_co" DEFAULT=0>
<CFPARAM NAME="custom_rate_table" DEFAULT="">
<CFPARAM NAME="auto_email_opt_out" DEFAULT=0>
<CFPARAM NAME="phone" DEFAULT="">
<CFPARAM NAME="proposed_monthly_transactions" DEFAULT="">
<CFPARAM NAME="fax" DEFAULT="">
<CFPARAM NAME="addr1" DEFAULT="">
<CFPARAM NAME="addr2" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="zip_code" DEFAULT="">
<CFPARAM NAME="email" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_pass" DEFAULT="">
<CFPARAM NAME="uid" DEFAULT="">
<CFPARAM NAME="pwd" DEFAULT="">
<CFPARAM NAME="st_abbrev" DEFAULT="">
<CFPARAM NAME="ft_agencies" DEFAULT="">
<CFPARAM NAME="a_comment" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="status" DEFAULT="">
<CFPARAM NAME="sales" DEFAULT="InHouse">
<CFPARAM NAME="companies_switch" DEFAULT="0">
<CFPARAM NAME="commit" DEFAULT="off">
<CFPARAM NAME="fullservice" DEFAULT="off">
<CFPARAM NAME="clearc" DEFAULT="off">
<CFPARAM NAME="payoff" DEFAULT="off">
<CFPARAM NAME="disbursements" DEFAULT="off"> 
<CFPARAM NAME="recording" DEFAULT="off">
<CFPARAM NAME="shipping" DEFAULT="off">
<CFPARAM NAME="appraisal" DEFAULT="off">
<CFPARAM NAME="signing" DEFAULT="off">
<CFPARAM NAME="Infile" DEFAULT="">
<CFPARAM NAME="Reissue" DEFAULT="">
<CFPARAM NAME="Safe" DEFAULT="">
<CFPARAM NAME="Basic" DEFAULT="">
<CFPARAM NAME="Census" DEFAULT="">
<CFPARAM NAME="Life" DEFAULT="">
<CFPARAM NAME="LifeCensus" DEFAULT="">

<cfif master_co neq 0>
<CFQUERY datasource="#request.dsn#" NAME="get_master_co">
		SELECT *
		FROM Companies
		WHERE ID = '#master_co#'
</CFQUERY>
</cfif>


<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>

	<cfif #uid# eq 92> <!---Noone--->
	<CFSET status = 2>
	<cfelseif #uid# eq 93><!---Cindy Mills--->
	<cfset status = 3>
	<cfelseif #uid# eq 167><!---Nita Farrow--->
	<cfset status = 4>
		<cfelseif #uid# eq 185><!---Cindy Miropol--->
	<cfset status = 5>
	<cfelse>
	<cfset status = 1>
	</cfif>
<!---Set boolean values equal to numerical values--->

<CFIF #commit# eq "ON">
    <CFSet #commit# = "1">
<CFELSE>
    <CFSet #commit# = "0">
</CFIF>   
<CFIF #fullservice# eq "ON">
    <CFSet #fullservice# = "1">
<CFELSE>
    <CFSet #fullservice# = "0">
</CFIF>
<CFIF #clearc# eq "ON">
    <CFSet #clearc# = "1">
<CFELSE>
    <CFSet #clearc# = "0">
</CFIF>
<CFIF #payoff# eq "ON">
    <CFSet #payoff# = "1">
<CFELSE>
    <CFSet #payoff# = "0">
</CFIF>           
<CFIF #disbursements# eq "ON">
    <CFSet #disbursements# = "1">
<CFELSE>
    <CFSet #disbursements# = "0">
</CFIF>          
<CFIF #recording# eq "ON">
    <CFSet #recording# = "1">
    <CFSet #FeeRecording# = "60">
<CFELSE>
    <CFSet #recording# = "0">
    <CFSet #FeeRecording# = "NULL">
</CFIF>      
<CFIF #shipping# eq "ON">
    <CFSet #shipping# = "1">
<CFELSE>
    <CFSet #shipping# = "0">
</CFIF> 
<CFIF #appraisal# eq "ON">
    <CFSet #appraisal# = "1">
<CFELSE>
    <CFSet #appraisal# = "0">
</CFIF>
<CFIF #signing# eq "ON">
    <CFSet #signing# = "1">
<CFELSE>
    <CFSet #signing# = "0">
</CFIF>    

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
            

<!---Read current User --->
<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM First_Admin
		WHERE ID = '#URL.UID#'
</CFQUERY>

<CFIF #read_user.role_id# eq 24>
	<CFSET NewName2 = #URL.UID# > 
</CFIF>

<!--- <cfoutput>NewName: #NewName#, NewName2: #NewName2#</cfoutput>
<cfabort> --->
<!--- if VA Employee is setting up new client, auto-assign to Team R --->
<cfif IsDefined("session.va_employee") and session.va_employee eq 1 and session.ft_user_id neq 430>
<cfset form.team_id = 36>
</cfif>

<CFQUERY datasource="#request.dsn#">
	INSERT INTO companies(company, contact_fname, contact_lname, phone, fax, addr1, addr2, city, state, zip_code, email, a_time, a_date, a_note_1, a_comment, a_uid, a_status, a_user, a_pass, status,intCustServ,intSales,companies_switch,blnCommit,blnFullServ,blnClearc,blnPayoff,blnDisbursements,blnRecording,blnShipping,FeeVestingLegal,FeeCurrentOwner,FeeFullSearch,FeePolicyOnly,FeeSigning,FeeAppraisal,FeeRecording,master_co_id, proposed_monthly_transactions , auto_email_opt_out, team_id, test_account,AVMproduct,AVMclientID,AVMproID,Basic,Census,Life,LifeCensus,FclientID,FproID,Safe,Reissue,Infile,CRclientID,CRproID, enhanced_coverage, allow_subrates, allow_reissue_rates, allow_chicago_rates, allow_chicago_rates2, chase_acct, streamline_client, attach_icl, attach_eando, custom_rate_table, fairfax_client)
	VALUES('#URL.company#', '#contact_fname#', '#contact_lname#', '#phone#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip_code#', '#email#', '#c_time#', '#c_date#', '#a_note_1#', '#a_comment#', '#UID#', 1, '#a_user#', '#form.a_pass#', '#status#',56,#NewName2#,#companies_switch#,#commit#,#fullservice#,#clearc#,#Payoff#,#Disbursements#,#Recording#,#Shipping#,#lstVesting#,#lstOwner#,#lstFullSearch#,#lstCommitOnly#,#lstSigning#,#lstAppraisal#,#FeeRecording#,#master_co#, '#proposed_monthly_transactions#', #auto_email_opt_out#, #form.team_id#, <cfif form.team_id eq 11>1<cfelse>0</cfif>,'#AVMproduct#','#AVMclientID#','#AVMproID#','#Basic#','#Census#','#Life#','#LifeCensus#','#FclientID#','#FproID#','#Safe#','#Reissue#','#Infile#','#CRclientID#','#CRproID#', #enhanced_coverage#, #form.allow_subrates#, #form.allow_reissue_rates#, #form.allow_chicago_rates#, #form.allow_chicago_rates2#, #form.chase_acct#, #form.streamline_client#, #form.attach_icl#, #form.attach_eando#, '#custom_rate_table#', #form.fairfax_client#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="Read_ID">
	SELECT *
	FROM companies
	WHERE a_time = '#c_time#' AND a_date = '#c_date#'
</CFQUERY>


<CFQUERY datasource="#request.dsn#" >
insert into Loan_Officers (a_status, comp_id, lo_phone, lo_fax, lo_fname, lo_lname, lo_email, oname)
values
(1, '#Read_ID.ID#', '#phone#', '#fax#', '#contact_fname#', '#contact_lname#', '#email#', '#contact_fname# #contact_lname#')
</CFQUERY>

<CFQUERY datasource="#request.dsn#" >
insert into Users (a_status, comp_id, lp_phone, lp_fax, lp_fname, lp_lname, lp_email, pname)
values
(1, '#Read_ID.ID#', '#phone#', '#fax#', '#contact_fname#', '#contact_lname#', '#email#', '#contact_fname# #contact_lname#')
</CFQUERY>





<CFINCLUDE TEMPLATE="../client_line_costs_add_submit3.cfm">


<CFQUERY datasource="#request.dsn#" NAME="Read_ID">
	SELECT *
	FROM companies
	WHERE a_time = '#c_time#' AND a_date = '#c_date#'
</CFQUERY>

<CFINCLUDE TEMPLATE="../client_line_costs_add_submit2010_3.cfm">

<cfset form.uid = UID>
<cfif auto_email_opt_out eq 0>
<cfinclude template="../auto_emails/new_account.cfm">
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="Read_CustomerService">	
	Select fname + ' ' + lname AS Name
	FROM   First_Admin where id = #newname#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="Read_CustomerServiceTeam">	
	Select name from Teams
	where id = #team_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="Read_Sales">	
	Select fname + ' ' + lname AS Name
	FROM   First_Admin where id = #newname2#
</CFQUERY>

<!---I have no idea what these next two sections are for--->		
<CFQUERY datasource="#request.dsn#" NAME="Read_user">
	SELECT *
	FROM first_admin
	WHERE ID = 1 or ID = 2 or ID = 3 or ID = 4 or ID = 5 or ID = 6 or ID = 7 or ID = 8 or ID = 9 or ID = 10 or ID = 11 or ID = 12
</CFQUERY>
		
<cfoutput query="read_user">
	<CFQUERY datasource="#request.dsn#">
		INSERT INTO User_Client_Assoc (id, company_ID, company_name)
			VALUES(#id#, #Read_ID.id#, '#Read_ID.company#')		
	</CFQUERY>	
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="get_sales">
	SELECT *
	FROM First_admin
	WHERE id = #read_id.intsales#
</CFQUERY>


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
								<td width=498 align=left valign=top bgcolor=white>
											<font size=2 color=black face=arial>Add Mortgage Client/Customer
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
								<td width=130 align=left valign=top bgcolor=green>
									<FONT SIZE=2 color=white face=arial>
									The Client has been sucessfully added to the database.		
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
												<font size=2 color=blue face=verdana>
												<B>#URL.company#</B>
											</td>
										</tr>
										<cfif master_co neq 0>
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Master Company
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=verdana>
												<B>#get_master_co.company#</B>
											</td>
										</tr>
										</cfif>
											<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Custom Rate Table
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=verdana>
												<B>#custom_rate_table#</B>
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
										
										<!--- <tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												realEC ClientID -
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<b>#realECclientID#</b>
											</td>
										</tr>
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												AVM Product - 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<b>#avmproduct#</b>
											</td>
										</tr> --->
										
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
												Enhanced T.I. Coverage 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<b><cfif form.enhanced_coverage eq 1>Yes<cfelse>No</cfif></b>
											</td>
										</tr>
										
										
                                        <tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Required Services - 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #commit# eq "1">
                                                    Insurance Commitment Policy<BR>
                                                </CFIF>    
                                                <CFIF #fullservice# eq "1">
                                                    Full Closing Services<BR>
                                                </CFIF>
                                                <CFIF #clearc# eq "1">
                                                    Clearc<BR>
                                                </CFIF>
                                                <CFIF #payoff# eq "1">
                                                    Payoff<BR>
                                                </CFIF>
                                                <CFIF #disbursements# eq "1">
                                                    Disbursements<BR>
                                                </CFIF>
                                                <CFIF #recording# eq "1">
                                                    Recording<BR>
                                                </CFIF>
                                                <CFIF #shipping# eq "1">
                                                    Shipping<BR>
                                                </CFIF>
                                                <CFIF #appraisal# eq "1">
                                                    Appraisal<BR>
                                                </CFIF>
                                                <CFIF #signing# eq "1">
                                                    Signing Services Only<BR>
                                                </CFIF>
                                            </td>
										</tr>
										<tr>
                                            <td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Fees - 
											</td>
                                            <td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #lstVesting# neq "null">
                                                    Vesting + Legal #lstVesting#<BR>
                                                </CFIF>
                                                <CFIF #lstOwner# neq "null">
                                                    Current Owner #lstOwner#<BR>
                                                </CFIF>
                                                <CFIF #lstFullSearch# neq "null">
                                                    Full Search #lstFullSearch#<BR>
                                                </CFIF>
                                                <CFIF #lstCommitOnly# neq "null">
                                                    Commit/Policy Only $295 + Policy & Binder #lstCommitOnly#<BR>
                                                </CFIF>
                                                <CFIF #lstSigning# neq "null">
                                                    National Signing Services #lstSigning#<BR>
                                                </CFIF>
                                                <CFIF #lstAppraisal# neq "null">
                                                    Appraisal #lstAppraisal#<BR>
                                                </CFIF>
                                                </font>
											</td>
                                        </tr>
                                        
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
											<td width=237 align=left valign=top bgcolor=e6e6e6 >	
												<font size=2 color=blue face=arial><b>
											    <CFIF #Basic# is "Basic">
                                                    Basic Certification<BR>
                                                </CFIF>    
                                                <CFIF #Census# is "Census">
                                                  Basic Certification with Census Information<BR>
                                                </CFIF>
                                                <CFIF #Life# is "Life">
                                                   Life of Loan Certification<BR>
                                                </CFIF>
												<CFIF #LifeCensus# is "LifeCensus">
                                                   Life of Loan Certification with Census Information<BR>
                                                </CFIF></b></font>
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
												<CFIF #Infile# is "Infile">
                                                    Infile Report<BR>
                                                </CFIF>    
                                                <CFIF #Reissue# is "Reissue">
                                                   Re-Issue<BR>
                                                </CFIF>
                                                <CFIF #Safe# is "Safe">
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
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Comments :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<B>#a_comment#</B>
											</td>
										</tr>
										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Customer Service :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<B>#Read_CustomerService.Name#</B>
											</td>
										</tr>
										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Customer Service Team:
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<B>#Read_CustomerServiceTeam.Name#</B>
											</td>
										</tr>
										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Salesperson :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<B>#Read_Sales.Name#</B>
											</td>
										</tr>
                                        <tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Allow Employee Authentication :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #companies_switch# eq "1">
                                                    <B>Yes</B>
                                                <CFELSE>
                                                    <B>NO</B>
                                                </CFIF>    
											</td>
										</tr>
										
										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Send Automatic Reminder/Thank You Emails :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #auto_email_opt_out# eq "0">
                                                    <B>Yes</B>
                                                <CFELSE>
                                                    <B>NO</B>
                                                </CFIF>    
											</td>
										</tr>


										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Allow Substitution Rate :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #form.allow_subrates# eq "0">
                                                    <B>NO</B>
                                                <CFELSE>
                                                    <B>YES</B>
                                                </CFIF>    
											</td>
										</tr>

										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Allow Reissue Rate :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #form.allow_reissue_rates# eq "0">
                                                    <B>NO</B>
                                                <CFELSE>
                                                    <B>YES</B>
                                                </CFIF>    
											</td>
										</tr>

										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Allow Chicago Bucket Rate :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #form.allow_chicago_rates# eq "0">
                                                    <B>NO</B>
                                                <CFELSE>
                                                    <B>YES</B>
                                                </CFIF>    
											</td>
										</tr>

										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Allow Chicago LOCAL Rate :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #form.allow_chicago_rates2# eq "0">
                                                    <B>NO</B>
                                                <CFELSE>
                                                    <B>YES</B>
                                                </CFIF>    
											</td>
										</tr>

										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Chase Acct :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #form.chase_acct# eq "0">
                                                    <B>NO</B>
                                                <CFELSE>
                                                    <B>YES</B>
                                                </CFIF>    
											</td>
										</tr>


										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Streamline Client :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #form.streamline_client# eq "0">
                                                    <B>NO</B>
                                                <CFELSE>
                                                    <B>YES</B>
                                                </CFIF>    
											</td>
										</tr>
										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Fairfax Client :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #form.fairfax_client# eq "0">
                                                    <B>NO</B>
                                                <CFELSE>
                                                    <B>YES</B>
                                                </CFIF>    
											</td>
										</tr>
										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Attach ICL :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #form.attach_icl# eq "0">
                                                    <B>NO</B>
                                                <CFELSE>
                                                    <B>YES</B>
                                                </CFIF>    
											</td>
										</tr>


										<tr>
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=gray face=arial>
												Attach E & O :
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=arial>
												<CFIF #form.attach_eando# eq "0">
                                                    <B>NO</B>
                                                <CFELSE>
                                                    <B>YES</B>
                                                </CFIF>    
											</td>
										</tr>
                                        
										
</CFOUTPUT>				
								</table>
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


	                                                                                                                                                                                                              