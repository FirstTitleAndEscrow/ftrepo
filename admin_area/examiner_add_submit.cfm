
<CFPARAM NAME="company" DEFAULT="">
<CFPARAM NAME="fname" DEFAULT="">
<CFPARAM NAME="lname" DEFAULT="">
<CFPARAM NAME="phone" DEFAULT="">
<CFPARAM NAME="fax" DEFAULT="">
<CFPARAM NAME="addr1" DEFAULT="">
<CFPARAM NAME="addr2" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="zip_code" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="spref" DEFAULT="">
<CFPARAM NAME="tss_id" DEFAULT="">	
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
	






		<CFQUERY datasource="#request.dsn#" >
		
			INSERT INTO Examiner (tss_id, company, fname, lname, phone, fax, addr1, addr2, city, state, zip_code, email, a_cost, pref_for_send, a_note_1, a_comments)
			VALUES('#tss_id#', '#company#', '#fname#',  '#lname#', '#phone#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip#', '#email#', '#a_cost#',  '#spref#',  '#a_note_1#',  '#a_comments#')
		
		</CFQUERY>







<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
		
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>The Examiner was added</B>
		</td>
	</tr>
</CFOUTPUT>	

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>
<CFOUTPUT>
	<tr>		
		
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>	
			<img src="./images/clear.gif" height=10 width=85>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			TSS Code -  
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#tss_id#</B>
		</td>
	</tr>
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Company Name - 
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#company#</b>
					
		
		</td>
	</tr>
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			First Name - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#fname#</b>
					
		
		</td>
	</tr>	

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Last Name - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#lname#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Phone - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#phone#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Fax - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#fax#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Email - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#email#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Address - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#addr1#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Address - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#addr2#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Note - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#a_note_1#</b>
					
		
		</td>
	</tr>
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			City - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#city#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			State - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#state#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Zip Code - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#zip#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Charge for Svc - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#a_cost#</B>
					
		
		</td>
	</tr>

	<tr>		
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Comments :
	
		</td>
	</tr>

	<tr>
		
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
		<b>#a_comments#</b>
		
		</td>
	</tr>

	<tr>		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Preferences for recieving Examiner Notice
	
		</td>
	</tr>
	
	<tr>
		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
		<b>#spref#</b>

		
		</td>
	</tr>

	
</table>
	
		</td>	

	</tr>
</table>

</table>	

	</td>
</tr>
</table>

</CFOUTPUT>
</BODY>
</HTML>




