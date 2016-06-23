<cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput>

<br>
<br>


<cfabort>

    <CFQUERY datasource="#request.dsn#" NAME="get_titleid">
	    SELECT *
	    FROM TITLE
	    WHERE title_id in (30256,30257,30271,30275,30277,30282,30283,30291,30292,30293,30298,30299,30305,30306,30307,30309,30313,30314,30315,30317,30318,30319,30321,30325,30332,30333,30334,30335,30336,30337,30338,30339)

    </CFQUERY>		
		
		<cfoutput query="get_titleid">
		
		
			<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Closing_Order_Request(Title_ID, a_sent_by, a_filled_out_by)
				VALUES(#get_titleid.Title_ID#, 0, 0)		
			</CFQUERY>	
			
			<CFQUERY datasource="#request.dsn#">		
				INSERT INTO eventlist(Title_ID)
				VALUES(#get_titleid.Title_ID#)		
			</CFQUERY>	
		<!--- ===/ GENERATE AN ENTRY IN THE TAX CERT TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO tax_cert_title(title_id)
				VALUES(#get_titleid.title_id#)
				
			</CFQUERY>
		
				
			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Abstract_Title(title_id,search_type)
				VALUES(#get_titleid.title_id#,'#get_titleid.searchType#')				
			</CFQUERY>
		
		
			<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 1  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_1_Title(title_id, pa_dateandtime)
				VALUES(#get_titleid.title_id#, '#get_titleid.dateandtime#')
				
			</CFQUERY>


	<!--- ===/ GENERATE AN ENTRY IN THE PAY OFF LENDER 2  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Pay_Off_Lender_2_Title(title_id)
				VALUES(#get_titleid.title_id#)
				
			</CFQUERY>

	<!--- ===/ GENERATE AN ENTRY IN THE Doc_Amer_Title_Fla_Title  TABLE \=== --->

			<CFQUERY datasource="#request.dsn#" >
				INSERT INTO Doc_Closer_Title(title_id)
				VALUES(#get_titleid.title_id#)
				
			</CFQUERY>	
		
		
		
		
		
		<cfif #get_titleid.pstate# eq "AK" or #get_titleid.pstate# eq "OR" or #get_titleid.pstate# eq "WA" or #get_titleid.pstate# eq "ID" or #get_titleid.pstate# eq "WY" or #get_titleid.pstate# eq "OK" or #get_titleid.pstate# eq "SD" or #get_titleid.pstate# eq "NM" or #get_titleid.pstate# eq "TX">
     <CFQUERY datasource="#request.dsn#" >
					INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
					VALUES(#get_titleid.title_id#, 19)
				</CFQUERY>
				<CFELSEIF (#get_titleid.pstate# EQ "AL") OR (#get_titleid.pstate# EQ "AR") or (#get_titleid.pstate# EQ "AZ") or (#get_titleid.pstate# EQ "MT") or (#get_titleid.pstate# EQ "CO") or (#get_titleid.pstate# EQ "CT") or (#get_titleid.pstate# EQ "IL") or (#get_titleid.pstate# EQ "DE") or (#get_titleid.pstate# EQ "GA") or (#get_titleid.pstate# EQ "IA") or (#get_titleid.pstate# EQ "IN") or (#get_titleid.pstate# EQ "KS") or (#get_titleid.pstate# EQ "KY") or (#get_titleid.pstate# EQ "LA") or (#get_titleid.pstate# EQ "MA") or (#get_titleid.pstate# EQ "ME") or (#get_titleid.pstate# EQ "MN") or (#get_titleid.pstate# EQ "MO") or (#get_titleid.pstate# EQ "MS") or (#get_titleid.pstate# EQ "NC") or (#get_titleid.pstate# EQ "ND") or (#get_titleid.pstate# EQ "NH") or (#get_titleid.pstate# EQ "NY") or (#get_titleid.pstate# EQ "OH") or (#get_titleid.pstate# EQ "PA") or (#get_titleid.pstate# EQ "RI") or (#get_titleid.pstate# EQ "SC") or (#get_titleid.pstate# EQ "TN") or (#get_titleid.pstate# EQ "VT") or (#get_titleid.pstate# EQ "WI") or (#get_titleid.pstate# EQ "WV")  or (#get_titleid.pstate# EQ "MI") or (#get_titleid.pstate# EQ "NJ")> 
					<CFQUERY datasource="#request.dsn#" >
						INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
						VALUES(#get_titleid.title_id#, 15)
					</CFQUERY>
				<cfelseif (#get_titleid.pstate# EQ "CA")OR (#get_titleid.pstate# EQ "NV") OR (#get_titleid.pstate# EQ "DC") OR (#get_titleid.pstate# EQ "MD")  or (#get_titleid.pstate# EQ "VA")>
					<CFQUERY datasource="#request.dsn#" >
						INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
						VALUES(#get_titleid.title_id#, 16)
					</CFQUERY>
				<cfelseif (#get_titleid.pstate# EQ "UT")>
					<CFQUERY datasource="#request.dsn#" >
						INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
						VALUES(#get_titleid.title_id#, 17)
					</CFQUERY>
                    
                    <cfelseif (#get_titleid.pstate# EQ "OR")>
					<CFQUERY datasource="#request.dsn#" >
						INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
						VALUES(#get_titleid.title_id#, 18)
					</CFQUERY>
                    
				<CFELSE>
					<CFQUERY datasource="#request.dsn#" >
						INSERT INTO Doc_Title_Insurance_Title(title_id, insurance_co)
						VALUES(#get_titleid.title_id#, 14)
					</CFQUERY>
				</CFIF>
		
		
		
		
		
		
		
		
		
		</cfoutput>