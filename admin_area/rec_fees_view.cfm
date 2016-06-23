		<CFQUERY datasource="#request.dsn#" NAME="read_records">
			SELECT *
			FROM Recording_Fees
			ORDER BY state ASC, county ASC		
		</CFQUERY>


		

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=552 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=700 align=center valign=top>	
<table width=551 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=701 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>
<table width=550 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<CFOUTPUT>
	<tr>
		<td width=700 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Manage First Title -- Recording Fees</B>
		</td>
	</tr>

	<tr>
		<td width=700 align=right valign=top bgcolor=white>
			<NOBR><FONT SIZE=2 color=black face=verdana>...to add a new record. ><cfif #url.al# eq 1> <a href="rec_fees_add.cfm?uid=#URL.uid#&al=#URL.al#"><img src="./images/button_add.gif" border=0 ALT="Add a new record to this database"></a><cfelse><img src="./images/button_add.gif" border=0 ALT="Add a new record to this database"></cfif></NOBR>
		</td>
	</tr>

</table>

		</td>
	</tr>

	<tr>
		<td width=701 align=center valign=top bgcolor=white>
			

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

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
		<td width=701 align=center valign=top bgcolor=white>
			

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=40 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State		
		</td>
		<td width=110 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County		
		</td>
		<td width=110 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City		
		</td>
		<td width=50 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Mort. Fee		
		</td>
		<td width=50 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Rel. Fee		
		</td>
		<td width=50 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Stamps		
		</td>
		<td width=50 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Stmp. Diff		
		</td>
		<td width=50 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Intang. Tax		
		</td>
		<td width=50 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Trans. Fee		
		</td>		
		<td width=75 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State Trans. Fee		
		</td>		
		<td width=75 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County Trans. Fee		
		</td>		
		<td width=75 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			City Trans. Fee		
		</td>		
		<td width=75 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			T.I. Premium Tax County	
		</td>		
		<td width=75 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			T.I. Premium Tax City
		</td>		
		<td width=50 align=center valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Deed Rec. Fee		
		</td>		
		<td width=25 align=center valign=top bgcolor=f1f1f1>&nbsp;
					
		</td>
		<td width=25 align=center valign=top bgcolor=f1f1f1>&nbsp;
						
		</td>
		
	</tr>	

</CFOUTPUT>

     <!------------------------------------------------------->

<CFOUTPUT QUERY="read_records">
	 
	<tr>
		<td width=40 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#State#		
		</td>
		<td width=110 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#County#		
		</td>
		<td width=110 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#City#		
		</td>
		<td width=50 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#Mort_rec_Fee#		
		</td>
		<td width=50 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#Release_rec_fee#		
		</td>
		<td width=50 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#Mort_Stamps#		
		</td>
		<td width=50 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#Stamps_diff#		
		</td>
		<td width=50 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#Intangible_Tax#		
		</td>
		<td width=50 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#Transfer_tax#		
		</td>		
		<td width=100 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>#state_Transfer_tax#<BR>#state_transfer_paidby#<cfif Trim(state_transfer_paidby) eq 'split'><BR>#state_transfer_buyer_split#=b/#state_transfer_seller_split#=s</cfif><cfif Len(state_transfer_exempt)><BR>exempt: #state_transfer_exempt#</cfif></td>		
		<td width=100 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>#county_Transfer_tax#<BR>#county_transfer_paidby#<cfif Trim(county_transfer_paidby) eq 'split'><BR>#county_transfer_buyer_split#=b/#county_transfer_seller_split#=s</cfif><cfif Len(county_transfer_exempt)><BR>exempt: #county_transfer_exempt#</cfif></td>		
		<td width=100 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>#city_Transfer_tax#<BR>#city_transfer_paidby#<cfif Trim(city_transfer_paidby) eq 'split'><BR>#city_transfer_buyer_split#=b/#city_transfer_seller_split#=s</cfif><cfif Len(city_transfer_exempt)><BR>exempt: #city_transfer_exempt#</cfif></td>		
		<td width=100 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>#ti_premium_tax_county#</td>		
		<td width=100 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>#ti_premium_tax_city#</td>		
		<td width=50 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			#DeedRecFees#		
		</td>		
		<td width=25 align=center valign=top bgcolor=f1f1f1>
			<cfif #url.al# eq 1><A HREF="rec_fees_modify.cfm?a_rec_id=#ID#&uid=#URL.uid#&al=#URL.al#"><img border=0 src="./images/button_m.gif" ALT="Modify this entry"></a>	<cfelse>	<img border=0 src="./images/button_m.gif" ALT="Modify this entry"></cfif>
		</td>
		<td width=25 align=center valign=top bgcolor=f1f1f1>
		<cfif #url.al# eq 1>	<A HREF="rec_fees_delete_view.cfm?a_rec_id=#ID#&uid=#URL.uid#&al=#URL.al#"><img border=0 src="./images/button_d.gif" ALT="Delete this entry"></a>	<cfelse>	<img border=0 src="./images/button_d.gif" ALT="Delete this entry"></cfif>
		</td>
		
	</tr>


</CFOUTPUT>
	
</table>
		
		</td>		
	</tr>










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

