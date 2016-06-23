<!-- 12/01/05 Sazan added the condition inside TD to change color of purchase orders (searchType=Purchase)  to 00ffff -->


<cfparam name="form.excel" default=0>
<cfparam name="form.a_trigger" default=1>
<cfparam name="form.buyer_lname" default="all">
<cfparam name="form.buyer_lname" default="">
<cfparam name="form.buyer_fname" default="">
<cfparam name="form.appraisal_status" default="NONE">
<cfparam name="form.closing_status" default="NONE">
<cfparam name="form.sortorder" default="NONE">
<cfparam name="form.user_id" default="NONE">
<cfparam name="form.confirm_mon" default="Month">
<cfparam name="form.comfirm_day" default="Day">
<cfparam name="form.confirm_year" default="Year">
<cfparam name="form.comfirm_day_to" default="Month">
<cfparam name="form.confirm_mon_to" default="Day">
<cfparam name="form.confirm_year_to" default="Year">
<cfparam name="form.title_id" default="">
<cfparam name="form.app_id" default="">
<cfparam name="form.product" default="">
<cfparam name="form.anc_id" default="">
<cfparam name="form.cr_id" default="">
<cfparam name="form.avm_id" default="">
<cfparam name="form.sn_id" default="">
<cfparam name="form.prop_id" default="">
<cfparam name="form.order_id" default="">
<cfparam name="form.abstract_id" default="">
<cfparam name="form.company_id" default="NONE">
<cfparam name="url.a_trigger" default="0">
<cfparam name="form.loan_number" default="">
<CFSET r_count = "0">






<CFIF form.excel eq 1>
<cfset excel = 1>
<cfelse>
<cfset excel = 0>
</cfif>


<cfoutput>
<cfif #excel# EQ 1>
	<cfset filename = "file.xls">
		<cfcontent type="application/vnd.ms-excel">
<cfheader name="Content-Disposition" value="attachment; filename=#filename#">
#filename#
</cfif>
</cfoutput>



<CFINCLUDE TEMPLATE="./includes/companies.cfm">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<script language="javascript">

function to_excel() {
document.excel_form.submit();
}
</script>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
<cfoutput>
<form name="excel_form" action="https://#cgi.server_name#/admin_area/title_rep_display.cfm?uid=#URL.uid#&al=#URL.al#" method="post">
<input type="hidden" name="excel" value="1">

<input type="hidden" name="buyer_lname" value="#form.buyer_lname#">
<input type="hidden" name="buyer_fname" value="#form.buyer_fname#">
<input type="hidden" name="appraisal_status" value="#form.appraisal_status#">
<input type="hidden" name="sortorder" value="#form.sortorder#">
<input type="hidden" name="user_id" value="#form.user_id#">
<input type="hidden" name="confirm_mon" value="#form.confirm_mon#">
<input type="hidden" name="comfirm_day" value="#form.comfirm_day#">
<input type="hidden" name="confirm_year" value="#form.confirm_year#">
<input type="hidden" name="comfirm_day_to" value="#form.comfirm_day_to#">
<input type="hidden" name="confirm_mon_to" value="#form.confirm_mon_to#">
<input type="hidden" name="confirm_year_to" value="#form.confirm_year_to#">
<input type="hidden" name="title_id" value="#form.title_id#">
<input type="hidden" name="app_id" value="#form.app_id#">
<input type="hidden" name="product" value="#form.product#">
<input type="hidden" name="anc_id" value="#form.anc_id#">
<input type="hidden" name="cr_id" value="#form.cr_id#">
<input type="hidden" name="avm_id" value="#form.avm_id#">
<input type="hidden" name="sn_id" value="#form.sn_id#">
<input type="hidden" name="prop_id" value="#form.prop_id#">
<input type="hidden" name="order_id" value="#form.order_id#">
<input type="hidden" name="abstract_id" value="#form.abstract_id#">
<input type="hidden" name="company_id" value="#form.company_id#">
<input type="hidden" name="a_trigger" value="#form.a_trigger#">
<input type="hidden" name="loan_number" value="#form.loan_number#">
</form>
</cfoutput>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="excel_submit" type="button" onclick="to_excel();" value="EXPORT TO EXCEL"><br>

<br>
<CENTER>
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=820 align=center valign=top>
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=820 align=center valign=top bgcolor=e1e1e1>
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput>
            <font color = white><b>
        <cfif #form.confirm_mon# NEQ "Month">
	        From #form.confirm_mon#/
        </cfif>
        <cfif #form.comfirm_day# NEQ "Day">
            #form.comfirm_day#
        </cfif>
        <cfif #form.confirm_year# NEQ "Year">
            /#form.confirm_year#
        </cfif>
        <cfif #form.confirm_mon_to# NEQ "Month">
    	    TO #form.confirm_mon_to#/
        </cfif>
        <cfif #form.comfirm_day_to# NEQ "Day">
            /#form.comfirm_day_to#/
        </cfif>
        <cfif #form.confirm_year_to# NEQ "Year">
            /#form.confirm_year_to#,
        </cfif>
        <cfif #form.appraisal_status# NEQ "NONE">
	        #form.appraisal_status#,
        </cfif>
         <cfif #form.title_id# NEQ "">
	        #form.title_id#,
        </cfif>
        <cfif #form.order_id# NEQ "">
	        #form.order_id#,
        </cfif>
        <cfif #form.prop_id# NEQ "">
	        #form.prop_id#,
        </cfif>
        <cfif #form.company_id# EQ "NONE">
	        'ALL CLIENTS',
        </cfif>
         <cfif #Trim(form.buyer_fname)# is not "">
	        #form.buyer_fname#,
        </cfif>
         <cfif #Trim(form.buyer_lname)# is not "">
    	    #form.buyer_lname#,
        </cfif>
     </b></font>
</cfoutput>
	    </td>
    </tr>
</table>

 	<!---- BEGIN TITLE SEARCH  ----->
<cfif form.product eq "title" or form.product eq "all">

    <CFQUERY datasource="#request.dsn#" NAME="read_report">
	    SELECT t.*, c.Company
		FROM Title t, Companies c
		WHERE t.cancelled is null
    <cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
        <CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
		<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>
        and (t.order_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	</cfif>
	<cfif #form.user_id# NEQ "NONE">
        and t.user_id = '#form.user_id#'
    </cfif>
    <CFIF #form.appraisal_status# NEQ "NONE">
	    AND t.appraisal_status = '#form.appraisal_status#'
	</CFIF>
	<CFIF #form.loan_number# NEQ "">
	    AND t.loan_number = '#form.loan_number#'
    </CFIF>
	<CFIF #form.title_id# NEQ "">
	    AND t.title_id = '#form.title_id#'
	</CFIF>
	<CFIF #form.company_id# NEQ "NONE">
	   AND (t.comp_id IN (#form.company_id#) or t.comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	<cfelse>
	    AND t.comp_ID IN(#full_list_comp_ids#)
	</CFIF>
	<CFIF form.buyer_fname neq "">
	    AND (t.bfirstname1 LIKE '%#form.buyer_fname#%' OR t.bfirstname2 LIKE '%#form.buyer_fname#%')
	</CFIF>
	<CFIF form.buyer_lname neq "">
	    AND (t.blastname1 LIKE '%#form.buyer_lname#%' OR t.blastname2 LIKE '%#form.buyer_lname#%')
	</CFIF>
	and c.ID = t.comp_id
	<cfif #form.sortorder# NEQ "NONE">
	    ORDER BY #form.sortorder#
	<CFELSE>
	ORDER BY  company, order_date asc
</cfif>
</CFQUERY>

<CFSET r_count = #read_report.recordcount#>





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
		</TD>
	</TR>
	<tr>
	    <td width=820 align=left valign=top bgcolor=d3d3d3>
		<!---------------------------------------------------->
		<!--- AT FIRST RECORD --->
		<!---------------------------------------------------->
<table width=820 cellpadding=1 cellspacing=1 border=0>
    <tr>
	    <td bgcolor=gray width=50 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			Order Date
		</td>
		<td bgcolor=gray width=50 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			Order Num
		</td>
		<td bgcolor=gray width=130 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			Borrower 1
		</td>
		<td bgcolor=gray width=130 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			Client
		</td>
        <td bgcolor=gray width=58 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			Duedate/Date Sent
		</td>
		<td bgcolor=gray width=120 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			Status
		</td>
		<td bgcolor=gray width=60 align=center valign=top>
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

    <CFLOOP QUERY="read_report">

    <CFOUTPUT>

    <CFQUERY datasource="#request.dsn#" NAME="read_company">
	    SELECT *
		FROM companies
		where ID = #read_report.comp_id#
	</CFQUERY>

    <CFQUERY datasource="#request.dsn#" NAME="read">
	    SELECT *
		FROM Doc_Title_Insurance_Title
		WHERE title_id = #title_id#
	</CFQUERY>
    <tr  >
	    <td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=50 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(check_date, "m/d/yyyy")#
		</td>
		<td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=50 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			T-#title_id#
		</td>
        <td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=130 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			#BFirstName1# #BLastName1#
		</td>
        <td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=130 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			#read_company.company#
		</td>
        <td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=58 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			<cfif #read.a_recieved_date# neq "">
			    #DateFormat(read.a_recieved_date, "m/d/yyyy")# #TimeFormat(read.a_recieved_time, "HH:mm:ss")#
			<cfelse>
                #DateFormat(duedate, "m/d/yyyy")#
            </cfif>
        </td>
        <td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	        #appraisal_status#
        </td>
        <td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	        <a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=0&code=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	    </td>
        <td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=50 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			<a href="./title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#&code=T"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	    </td>
	    <CFIF #a_color_trigger# eq "1">
		    <CFSET a_bgcolor = "white">
			<CFSET a_color_trigger = "2">
		<CFELSE>
		    <CFSET a_bgcolor = "d3d3d3">
			<CFSET a_color_trigger = "1">
		</CFIF>
	</tr>

    </tr>
    </CFOUTPUT>
    </CFLOOP>
</table>
        </TD>
    </TR>
</table>
        </TD>
    </TR>
</table>
<CFFLUSH>
</cfif>

<!---- END TITLE SEARCH  ----->



<!---- BEGIN PROPERTY SEARCH  ----->
<cfif form.product eq "property" or form.product eq "all">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT p.*, c.Company
			FROM property p, Companies c
			WHERE 0 = 0

			<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (p.check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #form.user_id# NEQ "NONE">
and p.user_id = '#form.user_id#'
</cfif>
			<CFIF #form.appraisal_status# NEQ "none">
				AND p.appraisal_status = '#form.appraisal_status#'
			</CFIF>
			<CFIF #form.loan_number# NEQ "">
				AND p.loan_number = '#form.loan_number#'
			</CFIF>
				<CFIF #form.prop_id# NEQ "">
				AND p.prop_id = '#form.prop_id#'
			</CFIF>
			 <CFIF #form.company_id# NEQ "none">
	        AND (p.comp_id IN (#form.company_id#) or p.comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND p.comp_ID IN(#full_list_comp_ids#)
	          </CFIF>
			 <CFIF FORM.buyer_fname neq "">
				AND (p.bfirstname1 LIKE '%#form.buyer_fname#%' OR p.bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>
			<CFIF FORM.buyer_lname neq "">
				AND (p.blastname1 LIKE '%#form.buyer_lname#%' OR p.blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>
			and c.ID = p.comp_id

		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	 	<CFELSE>
		 ORDER BY  company, check_date asc
		</cfif>
		</CFQUERY>


		<CFSET r_count = #read_report.recordcount#>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=purple>
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

				</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>


						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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



			 <CFLOOP QUERY="read_report">


			<CFOUTPUT>
								<CFQUERY datasource="#request.dsn#" NAME="read_company">

			SELECT *
			FROM companies
			where ID = #read_report.comp_id#

		</CFQUERY>
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							P-#prop_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>

<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&a_trigger=0&company_id=#comp_ID#&code=P&rec_type=prop" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&company_id=#company_ID#&code=P"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
		</tr>
			</CFOUTPUT>	</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->

				</table>
			</TD>
		</TR>
	</table>
			</TD>
		</TR>
	</table>
	<CFFLUSH>
	</cfif>
<!---- END PROPERTY SEARCH  ----->


<!---- BEGIN APPRAISAL SEARCH  ----->
<cfif #form.product# eq "appraisal" or #form.product# eq "all">

<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM appraisal
			WHERE 0 = 0
			<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #form.user_id# NEQ "NONE">
and user_id = '#form.user_id#'
</cfif>


			<CFIF #form.appraisal_status# NEQ "none">
				AND appraisal_status = '#form.appraisal_status#'

			</CFIF>


			<CFIF #form.loan_number# NEQ "">
				AND loan_number = '#form.loan_number#'

			</CFIF>

				<CFIF #form.app_id# NEQ "">
				AND app_id = '#form.app_id#'
			</CFIF>


			 <CFIF #form.company_id# NEQ "none">
	        AND (comp_id IN (#form.company_id#) or comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND comp_ID IN(#full_list_comp_ids#)
	          </CFIF>


			 <CFIF form.buyer_fname neq "">
				AND (bfirstname1 LIKE '%#form.buyer_fname#%' OR bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>

			<CFIF form.buyer_lname neq "">
				AND (blastname1 LIKE '%#form.buyer_lname#%' OR blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>


		<cfif #form.sortorder# NEQ "NONE">
		ORDER BY #form.sortorder#
	    <CFELSE>
		 ORDER BY  check_date DESC
		</cfif>
		</CFQUERY>

<CFSET r_count = #read_report.recordcount#>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Appraisal Report Search</B></CENTER>
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
		</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>


						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
					<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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


			 <CFLOOP QUERY="read_report">
			<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where ID = #read_report.comp_id#
		</CFQUERY>
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							APP-#app_id#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>

<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&a_trigger=0&company_id=#company_ID#&code=A&rec_type=app" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_appraisal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&company_id=#company_ID#&code=A"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>

		</tr>
			</CFOUTPUT>	</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> --->
				</table>
			</TD>
		</TR>
	</table>
			</TD>
		</TR>
	</table>
	<CFFLUSH>
</cfif>
<!---- END APPRAISAL SEARCH  ----->


<!---- BEGIN FLOOD SEARCH  ----->
<cfif #form.product# eq "flood" or #form.product# eq "all">
<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM ancillary
			WHERE codeFlood is not null
			<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #form.user_id# NEQ "NONE">
and user_id = '#form.user_id#'
</cfif>

			<CFIF #form.loan_number# NEQ "">
				AND loan_number = '#form.loan_number#'

			</CFIF>
				<CFIF #form.anc_id# NEQ "">
				AND anc_id = '#form.anc_id#'
			</CFIF>
			<CFIF #form.company_id# NEQ "none">
	      AND (comp_id IN (#form.company_id#) or comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND comp_ID IN(#full_list_comp_ids#)
	          </CFIF>
			 <CFIF form.buyer_fname neq "">
				AND (bfirstname1 LIKE '%#form.buyer_fname#%' OR bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>
			<CFIF form.buyer_lname neq "">
				AND (blastname1 LIKE '%#form.buyer_lname#%' OR blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>
		<cfif #form.sortorder# NEQ "NONE">
		ORDER BY #form.sortorder#
 	<CFELSE>
		 ORDER BY  check_date asc
		</cfif> </CFQUERY>

		<CFSET r_count = #read_report.recordcount#>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=black>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Flood Report Search</B></CENTER>
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
				</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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
			 <CFLOOP QUERY="read_report">
			<CFQUERY datasource="#request.dsn#" NAME="read_status">
					SELECT *
							FROM ANCILLARY_detl
							WHERE anc_id = '#read_report.anc_id#' and order_type='F'
				</cfquery>
			<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where ID = #read_report.comp_id#
		</CFQUERY>
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeFlood# neq "">F</cfif>-#anc_id#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<!--- #appraisal_status# ---> #read_status.status#
						</td>
	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#&code=F" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#&code=F"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
		</tr>
			</CFOUTPUT>	</CFLOOP>
				</table>
			</TD>
		</TR>

	</table>
			</TD>
		</TR>
	</table>
	<CFFLUSH>
</cfif>
<!---- END FLOOD SEARCH  ----->



<!---- BEGIN CREDIT SEARCH  ----->
<cfif #form.product# eq "credit" or #form.product# eq "all">

<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM ancillary
			WHERE codeCR is not null
			<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #form.user_id# NEQ "NONE">
and user_id = '#form.user_id#'
</cfif>
 			<CFIF #form.loan_number# NEQ "">
				AND loan_number = '#form.loan_number#'

			</CFIF>

				<CFIF #form.cr_id# NEQ "">
				AND anc_id = '#form.cr_id#'
			</CFIF>
			<CFIF #form.company_id# NEQ "none">
	         AND (comp_id IN (#form.company_id#) or comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND comp_ID IN(#full_list_comp_ids#)
	          </CFIF>
			 <CFIF form.buyer_fname neq "">
				AND (bfirstname1 LIKE '%#form.buyer_fname#%' OR bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>
			<CFIF form.buyer_lname neq "">
				AND (blastname1 LIKE '%#form.buyer_lname#%' OR blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>
		<cfif #form.sortorder# NEQ "NONE">
		ORDER BY #form.sortorder#
 	<CFELSE>
		 ORDER BY  check_date asc
		</cfif> </CFQUERY>
<CFSET r_count = #read_report.recordcount#>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=brown>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Credit Report Search</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
	</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
					Client
						</td>
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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
			 <CFLOOP QUERY="read_report">
			 <CFQUERY datasource="#request.dsn#" NAME="read_status">
				SELECT *
						FROM ANCILLARY_detl
						WHERE anc_id = '#read_report.anc_id#' and order_type='CR'
			</cfquery>

			<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_company">

			SELECT *
			FROM companies
			where ID = #read_report.comp_id#

		</CFQUERY>
					<tr>



						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeCR# neq "">CR</cfif>-#anc_id#

						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<!--- #appraisal_status# --->     #read_status.status#
						</td>
	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#&code=CR" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#&code=CR"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
		</tr>
			</CFOUTPUT>	</CFLOOP>
				</table>
			</TD>
		</TR>
	</table>
			</TD>
		</TR>

	</table>
	<CFFLUSH>
</cfif>
<!---- END CREDIT SEARCH  ----->



<!---- BEGIN AVM SEARCH  ----->
<cfif #form.product# eq "avm" or #form.product# eq "all">

<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM ancillary
			WHERE codeAVM is not null
			<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #form.user_id# NEQ "NONE">
and user_id = '#form.user_id#'
</cfif>


			<!--- <CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'

			</CFIF> --->


			<CFIF #form.loan_number# NEQ "">
				AND loan_number = '#form.loan_number#'

			</CFIF>

				<CFIF #form.avm_id# NEQ "">
				AND anc_id = '#form.avm_id#'
			</CFIF>


			 <CFIF #form.company_id# NEQ "none">
	          AND (comp_id IN (#form.company_id#) or comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND comp_ID IN(#full_list_comp_ids#)
	          </CFIF>
			<CFIF form.buyer_fname neq "">
				AND (bfirstname1 LIKE '%#form.buyer_fname#%' OR bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>
			<CFIF form.buyer_lname neq "">
				AND (blastname1 LIKE '%#form.buyer_lname#%' OR blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>
		<cfif #form.sortorder# NEQ "NONE">
		ORDER BY #form.sortorder#
 	<CFELSE>
		 ORDER BY  check_date asc
		</cfif> </CFQUERY>

<CFSET r_count = #read_report.recordcount#>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=red>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>AVM Report Search</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>
					<tr>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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
			 <CFLOOP QUERY="read_report">
				 <CFQUERY datasource="#request.dsn#" NAME="read_status">
					SELECT *
							FROM ANCILLARY_detl
							WHERE anc_id = '#read_report.anc_id#' and order_type='AVM'
				</cfquery>
			<CFOUTPUT>
	<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where ID = #comp_id#
		</CFQUERY>
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeAVM# neq "">AVM</cfif>-#anc_id#

						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<!--- #appraisal_status# --->   #read_status.status#
						</td>
	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#&code=AVM" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#&code=AVM"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
		</tr>
			</CFOUTPUT>	</CFLOOP>
				</table>
			</TD>
		</TR>
	</table>
			</TD>
		</TR>
	</table>
	<CFFLUSH>
</cfif>
<!---- END AVM SEARCH  ----->



<!---- BEGIN SIGNING SEARCH  ----->
<cfif #form.product# eq "signing" or  #form.product# eq "all">

<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM ancillary
			WHERE codeSigning is not null
			<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #form.user_id# NEQ "NONE">
and user_id = '#form.user_id#'
</cfif>
			<CFIF #form.loan_number# NEQ "">
				AND loan_number = '#form.loan_number#'
			</CFIF>
				<CFIF #form.sn_id# NEQ "">
				AND anc_id = '#form.sn_id#'
			</CFIF>
			<CFIF #form.company_id# NEQ "none">
	        AND (comp_id IN (#form.company_id#) or comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND comp_ID IN(#full_list_comp_ids#)
	          </CFIF>
			<CFIF form.buyer_fname neq "">
				AND (bfirstname1 LIKE '%#form.buyer_fname#%' OR bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>
			<CFIF form.buyer_lname neq "">
				AND (blastname1 LIKE '%#form.buyer_lname#%' OR blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>
		<cfif #form.sortorder# NEQ "NONE">
		ORDER BY #form.sortorder#
 	<CFELSE>
		 ORDER BY  check_date asc
		</cfif> </CFQUERY>

<CFSET r_count = #read_report.recordcount#>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=orange>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Signing Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>
<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
	</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>
					<tr>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						Client
						</td>
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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
				 <CFLOOP QUERY="read_report" >
		<CFQUERY datasource="#request.dsn#" NAME="read_status">
			SELECT *
					FROM ANCILLARY_detl
					WHERE anc_id = '#read_report.anc_id#' and order_type='SN'
		</cfquery>

			<CFOUTPUT>
						<CFQUERY datasource="#request.dsn#" NAME="read_company">

			SELECT *
			FROM companies
			where ID = #read_report.comp_id#

		</CFQUERY>
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfif #codeSigning# neq "">SN</cfif>-#anc_id#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<!--- #appraisal_status# --->   #read_status.status#
						</td>


	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#&code=SN" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#&code=SN"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
			</tr>
			</CFOUTPUT>	</CFLOOP>
				</table>
			</TD>
		</TR>
	</table>
			</TD>
		</TR>
	</table>
	<CFFLUSH>
	</cfif>
<!---- END SIGNING SEARCH  ----->





<!---- BEGIN CLOSING SEARCH  ----->
<cfif form.product eq "all">
<CFQUERY datasource="#request.dsn#" NAME="read_report">
SELECT *
FROM Title C, Title_Closing_Order_Request O
WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL and c.cancelled is null

		<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			 <cfif #form.user_id# NEQ "NONE">
and user_id = '#form.user_id#'
</cfif>
			<CFIF #form.appraisal_status# NEQ "none">
				AND appraisal_status = '#form.appraisal_status#'
			</CFIF>
			<CFIF #form.loan_number# NEQ "">
				AND loan_number = '#form.loan_number#'
			</CFIF>
				<CFIF #form.title_id# NEQ "">
				AND c.title_id = '#form.title_id#'
			</CFIF>
			 <CFIF #form.company_id# NEQ "none">
	          AND (comp_id IN (#form.company_id#) or comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND comp_ID IN(#full_list_comp_ids#)
	          </CFIF>
			 <CFIF form.buyer_fname neq "">
				AND (bfirstname1 LIKE '%#form.buyer_fname#%' OR bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>
			<CFIF form.buyer_lname neq "">
				AND (blastname1 LIKE '%#form.buyer_lname#%' OR blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>
		<cfif #form.sortorder# NEQ "NONE">
		ORDER BY #form.sortorder#
	 	<CFELSE>
		 ORDER BY  check_date asc
		</cfif> </CFQUERY>
<CFSET r_count = #read_report.recordcount#>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closing Request Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
		</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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


			 <CFLOOP QUERY="read_report">
			<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where ID = #read_report.comp_id#
            </CFQUERY>
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
		</tr>
			</CFOUTPUT>	</CFLOOP>
				</table>
			</TD>
		</TR>
	</table>
			</TD>
		</TR>
	</table>
	<CFFLUSH>
</cfif>
<!---- END CLOSING SEARCH  ----->









<!---- BEGIN CLOSING SEARCH  ----->
<cfif form.product eq "closing">
<cfif form.closing_status eq "Closing Requested">
<CFQUERY datasource="#request.dsn#" NAME="read_report">
SELECT *
FROM Title C, Title_Closing_Order_Request O
WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL and c.cancelled is null

		<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (request_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			 <cfif #form.user_id# NEQ "NONE">
and user_id = '#form.user_id#'
</cfif>
			<CFIF #form.loan_number# NEQ "">
				AND loan_number = '#form.loan_number#'
			</CFIF>
				<CFIF #form.closing_id# NEQ "">
				AND c.title_id = '#form.closing_id#'
			</CFIF>
			 <CFIF #form.company_id# NEQ "none">
	          AND (comp_id IN (#form.company_id#) or comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND comp_ID IN(#full_list_comp_ids#)
	          </CFIF>
			 <CFIF form.buyer_fname neq "">
				AND (bfirstname1 LIKE '%#form.buyer_fname#%' OR bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>
			<CFIF form.buyer_lname neq "">
				AND (blastname1 LIKE '%#form.buyer_lname#%' OR blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>
		<cfif #form.sortorder# NEQ "NONE">
		ORDER BY #form.sortorder#
	 	<CFELSE>
		 ORDER BY  request_date asc
		</cfif> </CFQUERY>
<CFSET r_count = #read_report.recordcount#>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closing Request Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
		</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Request Date
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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


			 <CFLOOP QUERY="read_report">
			<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where ID = #read_report.comp_id#
            </CFQUERY>
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(request_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
		</tr>
			</CFOUTPUT>	</CFLOOP>
				</table>
			</TD>
		</TR>
	</table>
			</TD>
		</TR>
	</table>
	<CFFLUSH>
<cfelseif form.closing_status eq "Closer Assigned">
<CFQUERY datasource="#request.dsn#" NAME="udate_assign_dates">
Update Doc_Closer_Title
Set actual_assign_date = a_date_assigned
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_report">
SELECT *
FROM Title C, Title_Closing_Order_Request O, doc_closer_title d
WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL and c.cancelled is null

		<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (d.actual_assign_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			 <cfif #form.user_id# NEQ "NONE">
and user_id = '#form.user_id#'
</cfif>
			<CFIF #form.loan_number# NEQ "">
				AND loan_number = '#form.loan_number#'
			</CFIF>
				<CFIF #form.closing_id# NEQ "">
				AND c.title_id = '#form.closing_id#'
			</CFIF>
			 <CFIF #form.company_id# NEQ "none">
	          AND (comp_id IN (#form.company_id#) or comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND comp_ID IN(#full_list_comp_ids#)
	          </CFIF>
			 <CFIF form.buyer_fname neq "">
				AND (bfirstname1 LIKE '%#form.buyer_fname#%' OR bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>
			<CFIF form.buyer_lname neq "">
				AND (blastname1 LIKE '%#form.buyer_lname#%' OR blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>
		and d.title_id = c.title_id
		and d.a_date_assigned != ''
		and d.a_date_assigned IS NOT NULL
		<cfif #form.sortorder# NEQ "NONE">
		ORDER BY #form.sortorder#
	 	<CFELSE>
		 ORDER BY  d.actual_assign_date asc
		</cfif> </CFQUERY>
<CFSET r_count = #read_report.recordcount#>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closer Assigned Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
		</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Date Assigned
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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


			 <CFLOOP QUERY="read_report">
			<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where ID = #read_report.comp_id#
            </CFQUERY>
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(a_date_assigned, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
		</tr>
			</CFOUTPUT>	</CFLOOP>
				</table>
			</TD>
		</TR>
	</table>
			</TD>
		</TR>
	</table>
	<CFFLUSH>











<cfelseif form.closing_status eq "Closing Info Submitted">
<CFQUERY datasource="#request.dsn#" NAME="udate_assign_dates">
Update Doc_Closer_Title
Set actual_closing_inst_date = closing_inst_date
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_report">
SELECT *
FROM Title C, Title_Closing_Order_Request O, Doc_Closer_title d
WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL and c.cancelled is null

		<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (d.actual_closing_inst_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			 <cfif #form.user_id# NEQ "NONE">
and user_id = '#form.user_id#'
</cfif>
			<CFIF #form.loan_number# NEQ "">
				AND loan_number = '#form.loan_number#'
			</CFIF>
				<CFIF #form.closing_id# NEQ "">
				AND c.title_id = '#form.closing_id#'
			</CFIF>
			 <CFIF #form.company_id# NEQ "none">
	          AND (c.comp_id IN (#form.company_id#) or c.comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND c.comp_ID IN(#full_list_comp_ids#)
	          </CFIF>
			 <CFIF form.buyer_fname neq "">
				AND (bfirstname1 LIKE '%#form.buyer_fname#%' OR bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>
			<CFIF form.buyer_lname neq "">
				AND (blastname1 LIKE '%#form.buyer_lname#%' OR blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>
		and d.title_id = c.title_id
		<cfif #form.sortorder# NEQ "NONE">
		ORDER BY #form.sortorder#
	 	<CFELSE>
		 ORDER BY  d.actual_closing_inst_date asc
		</cfif>
		</CFQUERY>
<CFSET r_count = #read_report.recordcount#>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closing Info Submitted Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
		</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Date Submitted
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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


			 <CFLOOP QUERY="read_report">
			<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where ID = #read_report.comp_id#
            </CFQUERY>
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(actual_closing_inst_date, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
		</tr>
			</CFOUTPUT>	</CFLOOP>
				</table>
			</TD>
		</TR>
	</table>
			</TD>
		</TR>
	</table>
	<CFFLUSH>


<cfelseif form.closing_status eq "Loan Closed">
<CFQUERY datasource="#request.dsn#" NAME="read_report">
SELECT *
FROM Title C, Eventlist e
WHERE C.title_id = e.title_id AND c.cancelled is null

		<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (e.cl_dateandtime between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			 <cfif #form.user_id# NEQ "NONE">
and user_id = '#form.user_id#'
</cfif>
			<CFIF #form.loan_number# NEQ "">
				AND loan_number = '#form.loan_number#'
			</CFIF>
				<CFIF #form.closing_id# NEQ "">
				AND c.title_id = '#form.closing_id#'
			</CFIF>
			 <CFIF #form.company_id# NEQ "none">
	          AND (c.comp_id IN (#form.company_id#) or c.comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND c.comp_ID IN(#full_list_comp_ids#)
	          </CFIF>
			 <CFIF form.buyer_fname neq "">
				AND (bfirstname1 LIKE '%#form.buyer_fname#%' OR bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>
			<CFIF form.buyer_lname neq "">
				AND (blastname1 LIKE '%#form.buyer_lname#%' OR blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>
		and e.title_id = c.title_id
		<cfif #form.sortorder# NEQ "NONE">
		ORDER BY #form.sortorder#
	 	<CFELSE>
		 ORDER BY  e.cl_dateandtime asc
		</cfif>
		</CFQUERY>
<CFSET r_count = #read_report.recordcount#>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Loan Closed Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
		</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Date Closed
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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


			 <CFLOOP QUERY="read_report">
			<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where ID = #read_report.comp_id#
            </CFQUERY>
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(cl_dateandtime, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
		</tr>
			</CFOUTPUT>	</CFLOOP>
				</table>
			</TD>
		</TR>
	</table>
			</TD>
		</TR>
	</table>
	<CFFLUSH>






<cfelseif form.closing_status eq "Loan Funded">
<CFQUERY datasource="#request.dsn#" NAME="read_report">
SELECT *
FROM Title C, Eventlist e
WHERE C.title_id = e.title_id AND c.cancelled is null and e.loanfun = 1

		<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (e.fl_dateandtime between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			 <cfif #form.user_id# NEQ "NONE">
and user_id = '#form.user_id#'
</cfif>
			<CFIF #form.loan_number# NEQ "">
				AND loan_number = '#form.loan_number#'
			</CFIF>
				<CFIF #form.closing_id# NEQ "">
				AND c.title_id = '#form.closing_id#'
			</CFIF>
			 <CFIF #form.company_id# NEQ "none">
	          AND (c.comp_id IN (#form.company_id#) or c.comp_id IN (select id from companies where master_co_id IN (#form.company_id#)))
	          <cfelse>
	          AND c.comp_ID IN(#full_list_comp_ids#)
	          </CFIF>
			 <CFIF form.buyer_fname neq "">
				AND (bfirstname1 LIKE '%#form.buyer_fname#%' OR bfirstname2 LIKE '%#form.buyer_fname#%')
			</CFIF>
			<CFIF form.buyer_lname neq "">
				AND (blastname1 LIKE '%#form.buyer_lname#%' OR blastname2 LIKE '%#form.buyer_lname#%')
			</CFIF>
		and e.title_id = c.title_id
		<cfif #form.sortorder# NEQ "NONE">
		ORDER BY #form.sortorder#
	 	<CFELSE>
		 ORDER BY  e.fl_dateandtime asc
		</cfif>
		</CFQUERY>
<CFSET r_count = #read_report.recordcount#>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Loan Funded Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
		</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Date Funded
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
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


			 <CFLOOP QUERY="read_report">
			<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where ID = #read_report.comp_id#
            </CFQUERY>
					<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(cl_dateandtime, "m/d/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							C-#title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>

	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#&code=CL"><cfif #excel# eq 1>Details<cfelse><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></cfif></a>
	</td>
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
					</tr>
		</tr>
			</CFOUTPUT>	</CFLOOP>
				</table>
			</TD>
		</TR>
	</table>
			</TD>
		</TR>
	</table>
	<CFFLUSH>
</cfif>


</cfif>
<!---- END CLOSING SEARCH  ----->

</BODY>
</HTML>





