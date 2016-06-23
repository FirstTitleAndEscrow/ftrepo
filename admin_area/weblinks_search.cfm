
<CFPARAM NAME="a_state"     DEFAULT="None">
<CFPARAM NAME="a_zip"       DEFAULT="None">
<CFPARAM NAME="a_county"    DEFAULT="None">
<CFPARAM NAME="a_city"      DEFAULT="None">
<CFPARAM NAME="a_area_code" DEFAULT="None">
<CFPARAM NAME="a_trigger"   DEFAULT="1">
<CFPARAM NAME="r_count"     DEFAULT="0">
<CFPARAM NAME="url.delete"     DEFAULT="0">
<cfparam name="linktype" default="">


<!---
<cfquery datasource="#request.dsn#" name="getuser">

select * from first_admin

			WHERE ID = #session.ft_user_id#
</cfquery>  
  <cfquery datasource="#request.dsn#" name="getcompany">

select * from users
where id = #URL.uid#
</cfquery>  --->

		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
		
			SELECT *
			FROM first_title_states_all
			ORDER BY st_abbrev ASC
		
		</CFQUERY>
			<!---	<CFSET a_state_abbrev = ArrayNew(1)>
				<CFSET a_count = "1">
					<CFOUTPUT QUERY="read_state_list">
						<CFIF #a_count# EQ "1">
							<CFSET a_state_abbrev[a_count] = "none">
						<CFELSE>
							<CFSET a_state_abbrev[a_count] = #st_abbrev#>
						</CFIF>
						<CFSET a_count = #a_count# + "1">
					</CFOUTPUT>	


 ===================================================== --->

	<CFIF #a_trigger# EQ "2">
	
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM abstractors_web
			WHERE weblinks is not null
			
			

			

			<CFIF #a_state# NEQ "None">
				AND st_abbrev LIKE '%#a_state#%'
			</CFIF>

			

			<CFIF #a_county# NEQ "None">
				AND ct_name LIKE '%#a_county#%'
			</CFIF>
			
			ORDER BY ct_name ASC
		
		</CFQUERY>
		
		<CFSET r_count = #read_report.recordcount#>

	
	</CFIF>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Weblinks Search Form</title>
</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>


<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width="98%" align=center valign=top>
		
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<!--- <tr>
		<td width="100%" align=center valign=top bgcolor=e1e1e1>
			<IMG SRC="./images/title_01.gif">
			
		</td>
	</tr> --->

	<tr>
		<td width="98%" align=center valign=top bgcolor=white>
		
	
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width="100%" align=left valign=top bgcolor=white>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Public records weblinks - Database Search</B></CENTER>
			</TD>
		</TR>
<cfoutput>
<FORM METHOD=POST ACTION="./weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=2">
</cfoutput>
	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>

					<tr>
					

						<td bgcolor=d3d3d3 width="40%" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Choose State
						</td>

						<td bgcolor=d3d3d3 width="30%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Enter County 
						</td>

					 
<td bgcolor=d3d3d3 width="30%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black"> 
						</td>
					</tr>


					<tr>
					
						<td bgcolor=d3d3d3 width="40%" align=right valign=top>
							<cfif #a_trigger# eq 2>
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
		
					<cfoutput><OPTION VALUE="#a_state#">#a_state#</OPTION></cfoutput>
					<CFOUTPUT QUERY="read_state_list"><OPTION VALUE="#st_abbrev#">#st_abbrev# </OPTION></CFOUTPUT>
								
								</select>
						
						<cfelse>
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
		
					<OPTION VALUE="none">none </OPTION>
					<CFOUTPUT QUERY="read_state_list"><OPTION VALUE="#st_abbrev#">#st_abbrev# </OPTION></CFOUTPUT>
								
								</select>
						
						</cfif>
						
						</td>

	<CFOUTPUT>	

						<td bgcolor=d3d3d3 width="30%" align=center valign=top>
							<cfif #a_trigger# eq 2>
							<INPUT TYPE=TEXT NAME="a_county" VALUE="#a_county#" MaxLength=50 Size=16
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
						<cfelse>
						
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
						
						</cfif>
				
				
				
					</td>

		

						<td bgcolor=d3d3d3 width="30%" align=left valign=top>
						<INPUT TYPE=image src="./images/button_search.gif" border=0> 	
				
				</td>		 
	</FORM>					
</tr>
 
					

			<CFIF #r_count# NEQ "0">
					<tr>
							

						<td bgcolor=white width=100 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<CFIF #a_state# NEQ "None">
								<B>#a_state#</B>
							</CFIF>
						</td>


							

						<td bgcolor=white width=90 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<CFIF #a_County# NEQ "None">
								<B>#a_County#</B>
							</CFIF>
						</td>

						<td bgcolor=white width=68 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">&nbsp; 
						</td>

					</tr>

					<tr bgcolor=white>
						<td bgcolor=white colspan=6 width="98%" align=center valign=top>
						
						<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
							<tr>
								<td width="98%" align=center valign=top bgcolor=white>
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


			
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<tr>
<cfoutput>
<td bgcolor=d3d3d3 width="98%" align=center valign=top>
Click this button  <cfif #url.uid# neq "93" AND #url.uid# neq "167"><a href="./weblinks_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=3"></cfif><img src="./images/button_add.gif" border=0 ALT="Add a new weblink to the database"></a> to add a new Web Link 
				</font> </b></td></cfoutput>


</tr>

	<tr>
		<td width="98%" align=left valign=top bgcolor=e1e1e1>
			<!--- <a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a> --->
		
	
<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<CFIF #r_count# NEQ "0">

<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">County
						</td>
						<td bgcolor=gray width="20%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Link Type
						</td>
<td bgcolor=gray><FONT FACE=verdana SIZE=1 color="black">&nbsp; </font></td>
					<td bgcolor=gray width="50%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Web links found
						</td>
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">User name
						</td>
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Password
						</td>
					<td bgcolor=gray width="21" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Modify
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	<CFIF #a_trigger# EQ "2">
			<CFOUTPUT QUERY="read_report">
					<tr>
						
<td bgcolor="#a_bgcolor#" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#ct_name#
						</td>
<td bgcolor="#a_bgcolor#" width="20%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#linktype#  <cfif linktype eq 'Title Searches with Images'>#read_report.images_date#</cfif>
						</td>
<td bgcolor="#a_bgcolor#" align="left" valign="top"><FONT FACE=verdana SIZE=1><a href="weblinks_delete.cfm?web_id=#web_id#&uid=#URL.uid#&al=#URL.al#&a_trigger=2&a_state=#a_state#"><FONT FACE=verdana SIZE=1 color="red">delete</font></a></font></td>
						<td bgcolor="#a_bgcolor#" width="50%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="#weblinks#" target="new"><FONT FACE=verdana SIZE=1 color="blue">#weblinks#</a>
						</td>
						<cfif #username# NEQ "">	
<td bgcolor="#a_bgcolor#" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#username#
						</td>
		<cfelse>
		<td bgcolor="#a_bgcolor#" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							
						</td>
		
		</cfif>
							<cfif #pass# NEQ "">	
<td bgcolor="#a_bgcolor#" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pass#
						</td>
		<cfelse>
		<td bgcolor="#a_bgcolor#" width="10%" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							
						</td>
		
		</cfif>
		<td width=21 align=left valign=top bgcolor=#a_bgcolor#>
			 <cfif #url.uid# neq "93" AND #url.uid# neq "167"><a href="web_links_modify.cfm?uid=#URL.uid#&al=#URL.al#&web_id=#web_id#&a_state=#a_state#&a_county=#a_county#"></cfif><FONT FACE=verdana SIZE=1 color="blue">modify<!--- <img border=0 src="./images/button_m.gif" ALT="Modify this entry"> ---></a>		
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


<!--- <a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a>	 --->		

</CFIF>

			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
<cfif url.delete eq 1>
<script language="javascript">
alert('The selected entry has been marked for deletion, and an email has been sent to the System Administrator');
</script>
</cfif>
</BODY>
</HTML>