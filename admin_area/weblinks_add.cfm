
<!--- <CFPARAM NAME="a_state"     DEFAULT="None"> --->
<CFPARAM NAME="a_zip"       DEFAULT="None">
<CFPARAM NAME="a_county"    DEFAULT="None">
<CFPARAM NAME="a_city"      DEFAULT="None">
<CFPARAM NAME="a_area_code" DEFAULT="None">
<CFPARAM NAME="a_trigger"   DEFAULT="1">
<CFPARAM NAME="weblink"   DEFAULT="1">
<CFPARAM NAME="r_count"     DEFAULT="0">

<CFPARAM NAME="images_date"     DEFAULT="">
<CFPARAM NAME="linktype_other"     DEFAULT="">
<CFPARAM NAME="notes"     DEFAULT="">

<cfif isDefined("session.ft_user_id") and (session.ft_user_id eq 64 or session.ft_user_id eq 297)>
<cfset url.al = 1>
</cfif>


<script language="javascript">
function quick_check() {

document.frm.images_date.style.display = 'none';
document.frm.images_date.value = '';
document.frm.linktype_other.style.display = 'none';
document.frm.linktype_other.value = '';

if (document.frm.linktype.value == "Title Searches with Images") {
document.frm.images_date.style.display = 'block';
document.frm.images_date.value = 'Enter Date Here';
document.frm.linktype_other.style.display = 'none';
document.frm.linktype_other.value = '';
} else {
document.frm.images_date.style.display = 'none';
}
if (document.frm.linktype.value == "Other") {
document.frm.linktype_other.style.display = 'block';
document.frm.linktype_other.value = 'Enter Info Here';
document.frm.images_date.style.display = 'none';
document.frm.images_date.value = '';
} else {
document.frm.linktype_other.style.display = 'none';
}





}


</script>
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
				<CENTER><B>Add Public records weblink </B></CENTER>
			</TD>
		</TR>
<CFIF #A_TRIGGER# EQ "3">
<cfoutput>
<FORM METHOD=POST ACTION="./weblinks_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=2">
</cfoutput>
<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>

					<tr>

<td bgcolor=d3d3d3 width="98%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Choose State
						</td>
</tr>
<tr>
	<td bgcolor=d3d3d3 width="98%" align=center valign=top>
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
				<!--- <CFSET a_count = "1">
					<CFLOOP FROM="1" TO="#ArrayLen(a_state_abbrev)#" INDEX="DDD">
						<CFOUTPUT>
						<CFIF #DDD# EQ "1">
							<option value="#a_state_abbrev[DDD]#" SELECTED>#a_state_abbrev[DDD]#</option>
						<CFELSE>
							<option value="#a_state_abbrev[DDD]#">#a_state_abbrev[DDD]#</option>
						</CFIF>
						</CFOUTPUT>
					</CFLOOP>	 
					<OPTION VALUE="none">none </OPTION>--->
					<CFOUTPUT QUERY="read_state_list"><OPTION VALUE="#st_abbrev#">#st_abbrev# </OPTION></CFOUTPUT>
								
								</select>
						
							<INPUT TYPE=image src="./images/button_proceed.gif" border=0> 	
						</td>
</tr>
</form>
</CFIF>
<cfif #a_trigger# EQ "2">
<CFOUTPUT>
<FORM name="frm"  METHOD=POST ACTION="./weblinks_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=4&A_state=#FORM.a_state#">
</CFOUTPUT>


	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>

				
				<tr> <td bgcolor=elelel colspan = 4 width="100%" align=center valign=top>
						<b>	<FONT FACE=verdana SIZE=2 color="blue">
							 State chosen &nbsp;&nbsp;&nbsp;&nbsp;</b>
					
					
							<b><FONT FACE=verdana SIZE=2 color="blue">
							<cfoutput> &nbsp;&nbsp;&nbsp;&nbsp;#FORM.a_state#</b></cfoutput>
						</td> 
					</tr>
					<tr>
				
						<td bgcolor=d3d3d3 width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Choose County 
						</td>

					 
<td bgcolor=d3d3d3 width="50%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black"> Enter WebLink
						
						</td>
					<td bgcolor=d3d3d3 width="20%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black"> Enter Username (if any)
						
						</td>
					<td bgcolor=d3d3d3 width="20%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black"> Enter password (if any)
						
						</td>
					</tr>


					<tr>
					
					<!---	<td bgcolor=d3d3d3 width="20%" align=right valign=top>
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
					<OPTION VALUE="none">none </OPTION>
					<CFOUTPUT QUERY="read_state_list"><OPTION VALUE="#st_abbrev#">#st_abbrev# </OPTION></CFOUTPUT>
								
								</select>
						</td>--->
						<cfoutput>
 <CFQUERY datasource="#request.dsn#" NAME="read_county_list">
		
			SELECT DISTINCT county
			FROM zip_info
			where state = '#form.a_state#'
			ORDER BY county ASC
		
		</CFQUERY>
</cfoutput>

						<td bgcolor=d3d3d3 width="10%" align=left valign=top>
							<Select NAME="A_county" MULTIPLE
									size="6" 
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
						<CFOUTPUT QUERY="read_county_list"><OPTION VALUE="#county#">#county# </OPTION></CFOUTPUT>
								
								</select>
					</td>

		

						<td bgcolor=d3d3d3 width="50%" align=center valign=top>
						
						<INPUT TYPE=TEXT NAME="weblink" VALUE="" MaxLength=200 Size=70
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
					
						<FONT FACE=verdana SIZE=1 color="black">Link Type 
						<Select NAME="linktype" 
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
									onchange="quick_check();">
<OPTION VALUE="">Select</OPTION>
<OPTION VALUE="Title Searches with Images">Title Searches with Images </OPTION>
<OPTION VALUE="Title Searches - Index Only">Title Searches - Index Only </OPTION>
<OPTION VALUE="Plats">Plats</OPTION>
<OPTION VALUE="Taxes">Taxes</OPTION>
<OPTION VALUE="Civil Court">Civil Court</OPTION>
<OPTION VALUE="District Court">District Court</OPTION>
<OPTION VALUE="Superior Court">Superior Court</OPTION>
<OPTION VALUE="Other">Other</OPTION>
								
								</select> 
<INPUT TYPE=TEXT NAME="images_date" id="images_date"  VALUE="" MaxLength=50 Size=20
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
									clear: none; display:none;" >
<INPUT TYPE=TEXT NAME="linktype_other" id="linktype_other"  VALUE="" MaxLength=50 Size=20
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
									clear: none; display:none;" > 	 					
						</td>
						<td bgcolor=d3d3d3 width="20%" align=left valign=top>
						
						<INPUT TYPE=TEXT NAME="username" VALUE="" MaxLength=50 Size=20
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
<br><FONT FACE=verdana SIZE=1 color="black">Notes:<br>
<textarea cols="20" rows="3" name="notes" style="font-size: 9; 
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
									clear: none;"></textarea>
						
						</td>
						<td bgcolor=d3d3d3 width="20%" align=left valign=top>
						
						<INPUT TYPE=TEXT NAME="password" VALUE="" MaxLength=50 Size=20
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
				<tr>
				<td bgcolor=d3d3d3 width="98%" colspan = 4 align=center valign=top>		
						<INPUT TYPE=image src="./images/button_add.gif" border=0> 	
				
				</td>		 
	</tr>
	</FORM>					
</tr>
 
					

	</CFIF>		

							








				</table>


			
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->


	<tr>
		<td width="100%" align=left valign=top bgcolor=e1e1e1>
			<!--- <a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a> --->
		
	
<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

<CFIF #a_trigger# EQ "4">
<CFSET zip_id_2 = #ListToArray(a_county, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
<CFQUERY datasource="#request.dsn#" NAME="check_report">
		
			SELECT *
			FROM abstractors_web
			WHERE weblinks = '#weblink#' AND st_abbrev = '#a_state#' AND ct_name = '#cty_name_1[TTT]#'

</cfquery>
</cfloop>

<!--- <CFSET a_list_1 = ArrayNew(1)>
		<CFSET c_count = "1">
		
		
			
			<CFSET a_list_1[c_count] = #ct_name#>
			<cfset a_link = #weblinks#>
			<cfset a_states =#st_abbrev#>
			<CFSET c_count = #c_count# + "1">		
		  --->
<cfif #check_report.recordcount# GT "0">		

<CFOUTPUT QUERY="check_report">
<CFQUERY datasource="#request.dsn#" NAME="select_report">
		
			SELECT *
			FROM abstractors_web
			WHERE weblinks = '#check_report.weblinks#' AND st_abbrev = '#check_report.st_abbrev#' AND ct_name = '#check_report.ct_name#'

</cfquery>

<cfif #select_report.recordcount# GT "0">

<!--- and (#weblink# eq #a_link#) and (#a_state# eq #a_states#) and (#cty_name_1[DDD]# eq #check_report.ct_name#)> 

<CFLOOP FROM="1" TO="#ArrayLen(a_list_1)#" INDEX="CCC">

<cfif (a_county #a_list_1[CCC]#) and (#weblink# eq #a_link#) and (#a_state# eq #a_states#)> --->

<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>A d d i n g &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t  </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>
<tr> <td bgcolor=elelel colspan = 3 width="100%" align=center valign=top>
						<b>	<FONT FACE=verdana SIZE=2 color="blue">
							 The weblink you are trying to add exists in the following county(ies)<br>

				 			  </b>
				
					#ct_name#
							
						</td> 
					</tr>
</TABLE></TD></TR></TABLE>
<cfelse>


<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="DDD"> 


<cfif linktype_other neq ''>
<cfset linktype = #linktype_other#>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="update_report">
		
			insert into abstractors_web
			(ct_name, st_abbrev, weblinks, username, pass, linktype, notes, images_date, user_id) values ('#cty_name_1[DDD]#', '#a_state#', '#weblink#', '#username#', '#password#', '#linktype#', '#notes#', '#images_date#', #session.ft_user_id#)
			
			</CFQUERY>


	 
	 <CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM abstractors_web
			WHERE weblinks = '#weblink#' AND ct_name = '#cty_name_1[DDD]#' AND st_abbrev = '#a_state#'

</cfquery> </CFLOOP>		
<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>A d d i n g &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t  </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>
<tr> <td bgcolor=elelel colspan = 3 width="100%" align=center valign=top>
						<b>	<FONT FACE=verdana SIZE=2 color="blue">
							 State chosen: </b>
					
					
							<b><FONT FACE=verdana SIZE=2 color="blue">
							 &nbsp;&nbsp;&nbsp;&nbsp;#a_state#</b>
						<b>	<FONT FACE=verdana SIZE=2 color="blue">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; County(ies) chosen: </b>
					<b><FONT FACE=verdana SIZE=2 color="blue">
							 &nbsp;&nbsp;&nbsp;&nbsp;#a_county#</b>
						
						</td> 
					</tr>
				
					<tr>
						
					<td bgcolor=gray width="80%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Web link added
						</td>
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">User name added
						</td>
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Password added
						</td>
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">User
						</td>
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Notes
						</td>
					</tr>

<!--- ======================================================================== --->

	
			
					<tr>
						


						<td bgcolor="elelel" width="78%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.weblinks#
						</td>
						
<td bgcolor="elelel" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.username#
						</td>
		
		
		
							
<td bgcolor="elelel" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.pass#
						</td>


<td bgcolor="elelel" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
<cfif read_report.user_id gt 0>
<CFQUERY datasource="#request.dsn#" NAME="get_user">
select * from first_admin where ID = #read_report.user_id#
</CFQUERY>
#get_user.fname# #get_user.lname#
</cfif>							
						</td>

<td bgcolor="elelel" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.notes#
						</td>
	
	
		
	
		
					</tr>
						
			
			
			
		</cfif>
		
		
		

</cfoutput> <cfelse> <cfoutput>
	
	<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="DDD"> 

<cfif linktype_other neq ''>
<cfset linktype = #linktype_other#>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="update_report">
		
			insert into abstractors_web
			(ct_name, st_abbrev, weblinks, username, pass, linktype, notes, images_date, user_id) values ('#cty_name_1[DDD]#', '#a_state#', '#weblink#', '#username#', '#password#', '#linktype#', '#notes#', '#images_date#', #session.ft_user_id#)
			
			</CFQUERY>


	 
	 <CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM abstractors_web
			WHERE weblinks = '#weblink#' AND ct_name = '#cty_name_1[DDD]#' AND st_abbrev = '#a_state#'

</cfquery> </CFLOOP>		
<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>A d d i n g &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t  </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>
<tr> <td bgcolor=elelel colspan = 3 width="100%" align=center valign=top>
						<b>	<FONT FACE=verdana SIZE=2 color="blue">
							 State chosen: </b>
					
					
							<b><FONT FACE=verdana SIZE=2 color="blue">
							 &nbsp;&nbsp;&nbsp;&nbsp;#a_state#</b>
						<b>	<FONT FACE=verdana SIZE=2 color="blue">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; County(ies) chosen: </b>
					<b><FONT FACE=verdana SIZE=2 color="blue">
							 &nbsp;&nbsp;&nbsp;&nbsp;#a_county#</b>
						
						</td> 
					</tr>
				
					<tr>
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Link Type
						</td>
					<td bgcolor=gray width="70%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Web link added
						</td>
						
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">User name added
						</td>
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Password added
						</td>
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">User
						</td>
						<td bgcolor=gray width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Notes
						</td>
					</tr>

<!--- ======================================================================== --->

	
			
					<tr>
						
	<td bgcolor="elelel" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#linktype# <cfif linktype eq 'Title Searches with Images'>#read_report.images_date#</cfif>
						</td>

						<td bgcolor="elelel" width="70%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.weblinks#
						</td>
					
<td bgcolor="elelel" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.username#
						</td>
		
		
		
							
<td bgcolor="elelel" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.pass#
						</td>
	
<td bgcolor="elelel" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
<cfif read_report.user_id gt 0>
<CFQUERY datasource="#request.dsn#" NAME="get_user">
select * from first_admin where ID = #read_report.user_id#
</CFQUERY>
#get_user.fname# #get_user.lname#
</cfif>								
						</td>
	
<td bgcolor="elelel" width="10%" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.notes#
						</td>
	
	</cfoutput>
		
	</CFIF>
		
					</tr>	
	<tr><cfoutput>
					<td width="100%" colspan=3 align=left valign=top bgcolor=d3d3d3>
						<A href="./weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#"><img src="./images/button_return.gif" border=0></A>
					</td>
	
				</tr></cfoutput>
	</CFIF>
			
			
			</table>

	



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>