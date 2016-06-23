
<CFSET r_count = "0">



		<CFQUERY datasource="#request.dsn#" NAME="read_tp">

			SELECT *
			FROM thirdparty
			where ID = #id#

		</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_titleid">

			SELECT a.title_id
			FROM title a inner join thirdpartyorders b on a.title_id = b.orderid
			where b.thirdpID = #id#
			ORDER BY a.Title_id

		</CFQUERY>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>


</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>



<table  cellpadding=0 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td  align=center valign=top>
		<table width="780" height="110" border="0" cellpadding="0" cellspacing="0" background="/client/images/banner_black_wout_logo.jpg" valign="top">
  <tbody><tr>
    <td rowspan="2" valign="top" width="220"> 
<a href="./"><img src="../client/images/FT_header_logo.jpg" border="0" alt="First Title Services Homepage" height="110" width="220"></a>
</td>
    <td valign="top" align="right"><br>


</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</tbody></table>

<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=white >
	

	<tr>
		<td width=780 align=left valign=top bgcolor=e1e1e1>
		<a href="./client/tlogin.cfm"><FONT FACE=verdana SIZE=2 color="red"><b>Log out</b></font></a>

	<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=780 align=center valign=top bgcolor=e1e1e1>

				<FONT FACE=verdana SIZE=3 color="blUE">
						<cfoutput>	<B>Welcome #read_tp.first#&nbsp;&nbsp;#read_tp.last#</b></cfoutput>
		</td></tr>

</table>

<br>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->

<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
<CFFORM NAME="frm"  ACTION="./title_tp_rep_display.cfm?a_trigger=1&ID=#read_tp.id#" METHOD=POST>

<tr>
			<td width=780 align=left valign=top bgcolor="navy">
				<FONT FACE=ARIAL SIZE=2 color="white">

			</TD>
		</TR>
		<tr>
			<td width=780 align=left valign=top bgcolor=elelel>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Please select below to find your order</B></CENTER>
			</TD>
		</TR>
<tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>


				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>

					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="Title_id"
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
								<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>



					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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


					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller's First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_fname" size=25 maxlength=15
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
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="seller_lname"  size=25 maxlength=25
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
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
		</table>

<tr>
			<td width=780 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">

			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
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


