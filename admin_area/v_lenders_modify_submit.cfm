
	
	



		<CFQUERY datasource="#request.dsn#" NAME="read_lenders">
		
			UPDATE Lenders 
			SET tss_id = '#tss_id#',
			company = '#company#', 
			phone = '#phone#', 
			fax = '#fax#', 
			addr1 = '#addr1#', 
			addr2 = '#addr2#',
			a_note_1 = '#a_note_1#',
			city = '#city#', 
			state = '#state#', 
			zip_code = '#zip#', 
			email = '#email#',
			a_comment = '#a_comment#'
			WHERE lender_id = #lId#
		
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_lenders">
		
			SELECT *
			FROM Lenders 
			WHERE lender_id = #lId#
		
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
			<font size=2 color=green face=arial><B>Modify Lenders </B>
		</td>
	</tr>
</CFOUTPUT>	

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			<FONT SIZE=2 COLOR=BLUE FACE=VERDANA>

			

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>

		

<CFOUTPUT>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=red face=arial>
			<B>TSS ID - </B> 
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.tss_id#</B>
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Company Name - 
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.company#</B>
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Address - 
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.addr1#</B>
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Address - 
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.addr2#</B>
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Note - 
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.a_note_1#</B>
		</td>
	</tr>
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			City - 
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.city#</B>
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			State - 
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.state#</B>
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Zip Code - 
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.zip_code#</B>
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Phone - 
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.phone#</B>
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Fax - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.fax#</B>					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Email - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.email#</B>
		
		</td>
	</tr>
	<tr>		
		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Comments
		
		</td>
	</tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.a_comment#</B>
		
		</td>
	</tr>

	</tr>

		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<p>
			&nbsp;
			<p>
		
		</td>
	</tr>

</CFOUTPUT>
<!--- ====================================================== --->
<!--- ====================================================== --->
<!--- ====================================================== --->
<!--- ====================================================== --->

</table>
		
		</td>		

		

	</tr>
</table>
			
	

	</td>
</tr>
</table>	

	</td>
</tr>
</table>


</BODY>
</HTML>

