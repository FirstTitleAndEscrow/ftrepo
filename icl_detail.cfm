<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #form.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">
SELECT *
FROM abstractors
WHERE username = '#URLDecode(form.username)#' and password = '#URLDecode(form.password)#'
</CFQUERY>





	<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>

     <CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">

			SELECT *
			FROM Doc_Abstract_Title
			WHERE title_ID = #rec_id#

		</CFQUERY>
     <CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor">

			SELECT *
			FROM Abstractors
			WHERE abstractor_ID = '#read_title_abstract.abstractor_ID#'

		</CFQUERY>

     <CFQUERY datasource="#request.dsn#" NAME="get_underwriter">
			SELECT d.title_id, d.insurance_co, t.company
			FROM Doc_title_insurance_title d, title_companies t
			WHERE d.title_ID = '#rec_ID#'
			and t.title_co_id = d.insurance_co
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">

			SELECT *
			FROM Abstractors
			ORDER BY company ASC, lname ASC, fname ASC

		</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">

			SELECT *
			FROM title
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
				<CENTER><cfif NOT DateDiff("d", Now(), "1/30/2012")>
<B>Abstracts USA<br>30 W. Gude Dr.<br>Rockville, MD. 20850<br><cfelse><B>Abstracts USA<br>7361 Calhoun Place, Suite 200<br>Rockville, MD. 20855<br></cfif>

<cfif #retrieve_user.recordcount# GT 0>Phone: #retrieve_user.phone#<br>Email: #retrieve_user.email#<br>Direct fax: #retrieve_user.fax#</cfif></B></Center>
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
				<B> ORDER NUMBER: #READ_TITLE.TITLE_ID# </B>
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
				<td width=200 align=right valign=top bgcolor=f3f3f3>
						<font size=2 color=black face=arial>
				PRODUCT ORDERED:
				</td>
						<td width=319 align=left valign=top bgcolor=f3f3f3>
							<font size=2 color=blue face=arial>
							<B>#read_title_abstract.product_ordered#</B>
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


</CFOUTPUT>

 <!--- <CFFORM NAME="frm" ACTION="./title_abstract_doc_assign.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" METHOD=POST>

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
                <CFOUTPUT query ="read_all_abstractors"><OPTION VALUE="#Abstractor_ID#">#company#</OPTION></CFOUTPUT>
				</SELECT>


		</td>
	</tr>

		<tr>
			<td width=519 colspan=2  align=right valign=top bgcolor=f3f3f3>
				<NOBR><font size=2 color=blue face=arial>To re-assign this Abstract order request, click on this button...<input type=image src="./images/button_re-assign.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
			</td>
		</tr>


</CFFORM>


<cfFORM ACTION="./file_upload.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#" METHOD=POST>
<cfoutput query="get_file"><input type="hidden" name="uid" value="#URL.uid#"><input type="hidden" name="rec_id" value="#rec_id#">

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #abstractor_doc_upload# EQ "">


	Click here to upload file 1
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#abstractor_doc_upload#). To upload a new file click to delete this one first. &nbsp;<br>
	<a href="./delete-uploaded-file.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>


</CFIF>		</cfoutput>   </cfFORM>


<cfoutput query="get_file2">

<FORM ACTION="./file_upload2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=3&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #abstractor_doc_upload2# EQ "">
	Click here to upload file 2
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#abstractor_doc_upload2#). To upload a new file click to delete this one first. &nbsp;<br>
	<a href="./delete-uploaded-file2.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>


</CFIF>		</FORM>

	</cfoutput>
<cfoutput query="get_file3">

<FORM ACTION="./file_upload3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=4&company_id=#company_ID#" METHOD=POST>

		<tr>
			<td align=center><FONT SIZE=2 FACE=ARIAL>

			<CFIF #abstractor_doc_upload3# EQ "">
	Click here to upload file 3
	<input type="hidden" name="title_id" value="#get.title_id#">
	<input type="submit" value="Upload File"></td>

		</tr>

		<CFELSE>
<tr><td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3><NOBR><font size=2 color=blue face=arial>There is already an uploaded file (#abstractor_doc_upload3#). To upload a new file click to delete this one first. &nbsp;<br>
	<a href="./delete-uploaded-file3.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#" target="New" onClick="window.open('','New','width=450,height=220,left=40,top=40,status=1,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">delete</a></TD></tr></NOBR>


</CFIF>		</FORM></cfoutput>
	 --->

<CFOUTPUT>

	<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>

	<tr>
		<td width=200 align=right valign=top bgcolor=f3f3f3>
			<font size=2 color=black face=arial>
			SELLER(S):


		</td>

		<td width=319 align=left valign=top bgcolor=f3f3f3>
			<font size=2 color=blue face=arial>
				<B>#read_title.sfirstname1# #read_title.sminame1# #read_title.slastname1#</B><br>
				<cfif read_title.slastname2 neq '' and read_title.slastname2 neq 'NULL'>
				<B>#read_title.sfirstname2# #read_title.sminame2# #read_title.slastname2#</B><br>
				</cfif>
				<cfif read_title.slastname3 neq '' and read_title.slastname3 neq 'NULL'>
				<B>#read_title.sfirstname3# #read_title.sminame3# #read_title.slastname3#</B><br>
				</cfif>
				<cfif read_title.slastname4 neq '' and read_title.slastname4 neq 'NULL'>
				<B>#read_title.sfirstname4# #read_title.sminame4# #read_title.slastname4#</B><br>
				</cfif>
		</td>


	</tr>


	<tr>
		<td width=200 align=right valign=top bgcolor=f3f3f3>
			<font size=2 color=black face=arial>
			PURCHASER(S):


		</td>

		<td width=310 align=left valign=top bgcolor=f3f3f3>
			<font size=2 color=blue face=arial>
				<B>#read_title.bfirstname1# #read_title.bminame1# #read_title.blastname1#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_title.bssn1#</B><br>
				<cfif read_title.bfirstname2 neq '' and read_title.bfirstname2 neq 'NULL'>
				<B>#read_title.bfirstname2# #read_title.bminame2# #read_title.blastname2#</B><br>
				</cfif>
				<cfif read_title.bfirstname3 neq '' and read_title.bfirstname3 neq 'NULL'>
				<B>#read_title.bfirstname3# #read_title.bminame3# #read_title.blastname3#</B><br>
				</cfif>
				<cfif read_title.bfirstname4 neq '' and read_title.bfirstname4 neq 'NULL'>
				<B>#read_title.bfirstname4# #read_title.bminame4# #read_title.blastname4#</B><br>
				</cfif>
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

				<tr>
				<td width=200 align=right valign=top bgcolor=f3f3f3>
						<font size=2 color=black face=arial>
				LOAN NUMBER:
				</td>
						<td width=319 align=left valign=top bgcolor=f3f3f3>
							<font size=2 color=blue face=arial>
							<B>#read_title.loan_number#</B>
						</td>
					</tr>
				<tr>
				<td width=200 align=right valign=top bgcolor=f3f3f3>
						<font size=2 color=black face=arial>
				PROPOSED INSURED:
				</td>
						<td width=319 align=left valign=top bgcolor=f3f3f3>
							<font size=2 color=blue face=arial>
							<B>#read_title.insured#</B>
						</td>
					</tr>
				<tr>
				<td width=200 align=right valign=top bgcolor=f3f3f3>
						<font size=2 color=black face=arial>
				ADDRESS:
				</td>
						<td width=319 align=left valign=top bgcolor=f3f3f3>
							<font size=2 color=blue face=arial>
							<B>#read_title.aaddress#<br>#read_title.acity# #read_title.astate# #read_title.azip#</B>
						</td>
					</tr>
				<tr>
				<td width=200 align=right valign=top bgcolor=f3f3f3>
						<font size=2 color=black face=arial>
				UNDERWRITER:
				</td>
						<td width=319 align=left valign=top bgcolor=f3f3f3>
							<font size=2 color=blue face=arial>
							<B>#get_underwriter.company#</B>
						</td>
					</tr>

				<tr>
				<td width=200 align=right valign=top bgcolor=f3f3f3>
						<font size=2 color=black face=arial>
				VIEW OTHER FILES
				</td>
						<td width=319 align=left valign=top bgcolor=f3f3f3>
							<font size=2 color=blue face=arial>
							<B><cfoutput><a href="./title_view_file.cfm?username=#form.username#&password=#form.password#&rec_id=#rec_id#&a_trigger=1&company_id=#read_title.comp_id#" target="_new"><img src="./images/button_view_file.gif" border=0 ALT="Click this button to view file for this order"></a></cfoutput></B>
						</td>
					</tr>



				</table>
				<cfinclude template="/title_vendor_icl_upload.cfm"><br><br><br>
				<p>
<!--- =========================================================== --->


</CFOUTPUT>
<!--- </form>
<cfoutput>
<form action="title_abstract_email.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=5&company_id=#company_ID#">
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
<!--- <input type="hidden" name="amnt" value="#NumberFormat(read_title.loanamt_float, "999,999,999.99")#">
<input type="hidden" name="est" value="#NumberFormat(read_title.estimate_value, "999,999,999.99")#"> --->




		<tr>
			<td width=519 colspan=2 align=center valign=top bgcolor=e1e1e1>
				<b>Send an email with the above info to the person that processed the order</b><INPUT type=image src="./images/button_submit.gif" border=0>
			</td>
		</tr>
</cfoutput>
</form>
 --->





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
