

	<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE id = #USER_ID_1#

	</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_company">
		SELECT *
		FROM companies
		WHERE id = #read_user.comp_id#

	</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>1st Title & Esc. Settlement Services Company & Subsid. Companies<</title>
<!--<script language="javascript">


function CheckForm() {
    var myFormChk = window.document.frm;

    if(myFormChk.title.checked) {

        alert('When checkbox is checked, you must enter a value here')
		}
}

</script>//-->
</head>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
	<tr><td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td></tr>
	<tr><td width=607 align=CENTER valign=top><NOBR><!--- <a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a> ---><a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td></tr>
	<tr><td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></td></tr>

<CFOUTPUT>
	<tr>
		<td width=607 align=center valign=top>

	<table border="0"  width=600 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor=f1f1f1 width=600 align="center" valign="top">
				<font face="Arial" size="2" color="Black">
				Welcome <B>#read_user.lp_fname#</B> to your Account Management<br>
				for <B>#read_company.company#</B><br></font>
				<font face="Arial" size="2" color="Blue"><B>Please choose your product(s) you wish to order for your loan
					</B></font>

			</td>
		</tr>
	</table>

		</td>
	</tr>
</cfoutput>
	<tr>
		<td width=607 align=center valign=top>
		<!---  onSubmit="CheckForm();" --->
<CFFORM name = "frm" ACTION="./form_title_request_addr.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=0" METHOD=POST>

	<table bgcolor=gray border="0" width=275 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor=d3d3d3  width=275 align="center" valign="top">
			<font face="Arial" size="2" color="Black">
			<b>Services</b>
			</font>
			</td>
		</tr>
		<tr>
			<td bgcolor=f1f1f1 width="275" align="center" valign="top">
		  		<font face="verdana" size="1" color="black">
				<!--- <a href="https://www.firsttitleservices.com/form_title_request_addr.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=0"> ---> <img src="./images/button_title.gif" border=0>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!---   </a><B>Commitment Order Form</B>--->
				<INPUT TYPE="checkbox" NAME="title" VALUE=1 onClick="if (document.frm.property.checked){alert('You cannot choose both Property and Title: Property product has been unchecked');document.frm.property.checked = false; }"> <br> <font face="verdana" size="1" color="black">(Committment Order Form)

			</td>
		</tr>

		<tr>
			<td bgcolor=f1f1f1 width="275" align="center" valign="top">
		  		<font face="verdana" size="1" color="black">
				<!--- <a href="https://www.firsttitleservices.com/form_prop_request_addr.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=0"> ---><img src="./images/button_property.gif" border=0>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--- </a>   <B>Report Order Form</B>---><INPUT TYPE="checkbox" NAME="property" VALUE=1 onClick="if (document.frm.title.checked){alert('You cannot choose both Title and Property: Title product has been unchecked');document.frm.title.checked = false; }"><br> <font face="verdana" size="1" color="black">(Report Order Form)

			</td>
		</tr>

	<tr>
			<td bgcolor=f1f1f1 width="275" align="center" valign="center">
		  		<font face="verdana" size="1" color="black">
<!--- <a href="https://www.firsttitleservices.com/form_title_request_addr_appraisal.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=0"> ---><img src="./images/button_appraisal.gif" border=0>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--- </a>  <B>Collat. Mgmt. Request</B> ---><INPUT TYPE="checkbox" NAME="appraisal" VALUE=1><br> <font face="verdana" size="1" color="black">(Appraisal Order Form)

			</td>
		</tr>
		<tr>
			<td bgcolor=f1f1f1 width="275" align="center" valign="center">
		  		<font face="verdana" size="1" color="black">
				<!--- <a href="https://www.firsttitleservices.com/form_title_request_addr_credit.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=0"> ---><img src="./images/button_ancillary_green.gif" border=0>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--- </a>  <B>Credit/Risk Mgmt. Request</B><br> ---> <INPUT TYPE="checkbox" NAME="other" VALUE=1><br> <font face="verdana" size="1" color="black">(Flood, AVM, Signings, Credit)

			</td>
		</tr>
	<tr>
			<td bgcolor=d3d3d3  width=275 align="center" valign="top">
			<INPUT TYPE=IMAGE SRC="./images/button_submit.gif" border=0>
			</td>
	</tr>
	</table>
	<cfoutput>


	</cfoutput>

	</cfform>
<cfoutput>

		<tr>
		<td width=607 align=center valign=top>
	<table bgcolor=white border="0" width=600 cellpadding="1" cellspacing="1">
		<!--- <tr>
			<td bgcolor=f1f1f1 colspan = 5 width="600" align="center" valign="center">
		  		<font face="verdana" size="1" color="black">
				<font face="verdana" size="2" color="black">To schedule a Closing Request for an existing Title Order please click the button below <br><a href="https://#cgi.server_name#/title_closing_search.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=0&company_id=0"><img src="./images/button_closing_purple.gif" border=0></a><br><br><!---   <B>Closing Request</B><br> ---> <font face="verdana" size="1" color="black">

			</td>
		</tr> --->


		</td>
	</tr>
		<tr>
			<td bgcolor=white width="100" align="center" valign="top">
				<a href="./loan_offcr_add.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#" target="New" onClick="window.open('','New','width=470,height=470,left=40,top=40,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_acct_mgt.gif" border=0 ALT="Manage your Account Settings"></a>
			</td>

			<!--- <td bgcolor=white width=115 align=center valign=top>
				<a href="./loan_offcr_mgt.cfm?user_id_1=#user_id_1#" target="New" onClick="window.open('','New','width=470,height=470,left=40,top=40,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_manage_loan_offcr.gif" border=0  ALT="Manage your Loan Officers"></a>
			</td> --->

			<td bgcolor=white width=125 align=center valign=top>
				<a href="https://#cgi.server_name#/title_client_rep_view.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=5&company_id=0" ><img src="./images/button_prop_view.gif" border=0 ALT="View your Title Commitment Reports"></a>
			</td>

			<td bgcolor=white width=125 align=center valign=top>
				<a href="https://#cgi.server_name#/title_closing_search.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=0&company_id=0"><img src="./images/button_title_view.gif" border=0 ALT="Request a Closing for an existing Title order"></a>
			</td>

			<td bgcolor=white width=125 align=center valign=top>
				<a href="https://#cgi.server_name#/calendar.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#" ><img src="./images/button_closing_calendar.gif" border=0 ALT="View Scheduled Closings"></a>
			</td>
			<!--- <td bgcolor=white width=80 align=center valign=top>button_title_closing_view.gifbutton_closing_calendar.gif
				<a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/button_zip_search1.gif" border=0 ALT="Use this to search for a correct Zip Code"></a>
			</td> --->
		 <td bgcolor=white width=80 align=center valign=top>
				<a href="./calculator.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#" ><img src="./images/button_calculator.gif" border=0 ALT="Use this to calculate fees"></a>
			</td>
		</TR>
	</table></td></tr>

</CFOUTPUT>
	<tr><td width=607 align=left valign=bottom><IMG src="./images/bottom.gif"></td></tr></table>
<tr><td width=607 align=left valign=bottom><p align="center">Best viewed with Microsoft Internet Explorer 5.x + <br>
        <a href="https://www.microsoft.com/ie/"><img src="images/ie5get_animated.gif" width="88" height="31" border="0" alt="Get Microsoft Internet Explorer"></a>
        </p>
</td></tr>
</body>
</html>
