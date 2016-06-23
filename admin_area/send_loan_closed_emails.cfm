<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT company, team_id
	FROM companies
	WHERE id = #get_order.comp_id#
</CFQUERY>

<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_comp.team_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>


            <CFSWITCH EXPRESSION="#get_order.comp_id#">
	            <CFCASE VALUE = 115>
		            <CFSET strEmailTo = "wthomas@mortgageinvestors.com">
		            <Cfset strDear = "#get_order.pname#">
                    <Cfset strSubject = "Your Loan Closed with First Title - MIC Order: #get_order.loan_number# - #get_order.bfirstname1# #get_order.blastname1#">
	            </CFCASE>
	            <CFCASE VALUE = 621>
		            <CFSET strEmailTo = "wthomas@mortgageinvestors.com" >
		            <Cfset strDear = "#get_order.pname#" >
                    <Cfset strSubject = "Your Loan Closed with First Title - MIC Order: #get_order.loan_number# - #get_order.bfirstname1# #get_order.blastname1#">
	            </CFCASE>
                <CFCASE VALUE = 559><!---Weichert--->
		            <CFSET strEmailTo = "#get_order.p_email#,#get_order.o_email#" >
		            <Cfset strDear = "#get_order.pname#" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
	            </CFCASE>
                <CFCASE VALUE = 154>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 155>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 156>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 157>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 158>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 159>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 160>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 161>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 162>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 163>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 164>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 165>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 166>
                	<CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 167>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 168>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 169>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 170>
                	<CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 181>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 182>
                	<CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 183>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 184>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 185>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 186>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 187>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 188>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 189>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 192>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 190>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                
                <CFCASE VALUE = 194>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                
                <CFCASE VALUE = 195>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                
                <CFCASE VALUE = 196>
                	<CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                
                <CFCASE VALUE = 197>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                
                <CFCASE VALUE = 198>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 199>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                
                <CFCASE VALUE = 200>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 201>
                	<CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
                <CFCASE VALUE = 320>
                    <CFSET strEmailTo = "sharonlee@homeownersloan.com,loandocs@firsttitleservices.com" >
                	<Cfset strDear = "Lee" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<!---  N 07/27/2005 for Mortgage Access group and  kklos@weichertfinancial.com --->
								<CFCASE VALUE = "859">
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="919" >
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="953" >
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="947" >
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="946" >
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="948" >
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="944">
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="949">
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="951">
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="945">
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="950">
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="943">
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="941">
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
								<CFCASE VALUE ="942">
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>	
								<CFCASE VALUE ="968">
                    <CFSET strEmailTo = "#get_order.p_email#,kklos@weichertfinancial.com" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
				<CFCASE VALUE ="623">
                    <CFSET strEmailTo = "#get_order.p_email#,#get_order.o_email#" >
                	<Cfset strDear = "Client" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFCASE>
																			
                <CFDEFAULTCASE>
                	<CFSET strEmailTo = "#get_order.p_email#" >
                	<Cfset strDear = "#get_order.pname#" >
                    <Cfset strSubject = "Your Loan Closed with First Title - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# ">
                </CFDEFAULTCASE>
            </CFSWITCH>

<cfif team_email eq 'team_1@firsttitleservices.com'>
<cfset from_email = 'team_1@firsttitleservices.com'>
<cfelse>
<cfset from_email = 'loandocs@firsttitleservices.com'>
</cfif>

<cfif NOT strEmailTo contains 'rosicki' AND Len(strEmailTo)>
<CFMAIL
	    TO="#strEmailTo#"
        FROM="#from_email#"
        SERVER="127.0.0.1"
        Subject="#strSubject#"
        TIMEOUT="600"
        >

Dear #strDear#:
Loan has been closed for order #get_order.title_id#. 

All correspondence must go through First Title & Escrow, Inc..
</CFMAIL>
</cfif>

<cfquery name="read_company" datasource="#request.dsn#">

select * from companies
where id = #get_order.comp_id#
</cfquery>

<cfquery name="get_sales_rep_info" datasource="#request.dsn#">
    select * 
    from first_admin
    where id = #read_company.intSales#
</cfquery>

<cfif read_company.intsales eq 342 or read_company.intsales eq 343 or get_sales_rep_info.closing_emails eq 'True'> <!--- Lorn or Nancy --->
<cfquery name="get_sales" datasource="#request.dsn#">
    select * 
    from First_admin where ID = #read_company.IntSales#
</cfquery>

<cfif team_email eq 'team_1@firsttitleservices.com'>
<cfset from_email = 'team_1@firsttitleservices.com'>
<cfelse>
<cfset from_email = 'loandocs@firsttitleservices.com'>
</cfif>

<CFMAIL
	    TO="#get_sales.email#"
        FROM="#from_email#"
        SERVER="127.0.0.1"
        Subject="#strSubject#"
        TIMEOUT="600"
        >

Dear #get_sales.fname#:
Loan has been closed for order #get_order.title_id#. 

All correspondence must go through First Title & Escrow, Inc.
</CFMAIL>
</cfif>

