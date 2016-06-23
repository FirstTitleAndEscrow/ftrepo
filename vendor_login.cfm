<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>

	<title>1st Title & Esc. Settlement Services Company & Subsid. Companies<</title>
</head>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<table width=607 border="0" cellpadding="0" cellspacing="0" background="https://<cfoutput>#cgi.server_name#</cfoutput>/images/back_02.gif">
	<tr><td width=607 align=left valign=top><IMG src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/logo_top_1.gif"></td></tr>
	<tr><td width=607 align=CENTER valign=top><NOBR><!--- <a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a> ---><cfoutput><a href="https://#cgi.server_name#/site_page.cfm?page_id=1"><img border=0 src="https://#cgi.server_name#/images/nav_serving.gif"></a><a href="https://#cgi.server_name#/site_page.cfm?page_id=2"><img border=0 src="https://#cgi.server_name#/images/nav_closing.gif"></a><a href="https://#cgi.server_name#/vendor_login.cfm"><img border=0 src="https://#cgi.server_name#/images/nav_vendor_login.gif"></a><a href="https://#cgi.server_name#/site_page.cfm?page_id=3"><img border=0 src="https://#cgi.server_name#/images/nav_contact.gif"></a><a href="https://#cgi.server_name#/email.cfm?pass=0"><img border=0 src="https://#cgi.server_name#/images/nav_email.gif"></a></cfoutput></NOBR></td></tr>
	<tr><td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></td></tr>

	<tr>
		<td width=607 align=left valign=top>

<CFFORM action="https://#cgi.server_name#/vendor_login_submit.cfm?a_flag=1">
	<table bgcolor=gray border="0" align="center" width=275 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor=d3d3d3 colspan="2" width=275 align="center" valign="top">
			<font face="Arial" size="2" color="Black">
			<b>Abstractor Login</b>
			</font>
			</td>
		</tr>
		<tr>
			<td bgcolor=d3d3d3 width="130" align="right" valign="top">
		  		<font face="arial" size="2" color="black">
			User Name:
				</font>
			</td>

			<td bgcolor=f1f1f1 width="145" align="center" valign="top" bgcolor="a2a3fe">
				<cfinput NAME="user_name" SIZE="25" MAXLENGTH="25" TABINDEX="1" required="yes" message="You must Enter your User Name "
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: E4E3E3;
					border-color: white;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;
					clear: none;" >
			</td>
		</tr>

        <tr>
			<td bgcolor=d3d3d3 width="130" align="right" valign="top">
				<font face="arial" size="2" color="black">
			Password:
				</font>
			</td>

			<td bgcolor=f1f1f1 width="145" align="center" valign="top" bgcolor="a2a3fe">
				<cfinput TYPE="password" NAME="password" SIZE="25" MAXLENGTH="25" TABINDEX="2" required="yes" message="You must Enter your Password"
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: E4E3E3;
					border-color: white;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;
					clear: none;" >
			</td>
        </tr>
		</table>

	<table  border="0" align="center" width=275 cellpadding="1" cellspacing=1>
        <tr>
			<td bgcolor=white colspan="2" width=275 align="right" valign="top">
				<p>
				<br>
				<input type="image" border=0 src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_login.gif">
			</td>
		</tr>

	</table>
</cfform>
<CFFORM action="https://#cgi.server_name#/vendor_login_submit.cfm?a_flag=2">
	<table bgcolor=gray border="0" align="center" width=275 cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor=d3d3d3 colspan="2" width=275 align="center" valign="top">
			<font face="Arial" size="2" color="Black">
			<b>Closer Login</b>
			</font>
			</td>
		</tr>
		<tr>
			<td bgcolor=d3d3d3 width="130" align="right" valign="top">
		  		<font face="arial" size="2" color="black">
			User Name:
				</font>
			</td>

			<td bgcolor=f1f1f1 width="145" align="center" valign="top" bgcolor="a2a3fe">
				<cfinput NAME="user" SIZE="25" MAXLENGTH="25" TABINDEX="1" required="yes" message="You must Enter your User Name "
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: E4E3E3;
					border-color: white;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;
					clear: none;" >
			</td>
		</tr>

        <tr>
			<td bgcolor=d3d3d3 width="130" align="right" valign="top">
				<font face="arial" size="2" color="black">
			Password:
				</font>
			</td>

			<td bgcolor=f1f1f1 width="145" align="center" valign="top" bgcolor="a2a3fe">
				<cfinput TYPE="password" NAME="pass" SIZE="25" MAXLENGTH="25" TABINDEX="2" required="yes" message="You must Enter your Password"
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: E4E3E3;
					border-color: white;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;
					clear: none;" >
			</td>
        </tr>
		</table>

	<table  border="0" align="center" width=275 cellpadding="1" cellspacing=1>
        <tr>
			<td bgcolor=white colspan="2" width=275 align="right" valign="top">
				<p>
				<br>
				<input type="image" border=0 src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_login.gif">
			</td>
		</tr>

	</table>
</cfform>

<p>
<CENTER>
			<p>
			<br>
			<p>
			<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/text_01.gif">
			<p>
			<br>
			<p>
			<CFINCLUDE TEMPLATE="./footer_links.cfm">

</td></tr>

	<tr><td width=607 align=left valign=bottom><IMG src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/bottom.gif"></td></tr></table>

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
