<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="lo_id" DEFAULT="0">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="user_id_1" DEFAULT="">
<CFPARAM NAME="emp" DEFAULT="0">

<!---If there are users set up in table companies_user then see who it is
and see if they have admin privleges because if they don't they can't add or modify.---->

<CFIF #emp# neq "0">
    <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
        SELECT *
        FROM Companies_User
        WHERE ID = #emp#
    </CFQUERY>
</CFIF>

<CFQUERY datasource="#request.dsn#" NAME="read_company">
    SELECT *
    FROM companies
    WHERE ID = '#comp_id#'
    ORDER BY company ASC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_user1">
    SELECT *
	FROM users
	WHERE id = #read_company.id#
	ORDER BY lp_fname, lp_lname ASC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
    SELECT *
	FROM users
	WHERE id = #read_company.id#
	ORDER BY lp_fname, lp_lname ASC
</CFQUERY>

<cfoutput>

<cfset comp_id = #read_company.id#>

</cfoutput>

			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
			<HTML>
			<HEAD>
			<TITLE><cfoutput>#session.site.short_name#</cfoutput> Services Admin</TITLE>

			<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>


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
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
              <tr>
                <td align="right" valign="center"><a href="./quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a> &nbsp;&nbsp;</td>
                <td align="right" valign="center"><input type="text" name="number" size=10></td>
                <td align="right" valign="center">&nbsp;
                  <input type="image" src="/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
              </tr><tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name,Order ID or Property Address</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr></table>
 </cfFORM>
</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>


</td></tr></tbody></table>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>
<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
		<center>
<CFOUTPUT><TR>
		    <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
            <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
            <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
            <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calyx_loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#';return false;"> <a class="menu1"  href="./calyx_loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	        <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	        <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
        </tr>
</CFOUTPUT>
        </center>
</table>

	</center>

			<center>



			<table width=777 cellpadding=1 cellspacing=1 border=0>
		<tr>
			<td width=777  align=center valign=top>
				<img src="images/clear.gif" width=777 height=10 alt="" border="0">
				<font size=2 color=black face=arial>
				<CENTER>
	<cfif #a_trigger# eq 11>
<P><font size=3 color=RED face=arial><b>YOUR ENTRY ALREADY EXISTS IN OUR SYSTEM</b></FONT></P><br>
<cfelse>
<P><font size=2 color=RED face=arial>NOTE: If you do not see
the desired name in Processor/Officer area, the click ADD button below to
enter new user information</FONT></P><br>
</cfif>

				<p>
				Please choose <font size=2 color=blue face=arial><B>Loan Processor</B></font> from the list below, to proceed <br>
				with the login process.</CENTER>
			</td>
		</tr>
	<tr>
			<td width=777 align=center valign=top>

	<table bgcolor=gray border="0" align="center" width=425 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor=d3d3d3 width="280" align="center" valign="top">
		  		<font face="arial" size="2" color="black">
				Loan Processor list for <cfoutput><b><font color = blue>#read_company.company#</font></b></cfoutput>:
				</font>
			</td>

			<td bgcolor=f1f1f1 width="145" align="center" valign="top" bgcolor="a2a3fe">

		<CFQUERY datasource="#request.dsn#" NAME="read_users">

			SELECT *
			FROM users
			WHERE comp_id = #read_company.id#
			ORDER BY  lp_lname, lp_fname ASC

		</CFQUERY>



			<SELECT NAME="user_id_1"
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
			<CFOUTPUT QUERY="read_users"><OPTION VALUE="#ID#"> #pname#</OPTION></CFOUTPUT>
			</SELECT>

			</td>
		</tr>
<CFOUTPUT>
     <CFIF #emp# neq "0">
        <CFIF #read_company_user.Administrator# eq "1">
	        <tr>
	            <td bgcolor=f1f1f1 colspan = 2 width="425" align="center" valign="top">
	            <br><font face="arial" size="2" color="black">To add a Loan Processor click here > </font> <a href="./calyx_loan_proc_add_user.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#"><img src="./images/button_add.gif" border=0></a>
                </td>
            </tr>
        </CFIF>
    <CFELSE>
        <tr>
            <td bgcolor=f1f1f1 colspan = 2 width="425" align="center" valign="top">
	            <br><font face="arial" size="2" color="black">To add a Loan Processor click here > </font> <a href="./calyx_loan_proc_add_user.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#"><img src="./images/button_add.gif" border=0></a>
            </td>
        </tr>
    </CFIF>

</CFOUTPUT>
	</table>




		</td>
	</tr>
</table>
<!--- ========================================================= --->
<!--- <CFELSE> --->



		<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">

			SELECT *
			FROM loan_officers
			WHERE comp_id = #comp_id#
			ORDER BY lo_lname ASC

		</CFQUERY>


	<table width=777 cellpadding=1 cellspacing=1 border=0>
		<tr>
			<td width=777  align=center valign=top>
				<img src="images/clear.gif" width=777 height=10 alt="" border="0">
				<font size=2 color=black face=arial>
				<CENTER>

				Please choose a <font size=2 color=blue face=arial><B>Loan Officer</B></font> from the list below, to proceed <br>
				with the login process.</CENTER>
			</td>
		</tr>



		<tr>
			<td width=777 align=center valign=top>

	<table bgcolor=gray border="0" align="center" width=425 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor=d3d3d3 width="280" align="center" valign="top">
		  		<font face="arial" size="2" color="black">
				Loan Officers for </font> <cfoutput><b><font color = blue>#read_company.company#</font></b></cfoutput>:

			</td>

			<td bgcolor=f1f1f1 width="145" align="center" valign="top" bgcolor="a2a3fe">
				<select name="lo_id"
					size="1"
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: E4E3E3;
					border-color: white;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;
					clear: none;
					float: none;"
					rows="3"
					cols="45"
					>
				<CFOUTPUT QUERY="read_loan_offcr">
					<option value="#ID#">#oname#</option>
				</CFOUTPUT>
				</SELECT>
			</td>
		</tr>
<CFOUTPUT>
        <CFIF #emp# neq "0">
            <CFIF #read_company_user.Administrator# eq "1">
		        <tr>
			        <td bgcolor=f1f1f1 colspan = 2 width="425" align="center" valign="top">
                        <br><font face="arial" size="2" color="black">To add a Loan Officer click here > </font> <a href="./calyx_loan_offcr_add_officer.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#" ><img src="./images/button_add.gif" border=0></a>
                    </td>
                </tr>
            </CFIF>
        <CFELSE>
            <tr>
			    <td bgcolor=f1f1f1 colspan = 2 width="425" align="center" valign="top">
                    <br><font face="arial" size="2" color="black">To add a Loan Officer click here > </font> <a href="./calyx_loan_offcr_add_officer.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#" ><img src="./images/button_add.gif" border=0></a>
                </td>
            </tr>
        </CFIF>
</CFOUTPUT>
	</table>

			</td>
		</tr>


</table>


<nobr><cfoutput><a href="./calyx_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>


					</td>

				</tr>
			</table>

				</td>
			</tr>
			</table>


				</td>
			</tr>

			<tr><td width=780 align=center valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>

			</table>

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