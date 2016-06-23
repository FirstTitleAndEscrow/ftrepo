<CFPARAM NAME="cc_email_1" DEFAULT="">
<CFPARAM NAME="cc_email_2" DEFAULT="">
<CFPARAM NAME="emp" DEFAULT="0">

<CFSET ru_name = '#lp_fname# #lp_lname#'>

<CFQUERY datasource="#request.dsn#" NAME="read_processor">
    SELECT *
	FROM users
	WHERE pname like '%#ru_name#%' and comp_id = #URL.comp_ID#
</CFQUERY>

<cfif #read_processor.recordcount# GT 0>
    <CFLOCATION URL="https://#cgi.server_name#/client_login_submit.cfm?comp_id=#comp_id#&user_name=#user_name#&password=#password#&a_trigger=11&emp=#emp#">
<cfelse>
    <CFQUERY datasource="#request.dsn#" NAME="read_company">
	    SELECT *
		FROM companies
		WHERE ID = #comp_ID#
    </CFQUERY>

    <CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
    <CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>

	<CFQUERY datasource="#request.dsn#">
	    INSERT INTO Companies_User(comp_id, lp_fname, lp_lname, lp_email, a_date, a_time, a_status, lp_phone, lp_ext, lp_fax, pname)
			VALUES(#URL.comp_ID#, '#FORM.lp_fname#', '#FORM.lp_lname#', '#FORM.lp_email#', '#c_date#', '#c_time#', 1, '#FORM.lp_phone#', '#FORM.lp_ext#', '#FORM.lp_fax#', '#ru_name#')
    </CFQUERY>

    <CFIF #read_company.companies_switch# eq "1">
         <CFQUERY datasource="#request.dsn#" NAME="read_user">
            Select ID
            from Users where
            a_date = '#c_date#'
            and a_time = '#c_time#'
        </CFQUERY>

        <CFQUERY datasource="#request.dsn#">
        INSERT INTO users(comp_id, user_id, job_title, fname, lname, username, password, Administrator, dateadded,status)
			VALUES(#URL.comp_ID#,#read_user.ID#,'Processor','#FORM.lp_fname#', '#FORM.lp_lname#','#FORM.username#','#FORM.password#','#FORM.Administrator#',getdate(),1)
        </CFQUERY>
    </CFIF>

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
    <HTML>
	<HEAD>
	<TITLE><cfoutput>#session.site.short_name#</cfoutput> Admin</TITLE>
	</HEAD>
    <BODY BGCOLOR="#FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
    <CENTER>
    <table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
    <TBODY>
        <tr>
            <td align = "center">
                <table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
                    <tr>
                        <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
                        <td valign="top" align="right">
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center" width="560"><nobr></nobr><br>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table width=433 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
                    <TBODY>
                        <tr>
                            <td>
                                <table width=433 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
				                    <tr>
					                    <td width=433 align=center valign=top>
                                            <table width=432 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
                                                <tr>
					                                <td width=432 align=center valign=top bgcolor=e2e2e2>
                                                        <table width=431 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<CFOUTPUT>
                                                            <tr>
					                                            <td width=431 align=left valign=top bgcolor=white>
						                                            <center><font size=2 color=blue face=arial><B>Add Loan Processor</B></CENTER><font size=2 color=black face=arial>
						                                            <br>
						                                            Company  - <B>#read_company.company#</B>
				                                                </td>
				                                            </tr>
</CFOUTPUT>
			                                            </table>
                                                    </td>
				                                </tr>
                                                <tr>
					                                <td width=431 align=center valign=top bgcolor=white>
                                                        <table width=430 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<CFOUTPUT>
                                                            <tr>
                                                                <td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
			                                                        <img src="./images/clear.gif" height=10 width=85>
                                                                </td>
	                                                        </tr>
                                                            <tr>
		                                                        <td width=367 colspan=2 align=left valign=top bgcolor=gray>
			                                                        <font size=2 color=white face=arial>
			                                                        Loan <B>Processor</B> Information :
		                                                        </td>
	                                                        </tr>
                                                            <tr>
		                                                        <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                        <font size=2 color=black face=arial>
			                                                        First Name
		                                                        </td>
                                                                <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                        #lp_fname#
		                                                        </td>
	                                                        </tr>
                                                            <tr>
		                                                        <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                        <font size=2 color=black face=arial>
			                                                        Last Name
		                                                        </td>
                                                                <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                        #lp_lname#
		                                                        </td>
	                                                        </tr>
                                                            <CFIF #read_company.companies_switch# eq "1">
                                                                <tr>
		                                                            <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                            <font size=2 color=black face=arial>
			                                                            User Name
		                                                            </td>
                                                                    <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        #username#
		                                                            </td>
	                                                            </tr>
                                                                <tr>
		                                                            <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                            <font size=2 color=black face=arial>
			                                                            Password
		                                                            </td>
                                                                    <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        #password#
		                                                            </td>
	                                                            </tr>
                                                            </CFIF>
                                                            <tr>
		                                                        <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                        <font size=2 color=black face=arial>
			                                                        Email
		                                                        </td>
                                                                <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                    #lp_email#
		                                                        </td>
	                                                        </tr>
                                                            <tr>
		                                                        <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                        <font size=2 color=black face=arial>
			                                                        cc. Email 1
		                                                        </td>
                                                                <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                        #cc_email_1#
    		                                                    </td>
	                                                        </tr>
                                                            <tr>
		                                                        <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                        <font size=2 color=black face=arial>
			                                                        cc. Email 2
		                                                        </td>
                                                                <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                        #cc_email_2#
		                                                        </td>
	                                                        </tr>
	                                                        <tr>
		                                                        <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                        <font size=2 color=black face=arial>
			                                                        Phone
		                                                        </td>
                                                                <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                    #lp_phone#
		                                                        </td>
	                                                        </tr>
                                                            <tr>
		                                                        <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                        <font size=2 color=black face=arial>
			                                                        Phone Ext.
		                                                        </td>
                                                                <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                        #lp_ext#
		                                                        </td>
	                                                        </tr>
	                                                        <tr>
		                                                        <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                        <font size=2 color=black face=arial>
			                                                        Fax
		                                                        </td>
                                                                <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                        #lp_fax#
		                                                        </td>
	                                                        </tr>
                                                            <CFIF #read_company.companies_switch# eq "1">
                                                                <tr>
                                                             	    <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                            <font size=2 color=black face=arial>
			                                                            Administrator
		                                                            </td>
                                                                    <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                            #Administrator#
		                                                            </td>
	                                                            </tr>
                                                            </CFIF>
</CFOUTPUT>
                                                        </table>
                                                        <table width=430 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	                                                        <tr>
			                                                    <td bgcolor=f1f1f1 width="430" align="center" valign="top">
<cfoutput>                                                          <font face="arial" size="2" color="black">To go back to login page click here > </font> <a href="./client_login_submit.cfm?comp_id=#comp_id#&user_name=#user_name#&password=#password#" ><img src="./images/button_return.gif" border=0></a></td>	</td></tr>
</cfoutput>	                                                    </td>
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
                <tr>
                    <td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>
    </center>
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
	</HTML>
    </cfif>