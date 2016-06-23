<!-- 12/01/05 Sazan added the condition inside TD to change color of purchase orders (searchType=Purchase)  to 00ffff -->


<cfparam name="form.excel" default=0>
<cfparam name="form.a_trigger" default=1>
<cfparam name="form.buyer_lname" default="all">
<cfparam name="form.buyer_lname" default="">
<cfparam name="form.buyer_fname" default="">
<cfparam name="form.appraisal_status" default="NONE">
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
	    SELECT *
		FROM Title
		WHERE 1 = 1
    <cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
        <CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
		<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>
        and (order_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
	</cfif>
order by title_id
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
			Address
		</td>
        <td bgcolor=gray width=58 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			City
		</td>
		<td bgcolor=gray width=58 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			State
		</td>
		<td bgcolor=gray width=58 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			Zip
		</td>
		<td bgcolor=gray width=120 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			County
		</td>
		<td bgcolor=gray width=60 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
		    Abstractors
		</td>
	</tr>
    <!--- ======================================================================== --->
    <CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

    <CFLOOP QUERY="read_report">

    <CFOUTPUT>

	<CFQUERY datasource="#request.dsn#" NAME="get_abstractors">
	SELECT t.Abstractor_ID, t.Abstractor_ID_2, t.Abstractor_ID_3, a.Company
	FROM Doc_Abstract_Title t, Abstractors a
	WHERE t.title_ID = #title_id#
	and
	(a.Abstractor_ID = t.Abstractor_ID
	or
	a.Abstractor_ID = t.Abstractor_ID_2
	or
	a.Abstractor_ID = t.Abstractor_ID_3)
	order by t.Abstractor_ID, t.Abstractor_ID_2, t.Abstractor_ID_3
    </CFQUERY>

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
			#read_report.paddress#
		</td>
        <td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=58 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			#read_report.pcity#
        </td>
		<td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=58 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			#read_report.pstate#
        </td>
		<td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=58 align=center valign=top>
		    <FONT FACE=verdana SIZE=1 color="black">
			#read_report.pzip#
        </td>
        <td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	       #read_report.pcounty#
        </td>
        <td bgcolor=<cfif #SearchType# EQ "Purchase"> 00ffff <cfelse>#a_bgcolor# </cfif> width=60 align=left valign=top><FONT FACE=verdana SIZE=1 color="black">
	       <cfloop query="get_abstractors">
		   #company#<br>
		   </cfloop>
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

			SELECT *
			FROM property
			WHERE 0 = 0

			<cfif (#form.confirm_mon# NEQ "Month" and #form.comfirm_day# NEQ "Day" and #form.confirm_year# NEQ "Year") and (#form.confirm_mon_to# NEQ "Month" and #form.comfirm_day_to# NEQ "Day" and #form.confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#form.confirm_year#, #form.confirm_mon#, #form.comfirm_day#)>
			<CFSET YearMonto = CreateDate(#form.confirm_year_to#, #form.confirm_mon_to#, #form.comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

		 ORDER BY  prop_id asc

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
							Address
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							City
						</td>


						<td bgcolor=gray width=40 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							State
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Zip
						</td>

						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							County
						</td>


						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Abstractors
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">



			 <CFLOOP QUERY="read_report">


			<CFOUTPUT>
			<CFQUERY datasource="#request.dsn#" NAME="get_abstractors">
	SELECT t.Abstractor_ID, t.Abstractor_ID_2, t.Abstractor_ID_3, a.Company
	FROM Doc_Abstract_Prop t, Abstractors a
	WHERE t.prop_ID = #prop_id#
	and
	(a.Abstractor_ID = t.Abstractor_ID
	or
	a.Abstractor_ID = t.Abstractor_ID_2
	or
	a.Abstractor_ID = t.Abstractor_ID_3)
	order by t.Abstractor_ID, t.Abstractor_ID_2, t.Abstractor_ID_3
    </CFQUERY>

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
							#read_report.paddress#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.pcity#
						</td>

<td bgcolor=#a_bgcolor# width=40 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_report.pstate#
						</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#read_report.pzip#</font></td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#read_report.pcounty#</font></td>

	<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfloop query="get_abstractors">
		   #company#<br>
		   </cfloop>
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

</BODY>
</HTML>





