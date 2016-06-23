<CFPARAM NAME="a_flag" DEFAULT="0">
<cfparam name="abstract_cost" default="">
<cfparam name="instructions" default="">

<cfif #a_flag# eq 1>
	<SCRIPT LANGUAGE="JavaScript">
		window.alert("You need to assign an abstractor before you can submit this request!")
	</SCRIPT>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
	SELECT *
	FROM Title
	WHERE title_ID = #rec_ID#
</CFQUERY>


<cfquery DATASOURCE="#request.dsn#" name="get_file" >
	SELECT abstractor_doc_upload
	FROM  Doc_Abstract_Title
	WHERE title_id = #read_title.title_ID#
</CFQUERY>

<cfquery DATASOURCE="#request.dsn#" name="get_file2" >
	SELECT abstractor_doc_upload2
	FROM  Doc_Abstract_Title
	WHERE title_id = #read_title.title_ID#
</CFQUERY>


<cfquery DATASOURCE="#request.dsn#" name="get_file4" >
	SELECT abstractor_doc_upload4
	FROM  Doc_Abstract_Title
	WHERE title_id = #read_title.title_ID#
</CFQUERY>
<cfquery DATASOURCE="#request.dsn#" name="get_file5" >
	SELECT abstractor_doc_upload5
	FROM  Doc_Abstract_Title
	WHERE title_id = #read_title.title_ID#
</CFQUERY>
<cfquery DATASOURCE="#request.dsn#" name="get_file6" >
	SELECT abstractor_doc_upload6
	FROM  Doc_Abstract_Title
	WHERE title_id = #read_title.title_ID#
</CFQUERY>

<cfquery name="get_file3" DATASOURCE="#request.dsn#">
	SELECT abstractor_doc_upload3
	FROM  Doc_Abstract_Title
	WHERE title_id = #read_title.title_ID#
</CFQUERY>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_Title
	WHERE title_ID = #rec_id#
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
	FROM Abstractors_sb where type = 1
	and username IN (select username from vendors_stacie_sb where status =1)
	ORDER BY company ASC, lname ASC, fname ASC
</CFQUERY>



<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state">
	SELECT *
	FROM Abstractors_county_sb
	where st_abbrev = '#read_title.pstate#' AND UPPER(ct_name) = UPPER('#read_title.pcounty#')
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_all_abstractors">
	SELECT *
	FROM Abstractors_county_sb a, abstractors_sb b
	where a.st_abbrev = '#read_title.pstate#' AND UPPER(a.ct_name) = UPPER('#read_title.pcounty#') AND a.abstractor_id = b.abstractor_id and b.type = 1
	and b.username IN (select username from vendors_stacie_sb where status =1)
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

<!--- <CFIF #read_title_abstract.a_Recieved_by# GT ""> --->

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
	WHERE a.company_id = #read_title.comp_id# and a.id = b.id and b.position = 'Title Ordering/Tracking'
</CFQUERY>


<!-- queries complete -->
<cfflush>


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
					<table>
					<tr>
					<td width=75% ><FONT FACE=ARIAL SIZE=2 color="blue">
					<CENTER>
					<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<B>Abstracts USA<br>30 W. Gude Dr.<br>Rockville, MD. 20850<br><cfelse><B>Abstracts USA<br>7361 Calhoun Place, Suite 200<br>Rockville, MD. 20855<br></cfif>


					<cfif #retrieve_user.recordcount# GT 0>
					Phone: #retrieve_user.phone#<br>Email: #retrieve_user.email#<br>Direct fax: #retrieve_user.fax#
					</cfif>
					</B>
					</Center></td>
					<cfif session.ft_user_id eq 417 or session.ft_user_id eq 240 or  session.ft_user_id eq 434>
					<td width=25% ><FONT FACE=ARIAL SIZE=2 color="blue">
					<CENTER>
					<B><font size=-1><a href="previous_abstracts_lookup.cfm?prop_add1=#ListGetAt(read_title.paddress, 1, " ")#&prop_add2=#ListGetAt(read_title.paddress, 2, " ")#&state=#read_title.pstate#&zip=#read_title.pzip#&title_id=#read_title.title_id#&uid=#URL.uid#&al=#URL.al#" target="_props_window">Look up previous Abstracts for this Property by clicking here</a></font></B>
					</Center></td>
					</cfif>
					</tr>
					</table>

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
									<B>Abstract Form for T-#read_title.title_id#</B>
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
<cfflush>
<CFFORM NAME="frm" ACTION="./title_abstract_doc_assign.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=10&company_id=#url.company_id#" METHOD=POST>
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
                					<CFOUTPUT query ="read_all_abstractors">
									<OPTION VALUE="#Abstractor_ID#">#company# -- #a_cost#</OPTION>
									</CFOUTPUT>
									</SELECT>

									<br>
<font size=1 color=black face=arial>
<input type="radio" name="Product_ordered" value="Bring to Date" style="font-size: 9;
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
										float: none;">&nbsp; Bring to Date&nbsp;&nbsp;&nbsp;<input type="text" name="bring_to_date" style="font-size: 9;
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
										float: none;" size=10>&nbsp; 'xx/xx/xxxx'<br>
<input type="radio" name="Product_ordered" value="Full Search" style="font-size: 9;
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
										float: none;">&nbsp; Full Search<br>
<input type="radio" name="Product_ordered" value="Current Owner Search with 24 month chain of title"style="font-size: 9;
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
										float: none;">&nbsp; Current Owner Search with 24 month chain of title<br>
<input type="radio" name="Product_ordered" value="20 year search"style="font-size: 9;
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
										float: none;">&nbsp; 20 year search<br>
<input type="radio" name="Product_ordered" value="Two Owner Search"style="font-size: 9;
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
										float: none;">&nbsp; Two Owner Search<br></font>
<font size=2 color=black face=arial><input type="checkbox" name="title_update" value="Yes">&nbsp;Title Update Only

<br>
<font size=2 color=black face=arial><input type="checkbox" name="taxes_from_search" value="Yes">&nbsp;Complete Taxes from Search</font>
			<cfoutput>
			<table width=100% cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
							<tr>
								<td align=left valign=top bgcolor=f3f3f3>
									<font size=2 color=black face=arial>
									Instructions:
									<p>
								</td>
								<td align=left valign=top bgcolor=f3f3f3>
								<textarea name="instructions" cols="25" rows="4">#Instructions#</textarea>

								</td>
							</tr>
							<TR>
								<td>
								   <cfif #retrieve_user.recordcount# GT 0>
								   		<li>PLEASE FAX REPORT TO #retrieve_user.fax# OR EMAIL TO
										<a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a>
									</cfif>
									</UL>
								</td>
							</tr>
						</table>
				<!---input type="hidden" name="est" value="#NumberFormat(read_title.estimate_value, "999,999,999.99")#"> --->
						<table width=100% cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
							<tr>
								<td align=center valign=top bgcolor=e1e1e1>
									<b><font size=2>Send this information as an email or fax depending on Vendor's option</font></b>
								</td>
							</tr>
						</table>
			</cfoutput>
<BR>
			<cfif #read_title_abstract.a_Date_Assigned# neq "">
				&nbsp;&nbsp;&nbsp;&nbsp;
									<input type=image src="./images/button_re-assign.gif" border=0><img src="./images/clear.gif" height=10 width=40>


									<CFIF #read_title_abstract.Abstractor_ID_2# eq "">
									<!---New Abstractor is being assigned.  Place the old one in the number two slot --->
											<CFQUERY DATASOURCE="#request.dsn#" NAME="GetAbstractor">
											Update Doc_Abstract_Title
											Set Abstractor_ID_2 = #read_title_abstract.Abstractor_ID#,
											a_date_assigned_2 = '#read_title_abstract.a_date_assigned#',
											a_time_assigned_2 = '#read_title_abstract.a_time_assigned#'
											where Abs_Doc_ID = #read_title_abstract.Abs_Doc_ID#
											</CFQUERY>
									</CFIF>
									<CFIF #read_title_abstract.Abstractor_ID_2# neq "">
											<CFQUERY DATASOURCE="#request.dsn#" NAME="GetAbstractor">
											Update Doc_Abstract_Title
											Set Abstractor_ID_3 = #read_title_abstract.Abstractor_ID#,
											a_date_assigned_3 = '#read_title_abstract.a_date_assigned#',
											a_time_assigned_3 = '#read_title_abstract.a_time_assigned#'
											where Abs_Doc_ID = #read_title_abstract.Abs_Doc_ID#
											</CFQUERY>
									</CFIF>

			<cfelse>


				&nbsp;&nbsp;&nbsp;&nbsp;<input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40>
			</cfif>

</font></td>
			</tr>


			</CFFORM>
			<!---New section--->
<cfflush>
<!--- 						<CFFORM NAME="frm" ACTION="https://#cgi.server_name#/admin_area/title_abstract_price_assign.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=10&company_id=#url.company_id#" METHOD=POST>
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
				 --->
						<!---End New Section --->
			<cfFORM ACTION="./file_upload.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#url.company_id#" METHOD=POST>
			<cfoutput query="get_file">
						<input type="hidden" name="uid" value="#URL.uid#"><input type="hidden" name="rec_id" value="#rec_id#">
						<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
							<tr>
								<td width=520 valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
									<CFIF #abstractor_doc_upload# EQ "">
										Abstract Upload
										<input type="hidden" name="title_id" value="#read_title.title_id#">
										<input type="submit" value="Upload File">
								</td>
							</tr>
									<CFELSE>
							<tr>
								<td width=520 align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is an uploaded file named: <A href="../admin_area/uploads/#abstractor_doc_upload#" target="_new">#abstractor_doc_upload#</A>.<br>
									<a href="./delete-uploaded-file.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>
									</CFIF>
			</cfoutput>
			</cfFORM>

			<cfoutput query="get_file2">
			<FORM ACTION="./file_upload2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=0&a_trigger=3" METHOD=POST>
								<td width=520 valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
									<CFIF #abstractor_doc_upload2# EQ "">
										Update ##1
										<input type="hidden" name="title_id" value="#read_title.title_id#">
										<input type="submit" value="Upload File"></td>
							</tr>
			<CFELSE>
							<tr>
								<td width=520   align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is an uploaded file named: <A href="../admin_area/uploads/#abstractor_doc_upload2#" target="_new">#abstractor_doc_upload2#</A>.<br>
									<a href="./delete-uploaded-file2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>
			</CFIF>
			</FORM>
			</cfoutput>
<cfflush>


<cfoutput query="get_file4">
			<FORM ACTION="./file_upload4.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=0&a_trigger=3" METHOD=POST>
								<td width=520 valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
									<CFIF #abstractor_doc_upload4# EQ "">
										Update ##2
										<input type="hidden" name="title_id" value="#read_title.title_id#">
										<input type="submit" value="Upload File"></td>
							</tr>
			<CFELSE>
							<tr>
								<td width=520   align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is an uploaded file named: <A href="../admin_area/uploads/#abstractor_doc_upload4#" target="_new">#abstractor_doc_upload4#</A>.<br>
									<a href="./delete-uploaded-file4.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>
			</CFIF>
			</FORM>
			</cfoutput>
<cfflush>





<cfoutput query="get_file5">
			<FORM ACTION="./file_upload5.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=0&a_trigger=3" METHOD=POST>
								<td width=520 valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
									<CFIF #abstractor_doc_upload5# EQ "">
										Update ##3
										<input type="hidden" name="title_id" value="#read_title.title_id#">
										<input type="submit" value="Upload File"></td>
							</tr>
			<CFELSE>
							<tr>
								<td width=520   align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is an uploaded file named: <A href="../admin_area/uploads/#abstractor_doc_upload5#" target="_new">#abstractor_doc_upload5#</A>.<br>
									<a href="./delete-uploaded-file5.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>
			</CFIF>
			</FORM>
			</cfoutput>
<cfflush>





<cfoutput query="get_file6">
			<FORM ACTION="./file_upload6.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=0&a_trigger=3" METHOD=POST>
								<td width=520 valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
									<CFIF #abstractor_doc_upload6# EQ "">
										Update ##4
										<input type="hidden" name="title_id" value="#read_title.title_id#">
										<input type="submit" value="Upload File"></td>
							</tr>
			<CFELSE>
							<tr>
								<td width=520   align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is an uploaded file named: <A href="../admin_area/uploads/#abstractor_doc_upload6#" target="_new">#abstractor_doc_upload6#</A>.<br>
									<a href="./delete-uploaded-file6.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>
			</CFIF>
			</FORM>
			</cfoutput>
<cfflush>




<cfset date_of_order = createodbcdate('#read_title.a_month#-#read_title.a_day#-#read_title.a_year#')>
<cfset target_date = createodbcdate('04-10-2007')>
<cfset date_diff = DateDiff("d", date_of_order, target_date)>
<!--- <cfoutput>#date_diff#</cfoutput><cfabort> --->

<cfflush>
<!--- when you change this, also change it on.....admin_area/title_commitment.cfm  --->
<!--- took UTAH out --->
			<cfif #read_title.pstate# eq "AK" or #read_title.pstate# eq "NV" or #read_title.pstate# eq "OR" or #read_title.pstate# eq "NM" or #read_title.pstate# eq "CT" or #read_title.pstate# eq "WA" or #read_title.pstate# eq "ID" or #read_title.pstate# eq "WY" or #read_title.pstate# eq "UT" or #read_title.pstate# eq "OK" or #read_title.pstate# eq "SD" or #read_title.pstate# eq "NM" or #read_title.pstate# eq "TX" or #read_title.pstate# eq "HI" or #read_title.pstate# eq "CA" or (#read_title.pstate# eq "CA" and date_diff lte 0)>
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
								<td width=520 align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file named: <A href="/uploads/#abstractor_doc_upload3#" target="_new">#abstractor_doc_upload3#</A>.<br>
									<a href="./delete-uploaded-file3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#url.company_id#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>
									</CFIF>
			</FORM>
			</cfoutput>  </CFIF>
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
										</cfif>
										</B>
										</CFIF>
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
<!--- =========================================================== --->

			</CFOUTPUT>
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