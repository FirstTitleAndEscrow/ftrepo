<cfset objChase = CreateObject('component','cfc.chaseRealEC')>
<cfparam name="Im_a_Vendor" default=0>
<cfparam name="username" default="">
<cfparam name="password" default="">
<cfparam name="form.email" default="">
<cfparam name="url.from_page" default="">

<CFQUERY DATASOURCE="#request.dsn#" name="check_shapiro">
Select child_ids from companies where ID = 2368 or ID = 3011 or ID = 2372
</CFQUERY>
<cfset children = check_shapiro.child_ids>
<cfloop query="check_shapiro" startrow="2">
<cfif check_shapiro.child_ids neq "" and check_shapiro.child_ids neq 'NULL'>
<cfset children = children & "," & "#check_shapiro.child_ids#">
</cfif>
</cfloop>

<CFQUERY DATASOURCE="#request.dsn#" NAME="is_rosicki">
		select comp_id
		from title
		WHERE title_id = #url.rec_ID#
	</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" NAME="is_keystone">
		select comp_id
		from title
		WHERE title_id = #url.rec_ID#
	</cfquery>


<CFQUERY DATASOURCE="#request.dsn#" NAME="which_commitment">
		select *
		from doc_title_insurance_title
		WHERE title_id = #url.rec_ID#
	</cfquery>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
		select *
		from title
		WHERE title_id = #url.rec_ID#
	</cfquery>


<!--- <cfif (is_rosicki.comp_id eq 3182 or is_rosicki.comp_id eq 2368 or ListFind(children, is_rosicki.comp_id, ",")) and NOT IsDefined("url.go_through") and is_rosicki.comp_id neq 3251>

	<cfif which_commitment.insurance_co eq 25>
	<cflocation url="rosicki_form.cfm?#CGI.QUERY_STRING#">
	<cfelse>
	<cflocation url="rosicki_stewart_form.cfm?#CGI.QUERY_STRING#">
	</cfif>
<cfelseif is_rosicki.comp_id eq 3251 and NOT IsDefined("url.go_through")>
	<cfif which_commitment.insurance_co eq 25>
	<cflocation url="keystone_form.cfm?#CGI.QUERY_STRING#">
	<cfelse>
	<cflocation url="keystone_stewart_form.cfm?#CGI.QUERY_STRING#">
    </cfif>
</cfif> --->




<cfif #a_trigger# EQ "7">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_time">
		select check_date
		from title
		WHERE title_id = #url.rec_ID#
	</cfquery>

	<CFSET today = #DateFormat(Now(), "mm-dd-yyyy")#>
	<CFSET num_day = #DatePart('W', #today#)#>
	<!--- note: Sun = 1
				Mon = 2
				Tue = 3
				Wed = 4
				Thu = 5
				Fri = 6
				Sat = 7 --->

	<!--------------------------->
	<!--- Fourth Business Day --->
	<!--------------------------->

	<cfif #read_time.check_date# neq "">
		<CFIF #DayOfWeek(today)# EQ 1>
			<CFSET add_day = #Day(today)# - 2>
		<CFELSEIF #DayOfWeek(today)# EQ 2>
			<CFSET add_day = #Day(today)#>
		<CFELSEIF #DayOfWeek(today)# EQ 3>
			<CFSET add_day = #Day(today)#>
		<CFELSEIF #DayOfWeek(today)# EQ 4>
			<CFSET add_day = #Day(today)#>
		<CFELSEIF #DayOfWeek(today)# EQ 5>
			<CFSET add_day = #Day(today)#>
		<CFELSEIF #DayOfWeek(today)# EQ 6>
			<CFSET add_day = #Day(today)#>
		<CFELSEIF #DayOfWeek(today)# EQ 7>
			<CFSET add_day = #Day(today)# - 1>
		<CFELSE>
			<CFSET add_day = #Day(today)#>
		</CFIF>
	<cfelse>
		<CFSET add_day = #Day(today)#>
	</cfif>

	<CFSET add_month = #Month(today)#>
	<CFSET add_year = #year(today)#>
	<cfif add_day eq -1>
	<cfset add_day = 1>
	</cfif>
	<CFSET newdate = #CreateDate(#add_year#, #add_month#, #add_day#)#>
	<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<cfif url.from_page eq ''>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
		update Doc_Title_Insurance_Title set s_status = 1,
		a_recieved_date = #newdate#,
		a_recieved_time = '#TimeFormat(Now(), "HH:mm:ss")#',
		f_dateandtime = '#order_date_adj#',
		a_recieved_by = #session.ft_user_id#
		WHERE title_id = #url.rec_ID#

		update vendor_tracker_new
		set completed = 1
		where order_id = #url.rec_ID#
		AND task = 'Review'
	</cfquery>
	<cfif #read_title.appraisal_status# neq "Loan Closed">

	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert">
		update title set appraisal_status = 'Report E-mailed'
		WHERE title_id = #url.rec_ID#
	</cfquery>

	</cfif>
</cfif>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="check_com">
		select insurance_co from Doc_Title_Insurance_Title
		WHERE title_id = #url.rec_ID#
	</cfquery>

			<!-- sazan changed 11/28/05 -->
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
		select *
		from title
		WHERE title_id = #url.rec_ID#
	</cfquery>


<cfif isDefined("session.ft_user_id")>
		<!-- sazan changed 11/28/05 -->
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
		select * from first_admin

			WHERE ID = #session.ft_user_id#
	</CFQUERY>
<cfif url.from_page eq ''>
     <cfif read_title.realEC_TransactionID neq '' and read_title.realEC_TransactionID neq 'NULL'>
	<CFQUERY DATASOURCE="#request.dsn#">
		INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
						 VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Title Commitment Delivered by RealEC Web Integration', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
	</CFQUERY>
	


	<cfelse>
	<CFQUERY DATASOURCE="#request.dsn#">
		INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
						 VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Title Commitment Delivered by e-mail', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
	</CFQUERY>
	</cfif>
</cfif>
</cfif>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_data">
		select *
		from title_ins_view
		WHERE title_id = #url.rec_ID# and selectedOrgs is not null
	</cfquery>

	<cfif #read_title_data.data32# neq "">
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_hud">
			select * from hud_form_title_pg1
			WHERE title_id = #url.rec_ID#
		</cfquery>

		<CFSET a_109_b = #read_title_data.data32#>

		<cfif #read_title_hud.a_109_b# neq "">
			<CFSET a_120a = #read_title_hud.a_120# - #read_title_hud.a_109_b#>
			<CFSET a_120 = #a_120a# + #a_109_b#>
			<CFSET a_301a = #read_title_hud.a_301# - #read_title_hud.a_109_b#>
			<CFSET a_301 = #a_301a# + #a_109_b#>
			<CFSET a_303a = #read_title_hud.a_303# - #read_title_hud.a_109_b#>
			<CFSET a_303 = #a_303a# + #a_109_b#>
		<cfelse>
			<CFSET a_120 = #read_title_hud.a_120# + #a_109_b#>
			<CFSET a_301 = #read_title_hud.a_301# + #a_109_b#>
			<CFSET a_303 = #read_title_hud.a_303# + #a_109_b#>
		</cfif>
<cfif url.from_page eq ''>
		<CFQUERY DATASOURCE="#request.dsn#">
			UPDATE hud_form_title_pg1
			SET a_109_b = '#a_109_b#',
			a_120 = '#a_120#',
			a_301 = '#a_301#',
			a_303 = '#a_303#'
			WHERE title_id = #rec_id#
		</cfquery>
</cfif>
	</cfif>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
		select *
		from title
		WHERE title_id = #url.rec_ID#
	</cfquery>

<!---Dynatek Customer --->
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_Dynatek">
		select *
		from title_temp_Dynatek
		WHERE title_id = #url.rec_ID#
	</cfquery>

	<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_user">
		SELECT *
		FROM users
		WHERE id = #read_title.user_id#
		ORDER BY lp_lname ASC
	</CFQUERY>
    <!---These If Statements are impossible to figure out in this code
I'm going to write some stupid code right here to get around it.
Company 621 is another company that MIC bought and needs to follow the rules.
I don't trust the conditional statement to work so I'm doing it this way.
I can't test this because if MIC receives an email in error they will freak out.
Harry 11/12/04
--->

<CFSET company = #read_title.comp_id# >

	<CFQUERY DATASOURCE="#request.dsn#" NAME="inserted_commit">
		select abstractor_doc_upload3, abstractor_icl_upload from Doc_Abstract_Title
		WHERE title_id = #URL.rec_ID#
	</cfquery>
<CFSET Title_Email = "#read_title.p_email#">
<!---End Harry 11/12/2004--->
	<!---If this is Weichert then the Loan Officer needs to receive the email--->
<cfif #company# eq "559"><!---Weichert 559--->
		<CFSET Title_Email = "#read_title.o_email#">
<CFELSE>
		<CFIF #company# eq "115" >
			<CFSET Title_Email = "TITLES@MORTGAGEINVESTORS.COM">

		<CFELSEIF #company# eq "689" >
			<CFSET Title_Email = "matt@cwscs.com,spape@firsttitleservices.com">


		<CFELSEIF #company# eq "622" or #company# eq "633" >
			<CFSET Title_Email = "#read_title.p_email#,mj@eficapital.com">


		<CFELSEIF #company# eq "621" >
			<CFSET Title_Email = "jslattery@firsttitleservices.com,mictitles@firsttitleservices.com">
		<!---This is per Gary.
		Harry Travis 12/15/04--->
		<!---N  if company in list, additional email to kklos@weichertfinancial.com 07/27/05   --->
		<CFELSEIF #company# eq "859" or #company# eq "919" or #company# eq "953"
		or #company# eq "947" or #company# eq "946" or #company# eq "948"
		or #company# eq "944" or #company# eq "949" or #company# eq "951"
		or #company# eq "945" or #company# eq "950" or #company# eq "943"
		or #company# eq "941" or #company# eq "942" or #company# eq "968">
			<CFSET Title_Email = "#read_title.p_email#,kklos@weichertfinancial.com">
		<CFELSEIF #company# eq "623">
			<CFSET Title_Email = "#read_title.p_email#;#read_title.o_email#">
		<CFELSE>
			<CFSET Title_Email = "#read_title.p_email#">
		</CFIF>
</CFIF>


<!---I need to check to see if this is an order for CA or NV
        because if it is then an email needs to go to  searchinfo@stewart.com
        Harry Travis 10 Kislev 5765
--->
    <CFIF #read_title.pstate# eq "CA">
        <CFSET Title_email = "#Title_Email#,searchinfo@stewart.com">
    <CFELSEIF #read_title.pstate# eq "NV">
        <CFSET Title_email = "#Title_Email#,searchinfo@stewart.com">
    <CFELSE>
        <CFSET Title_email = "#Title_Email#">
    </CFIF>

<!--- if this is East West Mortgage (company ID 2398) - Clarksville, the TC also needs to be sent to ckeith@ewmortgage.com,cison@ewmortgage.com --->
	<cfif #company# eq 2398>
	<CFSET Title_email = "#Title_Email#,ckeith@ewmortgage.com,cison@ewmortgage.com">
	</cfif>


<!--- let's create a pdf version of the TC --->
<cfif check_com.insurance_co neq 19>
<cfhttp url="https://machine1.firsttitleservices.com/title_Committment.cfm?emp=0&comp_id=#read_title.comp_id#&user_id_1=0&lo_id=0&rec_id=#read_title.title_id#&a_trigger=1&company_id=#read_title.comp_id#&calyx=1&pdf=_pdf&Im_A_Vendor=#Im_A_Vendor#" method="get" >
</cfhttp>
<cfset new_content = ReplaceNoCase(cfhttp.filecontent, '<p><IE', '</cfdocumentsection>
<cfdocumentsection>

<IE', 'ALL')>
<cfset new_content = ReplaceNoCase(new_content, '</cfdocumentsection>', '')>
<cfset new_content = ReplaceNoCase(new_content, '##', '####')>

<cfoutput><cfdocument format="PDF" filename="#request.rootdir#\admin_area\tcs\TC-#read_title.title_id#.pdf" overwrite="yes">
		<font size=-3>#new_content#</font>
		</cfdocument></cfoutput>
</cfif>

<cfif check_com.insurance_co eq 16>
<cfinclude template="title_committment_stewart_clean_pdf.cfm">
</cfif>
<cfif check_com.insurance_co eq 30>
<cfinclude template="title_committment_north_american_clean_pdf.cfm">
</cfif> 
<cfif check_com.insurance_co eq 25>
<cfinclude template="title_committment_first_american_clean_pdf.cfm">
</cfif> 
<cfif check_com.insurance_co eq 33 and read_title.pstate eq 'TX'>
<cfinclude template="title_committment_WFG_TX_clean_pdf.cfm">
<cfelseif check_com.insurance_co eq 33>
<cfinclude template="title_committment_WFG_clean_pdf.cfm">
</cfif> 


<cfif read_title.logstransactionid neq '' and read_title.logstransactionid neq 'NULL'>
<cfset form.email = ''>
<cfinvoke	component = "cfc.LOGS"	method = "sendTitleCommitment" order_ID="#read_title.title_id#" filename="TC-#read_title.title_id#.pdf">
</cfif>

<!--- RealEC Integration --->
<cfif read_title.realEC_TransactionID neq '' and read_title.realEC_TransactionID neq 'NULL'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="check_tc_state">
select * from Title_Companies_States
where st_abbrev = '#read_title.pstate#'
</cfquery>

<cfset tc_version = 1>
	<cfif read_title.tc_version gte 1>
	<cfset tc_version = read_title.tc_version + 1>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="update_tc_version">
		update Title
		set tc_version = #tc_version#
		where title_id = #url.rec_id#
		</cfquery>
	</cfif>
<cfset documentInfo = StructNew()>

<cfif check_tc_state.title_co_id eq 19>
<CFQUERY DATASOURCE="#request.dsn#" NAME="find_tc_file">
    SELECT abstractor_doc_upload3
	FROM  Doc_Abstract_Title
	WHERE title_id = #url.rec_id#
</cfquery>
<cfset documentInfo.document = "#find_tc_file.abstractor_doc_upload3#">
<cfset documentInfo.documentversion = "#tc_version#">
<cfset documentInfo.documentStatus = "DRAFT">
<cfset documentInfo.documentType = "CLEARTOCLOSE">
<cfset documentInfo.documentPath = "c:\uploads\">

<cfelse>

<cfset documentInfo.document = "TC-#read_title.title_id#.pdf">
<cfset documentInfo.documentversion = "#tc_version#">
<cfset documentInfo.documentStatus = "DRAFT">
<cfset documentInfo.documentType = "CLEARTOCLOSE">
<cfset documentInfo.documentPath = "#request.rootdir#\admin_area\tcs\">

</cfif>
<cfset objChase.addTurnTimeEvent(title_id=url.rec_id,event_type="marker",event_description="binder_sent")>

<cfset objChase.processEvent(eventCode=150, productCode=3, title_id=#read_title.title_id#,documentInfo=documentInfo)>
</cfif>

<!--- RealEC Integration --->
<cfif form.email neq ''>
<cfset title_email = form.email>
</cfif>
<cfif not isDefined("iclonly")>

<!--- <cfif cgi.REMOTE_ADDR eq '98.233.100.254'>
<cfset title_email = 'rick@jermain.com'>
</cfif>
 --->
    <CFMAIL

		TO="#title_email#"
		FROM="webmaster@firsttitleservices.com"
		SERVER="127.0.0.1"
		Subject="#read_title.bfirstname1# #read_title.blastname1# -- Order: #read_title.title_id# -- Loan Number: #read_title.loan_number# -- Title Insurance Commitment"
		TIMEOUT="600"
		type="HTML"
		>
		<cfif check_com.insurance_co neq 19>
		<cfmailparam file = "c:\inetpub\wwwroot\clients\firsttitleservices.com\www\admin_area\tcs\TC-#read_title.title_id#.pdf">
		<cfelse>

		<cfmailparam file = "#fileSys.FindFilePath('#inserted_commit.abstractor_doc_upload3#', 'file')#">
	<cfif read_title.pstate eq 'CA'>
		<cfmailparam file = "c:\inetpub\wwwroot\clients\firsttitleservices.com\www\admin_area\chase\ICL_Wiring_Inst.pdf">
		</cfif>
		</cfif>
		<cfif Len(inserted_commit.abstractor_icl_upload)>
			<cfmailparam file = "#fileSys.FindFilePath('#inserted_commit.abstractor_icl_upload#', 'file')#">
		</cfif>

Title Insurance Commitment has been completed for order number #rec_id#.<br>

The Title Commitment is included as an attachment to this email.<br>
<cfif Len(inserted_commit.abstractor_icl_upload)>
The ICL is included as an attachment to this email.<br>
</cfif>

<!---You may also click the following link to access this file over the web: <cfif #check_com.insurance_co# eq "19"><cfif #inserted_commit.abstractor_doc_upload3# neq ""><A HREF="#Trim(fileSys.FindFilePath('#inserted_commit.abstractor_doc_upload3#', 'url'))#" target="new">Title Insurance Commitment</a><BR>Adobe Acrobat Reader Required</cfif><cfelse><a href="https://#cgi.server_name#/title_Committment_email.cfm?al=#url.al#&uid=#url.uid#&comp_id=#read_title.comp_id#&rec_id=#rec_id#" target = "new">Title Insurance Commitment</a></cfif><br><br>--->

<br>Thank you,<br><br>

First Title and Escrow staff
	</CFMAIL>


<cfelse>

<CFMAIL
		TO="#title_email#"
		FROM="webmaster@firsttitleservices.com"
		SERVER="127.0.0.1"
		Subject="#read_title.bfirstname1# #read_title.blastname1# -- Order: #read_title.title_id# -- Loan Number: #read_title.loan_number# -- ICL"
		TIMEOUT="600"
		type="HTML"
		>
	<cfmailparam file = "#fileSys.FindFilePath('#inserted_commit.abstractor_icl_upload#', 'file')#">
	
	The ICL is included as an attachment to this email.<br>	<br>
Thank you,<br><br>

First Title and Escrow staff
</cfmail>


</cfif>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_com">
			select insurance_co from Doc_Title_Insurance_Title
			WHERE title_id = #read_title.title_ID#
</cfquery>

</cfif>



<cfif Im_A_Vendor eq 1>
<CFLOCATION URL="https://#cgi.server_name#/vendor_typing.cfm?username=#username#&password=#password#&a_trigger=1&company_id=0&rec_type=T&rec_id=#rec_id#
">
<cfelseif url.from_page eq 'commitment'>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/vendor_title_view_data.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=0
">
<cfelse>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_Committment.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=0">
</cfif>

<!--<cfif #read_title.comp_id# neq "19">
	<cfif #read_com.insurance_co# neq "19">
	    <CFMAIL
		TO="#Title_Email#"
		FROM="webmaster@firsttitleservices.com"
		SERVER="127.0.0.1"
		Subject="Title Commitment text attachement for order number #rec_id#, Loan Number: #read_title.loan_number# -- #read_title.bfirstname1# #read_title.blastname1#"
		MIMEATTACH="C:\Inetpub\wwwroot\clients\firsttitleservices.com\www\dhfvtywty_1\#read_Title.title_id#.txt"
		TIMEOUT="600"
		type="HTML"
		>

Title Commitment text attachement for order number #rec_id#, Loan Number: #read_title.loan_number# -- #read_title.bfirstname1# #read_title.blastname1#<br>

Thank you,<br><br>

First Title and Escrow staff
	</CFMAIL>
	</cfif>
</CFIF>-->