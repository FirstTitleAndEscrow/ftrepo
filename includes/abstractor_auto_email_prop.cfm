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
		select mi_employee, mo_employee, mi_flushing_employee, va_employee, tx_employee, ft_fairfax_employee
		from First_Admin where ID = #get_comp.intSales#
</CFQUERY>

<cfif get_comp.ID eq  2368   or get_comp.master_co_id eq   2368   or ListContainsNoCase(get_shapiro.child_ids, get_comp.ID, ",") or get_comp.streamline_client eq 'True'>
<cfset account = "02" >
<cfset company_name = "Streamline Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset prefix = "S-P" >
<cfset company_email = "vendormgr@streamline-title.com" >
<cfelseif get_comp.ID eq '12324'>
<cfset account = "09" >
<cfset company_name = "First Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset prefix = "FT-P" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
<cfelseif get_company_city.mi_employee eq 'True'>
<cfset account = "03" >
<cfset company_name = "First Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset prefix = "MI-P" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
<cfelseif get_company_city.mo_employee eq 'True'>
<cfset account = "08" >
<cfset company_name = "First Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset prefix = "MO-P" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
<cfelseif get_company_city.mi_flushing_employee eq 'True'>
<cfset account = "07" >
<cfset company_name = "First Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset prefix = "MF-P" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
<cfelseif get_company_city.tx_employee eq 'True' or read_title.pstate eq 'TX'>
<cfset account = "05" >
<cfset company_name = "Title & Escrow of Texas, Inc." >
<cfset requesting_name = "Title & Escrow of Texas" >
<cfset prefix = "TX-P" >
<cfset company_email = "vendormgr@titleoftexas.com" >
<cfelseif get_company_city.va_employee eq 'True'>
<cfset account = "04" >
<cfset prefix = "RI-P" >
<cfset company_name = "First Title & Escrow">
<cfset requesting_name = "Abstracts, USA" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
<cfelseif get_company_city.ft_fairfax_employee eq 'True'>
<cfset account = "06" >
<cfset prefix = "FX-P" >
<cfset company_name = "First Title & Escrow">
<cfset requesting_name = "Abstracts, USA" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
<cfelse>
<cfset account = "01" >
<cfset prefix = "P" >
<cfset company_name = "First Title & Escrow" >
<cfset requesting_name = "Abstracts, USA" >
<cfset company_email = "vendormgr@firsttitleservices.com" >
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

<cfif account eq '05'>
<cfset to_email = to_email & ';' & 'nwood@titleoftexas.com;rick@jermain.com'>
</cfif>

<CFMAIL
				TO="#to_email#"
				FROM="#from_email#"
				 Subject="New Abstract report request from #requesting_name# - Order #prefix#-#read_title.prop_id#-#get_comp.ID#"
				TIMEOUT="600"

>


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
</cfif>
Borrower name: #read_title.bfirstname1# <cfif Len(read_title.bminame1)>#read_title.bminame1# </cfif>#read_title.blastname1#
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
SPECIAL INSTRUCTIONS:    
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= 

<cfif Len(form.instructions)>
#form.instructions#
</cfif>

<cfif get_comp.special_abs_inst neq "" and get_comp.special_abs_inst neq 'NULL'>
CLIENT SPECIFIC INSTRUCTIONS TO BE FOLLOWED: #get_comp.special_abs_inst#
</cfif>
		





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


 
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= 
BILLING INFORMATION:    
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= 


PLEASE SEND MONTHLY STATEMENT WITH OUR ORDER NUMBER TO

#company_email#
<cfif account eq '05'>
or fax 972.692.3209
phone 972.665.9969
<cfelse>
or fax 301-315-3161
phone 301-279-0303 x 386
</cfif>





</CFMAIL>	