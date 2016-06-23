<CFPARAM NAME="emp" DEFAULT="0">

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
			<TITLE><cfoutput>#session.site.short_name#</cfoutput> Admin</TITLE>

			</HEAD>

			<BODY BGCOLOR=white TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



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
      &nbsp;</td>
  </tr>
</table>


			<table width=432 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
				<tr>
					<td width=432 align=center valign=top>

			<table width=432 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

				<tr>
					<td width=432 align=center valign=top bgcolor=e2e2e2>
						<FONT SIZE=2 color=black face=arial>

			<table width=432 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

			<CFOUTPUT>
				<tr>
					<td width=432 align=left valign=top bgcolor=white>

						Company - <B>#read_company.company#</B>
						<p>

					</td>
				</tr>
			</CFOUTPUT>

			</table>

					</td>
				</tr>

				<tr>
					<td width=432 align=center valign=top bgcolor=white>


			<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

<CFOUTPUT>

	<CFFORM METHOD=POST ACTION="./loan_offcr_add_submit_officer.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">


				<tr>

					<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
						<img src="./images/clear.gif" height=10 width=85>


					</td>
				</tr>



<!--- ===/ LOAN PROCESSOR INFO \=== --->

	<tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			Loan <B>Officer</B> Information :


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			First Name


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="lo_fname"  size=20 maxlength=30
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

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="lo_lname"  size=20 maxlength=30
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
    <CFIF #read_company.Companies_Switch# eq "1">
    <tr>
        <td width=430 colspan="2" align=center valign=top >
            <b>The User Name and Password are only needed if this person will be an Administrator</b>
        </td>
    </tr>
    <tr>
        <td width=130 align=right valign=top bgcolor=e6e6e6>
		    <font size=2 color=black face=arial>
			User Name
        </td>
         <td width=300 align=left valign=top bgcolor=e6e6e6>
			                                                            <CFINPUT  type=text name="username"  size=20 maxlength=30
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
			                                                            <CFINPUT  type=text name="password"  size=20 maxlength=30
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

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="lo_email"  size=30 maxlength=160
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

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="lo_phone"  size=23 maxlength=15
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

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="lo_ext"  size=10 maxlength=6
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

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT type=text name="lo_fax" size=23 maxlength=15
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
        <!---user permissions --->
                                                            <CFIF #read_company.Companies_Switch# eq "1">
                                                                <tr>
		                                                            <td width=130 align=right valign=top bgcolor=e6e6e6>
			                                                            <font size=2 color=black face=arial>
			                                                            Administrator
		                                                            </td>
                                                                    <td width=300 align=left valign=top bgcolor=e6e6e6>
                                                                        Yes <INPUT TYPE="RADIO" NAME="Administrator" VALUE="1"> No <INPUT TYPE="RADIO" NAME="Administrator" VALUE="0" checked>
                                                                    </td>
                                                                </tr></CFIF>
	<tr>

		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>

	</CFFORM>
</table>

</CFOUTPUT>

					</td>

				</tr>
			</table>

				</td>
			</tr>
			</table>

				</td>
			</tr>
			</table><tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>


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



