
<cfparam name="session.logged_in_vendor_id" default="0">
<cfif session.logged_in_vendor_id neq 0>
<cfset logged_in_vendor = session.logged_in_vendor_id>
</cfif>
<cfparam name="logged_in_vendor" default="0">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>1st Title & Esc. Settlement Services Company & Subsid. Companies<</title>

</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="lp_id" DEFAULT="">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE a_user = '#user_name#' AND a_pass = '#password#' and a_status = 1
</CFQUERY>

<cfif isDefined("session.ft_user_id")>
	<cfset tmpUserid = session.ft_user_id>
</cfif>


<CFIF #read_company.recordcount# EQ 0 or password eq '' or password eq 'NULL'>

	<cfif IsDefined("session.tried_count")>
    <cfif session.tried_username eq user_name>
	<cfset session.tried_count = session.tried_count + 1>
	<cfset session.tried_username = #user_name#>
    <cfelse>
	<cfset session.tried_count =  1>
	<cfset session.tried_username = #user_name#>
    </cfif>
	<cfelse>
	<cfset session.tried_count = 1>
	<cfset session.tried_username = #user_name#>
	</cfif>

<cfif session.tried_count gte 3>
<CFLOCATION URL="https://#cgi.server_name#/client/lock_out.cfm" addtoken="yes">
</cfif>

<cfif CGI.HTTP_REFERER contains 'sri_login.cfm'>
<CFLOCATION URL="https://#cgi.server_name#/client/sri_login.cfm?a_trigger=1" addtoken="yes">
<cfelseif CGI.HTTP_REFERER contains 'brynmawrabstract'>
<CFLOCATION URL="https://www.firsttitleservices.com/brynmawrabstract?a_trigger=1" addtoken="yes">
<cfelse>
<CFLOCATION URL="https://#cgi.server_name#/client/loginb.cfm?a_trigger=1" addtoken="yes">
</cfif>



<CFELSE>

<cfoutput>
<cfset comp_id = #read_company.id#>
<cfset url.comp_id = #read_company.id#>
<cfset session.tried_count =  0>
<cfset session.tried_username = #user_name#>
<cfset session.comp_id = read_company.id>
</cfoutput>




<!--- once the user has succfully logged in, check to see if they are due for a password change --->

<cfif  IsDefined("read_company.last_password_change") and read_company.last_password_change NEQ '' and read_company.last_password_change NEQ 'NULL'>
<cfif DateDiff("d", DateFormat(read_company.last_password_change, "m-d-yyyy"), Now()) GT 90 or read_company.reset_password_due eq 'True'>
<CFQUERY datasource="#request.dsn#" NAME="update_pass">
		update companies set reset_password_due = 'True'
		where ID = #read_company.ID#
</CFQUERY>
<cfset read_company.reset_password_due = 'True'>
</cfif>
</cfif>

<cfif read_company.reset_password_due eq 'True'>
<cfset session.comp_pass_reset = #read_company.ID#>
<CFLOCATION URL="client_reset_pw.cfm" addtoken="yes">
<!--- <CFinclude template="client_reset_pw.cfm"> --->
<cfabort>
</cfif>



    <CFIF #read_company.Companies_Switch# eq "1">
        <CFLOCATION URL="/client_login.cfm?comp_id=#read_company.ID#&user_id_1=0&lo_id=0" addtoken="yes">
    <CFELSE>
	<cfset temp = StructClear(session)>
	<cfif logged_in_vendor neq 0>
	<cfset session.logged_in_vendor_id = logged_in_vendor>
    </cfif>
	<cfif isDefined("tmpUserID")>
	<cfset session.ft_user_id = tmpUserID>
	</cfif>
	<cfset session.Is_Logged_in = 1>
	<cfset session.comp_id = read_company.id>
	<cfset form.comp_id = read_company.id>
	<cfset session.master_co_id = read_company.master_co_id>
    <!--- added 2/5/2015 --->
    <cfcookie name="FT_auth" value="#session.comp_id#" domain=".firsttitleservices.com" expires="60">
    <!--- added 2/5/2015 --->


        <!---If this is company number 631 then they only see the Loan Calculator--->
        <CFIF #read_company.id# eq "631">
            <CFLOCATION URL="/calculator_page1.cfm?comp_id=#read_company.ID#&user_id_1=0&lo_id=0" addtoken="yes">
        <CFELSE>
            <CFLOCATION URL="/client_acct_mgt.cfm?comp_id=#read_company.ID#&user_id_1=0&lo_id=0" addtoken="yes">
        </CFIF>
    </CFIF>
</cfif>



<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>