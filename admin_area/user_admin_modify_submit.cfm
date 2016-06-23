<cfparam NAME ="role_id" Default="">
<cfparam NAME ="streamline_employee" Default="0">
<cfparam NAME ="fairfax_admin" Default="0">
<cfparam NAME ="mi_flushing_admin" Default="0">
<cfparam NAME ="mo_admin" Default="0">
<cfparam NAME ="mi_flushing_employee" Default="0">
<cfparam NAME ="mo_employee" Default="0">
<CFQUERY datasource="#request.dsn#" NAME="read_admin_user1">
		select * from first_admin

			WHERE ID = #session.ft_user_id#
</CFQUERY>

<CFIF #role_id# neq "">
	<CFQUERY datasource="#request.dsn#" Name="read_role_name">
		Select role_name 
		from roles
		where role_id=#role_id# order by Role_ID
	</CFQUERY>
</CFIF>	

<CFSET a_mod_by = #read_admin_user1.fname# & " " & #read_admin_user1.lname# >
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>

<CFIF #role_id# neq "">	
	<CFQUERY datasource="#request.dsn#" NAME="read_admin_user">
		UPDATE first_admin
			SET fname = '#fname#',
			lname = '#lname#',
			position = '#position#',
			email = '#email#',
			phone = '#phone#',
			fax = '#fax#',
			password = '#password#',
			password2 = '#password2#',
			username = '#username#',
			lvl_access = #lvl_access#,
			a_date_modified = '#c_date#',
			a_time_modified = '#c_time#',
			a_modified_by = '#a_mod_by#',
			role_id = #role_id#,
			status = #status#,
			mo_employee = '#mo_employee#',
			mo_admin = '#mo_admin#',
			mi_employee = '#mi_employee#',
			mi_admin = '#mi_admin#',
			mi_flushing_employee = '#mi_flushing_employee#',
			mi_flushing_admin = '#mi_flushing_admin#',
			tx_employee = '#tx_employee#',
			tx_admin = '#tx_admin#',
			va_employee = '#va_employee#',
			va_admin = '#va_admin#',
			ft_fairfax_employee = '#ft_fairfax_employee#',
			ft_fairfax_admin = '#ft_fairfax_admin#',
			streamline_employee = #streamline_employee#,
			fairfax_admin = #fairfax_admin#,
			closing_emails = #closing_emails#,
			processor = #processor#
			WHERE ID = #user_id#
	</CFQUERY>
	
	<cfif isDefined("form.timebased")>
			<CFQUERY datasource="#request.dsn#">
				update sales_commision_tiers
				set
				timebased = '#timebased#',
				time_tier = <cfif isDefined("time_tier")>'#time_tier#'<cfelse>null</cfif>,
				time_tier_months = <cfif Len(time_tier_months)>'#time_tier_months#'<cfelse>null</cfif>,
				time_tier_percentage = <cfif Len(time_tier_percentage)>'#time_tier_percentage#'<cfelse>null</cfif>,
				rev1 = <cfif Len(rev1)>'#rev1#'<cfelse>null</cfif>,
				rev2 = <cfif Len(rev2)>'#rev2#'<cfelse>null</cfif>,
				rev3 = <cfif Len(rev3)>'#rev3#'<cfelse>null</cfif>,
				rev4 = <cfif Len(rev4)>'#rev4#'<cfelse>null</cfif>,
				rev5 = <cfif Len(rev5)>'#rev5#'<cfelse>null</cfif>,
				rev6 = <cfif Len(rev6)>'#rev6#'<cfelse>null</cfif>,
				rev7 = <cfif Len(rev7)>'#rev7#'<cfelse>null</cfif>,
				rev8 = <cfif Len(rev8)>'#rev8#'<cfelse>null</cfif>,
				rev9 = <cfif Len(rev9)>'#rev9#'<cfelse>null</cfif>,
				rev10 = <cfif Len(rev10)>'#rev10#'<cfelse>null</cfif>,
				per1 = <cfif Len(per1)>'#per1#'<cfelse>null</cfif>,
				per2 = <cfif Len(per2)>'#per2#'<cfelse>null</cfif>,
				per3 = <cfif Len(per3)>'#per3#'<cfelse>null</cfif>,
				per4 = <cfif Len(per4)>'#per4#'<cfelse>null</cfif>,
				per5 = <cfif Len(per5)>'#per5#'<cfelse>null</cfif>,
				visiblerows = #visiblerows#
				where UID = #user_id#
			</cfquery>
		
		</cfif>
<CFELSE>
	<CFQUERY datasource="#request.dsn#" NAME="read_admin_user">
		UPDATE first_admin
			SET fname = '#fname#',
			lname = '#lname#',
			position = '#position#',
			email = '#email#',
			phone = '#phone#',
			fax = '#fax#',
			password = '#password#',
			password2 = '#password2#',
			username = '#username#',
			lvl_access = #lvl_access#,
			a_date_modified = '#c_date#',
			a_time_modified = '#c_time#',
			a_modified_by = '#a_mod_by#',
			mo_employee = '#mo_employee#',
			mo_admin = '#mo_admin#',
			mi_employee = '#mi_employee#',
			mi_admin = '#mi_admin#',
			mi_flushing_employee = '#mi_flushing_employee#',
			mi_flushing_admin = '#mi_flushing_admin#',
			tx_employee = '#tx_employee#',
			tx_admin = '#tx_admin#',
			va_employee = '#va_employee#',
			va_admin = '#va_admin#',
			ft_fairfax_employee = '#ft_fairfax_employee#',
			ft_fairfax_admin = '#ft_fairfax_admin#',
			status = #status#,
			streamline_employee = #streamline_employee#,
			fairfax_admin = #fairfax_admin#,
			closing_emails = #closing_emails#,
			processor = #processor#
			WHERE ID = #user_id#
	</CFQUERY>
</CFIF>

<CFQUERY datasource="#request.dsn#" NAME="read_admin_user">
	SELECT *
	FROM first_admin
	WHERE ID = #user_id#
</CFQUERY>

<cfif #read_admin_user.id# eq "167">
	<CFQUERY datasource="#request.dsn#" NAME="read_admin_user">
		UPDATE first_admin
			SET 
			lvl_access = 4
			WHERE ID = #user_id#
	</CFQUERY>
</cfif>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>
</HEAD>
<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
	<CENTER>
	<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=500 align=center valign=top>
				<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
					<tr>
						<td width=499 align=center valign=top bgcolor=e2e2e2>
							<FONT SIZE=2 color=black face=arial>
								<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
									<CFOUTPUT>
									<tr>
										<td width=498 align=center valign=top bgcolor=white>
											<font size=2 color=green face=arial>The User was MODIFIED successfully<font size=2 color=black face=arial>
											<p>
											<FONT SIZE=2 COLOR=red FACE=VERDANA>
											<B>Site Administrators Section</B>
										</td>
									</tr>
									<tr>
										<td width=498 align=center valign=top bgcolor=e3e3e3>
											<font size=3 color=blue face=arial>
											User - <B>#read_admin_user.fname#&nbsp;&nbsp;&nbsp;&nbsp;#read_admin_user.lname#</B>
										</td>
									</tr>
									<tr>
										<td width=499 align=left valign=top bgcolor=e1e1e1>
											<a href="./user_modify.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_return.gif" border=0 ALT="Return to -- Modify an existing User"></a>
										</td>
									</tr>
									</CFOUTPUT>	
									<tr>
										<td width=499 align=center valign=top bgcolor=white>
											<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
									<CFOUTPUT>
												<tr>		
													<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
														<img src="./images/clear.gif" height=10 width=85>
													</td>
												</tr>
												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														First Name
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=blue face=verdana>
														<B>#read_admin_user.fname#	</B>	
													</td>
												</tr>
												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Last Name
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=blue face=verdana>
														<B>#read_admin_user.lname#</B>
													</td>
												</tr>
												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Position
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=blue face=verdana>
														<B>#read_admin_user.position#</B>
													</td>
												</tr>
												<CFIF #role_id# neq "">
													<tr>		
														<td width=130 align=right valign=top bgcolor=e6e6e6>	
															<font size=2 color=black face=arial>
															Role
														</td>
														<td width=237 align=left valign=top bgcolor=e6e6e6>	
															<font size=2 color=blue face=verdana>
															<B>#read_role_name.role_name#</B>
														</td>
													</tr>
												</CFIF>								
												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Email
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=blue face=verdana>
														<B>#read_admin_user.email#</B>
													</td>
												</tr>	
												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Phone & Ext.
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=blue face=verdana>
														<B>#read_admin_user.phone#</B>
													</td>
												</tr>
												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Direct Fax
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=blue face=verdana>
														<B>#read_admin_user.fax#</B>
													</td>
												</tr>
												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														User Name
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=blue face=verdana>
														<B>#read_admin_user.username#</B>
													</td>
												</tr>
												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														1st Password
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=blue face=verdana>
														<B>#read_admin_user.password#</B>
													</td>
												</tr>	
												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														2nd Password
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=blue face=verdana>
														<B>#read_admin_user.password2#</B>
													</td>
												</tr>
												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Access Level  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.lvl_access# EQ "0">
															<font size=2 color=blue face=arial>
						 									<B>User</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>Admin</B>
														</CFIF>
													</td>
												</tr>

<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Streamline Employee?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.streamline_employee# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>


<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Missouri Office Employee?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.mo_employee# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>

<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Missouri Office Admin?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.mo_admin# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>


<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Michigan Office Employee?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.mi_employee# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>

<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Michigan Office Admin?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.mi_admin# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>



<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Michigan Flushing Office Employee?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.mi_flushing_employee# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>

<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Michigan Flushing Office Admin?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.mi_flushing_admin# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>




<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Texas Office Employee?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.tx_employee# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>

<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Texas Office Admin?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.tx_admin# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>
												
<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Virginia Office Employee?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.va_employee# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>

<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Virginia Office Admin?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.va_admin# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>
												
<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Streamline Fairfax Office Admin?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.fairfax_admin# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>
												
<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														First Title Fairfax Office Employee?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.ft_fairfax_employee# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>
												
<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														First Title Fairfax Office Admin?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.ft_fairfax_admin# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>
												
<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Receive Closing Notifications?  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.closing_emails# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>
												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Internal Processor 
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.processor# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Yes</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>No</B>
														</CFIF>
													</td>
												</tr>


												<tr>		
													<td width=130 align=right valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														Access Level  
													</td>
													<td width=237 align=left valign=top bgcolor=e6e6e6>	
														<font size=2 color=black face=arial>
														<CFIF #read_admin_user.status# EQ "1">
															<font size=2 color=blue face=arial>
						 									<B>Active</B>
														<CFELSE>
															<font size=2 color=green face=arial>
															<B>Inactive</B>
														</CFIF>
													</td>
												</tr>

											</table>
									</CFOUTPUT>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>	
				</td>
			</tr>
		</table>
</BODY>
</HTML>


	