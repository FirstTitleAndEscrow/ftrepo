	<CFSET MaxRows = 2000>
	<CFSET StartRow = 1>
<CFPARAM NAME="url.rick" DEFAULT="">
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
<CFPARAM NAME="url.salesID" DEFAULT="">

<CFQUERY datasource="#request.dsn#" NAME="read_tx">
	select * from first_admin
			WHERE tx_employee = 'True'
</CFQUERY>
<cfset tx_ids = ValueList(read_tx.id, ",")>


<cfset ninety_days_ago = DateAdd("d", -180, Now())>

<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	select * from first_admin
			WHERE ID = #session.ft_user_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
	Select * from sqlCTC_NotClear_To_Close where CTC_Name = '#a_fname#'
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	and fairfax_client = 1
	</cfif>
	<cfif session.ft_user_id eq 418 or session.ft_user_id eq 411>
	and (streamline_client = 0 or streamline_client = NULL)
	</cfif>
	<cfif session.tx_admin eq 1>
	and pstate = 'TX'
	</cfif>
<cfif url.salesID neq ''>
and intSales = #url.salesID#
</cfif>
</CFQUERY>
<cfset all_web_ids = ValueList(read_NotClear_To_Close_Name.title_id, ",")>

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
<CFSET a_color_trigger = "2">
		<CFSET a_bgcolor = "white">
<cfset a_color_temp = a_bgcolor>

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
<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput></td></tr>
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
<!--- 
	<!---Second part of report only for people who work on Clear To Close--->
	<!---Do a group by to get all of the names --->
		<CFQUERY datasource="#request.dsn#" NAME="CTC_Names">
			Select CTC_Name from sqlCTC_NotClear_To_Close  where CTC_Name is not null
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	and fairfax_client = 1
	</cfif>
	<cfif session.ft_user_id eq 418 or session.ft_user_id eq 411>
	and (streamline_client = 0 or streamline_client = NULL)
	</cfif>
group by CTC_Name
order by CTC_Name
		</CFQUERY>
		<!---Loop through one name at a time --->
		<cfset a_color_temp = a_bgcolor>
		<CFLOOP QUERY="CTC_Names">
		<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
			Select * from sqlCTC_NotClear_To_Close where CTC_Name = '#CTC_Names.CTC_Name#'
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	and fairfax_client = 1
	</cfif>
	<cfif session.ft_user_id eq 418 or session.ft_user_id eq 411>
	and (streamline_client = 0 or streamline_client = NULL)
	</cfif>
	order by title_id
		</CFQUERY>
	<table width="893" align="center">

<cfif read_NotClear_To_Close_Name.comp_id eq 7393 or read_NotClear_To_Close_Name.comp_id eq 7402>
		<cfset a_bgcolor="FF0000">
<cfelseif read_NotClear_To_Close_Name.streamline_client eq 'True'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
				<tr>
					<CFIF #read_user.role_mgr# eq 1 >
						<TD colspan=8>
					<CFELSE>
						<TD colspan=7>
					</CFIF>
					<Center><B>Title Ins. Completed/Not Clear To Close for <cfoutput>#CTC_Names.CTC_Name#</cfoutput></B></CENTER>
					</TD>
				</tr>
				<TR>
				<!--- <CFIF cgi.REMOTE_ADDR eq '98.233.232.47'>
					<td bgcolor="elelel" valign=top align="center">&nbsp;

					</TD>
				</CFIF>	 --->
				<CFIF #read_user.role_mgr# eq 1 >
					<td bgcolor="elelel" valign=top align="center">&nbsp;

					</TD>
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
						<B>Borrower</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Client</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Status</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Comments</B>
						</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Assigned To</B>
						</td>
					<!--- <td bgcolor="elelel" valign=top align="center">
						<B>Reassign</B>
						</td> --->
					<!--- <td bgcolor="elelel" valign=top align="center">
						<B>Issue Type</B>
						</td> --->
					</TR>
					<CFSET a_color_trigger = "2">
					<CFSET a_bgcolor = "white">

<CFOUTPUT QUERY="read_NotClear_To_Close_Name">
<cfset all_web_ids = ValueList(read_NotClear_To_Close_Name.title_id, ",")>
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
		Select va_employee
		from First_Admin where ID = #read_NotClear_To_Close_Name.intSales#
</CFQUERY>
	<cfset richmond = 0>
<cfif check_richmond.va_employee eq 1>
	<cfset richmond = 1>
</cfif>
	<cfset streamline = 0>
<cfif read_NotClear_To_Close_Name.streamline_client eq 1 or read_NotClear_To_Close_Name.streamline_client eq 'True'>
	<cfset streamline = 1>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="getOrderDate">
		select max(assign_Date) as assign_Date
		from vendor_tracker_new
		where task = 'Abstract' AND order_id = #title_id#
	</cfquery>

<!--- <CFQUERY datasource="#request.dsn#" NAME="getSimpleIssue" maxrows=1>
		select N_Date, N_Note, order_id
		from Title_notes
		where order_id = #title_id#
		and
		(N_Note LIKE 'File marked Not Clear to Close - Issue Type: Simple%')
	</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="getComplexIssue" maxrows=1>
		select N_Date, N_Note, order_id
		from Title_notes
		where order_id = #title_id#
		and
		(N_Note LIKE 'File marked Not Clear to Close - Issue Type: Complex%')
	</cfquery>
 --->
<cfif read_NotClear_To_Close_Name.comp_id eq 7393 or read_NotClear_To_Close_Name.comp_id eq 7402>
		<cfset a_bgcolor="FF0000">
<cfelse>
		<cfset a_bgcolor="elelel">
</cfif>

<cfset ninety_days_ago = DateAdd("d", -90, Now())>
<cfset date_difference = DateDiff("d", read_NotClear_To_Close_Name.check_date, Now())>
<cfif company neq 'ROA Hutton - Geddes Lake' and NOT ListContainsNoCase(appraisal_status, "Loan Closed", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Funded", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Closed-Seller Rep", ",") and (date_difference LTE 90)  and (check_date GTE '09/01/2008')>				<tr>
					<!--- <CFIF cgi.REMOTE_ADDR eq '98.233.232.47'>
					<td bgcolor="elelel" valign=top align="center">#date_difference#

					</TD>
				</CFIF>	 --->
				<CFIF #read_user.role_mgr# eq 1 >
						<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
							<a href="./update_cleartoclose.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1"><font size=1 color=Green face=verdana>R</font></a>
						</td>
					</CFIF>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana><cfif richmond eq 1>(R) </cfif><cfif streamline eq 1>(S) </cfif>T-#title_id#</font></a>
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<cfif not Len(getOrderDate.assign_date)>#DateFormat(check_date, "m/d/yyyy")#<cfelse>#DateFormat(getOrderDate.assign_date, "m/d/yyyy")#</cfif>
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(duedate, "m/d/yyyy")#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#BFirstName1# #BLastName1#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#company#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#appraisal_status#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1&code=T&rec_type=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>

<cfif Len(cleartoclosereview_assignedToID)>
<CFQUERY datasource="#request.dsn#" NAME="get_assigned_to">
		select * from First_Admin where ID = #cleartoclosereview_assignedToID#
</cfquery>
<cfif get_assigned_to.recordcount gt 0>
#get_assigned_to.fname# #get_assigned_to.lname#
<cfelse>
Not Assigned
</cfif>
<cfelse>
Not Assigned
</cfif>
</td>
					<!--- <td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<form>
						<input type="hidden" name="title_id" value="#title_id#">
						<select onchange="ctcAssign(#title_id#)" id="ctc_#title_id#"><option value=""></option>
							<option value="499" <cfif cleartoclosereview_assignedToID EQ 499>selected</cfif>>Kenneth Bean</option>
							<option value="487" <cfif cleartoclosereview_assignedToID EQ 487>selected</cfif>>Lynn Bullock</option>
							<option value="495" <cfif cleartoclosereview_assignedToID EQ 495>selected</cfif>>Christina Frankenberg</option>
							<option value="344" <cfif cleartoclosereview_assignedToID EQ 344>selected</cfif>>Randa Ibrahim</option>
							<option value="318" <cfif cleartoclosereview_assignedToID EQ 318>selected</cfif>>Steve Sacks</option>
							<option value="476" <cfif cleartoclosereview_assignedToID EQ 476>selected</cfif>>LaKeisha Wilson</option>
							<option value="504" <cfif cleartoclosereview_assignedToID EQ 504>selected</cfif>>Subordination Department</option>
						</select>
						</form>
					</td> --->

					<!--- <td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b><cfif getSimpleIssue.recordcount eq 1>Simple </cfif><cfif getComplexIssue.recordcount eq 1>Complex</cfif></b></td --->

				</tr>
				<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
</cfif>
				</CFOUTPUT>
			</table>
		</CFLOOP>
		<br> --->
<!---All Not Clear To Close --->
<cfset ninety_days_ago = DateAdd("d", -180, Now())>
<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
			Select * from sqlCTC_NotClear_To_Close where 1 = 1
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	and fairfax_client = 1
	</cfif>
	<cfif session.ft_user_id eq 418 or session.ft_user_id eq 411>
	and (streamline_client = 0 or streamline_client = NULL or streamline_client = 'False')
	</cfif>
	<cfif session.tx_admin eq 1>
	and pstate = 'TX'
	</cfif>
<cfif Len(all_web_ids)>
and title_id not in (#all_web_ids#)
</cfif>
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

and appraisal_status <> 'Loan Closed'
and appraisal_status <> 'Loan Closed-Seller Rep'
and appraisal_status <> 'Loan Funded'
and appraisal_status <> 'Cancelled per Client'
and appraisal_status <> 'Order Cancelled'
and company <> 'ROA Hutton - Geddes Lake'
and check_date >= '#DateFormat(ninety_days_ago, "m/d/yyyy")#'
<cfif url.salesID neq ''>
and intSales = #url.salesID#
</cfif>
 order by on_hold, title_id
		</CFQUERY>
        
      <!---<cfif cgi.REMOTE_ADDR eq '98.233.235.105'>
        <cfdump var="#read_NotClear_To_Close_Name#">
        
        <cfabort>
        </cfif>--->
        
	<table width="893" align="center">

<cfif read_NotClear_To_Close_Name.streamline_client eq 'True'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
				<tr>
					<CFIF #read_user.role_mgr# eq 1 >
						<TD colspan=8>
					<CFELSE>
						<TD colspan=7>
					</CFIF>
					<Center><B>Title Ins. Completed/Not Clear To Close for All</B></CENTER>
					</TD>
				</tr>
				<TR>
				<!--- <CFIF cgi.REMOTE_ADDR eq '98.233.232.47'>
					<td bgcolor="elelel" valign=top align="center">&nbsp;

					</TD>
				</CFIF>	 --->
				<CFIF #read_user.role_mgr# eq 1 >
					<td bgcolor="elelel" valign=top align="center">&nbsp;

					</TD>
				</CFIF>

					<td bgcolor="elelel" valign=top align="center" width=150>
						<B>Order Num</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Order Date</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Due Date</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Borrower</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Client</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Sales</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Loan Number</B>
					</td>
					<td bgcolor="elelel" valign=top align="center" width=150>
						<B>Status</B>
					</td>

		<td bgcolor="elelel" valign=top align="center">
			<B>Scheduled Closing Date</B>
		</td>
		<!---<td bgcolor="elelel" valign=top align="center">
			<B>Last Comment</B>
		</td>--->
                    
                    
                    
                    
					<td bgcolor="elelel" valign=top align="center">
						<B>Comments</B>
						</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Assigned To</B>
						</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Assigned Date</B>
						</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>On-Hold</B>
						</td>
					<!--- <td bgcolor="elelel" valign=top align="center">
						<B>Reassign</B>
						</td> --->
					</TR>
					<CFSET a_color_trigger = "2">
					<CFSET a_bgcolor = "white">

				<CFOUTPUT QUERY="read_NotClear_To_Close_Name">
                
 
 

<cfset tx_file = 0>
<cfif read_NotClear_To_Close_Name.pstate eq 'TX' or ListFind(tx_ids, read_NotClear_To_Close_Name.intsales, ",") gte 1>
<cfset tx_file = 1>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
		Select va_employee, ft_fairfax_employee, tx_employee, mi_employee, mo_employee, mi_flushing_employee, streamline_employee, fname, lname
		from First_Admin where ID = #read_NotClear_To_Close_Name.intSales#
</CFQUERY>



			<cfset prefix = "T-">

		<cfif check_richmond.va_employee EQ 1>
			<cfset prefix = "(R) "&prefix>
		</cfif>
		<cfif check_richmond.tx_employee EQ 1>
			<cfset prefix = "(TX) "&prefix>
		</cfif>
		<cfif check_richmond.mi_employee EQ 1>
			<cfset prefix = "(MI) "&prefix>
		</cfif>
		<cfif check_richmond.mo_employee EQ 1>
			<cfset prefix = "(MO) "&prefix>
		</cfif>
		<cfif check_richmond.mi_flushing_employee EQ 1>
			<cfset prefix = "(MF) "&prefix>
		</cfif>
		<cfif read_NotClear_To_Close_Name.streamline_client eq 1 or read_NotClear_To_Close_Name.streamline_client eq 'True'>
			<cfset prefix = "(ST) "&prefix>
		</cfif>
<cfif check_richmond.ft_fairfax_employee eq 1 or (Mid(company, 1, 3) eq 'GMH' and company contains 'Construction')>
			<cfset prefix = "(FX) "&prefix>
</cfif>





<CFQUERY datasource="#request.dsn#" NAME="getOrderDate">
		select max(assign_Date) as assign_Date
		from vendor_tracker_new
		where task = 'Abstract' AND order_id = #title_id#
	</cfquery>



                <!---<cfquery name="get_nctc" datasource="#request.dsn#" maxrows="1">
                SELECT  * from title_notes where (order_id = #read_NotClear_To_Close_Name.title_id#
                and note_type = 'T' and n_note like 'not clear to close%' and (nctc_cleared IS NULL or nctc_cleared = 'False'))
                order by n_date desc
                </cfquery>--->
<tr>
					<!--- <CFIF cgi.REMOTE_ADDR eq '98.233.232.47'>
					<td bgcolor="elelel" valign=top align="center">#date_difference#

					</TD>
				</CFIF>	 --->
				<CFIF #read_user.role_mgr# eq 1 >
						<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
							<a href="./update_cleartoclose.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1"><font size=1 color=Green face=verdana>R</font></a>
						</td>
					</CFIF>
					<td bgcolor="#a_bgcolor#" valign=center align="center" width=150> <font size=1 color=black face=verdana><b>
						<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>#prefix##title_id#</font></a>
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<cfif not Len(getOrderDate.assign_date)>#DateFormat(check_date, "m/d/yyyy")#<cfelse>#DateFormat(getOrderDate.assign_date, "m/d/yyyy")#</cfif>
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(duedate, "m/d/yyyy")#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#BFirstName1# #BLastName1#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#company#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#check_richmond.fname# #check_richmond.lname#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#loan_number#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center" width=150> <font size=1 color=black face=verdana><b>
						#appraisal_status#
					</td>



            
            <cfquery name="get_close_date" datasource="#request.dsn#" maxrows="1">
                SELECT  request_date
                FROM Title_Closing_Order_Request 
                where title_id = #read_NotClear_To_Close_Name.title_id#
            </cfquery>
            
                    
					<td bgcolor="#a_bgcolor#" valign=center align="center" width=150> <font size=1 color=black face=verdana><b>
						 <font size=1 color=black face=verdana><b>
				<cfif get_close_date.recordcount>#DateFormat(get_close_date.request_date, "mm/dd/yyyy")#<cfelse>none scheduled</cfif>
					</td>
                    
              <!---<cfquery name="last_comment" datasource="#request.dsn#" maxrows="1">
                SELECT  * from title_notes where order_id = #read_NotClear_To_Close_Name.title_id#
                and note_type = 'T'
                order by note_id desc
                </cfquery>
                    
					<td bgcolor="#a_bgcolor#" valign=center align="center" width=150><font size=1 color=black face=verdana><b>

				<cfif #last_comment.recordcount#>#DateFormat(last_comment.N_Date, "mm/dd/yyyy")#<br>
#last_comment.fname# #last_comment.lname#<br>
#last_comment.n_note#<cfelse>&nbsp;</cfif>
					</td>--->
                    
                    
                    
                    
                    
                    
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_Name.title_id#&a_trigger=1&code=T&rec_type=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
<cfif Len(cleartoclosereview_assignedToID)>
<CFQUERY datasource="#request.dsn#" NAME="get_assigned_to">
		select * from First_Admin where ID = #cleartoclosereview_assignedToID#
</cfquery>
<cfif get_assigned_to.recordcount gt 0>
#get_assigned_to.fname# #get_assigned_to.lname#
<cfelse>
Not Assigned
</cfif>
<cfelse>
Not Assigned
</cfif>
</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
<cfif Len(cleartoclosereview_assignedDate)>
<cfif get_assigned_to.recordcount gt 0>
#DateFormat(cleartoclosereview_assignedDate, "mm/dd/yyyy")#
<cfelse>
&nbsp;
</cfif>
<cfelse>
&nbsp;
</cfif>
</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
<cfif read_NotClear_To_Close_Name.on_hold eq 'True'>
X
<cfelse>
&nbsp;
</cfif>
</td>
					<!--- <td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<form>
						<input type="hidden" name="title_id" value="#title_id#">
						<select onchange="ctcAssign(#title_id#)" id="ctc_#title_id#"><option value=""></option>
							<option value="499" <cfif cleartoclosereview_assignedToID EQ 499>selected</cfif>>Kenneth Bean</option>
							<option value="487" <cfif cleartoclosereview_assignedToID EQ 487>selected</cfif>>Lynn Bullock</option>
							<option value="495" <cfif cleartoclosereview_assignedToID EQ 495>selected</cfif>>Christina Frankenberg</option>
							<option value="344" <cfif cleartoclosereview_assignedToID EQ 344>selected</cfif>>Randa Ibrahim</option>
							<option value="318" <cfif cleartoclosereview_assignedToID EQ 318>selected</cfif>>Steve Sacks</option>
							<option value="476" <cfif cleartoclosereview_assignedToID EQ 476>selected</cfif>>LaKeisha Wilson</option>
							<option value="504" <cfif cleartoclosereview_assignedToID EQ 504>selected</cfif>>Subordination Department</option>
						</select>
						</form>
						</td> --->

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
		


<!---End All Not Clear To Close --->
<!---Show rows where no names is assigned --->
<!--- 

<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_NoName">
	Select * from sqlCTC_NotClear_To_Close where CTC_Name is null
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	and fairfax_client = 1
	</cfif>
	<cfif session.ft_user_id eq 418 or session.ft_user_id eq 411>
	and (streamline_client = 0 or streamline_client = NULL)
	</cfif>
	<!--- order by title_id --->
</CFQUERY>
			<table width="893" align="center">
				<br>
				<tr>
					<TD colspan=8><Center><B>Not Clear To Close - Older Files</B></CENTER></TD>
				</tr>
				<TR>
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
						<B>Borrower 1</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Client</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Status</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Comments</B>
					</td>
					<td bgcolor="elelel" valign=top align="center">
						<B>Assigned To</B>
						</td>
					<!--- <td bgcolor="elelel" valign=top align="center">
						<B>Reassign</B>
						</td> --->
				</TR>
				<cfset a_color_temp = a_bgcolor>
				<CFOUTPUT QUERY="read_NotClear_To_Close_NoName">
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
		Select va_employee
		from First_Admin where ID = #read_NotClear_To_Close_NoName.intSales#
</CFQUERY>
	<cfset richmond = 0>
<cfif check_richmond.va_employee eq 1>
	<cfset richmond = 1>
</cfif>
	<cfset streamline = 0>
<cfif read_NotClear_To_Close_NoName.streamline_client eq 1 or read_NotClear_To_Close_NoName.streamline_client eq 'True'>
	<cfset streamline = 1>
</cfif>
<cfset ninety_days_ago = DateAdd("d", -90, Now())>
<cfset date_difference = DateDiff("d", read_NotClear_To_Close_NoName.check_date, Now())>

<cfif company neq 'ROA Hutton - Geddes Lake' and NOT ListContainsNoCase(appraisal_status, "Loan Closed", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Funded", ",") and NOT ListContainsNoCase(appraisal_status, "Loan Closed-Seller Rep", ",") and (date_difference LTE 90) and (check_date GTE '09/01/2008')>

<cfif read_NotClear_To_Close_NoName.streamline_client eq 'True'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif><tr>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_NoName.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana><cfif richmond eq 1>(R) </cfif><cfif streamline eq 1>(S) </cfif>T-#title_id#</font></a>
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(check_date, "m/d/yyyy")#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#DateFormat(duedate, "m/d/yyyy")#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#BFirstName1# #BLastName1#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#company#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						#appraisal_status#
					</td>
					<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_NotClear_To_Close_NoName.title_id#&a_trigger=1&code=T&rec_type=T" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
					</td>
<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>

<cfif Len(cleartoclosereview_assignedToID)>
<CFQUERY datasource="#request.dsn#" NAME="get_assigned_to">
		select * from First_Admin where ID = #cleartoclosereview_assignedToID#
</cfquery>
<cfif get_assigned_to.recordcount gt 0>
#get_assigned_to.fname# #get_assigned_to.lname#
<cfelse>
Not Assigned
</cfif>
<cfelse>
Not Assigned
</cfif>
</td>
					<!--- <td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
						<form>
						<input type="hidden" name="title_id" value="#title_id#">
						<select onchange="ctcAssign(#title_id#)" id="ctc_#title_id#"><option value=""></option>
							<option value="499" <cfif cleartoclosereview_assignedToID EQ 499>selected</cfif>>Kenneth Bean</option>
							<option value="487" <cfif cleartoclosereview_assignedToID EQ 487>selected</cfif>>Lynn Bullock</option>
							<option value="495" <cfif cleartoclosereview_assignedToID EQ 495>selected</cfif>>Christina Frankenberg</option>
							<option value="344" <cfif cleartoclosereview_assignedToID EQ 344>selected</cfif>>Randa Ibrahim</option>
							<option value="318" <cfif cleartoclosereview_assignedToID EQ 318>selected</cfif>>Steve Sacks</option>
							<option value="476" <cfif cleartoclosereview_assignedToID EQ 476>selected</cfif>>LaKeisha Wilson</option>
							<option value="504" <cfif cleartoclosereview_assignedToID EQ 504>selected</cfif>>Subordination Department</option>
							<option value="505" <cfif cleartoclosereview_assignedToID EQ 505>selected</cfif>>Richmond</option>
						</select>
						</form>
					</td> --->
				</tr>
				<CFIF #a_color_trigger# eq "1">
					<CFSET a_bgcolor = "white">
					<CFSET a_color_trigger = "2">
				<CFELSE>
					<CFSET a_bgcolor = "d3d3d3">
					<CFSET a_color_trigger = "1">
				</CFIF>
</cfif>
				</CFOUTPUT>
			</table>
	</table>

 --->