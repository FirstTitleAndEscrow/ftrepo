


<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM Property
WHERE prop_id = #URL.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">
SELECT *
FROM abstractors
WHERE username = '#URLDecode(url.username)#' and password = '#URLDecode(url.password)#'
</CFQUERY>



<cfquery name="get_updates" datasource="#request.dsn#">
SELECT *
FROM  Abstractor_Uploads
WHERE order_id = #get.prop_ID# order by upload_date desc
</CFQUERY> 





	<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#

		</CFQUERY>

<cfquery name="get_file4" datasource="#request.dsn#">
	SELECT abstractor_invoice
	FROM  Doc_Abstract_prop
	WHERE prop_id = #read_title.prop_ID#
</CFQUERY>

     <CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">

			SELECT *
			FROM Doc_Abstract_prop
			WHERE prop_ID = #rec_id#

		</CFQUERY>
     <CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor">

			SELECT *
			FROM Abstractors
			WHERE abstractor_ID = '#read_title_abstract.abstractor_ID#'

		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">

			SELECT *
			FROM Abstractors
			ORDER BY company ASC, lname ASC, fname ASC

		</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">

			SELECT *
			FROM property
			WHERE pstate = '#read_title.pstate#' AND UPPER(pcounty) = UPPER('#read_title.pcounty#')

		</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_state">

			SELECT *
			FROM Abstractors_county
			where st_abbrev = '#read_zip_code.pstate#' AND UPPER(ct_name) = UPPER('#read_zip_code.pcounty#')


		</CFQUERY>

		   <CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">

			SELECT *
			FROM Abstractors_county
			where st_abbrev = '#read_state.st_abbrev#' AND UPPER(ct_name) = UPPER('#read_state.ct_name#')


		</CFQUERY>






<CFIF #read_title_abstract.a_Assigned_by# GT "">


		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ STARTED the Abstract Process        \=== --->

		<CFQUERY datasource="#request.dsn#" NAME="read_user_starting">

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

		<CFQUERY datasource="#request.dsn#" NAME="read_user_finished">

			SELECT *
			FROM first_admin
			WHERE ID = #read_title_abstract.a_Recieved_by#

		</CFQUERY>

		<CFSET user_that_finished = #read_user_finished.fname# & " " & #read_user_finished.lname#>

<CFELSE>
		<CFSET user_that_finished = "Not Received Yet">
</CFIF>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
		<CFINCLUDE TEMPLATE="./includes/title_top_navp.cfm">
		</td>
		</tr>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

		<CFQUERY datasource="#request.dsn#" NAME="retrieve_user">

			SELECT *
			FROM user_client_assoc a, first_admin b
			WHERE a.company_id = #get.comp_id# and a.id = b.id and b.position = 'Title Ordering/Tracking'
		</CFQUERY>

<CFOUTPUT>

	<tr>
			<Center><td width=790 align=left valign=top bgcolor=e1e1e1>
				<FONT FACE=ARIAL SIZE=2 color="blue">
				<CENTER><B>Abstracts USA<cfif NOT DateDiff("d", Now(), "1/30/2012")><br>30 W. Gude Dr.<br>Rockville, MD. 20850<br><cfelse><br>7361 Calhoun Place<br>Rockville, MD. 20855<br></cfif><cfif #retrieve_user.recordcount# GT 0>Phone: #retrieve_user.phone#<br>Email: #retrieve_user.email#<br>Direct fax: #retrieve_user.fax#</cfif></B></Center>
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






<!--- =================================== --->
<!--- =================================== --->



<CFOUTPUT>


<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>

<!-- -->
		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=d3d3d3>
				<font size=2 color=red face=arial>
				<B> ORDER NUMBER: #READ_TITLE.prop_ID# </B>
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
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Assigned
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_abstract.a_date_assigned#</B>
			</td>
		</tr>
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Price -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_assigned_abstractor.a_cost#</B>
			</td>
		</tr>

		<cfloop query="get_file4">
<FORM ACTION="./prop_file_upload4.cfm?al=1&rec_id=#rec_id#&a_trigger=4&company_id=0" METHOD=POST>
									<td colspan="2" valign=top align=center bgcolor="d3d3d3" ><FONT SIZE=2 FACE=ARIAL>
										<CFIF #abstractor_invoice# EQ "">
											Abstractor Invoice
											<input type="hidden" name="title_id" value="#get.prop_id#">
											<input type="submit" value="Upload File">
									</td>
								</tr>
										<CFELSE>
								<tr>
									<td colspan="2" align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file named: <A href="#fileSys.FindFilePath('#abstractor_invoice#', 'url')#" target="_new">#abstractor_invoice#</A>.<br>
										<a href="./prop_delete-uploaded-invoice.cfm?al=1&rec_id=#rec_id#&company_id=0" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>
										</CFIF>
</FORM>
</cfloop>


</CFOUTPUT>


<CFOUTPUT>

	<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>

<FORM ACTION="./prop_file_updates.cfm?rec_id=<cfoutput>#rec_id#&company_id=#company_ID#</cfoutput>" METHOD=POST>

		<tr>
			<td width=200 align=right valign=top bgcolor=f3f3f3>
			
<font size=2 color=black face=arial>			
	CURRENT UPDATES:
		</td>

		<td width=200 align=left valign=top bgcolor=f3f3f3>
<font size=2 color=blue face=arial>
	<CFIF get_updates.recordcount>
<br>
<cfloop query="get_updates">
<A HREF="#fileSys.FindFilePath('#get_updates.filename#', 'url')#" target="new">#get_updates.filename#</a> <cfif get_updates.changes eq 1>(contains changes)</cfif><br>
</cfloop>
<!--- <cfoutput query="get_updates">
<A HREF="#fileSys.FindFilePath('#get_updates.filename#', 'url')#" target="new">#get_updates.filename#</a> <cfif get_updates.changes eq 1>(contains changes)</cfif><br>
</cfoutput>
 ---><br>
<cfelse>
None
</CFIF>
		</tr>
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
				<B>#read_title.bfirstname1# #read_title.bminame1# #read_title.blastname1#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_title.bssn1#</B><br>
				<B>#read_title.bfirstname2# #read_title.bminame2# #read_title.blastname2#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_title.bssn2#</B>
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

<CFQUERY DATASOURCE="#request.dsn#" NAME="lookup_assignment">
Select assignment_upload from Vendor_Tracker_New
where assignment_upload is not NULL
and order_id = '#read_title.prop_id#'
and order_type = 'P'
</cfquery>
<cfif lookup_assignment.recordcount gte 1>
<tr>
				<td width=200 align=right valign=top bgcolor=f3f3f3>
						<font size=2 color=black face=arial>
				ASSIGNMENT UPLOAD:
				</td>
						<td width=319 align=left valign=top bgcolor=f3f3f3>
							<font size=2 color=blue face=arial>
							<B><A HREF="#fileSys.FindFilePath('#lookup_assignment.assignment_upload#', 'url')#" target="new">#lookup_assignment.assignment_upload#</a></B>
						</td>
					</tr>
</cfif>				
				</table>

				<p>
<!--- =========================================================== --->
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=elelel>
		<tr>
			<td width=790 align=left valign=top bgcolor=ELELEL>


				<center><b>**PLEASE E-MAIL CONFIRMATION OF RECEIPT TO <cfif #retrieve_user.recordcount# GT 0> <a href="mailto:#retrieve_user.email#">#retrieve_user.email#</a>OR FAX TO #retrieve_user.fax#</cfif>**</b></center><br>
				1. Copy(s) of the Vesting deed and all other conveyances recorded (if any) since the property was conveyed to the present owner.<br>
2. Copy(s) of the first , second and last pages only of any open mortgages or deeds of trust that are filed from the last deed of record forward, including legal
description and a copy of the last assignment. <br>
3. The tax assessed value and parcel/tax ID number.<br>
4. If you see any JUDGMENTS and/or TAX LIENS, please attach copies or e-mail.<br><p>
5. You may login at our site (<a href="https://#cgi.server_name#">First Title</a>) to enter all of the title data.
We at First Title appreciate the urgent manner in which you handle our orders and would like to thank you for all of your assistance.<br>
<center> <cfif #retrieve_user.recordcount# GT 0>#retrieve_user.fname#&nbsp;&nbsp;&nbsp;#retrieve_user.phone#</cfif> <br>
<b>** Documents can be e-mailed to <a href="mailto:vendormgr@firsttitleservices.com">vendormgr@firsttitleservices.com</a> or sent via fax at 301-315-8161</b></center><br>
<br>
If, for any reason, you you cannot process this order, please fill out the information and click on the "reject" button, to have this file removed from your queue.<br>
<br>
<center>
<cfset order_type = ''>
<cfif read_title_abstract.abstractor_id_3 eq read_abstractor.abstractor_id>
<cfset order_type = 'prop_typing'>
<cfelseif read_title_abstract.abstractor_ID eq read_abstractor.abstractor_id>
<cfset order_type = 'prop_abstract'>
<cfelse>
<CFQUERY name="get_tax" datasource="#request.dsn#">
SELECT *
FROM doc_abstract_prop
WHERE abstractor_tax_id = #read_abstractor.abstractor_id#
and prop_id = #rec_id#
</CFQUERY>
<cfif get_tax.recordcount gte 1>
<cfset order_type = 'prop_taxes'>
</cfif>


</cfif>
<table with="400">
<tr><td><form action="vendor_reject_file.cfm" method="post">
<input type="hidden" name="rec_id" value="#rec_id#">
Reason for rejecting this order.<br>
<textarea cols="50" rows="5" name="rejection_reason"></textarea><BR>
<input type="submit" name="submit" value="Reject">
<input type="hidden" name="query_string" value="#cgi.QUERY_STRING#">
<input type="hidden" name="ordertype" value="#order_type#">
<input type="hidden" name="username" value="#url.username#">
<input type="hidden" name="password" value="#url.password#">
</form></td></tr>
</table>
</center>

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












<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</HTML>