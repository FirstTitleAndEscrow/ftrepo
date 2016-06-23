<CFPARAM NAME="a_flag" DEFAULT="0">
<cfparam name="abstract_cost" default="">
<cfparam name="instructions" default="">
	
	<cfif #a_flag# eq 1>	
		<SCRIPT LANGUAGE="JavaScript">
		window.alert("You need to assign an abstractor before you can submit this request!")
		</SCRIPT>
	</cfif>
<script type="text/javascript">
	function prodSelect() {
	var frm;
	frm = document.frm;
	{
	frm.reload()
  	}
</script>
<CFQUERY name="get" DATASOURCE="#request.dsn#">
	SELECT *
	FROM Property
	WHERE prop_id = #URL.rec_id#
</CFQUERY>	

<cfquery name="get_file" DATASOURCE="#request.dsn#">
	SELECT abstractor_doc_upload
	FROM  Doc_Abstract_prop
	WHERE prop_id = #get.prop_ID#
</CFQUERY> 

<cfquery name="get_file2" DATASOURCE="#request.dsn#">
	SELECT abstractor_doc_upload2
	FROM  Doc_Abstract_prop
	WHERE prop_id = #get.prop_ID#
</CFQUERY> 

<cfquery name="get_file3" DATASOURCE="#request.dsn#">
	SELECT abstractor_doc_upload3
	FROM  Doc_Abstract_prop
	WHERE prop_id = #get.prop_ID#
</CFQUERY> 

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
	SELECT *
	FROM Property
	WHERE prop_ID = #rec_ID#
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_prop
	WHERE prop_ID = #rec_id#
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_abstractor">
	SELECT *
	FROM Abstractors_sb 
	WHERE abstractor_ID = '#read_title_abstract.abstractor_ID#'
</CFQUERY> 

<CFIF #read_title_abstract.abstractor_ID_2# neq "">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_abstractor_2">
		SELECT *
		FROM Abstractors_sb 
		WHERE abstractor_ID = '#read_title_abstract.abstractor_ID_2#'
	</CFQUERY> 
</CFIF>

<CFIF #read_title_abstract.abstractor_ID_3# neq "">
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_abstractor_3">
		SELECT *
		FROM Abstractors_sb 
		WHERE abstractor_ID = '#read_title_abstract.abstractor_ID_3#'
	</CFQUERY> 
</CFIF>		
		
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_all_abstractors">
	SELECT *
	FROM Abstractors_sb 
	ORDER BY company ASC, lname ASC, fname ASC
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_zip_code">
	SELECT *
	FROM Property
	WHERE pstate = '#read_title.pstate#' AND UPPER(pcounty) = UPPER('#read_title.pcounty#')
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state">
	SELECT *
	FROM Abstractors_county 
	where st_abbrev = '#read_zip_code.pstate#' AND UPPER(ct_name) = UPPER('#read_zip_code.pcounty#')
</CFQUERY>  
		
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_all_abstractors">
	SELECT *
	FROM Abstractors_county_sb a, abstractors b
	where a.st_abbrev = '#read_zip_code.pstate#' AND UPPER(a.ct_name) = UPPER('#read_zip_code.pcounty#') AND a.abstractor_id = b.abstractor_id and b.type = 1
</CFQUERY>
	
<CFIF #read_title_abstract.a_Assigned_by# GT "">
		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ STARTED the Abstract Process        \=== --->
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user_starting">
		SELECT *
		FROM first_admin
		WHERE ID = #read_title_abstract.a_Assigned_by#
	</CFQUERY>		
		
	<CFSET user_that_started = #read_user_starting.fname# & " " & #read_user_starting.lname#>
<CFELSE>
	<CFSET user_that_started = "Not Assigned Yet">
</CFIF>

<CFIF #read_title_abstract.a_Recieved_by# GT "">
	<!--- ===/ Get the name of the person that is  \=== --->
	<!--- ===/ FINISHED the Abstract Process       \=== --->
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user_finished">
		SELECT *
		FROM first_admin
		WHERE ID = #read_title_abstract.a_Recieved_by#
	</CFQUERY>		
		
	<CFSET user_that_finished = #read_user_finished.fname# & " " & #read_user_finished.lname#>
<CFELSE>
	<CFSET user_that_finished = "Not Received Yet">
</CFIF>
			
<CFQUERY DATASOURCE="#request.dsn#" NAME="retrieve_user">
	SELECT *
	FROM user_client_assoc a, first_admin b
	WHERE a.company_id = #get.comp_id# and a.id = b.id and b.position = 'Title Ordering/Tracking'
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=790 align=center valign=top bgcolor=d3d3d3>
			<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">
		</td>
	</tr>
</table>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
			<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<CFOUTPUT>
					<tr>
					<Center>
						<td width=790 align=left valign=top bgcolor=e1e1e1>
							<FONT FACE=ARIAL SIZE=2 color="blue">
							<CENTER><cfif NOT DateDiff("d", Now(), "1/30/2012")>
<B>Abstracts USA<br>30 W. Gude Dr.<br>Rockville, MD. 20850<br><cfelse><B>Abstracts USA<br>7361 Calhoun Place, Suite 200<br>Rockville, MD. 20855<br></cfif>


							<cfif #retrieve_user.recordcount# GT 0>
								Phone: #retrieve_user.phone#<br>Email: #retrieve_user.email#<br>Direct fax: #retrieve_user.fax#
							</cfif>
							</B></Center>
						</TD>
					</TR>		<p>
				</cfoutput>
					<tr>
						<td width=790 align=left valign=top bgcolor=green>
							<FONT FACE=ARIAL SIZE=2 color="white">
							<CENTER><B>PROPERTY INFORMATION ORDER FORM</B></CENTER>
						</TD>
					</TR>
					<tr>
						<td width=790 align=center valign=top bgcolor=e1e1e1>
				<CFOUTPUT>
							<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
								<tr>
									<td width=519 colspan=2 align=center valign=top bgcolor=f3f3f3>
										<font size=3 color=blue face=arial>
										<B>Abstract Form for P-#get.prop_id#</B>
									</td>
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Person that Assigned the Abstractor - 
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=red face=verdana>
										<B>#user_that_started#</B>
									</td>
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Date Started - 
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=red face=verdana>
										<B>#DateFormat(read_title_abstract.a_date_assigned, "mm/dd/yyyy")#</B>
									</td>	
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Time Started - 
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=red face=verdana>
										<B>#TimeFormat(read_title_abstract.a_time_assigned, "HH:mm:ss")#</B>
									</td>
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Person that received the Abstract - 
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=red face=verdana>
										<B>#user_that_finished#</B>
									</td>
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Date Completed - 
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=red face=verdana>
										<B>#DateFormat(read_title_abstract.a_date_completed, "mm/dd/yyyy")#</B>
									</td>
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Time Completed - 
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=red face=verdana>
										<B>#TimeFormat(read_title_abstract.a_time_completed, "HH:mm:ss")#</B>
									</td>
								</tr>
								<tr>
									<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
										<font size=2 color=black face=arial>
										<B>Abstractor Assigned :</B>
									</td>
								</tr>		
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Company -  
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=blue face=verdana>
										<CFIF #read_assigned_abstractor.recordcount# EQ "0">
											Not yet Assigned
										<CFELSE>
											<B>#read_assigned_abstractor.company#</B>
										</CFIF>
									</td>
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Vendor ID -  
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=blue face=verdana>
										<CFIF #read_assigned_abstractor.recordcount# GT "0">
											43204#read_assigned_abstractor.abstractor_id#
										</cfif>
									</td>
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Phone -  
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=blue face=verdana>
										<B>#read_assigned_abstractor.phone#</B>
									</td>
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Ext -  
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=blue face=verdana>
										<B>#read_assigned_abstractor.ext#</B>
									</td>
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Email -  
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=blue face=verdana>
										<B>#read_assigned_abstractor.email#</B>
									</td>
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Fax -  
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=blue face=verdana>
										<B>#read_assigned_abstractor.fax#</B>
									</td>
								</tr>
                                <tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Product Ordered -  
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=blue face=verdana>
										<CFIF #get.search_type# eq "D">
                                            <B>Legal + Vesting</B>
                                        <CFELSEIF #get.search_type# eq "B">
                                            <B>Full Search</B>
                                        <CFELSEIF #get.search_type# eq "B">
                                            <B>Current Owner Search</B>
                                        <CFELSE>
                                            <B>Other</B>        
                                        </CFIF>                                            
									</td>
								</tr>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>
										<font size=2 color=black face=arial>
										Sent by -  
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<font size=2 color=blue face=verdana>
										<B>#read_assigned_abstractor.pref_for_send#</B>
									</td>
								</tr>
								<!---If there is a second abstractor --->
							<CFIF #read_title_abstract.Abstractor_ID_2# neq "">
							<tr>
								<td width=200  align=right valign=top bgcolor=d3d3d3>
									<font size=2 color=black face=arial>
									Abstractor 2 -  
								</td>
								<td width=319  align=left valign=top bgcolor=e1e1e1>
									<font size=2 color=blue face=verdana>
									<B>#read_assigned_abstractor_2.company#</B>
								</td>
							</tr>
							</CFIF>
							<!---If there is a third Abstractor --->
							<CFIF #read_title_abstract.Abstractor_ID_3# neq "">
							<tr>
								<td width=200  align=right valign=top bgcolor=d3d3d3>
									<font size=2 color=black face=arial>
									Abstractor 3 -  
								</td>
								<td width=319  align=left valign=top bgcolor=e1e1e1>
									<font size=2 color=blue face=verdana>
									<B>#read_assigned_abstractor_3.company#</B>
								</td>
							</tr>
							</CFIF>
							<tr>

<CFFORM NAME="frm" ACTION="./prop_abstract_price_assign.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=10&company_id=#url.company_id#" METHOD=POST>
								<tr>
									<td width=200  align=right valign=top bgcolor=d3d3d3>	
										<font size=2 color=black face=arial>
										Abstract Price
									</td>
									<td width=319  align=left valign=top bgcolor=e1e1e1>
										<CFINPUT TYPE="Text" NAME="abstract_cost" onchange="prodSelect()"SIZE=11 MAXLENGTH=15  VALUE=#DollarFormat(read_title_abstract.abstract_cost)#
											REQUIRED="No" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: white; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none;" >  
									
								<input type=image name = "price_Submit" src="./images/button_submit.gif" border=0></td>
								<cfset cost = "abstract_cost">
								</td>
							
							
							</tr>
</CFFORM>
							<tr>
									<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
										<cfif #read_title_abstract.a_Date_Assigned# neq "">
											<font size=2 color=blue face=arial>If this Abstract is to be re-assigned, then
											use the pulldown below to select another to assign to this Abstract.
										<cfelse> 
											<font size=2 color=blue face=arial>Use the list below to assign an abstractor for this this request.
										</cfif>
									</td>
								</tr>		
				</CFOUTPUT>

 <CFFORM NAME="frm" ACTION="./prop_abstract_doc_assign.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=10&company_id=#url.company_id#" METHOD=POST>
								<tr>	
									<td width=130 align=right valign=top bgcolor=e6e6e6>	
										<font size=2 color=black face=arial>
										Abstractors List
									</td>
									<td width=368 align=left valign=top bgcolor=e6e6e6>	
										<SELECT NAME="Abstractor_ID_new" 			
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
                						<CFOUTPUT query ="read_all_abstractors"><OPTION VALUE="#Abstractor_ID#">#company# -- #a_cost#</OPTION></CFOUTPUT>					
										</SELECT>
										<cfif #read_title_abstract.a_Date_Assigned# neq "">
											&nbsp;&nbsp;&nbsp;&nbsp;<input type=image src="./images/button_re-assign.gif" border=0><img src="./images/clear.gif" height=10 width=40>
										<cfelse>
											&nbsp;&nbsp;&nbsp;&nbsp;<input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40>
										</cfif>
										
										<CFIF #read_title_abstract.Abstractor_ID_2# eq "" and #read_title_abstract.Abstractor_ID# neq "">
									<!---New Abstractor is being assigned.  Place the old one in the number two slot --->
										<CFQUERY NAME="GetAbstractor" DATASOURCE="#request.dsn#" >
												Update Doc_Abstract_Prop
												Set Abstractor_ID_2 = #read_title_abstract.Abstractor_ID#, 
												a_date_assigned_2 = '#read_title_abstract.a_date_assigned#',
												a_time_assigned_2 = '#read_title_abstract.a_time_assigned#'
												where Prop_ID = #read_title_abstract.Prop_ID#
											</CFQUERY> 
										</CFIF>
										<CFIF #read_title_abstract.Abstractor_ID_2# neq "">
											<CFQUERY DATASOURCE="#request.dsn#" NAME="GetAbstractor2">
												Update Doc_Abstract_Prop
												Set Abstractor_ID_3 = #read_title_abstract.Abstractor_ID#, 
												a_date_assigned_3 = '#read_title_abstract.a_date_assigned#',
												a_time_assigned_3 = '#read_title_abstract.a_time_assigned#'
												where Prop_ID = #read_title_abstract.Prop_ID#
											</CFQUERY>
										</CFIF> 
									</td>
								</tr>		
							</table>
</CFFORM> 
<cfFORM ACTION="./prop_file_upload.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#url.company_id#" METHOD=POST>
<cfoutput query="get_file">
	<input type="hidden" name="uid" value="#URL.uid#"><input type="hidden" name="rec_id" value="#rec_id#">
							<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
								<tr>
									<td width=520 valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
										<CFIF #abstractor_doc_upload# EQ "">
											Upload file 1
												<input type="hidden" name="title_id" value="#get.prop_id#">
												<input type="submit" value="Upload File">
									</td>
								</tr>
										<CFELSE>
								<tr>
									<td width=520 align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is an uploaded file named: #abstractor_doc_upload#.<br>
										<a href="./prop_delete-uploaded-file.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a>
									</TD>
								</tr>
							</NOBR>	  
										</CFIF>
</cfoutput>   
</cfFORM>

<cfoutput query="get_file2">

<FORM ACTION="./prop_file_upload2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=0&a_trigger=3" METHOD=POST>
									<td width=520 valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
										<CFIF #abstractor_doc_upload2# EQ "">
											Upload file 2
											<input type="hidden" name="title_id" value="#get.prop_id#">
											<input type="submit" value="Upload File">
									</td>
								</tr>
										<CFELSE>
								<tr>
									<td width=520   align=center valign=top bgcolor=f3f3f3>
							<NOBR><font size=2 color=blue face=arial>There is an uploaded file named: #abstractor_doc_upload2#.<br>
							<a href="./prop_delete-uploaded-file2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
										</CFIF>		
</FORM>  
</cfoutput> 
<cfoutput query="get_file3">
<FORM ACTION="./prop_file_upload3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=4&company_id=#url.company_id#" METHOD=POST>
									<td width=520 valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
										<CFIF #abstractor_doc_upload3# EQ "">
											Upload file 3
											<input type="hidden" name="title_id" value="#get.prop_id#">
											<input type="submit" value="Upload File">
									</td>
								</tr>
										<CFELSE>
								<tr>
									<td width=520 align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file named: #abstractor_doc_upload3#.<br>
										<a href="./prop_delete-uploaded-file3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
										</CFIF>		
</FORM>
</cfoutput>  
					

						</table>
<CFOUTPUT>
						<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
							<tr>		
								<td width=200 align=right valign=top bgcolor=f3f3f3>	
									<font size=2 color=black face=arial>
									PRESENT OWNER:
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
									PURCHASER: 
								</td>
								<td width=310 align=left valign=top bgcolor=f3f3f3>	
									<font size=2 color=blue face=arial>
									<B>#read_title.bfirstname1# #read_title.bminame1# #read_title.blastname1#&nbsp;&nbsp;&nbsp;&nbsp;SSN: #read_title.bssn1#
									<cfif #read_title.bhphone1# neq "">
										<br>Phone: #read_title.bhphone1#
									</cfif>
									</B><br>
									<CFIF #READ_TITLE.BLASTNAME2# NEQ "">
										<B>#read_title.bfirstname2# #read_title.bminame2# #read_title.blastname2#&nbsp;&nbsp;&nbsp;&nbsp;SSN: #read_title.bssn2#
										<cfif #read_title.bhphone2# neq "">
											<br>Phone: #read_title.bhphone2#
										</cfif></B>
									</CFIF>
								</td>
							</tr>
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
							</tr>
							<tr>
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

</cfoutput>
<cfoutput>						
<cfform action="prop_abstract_email.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=5&company_id=#url.company_id#">						
						<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
							<tr>
								<td width=519 colspan=2  align=left valign=top bgcolor=f3f3f3>
									<font size=2 color=black face=arial>
									<B>Instructions:</B>
									<p>
								</td>
								<td width=519 colspan=2  align=left valign=top bgcolor=f3f3f3>
								<CFINPUT TYPE="Text" NAME="Instructions" SIZE=80 MAXLENGTH=100  VALUE="#Instructions#"
									REQUIRED="No" 
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: white; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" >  
								
								   <cfif #retrieve_user.recordcount# GT 0>
								    	<li>PLEASE FAX REPORT TO #retrieve_user.fax# OR EMAIL TO <a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a>
									</cfif>
									</UL>
								</td>
							</tr>
						</table>


	<input type="hidden" name="company_id" value="#url.company_id#">
	<input type="hidden" name="uid" value="#URL.uid#">
	<input type="hidden" name="al" value="#URL.al#">
	<input type="hidden" name="rec_id" value="#rec_id#">
	<input type="hidden" name="email" value="#read_assigned_abstractor.email#">
	<input type="hidden" name="fax" value="#read_assigned_abstractor.fax#">
	<input type="hidden" name="user_that_started" value="#user_that_started#">
	<input type="hidden" name="date" value="#read_title_abstract.a_date_assigned#">
	<input type="hidden" name="time" value="#read_title_abstract.a_time_assigned#">
	<input type="hidden" name="user_that_finished" value="#user_that_finished#">
	<input type="hidden" name="datecomplete" value="#read_title_abstract.a_Date_Completed#">
	<input type="hidden" name="timecomplete" value="#read_title_abstract.a_Time_Completed#">
	<input type="hidden" name="assign" value="#read_assigned_abstractor.company#">
	<input type="hidden" name="phone" value="#read_assigned_abstractor.phone#">
	<input type="hidden" name="ext" value="#read_assigned_abstractor.ext#">
	<input type="hidden" name="fax" value="#read_assigned_abstractor.fax#">
	<input type="hidden" name="sent" value="#read_assigned_abstractor.pref_for_send#">
	<input type="hidden" name="owner" value="#read_title.sfirstname1# #read_title.sminame1# #read_title.slastname1# #read_title.sfirstname2# #read_title.sminame2# #read_title.slastname2# #read_title.sssn1# #read_title.sssn2#">
	<input type="hidden" name="purchaser" value="#read_title.bfirstname1# #read_title.bminame1# #read_title.blastname1# #read_title.bfirstname2# #read_title.bminame2# #read_title.blastname2# #read_title.bssn2# #read_title.bssn2#">
	<input type="hidden" name="addr" value="#read_title.paddress#">
	<input type="hidden" name="city" value="#read_title.pcity#">
	<input type="hidden" name="state" value="#read_title.pstate#">
	<input type="hidden" name="zip" value="#read_title.pzip#">
	<input type="hidden" name="county" value="#read_title.pcounty#">
	<input type="hidden" name="est" value="#NumberFormat(read_title.estimate_value, "999,999,999.99")#"> 
					<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>	
						<tr>
							<td width=519 colspan=2 align=center valign=top bgcolor=e1e1e1>
								<b>Send this information as an email or fax depending on Vendor's option</b><INPUT type=image src="./images/button_submit.gif" border=0>
							</td>
						</tr>
					</table></cfform>
</cfoutput>

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