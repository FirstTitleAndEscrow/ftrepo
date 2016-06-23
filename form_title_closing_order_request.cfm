
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="input_date" DEFAULT="">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="2">
<CFPARAM NAME="emp" DEFAULT="0">

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


		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#

		</CFQUERY>




<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE id = #USER_ID_1#

	</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#



		</cfquery>
			<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT company
		FROM companies
		WHERE id = #get_title.comp_id#

	</CFQUERY>




		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->





		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#



		</cfquery>
		<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		    SELECT company
		    FROM companies
		    WHERE id = #read_title.comp_id#
	    </CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">
				SELECT *
				FROM First_Admin
				WHERE ID = #read_title.comp_ID#
			</CFQUERY>



				<CFQUERY datasource="#request.dsn#" NAME="bbb">
					SELECT *
					FROM Title_Closing_Order_Request
					Where Title_Id = #rec_id#
				</CFQUERY>




		<cfquery name="getorderinfo" datasource="#request.dsn#">
SELECT *
FROM Title_Closing_Order_Request
Where Title_Id = #rec_id#
</cfquery>

	<!--- Read all of the Notes for this title --->

			<CFQUERY datasource="#request.dsn#" NAME="aaaa">
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #rec_id#
			</CFQUERY>

				<CFIF #aaaa.a_sent_by# GT 0>
					<CFSET a_sent = "1">
				<CFELSE>
					<CFSET a_sent = "0">
				</CFIF>

				<CFIF #aaaa.a_filled_out_by# GT 0>
					<CFSET a_filled = "1">
				<CFELSE>
					<CFSET a_filled = "0">
				</CFIF>


			<CFQUERY datasource="#request.dsn#" NAME="Read_Title">
				SELECT *
				FROM Title
				Where Title_Id = #rec_id#
			</CFQUERY>

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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<cfoutput><script type="text/javascript" language="javascript" src="https://#cgi.server_name#/calendar/calendar.js"></script></cfoutput>

<script type="text/javascript">


function ValidateForm(frm)
{
frm = document.frm;
today = new Date();
input = frm.input_date.value;
past = new Date(input);
if (past < today) {

alert("The date for the closing schedule should not be a past date")
 frm.input_date.focus();
      return false;
}



return true;

 }
 </script>
</head>

<IFRAME STYLE="display:none;position:absolute;width:157;height:158;z-index=100" ID="CalFrame" MARGINHEIGHT=0 MARGINWIDTH=0 NORESIZE FRAMEBORDER=0 SCROLLING=NO SRC="./calendar/popup_calendar.html"></IFRAME>


<BODY BGCOLOR="white" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
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
<CENTER>
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





<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">

		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		   <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='FECE62'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='./contact_team.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./contact_team.cfmcomp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='E79DF5'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calculator.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')';return false;"><a class="menu1" href="./coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
            <CFIF #read_company.companies_switch# eq "1">
                <CFIF #read_company_user.Administrator# eq "1">
                    <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='00FF66'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
                </CFIF>
            <CFELSE>
                <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='00FF66'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
            </CFIF>
        <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='00FF66'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#';return false;"> <a class="menu1"  href="./loan_offcr_add.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='FF9900'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0';return false;"><a class="menu1" href="./title_client_rep_view.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onMouseOver="this.bgColor='0066CC'" onMouseOut="this.bgColor='CCD2D2'" onClick="document.location.href='./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="./calendar.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT>
			        	 </table></center>



 <table width=770 border="0" cellpadding="0" cellspacing="0" >
  <TBODY>

	<tr>
		<td width=780 align=middle valign=top bgcolor=e1e1el>

<tr>
		<td width=770 align=middle valign=top bgcolor=e1e1el>


<table WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0" bgcolor="#00339A" height="57"><tr><td>
<table WIDTH="668" CELLPADDING="0" CELLSPACING="0" BORDER="0">
<cfoutput><tr>
<!--- <td rowspan="2" VALIGN="Middle" width="210"><font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></td>
 ---><td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><b><a href="./client_acct_mgt.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#"><FONT FACE=ARIAL SIZE=2 color="red"><b>Back to main</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order Detail for Number: #read_title.title_id#</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></span>
</td>
</tr></cfoutput>
<td HEIGHT="20" ALIGN="Left" VALIGN="Bottom" ><table class="tbl_mhtabs" CELLPADDING="0" CELLSPACING="0" BORDER="0"  height="20">
<tr>
<td WIDTH="18" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="1" width="16" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_fln.gif" border="0" height="20" width="3" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_lcn.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="#ebf0f9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rn.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_nn.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="#ebf0f9"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rcns.gif" border="0" height="20" width="10" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_lcs.gif"  border="0" height="20" width="10" /></td>
<td HEIGHT="2" BGCOLOR="White"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/spacer.gif" border="0" height="2" width="1" /></td>
<td WIDTH="10" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_rs.gif" border="0" height="20" width="10" /></td>
<td WIDTH="3" HEIGHT="20" ROWSPAN="3"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/tab_xs.gif" border="0" height="20" width="3" /></td>
</tr>
<tr><cfoutput>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">General</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="CCDAF0"><a class="lnk_mhtab" href="./title_client_report_nav_pre.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Pre-Closing Data</font></b></a></td>
<td HEIGHT="17" VALIGN="Middle" BGCOLOR="White"><a class="lnk_mhtab" href="./title_client_report_nav_post.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#"><b><font face="verdana,arial,helvetica" color="003399" size="1">Closing/Post-Closing Data</font></b></a></td>
</cfoutput></tr>

<cfoutput><tr><td HEIGHT="1" BGCOLOR="##ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
<td HEIGHT="1" BGCOLOR="##ABB7C9"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
<td HEIGHT="1" BGCOLOR="White"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="1" /></td>
</tr></table></td></tr></table></td></tr></cfoutput></table>





	<TR>

	<cfoutput><td HEIGHT="3"><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="3" width="1" /></td>
</TR><TR><td VALIGN="Middle"><table class="tbl" CELLPADDING="0" CELLSPACING="0" border="0">
		<TR><td><img src="https://#cgi.server_name#/images/spacer.gif" border="0" height="1" width="27" /></td></cfoutput>
<td><cfoutput>

<CFIF (#Read_Title_Order_Req.request_date# eq "")>
<a class="lnk_mhsubnavsel" href="./form_title_closing_order_request.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Request</font></a>
<cfelse><a class="lnk_mhsubnavsel" href="./title_closing_report_nav.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Request</font></a>
</cfif>

<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />

<CFIF (#Read_Title_Order_info.c_month# neq "")>
<a class="lnk_mhsubnavsel" href="./Title_Closing_View_info.cfm?emp=#emp#&comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Information</font></a>
<cfelse><font face="arial,helvetica" color="gray" size="2">Closing Information</font></cfif>

<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />
<CFIF (#Read_Title_Order_info.c_month# neq "")>
<a class="lnk_mhsubnavsel" href="./Title_Closing_View_info.cfm?comp_id=#comp_id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Closing Information</font></a>
<cfelse><font face="arial,helvetica" color="gray" size="2">Closing Information</font></cfif>

<img src="https://#cgi.server_name#/images/masthead_subnav_sep.gif" align="AbsMiddle" border="0" height="15" width="15" />
			<CFIF (#Read_Title_Order_shipping.recordcount# GT "") and (#Read_Title_Order_shipping.ID# GT "")>
<a class="lnk_mhsubnav" href="./shipping_info_u.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="0033CC" size="2">Shipping Information</font></a>
<cfelse><font face="arial,helvetica" color="gray" size="2">Shipping Information</font>
</cfif>

</cfoutput>
</td>

	</table></TR>
		<TR><td HEIGHT="16" VALIGN="Top"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	<center><font face="arial,helvetica" color="Blue" size="2">
If you require either a Loan Amount or Proposed Insured endorsement click</font><cfoutput><a href="./endorse_modify.cfm?emp=#emp#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title_order.title_id#&a_trigger=1&company_id=#read_title_order.comp_ID#"><font face="arial,helvetica" color="RED" size="2"> <b>AUTO-ENDORSE</B></font></a></cfoutput> </font></center>

<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="770" />
	</td>
</TR></td>


<TR><td align = "center" HEIGHT="16" VALIGN="Top"><br>



<cfoutput>
<!--- <cfif #aaaa.A_Req_Closing_Day# eq ""> --->
<cfif #aaaa.A_Req_Closing_month# eq "">
<center><b><font face=verdana size=2 color=blue> COMPLETE FORM BELOW TO REQUEST CLOSING</font></b></center>
<P>
<cfelse>
<center><b><font face=verdana size=2 color=blue> UPDATE INFORMATION FOR THIS REQUESTED CLOSING</font></b></center>
<P>
</cfif>
<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>


				<!---<CFQUERY datasource="#request.dsn#" NAME="read_users_info_6">
				SELECT *
				FROM First_Admin
				Where ID = #aaaa.a_filled_out_by#
			</CFQUERY>

		 <CFQUERY datasource="#request.dsn#" NAME="read_users_info_5">
				SELECT *
				FROM First_Admin
				Where ID = #aaaa.a_sent_by#
			</CFQUERY> --->
			<CFQUERY datasource="#request.dsn#" NAME="read_users_info">
				SELECT *
				FROM users
				Where ID = '#aaaa.a_filled_out_by#'
			</CFQUERY>
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=d1d1d1>
		<tr>
			 <td width=100 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=black face=arial>
				FILLED Out By -
			</td>
			<td width=249 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=blue face=arial>




			<!--- <B>#read_users_info_6.fname#  #read_users_info_6.lname#</B> --->
			<CFIF #a_filled# GT "0">
					<B>#read_users_info.lp_fname#  #read_users_info.lp_lname#</B>
				<CFELSE>
					<font size=2 color=red face=arial>
					<b>Not FILLED out yet</b>
				</CFIF>
			</td>
			<!---<td width=100 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=black face=arial>
				SENT By -
			</td>
			 <td width=250 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=blue face=arial>
				<CFIF #a_sent# GT "0">
					<B>#read_users_info_5.fname#  #read_users_info_5.lname#</B>
				<CFELSE>
					<font size=2 color=red face=arial>
					<b>Not SENT out yet</b>
				</CFIF>
			</td> --->
		</tr>
	<!--- =================================================================== --->
		<tr>
			<td width=100 align=right valign=top bgcolor=d1d1d1>
				<font size=2 color=black face=arial>
				Date - Time -
			</td>
			<td width=249 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=blue face=arial>
				<CFIF #a_filled# GT "0">
					<font size=2 color=blue face=arial><B>#aaaa.a_filled_out_date#</B> - <B>#aaaa.a_filled_out_time#</B></NOBR>
				</CFIF>
			</td>
			<!--- <td width=100 align=right valign=top bgcolor=d1d1d1>
				<font size=2 color=black face=arial>
				Date - Time -
			</td>
			<td width=250 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=blue face=arial>
				<CFIF #a_sent# GT "0">
					<font size=2 color=blue face=arial><B>#aaaa.a_sent_date#</B> -  <B>#aaaa.a_sent_time#</B>
				</CFIF>
			</td> --->
		</tr>
	</table>

</cfoutput>

<CFFORM NAME="frm" ACTION="./form_title_closing_order_request_reciept.cfm?emp=#emp#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=2" onsubmit="javascript:return ValidateForm(this)" ENCTYPE="multipart/form-data" METHOD=POST>
<CFOUTPUT>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=right valign=top bgcolor=e1e1e1>
			<p>
			<br>
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=350 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
			<td width=349 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
		</tr>
		<tr>
			<td width=350 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# #Read_Title.BLastName1#</B>
			</td>
			<td width=349 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# #Read_Title.BLastName2#</B>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR>
			</td>
		</tr>
	</table>


</CFOUTPUT>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>

	</table>



	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>


			<td width="30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Request
			</td>



<td width="70%" align=left valign=top bgcolor=e1e1e1>
<CFOUTPUT>
<cfINPUT TYPE="Text" NAME="input_date" size=12 maxlength=20
									value = "#getorderinfo.A_Req_Closing_month#/#getorderinfo.A_Req_Closing_day#/#getorderinfo.A_Req_Closing_year#"
								style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
							</CFOUTPUT> <font face=verdana size=2 color=black>Please click <A href="javascript:ShowCalendar(document.all('calpic'),document.all('input_date'),document.all('null'),'01/1/2002', '12/31/2009')" onClick="event.cancelBubble=true;"><img src="./calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A> to choose closing date
	<CFOUTPUT>
<!---

<select name="confirm_mon"
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
								cols="45">
	 	<cfif #getorderinfo.a_req_closing_month# NEQ "">
		<option value="#getorderinfo.A_Req_Closing_month#" selected>#getorderinfo.A_Req_Closing_month#</option>
		<option value="01">01</option>
		<option value="02">02</option>
		<option value="03">03</option>
		<option value="04">04</option>
		<option value="05">05</option>
		<option value="06">06</option>
		<option value="07">07</option>
		<option value="08">08</option>
		<option value="09">09</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
<cfelse>
<option value="">Month</option>


	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
</cfif>

</select>

<select name="comfirm_day"
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
								cols="45">
	 	<cfif #getorderinfo.a_req_closing_day# NEQ "">
		<option value="#getorderinfo.A_Req_Closing_day#" selected>#getorderinfo.A_Req_Closing_day#</option>
		<cfelse>
		<OPTION VALUE="">Day</OPTION>
		</cfif>

		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>

</select>

<select name="confirm_year"
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
								cols="45">
		<cfif #getorderinfo.a_req_closing_year# NEQ "">
		<option value="#getorderinfo.A_Req_Closing_year#" selected>#getorderinfo.A_Req_Closing_year#</option>
		<cfelse>
		<option value="">Year</option>
		</cfif>
	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
		</select> --->


</td></tr>

		<TR>
			<td width = "30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Request
			</td>

			<td width="70%" align=left valign=top bgcolor=e1e1e1>
			<SELECT name="a_req_closing_time"
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
								cols="45">
<cfif #getorderinfo.a_req_closing_time# NEQ "">
		<option value="#getorderinfo.A_Req_Closing_time#" selected>#getorderinfo.A_Req_Closing_time#</option>
		<cfelse>
		<option value="">
		</cfif>
<option value="">
<option value="08:00 am">8:00 am
<option value="08:30 am">8:30 am
<option value="09:00 am">9:00 am
<option value="09:30 am">9:30 am
<option value="10:00 am">10:00 am
<option value="10:30 am">10:30 am
<option value="11:00 am">11:00 am
<option value="11:30 am">11:30 am
<option value="12:00 am">12:00 pm
<option value="12:30 am">12:30 pm
<option value="1:00 pm">1:00 pm
<option value="1:30 pm">1:30 pm
<option value="2:00 pm">2:00 pm
<option value="2:30 pm">2:30 pm
<option value="3:00 pm">3:00 pm
<option value="3:30 pm">3:30 pm
<option value="4:00 pm">4:00 pm
<option value="4:30 pm">4:30 pm
<option value="5:00 pm">5:00 pm
<option value="5:30 pm">5:30 pm
<option value="6:00 pm">6:00 pm
<option value="6:30 pm">6:30 pm
<option value="7:00 pm">7:00 pm
<option value="7:30 pm">7:30 pm
<option value="8:00 pm">8:00 pm
<option value="8:30 pm">8:30 pm
<option value="9:00 pm">9:00 pm
<option value="9:30 pm">9:30 pm
<option value="10:30 pm">10:30 pm
<option value="11:00 pm">11:00 pm
</SELECT>

</td>
		</tr>
	</table>



	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
				<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
			<!--- 		<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requested By -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Requested_By"  size=35 maxlength=100
							VALUE="#aaaa.A_Requested_By#"
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
							clear: none; ">
						</td>
					</tr> --->
				<!--- ==============================================================
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requestors Title -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Req_By_Title"  size=35 maxlength=100
							VALUE="#aaaa.A_Req_By_Title#"
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
							clear: none; ">
						</td>
					</tr>--->
				<!--- ============================================================== --->
					<tr>
			<td width=268 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			Location for Closing </td>
		<td width=410 align=left valign=top bgcolor=e1e1e1>

					<select name="A_Settle_Location"
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
								cols="45">
	 	<cfif #getorderinfo.a_req_closing_month# NEQ "">
		<option value="#getorderinfo.A_Settle_Location#">#getorderinfo.A_Settle_Location#</option>
		</cfif>
		<option value="address">Property Address</option>
		<option value="other">Other</option>
		<cfif #get_title.pstate# eq "DE" OR #get_title.pstate# eq "GA" OR #get_title.pstate# eq "MA" OR #get_title.pstate# eq "SC">
		<option value="ATTORNEY">Attorney Closing</option>
		</cfif>

	</select>
			</td>
		</tr>

				 <tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requesting Company -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<cfif #getorderinfo.A_Req_By_Company# NEQ "">
						<CFINPUT type=text name="A_Req_By_Company"  size=35 maxlength=100
							VALUE="#getorderinfo.A_Req_By_Company#"
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
							clear: none; ">
						<cfelse>
						<CFINPUT type=text name="A_Req_By_Company"  size=35 maxlength=100
							VALUE="#read_comp.company#"
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
							clear: none; ">
							</cfif>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<cfif #getorderinfo.A_Req_By_Phone# NEQ "">
						<CFINPUT type=text name="A_Req_By_Phone"  size=35 maxlength=50
							VALUE="#getorderinfo.A_Req_By_Phone#"
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
							clear: none; ">
						<cfelse>
						<CFINPUT type=text name="A_Req_By_Phone"  size=35 maxlength=50
							VALUE="#read_title.pPhone#"
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
							clear: none; ">
							</cfif>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<cfif #getorderinfo.A_Req_By_Ext# NEQ "">
						<CFINPUT type=text name="A_Req_By_Ext"  size=15 maxlength=50
							VALUE="#getorderinfo.A_Req_By_Ext#"
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
							clear: none; ">
							<cfelse>
							<CFINPUT type=text name="A_Req_By_Ext"  size=15 maxlength=50
							VALUE="#read_title.pExt#"
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
							clear: none; ">
							</cfif>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Fax -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<cfif #getorderinfo.A_Req_By_Fax# NEQ "">
						<CFINPUT type=text name="A_Req_By_Fax"  size=35 maxlength=50
							VALUE="#getorderinfo.A_Req_By_Fax#"
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
							clear: none; ">
						<cfelse>
						<CFINPUT type=text name="A_Req_By_Fax"  size=35 maxlength=50
							VALUE="#read_title.pFax#"
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
							clear: none; ">
							</cfif>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Email -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<cfif #getorderinfo.A_Req_By_Email# NEQ "">
						<CFINPUT type=text name="A_Req_By_Email"  size=60 maxlength=160
							VALUE="#getorderinfo.A_Req_By_Email#"
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
							clear: none; ">
						<cfelse>
						<CFINPUT type=text name="A_Req_By_Email"  size=60 maxlength=160
							VALUE="#read_title.verifyemail#"
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
							clear: none; ">
							</cfif>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						After Hours / Weekend Phone and Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Req_By_After_Hours_Phone"  size=60 maxlength=160
							VALUE="#aaaa.A_Req_By_After_Hours_Phone#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Name -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Managers_Name"  size=60 maxlength=160
							VALUE="#aaaa.A_Managers_Name#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Phone  -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Managers_Phone"  size=35 maxlength=50
							VALUE="#aaaa.A_Managers_Phone#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
						<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>

					<p><font face=verdana size=2 color=black>
				How will package be shipped  - <font face=verdana size=1 color=green>
				<br>
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
							<select name="A_How_Will_Be_Shipped"
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
								cols="45">
	 	<cfif #getorderinfo.A_How_Will_Be_Shipped# NEQ "">
		<option value="#getorderinfo.A_Settle_Location#">#getorderinfo.A_How_Will_Be_Shipped#</option>
		</cfif>
		<option value="email">Email</option>
		<option value="internet">Internet</option>
		<option value="Overnight">Overnight</option>
		<option value="other">Other</option>


	</select></td>
					</tr>

			</table>

			<!--- 		<p><font face=verdana size=2 color=black>
				When will the Package be ready :<br>
				<TEXTAREA name="A_When_Pkg_Will_Be_Ready"  COLS=110 ROWS=8
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
					clear: none;">#aaaa.A_When_Pkg_Will_Be_Ready#</TEXTAREA>
					<p><font face=verdana size=2 color=black>
				When will the Package be ready :<br>
					<CFINPUT type=text name="A_When_Pkg_Will_Be_Ready"  size=60 maxlength=160
							VALUE="#aaaa.A_When_Pkg_Will_Be_Ready#"
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
							clear: none; ">--->




				<p>		<font face=verdana size=2 color=black>
				Special Instructions :<br>
				<TEXTAREA name="A_Special_Inst"  COLS=110 ROWS=8
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
					clear: none;">#aaaa.A_Special_Inst#</TEXTAREA>
					<p>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=right valign=top bgcolor=e1e1e1>
				<INPUT type=image src="./images/button_submit.gif" border=0>
			</td>
		</tr>
	</table>
</CFOUTPUT>
</CFFORM>

<!--- <CFFORM NAME="frm" ACTION="./form_title_closing_order_request.cfm?user_ID=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=5" METHOD=POST>
<CFOUTPUT>
<input type=hidden name="Job_Number" VALUE="#aaaa.Job_Number#">
<input type=hidden name="A_Req_Date" VALUE="#aaaa.A_Req_Date#">
<input type=hidden name="A_Req_Time" VALUE="#aaaa.A_Req_Time#">
<input type=hidden name="A_Req_Closing_Day" VALUE="#aaaa.A_Req_Closing_Day#">
<input type=hidden name="request_date" VALUE="#aaaa.request_date#">
<input type=hidden name="A_Req_Closing_month" VALUE="#aaaa.A_Req_Closing_month#">
<input type=hidden name="A_Req_Closing_year" VALUE="#aaaa.A_Req_Closing_year#">
<input type=hidden name="A_Req_Closing_Time" VALUE="#aaaa.A_Req_Closing_Time#">
<input type=hidden name="A_Settle_Location" VALUE="#aaaa.A_Settle_Location#">
<input type=hidden name="A_Requested_By" VALUE="#aaaa.A_Requested_By#">
<input type=hidden name="A_Req_By_Title" VALUE="#aaaa.A_Req_By_Title#">
<input type=hidden name="A_Req_By_Company" VALUE="#aaaa.A_Req_By_Company#">
<input type=hidden name="A_Req_By_Phone" VALUE="#aaaa.A_Req_By_Phone#">
<input type=hidden name="A_Req_By_Ext" VALUE="#aaaa.A_Req_By_Ext#">
<input type=hidden name="A_Req_By_Fax" VALUE="#aaaa.A_Req_By_Fax#">
<input type=hidden name="A_Req_By_Email" VALUE="#aaaa.A_Req_By_Email#">
<input type=hidden name="A_Req_By_After_Hours_Phone" VALUE="#aaaa.A_Req_By_After_Hours_Phone#">
<input type=hidden name="A_Managers_Name" VALUE="#aaaa.A_Managers_Name#">
<input type=hidden name="A_Managers_Phone" VALUE="#aaaa.A_Managers_Phone#">
<input type=hidden name="A_When_Pkg_Will_Be_Ready" VALUE="#aaaa.A_When_Pkg_Will_Be_Ready#">
<input type=hidden name="A_How_Will_Be_Shipped" VALUE="#aaaa.A_How_Will_Be_Shipped#">
<input type=hidden name="A_Special_Inst" VALUE="#aaaa.A_Special_Inst#">
<input type=hidden name="user_ID" VALUE="#URL.USER_ID_1#">

</CFOUTPUT>

</CFFORM> --->
	<!--- <table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=1 color=red>
				<img src="./images/arrow_blue_up.gif"><br>
				If you made changes to the form above, you must first click the Submit Button.<br>
				Then, when the page reloads, you can click on the MARK AS SENT button.
			</td>
		</tr>
	</table>	 --->





</td>
</TR>


</td>

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

