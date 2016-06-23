	<cfparam name="Instructions" default="">
	<cfparam name="form.title_update" default="0">
	<cfparam name="form.product_ordered" default="">
	<cfparam name="form.taxes_from_search" default="">

	<cfif #date# eq "">
		<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_abstract_doc_view.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&a_trigger=1&company_id=0&a_flag=1">
	<cfelse>
		<CFIF #Instructions# neq "">
			<CFQUERY datasource="#request.dsn#" NAME="read_title_Instructions">
				Update
				Doc_Abstract_Title
				set Instructions = '#Instructions#',
				search_type = 'C'
				WHERE title_ID = #rec_ID#
			</CFQUERY>
		</CFIF>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">
			SELECT *
			FROM Doc_Abstract_Title
			WHERE title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor">
			SELECT *
			FROM Abstractors
			WHERE  abstractor_ID = #read_title_abstract.abstractor_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_ft_user">
			SELECT *
			FROM first_admin
			WHERE ID = #read_title_ABSTRACT.a_Assigned_by#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
			SELECT *
			FROM first_admin
			WHERE ID = #session.ft_user_id#
		</CFQUERY>



<!--- If you are wondering why this is so long it is because cfmail treats html and cold fusion as line spaces
I did it this way to preserve the email page formatting. --->
<cfif #read_title_abstract.search_type# eq "A" and (#read_title_abstract.search_A_email_sent# eq 0 or #read_title_abstract.search_A_email_sent# eq 'NULL')>
<cfif #read_assigned_abstractor.pref_for_send# EQ "Email">
<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_company_city">
		select mi_employee, mo_employee, mi_flushing_employee, va_employee, tx_employee, ft_fairfax_employee
		from First_Admin where ID = #get_comp.intSales#
</CFQUERY>


<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "ST" >
<cfset comp_name = "Streamline Title">


<cfelseif get_comp.ID eq '12324'>
<cfset account = "09" >
<cfset prefix = "FT" >
<cfset comp_name = "First Title">


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
				TO="#read_assigned_abstractor.email#,#read_ft_user.email#"
				FROM="vendormgr@abstractsusa.com"
				SERVER="127.0.0.1"
				Subject="New Abstract report request from Abstracts, USA - Order #prefix#-#read_title.title_id#"
				TIMEOUT="600"
>

Abstracts USA, LLC
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
   ORDER INSTRUCTIONS HAVE CHANGED, PLEASE READ BELOW:
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

ORDER - #prefix#-#read_title.title_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_user.FNAME#
VENDOR MANAGER NUMBER - #read_user.phone#
VENDOR MANAGER E-MAIL - #read_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif read_title.pstate eq "PA">

 Certified Tax Search from City/Borough REQUESTED

</cfif>

<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
 <cfif form.bring_to_date neq ''>#form.bring_to_date#

 </cfif>
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

  Product Ordered: #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
</cfif>


<cfif form.taxes_from_search eq "Yes">

 PLEASE COMPLETE TAXES FROM SEARCH

</cfif>


DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#

Property Information:

<cfif read_title.searchtype eq 'Purchase'>
Seller name: #read_title.sfirstname1# <cfif Len(read_title.sminame1)>#read_title.sminame1# </cfif>#read_title.slastname1#
Social Security Number: #read_title.sssn1#
</cfif>
Borrower name: #read_title.bfirstname1# <cfif Len(read_title.bminame1)>#read_title.bminame1# </cfif>#read_title.blastname1#
Social Security Number: #read_title.bssn1#

Property address: #read_title.paddress#

City - #read_title.pcity#
State - #read_title.pstate#
County - #read_title.pcounty#
Zip Code - #read_title.pzip#

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
               SPECIAL INSTRUCTIONS
 =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=


<cfif instructions neq ''>

Instructions: #instructions#

</cfif>


<cfif read_title.SearchType eq 'Purchase'>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE FULL CHAIN OF TITLE.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT
DEED FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif><cfelse>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT DEED
FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif></cfif>

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



PLEASE BE SURE TO INCLUDE COPIES OF ALL OPEN JUDGMENTS/LIENS,
MTG/DOT AND THE DEED.

PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS USA REPRESENTATIVE
LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

 INVOICES MUST INCLUDE:
 CASE NUMBER
 BORROWER NAME
 ADDRESS
 PRODUCT
 FEE


BILLING INFORMATION
=====================
PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO
vendormgr@abstractsusa.com
or fax 301-315-3161
phone 301-279-0303 x 386




email ID 13

</CFMAIL>
<cfelse>

<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_company_city">
		select mi_employee, mo_employee, mi_flushing_employee, va_employee, tx_employee, ft_fairfax_employee
		from First_Admin where ID = #get_comp.intSales#
</CFQUERY>


<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "ST" >
<cfset comp_name = "Streamline Title">

<cfelseif get_comp.ID eq '12324'>
<cfset account = "09" >
<cfset prefix = "FT" >
<cfset comp_name = "First Title">


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
<!--- TO="1#read_assigned_abstractor.fax#@efaxsend.com,#read_ft_user.email#" --->
<CFMAIL
TO="#read_assigned_abstractor.email#,#read_ft_user.email#"
FROM="vendormgr@abstractsusa.com" Subject="New Abstract report request from Abstracts, USA - Order #prefix#-#read_title.title_id#"
TIMEOUT="600"
>
Abstracts USA, LLC
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
   ORDER INSTRUCTIONS HAVE CHANGED, PLEASE READ BELOW:
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

ORDER - #prefix#-#read_title.title_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_user.FNAME#
VENDOR MANAGER NUMBER - #read_user.phone#
VENDOR MANAGER E-MAIL - #read_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif read_title.pstate eq "PA">

 Certified Tax Search from City/Borough REQUESTED

</cfif>

<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
 <cfif form.bring_to_date neq ''>#form.bring_to_date#

 </cfif>
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

  Product Ordered: #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
</cfif>


<cfif form.taxes_from_search eq "Yes">

 PLEASE COMPLETE TAXES FROM SEARCH

</cfif>


DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#

Property Information:

<cfif read_title.searchtype eq 'Purchase'>
Seller name: #read_title.sfirstname1# <cfif Len(read_title.sminame1)>#read_title.sminame1# </cfif>#read_title.slastname1#
Social Security Number: #read_title.sssn1#
</cfif>
Borrower name: #read_title.bfirstname1# <cfif Len(read_title.bminame1)>#read_title.bminame1# </cfif>#read_title.blastname1#
Social Security Number: #read_title.bssn1#

Property address: #read_title.paddress#

City - #read_title.pcity#
State - #read_title.pstate#
County - #read_title.pcounty#
Zip Code - #read_title.pzip#

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
               SPECIAL INSTRUCTIONS
 =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=


<cfif instructions neq ''>

Instructions: #instructions#

</cfif>


<cfif read_title.SearchType eq 'Purchase'>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE FULL CHAIN OF TITLE.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT
DEED FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif><cfelse>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT DEED
FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif></cfif>

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



PLEASE BE SURE TO INCLUDE COPIES OF ALL OPEN JUDGMENTS/LIENS,
MTG/DOT AND THE DEED.

PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS USA REPRESENTATIVE
LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

 INVOICES MUST INCLUDE:
 CASE NUMBER
 BORROWER NAME
 ADDRESS
 PRODUCT
 FEE


BILLING INFORMATION
=====================
PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO
vendormgr@abstractsusa.com
or fax 301-315-3161
phone 301-279-0303 x 386




email ID 12
</CFMAIL>
</cfif>
<!--- mark this email as having been sent, so it doesn't get sent again --->
<CFQUERY datasource="#request.dsn#" NAME="update_email">
			Update Doc_Abstract_Title
			Set search_A_email_sent = 1
			WHERE title_ID = #read_title_abstract.Title_ID#
		</CFQUERY>
</CFIF>
<cfif #read_title_abstract.search_type# eq "B" and #read_title_abstract.search_B_email_sent# eq 0>
<cfif #read_assigned_abstractor.pref_for_send# EQ "Email">
<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_company_city">
		select mi_employee, mo_employee, mi_flushing_employee, va_employee, tx_employee, ft_fairfax_employee
		from First_Admin where ID = #get_comp.intSales#
</CFQUERY>


<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "ST" >
<cfset comp_name = "Streamline Title">


<cfelseif get_comp.ID eq '12324'>
<cfset account = "09" >
<cfset prefix = "FT" >
<cfset comp_name = "First Title">

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
				TO="#read_assigned_abstractor.email#,#read_ft_user.email#"
				FROM="vendormgr@abstractsusa.com"
				SERVER="127.0.0.1"
				Subject="New Abstract report request from Abstracts, USA - Order #prefix#-#read_title.title_id#"
				TIMEOUT="600"
			>

Abstracts USA, LLC
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
   ORDER INSTRUCTIONS HAVE CHANGED, PLEASE READ BELOW:
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

ORDER - #prefix#-#read_title.title_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_user.FNAME#
VENDOR MANAGER NUMBER - #read_user.phone#
VENDOR MANAGER E-MAIL - #read_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif read_title.pstate eq "PA">

 Certified Tax Search from City/Borough REQUESTED

</cfif>

<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
 <cfif form.bring_to_date neq ''>#form.bring_to_date#

 </cfif>
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

  Product Ordered: #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
</cfif>


<cfif form.taxes_from_search eq "Yes">

 PLEASE COMPLETE TAXES FROM SEARCH

</cfif>


DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#

Property Information:

<cfif read_title.searchtype eq 'Purchase'>
Seller name: #read_title.sfirstname1# <cfif Len(read_title.sminame1)>#read_title.sminame1# </cfif>#read_title.slastname1#
Social Security Number: #read_title.sssn1#
</cfif>
Borrower name: #read_title.bfirstname1# <cfif Len(read_title.bminame1)>#read_title.bminame1# </cfif>#read_title.blastname1#
Social Security Number: #read_title.bssn1#

Property address: #read_title.paddress#

City - #read_title.pcity#
State - #read_title.pstate#
County - #read_title.pcounty#
Zip Code - #read_title.pzip#

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
               SPECIAL INSTRUCTIONS
 =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=


<cfif instructions neq ''>

Instructions: #instructions#

</cfif>


<cfif read_title.SearchType eq 'Purchase'>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE FULL CHAIN OF TITLE.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT
DEED FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif><cfelse>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT DEED
FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif></cfif>

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



PLEASE BE SURE TO INCLUDE COPIES OF ALL OPEN JUDGMENTS/LIENS,
MTG/DOT AND THE DEED.

PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS USA REPRESENTATIVE
LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

 INVOICES MUST INCLUDE:
 CASE NUMBER
 BORROWER NAME
 ADDRESS
 PRODUCT
 FEE


BILLING INFORMATION
=====================
PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO
vendormgr@abstractsusa.com
or fax 301-315-3161
phone 301-279-0303 x 386




email ID 11

</CFMAIL>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
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

<cfelseif get_comp.ID eq '12324'>
<cfset account = "09" >
<cfset prefix = "FT" >
<cfset comp_name = "First Title">


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

TO="1#read_assigned_abstractor.fax#@efaxsend.com,#read_ft_user.email#"
FROM="vendormgr@abstractsusa.com"
SERVER="127.0.0.1"
Subject="New Abstract report request from Abstracts, USA - Order #prefix#-#read_title.title_id#"
TIMEOUT="600"
>
Abstracts USA, LLC
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
   ORDER INSTRUCTIONS HAVE CHANGED, PLEASE READ BELOW:
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

ORDER - #prefix#-#read_title.title_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_user.FNAME#
VENDOR MANAGER NUMBER - #read_user.phone#
VENDOR MANAGER E-MAIL - #read_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif read_title.pstate eq "PA">

 Certified Tax Search from City/Borough REQUESTED

</cfif>

<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
 <cfif form.bring_to_date neq ''>#form.bring_to_date#

 </cfif>
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

  Product Ordered: #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
</cfif>


<cfif form.taxes_from_search eq "Yes">

 PLEASE COMPLETE TAXES FROM SEARCH

</cfif>


DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#

Property Information:

<cfif read_title.searchtype eq 'Purchase'>
Seller name: #read_title.sfirstname1# <cfif Len(read_title.sminame1)>#read_title.sminame1# </cfif>#read_title.slastname1#
Social Security Number: #read_title.sssn1#
</cfif>
Borrower name: #read_title.bfirstname1# <cfif Len(read_title.bminame1)>#read_title.bminame1# </cfif>#read_title.blastname1#
Social Security Number: #read_title.bssn1#

Property address: #read_title.paddress#

City - #read_title.pcity#
State - #read_title.pstate#
County - #read_title.pcounty#
Zip Code - #read_title.pzip#

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
               SPECIAL INSTRUCTIONS
 =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=


<cfif instructions neq ''>

Instructions: #instructions#

</cfif>


<cfif read_title.SearchType eq 'Purchase'>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE FULL CHAIN OF TITLE.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT
DEED FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif><cfelse>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT DEED
FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif></cfif>

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



PLEASE BE SURE TO INCLUDE COPIES OF ALL OPEN JUDGMENTS/LIENS,
MTG/DOT AND THE DEED.

PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS USA REPRESENTATIVE
LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

 INVOICES MUST INCLUDE:
 CASE NUMBER
 BORROWER NAME
 ADDRESS
 PRODUCT
 FEE


BILLING INFORMATION
=====================
PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO
vendormgr@abstractsusa.com
or fax 301-315-3161
phone 301-279-0303 x 386




email ID 10
</CFMAIL>
</cfif>
<!--- mark this email as having been sent, so it doesn't get sent again --->
<CFQUERY datasource="#request.dsn#" NAME="update_email">
			Update Doc_Abstract_Title
			Set search_B_email_sent = 1
			WHERE title_ID = #read_title_abstract.Title_ID#
		</CFQUERY>
</CFIF>
<!---C --->
<cfif #read_title_abstract.search_type# eq "C" and #read_title_abstract.search_C_email_sent# eq 0>
<cfif #read_assigned_abstractor.pref_for_send# EQ "Email">
<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_company_city">
		select mi_employee, mo_employee, mi_flushing_employee, va_employee, tx_employee, ft_fairfax_employee
		from First_Admin where ID = #get_comp.intSales#
</CFQUERY>


<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "ST" >
<cfset comp_name = "Streamline Title">

<cfelseif get_comp.ID eq '12324'>
<cfset account = "09" >
<cfset prefix = "FT" >
<cfset comp_name = "First Title">

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

<!--- <CFMAIL
				TO="#read_assigned_abstractor.email#"
				FROM="vendormgr@abstractsusa.com"
				SERVER="127.0.0.1"
				Subject="New Abstract report request from Abstracts, USA - Order #prefix#-#read_title.title_id#" bcc="akumar@firsttitleservices.com"
				TIMEOUT="600"
			>

Abstracts USA, LLC
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
   ORDER INSTRUCTIONS HAVE CHANGED, PLEASE READ BELOW:
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

ORDER - #prefix#-#read_title.title_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_user.FNAME#
VENDOR MANAGER NUMBER - #read_user.phone#
VENDOR MANAGER E-MAIL - #read_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif read_title.pstate eq "PA">

 Certified Tax Search from City/Borough REQUESTED

</cfif>

<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
 <cfif form.bring_to_date neq ''>#form.bring_to_date#

 </cfif>
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

  Special Instructions: #get_comp.special_abs_inst#

</cfif>

 Product Ordered: #form.product_ordered#

</cfif>


<cfif form.taxes_from_search eq "Yes">

 PLEASE COMPLETE TAXES FROM SEARCH

</cfif>


DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#

Property Information:

<cfif read_title.searchtype eq 'Purchase'>
Seller name: #read_title.sfirstname1# #read_title.slastname1#
Social Security Number: #read_title.sssn1#
</cfif>
Borrower name: #read_title.bfirstname1# #read_title.blastname1#
Social Security Number: #read_title.bssn1#

Property address: #read_title.paddress#

City - #read_title.pcity#
State - #read_title.pstate#
County - #read_title.pcounty#
Zip Code - #read_title.pzip#

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
               SPECIAL INSTRUCTIONS
 =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=


<cfif instructions neq ''>

Instructions: #instructions#

</cfif>


<cfif read_title.SearchType eq 'Purchase'>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE FULL CHAIN OF TITLE.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT
DEED FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif><cfelse>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT DEED
FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif></cfif>

 Maximum copies are not to exceed $15.00

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



PLEASE BE SURE TO INCLUDE COPIES OF ALL OPEN JUDGMENTS/LIENS,
MTG/DOT AND THE DEED.

PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS USA REPRESENTATIVE
LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

 INVOICES MUST INCLUDE:
 CASE NUMBER
 BORROWER NAME
 ADDRESS
 PRODUCT
 FEE


BILLING INFORMATION
=====================
PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO
vendormgr@abstractsusa.com
or fax 301-315-3161
phone 301-279-0303 x 386




email ID 9
</CFMAIL> --->
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_company_city">
		select mi_employee, mo_employee, va_employee, tx_employee, ft_fairfax_employee
		from First_Admin where ID = #get_comp.intSales#
</CFQUERY>


<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "ST" >
<cfset comp_name = "Streamline Title">


<cfelseif get_comp.ID eq '12324'>
<cfset account = "09" >
<cfset prefix = "FT" >
<cfset comp_name = "First Title">


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

TO="1#read_assigned_abstractor.fax#@efaxsend.com,#read_ft_user.email#"
FROM="vendormgr@abstractsusa.com"
SERVER="127.0.0.1"
Subject="New Abstract report request from Abstracts, USA - Order #prefix#-#read_title.title_id#"
TIMEOUT="600"
>
Abstracts USA, LLC
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
   ORDER INSTRUCTIONS HAVE CHANGED, PLEASE READ BELOW:
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

ORDER - #prefix#-#read_title.title_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_user.FNAME#
VENDOR MANAGER NUMBER - #read_user.phone#
VENDOR MANAGER E-MAIL - #read_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif read_title.pstate eq "PA">

 Certified Tax Search from City/Borough REQUESTED

</cfif>

<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
 <cfif form.bring_to_date neq ''>#form.bring_to_date#

 </cfif>
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

  Product Ordered: #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
</cfif>


<cfif form.taxes_from_search eq "Yes">

 PLEASE COMPLETE TAXES FROM SEARCH

</cfif>


DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#

Property Information:

<cfif read_title.searchtype eq 'Purchase'>
Seller name: #read_title.sfirstname1# <cfif Len(read_title.sminame1)>#read_title.sminame1# </cfif>#read_title.slastname1#
Social Security Number: #read_title.sssn1#
</cfif>
Borrower name: #read_title.bfirstname1# <cfif Len(read_title.bminame1)>#read_title.bminame1# </cfif>#read_title.blastname1#
Social Security Number: #read_title.bssn1#

Property address: #read_title.paddress#

City - #read_title.pcity#
State - #read_title.pstate#
County - #read_title.pcounty#
Zip Code - #read_title.pzip#

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
               SPECIAL INSTRUCTIONS
 =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=


<cfif instructions neq ''>

Instructions: #instructions#

</cfif>


<cfif read_title.SearchType eq 'Purchase'>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE FULL CHAIN OF TITLE.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT
DEED FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif><cfelse>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT DEED
FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif></cfif>

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



PLEASE BE SURE TO INCLUDE COPIES OF ALL OPEN JUDGMENTS/LIENS,
MTG/DOT AND THE DEED.

PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS USA REPRESENTATIVE
LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

 INVOICES MUST INCLUDE:
 CASE NUMBER
 BORROWER NAME
 ADDRESS
 PRODUCT
 FEE


BILLING INFORMATION
=====================
PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO
vendormgr@abstractsusa.com
or fax 301-315-3161
phone 301-279-0303 x 386




email ID 8
</CFMAIL>
</cfif>
<!--- mark this email as having been sent, so it doesn't get sent again --->
<CFQUERY datasource="#request.dsn#" NAME="update_email">
			Update Doc_Abstract_Title
			Set search_C_email_sent = 1
			WHERE title_ID = #read_title_abstract.Title_ID#
		</CFQUERY>
</CFIF>

</CFIF>
<!--If null --->
<cfif #read_title.search_type# eq "">
<cfif #read_assigned_abstractor.pref_for_send# EQ "Email">
<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
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



<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_company_city">
		select mi_employee, mo_employee, mi_flushing_employee, va_employee, tx_employee, ft_fairfax_employee
		from First_Admin where ID = #get_comp.intSales#
</CFQUERY>


<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "ST" >
<cfset comp_name = "Streamline Title">

<cfelseif get_comp.ID eq '12324'>
<cfset account = "09" >
<cfset prefix = "FT" >
<cfset comp_name = "First Title">


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

TO="1#read_assigned_abstractor.fax#@efaxsend.com,#read_ft_user.email#"
FROM="vendormgr@abstractsusa.com"
SERVER="127.0.0.1"
Subject="New Abstract report request from Abstracts, USA - Order #prefix#-#read_title.title_id#"
TIMEOUT="600"
>
Abstracts USA, LLC
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
   ORDER INSTRUCTIONS HAVE CHANGED, PLEASE READ BELOW:
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

ORDER - #prefix#-#read_title.title_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_user.FNAME#
VENDOR MANAGER NUMBER - #read_user.phone#
VENDOR MANAGER E-MAIL - #read_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif read_title.pstate eq "PA">

 Certified Tax Search from City/Borough REQUESTED

</cfif>

<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
 <cfif form.bring_to_date neq ''>#form.bring_to_date#

 </cfif>
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

  Product Ordered: #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
</cfif>


<cfif form.taxes_from_search eq "Yes">

 PLEASE COMPLETE TAXES FROM SEARCH

</cfif>


DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#

Property Information:

<cfif read_title.searchtype eq 'Purchase'>
Seller name: #read_title.sfirstname1# <cfif Len(read_title.sminame1)>#read_title.sminame1# </cfif>#read_title.slastname1#
Social Security Number: #read_title.sssn1#
</cfif>
Borrower name: #read_title.bfirstname1# <cfif Len(read_title.bminame1)>#read_title.bminame1# </cfif>#read_title.blastname1#
Social Security Number: #read_title.bssn1#

Property address: #read_title.paddress#

City - #read_title.pcity#
State - #read_title.pstate#
County - #read_title.pcounty#
Zip Code - #read_title.pzip#

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
               SPECIAL INSTRUCTIONS
 =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=


<cfif instructions neq ''>

Instructions: #instructions#

</cfif>


<cfif read_title.SearchType eq 'Purchase'>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE FULL CHAIN OF TITLE.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT
DEED FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif><cfelse>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE
PERTINENT COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT DEED
FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif></cfif>

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



PLEASE BE SURE TO INCLUDE COPIES OF ALL OPEN JUDGMENTS/LIENS,
MTG/DOT AND THE DEED.

PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS USA REPRESENTATIVE
LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

 INVOICES MUST INCLUDE:
 CASE NUMBER
 BORROWER NAME
 ADDRESS
 PRODUCT
 FEE


BILLING INFORMATION
=====================
PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO
vendormgr@abstractsusa.com
or fax 301-315-3161
phone 301-279-0303 x 386




email ID 6
</CFMAIL>
</cfif>
</CFIF>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>

		<td width=790 align=center valign=top>


<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Email Sent</B></CENTER>
			</TD>
		</TR>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>
		<cfoutput>
		<input type="hidden" name="company_id" value="#url.company_id#">
		<input type="hidden" name="uid" value="#url.uid#">
		<input type="hidden" name="al" value="#url.al#"></cfoutput>
	<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 colspan=2 align=center valign=top bgcolor=f3f3f3>
				<font size=3 color=blue face=arial>
				<B>Email has been sent to the abstractor assigned</B>
			</td>
		</tr>
</table
></td>
</tr>
</table>
</td>
</tr>
</table>
</body>
</html>
