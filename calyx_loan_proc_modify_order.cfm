<CFPARAM NAME="emp" DEFAULT="0">
<CFPARAM NAME="a_trigger" DEFAULT="0">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
    SELECT *
    FROM companies
    WHERE ID = '#comp_id#'
    ORDER BY company ASC
</CFQUERY>

<CFIF #read_company.companies_switch# eq "1">
    <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
        SELECT *
        FROM companies_user
        WHERE ID = #emp#
    </CFQUERY>
    <CFSET emp = #read_company_user.ID#>
</CFIF>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE><cfoutput>#session.site.short_name#</cfoutput> Services Admin</TITLE>
<script type="text/javascript">
function prodSelect() {
var frm;
frm = document.frm;
if (frm.user_id_1.value != 'Choose')
{
var foo;
location.href='calyx_loan_proc_modify_order.cfm?emp=<cfoutput>#emp#</cfoutput>&comp_id=<cfoutput>#comp_id#</cfoutput>&user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&title=<cfoutput>#title#</cfoutput>&property=<cfoutput>#property#</cfoutput>&appraisal=<cfoutput>#appraisal#</cfoutput>&other=<cfoutput>#other#</CFOUTPUT>&emp=<cfoutput>#emp#</cfoutput>&a_trigger=10&foo=' + frm.user_id_1.value;
}}
</script>
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
                <table width=434 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
                    <TBODY>
                        <tr>
                            <td>
                                <center>
                                </center>
			                    <center>
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
						                                                <center><font size=2 color=blue face=arial><B>Modify Loan Processor</B></CENTER><font size=2 color=black face=arial>
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
<!---Check for the switch in companies --->
<CFIF #read_company.Companies_Switch# eq 1>
    <CFQUERY datasource="#request.dsn#" NAME="read_users">
        SELECT     Users.ID, Users.comp_id, Users.lp_fname, Users.lp_lname, Users.lp_email, Users.cc_email_1,
                   Users.cc_email_2, Users.a_access_level, Users.a_date, Users.a_time, Users.a_admin_id, Users.m_date,
                   Users.m_time, Users.m_admin_id, Users.a_status, Users.lp_phone, Users.lp_fax, Users.lp_ext, Users.pname,
                   Companies_User.Job_Title, Companies_User.username, Companies_User.password, Companies_User.Administrator,
                   Companies_User.Status
        FROM       Users LEFT OUTER JOIN
                   Companies_User ON Users.ID = Companies_User.User_ID
        WHERE     (Users.comp_id = #read_company.id#) and Companies_User.Status = 1
        ORDER BY Users.lp_lname, Users.lp_fname
    </CFQUERY>
<CFELSE>
    <CFQUERY datasource="#request.dsn#" NAME="read_users">
        SELECT *
	    FROM users
	    WHERE comp_id = #read_company.id#
	    ORDER BY  lp_lname, lp_fname ASC
    </CFQUERY>
</CFIF>

<CFFORM METHOD=POST ACTION="./calyx_loan_procs_modify_submit_order.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&emp=#emp#" name="frm"  ENABLECAB="Yes">

<cfif #a_trigger# eq 10>
                                                                <tr>
		                                                            <td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
			                                                            <img src="./images/clear.gif" height=10 width=85>
		                                                            </td>
	                                                            </tr>
	                                                            <tr>
		                                                            <td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			                                                            <font size=2 color=blue face=arial><b>Select Processor to modify ><b>
        <CFIF #read_company.Companies_Switch# eq 1>
            <CFQUERY datasource="#request.dsn#" NAME="read_foo_users">
                 SELECT     Users.ID, Users.comp_id, Users.lp_fname, Users.lp_lname, Users.lp_email, Users.cc_email_1,
                            Users.cc_email_2, Users.a_access_level, Users.a_date, Users.a_time, Users.a_admin_id, Users.m_date,
                            Users.m_time, Users.m_admin_id, Users.a_status, Users.lp_phone, Users.lp_fax, Users.lp_ext, Users.pname,
                            Companies_User.Job_Title, Companies_User.username, Companies_User.password, Companies_User.Administrator,
                            Companies_User.Status
                FROM        Users LEFT OUTER JOIN
                            Companies_User ON Users.ID = Companies_User.User_ID
                WHERE       (Users.id = '#foo#')
                ORDER BY Users.lp_lname, Users.lp_fname
            </CFQUERY>
        <CFELSE>
            <CFQUERY datasource="#request.dsn#" NAME="read_foo_users">
                SELECT *
        	    FROM users
        	    WHERE id = '#foo#'
        	    ORDER BY  lp_lname, lp_fname ASC
            </CFQUERY>
        </CFIF>
			                                                            <SELECT NAME="user_id_1" onchange="prodSelect()"
			                                                                size="1"
			                                                                style="font-size: 9;
			                                                                font-family: verdana;
			                                                                font-style: normal;
			                                                                color: blue;
			                                                                background-color: e1e1e1;
			                                                                border-color: e1e1e1;
			                                                                border-left-width: thin;
			                                                                border-right-width: thin;
			                                                                border-top-width: thin;
			                                                                border-bottom-width: thin;
			                                                                border-width: thin;
			                                                                border-style: bar;
			                                                                clear: none;
			                                                                float: none;"
			                                                                rows="5"
			                                                                cols="45"
			                                                                >
			                                                                <cfoutput><option value="#foo#">#read_foo_users.pname#</option></cfoutput>
			                                                                <CFOUTPUT QUERY="read_users"><OPTION VALUE="#ID#"> #pname#</OPTION></CFOUTPUT>
			                                                            </SELECT>
			                                                        </td>
	                                                            </tr>
                                                                <!--- ===/ LOAN PROCESSOR INFO \=== --->
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
			                                                            <CFINPUT Required="Yes" Message="You must enter a Processors FIRST NAME" type=text name="lp_fname"  size=20 maxlength=30
				                                                            value = "#read_foo_users.lp_fname#"
				                                                            style="font-size: 9;
				                                                            font-family: verdana;
				                                                            font-style: normal;
				                                                            color: blue;
				                                                            background-color: e6e6e6;
				                                                            border-color: e6e6e6;
				                                                            border-left-width: thin;
				                                                            border-right-width: thin;
				                                                            border-top-width: thin;
				                                                            border-bottom-width: thin;
				                                                            border-width: thin;
				                                                            border-style: bar;
				                                                            clear: none;" >
			                                                        </td>
	                                                            </tr>
                                                                <tr>
		                                                            <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                            <font size=2 color=black face=arial>
			                                                            Last Name
		                                                            </td>
                                                                    <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                            <CFINPUT type=text name="lp_lname" Required="Yes" Message="You must enter a Processors LAST NAME"  size=20 maxlength=30
				                                                            value = "#read_foo_users.lp_lname#"
				                                                            style="font-size: 9;
				                                                            font-family: verdana;
				                                                            font-style: normal;
				                                                            color: blue;
				                                                            background-color: e6e6e6;
				                                                            border-color: e6e6e6;
				                                                            border-left-width: thin;
				                                                            border-right-width: thin;
				                                                            border-top-width: thin;
				                                                            border-bottom-width: thin;
				                                                            border-width: thin;
				                                                            border-style: bar;
				                                                            clear: none;" >
                                                                    </td>
                                                                </tr>
                                                                <CFIF #read_company.Companies_Switch# eq 1>
                                                                    <tr>
		                                                                <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                                <font size=2 color=black face=arial>
			                                                                User Name
		                                                                </td>
                                                                        <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                                <CFINPUT type=text name="username" Required="Yes" Message="You must enter a USER NAME"  size=20 maxlength=30
				                                                                value = "#read_foo_users.username#"
				                                                                style="font-size: 9;
				                                                                font-family: verdana;
				                                                                font-style: normal;
				                                                                color: blue;
				                                                                background-color: e6e6e6;
				                                                                border-color: e6e6e6;
				                                                                border-left-width: thin;
				                                                                border-right-width: thin;
				                                                                border-top-width: thin;
				                                                                border-bottom-width: thin;
				                                                                border-width: thin;
				                                                                border-style: bar;
				                                                                clear: none;" >
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
		                                                                <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                                <font size=2 color=black face=arial>
			                                                                Password
		                                                                </td>
                                                                        <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                                <CFINPUT type=text name="password" Required="Yes" Message="You must enter a PASSWORD"  size=20 maxlength=30
				                                                                value = "#read_foo_users.password#"
				                                                                style="font-size: 9;
				                                                                font-family: verdana;
				                                                                font-style: normal;
				                                                                color: blue;
				                                                                background-color: e6e6e6;
				                                                                border-color: e6e6e6;
				                                                                border-left-width: thin;
				                                                                border-right-width: thin;
				                                                                border-top-width: thin;
				                                                                border-bottom-width: thin;
				                                                                border-width: thin;
				                                                                border-style: bar;
				                                                                clear: none;" >
                                                                        </td>
                                                                    </tr>
                                                                </CFIF>
                                                                <tr>
		                                                            <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                            <font size=2 color=black face=arial>
			                                                            Email
		                                                            </td>
                                                                    <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                            <CFINPUT Required="Yes" Message="You must enter a Processors EMAIL Address" type=text name="lp_email"  size=30 maxlength=160
                                                            				value = "#read_foo_users.lp_email#"
                                                            				style="font-size: 9;
                                                            				font-family: verdana;
                                                            				font-style: normal;
                                                            				color: blue;
                                                            				background-color: e6e6e6;
                                                            				border-color: e6e6e6;
                                                            				border-left-width: thin;
                                                            				border-right-width: thin;
                                                            				border-top-width: thin;
                                                            				border-bottom-width: thin;
                                                            				border-width: thin;
                                                            				border-style: bar;
                                                            				clear: none;" >
                                                                    </td>
	                                                            </tr>
                                                                <tr>
		                                                            <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                            <font size=2 color=black face=arial>
			                                                            cc. Email 1
		                                                            </td>
                                                                    <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                            <CFINPUT  type=text name="cc_email_1"  size=30 maxlength=160
                                                            				value = "#read_foo_users.cc_email_1#"
                                                            				style="font-size: 9;
                                                            				font-family: verdana;
                                                            				font-style: normal;
                                                            				color: blue;
                                                            				background-color: e6e6e6;
                                                            				border-color: e6e6e6;
                                                            				border-left-width: thin;
                                                            				border-right-width: thin;
                                                            				border-top-width: thin;
                                                            				border-bottom-width: thin;
                                                            				border-width: thin;
                                                            				border-style: bar;
                                                            				clear: none;" >
		                                                                </td>
	                                                                </tr>
                                                                    <tr>
                                                                		<td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                			<font size=2 color=black face=arial>
                                                                			cc. Email 2
		                                                                </td>
                                                                        <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                			<CFINPUT  type=text name="cc_email_2"  size=30 maxlength=160
                                                                				value = "#read_foo_users.cc_email_2#"
                                                                				style="font-size: 9;
                                                                				font-family: verdana;
                                                                				font-style: normal;
                                                                				color: blue;
                                                                				background-color: e6e6e6;
                                                                				border-color: e6e6e6;
                                                                				border-left-width: thin;
                                                                				border-right-width: thin;
                                                                				border-top-width: thin;
                                                                				border-bottom-width: thin;
                                                                				border-width: thin;
                                                                				border-style: bar;
                                                                				clear: none;" >
		                                                                </td>
	                                                                </tr>
                                                                	<tr>
                                                                		<td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                			<font size=2 color=black face=arial>
                                                                			Phone
                                                                		</td>
                                                                        <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                			<CFINPUT Required="Yes" Message="You must enter a Processors PHONE NUMBER" type=text name="lp_phone"  size=23 maxlength=15
                                                                				value = "#read_foo_users.lp_phone#"
                                                                				style="font-size: 9;
                                                                				font-family: verdana;
                                                                				font-style: normal;
                                                                				color: blue;
                                                                				background-color: e6e6e6;
                                                                				border-color: e6e6e6;
                                                                				border-left-width: thin;
                                                                				border-right-width: thin;
                                                                				border-top-width: thin;
                                                                				border-bottom-width: thin;
                                                                				border-width: thin;
                                                                				border-style: bar;
                                                                				clear: none;" >
                                                                		</td>
                                                                	</tr>
                                                                    <tr>
                                                                		<td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                			<font size=2 color=black face=arial>
                                                                			Phone Ext.
                                                                		</td>
                                                                        <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                			<CFINPUT type=text name="lp_ext" size=10 maxlength=6
                                                                				value = "#read_foo_users.lp_ext#"
                                                                				style="font-size: 9;
                                                                				font-family: verdana;
                                                                				font-style: normal;
                                                                				color: blue;
                                                                				background-color: e6e6e6;
                                                                				border-color: e6e6e6;
                                                                				border-left-width: thin;
                                                                				border-right-width: thin;
                                                                				border-top-width: thin;
                                                                				border-bottom-width: thin;
                                                                				border-width: thin;
                                                                				border-style: bar;
                                                                				clear: none;" >
                                                                		</td>
                                                                	</tr>
                                                                	<tr>
                                                                		<td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                			<font size=2 color=black face=arial>
                                                                			Fax
                                                                		</td>
                                                                        <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                			<CFINPUT  type=text name="lp_fax"  REQUIRED="Yes" Message="You must enter a Processor FAX NUMBER"  size=23 maxlength=15
                                                                				value = "#read_foo_users.lp_fax#"
                                                                				style="font-size: 9;
                                                                				font-family: verdana;
                                                                				font-style: normal;
                                                                				color: blue;
                                                                				background-color: e6e6e6;
                                                                				border-color: e6e6e6;
                                                                				border-left-width: thin;
                                                                				border-right-width: thin;
                                                                				border-top-width: thin;
                                                                				border-bottom-width: thin;
                                                                				border-width: thin;
                                                                				border-style: bar;
                                                                				clear: none;" >
                                                                		</td>
                                                                	</tr>
                                                                    <CFIF #read_company.Companies_Switch# eq 1>
                                                                        <tr>
		                                                                    <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                                    <font size=2 color=black face=arial>
			                                                                    Administrator
		                                                                    </td>
                                                                            <CFIF  #read_foo_users.Administrator# eq 1>
                                                                            <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                            <font size=2 color=black face=arial>
								 		                                    <NOBR><input type=radio name="Administrator" VALUE=1 CHECKED> - Yes</NOBR>
										                                    <br><font size=2 color=red face=arial>
										                                    <NOBR><input type=radio name="Administrator"  VALUE=0 > - No</NOBR><br>
								                                            </td>
                                                                            <CFELSE>
                                                                            <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                            <font size=2 color=black face=arial>
								 		                                    <NOBR><input type=radio name="Administrator" VALUE=1 > - Yes</NOBR>
										                                    <br><font size=2 color=red face=arial>
										                                    <NOBR><input type=radio name="Administrator"  VALUE=0 CHECKED> - No</NOBR><br>
								                                            </td>
                                                                            </CFIF>

                                                                            </td>
                                                                        </tr>
                                                                        <tr>
		                                                                    <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                                    <font size=2 color=black face=arial>

		                                                                    </td>
                                                                            <CFIF  #read_foo_users.Status# eq 1>
                                                                            <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                            <font size=2 color=black face=arial>
								 		                                    <NOBR><input type=radio name="Status" VALUE=1 CHECKED> - Active</NOBR>
										                                    <br><font size=2 color=red face=arial>
										                                    <NOBR><input type=radio name="Status"  VALUE=0 > - Inactive</NOBR><br>
								                                            </td>
                                                                            <CFELSE>
                                                                            <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                            <font size=2 color=black face=arial>
								 		                                    <NOBR><input type=radio name="Status" VALUE=1 > - Active</NOBR>
										                                    <br><font size=2 color=red face=arial>
										                                    <NOBR><input type=radio name="Status"  VALUE=0 CHECKED> - Inactive</NOBR><br>
								                                            </td>
                                                                            </CFIF>

                                                                    </tr>
                                                                    </CFIF>
                                                                    <tr>
                                                                        <td width=430 colspan=2 align=right valign=top bgcolor=e6e6e6>
                                                                			<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
                                                                		</td>
                                                                	</tr>
<cfelse>
                                                                	<tr>
                                                                		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
                                                                			<img src="./images/clear.gif" height=10 width=85>
                                                                		</td>
                                                                	</tr>
                                                                	<tr>
                                                                		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
                                                                			<font size=2 color=blue face=arial><b>Select Processor to modify ><b>
                                                                            <SELECT NAME="user_id_1" onchange="prodSelect()"
                                                                            			size="1"
                                                                            			style="font-size: 9;
                                                                            			font-family: verdana;
                                                                            			font-style: normal;
                                                                            			color: blue;
                                                                            			background-color: e1e1e1;
                                                                            			border-color: e1e1e1;
                                                                            			border-left-width: thin;
                                                                            			border-right-width: thin;
                                                                            			border-top-width: thin;
                                                                            			border-bottom-width: thin;
                                                                            			border-width: thin;
                                                                            			border-style: bar;
                                                                            			clear: none;
                                                                            			float: none;"
                                                                            			rows="5"
                                                                            			cols="45"
                                                                            			>
                                                                            			<option value="Choose">Choose</option>
                                                                            			<CFOUTPUT QUERY="read_users"><OPTION VALUE="#ID#"> #pname#</OPTION></CFOUTPUT>
                                                                            			</SELECT>
			                                                                </td>
	                                                                    </tr>
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
                                                                        			<CFINPUT Required="Yes" Message="You must enter a Processors FIRST NAME" type=text name="lp_fname"  size=20 maxlength=30
                                                                        				style="font-size: 9;
                                                                        				font-family: verdana;
                                                                        				font-style: normal;
                                                                        				color: blue;
                                                                        				background-color: e6e6e6;
                                                                        				border-color: e6e6e6;
                                                                        				border-left-width: thin;
                                                                        				border-right-width: thin;
                                                                        				border-top-width: thin;
                                                                        				border-bottom-width: thin;
                                                                        				border-width: thin;
                                                                        				border-style: bar;
                                                                        				clear: none;" >


                                                                        		</td>
                                                                        	</tr>

                                                                        	<tr>
                                                                        		<td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                        			<font size=2 color=black face=arial>
                                                                        			Last Name


                                                                        		</td>

                                                                        		<td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        			<CFINPUT type=text name="lp_lname" Required="Yes" Message="You must enter a Processors LAST NAME"  size=20 maxlength=30
                                                                        				style="font-size: 9;
                                                                        				font-family: verdana;
                                                                        				font-style: normal;
                                                                        				color: blue;
                                                                        				background-color: e6e6e6;
                                                                        				border-color: e6e6e6;
                                                                        				border-left-width: thin;
                                                                        				border-right-width: thin;
                                                                        				border-top-width: thin;
                                                                        				border-bottom-width: thin;
                                                                        				border-width: thin;
                                                                        				border-style: bar;
                                                                        				clear: none;" >


                                                                        		</td>
                                                                        	</tr>
                                                                            <CFIF #read_company.Companies_Switch# eq 1>
                                                                                <tr>
                                                                                    <td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                        			    <font size=2 color=black face=arial>
                                                                        			    Username
                                                                        		    </td>
                                                                                    <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        			<CFINPUT Required="Yes" Message="You must enter a user name" type=text name="username"  size=30 maxlength=160
                                                                        				style="font-size: 9;
                                                                        				font-family: verdana;
                                                                        				font-style: normal;
                                                                        				color: blue;
                                                                        				background-color: e6e6e6;
                                                                        				border-color: e6e6e6;
                                                                        				border-left-width: thin;
                                                                        				border-right-width: thin;
                                                                        				border-top-width: thin;
                                                                        				border-bottom-width: thin;
                                                                        				border-width: thin;
                                                                        				border-style: bar;
                                                                        				clear: none;" >
                                                                        		    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                        			    <font size=2 color=black face=arial>
                                                                        			    Password
                                                                        		    </td>
                                                                                    <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        			<CFINPUT Required="Yes" Message="You must enter a password" type=text name="password"  size=30 maxlength=160
                                                                        				style="font-size: 9;
                                                                        				font-family: verdana;
                                                                        				font-style: normal;
                                                                        				color: blue;
                                                                        				background-color: e6e6e6;
                                                                        				border-color: e6e6e6;
                                                                        				border-left-width: thin;
                                                                        				border-right-width: thin;
                                                                        				border-top-width: thin;
                                                                        				border-bottom-width: thin;
                                                                        				border-width: thin;
                                                                        				border-style: bar;
                                                                        				clear: none;" >
                                                                        		    </td>
                                                                                </tr>
                                                                                </CFIF>
                                                                        	    <tr>
                                                                        		    <td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                        			    <font size=2 color=black face=arial>
                                                                        			    Email


                                                                        		</td>

                                                                        		<td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        			<CFINPUT Required="Yes" Message="You must enter a Processors EMAIL Address" type=text name="lp_email"  size=30 maxlength=160
                                                                        				style="font-size: 9;
                                                                        				font-family: verdana;
                                                                        				font-style: normal;
                                                                        				color: blue;
                                                                        				background-color: e6e6e6;
                                                                        				border-color: e6e6e6;
                                                                        				border-left-width: thin;
                                                                        				border-right-width: thin;
                                                                        				border-top-width: thin;
                                                                        				border-bottom-width: thin;
                                                                        				border-width: thin;
                                                                        				border-style: bar;
                                                                        				clear: none;" >


                                                                        		</td>
                                                                        	</tr>

                                                                        	<tr>
                                                                        		<td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                        			<font size=2 color=black face=arial>
                                                                        			cc. Email 1


                                                                        		</td>

                                                                        		<td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        			<CFINPUT  type=text name="cc_email_1"  size=30 maxlength=160
                                                                        				style="font-size: 9;
                                                                        				font-family: verdana;
                                                                        				font-style: normal;
                                                                        				color: blue;
                                                                        				background-color: e6e6e6;
                                                                        				border-color: e6e6e6;
                                                                        				border-left-width: thin;
                                                                        				border-right-width: thin;
                                                                        				border-top-width: thin;
                                                                        				border-bottom-width: thin;
                                                                        				border-width: thin;
                                                                        				border-style: bar;
                                                                        				clear: none;" >


                                                                        		</td>
                                                                        	</tr>

                                                                        	<tr>
                                                                        		<td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                        			<font size=2 color=black face=arial>
                                                                        			cc. Email 2


                                                                        		</td>

                                                                        		<td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        			<CFINPUT  type=text name="cc_email_2"  size=30 maxlength=160
                                                                        				style="font-size: 9;
                                                                        				font-family: verdana;
                                                                        				font-style: normal;
                                                                        				color: blue;
                                                                        				background-color: e6e6e6;
                                                                        				border-color: e6e6e6;
                                                                        				border-left-width: thin;
                                                                        				border-right-width: thin;
                                                                        				border-top-width: thin;
                                                                        				border-bottom-width: thin;
                                                                        				border-width: thin;
                                                                        				border-style: bar;
                                                                        				clear: none;" >


                                                                        		</td>
                                                                        	</tr>

                                                                        	<tr>
                                                                        		<td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                        			<font size=2 color=black face=arial>
                                                                        			Phone


                                                                        		</td>

                                                                        		<td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        			<CFINPUT Required="Yes" Message="You must enter a Processors PHONE NUMBER" type=text name="lp_phone"  size=23 maxlength=15
                                                                        				style="font-size: 9;
                                                                        				font-family: verdana;
                                                                        				font-style: normal;
                                                                        				color: blue;
                                                                        				background-color: e6e6e6;
                                                                        				border-color: e6e6e6;
                                                                        				border-left-width: thin;
                                                                        				border-right-width: thin;
                                                                        				border-top-width: thin;
                                                                        				border-bottom-width: thin;
                                                                        				border-width: thin;
                                                                        				border-style: bar;
                                                                        				clear: none;" >


                                                                        		</td>
                                                                        	</tr>

                                                                        	<tr>
                                                                        		<td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                        			<font size=2 color=black face=arial>
                                                                        			Phone Ext.


                                                                        		</td>

                                                                        		<td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        			<CFINPUT type=text name="lp_ext" value=""  size=10 maxlength=6
                                                                        				style="font-size: 9;
                                                                        				font-family: verdana;
                                                                        				font-style: normal;
                                                                        				color: blue;
                                                                        				background-color: e6e6e6;
                                                                        				border-color: e6e6e6;
                                                                        				border-left-width: thin;
                                                                        				border-right-width: thin;
                                                                        				border-top-width: thin;
                                                                        				border-bottom-width: thin;
                                                                        				border-width: thin;
                                                                        				border-style: bar;
                                                                        				clear: none;" >


                                                                        		</td>
                                                                        	</tr>

                                                                        	<tr>
                                                                        		<td width=130 align=right valign=top bgcolor=e6e6e6>
                                                                        			<font size=2 color=black face=arial>
                                                                        			Fax


                                                                        		</td>

                                                                        		<td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        			<CFINPUT  type=text name="lp_fax"  REQUIRED="Yes" Message="You must enter a Processor FAX NUMBER"  size=23 maxlength=15
                                                                        				style="font-size: 9;
                                                                        				font-family: verdana;
                                                                        				font-style: normal;
                                                                        				color: blue;
                                                                        				background-color: e6e6e6;
                                                                        				border-color: e6e6e6;
                                                                        				border-left-width: thin;
                                                                        				border-right-width: thin;
                                                                        				border-top-width: thin;
                                                                        				border-bottom-width: thin;
                                                                        				border-width: thin;
                                                                        				border-style: bar;
                                                                        				clear: none;" >


                                                                        		</td>
                                                                        	</tr>



                                                                        	<tr>

                                                                        		<td width=430 colspan=2 align=right valign=top bgcolor=e6e6e6>
                                                                        			<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>


                                                                        		</td>
                                                                        	</tr>
</cfif>
</CFFORM>
</table>



					</td>

				</tr>
			</table>

				</td>
			</tr>
			</table>
</center>

				</td>
			</tr>

			</table>

		<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>

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