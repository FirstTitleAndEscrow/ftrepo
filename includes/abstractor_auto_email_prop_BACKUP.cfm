<cfparam name="form.title_update" default="">
<cfparam name="form.product_ordered" default="Current Owner Search with 24 month chain of title">
<CFPARAM NAME="form.instructions" DEFAULT="">

<CFQUERY datasource="#request.dsn#" NAME="get_shapiro">
			select child_ids from companies
			WHERE ID = 2368		
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
			select * from companies
			WHERE ID = #read_title.comp_id#		
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_company_city">	
		select mi_employee, mo_employee, mi_flushing_employee, va_employee, ft_fairfax_employee
		from First_Admin where ID = #get_comp.intSales#
</CFQUERY>

<cfif get_comp.streamline_client eq 'True'>
<cfset account = "02" >
<cfset prefix = "S-P" >
<cfset comp_name = "Streamline Title">
<cfelseif get_company_city.mi_employee eq 'True'>
<cfset account = "03" >
<cfset prefix = "MI-P" >
<cfset comp_name = "First Title">
<cfelseif get_comp.ID eq '12324'>
<cfset account = "09" >
<cfset prefix = "FT-P" >
<cfset comp_name = "First Title">
<cfelseif get_company_city.mo_employee eq 'True'>
<cfset account = "08" >
<cfset prefix = "MO-P" >
<cfset comp_name = "First Title">
<cfelseif get_company_city.mi_flushing_employee eq 'True'>
<cfset account = "07" >
<cfset prefix = "MF-P" >
<cfset comp_name = "First Title">
<cfelseif get_company_city.va_employee eq 'True'>
<cfset account = "04" >
<cfset prefix = "RI-P" >
<cfset comp_name = "First Title">
<cfelseif get_company_city.ft_fairfax_employee eq 'True'>
<cfset account = "06" >
<cfset prefix = "FX-P" >
<cfset comp_name = "First Title">
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
<cfset comp_name = "First Title">
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_abs">		
			select * from abstractors
			WHERE abstractor_ID = #Abstractor_ID_new#
</CFQUERY>
 
 
<cfif cgi.REMOTE_ADDR eq '98.233.53.115'>
<cfset to_email = "rick@jermain.com">
<cfelse>
<cfset to_email = read_abs.email>
</cfif>
<CFPARAM NAME="get_comp.special_abs_inst" default="">


<cfif get_comp.streamline_client eq 'True'>
	<cfset from_email="vendormgr@streamline-title.com">
	<cfset company="Streamline Title">
<cfelse>
	<cfset from_email = "vendormgr@abstractsusa.com">
	<cfset company = "Abstracts, USA">
</cfif>


<CFMAIL
				TO="#to_email#"
				FROM="#from_email#"
				 Subject="New Abstract report request from #company# - Order #prefix#-#read_title.prop_id#-#get_comp.ID#"
				TIMEOUT="600"

>


<cfif session.ft_user_id NEQ 462>
Abstracts USA, LLC
Account #account#
Central Processing Center
<cfelse>
Streamline Title
</cfif>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive
Rockville, MD 20850
Phone 301.279.0303
Fax 301.315.7171

<cfelse>
7361 Calhoun Place, Suite 200
Rockville, MD 20855
Phone 301.279.0303
Fax 301.315.7171

</cfif>


 
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= 
ORDER INSTRUCTIONS HAVE CHANGED, PLEASE READ BELOW:    
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= 


ORDER -   #prefix#-#read_title.prop_id#-#get_comp.ID# PLEASE REFERENCE ON YOUR INVOICE 
VENDOR MANAGER NAME - #read_user.FNAME#    
VENDOR MANAGER NUMBER - #read_user.phone# 
VENDOR MANAGER E-MAIL - #read_user.email#    
DUE DATE - #DateFormat(Now()+2, "m/d/yyyy")# 
DUE TIME - #TimeFormat(Now(), "HH:mm:ss")#    
DATE ORDERED - #DateFormat(Now(), "m/d/yyyy")# 
TIME ORDERED - #TimeFormat(Now(), "HH:mm:ss")#    

 
 
ORDER TYPE - #form.product_ordered#

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
SPECIAL INSTRUCTIONS:    
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= 

<cfif Len(form.instructions)>
#form.instructions#
</cfif>
		
<cfif read_title.Search_Type eq 'B'>
1. SEARCHER MUST PROVIDE A SEARCH BACK TO A WARRANTY DEED/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE FULL CHAIN OF TITLE.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE 
COMPLETE COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT 
DEED FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif><cfelseif read_title.Search_Type eq 'A'>
<cfif get_comp.id eq '6872'>1. SEARCHER MUST PROVIDE A FULL SEARCH THAT MUST 
GO BACK TO STATE MANDATED BUSINESS PRACTICES 30/40/50/60 YEAR SEARCH.
SEARCHER MUST PROVIDE COPIES OF ALL DEEDS, JUDGMENTS, TAX INFORMATION, 
AS WELL AS PERTINENT PAGES OF MORTGAGES/DEEDS OF TRUST 
FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.<cfelse>1. SEARCHER MUST PROVIDE A SEARCH BACK TwO WARRANTY DEEDs/QUIT CLAIM DEED.
SEARCHER MUST PROVIDE COPIES OF DEED, JUDGMENTS, TAX INFORMATION, AS WELL AS THE 
COMPLETE COPIES OF MORTGAGES/DEEDS OF TRUST INCLUDING CURRENT DEED
FORWARD UP TO THE EFFECTIVE DATE OF THE COURTHOUSE.</cfif>
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif><cfelseif read_title.Search_Type eq 'D'>
1. SEARCHER MUST PROVIDE COPIES OF LAST DEED OF RECORD AND AND FULL LEGAL DESCRIPTION.
<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
2. CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif>

</cfif>

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
ABOVE WORKSHEET YOU MUST PROVIDE DELAY INFORMATION TO YOUR #company# REPRESENTATIVE 
LISTED ABOVE WITHIN 24 HOURS OF DUE DATE


 
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= 
BILLING INFORMATION:    
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= 


PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO
<cfif session.ft_user_id NEQ 462>
vendormgr@abstractsusa.com
<cfelse>
vendormgr@streamline-title.com
</cfif>
or fax 301-315-3161
phone 301-279-0303 x 386





</CFMAIL>	