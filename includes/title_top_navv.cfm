
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




<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<CFOUTPUT><tr>
			<td width=60 align=left valign=top bgcolor=d3d3d3>
				<a href="https://#cgi.server_name#/vendor_login.cfm?username=#url.username#&password=#url.password#">sign out<!--- <img src="./images/sign_out.gif" border=0 ALT="Click here to sign out"> ---></a>
			</td>
			<td width=60 align=left valign=top bgcolor=d3d3d3>
				<a href="https://#cgi.server_name#/admin_area/blob_list.cfm?rec_id=#rec_id#">
				<img src="./admin_area/images/button_misc_docs.gif" border=0 ALT="View Miscellaneous Docs"></a>
			</td>

			<!--- <td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./title_report_vendor.cfm?rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view_report.gif" border=0 ALT="View the Title Report for this order"></a>
			</td> --->
			<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./title_vendor_add_data.cfm?username=#url.username#&password=#url.password#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_raw_data.gif" border=0 ALT="Click this button to add Raw Data for this order"></a>
			</td>
			<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./title_vendor_data_form.cfm?username=#url.username#&password=#url.password#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_data_form.gif" border=0 ALT="Click this button to add data to the Title Insurance Commitment form  for this order"></a>
			</td>

			<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./title_view_file.cfm?username=#url.username#&password=#url.password#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view_file.gif" border=0 ALT="Click this button to view file for this order"></a>
			</td>

			<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./title_vendor_upload.cfm?username=#url.username#&password=#url.password#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_upload_file.gif" border=0 ALT="Click this button to upload file for this order"></a>
			</td>


		<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./admin_area/title_tax_cert_view.cfm?uid=60&al=1&username=#url.username#&password=#url.password#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_add_tax.gif" border=0 ALT="Click this button to upload file for this order"></a>
			</td>


				<!---<cfif #read_abstract.tx_type# neq "">
		<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./admin_area/title_tax_cert_view.cfm?uid=60&al=1&username=#url.username#&password=#url.password#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_add_tax.gif" border=0 ALT="Click this button to upload file for this order"></a>
			</td></cfif>--->

		</tr>

		</CFOUTPUT>



	</table>

				<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
			<tr><td width=790 align=center valign=top bgcolor=d3d3d3>
	<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><FONT FACE=ARIAL SIZE=2 color="red">
				<b>NOTE: </b>These functions above allow you to provide AUSA the real estate data gathered in your search. You have a choice of 5 different ways to provide us with the information:
				1. Add row data
				2. Add in form
				3. Upload file
				4. Email to us
				5. Fax to us
				</CENTER>

	</td>

	</tr></table>
				<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
	<tr>	<CFOUTPUT>
			<td bgcolor=e1e1e1 width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "committment"><img src="./images/page_ind_title_committment.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td bgcolor=e1e1e1 width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "off_title_1"><img src="./images/page_ind_pay_off_1.gif"><CFELSEIF #CGI.PATH_INFO# CONTAINS "off_title_2"><img src="./images/page_ind_pay_off_2.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2>
			</td></CFOUTPUT>	<!--- <SCRIPT LANGUAGE="JavaScript">
if (window.print) {
document.write('<form>'
+ '<input type=button name=print value="Print" '
+ 'onClick="javascript:window.print()"></form>');
}
</script><br>			 --->

			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br>
			</td>
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br>
			</td>
		</tr>
	</table>
	<p>



