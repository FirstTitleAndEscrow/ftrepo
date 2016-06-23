<CFPARAM NAME="phone" DEFAULT="">
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
<CFPARAM NAME="st_abbrev" DEFAULT="">
<CFPARAM NAME="ft_agencies" DEFAULT="">
<CFPARAM NAME="a_comment" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="status" DEFAULT="">
<CFPARAM NAME="sales" DEFAULT="InHouse">

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
<CFQUERY datasource="#request.dsn#">
	INSERT INTO companies(company, phone, fax, addr1, addr2, city, state, zip_code, email, a_time, a_date, a_note_1, a_comment, a_uid, a_status, a_user, a_pass, status,intCustServ)
	VALUES('#URL.company#', '#phone#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip_code#', '#email#', '#c_time#', '#c_date#', '#a_note_1#', '#a_comment#', '#UID#', 1, '#a_user#', '#a_pass#', '#status#',#NewName#)
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="Read_ID">
	SELECT *
	FROM companies
	WHERE a_time = '#c_time#' AND a_date = '#c_date#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="Read_CustomerService">
	Select fname + ' ' + lname AS Name
	FROM   First_Admin where id = #newname#
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

<CFLOCATION URL="https://#cgi.server_name#/admin_area/client_add_submit2.cfm?uid=#URL.uid#&al=#URL.al#&company=#company#">