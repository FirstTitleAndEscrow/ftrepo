	
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
	
	<cfif isDefined("sbonly")>
		and (comp_id = 6415
		)
	</cfif>
</CFQUERY>

<cfset chase_realEC_accts = "7393,7402">
<cfset FMN_accts = "12324">
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
<!---Binder Data Not Merged --->
<table width="893" align="center">
	<tr>
		<CFIF #read_user.role_mgr# eq 1>
			<TD colspan=9>
		<CFELSE>
			<TD colspan=8>
		</CFIF>
		<Center><B>Binder Data Not Merged</B></CENTER></TD>
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
			<B>Borrower</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Client</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>State</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Sale Date</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Due Date</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Status</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Assigned To</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Typing Assigned To</B>
		</td>
		<td bgcolor="elelel" valign=top align="center">
			<B>Comments</B>
		</td>
	</TR>
	<CFPARAM NAME="MaxRows" DEFAULT="2000">
	<CFPARAM NAME="StartRow" DEFAULT="1">

	<CFQUERY datasource="#request.dsn#" NAME="read_Binder_Not_Merged">
		Select s.*, a.va_employee, a.ft_fairfax_employee, v.company as typing_vendor from sqlCTC_Binder_Not_Merged s
		left join first_admin a on s.intsales = a.id
		left join vendor_tracker_new vt on (vt.order_id = s.title_id AND vt.task = 'Typing')
		left join vendors_stacie v on v.vendor_id = vt.vendor_id
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	where fairfax_client = 1
	</cfif>
	<cfif session.ft_user_id eq 418 or session.ft_user_id eq 411>
	where (streamline_client = 0 or streamline_client = NULL)
	</cfif>
	<cfif session.tx_admin eq 1>
	where pstate = 'TX'
	</cfif>
	<cfif isDefined("sbonly")>
		where (comp_id = 6415 AND type = 'P'
		)
	</cfif>
        		and (comp_id <> 11100 and comp_id <> 11087 
		)
	order by s.title_id
</CFQUERY>


<!---<cfif cgi.REMOTE_ADDR eq '98.233.235.105'>
<cfdump var="#read_Binder_Not_Merged#">
<cfabort>
</cfif>--->

<CFQUERY datasource="#request.dsn#" NAME="gettracker">
	select assign_date, order_id
	from vendor_tracker_new
	where task = 'Abstract'
</cfquery>


	<CFSET a_color_trigger = "2">
	<CFSET a_bgcolor = "white">
	<cfset a_color_temp = a_bgcolor>
	<CFOUTPUT QUERY="read_Binder_Not_Merged" group="title_id">
<cfset tx_file = 0>
<cfif read_Binder_Not_Merged.pstate eq 'TX' or ListFind(tx_ids, read_Binder_Not_Merged.intsales, ",") gte 1>
<cfset tx_file = 1>
</cfif>
<!---
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
		Select va_employee, ft_fairfax_employee
		from First_Admin where ID = #read_Binder_Not_Merged.intSales#
</CFQUERY>
--->
	<cfset richmond = 0>
<cfif va_employee eq 1>
	<cfset richmond = 1>
</cfif>
	<cfset fx = 0>
<cfif ft_fairfax_employee eq 1 or (Mid(company, 1, 3) eq 'GMH' and company contains 'Construction')>
	<cfset fx = 1>
</cfif>

<cfif read_Binder_Not_Merged.streamline_client eq 'True'>
	<cfset ninety_days_ago = '1/1/2012'>
<cfelse>
	<cfset ninety_days_ago = DateAdd("d", -180, Now())>
</cfif>

<cfif company neq 'ROA Hutton - Geddes Lake' 
	and NOT ListContainsNoCase(appraisal_status, "Loan Closed", ",")
	and NOT ListContainsNoCase(appraisal_status, "Loan Funded", ",")
	and NOT ListContainsNoCase(appraisal_status, "Loan Closed-Seller Rep", ",")
	and NOT ListContainsNoCase(appraisal_status, "Abstract sent - waiting for contract", ",")
	and  (check_date GTE DateFormat(ninety_days_ago, "m/d/yyyy"))>

	<cfif read_Binder_Not_Merged.comp_id eq 7393 or read_Binder_Not_Merged.comp_id eq 7402>
		<cfset a_bgcolor="FF0000">
	<cfelseif read_Binder_Not_Merged.streamline_client eq 'True'>
		<cfset a_bgcolor="FFCC66">
	<cfelseif read_Binder_Not_Merged.comp_id eq 12324>
		<cfset a_bgcolor="66CCCC">
	<cfelse>
		<cfset a_bgcolor = a_color_temp>
	</cfif>
    
	<CFQUERY dbtype="query" NAME="getOrderDate">
		select max(assign_Date) as assign_Date
		from gettracker
		where order_id = '#title_id#'
	</cfquery>
	
	<cfset get_typing.Typing_Vendor = ''>
	
	<cftry>
	<!---	
	<CFQUERY datasource="#request.dsn#" NAME="getTyping" maxrows="1">
		SELECT     s.company AS Typing_Vendor
FROM         Vendor_Tracker_New AS v INNER JOIN
                      Vendors_STACIE AS s ON v.Vendor_ID = s.vendor_ID
WHERE     (v.task = 'Typing') AND (v.Order_id = #title_id#)
order by v.assign_Date desc
	</cfquery>
	--->
<cfcatch type="any">
</cfcatch>
</cftry>

<!--- <cfif title_id eq 17937>
<cfif cgi.REMOTE_ADDR eq '98.233.235.105'>
<CFQUERY datasource="#request.dsn#" NAME="getTypingVendor">
Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #title_id#
			and v.task = 'Typing'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfoutput><cfdump var="#getTypingVendor#">
</cfoutput>
</cfif>
<cfabort>
</cfif> --->

	<tr>
	<CFIF #read_user.role_mgr# eq 1>
		<CFIF #read_Binder_Not_Merged.fname# neq "">
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="./update_typing.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1"><font size=1 color=Green face=verdana>R</font></a>
			</td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana>
				R
			</td>
		</CFIF>
	</CFIF>
		<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
			<CFIF #Type# eq "T">
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Binder_Not_Merged.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana><cfif richmond eq 1>(R) </cfif><cfif fx eq 1>(FX) </cfif><cfif tx_file eq 1>(TX) </cfif>T-#title_id#</font></a>
			</CFIF>
			<CFIF #Type# eq "P">
				<a href="Prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Binder_Not_Merged.title_id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana><cfif richmond eq 1>(R) </cfif>P-0232#title_id#</font></a>
			</CFIF>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<!---#DateFormat(check_date, "m/d/yyyy")#--->#DateFormat(getOrderDate.assign_date, "m/d/yyyy")#
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
				#pstate#
			</td>
<CFIF #Type# eq "P">
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<cfif Len(read_Binder_Not_Merged.sale_date)>#DateFormat(read_Binder_Not_Merged.sale_date, "mm/dd/yyyy")#</cfif>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<cfif Len(read_Binder_Not_Merged.due_date)>#DateFormat(read_Binder_Not_Merged.due_date, "mm/dd/yyyy")#</cfif>
			</td>
<cfelse>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				&nbsp;
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				&nbsp;
			</td>
</cfif>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<CFIF appraisal_status eq 'In Typing' and read_Binder_Not_Merged.Typing_End_Datetime neq '' and read_Binder_Not_Merged.Typing_End_Datetime neq 'NULL'>Typed<cfelse>#appraisal_status#</CFIF>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#fname#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				#Typing_Vendor#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center"> <font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_Binder_Not_Merged.title_id#&a_trigger=1&code=#type#&rec_type=#type#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
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
		</CFOUTPUT>
	</table>
	
	</body>
</html>