	<CFPARAM NAME="a_flag" DEFAULT="0">
    <CFPARAM NAME="a_point" DEFAULT="0">
	<cfif #a_flag# eq 1>	
			
			<SCRIPT LANGUAGE="JavaScript">
window.alert("You need to assign a Closer before you can submit this request!")

</SCRIPT>
</cfif>
	<cfif #a_point# eq 1>	
			
			<SCRIPT LANGUAGE="JavaScript">
window.alert("You need to request a closing before you can assign a Closer for this order!")

</SCRIPT>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#
		
		</CFQUERY>
		
		

     
     <CFQUERY datasource="#request.dsn#" NAME="aaaa">		
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #read_title.title_id#
			</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title_closer">
		
			SELECT *
			FROM Doc_closer_Title
			WHERE title_ID = #rec_id#
		
		</CFQUERY>
 <CFQUERY datasource="#request.dsn#" NAME="read_assigned_closer">
		
			SELECT *
			FROM closer
			WHERE closer_ID = '#read_title_closer.closer_ID#'
			      
		</CFQUERY> 
		
		<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT company
		FROM companies
		WHERE id = #read_title.comp_id#
		
	</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_all_closers">
		
			SELECT *
			FROM closer 
			
			ORDER BY company ASC, lname ASC, fname ASC
		
		</CFQUERY>

	
	<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">
		
			SELECT *
			FROM title
			WHERE pstate = '#read_title.pstate#' AND UPPER(pcounty) = UPPER('#read_title.pcounty#')
		
		</CFQUERY>
	
	
	<CFQUERY datasource="#request.dsn#" NAME="read_state">
		
			SELECT *
			FROM closer_county 
			where st_abbrev = '#read_zip_code.pstate#' AND UPPER(ct_name) = <cfif read_zip_code.pcounty EQ 'City of Alexandria'>'Alexandria City'<cfelse>UPPER('#read_zip_code.pcounty#')
			</cfif>
			
		
		</CFQUERY>  
		
				
		   <CFQUERY datasource="#request.dsn#" NAME="read_all_closers">
		
			SELECT *
			FROM closer_county a, closer b
			where (a.st_abbrev = '#read_state.st_abbrev#' AND UPPER(a.ct_name) = <cfif read_state.ct_name EQ 'City of Alexandria'>'Alexandria City'<cfelse>UPPER('#read_state.ct_name#')</cfif> and a.closer_id = b.closer_id)
			
			or 
			
			(a.st_abbrev = '#read_state.st_abbrev#' AND UPPER(a.ct_name) = 'All' and a.closer_id = b.closer_id)

			or 
			
			(a.st_abbrev = 'All' AND UPPER(a.ct_name) = 'All' and a.closer_id = b.closer_id)
			
			order by b.company
		
		</CFQUERY>
	
	
	

		
		
<CFIF #read_title_closer.a_Assigned_by# GT "">


		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ STARTED the Abstract Process        \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_starting">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_title_closer.a_Assigned_by#
		
		</CFQUERY>		
		
		
		<CFSET user_that_started = #read_user_starting.fname# & " " & #read_user_starting.lname#>

		
<CFELSE>
		<CFSET user_that_started = "Not Assigned Yet">
</CFIF>


<CFIF #read_title_closer.a_Recieved_by# GT "">

		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ FINISHED the Abstract Process       \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_finished">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_title_closer.a_Recieved_by#
		
		</CFQUERY>		
		
		<CFSET user_that_finished = #read_user_finished.fname# & " " & #read_user_finished.lname#>

<CFELSE>
		<CFSET user_that_finished = "Not Received Yet">
</CFIF>
			

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

<script type="text/javascript">


function ValidateForm(frm)
{
frm = document.frm;

if (frm.SearchType.value=='') {
 alert("Please select a search type in order to proceed!")
 frm.SearchType.focus(); 
      return false; 
 } 

return true;

 }
 </script>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
		
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	   
	   <tr>
			<td width=790 align=left valign=top bgcolor=e1e1e1>
				<FONT FACE=ARIAL SIZE=2 color="blue">
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
				<Center><B>NATIONAL SIGNING SERVICES, LLC.<br>30 W. Gude Dr.<br>Rockville, MD. 20850<br>Phone: 301-279-0303<br>Fax#: 301-315-8162<br>Email: closings@firsttitleservices.com</B></Center>
<cfelse>
				<Center><B>NATIONAL SIGNING SERVICES, LLC.<br>7361 Calhoun Place, Suite 200<br>Rockville, MD. 20855<br>Phone: 301-279-0303<br>Fax#: 301-315-8162<br>Email: closings@firsttitleservices.com</B></Center>
</cfif>

			</TD>
		</TR><p>
	   
	   <cfoutput>
	   <tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closing Assign Form for T-#rec_id#</B></CENTER>
			</TD>
		</TR>
</cfoutput>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

		




<!--- =================================== --->
<!--- =================================== --->



<CFOUTPUT>


<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<!--- <tr>
			<td width=519 colspan=2 align=center valign=top bgcolor=f3f3f3>
				<font size=3 color=blue face=arial>
				<B>Closer Form</B>
			</td>
		</tr> --->

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person that Assigned the Closer - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><B>#user_that_started#</B></cfif>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Started - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><B>#read_title_closer.a_date_assigned#</B></cfif>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Started - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><B>#read_title_closer.a_time_assigned#</B></cfif>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person that received the Closer - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><B>#user_that_finished#</B></cfif>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Completed - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><B>#read_title_closer.a_Date_Completed#</B></cfif>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Completed - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><B>#read_title_closer.a_Time_Completed#</B></cfif>
			</td>
		</tr>
		
		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Closer Assigned :</B>
			</td>
		</tr>	

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Company -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><CFIF #read_assigned_closer.recordcount# EQ "0">
					Not yet Assigned
				<CFELSE>
					<B>#read_assigned_closer.company#</B>
				</CFIF><CFELSE> Not yet Assigned</cfif>
			</td>
		</tr>
<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Vendor ID -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
					<CFIF #read_assigned_closer.recordcount# GT "0">24043#read_assigned_closer.closer_id#</cfif>
			</td>
		</tr>
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Phone -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><B>#read_assigned_closer.phone#</B></cfif>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Ext -  
			</td>
						<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Email -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><B>#read_assigned_closer.email#</B></cfif>
			</td>
		</tr>
		
			
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><B>#read_assigned_closer.ext#</B></cfif>
			</td>
		</tr>
		
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Fax -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><B>#read_assigned_closer.fax#</B></cfif>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Sent by -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<cfif #read_title_closer.a_assigned_by# GT 0><B>#read_assigned_closer.pref_for_send#</B></cfif>
			</td>
		</tr>
		
		
		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<cfif #read_title_closer.a_Date_Assigned# neq "">
				<font size=2 color=blue face=arial>If this Closer is to be re-assigned, then
				use the pulldown below to select another to assign to this Closer.
			<cfelse> 
			<font size=2 color=blue face=arial>Use the list below to assign a Closer for this this request.
			</cfif>
			</td>
		</tr>		
</CFOUTPUT>

<CFFORM NAME="frm" ACTION="./title_closing_doc_assign.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=10&company_id=#company_ID#" METHOD=POST>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Closers List
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
			<SELECT NAME="Closer_ID_new" 			
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e1e1e1; 
				border-color: e1e1e1; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; 
				float: none;" 
				rows="5" 
				cols="45" 
				>
				<OPTION VALUE="NONE" SELECTED></OPTION>
				<CFOUTPUT query ="read_all_closers">
					<CFQUERY datasource="#request.dsn#" NAME="checknew">
						select vendor_id from vendors_stacie
						where username = '#username#'
						and password = '#password#'	
					</cfquery>
					<cfif checkNew.recordcount>
					<CFQUERY datasource="#request.dsn#" NAME="get_price">
						select closer_fee
						from vendor_pricing
						where vendor_id = #checknew.vendor_id#
					</cfquery>
					<cfif Len(get_price.closer_Fee)>
						<cfset cost = get_price.closer_Fee>
					<cfelse>
						<cfset cost = a_cost>
					</cfif>
					
				<cfif read_title.pstate eq 'DE' and Closer_id eq 3460>
				<OPTION VALUE="#Closer_ID#">#company#-- #cost#</OPTION>
				<cfelseif read_title.pstate neq 'DE'>
				<OPTION VALUE="#Closer_ID#">#company#-- #cost#</OPTION>
				<cfelse>
				<OPTION VALUE="#Closer_ID#">#company#-- #cost#</OPTION>
				</cfif>
				</cfif>
				</CFOUTPUT>			
				</SELECT>
					<cfif #read_title_closer.a_Date_Assigned# neq "">&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="reassign" value="1"><input type=image src="./images/button_re-assign.gif" border=0><img src="./images/clear.gif" height=10 width=40>
					<cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="reassign" value="0"><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></cfif>
	
		
		</td>
	</tr>		

		


</CFFORM>
</TABLE>
<CFOUTPUT>

	<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
	
	<tr>		
		<td width=200 align=right valign=top bgcolor=f3f3f3>	
			<font size=2 color=black face=arial>
			SELLER:
		
		
		</td>

		<td width=319 align=left valign=top bgcolor=f3f3f3>	
			<font size=2 color=blue face=arial>
				<B>#read_title.sfirstname1# #read_title.sminame1# #read_title.slastname1#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_title.sssn1# </B><br>
				<B>#read_title.sfirstname2# #read_title.sminame2# #read_title.slastname2#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_title.sssn2#</B>
		</td>
	
	
	</tr>


	<tr>		
		<td width=200 align=right valign=top bgcolor=f3f3f3>	
			<font size=2 color=black face=arial>
			BORROWER: 
		
		
		</td>

		<td width=310 align=left valign=top bgcolor=f3f3f3>	
			<font size=2 color=blue face=arial>
				<B>#read_title.bfirstname1# #read_title.bminame1# #read_title.blastname1#&nbsp;&nbsp;&nbsp;&nbsp;SSN: #read_title.bssn1#<cfif #read_title.bhphone1# neq ""><br>Phone: #read_title.bhphone1#</cfif></B><br>
				<CFIF #READ_TITLE.BLASTNAME2# NEQ ""><B>#read_title.bfirstname2# #read_title.bminame2# #read_title.blastname2#&nbsp;&nbsp;&nbsp;&nbsp;SSN: #read_title.bssn2#<cfif #read_title.bhphone2# neq ""><br>Phone: #read_title.bhphone2#</cfif></B></CFIF>
		</td>
	
	
	</tr>



		
<!--- =========================================================== --->
		<tr>
			<td width=200 align=right valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				PROPERTY ADDRESS:
			</td>
		

	
			<td width=319 align=left valign=top bgcolor=f3f3f3>
				
				
				
						
							<font size=2 color=blue face=arial>
							<B>#read_title.paddress#</B><br>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcity#,</B>&nbsp;
							<font size=2 color=blue face=arial>
							<B>#read_title.pstate#</B>&nbsp;
					<font size=2 color=blue face=arial>
							<B>#read_title.pzip#</B><br>

						</td>				
				</tr><tr>
				<td width=200 align=right valign=top bgcolor=f3f3f3>		
						<font size=2 color=black face=arial>
				COUNTY:
				</td>
						<td width=319 align=left valign=top bgcolor=f3f3f3>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcounty#</B>
						</td>
					</tr>
					

				</table>
					
<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>	
<tr>		
		<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Phone:
		
		
		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
				
				<B>#read_title.pphone# </B>
		</td>
	
	
	</tr>
<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Fax:
		
		
		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
				
				<B>#read_title.pfax# </B>
		</td>
	
	
	</tr>
	<tr>		
		<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Date of Appointment:
		
		
		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
				
				<B>#aaaa.a_req_closing_month#/#aaaa.a_req_closing_day#/#aaaa.a_req_closing_year# </B>
		</td>
	
	
	</tr>


	<tr>		
		<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Time of Appointment:
		
		
		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
				
				<B>#aaaa.a_req_closing_time# </B>
		</td>
	
	
	</tr>

<tr>		
		<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Location of Appointment:
		
		
		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
				
				<B>#aaaa.a_settle_location# </B>
		</td>
	
	
	</tr>
<tr>		
		<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Contact for Lender:
		
		
		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
				
				<B>#aaaa.a_req_by_phone# </B>
		</td>
	
	
	</tr>
	<tr>		
		<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Title Company:
		
		
		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
				
				<B>#read_comp.company# </B>
		</td>
	
	
	</tr>

<td width=200 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Special Instructions:
		
		
		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
				
				<B>#aaaa.a_special_inst# </B>
		</td>
	
	
	</tr>

<!--- =========================================================== --->				
</TABLE>
<!--- <table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
		<tr>
			<td width=519 colspan=2  align=left valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				
				<p>
				<ul>
					<li>You will be receiving a LOAN PACKAGE directly from LENDER
					<li>You will be receiving a HUD-1/ANCILLARY DOC package from TITLE CO.
					<p>
					YOU MUST HAVE BOTH PACKAGES BEFORE SIGNING IS TO TAKE PLACE
				    <P>
					Other instructions:<br><p>
					1. Following closing, please contact Closing Coordinator Supervisor<br>
					to confirm closing completed - Toll Free 1-866-484-8537 x335.<br>
					Leave VM message.<br><p>
					2. Please Fax the executed hud to 240-363-2591 ASAP after<br>
					 closing along with Tracking number for the package going back<br>
					  to the Title Company.<br><p>
			3. If any questions after hours or on weekends call Ryan Bowman<br>Heidi Kelly at 301-922-9689.
				</UL>
				
			</td>
		</tr>
		</TABLE> --->
</CFOUTPUT>
</form>
<cfoutput>
<form action="title_closing_email.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
<input type="hidden" name="uid" value="#URL.uid#">
<input type="hidden" name="al" value="#URL.al#">
<input type="hidden" name="company_ID" value="#company_ID#">
<input type="hidden" name="rec_id" value="#rec_id#">
<input type="hidden" name="email" value="#read_assigned_closer.email#">
<input type="hidden" name="fax" value="#read_assigned_closer.fax#">
<input type="hidden" name="user_that_started" value="#user_that_started#">
<input type="hidden" name="date" value="#read_title_closer.a_date_assigned#">
<input type="hidden" name="time" value="#read_title_closer.a_time_assigned#">
<input type="hidden" name="user_that_finished" value="#user_that_finished#">
<input type="hidden" name="datecomplete" value="#read_title_closer.a_Date_Completed#">
<input type="hidden" name="timecomplete" value="#read_title_closer.a_Time_Completed#">
<input type="hidden" name="assign" value="#read_assigned_closer.company#">
<input type="hidden" name="phone" value="#read_assigned_closer.phone#">
<input type="hidden" name="ext" value="#read_assigned_closer.ext#">
<input type="hidden" name="fax" value="#read_assigned_closer.fax#">
<input type="hidden" name="sent" value="#read_assigned_closer.pref_for_send#">
<input type="hidden" name="owner" value="#read_title.sfirstname1# #read_title.sminame1# #read_title.slastname1# #read_title.sfirstname2# #read_title.sminame2# #read_title.slastname2# #read_title.sssn1# #read_title.sssn2#">
<input type="hidden" name="purchaser" value="#read_title.bfirstname1# #read_title.bminame1# #read_title.blastname1# #read_title.bfirstname2# #read_title.bminame2# #read_title.blastname2# #read_title.bssn1# #read_title.bssn2#">
<input type="hidden" name="addr" value="#read_title.paddress#">
<input type="hidden" name="city" value="#read_title.pcity#">
<input type="hidden" name="state" value="#read_title.pstate#">
<input type="hidden" name="zip" value="#read_title.pzip#">
<input type="hidden" name="county" value="#read_title.pcounty#">
<!--- <input type="hidden" name="amnt" value="#NumberFormat(read_title.loanamt_float, "999,999,999.99")#">
<input type="hidden" name="est" value="#NumberFormat(read_title.estimate_value, "999,999,999.99")#">
 --->
	<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>	
		<tr>
			<td width=519 colspan=2 align=center valign=top bgcolor=e1e1e1>
				<b>Send this information as an email or fax depending on Vendor's option</b><INPUT type=image src="./images/button_submit.gif" border=0>
			</td>
		</tr></table></cfoutput>
</form>





	
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
			
			
			
			
			
			
			
</BODY>
</HTML>