
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="county" DEFAULT="">
<CFPARAM NAME="mort_rec_fee" DEFAULT="">
<CFPARAM NAME="release_rec_fee" DEFAULT="">
<CFPARAM NAME="mort_stamps" DEFAULT="">
<CFPARAM NAME="stamps_diff" DEFAULT="">
<CFPARAM NAME="intangible_tax" DEFAULT="">
<CFPARAM NAME="transfer_tax" DEFAULT="">




	<CFQUERY datasource="#request.dsn#">
		UPDATE recording_fees
		SET state = '#state#',
		county  = '#county#',
		 mort_rec_fee = '#mort_rec_fee#',
		 release_rec_fee  = '#release_rec_fee#',
		 mort_stamps   = '#mort_stamps#',
		 stamps_diff  = '#stamps_diff#',
		 intangible_tax  = '#intangible_tax#',
		 transfer_tax  = '#transfer_tax#'
		 
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
		<td width=550 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		The record has been successfully modified. 
		<br><font size=1 color=blue face=verdana> 
		</td>
	</tr>	
</table>
		</td>		
	</tr>
</CFOUTPUT>
<CFOUTPUT>
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
	
</table>
		
		</td>		
	</tr>
</table>
	</td>
</tr>
</table>

</BODY>
</HTML>

