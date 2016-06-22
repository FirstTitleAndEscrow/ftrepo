
		<CFQUERY DATASOURCE="First_Title_Main_Admin" NAME="read_content">
		
			SELECT *
			FROM web_site
			WHERE page_id = 4 
		
		</CFQUERY>

		

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - <CFOUTPUT>#read_content.page_title#</CFOUTPUT></title>
</head>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<table width=607 border="0" cellpadding="0" cellspacing="0" background="<cfoutput>#cgi.server_name#</cfoutput>/images/back_02.gif">
	<!---<tr><td width=607 align=left valign=top><IMG src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/logo_top_1.gif"></td></tr>
	<tr><td width=607 align=left valign=top><NOBR><!--- <a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a> --->&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://<cfoutput>#cgi.server_name#</cfoutput>/site_page.cfm?page_id=1"><img border=0 src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/nav_serving.gif"></a><a href="http://<cfoutput>#cgi.server_name#</cfoutput>/site_page.cfm?page_id=2"><img border=0 src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/nav_closing.gif"></a><a href="http://<cfoutput>#cgi.server_name#</cfoutput>/client_login.cfm"><img border=0 src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/nav_cust_login.gif"></a><a href="http://<cfoutput>#cgi.server_name#</cfoutput>/vendor_login.cfm"><img border=0 src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/nav_vendor_login.gif"></a><a href="http://<cfoutput>#cgi.server_name#</cfoutput>/site_page.cfm?page_id=3"><img border=0 src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/nav_email.gif"></a></NOBR></td></tr>
	 <tr><td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></td></tr>
 --->
<CFOUTPUT>
	<tr>
		<td width=607 align=center valign=top>
		
<table width="#read_content.page_width#" cellpadding=1 cellspacing=1 border=0 bgcolor=white>


	
	 <tr>
		<td width="#read_content.page_width#" align=center valign=top bgcolor=e2e2e2>
			
			#read_content.page_content#			
			
		</td>
	</tr>	

	<tr>
		<td width="#read_content.page_width#" align=center valign=top >
			<p>
			<br>
			<p>
			<img src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/text_01.gif">			
			<p>
			<br>
			<p>			
			<CFINCLUDE TEMPLATE="./footer_links.cfm">
		</td>
	</tr>	
</table>

	
</CFOUTPUT>

	<tr><td width=607 align=left valign=bottom><IMG src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/bottom.gif"></td></tr></table>

</body>
</html>


