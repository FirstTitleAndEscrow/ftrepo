	<cfparam name="Instructions" default="">
	<cfparam name="form.title_update" default="0">
	<cfparam name="form.product_ordered" default="">
    <cfif #date# eq "">
		<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_abstract_doc_view.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&a_trigger=1&company_id=0&a_flag=1">
	<cfelse>
		<CFIF #Instructions# neq "">
			<CFQUERY datasource="#request.dsn#">
				Update
				Doc_Abstract_Prop
				set Instructions = '#Instructions#'
				WHERE prop_ID = #rec_ID#
			</CFQUERY>
  	    </CFIF>

        <CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">
	        SELECT *
			FROM Doc_Abstract_Prop
			WHERE prop_ID = #rec_ID#
        </CFQUERY>

	    <CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor">
			SELECT *
			FROM Abstractors
			WHERE  abstractor_ID = #read_title_abstract.abstractor_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_ft_user">
			SELECT *
			FROM first_admin
			WHERE ID = #read_title_ABSTRACT.a_Assigned_by#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "SP" >
<cfelseif get_comp.ID eq 12324>
<cfset account = "09" >
<cfset prefix = "FTP" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
</cfif>

        <!---If you are wondering why this is so long it is because cfmail treats html and cold fusion as line spaces
        I did it this way to preserve the email page formatting. --->
        <CFIF #Instructions# neq "">
		<cfif read_title_abstract.abstractor_email_sent eq 0>
             <cfif #read_assigned_abstractor.pref_for_send# EQ "Email">
                <CFMAIL
				TO="#read_assigned_abstractor.email#,#read_ft_user.email#"
				FROM="vendormgr@abstractsusa.com"

				SERVER="127.0.0.1"
				Subject="New Abstract report request from Abstracts LLC USA - Order #prefix#-#read_title.prop_id#"
				TIMEOUT="600"
			    >

<!--- Abstracts USA, LLC
Account: #account#
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
Fax 301.315.7171<!---The fax Number to the left is what Tamara told me to use--->


ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
ORDER TYPE - #get_comp.special_abs_inst#
<CFELSE>
ORDER TYPE - Document Request
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

*********************Special Instructions*********************


#instructions#

COMPLETE TAX INFORMATION IS REQUIRED,TAX ID_______________, AMOUNT LAST

PAID $_____________, WHAT PERIOD IT COVERS FROM ______ TO ______, DATE NEXT

DUE _____________, IF PAID QUARTERLY, SEMI ANNUAL, ANNUAL, ANY DELINQUENT

TAXES IF SO $__________________ AND WHAT PERIOD IT COVERS.  PHONE NUMBER FOR

THE TAX OFFICE ______________________

LAND VALUE $ _____________AND  IMPROVEMENTS

$__________________ASSESSMENTS


PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS
USA REPRESENTATIVE LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

PLEASE FAX MONTHLY STATEMENTS TO (301) 315-3161 OR EMAIL TO vendormgr@abstractsusa.com





EMAIL_ID: 1			 --->
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

ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#





<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

 #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
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




email ID 26
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

<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "SP" >
<cfelseif get_comp.ID eq 12324>
<cfset account = "09" >
<cfset prefix = "FTP" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
</cfif>
                <CFMAIL
                    TO="1#read_assigned_abstractor.fax#@efaxsend.com,#read_ft_user.email#"
                    FROM="vendormgr@abstractsusa.com.com"
                    SERVER="127.0.0.1"
                    Subject="New Abstract report request from Abstracts LLC USA - Order #prefix#-#read_title.prop_id#"
                    TIMEOUT="600"
                    >
<!--- Abstracts USA, LLC
Account: #account#
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
Fax 301.315.7171<!---The fax Number to the left is what Tamara told me to use--->


ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
ORDER TYPE - #get_comp.special_abs_inst#
<CFELSE>
ORDER TYPE - Document Request
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

*********************Special Instructions*********************


#instructions#

COMPLETE TAX INFORMATION IS REQUIRED,TAX ID_______________, AMOUNT LAST

PAID $_____________, WHAT PERIOD IT COVERS FROM ______ TO ______, DATE NEXT

DUE _____________, IF PAID QUARTERLY, SEMI ANNUAL, ANNUAL, ANY DELINQUENT

TAXES IF SO $__________________ AND WHAT PERIOD IT COVERS.  PHONE NUMBER FOR

THE TAX OFFICE ______________________

LAND VALUE $ _____________AND  IMPROVEMENTS

$__________________ASSESSMENTS


PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS
USA REPRESENTATIVE LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

PLEASE FAX MONTHLY STATEMENTS TO (301) 315-3161 OR EMAIL TO vendormgr@abstractsusa.com





EMAIL_ID: 1			 --->
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

ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#





<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

 #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
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




email ID 25

 </CFMAIL>
            </cfif>
<CFQUERY datasource="#request.dsn#" NAME="update_email_sent">
	        Update Doc_Abstract_Prop
			Set Abstractor_email_sent = 1
			WHERE prop_ID = #rec_ID#
        </CFQUERY>
	    </cfif>

        <CFELSE>
        <cfif #read_title.search_type# eq "A"and #read_title.search_A_email_sent# eq 0>
            <cfif #read_assigned_abstractor.pref_for_send# EQ "Email">
<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "SP" >
<cfelseif get_comp.ID eq 12324>
<cfset account = "09" >
<cfset prefix = "FTP" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
</cfif>
                <CFMAIL
				    TO="#read_assigned_abstractor.email#,#read_ft_user.email#"
				    FROM="vendormgr@abstractsusa.com.com"
				    SERVER="127.0.0.1"
				    Subject="New Abstract report request from Abstracts LLC USA - Order #prefix#-#read_title.prop_id#"
				    TIMEOUT="600"
                    >

<!--- Abstracts USA, LLC
Account: #account#
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
Fax 301.315.7171<!---The fax Number to the left is what Tamara told me to use--->


ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
ORDER TYPE - #get_comp.special_abs_inst#
<CFELSE>
ORDER TYPE - Document Request
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

*********************Special Instructions*********************


#instructions#

COMPLETE TAX INFORMATION IS REQUIRED,TAX ID_______________, AMOUNT LAST

PAID $_____________, WHAT PERIOD IT COVERS FROM ______ TO ______, DATE NEXT

DUE _____________, IF PAID QUARTERLY, SEMI ANNUAL, ANNUAL, ANY DELINQUENT

TAXES IF SO $__________________ AND WHAT PERIOD IT COVERS.  PHONE NUMBER FOR

THE TAX OFFICE ______________________

LAND VALUE $ _____________AND  IMPROVEMENTS

$__________________ASSESSMENTS


PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS
USA REPRESENTATIVE LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

PLEASE FAX MONTHLY STATEMENTS TO (301) 315-3161 OR EMAIL TO vendormgr@abstractsusa.com





EMAIL_ID: 1			 --->
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

ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#





<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

 #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
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




email ID 24
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

<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "SP" >
<cfelseif get_comp.ID eq 12324>
<cfset account = "09" >
<cfset prefix = "FTP" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
</cfif>
            <CFMAIL
                TO="1#read_assigned_abstractor.fax#@efaxsend.com,#read_ft_user.email#"
                FROM="vendormgr@abstractsusa.com.com"
                SERVER="127.0.0.1"
                Subject="New Abstract report request from Abstracts LLC USA - Order #prefix#-#read_title.prop_id#"
                TIMEOUT="600"
                >
<!--- Abstracts USA, LLC
Account: #account#
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
Fax 301.315.7171<!---The fax Number to the left is what Tamara told me to use--->


ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
ORDER TYPE - #get_comp.special_abs_inst#
<CFELSE>
ORDER TYPE - Document Request
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

*********************Special Instructions*********************


#instructions#

COMPLETE TAX INFORMATION IS REQUIRED,TAX ID_______________, AMOUNT LAST

PAID $_____________, WHAT PERIOD IT COVERS FROM ______ TO ______, DATE NEXT

DUE _____________, IF PAID QUARTERLY, SEMI ANNUAL, ANNUAL, ANY DELINQUENT

TAXES IF SO $__________________ AND WHAT PERIOD IT COVERS.  PHONE NUMBER FOR

THE TAX OFFICE ______________________

LAND VALUE $ _____________AND  IMPROVEMENTS

$__________________ASSESSMENTS


PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS
USA REPRESENTATIVE LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

PLEASE FAX MONTHLY STATEMENTS TO (301) 315-3161 OR EMAIL TO vendormgr@abstractsusa.com





EMAIL_ID: 1			 --->
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

ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#





<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

 #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
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




email ID 23
</CFMAIL>
        </cfif>
<!--- set the email sent flag so this email does not get sent again --->
<CFQUERY datasource="#request.dsn#" NAME="update_email">
			Update Property
			Set search_A_email_sent = 1
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
    </CFIF>
    <cfif #read_title.search_type# eq "B" and #read_title.search_B_email_sent# eq 0>
        <cfif #read_assigned_abstractor.pref_for_send# EQ "Email">
<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "SP" >
<cfelseif get_comp.ID eq 12324>
<cfset account = "09" >
<cfset prefix = "FTP" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
</cfif>
            <CFMAIL
				TO="#read_assigned_abstractor.email#,#read_ft_user.email#"
				FROM="vendormgr@abstractsusa.com.com"
				SERVER="127.0.0.1"
				Subject="New Abstract report request from Abstracts LLC USA - Order #prefix#-#read_title.prop_id#"
				TIMEOUT="600"
			    >

<!--- Abstracts USA, LLC
Account: #account#
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
Fax 301.315.7171<!---The fax Number to the left is what Tamara told me to use--->


ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
ORDER TYPE - #get_comp.special_abs_inst#
<CFELSE>
ORDER TYPE - Document Request
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

*********************Special Instructions*********************


#instructions#

COMPLETE TAX INFORMATION IS REQUIRED,TAX ID_______________, AMOUNT LAST

PAID $_____________, WHAT PERIOD IT COVERS FROM ______ TO ______, DATE NEXT

DUE _____________, IF PAID QUARTERLY, SEMI ANNUAL, ANNUAL, ANY DELINQUENT

TAXES IF SO $__________________ AND WHAT PERIOD IT COVERS.  PHONE NUMBER FOR

THE TAX OFFICE ______________________

LAND VALUE $ _____________AND  IMPROVEMENTS

$__________________ASSESSMENTS


PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS
USA REPRESENTATIVE LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

PLEASE FAX MONTHLY STATEMENTS TO (301) 315-3161 OR EMAIL TO vendormgr@abstractsusa.com





EMAIL_ID: 1			 --->
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

ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#





<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

 #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
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




email ID 22
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

<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "SP" >
<cfelseif get_comp.ID eq 12324>
<cfset account = "09" >
<cfset prefix = "FTP" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
</cfif>
                <CFMAIL
                    TO="1#read_assigned_abstractor.fax#@efaxsend.com,#read_ft_user.email#"
                    FROM="vendormgr@abstractsusa.com.com"
                    SERVER="127.0.0.1"
                    Subject="New Abstract report request from Abstracts LLC USA - Order #prefix#-#read_title.prop_id#"
                    TIMEOUT="600"
                    >
<!--- Abstracts USA, LLC
Account: #account#
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
Fax 301.315.7171<!---The fax Number to the left is what Tamara told me to use--->


ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
ORDER TYPE - #get_comp.special_abs_inst#
<CFELSE>
ORDER TYPE - Document Request
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

*********************Special Instructions*********************


#instructions#

COMPLETE TAX INFORMATION IS REQUIRED,TAX ID_______________, AMOUNT LAST

PAID $_____________, WHAT PERIOD IT COVERS FROM ______ TO ______, DATE NEXT

DUE _____________, IF PAID QUARTERLY, SEMI ANNUAL, ANNUAL, ANY DELINQUENT

TAXES IF SO $__________________ AND WHAT PERIOD IT COVERS.  PHONE NUMBER FOR

THE TAX OFFICE ______________________

LAND VALUE $ _____________AND  IMPROVEMENTS

$__________________ASSESSMENTS


PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS
USA REPRESENTATIVE LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

PLEASE FAX MONTHLY STATEMENTS TO (301) 315-3161 OR EMAIL TO vendormgr@abstractsusa.com





EMAIL_ID: 1			 --->
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

ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#





<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

 #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
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




email ID 21
 </CFMAIL>
            </cfif>
<!--- set the email sent flag so this email does not get sent again --->
<CFQUERY datasource="#request.dsn#" NAME="update_email">
			Update Property
			Set search_B_email_sent = 1
			WHERE prop_ID = #rec_ID#
		</CFQUERY>

        </CFIF>
                <!----Harry 10/22/04 Legal & Vesting --->
        <cfif #read_title.search_type# eq "D" and #read_title.search_D_email_sent# eq 0>
            <cfif #read_assigned_abstractor.pref_for_send# EQ "Email">
<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "SP" >
<cfelseif get_comp.ID eq 12324>
<cfset account = "09" >
<cfset prefix = "FTP" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
</cfif>
                <CFMAIL
				TO="#read_assigned_abstractor.email#,#read_ft_user.email#"
				FROM="vendormgr@abstractsusa.com.com"
				SERVER="127.0.0.1"
				Subject="New Abstract report request from Abstracts LLC USA - Order #prefix#-#read_title.prop_id#"
				TIMEOUT="600"
			    >

<!--- Abstracts USA, LLC
Account: #account#
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
Fax 301.315.7171<!---The fax Number to the left is what Tamara told me to use--->


ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
ORDER TYPE - #get_comp.special_abs_inst#
<CFELSE>
ORDER TYPE - Document Request
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

*********************Special Instructions*********************


#instructions#

COMPLETE TAX INFORMATION IS REQUIRED,TAX ID_______________, AMOUNT LAST

PAID $_____________, WHAT PERIOD IT COVERS FROM ______ TO ______, DATE NEXT

DUE _____________, IF PAID QUARTERLY, SEMI ANNUAL, ANNUAL, ANY DELINQUENT

TAXES IF SO $__________________ AND WHAT PERIOD IT COVERS.  PHONE NUMBER FOR

THE TAX OFFICE ______________________

LAND VALUE $ _____________AND  IMPROVEMENTS

$__________________ASSESSMENTS


PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS
USA REPRESENTATIVE LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

PLEASE FAX MONTHLY STATEMENTS TO (301) 315-3161 OR EMAIL TO vendormgr@abstractsusa.com





EMAIL_ID: 1			 --->
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

ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#





<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

 #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
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




email ID 20
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

<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "SP" >
<cfelseif get_comp.ID eq 12324>
<cfset account = "09" >
<cfset prefix = "FTP" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
</cfif>
                <CFMAIL
                    TO="1#read_assigned_abstractor.fax#@efaxsend.com,#read_ft_user.email#"
                    FROM="vendormgr@abstractsusa.com.com"
                    SERVER="127.0.0.1"
                    Subject="New Abstract report request from Abstracts LLC USA - Order #prefix#-#read_title.prop_id#"
                    TIMEOUT="600"
                    >
<!--- Abstracts USA, LLC
Account: #account#
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
Fax 301.315.7171<!---The fax Number to the left is what Tamara told me to use--->


ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
ORDER TYPE - #get_comp.special_abs_inst#
<CFELSE>
ORDER TYPE - Document Request
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

*********************Special Instructions*********************


#instructions#

COMPLETE TAX INFORMATION IS REQUIRED,TAX ID_______________, AMOUNT LAST

PAID $_____________, WHAT PERIOD IT COVERS FROM ______ TO ______, DATE NEXT

DUE _____________, IF PAID QUARTERLY, SEMI ANNUAL, ANNUAL, ANY DELINQUENT

TAXES IF SO $__________________ AND WHAT PERIOD IT COVERS.  PHONE NUMBER FOR

THE TAX OFFICE ______________________

LAND VALUE $ _____________AND  IMPROVEMENTS

$__________________ASSESSMENTS


PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS
USA REPRESENTATIVE LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

PLEASE FAX MONTHLY STATEMENTS TO (301) 315-3161 OR EMAIL TO vendormgr@abstractsusa.com





EMAIL_ID: 1			 --->
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

ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#





<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

 #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
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




email ID 19
</CFMAIL>
            </cfif>
<!--- set the email sent flag so this email does not get sent again --->
<CFQUERY datasource="#request.dsn#" NAME="update_email">
			Update Property
			Set search_D_email_sent = 1
			WHERE prop_ID = #rec_ID#
		</CFQUERY>

        </CFIF>
        <!---End Of Legal & Vesting --->
        <!--If null --->
        <cfif #read_title.search_type# eq "" and #read_title.search_email_sent# eq 0>
            <cfif #read_assigned_abstractor.pref_for_send# EQ "Email">
<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#
		</CFQUERY>

<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "SP" >
<cfelseif get_comp.ID eq 12324>
<cfset account = "09" >
<cfset prefix = "FTP" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
</cfif>
                <CFMAIL
				    TO="#read_assigned_abstractor.email#,#read_ft_user.email#"
				    FROM="vendormgr@abstractsusa.com.com"
				    SERVER="127.0.0.1"
				    Subject="New Abstract report request from Abstracts LLC USA - Order #prefix#-#read_title.prop_id#"
				    TIMEOUT="600"
			        >

<!--- Abstracts USA, LLC
Account: #account#
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
Fax 301.315.7171<!---The fax Number to the left is what Tamara told me to use--->


ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
ORDER TYPE - #get_comp.special_abs_inst#
<CFELSE>
ORDER TYPE - Document Request
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

*********************Special Instructions*********************


#instructions#

COMPLETE TAX INFORMATION IS REQUIRED,TAX ID_______________, AMOUNT LAST

PAID $_____________, WHAT PERIOD IT COVERS FROM ______ TO ______, DATE NEXT

DUE _____________, IF PAID QUARTERLY, SEMI ANNUAL, ANNUAL, ANY DELINQUENT

TAXES IF SO $__________________ AND WHAT PERIOD IT COVERS.  PHONE NUMBER FOR

THE TAX OFFICE ______________________

LAND VALUE $ _____________AND  IMPROVEMENTS

$__________________ASSESSMENTS


PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS
USA REPRESENTATIVE LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

PLEASE FAX MONTHLY STATEMENTS TO (301) 315-3161 OR EMAIL TO vendormgr@abstractsusa.com





EMAIL_ID: 1			 --->
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

ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#





<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

 #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
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




email ID 18

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

<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",")>
<cfset account = "02" >
<cfset prefix = "SP" >
<cfelseif get_comp.ID eq 12324>
<cfset account = "09" >
<cfset prefix = "FTP" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
</cfif>
                <CFMAIL
                    TO="1#read_assigned_abstractor.fax#@efaxsend.com,#read_ft_user.email#"
                    FROM="vendormgr@abstractsusa.com.com"
                    SERVER="127.0.0.1"
                    Subject="New Abstract report request from Abstracts LLC USA - Order #prefix#-#read_title.prop_id#"
                    TIMEOUT="600"
                    >
<!--- Abstracts USA, LLC
Account: #account#
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
Fax 301.315.7171<!---The fax Number to the left is what Tamara told me to use--->


ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#

<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
ORDER TYPE - #get_comp.special_abs_inst#
<CFELSE>
ORDER TYPE - Document Request
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

*********************Special Instructions*********************


#instructions#

COMPLETE TAX INFORMATION IS REQUIRED,TAX ID_______________, AMOUNT LAST

PAID $_____________, WHAT PERIOD IT COVERS FROM ______ TO ______, DATE NEXT

DUE _____________, IF PAID QUARTERLY, SEMI ANNUAL, ANNUAL, ANY DELINQUENT

TAXES IF SO $__________________ AND WHAT PERIOD IT COVERS.  PHONE NUMBER FOR

THE TAX OFFICE ______________________

LAND VALUE $ _____________AND  IMPROVEMENTS

$__________________ASSESSMENTS


PLEASE NOTE, IF THE REPORT ORDERED WILL EXCEED THE TIMEFRAME SHOWN IN THE
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR ABSTRACTS
USA REPRESENTATIVE LISTED ABOVE WITHIN 24 HOURS OF DUE DATE

PLEASE FAX MONTHLY STATEMENTS TO (301) 315-3161 OR EMAIL TO vendormgr@abstractsusa.com





EMAIL_ID: 1			 --->
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

ORDER - #prefix#-#read_title.prop_id# PLEASE REFERENCE ON YOUR INVOICE
VENDOR MANAGER NAME - #read_ft_user.FNAME#
VENDOR MANAGER NUMBER - #read_ft_user.phone#
VENDOR MANAGER E-MAIL - #read_ft_user.email#
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")#
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")#
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#





<cfif form.title_update eq "Yes">

 PLEASE DO UPDATE FROM PRIOR SEARCH
<cfelse>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>

 #get_comp.special_abs_inst#
<cfelse>

 Product Ordered: #form.product_ordered#</cfif>
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




email ID 17

 </CFMAIL>
            </cfif>
<!--- set the email sent flag so this email does not get sent again --->
<CFQUERY datasource="#request.dsn#" NAME="update_email">
			Update Property
			Set search_email_sent = 1
			WHERE prop_ID = #rec_ID#
		</CFQUERY>

        </CFIF>
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
	<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">

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
    </cfif>