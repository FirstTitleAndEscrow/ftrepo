<cfparam name="comp_id" default=0>
<html>
	<head>
		<title>Please answer the questions correctly. You have 3 attempts to answer.</title>
	</head>	
<body bgcolor="white" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?" TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">
	
	<cfform name="frm" method="post" action="#CGI.SCRIPT_NAME#?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#" format="html" id="frm">		

			
			<cfquery name="GetSecurityQuestion" datasource="#request.dsn#">
				Select a1.QuestionID1 Question1, q1.QuestionName QuestionDescription1, a1.AnsDescription1 ans1, a1.QuestionID2 Question2 ,
				q2.QuestionName QuestionDescription2, a1.AnsDescription2 ans2,a1.QuestionID3 Question3,q3.QuestionName QuestionDescription3,
				a1.AnsDescription3 ans3,a1.attempt1,a1.attempt2,a1.attempt3
			    from Companies_Security a1,questionmaster q1,questionmaster q2,questionmaster q3 where a1.QuestionID1= q1.QuestionId and a1.QuestionID2= q2.QuestionId
				and a1.QuestionID3= q3.QuestionId and Company_ID=<cfqueryparam  cfsqltype="cf_sql_integer" value="#URL.comp_id#">
			</cfquery>	
			
						
			<cfoutput query="GetSecurityQuestion">
			
			 <cfset myCookie="FTClient" & URL.comp_id>
			 <cfset cookiePresent="False">
			 
			 
			 <!--- if ALSO logged in as an FT admin, set the cookie so we can skip this page --->
			 <cfif IsDefined("session.ft_user_id") and session.ft_user_id GT 0>
			 <cfset cookiePresent="True">
			 </cfif>
			 			    
			<cfif Isdefined("form.QuestionID") and #form.QuestionID# EQ 1>
				<cfif Isdefined("form.txtAns") and #ans1# EQ #form.txtAns#>
					<cfquery datasource="#request.dsn#" >
						Update Companies_security SET attempt1=0, attempt2=0, attempt3=0 WHERE Company_ID=<cfqueryparam cfsqltype="cf_sql_integer" value="#URL.comp_id#" >
					</cfquery>
					<cfset cookiePresent=True>			
					
				<cfelseif Isdefined("form.txtAns") and #ans1# NEQ #form.txtAns#>
						<cfquery name="UpdateAttempt1" datasource="#request.dsn#" > 
							Update Companies_security Set attempt1=1 where company_id=<cfqueryparam  cfsqltype="cf_sql_integer" value="#URL.comp_id#">
						</cfquery>					
				</cfif>
			</cfif>
			
			<cfif Isdefined("form.QuestionID") and #form.QuestionID# EQ 2>
				<cfif Isdefined("form.txtAns") and #ans2# EQ #form.txtAns#>
					<cfquery datasource="#request.dsn#" >
						Update Companies_security SET attempt1=0, attempt2=0, attempt3=0 WHERE Company_ID=<cfqueryparam cfsqltype="cf_sql_integer" value="#URL.comp_id#" >
					</cfquery>
					
					<cfset cookiePresent=true>
			   <cfelseif Isdefined("form.txtAns") and #ans2# NEQ #form.txtAns#>
					<cfquery name="UpdateAttempt1" datasource="#request.dsn#" > 
							Update Companies_security Set attempt2=1 where company_id=<cfqueryparam  cfsqltype="cf_sql_integer" value="#URL.comp_id#">
						</cfquery>					
				</cfif>
			</cfif>
			
			<cfif Isdefined("form.QuestionID") and #form.QuestionID# EQ 3>
				<cfif Isdefined("form.txtAns") and #ans3# EQ #form.txtAns#>
					<cfquery datasource="#request.dsn#" >
						Update Companies_security SET attempt1=0, attempt2=0, attempt3=0 WHERE Company_ID=<cfqueryparam cfsqltype="cf_sql_integer" value="#URL.comp_id#" >
					</cfquery>					
					
					<cfset cookiePresent=True>
					
				<cfelseif Isdefined("form.txtAns") and #ans3# NEQ #form.txtAns#>
					<cfquery name="UpdateAttempt1" datasource="#request.dsn#" > 
							Update Companies_security Set attempt3=1 where company_id=<cfqueryparam  cfsqltype="cf_sql_integer" value="#URL.comp_id#">
						</cfquery>					
				</cfif>
			</cfif>						
			</cfoutput>
				
				<cfif Isdefined("cookiePresent") AND #cookiePresent# EQ True>
					
						<!---The below code block will get executed when either users, SET Security Questions OR answers one of them while authentication --->
  						<cfif IsDefined("Form.IsPrivate") >
         						<!--- set the cookies for 60 days --->		 	
         	 				<cfcookie name="#myCookie#" value="#URL.comp_id#" expires="60">           
    					<cfelse>
         						<!---  EXPIRE cookies NOW so they are deleted for good! --->
          					<cfcookie name="#myCookie#" value="#URL.comp_id#" >     
   						</cfif> 
					<cflocation url="/client_acct_mgt.cfm?comp_id=#URL.comp_id#&user_id_1=0&lo_id=0" addtoken="yes">
				</cfif>	
			
			<cfquery name="GetSecurityQuestion" datasource="#request.dsn#">
				Select a1.QuestionID1 Question1, q1.QuestionName QuestionDescription1, a1.AnsDescription1 ans1, a1.QuestionID2 Question2 ,
				q2.QuestionName QuestionDescription2, a1.AnsDescription2 ans2,a1.QuestionID3 Question3,q3.QuestionName QuestionDescription3,
				a1.AnsDescription3 ans3,a1.attempt1,a1.attempt2,a1.attempt3, a1.SiteKeyID
			    from Companies_Security a1,questionmaster q1,questionmaster q2,questionmaster q3 where a1.QuestionID1= q1.QuestionId and a1.QuestionID2= q2.QuestionId
				and a1.QuestionID3= q3.QuestionId and Company_ID=<cfqueryparam  cfsqltype="cf_sql_integer" value="#URL.comp_id#">
			</cfquery>
			
			<cfoutput query="GetSecurityQuestion">
			
			<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
				<tr>
					<td align="center">
						<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
							<tr><td rowspan="2" valign="top" align="right" width="220"><cfinclude template="logo_swap_include.cfm"></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
				<table>		
				<cfif IsDefined("GetSecurityQuestion.SiteKeyID") and GetSecurityQuestion.SiteKeyID GT 0>
					<cfif GetSecurityQuestion.SiteKeyID eq 1>
					<cfset icon_name = "bird">
					<cfelseif GetSecurityQuestion.SiteKeyID eq 2>
					<cfset icon_name = "elephant">
					<cfelseif GetSecurityQuestion.SiteKeyID eq 3>
					<cfset icon_name = "elk">
					<cfelseif GetSecurityQuestion.SiteKeyID eq 4>
					<cfset icon_name = "fish">
					<cfelseif GetSecurityQuestion.SiteKeyID eq 5>
					<cfset icon_name = "flamingo">
					<cfelseif GetSecurityQuestion.SiteKeyID eq 6>
					<cfset icon_name = "fly">
					<cfelseif GetSecurityQuestion.SiteKeyID eq 7>
					<cfset icon_name = "frog">
					<cfelseif GetSecurityQuestion.SiteKeyID eq 8>
					<cfset icon_name = "panda">
					<cfelseif GetSecurityQuestion.SiteKeyID eq 9>
					<cfset icon_name = "rooster">
					<cfelseif GetSecurityQuestion.SiteKeyID eq 10>
					<cfset icon_name = "snail">
					</cfif>
				<tr style="font-family:MS Sans Serif; Book Antiqua;"><td align="center"><cfoutput><img src = "../images/#icon_name#.gif"></cfoutput><br>
Your Site Key</td></tr>
				</cfif>		
				<tr>
					<td>
						<cfif #attempt1# EQ 0 OR #attempt2# EQ 0 OR #attempt3# EQ 0>			
							<table cellpadding="10">
								<tr style="font-family:MS Sans Serif; Book Antiqua;font-size: medium">
									<td>This computer is not recognized. <br> As part of new security procedures, please Answer the following security question.</td>
								</tr>								
							</table>				
						</cfif>				
				
							<table cellpadding="10">
									<tr style="font-family:MS Sans Serif; Book Antiqua;font-size: medium">
										<td>																							
																											
											<cfif #attempt1# EQ 0 AND #attempt2# EQ 0 AND #attempt3# EQ 0>	
												
													<cfset number=RandRange(1,3)>
													
											<cfif #number# eq "1" >												
											     												    
										      			#QuestionDescription1#	
										      										  
											<cfelseif #number# eq "2">
															     
														#QuestionDescription2# 						  		
														   																	
											<cfelse>
													<cfif #number# eq "3">
																					
												      	#QuestionDescription3#								  
													 
													</cfif>
											</cfif>									
									</cfif>
											
										<cfif #attempt1# EQ 0 AND #attempt2# EQ 0 AND #attempt3# EQ 1>
											#QuestionDescription2#
											<cfset number=2>
										<cfelseif #attempt1# EQ 0 AND #attempt2# EQ 1 AND #attempt3# EQ 0>
											#QuestionDescription1#
											<cfset number=1>
										<cfelseif #attempt1# EQ 0 AND #attempt2# EQ 1 AND #attempt3# EQ 1>
											#QuestionDescription1#
											<cfset number=1>	
										<cfelseif #attempt1# EQ 1 AND #attempt2# EQ 0 AND #attempt3# EQ 0>	
											#QuestionDescription3#
											<cfset number=3>
										<cfelseif #attempt1# EQ 1 AND #attempt2# EQ 0 AND #attempt3# EQ 1>	
											#QuestionDescription2#
											<cfset number=2>	
										<cfelseif #attempt1# EQ 1 AND #attempt2# EQ 1 AND #attempt3# EQ 0>	
											#QuestionDescription3#	 
											<cfset number=3>																												
										</cfif>														
																	
									</td>
									</tr>					
										<tr>
											<td>												
												<cfif (#attempt1# EQ 1 AND #attempt2# EQ 1 AND #attempt3# EQ 1) OR IsDefined("number") EQ "false">								
																								
														<cfquery datasource="#request.dsn#" >
															Update Companies_security SET attempt1=0, attempt2=0, attempt3=0 WHERE Company_ID=<cfqueryparam cfsqltype="cf_sql_integer" value="#URL.comp_id#" >
														</cfquery>
														
														 <CFLOCATION URL="https://#cgi.server_name#/client/lock_out.cfm?comp_id=#comp_id#"  addtoken="yes">		
												<cfelse>
														<tr><td><input name="txtAns" type="text" required message="Answer is required"></input>
														<tr><td><input id="updAns" type="submit" value="Update" /></td>
														<tr><td ><cfinput name="IsPrivate" type="checkbox" defaultChecked="false"></cfinput>This is a private computer, keep me logged in.</td>
														<!---<tr><td><input name="CompanyID" type="hidden" value="#url.comp_id#"</td></tr>--->
														<tr><td><cfif IsDefined("number")> <cfinput name="QuestionID" type="hidden" value="#number#"></cfinput></cfif></td>																						
														<!---<tr><td><cfinput name="Failed3Attempts" type="hidden"></cfinput></td>	--->
													
												</cfif>													
										    </td>
										</tr>					
								  </table>
							  </td>
						   </tr>
					   </table>
					</td>
				  </tr>
				<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr>
			</table>											
		</cfoutput>				
	</cfform>			
 </body>	
</html>

