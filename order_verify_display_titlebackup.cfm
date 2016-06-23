

	<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE id = #USER_ID_1#
		ORDER BY lp_lname ASC
	</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">

			SELECT *
			FROM loan_officers
			WHERE ID = #lo_ID#

		</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_title">

				SELECT *
				FROM title
				WHERE title_ID = #order_id#

			</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_user">

			SELECT *
			FROM user_client_assoc
			WHERE company_id = #read_user.comp_id#
		order by id
		</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Title Request Form</title>
</head>

<BODY BGCOLOR="elelel" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<table width=800 border="0" cellpadding="0" cellspacing="0" background="./images/back_02.gif">
	<tr><td width=800 align=center valign=top><IMG src="./images/logo_top_1.gif"></td></tr>
	<tr><td width=800 align=center valign=top><NOBR><center><!--- <a href="./zip_code_search.cfm" target="New" onClick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')"><img src="./images/nav_zip_search.gif" border=0></a> ---><a href="./site_page.cfm?page_id=1"><img border=0 src="./images/nav_serving.gif"></a><a href="./site_page.cfm?page_id=2"><img border=0 src="./images/nav_closing.gif"></a><a href="./client_login.cfm"><img border=0 src="./images/nav_cust_login.gif"></a><a href="./site_page.cfm?page_id=3"><img border=0 src="./images/nav_contact.gif"></a><a href="./email.cfm?pass=0"><img border=0 src="./images/nav_email.gif"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></center></td></tr>
	<tr><td width=800 align=center valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></td></tr>
</table>
<TABLE WIDTH=800 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>

	<tr>
		<td width=800 align=center valign=top bgcolor=elelel>
				 <img src="./images/label_title.gif">
				<p>
				<p>
				<center><font size=3 color=black face=arial><b>THANK YOU FOR THE ORDER</b></center><br><p>
				<center>Your Title Commitment Request Order has been Processed.</center><br>
				<center>Your order number is:&nbsp;<CFOUTPUT><font size=2 color=blue face=arial><b>#read_title.title_id#</b></center><br>

				<center>For Instant Fees click here&nbsp;<a href="./title_view_hud_pg1.cfm?rec_id=#read_title.title_id#"><img border=0 src="./images/button_est_hud_1.gif"></a></center><br>
				</cfoutput>


<CFOUTPUT>
<center>
<FONT FACE=ARIAL SIZE=2>To view your order click here <a href="./view_the_order.cfm?order_id=#read_title.title_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#"><img border=0 src="./images/button_view_order.gif"></a><br>
</center>
</CFOUTPUT>

</TD></tr></table>
<p>
<cfif #get_user.recordcount# GT "0">
			<TABLE WIDTH=800 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
			<tr>
		<td width=800 align=center colspan = 5 valign=top bgcolor=elelel>

			<CENTER><FONT FACE=ARIAL color=red SIZE=2><b>THIS IS YOUR FIRST TITLE CONTACT LIST </b></FONT></center>
				</td>
				</tr>

		</center>
			<tr>
		<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>POSITION</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FIRST/LAST NAME</td>
			<td width=190 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
			<td width=130 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
			<td width=160 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>


		</TD>
	</TR>


		<CFOUTPUT query = "get_user">



		<tr>
			<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Title Ordering/Tracking' or position = 'Title Delivery/Review' or position = 'Title Clearance' or position = 'Scheduling Coordinator' or position = 'Processing Asst.' or position = 'Funding Asst.' or position = 'Processor' or position = 'Funder' or position = 'Shipping' or position = 'Manager, Processing' or position = 'Manager, Title Production' or position = 'Manager, Research')
		order by id
		</CFQUERY>
		<cfif #retrieve_user.recordcount# GT 0>
		<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user.fname#&nbsp;&nbsp;#retrieve_user.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			#retrieve_user.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a></td>
			</cfif>
		<!--- <CFQUERY datasource="#request.dsn#" NAME="retrieve_user2">

			SELECT *
			FROM first_admin
			WHERE id = #id# and position = 'Title Delivery/Review'

		</CFQUERY>
		<cfif #retrieve_user2.recordcount# GT 0>
		<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user2.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user2.fname#&nbsp;&nbsp;#retrieve_user2.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user2.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			#retrieve_user2.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<a href="mailto:#retrieve_user2.email#">#retrieve_user2.email#</a></td>

	</cfif>

	<CFQUERY datasource="#request.dsn#" NAME="retrieve_user3">

			SELECT *
			FROM first_admin
			WHERE id = #id# and position = 'Title Clearance'

		</CFQUERY>
		<cfif #retrieve_user3.recordcount# GT 0>
		<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user3.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user3.fname#&nbsp;&nbsp;#retrieve_user3.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user3.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			#retrieve_user3.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<a href="mailto:#retrieve_user3.email#">#retrieve_user3.email#</a></td>
		</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user4">

			SELECT *
			FROM first_admin
			WHERE id = #id# and position = 'Scheduling Coordinator'

		</CFQUERY>
		<cfif #retrieve_user4.recordcount# GT 0>
		<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user4.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user4.fname#&nbsp;&nbsp;#retrieve_user4.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user4.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			#retrieve_user4.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<a href="mailto:#retrieve_user4.email#">#retrieve_user4.email#</a></td>
	</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="retrieve_user5">

			SELECT *
			FROM first_admin
			WHERE id = #id# and position = 'Processing Asst.'

		</CFQUERY>
		<cfif #retrieve_user5.recordcount# GT 0>
		<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user5.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user5.fname#&nbsp;&nbsp;#retrieve_user5.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user5.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			#retrieve_user5.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<a href="mailto:#retrieve_user5.email#">#retrieve_user5.email#</a></td>
	</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="retrieve_user6">

			SELECT *
			FROM first_admin
			WHERE id = #id# and position = 'Processor'

		</CFQUERY>
		<cfif #retrieve_user6.recordcount# GT 0>
		<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user6.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user6.fname#&nbsp;&nbsp;#retrieve_user6.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user6.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			#retrieve_user6.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<a href="mailto:#retrieve_user6.email#">#retrieve_user6.email#</a></td>
	</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="retrieve_user7">

			SELECT *
			FROM first_admin
			WHERE id = #id# and position = 'Funder'

		</CFQUERY>
		<cfif #retrieve_user7.recordcount# GT 0>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user7.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user7.fname#&nbsp;&nbsp;#retrieve_user7.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user7.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			#retrieve_user7.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<a href="mailto:#retrieve_user7.email#">#retrieve_user7.email#</a></td>
	</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="retrieve_user8">

			SELECT *
			FROM first_admin
			WHERE id = #id# and position = 'Shipping'

		</CFQUERY>
		<cfif #retrieve_user8.recordcount# GT 0>
		<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user8.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user8.fname#&nbsp;&nbsp;#retrieve_user8.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user8.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			#retrieve_user8.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<a href="mailto:#retrieve_user8.email#">#retrieve_user8.email#</a></td>
	</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="retrieve_user9">

			SELECT *
			FROM first_admin
			WHERE id = #id# and (position = 'Manager, Processing' or position = 'Manager, Title Production' or position = 'Manager, Research/Process')

		</CFQUERY>
		<cfif #retrieve_user9.recordcount# GT 0>
		<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user9.Position#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user9.fname#&nbsp;&nbsp;#retrieve_user9.lname#</td>
			<td width=190 align=left valign=top bgcolor=elelel>
			#retrieve_user9.PHONE#</td>
			<td width=130 align=left valign=top bgcolor=elelel>
			#retrieve_user9.fax#</td>
			<td width=160 align=left valign=top bgcolor=elelel>
			<a href="mailto:#retrieve_user9.email#">#retrieve_user9.email#</a></td>
	</cfif> --->
	</TR>

	</cfoutput>




</cfif>	</table>
	<TABLE WIDTH=800 BORDER=0 CELLSPACING=0 align="center" bgcolor=d3d3d3>
	<tr><td width=800 colspan = 5 align=center valign=bottom>
				<cfoutput>
				<a href="./client_acct_mgt.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#">Return Home</a>
				</cfoutput><p></td></tr>
		</table>

		</CENTER>







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
