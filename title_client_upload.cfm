<CFPARAM NAME="emp" DEFAULT="0">
<CFPARAM NAME="url.type" DEFAULT="T">
<script language="javascript">

function confirm_delete() {
	var answer = confirm("Are you sure you wish to delete this file?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script>

<CFQUERY datasource="#request.dsn#" NAME="read_for_indicator">

			SELECT *
			FROM Tax_Cert_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstract">

			SELECT *
			FROM Doc_Abstract_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_order">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_info">
				SELECT *
				FROM eventlist
				Where Title_Id = #rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_shipping">
				SELECT *
				FROM Shipping_info
				Where Id = #rec_id#
			</CFQUERY>
					<CFIF #Read_Title_Order_Req.a_sent_by# GT 0 AND #Read_Title_Order_Req.a_filled_out_by# GT 0>
						<CFSET A_Update_DB_Flag = 3>
					<CFELSE>
						<CFSET A_Update_DB_Flag = 0>
					</CFIF>


<CFQUERY datasource="#request.dsn#" NAME="read_appraisal">

			SELECT *
			FROM Appraisal_Doc_Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_1">
			SELECT *
			FROM Pay_Off_Lender_1_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">
			SELECT *
			FROM Pay_Off_Lender_2_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>


<cfif url.type eq 'App'>
<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM Appraisal
			WHERE app_ID = #rec_ID#
		</CFQUERY>

		<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#
		</CFQUERY>

</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>





<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>


<cfif url.type eq 'App'>
<cfquery name="get_file1" datasource="#request.dsn#">
SELECT appraisal_doc_upload
FROM Appraisal
WHERE app_ID = #rec_ID#
</CFQUERY>



<cfelse>
<cfquery name="get_file1" datasource="#request.dsn#">
SELECT client_upload1
FROM  title
WHERE title_id = #get.title_ID#
</CFQUERY>


<cfquery name="get_file2" datasource="#request.dsn#">
SELECT client_upload2
FROM  title
WHERE title_id = #get.title_ID#
</CFQUERY>

<cfquery name="get_file3" datasource="#request.dsn#">
SELECT client_upload3
FROM  title
WHERE title_id = #get.title_ID#
</CFQUERY>

<cfquery name="get_file4" datasource="#request.dsn#">
SELECT client_upload4
FROM  title
WHERE title_id = #get.title_ID#
</CFQUERY>

<cfquery name="get_file5" datasource="#request.dsn#">
SELECT reo_package, comp_id
FROM  title
WHERE title_id = #get.title_ID#
</CFQUERY>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_company">
        SELECT *
        FROM companies
        WHERE ID = '#read_title.comp_id#'
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
<cfset this_team_id = 0>


<cftry>
<cfinvoke	component = "cfc.team_info"	method = "getTeam"	returnVariable = "get_team_info" comp_id="#read_title.comp_id#">
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

<cfif get_team_info.recordcount gt 0>
<cfloop query="get_team_info" startrow="1" endrow="1">
<cfset team_email = get_team_info.email>
</cfloop>
<cfelse>
<cfset team_email = "clientservices@firsttitleservices.com">
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px Arial, Helvetica, sans-serif;}
.menu1:hover   {font:normal bold 11px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}
</style>

<STYLE TYPE="text/css"><!--
		A { color:#0033CC; text-decoration:none}
		BODY { font-family:arial,helvetica; margin-left:0; margin-top:0; margin-right:0;}
		A:hover,A:active { text-decoration:underline}
		TD { font-family:arial,helvetica;}

	--></STYLE>
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

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#">

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





<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">

		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		  <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfm?comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
           <CFIF #read_company.companies_switch# eq "1">
            <CFIF #read_company_user.Administrator# eq "1">
                <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
            </CFIF>
            <CFELSE>
                <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
            </CFIF>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT>
			        	 </table></center>




		<table width=770 border="0" cellpadding="0" cellspacing="0" >
  <TBODY>


	<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>


<table WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0" bgcolor="#00339A" height="57">
<tr>
<td>
<table WIDTH="672" CELLPADDING="0" CELLSPACING="0" BORDER="0" border="0">
<cfoutput><tr>
<!--- <td rowspan="2" VALIGN="Middle" width="210"><font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></td>
 ---><td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><b><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order Detail for Number: <cfif url.type eq 'App'>#read_title.app_id#<cfelse>#read_title.title_id#</cfif></font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></span>
</td>
</tr></cfoutput>
<tr>
<td HEIGHT="20" ALIGN="Left" VALIGN="Bottom" >
<table class="tbl_mhtabs" CELLPADDING="0" CELLSPACING="0" BORDER="0"  height="20">

<td WIDTH="18" ROWSPAN="3"><img src="/images/spacer.gif" border="0" height="1" width="16" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="/images/tab_fls.gif" border="0" height="20" width="3" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="/images/tab_lcs.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="White"><img src="/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="/images/tab_rs.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="/images/tab_lns.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="ebf0f9"><img src="/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="/images/tab_rn.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="/images/tab_nn.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="ebf0f9"><img src="/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="/images/tab_rn.gif" border="0" height="20" width="10" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="/images/tab_xn.gif" border="0" height="20" width="3" /></td>
</tr>
<tr><cfoutput>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="White"><a class="lnk_mhtab" href="./title_client_report_nav.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">General</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav_pre.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Pre-Closing Data</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav_Post.cfm?emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Closing/Post-Closing Data</font></b></a></td>
</tr>
<tr><td HEIGHT="1" BGCOLOR="White"><img src="/images/spacer.gif" border="0" height="1" width="1" /></td>
<td HEIGHT="1" BGCOLOR="ABB7C9"><img src="/images/spacer.gif" border="0" height="1" width="1" /></td><td HEIGHT="1" BGCOLOR="ABB7C9"><img src="/images/spacer.gif" border="0" height="1" width="1" /></td><td HEIGHT="1" BGCOLOR="ABB7C9"><img src="/images/spacer.gif" border="0" height="1" width="1" /></td>
</tr></cfoutput>
</table>
</td></tr></table></td></tr></table>


	<TR>

	<td HEIGHT="3"><img src="/images/spacer.gif" border="0" height="3" width="1" /></td>
</TR><TR><td VALIGN="Middle"><table class="tbl" CELLPADDING="0" CELLSPACING="0" border="0">
		<TR><td><img src="/images/spacer.gif" border="0" height="1" width="27" /></td>
<cfoutput><td><a class="lnk_mhsubnavsel" href="./title_report_navu.cfm?type=#type#&emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">View Order</font></a><cfif url.type neq 'App'><img src="/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="./title_client_upload.cfm?type=#type#&emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Upload File</font></a></cfif><img src="/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="./title_uploaded_file.cfm?type=#type#&emp=#emp#&comp_id=#read_title.comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">View Uploaded Files</font></a>
<img src="/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:#team_email#"><font face="arial,helvetica" color="0033CC" size="2">Contact Pre-Closing Team</font></a><img src="/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" /><a class="lnk_mhsubnav" href="mailto:#team_email#"><font face="arial,helvetica" color="0033CC" size="2">Contact Closing/Post-Closing Team</font></a>
</td></cfoutput>

	</table></TR>

<TR><td HEIGHT="16" VALIGN="Top"><img src="/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	<center><font face="arial,helvetica" color="Blue" size="2">
If you require either a Loan Amount or Proposed Insured endorsement click</font><cfoutput><a href="./endorse_modify.cfm?type=#type#&emp=#emp#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="RED" size="2"> <b>AUTO-ENDORSE</B></font></a></cfoutput> </font></center>

<img src="/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	</td>
</TR></td>


<TR>

<td align = "center" HEIGHT="16" VALIGN="Top"><br>


<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3>
		<br><br><br>

<center><P><FONT FACE=ARIAL color="blue" SIZE=2><b>
	This area is designed for you to upload any documents
for this particular client file.  Please click any
button below to upload</b>	</center>


<cfif url.type eq 'App'>
<cfoutput query="get_file1">

<FORM ACTION="./upload1_client.cfm?type=#type#&emp=#emp#&comp_id=#read_title.comp_id#&rec_id=#rec_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 color=red FACE=ARIAL>

			<CFIF #appraisal_doc_upload# EQ "">
	<!--- Click here to upload an appraisal doc for this order
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"> --->No file uploaded
	</td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is an uploaded file (#appraisal_doc_upload#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file1.appraisal_doc_upload#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
	<!--- Click this button to delete it

	<A onclick="return confirm_delete();" HREF="title_client_upload_delete.cfm?file_num=1&file_name=#get_file1.appraisal_doc_upload#&#cgi.query_string#"><img src="./images/delete.jpg" border=0 ALT="Delete this uploaded file"></a> ---><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font>
</TD></tr></NOBR>
<!--- 	<a href="./delete_upload1_client.cfm?emp=#emp#&rec_id=#rec_id#&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a> --->


</CFIF>		  </FORM>

	</cfoutput>


<cfelse>

	<cfoutput query="get_file1">

<FORM ACTION="./upload1_client.cfm?type=#type#&emp=#emp#&comp_id=#read_title.comp_id#&rec_id=#rec_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 color=red FACE=ARIAL>

			<CFIF #client_upload1# EQ "">
	Click here to upload file-1 for this order
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#client_upload1#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file1.client_upload1#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
	Click this button to delete it

	<A onclick="return confirm_delete();" HREF="title_client_upload_delete.cfm?file_num=1&file_name=#get_file1.client_upload1#&#cgi.query_string#"><img src="./images/delete.jpg" border=0 ALT="Delete this uploaded file"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font>
</TD></tr></NOBR>
<!--- 	<a href="./delete_upload1_client.cfm?emp=#emp#&rec_id=#rec_id#&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a> --->


</CFIF>		  </FORM>

	</cfoutput>

<cfoutput query="get_file2">

<FORM ACTION="./upload2_client.cfm?type=#type#&emp=#emp#&comp_id=#read_title.comp_id#&rec_id=#rec_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #client_upload2# EQ "">
	<FONT SIZE=2 color=red FACE=ARIAL> Click here to upload file-2 for this order
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#client_upload2#).<br>
	Click this button to view it
	<A HREF="#fileSys.FindFilePath('#get_file2.client_upload2#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
	Click this button to delete it

	<A onclick="return confirm_delete();" HREF="title_client_upload_delete.cfm?file_num=2&file_name=#get_file2.client_upload2#&#cgi.query_string#"><img src="./images/delete.jpg" border=0 ALT="Delete this uploaded file"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font></TD></tr></NOBR>
	<!--- <a href="./delete_upload2_client.cfm?emp=#emp#&rec_id=#rec_id#&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a> --->


</CFIF>		  </FORM>

	</cfoutput>


	<cfoutput query="get_file3">

<FORM ACTION="./upload3_client.cfm?type=#type#&emp=#emp#&comp_id=#read_title.comp_id#&rec_id=#rec_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #client_upload3# EQ "">
	<FONT SIZE=2 color=red FACE=ARIAL> Click here to upload file-3 for this order
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#client_upload3#).<br>
	Click this button to view it
	<A HREF="#fileSys.FindFilePath('#get_file3.client_upload3#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
	Click this button to delete it

	<A onclick="return confirm_delete();" HREF="title_client_upload_delete.cfm?file_num=3&file_name=#get_file3.client_upload3#&#cgi.query_string#"><img src="./images/delete.jpg" border=0 ALT="Delete this uploaded file"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font></TD></tr></NOBR>
	<!--- <a href="./delete_upload2_client.cfm?emp=#emp#&rec_id=#rec_id#&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a> --->


</CFIF>		  </FORM>

	</cfoutput>

<cfoutput query="get_file4">

<FORM ACTION="./upload4_client.cfm?type=#type#&emp=#emp#&comp_id=#read_title.comp_id#&rec_id=#rec_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #client_upload4# EQ "">
	<FONT SIZE=2 color=red FACE=ARIAL> Click here to upload file-4 for this order
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#client_upload4#).<br>
	Click this button to view it
	<A HREF="#fileSys.FindFilePath('#get_file4.client_upload4#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
	Click this button to delete it

	<A onclick="return confirm_delete();" HREF="title_client_upload_delete.cfm?file_num=4&file_name=#get_file4.client_upload4#&#cgi.query_string#"><img src="./images/delete.jpg" border=0 ALT="Delete this uploaded file"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font><br></TD></tr></NOBR>
	<!--- <a href="./delete_upload2_client.cfm?emp=#emp#&rec_id=#rec_id#&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a> --->


</CFIF>

	</cfoutput>

	</form>

<cfif get_file5.comp_id eq 4093 or get_file5.comp_id eq 3568>
	<cfoutput query="get_file5">

<FORM ACTION="./upload5_client.cfm?type=#type#&emp=#emp#&comp_id=#read_title.comp_id#&rec_id=#rec_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #reo_package# EQ "">
	<FONT SIZE=2 color=red FACE=ARIAL> Click here to upload REO Package this order
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded REO PACKAGE (#reo_package#).<br>
	Click this button to view it
	<A HREF="#fileSys.FindFilePath('#get_file5.reo_package#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
	Click this button to delete it

	<A onclick="return confirm_delete();" HREF="title_client_upload_delete.cfm?file_num=5&file_name=#get_file5.reo_package#&#cgi.query_string#"><img src="./images/delete.jpg" border=0 ALT="Delete this uploaded file"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font><br></TD></tr></NOBR>
	<!--- <a href="./delete_upload2_client.cfm?emp=#emp#&rec_id=#rec_id#&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a> --->


</CFIF>
</cfoutput>
</cfif>
	 </FORM>
</cfif>


<P></FONT></FONT>


	<td></tr></table>

<br><br><br><br><br><br>
</td>
</TR>


</td>

	</td>
	</tr>


	</td>
	</tr>




		</TD>
	</TR>


		</td>
	</tr><!--- ====================================================================== ---><!--- ====================================================================== ---><!--- ====================================================================== --->





	</table>


			</td>
		</tr>

	</table>

	</td></tr>
	<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>

	</tbody></table>


	</CENTER></CENTER>

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


