<!--- paste code from title_abstract_doc_assignbackup.cfm --->
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_upload_sets">
SELECT st_abbrev from title_companies_states where title_co_id = 19
</CFQUERY>
<cfset upload_states = ValueList(get_upload_sets.st_abbrev, ",")>


<cfsetting enablecfoutputonly="yes">

<CFPARAM NAME="a_trigger" DEFAULT=0>
<CFPARAM NAME="form.title_update" DEFAULT="">
<CFPARAM NAME="form.taxes_from_search" DEFAULT="">
<CFPARAM NAME="form.product_ordered" DEFAULT="">
<CFPARAM NAME="form.bring_to_date" DEFAULT="">
<CFPARAM NAME="instructions" DEFAULT="">

<cfif form.bring_to_date neq ''>
<cfset form.product_ordered = 'Bring to Date' & ' - ' & DateFormat(form.bring_to_date, "m/d/yyyy")>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="record_check">
			Select * FROM tblUser_Roles
			WHERE title_ID = #rec_ID#
</CFQUERY>
<cfif record_check.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_new_record">
			Insert into tblUser_Roles
			(title_id)
			values
			(#rec_id#)
</CFQUERY>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_abs">
			select * from Abstractors
			WHERE abstractor_ID = #Abstractor_ID_new#
</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
			UPDATE tblUser_Roles
			SET Typing_End_Datetime = NULL
			WHERE title_ID = #rec_ID#
		</CFQUERY>


	<cfif order_type eq 'T'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			Select * from Title
			where title_id = #rec_id#
</CFQUERY>
<cfelseif order_type eq 'App'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			Select * from appraisal
			where app_id = #rec_id#
</CFQUERY>
<cfelseif order_type eq 'P'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
			Select *, prop_id as title_id from Property
			where prop_id = #rec_id#
</CFQUERY>
</cfif>



				<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">

			select * from first_admin

			WHERE ID = <cfif IsDefined("session.ft_user_id")>#session.ft_user_id#<cfelse>264</cfif>

		</CFQUERY>
<cfif #a_trigger# eq 10>

<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

		<CFIF #Abstractor_ID_new# neq "1481">

<CFQUERY DATASOURCE="#request.dsn#" NAME="record_check">
			Select * FROM Doc_Abstract_Title
			WHERE title_ID = #rec_ID#
</CFQUERY>
<cfif record_check.recordcount eq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_new_record">
			Insert into Doc_Abstract_Title
			(title_id)
			values
			(#rec_id#)
</CFQUERY>
</cfif>

<CFIF #Instructions# neq "">
			<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_Instructions">
				Update
				Doc_Abstract_Title
				set Instructions = '#Instructions#',
				product_ordered = '#form.product_ordered#',
				search_type = 'C'
				WHERE title_ID = #rec_ID#
			</CFQUERY>
		</CFIF>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
			UPDATE Doc_Abstract_Title
			SET Abstractor_ID = #Abstractor_ID_new#,
			<cfif form.product_ordered EQ "Typing">
			Abstractor_ID_3 = #Abstractor_ID_new#,
			</cfif>
			a_Assigned_by = #uid#,
			company = '#read_abs.company#',
			a_Date_Assigned = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_Dateandtime = '#order_date_adj#',
			a_Time_Assigned = '#TimeFormat(Now(), "HH:mm:ss")#',
			abs_type = 1,
			<cfif form.title_update eq 'Yes'>
			title_update = 1,
			</cfif>
			<cfif form.taxes_from_search eq 'Yes'>
			taxes_from_search = 1,
			tx_type = 1,
			</cfif>
			product_ordered = '#form.product_ordered#',
			bring_to_date = '#form.bring_to_date#'
			WHERE title_ID = #rec_ID#
		</CFQUERY>

<CFQUERY DATASOURCE="#request.dsn#" NAME="record_check">
			Select * FROM tblUser_Roles
			WHERE title_ID = #rec_ID#
</CFQUERY>
<cfif record_check.recordcount eq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_new_record">
			Insert into tblUser_Roles
			(title_id)
			values
			(#rec_id#)
</CFQUERY>
</cfif>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
			UPDATE tblUser_Roles
			SET Typing_End_Datetime = NULL
			WHERE title_ID = #rec_ID#
		</CFQUERY>

		<!---
		<CFQUERY DATASOURCE="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Abstract<cfif form.taxes_from_search eq "Yes"> and taxes from search</cfif>
 Assigned to #read_abs.company#: Product: #form.product_ordered#<cfif form.bring_to_date neq ''>:  #DateFormat(form.bring_to_date, "m/d/yyyy")#</cfif>', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
		--->
<CFQUERY DATASOURCE="#request.dsn#" NAME="vendor_tracker">
		Insert into Vendor_Tracker (Vendor_id, Order_id, order_type, assign_date, assigned_by, vendor_type, task)
		values
		(#Abstractor_ID_new#, #rec_id#, 'T', #createODBCDateTime(Now())#, #uid#, 'abstractor', 'abstract<cfif form.taxes_from_search eq "Yes"> and taxes from search</cfif>')
</CFQUERY>

		<cfelse>

<CFQUERY DATASOURCE="#request.dsn#" NAME="record_check">
			Select * FROM Doc_Abstract_Title
			WHERE title_ID = #rec_ID#
</CFQUERY>
<cfif record_check.recordcount eq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_new_record">
			Insert into Doc_Abstract_Title
			(title_id)
			values
			(#rec_id#)
</CFQUERY>
</cfif>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
			UPDATE Doc_Abstract_Title
			SET chandresh_access = 1,
			product_ordered = '#form.product_ordered#',
			<cfif form.title_update eq 'Yes'>
			title_update = 1,
			</cfif>
			<cfif form.taxes_from_search eq 'Yes'>
			taxes_from_search = 1,
			tx_type = 1,
			</cfif>
			bring_to_date = '#form.bring_to_date#'
			WHERE title_ID = #rec_ID#
		</CFQUERY>


<CFQUERY DATASOURCE="#request.dsn#" NAME="record_check">
			Select * FROM tblUser_Roles
			WHERE title_ID = #rec_ID#
</CFQUERY>
<cfif record_check.recordcount eq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_new_record">
			Insert into tblUser_Roles
			(title_id)
			values
			(#rec_id#)
</CFQUERY>
</cfif>

		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title_abs">
			UPDATE tblUser_Roles
			SET Typing_End_Datetime = NULL
			WHERE title_ID = #rec_ID#
		</CFQUERY>
	<!---
				<CFQUERY DATASOURCE="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Abstract<cfif form.taxes_from_search eq "Yes"> and taxes from search</cfif> Assigned to Chandresh Infinity: Product: #form.product_ordered#<cfif form.bring_to_date neq ''>:  #DateFormat(form.bring_to_date, "m/d/yyyy")#</cfif>', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
		--->

<CFQUERY DATASOURCE="#request.dsn#" NAME="vendor_tracker">
		Insert into Vendor_Tracker (Vendor_id, Order_id, order_type, assign_date, assigned_by, vendor_type, task)
		values
		(1481, #rec_id#, 'T', #createODBCDateTime(Now())#, #uid#, 'abstractor', 'abstract<cfif form.taxes_from_search eq "Yes"> and taxes from search</cfif>')
</CFQUERY>

		</cfif>
	<!--- N 07/29/05  not all abstractor have e-mails--->
<cfif read_abs.email neq "">
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY DATASOURCE="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_company_city">
		select mi_employee, mo_employee, mi_flushing_employee, va_employee, tx_employee, ft_fairfax_employee
		from First_Admin where ID = #get_comp.intSales#
</CFQUERY>
<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",") or get_comp.streamline_client eq 'True'>
<cfset account = "02" >
<cfset company_name = "Streamline Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset prefix = "ST" >
<cfset company_email = "vendormgr@streamline-title.com" >


<cfelseif get_comp.ID eq '12324'>
<cfset account = "09" >
<cfset company_name = "First Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset prefix = "FT" >
<cfset company_email = "vendormgr@firsttitleservices.com" >




<cfelseif get_company_city.mi_employee eq 'True'>
<cfset account = "03" >
<cfset company_name = "First Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset prefix = "MI" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
<cfelseif get_company_city.mo_employee eq 'True'>
<cfset account = "08" >
<cfset company_name = "First Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset prefix = "MO" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
<cfelseif get_company_city.mi_flushing_employee eq 'True'>
<cfset account = "07" >
<cfset company_name = "First Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset prefix = "MF" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
<cfelseif get_company_city.tx_employee eq 'True' or read_title.pstate eq 'TX'>
<cfset account = "05" >
<cfset company_name = "Title & Escrow of Texas, Inc." >
<cfset requesting_name = "Title & Escrow of Texas" >
<cfset prefix = "TX" >
<cfset company_email = "vendormgr@titleoftexas.com" >
<cfelseif get_company_city.va_employee eq 'True'>
<cfset account = "04" >
<cfset prefix = "RI" >
<cfset company_name = "First Title & Escrow">
<cfset requesting_name = "Abstracts, USA" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
<cfelseif get_company_city.ft_fairfax_employee eq 'True'>
<cfset account = "06" >
<cfset prefix = "FX" >
<cfset company_name = "First Title & Escrow">
<cfset requesting_name = "Abstracts, USA" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "T" >
<cfset company_name = "First Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
</cfif>







<cfif ListContainsNoCase(upload_states, read_title.pstate, ",")><!--- if it's an UPLOAD STATE we send a different request --->
<!--- #read_abs.email#--->
<!--- bcc="cmarcey@firsttitleservices.com,akumar@firsttitleservices.com" --->
<cfif account eq '05'>
<cfset read_abs.email = read_abs.email & ';' & 'nwood@titleoftexas.com;rick@jermain.com'>
</cfif>
<CFMAIL
				TO="#read_abs.email#" server="127.0.0.1" 
				FROM="#company_email#" Subject="New Title Commitment/Prelim Report of Title Request from #requesting_name# - Order #prefix#-#read_title.title_id#"  bcc="akumar@firsttitleservices.com; rjermain@firsttitleservices.com"
				TIMEOUT="600">
<cfoutput>

<cfif account eq '05'>
Title & Escrow of Texas, Inc.
2805 N. Dallas Pkwy, Ste. 220
Plano, TX 75093

Phone 972.665.9969
Fax 972.692.3209
<cfelse>

Central Processing Center
7361 Calhoun Place, Suite 200
Rockville, MD 20855


Phone 301.279.0303
Fax 301.315.7171
</cfif>
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
   ORDER INSTRUCTIONS HAVE CHANGED, PLEASE READ BELOW:
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

ORDER - #prefix#-#read_title.title_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_user.FNAME#
VENDOR MANAGER NUMBER - #read_user.phone#
VENDOR MANAGER E-MAIL - #read_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#


PRODUCT ORDERED: #form.product_ordered#

1. Title Commitment (or Preliminary Title Report) Requested on Stewart Title Guaranty paper

2. Lender Information: #read_title.insured#

3. Loan Amount: $#read_title.loanamt_float#

4. Please send Closing Protection letter adding #company_name# as Secondary agent along with your title company info. </cfoutput>
 
 Search copies fees should be no more than $20.00
 


<cfoutput>Property Information:
</cfoutput>
<cfif read_title.searchtype eq 'Purchase'>
<cfoutput>Seller name: #read_title.sfirstname1# <cfif Len(read_title.sminame1)>#read_title.sminame1# </cfif>#read_title.slastname1#
Social Security Number: #read_title.sssn1#
<cfif Len(read_title.slastname2)>
Seller name: #read_title.sfirstname2# <cfif Len(read_title.sminame2)>#read_title.sminame2# </cfif>#read_title.slastname2#
Social Security Number: #read_title.sssn2#
</cfif>
<cfif Len(read_title.slastname3)>
Seller name: #read_title.sfirstname3# <cfif Len(read_title.sminame3)>#read_title.sminame3# </cfif>#read_title.slastname3#
Social Security Number: #read_title.sssn3#
</cfif>
<cfif Len(read_title.slastname4)>
Seller name: #read_title.sfirstname4# <cfif Len(read_title.sminame4)>#read_title.sminame4# </cfif>#read_title.slastname4#
Social Security Number: #read_title.sssn4#
</cfif>
</cfoutput>
</cfif>
<cfoutput>Borrower name: #read_title.bfirstname1# <cfif Len(read_title.bminame1)>#read_title.bminame1# </cfif>#read_title.blastname1#
Social Security Number: #read_title.bssn1#
<cfif Len(read_title.blastname2)>
Borrower name: #read_title.bfirstname2# <cfif Len(read_title.bminame2)>#read_title.bminame2# </cfif>#read_title.blastname2#
Social Security Number: #read_title.bssn2#
</cfif>
<cfif isDefined("read_title.blastname3") AND Len(read_title.blastname3)>
Borrower name: #read_title.bfirstname3# <cfif Len(read_title.bminame3)>#read_title.bminame3# </cfif>#read_title.blastname3#
Social Security Number: #read_title.bssn3#
</cfif>
<cfif isDefined("read_title.blastname4") AND Len(read_title.blastname4)>
Borrower name: #read_title.bfirstname4# <cfif Len(read_title.bminame4)>#read_title.bminame4# </cfif>#read_title.blastname4#
Social Security Number: #read_title.bssn4#
</cfif>

Property address: #read_title.paddress#

City - #read_title.pcity#
State - #read_title.pstate#
County - #read_title.pcounty#
Zip Code - #read_title.pzip# </cfoutput>

<cfoutput>PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS USA REPRESENTATIVE
LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

 INVOICES MUST INCLUDE:
 CASE NUMBER
 BORROWER NAME
 ADDRESS
 PRODUCT
 FEE
</cfoutput>

<cfoutput>BILLING INFORMATION
=====================
PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO

#company_email#
<cfif account eq '05'>
or fax 972.692.3209
phone 972.665.9969
<cfelse>
or fax 301-315-3161
phone 301-279-0303 x 386
</cfif>


	</cfoutput>



<cfoutput>email ID 15b
</cfoutput>
</CFMAIL>


<cfelse><!--- NOT an UPLOAD STATE gets a normal Abstract request --->

<cfif account eq '05'>
<cfset read_abs.email = read_abs.email & ';' & 'nwood@titleoftexas.com;rick@jermain.com'>
</cfif>

<cfif account eq '05'>
<cfset product_name = 'Title Evidence'>
<cfelse>
<cfset product_name = 'Abstract Report'>
</cfif>

<CFMAIL
				TO="#read_abs.email#" server="127.0.0.1"
				FROM="#company_email#" Subject="New #product_name# request from #requesting_name# - Order #prefix#-#read_title.title_id#" bcc="akumar@firsttitleservices.com; rjermain@firsttitleservices.com"
				TIMEOUT="600">
<cfoutput>
#company_name#
Account #account#
<cfif account eq '05'>
Title & Escrow of Texas, Inc.
2805 N. Dallas Pkwy, Ste. 220
Plano, TX 75093

Phone 972.665.9969
Fax 972.692.3209
<cfelse>

Central Processing Center
7361 Calhoun Place, Suite 200
Rockville, MD 20855


Phone 301.279.0303
Fax 301.315.7171
</cfif>

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
   ORDER INSTRUCTIONS HAVE CHANGED, PLEASE READ BELOW:
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

ORDER - #prefix#-#read_title.title_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_user.FNAME#
VENDOR MANAGER NUMBER - #read_user.phone#
VENDOR MANAGER E-MAIL - #read_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#
</cfoutput>





<cfif read_title.pstate eq "PA">

<cfoutput> Certified Tax Search from City/Borough REQUESTED
</cfoutput>
</cfif>

<cfif form.title_update eq "Yes">

<cfoutput> PLEASE DO UPDATE FROM PRIOR SEARCH
</cfoutput>	 <cfif form.bring_to_date neq ''>
<cfoutput>	 #form.bring_to_date#
</cfoutput>	 </cfif>
<cfelse>
	<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

<cfoutput>	  Special Instructions: #get_comp.special_abs_inst#
</cfoutput>
	</cfif>
</cfif>

<cfoutput> Product Ordered: #form.product_ordered#
</cfoutput>

<cfif form.product_ordered eq '10-Year Search'>
Lien Report:  A listing of all relevant information belonging to the current record title-holder of the property 
and a 10 year chain of title. The report should contain backup documentation which includes copies of the deeds 
of conveyance that are recorded within the last 10 years.  If there are no deeds of transfer within the last 
10 years the report should include copy of last recorded deed.   The lien report will also identify any open 
liens, judgments, mortgages that are of record even if greater than 10 years regardless if current ownership.  
The report will also include tax history, appraisal parcel number, and copies of mortgages, judgments, 
etc. that are identified on the report.</cfif>

<cfif form.taxes_from_search eq "Yes">

<cfoutput> PLEASE COMPLETE TAXES FROM SEARCH
</cfoutput>
</cfif>


<cfoutput>Property Information:
</cfoutput>
<cfif read_title.searchtype eq 'Purchase'>
<cfoutput>Seller name: #read_title.sfirstname1# <cfif Len(read_title.sminame1)>#read_title.sminame1# </cfif>#read_title.slastname1#
Social Security Number: #read_title.sssn1#
<cfif Len(read_title.slastname2)>
Seller name: #read_title.sfirstname2# <cfif Len(read_title.sminame2)>#read_title.sminame2# </cfif>#read_title.slastname2#
Social Security Number: #read_title.sssn2#
</cfif>
<cfif Len(read_title.slastname3)>
Seller name: #read_title.sfirstname3# <cfif Len(read_title.sminame3)>#read_title.sminame3# </cfif>#read_title.slastname3#
Social Security Number: #read_title.sssn3#
</cfif>
<cfif Len(read_title.slastname4)>
Seller name: #read_title.sfirstname4# <cfif Len(read_title.sminame4)>#read_title.sminame4# </cfif>#read_title.slastname4#
Social Security Number: #read_title.sssn4#
</cfif>
</cfoutput>
</cfif>
<cfoutput>Borrower name: #read_title.bfirstname1# <cfif Len(read_title.bminame1)>#read_title.bminame1# </cfif>#read_title.blastname1#
Social Security Number: #read_title.bssn1#
<cfif Len(read_title.blastname2)>
Borrower name: #read_title.bfirstname2# <cfif Len(read_title.bminame2)>#read_title.bminame2# </cfif>#read_title.blastname2#
Social Security Number: #read_title.bssn2#
</cfif>
<cfif isDefined("read_title.blastname3") AND Len(read_title.blastname3)>
Borrower name: #read_title.bfirstname3# <cfif Len(read_title.bminame3)>#read_title.bminame3# </cfif>#read_title.blastname3#
Social Security Number: #read_title.bssn3#
</cfif>
<cfif isDefined("read_title.blastname4") AND Len(read_title.blastname4)>
Borrower name: #read_title.bfirstname4# <cfif Len(read_title.bminame4)>#read_title.bminame4# </cfif>#read_title.blastname4#
Social Security Number: #read_title.bssn4#
</cfif>




Property address: #read_title.paddress#

City - #read_title.pcity#
State - #read_title.pstate#
County - #read_title.pcounty#
Zip Code - #read_title.pzip#

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
               SPECIAL INSTRUCTIONS
 =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
</cfoutput>

<cfif instructions neq ''>
<cfoutput>Instructions: #instructions#
</cfoutput></cfif>


<!--- Edit (Start) Added by Synechron Development for ticket# 677 --->

<cfif #get_comp.streamline_client# eq false>
	<cfoutput>
	<cfinclude template="../FT_search_instructions.cfm">
	</cfoutput>


<cfelse>
<!--- Edit (End) Added by Synechron Development for ticket# 677 --->

<!--- Edit (Start) Added by Synechron Development for ticket# 674 --->
<cfoutput>	
Streamline General Search Requirements:

Update/Bring to Date: 
Search from the previous thru date/effective date provided.  Search judgments for all parties in title during that time and any additional names provided on the request.  Please provide a list of names searched.  Note results of Bankruptcy and Patriot searches.

One owner search : 
Search  back to an arms length conveyance (warranty deed) with institutional purchase money. Search judgments for all parties in title during that time and any additional names provided on the request. Please provide a list of names searched. Note results of Bankruptcy and Patriot searches, if searched.

Two owner search: 
Search back two arms length (warranty deed ) conveyances. Probate MUST be checked for all cases. Search judgments for all parties in title during that time and any additional names provided on the request. Please provide a list of names searched. Note results of Bankruptcy and Patriot searches, if searched.

Full Search: 
First Title will specify the number of years for the full search. Search judgments for all parties in title during that time and any additional names provided on the request. Please provide a list of names searched. . Note results of Bankruptcy and Patriot searches, if searched.


Special Search Requirements:

.	Leasehold Properties
	Provide copy of the lease
	Search chain of title for fee simple title holder

.	Life Estates
	Check probate for the life estate holder

.	Land Contracts
	Provide copy of land contract and run title on the actual current owner.


General Copy Requirements:

. 	Copies of all deeds
. 	Copy of plat, if applicable (for all full searches)
. 	Full copies of all Mortgages/Deeds of Trust
. 	Copies of all judgments/liens

Special Copy Requirements:

Foreclosures within the last two years in states with judicial foreclosures:
. 	Copy of publication of Notice of Default and Foreclosure Sale 
. 	Proof of Notice of Default and Foreclosure Sale ( green receipts)
. 	Copy of the foreclosed mortgage

Decedent's Estates
. 	Copy of the Will
. 	Letter of Administration (Appointment of Executor)
. 	List of Heirs

Divorce Proceedings
.	Copy of recorded marital settlement agreement, if available.

Mobile/Manufactured Homes:
.	Copy of Certificate of Affixture or its equivalent, if filed.
</cfoutput>	
<!--- Edit (End) Added by Synechron Development for ticket# 674 --->	

<!--- Edit (Start) Added by Synechron Development for ticket# 677 --->
</cfif>
<!--- Edit (End) Added by Synechron Development for ticket# 677 --->
<!---

VENDOR COVER SHEET FORM

Vendor Information
Vendor _______________________________  Vendor Phone_____________________
Contact_______________________________   Date _____________________________

Borrower Information
Effective Date  ___________________    Order  __________________________

Property Address _________________________________________________________

_______________________________________________________________________

Title vested as ___________________________________________________________

____Married (sole owner)	   ____Husband and Wife, Joint Tenants
____Unmarried Man/Woman

By Purchase Money Deed from _____________________________________________

Book/ Instrument  _____________  Page________ Dated________Recorded________

Tax Information

Parcel ID   _____________________________ Tax Office Phone_________________
Make checks payable to  __________________________________________________
Payment Frequency    ANNUAL      SEMI ANNUAL    QUARTERLY        (CIRCLE ONE)

Tax Year  __________     Due Dates______________________

Are there delinquent taxes?        YES              NO      (CIRCLE ONE)
Good Thru date ______

Annual or Base amount  $_____________
Date of last payment    _______________   Amount ____________________________

Last payment covers         Prior Year        Current Year     Paid in Advance
(CIRCLE ONE)

Are there any taxes to be paid that are not included in this bill?    YES    NO
(CIRCLE ONE)


Trustor______________________________  Trustee ___________________________

Beneficiary ____________________________________________________________

Dated _____  Recorded _____ Book/Instrument _______ Page ______ Amount ______

Assignment _________ Book/Instrument_______ Page________ Recorded__________

Open Ended: $_____________      Closed End       (CIRCLE ONE)


Trustor______________________________  Trustee ___________________________

Beneficiary ____________________________________________________________

Dated _____  Recorded _____ Book/Instrument _______ Page ______ Amount ______

Assignment _________ Book/Instrument_______ Page________ Recorded__________

Open Ended: $_____________      Closed End       (CIRCLE ONE)


Trustor______________________________  Trustee ___________________________

Beneficiary ____________________________________________________________

Dated _____  Recorded _____ Book/Instrument _______ Page ______ Amount ______

Assignment _________ Book/Instrument_______ Page________ Recorded__________

Open Ended: $_____________      Closed End       (CIRCLE ONE)


Are there any Liens/Judgments?    YES    		NO		(CIRCLE ONE)

Copies Included?   		        YES		NO		(CIRCLE ONE) --->



<!---<cfoutput>
PLEASE BE SURE TO INCLUDE COPIES OF ALL OPEN JUDGMENTS/LIENS,
MTG/DOT AND THE DEED.

COPIES CAN NOT EXCEED 15.00 WITHOUT AUTHORIZATION IN ADVANCE.

PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS USA REPRESENTATIVE
LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

 INVOICES MUST INCLUDE:
 CASE NUMBER
 BORROWER NAME
 ADDRESS
 PRODUCT
 FEE
</cfoutput>--->


<cfoutput>BILLING INFORMATION
=====================
PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO

#company_email#
<cfif account eq '05'>
or fax 972.692.3209
phone 972.665.9969
<cfelse>
or fax 301-315-3161
phone 301-279-0303 x 386
</cfif>


	</cfoutput>
<cfif account eq '05'>
*PLEASE PROVIDE AN EXECUTED T-00 WITH THE ORDER.
 
*Search copies fees should be no more than $20.00
 
</cfif>






<cfoutput>email ID 15
</cfoutput>
</CFMAIL>
</cfif>

	<!--- N --->
</cfif>
				<!--- 		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_event">

			select * from eventlist
			WHERE title_ID = #rec_id#

		</CFQUERY>
<cfif #read_event.c_day# neq "">
		<cfquery name="updateclosing" DATASOURCE="#request.dsn#">
update eventlist
set
	yearmonth = null,
	yearmonthday = null,
	c_day = null,
	c_time = null,
	c_year = null,
	c_month = null,
	s_time = null,
	s_date = null,
	l_date = null,
	l_time = null,
	closing_date = null
where title_id = #URL.rec_id#
</cfquery>
	</cfif>	 --->
</cfif>
<!---
<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=0&company_id=#url.company_id#">
--->