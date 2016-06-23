
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="0">
<CFPARAM NAME="code" DEFAULT="PR">
<cfparam name="current_date" default="#DateFormat(Now(), 'm/d/yyyy')#">
<cfparam name="current_time" default="#TimeFormat(Now(), 'HH:mm:ss')#">


		<CFQUERY datasource="#request.dsn#" NAME="read_u">		
				SELECT *
				FROM first_admin
				WHERE id = #session.ft_user_id# 
		</CFQUERY>	
		<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM Policy_Recovery
			WHERE pr_ID = #rec_id#
		</CFQUERY>

		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->
				<cfset RealECFlag=0>
		

		
		
		<CFIF #A_Update_DB_Flag# GT "0">

		
		    <!--- <CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#N_Note_1#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'S', '1', '1')		
			</CFQUERY> --->
			
			
			<cfif #N_Note_1# neq "">
							
			    <CFQUERY datasource="#request.dsn#">		
					INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type , access<CFIF IsDefined("form.title2") is True>, access2</cfif>)
					VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#N_Note_1#', '#current_date#', '#current_time#', 'PR','1'<CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
				</CFQUERY>
				<!--- <cfquery datasource="#request.dsn#">
						update Policy_Recovery
							set  appraisal_status = 'In Process'
						where pr_id = #URL.rec_id# 
				</cfquery> --->
			<cfelseif #otherpro# neq "">

					<CFQUERY datasource="#request.dsn#">		
						INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type,access <CFIF IsDefined("form.title2") is True>, access2</cfif>)
						VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#otherpro#', '#current_date#', '#current_time#', 'PR','1'<CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
					</CFQUERY>
					


			<cfif #otherpro# eq 'Cancelled Per Client'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'Cancelled Per Client',
								cancelled = '1'
							where pr_id = #URL.rec_id# 
					</cfquery>			
			<cfelseif #otherpro# eq 'T1 - Final Policy Retrieved'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'T1 Policy Received'
							where pr_id = #URL.rec_id# 
					</cfquery>			
			<cfelseif #otherpro# eq 'T1 - Invoice Sent'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'Invoice Due'
							where pr_id = #URL.rec_id# 
					</cfquery>			
			<cfelseif #otherpro# eq 'T1 - Invoice Paid'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'File Complete'
							where pr_id = #URL.rec_id# 
					</cfquery>			
			<cfelseif #otherpro# eq 'T1 - Final Policy NOT  Retrieved'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'T1 Basic Not Retrieved'
							where pr_id = #URL.rec_id# 
					</cfquery>			
<!--- #read_title.p_email# --->
<cfmail <!--- to="#read_title.p_email#" ---> to="UWMdocs@FirstTitleServices.com" from="UWMdocs@FirstTitleServices.com" subject="T1 not retrieved for order PR-#rec_id#-#read_title.bfirstname1# #read_title.blastname1#" type="html">

<cfoutput>Date: #DateFormat(Now(), "mm/dd/yyyy")#<BR><BR>

Loan ##: #read_title.loan_number#<BR><BR>

FT File ##: PR-#rec_id#<BR><BR>


The policy requested <strong>could not be retrieved</strong> under Tier One (Agent Recovery) parameters as set forth in the Statement of Work. <BR><BR>

Please authorize upgrading this request to Tier Two (Underwriter Recovery). Additional costs and fees will apply.<BR><BR>

If authorization is not provided, we will mark this file completed and issue a final invoice for services rendered<BR><BR>

Upgrade to Tier Two APPROVED<BR><BR><BR><BR>


____________________________________________	&nbsp;&nbsp;&nbsp;Date: ___________________<BR>
(Please sign and print name)Date<BR><BR><BR><BR>


Please sign and return to UWMdocs@FirstTitleServices.com<BR><BR><BR><BR>

Sincerely,<BR><BR>

First Title Staff<BR><BR>
</cfoutput>

</cfmail>					
					
					
					
			<cfelseif #otherpro# eq 'T1 - Client Approved T2'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'T2 - Approved'
							where pr_id = #URL.rec_id# 
					</cfquery>			
			<cfelseif #otherpro# eq 'T2 - Final Policy Retrieved'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'T2 Policy Received'
							where pr_id = #URL.rec_id# 
					</cfquery>			
			<cfelseif #otherpro# eq 'T2 - Invoice Sent'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'Invoice Due'
							where pr_id = #URL.rec_id# 
					</cfquery>			
			<cfelseif #otherpro# eq 'T2 - Invoice Paid'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'File Complete'
							where pr_id = #URL.rec_id# 
					</cfquery>			
			<cfelseif #otherpro# eq 'T2 - Final Policy NOT Retrieved'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'T2 NOT Retrieved'
							where pr_id = #URL.rec_id# 
					</cfquery>	
<!--- #read_title.p_email# --->
<cfif Len(read_title.p_email) eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM users
		WHERE id = #read_title.USER_ID#
		ORDER BY lp_lname ASC
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_loan_offcr">
	SELECT *
	FROM loan_officers
	WHERE ID = #read_title.lo_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="update_processor">
	update Policy_Recovery
	set
	 pname = '#read_user.lp_fname# #read_user.lp_lname#', 
	 pphone = '#read_user.lp_phone#', 
	 pfax = '#read_user.lp_fax#', 
	 pext = '#read_user.lp_ext#', 
	 p_email = '#read_user.lp_email#', 
	 oname = '#read_loan_offcr.lo_fname# #read_loan_offcr.lo_lname#', 
	 ophone = '#read_loan_offcr.lo_phone#', 
	 ofax = '#read_loan_offcr.lo_fax#', 
	 oext = '#read_loan_offcr.lo_ext#', 
	 o_email = '#read_loan_offcr.lo_email#'
	WHERE pr_id = #read_title.pr_id#
</CFQUERY>

</cfif>






<cfmail <!--- to="#read_title.p_email#" ---> to="UWMdocs@FirstTitleServices.com" from="UWMdocs@FirstTitleServices.com" subject="T2 not retrieved for order PR-#rec_id#-#read_title.bfirstname1# #read_title.blastname1#" type="html">

<cfoutput>Date: #DateFormat(Now(), "mm/dd/yyyy")#<BR><BR>

Loan ##: #read_title.loan_number#<BR><BR>

FT File ##: PR-#rec_id#<BR><BR>

The policy requested <strong>could not be retrieved</strong> under Tier Two (Underwriter Recovery) parameters as set forth in the Statement of Work. <BR><BR>

Please authorize upgrading this request to Tier Three (New or Replacement Policy). Additional costs and fees will apply including the Title Insurance Premium.<BR><BR>

If authorization is not provided, we will mark this file completed and issue a final invoice for services rendered<BR><BR><BR><BR>

Upgrade to Tier Three APPROVED<BR><BR><BR><BR>


____________________________________________	&nbsp;&nbsp;&nbsp;Date: ___________________<BR>
(Please sign and print name)Date<BR><BR><BR><BR>


Please sign and return to UWMdocs@FirstTitleServices.com<BR><BR><BR><BR>

Sincerely,<BR><BR>

First Title Staff<BR><BR>
</cfoutput>
</cfmail>					
			<cfelseif #otherpro# eq 'Tier 3 - Approved by Client'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'T3 - In- Process'
							where pr_id = #URL.rec_id# 
					</cfquery>			
			<cfelseif #otherpro# eq 'T3 - Invoice Sent'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'Invoice Due - Committment Sent'
							where pr_id = #URL.rec_id# 
					</cfquery>			
			<cfelseif #otherpro# eq 'T3 - Invoice Paid'>
                    <cfquery datasource="#request.dsn#">
							update Policy_Recovery
								set  appraisal_status= 'Invoice Paid - Policy Due'
							where pr_id = #URL.rec_id# 
					</cfquery>			
	    	</cfif>	
				

		</cfif>	

			
			<CFQUERY datasource="#request.dsn#" NAME="read_info">		
				SELECT *
				FROM Title_Notes
				WHERE N_date = '#current_date#' AND N_Time = '#current_time#' and note_type = 'PR'
			</CFQUERY>	
			

            <CFQUERY datasource="#request.dsn#" NAME="read_notes">		
				SELECT *
				FROM Title_Notes
				WHERE order_id = #URL.rec_id# and N_Note = 'Clear to Close' and note_type = 'PR'
			</CFQUERY>	
			
	        <CFQUERY datasource="#request.dsn#" NAME="read_email">		
				SELECT *
				from Policy_Recovery
				Where pr_id = #rec_id#
			</CFQUERY>	
			<CFQUERY datasource="#request.dsn#" NAME="read_comp_id">
				SELECT team_id from companies where id = #read_email.comp_id#
			</CFQUERY>
			<cftry>
			<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_comp_id.team_id#">
			<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>



		   <CFSWITCH EXPRESSION="#read_email.comp_id#">			
			    <CFCASE VALUE = 115>
			        <cfset Sendemail = "False">
			    </CFCASE>
			    <CFCASE VALUE = 621>
			        <cfset Sendemail = "False">
			    </CFCASE>    
				<CFDEFAULTCASE>
            
            
					                <CFMAIL
					TO="uwmdocs@firsttitleservices.com"
					FROM="#team_email#"
Subject="Comment has been added by your First Title team for order PR-#rec_id#-#read_title.bfirstname1# #read_title.blastname1#"
					TIMEOUT="600"
					>
					
					The following comment below has been noted regarding the above referenced file:
					
					Comment entered by: #read_u.fname# #read_u.lname#
					Date and time entered: #read_info.n_date#  #read_info.n_time#
					
					Comment: '#N_Note_1#'
					
					Please contact your First Title processing contact with any questions.
					Thank you.
					
					First Title staff
					
					            </cfmail>
				</CFDEFAULTCASE>
			</CFSWITCH>
    	</cfif>
	
			<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">		
				SELECT *
				FROM Title_Notes
				Where Order_Id = #URL.rec_id# and note_type='#URL.code#' 
				ORDER BY Note_ID ASC
			</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_notes">		
				SELECT *
				from Policy_Recovery
				Where pr_id = #rec_id# 
			</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

<script type="text/javascript">
function cant_edit(box)
{
if (frm.otherpro.value != '') {

  alert("You can't type in this box since you have selected a comment in the select box.");
  box.blur();
 return true;
 }
}
</script>
<script type="text/javascript">
function change_it(box)
{
if (frm.otherpro.value != '') {
document.frm.N_Note_1.value = '';
 return true;
 }
}
</script>
<script type="text/javascript">
function clientcheck()
{
      alert("This note will go to client as well. Be sure that this is intended.");      
   }
</script>
<script type="text/javascript">
function vendorcheck()
{
alert("This note will go to vendor as well. Be sure that this is intended.");  
}
</script>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=590 align=center valign=top>
			<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<td width=590 align=center valign=top bgcolor=e1e1e1>
					<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
						<tr>
							<td width=590  align=right valign=top bgcolor=e1e1e1>
								<cfif #read_all_notes.recordcount# GT 0>
									<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
							
										<tr>
											<td width=590 align=center valign=top bgcolor=e1e1e1>
												<B><font face=verdana size=2 color=blue>Processing Notes</FONT></B>
											</td>
										</tr>
									</table>
								</cfif>
<CFOUTPUT QUERY="Read_all_notes">
									<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
										<tr>
											<td width=255 align=left valign=top bgcolor=e1e1e1>
												<table width=255 cellpadding=1 cellspacing=1 border=0 >
													<tr>
														<td width=65 align=center valign=middle bgcolor=d1d1d1>
															<font face=verdana size=1 color=black>
															#DateFormat(N_Date, "mm/dd/yyyy")#				
														</td>
														<td width=65 align=center valign=middle bgcolor=d1d1d1>
															<font face=verdana size=1 color=black>
															#TimeFormat(N_Time, "HH:mm:ss")#			
														</td>
														<td width=125 align=center valign=middle bgcolor=d1d1d1>
															<font face=verdana size=1 color=black>
															#Fname# #LName#
														</td>
													<tr>
												</table>
											<td width=444 align=left valign=top bgcolor=e1e1e1>
												<PRE><font face=verdana size=1 color=black>#N_Note#</PRE>
											</td>
										</tr>
									</table>
</CFOUTPUT>


<p>
<CFFORM NAME="frm" ACTION="./Title_comments_nav_pr.cfm?uid=#session.ft_user_id#&al=#URL.al#&rec_id=#url.rec_id#&a_trigger=1&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=1&code=#url.code#" METHOD=POST>
									<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
										<tr>
											<td width=590 align=center valign=top bgcolor=green>
												<font face=verdana size=1 color=white>
												<b>Add Comments for order <CFOUTPUT>#url.code#-#url.rec_id#</CFOUTPUT></a>			
										</tr>
										<tr>
											<td width=590 align=center valign=top bgcolor=yellow>
												<font face=verdana size=1 color=red>
												<b>NOTE: PLEASE USE FIXED COMMENTS THAT APPLY. OTHERWISE, REPORTING WILL BE INCORRECT
										</tr>
										<tr>
											<td width=590 align=left valign=top bgcolor=e1e1e1>
												<font face=verdana size=1 color=blue>
												<br>Select a standard event here </font>
												<select name="otherpro" onChange=change_it(this)
													size="1" 
													style="font-size: 9; 
													font-family: verdana; 
													font-style: normal; 
													color: 003F1E; 
													background-color: E4E3E3; 
													border-color: white; 
													border-left-width: thin; 
													border-right-width: thin; 
													border-top-width: thin; 
													border-bottom-width: thin; 
													border-width: thin; 
													border-style: bar; 
													clear: none; 
													float: none;" 
													rows="3" 
													cols="45" 
												>
	 											<option value="">Select</OPTION>
												<option value="T1 - Final Policy Retrieved">T1 - Final Policy Retrieved</OPTION>
												<option value="T1 - Final Policy uploaded" >T1 - Final Policy uploaded</OPTION>
												<option value="T1 Product Sent to Client">T1 Product Sent to Client</OPTION>
												<option value="T1 - Invoice Sent">T1 - Invoice Sent</OPTION>
												<option value="T1 - Invoice Paid">T1 - Invoice Paid</OPTION>
												<option value="T1 - Final Policy NOT  Retrieved">T1 - Final Policy NOT  Retrieved</OPTION>
												<option value="T1 - Client Approved T2">T1 - Client Approved T2</OPTION>
												<option value="T2 - Final Policy Retrieved">T2 - Final Policy Retrieved</OPTION>	
												<option value="T2 - Final Policy uploaded">T2 - Final Policy uploaded</OPTION>
												<option value="T2 - Invoice Sent">T2 - Invoice Sent</OPTION>
												<option value="T2 - Invoice Paid">T2 - Invoice Paid</OPTION>	
												<option value="T2 - Final Policy NOT Retrieved">T2 - Final Policy NOT Retrieved</OPTION>
												<option value="Tier 3 - Approved by Client">Tier 3 - Approved by Client</OPTION>
												<option value="Abstract Ordered: Vendor">Abstract Ordered: Vendor</OPTION>
   												<option value="Abstract Received">Abstract Received</OPTION>
   												<option value="T3 - Invoice sent">T3 - Invoice sent</OPTION>  
   												<option value="T3 - Invoice Paid">T3 - Invoice Paid</OPTION>
   												<option value="Policy Uploaded">Policy Uploaded</OPTION>	
   												<option value="Cancelled Per Client">Cancelled Per Client</OPTION>	
											  </select> 
	
	 	 										<br><br><font face=verdana size=1 color=blue>Or type additional comments below and click "Add" <br><br>
	  	  
												<TEXTAREA name="N_Note_1" onFocus=cant_edit(this) COLS=80 ROWS=5
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
												clear: none;"></TEXTAREA>
												<br>
												Email address to send note to: 
						 <INPUT TYPE=TEXT NAME="email" VALUE="" MaxLength=200 Size=26
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: E4E3E3; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" >
										</tr>
										<tr>
											<td width=590 align=left valign=top bgcolor=e1e1e1>
												<font face=verdana size=1 color=black>
												<b><INPUT TYPE="checkbox" NAME="title" VALUE=1 onClick="clientcheck();"> Check this box if you would like to send the entered note to client	
										</tr>
										<tr>
											<td width=590 align=left valign=top bgcolor=e1e1e1>
												<font face=verdana size=1 color=black>
												<b><INPUT TYPE="checkbox" NAME="title2" VALUE=1 onClick="vendorcheck();"> Check this box if you would like to send the entered note to vendor	
										</tr>
										<tr>
											<td width=590 align=right valign=top bgcolor=e1e1e1>
												<input type=image src="./images/button_add.gif" border=0>			
										</tr>
									</table>
								</table>
							</td>
						</tr>		
				</table>
			</FORM>
<p>
<p>
<br><br>
		<a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a>	
	</td>
</tr>

	</table>

			
			</TD>
		</TR>

	</table>
</CFFORM>	
</BODY>
</HTML>

	  
	 