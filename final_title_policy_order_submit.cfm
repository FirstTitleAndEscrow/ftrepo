




<cfif len(ORIGINAL_LOAN_AMOUNT) GT 1 and Mid(ORIGINAL_LOAN_AMOUNT, 1, 1) eq 0>
<cfset ORIGINAL_LOAN_AMOUNT = 0>
</cfif>

<cfif len(form.ORIGINAL_LOAN_AMOUNT) GT 1 and Mid(form.ORIGINAL_LOAN_AMOUNT, 1, 1) eq 0>
<cfset form.ORIGINAL_LOAN_AMOUNT = 0>
</cfif>

<cfset form.ORIGINAL_LOAN_AMOUNT = ReplaceNoCase(form.ORIGINAL_LOAN_AMOUNT, " ", "", "ALL")>
<cfset form.ORIGINAL_LOAN_AMOUNT = ReplaceNoCase(form.ORIGINAL_LOAN_AMOUNT, ",", "", "ALL")>
<cfset form.ORIGINAL_LOAN_AMOUNT = ReplaceNoCase(form.ORIGINAL_LOAN_AMOUNT, "$", "", "ALL")>


<cfif IsDefined("ORIGINAL_LOAN_AMOUNT")>
<cfset ORIGINAL_LOAN_AMOUNT = ReplaceNoCase(ORIGINAL_LOAN_AMOUNT, " ", "", "ALL")>
<cfset ORIGINAL_LOAN_AMOUNT = ReplaceNoCase(ORIGINAL_LOAN_AMOUNT, ",", "", "ALL")>
<cfset ORIGINAL_LOAN_AMOUNT = ReplaceNoCase(ORIGINAL_LOAN_AMOUNT, "$", "", "ALL")>
</cfif>


<cfif ORIGINAL_LOAN_AMOUNT neq '' and IsNumeric(ORIGINAL_LOAN_AMOUNT) and ORIGINAL_LOAN_AMOUNT neq 0>
<cfset form.ORIGINAL_LOAN_AMOUNT = ORIGINAL_LOAN_AMOUNT>
</cfif>





<CFQUERY datasource="#request.dsn#" NAME="check_order">
	SELECT *
	FROM Final_Document_Retrieval
	WHERE (bfirstname1 = '#bfirstname1#') AND (blastname1= '#blastname1#') AND (paddress = '#paddress#')
</CFQUERY>

<cfif #check_order.recordcount# GT "0"> <!---The same order is already in the table property--->
	<CFQUERY datasource="#request.dsn#" NAME="read_company">
		SELECT *
		FROM companies
		WHERE ID = '#comp_id#'
		ORDER BY company ASC
	</CFQUERY>
<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_company.team_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>

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


		<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
<title>1st Title & Escrow, Inc. - Title Request Form</title>
</head>

<BODY onload BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

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
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=780,height=680,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>TITLE CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>
				<p>	<center>
	<table width="770">

	<tr><td align=center colspan = 2 valign=bottom width = "700">
<FONT FACE=ARIAL SIZE=2 color="red">
	<br><br>
<center><B>OUR RECORDS INDICATE THAT YOU HAVE RECENTLY ORDERED PROPERTY WITH US!
</B><br><br><FONT FACE=ARIAL SIZE=2 color="blue"> </center> Click below to main page</td></tr>


		<br><br><br>


</td></tr>
<tr><td align=center valign=bottom width = "700">
<cfoutput>
		<NOBR><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img src="./images/button_return.gif" border=0 ALT="Return to main menu"></a>
			</NOBR>
			</cfoutput>
			</td>


</tr>
</table></center>		</p>



		<tr><td width=780 align=center valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TABLE>
</td></tr></TBODY></TABLE>
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


<cfelse><!---new Property order--->

<!--------------------------------------------->

<!--- here is where we check to see what time it is    --->
<!--- when this order was submitted.  Because if it    --->
<!--- was submitted after 3:00 pm, then we count it    --->
<!--- as having been submitted at 8:30 am the next day --->




<CFQUERY datasource="#request.dsn#" NAME="RU">
	SELECT *
	FROM users
	WHERE ID = #user_id_1#
</CFQUERY>

<cfset RU.comp_id = #comp_id#>

	<CFSET ru_name = #RU.lp_fname# & #RU.lp_lname#>

		<CFQUERY datasource="#request.dsn#" NAME="RLO">
			SELECT *
			FROM loan_officers
			WHERE ID = #lo_id#
		</CFQUERY>

			<CFSET rlo_name = #RLO.lo_fname# & #RLO.lo_lname#>


				<CFSET app_stat = "In Process">

<CFSET order_date = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_new_rec">
Insert into Final_Document_Retrieval (COMP_ID, ORDER_DATE, loan_off_id, user_id, BLASTNAME1,BFIRSTNAME1,BMINAME1,BSSN1,BHPHONE1,BWPHONE1,BEXT1,BLASTNAME2,BFIRSTNAME2,BMINAME2,BSSN2,BHPHONE2,BWPHONE2,BEXT2,BLASTNAME3,BFIRSTNAME3,BMINAME3,BSSN3,BHPHONE3,BWPHONE3,BEXT3,BLASTNAME4,BFIRSTNAME4,BMINAME4,BSSN4,BHPHONE4,BWPHONE4,BEXT4,PADDRESS,LOAN_NUMBER,ORIGINAL_LENDER_NAME,ORIGINAL_LOAN_DATE,ORIGINAL_LOAN_AMOUNT,SLA_option,ORDER_TYPE,DOCUMENT_TYPE,A_COMMENT,VERIFYEMAIL,VERIFYEMAIL_2,RPTBYEMAIL,VERIFYEMAIL_3,PCITY,PSTATE,PZIP,PCOUNTY,APPRAISAL_STATUS)
values
(#url.comp_id#, '#order_date#', '#url.lo_id#', '#url.user_id_1#', '#form.BLASTNAME1#','#form.BFIRSTNAME1#','#form.BMINAME1#','#form.BSSN1#','#form.BHPHONE1#','#form.BWPHONE1#','#form.BEXT1#','#form.BLASTNAME2#','#form.BFIRSTNAME2#','#form.BMINAME2#','#form.BSSN2#','#form.BHPHONE2#','#form.BWPHONE2#','#form.BEXT2#','#form.BLASTNAME3#','#form.BFIRSTNAME3#','#form.BMINAME3#','#form.BSSN3#','#form.BHPHONE3#','#form.BWPHONE3#','#form.BEXT3#','#form.BLASTNAME4#','#form.BFIRSTNAME4#','#form.BMINAME4#','#form.BSSN4#','#form.BHPHONE4#','#form.BWPHONE4#','#form.BEXT4#','#form.PADDRESS#','#form.LOAN_NUMBER#','#form.ORIGINAL_LENDER_NAME#','#form.ORIGINAL_LOAN_DATE#','#form.ORIGINAL_LOAN_AMOUNT#','#form.SLA_option#','#form.ORDER_TYPE#','#form.DOCUMENT_TYPE#','#form.A_COMMENT#','#form.VERIFYEMAIL#','#form.VERIFYEMAIL_2#','#form.RPTBYEMAIL#','#form.VERIFYEMAIL_3#','#form.PCITY#','#PSTATE#','#form.PZIP#','#form.PCOUNTY#', 'Order Received')
</CFQUERY>

<!--- <CFQUERY DATASOURCE="#request.dsn#" NAME="insert_new_rec">
Insert into Final_Document_Retrieval (COMP_ID, ORDER_DATE, lo_id, user_id, BLASTNAME1,BFIRSTNAME1,BMINAME1,BSSN1,BHPHONE1,BWPHONE1,BEXT1,BLASTNAME2,BFIRSTNAME2,BMINAME2,BSSN2,BHPHONE2,BWPHONE2,BEXT2,BLASTNAME3,BFIRSTNAME3,BMINAME3,BSSN3,BHPHONE3,BWPHONE3,BEXT3,BLASTNAME4,BFIRSTNAME4,BMINAME4,BSSN4,BHPHONE4,BWPHONE4,BEXT4,PADDRESS,LOAN_NUMBER,ORIGINAL_LENDER_NAME,ORIGINAL_LOAN_DATE,ORIGINAL_LOAN_AMOUNT,sla_option,ORDER_TYPE,DOCUMENT_TYPE,A_COMMENT,VERIFYEMAIL,VERIFYEMAIL_2,FAX_NO,RPTBYEMAIL,VERIFYEMAIL_3,PCITY,PSTATE,PZIP,PCOUNTY,APPRAISAL_STATUS)
values
(#url.comp_id#, '#order_date#', '#url.lo_id#', '#url.user_id_1#', '#form.BLASTNAME1#','#form.BFIRSTNAME1#','#form.BMINAME1#','#form.BSSN1#','#form.BHPHONE1#','#form.BWPHONE1#','#form.BEXT1#','#form.BLASTNAME2#','#form.BFIRSTNAME2#','#form.BMINAME2#','#form.BSSN2#','#form.BHPHONE2#','#form.BWPHONE2#','#form.BEXT2#','#form.BLASTNAME3#','#form.BFIRSTNAME3#','#form.BMINAME3#','#form.BSSN3#','#form.BHPHONE3#','#form.BWPHONE3#','#form.BEXT3#','#form.BLASTNAME4#','#form.BFIRSTNAME4#','#form.BMINAME4#','#form.BSSN4#','#form.BHPHONE4#','#form.BWPHONE4#','#form.BEXT4#','#form.PADDRESS#','#form.LOAN_NUMBER#','#form.ORIGINAL_LENDER_NAME#','#form.ORIGINAL_LOAN_DATE#','#form.ORIGINAL_LOAN_AMOUNT#','#form.sla_option#','#form.ORDER_TYPE#','#form.DOCUMENT_TYPE#','#form.A_COMMENT#','#form.VERIFYEMAIL#','#form.VERIFYEMAIL_2#','#form.FAX_NO#','#form.RPTBYEMAIL#','#form.VERIFYEMAIL_3#','#form.PCITY,PSTATE#','#form.PZIP#','#form.PCOUNTY#', 'Product Order')
</CFQUERY> --->


<CFQUERY datasource="#request.dsn#" NAME="update_company">
Update Companies
Set last_order_date = #CreateODBCDate(Now())#,
sent_six_day_email = 0,
sent_thirty_day_email = 0
where id = '#RU.comp_id#'
</cfquery>


<CFQUERY datasource="#request.dsn#" NAME="get_fdrid">
	SELECT *
	FROM Final_Document_Retrieval
	WHERE order_date = '#order_date#'
</CFQUERY>
<!---Billing--->
<cfif #a_COMMENT# NEQ "">
<CFQUERY DATASOURCE="#request.dsn#">
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
						VALUES('Web', 'System', #get_fdrid.FDR_ID#, 'Comment from order: #a_COMMENT#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'FDR')
					</CFQUERY>
</cfif>




<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE id = #url.USER_ID_1#
		ORDER BY lp_lname ASC
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">
	SELECT *
	FROM loan_officers
	WHERE ID = #url.lo_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_title">
	SELECT *
	FROM Final_Document_Retrieval
	WHERE fdr_id = #get_fdrid.fdr_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_prop_company">
	SELECT *
	FROM companies
	WHERE id = #read_title.comp_id#
</CFQUERY>


<!--- <CFSET b_emails_to_first_title = "vendormgr@firsttitleservices.com,akumar@firsttitleservices.com"> --->
<CFSET b_emails_to_first_title = "rick@jermain.com">

<cfif read_prop_company.intsales eq 309>
<CFQUERY datasource="#request.dsn#" NAME="get_sales_email">
  SELECT * FROM first_admin WHERE id = 309
  </CFQUERY>
 <cfset b_emails_to_first_title = b_emails_to_first_title & "; " & get_sales_email.email>
</cfif>

<cfif read_prop_company.intsales eq 311 or read_prop_company.intsales eq 313>
<CFQUERY datasource="#request.dsn#" NAME="get_sales_email">
  SELECT * FROM first_admin WHERE id = #read_prop_company.intsales#
  </CFQUERY>
 <cfset b_emails_to_first_title = b_emails_to_first_title & "; " & read_prop_company.email>
</cfif>

<cfif read_prop_company.intsales eq 312>
<CFQUERY datasource="#request.dsn#" NAME="get_sales_email">
  SELECT * FROM first_admin WHERE id = #read_prop_company.intsales#
  </CFQUERY>
 <cfset b_emails_to_first_title = b_emails_to_first_title & "; " & read_prop_company.email>
<CFQUERY datasource="#request.dsn#" NAME="get_sales_email">
  SELECT * FROM first_admin WHERE id = 311
  </CFQUERY>
 <cfset b_emails_to_first_title = b_emails_to_first_title & "; " & read_prop_company.email>
</cfif>


				<CFMAIL
				TO="#b_emails_to_first_title#"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="Summary of Final Title order FDR-#get_fdrid.fdr_id#-#get_fdrid.bfirstname1# #get_fdrid.blastname1#--#read_prop_company.company#"
				TIMEOUT="600"
				type="HTML"
				>


				<center>
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
		<td width=519 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL SIZE=2 color="black">
			<CENTER><B> CLIENT: #read_prop_company.company#</B></CENTER>
		</TD>
	</TR>
	<tr>
		<td width=519 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL SIZE=2 color="black">
			<CENTER><B> Order FDR-#get_fdrid.fdr_id#</B></CENTER>
		</TD>
	</TR>
	<tr>
		<td width=519 align=left valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL SIZE=2 color="black">
			<CENTER><B>CLIENT SPECIFIC INFORMATION</B></CENTER>
		</TD>
	</TR>
	<TR>
		<TD width=519 align=center valign=top bgcolor=d3d3d3>
			<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
				<tr>
					<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
						<FONT FACE=ARIAL SIZE=2 color="maroon">
						<b>Loan Officer:</b>
					</TD>
					<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
						<FONT FACE=ARIAL SIZE=2 color="maroon">
						<b>Loan Processor:</b>
					</TD>
				</tr>
				<tr>
					<td width=125 bgcolor="f1f1f1" align=right valign=top>
						<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
					</td>
					<td width=134 bgcolor="f1f1f1" align=left valign=top>
						<FONT FACE=verdana SIZE=1 color="blue">
						<B>#read_loan_offcr.lo_lname#, #read_loan_offcr.lo_fname#</B>
					</td>
					<td width=125 bgcolor="f1f1f1" align=right valign=top>
						<FONT FACE=ARIAL SIZE=1 color="gray">
							Name (Last, First)
					</td>
					<td width=134 bgcolor="f1f1f1" align=left valign=top>
						<FONT FACE=verdana SIZE=1 color="blue">
						<B>#read_user.lp_lname#, #read_user.lp_fname#</B>
					</td>
				</tr>
				<tr>
					<td width=125 bgcolor="f1f1f1" align=right valign=top>
						<FONT FACE=ARIAL SIZE=1 color="gray">
						Phone No.
					</td>
					<td width=134 bgcolor="f1f1f1" align=left valign=top>
						<FONT FACE=verdana SIZE=1 color="blue">
						<b>#read_loan_offcr.lo_phone#</b>
					</td>
					<td width=125 bgcolor="f1f1f1" align=right valign=top>
						<FONT FACE=ARIAL SIZE=1 color="gray">
						Phone No.
					</td>
					<td width=134 bgcolor="f1f1f1" align=left valign=top>
						<FONT FACE=verdana SIZE=1 color="blue">
						<B>#read_user.lp_phone#</b>
					</td>
				</tr>
				<tr>
					<td width=125 bgcolor="f1f1f1" align=right valign=top>
						<FONT FACE=ARIAL SIZE=1 color="gray">
						Ext.
					</td>
					<td width=134 bgcolor="f1f1f1" align=left valign=top>
						<FONT FACE=verdana SIZE=1 color="blue">
						<b>#read_loan_offcr.lo_ext#</b>
					</td>
					<td width=125 bgcolor="f1f1f1" align=right valign=top>
						<FONT FACE=ARIAL SIZE=1 color="gray">
						Ext.
					</td>
					<td width=134 bgcolor="f1f1f1" align=left valign=top>
						<FONT FACE=verdana SIZE=1 color="blue">
						<b>#read_user.lp_ext#</b>
					</td>
				</tr>
				<tr>
					<td width=125 bgcolor="f1f1f1" align=right valign=top>
						<FONT FACE=ARIAL SIZE=1 color="gray">
						Fax
					</td>
					<td width=134 bgcolor="f1f1f1" align=left valign=top>
						<FONT FACE=verdana SIZE=1 color="blue">
						<b>#read_loan_offcr.lo_fax#</b>
					</td>
					<td width=125 bgcolor="f1f1f1" align=right valign=top>
						<FONT FACE=ARIAL SIZE=1 color="gray">
						Fax
					</td>
					<td width=134 bgcolor="f1f1f1" align=left valign=top>
						<FONT FACE=verdana SIZE=1 color="blue">
						<b>#read_user.lp_fax#</b>
					</td>
				</tr>
				<tr>
					<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
						<FONT FACE=ARIAL SIZE=1 color="gray">
						Email
					</td>
					<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
						<FONT FACE=ARIAL SIZE=1 color="gray">
						Email
					</td>
				</tr>
				<tr>
					<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
						<FONT FACE=verdana SIZE=1 color="blue">
						<b>#read_loan_offcr.lo_email#</b>
					</td>
					<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
						<FONT FACE=verdana SIZE=1 color="blue">
						<b>#read_user.lp_email#</b>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!--- ========================================= --->
<!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>BORROWER INFORMATION</B></CENTER><br><FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Borrowers Info:</b>
			</TD>
		</TR>
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname1#</b>
						</td>
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname1#</b>
						</td>
						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame1#</b>
						</td>
						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn1#</b>
						</td>
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone1#</b>
						</td>
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone1#</b>
						</td>
						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext1#</b>
						</td>
					</tr>
		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ SECOND ] \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname2#</b>
						</td>
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname2#</b>
						</td>
						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame2#</b>
						</td>
						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn2#</b>
						</td>
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone2#</b>
						</td>
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone2#</b>
						</td>
						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext2#</b>
						</td>
					</tr>
					<tr>
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR>
						</td>
						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^
						</td>
						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PROPERTY ADDRESS</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
				<!--- =================================== --->
				<!--- ===/ Property  Info [ FIRST ]  \=== --->
				<!--- =================================== --->
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Street Address <br>
						</td>
						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#paddress#</b>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							City, State, Zip:</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<NOBR><FONT FACE=verdana SIZE=1 color="blue"><b>#pcity#,&nbsp;#pstate#  #pzip#</b>
							</NOBR>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pcounty#</b>
						</td>
					</tr>
</table>
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>LOAN INFORMATION</B></CENTER>
			</TD>
		</TR>
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

					<tr>
						<td width=205 bgcolor="white" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Loan Number <br>
						</td>
		<td COLSPAN=3 width=314 bgcolor="white" align=left valign=top>
							#loan_number#
						</td>
		</tr>
									<tr>
						<td width=205 bgcolor="white" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Original Lender Name<br></b>
						</td>


						<td width=314 bgcolor="white" align=left valign=top>
										#original_lender_name#
						</td>
						</tr>
						
									<tr>
						<td width=205 bgcolor="yellow" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Original Loan Date<br></b>
						</td>


						<td width=314 bgcolor="yellow" align=left valign=top>
									#original_loan_date#
						</td>
						</tr>
						
	

						<tr>
				<td width=205 bgcolor="yellow" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="black">
							Original Loan Amount </b>
						</td>

						<td COLSPAN=3 width=314 bgcolor="yellow" align=left valign=top>
							#original_loan_amount#
						</td>
					</tr>


						
												


		</table>
</td>
</tr>
</table>

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
		<td width=215 bgcolor="yellow" align=right valign=bottom>
			<FONT FACE=ARIAL SIZE=1 color="black">
				SLA option:  </td><td width=304  bgcolor="yellow" align=left valign=bottom>
				<FONT FACE=ARIAL SIZE=1 color="black">
							&nbsp;&nbsp;&nbsp;&nbsp;Standard <INPUT TYPE="RADIO" NAME="sla_option" VALUE="standard" <cfif sla_option eq 'standard'>checked</cfif>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rush  <INPUT TYPE="RADIO"  NAME="sla_option" VALUE="rush" <cfif sla_option eq 'rush'>checked</cfif>></NOBR>


		</td></TR>

				<tr>
		<td width=215 bgcolor="yellow" align=right valign=bottom>
							<FONT FACE=ARIAL SIZE=1 color="black">

							Order Type:  </td><td width=304  bgcolor="yellow" align=left valign=bottom>
						<FONT FACE=ARIAL SIZE=1 color="black">
							&nbsp;&nbsp;&nbsp;&nbsp;Image Only  <INPUT NAME="order_type" TYPE="radio" VALUE="image" <cfif order_type eq 'image'>checked</cfif>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="black">Paper Copy  <INPUT TYPE="RADIO"  NAME="order_type" VALUE="paper" <cfif order_type eq 'paper'>checked</cfif>></NOBR>


		</td></TR>

				<tr>
		<td width=215 bgcolor="yellow" align=right valign=bottom>
							<FONT FACE=ARIAL SIZE=1 color="black">

							Document Type:  </td><td width=304  bgcolor="yellow" align=left valign=bottom>
						<FONT FACE=ARIAL SIZE=1 color="black">
						#document_type#
		</td></TR>

				</table>


<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>COMMENTS</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							#a_COMMENT#
						</td>
					</tr>

				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->

<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/        [ PAYOFF ]  TOP          \=== --->
<!--- ========================================= --->

<!--- ========================================= --->
<!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Verify Order was Received</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address or fax number, you will receive a confirmation  e-mail of your order having been received by us.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>
<cfoutput>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<CFIF (#comp_id# eq "115") OR (#comp_id# eq "621") >
	                    <CFSET Verifyemail1 = "">
											<CFSET Verifyemail2 = "">
											<CFSET Verifyemail3 = "">
                    <CFELSE>
	                    <CFSET Verifyemail1 = "#read_user.lp_email#">
											 <CFSET Verifyemail2 = "#read_user.cc_email_1#">
											 <CFSET Verifyemail3 = "#read_user.cc_email_2#">
                    </CFIF>
                    <tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							#Verifyemail#
						</td>
					</tr>

					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to another other e-mail address.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT> #Verifyemail2# <br>

						</td>
						</tr><tr>
					<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL color=black SIZE=1>If you do not request email verification, enter fax number below.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Fax:</FONT>#fax_no#<br>

						</td>

					</tr>









				</table>
			</td>
		</tr>
	</table>


</cfoutput>
	<cfoutput>

<!--- ======================================================================= --->
<!--- =========================================== --->
<!--- ===/    [ RECEIVE REPORT ]  TOP        \=== --->
<!--- =========================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Request copy of Final Report</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>If you would like to receive a copy of the final report, please provide us with an email address.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
                      	<CFIF (#comp_id# eq "115") OR (#comp_id# eq "621") >
	                    <CFSET Verifyemail1 = "">
											<CFSET Verifyemail2 = "">
											<CFSET Verifyemail3 = "">
                    <CFELSE>
	                    <CFSET Verifyemail1 = "#read_user.lp_email#">
											 <CFSET Verifyemail2 = "#read_user.cc_email_1#">
											 <CFSET Verifyemail3 = "#read_user.cc_email_2#">
                    </CFIF>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT> #Verifyemail1#
							 <br>
						<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT> #Verifyemail2#
						</td>
					</tr>



				</table></cfoutput>



			</td>
		</tr>


	</table>


<table width=525 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>





</TABLE>

		<tr><td width=780 align=left valign=bottom></td></tr></TBODY></TABLE>
</center>
</cfmail>

<CFQUERY datasource="#request.dsn#" NAME="get_user">
	SELECT *
	FROM user_client_assoc
	WHERE company_id = #comp_id#
	order by id
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="insert_user">
	SELECT *
	FROM users
	WHERE id = #url.USER_ID_1#
	ORDER BY lp_lname ASC
</CFQUERY>

<cfif (#get_fdrid.comp_id# neq "115") OR (#get_fdrid.comp_id# neq "621")>
	<cfif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# neq "">

<CFMAIL
TO="#get_fdrid.verifyemail#,#insert_user.cc_email_1#,#insert_user.cc_email_2#"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. 232#get_fdrid.fdr_id#-#get_fdrid.bfirstname1# #get_fdrid.blastname1#"
TIMEOUT="600"
type="HTML"
>



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>

				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Final Title Policy Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_fdr_order.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_fdrid.fdr_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>FDR-0232#get_fdrid.fdr_id#</b></a></center><br>
				
<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
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
	</cfmail>
<cfelseif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# eq "">

<CFMAIL
	TO="#get_fdrid.verifyemail#,#insert_user.cc_email_1#"
	FROM="webmaster@firsttitleservices.com"
	SERVER="127.0.0.1"
	Subject="Copy of Customer Order with 1st Title & Escrow, Inc. 232#get_fdrid.fdr_id#-#get_fdrid.bfirstname1# #get_fdrid.blastname1#"
	TIMEOUT="600"
	type="HTML"
>
<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>

				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Final Title Policy Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_fdr_order.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_fdrid.fdr_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>FDR-0232#get_fdrid.fdr_id#</b></a></center><br>
				
<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
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
</table></cfif>

</cfmail>
<cfelseif #read_user.cc_email_1# eq "" and #read_user.cc_email_2# neq "">

<CFMAIL
 TO="#get_fdrid.verifyemail#,#insert_user.cc_email_2#"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. 232#get_fdrid.fdr_id#-#get_fdrid.bfirstname1# #get_fdrid.blastname1#"
TIMEOUT="600"
type="HTML"
>



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>

				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Final Title Policy Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_fdr_order.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_fdrid.fdr_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>FDR-0232#get_fdrid.fdr_id#</b></a></center><br>
				
<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
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
</table></cfif>

</cfmail>
<cfelseif LEN(get_fdrid.verifyemail)>

<CFMAIL
TO="#get_fdrid.verifyemail#"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. 232#get_fdrid.fdr_id#-#get_fdrid.bfirstname1# #get_fdrid.blastname1#"
TIMEOUT="600"
type="HTML"
>



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>

				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Final Title Policy Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_fdr_order.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_fdrid.fdr_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>FDR-0232#get_fdrid.fdr_id#</b></a></center><br>
				
<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
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
</table></cfif>

</cfmail>
</cfif>
<cfelse>

<cfif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# neq "">

<CFMAIL
TO="#insert_user.cc_email_1#,#insert_user.cc_email_2#"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. 232#get_fdrid.fdr_id#-#get_fdrid.bfirstname1# #get_fdrid.blastname1#"
TIMEOUT="600"
type="HTML"
>



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>

				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Final Title Policy Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_fdr_order.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_fdrid.fdr_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>FDR-0232#get_fdrid.fdr_id#</b></a></center><br>
				
<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
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
</table></cfif>

</cfmail>
<cfelseif #read_user.cc_email_1# neq "" and #read_user.cc_email_2# eq "">

<CFMAIL
TO="#insert_user.cc_email_1#"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Copy of Customer Order with 1st Title & Escrow, Inc. 232#get_fdrid.fdr_id#-#get_fdrid.bfirstname1# #get_fdrid.blastname1#"
TIMEOUT="600"
type="HTML"
>



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>

				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Final Title Policy Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_fdr_order.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_fdrid.fdr_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>FDR-0232#get_fdrid.fdr_id#</b></a></center><br>
				
<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
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
</table></cfif>

</cfmail>
<cfelseif #read_user.cc_email_1# eq "" and #read_user.cc_email_2# neq "">

<CFMAIL
TO="#insert_user.cc_email_2#"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="KCopy of Customer Order with 1st Title & Escrow, Inc. 232#get_fdrid.fdr_id#-#get_fdrid.bfirstname1# #get_fdrid.blastname1#"
TIMEOUT="600"
type="HTML"
>



<TABLE WIDTH=770 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=770 align=center valign=top bgcolor=elelel>

				<p><br>
				<p>
			<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</B></center><br><p>
				<center>Your Final Title Policy Order has been Processed. Order number is <a href="https://#cgi.server_name#/view_the_fdr_order.cfm?emp=#emp#&comp_id=#comp_id#&rec_id=#get_fdrid.fdr_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><b>FDR-0232#get_fdrid.fdr_id#</b></a></center><br>
				
<br>
</TD></tr></table>

<cfif #get_user.recordcount# GT "0">
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

</cfmail>
<cfelse>
</cfif>

</cfif>

<CFLOCATION URL="./order_fdr_verify_display.cfm?emp=#emp#&comp_id=#comp_id#&fdr_id=#get_fdrid.fdr_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

</cfif>
