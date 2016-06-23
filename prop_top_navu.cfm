		

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

		<CFQUERY datasource="#request.dsn#" NAME="read_prop_order">
		
			SELECT *
			FROM Property
			WHERE Prop_ID = #rec_ID#

		
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


	

<CFOUTPUT>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=black>
	<tr>
			<td width=99 align=left valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=99 height=2><br><NOBR><a href="./prop_tax_cert_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_tax_cert.gif" border=0 ALT="Modify the Tax Certificate for this order"></a><a href="./prop_tax_cert_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target="Prop_tax_cert" onClick="window.open('','Prop_tax_cert','width=580,height=530,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View the Tax Certificate"></a>&nbsp;<CFIF #read_for_indicator.User_ID_finished# GT "" AND #read_for_indicator.User_ID_started# GT ""><img src="./images/ind_finished.gif" ALT="Tax Cert Has Been COMPLETED"><CFELSEIF #read_for_indicator.User_ID_started# GT "" AND #read_for_indicator.User_ID_finished# EQ ""><img src="./images/ind_started.gif" ALT="Tax Cert Has Been SUBMITTED"><CFELSE><img src="./images/ind_open.gif" ALT="Tax Cert Has NOT been Submitted"></CFIF></NOBR><br><NOBR><a href="./prop_report_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_report.gif" border=0 ALT="Modify this Property Report"></a><a href="./prop_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_view.gif" border=0 ALT="View the Property Report for this order"></a>&nbsp;<img src="./images/ind_started.gif" ALT="Property Report Has Been SUBMITTED"></NOBR>				
			</td>
			<td width=99 align=center valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=99 height=2><br><NOBR><a href="./prop_modify_hud_pg1.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_hud-1.gif" border=0 ALT="Modify Page (1) of the HUD report for this Property Order"></a><a href="./prop_view_hud_pg1.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=800,height=640,status=0,resizable=1,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View Page (1) of the HUD report for this Property Order"></a>&nbsp;<img src="./images/ind_started.gif" ALT="HUD Form Page 1 Has Been Started"></NOBR><br><NOBR><a href="./prop_modify_hud_pg2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_hud-2.gif" border=0 ALT="Modify Page (2) of the HUD report for this Property Order"></a><a href="./prop_view_hud_pg2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="prop_hud_pg2" onClick="window.open('','prop_hud_pg2','width=800,height=640,status=0,resizable=1,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View Page (2) of the HUD report for this Property Order"></a>&nbsp;<img src="./images/ind_started.gif" ALT="HUD Form Page 2 Has Been Started"></NOBR><br><NOBR><a href="./prop_modify_hud_pg3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_hud-3.gif" border=0 ALT="Modify Page (3) of the HUD report for this Property Order"></a><a href="./prop_view_hud_pg3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="prop_hud_pg3" onClick="window.open('','prop_hud_pg3','width=800,height=640,status=0,resizable=1,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View Page (3) of the HUD report for this Property Order"></a>&nbsp;<img src="./images/ind_started.gif" ALT="HUD Form Page 3 Has Been Started"></NOBR>
			</td>

	<CFIF #read_prop_order.do_appraisal# EQ "Yes">
			<td width=99 align=center valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=99 height=2><br><NOBR><a href="./prop_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_abstract.gif" border=0 ALT="Manage the Assignment and Reciept of Abstract for this order"></a><a href="./prop_abstract_doc_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="prop_abstract" onClick="window.open('','prop_abstract','width=550,height=600,status=0,resizable=1,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View the Abstract for this order, so that it can be Printed"></a>&nbsp;<CFIF #read_abstract.a_assigned_by# GT "" AND #read_abstract.a_recieved_by# GT ""><img src="./images/ind_finished.gif" ALT="The Abstract for this Order Has Been RECEIVED"><CFELSEIF #read_abstract.a_assigned_by# GT "" AND #read_abstract.a_recieved_by# EQ ""><img src="./images/ind_started.gif" ALT="The Abstract for this Order Has Been ASSIGNED"><CFELSE><img src="./images/ind_open.gif" ALT="The Abstract for this Order Has NOT been Submitted"></CFIF></NOBR><br><NOBR><a href="./prop_appraisal_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_appraisal.gif" border=0 ALT="Manage the Assignment and Reciept of the Appraisal for this order"></a><a href="./prop_appraisal_doc_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="prop_appraisal" onClick="window.open('','prop_appraisal','width=550,height=600,status=0,resizable=1,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View the Appraisal for this order, so that it can be Printed"></a>&nbsp;<CFIF #read_appraisal.a_assigned_by# GT "" AND #read_appraisal.a_recieved_by# GT ""><img src="./images/ind_finished.gif" ALT="The Appraisal for this Order Has Been RECEIVED"><CFELSEIF #read_appraisal.a_assigned_by# GT "" AND #read_appraisal.a_recieved_by# EQ ""><img src="./images/ind_started.gif" ALT="The Appraisal for this Order Has Been ASSIGNED"><CFELSE><img src="./images/ind_open.gif" ALT="The Appraisal for this Order Has NOT been Submitted"></CFIF></NOBR>
			</td>
<CFELSE>
			<td width=99 align=center valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=99 height=2><br><NOBR><a href="./prop_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_abstract.gif" border=0 ALT="Manage the Assignment and Reciept of Abstract for this order"></a><a href="./prop_abstract_doc_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="prop_abstract" onClick="window.open('','prop_abstract','width=550,height=600,status=0,resizable=1,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View the Abstract for this order, so that it can be Printed"></a>&nbsp;<CFIF #read_abstract.a_assigned_by# GT "" AND #read_abstract.a_recieved_by# GT ""><img src="./images/ind_finished.gif" ALT="The Abstract for this Order Has Been RECEIVED"><CFELSEIF #read_abstract.a_assigned_by# GT "" AND #read_abstract.a_recieved_by# EQ ""><img src="./images/ind_started.gif" ALT="The Abstract for this Order Has Been ASSIGNED"><CFELSE><img src="./images/ind_open.gif" ALT="The Abstract for this Order Has NOT been Submitted"></CFIF></NOBR><br><NOBR><img src="./images/button_appraisal_gray.gif" border=0 ALT="Appraisal was NOT REQUESTED">&nbsp;<img src="./images/button_view_gray.gif" border=0 ALT="Appraisal was NOT REQUESTED">&nbsp;<img src="./images/ind_open_gray.gif" ALT="Appraisal was NOT REQUESTED"></NOBR>
			</td>
</CFIF>
			<td width=99 align=center valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=99 height=2><br><NOBR><a href="./Prop_Committment.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_title_ins.gif" border=0 ALT="Manage the Title Insurance Commitment for this order"></a><a href="./prop_Committments_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="Prop_Committment_view" onClick="window.open('','Prop_Committment_view','width=790,height=600,status=0,resizable=1,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View the Title Insurance Commitment for this order, so that it can be Printed"></a>&nbsp;<CFIF #read_current_Commitment_Clauses.a_assigned_by# GT "" AND #read_current_Commitment_Clauses.a_recieved_by# GT ""><img src="./images/ind_finished.gif" ALT="The Title Insurance Commitment for this Order Has Been RECEIVED"><CFELSEIF #read_current_Commitment_Clauses.a_assigned_by# GT "" AND #read_current_Commitment_Clauses.a_recieved_by# EQ ""><img src="./images/ind_started.gif" ALT="The Title Insurance Commitment for this Order Has Been ASSIGNED"><CFELSE><img src="./images/ind_open.gif" ALT="The Title Insurance Commitment for this Order Has NOT been Submitted"></CFIF></NOBR>
			</td>
	<CFIF (#read_prop_order.polender1# EQ "") AND (#read_prop_order.polender2# GT "")>
			<td width=99 align=center valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=99 height=2><br><NOBR><img src="./images/button_pay_off_1_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/button_view_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/ind_open_gray.gif" ALT="There is no Payoff for this order"></NOBR><br><NOBR><a href="./pay_off_prop_2_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_2.gif" border=0 ALT="Manage the Payoff for Lender 2, for this order"></a><a href="./pay_off_prop_2_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="pay_off_2" onClick="window.open('','pay_off_2','width=550,height=600,status=0,resizable=1,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View the Pay Off Info for Lender 2, for this order, so that it can be Printed"></a>&nbsp;<CFIF #read_payoff_info_2.a_assigned_by# GT "" AND #read_payoff_info_2.a_recieved_by# GT ""><img src="./images/ind_finished.gif" ALT="The Pay Off Info for Lender 2, for this Order Has Been RECEIVED"><CFELSEIF #read_payoff_info_2.a_assigned_by# GT "" AND #read_payoff_info_2.a_recieved_by# EQ ""><img src="./images/ind_started.gif" ALT="The Payoff Info for Lender 2, for this Order Has Been Submitted"><CFELSE><img src="./images/ind_open.gif" ALT="The Payoff Info for Lender 2, Has NOT been Submitted"></CFIF></NOBR>
			</td>				
<CFELSEIF (#read_prop_order.polender1# GT "") AND (#read_prop_order.polender2# EQ "")>
			<td width=99 align=center valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=99 height=2><br><NOBR><a href="./pay_off_prop_1_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_1.gif" border=0 ALT="Manage the Payoff for Lender 1, for this order"></a><a href="./pay_off_prop_1_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="pay_off_1" onClick="window.open('','pay_off_1','width=550,height=600,status=0,resizable=1,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View the Pay Off Info for Lender 1, for this order, so that it can be Printed"></a>&nbsp;<CFIF #read_payoff_info_1.a_assigned_by# GT "" AND #read_payoff_info_1.a_recieved_by# GT ""><img src="./images/ind_finished.gif" ALT="The Pay Off Info for Lender 1, for this Order Has Been RECEIVED"><CFELSEIF #read_payoff_info_1.a_assigned_by# GT "" AND #read_payoff_info_1.a_recieved_by# EQ ""><img src="./images/ind_started.gif" ALT="The Payoff Info for Lender 1, for this Order Has Been Submitted"><CFELSE><img src="./images/ind_open.gif" ALT="The Payoff Info for Lender 1, Has NOT been Submitted"></CFIF></NOBR><br><NOBR><img src="./images/button_pay_off_2_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/button_view_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/ind_open_gray.gif" ALT="There is no Payoff for this order"></NOBR>
			</td>
<CFELSEIF (#read_prop_order.polender1# GT "") AND (#read_prop_order.polender2# GT "")>
			<td width=99 align=center valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=99 height=2><br><NOBR><a href="./pay_off_prop_1_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_1.gif" border=0 ALT="Manage the Payoff for Lender 1, for this order"></a><a href="./pay_off_prop_1_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="pay_off_1" onClick="window.open('','pay_off_1','width=550,height=600,status=0,resizable=1,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View the Pay Off Info for Lender 1, for this order, so that it can be Printed"></a>&nbsp;<CFIF #read_payoff_info_1.a_assigned_by# GT "" AND #read_payoff_info_1.a_recieved_by# GT ""><img src="./images/ind_finished.gif" ALT="The Pay Off Info for Lender 1, for this Order Has Been RECEIVED"><CFELSEIF #read_payoff_info_1.a_assigned_by# GT "" AND #read_payoff_info_1.a_recieved_by# EQ ""><img src="./images/ind_started.gif" ALT="The Payoff Info for Lender 1, for this Order Has Been Submitted"><CFELSE><img src="./images/ind_open.gif" ALT="The Payoff Info for Lender 1, Has NOT been Submitted"></CFIF></NOBR><br><NOBR><a href="./pay_off_prop_2_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"><img src="./images/button_pay_off_2.gif" border=0 ALT="Manage the Payoff for Lender 2, for this order"></a><a href="./pay_off_prop_2_view_only.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"  target="pay_off_2" onClick="window.open('','pay_off_2','width=550,height=600,status=0,resizable=1,scrollbars=1')"><img src="./images/button_view.gif" border=0 ALT="View the Pay Off Info for Lender 2, for this order, so that it can be Printed"></a>&nbsp;<CFIF #read_payoff_info_2.a_assigned_by# GT "" AND #read_payoff_info_2.a_recieved_by# GT ""><img src="./images/ind_finished.gif" ALT="The Pay Off Info for Lender 2, for this Order Has Been RECEIVED"><CFELSEIF #read_payoff_info_2.a_assigned_by# GT "" AND #read_payoff_info_2.a_recieved_by# EQ ""><img src="./images/ind_started.gif" ALT="The Payoff Info for Lender 2, for this Order Has Been Submitted"><CFELSE><img src="./images/ind_open.gif" ALT="The Payoff Info for Lender 2, Has NOT been Submitted"></CFIF></NOBR>
			</td>
	<CFELSE>
			<td width=99 align=center valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=99 height=2><br><NOBR><img src="./images/button_pay_off_1_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/button_view_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/ind_open_gray.gif" ALT="There is no Payoff for this order"></NOBR><br><NOBR><img src="./images/button_pay_off_2_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/button_view_gray.gif" border=0 ALT="There is no Payoff for this order">&nbsp;<img src="./images/ind_open_gray.gif" ALT="There is no Payoff for this order"></NOBR>
			</td>
	</CFIF>
			<td width=98 align=center valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=98 height=2><br></td>
			<td width=98 align=center valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=98 height=2><br></td>
			<td width=98 align=center valign=top bgcolor=d3d3d3><img src="./images/clear.gif" width=98 height=2><br></td>
		</tr>
	</table>
</CFOUTPUT>
<!--- ======================================================================= --->
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