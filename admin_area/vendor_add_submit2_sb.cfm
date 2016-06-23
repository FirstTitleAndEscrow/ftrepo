<cfparam name="form.COMPANY" default="">
<cfparam name="form.USERNAME" default="">
<cfparam name="form.PASSWORD" default="">
<cfparam name="form.FNAME" default="">
<cfparam name="form.LNAME" default="">
<cfparam name="form.PHONE" default="">
<cfparam name="form.FAX" default="">
<cfparam name="form.CELL" default="">
<cfparam name="form.PAGER" default="">
<cfparam name="form.EMAIL" default="">
<cfparam name="form.ADDR1" default="">
<cfparam name="form.ADDR2" default="">
<cfparam name="form.A_NOTE_1" default="">
<cfparam name="form.CITY" default="">
<cfparam name="form.STATE" default="">
<cfparam name="form.ZIP_CODE" default="">
<cfparam name="form.SERVICE_TYPE" default="">
<cfparam name="form.A_COMMENTS" default="">
<cfparam name="form.PREF_FOR_SEND" default="">


<CFQUERY DATASOURCE="#request.dsn#" NAME="check_vendors">
	SELECT *
	FROM Vendors_Stacie_sb
	WHERE Company = '#form.company#' AND lname = '#form.lname#' AND fname = '#form.fname#'
</CFQUERY>
<cfif check_vendors.recordcount>
<script language="javascript">
alert("It appears that this particular Vendor is already listed in the system");
history.go(-1);
</script>
<cfabort>
</cfif>


<!---
<CFQUERY DATASOURCE="#request.dsn#" NAME="check_companies">
		SELECT *
		FROM Companies
		WHERE a_user = '#form.username#'
		and a_pass = '#form.password#'
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="check_users">
		SELECT *
		FROM Users
		WHERE a_user = '#form.username#'
		and a_pass = '#form.password#'
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="check_closer">
		SELECT *
		FROM Closer
		WHERE username = '#form.username#'
		and password = '#form.password#'
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="check_abstractors">
		SELECT *
		FROM Abstractors
		WHERE username = '#form.username#'
		and password = '#form.password#'
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="check_new_vendors">
		SELECT *
		FROM Vendors_Stacie
		WHERE username = '#form.username#'
		and password = '#form.password#'
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="check_co_user">
		SELECT *
		FROM Companies_User
		WHERE username = '#form.username#'
		and password = '#form.password#'
</CFQUERY>

<cfif check_companies.recordcount or check_users.recordcount or check_closer.recordcount or check_abstractors.recordcount or check_co_user.recordcount or check_new_vendors.recordcount>
<script language="javascript">
alert("That UserName/Password combination is already in use, please choose another");
history.go(-1);
</script>
<cfabort>
</cfif>



--->






<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>


		<CFQUERY DATASOURCE="#request.dsn#" >

			INSERT INTO Vendors_STACIE_sb (TSS_ID,COMPANY,USERNAME,PASSWORD,FNAME,LNAME,PHONE,FAX,CELL,PAGER,EMAIL,ADDR1,ADDR2,A_NOTE_1,CITY,STATE,ZIP_CODE,SERVICE_TYPE,A_COMMENTS,PREF_FOR_SEND,INSERT_TIME, insert_date)
			VALUES('#form.TSS_ID#', '#form.COMPANY#', '#form.USERNAME#', '#form.PASSWORD#', '#form.FNAME#', '#form.LNAME#', '#form.PHONE#', '#form.FAX#', '#form.CELL#', '#form.PAGER#', '#form.EMAIL#', '#form.ADDR1#', '#form.ADDR2#', '#form.A_NOTE_1#', '#form.CITY#', '#form.STATE#', '#form.ZIP_CODE#', '#form.SERVICE_TYPE#','#form.A_COMMENTS#', '#form.PREF_FOR_SEND#', '#c_time#', '#c_date#')

		</CFQUERY>

		<cfif listFindNoCase(form.service_type,"Abstract") OR listFindNoCase(form.service_type,"TaxPrep") OR listFindNoCase(form.service_type,"ICL") OR listFindNoCase(form.service_type,"Payoff") OR listFindNoCase(form.service_type,"DeedPrep")>
			<CFQUERY DATASOURCE="#request.dsn#" name="check">
				select * from abstractors_sb where
				username = '#form.username#' and password = '#form.password#'
			</cfquery>
			<cfif not check.recordcount>
				<cfloop list="#form.service_type#" index="service">
					<cfset vtype = "">
					<cfif service EQ "Abstract">
						<cfset vtype = 1>
					<cfelseif service EQ "TaxPrep">
						<cfset vtype = 4>
					<cfelseif service EQ "ICL">
						<cfset vtype = 5>
					<cfelseif service EQ "Payoff">
						<cfset vtype = 6>
					<cfelseif service EQ "DeedPrep">
						<cfset vtype = 7>
					</cfif>
					<cfif Len(vtype)>
						<CFQUERY DATASOURCE="#request.dsn#" >
							INSERT INTO Abstractors_sb (type, tss_id, company, username, password, fname, lname, phone, cell, pager, fax, addr1, addr2, city, state, zip_code, email, pref_for_send,a_comments, insert_time, insert_date)
							VALUES(#vtype#, '#tss_id#', '#company#', '#username#', '#password#', '#fname#',  '#lname#', '#phone#', '#cell#', '#pager#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip_code#', '#email#',  '#pref_for_send#', '#a_comments#', '#c_time#', '#c_date#')
						</CFQUERY>
					</cfif>
				</cfloop>


			</cfif>



		</cfif>

		<cfif listFindNoCase(form.service_type,"Appraisal")>
			<CFQUERY DATASOURCE="#request.dsn#" NAME="check_abs">
				SELECT *
				FROM Appraisers_sb
				WHERE Company = '#form.company#' AND lname = '#form.lname#' AND fname = '#form.fname#'
			</CFQUERY>
			<cfif not check_abs.recordcount>
				<CFQUERY DATASOURCE="#request.dsn#" >
					INSERT INTO Appraisers_sb (tss_id, company, fname, lname, phone, fax, addr1, addr2, city, state, zip_code, email, pref_for_send, insert_time, insert_date, a_comments)
					VALUES('#tss_id#', '#company#', '#fname#',  '#lname#', '#phone#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip_code#', '#email#', '#pref_for_send#', '#c_time#', '#c_date#', '#a_comments#')
				</CFQUERY>

			</cfif>
		</cfif>

		<cfif listFindNoCase(form.service_type,"Closer")>
			<CFQUERY DATASOURCE="#request.dsn#" NAME="check_closer">
					SELECT *
					FROM Closer_sb
					WHERE username = '#form.username#'
					and password = '#form.password#'
			</CFQUERY>
			<cfif not check_closer.recordcount>
				<CFQUERY DATASOURCE="#request.dsn#" >
					INSERT INTO Closer_sb (tss_id, company, username, password, fname, lname, phone, cell, pager, fax, addr1, addr2, city, state, zip_code, email, pref_for_send, a_comments, insert_time, insert_date)
					VALUES('#tss_id#', '#company#', '#username#', '#password#', '#fname#',  '#lname#', '#phone#', '#cell#', '#pager#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip_code#', '#email#',  '#pref_for_send#','#a_comments#', '#c_time#', '#c_date#')
				</CFQUERY>

			</cfif>
		</cfif>


<CFQUERY DATASOURCE="#request.dsn#" NAME="Read_ID">

			SELECT *
			FROM Vendors_STACIE_sb
			WHERE insert_time = '#c_time#' AND insert_date = '#c_date#'

		</CFQUERY>
<cflocation url="https://#cgi.server_name#/admin_area/vendor_modify2_sb.cfm?vendor_id=#Read_ID.vendor_id#&new=1">


