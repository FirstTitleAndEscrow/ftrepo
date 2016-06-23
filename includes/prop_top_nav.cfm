		

		<CFQUERY datasource="#request.dsn#" NAME="read_for_indicator">
		
			SELECT *
			FROM Tax_Cert_Prop
			WHERE Prop_ID = #rec_ID#

		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_abstract">
		
			SELECT *
			FROM Doc_Abstract_Prop
			WHERE Prop_ID = #rec_ID#

		
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_closer">
		
			SELECT *
			FROM Doc_closer_Prop
			WHERE prop_ID = #rec_ID#

		
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="Read_Title_Order_Req">		
				SELECT *
				FROM Title_Closing_Order_Request_Prop
				Where Prop_Id = #URL.rec_id#
			</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_prop_order">
			SELECT *
			FROM Property
			WHERE Prop_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			WHERE ID = #read_prop_order.comp_ID#
		</CFQUERY>
		
		
		
				<CFQUERY datasource="#request.dsn#" NAME="read_prop_order2">
		
			SELECT *
			FROM First_Title_States
			WHERE st_abbrev = '#read_prop_order.pstate#'

		
		</CFQUERY>
		
		
		
		<CFQUERY datasource="#request.dsn#" NAME="read_appraisal">
		
			SELECT *
			FROM Appraisal_Doc_Prop
			WHERE Prop_ID = #rec_ID#

		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_1">		
			SELECT *
			FROM Pay_Off_Lender_1_Prop
			WHERE Prop_ID = #rec_ID#		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_2">		
			SELECT *
			FROM Pay_Off_Lender_2_Prop
			WHERE Prop_ID = #rec_ID#		
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_current_Commitment_Clauses">		
			SELECT *
			FROM Doc_Title_Insurance_Prop
			WHERE Prop_ID = #rec_ID#		
		</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_tax">
		
			SELECT *
			FROM tax_cert_prop
			where prop_id = #rec_id# 
		</CFQUERY>
<cfquery name="get_adata" datasource="#request.dsn#">
select * from title_ins_add where title_id = #url.rec_id#
</cfquery>

<cfquery name="get_afile" datasource="#request.dsn#">
select * from doc_abstract_prop where prop_id = #url.rec_id#
</cfquery>
<CFOUTPUT>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=black>
	<tr>
		<td width=99 align=left valign=top bgcolor=d3d3d3>
			<img src="./images/clear.gif" width=99 height=2><br>			
			<NOBR>
			<a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
			<img src="./images/button_report.gif" border=0 ALT="Modify this Property Report">
			</a>
			<a href="./prop_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
			<img src="./images/button_view.gif" border=0 ALT="View the Property Report for this order">
			</a>&nbsp;
			<img src="./images/ind_started.gif" ALT="Property Report Has Been SUBMITTED"></NOBR><br>			
		    <a href="./add_blob.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
			<img src="./images/button_misc_docs.gif" border=0 ALT="Add docs to this Title Report">
			</a></NOBR>
		</td>
		<td width=99 align=left valign=top bgcolor=d3d3d3>
			<img src="./images/clear.gif" width=99 height=2><br>
			<NOBR>
			<a href="./prop_tax_cert_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
			<img src="./images/button_tax_cert.gif" border=0 ALT="Modify the Tax Certificate for this order">
			</a>
			<CFIF #read_tax.a_date_started# NEQ "">
				<img src="./images/ind_closed.gif" ALT="Tax Cert Has Been COMPLETED">
			<CFELSE>
				<img src="./images/ind_open.gif" ALT="Tax Cert Has NOT been Submitted">
			</CFIF>
			</NOBR>
		</td>
		<td width=99 align=center valign=top bgcolor=d3d3d3>
			<img src="./images/clear.gif" width=99 height=2><br><NOBR>
			<a href="./prop_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
			<img src="./images/button_abstract.gif" border=0 ALT="Manage the Assignment and Reciept of Abstract for this order">
			</a>
			<CFIF (#read_abstract.a_assigned_by# GT "0" or #read_abstract.a_assigned_by# GT "") AND (#read_abstract.abstractor_doc_upload# GT "" OR #read_abstract.abstractor_doc_upload2# GT "" OR #read_abstract.abstractor_doc_upload3# GT "")>
				<img src="./images/ind_closed.gif" ALT="The Abstract for this Order Has Been RECEIVED">
			<CFELSEIF (#read_abstract.a_assigned_by# GT "0" or #read_abstract.a_assigned_by# GT "") AND (#read_abstract.abstractor_doc_upload# EQ "" and #read_abstract.abstractor_doc_upload2# EQ "" and #read_abstract.abstractor_doc_upload3# EQ "")>
				<img src="./images/ind_started.gif" ALT="The Abstract for this Order Has Been ASSIGNED">
			<CFELSE>
				<img src="./images/ind_open.gif" ALT="The Abstract for this Order Has NOT been Submitted">
			</CFIF>
			<CFIF #read_abstract.abstractor_doc_upload# NEQ "">
				<a href="./prop_abstract_doc_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID# ">
				<img src="./images/button_view.gif" border=0 ALT="View file-1 Abstract for this order, so that it can be Printed">
				</a>
			<cfelse>
				<img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order">
			</CFIF>
			<CFIF #read_abstract.abstractor_doc_upload2# NEQ "">
				<a href="./prop_abstract_doc_view2_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
				<img src="./images/button_view.gif" border=0 ALT="View file-2 Abstract for this order, so that it can be Printed">
				</a>
			<cfelse>
				<img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order">
			</CFIF>
			<CFIF #read_abstract.abstractor_doc_upload3# NEQ "">
				<a href="./prop_abstract_doc_view3_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" >
				<img src="./images/button_view.gif" border=0 ALT="View file-3 Abstract for this order, so that it can be Printed">
				</a>
				</a>
			<cfelse>
				<img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order">
			</CFIF>
			</nobr>
			<nobr>
			<cfif #get_adata.recordcount# GT "0"> 
				<!--- <a href="./vendor_abstract_view_data.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"> --->
				<img src="./images/button_vendor_a.gif" border=0 ALT="View the data sent from abstractor, for this order, so that it can be Printed">
				</a>
			<CFELSE>
				<img src="./images/button_vendor_a_faded.gif" border=0 ALT="There is no data for this order">	
			</CFIF>	
			<cfif #get_afile.abstract_upload1# NEQ "">
				<a href="./abstract1_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view.gif" border=0 ALT="View the file-1 Info for Abstractor, for this order, so that it can be Printed"></a>
			<CFELSE>
				<img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order">
			</CFIF>
			<cfif #get_afile.abstract_upload2# NEQ "">
				<a href="./abstract2_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
				<img src="./images/button_view.gif" border=0 ALT="View the file-2 Info for Abstractor, for this order, so that it can be Printed">
				</a>
			<CFELSE>
				<img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order">
			</CFIF>
		    <cfif #get_afile.abstract_upload3# NEQ "">
				<a href="./abstract3_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
				<img src="./images/button_view.gif" border=0 ALT="View the file-3 Info for Abstractor, for this order, so that it can be Printed">
				</a>
			<CFELSE>
				<img src="./images/button_view_gray.gif" border=0 ALT="There is no file for this order">
			</CFIF>
			</nobr>
		</td>
		<td width=99 align=left valign=top bgcolor=d3d3d3>
			<!--- <img src="./images/clear.gif" width=99 height=2> ---><NOBR>
			<cfif #read_prop_order.hud# neq "">
				<cfif #read_prop_order.hud_type# eq "0">
					<!--- <a href="./prop_view_hud_pg1.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target = "new">
					<img src="./images/button_pre_hud-1.jpg" border=0 ALT="View/Modify HUD1 for this order">
					</a> --->
				<cfelse>
					<!--- <a href="./prop_view_hud1a.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target = "new">
					<img src="./images/button_pre_hud-1.jpg" border=0 ALT="View/Modify HUD1A for this order"></a> --->
				</cfif>
				<br>
			</cfif>
				<a href="./admin_Property_report.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
				<img src="./images/button_prop_report.gif" border=0 ALT="Manage the Title Insurance Commitment for this order">
				</a><a href="./property_report<cfif (Read_Company.id eq 8260 or read_company.master_co_id eq 8260 or Read_Company.id eq 9031)>_doj</cfif>.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="Prop_Committment_view" onClick="window.open('','Prop_Committment_view','width=790,height=600,status=0,resizable=1,scrollbars=1,menubar=1')">
				<img src="./images/button_view.gif" border=0 ALT="View the Title Insurance Commitment for this order, so that it can be Printed"></a>&nbsp;
			<CFIF #read_current_Commitment_Clauses.s_status# neq "">
				<img src="./images/ind_closed.gif" ALT="The Title Insurance Commitment for this Order Has Been RECEIVED">
			<CFELSE>
				<img src="./images/ind_open.gif" ALT="The Title Insurance Commitment for this Order Has NOT been Submitted">
			</CFIF>
			</NOBR>
		</td>
		<td width=98 align=center valign=top bgcolor=d3d3d3>
			<img src="./images/clear.gif" width=98 height=2><br>
			<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
			<img src="./images/button_notes.gif" border=0 ALT="View and Add notes for this Title Order">
			</a>
		</td>
		<td width=98 align=center valign=top bgcolor=d3d3d3>
			<img src="./images/clear.gif" width=98 height=2><br>
			<cfif #read_prop_order.hud_type# eq "0" or #read_prop_order.hud_type# eq "1">
				<nobr>
				<!---If the Closing was requested display info  --->
				<CFIF #Len(read_title_order_req.request_date)# gte 1>
					<!---show display screen--->
					<a href="./Prop_closing_order_request_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
				    <img src="./images/button_title_order_req.gif" border=0 ALT="View Closing Request Information"></a>
				<CFELSE>
					<a href="./Form_prop_closing_order_requesta.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
				    <img src="./images/button_title_order_req.gif" border=0 ALT="Request Closing"></a>
				</CFIF> 
				<CFIF #Len(read_closer.a_Date_Assigned)# gte 1>
					<!---It's already been assigned so view it--->
					<a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" >
					<img src="./images/button_view.gif" border=0 ALT="View the Title Order Request for this order"></a>
				<cfelse>
					<!---Assign it---->
					<a href="./prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" >
					<img src="./images/button_view.gif" border=0 ALT="Assign the closer"></a>
				</CFIF>
				<CFIF #read_closer.a_assigned_by# GT "" AND #read_closer.a_recieved_by# GT "">
					<img src="./images/ind_closed.gif" ALT="The Closer for this Order Has Been RECEIVED">
				<CFELSEIF #read_closer.a_assigned_by# GT "" AND #read_closer.a_recieved_by# EQ "">
					<img src="./images/ind_started.gif" ALT="The Closer for this Order Has Been ASSIGNED">
				<CFELSE>
					<img src="./images/ind_open.gif" ALT="The Closer for this Order Has NOT been Submitted">
				</CFIF>
					</nobr><br>
					<a href="./prop_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_title_order_info.gif" border=0 ALT="Manage the closing information to send to clients for the Title Order Request for this order">
					</a>
				<CFIF (#Read_Title_Order_Req.a_req_closing_day# GT 0) And (#Read_Prop_Order.appraisal_status# EQ "Closing Scheduled")>
					<img src="./images/ind_closed.gif" ALT="The Closing Information for the Title Order Request Form for this Order Has Been COMPLETED">
				<CFELSEIF (#Read_Title_Order_Req.a_req_closing_day# GT 0) AND (#Read_Prop_Order.appraisal_status# NEQ "Closing Scheduled")>
					<img src="./images/ind_started.gif" ALT="The Title Order Request has been submitted but not yet completed for this order">
				<CFELSE>
					<img src="./images/ind_open.gif" ALT="The Title Order Request Form for this Order Has NOT been Filled Out and completed"></CFIF></NOBR>
				</cfif>
		</td>
		<td width=98 align=center  =top bgcolor=d3d3d3>
			<cfif #read_prop_order2.recordcount# GT 0>
				<a href="./merge_prop_info_ADMIN.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
				merge to Tile Commitment</a>
			<CFelse>
				merge to Tile Commitment
			</cfif>
			<br>
		</td>
	</tr>
</table>
</CFOUTPUT>
<!--- ======================================================================= <img src="./images/clear.gif" width=98 height=2>--->
<CFOUTPUT>
<table width=790 cellpadding=0 cellspacing=0 border=0 bgcolor=FBCA32>
	<tr>
			<td width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "prop_tax_cert"><img src="./images/page_ind_tax_cert.gif"><CFELSEIF #CGI.PATH_INFO# CONTAINS "prop_report"><img src="./images/page_ind_order.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "hud_pg1"><img src="./images/page_ind_hud-1.gif"></CFIF><CFIF #CGI.PATH_INFO# CONTAINS "hud_pg2"><img src="./images/page_ind_hud-2.gif"></CFIF><CFIF #CGI.PATH_INFO# CONTAINS "hud_pg3"><img src="./images/page_ind_hud-3.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "abstract"><img src="./images/page_ind_abstract.gif"><CFELSEIF #CGI.PATH_INFO# CONTAINS "appraisal"><img src="./images/page_ind_appraisal.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "committment"><img src="./images/page_ind_title_committment.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>
			<td width=99 align=center valign=top ><img src="./images/clear.gif" width=99 height=2><br><CFIF #CGI.PATH_INFO# CONTAINS "off_prop_1"><img src="./images/page_ind_pay_off_1.gif"><CFELSEIF #CGI.PATH_INFO# CONTAINS "off_prop_2"><img src="./images/page_ind_pay_off_2.gif"></CFIF><br><img src="./images/clear.gif" width=98 height=1></td>				
			<td width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br></td>
			<td width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br></td>
			<td width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br></td>
	</tr>
</table>
<p>
</CFOUTPUT>