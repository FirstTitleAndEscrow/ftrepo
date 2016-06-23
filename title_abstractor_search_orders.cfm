
<CFSET r_count = "0">

	<!---=========================================== --->
	<!--- ===/ Get a list of all of the Clients \=== --->

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			ORDER BY company ASC

		</CFQUERY>

		<CFSET c_count = "1">
		<CFSET a_company_name = ArrayNew(1)>
		<CFSET a_company_id   = ArrayNew(1)>

		<CFOUTPUT QUERY="read_companies">
			<CFSET a_company_name[c_count] = #company#>
			<CFSET   a_company_id[c_count] = #ID#>

			<CFSET c_count = #c_count# + "1">
		</CFOUTPUT>

	<!---=========================================== --->
	<!---===================================================================== --->
	<!--- ===/ Use the list of companies to get a list of all their users \=== --->

		<CFSET    users_fname = ArrayNew(2)>
		<CFSET    users_lname = ArrayNew(2)>
		<CFSET       users_id = ArrayNew(2)>
		<CFSET    a_rec_count = ArrayNew(1)>

		<CFSET a_count = "1">
		<CFSET b_count = "1">

			<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="CCC">
				<CFQUERY datasource="#request.dsn#" NAME="read_users">
					SELECT *
					FROM users
					Where comp_id = #a_company_id[CCC]#
					ORDER BY lp_lname ASC, lp_fname ASC
				</CFQUERY>

					<CFOUTPUT QUERY="read_users">
						<CFSET users_fname[CCC][b_count] = #lp_fname#>
						<CFSET users_lname[CCC][b_count] = #lp_lname#>
						<CFSET    users_id[CCC][b_count] = #ID#>

						<CFSET b_count = #b_count# + "1">
					</CFOUTPUT>
						<CFSET a_rec_count[CCC] = #read_users.recordcount#>
						<CFSET b_count = "1">
			</CFLOOP>
	<!---===================================================================== --->


<CFQUERY datasource="#request.dsn#" NAME="read_new_ORDER">

			SELECT *
			FROM TRANSUNIONMAST
			where status = 'O'
			ORDER BY ORDER_NUM

</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_old_ORDER">

			SELECT *
			FROM TRANSUNIONMAST
			where status = 'X'
			ORDER BY ORDER_NUM

</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
	<tr>
		<td width=780 align=center valign=top>
	<br><br><br><br><br><br><br>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=780 align=center valign=top bgcolor=e1e1e1>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Abstractor Order Report Search</B></CENTER>
			</TD>
		</TR>
		<tr>
			<td width=780 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to get order(s)</B></CENTER>
			</TD>
		</TR>
<CFFORM METHOD=POST ACTION="./title_abstractor_display_order.cfm?a_trigger=1">
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top colspan=2 bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Note</B><br>*Allows you to select either new or old orders (previously submitted)</CENTER>
			</TD>
		</TR>
					<tr>
					<td bgcolor=d3d3d3 width=290 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							New Orders
						</td>

						<td bgcolor=d3d3d3 width=360 align=left valign=top>
							<SELECT NAME="new_order"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_new_order"><OPTION VALUE="#Order_Num#">#Order_Num#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

						<tr>
					<td bgcolor=d3d3d3 width=290 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Old Orders
						</td>

						<td bgcolor=d3d3d3 width=360 align=left valign=top>
							<SELECT NAME="old_order"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_old_order"><OPTION VALUE="#order_num#">#order_num#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

				<!--- 	<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								>
						</td>
					</tr>




			</TR>

<tr>
						<td bgcolor=d3d3d3 width=190 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=460 align=left valign=top>
							<SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Title_id">Order Number</OPTION>
<OPTION VALUE="comments">Comments</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>

</SELECT>
						</td>
					</tr>	--->

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Abstractor Order Report Search</B></CENTER>
			</TD>
		</TR>

</CFFORM>
			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>


			</TD>
		</TR>

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
</HTML>


