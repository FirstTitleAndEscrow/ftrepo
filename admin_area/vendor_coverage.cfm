<CFPARAM NAME="vendor"     DEFAULT="abstractors">
<CFPARAM NAME="a_state"       DEFAULT="">
<CFPARAM NAME="a_trigger"       DEFAULT="">


		
		<CFQUERY datasource="#request.dsn#" NAME="read_county_list">

				SELECT DISTINCT COUNTY
				FROM zip_info
				ORDER BY county ASC

			</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
		
			SELECT *
			FROM first_title_states_all
			ORDER BY st_abbrev ASC
		
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_county_list">

				SELECT DISTINCT COUNTY
				FROM zip_info
				ORDER BY county ASC

			</CFQUERY>
			


	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. Vendor Area</title>
</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>


<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width="98%" align=center valign=top>
		
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>


	<tr>
		<td width="98%" align=center valign=top bgcolor=white>
		
	
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width="100%" align=left valign=top bgcolor=white>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Vendor Coverage </B></CENTER>
			</TD>
		</TR>

<cfoutput>
<FORM METHOD=POST ACTION="./vendor_coverage_area.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1">
</cfoutput>
<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>

					<tr>

<td bgcolor=d3d3d3 width="100%" align=left valign=top>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b><FONT FACE=verdana SIZE=1 color="black">
							Select Vendor</b>
						
<cfif #a_trigger# eq "1">

	
							<Select NAME="vendor" 
									size="1" 
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
									clear: none; 
									float: none;" 
									rows="3" 
									cols="45" 
									>
					<cfoutput><OPTION VALUE="#vendor#" selected>#vendor#</OPTION></cfoutput>
					<OPTION VALUE="Abstractors">Abstractors</OPTION>
					<OPTION VALUE="Closers">Closers</OPTION>	
					<OPTION VALUE="Appraisers">Appraisers</OPTION>	
								</select>
					
						
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b><FONT FACE=verdana SIZE=1 color="black">
							Choose State</b>
						
							<Select NAME="A_state"
									size="1" 
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
									clear: none; 
									float: none;" 
									rows="3" 
									cols="45" 
									>
				<cfoutput><OPTION VALUE="#A_state#" selected>#A_state#</OPTION></cfoutput>
					<CFOUTPUT QUERY="read_state_list"><OPTION VALUE="#st_abbrev#">#st_abbrev# </OPTION></CFOUTPUT>
								
								</select>
						
					
					<cfelse>
										<Select NAME="vendor" 
									size="1" 
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
									clear: none; 
									float: none;" 
									rows="3" 
									cols="45" 
									>
				
					<OPTION VALUE="Abstractors">Abstractors</OPTION>
					<OPTION VALUE="Closers">Closers</OPTION>	
					<OPTION VALUE="Appraisers">Appraisers</OPTION>	
								</select>
					
						
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b><FONT FACE=verdana SIZE=1 color="black">
							Choose State</b>
						
							<Select NAME="A_state"
									size="1" 
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
									clear: none; 
									float: none;" 
									rows="3" 
									cols="45" 
									>
				
					<CFOUTPUT QUERY="read_state_list"><OPTION VALUE="#st_abbrev#">#st_abbrev# </OPTION></CFOUTPUT>
								
								</select>
					</cfif>		
						</td>
</tr>
<tr>

<td bgcolor=d3d3d3 width="100%" align=center valign=top><br>
<INPUT TYPE=image src="./images/button_proceed.gif" border=0> 	
</td></tr>
</form>

</table>



<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width="100%" align=left valign=top bgcolor=white>
				<FONT FACE=ARIAL SIZE=2 color="black"><br><br><br><br>
				<CENTER><B>Vendor Performance </B></CENTER>
			</TD>
		</TR>

<cfoutput>
<FORM METHOD=POST ACTION="./vendor_performance_report.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1">
</cfoutput>
<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>

					<tr>

<td bgcolor=d3d3d3 width="50%" align=right valign=top>
								<b><FONT FACE=verdana SIZE=1 color="black">
							Select Vendor</b>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<Select NAME="vendor" 
									size="1" 
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
									clear: none; 
									float: none;" 
									rows="3" 
									cols="45" 
									>
					<OPTION VALUE="Abstractors">Abstractors</OPTION>
					<OPTION VALUE="Closers">Closers</OPTION>	
					<!---<OPTION VALUE="Appraisers">Appraisers</OPTION>	--->
								</select>
			
						</td>
						
						<td bgcolor=d3d3d3 width="50%" align=left valign=top>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=image src="./images/button_proceed.gif" border=0> 	
</td>
</tr>
<tr>

</tr>
</form>

</table>

<cfif #a_trigger# eq "1">
<cfif #vendor# eq "abstractors">
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>A b s t r a c t o r s&nbsp;&nbsp;&nbsp;&nbsp;S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<table width="98%" cellpadding=1 cellspacing=1 border=0>

<cfoutput>
		 <CFIF IsDefined("a_state")>
	<CFSET a_state = #a_state#>
</CFIF>
<CFIF IsDefined("vendor")>
	<CFSET vendor = #vendor#>
</CFIF>
</cfoutput>
			




			
	

			<tr>
						
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							ID
						</td>
						
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							County
						</td>			

						
						<td bgcolor=gray width=220 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
						</td>
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Rank
						</td>
						<td bgcolor=gray width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Price
						</td>
						<td bgcolor=gray width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Phone
						</td>
			<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Email/Fax
						</td>
			
			<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Modify
						</td>
			</tr>
			
			
			<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
		<!---   <CFQUERY datasource="#request.dsn#" NAME="read_state_cty_list">

				SELECT DISTINCT state, county
				FROM zip_info
				WHERE state = '#form.a_state#'
				ORDER BY county ASC

			</CFQUERY>	 --->
		
	
<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM abstractors_county a, abstractors b
			WHERE b.abstractor_id = a.abstractor_id and a.st_abbrev = '#A_state#'
ORDER BY ct_name ASC
</cfquery> 	

			

			
	<cfoutput QUERY="read_report">					

					
				
					
					<cfif #company# neq "First Title In-House">
					<tr>
					
						<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="vendor_view_abstractor.cfm?abstractor_id=#abstractor_ID#&uid=#URL.uid#&al=#URL.al#&a_state=#a_state#&vendor=#vendor#">43204#abstractor_id#</a>
						</td>
				
						<td bgcolor="#a_bgcolor#" width=70 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#cT_NAME#  
						</td>			
						
						<td bgcolor="#a_bgcolor#" width=220 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>			
<td bgcolor="#a_bgcolor#" width=10 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#rank#
						</td>			
<td bgcolor="#a_bgcolor#" width=80 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#a_cost#
						</td>	
						<td bgcolor="#a_bgcolor#" width=80 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#phone#
						</td>	
						<td bgcolor="#a_bgcolor#" width=100 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<cfif #email# eq "">								
						#fax#
						<cfelse>
				<a href="mailto:#email#">#email#</a>		
						</cfif>
				
						</td>	
				<td bgcolor="#a_bgcolor#" width=10 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<a href="abstractors_modify_view.cfm?abstractor_id=#abstractor_ID#&uid=#URL.uid#&al=#URL.al#&a_state=#a_state#&vendor=#vendor#"><img border=0 src="./images/button_m.gif" ALT="Modify this entry"></a>	
					
						</td>	
					
					</tr>
				<cfelse>
					<tr>
					
						<td bgcolor="green" width=10 align=right valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							<a href="vendor_view_abstractor.cfm?abstractor_id=#abstractor_ID#&uid=#URL.uid#&al=#URL.al#&a_state=#a_state#&vendor=#vendor#">43204#abstractor_id#</a>
						</b>
						</td>
				
						<td bgcolor="green" width=70 align=right valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							#cT_NAME#  </b>
						</td>			
						
						<td bgcolor="green" width=220 align=left valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
							#company#</b>
						</td>			
<td bgcolor="green" width=10 align=left valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white"></b>
							#rank#
						</td>			
<td bgcolor="green" width=80 align=left valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white"></b>
							#a_cost#
						</td>	
						<td bgcolor="green" width=80 align=left valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white"></b>
							#phone#
						</td>	
						<td bgcolor="green" width=100 align=left valign=top>
							<b><FONT FACE=verdana SIZE=1 color="white">
						<cfif #email# eq "">								
						#fax#
						<cfelse>
				<a href="mailto:#email#">#email#</a>	</b>	
						</cfif>
						
						
						
						</td>	
					
						<td bgcolor="#a_bgcolor#" width=10 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<a href="abstractors_modify_view.cfm?abstractor_id=#abstractor_ID#&uid=#URL.uid#&al=#URL.al#&a_state=#a_state#&vendor=#vendor#"><img border=0 src="./images/button_m.gif" ALT="Modify this entry"></a>	
					
						</td>	
					</tr>
				
				</cfif>
							
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
			</CFOUTPUT>
	
				</table>




<cfelseif #vendors# eq "closer">
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>C l o s e r s&nbsp;&nbsp;&nbsp;&nbsp;S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<table width="98%" cellpadding=1 cellspacing=1 border=0>

<cfoutput>
		 <CFIF IsDefined("a_state")>
	<CFSET a_state = #a_state#>
</CFIF>
<CFIF IsDefined("vendor")>
	<CFSET vendor = #vendor#>
</CFIF>
</cfoutput>
			
<CFQUERY datasource="#request.dsn#" NAME="read_state_cty_list">

				SELECT DISTINCT COUNTY, state
				FROM zip_info
				WHERE state = '#a_state#'
				ORDER BY county ASC

			</CFQUERY>		




			
			
			
			<tr>
					
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							ID
						</td>
						
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							County
						</td>			

						
						<td bgcolor=gray width=220 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
						</td>
				 <td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Rank
						</td> 
						<td bgcolor=gray width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Price
						</td>
							<td bgcolor=gray width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Phone
						</td>
			<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Email/Fax
						</td>
			<!---  <td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Modify
						</td>  --->
			</tr>
			
			
			<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

			
			<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM closer_county a, closer b
			WHERE b.closer_id = a.closer_id and a.st_abbrev = '#A_state#' and b.status is null
			order by ct_name ASC
</cfquery>		
			<CFOUTPUT QUERY="read_report">
					
			
					
					<tr>
					
						<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="vendor_view_closer.cfm?closer_id=#closer_ID#&uid=#URL.uid#&al=#URL.al#&a_state=#a_state#&vendor=#vendor#">24043#closer_id#</a>
						
						</td>
				
						<td bgcolor="#a_bgcolor#" width=70 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#cT_NAME#  
						</td>			
						
						<td bgcolor="#a_bgcolor#" width=220 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>			
 <td bgcolor="#a_bgcolor#" width=10 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#rank#
						</td>		
<td bgcolor="#a_bgcolor#" width=80 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#a_cost#
						</td>	
						<td bgcolor="#a_bgcolor#" width=80 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#phone#
						</td>	
						<td bgcolor="#a_bgcolor#" width=100 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<cfif #email# eq "">								
						#fax#
						<cfelse>
				<a href="mailto:#email#">#email#</a>		
						</cfif>
						
						
						
						</td>	

		<!---  <td bgcolor="#a_bgcolor#" width=10 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="closer_modify_view.cfm?closer_id=#closer_ID#&uid=#URL.uid#&al=#URL.al#&a_state=#a_state#&vendor=#vendor#"><img border=0 src="./images/button_m.gif" ALT="Modify this entry"></a>	
						</td> --->
					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
			</CFOUTPUT>
	
				</table>

<cfelse>

<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>C l o s e r s&nbsp;&nbsp;&nbsp;&nbsp;S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<table width="98%" cellpadding=1 cellspacing=1 border=0>

<cfoutput>
		 <CFIF IsDefined("a_state")>
	<CFSET a_state = #a_state#>
</CFIF>
<CFIF IsDefined("vendor")>
	<CFSET vendor = #vendor#>
</CFIF>
</cfoutput>
			
<CFQUERY datasource="#request.dsn#" NAME="read_state_cty_list">

				SELECT DISTINCT COUNTY, state
				FROM zip_info
				WHERE state = '#a_state#'
				ORDER BY county ASC

			</CFQUERY>		




			
			
			
			<tr>
					
						<td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							ID
						</td>
						
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							County
						</td>			

						
						<td bgcolor=gray width=220 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
						</td>
				 <td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Rank
						</td> 
						<td bgcolor=gray width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Price
						</td>
							<td bgcolor=gray width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Phone
						</td>
			<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Email/Fax
						</td>
			<!---  <td bgcolor=gray width=10 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Modify
						</td>  --->
			</tr>
			
			
			<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

			
			<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM APPRAISERS_county a, appraisers b
			WHERE b.appraiser_id = a.appraiser_id and a.st_abbrev = '#A_state#'
order by ct_name ASC
</cfquery>		
			<CFOUTPUT QUERY="read_report">
					
			
					
					<tr>
					
						<td bgcolor="#a_bgcolor#" width=10 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="vendor_view_appraiser.cfm?appraiser_id=#appraiser_ID#&uid=#URL.uid#&al=#URL.al#&a_state=#a_state#&vendor=#vendor#">24043#appraiser_id#</a>
						
						</td>
				
						<td bgcolor="#a_bgcolor#" width=70 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#cT_NAME#  
						</td>			
						
						<td bgcolor="#a_bgcolor#" width=220 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#company#
						</td>			
 <td bgcolor="#a_bgcolor#" width=10 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#rank#
						</td>		
<td bgcolor="#a_bgcolor#" width=80 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#a_cost#
						</td>	
						<td bgcolor="#a_bgcolor#" width=80 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#phone#
						</td>	
						<td bgcolor="#a_bgcolor#" width=100 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<cfif #email# eq "">								
						#fax#
						<cfelse>
				<a href="mailto:#email#">#email#</a>		
						</cfif>
						
						
						
						</td>	

		<!---  <td bgcolor="#a_bgcolor#" width=10 align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="closer_modify_view.cfm?closer_id=#closer_ID#&uid=#URL.uid#&al=#URL.al#&a_state=#a_state#&vendor=#vendor#"><img border=0 src="./images/button_m.gif" ALT="Modify this entry"></a>	
						</td> --->
					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
			</CFOUTPUT>
	
				</table>

</cfif>
			
			
			
</cfif> <!--- a_trigger --->
	



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	