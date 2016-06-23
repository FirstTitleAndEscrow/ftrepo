
<cfparam name="buyer_lname" default="">
<cfparam name="buyer_fname" default="">
<cfparam name="seller_fname" default="">
<cfparam name="seller_lname" default="">
<cfparam name="comments" default="">
<cfparam name="events" default="">
<cfparam name="appraisal_status" default="">
<cfparam name="sortorder" default="">
<cfparam name="user_id" default="">
<cfparam name="oda_month" default="">
<cfparam name="oda_day" default="">
<cfparam name="oda_year" default="">
<cfparam name="title_id" default="">
<cfparam name="prop_id" default="">
<cfparam name="order_id" default="">
<cfparam name="abstract_id" default="">
<cfparam name="abstract_file" default="">
<cfparam name="icl_file" default="">
<cfparam name="closer_file" default="">
<cfparam name="company_id" default="">
<cfparam name="a_trigger" default="0">
<CFSET r_count = "0">


<cfif #a_trigger# eq "1">

	<!---- BEGIN MODIFY  ----->
<cfoutput>
		 <CFIF IsDefined("form.oda_month")><cfif #oda_month# NEQ "NONE">
	<CFSET oda_month = #oda_month#>
</cfif></CFIF>
<CFIF IsDefined("form.oda_day")><cfif #oda_day# NEQ "NONE">
	<CFSET oda_day = #oda_day#>
</cfif></CFIF>
<CFIF IsDefined("form.oda_year")><cfif #oda_year# NEQ "NONE">
	<CFSET oda_year = #oda_year#>
</cfif></CFIF>
		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>


<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	<CFSET title_id = #title_id#>
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>



		<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM Title
			WHERE 0 = 0
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
<cFIF #oda_month# NEQ "none">
				AND oda_month = '#oda_month#' </CFIF>
			<cFIF #oda_day# NEQ "none">
				AND oda_day = '#oda_day#' </CFIF>
			<cFIF #oda_year# NEQ "none">
				AND oda_year = '#oda_year#' </CFIF>

			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>



				<CFIF #title_id# NEQ "none">
				AND title_id = '#title_id#'
			</CFIF>


			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY  comp_id ASC, user_id ASC, oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>






		<CFIF '#update#' EQ 'yes'>

				<CFQUERY datasource="#request.dsn#">
				UPDATE title
				SET  appraisal_status = '#appraisal_status#',
					comments = '#comments#'
				WHERE title_id = #title_id#
				</CFQUERY>

		</cfif>
		<CFSET r_count = #read_report.recordcount#>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=820 align=center valign=top>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=820 align=center valign=top bgcolor=e1e1e1>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Commitment Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>

					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&oda_day=#oda_day#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&oda_year=#oda_year#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=1"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&oda_day=#oda_day#&oda_year=#oda_year#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=1"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_report.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&oda_day=#oda_day#&oda_year=#oda_year#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>			</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=40 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td>

						<td bgcolor=gray width=40 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=90 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
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



						<td bgcolor=#a_bgcolor# width=40 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#oda_month#/#oda_day#/#oda_year#
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td>



<FORM action="./title_rep_display_up.cfm?user_id = #user_id#&sortorder=#sortorder#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&title_id=#title_id#&oda_month=#oda_month#&oda_day=#oda_day#&oda_year=#oda_year#&company_id=#company_ID#&a_trigger=1">
<cfif #user_id# is not ""><input type="hidden" name="user_id" value="#user_id#"></cfif>
<cfif #sortorder# is not ""><input type="hidden" name="sortorder" value="#sortorder#"></cfif>
<cfif #comments# is not ""><input type="hidden" name="comments" value="#comments#"></cfif>


<cfif #title_id# is not ""><input type="hidden" name="title_id" value="#title_id#"></cfif>
<cfif #oda_month# is not ""><input type="hidden" name="oda_month" value="#oda_month#"></cfif>
<cfif #oda_day# is not ""><input type="hidden" name="oda_day" value="#oda_day#"></cfif>
<cfif #oda_year# is not ""><input type="hidden" name="oda_year" value="#oda_year#"></cfif>
<cfif #appraisal_status# is not ""><input type="hidden" name="appraisal_status" value="#appraisal_status#"></cfif>
<cfif #company_id# is not ""><input type="hidden" name="company_id" value="#company_id#"></cfif>
<cfif #Trim(buyer_lname)# is not ""><input type="hidden" name="buyer_lname" value="#buyer_lname#"></cfif>
<cfif #Trim(buyer_fname)# is not ""><input type="hidden" name="buyer_fname" value="#buyer_fname#"></cfif>
<cfif #Trim(seller_lname)# is not ""><input type="hidden" name="seller_lname" value="#seller_lname#"></cfif>
<cfif #Trim(seller_fname)# is not ""><input type="hidden" name="seller_fname" value="#seller_fname#"></cfif>
<INPUT type="hidden" name="update" value="yes">
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al">
	<td bgcolor=#a_bgcolor# width=40 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	  	<select name="appraisal_status"
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
	<cfif #appraisal_status# is not "open">
	 <option value="#appraisal_status#" style="thin" selected >#appraisal_status#
	<cfelse>
	  <option value="In Process" style="thin" selected>In Process</OPTION>
	 </cfif>
	  <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
    <option value="Delayed" style="thin">Delayed</OPTION>
	<option value="Loan Closed" style="thin"> Loan Closed</OPTION>
	<option value="Closing Requested" style="thin">Closing Requested</OPTION>
	<option value="Closer Assigned" style="thin">Closer Assigned</OPTION>
	<option value=""></option>
	</select></td>

	<td bgcolor=#a_bgcolor# width=90 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<select name="comments"
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
	  <option value="#comments#">#comments#</OPTION>
	  <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION>
	  <option value=""></option>
	  </select></td>

	<td bgcolor=#a_bgcolor# width=30 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">

	<input type=image border=0 src="./images/button_update.gif"><!--- <input type="submit" value="Update"> --->
	</td>

	<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&oda_month=#oda_month#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
	</FORM>


		</tr>
			</CFOUTPUT>	</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->

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

	<cfelseif #a_trigger# eq "2">
		<!---- BEGIN MODIFY  ----->
<cfoutput>
		 <CFIF IsDefined("form.oda_month")><cfif #oda_month# NEQ "NONE">
	<CFSET oda_month = #oda_month#>
</cfif></CFIF>
<CFIF IsDefined("form.oda_day")><cfif #oda_day# NEQ "NONE">
	<CFSET oda_day = #oda_day#>
</cfif></CFIF>
<CFIF IsDefined("form.oda_year")><cfif #oda_year# NEQ "NONE">
	<CFSET oda_year = #oda_year#>
</cfif></CFIF>
		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>


<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	<CFSET prop_id = #title_id#>
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>



		<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM property
			WHERE 0 = 0
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
<cFIF #oda_month# NEQ "none">
				AND oda_month = '#oda_month#' </CFIF>
			<cFIF #oda_day# NEQ "none">
				AND oda_day = '#oda_day#' </CFIF>
			<cFIF #oda_year# NEQ "none">
				AND oda_year = '#oda_year#' </CFIF>

			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>



				<CFIF #prop_id# NEQ "none">
				AND prop_id = '#prop_id#'
			</CFIF>


			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY  comp_id ASC, user_id ASC, oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>






		<CFIF '#update#' EQ 'yes'>

				<CFQUERY datasource="#request.dsn#">
				UPDATE title
				SET  appraisal_status = '#appraisal_status#',
					comments = '#comments#'
				WHERE prop_id = #prop_id#
				</CFQUERY>

		</cfif>
		<CFSET r_count = #read_report.recordcount#>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=820 align=center valign=top>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=820 align=center valign=top bgcolor=e1e1e1>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
<INPUT type="hidden" name="prop_id" value="#read_report.prop_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&user_id=#user_id#&company_id=#company_id#&prop_id=#prop_id#&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=2">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>

					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&oda_day=#oda_day#&user_id=#user_id#&company_id=#company_id#&prop_id=#prop_id#&oda_year=#oda_year#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=2"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>
<INPUT type="hidden" name="prop_id" value="#read_report.prop_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&user_id=#user_id#&company_id=#company_id#&prop_id=#prop_id#&oda_day=#oda_day#&oda_year=#oda_year#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=2"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>
<INPUT type="hidden" name="prop_id" value="#read_report.prop_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&user_id=#user_id#&company_id=#company_id#&prop_id=#prop_id#&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=2">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_report.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>
<INPUT type="hidden" name="prop_id" value="#read_report.prop_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&user_id=#user_id#&company_id=#company_id#&prop_id=#prop_id#&oda_day=#oda_day#&oda_year=#oda_year#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=2">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>			</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=40 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td>

						<td bgcolor=gray width=40 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=90 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
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



						<td bgcolor=#a_bgcolor# width=40 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#oda_month#/#oda_day#/#oda_year#
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#prop_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td>



<FORM action="./title_rep_display_pro.cfm?user_id = #user_id#&sortorder=#sortorder#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.prop_id#&prop_id=#prop_id#&oda_month=#oda_month#&oda_day=#oda_day#&oda_year=#oda_year#&company_id=#company_ID#&a_trigger=2">
<cfif #user_id# is not ""><input type="hidden" name="user_id" value="#user_id#"></cfif>
<cfif #sortorder# is not ""><input type="hidden" name="sortorder" value="#sortorder#"></cfif>
<cfif #comments# is not ""><input type="hidden" name="comments" value="#comments#"></cfif>


<cfif #title_id# is not ""><input type="hidden" name="prop_id" value="#prop_id#"></cfif>
<cfif #oda_month# is not ""><input type="hidden" name="oda_month" value="#oda_month#"></cfif>
<cfif #oda_day# is not ""><input type="hidden" name="oda_day" value="#oda_day#"></cfif>
<cfif #oda_year# is not ""><input type="hidden" name="oda_year" value="#oda_year#"></cfif>
<cfif #appraisal_status# is not ""><input type="hidden" name="appraisal_status" value="#appraisal_status#"></cfif>
<cfif #company_id# is not ""><input type="hidden" name="company_id" value="#company_id#"></cfif>
<cfif #Trim(buyer_lname)# is not ""><input type="hidden" name="buyer_lname" value="#buyer_lname#"></cfif>
<cfif #Trim(buyer_fname)# is not ""><input type="hidden" name="buyer_fname" value="#buyer_fname#"></cfif>
<cfif #Trim(seller_lname)# is not ""><input type="hidden" name="seller_lname" value="#seller_lname#"></cfif>
<cfif #Trim(seller_fname)# is not ""><input type="hidden" name="seller_fname" value="#seller_fname#"></cfif>
<INPUT type="hidden" name="update" value="yes">
<INPUT type="hidden" name="prop_id" value="#read_report.prop_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al">
	<td bgcolor=#a_bgcolor# width=40 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	  	<select name="appraisal_status"
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
	<cfif #appraisal_status# is not "open">
	 <option value="#appraisal_status#" style="thin" selected >#appraisal_status#
	<cfelse>
	  <option value="In Process" style="thin" selected>In Process</OPTION>
	 </cfif>
	  <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
    <option value="Delayed" style="thin">Delayed</OPTION>
	<option value="Loan Closed" style="thin"> Loan Closed</OPTION>
	<option value="Closing Requested" style="thin">Closing Requested</OPTION>
	<option value="Closer Assigned" style="thin">Closer Assigned</OPTION>
	<option value=""></option>
	</select></td>

	<td bgcolor=#a_bgcolor# width=90 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<select name="comments"
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
	  <option value="#comments#">#comments#</OPTION>
	  <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION>
	  <option value=""></option>
	  </select></td>

	<td bgcolor=#a_bgcolor# width=30 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">

	<input type=image border=0 src="./images/button_update.gif"><!--- <input type="submit" value="Update"> --->
	</td>

	<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&oda_month=#oda_month#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
	</FORM>


		</tr>
			</CFOUTPUT>	</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->

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

	<cfelse>

		<!---- BEGIN MODIFY  ----->
<cfoutput>
		 <CFIF IsDefined("form.oda_month")><cfif #oda_month# NEQ "NONE">
	<CFSET oda_month = #oda_month#>
</cfif></CFIF>
<CFIF IsDefined("form.oda_day")><cfif #oda_day# NEQ "NONE">
	<CFSET oda_day = #oda_day#>
</cfif></CFIF>
<CFIF IsDefined("form.oda_year")><cfif #oda_year# NEQ "NONE">
	<CFSET oda_year = #oda_year#>
</cfif></CFIF>
		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>


<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	<CFSET title_id = #title_id#>
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>



		<CFQUERY datasource="#request.dsn#" NAME="read_report">

SELECT *
FROM Title C, Title_Closing_Order_Request O
WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL



			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
<cFIF #oda_month# NEQ "none">
				AND oda_month = '#oda_month#' </CFIF>
			<cFIF #oda_day# NEQ "none">
				AND oda_day = '#oda_day#' </CFIF>
			<cFIF #oda_year# NEQ "none">
				AND oda_year = '#oda_year#' </CFIF>

			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF>
			<CFIF #comments# NEQ "none">
				AND comments = '#comments#'

			</CFIF>



				<CFIF #title_id# NEQ "none">
				AND c.title_id = '#title_id#'
			</CFIF>


			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#


 	<CFELSE>
		 ORDER BY  comp_id ASC, user_id ASC, oda_month DESC, oda_day DESC, oda_year DESC
		</cfif> </CFQUERY>






		<CFIF '#update#' EQ 'yes'>

				<CFQUERY datasource="#request.dsn#">
				UPDATE title
				SET  appraisal_status = '#appraisal_status#',
					comments = '#comments#'
				WHERE title_id = #title_id#
				</CFQUERY>

		</cfif>
		<CFSET r_count = #read_report.recordcount#>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=820 align=center valign=top>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=820 align=center valign=top bgcolor=e1e1e1>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Commitment Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=3">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>

					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&oda_day=#oda_day#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&oda_year=#oda_year#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=3"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&oda_day=#oda_day#&oda_year=#oda_year#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=3"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&oda_year=#oda_year#&oda_day=#oda_day#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=3">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_report.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_rep_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&oda_day=#oda_day#&oda_year=#oda_year#&oda_month=#oda_month#&comments=#comments#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=3">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>			</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=40 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<!--- <td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td>

						<td bgcolor=gray width=40 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=90 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
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



						<td bgcolor=#a_bgcolor# width=40 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#oda_month#/#oda_day#/#oda_year#
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td>



<FORM action="./title_rep_display_up.cfm?user_id = #user_id#&sortorder=#sortorder#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&title_id=#title_id#&oda_month=#oda_month#&oda_day=#oda_day#&oda_year=#oda_year#&company_id=#company_ID#&a_trigger=3">
<cfif #user_id# is not ""><input type="hidden" name="user_id" value="#user_id#"></cfif>
<cfif #sortorder# is not ""><input type="hidden" name="sortorder" value="#sortorder#"></cfif>
<cfif #comments# is not ""><input type="hidden" name="comments" value="#comments#"></cfif>


<cfif #title_id# is not ""><input type="hidden" name="title_id" value="#title_id#"></cfif>
<cfif #oda_month# is not ""><input type="hidden" name="oda_month" value="#oda_month#"></cfif>
<cfif #oda_day# is not ""><input type="hidden" name="oda_day" value="#oda_day#"></cfif>
<cfif #oda_year# is not ""><input type="hidden" name="oda_year" value="#oda_year#"></cfif>
<cfif #appraisal_status# is not ""><input type="hidden" name="appraisal_status" value="#appraisal_status#"></cfif>
<cfif #company_id# is not ""><input type="hidden" name="company_id" value="#company_id#"></cfif>
<cfif #Trim(buyer_lname)# is not ""><input type="hidden" name="buyer_lname" value="#buyer_lname#"></cfif>
<cfif #Trim(buyer_fname)# is not ""><input type="hidden" name="buyer_fname" value="#buyer_fname#"></cfif>
<cfif #Trim(seller_lname)# is not ""><input type="hidden" name="seller_lname" value="#seller_lname#"></cfif>
<cfif #Trim(seller_fname)# is not ""><input type="hidden" name="seller_fname" value="#seller_fname#"></cfif>
<INPUT type="hidden" name="update" value="yes">
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al">
	<td bgcolor=#a_bgcolor# width=40 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	  	<select name="appraisal_status"
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
	<cfif #appraisal_status# is not "open">
	 <option value="#appraisal_status#" style="thin" selected >#appraisal_status#
	<cfelse>
	  <option value="In Process" style="thin" selected>In Process</OPTION>
	 </cfif>
	  <option value="In Process" style="thin">In Process</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
    <option value="Delayed" style="thin">Delayed</OPTION>
	<option value="Loan Closed" style="thin"> Loan Closed</OPTION>
	<option value="Closing Requested" style="thin">Closing Requested</OPTION>
	<option value="Closer Assigned" style="thin">Closer Assigned</OPTION>
	<option value=""></option>
	</select></td>

	<td bgcolor=#a_bgcolor# width=90 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<select name="comments"
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
	  <option value="#comments#">#comments#</OPTION>
	  <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
	  <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION>
	  <option value=""></option>
	  </select></td>

	<td bgcolor=#a_bgcolor# width=30 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">

	<input type=image border=0 src="./images/button_update.gif"><!--- <input type="submit" value="Update"> --->
	</td>

	<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>


		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
	</FORM>


		</tr>
			</CFOUTPUT>	</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->

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


	</cfif>