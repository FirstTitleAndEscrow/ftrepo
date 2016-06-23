
	
	

		<CFSET a_info = #ListToArray(st_abbrev, "|")#>


		<CFQUERY datasource="#request.dsn#" NAME="read_records">
		
			SELECT *
			FROM #a_info[1]#
			ORDER BY a_to ASC
		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_record">
		
			SELECT a_from
			FROM #a_info[1]#
					
		</CFQUERY>
		<!--- 08/01/2005 customized view for states specified below - column "second mortgage" StateMissouri,StateOhio--->
		<cfset lst_st="StateMissouri,StateOhio,StateGeorgia">
	<cfloop list="#lst_st#" index="i">
		<cfset pos=find(i,#a_info[1]#, 1)><!--- a_table --->
		<cfif #pos# gt 0><cfbreak></cfif>
	</cfloop>
	
		<cfset list_states="StateArizona,StateIndiana,StateMichigan,StateWisconsin">
	<cfloop list="#list_states#" index="i">
		<cfset stateMatch=find(i,#a_info[1]#, 1)><!--- a_table --->
		<cfif #stateMatch# gt 0><cfbreak></cfif>
	</cfloop>
	<!--- state arizonastewart not included to arizona new rates--->
	<cfset ar_st="StateArizonaStewart">
	
	<cfset pos_st=find(ar_st,#a_info[1]#, 1)><!--- a_table --->	

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=552 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
<table width=551 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=551 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=550 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=550 align=left valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Manage First Title -- Insurance Fees</B>
		</td>
	</tr>

</table>

		</td>
	</tr>

	<tr>
		<td width=551 align=center valign=top bgcolor=white>
			<font size=3 color=blue face=verdana><b><cfif #a_info[2]# eq "ArizonaStewart-zone1"> #a_info[2]# - Apache,Cochise,Gila,Graham,Greenlee,Maricopa,Mohave,Pina,Pinal<cfelseif #a_info[2]# eq "ArizonaStewart-zone2">#a_info[2]# - Yuma,Lapaz<cfelseif #a_info[2]# eq "ArizonaStewart-zone3">#a_info[2]# - Coconino,Yavapai<cfelseif #a_info[2]# eq "ArizonaStewart-zone4">#a_info[2]# - Navajo<cfelseif #a_info[2]# eq "ArizonaStewart-zone5">#a_info[2]# - Santa Cruz
			<cfelseif #a_info[2]# eq "Arizona-zone1"> #a_info[2]# - Maricopa,Pina,Pinal<cfelseif #a_info[2]# eq "Arizona-zone2">#a_info[2]# - Coconino<cfelseif #a_info[2]# eq "Arizona-zone3">#a_info[2]# - Cochise<cfelseif #a_info[2]# eq "Arizona-zone4">#a_info[2]# - Yavapai<cfelseif #a_info[2]# eq "Arizona-zone5">#a_info[2]# - Mohave<cfelseif #a_info[2]# eq "Arizona">#a_info[2]# - Apache, Gila, Graham, Greenlee, La Paz, Navaho, Santa Cruz,Yuma  
			<cfelse>#a_info[2]#</cfif></b>
			<p>
			

<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=550 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		You can modify any of the items shown below. 
		<br><font size=1 color=blue face=verdana> 
		</td>
	</tr>	
	
</table>
		
		</td>		
	</tr>





	<tr>
		<td width=551 align=center valign=top bgcolor=white>
			

<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=100 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			From Value		
		</td>
		<td width=100 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			To Value		
		</td>
		<cfif pos neq "0">
		<td width=100 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			ReFinance/New Second Mortgage
			</td>
			<cfelse>	
			<td width=100 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Re-Finance
			</td>
		
		</cfif>
		<td width=100 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			New Home Sale		
		</td>
		<cfif stateMatch neq "0" and pos_st eq "0">
		<td width=100 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			New Second Mortgage
		</td>
		</cfif>		
		<td width=50 align=center valign=top bgcolor=f1f1f1>
			&nbsp;		
		</td>
		<td width=50 align=center valign=top bgcolor=f1f1f1>
			&nbsp;			
		</td>
		
	</tr>	

</CFOUTPUT>

     <!------------------------------------------------------->

<CFOUTPUT QUERY="read_records">
	 
	<tr>
		
		<td width=100 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			<cfif #read_record.recordcount# GT 0>
				#a_from# </cfif>
		</td>
		<td width=100 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#a_to#		
		</td>
		<td width=100 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#ReFinance#		
		</td>
		<td width=100 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#Sale#		
		</td>	
		
			<cfif stateMatch neq "0" and pos_st eq "0">
		<td width=100 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#Second_Mortgage#
		</td>
		</cfif>				
		<td width=50 align=center valign=top bgcolor=f1f1f1>
		<cfif #url.al# eq 1>	<a href="./ins_fees_modify.cfm?a_item_id=#ID#&a_table=#a_info[1]#&a_state_display=#a_info[2]#&uid=#URL.uid#&al=#URL.al#&pos=#pos#&pos_st=#pos_st#"><img border=0 src="./images/button_m.gif" ALT="Modify this entry"></a>		<cfelse> <img border=0 src="./images/button_m.gif" ALT="Modify this entry"></cfif>
		</td>
		<td width=50 align=center valign=top bgcolor=f1f1f1>
					
		</td>
		
	</tr>


</CFOUTPUT>
	
	
		<tr>
			<td width=550 colspan=6 align=right valign=top bgcolor=f1f1f1>
				<input type=submit value="select">	
				</td>		
	</tr>
	
</table>
		
		</td>		
	</tr>



</FORM>






</table>
		
	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			



	</td>
</tr>
</table>	

	</td>
</tr>
</table>

</BODY>
</HTML>

