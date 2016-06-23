
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="0">
<CFPARAM NAME="code" DEFAULT="">
<cfparam name="current_date" default="#DateFormat(Now(), 'm/d/yyyy')#">
<cfparam name="current_time" default="#TimeFormat(Now(), 'HH:mm:ss')#">


		<CFQUERY datasource="#request.dsn#" NAME="read_u">		
				SELECT *
				FROM first_admin
				WHERE id = #session.ft_user_id# 
		</CFQUERY>	
		<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM ancillary
			WHERE anc_ID = #rec_id#
		</CFQUERY>

		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->
		
		<cfif #url.code# eq "F">
			<CFQUERY datasource="#request.dsn#" NAME="get_prod">
				select * from realec_product_list
					where Product='F' and Product_type='#read_title.flood#' 
			</cfquery>
			<cfif #get_prod.recordcount# neq 0>
				<cfset RealECFlag=1>
			<cfelse>
				<cfset RealECFlag=0>
			</cfif>
		<cfelseif #url.code# eq "AVM">
			<CFQUERY datasource="#request.dsn#" NAME="get_prod">
				select product from realec_product_list
					where product='AVM' and product_type='#read_title.avm#'
			</cfquery>
			<cfif #get_prod.recordcount# neq 0>
				<cfset RealECFlag=1>
			<cfelse>
				<cfset RealECFlag=0>
			</cfif>	
		<cfelseif #url.code# eq "CR">
			<CFQUERY datasource="#request.dsn#" NAME="get_prod">
				select product from realec_product_list
					where product='CR' and product_type='#read_title.credit#'
			</cfquery>
			<cfif #get_prod.recordcount# neq 0>
				<cfset RealECFlag=1>
			<cfelse>
				<cfset RealECFlag=0>
			</cfif>>	
		<cfelseif #url.code# eq "SN">
			<CFQUERY datasource="#request.dsn#" NAME="get_prod">
				select product from realec_product_list
					where product='SN' and product_type='#read_title.signing#'
			</cfquery>
			<cfif #get_prod.recordcount# neq 0>
				<cfset RealECFlag=1>
			<cfelse>
				<cfset RealECFlag=0>
			</cfif>
		</cfif>				
		
		
		<CFIF #A_Update_DB_Flag# GT "0">

		
		    <!--- <CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#N_Note_1#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'S', '1', '1')		
			</CFQUERY> --->
			
		  <CFQUERY datasource="#request.dsn#" NAME="selstatus">
				select status from ancillary_detl
				WHERE anc_id = #URL.rec_id# and order_type='#URL.code#'
		  </cfquery>
		  <cfif #selstatus.status# is not "Report Emailed/Delivered">
			
			<cfif #N_Note_1# neq "">
							
			    <CFQUERY datasource="#request.dsn#">		
					INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type , access<CFIF IsDefined("form.title2") is True>, access2</cfif>)
					VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#N_Note_1#', '#current_date#', '#current_time#', '#URL.code#','1'<CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
				</CFQUERY>
				<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
					update ancillary_detl
					set status='In Process'
					WHERE anc_id = #URL.rec_id# and order_type='#URL.code#'
				</cfquery>
				<cfquery datasource="#request.dsn#">
						update Ancillary
							set  appraisal_status = 'In Process'
						where anc_id = #URL.rec_id# 
				</cfquery>
			<cfelseif #otherpro# neq "">
				<cfif #RealECFlag# eq 1>
					<cfif #otherpro# eq "Service Cancelled">
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type <CFIF IsDefined("form.title2") is True>, access2</cfif>)
							VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#otherpro#', '#current_date#', '#current_time#', '#URL.code#'<CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
						</CFQUERY>
						<cfquery datasource="#request.dsn#">
								update Ancillary
									set  appraisal_status = 'Cancelled'
								where anc_id = #URL.rec_id# 
						</cfquery>
						<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
							update ancillary_detl
							set status='Cancelled'
							WHERE anc_id = #URL.rec_id# and order_type='#URL.code#'
						</cfquery>
					</cfif>
					<cfif #otherpro# eq "Loan withdrawn">
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type , access<CFIF IsDefined("form.title2") is True>, access2</cfif>)
							VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#otherpro#', '#current_date#', '#current_time#', '#URL.code#','1'<CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
						</CFQUERY>
						<cfquery datasource="#request.dsn#">
								update Ancillary
									set  appraisal_status = 'Cancelled'
								where anc_id = #URL.rec_id# 
						</cfquery>
						<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
							update ancillary_detl
							set status='Cancelled'
							WHERE anc_id = #URL.rec_id# and order_type='#URL.code#'
						</cfquery>
					</cfif>	
					<cfif #otherpro# eq "Service Delayed">
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type,access <CFIF IsDefined("form.title2") is True>, access2</cfif>)
							VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#otherpro#', '#current_date#', '#current_time#', '#URL.code#','1'<CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
						</CFQUERY>
						<cfquery datasource="#request.dsn#">
								update Ancillary
									set  appraisal_status = 'In Process'
								where anc_id = #URL.rec_id# 
						</cfquery>
						<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
							update ancillary_detl
							set status='In Process'
							WHERE anc_id = #URL.rec_id# and order_type='#URL.code#'
						</cfquery>
					</cfif>
					<cfif #otherpro# eq "Service on Hold">
						<!--- <cfoutput>otherpro==#otherpro#</cfoutput> --->
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type <CFIF IsDefined("form.title2") is True>, access2</cfif>)
							VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#otherpro#', '#current_date#', '#current_time#', '#URL.code#'<CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
						</CFQUERY>
						<cfquery datasource="#request.dsn#">
								update Ancillary
									set  appraisal_status = 'Service on Hold'
								where anc_id = #URL.rec_id# 
						</cfquery>
						<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
							update ancillary_detl
							set status='Service on Hold'
							WHERE anc_id = #URL.rec_id# and order_type='#URL.code#'
						</cfquery>
					</cfif>
					<cfif #otherpro# eq "Service Resume">
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type,access <CFIF IsDefined("form.title2") is True>, access2</cfif>)
							VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#otherpro#', '#current_date#', '#current_time#', '#URL.code#','1'<CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
						</CFQUERY>
						<cfquery datasource="#request.dsn#">
								update Ancillary
									set  appraisal_status = 'In Process'
								where anc_id = #URL.rec_id# 
						</cfquery>
						<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
							update ancillary_detl
							set status='In Process'
							WHERE anc_id = #URL.rec_id# and order_type='#URL.code#'
						</cfquery>
					</cfif>
					<cfif #otherpro# eq "Service Complete">
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type,access <CFIF IsDefined("form.title2") is True>, access2</cfif>)
							VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#otherpro#', '#current_date#', '#current_time#', '#URL.code#','1'<CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
						</CFQUERY>
						<cfquery datasource="#request.dsn#">
								update Ancillary
									set appraisal_status = 'Delivered'
								where anc_id = #URL.rec_id# 
						</cfquery>
						<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
							update ancillary_detl
							set status='Delivered'
							WHERE anc_id = #URL.rec_id# and order_type='#URL.code#'
						</cfquery>
					</cfif>
					<cfif #otherpro# eq "Service Cancel confirmed">
						<CFQUERY datasource="#request.dsn#">		
							INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type,access <CFIF IsDefined("form.title2") is True>, access2</cfif>)
							VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#otherpro#', '#current_date#', '#current_time#', '#URL.code#','1'<CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
						</CFQUERY>
						<cfquery datasource="#request.dsn#">
								update Ancillary
									set  appraisal_status= 'Cancelled'
								where anc_id = #URL.rec_id# 
						</cfquery>
						<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
							update ancillary_detl
							set status='Cancelled'
							WHERE anc_id = #URL.rec_id# and order_type='#URL.code#'
						</cfquery>
					</cfif>
				<cfelse>

					<CFQUERY datasource="#request.dsn#">		
						INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type,access <CFIF IsDefined("form.title2") is True>, access2</cfif>)
						VALUES('#read_u.fname# #read_u.lname#', #URL.rec_id#, '#otherpro#', '#current_date#', '#current_time#', '#URL.code#','1'<CFIF IsDefined("form.title2") is True>, '#title2#'</cfif>)		
					</CFQUERY>
					<cfquery datasource="#request.dsn#">
							update Ancillary
								set  appraisal_status= '#otherpro#'
							where anc_id = #URL.rec_id# 
					</cfquery>
					<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
						update ancillary_detl
						set status='#otherpro#'
						WHERE anc_id = #URL.rec_id# and order_type='#URL.code#'
					</cfquery>
				</cfif>	
			</cfif>

			
			<CFQUERY datasource="#request.dsn#" NAME="read_info">		
				SELECT *
				FROM Title_Notes
				WHERE N_date = '#current_date#' AND N_Time = '#current_time#'
			</CFQUERY>	
			
			 <cfif #RealECFlag# eq 1> 
				<cfif #read_info.N_Note# eq "Loan Withdrawn">
					<cfinvoke component="RealEC_EventManager" method="generate_xml">
						<cfif #read_info.note_type# eq "F">
							<cfinvokeargument name="TYPE" value="F">
						<CFELSEIF #read_info.note_type# eq "AVM">
							<cfinvokeargument name="TYPE" value="AVM">
						<CFELSEIF #read_info.note_type# eq "CR">
							<cfinvokeargument name="TYPE" value="CR">	
						</cfif>
						
						<cfinvokeargument name="ORDER" value=#read_info.Order_ID#>
						<cfinvokeargument name="EVENT" value="Loan Withdrawn"> 
					</cfinvoke>
				</cfif> 
			
				<cfif #read_info.N_Note# eq "Service Delayed">
					<cfinvoke component="RealEC_EventManager" method="generate_xml">
						<cfif #read_info.note_type# eq "F">
							<cfinvokeargument name="TYPE" value="F">
						<CFELSEIF #read_info.note_type# eq "AVM">
							<cfinvokeargument name="TYPE" value="AVM">
						<CFELSEIF #read_info.note_type# eq "CR">
							<cfinvokeargument name="TYPE" value="CR">	
						</cfif>
						
						<cfinvokeargument name="ORDER" value=#read_info.Order_ID#>
						<cfinvokeargument name="EVENT" value="Service Delayed"> 
					</cfinvoke>
				</cfif> 
			
			
				 <cfif #read_info.N_Note# eq "Service on Hold">
					<cfinvoke component="RealEC_EventManager" method="generate_xml">
						<cfif #read_info.note_type# eq "F">
							<cfinvokeargument name="TYPE" value="F">
						<CFELSEIF #read_info.note_type# eq "AVM">
							<cfinvokeargument name="TYPE" value="AVM">
						<CFELSEIF #read_info.note_type# eq "CR">
							<cfinvokeargument name="TYPE" value="CR">
						</cfif>
						
						<cfinvokeargument name="ORDER" value=#read_info.Order_ID#>
						<cfinvokeargument name="EVENT" value="Service on Hold"> 
					</cfinvoke>
				</cfif> 
				 <cfif #read_info.N_Note# eq "Service Resume">
					<cfinvoke component="RealEC_EventManager" method="generate_xml">
						<cfif #read_info.note_type# eq "F">
							<cfinvokeargument name="TYPE" value="F">
						<CFELSEIF #read_info.note_type# eq "AVM">
							<cfinvokeargument name="TYPE" value="AVM">
						<CFELSEIF #read_info.note_type# eq "CR">
							<cfinvokeargument name="TYPE" value="CR">
						</cfif>
						
						<cfinvokeargument name="ORDER" value=#read_info.Order_ID#>
						<cfinvokeargument name="EVENT" value="Service Resume"> 
					</cfinvoke>
				</cfif> 
				 <cfif #read_info.N_Note# eq "Service Complete">
					<cfinvoke component="RealEC_EventManager" method="generate_xml">
						<cfif #read_info.note_type# eq "F">
							<cfinvokeargument name="TYPE" value="F">
						<CFELSEIF #read_info.note_type# eq "AVM">
							<cfinvokeargument name="TYPE" value="AVM">
						<CFELSEIF #read_info.note_type# eq "CR">
							<cfinvokeargument name="TYPE" value="CR">
						</cfif>
						
						<cfinvokeargument name="ORDER" value=#read_info.Order_ID#>
						<cfinvokeargument name="EVENT" value="Service Complete"> 
					</cfinvoke>
				</cfif> 
			
				 <cfif #form.N_Note_1# is not "" and #form.otherpro# is "">
					 <CFIF IsDefined("form.title2") is True>
						 <cfif #form.title2# is not ""> 
							<cfinvoke component="RealEC_EventManager" method="generate_xml">
								<cfif #read_info.note_type# eq "F">
									<cfinvokeargument name="TYPE" value="F">
								<CFELSEIF #read_info.note_type# eq "AVM">
									<cfinvokeargument name="TYPE" value="AVM">
								<CFELSEIF #read_info.note_type# eq "CR">
									<cfinvokeargument name="TYPE" value="CR">
								</cfif>
								
								<cfinvokeargument name="ORDER" value=#read_info.Order_ID#>
								<cfinvokeargument name="EVENT" value="Comment"> 
							</cfinvoke>
						 </cfif> 	
					 </cfif> 	
				</cfif> 
			
				<cfif #read_info.N_Note# eq "Service Cancelled">
					<cfinvoke component="RealEC_EventManager" method="generate_xml">
						<cfif #read_info.note_type# eq "F">
							<cfinvokeargument name="TYPE" value="F">
						<CFELSEIF #read_info.note_type# eq "AVM">
							<cfinvokeargument name="TYPE" value="AVM">
						<CFELSEIF #read_info.note_type# eq "CR">
							<cfinvokeargument name="TYPE" value="CR">	
						</cfif>
						
						<cfinvokeargument name="ORDER" value=#read_info.Order_ID#>
						<cfinvokeargument name="EVENT" value="Service Cancelled"> 
					</cfinvoke>
				</cfif>  
				<cfif #read_info.N_Note# eq "Service Cancel confirmed">
					<cfinvoke component="RealEC_EventManager" method="generate_xml">
						<cfif #read_info.note_type# eq "F">
							<cfinvokeargument name="TYPE" value="F">
						<CFELSEIF #read_info.note_type# eq "AVM">
							<cfinvokeargument name="TYPE" value="AVM">
						<CFELSEIF #read_info.note_type# eq "CR">
							<cfinvokeargument name="TYPE" value="CR">
						</cfif>
						
						<cfinvokeargument name="ORDER" value=#read_info.Order_ID#>
						<cfinvokeargument name="EVENT" value="Service Cancel confirmed"> 
					</cfinvoke>
				</cfif>
			</cfif>

		  </cfif>
            <CFQUERY datasource="#request.dsn#" NAME="read_notes">		
				SELECT *
				FROM Title_Notes
				WHERE order_id = #URL.rec_id# and N_Note = 'Clear to Close'
			</CFQUERY>	
			
	        <CFQUERY datasource="#request.dsn#" NAME="read_email">		
				SELECT *
				FROM ancillary
				Where anc_id = #rec_id#
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
					TO="#team_email#"
					FROM="#team_email#"
Subject="Comment has been added by your First Title team for order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
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
				FROM ancillary
				Where anc_id = #rec_id# 
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
<CFFORM NAME="frm" ACTION="./Title_comments_nav_sn.cfm?uid=#session.ft_user_id#&al=#URL.al#&rec_id=#url.rec_id#&a_trigger=1&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=1&code=#url.code#" METHOD=POST>
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
												<cfif #RealECFlag# eq 1 >
													<option value="Service Cancelled">Service Cancelled</OPTION>
													<option value="Loan withdrawn">Loan withdrawn</OPTION>
													<option value="Service Delayed">Service Delayed</OPTION>
													<option value="Service on Hold">Service on Hold</OPTION><br>
													<option value="Service Resume">Service Resume</OPTION>
													<option value="Service Complete">Service Completed</OPTION>
													<option value="Service Cancel Confirmed">Service Cancel confirmed</OPTION>
												<cfelse>
												<option value="Call for Detail">Call for Detail</OPTION>
												<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
												<option value="Clear to Close">Clear to Close</OPTION>
												<option value="Commitment Resent Tax Data Now Complete" style="thin">Commitment Resent Tax Data Now Complete</OPTION>
												<option value="Commitment Sent Taxes to Follow" style="thin">Commitment Sent Taxes to Follow</OPTION>
												<option value="Court House Closed">Court House Closed</OPTION>
												<option value="FT Shipped Pack" style="thin">FT Shipped Pack</OPTION>
												<option value="Funds Not Received" style="thin">Funds Not Received</OPTION>	
												<option value="Judgments Exist">Judgments Exist</OPTION>
												<option value="Loan CLosed">Loan Closed</OPTION>
												<option value="Loan Funded">Loan Funded</OPTION>
												<option value="Mortgage Rejected">Mortgage Rejected</OPTION>
												<option value="Mortgage Rejection Satisfied">Mortgage Rejection Satisfied</OPTION>	
												<option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
												<option value="Not Clear to Close">Not Clear to Close</OPTION>
												<option value="OK to fund" style="thin">OK to fund</OPTION>
   												<option value="Order Reinstated" style="thin">Order Reinstated</OPTION>
   												<option value="Package Received" style="thin">Package Received</OPTION>  
   												<option value="Package Due/Unrec." style="thin">Package Due/Unrec.</OPTION>
   												<option value="Pre-Funding Completed" style="thin">Pre-Funding Completed</OPTION>	
   												<option value="Pre-Funding Problem" style="thin">Pre-Funding Problem</OPTION>
												<option value="Subordination Needed">Subordination Needed</OPTION>
												<option value="Subordination Received">Subordination Received</OPTION>
												<option value="Supervisor Notification" style="thin">Supervisor Notification</OPTION>
												<option value="THIS FILE WILL BE CLEARED BY " style="thin">THIS FILE WILL BE CLEARED BY </OPTION>
												<option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
												<option value="Vesting Issue">Vesting Issue</OPTION>
    											<option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
												<option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>		
	 	 										<option value=""></option>
												</cfif>
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

	  
	 