<cfif isDefined("url.title")>
<cfset form.title = url.title>
</cfif>
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="lo_id" DEFAULT="0">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="user_id_1" DEFAULT="">
<CFPARAM NAME="title" DEFAULT="0">
<CFPARAM NAME="appraisal" DEFAULT="0">
<CFPARAM NAME="property" DEFAULT="0">
<CFPARAM NAME="other" DEFAULT="0">
<CFPARAM NAME="final_document_retrieval" DEFAULT="0">
<CFPARAM NAME="policy_recovery" DEFAULT="0">
<CFPARAM NAME="emp" DEFAULT="0">
<CFPARAM NAME="new_co_id" DEFAULT="0">
<CFPARAM NAME="ordering_co" DEFAULT="0">

<cfif new_co_id neq 0>
<cfset ordering_co = comp_id>
<cfset comp_id = new_co_id>
</cfif>

<!---If there are users set up in table companies_user then see who it is
and see if they have admin privleges because if they don't they can't add or modify.---->

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

<CFQUERY datasource="#request.dsn#" NAME="read_user1">

			SELECT *
			FROM users
			WHERE id = #read_company.id#
			and a_status = 1
			ORDER BY lp_fname ASC

		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_user">

			SELECT *
			FROM users
			WHERE id = #read_company.id#
			and a_status = 1
			ORDER BY lp_fname ASC

		</CFQUERY>

<cfoutput>
<cfset comp_id = #read_company.id#>

</cfoutput>
<CFIF IsDefined("form.title") is True OR #title# eq 1> <cfset title=#title#> <cfelse> <cfset title=0></cfif>
<CFIF IsDefined("form.property") is True OR #property# eq 1> <cfset property=#property#> <cfelse> <cfset property=0></cfif>
<CFIF IsDefined("form.appraisal") is True OR #appraisal# eq 1> <cfset appraisal=#appraisal#> <cfelse> <cfset appraisal=0></cfif>
<CFIF IsDefined("form.other") is True OR #other# eq 1> <cfset other=#other#> <cfelse> <cfset other=0></cfif>
<CFIF IsDefined("form.policy_recovery") is True OR #policy_recovery# eq 1> <cfset policy_recovery=#policy_recovery#> <cfelse> <cfset policy_recovery=0></cfif>
<CFIF IsDefined("form.final_document_retrieval") is True OR #final_document_retrieval# eq 1> <cfset final_document_retrieval=#final_document_retrieval#> <cfelse> <cfset final_document_retrieval=0></cfif>
<cfif #title# eq 1 or #property# eq 1 or #appraisal# eq 1 or #other# eq 1 or #policy_recovery# eq 1 or #final_document_retrieval# eq 1>
			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
			<HTML>
			<HEAD>
			<TITLE><cfoutput>#session.site.short_name#</cfoutput> Admin</TITLE>

			<script type="text/javascript">
			function ValidateForm(frm)
{
frm = document.frm;

if (frm.user_id_1.value=='') {
 alert("A Loan Processor needs to be selected in order to proceed! If none is available you may add one by clicking the Add button below")
 frm.user_id_1.focus();
      return false;
 }

 if (frm.lo_id.value=='') {
 alert("A Loan Officer needs to be selected in order to proceed! If none is available you may add one by clicking the Add button below")
 frm.lo_id.focus();
      return false;
 }
		return true;

 }
 </script>
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

	<cfFORM NAME="Search" METHOD="Post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#">

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
		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		   <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="./client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
         <CFIF #read_company.companies_switch# eq "1">
            <CFIF isdefined("read_company_user.Administrator") and #read_company_user.Administrator# eq "1">
                <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#&ordering_co=#ordering_co#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
            </CFIF>
         <CFELSE>
            <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#&ordering_co=#ordering_co#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
        </CFIF>
	    <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
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
			and a_status = 1
			<cfif read_company.streamline_client eq 'True' and Mid(read_company.company, 1, 3) neq 'S&D'>
			or streamline_emp = 'True'
			</cfif>
			ORDER BY  lp_lname ASC

		</CFQUERY>
<CFFORM name = "frm" ACTION="./form_title_request_addr.cfm?emp=#emp#&comp_id=#comp_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&final_document_retrieval=#final_document_retrieval#&policy_recovery=#policy_recovery#&zip_trigger=0&ordering_co=#ordering_co#" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>


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
			<CFOUTPUT QUERY="read_users"><cfif read_users.streamline_emp neq 'True'><OPTION VALUE="#ID#">#lp_fname# #lp_lname#</OPTION></cfif></CFOUTPUT>
			<CFOUTPUT QUERY="read_users"><cfif read_users.streamline_emp eq 'True'><OPTION VALUE="#ID#">(ST) #lp_fname# #lp_lname#</OPTION></cfif></CFOUTPUT>
			<OPTION VALUE=""></OPTION>

			</SELECT>

			</td>
		</tr>
<CFOUTPUT>
        <CFIF #emp# neq "0">
            <CFIF isdefined("read_company_user.Administrator") and #read_company_user.Administrator# eq "1">
                <tr>
			        <td bgcolor=f1f1f1 colspan = 2 width="425" align="center" valign="top">
                    <br><font face="arial" size="2" color="black">Modify a Processor > <a href="./loan_proc_modify_order.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&final_document_retrieval=#final_document_retrieval#&policy_recovery=#policy_recovery#&ordering_co=#ordering_co#"><img src="./images/button_modify.gif" border=0></a>. Add a new Processor > </font> <a href="./loan_proc_add_order.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&final_document_retrieval=#final_document_retrieval#&policy_recovery=#policy_recovery#&ordering_co=#ordering_co#"><img src="./images/button_add.gif" border=0></a>
                    </td>
                </tr>
            </CFIF>
        <CFELSE>
            <tr>
			    <td bgcolor=f1f1f1 colspan = 2 width="425" align="center" valign="top">
                    <br><font face="arial" size="2" color="black">Modify a Processor > <a href="./loan_proc_modify_order.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&final_document_retrieval=#final_document_retrieval#&policy_recovery=#policy_recovery#&ordering_co=#ordering_co#"><img src="./images/button_modify.gif" border=0></a>. Add a new Processor > </font> <a href="./loan_proc_add_order.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&final_document_retrieval=#final_document_retrieval#&policy_recovery=#policy_recovery#&ordering_co=#ordering_co#"><img src="./images/button_add.gif" border=0></a>
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
			and a_status = 1
			<cfif read_company.streamline_client eq 'True' and Mid(read_company.company, 1, 3) neq 'S&D'>
			or streamline_emp = 'True'
			</cfif>
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
				<CFOUTPUT QUERY="read_loan_offcr"><cfif read_loan_offcr.streamline_emp neq 'True'><OPTION VALUE="#ID#">#lo_fname# #lo_lname#</OPTION></cfif></CFOUTPUT>
			<CFOUTPUT QUERY="read_loan_offcr"><cfif read_loan_offcr.streamline_emp eq 'True'><OPTION VALUE="#ID#">(ST) #lo_fname# #lo_lname#</OPTION></cfif></CFOUTPUT>
				<OPTION VALUE=""></OPTION>
				</SELECT>
			</td>
		</tr>
<CFOUTPUT>
        <CFIF #emp# neq "0">
            <CFIF isdefined("read_company_user.Administrator") and #read_company_user.Administrator# eq "1">
		        <tr>
			        <td bgcolor=f1f1f1 colspan = 2 width="425" align="center" valign="top">
	                <br><font face="arial" size="2" color="black">Modify an Officer > <a href="./loan_offcr_modify_order.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&final_document_retrieval=#final_document_retrieval#&policy_recovery=#policy_recovery#&ordering_co=#ordering_co#"><img src="./images/button_modify.gif" border=0></a>. Add a new Officer > <a href="./loan_offcr_add_order.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&final_document_retrieval=#final_document_retrieval#&policy_recovery=#policy_recovery#&ordering_co=#ordering_co#"><img src="./images/button_add.gif" border=0></a></font>
                    </td>
                </tr>
            </CFIF>
        <CFELSE>
            <tr>
			    <td bgcolor=f1f1f1 colspan = 2 width="425" align="center" valign="top">
	                <br><font face="arial" size="2" color="black">Modify an Officer > <a href="./loan_offcr_modify_order.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&final_document_retrieval=#final_document_retrieval#&policy_recovery=#policy_recovery#&ordering_co=#ordering_co#"><img src="./images/button_modify.gif" border=0></a>. Add a new Officer > <a href="./loan_offcr_add_order.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&final_document_retrieval=#final_document_retrieval#&policy_recovery=#policy_recovery#&ordering_co=#ordering_co#"><img src="./images/button_add.gif" border=0></a></font>
                </td>
            </tr>
        </CFIF>
</CFOUTPUT>
	</table>
<br>
			</td>
		</tr>


</table>


<nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><IMG border=0 alt="Go back to main menu" src  ="./images/button_go_back.gif"></a>
</cfoutput><INPUT TYPE=image SRC="./images/button_continue.gif" border=0></nobr>

</cfform>
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

			<cfelse>

		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Property Request Form</title>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
</head>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="Post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#">

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
		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="./client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center>
<center>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->

					<tr>
						<td width=519 colspan=3  bgcolor="f1f1f1" align=center>
							<br><br><br><FONT FACE=ARIAL SIZE=2 color="red">
							<b>You cannot proceed to order if you do not choose at least a product. Please click the button below to go back to the previous page to select product(s)</b><p>
						</td>
					</tr>




					<tr>
						<td width=305  bgcolor="f1f1f1" align=center>

								</td>
						<td width=114  bgcolor="f1f1f1" align=center>


					</td>
					<td width=405  bgcolor="f1f1f1" align=center>

								</td>

					</tr>


					<tr>
						<td width=305  bgcolor="f1f1f1" align=center>

						</td>
						<td width=114  bgcolor="f1f1f1" align=center>



					</td>
					<td width=405  bgcolor="f1f1f1" align=center>

								</td>
					</tr>


			</table>

			</center>
<p>
		</TD>
	</TR>
		<tr><td width=770 align=center valign=bottom>	<br>
			<cfoutput><a href="./client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#&ordering_co=#ordering_co#"><img src="./images/button_go_back.gif" border=0 ALT="Go to main menu"></a>
			</cfoutput>
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

				</cfif>

