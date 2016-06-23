

	<CFQUERY datasource="#request.dsn#" NAME="read_records">
		SELECT *
		FROM recording_fees
		where id = #a_rec_id#
	
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
		<td width=500 align=center valign=top>
<table width=551 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=551 align=center valign=top bgcolor=e2e2e2>
<table width=550 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<CFOUTPUT>
	<tr>
		<td width=550 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Manage First Title -- Recording Fees</B>
		</td>
	</tr>
</table>
		</td>
	</tr>
	<tr>
		<td width=551 align=center valign=top bgcolor=white>
			

<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=550 align=center valign=top bgcolor=f1f1f1>
		<font size=2 color=red face=arial><b>
		Examine the record below to ensure that it is the correct one to be deleted.
		<br><font size=1 color=blue face=verdana> </b>
		</td>
	</tr>	
	
</table>
		
		</td>		
	</tr>



<FORM METHOD=POST ACTION="./rec_fees_delete_submit.cfm?a_rec_id=#a_rec_id#&uid=#URL.uid#&al=#URL.al#">

</CFOUTPUT>




<CFOUTPUT QUERY="read_records">
	<tr>
		<td width=551 align=center valign=top bgcolor=white>
			

<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			State		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>			
			<B>#state#	</B>
			</td>		
	</tr>
		
	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			County		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#county#</B>	
			</td>		
	</tr>		

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Mortgage Recording Fee		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Mort_rec_Fee#	</B>
			</td>		
	</tr>
	
	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Release  Fee		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Release_rec_fee#</B>
			</td>		
	</tr>	

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Mortgage Stamps		
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Mort_Stamps#</B>
			</td>		
	</tr>
	
	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Stamp Difference 	
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Stamps_diff#</B>	
			</td>		
	</tr>	


	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Intangibles Tax	
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Intangible_Tax#</B>
			</td>		
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Transfer Tax	
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=blue face=verdana>
			<B>#Transfer_tax#</B>
			</td>		
	</tr>


</CFOUTPUT>


	<tr>
		<td width=550 colspan=2 align=right valign=top bgcolor=f1f1f1>
			<input type=submit value="delete">	
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

