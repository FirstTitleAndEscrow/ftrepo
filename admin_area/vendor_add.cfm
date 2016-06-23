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
			<font size=2 color=green face=arial><B> Select Vendor type to add </B>
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
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/vendor_add_submit.cfm?uid=#URL.uid#&al=#URL.al#">
</CFOUTPUT>





		<tr><td width="50%"  align=right valign=top bgcolor=e6e6e6>	Abstractor vendor - </td><td width="50%" colspan= align=left valign=top bgcolor=e6e6e6><input type=radio name="vd" VALUE="1" checked></td></tr>
			<tr><td width="50%"  align=right valign=top bgcolor=e6e6e6>	Appraiser vendor -  </td><td width="50%" align=left valign=top bgcolor=e6e6e6>	<input type=radio name="vd" VALUE="2"></td></tr>
		<tr><td width="50%"  align=right valign=top bgcolor=e6e6e6>	Closer vendor -  </td><td width="50%"  align=left valign=top bgcolor=e6e6e6>	<input type=radio name="vd" VALUE="3"></td></tr>
			<tr><td width="50%"  align=right valign=top bgcolor=e6e6e6>	Tax vendor -  </td><td width="50%"  align=left valign=top bgcolor=e6e6e6>	<input type=radio name="vd" VALUE="4"></td></tr>
     <tr>	<td width="50%" align=right valign=top bgcolor=e6e6e6>	ICL vendor -  </td><td width="50%"  align=left valign=top bgcolor=e6e6e6>	<input type=radio name="vd" VALUE="5"> </td></tr>
	 <tr>	<td width="50%" align=right valign=top bgcolor=e6e6e6>	Payoff vendor -  </td><td width="50%"  align=left valign=top bgcolor=e6e6e6>	<input type=radio name="vd" VALUE="6"> </td></tr>
	 <tr>	<td width="50%" align=right valign=top bgcolor=e6e6e6>	Deed Prep vendor -  </td><td width="50%"  align=left valign=top bgcolor=e6e6e6>	<input type=radio name="vd" VALUE="7"> </td></tr>



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
