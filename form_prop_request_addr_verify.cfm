
		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>


<!--- ===/ Check the city and state info \=== --->
<!--- ===/ to ensure it is accurate      \=== --->


		<CFIF #zip_trigger# EQ "2">

			<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">

				SELECT *
				FROM zip_info
				WHERE zip_id = #zip_id#

			</CFQUERY>

		<CFELSE>

			<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">

				SELECT *
				FROM zip_info
				WHERE city = '#pcity#' AND state = '#pstate#'

			</CFQUERY>

		</CFIF>

		<CFIF #read_zip_code.recordcount# EQ "0">

			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
			<html>
			<head>
			<title>1st Title & Escrow, Inc. - Property Request Form</title>
			</head>
			<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
			<CENTER>
			<table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
			<tr><td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td></tr>
			<tr><td width=607 align=left valign=top><NOBR><a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a><a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td></tr>
			<tr><td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></td></tr>

			<tr>
				<td width=607 align=center valign=top>
						<img src="./images/label_property.gif">
			<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
			<tr>
				<td width=607 align=center valign=top>
					<FONT FACE=ARIAL SIZE=2 color="red">
					The information you entered is incorrect, because no match was found for:
					<p>
				<CFOUTPUT>
					<NOBR>CITY - <b>#pcity#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;STATE - <b>#pstate#</b></NOBR>
					<p>
				</CFOUTPUT>
				</td>
			</tr>
			</table>
			</TD>
			</TR>

	<tr>
		<td width=607 align=center valign=top>

	<CFFORM NAME="frm" ACTION="./form_prop_request_addr_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=1&zip_id=0" METHOD=POST>



				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->

					<tr>
						<td width=519 colspan=2  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Please Re-Enter the data below.
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

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<CFINPUT TYPE="Text" NAME="pcity" VALUE="#pcity#" REQUIRED="Yes" Message="You must enter a CITY" SIZE=19 MAXLENGTH=25
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

								<CFIF #st_abbrev# EQ "#pstate#">
							<option value="#st_abbrev#" SELECTED>#st_abbrev#</option>
								<CFELSE>
							<option value="#st_abbrev#">#st_abbrev#</option>
								</CFIF>
					</CFOUTPUT>
								</select>

					</tr>

			</table>


<p>
		</TD>
	</TR>
		<tr><td width=607 align=right valign=bottom>
			<NOBR><input type=image border=0 src="./images/button_continue.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td></tr>

		<tr><td width=607 align=left valign=bottom>
				<IMG src="./images/bottom.gif">
			</td>
		</tr>
	</table>
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

	<CFABORT>


<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->

<CFELSEIF #read_zip_code.recordcount# GT "1">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Property Request Form</title>
</head>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
	<tr><td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td></tr>
	<tr><td width=607 align=left valign=top><NOBR><a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a><a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td></tr>
	<tr><td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></td></tr>


	<tr>
		<td width=607 align=center valign=top>
				<img src="./images/label_property.gif">
				<p>
	<CFFORM NAME="frm" ACTION="./form_prop_request_addr_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=2&pstate=#pstate#&pcity=#pcity#" METHOD=POST>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
<CFOUTPUT>
					<tr>
						<td width=519 colspan=2  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							The data you entered returned more than one result. Please select
							the appropriate data from the list below.
							<p><FONT FACE=verdana SIZE=1 color="blue">
							<B>#read_zip_code.recordcount#</B> matches were found.
							<p>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							City:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.city#</B>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							State:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.state#</B>
						</td>
					</tr>
</CFOUTPUT>

					<tr>
						<td width=519 colspan=2  bgcolor="f1f1f1" align=left>
				<table width=400 cellpadding=1 cellspacing=1 border=0>
<CFOUTPUT query="read_zip_code">
					<tr>
						<td width=100  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<nobr><input type=radio value="#zip_id#" NAME="zip_id" checked>&nbsp;&nbsp;&nbsp;Zip: </NOBR>
						</td>
						<td width=100  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#zip#</B>
						</td>

						<td width=100  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County :
						</td>
						<td width=100  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#county#</B>
						</td>

					</tr>

</CFOUTPUT>
				</table>
						</td>
					</tr>
<CFOUTPUT>
					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<a href="./form_prop_request_addr.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=1&pcity1=#pcity#&pstate1=#pstate#"><img border=0 src="./images/button_go_back.gif"></a>
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<INPUT TYPE=image border=0 src="./images/button_continue.gif">

					</tr>
</CFOUTPUT>

			</table>
</CFFORM>

<p>
		</TD>
	</TR>


		<tr>
			<td width=607 align=left valign=bottom>
				<IMG src="./images/bottom.gif">
			</td>
		</tr>
	</table>

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



	<CFABORT>


<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->
<!--- ============================================================== --->

<CFELSE>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Property Request Form</title>
</head>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<table width=607 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
	<tr><td width=607 align=left valign=top><IMG src="./images/logo_top_1.gif"></td></tr>
	<tr><td width=607 align=left valign=top><NOBR><a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a><a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a></NOBR></td></tr>
	<tr><td width=607 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></td></tr>


	<tr>
		<td width=607 align=center valign=top>
				<img src="./images/label_property.gif">
				<p>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
<CFOUTPUT>
					<tr>
						<td width=519 colspan=2  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							The information you entered is shown below.  Please check it to ensure that it is correct before proceeding.
							<p>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							City:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.city#</B>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							State:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.state#</B>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Zip:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.zip#</B>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County:
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							<B>#read_zip_code.county#</B>
						</td>
					</tr>
</CFOUTPUT>

					</tr>
<CFOUTPUT>
					<tr>
						<td width=205  bgcolor="f1f1f1" align=right>
							<a href="./form_prop_request_addr.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=1&pcity1=#pcity#&pstate1=#pstate#"><img border=0 src="./images/button_go_back.gif"></a>
						</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<a href="./form_prop_request.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&zip_trigger=1&pcity=#pcity#&pstate=#pstate#&zip_id=#read_zip_code.zip_id#"><img border=0 src="./images/button_continue.gif"></a>

					</tr>
</CFOUTPUT>

			</table>


<p>
		</TD>
	</TR>


		<tr>
			<td width=607 align=left valign=bottom>
				<IMG src="./images/bottom.gif">
			</td>
		</tr>
	</table>

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

</CFIF>
