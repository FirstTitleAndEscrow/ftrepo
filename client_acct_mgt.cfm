<cfparam name="url.comp_id" default=0>
<cfparam name="url.admin_login" default="0">




<cfif url.comp_id eq 11726 and url.admin_login eq 0>
<cflocation url="https://www.firsttitleservices.com/login/" addtoken="no">
</cfif>

<!---	Start of Security Interstitial Code  	--->

<cfif (URL.comp_id eq 1754 or (DateDiff("d", "4/18/2013", Now()) GTE 0)) and url.admin_login eq 0 and session.comp_id neq 12043>


<cfset myCookie="FTClient" & URL.comp_id>
<cfset cookiePresent ="True">

<cfif isdefined("form.Question1")>
   <cftransaction>

    <cfquery name="doesRecordExist" datasource="#request.dsn#">
		SELECT  Company_ID FROM Companies_Security
		WHERE Company_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#URL.comp_id#">
	</cfquery>

     <cfif doesRecordExist.RecordCount GT 0 >
	     <cfquery datasource="#request.dsn#">
	        UPDATE Companies_Security
		    SET
			    QuestionID1 =     <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.Question1#">,
			    AnsDescription1 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.Ans1#">,
			    QuestionID2 =  	  <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.Question2#">,
			    AnsDescription2 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.Ans2#">,
			    QuestionID3 =     <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.Question3#">,
			    AnsDescription3 = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.Ans3#">,
			    SiteKeyId =       <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.SiteKeyId#">
			WHERE
				Company_ID =      <cfqueryparam cfsqltype="cf_sql_integer" value="#URL.comp_id#">
	      </cfquery>
	 <cfelse>
	 	 	<cfquery datasource="#request.dsn#">
	  		INSERT INTO Companies_Security(Company_ID,   QuestionID1, AnsDescription1,QuestionID2, AnsDescription2,QuestionID3, AnsDescription3,SiteKeyId)
	  		VALUES( <cfqueryparam cfsqltype="cf_sql_integer" value="#URL.comp_id#">,
			  		<cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.Question1#">,
	  			    <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.Ans1#">,
			  		<cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.Question2#">,
	  			    <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.Ans2#">,
			  		<cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.Question3#">,
	  			    <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.Ans3#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.SiteKeyId#">)
	        </cfquery>

	</cfif>

	<cfquery datasource="#request.dsn#">
			UPDATE Companies SET HasSecurity=1
			WHERE ID=<cfqueryparam cfsqltype="cf_sql_integer" value="#URL.comp_id#">
	</cfquery>
  </cftransaction>

     			<!---The below code block will get executed when either users, SET Security Questions OR answers one of them while authentication --->
  			<cfif IsDefined("Form.IsPrivate") >
         			<!--- set the cookies for 60 days --->
         	 		<cfcookie name="#myCookie#" value="#URL.comp_id#" expires="60">
    		<cfelse>
         			<!---  EXPIRE cookies NOW so they are deleted for good! --->
          			<cfcookie name="#myCookie#" value="#URL.comp_id#" >
   			</cfif>
	</cfif>


   <!--- After user successfully logins, check if the user has set security questions, else ask him to answer them for security reasons --->

   
   					 <cfquery name="CheckSecurityQuestionsSet" datasource="#request.dsn#" >
						Select HasSecurity from Companies where ID=<cfqueryparam cfsqltype="cf_sql_int" value="#URL.comp_id#" >
					</cfquery>

  					<cfSet HasSecuritySet=#CheckSecurityQuestionsSet.HasSecurity#>

	 				<cfif HasSecuritySet EQ False OR Len(HasSecuritySet) EQ 0>
	 	 				<cflocation url="/Question.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" addtoken="yes">
					<cfelse>
						<cfif NOT #StructKeyExists(COOKIE,"#myCookie#")#>

								<!---Redirect the user to security authentication page --->
								<cflocation url="/UserSecurityQuestion.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" addtoken="yes">
						</cfif>
	 				</cfif>
</cfif>
<!---			End of Security Interstitial Code --->

<CFPARAM NAME="emp" DEFAULT="0">
<!---<cfset SESSION.comp_id = url.comp_id>--->
<cfif IsDefined("form.comp_id")>
<cfset session.comp_id = form.comp_id>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_company">
    SELECT *
    FROM companies
    WHERE ID = '#comp_id#'
    ORDER BY company ASC
</CFQUERY>

<CFIF #read_company.companies_switch# eq "1">
    <CFQUERY DATASOURCE="#request.dsn#" NAME="read_company_user">
        SELECT *
        FROM companies_user
        WHERE ID = #emp#
    </CFQUERY>


    <CFSET emp = #read_company_user.ID#>

</CFIF>

<cfif #read_company.recordcount# GT 0>
    <CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
        SELECT *
        FROM users
        WHERE id = #user_id_1#
        ORDER BY lp_lname ASC
    </CFQUERY>
</cfif>



<cfif IsDefined("cookie.goto_url")>
<cfset saved_goto_url = cookie.goto_url>
<cfcookie 
         name="goto_url" 
         value="" 
         expires="now" 
         /> 
<cflocation url="#saved_goto_url#" addtoken="yes">
<cfabort>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>1st Title & Esc. Settlement Services Company & Subsid. Companies</title>
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
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="Post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
	<tr><td align="right" valign="center">
  <a href="./quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
&nbsp;&nbsp;</td>
  <td align="right" valign="center"><input type="text" name="number" size=10></td>
  <td align="right" valign="center">&nbsp;<input type="image" src="/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
  </tr>

  <tr><td align="right" valign="center" colspan="3"><font size="-2" color="white" face="Arial"><strong>Type in Buyer's last name or Order ID</strong>&nbsp;&nbsp;&nbsp;</font></td>
  </tr>
  </table>
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
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#';return false;"><a class="menu1" href="./contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#';return false;"><a class="menu1" href="./calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
            <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=1,menubar=1')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
        <CFIF #read_company.companies_switch# eq "1">
            <CFIF isdefined("read_company_user.Administrator") and #read_company_user.Administrator# eq "1">
                <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	        </CFIF>
        <CFELSE>
            <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
        </CFIF>
        <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&emp=#emp#';return false;"><a class="menu1" href="./title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&emp=#emp#"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#';return false;"><a class="menu1" href="./calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&emp=#emp#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
			        	 </table>

	</center>
		<!---  onSubmit="CheckForm();" --->
<CFFORM name = "frm" ACTION="./loan_proc_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&emp=#emp#" METHOD="POST">
    <cfquery name="SiteKey" datasource="#request.dsn#">
		SELECT  SiteKeyID FROM Companies_Security
		WHERE Company_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#URL.comp_id#">
	</cfquery>

<CFOUTPUT>

				<cfif IsDefined("SiteKey.SiteKeyID") and SiteKey.SiteKeyID GT 0>
					<cfif SiteKey.SiteKeyID eq 1>
					<cfset icon_name = "bird">
					<cfelseif SiteKey.SiteKeyID eq 2>
					<cfset icon_name = "elephant">
					<cfelseif SiteKey.SiteKeyID eq 3>
					<cfset icon_name = "elk">
					<cfelseif SiteKey.SiteKeyID eq 4>
					<cfset icon_name = "fish">
					<cfelseif SiteKey.SiteKeyID eq 5>
					<cfset icon_name = "flamingo">
					<cfelseif SiteKey.SiteKeyID eq 6>
					<cfset icon_name = "fly">
					<cfelseif SiteKey.SiteKeyID eq 7>
					<cfset icon_name = "frog">
					<cfelseif SiteKey.SiteKeyID eq 8>
					<cfset icon_name = "panda">
					<cfelseif SiteKey.SiteKeyID eq 9>
					<cfset icon_name = "rooster">
					<cfelseif SiteKey.SiteKeyID eq 10>
					<cfset icon_name = "snail">
					</cfif>
				<tr style="font-family:MS Sans Serif; Book Antiqua;"><td  width=780 valign=top align="center"><cfoutput><img src = "../images/#icon_name#.gif"></cfoutput><br>
Your Site Key</td></tr>
				</cfif>
	<tr>
		<td width=780 align=middle valign=top>

	<table border="0" width=770 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor=f1f1f1 width=770 align="middle" valign="top">
				<br>
				<font face="Arial" size="2" color="black">
				Welcome <B>#read_user.lp_fname#</B> to your Account Management<br>
				for <B>#read_company.company#</B><br></font>


<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_branches">
    SELECT *
    FROM companies
    WHERE id IN (#read_company.child_ids#)
    ORDER BY company ASC
</CFQUERY>
</cfif>
<!--- <CFQUERY DATASOURCE="#request.dsn#" NAME="read_branches">
    SELECT *
    FROM companies
    WHERE master_co_id = '#read_company.id#'
    ORDER BY company ASC
</CFQUERY>
 --->
<cfif read_company.child_ids neq '' and read_company.child_ids neq 'NULL'>
				<br><font face="Arial" size="2" color="blue"><B>Please selecct a branch to order your product through.</B></font><br>
			<select name="new_co_id">
			<option value="#read_company.ID#">#read_company.company#</option>
			<cfloop query="read_branches">
			<option value="#read_branches.ID#">#read_branches.company#</option>
			</cfloop>
			</select><br><br>
</cfif>
					<font face="Arial" size="2" color="blue"><B>Please choose your product(s) you wish to order for your loan
					</B></font>
			<br><br>
			</td>
		</tr>
	</table>

		</td>
	</tr></CFOUTPUT>
	<tr>
		<td width=780 align=middle valign=top>

	<table bgcolor=gray border="0" width=235 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor="d3d3d3" colspan=2
          width=235 align="middle" valign="top">
			<font face="Arial" size="2" color="black">
			<b>Services</b>
			</font>
			</td>
		</tr>
		<tr>
			<td class = "menu1" bgcolor=f1f1f1 nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='F1F1F1'" width="180" align="left" valign="top">
		  		<font face="verdana" size="1" color="black">
TITLE COMMITMENT ORDER</font>

		</td>
		<td   bgcolor="f1f1f1" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
	<INPUT TYPE="checkbox" NAME="title" VALUE=1 onClick="if (document.frm.property.checked){alert('You cannot choose both Property and Title: Property product has been unchecked');document.frm.property.checked = false;  }document.frm.final_document_retrieval.checked = false; document.frm.policy_recovery.checked = false;">

			</td>
		</tr>
<cfif (read_company.FeeVestingLegal eq "NULL" or read_company.FeeVestingLegal eq "") AND (read_company.FeeCurrentOwner eq "NULL" or read_company.FeeCurrentOwner eq "") AND (read_company.FeeFullSearch eq "NULL" or read_company.FeeFullSearch eq "" and read_company.master_co_id neq 6349)>

		<tr>
			<td bgcolor="f1f1f1" class = "menu1" nowrap onmouseover="this.bgColor='#00CC00'" onmouseout="this.bgColor='F1F1F1'" width="180" align="left" valign="top">
		  		<font face="verdana" size="1" color="black">
				PROPERTY REPORT ORDER</font>
				   </td>
		<td bgcolor="f1f1f1"  nowrap onmouseover="this.bgColor='00CC00'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
			<INPUT TYPE="checkbox" NAME="property" VALUE=1 onClick="alert('Your account is not activated to order Property Reports. Please contact your Client Services Representative at <cfoutput>#session.site.short_name#</cfoutput> for more information.');document.frm.property.checked = false;document.frm.policy_recovery.checked = false; document.frm.final_document_retrieval.checked = false;">

			</td>
		</tr>



<cfelse>
		<tr>
			<td bgcolor="f1f1f1" class = "menu1" nowrap onmouseover="this.bgColor='#00CC00'" onmouseout="this.bgColor='F1F1F1'" width="180" align="left" valign="top">
		  		<font face="verdana" size="1" color="black">
				PROPERTY REPORT ORDER</font>
				   </td>
		<td bgcolor="f1f1f1"  nowrap onmouseover="this.bgColor='00CC00'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
			<INPUT TYPE="checkbox" NAME="property" VALUE=1 onClick="if (document.frm.title.checked){alert('You cannot choose both Title and Property: Title product has been unchecked');document.frm.title.checked = false; }document.frm.policy_recovery.checked = false; document.frm.final_document_retrieval.checked = false;">

			</td>
		</tr>
</cfif>
<cfif (read_company.FeePolicyOnly eq "NULL" or read_company.FeePolicyOnly eq "") AND (read_company.FeeSigning eq "NULL" or read_company.FeeSigning eq "") AND (read_company.FeeAppraisal eq "NULL" or read_company.FeeAppraisal eq "")>
	<tr>
			<td bgcolor="f1f1f1" class = "menu1" nowrap onmouseover="this.bgColor='CC33CC'" onmouseout="this.bgColor='F1F1F1'" width="180" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
			APPRAISAL REQUEST ORDER</font>
			  	</td>
		<td bgcolor="f1f1f1"  nowrap onmouseover="this.bgColor='CC33CC'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
<INPUT TYPE="checkbox" NAME="appraisal" VALUE=1 onClick="alert('Your account is not activated to order Appraisals. Please contact your Client Services Representative at <cfoutput>#session.site.short_name#</cfoutput> for more information.');document.frm.appraisal.checked = false;">

			</td>
		</tr>
<cfelse>
	<tr>
			<td bgcolor="f1f1f1" class = "menu1" nowrap onmouseover="this.bgColor='CC33CC'" onmouseout="this.bgColor='F1F1F1'" width="180" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
			APPRAISAL REQUEST ORDER</font>
			  	</td>
		<td bgcolor="f1f1f1"  nowrap onmouseover="this.bgColor='CC33CC'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
<INPUT TYPE="checkbox" NAME="appraisal" VALUE=1>

			</td>
		</tr>
</cfif>
		<tr>
			<td bgcolor="f1f1f1" class = "menu1" nowrap onmouseover="this.bgColor='0099FF'" onmouseout="this.bgColor='F1F1F1'"  width="180" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
		FLOOD/AVM/CREDIT/SIGNINGS
</font>
		   			</td>
		<td bgcolor="f1f1f1" nowrap onmouseover="this.bgColor='0099FF'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
			<INPUT TYPE="checkbox" NAME="other" VALUE=1>

			</td>
		</tr>
		<tr>
			<td bgcolor="f1f1f1" class = "menu1" nowrap onmouseover="this.bgColor='FFCC33FFCC33'" onmouseout="this.bgColor='F1F1F1'"  width="180" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
		FINAL DOCUMENT RETRIEVAL
</font>
		   			</td>
		<td bgcolor="f1f1f1" nowrap onmouseover="this.bgColor='FFCC33'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
			<INPUT TYPE="checkbox" NAME="final_document_retrieval" VALUE=1 onClick="document.frm.title.checked = false;document.frm.property.checked = false;document.frm.appraisal.checked = false;document.frm.other.checked = false;document.frm.policy_recovery.checked = false;">

			</td>
		</tr>
		<tr>
			<td bgcolor="f1f1f1" class = "menu1" nowrap onmouseover="this.bgColor='339966'" onmouseout="this.bgColor='F1F1F1'"  width="180" align="left" valign="center">
		  		<font face="verdana" size="1" color="black">
		TITLE POLICY RECOVERY
</font>
		   			</td>
		<td bgcolor="f1f1f1" nowrap onmouseover="this.bgColor='339966'" onmouseout="this.bgColor='F1F1F1'" width="55" align="middle" valign="top">
			<INPUT TYPE="checkbox" NAME="policy_recovery" VALUE=1 onclick="document.frm.title.checked = false;document.frm.property.checked = false;document.frm.appraisal.checked = false;document.frm.other.checked = false;document.frm.final_document_retrieval.checked = false;">

			</td>
		</tr>
	<tr>
			<td bgcolor="d3d3d3" colspan=2 width=235 align="middle" valign="top">
			<INPUT TYPE=image SRC="./images/button_submit.gif" border=0>
			</td>
	</tr>
	</table>
	</CFFORM>
	<cfif read_company.fairfax_client EQ 1><p><a href="client_invoices2.cfm" target="_blank">View Property Orders and Invoices</a></p></cfif><br>
	
	

<a href="tp_login.cfm" target="tplogin" onClick="window.open('','tplogin','width=900,height=750,status=0,resizable=1,scrollbars=1,location=0')">TitlePro Property Data Information Login</a><br>
<br>

		<tr>
		<td width=780 align=middle valign=top>

	<table border="0" width=770 cellpadding="1" cellspacing="1">
		<tr><td width=256 align="center" valign="top">
		<a href="https://www.firsttitleservices.com"><IMG alt="Click here to logout" src  ="images/logout.jpg" border=0 ></a>
		<td width=256 align="center" valign="top">
<cfquery datasource="#request.dsn#" name="get_children_of_2786">
select child_ids from companies where ID = 2786
</cfquery>

		<cfif IsDefined("session.comp_id") and IsDefined("session.master_co_id")><cfif session.comp_id eq 2786 or session.master_co_id eq 2786 or ListFind(get_children_of_2786.child_ids, session.comp_id, ",")><cfelse><cfoutput><a href="/view_demo.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><b><IMG alt="Click here to logout" src  ="images/but_web_tutorial.gif" border=0 ></b></a></cfoutput></cfif></cfif>
		</td>
		</td><td width=256 align="center" valign="top">
		<a href="https://www.surveymonkey.com/Users/18624726/Surveys/61581288746/505399DF-DCF1-445F-A568-21EC4CC8A9B5.asp?U=61581288746&DO_NOT_COPY_THIS_LINK" target = "new"><IMG alt="Click here to logout" src  ="images/button_title_closing_view.gif" border=0 ></a>
		</td>
		</tr>
		<tr><td colspan="3"><cfif IsDefined("session.comp_id") and IsDefined("session.master_co_id")><cfif session.comp_id eq 2786 or session.master_co_id eq 2786 or ListFind(get_children_of_2786.child_ids, session.comp_id, ",")><cfelse><table cellpadding="4" width="700"><tr><td bgcolor="white" align="center" valign="bottom" width="40%">
<img src="client/images/Calyx_bug.gif" width="80" height="33"></td>
<td bgcolor="white" align="center" valign="bottom" width="20%"><!--- <script src="https://siteseal.thawte.com/cgi/server/thawte_seal_generator.exe"></script> ---></td>
<td bgcolor="white" align="center" valign="bottom" width="30%"><img src="client/images/encompass_logo.jpg" width="122" height="43" border="0"></td>
</tr></table></cfif></cfif></td></tr>
			<tr><td bgcolor=f1f1f1 COLSPAN = 3 width=770 align="center" valign="top">
<style>
.altlogin {font-size: 12px; color:#000066; font-family:Arial, Helvetica, sans-serif; font-weight:bold; text-decoration: none;}
</style>


			<p align="center"><br>
        <a href="https://www.microsoft.com/ie/" target = "new"><IMG height=31 alt="Get Microsoft Internet Explorer" src  ="images/ie5get_animated.gif" width=88 border=0 ></a>
        <br>
		<a href="/scriptX.exe">Click to download script to view/print HUD1s
        </a>
		</p>
			</td>

		</tr>

	</table>

		</td>
	</tr>

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
