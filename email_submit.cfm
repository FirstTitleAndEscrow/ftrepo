
<CFMAIL FROM="#FORM.email_addr#"
	TO="sdari@firsttitleservices.com,spape@firsttitleservices.com"
	SUBJECT="Message from the Web Site Email Form"
	>

	This message was sent using the form on the
	Web Site.

	Please respond to it within 24 hours.

	This message was sent:

	[ #DateFormat(Now(), "ddddd")# ] - #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)

	Message:

	#FORM.email_msg#

</CFMAIL>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Email Us</title>
</head>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
	<tr><td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td></tr>
	<tr><td width=607 align=left valign=top><NOBR><a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a><a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td></tr>
	<tr><td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></td></tr>


	<tr>
		<td width=607 align=center valign=top>


<table width="450" cellpadding=1 cellspacing=1 border=0 bgcolor=white>



	<tr>
		<td width="450" align=center valign=top bgcolor=e2e2e2>

			<table cellpadding=2 cellspacing=2 border=0 width=449>
  <tr>
    <td bgcolor=d3d3d3 width=449 colspan=2 align=left valign=top>
         <FONT SIZE=2 COLOR=black face=arial>
     Thanks you, your message has been sent.
	 <p>
	 All inquiries are answered within 24 hours Monday through Friday (excluding Holidays).
    </td>
  </tr>
<CFOUTPUT>
  <tr>
    <td bgcolor=d3d3d3 width=140  align=left valign=top>
         <FONT SIZE=2 COLOR=black face=verdana>
      <NOBR>Your Email Address <img src="./images/arrow_blue_right.gif"></NOBR>
    </td>
    <td bgcolor=f1f1f1 width=309  align=left valign=top>
	 <FONT SIZE=2 COLOR=blue face=verdana>
		#FORM.email_addr#
    </td>
  </tr>
  <tr>
    <td bgcolor=d3d3d3 width=449 colspan=2 align=left valign=top>
         <FONT SIZE=2 COLOR=black face=verdana>
      <NOBR>Your Message:<img src="./images/arrow_blue_down1.gif"></NOBR>
    </td>
  </tr>
  <tr>
    <td bgcolor=f1f1f1 width=449 colspan=2 align=left valign=top>
	<FONT SIZE=2 COLOR=blue face=verdana>
		#FORM.email_msg#
    </td>
  </tr>
</table>
		</td>
	</tr>

</CFOUTPUT>

	<tr>
		<td width="499" align=center valign=top >
			<p>
			<br>
			<p>
			<img src="./images/text_01.gif">
			<p>
			<br>
			<p>
			<CFINCLUDE TEMPLATE="./footer_links.cfm">
		</td>
	</tr>
</table>




	<tr><td width=607 align=left valign=bottom><IMG src="./images/bottom.gif"></td></tr></table>

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

