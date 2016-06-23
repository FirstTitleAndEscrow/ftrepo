<cfparam name="a_trigger" default=0>
<cfparam name="company_id" default="">
<CFPARAM NAME="a_flag" DEFAULT="">
 <cfparam name="buyer_lname" default="">
<cfparam name="buyer_fname" default="">
<cfparam name="sortorder" default="">

<cfparam name="oda_month" default="">
<cfparam name="title_id" default="">
<cfparam name="prop_id" default="">

<CFSET r_count = "0">




	<!---- BEGIN MODIFY  ----->
 <cfoutput>


<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	<CFSET title_id = #title_id#>
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	<CFSET prop_id = #prop_id#>
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


<cfoutput>
<cfif #a_trigger# EQ "1">



	<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">

			SELECT *
			FROM abstractors
			WHERE username = '#url.username#' and password = '#url.password#'

	</CFQUERY>


		<cfif #read_abstractor.Abstractor_ID# eq 1481>

	<cfif #prop_id# EQ "NONE">

		<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">

			SELECT *
			FROM abstractors a, doc_abstract_title b, title c
			WHERE (c.cancelled IS NULL or c.cancelled = 0) and (a.abstractor_id = b.abstractor_id or a.abstractor_id = b.abstractor_tax_id or a.abstractor_id = b.abstractor_id_3) and  b.title_id = c.title_id and b.chandresh_access = 1
<CFIF #title_id# NEQ "none">
				AND b.title_id = '#title_id#'
			</CFIF>

			<CFIF #oda_month# NEQ "none">
				AND c.oda_month = '#oda_month#'
			</CFIF>
 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>
</CFQUERY>

	<cfelse>

	<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">

			SELECT *
			FROM abstractors a, doc_abstract_prop b, property c
			WHERE (c.cancelled IS NULL or c.cancelled = 0) and (a.abstractor_id = b.abstractor_id or a.abstractor_id = b.abstractor_tax_id or a.abstractor_id = b.abstractor_id_3) and  b.prop_id = c.prop_id
<CFIF #prop_id# NEQ "none">
				AND b.prop_id = '#prop_id#'
			</CFIF>

			<CFIF #oda_month# NEQ "none">
				AND c.oda_month = '#oda_month#'
			</CFIF>
 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>
</CFQUERY>


	</cfif>




		<cfelse>

<cfif #prop_id# EQ "NONE">

<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">

			SELECT *
			FROM abstractors a, doc_abstract_title b, title c
			WHERE (c.cancelled IS NULL or c.cancelled = 0) and (a.abstractor_id = b.abstractor_id or a.abstractor_id = b.abstractor_tax_id or a.abstractor_id = b.abstractor_id_3) and username = '#url.username#' and password = '#url.password#' and b.title_id = c.title_id
<CFIF #title_id# NEQ "none">
				AND b.title_id = '#title_id#'
			</CFIF>

			<CFIF #oda_month# NEQ "none">
				AND c.oda_month = '#oda_month#'
			</CFIF>
 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>
</CFQUERY>

<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">

			SELECT *
			FROM abstractors a, doc_abstract_prop b, property c
			WHERE (c.cancelled IS NULL or c.cancelled = 0) and (a.abstractor_id = b.abstractor_id or a.abstractor_id = b.abstractor_tax_id or a.abstractor_id = b.abstractor_id_3) and username = '#url.username#' and password = '#url.password#' and b.prop_id = c.prop_id
<CFIF #prop_id# NEQ "none">
				AND b.prop_id = '#prop_id#'
			</CFIF>

			<CFIF #oda_month# NEQ "none">
				AND c.oda_month = '#oda_month#'
			</CFIF>
 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>
</CFQUERY>


</cfif>


</cfif>



<CFSET r_count = #read_abstractor_order.recordcount#>
<cfelseif #a_trigger# eq "2">


<CFQUERY datasource="#request.dsn#" NAME="read_closer_order">

			SELECT *
			FROM closer a, doc_closer_title b, title c
			WHERE a.closer_id = b.closer_id and username = '#user#' and password = '#pass#' and b.title_id = c.title_id

			<CFIF #title_id# NEQ "none">
				AND b.title_id = '#title_id#'
			</CFIF>
<CFIF #oda_month# NEQ "none">
				AND c.oda_month = '#oda_month#'
			</CFIF>
 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>

			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>
</CFQUERY>





<CFSET r_count = #read_closer_order.recordcount#>
<cfelse>







<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">

			SELECT *
			FROM abstractors
			WHERE username = '#url.username#' and password = '#url.password#'

	</CFQUERY>


	<cfif #this_property_order# EQ "NONE">

		<cfif ListGetAt(form.this_title_order, 2, ",") EQ 1>
		<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">
		    SELECT *
			FROM pay_off_lender_1_title a, title b
			WHERE a.title_id = b.title_id
            <CFIF #this_title_order# NEQ "none">
				AND b.title_id = '#ListGetAt(form.this_title_order, 1, ",")#'
			</CFIF>
        </CFQUERY>
		<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">
		    SELECT *
			FROM pay_off_lender_2_title a, title b
			WHERE a.title_id = b.title_id
            <CFIF #this_title_order# NEQ "none">
				AND b.title_id = '#ListGetAt(form.this_title_order, 1, ",")#'
			</CFIF>
        </CFQUERY>
		</cfif>

	<cfelse>
	<cfif ListGetAt(form.this_property_order, 2, ",") EQ 1>
	      <CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">
		     SELECT *
			FROM pay_off_lender_1_Prop a, Property b
			WHERE a.prop_id = b.prop_id
            <CFIF #this_property_order# NEQ "none">
				AND b.prop_id = '#ListGetAt(form.this_property_order, 1, ",")#'
			</CFIF>
           </CFQUERY>
		   <cfelse>
		   <CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">
		     SELECT *
			FROM pay_off_lender_2_Prop a, Property b
			WHERE a.prop_id = b.prop_id
            <CFIF #this_property_order# NEQ "none">
				AND b.prop_id = '#ListGetAt(form.this_property_order, 1, ",")#'
			</CFIF>
           </CFQUERY>
		   </cfif>


	</cfif>





<CFSET r_count = #read_abstractor_order.recordcount#>

</cfif>







</cfoutput>

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
<cfif #a_trigger# eq "3">

<cfoutput>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Payoff Upload</B></CENTER>
			</TD>
		</TR>
</table>


Please click the "Browse" button and select the file to upload, then click "Upload File" to complete the Payoff Upload.<br>
<br>


<FORM action="./vendor_payoff_upload.cfm" ENCTYPE="multipart/form-data" method="post">
<input type="hidden" name="username" value="#url.username#">
<input type="hidden" name="password" value="#url.password#">
<cfif this_title_order NEQ 'NONE'>
<input type="hidden" name="payoff_id" value="#ListGetAt(form.this_title_order, 1)#">
<input type="hidden" name="payoff_num" value="#ListGetAt(form.this_title_order, 2)#">
<input type="hidden" name="payoff_type" value="title">
<cfelse>
<input type="hidden" name="payoff_id" value="#ListGetAt(form.this_property_order, 1)#">
<input type="hidden" name="payoff_num" value="#ListGetAt(form.this_property_order, 2)#">
<input type="hidden" name="payoff_type" value="property">
</cfif>

<input type="hidden" name="uid" value="264">

<input type="file" name="file_upload">
<input type="submit" value="Upload File">

</CFOUTPUT>
</FORM>

<cfelseif #a_trigger# EQ "1">


<cfif #prop_id# EQ "NONE">

<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Abstractor Report Search</B></CENTER>
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
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_abstractor_order.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
	<A HREF=".vendor_view_orders.cfm?username=#url.username#&password=#url.password#&rec_id=#read_abstractor_order.title_id#&title_id=#title_id#&prop_id=#prop_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>
					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./vendor_view_orders.cfm?username=#url.username#&password=#url.password#&rec_id=#read_abstractor_order.title_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&title_id=#title_id#&prop_id=#prop_id#&a_trigger=1"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>

	<A HREF="./vendor_view_orders.cfm?username=#url.username#&password=#url.password#&rec_id=#read_abstractor_order.title_id#&title_id=#title_id#&prop_id=#prop_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=1"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_abstractor_order.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>

	<A HREF="./vendor_view_orders.cfm?username=#url.username#&password=#url.password#&rec_id=#read_abstractor_order.title_id#&title_id=#title_id#&prop_id=#prop_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_abstractor_order.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_abstractor_order.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>

	<A HREF="./vendor_view_orders.cfm?username=#url.username#&password=#url.password#&rec_id=#read_abstractor_order.title_id#&title_id=#title_id#&prop_id=#prop_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>		</TD>
				</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>

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
						
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
						</td>

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<!--- <td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td>

						<td bgcolor=gray width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td> --->
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

	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="read_abstractor_order" startrow="#count#" endrow="#count_end#">


			<CFOUTPUT>


		<CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">
			SELECT t.*, c.ID, c.company
			FROM title t, companies c
			WHERE t.title_id = #read_abstractor_order.title_id#
			and c.ID = t.comp_id
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
							#read_title_abstract.Company#
						</td>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.BFirstName1# #read_title_abstract.BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.BFirstName2# #read_title_abstract.BLastName2#
						</td>


						<td bgcolor=#a_bgcolor# width=160 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #read_title_abstract.title_id# and access2 = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif #read_all_notes.recordcount# gt "0">
							<a href="./view_title_comments_vendor.cfm?username=#url.username#&password=#url.password#&prop_id=#prop_id#&rec_id=#title_id#&a_trigger=1&title_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">view</a>

							<cfelse>

							</cfif>
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_abstract_doc_view_c.cfm?username=#url.username#&password=#url.password#&prop_id=#prop_id#&rec_id=#title_id#&a_trigger=1&title_id=#title_id#&company_id=#company_id#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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




		<cfelse>





		<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Abstractor Report Search</B></CENTER>
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
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_abstractor_order.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
	<A HREF=".vendor_view_orders.cfm?username=#url.username#&password=#url.password#&rec_id=#read_abstractor_order.prop_id#&title_id=#title_id#&prop_id=#prop_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>
					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./vendor_view_orders.cfm?username=#url.username#&password=#url.password#&rec_id=#read_abstractor_order.prop_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&title_id=#title_id#&prop_id=#prop_id#&a_trigger=1"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>

	<A HREF="./vendor_view_orders.cfm?username=#url.username#&password=#url.password#&rec_id=#read_abstractor_order.prop_id#&title_id=#title_id#&prop_id=#prop_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=1"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_abstractor_order.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>

	<A HREF="./vendor_view_orders.cfm?username=#url.username#&password=#url.password#&rec_id=#read_abstractor_order.prop_id#&title_id=#title_id#&prop_id=#prop_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_abstractor_order.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_abstractor_order.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>

	<A HREF="./vendor_view_orders.cfm?username=#url.username#&password=#url.password#&rec_id=#read_abstractor_order.prop_id#&title_id=#title_id#&prop_id=#prop_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>		</TD>
				</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>

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

						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
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

	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="read_abstractor_order" startrow="#count#" endrow="#count_end#">


			<CFOUTPUT>


		<CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">

			SELECT p.*, c.id, c.company
			FROM property p, companies c
			WHERE p.prop_id = #read_abstractor_order.prop_id#
			and c.id = p.comp_id



       </CFQUERY>
<tr>
						  <td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.prop_id#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.oda_month#/#read_title_abstract.oda_day#/#read_title_abstract.oda_year#
						</td>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_abstract.company#
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
				Where Order_Id = #read_title_abstract.prop_id# and access2 = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif #read_all_notes.recordcount# gt "0">
							<a href="./view_title_comments_vendor.cfm?username=#url.username#&password=#url.password#&rec_id=#prop_id#&a_trigger=1&title_id=#title_id#&prop_id=#prop_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">view</a>

							<cfelse>

							</cfif>
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_abstract_doc_view_c.cfm?username=#url.username#&password=#url.password#&rec_id=#prop_id#&a_trigger=1&title_id=#title_id#&prop_id=#prop_id#&company_id=#company_id#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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








		</cfif>






















		<cfelse>
			<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closer Report Search</B></CENTER>
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
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_closer_order.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT>
	<A HREF=".vendor_view_orders.cfm?user=#url.user#&pass=#url.pass#&rec_id=#read_closer_order.title_id#&title_id=#title_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=2">
				Next Screen</a></CFOUTPUT>
				</CFIF>

			<CFELSE><font size="2">

				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10>
					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT>
	<A HREF="./vendor_view_orders.cfm?user=#url.user#&pass=#url.pass#&rec_id=#read_closer_order.title_id#&title_id=#title_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=2"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT>

	<A HREF="./vendor_view_orders.cfm?user=#url.user#&pass=#url.pass#&rec_id=#read_abstractor_order.title_id#&title_id=#title_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=2"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>

				<CFIF #count_forward# GTE #read_abstractor_closer.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE>
				<CFOUTPUT>

	<A HREF="./vendor_view_orders.cfm?user=#url.user#&pass=#url.pass#&rec_id=#read_closer_order.title_id#&title_id=#title_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=2">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>

			</CFIF>

		<CFELSE>
		<!---------------------------------------------------->
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_closer_order.recordcount# LT 10>

			<CFELSE><font size="2">

				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_closer_order.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT>

	<A HREF="./vendor_view_orders.cfm?user=#url.user#&pass=#url.pass#&rec_id=#read_closer_order.title_id#&title_id=#title_id#&oda_month=#oda_month#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=2">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>

			</CFIF>
		</CFIF>		</TD>
				</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>



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

						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Company
						</td>

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

					<!--- 	<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td>

						<td bgcolor=gray width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td> --->
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

	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>
		<CFELSE>
			<CFSET count = 1>
		</CFIF>

		<CFSET count_end = #count# + 9>

			 <CFLOOP QUERY="read_closer_order" startrow="#count#" endrow="#count_end#">


			<CFOUTPUT>

<CFQUERY datasource="#request.dsn#" NAME="read_title_closer">

			SELECT t.*, c.id, c.company
			FROM title t, companies c
			WHERE t.title_id = #read_closer_order.title_id#
			and c.ID = t.comp_id



</CFQUERY>

					<tr>

						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_closer.title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_closer.oda_month#/#read_title_closer.oda_day#/#read_title_closer.oda_year#
						</td>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_closer.company#
						</td>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_closer.BFirstName1# #read_title_closer.BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_closer.BFirstName2# #read_title_closer.BLastName2#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_closer.duedate#
						</td>
						<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_closer.do_appraisal#
						</td>
                       <td bgcolor=#a_bgcolor# width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_title_closer.appraisal_status#
						</td> --->
						<td bgcolor=#a_bgcolor# width=160 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #read_title_closer.title_id# and access2 = 1
				ORDER BY Note_ID ASC
			</CFQUERY>
							<cfif #read_all_notes.recordcount# gt "0">
							<a href="./view_title_comments_vendor.cfm?username=#url.user#&password=#url.pass#&rec_id=#title_id#&a_trigger=1&title_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=400,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">view</a>

							<cfelse>

							</cfif>
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_doc_view_c.cfm?user=#url.user#&pass=#url.pass#&a_trigger=2&rec_id=#title_id#&title_id=#title_id#&company_id=#company_id#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
		<!--- <nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>	 --->
				</cfif>




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


