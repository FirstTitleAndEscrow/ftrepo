<CFPARAM NAME="a_trigger" DEFAULT=0>
<CFPARAM NAME="a_flag" DEFAULT=0>

<CFIF IsDefined("url.uid") is True>
<cfset uid = #url.uid#>
<cfelse>
<cfset uid = 79>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="get">
	SELECT *
	FROM title
	Where title_id = #URL.rec_ID#
</CFQUERY>
<CFIF IsDefined("url.al") is True>
<cfset al = #url.al#>
<cfelse>
<cfset al = 0>
</cfif>
<CFIF IsDefined("comp_id") is True>
<cfset comp_id = #comp_id#>
<cfelse>
<cfset comp_id = #get.comp_id#>
</cfif>


<CFIF IsDefined("user_id_1") is True>
<cfset user_id_1 = #user_id_1#>
<cfelse>
<cfset user_id_1 = #get.user_id#>
</cfif>

<CFIF IsDefined("username") is True>
<cfset username = #username#>
<cfelse>
<cfset username = "">
</cfif>



<CFIF IsDefined("password") is True>
<cfset password = #password#>
<cfelse>
<cfset password = "">
</cfif>


<CFIF IsDefined("lo_id") is True>
<cfset lo_id = #lo_id#>
<cfelse>
<cfset lo_id = #get.loan_off_id#>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_role">
	select * from first_admin

			WHERE ID = #session.ft_user_id#
</CFQUERY>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND=""  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
<CENTER>
<CENTER>



<cfif #get.pstate# eq "AK" or #get.pstate# eq "OR" or #get.pstate# eq "WA" or #get.pstate# eq "ID" or #get.pstate# eq "WY" or #get.pstate# eq "OK" or #get.pstate# eq "SD" or #get.pstate# eq "NM" or #get.pstate# eq "TX">

	<CFQUERY datasource="#request.dsn#" NAME="inserted_commit">
		select abstractor_doc_upload3 from Doc_Abstract_Title
		WHERE title_id = #URL.rec_ID#
	</cfquery>

	<CFQUERY datasource="#request.dsn#" NAME="read_com">
			select * from Doc_Title_Insurance_Title
			WHERE title_id = #url.rec_ID#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
			select * from first_admin
			WHERE id = '#read_com.a_recieved_by#'
</cfquery>

<cfif #inserted_commit.abstractor_doc_upload3# NEQ "">
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=elelel>
	<CFIF #read_role.role_id# neq "">
		<tr>
			<td><CFIF IsDefined("url.uid") is True and #username# eq "">
				<CFINCLUDE TEMPLATE="./includes/menu_header.cfm">

				</cfif>
			</td>
		</tr>
	</CFIF>
	<tr>
		<td width=790 align=center valign=top>
			<CFIF IsDefined("url.uid") is True and #username# eq "">
			<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">



</cfif>
	<CFIF IsDefined("url.uid") is True and #username# eq "">
			<table width="99%" cellpadding=1 cellspacing=1 border=0 >


				<tr>

					<td width="98%" align=center valign=middle bgcolor=d1d1d1>
					<br><br>
					<b><font face=verdana size=2 color=black>View/Mark as sent <cfoutput><a href="./vendor_abstract_view_data.cfm?uid=#uid#&al=#al#&rec_id=#rec_ID#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Title Insurance Commitment</font></a> </cfoutput></font></b>
	</td>

				</tr>
				<tr>

					<td width="98%" align=center valign=middle bgcolor=d1d1d1>
					<br>
					<cfif #read_com.s_status# eq 1>
					<b><font face=verdana size=2 color=red>Title Commitment is marked as sent </b></font><cfoutput><b><font face=verdana size=2 color=blue>#DateFormat(read_com.a_recieved_date, "dd-mm-yyyy")# at #TimeFormat(read_com.a_recieved_time, "HH:mm:ss")# by #read_user.fname# #read_user.lname#<font></b></cfoutput>
					<cfelse><b><font face=verdana size=2 color=blue>Title Commitment is NOT YET marked as sent</font></b></cfif>
	</td>

				</tr>
</table>


</cfif>

<cfelse>
			<table width="99%" cellpadding=1 cellspacing=1 border=0 >
				<tr>

					<td width="98%" align=center valign=middle bgcolor=d1d1d1>
						<p><br>
						<font face=verdana size=2 color=red>
						<b>The Commitment for this order has not yet been uploaded by the typing department. To do so you first need to upload the commitment file by using the last "upload" button under "abstract" page and then come back to this page </b><br></p>
					</td>

				</tr>
</table>

</cfif>





</td>
</tr>

	</table>


			</TD>
		</TR>

	</table>



<cfelse>





<cfquery name="get_adata" datasource="#request.dsn#">
	select * from title_ins_add where title_id = #url.rec_id#
</cfquery>


<cfif #get_adata.recordcount# GT "0">
	<cfif #a_trigger# eq 2>
		<!---Typing is finished because the merge button has been clicked --->
			<CFQUERY datasource="#request.dsn#" >
					UPDATE tblUser_Roles
					SET Typing_End_Datetime = GetDate()
					WHERE  title_id = #URL.rec_id#
			</CFQUERY>
			<!---Set Clear to Close Person --->
			<CFINCLUDE template="./includes/cleartoclose.cfm">

			<CFQUERY datasource="#request.dsn#" >
					UPDATE tblUser_Roles
					Set CleartoClose_ID = 264,
					cleartoclose_start_Datetime = GetDate()
					WHERE  title_id = #URL.rec_id#
			</CFQUERY>
<!--- 			<CFQUERY datasource="#request.dsn#" >
					UPDATE tblUser_Roles
					Set CleartoClose_ID = #ctc#,
					cleartoclose_start_Datetime = GetDate()
					WHERE  title_id = #URL.rec_id#
			</CFQUERY>
 --->
			<CFQUERY datasource="#request.dsn#" name="get_user">
					Select fname,lname,email from First_Admin
					WHERE  id = #ctc#
			</CFQUERY>


<!--- <cfif get_user.email neq "lbusch@firsttitleservices.com" and get_user.email neq "jfrank@streamline-title.com">
<CFMAIL
			TO="#get_user.email#"
			FROM="webmaster@firsttitleservices.com"
			SERVER="127.0.0.1"
			Subject="Clear To Close"
			TIMEOUT="600"
			type="HTML"
			>

T-#URL.rec_id# was just merged by typing.  File will be assigned to #get_user.fname# #get_user.lname#


</cfmail>
</cfif>
 ---><CFSET todayDate = #Now()#>

<!---
<cfquery  datasource="#request.dsn#">
	INSERT INTO
				TITLE_NOTES (fname,lname,n_date,n_time,order_id,n_note,note_type,status)
				Values ('System','Web','#DateFormat(todayDate, "mm/dd/yyyy")#','#TimeFormat(todayDate, "hh:mm:sstt")#','#URL.rec_id#','Clear to close will be done by #get_user.fname# #get_user.lname#','T','1')
</CFQUERY>
--->


		<CFIF IsDefined("form.selectedDeed") is True>
		<cfloop index="this_num" list="#form.selectedDeed#" delimiters=",">
 				<CFQUERY datasource="#request.dsn#" >
					UPDATE title_ins_view
					SET
					selectedOrgs = null
					WHERE  title_id = #URL.rec_id# and type = 'DATA'
				</CFQUERY>
				<CFQUERY datasource="#request.dsn#" >
					UPDATE title_ins_view
					SET selectedOrgs = #this_num#
					WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = #this_num#
				</CFQUERY>
UPDATE title_ins_view<br>
SET selectedOrgs = #this_num#<br>
WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = #this_num#<br><br>

				<CFQUERY datasource="#request.dsn#" name="get">
					Select * from Doc_Amer_Pioneer_Ins_ALL_Title
					WHERE  title_id = #URL.rec_id#
				</CFQUERY>
			 	<cfif #get.recordcount# gt 0>
		 			<CFQUERY datasource="#request.dsn#" >
						UPDATE Doc_Amer_Pioneer_Ins_ALL_Title
						SET deed_status = null
						WHERE  title_id = #URL.rec_id#
					</CFQUERY>
				</cfif>
				</cfloop>
			</cfif>

		<CFIF IsDefined("form.selectedLien") is True>
		<cfloop index="this_num" list="#form.selectedLien#" delimiters=",">
 				<CFQUERY datasource="#request.dsn#" >
					UPDATE title_ins_view
					SET
					selectedOrgs3 = #this_num#
					WHERE  title_id = #URL.rec_id#
					and type = 'Lien' and seq_num = #this_num#
				</CFQUERY>
UPDATE title_ins_view<br>
SET <br>
selectedOrgs3 = #this_num#<br>
WHERE  title_id = #URL.rec_id# <br>
and type = 'Lien' and seq_num = #this_num#<br>
<br>


				<CFQUERY datasource="#request.dsn#" name="get">
					Select * from Doc_Amer_Pioneer_Ins_ALL_Title
					WHERE  title_id = #URL.rec_id#
				</CFQUERY>

				<cfif #get.recordcount# gt 0>
		 			<CFQUERY datasource="#request.dsn#" >
						UPDATE Doc_Amer_Pioneer_Ins_ALL_Title
						SET status11 = null
						WHERE  title_id = #URL.rec_id#
					</CFQUERY>
				</cfif>
				</cfloop>
			</cfif>

		<CFIF IsDefined("form.selectedMortgage") is True>
		<cfloop index="this_num" list="#form.selectedMortgage#" delimiters=",">
 				<CFQUERY datasource="#request.dsn#" >
					UPDATE title_ins_view
					SET
					selectedOrgs4 = #this_num#
					WHERE  title_id = #URL.rec_id# and
					type = 'Mortgage' and seq_num = #this_num#
				</CFQUERY>
UPDATE title_ins_view<br>
SET <br>
selectedOrgs4 = #this_num#<br>
WHERE  title_id = #URL.rec_id# and <br>
type = 'Mortgage' and seq_num = #this_num#<br>
<br>


				<CFQUERY datasource="#request.dsn#" name="get">
					Select *
					from Doc_Amer_Pioneer_Ins_ALL_Title
					WHERE  title_id = #URL.rec_id#
				</CFQUERY>
				<cfif #get.recordcount# gt 0>
		 			<CFQUERY datasource="#request.dsn#" >
						UPDATE Doc_Amer_Pioneer_Ins_ALL_Title
						SET status = null
						WHERE  title_id = #URL.rec_id#
					</CFQUERY>
				</cfif>
				</cfloop>
			</cfif>

<CFABORT>
</cfif>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=elelel>
	<CFIF #read_role.role_id# neq "">
		<tr>
			<td><CFIF IsDefined("url.uid") is True and #username# eq "">
				<CFINCLUDE TEMPLATE="./includes/menu_header.cfm">	</cfif>
			</td>
		</tr>
	</CFIF>
	<tr>
		<td width=790 align=center valign=top><CFIF IsDefined("url.uid") is True and #username# eq "">
			<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">

			</cfif>
			<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<tr>
					<td width=790 align=left valign=top bgcolor=green>
						<FONT FACE=ARIAL SIZE=2 color="white">
						<CENTER><B>Abstractor Data Information</B></CENTER>
					</TD>
				</TR>
				<tr>
					<td width=790 align=center valign=top bgcolor=e1e1e1>

<CFFORM name = "frm" METHOD=POST ACTION="https://#cgi.server_name#/admin_area/title_committment2.cfm?uid=#uid#&al=#al#&rec_id=#url.rec_id#&a_trigger=2&comp_id=#comp_id#&username=#username#&password=#password#&a_flag=1&company_id=0">



	<CFQUERY datasource="#request.dsn#" NAME="read_DEED">
		SELECT *
		FROM title_ins_add
		Where title_Id = #URL.rec_id# and type = 'DATA'
		order by seq_num
	</CFQUERY>

	<cfif #read_deed.recordcount# GT 0>
			<CFOUTPUT QUERY="read_deed">
						<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
							<tr>
								<td width=255 align=left valign=top bgcolor=e1e1e1>
									<table width=255 cellpadding=1 cellspacing=1 border=0 >
										<tr>
											<td width=65 align=center valign=middle bgcolor=d1d1d1>
												<font face=verdana size=1 color=blue>
												<b>#insert_Date#</b>
											</td>
											<td width=65 align=center valign=middle bgcolor=d1d1d1>
												<font face=verdana size=1 color=blue>
												<b>#insert_Time#</b>
											</td>
										<tr>
									</table>
								<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
									<a href="abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Deed #seq_num#</font></a>
		<cfelse>
									<a href="abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Deed #seq_num#</font></a>
		</cfif>
								</td>
								<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE="#seq_num#">
 									<FONT FACE=verdana SIZE=1 color="black">   Select to merge DEED #seq_num#<br>
								</td>
							</tr>
						</table>
				</CFOUTPUT>
	</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage">
	SELECT *
	FROM title_ins_add
	Where title_Id = #URL.rec_id# and type = 'MORTGAGE'
	order by seq_num
</CFQUERY>

<cfif #read_mortgage.recordcount# GT 0>
		<CFOUTPUT QUERY="read_mortgage">
					<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
						<tr>
							<td width=255 align=left valign=top bgcolor=e1e1e1>
								<table width=255 cellpadding=1 cellspacing=1 border=0 >
									<tr>
										<td width=65 align=center valign=middle bgcolor=d1d1d1>
											<font face=verdana size=1 color=blue>
											<b>#insert_Date#</b>
										</td>
										<td width=65 align=center valign=middle bgcolor=d1d1d1>
											<font face=verdana size=1 color=blue>
											<b>#insert_Time#</b>
										</td>
									<tr>
								</table>
							<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
								<a href="abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage #seq_num#</font></a>
		<cfelse>
								<a href="abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage #seq_num#</font></a>
		</cfif>
							</td>
							<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE="#seq_num#">
 								<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE #seq_num#<br>
							</td>
						</tr>
					</table>
		</CFOUTPUT>
	</cfif>




<CFQUERY datasource="#request.dsn#" NAME="read_LIEN">
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN'
				order by seq_num

</CFQUERY>


<cfif #read_LIEN.recordcount# GT 0>


<CFOUTPUT QUERY="read_LIEN">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="abstractor_add_LIEN_view.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien #seq_num#</font></a>
			<cfelse>
			<a href="abstractor_add_LIEN_view.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Original Lien #seq_num#</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE="#seq_num#">
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN #seq_num#<br>
		</td>
	</tr>
</table>


		</CFOUTPUT>

	</cfif>





			</td>
		</tr>
</table>

<!--- <nobr><input type="button" name="CheckAll" value="Check All"
onClick="checkAll(document.frm.selectedDeed)">
<input type="button" name="UnCheckAll" value="Uncheck All"
onClick="uncheckAll(document.frm.selectedDeed)"></nobr>
--->
<br>
Click this button to merge <cfoutput><INPUT TYPE=IMAGE SRC="https://#cgi.server_name#/admin_area/images/button_merge.gif" border=0></cfoutput>
</cfform>

<cfif #a_trigger# eq 2>

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>

		 <CFQUERY datasource="#request.dsn#" >

			UPDATE title_ins_add
			SET
			insert_date = '#c_date#',
			insert_time = '#c_time#',
			complete = 1
			WHERE  title_id = #URL.rec_id#
		</CFQUERY>
		<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			 <CFQUERY datasource="#request.dsn#" >

			UPDATE Doc_Title_Insurance_Title
			SET
			merge_date = '#c_date#',
			b_dateandtime = '#order_date_adj#',
			merge_time = '#c_time#'
			WHERE  title_id = #URL.rec_id#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_user">

			select * from first_admin

			WHERE ID = #session.ft_user_id#

		</CFQUERY>

		<CFIF #username# neq "" and #a_flag# eq 1>

		<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Vendor', 'Vendor', #URL.rec_id#, 'Binder Completed - Title in review', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
		<cfelse>

				<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Binder Completed - Title in review', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>

		</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="read_em">

			select * from Doc_Title_Insurance_Title
			WHERE title_id = #URL.rec_id# and merge_date is null

		</CFQUERY>
		<cfif #read_em.recordcount# GT 0>
		<CFMAIL
TO="titlereview@firsttitleservices.com"
FROM="binders@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="File #rec_id# -- Ready for title review"
TIMEOUT="600"
type="HTML"
>

File link attached. Click <a href="title_order_label.cfm?uid=#uid#&al=1&rec_id=#rec_id#&a_trigger=1&company_id=100" target="new">Order #rec_id#</a> to view </B></font><br><br>

First Title staff
</cfmail>
	</cfif>

<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>

<b><font face=verdana size=2 color=blue>All selected item(s) were successfully merged to Title Commitment!</font></b><br>
</td>
</tr>
</table>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent">
				SELECT *
				FROM title_ins_view
				Where title_Id = #URL.rec_id# and type = 'DATA' and selectedOrgs is not null

</CFQUERY>
<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>

<b><font face=verdana size=2 color=black>Merged data is shown below (if any).</b><br>

</td>
</tr>

<cfif #read_sent.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="abstractor_add_deed_view.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Deed submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>


	<a href="abstractor_admin_deed_modify2.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
	<a href="abstractor_add_deed_delete.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>

		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 is not null
			order by selectedOrgs4, seq_num
			</cfquery>

<cfif #read_sent_mortgage.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="abstractor_add_mortgage_view.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Mortgage #selectedOrgs4# submitted</font></a>

			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="abstractor_admin_mortgage_modify2.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;

		<a href="abstractor_add_mortgage_delete.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>




		<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 is not null
			order by selectedOrgs3, seq_num
			</cfquery>


<cfif #read_sent_lien.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_lien">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>


			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>
					</td>

				<tr>


			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<a href="abstractor_add_lien_view.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Lien #selectedOrgs3# submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		<a href="abstractor_admin_lien_modify2.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&selectedOrgs4=#selectedOrgs4#&username=#username#&password=#password#&company_id=0"><font size=1 color=red face=verdana><b>Modify</b></font></a>
	&nbsp;&nbsp;
		<a href="abstractor_add_lien_delete.cfm?uid=#uid#&al=#al#&rec_id=#title_id#&seq_num=#seq_num#&selectedOrgs3=#selectedOrgs3#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana><b>Delete</b></font></a>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_com">
			select * from Doc_Title_Insurance_Title
			WHERE title_id = #url.rec_ID#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
			select * from first_admin
			WHERE id = '#read_com.a_recieved_by#'
</cfquery>

<CFIF IsDefined("url.uid") is True and #username# eq "">

			<table width="99%" cellpadding=1 cellspacing=1 border=0 >
				<tr>

					<td width="98%" align=center valign=middle bgcolor=d1d1d1>
					<br><br>
					<b><font face=verdana size=2 color=black>View/Mark as sent <cfoutput><a href="https://#cgi.server_name#/admin_area/vendor_abstract_view_data.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&username=#username#&password=#password#&company_id=0"><font size=1 color=blue face=verdana>Title Insurance Commitment</font></a> </cfoutput></font></b>
	</td>

				</tr>
				<tr>

					<td width="98%" align=center valign=middle bgcolor=d1d1d1>
					<br>
					<cfif #read_com.s_status# eq 1>
					<b><font face=verdana size=2 color=red>Title Commitment is marked as sent </b></font><cfoutput><b><font face=verdana size=2 color=blue>#DateFormat(read_com.a_recieved_date, "dd-mm-yyyy")# at #TimeFormat(read_com.a_recieved_time, "HH:mm:ss")# by #read_user.fname# #read_user.lname#<font></b></cfoutput>
					<cfelse><b><font face=verdana size=2 color=blue>Title Commitment is NOT YET marked as sent</font></b></cfif>
	</td>

				</tr>
</table>



	</cfif>
<cfelse>
			<table width="99%" cellpadding=1 cellspacing=1 border=0 >
				<tr>

					<td width="98%" align=center valign=middle bgcolor=d1d1d1>
						<p><br>
						<font face=verdana size=2 color=red>
						<b>Binder for this order has not yet been prepared. To do so you first need to upload an abstract file under "abstract" button and then go to the view area of that file where the "Binder Preparation Form" is located </b><br></p>
					</td>

				</tr>
</table>

</cfif>
</td>
</tr>

	</table></cfif>


			</TD>
		</TR>

	</table>




</BODY>
</HTML>


<CFIF #username# neq "" and #a_flag# eq 1>

<CFLOCATION URL="https://#cgi.server_name#/title_vendor_data_form2.cfm?username=#url.username#&password=#url.password#&rec_id=#url.rec_id#&a_trig=1">

</cfif>