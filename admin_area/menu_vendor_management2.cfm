<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<!---d3d3d3--->
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
	select * from first_admin

			WHERE ID = #session.ft_user_id#
</CFQUERY>


<html>
<head>
	<title>Vendor Management</title>
</head>

<body>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align=center>
	<tr>
    	<td valign="middle" height="76"><IMG style="WIDTH: 980px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  	</tr>
	
</table>    
<cfoutput>
<table>
	<tr>
		<TD align="center" >
			<B><P>Welcome&nbsp;#a_fname#&nbsp;#a_lname#&nbsp;to the Vendor Management Screen.&nbsp;&nbsp;The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</P></B>
		</TD>
	</tr>
</TABLE>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_current_user">		
			SELECT *
			FROM First_Admin
			WHERE ID = #session.ft_user_id#
		</CFQUERY>

The following reports are currently available to you. Clicking on these reports will launch them in a new window, which you can keep open while working in other windows. This will eliminate the need to "return" to the report and re-run it.<br>
<br>
<br>
<ul>
<li><a href="reports_abstract_unassigned.cfm?uid=#URL.uid#&al=#URL.al#" target="abstract_unassigned">Abstract Unassigned</a></li>
<li><a href="reports_abstract_assigned_not_received.cfm?uid=#URL.uid#&al=#URL.al#" target="abstract_assigned_not_received">Abstract Assigned Not Received</a></li>
<li><a href="reports_tax_data_not_completed.cfm?uid=#URL.uid#&al=#URL.al#" target="tax_data_not_completed">Tax Data Not Completed</a></li>


<cfif read_user.streamline_employee eq 'True'>
<li><a href="streamline_lp_report.cfm?uid=#url.uid#" target="new">Streamline&nbsp;Loan<BR>
Processor&nbsp;Report</a></li></cfif>
<cfif read_user.streamline_employee eq 'True'>
<li><a href="reports_ab_received_client_system_not_updated.cfm?uid=#url.uid#&al=1" target="new">Abstract Received, Client Sytem NOT Updated</a></li></cfif>
<cfif read_user.streamline_employee eq 'True'>
<li><a href="streamline_order_feed.cfm?uid=#url.uid#&al=1" target="new">Streamline Automatic Order Feed</a></li></cfif>
<li><a href="reports_title_claims_issues.cfm?uid=#url.uid#&al=1" target="new">Unresolved Title Claims / Title Issues</a></li>
<!---<cfif session.ft_user_id eq 417 or session.ft_user_id eq 240>--->
<li><a href="vendor_add2.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="new">Vendors Add</a></li>
<li><a href="vendor_modify_choose.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="new">Vendors Modify</a></li>
</ul>
<!-- check if this person is assigned to a team --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_parent_id">
	SELECT parent_user_id from First_Admin where ID = #session.ft_user_id#
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_members">
	SELECT members, ID 
	FROM Teams
</CFQUERY>
<cfset all_team_ids = "">
<cfloop query="read_members">
<cfif ListFindNoCase(members, session.ft_user_id, ",") or  ListFindNoCase(members, get_parent_id.parent_user_id, ",")>
<cfset all_team_ids = ListAppend(all_team_ids, id, ",")>
</cfif>
</cfloop>

<cfset session.all_team_ids = all_team_ids>

<cfif ListLen(session.all_team_ids, ",")>

<cfinclude template="team_popup_data.cfm">
</cfif>

<!-- end check if this person is assigned to a team --->


<cfabort>

<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center">
	<tr>
		<td align="center" 
            <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
              colspan = 8 
            <CFELSE>
              colspan= 7
            </CFIF>    
            width="100%">
			<B>Abstract Unassigned</B>
		</td>
	</tr>
	<tr>
		<td align="center" ><font size=1 color=black face=verdana><b>Assigned</b></font></td>
        <!---Pam Heidi Harry--->
        <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
        <td align="center"><font size=1 color=black face=verdana><b>Remove</b></font></td>
        </CFIF>
		<td align="center"><font size=1 color=black face=verdana><b>Order Num</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Order Date</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Due Date</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Company Name</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>State</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Abstractor</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Taxes</b></font></td>
	</tr>
	</cfoutput>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Abstract_Not_Assigned">
<cfset a_color_temp = a_bgcolor>
<cfif read_abstract_Not_Assigned.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
    <tr>
	    <CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#" align="center"><a href="./title_abstract_doc_view?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" target="_blank"><font size=1 color=red face=verdana><b>A</font></a></td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" align="center"><a href="./prop_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" target="_blank"><font size=1 color=red face=verdana><b>A</font></a></td>
		</CFIF>
        <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
            <CFIF #Letter# eq "T">
                <td bgcolor="#a_bgcolor#" align="center"><a href="./Abstract_Unassigned_Removal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0&Letter=T" target="_blank"><font size=1 color=blue face=verdana><b>R</font></a></td>
  	        <CFELSE>
			    <td bgcolor="#a_bgcolor#" align="center"><a href="./Abstract_Unassigned_Removal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0&Letter=P" target="_blank"><font size=1 color=blue face=verdana><b>R</font></a></td>
            </CFIF>
        </CFIF>    
		<CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#"><a href="title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#id#</font></a></td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#"><a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#id#</font></a></td>
		</CFIF>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
			#DateFormat(a_insert_date, "m/d/yyyy")#</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
		    #DateFormat(DueDate, "m/d/yyyy")#</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
			#company#</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
			#pstate#</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center">
		<CFIF #Letter# eq "T">
                <CFQUERY DATASOURCE="#request.dsn#" NAME="read_IH">
						    SELECT     abstract_ID
						    FROM         tblUser_Roles
						    WHERE     (abstract_ID IS NOT NULL) And Title_ID = #id#
				</CFQUERY>
                <CFIF #read_IH.recordcount# gte "1">
				<b><a href="./update_vendor_management_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#abstractor#</font></a></b>
                <CFELSE>
				<b><a href="./update_vendor_management_InHouse_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#abstractorIH#</font></a></b>
				</CFIF>    
			<CFELSE>
                <CFQUERY DATASOURCE="#request.dsn#" NAME="read_IH2">
						    SELECT     abstract_ID
						    FROM         tblUser_Roles
						    WHERE     (abstract_ID IS NOT NULL) And Prop_ID = #id#
                </CFQUERY>
                <CFIF #read_IH2.recordcount# gte "1">
				<b><a href="./update_vendor_management_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#abstractor#</font></a></b>
                <CFELSE>
				<b><a href="./update_vendor_management_InHouse_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#abstractor#</font></a></b>
                </CFIF>           
			</CFIF>
		</td>
		<td bgcolor="#a_bgcolor#" align="center">
		<CFIF #Letter# eq "T">
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Title_ID = #id#
				</CFQUERY>
				<CFIF #read_taxes.recordcount# gte 1>
				<b><a href="./update_vendor_management_taxes_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#taxes#</font></a></b>
				</CFIF>
			<CFELSE>
				<CFQUERY DATASOURCE="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Prop_ID = #id#
				</CFQUERY>
				<CFIF #read_taxes.recordcount# gte 1>
				<b><a href="./update_vendor_management_taxes_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#taxes#</font></a></b>
				</CFIF>
			</CFIF>
		</td>
	</tr>
	<CFIF #a_color_trigger# eq "1">
		<CFSET a_bgcolor = "white">
		<CFSET a_color_trigger = "2">				
	<CFELSE>
		<CFSET a_bgcolor = "d3d3d3">
		<CFSET a_color_trigger = "1">				
	</CFIF>
</CFOUTPUT><!--- stopped here --->
<table>
    <tr>
	    <td 
            <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
                colspan = 8 
            <CFELSE>
                colspan= 7
            </CFIF>    
            width=100% align="center"><B>Abstract Assigned Not Received</B></td>
	</tr>
	<tr>
	<!---R is for Remove.  There's not really any space to make it longer.--->
            <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
                <td align="center"><font size=1 color=black face=verdana><b>Remove</b></font></td>
            </CFIF>
            <td align="center"><font size=1 color=black face=verdana><B>Order Num</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>Order Date</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>Assigned Date</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>Due Date</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>Company Name</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>State</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>Abstractor</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>Taxes</B></font></td>
		</tr>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Abstract_Assigned_Not_Received">
<cfset a_color_temp = a_bgcolor>
<cfif read_Abstract_Assigned_Not_Received.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>		
		<tr>
			<CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
                <CFIF #Letter# eq "T"><td bgcolor="#a_bgcolor#" align="center"><a href="./Abstract_Unassigned_Removal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0&Letter=T" target="_blank"><font size=1 color=blue face=verdana><b>R</b></font></a></td>
			    <CFELSE><td bgcolor="#a_bgcolor#" align="center"><a href="./Abstract_Unassigned_Removal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0&Letter=P" target="_blank"><font size=1 color=blue face=verdana><b>R</b></font></a></td>
                </CFIF>
            </CFIF>    
            <CFIF #Letter# eq "T"><td  bgcolor="#a_bgcolor#" align="center"><a href="title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#id#</font></a></td>
			<CFELSE><td bgcolor="#a_bgcolor#" align="center"><a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#id#</font></a></td>
			</CFIF>
			<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>#DateFormat(a_insert_date, "m/d/yyyy")#</b></font></td>
			<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>#DateFormat(a_date_assigned, "m/d/yyyy")#</b></font></td>
			<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>#DateFormat(DueDate, "m/d/yyyy")#</b></font></td>
			<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>#company#</b></font></td>
			<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>#read_Abstract_Assigned_Not_Received.pstate#</b></font></td>
			<CFIF #Letter# eq "T">
                        <CFQUERY DATASOURCE="#request.dsn#" NAME="read_IH">
						    SELECT     abstract_ID
						    FROM         tblUser_Roles
						    WHERE     (abstract_ID IS NOT NULL) And Title_ID = #id#
					    </CFQUERY>
						<CFIF #read_IH.recordcount# gte "1"><td bgcolor="#a_bgcolor#" align="center"><b><a href="./update_vendor_management_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#abstractor#</font></a></b></td>
                        <CFELSE><td bgcolor="#a_bgcolor#" align="center"><b><a href="./update_vendor_management_InHouse_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#abstractorIH#</font></a></b></td>
						</CFIF>    
					<CFELSE>
                        <CFQUERY DATASOURCE="#request.dsn#" NAME="read_IH2">
						    SELECT     abstract_ID
						    FROM         tblUser_Roles
						    WHERE     (abstract_ID IS NOT NULL) And Prop_ID = #id#
					    </CFQUERY>
						<CFIF #read_IH2.recordcount# gte "1"><td bgcolor="#a_bgcolor#" align="center"><b><a href="./update_vendor_management_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#abstractor#</font></a></b></td>
                        <CFELSE><td bgcolor="#a_bgcolor#" align="center"><b><a href="./update_vendor_management_InHouse_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#abstractor#</font></a></b></td>
						</CFIF>           
					</CFIF>
			
			<CFIF #Letter# eq "T">
					<CFQUERY DATASOURCE="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Title_ID = #id#
					</CFQUERY>
					<CFIF #read_taxes.recordcount# gte 1><td bgcolor="#a_bgcolor#" align="center"><b><a href="./update_vendor_management_taxes_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#taxes#</font></a></b></td>
					</CFIF>
				<CFELSE>
					<CFQUERY DATASOURCE="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Prop_ID = #id#
					</CFQUERY>
					<CFIF #read_taxes.recordcount# gte 1><td bgcolor="#a_bgcolor#" align="center"><b><a href="./update_vendor_management_taxes_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1"><font size=1 color=Green face=verdana>#taxes#</font></a></b></td>
					</CFIF>
				</CFIF>
		</tr>
		<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">				
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">				
			</CFIF>
</CFOUTPUT>
	</TABLE>
	
<br>
<table cellpadding=1 cellspacing=1 border=0 width="100%">
<tr><td align="center"><B>Tax Data Not Completed</B></td></tr>
</table>

<table width=100% cellpadding=1 cellspacing=1 border=0>
				<tr>
						

<td align="center" width="75"><font size=1 color=black face=verdana><B>Order Date</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Order Num</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Borrower 1</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>State</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Abstractor</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Rpt Recv'd</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Status</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Comments</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Events</B></font></td>
<td align="center"><font size=1 color=black face=verdana><B>Team</B></font></td> 
					</tr>
<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	
	<!--- <cfset current_id = 9999999999> --->
	<CFLOOP QUERY="read_report"> 
	<!--- <cfif title_id neq current_id> --->
		<CFOUTPUT>
			<CFQUERY DATASOURCE="#request.dsn#" NAME="read_time">
				SELECT *
				FROM Title a, doc_title_insurance_title d
				WHERE a.title_id = #title_id# and a.title_id = d.title_id and check_date is not null and check_time is not null and a_recieved_time is not null and a_recieved_date is not null and a.cancelled is null
			</cfquery>
			<cfset a_color_temp = a_bgcolor>
<cfif read_time.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
					<tr>
						<td bgcolor=#a_bgcolor# width=75 align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#DateFormat(check_date, "mm/dd/yyyy")#</strong></font></td>			
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=1" target="_blank"><FONT FACE=verdana SIZE=1>T-#title_id#</font></a></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#BFirstName1# #BLastName1#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#pstate#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#read_report.Company#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#DateFormat(read_report.a_date_completed, "m/d/yyyy")# #TimeFormat(read_report.a_time_completed, "HH:mm:ss")#</strong></font></td>
                       <td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black"><strong>#read_report.appraisal_status#</strong></font></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="./title_comments_nav_stat.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#comp_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a></td>
						<td bgcolor=#a_bgcolor# align=center valign=top><a href="./statistics_events.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#comp_ID#"><img src="./images/button_events.gif" border=0 ALT="View the events for this record"></a></td>
				<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#TEAM_NAME#</font></td>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
				</tr>
				<!--- <cfset current_id = title_id> --->
	</CFOUTPUT>
	
	<!--- </cfif> --->
	
	</CFLOOP>
	
	</table> 




	


</body>
</html>
