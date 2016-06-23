<table width=465 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Payoff Upload</B></CENTER>
			</TD>
		</TR>
</table>


Please click the "Browse" button and select the file to upload, then click "Upload File" to complete the Payoff Upload.<br>
<br>


<cfoutput><FORM action="./ctc_upload_submit.cfm" ENCTYPE="multipart/form-data" method="post">
<input type="hidden" name="payoff_id" value="#url.payoff_id#">
<input type="hidden" name="payoff_type" value="#url.type#">
<input type="hidden" name="payoff_num" value="#url.pnum#">
<input type="file" name="file_upload">
<input type="submit" value="Upload File">
</FORM></cfoutput>