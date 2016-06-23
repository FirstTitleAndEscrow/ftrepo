<cfabort>
<cfif #a_flag# eq 1>
	<CFSET insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
	<CFSET insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
	<CFSET check_date = #DateFormat(Now(), "dddd")#>

	<CFQUERY datasource="#request.dsn#" NAME="read_report3">
		SELECT *
		FROM comparedate
		WHERE datecompare = '#insert_date#'
	</cfquery>

	<cfif #read_report3.recordcount# LT "2">

	<CFQUERY datasource="#request.dsn#" >
		INSERT INTO comparedate (datecompare)
		VALUES('#insert_date#')
	</CFQUERY>

	</cfif>

	<CFQUERY datasource="#request.dsn#" NAME="read_report">
		SELECT *
		FROM comparedate
		WHERE datecompare = '#insert_date#'
	</cfquery>

	<cfif #read_report.recordcount# LT 2>
		<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM Title a, eventlist f
			WHERE a.title_id = f.title_id  AND (DATEDIFF(day, getdate(), YearMonth) = 2)
		</cfquery>

	<cfloop query="read_title">
		<CFQUERY datasource="#request.dsn#" NAME="read_note">
			SELECT *
			FROM doc_title_insurance_title
			WHERE title_id = #title_id# AND clear_close is null
		</cfquery>

		<cfif #read_note.recordcount# GT 0>
			<cfif (#comp_id# eq "115") OR (#comp_id# eq "621") >
			<cfelse>
			<CFMAIL
				TO="#Verifyemail#"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="File No- T-#title_id# - #blastname1#, #bfirstname1#"
				TIMEOUT="600"
				>
 Closing is scheduled for #c_Month#/#c_day#/#c_year# at #c_time#.
 For you information, file is not marked as "Clear to Close" in First Title's system.
 Please contact your processor at First Title to discuss this file.
 Thank you for your cooperation.

 Property Address: #paddress#, #pcity#, #pstate# #pzip#

				#pname#
				First Title & Escrow, Inc.
				<cfif NOT DateDiff("d", Now(), "1/30/2012")>
				30 West Gude Drive, Suite 450
				Rockville, Maryland 20850
				<cfelse>
				7361 Calhoun Place, Suite 200
				 Rockville, MD 20855
				</cfif>
				Phone - #pphone# X #pext#
				Direct Fax -#pfax#

			</cfmail>
			</cfif>
		</cfif>
	</cfloop>

	<CFQUERY datasource="#request.dsn#" NAME="read_title">
		SELECT     *
		FROM	Title a INNER JOIN
        Title_Notes b ON a.Title_ID = b.Order_ID
		WHERE (a.appraisal_status = 'In Typing') AND (DATEDIFF(day, b.N_Date, GETDATE()) = 2) AND N_note like '%Supervisor Notification%'
	</cfquery>

	<cfif #read_title.recordcount# GT 0>
		<CFMAIL
				TO="pgibb@firsttitleservices.com"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="Order(s) that are still In Typing 48 hours after Supervisor Notified"
				TIMEOUT="600"
				>
		Order(s) that are still In Typing 48 hours after Supervisor Notified

		<cfloop query="read_title">
			Order Number: #title_id#
			Date Ordered: #DateFormat(check_Date, "mm/dd/yyyy")#
			Date "Supervisor Notification" comment added: #DateFormat(N_Date, "mm/dd/yyyy")#
			Status: #appraisal_status#
		</cfloop>

		Auto-email
		First Title & Escrow, Inc.

		</cfmail>
	</cfif>

	 <CFQUERY datasource="#request.dsn#" NAME="read_u">
		SELECT     *
		FROM	First_Admin
		WHERE	 (DATEDIFF(day, passdate, GETDATE()) = 0) and (ID != 60)
		and (ID != 59) and (ID != 58) and (ID != 56) and (ID != 92) and (ID != 187) and (ID != 93)
		and status = 1
	</CFQUERY>

	<cfif #read_u.recordcount# GT 0>
		<cfloop query="read_u">
			<cfset NumbOfChars=6>
			<CFSET NewPass = "">
			<CFLOOP INDEX="RandAlhpaNumericPass"
			FROM="1" TO="#NumbOfChars#">
			<CFSET NewPass =
				NewPass&Mid(
				'ABCDEFGHIJCLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789'
				,RandRange('1','66'),'1')>
		</CFLOOP>

	<CFQUERY datasource="#request.dsn#" NAME="read_user">
			update first_admin
			set password = '#NewPass#',
			passdate = '#DateFormat(Now(), "mm/dd/yyyy")#'
			 where ID = #ID# and status = 1
	</CFQUERY>

	<CFMAIL
		TO="#email#"
		FROM="webmaster@firsttitleservices.com"
		SERVER="127.0.0.1"
		Subject="New #session.site.short_name# web password for #fname# #lname#"
		TIMEOUT="600"
		>
		Hello #fname# #lname#,

		Your new #session.site.short_name# web password is:	#NewPass#

		NOTE: Your #session.site.short_name# web password automatically changes every 14 days.
		In case this email is deleted and you have forgotten your password,
		in the admin login page you may click on the link "Forgot your password? Click"
		and enter your email address in the showing box and the system will automatically
		email your username and password.

		Auto-email
		First Title & Escrow, Inc.

	</cfmail>
	</cfloop>
</cfif>


 <cfset #a_flag# eq 0>
 </cfif>
 </cfif>

<!--- PAGE SECURITY --->

	<!--- query the database for authorized Login --->

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	SELECT *
	FROM first_admin
	WHERE username = '#trim(FORM.username)#' AND password = '#trim(FORM.password)#' And status = 1
</CFQUERY>
		<--- place the data into an array --->
	<CFIF #read_user.recordcount# GTE "1">
	<!--- the user has a valid login so let them in --->
	<!--- make an entry in the  logins Table --->
		<CFQUERY datasource="#request.dsn#" >
			INSERT INTO login_history(a_fname, a_lname, a_user, a_date, a_time, a_ip, block)
			VALUES('#read_user.fname#', '#read_user.lname#', '#FORM.username#', '#DateFormat(Now(), "mm/dd/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#CGI.remote_addr#', 'TRUE')
		</CFQUERY>

		<CFSET a_time = #TimeFormat(Now(), "HH:mm:ss")#>
		<CFSET a_date = #DateFormat(Now(), "mm/dd/yyyy")#>
		<!---send them to the Clear To Close --->
		<CFSWITCH EXPRESSION="#read_user.role_id#">
		<CFCASE VALUE = 3>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_cleartoclose.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Typing --->
		<CFCASE VALUE = 18>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_typing.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Vendor Management --->
		<CFCASE VALUE = 19>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_vendor_management.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Vendor Management Shapiro and Burson--->
		<CFCASE VALUE = 20>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_vendor_management_sb.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Vendor Management Outside--->
		<CFCASE VALUE = 27>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_vendor_management_outside.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Vendor Management InHouse--->
		<CFCASE VALUE = 29>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_vendor_management_inside.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Taxes--->
		<CFCASE VALUE = 17>
			<!---The taxes people want the Vendor Management Screen
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_vendor_management_taxes.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
			--->
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_vendor_management_outside.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Closings--->
		<CFCASE VALUE = 28>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_vendor_management.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
        <!---Closings Other This is a screen that only has closing info on it.  It does not have any Vendor Management info on it--->
		<CFCASE VALUE = 30>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_closings.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Outside Sales--->
		<CFCASE VALUE = 24>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_OutsideSales.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Appraisals--->
		<CFCASE VALUE = 2>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_vendor_management.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Disbursements --->
		<CFCASE VALUE = 1>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_disbursement.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Preprocessing--->
		<CFCASE VALUE = 22>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_preprocessing.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---Processing--->
		<CFCASE VALUE = 11>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_processing.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<CFCASE VALUE = 5>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_customerservice.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<CFCASE VALUE = 23>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_processing_all.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
        <CFCASE VALUE = 26>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_management.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&role_mgr=#read_user.role_mgr#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#">
		</CFCASE>
		<!---The old form --->
		<CFDEFAULTCASE>
			<CFLOCATION URL="https://#cgi.server_name#/admin_area/frame_set.cfm?uid=#read_user.id#&al=#read_user.lvl_access#&a_fname=#read_user.fname#&a_lname=#read_user.lname#&a_user=#FORM.username#&a_ip=#CGI.remote_addr#&a_date=#a_date#&a_time=#a_time#"> --->
		</CFDEFAULTCASE>
		</CFSWITCH>
		<!-------------------------------------------------->
	<CFELSE>
		<!--- track this failed login --->
		<!--- make an entry in the  logins Table --->
		<CFQUERY datasource="#request.dsn#" >
			INSERT INTO failed_logins(a_pass, a_user, a_date, a_time, a_ip)
			VALUES('#trim(FORM.password)#', '#trim(FORM.username)#', '#DateFormat(Now(), "mm/dd/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', '#CGI.remote_addr#')
		</CFQUERY>
		<!---Sends the failed log in back with an a_trigger of 1 --->
		<CFLOCATION URL="https://#cgi.server_name#/client/alogin.cfm?a_trigger=1">

</CFIF>

	<CFABORT>


