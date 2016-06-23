<cfparam name="company_id" default="">
<CFPARAM NAME="a_flag" DEFAULT="">
 <cfparam name="buyer_lname" default="">
<cfparam name="buyer_fname" default="">
<cfparam name="sortorder" default="">

<cfparam name="oda_month" default="">
<cfparam name="title_id" default="">
<cfparam name="prop_id" default="">




	<!---- BEGIN MODIFY  ----->
 <cfoutput>


<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	<CFSET title_id = #title_id#>
</cfif></CFIF>
  <CFIF IsDefined("form.oda_month")><cfif #oda_month# NEQ "NONE">
	<CFSET oda_month = #oda_month#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>




	<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">

			SELECT *
			FROM abstractors
			WHERE abstractor_id = #form.uid#

	</CFQUERY>





	<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">

			SELECT *
			FROM abstractors a, title b
			WHERE b.deed_prep_assigned_to = #read_abstractor.abstractor_id#
			and a.abstractor_id = b.deed_prep_assigned_to
			and deed_prep_completed is NULL
			<CFIF #oda_month# NEQ "none">
				AND c.oda_month = '#oda_month#'
			</CFIF>
 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>
 <CFIF IsDefined("FORM.title_id") and form.title_id neq 'NONE'>
				AND (title_id = #form.title_id#)
			</CFIF>
</CFQUERY>

<cfset r_count = read_abstractor_order.recordcount>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=780 align=center valign=top>

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
				<CENTER><B>Deed Preparation Search</B></CENTER>
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




			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Number
						</td>

						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>


						<td bgcolor=gray width=160 align=center valign=top>
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


			 <CFLOOP QUERY="read_abstractor_order">


			<CFOUTPUT>


		<CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">

			SELECT *
			FROM title
			WHERE title_id = #read_abstractor_order.title_id#



       </CFQUERY>
<tr>
						  <td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.oda_month#/#read_title_abstract.oda_day#/#read_title_abstract.oda_year#
						</td>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.BFirstName1# #read_title_abstract.BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.BFirstName2# #read_title_abstract.BLastName2#
						</td>

					<!--- 	<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.duedate#
						</td>
						<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.do_appraisal#
						</td>
                       <td bgcolor=#a_bgcolor# width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.appraisal_status#
						</td> --->
						<td bgcolor=#a_bgcolor# width=160 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #read_title_abstract.title_id# and access2 = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif #read_all_notes.recordcount# gt "0">
							<a href="./view_title_comments_vendor.cfm?username=#read_abstractor.username#&password=#read_abstractor.password#&rec_id=#title_id#&a_trigger=1&title_id=#title_id#&prop_id=0&company_id=#company_id#" target="comments_window" onClick="window.open('','comments_window','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">view</a>

							<cfelse>

							</cfif>
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./deed_prep_doc_view.cfm?uid=#read_abstractor.abstractor_id#&rec_id=#prop_id#&a_trigger=1&title_id=#title_id#&prop_id=#prop_id#&company_id=#company_id#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
						</td>


	<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</tr></CFOUTPUT>			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->
			</table>
		<!--- <nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>		 --->




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


