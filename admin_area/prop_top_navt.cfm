
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<CFOUTPUT><tr>
	
			
			<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./prop_abstractor_admin_add_deed.cfm?uid=#url.uid#&al=#url.al#&rec_id=#url.rec_id#&a_trigger=1"><img src="./images/button_add_data.gif" border=0 ALT="Click this button to add Raw Data for this order"></a> 
			</td>
			<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./prop_abstractor_admin_add_mortgage.cfm?uid=#url.uid#&al=#url.al#&rec_id=#url.rec_id#&a_trigger=1"><img src="./images/button_add_mortgage.gif" border=0 ALT="Click this button to add data to the Title Insurance Commitment form  for this order"></a> 
			</td>	
			<td width=90 align=center valign=top bgcolor=d3d3d3>
				<a href="./prop_abstractor_admin_add_lien.cfm?uid=#url.uid#&al=#url.al#&rec_id=#url.rec_id#&a_trigger=1"><img src="./images/button_add_lien.gif" border=0 ALT="Click this button to upload file for this order"></a> 
			</td>		
			
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
			</CFOUTPUT>	

			</td>
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br>			
			</td>
			<td bgcolor=e1e1e1 width=98 align=center valign=top ><img src="./images/clear.gif" width=98 height=2><br>				
			</td>
		</tr>
	</table>
	<p>
		
	
	
