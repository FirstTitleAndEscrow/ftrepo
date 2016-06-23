<cfparam name="user_id_1" default="">
<cfparam name="lo_id" default="">



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


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>


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
<table  cellpadding=0 cellspacing=1 border=0>
	<tr>
		<td  align=center valign=top>
		<table width="780" height="110" border="0" cellpadding="0" cellspacing="0" background="/client/images/banner_black_wout_logo.jpg" valign="top">
  <tbody><tr>
    <td rowspan="2" valign="top" width="220"> 
<a href="./"><img src="../client/images/FT_header_logo.jpg" border="0" alt="First Title Services Homepage" height="110" width="220"></a>
</td>
    <td valign="top" align="right"><br>


</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</tbody></table>
<table width="780">
<!--- <area shape="RECT" coords="240,100,240,100"> --->

	<tr>
		<td  align=middle valign=top  width="780">
<cfoutput>
		<map name="sa">

<area alt="click here to view your order" coords="231,3,365,32" href="./title_tp_view_order.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">

<area alt="click here to view uploaded files" coords="302,49,436,80" href="./title_uploaded_file_tp.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">



<area alt="click here to upload file for this order" coords="235,95,371,123" href="./add_blob.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">

<cfif #read_payoff_info_1.payoff1_upload# NEQ "">
<area alt="click here to view pay off 1" coords="239,174,370,198" href="./pay_off_title_1_view_only_tp.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">
</cfif><cfif #read_payoff_info_2.payoff2_upload# NEQ "">
<area alt="click here to view payoff 2" coords="306,214,439,240" href="./pay_off_title_2_view_only_tp.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">
</cfif><CFIF (#read_current_Commitment_Clauses.s_status# GT "")>
<area alt="click here to view title insurance" coords="382,258,514,285" href="./title_Committment.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#" target = "new">
</cfif>
<area alt="click here to view HUD 1" coords="456,303,591,327" href="./admin_area/saved_huds/HUD_#rec_id#.pdf" target = "new">

<area alt="click here to view loan endorsement" coords="381,344,514,372" href="./view_loan_amount_verify.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#" target = "new">

<area alt="click here to view property endorsement" coords="312,386,445,410" href="./view_proposed_insured_verify.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#" target = "new">
<cfif #read_title_order.ICL_upload# NEQ "">
<area alt="click here to view Insured Closing Letter" coords="236,425,367,451" href="./ICL_view.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">
</cfif>
<CFIF (#Read_Title_Order_Req.request_date# GT "")>

<area alt="click here to request OR view a closing for this order" coords="235,526,363,550" href="./title_closing_report_nav_tp.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">

</cfif>
<CFIF (#Read_Title_Order_info.c_month# GT "")>
<area alt="click here to view information about scheduled closing" coords="319,570,452,597" href="./Title_Closing_View_info.cfm?id=#id#&A_Update_DB_Flag=0&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">
</cfif><CFIF (#Read_Title_Order_shipping.recordcount# GT "") and (#Read_Title_Order_shipping.ID# GT "")>
<area alt="click here to view shipping information" coords="238,612,367,643" href="./shipping_info_u.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#">
</cfif>

<CFIF (#Read_Title_Order_Req.request_date# EQ "")>
<area alt="click here to request OR view a closing for this order" coords="234,518,388,541" href="./form_title_closing_order_request_tp.cfm?id=#id#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">
<cfelse>
<area alt="click here to request OR view a closing for this order" coords="234,518,388,541" href="./title_closing_report_nav_tp.cfm?id=#id#&comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title_order.comp_ID#">

</cfif>

<area alt="click here to se an email to our preclosing team" coords="233,701,394,722" href="mailto:preclosingteam@firsttitleservices.com">



<area alt="click here to send email to our clocing/ post closing team" coords="234,749,396,773" href="mailto:closingteam@firsttitleservices.com">

</map>

</cfoutput>


<table WIDTH="780" CELLPADDING="0" CELLSPACING="0" BORDER="0" bgcolor="#00339A" height="57">
<tr>
<td>
<table WIDTH="672" CELLPADDING="0" CELLSPACING="0" BORDER="0" border="0">
<cfoutput><tr>
<!--- <td rowspan="2" VALIGN="Middle" width="210"><font face="arial,helvetica" color="white" size="2"><b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font></td>
 ---><td WIDTH="602" HEIGHT="37" ALIGN="Right" VALIGN="Middle"><span class="txt_mhsegname"><font face="arial,helvetica" color="white" size="2"><font face="arial,helvetica" color="white" size="2"><b><font face="arial,helvetica" color="white" size="2"><b> <a href="./title_tp_rep_view.cfm?id=#id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_title_order.comp_ID#&comp_id=#comp_id#"><font face="arial,helvetica" color="red" size="2">Back</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Borrower name: #read_title.bfirstname1#&nbsp;&nbsp;#read_title.blastname1#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font face="arial,helvetica" color="white" size="2">Order number: #read_title.title_id#</font></b></span>
</td>
</tr></cfoutput>
</table></td></tr></table>



	<TR><td HEIGHT="16" VALIGN="Top" width="780"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="780" />
	<center><font face="arial,helvetica" color="Blue" size="2">NOTE: Below is a diagram that shows information details of the customer order. If the area on the diagram below is not clickable, that means there is not yet information available for that function.
</font>  </center>
<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/masthead_subnavsep.gif" border="0" height="8" width="780" />
	</td>
</TR></td>
<!--- <TR><td align = "center" bgcolor= "d3d3d3" HEIGHT="16" VALIGN="Top"> usemap="#ss"width="595" height="596"

</td>
</TR> --->
<TR><td align = "center" HEIGHT="16" VALIGN="Top"><br><img src="./images/diagram.jpg"   border="0" usemap="#sa"></td>
</TR>


</td>

	</td>
	</tr>




		</TD>
	</TR>


		</td>
	</tr><!--- ====================================================================== ---><!--- ====================================================================== ---><!--- ====================================================================== --->


	<tr>
		<td width=830 align=left valign=top bgcolor=e1e1el>
		<!--- <nobr><A href="javascript:window.close();"><IMG src="./images/button_close.gif" border=0></a></nobr>
 --->


			</td>


		</tr>



	</table>


			</td>
		</tr>

	</table></CENTER></CENTER>

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





