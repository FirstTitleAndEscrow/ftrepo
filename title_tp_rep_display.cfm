<cfparam name="buyer_lname" default="">
<cfparam name="buyer_fname" default="">
<cfparam name="seller_lname" default="">
<cfparam name="seller_fname" default="">

<cfparam name="title_id" default="">

<CFSET r_count = "0">


<cfoutput>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	<CFSET title_id = #title_id#>
</cfif></CFIF>

<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

<CFIF IsDefined("form.seller_fname")><cfif #Trim(seller_fname)# is not "">
	<CFSET seller_fname = #seller_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.seller_lname")><cfif #Trim(seller_lname)# is not "">
	<CFSET seller_lname = #seller_lname#>
</cfif></CFIF>

</cfoutput>


<CFQUERY datasource="#request.dsn#" NAME="read_report">



			SELECT *
			FROM title a inner join thirdpartyorders b on a.title_id = b.orderid
			where b.thirdpID = #ID#


			 	<CFIF #title_id# NEQ "none">
				AND a.title_id = '#title_id#'
			</CFIF>


			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

					 <CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>
		 ORDER BY oda_month DESC, oda_day DESC, oda_year DESC
	 </CFQUERY>

		<CFSET r_count = #read_report.recordcount#>



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
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Pending Title/Closing Orders</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=780 align=left valign=top bgcolor=e1e1e1>

<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>




			</TD>
				</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order #
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<!--- <td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td> --->

						<td bgcolor=gray width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<!---------------------------------------------------->
		<!--- SET COUNT_END FOR RECORD DISPLAY --->
		<!---------------------------------------------------->
		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="read_report" startrow="#count#" endrow="#count_end#">


			<CFOUTPUT>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#oda_month#/#oda_day#/#oda_year#
						</td>
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<!--- <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td> --->
                      <td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<FONT FACE=verdana SIZE=1 color="black">


							<a href="./view_title_comments_nav_tp.cfm?user_id_1=#USER_ID#&comp_id=#read_report.comp_id#&lo_id=#loan_off_id#&rec_id=#title_id#&thirdpID=#thirdpID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>


						</td>

					<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./title_tp_report_nav.cfm?id=#url.id#&rec_id=#title_id#&comp_id=#read_report.comp_id#&a_trigger=1"><img src="./images/button_details.gif" border=0 ALT="View Order details"></a>
						</td>

					</tr>





						<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->

		<CFIF #r_count# LTE "5">
	<TABLE><TR>
	<td width = 800 bgcolor="BFFFBF"  align=left valign=top>

					<p><font face="Arial, Helvetica, sans-serif" size="2">The "details" button allows you to: </font></p>

<ul><li><font face="Arial, Helvetica, sans-serif" size="2">View and print completed title committment</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View HUD-1 for instant fees</font></li>

<li><font face="Arial, Helvetica, sans-serif" size="2">View print your Closing Protection Letter of request</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View scheduled closing information</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Check status of file</li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Upload documents to the site</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">View your orders.</font></li>
<li><font face="Arial, Helvetica, sans-serif" size="2">Contact your processing team</font></li>
</ul>


				<p><font face="Arial, Helvetica, sans-serif" size="2">The "add/view" comments area above acts as a collaborative group instant messeging communication log. Every note or message entered will be logged in chronological order and indicate the user who triggered the system. </font></p>



									</td>

					</tr></TABLE>
	</CFIF>


		</table>
		<!--- <nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>
			 --->



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
