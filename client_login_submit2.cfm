
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
<cfoutput>
<cfset comp_id = #read_company.id#>

</cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>


	<title>1st Title & Esc. Settlement Services Company & Subsid. Companies<</title>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
</head>


<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

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




<table width="777"  border=1 cellpadding=0 cellspacing=0  valign=top>
  <tr>
    <td > </td>
  </tr>
</table>






<CFIF #read_company.recordcount# EQ 0>
<CFLOCATION URL="https://#cgi.server_name#/client/loginb.cfm?a_trigger=1">


<!--- ========================================================= --->
<CFELSE>

	<table width=777 cellpadding=1 cellspacing=1 border=0>
		<tr>
			<td width=777  align=center valign=top>
				<img src="images/clear.gif" width=777 height=10 alt="" border="0">
				<font size=2 color=black face=arial>
				<CENTER>
				<B>Login Successful</B>

				<p>
				Please choose <font size=2 color=blue face=arial><B>Loan Processor</B></font> from the list below, to proceed <br>
				with the login process.</CENTER>
			</td>
		</tr>

<cfFORM METHOD=POST ACTION="./client_acct_mgt.cfm?comp_id=#read_company.ID#">

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
			<CFOUTPUT QUERY="read_users"><OPTION VALUE="#ID#"> #lp_lname#, #lp_fname#</OPTION></CFOUTPUT>
			</SELECT>

			</td>
		</tr>
	<tr>
			<td bgcolor=f1f1f1 colspan = 2 width="425" align="center" valign="top">

	<CFOUTPUT>
		<br><font face="arial" size="2" color="black">To add a Loan Processor click here > </font> <a href="./loan_proc_add_c.cfm?comp_id=#comp_id#" target="New" onClick="window.open('','New','width=470,height=330,left=40,top=40,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_add.gif" border=0></a>
</CFOUTPUT>
	</td></tr>
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
					<option value="#ID#">#lo_lname#, #lo_fname#</option>
				</CFOUTPUT>
				</SELECT>
			</td>
		</tr>
		<tr>
			<td bgcolor=f1f1f1 colspan = 2 width="425" align="center" valign="top">

	<CFOUTPUT>
		<br><font face="arial" size="2" color="black">To add a Loan Officer click here > </font> <a href="./loan_offcr_add_c.cfm?comp_id=#comp_id#" target="New" onClick="window.open('','New','width=470,height=330,left=40,top=40,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_add.gif" border=0></a>
</CFOUTPUT>
	</td></tr>

	</table>

	<table  border="0" align="center" width=425 cellpadding="1" cellspacing=1>
        <tr>
			<td bgcolor=white colspan="2" width=425 align="center" valign="top">

			<p>
			<br>
			<input type="image" border=0 src="./images/button_proceed.gif">
			</td>
		</tr>

	</table>
</cfForm>

			</td>
		</tr>


</table>

<!--- ========================================================= --->


</cfif>




	<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>
</CENTER>
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