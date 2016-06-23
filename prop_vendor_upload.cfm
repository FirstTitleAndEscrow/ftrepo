
<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM Property
WHERE prop_id = #URL.rec_id#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_prop_1">
		SELECT *
		FROM Pay_Off_Lender_1_Prop
		WHERE Prop_ID = #rec_ID#
	</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_payoff_info_prop_2">
		SELECT *
		FROM Pay_Off_Lender_2_Prop
		WHERE Prop_ID = #rec_ID#
	</CFQUERY>

<Cfif #a_trigger# EQ "1">

<cfquery name="get_afile" datasource="#request.dsn#">
    select *
    from doc_abstract_prop
    where prop_id = #url.rec_id#
</cfquery>

<cfquery name="get_file1" datasource="#request.dsn#">
SELECT abstract_upload1
FROM  doc_abstract_prop
WHERE prop_id = #get.prop_ID#
</CFQUERY>
<cfquery name="get_updates" datasource="#request.dsn#">
SELECT *
FROM  Abstractor_Uploads
WHERE order_id = #get.prop_ID# order by upload_date desc
</CFQUERY>
<cfquery name="get_file3" datasource="#request.dsn#">
SELECT abstract_upload3
FROM  doc_abstract_prop
WHERE prop_id = #get.prop_ID#
</CFQUERY>
<cfquery name="get_invoice" datasource="#request.dsn#">
SELECT abstractor_invoice
FROM  doc_abstract_prop
WHERE prop_id = #get.prop_ID#
</CFQUERY>


<!--- <cfquery name="get_file4" datasource="#request.dsn#">
SELECT payoff1_upload, a_assigned_by
FROM  Pay_Off_Lender_1_Title
WHERE title_id = #get.title_ID#
</CFQUERY>

<cfquery name="get_file5" datasource="#request.dsn#">
SELECT payoff2_upload, a_assigned_by
FROM  Pay_Off_Lender_2_Title
WHERE title_id = #get.title_ID#
</CFQUERY>

<cfquery name="get_file6" datasource="#request.dsn#">
SELECT payoff1_upload, a_assigned_by
FROM  Pay_Off_Lender_1_Prop
WHERE prop_id = #get.title_ID#
</CFQUERY>

<cfquery name="get_file7" datasource="#request.dsn#">
SELECT payoff2_upload, a_assigned_by
FROM  Pay_Off_Lender_2_Prop
WHERE prop_id = #get.title_ID#
</CFQUERY>  --->


<cfelse>

<cfquery name="get_file" datasource="#request.dsn#">
SELECT closer_upload
FROM doc_closer_prop
WHERE propid = #get.prop_ID#
</CFQUERY>


</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER><br><br><br><br><br><br><br><br><br>
<table width=490 cellpadding=1 cellspacing=1 border=1 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3>

<P><FONT FACE=ARIAL SIZE=2>

	<cfif #a_trigger# EQ "1">

	<cfoutput query="get_file1">

<FORM ACTION="./upload1_prop_abstract.cfm?rec_id=#rec_id#&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #abstract_upload1# EQ "">
	Click here to upload file-1 for Abstractor
	<input type="hidden" name="prop_id" value="#get.prop_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#abstract_upload1#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file1.abstract_upload1#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font></TD></tr></NOBR>

</CFIF>		  </FORM>

	</cfoutput>

</table>


<table width=490 cellpadding=1 cellspacing=1 border=1 bgcolor=d3d3d3>

<FORM ACTION="./upload2_prop_abstract.cfm?rec_id=<cfoutput>#rec_id#&company_id=#company_ID#</cfoutput>" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>


	Click here to upload Updates to this file:
	<CFIF get_updates.recordcount>
<br>
Currently uploaded updates:<br>
<cfoutput query="get_updates">
<A HREF="#fileSys.FindFilePath('#get_updates.filename#', 'url')#" target="new">#get_updates.filename#</a><br>
</cfoutput>
<br>
</CFIF>
	<input type="hidden" name="prop_id" value="<cfoutput>#get.prop_id#</cfoutput>">
	<input type="submit" value="Upload File"></td>

		</tr>
	 </FORM>
</table>

<table width=490 cellpadding=1 cellspacing=1 border=1 bgcolor=d3d3d3>


	<cfoutput query="get_file3">

<FORM ACTION="./upload3_prop_abstract.cfm?rec_id=#rec_id#&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #abstract_upload3# EQ "">
	Click here to upload file-3 for Abstractor
	<input type="hidden" name="prop_id" value="#get.prop_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#abstract_upload3#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file3.abstract_upload3#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font></TD></tr></NOBR>
</CFIF>		  </FORM>

	</cfoutput>

</table>


<table width=490 cellpadding=1 cellspacing=1 border=1 bgcolor=d3d3d3>
	<cfoutput query="get_invoice">

<FORM ACTION="./upload_invoice_prop_abstract.cfm?rec_id=#rec_id#&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #abstractor_invoice# EQ "">
	Click here to upload an Invoice from the Abstractor for this order
	<input type="hidden" name="prop_id" value="#get.prop_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded invoice (#abstractor_invoice#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_invoice.abstractor_invoice#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Abstractor Invoice for this order"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font></TD></tr></NOBR>
</CFIF>		  </FORM>

	</cfoutput>

</table>
<!--- <cfoutput query="get_file4">
<cfif get_file4.recordcount and get_file4.a_assigned_by NEQ ''>

<FORM ACTION="./upload1_payoff.cfm?rec_id=#rec_id#&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #payoff1_upload# EQ "">
	Click here to upload Payoff 1 for Abstractor
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#payoff1_upload#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file4.payoff1_upload#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font></TD></tr></NOBR>
</CFIF>		  </FORM>
	</cfif>
	</cfoutput>


<cfoutput query="get_file5">
<cfif get_file5.recordcount and get_file5.a_assigned_by NEQ ''>

<FORM ACTION="./upload2_payoff.cfm?rec_id=#rec_id#&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #payoff2_upload# EQ "">
	Click here to upload Payoff 2 for Abstractor
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#payoff2_upload#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file5.payoff2_upload#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font></TD></tr></NOBR>
</CFIF>		  </FORM>
	</cfif>
	</cfoutput>


<cfoutput query="get_file6">
<cfif get_file6.recordcount and get_file6.a_assigned_by NEQ ''>

<FORM ACTION="./upload1_payoff.cfm?rec_id=#rec_id#&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #payoff1_upload# EQ "">
	Click here to upload Payoff 1 for Abstractor
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#payoff1_upload#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file6.payoff1_upload#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font></TD></tr></NOBR>
</CFIF>		  </FORM>
	</cfif>
	</cfoutput>


<cfoutput query="get_file7">
<cfif get_file7.recordcount and get_file7.a_assigned_by NEQ ''>

<FORM ACTION="./upload2_payoff.cfm?rec_id=#rec_id#&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #payoff2_upload# EQ "">
	Click here to upload Payoff 2 for Abstractor
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#payoff2_upload#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file7.payoff2_upload#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font></TD></tr></NOBR>
</CFIF>		  </FORM>
	</cfif>
	</cfoutput>  --->



	<cfelse>

	<cfoutput query="get_file">

<FORM ACTION="./upload_prop_closer.cfm?rec_id=#rec_id#&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #closer_upload# EQ "">
	Click here to upload file for Closer
	<input type="hidden" name="prop_id" value="#get.prop_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#closer_upload#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file.closer_upload#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font></TD></tr></NOBR>

</CFIF>		  </FORM>

	</cfoutput>
</cfif>
<P></FONT>


	<td></tr></table>






<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>
