<CFPARAM NAME="vendor"     DEFAULT="">
<CFPARAM NAME="state"       DEFAULT="">
<CFPARAM NAME="county"       DEFAULT="">
<CFPARAM NAME="foo"       DEFAULT="">
<CFPARAM NAME="coo"       DEFAULT="">
<CFPARAM NAME="yearmon"       DEFAULT="">
<CFPARAM NAME="yearmonto"       DEFAULT="">
<CFPARAM NAME="a_trigger"       DEFAULT="0">
<CFSET r_count = 0 >
<cfset return_string = CGI.QUERY_STRING>
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. Vendor Area</title>

</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>


<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width="98%" align=center valign=top>
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width="98%" align=center valign=top bgcolor=white>
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width="100%" align=left valign=top bgcolor=white>
			<FONT FACE=ARIAL SIZE=2 color="black"><br>
			<CENTER><B>Vendor Performance Result <CFOUTPUT>#URL.Type#</CFOUTPUT></B></CENTER>
		</TD>
	</TR>
	<tr>
		<td width="100%" align=center valign=top bgcolor=d3d3d3>
<table width="100%" cellpadding=1 cellspacing=1 border=0>
<cfif #vendor# neq "">
	<CFIF #URL.Type# eq "Abstractors">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM doc_abstract_title
			WHERE a_date_assigned is not null <!--- and b.a_date_completed is not null --->
			<CFIF #YearMon# neq "">
				and (a_date_assigned > '#DateFormat(YearMon, "m/d/yyyy")#' AND a_date_assigned < '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
				<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
					<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
					and (a_date_assigned > '#DateFormat(YearMon, "m/d/yyyy")#' AND a_date_assigned < '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
			</CFIF>
			<CFIF #vendor# NEQ "">
				AND abstractor_id = #vendor#
			</CFIF>
			Order By abstractor_id, a_date_assigned DESC
		</CFQUERY>  

		<CFSET r_count = #read_report.recordcount#>
	</CFIF>
		<CFIF #URL.Type# eq "Closers">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, doc_closer_title b, eventlist c
			WHERE a.title_id = b.title_id and b.title_id = c.title_ID and b.a_date_assigned is not null and c.cl_dateandtime is not null
			<CFIF #YearMon# neq "">
				and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
				<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
					<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
					and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
			</CFIF>
			<CFIF #vendor# NEQ "">
				AND b.closer_id = #vendor#
			</CFIF>
			Order By b.closer_id, b.a_date_assigned DESC
		</CFQUERY>  

		<CFSET r_count = #read_report.recordcount#>
	</CFIF>	
	<CFIF #URL.Type# eq "Appraisers">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, Appraisal_Doc_Title b
			WHERE a.title_id = b.title_id and b.a_date_assigned is not null and b.a_date_completed is not null
			<CFIF #YearMon# neq "">
				and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
				<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFIF #YearMon# eq "">
						<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
						<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
            		</CFIF>				
					and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
			</CFIF>
			<CFIF #vendor# NEQ "">
				AND b.Appraiser_ID = #vendor#
			</CFIF>
			Order By b.Appraiser_ID, b.a_date_assigned DESC
		</CFQUERY>  

		<CFSET r_count = #read_report.recordcount#>
	</CFIF>	
	<tr>
		<td width="98%" align=left valign=top bgcolor=e1e1e1>
<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<CFIF #r_count# NEQ "0">
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
		<td width="98%" align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL SIZE=2 color="black">
			<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
		</TD>
	</TR>
	<tr>
		<td width="98%" align=center valign=top bgcolor=d3d3d3>
<table width="98%" cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Paid
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Order Number
		</td>	
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Date Assigned
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Date Completed
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Invoice #
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Paid Date
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Paid Amount
		</td>	
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Vendor name
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Performance time
		</td>			
	</tr>
		<CFSET a_bgcolor = "d3d3d3">
		<CFSET a_color_trigger = "1">
	
		<CFOUTPUT QUERY="read_report">
	
		<CFIF #URL.type# eq "Abstractors">
		<cfset ab_id = read_report.abstractor_id>
		 <cfif read_report.abstractor_id eq 1731>
		   <cfif read_report.abstractor_id_2 eq 1731 and read_report.abstractor_id_3 neq ''>
		   <cfset ab_id = read_report.abstractor_id_3>
		   <cfelse>
		   <cfset ab_id = read_report.abstractor_id_2>
		   </cfif>
		 </cfif>
			<CFQUERY datasource="#request.dsn#" NAME="read_abs">
				SELECT *
				FROM abstractors
				WHERE abstractor_id = #ab_id#
			</cfquery>
		</CFIF>
		<CFIF #URL.type# eq "Closers">
			<CFQUERY datasource="#request.dsn#" NAME="read_abs">
				SELECT *
				FROM Closer
				WHERE closer_id = #closer_id#
			</cfquery>
		</CFIF>
		<CFIF #URL.type# eq "Appraisers">
			<CFQUERY datasource="#request.dsn#" NAME="read_abs">
				SELECT *
				FROM appraisers
				WHERE appraiser_ID = #appraiser_ID#
			</cfquery>
		</CFIF>
	<tr>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="blue">
			<CFIF #Paid# eq 1>
				<CFIF #URL.TYPE# eq "Abstractors">
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Paid</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Paid</font></a>
				</CFIF>
			<CFELSEIF #Paid# eq 2>
				<CFIF #URL.TYPE# eq "Abstractors">
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Void</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Void</font></a>
				</CFIF>
			<CFELSE>
				<CFIF #URL.TYPE# eq "Abstractors">
				
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Open</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Open</font></a>
				</CFIF>
			</CFIF>
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#title_id#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(a_date_assigned, "m/d/yyyy")#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(a_date_completed, 'm/d/yyyy')#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#Invoice_Num#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(Paid_Date, "m/d/yyyy")#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DollarFormat(Paid_Amount)#
		</td>			
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#read_abs.company#  
		</td>			
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<cfif #a_date_assigned# neq "" and #a_date_completed# neq "" and #a_time_assigned# neq "" and #a_time_completed# neq "">
				<FONT FACE=verdana SIZE=1 color="black">
				<cfset hours_diff = DATEDIFF("h", "#DateFormat(a_date_assigned, 'mm-dd-yyyy')# #TimeFormat(a_time_assigned, 'hh:mm:ss')#", "#DateFormat(a_date_completed, 'mm-dd-yyyy')# #TimeFormat(a_time_completed, 'hh:mm:ss')#")>
				<cfset days = Round(hours_diff / 24)>
				<cfset hours = (hours_diff - (days*24))>
				Days:#days#&nbsp;Hours:#hours#					
			</cfif>
		</td>
	</tr>
		<CFIF #a_color_trigger# eq "1">
			<CFSET a_bgcolor = "white">
			<CFSET a_color_trigger = "2">				
		<CFELSE>
			<CFSET a_bgcolor = "d3d3d3">
			<CFSET a_color_trigger = "1">				
		</CFIF>
	</CFOUTPUT>
</table>
</CFIF>
<!---If the Vendor is blank and a state & county is chosen ---->	
<cfelseif #vendor# eq "" and #state# neq "" and #county# neq "">
	<CFIF #url.type# eq "Abstractors">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, doc_abstract_title b
			WHERE a.title_id = b.title_id and a.pstate = '#state#' and a.pcounty = '#county#' and b.a_date_assigned is not null <!--- and b.a_date_completed is not null --->
			<CFIF #YearMon# neq "">
				and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
				<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFIF #YearMon# eq "">
						<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
						<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
					</CFIF>
					and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
			</CFIF>
			<CFIF #vendor# NEQ "">
				AND b.abstractor_id = #vendor#
			</CFIF>
			Order By b.abstractor_id, b.a_date_assigned DESC
		</CFQUERY>  

		<CFSET r_count = #read_report.recordcount#>
	</CFIF>
		<CFIF #url.type# eq "Closers">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, doc_closer_title b, eventlist c
			WHERE a.title_id = b.title_id and b.title_id = c.title_ID and a.pstate = '#state#' and a.pcounty = '#county#' and b.a_date_assigned is not null and c.cl_dateandtime is not null
			<CFIF #YearMon# neq "">
				and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
				<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFIF #YearMon# eq "">
						<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
						<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
					</CFIF>	
					and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
			</CFIF>
			<CFIF #vendor# NEQ "">
				AND b.closer_id = #vendor#
			</CFIF>
			Order By b.closer_id, b.a_date_assigned DESC
		</CFQUERY>  

		<CFSET r_count = #read_report.recordcount#>
	</CFIF>
		<CFIF #url.type# eq "Appraisers">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, Appraisal_Doc_Title b
			WHERE a.title_id = b.title_id and a.pstate = '#state#' and a.pcounty = '#county#' and b.a_date_assigned is not null and b.a_date_completed is not null
			<CFIF #YearMon# neq "">
				and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
				<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFIF #YearMon# eq "">
						<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
						<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
					</CFIF>
					and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
			</CFIF>
			<CFIF #vendor# NEQ "">
				AND b.Appraiser_ID = #vendor#
			</CFIF>
			Order By b.Appraiser_ID, b.a_date_assigned DESC
		</CFQUERY>  

		<CFSET r_count = #read_report.recordcount#>
	</CFIF>
	<tr>
		<td width="98%" align=left valign=top bgcolor=e1e1e1>
	<CFIF #r_count# NEQ "0">
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
		<td width="98%" align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL SIZE=2 color="black">
			<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
		</TD>
	</TR>
	<tr>
		<td width="98%" align=center valign=top bgcolor=d3d3d3>
<table width="98%" cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=gray align=center valign=top>
			Paid
		</td>	
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Order Number
		</td>	
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Date Assigned
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Date Completed
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Invoice #
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Paid Date
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Paid Amount
		</td>		
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Vendor name
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Performance time
		</td>			
	</tr>
		<CFSET a_bgcolor = "d3d3d3">
		<CFSET a_color_trigger = "1">
		
		<CFOUTPUT QUERY="read_report">
			<CFIF #URL.type# eq "Abstractors">
		<cfset ab_id = read_report.abstractor_id>
		 <cfif read_report.abstractor_id eq 1731>
		   <cfif read_report.abstractor_id_2 eq 1731>
		   <cfset ab_id = read_report.abstractor_id_3>
		   <cfelse>
		   <cfset ab_id = read_report.abstractor_id_2>
		   </cfif>
		 </cfif>
			<CFQUERY datasource="#request.dsn#" NAME="read_abs">
				SELECT *
				FROM abstractors
				WHERE abstractor_id = #ab_id#
			</cfquery>
		</CFIF>
			<CFIF #url.type# eq "Closers">
				<CFQUERY datasource="#request.dsn#" NAME="read_abs">
					SELECT *
					FROM Closer
					WHERE closer_id = #closer_id#
				</cfquery>
			</CFIF>
			<CFIF #url.type# eq "Appraisers">
				<CFQUERY datasource="#request.dsn#" NAME="read_abs">
					SELECT *
					FROM Appraisers
					WHERE appraiser_ID = #appraiser_ID#
				</cfquery>
			</CFIF>
	<tr>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="blue">
			<CFIF #Paid# eq 1>
				<CFIF #URL.TYPE# eq "Abstractors">
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Paid</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Paid</font></a>
				</CFIF>
			<CFELSEIF #Paid# eq 2>
				<CFIF #URL.TYPE# eq "Abstractors">
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Void</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Void</font></a>
				</CFIF>
			<CFELSE>
				<CFIF #URL.TYPE# eq "Abstractors">
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Open</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Open</font></a>
				</CFIF>
			</CFIF>	
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#title_id#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(a_date_assigned, "m/d/yyyy")#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(a_date_completed, 'm/d/yyyy')#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#Invoice_Num#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(Paid_Date, "m/d/yyyy")#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DollarFormat(Paid_Amount)#
		</td>	
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#read_abs.company#  
		</td>			
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<cfif #a_date_assigned# neq "" and #a_date_completed# neq "" and #a_time_assigned# neq "" and #a_time_completed# neq "">
				<FONT FACE=verdana SIZE=1 color="black">
				<cfset hours_diff = DATEDIFF("h", "#DateFormat(a_date_assigned, 'mm-dd-yyyy')# #TimeFormat(a_time_assigned, 'hh:mm:ss')#", "#DateFormat(a_date_completed, 'mm-dd-yyyy')# #TimeFormat(a_time_completed, 'hh:mm:ss')#")>
				<cfset days = Round(hours_diff / 24)>
				<cfset hours = (hours_diff - (days*24))>
				Days:#days#&nbsp;Hours:#hours#			
			</cfif>
		</td>
	</tr>
		<CFIF #a_color_trigger# eq "1">
			<CFSET a_bgcolor = "white">
			<CFSET a_color_trigger = "2">				
		<CFELSE>
			<CFSET a_bgcolor = "d3d3d3">
			<CFSET a_color_trigger = "1">				
		</CFIF>
		</CFOUTPUT>
</table>
</CFIF>
	<!---If the Vendor is blank and a state is chosed & county is not chosen ---->
<cfelseif #county# eq "" and #state# neq "" and #vendor# eq "">
	<CFIF #URL.type# eq "Abstractors">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, doc_abstract_title b
			WHERE a.title_id = b.title_id and a.pstate = '#state#' and b.a_date_assigned is not null <!--- and b.a_date_completed is not null --->
			<CFIF #YearMon# neq "">
				and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfELSEif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
				<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFIF #YearMon# eq "">
						<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
						<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
					</CFIF>
					and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
			</CFIF>
			Order By b.abstractor_id, b.a_date_assigned DESC
		</CFQUERY>  
		
		<CFSET r_count = #read_report.recordcount#>
	</CFIF>
	<CFIF #URL.type# eq "Closers">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, doc_closer_title b, eventlist c 
			WHERE a.title_id = b.title_id and b.title_id = c.title_id and a.pstate = '#state#' and b.a_date_assigned is not null and c.cl_dateandtime is not null
			<CFIF #YearMon# neq "">
				and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
				<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFIF #YearMon# eq "">
						<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
						<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
					</CFIF>
					and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
			</CFIF>
			Order By b.closer_id, b.a_date_assigned DESC
		</CFQUERY>  
		
		<CFSET r_count = #read_report.recordcount#>
	</CFIF>
	<CFIF #URL.type# eq "Appraisers">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, Appraisal_Doc_Title b
			WHERE a.title_id = b.title_id and a.pstate = '#state#' and b.a_date_assigned is not null and b.a_date_completed is not null
			<CFIF #YearMon# neq "">
				and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			<cfelseif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
				<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFIF #YearMon# eq "">
						<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
						<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
					</CFIF>
					and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				</cfif>
			</CFIF>
			Order By b.Appraiser_ID, b.a_date_assigned DESC
		</CFQUERY>  
		
		<CFSET r_count = #read_report.recordcount#>
	</CFIF>
	<tr>
		<td width="98%" align=left valign=top bgcolor=e1e1e1>
			<CFIF #r_count# NEQ "0">
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
		<td width="98%" align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL SIZE=2 color="black">
			<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
		</TD>
	</TR>
	<tr>
		<td width="98%" align=center valign=top bgcolor=d3d3d3>
<table width="98%" cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Paid
		</td>	
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Order Number
		</td>	
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Date Assigned
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Date Completed
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Invoice #
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Paid Date
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Paid Amount
		</td>		
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Vendor name
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Performance time
		</td>			
	</tr>
	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	<CFOUTPUT QUERY="read_report">
		<CFIF #URL.type# eq "Abstractors">
		<cfset ab_id = read_report.abstractor_id>
		 <cfif read_report.abstractor_id eq 1731>
		   <cfif read_report.abstractor_id_2 eq 1731 and read_report.abstractor_id_3 neq ''>
		   <cfset ab_id = read_report.abstractor_id_3>
		   <cfelse>
		   <cfset ab_id = read_report.abstractor_id_2>
		   </cfif>
		 </cfif>
			<CFQUERY datasource="#request.dsn#" NAME="read_abs">
				SELECT *
				FROM abstractors
				WHERE abstractor_id = #ab_id#
			</cfquery>
		</CFIF>
		<CFIF #URL.type# eq "Closers">
			<CFQUERY datasource="#request.dsn#" NAME="read_abs">
				SELECT *
				FROM Closer
				WHERE closer_id = #closer_id#
			</cfquery>
		</CFIF>
		<CFIF #URL.type# eq "Appraisers">
			<CFQUERY datasource="#request.dsn#" NAME="read_abs">
				SELECT *
				FROM appraisers
				WHERE appraiser_ID = #appraiser_ID#
			</cfquery>
		</CFIF>
	<tr>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="blue">
			<CFIF #Paid# eq 1>
				<CFIF #URL.TYPE# eq "Abstractors">
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Paid</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Paid</font></a>
				</CFIF>
			<CFELSEIF #Paid# eq 2>
				<CFIF #URL.TYPE# eq "Abstractors">
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Void</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Void</font></a>
				</CFIF>
			<CFELSE>	
				<CFIF #URL.TYPE# eq "Abstractors">
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Open</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Open</font></a>
				</CFIF>
			</CFIF>	
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#title_id#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(a_date_assigned, "m/d/yyyy")#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(a_date_completed, 'm/d/yyyy')#
		</td>

		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#Invoice_Num#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(Paid_Date, "m/d/yyyy")#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DollarFormat(Paid_Amount)#
		</td>		
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#read_abs.company#  
		</td>			
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<cfif #a_date_assigned# neq "" and #a_date_completed# neq "" and #a_time_assigned# neq "" and #a_time_completed# neq "">
				<FONT FACE=verdana SIZE=1 color="black">
				<cfset hours_diff = DATEDIFF("h", "#DateFormat(a_date_assigned, 'mm-dd-yyyy')# #TimeFormat(a_time_assigned, 'hh:mm:ss')#", "#DateFormat(a_date_completed, 'mm-dd-yyyy')# #TimeFormat(a_time_completed, 'hh:mm:ss')#")>
				<cfset days = Round(hours_diff / 24)>
				<cfset hours = (hours_diff - (days*24))>
				Days:#days#&nbsp;Hours:#hours#		
			</cfif>		
		</td>
	</tr>
	<CFIF #a_color_trigger# eq "1">
		<CFSET a_bgcolor = "white">
			<CFSET a_color_trigger = "2">				
		<CFELSE>
			<CFSET a_bgcolor = "d3d3d3">
			<CFSET a_color_trigger = "1">				
	</CFIF>
</CFOUTPUT>
</table>
</CFIF>
<cfelse>
	<CFIF #url.type# eq "Abstractors">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
				SELECT *
				FROM doc_abstract_title 
				WHERE a_date_assigned is not null and <!--- b.a_date_completed is not null --->
				<CFIF #YearMon# neq "">
					and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				<cfelseif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
					<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
						<CFIF #YearMon# eq "">
							<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
							<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
						</CFIF>
						and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
					</cfif>
				</CFIF>
				<CFIF #vendor# NEQ "">
					AND abstractor_id = #vendor#
				</CFIF>
				Order By abstractor_id, a_date_assigned DESC
		</CFQUERY>  
		<CFSET r_count = #read_report.recordcount#>
	</CFIF>
	<CFIF #url.type# eq "Closers">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
				SELECT *
				FROM Title a, doc_closer_title b, eventlist
				WHERE a.title_id = b.title_id and b.title_ID = C.title_ID and b.a_date_assigned is not null and c.cl_dateandtime is not null
				<CFIF #YearMon# neq "">
					and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				<cfelseif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
					<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFIF #YearMon# eq "">
						<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
						<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
					</CFIF>
						and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
					</cfif>
				</CFIF>
				<CFIF #vendor# NEQ "">
					AND b.closer_id = #vendor#
				</CFIF>
				Order By b.closer_id, b.a_date_assigned DESC
		</CFQUERY>  
		<CFSET r_count = #read_report.recordcount#>
	</CFIF>
	
		<CFIF #url.type# eq "Appraisers">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
				SELECT *
				FROM Title a, Appraisal_Doc_Title b
				WHERE a.title_id = b.title_id and b.a_date_assigned is not null 
				<CFIF #YearMon# neq "">
					and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
				<cfelseif (#confirm_mon# NEQ "" or #comfirm_day# NEQ "" or  #confirm_year# NEQ "") >
					<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
					<CFIF #YearMon# eq "">
						<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
						<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>
					</CFIF>
						and (cast(a_date_assigned as smalldatetime) between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
					</cfif>
				</CFIF>
				<CFIF #vendor# NEQ "">
					AND b.Appraiser_ID = #vendor#
				</CFIF>
				Order By b.Appraiser_ID, b.a_date_assigned DESC
		</CFQUERY>  
		<CFSET r_count = #read_report.recordcount#>
	</CFIF>
	<tr>
		<td width="98%" align=left valign=top bgcolor=e1e1e1>
	<CFIF #r_count# NEQ "0">
			<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
		<td width="98%" align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL SIZE=2 color="black">
			<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
		</TD>
	</TR>
	<tr>
		<td width="98%" align=center valign=top bgcolor=d3d3d3>
<table width="98%" cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=gray align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="blue">
			PAID
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Order Number
		</td>	
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Date Assigned
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Date Completed
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Invoice #
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Paid Date
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Paid Amount
		</td>		
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Vendor name
		</td>
		<td bgcolor=gray align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Performance time
		</td>			
	</tr>
	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
		
	<CFOUTPUT QUERY="read_report">
		<CFIF #URL.type# eq "Abstractors">
		<cfset ab_id = read_report.abstractor_id>
		 <cfif read_report.abstractor_id eq 1731>
		   <cfif read_report.abstractor_id_2 eq 1731 and read_report.abstractor_id_3 neq ''>
		   <cfset ab_id = read_report.abstractor_id_3>
		   <cfelse>
		   <cfset ab_id = read_report.abstractor_id_2>
		   </cfif>
		 </cfif>
			<CFQUERY datasource="#request.dsn#" NAME="read_abs">
				SELECT *
				FROM abstractors
				WHERE abstractor_id = #ab_id#
			</cfquery>
		</CFIF>
		<CFIF #URL.type# eq "Closers">
			<CFQUERY datasource="#request.dsn#" NAME="read_abs">
				SELECT *
				FROM Closer
				WHERE closer_id = #closer_id#
			</cfquery>
		</CFIF>
		<CFIF #URL.type# eq "Appraisers">
			<CFQUERY datasource="#request.dsn#" NAME="read_abs">
				SELECT *
				FROM appraisers
				WHERE appraiser_ID = #appraiser_ID#
			</cfquery>
		</CFIF>
	<tr>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="blue">
			<CFIF #Paid# eq 1>
				<CFIF #URL.TYPE# eq "Abstractors">
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Paid</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Paid</font></a>
				</CFIF>
			<CFELSEIF #Paid# eq 2>
				<CFIF #URL.TYPE# eq "Abstractors">
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Void</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Void</font></a>
				</CFIF>	
			<CFELSE>
				<CFIF #URL.TYPE# eq "Abstractors">
					<a href="./vendor_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&abstractor_ID=#abstractor_ID#&Abs_Doc_ID=#Abs_Doc_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Open</font></a>
				</CFIF>
				<CFIF #URL.TYPE# eq "Closers">
					<a href="./closer_performance_REPORT_result_paid.cfm?uid=#URL.uid#&al=#URL.al#&title_ID=#title_ID#&closer_ID=#closer_ID#&CL_DOC_ID=#CL_DOC_ID#&vendor=#vendor#&state=#state#&county=#county#&foo=#foo#&coo=#coo#&type=#type#&yearmon=#YearMon#&YearMonto=#YearMonto#&return_string=#return_string#"><font size=2 color=blue face=verdana>Open</font></a>
				</CFIF>
			</CFIF>
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#title_id#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(a_date_assigned, "m/d/yyyy")#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(a_date_completed, 'm/d/yyyy')#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#Invoice_Num#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DateFormat(Paid_Date, "m/d/yyyy")#
		</td>
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#DollarFormat(Paid_Amount)#
		</td>		
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			#read_abs.company#  
		</td>			
		<td bgcolor="#a_bgcolor#" align=right valign=top>
			<cfif #a_date_assigned# neq "" and #a_date_completed# neq "" and #a_time_assigned# neq "" and #a_time_completed# neq "">
				<FONT FACE=verdana SIZE=1 color="black">
				<cfset hours_diff = DATEDIFF("h", "#DateFormat(a_date_assigned, 'mm-dd-yyyy')# #TimeFormat(a_time_assigned, 'hh:mm:ss')#", "#DateFormat(a_date_completed, 'mm-dd-yyyy')# #TimeFormat(a_time_completed, 'hh:mm:ss')#")>
				<cfset days = Round(hours_diff / 24)>
				<cfset hours = (hours_diff - (days*24))>
				Days:#days#&nbsp;Hours:#hours#						
			</cfif>
		</td>
	</tr>
		<CFIF #a_color_trigger# eq "1">
			<CFSET a_bgcolor = "white">
			<CFSET a_color_trigger = "2">				
		<CFELSE>
			<CFSET a_bgcolor = "d3d3d3">
			<CFSET a_color_trigger = "1">				
		</CFIF>
</CFOUTPUT>
	</CFIF>
</TD></TR></cfif>																										
	
</table>
		</TD>
	</TR>
</table>
		</TD>
	</TR>
</table>
	</BODY>
</HTML>
	
	
	