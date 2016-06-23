<CFPARAM NAME="emp" DEFAULT="0">

<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE ID = '#comp_id#'
	ORDER BY company ASC
</CFQUERY>

<cfif #read_company.recordcount# GT 0>
	<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE comp_id = #read_company.id#
		ORDER BY lp_lname ASC
	</CFQUERY>

    <CFIF #read_company.companies_switch# eq "1">
    <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
        SELECT *
        FROM companies_user
        WHERE ID = #emp#
    </CFQUERY>
    <CFSET emp = #read_company_user.ID#>
</CFIF>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">
	SELECT *
	FROM loan_officers
	WHERE ID = #lo_ID#
</CFQUERY>

<cfif #title# eq 1>
	<CFQUERY datasource="#request.dsn#" NAME="read_title">
		SELECT *
		FROM title
		WHERE title_ID = #title_id#
	</CFQUERY>
</cfif>

<cfif #property# eq 1>
	<CFQUERY datasource="#request.dsn#" NAME="read_prop">
		SELECT *
		FROM property
		WHERE prop_ID = #prop_id#
	</CFQUERY>
</cfif>

<cfif #other# eq 1>
	<CFQUERY datasource="#request.dsn#" NAME="read_anc">
		SELECT *
		FROM ancillary
		WHERE anc_ID = #anc_id#
	</CFQUERY>
</cfif>

<cfif #appraisal# eq 1>
	<CFQUERY datasource="#request.dsn#" NAME="read_app">
		SELECT *
		FROM appraisal
		WHERE app_ID = #app_id#
	</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_user">
	SELECT *
	FROM user_client_assoc
	WHERE company_id = #read_user.comp_id#
	order by id
</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Title Request Form</title>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
</head>

<BODY BGCOLOR="white" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  	<TBODY>
   		<tr>
  			<td align = "center">
				<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
 					 <tr>
    					<td rowspan="2" valign="top" width="220">
							<cfinclude template="logo_swap_include.cfm">
						</td>
    					<td valign="top" align="right">
							<br>
<cfFORM NAME="Search" METHOD="Post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">
							<table border=0 align="right" cellpadding="0" cellspacing=0>
								<tr>
									<td align="right" valign="center">
  										<a href="/quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
										&nbsp;&nbsp;
									</td>
  									<td align="right" valign="center">
										<input type="text" name="number" size=10>
									</td>
  									<td align="right" valign="center">
										&nbsp;
										<input type="image" src="/client/images/searchgo.jpg" border=0 alt="Begin your Web search">
									</td>
  								</tr>
							</table>
 </cfFORM>
						</td>
 					 </tr>
  					<tr>
    					<td valign="top" align="center" width="560"><nobr></nobr><br>
      						&nbsp;
						</td>
  					</tr>
				</table>
			</td>
		</tr>
	</tbody>
</table>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
	<TBODY>
   		<tr>
  			<td>
				<center>
					<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
				<center>
<CFOUTPUT>			<TR>
		  				<td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="./client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          				<td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
				        <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
						<CFIF #read_company.companies_switch# eq "1">
                            <CFIF #read_company_user.Administrator# eq "1">
                                <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
					        </CFIF>
                        <CFELSE>
                            <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="./client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
                        </CFIF>
                        <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
						<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
					</tr>
</CFOUTPUT>
				</center>
			     </table>
				</center>
				<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                	<TBODY>
						<tr>
							<td width=770 align=center valign=top bgcolor=elelel>
                                <p><br>
							    <p>
<cfoutput>			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER(S)</B></center><br><p>

<cfif #title# eq 1>
					<center>Your Title Commitment Request Order has been Processed. Order number is <a href="./view_the_order.cfm?emp=#emp#&comp_id=#comp_id#&order_id=#read_title.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>T-#read_title.title_id#</b></a></center><br>
					<cfif comp_id neq 3889>
<center>A HUD-1 has been
					instantly prepared for you! Click
					<cfif #read_title.hud_type# eq "0">
						<a href="./title_view_hud_pg1.cfm?emp=#emp#&rec_id=#title_id#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New" onClick="window.open('','New','left=0,top=0,width=800,height=550,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img border=0 src="./images/button_est_hud_1.gif"></a>
					<cfelse>
                        <a href="./title_view_hud1a.cfm?emp=#emp#&rec_id=#title_id#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New" onClick="window.open('','New','left=0,top=0,width=800,height=550,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img border=0 src="./images/button_est_hud_1.gif"></a>
					</cfif>now OR view <a href="./fee_sheet.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>closing fees</b></a>.</center></cfif><br>
</cfif>
<cfif #property# eq 1>
                    <center>Your Property Request Order has been Processed. Order number is <a href="./view_the_prop_order.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#read_prop.prop_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_flag=7"><b>P-0232#read_prop.prop_id#</b></a></center><br>
					<cfif #read_prop.hud# eq 1>
                        <cfif comp_id neq 3889>
<center>A HUD-1 has been
						instantly prepared for you! Click
						<cfif #read_prop.hud_type# eq "0">
							<a href="./prop_view_hud_pg1.cfm?emp=#emp#&rec_id=#prop_id#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New" onClick="window.open('','New','left=0,top=0,width=800,height=550,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img border=0 src="./images/button_est_hud_1.gif"></a>
						<cfelse>
                            <a href="./prop_view_hud1a.cfm?emp=#emp#&rec_id=#prop_id#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New" onClick="window.open('','New','left=0,top=0,width=800,height=550,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img border=0 src="./images/button_est_hud_1.gif"></a></cfif>now.</center><br>
                        </cfif></cfif>
				    </cfif>
			        <cfif #appraisal# eq 1>
				        <center>Your Appraisal Request Order has been Processed. Order number is <a href="./title_report_nav_appraisal.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#read_app.app_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_flag=7"><b>A-#read_app.app_id#</b></a></center><br>
			        </cfif>
			        <cfif #other# eq 1>
                        <center>Your Ancillary Request Order has been Processed. <br>You have ordered --
				        <cfif #read_anc.codeflood# eq "F">
					        Flood: <a href="/title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#read_anc.anc_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_flag=7&code=F"><b>F-#read_anc.anc_id#</b></a>
				        </cfif>
				        <cfif #read_anc.codeAVM# eq "AVM">
					        &nbsp;&nbsp;AVM: <a href="/title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#read_anc.anc_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_flag=7&code=AVM"><b>AVM-#read_anc.anc_id#</b></a>
				        </cfif>
				        <cfif #read_anc.codeCR# eq "CR">
					        &nbsp;&nbsp;Credit: <a href="/title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#read_anc.anc_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_flag=7&code=CR"><b>CR-#read_anc.anc_id#</b></a>
				        </cfif>
				        <cfif #read_anc.codeSigning# eq "SN">
					        &nbsp;&nbsp;Signing: <a href="/title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#read_anc.anc_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_flag=7&code=SN"><b>SN-#read_anc.anc_id#</b></a>
				        </cfif>
                        </center>
                        <br><br>
						<center>
						<a href="/title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0">CLICK HERE TO RETREIVE YOUR COMPLETED REPORTS AND CHECK STATUS</a>
                        </center>
                        <br>
			        </cfif>
</cfoutput>
                        <br>
                    </TD>
               </tr>
            </table>
<cfif #title# eq 1 or #property# eq 1 or #appraisal# eq 1>

			<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=770 align=center colspan = 4 valign=top bgcolor=elelel>
			<p>
			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST</b></FONT></center>
				<p>
				</td>
				</tr>
			</center>
			<CFINCLUDE TEMPLATE="./includes/CustomerService.cfm">
			</table>
</cfif>
	<TABLE WIDTH=770 BORDER=0 CELLSPACING=0 align="center" bgcolor=d3d3d3>
		<tr>
			<td width=770 colspan = 5 align=center valign=bottom>
				<cfoutput>
				<a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">Return Home</a> to place another <strong>Order</strong> or access <strong>Quick Search</strong> to get to a file
				</cfoutput><p>
			</td>
		</tr>
	</table>
	<tr>
		<td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td>
	</tr>
</TBODY></TABLE>
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
