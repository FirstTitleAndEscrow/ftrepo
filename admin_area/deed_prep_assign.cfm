



<cfparam name="form.file_upload" default="">
<cfparam name="form.ABSTRACTOR_ID_NEW" default="NONE">
<cfparam name="url.delete_file" default="no">

<CFQUERY datasource="#request.dsn#" NAME="check_title">
select * from title where title_id = #url.REC_ID#
</CFQUERY>


<cfif url.delete_file eq 'Yes'>
<CFFILE
ACTION="delete" file="c:\uploads\#check_title.deed_prep_upload#">
<CFQUERY datasource="#request.dsn#" NAME="update_title">
Update title
set deed_prep_upload = NULL
where title_id = #url.REC_ID#
</cfquery>
<cflocation url="./deed_prep.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
</cfif>

<cfif form.file_upload neq ''>
<CFFILE
ACTION="upload" 			
DESTINATION="c:\uploads\"
FILEFIELD="file_upload"
NAMECONFLICT="makeunique">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<cfset upload_file_name = #new_file_name#>
<cfelse>
<cfset upload_file_name = ''>
</cfif>





			
<CFQUERY datasource="#request.dsn#" NAME="update_title">
Update title
set
BFIRSTNAME1='#form.BFIRSTNAME1#',
BFIRSTNAME2='#form.BFIRSTNAME2#',
BFIRSTNAME3='#form.BFIRSTNAME3#',
BFIRSTNAME4='#form.BFIRSTNAME4#',
BLASTNAME1='#form.BLASTNAME1#',
BLASTNAME2='#form.BLASTNAME2#',
BLASTNAME3='#form.BLASTNAME3#',
BLASTNAME4='#form.BLASTNAME4#',
BMINAME1='#form.BMINAME1#',
BMINAME2='#form.BMINAME2#',
BMINAME3='#form.BMINAME3#',
BMINAME4='#form.BMINAME4#',
COMPANY1='#form.COMPANY1#',
TAXID1='#form.TAXID1#',
MANNER_OF_TITLE='#form.manner_of_title#',
PURCHASE='#form.PURCHASE_PRICE#',
deed_prep_misc='#form.deed_prep_misc#',
deed_prep_assigned_by='#session.ft_user_id#',
deed_prep_COMPLETED=null,
<cfif form.abstractor_id_new neq 'NONE'>
deed_prep_assigned_to='#form.ABSTRACTOR_ID_NEW#',
</cfif>
<cfif form.file_upload neq ''>
deed_prep_upload='#upload_file_name#',
</cfif>
deed_prep_assigned_date=#CreateODBCDateTime(Now())#
where title_id = #form.REC_ID#
</cfquery>


<cfif check_title.purchase neq form.purchase_price>
<cfset update_this_title_id = form.REC_ID>
<cfinclude template="../rick_tests/update_hud_fee_calc.cfm">
</cfif>

<cfif form.ABSTRACTOR_ID_NEW neq check_title.deed_prep_assigned_to and form.ABSTRACTOR_ID_NEW neq 'NONE'>
<CFQUERY datasource="#request.dsn#" NAME="read_abs">
select * from abstractors where abstractor_id = #form.ABSTRACTOR_ID_NEW#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title">
select * from title where title_id = #url.REC_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368		
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#		
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="vendor_tracker">	
		Insert into Vendor_Tracker (Vendor_id, Order_id, order_type, assign_date, assigned_by, vendor_type, task)
		values
		(#form.ABSTRACTOR_ID_NEW#, #read_title.title_id#, 'T', #createODBCDateTime(Now())#, #uid#, 'deedprep', 'Deed Preparation')
</CFQUERY>	

<CFQUERY datasource="#request.dsn#" NAME="get_company_city">	
		select mi_employee, mo_employee, mi_flushing_employee, va_employee, tx_employee, ft_fairfax_employee
		from First_Admin where ID = #get_comp.intSales#
</CFQUERY>


<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "ST" >
<cfset comp_name = "Streamline Title">
<cfelseif get_company_city.mi_employee eq 'True'>
<cfset account = "03" >
<cfset prefix = "MI" >
<cfset comp_name = "First Title">
<cfelseif get_company_city.mo_employee eq 'True'>
<cfset account = "08" >
<cfset prefix = "MO" >
<cfset comp_name = "First Title">
<cfelseif get_company_city.mi_flushing_employee eq 'True'>
<cfset account = "07" >
<cfset prefix = "MF" >
<cfset comp_name = "First Title">
<cfelseif get_company_city.tx_employee eq 'True'>
<cfset account = "05" >
<cfset prefix = "TX" >
<cfset comp_name = "Title & Escrow of Texas, Inc.">
<cfelseif get_company_city.va_employee eq 'True'>
<cfset account = "04" >
<cfset prefix = "RI" >
<cfset comp_name = "First Title">
<cfelseif get_company_city.ft_fairfax_employee eq 'True'>
<cfset account = "06" >
<cfset prefix = "FX" >
<cfset comp_name = "First Title">
<cfelse>
<cfset account = "01" >
<cfset prefix = "T" >
<cfset comp_name = "First Title">
</cfif>

<CFMAIL
	TO="#read_abs.email#; rjermain@firsttitleservices.com"
	FROM="vendormgr@abstractsusa.com" Subject="Deed Preparation request from #comp_name# - Order #prefix#-#read_title.title_id#"
	TIMEOUT="600">

<cfif read_title.deed_prep_upload neq '' and read_title.deed_prep_upload neq 'NULL'>
<cfmailparam file="c:\uploads\#read_title.deed_prep_upload#">
</cfif>
#comp_name#, LLC
Account #account#
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
Central Processing Center
30 West Gude Drive
Rockville, MD 20850
<cfelse>
Central Processing Center
7361 Calhoun Place, Suite 200
Rockville, MD 20855
</cfif>

Phone 301.279.0303
Fax 301.315.7171

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
  DEED PREPARATION INFORMATION 
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

PURCHASER(s):  
#read_title.bfirstname1# #read_title.bminame1# #blastname1#
#read_title.bfirstname2# #read_title.bminame2# #blastname2#
#read_title.bfirstname3# #read_title.bminame3# #blastname3#
#read_title.bfirstname4# #read_title.bminame4# #blastname4#


PURCHASE PRICE: (consideration amount) 
#dollarFormat(read_title.purchase)#   


TENANCY   
#read_title.manner_of_title#


MISCELLANEOUS INFO 
#read_title.deed_prep_misc#


<cfif read_title.deed_prep_upload neq '' and read_title.deed_prep_upload neq 'NULL'>
Additional information contained in attached document(s)
#read_title.deed_prep_upload#
</cfif>




DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")# 
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#    


BILLING INFORMATION
=====================
PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO
vendormgr@abstractsusa.com
or fax 301-315-3161
phone 301-279-0303 x 386

</CFMAIL>
</cfif>

<cflocation url="./deed_prep.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">