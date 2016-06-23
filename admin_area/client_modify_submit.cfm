<cfparam name="url.client_approval" default="0">
<cfparam name="session.ft_user_id" default="0">
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
<CFPARAM NAME="custom_rate_table" DEFAULT="">
<CFPARAM NAME="intCustServ" DEFAULT="">
<CFPARAM NAME="intSales" DEFAULT="">
<CFPARAM NAME="companies_switch" DEFAULT="">
<CFPARAM NAME="fairfax_client" DEFAULT="">
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
<CFPARAM NAME="allow_reissue_rates" DEFAULT="0">
<CFPARAM NAME="allow_chicago_rates" DEFAULT="0">
<CFPARAM NAME="allow_chicago_rates2" DEFAULT="0">
<CFPARAM NAME="use_apr" DEFAULT="0">

<CFPARAM NAME="Infile" DEFAULT="">
<CFPARAM NAME="Reissue" DEFAULT="">
<CFPARAM NAME="Safe" DEFAULT="">
<CFPARAM NAME="Basic" DEFAULT="">
<CFPARAM NAME="Census" DEFAULT="">
<CFPARAM NAME="Life" DEFAULT="">
<CFPARAM NAME="LifeCensus" DEFAULT="">
<CFPARAM NAME="streamline_client" DEFAULT="False">
<CFPARAM NAME="chase_acct" DEFAULT="False">
<CFPARAM NAME="attach_icl" DEFAULT="0">
<CFPARAM NAME="icl_address" DEFAULT="0">
<CFPARAM NAME="attach_eando" DEFAULT="0">

<cfparam name="Bankruptcy_reg" default="">
<cfparam name="FHA_reg" default="">
<cfparam name="VA_reg" default="">
<cfparam name="CONV_reg" default="">
<cfparam name="FHLMC_reg" default="">
<cfparam name="FNMA_reg" default="">
<cfparam name="Updates_reg" default="">
<cfparam name="FHA_HUD_reg" default="">
<cfparam name="Vet_Aff_reg" default="">

<cfparam name="Bankruptcy_MD" default="">
<cfparam name="FHA_MD" default="">
<cfparam name="VA_MD" default="">
<cfparam name="CONV_MD" default="">
<cfparam name="FHLMC_MD" default="">
<cfparam name="FNMA_MD" default="">
<cfparam name="Updates_MD" default="">
<cfparam name="FHA_HUD_MD" default="">
<cfparam name="Vet_Aff_MD" default="">

<cfparam name="Bankruptcy_DC" default="">
<cfparam name="FHA_DC" default="">
<cfparam name="VA_DC" default="">
<cfparam name="CONV_DC" default="">
<cfparam name="FHLMC_DC" default="">
<cfparam name="FNMA_DC" default="">
<cfparam name="Updates_DC" default="">
<cfparam name="FHA_HUD_DC" default="">
<cfparam name="Vet_Aff_DC" default="">

<cfparam name="Bankruptcy_VA" default="">
<cfparam name="FHA_VA" default="">
<cfparam name="VA_VA" default="">
<cfparam name="CONV_VA" default="">
<cfparam name="FHLMC_VA" default="">
<cfparam name="FNMA_VA" default="">
<cfparam name="Updates_VA" default="">
<cfparam name="FHA_HUD_VA" default="">
<cfparam name="Vet_Aff_VA" default="">


<cfparam name="DocRetrieval_reg" default="">
<cfparam name="DocRetrieval_MD" default="">
<cfparam name="DocRetrieval_DC" default="">
<cfparam name="DocRetrieval_VA" default="">

<cfparam name="DIL_reg" default="">
<cfparam name="DIL_MD" default="">
<cfparam name="DIL_DC" default="">
<cfparam name="DIL_VA" default="">

<cfparam name="Recissions_reg" default="">
<cfparam name="Recissions_MD" default="">
<cfparam name="Recissions_DC" default="">
<cfparam name="Recissions_VA" default="">
<cfparam name="client_commitment" default="0">
<cfparam name="form.exclude_states" default="0">


<cfparam name="alta_8_1" default="">
<cfparam name="alta_9" default="">

<cfif url.client_approval eq 0 and session.ft_user_id neq 59 and session.ft_user_id neq 58 and session.ft_user_id neq 450>
<CFQUERY datasource="#request.dsn#" name="read_before">
Select * from Companies where ID = #cid#
</CFQUERY>

<cfset insert_date_time = createODBCDateTime(Now())>
<CFQUERY datasource="#request.dsn#" name="insert_before">
INSERT INTO Companies_Mod_Tracker
(comp_id,company,comp_code,a_date,a_time,a_uid,a_date_mod,a_time_mod,a_uid_mod,a_status,comment,a_1101,a_1102,a_1103,a_1104,a_1105,a_1106,a_1107,a_1111,a_1112,a_1113,a_1205,a_1303,a_1304,a_1305,a_states,phone,fax,addr1,addr2,zip_code,email,a_note_1,a_comment,city,state,a_user,a_pass,t_status,status,intCustServ,intSales,blnReport,blnCommit,blnFullServ,blnClearc,blnPayoff,blnDisbursements,blnRecording,blnAppraisal,blnSigning,blnShipping,FeeVestingLegal,FeeCurrentOwner,FeeFullSearch,FeePolicyOnly,FeeSigning,FeeRecording,FeeAppraisal,Companies_Switch,master_co_id,proposed_monthly_transactions,contact_fname,contact_lname,sent_six_day_email,sent_thirty_day_email,last_order_date,auto_email_opt_out,sign_up_date,test_account,team_id,prev_team_id,realECclientID,avmproduct,AVMclientID,AVMproID,Basic,Census,Life,LifeCensus,FclientID,FproID,Infile,Reissue,Safe,CRclientID,CRproID,special_inst,calyx_refer,calyx_refer_other,extention,position,special_abs_inst,encompass_refer,encompass_refer_other,encompass_gfe_confirm,encompass_confirm_date,send_this,branch_id,enhanced_coverage,allow_subrates,allow_reissue_rates,allow_chicago_rates,allow_chicago_rates2,use_apr,child_ids,refer,refer_other,interested_in_services,chase_acct,streamline_client,attach_icl,icl_address,attach_eando,wipro_gfe_confirm,wipro_confirm_date,custom_rate_table,streamline_controls,send_post_close_survey,change_date_time,before_or_after,Bankruptcy_reg,FHA_reg,VA_reg,CONV_reg,FHLMC_reg,FNMA_reg,Updates_reg,FHA_HUD_reg,Vet_Aff_reg,Bankruptcy_MD,FHA_MD,VA_MD,CONV_MD,FHLMC_MD,FNMA_MD,Updates_MD,FHA_HUD_MD,Vet_Aff_MD,Bankruptcy_DC,FHA_DC,VA_DC,CONV_DC,FHLMC_DC,FNMA_DC,Updates_DC,FHA_HUD_DC,Vet_Aff_DC,Bankruptcy_VA,FHA_VA,VA_VA,CONV_VA,FHLMC_VA,FNMA_VA,Updates_VA,FHA_HUD_VA,Vet_Aff_VA,fairfax_client, DocRetrieval_reg, DocRetrieval_MD, DocRetrieval_DC, DocRetrieval_VA, DIL_reg, DIL_MD, DIL_DC, DIL_VA, Recissions_reg, Recissions_MD, Recissions_DC, Recissions_VA, alta_8_1, alta_9, client_commitment, exclude_states)
VALUES
('#read_before.ID#','#read_before.company#','#read_before.comp_code#',#read_before.a_date#,'#read_before.a_time#','#read_before.a_uid#','#read_before.a_date_mod#','#read_before.a_time_mod#','#read_before.a_uid_mod#','#read_before.a_status#','#read_before.comment#','#read_before.a_1101#','#read_before.a_1102#','#read_before.a_1103#','#read_before.a_1104#','#read_before.a_1105#','#read_before.a_1106#','#read_before.a_1107#','#read_before.a_1111#','#read_before.a_1112#','#read_before.a_1113#','#read_before.a_1205#','#read_before.a_1303#','#read_before.a_1304#','#read_before.a_1305#','#read_before.a_states#','#read_before.phone#','#read_before.fax#','#read_before.addr1#','#read_before.addr2#','#read_before.zip_code#','#read_before.email#','#read_before.a_note_1#','#read_before.a_comment#','#read_before.city#','#read_before.state#','#read_before.a_user#','#read_before.a_pass#','#read_before.t_status#','#read_before.status#','#read_before.intCustServ#','#read_before.intSales#','#read_before.blnReport#','#read_before.blnCommit#','#read_before.blnFullServ#','#read_before.blnClearc#','#read_before.blnPayoff#','#read_before.blnDisbursements#','#read_before.blnRecording#','#read_before.blnAppraisal#','#read_before.blnSigning#','#read_before.blnShipping#','#read_before.FeeVestingLegal#','#read_before.FeeCurrentOwner#','#read_before.FeeFullSearch#','#read_before.FeePolicyOnly#','#read_before.FeeSigning#','#read_before.FeeRecording#','#read_before.FeeAppraisal#','#read_before.Companies_Switch#','#read_before.master_co_id#','#read_before.proposed_monthly_transactions#','#read_before.contact_fname#','#read_before.contact_lname#','#read_before.sent_six_day_email#','#read_before.sent_thirty_day_email#','#read_before.last_order_date#','#read_before.auto_email_opt_out#','#read_before.sign_up_date#','#read_before.test_account#','#read_before.team_id#','#read_before.prev_team_id#','#read_before.realECclientID#','#read_before.avmproduct#','#read_before.AVMclientID#','#read_before.AVMproID#','#read_before.Basic#','#read_before.Census#','#read_before.Life#','#read_before.LifeCensus#','#read_before.FclientID#','#read_before.FproID#','#read_before.Infile#','#read_before.Reissue#','#read_before.Safe#','#read_before.CRclientID#','#read_before.CRproID#','#read_before.special_inst#','#read_before.calyx_refer#','#read_before.calyx_refer_other#','#read_before.extention#','#read_before.position#','#read_before.special_abs_inst#','#read_before.encompass_refer#','#read_before.encompass_refer_other#','#read_before.encompass_gfe_confirm#','#read_before.encompass_confirm_date#','#read_before.send_this#','#read_before.branch_id#','#read_before.enhanced_coverage#','#read_before.allow_subrates#','#read_before.allow_reissue_rates#','#read_before.allow_chicago_rates#', '#read_before.allow_chicago_rates2#','#read_before.use_apr#','#read_before.child_ids#','#read_before.refer#','#read_before.refer_other#','#read_before.interested_in_services#','#read_before.chase_acct#','#read_before.streamline_client#','#read_before.attach_icl#','#read_before.icl_address#','#read_before.attach_eando#','#read_before.wipro_gfe_confirm#','#read_before.wipro_confirm_date#','#read_before.custom_rate_table#','#read_before.streamline_controls#','#read_before.send_post_close_survey#',#insert_date_time#, 'before','#Bankruptcy_reg#','#FHA_reg#','#VA_reg#','#CONV_reg#','#FHLMC_reg#','#FNMA_reg#','#Updates_reg#','#FHA_HUD_reg#','#Vet_Aff_reg#','#Bankruptcy_MD#','#FHA_MD#','#VA_MD#','#CONV_MD#','#FHLMC_MD#','#FNMA_MD#','#Updates_MD#','#FHA_HUD_MD#','#Vet_Aff_MD#','#Bankruptcy_DC#','#FHA_DC#','#VA_DC#','#CONV_DC#','#FHLMC_DC#','#FNMA_DC#','#Updates_DC#','#FHA_HUD_DC#','#Vet_Aff_DC#','#Bankruptcy_VA#','#FHA_VA#','#VA_VA#','#CONV_VA#','#FHLMC_VA#','#FNMA_VA#','#Updates_VA#','#FHA_HUD_VA#','#Vet_Aff_VA#','#fairfax_client#', '#DocRetrieval_reg#', '#DocRetrieval_MD#', '#DocRetrieval_DC#', '#DocRetrieval_VA#', '#DIL_reg#', '#DIL_MD#', '#DIL_DC#', '#DIL_VA#', '#Recissions_reg#', '#Recissions_MD#', '#Recissions_DC#', '#Recissions_VA#', '#alta_8_1#', '#alta_9#', '#client_commitment#', '#form.exclude_states#')
</CFQUERY>
</cfif>

<!--- <cfoutput>full servise query=#FullService#</cfoutput>	 --->
<CFQUERY datasource="#request.dsn#" name="get_team_info">
Select * from Teams where name like 'Inactive%'
</CFQUERY>
<cfset inactive_id = get_team_info.ID>
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



<cfif form.a_status eq 1>
<cfif form.team_id eq inactive_id and NOT form.company contains 'test'>
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
				a_uid_mod = '#URL.uid#',
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
				allow_reissue_rates = #allow_reissue_rates#,
				allow_chicago_rates = #allow_chicago_rates#,
				allow_chicago_rates2 = #allow_chicago_rates2#,
				use_apr = #use_apr#,
				chase_acct = '#form.chase_acct#',
				streamline_client = '#form.streamline_client#',
				fairfax_client = '#form.fairfax_client#',
				attach_icl = '#form.attach_icl#',
				icl_address = '#form.icl_address#',
				attach_eando = '#form.attach_eando#',
				Bankruptcy_reg = '#form.Bankruptcy_reg#',
FHA_reg = '#form.FHA_reg#',
VA_reg = '#form.VA_reg#',
CONV_reg = '#form.CONV_reg#',
FHLMC_reg = '#form.FHLMC_reg#',
FNMA_reg = '#form.FNMA_reg#',
Updates_reg = '#form.Updates_reg#',
FHA_HUD_reg = '#form.FHA_HUD_reg#',
Vet_Aff_reg = '#form.Vet_Aff_reg#',
Bankruptcy_MD = '#form.Bankruptcy_MD#',
FHA_MD = '#form.FHA_MD#',
VA_MD = '#form.VA_MD#',
CONV_MD = '#form.CONV_MD#',
FHLMC_MD = '#form.FHLMC_MD#',
FNMA_MD = '#form.FNMA_MD#',
Updates_MD = '#form.Updates_MD#',
FHA_HUD_MD = '#form.FHA_HUD_MD#',
Vet_Aff_MD = '#form.Vet_Aff_MD#',
Bankruptcy_DC = '#form.Bankruptcy_DC#',
FHA_DC = '#form.FHA_DC#',
VA_DC = '#form.VA_DC#',
CONV_DC = '#form.CONV_DC#',
FHLMC_DC = '#form.FHLMC_DC#',
FNMA_DC = '#form.FNMA_DC#',
Updates_DC = '#form.Updates_DC#',
FHA_HUD_DC = '#form.FHA_HUD_DC#',
Vet_Aff_DC = '#form.Vet_Aff_DC#',
Bankruptcy_VA = '#form.Bankruptcy_VA#',
FHA_VA = '#form.FHA_VA#',
VA_VA = '#form.VA_VA#',
CONV_VA = '#form.CONV_VA#',
FHLMC_VA = '#form.FHLMC_VA#',
FNMA_VA = '#form.FNMA_VA#',
Updates_VA = '#form.Updates_VA#',
FHA_HUD_VA = '#form.FHA_HUD_VA#',
Vet_Aff_VA = '#form.Vet_Aff_VA#',
DocRetrieval_reg = '#form.DocRetrieval_reg#',
DocRetrieval_MD = '#form.DocRetrieval_MD#',
DocRetrieval_DC = '#form.DocRetrieval_DC#',
DocRetrieval_VA = '#form.DocRetrieval_VA#',

DIL_reg = '#form.DIL_reg#',
DIL_MD = '#form.DIL_MD#',
DIL_DC = '#form.DIL_DC#',
DIL_VA = '#form.DIL_VA#',

Recissions_reg = '#form.Recissions_reg#',
Recissions_MD = '#form.Recissions_MD#',
Recissions_DC = '#form.Recissions_DC#',
Recissions_VA = '#form.Recissions_VA#',

alta_8_1 = '#form.alta_8_1#',
alta_9 = '#form.alta_9#',
client_commitment = '#client_commitment#',
exclude_states = '#form.exclude_states#',
				custom_rate_table = '#custom_rate_table#'
			WHERE ID = #cmpid#
		</CFQUERY>


<cfif url.client_approval eq 0 and session.ft_user_id neq 59 and session.ft_user_id neq 58 and session.ft_user_id neq 450>
<CFQUERY datasource="#request.dsn#" name="read_before_id">
Select * from Companies_Mod_Tracker where change_date_time = #insert_date_time#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="read_after">
Select * from Companies where ID = #cid#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="insert_before">
INSERT INTO Companies_Mod_Tracker
(comp_id,company,comp_code,a_date,a_time,a_uid,a_date_mod,a_time_mod,a_uid_mod,a_status,comment,a_1101,a_1102,a_1103,a_1104,a_1105,a_1106,a_1107,a_1111,a_1112,a_1113,a_1205,a_1303,a_1304,a_1305,a_states,phone,fax,addr1,addr2,zip_code,email,a_note_1,a_comment,city,state,a_user,a_pass,t_status,status,intCustServ,intSales,blnReport,blnCommit,blnFullServ,blnClearc,blnPayoff,blnDisbursements,blnRecording,blnAppraisal,blnSigning,blnShipping,FeeVestingLegal,FeeCurrentOwner,FeeFullSearch,FeePolicyOnly,FeeSigning,FeeRecording,FeeAppraisal,Companies_Switch,master_co_id,proposed_monthly_transactions,contact_fname,contact_lname,sent_six_day_email,sent_thirty_day_email,last_order_date,auto_email_opt_out,sign_up_date,test_account,team_id,prev_team_id,realECclientID,avmproduct,AVMclientID,AVMproID,Basic,Census,Life,LifeCensus,FclientID,FproID,Infile,Reissue,Safe,CRclientID,CRproID,special_inst,calyx_refer,calyx_refer_other,extention,position,special_abs_inst,encompass_refer,encompass_refer_other,encompass_gfe_confirm,encompass_confirm_date,send_this,branch_id,enhanced_coverage,allow_subrates,allow_reissue_rates,allow_chicago_rates, allow_chicago_rates2,use_apr,child_ids,refer,refer_other,interested_in_services,chase_acct,streamline_client,attach_icl,icl_address,attach_eando,wipro_gfe_confirm,wipro_confirm_date,custom_rate_table,streamline_controls,send_post_close_survey,change_date_time,before_or_after,before_id,Bankruptcy_reg,FHA_reg,VA_reg,CONV_reg,FHLMC_reg,FNMA_reg,Updates_reg,FHA_HUD_reg,Vet_Aff_reg,Bankruptcy_MD,FHA_MD,VA_MD,CONV_MD,FHLMC_MD,FNMA_MD,Updates_MD,FHA_HUD_MD,Vet_Aff_MD,Bankruptcy_DC,FHA_DC,VA_DC,CONV_DC,FHLMC_DC,FNMA_DC,Updates_DC,FHA_HUD_DC,Vet_Aff_DC,Bankruptcy_VA,FHA_VA,VA_VA,CONV_VA,FHLMC_VA,FNMA_VA,Updates_VA,FHA_HUD_VA,Vet_Aff_VA,fairfax_client, DocRetrieval_reg, DocRetrieval_MD, DocRetrieval_DC, DocRetrieval_VA, DIL_reg, DIL_MD, DIL_DC, DIL_VA, Recissions_reg, Recissions_MD, Recissions_DC, Recissions_VA, alta_8_1, alta_9, client_commitment,exclude_states)
VALUES
('#read_after.ID#','#read_after.company#','#read_after.comp_code#',#read_after.a_date#,'#read_after.a_time#','#read_after.a_uid#','#read_after.a_date_mod#','#read_after.a_time_mod#','#read_after.a_uid_mod#','#read_after.a_status#','#read_after.comment#','#read_after.a_1101#','#read_after.a_1102#','#read_after.a_1103#','#read_after.a_1104#','#read_after.a_1105#','#read_after.a_1106#','#read_after.a_1107#','#read_after.a_1111#','#read_after.a_1112#','#read_after.a_1113#','#read_after.a_1205#','#read_after.a_1303#','#read_after.a_1304#','#read_after.a_1305#','#read_after.a_states#','#read_after.phone#','#read_after.fax#','#read_after.addr1#','#read_after.addr2#','#read_after.zip_code#','#read_after.email#','#read_after.a_note_1#','#read_after.a_comment#','#read_after.city#','#read_after.state#','#read_after.a_user#','#read_after.a_pass#','#read_after.t_status#','#read_after.status#','#read_after.intCustServ#','#read_after.intSales#','#read_after.blnReport#','#read_after.blnCommit#','#read_after.blnFullServ#','#read_after.blnClearc#','#read_after.blnPayoff#','#read_after.blnDisbursements#','#read_after.blnRecording#','#read_after.blnAppraisal#','#read_after.blnSigning#','#read_after.blnShipping#','#read_after.FeeVestingLegal#','#read_after.FeeCurrentOwner#','#read_after.FeeFullSearch#','#read_after.FeePolicyOnly#','#read_after.FeeSigning#','#read_after.FeeRecording#','#read_after.FeeAppraisal#','#read_after.Companies_Switch#','#read_after.master_co_id#','#read_after.proposed_monthly_transactions#','#read_after.contact_fname#','#read_after.contact_lname#','#read_after.sent_six_day_email#','#read_after.sent_thirty_day_email#','#read_after.last_order_date#','#read_after.auto_email_opt_out#','#read_after.sign_up_date#','#read_after.test_account#','#read_after.team_id#','#read_after.prev_team_id#','#read_after.realECclientID#','#read_after.avmproduct#','#read_after.AVMclientID#','#read_after.AVMproID#','#read_after.Basic#','#read_after.Census#','#read_after.Life#','#read_after.LifeCensus#','#read_after.FclientID#','#read_after.FproID#','#read_after.Infile#','#read_after.Reissue#','#read_after.Safe#','#read_after.CRclientID#','#read_after.CRproID#','#read_after.special_inst#','#read_after.calyx_refer#','#read_after.calyx_refer_other#','#read_after.extention#','#read_after.position#','#read_after.special_abs_inst#','#read_after.encompass_refer#','#read_after.encompass_refer_other#','#read_after.encompass_gfe_confirm#','#read_after.encompass_confirm_date#','#read_after.send_this#','#read_after.branch_id#','#read_after.enhanced_coverage#','#read_after.allow_subrates#','#read_after.allow_reissue_rates#','#read_after.allow_chicago_rates#','#read_after.allow_chicago_rates2#','#read_after.use_apr#','#read_after.child_ids#','#read_after.refer#','#read_after.refer_other#','#read_after.interested_in_services#','#read_after.chase_acct#','#read_after.streamline_client#','#read_after.attach_icl#','#read_after.icl_address#','#read_after.attach_eando#','#read_after.wipro_gfe_confirm#','#read_after.wipro_confirm_date#','#read_after.custom_rate_table#','#read_after.streamline_controls#','#read_after.send_post_close_survey#',#insert_date_time#,'after',#read_before_id.id#,'#Bankruptcy_reg#','#FHA_reg#','#VA_reg#','#CONV_reg#','#FHLMC_reg#','#FNMA_reg#','#Updates_reg#','#FHA_HUD_reg#','#Vet_Aff_reg#','#Bankruptcy_MD#','#FHA_MD#','#VA_MD#','#CONV_MD#','#FHLMC_MD#','#FNMA_MD#','#Updates_MD#','#FHA_HUD_MD#','#Vet_Aff_MD#','#Bankruptcy_DC#','#FHA_DC#','#VA_DC#','#CONV_DC#','#FHLMC_DC#','#FNMA_DC#','#Updates_DC#','#FHA_HUD_DC#','#Vet_Aff_DC#','#Bankruptcy_VA#','#FHA_VA#','#VA_VA#','#CONV_VA#','#FHLMC_VA#','#FNMA_VA#','#Updates_VA#','#FHA_HUD_VA#','#Vet_Aff_VA#','#fairfax_client#', '#DocRetrieval_reg#', '#DocRetrieval_MD#', '#DocRetrieval_DC#', '#DocRetrieval_VA#', '#DIL_reg#', '#DIL_MD#', '#DIL_DC#', '#DIL_VA#', '#Recissions_reg#', '#Recissions_MD#', '#Recissions_DC#', '#Recissions_VA#', '#alta_8_1#', '#alta_9#', '#client_commitment#', '#form.exclude_states#')
</CFQUERY>
</cfif>

<cfif url.client_approval eq 0 and session.ft_user_id eq 59 or session.ft_user_id eq 56 or session.ft_user_id eq 450>
<cfif read_company.a_status eq 0 and read_company.auto_email_opt_out eq 0 and form.a_status eq 1>
<cfif read_company.ID eq 2368 or read_company.master_co_id eq 2368 or read_company.streamline_client eq 'True'>
<cfinclude template="../auto_emails/new_streamline_account.cfm">
<cfelse>
<cfinclude template="../auto_emails/new_account.cfm">
</cfif>
</cfif>
</cfif>

<cfparam name="form.copy_new_fees" default="0">



<cfif form.copy_new_fees eq 1 and form.master_co neq 0 and form.master_co neq '' and form.master_co neq 'NULL'>
                     <CFQUERY datasource=#request.dsn#>
                                   DELETE from Company_Billing_Values_HUD2010 where company_id = #cmpid# 
                     </CFQUERY>    
                     <CFQUERY datasource=#request.dsn#>
                          DELETE from Company_Billing_Values_B_HUD2010 where company_id = #cmpid#  
                     </CFQUERY>    
                     
                     <CFQUERY datasource=#request.dsn#>
                          DELETE from Company_Billing_States_HUD2010 where company_id = #cmpid# 
                     </CFQUERY>    
                     
                     
                     <CFQUERY datasource=#request.dsn#>
                          DELETE from company_agency_assoc_HUD2010 where company_id = #cmpid# 
                     </CFQUERY>    
                     
                     <CFQUERY datasource=#request.dsn#>
                          DELETE from ITEMIZED_1101_CHARGES 
                                  where company_id = #cmpid# 
                     </CFQUERY>    
                     <CFQUERY datasource=#request.dsn#>
                          DELETE from Underwriter_Default_Exceptions 
                                  where comp_id = #cmpid# 
                     </CFQUERY>    
					 
					 
<cfhttp url="http://machine1.firsttitleservices.com/FeeCopier.cfm" method="post">
<cfhttpparam type="Formfield" name="FROMID" value="#form.master_co#">
<cfhttpparam type="Formfield" name="toId" value="#cmpid#">
<cfhttpparam type="Formfield" name="state" value="ALL">
<cfhttpparam type="Formfield" name="SUBMIT" value="Copy Line Costs">
</cfhttp>



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
			<a href="./client_line_costs_select_2010.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#read_company.ID#"><img src="./images/button_line_costs.gif" border=0></a>
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
			Chase Acct
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.chase_acct# EQ "True">
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
			Fairfax Client
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.fairfax_client# EQ "True">
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
			ICL Address
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					#form.icl_address#
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

    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Reissue Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_reissue_rates# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>

    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Chicago Bucket Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_chicago_rates# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Chicago LOCAL Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_chicago_rates2# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>

	 <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Use APR
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #use_apr# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>

    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Always Include ALTA 8.1
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #alta_8_1# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>

    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Always Include ALTA 9
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #alta_9# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>

    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Client will Upload Commitment
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #client_commitment# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>


    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Exclude from Ordering States
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.exclude_states# NEQ "">
						<font size=2 color=red face=arial><B>#form.exclude_states#</B></FONT>
					</CFIF>
		</td>
	</tr>
</CFOUTPUT>
</table>
<br>
<cfif url.client_approval eq 1>
<CFQUERY datasource="#request.dsn#" name="get_team_info">
Update Companies_Mod_Tracker
set completed = 1,
completed_date_time = #CreateODBCDateTime(Now())#
where (ID = #url.mod_id#) or before_id = #url.mod_id#
</CFQUERY>
<cflocation url="../../../admin_area/met/company_mod_approvals/index.cfm" addtoken="no">
<a href="../../../admin_area/met/company_mod_approvals/index.cfm">Return to Client Modification Approvals</a>
</cfif>
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
<cfabort>

























































<!--- old code beins here --->

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
<CFPARAM NAME="allow_reissue_rates" DEFAULT="0">
<CFPARAM NAME="allow_chicago_rates2" DEFAULT="0">
<CFPARAM NAME="use_apr" DEFAULT="0">
<CFPARAM NAME="fairfax_client" DEFAULT="0">

<CFPARAM NAME="Infile" DEFAULT="">
<CFPARAM NAME="Reissue" DEFAULT="">
<CFPARAM NAME="Safe" DEFAULT="">
<CFPARAM NAME="Basic" DEFAULT="">
<CFPARAM NAME="Census" DEFAULT="">
<CFPARAM NAME="Life" DEFAULT="">
<CFPARAM NAME="LifeCensus" DEFAULT="">
<CFPARAM NAME="chase_acct" DEFAULT="False">
<CFPARAM NAME="streamline_client" DEFAULT="False">
<CFPARAM NAME="attach_icl" DEFAULT="0">
<CFPARAM NAME="attach_eando" DEFAULT="0">

<cfparam name="Bankruptcy_reg" default="">
<cfparam name="FHA_reg" default="">
<cfparam name="VA_reg" default="">
<cfparam name="CONV_reg" default="">
<cfparam name="FHLMC_reg" default="">
<cfparam name="FNMA_reg" default="">
<cfparam name="Updates_reg" default="">
<cfparam name="FHA_HUD_reg" default="">
<cfparam name="Vet_Aff_reg" default="">

<cfparam name="Bankruptcy_MD" default="">
<cfparam name="FHA_MD" default="">
<cfparam name="VA_MD" default="">
<cfparam name="CONV_MD" default="">
<cfparam name="FHLMC_MD" default="">
<cfparam name="FNMA_MD" default="">
<cfparam name="Updates_MD" default="">
<cfparam name="FHA_HUD_MD" default="">
<cfparam name="Vet_Aff_MD" default="">

<cfparam name="Bankruptcy_DC" default="">
<cfparam name="FHA_DC" default="">
<cfparam name="VA_DC" default="">
<cfparam name="CONV_DC" default="">
<cfparam name="FHLMC_DC" default="">
<cfparam name="FNMA_DC" default="">
<cfparam name="Updates_DC" default="">
<cfparam name="FHA_HUD_DC" default="">
<cfparam name="Vet_Aff_DC" default="">

<cfparam name="Bankruptcy_VA" default="">
<cfparam name="FHA_VA" default="">
<cfparam name="VA_VA" default="">
<cfparam name="CONV_VA" default="">
<cfparam name="FHLMC_VA" default="">
<cfparam name="FNMA_VA" default="">
<cfparam name="Updates_VA" default="">
<cfparam name="FHA_HUD_VA" default="">
<cfparam name="Vet_Aff_VA" default="">

<cfparam name="DIL_reg" default="">
<cfparam name="DIL_MD" default="">
<cfparam name="DIL_DC" default="">
<cfparam name="DIL_VA" default="">

<cfparam name="Recissions_reg" default="">
<cfparam name="Recissions_MD" default="">
<cfparam name="Recissions_DC" default="">
<cfparam name="Recissions_VA" default="">


<cfparam name="alta_8_1" default="">
<cfparam name="alta_9" default="">

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
				allow_reissue_rates = #allow_reissue_rates#,
				allow_chicago_rates = #allow_chicago_rates#,
				allow_chicago_rates2 = #allow_chicago_rates2#,
				use_apr = #use_apr#,
				chase_acct = '#form.chase_acct#',
				streamline_client = '#form.streamline_client#',
				fairfax_client = '#form.fairfax_client#',
				attach_icl = '#form.attach_icl#',
				attach_eando = '#form.attach_eando#',
<!--- FHA_reg = '#form.FHA_reg#',
VA_reg = '#form.VA_reg#',
CONV_reg = '#form.CONV_reg#',
FHLMC_reg = '#form.FHLMC_reg#',
FNMA_reg = '#form.FNMA_reg#',
Updates_reg = '#form.Updates_reg#',
FHA_HUD_reg = '#form.FHA_HUD_reg#',
Vet_Aff_reg = '#form.Vet_Aff_reg#',
Bankruptcy_MD = '#form.Bankruptcy_MD#',
FHA_MD = '#form.FHA_MD#',
VA_MD = '#form.VA_MD#',
CONV_MD = '#form.CONV_MD#',
FHLMC_MD = '#form.FHLMC_MD#',
FNMA_MD = '#form.FNMA_MD#',
Updates_MD = '#form.Updates_MD#',
FHA_HUD_MD = '#form.FHA_HUD_MD#',
Vet_Aff_MD = '#form.Vet_Aff_MD#',
Bankruptcy_DC = '#form.Bankruptcy_DC#',
FHA_DC = '#form.FHA_DC#',
VA_DC = '#form.VA_DC#',
CONV_DC = '#form.CONV_DC#',
FHLMC_DC = '#form.FHLMC_DC#',
FNMA_DC = '#form.FNMA_DC#',
Updates_DC = '#form.Updates_DC#',
FHA_HUD_DC = '#form.FHA_HUD_DC#',
Vet_Aff_DC = '#form.Vet_Aff_DC#',
Bankruptcy_VA = '#form.Bankruptcy_VA#',
FHA_VA = '#form.FHA_VA#',
VA_VA = '#form.VA_VA#',
CONV_VA = '#form.CONV_VA#',
FHLMC_VA = '#form.FHLMC_VA#',
FNMA_VA = '#form.FNMA_VA#',
Updates_VA = '#form.Updates_VA#',
FHA_HUD_VA = '#form.FHA_HUD_VA#',
Vet_Aff_VA = '#form.Vet_Aff_VA#', --->
DocRetrieval_reg = '#form.DocRetrieval_reg#',
DocRetrieval_MD = '#form.DocRetrieval_MD#',
DocRetrieval_DC = '#form.DocRetrieval_DC#',
DocRetrieval_VA = '#form.DocRetrieval_VA#',

DIL_reg = '#form.DIL_reg#',
DIL_MD = '#form.DIL_MD#',
DIL_DC = '#form.DIL_DC#',
DIL_VA = '#form.DIL_VA#',

Recissions_reg = '#form.Recissions_reg#',
Recissions_MD = '#form.Recissions_MD#',
Recissions_DC = '#form.Recissions_DC#',
Recissions_VA = '#form.Recissions_VA#',

alta_8_1 = '#form.alta_8_1#',
alta_9 = '#form.alta_9#',

				custom_rate_table = '#custom_rate_table#'
			WHERE ID = #cmpid#
		</CFQUERY>
		<cfelse>
		<CFQUERY datasource="#request.dsn#">
			INSERT INTO companies_temp_mods			(company,a_user,a_pass,phone,fax,addr1,addr2,city,state,zip_code,email,a_note_1,a_date_mod,a_time_mod,a_status,comment,a_uid_mod,intCustServ,intSales,blnCommit,blnFullServ,blnClearc,blnPayoff,blnDisbursements,blnRecording,blnAppraisal,blnSigning,blnShipping,FeeVestingLegal,FeeCurrentOwner,FeeFullSearch,FeePolicyOnly,FeeSigning,FeeRecording,FeeAppraisal,companies_switch,proposed_monthly_transactions,master_co_id,contact_fname,contact_lname,auto_email_opt_out,ID, team_id, <cfif form.a_status eq 1 and form.team_id neq inactive_id>prev_team_id, </cfif>realECclientid, avmproduct, special_inst, special_abs_inst, enhanced_coverage, allow_subrates, allow_reissue_rates, allow_chicago_rates,allow_chicago_rates,use_apr, chase_acct, streamline_client, attach_icl, attach_eando, custom_rate_table,fairfax_client,Bankruptcy_reg,FHA_reg,VA_reg,CONV_reg,FHLMC_reg,FNMA_reg,Updates_reg,FHA_HUD_reg,Vet_Aff_reg,Bankruptcy_MD,FHA_MD,VA_MD,CONV_MD,FHLMC_MD,FNMA_MD,Updates_MD,FHA_HUD_MD,Vet_Aff_MD,Bankruptcy_DC,FHA_DC,VA_DC,CONV_DC,FHLMC_DC,FNMA_DC,Updates_DC,FHA_HUD_DC,Vet_Aff_DC,Bankruptcy_VA,FHA_VA,VA_VA,CONV_VA,FHLMC_VA,FNMA_VA,Updates_VA,FHA_HUD_VA,Vet_Aff_VA,fairfax_client, DocRetrieval_reg, DocRetrieval_MD, DocRetrieval_DC, DocRetrieval_VA, DIL_reg, DIL_MD, DIL_DC, DIL_VA, Recissions_reg, Recissions_MD, Recissions_DC, Recissions_VA, alta_8_1, alta_9)
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
				#allow_reissue_rates#,
				#allow_chicago_rates#,
				#allow_chicago_rates2#,
				#use_apr#,
				'#form.chase_acct#',
				'#form.streamline_client#',
				'#form.attach_icl#',
				'#form.attach_eando#',
				'#custom_rate_table#',#fairfax_client#, '#Bankruptcy_reg#','#FHA_reg#','#VA_reg#','#CONV_reg#','#FHLMC_reg#','#FNMA_reg#','#Updates_reg#','#FHA_HUD_reg#','#Vet_Aff_reg#','#Bankruptcy_MD#','#FHA_MD#','#VA_MD#','#CONV_MD#','#FHLMC_MD#','#FNMA_MD#','#Updates_MD#','#FHA_HUD_MD#','#Vet_Aff_MD#','#Bankruptcy_DC#','#FHA_DC#','#VA_DC#','#CONV_DC#','#FHLMC_DC#','#FNMA_DC#','#Updates_DC#','#FHA_HUD_DC#','#Vet_Aff_DC#','#Bankruptcy_VA#','#FHA_VA#','#VA_VA#','#CONV_VA#','#FHLMC_VA#','#FNMA_VA#','#Updates_VA#','#FHA_HUD_VA#','#Vet_Aff_VA#','#fairfax_client#', '#DocRetrieval_reg#', '#DocRetrieval_MD#', '#DocRetrieval_DC#', '#DocRetrieval_VA#', '#DIL_reg#', '#DIL_MD#', '#DIL_DC#', '#DIL_VA#', '#Recissions_reg#', '#Recissions_MD#', '#Recissions_DC#', '#Recissions_VA#', '#alta_8_1#', '#alta_9#')
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
			Chase Acct
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.chase_acct# EQ "True">
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
			Fairfax Client
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.fairfax_client# EQ "True">
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
    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Reissue Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_reissue_rates# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Chicago Bucket Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_chicago_rates# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Chicago LOCAL Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_chicago_rates2# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
	
	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Use APR
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #use_apr# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>

    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Always include ALTA 8.1
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #alta_8_1# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Always include ALTA 9
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #alta_9# NEQ "1">
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
			Chase Acct
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.chase_acct# EQ "True">
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
			Fairfax Client
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.fairfax_client# EQ "True">
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
	    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Reissue Rate
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_reissue_rates# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
	    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Chicago Bucket Rate
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_chicago_rates# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>

	    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Chicago LOCAL Rate
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_chicago_rates2# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Use APR
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #use_apr# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>


	    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Always include ALTA 8.1
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #alta_8_1# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>


	    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Always include ALTA 9
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #alta_9# NEQ "1">
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
				allow_reissue_rates = #allow_reissue_rates#,
				allow_chicago_rates = #allow_chicago_rates#,
				allow_chicago_rates = #allow_chicago_rates2#,
				use_apr = #use_apr#,
				chase_acct = '#form.chase_acct#',
				streamline_client = '#form.streamline_client#',
				fairfax_client = '#form.fairfax_client#',
				attach_icl = '#form.attach_icl#',
				attach_eando = '#form.attach_eando#',
FHA_reg = '#form.FHA_reg#',
VA_reg = '#form.VA_reg#',
CONV_reg = '#form.CONV_reg#',
FHLMC_reg = '#form.FHLMC_reg#',
FNMA_reg = '#form.FNMA_reg#',
Updates_reg = '#form.Updates_reg#',
FHA_HUD_reg = '#form.FHA_HUD_reg#',
Vet_Aff_reg = '#form.Vet_Aff_reg#',
Bankruptcy_MD = '#form.Bankruptcy_MD#',
FHA_MD = '#form.FHA_MD#',
VA_MD = '#form.VA_MD#',
CONV_MD = '#form.CONV_MD#',
FHLMC_MD = '#form.FHLMC_MD#',
FNMA_MD = '#form.FNMA_MD#',
Updates_MD = '#form.Updates_MD#',
FHA_HUD_MD = '#form.FHA_HUD_MD#',
Vet_Aff_MD = '#form.Vet_Aff_MD#',
Bankruptcy_DC = '#form.Bankruptcy_DC#',
FHA_DC = '#form.FHA_DC#',
VA_DC = '#form.VA_DC#',
CONV_DC = '#form.CONV_DC#',
FHLMC_DC = '#form.FHLMC_DC#',
FNMA_DC = '#form.FNMA_DC#',
Updates_DC = '#form.Updates_DC#',
FHA_HUD_DC = '#form.FHA_HUD_DC#',
Vet_Aff_DC = '#form.Vet_Aff_DC#',
Bankruptcy_VA = '#form.Bankruptcy_VA#',
FHA_VA = '#form.FHA_VA#',
VA_VA = '#form.VA_VA#',
CONV_VA = '#form.CONV_VA#',
FHLMC_VA = '#form.FHLMC_VA#',
FNMA_VA = '#form.FNMA_VA#',
Updates_VA = '#form.Updates_VA#',
FHA_HUD_VA = '#form.FHA_HUD_VA#',
Vet_Aff_VA = '#form.Vet_Aff_VA#',
DocRetrieval_reg = '#form.DocRetrieval_reg#',
DocRetrieval_MD = '#form.DocRetrieval_MD#',
DocRetrieval_DC = '#form.DocRetrieval_DC#',
DocRetrieval_VA = '#form.DocRetrieval_VA#',

DIL_reg = '#form.DIL_reg#',
DIL_MD = '#form.DIL_MD#',
DIL_DC = '#form.DIL_DC#',
DIL_VA = '#form.DIL_VA#',

Recissions_reg = '#form.Recissions_reg#',
Recissions_MD = '#form.Recissions_MD#',
Recissions_DC = '#form.Recissions_DC#',
Recissions_VA = '#form.Recissions_VA#',

alta_8_1 = '#form.alta_8_1#',
alta_9 = '#form.alta_9#',

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
			Chase Acct
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.chase_acct# EQ "True">
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
			Fairfax Client
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #form.fairfax_client# EQ "True">
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

    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Reissue Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_reissue_rates# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Chicago Bucket Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_chicago_rates# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>

    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Allow Chicago LOCAL Rates
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #allow_chicago_rates2# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>
	
	 <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Use APR
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #use_apr# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>

    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Always include ALTA 8.1
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #alta_8_1# NEQ "1">
						<font size=2 color=red face=arial><B>No</B></FONT>
					<CFELSE>
						<font size=2 color=green face=arial><B>Yes</B></FONT>
					</CFIF>
		</td>
	</tr>

    <tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Always include ALTA 9
		</td>
		<td width=298 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
					<CFIF #alta_9# NEQ "1">
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


