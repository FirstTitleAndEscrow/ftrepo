<CFPARAM NAME="a_flag" DEFAULT="0">
<CFPARAM NAME="url.equator_submit" DEFAULT="0">
<cfparam name="abstract_cost" default="">
<cfparam name="instructions" default="">


<cfif #a_flag# eq 1>	
	<SCRIPT LANGUAGE="JavaScript">
		window.alert("You need to assign a vendor before you can submit this request!")
	</SCRIPT>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_title">
	SELECT *
	FROM Title
	WHERE title_ID = #rec_ID#
</CFQUERY>

<cfif url.equator_submit eq 1>
<cfif read_title.equator_deed_sent eq 1>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "resendDeedAndHud" titleId="#rec_ID#">
<cfsetting enableCFoutputOnly = "no">
<cfelse>
<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.equator"	method = "sendDeedAndHud" titleId="#rec_ID#">
<cfsetting enableCFoutputOnly = "no">
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="set_title">
	update Title
	set equator_deed_sent = 1
	WHERE title_ID = #rec_ID#
</CFQUERY>
</cfif>


<cfif read_title.deed_prep_assigned_by neq 'NULL' and read_title.deed_prep_assigned_by NEQ ''>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
	SELECT *
	FROM First_admin
	WHERE ID = #read_title.deed_prep_assigned_by#
</CFQUERY>
</cfif>
<cfparam name="read_user.fname" default="">
<cfparam name="read_user.lname" default="">




<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor">
	SELECT *
	FROM Abstractors 
	WHERE abstractor_ID = '#read_title.deed_prep_assigned_to#'
</CFQUERY> 



<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
	SELECT *
	FROM Abstractors where type = 7
	ORDER BY company ASC, lname ASC, fname ASC
</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_state">
	SELECT *
	FROM Abstractors_county 
	where st_abbrev = '#read_title.pstate#' AND UPPER(ct_name) = UPPER('#read_title.pcounty#')
</CFQUERY>  
		
<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
	SELECT *
	FROM Abstractors_county a, abstractors b
	where a.st_abbrev = '#read_title.pstate#' AND UPPER(a.ct_name) = UPPER('#read_title.pcounty#') AND a.abstractor_id = b.abstractor_id and b.type = 7
</CFQUERY>
	




<!-- queries complete -->
<cfflush>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<script type="text/javascript">
function result() {
var frm;
frm = document.frm;
if (frm.othermanner.value != 'Other') {

  frm.manner_of_title.value = frm.othermanner.options[frm.othermanner.selectedIndex].value;
}else{

frm.manner_of_title.value = 'Type Tenancy here';
}

}

</script>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=790 align=center valign=top bgcolor=d3d3d3>
			<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
		</td>
	</tr>
</table>
<cfflush>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
			<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
			<CFOUTPUT>
				<tr>
					<Center>
					<td width=790 align=left valign=top bgcolor=e1e1e1>
						<FONT FACE=ARIAL SIZE=2 color="blue">
					<CENTER>
					<B>Deed Preparation Vendor Assignment
					</B>
					</Center>
					</TD>
				</TR><p>
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
									<B>Vendor Assignment Form for T-#read_title.title_id#</B>
								</td>
							</tr>
							<tr>
								<td width=200  align=right valign=top bgcolor=d3d3d3>
									<font size=2 color=black face=arial>
									Person that Assigned the Vendor - 
								</td>
								
								<td width=319  align=left valign=top bgcolor=e1e1e1>
									<font size=2 color=red face=verdana>
									<cfif read_title.deed_prep_assigned_by eq 'NULL' or read_title.deed_prep_assigned_by eq ''>
									<B>Not Yet Assigned</B>
									<cfelse>
									<B>#read_user.fname# #read_user.lname#</B>
									</cfif>
								</td>
								
							</tr>
							<tr>
								<td width=200  align=right valign=top bgcolor=d3d3d3>
									<font size=2 color=black face=arial>
									Date Started - 
								</td>
								<td width=319  align=left valign=top bgcolor=e1e1e1>
									<font size=2 color=red face=verdana>
									<cfif read_title.deed_prep_assigned_date NEQ 'NULL' and read_title.deed_prep_assigned_date NEQ ''>
									<B>#DateFormat(read_title.deed_prep_assigned_date, "mm/dd/yyyy")#</B>
								    </cfif>
								</td>
							</tr>
							<tr>
								<td width=200  align=right valign=top bgcolor=d3d3d3>
									<font size=2 color=black face=arial>
									Time Started - 
								</td>
								<td width=319  align=left valign=top bgcolor=e1e1e1>
									<font size=2 color=red face=verdana>
									<cfif read_title.deed_prep_assigned_date NEQ 'NULL' and read_title.deed_prep_assigned_date NEQ ''>
									<B>#TimeFormat(read_title.deed_prep_assigned_date, "HH:mm:ss")#</B>
									</cfif>
								</td>
							</tr>
							<tr>
								<td width=200  align=right valign=top bgcolor=d3d3d3>
									<font size=2 color=black face=arial>
									Date Completed - 
								</td>
								<td width=319  align=left valign=top bgcolor=e1e1e1>
									<font size=2 color=red face=verdana>
									<cfif read_title.deed_prep_completed NEQ 'NULL' and read_title.deed_prep_completed NEQ ''>
									<B>#DateFormat(read_title.deed_prep_completed, "mm/dd/yyyy")#</B>
									</cfif>
								</td>
							</tr>
							<tr>
								<td width=200  align=right valign=top bgcolor=d3d3d3>
									<font size=2 color=black face=arial>
									Time Completed - 
								</td>
								<td width=319  align=left valign=top bgcolor=e1e1e1>
									<font size=2 color=red face=verdana>
									<cfif read_title.deed_prep_completed NEQ 'NULL' and read_title.deed_prep_completed NEQ ''>
									<B>#TimeFormat(read_title.deed_prep_completed, "HH:mm:ss")#</B>
									</cfif>
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
									Sent by -  
								</td>
								<td width=319  align=left valign=top bgcolor=e1e1e1>
									<font size=2 color=blue face=verdana>
									<B>#read_assigned_abstractor.pref_for_send#</B>
								</td>
							</tr>


							<tr>
								<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
									<cfif #read_title.deed_prep_Assigned_date# neq "" and #read_title.deed_prep_Assigned_date# neq 'NULL'>
										<font size=2 color=blue face=arial>If this Abstract is to be re-assigned, then
										use the pulldown below to select another to assign to this Abstract.
									<cfelse> 
										<font size=2 color=blue face=arial>Use the list below to assign an abstractor for this this request.
									</cfif>
								</td>
							</tr>		
			</CFOUTPUT>
<cfflush>
						<!---End New Section --->
<!--- 			<cfFORM ACTION="./file_upload.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#url.company_id#" METHOD=POST>
			<cfoutput query="get_file">
						<input type="hidden" name="uid" value="#URL.uid#"><input type="hidden" name="rec_id" value="#rec_id#">
						<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
							<tr>
								<td width=520 valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
									<CFIF #abstractor_doc_upload# EQ "">
										Upload file 1
										<input type="hidden" name="title_id" value="#read_title.title_id#">
										<input type="submit" value="Upload File">
								</td>
							</tr>
									<CFELSE>
							<tr>
								<td width=520 align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is an uploaded file named: #abstractor_doc_upload#.<br>
									<a href="./delete-uploaded-file.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
									</CFIF>		
			</cfoutput>   
			</cfFORM>
	
			<cfoutput query="get_file2">
			<FORM ACTION="./file_upload2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=0&a_trigger=3" METHOD=POST>
								<td width=520 valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
									<CFIF #abstractor_doc_upload2# EQ "">
										Upload file 2
										<input type="hidden" name="title_id" value="#read_title.title_id#">
										<input type="submit" value="Upload File"></td>
							</tr>
			<CFELSE>
							<tr>
								<td width=520   align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is an uploaded file named: #abstractor_doc_upload2#.<br>
									<a href="./delete-uploaded-file2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
			</CFIF>		
			</FORM>  
			</cfoutput>
<cfflush>			
<cfset date_of_order = createodbcdate('#read_title.a_month#-#read_title.a_day#-#read_title.a_year#')>
<cfset target_date = createodbcdate('04-10-2007')>
<cfset date_diff = DateDiff("d", date_of_order, target_date)>
<!--- <cfoutput>#date_diff#</cfoutput><cfabort> --->

<cfflush>
<!--- took UTAH out --->
			<cfif #read_title.pstate# eq "AZ" or #read_title.pstate# eq "AK" or #read_title.pstate# eq "OR" or #read_title.pstate# eq "WA" or #read_title.pstate# eq "ID" or #read_title.pstate# eq "WY" or #read_title.pstate# eq "OK" or #read_title.pstate# eq "SD" or #read_title.pstate# eq "NM" or #read_title.pstate# eq "TX" or (#read_title.pstate# eq "CA" and date_diff lte 0)>
			<cfoutput query="get_file3">

			<FORM ACTION="./file_upload3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=4&company_id=#url.company_id#" METHOD=POST>
								<td width=520 valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
									<CFIF #abstractor_doc_upload3# EQ "">
										Commitment Upload
										<input type="hidden" name="title_id" value="#read_title.title_id#">
										<input type="submit" value="Upload File"></td>
							</tr>
									<CFELSE>
							<tr>
								<td width=520 align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file named: #abstractor_doc_upload3#.<br>
									<a href="./delete-uploaded-file3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>	  
									</CFIF>		
			</FORM>
			</cfoutput>  </CFIF>
						</table> --->
			<CFFORM ACTION="./deed_prep_assign.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=10&company_id=#url.company_id#" METHOD=post enctype="multipart/form-data" NAME="frm">
			<CFOUTPUT>
			<input type="hidden" name="rec_id" value="#rec_id#">
						<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>

							<tr>		
								<td width=200 align=right valign=top bgcolor=f3f3f3>	
									<font size=2 color=black face=arial>
									PURCHASER(s): 
								</td>
								<td width=310 align=left valign=top bgcolor=f3f3f3>	
















<table>
<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>
						
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<input type="text" NAME="blastname1" SIZE=11 MAXLENGTH=25 
								VALUE="#read_title.blastname1#"
									
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" > 
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<input type="text" NAME="bfirstname1" SIZE=11 MAXLENGTH=15
								VALUE="#read_title.bfirstname1#"
									
									
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" >  
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Middle&nbsp;Name.<br>
							<input type="text" NAME="bminame1" SIZE=11 MAXLENGTH=15 
									VALUE="#read_title.bminame1#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" > 
						</td>

</tr>
					
		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ SECOND ] \=== --->
		<!--- =================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<input type="text" NAME="blastname2" SIZE=11 MAXLENGTH=25	
									VALUE="#read_title.blastname2#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" > 
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<input type="text" NAME="bfirstname2" SIZE=11 MAXLENGTH=15
									VALUE="#read_title.bfirstname2#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" >  
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Middle&nbsp;Name<br>
							<input type="text" NAME="bminame2" SIZE=11 MAXLENGTH=15
								VALUE="#read_title.bminame2#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" > 
						</td>

</tr>
		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ THIRD ] \=== --->
		<!--- =================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							3.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<input type="text" NAME="blastname3" SIZE=11 MAXLENGTH=25	
									VALUE="#read_title.blastname3#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC;
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" > 
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<input type="text" NAME="bfirstname3" SIZE=11 MAXLENGTH=15
									VALUE="#read_title.bfirstname3#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" >  
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Middle&nbsp;Name<br>
							<input type="text" NAME="bminame3" SIZE=11 MAXLENGTH=15
								VALUE="#read_title.bminame3#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" > 
						</td>
</tr>
					
		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ THIRD ] \=== --->
		<!--- =================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							4.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<input type="text" NAME="blastname4" SIZE=11 MAXLENGTH=25	
									VALUE="#read_title.blastname4#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" > 
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<input type="text" NAME="bfirstname4" SIZE=11 MAXLENGTH=15
									VALUE="#read_title.bfirstname4#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" >  
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Middle&nbsp;Name<br>
							<input type="text" NAME="bminame4" SIZE=11 MAXLENGTH=15
								VALUE="#read_title.bminame4#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" > 
						</td>
					</tr>
					
					
										<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Company<br>
							<input type="text" NAME="company1" SIZE=15 MAXLENGTH=25	
									VALUE="#read_title.company1#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" > 
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Tax ID<br>
							<input type="text" NAME="taxid1" SIZE=11 MAXLENGTH=15
									VALUE="#read_title.taxid1#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color: ##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" >  
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>&nbsp;
							 
						</td>
					</tr>
					</table>



</td>
							</tr>
							<tr>		
								<td width=200 align=right valign=top bgcolor=f3f3f3>	
									<font size=2 color=black face=arial>
									PURCHASE PRICE: <em>(consideration amount)</em> 
								</td>
								<td width=310 align=left valign=top bgcolor=f3f3f3>	
									<font size=2 color=blue face=arial>
									<input type="text" size="25" name="purchase_price" value="#read_title.purchase#" style="background-color:##CCCCCC;">
								</td>
							</tr>
		<!--- =========================================================== --->
							<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<font size=2 color=black face=arial>
									TENANCY
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<select name="othermanner" onchange="result();"
											size="1" 
											style="font-size: 10; 
											font-family: verdana; 
											font-style: normal; 
											color: 003F1E; 
											background-color: ##CCCCCC; 
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


											<OPTION VALUE=""></OPTION>
<OPTION VALUE="Sole Owner" <cfif read_title.manner_of_title eq 'Sole Owner'>selected</cfif>>Sole Owner</OPTION>

<OPTION VALUE="Joint Tenants with common law rights of survivorship" <cfif read_title.manner_of_title eq 'Joint Tenants with common law rights of survivorship'>selected</cfif>>Joint Tenants with common law rights of survivorship</OPTION>

<OPTION VALUE="Tenants in Common" <cfif read_title.manner_of_title eq 'Tenants in Common'>selected</cfif>>Tenants in Common</OPTION>

<OPTION VALUE="Tenants by the Entirety with common law rights of survivorship" <cfif read_title.manner_of_title eq 'Tenants by the Entirety with common law rights of survivorship'>selected</cfif>>Tenants by the Entirety with common law rights of survivorship</OPTION>

        <OPTION VALUE="Other">Other </OPTION>
										</select>   <BR>
<font size=-1><em>Select here, or type in "Other" box below</em></font></td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<font size=2 color=black face=arial>
									(OTHER) 
						</td>
						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<INPUT type="text" NAME="manner_of_title" SIZE=40 MAXLENGTH=120 VALUE="#read_title.manner_of_title#"
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color:##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" >  
						</td>
					</tr>
					
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<font size=2 color=black face=arial>
									MISCELLANEOUS INFO 
						</td>
						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<textarea NAME="deed_prep_misc" cols="40" rows="5" 
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color:##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" >#read_title.deed_prep_misc#</textarea> 
						</td>
					</tr>
					
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<font size=2 color=black face=arial>
									UPLOAD FILE TO VENDOR 
						</td>
						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<INPUT type="file" NAME="file_upload" SIZE=40 MAXLENGTH=120 
									style="font-size: 9; 
									font-family: verdana; 
									font-style: normal; 
									color: 003F1E; 
									background-color:##CCCCCC; 
									border-color: white; 
									border-left-width: thin; 
									border-right-width: thin; 
									border-top-width: thin; 
									border-bottom-width: thin; 
									border-width: thin; 
									border-style: bar; 
									clear: none;" > 
						<cfif read_title.deed_prep_upload neq '' and read_title.deed_prep_upload neq 'NULL'>
						<BR><font size=2 color=black face=arial>#read_title.deed_prep_upload# uploaded&nbsp;&nbsp;&nbsp;<a href="uploads/#read_title.deed_prep_upload#" target="new">view</a>&nbsp;|&nbsp;<a href="deed_prep_assign.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&delete_file=Yes">delete</a>.</font>
						</cfif>
						</td>
					</tr>
							<tr>		
								<td width=130 align=right valign=top bgcolor=ffffff>	
									<font size=2 color=black face=arial>
									Deed Preparation Vendors List
								</td>
								<td width=368 align=left valign=top bgcolor=ffffff>	
									<SELECT NAME="Abstractor_ID_new" 			
										size="1" 
										style="font-size: 9; 
										font-family: verdana; 
										font-style: normal; 
										color: blue; 
										background-color:CCCCCC; 
										border-color: e1e1e1; 
										border-left-width: thin; 
										border-right-width: thin; 
										border-top-width: thin; 
										border-bottom-width: thin; 
										border-width: thin; 
										border-style: bar; 
										clear: none; 
										float: none;
										width: 150;">
									<OPTION VALUE="NONE" SELECTED></OPTION>
                					<CFloop query ="read_all_abstractors">
									<OPTION VALUE="#Abstractor_ID#" <cfif read_title.deed_prep_assigned_to eq Abstractor_id>selected</cfif>>#company# -- #a_cost#</OPTION>
									</CFloop>					
									</SELECT></td>
			</tr>	


							<tr>		
								<td width=130 align=right valign=top bgcolor=ffffff>	
									<font size=2 color=black face=arial>
									Uploaded Deed
								</td>
								<td width=368 align=left valign=top bgcolor=ffffff>	
<cfif read_title.deed_prep_completed neq '' and read_title.deed_prep_completed neq 'NULL' and read_title.deed_prep_vendor_upload neq '' and read_title.deed_prep_vendor_upload neq 'NULL'><a href="#fileSys.FindFilePath('#read_title.deed_prep_vendor_upload#', 'url')#" target="new">#read_title.deed_prep_vendor_upload#</a><br>
<br>
<a href="#cgi.SCRIPT_NAME#?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=10&company_id=#url.company_id#&equator_submit=1"><img src="./images/submit_deed_equator.gif" border=0></a><cfelse> None</cfif>
</td>
			</tr>	
			
										<tr>		
								<td width=130 align=right valign=top bgcolor=e6e6e6>&nbsp;	
									
								</td>
								<td width=368 align=left valign=top bgcolor=e6e6e6>	
									
			<cfif #read_title.deed_prep_Assigned_date# neq "">
				&nbsp;&nbsp;&nbsp;&nbsp;
									<input type=image src="./images/button_re-assign.gif" border=0><img src="./images/clear.gif" height=10 width=40>
									
									


			<cfelse>	
			
														
				&nbsp;&nbsp;&nbsp;&nbsp;<input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40>
			</cfif>
			</tr>			
						</table>
<!--- =========================================================== --->				
						
			</CFOUTPUT>
			</cfform>
			<cfflush>

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
<cfflush>