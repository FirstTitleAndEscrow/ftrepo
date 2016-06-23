<cfsetting showdebugoutput="30000">

	<CFSET MaxRows = 2000>
	<CFSET StartRow = 1>
<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<CFPARAM NAME="role_mgr" DEFAULT="">

<cfset ninety_days_ago = DateAdd("d", -180, Now())>

<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	select * from first_admin
			WHERE ID = #session.ft_user_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_tx">
	select * from first_admin
			WHERE tx_employee = 'True'
</CFQUERY>
<cfset tx_ids = ValueList(read_tx.id, ",")>

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
	Select * from sqlCTC_NotClear_To_Close where CTC_Name = '#a_fname#'
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	and fairfax_client = 1
	</cfif>
	<cfif session.ft_user_id eq 418 or session.ft_user_id eq 411>
	and (streamline_client = 0 or streamline_client = NULL)
	</cfif>
</CFQUERY>
 --->
<cfset chase_realEC_accts = "7393,7402">
<html>
<head>
<title>Clear To Close</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
<script>

function ctcAssign(title_id){

			//var datastring = {questionTabID:$('#QuestionTabID').val()};
			$.ajax(
	           {
				type:"POST",
	               url:"/cfc/ctcAssign.cfc?method=assignCTC&returnformat=plain&title_id="+title_id+"&assignedToID="+$('#ctc_'+title_id).val(),
	               //data:datastring,
	               success: function(response)
	               {
					var resp = jQuery.trim(response);
					
	                //$("#practiceData").html(resp);
	     
	       
	                
	                


	               }
	           });

}
</script>
</head>

<body>
<table width="893" cellpadding=1 cellspacing=1 border=0 bgcolor=white></table>
<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
	<tr>
    	<td align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  	</tr>
	<TR>
		<TD><cfif IsDefined("session.ft_user_id") and session.ft_user_id neq 323>
<CFOUTPUT>
<cfFORM NAME="Search" METHOD="post" ACTION="https://#cgi.server_name#/admin_area/title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" >
  				<FONT FACE=ARIAL SIZE=2 color="gray">Quick Search</font><input type=text name="number" size=10 maxlength=15
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
					<input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM>
</CFOUTPUT></cfif>
<a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a>

		</TD>
	</TR>
</table>
<cfif IsDefined("session.ft_user_id") and session.ft_user_id neq 323>
<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
	<tr>
		<td width="111" bgcolor="#CCD2D2"><cfif read_user.streamline_employee eq 'True'><a href="reports_ab_received_client_system_not_updated.cfm?uid=#url.uid#&al=1" target="new">Abstract Received, Client Sytem NOT Updated</a></cfif></td>
		<td width="111" bgcolor="#CCD2D2"><cfif read_user.streamline_employee eq 'True'>
<a href="streamline_lp_report.cfm?uid=#url.uid#" target="new">Streamline&nbsp;Loan<BR>
Processor&nbsp;Report</a>
</cfif></td>
		<td width="111" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/cancelled_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color="660000" face=verdana>Cancelled</font></a>
				</cfoutput>
				</CENTER>
		</td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>
			<CFIF #role_mgr# eq "1">
				<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>
			</CFIF>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onClick="location.reload()">Refresh</A></center></td>
		<td width="111" bgcolor="#CCD2D2"><Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/login_as_client.cfm?uid=#URL.uid#&al=#URL.al#" target="client_window">
				<font size=2 color=blue face=verdana>Login As Client</font></a>
				</cfoutput>
				</CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/met/projects" target="projects_window">
				<font size=2 color=blue face=verdana>Projects</font></a>
				</cfoutput>
				</CENTER></td>
</tr></table> </cfif>
<table width="100%">
	<tr>
		<TD align="center">
			<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            Clear To Close Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
		</TD>
	</tr>
</table>
	
	
<cfset ninety_days_ago = DateAdd("d", -180, Now())>

	<!---End of binder data not merged --->
	<table width="893" align="center">
		<br>
		<tr>
			<TD colspan=8><Center><B>Binder Typed/Title Ins. Not Completed</B></CENTER></TD>
		</tr>
		<TR>
			<CFIF #read_user.role_mgr# eq 1>
			<td bgcolor="elelel" valign=top align="center">
				<b>Reassign</b>
			</td>
			</CFIF>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Num</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Date</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Due Date</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Merged Time</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Borrower</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>State</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Client</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Status</B>
			</td>
<!--- 			<td bgcolor="elelel" valign=top align="center">
				<B>Assigned To</B>
			</td>
 --->
		<!---<td bgcolor="elelel" valign=top align="center">
			<B>Clear to Close?</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Scheduled Closing Date</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Last Comment</B>
		</td>--->
 			<td bgcolor="elelel" valign=top align="center">
				<B>Comments</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Taxes Complete</B>
			</td>
		</TR>

		<CFPARAM NAME="MaxRows" DEFAULT="2000">
		<CFPARAM NAME="StartRow" DEFAULT="1">

		<CFQUERY datasource="#request.dsn#" NAME="read_closing">
			Select * from sqlCTC_BinderCompleted_TitleInReview
	where
	
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	 fairfax_client = 1
	</cfif>
	<cfif session.ft_user_id eq 418 or session.ft_user_id eq 411>
	 (streamline_client = 0 or streamline_client = NULL or streamline_client = 'False')
	</cfif>
	<cfif session.tx_admin eq 1>
	 pstate = 'TX'
	</cfif>
	comp_id <> 9711 <!--- excludes 'Landsafe' files --->
	AND title_id <> 124720 AND title_id <> 127835
    and (seller_rep = '0' or seller_rep = 'False' or seller_rep is NULL or seller_rep = 'TBD')
	<cfif isDefined("sbonly")>
		and (comp_id = 6415
		)
        <cfelse>
		and (comp_id <> 6415
		)
	</cfif>
	<cfif isDefined("streamlineonly")>
		and (comp_id = 2368 or comp_id = 2372 or comp_id = 3568
		)
        <cfelse>
		and (comp_id <> 2368 and comp_id <> 2372 and comp_id <> 3568
		)
	</cfif>
    		and (comp_id <> 11100 and comp_id <> 11087 
		)

		</CFQUERY>
		
		<cfquery dbtype="query" name="read_closing_list">
			select * from read_closing
			where appraisal_status <> 'In Process'
			<!---AND (appraisal_status <> 'Closing Scheduled' AND (abstractor_doc_upload3 IS NULL OR abstractor_doc_upload3 = ''))
			--->
		</cfquery>


<CFSET a_color_trigger = "2">
		<CFSET a_bgcolor = "white">
<cfset a_color_temp = a_bgcolor>


<!---<cfif cgi.REMOTE_ADDR eq '98.233.235.105'>
<cfdump var="#read_closing#">
<cfabort>
</cfif>
--->

<CFOUTPUT QUERY="read_closing_list">
<cfset tx_file = 0>
<cfif read_closing_list.pstate eq 'TX' or ListFind(tx_ids, read_closing_list.intsales, ",") gte 1>
<cfset tx_file = 1>
</cfif>

<cfif company contains 'Shore'>
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
		Select va_employee, ft_fairfax_employee
		from First_Admin where ID = #read_closing_list.intSales#
</CFQUERY>
	<cfset richmond = 0>
<cfif check_richmond.va_employee eq 1>
	<cfset richmond = 1>
</cfif>
	<cfset fx = 0>
<cfif check_richmond.ft_fairfax_employee eq 1 or (Mid(company, 1, 3) eq 'GMH' and company contains 'Construction')>
	<cfset fx = 1>
</cfif>
<cfset taxes_ordered_not_received = 0>
<CFQUERY datasource="#request.dsn#" NAME="read_tax">
		Select * from tax_cert_title
		where title_id = #title_id#
</CFQUERY>
<cfif isdefined("read_tax.taxes_completed") and read_tax.taxes_completed NEQ 1 AND  isdefined("read_tax.tx_type") and read_tax.tx_type eq "1">
<cfset taxes_ordered_not_received = 1>
</cfif>



<cfif company neq 'ROA Hutton - Geddes Lake' and NOT ListContainsNoCase(appraisal_status, "Loan Closed", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Funded", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Closed-Seller Rep", ",")  and NOT ListContainsNoCase(appraisal_status, "Abstract sent - waiting for contract", ",")  and (order_date GTE DateFormat(ninety_days_ago, "m/d/yyyy") or (merge_date neq 'NULL' and merge_date GTE DateFormat(ninety_days_ago, "m/d/yyyy")))>

<cfif read_closing_list.comp_id eq 7393 or read_closing_list.comp_id eq 7402>
		<cfset a_bgcolor="FF0000">
<cfelseif read_closing_list.streamline_client eq 'True'>
<cfset a_bgcolor="FFCC66">
<cfelseif read_closing_list.comp_id eq 12324>
<cfset a_bgcolor="66CCCC">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="getOrderDate">
		select max(assign_Date) as assign_Date
		from vendor_tracker_new
		where task = 'Abstract' AND order_id = #title_id#
	</cfquery>


                <!---<cfquery name="get_nctc" datasource="#request.dsn#" maxrows="1">
                SELECT  * from title_notes where (order_id = #read_closing_list.title_id#
                and note_type = 'T' and n_note like 'not clear to close%' and (nctc_cleared IS NULL or nctc_cleared = 'False'))
                order by n_date desc
                </cfquery>--->

<tr>

			<CFIF #read_user.role_mgr# eq 1 >
						<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
							<a href="./update_cleartoclose.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1"><font size=1 color=Green face=verdana>R</font></a>
						</td>
					</CFIF>

			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Closing_list.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana><cfif richmond eq 1>(R) </cfif><cfif fx eq 1>(FX) </cfif><cfif tx_file eq 1>(TX) </cfif>T-#title_id#</font></a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<cfif not Len(getOrderDate.assign_Date)>#DateFormat(check_date, "m/d/yyyy")#<cfelse>#DateFormat(getOrderDate.assign_date, "m/d/yyyy")#</cfif>

			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(duedate, "m/d/yyyy")#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(n_date, "m/d/yy")# #TimeFormat(n_time, "hh:mm tt")#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#BFirstName1# #BLastName1#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#read_closing_list.pstate#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#appraisal_status#
			</td>
<!--- 			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#read_closing_list.fname#
			</td>
 --->
 
 
 
 
 

 			<!---<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<cfif #get_nctc.recordcount#>No<BR>
                    <cfloop query="get_nctc" startrow="1" endrow="3">
                    <nobr>#DateFormat(get_nctc.N_Date, "mm/dd/yyyy")# <cfif Len(get_nctc.n_note)> - #get_nctc.n_note#</cfif><cfif Len(get_nctc.issue_type)> - #get_nctc.issue_type#</cfif><cfif Len(get_nctc.issue)> - #get_nctc.issue#</cfif></nobr>
                    </cfloop>
                    <cfelse>
                <cfquery name="get_ctc" datasource="#request.dsn#" maxrows="1">
                SELECT  * from title_notes where (order_id = #read_closing_list.title_id#
                and note_type = 'T' and n_note like 'Clear to close%')
                order by n_date desc
                </cfquery>
                <cfif #get_ctc.recordcount#>Yes<Cfelse>Unmarked</cfif></cfif>
			</td>
            
            <cfquery name="get_close_date" datasource="#request.dsn#" maxrows="1">
                SELECT  request_date
                FROM Title_Closing_Order_Request 
                where title_id = #read_closing_list.title_id#
            </cfquery>
            
 			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<cfif get_close_date.recordcount>#DateFormat(get_close_date.request_date, "mm/dd/yyyy")#<cfelse>none scheduled</cfif>
			</td>

                <cfquery name="last_comment" datasource="#request.dsn#" maxrows="1">
                SELECT  * from title_notes where order_id = #read_closing_list.title_id#
                and note_type = 'T'
                order by n_date desc
                </cfquery>

 			<td bgcolor="#a_bgcolor#" valign=center align="center"><font size=1 color=black face=verdana><b>
				<cfif #last_comment.recordcount#>#DateFormat(last_comment.N_Date, "mm/dd/yyyy")#<br>
#last_comment.fname# #last_comment.lname#<br>
#last_comment.n_note#<cfelse>&nbsp;</cfif>
			</td>--->








 			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Closing_list.title_id#&a_trigger=1&code=T&rec_type=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
			</td>
 			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b><cfif read_tax.taxes_completed eq 1>Yes<cfelse>No</cfif></b></font>
			</td>
		</tr>
		<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
</cfif>
</cfif>
		</CFOUTPUT>
		
		
		
<CFOUTPUT QUERY="read_closing_list">
<cfif company does not contain 'Shore'>
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
		Select va_employee, ft_fairfax_employee
		from First_Admin where ID = #read_closing_list.intSales#
</CFQUERY>
	<cfset richmond = 0>
<cfif check_richmond.va_employee eq 1>
	<cfset richmond = 1>
</cfif>
	<cfset fx = 0>
<cfif check_richmond.ft_fairfax_employee eq 1 or (Mid(company, 1, 3) eq 'GMH' and company contains 'Construction')>

	<cfset fx = 1>
</cfif>
<cfset taxes_ordered_not_received = 0>
<CFQUERY datasource="#request.dsn#" NAME="read_tax">
		Select * from tax_cert_title
		where title_id = #title_id#
</CFQUERY>

<cfset tx_file = 0>
<cfif read_closing_list.pstate eq 'TX' or ListFind(tx_ids, read_closing_list.intsales, ",") gte 1>
<cfset tx_file = 1>
</cfif>


<cfif isdefined("read_tax.taxes_completed") and read_tax.taxes_completed NEQ 1 AND  isdefined("read_tax.tx_type") and read_tax.tx_type eq "1">
<cfset taxes_ordered_not_received = 1>
</cfif>

<cfif company neq 'ROA Hutton - Geddes Lake' and NOT ListContainsNoCase(appraisal_status, "Loan Closed", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Funded", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Closed-Seller Rep", ",") and NOT ListContainsNoCase(appraisal_status, "Abstract sent - waiting for contract", ",")  and (order_date GTE DateFormat(ninety_days_ago, "m/d/yyyy") or (merge_date neq 'NULL' and merge_date GTE DateFormat(ninety_days_ago, "m/d/yyyy")))>

<cfif read_closing_list.comp_id eq 7393 or read_closing_list.comp_id eq 7402>
		<cfset a_bgcolor="FF0000">
<cfelseif read_closing_list.streamline_client eq 'True'>
<cfset a_bgcolor="FFCC66">
<cfelseif read_closing_list.comp_id eq 12324>
<cfset a_bgcolor="66CCCC">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="getOrderDate">
		select max(assign_Date) as assign_Date
		from vendor_tracker_new
		where task = 'Abstract' AND order_id = #title_id#
	</cfquery>



                <cfquery name="get_nctc" datasource="#request.dsn#" maxrows="1">
                SELECT  * from title_notes where (order_id = #read_closing_list.title_id#
                and note_type = 'T' and n_note like 'not clear to close%' and (nctc_cleared IS NULL or nctc_cleared = 'False'))
                order by n_date desc
                </cfquery>

<tr>

			<CFIF #read_user.role_mgr# eq 1 >
						<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
							<a href="./update_cleartoclose.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1"><font size=1 color=Green face=verdana>R</font></a>
						</td>
					</CFIF>

			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Closing_list.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana><cfif richmond eq 1>(R) </cfif><cfif fx eq 1>(FX) </cfif><cfif tx_file eq 1>(TX) </cfif>T-#title_id#</font></a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<cfif not Len(getOrderDate.assign_Date)>#DateFormat(check_date, "m/d/yyyy")#<cfelse>#DateFormat(getOrderDate.assign_date, "m/d/yyyy")#</cfif>

			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(duedate, "m/d/yyyy")#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#DateFormat(n_date, "m/d/yy")# #TimeFormat(n_time, "hh:mm tt")#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#BFirstName1# #BLastName1#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#read_closing_list.pstate#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#appraisal_status#
			</td>
<!--- 			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#read_closing_list.fname#
			</td>
 --->
 
 			<!---<td bgcolor="#a_bgcolor#" valign=center align="center"><font size=1 color=black face=verdana><b>
				<cfif #get_nctc.recordcount#>No<BR>
                    <cfloop query="get_nctc" startrow="1" endrow="3">
                    <nobr>#DateFormat(get_nctc.N_Date, "mm/dd/yyyy")# <cfif Len(get_nctc.n_note)> - #get_nctc.n_note#</cfif><cfif Len(get_nctc.issue_type)> - #get_nctc.issue_type#</cfif><cfif Len(get_nctc.issue)> - #get_nctc.issue#</cfif></nobr>
                    </cfloop>
                    <cfelse>
                <cfquery name="get_ctc" datasource="#request.dsn#" maxrows="1">
                SELECT  * from title_notes where (order_id = #read_closing_list.title_id#
                and note_type = 'T' and n_note like 'Clear to close%')
                order by n_date desc
                </cfquery>
                <cfif #get_ctc.recordcount#>Yes<Cfelse>Unmarked</cfif></cfif>
			</td>
            
            <cfquery name="get_close_date" datasource="#request.dsn#" maxrows="1">
                SELECT  request_date
                FROM Title_Closing_Order_Request 
                where title_id = #read_closing_list.title_id#
            </cfquery>
            
 			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<cfif get_close_date.recordcount>#DateFormat(get_close_date.request_date, "mm/dd/yyyy")#<cfelse>none scheduled</cfif>
			</td>

                <cfquery name="last_comment" datasource="#request.dsn#" maxrows="1">
                SELECT  * from title_notes where order_id = #read_closing_list.title_id#
                and note_type = 'T'
                order by n_date desc
                </cfquery>

 			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<cfif #last_comment.recordcount#>#DateFormat(last_comment.N_Date, "mm/dd/yyyy")#<br>
#last_comment.fname# #last_comment.lname#<br>
#last_comment.n_note#<cfelse>&nbsp;</cfif>
			</td>--->



 			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Closing_list.title_id#&a_trigger=1&code=T&rec_type=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
			</td>
 			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b><cfif read_tax.taxes_completed eq 1>Yes<cfelse>No</cfif></b></font>
			</td>
		</tr>
		<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
</cfif>
</cfif>
		</CFOUTPUT>
	</table>

</body>
</html>