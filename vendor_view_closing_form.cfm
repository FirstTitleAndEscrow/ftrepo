
<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>



<cfquery name="get_file" datasource="#request.dsn#">
SELECT *
FROM doc_closer_title
WHERE title_id = #get.title_ID#
</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER><br><br><br><br>
<table width=490 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=490 align=center valign=top bgcolor=d3d3d3>

<P><FONT FACE=ARIAL SIZE=2>
	<cfif #get_file.final_HUD# neq "">

	<cfoutput query="get_file">


<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is a Final HUD file uploaded (#final_HUD#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file.final_HUD#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font><br></TD></tr></NOBR>
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>
	<FORM ACTION="./vendor_email_final_hud.cfm?user=#url.user#&pass=#url.pass#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>
<cfif #a_trigger# eq 21>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Final HUD sent
	<cfelse>
	Send Final HUD via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
</cfif>
	</form>
 </cfoutput>
	<cfelse>
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is no Final HUD file uploaded for this order. <br>
	</font><br></td></tr>
</CFIF>



	<cfif #get_file.closing_form_upload# neq "">

	<cfoutput query="get_file">


<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is a closing form file uploaded (#closing_form_upload#). <br>
	Click this button to view it

	<A HREF="#fileSys.FindFilePath('#get_file.closing_form_upload#', 'url')#" target="new"><img src="./images/button_view.gif" border=0 ALT="View Upload file for this order"></a><BR>
<font size=2 color=red face=arial>Adobe Acrobat Reader Required</font><br></TD></tr></NOBR>
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>
	<FORM ACTION="./vendor_email_closing_form.cfm?user=#url.user#&pass=#url.pass#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>

	<cfif #a_trigger# eq 20>
	<FONT SIZE=2 color = blue FACE=ARIAL>Email with Closing Form 1 sent
	<cfelse>
	Send Closing Package via email by entering an email address below:<br>
 <input type="text" name = "email" size = "15"> and click <input type="submit" value="Email"><input type="hidden" name="a_flag" value="3"></b><p></td></tr>
	</cfif>
  </FORM>
 </cfoutput>
	<cfelse>
	<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is no closing form file uploaded for this order. <br>
	</font><br></td></tr>
</CFIF>



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
