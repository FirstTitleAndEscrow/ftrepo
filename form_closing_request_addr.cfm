<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Property Request Form</title>
</head>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
	<tr><td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td></tr>
	<tr><td width=607 align=CENTER valign=top><NOBR><!--- <a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a> ---><a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td></tr>
	<tr><td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></td></tr>


	<tr>
		<td width=607 align=center valign=top>
				<img src="./images/label_title.gif">
				<p>
	<CFFORM NAME="frm" ACTION="./form_closing_request_addr_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_id=0&zip_trigger=0" METHOD=POST>



				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->

					<tr>
						<td width=519 colspan=2  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Enter the City and state for this property.  Using the information
							that you enter below, we will calculate the Zip Code and the County for the property.
							<p>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							City:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							State:
						</td>
					</tr>


<CFIF #zip_trigger# EQ "1">
					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<CFINPUT TYPE="Text" NAME="pcity" VALUE="#pcity1#" REQUIRED="Yes" Message="You must enter a CITY" SIZE=19 MAXLENGTH=25
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
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
						<td width=314  bgcolor="f1f1f1" align=left>
							<select name="pstate"
									size="1"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;
									float: none;"
									rows="3"
									cols="45"
									>
					<CFOUTPUT QUERY="read_state_list">

								<CFIF #st_abbrev# EQ "#pstate1#">
							<option value="#st_abbrev#" SELECTED>#st_abbrev#</option>
								<CFELSE>
							<option value="#st_abbrev#">#st_abbrev#</option>
								</CFIF>
					</CFOUTPUT>
								</select>

					</tr>


<CFELSE>
					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<CFINPUT TYPE="Text" NAME="pcity"  REQUIRED="Yes" Message="You must enter a CITY" SIZE=19 MAXLENGTH=25
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
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
						<td width=314  bgcolor="f1f1f1" align=left>
							<select name="pstate"
									size="1"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;
									float: none;"
									rows="3"
									cols="45"
									>
					<CFOUTPUT QUERY="read_state_list">
							<option value="#st_abbrev#">#st_abbrev#</option>
					</CFOUTPUT>
								</select>

					</tr>

</CFIF>

			</table>


<p>
		</TD>
	</TR>
		<tr><td width=607 align=right valign=bottom>
			<NOBR><input type=image border=0 src="./images/button_continue.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>

		<tr><td width=607 align=left valign=bottom><IMG src="./images/bottom.gif"></td></tr></table>
</TABLE>
</CFFORM>





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