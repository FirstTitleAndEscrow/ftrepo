<!--- send out Loan Funded Emails --->

<cfquery name="read_comp" datasource="#request.dsn#">

select * from Property
where prop_id = #url.rec_id#
</cfquery>


<cfquery name="read_company" datasource="#request.dsn#">

select company, intsales from companies
where id = #read_comp.comp_id#
</cfquery>

<cfif #read_comp.comp_id# eq 154 or #read_comp.comp_id# eq 155 or #read_comp.comp_id# eq 156 or #read_comp.comp_id# eq 157 or #read_comp.comp_id# eq 158 or #read_comp.comp_id# eq 159 or #read_comp.comp_id# eq 160 or #read_comp.comp_id# eq 161 or #read_comp.comp_id# eq 162 or #read_comp.comp_id# eq 163 or #read_comp.comp_id# eq 164 or #read_comp.comp_id# eq 165 or #read_comp.comp_id# eq 166 or #read_comp.comp_id# eq 167 or #read_comp.comp_id# eq 168 or #read_comp.comp_id# eq 169 or #read_comp.comp_id# eq 170 or #read_comp.comp_id# eq 182 or #read_comp.comp_id# eq 181 or #read_comp.comp_id# eq 183 or #read_comp.comp_id# eq 184 or #read_comp.comp_id# eq 185 or #read_comp.comp_id# eq 186 or #read_comp.comp_id# eq 187 or #read_comp.comp_id# eq 188 or #read_comp.comp_id# eq 189 or #read_comp.comp_id# eq 192 or #read_comp.comp_id# eq 190 or #read_comp.comp_id# eq 193 or #read_comp.comp_id# eq 194 or #read_comp.comp_id# eq 195 or #read_comp.comp_id# eq 196 or #read_comp.comp_id# eq 197  or #read_comp.comp_id# eq 198  or #read_comp.comp_id# eq 199  or #read_comp.comp_id# eq 200  or #read_comp.comp_id# eq 201>

<CFMAIL 
TO="sharonlee@homeownersloan.com"
FROM="loandocs@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title Loan has been funded for order #url.rec_id# -- #read_company.company#"
TIMEOUT="600"
>

Dear Mr. Lee:

First Title Loan has been funded for order #url.rec_id#

Thank you!
First Title & Escrow, Inc.

</cfmail> 

<cfelseif #read_comp.comp_id# eq 211>
<CFMAIL 
TO="#read_comp.p_email#"
FROM="loandocs@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title Loan has been funded for order #url.rec_id# -- #read_company.company#"
TIMEOUT="600"
>

Dear #read_comp.pname#:

First Title Loan has been funded for order #url.rec_id#

Thank you!
First Title & Escrow, Inc.

</cfmail> 
<cfelseif #read_comp.comp_id# eq 324>
<CFMAIL 
TO="jbogan@3erm.com,ghecker@3erm.com"
FROM="loandocs@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title Loan has been funded for order #url.rec_id# -- #read_company.company#"
TIMEOUT="600"
>

Dear #read_comp.pname#:

First Title Loan has been funded for order #url.rec_id#

Thank you!
First Title & Escrow, Inc.

</cfmail>
<cfelseif #read_comp.comp_id# eq 115>
<CFMAIL 
TO="wthomas@mortgageinvestors.com"
FROM="loandocs@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title Loan has been funded for order #url.rec_id# -- #read_company.company#"
TIMEOUT="600"
>

Dear Mr. Thomas:

First Title Loan has been funded for order #url.rec_id#

Thank you!
First Title & Escrow, Inc.

</cfmail>
<cfelseif #read_comp.comp_id# eq 621>
<CFMAIL 
TO="wthomas@mortgageinvestors.com"
FROM="loandocs@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title Loan has been funded for order #url.rec_id# -- #read_company.company#"
TIMEOUT="600"
>

Dear Mr. Thomas:

First Title Loan has been funded for order #url.rec_id#

Thank you!
First Title & Escrow, Inc.

</cfmail>  



<cfelseif #read_comp.comp_id# eq 623>
<CFMAIL 
TO="#read_comp.p_email#; #read_comp.o_email#"
FROM="loandocs@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title Loan has been funded for order #url.rec_id# -- #read_company.company#"
TIMEOUT="600"
>

Dear Client:

First Title Loan has been funded for order #url.rec_id#

Thank you!
First Title & Escrow, Inc.

</cfmail>  
  
<cfelse>

<cfif read_company.intsales eq 342 or read_company.intsales eq 343> <!--- Lorn or Nancy --->
<cfquery name="get_sales" datasource="#request.dsn#">
    select * 
    from First_admin where ID = #read_company.IntSales#
</cfquery>


<CFMAIL
	    TO="#get_sales.email#"
        FROM="loandocs@firsttitleservices.com"
        SERVER="127.0.0.1"
        Subject="Loan has been closed - #read_comp.prop_id#"
        TIMEOUT="600"
        >

Dear #get_sales.fname#:
Loan has been closed for order #read_comp.prop_id#. 

All correspondence must go through First Title & Escrow, Inc.
</CFMAIL>
</cfif>
</cfif>