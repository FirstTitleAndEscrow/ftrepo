
<CFPARAM NAME="comp_id" DEFAULT="">
	<CFQUERY datasource="#request.dsn#" NAME="read_admin_user1">
		select * from first_admin

			WHERE ID = #session.ft_user_id#
	</CFQUERY>
	<CFQUERY datasource="#request.dsn#" Name="read_existing_name">
		Select * 
		from First_Admin
		where fname = '#fname#' and lname = '#lname#'	
	</CFQUERY>

	<CFSET a_add_by = #read_admin_user1.fname# & " " & #read_admin_user1.lname# >
	<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
	<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>

	<CFIF #read_existing_name.recordcount# gte 1>
		<CFOUTPUT><B><Center>This person already exists in system.</CENTER></B></CFOUTPUT>
	<CFELSE>
		<CFQUERY datasource="#request.dsn#">
			INSERT INTO first_admin(fname, lname, email, fax, phone, position, password, password2, username, lvl_access, a_date_created, a_time_created, a_created_by,status, role_id, streamline_employee, mo_employee, mo_admin,  mi_employee, mi_admin, mi_flushing_employee, mi_flushing_admin, tx_employee, tx_admin, closing_emails, va_employee, va_admin, fairfax_admin, ft_fairfax_employee, ft_fairfax_admin)
			VALUES('#fname#', '#lname#', '#email#', '#fax#', '#phone#', '#position#', '#password#', '#password2#', '#username#', #lvl_access#, '#c_date#', '#c_time#', '#a_add_by#',1, '#role_id#', #streamline_employee#, #mo_employee#, #mo_admin#, #mi_employee#, #mi_admin#, #mi_flushing_employee#, #mi_flushing_admin#, #tx_employee#, #tx_admin#, #closing_emails#, #va_employee#, #va_admin#, #fairfax_admin#, #ft_fairfax_employee#, #ft_fairfax_admin#)		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_admin_user">
			SELECT *
			FROM first_admin
			WHERE a_date_created = '#c_date#' and a_time_created = '#c_time#'
		</CFQUERY>
		
		<cfif isDefined("form.timebased")>
			<CFQUERY datasource="#request.dsn#">
				insert into sales_commision_tiers(uid,timebased,time_tier,time_tier_months,time_tier_percentage,rev1,rev2,rev3,rev4,rev5,rev6,rev7,rev8,rev9,rev10,per1,per2,per3,per4,per5,visiblerows)
				values(
				#read_admin_user.id#,
				'#timebased#',
				<cfif isDefined("time_tier")>'#time_tier#'<cfelse>null</cfif>,
				<cfif Len(time_tier_months)>'#time_tier_months#'<cfelse>null</cfif>,
				<cfif Len(time_tier_percentage)>'#time_tier_percentage#'<cfelse>null</cfif>,
				<cfif Len(rev1)>'#rev1#'<cfelse>null</cfif>,
				<cfif Len(rev2)>'#rev2#'<cfelse>null</cfif>,
				<cfif Len(rev3)>'#rev3#'<cfelse>null</cfif>,
				<cfif Len(rev4)>'#rev4#'<cfelse>null</cfif>,
				<cfif Len(rev5)>'#rev5#'<cfelse>null</cfif>,
				<cfif Len(rev6)>'#rev6#'<cfelse>null</cfif>,
				<cfif Len(rev7)>'#rev7#'<cfelse>null</cfif>,
				<cfif Len(rev8)>'#rev8#'<cfelse>null</cfif>,
				<cfif Len(rev9)>'#rev9#'<cfelse>null</cfif>,
				<cfif Len(rev10)>'#rev10#'<cfelse>null</cfif>,
				<cfif Len(per1)>'#per1#'<cfelse>null</cfif>,
				<cfif Len(per2)>'#per2#'<cfelse>null</cfif>,
				<cfif Len(per3)>'#per3#'<cfelse>null</cfif>,
				<cfif Len(per4)>'#per4#'<cfelse>null</cfif>,
				<cfif Len(per5)>'#per5#'<cfelse>null</cfif>,
				#visiblerows#
				)
			</cfquery>
		
		</cfif>
	
	<cfif #comp_id# neq "">
		<CFSET a_company_list = #ListToArray(FORM.comp_id, ",")#>
		
		<CFLOOP FROM="1" TO="#ArrayLen(a_company_list)#" INDEX="DDD">
			<CFQUERY datasource="#request.dsn#" NAME="read_company_1">		
				SELECT *
				FROM companies
				WHERE id = #a_company_list[DDD]#		
			</CFQUERY>

			<CFQUERY datasource="#request.dsn#" >		
				INSERT INTO user_client_assoc(ID, company_id, company_Name)
				VALUES(#read_admin_user.ID#, #read_company_1.id#, '#read_company_1.company#')		
			</CFQUERY>	
		</CFLOOP>
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
													<font size=2 color=green face=arial><B>The USER was ADDED successfully</B><font size=2 color=black face=arial>
													<p>
													<FONT SIZE=2 COLOR=red FACE=VERDANA>
													<B>Site Administrators Section</B>					
												</td>
											</tr>
										</table>
								</td>
							</tr>
							<tr>
								<td width=499 align=left valign=top bgcolor=e1e1e1>
									<a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#" target=work><img src="./images/button_return.gif" border=0 ALT="Return to -- Add Users"></a>
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
												<B>#read_admin_user.fname#</B>
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
												Streamline Employee 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.streamline_employee# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Missouri Office Employee 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.mo_employee# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Missouri Office Admin 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.mo_admin# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>


										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Michigan Office Employee 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.mi_employee# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Michigan Office Admin 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.mi_admin# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Michigan Flushing Office Employee 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.mi_flushing_employee# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Michigan Flushing Office Admin 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.mi_flushing_admin# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										
										
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Texas Office Employee 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.tx_employee# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Texas Office Admin 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.tx_admin# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										
										
										
																				<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Virginia Office Employee 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.va_employee# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Virginia Office Admin 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.va_admin# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Streamline Fairfax Office Admin 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.fairfax_admin# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										
										
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												First Title Fairfax Office Admin 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.ft_fairfax_employee# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										
										
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												First Title Fairfax Office Admin 
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												<CFIF #read_admin_user.ft_fairfax_admin# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
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
												<CFIF #read_admin_user.closing_emails# EQ "0">
													<font size=2 color=blue face=arial>
						 							<B>No</B>
												<CFELSE>
													<font size=2 color=green face=arial>
													<B>Yes</B>
												</CFIF>		
											</td>
										</tr>
										<tr>		
											<td width=130 align=right valign=top bgcolor=e6e6e6>	
												<font size=2 color=black face=arial>
												Client(s) Associated
											</td>
											<td width=237 align=left valign=top bgcolor=e6e6e6>	
												<font size=2 color=blue face=verdana>
												<cfif #comp_id# neq "">
													<B>#FORM.comp_id#</B>
												</cfif>
											</td>
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

</CFIF>
	