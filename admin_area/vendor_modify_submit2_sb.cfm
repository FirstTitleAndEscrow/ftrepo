<cfparam name="form.COMPANY" default="">
<cfparam name="form.TSS_ID" default="">
<cfparam name="form.USERNAME" default="">
<cfparam name="form.PASSWORD" default="">
<cfparam name="form.FNAME" default="">
<cfparam name="form.LNAME" default="">
<cfparam name="form.PHONE" default="">
<cfparam name="form.FAX" default="">
<cfparam name="form.CELL" default="">
<cfparam name="form.PAGER" default="">
<cfparam name="form.EMAIL" default="">
<cfparam name="form.ADDR1" default="">
<cfparam name="form.ADDR2" default="">
<cfparam name="form.A_NOTE_1" default="">
<cfparam name="form.CITY" default="">
<cfparam name="form.STATE" default="">
<cfparam name="form.ZIP_CODE" default="">
<cfparam name="form.taxid" default="">
<cfparam name="form.w9" default="">
<cfparam name="form.SERVICE_TYPE" default="">
<cfparam name="form.A_COMMENTS" default="">
<cfparam name="form.A_COST" default="">
<cfparam name="form.PREF_FOR_SEND" default="">
<cfparam name="form.status" default="0">

<cfparam name="form.e_and_o_cert" default="">
<cfparam name="form.e_and_o_policy_num" default="">
<cfparam name="form.e_and_o_carrier" default="">
<cfparam name="form.e_and_o_expiration" default="">


<cfparam name="url.vendor_id" default="">
<cfparam name="url.delete_cert" default="0">
<cfparam name="url.delete_w9" default="0">



<cfif url.delete_cert eq 0 AND url.delete_w9 EQ 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="update_entry">
UPDATE VENDORS_STACIE_sb
SET
COMPANY = '#form.COMPANY#',
TSS_ID = '#form.TSS_ID#',
USERNAME = '#form.USERNAME#',
PASSWORD = '#form.PASSWORD#',
FNAME = '#form.FNAME#',
LNAME = '#form.LNAME#',
PHONE = '#form.PHONE#',
FAX = '#form.FAX#',
CELL = '#form.CELL#',
PAGER = '#form.PAGER#',
EMAIL = '#form.EMAIL#',
ADDR1 = '#form.ADDR1#',
ADDR2 = '#form.ADDR2#',
A_NOTE_1 = '#form.A_NOTE_1#',
CITY = '#form.CITY#',
STATE = '#form.STATE#',
ZIP_CODE = '#form.ZIP_CODE#',
SERVICE_TYPE = '#form.SERVICE_TYPE#',
A_COMMENTS = '#form.A_COMMENTS#',
PREF_FOR_SEND = '#form.PREF_FOR_SEND#',
e_and_o_policy_num = '#form.e_and_o_policy_num#',
e_and_o_carrier = '#form.e_and_o_carrier#',
taxid = '#taxID#',
a_cost = '#a_cost#',
status = '#status#',
<cfif IsDate(form.e_and_o_expiration) and form.e_and_o_expiration neq 'NULL'>
e_and_o_expiration = '#DateFormat(form.e_and_o_expiration, "m/d/yyyy")#'
<cfelse>
e_and_o_expiration = NULL
</cfif>
Where vendor_id = '#url.vendor_id#'
</cfquery>
</cfif>

<cfif form.e_and_o_cert neq ''>
<CFFILE 			
DESTINATION="#request.uploadsDir#"
ACTION="UPLOAD"
NAMECONFLICT="MAKEUNIQUE"
FILEFIELD="e_and_o_cert">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
update VENDORS_STACIE_sb set e_and_o_cert = '#new_file_name#'
Where vendor_id = '#url.vendor_id#'
</cfquery> 
</cfif>

<cfif form.w9 neq ''>
<CFFILE 			
DESTINATION="#request.uploadsDir#"
ACTION="UPLOAD"
NAMECONFLICT="MAKEUNIQUE"
FILEFIELD="w9">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
update VENDORS_STACIE_sb set w9 = '#new_file_name#'
Where vendor_id = '#url.vendor_id#'
</cfquery> 
</cfif>


<cfif url.delete_cert neq '0'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
update VENDORS_STACIE_sb set e_and_o_cert = NULL,
e_and_o_expiration = NULL
Where vendor_id = '#url.vendor_id#'
</cfquery>
<cfif fileExists("#request.uploadsDir##url.filename#")>
<cffile action="delete" file="#request.uploadsDir##url.filename#">
</cfif>
</cfif>

<cfif url.delete_w9 neq '0'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
update VENDORS_STACIE_sb set w9 = NULL
Where vendor_id = '#url.vendor_id#'
</cfquery>
<cffile action="delete" file="#request.uploadsDir##url.w9filename#">
</cfif>


<cfif listFindNoCase(form.service_type,"Abstract") OR listFindNoCase(form.service_type,"TaxPrep") OR listFindNoCase(form.service_type,"ICL") OR listFindNoCase(form.service_type,"Payoff") OR listFindNoCase(form.service_type,"DeedPrep")>
			<CFQUERY DATASOURCE="#request.dsn#" name="check">
				select * from abstractors_sb where
				username = '#form.username#' and password = '#form.password#'
			</cfquery>
			<cfif not check.recordcount>
				<cfloop list="#form.service_type#" index="service">
					<cfset vtype = "">
					<cfif service EQ "Abstract">
						<cfset vtype = 1>
					<cfelseif service EQ "TaxPrep">
						<cfset vtype = 4>
					<cfelseif service EQ "ICL">
						<cfset vtype = 5>
					<cfelseif service EQ "Payoff">
						<cfset vtype = 6>
					<cfelseif service EQ "DeedPrep">
						<cfset vtype = 7>
					</cfif>	
					<cfif Len(vtype)>
						<CFQUERY DATASOURCE="#request.dsn#" >
							INSERT INTO Abstractors_sb (type, tss_id, company, username, password, fname, lname, phone, cell, pager, fax, addr1, addr2, city, state, zip_code, email, pref_for_send,a_comments, insert_time, insert_date)
							VALUES(#vtype#, '#tss_id#', '#company#', '#username#', '#password#', '#fname#',  '#lname#', '#phone#', '#cell#', '#pager#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip_code#', '#email#',  '#pref_for_send#', '#a_comments#', '#c_time#', '#c_date#')
						</CFQUERY>
					</cfif>
				</cfloop>
			<cfelse>
			
			
			<cfloop query="check">
				<CFQUERY DATASOURCE="#request.dsn#" >
					UPDATE Abstractors_sb 
					SET tss_id = '#tss_id#',
					company = '#company#',
					username = '#username#',
					password = '#password#',
					fname = '#fname#', 
					lname = '#lname#', 
					phone = '#phone#',
					cell = '#cell#',
					pager = '#pager#',
					fax  = '#fax#',
					email  = '#email#',
					addr1 = '#addr1#', 
					addr2 = '#addr2#',
					city  = '#city#',
					state = '#state#',
					zip_code = '#zip_code#', 
					a_comments = '#a_comments#',
					pref_for_send = '#pref_for_send#',
					status = '#status#'
					WHERE Abstractor_ID = #check.Abstractor_ID#
				</CFQUERY>
			</cfloop>
			
			
			
			</cfif>
			
		
		</cfif>
		
		<cfif listFindNoCase(form.service_type,"Appraisal")>
			<CFQUERY DATASOURCE="#request.dsn#" NAME="check_abs">
				SELECT *
				FROM Appraisers_sb
				WHERE Company = '#form.company#' AND lname = '#form.lname#' AND fname = '#form.fname#'
			</CFQUERY>
			<cfif not check_abs.recordcount>
				<CFQUERY DATASOURCE="#request.dsn#" >	
					INSERT INTO Appraisers_sb (tss_id, company, fname, lname, phone, fax, addr1, addr2, city, state, zip_code, email, pref_for_send, insert_time, insert_date, a_comments)
					VALUES('#tss_id#', '#company#', '#fname#',  '#lname#', '#phone#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip_code#', '#email#', '#pref_for_send#', '#c_time#', '#c_date#', '#a_comments#')
				</CFQUERY>
			<cfelse>
				<CFQUERY DATASOURCE="#request.dsn#" >
					UPDATE Appraisers_sb
					SET tss_id = '#tss_id#',
					company = '#company#',
					fname = '#fname#', 
					lname = '#lname#', 
					phone = '#phone#',
					email  = '#email#',
					addr1 = '#addr1#', 
					addr2 = '#addr2#',
					city  = '#city#',
					state = '#state#',
					zip_code = '#zip_code#', 
					a_comments = '#a_comments#',
					pref_for_send = '#pref_for_send#'
					WHERE Appraiser_ID = #check_abs.Appraiser_ID#
				</CFQUERY>
			</cfif>
		</cfif>
		
		<cfif listFindNoCase(form.service_type,"Closer")>
			<CFQUERY DATASOURCE="#request.dsn#" NAME="check_closer">
					SELECT *
					FROM Closer_sb
					WHERE username = '#form.username#'
					and password = '#form.password#'
			</CFQUERY>
			<cfif not check_closer.recordcount>
				<CFQUERY DATASOURCE="#request.dsn#" >
					INSERT INTO Closer_sb (tss_id, company, username, password, fname, lname, phone, cell, pager, fax, addr1, addr2, city, state, zip_code, email, pref_for_send, a_comments, insert_time, insert_date)
					VALUES('#tss_id#', '#company#', '#username#', '#password#', '#fname#',  '#lname#', '#phone#', '#cell#', '#pager#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip_code#', '#email#',  '#pref_for_send#','#a_comments#', '#c_time#', '#c_date#')
				</CFQUERY>
			<cfelse>

				<CFQUERY DATASOURCE="#request.dsn#" >
					UPDATE Closer_sb
					SET tss_id = '#tss_id#',
					company = '#company#',
					username = '#username#',
					password = '#password#',
					fname = '#fname#', 
					lname = '#lname#', 
					phone = '#phone#',
					cell = '#cell#',
					pager = '#pager#',
					fax  = '#fax#',
					email  = '#email#',
					addr1 = '#addr1#', 
					addr2 = '#addr2#',
					city  = '#city#',
					state = '#state#',
					zip_code = '#zip_code#', 
					a_comments = '#a_comments#',
					pref_for_send = '#pref_for_send#',
					status = '#status#'
					WHERE Closer_ID = #check_closer.Closer_ID#
				</CFQUERY>
			</cfif>
		</cfif>



<cflocation url="vendor_modify2_sb.cfm?vendor_id=#url.vendor_id#&updated=1" addtoken="no">