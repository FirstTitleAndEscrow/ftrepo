<cfparam name="buyer_lname" default="">
<cfparam name="buyer_fname" default="">
<cfparam name="seller_fname" default="">
<cfparam name="seller_lname" default="">
<cfparam name="comments" default="">
<cfparam name="appraisal_status" default="">
<cfparam name="sortorder" default="">
<cfparam name="user_id" default="">
<cfparam name="oda_month" default="">
<cfparam name="title_id" default="">
<cfparam name="anc_id" default="">
<cfparam name="cr_id" default="">
<cfparam name="avm_id" default="">
<cfparam name="sn_id" default="">
<cfparam name="company_id" default="">
<cfparam name="calc" default="">
<cfparam name="loan_number" default="">
<cfparam name="confirm_mon" default="">
<cfparam name="comfirm_day" default="">
<cfparam name="confirm_year" default="">
<cfparam name="comfirm_day_to" default="">
<cfparam name="confirm_mon_to" default="">
<cfparam name="confirm_year_to" default="">
<cfparam name="titlemail" default="">
<CFSET r_count = "0">
<CFPARAM NAME="emp" DEFAULT="0">


<cfif #a_trigger# eq "1">

	<!---- BEGIN MODIFY  ----->
<cfoutput>

		<CFIF IsDefined("confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
</cfif></CFIF>
<CFIF IsDefined("comfirm_day")><cfif #comfirm_day# NEQ "Day">
	<CFSET comfirm_day = #comfirm_day#>
</cfif></CFIF>
<CFIF IsDefined("confirm_year")><cfif #confirm_year# NEQ "Year">
	<CFSET confirm_year = #confirm_year#>
</cfif></CFIF>
		 <CFIF IsDefined("confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	<CFSET confirm_mon_to = #confirm_mon_to#>
</cfif></CFIF>
<CFIF IsDefined("comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
	<CFSET comfirm_day_to = #comfirm_day_to#>
</cfif></CFIF>
<CFIF IsDefined("confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
	<CFSET confirm_year_to = #confirm_year_to#>
</cfif></CFIF>
		<CFIF IsDefined("form.titlemail")><cfif #titlemail# NEQ "">
	<CFSET titlemail = #titlemail#>
</cfif></CFIF>



		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>

<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	<CFSET title_id = #title_id#>
</cfif></CFIF>

<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>


</cfoutput>



<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM Title
			WHERE
			<!--- <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif> --->
			 <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			comp_id = '#comp_id#'
			</cfif>

		<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>




			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>


			 	<CFIF #title_id# NEQ "none">
				AND title_id = '#title_id#'
			</CFIF>
			<!---  <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
			</CFIF>  --->


			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>
		<!--- comp_id ASC,user_id ASC,--->
		<CFSET r_count = #read_report.recordcount#>


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
<CFIF #read_company.companies_Switch# eq "1">
    <CFQUERY datasource="#request.dsn#" NAME="read_company_user">
    SELECT *
    FROM companies_user
    WHERE id = #emp#
    </CFQUERY>

    <CFSET emp = #read_company_user.ID#>
</CFIF>

</cfif>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
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
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

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
		   <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="/contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
        <CFIF #read_company.companies_switch# eq "1">
            <CFIF #read_company_user.Administrator# eq "1">
                <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
            </CFIF>
        <CFELSE>
            <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
        </CFIF>
    	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

 <table width=770 border="1" cellpadding="0" cellspacing="0" >
  <TBODY>

	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>

	<nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Committment Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=770 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT><A HREF="./title_client_rep_display.cfm?emp=#emp#&confirm_mon=#confirm_mon#&comfirm_day=#comfirm_day#&confirm_year=#confirm_year#&confirm_mon_to=#confirm_mon_to#&comfirm_day_to=#comfirm_day_to#&confirm_year_to=#confirm_year_to#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.title_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&title_id=#title_id#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>
					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./title_client_rep_display.cfm?emp=#emp#&confirm_mon=#confirm_mon#&comfirm_day=#comfirm_day#&confirm_year=#confirm_year#&confirm_mon_to=#confirm_mon_to#&comfirm_day_to=#comfirm_day_to#&confirm_year_to=#confirm_year_to#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&loan_number=#loan_number#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=1"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT><A HREF="./title_client_rep_display.cfm?emp=#emp#&confirm_mon=#confirm_mon#&comfirm_day=#comfirm_day#&confirm_year=#confirm_year#&confirm_mon_to=#confirm_mon_to#&comfirm_day_to=#comfirm_day_to#&confirm_year_to=#confirm_year_to#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.title_id#&loan_number=#loan_number#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=1"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>
<A HREF="./title_client_rep_display.cfm?emp=#emp#&confirm_mon=#confirm_mon#&comfirm_day=#comfirm_day#&confirm_year=#confirm_year#&confirm_mon_to=#confirm_mon_to#&comfirm_day_to=#comfirm_day_to#&confirm_year_to=#confirm_year_to#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&loan_number=#loan_number#&title_id=#title_id#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_report.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>
<A HREF="./title_client_rep_display.cfm?emp=#emp#&confirm_mon=#confirm_mon#&comfirm_day=#comfirm_day#&confirm_year=#confirm_year#&confirm_mon_to=#confirm_mon_to#&comfirm_day_to=#comfirm_day_to#&confirm_year_to=#confirm_year_to#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&loan_number=#loan_number#&title_id=#title_id#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>		</TD>
				</TR>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=770 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td> --->

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<!---------------------------------------------------->
		<!--- SET COUNT_END FOR RECORD DISPLAY --->
		<!---------------------------------------------------->
		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="read_report" startrow="#count#" endrow="#count_end#">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #title_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav.cfm?emp=#emp#&confirm_mon=#confirm_mon#&comfirm_day=#comfirm_day#&confirm_year=#confirm_year#&confirm_mon_to=#confirm_mon_to#&comfirm_day_to=#comfirm_day_to#&confirm_year_to=#confirm_year_to#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td><!--- &company_id=#company_ID# --->
						<cfif #calc# eq "yes">
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_client_report_nav_calc.cfm?emp=#emp#&confirm_mon=#confirm_mon#&comfirm_day=#comfirm_day#&confirm_year=#confirm_year#&confirm_mon_to=#confirm_mon_to#&comfirm_day_to=#comfirm_day_to#&confirm_year_to=#confirm_year_to#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>
					<cfelse>
					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_client_report_nav.cfm?emp=#emp#&confirm_mon=#confirm_mon#&comfirm_day=#comfirm_day#&confirm_year=#confirm_year#&confirm_mon_to=#confirm_mon_to#&comfirm_day_to=#comfirm_day_to#&confirm_year_to=#confirm_year_to#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>
					</cfif>
					</tr>





						<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->


<cfif #titlemail# neq "">


		<CFMAIL
				TO="#titlemail#"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="Auto-send Title Commitments"
				TIMEOUT="600"
				type="html"
				>

			<CFLOOP QUERY="read_report">
		<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #title_ID#
		</CFQUERY>
			<cfif #read_ins_committments.insurance_co# eq "15">
		Loan Number #loan_number# -	<A HREF="./title_committment_view_amer_pioneer_ins_all.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1&company_id=0" target="new">American Pioneer Title Insurance Commitment</a> - Order Number #title_id# - #bfirstname1# #blastname1#</B></font><br>
			<cfelseif #read_ins_committments.insurance_co# eq "16">
			Loan Number #loan_number# - <A HREF="./title_committment_view_stewart_title_ins.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1&company_id=0" target="new">Stewart Title Insurance Commitment</a> - Order Number #title_id# - #bfirstname1# #blastname1#</B></font><br>
<cfelse>
Loan Number #loan_number# - <A HREF="./title_committment_view_amer_pioneer_ins_fl.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1&company_id=0" target="new">Florida Title Insurance Commitment</a> - Order Number #title_id# - #bfirstname1# #blastname1#</B></font><br>

</cfif>
			</CFLOOP>

			</cfmail>

	</cfif>



		<CFIF #r_count# LTE "5">
	<TABLE><TR>
	<td width = 400 bgcolor="BFFFBF"  align=left valign=top>

					<p><font face="Arial, Helvetica, sans-serif" size="2">The "details" button allows you to: </font></p>

<ul><li><font face="Arial, Helvetica, sans-serif" size="2">View and print completed title committment</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View HUD-1 for instant fees</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Activate Endorsement Express* - instant endorsements</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View and print your Closing Protection Letter of request</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View scheduled closing information</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Check status of file</li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Upload documents to the site</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View or modify your orders.</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Contact your processing team</font></li>
</ul>






									</td>
				<td width = 400 bgcolor="BFFFBF"  align=center valign=top> <TABLE><TR><td width = 350 bgcolor="BFFFBF"  align=left valign=top><p><br><br>
<font face="Arial, Helvetica, sans-serif" size="2"><center><b>New Web System Highlights -</center></b><br><br>
11/03/03 - EXPANDED Comments System for orders - CLIENTS may now add their
own notes directly into existing product orders that will instantly transmit
to their First Title Client Services Team. Click "Add/View" in the Comments
area above to activate this new feature.</font>
				</p></td>
					</tr></TABLE>
				</td>
					</tr></TABLE>
	</CFIF>


		</table>
		<!--- <nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>
			 --->



			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

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


		<cfelseif #a_trigger# eq "9">

	<cfoutput>

		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>
	<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>

<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	<CFSET title_id = #title_id#>
</cfif></CFIF>
<!--- <CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF> --->
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
	<CFSET comfirm_day = #comfirm_day#>
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
	<CFSET confirm_year = #confirm_year#>
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	<CFSET confirm_mon_to = #confirm_mon_to#>
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
	<CFSET comfirm_day_to = #comfirm_day_to#>
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
	<CFSET confirm_year_to = #confirm_year_to#>
</cfif></CFIF>


</cfoutput>



<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM title a, title_closing_order_request b, eventlist e where a.title_id = b.title_id and a.title_id = e.title_id and b.request_date is not null

			and a.cancelled is null

		<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
<cfif #appraisal_status# eq "Closing Request">
			and (a_filled_out_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
		<cfelseif #appraisal_status# eq "Closing Scheduled">
		and (e.yearmonth between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
		<cfelseif #appraisal_status# eq "Loan Closed">
			and (e.l_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
		<cfelse>
		and (a_filled_out_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
		</cfif>

			</cfif>

			and

			<cfif #comp_id# eq "154">
			(a.comp_id = 154 or a.comp_id = 184 or a.comp_id = 185 or a.comp_id = 186 or a.comp_id = 187 or a.comp_id = 188 or a.comp_id = 189 or a.comp_id = 190 or a.comp_id = 159 or a.comp_id = 155 or a.comp_id = 168 or a.comp_id = 157 or a.comp_id = 158 or a.comp_id = 167 or a.comp_id = 170 or a.comp_id = 166 or a.comp_id = 160 or a.comp_id = 169 or a.comp_id = 161 or a.comp_id = 156 or a.comp_id = 162 or a.comp_id = 163 or a.comp_id = 164 or a.comp_id = 165 or a.comp_id = 181 or a.comp_id = 192 or a.comp_id = 193 or a.comp_id = 194 or a.comp_id = 195 or a.comp_id = 196 or a.comp_id = 197 or a.comp_id = 198 or a.comp_id = 199 or a.comp_id = 200 or a.comp_id = 201 or a.comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(a.comp_id = 953 or a.comp_id = 941 or a.comp_id = 942 or a.comp_id = 943 or a.comp_id = 944 or a.comp_id = 945 or a.comp_id = 946  or a.comp_id = 947 or a.comp_id = 948 or a.comp_id = 949 or a.comp_id = 950 or a.comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(a.comp_id = 1017 or a.comp_id = 559 or a.comp_id = 859 or a.comp_id = 941 or a.comp_id = 942 or a.comp_id = 919 or a.comp_id = 953 or a.comp_id = 943 or a.comp_id = 944 or a.comp_id = 945 or a.comp_id = 946  or a.comp_id = 947 or a.comp_id = 948 or a.comp_id = 949 or a.comp_id = 950 or a.comp_id = 951 or a.comp_id = 746)

			<cfelse>
			a.comp_id = '#comp_id#'
			</cfif>

			<CFIF #appraisal_status# NEQ "none">
				AND a.appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND a.comments = '#comments#'

			</CFIF>

		<CFIF #loan_number# NEQ "">
				AND a.loan_number = '#loan_number#'

			</CFIF>

			 	<CFIF #title_id# NEQ "none">
				AND a.title_id = '#title_id#'
			</CFIF>



			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    a.oda_month DESC, a.oda_day DESC, a.oda_year DESC
		</cfif> </CFQUERY>

		<CFSET r_count = #read_report.recordcount#>



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
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
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
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

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
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

 <table width=770 border="1" cellpadding="0" cellspacing="0" >
  <TBODY>

	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>
		<nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=black>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closing Request Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=770 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
		</TD>
				</TR>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=770 cellpadding=1 cellspacing=1 border=0>

					<tr>



							<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Scheduled Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan #
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

							<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<cfset var = "1">
						<cfif #var# eq "1">

						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Ship Date
						</td>
						<td bgcolor=gray width=250 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							UPS Tracking #
						</td>
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<cfelse>
							<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						</cfif>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	<!---  <CFIF #a_trigger# EQ "1">  --->


		<!---------------------------------------------------->
		<!--- SET COUNT_END FOR RECORD DISPLAY --->
		<!---------------------------------------------------->

			 <CFLOOP QUERY="read_report">


			<CFOUTPUT>
					<tr>




							<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #appraisal_status# eq "Closing Request">
		#DateFormat(a_filled_out_date, "m/d/yyyy")#
		<cfelseif #appraisal_status# eq "Closing Scheduled">
		#DateFormat(yearmonth, "m/d/yyyy")#
		<cfelseif #appraisal_status# eq "Loan Closed">
			#DateFormat(l_date, "m/d/yyyy")#
		<cfelse>
		#DateFormat(a_filled_out_date, "m/d/yyyy")#
		</cfif>

						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_report_nav.cfm?emp=#emp#&comp_id=#comp_id#&company_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1">C-#title_id#</a>
						</td>
								<td bgcolor=#a_bgcolor# width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#loan_number#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<cfset var = "1">
						<cfif #var# eq "1">

						<CFQUERY datasource="#request.dsn#" NAME="read_all_notes2">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #title_id# AND N_Note LIKE 'UPS%'
				ORDER BY Note_ID ASC
			</CFQUERY>

			<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(READ_ALL_NOTES2.N_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=250 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">

			#READ_ALL_NOTES2.N_NOTE#
			</td>
			<td bgcolor=#a_bgcolor# width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
				<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #title_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>

				<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
			</td>
						<CFELSE>
										<td bgcolor=#a_bgcolor# width=250 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #title_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif></CFIF>
						</td>
						<!--
					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_closing_report_nav.cfm?emp=#emp#&comp_id=#comp_id#&company_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1"><img src="./images/button_detail.gif" border=0 ALT="view closing"></a>
						</td>-->

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->




			<cfset var = "1">
						<cfif #var# eq "1">




	<CFQUERY datasource="#request.dsn#" NAME="read_reportold">

			SELECT *
			FROM title a, title_closing_order_request b, eventlist e where a.title_id = b.title_id and a.title_id = e.title_id and e.yearmonthold is not null

			and a.cancelled is null

		<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

		and (e.yearmonthold between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')

			</cfif>
			and a.comp_id = #url.comp_id#
			</CFQUERY>

	<cfif #read_reportold.recordcount# GT 0>

			<tr>



							<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Old Scheduled Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan #
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

							<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>


						<td bgcolor=gray width=250 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Postpone Reason
						</td>
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
					<td bgcolor=gray width=1 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						&nbsp;
						</td>

					</tr>





		 <CFLOOP QUERY="read_reportold">


			<CFOUTPUT>
					<tr>




							<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(yearmonthold, "m/d/yyyy")# #TimeFormat(c_timeold, "HH:mm:ss")#
						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_report_nav.cfm?emp=#emp#&comp_id=#comp_id#&company_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1">C-#title_id#</a>
						</td>
								<td bgcolor=#a_bgcolor# width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#loan_number#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

						<CFQUERY datasource="#request.dsn#" NAME="read_all_notes2">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #title_id# AND N_Note LIKE 'Postponed%'
				ORDER BY Note_ID ASC
			</CFQUERY>


						<td bgcolor=#a_bgcolor# width=250 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">

			#READ_ALL_NOTES2.N_NOTE#
			</td>
			<td bgcolor=#a_bgcolor# width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
				<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #title_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>

				<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
			</td>

						<td bgcolor=#a_bgcolor# width=1 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						&nbsp;
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->

	</cfif>
		</cfif>

		</table>
		<!--- <nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>
			 --->



			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

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

<cfelseif #a_trigger# eq "2">

	<cfoutput>

		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>
	<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>

<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	<CFSET prop_id = #prop_id#>
</cfif></CFIF>
<!--- <CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF> --->
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>



<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM property
			WHERE

			<!--- <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif> --->

			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
		<cfelseif #comp_id# eq "1017">
			(comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			comp_id = '#comp_id#'
			</cfif>
			<!---  <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif> --->


			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>

		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>

			 	<CFIF #prop_id# NEQ "none">
				AND prop_id = '#prop_id#'
			</CFIF>
			<!---  <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
			</CFIF>  --->


			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>
		<!--- comp_id ASC,user_id ASC,--->
		<CFSET r_count = #read_report.recordcount#>



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
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
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
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

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
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

 <table width=770 border="1" cellpadding="0" cellspacing="0" >
  <TBODY>

	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>
		<nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=purple>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=770 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.prop_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&prop_id=#prop_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=2">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>

					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.prop_id#&loan_number=#loan_number#&user_id=#user_id#&company_id=#company_id#&prop_id=#prop_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=2"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>

	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.prop_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&prop_id=#prop_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=2"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>

<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.prop_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&prop_id=#prop_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=2">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_report.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>
	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.prop_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&prop_id=#prop_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=2">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>		</TD>
				</TR>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=770 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td> --->

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<!---------------------------------------------------->
		<!--- SET COUNT_END FOR RECORD DISPLAY --->
		<!---------------------------------------------------->
		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="read_report" startrow="#count#" endrow="#count_end#">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							P-0232#prop_id#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #prop_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#prop_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./view_the_prop_order.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#prop_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->

			<CFIF #r_count# LTE "5">
	<TABLE><TR>
	<td width = 400 bgcolor="BFFFBF"  align=left valign=top>

					<p><font face="Arial, Helvetica, sans-serif" size="2">The "details" button allows you to: </font></p>

 <ul><li><font face="Arial, Helvetica, sans-serif" size="2">View and print completed title committment</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View HUD-1 for instant fees</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Activate Endorsement Express* - instant endorsements</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View and print your Closing Protection Letter of request</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View scheduled closing information</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Check status of file</li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Upload documents to the site</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View or modify your orders.</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Contact your processing team</font></li>
</ul>




									</td>
				<td width = 400 bgcolor="BFFFBF"  align=center valign=top> <TABLE><TR><td width = 350 bgcolor="BFFFBF"  align=left valign=top><p><br><br>
<font face="Arial, Helvetica, sans-serif" size="2"><center><b>New Web System Highlights -</center></b><br><br>
11/03/03 - EXPANDED Comments System for orders - CLIENTS may now add their
own notes directly into existing product orders that will instantly transmit
to their First Title Client Services Team. Click "Add/View" in the Comments
area above to activate this new feature.</font>
				</p></td>
					</tr></TABLE>
				</td>
					</tr></TABLE>
	</CFIF>



		</table>
		<!--- <nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>
			 --->



			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

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

<cfelseif #a_trigger# eq "3">


	<cfoutput>

		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>

<CFIF IsDefined("form.app_id")><cfif #app_id# NEQ "NONE">
	<CFSET app_id = #app_id#>
</cfif></CFIF>
<!--- <CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF> --->
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>



<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM appraisal
			WHERE

			<!--- <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif> --->
			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
		<cfelseif #comp_id# eq "1017">
			(comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			comp_id = '#comp_id#'
			</cfif>

			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>

		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>

			 	<CFIF #app_id# NEQ "none">
				AND app_id = '#app_id#'
			</CFIF>
			<!---  <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
			</CFIF>  --->


			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>
		<!--- comp_id ASC,user_id ASC,--->
		<CFSET r_count = #read_report.recordcount#>


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
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
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
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

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
		 <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

 <table width=770 border="1" cellpadding="0" cellspacing="0" >
  <TBODY>



	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>
	<nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Appraisal Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=770 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.app_id#&user_id=#user_id#&company_id=#company_id#&loan_number=#loan_number#&app_id=#app_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=3">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>

					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.app_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&app_id=#app_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=3"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>

	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.app_id#&user_id=#user_id#&company_id=#company_id#&loan_number=#loan_number#&app_id=#app_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=3"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>

<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.app_id#&user_id=#user_id#&company_id=#company_id#&app_id=#app_id#&loan_number=#loan_number#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=3">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_report.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>
	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.app_id#&user_id=#user_id#&company_id=#company_id#&app_id=#app_id#&loan_number=#loan_number#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=3">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>		</TD>
				</TR>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=770 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td> --->

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<!---------------------------------------------------->
		<!--- SET COUNT_END FOR RECORD DISPLAY --->
		<!---------------------------------------------------->
		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="read_report" startrow="#count#" endrow="#count_end#">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							APP-#app_id#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #app_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#app_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_appraisal.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#app_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->

			<CFIF #r_count# LTE "5">
	<TABLE><TR>
	<td width = 400 bgcolor="BFFFBF"  align=left valign=top>

					<p><font face="Arial, Helvetica, sans-serif" size="2">The "details" button allows you to: </font></p>

 <ul><li><font face="Arial, Helvetica, sans-serif" size="2">View and print completed title committment</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View HUD-1 for instant fees</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Activate Endorsement Express* - instant endorsements</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View and print your Closing Protection Letter of request</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View scheduled closing information</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Check status of file</li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Upload documents to the site</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View or modify your orders.</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Contact your processing team</font></li>
</ul>




									</td>
			<td width = 400 bgcolor="BFFFBF"  align=center valign=top> <TABLE><TR><td width = 350 bgcolor="BFFFBF"  align=left valign=top><p><br><br>
<font face="Arial, Helvetica, sans-serif" size="2"><center><b>New Web System Highlights -</center></b><br><br>
11/03/03 - EXPANDED Comments System for orders - CLIENTS may now add their
own notes directly into existing product orders that will instantly transmit
to their First Title Client Services Team. Click "Add/View" in the Comments
area above to activate this new feature.</font>
				</p></td>
					</tr></TABLE>
				</td>
					</tr></TABLE>
	</CFIF>



		</table>
		<!--- <nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>
			 --->



			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

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
<cfelseif #a_trigger# eq 4>
	<cfoutput>

		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>

<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>

<CFIF IsDefined("form.anc_id")><cfif #anc_id# NEQ "NONE">
	<CFSET anc_id = #anc_id#>
</cfif></CFIF>
<!--- <CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF> --->
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>



<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM ANCILLARY
			WHERE codeFlood is not null

			<!--- <cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
		and	comp_id = '#comp_id#'
			</cfif> --->
			<cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			and (comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
		<cfelseif #comp_id# eq "1017">
		and	(comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			and comp_id = '#comp_id#'
			</cfif>




			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>

		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>

			 	<CFIF #anc_id# NEQ "none">
				AND anc_id = '#anc_id#'
			</CFIF>
			<!---  <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
			</CFIF>  --->


			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>
		<!--- comp_id ASC,user_id ASC,--->
		<CFSET r_count = #read_report.recordcount#>


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
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
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
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

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
		   <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="./client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

 <table width=770 border="1" cellpadding="0" cellspacing="0" >
  <TBODY>




	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>
		<nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=orange>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Flood Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=770 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&loan_number=#loan_number#&user_id=#user_id#&company_id=#company_id#&anc_id=#anc_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=4">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>

					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&loan_number=#loan_number#&user_id=#user_id#&company_id=#company_id#&anc_id=#anc_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=4"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>

	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&anc_id=#anc_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=4"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>

<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&anc_id=#anc_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=4">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_report.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>
	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&anc_id=#anc_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=4">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>		</TD>
				</TR>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=770 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td> --->

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<!---------------------------------------------------->
		<!--- SET COUNT_END FOR RECORD DISPLAY --->
		<!---------------------------------------------------->
		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="read_report" startrow="#count#" endrow="#count_end#">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<cfif #codeFlood# neq "">F</cfif>-#anc_id#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

					<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>	 --->
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and note_type = 'S' and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav_sn.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->

				<CFIF #r_count# LTE "5">
	<TABLE><TR>
	<TABLE><TR>
	<td width = 400 bgcolor="BFFFBF"  align=left valign=top>

					<p><font face="Arial, Helvetica, sans-serif" size="2">The "details" button allows you to: </font></p>

 <ul><li><font face="Arial, Helvetica, sans-serif" size="2">View and print completed title committment</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View HUD-1 for instant fees</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Activate Endorsement Express* - instant endorsements</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View and print your Closing Protection Letter of request</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View scheduled closing information</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Check status of file</li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Upload documents to the site</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View or modify your orders.</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Contact your processing team</font></li>
</ul>






									</td>
			<td width = 400 bgcolor="BFFFBF"  align=center valign=top> <TABLE><TR><td width = 350 bgcolor="BFFFBF"  align=left valign=top><p><br><br>
<font face="Arial, Helvetica, sans-serif" size="2"><center><b>New Web System Highlights -</center></b><br><br>
11/03/03 - EXPANDED Comments System for orders - CLIENTS may now add their
own notes directly into existing product orders that will instantly transmit
to their First Title Client Services Team. Click "Add/View" in the Comments
area above to activate this new feature.</font>
				</p></td>
					</tr></TABLE>
				</td>
					</tr></TABLE>
	</CFIF>



		</table>
		<!--- <nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>
			 --->



			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

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

<cfelseif #a_trigger# eq 5>
	<cfoutput>

		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>

<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>

<CFIF IsDefined("form.cr_id")><cfif #cr_id# NEQ "NONE">
	<CFSET cr_id = #cr_id#>
</cfif></CFIF>
<!--- <CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF> --->
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>



<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM ANCILLARY
			WHERE codeCR is not null

			<!--- <cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			and comp_id = '#comp_id#'
			</cfif> --->
			<cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			and (comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			and (comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			and comp_id = '#comp_id#'
			</cfif>


			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>

		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>

			 	<CFIF #cr_id# NEQ "none">
				AND anc_id = '#cr_id#'
			</CFIF>
			<!---  <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
			</CFIF>  --->


			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>
		<!--- comp_id ASC,user_id ASC,--->
		<CFSET r_count = #read_report.recordcount#>


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
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
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
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

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
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

 <table width=770 border="1" cellpadding="0" cellspacing="0" >
  <TBODY>




	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>

	<nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=red>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Credit Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=770 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&loan_number=#loan_number#&user_id=#user_id#&company_id=#company_id#&cr_id=#cr_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=5">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>

					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&loan_number=#loan_number#&user_id=#user_id#&company_id=#company_id#&cr_id=#cr_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=5"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>

	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&cr_id=#cr_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=5"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>

<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&cr_id=#cr_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=5">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_report.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>
	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&cr_id=#cr_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=5">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>		</TD>
				</TR>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=770 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td> --->

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<!---------------------------------------------------->
		<!--- SET COUNT_END FOR RECORD DISPLAY --->
		<!---------------------------------------------------->
		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="read_report" startrow="#count#" endrow="#count_end#">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<cfif #codeCR# neq "">CR</cfif>-#anc_id#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

					<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>	 --->
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and and note_type = 'S' and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
						<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav_sn.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->
				<CFIF #r_count# LTE "5">
	<TABLE><TR>
	<td width = 400 bgcolor="BFFFBF"  align=left valign=top>

					<p><font face="Arial, Helvetica, sans-serif" size="2">The "details" button allows you to: </font></p>

<ul><li><font face="Arial, Helvetica, sans-serif" size="2">View and print completed title committment</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View HUD-1 for instant fees</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Activate Endorsement Express* - instant endorsements</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View and print your Closing Protection Letter of request</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View scheduled closing information</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Check status of file</li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Upload documents to the site</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View or modify your orders.</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Contact your processing team</font></li>
</ul>






									</td>
				<td width = 400 bgcolor="BFFFBF"  align=center valign=top> <TABLE><TR><td width = 350 bgcolor="BFFFBF"  align=left valign=top><p><br><br>
<font face="Arial, Helvetica, sans-serif" size="2"><center><b>New Web System Highlights -</center></b><br><br>
11/03/03 - EXPANDED Comments System for orders - CLIENTS may now add their
own notes directly into existing product orders that will instantly transmit
to their First Title Client Services Team. Click "Add/View" in the Comments
area above to activate this new feature.</font>
				</p></td>
					</tr></TABLE>
				</td>
					</tr></TABLE>
	</CFIF>



		</table>
		<!--- <nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>
			 --->



			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

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

<cfelseif #a_trigger# eq 6>
	<cfoutput>

		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>

<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>

<CFIF IsDefined("form.avm_id")><cfif #avm_id# NEQ "NONE">
	<CFSET avm_id = #avm_id#>
</cfif></CFIF>
<!--- <CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF> --->
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>



<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM ANCILLARY
			WHERE codeAVM is not null

			<!--- <cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			and comp_id = '#comp_id#'
			</cfif> --->
			<cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			and (comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			and (comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			and comp_id = '#comp_id#'
			</cfif>


			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>

		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>

			 	<CFIF #avm_id# NEQ "none">
				AND anc_id = '#avm_id#'
			</CFIF>
			<!---  <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
			</CFIF>  --->


			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>
		<!--- comp_id ASC,user_id ASC,--->
		<CFSET r_count = #read_report.recordcount#>


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
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
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
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

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
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

 <table width=770 border="1" cellpadding="0" cellspacing="0" >
  <TBODY>




	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>

	<nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=brown>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>AVM Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=770 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&loan_number=#loan_number#&user_id=#user_id#&company_id=#company_id#&avm_id=#avm_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=6">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>

					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&loan_number=#loan_number#&user_id=#user_id#&company_id=#company_id#&avm_id=#avm_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=6"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>

	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&avm_id=#avm_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=6"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>

<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&avm_id=#avm_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=6">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_report.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>
	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&avm_id=#avm_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=6">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>		</TD>
				</TR>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=770 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td> --->

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<!---------------------------------------------------->
		<!--- SET COUNT_END FOR RECORD DISPLAY --->
		<!---------------------------------------------------->
		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="read_report" startrow="#count#" endrow="#count_end#">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<cfif #codeAVM# neq "">AVM</cfif>-#anc_id#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

					<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>	 --->
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and note_type = 'S' and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav_sn.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->

				<CFIF #r_count# LTE "5">
	<TABLE><TR>
	<td width = 400 bgcolor="BFFFBF"  align=left valign=top>

					<p><font face="Arial, Helvetica, sans-serif" size="2">The "details" button allows you to: </font></p>

 <ul><li><font face="Arial, Helvetica, sans-serif" size="2">View and print completed title committment</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View HUD-1 for instant fees</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Activate Endorsement Express* - instant endorsements</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View and print your Closing Protection Letter of request</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View scheduled closing information</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Check status of file</li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Upload documents to the site</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View or modify your orders.</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Contact your processing team</font></li>
</ul>






									</td>
<td width = 400 bgcolor="BFFFBF"  align=center valign=top> <TABLE><TR><td width = 350 bgcolor="BFFFBF"  align=left valign=top><p><br><br>
<font face="Arial, Helvetica, sans-serif" size="2"><center><b>New Web System Highlights -</center></b><br><br>
11/03/03 - EXPANDED Comments System for orders - CLIENTS may now add their
own notes directly into existing product orders that will instantly transmit
to their First Title Client Services Team. Click "Add/View" in the Comments
area above to activate this new feature.</font>
				</p></td>
					</tr></TABLE>
				</td>
					</tr></TABLE>
	</CFIF>


		</table>
		<!--- <nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>
			 --->



			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

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

<cfelseif #a_trigger# eq 7>
	<cfoutput>

		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>

<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>

<CFIF IsDefined("form.sn_id")><cfif #sn_id# NEQ "NONE">
	<CFSET sn_id = #sn_id#>
</cfif></CFIF>
<!--- <CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF> --->
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>



<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM ANCILLARY
			WHERE codeSigning is not null

			<!--- <cfif #comp_id# eq "154">
		and	(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			and comp_id = '#comp_id#'
			</cfif> --->
			<cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			and (comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			and (comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			and comp_id = '#comp_id#'
			</cfif>


			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>

		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>

			 	<CFIF #sn_id# NEQ "none">
				AND anc_id = '#sn_id#'
			</CFIF>
			<!---  <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
			</CFIF>  --->


			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>
		<!--- comp_id ASC,user_id ASC,--->
		<CFSET r_count = #read_report.recordcount#>

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
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
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
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

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
		   <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='/title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

 <table width=770 border="1" cellpadding="0" cellspacing="0" >
  <TBODY>



	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>

	<nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Signing Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=770 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&loan_number=#loan_number#&user_id=#user_id#&company_id=#company_id#&sn_id=#sn_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=7">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>

					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&loan_number=#loan_number#&user_id=#user_id#&company_id=#company_id#&sn_id=#sn_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=7"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>

	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&sn_id=#sn_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=7"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>

<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&sn_id=#sn_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=7">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_report.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>
	<A HREF="./title_client_rep_display.cfm?emp=#emp#&comp_id=#comp_id#&calc=#calc#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_report.anc_id#&user_id=#user_id#&loan_number=#loan_number#&company_id=#company_id#&sn_id=#sn_id#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=7">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>		</TD>
				</TR>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=770 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td> --->

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<!---------------------------------------------------->
		<!--- SET COUNT_END FOR RECORD DISPLAY --->
		<!---------------------------------------------------->
		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="read_report" startrow="#count#" endrow="#count_end#">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<cfif #codeSigning# neq "">SN</cfif>-#anc_id#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

					<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>	 --->
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and note_type = 'S' and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav_sn.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->

			<CFIF #r_count# LTE "5">
<TABLE><TR>
	<td width = 400 bgcolor="BFFFBF"  align=left valign=top>

					<p><font face="Arial, Helvetica, sans-serif" size="2">The "details" button allows you to: </font></p>
<ul><li><font face="Arial, Helvetica, sans-serif" size="2">View and print completed title committment</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View HUD-1 for instant fees</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Activate Endorsement Express* - instant endorsements</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View and print your Closing Protection Letter of request</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View scheduled closing information</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Check status of file</li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Upload documents to the site</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View or modify your orders.</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Contact your processing team</font></li>
</ul>






									</td>
			<td width = 400 bgcolor="BFFFBF"  align=center valign=top> <TABLE><TR><td width = 350 bgcolor="BFFFBF"  align=left valign=top><p><br><br>
<font face="Arial, Helvetica, sans-serif" size="2"><center><b>New Web System Highlights -</center></b><br><br>
11/03/03 - EXPANDED Comments System for orders - CLIENTS may now add their
own notes directly into existing product orders that will instantly transmit
to their First Title Client Services Team. Click "Add/View" in the Comments
area above to activate this new feature.</font>
				</p></td>
					</tr></TABLE>
				</td>
					</tr></TABLE>
	</CFIF>


		</table>
		<!--- <nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>
			 --->



			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

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

<cfoutput>

		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>
	<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>
	<CFIF IsDefined("form.anc_id")><cfif #anc_id# NEQ "NONE">
	<CFSET anc_id = #anc_id#>
</cfif></CFIF>
<CFIF IsDefined("form.cr_id")><cfif #cr_id# NEQ "NONE">
	<CFSET cr_id = #cr_id#>
</cfif></CFIF>
<CFIF IsDefined("form.avm_id")><cfif #avm_id# NEQ "NONE">
	<CFSET avm_id = #avm_id#>
</cfif></CFIF>
<CFIF IsDefined("form.sn_id")><cfif #sn_id# NEQ "NONE">
	<CFSET sn_id = #sn_id#>
</cfif></CFIF>
</cfoutput>



<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM title
			WHERE
<!--- <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif> --->
			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			comp_id = '#comp_id#'
			</cfif>



			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>
		<!--- comp_id ASC,user_id ASC,--->

	<CFQUERY datasource="#request.dsn#" NAME="read_prop">

			SELECT *
			FROM property
			WHERE

			<!--- <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif> --->

			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			comp_id = '#comp_id#'
			</cfif>



			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>
		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>
			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_app">

			SELECT *
			FROM appraisal
			WHERE

			<!--- <cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			comp_id = '#comp_id#'
			</cfif> --->

			<cfif #comp_id# eq "154">
			(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			(comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			(comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			comp_id = '#comp_id#'
			</cfif>


			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_anc">

			SELECT *
			FROM ancillary
			WHERE codeFlood is not null
		<!--- <cfif #comp_id# eq "154">
		and	(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
		and	comp_id = '#comp_id#'
			</cfif> --->
			<cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			and (comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			and (comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			and comp_id = '#comp_id#'
			</cfif>

			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_cr">

			SELECT *
			FROM ancillary
			WHERE codeCR is not null

			<!--- <cfif #comp_id# eq "154">
			and	(comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			and comp_id = '#comp_id#'
			</cfif> --->

			<cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			and (comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			and (comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			and comp_id = '#comp_id#'
			</cfif>

			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_avm">

			SELECT *
			FROM ancillary
			WHERE codeAVM is not null

			<!--- <cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			and comp_id = '#comp_id#'
			</cfif> --->

			<cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">

			and (comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			and (comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			and comp_id = '#comp_id#'
			</cfif>

			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sn">

			SELECT *
			FROM ancillary
			WHERE codeSigning is not null
			<!--- <cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelse>
			and comp_id = '#comp_id#'
			</cfif> --->

			<cfif #comp_id# eq "154">
			and (comp_id = 154 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 190 or comp_id = 159 or comp_id = 155 or comp_id = 168 or comp_id = 157 or comp_id = 158 or comp_id = 167 or comp_id = 170 or comp_id = 166 or comp_id = 160 or comp_id = 169 or comp_id = 161 or comp_id = 156 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 181 or comp_id = 192 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_id = 274)
			<cfelseif #comp_id# eq "953">
			and (comp_id = 953 or comp_id = 941 or comp_id = 942 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951)
			<cfelseif #comp_id# eq "1017">
			and (comp_id = 1017 or comp_id = 559 or comp_id = 859 or comp_id = 941 or comp_id = 942 or comp_id = 919 or comp_id = 953 or comp_id = 943 or comp_id = 944 or comp_id = 945 or comp_id = 946  or comp_id = 947 or comp_id = 948 or comp_id = 949 or comp_id = 950 or comp_id = 951 or comp_id = 746)

			<cfelse>
			and comp_id = '#comp_id#'
			</cfif>

			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'

			</CFIF>
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY    oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>

		<CFSET r_count = #read_report.recordcount# + #read_prop.recordcount# + #read_app.recordcount# + #read_anc.recordcount# + #read_avm.recordcount# + #read_cr.recordcount# + #read_sn.recordcount#>

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
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
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
<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

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
		 <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
</tr></CFOUTPUT></center>
			        	 </table>

	</center> </td> </tr> </TBODY>

</table>

 <table width=770 border="1" cellpadding="0" cellspacing="0" >
  <TBODY>



	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>
	<nobr><cfoutput><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a></cfoutput></nobr>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=gray>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Product Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=770 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			</TD>
				</TR>
	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=770 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td> --->

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">



			 <CFLOOP QUERY="read_report">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #title_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<cfif #calc# eq "yes">
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_client_report_nav_calc.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>
					<cfelse>
					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_client_report_nav.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#title_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>
					</cfif>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>


		 <CFLOOP QUERY="read_prop">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							P-232#prop_id#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #prop_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#prop_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./view_the_prop_order.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#prop_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>

		 <CFLOOP QUERY="read_app">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							APP-#app_id#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #app_id# and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#app_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_appraisal.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#app_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>


		 <CFLOOP QUERY="read_anc">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeFlood# neq "">F</cfif>-#anc_id#

						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and note_type = 'S' and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav_sn.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>

		 <CFLOOP QUERY="read_cr">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeCR# neq "">CR</cfif>-#anc_id#

						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and note_type = 'S' and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
						<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav_sn.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>

		 <CFLOOP QUERY="read_avm">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeAVM# neq "">AVM</cfif>-#anc_id#

						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and note_type = 'S' and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav_sn.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>

		 <CFLOOP QUERY="read_sn">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeSigning# neq "">SN</cfif>-#anc_id#

						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #anc_id# and note_type = 'S' and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif (#read_all_notes.recordcount# gt 0)>
							<a href="./view_title_comments_nav_sn.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

							<cfelse>

							</cfif>
						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_report_nav_credit.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#anc_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP>

				<CFIF #r_count# LTE "5">
	<TABLE><TR>
	<td width = 400 bgcolor="BFFFBF"  align=left valign=top>

					<p><font face="Arial, Helvetica, sans-serif" size="2">The "details" button allows you to: </font></p>
<ul><li><font face="Arial, Helvetica, sans-serif" size="2">View and print completed title committment</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View HUD-1 for instant fees</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Activate Endorsement Express* - instant endorsements</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View and print your Closing Protection Letter of request</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View scheduled closing information</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Check status of file</li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Upload documents to the site</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View or modify your orders.</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Contact your processing team</font></li>
</ul>






			<td width = 400 bgcolor="BFFFBF"  align=center valign=top> <TABLE><TR><td width = 350 bgcolor="BFFFBF"  align=left valign=top><p><br><br>
<font face="Arial, Helvetica, sans-serif" size="2"><center><b>New Web System Highlights -</center></b><br><br>
11/03/03 - EXPANDED Comments System for orders - CLIENTS may now add their
own notes directly into existing product orders that will instantly transmit
to their First Title Client Services Team. Click "Add/View" in the Comments
area above to activate this new feature.</font>
				</p></td>
					</tr></TABLE>
				</td>	</tr></TABLE>
	</CFIF>

		</table>


			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

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



