<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_services">
			SELECT *
			FROM vendor_service
</CFQUERY>

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
			<font size=2 color=green face=arial><B> Select Vendor type to modify </B>
		</td>
	</tr>
</CFOUTPUT>	

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			

<table width=498 cellpadding=3 cellspacing=1 border=0 bgcolor=white>

<CFOUTPUT>
	<FORM METHOD=POST ACTION="vendor_modify2.cfm?uid=#URL.uid#&al=#URL.al#">
</CFOUTPUT>




		
		<tr><td width="50%"  align=right valign=top bgcolor=e6e6e6>	ALL VENDORS - </td><td width="50%" colspan= align=left valign=top bgcolor=e6e6e6><input type=radio name="vd" VALUE="All" checked></td></tr>
		<cfoutput query="read_services">
			<tr><td width="50%"  align=right valign=top bgcolor=e6e6e6>	#vendor_service_name# - </td><td width="50%" colspan= align=left valign=top bgcolor=e6e6e6><input type=radio name="vd" VALUE="#vendor_service_dbname#" checked></td></tr>
		</cfoutput>
		
		



	<tr>		
		
		<td width=367 colspan=4 align=right valign=top bgcolor=e6e6e6>	
			<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
					
		
		</td>
	</tr>


	
</table>

</FORM>		
		</td>		

		

	</tr>
</table>
		
	



</BODY>
</HTML>