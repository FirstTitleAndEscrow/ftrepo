
<CFPARAM NAME="a_state"     DEFAULT="None">
<CFPARAM NAME="a_zip"       DEFAULT="None">
<CFPARAM NAME="a_county"    DEFAULT="None">
<CFPARAM NAME="a_city"      DEFAULT="None">
<CFPARAM NAME="a_area_code" DEFAULT="None">
<CFPARAM NAME="a_trigger"   DEFAULT="1">
<CFPARAM NAME="r_count"     DEFAULT="0">

		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
		
			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC
		
		</CFQUERY>
				<CFSET a_state_abbrev = ArrayNew(1)>
				<CFSET a_count = "1">
					<CFOUTPUT QUERY="read_state_list">
						<CFIF #a_count# EQ "1">
							<CFSET a_state_abbrev[a_count] = "none">
						<CFELSE>
							<CFSET a_state_abbrev[a_count] = #st_abbrev#>
						</CFIF>
						<CFSET a_count = #a_count# + "1">
					</CFOUTPUT>	


<!--- ===================================================== --->

	<CFIF #a_trigger# EQ "2">
	
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM zip_info
			WHERE 0=0
			
			<CFIF #a_state# NEQ "None">
				AND state = '#a_state#'
			</CFIF>

			<CFIF #a_city# NEQ "None">
				AND city LIKE '%#a_city#%'
			</CFIF>

			<CFIF #a_county# NEQ "None">
				AND county LIKE '%#a_county#%'
			</CFIF>

			<CFIF #a_area_code# NEQ "None">
				AND area_code LIKE '%#a_area_code#%'
			</CFIF>

			<CFIF #a_zip# NEQ "None">
				AND zip LIKE '%#a_zip#%'
			</CFIF>
			
			ORDER BY state ASC, county ASC, city ASC, zip ASC, area_code ASC
		
		</CFQUERY>
		
		<CFSET r_count = #read_report.recordcount#>

	</CFIF>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Zip Search Form</title>
</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
		
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=499 align=center valign=top bgcolor=e1e1e1>
			<IMG SRC="./images/title_01.gif">
			
		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=e1e1e1>
		
	
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=498 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Zip Code Info - Database Search</B></CENTER>
			</TD>
		</TR>
<FORM METHOD=POST ACTION="./zip_code_search.cfm?a_trigger=2">

	<tr>
			<td width=498 align=left valign=top bgcolor=d3d3d3>
				<table width=498 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=d3d3d3 width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Area Code
						</td>

						<td bgcolor=d3d3d3 width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							City
						</td>			

						<td bgcolor=d3d3d3 width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							County
						</td>


						<td bgcolor=d3d3d3 width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>			

						<td bgcolor=d3d3d3 width=90 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Zip 
						</td>

						<td bgcolor=d3d3d3 width=68 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">&nbsp; 
						</td>

					</tr>

<!--- ======================================================================== --->
<CFOUTPUT>
					<tr>
						<td bgcolor=d3d3d3 width=80 align=center valign=top>
							<INPUT TYPE=TEXT NAME="a_area_code" VALUE="none" MaxLength=4 Size=10
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
						</td>

						<td bgcolor=d3d3d3 width=110 align=center valign=top>
							<INPUT TYPE=TEXT NAME="a_city" VALUE="none" MaxLength=60 Size=17
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
						</td>			

						<td bgcolor=d3d3d3 width=100 align=center valign=top>
							<INPUT TYPE=TEXT NAME="a_county" VALUE="none" MaxLength=50 Size=16
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
						</td>

</CFOUTPUT>
						<td bgcolor=d3d3d3 width=60 align=center valign=top>
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
				<CFSET a_count = "1">
					<CFLOOP FROM="1" TO="#ArrayLen(a_state_abbrev)#" INDEX="DDD">
						<CFOUTPUT>
						<CFIF #DDD# EQ "1">
							<option value="#a_state_abbrev[DDD]#" SELECTED>#a_state_abbrev[DDD]#</option>
						<CFELSE>
							<option value="#a_state_abbrev[DDD]#">#a_state_abbrev[DDD]#</option>
						</CFIF>
						</CFOUTPUT>
					</CFLOOP>	
								</select>
						</td>			
<CFOUTPUT>			

						<td bgcolor=d3d3d3 width=90 align=center valign=top>
							<INPUT TYPE=TEXT NAME="a_zip" VALUE="none" MaxLength=5 Size=13
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
						</td>
						<td bgcolor=d3d3d3 width=90 align=center valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>   
						</td>

					</tr>

			<CFIF #r_count# NEQ "0">
					<tr>
						<td bgcolor=white width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<CFIF #a_area_code# NEQ "None">
								<B>#a_area_code#</B>
							</CFIF>
						</td>

						<td bgcolor=white width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<CFIF #a_City# NEQ "None">
								<B>#a_City#</B>
							</CFIF>
						</td>			

						<td bgcolor=white width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<CFIF #a_County# NEQ "None">
								<B>#a_County#</B>
							</CFIF>
						</td>


						<td bgcolor=white width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<CFIF #a_state# NEQ "None">
								<B>#a_state#</B>
							</CFIF>
						</td>			

						<td bgcolor=white width=90 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<CFIF #a_zip# NEQ "None">
								<B>#a_zip#</B>
							</CFIF> 
						</td>

						<td bgcolor=white width=68 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">&nbsp; 
						</td>

					</tr>

					<tr bgcolor=white>
						<td bgcolor=white colspan=6 width=498 align=right valign=top>
						
						<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
							<tr>
								<td width=498 align=right valign=top bgcolor=white>
									<FONT FACE=verdana SIZE=1 color="blue">
									<NOBR>Listings from Search = &nbsp;<B>#r_count#</B></NOBR>
								</td>
							</tr>
						</TABLE>
					</td>

					</tr>
			</CFIF>
</CFOUTPUT>






				</table>
</FORM>

			
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->


	<tr>
		<td width=499 align=left valign=top bgcolor=e1e1e1>
			<a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a>
		
	
<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<CFIF #r_count# NEQ "0">

<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=498 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width=498 align=left valign=top bgcolor=d3d3d3>
				<table width=498 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Area Code
						</td>

						<td bgcolor=gray width=150 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							City
						</td>			

						<td bgcolor=gray width=170 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							County
						</td>

						<td bgcolor=gray width=38 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>			
			

						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Zip 
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	<CFIF #a_trigger# EQ "2">
			<CFOUTPUT QUERY="read_report">
					<tr>
						<td bgcolor="#a_bgcolor#" width=80 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#area_code#
						</td>

						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#city#  
						</td>			

						<td bgcolor="#a_bgcolor#" width=170 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#county#   
						</td>


						<td bgcolor="#a_bgcolor#" width=38 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#state#
						</td>			

						<td bgcolor="#a_bgcolor#" width=50 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#zip#
						</td>
					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
			</CFOUTPUT>
	</CFIF>
				</table>


<a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a>			

</CFIF>

			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	