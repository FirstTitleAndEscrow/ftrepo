<cfparam name="url.username" default="">
<cfparam name="url.password" default="">

<!---
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
		</CFQUERY> --->




<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<CFOUTPUT><tr>
			<!--- <td width=60 align=left valign=top bgcolor=d3d3d3>
				<a href="https://#cgi.server_name#/vendor_login.cfm">sign out<!--- <img src="./images/sign_out.gif" border=0 ALT="Click here to sign out"> ---></a>
			</td> --->


			<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./abstractor_add_deed.cfm?username=#url.username#&password=#url.password#&rec_id=#url.rec_id#&a_trigger=1"><img src="./images/button_add_data.gif" border=0 ALT="Click this button to add Raw Data for this order"></a>
			</td>
			<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./abstractor_add_mortgage.cfm?username=#url.username#&password=#url.password#&rec_id=#url.rec_id#&a_trigger=1"><img src="./images/button_add_mortgage.gif" border=0 ALT="Click this button to add data to the Title Insurance Commitment form  for this order"></a>
			</td>
			<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./abstractor_add_lien.cfm?username=#url.username#&password=#url.password#&rec_id=#url.rec_id#&a_trigger=1"><img src="./images/button_add_lien.gif" border=0 ALT="Click this button to upload file for this order"></a>
			</td>
<cfif session.logged_in_vendor_id eq 16>
<CFQUERY datasource="#request.dsn#" NAME="read_title_order">
			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#
		</CFQUERY>
				<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./title_view_file.cfm?username=#url.username#&password=#url.password#&rec_id=#url.rec_id#&a_trigger=1&company_id=0"><img src="./images/button_view_file.gif" border=0 ALT="View Uploaded Abstracts for this order"></a>
			</td>
				<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./title_tax_cert_view.cfm?AL=1&UID=248&username=#url.username#&password=#url.password#&rec_id=#url.rec_id#&a_trigger=1&company_id=0"><img src="./images/button_add_tax.gif" border=0 ALT="View Tax Data for this order"></a>
			</td>

				<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./title_comments_nav.cfm?AL=1&UID=248&rec_id=#url.rec_id#&oda_year=#read_title_order.oda_year#&oda_day=#read_title_order.oda_day#&oda_month=#read_title_order.oda_month#&comments=#read_title_order.comments#&appraisal_status=#read_title_order.appraisal_status#&a_trigger=0&code=T" target="notes_window" onClick="window.open('','notes_window','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue"><img src="./admin_area/images/button_notes.gif" border=0 ALT="View Notes on this Order"></a>
			</td>

				<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./vendor_typing.cfm?cleartoclose=1&rec_id=#url.rec_id#&rec_type=T"><img src="./images/button_ctc.gif" border=0 ALT="Mark This Order as Clear To Close"></a>
			</td>
</cfif>
			<!--- <td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./abstractor_add_legal.cfm?rec_id=#rec_id#&a_trigger=1"><img src="./images/button_add_legal.gif" border=0 ALT="Click this button to upload file for this order"></a>
			</td>
		<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./abstractor_add_update.cfm?rec_id=#rec_id#&a_trigger=1"><img src="./images/button_add_update.gif" border=0 ALT="Click this button to upload file for this order"></a>
			</td>
		<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./abstractor_add_recap.cfm?rec_id=#rec_id#&a_trigger=1"><img src="./images/button_add_recap.gif" border=0 ALT="Click this button to upload file for this order"></a>
			</td>	 --->
		</tr>

		</CFOUTPUT>



	</table>

				<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
			<tr><td width=790 align=center valign=top bgcolor=d3d3d3>
	<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><FONT FACE=ARIAL SIZE=2 color="red">
				<b>NOTE: </b>These functions above allow you to ADD data to our orders.

				</CENTER>

	</td>

	</tr></table>
				<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
	<tr>	<CFOUTPUT>
			<td bgcolor=e1e1e1 width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "committment"><img src="./images/page_ind_title_committment.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td bgcolor=e1e1e1 width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "off_title_1"><img src="./images/page_ind_pay_off_1.gif"><CFELSEIF #CGI.PATH_INFO# CONTAINS "off_title_2"><img src="./images/page_ind_pay_off_2.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2>
			</td></CFOUTPUT>


			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br>
			</td>
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br>
			</td>
		</tr>
	</table>
	<p>



