
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="county" DEFAULT="">
<CFPARAM NAME="mort_rec_fee" DEFAULT="">
<CFPARAM NAME="release_rec_fee" DEFAULT="">
<CFPARAM NAME="mort_stamps" DEFAULT="">
<CFPARAM NAME="stamps_diff" DEFAULT="">
<CFPARAM NAME="intangible_tax" DEFAULT="">
<CFPARAM NAME="transfer_tax" DEFAULT="">




	<CFQUERY datasource="#request.dsn#">
		DELETE
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
		<font size=2 color=red face=arial>
		<B>The record has been successfully DELETED. </B>
		<br><font size=1 color=blue face=verdana> 
		</td>
	</tr>	
	
</table>
		
		</td>		
	</tr>
	

	</td>
</tr>
</table>

</BODY>
</HTML>

